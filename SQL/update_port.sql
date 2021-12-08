set names Utf8;
set Sql Dialect 3;

ALTER TABLE PORT ALTER COLUMN CON_PORT TYPE D_PORT_NS;

UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION) VALUES (0, 60, 'Нерабочий', '') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION) VALUES (1, 60, 'Исправен', '') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION) VALUES (2, 60, 'Отключен', '') MATCHING (O_ID, O_TYPE);
UPDATE OR INSERT INTO OBJECTS (O_ID, O_TYPE, O_NAME, O_DESCRIPTION) VALUES (3, 60, 'Служебный', '') MATCHING (O_ID, O_TYPE);

delete from Port;
commit;

execute block
as
declare variable Eid      integer;
declare variable Port     varchar(5);
declare variable Notice   varchar(1000);
declare variable P_Type   integer;
declare variable P_State  integer;
declare variable i    integer;

begin
  for select
          Eid --  , Name
        from Equipment
        where (upper(name) like '%DES%1100%')
          or (upper(name) like '%MES%1124%')
      into :eid
  do begin
    insert into Port (Eid, Port, P_Type, P_State, speed, NOTICE) values (:Eid, 1, 0, 3, 100, 'netping');
    insert into Port (Eid, Port, P_Type, P_State, speed, NOTICE) values (:Eid, 16, 0, 3, 100, 'следующий комм');
    i = 2;
    while (i < 16) do begin
      insert into Port (Eid, Port, P_Type, P_State, speed) values (:Eid, :i, 0, 1, 100);
      i = i+1;
    end
  end
end;
commit;


execute block
as
declare variable Eid      integer;
declare variable Port     varchar(5);
declare variable Notice   varchar(1000);
declare variable P_Type   integer;
declare variable P_State  integer;
declare variable i    integer;
begin
  for select
          Eid --  , Name
        from Equipment
        where (upper(name) like '%DES%3010%')
          or (upper(name) like '%MES%2308%')
      into :eid
  do begin
    i = 1;
    while (i < 7) do begin
      insert into Port (Eid, Port, P_Type, P_State, speed, NOTICE) values (:Eid, :i, 0, 3, 100, 'на 1100 или 1124'); -- netping
      i = i+1;
    end
    insert into Port (Eid, Port, P_Type, P_State, speed, NOTICE) values (:Eid, 7, 0, 3, 100, 'анализатор ТВ сигнала');
    insert into Port (Eid, Port, P_Type, P_State, speed, NOTICE) values (:Eid, 8, 0, 3, 100, 'netping');
    insert into Port (Eid, Port, P_Type, P_State, speed, NOTICE) values (:Eid, 9, 0, 3, 100, 'snmp агент оптического приёмника');
    insert into Port (Eid, Port, P_Type, P_State, speed, NOTICE) values (:Eid,10, 1, 3, 1000, 'sfp');
  end
end;
commit;


execute block
as
declare variable Customer_Id integer;
declare variable Port        integer;
declare variable Eq_Id       integer;
begin
  for select
          l.Eq_Id
        , l.Port
        , l.Customer_Id
        from tv_lan l
        where not l.Eq_Id is null
              and not l.Port is null
              and not l.Customer_Id is null
      into :Eq_Id, :Port, :Customer_Id
  do
    update or insert into Port (Eid, Port, Con, Con_Id) values (:Eq_Id, :Port, 1, :Customer_Id) matching (Eid, Port);
end;
commit;
