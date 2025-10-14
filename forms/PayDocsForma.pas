unit PayDocsForma;

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
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, FIBDatabase, pFIBDatabase, PrjConst, EhLibVCL, DBGridEhGrouping,
  DynVarsEh;

type
  TPayDocsForm = class(TForm)
    pnlAll: TPanel;
    dbgPayDoc: TDBGridEh;
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
    dsPayDocs: TpFIBDataSet;
    srcPayDocs: TDataSource;
    frxDBPayDocs: TfrxDBDataset;
    ToolBar3: TToolBar;
    ToolButton14: TToolButton;
    ToolButton6: TToolButton;
    ToolButton16: TToolButton;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
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
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    actCopyID: TAction;
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
    procedure dbgPayDocGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure dbgPayDocDblClick(Sender: TObject);
    procedure actPayDocEditExecute(Sender: TObject);
    procedure bbDownClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure actPrintDocExecute(Sender: TObject);
    procedure frxDBPayDocsCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxDBPayDocsFirst(Sender: TObject);
    procedure frxDBPayDocsNext(Sender: TObject);
    procedure actPayDocDelExecute(Sender: TObject);
    procedure actPayDocNewExecute(Sender: TObject);
    procedure dbgPayDocKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure dbgPayDocGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
    procedure FormCreate(Sender: TObject);
    procedure actCopyIDExecute(Sender: TObject);
  private
    FFirstOpen: Boolean; // Первое открытие Формы
    fStartDate: TDateTime;
    fEndDate: TDateTime;
    FTodayOnly: Boolean;
    FOnlyTheir: Boolean;
    // fPayDate:TDateTime;
    fSelectedRow: Integer; // выделенная строка в таблице платежей
    // fPaySum : Currency;
    FShowPaymentType: Boolean;
    FPaymentSRV: Boolean;
    FFine: Boolean;
    // fNeedReopen : Boolean;
    FullAccess: Boolean;
    FCustActiveDebt: TColor;
    procedure SetPayDocFilter;
    procedure GenDocSQL;
  public
    { Public declarations }
  end;

var
  PayDocsForm: TPayDocsForm;

implementation

uses
  DM, MAIN, AtrCommon, PeriodForma, PaymentDocForma, AtrStrUtils, ReportPreview;

{$R *.dfm}

procedure TPayDocsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgPayDoc.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgPayDoc', false);
  dmMain.SetIniValue('PAYDOC_BEGIN', DateToStr(fStartDate));
  dmMain.SetIniValue('PAYDOC_END', DateToStr(fEndDate));
  PayDocsForm := nil;
  Action := caFree;
end;

procedure TPayDocsForm.FormCreate(Sender: TObject);
begin
  FFirstOpen := true;
end;

procedure TPayDocsForm.ppmSaveSelectionClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    A4MainForm.ExportDBGrid((ActiveControl as TDBGridEh), rsTable);
end;

procedure TPayDocsForm.ppmSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TPayDocsForm.ppmCopyClick(Sender: TObject);
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

procedure TPayDocsForm.actPaySourceFilterExecute(Sender: TObject);
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
  SetPayDocFilter;
end;

procedure TPayDocsForm.actPayDocSetPeriodExecute(Sender: TObject);
var
  bDate, eDate: TDateTime;
begin
  bDate := fStartDate;
  eDate := fEndDate;
  if ChangePeriod(bDate, eDate) then
  begin
    fStartDate := bDate;
    fEndDate := eDate;
    dmMain.SetIniValue('PAYDOC_BEGIN', DateToStr(fStartDate));
    dmMain.SetIniValue('PAYDOC_END', DateToStr(fEndDate));
    SetPayDocFilter;
  end;
end;

procedure TPayDocsForm.actQuickFilterExecute(Sender: TObject);
begin
  actQuickFilter.Checked := not actQuickFilter.Checked;
  dbgPayDoc.STFilter.Visible := actQuickFilter.Checked;
end;

procedure TPayDocsForm.SetPayDocFilter;
var
  cr: TCursor;
  ws: string;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    ws := '';
    dsPayDocs.Close;

    dsPayDocs.ParamByName('StartDate').AsDate := fStartDate;
    dsPayDocs.ParamByName('EndDate').AsDate := fEndDate;
    Caption := Format(rsPaymentsPeriod, [DateToStr(fStartDate), DateToStr(fEndDate)]);
    if (actPaySourceFilter.Checked) and (not(VarIsNull(luPayment.KeyValue) or VarIsEmpty(luPayment.KeyValue))) then
    begin
      ws := 'AND d.paysource_id = ' + VarToStr(luPayment.KeyValue);
      Caption := Caption + Format(rsPaySource, [luPayment.DisplayTextForPaintCopy]);
    end;

    if ws.IsEmpty then
      ws := ' and 1=1 ';

    dsPayDocs.ParamByName('source').AsString := ws;
    dsPayDocs.Open;
  finally
    Screen.Cursor := cr;
  end;
end;

procedure TPayDocsForm.FormShow(Sender: TObject);
var
  vSF: string;
  i: Boolean;
  Font_size, f: Integer;
  Font_name: string;
begin
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), f) then
  begin
    Font_size := f;
    Font_name := dmMain.GetIniValue('FONT_NAME');
    for f := 0 to ComponentCount - 1 do
    begin
      if Components[f] is TDBGridEh then
      begin
        (Components[f] as TDBGridEh).Font.Name := Font_name;
        (Components[f] as TDBGridEh).Font.Size := Font_size;
      end;
    end;
  end;

  dbgPayDoc.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgPayDoc', [crpColIndexEh, crpColWidthsEh]);

  // права пользователей
  FullAccess := dmMain.AllowedAction(rght_Pays_full);
  FTodayOnly := dmMain.AllowedAction(rght_Pays_AddToday);
  FOnlyTheir := dmMain.AllowedAction(rght_Pays_TheirAdd);

  i := dmMain.AllowedAction(rght_Pays_add) or FTodayOnly; // добавление
  actPayDocNew.Visible := (i or FullAccess);
  actPayDocEdit.Visible := (i or FullAccess);
  i := dmMain.AllowedAction(rght_Pays_del); // удаление
  actPayDocDel.Visible := (i or FullAccess);

  vSF := dmMain.GetSettingsValue('PAYMENT_TYPE');
  FShowPaymentType := (vSF = '1');
  vSF := dmMain.GetSettingsValue('PAYMENT_SRV');
  FPaymentSRV := (vSF = '1');
  vSF := dmMain.GetSettingsValue('SHOW_FINE');
  FFine := (vSF = '1');

  GenDocSQL;

  for f := 0 to dbgPayDoc.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbgPayDoc.Columns[f].FieldName) = 'FINE_SUM') then
      dbgPayDoc.Columns[f].Visible := FFine;
    if (AnsiUpperCase(dbgPayDoc.Columns[f].FieldName) = 'SUM_INTERED') then
      dbgPayDoc.Columns[f].Visible := FFine;
    if (AnsiUpperCase(dbgPayDoc.Columns[f].FieldName) = 'SUM_PAID') then
      dbgPayDoc.Columns[f].Visible := FFine;
  end;

  FCustActiveDebt := clRed;
  try
    fStartDate := StrToDate(dmMain.GetIniValue('PAYDOC_BEGIN'));
    fEndDate := StrToDate(dmMain.GetIniValue('PAYDOC_END'));
  except
    fEndDate := now;
    fStartDate := MonthFirstDay(dmMain.CurrentMonth);
  end;

  SetPayDocFilter;
  dsPaymentSource.Open;
end;

procedure TPayDocsForm.N1Click(Sender: TObject);
begin
  fStartDate := now;
  fEndDate := now;
  SetPayDocFilter;
end;

procedure TPayDocsForm.N2Click(Sender: TObject);
begin
  fStartDate := now - 7;
  fEndDate := now;
  SetPayDocFilter;
end;

procedure TPayDocsForm.dbgPayDocGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  ds: TDataSet;
begin
  ds := (Sender as TDBGridEh).DataSource.DataSet;
  if not ds.FieldByName('SUM_DIFFERENCE').IsNull then
    if (Round(ds.FieldByName('SUM_DIFFERENCE').AsFloat * 100) <> 0) then
      AFont.Color := FCustActiveDebt;
  if ds.FieldByName('pay_errors').AsInteger > 0 then
    Background := clHighlight;
end;

procedure TPayDocsForm.dbgPayDocGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
  var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
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

procedure TPayDocsForm.dbgPayDocKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    actPayDocEdit.Execute;
end;

procedure TPayDocsForm.dbgPayDocDblClick(Sender: TObject);
begin
  actPayDocEdit.Execute;
end;

procedure TPayDocsForm.actPayDocEditExecute(Sender: TObject);
begin
  if dsPayDocs.FieldByName('pay_doc_id').IsNull then
    exit;
  CreatePayDoc(dsPayDocs.FieldByName('pay_doc_id').AsInteger);
end;

procedure TPayDocsForm.bbDownClick(Sender: TObject);
begin
  pmPeriod.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TPayDocsForm.N3Click(Sender: TObject);
begin
  fStartDate := MonthFirstDay(now);
  fEndDate := MonthLastDay(now);
  SetPayDocFilter;
end;

procedure TPayDocsForm.N4Click(Sender: TObject);
begin
  fStartDate := (now - 1);
  fEndDate := (now - 1);
  SetPayDocFilter;
end;

procedure TPayDocsForm.actPrintDocExecute(Sender: TObject);
var
  bm: TBookMark;
begin
  dsPayDocs.DisableControls;
  bm := dsPayDocs.GetBookmark;
  ShowReport(rsRepPayDocs);
  dsPayDocs.GotoBookmark(bm);
  dsPayDocs.EnableControls;
end;

procedure TPayDocsForm.frxDBPayDocsCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  if dbgPayDoc.SelectedRows.Count > 0 then
    Eof := (fSelectedRow > dbgPayDoc.SelectedRows.Count)
end;

procedure TPayDocsForm.frxDBPayDocsFirst(Sender: TObject);
begin
  if dbgPayDoc.SelectedRows.Count > 0 then
  begin
    fSelectedRow := 1;
    dbgPayDoc.DataSource.DataSet.Bookmark := dbgPayDoc.SelectedRows[0];
  end
end;

procedure TPayDocsForm.frxDBPayDocsNext(Sender: TObject);
begin
  if (dbgPayDoc.SelectedRows.Count > 0) then
  begin
    if fSelectedRow < dbgPayDoc.SelectedRows.Count then
      dbgPayDoc.DataSource.DataSet.Bookmark := dbgPayDoc.SelectedRows[fSelectedRow];
    inc(fSelectedRow);
  end
end;

procedure TPayDocsForm.actCopyIDExecute(Sender: TObject);
begin
  A4MainForm.CopyDataSetFldToClipboard(dsPayDocs, 'PAY_DOC_ID');
end;

procedure TPayDocsForm.actPayDocDelExecute(Sender: TObject);
var
  AR: Boolean;
  i, j: Integer;
  s: string;
begin
  AR := dmMain.AllowedAction(rght_Pays_del);
  AR := AR or FullAccess; // полный доступ
  if (not AR) then
    exit;
  if (not FullAccess) and (srcPayDocs.DataSet['PAY_DOC_DATE'] < dmMain.CurrentMonth) then
    exit;

  // Проверить на наличие дочерних записей
  qDetailCount.ParamByName('pay_doc_id').AsInt64 := dsPayDocs.FieldByName('pay_doc_id').AsInteger;
  qDetailCount.Transaction.StartTransaction;
  qDetailCount.ExecQuery;
  i := qDetailCount.Fields[0].AsInteger;
  qDetailCount.Transaction.Commit;
  qDetailCount.Close;
  if i > 0 then
    MessageDlg(ms_CANT_DALETE_PAY_DOC, mtWarning, [mbOk], 0)
  else if MessageDlg(Format(ms_DELETE_PAY_DOC, [dsPayDocs.FieldByName('PAY_DOC_NO').AsString,
    dsPayDocs.FieldByName('PAY_DOC_DATE').AsString]), mtConfirmation, [mbNo, mbYes], 0) = mrYes then
  begin
    try
      dsPayDocs.Delete;
    except
      on E: Exception do
      begin
        s := '';
        i := Pos('#', E.Message);
        if (i > 0) then
        begin
          j := Pos(' ', E.Message, i + 1);
          s := Copy(E.Message, i + 1, j - i - 1);
        end;
        if s = '1' then
          ShowMessage(rsDelPayError)
        else
          raise;
      end;
    end;
  end;
end;

procedure TPayDocsForm.actPayDocNewExecute(Sender: TObject);
begin
  CreatePayDoc(-1);

end;

procedure TPayDocsForm.FormActivate(Sender: TObject);
var
  i: Integer;
  filter: string;
  inFilter: Boolean;
begin
  if FFirstOpen then
  begin
    FFirstOpen := false;
    exit;
  end;

  if not((dsPayDocs.Active) and (dsPayDocs.RecordCount > 0) and (not dsPayDocs.FieldByName('PAY_DOC_ID').IsNull)) then
    dsPayDocs.CloseOpen(true)
  else
  begin
    inFilter := dsPayDocs.Filtered;
    filter := dsPayDocs.filter;
    if (not dsPayDocs.FieldByName('PAY_DOC_ID').IsNull) then
      i := dsPayDocs['PAY_DOC_ID']
    else
      i := -1;
    dsPayDocs.CloseOpen(true);
    if inFilter then
    begin
      dsPayDocs.filter := filter;
      dsPayDocs.Filtered := inFilter;
      if ((dbgPayDoc.SearchPanel.Visible) and (dbgPayDoc.SearchPanel.SearchingText <> '')) then
        dbgPayDoc.SearchPanel.ApplySearchFilter;
    end;
    if i >= 0 then
      dsPayDocs.Locate('PAY_DOC_ID', i, []);
  end;
end;

procedure TPayDocsForm.GenDocSQL;
begin
  dsPayDocs.SQLs.SelectSQL.Clear;
  dsPayDocs.SQLs.SelectSQL.Add('select D.PAY_DOC_ID, D.PAYSOURCE_ID, D.PAY_DOC_NO, D.PAY_DOC_DATE ');
  dsPayDocs.SQLs.SelectSQL.Add(' , D.PAY_DOC_SUM, d.Added_By , d.Added_On, D.NOTICE, ps.paysource_descr, ps.leak_prc');

  with dsPayDocs.SQLs.SelectSQL do
  begin
    Add(', CNT_PAYS, p.SUM_INTERED, p.FINE_SUM ');
    Add(', p.c_SUM_leak');
    Add(', round(ps.tax_prc * p.c_SUM_leak / 100, 2) as c_SUM_TAX');
    Add(', ((p.SUM_INTERED + FINE_SUM) - round(((ps.tax_prc * p.c_SUM_leak / 100) + p.c_SUM_leak), 2)) as c_SUM_LEAK_TAX');
    Add(', (coalesce(D.PAY_DOC_SUM,0) - coalesce(p.SUM_INTERED,0) - coalesce(p.FINE_SUM, 0) ) SUM_DIFFERENCE');
    Add(', (coalesce(p.SUM_INTERED,0) + coalesce(p.FINE_SUM, 0) ) SUM_PAID');
    Add(', (select count(*) from pay_errors pe where pe.pay_doc_id = d.Pay_Doc_Id) pay_errors');
    Add('from PAY_DOC D');
    Add('left outer join PAYSOURCE PS on (D.PAYSOURCE_ID = PS.PAYSOURCE_ID)');
    Add('left outer join(select p.PAY_DOC_ID, count(*) as CNT_PAYS, sum(p.PAY_SUM) as SUM_INTERED');
    Add(', sum(coalesce(Fine_Sum, 0)) as FINE_SUM ');
    Add(', sum(coalesce(p.Cmsn, ((p.Pay_Sum + coalesce(p.Fine_Sum,0)) * ss.Leak_Prc)/ 100, 0)) as c_SUM_leak');
    Add('  from PAYMENT p ');
    Add('    inner join PAY_DOC ds on (p.Pay_Doc_Id = ds.Pay_Doc_Id)');
    Add('    inner join PAYSOURCE ss on (ds.PAYSOURCE_ID = ss.PAYSOURCE_ID)');
    if dmMain.SuperMode = 0 then
      Add('inner join customer c on (p.customer_id = c.customer_id and c.INVISIBLE = 0)');
    Add('group by PAY_DOC_ID) P on (P.PAY_DOC_ID = D.PAY_DOC_ID)');
  end;

  dsPayDocs.SQLs.RefreshSQL.Clear;
  dsPayDocs.SQLs.RefreshSQL.AddStrings(dsPayDocs.SQLs.SelectSQL);
  dsPayDocs.SQLs.RefreshSQL.Add('where D.PAY_DOC_ID = :OLD_PAY_DOC_ID');

  dsPayDocs.SQLs.SelectSQL.Add('where d.PAY_DOC_DATE between :StartDate and :EndDate ');

  if FOnlyTheir then
  begin
    dsPayDocs.SQLs.SelectSQL.Add(' and (exists (select p.Payment_Id from payment p ');
    dsPayDocs.SQLs.SelectSQL.Add(' where p.Pay_Doc_Id = d.Pay_Doc_Id and p.Added_By = current_user) ');
    dsPayDocs.SQLs.SelectSQL.Add(' or ( d.Added_By = current_user )) ');

    if FTodayOnly then
    begin
      dsPayDocs.SQLs.SelectSQL.Add(' and (exists(select pt.Pay_Doc_Id from payment pt ');
      dsPayDocs.SQLs.SelectSQL.Add(' where p.Pay_Doc_Id = d.Pay_Doc_Id ');
      dsPayDocs.SQLs.SelectSQL.Add(' and pt.Pay_Date = current_date and pt.Added_By = current_user) ');
      dsPayDocs.SQLs.SelectSQL.Add(' or (d.Added_By = current_user and cast(d.Added_on as date) = current_date)) ');
    end;
  end;

  dsPayDocs.SQLs.SelectSQL.Add(' @source ');
  dsPayDocs.SQLs.SelectSQL.Add('order by PAY_DOC_DATE, PAY_DOC_NO');
end;

end.
