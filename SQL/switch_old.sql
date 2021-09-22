CREATE OR ALTER PROCEDURE SWITCH_SERVICE (
    CUSTOMER_ID TYPE OF UID,
    FROM_SRV TYPE OF UID,
    TO_SRV TYPE OF UID,
    SWITCH_SRV TYPE OF UID,
    UNITS D_N15_2,
    SWITCH_DATE D_DATE,
    NOTICE D_NOTICE)
RETURNS (
    RESULT D_INTEGER)
AS
declare variable Add_Srv     type of Uid;
declare variable Switch_Time type of Uid;
declare variable vDate       type of D_Date;
declare variable vBlance     D_N15_2;
declare variable vTarif      D_N15_2;
declare variable vAutoOff    D_INTEGER;
declare variable vDays       D_INTEGER;
begin
  if (Switch_Date is null) then
    Switch_Date = current_date;

  /* проверим, если услуга уже отключена, то ничего не делаем */
  select
      count(*)
    from SUBSCR_SERV SH
    where SH.Customer_Id = :CUSTOMER_ID
          and SH.Serv_Id = :FROM_SRV
          and sh.State_Sgn = 0
  into :Add_Srv;

  if (Add_Srv = 0) then begin

    if (UNITS is null) then
      UNITS = 0;

    /* получим услугу переключения и когда ее можно переключать */
    Add_Srv = null;
    Switch_Time = null;
    Result = 0;

    select first 1
        sl.Add_Srv, coalesce(sl.Switch_Time, 0),
        (select
             s.Autooff
           from services s
           where s.Service_Id = :FROM_SRV)
      from Services_Links sl
      where sl.Parent = :FROM_SRV
            and sl.Child = :TO_SRV
            and sl.Link_Type = 6
            and ((sl.Add_Srv = :SWITCH_SRV)
              or (:SWITCH_SRV is null))
    into :Add_Srv, :Switch_Time, :vAutoOff;

    if (vAutoOff is null) then
      vAutoOff = 0;

    if (Add_Srv is not null) then begin

      if (SWITCH_SRV is null) then
        SWITCH_SRV = Add_Srv;

      if (Switch_Time = 1) then begin
        /* 1 - Начало суток */
        vDate = dateadd(day, 1, current_date);
        if (Switch_Date < vDate) then
          Switch_Date = vDate;
      end
      else begin
        if (Switch_Time = 2) then begin
          /* 2 - Начало месяца */
          vDate = dateadd(month, 1, (current_date -extract(day from current_date) + 1));
          if (Switch_Date < vDate) then
            Switch_Date = vDate;

        end
      end

      if (1 = vAutoOff) then begin
        /*
        -- проверим, если хватает денег на остаток дней, то переключим

        select (-1.00 * c.Debt_Sum + coalesce(c.Prepay, 0) )
            ,
            (select
                 sum(iif(coalesce(c.Juridical, 0) = 0, t.Tarif_Sum, t.Tarif_Sum_Jur))
               from Subscr_Serv ss
                    inner join Tarif t on (ss.Serv_Id = t.Service_Id)
               where ss.State_Sgn = 1
                     and ss.Customer_Id = c.Customer_Id
                     and current_date between t.Date_From and t.Date_To)
          from customer c
          where c.Customer_Id = :CUSTOMER_ID
        into :vBlance, :vTarif;
        -- посчитаем сколько примерно в день абонплата
        vDays = extract(day from dateadd(-1 day to(dateadd(1 month to (current_date - extract(day from current_date) + 1)))));
        vTarif = coalesce(vTarif, 0) / vDays; -- в день
        vDays = datediff(day from current_date to Switch_Date);
        vTarif = vTarif * vDays; -- До конца месяца
        -- если не хватает, поставим признак
        if (vBlance < vTarif) then
          vAutoOff = -1;
        */

        -- переключаем только если положительный баланс
        select (-1.00 * c.Debt_Sum + coalesce(c.Prepay, 0) )
          from customer c
          where c.Customer_Id = :CUSTOMER_ID
        into :vBlance;
        if (vBlance < 0 ) then
          vAutoOff = -1;

      end

      if (vAutoOff <> -1) then begin
        execute procedure Onoff_Service_By_Id(:CUSTOMER_ID, :FROM_SRV, :Add_Srv, :SWITCH_DATE, 1, :NOTICE, :UNITS, 0, 0);

        Switch_Time = null;
        select
            ss.State_Sgn, ss.State_Date
          from Subscr_Serv ss
          where ss.Customer_Id = :Customer_Id
                and ss.Serv_Id = :To_Srv
        into :Switch_Time, :vDate;

        /* если услуги у абонента нет, то добавим ее иначе просто включим */
        if (Switch_Time is null) then
          execute procedure Add_Subscr_Service(:Customer_Id, :To_Srv, :Add_Srv, :SWITCH_DATE, :NOTICE, :UNITS, null, null);
        else
          execute procedure Onoff_Service_By_Id(:Customer_Id, :To_Srv, :Add_Srv, :SWITCH_DATE, 0, :NOTICE, :UNITS);
      end
      else
        Result = -3;/* Нет денег на счете */
    end
    else
      Result = -1;/* Не настроена связка переключений услуг */

  end
  else
    Result = -2;/* Услуга уже отключена */
  suspend;
end;
