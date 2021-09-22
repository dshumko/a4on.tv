create or alter procedure GET_STATISTICS (
    S_DATE D_DATE,
    E_DATE D_DATE)
returns (
    SERVICE_ID  UID,
    CUSTOMER_ID UID,
    S_ON        D_INTEGER,
    S_BLOCK     D_INTEGER,
    P_NEW       D_INTEGER,
    P_RETURN    D_INTEGER,
    P_SWITCH    D_INTEGER,
    P_OFF       D_INTEGER,
    P_OFFSWITCH D_INTEGER,
    E_ON        D_INTEGER,
    E_BLOCK     D_INTEGER)
AS
declare variable V_SUBSCR_SERV_ID UID;
declare variable V_STATE          D_INTEGER;
declare variable V_ST_DATE        D_DATE;
declare variable V_ST_SRV         D_INTEGER;
declare variable BUS_TYPE         D_INTEGER;
declare variable V_SD             D_DATE;
declare variable V_DATE_OFF       D_DATE;
declare variable NEED_CHECK       D_INTEGER;
begin

  if (S_DATE is null) then
    S_DATE = current_date - extract(day from current_date) + 1;
  if (E_DATE is null) then
    E_DATE = dateadd(-1 day to(dateadd(1 month to(current_date - extract(day from current_date) + 1))));

  for select
          SS.CUSTOMER_ID, SS.SERV_ID, SS.SUBSCR_SERV_ID, SS.STATE_SGN, SS.STATE_DATE, SS.STATE_SRV, S.BUSINESS_TYPE
        from SUBSCR_SERV SS
             inner join SERVICES S on (SS.SERV_ID = S.SERVICE_ID)
                   -- where ss.Customer_Id = 6461 --  (LS 4775)
                   --  and s.service_id = 47503

      into :CUSTOMER_ID, :SERVICE_ID, :V_SUBSCR_SERV_ID, :V_STATE, :V_ST_DATE, :V_ST_SRV, :BUS_TYPE
  do begin
    S_ON = 0;
    S_BLOCK = 0;
    P_NEW = 0;
    P_RETURN = 0;
    P_SWITCH = 0;
    P_OFF = 0;
    P_OFFSWITCH = 0;
    E_ON = 0;
    E_BLOCK = 0;

    -- подключен ли на начало
    select
        SRV_ON, DATE_ON
      from CHECK_SRV_ACTIVE(:CUSTOMER_ID, :SERVICE_ID, :S_DATE)
    into :S_ON, :V_SD;
    --if (V_SD = S_DATE) then S_ON = 0;

    -- подключен ли на конец периода
    select
        SRV_ON
      from CHECK_SRV_ACTIVE(:CUSTOMER_ID, :SERVICE_ID, :E_DATE)
    into E_ON;

    -- может он был в блокировке. на начало
    select
        IN_BLOCK
      from CHECK_IN_BLOCK(:CUSTOMER_ID, :SERVICE_ID, :S_DATE)
    into :S_BLOCK;

    -- проверим. может он был в блокировке. на конец
    select
        IN_BLOCK
      from CHECK_IN_BLOCK(:CUSTOMER_ID, :SERVICE_ID, :E_DATE)
    into :E_BLOCK;

    P_NEW = iif(exists(select
                           SH.SUBSCR_SERV_ID
                         from SUBSCR_HIST SH
                         where SH.SUBSCR_SERV_ID = :V_SUBSCR_SERV_ID
                               and SH.DATE_FROM between :S_DATE and :E_DATE
                               and sh.Act_Serv_Id <> -2
                               and not exists(select
                                                  H.SUBSCR_HIST_ID
                                                from SUBSCR_HIST H
                                                     inner join SERVICES S on (H.SERV_ID = S.SERVICE_ID)
                                                where H.CUSTOMER_ID = SH.CUSTOMER_ID
                                                      -- and H.SUBSCR_SERV_ID <> :V_SUBSCR_SERV_ID
                                                      and S.BUSINESS_TYPE = :BUS_TYPE
                                                      and H.DATE_FROM < :S_DATE)), 1, 0);

    P_SWITCH = iif(exists(select
                              SH.SUBSCR_SERV_ID
                            from SUBSCR_HIST SH
                            where SH.SUBSCR_SERV_ID = :V_SUBSCR_SERV_ID
                                  and SH.DATE_FROM between :S_DATE and :E_DATE
                                  and sh.Act_Serv_Id <> -2
                                  and exists(select
                                                 H.SUBSCR_HIST_ID
                                               from SUBSCR_HIST H
                                                    inner join SERVICES S on (H.SERV_ID = S.SERVICE_ID)
                                               where H.CUSTOMER_ID = SH.CUSTOMER_ID
                                                     and H.SUBSCR_SERV_ID <> :V_SUBSCR_SERV_ID
                                                     and S.BUSINESS_TYPE = :BUS_TYPE
                                                     and H.DATE_TO = dateadd(day, -1, SH.DATE_FROM))), 1, 0);

    P_RETURN = iif(exists(select
                              SH.SUBSCR_SERV_ID
                            from SUBSCR_HIST SH
                            where SH.SUBSCR_SERV_ID = :V_SUBSCR_SERV_ID
                                  and SH.DATE_FROM between :S_DATE and :E_DATE
                                  and sh.Act_Serv_Id <> -2
                                  and exists(select
                                                 H.SUBSCR_HIST_ID
                                               from SUBSCR_HIST H
                                                  inner join SERVICES S on (H.SERV_ID = S.SERVICE_ID)
                                               where H.CUSTOMER_ID = SH.CUSTOMER_ID
                                                     and S.BUSINESS_TYPE = :BUS_TYPE
                                                     and H.SUBSCR_SERV_ID = :V_SUBSCR_SERV_ID
                                                     and H.DATE_FROM < :S_DATE)), 1, 0);

    select
        SRV_OFF, dateadd(day, 1, Date_To)
      from CHECK_IN_OFF(:CUSTOMER_ID, :SERVICE_ID, :E_DATE)
    into :P_OFF, :V_DATE_OFF;
    if (V_DATE_OFF < S_DATE) then
      P_OFF = 0;

    P_OFFSWITCH = iif(exists(select
                                 H.SUBSCR_HIST_ID
                               from SUBSCR_HIST H
                                    inner join SERVICES S on (H.SERV_ID = S.SERVICE_ID)
                               where H.CUSTOMER_ID = :CUSTOMER_ID
                                     and H.SUBSCR_SERV_ID <> :V_SUBSCR_SERV_ID
                                     and h.Act_Serv_Id <> -2
                                     and S.BUSINESS_TYPE = :BUS_TYPE
                                     and H.DATE_FROM between :S_DATE and :E_DATE
                                     and H.DATE_FROM = :V_DATE_OFF), 1, 0);

    if (P_OFFSWITCH = 1) then
      P_OFF = 0;

    if ((P_RETURN = 1) and (P_SWITCH = 1)) then
      P_RETURN = 0;

    if ((P_NEW = 1) or (P_RETURN = 1) or (P_SWITCH = 1)) then
      S_ON = 0;

    if ((S_BLOCK = 1) and (P_RETURN = 1)) then
      P_RETURN = 0;

    if ((S_BLOCK = 1) and (P_SWITCH = 1)) then
      P_SWITCH = 0;

    if (((P_OFF = 1) or (P_OFFSWITCH = 1))
       and ((S_On + S_Block + P_New + P_Return + P_Switch) = 0 ))  then
      S_ON = 1;

    if (((E_ON = 1) or (E_BLOCK = 1))
       and ((S_On + S_Block + P_New + P_Return + P_Switch) = 0 ))  then
      P_Return = 1;

    -- последняя проверка
    if ((S_ON = 1) and (E_ON = 1)) then begin
        S_BLOCK = 0;
        P_NEW = 0;
        P_RETURN = 0;
        P_SWITCH = 0;
        P_OFF = 0;
        P_OFFSWITCH = 0;
        E_BLOCK = 0;
    end
    /*
    -- if (S_BLOCK = 1) then
    --  S_ON = 0;

    --if (E_BLOCK = 1) then
    --  E_ON = 0;

    if (P_NEW = 1) then
      S_BLOCK = 0;

    if ((S_ON = 1) and (P_NEW = 1) and (P_SWITCH = 1)) then begin
      S_ON = 0;
      P_NEW = 0;
    end

    if ((P_NEW = 1) and (P_SWITCH = 1)) then begin
      P_NEW = 0;
    end


    end

    if ((P_SWITCH = 1) and (S_BLOCK = 1)) then begin
      P_SWITCH = 0;
    end

    if ((S_ON = 1) and (P_RETURN = 1)) then begin
      P_RETURN = 0;
    end

    if ((S_ON = 1) and (P_SWITCH = 1)) then begin
      P_SWITCH = 0;
    end

    if ((S_BLOCK = 1) and (P_RETURN = 1)) then begin
      P_RETURN = 0;
    end

    if ((S_ON = 1) and (P_NEW = 1)) then begin
      S_ON = 0;
    end



    if (((S_On + S_Block + P_New + P_Return + P_Switch) = 0 )and ((P_Off + P_Offswitch) > 0))
    then s_on = 1;
    */
    suspend;
  end
end
