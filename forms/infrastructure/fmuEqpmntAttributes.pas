unit fmuEqpmntAttributes;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.ActnList, Vcl.Controls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin,
  AtrPages, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, pFIBDatabase, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, ToolCtrlsEh;

type
  TapgEqpmntAttributes = class(TA4onPage)
    dsAttributes: TpFIBDataSet;
    srcAttributes: TDataSource;
    dbgCustAttr: TDBGridEh;
    ActListCustomers: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    pnlButtons: TPanel;
    btnDel: TSpeedButton;
    btnAdd: TSpeedButton;
    btnEdit: TSpeedButton;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbgCustAttrDblClick(Sender: TObject);
    procedure srcAttributesDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    FIsVertical: Boolean;
    procedure EnableControls;
    procedure SwitchLayout(const InVertical: Boolean);
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses
  MAIN, AtrCommon, DM, EquipAttributesForma;

class function TapgEqpmntAttributes.GetPageName: string;
begin
  Result := rsClmnAttributes;
end;

procedure TapgEqpmntAttributes.SwitchLayout(const InVertical: Boolean);
begin
  if (FIsVertical = InVertical)
  then Exit;

  FIsVertical := InVertical;
  if not FIsVertical then
  begin
    pnlButtons.Align := alLeft;
    pnlButtons.Width := 26;
    btnEdit.Left := 2;
    btnEdit.Top := 30;
    btnDel.Left := 2;
    btnDel.Top := pnlButtons.Height - btnDel.Height - 4;
    btnDel.Anchors := [akLeft,akBottom];
  end
  else
  begin
    pnlButtons.Align := alTop;
    pnlButtons.Height := 26;
    btnEdit.Top := 2;
    btnEdit.Left := 30;
    btnDel.Top := 2;
    btnDel.Left := pnlButtons.Width - btnDel.Width - 4;
    btnDel.Anchors := [akTop,akRight];
  end;
end;

procedure TapgEqpmntAttributes.InitForm;
var
  FullAccess: Boolean;
begin
  FullAccess := (dmMain.AllowedAction(rght_Dictionary_full));
  actAdd.Visible := (dmMain.AllowedAction(rght_Comm_Equipment)) or FullAccess;
  actDel.Visible := actAdd.Visible;
  actEdit.Visible := actAdd.Visible;

  dsAttributes.DataSource := FDataSource;
end;

procedure TapgEqpmntAttributes.EnableControls;
begin
  actEdit.Enabled := dsAttributes.RecordCount > 0;
  actDel.Enabled := dsAttributes.RecordCount > 0;
end;

procedure TapgEqpmntAttributes.FormCreate(Sender: TObject);
begin
  inherited;
  FIsVertical := False;
end;

procedure TapgEqpmntAttributes.FormResize(Sender: TObject);
var
  b : Boolean;
begin
  b := (dmMain.GetIniValue('EQUIPMENT_INFOLAYOUT') = '1');
  SwitchLayout(b);
end;

procedure TapgEqpmntAttributes.OpenData;
begin
  dsAttributes.Open;
  EnableControls;
end;

procedure TapgEqpmntAttributes.srcAttributesDataChange(Sender: TObject;
  Field: TField);
begin
  actEdit.Enabled := actEdit.Visible and (srcAttributes.DataSet.RecordCount > 0);
  actDel.Enabled := actDel.Visible and (srcAttributes.DataSet.RecordCount > 0);
end;

procedure TapgEqpmntAttributes.actAddExecute(Sender: TObject);
begin
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment))) then
    exit;

  if (FDataSource.DataSet.FieldByName('EQ_TYPE').IsNull) or
    (FDataSource.DataSet.FieldByName('EID').IsNull) then
    exit;

  if EditAttribute(dsAttributes.DataSource.DataSet['EID'], dsAttributes.DataSource.DataSet['EQ_TYPE'], -1) then
  begin
    dsAttributes.CloseOpen(true);
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgEqpmntAttributes.actDelExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if (dsAttributes.RecordCount = 0) then
    exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment))) then
    exit;

  if not(dsAttributes.FieldByName('O_NAME').IsNull) then
    s := dsAttributes['O_NAME']
  else
    s := '';

  if (MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    srcAttributes.DataSet.Delete;
    EnableControls;
    UpdatePage;
  end;
end;

procedure TapgEqpmntAttributes.actEditExecute(Sender: TObject);
begin
  if ((not dsAttributes.Active) or (dsAttributes.RecordCount = 0)) then
    exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment))) then
    exit;

  if (dsAttributes.FieldByName('O_ID').IsNull) or (FDataSource.DataSet.FieldByName('EQ_TYPE').IsNull) or
    (FDataSource.DataSet.FieldByName('EID').IsNull) then
    exit;

  if EditAttribute(FDataSource.DataSet['EID'], FDataSource.DataSet['EQ_TYPE'], dsAttributes['O_ID']) then
  begin
    dsAttributes.Refresh;
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgEqpmntAttributes.CloseData;
begin
  dsAttributes.Close;
end;

procedure TapgEqpmntAttributes.dbgCustAttrDblClick(Sender: TObject);
begin
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

end.
