CREATE EXCEPTION E_MAX_ABONENTS 'Достигнуто максимальное количество абонентов.';

SET TERM ^ ;

ALTER PROCEDURE CLOSE_PERIOD_PROC(P_START_MONTH DATE,
P_END_MONTH DATE)
 AS
 BEGIN EXIT; END
^

create or alter procedure CLOSE_MONTH_PROC (
    P_MONTH       D_DATE,
    P_CUSTOMER_ID type of UID = null,
    P_DAILY       D_INTEGER = null,
    RCWCM_IGONRE  D_INTEGER = 0)
as
declare variable V_S_MONTH   D_DATE;
declare variable V_E_MONTH   D_DATE;
declare variable CUSTOMER_ID D_INTEGER;
declare variable V_FEE_ROUND D_INTEGER;
declare variable V_CALC_TYPE D_INTEGER; -- метод расчета услуги
declare variable V_FLAG      D_INTEGER; -- оптимизация
declare variable need_0      D_INTEGER; -- оптимизация. если есть такие услуги то считаем иначе пропускаем
declare variable need_1      D_INTEGER;
declare variable need_2      D_INTEGER;
declare variable need_3      D_INTEGER;
declare variable need_4      D_INTEGER;
declare variable need_5      D_INTEGER;
declare variable vRC         D_INTEGER;
begin
  /*
  в настройках добавлен флаг RECALC_CURRENT_WHEN_CLOSE_MONTH
  пересчитывать текущий месяц при переходе на следующий
  vRC = 1 признак того что нужно пересчитывать текущий месяц
  */
  if (coalesce(RCWCM_IGONRE, 0) = 0) then begin
    -- Пересчитываем текущий месяц, когда переходим на следующий
    select
        VAR_VALUE
      from SETTINGS
      where VAR_NAME = 'RECALC_CURRENT_WHEN_CLOSE_MONTH'
    into :vRC;
  end
  vRC = coalesce(vRC, 0);

  -- установим на первое число месяца
  P_MONTH = P_MONTH - extract(day from P_MONTH) + 1;

  if (vRC = 1) then begin
    P_MONTH = dateadd(month, -1, P_MONTH);
  end

  while (vRC >= 0) do begin
    -- для скорости рассчета. исключим те типы услуг,
    -- которые не используются организацией/абонентом
    need_0 = 0;
    need_1 = 0;
    need_2 = 0;
    need_3 = 0;
    need_4 = 0;
    need_5 = 0;
    for select distinct
            CALC_TYPE
          from services s
          where S.SRV_TYPE_ID = 0
                and ((:P_CUSTOMER_ID is null)
                  or exists(select
                                ss.Serv_Id
                              from Subscr_Hist ss
                              where ss.Customer_Id = :P_CUSTOMER_ID
                                    -- and dateadd(month, s.Shift_Months, cast(:P_MONTH as DATE)) <= ss.Date_To
                                    and ss.Serv_Id = s.Service_Id))
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
      if (V_CALC_TYPE = 4) then
        need_4 = 1;
      else
      if (V_CALC_TYPE = 5) then
        need_5 = 1;
    end

    /* получим значение число знаков после запятой для округления*/
    V_FEE_ROUND = GET_SETTING_INT_VALUE('FEE_ROUND', 2);
    /* проверим нужно ли записывать в таблицу ежедневных начислений*/
    P_DAILY = coalesce(P_DAILY, GET_SETTING_INT_VALUE('DAILY_FEE', 0));

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
    if (P_DAILY = 1) then begin
      -- Удалим все начисления за день
      delete from DAILY_FEE F
          where F.DAY_FEE between :V_S_MONTH and :V_E_MONTH
                and ((f.customer_id = :p_customer_id)
                  or (:p_customer_id is null));
    end
    /*---------------------------------------------------------------------------------*/
    /*        0 - рассчитываем периодические услуги, пропорционально дням              */
    /*---------------------------------------------------------------------------------*/
    if (need_0 = 1) then begin
      V_CALC_TYPE = 0;
      -- оптимизация.
      -- ставим флаг для первого рассчета тарифа.
      -- если в цикл не заходим, то и не рассчитываем
      V_FLAG = 0;
      for select first 1000 distinct
              SH.CUSTOMER_ID
            from Subscr_Serv SH
                 inner join SERVICES S on (SH.SERV_ID = S.SERVICE_ID)
            where S.SRV_TYPE_ID = 0
                  and S.CALC_TYPE = :V_CALC_TYPE
                  and ((sh.customer_id = :p_customer_id)
                    or (:p_customer_id is null))
            order by s.Priority nulls last
          into :CUSTOMER_ID
      do begin
        if (V_FLAG = 0) then begin
          execute procedure CALC_DAY_TARIF(:P_MONTH, :V_CALC_TYPE);
          V_FLAG = 1;
        end
        execute procedure CALC_MONTH_DAY_SRV_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND, :V_CALC_TYPE, :P_DAILY);
      end
    end

    /*---------------------------------------------------------------------------------*/
    /*        1 -          расчет услуг исходя из целого месяца                        */
    /* т.е. например подключен 15 дней и мение - не берем абонплату                    */
    /*               подключен 16 дней и более - берем абонплату                       */
    /*---------------------------------------------------------------------------------*/
    if (need_1 = 1) then begin
      V_CALC_TYPE = 1;
      for select first 1000 distinct
              SH.CUSTOMER_ID
            from Subscr_Serv SH
                 inner join SERVICES S on (SH.SERV_ID = S.SERVICE_ID)
            where S.SRV_TYPE_ID = 0
                  and S.CALC_TYPE = :V_CALC_TYPE
                  and ((sh.customer_id = :p_customer_id)
                    or (:p_customer_id is null))
            order by s.Priority nulls last
          into :CUSTOMER_ID
      do
        execute procedure CALC_MONTH_SRV_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND, :V_CALC_TYPE, :P_DAILY);
    end

    /*---------------------------------------------------------------------------------*/
    /*        2 -          расчет услуг с ежедневным начислением                       */
    /*---------------------------------------------------------------------------------*/
    if (need_2 = 1) then begin
      V_CALC_TYPE = 2;
      V_FLAG = 0;
      for select first 1000 distinct
              SH.CUSTOMER_ID
            from Subscr_Serv SH
                 inner join SERVICES S on (SH.SERV_ID = S.SERVICE_ID)
            where S.SRV_TYPE_ID = 0
                  and S.CALC_TYPE = :V_CALC_TYPE
                  and ((sh.customer_id = :p_customer_id)
                    or (:p_customer_id is null))
            order by s.Priority nulls last
          into :CUSTOMER_ID
      do begin
        if (V_FLAG = 0) then begin
          execute procedure CALC_DAY_TARIF(:P_MONTH, :V_CALC_TYPE);
          V_FLAG = 1;
        end
        execute procedure CALC_DAY_SRV_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND, :V_CALC_TYPE, :P_DAILY);
      end
    end

    /*---------------------------------------------------------------------------------*/
    /*        3 -     1-ый месяц пропорционально дням, далее фикса                     */
    /*---------------------------------------------------------------------------------*/
    if (need_3 = 1) then begin
      V_CALC_TYPE = 3;
      V_FLAG = 0;
      for select first 1000 distinct
              SH.CUSTOMER_ID
            from Subscr_Serv SH
                 inner join SERVICES S on (SH.SERV_ID = S.SERVICE_ID)
            where S.SRV_TYPE_ID = 0
                  and S.CALC_TYPE = :V_CALC_TYPE
                  and ((sh.customer_id = :p_customer_id)
                    or (:p_customer_id is null))
            order by s.Priority nulls last
          into :CUSTOMER_ID
      do begin
        if (V_FLAG = 0) then begin
          execute procedure CALC_DAY_TARIF(:P_MONTH, :V_CALC_TYPE);
          V_FLAG = 1;
        end
        execute procedure CALC_MONTH_FIX_SRV_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND, :V_CALC_TYPE, :P_DAILY);
      end
    end

    /*---------------------------------------------------------------------------------*/
    /*        5 - расчет услуг с ежедневным начислением с учетом дня подключения       */
    /*---------------------------------------------------------------------------------*/
    if (need_5 = 1) then begin
      V_CALC_TYPE = 5;
      V_FLAG = 0;
      for select first 1000 distinct
              SH.CUSTOMER_ID
            from Subscr_Serv SH
                 inner join SERVICES S on (SH.SERV_ID = S.SERVICE_ID)
            where S.SRV_TYPE_ID = 0
                  and S.CALC_TYPE = :V_CALC_TYPE
                  and ((sh.customer_id = :p_customer_id)
                    or (:p_customer_id is null))
            order by s.Priority nulls last
          into :CUSTOMER_ID
      do begin
        if (V_FLAG = 0) then begin
          execute procedure CALC_DAY_TARIF(:P_MONTH, :V_CALC_TYPE);
          V_FLAG = 1;
        end
        execute procedure CALC_DAY_INC_SRV_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND, :V_CALC_TYPE, :P_DAILY);
      end
    end

    /*---------------------------------------------------------------------------------*/
    /*                     рассчитываем разовые услуги                                 */
    /*---------------------------------------------------------------------------------*/
    for select first 1000 distinct
            Sh.CUSTOMER_ID
          from SINGLE_SERV Sh
               inner join SERVICES S on (S.SERVICE_ID = Sh.SERVICE_ID)
          where S.SRV_TYPE_ID = 1
                and Sh.SERV_DATE between :V_S_MONTH and :V_E_MONTH
                and ((sh.customer_id = :p_customer_id)
                  or (:p_customer_id is null))
          order by s.Priority nulls last
        into :CUSTOMER_ID
    do
      execute procedure CALC_SINGLE_SRV_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND, :P_DAILY);

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
    for select first 1000 distinct
            Sh.CUSTOMER_ID
          from SINGLE_SERV Sh
               inner join SERVICES S on (S.SERVICE_ID = Sh.SERVICE_ID)
          where S.SRV_TYPE_ID = 2
                and Sh.SERV_DATE between :V_S_MONTH and :V_E_MONTH
                and ((sh.customer_id = :p_customer_id)
                  or (:p_customer_id is null))
          order by s.Priority nulls last
        into :CUSTOMER_ID
    do
      execute procedure CALC_FIXED_SRV_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND, :P_DAILY);

    /*---------------------------------------------------------------------------------*/
    /*        4 - Доначисления до тарифа (в месяц абонент тратит фиксированную сумму)  */
    /*---------------------------------------------------------------------------------*/
    if (need_4 = 1) then begin
      V_CALC_TYPE = 4;
      V_FLAG = 0;
      for select first 1000 distinct
              SH.CUSTOMER_ID
            from Subscr_Serv SH
                 inner join SERVICES S on (SH.SERV_ID = S.SERVICE_ID)
            where S.SRV_TYPE_ID = 0
                  and S.CALC_TYPE = :V_CALC_TYPE
                  and ((sh.customer_id = :p_customer_id)
                    or (:p_customer_id is null))
            order by s.Priority nulls last
          into :CUSTOMER_ID
      do begin
        execute procedure CALC_SURCHARGE_CUSTOMER(:CUSTOMER_ID, :P_MONTH, :V_FEE_ROUND, :V_CALC_TYPE, :P_DAILY);
      end
    end

    /* если работаем с таблицей ежедневных начислений, то перенесем туда и начисления с заявок */
    if (P_DAILY = 1) then begin
      insert into DAILY_FEE (DAY_FEE, CUSTOMER_ID, TITLE, UNITS, FEE)
      select
          m.Fee_Date
        , :CUSTOMER_ID
        , m.Fee_Name -- || coalesce(' (' || m.Serial || ')', '')
        , m.Units
        , m.FEE
        from other_fee m
        where m.CUSTOMER_ID = :CUSTOMER_ID
              and m.Fee_Date between :V_S_MONTH and :V_E_MONTH;
    end
    if (vRC > 0) then begin
      P_MONTH = dateadd(month, 1, P_MONTH);
    end
    vRC = vRC - 1;
  end

  if (P_CUSTOMER_ID is null) then begin
    execute procedure CALC_DISCOUNT(:P_MONTH);

    update SETTINGS
    set VAR_VALUE = extract(year from :P_MONTH) || '-' || extract(month from :P_MONTH) || '-1'
    where VAR_NAME = 'CURRENT_DATE';

    insert into CHANGELOG (LOG_GROUP, OBJECT_TYPE, OBJECT_ID, PARAM, VALUE_BEFORE, VALUE_AFTER)
    values ('SYSTEM', -1, -1, 'CLOSE_MONTH_PROC ' || :P_MONTH, localtimestamp, current_user);
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




