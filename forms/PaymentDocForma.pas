unit PaymentDocForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.Mask, Vcl.DBCtrls, Vcl.Menus,
  DBGridEh, FIBDataSet, frxClass, pFIBDataSet, GridsEh, DBLookupEh, DBCtrlsEh, FIBDatabase, pFIBDatabase,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL, DBGridEhGrouping, DynVarsEh, DBVertGridsEh,
  CnErrorProvider, amSplitter;

type
  TPaymentDocForm = class(TForm)
    pnlPayments: TPanel;
    pnlCustomer: TPanel;
    ToolBar4: TToolBar;
    ToolButton18: TToolButton;
    btnPrintCheck: TToolButton;
    dbgPayDocPayment: TDBGridEh;
    bbtnNewPayment: TBitBtn;
    dsPayDocDetail: TpFIBDataSet;
    srcsPayDocDetail: TDataSource;
    alPayment: TActionList;
    actPaymentNew: TAction;
    actPaymentDelete: TAction;
    actPayDocEdit: TAction;
    actPaymentDetail: TAction;
    act_CalcFine: TAction;
    dsPayDoc: TpFIBDataSet;
    srcPayDoc: TDataSource;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    trWriteQ: TpFIBTransaction;
    trReadQ: TpFIBTransaction;
    dsPaymentSource: TpFIBDataSet;
    srcPaymentSource: TDataSource;
    bbDelete: TBitBtn;
    ToolButton3: TToolButton;
    pnlTop: TPanel;
    pnlPayDocHeader: TPanel;
    pnlNotice: TPanel;
    Label14: TLabel;
    mmoNotice: TDBMemoEh;
    gridPopUp: TPopupMenu;
    ppmCopy: TMenuItem;
    ppmSelectAll: TMenuItem;
    MenuItem1: TMenuItem;
    ppmSaveSelection: TMenuItem;
    actQuickFilter: TAction;
    ActPayDocPost: TAction;
    ActPayDocCancel: TAction;
    ActPayDocPrint: TAction;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    actEditPayment: TAction;
    pnlErrors: TPanel;
    lbl1: TLabel;
    srcErrors: TDataSource;
    dsErrors: TpFIBDataSet;
    spliter: TSplitter;
    btn1: TToolButton;
    btnMovePayment: TToolButton;
    actMovePayment: TAction;
    btn2: TToolButton;
    btnFilterCustomer: TToolButton;
    actFilterCustomer: TAction;
    pmErrorGrid: TPopupMenu;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    dbgErrors: TDBGridEh;
    N1: TMenuItem;
    N2: TMenuItem;
    actPrintCheck: TAction;
    trRead1: TpFIBTransaction;
    actErrorProceed: TAction;
    actErrorsDel: TAction;
    N3: TMenuItem;
    btnTask: TToolButton;
    actTask: TAction;
    btn3: TToolButton;
    btnQuickFilter: TToolButton;
    CnErrors: TCnErrorProvider;
    pnl1: TPanel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabelSUM_DIFFERENCE: TLabel;
    DBEditL_LEAK_PRC: TDBNumberEditEh;
    DBEditC_SUM_LEAK: TDBNumberEditEh;
    DBEditSUM_DIFFERENCE: TDBNumberEditEh;
    ednC_SUM_LEAK_TAX: TDBNumberEditEh;
    dbePAY_DOC_SUM: TDBNumberEditEh;
    pnl2: TPanel;
    pnlTL: TPanel;
    pnlTR: TPanel;
    tbButtons: TToolBar;
    tbEditDoc: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton8: TToolButton;
    DocType: TDBLookupComboboxEh;
    Label6: TLabel;
    DocDate: TDBDateTimeEditEh;
    Label7: TLabel;
    dbedtPAY_DOC_NO: TDBEditEh;
    Label1: TLabel;
    Label5: TLabel;
    actCopyID: TAction;
    procedure ActPayDocCancelExecute(Sender: TObject);
    procedure ActPayDocPostExecute(Sender: TObject);
    procedure ActPayDocPrintExecute(Sender: TObject);
    procedure tbPostDocClick(Sender: TObject);
    procedure tbCancelDocClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsPayDocAfterPost(DataSet: TDataSet);
    procedure dsPayDocAfterCancel(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure actPaymentNewExecute(Sender: TObject);
    procedure actPaymentDeleteExecute(Sender: TObject);
    procedure actPayDocEditExecute(Sender: TObject);
    procedure actQuickFilterExecute(Sender: TObject);
    procedure dbgPayDocPaymentGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure dsPayDocNewRecord(DataSet: TDataSet);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ppmCopyClick(Sender: TObject);
    procedure ppmSaveSelectionClick(Sender: TObject);
    procedure ppmSelectAllClick(Sender: TObject);
    procedure srcPayDocStateChange(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure srcsPayDocDetailDataChange(Sender: TObject; Field: TField);
    procedure actEditPaymentExecute(Sender: TObject);
    procedure dsErrorsAfterOpen(DataSet: TDataSet);
    procedure actMovePaymentExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actFilterCustomerExecute(Sender: TObject);
    procedure dbgPayDocPaymentDblClick(Sender: TObject);
    procedure actPrintCheckExecute(Sender: TObject);
    procedure actErrorProceedExecute(Sender: TObject);
    procedure actErrorsDelExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure mmoNoticeEnter(Sender: TObject);
    procedure actTaskExecute(Sender: TObject);
    procedure dbgPayDocPaymentGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
    procedure dbgPayDocPaymentColumns6GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure dsPayDocAfterOpen(DataSet: TDataSet);
    procedure dbgPayDocPaymentColumns5GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure actCopyIDExecute(Sender: TObject);
  private
    { Private declarations }
    FullAccess: Boolean;
    FPersonalData: Boolean;
    FCanAdd: Boolean;
    FTodayOnly: Boolean;
    FOnlyTheir: Boolean;
    FCanDelete: Boolean;
    fPayDocId: Integer;
    fPayDate: TDate;
    fPaySum: Currency;
    FCalcFine: Boolean;
    vPaymentSRV: Boolean;
    procedure SetPayDocId(Value: Integer);
    procedure OpenRequest;
  public
    { Public declarations }
    property PayDocId: Integer read fPayDocId write SetPayDocId;
    procedure FindPaymentId(Value: Integer);
  end;

procedure CreatePayDoc(aPayDocID: Integer; const PAYMENT_ID: Integer = -1);

implementation

uses
  DM, MAIN, AtrCommon, AtrStrUtils, PaymentForma, DBGridEhFindDlgs, PaymentEditForma, pFIBQuery, PayDocSelectForma,
  ReportPreview,
  CF, CustomerForma, RequestForma;

{$R *.dfm}

procedure CreatePayDoc(aPayDocID: Integer; const PAYMENT_ID: Integer = -1);
var
  PDF: TPaymentDocForm;
  i: Integer;
  b: Boolean;
begin
  b := dmMain.AllowedAction(rght_Pays_full) or dmMain.AllowedAction(rght_Programm_ViewMoney) or
    dmMain.AllowedAction(rght_Pays_add) or dmMain.AllowedAction(rght_Pays_AddToday) or
    dmMain.AllowedAction(rght_Pays_del);
  if not b then
    Exit;

  b := false;
  for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
    if Assigned(A4MainForm.MDIChildren[i]) then
      if A4MainForm.MDIChildren[i].tag = aPayDocID then
      begin
        b := true;
        A4MainForm.MDIChildren[i].Show;
      end;

  if not b then
  begin
    PDF := TPaymentDocForm.Create(Application);
    PDF.PayDocId := aPayDocID;
    if PAYMENT_ID <> -1 then
      PDF.FindPaymentId(PAYMENT_ID);
  end;
end;

procedure TPaymentDocForm.actCopyIDExecute(Sender: TObject);
begin
  A4MainForm.CopyDataSetFldToClipboard(dsPayDocDetail, 'PAYMENT_ID');
end;

procedure TPaymentDocForm.actEditPaymentExecute(Sender: TObject);
var
  s: string;
  bm: TBookmark;
  FineSum: Currency;
begin
  if (dmMain.InStrictMode and (dsPayDoc['PAY_DOC_DATE'] < dmMain.CurrentMonth)) then
  begin
    ShowMessage(rsPastDateIncorrect);
    Exit;
  end;

  if dsPayDocDetail.FieldByName('Notice').IsNull then
    s := ''
  else
    s := dsPayDocDetail['Notice'];
  if dsPayDocDetail.FieldByName('Fine_Sum').IsNull then
    FineSum := 0
  else
    FineSum := dsPayDocDetail['Fine_Sum'];
  if EditPayment(dsPayDocDetail['Payment_id'], dsPayDocDetail['Customer_id'], dsPayDocDetail['Pay_Sum'], s, FineSum) > 0
  then
  begin
    bm := dsPayDocDetail.GetBookmark;
    dsPayDocDetail.CloseOpen(true);
    dsPayDocDetail.GotoBookmark(bm);
  end;
end;

procedure TPaymentDocForm.actFilterCustomerExecute(Sender: TObject);
var
  grid: TDBGridEh;
  i: Integer;
  b: TBookmark;
  customers: TStringList;
  s: string;
begin
  grid := dbgPayDocPayment;

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
    grid.DataSource.DataSet.Disablecontrols;
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

procedure TPaymentDocForm.actMovePaymentExecute(Sender: TObject);
var
  pd: Integer;
  i: Integer;
begin
  if (not(dmMain.AllowedAction(rght_Pays_add) or dmMain.AllowedAction(rght_Pays_AddToday) or FullAccess)) then
    Exit;

  pd := PayDocSelectForma.SelectPaymentDoc;
  if pd >= 0 then
  begin
    with TpFIBQuery.Create(Self) do
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text := 'update payment set pay_doc_id = :doc_id where payment_id = :pay_id';
        if (dbgPayDocPayment.SelectedRows.Count > 1) then
        begin
          try
            Screen.Cursor := crHourGlass;
            for i := 0 to (dbgPayDocPayment.SelectedRows.Count - 1) do
            begin
              dbgPayDocPayment.DataSource.DataSet.GotoBookmark(pointer(dbgPayDocPayment.SelectedRows.Items[i]));
              ParamByName('doc_id').AsInteger := pd;
              ParamByName('pay_id').AsInteger := dbgPayDocPayment.DataSource.DataSet.FieldByName('payment_id')
                .AsInteger;
              Transaction.StartTransaction;
              ExecQuery;
              Transaction.Commit;
            end;
          finally
            Screen.Cursor := crDefault;
          end
        end
        else
        begin
          ParamByName('doc_id').AsInteger := pd;
          ParamByName('pay_id').AsInteger := dbgPayDocPayment.DataSource.DataSet.FieldByName('payment_id').AsInteger;
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
        end;
      finally
        free;
      end;
    dsPayDoc.Refresh;
  end;
end;

procedure TPaymentDocForm.ActPayDocCancelExecute(Sender: TObject);
begin
  dbePAY_DOC_SUM.EditButton.Visible := false;
  dsPayDoc.Cancel;
end;

procedure TPaymentDocForm.ActPayDocPostExecute(Sender: TObject);
var
  vErrors: Boolean;
begin
  vErrors := false;
  if (dbedtPAY_DOC_NO.Text = '') then
  begin
    CnErrors.SetError(dbedtPAY_DOC_NO, rsEmptyDocNumber, iaTopCenter, bsNeverBlink);
    dbedtPAY_DOC_NO.SetFocus;
    vErrors := true;
  end
  else
    CnErrors.Dispose(dbedtPAY_DOC_NO);

  if (dbePAY_DOC_SUM.Text = '') then
    dbePAY_DOC_SUM.Value := 0;
  dbePAY_DOC_SUM.EditButton.Visible := false;

  if (DocDate.Text = '') then
  begin
    CnErrors.SetError(DocDate, rsRequiredField, iaTopCenter, bsNeverBlink);
    DocDate.SetFocus;
    vErrors := true;
  end
  else
  begin
    if dmMain.AllowedAction(rght_Pays_AddToday) then
    begin
      if (DocDate.Text <> '') and (DocDate.Value <> Date()) then
      begin
        CnErrors.SetError(DocDate, rsSuspiciousDate, iaTopCenter, bsNeverBlink);
        DocDate.SetFocus;
        vErrors := true;
      end
      else
        CnErrors.Dispose(DocDate);
    end
    else
      CnErrors.Dispose(DocDate);
  end;

  if not vErrors then
  begin
    dsPayDoc.Post;
    dsPayDoc.Refresh;
  end;
end;

procedure TPaymentDocForm.ActPayDocPrintExecute(Sender: TObject);
begin
  ShowReport(rsPrintPaymentDoc);
end;

procedure TPaymentDocForm.SetPayDocId(Value: Integer);
var
  i: Integer;
begin
  if Value = -1 then
  begin
    i := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);
    dsPayDoc.ParamByName('PAY_DOC_ID').AsInt64 := i;
    fPayDocId := i;
  end
  else
  begin
    with dsPayDoc.SQLs.SelectSQL do
    begin
      Clear;
      Add('select');
      Add('  D.PAY_DOC_ID, D.PAYSOURCE_ID, D.PAY_DOC_NO, D.PAY_DOC_DATE, D.PAY_DOC_SUM, D.NOTICE, ps.paysource_descr, ps.leak_prc,');
      Add('  p.c_SUM_leak,');
      Add('  round(ps.tax_prc * p.c_SUM_leak / 100, 2) as c_SUM_TAX,');
      Add(' ((SUM_INTERED + FINE_SUM) - round(((ps.tax_prc * p.c_SUM_leak / 100) + p.c_SUM_leak), 2)) as c_SUM_LEAK_TAX,');
      Add('    p.SUM_INTERED,');
      Add('    ( coalesce(D.PAY_DOC_SUM,0) - coalesce(p.SUM_INTERED,0) - coalesce(p.FINE_SUM, 0) ) SUM_DIFFERENCE ,');
      Add('    (select count(*) from pay_errors pe where pe.pay_doc_id = d.Pay_Doc_Id) pay_errors');
      Add('    , ps.FOR_FORM ');
      Add('  from PAY_DOC D');
      Add('       left outer join PAYSOURCE PS on (D.PAYSOURCE_ID = PS.PAYSOURCE_ID)');
      Add('       left outer join(select p.PAY_DOC_ID, sum(p.PAY_SUM) as SUM_INTERED , sum(coalesce(p.Fine_Sum, 0)) as FINE_SUM ');
      Add(', sum(coalesce(p.Cmsn, ((p.Pay_Sum + coalesce(p.Fine_Sum,0)) * ss.Leak_Prc)/ 100, 0)) as c_SUM_leak');
      Add('  from PAYMENT p ');
      Add('    inner join PAY_DOC ds on (p.Pay_Doc_Id = ds.Pay_Doc_Id)');
      Add('    inner join PAYSOURCE ss on (ds.PAYSOURCE_ID = ss.PAYSOURCE_ID)');
      if dmMain.SuperMode = 0 then
        Add(' inner join customer c on (p.customer_id = c.customer_id) where c.INVISIBLE = 0');
      Add(' group by PAY_DOC_ID) P on (P.PAY_DOC_ID = D.PAY_DOC_ID)');
      Add(' where D.PAY_DOC_ID = :PAY_DOC_ID');
    end;
    dsPayDoc.SQLs.RefreshSQL.Text := dsPayDoc.SQLs.SelectSQL.Text;
    dsPayDoc.ParamByName('PAY_DOC_ID').AsInt64 := Value;
    fPayDocId := Value;
  end;

  fPayDate := NOW;
  fPaySum := 0;

  dsPayDoc.Open;
  if Value = -1 then
  begin
    dsPayDoc.Insert;
    dsPayDoc['PAY_DOC_ID'] := fPayDocId;
  end
  else
  begin
    pnlPayments.Visible := true;
    dsPayDocDetail.Open;
    if not dsPayDoc.FieldByName('PAY_DOC_DATE').IsNull then
      fPayDate := dsPayDoc['PAY_DOC_DATE']
    else
      fPayDate := NOW;
  end;

  if not(dsPayDoc.FieldByName('PAY_DOC_NO').IsNull) and not(dsPayDoc.FieldByName('PAY_DOC_DATE').IsNull) then
    Caption := Caption + ' №' + dsPayDoc['PAY_DOC_NO'] + ' от ' + DateToStr(dsPayDoc['PAY_DOC_DATE']);

  Self.tag := fPayDocId;
end;

procedure TPaymentDocForm.tbPostDocClick(Sender: TObject);
var
  i: Boolean;
begin

  if dbedtPAY_DOC_NO.Text = '' then
  begin
    dbedtPAY_DOC_NO.SetFocus;
    Exit;
  end;
  if VarIsNull(dsPayDoc.FieldByName('PAY_DOC_DATE').NewValue) then
  begin
    DocDate.SetFocus;
    Exit;
  end;
  if VarIsNull(dsPayDoc.FieldByName('PAYSOURCE_ID').NewValue) then
  begin
    DocType.SetFocus;
    Exit;
  end;

  i := dmMain.AllowedAction(rght_Pays_add) or dmMain.AllowedAction(rght_Pays_AddToday); // добавление
  i := i or FullAccess; // полный доступ
  if (not i) then
  begin
    srcPayDoc.DataSet.Cancel;
    Exit;
  end;
  if (not FullAccess) and (VarToDateTime(dsPayDoc.FieldByName('PAY_DOC_DATE').NewValue) < dmMain.CurrentMonth) then
    srcPayDoc.DataSet.Cancel
  else
  begin
    srcPayDoc.DataSet.Post;
    srcPayDoc.DataSet.Refresh;
  end;

end;

procedure TPaymentDocForm.tbCancelDocClick(Sender: TObject);
begin
  srcPayDoc.DataSet.Cancel;
end;

procedure TPaymentDocForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgPayDocPayment.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgPayDocPayment', false);
  Action := caFree;
end;

procedure TPaymentDocForm.FormCreate(Sender: TObject);
var
  vAsBalance: Boolean;
  vShowLCPS: Boolean;
  i: Integer;
begin
  vAsBalance := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1'); // пеня
  vShowLCPS := (dmMain.GetSettingsValue('SHOW_LCPS') = '1');
  for i := 0 to dbgPayDocPayment.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbgPayDocPayment.Columns[i].FieldName) = 'LCPS') then
      dbgPayDocPayment.Columns[i].Visible := vShowLCPS;
    if (AnsiUpperCase(dbgPayDocPayment.Columns[i].FieldName) = 'DEBT_SUM') then
      with dbgPayDocPayment.Columns[i] do
      begin
        if vAsBalance then
        begin
          FieldName := 'BALANCE';
          Title.Caption := rsBALANCE;
          Footer.FieldName := 'BALANCE';
        end
        else
        begin
          FieldName := 'DEBT_SUM';
          Title.Caption := rsSALDO;
          Footer.FieldName := 'DEBT_SUM';
        end;
      end;
  end;
end;

procedure TPaymentDocForm.dsPayDocAfterPost(DataSet: TDataSet);
begin
  pnlPayments.Visible := true;
end;

procedure TPaymentDocForm.dsErrorsAfterOpen(DataSet: TDataSet);
begin
  pnlErrors.Visible := DataSet.RecordCount > 0;
  spliter.Visible := DataSet.RecordCount > 0;
  spliter.Align := alBottom;
end;

procedure TPaymentDocForm.dsPayDocAfterCancel(DataSet: TDataSet);
begin
  pnlPayments.Visible := not dsPayDoc.FieldByName('Pay_DOC_ID').IsNull;
end;

procedure TPaymentDocForm.dsPayDocAfterOpen(DataSet: TDataSet);
begin
  // отключим внесение платежа если форма только для объявлений
  if (not dsPayDoc.FieldByName('FOR_FORM').IsNull) then
    actPaymentNew.Enabled := actPaymentNew.Enabled and ((dsPayDoc['FOR_FORM'] <> 'OTP') or FullAccess);
end;

procedure TPaymentDocForm.FormShow(Sender: TObject);
var
  i: Integer;
  b: Boolean;
  bal: Boolean;

  Font_size: Integer;
  Font_name: string;
  Row_height: Integer;
begin
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;

  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      if Font_size <> 0 then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
      if Row_height <> 0 then
      begin
        (Components[i] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[i] as TDBGridEh).RowHeight := Row_height;
      end;
    end
    else if Font_size <> 0 then
    begin
      if (Components[i] is TMemo) then
      begin
        (Components[i] as TMemo).Font.Name := Font_name;
        (Components[i] as TMemo).Font.Size := Font_size;
      end
      else if (Components[i] is TDBMemoEh) then
      begin
        (Components[i] as TDBMemoEh).Font.Name := Font_name;
        (Components[i] as TDBMemoEh).Font.Size := Font_size;
      end
      else if (Components[i] is TDBMemo) then
      begin
        (Components[i] as TDBMemo).Font.Name := Font_name;
        (Components[i] as TDBMemo).Font.Size := Font_size;
      end;
    end;
  end;

  // права пользователей
  FTodayOnly := dmMain.AllowedAction(rght_Pays_AddToday);
  FOnlyTheir := dmMain.AllowedAction(rght_Pays_TheirAdd);
  FullAccess := dmMain.AllowedAction(rght_Pays_full); // полный доступ
  FCanAdd := dmMain.AllowedAction(rght_Pays_add); // добавление
  FCanDelete := dmMain.AllowedAction(rght_Pays_del); // удаление
  FPersonalData := (not dmMain.AllowedAction(rght_Customer_PersonalData));

  actPaymentNew.Enabled := FCanAdd or FullAccess or FTodayOnly; // полный доступ или добавление
  actPaymentDelete.Enabled := FCanDelete or FullAccess; // полный доступ или удаление
  actEditPayment.Enabled := FullAccess;
  actMovePayment.Visible := (FCanAdd or FullAccess) and (not FTodayOnly);
  actErrorProceed.Enabled := (FCanAdd or FullAccess) and (not FTodayOnly);
  actErrorsDel.Enabled := (FCanAdd or FullAccess) and (not FTodayOnly);
  Font_name := dmMain.GetCompanyValue('NAME');
  if (not Font_name.Contains('ЛТВ')) then
    actPayDocEdit.Visible := (FCanAdd or FullAccess) and (not FTodayOnly)
  else
    actPayDocEdit.Visible := FullAccess;

  // если скрываем абонентов, то скроем
  b := dsPayDocDetail.Active;
  if b then
    dsPayDocDetail.Close;

  if dmMain.SuperMode = 0 then
    dsPayDocDetail.SQLs.SelectSQL.Add(' and ( cs.INVISIBLE = 0 )');

  if FOnlyTheir then begin
    dsPayDocDetail.SQLs.SelectSQL.Add(' and p.Added_By = current_user ');
    if FTodayOnly then
      dsPayDocDetail.SQLs.SelectSQL.Add(' and p.Pay_Date = current_date ');
  end;

  dsPayDocDetail.SQLs.SelectSQL.Add('Order by P.Payment_Id');

  if FCanAdd or FullAccess then
    dbgErrors.AllowedOperations := dbgErrors.AllowedOperations + [alopDeleteEh];

  dsPaymentSource.Open;

  FCalcFine := (dmMain.GetSettingsValue('SHOW_FINE') = '1');
  vPaymentSRV := (dmMain.GetSettingsValue('PAYMENT_SRV') = '1');
  bal := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1');

  for i := 0 to dbgPayDocPayment.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbgPayDocPayment.Columns[i].FieldName) = 'FINE_SUM') then
      dbgPayDocPayment.Columns[i].Visible := FCalcFine;
    if (AnsiUpperCase(dbgPayDocPayment.Columns[i].FieldName) = 'PAID') then
      dbgPayDocPayment.Columns[i].Visible := FCalcFine;
    if (AnsiUpperCase(dbgPayDocPayment.Columns[i].FieldName) = 'SRV_NAME') then
      dbgPayDocPayment.Columns[i].Visible := vPaymentSRV;
    if (AnsiUpperCase(dbgPayDocPayment.Columns[i].FieldName) = 'BALANCE') then
      dbgPayDocPayment.Columns[i].Visible := bal;
    if (AnsiUpperCase(dbgPayDocPayment.Columns[i].FieldName) = 'DEBT_SUM') then
      dbgPayDocPayment.Columns[i].Visible := not bal;
    if (AnsiUpperCase(dbgPayDocPayment.Columns[i].FieldName) = 'BAL_SAVE') then
      dbgPayDocPayment.Columns[i].Visible := bal;
    if (AnsiUpperCase(dbgPayDocPayment.Columns[i].FieldName) = 'DEBT_SAVE') then
      dbgPayDocPayment.Columns[i].Visible := not bal;
  end;

  dbgPayDocPayment.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgPayDocPayment',
    [crpColIndexEh, crpColWidthsEh, crpSortMarkerEh]);

  if dmMain.SuperMode = 0 then
    dbgPayDocPayment.FooterRowCount := 0;

  dsErrors.Open;
end;

procedure TPaymentDocForm.mmoNoticeEnter(Sender: TObject);
begin
  mmoNotice.ReadOnly := not(mmoNotice.DataSource.DataSet.State in [dsEdit, dsInsert]);
end;

procedure TPaymentDocForm.actPaymentNewExecute(Sender: TObject);
var
  AR: Boolean;
  pay_id: Int64;
begin
  if (dmMain.InStrictMode and (dsPayDoc['PAY_DOC_DATE'] < dmMain.CurrentMonth)) then
  begin
    ShowMessage(rsPastDateIncorrect);
    Exit;
  end;

  AR := FCanAdd or FullAccess or FTodayOnly; // полный доступ
  if (not AR) then
    Exit;

  if (dsPayDoc.FieldByName('PAY_DOC_ID').IsNull) then
  begin
    ShowMessage(rsSelectPayDoc);
    Exit;
  end;

  if not dsPayDocDetail.Active then
    dsPayDocDetail.Open;

  // Бывает что удалят пустые документы
  if dsPayDocDetail.RecordCount = 0 then
  begin
    // Проверим. Есть ли документ
    with TpFIBQuery.Create(Self) do
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        SQL.Text := 'select PAY_DOC_ID from PAY_DOC where PAY_DOC_ID = ' + IntToStr(dsPayDoc['PAY_DOC_ID']);
        Transaction.StartTransaction;
        ExecQuery;
        AR := Eof;
        Transaction.Commit;
      finally
        free;
      end;
    if AR then
    begin
      ShowMessage(rsSelectPayDoc);
      Close;
      Exit;
    end;
  end;

  if FTodayOnly then
    fPayDate := Date();

  pay_id := ReceivePayment(-1, dsPayDoc['PAY_DOC_ID'], -1, fPayDate, fPaySum);

  if dsPayDoc.Active then
    dsPayDoc.Refresh;
  if dsPayDocDetail.Active then
  begin
    dsPayDocDetail.CloseOpen(true);
    if pay_id > 0 then
      dsPayDocDetail.Locate('PAYMENT_ID', VarArrayOf([pay_id]), []);
  end;
end;

procedure TPaymentDocForm.actPaymentDeleteExecute(Sender: TObject);
var
  i: Integer;
  AR: Boolean;
begin
  if (dmMain.InStrictMode and (dsPayDoc['PAY_DOC_DATE'] < dmMain.CurrentMonth)) then
  begin
    ShowMessage(rsPastDateIncorrect);
    Exit;
  end;

  if srcsPayDocDetail.DataSet.RecordCount = 0 then
    Exit;
  AR := FCanDelete or FullAccess; // полный доступ
  if (not AR) then
    Exit;
  if (not FullAccess) and ((srcPayDoc.DataSet['PAY_DOC_DATE'] < dmMain.CurrentMonth) or
    (dsPayDocDetail['PAY_DATE'] < dmMain.CurrentMonth)) then
    Exit;

  if (MessageDlg(rsDeleteSelectedRecords, mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  if (dbgPayDocPayment.SelectedRows.Count > 1) then
  begin
    try
      Screen.Cursor := crHourGlass;
      for i := 0 to (dbgPayDocPayment.SelectedRows.Count - 1) do
      begin
        dbgPayDocPayment.DataSource.DataSet.GotoBookmark(pointer(dbgPayDocPayment.SelectedRows.Items[i]));
        dbgPayDocPayment.DataSource.DataSet.Delete;
      end;
    finally
      Screen.Cursor := crDefault;
    end
  end
  else
    dbgPayDocPayment.DataSource.DataSet.Delete;

  dsPayDoc.Refresh;

end;

procedure TPaymentDocForm.actPayDocEditExecute(Sender: TObject);
begin
  pnlPayments.Visible := false;
  mmoNotice.ReadOnly := false;
  dbePAY_DOC_SUM.EditButton.Visible := true;
  dsPayDoc.Edit;
end;

procedure TPaymentDocForm.actQuickFilterExecute(Sender: TObject);
begin
  actQuickFilter.Checked := not actQuickFilter.Checked;
  dbgPayDocPayment.STFilter.Visible := actQuickFilter.Checked;
  if not actQuickFilter.Checked then
    dbgPayDocPayment.DataSource.DataSet.Filtered := false;
end;

procedure TPaymentDocForm.actTaskExecute(Sender: TObject);
begin
  if (dsPayDocDetail.RecordCount = 0) or (dsPayDocDetail.FieldByName('PAYMENT_ID').IsNull) then
    Exit;

  A4MainForm.MakeTask('P', dsPayDocDetail.FieldByName('PAYMENT_ID').AsString);
end;

procedure TPaymentDocForm.dbgPayDocPaymentColumns5GetCellParams(Sender: TObject; EditMode: Boolean;
  Params: TColCellParamsEh);
begin
  if (not FPersonalData) and (not Params.Text.IsEmpty) then
    Params.Text := HideSurname(Params.Text);
end;

procedure TPaymentDocForm.dbgPayDocPaymentColumns6GetCellParams(Sender: TObject; EditMode: Boolean;
  Params: TColCellParamsEh);
begin
  if not Params.Text.IsEmpty then
    Params.Text := StringReplace(Params.Text, #13#10, ' ', [rfReplaceAll]);
end;

procedure TPaymentDocForm.dbgPayDocPaymentDblClick(Sender: TObject);
var
  ScrPt, GrdPt: TPoint;
  Cell: TGridCoord;
  s: String;
begin
  if dsPayDocDetail.RecordCount = 0 then
    Exit;

  ScrPt := Mouse.CursorPos;
  GrdPt := dbgPayDocPayment.ScreenToClient(ScrPt);
  Cell := dbgPayDocPayment.MouseCoord(GrdPt.X, GrdPt.Y);
  s := UpperCase(dbgPayDocPayment.Fields[Cell.X - 1].FieldName);
  if (s = 'NOTICE') then
    OpenRequest
  else
  begin
    if dsPayDocDetail.FieldByName('Customer_ID').IsNull then
      Exit;
    ShowCustomer(dsPayDocDetail.FieldValues['Customer_ID']);
  end;
end;

procedure TPaymentDocForm.OpenRequest;
var
  aRequest: Integer;
  aCustomer: Integer;
  aMode: Byte;
Begin
  if dsPayDocDetail.FieldByName('PAYMENT_ID').IsNull then
    Exit;

  // ищем заявку по номеру если есть, если нет то будем искать по номеру квитанции = номеру платежа

  aRequest := -1;
  if not dsPayDocDetail.FieldByName('RQ_ID').IsNull then
  begin
    aRequest := dsPayDocDetail.FieldByName('RQ_ID').AsInteger;
  end
  else
  begin
    with TpFIBQuery.Create(Self) do
    begin
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        SQL.Text := 'select r.RQ_ID from request r where r.RECEIPT = :RECEIPT';
        ParamByName('RECEIPT').Value := dsPayDocDetail.FieldByName('PAYMENT_ID').AsString;
        Transaction.StartTransaction;
        ExecQuery;
        if not Eof then
        begin
          if not FieldByName('RQ_ID').IsNull then
            aRequest := FieldByName('RQ_ID').AsInteger;
        end;
        Close;
        Transaction.Commit;
      finally
        free;
      end;
    end;
  end;

  if aRequest > 0 then
  begin
    aCustomer := dsPayDocDetail.FieldByName('CUSTOMER_ID').AsInteger;
    aMode := 1;
    ReguestExecute(aRequest, aCustomer, aMode);
  end;
end;

procedure TPaymentDocForm.dbgPayDocPaymentGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (not dsPayDocDetail.FieldByName('HIS_COLOR').IsNull) and (dsPayDocDetail.FieldByName('HIS_COLOR').AsString <> '')
  then
    Background := StringToColor(dsPayDocDetail.FieldByName('HIS_COLOR').Value);

  if not FCalcFine then
    Exit;

  if (CompareStr(AnsiUpperCase(Column.FieldName), 'FINE_SUM') <> 0) then
    Exit;

  if (Column.Field.AsFloat = 0) then
    AFont.Color := Background
  else
    AFont.Color := clBlack;
  if (gdFocused in State) or (gdSelected in State) then
    AFont.Color := clBlack;
end;

procedure TPaymentDocForm.dbgPayDocPaymentGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh;
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

procedure TPaymentDocForm.dsPayDocNewRecord(DataSet: TDataSet);
var
  vToday: Boolean;
begin
  vToday := dmMain.AllowedAction(rght_Pays_AddToday);
  dsPayDoc['PAY_DOC_SUM'] := 0;
  if (vToday) or (dmMain.GetIniValue('SET_AS_CURRENT_DATE') <> '0') then
    dsPayDoc['PAY_DOC_DATE'] := NOW();
  dsPayDoc['PAYSOURCE_ID'] := 0;
  DocDate.Enabled := not(vToday);
end;

procedure TPaymentDocForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = vk_ESCAPE then
    if (dsPayDoc.State <> dsBrowse) then
      ActPayDocCancel.Execute
    else
      Close;
  if ((Key = VK_RETURN) and (ssCtrl in Shift)) then
  begin
    if (dsPayDoc.State <> dsBrowse) then
      ActPayDocPost.Execute;
  end
end;

procedure TPaymentDocForm.ppmCopyClick(Sender: TObject);
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

procedure TPaymentDocForm.ppmSaveSelectionClick(Sender: TObject);
begin
  inherited;

  if (ActiveControl is TDBGridEh) then
    A4MainForm.ExportDBGrid((ActiveControl as TDBGridEh), rsTable);
end;

procedure TPaymentDocForm.ppmSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TPaymentDocForm.srcPayDocStateChange(Sender: TObject);
var
  b: Boolean;
  i: Boolean;
begin
  b := actPayDocEdit.Visible;
  i := ((Sender as TDataSource).DataSet.State = dsInsert);

  actPayDocEdit.Enabled := b and ((Sender as TDataSource).DataSet.State = dsBrowse);

  ActPayDocPost.Enabled := i or (b and (not actPayDocEdit.Enabled));
  ActPayDocCancel.Enabled := i or (b and (not actPayDocEdit.Enabled));

  ActPayDocPost.Visible := i or b;
  ActPayDocCancel.Visible := i or b;

  ActPayDocPrint.Enabled := ((Sender as TDataSource).DataSet.State = dsBrowse);
end;

procedure TPaymentDocForm.srcsPayDocDetailDataChange(Sender: TObject; Field: TField);
var
  dsNotEmpty: Boolean;
begin
  dsNotEmpty := not(dsPayDocDetail.FieldByName('PAYMENT_ID').IsNull);
  actPaymentDelete.Enabled := (FCanDelete or FullAccess) and dsNotEmpty; // полный доступ или удаление
  actEditPayment.Enabled := FullAccess and dsNotEmpty;
  actPrintCheck.Enabled := dsNotEmpty;
  actMovePayment.Enabled := actMovePayment.Visible and dsNotEmpty;
  actFilterCustomer.Enabled := dsNotEmpty;
end;

procedure TPaymentDocForm.ToolButton5Click(Sender: TObject);
begin
  dsPayDoc.Cancel;
end;

procedure TPaymentDocForm.FindPaymentId(Value: Integer);
begin
  if (Value <> -1) and dsPayDocDetail.Active then
  begin
    dsPayDocDetail.Locate('PAYMENT_ID', Value, []);
  end;
end;

procedure TPaymentDocForm.actPrintCheckExecute(Sender: TObject);
var
  vi: Integer;
  ri: Integer;
begin
  if dsPayDocDetail.RecordCount = 0 then
    Exit;

  if dsPayDocDetail.FieldByName('PAYMENT_ID').IsNull then
    Exit;

  ri := dmMain.GET_ID_REPORT_BY_PATH(rsCheckReportName);
  if ri = -1 then
    Exit;

  with TReportChild.Create(Application) do
  begin
    REPORT_ID := ri;
    LoadReportBody;
    vi := GetVariableID('PAYMENT');
    if vi > 0 then
    begin
      SetVariable('PAYMENT', dsPayDocDetail['PAYMENT_ID']);
      ShowReportBody;
      Show;
    end;
  end;
end;

procedure TPaymentDocForm.actErrorProceedExecute(Sender: TObject);
var
  AR: Boolean;
  vPayDate: TDate;
  vPaySum: Currency;
  pay_id: Int64;
begin
  AR := FCanAdd or FullAccess; // полный доступ
  if (not AR) then
    Exit;

  if dsErrors.RecordCount = 0 then
    Exit;

  if dsErrors.FieldByName('PAY_DATE').IsNull then
    vPayDate := NOW()
  else
    vPayDate := dsErrors.FieldByName('PAY_DATE').AsDateTime;

  if dsErrors.FieldByName('PAY_SUM').IsNull then
    vPaySum := 0
  else
    vPaySum := dsErrors.FieldByName('PAY_SUM').AsCurrency;

  pay_id := ReceivePayment(-1, dsPayDoc['PAY_DOC_ID'], -1, vPayDate, vPaySum);
  dsPayDoc.Refresh;

  if dsPayDocDetail.Active then
    dsPayDocDetail.CloseOpen(true);
  if pay_id > 0 then
    dsPayDocDetail.Locate('PAYMENT_ID', VarArrayOf([pay_id]), []);

end;

procedure TPaymentDocForm.actErrorsDelExecute(Sender: TObject);
var
  all: Boolean;
  i: Integer;
begin
  if (MessageDlg(PWideChar(Format(rsDeleteWithName, [''])), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    all := false;
    if (dbgErrors.SelectedRows.Count > 0) then
      all := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);

    if all then
      for i := 0 to dbgErrors.SelectedRows.Count - 1 do
      begin
        dbgErrors.DataSource.DataSet.Bookmark := dbgErrors.SelectedRows[i];
        dsErrors.Delete;
      end
    else
      dsErrors.Delete;
  end;
end;

procedure TPaymentDocForm.FormActivate(Sender: TObject);
var
  bm: TBookmark;
begin
  if (dsPayDocDetail.Active) and (dsPayDocDetail.RecordCount > 0) then
  begin
    bm := dsPayDocDetail.GetBookmark;
    dsPayDocDetail.CloseOpen(true);
    dsPayDocDetail.GotoBookmark(bm);
  end
  else
    dsPayDocDetail.Open;
end;

end.
