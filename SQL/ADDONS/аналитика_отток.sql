execute block (
    SBEGIN date = :SBEGIN,
    MCOUNT integer = :MCOUNT)
returns (
    M       D_DATE,
    account D_Account,
    -- подключен. не меняли услугу.
    nc      D_Integer,
    -- подключились
    pr      D_INTEGER,
    -- переключились
    sw      D_INTEGER,
    -- блок на начало
    bb      D_Integer,
    -- блок на конец
    be      D_Integer,
    oz      D_INTEGER,
    od      D_INTEGER,
    -- активный абонент
    aa      D_INTEGER,
    -- нет услуш
    nu      D_INTEGER,
    ab      D_INTEGER)
as
declare variable I       integer;
declare variable CI      integer;
declare variable C       integer;
declare variable BT      integer;
declare variable B       date;
declare variable E       date;
declare variable balance D_N15_2;
begin
  /*
Приток абонентов перв
Приток абонентов повт
Отток абонентов - пришли в офис
Отток абонентов - перестали оплачивать услуги
Количество активных абонентов
В авто блокировке
*/


  BT = 3;
  B = SBEGIN - extract(day from SBEGIN) + 1;
  I = 0;
  while (I < MCOUNT) do begin
    E = dateadd(-1 day to(dateadd(1 month to B)));

  pr = 0;
  nc = 0;
  sw = 0;
  oz = 0;
  od = 0;
  aa = 0;
  ab = 0;
  bb = 0;
  be = 0;
  nu = 0;

    for select
            customer_id
           -- , Account_No
          from customer
          -- where Customer_Id = 8055
        into :ci -- , :account
    do begin
      if (not account is null) then begin
        pr = 0;
        nc = 0;
        sw = 0;
        oz = 0;
        od = 0;
        aa = 0;
        ab = 0;
        bb = 0;
        be = 0;
        nu = 0;
      end
      -- нет услуг
      if (not exists(select
                         p.Customer_Id
                       from subscr_hist p
                            inner join services s on (p.Serv_Id = s.Service_Id and
                                  s.Business_Type = :BT)
                       where p.Customer_Id = :ci)) then
        nu = nu + 1;
      else begin
        -- активный абонент
        if (exists(select
                       p.Customer_Id
                     from subscr_hist p
                          inner join services s on (p.Serv_Id = s.Service_Id and
                                s.Business_Type = :BT)
                     where p.Customer_Id = :ci
                           and (p.Date_From + 0) < :b
                           and (p.Date_To + 0) > :e)) then
          nc = nc + 1;
        else begin
          -- был на одном, ушел на другой
          if (exists(select
                         p.Customer_Id
                       from subscr_hist p
                            inner join services s on (p.Serv_Id = s.Service_Id and
                                  s.Business_Type = :BT)
                       where p.Customer_Id = :ci
                             and (p.Date_to + 0) between :b and :e
                             and (exists(select
                                             o.Customer_Id
                                           from subscr_hist o
                                                inner join services s on (o.Serv_Id = s.Service_Id and
                                                      s.Business_Type = :BT)
                                           where o.Customer_Id = p.Customer_Id
                                                 and p.Serv_Id <> o.Serv_Id
                                                 and (o.Date_From + 0) = dateadd(day, 1, p.Date_to))))) then
            sw = sw + 1;
          else begin
            -- новый абонент
            if (exists(select
                           p.Customer_Id
                         from subscr_hist p
                              inner join services s on (p.Serv_Id = s.Service_Id and
                                    s.Business_Type = :BT)
                         where p.Customer_Id = :ci
                               and (p.Date_From + 0) between :B and :e
                               and not exists(select
                                                  o.Customer_Id
                                                from subscr_hist o
                                                where (o.Date_From + 0) < :B
                                                      and o.Customer_Id = p.Customer_Id))) then
              pr = pr + 1;
            else begin
              -- отключился
              if (exists(select
                             p.Customer_Id
                           from subscr_hist p
                                inner join services s on (p.Serv_Id = s.Service_Id and
                                      s.Business_Type = :BT)
                           where p.Customer_Id = :ci
                                 and (p.Disact_Serv_Id <> -3)
                                 and (p.Date_to + 0) between :B and :e
                                 and not exists(select
                                                    o.Customer_Id
                                                  from subscr_hist o
                                                       inner join services s on (o.Serv_Id = s.Service_Id and
                                                             s.Business_Type = :BT)
                                                  where o.Customer_Id = p.Customer_Id
                                                        and dateadd(day, 1, :E) between(o.Date_From + 0) and (o.Date_to+0)))) then begin
                select
                    coalesce(SP, 0) - coalesce(SF, 0) - coalesce(SOF, 0)
                  from (select (
                            select
                                sum(Pay_Sum)
                              from payment
                              where Pay_Date < :B
                                    and Customer_Id = :ci) SP
                          ,
                            (select
                                 sum(Fee)
                               from Monthly_Fee
                               where Month_Id < :B
                                     and Customer_Id = :ci) SF
                          ,
                            (select
                                 sum(Fee)
                               from other_Fee r
                               where Fee_Date < :B
                                     and Customer_Id = :ci) SOF
                          from Rdb$database)
                into :balance;
                if (balance >= 0) then
                  oz = oz + 1;
                else
                  od = od + 1;
              end
              else begin
                -- блок на начало
                if (exists(select
                               p.Customer_Id
                             from subscr_hist p
                                  inner join services s on (p.Serv_Id = s.Service_Id and
                                        s.Business_Type = :BT)
                             where p.Customer_Id = :ci
                                   and (p.Disact_Serv_Id = -3)
                                   and (exists(select
                                                   d.Customer_Id
                                                 from Subscr_Dp d
                                                 where d.Customer_Id = p.Customer_Id
                                                       and d.Serv_Id = p.Serv_Id
                                                       and :b between d.Date_From and d.Date_To)))) then
                  bb = bb + 1;
                else begin
                  -- блок на конец
                  if (exists(select
                                 p.Customer_Id
                               from subscr_hist p
                                    inner join services s on (p.Serv_Id = s.Service_Id and
                                          s.Business_Type = :BT)
                               where p.Customer_Id = :ci
                                     and (p.Disact_Serv_Id = -3)
                                     and (exists(select
                                                     d.Customer_Id
                                                   from Subscr_Dp d
                                                   where d.Customer_Id = p.Customer_Id
                                                         and d.Serv_Id = p.Serv_Id
                                                         and :e between d.Date_From and d.Date_To)))) then
                    be = be + 1;
                  else begin
                    -- активный абонент
                    if (exists(select
                                   p.Customer_Id
                                 from subscr_hist p
                                      inner join services s on (p.Serv_Id = s.Service_Id and
                                            s.Business_Type = :BT)
                                 where p.Customer_Id = :ci
                                       and :b between (p.Date_From + 0) and (p.Date_To + 0))) then
                      aa = aa + 1;
                    else begin
                      ab = ab + 1;
                    end
                  end
                end
              end
            end
          end
        end
      end
      if (not account is null) then begin
        M = B;
        suspend;
      end

    end

    if (account is null) then begin
      M = B;
      suspend;
    end

    I = I + 1;
    B = dateadd(1 month to B);
  end
end