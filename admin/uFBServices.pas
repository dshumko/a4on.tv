{ @abstract(Сервисы Firebird)
  @author(Николай Войнов)
  @created(2006-03-27) @lastmod() }
unit uFBServices;

interface

uses
  System.SysUtils, System.Classes,
  fib, FIBServices;

type
  TServerSettings = record
    SrvrName: string;
    UserName: string;
    UserPass: string;
  end;

  TFBServiceClass = class of TFIBCustomService;

  TFirebirdServer = class
  private
    FServerName: string;
    FUserName: string;
    FUserPass: string;
    FOnTextNotify: TFIBServiceGetTextEvent;
    FProtocol: TFIBProtocol;
    FClientLib: string;
    function CreateServiceWitAuth(ServiceClass: TFBServiceClass): TFIBCustomService;
  public
    constructor Create;
    destructor Destroy; override;
    class function Instance(const SrvName, UserName, password: string; Protocol: TFIBProtocol = TCP;
      const ClientLib: string = 'fbclient.dll'): TFirebirdServer;

    function BackupDB(const DBName, BkName: string; Optns: TFIBBackupOptions = [NoGarbageCollection]): Boolean;

    function RestoreDB(const BkName, DBName: string; Optns: TFIBRestoreOptions = [CreateNewDB];
      APageSize: Integer = 8192): Boolean;

    function ShutdownDB(const DBName: string; Mode: TFIBShutdownMode = Forced; Timeout: Integer = 0): Boolean;

    function OnlineDB(const DBName: string): Boolean;

    function GetDBStat(const DBName: string; Optns: TFIBStatisticsOptions = [HeaderPages]): Boolean;

    // LimboTransactions, CheckDB, IgnoreChecksum, KillShadows, MendDB, SweepDB, ValidateDB, ValidateFull
    function ValidateDatabase(const DBName: string; Optns: TFIBValidateOptions = []): Boolean;
    function CheckDatabase(const DBName: string): Boolean;
    function SweepDatabase(const DBName: string): Boolean;
    function MendDatabase(const DBName: string): Boolean;

    function GetServerPropeties(Optns: TFIBServerPropertyOptions = [Version, Database]): TFIBServerProperties;

    procedure GetServerLog;

    function GetSecurityService: TFIBSecurityService;

    procedure SetupSweepInterval(ASweepInterval: Integer);
    procedure SetupSQLDialect(ASQLDialect: Integer);
    procedure SetupPageBuffers(APageBuffers: Integer);
    procedure SetupReserveSpace(AReserveSpace: Boolean);
    procedure SetupReadOnly(AReadOnly: Boolean);
    procedure SetupAsyncMode(AsyncMode: Boolean);
    procedure ExecActivateShadow;

    property ServerName: string read FServerName write FServerName;
    property UserName: string read FUserName write FUserName;
    property UserPass: string read FUserPass write FUserPass;
    property Protocol: TFIBProtocol read FProtocol write FProtocol;
    property ClientLib: string read FClientLib write FClientLib;

    property OnFbTextNotify: TFIBServiceGetTextEvent read FOnTextNotify write FOnTextNotify;
  end;

implementation

{ TFirebirdServer }

function TFirebirdServer.BackupDB(const DBName, BkName: string; Optns: TFIBBackupOptions): Boolean;
var
  ErrorFound: Boolean;
  LogStr: string;
  Srv, DB: String;
  i: Integer;
begin
  i := pos(':', DBName);
  if i > 2 then
  begin // игнорим c:\
    Srv := copy(DBName, 1, i - 1);
    DB := copy(DBName, i + 1, 255);
  end
  else
  begin
    Srv := '';
    DB := DBName;
  end;

  with TFIBBackupService(CreateServiceWitAuth(TFIBBackupService)) do
    try
      DatabaseName := DB;
      BackupFile.Add(BkName);
      if Srv <> '' then
      begin
        Protocol := TCP;
        ServerName := AnsiString(Srv);
      end;
      LoginPrompt := False;
      Options := Optns;
      OnTextNotify := FOnTextNotify;
      Verbose := Assigned(OnTextNotify);
      Attach;
      ServiceStart;
      ErrorFound := False;
      while not Eof do
      begin
        LogStr := GetNextLine;
        if not ErrorFound then
          ErrorFound := pos('GBAK: ERROR', AnsiUpperCase(LogStr)) > 0;
      end;
      Result := not ErrorFound;
    finally
      if Active then
        Detach;
      Free;
    end;
end;

function TFirebirdServer.CreateServiceWitAuth(ServiceClass: TFBServiceClass): TFIBCustomService;
begin
  Result := ServiceClass.Create(nil);
  Result.ServerName := AnsiString(ServerName);
  Result.Protocol := Protocol;
  Result.LibraryName := ClientLib;
  Result.LoginPrompt := False;
  Result.Params.Values['user_name'] := UserName;
  Result.Params.Values['password'] := UserPass;
  // Result.LibraryName := 'fbclient.dll';
end;

function TFirebirdServer.RestoreDB(const BkName, DBName: string; Optns: TFIBRestoreOptions; APageSize: Integer): Boolean;
var
  ErrorFound: Boolean;
  LogStr: string;
begin
  with TFIBRestoreService(CreateServiceWitAuth(TFIBRestoreService)) do
    try
      DatabaseName.Add(DBName);
      BackupFile.Add(BkName);
      Options := Optns;
      // PageSize := APageSize;
      // PageBuffers := APageBuffers;
      OnTextNotify := FOnTextNotify;
      Verbose := Assigned(OnTextNotify);
      Attach;
      ServiceStart;
      ErrorFound := False;
      while not Eof do
      begin
        LogStr := GetNextLine;
        if not ErrorFound then
          ErrorFound := pos('GBAK: ERROR', AnsiUpperCase(LogStr)) > 0;
      end;
      Result := not ErrorFound;
    finally
      if Active then
        Detach;
      Free;
    end;
end;

function TFirebirdServer.ShutdownDB(const DBName: string; Mode: TFIBShutdownMode; Timeout: Integer): Boolean;
begin
  with TFIBConfigService(CreateServiceWitAuth(TFIBConfigService)) do
    try
      DatabaseName := DBName;
      Attach;
      ShutdownDatabase(Mode, Timeout);
      Result := True;
    finally
      if Active then
        Detach;
      Free;
    end;
end;

function TFirebirdServer.OnlineDB(const DBName: string): Boolean;
begin
  with TFIBConfigService(CreateServiceWitAuth(TFIBConfigService)) do
    try
      DatabaseName := DBName;
      Attach;
      BringDatabaseOnline;
      Result := True;
    finally
      if Active then
        Detach;
      Free;
    end;
end;

function TFirebirdServer.GetDBStat(const DBName: string; Optns: TFIBStatisticsOptions): Boolean;
var
  LogStr: String;
begin
  with TFIBStatisticalService(CreateServiceWitAuth(TFIBStatisticalService)) do
    try
      DatabaseName := DBName;
      Options := Optns;
      OnTextNotify := FOnTextNotify;
      Attach;
      ServiceStart;
      while not Eof do
        LogStr := GetNextLine;
      Result := True;
    finally
      if Active then
        Detach;
      Free;
    end;
end;

function TFirebirdServer.GetServerPropeties(Optns: TFIBServerPropertyOptions): TFIBServerProperties;
var
  srvc: TFIBCustomService;
begin
  srvc := CreateServiceWitAuth(TFIBServerProperties);
  Result := TFIBServerProperties(srvc);
  with Result do
    try
      Options := Optns;
      Attach;
      Fetch;
    finally
      Detach;
    end;
end;

procedure TFirebirdServer.GetServerLog;
begin
  with TFIBLogService(CreateServiceWitAuth(TFIBLogService)) do
    try
      OnTextNotify := FOnTextNotify;
      Attach;
      ServiceStart;
      while not Eof do
        GetNextLine;
    finally
      Detach;
    end;
end;

function TFirebirdServer.GetSecurityService: TFIBSecurityService;
begin
  Result := TFIBSecurityService(CreateServiceWitAuth(TFIBSecurityService));
  with Result do
    try
      Attach;
      DisplayUsers;
    finally
      Detach;
    end;
end;

var
  FBServerList: TStringList;

class function TFirebirdServer.Instance(const SrvName, UserName, password: string; Protocol: TFIBProtocol;
  const ClientLib: string): TFirebirdServer;
var
  KeyStr: string;
  KeyIdx: Integer;
begin
  if not Assigned(FBServerList) then
    FBServerList := TStringList.Create;
  KeyStr := UpperCase(SrvName + ';' + UserName + ';' + password + ';' + IntToStr(Integer(Protocol)) + ';' + ClientLib);
  KeyIdx := FBServerList.IndexOf(KeyStr);
  if KeyIdx < 0 then
  begin
    Result := TFirebirdServer.Create;
    Result.ServerName := SrvName;
    Result.UserName := UserName;
    Result.UserPass := password;
    Result.Protocol := Protocol;
    Result.ClientLib := ClientLib;
    KeyIdx := FBServerList.AddObject(KeyStr, Result);
  end;
  Result := TFirebirdServer(FBServerList.Objects[KeyIdx]);
end;

destructor TFirebirdServer.Destroy;
begin

  inherited;
end;

constructor TFirebirdServer.Create;
begin
  inherited;

end;

procedure TFirebirdServer.SetupSweepInterval(ASweepInterval: Integer);
begin
  with TFIBConfigService(CreateServiceWitAuth(TFIBConfigService)) do
    try
      Attach;
      SetSweepInterval(ASweepInterval);
    finally
      Detach;
    end;
end;

procedure TFirebirdServer.SetupSQLDialect(ASQLDialect: Integer);
begin
  with TFIBConfigService(CreateServiceWitAuth(TFIBConfigService)) do
    try
      Attach;
      SetDBSqlDialect(ASQLDialect);
    finally
      Detach;
    end;
end;

procedure TFirebirdServer.SetupPageBuffers(APageBuffers: Integer);
begin
  with TFIBConfigService(CreateServiceWitAuth(TFIBConfigService)) do
    try
      Attach;
      SetPageBuffers(APageBuffers);
    finally
      Detach;
    end;
end;

procedure TFirebirdServer.ExecActivateShadow;
begin
  with TFIBConfigService(CreateServiceWitAuth(TFIBConfigService)) do
    try
      Attach;
      ActivateShadow;
    finally
      Detach;
    end;
end;

procedure TFirebirdServer.SetupReserveSpace(AReserveSpace: Boolean);
begin
  with TFIBConfigService(CreateServiceWitAuth(TFIBConfigService)) do
    try
      Attach;
      SetReserveSpace(AReserveSpace);
    finally
      Detach;
    end;
end;

procedure TFirebirdServer.SetupAsyncMode(AsyncMode: Boolean);
begin
  with TFIBConfigService(CreateServiceWitAuth(TFIBConfigService)) do
    try
      Attach;
      SetAsyncMode(AsyncMode);
    finally
      Detach;
    end;
end;

procedure TFirebirdServer.SetupReadOnly(AReadOnly: Boolean);
begin
  with TFIBConfigService(CreateServiceWitAuth(TFIBConfigService)) do
    try
      Attach;
      SetReadOnly(AReadOnly);
    finally
      Detach;
    end;
end;

function TFirebirdServer.ValidateDatabase(const DBName: string; Optns: TFIBValidateOptions): Boolean;
var
  cnt: Integer;
begin
  with TFIBValidationService(CreateServiceWitAuth(TFIBValidationService)) do
    try
      Options := Optns;
      DatabaseName := DBName;
      Attach;
      ServiceStart;
      cnt := 0;
      while not Eof do
      begin
        GetNextLine;
        Inc(cnt);
      end;
    finally
      Detach;
    end;
  Result := cnt = 1;
end;

function TFirebirdServer.CheckDatabase(const DBName: string): Boolean;
begin
  Result := ValidateDatabase(DBName, [CheckDB, ValidateDB, ValidateFull]);
end;

function TFirebirdServer.MendDatabase(const DBName: string): Boolean;
begin
  Result := ValidateDatabase(DBName, [MendDB, ValidateFull]);
end;

function TFirebirdServer.SweepDatabase(const DBName: string): Boolean;
begin
  Result := ValidateDatabase(DBName, [SweepDB]);
end;

procedure FreeServerList;
var
  i : Integer;
begin
  if Assigned(FBServerList) then
  begin
    for i := 0 to FBServerList.Count - 1 do
      if Assigned(FBServerList.Objects[i]) then
        FBServerList.Objects[i].Free;
    FBServerList.Clear;
    FBServerList.Free;
  end;
end;

initialization

finalization

FreeServerList();

end.
