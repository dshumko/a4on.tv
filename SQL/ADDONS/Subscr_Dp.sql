SET SQL DIALECT 3;

CREATE TABLE SUBSCR_DP (
    CUSTOMER_ID     UID,
    SERV_ID         UID,
    SUBSCR_SERV_ID  UID,
    DATE_FROM       D_DATE_NOW DEFAULT '1900-01-01' NOT NULL,
    DATE_TO         D_DATE DEFAULT '2100-01-01' NOT NULL,
    DISACT_SERV_ID  D_UID_NULL,
    ACT_SERV_ID     D_UID_NULL
);
CREATE INDEX SUBSCR_DP_CID ON SUBSCR_DP (CUSTOMER_ID);
COMMENT ON TABLE SUBSCR_DP IS 'Таблица периодов отключения услуги у абонента';

execute block
as
declare variable Customer_Id    integer;
declare variable Serv_Id        integer;
declare variable Subscr_Serv_Id integer;
declare variable Date_From      date;
declare variable Date_To        date;
declare variable Act_Serv_Id    integer;
declare variable Disact_Serv_Id integer;
declare variable DF             date;
declare variable DT             date;
declare variable PS             integer;
begin

  for select
          c.Customer_Id
        from customer c
      into :Customer_Id
  do begin
    PS = -9999;
    for select
            Serv_Id
          , Subscr_Serv_Id
          , Date_From
          , Date_To
          , Act_Serv_Id
          , Disact_Serv_Id
          from Subscr_Hist h
          where h.Customer_Id = :Customer_Id
          order by h.Serv_Id, h.Date_From
        into :Serv_Id, :Subscr_Serv_Id, :Date_From, :Date_To, :Act_Serv_Id, :Disact_Serv_Id
    do begin
      DT = dateadd(day, -1, Date_From);
      if (Serv_Id <> PS) then begin
        DF = '1900-01-01';
        insert into Subscr_Dp (Customer_Id, Serv_Id, Subscr_Serv_Id, Date_From, Date_To, Act_Serv_Id, Disact_Serv_Id)
        values (:Customer_Id, :Serv_Id, :Subscr_Serv_Id, :DF, :DT, :Act_Serv_Id, -1);
      end
      else begin
        update Subscr_Dp
          set Date_To = :DT
        where Customer_Id = :Customer_Id and Serv_Id = :Serv_Id and Subscr_Serv_Id = :Subscr_Serv_Id and Date_To = '2100-01-01';
      end
      if (Date_TO <> '2100-01-01') then begin
        DF = dateadd(day, 1, Date_TO);
        DT = '2100-01-01';
        insert into Subscr_Dp (Customer_Id, Serv_Id, Subscr_Serv_Id, Date_From, Date_To, Act_Serv_Id, Disact_Serv_Id)
        values (:Customer_Id, :Serv_Id, :Subscr_Serv_Id, :DF, :DT, :Act_Serv_Id, :Disact_Serv_Id);
      end

      PS = Serv_Id;
    end
  end
end;
commit;
