CREATE TABLE CUSTOMER_OLD (CUSTOMER_ID UID NOT NULL, DEBT_SUM D_N15_2 DEFAULT 0 NOT NULL);
insert into CUSTOMER_OLD (Customer_Id, Debt_Sum) select Customer_Id, Debt_Sum from Customer;
commit;
CREATE INDEX CUSTOMER_OLD_ID ON CUSTOMER_OLD (CUSTOMER_ID);


CREATE TABLE MONTHLY_OLD (MONTH_ID D_DATE, CUSTOMER_ID UID, SERVICE_ID UID, UNITS D_N15_2, FEE D_N15_2);
insert into Monthly_Old (Month_Id, Customer_Id, Service_Id, Units, Fee) select Month_Id, Customer_Id, Service_Id, Units, Fee from Monthly_Fee;
commit;
CREATE INDEX MONTHLY_FEE_OLD_IDX ON MONTHLY_OLD (CUSTOMER_ID, MONTH_ID, SERVICE_ID);

UPDATE SETTINGS SET VAR_VALUE = '0' WHERE (VAR_NAME = 'STRICT_MODE');commit;

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

select
    c.Account_No
  , f.Month_Id
  , c.Customer_Id
  , f.NEW_FEE
  , o.OLD_FEE
  , (f.NEW_FEE - coalesce(o.OLD_FEE, 0)) as DIFF
  , abs(f.NEW_FEE - coalesce(o.OLD_FEE, 0)) as ABS_DIFF
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

