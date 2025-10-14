set names Utf8;

set Sql Dialect 3;

set Clientlib 'D:\RDBMS\Firebird\30X\fbclient.dll';

connect '127.0.0.1:B:\A4on.TV\DB\GOR.FDB'
user "SYSDBA" password 'masterkey';

--А скажи ещё такой момент, озадачили меня перевести всех на помесячную оплату.
--при чем у физиков предоплата, а у юриков постоплата, это же все тарифы надо пересоздавать и всех переводить.

--на счёт перехода на ежемесячную тарификацию, насколько это пробоемалично/трудозатратно, 
--создать дубли тарифов с нужным начисление и перекинуть абонентов с тарифа на тариф?

execute block
as

declare variable OLD_SRV          integer;
declare variable NEW_SRV          integer;
declare variable NEW_CALC         integer;
declare variable NEW_DATE         date;
declare variable NEW_SS           integer;
declare variable DAS              integer;
declare variable JUR              integer;
declare variable NEW_SRV_JUR      integer;
declare variable NEW_SRV_CUST     integer;

declare variable Subscr_Serv_Id   integer;
declare variable Customer_Id      integer;
declare variable State_Sgn        integer;
declare variable State_Date       date;
declare variable State_Srv        integer;
declare variable Notice           varchar(1000);
declare variable State_Change_By  varchar(50);
declare variable State_Change_On  timestamp;
declare variable Contract         varchar(20);
declare variable Contract_Date    date;
declare variable Vatg_Id          integer;

declare variable Subscr_Hist_Id   integer;
declare variable Date_From        date;
declare variable Date_To          date;
declare variable Act_Serv_Id      integer;
declare variable Disact_Serv_Id   integer;
declare variable Act_Worker_Id    integer;
declare variable Disact_Worker_Id integer;
declare variable Added_By         varchar(50);
declare variable Added_On         timestamp;
declare variable Closed_By        varchar(50);
declare variable Closed_On        timestamp;
declare variable Worker_On        varchar(255);
declare variable Worker_Off       varchar(255);
declare variable Req_On           integer;
declare variable Req_Off          integer;

begin
  delete from SERVICES_LINKS where Link_Type > 1 and Child is null;

  NEW_CALC = 0; -- раз в месяц пропорционально дням
  if (NOT exists(select Service_Id from Services where Service_Id = 8)) then
    insert into Services (Service_Id, Calc_Type, Srv_Type_Id, Shift_Months, Name, Shortname, Description, Dimension, Extra, External_Id, Inet_Srv, Ip_Begin, Ip_End, Ip_Begin_Bin, Ip_End_Bin, Business_Type, usage, Autooff, Expense_Type, Positive_Only, Priority, Only_One, Note, Tag, Tag_Str, Openly, Unbl_Meth)
    select
        8, Calc_Type, Srv_Type_Id, Shift_Months, 'Переключение', Shortname, Description, Dimension, Extra, External_Id, Inet_Srv, Ip_Begin, Ip_End, Ip_Begin_Bin, Ip_End_Bin, Business_Type, usage, Autooff, Expense_Type, Positive_Only, Priority, Only_One, Note, Tag, Tag_Str, Openly, Unbl_Meth
      from Services s
      where s.Service_Id = 6;
  DAS = 8; -- Переключение
  NEW_DATE = dateadd(month, 1, Month_First_Day(current_date));


  for select o.Service_Id from services o where o.Name in (
    '100 Мбит'
    ,'100 Мбит + IP TV'
    ,'100Мб+ ТВ'
    ,'100Мб+Кабельное ТВ'
    ,'15Мб+ТВ'
    ,'50Мб'
    ,'50Мб+ТВ'
    ,'Аренда роутера'
    ,'Аренда роутера'
    ,'Белый IP'
    ,'Годовой абонемент 2023'
    ,'Кабельное ТВ'
    ,'Кабельное ТВ в автоблокировке в МКД'
    ,'Кабельное ТВ льготный'
    ,'Льготный'
    ,'Льготный+Кабельное ТВ'
    ,'Юр.тариф')
  into :OLD_SRV
  do begin
    NEW_SRV = null;
    NEW_SRV_JUR = null;
    if (exists( select ss.Customer_Id from subscr_serv ss where ss.Serv_Id = :OLD_SRV
                     and exists(select c.Customer_Id from customer c where c.Customer_Id = ss.Customer_Id and coalesce(c.Juridical, 0) = 0))
      )
    then
        NEW_SRV = gen_id(gen_operations_uid, 1);

    if (exists( select ss.Customer_Id from subscr_serv ss where ss.Serv_Id = :OLD_SRV
                     and exists(select c.Customer_Id from customer c where c.Customer_Id = ss.Customer_Id and coalesce(c.Juridical, 0) = 1))
      )
    then
        NEW_SRV_JUR = gen_id(gen_operations_uid, 1);
    
    if (not NEW_SRV is null) then
      insert into Services (Service_Id, Calc_Type, Srv_Type_Id, Shift_Months, Name, Shortname, Description, Dimension, Extra, External_Id, Inet_Srv, Ip_Begin, Ip_End, Ip_Begin_Bin, Ip_End_Bin, Business_Type, usage, Autooff, Expense_Type, Positive_Only, Priority, Only_One, Note, Tag, Tag_Str, Openly, Unbl_Meth)
      select
          :NEW_SRV, :NEW_CALC, Srv_Type_Id, Shift_Months, Name, Shortname, Description, Dimension, Extra, External_Id, Inet_Srv, Ip_Begin, Ip_End, Ip_Begin_Bin, Ip_End_Bin, Business_Type, usage, Autooff, Expense_Type, Positive_Only, Priority, Only_One, Note, Tag, Tag_Str, Openly, Unbl_Meth
        from Services s
        where s.Service_Id = :OLD_SRV;
    
    if (not NEW_SRV_JUR is null) then
      insert into Services (Service_Id, Calc_Type, Srv_Type_Id, Shift_Months, Name, Shortname, Description, Dimension, Extra, External_Id, Inet_Srv, Ip_Begin, Ip_End, Ip_Begin_Bin, Ip_End_Bin, Business_Type, usage, Autooff, Expense_Type, Positive_Only, Priority, Only_One, Note, Tag, Tag_Str, Openly, Unbl_Meth)
      select
          :NEW_SRV_JUR, :NEW_CALC, Srv_Type_Id, -1, Name || ' (Юр.)', Shortname, Description, Dimension, Extra, External_Id, Inet_Srv, Ip_Begin, Ip_End, Ip_Begin_Bin, Ip_End_Bin, Business_Type, usage, Autooff, Expense_Type, Positive_Only, Priority, Only_One, Note, Tag, Tag_Str, Openly, Unbl_Meth
        from Services s
        where s.Service_Id = :OLD_SRV;
    
    update services s
      set s.Name = s.Name || ' (Архив)'
      where s.Service_Id = :OLD_SRV;
    
    if (not NEW_SRV is null) then
      insert into Tarif (Service_Id, Date_From, Date_To, Tarif_Sum, Tarif_Sum_Jur, Vat)
      select
          :NEW_SRV, :NEW_DATE, Date_To, Tarif_Sum, Tarif_Sum_Jur, Vat
        from Tarif
        where Service_Id = :OLD_SRV and :NEW_DATE between Date_From and Date_To;
    
    if (not NEW_SRV_JUR is null) then
      insert into Tarif (Service_Id, Date_From, Date_To, Tarif_Sum, Tarif_Sum_Jur, Vat)
      select
          :NEW_SRV_JUR, :NEW_DATE, Date_To, Tarif_Sum, Tarif_Sum_Jur, Vat
        from Tarif
        where Service_Id = :OLD_SRV and :NEW_DATE between Date_From and Date_To;
    
    if (not NEW_SRV is null) then
      insert into Services_Attributes (Service_Id, O_Id, Sa_Value, Notice)
      select
          :NEW_SRV, O_Id, Sa_Value, Notice
        from Services_Attributes
        where Service_Id = :OLD_SRV;
    
    if (not NEW_SRV_JUR is null) then
      insert into Services_Attributes (Service_Id, O_Id, Sa_Value, Notice)
      select
          :NEW_SRV_JUR, O_Id, Sa_Value, Notice
        from Services_Attributes
        where Service_Id = :OLD_SRV;
    
    if (not NEW_SRV is null) then
      insert into Services_Links (Link_Type, Parent, Child, Add_Srv, Switch_Time, Description)
      select
          Link_Type, :NEW_SRV, Child, Add_Srv, Switch_Time, Description
        from Services_Links
        where Parent = :OLD_SRV;
    
    if (not NEW_SRV_JUR is null) then
      insert into Services_Links (Link_Type, Parent, Child, Add_Srv, Switch_Time, Description)
      select
          Link_Type, :NEW_SRV_JUR, Child, Add_Srv, Switch_Time, Description
        from Services_Links
        where Parent = :OLD_SRV;

    if (not NEW_SRV is null) then
      insert into Services_Links (Link_Type, Parent, Child, Add_Srv, Switch_Time, Description)
      select
          Link_Type, Parent, :NEW_SRV, Add_Srv, Switch_Time, Description
        from Services_Links
        where Child = :OLD_SRV;
    
    if (not NEW_SRV_JUR is null) then
      insert into Services_Links (Link_Type, Parent, Child, Add_Srv, Switch_Time, Description)
      select
          Link_Type, Parent, :NEW_SRV_JUR, Add_Srv, Switch_Time, Description
        from Services_Links
        where Child = :OLD_SRV;
    
    if (not NEW_SRV is null) then
      insert into Channels_In_Servce (Srv_Id, Ch_Id, On_Off)
      select
          :NEW_SRV, Ch_Id, On_Off
        from Channels_In_Servce
        where Srv_Id = :OLD_SRV;
    
    if (not NEW_SRV is null) then
      insert into Services_Cmplx (Service_Id, Date_From, Name, Percent, Date_To, Notice)
      select
          :NEW_SRV, :NEW_DATE, Name, Percent, Date_To, Notice
        from Services_Cmplx
        where Service_Id = :OLD_SRV
              and :NEW_DATE between Date_From and Date_To;
    
    if (not NEW_SRV is null) then
      insert into Personal_Tarif (Service_Id, Date_From, Customer_Id, Date_To, Tarif_Sum, Notice, Add_Method)
      select
          :NEW_SRV, :NEW_DATE, Customer_Id, Date_To, Tarif_Sum, Notice, Add_Method
        from Personal_Tarif p
        where Service_Id = :OLD_SRV and :NEW_DATE between Date_From and Date_To
          and exists(select c.Customer_Id from customer c where c.Customer_Id = p.Customer_Id and coalesce(c.Juridical, 0) = 0);

    if (not NEW_SRV_JUR is null) then
      insert into Personal_Tarif (Service_Id, Date_From, Customer_Id, Date_To, Tarif_Sum, Notice, Add_Method)
      select
          :NEW_SRV_JUR, :NEW_DATE, Customer_Id, Date_To, Tarif_Sum, Notice, Add_Method
        from Personal_Tarif p
        where Service_Id = :OLD_SRV and :NEW_DATE between Date_From and Date_To
          and exists(select c.Customer_Id from customer c where c.Customer_Id = p.Customer_Id and coalesce(c.Juridical, 0) = 1);
    
    if (not NEW_SRV is null) then
      insert into Discount_Factor ( Serv_Id, Date_From, Customer_Id, Date_To, Factor_Value, Srv_Type, Notice, Promo_Id)
      select
         :NEW_SRV, :NEW_DATE, Customer_Id, Date_To, Factor_Value, Srv_Type, Notice, Promo_Id
        from Discount_Factor d
        where Serv_Id = :OLD_SRV and :NEW_DATE between Date_From and Date_To
          and exists(select c.Customer_Id from customer c where c.Customer_Id = d.Customer_Id and coalesce(c.Juridical, 0) = 0);
    
    if (not NEW_SRV_JUR is null) then
      insert into Discount_Factor ( Serv_Id, Date_From, Customer_Id, Date_To, Factor_Value, Srv_Type, Notice, Promo_Id)
      select
         :NEW_SRV_JUR, :NEW_DATE, Customer_Id, Date_To, Factor_Value, Srv_Type, Notice, Promo_Id
        from Discount_Factor d
        where Serv_Id = :OLD_SRV and :NEW_DATE between Date_From and Date_To
          and exists(select c.Customer_Id from customer c where c.Customer_Id = d.Customer_Id and coalesce(c.Juridical, 0) = 0);
    
    if (not NEW_SRV is null) then
      update WORKS
      set W_SRV = :NEW_SRV
      where W_SRV = :OLD_SRV;
    
    if (not NEW_SRV is null) then
      update REQUEST_TEMPLATES
      set RQ_SRV = :NEW_SRV
      where RQ_SRV = :OLD_SRV;
    
    if (not NEW_SRV is null) then
      insert into Decoder_Packets (Decoder_N, Service_Id, Notice)
      select
          Decoder_N, :NEW_SRV, Notice
        from Decoder_Packets
        where Service_Id = :OLD_SRV;
    
    if (not NEW_SRV is null) then
      insert into Tv_Lan_Packets (Service_Id, Notice)
      select
          :NEW_SRV
        , Notice
        from Tv_Lan_Packets
        where Service_Id = :OLD_SRV;
    
    if (not NEW_SRV is null) then
      insert into Queue_Switch_Srv (Srv_To, Customer_Id, Srv_From, Switch_Date, Srv_Act, Completed, Notice)
      select
          :NEW_SRV, Customer_Id, Srv_From, Switch_Date, Srv_Act, Completed, Notice
        from Queue_Switch_Srv
        where Srv_To = :OLD_SRV
              and Switch_Date >= :NEW_DATE;

    delete from SERVICES_LINKS where LINK_TYPE = 0 and PARENT is null and CHILD = :OLD_SRV;              

    for select
              ss.Subscr_Serv_Id, ss.Customer_Id, ss.State_Sgn, ss.State_Date, ss.State_Srv, ss.Notice, ss.State_Change_By, ss.State_Change_On, ss.Contract, ss.Contract_Date, ss.Vatg_Id, c.Juridical
            from Subscr_Serv ss
                 inner join customer c on (c.Customer_Id = ss.Customer_Id)
            where Serv_Id = :OLD_SRV
          into :Subscr_Serv_Id, :Customer_Id, :State_Sgn, :State_Date, :State_Srv, :Notice, :State_Change_By, :State_Change_On, :Contract, :Contract_Date, :Vatg_Id, :JUR
    do begin
      if (coalesce(JUR, 0) = 0) then
          NEW_SRV_CUST = NEW_SRV;
      else
          NEW_SRV_CUST = NEW_SRV_JUR;
    
      if ((State_Sgn = 1)
            or
            (State_Date >= :NEW_DATE)
            or
            (State_Srv = -3)) then begin
    
          NEW_SS = gen_id(gen_operations_uid, 1);
    
          if (State_Date < NEW_DATE) then
            State_Date = NEW_DATE;
    
        insert into Subscr_Serv (Subscr_Serv_Id, Customer_Id, Serv_Id, State_Sgn, State_Date, State_Srv, Notice, State_Change_By, State_Change_On, Contract, Contract_Date, Vatg_Id)
        values (:NEW_SS, :Customer_Id, :NEW_SRV_CUST, :State_Sgn, :State_Date, :State_Srv, :Notice, :State_Change_By, :State_Change_On, :Contract, :Contract_Date, :Vatg_Id);
    
        for select
                  Subscr_Hist_Id, Date_From, Date_To, Act_Serv_Id, Disact_Serv_Id, Act_Worker_Id, Disact_Worker_Id, Added_By, Added_On, Closed_By, Closed_On, Worker_On, Worker_Off, Req_On, Req_Off, Contract, Contract_Date
                from Subscr_Hist m
                where Subscr_Serv_Id = :Subscr_Serv_Id
                      and Customer_Id = :Customer_Id
                      and Serv_Id = :OLD_SRV
                      and (--
                      (Date_To >= :NEW_DATE)
                      --
                        or ((Disact_Serv_Id = -3)
                      and not exists(select
                                         h.Subscr_Hist_Id
                                       from Subscr_Hist h
                                       where h.Subscr_Serv_Id = m.Subscr_Serv_Id
                                             and h.Subscr_Hist_Id > m.Subscr_Hist_Id))
                      --
                      )
                order by Date_From, Date_To, SUBSCR_HIST_ID
              into :Subscr_Hist_Id, :Date_From, :Date_To, :Act_Serv_Id, :Disact_Serv_Id, :Act_Worker_Id, :Disact_Worker_Id, :Added_By, :Added_On, :Closed_By, :Closed_On, :Worker_On, :Worker_Off, :Req_On, :Req_Off, :Contract, :Contract_Date
        do begin
            insert into Subscr_Hist (Customer_Id, Serv_Id, Subscr_Serv_Id, Date_From, Date_To, Act_Serv_Id, Disact_Serv_Id, Act_Worker_Id, Disact_Worker_Id, Added_By, Added_On, Closed_By, Closed_On, Worker_On, Worker_Off, Req_On, Req_Off, Contract, Contract_Date)
            values (:Customer_Id, :NEW_SRV_CUST, :NEW_SS, :NEW_DATE, :Date_To, :Act_Serv_Id, :Disact_Serv_Id, :Act_Worker_Id, :Disact_Worker_Id, :Added_By, :Added_On, :Closed_By, :Closed_On, :Worker_On, :Worker_Off, :Req_On, :Req_Off, :Contract, :Contract_Date);
    
          if (Disact_Serv_Id = -3) then begin
              update Subscr_Hist h
              set h.Disact_Serv_Id = :DAS
              where h.Subscr_Hist_Id = :Subscr_Hist_Id;
    
              update Subscr_Serv ss
              set ss.State_Sgn = 0,
                  ss.State_Srv = :DAS
              where ss.Subscr_Serv_Id = :Subscr_Serv_Id;
          end
          else begin
              update Subscr_Hist h
              set h.Date_To = dateadd(day, -1, :NEW_DATE),
                  h.Disact_Serv_Id = :DAS
              where h.Subscr_Hist_Id = :Subscr_Hist_Id;
    
              update Subscr_Serv ss
              set ss.State_Sgn = 0,
                  ss.State_Date = :NEW_DATE,
                  ss.State_Srv = :DAS
              where ss.Subscr_Serv_Id = :Subscr_Serv_Id;
          end
        end
      end
    end
  end
end;
commit;
