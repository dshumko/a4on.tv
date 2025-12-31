unit ElectroRecipientForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  CnErrorProvider, amSplitter,
  DBCtrlsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase,
  PrnDbgeh, PropFilerEh, PropStorageEh;

type
  TElectroRecipientForm = class(TGridForm)
    dsElectroRecipient: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl3: TLabel;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsHistory: TpFIBDataSet;
    srcHistory: TDataSource;
    pgcInfo: TPageControl;
    tsCoverage: TTabSheet;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    dbgHistory: TDBGridEh;
    spl1: TSplitter;
    actAddP: TAction;
    actEditP: TAction;
    actDelP: TAction;
    PropStorage: TPropStorageEh;
    tsEP: TTabSheet;
    dsElectroPoint: TpFIBDataSet;
    dbgEP: TDBGridEh;
    srcElectroPoint: TDataSource;
    actLockPeriod: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure actAddPExecute(Sender: TObject);
    procedure actEditPExecute(Sender: TObject);
    procedure actDelPExecute(Sender: TObject);
    procedure pgcInfoChange(Sender: TObject);
  private
    procedure StartEdt(const New: Boolean = False);
  public
    { Public declarations }
  end;

var
  ElectroRecipientForm: TElectroRecipientForm;

implementation

uses
  DM, MAIN, System.DateUtils;

{$R *.dfm}

procedure TElectroRecipientForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsElectroRecipient.Close;
  ElectroRecipientForm := nil;
end;

procedure TElectroRecipientForm.StartEdt(const New: Boolean = False);
begin
  StartEdit(New);

  edtName.Enabled := True;
end;

procedure TElectroRecipientForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if FCanEdit then
  begin
    StartEdt(True);
  end;
end;

procedure TElectroRecipientForm.btnSaveLinkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := False;

  if (edtName.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtName);

  if not errors then
    inherited;
end;

procedure TElectroRecipientForm.actDeleteExecute(Sender: TObject);
var
  s: string;
begin
  inherited;

  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;

  if FCanEdit then
  begin
    with dmMain.qRead do
    begin;
      sql.Clear;
      sql.Text := 'select list(O_Name) EP from objects where O_Type = 76 and o_deleted = 0 and O_Numericfield = :O_ID';
      ParamByName('O_ID').AsInteger := srcDataSource.DataSet['O_ID'];
      Transaction.StartTransaction;
      ExecQuery;
      if not FN('EP').IsNull then
        s := FN('EP').AsString;
      Transaction.Commit;
    end;

    if s.IsEmpty then
    begin
      if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
        = mrYes) then
        srcDataSource.DataSet.Delete;
    end
    else
      ShowMessage(Format(rsDeleteDenyRelation, [s]));
  end;
end;

procedure TElectroRecipientForm.actDelPExecute(Sender: TObject);
begin
  inherited;
  if dsHistory.RecordCount = 0 then
    Exit;

  if FCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [dsHistory['HDATE']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      dsHistory.Delete;
end;

procedure TElectroRecipientForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if FCanEdit then
  begin
    StartEdt();
  end;
end;

procedure TElectroRecipientForm.actAddPExecute(Sender: TObject);
var
  d: TDateTime;
  fs: TFormatSettings;
  AValues: array of string;
begin
  inherited;
  if (not dsElectroRecipient.Active) or (dsElectroRecipient.RecordCount = 0) then
    Exit;

  SetLength(AValues, 5);
  AValues[0] := DateToStr(Now());
  AValues[1] := DateToStr(StartOfTheMonth(Now()));
  AValues[2] := '';
  AValues[3] := '';
  AValues[4] := '';

  if InputQuery('Оплата', ['Дата платежа (д.м.г)', 'За месяц (1.м.г)',  'Оплачено кВт', 'Сумма оплаты', 'Примечание'], AValues,
    function(const Values: array of string): Boolean
    var
      v: Double;
      d: TDateTime;
    begin
      Result := TryStrToDate(Values[0], d) and TryStrToDate(Values[1], d) and TryStrToFloat(Values[2], v) and TryStrToFloat(Values[3], v);
    end) then
  begin
    fs.ShortDateFormat := 'dd.mm.yyyy';
    d := StrToDate(AValues[0]);

    with dmMain.Query do
    begin;
      sql.Clear;
      sql.Text := dsHistory.InsertSQL.Text;

      ParamByName('O_ID').AsInteger := dsElectroRecipient['O_ID'];
      ParamByName('O_TYPE').AsInteger := 77; // Получатель оплаты электроэнергии
      ParamByName('HDATE').AsDate := d;

      ParamByName('DVALUE').AsDate := StrToDate(AValues[1]);
      ParamByName('NVALUE').AsFloat := StrToFloat(AValues[3]);
      ParamByName('NOTICE').AsString := AValues[4];
      ParamByName('Cvalue').AsString := Format('{"pce":%s}', [AValues[2].Replace(',', '.')]);

      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      dsHistory.CloseOpen(True);
      dsHistory.Locate('HDATE', d, []);
    end;
  end;
end;

procedure TElectroRecipientForm.actEditPExecute(Sender: TObject);
var
  AValues: array of string;
  d: TDateTime;
begin
  inherited;
  if (not dsElectroRecipient.Active) or (dsElectroRecipient.RecordCount = 0) then
    Exit;

  SetLength(AValues, 4);

  if not dsHistory.FieldByName('PAY_MONTH').IsNull then
    AValues[0] := dsHistory.FieldByName('PAY_MONTH').AsString
  else
    AValues[0] := '';

  if not dsHistory.FieldByName('PAY_PCE').IsNull then
    AValues[1] := dsHistory.FieldByName('PAY_PCE').AsString
  else
    AValues[1] := '0';

  if not dsHistory.FieldByName('PAY_SUM').IsNull then
    AValues[2] := dsHistory.FieldByName('PAY_SUM').AsString
  else
    AValues[2] := '0';

  if not dsHistory.FieldByName('NOTICE').IsNull then
    AValues[3] := dsHistory.FieldByName('NOTICE').AsString
  else
    AValues[3] := '';

  if InputQuery('Оплата', ['За месяц (1.м.г)', 'Оплачено кВт', 'Сумма оплаты', 'Примечание'], AValues,
    function(const Values: array of string): Boolean
    var
      v: Double;
    begin
      Result := TryStrToDate(Values[0], d) and TryStrToFloat(Values[1], v) and TryStrToFloat(Values[2], v);
    end) then
  begin
    with dmMain.Query do
    begin;
      sql.Clear;
      sql.Text := dsHistory.UpdateSQL.Text;

      ParamByName('HID').AsInteger := dsHistory['HID'];
      ParamByName('O_ID').AsInteger := dsHistory['O_ID'];
      ParamByName('O_TYPE').AsInteger := 77;
      ParamByName('HDATE').AsDate := dsHistory['HDATE'];

      ParamByName('DVALUE').AsDate := StrToDate(AValues[0]);
      ParamByName('NVALUE').AsFloat := StrToFloat(AValues[2]);
      ParamByName('NOTICE').AsString := AValues[3];
      ParamByName('Cvalue').AsString := Format('{"pce":%s}', [AValues[1].Replace(',', '.')]);

      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      dsHistory.Refresh;
    end;
  end;
end;

procedure TElectroRecipientForm.FormShow(Sender: TObject);
var
  vFull: Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Dictionary_full);
  FCanEdit := vFull;

  FCanCreate := FCanEdit;

  actNew.Visible := FCanEdit;
  actDelete.Visible := FCanEdit;
  actEdit.Visible := FCanEdit;

  dsElectroRecipient.Open;
  dbGrid.DefaultApplySorting;
  dsElectroRecipient.First;

  pgcInfoChange(Sender);
end;

procedure TElectroRecipientForm.pgcInfoChange(Sender: TObject);
begin
  inherited;
  dsHistory.Active := (pgcInfo.ActivePage = tsCoverage);
  dsElectroPoint.Active := (pgcInfo.ActivePage = tsEP);
  dsElectroPoint.Active := (pgcInfo.ActivePage = tsEP);

  if dsElectroPoint.Active then
    dbgEP.DefaultApplySorting
  else
    dbgHistory.DefaultApplySorting;
end;

procedure TElectroRecipientForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and FCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and FCanEdit;
end;

end.
