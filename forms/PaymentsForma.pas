unit PaymentsForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus,
  Vcl.ActnList,
  Vcl.ExtCtrls, Vcl.Buttons,
  DBGridEh, DBCtrlsEh, DBLookupEh, frxClass, frxDBSet, FIBDataSet, pFIBDataSet, GridsEh, FIBQuery,
  pFIBQuery,
  DBGridEhGrouping, MemTableDataEh, DataDriverEh, pFIBDataDriverEh, MemTableEh, ToolCtrlsEh, DBGridEhToolCtrls,
  DBAxisGridsEh,
  PrjConst, EhLibVCL, DynVarsEh, FIBDatabase, pFIBDatabase;

type
  TPaymentsForm = class(TForm)
    pnlAll: TPanel;
    dbgPayments: TDBGridEh;
    alGuide: TActionList;
    actPayDocNew: TAction;
    actPayDocEdit: TAction;
    actPayDocDel: TAction;
    actPayDocSearch: TAction;
    actPayDocSetPeriod: TAction;
    actPaySourceFilter: TAction;
    actPrintDoc: TAction;
    actEditPayment: TAction;
    actQuickFilter: TAction;
    gridPopUp: TPopupMenu;
    ppmCopy: TMenuItem;
    ppmSelectAll: TMenuItem;
    MenuItem1: TMenuItem;
    ppmSaveSelection: TMenuItem;
    dsPayments: TpFIBDataSet;
    srcPayments: TDataSource;
    frxDBPayments: TfrxDBDataset;
    ToolBar3: TToolBar;
    ToolButton14: TToolButton;
    ToolButton6: TToolButton;
    ToolButton16: TToolButton;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    Panel4: TPanel;
    luPayment: TDBLookupComboboxEh;
    ToolButton20: TToolButton;
    ToolButton7: TToolButton;
    ToolButton27: TToolButton;
    dsPaymentSource: TpFIBDataSet;
    srcPaymentSource: TDataSource;
    pmPeriod: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    ToolButton2: TToolButton;
    qDetailCount: TpFIBQuery;
    MainMenu1: TMainMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N15: TMenuItem;
    chkGroup: TCheckBox;
    btn1: TToolButton;
    actGroup: TAction;
    N13: TMenuItem;
    mtPayments: TMemTableEh;
    drvPayments: TpFIBDataDriverEh;
    pnlErrors: TPanel;
    lbl1: TLabel;
    dbgrdErrors: TDBGridEh;
    dsErrors: TpFIBDataSet;
    srcErrors: TDataSource;
    btn2: TToolButton;
    btnFilterCustomers: TToolButton;
    actFilterCustomers: TAction;
    pmGridClick: TPopupMenu;
    miPayDoc: TMenuItem;
    miAbonent: TMenuItem;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppmSaveSelectionClick(Sender: TObject);
    procedure ppmSelectAllClick(Sender: TObject);
    procedure ppmCopyClick(Sender: TObject);
    procedure actPaySourceFilterExecute(Sender: TObject);
    procedure actPayDocSetPeriodExecute(Sender: TObject);
    procedure actQuickFilterExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure dbgPaymentsDblClick(Sender: TObject);
    procedure actPayDocEditExecute(Sender: TObject);
    procedure bbDownClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure actPrintDocExecute(Sender: TObject);
    procedure frxDBPaymentsCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxDBPaymentsFirst(Sender: TObject);
    procedure frxDBPaymentsNext(Sender: TObject);
    procedure actPayDocDelExecute(Sender: TObject);
    procedure actPayDocNewExecute(Sender: TObject);
    procedure dbgPaymentsKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure actGroupExecute(Sender: TObject);
    procedure dbgPaymentsDataGroupGetRowText(Sender: TCustomDBGridEh; GroupDataTreeNode: TGroupDataTreeNodeEh;
      var GroupRowText: string);
    procedure actFilterCustomersExecute(Sender: TObject);
    procedure miPayDocClick(Sender: TObject);
    procedure miAbonentClick(Sender: TObject);
    procedure dbgPaymentsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure dbgPaymentsGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
    procedure dbgPaymentsColumns2GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
  private
    fStartDate: TDateTime;
    fEndDate: TDateTime;
    fSelectedRow: Integer; // выделенная строка в таблице платежей
    FullAccess: Boolean;
    FTodayOnly: Boolean;
    FOnlyTheir: Boolean;
    FPersonalData: Boolean;
    procedure SetPaymentsFilter;
  public
    { Public declarations }
  end;

var
  PaymentsForm: TPaymentsForm;

implementation

uses
  DM, MAIN, AtrCommon, PeriodForma, PaymentDocForma, AtrStrUtils, CF, CustomerForma, ReportPreview;

{$R *.dfm}

procedure TPaymentsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not actGroup.Checked then
    dbgPayments.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgPayments', false);
  if dsErrors.Active then
    dsErrors.Close;
  if srcPayments.DataSet.Active then
    srcPayments.DataSet.Close;
  dsPaymentSource.Close;
  PaymentsForm := nil;
  Action := caFree;
end;

procedure TPaymentsForm.ppmSaveSelectionClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    A4MainForm.ExportDBGrid((ActiveControl as TDBGridEh), rsTable);
end;

procedure TPaymentsForm.ppmSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TPaymentsForm.ppmCopyClick(Sender: TObject);

var
  dbg: TDBGridEh;

begin

  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
        A4MainForm.CopyDBGrid(dbg)
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;

end;

procedure TPaymentsForm.actPaySourceFilterExecute(Sender: TObject);
begin
  actPaySourceFilter.Checked := not actPaySourceFilter.Checked;
  actPaySourceFilter.Checked := actPaySourceFilter.Checked and not VarIsNull(luPayment.KeyValue);
  if actPaySourceFilter.Checked then
  begin
    actPaySourceFilter.Caption := rsFilterOff;
    actPaySourceFilter.Hint := rsFilterOffCondition;
  end
  else
  begin
    actPaySourceFilter.Caption := rsFilterOn;
    actPaySourceFilter.Hint := rsFilterOnCondition;
  end;
  SetPaymentsFilter;
end;

procedure TPaymentsForm.actPayDocSetPeriodExecute(Sender: TObject);
var
  bDate, eDate: TDateTime;
begin
  bDate := fStartDate;
  eDate := fEndDate;
  if ChangePeriod(bDate, eDate) then
  begin
    fStartDate := bDate;
    fEndDate := eDate;
    SetPaymentsFilter;
  end;
end;

procedure TPaymentsForm.actQuickFilterExecute(Sender: TObject);
begin
  actQuickFilter.Checked := not actQuickFilter.Checked;
  dbgPayments.STFilter.Visible := actQuickFilter.Checked;
end;

procedure TPaymentsForm.SetPaymentsFilter;
begin
  dsPayments.Close;
  if not FOnlyTheir then
  begin
    if (FTodayOnly) then
    begin
      fStartDate := Now();
      fEndDate := Now();
    end;
    dsPayments.ParamByName('StartDate').AsDate := fStartDate;
    dsPayments.ParamByName('EndDate').AsDate := fEndDate;
    Caption := Format(rsPaymentsPeriod, [DateToStr(fStartDate), DateToStr(fEndDate)]);
    if actPaySourceFilter.Checked then
    begin
      dsPayments.ParamByName('source').AsString := 'AND d.paysource_id = ' + VarToStr(luPayment.KeyValue);
      Caption := Caption + Format(rsPaySource, [luPayment.DisplayTextForPaintCopy]);
    end
    else
      dsPayments.ParamByName('source').AsString := '';
  end
  else
  begin
    dsPayments.ParamByName('StartDate').AsDate := Date();
    dsPayments.ParamByName('EndDate').AsDate := Date();
    dsPayments.ParamByName('source').AsString := ' and p.Added_By = current_user';
  end;
  dsPayments.Open;

  if dsErrors.Active then
    dsErrors.Close;
  if not FTodayOnly then
  begin
    dsErrors.ParamByName('StartDate').AsDate := fStartDate;
    dsErrors.ParamByName('EndDate').AsDate := fEndDate;
  end
  else
  begin
    dsErrors.ParamByName('StartDate').AsDate := Date();
    dsErrors.ParamByName('EndDate').AsDate := Date();
  end;
  dsErrors.Open;
  if (dsErrors.RecordCount > 0) then
  begin
    pnlErrors.Visible := true;
  end
  else
  begin
    pnlErrors.Visible := false;
    dsErrors.Close;
  end;

end;

procedure TPaymentsForm.FormShow(Sender: TObject);
var
  vSF: Boolean;
  i: Integer;
  vPaymentSRV: Boolean;
  vFine: Boolean;
  vBalance: Boolean;
  Font_size: Integer;
  Font_name: string;
begin
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TDBGridEh then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end
      else if (Components[i] is TMemo) then
      begin
        (Components[i] as TMemo).Font.Name := Font_name;
        (Components[i] as TMemo).Font.Size := Font_size;
      end
      else if (Components[i] is TDBMemoEh) then
      begin
        (Components[i] as TDBMemoEh).Font.Name := Font_name;
        (Components[i] as TDBMemoEh).Font.Size := Font_size;
      end;
    end;
  end;

  dbgPayments.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgPayments',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);

  FTodayOnly := dmMain.AllowedAction(rght_Pays_AddToday);
  FOnlyTheir := dmMain.AllowedAction(rght_Pays_TheirAdd);

  fEndDate := Now;
  fStartDate := MonthFirstDay(dmMain.CurrentMonth);
  SetPaymentsFilter;
  dsPaymentSource.Open;

  // права пользователей
  FullAccess := dmMain.AllowedAction(rght_Pays_full);
  FPersonalData := (not dmMain.AllowedAction(rght_Customer_PersonalData));
  vSF := dmMain.AllowedAction(rght_Pays_add) or FTodayOnly; // добавление
  actPayDocNew.Visible := (vSF or FullAccess);
  actPayDocEdit.Visible := (vSF or FullAccess);
  actPayDocSetPeriod.Visible := not FTodayOnly;
  vSF := dmMain.AllowedAction(rght_Pays_del); // удаление
  actPayDocDel.Visible := (vSF or FullAccess);

  vFine := (dmMain.GetSettingsValue('SHOW_FINE') = '1');
  vPaymentSRV := (dmMain.GetSettingsValue('PAYMENT_SRV') = '1');
  vBalance := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1');

  for i := 0 to dbgPayments.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbgPayments.Columns[i].FieldName) = 'FINE_SUM') then
      dbgPayments.Columns[i].Visible := vFine;
    if (AnsiUpperCase(dbgPayments.Columns[i].FieldName) = 'SRV_NAME') then
      dbgPayments.Columns[i].Visible := vPaymentSRV;
    if (AnsiUpperCase(dbgPayments.Columns[i].FieldName) = 'DEBT_SUM') then
      dbgPayments.Columns[i].Visible := not vBalance;
    if (AnsiUpperCase(dbgPayments.Columns[i].FieldName) = 'BALANCE') then
      dbgPayments.Columns[i].Visible := vBalance;
  end;

  if dmMain.SuperMode = 0 then
    dbgPayments.FooterRowCount := 0;

end;

procedure TPaymentsForm.N1Click(Sender: TObject);
begin
  fStartDate := Now;
  fEndDate := Now;
  SetPaymentsFilter;
end;

procedure TPaymentsForm.N2Click(Sender: TObject);
begin
  fStartDate := Now - 7;
  fEndDate := Now;
  SetPaymentsFilter;
end;

procedure TPaymentsForm.dbgPaymentsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    actPayDocEdit.Execute;
end;

procedure TPaymentsForm.dbgPaymentsColumns2GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if (not FPersonalData) and (not Params.Text.IsEmpty) then
    Params.Text := HideSurname(Params.Text);
end;

procedure TPaymentsForm.dbgPaymentsDataGroupGetRowText(Sender: TCustomDBGridEh; GroupDataTreeNode: TGroupDataTreeNodeEh;
  var GroupRowText: string);
var
  s: string;
  i: Integer;
begin
  s := GroupDataTreeNode.DisplayValue;
  i := Pos(s, GroupRowText);
  GroupRowText := Copy(GroupRowText, i, Length(GroupRowText));
end;

procedure TPaymentsForm.dbgPaymentsDblClick(Sender: TObject);
var
  foo: TPoint;
begin
  GetCursorPos(foo);
  // foo := ScreenToClient(foo);
  pmGridClick.Popup(foo.X - 5, foo.Y - 5);
end;

procedure TPaymentsForm.actPayDocEditExecute(Sender: TObject);
begin
  if dsPayments.FieldByName('pay_doc_id').IsNull then
    exit;
  CreatePayDoc(dsPayments.FieldByName('pay_doc_id').AsInteger);
end;

procedure TPaymentsForm.bbDownClick(Sender: TObject);
begin
  pmPeriod.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TPaymentsForm.N3Click(Sender: TObject);
begin
  fStartDate := MonthFirstDay(Now);
  fEndDate := MonthLastDay(Now);
  SetPaymentsFilter;
end;

procedure TPaymentsForm.N4Click(Sender: TObject);
begin
  fStartDate := (Now - 1);
  fEndDate := (Now - 1);
  SetPaymentsFilter;
end;

procedure TPaymentsForm.actPrintDocExecute(Sender: TObject);
var
  bm: TBookMark;
begin
  dsPayments.DisableControls;
  bm := dsPayments.GetBookmark;
  ShowReport(rsPayments);
  dsPayments.GotoBookmark(bm);
  dsPayments.EnableControls;
end;

procedure TPaymentsForm.frxDBPaymentsCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  if dbgPayments.SelectedRows.Count > 0 then
    Eof := (fSelectedRow > dbgPayments.SelectedRows.Count)
end;

procedure TPaymentsForm.frxDBPaymentsFirst(Sender: TObject);
begin
  if dbgPayments.SelectedRows.Count > 0 then
  begin
    fSelectedRow := 1;
    dbgPayments.DataSource.DataSet.Bookmark := dbgPayments.SelectedRows[0];
  end
end;

procedure TPaymentsForm.frxDBPaymentsNext(Sender: TObject);
begin
  if (dbgPayments.SelectedRows.Count > 0) then
  begin
    if fSelectedRow < dbgPayments.SelectedRows.Count then
      dbgPayments.DataSource.DataSet.Bookmark := dbgPayments.SelectedRows[fSelectedRow];
    inc(fSelectedRow);
  end
end;

procedure TPaymentsForm.miAbonentClick(Sender: TObject);
begin
  if dsPayments.FieldByName('Customer_ID').IsNull then
    exit;
  ShowCustomer(dsPayments.FieldValues['Customer_ID']);
end;

procedure TPaymentsForm.miPayDocClick(Sender: TObject);
begin
  actPayDocEdit.Execute;
end;

procedure TPaymentsForm.actFilterCustomersExecute(Sender: TObject);
var
  grid: TDBGridEh;
  i: Integer;
  b: TBookMark;
  customers: TStringList;
  s: string;
begin
  grid := dbgPayments;

  customers := TStringList.Create;
  customers.Sorted := true;
  customers.Duplicates := dupIgnore;

  if (grid.SelectedRows.Count = 0) then
  begin
    if not grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
      customers.Add(IntToStr(grid.DataSource.DataSet['CUSTOMER_ID']));
  end
  else
  begin
    b := grid.DataSource.DataSet.GetBookmark;
    grid.DataSource.DataSet.DisableControls;
    grid.DataSource.DataSet.First;
    for i := 0 to grid.SelectedRows.Count - 1 do
    begin
      grid.DataSource.DataSet.Bookmark := grid.SelectedRows[i];
      if not grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
        customers.Add(IntToStr(grid.DataSource.DataSet['CUSTOMER_ID']));
    end;
    grid.DataSource.DataSet.GotoBookmark(b);
    grid.DataSource.DataSet.EnableControls;
  end;

  if (customers.Count > 0) then
    s := customers.CommaText
  else
    s := '';

  FreeAndNil(customers);

  if (s <> '') then
    ShowCustomers(7, s);
end;

procedure TPaymentsForm.actGroupExecute(Sender: TObject);
var
  Crsr: TCursor;
begin
  actGroup.Checked := not actGroup.Checked;
  Crsr := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  if actGroup.Checked then
  begin
    srcPayments.DataSet := mtPayments;
    dbgPayments.DataGrouping.Active := true;
    dbgPayments.DataGrouping.GroupPanelVisible := true;
    dbgPayments.DataGrouping.GroupLevels.Clear;
    srcPayments.DataSet.Active := true;
  end
  else
  begin
    srcPayments.DataSet := dsPayments;
    dbgPayments.DataGrouping.GroupLevels.Clear;
    dbgPayments.DataGrouping.Active := false;
    dbgPayments.DataGrouping.GroupPanelVisible := false;
    mtPayments.Active := false;
    dsPayments.Open;
  end;
  Screen.Cursor := Crsr;
end;

procedure TPaymentsForm.actPayDocDelExecute(Sender: TObject);
var
  AR: Boolean;
  i: Integer;
begin
  if dsPayments.RecordCount = 0 then
    exit;

  AR := dmMain.AllowedAction(rght_Pays_del); // добавление
  AR := AR or FullAccess; // полный доступ
  if (not AR) then
    exit;
  if (not FullAccess) and (srcPayments.DataSet['PAY_DOC_DATE'] < dmMain.CurrentMonth) then
    exit;

  // Проверить на наличие дочерних записей
  qDetailCount.ParamByName('pay_doc_id').AsInt64 := dsPayments.FieldByName('pay_doc_id').AsInteger;
  qDetailCount.ExecQuery;
  i := qDetailCount.Fields[0].AsInteger;
  qDetailCount.Close;
  if i > 0 then
    MessageDlg(ms_CANT_DALETE_PAY_DOC, mtWarning, [mbOk], 0)
  else if MessageDlg(Format(ms_DELETE_PAY_DOC, [dsPayments.FieldByName('PAY_DOC_NO').AsString,
    dsPayments.FieldByName('PAY_DOC_DATE').AsString]), mtConfirmation, [mbNo, mbYes], 0) = mrYes then
    dsPayments.Delete;

end;

procedure TPaymentsForm.actPayDocNewExecute(Sender: TObject);
begin
  CreatePayDoc(-1);
end;

procedure TPaymentsForm.FormActivate(Sender: TObject);
var
  bm: TBookMark;
begin
  bm := dsPayments.GetBookmark;
  dsPayments.CloseOpen(true);
  dsPayments.GotoBookmark(bm);
end;

procedure TPaymentsForm.dbgPaymentsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if not dsPayments.FieldByName('HIS_COLOR').IsNull then
    Background := StringToColor(dsPayments.FieldByName('HIS_COLOR').Value);
end;

procedure TPaymentsForm.dbgPaymentsGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh;
  AFont: TFont; var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
var
  i: Integer;
begin
  if (DataCol = 1) and (Row = 0) then
  begin
    i := (Sender as TDBGridEh).SelectedRows.Count;
    if i > 1 then
      Text := IntToStr(i);
  end;
end;

end.
