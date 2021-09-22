-- блок для создания процедуры логирования изменений
execute block (
    ATable   varchar(31) = :FOR_TABLE, -- для какой таблицы делаем триггер
    AIdField varchar(31) = :ID_Field   -- уникальное поле таблицы
    )
returns (
    SQL_TEXT blob sub_type TEXT)
as
declare variable EOL          char(2);
declare variable PK_FIELDNAME varchar(31);
declare variable FIELD_NAME   varchar(31);
begin
  ATable = upper(trim(ATable));
  AIdField = upper(trim(AIdField));
  EOL = ascii_char(13) || ascii_char(10);
  SQL_TEXT = 'CREATE TRIGGER TR_' || ATable || '_CHANGELOG_AU FOR ' || ATable || EOL;
  SQL_TEXT = SQL_TEXT || 'ACTIVE AFTER UPDATE POSITION 0 AS BEGIN' || EOL;

  for select
          R.RDB$FIELD_NAME
        from RDB$FIELDS F
             inner join RDB$RELATION_FIELDS R on (F.RDB$FIELD_NAME = R.RDB$FIELD_SOURCE)
        where R.RDB$RELATION_NAME = :ATable
              and R.RDB$SYSTEM_FLAG = 0
              and R.RDB$FIELD_NAME <> :AIdField
        order by R.RDB$FIELD_POSITION
      into :FIELD_NAME
  do begin
    FIELD_NAME = trim(FIELD_NAME);
    SQL_TEXT = SQL_TEXT || '  IF (NEW.' || :FIELD_NAME || ' IS DISTINCT FROM OLD.' || :FIELD_NAME || ') THEN' || EOL;
    SQL_TEXT = SQL_TEXT || '    insert into CHANGELOG ( LOG_GROUP, OBJECT_TYPE, OBJECT_ID, PARAM, VALUE_BEFORE, VALUE_AFTER)' || EOL;
    SQL_TEXT = SQL_TEXT || '    values (''' || :ATable || ''', 0, NEW.' || :AIdField || ', ''' || :FIELD_NAME || ''', OLD.' || :FIELD_NAME || ', NEW.' || :FIELD_NAME || ');' || EOL;
  end
  SQL_TEXT = SQL_TEXT || 'END' || EOL;
  suspend;
end
