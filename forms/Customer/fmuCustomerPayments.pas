unit fmuCustomerPayments;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Buttons,
  Vcl.ExtCtrls,
  ToolCtrlsEh, GridsEh, DBGridEh, AtrPages, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL, DBGridEhGrouping,
  DynVarsEh,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet;

type
  TapgCustomerPayments = class(TA4onPage)
    dbgCustPayment: TDBGridEh;
    dsPayment: TpFIBDataSet;
    srcPayment: TDataSource;
    ActListCustomers: TActionList;
    ActAddPayment: TAction;
    actPrepay: TAction;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    btnCheck: TSpeedButton;
    actCheckUrl: TAction;
    procedure ActAddPaymentExecute(Sender: TObject);
    procedure actPrepayExecute(Sender: TObject);
    procedure dbgCustPaymentDblClick(Sender: TObject);
    procedure dbgCustPaymentGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure actCheckUrlExecute(Sender: TObject);
  private
    FFine: boolean;
    // FTodayOnly: boolean;
    // FOnlyTheir: boolean;
    FSavedID: Integer;
    FCheckUrl: string;
    procedure EnableControls;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    procedure SavePosition; override;
    procedure GotoSavedPosition; override;
    class function GetPageName: string; override;
  end;

implementation

uses
  System.StrUtils, DM, pFIBQuery, PaymentForma, PaymentDocForma, MAIN, HtmlForma;

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

procedure TapgCustomerPayments.GotoSavedPosition;
begin
  if FSavedID > -1 then
    dsPayment.Locate('PAYMENT_ID', FSavedID, []);
end;

procedure TapgCustomerPayments.InitForm;
var
  bFull: boolean;
  bAdd: boolean;
  vShowPaySRV: boolean;
  vAsBalance: boolean;
  i: Integer;
begin
  vAsBalance := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1');
  bFull := dmMain.AllowedAction(rght_Pays_full); // Полный доступ к платежам
  bAdd := dmMain.AllowedAction(rght_Pays_add); // Добавление платежей

  ActAddPayment.Enabled := bFull or bAdd or dmMain.AllowedAction(rght_Pays_AddToday);
  actPrepay.Enabled := bFull or dmMain.AllowedAction(rght_Pays_AddPromis);
  pnlButtons.Visible := ActAddPayment.Enabled or actPrepay.Enabled;

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
  end;
  FCheckUrl := dmMain.GetSettingsValue('PAY_CHECK_URL');
  actCheckUrl.Visible := (FCheckUrl <> '');
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
      dsPayment.CloseOpen(true);
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
  //  const Data: string = ''; const ExExit: Boolean = False; const Title: string = '')
  if FDataSource.DataSet.FieldByName('customer_id').IsNull
  then
    Exit;

  URL := FCheckUrl;
  URL := ReplaceStr(URL, '<customer_id>', FDataSource.DataSet.FieldByName('customer_id').AsInteger.ToString);
  if not FDataSource.DataSet.FieldByName('JUR_INN').IsNull
  then
    URL := ReplaceStr(URL, '<unp>', FDataSource.DataSet.FieldByName('JUR_INN').AsString)
  else
    URL := ReplaceStr(URL, '<unp>', '');
  ShowHtml(URL, '', rsPayCheck);
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
          dsPayment.CloseOpen(true);
        finally
          free;
        end;
    end;
  end;
end;

procedure TapgCustomerPayments.CloseData;
begin
  dsPayment.Close;
end;

procedure TapgCustomerPayments.dbgCustPaymentDblClick(Sender: TObject);
begin
  if dsPayment.FieldByName('pay_doc_id').IsNull then
    exit;
  CreatePayDoc(dsPayment['pay_doc_id'], dsPayment['PAYMENT_ID']);
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

end.
