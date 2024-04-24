unit DocListForma;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ShellAPI,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBCtrlsEh, DBAxisGridsEh,
  CnErrorProvider, PrjConst, EhLibVCL, DBGridEhGrouping, DynVarsEh,
  Vcl.Mask, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, amSplitter;

type
  TDocListForm = class(TGridForm)
    dsDOCS: TpFIBDataSet;
    btn2: TToolButton;
    actHistory: TAction;
    dsHistory: TpFIBDataSet;
    srcHistory: TDataSource;
    pnlHistory: TPanel;
    dbgHistory: TDBGridEh;
    btnHistory: TToolButton;
    splitter: TSplitter;
    actFindCustomer: TAction;
    btnFindCustomer: TToolButton;
    btn1: TToolButton;
    pnl1: TPanel;
    btnCustHist: TSpeedButton;
    actCustHist: TAction;
    edtPlaceBirth: TDBEditEh;
    lbl9: TLabel;
    edtADRES_REGISTR: TDBEditEh;
    lbl3: TLabel;
    edtDOCDATE: TDBDateTimeEditEh;
    lbl21: TLabel;
    Label2: TLabel;
    edtRegistration: TDBEditEh;
    edtNUMBER: TDBEditEh;
    Label4: TLabel;
    edtSURNAME: TDBEditEh;
    edtFIRSTNAME: TDBEditEh;
    Label5: TLabel;
    edtMIDLENAME: TDBEditEh;
    Label6: TLabel;
    mmoNotice: TDBMemoEh;
    cbType: TDBComboBoxEh;
    lbl2: TLabel;
    edtBIRTHDAY: TDBDateTimeEditEh;
    Query: TpFIBQuery;
    trReadQ: TpFIBTransaction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    btnOpen: TSpeedButton;
    actViewDoc: TAction;
    qRead: TpFIBQuery;
    lbl31: TLabel;
    edtMOBILE: TDBEditEh;
    miHistory: TMenuItem;
    miN1: TMenuItem;
    miNew: TMenuItem;
    miEdit: TMenuItem;
    miN2: TMenuItem;
    mmDoc: TMainMenu;
    miDL: TMenuItem;
    miCustHist: TMenuItem;
    miFindCustomer: TMenuItem;
    miViewDoc: TMenuItem;
    miDelete: TMenuItem;
    miN3: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actHistoryExecute(Sender: TObject);
    procedure actFindCustomerExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCustHistExecute(Sender: TObject);
    procedure dbGridColumns7GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure edtNUMBERExit(Sender: TObject);
    procedure edtSURNAMEExit(Sender: TObject);
    procedure dbgHistoryDblClick(Sender: TObject);
    procedure actViewDocExecute(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
  private
    FPersonalData: Boolean;
    // FCanEdit: Boolean;
    procedure GetGridCustomer(Grid: TDBGridEh);
    procedure StartEdit(const New: Boolean = False);
    function CheckControlText(const Contrl: TDBEditEh; const regexp: String): Boolean;
    function CheckInBlackList(const Sender: TDBEditEh; const NT: Integer = 0): Boolean;
  public
    { Public declarations }
  end;

var
  DocListForm: TDocListForm;

implementation

uses
  System.TypInfo, System.RegularExpressions, DM, AtrStrUtils, AtrCommon, MAIN;

{$R *.dfm}

procedure TDocListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsDOCS.Close;
  DocListForm := nil;
end;

procedure TDocListForm.FormCreate(Sender: TObject);
begin
  inherited;
  FPersonalData := (not dmMain.AllowedAction(rght_Customer_PersonalData));
  FCanEdit := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Doclist));

  // права пользователей
  actNew.Visible := FCanEdit;
  actDelete.Visible := FCanEdit;
  actEdit.Visible := FCanEdit;
end;

procedure TDocListForm.dbgHistoryDblClick(Sender: TObject);
begin
  inherited;
  actCustHist.Execute;
end;

procedure TDocListForm.dbGridColumns7GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  inherited;
  if (not FPersonalData) and (not Params.Text.IsEmpty) then
    Params.Text := HideSurname(Params.Text);
end;

procedure TDocListForm.edtNUMBERExit(Sender: TObject);
begin
  inherited;
  if CheckControlText((Sender as TDBEditEh), dmMain.GetSettingsValue('REG_PASSN')) then
    CheckInBlackList((Sender as TDBEditEh), 1);
end;

procedure TDocListForm.edtSURNAMEExit(Sender: TObject);
var
  s: string;
begin
  inherited;

  s := (Sender as TDBEditEh).Text;
  (Sender as TDBEditEh).Text := NormalizeFIO(s);
end;

procedure TDocListForm.actCustHistExecute(Sender: TObject);
begin
  inherited;
  GetGridCustomer(dbgHistory);
end;

procedure TDocListForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (not FCanEdit) then
    exit;

  if not((srcDataSource.DataSet.FieldByName('DOC_NUMBER').IsNull) or
    (srcDataSource.DataSet.FieldByName('DOC_TYPE').IsNull)) then
  begin
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['DOC_NUMBER']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      dsDOCS.Delete;
  end
  else
    dsDOCS.Delete;
end;

procedure TDocListForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if FCanEdit then
  begin
    StartEdit();
  end;
end;

procedure TDocListForm.actHistoryExecute(Sender: TObject);
begin
  inherited;
  actHistory.Checked := not actHistory.Checked;
  pnlHistory.Visible := actHistory.Checked;
  splitter.Visible := actHistory.Checked;
  dsHistory.Active := actHistory.Checked;
end;

procedure TDocListForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if FCanEdit then
  begin
    StartEdit(True);
  end;
end;

procedure TDocListForm.actViewDocExecute(Sender: TObject);
var
  fileName: string;
begin
  inherited;
  if dsHistory.RecordCount = 0 then
    exit;

  if (dsHistory.FieldByName('CF_ID').IsNull) then
    exit;

  //
  fileName := GetTempDir + 'A4on\';
  if not DirectoryExists(fileName) then
    CreateDir(fileName);
  fileName := fileName + dsHistory['FILENAME'];
  qRead.ParamByName('CF_ID').AsInteger := dsHistory['CF_ID'];
  qRead.Transaction.StartTransaction;
  qRead.ExecQuery;
  qRead.FieldByName('content').SaveToFile(fileName);
  qRead.Close;
  qRead.Transaction.Rollback;
  ShellExecute(Handle, 'open', PWideChar(fileName), nil, nil, SW_SHOWNORMAL);
end;

procedure TDocListForm.btnCancelLinkClick(Sender: TObject);
begin
  inherited;
  tlbMain.Update;
end;

procedure TDocListForm.btnSaveLinkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := False;

  if (cbType.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(cbType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(cbType);

  if (edtNUMBER.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(edtNUMBER, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtNUMBER);

  if not errors then
  begin
    inherited;
    tlbMain.Update;
  end;
end;

procedure TDocListForm.actFindCustomerExecute(Sender: TObject);
begin
  inherited;

  GetGridCustomer(dbGrid);
end;

procedure TDocListForm.FormShow(Sender: TObject);
var
  s: string;
begin
  inherited;
  s := dmMain.GetSettingsValue('MOBILE_FMT');
  if s <> '' then
    edtMOBILE.EditMask := s + ';1;_';
  dsDOCS.Open;
end;

procedure TDocListForm.GetGridCustomer(Grid: TDBGridEh);
var
  i: Integer;
  b: TBookMark;
  customers: string;
begin
  inherited;

  customers := '';

  if (Grid.SelectedRows.Count = 0) then
  begin
    if not Grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
      customers := customers + ',' + IntToStr(Grid.DataSource.DataSet['CUSTOMER_ID']);
  end
  else
  begin
    b := Grid.DataSource.DataSet.GetBookmark;
    Grid.DataSource.DataSet.Disablecontrols;
    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      Grid.DataSource.DataSet.Bookmark := Grid.SelectedRows[i];
      if not Grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
        customers := customers + ',' + IntToStr(Grid.DataSource.DataSet['CUSTOMER_ID']);
    end;
    Grid.DataSource.DataSet.GotoBookmark(b);
    Grid.DataSource.DataSet.EnableControls;
  end;

  customers := Copy(customers, 2, Length(customers) - 1);

  if (customers <> '') then
    A4MainForm.ShowCustomers(7, customers);
end;

procedure TDocListForm.StartEdit(const New: Boolean = False);
begin
  if New then
    cbType.Value := 1;

  inherited;
end;

function TDocListForm.CheckControlText(const Contrl: TDBEditEh; const regexp: String): Boolean;
begin
  Result := True;
  if (Contrl.Text.IsEmpty or regexp.IsEmpty) then
    exit;

  Result := TRegEx.IsMatch(Contrl.Text, '^' + regexp + '$');
  if (not Result) then
    CnErrors.SetError(Contrl, rsInputIncorrect, iaTopCenter, bsNeverBlink)
  else
    CnErrors.Dispose(Contrl);
end;

function TDocListForm.CheckInBlackList(const Sender: TDBEditEh; const NT: Integer = 0): Boolean;
var
  s, n: string;
begin
  // NT 0 - Личный номер 1 - номер паспота
  CnErrors.Dispose(Sender);

  s := '';
  n := trim(Sender.Text);

  Query.SQL.Clear;
  Query.SQL.Add('select o.O_Name, o.O_Description, o.O_Charfield');
  Query.SQL.Add('from objects o where o.O_Type = 31 ');
  Query.SQL.Add(' and upper(replace(replace(o.O_Name, '' '', ''''), ''№'', '''')) ');
  Query.SQL.Add('     = upper(replace(replace(cast(:PN as VARCHAR(500)), '' '', ''''), ''№'', ''''))');
  Query.ParamByName('PN').AsString := n;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if not(Query.FN('O_Name').IsNull) then
    s := Query.FN('O_Name').AsString + ' ';
  if not(Query.FN('O_Description').IsNull) then
    s := s + Query.FN('O_Description').AsString;
  if not(Query.FN('O_Charfield').IsNull) then
    s := s + #13#10 + Query.FN('O_Charfield').AsString;
  Query.Transaction.Commit;
  Query.Close;

  Result := s.IsEmpty;

  if (not Result) then
  begin
    CnErrors.SetError(Sender, rsCustomerInBlackList + #13#10 + s, iaTopCenter, bsNeverBlink);
    ShowMessage(rsCustomerInBlackList + #13#10 + s);
  end;
end;

end.
