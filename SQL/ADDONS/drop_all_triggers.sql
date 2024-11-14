execute block
as
declare variable TRIGGER_NAME     char(255);
declare variable RELATION_NAME    char(255);
declare variable TRIGGER_SEQUENCE smallint;
declare variable TRIGGER_TYPE     bigint;
declare variable STN              char(255);
declare variable P_SQL varchar(1000);
begin
  for select
          RDB$TRIGGER_NAME
        , RDB$RELATION_NAME
        , RDB$TRIGGER_SEQUENCE
        , RDB$TRIGGER_TYPE
        from RDB$TRIGGERS
        WHERE coalesce(RDB$SYSTEM_FLAG, 0) = 0
      into :TRIGGER_NAME, :RELATION_NAME, :TRIGGER_SEQUENCE, :TRIGGER_TYPE
  do begin
    /*
    P_SQL = 'ALTER TRIGGER ' || trim(TRIGGER_NAME);
    STN = case TRIGGER_TYPE
            when 1 then ' BEFORE INSERT '
            when 2 then ' AFTER INSERT '
            when 3 then ' BEFORE UPDATE '
            when 4 then ' AFTER UPDATE '
            when 5 then ' BEFORE DELETE '
            when 6 then ' AFTER DELETE '
            when 17 then ' BEFORE INSERT OR UPDATE '    
            when 18 then ' AFTER INSERT OR UPDATE '
            when 28 then ' AFTER UPDATE OR DELETE '
            when 113 then ' BEFORE INSERT OR UPDATE OR DELETE '
            when 114 then ' AFTER INSERT OR UPDATE OR DELETE '
            when 8192 then ' ON CONNECT '
          end;

    if (TRIGGER_TYPE <> 8192) then
     P_SQL = P_SQL || ' FOR ' || trim(RELATION_NAME);

    P_SQL = P_SQL || ' ACTIVE ' || trim(STN) || ' POSITION ' || TRIGGER_SEQUENCE || ' as begin end ';
    */
    P_SQL = 'ALTER TRIGGER ' || trim(TRIGGER_NAME) ||' INACTIVE';
    execute statement :P_SQL;
    P_SQL = '';
  end
end;
commit;

execute block as
declare variable P_NAME varchar(31);
declare variable P_SQL  varchar(255);
begin
  for select
          trim(T.RDB$TRIGGER_NAME)
          from RDB$TRIGGERS T
          where RDB$SYSTEM_FLAG = 0
      into :P_NAME
  do
  begin
    P_SQL = 'DROP TRIGGER ' || :P_NAME;
    execute statement :P_SQL;
  end
end;
commit;