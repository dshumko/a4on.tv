unit PaymentEditForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, DBCtrlsEh, StdCtrls, Buttons, ExtCtrls, FIBQuery, pFIBQuery,
  DBLookupEh, DB, FIBDataSet, pFIBDataSet, DBGridEh, A4onTypeUnit;

type
  TPaymentEditFrm = class(TForm)
    pnlAbonent: TPanel;
    pnlSearchAbonent: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    edCode: TEdit;
    edLicevoy: TEdit;
    memAbonent: TDBMemoEh;
    pnlButtons: TPanel;
    lblPaySum: TLabel;
    dePaySum: TDBNumberEditEh;
    mmoNotice: TDBMemoEh;
    pnlSRV: TPanel;
    lPaymentSrv: TLabel;
    luPaymentSrv: TDBLookupComboboxEh;
    srcPaymentSRV: TDataSource;
    dsPaymentSRV: TpFIBDataSet;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    pnlFine: TPanel;
    lbl1: TLabel;
    edtFine: TDBNumberEditEh;
    pnlTYPE: TPanel;
    Label3: TLabel;
    cbbPayTypeStr: TDBComboBoxEh;
    procedure FormShow(Sender: TObject);
    procedure dePaySumChange(Sender: TObject);
    procedure edLicevoyChange(Sender: TObject);
    procedure edCodeChange(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FPayment_id: Integer;
    cr: TCustomerInfo;
    FPaymentSRV: Boolean;
    FFine: Boolean;
    FPayNegative: Boolean;
    procedure FindCustomer(const lic, code: string; const id: Integer);
    procedure SetPayID(Value: Integer);
    function EditPayment: Boolean;
  public
    { Public declarations }
    property payment_id: Integer write SetPayID;
  end;

function EditPayment(const aPayment_id: int64; const aCustomer_id: int64; const aPaySum: Currency; const Notice: string;
  const FineSum: Currency = 0): int64;

implementation

uses PrjConst, DM;

{$R *.dfm}

function EditPayment(const aPayment_id: int64; const aCustomer_id: int64; const aPaySum: Currency; const Notice: string;
  const FineSum: Currency = 0): int64;
var
  pf: TPaymentEditFrm;
begin
  Result := -1;
  pf := TPaymentEditFrm.Create(application);
  try
    pf.payment_id := aPayment_id;
    if aCustomer_id > -1 then
      pf.FindCustomer('', '', aCustomer_id);
    pf.dePaySum.Value := aPaySum;
    pf.edtFine.Value := FineSum;
    pf.mmoNotice.Lines.Text := Notice;
    if pf.showmodal = mrOk then
      Result := 1;

  finally
    pf.Free;
  end;
end;

procedure TPaymentEditFrm.FindCustomer(const lic, code: string; const id: Integer);
var
  s: string;
begin
  memAbonent.Lines.Clear;
  bbOk.Enabled := false;

  cr := dmMain.FindCustomer(lic, code, id);
  if cr.CUSTOMER_ID = -1 then begin
    memAbonent.Lines.Text := rsNOT_FOUND_CUST;
    exit;
  end;

  s := rsACCOUNT + ' ' + cr.Account_no + ' ' + rsCODE + ' ' + cr.cust_code;
  memAbonent.Lines.Add(s);
  if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
    s := rsBALANCE + ' ' + floatToStr(cr.Debt_sum)
  else
    s := rsSALDO + ' ' + floatToStr(cr.Debt_sum);

  memAbonent.Lines.Add(s);
  s := cr.FIO;
  memAbonent.Lines.Add(s);
  s := '' + cr.Street + ' ' + cr.HOUSE_NO + ' ' + cr.flat_No + rsEOL + cr.Notice;
  memAbonent.Lines.Add(s);
  if cr.color <> '' then
    memAbonent.color := StringToColor(cr.color)
  else
    memAbonent.color := clBtnFace;

  bbOk.Enabled := ((cr.CUSTOMER_ID > -1) and (dePaySum.Value > 0));
end;

procedure TPaymentEditFrm.FormCreate(Sender: TObject);
var
  vSF: string;
begin
  vSF := dmMain.GetSettingsValue('PAYMENT_SRV');
  FPaymentSRV := (vSF = '1');
  pnlSRV.Visible := FPaymentSRV;
  dsPaymentSRV.Active := FPaymentSRV;

  vSF := dmMain.GetSettingsValue('SHOW_FINE');
  FFine := (vSF = '1');
  pnlFine.Visible := FFine;

  vSF := dmMain.GetSettingsValue('NEGATIVE_PAY');
  FPayNegative := (vSF = '1');
end;

procedure TPaymentEditFrm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    bbOkClick(Sender);
end;

procedure TPaymentEditFrm.FormShow(Sender: TObject);
Begin
  bbOk.Visible := dmMain.AllowedAction(rght_Pays_full); // полный доступ
end;

procedure TPaymentEditFrm.SetPayID(Value: Integer);
begin
  FPayment_id := Value;
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Text := 'select PAYMENT_SRV, PAY_TYPE_STR from PAYMENT where (PAYMENT_ID = :PAYMENT_ID)';
      ParamByName('PAYMENT_ID').AsInt64 := FPayment_id;
      Transaction.StartTransaction;
      ExecQuery;
      if FPaymentSRV then begin
        if not FldByName['PAYMENT_SRV'].IsNull then
          luPaymentSrv.Value := FldByName['PAYMENT_SRV'].AsInteger;
      end;
      if not FldByName['PAY_TYPE_STR'].IsNull then
        cbbPayTypeStr.Text := FldByName['PAY_TYPE_STR'].AsString;
      Transaction.Commit;
      Close;
    finally
      Free;
    end;
end;

procedure TPaymentEditFrm.bbOkClick(Sender: TObject);
begin
  if EditPayment then
    ModalResult := mrOk
  else
    ShowMessage(rsErrorEdit);
end;

procedure TPaymentEditFrm.dePaySumChange(Sender: TObject);
begin
  bbOk.Enabled := ((cr.CUSTOMER_ID > -1) and ((dePaySum.Value > 0) or ((dePaySum.Value < 0) and FPayNegative)));
end;

procedure TPaymentEditFrm.edCodeChange(Sender: TObject);
begin
  FindCustomer('', edCode.Text, -1);
end;

function TPaymentEditFrm.EditPayment: Boolean;
begin
  Result := false;
  if (not dmMain.AllowedAction(rght_Pays_full)) then
    exit; // полный доступ
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Clear;
      SQL.Add('update PAYMENT set               ');
      SQL.Add('  CUSTOMER_ID = :CUSTOMER_ID     ');
      SQL.Add('  , PAYMENT_SRV = :PAYMENT_SRV   ');
      SQL.Add('  , PAY_SUM = :PAY_SUM           ');
      SQL.Add('  , NOTICE = :NOTICE             ');
      SQL.Add('  , FINE_SUM = :FINE_SUM         ');
      SQL.Add('  , PAY_TYPE_STR = :PAY_TYPE_STR ');
      SQL.Add('where PAYMENT_ID = :PAYMENT_ID   ');

      ParamByName('CUSTOMER_ID').AsInt64 := cr.CUSTOMER_ID;
      ParamByName('PAYMENT_ID').AsInt64 := FPayment_id;
      ParamByName('PAY_SUM').AsCurrency := dePaySum.Value;
      ParamByName('NOTICE').AsString := mmoNotice.Lines.Text;

      if (VarIsNumeric(edtFine.Value) and FFine) then
        ParamByName('FINE_SUM').AsCurrency := edtFine.Value
      else
        ParamByName('FINE_SUM').AsCurrency := 0;

      if FPaymentSRV then begin
        if VarIsNumeric(luPaymentSrv.Value) then
          ParamByName('PAYMENT_SRV').AsInteger := luPaymentSrv.Value
        else
          ParamByName('PAYMENT_SRV').IsNull := true;
      end
      else
        ParamByName('PAYMENT_SRV').IsNull := true;

      if cbbPayTypeStr.Text <> '' then
        ParamByName('PAY_TYPE_STR').AsString := cbbPayTypeStr.Text
      else
        ParamByName('PAY_TYPE_STR').IsNull := true;

      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      Close;
      Result := true;
    finally
      Free;
    end;

end;

procedure TPaymentEditFrm.edLicevoyChange(Sender: TObject);
begin
  FindCustomer(edLicevoy.Text, '', -1);
end;

end.
