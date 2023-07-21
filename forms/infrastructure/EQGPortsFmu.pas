unit EQGPortsFmu;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.Classes, System.Actions, System.SysUtils, System.Variants, System.UITypes,
  Data.DB,
  Vcl.ActnList, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Controls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Graphics, Vcl.Forms, Vcl.Menus,
  Vcl.ToolWin, Vcl.Dialogs,
  FIBDataSet, pFIBDataSet, DBGridEh, DynVarsEh, FIBDatabase, pFIBDatabase, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls,
  DBAxisGridsEh, GridsEh, EhLibVCL, DM, PrjConst, AtrPages, A4onTypeUnit, DBVertGridsEh, PropFilerEh, PropStorageEh;

type
  TapgEQGPort = class(TA4onPage)
    ActListFrame: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    pnlButtons: TPanel;
    btnDel: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit: TSpeedButton;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    srcData: TDataSource;
    dsData: TpFIBDataSet;
    dbgPorts: TDBGridEh;
    actNodeFrom: TAction;
    actNodeTo: TAction;
    actEqpmnt: TAction;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbgPortsDblClick(Sender: TObject);
    procedure actPEditExecute(Sender: TObject);
    procedure dbgPortsSortMarkingChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FRightEdit: Boolean;
    FRightFull: Boolean;
    FPersonalData: Boolean;
    FIsVertical: Boolean;
    procedure EnableControls;
    function GetEquipmentRecord: TEquipmentRecord;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses
  System.StrUtils,
  AtrCommon, AtrStrUtils, EQPort;

class function TapgEQGPort.GetPageName: string;
begin
  Result := rsEqpmntPortsTemplate;
end;

procedure TapgEQGPort.InitForm;
var
  i: Integer;
  vFINE: Boolean;
begin
  Caption := GetPageName;

  FRightFull := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment));
  FRightEdit := (dmMain.AllowedAction(rght_Comm_Equipment_Ports)); // полный доступ

  dsData.DataSource := FDataSource;
  actAdd.Visible := FRightFull or FRightEdit;
  actEdit.Visible := FRightFull or FRightEdit;
  actDel.Visible := FRightFull or FRightEdit;
end;

procedure TapgEQGPort.EnableControls;
begin
  actEdit.Enabled := dsData.RecordCount > 0;
  actDel.Enabled := dsData.RecordCount > 0;
end;

procedure TapgEQGPort.FormCreate(Sender: TObject);
begin
  inherited;
  FIsVertical := False;
end;

procedure TapgEQGPort.OpenData;
begin
  if dsData.Active then
    dsData.Close;
  dsData.OrderClause := GetOrderClause(dbgPorts);
  dsData.Open;

  EnableControls;
end;

procedure TapgEQGPort.actAddExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
begin
  EQ := GetEquipmentRecord;

  if EQ.id = -1 then
    exit;

  if CreatePort(EQ) then
    dsData.CloseOpen(true);
end;

procedure TapgEQGPort.actDelExecute(Sender: TObject);
var
  s: string;
begin
  if dsData.RecordCount = 0 then
    exit;

  if not dsData.FieldByName('Port').IsNull then
    s := dsData['Port']
  else
    s := '';
  if (MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dsData.Delete;
  end;
end;

procedure TapgEQGPort.actEditExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
  Port: string;
begin
  if not dsData.FieldByName('PORT').IsNull then
    Port := dsData.FieldByName('PORT').asString
  else
    exit;

  EQ := GetEquipmentRecord;

  if EQ.id = -1 then
    exit;

  if EditPort(EQ, Port) then
    dsData.Refresh;
end;

procedure TapgEQGPort.actPEditExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
  Port: string;
begin
  inherited;
  if not dsData.FieldByName('PORT').IsNull then
    Port := dsData.FieldByName('PORT').asString
  else
    exit;

  EQ := GetEquipmentRecord;

  if EQ.id = -1 then
    exit;

  if EditPort(EQ, Port) then
    dsData.Refresh;
end;

procedure TapgEQGPort.CloseData;
begin
  dsData.Close;
end;

procedure TapgEQGPort.dbgPortsDblClick(Sender: TObject);
begin
  inherited;
  if (Sender as TDBGridEh).DataSource.DataSet.RecordCount > 0 then
  begin
    if actEdit.Enabled then
      actEdit.Execute;
  end
  else
  begin
    if actAdd.Enabled then
      actAdd.Execute;
  end;
end;

procedure TapgEQGPort.dbgPortsSortMarkingChanged(Sender: TObject);
var
  cr: TCursor;
  s: string;
  Grid: TCustomDBGridEh;
  id: String;
  FIBDS: TpFIBDataSet;
  beOpened: Boolean;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Grid := TCustomDBGridEh(Sender);
  FIBDS := Grid.DataSource.DataSet as TpFIBDataSet;
  id := '';
  if Sender is TCustomDBGridEh then
  begin
    beOpened := FIBDS.Active;
    if beOpened then
    begin
      if not FIBDS.FieldByName('PORT').IsNull then
        id := FIBDS.FieldByName('PORT').asString;
      FIBDS.Close;
    end;

    s := GetOrderClause(Sender as TDBGridEh);

    FIBDS.OrderClause := s;
    if beOpened then
    begin
      FIBDS.Open;
      if id <> '' then
        FIBDS.Locate('PORT', id, []);
    end;
  end;
  Screen.Cursor := cr;
end;

function TapgEQGPort.GetEquipmentRecord: TEquipmentRecord;
begin
  if (dsData.DataSource.DataSet.RecordCount = 0) then
  begin
    Result.id := -1;
    exit;
  end;

  Result.id := dsData.DataSource.DataSet.FieldByName('Eid').AsInteger;
  if not dsData.DataSource.DataSet.FieldByName('o_Name').IsNull then
    Result.Name := dsData.DataSource.DataSet.FieldByName('o_Name').AsString;
  //if not dsData.DataSource.DataSet.FieldByName('Eq_Type').IsNull then
  //  Result.TypeID := dsData.DataSource.DataSet.FieldByName('Eq_Type').AsInteger;
  //if not dsData.DataSource.DataSet.FieldByName('eqgroup').IsNull then
  //  Result.TypeName := dsData.DataSource.DataSet.FieldByName('eqgroup').asString;
  //if not dsData.DataSource.DataSet.FieldByName('Notice').IsNull then
  //  Result.notice := dsData.DataSource.DataSet.FieldByName('Notice').asString;
end;


end.
