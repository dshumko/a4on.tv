unit SrvServiceForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  IB_Services, uFBServices, pFIBExtract, FIBDatabase, pFIBDatabase, PrjConst, DBCtrlsEh;

type
  TSrvServiceForm = class(TForm)
    Panel4: TPanel;
    Label5: TLabel;
    Label11: TLabel;
    btnStat: TButton;
    btnRestore: TButton;
    btnBackUp: TButton;
    btnCheck: TButton;
    btnSweep: TButton;
    memServerProps: TMemo;
    btnServerProperties: TButton;
    btnServerLog: TButton;
    DBforExtract: TpFIBDatabase;
    trForExtract: TpFIBTransaction;
    edtBackupFBK: TDBEditEh;
    dlgOpen: TOpenDialog;
    edtBackupFDB: TDBEditEh;
    procedure btnServerPropertiesClick(Sender: TObject);
    procedure btnServerLogClick(Sender: TObject);
    procedure btnBackUpClick(Sender: TObject);
    procedure btnRestoreClick(Sender: TObject);
    procedure btnCheckClick(Sender: TObject);
    procedure btnSweepClick(Sender: TObject);
    procedure btnStatClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edt1EditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edtBackupFBKChange(Sender: TObject);
    procedure edtBackupFDBChange(Sender: TObject);
    procedure edtBackupFDBEditButtons0Click(Sender: TObject; var Handled: Boolean);
  private
    { Private declarations }
    // DBExtract: TpFIBExtract;
    procedure OnServerLog(Sender: TObject; const Text: string);
    procedure OnDatabaseLog(Sender: TObject; const Text: string);
    function GetFirebirdServer: TFirebirdServer;
    procedure GetDatabaseStat;
  public
    { Public declarations }
  end;

var
  SrvServiceForm: TSrvServiceForm;

implementation

uses
  DM, AtrCommon, MAIN;

{$R *.dfm}

procedure TSrvServiceForm.OnServerLog(Sender: TObject; const Text: string);
begin
  memServerProps.Lines.Add(Text);
end;

procedure TSrvServiceForm.OnDatabaseLog(Sender: TObject; const Text: string);
begin
  memServerProps.Lines.Add(Text);
end;

function TSrvServiceForm.GetFirebirdServer: TFirebirdServer;
begin
  Result := TFirebirdServer.Instance(dmMain.Server, dmMain.User, dmMain.Password, TProtocol(0), dmMain.ClientLib);
end;

procedure TSrvServiceForm.btnServerPropertiesClick(Sender: TObject);
var
  sp: TpFIBServerProperties;
  i: Integer;
begin
  sp := GetFirebirdServer.GetServerPropeties([Database, Version, ConfigParameters]);
  with memServerProps.Lines do begin
    Add(Format(rsServerVersion, [sp.VersionInfo.ServerVersion]));
    Add(Format(rsServerBuild, [sp.VersionInfo.ServerImplementation]));
    Add(Format(rsServerServicesVersion, [sp.VersionInfo.ServiceVersion]));
    Add('');
    Add(Format(rsServerConnection, [sp.DatabaseInfo.NoOfAttachments]));
    Add(Format(rsServerDatabases, [sp.DatabaseInfo.NoOfDatabases]));
    Add(rsServerCurrentDB);
    for i := 0 to sp.DatabaseInfo.NoOfDatabases - 1 do
      Add('  ' + sp.DatabaseInfo.DbName[i]);

    Add(Format(rsServerPatchDB, [sp.ConfigParams.BaseLocation]));
    Add(Format(rsServerPatchLockFile, [sp.ConfigParams.LockFileLocation]));
    Add(Format(rsServerPatchMessages, [sp.ConfigParams.MessageFileLocation]));
    Add(Format(rsServerPatchSecurity, [sp.ConfigParams.SecurityDatabaseLocation]));
  end;
  sp.Free;
end;

procedure TSrvServiceForm.btnServerLogClick(Sender: TObject);
begin
  OnServerLog(nil, 'Server log:');
  with GetFirebirdServer do begin
    OnFbTextNotify := OnServerLog;
    GetServerLog;
  end;
end;

procedure TSrvServiceForm.btnBackUpClick(Sender: TObject);
begin
  // dmMain.dbTV.Close;
  GetFirebirdServer.OnFbTextNotify := OnDatabaseLog;
  GetFirebirdServer.BackupDB(dmMain.Database, edtBackupFBK.Text);
  // dmMain.dbTV.Open(true);
end;

procedure TSrvServiceForm.btnRestoreClick(Sender: TObject);
begin
  GetFirebirdServer.OnFbTextNotify := OnDatabaseLog;
  GetFirebirdServer.RestoreDB(edtBackupFBK.Text, edtBackupFDB.Text);
end;

procedure TSrvServiceForm.btnCheckClick(Sender: TObject);
begin
  dmMain.dbTV.Close;
  GetFirebirdServer.OnFbTextNotify := OnDatabaseLog;
  if GetFirebirdServer.CheckDatabase(dmMain.DbName) then
    memServerProps.Lines.Add(rsCheckCompliteNoError);
  dmMain.dbTV.Open(true);
end;

procedure TSrvServiceForm.btnSweepClick(Sender: TObject);
begin
  memServerProps.Lines.Add('-------------- Статистика до --------------');
  GetDatabaseStat;
  GetFirebirdServer.OnFbTextNotify := OnDatabaseLog;
  if GetFirebirdServer.SweepDatabase(dmMain.DbName) then begin
    memServerProps.Lines.Add('-------------- Статистика после --------------');
    GetDatabaseStat;
  end;
end;

procedure TSrvServiceForm.btnStatClick(Sender: TObject);
begin
  GetDatabaseStat;
end;

procedure TSrvServiceForm.GetDatabaseStat;
begin
  GetFirebirdServer.OnFbTextNotify := OnDatabaseLog;
  GetFirebirdServer.GetDBStat(dmMain.DbName);
end;

procedure TSrvServiceForm.edt1EditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  dlgOpen.DefaultExt := '.fbk';
  dlgOpen.Filter := 'Backup files|*.fbk';
  dlgOpen.FileName := formatdatetime('yyyymmddhhmm.fbk', now);
  if dlgOpen.Execute then
    edtBackupFBK.Text := dlgOpen.FileName;
  Handled := true;
end;

procedure TSrvServiceForm.edtBackupFBKChange(Sender: TObject);
begin
  btnBackUp.Enabled := Length(edtBackupFBK.Text) > 0;
end;

procedure TSrvServiceForm.edtBackupFDBChange(Sender: TObject);
begin
  btnRestore.Enabled := (Length(edtBackupFBK.Text) > 0) and FileExists(edtBackupFBK.Text) and
    (Length(edtBackupFBK.Text) > 0);
end;

procedure TSrvServiceForm.edtBackupFDBEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  dlgOpen.DefaultExt := '.fdb';
  dlgOpen.Filter := 'Firebird database|*.fdb';
  dlgOpen.FileName := 'restored.fdb';
  if dlgOpen.Execute then
    edtBackupFDB.Text := dlgOpen.FileName;
  Handled := true;
end;

procedure TSrvServiceForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  // DBExtract.Free;
  SrvServiceForm := nil;
end;

procedure TSrvServiceForm.FormCreate(Sender: TObject);
begin
  // DBExtract := TpFIBExtract.Create(self);
end;

end.
