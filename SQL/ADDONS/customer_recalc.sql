CREATE TABLE CUSTOMER_OLD (CUSTOMER_ID UID NOT NULL, DEBT_SUM D_N15_2 DEFAULT 0 NOT NULL);
insert into CUSTOMER_OLD (Customer_Id, Debt_Sum) select Customer_Id, Debt_Sum from Customer;
commit;
CREATE INDEX CUSTOMER_OLD_ID ON CUSTOMER_OLD (CUSTOMER_ID);


CREATE TABLE MONTHLY_OLD (MONTH_ID D_DATE, CUSTOMER_ID UID, SERVICE_ID UID, UNITS D_N15_2, FEE D_N15_2);
insert into Monthly_Old (Month_Id, Customer_Id, Service_Id, Units, Fee) select Month_Id, Customer_Id, Service_Id, Units, Fee from Monthly_Fee;
commit;
CREATE INDEX MONTHLY_FEE_OLD_IDX ON MONTHLY_OLD (CUSTOMER_ID, MONTH_ID, SERVICE_ID);

UPDATE SETTINGS SET VAR_VALUE = '0' WHERE (VAR_NAME = 'STRICT_MODE');commit;


/*
<?php
for($y=2000;$y<2024; $y++) {
    for($m=1;$m<13; $m++) {
        echo "execute procedure Close_Month_Proc('$y-$m-1', null); commit;".PHP_EOL;
    }
}
*/

select 'execute procedure Full_Recalc_Customer('||c.Customer_Id||'); commit;' from customer c order by c.Customer_Id

-- по абонентам
select
    c.Customer_Id
  , c.Account_No
  , c.Debt_Sum
  , o.Debt_Sum old_debt
  , (c.Debt_Sum - o.Debt_Sum) debt_diff
  from customer c
       inner join customer_old o on (c.Customer_Id = o.Customer_Id)
  where c.Debt_Sum is distinct from o.Debt_Sum   


-- помесячно
execute block
returns (
    ACCOUNT_NO  varchar(60),
    MONTH_ID    date,
    CUSTOMER_ID integer,
    NEW_FEE     numeric(18,2),
    OLD_FEE     numeric(18,2),
    DIFF        numeric(18,2),
    ABS_DIFF    numeric(18,2),
    SRV         integer,
    SRV_NAME    varchar(255),
    NEW_SRV     numeric(18,2),
    OLD_SRV     numeric(18,2))
as
declare variable DT  date;
declare variable tNS numeric(18,2);
declare variable tOS numeric(18,2);
begin
  for select
          c.Account_No
        , c.Customer_Id
        from customer c
             inner join customer_old o on (c.Customer_Id = o.Customer_Id)
        where c.Debt_Sum is distinct from o.Debt_Sum
              -- and c.Account_No = '7525'
        order by c.Account_No
      into :ACCOUNT_NO, :CUSTOMER_ID
  do begin
    select
        min(Month_Id)
      from Monthly_Fee f
      where f.Customer_Id = :Customer_Id
    into :MONTH_ID;
    MONTH_ID = coalesce(Month_First_Day(MONTH_ID), Month_First_Day(current_date));

    select
        min(Month_Id)
      from Monthly_OLD f
      where f.Customer_Id = :Customer_Id
    into :DT;
    DT = coalesce(Month_First_Day(DT), Month_First_Day(current_date));

    if (DT < MONTH_ID) then
      MONTH_ID = DT;

    DT = MONTH_ID;
    while (DT <= Month_First_Day(current_date)) do begin
      MONTH_ID = DT;
      select
          sum(f.Fee)
        from Monthly_Fee f
        where f.Customer_Id = :Customer_Id
              and f.Month_Id >= :DT
              and f.Month_Id <= Month_Last_Day(:DT)
      into :NEW_FEE;

      select
          sum(f.Fee)
        from Monthly_OLD f
        where f.Customer_Id = :Customer_Id
              and f.Month_Id >= :DT
              and f.Month_Id <= Month_Last_Day(:DT)
      into :OLD_FEE;

      NEW_FEE = coalesce(NEW_FEE, 0);
      OLD_FEE = coalesce(OLD_FEE, 0);

      DIFF = NEW_FEE - OLD_FEE;
      ABS_DIFF = abs(DIFF);

      if (DIFF <> 0) then begin
        for select
                f.Service_Id
              , s.Name
              , sum(f.Fee)
              from Monthly_Fee f
                   inner join services s on (f.Service_Id = s.Service_Id)
              where f.Customer_Id = :Customer_Id
                    and f.Month_Id >= :DT
                    and f.Month_Id <= Month_Last_Day(:DT)
              group by 1, 2
            into :SRV, :SRV_NAME, :NEW_SRV
        do begin
          select
              sum(f.Fee)
            from Monthly_OLD f
            where f.Customer_Id = :Customer_Id
                  and f.Service_Id = :SRV
                  and f.Month_Id >= :DT
                  and f.Month_Id <= Month_Last_Day(:DT)
          into :OLD_SRV;
          NEW_SRV = coalesce(NEW_SRV, 0);
          OLD_SRV = coalesce(OLD_SRV, 0);
          if (NEW_SRV <> OLD_SRV) then
            suspend;
        end
        for select
                f.Service_Id
              , s.Name
              , sum(f.Fee)
              from Monthly_OLD f
                   inner join services s on (f.Service_Id = s.Service_Id)
              where f.Customer_Id = :Customer_Id
                    and f.Month_Id >= :DT
                    and f.Month_Id <= Month_Last_Day(:DT)
                    and not exists(select
                                       n.Fee
                                     from Monthly_Fee n
                                     where n.Customer_Id = f.Customer_Id
                                           and n.Service_Id = f.Service_Id
                                           and n.Month_Id >= :DT
                                           and n.Month_Id <= Month_Last_Day(:DT))
              group by 1, 2
            into :SRV, :SRV_NAME, :OLD_SRV
        do begin
          NEW_SRV = 0;
          OLD_SRV = coalesce(OLD_SRV, 0);
          if (NEW_SRV <> OLD_SRV) then
            suspend;
        end
      end
      DT = dateadd(month, 1, DT);
    end
  end
end


-- попытка выровнять начисления смещением даты подключения
ALTER TRIGGER SUBSCR_HIST_BU INACTIVE;
execute block
-- returns (sql varchar(255))
as
declare variable ACCOUNT_NO  varchar(60);
declare variable MONTH_ID    date;
declare variable CUSTOMER_ID integer;
declare variable NEW_FEE     numeric(18,2);
declare variable OLD_FEE     numeric(18,2);
declare variable MT          numeric(18,4);
declare variable LD          date;
declare variable ID integer;
declare variable DT     numeric(18,2);
declare variable DD     numeric(18,2);
begin
  for select
          c.Account_No
        , f.Month_Id
        , c.Customer_Id
        , f.NEW_FEE
        , o.OLD_FEE
        from (select
                  f.Customer_Id
                , f.Month_Id
                , sum(f.Fee) NEW_FEE
                from Monthly_Fee f
                group by 1, 2) f
             inner join customer c on (c.Customer_Id = f.Customer_Id)
             left outer join(select
                                 f.Customer_Id
                               , f.Month_Id
                               , sum(f.Fee) OLD_FEE
                               from Monthly_OLD f
                               group by 1, 2) o on (o.Customer_Id = f.Customer_Id and
                   o.Month_Id = f.Month_Id)
        where f.NEW_FEE is distinct from o.OLD_FEE
              and (f.NEW_FEE - coalesce(o.OLD_FEE, 0)) <> 0
              -- and c.Account_No = '55' отладка
        order by c.Account_No, f.Month_Id
      into :ACCOUNT_NO, :MONTH_ID, :CUSTOMER_ID, :NEW_FEE, :OLD_FEE
  do begin
    NEW_FEE = coalesce(NEW_FEE, 0);
    OLD_FEE = coalesce(OLD_FEE, 0);
    LD = Month_Last_Day(MONTH_ID);
    select M_Tarif from Get_Tarif_Sum_Customer_Srv(:Customer_Id, null, :Month_Id) into :MT;
    DD = round((OLD_FEE - NEW_FEE),2);
    DT = round((MT/extract(DAY from LD)),2);
    if ( abs(DD - DT) <= 0.1) then begin
      -- если тариф отличается на день, то сместим дату отключения
      id = null;
      select first 1
        h.Subscr_Hist_Id
      from Subscr_Hist h
      where h.Customer_Id = :CUSTOMER_ID
        and h.Date_To between :MONTH_ID and :LD
      into :ID;
      if (not ID is null) then begin
        --sql = 'update Subscr_Hist set Date_To = dateadd(Day, 1, Date_To) where Subscr_Hist_Id = '||id||';';
        --suspend;
        update Subscr_Hist set Date_To = dateadd(Day, 1, Date_To) where Subscr_Hist_Id = :id;
      end
    end
  end
end;
commit;
ALTER TRIGGER SUBSCR_HIST_BU ACTIVE;