unit PaymentForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.ActnList, Vcl.Menus, Vcl.Dialogs, Vcl.Buttons, Vcl.Forms, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.Controls,
  Vcl.ExtCtrls, Vcl.ComCtrls,
  DBGridEh, DBCtrlsEh, DBLookupEh, FIBQuery, pFIBQuery, FIBDataSet, pFIBDataSet, GridsEh, frxClass, PaymentDocForma, DM,
  CustomerInfoFrame, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, MemTableDataEh, MemTableEh, PrjConst, EhLibVCL,
  PropFilerEh,
  PropStorageEh, BaseForms, A4onTypeUnit, DBGridEhGrouping, DynVarsEh, CnErrorProvider, amSplitter;

type

  TPaymentForm = class(TBaseForm) // подробней http://www.delphinotes.ru/2013/06/vcl-form-and-frame-scale-fix.html
    pnlFine: TPanel;
    dbgFine: TDBGridEh;
    pnlAll: TPanel;
    pnlCustInfo: TPanel;
    Label3: TLabel;
    lblPaySum: TLabel;
    dePaySum: TDBNumberEditEh;
    deDate: TDBDateTimeEditEh;
    pnlSRV: TPanel;
    lPaymentSrv: TLabel;
    luPaymentSrv: TDBLookupComboboxEh;
    dsPaymentSRV: TpFIBDataSet;
    srcPaymentSRV: TDataSource;
    dsPaymentType: TpFIBDataSet;
    srcPaymentType: TDataSource;
    pnlPayDoc: TPanel;
    Label6: TLabel;
    dbluPayDoc: TDBLookupComboboxEh;
    dsPaymentDocs: TpFIBDataSet;
    srcPaymentDocs: TDataSource;
    Panel5: TPanel;
    Label9: TLabel;
    Panel6: TPanel;
    dsFine: TpFIBDataSet;
    srcFine: TDataSource;
    pnlPayType: TPanel;
    lPaymentType: TLabel;
    luPaymentType: TDBLookupComboboxEh;
    srcMemPayment: TDataSource;
    mmoNOTICE: TDBMemoEh;
    qInsertPayment: TpFIBQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    pnlFineSum: TPanel;
    Label19: TLabel;
    Label8: TLabel;
    edTOTALPAY: TDBNumberEditEh;
    edFine: TDBNumberEditEh;
    btnCalcFine: TButton;
    pnlSettings: TPanel;
    cbScanerInput: TCheckBox;
    cbManyPayments: TCheckBox;
    cbRefreshPD: TCheckBox;
    ActionList1: TActionList;
    actManyPayment: TAction;
    actShowPD: TAction;
    actShtrih: TAction;
    actAdd: TAction;
    actPrint: TAction;
    pnlAbonent: TPanel;
    pnlSearchAbonent: TPanel;
    Label1: TLabel;
    edCode: TDBEditEh;
    edLicevoy: TDBEditEh;
    CustomerInfofrm: TCustomerInfoFrm;
    edScaner: TDBEditEh;
    dsMemPayment: TMemTableEh;
    edtExtNumber: TDBEditEh;
    lbl1: TLabel;
    pnlBottom: TPanel;
    pnl1: TPanel;
    bbCancel: TBitBtn;
    bbOk: TBitBtn;
    bbPrint: TBitBtn;
    spl1: TSplitter;
    PropStorageEh: TPropStorageEh;
    CnErrors: TCnErrorProvider;
    lbl2: TLabel;
    dbtxtOnDebt: TDBText;
    pnlPayInput: TPanel;
    Label2: TLabel;
    cbbPayTypeStr: TDBLookupComboboxEh;
    dsPT: TpFIBDataSet;
    srcPT: TDataSource;
    pnlLCPS: TPanel;
    lbl11: TLabel;
    ednLCPS: TDBNumberEditEh;
    spl2: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCalcFineClick(Sender: TObject);
    procedure dsMemPaymentNewRecord(DataSet: TDataSet);
    procedure edCodeEnter(Sender: TObject);
    procedure edLicevoyEnter(Sender: TObject);
    procedure edLicevoyChange(Sender: TObject);
    procedure edCodeChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure deDateExit(Sender: TObject);
    procedure edFineChange(Sender: TObject);
    procedure edScanerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actShtrihExecute(Sender: TObject);
    procedure actManyPaymentExecute(Sender: TObject);
    procedure actShowPDExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure edScanerChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure dbgFineDblClick(Sender: TObject);
    procedure dsMemPaymentCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure luPaymentSrvExit(Sender: TObject);
  private
    { Private declarations }
    FCustomerRecord: TCustomerInfo;
    FCalculateFine: Boolean;
    FBarCodeLen: Integer;
    FReportID: Integer;
    FPayDoc_id: int64;
    FDatePay: TDate; // сохраним дату платежа для многоплатежного ввода
    FSumPay: Currency; // сохраним сумму платежа для многоплатежного ввода
    FPixelsPerInch: Integer;
    FProcessPay: Boolean;
    FCurrentDate: TDate;
    FForForm: string;
    FEnterSecondPress: Boolean;
    FIsLTV: Boolean;
    FRQ_ID: Integer;
    FPayInputShow: Boolean;
    FShowLCPS: Boolean;
    procedure FindCustomer(const lic: string; const code: string; id: Integer);
    function InsertPayment(const NeedPrintCheck: Boolean): Boolean;
    function SelectPayDoc: int64;
    procedure CalculateFine;
    procedure AddMorePayment; // проверка на ввод нескольких платеже
    procedure SetPayDoc_Id(Value: int64);
    procedure SetForForm(Value: String);
    procedure RefreshPayDoc;
    function ParseBarCode: Boolean;
    function PrintCheck: TPrintCheckResult;
    procedure WriteClientHeight(Writer: TWriter);
    procedure WriteClientWidth(Writer: TWriter);
    procedure WriteScaleFix(Writer: TWriter);
    procedure ReadScaleFix(Reader: TReader);
    procedure PrintReportIfNeed(const NeedPrint: Boolean);
    procedure CheckAndSetContract(const CID: Integer);
    procedure CheckRequestPay(const CID: Integer);
    procedure JudgeInput;
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure Loaded; override;
    procedure AfterSave(const PaymentId: Integer);
  public
    { Public declarations }
    property CurrentDate: TDate read FCurrentDate write FCurrentDate;
    property ForForm: String write SetForForm;
    property PayDoc_id: int64 write SetPayDoc_Id;
    property RQ_ID: Integer write FRQ_ID;
  end;

var
  PaymentForm: TPaymentForm;

function ReceivePayment(const aCustomer_id: int64; const aPayDoc_id: int64; const aPayment_id: int64;
  var aPayDate: TDate; var aPaySum: Currency; const aNotice: string = ''; const aSrv: Integer = -1;
  const aFromForm: string = ''; const aRQ_ID: Integer = -1): int64;

implementation

uses
  System.RegularExpressions, IOUtils, System.Math,
  AtrCommon, MAIN, ReportPreview, AtrStrUtils;

type

  TChequeInfo = packed record
    AppHandle: THandle;
    OPER: PWCHAR; // String;
    OPER_PASS: PWCHAR; // String;
    SERVICE: PWCHAR; // String;
    NOTICE: PWCHAR; // String;
    ACCOUNT: PWCHAR; // String;
    FIO: PWCHAR; // String;
    ADDRESS: PWCHAR; // String;
    Notify: PWCHAR; // String;
    Summa: Real;
    Balance: Real;
    Peni: Real;
  end;

  TPrintChequeDialog54FZ = function(ChequeInfo: TChequeInfo): TCheckResult; stdcall;
  TPrintChequeDialogStr = function(ChequeInfo: TChequeInfo): TStrCheckResult; stdcall;

{$R *.dfm}
{$I BaseFormsFrndHackTypes.inc}

function FindOpenPayDoc(): string;
var
  i: Integer;
  s: string;
begin
  s := '';
  for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
    if (A4MainForm.MDIChildren[i] is TPaymentDocForm) then
      s := IntToStr(A4MainForm.MDIChildren[i].Tag) + ',' + s;

  if s = '' then
    s := '-1,';

  Result := Copy(s, 1, Length(s) - 1);
end;

function ReceivePayment(const aCustomer_id: int64; const aPayDoc_id: int64; const aPayment_id: int64;
  var aPayDate: TDate; var aPaySum: Currency; const aNotice: string = ''; const aSrv: Integer = -1;
  const aFromForm: string = ''; const aRQ_ID: Integer = -1): int64;
var
  pf: TPaymentForm;
  OpenedPayDocs: string;
  UserFilter: String;
begin
  Result := -1;
  pf := TPaymentForm.Create(application);
  try
    pf.PayDoc_id := aPayDoc_id;
    pf.RQ_ID := aRQ_ID;
    pf.dsMemPayment.Open;
    pf.dsMemPayment.EmptyTable;
    pf.dsMemPayment.Insert;
    if aPayment_id <> -1 then
      pf.dsMemPayment['Payment_id'] := aPayment_id
    else
      pf.dsMemPayment['PAY_TYPE_STR'] := 'CASH';
    pf.dsMemPayment['Customer_Id'] := aCustomer_id;
    pf.dsMemPayment['Pay_sum'] := aPaySum;
    pf.dsMemPayment['NOTICE'] := aNotice;

    if (aSrv > -1) and (pf.pnlSRV.Visible) then
      pf.dsMemPayment['PAYMENT_SRV'] := aSrv;
    pf.pnlSearchAbonent.Visible := (aCustomer_id = -1);
    OpenedPayDocs := '';
    pf.pnlPayDoc.Visible := aPayDoc_id = -1;
    if pf.pnlPayDoc.Visible then
    begin
      OpenedPayDocs := FindOpenPayDoc();

      UserFilter := ' d.PAY_DOC_ID in (' + OpenedPayDocs + ')';
      if dmMain.AllowedAction(rght_Pays_AddToday) then
        UserFilter := UserFilter + ' and d.Pay_Doc_Date = current_date';

      pf.dsPaymentDocs.ParamByName('filter').Value := UserFilter;

      if dmMain.AllowedAction(rght_Pays_TheirAdd) then
      begin
        UserFilter := ' (exists(select ps.paysource_id from paysource ps ' +
          ' inner join worker w on (upper(w.surname) = upper(ps.paysource_descr)) ' +
          ' where ps.paysource_id = d.Paysource_Id and upper(w.ibname) = upper(current_user)) ' +
          ' or ( d.Added_By = current_user )) ';

        if (aFromForm.IsEmpty) then
          UserFilter := UserFilter + ' and ( coalesce(ps.For_FORM, '''') = '''' )'
        else
          UserFilter := UserFilter + ' and (( ps.For_FORM is null ) or ' + ' (POSITION(''' + aFromForm +
            ''' in ps.For_FORM) > 0))';

        pf.dsPaymentDocs.ParamByName('OWN_PD').Value := UserFilter;
      end;
    end;

    pf.ForForm := aFromForm;
    pf.dsPaymentDocs.Active := true;
    if pf.dsPaymentDocs.RecordCount > 0 then
    begin
      if (aPayDoc_id > -1) then
      begin
        if (pf.dsPaymentDocs.Locate('PAY_DOC_ID', aPayDoc_id, [])) then
        begin
          pf.CurrentDate := pf.dsPaymentDocs['CD'];
          pf.dbluPayDoc.KeyValue := pf.dsPaymentDocs['PAY_DOC_ID'];
        end
        else
        begin
          pf.CurrentDate := Now();
          pf.dbluPayDoc.KeyValue := aPayDoc_id;
        end;
      end
      else
      begin
        pf.CurrentDate := pf.dsPaymentDocs['CD'];
        if (dmMain.GetSettingsValue('CREATE_PD') <> '1') then
          pf.dbluPayDoc.KeyValue := pf.dsPaymentDocs['PAY_DOC_ID']
        else
        begin
          pf.dbluPayDoc.EmptyDataInfo.Text := pf.dbluPayDoc.EmptyDataInfo.Text + ' ' +
            'Если ПД не указан, то будет создан автоматически';
        end;
      end;
    end;

    if (OpenedPayDocs <> '') and (OpenedPayDocs <> '-1') and (Pos(',', OpenedPayDocs) = 0) then
    begin
      if (not dmMain.AllowedAction(rght_Pays_TheirAdd)) then
        pf.dbluPayDoc.KeyValue := OpenedPayDocs;
    end;

    if aCustomer_id > -1 then
      pf.FindCustomer('', '', aCustomer_id);

    if dmMain.AllowedAction(rght_Pays_AddToday) then
      pf.dsMemPayment['PAY_DATE'] := pf.CurrentDate
    else
      pf.dsMemPayment['PAY_DATE'] := aPayDate;

    if pf.showmodal = mrOk then
    begin
      if not pf.dsMemPayment.FieldByName('payment_id').IsNull then
        Result := pf.dsMemPayment['payment_id'];
      if not pf.dsMemPayment.FieldByName('pay_date').IsNull then
        aPayDate := pf.dsMemPayment['pay_date'];
      if not pf.dsMemPayment.FieldByName('pay_sum').IsNull then
        aPaySum := pf.dsMemPayment['pay_sum'];

      pf.AfterSave(pf.dsMemPayment['payment_id']);
    end;
    // pf.dsMemPayment.Close;
  finally
    pf.Free;
  end;
end;

procedure TPaymentForm.AfterSave(const PaymentId: Integer);
var
  FSaveProc: String;
  Q: TpFIBQuery;
begin
  FSaveProc := dmMain.GetSettingsValue('PAY_AFTER_SAVE');

  if FSaveProc.IsEmpty then
    Exit;

  Q := TpFIBQuery.Create(Self);
  try
    Q.DataBase := dmMain.dbTV;
    Q.Transaction := dmMain.trWriteQ;
    Q.SQL.Text := 'select * from ' + FSaveProc + '(' + PaymentId.ToString + ')';
    FSaveProc := '';
    Q.Transaction.StartTransaction;
    Q.ExecQuery;
    if (Q.FieldIndex['RESULT_TEXT'] >= 0) and (not Q.FN('RESULT_TEXT').IsNull) then
      FSaveProc := Q.FN('RESULT_TEXT').AsString;
    Q.Transaction.Commit;
  finally
    Q.Free;
  end;

  if not FSaveProc.IsEmpty then
    ShowMessage(FSaveProc);
end;

procedure TPaymentForm.RefreshPayDoc;
var
  i: Integer;
  j: Integer;
begin
  if FPayDoc_id = -1 then
    Exit;

  for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
    if (A4MainForm.MDIChildren[i] is TPaymentDocForm) then
    begin
      j := A4MainForm.MDIChildren[i].Tag;
      if (j = FPayDoc_id) then
      begin
        (A4MainForm.MDIChildren[i] as TPaymentDocForm).dsPayDocDetail.CloseOpen(true);
        (A4MainForm.MDIChildren[i] as TPaymentDocForm).dsPayDocDetail.Last;
      end;
    end;
end;

procedure TPaymentForm.SetPayDoc_Id(Value: int64);
begin
  FPayDoc_id := Value;
end;

procedure TPaymentForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsPT.Active then
    dsPT.Close;
  if dsFine.Active then
    dsFine.Close;
  if dsPaymentType.Active then
    dsPaymentType.Close;
  if dsPaymentSRV.Active then
    dsPaymentSRV.Close;
  if dsPaymentDocs.Active then
    dsPaymentDocs.Close;
end;

procedure TPaymentForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not FProcessPay;
end;

procedure TPaymentForm.FormCreate(Sender: TObject);
var
  s: string;
begin
  // расчитываем ли пеню
  FCalculateFine := (dmMain.GetSettingsValue('SHOW_FINE') = '1');

  FPayDoc_id := -1;
  FDatePay := Now;
  FSumPay := 0;
  FForForm := '';
  if dmMain.AllowedAction(rght_Pays_AddToday) then
    FCurrentDate := dmMain.GetServerDateTime
  else
    FCurrentDate := Date();

  FProcessPay := False;

  actShowPD.Checked := False;
  actShtrih.Checked := False;
  actManyPayment.Checked := False;

  s := dmMain.GetCompanyValue('NAME');
  FIsLTV := s.Contains('ЛТВ');
end;

procedure TPaymentForm.CalculateFine;
var
  vFine: Currency;
begin
  if FCalculateFine then
  begin
    // dsMemPayment['PAY_SUM'] := dsMemPayment['DEBT_SUM'];
    vFine := 0;
    if (not(dsMemPayment.State in [dsEdit, dsInsert])) then
    begin
      if dsMemPayment.RecordCount > 0 then
        dsMemPayment.Edit
      else
        dsMemPayment.Insert;
    end;

    if (dsMemPayment['DEBT_SUM'] > 0) then
    begin
      dsFine.Close;
      dsFine.ParamByName('pCustomer').AsInteger := dsMemPayment['Customer_Id'];
      dsFine.ParamByName('pDate').AsDate := deDate.Value;
      dsFine.Open;

      while not dsFine.eof do
      begin
        vFine := vFine + dsFine.FieldByName('FINE_SUM').AsCurrency;
        dsFine.Next;
      end;
      dsMemPayment['FINE_SUM'] := vFine;
      dsFine.First;

      vFine := dsMemPayment['DEBT_SUM'] + dsMemPayment['FINE_SUM'];
      if vFine < 0 then
        vFine := 0;
    end;
    dsMemPayment['dsItogo'] := vFine;
    dsMemPayment['PAY_SUM'] := vFine;
  end;
end;

procedure TPaymentForm.FindCustomer(const lic: string; const code: string; id: Integer);
begin
  dsMemPayment['Customer_Id'] := -1;
  actAdd.Enabled := False;
  actPrint.Enabled := False;

  FCustomerRecord := dmMain.FindCustomer(lic, code, id);
  CustomerInfofrm.Customer := FCustomerRecord;

  if FCustomerRecord.CUSTOMER_ID = -1 then
    Exit;

  dsMemPayment['Customer_Id'] := FCustomerRecord.CUSTOMER_ID;
  dsMemPayment['Cust_Code'] := FCustomerRecord.cust_code;
  dsMemPayment['Account_No'] := FCustomerRecord.Account_No;
  dsMemPayment['CUST_STATE_DESCR'] := FCustomerRecord.CUST_STATE_DESCR;

  if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
    dsMemPayment['Debt_sum'] := -1 * FCustomerRecord.Debt_sum
  else
    dsMemPayment['Debt_sum'] := FCustomerRecord.Debt_sum;

  dsMemPayment['adres'] := FCustomerRecord.Street + ' ' + FCustomerRecord.HOUSE_NO + ' ' + FCustomerRecord.flat_No;

  actAdd.Enabled := dsMemPayment['Customer_Id'] <> -1;
  actPrint.Enabled := dsMemPayment['Customer_Id'] <> -1;
  if FCalculateFine then
    CalculateFine;

  if (FIsLTV) and (dsMemPayment['Customer_Id'] > -1) then
    CheckRequestPay(dsMemPayment['Customer_Id']);
end;

procedure TPaymentForm.FormShow(Sender: TObject);
var
  vSF: string;
  vShowPaymentType: Boolean;
  vPaymentSRV: Boolean;
  FullAccess: Boolean;
begin
  FReportID := dmMain.GET_ID_REPORT_BY_PATH(rsCheckReportName);
  FBarCodeLen := Length(dmMain.GenerateBarCode('', 0, 0, '', '', '', ''));

  vSF := dmMain.GetSettingsValue('PAYMENT_TYPE');
  vShowPaymentType := (vSF = '1');
  if vShowPaymentType then
    qInsertPayment.SQL.Text := 'execute procedure Payment_Insert(:Payment_Id, :Pay_Doc_Id, :Customer_Id, :Pay_Date, ' +
      ':Pay_Sum, :Fine_Sum, :Payment_Type, :Notice, :Payment_Srv, :EXT_PAY_ID, null, null, null)';
  pnlPayType.Visible := vShowPaymentType;
  dsPaymentType.Active := vShowPaymentType;
  vSF := dmMain.GetSettingsValue('PAYMENT_SRV');
  vPaymentSRV := (vSF = '1');

  pnlSRV.Visible := vPaymentSRV;

  if vPaymentSRV then
  begin
    // проверим нужно ли фильтровать услуги
    vSF := dmMain.GetSettingsValue('PAY_SRV_FILTER');
    if (not vSF.IsEmpty) then
      dsPaymentSRV.ParamByName('FilterSRV').AsString := ' ( ' + vSF + ' ) and ';
  end;
  dsPaymentSRV.Active := vPaymentSRV;

  pnlFine.Visible := FCalculateFine;
  pnlFineSum.Visible := FCalculateFine;

  // права
  FullAccess := (dmMain.AllowedAction(rght_Pays_full));
  edFine.Enabled := FullAccess;

  // не понля что тут за дичь. зачем скрывать эту кнопку. кто ее придумал
  // Ok.Visible := (dmMain.GetIniValue('PRINT_CHECK_AND_FROM') <> '0');
  // Print.TabStop := not bbOk.Visible;

  // if bbPrint.TabStop
  // then bbPrint.Width := bbOk.Left + bbOk.Width - bbPrint.Left;

  // if not FCalculateFine then Width := Width - 400;

  if (dsMemPayment['PAY_SUM'] <= 0) then
    if (dsMemPayment['DEBT_SUM'] > 0) then
      dsMemPayment['PAY_SUM'] := dsMemPayment['DEBT_SUM']
    else
      dsMemPayment['PAY_SUM'] := 0;

  if dsMemPayment['Customer_Id'] > -1 then
  begin
    dePaySum.SetFocus;
    dePaySum.SelectAll;
    pnlSettings.Visible := False;
  end
  else
  begin
    if pnlSearchAbonent.Visible then
      edLicevoy.SetFocus;
    edLicevoy.SelectAll;
  end;

  if actAdd.Visible then
    actAdd.Visible := (dmMain.GetSettingsValue('HIDEPAYADD') <> '1');
  if actPrint.Visible then
    actPrint.Visible := (dmMain.GetSettingsValue('HIDEPAYPRINT') <> '1');

  FPayInputShow := (dmMain.GetSettingsValue('PAY_INPUT_SHOW') = '1');
  pnlPayInput.Visible := FPayInputShow;
  dsPT.Active := FPayInputShow;

  FShowLCPS := (dmMain.GetSettingsValue('SHOW_LCPS') = '1');
  pnlLCPS.Visible := FShowLCPS;

  // ЛТВ
  // if (FIsLTV) and (dsMemPayment['Customer_Id'] > -1) then
  // CheckRequestPay(dsMemPayment['Customer_Id']);
end;

procedure TPaymentForm.btnCalcFineClick(Sender: TObject);
begin
  CalculateFine;
end;

procedure TPaymentForm.dbgFineDblClick(Sender: TObject);

var
  d, f: Double;
  i, r: Integer;
  bm: TBookmark;
begin
  if dmMain.AllowedAction(rght_Pays_EditFine) then
  begin
    f := 0;
    d := 0;
    dsFine.DisableControls;
    r := dsFine.RecNo;
    bm := dsFine.GetBookmark;
    dsFine.First;
    for i := 1 to r do
    begin
      if not dsFine.FieldByName('FINE_SUM').IsNull then
        f := f + dsFine.FieldByName('FINE_SUM').AsFloat;

      if not dsFine.FieldByName('DOLG_SUM').IsNull then
        d := d + dsFine.FieldByName('DOLG_SUM').AsFloat;
      dsFine.Next;
    end;
    dsFine.GotoBookmark(bm);
    dsFine.EnableControls;
    edFine.Value := f;
    dePaySum.Value := f + d;
    edTOTALPAY.Value := f + d;
  end;
end;

procedure TPaymentForm.deDateExit(Sender: TObject);
begin
  if FCalculateFine then
    CalculateFine;
end;

procedure TPaymentForm.dsMemPaymentCalcFields(DataSet: TDataSet);
begin
  if (not DataSet.FieldByName('PAY_Sum').IsNull) and (not DataSet.FieldByName('FINE_SUM').IsNull) then
    DataSet['OnDebt'] := DataSet['PAY_Sum'] - DataSet['FINE_SUM']
  else
    DataSet.FieldByName('OnDebt').Clear;
end;

procedure TPaymentForm.dsMemPaymentNewRecord(DataSet: TDataSet);
begin
  if dmMain.AllowedAction(rght_Pays_AddToday) then
  begin
    dsMemPayment['Pay_Date'] := FCurrentDate;
    deDate.Enabled := False;
  end
  else
    dsMemPayment['Pay_Date'] := FDatePay;

  dsMemPayment['Debt_Sum'] := 0;
  dsMemPayment['PAY_Sum'] := FSumPay;
  dsMemPayment['FINE_SUM'] := 0;
  dsMemPayment['Pay_Doc_Id'] := FPayDoc_id;
  {
    dsMemPayment['Customer_Id']
    dsMemPayment['Payment_Id']
    dsMemPayment['Pay_Doc_Id']
    dsMemPayment['FINE_SUM']
    dsMemPayment['PAYMENT_TYPE']
    dsMemPayment['O_NAME']
    dsMemPayment['Cust_Code']
    dsMemPayment['Account_No']
    dsMemPayment['Cust_Descr']
    dsMemPayment['Debt_Sum']
    dsMemPayment['Cust_State_Descr']
    dsMemPayment['Street_Name']
    dsMemPayment['House_Info']
    dsMemPayment['payment_srv']
    dsMemPayment['SRV_NAME']
  }
end;

procedure TPaymentForm.actAddExecute(Sender: TObject);
begin
  if FProcessPay then
    Exit;

  if VarIsNull(dePaySum.Value) or VarIsEmpty(dePaySum.Value) or
  // проверим можно ли вносить 0 как платеж
    ((dePaySum.Value = 0) and (dmMain.GetSettingsValue('PAY_ZERRO') <> '1')) or
  // проверим можно ли вносить отрицательный платеж
    ((dePaySum.Value < 0) and (dmMain.GetSettingsValue('NEGATIVE_PAY') <> 1)) then
  begin
    dePaySum.SetFocus;
    CnErrors.SetError(dePaySum, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    ModalResult := mrNone;
    Exit;
  end
  else
    CnErrors.Dispose(dePaySum);

  FProcessPay := true;
  if not InsertPayment(true) then
    ModalResult := mrNone
  else
    AddMorePayment;
  FProcessPay := False;
end;

procedure TPaymentForm.actManyPaymentExecute(Sender: TObject);
begin
  actManyPayment.Checked := not actManyPayment.Checked;
  actShowPD.Checked := actManyPayment.Checked;
end;

procedure TPaymentForm.actPrintExecute(Sender: TObject);
begin
  if FProcessPay then
    Exit;
  ModalResult := mrNone;
  FProcessPay := true;
  if InsertPayment(False) then
  begin
    PrintReportIfNeed(true);
    AddMorePayment;
    // ModalResult := mrOk;
  end;
  FProcessPay := False;
end;

procedure TPaymentForm.actShowPDExecute(Sender: TObject);
begin
  actShowPD.Checked := not actShowPD.Checked;
end;

procedure TPaymentForm.actShtrihExecute(Sender: TObject);
begin
  actShtrih.Checked := not actShtrih.Checked;
  actManyPaymentExecute(Sender);

  edScaner.Enabled := actShtrih.Checked;
  edLicevoy.Enabled := not actShtrih.Checked;
  edCode.Enabled := not actShtrih.Checked;
  if actShtrih.Checked then
  begin
    if pnlSearchAbonent.Visible then
    begin
      edScaner.SetFocus;
      edScaner.SelectAll;
    end;
  end
  else
  begin
    if pnlSearchAbonent.Visible then
    begin
      edLicevoy.SetFocus;
      edLicevoy.SelectAll;
    end;
  end;

end;

procedure TPaymentForm.AddMorePayment;
begin
  if actManyPayment.Checked then
  begin
    ModalResult := mrNone;
    dsMemPayment.Close;
    dsMemPayment.Open;
    dsMemPayment.EmptyTable;
    dsMemPayment.Insert;
    if actShtrih.Checked then
    begin
      if pnlSearchAbonent.Visible then
        edScaner.SetFocus;
      edScaner.Text := '';
    end
    else
    begin
      if pnlSearchAbonent.Visible then
        edLicevoy.SetFocus;
      edLicevoy.Text := '';
    end;
    if actShowPD.Checked then
      RefreshPayDoc;
  end
  else
    ModalResult := mrOk;
end;

function TPaymentForm.PrintCheck: TPrintCheckResult;
var
  PrintCheque54FZ: TPrintChequeDialog54FZ;
  PrintChequeStr: TPrintChequeDialogStr;
  HLib: THandle;
  pass: string;
  Summa, Peni: Real;
  ci: TCheckResult;
  ciStr: TStrCheckResult;
  SERVICE, NOTICE, OPER: string;
  ChequeInfo: TChequeInfo;
  is54FZ: Boolean;
  isStr: Boolean;
begin
  // напечатаем чек
  Result.CheckN := '';
  Result.Summa := 0;
  Result.Peni := 0;

  if FileExists(ExtractFilePath(application.ExeName) + 'cashrgst.dll') then
  begin
    HLib := LoadLibrary('cashrgst.dll');
    if HLib > HINSTANCE_ERROR then
    begin

      Peni := dsMemPayment['fine_sum'];
      Summa := dsMemPayment['pay_sum'] - dsMemPayment['fine_sum'];

      if not dsMemPayment.FieldByName('PAYMENT_SRV').IsNull then
        SERVICE := luPaymentSrv.Text
      else
        SERVICE := '';

      if not dsMemPayment.FieldByName('NOTICE').IsNull then
        NOTICE := dsMemPayment['NOTICE']
      else
        NOTICE := '';

      OPER := dmMain.GetOperatorFIO;
      pass := dmMain.CashBoxPSWD;

      PrintCheque54FZ := GetProcAddress(HLib, 'PrintChequeDialog54FZ');
      is54FZ := Assigned(PrintCheque54FZ);
      PrintChequeStr := GetProcAddress(HLib, 'PrintChequeDialogStr');
      isStr := Assigned(PrintChequeStr);
      if (is54FZ or isStr) then
      begin
        ChequeInfo.AppHandle := application.Handle;
        ChequeInfo.OPER := PWCHAR(OPER);
        ChequeInfo.OPER_PASS := PWCHAR(pass);
        ChequeInfo.SERVICE := PWCHAR(SERVICE);
        ChequeInfo.NOTICE := PWCHAR(NOTICE);
        ChequeInfo.ACCOUNT := PWCHAR(FCustomerRecord.Account_No);
        if (FCustomerRecord.isJur = 0) then
          ChequeInfo.FIO := PWCHAR(FCustomerRecord.FIO)
        else
          ChequeInfo.FIO := PWCHAR(FCustomerRecord.FIO + '$' + FCustomerRecord.INN);
        if not FCustomerRecord.flat_No.IsEmpty then
          ChequeInfo.ADDRESS := PWCHAR(Format(rsPrintCheckAdr, [FCustomerRecord.Street, FCustomerRecord.HOUSE_NO,
            FCustomerRecord.flat_No]))
        else
          ChequeInfo.ADDRESS := PWCHAR(Format(rsPrintCheckAdrWOF, [FCustomerRecord.Street, FCustomerRecord.HOUSE_NO]));

        if (dmMain.GetSettingsValue('EMAIL_CHECK') = '1') then
          pass := FCustomerRecord.Email
        else
        begin
          pass := AtrStrUtils.CorrectPhone(FCustomerRecord.mobile, dmMain.CompanyCountry);
          // if not FCustomerRecord.Email.IsEmpty then
          // pass := pass + ';' + FCustomerRecord.Email
        end;
        ChequeInfo.Notify := PWCHAR(pass);

        ChequeInfo.Summa := Summa;
        if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
          ChequeInfo.Balance := -1 * FCustomerRecord.Debt_sum
        else
          ChequeInfo.Balance := FCustomerRecord.Debt_sum;
        ChequeInfo.Peni := Peni;

        NOTICE := Format('ЛС:%s Баланс:%s Сумма:%s Пени:%s',
          [string(ChequeInfo.ACCOUNT), FloatToStr(ChequeInfo.Balance), FloatToStr(ChequeInfo.Summa),
          FloatToStr(ChequeInfo.Peni)]);
        if is54FZ then
        begin
          // WriteLog('Откроем 54ФЗ ' + NOTICE);
          ci := PrintCheque54FZ(ChequeInfo);
          NOTICE := Format('ЧН:%s Сумма:%s Пени:%s', [ci.CheckN.ToString, FloatToStr(ci.Summa), FloatToStr(ci.Peni)]);
          // WriteLog('Ответ 54ФЗ ' + NOTICE);
          if ci.CheckN > 0 // напечатали чек
          then
          begin
            Result.CheckN := ci.CheckN.ToString;
            Result.Summa := ci.Summa;
            Result.Peni := ci.Peni;
            Result.Notify := ci.Notify;
            Result.PayType := ci.PayType;
          end;
        end
        else
        begin
          // WriteLog('Откроем ' + NOTICE);
          ciStr := PrintChequeStr(ChequeInfo);
          NOTICE := Format('ЧН:%s Сумма:%s Пени:%s', [ciStr.CheckN, FloatToStr(ciStr.Summa), FloatToStr(ciStr.Peni)]);
          // WriteLog('Ответ ' + NOTICE);
          if ciStr.CheckN <> '' // напечатали чек
          then
          begin
            Result.CheckN := ciStr.CheckN;
            Result.Summa := ciStr.Summa;
            Result.Peni := ciStr.Peni;
            Result.Notify := ciStr.Notify;
            Result.PayType := ciStr.PayType;
          end;
        end;
      end
      else
        ShowMessage(Format(rsErrorDll, ['cashrgst.dll']));

      FreeLibrary(HLib);
    end
    else
      ShowMessage(Format(rsErrorLoadDll, ['cashrgst.dll']));
  end
  else
  begin
    Result.CheckN := '0';
    Result.Summa := 0;
    Result.Peni := 0;
  end;
end;

function TPaymentForm.SelectPayDoc: int64;

var
  res: int64;
begin
  res := -1;
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'select pay_doc_id from SelectPayDoc(:FF)';
      ParamByName('FF').AsString := FForForm;
      Transaction.StartTransaction;
      ExecQuery;
      if not eof then
        if not FieldByName('pay_doc_id').IsNull then
          res := FieldByName('pay_doc_id').Value;
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  Result := res;
end;

function TPaymentForm.InsertPayment(const NeedPrintCheck: Boolean): Boolean;
var
  pdi: int64;
  vSF: Boolean;
  AR: Boolean;
  FullAccess: Boolean;
  ci: TPrintCheckResult;
  fi: Integer;
  s: String;
  PrintReport: Boolean;
  vCommitPayment: Boolean;
  HasErrors : Boolean;
begin
  Result := False;
  FullAccess := dmMain.AllowedAction(rght_Pays_full);
  // полный доступ
  AR := dmMain.AllowedAction(rght_Pays_add) or dmMain.AllowedAction(rght_Pays_AddToday); // добавление
  AR := AR or FullAccess; // полный доступ
  PrintReport := False;

  if (not AR) then
    Exit;

  if dsMemPayment.State in [dsEdit, dsInsert] then
    dsMemPayment.Post;

  HasErrors := False;

  if dmMain.AllowedAction(rght_Pays_AddToday) and (VarToDateTime(dsMemPayment['PAY_DATE']) <> FCurrentDate) then
  begin
    deDate.Value := FCurrentDate;
    CnErrors.SetError(deDate, rsWrongDate, iaMiddleLeft, bsNeverBlink);
    HasErrors := True;
  end
  else
    CnErrors.Dispose(deDate);

  if ((dmMain.InStrictMode or (not FullAccess)) and (VarToDateTime(dsMemPayment['PAY_DATE']) < dmMain.CurrentMonth))
  then
  begin
    CnErrors.SetError(deDate, rsWrongDate, iaMiddleLeft, bsNeverBlink);
    HasErrors := True;
  end
  else
    CnErrors.Dispose(deDate);

  if A4MainForm.SuspiciousDate(dsMemPayment['PAY_DATE']) then
  begin
    deDate.SetFocus;
    CnErrors.SetError(deDate, Format(rsSuspiciousDateQuest, [FormatDateTime('dd.mm.yyyy', dsMemPayment['PAY_DATE'])]),
      iaMiddleLeft, bsNeverBlink);
    Exit;
  end
  else
    CnErrors.Dispose(deDate);

  if not FCalculateFine then
  begin
    dsMemPayment.Edit;
    dsMemPayment['FINE_SUM'] := 0;
    dsMemPayment.Post;
  end;

  if not(dsMemPayment['customer_id'] >= 0) then
  begin
    edLicevoy.SelectAll;
    CnErrors.SetError(edLicevoy, rsSelectAccount, iaMiddleLeft, bsNeverBlink);
    if pnlSearchAbonent.Visible then
      edLicevoy.SetFocus;
    HasErrors := True;
  end
  else
    CnErrors.Dispose(edLicevoy);
  {
    if (dsMemPayment.FieldByName('PAYMENT_ID').IsNull) or (dsMemPayment['PAYMENT_ID'] = -1)
    then begin
    if not(dsMemPayment.State in [dsEdit, dsInsert])
    then dsMemPayment.Edit;
    dsMemPayment['PAYMENT_ID'] := dmMain.dbTV.Gen_Id('GEN_PAYMENT', 1);
    end;
  }
  if dsMemPayment.FieldByName('PAY_SUM').IsNull then
  begin
    CnErrors.SetError(dePaySum, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    HasErrors := True;
  end
  else
    CnErrors.Dispose(dePaySum);

  if (dsMemPayment['PAY_SUM'] = 0) and (not dmMain.UserIsAdmin) then
  begin
    CnErrors.SetError(dePaySum, rsINPUT_VALUE, iaMiddleLeft, bsNeverBlink);
    HasErrors := True;
  end
  else
    CnErrors.Dispose(dePaySum);

  if ((dsMemPayment['PAY_SUM'] < 0) and (dmMain.GetSettingsValue('NEGATIVE_PAY') <> 1)) then
  begin
    CnErrors.SetError(dePaySum, rsNotNegativePayment, iaMiddleLeft, bsNeverBlink);
    dePaySum.SelectAll;
    dePaySum.SetFocus;
    HasErrors := True;
  end
  else
    CnErrors.Dispose(dePaySum);

  if not dmMain.AllowedAction(rght_Pays_EditFine) then
  begin
    if (FCalculateFine and ((dsMemPayment['DSITOGO'] > dsMemPayment['PAY_SUM']) or
      (dsMemPayment['PAY_SUM'] < dsMemPayment['DEBT_SUM']))) then
    begin
      CnErrors.SetError(dePaySum, rsPamentLessDebt, iaMiddleLeft, bsNeverBlink);
      dsMemPayment.Edit;
      dsMemPayment['PAY_SUM'] := dsMemPayment['DEBT_SUM'] + dsMemPayment['FINE_SUM'];
      dsMemPayment.Post;
      dePaySum.SetFocus;
      HasErrors := True;
    end
    else
      CnErrors.Dispose(dePaySum);
  end;

  if HasErrors
  then Exit;

  // сохраним дату и сумму платежа для многоплатежного ввода
  FDatePay := dsMemPayment['PAY_DATE'];
  FSumPay := dsMemPayment['PAY_SUM'];

  with qInsertPayment do
  begin
    if not dsMemPayment.FieldByName('notice').IsNull then
      ParamByName('notice').AsString := dsMemPayment['notice']
    else
      ParamByName('notice').Clear;

    ParamByName('customer_id').AsInt64 := dsMemPayment['customer_id'];
    // проверим номер платежного документа
    // и если его нет, то попробуем создать новый
    vCommitPayment := (not dsMemPayment.FieldByName('pay_doc_id').IsNull) and (dsMemPayment['pay_doc_id'] > -1);

    if vCommitPayment then
      ParamByName('pay_doc_id').AsInt64 := dsMemPayment['pay_doc_id']
    else
    begin
      vSF := (dmMain.GetSettingsValue('CREATE_PD') = 1);
      if vSF then
      begin
        pdi := SelectPayDoc;
        if pdi > 0 then
        begin
          ParamByName('pay_doc_id').AsInt64 := pdi;
          vCommitPayment := true;
        end;
      end
    end;
    if not vCommitPayment then
    begin
      ShowMessage(rsSelectPayDoc);
      Exit;
    end;

    if not dsMemPayment.FieldByName('fine_sum').IsNull then
      ParamByName('fine_sum').AsCurrency := dsMemPayment['fine_sum']
    else
      ParamByName('fine_sum').AsCurrency := 0;

    if not dsMemPayment.FieldByName('fine_sum').IsNull then
      ParamByName('pay_sum').AsCurrency := dsMemPayment['pay_sum'] - dsMemPayment['fine_sum']
    else
      ParamByName('pay_sum').AsCurrency := dsMemPayment['pay_sum'];

    if not dsMemPayment.FieldByName('pay_date').IsNull then
      ParamByName('pay_date').AsDate := dsMemPayment['pay_date']
    else
      ParamByName('pay_date').AsDate := Now;

    if not dsMemPayment.FieldByName('payment_type').IsNull then
      ParamByName('payment_type').AsInteger := dsMemPayment['payment_type']
    else
      ParamByName('payment_type').Clear;
    if not dsMemPayment.FieldByName('PAYMENT_SRV').IsNull then
      ParamByName('PAYMENT_SRV').AsInteger := dsMemPayment['PAYMENT_SRV']
    else
      ParamByName('PAYMENT_SRV').Clear;

    if not dsMemPayment.FieldByName('EXT_PAY_ID').IsNull then
      ParamByName('EXT_PAY_ID').AsString := dsMemPayment['EXT_PAY_ID']
    else
      ParamByName('EXT_PAY_ID').Clear;

    if FRQ_ID > 0 then
      ParamByName('RQ_ID').AsInteger := FRQ_ID
    else
      ParamByName('RQ_ID').Clear;

    if not dsMemPayment.FieldByName('LCPS').IsNull then
      ParamByName('LCPS').AsCurrency := dsMemPayment['LCPS']
    else
      ParamByName('LCPS').Clear;

    ParamByName('FISCAL').AsInteger := 0; // Признак без пробития чека

    vCommitPayment := true;
    if NeedPrintCheck then
    begin
      ci := PrintCheck;
      if ci.CheckN <> '' then
      begin
        if ci.CheckN <> '0' then
        begin
          ParamByName('EXT_PAY_ID').AsString := ci.CheckN;
          ParamByName('FISCAL').AsInteger := 1; // Признак с пробитием чека
        end;

        if ci.Summa > 0 then
          ParamByName('pay_sum').AsCurrency := ci.Summa / 100;

        if ci.Peni > 0 then
          ParamByName('fine_sum').AsCurrency := ci.Peni / 100;

        s := 'CASH';
        if ci.CheckN <> '0' then
        begin
          if (ci.PayType = 1) then
            s := 'CARD';
        end
        else
        begin
          if not dsMemPayment.FieldByName('PAY_TYPE_STR').IsNull then
            s := dsMemPayment['PAY_TYPE_STR'];
        end;

        ParamByName('PAY_TYPE_STR').AsString := s;

        PrintReport := (dmMain.GetIniValue('PRINT_CHECK_AND_REPORT') = '1');
      end
      else
        vCommitPayment := False;
    end;

    if vCommitPayment then
    begin
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    end
    else
    begin
      // очистим параметры
      for fi := 0 to qInsertPayment.ParamCount - 1 do
        qInsertPayment.Params[fi].Clear;
      ShowMessage('Ошибка приема платежа');
    end;

    if (FieldExist('PAYMENT_ID', fi)) and (not FieldByName('PAYMENT_ID').IsNull) then
    begin
      if not(dsMemPayment.State in [dsEdit, dsInsert]) then
        dsMemPayment.Edit;
      dsMemPayment['PAYMENT_ID'] := FieldByName('PAYMENT_ID').AsInteger;
      dsMemPayment.Post;

      if FIsLTV then
      begin
        // Для ЛТВ проверим наличие договоров и пометим если нет
        CheckAndSetContract(dsMemPayment['customer_id']);
      end;
    end;

    PrintReportIfNeed(PrintReport);

    Result := true;
  end;
end;

procedure TPaymentForm.PrintReportIfNeed(const NeedPrint: Boolean);
var
  vi: Integer;
begin
  if dsMemPayment.FieldByName('PAYMENT_ID').IsNull then
    Exit;

  if NeedPrint and (FReportID > -1) then
  begin
    with TReportChild.Create(application) do
      try
        REPORT_ID := FReportID;
        LoadReportBody;
        vi := GetVariableID('PAYMENT');
        if vi > 0 then
        begin
          SetVariable('PAYMENT', dsMemPayment['PAYMENT_ID']);
          PrepareReport(true);
          PrintReport;
          // ShowReportBody;
          // Show;
        end;
      finally
        Free;
      end;
  end;
end;

procedure TPaymentForm.N1Click(Sender: TObject);
var
  i: Integer;
  Stream: TMemoryStream;
begin
  i := dmMain.GET_ID_REPORT_BY_PATH(rsCheckReportName);
  if i < 0 then
    Exit;
  // Загрузим отчет из БД
  try
    dmMain.fdsLoadReport.ParamByName('ID_REPORT').Value := i;
    dmMain.fdsLoadReport.Open;
    if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').Value <> NULL then
    begin
      Stream := TMemoryStream.Create;
      try
        TBlobField(dmMain.fdsLoadReport.FieldByName('REPORT_BODY')).SaveToStream(Stream);
        Stream.Position := 0;
        dmMain.frxModalReport.LoadFromStream(Stream);
        dmMain.frxModalReport.FILENAME := dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString;
        dmMain.frxModalReport.ReportOptions.Name := dmMain.frxModalReport.FILENAME;
      finally
        Stream.Free;
      end;
    end;
  finally
    if dmMain.fdsLoadReport.Active then
      dmMain.fdsLoadReport.Close;
  end;
  dmMain.frxModalReport.DesignReport(true);
end;

procedure TPaymentForm.edCodeEnter(Sender: TObject);
begin
  edLicevoy.Text := '';
end;

procedure TPaymentForm.edFineChange(Sender: TObject);
begin
  if (FCalculateFine and (dsMemPayment.State in [dsEdit, dsInsert])) then
    dsMemPayment['dsItogo'] := dsMemPayment['DEBT_SUM'] + dsMemPayment['FINE_SUM'];
end;

procedure TPaymentForm.edLicevoyEnter(Sender: TObject);
begin
  edCode.Text := '';
end;

procedure TPaymentForm.edLicevoyChange(Sender: TObject);
begin
  FindCustomer(edLicevoy.Text, '', -1);
end;

procedure TPaymentForm.edCodeChange(Sender: TObject);
begin
  FindCustomer('', edCode.Text, -1);
end;

procedure TPaymentForm.edScanerChange(Sender: TObject);
begin
  if (FBarCodeLen = Length(edScaner.Text)) then
  begin
    if (dmMain.GetSettingsValue('BARADDPAY') = 1) and (pnlSearchAbonent.Visible) and ParseBarCode then
    begin
      actAddExecute(Sender);
      edScaner.Text := '';
      edScaner.SetFocus;
    end;
  end;
end;

procedure TPaymentForm.edScanerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  ParseBarCode;
end;

function TPaymentForm.ParseBarCode: Boolean;

var
  bar: string;
  cust_id: Integer;
  ACCOUNT: string;
  money: Currency;
begin
  Result := False;
  bar := edScaner.Text;
  if dmMain.ParseBarCode(bar, cust_id, ACCOUNT, money) then
  begin
    FindCustomer(ACCOUNT, '', cust_id);
    dePaySum.Value := money;
    Result := ((FCustomerRecord.CUSTOMER_ID > -1) and (money > 0));
  end;
end;

procedure TPaymentForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) and (actAdd.Enabled) and (actAdd.Visible) then
    actAddExecute(Sender);
end;

procedure TPaymentForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBComboBoxEh) then
      go := not(ActiveControl as TDBComboBoxEh).ListVisible
    else
    begin
      if (ActiveControl = dePaySum) and cbManyPayments.Checked and bbOk.Enabled then
      begin
        bbOk.SetFocus;
        go := False;
      end
      else
      begin
        if (ActiveControl is TDBMemoEh) and
          (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
        begin
          go := False;
          FEnterSecondPress := true;
        end;
      end;
    end;

    if go then
    begin
      FEnterSecondPress := False;
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end
  else
  begin
    if (ActiveControl is TDBMemoEh) then
      FEnterSecondPress := False;
  end;
end;

procedure TPaymentForm.WriteClientHeight(Writer: TWriter);
begin
  Writer.WriteInteger(ClientHeight);
end;

procedure TPaymentForm.WriteClientWidth(Writer: TWriter);
begin
  Writer.WriteInteger(ClientWidth);
end;

procedure TPaymentForm.WriteScaleFix(Writer: TWriter);
begin
  // просто сохраняем флаг в DFM-файл, чтобы при его чтении можно было вклиниться в процесс метода ReadState
  Writer.WriteBoolean(true);
end;

procedure TPaymentForm.ReadScaleFix(Reader: TReader);
begin
  if not Reader.ReadBoolean then
    Exit;

  // запоминаем прочитанное ранее свойство PixelsPerInch
  FPixelsPerInch := THackCustomForm(Self).FPixelsPerInch;
  // и устанавливаем текущее
  THackCustomForm(Self).FPixelsPerInch := Screen.PixelsPerInch;

  // сбрасываем свойство FTextHeight для отключения масштабирования на уровне VCL
  THackCustomForm(Self).FTextHeight := 0;
end;

procedure TPaymentForm.DefineProperties(Filer: TFiler);
  function NeedWriteClientSize: Boolean;
  begin
    Result := Scaled and (AutoScroll or (HorzScrollBar.Range <> 0) or (VertScrollBar.Range <> 0));
  end;

begin
  inherited DefineProperties(Filer);

  // ClientHeight и ClientWidth сохраняются не всегда, а вместо этого сохраняются внешние размеры формы.
  // Это не совсем правильно, т.к. масштабировать необходимо именно клиентскую область. Функция NeedWriteClientSize
  // определяет, нужно ли принудительно сохранять размер клиентской области.
  Filer.DefineProperty('ClientHeight', nil, WriteClientHeight, NeedWriteClientSize);
  Filer.DefineProperty('ClientWidth', nil, WriteClientWidth, NeedWriteClientSize);
  Filer.DefineProperty('ScaleFix', ReadScaleFix, WriteScaleFix, Scaled);
end;

procedure TPaymentForm.Loaded;
begin
  // подробней http://www.delphinotes.ru/2013/06/vcl-form-and-frame-scale-fix.html
  // после обновления BaseForm ошибка
  // if (FPixelsPerInch > 0) and (FPixelsPerInch <> Screen.PixelsPerInch) then
  // ScaleControl(Self, Screen.PixelsPerInch, FPixelsPerInch);

  inherited Loaded;
end;

procedure TPaymentForm.JudgeInput;
var
  pN, pD, pS, pA: string;
  Values: array of string;
begin
  if not(FIsLTV and luPaymentSrv.Value = 788679) // Суд оплата по суду
  then
    Exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Text := 'select * from IBE$PAYFORJUDGE(:CID)';
      ParamByName('CID').AsInteger := FCustomerRecord.CUSTOMER_ID;
      Transaction.StartTransaction;
      ExecQuery;
      if not eof then
      begin
        if not FieldByName('JN').IsNull then
          pN := FieldByName('JN').Value;
        if not FieldByName('JD').IsNull then
          pD := FieldByName('JD').Value;
        if not FieldByName('JS').IsNull then
          pS := FieldByName('JS').Value;
        if not FieldByName('JA').IsNull then
          pA := FieldByName('JA').Value;
      end;
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  end;

  SetLength(Values, 3);
  Values[0] := pN;
  Values[1] := pD;
  Values[2] := pS;
  // номер претензии, дата от какого числа и на какую сумму претензия.
  if not InputQuery('Ведите данные по суду', ['Номер претензии', 'Дата', 'Сумма'], Values, nil) then
    Exit;

  mmoNOTICE.Lines.Add('Суд претензия №- ' + Values[0] + ' от ' + Values[1] + 'г.');
  mmoNOTICE.Lines.Add('Всего на ' + Values[2] + 'руб.');
  if (not pA.IsEmpty) then
    mmoNOTICE.Lines.Add(pA);

  mmoNOTICE.SetFocus;
  PostMessage(mmoNOTICE.Handle, WM_KEYDOWN, VK_DOWN, 0);
end;

procedure TPaymentForm.luPaymentSrvExit(Sender: TObject);
begin
  try
    JudgeInput;
  except
    //
  end;
end;

procedure TPaymentForm.SetForForm(Value: String);
begin
  FForForm := Value;
end;

procedure TPaymentForm.CheckAndSetContract(const CID: Integer);
var
  Q: TpFIBQuery;
  NeedUpdate: Boolean;
begin
  Q := TpFIBQuery.Create(Nil);
  try
    Q.DataBase := dmMain.dbTV;
    Q.Transaction := dmMain.trReadQ;
    Q.SQL.Text := 'select count(*) CNT from Subscr_Serv ss ' +
      ' where ss.Customer_Id = :CID and ((ss.State_Sgn = 1) or (ss.State_Sgn = 0 and ss.State_Srv = -3)) ' +
      ' and ss.Serv_Id <> 819519 ' +
      ' and (not (coalesce(ss.Contract, '''') similar to ''(_){3,4} \- [[:DIGIT:]]{4} [[:DIGIT:]]{6}'' escape ''\'')) '
      + ' and exists( select c.Juridical from customer c where c.Customer_Id = :CID and coalesce(c.Juridical, 0) <> 1)';
    Q.ParamByName('CID').AsInteger := CID;
    Q.Transaction.StartTransaction;
    Q.ExecQuery;
    NeedUpdate := Q.FieldByName('CNT').Value > 0;
    Q.Close;
    Q.Transaction.Commit;
  finally
    Q.Free;
  end;
  if not NeedUpdate then
    Exit;

  application.MessageBox('Необходимо перезаключить договор', 'Внимание!', MB_OK + MB_ICONWARNING);

  Q := TpFIBQuery.Create(Nil);
  try
    Q.DataBase := dmMain.dbTV;
    Q.Transaction := dmMain.trWriteQ;
    Q.SQL.Text := 'update Subscr_Serv ss set ss.Contract = :PREF ' +
      ' where ss.Customer_Id = :CID and ((ss.State_Sgn = 1) or (ss.State_Sgn = 0 and ss.State_Srv = -3)) ' +
      ' and ss.Serv_Id <> 819519' + ' and coalesce(ss.Contract, '''') <> :PREF' +
      ' and (not (coalesce(ss.Contract, '''') similar to ''(_){3,4} \- [[:DIGIT:]]{4} [[:DIGIT:]]{6}'' escape ''\'')) '
      + ' and exists( select c.Juridical from customer c where c.Customer_Id = :CID and coalesce(c.Juridical, 0) <> 1) ';
    Q.ParamByName('CID').AsInteger := CID;
    Q.ParamByName('PREF').AsString := 'Ар. -';
    Q.Transaction.StartTransaction;
    Q.ExecQuery;
    Q.Transaction.Commit;
  finally
    Q.Free;
  end;
end;

procedure TPaymentForm.CheckRequestPay(const CID: Integer);
var
  Q: TpFIBQuery;
  s: string;
begin
  s := '';
  Q := TpFIBQuery.Create(Nil);
  try
    Q.DataBase := dmMain.dbTV;
    Q.Transaction := dmMain.trReadQ;
    Q.SQL.Text := 'select list(RQ_ID) RQ_LIST from ( select r.RQ_ID , coalesce(Get_Request_Money(r.Rq_Id), 0) RQ_FEE ' +
      ' , coalesce((select sum(p.Pay_Sum + coalesce(p.fine_sum,0)) from payment p where p.Customer_Id = r.Rq_Customer and p.Rq_Id = r.Rq_Id), 0) RQ_PAY '
      + ' , coalesce((select sum(w.w_quant) from request_works w where w.rq_id = r.rq_id and w.w_id in (984742, 983987)), 0) PAY_SRV '
      + ' from REQUEST R where r.Rq_Customer = :CID and r.Rq_Exec_Time >= ''2024-01-01'') where RQ_FEE + PAY_SRV > RQ_PAY';
    Q.ParamByName('CID').AsInteger := CID;
    Q.Transaction.StartTransaction;
    Q.ExecQuery;
    if not Q.FieldByName('RQ_LIST').IsNull then
      s := Q.FieldByName('RQ_LIST').AsString;
    Q.Close;
    Q.Transaction.Commit;
  finally
    Q.Free;
  end;
  if s.IsEmpty then
    Exit;
  s := 'Необходимо внести оплату по заявкам: ' + #13#10 + s;
  Panel6.Caption := s;
  application.MessageBox(PWideChar(s), 'Внимание!', MB_OK + MB_ICONWARNING);
end;

end.
