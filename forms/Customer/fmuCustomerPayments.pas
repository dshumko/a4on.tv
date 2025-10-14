unit fmuCustomerPayments;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.Types,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Buttons,
  Vcl.ExtCtrls,
  ToolCtrlsEh, GridsEh, DBGridEh, AtrPages, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL, DBGridEhGrouping,
  DynVarsEh,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, Vcl.Menus;

type
  TapgCustomerPayments = class(TA4onPage)
    dbgCustPayment: TDBGridEh;
    dsPayment: TpFIBDataSet;
    srcPayment: TDataSource;
    ActListCustomers: TActionList;
    ActAddPayment: TAction;
    actPrepay: TAction;
    pnlButtons: TPanel;
    btnDel: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    btnCheck: TSpeedButton;
    actCheckUrl: TAction;
    pmDblClick: TPopupMenu;
    miPayDoc: TMenuItem;
    miRequest: TMenuItem;
    pmPayment: TPopupMenu;
    actMarkReq: TAction;
    miMarkReq: TMenuItem;
    procedure ActAddPaymentExecute(Sender: TObject);
    procedure actPrepayExecute(Sender: TObject);
    procedure dbgCustPaymentDblClick(Sender: TObject);
    procedure dbgCustPaymentGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure actCheckUrlExecute(Sender: TObject);
    procedure miRequestClick(Sender: TObject);
    procedure miPayDocClick(Sender: TObject);
    procedure actMarkReqExecute(Sender: TObject);
    procedure srcPaymentDataChange(Sender: TObject; Field: TField);
    procedure dbgCustPaymentSortMarkingChanged(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure dbgCustPaymentApplyFilter(Sender: TObject);
    procedure dbgCustPaymentSearchPanelGetHighlightStrings(Grid: TCustomDBGridEh; Column: TColumnEh;
      var Strings: TStringDynArray);
    procedure dbgCustPaymentSearchPanelCheckCellHitSearch(Grid: TCustomDBGridEh; Column: TColumnEh;
      var Accept: Boolean);
    procedure dbgCustPaymentSearchPanelSearchEditChange(Grid: TCustomDBGridEh;
      SearchEdit: TDBGridSearchPanelTextEditEh);
  private
    FFine: Boolean;
    FFullAccess: Boolean;
    // FTodayOnly: boolean;
    // FOnlyTheir: boolean;
    FSavedID: Integer;
    FCheckUrl: string;
    FSearchStrArr: TStringDynArray;
    procedure EnableControls;
    procedure OpenRequest;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure FindData(const Data: string); override;
    procedure CloseData; override;
    procedure SavePosition; override;
    procedure GotoSavedPosition; override;
    class function GetPageName: string; override;
  end;

implementation

uses
  System.StrUtils, DM, pFIBQuery, PaymentForma, PaymentDocForma, MAIN, HtmlForma, RequestForma;

{$R *.dfm}

class function TapgCustomerPayments.GetPageName: string;
begin
  Result := rsPayments;
end;

procedure TapgCustomerPayments.SavePosition;
begin
  FSavedID := -1;
  if (dsPayment.RecordCount > 0) and (not dsPayment.FieldByName('PAYMENT_ID').IsNull) then
    FSavedID := dsPayment['PAYMENT_ID'];
end;

procedure TapgCustomerPayments.srcPaymentDataChange(Sender: TObject; Field: TField);
begin
  if Assigned(Field) and not(Field.Name = 'RQ_ID') then
  begin
    if (dsPayment.State = dsEdit) then
    begin
      dsPayment.Post;
      dbgCustPayment.AllowedOperations := [];
      dbgCustPayment.ReadOnly := True;
    end;
  end;

  btnDel.Visible := FFullAccess and ((not dsPayment.FieldByName('PT').IsNull) and (dsPayment['PT'] = 0));
end;

procedure TapgCustomerPayments.GotoSavedPosition;
begin
  if FSavedID > -1 then
    dsPayment.Locate('PAYMENT_ID', FSavedID, []);
end;

procedure TapgCustomerPayments.InitForm;
var
  bFull: Boolean;
  bAdd: Boolean;
  vShowPaySRV: Boolean;
  vAsBalance: Boolean;
  vShowLCPS: Boolean;
  i: Integer;
  s: String;
begin
  vAsBalance := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1');
  vShowLCPS := (dmMain.GetSettingsValue('SHOW_LCPS') = '1');
  bFull := dmMain.AllowedAction(rght_Pays_full); // Полный доступ к платежам
  bAdd := dmMain.AllowedAction(rght_Pays_add); // Добавление платежей

  FFullAccess := bFull or dmMain.AllowedAction(rght_Customer_full);

  ActAddPayment.Enabled := FFullAccess or bAdd or dmMain.AllowedAction(rght_Pays_AddToday);
  actPrepay.Enabled := FFullAccess or dmMain.AllowedAction(rght_Pays_AddPromis);
  pnlButtons.Visible := ActAddPayment.Enabled or actPrepay.Enabled;

  s := dmMain.GetCompanyValue('NAME');
  actMarkReq.Visible := s.Contains('ЛТВ');
  actMarkReq.Enabled := FFullAccess or bAdd or dmMain.AllowedAction(rght_Request_Full) or
    dmMain.AllowedAction(rght_Request_Close);

  if (dmMain.GetSettingsValue('SHOWALLCUSTPAYS') <> '1') then
  begin
    {
      не удобно работать. отключил тут. оставил только в плат. документах

      FTodayOnly := dmMain.AllowedAction(rght_Pays_AddToday);
      FOnlyTheir := dmMain.AllowedAction(rght_Pays_TheirAdd);

      if (FTodayOnly) then
      dsPayment.SQLs.SelectSQL.Add(' and P.PAY_DATE = current_date ');

      if (FOnlyTheir) then
      dsPayment.SQLs.SelectSQL.Add(' and p.Added_By = current_user ');
    }
  end;

  dsPayment.SQLs.SelectSQL.Add(' order by P.PAY_DATE desc ');

  dsPayment.DataSource := FDataSource;

  // скроем не нужные столбцы
  FFine := (dmMain.GetSettingsValue('SHOW_FINE') = '1'); // пеня
  vShowPaySRV := (dmMain.GetSettingsValue('PAYMENT_SRV') = '1'); // услуга
  for i := 0 to dbgCustPayment.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbgCustPayment.Columns[i].FieldName) = 'FINE_SUM') then
      dbgCustPayment.Columns[i].Visible := FFine;
    if (AnsiUpperCase(dbgCustPayment.Columns[i].FieldName) = 'PAID') then
      dbgCustPayment.Columns[i].Visible := FFine;
    if (AnsiUpperCase(dbgCustPayment.Columns[i].FieldName) = 'NAME') then
      dbgCustPayment.Columns[i].Visible := vShowPaySRV;

    if (AnsiUpperCase(dbgCustPayment.Columns[i].FieldName) = 'BAL_SAVE') then
      dbgCustPayment.Columns[i].Visible := vAsBalance;
    if (AnsiUpperCase(dbgCustPayment.Columns[i].FieldName) = 'DEBT_SAVE') then
      dbgCustPayment.Columns[i].Visible := not vAsBalance;
    if (AnsiUpperCase(dbgCustPayment.Columns[i].FieldName) = 'LCPS') then
    begin
      dbgCustPayment.Columns[i].Visible := vShowLCPS;
      dbgCustPayment.Columns[i].Title.Caption := rsLCPaySum;
    end;
  end;
  FCheckUrl := dmMain.GetSettingsValue('PAY_CHECK_URL');
  actCheckUrl.Visible := (FCheckUrl <> '');
end;

procedure TapgCustomerPayments.miPayDocClick(Sender: TObject);
begin
  if dsPayment.FieldByName('pay_doc_id').IsNull then
    exit;
  CreatePayDoc(dsPayment['pay_doc_id'], dsPayment['PAYMENT_ID']);
end;

procedure TapgCustomerPayments.miRequestClick(Sender: TObject);
begin
  OpenRequest;
end;

procedure TapgCustomerPayments.OpenData;
begin
  if dsPayment.Active then
    dsPayment.Close;
  dsPayment.OrderClause := GetOrderClause(dbgCustPayment);
  dsPayment.Open;
end;

procedure TapgCustomerPayments.EnableControls;
begin
  //
end;

procedure TapgCustomerPayments.ActAddPaymentExecute(Sender: TObject);
var
  dt: TDate;
  sm: Currency;
begin
  dt := NOW;
  sm := 0;
  if ReceivePayment(FDataSource.DataSet['CUSTOMER_ID'], -1, -1, dt, sm) <> -1 then
  begin
    if dsPayment.Active then
      dsPayment.CloseOpen(True);
    EnableControls;
    UpdatePage;
  end;
end;

procedure TapgCustomerPayments.actCheckUrlExecute(Sender: TObject);
var
  URL: string;
begin
  // параметры <customer_id> <unp>
  // GetHtml(const Url: string = 'localhost'; const User: string = ''; const Pswd: string = '';
  // const Data: string = ''; const ExExit: Boolean = False; const Title: string = '')
  if FDataSource.DataSet.FieldByName('customer_id').IsNull then
    exit;

  URL := FCheckUrl;
  URL := ReplaceStr(URL, '<customer_id>', FDataSource.DataSet.FieldByName('customer_id').AsInteger.ToString);
  if not FDataSource.DataSet.FieldByName('JUR_INN').IsNull then
    URL := ReplaceStr(URL, '<unp>', FDataSource.DataSet.FieldByName('JUR_INN').AsString)
  else
    URL := ReplaceStr(URL, '<unp>', '');
  ShowHtml(URL, '', rsPayCheck);
end;

procedure TapgCustomerPayments.actMarkReqExecute(Sender: TObject);
var
  rs: string;
  i: Integer;
  s: string;
begin
  if (dsPayment.RecordCount = 0) or (dsPayment['PT'] = 0) then
    exit;

  if not(dsPayment.FieldByName('RQ_ID').IsNull) then
    rs := dsPayment['RQ_ID'];

  rs := InputBox('Укажите № заявки', '№ Заявки или пустое(для очистки)', rs);
  if (rs = '') then
  begin
    if not(dsPayment.FieldByName('RQ_ID').IsNull) then
      s := 'null';
  end
  else
  begin
    if TryStrToInt(rs, i) then
    begin
      if (dsPayment.FieldByName('RQ_ID').IsNull or dsPayment['RQ_ID'] <> i) then
        s := rs;
    end;
  end;

  if not s.IsEmpty then
  begin
    with TpFIBQuery.Create(Self) do
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        sql.text := 'update payment set Rq_Id = ' + s + ' where Payment_Id = :PAYMENT_ID';
        ParamByName('PAYMENT_ID').Value := dsPayment['PAYMENT_ID'];
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
        Close;
      finally
        free;
      end;
    dsPayment.Refresh;
  end;
  // dbgCustPayment.AllowedOperations := [alopUpdateEh];
  // dbgCustPayment.ReadOnly := False;
  // dsPayment.Edit;
end;

procedure TapgCustomerPayments.actPrepayExecute(Sender: TObject);
var
  s: string;
  v: extended;
begin
  s := '0';
  if InputQuery(rsPrepay, rsAmount, s) then
  begin
    if TryStrToFloat(s, v) then
    begin
      with TpFIBQuery.Create(Self) do
        try
          Database := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          sql.text := 'execute procedure Set_Prepay(:Customer_Id,:Prepay_Sum)';
          ParamByName('Prepay_Sum').Value := v;
          ParamByName('Customer_Id').Value := FDataSource.DataSet.FieldByName('customer_id').AsInteger;
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
          Close;
          FDataSource.DataSet.Refresh;
          dsPayment.CloseOpen(True);
        finally
          free;
        end;
    end;
  end;
end;

procedure TapgCustomerPayments.btnDelClick(Sender: TObject);
begin
  if (not FFullAccess) then
    exit;

  // удалим обещанный
  if (not dsPayment.FieldByName('PT').IsNull) and (dsPayment['PT'] = 0) and
    (not dsPayment.FieldByName('VIEW_SUM').IsNull) then
  begin
    if MessageBoxW(Handle, PWideChar(WideFormat('Удалить обещанный платеж на сумму ' + dsPayment.FieldByName('VIEW_SUM')
      .AsString, [])), 'Удалить обещанный платеж', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      with TpFIBQuery.Create(Self) do
      begin
        try
          Database := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          sql.text :=
            ' execute block (PAYMENT_ID D_Integer = :PAYMENT_ID, CUSTOMER_ID D_Integer = :CUSTOMER_ID) as begin' +
            ' delete from PREPAY_DETAIL d where d.Ppd_Id = :PAYMENT_ID; ' +
            ' update CUSTOMER set PREPAY = 0, prepay_time = null where CUSTOMER_ID = :Customer_Id; end';
          ParamByName('PAYMENT_ID').Value := dsPayment['PAYMENT_ID'];
          ParamByName('Customer_Id').Value := dsPayment['CUSTOMER_ID'];
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
          Close;
        finally
          free;
        end;
      end;
      dsPayment.DataSource.DataSet.Refresh;
      dsPayment.CloseOpen(True);
    end;
  end;
end;

procedure TapgCustomerPayments.CloseData;
begin
  dsPayment.Close;
end;

procedure TapgCustomerPayments.dbgCustPaymentApplyFilter(Sender: TObject);
begin
  // (Sender as TDBGridEh).SumList.RecalcAll;
end;

procedure TapgCustomerPayments.dbgCustPaymentDblClick(Sender: TObject);
var
  ScrPt, GrdPt: TPoint;
  Cell: TGridCoord;
  s: String;
begin
  ScrPt := Mouse.CursorPos;
  GrdPt := dbgCustPayment.ScreenToClient(ScrPt);
  Cell := dbgCustPayment.MouseCoord(GrdPt.X, GrdPt.Y);
  s := UpperCase(dbgCustPayment.Fields[Cell.X - 1].FieldName);
  if (s = 'NOTICE') then
    pmDblClick.Popup(ScrPt.X, ScrPt.Y)
  else if (s = 'RQ_ID') then
  begin
    if (dsPayment.State = dsBrowse) then
      OpenRequest;
  end
  else
  begin
    if dsPayment.FieldByName('pay_doc_id').IsNull then
      exit;
    CreatePayDoc(dsPayment['pay_doc_id'], dsPayment['PAYMENT_ID']);
  end;
end;

procedure TapgCustomerPayments.dbgCustPaymentGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (not dsPayment.FieldByName('PT').IsNull) and (dsPayment['PT'] = 0) then
    AFont.Color := clRed // обещанный обозначим красным
  else
    AFont.Color := clBlack;

  if FFine then
  begin
    if (AnsiCompareStr(AnsiUpperCase(Column.FieldName), 'FINE_SUM') <> 0) then
      exit;
    if (Column.Field.AsFloat = 0) then
      AFont.Color := Background // скроем 0 в пене
    else
      AFont.Color := clBlack;
    if (gdFocused in State) or (gdSelected in State) then
      AFont.Color := clBlack;
  end;
end;

procedure TapgCustomerPayments.dbgCustPaymentSearchPanelCheckCellHitSearch(Grid: TCustomDBGridEh; Column: TColumnEh;
  var Accept: Boolean);
var
  s, SubStr: String;
  Pos: Integer;
  i: Integer;
begin
  s := Column.DisplayText;
  if not Grid.SearchPanel.CaseSensitive then
    s := NlsUpperCase(s);
  for i := 0 to Length(FSearchStrArr) - 1 do
  begin
    SubStr := FSearchStrArr[i];
    if not Grid.SearchPanel.CaseSensitive then
      SubStr := NlsUpperCase(SubStr);
    Pos := PosEx(SubStr, s);
    if Pos > 0 then
    begin
      Accept := True;
      Break;
    end
    else
      Accept := False;
  end;
end;

procedure TapgCustomerPayments.dbgCustPaymentSearchPanelGetHighlightStrings(Grid: TCustomDBGridEh; Column: TColumnEh;
  var Strings: TStringDynArray);
begin
  Strings := FSearchStrArr;
end;

procedure TapgCustomerPayments.dbgCustPaymentSearchPanelSearchEditChange(Grid: TCustomDBGridEh;
  SearchEdit: TDBGridSearchPanelTextEditEh);
begin
  FSearchStrArr := SplitString(SearchEdit.text, ' ');
end;

procedure TapgCustomerPayments.dbgCustPaymentSortMarkingChanged(Sender: TObject);
var
  cr: TCursor;
  s: string;
  Grid: TCustomDBGridEh;
  id, i, j: Integer;
  FIBDS: TpFIBDataSet;
  beOpened: Boolean;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Grid := TCustomDBGridEh(Sender);
  FIBDS := Grid.DataSource.DataSet as TpFIBDataSet;
  id := -1;
  if Sender is TCustomDBGridEh then
  begin
    beOpened := FIBDS.Active;
    if beOpened then
    begin
      if not FIBDS.FieldByName('PAYMENT_ID').IsNull then
        id := FIBDS.FieldByName('PAYMENT_ID').AsInteger;
      FIBDS.Close;
    end;

    j := Grid.SortMarkedColumns.Count;
    for i := 0 to pred(j) do
    begin
      s := s + Grid.SortMarkedColumns[i].FieldName;
      // s := s + ' COLLATE UNICODE_CI_AI ';
      if Grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
        s := s + ' desc';
      if i <> pred(j) then
        s := s + ', ';
    end;
    if s = 'PAY_DATE' then
      s := s + ', ADDED_ON'
    else if s = 'PAY_DATE desc' then
      s := s + ', ADDED_ON desc';

    FIBDS.OrderClause := s;
    if beOpened then
    begin
      FIBDS.Open;
      if id <> -1 then
        FIBDS.Locate('PAYMENT_ID', id, []);
    end;
  end;
  Screen.Cursor := cr;
end;

procedure TapgCustomerPayments.OpenRequest;
var
  aRequest: Integer;
  aCustomer: Integer;
  aMode: Byte;
Begin
  if dsPayment.FieldByName('PAYMENT_ID').IsNull then
    exit;

  // ищем заявку по номеру если есть, если нет то будем искать по номеру квитанции = номеру платежа

  aRequest := -1;
  if not dsPayment.FieldByName('RQ_ID').IsNull then
  begin
    aRequest := dsPayment.FieldByName('RQ_ID').AsInteger;
  end
  else
  begin
    with TpFIBQuery.Create(Self) do
    begin
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        sql.text := 'select r.RQ_ID from request r where r.RECEIPT = :RECEIPT';
        ParamByName('RECEIPT').Value := dsPayment.FieldByName('PAYMENT_ID').AsString;
        Transaction.StartTransaction;
        ExecQuery;
        if not EOF then
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
    aCustomer := dsPayment.FieldByName('CUSTOMER_ID').AsInteger;
    aMode := 1;
    ReguestExecute(aRequest, aCustomer, aMode);
  end;
end;

procedure TapgCustomerPayments.FindData(const Data: string);
var
  f, v: string;
  i: Integer;
begin
  //
  i := Pos('=', Data);
  f := Copy(Data, 1, i - 1);
  v := Copy(Data, i + 1, Length(Data));
  dsPayment.Locate(f, v, []);
end;

end.
