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
declare variable V_STATE D_INTEGER;
declare variable V_ST_DATE D_DATE;
declare variable V_ST_SRV D_INTEGER;
declare variable BUS_TYPE D_INTEGER;
declare variable V_SD D_DATE;
begin

  if (S_DATE is null) then
    S_DATE = current_date;
  if (E_DATE is null) then
    E_DATE = S_DATE;

  for select SS.CUSTOMER_ID, SS.SERV_ID, SS.SUBSCR_SERV_ID, SS.STATE_SGN, SS.STATE_DATE, SS.STATE_SRV, S.BUSINESS_TYPE
      from SUBSCR_SERV SS
      inner join SERVICES S on (SS.SERV_ID = S.SERVICE_ID)
            -- where ss.Customer_Id = 5710 --  (LS 4775)
            -- and s.service_id = 716042
      into :CUSTOMER_ID, :SERVICE_ID, :V_SUBSCR_SERV_ID, :V_STATE, :V_ST_DATE, :V_ST_SRV, :BUS_TYPE
  do
  begin
    S_ON = 0;
    S_BLOCK = 0;
    P_NEW = 0;
    P_RETURN = 0;
    P_SWITCH = 0;
    P_OFF = 0;
    P_OFFSWITCH = 0;
    E_ON = 0;
    E_BLOCK = 0;

    if ((V_ST_DATE < S_DATE) and
        (V_STATE = 1)) then
      S_ON = 1;
    else
    begin
      if ((V_ST_DATE = S_DATE) and
          (V_STATE = 0)) then
      begin
        S_ON = 1;
        if (V_ST_SRV <> -3) then
          P_OFF = 1;
        else
          S_BLOCK = 1;
      end
      else
      begin
        select SRV_ON, DATE_ON
        from CHECK_SRV_ACTIVE(:CUSTOMER_ID, :SERVICE_ID, :S_DATE)
        into :S_ON, :V_SD;
        if (V_SD = S_DATE) then
          S_ON = 0;
      end
    end

    -- Если отключен на начало, проверим. может он был в блокировке.
    if (S_ON = 0) then
    begin
      -- может был в блокировке?
      if ((V_ST_DATE <= S_DATE) and
          (V_STATE = 0) and
          (V_ST_SRV = -3)) then
        S_BLOCK = 1; -- В блокировке
      else
      begin
        select IN_BLOCK
        from CHECK_IN_BLOCK(:CUSTOMER_ID, :SERVICE_ID, :S_DATE)
        into :S_BLOCK;
      end
    end

    -- Если не новый и не в блокировке, то может в период что-то было
    if ((S_BLOCK = 0) and
        (S_ON = 0)) then
    begin
      -- может новый?
      P_NEW = iif(exists(select SH.SUBSCR_SERV_ID
                         from SUBSCR_HIST SH
                         where SH.SUBSCR_SERV_ID = :V_SUBSCR_SERV_ID
                               --and (((:V_CALC_TYPE <> 5) and (sh.Date_From between :s_date and dateadd(day, -1, :e_date)))
                               --  or ((:V_CALC_TYPE = 5) and (sh.Date_From between :s_date and :e_date)))
                               and
                               SH.DATE_FROM between :S_DATE and :E_DATE and
                               not exists(select H.SUBSCR_HIST_ID
                                          from SUBSCR_HIST H
                                          inner join SERVICES S on (H.SERV_ID = S.SERVICE_ID)
                                          where H.CUSTOMER_ID = SH.CUSTOMER_ID and
                                                S.BUSINESS_TYPE = :BUS_TYPE and
                                                H.DATE_FROM < :S_DATE)), 1, 0);
      -- может переключился?
      if (P_NEW = 0) then
      begin
        P_SWITCH = iif(exists(select SH.SUBSCR_SERV_ID
                              from SUBSCR_HIST SH
                              where SH.SUBSCR_SERV_ID = :V_SUBSCR_SERV_ID
                                    --and (((:V_CALC_TYPE <> 5) and (sh.Date_From between :s_date and dateadd(day, -1, :e_date)))
                                    --  or ((:V_CALC_TYPE = 5) and (sh.Date_From between :s_date and :e_date)))
                                    and
                                    SH.DATE_FROM between :S_DATE and :E_DATE and
                                    not exists(select H.SUBSCR_HIST_ID
                                               from SUBSCR_HIST H
                                               where H.SUBSCR_SERV_ID = :V_SUBSCR_SERV_ID and
                                                     H.DATE_FROM < :S_DATE)), 1, 0);
      end
      -- может вернулся?
      if ((P_NEW = 0) and
          (P_SWITCH = 0)) then
      begin
        P_RETURN = iif(exists(select SH.SUBSCR_SERV_ID
                              from SUBSCR_HIST SH
                              where SH.SUBSCR_SERV_ID = :V_SUBSCR_SERV_ID and
                                    SH.DATE_FROM between :S_DATE and :E_DATE and
                                    exists(select H.SUBSCR_HIST_ID
                                           from SUBSCR_HIST H
                                           where H.SUBSCR_SERV_ID = :V_SUBSCR_SERV_ID and
                                                 H.DATE_FROM < :S_DATE)), 1, 0);
      end
    end

    -- если был активен за период может он отключился?
    if ((S_ON = 1) or (S_BLOCK = 1) or (P_NEW = 1) or (P_RETURN = 1) or (P_SWITCH = 1)) then
    begin
      if (P_OFF <> 1) then
        select SRV_OFF
        from CHECK_IN_OFF(:CUSTOMER_ID, :SERVICE_ID, :E_DATE)
        into :P_OFF;
      -- если отключен, может он ушел на другой тариф
      if (P_OFF = 1) then
      begin
        P_OFFSWITCH = iif(exists(select SH.SUBSCR_SERV_ID
                                 from SUBSCR_HIST SH
                                 where SH.SUBSCR_SERV_ID = :V_SUBSCR_SERV_ID and
                                       exists(select H.SUBSCR_HIST_ID
                                              from SUBSCR_HIST H
                                              inner join SERVICES S on (H.SERV_ID = S.SERVICE_ID)
                                              where H.CUSTOMER_ID = SH.CUSTOMER_ID and
                                                    H.SUBSCR_SERV_ID <> :V_SUBSCR_SERV_ID and
                                                    S.BUSINESS_TYPE = :BUS_TYPE and
                                                    H.DATE_FROM between :S_DATE and :E_DATE)), 1, 0);
        if (P_OFFSWITCH = 1) then
          P_OFF = 0;

      end
    end

    if ((V_ST_DATE <= E_DATE) and
        (V_STATE = 0) and
        (V_ST_SRV <> -3)) then
      E_ON = 0;
    else
    begin
      if (P_OFF = 0) then
        select SRV_ON
        from CHECK_SRV_ACTIVE(:CUSTOMER_ID, :SERVICE_ID, :E_DATE)
        into E_ON;
    end

    if (E_ON = 0) then
    begin
      -- Если отключен на конец, проверим. может он был в блокировке
      if ((V_ST_DATE <= E_DATE) and
          (V_STATE = 0) and
          (V_ST_SRV = -3)) then
      begin
        E_ON = 1;
        E_BLOCK = 1; -- В блокировке
      end
      else
      begin
        select IN_BLOCK
        from CHECK_IN_BLOCK(:CUSTOMER_ID, :SERVICE_ID, :E_DATE)
        into :E_BLOCK;
      end
    end
    if (S_BLOCK = 1) then
      S_ON = 0;
    if (E_BLOCK = 1) then
      E_ON = 0;

    suspend;
  end
end
