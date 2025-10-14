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
  CnErrorProvider,
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
  DM, MAIN;

{$R *.dfm}

procedure TElectroRecipientForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsElectroRecipient.Close;
  ElectroRecipientForm := nil;
end;

procedure TElectroRecipientForm.StartEdt(const New: Boolean = False);
var
  i: Integer;
begin
  StartEdit(New);

  edtName.Enabled := True;
end;

procedure TElectroRecipientForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
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
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;

  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
end;

procedure TElectroRecipientForm.actDelPExecute(Sender: TObject);
begin
  inherited;
  if dsHistory.RecordCount = 0 then
    Exit;

  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [dsHistory['HDATE']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      dsHistory.Delete;
end;

procedure TElectroRecipientForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
  begin
    StartEdt();
  end;
end;

procedure TElectroRecipientForm.actAddPExecute(Sender: TObject);
var
  pce: String;
  d: TDateTime;
  fs: TFormatSettings;
  AValues: array of string;
begin
  inherited;
  if (not dsElectroRecipient.Active) or (dsElectroRecipient.RecordCount = 0) then
    Exit;

  SetLength(AValues, 5);
  AValues[0] := DateToStr(Now());
  AValues[1] := '';
  AValues[2] := '';
  AValues[3] := '';
  AValues[4] := '';
  if InputQuery('Оплата', ['Дата', 'Тариф', 'Оплачено кВт', 'Сумма оплаты', 'Примечание'], AValues,
    function(const Values: array of string): Boolean
    var
      v: Double;
      d: TDateTime;
    begin
      Result := TryStrToDate(Values[0], d) and TryStrToFloat(Values[1], v) and TryStrToFloat(Values[2], v) and TryStrToFloat(Values[3], v);
    end) then
  begin
    fs.ShortDateFormat := 'dd.mm.yyyy';
    dsHistory.Insert;
    dsHistory['O_Id'] := dsElectroRecipient['O_ID'];
    dsHistory['O_Type'] := 77; // Получатель оплаты электроэнергии
    dsHistory['Hdate'] := StrToDate(AValues[0]); // Получатель оплаты электроэнергии
    dsHistory['Cvalue'] := '{"rate":'+ AValues[1].Replace(',','.')+ ',' + '"pce":'+ AValues[2].Replace(',','.')+ '}';
    dsHistory['NVALUE'] := StrToFloat(AValues[3]);
    dsHistory['NOTICE'] := AValues[4];
    dsHistory.Post;
  end;
end;

procedure TElectroRecipientForm.actEditPExecute(Sender: TObject);
var
  pce: String;
  AValues: array of string;

begin
  inherited;
  if (not dsElectroRecipient.Active) or (dsElectroRecipient.RecordCount = 0) then
    Exit;

  SetLength(AValues, 4);
  if not dsHistory.FieldByName('rate').IsNull then
    AValues[0] := dsHistory.FieldByName('rate').AsString
  else
    AValues[0] := '0';

  if not dsHistory.FieldByName('PCE').IsNull then
    AValues[1] := dsHistory.FieldByName('PCE').AsString
  else
    AValues[1] := '0';

  if not dsHistory.FieldByName('NVALUE').IsNull then
    AValues[2] := dsHistory.FieldByName('NVALUE').AsString
  else
    AValues[2] := '0';

  if not dsHistory.FieldByName('NOTICE').IsNull then
    AValues[3] := dsHistory.FieldByName('NOTICE').AsString
  else
    AValues[3] := '';

  if InputQuery('Оплата', ['Тариф', 'Оплачено кВт', 'Сумма оплаты', 'Примечание'], AValues,
    function(const Values: array of string): Boolean
    var
      v: Double;
    begin
      Result := TryStrToFloat(Values[0], v) and TryStrToFloat(Values[1], v) and TryStrToFloat(Values[2], v);
    end) then
  begin
    dsHistory.Edit;
    dsHistory['Cvalue'] := '{"rate":'+ AValues[0].Replace(',','.')+ ',' + '"pce":'+ AValues[1].Replace(',','.')+ '}';
    dsHistory['NVALUE'] := StrToFloat(AValues[2]);
    dsHistory['NOTICE'] := AValues[3];
    dsHistory.Post;
  end;
end;

procedure TElectroRecipientForm.FormShow(Sender: TObject);
var
  vFull: Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Dictionary_full);
  fCanEdit := vFull;

  fCanCreate := fCanEdit;

  actNew.Visible := fCanEdit;
  // actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

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
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  // actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

end.
