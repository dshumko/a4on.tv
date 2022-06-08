unit fmuEqpmntRegion;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.ActnList, Vcl.Controls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin,
  AtrPages, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, pFIBDatabase, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, ToolCtrlsEh;

type
  TapgEqpmntRegion = class(TA4onPage)
    dsData: TpFIBDataSet;
    srcData: TDataSource;
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
    dbgHouses: TDBGridEh;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure srcDataDataChange(Sender: TObject; Field: TField);
    procedure dbgHousesDblClick(Sender: TObject);
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
  MAIN, AtrCommon, DM, EquipCoverage;

class function TapgEqpmntRegion.GetPageName: string;
begin
  Result := rsClmnServiceRegion;
end;

procedure TapgEqpmntRegion.SwitchLayout(const InVertical: Boolean);
begin
  if (FIsVertical = InVertical) then
    Exit;

  FIsVertical := InVertical;
  if not FIsVertical then
  begin
    pnlButtons.Align := alLeft;
    pnlButtons.Width := 26;
    btnEdit.Left := 2;
    btnEdit.Top := 30;
    btnDel.Left := 2;
    btnDel.Top := pnlButtons.Height - btnDel.Height - 4;
    btnDel.Anchors := [akLeft, akBottom];
  end
  else
  begin
    pnlButtons.Align := alTop;
    pnlButtons.Height := 26;
    btnEdit.Top := 2;
    btnEdit.Left := 30;
    btnDel.Top := 2;
    btnDel.Left := pnlButtons.Width - btnDel.Width - 4;
    btnDel.Anchors := [akTop, akRight];
  end;
end;

procedure TapgEqpmntRegion.InitForm;
var
  FullAccess: Boolean;
begin
  Caption := GetPageName;

  FullAccess := (dmMain.AllowedAction(rght_Dictionary_full));
  actAdd.Visible := (dmMain.AllowedAction(rght_Dictionary_Equipment)) or FullAccess;
  actDel.Visible := actAdd.Visible;
  actEdit.Visible := actAdd.Visible;

  dsData.DataSource := FDataSource;
end;

procedure TapgEqpmntRegion.EnableControls;
begin
  actEdit.Enabled := dsData.RecordCount > 0;
  actDel.Enabled := dsData.RecordCount > 0;
end;

procedure TapgEqpmntRegion.FormCreate(Sender: TObject);
begin
  inherited;
  FIsVertical := False;
end;

procedure TapgEqpmntRegion.FormResize(Sender: TObject);
var
  b: Boolean;
begin
  b := (dmMain.GetIniValue('EQUIPMENT_INFOLAYOUT') = '1');
  SwitchLayout(b);
end;

procedure TapgEqpmntRegion.OpenData;
begin
  dsData.Open;
  EnableControls;
end;

procedure TapgEqpmntRegion.srcDataDataChange(Sender: TObject; Field: TField);
begin
  actEdit.Enabled := actEdit.Visible and (srcData.DataSet.RecordCount > 0);
  actDel.Enabled := actDel.Visible and (srcData.DataSet.RecordCount > 0);
end;

procedure TapgEqpmntRegion.actAddExecute(Sender: TObject);
begin
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    Exit;
  if EditEQCoverage(FDataSource.DataSet['EID'], -1) then
  begin
    dsData.Close;
    dsData.Open;
  end;
end;

procedure TapgEqpmntRegion.actDelExecute(Sender: TObject);
var
  cnt: Integer;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    Exit;

  if dsData.RecordCount = 0 then
    Exit;

  if (dsData.FieldByName('eid').IsNull) or (dsData.FieldByName('HOUSE_ID').IsNull) then
    Exit;

  cnt := 0;
  try
    with dmMain.qRead do
    begin
      sql.Clear;
      sql.Add('select count(*) CNT');
      sql.Add('from equipment_coverage ec');
      sql.Add('inner join Tv_Lan l on (l.Eq_Id = ec.Eid)');
      sql.Add('inner join customer c on (l.Customer_Id = c.Customer_Id)');
      sql.Add('where ec.eid = :eid  and c.HOUSE_ID = :House_ID');
      ParamByName('EID').AsInteger := dsData.FieldByName('eid').AsInteger;
      ParamByName('HOUSE_ID').AsInteger := dsData.FieldByName('HOUSE_ID').AsInteger;
      Transaction.StartTransaction;
      ExecQuery;
      if (not Eof) and (not FieldByName('CNT').IsNull) then
        cnt := FieldByName('CNT').AsInteger;
      Close;
      Transaction.Rollback;
    end;
  except
    cnt := 0;
  end;

  if (cnt > 0) then
  begin
    MessageDlg(rsEqpmntCstmrs, mtWarning, [mbOK], 0);
  end
  else
  begin
    if (Application.MessageBox(PWideChar(rsHouseInService), PWideChar(rsWarning),
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES) then
    begin
      if (MessageDlg(rsDeleteHouseZone, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        dsData.Delete;
    end;
  end;
end;

procedure TapgEqpmntRegion.actEditExecute(Sender: TObject);
begin
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    Exit;
  if EditEQCoverage(FDataSource.DataSet['EID'], dsData['HOUSE_ID']) then
  begin
    dsData.Close;
    dsData.Open;
  end;
end;

procedure TapgEqpmntRegion.CloseData;
begin
  dsData.Close;
end;

procedure TapgEqpmntRegion.dbgHousesDblClick(Sender: TObject);
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
