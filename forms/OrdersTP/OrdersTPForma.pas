unit OrdersTPForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, ComCtrls,
  ToolWin, frxClass, frxDBSet, DB, FIBDataSet, pFIBDataSet, Menus,
  ActnList, GridsEh, ExtCtrls, Buttons, DBGridEhImpExp, FIBQuery, pFIBQuery,
  DBGridEhGrouping, MemTableDataEh, DataDriverEh, pFIBDataDriverEh,
  MemTableEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh,
  System.Actions, PrjConst, System.UITypes, EhLibVCL, DynVarsEh;

type
  TOrdersTPForm = class(TForm)
    pnlAll: TPanel;
    dbgOrdersTP: TDBGridEh;
    alGuide: TActionList;
    actOTPNew: TAction;
    actOTPEdit: TAction;
    actOTPDel: TAction;
    actOTPSearch: TAction;
    actOTPSetPeriod: TAction;
    actOTPFilter: TAction;
    actPrintDoc: TAction;
    actQuickFilter: TAction;
    gridPopUp: TPopupMenu;
    ppmCopy: TMenuItem;
    ppmSelectAll: TMenuItem;
    MenuItem1: TMenuItem;
    ppmSaveSelection: TMenuItem;
    dsOrdersTP: TpFIBDataSet;
    srcOrdersTP: TDataSource;
    frxDBOrdersTP: TfrxDBDataset;
    ToolBar3: TToolBar;
    ToolButton14: TToolButton;
    ToolButton6: TToolButton;
    ToolButton16: TToolButton;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    ToolButton20: TToolButton;
    btnSetFilter: TToolButton;
    ToolButton27: TToolButton;
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
    btn1: TToolButton;
    actGroup: TAction;
    N13: TMenuItem;
    mtOrdersTP: TMemTableEh;
    drvOrdersTP: TpFIBDataDriverEh;
    miN14: TMenuItem;
    miN15: TMenuItem;
    btnCustomers: TToolButton;
    ToolButton9: TToolButton;
    actCustomers: TAction;
    actAddPayment: TAction;
    btnAddPayment: TToolButton;
    miN16: TMenuItem;
    miCustomers: TMenuItem;
    miAddPayment: TMenuItem;
    actMakeCopy: TAction;
    miMakeCopy: TMenuItem;
    actCancel: TAction;
    miSC: TMenuItem;
    miCancel: TMenuItem;
    miMakeCopyMM: TMenuItem;
    actPrintOrder: TAction;
    miPrintOrder: TMenuItem;
    ToolButton3: TToolButton;
    chkTREE: TCheckBox;
    pmFilter: TPopupMenu;
    miEnableFilter: TMenuItem;
    N42: TMenuItem;
    N36: TMenuItem;
    dsFilter: TMemTableEh;
    miN17: TMenuItem;
    actEnableFilter: TAction;
    actSetNewFilterNew: TAction;
    miN18: TMenuItem;
    miN19: TMenuItem;
    mmiCancel: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppmSaveSelectionClick(Sender: TObject);
    procedure ppmSelectAllClick(Sender: TObject);
    procedure ppmCopyClick(Sender: TObject);
    procedure actOTPSetPeriodExecute(Sender: TObject);
    procedure actQuickFilterExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure dbgOrdersTPDblClick(Sender: TObject);
    procedure actOTPEditExecute(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure actPrintDocExecute(Sender: TObject);
    procedure frxDBOrdersTPCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxDBOrdersTPFirst(Sender: TObject);
    procedure frxDBOrdersTPNext(Sender: TObject);
    procedure actOTPDelExecute(Sender: TObject);
    procedure actOTPNewExecute(Sender: TObject);
    procedure dbgOrdersTPKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure actGroupExecute(Sender: TObject);
    procedure dbgOrdersTPDataGroupGetRowText(Sender: TCustomDBGridEh; GroupDataTreeNode: TGroupDataTreeNodeEh;
      var GroupRowText: string);
    procedure FormCreate(Sender: TObject);
    procedure actCustomersExecute(Sender: TObject);
    procedure actAddPaymentExecute(Sender: TObject);
    procedure actMakeCopyExecute(Sender: TObject);
    procedure actPrintOrderExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure dbgOrdersTPColumns9GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure actEnableFilterExecute(Sender: TObject);
    procedure dsFilterNewRecord(DataSet: TDataSet);
    procedure actSetFilterExecute(Sender: TObject);
    procedure miSetNewFilterNewClick(Sender: TObject);
  private
    FFirstOpen: Boolean;
    fStartDate: TDateTime;
    fEndDate: TDateTime;
    fSelectedRow: Integer; // выделенная строка в таблице платежей
    FullAccess: Boolean;
    FViewTodayOnly: Boolean;
    procedure SetOrdersTPFilter;
    procedure PrintOrderReport;
    procedure SetOrderPayDate();
    procedure CancelOrder();
    function GenerateFilter: string;
    // function GetPayDocForLTV: Integer;
  public
    procedure FindOrOpenOrder(const OrderID: Integer);
  end;

var
  OrdersTPForm: TOrdersTPForm;

procedure ShowOrders(const aOrderID: Integer);

implementation

uses
  DM, MAIN, CF, AtrCommon, PeriodForma, AtrStrUtils, TextEditForma,
  OrderTPForma, ReportPreview, PaymentForma, JsonDataObjects, A4onTypeUnit, OrdersTPFilter;

{$R *.dfm}

procedure ShowOrders(const aOrderID: Integer);
var
  canView: Boolean;
begin
  canView := dmMain.AllowedAction(rght_OrdersTP_full);
  canView := canView or dmMain.AllowedAction(rght_OrdersTP_View);
  canView := canView or dmMain.AllowedAction(rght_OrdersTP_add);
  canView := canView or dmMain.AllowedAction(rght_OrdersTP_edit);
  canView := canView or dmMain.AllowedAction(rght_OrdersTP_del);

  if not canView then
    Exit;

  if Not Assigned(OrdersTPForm) then
    OrdersTPForm := TOrdersTPForm.Create(Application);
  OrdersTPForm.Show;

  OrdersTPForm.FindOrOpenOrder(aOrderID);
end;

procedure TOrdersTPForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, True);

  if dsFilter.Active then
    dsFilter.Close;

  if srcOrdersTP.DataSet.Active then
    srcOrdersTP.DataSet.Close;
  OrdersTPForm := nil;
  Action := caFree;
end;

procedure TOrdersTPForm.FormCreate(Sender: TObject);
begin
  FFirstOpen := True;
end;

procedure TOrdersTPForm.ppmSaveSelectionClick(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  Ext: String;

begin

  A4MainForm.SaveDialog.FileName := rsPayments;
  if (ActiveControl is TDBGridEh) then
    if A4MainForm.SaveDialog.Execute then
    begin
      case A4MainForm.SaveDialog.FilterIndex of
        1:
          begin
            ExpClass := TDBGridEhExportAsUnicodeText;
            Ext := 'txt';
          end;
        2:
          begin
            ExpClass := TDBGridEhExportAsCSV;
            Ext := 'csv';
          end;
        3:
          begin
            ExpClass := TDBGridEhExportAsHTML;
            Ext := 'htm';
          end;
        4:
          begin
            ExpClass := TDBGridEhExportAsRTF;
            Ext := 'rtf';
          end;
        5:
          begin
            ExpClass := TDBGridEhExportAsOLEXLS;
            Ext := 'xls';
          end;
      else
        ExpClass := nil;
        Ext := '';
      end;
      if ExpClass <> nil then
      begin
        if AnsiUpperCase(Copy(A4MainForm.SaveDialog.FileName, Length(A4MainForm.SaveDialog.FileName) - 2, 3)) <>
          AnsiUpperCase(Ext) then
          A4MainForm.SaveDialog.FileName := A4MainForm.SaveDialog.FileName + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass, TDBGridEh(ActiveControl), A4MainForm.SaveDialog.FileName, False);
      end;
    end;

end;

procedure TOrdersTPForm.ppmSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TOrdersTPForm.ppmCopyClick(Sender: TObject);

var
  dbg: TDBGridEh;

begin

  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
        DBGridEh_DoCopyAction(dbg, False)
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;

end;

procedure TOrdersTPForm.actOTPSetPeriodExecute(Sender: TObject);
var
  bDate, eDate: TDateTime;
begin
  bDate := fStartDate;
  eDate := fEndDate;
  if ChangePeriod(bDate, eDate) then
  begin
    fStartDate := bDate;
    fEndDate := eDate;
    SetOrdersTPFilter;
  end;
end;

procedure TOrdersTPForm.actQuickFilterExecute(Sender: TObject);
begin
  actQuickFilter.Checked := not actQuickFilter.Checked;
  dbgOrdersTP.STFilter.Visible := actQuickFilter.Checked;
end;

procedure TOrdersTPForm.actSetFilterExecute(Sender: TObject);
var
  filter: string;
begin
  if not(srcOrdersTP.DataSet is TpFIBDataSet) then
    Exit;

  filter := '';
  if not dsFilter.Active then
    dsFilter.Open;

  with TOrdersTPFilterForm.Create(Application) do
    try
      if ShowModal = mrOk then
      begin
        actEnableFilter.Checked := True;
        filter := GenerateFilter;
      end;
    finally
      Free;
    end;

  if (dsOrdersTP.Filtered) then
  begin
    dsOrdersTP.filter := '';
    dsOrdersTP.Filtered := False;
  end;

  if filter <> '' then
  begin
    dsOrdersTP.Close;
    dsOrdersTP.ParamByName('Filter').Value := filter;
    dsOrdersTP.CloseOpen(True);
  end;
end;

procedure TOrdersTPForm.SetOrdersTPFilter;
var
  s: string;
begin
  if not dsFilter.Active then
    dsFilter.Open;
  dsFilter.EmptyTable;
  dsFilter.Insert;
  dsFilter['DT'] := 0;
  dsFilter['DS'] := fStartDate;
  dsFilter['DE'] := fEndDate;
  dsFilter.Post;
  actEnableFilter.Checked := True;
  s := GenerateFilter;
  dsOrdersTP.ParamByName('Filter').Value := s;
  dsOrdersTP.CloseOpen(True);
end;

procedure TOrdersTPForm.FormShow(Sender: TObject);
var
  vSF: Boolean;
  i: Integer;
  Font_size: Integer;
  Font_name: string;
  Row_height: Integer;
begin
  dbgOrdersTP.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgOrdersTP',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);

  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      (Components[i] as TDBGridEh).RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
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
    end;
  end;

  // права пользователей
  FullAccess := dmMain.AllowedAction(rght_OrdersTP_full);
  FViewTodayOnly := dmMain.AllowedAction(rght_OrdersTP_Today);

  fEndDate := now;
  if not FViewTodayOnly then
    fStartDate := MonthFirstDay(dmMain.CurrentMonth)
  else
    fStartDate := Now;

  SetOrdersTPFilter;

  vSF := dmMain.AllowedAction(rght_OrdersTP_add); // добавление
  actOTPNew.Visible := (vSF or FullAccess);
  actMakeCopy.Visible := (vSF or FullAccess);
  actOTPEdit.Visible := (dmMain.AllowedAction(rght_OrdersTP_edit) or FullAccess);
  actCancel.Visible := (dmMain.AllowedAction(rght_OrdersTP_edit) or FullAccess);
  miSC.Visible := actCancel.Visible;

  vSF := dmMain.AllowedAction(rght_OrdersTP_del); // удаление
  actOTPDel.Visible := (vSF or FullAccess);

  if dmMain.SuperMode = 0 then
    dbgOrdersTP.FooterRowCount := 0;

  dbgOrdersTP.DefaultApplySorting;
end;

procedure TOrdersTPForm.N1Click(Sender: TObject);
var
  s : string;
begin
  if not dsFilter.Active then
    dsFilter.Open;
  dsFilter.EmptyTable;
  dsFilter.Insert;
  dsFilter['DT'] := 0;
  dsFilter['DS'] := now;
  dsFilter['DE'] := now;
  dsFilter.Post;
  actEnableFilter.Checked := True;
  s := GenerateFilter;
  dsOrdersTP.ParamByName('Filter').Value := s;
  dsOrdersTP.CloseOpen(True);
end;

procedure TOrdersTPForm.N2Click(Sender: TObject);
var
  s : string;
begin
  if not dsFilter.Active then
    dsFilter.Open;
  dsFilter.EmptyTable;
  dsFilter.Insert;
  dsFilter['DT'] := 4;
  dsFilter['DS'] := now;
  dsFilter['DE'] := now;
  dsFilter.Post;
  actEnableFilter.Checked := True;
  s := GenerateFilter;
  dsOrdersTP.ParamByName('Filter').Value := s;
  dsOrdersTP.CloseOpen(True);
end;

procedure TOrdersTPForm.dbgOrdersTPKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    actOTPEdit.Execute;
end;

procedure TOrdersTPForm.dsFilterNewRecord(DataSet: TDataSet);
begin
  DataSet['inversion'] := False; // инверсия фильтра т.е. добавляем not
  DataSet['next_condition'] := 0; // следующее условие AND/OR
end;

procedure TOrdersTPForm.dbgOrdersTPColumns9GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not Params.Text.IsEmpty then
    Params.Text := StringReplace(Params.Text, #13#10, '. ', [rfReplaceAll]);
end;

procedure TOrdersTPForm.dbgOrdersTPDataGroupGetRowText(Sender: TCustomDBGridEh; GroupDataTreeNode: TGroupDataTreeNodeEh;
  var GroupRowText: string);
var
  s: string;
  i: Integer;
begin
  s := GroupDataTreeNode.DisplayValue;
  i := Pos(s, GroupRowText);
  GroupRowText := Copy(GroupRowText, i, Length(GroupRowText));
end;

procedure TOrdersTPForm.dbgOrdersTPDblClick(Sender: TObject);
begin
  actOTPEdit.Execute;
end;

procedure TOrdersTPForm.actOTPEditExecute(Sender: TObject);
var
  bm: TBookmark;
begin
  if dsOrdersTP.FieldByName('otp_id').IsNull then
    Exit;
  if CreateOrderTP(dsOrdersTP.FieldByName('otp_id').AsInteger) > -1 then
  begin
    bm := dsOrdersTP.GetBookmark;
    dsOrdersTP.CloseOpen(True);
    dsOrdersTP.GotoBookmark(bm);
  end;
end;

procedure TOrdersTPForm.N3Click(Sender: TObject);
var
  s : string;
begin
  if not dsFilter.Active then
    dsFilter.Open;
  dsFilter.EmptyTable;
  dsFilter.Insert;
  dsFilter['DT'] := 4;
  dsFilter['DS'] := now-1;
  dsFilter['DE'] := now;
  dsFilter.Post;
  actEnableFilter.Checked := True;
  s := GenerateFilter;
  dsOrdersTP.ParamByName('Filter').Value := s;
  dsOrdersTP.CloseOpen(True);
end;

procedure TOrdersTPForm.N4Click(Sender: TObject);
var
  s : string;
begin
  if not dsFilter.Active then
    dsFilter.Open;
  dsFilter.EmptyTable;
  dsFilter.Insert;
  dsFilter['DT'] := 0;
  dsFilter['DS'] := (now - 1);
  dsFilter['DE'] := (now - 1);
  dsFilter.Post;
  actEnableFilter.Checked := True;
  s := GenerateFilter;
  dsOrdersTP.ParamByName('Filter').Value := s;
  dsOrdersTP.CloseOpen(True);
end;

procedure TOrdersTPForm.actPrintDocExecute(Sender: TObject);
var
  bm: TBookmark;
begin
  dsOrdersTP.DisableControls;
  bm := dsOrdersTP.GetBookmark;
  ShowReport(rsReportExtOrders);
  dsOrdersTP.GotoBookmark(bm);
  dsOrdersTP.EnableControls;
end;

procedure TOrdersTPForm.actPrintOrderExecute(Sender: TObject);
begin
  PrintOrderReport;
end;

procedure TOrdersTPForm.frxDBOrdersTPCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  if dbgOrdersTP.SelectedRows.Count > 0 then
    Eof := (fSelectedRow > dbgOrdersTP.SelectedRows.Count)
end;

procedure TOrdersTPForm.frxDBOrdersTPFirst(Sender: TObject);
begin
  if dbgOrdersTP.SelectedRows.Count > 0 then
  begin
    fSelectedRow := 1;
    dbgOrdersTP.DataSource.DataSet.Bookmark := dbgOrdersTP.SelectedRows[0];
  end
end;

procedure TOrdersTPForm.frxDBOrdersTPNext(Sender: TObject);
begin
  if (dbgOrdersTP.SelectedRows.Count > 0) then
  begin
    if fSelectedRow < dbgOrdersTP.SelectedRows.Count then
      dbgOrdersTP.DataSource.DataSet.Bookmark := dbgOrdersTP.SelectedRows[fSelectedRow];
    inc(fSelectedRow);
  end
end;

procedure TOrdersTPForm.actAddPaymentExecute(Sender: TObject);
var
  dt: TDate;
  sm: Currency;
  notice: string;
  vCanPay: Boolean;
  vSrv: Integer;
  JO: TJsonObject;
  pd_id: Integer;
begin
  if dsOrdersTP.FieldByName('CUSTOMER_ID').IsNull then
    Exit;

  if (not dsOrdersTP.FieldByName('PAY_DATE').IsNull) then
    Exit;

  if ((not dsOrdersTP.FieldByName('O_NAME').IsNull) and
    (dsOrdersTP.FieldByName('O_NAME').AsString.ToUpper.Contains(rsFree.ToUpper))) then
    Exit;

  vCanPay := (dmMain.AllowedAction(rght_Pays_add) or dmMain.AllowedAction(rght_Pays_full) or
    dmMain.AllowedAction(rght_Pays_AddToday));

  if not vCanPay then
    Exit;

  if dsOrdersTP.FieldByName('AMOUNT').IsNull then
    sm := 0
  else
    sm := dsOrdersTP['AMOUNT'];

  dt := Date();
  notice := '';
  vSrv := -1;
  if not dsOrdersTP.FieldByName('OTP_NUMBER').IsNull then
    notice := notice + rsOrderN + dsOrdersTP.FieldByName('OTP_NUMBER').AsString;
  if not dsOrdersTP.FieldByName('FIO').IsNull then
    notice := notice + #13#10 + dsOrdersTP.FieldByName('FIO').AsString;
  if not dsOrdersTP.FieldByName('ADRESS').IsNull then
    notice := notice + #13#10 + dsOrdersTP.FieldByName('ADRESS').AsString;
  if not dsOrdersTP.FieldByName('ADDONS').IsNull then
  begin
    JO := TJsonObject.Parse(dsOrdersTP['ADDONS']) as TJsonObject;
    try
      if JO.Contains('srv') then
      begin
        if not JO['srv'].IsNull then
          vSrv := JO.i['srv'];
      end;
    finally
      JO.Free;
    end;
  end;

  if ReceivePayment(dsOrdersTP['CUSTOMER_ID'], -1, -1, dt, sm, Trim(notice), vSrv, 'OTP') <> -1 then
  begin
    SetOrderPayDate();
    dsOrdersTP.Refresh;
  end;

end;

procedure TOrdersTPForm.actCancelExecute(Sender: TObject);
begin
  CancelOrder();
end;

procedure TOrdersTPForm.actCustomersExecute(Sender: TObject);
var
  grid: TDBGridEh;
  i: Integer;
  b: TBookmark;
  customers: TStringList;
  s: string;
begin
  grid := dbgOrdersTP;

  customers := TStringList.Create;
  customers.Sorted := True;
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

procedure TOrdersTPForm.actEnableFilterExecute(Sender: TObject);
begin
  if srcOrdersTP.DataSet is TpFIBDataSet then
  begin
    actEnableFilter.Checked := not actEnableFilter.Checked;
    dsOrdersTP.ParamByName('Filter').Value := GenerateFilter;
    dsOrdersTP.CloseOpen(True);
  end;
end;

procedure TOrdersTPForm.actGroupExecute(Sender: TObject);
var
  Crsr: TCursor;
begin
  actGroup.Checked := not actGroup.Checked;
  Crsr := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  if actGroup.Checked then
  begin
    srcOrdersTP.DataSet := mtOrdersTP;
    dbgOrdersTP.DataGrouping.Active := True;
    dbgOrdersTP.DataGrouping.GroupPanelVisible := True;
    dbgOrdersTP.DataGrouping.GroupLevels.Clear;
    srcOrdersTP.DataSet.Active := True;
  end
  else
  begin
    srcOrdersTP.DataSet := dsOrdersTP;
    dbgOrdersTP.DataGrouping.GroupLevels.Clear;
    dbgOrdersTP.DataGrouping.Active := False;
    dbgOrdersTP.DataGrouping.GroupPanelVisible := False;
    mtOrdersTP.Active := False;
    dsOrdersTP.Open;
  end;
  Screen.Cursor := Crsr;
end;

procedure TOrdersTPForm.actMakeCopyExecute(Sender: TObject);
var
  ci: TCustomerInfo;
  n, o: Integer;
begin
  if (dsOrdersTP.FieldByName('Otp_Id').IsNull) then
    Exit;

  ci.CUSTOMER_ID := -1;
  o := dsOrdersTP['Otp_Id'];
  n := CreateOrderTPForCustomer(-1, ci, o);
  if n > -1 then
  begin
    FindOrOpenOrder(n);
  end;
end;

procedure TOrdersTPForm.actOTPDelExecute(Sender: TObject);
var
  AR: Boolean;
begin
  if (not dsOrdersTP.Active) or (dsOrdersTP.RecordCount = 0) then
    Exit;

  AR := dmMain.AllowedAction(rght_OrdersTP_del); // Удаление
  if not(AR or FullAccess) then
    Exit;

  if (dsOrdersTP.FieldByName('OTP_NUMBER').IsNull) or
    (MessageDlg(Format(rsDeleteOrder, [dsOrdersTP['OTP_NUMBER']]), mtConfirmation, [mbNo, mbYes], 0) = mrYes) then
    dsOrdersTP.Delete;

end;

procedure TOrdersTPForm.actOTPNewExecute(Sender: TObject);
var
  bm: TBookmark;
begin
  if CreateOrderTP(-1) > -1 then
  begin
    bm := dsOrdersTP.GetBookmark;
    dsOrdersTP.CloseOpen(True);
    dsOrdersTP.GotoBookmark(bm);
  end;
end;

procedure TOrdersTPForm.FormActivate(Sender: TObject);
var
  i: Integer;
  filter: string;
  inFilter: Boolean;
begin
  if FFirstOpen then
  begin
    FFirstOpen := False;
    Exit;
  end;

  if not((dsOrdersTP.Active) and (dsOrdersTP.RecordCount > 0) and (not dsOrdersTP.FieldByName('OTP_ID').IsNull)) then
    dsOrdersTP.CloseOpen(True)
  else
  begin
    inFilter := dsOrdersTP.Filtered;
    filter := dsOrdersTP.filter;
    i := dsOrdersTP['OTP_ID'];
    dsOrdersTP.CloseOpen(True);
    if inFilter then
    begin
      dsOrdersTP.filter := filter;
      dsOrdersTP.Filtered := inFilter;
      if ((dbgOrdersTP.SearchPanel.Visible) and (dbgOrdersTP.SearchPanel.SearchingText <> '')) then
        dbgOrdersTP.SearchPanel.ApplySearchFilter;
    end;
    dsOrdersTP.Locate('OTP_ID', i, []);
  end;
end;

procedure TOrdersTPForm.PrintOrderReport;
var
  vi: Integer;
  Order_id: Integer;
  JO: TJsonObject;
  json: string;
  FReport: Integer;
begin
  if (dsOrdersTP.RecordCount = 0) or dsOrdersTP.FieldByName('O_Charfield').IsNull then
    Exit;

  json := dsOrdersTP.FieldByName('O_Charfield').AsString.Trim;
  FReport := -1;
  Order_id := dsOrdersTP['OTP_ID'];

  JO := TJsonObject.Parse(json) as TJsonObject;
  try
    if JO.Contains('report') then
    begin
      if not JO['report'].IsNull then
        FReport := JO.i['report'];
    end;
  finally
    JO.Free;
  end;

  if (FReport > -1) and (Order_id > -1) then
  begin
    with TReportChild.Create(Application) do
    begin
      REPORT_ID := FReport;
      LoadReportBody;
      vi := GetVariableID('ORDER_ID');
      if vi > 0 then
      begin
        SetVariable('ORDER_ID', Order_id);
      end;
      ShowReportBody;
      Show;
    end;
  end;
end;

procedure TOrdersTPForm.SetOrderPayDate();
var
  fq: TpFIBQuery;
begin
  if dsOrdersTP.FieldByName('Otp_Id').IsNull then
    Exit;

  fq := TpFIBQuery.Create(Self);
  try
    fq.Database := dmMain.dbTV;
    fq.Transaction := dmMain.trWriteQ;
    fq.sql.Text := 'update Orders_Tp set Pay_Date = current_date where Otp_Id = :Otp_Id and Pay_Date is null';
    fq.ParamByName('Otp_Id').AsInteger := dsOrdersTP['Otp_Id'];
    fq.Transaction.StartTransaction;
    fq.ExecQuery;
    fq.Transaction.Commit;
  finally
    fq.Free;
  end;
end;

procedure TOrdersTPForm.FindOrOpenOrder(const OrderID: Integer);
var
  Finded: Boolean;
begin
  if OrderID = -1 then
    Exit;

  Finded := False;
  if dsOrdersTP.Active then
  begin
    Finded := dsOrdersTP.Locate('Otp_Id', OrderID, []);
    if not Finded then
    begin
      dsOrdersTP.CloseOpen(True);
      Finded := dsOrdersTP.Locate('Otp_Id', OrderID, []);
    end;
  end;

  if not Finded then
  begin
    if dsOrdersTP.Active then
      dsOrdersTP.Close;

    dsOrdersTP.ParamByName('filter').AsString := ' o.Otp_Id = ' + IntToStr(OrderID);
    dsOrdersTP.Open;
  end;
end;

procedure TOrdersTPForm.CancelOrder();
var
  fq: TpFIBQuery;
  RESON: String;
begin
  if dsOrdersTP.FieldByName('Otp_Id').IsNull then
    Exit;

  RESON := '';
  if (not ShowText(RESON, rsReson, '')) then
    Exit;

  if (RESON.IsEmpty) then
    Exit;

  fq := TpFIBQuery.Create(Self);
  try
    fq.Database := dmMain.dbTV;
    fq.Transaction := dmMain.trWriteQ;
    fq.sql.Text :=
      'update Orders_Tp set CANCEL_TIME = localtimestamp, CANCEL_RESON = :RESON where Otp_Id = :Otp_Id and CANCEL_TIME is null';
    fq.ParamByName('Otp_Id').AsInteger := dsOrdersTP['Otp_Id'];
    fq.ParamByName('RESON').AsString := RESON;
    fq.Transaction.StartTransaction;
    fq.ExecQuery;
    fq.Transaction.Commit;
  finally
    fq.Free;
  end;
  dsOrdersTP.Refresh;
end;

function TOrdersTPForm.GenerateFilter: string;

  function RecordToFilter: string;
  var
    tmpSQL: string;
    s: string;
  begin
    tmpSQL := '';

    if (not dsFilter.FieldByName('DT').IsNull) then
    begin
      if (dsFilter['DT'] <> 4) then begin
        case dsFilter['DT'] of
          1:
            s := 'o.DATE_FROM';
          2:
            s := 'o.DATE_TO';
        else
          s := 'o.Otp_Date'
        end;
        if (not dsFilter.FieldByName('DS').IsNull) then
        begin
          if (dsFilter.FieldByName('DE').IsNull) then
            tmpSQL := Format('( %s = ''%s'') ', [s, FormatDateTime('yyyy-mm-dd', dsFilter['DS'])])
          else
            tmpSQL := Format('( %s between ''%s'' and ''%s'') ', [s, FormatDateTime('yyyy-mm-dd', dsFilter['DS']),
              FormatDateTime('yyyy-mm-dd', dsFilter['DE'])])
        end
        else
        begin
          if (not dsFilter.FieldByName('DE').IsNull) then
            tmpSQL := Format('( %s = ''%s'') ', [s, FormatDateTime('yyyy-mm-dd', dsFilter['DE'])])
        end;
      end
      else begin
          if (not dsFilter.FieldByName('DE').IsNull) then
            tmpSQL := Format(' (''%s'' between %s and %s) ', [FormatDateTime('yyyy-mm-dd', dsFilter['DS']),
              'o.DATE_FROM', 'o.DATE_TO'])
          else
            tmpSQL := Format(' (''%s'' between %s and %s) ', [FormatDateTime('yyyy-mm-dd', now),
              'o.DATE_FROM', 'o.DATE_TO'])
      end;
    end;

    if (not dsFilter.FieldByName('ORDER_TYPE').IsNull) then
    begin
      if not tmpSQL.IsEmpty then
        tmpSQL := tmpSQL + ' and ';

      tmpSQL := tmpSQL + Format('( o.Ottp_Type= %s) ', [dsFilter.FieldByName('ORDER_TYPE').AsString]);
    end;

    if (not dsFilter.FieldByName('INCL').IsNull) then
    begin
      s := dsFilter['INCL'];
      s := '%' + s.Trim(['%']) + '%';
      if not tmpSQL.IsEmpty then
        tmpSQL := tmpSQL + ' and ';
      tmpSQL := tmpSQL + Format('( upper(o.NOTICE) like upper(''%s'')) ', [s]);
    end;

    if (tmpSQL <> '') then
    begin
      Result := TrimAnd(tmpSQL);
      if dsFilter['inversion'] then
        Result := Format(' NOT (%s)', [Result]);
    end
    else
      Result := '';

    if FViewTodayOnly then  begin
      tmpSQL := ' (o.ADDED_ON >= current_date) and (o.ADDED_ON < dateadd(day, 1, current_date)) ';
      if not Result.IsEmpty then
        Result := tmpSQL + ' and (' + Result + ')'
      else
        Result := tmpSQL;
    end;
  end;

var
  whereStr: string;
  default: string;
begin
  Result := '';
  whereStr := '';

  if (dsFilter.RecordCount = 0) or (not actEnableFilter.Checked) then
    Exit;
  srcOrdersTP.DataSet.DisableControls;

  try
    dsFilter.First;

    whereStr := '';
    while not dsFilter.Eof do
    begin
      default := RecordToFilter;
      if not default.IsEmpty then
      begin
        whereStr := whereStr + ' ( ' + default +' ) ';
        // проверим, если ограничение одной записи и фильтр по квартире. то скинем ограничение
        dsFilter.next;
        if not dsFilter.Eof then
          if dsFilter['next_condition'] = 0 then
            whereStr := whereStr + ' OR '
          else
            whereStr := whereStr + ' AND '
      end;
    end;
  except
    whereStr := '';
    ShowMessage(rsErrorSetFilter);
  end;

  if not whereStr.IsEmpty then
    Result := whereStr
  else
    Result := ' o.Otp_Date = current_date ';

  srcOrdersTP.DataSet.EnableControls;
end;

procedure TOrdersTPForm.miSetNewFilterNewClick(Sender: TObject);
begin
  if not(srcOrdersTP.DataSet is TpFIBDataSet) then
    Exit;

  with dsFilter do
  begin
    DisableControls;
    if not dsFilter.Active then
      dsFilter.Open;
    EmptyTable;
    Insert;
    EnableControls;
  end;
  actSetFilterExecute(Sender);
end;

{
function TOrdersTPForm.GetPayDocForLTV: Integer;
var
  s: string;
  fq: TpFIBQuery;
begin
  Result := -1;


  s := dmMain.GetCompanyValue('NAME');
  if not s.Contains('ЛТВ') then
    Exit;

  // возвращаем документ с источником Банк РЕКЛАМА для платежей по рекламе
  fq := TpFIBQuery.Create(Self);
  try
    fq.Database := dmMain.dbTV;
    fq.Transaction := dmMain.trWriteQ;
    fq.sql.Text := 'select Pay_Doc_Id from Get_Pay_Doc(720148, null, null)'; // 720148 Банк РЕКЛАМА
    fq.Transaction.StartTransaction;
    fq.ExecQuery;
    if not fq.FN('Pay_Doc_Id').IsNull then
      Result := fq.FN('Pay_Doc_Id').AsInteger;
    fq.Transaction.Commit;
  finally
    fq.Free;
  end;
end;
}
end.

