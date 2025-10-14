unit ElectroPointForma;

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
  PrnDbgeh, DBLookupEh, PropFilerEh, PropStorageEh;

type
  TElectroPointForm = class(TGridForm)
    dsElectroPoint: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl3: TLabel;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    lcbEpoint: TDBLookupComboboxEh;
    lbl21: TLabel;
    dsERecipient: TpFIBDataSet;
    srcERecipient: TDataSource;
    pgcInfo: TPageControl;
    tsCoverage: TTabSheet;
    tsNodes: TTabSheet;
    spl1: TSplitter;
    actHAdd: TAction;
    actHEdit: TAction;
    actHDel: TAction;
    srcHistory: TDataSource;
    dsHistory: TpFIBDataSet;
    srcNodes: TDataSource;
    dsNodes: TpFIBDataSet;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    dbgUsed: TDBGridEh;
    dbgHistory: TDBGridEh;
    lbl22: TLabel;
    edtO_NAME: TDBEditEh;
    mmMenu: TMainMenu;
    N18: TMenuItem;
    N20: TMenuItem;
    N33: TMenuItem;
    miN2: TMenuItem;
    miLinkNodes: TMenuItem;
    N48: TMenuItem;
    miExport: TMenuItem;
    miEdit: TMenuItem;
    miN1: TMenuItem;
    miDelete: TMenuItem;
    miPrintGrid1: TMenuItem;
    PropStorage: TPropStorageEh;
    btnSetCountersValue: TToolButton;
    actSetCountersValue: TAction;
    miN3: TMenuItem;
    miSetCountersValue: TMenuItem;
    lbl1: TLabel;
    edCDate: TDBDateTimeEditEh;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    btnEditNodePCE: TSpeedButton;
    actEditNodePCE: TAction;
    btn1: TToolButton;
    actPCEFixing: TAction;
    btnPCEFixing: TToolButton;
    miPCEFixing: TMenuItem;
    actPCEFixingNode: TAction;
    pnlNodePCE: TPanel;
    dbgNPce: TDBGridEh;
    lbl4: TLabel;
    dsNodePce: TpFIBDataSet;
    srcNodePce: TDataSource;
    spl2: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure actHAddExecute(Sender: TObject);
    procedure actHEditExecute(Sender: TObject);
    procedure actHDelExecute(Sender: TObject);
    procedure pgcInfoChange(Sender: TObject);
    procedure dsHistoryNewRecord(DataSet: TDataSet);
    procedure dbgUsedGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure actSetCountersValueExecute(Sender: TObject);
    procedure actEditNodePCEExecute(Sender: TObject);
    procedure actPCEFixingExecute(Sender: TObject);
  private
    procedure StartEdt(const New: Boolean = False);
    procedure FixingReading(const fd: TDate; const ID: Integer = -1);
    function CheckReading(const fd: TDate; const ID: Integer = -1): Boolean;
    procedure PCEFixing(const ID: Integer = -1);
  public
    { Public declarations }
  end;

var
  ElectroPointForm: TElectroPointForm;

implementation

uses
  DM, CountersIndicationForma, SelDateForma;

{$R *.dfm}

procedure TElectroPointForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsElectroPoint.Close;
  ElectroPointForm := nil;
end;

procedure TElectroPointForm.StartEdt(const New: Boolean = False);
var
  i: Integer;
begin
  dsERecipient.Open;
  pgcInfo.Enabled := False;
  StartEdit(New);

  edtName.Enabled := True;
end;

procedure TElectroPointForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdt(True);
end;

function TElectroPointForm.CheckReading(const fd: TDate; const ID: Integer = -1): Boolean;
begin
  with dmMain.qRead do
  begin;
    sql.Clear;
    sql.add('select count(*) cnt');
    sql.add('  from Objects_History qh');
    sql.add('  where qh.O_Type = 76');
    sql.add('   and qh.Hdate = :Hdate');
    sql.add('   and not qh.Nvalue is null');
    sql.add('   and exists(select o.O_Id');
    sql.add('     from OBJECTS o');
    sql.add('     where o.O_TYPE = 76');
    sql.add('       and o.o_DELETED = 0');
    sql.add('       and o.O_Id = qh.O_Id');
    sql.add('       and trim(coalesce(o.O_Dimension, '''')) = ''''');
    sql.add('       and ((cast(:O_Id as integer) is null) or (o.O_Id = cast(:O_Id as integer))))');
  end;
  dmMain.qRead.ParamByName('Hdate').AsDate := fd;
  if ID <> -1 then
    dmMain.qRead.ParamByName('O_Id').AsInteger := ID;
  dmMain.qRead.Transaction.StartTransaction;
  dmMain.qRead.ExecQuery;
  Result := dmMain.qRead.FN('cnt').AsInteger > 0;
  dmMain.qRead.Transaction.Commit;
end;

procedure TElectroPointForm.FixingReading(const fd: TDate; const ID: Integer = -1);
begin
  with dmMain.Query do
  begin;
    sql.Clear;
    sql.Text := 'execute procedure SavePceForEmp(:SaveDate, :EmpId)';
  end;
  dmMain.Query.ParamByName('SaveDate').AsDate := fd;
  if ID <> -1 then
    dmMain.Query.ParamByName('EmpId').AsInteger := ID;
  dmMain.Query.Transaction.StartTransaction;
  dmMain.Query.ExecQuery;
  dmMain.Query.Transaction.Commit;
end;

procedure TElectroPointForm.PCEFixing(const ID: Integer = -1);
var
  fd: TDate;
  d, m, y: Word;

begin
  inherited;
  DecodeDate(Now(), y, m, d);
  // DecodeDate(EncodeDate(y, m, 1) - 1, y, m, d);
  fd := EncodeDate(y, m, 1);

  if SelectDate(fd, 'Укажите месяц фиксации') then
  begin
    if CheckReading(fd, ID) then
      if Application.MessageBox(PChar(Format('Ранее уже были зафиксированны показания.' + #13#10 +
        'Вы уверены, что хотите их заменить?', [])), 'Заменить показания', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDNO
      then
        Exit;

    FixingReading(fd, ID);
  end;
end;

procedure TElectroPointForm.actPCEFixingExecute(Sender: TObject);
begin
  PCEFixing(-1);
end;

procedure TElectroPointForm.actSetCountersValueExecute(Sender: TObject);
var
  cif: TCountersIndicationForm;
  d, m, y: Word;
  i: Integer;
begin
  DecodeDate(Now(), y, m, d);
  inherited;
  cif := TCountersIndicationForm.Create(self);
  try
    cif.GetCntIndicators(EncodeDate(y, m, 1));
    if cif.ShowModal = mrOk then
    begin
      if dsElectroPoint.RecordCount > 0 then
      begin
        dsElectroPoint.DisableControls;
        i := dsElectroPoint['O_ID'];
        dsElectroPoint.CloseOpen(True);
        dsElectroPoint.Locate('O_ID', i, []);
        dsElectroPoint.EnableControls;
      end;
    end;
  finally
    cif.Free;
  end;
end;

procedure TElectroPointForm.btnCancelLinkClick(Sender: TObject);
begin
  inherited;
  dsERecipient.Close;
  pgcInfo.Enabled := True;
end;

procedure TElectroPointForm.btnSaveLinkClick(Sender: TObject);
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
  begin
    inherited;
    dsERecipient.Close;
    pgcInfo.Enabled := True;
  end;
end;

procedure TElectroPointForm.dbgUsedGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  inherited;
  if (not dsNodes.FieldByName('PCE_DIF').IsNull) and (dsNodes['PCE_DIF'] <> 0) then
    Background := clYellow;
end;

procedure TElectroPointForm.dsHistoryNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsHistory['O_ID'] := srcDataSource.DataSet['O_ID'];
  dsHistory['O_TYPE'] := srcDataSource.DataSet['O_TYPE'];
end;

procedure TElectroPointForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;

  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
end;

procedure TElectroPointForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdt();
end;

procedure TElectroPointForm.actEditNodePCEExecute(Sender: TObject);
var
  pce: String;
  AValues: array of string;

begin
  inherited;
  if (not dsNodes.Active) or (dsNodes.RecordCount = 0) then
    Exit;

  if not dsNodes.FieldByName('PCE').IsNull then
    pce := dsNodes.FieldByName('PCE').AsString
  else
    pce := '0';

  SetLength(AValues, 1);
  AValues[0] := pce;
  if InputQuery('Новое потребление', ['Вт/ч'], AValues,
    function(const Values: array of string): Boolean
    var
      v: Double;
    begin
      Result := (Values[0] <> pce) and TryStrToFloat(Values[0], v);
    end) then
  begin
    dsNodes.Edit;
    dsNodes['PCE'] := StrToFloat(AValues[0]);
    dsNodes.Post;
  end;
end;

procedure TElectroPointForm.actHAddExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;

  dsHistory.Insert;
end;

procedure TElectroPointForm.actHDelExecute(Sender: TObject);
begin
  inherited;
  if dsHistory.RecordCount = 0 then
    Exit;

  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [dsHistory['HDATE']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      dsHistory.Delete;
end;

procedure TElectroPointForm.actHEditExecute(Sender: TObject);
begin
  inherited;
  if dsHistory.RecordCount = 0 then
    Exit;

  dsHistory.Edit;
end;

procedure TElectroPointForm.FormShow(Sender: TObject);
var
  vFull: Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Dictionary_full);
  fCanEdit := vFull;

  fCanCreate := fCanEdit;

  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  dsElectroPoint.Open;
  dbGrid.DefaultApplySorting;
  dsElectroPoint.First;

  pgcInfoChange(Sender);
end;

procedure TElectroPointForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TElectroPointForm.pgcInfoChange(Sender: TObject);
begin
  inherited;
  dsHistory.Active := (pgcInfo.ActivePage = tsCoverage);
  dsNodes.Active := (pgcInfo.ActivePage = tsNodes);
  dsNodePce.Active := (pgcInfo.ActivePage = tsNodes);

  if dsNodes.Active then
    dbgUsed.DefaultApplySorting
  else
    dbgHistory.DefaultApplySorting;

end;

end.
