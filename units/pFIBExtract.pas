{ ************************************************* }
{ FIBPlus Script, version 1.9 }
{ Copyright by Nikolay Trifonov, 2003-2007 }
{ E-mail: t_nick@mail.ru }
{ ************************************************* }

unit pFIBExtract;

interface

uses
  SysUtils, Classes, pFIBDatabase, pFIBQuery, FIB, IB_Externals,
  ibase, StrUtil, StdFuncs;

type
  TExtractObjectTypes = (eoDatabase, eoDomain, eoTable, eoView, eoProcedure, eoFunction, eoGenerator, eoException,
    eoBLOBFilter, eoRole, eoTrigger, eoForeign, eoIndexes, eoChecks, eoData);

  TExtractType = (etDomain, etTable, etRole, etTrigger, etForeign, etIndex, etData, etGrant, etCheck, etAlterProc);

  TExtractTypes = Set of TExtractType;

  TExtractOption = (CreateDb, Filters, Functions, Domains, AllTables, Index, Foreigns, Generators, Views, Checks,
    Exceptions, Procedures, Triggers, Grants, Describes);

  TExtractOptions = set of TExtractOption;

  TpFIBExtract = class(TComponent)
  private
    FDatabase: TpFIBDatabase;
    FTransaction: TpFIBTransaction;
    FMetaData: TStrings;
    FShowSystem: Boolean;
    FIncludeSetTerm: Boolean;
    FExtractOptions: TExtractOptions;
    { Private declarations }
    function GetDatabase: TpFIBDatabase;
    function GetIndexSegments(const indexname: String): String;
    function GetTransaction: TpFIBTransaction;
    procedure SetDatabase(const Value: TpFIBDatabase);
    procedure SetTransaction(const Value: TpFIBTransaction);
    function PrintValidation(ToValidate: String; flag: Boolean): String;
    procedure ShowGrants(const MetaObject, Terminator: String);
    procedure ShowGrantRoles(const Terminator: String);
    procedure GetProcedureArgs(const Proc: String);
    function GetFieldLength(sql: TpFIBQuery): Integer;
    function CreateFIBQuery: TpFIBQuery;
    function TriggerTypeName(Value: Integer): string;
  protected
    function ExtractDDL(const flag: Boolean; const TableName: String): Boolean;
    function ExtractListTable(const RelationName, NewName: String; const DomainFlag: Boolean): Boolean;
    procedure ExtractListView(const ViewName: String);
    procedure ListData(const ObjectName: String);
    procedure ListRoles(const ObjectName: String = ''); { do not localize }
    procedure ListGrants;
    procedure ListProcs(const ProcedureName: String = ''; AlterOnly: Boolean = false); { do not localize }
    procedure ListAllTables(flag: Boolean);
    procedure ListTriggers(const ObjectName: String = ''; ExtractType: TExtractType = etTrigger); { do not localize }
    procedure ListCheck(const ObjectName: String = ''; ExtractType: TExtractType = etCheck); { do not localize }
    function PrintSet(var Used: Boolean): String;
    procedure ListCreateDb(TargetDb: String = ''); { do not localize }
    procedure ListDomains(const ObjectName: String = ''; ExtractType: TExtractType = etDomain); { do not localize }
    procedure ListException(const ExceptionName: String = ''); { do not localize }
    procedure ListFilters(const FilterName: String = ''); { do not localize }
    procedure ListForeign(const ObjectName: String = ''; ExtractType: TExtractType = etForeign); { do not localize }
    procedure ListFunctions(const FunctionName: String = ''); { do not localize }
    procedure ListGenerators(const GeneratorName: String = ''); { do not localize }
    procedure ListIndex(const ObjectName: String = ''; ExtractType: TExtractType = etIndex); { do not localize }
    procedure ListViews(const ViewName: String = ''); { do not localize }
    procedure ListDescribes(const DescribeName: String = ''; const DescribeFieldName: String = ''); { do not localize }

    { Protected declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetArrayField(const FieldName: String): String;
    function GetFieldType(FieldType, FieldSubType, FieldScale, FieldSize, FieldPrec, FieldLen: Integer): String;
    function GetCharacterSets(CharSetId, Collation: Short; CollateOnly: Boolean): String;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ExtractObject(ObjectType: TExtractObjectTypes; const ObjectName: String = ''; { do not localize }
      ExtractTypes: TExtractTypes = []);
    property Items: TStrings read FMetaData;

  published
    { Published declarations }
    property Database: TpFIBDatabase read GetDatabase write SetDatabase;
    property Transaction: TpFIBTransaction read GetTransaction write SetTransaction;
    property ShowSystem: Boolean read FShowSystem write FShowSystem default false;
    property IncludeSetTerm: Boolean read FIncludeSetTerm write FIncludeSetTerm Default false;
    property ExtractOptions: TExtractOptions read FExtractOptions write FExtractOptions;
  end;

  TSQLType = record
    SqlType: Integer;
    TypeName: String;
  end;

  TPrivTypes = record
    PrivFlag: Integer;
    PrivString: String;
  end;

  TSQLTypes = Array [0 .. 13] of TSQLType;

const

  priv_UNKNOWN = 1;
  priv_SELECT = 2;
  priv_INSERT = 4;
  priv_UPDATE = 8;
  priv_DELETE = 16;
  priv_EXECUTE = 32;
  priv_REFERENCES = 64;

  PrivTypes: Array [0 .. 5] of TPrivTypes = ((PrivFlag: priv_DELETE; PrivString: 'DELETE'), { do not localize }
    (PrivFlag: priv_EXECUTE; PrivString: 'EXECUTE'), { do not localize }
    (PrivFlag: priv_INSERT; PrivString: 'INSERT'), { do not localize }
    (PrivFlag: priv_SELECT; PrivString: 'SELECT'), { do not localize }
    (PrivFlag: priv_UPDATE; PrivString: 'UPDATE'), { do not localize }
    (PrivFlag: priv_REFERENCES; PrivString: 'REFERENCES')); { do not localize }

  ColumnTypes: TSQLTypes = ((SqlType: blr_short; TypeName: 'SMALLINT'), { do not localize }
    (SqlType: blr_long; TypeName: 'INTEGER'), { do not localize }
    (SqlType: blr_quad; TypeName: 'QUAD'), { do not localize }
    (SqlType: blr_float; TypeName: 'FLOAT'), { do not localize }
    (SqlType: blr_text; TypeName: 'CHAR'), { do not localize }
    (SqlType: blr_double; TypeName: 'DOUBLE PRECISION'), { do not localize }
    (SqlType: blr_varying; TypeName: 'VARCHAR'), { do not localize }
    (SqlType: blr_cstring; TypeName: 'CSTRING'), { do not localize }
    (SqlType: blr_blob_id; TypeName: 'BLOB_ID'), { do not localize }
    (SqlType: blr_blob; TypeName: 'BLOB'), { do not localize }
    (SqlType: blr_sql_time; TypeName: 'TIME'), { do not localize }
    (SqlType: blr_sql_date; TypeName: 'DATE'), { do not localize }
    (SqlType: blr_timestamp; TypeName: 'TIMESTAMP'), { do not localize }
    (SqlType: blr_int64; TypeName: 'INT64')); // ?,       {do not localize}
  // ?    (SqlType : blr_boolean_dtype; TypeName : 'BOOLEAN'));  {do not localize}

  SubTypes: Array [0 .. 8] of String = ('UNKNOWN', { do not localize }
    'TEXT', { do not localize }
    'BLR', { do not localize }
    'ACL', { do not localize }
    'RANGES', { do not localize }
    'SUMMARY', { do not localize }
    'FORMAT', { do not localize }
    'TRANSACTION_DESCRIPTION', { do not localize }
    'EXTERNAL_FILE_DESCRIPTION'); { do not localize }

  TriggerTypes: Array [0 .. 6] of String = ('', { do not localize }
    'BEFORE INSERT', { do not localize }
    'AFTER INSERT', { do not localize }
    'BEFORE UPDATE', { do not localize }
    'AFTER UPDATE', { do not localize }
    'BEFORE DELETE', { do not localize }
    'AFTER DELETE'); { do not localize }

  IntegralSubtypes: Array [0 .. 2] of String = ('UNKNOWN', { do not localize }
    'NUMERIC', { do not localize }
    'DECIMAL'); { do not localize }

  ODS_VERSION6 = 6; { on-disk structure as of v3.0 }
  ODS_VERSION7 = 7; { new on disk structure for fixing index bug }
  ODS_VERSION8 = 8; { new btree structure to support pc semantics }
  ODS_VERSION9 = 9; { btree leaf pages are always propogated up }
  ODS_VERSION10 = 10; { V6.0 features. SQL delimited idetifier,
    SQLDATE, and 64-bit exact numeric
    type }

  { flags for RDB$FILE_FLAGS }
  FILE_shadow = 1;
  FILE_inactive = 2;
  FILE_manual = 4;
  FILE_cache = 8;
  FILE_conditional = 16;

  { flags for RDB$LOG_FILES }
  LOG_serial = 1;
  LOG_default = 2;
  LOG_raw = 4;
  LOG_overflow = 8;

  MAX_INTSUBTYPES = 2;
  MAXSUBTYPES = 8; { Top of subtypes array }

  { Object types used in RDB$DEPENDENCIES and RDB$USER_PRIVILEGES }

  obj_relation = 0;
  obj_view = 1;
  obj_trigger = 2;
  obj_computed = 3;
  obj_validation = 4;
  obj_procedure = 5;
  obj_expression_index = 6;
  obj_exception = 7;
  obj_user = 8;
  obj_field = 9;
  obj_index = 10;
  obj_count = 11;
  obj_user_group = 12;
  obj_sql_role = 13;

implementation

const
  NEWLINE = #13#10; { do not localize }
  TERM = ';'; { do not localize }
  ProcTerm = '^'; { do not localize }
  TAB = #9; { do not localize }

  CollationSQL = 'SELECT CST.RDB$CHARACTER_SET_NAME, COL.RDB$COLLATION_NAME, CST.RDB$DEFAULT_COLLATE_NAME ' +
  { do not localize }
    'FROM RDB$COLLATIONS COL JOIN RDB$CHARACTER_SETS CST ON ' + { do not localize }
    '  COL.RDB$CHARACTER_SET_ID = CST.RDB$CHARACTER_SET_ID ' + { do not localize }
    'WHERE ' + { do not localize }
    '  COL.RDB$COLLATION_ID = :COLLATION AND ' + { do not localize }
    '  CST.RDB$CHARACTER_SET_ID = :CHAR_SET_ID ' + { do not localize }
    'ORDER BY COL.RDB$COLLATION_NAME, CST.RDB$CHARACTER_SET_NAME'; { do not localize }

  NonCollationSQL = 'SELECT CST.RDB$CHARACTER_SET_NAME ' + { do not localize }
    'FROM RDB$CHARACTER_SETS CST ' + { do not localize }
    'WHERE CST.RDB$CHARACTER_SET_ID = :CHARSETID ' + { do not localize }
    'ORDER BY CST.RDB$CHARACTER_SET_NAME'; { do not localize }

  PrecisionSQL = 'SELECT * FROM RDB$FIELDS ' + { do not localize }
    'WHERE RDB$FIELD_NAME = :FIELDNAME'; { do not localize }

  ArraySQL = 'SELECT * FROM RDB$FIELD_DIMENSIONS FDIM ' + { do not localize }
    'WHERE ' + { do not localize }
    '  FDIM.RDB$FIELD_NAME = :FIELDNAME ' + { do not localize }
    'ORDER BY FDIM.RDB$DIMENSION'; { do not localize }

  { TIBExtract }

  { ArrayDimensions
    Functional description
    Retrieves the dimensions of arrays and prints them.

    Parameters:  fieldname -- the actual name of the array field }

function TpFIBExtract.GetArrayField(const FieldName: String): String;
var
  qryArray: TpFIBQuery;
begin
  qryArray := CreateFIBQuery;
  Result := '['; { do not localize }
  qryArray.sql.Add(ArraySQL);
  qryArray.ParamByName('FieldName').AsString := trim(FieldName); { do not localize }
  qryArray.ExecQuery;

  { Format is [lower:upper, lower:upper,..] }

  while not qryArray.Eof do
  begin
    if (qryArray.FieldByName('RDB$DIMENSION').AsInteger > 0) then { do not localize }
      Result := Result + ', '; { do not localize }
    Result := Result + trim(qryArray.FieldByName('RDB$LOWER_BOUND').AsString) + ':' + { do not localize }
      trim(qryArray.FieldByName('RDB$UPPER_BOUND').AsString); { do not localize }
    qryArray.Next;
  end;

  Result := Result + '] '; { do not localize }
  qryArray.Free;

end;

constructor TpFIBExtract.Create(AOwner: TComponent);
begin
  inherited;
  FMetaData := TStringList.Create;
  FExtractOptions := FExtractOptions + [CreateDb, Filters, Functions, Domains, AllTables, Index, Foreigns, Generators,
    Views, Checks, Exceptions, Procedures, Triggers, Grants { ,Describes } ];
  if AOwner is TpFIBDatabase then
    Database := TpFIBDatabase(AOwner);
  if AOwner is TpFIBTransaction then
    Transaction := TpFIBTransaction(AOwner);
end;

destructor TpFIBExtract.Destroy;
begin
  FMetaData.Free;
  inherited;
end;

function TpFIBExtract.ExtractDDL(const flag: Boolean; const TableName: String): Boolean;
var
  DidConnect: Boolean;
  DidStart: Boolean;
begin
  Result := true;
  DidConnect := false;
  DidStart := false;

  if not FDatabase.Connected then
  begin
    FDatabase.Connected := true;
    DidConnect := true;
  end;

  FMetaData.Add(Format('SET SQL DIALECT %d;', [FDatabase.SQLDialect])); { do not localize }
  FMetaData.Add('');

  if not FTransaction.Active then
  begin
    FTransaction.StartTransaction;
    DidStart := true;
  end;

  if TableName <> '' then
  begin
    if not ExtractListTable(TableName, '', true) then
      Result := false;
  end
  else
  begin
    if (CreateDb in ExtractOptions) then
      ListCreateDb;
    if (Filters in ExtractOptions) then
      ListFilters;
    if (Functions in ExtractOptions) then
      ListFunctions;
    if (Domains in ExtractOptions) then
      ListDomains;
    if (AllTables in ExtractOptions) then
      ListAllTables(flag);
    if (Index in ExtractOptions) then
      ListIndex;
    if (Foreigns in ExtractOptions) then
      ListForeign;
    if (Generators in ExtractOptions) then
      ListGenerators;
    if (Views in ExtractOptions) then
      ListViews;
    if (Checks in ExtractOptions) then
      ListCheck;
    if (Exceptions in ExtractOptions) then
      ListException;
    if (Procedures in ExtractOptions) then
      ListProcs;
    if (Triggers in ExtractOptions) then
      ListTriggers;
    if (Grants in ExtractOptions) then
      ListGrants;
    if (Describes in ExtractOptions) then
      ListDescribes;
  end;

  if DidStart then
    FTransaction.Commit;

  if DidConnect then
    FDatabase.Connected := false;
end;

{ ExtractListTable
  Functional description
  Shows columns, types, info for a given table name
  and text of views.
  If a new_name is passed, substitute it for relation_name

  relation_name -- Name of table to investigate
  new_name -- Name of a new name for a replacement table
  domain_flag -- extract needed domains before the table }

function TpFIBExtract.ExtractListTable(const RelationName, NewName: String; const DomainFlag: Boolean): Boolean;
const
  TableListSQL = 'SELECT * FROM RDB$RELATIONS REL JOIN RDB$RELATION_FIELDS RFR ON ' + { Do Not Localize }
    '  RFR.RDB$RELATION_NAME = REL.RDB$RELATION_NAME JOIN RDB$FIELDS FLD ON ' + { do not localize }
    '  RFR.RDB$FIELD_SOURCE = FLD.RDB$FIELD_NAME ' + { do not localize }
    'WHERE REL.RDB$RELATION_NAME = :RelationName ' + { do not localize }
    'ORDER BY RFR.RDB$FIELD_POSITION, RFR.RDB$FIELD_NAME'; { do not localize }

  ConstraintSQL = 'SELECT RCO.RDB$CONSTRAINT_NAME, RDB$CONSTRAINT_TYPE, RDB$RELATION_NAME, ' + { do not localize }
    'RDB$DEFERRABLE, RDB$INITIALLY_DEFERRED, RDB$INDEX_NAME, RDB$TRIGGER_NAME ' + { do not localize }
    'FROM RDB$RELATION_CONSTRAINTS RCO, RDB$CHECK_CONSTRAINTS CON ' + { do not localize }
    'WHERE ' + { do not localize }
    '  CON.RDB$TRIGGER_NAME = :FIELDNAME AND ' + { do not localize }
    '  CON.RDB$CONSTRAINT_NAME = RCO.RDB$CONSTRAINT_NAME AND ' + { do not localize }
    '  RCO.RDB$CONSTRAINT_TYPE = ''NOT NULL'' AND ' + { do not localize }
    '  RCO.RDB$RELATION_NAME = :RELATIONNAME'; { do not localize }

  RelConstraintsSQL = 'SELECT * FROM RDB$RELATION_CONSTRAINTS RELC ' + { do not localize }
    'WHERE ' + { do not localize }
    '  (RELC.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'' OR ' + { do not localize }
    '  RELC.RDB$CONSTRAINT_TYPE = ''UNIQUE'') AND ' + { do not localize }
    '  RELC.RDB$RELATION_NAME = :RELATIONNAME ' + { do not localize }
    'ORDER BY RELC.RDB$CONSTRAINT_NAME'; { do not localize }

var
  Collation, CharSetId: Short;
  i: Short;
  ColList, Column, Constraint: String;
  SubType: Short;
  IntChar: Short;
  qryTables, qryPrecision, qryConstraints, qryRelConstraints: TpFIBQuery;
  PrecisionKnown, ValidRelation: Boolean;
  FieldScale, FieldType: Integer;
  TABLE_TYPE: Integer;
begin
  Result := true;
  ColList := ''; { do not localize }
  IntChar := 0;
  ValidRelation := false;

  if DomainFlag then
    ListDomains(RelationName);
  qryTables := CreateFIBQuery;
  qryPrecision := CreateFIBQuery;
  qryConstraints := CreateFIBQuery;
  qryRelConstraints := CreateFIBQuery;
  try
    qryTables.sql.Add(TableListSQL);
    qryTables.ParamByName('RelationName').AsString := trim(RelationName); { do not localize }
    qryTables.ExecQuery;
    qryPrecision.sql.Add(PrecisionSQL);
    qryConstraints.sql.Add(ConstraintSQL);
    qryRelConstraints.sql.Add(RelConstraintsSQL);
    TABLE_TYPE := 0;
    if not qryTables.Eof then
    begin
      ValidRelation := true;
      TABLE_TYPE := qryTables.FieldByName('RDB$RELATION_TYPE').AsInteger;
      if (not qryTables.FieldByName('RDB$OWNER_NAME').IsNull) and { do not localize }
        (trim(qryTables.FieldByName('RDB$OWNER_NAME').AsString) <> '') then { do not localize }
        FMetaData.Add(Format('%s/* Table: %s, Owner: %s */%s', { do not localize }
          [NEWLINE, RelationName, trim(qryTables.FieldByName('RDB$OWNER_NAME').AsString), NEWLINE]));
      { do not localize }
      if NewName <> '' then { do not localize }
      begin
        if TABLE_TYPE in [4, 5] then
          FMetaData.Add(Format('CREATE GLOBAL TEMPORARY TABLE %s ', [FormatIdentifier(FDatabase.SQLDialect, NewName)]))
          { do not localize }
        else
          FMetaData.Add(Format('CREATE TABLE %s ', [FormatIdentifier(FDatabase.SQLDialect, NewName)]))
          { do not localize }
      end
      else
      begin
        if TABLE_TYPE in [4, 5] then
          FMetaData.Add(Format('CREATE GLOBAL TEMPORARY TABLE %s ',
            [FormatIdentifier(FDatabase.SQLDialect, RelationName)])) { do not localize }
        else
          FMetaData.Add(Format('CREATE TABLE %s ', [FormatIdentifier(FDatabase.SQLDialect, RelationName)]))
          { do not localize }
      end;
      if not qryTables.FieldByName('RDB$EXTERNAL_FILE').IsNull then { do not localize }
        FMetaData.Add(Format('EXTERNAL FILE %s ', { do not localize }
          [QuotedStr(trim(qryTables.FieldByName('RDB$EXTERNAL_FILE').AsString))])); { do not localize }
      FMetaData.Add('(');
    end;

    while not qryTables.Eof do
    begin
      Column := '  ' + FormatIdentifier(FDatabase.SQLDialect, trim(qryTables.FieldByName('RDB$FIELD_NAME').AsString)) +
        TAB; { do not localize }

      { Check first for computed fields, then domains.
        If this is a known domain, then just print the domain rather than type
        Domains won't have length, array, or blob definitions, but they
        may have not null, default and check overriding their definitions }

      if not qryTables.FieldByName('rdb$computed_blr').IsNull then { do not localize }
      begin
        Column := Column + ' COMPUTED BY '; { do not localize }
        if not qryTables.FieldByName('RDB$COMPUTED_SOURCE').IsNull then { do not localize }
          Column := Column + PrintValidation(trim(qryTables.FieldByName('RDB$COMPUTED_SOURCE').AsString), true);
        { do not localize }
      end
      else
      begin
        FieldType := qryTables.FieldByName('RDB$FIELD_TYPE').AsInteger; { do not localize }
        FieldScale := qryTables.FieldByName('RDB$FIELD_SCALE').AsInteger; { do not localize }
        if not((Copy(trim(qryTables.FieldByName('RDB$FIELD_NAME1').AsString), 1, 4) = 'RDB$') and { do not localize }
          CharInSet(trim(qryTables.FieldByName('RDB$FIELD_NAME1').AsString)[5], ['0' .. '9'])) and { do not localize }
          (qryTables.FieldByName('RDB$SYSTEM_FLAG').AsInteger <> 1) then { do not localize }
        begin
          Column := Column + FormatIdentifier(FDatabase.SQLDialect,
            trim(qryTables.FieldByName('RDB$FIELD_NAME1').AsString)); { do not localize }
          { International character sets }
          if (qryTables.FieldByName('RDB$FIELD_TYPE').AsInteger in [blr_text, blr_varying]) { do not localize }
            and (not qryTables.FieldByName('RDB$COLLATION_ID').IsNull) { do not localize }
            and (qryTables.FieldByName('RDB$COLLATION_ID').AsShort <> 0) then { do not localize }
            IntChar := 1;
        end
        else
        begin
          { Look through types array }
          for i := High(ColumnTypes) downto Low(ColumnTypes) do
          begin
            PrecisionKnown := false;
            if qryTables.FieldByName('RDB$FIELD_TYPE').AsShort = ColumnTypes[i].SqlType then { do not localize }
            begin

              if FDatabase.ODSMajorVersion >= ODS_VERSION10 then
              begin
                { Handle Integral subtypes NUMERIC and DECIMAL }
                if qryTables.FieldByName('RDB$FIELD_TYPE').AsShort in { do not localize }
                  [blr_short, blr_long, blr_int64] then
                begin
                  qryPrecision.ParamByName('FIELDNAME').AsString := { do not localize }
                    trim(qryTables.FieldByName('RDB$FIELD_NAME1').AsString); { do not localize }
                  qryPrecision.ExecQuery;

                  { We are ODS >= 10 and could be any Dialect }
                  if not qryPrecision.FieldByName('RDB$FIELD_PRECISION').IsNull then { do not localize }
                  begin
                    { We are Dialect >=3 since FIELD_PRECISION is non-NULL }
                    if (qryPrecision.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger > 0) and { do not localize }
                      (qryPrecision.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger <= MAX_INTSUBTYPES)
                    then { do not localize }
                    begin
                      Column := Column + Format('%s(%d, %d)', { do not localize }
                        [IntegralSubtypes[qryPrecision.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger], { do not localize }
                        qryPrecision.FieldByName('RDB$FIELD_PRECISION').AsInteger, { do not localize }
                        -qryPrecision.FieldByName('RDB$FIELD_SCALE').AsInteger]); { do not localize }
                      PrecisionKnown := true;
                    end;
                  end;
                  qryPrecision.Close;
                end;
              end;

              if PrecisionKnown = false then
              begin
                { Take a stab at numerics and decimals }
                if (FieldType = blr_short) and (FieldScale < 0) then
                  Column := Column + Format('NUMERIC(4, %d)', [-FieldScale]) { do not localize }
                else if (FieldType = blr_long) and (FieldScale < 0) then
                  Column := Column + Format('NUMERIC(9, %d)', [-FieldScale]) { do not localize }
                else if (FieldType = blr_double) and (FieldScale < 0) then
                  Column := Column + Format('NUMERIC(15, %d)', [-FieldScale]) { do not localize }
                else
                  Column := Column + ColumnTypes[i].TypeName;
              end;
            end;
          end;
          if FieldType in [blr_text, blr_varying] then
            Column := Column + Format('(%d)', [GetFieldLength(qryTables)]); { do not localize }

          { Catch arrays after printing the type }

          if not qryTables.FieldByName('RDB$DIMENSIONS').IsNull then { do not localize }
            Column := Column + GetArrayField(trim(qryTables.FieldByName('RDB$FIELD_NAME1').AsString));
          { do not localize }

          if FieldType = blr_blob then
          begin
            SubType := qryTables.FieldByName('RDB$FIELD_SUB_TYPE').AsShort; { do not localize }
            Column := Column + ' SUB_TYPE '; { do not localize }
            if (SubType > 0) and (SubType <= MAXSUBTYPES) then
              Column := Column + SubTypes[SubType]
            else
              Column := Column + IntToStr(SubType);
            Column := Column + Format(' SEGMENT SIZE %d', { do not localize }
              [qryTables.FieldByName('RDB$SEGMENT_LENGTH').AsInteger]); { do not localize }
          end;

          { International character sets }
          if ((FieldType in [blr_text, blr_varying]) or (FieldType = blr_blob)) and
            (not qryTables.FieldByName('RDB$CHARACTER_SET_ID').IsNull) and { do not localize }
            (qryTables.FieldByName('RDB$CHARACTER_SET_ID').AsInteger <> 0) then { do not localize }
          begin
            { Override rdb$fields id with relation_fields if present }

            CharSetId := 0;
            if not qryTables.FieldByName('RDB$CHARACTER_SET_ID').IsNull then { do not localize }
              CharSetId := qryTables.FieldByName('RDB$CHARACTER_SET_ID').AsInteger; { do not localize }

            Column := Column + GetCharacterSets(CharSetId, 0, false);
            IntChar := 1;
          end;
        end;

        { Handle defaults for columns }
        { Originally This called PrintMetadataTextBlob,
          should no longer need }
        if not qryTables.FieldByName('RDB$DEFAULT_SOURCE').IsNull then { do not localize }
          Column := Column + ' ' + trim(qryTables.FieldByName('RDB$DEFAULT_SOURCE').AsString); { do not localize }

        { The null flag is either 1 or null (for nullable) .  if there is
          a constraint name, print that too.  Domains cannot have named
          constraints.  The column name is in rdb$trigger_name in
          rdb$check_constraints.  We hope we get at most one row back. }

        if qryTables.FieldByName('RDB$NULL_FLAG').AsInteger = 1 then { do not localize }
        begin
          qryConstraints.ParamByName('FIELDNAME').AsString := trim(qryTables.FieldByName('RDB$FIELD_NAME').AsString);
          { do not localize }
          qryConstraints.ParamByName('RELATIONNAME').AsString :=
            trim(qryTables.FieldByName('RDB$RELATION_NAME').AsString); { do not localize }
          qryConstraints.ExecQuery;

          while not qryConstraints.Eof do
          begin
            if Pos('INTEG', trim(qryConstraints.FieldByName('RDB$CONSTRAINT_NAME').AsString)) <> 1
            then { do not localize }
              Column := Column + Format(' CONSTRAINT %s', { do not localize }
                [FormatIdentifier(FDatabase.SQLDialect, trim(qryConstraints.FieldByName('RDB$CONSTRAINT_NAME').AsString)
                )]); { do not localize }
            qryConstraints.Next;
          end;
          qryConstraints.Close;
          Column := Column + ' NOT NULL'; { do not localize }
        end;

        if ((FieldType in [blr_text, blr_varying]) or (FieldType = blr_blob)) and
          (not qryTables.FieldByName('RDB$CHARACTER_SET_ID').IsNull) and { do not localize }
          (qryTables.FieldByName('RDB$CHARACTER_SET_ID').AsInteger <> 0) and { do not localize }
          (IntChar <> 0) then
        begin
          Collation := 0;
          if not qryTables.FieldByName('RDB$COLLATION_ID1').IsNull then { do not localize }
            Collation := qryTables.FieldByName('RDB$COLLATION_ID1').AsInteger { do not localize }
          else if not qryTables.FieldByName('RDB$COLLATION_ID').IsNull then { do not localize }
            Collation := qryTables.FieldByName('RDB$COLLATION_ID').AsInteger; { do not localize }

          CharSetId := 0;
          if not qryTables.FieldByName('RDB$CHARACTER_SET_ID').IsNull then { do not localize }
            CharSetId := qryTables.FieldByName('RDB$CHARACTER_SET_ID').AsInteger; { do not localize }

          if Collation <> 0 then
            Column := Column + GetCharacterSets(CharSetId, Collation, true);
        end;
      end;
      qryTables.Next;
      if not qryTables.Eof then
        Column := Column + ','; { do not localize }
      FMetaData.Add(Column);
    end;

    { Do primary and unique keys only. references come later }

    qryRelConstraints.ParamByName('relationname').AsString := trim(RelationName); { do not localize }
    qryRelConstraints.ExecQuery;
    while not qryRelConstraints.Eof do
    begin
      Constraint := '';
      FMetaData.Strings[FMetaData.Count - 1] := FMetaData.Strings[FMetaData.Count - 1] + ','; { do not localize }
      { If the name of the constraint is not INTEG..., print it }
      if Pos('INTEG', trim(qryRelConstraints.FieldByName('RDB$CONSTRAINT_NAME').AsString)) <> 1 then { do not localize }
        Constraint := Constraint + 'CONSTRAINT ' + { do not localize }
          FormatIdentifier(FDatabase.SQLDialect, trim(qryRelConstraints.FieldByName('RDB$CONSTRAINT_NAME').AsString));
      { do not localize }

      if Pos('PRIMARY', trim(qryRelConstraints.FieldByName('RDB$CONSTRAINT_TYPE').AsString)) = 1
      then { do not localize }
      begin
        FMetaData.Add(Constraint + Format(' PRIMARY KEY (%s)', { do not localize }
          [GetIndexSegments(trim(qryRelConstraints.FieldByName('RDB$INDEX_NAME').AsString))])); { do not localize }
      end
      else if Pos('UNIQUE', trim(qryRelConstraints.FieldByName('RDB$CONSTRAINT_TYPE').AsString)) = 1
      then { do not localize }
      begin
        FMetaData.Add(Constraint + Format(' UNIQUE (%s)', { do not localize }
          [GetIndexSegments(trim(qryRelConstraints.FieldByName('RDB$INDEX_NAME').AsString))])); { do not localize }
      end;
      qryRelConstraints.Next;
    end;

    if ValidRelation then
    begin
      case TABLE_TYPE of
        4:
          FMetaData.Add(') ON COMMIT PRESERVE ROWS' + TERM);
        5:
          FMetaData.Add(')  ON COMMIT DELETE ROWS' + TERM);
      else
        FMetaData.Add(')' + TERM);
      end;
    end;
  finally
    qryTables.Free;
    qryPrecision.Free;
    qryConstraints.Free;
    qryRelConstraints.Free;
  end;
end;

{ ExtractListView
  Functional description
  Show text of the specified view.
  Use a SQL query to get the info and print it.
  Note: This should also contain check option }

procedure TpFIBExtract.ExtractListView(const ViewName: String);
const
  ViewsSQL = 'SELECT * FROM RDB$RELATIONS REL ' + { do not localize }
    ' WHERE ' + { do not localize }
    '  (REL.RDB$SYSTEM_FLAG <> 1 OR REL.RDB$SYSTEM_FLAG IS NULL) AND ' + { do not localize }
    '  NOT REL.RDB$VIEW_BLR IS NULL AND ' + { do not localize }
    '  REL.RDB$RELATION_NAME = :VIEWNAME AND ' + { do not localize }
    '  REL.RDB$FLAGS = 1 ' + { do not localize }
    'ORDER BY REL.RDB$RELATION_ID '; { do not localize }

  ColumnsSQL = 'SELECT * FROM RDB$RELATION_FIELDS RFR ' + { do not localize }
    'WHERE ' + { do not localize }
    '  RFR.RDB$RELATION_NAME = :RELATIONNAME ' + { do not localize }
    'ORDER BY RFR.RDB$FIELD_POSITION '; { do not localize }

var
  qryViews, qryColumns: TpFIBQuery;
  RelationName, ColList: String;
begin
  qryViews := CreateFIBQuery;
  qryColumns := CreateFIBQuery;
  try
    qryViews.sql.Add(ViewsSQL);
    qryViews.ParamByName('viewname').AsString := trim(ViewName); { do not localize }
    qryViews.ExecQuery;
    while not qryViews.Eof do
    begin
      FMetaData.Add('');
      RelationName := FormatIdentifier(FDatabase.SQLDialect, trim(qryViews.FieldByName('RDB$RELATION_NAME').AsString));
      { do not localize }
      FMetaData.Add(Format('%s/* View: %s, Owner: %s */%s', [ { do not localize }
        RelationName, trim(qryViews.FieldByName('RDB$OWNER_NAME').AsString)])); { do not localize }
      FMetaData.Add('');
      FMetaData.Add(Format('CREATE VIEW %s (', [RelationName])); { do not localize }

      { Get Column List }
      qryColumns.sql.Add(ColumnsSQL);
      qryColumns.ParamByName('relationname').AsString := trim(RelationName); { do not localize }
      qryColumns.ExecQuery;
      while not qryColumns.Eof do
      begin
        ColList := ColList + FormatIdentifier(FDatabase.SQLDialect,
          trim(qryColumns.FieldByName('RDB$FIELD_NAME').AsString)); { do not localize }
        qryColumns.Next;
        if not qryColumns.Eof then
          ColList := ColList + ', '; { do not localize }
      end;
      FMetaData.Add(ColList + ') AS'); { do not localize }
      FMetaData.Add(trim(qryViews.FieldByName('RDB$VIEW_SOURCE').AsString) + TERM); { do not localize }
      qryViews.Next;
    end;
  finally
    qryViews.Free;
    qryColumns.Free;
  end;
end;

function TpFIBExtract.GetCharacterSets(CharSetId, Collation: Short; CollateOnly: Boolean): String;
var
  CharSetSQL: TpFIBQuery;
  DidActivate: Boolean;
begin
  if not FTransaction.Active then
  begin
    FTransaction.StartTransaction;
    DidActivate := true;
  end
  else
    DidActivate := false;
  CharSetSQL := CreateFIBQuery;
  try
    if Collation <> 0 then
    begin
      CharSetSQL.sql.Add(CollationSQL);
      CharSetSQL.ParamByName('Char_Set_Id').AsInteger := CharSetId; { do not localize }
      CharSetSQL.ParamByName('Collation').AsInteger := Collation; { do not localize }
      CharSetSQL.ExecQuery;

      { Is specified collation the default collation for character set? }
      if (trim(CharSetSQL.FieldByName('RDB$DEFAULT_COLLATE_NAME').AsString) = { do not localize }
        trim(CharSetSQL.FieldByName('RDB$COLLATION_NAME').AsString)) then { do not localize }
      begin
        if not CollateOnly then
          Result := ' CHARACTER SET ' + trim(CharSetSQL.FieldByName('RDB$CHARACTER_SET_NAME').AsString);
        { do not localize }
      end
      else if CollateOnly then
        Result := ' COLLATE ' + trim(CharSetSQL.FieldByName('RDB$COLLATION_NAME').AsString) { do not localize }
      else
        Result := ' CHARACTER SET ' + { do not localize }
          trim(CharSetSQL.FieldByName('RDB$CHARACTER_SET_NAME').AsString) + { do not localize }
          ' COLLATE ' + { do not localize }
          trim(CharSetSQL.FieldByName('RDB$COLLATION_NAME').AsString); { do not localize }
    end
    else if CharSetId <> 0 then
    begin
      CharSetSQL.sql.Add(NonCollationSQL);
      CharSetSQL.ParamByName('CharSetId').AsShort := CharSetId; { do not localize }
      CharSetSQL.ExecQuery;
      Result := ' CHARACTER SET ' + trim(CharSetSQL.FieldByName('RDB$CHARACTER_SET_NAME').AsString); { do not localize }
    end;
  finally
    CharSetSQL.Free;
  end;
  if DidActivate then
    FTransaction.Commit;
end;

function TpFIBExtract.GetDatabase: TpFIBDatabase;
begin
  Result := FDatabase;
end;

{ GetIndexSegments
  Functional description
  returns the list of columns in an index. }

function TpFIBExtract.GetIndexSegments(const indexname: String): String;
const
  IndexNamesSQL = 'SELECT * FROM RDB$INDEX_SEGMENTS SEG ' + { do not localize }
    'WHERE SEG.RDB$INDEX_NAME = :INDEXNAME ' + { do not localize }
    'ORDER BY SEG.RDB$FIELD_POSITION'; { do not localize }

var
  qryColNames: TpFIBQuery;
begin
  { Query to get column names }
  Result := '';
  qryColNames := CreateFIBQuery;
  try
    qryColNames.sql.Add(IndexNamesSQL);
    qryColNames.ParamByName('IndexName').AsString := trim(indexname); { do not localize }
    qryColNames.ExecQuery;
    while not qryColNames.Eof do
    begin
      { Place a comma and a blank between each segment column name }

      Result := Result + FormatIdentifier(FDatabase.SQLDialect, trim(qryColNames.FieldByName('RDB$FIELD_NAME').AsString)
        ); { do not localize }
      qryColNames.Next;
      if not qryColNames.Eof then
        Result := Result + ', '; { do not localize }
    end;
  finally
    qryColNames.Free;
  end;
end;

function TpFIBExtract.GetTransaction: TpFIBTransaction;
begin
  Result := FTransaction;
end;

{ ListAllGrants
  Functional description
  Print the permissions on all user tables.
  Get separate permissions on table/views and then procedures }

procedure TpFIBExtract.ListGrants;
const
  SecuritySQL = 'SELECT * FROM RDB$RELATIONS ' + { do not localize }
    'WHERE ' + { do not localize }
    '  (RDB$SYSTEM_FLAG <> 1 OR RDB$SYSTEM_FLAG IS NULL) AND ' + { do not localize }
    '  RDB$SECURITY_CLASS STARTING WITH ''SQL$'' ' + { do not localize }
    'ORDER BY RDB$RELATION_NAME'; { do not localize }

  ProcedureSQL = 'select * from RDB$PROCEDURES ' + { do not localize }
    'Order BY RDB$PROCEDURE_NAME'; { do not localize }

var
  qryRoles: TpFIBQuery;
  RelationName: String;
begin
  ListRoles;
  qryRoles := CreateFIBQuery;
  try
    { This version of cursor gets only sql tables identified by security class
      and misses views, getting only null view_source }

    FMetaData.Add(''); { do not localize }
    FMetaData.Add('/* Grant permissions for this database */'); { do not localize }
    FMetaData.Add(''); { do not localize }

    try
      qryRoles.sql.Text := SecuritySQL;
      qryRoles.ExecQuery;
      while not qryRoles.Eof do
      begin
        RelationName := trim(qryRoles.FieldByName('rdb$relation_Name').AsString); { do not localize }
        ShowGrants(RelationName, TERM);
        qryRoles.Next;
      end;
    finally
      qryRoles.Close;
    end;

    ShowGrantRoles(TERM);

    qryRoles.sql.Text := ProcedureSQL;
    qryRoles.ExecQuery;
    try
      while not qryRoles.Eof do
      begin
        ShowGrants(trim(qryRoles.FieldByName('RDB$PROCEDURE_NAME').AsString), TERM); { do not localize }
        qryRoles.Next;
      end;
    finally
      qryRoles.Close;
    end;
  finally
    qryRoles.Free;
  end;
end;

{ ListAllProcs
  Functional description
  Shows text of a stored procedure given a name.
  or lists procedures if no argument.
  Since procedures may reference each other, we will create all
  dummy procedures of the correct name, then alter these to their
  correct form.
  Add the parameter names when these procedures are created.

  procname -- Name of procedure to investigate }

procedure TpFIBExtract.ListProcs(const ProcedureName: String; AlterOnly: Boolean);
const
  CreateProcedureStr1 = 'CREATE PROCEDURE %s '; { do not localize }
  CreateProcedureStr2 = 'BEGIN EXIT; END %s%s'; { do not localize }
  ProcedureSQL = 'SELECT * FROM RDB$PROCEDURES ' + { do not localize }
    'ORDER BY RDB$PROCEDURE_NAME'; { do not localize }

  ProcedureNameSQL = 'SELECT * FROM RDB$PROCEDURES ' + { do not localize }
    'WHERE RDB$PROCEDURE_NAME = :ProcedureName ' + { do not localize }
    'ORDER BY RDB$PROCEDURE_NAME'; { do not localize }

var
  qryProcedures: TpFIBQuery;
  ProcName: String;
  SList: TStrings;
  Header: Boolean;
begin

  Header := true;
  qryProcedures := CreateFIBQuery;
  SList := TStringList.Create;
  try
    { First the dummy procedures
      create the procedures with their parameters }
    if ProcedureName = '' then
      qryProcedures.sql.Text := ProcedureSQL
    else
    begin
      qryProcedures.sql.Text := ProcedureNameSQL;
      qryProcedures.ParamByName('ProcedureName').AsString := trim(ProcedureName); { do not localize }
    end;
    if not AlterOnly then
    begin
      qryProcedures.ExecQuery;
      while not qryProcedures.Eof do
      begin
        if Header then
        begin
          FMetaData.Add('COMMIT WORK;'); { do not localize }
          FMetaData.Add('SET AUTODDL OFF;'); { do not localize }
          if FIncludeSetTerm then
            FMetaData.Add(Format('SET TERM %s %s', [ProcTerm, TERM])); { do not localize }
          FMetaData.Add(Format('%s/* Stored procedures */%s', [NEWLINE, NEWLINE])); { do not localize }
          Header := false;
        end;
        ProcName := trim(qryProcedures.FieldByName('RDB$PROCEDURE_NAME').AsString); { do not localize }
        FMetaData.Add(Format(CreateProcedureStr1, [FormatIdentifier(FDatabase.SQLDialect, ProcName)]));
        GetProcedureArgs(ProcName);
        if IncludeSetTerm then
          FMetaData.Add(Format(CreateProcedureStr2, [ProcTerm, NEWLINE]))
        else
          FMetaData.Add(Format(CreateProcedureStr2, [TERM, NEWLINE]));
        qryProcedures.Next;
      end;
      qryProcedures.Close;
    end;

    qryProcedures.ExecQuery;
    while not qryProcedures.Eof do
    begin
      SList.Clear;
      ProcName := trim(qryProcedures.FieldByName('RDB$PROCEDURE_NAME').AsString); { do not localize }
      FMetaData.Add(Format('%sALTER PROCEDURE %s ', [NEWLINE, { do not localize }
        FormatIdentifier(FDatabase.SQLDialect, ProcName)]));
      GetProcedureArgs(ProcName);

      FMetaData.AddStrings(SList);
      SList.Clear;
      if not qryProcedures.FieldByName('RDB$PROCEDURE_SOURCE').IsNull then { do not localize }
      begin
        SList.Text := trim(qryProcedures.FieldByName('RDB$PROCEDURE_SOURCE').AsString); { do not localize }
        while (SList.Count > 0) and (trim(SList[0]) = '') do { do not localize }
          SList.Delete(0);
      end;
      if not AlterOnly then
        if IncludeSetTerm then
          SList.Add(' ' + ProcTerm + NEWLINE)
        else
          SList.Add(' ' + TERM + NEWLINE);
      FMetaData.AddStrings(SList);
      qryProcedures.Next;
    end;

    { This query gets the procedure name and the source.  We then nest a query
      to retrieve the parameters. Alter is used, because the procedures are
      already there }

    if not Header then
    begin
      if FIncludeSetTerm then
        FMetaData.Add(Format('SET TERM %s %s', [TERM, ProcTerm])); { do not localize }
      FMetaData.Add('COMMIT WORK;'); { do not localize }
      FMetaData.Add('SET AUTODDL ON;'); { do not localize }
    end;
  finally
    qryProcedures.Free;
    SList.Free;
  end;
end;

{ ListAllTables
  Functional description
  Extract the names of all user tables from
  rdb$relations.  Filter SQL tables by
  security class after we fetch them
  Parameters:  flag -- 0, get all tables }

procedure TpFIBExtract.ListAllTables(flag: Boolean);
const
  TableSQL = 'SELECT * FROM RDB$RELATIONS ' + { do not localize }
    'WHERE ' + { do not localize }
    '  (RDB$SYSTEM_FLAG <> 1 OR RDB$SYSTEM_FLAG IS NULL) AND ' + { do not localize }
    '  RDB$VIEW_BLR IS NULL ' + { do not localize }
    'ORDER BY RDB$RELATION_NAME'; { do not localize }

var
  qryTables: TpFIBQuery;
begin
  { This version of cursor gets only sql tables identified by security class
    and misses views, getting only null view_source }

  qryTables := CreateFIBQuery;
  try
    qryTables.sql.Text := TableSQL;
    qryTables.ExecQuery;
    while not qryTables.Eof do
    begin
      if ((qryTables.FieldByName('RDB$FLAGS').AsInteger <> 1) and { do not localize }
        (not flag)) then
        continue;
      if flag or (Pos('SQL$', trim(qryTables.FieldByName('RDB$SECURITY_CLASS').AsString)) <> 1) then { do not localize }
        ExtractListTable(trim(qryTables.FieldByName('RDB$RELATION_NAME').AsString), { do not localize }
          '', false); { do not localize }

      qryTables.Next;
    end;
  finally
    qryTables.Free;
  end;
end;

{ ListAllTriggers
  Functional description
  Lists triggers in general on non-system
  tables with sql source only. }

procedure TpFIBExtract.ListTriggers(const ObjectName: String; ExtractType: TExtractType);
const
  { Query gets the trigger info for non-system triggers with
    source that are not part of an SQL constraint }

  TriggerSQL = 'SELECT * FROM RDB$TRIGGERS TRG JOIN RDB$RELATIONS REL ON ' + { do not localize }
    '  TRG.RDB$RELATION_NAME = REL.RDB$RELATION_NAME ' + { do not localize }
    'WHERE ' + ' (REL.RDB$SYSTEM_FLAG <> 1 OR REL.RDB$SYSTEM_FLAG IS NULL) AND ' + { do not localize }
    '  NOT EXISTS (SELECT * FROM RDB$CHECK_CONSTRAINTS CHK WHERE ' + { do not localize }
    '     TRG.RDB$TRIGGER_NAME = CHK.RDB$TRIGGER_NAME) ' + { do not localize }
    'ORDER BY TRG.RDB$RELATION_NAME, TRG.RDB$TRIGGER_TYPE, ' + { do not localize }
    '    TRG.RDB$TRIGGER_SEQUENCE, TRG.RDB$TRIGGER_NAME'; { do not localize }

  TriggerNameSQL = 'SELECT * FROM RDB$TRIGGERS TRG JOIN RDB$RELATIONS REL ON ' + { do not localize }
    '  TRG.RDB$RELATION_NAME = REL.RDB$RELATION_NAME ' + { do not localize }
    'WHERE ' + { do not localize }
    ' REL.RDB$RELATION_NAME = :TableName AND ' + { do not localize }
    ' (REL.RDB$SYSTEM_FLAG <> 1 OR REL.RDB$SYSTEM_FLAG IS NULL) AND ' + { do not localize }
    '  NOT EXISTS (SELECT * FROM RDB$CHECK_CONSTRAINTS CHK WHERE ' + { do not localize }
    '     TRG.RDB$TRIGGER_NAME = CHK.RDB$TRIGGER_NAME) ' + { do not localize }
    'ORDER BY TRG.RDB$RELATION_NAME, TRG.RDB$TRIGGER_TYPE, ' + { do not localize }
    '    TRG.RDB$TRIGGER_SEQUENCE, TRG.RDB$TRIGGER_NAME'; { do not localize }

  TriggerByNameSQL = 'SELECT * FROM RDB$TRIGGERS TRG JOIN RDB$RELATIONS REL ON ' + { do not localize }
    '  TRG.RDB$RELATION_NAME = REL.RDB$RELATION_NAME ' + { do not localize }
    'WHERE ' + { do not localize }
    ' TRG.RDB$TRIGGER_NAME = :TriggerName AND ' + { do not localize }
    ' (REL.RDB$SYSTEM_FLAG <> 1 OR REL.RDB$SYSTEM_FLAG IS NULL) AND ' + { do not localize }
    '  NOT EXISTS (SELECT * FROM RDB$CHECK_CONSTRAINTS CHK WHERE ' + { do not localize }
    '     TRG.RDB$TRIGGER_NAME = CHK.RDB$TRIGGER_NAME) ' + { do not localize }
    'ORDER BY TRG.RDB$RELATION_NAME, TRG.RDB$TRIGGER_TYPE, ' + { do not localize }
    '    TRG.RDB$TRIGGER_SEQUENCE, TRG.RDB$TRIGGER_NAME'; { do not localize }

var
  Header: Boolean;
  TriggerName, RelationName, InActive: String;
  qryTriggers: TpFIBQuery;
  SList: TStrings;
begin
  Header := true;
  SList := TStringList.Create;
  qryTriggers := CreateFIBQuery;
  try
    if ObjectName = '' then { do not localize }
      qryTriggers.sql.Text := TriggerSQL
    else
    begin
      if ExtractType = etTable then
      begin
        qryTriggers.sql.Text := TriggerNameSQL;
        qryTriggers.ParamByName('TableName').AsString := trim(ObjectName); { do not localize }
      end
      else
      begin
        qryTriggers.sql.Text := TriggerByNameSQL;
        qryTriggers.ParamByName('TriggerName').AsString := trim(ObjectName); { do not localize }
      end;
    end;
    qryTriggers.ExecQuery;
    while not qryTriggers.Eof do
    begin
      SList.Clear;
      if Header then
      begin
        if FIncludeSetTerm then
          FMetaData.Add(Format('SET TERM %s %s%s', [ProcTerm, TERM, NEWLINE])); { do not localize }
        FMetaData.Add(Format('%s/* Triggers only will work for SQL triggers */%s', { do not localize }
          [NEWLINE, NEWLINE]));
        Header := false;
      end;
      TriggerName := trim(qryTriggers.FieldByName('RDB$TRIGGER_NAME').AsString); { do not localize }
      RelationName := trim(qryTriggers.FieldByName('RDB$RELATION_NAME').AsString); { do not localize }
      if qryTriggers.FieldByName('RDB$TRIGGER_INACTIVE').IsNull then { do not localize }
        InActive := 'INACTIVE' { do not localize }
      else if qryTriggers.FieldByName('RDB$TRIGGER_INACTIVE').AsInteger = 1 then { do not localize }
        InActive := 'INACTIVE' { do not localize }
      else
        InActive := 'ACTIVE'; { do not localize }

      if qryTriggers.FieldByName('RDB$FLAGS').AsInteger <> 1 then { do not localize }
        SList.Add('/* '); { do not localize }

      SList.Add(Format('CREATE TRIGGER %s FOR %s %s%s %s POSITION %d', { do not localize }
        [FormatIdentifier(FDatabase.SQLDialect, TriggerName), FormatIdentifier(FDatabase.SQLDialect, RelationName),
        NEWLINE, InActive, TriggerTypeName(qryTriggers.FieldByName('RDB$TRIGGER_TYPE').AsInteger), { do not localize }
        qryTriggers.FieldByName('RDB$TRIGGER_SEQUENCE').AsInteger])); { do not localize }
      if not qryTriggers.FieldByName('RDB$TRIGGER_SOURCE').IsNull then { do not localize }
        SList.Text := SList.Text + trim(qryTriggers.FieldByName('RDB$TRIGGER_SOURCE').AsString); { do not localize }
      if IncludeSetTerm then
        SList.Add(' ' + ProcTerm + NEWLINE)
      else
        SList.Add(' ' + TERM + NEWLINE);
      if qryTriggers.FieldByName('RDB$FLAGS').AsInteger <> 1 then { do not localize }
        SList.Add(' */'); { do not localize }
      FMetaData.AddStrings(SList);
      qryTriggers.Next;
    end;
    if not Header then
    begin
      if IncludeSetTerm then
      begin
        FMetaData.Add('COMMIT WORK ' + ProcTerm); { do not localize }
        FMetaData.Add('SET TERM ' + TERM + ProcTerm); { do not localize }
      end
      else
        FMetaData.Add('COMMIT WORK ' + TERM); { do not localize }
    end;
  finally
    qryTriggers.Free;
    SList.Free;
  end;
end;

{ ListCheck
  Functional description
  List check constraints for all objects to allow forward references }

procedure TpFIBExtract.ListCheck(const ObjectName: String; ExtractType: TExtractType);
const
  { Query gets the check clauses for triggers stored for check constraints }
  CheckSQL = 'SELECT * FROM RDB$TRIGGERS TRG JOIN RDB$CHECK_CONSTRAINTS CHK ON ' + { do not localize }
    '  TRG.RDB$TRIGGER_NAME = CHK.RDB$TRIGGER_NAME ' + { do not localize }
    'WHERE ' + { do not localize }
    '  TRG.RDB$TRIGGER_TYPE = 1 AND ' + { do not localize }
    '  EXISTS (SELECT RDB$CONSTRAINT_NAME FROM RDB$RELATION_CONSTRAINTS RELC WHERE ' + { do not localize }
    '    CHK.RDB$CONSTRAINT_NAME = RELC.RDB$CONSTRAINT_NAME) ' + { do not localize }
    'ORDER BY CHK.RDB$CONSTRAINT_NAME'; { do not localize }

  CheckNameSQL = 'SELECT * FROM RDB$TRIGGERS TRG JOIN RDB$CHECK_CONSTRAINTS CHK ON ' + { do not localize }
    '  TRG.RDB$TRIGGER_NAME = CHK.RDB$TRIGGER_NAME ' + { do not localize }
    'WHERE ' + { do not localize }
    '  TRG.RDB$RELATION_NAME = :TableName AND ' + { do not localize }
    '  TRG.RDB$TRIGGER_TYPE = 1 AND ' + { do not localize }
    '  EXISTS (SELECT RDB$CONSTRAINT_NAME FROM RDB$RELATION_CONSTRAINTS RELC WHERE ' + { do not localize }
    '    CHK.RDB$CONSTRAINT_NAME = RELC.RDB$CONSTRAINT_NAME) ' + { do not localize }
    'ORDER BY CHK.RDB$CONSTRAINT_NAME'; { do not localize }

  CheckByNameSQL = 'SELECT * FROM RDB$TRIGGERS TRG JOIN RDB$CHECK_CONSTRAINTS CHK ON ' + { do not localize }
    '  TRG.RDB$TRIGGER_NAME = CHK.RDB$TRIGGER_NAME ' + { do not localize }
    'WHERE ' + { do not localize }
    '  TRG.RDB$TRIGGER_NAME = :TriggerName AND ' + { do not localize }
    '  TRG.RDB$TRIGGER_TYPE = 1 AND ' + { do not localize }
    '  EXISTS (SELECT RDB$CONSTRAINT_NAME FROM RDB$RELATION_CONSTRAINTS RELC WHERE ' + { do not localize }
    '    CHK.RDB$CONSTRAINT_NAME = RELC.RDB$CONSTRAINT_NAME) ' + { do not localize }
    'ORDER BY CHK.RDB$CONSTRAINT_NAME'; { do not localize }

var
  qryChecks: TpFIBQuery;
  SList: TStrings;
  RelationName: String;
begin
  qryChecks := CreateFIBQuery;
  SList := TStringList.Create;
  try
    if ObjectName = '' then { do not localize }
      qryChecks.sql.Text := CheckSQL
    else if ExtractType = etTable then
    begin
      qryChecks.sql.Text := CheckNameSQL;
      qryChecks.ParamByName('TableName').AsString := trim(ObjectName); { do not localize }
    end
    else
    begin
      qryChecks.sql.Text := CheckByNameSQL;
      qryChecks.ParamByName('TriggerName').AsString := trim(ObjectName); { do not localize }
    end;
    qryChecks.ExecQuery;
    while not qryChecks.Eof do
    begin
      SList.Clear;
      RelationName := trim(qryChecks.FieldByName('RDB$RELATION_NAME').AsString); { do not localize }
      SList.Add(Format('ALTER TABLE %s ADD', { do not localize }
        [FormatIdentifier(FDatabase.SQLDialect, RelationName)]));
      if Pos('INTEG', trim(qryChecks.FieldByName('RDB$CONSTRAINT_NAME').AsString)) <> 1 then { do not localize }
        SList.Add(Format('%sCONSTRAINT %s ', [TAB, { do not localize }
          FormatIdentifier(FDatabase.SQLDialect, trim(qryChecks.FieldByName('RDB$CONSTRAINT_NAME').AsString))]));
      { do not localize }

      if not qryChecks.FieldByName('RDB$TRIGGER_SOURCE').IsNull then { do not localize }
        SList.Text := SList.Text + trim(qryChecks.FieldByName('RDB$TRIGGER_SOURCE').AsString); { do not localize }

      SList.Strings[SList.Count - 1] := SList.Strings[SList.Count - 1] + (TERM) + NEWLINE;
      FMetaData.AddStrings(SList);
      qryChecks.Next;
    end;
  finally
    qryChecks.Free;
    SList.Free;
  end;
end;

{ ListCreateDb
  Functional description
  Print the create database command if requested.  At least put
  the page size in a comment with the extracted db name }

procedure TpFIBExtract.ListCreateDb(TargetDb: String);
const
  CharInfoSQL = 'SELECT * FROM RDB$DATABASE DBP ' + { do not localize }
    'WHERE NOT DBP.RDB$CHARACTER_SET_NAME IS NULL ' + { do not localize }
    '  AND DBP.RDB$CHARACTER_SET_NAME != '' '''; { do not localize }

  FilesSQL = 'select * from RDB$FILES ' + { do not localize }
    'order BY RDB$SHADOW_NUMBER, RDB$FILE_SEQUENCE'; { do not localize }

  LogsSQL = 'SELECT * FROM RDB$LOG_FILES ' + { do not localize }
    'ORDER BY RDB$FILE_FLAGS, RDB$FILE_SEQUENCE'; { do not localize }

var
  NoDb, First, FirstFile, HasWal, SetUsed: Boolean;
  Buffer: String;
  qryDB: TpFIBQuery;
  FileFlags, FileLength, FileSequence, FileStart: Integer;

  // ?
  { function GetLongDatabaseInfo(DatabaseInfoCommand: Integer): LongInt;
    var
    local_buffer: array[0..IBLocalBufferLength - 1] of Char;
    length: Integer;
    _DatabaseInfoCommand: Char;
    begin
    _DatabaseInfoCommand := Char(DatabaseInfoCommand);
    FDatabaseInfo.Call(isc_database_info(StatusVector, @FDatabase.Handle, 1, @_DatabaseInfoCommand,
    IBLocalBufferLength, local_buffer), True);
    length := isc_vax_integer(@local_buffer[1], 2);
    result := isc_vax_integer(@local_buffer[3], length);
    end; }

begin
  NoDb := false;
  First := true;
  FirstFile := true;
  HasWal := false;
  SetUsed := false;
  Buffer := ''; { do not localize }
  if TargetDb = '' then { do not localize }
  begin
    Buffer := '/* '; { do not localize }
    TargetDb := FDatabase.DBName;
    NoDb := true;
  end;
  Buffer := Buffer + 'CREATE DATABASE ' + QuotedStr(TargetDb) + ' PAGE_SIZE ' + { do not localize }
    IntToStr(FDatabase.PageSize) + NEWLINE;
  FMetaData.Add(Buffer);
  Buffer := '';

  qryDB := CreateFIBQuery;
  try
    qryDB.sql.Text := CharInfoSQL;
    qryDB.ExecQuery;

    Buffer := Format(' DEFAULT CHARACTER SET %s', { do not localize }
      [trim(qryDB.FieldByName('RDB$CHARACTER_SET_NAME').AsString)]); { do not localize }
    if NoDb then
      Buffer := Buffer + ' */' { do not localize }
    else
      Buffer := Buffer + TERM;
    FMetaData.Add(Buffer);
    qryDB.Close;
    { List secondary files and shadows as
      alter db and create shadow in comment }
    qryDB.sql.Text := FilesSQL;
    qryDB.ExecQuery;
    while not qryDB.Eof do
    begin
      if First then
      begin
        FMetaData.Add(NEWLINE + '/* Add secondary files in comments '); { do not localize }
        First := false;
      end; // end_if

      if qryDB.FieldByName('RDB$FILE_FLAGS').IsNull then { do not localize }
        FileFlags := 0
      else
        FileFlags := qryDB.FieldByName('RDB$FILE_FLAGS').AsInteger; { do not localize }
      if qryDB.FieldByName('RDB$FILE_LENGTH').IsNull then { do not localize }
        FileLength := 0
      else
        FileLength := qryDB.FieldByName('RDB$FILE_LENGTH').AsInteger; { do not localize }
      if qryDB.FieldByName('RDB$FILE_SEQUENCE').IsNull then { do not localize }
        FileSequence := 0
      else
        FileSequence := qryDB.FieldByName('RDB$FILE_SEQUENCE').AsInteger; { do not localize }
      if qryDB.FieldByName('RDB$FILE_START').IsNull then { do not localize }
        FileStart := 0
      else
        FileStart := qryDB.FieldByName('RDB$FILE_START').AsInteger; { do not localize }

      { Pure secondary files }
      if FileFlags = 0 then
      begin
        Buffer := Format('%sALTER DATABASE ADD FILE ''%s''', { do not localize }
          [NEWLINE, trim(qryDB.FieldByName('RDB$FILE_NAME').AsString)]); { do not localize }
        if FileStart <> 0 then
          Buffer := Buffer + Format(' STARTING %d', [FileStart]); { do not localize }
        if FileLength <> 0 then
          Buffer := Buffer + Format(' LENGTH %d', [FileLength]); { do not localize }
        FMetaData.Add(Buffer);
      end; // end_if
      if (FileFlags and FILE_cache) <> 0 then
        FMetaData.Add(Format('%sALTER DATABASE ADD CACHE ''%s'' LENGTH %d', { do not localize }
          [NEWLINE, trim(qryDB.FieldByName('RDB$FILE_NAME').AsString), FileLength])); { do not localize }

      Buffer := '';
      if (FileFlags and FILE_shadow) <> 0 then
      begin
        if FileSequence <> 0 then
          Buffer := Format('%sFILE ''%s''', { do not localize }
            [TAB, trim(qryDB.FieldByName('RDB$FILE_NAME').AsString)]) { do not localize }
        else
        begin
          Buffer := Format('%sCREATE SHADOW %d ''%s'' ', { do not localize }
            [NEWLINE, qryDB.FieldByName('RDB$SHADOW_NUMBER').AsInteger, { do not localize }
            trim(qryDB.FieldByName('RDB$FILE_NAME').AsString)]); { do not localize }
          if (FileFlags and FILE_inactive) <> 0 then
            Buffer := Buffer + 'INACTIVE '; { do not localize }
          if (FileFlags and FILE_manual) <> 0 then
            Buffer := Buffer + 'MANUAL ' { do not localize }
          else
            Buffer := Buffer + 'AUTO '; { do not localize }
          if (FileFlags and FILE_conditional) <> 0 then
            Buffer := Buffer + 'CONDITIONAL '; { do not localize }
        end; // end_else
        if FileLength <> 0 then
          Buffer := Buffer + Format('LENGTH %d ', [FileLength]); { do not localize }
        if FileStart <> 0 then
          Buffer := Buffer + Format('STARTING %d ', [FileStart]); { do not localize }
        FMetaData.Add(Buffer);
      end; // end_if
      qryDB.Next;
    end;
    qryDB.Close;

    qryDB.sql.Text := LogsSQL;
    qryDB.ExecQuery;
    while not qryDB.Eof do
    begin

      if qryDB.FieldByName('RDB$FILE_FLAGS').IsNull then { do not localize }
        FileFlags := 0
      else
        FileFlags := qryDB.FieldByName('RDB$FILE_FLAGS').AsInteger; { do not localize }
      if qryDB.FieldByName('RDB$FILE_LENGTH').IsNull then { do not localize }
        FileLength := 0
      else
        FileLength := qryDB.FieldByName('RDB$FILE_LENGTH').AsInteger; { do not localize }

      Buffer := '';
      HasWal := true;
      if First then
      begin
        if NoDb then
          Buffer := '/* '; { do not localize }
        Buffer := Buffer + NEWLINE + 'ALTER DATABASE ADD '; { do not localize }
        First := false;
      end; // end_if
      if FirstFile then
        Buffer := Buffer + 'LOGFILE '; { do not localize }
      { Overflow files also have the serial bit set }
      if (FileFlags and LOG_default) = 0 then
      begin
        if (FileFlags and LOG_overflow) <> 0 then
          Buffer := Buffer + Format(')%s   OVERFLOW ''%s''', { do not localize }
            [NEWLINE, trim(qryDB.FieldByName('RDB$FILE_NAME').AsString)]) { do not localize }
        else if (FileFlags and LOG_serial) <> 0 then
          Buffer := Buffer + Format('%s  BASE_NAME ''%s''', { do not localize }
            [NEWLINE, trim(qryDB.FieldByName('RDB$FILE_NAME').AsString)]) { do not localize }
          { Since we are fetching order by FILE_FLAGS, the LOG_0verflow will
            be last.  It will only appear if there were named round robin,
            so we must close the parens first }

          { We have round robin and overflow file specifications }
        else
        begin
          if FirstFile then
            Buffer := Buffer + '(' { do not localize }
          else
            Buffer := Buffer + Format(',%s  ', [NEWLINE]); { do not localize }
          FirstFile := false;

          Buffer := Buffer + Format('''%s''', [trim(qryDB.FieldByName('RDB$FILE_NAME').AsString)]); { do not localize }
        end; // end_else
      end;
      { Any file can have a length }
      if FileLength <> 0 then
        Buffer := Buffer + Format(' SIZE %d ', [FileLength]); { do not localize }
      FMetaData.Add(Buffer);
      qryDB.Next;
    end;
    qryDB.Close;
    Buffer := '';
    if HasWal then
    begin
      Buffer := Buffer + PrintSet(SetUsed);
      Buffer := Buffer + Format('NUM_LOG_BUFFERS = %d', { do not localize }
        [FDatabase.NumWALBuffers]);
      Buffer := Buffer + PrintSet(SetUsed);
      Buffer := Buffer + Format('LOG_BUFFER_SIZE = %d', { do not localize }
        [FDatabase.WALBufferSize]);
      Buffer := Buffer + PrintSet(SetUsed);
      Buffer := Buffer + Format('GROUP_COMMIT_WAIT_TIME = %d', { do not localize }
        [FDatabase.WALGroupCommitWaitUSecs]);
      Buffer := Buffer + PrintSet(SetUsed);
      Buffer := Buffer + Format('CHECK_POINT_LENGTH = %d', { do not localize }
        [FDatabase.WALCheckpointLength]);
      FMetaData.Add(Buffer);

    end;
    if not First then
    begin
      if NoDb then
        FMetaData.Add(Format('%s */%s', [NEWLINE, NEWLINE])) { do not localize }
      else
        FMetaData.Add(Format('%s%s%s', [TERM, NEWLINE, NEWLINE])); { do not localize }
    end;
  finally
    qryDB.Free;
  end;
end;

{ ListDomainTable
  Functional description
  List domains as identified by fields with any constraints on them
  for the named table

  Parameters:  table_name == only extract domains for this table }

procedure TpFIBExtract.ListDomains(const ObjectName: String; ExtractType: TExtractType);
const
  DomainSQL = 'SELECT distinct fld.* FROM RDB$FIELDS FLD JOIN RDB$RELATION_FIELDS RFR ON ' + { do not localize }
    '  RFR.RDB$FIELD_SOURCE = FLD.RDB$FIELD_NAME ' + { do not localize }
    'WHERE RFR.RDB$RELATION_NAME = :TABLE_NAME ' + { do not localize }
    'ORDER BY FLD.RDB$FIELD_NAME'; { do not localize }

  DomainByNameSQL = 'SELECT * FROM RDB$FIELDS FLD ' + { do not localize }
    'WHERE FLD.RDB$FIELD_NAME = :DomainName ' + { do not localize }
    'ORDER BY FLD.RDB$FIELD_NAME'; { do not localize }

  AllDomainSQL = 'select * from RDB$FIELDS ' + { do not localize }
    'where RDB$SYSTEM_FLAG <> 1 ' + { do not localize }
    'order BY RDB$FIELD_NAME'; { do not localize }

var
  First: Boolean;
  qryDomains: TpFIBQuery;
  FieldName, Line: String;

  function FormatDomainStr: String;
  var
    i, SubType: Integer;
    PrecisionKnown: Boolean;
  begin
    Result := ''; { do not localize }
    for i := Low(ColumnTypes) to High(ColumnTypes) do
      if qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger = ColumnTypes[i].SqlType then { do not localize }
      begin
        PrecisionKnown := false;
        if FDatabase.ODSMajorVersion >= ODS_VERSION10 then
        begin
          if qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger in [blr_short, blr_long, blr_int64]
          then { do not localize }
          begin
            { We are ODS >= 10 and could be any Dialect }
            if (FDatabase.DBSQLDialect >= 3) and (not qryDomains.FieldByName('RDB$FIELD_PRECISION').IsNull) and
            { do not localize }
              (qryDomains.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger > 0) and { do not localize }
              (qryDomains.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger <= MAX_INTSUBTYPES) then { do not localize }
            begin
              Result := Result + Format('%s(%d, %d)', [ { do not localize }
                IntegralSubtypes[qryDomains.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger], { do not localize }
                qryDomains.FieldByName('RDB$FIELD_PRECISION').AsInteger, { do not localize }
                -1 * qryDomains.FieldByName('RDB$FIELD_SCALE').AsInteger]); { do not localize }
              PrecisionKnown := true;
            end;
          end;
        end;
        if PrecisionKnown = false then
        begin
          { Take a stab at numerics and decimals }
          if (qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger = blr_short) and { do not localize }
            (qryDomains.FieldByName('RDB$FIELD_SCALE').AsInteger < 0) then { do not localize }
            Result := Result + Format('NUMERIC(4, %d)', { do not localize }
              [-qryDomains.FieldByName('RDB$FIELD_SCALE').AsInteger]) { do not localize }
          else if (qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger = blr_long) and { do not localize }
            (qryDomains.FieldByName('RDB$FIELD_SCALE').AsInteger < 0) then { do not localize }
            Result := Result + Format('NUMERIC(9, %d)', { do not localize }
              [-qryDomains.FieldByName('RDB$FIELD_SCALE').AsInteger]) { do not localize }
          else if (qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger = blr_double) and { do not localize }
            (qryDomains.FieldByName('RDB$FIELD_SCALE').AsInteger < 0) then { do not localize }
            Result := Result + Format('NUMERIC(15, %d)', { do not localize }
              [-qryDomains.FieldByName('RDB$FIELD_SCALE').AsInteger]) { do not localize }
          else
            Result := Result + ColumnTypes[i].TypeName;
        end;
        break;
      end;

    if qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger = blr_blob then { do not localize }
    begin
      SubType := qryDomains.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger; { do not localize }
      Result := Result + ' SUB_TYPE '; { do not localize }
      if (SubType > 0) and (SubType <= MAXSUBTYPES) then
        Result := Result + SubTypes[SubType]
      else
        Result := Result + Format('%d', [SubType]); { do not localize }
      Result := Result + Format(' SEGMENT SIZE %d', [qryDomains.FieldByName('RDB$SEGMENT_LENGTH').AsInteger]);
      { do not localize }
    end // end_if
    else if qryDomains.FieldByName('RDB$FIELD_TYPE').AsInteger in [blr_text, blr_varying] then { do not localize }
      Result := Result + Format('(%d)', [GetFieldLength(qryDomains)]); { do not localize }

    { since the character set is part of the field type, display that
      information now. }
    if not qryDomains.FieldByName('RDB$CHARACTER_SET_ID').IsNull then { do not localize }
      Result := Result + GetCharacterSets(qryDomains.FieldByName('RDB$CHARACTER_SET_ID').AsInteger, { do not localize }
        0, false);
    if not qryDomains.FieldByName('RDB$DIMENSIONS').IsNull then { do not localize }
      Result := Result + GetArrayField(FieldName);

    if not qryDomains.FieldByName('RDB$DEFAULT_SOURCE').IsNull then { do not localize }
      Result := Result + Format('%s%s %s', [NEWLINE, TAB, { do not localize }
        trim(qryDomains.FieldByName('RDB$DEFAULT_SOURCE').AsString)]); { do not localize }

    if not qryDomains.FieldByName('RDB$VALIDATION_SOURCE').IsNull then { do not localize }
      if Pos('CHECK', AnsiUpperCase(trim(qryDomains.FieldByName('RDB$VALIDATION_SOURCE').AsString))) = 1
      then { do not localize }
        Result := Result + Format('%s%s %s', [NEWLINE, TAB, { do not localize }
          trim(qryDomains.FieldByName('RDB$VALIDATION_SOURCE').AsString)]) { do not localize }
      else
        Result := Result + Format('%s%s /* %s */', [NEWLINE, TAB, { do not localize }
          trim(qryDomains.FieldByName('RDB$VALIDATION_SOURCE').AsString)]); { do not localize }

    if qryDomains.FieldByName('RDB$NULL_FLAG').AsInteger = 1 then { do not localize }
      Result := Result + ' NOT NULL'; { do not localize }

    { Show the collation order if one has been specified.  If the collation
      order is the default for the character set being used, then no collation
      order will be shown ( because it isn't needed ).

      If the collation id is 0, then the default for the character set is
      being used so there is no need to retrieve the collation information. }

    if (not qryDomains.FieldByName('RDB$COLLATION_ID').IsNull) and { do not localize }
      (qryDomains.FieldByName('RDB$COLLATION_ID').AsInteger <> 0) then { do not localize }
      Result := Result + GetCharacterSets(qryDomains.FieldByName('RDB$CHARACTER_SET_ID').AsInteger, { do not localize }
        qryDomains.FieldByName('RDB$COLLATION_ID').AsInteger, true); { do not localize }
  end;

begin
  First := true;
  qryDomains := CreateFIBQuery;
  try
    if ObjectName <> '' then { do not localize }
    begin
      if ExtractType = etTable then
      begin
        qryDomains.sql.Text := DomainSQL;
        qryDomains.ParamByName('table_name').AsString := trim(ObjectName); { do not localize }
      end
      else
      begin
        qryDomains.sql.Text := DomainByNameSQL;
        qryDomains.ParamByName('DomainName').AsString := trim(ObjectName); { do not localize }
      end;
    end
    else
      qryDomains.sql.Text := AllDomainSQL;

    qryDomains.ExecQuery;
    while not qryDomains.Eof do
    begin
      FieldName := trim(qryDomains.FieldByName('RDB$FIELD_NAME').AsString); { do not localize }
      { Skip over artifical domains }
      if (Pos('RDB$', FieldName) = 1) and { do not localize }
        CharInSet(FieldName[5], ['0' .. '9']) and { do not localize }
        (qryDomains.FieldByName('RDB$SYSTEM_FLAG').AsInteger <> 1) then { do not localize }
      begin
        qryDomains.Next;
        continue;
      end;

      if First then
      begin
        FMetaData.Add('/* Domain definitions */'); { do not localize }
        First := false;
      end;

      Line := Format('CREATE DOMAIN %s AS ', [FormatIdentifier(FDatabase.SQLDialect, FieldName)]); { do not localize }
      Line := Line + FormatDomainStr + TERM;
      FMetaData.Add(Line);
      qryDomains.Next;
    end;
  finally
    qryDomains.Free;
  end;
end;

{ ListException
  Functional description
  List all exceptions defined in the database

  Parameters:  none }

procedure TpFIBExtract.ListException(const ExceptionName: String = '');
const
  ExceptionSQL = 'select * from RDB$EXCEPTIONS ' + { do not localize }
    'ORDER BY RDB$EXCEPTION_NAME'; { do not localize }

  ExceptionNameSQL = 'select * from RDB$EXCEPTIONS ' + { do not localize }
    'WHERE RDB$EXCEPTION_NAME = :ExceptionName ' + { do not localize }
    'ORDER BY RDB$EXCEPTION_NAME'; { do not localize }

var
  First: Boolean;
  qryException: TpFIBQuery;
begin
  First := true;
  qryException := CreateFIBQuery;
  try
    if ExceptionName = '' then { do not localize }
      qryException.sql.Text := ExceptionSQL
    else
    begin
      qryException.sql.Text := ExceptionNameSQL;
      qryException.ParamByName('ExceptionName').AsString := trim(ExceptionName); { do not localize }
    end;

    qryException.ExecQuery;
    while not qryException.Eof do
    begin
      if First then
      begin
        FMetaData.Add(''); { do not localize }
        FMetaData.Add('/*  Exceptions */'); { do not localize }
        FMetaData.Add(''); { do not localize }
        First := false;
      end; // end_if

      FMetaData.Add(Format('CREATE EXCEPTION %s %s%s', { do not localize }
        [FormatIdentifier(FDatabase.SQLDialect, trim(qryException.FieldByName('RDB$EXCEPTION_NAME').AsString)),
        { do not localize }
        QuotedStr(trim(qryException.FieldByName('RDB$MESSAGE').AsString)), TERM])); { do not localize }
      qryException.Next;
    end;
  finally
    qryException.Free;
  end;
end;

{ ListFilters

  Functional description
  List all blob filters

  Parameters:  none
  Results in
  DECLARE FILTER <fname> INPUT_TYPE <blob_sub_type> OUTPUT_TYPE <blob_subtype>
  ENTRY_POINT <string> MODULE_NAME <string> }

procedure TpFIBExtract.ListFilters(const FilterName: String = '');
const
  FiltersSQL = 'SELECT * FROM RDB$FILTERS ' + { do not localize }
    'ORDER BY RDB$FUNCTION_NAME'; { do not localize }
  FilterNameSQL = 'SELECT * FROM RDB$FILTERS ' + { do not localize }
    'WHERE RDB$FUNCTION_NAME = :FunctionName ' + { do not localize }
    'ORDER BY RDB$FUNCTION_NAME'; { do not localize }

var
  First: Boolean;
  qryFilters: TpFIBQuery;
begin
  First := true;
  qryFilters := CreateFIBQuery;
  try
    if FilterName = '' then { do not localize }
      qryFilters.sql.Text := FiltersSQL
    else
    begin
      qryFilters.sql.Text := FilterNameSQL;
      qryFilters.ParamByName('FunctionName').AsString := trim(FilterName); { do not localize }
    end;
    qryFilters.ExecQuery;
    while not qryFilters.Eof do
    begin
      if First then
      begin
        FMetaData.Add(''); { do not localize }
        FMetaData.Add('/*  BLOB Filter declarations */'); { do not localize }
        FMetaData.Add(''); { do not localize }
        First := false;
      end; // end_if

      FMetaData.Add(Format('DECLARE FILTER %s INPUT_TYPE %d OUTPUT_TYPE %d', { do not localize }
        [trim(qryFilters.FieldByName('RDB$FUNCTION_NAME').AsString), { do not localize }
        qryFilters.FieldByName('RDB$INPUT_SUB_TYPE').AsInteger, { do not localize }
        qryFilters.FieldByName('RDB$OUTPUT_SUB_TYPE').AsInteger])); { do not localize }
      FMetaData.Add(Format('%sENTRY_POINT ''%s'' MODULE_NAME ''%s''%s%', { do not localize }
        [TAB, trim(qryFilters.FieldByName('RDB$ENTRYPOINT').AsString), { do not localize }
        trim(qryFilters.FieldByName('RDB$MODULE_NAME').AsString), TERM])); { do not localize }
      FMetaData.Add(''); { do not localize }

      qryFilters.Next;
    end;

  finally
    qryFilters.Free;
  end;
end;

{ ListForeign
  Functional description
  List all foreign key constraints and alter the tables }

procedure TpFIBExtract.ListForeign(const ObjectName: String; ExtractType: TExtractType);
const
  { Static queries for obtaining foreign constraints, where RELC1 is the
    foreign key constraints, RELC2 is the primary key lookup and REFC
    is the join table }
  ForeignSQL = 'SELECT REFC.RDB$UPDATE_RULE REFC_UPDATE_RULE, REFC.RDB$DELETE_RULE REFC_DELETE_RULE, ' +
  { do not localize }
    '  RELC1.RDB$RELATION_NAME RELC1_RELATION_NAME, RELC2.RDB$RELATION_NAME RELC2_RELATION_NAME, ' + { do not localize }
    '  RELC1.RDB$INDEX_NAME RELC1_INDEX_NAME, RELC1.RDB$CONSTRAINT_NAME RELC1_CONSTRAINT_NAME, ' + { do not localize }
    '  RELC2.RDB$INDEX_NAME RELC2_INDEX_NAME ' + { do not localize }
    'FROM RDB$REF_CONSTRAINTS REFC, RDB$RELATION_CONSTRAINTS RELC1, ' + { do not localize }
    '     RDB$RELATION_CONSTRAINTS RELC2 ' + { do not localize }
    'WHERE ' + { do not localize }
    '  RELC1.RDB$CONSTRAINT_TYPE = ''FOREIGN KEY'' AND ' + { do not localize }
    '  REFC.RDB$CONST_NAME_UQ = RELC2.RDB$CONSTRAINT_NAME AND ' + { do not localize }
    '  REFC.RDB$CONSTRAINT_NAME = RELC1.RDB$CONSTRAINT_NAME AND ' + { do not localize }
    '  (RELC2.RDB$CONSTRAINT_TYPE = ''UNIQUE'' OR ' + { do not localize }
    '    RELC2.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'') ' + { do not localize }
    'ORDER BY RELC1.RDB$RELATION_NAME, RELC1.RDB$CONSTRAINT_NAME'; { do not localize }

  ForeignNameSQL = 'SELECT REFC.RDB$UPDATE_RULE REFC_UPDATE_RULE, REFC.RDB$DELETE_RULE REFC_DELETE_RULE, ' +
  { do not localize }
    '  RELC1.RDB$RELATION_NAME RELC1_RELATION_NAME, RELC2.RDB$RELATION_NAME RELC2_RELATION_NAME, ' + { do not localize }
    '  RELC1.RDB$INDEX_NAME RELC1_INDEX_NAME, RELC1.RDB$CONSTRAINT_NAME RELC1_CONSTRAINT_NAME, ' + { do not localize }
    '  RELC2.RDB$INDEX_NAME RELC2_INDEX_NAME ' + { do not localize }
    'FROM RDB$REF_CONSTRAINTS REFC, RDB$RELATION_CONSTRAINTS RELC1, ' + { do not localize }
    '     RDB$RELATION_CONSTRAINTS RELC2 ' + { do not localize }
    'WHERE ' + { do not localize }
    '  RELC1.RDB$RELATION_NAME = :TableName AND ' + { do not localize }
    '  RELC1.RDB$CONSTRAINT_TYPE = ''FOREIGN KEY'' AND ' + { do not localize }
    '  REFC.RDB$CONST_NAME_UQ = RELC2.RDB$CONSTRAINT_NAME AND ' + { do not localize }
    '  REFC.RDB$CONSTRAINT_NAME = RELC1.RDB$CONSTRAINT_NAME AND ' + { do not localize }
    '  (RELC2.RDB$CONSTRAINT_TYPE = ''UNIQUE'' OR ' + { do not localize }
    '    RELC2.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'') ' + { do not localize }
    'ORDER BY RELC1.RDB$RELATION_NAME, RELC1.RDB$CONSTRAINT_NAME'; { do not localize }

  ForeignByNameSQL = 'SELECT REFC.RDB$UPDATE_RULE REFC_UPDATE_RULE, REFC.RDB$DELETE_RULE REFC_DELETE_RULE, ' +
  { do not localize }
    '  RELC1.RDB$RELATION_NAME RELC1_RELATION_NAME, RELC2.RDB$RELATION_NAME RELC2_RELATION_NAME, ' + { do not localize }
    '  RELC1.RDB$INDEX_NAME RELC1_INDEX_NAME, RELC1.RDB$CONSTRAINT_NAME RELC1_CONSTRAINT_NAME, ' + { do not localize }
    '  RELC2.RDB$INDEX_NAME RELC2_INDEX_NAME ' + { do not localize }
    'FROM RDB$REF_CONSTRAINTS REFC, RDB$RELATION_CONSTRAINTS RELC1, ' + { do not localize }
    '     RDB$RELATION_CONSTRAINTS RELC2 ' + { do not localize }
    'WHERE ' + { do not localize }
    '  RELC1.RDB$CONSTRAINT_NAME = :ConstraintName AND ' + { do not localize }
    '  RELC1.RDB$CONSTRAINT_TYPE = ''FOREIGN KEY'' AND ' + { do not localize }
    '  REFC.RDB$CONST_NAME_UQ = RELC2.RDB$CONSTRAINT_NAME AND ' + { do not localize }
    '  REFC.RDB$CONSTRAINT_NAME = RELC1.RDB$CONSTRAINT_NAME AND ' + { do not localize }
    '  (RELC2.RDB$CONSTRAINT_TYPE = ''UNIQUE'' OR ' + { do not localize }
    '    RELC2.RDB$CONSTRAINT_TYPE = ''PRIMARY KEY'') ' + { do not localize }
    'ORDER BY RELC1.RDB$RELATION_NAME, RELC1.RDB$CONSTRAINT_NAME'; { do not localize }

var
  qryForeign: TpFIBQuery;
  Line: String;

begin
  qryForeign := CreateFIBQuery;
  try
    if ObjectName = '' then { do not localize }
      qryForeign.sql.Text := ForeignSQL
    else
    begin
      if ExtractType = etTable then
      begin
        qryForeign.sql.Text := ForeignNameSQL;
        qryForeign.ParamByName('TableName').AsString := trim(ObjectName); { do not localize }
      end
      else
      begin
        qryForeign.sql.Text := ForeignByNameSQL;
        qryForeign.ParamByName('ConstraintName').AsString := trim(ObjectName); { do not localize }
      end;
    end;
    qryForeign.ExecQuery;
    while not qryForeign.Eof do
    begin
      Line := Format('ALTER TABLE %s ADD ', [FormatIdentifier(FDatabase.SQLDialect, { do not localize }
        trim(qryForeign.FieldByName('RELC1_RELATION_NAME').AsString))]); { do not localize }

      { If the name of the constraint is not INTEG..., print it.
        INTEG... are internally generated names. }
      if (not qryForeign.FieldByName('RELC1_CONSTRAINT_NAME').IsNull) and { do not localize }
        (Pos('INTEG', trim(qryForeign.FieldByName('RELC1_CONSTRAINT_NAME').AsString)) <> 1) then { do not localize }
        Line := Line + Format('CONSTRAINT %s ', [FormatIdentifier(FDatabase.SQLDialect, { do not localize }
          trim(qryForeign.FieldByName('RELC1_CONSTRAINT_NAME').AsString))]); { do not localize }

      Line := Line + Format('FOREIGN KEY (%s) REFERENCES %s ', [ { do not localize }
        GetIndexSegments(qryForeign.FieldByName('RELC1_INDEX_NAME').AsString), { do not localize }
        trim(qryForeign.FieldByName('RELC2_RELATION_NAME').AsString)]); { do not localize }

      Line := Line + Format('(%s)', { do not localize }
        [GetIndexSegments(trim(qryForeign.FieldByName('RELC2_INDEX_NAME').AsString))]); { do not localize }

      { Add the referential actions, if any }
      if (not qryForeign.FieldByName('REFC_UPDATE_RULE').IsNull) and { do not localize }
        (trim(qryForeign.FieldByName('REFC_UPDATE_RULE').AsString) <> 'RESTRICT') then { do not localize }
        Line := Line + Format(' ON UPDATE %s', { do not localize }
          [trim(qryForeign.FieldByName('REFC_UPDATE_RULE').AsString)]); { do not localize }

      if (not qryForeign.FieldByName('REFC_DELETE_RULE').IsNull) and { do not localize }
        (trim(qryForeign.FieldByName('REFC_DELETE_RULE').AsString) <> 'RESTRICT') then { do not localize }
        Line := Line + Format(' ON DELETE %s', { do not localize }
          [trim(qryForeign.FieldByName('REFC_DELETE_RULE').AsString)]); { do not localize }

      Line := Line + TERM;
      FMetaData.Add(Line);
      qryForeign.Next;
    end;
  finally
    qryForeign.Free;
  end;
end;

{ ListFunctions

  Functional description
  List all external functions

  Parameters:  none
  Results in
  DECLARE EXTERNAL FUNCTION function_name
  CHAR [256] , INTEGER, ....
  RETURNS INTEGER BY VALUE
  ENTRY_POINT entrypoint MODULE_NAME module; }

procedure TpFIBExtract.ListFunctions(const FunctionName: String = '');
const
  FunctionSQL = 'SELECT * FROM RDB$FUNCTIONS ' + { do not localize }
    'ORDER BY RDB$FUNCTION_NAME'; { do not localize }

  FunctionNameSQL = 'SELECT * FROM RDB$FUNCTIONS ' + { do not localize }
    'WHERE RDB$FUNCTION_NAME = :FunctionName ' + { do not localize }
    'ORDER BY RDB$FUNCTION_NAME'; { do not localize }

  FunctionArgsSQL = 'SELECT * FROM RDB$FUNCTION_ARGUMENTS ' + { do not localize }
    'WHERE ' + { do not localize }
    '  :FUNCTION_NAME = RDB$FUNCTION_NAME ' + { do not localize }
    'ORDER BY RDB$ARGUMENT_POSITION'; { do not localize }

  FuncArgsPosSQL = 'SELECT * FROM RDB$FUNCTION_ARGUMENTS ' + { do not localize }
    'WHERE ' + { do not localize }
    '  RDB$FUNCTION_NAME = :RDB$FUNCTION_NAME AND ' + { do not localize }
    '  RDB$ARGUMENT_POSITION = :RDB$ARGUMENT_POSITION'; { do not localize }

  CharSetSQL = 'SELECT * FROM RDB$CHARACTER_SETS ' + { do not localize }
    'WHERE ' + { do not localize }
    '  RDB$CHARACTER_SET_ID = :CHARACTER_SET_ID'; { do not localize }

var
  qryFunctions, qryFuncArgs, qryCharSets, qryFuncPos: TpFIBQuery;
  First, FirstArg, DidCharset, PrecisionKnown: Boolean;
  ReturnBuffer, TypeBuffer, Line: String;
  i, FieldType: Integer;
begin
  First := true;
  qryFunctions := CreateFIBQuery;
  qryFuncArgs := CreateFIBQuery;
  qryFuncPos := CreateFIBQuery;
  qryCharSets := CreateFIBQuery;
  try
    if FunctionName = '' then { do not localize }
      qryFunctions.sql.Text := FunctionSQL
    else
    begin
      qryFunctions.sql.Text := FunctionNameSQL;
      qryFunctions.ParamByName('FunctionName').AsString := trim(FunctionName); { do not localize }
    end;
    qryFuncArgs.sql.Text := FunctionArgsSQL;
    qryFuncPos.sql.Text := FuncArgsPosSQL;
    qryCharSets.sql.Text := CharSetSQL;
    qryFunctions.ExecQuery;
    while not qryFunctions.Eof do
    begin
      if First then
      begin
        FMetaData.Add(Format('%s/*  External Function declarations */%s', { do not localize }
          [NEWLINE, NEWLINE]));
        First := false;
      end; // end_if
      { Start new function declaration }
      FMetaData.Add(Format('DECLARE EXTERNAL FUNCTION %s', { do not localize }
        [trim(qryFunctions.FieldByName('RDB$FUNCTION_NAME').AsString)])); { do not localize }
      Line := ''; { do not localize }

      FirstArg := true;
      qryFuncArgs.ParamByName('FUNCTION_NAME').AsString := { do not localize }
        trim(qryFunctions.FieldByName('RDB$FUNCTION_NAME').AsString); { do not localize }

      qryFuncArgs.ExecQuery;
      while not qryFuncArgs.Eof do
      begin
        { Find parameter type }
        i := 0;
        FieldType := qryFuncArgs.FieldByName('RDB$FIELD_TYPE').AsInteger; { do not localize }
        while FieldType <> ColumnTypes[i].SqlType do
          Inc(i);

        { Print length where appropriate }
        if FieldType in [blr_text, blr_varying, blr_cstring] then
        begin
          DidCharset := false;

          qryCharSets.ParamByName('CHARACTER_SET_ID').AsInteger := { do not localize }
            qryFuncArgs.FieldByName('RDB$CHARACTER_SET_ID').AsInteger; { do not localize }
          qryCharSets.ExecQuery;
          while not qryCharSets.Eof do
          begin
            DidCharset := true;
            TypeBuffer := Format('%s(%d) CHARACTER SET %s', { do not localize }
              [ColumnTypes[i].TypeName, qryFuncArgs.FieldByName('RDB$FIELD_LENGTH').AsInteger div { do not localize }
              Max(1, qryCharSets.FieldByName('RDB$BYTES_PER_CHARACTER').AsInteger), { do not localize }
              trim(qryCharSets.FieldByName('RDB$CHARACTER_SET_NAME').AsString)]); { do not localize }
            qryCharSets.Next;
          end;
          qryCharSets.Close;
          if not DidCharset then
            TypeBuffer := Format('%s(%d)', [ColumnTypes[i].TypeName, { do not localize }
              qryFuncArgs.FieldByName('RDB$FIELD_LENGTH').AsInteger]); { do not localize }
        end // end_if
        else
        begin
          PrecisionKnown := false;
          if (FDatabase.ODSMajorVersion >= ODS_VERSION10) and (FieldType in [blr_short, blr_long, blr_int64]) then
          begin
            qryFuncPos.ParamByName('RDB$FUNCTION_NAME').AsString := { do not localize }
              trim(qryFuncArgs.FieldByName('RDB$FUNCTION_NAME').AsString); { do not localize }
            qryFuncPos.ParamByName('RDB$ARGUMENT_POSITION').AsInteger := { do not localize }
              qryFuncArgs.FieldByName('RDB$ARGUMENT_POSITION').AsInteger; { do not localize }

            qryFuncPos.ExecQuery;
            while not qryFuncPos.Eof do
            begin
              { We are ODS >= 10 and could be any Dialect }
              if not qryFuncPos.FieldByName('RDB$FIELD_PRECISION').IsNull then { do not localize }
              begin
                { We are Dialect >=3 since FIELD_PRECISION is non-NULL }
                if (qryFuncPos.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger > 0) and { do not localize }
                  (qryFuncPos.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger <= MAX_INTSUBTYPES) then { do not localize }
                begin
                  TypeBuffer := Format('%s(%d, %d)', { do not localize }
                    [IntegralSubtypes[qryFuncPos.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger], { do not localize }
                    qryFuncPos.FieldByName('RDB$FIELD_PRECISION').AsInteger, { do not localize }
                    -qryFuncPos.FieldByName('RDB$FIELD_SCALE').AsInteger]); { do not localize }
                  PrecisionKnown := true;
                end; // end_if
              end; { if field_precision is not null }
              qryFuncPos.Next;
            end;
            qryFuncPos.Close;
          end; { if major_ods >= ods_version10 && }
          if not PrecisionKnown then
          begin
            { Take a stab at numerics and decimals }
            if (FieldType = blr_short) and (qryFuncArgs.FieldByName('RDB$FIELD_SCALE').AsInteger < 0)
            then { do not localize }
              TypeBuffer := Format('NUMERIC(4, %d)', { do not localize }
                [-qryFuncArgs.FieldByName('RDB$FIELD_SCALE').AsInteger]) { do not localize }
            else if (FieldType = blr_long) and (qryFuncArgs.FieldByName('RDB$FIELD_SCALE').AsInteger < 0)
            then { do not localize }
              TypeBuffer := Format('NUMERIC(9, %d)', { do not localize }
                [-qryFuncArgs.FieldByName('RDB$FIELD_SCALE').AsInteger]) { do not localize }
            else if (FieldType = blr_double) and (qryFuncArgs.FieldByName('RDB$FIELD_SCALE').AsInteger < 0)
            then { do not localize }
              TypeBuffer := Format('NUMERIC(15, %d)', { do not localize }
                [-qryFuncArgs.FieldByName('RDB$FIELD_SCALE').AsInteger]) { do not localize }
            else
              TypeBuffer := ColumnTypes[i].TypeName;
          end; { if  not PrecisionKnown }
        end; { if FCHAR or VARCHAR or CSTRING ... else }

        if qryFunctions.FieldByName('RDB$RETURN_ARGUMENT').AsInteger = { do not localize }
          qryFuncArgs.FieldByName('RDB$ARGUMENT_POSITION').AsInteger then { do not localize }
        begin
          ReturnBuffer := 'RETURNS ' + TypeBuffer; { do not localize }
          if qryFuncArgs.FieldByName('RDB$MECHANISM').AsInteger = 0 then { do not localize }
            ReturnBuffer := ReturnBuffer + ' BY VALUE '; { do not localize }
          if qryFuncArgs.FieldByName('RDB$MECHANISM').AsInteger < 0 then { do not localize }
            ReturnBuffer := ReturnBuffer + ' FREE_IT'; { do not localize }
        end
        else
        begin
          { First arg needs no comma }
          if FirstArg then
          begin
            Line := Line + TypeBuffer;
            FirstArg := false;
          end
          else
            Line := Line + ', ' + TypeBuffer;
        end; // end_else
        qryFuncArgs.Next;
      end;
      qryFuncArgs.Close;

      FMetaData.Add(Line);
      FMetaData.Add(ReturnBuffer);
      FMetaData.Add(Format('ENTRY_POINT ''%s'' MODULE_NAME ''%s''%s%s%s', { do not localize }
        [trim(qryFunctions.FieldByName('RDB$ENTRYPOINT').AsString), { do not localize }
        trim(qryFunctions.FieldByName('RDB$MODULE_NAME').AsString), { do not localize }
        TERM, NEWLINE, NEWLINE]));

      qryFunctions.Next;
    end;
  finally
    qryFunctions.Free;
    qryFuncArgs.Free;
    qryCharSets.Free;
    qryFuncPos.Free;
  end;
end;

{ ListGenerators
  Functional description
  Re create all non-system generators }

procedure TpFIBExtract.ListGenerators(const GeneratorName: String = ''); { do not localize }
const
  GeneratorSQL = 'SELECT RDB$GENERATOR_NAME ' + { do not localize }
    'FROM RDB$GENERATORS ' + { do not localize }
    'WHERE ' + { do not localize }
    '  (RDB$SYSTEM_FLAG IS NULL OR RDB$SYSTEM_FLAG <> 1) ' + { do not localize }
    'ORDER BY RDB$GENERATOR_NAME'; { do not localize }

  GeneratorNameSQL = 'SELECT RDB$GENERATOR_NAME ' + { do not localize }
    'FROM RDB$GENERATORS ' + { do not localize }
    'WHERE RDB$GENERATOR_NAME = :GeneratorName AND ' + { do not localize }
    '  (RDB$SYSTEM_FLAG IS NULL OR RDB$SYSTEM_FLAG <> 1) ' + { do not localize }
    'ORDER BY RDB$GENERATOR_NAME'; { do not localize }

var
  qryGenerator: TpFIBQuery;
  GenName: String;
begin
  qryGenerator := CreateFIBQuery;
  try
    if GeneratorName = '' then { do not localize }
      qryGenerator.sql.Text := GeneratorSQL
    else
    begin
      qryGenerator.sql.Text := GeneratorNameSQL;
      qryGenerator.ParamByName('GeneratorName').AsString := trim(GeneratorName); { do not localize }
    end;
    qryGenerator.ExecQuery;
    FMetaData.Add(''); { do not localize }
    while not qryGenerator.Eof do
    begin
      GenName := trim(qryGenerator.FieldByName('RDB$GENERATOR_NAME').AsString); { do not localize }
      if ((Pos('RDB$', GenName) = 1) and { do not localize }
        CharInSet(GenName[5], ['0' .. '9'])) or { do not localize }
        ((Pos('SQL$', GenName) = 1) and { do not localize }
        CharInSet(GenName[5], ['0' .. '9'])) then { do not localize }
      begin
        qryGenerator.Next;
        continue;
      end;
      FMetaData.Add(Format('CREATE GENERATOR %s%s', { do not localize }
        [FormatIdentifier(FDatabase.SQLDialect, GenName), TERM]));
      qryGenerator.Next;
    end;
  finally
    qryGenerator.Free;
  end;
end;

{ ListIndex
  Functional description
  Define all non-constraint indices
  Use a static SQL query to get the info and print it.

  Uses get_index_segment to provide a key list for each index }

procedure TpFIBExtract.ListIndex(const ObjectName: String; ExtractType: TExtractType);
const
  IndexSQL =
    'SELECT  IDX.RDB$RELATION_NAME, IDX.RDB$INDEX_NAME, IDX.RDB$UNIQUE_FLAG, IDX.RDB$INDEX_TYPE, IDX.RDB$EXPRESSION_SOURCE '
    + { do not localize }
    'FROM RDB$INDICES IDX JOIN RDB$RELATIONS RELC ON ' + { do not localize }
    '  IDX.RDB$RELATION_NAME = RELC.RDB$RELATION_NAME ' + { do not localize }
    'WHERE (RELC.RDB$SYSTEM_FLAG <> 1 OR RELC.RDB$SYSTEM_FLAG IS NULL) AND ' + { do not localize }
    '  NOT EXISTS (SELECT * FROM RDB$RELATION_CONSTRAINTS RC ' + { do not localize }
    '    WHERE RC.RDB$INDEX_NAME = IDX.RDB$INDEX_NAME) ' + { do not localize }
    'ORDER BY IDX.RDB$RELATION_NAME, IDX.RDB$INDEX_NAME'; { do not localize }

  IndexNameSQL =
    'SELECT  IDX.RDB$RELATION_NAME, IDX.RDB$INDEX_NAME, IDX.RDB$UNIQUE_FLAG, IDX.RDB$INDEX_TYPE, IDX.RDB$EXPRESSION_SOURCE '
    + { do not localize }
    'FROM RDB$INDICES IDX JOIN RDB$RELATIONS RELC ON ' + { do not localize }
    '  IDX.RDB$RELATION_NAME = RELC.RDB$RELATION_NAME ' + { do not localize }
    'WHERE (RELC.RDB$SYSTEM_FLAG <> 1 OR RELC.RDB$SYSTEM_FLAG IS NULL) AND ' + { do not localize }
    '  RELC.RDB$RELATION_NAME = :RelationName AND ' + { do not localize }
    '  NOT EXISTS (SELECT * FROM RDB$RELATION_CONSTRAINTS RC ' + { do not localize }
    '    WHERE RC.RDB$INDEX_NAME = IDX.RDB$INDEX_NAME) ' + { do not localize }
    'ORDER BY IDX.RDB$RELATION_NAME, IDX.RDB$INDEX_NAME'; { do not localize }

  IndexByNameSQL =
    'SELECT  IDX.RDB$RELATION_NAME, IDX.RDB$INDEX_NAME, IDX.RDB$UNIQUE_FLAG, IDX.RDB$INDEX_TYPE, IDX.RDB$EXPRESSION_SOURCE '
    + { do not localize }
    'FROM RDB$INDICES IDX JOIN RDB$RELATIONS RELC ON ' + { do not localize }
    '  IDX.RDB$RELATION_NAME = RELC.RDB$RELATION_NAME ' + { do not localize }
    'WHERE (RELC.RDB$SYSTEM_FLAG <> 1 OR RELC.RDB$SYSTEM_FLAG IS NULL) AND ' + { do not localize }
    '  IDX.RDB$INDEX_NAME = :IndexName AND ' + { do not localize }
    '  NOT EXISTS (SELECT * FROM RDB$RELATION_CONSTRAINTS RC ' + { do not localize }
    '    WHERE RC.RDB$INDEX_NAME = IDX.RDB$INDEX_NAME) ' + { do not localize }
    'ORDER BY IDX.RDB$RELATION_NAME, IDX.RDB$INDEX_NAME'; { do not localize }

var
  qryIndex: TpFIBQuery;
  First: Boolean;
  Unique, IdxType, Line: String;
begin
  First := true;
  qryIndex := CreateFIBQuery;
  try
    if ObjectName = '' then { do not localize }
      qryIndex.sql.Text := IndexSQL
    else
    begin
      if ExtractType = etTable then
      begin
        qryIndex.sql.Text := IndexNameSQL;
        qryIndex.ParamByName('RelationName').AsString := trim(ObjectName); { do not localize }
      end
      else
      begin
        qryIndex.sql.Text := IndexByNameSQL;
        qryIndex.ParamByName('IndexName').AsString := trim(ObjectName); { do not localize }
      end;
    end;
    qryIndex.ExecQuery;
    while not qryIndex.Eof do
    begin
      if First then
      begin
        if ObjectName = '' then { do not localize }
          FMetaData.Add(NEWLINE + '/*  Index definitions for all user tables */' + NEWLINE) { do not localize }
        else
          FMetaData.Add(NEWLINE + '/*  Index definitions for ' + ObjectName + ' */' + NEWLINE); { do not localize }
        First := false;
      end; // end_if

      if qryIndex.FieldByName('RDB$UNIQUE_FLAG').AsInteger = 1 then { do not localize }
        Unique := ' UNIQUE' { do not localize }
      else
        Unique := ''; { do not localize }

      if qryIndex.FieldByName('RDB$INDEX_TYPE').AsInteger = 1 then { do not localize }
        IdxType := ' DESCENDING' { do not localize }
      else
        IdxType := ''; { do not localize }

      if qryIndex.FieldByName('RDB$EXPRESSION_SOURCE').IsNull then
      begin
        Line := Format('CREATE%s%s INDEX %s ON %s (', [Unique, IdxType, { do not localize }
          FormatIdentifier(FDatabase.SQLDialect, trim(qryIndex.FieldByName('RDB$INDEX_NAME').AsString)),
          { do not localize }
          FormatIdentifier(FDatabase.SQLDialect, trim(qryIndex.FieldByName('RDB$RELATION_NAME').AsString))]);
        { do not localize }

        Line := Line + GetIndexSegments(trim(qryIndex.FieldByName('RDB$INDEX_NAME').AsString)) + { do not localize }
          ')' + TERM; { do not localize }
      end
      else
        Line := Format('CREATE%s%s INDEX %s ON %s COMPUTED BY %s', [Unique, IdxType, { do not localize }
          FormatIdentifier(FDatabase.SQLDialect, trim(qryIndex.FieldByName('RDB$INDEX_NAME').AsString)),
          { do not localize }
          FormatIdentifier(FDatabase.SQLDialect, trim(qryIndex.FieldByName('RDB$RELATION_NAME').AsString)),
          trim(qryIndex.FieldByName('RDB$EXPRESSION_SOURCE').AsString)]) + TERM; { do not localize }

      FMetaData.Add(Line);
      qryIndex.Next;
    end;
  finally
    qryIndex.Free;
  end;
end;

{ ListViews
  Functional description
  Show text of views.
  Use a SQL query to get the info and print it.
  Note: This should also contain check option }

procedure TpFIBExtract.ListViews(const ViewName: String);
const
  ViewSQL = 'SELECT RDB$RELATION_NAME, RDB$OWNER_NAME, RDB$VIEW_SOURCE ' + { do not localize }
    'FROM RDB$RELATIONS ' + { do not localize }
    'WHERE ' + { do not localize }
    '  (RDB$SYSTEM_FLAG <> 1 OR RDB$SYSTEM_FLAG IS NULL) AND ' + { do not localize }
    '  NOT RDB$VIEW_BLR IS NULL AND ' + { do not localize }
    '  RDB$FLAGS = 1 ' + { do not localize }
    'ORDER BY RDB$RELATION_ID'; { do not localize }

  ViewNameSQL = 'SELECT RDB$RELATION_NAME, RDB$OWNER_NAME, RDB$VIEW_SOURCE ' + { do not localize }
    'FROM RDB$RELATIONS ' + { do not localize }
    'WHERE ' + { do not localize }
    '  (RDB$SYSTEM_FLAG <> 1 OR RDB$SYSTEM_FLAG IS NULL) AND ' + { do not localize }
    '  NOT RDB$VIEW_BLR IS NULL AND ' + { do not localize }
    '  RDB$FLAGS = 1 AND ' + { do not localize }
    '  RDB$RELATION_NAME = :ViewName ' + { do not localize }
    'ORDER BY RDB$RELATION_ID'; { do not localize }

  ColumnSQL = 'SELECT RDB$FIELD_NAME FROM RDB$RELATION_FIELDS ' + { do not localize }
    'WHERE ' + { do not localize }
    '  RDB$RELATION_NAME = :RELATION_NAME ' + { do not localize }
    'ORDER BY RDB$FIELD_POSITION'; { do not localize }

var
  qryView, qryColumns: TpFIBQuery;
  SList: TStrings;
begin
  qryView := CreateFIBQuery;
  qryColumns := CreateFIBQuery;
  SList := TStringList.Create;
  try
    if ViewName = '' then { do not localize }
      qryView.sql.Text := ViewSQL
    else
    begin
      qryView.sql.Text := ViewNameSQL;
      qryView.ParamByName('ViewName').AsString := trim(ViewName); { do not localize }
    end;
    qryColumns.sql.Text := ColumnSQL;
    qryView.ExecQuery;
    while not qryView.Eof do
    begin
      SList.Add(Format('%s/* View: %s, Owner: %s */%s', { do not localize }
        [NEWLINE, trim(qryView.FieldByName('RDB$RELATION_NAME').AsString), { do not localize }
        trim(qryView.FieldByName('RDB$OWNER_NAME').AsString), NEWLINE])); { do not localize }

      SList.Add(Format('CREATE VIEW %s (', [FormatIdentifier(FDatabase.SQLDialect, { do not localize }
        trim(qryView.FieldByName('RDB$RELATION_NAME').AsString))])); { do not localize }

      qryColumns.ParamByName('RELATION_NAME').AsString := { do not localize }
        trim(qryView.FieldByName('RDB$RELATION_NAME').AsString); { do not localize }
      qryColumns.ExecQuery;
      while not qryColumns.Eof do
      begin
        SList.Add('  ' + FormatIdentifier(FDatabase.SQLDialect, { do not localize }
          trim(qryColumns.FieldByName('RDB$FIELD_NAME').AsString))); { do not localize }
        qryColumns.Next;
        if not qryColumns.Eof then
          SList.Strings[SList.Count - 1] := SList.Strings[SList.Count - 1] + ', '; { do not localize }
      end;
      qryColumns.Close;
      SList.Text := SList.Text + Format(') AS%s', [NEWLINE]); { do not localize }
      if not qryView.FieldByName('RDB$VIEW_SOURCE').IsNull then { do not localize }
        SList.Text := SList.Text + trim(qryView.FieldByName('RDB$VIEW_SOURCE').AsString); { do not localize }
      SList.Text := SList.Text + Format('%s%s', [TERM, NEWLINE]); { do not localize }
      FMetaData.AddStrings(SList);
      SList.Clear;
      qryView.Next;
    end;
  finally
    qryView.Free;
    qryColumns.Free;
    SList.Free;
  end;
end;

{ ListDescribes
  Functional description
  List all describes defined in the database (as in IBExpert)

  Parameters:  none }

procedure TpFIBExtract.ListDescribes(const DescribeName: String = ''; const DescribeFieldName: String = '');
const
  DescribeSQL = 'select * from RDB$RELATIONS WHERE RDB$DESCRIPTION <> '''' ORDER BY RDB$DESCRIPTION';
  { do not localize }

  DescribeNameSQL = 'select * from RDB$RELATIONS ' + { do not localize }
    'WHERE RDB$RELATION_NAME = :DescribeName ' + { do not localize }
    'ORDER BY RDB$DESCRIPTION'; { do not localize }

  DescribeFieldNameSQL = 'select * from RDB$RELATION_FIELDS ' + { do not localize }
    'WHERE RDB$RELATION_NAME = :DescribeName ' + { do not localize }
    'AND RDB$FIELD_NAME = :DescribeFieldName ' + { do not localize }
    'ORDER BY RDB$DESCRIPTION'; { do not localize }

var
  First: Boolean;
  qryDescribe: TpFIBQuery;
begin
  First := true;
  qryDescribe := CreateFIBQuery;
  try
    if DescribeName = '' then { do not localize }
      qryDescribe.sql.Text := DescribeSQL
    else if DescribeFieldName <> '' then { do not localize }
    begin
      qryDescribe.sql.Text := DescribeFieldNameSQL;
      qryDescribe.ParamByName('DescribeName').AsString := trim(DescribeName); { do not localize }
      qryDescribe.ParamByName('DescribeFieldName').AsString := trim(DescribeFieldName); { do not localize }
    end
    else
    begin
      qryDescribe.sql.Text := DescribeNameSQL;
      qryDescribe.ParamByName('DescribeName').AsString := trim(DescribeName); { do not localize }
    end;

    qryDescribe.ExecQuery;
    while not qryDescribe.Eof do
    begin
      if First then
      begin
        FMetaData.Add(''); { do not localize }
        if DescribeFieldName = '' then { do not localize }
          FMetaData.Add('/*  Descriptions (as Describe in IBExpert) */') { do not localize }
        else
          FMetaData.Add('/*  Fields Descriptions (as Describe in IBExpert) */'); { do not localize }
        FMetaData.Add(''); { do not localize }
        First := false;
      end; // end_if

      if DescribeFieldName = '' then { do not localize }
        // examples DESCRIBE TABLE COMPONENTS 'Є®¬Ї®­Ґ­вл';
        FMetaData.Add(Format('DESCRIBE TABLE %s %s%s', { do not localize }
          [FormatIdentifier(FDatabase.SQLDialect, trim(qryDescribe.FieldByName('RDB$RELATION_NAME').AsString)),
          { do not localize }
          QuotedStr(trim(qryDescribe.FieldByName('RDB$DESCRIPTION').AsString)), TERM])) { do not localize }
      else
        // examples DESCRIBE FIELD NAME TABLE COMPONENTS 'Ї®«Ґ Ё¬Ґ­Ё';
        FMetaData.Add(Format('DESCRIBE FIELD %s TABLE %s %s%s', { do not localize }
          [FormatIdentifier(FDatabase.SQLDialect, trim(qryDescribe.FieldByName('RDB$FIELD_NAME').AsString)),
          { do not localize }
          FormatIdentifier(FDatabase.SQLDialect, trim(qryDescribe.FieldByName('RDB$RELATION_NAME').AsString)),
          { do not localize }
          QuotedStr(trim(qryDescribe.FieldByName('RDB$DESCRIPTION').AsString)), TERM])); { do not localize }

      qryDescribe.Next;
    end;
  finally
    qryDescribe.Free;
  end;
end;

{ PrintSet
  Functional description
  print (using ISQL_printf) the word "SET"
  if the first line of the ALTER DATABASE
  settings options. Also, add trailing
  comma for end of prior line if needed.

  uses Print_buffer, a global }

function TpFIBExtract.PrintSet(var Used: Boolean): String;
begin
  if not Used then
  begin
    Result := '  SET '; { do not localize }
    Used := true;
  end
  else
    Result := Format(', %s      ', [NEWLINE]); { do not localize }
end;

{
  PrintValidation
  Functional description
  This does some minor syntax adjustmet for extracting
  validation blobs and computed fields.
  if it does not start with the word CHECK
  if this is a computed field blob,look for () or insert them.
  if flag = false, this is a validation clause,
  if flag = true, this is a computed field }

function TpFIBExtract.PrintValidation(ToValidate: String; flag: Boolean): String;
var
  IsSQL: Boolean;
begin
  IsSQL := false;

  Result := ''; { do not localize }
  ToValidate := trim(ToValidate);

  if flag then
  begin
    if ToValidate[1] = '(' then { do not localize }
      IsSQL := true;
  end
  else if (Pos(ToValidate, 'check') = 1) or (Pos(ToValidate, 'CHECK') = 1) then { do not localize }
    IsSQL := true;

  if not IsSQL then
  begin
    if flag then
      Result := Result + '/* ' + ToValidate + ' */' { do not localize }
    else
      Result := Result + '(' + ToValidate + ')'; { do not localize }
  end
  else
    Result := ToValidate;
end;

procedure TpFIBExtract.SetDatabase(const Value: TpFIBDatabase);
begin
  if FDatabase <> Value then
  begin
    FDatabase := Value;
    if (not Assigned(FTransaction)) and (FDatabase <> nil) then
      Transaction := (FDatabase.DefaultTransaction as TpFIBTransaction);
  end;
end;

procedure TpFIBExtract.SetTransaction(const Value: TpFIBTransaction);
begin
  if FTransaction <> Value then
  begin
    FTransaction := Value;
    if (not Assigned(FDatabase)) and (FTransaction <> nil) then
      Database := (FTransaction.DefaultDatabase as TpFIBDatabase);
  end;
end;

procedure TpFIBExtract.ExtractObject(ObjectType: TExtractObjectTypes; const ObjectName: String = '';
  ExtractTypes: TExtractTypes = []);
var
  DidActivate: Boolean;
begin
  DidActivate := false;
  if not FTransaction.Active then
  begin
    FTransaction.StartTransaction;
    DidActivate := true;
  end;
  FMetaData.Clear;
  case ObjectType of
    eoDatabase:
      ExtractDDL(true, '');
    eoDomain:
      if etTable in ExtractTypes then
        ListDomains(ObjectName, etTable)
      else
        ListDomains(ObjectName);
    eoTable:
      begin
        if ObjectName <> '' then
        begin
          if etDomain in ExtractTypes then
            ListDomains(ObjectName, etTable);
          ExtractListTable(ObjectName, '', false);
          if etIndex in ExtractTypes then
            ListIndex(ObjectName, etTable);
          if etForeign in ExtractTypes then
            ListForeign(ObjectName, etTable);
          if etCheck in ExtractTypes then
            ListCheck(ObjectName, etTable);
          if etTrigger in ExtractTypes then
            ListTriggers(ObjectName, etTable);
          if etGrant in ExtractTypes then
            ShowGrants(ObjectName, TERM);
          if etData in ExtractTypes then
            ListData(ObjectName);
        end
        else
          ListAllTables(true);
      end;
    eoView:
      begin
        ListViews(ObjectName);
        if etTrigger in ExtractTypes then
          ListTriggers(ObjectName, etTable);
      end;
    eoProcedure:
      ListProcs(ObjectName, (etAlterProc in ExtractTypes));
    eoFunction:
      ListFunctions(ObjectName);
    eoGenerator:
      ListGenerators(ObjectName);
    eoException:
      ListException(ObjectName);
    eoBLOBFilter:
      ListFilters(ObjectName);
    eoRole:
      ListRoles(ObjectName);
    eoTrigger:
      if etTable in ExtractTypes then
        ListTriggers(ObjectName, etTable)
      else
        ListTriggers(ObjectName);
    eoForeign:
      if etTable in ExtractTypes then
        ListForeign(ObjectName, etTable)
      else
        ListForeign(ObjectName);
    eoIndexes:
      if etTable in ExtractTypes then
        ListIndex(ObjectName, etTable)
      else
        ListIndex(ObjectName);
    eoChecks:
      if etTable in ExtractTypes then
        ListCheck(ObjectName, etTable)
      else
        ListCheck(ObjectName);
    eoData:
      ListData(ObjectName);
  end;
  if DidActivate then
    FTransaction.Commit;
end;

function TpFIBExtract.GetFieldType(FieldType, FieldSubType, FieldScale, FieldSize, FieldPrec,
  FieldLen: Integer): String;
var
  i: Integer;
  PrecisionKnown: Boolean;
begin
  Result := '';
  for i := Low(ColumnTypes) to High(ColumnTypes) do
    if FieldType = ColumnTypes[i].SqlType then
    begin
      PrecisionKnown := false;
      if FDatabase.ODSMajorVersion >= ODS_VERSION10 then
      begin
        if FieldType in [blr_short, blr_long, blr_int64] then
        begin
          { We are ODS >= 10 and could be any Dialect }
          if (FieldPrec <> 0) and (FieldSubType > 0) and (FieldSubType <= MAX_INTSUBTYPES) then
          begin
            Result := Result + Format('%s(%d, %d)', [ { do not localize }
              IntegralSubtypes[FieldSubType], FieldPrec, -1 * FieldScale]);
            PrecisionKnown := true;
          end;
        end;
      end;
      if PrecisionKnown = false then
      begin
        { Take a stab at numerics and decimals }
        if (FieldType = blr_short) and (FieldScale < 0) then
          Result := Result + Format('NUMERIC(4, %d)', { do not localize }
            [-FieldScale])
        else if (FieldType = blr_long) and (FieldScale < 0) then
          Result := Result + Format('NUMERIC(9, %d)', { do not localize }
            [-FieldScale])
        else if (FieldType = blr_double) and (FieldScale < 0) then
          Result := Result + Format('NUMERIC(15, %d)', { do not localize }
            [-FieldScale])
        else
          Result := Result + ColumnTypes[i].TypeName;
      end;
      break;
    end;
  if (FieldType in [blr_text, blr_varying]) and (FieldSize <> 0) then
    Result := Result + Format('(%d)', [FieldSize]); { do not localize }
end;

{ S H O W _ g r a n t s
  Functional description
  Show grants for given object name
  This function is also called by extract for privileges.
  It must extract granted privileges on tables/views to users,
  - these may be compound, so put them on the same line.
  Grant execute privilege on procedures to users
  Grant various privilegs to procedures.
  All privileges may have the with_grant option set. }

procedure TpFIBExtract.ShowGrants(const MetaObject, Terminator: String);
const
  { This query only finds tables, eliminating owner privileges }
  OwnerPrivSQL = 'SELECT PRV.RDB$USER, PRV.RDB$GRANT_OPTION, PRV.RDB$FIELD_NAME, ' + { do not localize }
    '       PRV.RDB$USER_TYPE, PRV.RDB$PRIVILEGE ' + { do not localize }
    'FROM RDB$USER_PRIVILEGES PRV, RDB$RELATIONS REL ' + { do not localize }
    'WHERE ' + { do not localize }
    '  PRV.RDB$RELATION_NAME = :METAOBJECT AND ' + { do not localize }
    '  REL.RDB$RELATION_NAME = :METAOBJECT AND ' + { do not localize }
    '  PRV.RDB$PRIVILEGE <> ''M'' AND ' + { do not localize }
    '  REL.RDB$OWNER_NAME <> PRV.RDB$USER ' + { do not localize }
    'ORDER BY  PRV.RDB$USER, PRV.RDB$FIELD_NAME, PRV.RDB$GRANT_OPTION'; { do not localize }

  ProcPrivSQL = 'SELECT PRV.RDB$USER, PRV.RDB$GRANT_OPTION, PRV.RDB$FIELD_NAME, ' + { do not localize }
    '       PRV.RDB$USER_TYPE, PRV.RDB$PRIVILEGE, PRV.RDB$RELATION_NAME ' + { do not localize }
    'FROM RDB$USER_PRIVILEGES PRV, RDB$PROCEDURES PRC ' + { do not localize }
    'where ' + { do not localize }
    '  PRV.RDB$OBJECT_TYPE = 5 AND ' + { do not localize }
    '  PRV.RDB$RELATION_NAME = :METAOBJECT AND ' + { do not localize }
    '  PRC.RDB$PROCEDURE_NAME = :METAOBJECT AND ' + { do not localize }
    '  PRV.RDB$PRIVILEGE = ''X'' AND ' + { do not localize }
    '  PRC.RDB$OWNER_NAME <> PRV.RDB$USER ' + { do not localize }
    'ORDER BY PRV.RDB$USER, PRV.RDB$FIELD_NAME, PRV.RDB$GRANT_OPTION'; { do not localize }

  RolePrivSQL = 'SELECT * FROM RDB$USER_PRIVILEGES ' + { do not localize }
    'WHERE ' + { do not localize }
    '  RDB$OBJECT_TYPE = 13 AND ' + { do not localize }
    '  RDB$USER_TYPE = 8  AND ' + { do not localize }
    '  RDB$RELATION_NAME = :METAOBJECT AND ' + { do not localize }
    '  RDB$PRIVILEGE = ''M'' ' + { do not localize }
    'ORDER BY RDB$USER'; { do not localize }

var
  PrevUser, PrevField, WithOption, PrivString, ColString, UserString, FieldName, User: String;
  c: Char;
  PrevOption, PrivFlags, GrantOption: Integer;
  First, PrevFieldNull: Boolean;
  qryOwnerPriv: TpFIBQuery;

  { Given a bit-vector of privileges, turn it into a
    string list. }
  function MakePrivString(cflags: Integer): String;
  var
    i: Integer;
  begin
    for i := Low(PrivTypes) to High(PrivTypes) do
    begin
      if (cflags and PrivTypes[i].PrivFlag) <> 0 then
      begin
        if Result <> '' then { do not localize }
          Result := Result + ', '; { do not localize }
        Result := Result + PrivTypes[i].PrivString;
      end; // end_if
    end; // end_for
  end; // end_fcn MakePrivDtring

begin
  if MetaObject = '' then
    exit;

  First := true;
  PrevOption := -1;
  PrevUser := '';
  PrivString := '';
  ColString := '';
  WithOption := '';
  PrivFlags := 0;
  PrevFieldNull := false;
  PrevField := '';

  qryOwnerPriv := CreateFIBQuery;
  try
    qryOwnerPriv.sql.Text := OwnerPrivSQL;
    qryOwnerPriv.ParamByName('metaobject').AsString := trim(MetaObject); { do not localize }
    qryOwnerPriv.ExecQuery;
    while not qryOwnerPriv.Eof do
    begin
      { Sometimes grant options are null, sometimes 0.  Both same }
      if qryOwnerPriv.FieldByName('RDB$GRANT_OPTION').IsNull then { do not localize }
        GrantOption := 0
      else
        GrantOption := qryOwnerPriv.FieldByName('RDB$GRANT_OPTION').AsInteger; { do not localize }

      if qryOwnerPriv.FieldByName('RDB$FIELD_NAME').IsNull then { do not localize }
        FieldName := ''
      else
        FieldName := trim(qryOwnerPriv.FieldByName('RDB$FIELD_NAME').AsString); { do not localize }

      User := trim(qryOwnerPriv.FieldByName('RDB$USER').AsString); { do not localize }
      { Print a new grant statement for each new user or change of option }

      if ((PrevUser <> '') and (PrevUser <> User)) or
        ((Not First) and (PrevFieldNull <> qryOwnerPriv.FieldByName('RDB$FIELD_NAME').IsNull)) or { do not localize }
        ((not PrevFieldNull) and (PrevField <> FieldName)) or ((PrevOption <> -1) and (PrevOption <> GrantOption)) then
      begin
        PrivString := MakePrivString(PrivFlags);

        First := false;
        FMetaData.Add(Format('GRANT %s%s ON %s TO %s%s%s', [PrivString, { do not localize }
          ColString, FormatIdentifier(FDatabase.SQLDialect, MetaObject), UserString, WithOption, Terminator]));
        { re-initialize strings }

        PrivString := '';
        WithOption := '';
        ColString := '';
        PrivFlags := 0;
      end; // end_if

      PrevUser := User;
      PrevOption := GrantOption;
      PrevFieldNull := qryOwnerPriv.FieldByName('RDB$FIELD_NAME').IsNull; { do not localize }
      PrevField := FieldName;

      case qryOwnerPriv.FieldByName('RDB$USER_TYPE').AsInteger of { do not localize }
        obj_relation, obj_view, obj_trigger, obj_procedure, obj_sql_role:
          UserString := FormatIdentifier(FDatabase.SQLDialect, User);
      else
        UserString := User;
      end; // end_case

      case qryOwnerPriv.FieldByName('RDB$USER_TYPE').AsInteger of { do not localize }
        obj_view:
          UserString := 'VIEW ' + UserString; { do not localize }
        obj_trigger:
          UserString := 'TRIGGER ' + UserString; { do not localize }
        obj_procedure:
          UserString := 'PROCEDURE ' + UserString; { do not localize }
      end; // end_case

      c := trim(qryOwnerPriv.FieldByName('RDB$PRIVILEGE').AsString)[1]; { do not localize }

      case c of
        'S':
          PrivFlags := PrivFlags or priv_SELECT; { do not localize }
        'I':
          PrivFlags := PrivFlags or priv_INSERT; { do not localize }
        'U':
          PrivFlags := PrivFlags or priv_UPDATE; { do not localize }
        'D':
          PrivFlags := PrivFlags or priv_DELETE; { do not localize }
        'R':
          PrivFlags := PrivFlags or priv_REFERENCES; { do not localize }
        'X':
          ; { do not localize }
        { Execute should not be here -- special handling below }
      else
        PrivFlags := PrivFlags or priv_UNKNOWN;
      end; // end_switch

      { Column level privileges for update only }

      if FieldName = '' then
        ColString := ''
      else
        ColString := Format(' (%s)', [FormatIdentifier(FDatabase.SQLDialect, FieldName)]); { do not localize }

      if GrantOption <> 0 then
        WithOption := ' WITH GRANT OPTION'; { do not localize }

      qryOwnerPriv.Next;
    end;
    { Print last case if there was anything to print }
    if PrevOption <> -1 then
    begin
      PrivString := MakePrivString(PrivFlags);
      First := false;
      FMetaData.Add(Format('GRANT %s%s ON %s TO %s%s%s', [PrivString, { do not localize }
        ColString, FormatIdentifier(FDatabase.SQLDialect, MetaObject), UserString, WithOption, Terminator]));
      { re-initialize strings }
    end; // end_if
    qryOwnerPriv.Close;

    if First then
    begin
      { Part two is for stored procedures only }
      qryOwnerPriv.sql.Text := ProcPrivSQL;
      qryOwnerPriv.ParamByName('metaobject').AsString := trim(MetaObject); { do not localize }
      qryOwnerPriv.ExecQuery;
      while not qryOwnerPriv.Eof do
      begin
        First := false;
        User := trim(qryOwnerPriv.FieldByName('RDB$USER').AsString); { do not localize }

        case qryOwnerPriv.FieldByName('RDB$USER_TYPE').AsInteger of { do not localize }
          obj_relation, obj_view, obj_trigger, obj_procedure, obj_sql_role:
            UserString := FormatIdentifier(FDatabase.SQLDialect, User);
        else
          UserString := User;
        end; // end_case
        case qryOwnerPriv.FieldByName('RDB$USER_TYPE').AsInteger of { do not localize }
          obj_view:
            UserString := 'VIEW ' + UserString; { do not localize }
          obj_trigger:
            UserString := 'TRIGGER ' + UserString; { do not localize }
          obj_procedure:
            UserString := 'PROCEDURE ' + UserString; { do not localize }
        end; // end_case

        if qryOwnerPriv.FieldByName('RDB$GRANT_OPTION').AsInteger = 1 then { do not localize }
          WithOption := ' WITH GRANT OPTION' { do not localize }
        else
          WithOption := '';

        FMetaData.Add(Format('GRANT EXECUTE ON PROCEDURE %s TO %s%s%s', { do not localize }
          [FormatIdentifier(FDatabase.SQLDialect, MetaObject), UserString, WithOption, Terminator]));

        qryOwnerPriv.Next;
      end;
      qryOwnerPriv.Close;
    end;
    if First then
    begin
      qryOwnerPriv.sql.Text := RolePrivSQL;
      qryOwnerPriv.ParamByName('metaobject').AsString := trim(MetaObject); { do not localize }
      qryOwnerPriv.ExecQuery;
      while not qryOwnerPriv.Eof do
      begin
        if qryOwnerPriv.FieldByName('RDB$GRANT_OPTION').AsInteger = 1 then { do not localize }
          WithOption := ' WITH ADMIN OPTION' { do not localize }
        else
          WithOption := '';

        FMetaData.Add(Format('GRANT %s TO %s%s%s', { do not localize }
          [FormatIdentifier(FDatabase.SQLDialect, trim(qryOwnerPriv.FieldByName('RDB$RELATION_NAME').AsString)),
          { do not localize }
          trim(qryOwnerPriv.FieldByName('RDB$USER_NAME').AsString), { do not localize }
          WithOption, Terminator]));

        qryOwnerPriv.Next;
      end;
    end;
    qryOwnerPriv.Close;
  finally
    qryOwnerPriv.Free;
  end;
end;

{ ShowGrantRoles
  Functional description
  Show grants for given role name
  This function is also called by extract for privileges.
  All membership privilege may have the with_admin option set. }

procedure TpFIBExtract.ShowGrantRoles(const Terminator: String);
const
  RoleSQL = 'SELECT RDB$USER, RDB$GRANT_OPTION, RDB$RELATION_NAME ' + { do not localize }
    'FROM RDB$USER_PRIVILEGES ' + { do not localize }
    'WHERE ' + { do not localize }
    '  RDB$OBJECT_TYPE = %d AND ' + { do not localize }
    '  RDB$USER_TYPE = %d AND ' + { do not localize }
    '  RDB$PRIVILEGE = ''M'' ' + { do not localize }
    'ORDER BY  RDB$RELATION_NAME, RDB$USER'; { do not localize }

var
  WithOption, UserString: String;
  qryRole: TpFIBQuery;

begin
  qryRole := CreateFIBQuery;
  try
    qryRole.sql.Text := Format(RoleSQL, [obj_sql_role, obj_user]);
    qryRole.ExecQuery;
    while not qryRole.Eof do
    begin
      UserString := trim(qryRole.FieldByName('RDB$USER').AsString); { do not localize }

      if (not qryRole.FieldByName('RDB$GRANT_OPTION').IsNull) and { do not localize }
        (qryRole.FieldByName('RDB$GRANT_OPTION').AsInteger = 1) then { do not localize }
        WithOption := ' WITH ADMIN OPTION' { do not localize }
      else
        WithOption := '';
      FMetaData.Add(Format('GRANT %s TO %s%s%s%s', { do not localize }
        [FormatIdentifier(FDatabase.SQLDialect, trim(qryRole.FieldByName('RDB$RELATION_NAME').AsString)),
        { do not localize }
        UserString, WithOption, Terminator, NEWLINE]));

      qryRole.Next;
    end;
  finally
    qryRole.Free;
  end;
end;

{ GetProcedureArgs
  Functional description
  This function extract the procedure parameters and adds it to the
  extract file }

procedure TpFIBExtract.GetProcedureArgs(const Proc: String);
const
  { query to retrieve the input parameters. }
  ProcHeaderSQL = 'SELECT * ' + { do not localize }
    ' FROM RDB$PROCEDURE_PARAMETERS PRM JOIN RDB$FIELDS FLD ON ' + { do not localize }
    ' PRM.RDB$FIELD_SOURCE = FLD.RDB$FIELD_NAME ' + { do not localize }
    'WHERE ' + { do not localize }
    '    PRM.RDB$PROCEDURE_NAME = :PROCNAME AND ' + { do not localize }
    '    PRM.RDB$PARAMETER_TYPE = :Input ' + { do not localize }
    'ORDER BY PRM.RDB$PARAMETER_NUMBER'; { do not localize }

var
  FirstTime, PrecisionKnown: Boolean;
  Line: String;
  qryHeader: TpFIBQuery;

  function FormatParamStr: String;
  var
    i, CollationID, CharSetId, SubType: Integer;
  begin
    Result := Format('  %s ', [FormatIdentifier(FDatabase.SQLDialect,
      trim(qryHeader.FieldByName('RDB$PARAMETER_NAME').AsString))]); { do not localize }
    for i := Low(ColumnTypes) to High(ColumnTypes) do
      if qryHeader.FieldByName('RDB$FIELD_TYPE').AsInteger = ColumnTypes[i].SqlType then { do not localize }
      begin
        PrecisionKnown := false;
        if FDatabase.ODSMajorVersion >= ODS_VERSION10 then
        begin
          if qryHeader.FieldByName('RDB$FIELD_TYPE').AsInteger in [blr_short, blr_long, blr_int64]
          then { do not localize }
          begin
            { We are ODS >= 10 and could be any Dialect }
            if (FDatabase.DBSQLDialect >= 3) and (not qryHeader.FieldByName('RDB$FIELD_PRECISION').IsNull) and
            { do not localize }
              (qryHeader.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger > 0) and { do not localize }
              (qryHeader.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger <= MAX_INTSUBTYPES) then { do not localize }
            begin
              Result := Result + Format('%s(%d, %d)', [ { do not localize }
                IntegralSubtypes[qryHeader.FieldByName('RDB$FIELD_SUB_TYPE').AsInteger], { do not localize }
                qryHeader.FieldByName('RDB$FIELD_PRECISION').AsInteger, { do not localize }
                -1 * qryHeader.FieldByName('RDB$FIELD_SCALE').AsInteger]); { do not localize }
              PrecisionKnown := true;
            end;
          end;
        end;
        if PrecisionKnown = false then
        begin
          { Take a stab at numerics and decimals }
          if (qryHeader.FieldByName('RDB$FIELD_TYPE').AsInteger = blr_short) and { do not localize }
            (qryHeader.FieldByName('RDB$FIELD_SCALE').AsInteger < 0) then { do not localize }
            Result := Result + Format('NUMERIC(4, %d)', { do not localize }
              [-qryHeader.FieldByName('RDB$FIELD_SCALE').AsInteger]) { do not localize }
          else if (qryHeader.FieldByName('RDB$FIELD_TYPE').AsInteger = blr_long) and { do not localize }
            (qryHeader.FieldByName('RDB$FIELD_SCALE').AsInteger < 0) then { do not localize }
            Result := Result + Format('NUMERIC(9, %d)', { do not localize }
              [-qryHeader.FieldByName('RDB$FIELD_SCALE').AsInteger]) { do not localize }
          else if (qryHeader.FieldByName('RDB$FIELD_TYPE').AsInteger = blr_double) and { do not localize }
            (qryHeader.FieldByName('RDB$FIELD_SCALE').AsInteger < 0) then { do not localize }
            Result := Result + Format('NUMERIC(15, %d)', { do not localize }
              [-qryHeader.FieldByName('RDB$FIELD_SCALE').AsInteger]) { do not localize }
          else
            Result := Result + ColumnTypes[i].TypeName;
        end;
        break;
      end;
    if qryHeader.FieldByName('RDB$FIELD_TYPE').AsInteger in [blr_text, blr_varying] then { do not localize }
      Result := Result + Format('(%d)', [GetFieldLength(qryHeader)]); { do not localize }

    { Show international character sets and collations }

    if (not qryHeader.FieldByName('RDB$COLLATION_ID').IsNull) or { do not localize }
      (not qryHeader.FieldByName('RDB$CHARACTER_SET_ID').IsNull) then { do not localize }
    begin
      if qryHeader.FieldByName('RDB$COLLATION_ID').IsNull then { do not localize }
        CollationID := 0
      else
        CollationID := qryHeader.FieldByName('RDB$COLLATION_ID').AsInteger; { do not localize }

      if qryHeader.FieldByName('RDB$CHARACTER_SET_ID').IsNull then { do not localize }
        CharSetId := 0
      else
        CharSetId := qryHeader.FieldByName('RDB$CHARACTER_SET_ID').AsInteger; { do not localize }

      Result := Result + GetCharacterSets(CharSetId, CollationID, false);
    end;
    if qryHeader.FieldByName('RDB$FIELD_TYPE').AsInteger = blr_blob then
    begin
      SubType := qryHeader.FieldByName('RDB$FIELD_SUB_TYPE').AsShort; { do not localize }
      Result := Result + ' SUB_TYPE '; { do not localize }
      if (SubType > 0) and (SubType <= MAXSUBTYPES) then
        Result := Result + SubTypes[SubType]
      else
        Result := Result + IntToStr(SubType);
      Result := Result + Format(' SEGMENT SIZE %d', { do not localize }
        [qryHeader.FieldByName('RDB$SEGMENT_LENGTH').AsInteger]); { do not localize }
    end;
  end;

begin
  FirstTime := true;
  qryHeader := CreateFIBQuery;
  try
    qryHeader.sql.Text := ProcHeaderSQL;
    qryHeader.ParamByName('procname').AsString := trim(Proc); { do not localize }
    qryHeader.ParamByName('Input').AsInteger := 0; { do not localize }
    qryHeader.ExecQuery;
    while not qryHeader.Eof do
    begin
      if FirstTime then
      begin
        FirstTime := false;
        FMetaData.Add('('); { do not localize }
      end;

      Line := FormatParamStr;

      qryHeader.Next;
      if not qryHeader.Eof then
        Line := Line + ','; { do not localize }
      FMetaData.Add(Line);
    end;

    { If there was at least one param, close parens }
    if not FirstTime then
    begin
      FMetaData.Add(')'); { do not localize }
    end;

    FirstTime := true;
    qryHeader.Close;
    qryHeader.ParamByName('Input').AsInteger := 1; { do not localize }
    qryHeader.ExecQuery;

    while not qryHeader.Eof do
    begin
      if FirstTime then
      begin
        FirstTime := false;
        FMetaData.Add('RETURNS' + NEWLINE + '('); { do not localize }
      end;

      Line := FormatParamStr;

      qryHeader.Next;
      if not qryHeader.Eof then
        Line := Line + ','; { do not localize }
      FMetaData.Add(Line);
    end;

    { If there was at least one param, close parens }
    if not FirstTime then
    begin
      FMetaData.Add(')'); { do not localize }
    end;

    FMetaData.Add('AS'); { do not localize }
  finally
    qryHeader.Free;
  end;
end;

procedure TpFIBExtract.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (AComponent = FDatabase) and (Operation = opRemove) then
    FDatabase := nil;
  if (AComponent = FTransaction) and (Operation = opRemove) then
    FTransaction := nil;
end;

procedure TpFIBExtract.ListData(const ObjectName: String);
const
  SelectSQL = 'SELECT * FROM %s'; { do not localize }
var
  qrySelect: TpFIBQuery;
  Line, FieldName { ,Fields, Values } : String;
  i: Integer;
begin
  qrySelect := CreateFIBQuery;
  try
    qrySelect.sql.Text := Format(SelectSQL, [FormatIdentifier(FDatabase.SQLDialect, ObjectName)]);
    qrySelect.ExecQuery;
    // ?
    (* Fields := '';
      for i := 0 to qrySelect.Current.Count - 1 do
      if (qrySelect.Fields[i].SQLType <> SQL_ARRAY) and
      (qrySelect.Fields[i].SQLType <> SQL_BLOB) then
      begin
      FieldName := qrySelect.Fields[i].SQLVAR.sqlname;
      if Fields <> '' then
      Fields := Fields + ', '; {do not localize}
      Fields := Fields + FormatIdentifier(FDatabase.SQLDialect, FieldName);
      end; *)
    while not qrySelect.Eof do
    begin
      Line := 'UPDATE ' + FormatIdentifier(FDatabase.SQLDialect, ObjectName) + ' SET '; { do not localize }
      // insert
      for i := 1 to qrySelect.Current.Count - 1 do
        if (qrySelect.Fields[i].SqlType <> SQL_ARRAY) and (qrySelect.Fields[i].SqlType <> SQL_BLOB) then
        begin
          SetString(FieldName, qrySelect.Fields[i].AsXSQLVAR.sqlname, qrySelect.Fields[i].AsXSQLVAR.sqlname_length);
          Line := Line + FormatIdentifier(FDatabase.SQLDialect, FieldName) + '=';

          // ?        if Values <> '' then
          // ?          Values := Values + ', ';
          if qrySelect.Fields[i].IsNull and (qrySelect.Fields[i].SqlType <> SQL_ARRAY) and
            (qrySelect.Fields[i].SqlType <> SQL_BLOB) then
          begin
            // ?          Values := Values + 'NULL'; {do not localize}
            Line := Line + 'NULL'; { do not localize }
            if i <> (qrySelect.Current.Count - 1) then
              Line := Line + ', '; { do not localize }
          end
          else
            case qrySelect.Fields[i].SqlType of
              // ?
              (* SQL_TEXT, SQL_VARYING :
                Values := Values + QuotedStr(trim(qrySelect.Fields[i].AsString));
                SQL_TYPE_DATE :
                Values := Values + QuotedStr(DateToStr(qrySelect.Fields[i].AsDate));
                SQL_TYPE_TIME :
                Values := Values + QuotedStr(TimeToStr(qrySelect.Fields[i].AsTime));
                SQL_TIMESTAMP :
                Values := Values + QuotedStr(DateTimeToStr(qrySelect.Fields[i].AsDateTime));
                SQL_SHORT, SQL_LONG, SQL_INT64,
                SQL_DOUBLE, SQL_FLOAT, SQL_D_FLOAT:
                Values := Values + trim(qrySelect.Fields[i].AsString);
                SQL_ARRAY, SQL_BLOB : ;
                else
                IBError(ibxeInvalidDataConversion, [nil]); *)

              SQL_TEXT, SQL_VARYING, SQL_TYPE_DATE, SQL_TYPE_TIME, SQL_TIMESTAMP:
                begin
                  Line := Line + QuotedStr(trim(qrySelect.Fields[i].AsString));
                  if i <> (qrySelect.Current.Count - 1) then
                    Line := Line + ', '; { do not localize }
                end;
              SQL_SHORT, SQL_LONG, SQL_INT64, SQL_DOUBLE, SQL_FLOAT, SQL_D_FLOAT:
                begin
                  Line := Line + trim(qrySelect.Fields[i].AsString);
                  if i <> (qrySelect.Current.Count - 1) then
                    Line := Line + ', '; { do not localize }
                end;
              SQL_ARRAY, SQL_BLOB:
                ;
            else
              FIBError(feInvalidDataConversion, [nil]);
            end;
          // ?      Line := Line + Values + ')' + Term;   {do not localize}
        end;
      //
      SetString(FieldName, qrySelect.Fields[0].AsXSQLVAR.sqlname, qrySelect.Fields[0].AsXSQLVAR.sqlname_length);
      Line := Line + ' WHERE ' + FormatIdentifier(FDatabase.SQLDialect, FieldName) + '=' +
        trim(qrySelect.Fields[0].AsString);
      Line := Line + TERM; { do not localize }
      FMetaData.Add(Line);
      qrySelect.Next;
    end;
  finally
    qrySelect.Free;
  end;
end;

procedure TpFIBExtract.ListRoles(const ObjectName: String);
const
  RolesSQL = 'select * from RDB$ROLES ' + { do not localize }
    'order by RDB$ROLE_NAME'; { do not localize }

  RolesByNameSQL = 'select * from RDB$ROLES ' + { do not localize }
    'WHERE RDB$ROLE_NAME = :RoleName ' + { do not localize }
    'order by RDB$ROLE_NAME'; { do not localize }

var
  qryRoles: TpFIBQuery;
  PrevOwner, RoleName, OwnerName: String;
begin
  { Process GRANT roles }
  qryRoles := CreateFIBQuery;
  try
    if FDatabase.ODSMajorVersion >= ODS_VERSION9 then
    begin
      PrevOwner := '';
      FMetaData.Add('');
      FMetaData.Add('/* Grant Roles for this database */'); { do not localize }
      FMetaData.Add('');

      if ObjectName = '' then
        qryRoles.sql.Text := RolesSQL
      else
      begin
        qryRoles.sql.Text := RolesByNameSQL;
        qryRoles.ParamByName('RoleName').AsString := trim(ObjectName); { do not localize }
      end;
      qryRoles.ExecQuery;
      try
        while not qryRoles.Eof do
        begin
          RoleName := FormatIdentifier(FDatabase.SQLDialect, trim(qryRoles.FieldByName('rdb$Role_Name').AsString));
          { do not localize }
          OwnerName := trim(qryRoles.FieldByName('rdb$Owner_Name').AsString); { do not localize }
          if PrevOwner <> OwnerName then
          begin
            FMetaData.Add('');
            FMetaData.Add(Format('/* Role: %s, Owner: %s */', [RoleName, OwnerName])); { do not localize }
            FMetaData.Add('');
            PrevOwner := OwnerName;
          end;
          FMetaData.Add('CREATE ROLE ' + RoleName + TERM); { do not localize }
          qryRoles.Next;
        end;
      finally
        qryRoles.Close;
      end;
    end;
  finally
    qryRoles.Free;
  end;
end;

function TpFIBExtract.GetFieldLength(sql: TpFIBQuery): Integer;
begin
  if sql.FieldByName('RDB$CHARACTER_LENGTH').IsNull then { do not localize }
    Result := sql.FieldByName('RDB$FIELD_LENGTH').AsInteger { do not localize }
  else
    Result := sql.FieldByName('RDB$CHARACTER_LENGTH').AsInteger; { do not localize }
end;

function TpFIBExtract.CreateFIBQuery: TpFIBQuery;
begin
  Result := TpFIBQuery.Create(FDatabase);
  if FTransaction <> FDatabase.DefaultTransaction then
    Result.Transaction := FTransaction;
end;

function TpFIBExtract.TriggerTypeName(Value: Integer): string;
begin
  Result := '';

  case Value of
    1:
      Result := 'BEFORE INSERT'; // Триггер выполняется перед вставкой записи в таблицу или просмотр.
    2:
      Result := 'AFTER INSERT'; // Триггер выполняется после вставки записи в таблицу или просмотр.
    3:
      Result := 'BEFORE UPDATE'; // Триггер выполняется перед изменением записи в таблице или просмотре.
    4:
      Result := 'AFTER UPDATE'; // Триггер выполняется после изменения записи в таблице или просмотре.
    5:
      Result := 'BEFORE DELETE'; // Триггер выполняется перед удалением записи из таблицы или просмотра.
    6:
      Result := 'AFTER DELETE'; // Триггер выполняется после удаления записи из таблицы или просмотра.
    17:
      Result := 'BEFORE INSERT OR UPDATE';
      // Триггер выполняется перед вставкой или изменением записи в таблице или просмотре.
    18:
      Result := 'AFTER INSERT OR UPDATE';
      // Триггер выполняется после вставки или изменения записи в таблице или просмотре.
    25:
      Result := 'BEFORE INSERT OR DELETE';
      // Триггер выполняется перед вставкой или удалением записи в таблице или просмотре.
    26:
      Result := 'AFTER INSERT OR DELETE';
      // Триггер выполняется после вставки или удаления записи в таблице или просмотре.
    27:
      Result := 'BEFORE UPDATE OR DELETE';
      // Триггер выполняется перед изменением или удалением записи в таблице или просмотре.
    28:
      Result := 'AFTER UPDATE OR DELETE';
      // Триггер выполняется после изменения или удаления записи в таблице или просмотре.
    113:
      Result := 'BEFORE INSERT OR UPDATE OR DELETE';
      // Триггер выполняется перед вставкой, изменением или удалением записи в таблице или просмотре.
    114:
      Result := 'AFTER INSERT OR UPDATE OR DELETE';
      // Триггер выполняется после вставки, изменения или удаления записи в таблице или просмотре.
    8192:
      Result := 'ON CONNECT'; // Триггер выполняется после установления подключения к базе данных.
    8193:
      Result := 'ON DISCONNECT'; // Триггер выполняется перед отключением от базы данных.
    8194:
      Result := 'ON TRANSACTION START'; // Триггер выполняется после старта транзакции.
    8195:
      Result := 'ON TRANSACTION COMMIT'; // Триггер выполняется перед подтверждением COMMIT транзакции.
    8196:
      Result := 'ON TRANSACTION ROLLBACK'; // Триггер выполняется перед отменой ROLLBACK транзакции.
  end;

end;

end.
