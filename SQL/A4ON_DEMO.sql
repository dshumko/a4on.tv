CREATE EXCEPTION E_MAX_ABONENTS 'Достигнуто максимальное количество абонентов.';

SET TERM ^ ;

ALTER PROCEDURE CLOSE_PERIOD_PROC(P_START_MONTH DATE,
P_END_MONTH DATE)
 AS
 BEGIN EXIT; END
^

create or alter procedure CLOSE_MONTH_PROC (
    P_MONTH       D_DATE,
    P_CUSTOMER_ID type of UID = null)
as
declare variable V_S_MONTH   D_DATE;
declare variable V_E_MONTH   D_DATE;
declare variable CUSTOMER_ID D_INTEGER;
declare variable V_FEE_ROUND D_INTEGER;
declare variable V_CALC_TYPE D_INTEGER; -- метод расчета услуги
declare variable V_FLAG      D_INTEGER; -- оптимизация
declare variable need_0      D_INTEGER; -- оптимизация
declare variable need_1      D_INTEGER; -- оптимизация
declare variable need_2      D_INTEGER; -- оптимизация
declare variable need_3      D_INTEGER; -- оптимизация
declare variable need_5      D_INTEGER; -- оптимизация
begin
  -- установим на первое число месяца
  P_MONTH = P_MONTH - extract(day from P_MONTH) + 1;

  -- для скорости рассчета. исключим те типы услуг,
  -- которые не используются организацией/абонентом
  need_0 = 0;
  need_1 = 0;
  need_2 = 0;
  need_3 = 0;
  need_5 = 0;
  for select distinct
          CALC_TYPE
        from services s
        where S.SRV_TYPE_ID = 0
      into :V_CALC_TYPE
  do begin
    if (V_CALC_TYPE = 0) then
      need_0 = 1;
    else
    if (V_CALC_TYPE = 1) then
      need_1 = 1;
    else
    if (V_CALC_TYPE = 2) then
      need_2 = 1;
    else
    if (V_CALC_TYPE = 3) then
      need_3 = 1;
    else
    if (V_CALC_TYPE = 5) then
      need_5 = 1;
  end

  /* получим значение число знаков после запятой для округления*/
  select
      cast(VAR_VALUE as integer)
    from SETTINGS
    where VAR_NAME = 'FEE_ROUND'
  into :V_FEE_ROUND;
  V_FEE_ROUND = coalesce(V_FEE_ROUND, 2);

  -- начало месяца и конец месяца
  V_S_MONTH = P_MONTH;
  V_E_MONTH = dateadd(-1 day to(dateadd(1 month to V_S_MONTH)));

  -- Удалим все начисления за месяц
  delete from MONTHLY_FEE F
      where F.MONTH_ID between :V_S_MONTH and :V_E_MONTH
            and ((f.customer_id = :p_customer_id)
              or (:p_customer_id is null))
            -- оставим разовые меньше 0  (чтоб не блокировало услуги)
            and ((f.Fee >= 0)
              or ((f.Fee < 0)
            and exists(select
                           s.Service_Id
                         from services s
                         where s.Srv_Type_Id <> 2
                               and s.Service_Id = f.Service_Id)));

  /*---------------------------------------------------------------------------------*/
  /*          расчитываем периодические услуги, пропорционально дням                 */
  /*---------------------------------------------------------------------------------*/
  if (need_0 = 1) then begin
    V_CALC_TYPE = 0;
    -- оптимизация.
    -- ставим флаг для первого рассчета тарифа.
    -- если в цикл не заходим, то и не рассчитываем
    V_FLAG = 0;
    for select first 1000  distinct
            SH.CUSTOMER_ID
          from Subscr_Serv SH
               inner join SERVICES S on (SH.SERV_ID = S.SERVICE_ID)
          where S.SRV_TYPE_ID = 0
                and S.CALC_TYPE = :V_CALC_TYPE
                and ((sh.customer_id = :p_customer_id)
                  or (:p_customer_id is null))
        into :CUSTOMER_ID
    do begin
      if (V_FLAG = 0) then begin
        execute procedure CALC_DAY_TARIF(:P_MONTH, :V_CALC_TYPE);
        V_FLAG = 1;
      end
      execute procedure CALC_MONTH_DAY_SRV_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND, :V_CALC_TYPE);
    end
  end
  /*---------------------------------------------------------------------------------*/
  /*                     расчет услуг исходя из целого месяца                        */
  /* т.е. например подключен 15 дней и мение - не берем абонплату                    */
  /*               подключен 16 дней и более - берем абонплату                       */
  /*---------------------------------------------------------------------------------*/
  if (need_1 = 1) then begin
    V_CALC_TYPE = 1;
    for select first 1000  distinct
            SH.CUSTOMER_ID
          from Subscr_Serv SH
               inner join SERVICES S on (SH.SERV_ID = S.SERVICE_ID)
          where S.SRV_TYPE_ID = 0
                and S.CALC_TYPE = :V_CALC_TYPE
                and ((sh.customer_id = :p_customer_id)
                  or (:p_customer_id is null))
        into :CUSTOMER_ID
    do
      execute procedure CALC_MONTH_SRV_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND, :V_CALC_TYPE);
  end
  /*---------------------------------------------------------------------------------*/
  /*                     расчет услуг с ежеденевным начислением                      */
  /*---------------------------------------------------------------------------------*/
  if (need_2 = 1) then begin
    V_CALC_TYPE = 2;
    V_FLAG = 0;
    for select first 1000  distinct
            SH.CUSTOMER_ID
          from Subscr_Serv SH
               inner join SERVICES S on (SH.SERV_ID = S.SERVICE_ID)
          where S.SRV_TYPE_ID = 0
                and S.CALC_TYPE = :V_CALC_TYPE
                and ((sh.customer_id = :p_customer_id)
                  or (:p_customer_id is null))
        into :CUSTOMER_ID
    do begin
      if (V_FLAG = 0) then begin
        execute procedure CALC_DAY_TARIF(:P_MONTH, :V_CALC_TYPE);
        V_FLAG = 1;
      end
      execute procedure CALC_DAY_SRV_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND, :V_CALC_TYPE);
    end
  end
  /*---------------------------------------------------------------------------------*/
  /*                   расчет услуг с фиксированным начислением                      */
  /*---------------------------------------------------------------------------------*/
  if (need_3 = 1) then begin
    V_CALC_TYPE = 3;
    V_FLAG = 0;
    for select first 1000  distinct
            SH.CUSTOMER_ID
          from Subscr_Serv SH
               inner join SERVICES S on (SH.SERV_ID = S.SERVICE_ID)
          where S.SRV_TYPE_ID = 0
                and S.CALC_TYPE = :V_CALC_TYPE
                and ((sh.customer_id = :p_customer_id)
                  or (:p_customer_id is null))
        into :CUSTOMER_ID
    do begin
      if (V_FLAG = 0) then begin
        execute procedure CALC_DAY_TARIF(:P_MONTH, :V_CALC_TYPE);
        V_FLAG = 1;
      end
      execute procedure CALC_MONTH_FIX_SRV_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND, :V_CALC_TYPE);
    end
  end
  /*---------------------------------------------------------------------------------*/
  /*         расчет услуг с ежеденевным начислением с учетом дня подключения         */
  /*---------------------------------------------------------------------------------*/
  if (need_5 = 1) then begin
    V_CALC_TYPE = 5;
    V_FLAG = 0;
    for select first 1000  distinct
            SH.CUSTOMER_ID
          from Subscr_Serv SH
               inner join SERVICES S on (SH.SERV_ID = S.SERVICE_ID)
          where S.SRV_TYPE_ID = 0
                and S.CALC_TYPE = :V_CALC_TYPE
                and ((sh.customer_id = :p_customer_id)
                  or (:p_customer_id is null))
        into :CUSTOMER_ID
    do begin
      if (V_FLAG = 0) then begin
        execute procedure CALC_DAY_TARIF(:P_MONTH, :V_CALC_TYPE);
        V_FLAG = 1;
      end
      execute procedure CALC_DAY_INC_SRV_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND, :V_CALC_TYPE);
    end
  end
  /*---------------------------------------------------------------------------------*/
  /*                     расчитываем разовые услуги                                  */
  /*---------------------------------------------------------------------------------*/
    for select first 1000  distinct
          Sh.CUSTOMER_ID
        from SINGLE_SERV Sh
             inner join SERVICES S on (S.SERVICE_ID = Sh.SERVICE_ID)
        where S.SRV_TYPE_ID = 1
              and Sh.SERV_DATE between :V_S_MONTH and :V_E_MONTH
              and ((sh.customer_id = :p_customer_id)
                or (:p_customer_id is null))
      into :CUSTOMER_ID
  do
    execute procedure CALC_SINGLE_SRV_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND);

  /*---------------------------------------------------------------------------------*/
  /*                     расчитываем фиксированные услуги                            */
  /*---------------------------------------------------------------------------------*/
  -- Удалим разовые меньше 0
  delete from MONTHLY_FEE F
      where F.MONTH_ID between :V_S_MONTH and :V_E_MONTH
            and ((f.customer_id = :p_customer_id)
              or (:p_customer_id is null))
            and (f.Fee < 0)
            and exists(select
                           s.Service_Id
                         from services s
                         where s.Srv_Type_Id = 2
                               and s.Service_Id = f.Service_Id);
    for select first 1000  distinct
          Sh.CUSTOMER_ID
        from SINGLE_SERV Sh
             inner join SERVICES S on (S.SERVICE_ID = Sh.SERVICE_ID)
        where S.SRV_TYPE_ID = 2
              and Sh.SERV_DATE between :V_S_MONTH and :V_E_MONTH
              and ((sh.customer_id = :p_customer_id)
                or (:p_customer_id is null))
      into :CUSTOMER_ID
  do
    execute procedure CALC_FIXED_SRV_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND);

  if (P_CUSTOMER_ID is null) then begin
    execute procedure CALC_DISCOUNT(:P_MONTH);

    update SETTINGS
    set VAR_VALUE = extract(year from :P_MONTH) || '-' || extract(month from :P_MONTH) || '-1'
    where VAR_NAME = 'CURRENT_DATE';
  end
end
^

create or alter trigger CUSTOMER_BI0 for CUSTOMER
active before insert position 0
as
begin
  select
      count(*)
    from customer
  into new.DEBT_SUM;
  if (new.DEBT_SUM >= 1000) then
    exception E_MAX_ABONENTS;
  new.DEBT_SUM = 0;

  if (new.CUSTOMER_ID is null) then
    new.CUSTOMER_ID = gen_id(GEN_CUSTOMER_UID, 1);
  if (new.flat_no is null) then
    new.flat_no = '';
  if (new.FIRSTNAME is null) then
    new.FIRSTNAME = '';
  else
    new.FIRSTNAME = trim(new.FIRSTNAME);
  if (new.MIDLENAME is null) then
    new.MIDLENAME = '';
  else
    new.MIDLENAME = trim(new.MIDLENAME);
  if (trim(new.EXTERNAL_ID) = '') then
    new.EXTERNAL_ID = null;
  if (new.hand_control is null) then
    new.hand_control = 0;

  if (new.Secret is null) then
    select
        Pwd
      from Gen_Password(8, 10)
    into new.Secret;

  select
      cust_code
    from get_customer_code(new.HOUSE_ID, new.FLAT_NO)
  into new.CUST_CODE;

  select
      RESULT
    from extract_number(new.flat_no)
  into new.FLAT_DIGIT;

  if (new.Juridical = 1) then
    new.INITIALS = substring(new.FIRSTNAME from 1 for 10);
  else
    new.INITIALS = trim(substring(new.FIRSTNAME from 1 for 1) || ' ' || substring(new.MIDLENAME from 1 for 1));

  new.added_by = current_user;
  new.added_on = localtimestamp;
end
^

create or alter trigger EQUIPMENT_DGTL_BI for EQUIPMENT_DVB
active before insert position 0
as
declare variable cnt D_Integer;
begin
  select
      count(*)
    from EQUIPMENT_DVB
  into :cnt;
  if (cnt > 10) then
    exception E_MAX_ABONENTS;

  if (new.eq_id is null) then
    new.eq_id = gen_id(GEN_EQ_ID, 1);

  new.added_by = current_user;
  new.added_on = localtimestamp;
end
^

SET TERM ; ^

UPDATE RDB$PROCEDURES SET RDB$PROCEDURE_SOURCE = NULL WHERE RDB$SYSTEM_FLAG = 0;
commit;

update Rdb$Triggers p set RDB$TRIGGER_SOURCE = null where P.Rdb$System_Flag = 0;
commit;




