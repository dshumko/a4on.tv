-- сохраним балансы

CREATE TABLE CO ( CUSTOMER_ID UID NOT NULL, NEW_SUM  D_N15_2 DEFAULT 0 NOT NULL, OLD_SUM  D_N15_2 DEFAULT 0 NOT NULL );

insert into CO (Customer_Id, NEW_Sum, OLD_SUM)
select C.CUSTOMER_ID, C.DEBT_SUM, O.DEBT_SUM
  from CUSTOMER C inner join CUSTOMER_OLD O on (C.CUSTOMER_ID = O.CUSTOMER_ID)
  where abs(C.DEBT_SUM - O.DEBT_SUM) > 0
  order by abs(C.DEBT_SUM - O.DEBT_SUM) desc;
commit;

----  подготовим скрипт выравнивания

execute block
returns (SQ VARCHAR(1000))
as
declare variable DIF_SRV     UID;
declare variable CUSTOMER_ID UID;
declare variable OLD_SUM     D_N15_2;
declare variable NEW_SUM     D_N15_2;
declare variable DIF_SUM     D_N15_2;
declare variable SRVDATE     D_DATE;
begin
/*
  insert into SERVICES (SRV_TYPE_ID, SHIFT_MONTHS, NAME, SHORTNAME, DESCRIPTION, DIMENSION, BUSINESS_TYPE)
  values (2, 0, 'Корректировка обновления', 'КО', 'Корректировка баланса после обновления ПО', 'руб', 0)
  returning SERVICE_ID
  into :DIF_SRV;
*/
  DIF_SRV = 3404379; -- Корректировка баланса

  for select
          C.CUSTOMER_ID, C.DEBT_SUM, O.DEBT_SUM, c.Contract_Date
        from CUSTOMER C
              inner join CUSTOMER_OLD O on (C.CUSTOMER_ID = O.CUSTOMER_ID)
          where abs(C.DEBT_SUM - O.DEBT_SUM) > 0
          order by abs(C.DEBT_SUM - O.DEBT_SUM) desc
      into :CUSTOMER_ID, :NEW_SUM, :OLD_SUM, :SRVDATE
  do begin
    DIF_SUM = OLD_SUM - NEW_SUM;
    -- SQ = 'execute procedure Full_Recalc_Customer('||Customer_Id||');';
    SQ = 'insert into SINGLE_SERV (CUSTOMER_ID, SERVICE_ID, SERV_DATE, UNITS, NOTICE) values ('||:CUSTOMER_ID||', '||:DIF_SRV||', '''||:SRVDATE||''', '||:DIF_SUM||', ''корр.'');';
    SQ = SQ || 'insert into MONTHLY_FEE (MONTH_ID, CUSTOMER_ID, SERVICE_ID, UNITS, FEE) values ('''||:SRVDATE||''', '||:CUSTOMER_ID||', '||:DIF_SRV||', 1, '||:DIF_SUM||');';
    SQ = SQ || 'commit;';
    suspend;
  end
end

-- помесячно корректировка
execute block
returns (SQ VARCHAR(1000))
as
declare variable DIF_SRV     UID;
declare variable CUSTOMER_ID UID;
declare variable OLD_SUM     D_N15_2;
declare variable NEW_SUM     D_N15_2;
declare variable DIF_SUM     D_N15_2;
declare variable SRVDATE     D_DATE;
begin
/*
  insert into SERVICES (SRV_TYPE_ID, SHIFT_MONTHS, NAME, SHORTNAME, DESCRIPTION, DIMENSION, BUSINESS_TYPE)
  values (2, 0, 'Корректировка обновления', 'КО', 'Корректировка баланса после обновления ПО', 'руб', 0)
  returning SERVICE_ID
  into :DIF_SRV;
*/
  DIF_SRV = 2; -- Корректировка баланса

  for select
  c.Customer_Id
  , f.NEW_FEE
  , coalesce(o.OLD_FEE, 0)
  , f.Month_Id
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
                         group by 1, 2) o on (o.Customer_Id = f.Customer_Id and o.Month_Id = f.Month_Id)
  where f.NEW_FEE is distinct from o.OLD_FEE
    and (f.NEW_FEE - coalesce(o.OLD_FEE, 0)) <> 0
  order by c.Account_No, f.Month_Id 
      into :CUSTOMER_ID, :NEW_SUM, :OLD_SUM, :SRVDATE
  do begin
    DIF_SUM = OLD_SUM - NEW_SUM;
    -- SQ = 'execute procedure Full_Recalc_Customer('||Customer_Id||');';
    SQ = 'insert into SINGLE_SERV (CUSTOMER_ID, SERVICE_ID, SERV_DATE, UNITS, NOTICE) values ('||:CUSTOMER_ID||', '||:DIF_SRV||', '''||:SRVDATE||''', '||:DIF_SUM||', ''корр.'');';
    SQ = SQ || 'insert into MONTHLY_FEE (MONTH_ID, CUSTOMER_ID, SERVICE_ID, UNITS, FEE) values ('''||:SRVDATE||''', '||:CUSTOMER_ID||', '||:DIF_SRV||', 1, '||:DIF_SUM||');';
    SQ = SQ || 'commit;';
    suspend;
  end
end



