CREATE TABLE ArchDebt ( CUSTOMER_ID UID NOT NULL, DEBT_SUM  D_N15_2 DEFAULT 0 NOT NULL );
insert into ArchDebt (Customer_Id, Debt_Sum) select Customer_Id, Debt_Sum from Customer;
commit;

ALTER TRIGGER PAYMENT_AD0 INACTIVE;
ALTER TRIGGER PAYMENT_AI_0 INACTIVE;
ALTER TRIGGER MONTHLY_FEE_AI_0 INACTIVE;
ALTER TRIGGER MONTHLY_FEE_AD_0 INACTIVE;
ALTER TRIGGER SINGLE_SERV_BD0 INACTIVE;
ALTER TRIGGER OTHER_FEE_STRICTCHECK INACTIVE;
ALTER TRIGGER OTHER_FEE_AD INACTIVE;

execute block
as
declare variable fee_Sum       numeric(15,2);
declare variable pay_Sum       numeric(15,2);
declare variable vCustomer_id  integer;
declare variable vDate         date;
declare variable pay_doc_id    integer;
declare variable arch_srv_id   integer;
declare variable Tarif_Id      integer;
declare variable Service_Id    integer;
declare variable Date_From     date;
declare variable Date_To       date;
declare variable Tarif_Sum     numeric(15,2);
declare variable m_Tarif       integer;
declare variable Shift_Months  integer;
begin
  vDate = cast('2024-01-01' as date);

  -- Удалим тарифы до даты архивации
  for select
          Tarif_Id, t.Service_Id, Date_From, Date_To, coalesce(Tarif_Sum, 0), coalesce(s.Shift_Months, 0)
        from Tarif t
             inner join Services s on (t.Service_Id = s.Service_Id)
      into :Tarif_Id, :Service_Id, :Date_From, :Date_To, :Tarif_Sum, :Shift_Months
  do begin
    if (Date_From < :vDate) then begin
      if (Date_To >= :vDate) then
        update Tarif
        set Date_From = :vDate
        where Tarif_Id = :Tarif_Id;
      else
        delete from Tarif where Tarif_Id = :Tarif_Id;
    end
  end

  -- Удалим персональные тарифы до даты архивации
  for select
          Tarif_Id, t.Service_Id, Date_From, Date_To, coalesce(Tarif_Sum, 0), coalesce(s.Shift_Months, 0)
        from Personal_Tarif t
             inner join Services s on (t.Service_Id = s.Service_Id)
      into :Tarif_Id, :Service_Id, :Date_From, :Date_To, :Tarif_Sum, :Shift_Months
  do begin
    if (Date_From < :vDate) then begin
      if (Date_To >= :vDate) then
        update Personal_Tarif
        set Date_From = :vDate
        where Tarif_Id = :Tarif_Id;
      else
        delete from Personal_Tarif where Tarif_Id = :Tarif_Id;
    end
  end

  -- Создадим услугу архивации
  select first 1
      s.Service_Id
    from services s
    where s.Srv_Type_Id = 2
          and upper(s.Name) like 'Архивация'
  into :arch_srv_id;
  if (arch_srv_id is null) then begin
    insert into SERVICES (SRV_TYPE_ID, SHIFT_MONTHS, NAME, SHORTNAME, DESCRIPTION, DIMENSION) 
    values (2, 0, 'Архивация', null, 'Архивация начислений', 'руб.')
    returning SERVICE_ID
    into :arch_srv_id;
  end

  insert into Pay_Doc (Paysource_Id, Pay_Doc_No, Pay_Doc_Date, Pay_Doc_Sum, Notice)
  select first 1 p.Paysource_Id, 'Архивация', :vDate, 0, 'Архивация платежей до даты ' || :vDate from Paysource p 
  returning Pay_Doc_Id
  into :pay_doc_id;

  for select c.Customer_Id from customer c 
      into :vCustomer_id
  do begin
    pay_Sum = 0;
    fee_Sum = 0;
    select sum(f.Fee) from Monthly_Fee f where f.Customer_Id = :vCustomer_id and f.Month_Id < :vDate
    into :fee_Sum;

    select sum(f. Fee) from OTHER_FEE f where f.Customer_Id = :vCustomer_id and f.Fee_Date < :vDate
    into :pay_Sum;
    fee_Sum = coalesce(fee_Sum, 0) + coalesce(pay_Sum, 0);

    delete from Monthly_Fee f where f.Customer_Id = :vCustomer_id and f.Month_Id < :vDate;
    delete from OTHER_FEE f where f.Customer_Id = :vCustomer_id and f.Fee_Date < :vDate;

    delete from Single_Serv f where f.Customer_Id = :vCustomer_id and f.Serv_Date < :vDate
          and exists(select s.Service_Id from services s where s.Srv_Type_Id = 2 and s.Service_Id = f.Service_Id);
    delete from Monthly_Fee f where f.Customer_Id = :vCustomer_id and f.Month_Id < :vDate;

    pay_Sum = 0;
    select sum(p.Pay_Sum) from payment p where p.Customer_Id = :vCustomer_id and p.Pay_Date < :vDate
    into :pay_Sum;
    pay_Sum = coalesce(pay_Sum, 0);
    delete from payment p where p.Customer_Id = :vCustomer_id and p.Pay_Date < :vDate;
    
    if (coalesce(pay_Sum, 0) <> 0) then begin
      insert into Payment (Pay_Doc_Id, Customer_Id, Pay_Date, Pay_Sum, Notice) 
      values (:pay_doc_id, :vCustomer_id, :vDate, :Pay_Sum, 'Архивация платежей до даты ' || :vDate);
    end
    
    if (fee_Sum <> 0) then begin
      insert into SINGLE_SERV (CUSTOMER_ID, SERVICE_ID, SERV_DATE, UNITS, NOTICE) 
      values (:vCustomer_id, :arch_srv_id, :vDate, :fee_Sum, 'Архивация начислений до даты ' || :vDate);
      
      insert into MONTHLY_FEE (MONTH_ID, CUSTOMER_ID, SERVICE_ID, UNITS, FEE) 
      values (:vDate, :vCustomer_id, :arch_srv_id, 1, :fee_Sum);
    end
  end
  
  delete from Pay_Doc d 
   where Pay_Doc_Date < :vDate
     and (not ((exists(select p.pay_doc_id from payment p where p.pay_doc_id = d.pay_doc_id ))
               or (exists(select e.pay_doc_id from Pay_Errors e where e.Pay_Doc_Id = d.pay_doc_id )))) ;
  
end;
commit;

ALTER TRIGGER PAYMENT_AD0 ACTIVE;
ALTER TRIGGER PAYMENT_AI_0 ACTIVE;
ALTER TRIGGER MONTHLY_FEE_AI_0 ACTIVE;
ALTER TRIGGER MONTHLY_FEE_AD_0 ACTIVE;
ALTER TRIGGER SINGLE_SERV_BD0 ACTIVE;
ALTER TRIGGER OTHER_FEE_STRICTCHECK ACTIVE;
ALTER TRIGGER OTHER_FEE_AD ACTIVE;

-- рекалк


/*

select 'execute procedure Full_Recalc_Customer('||Customer_Id||');commit;' from customer c

-- проверка
select
c.Customer_Id, c.Account_No, c.Debt_Sum, co.Debt_Sum
from customer c inner join ArchDebt co on (c.Customer_Id = co.Customer_Id)
where c.Debt_Sum <> co.Debt_Sum
*/