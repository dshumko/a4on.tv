unit PaymentEditForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.StrUtils,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  DBCtrlsEh, FIBQuery, pFIBQuery, DBLookupEh, FIBDataSet, pFIBDataSet, DBGridEh, A4onTypeUnit,
  CustomerInfoFrame;

type
  TPaymentEditFrm = class(TForm)
    pnlAbonent: TPanel;
    pnlSearchAbonent: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    edCode: TEdit;
    edLicevoy: TEdit;
    pnlButtons: TPanel;
    lblPaySum: TLabel;
    dePaySum: TDBNumberEditEh;
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
    cbbPayTypeStr: TDBLookupComboboxEh;
    srcPT: TDataSource;
    dsPT: TpFIBDataSet;
    ednItogo: TDBNumberEditEh;
    lbl2: TLabel;
    pnlLCPS: TPanel;
    lbl11: TLabel;
    ednLCPS: TDBNumberEditEh;
    pnl1: TPanel;
    mmoNotice: TDBMemoEh;
    pnlTM: TPanel;
    CustomerInfoFrm: TCustomerInfoFrm;
    procedure FormShow(Sender: TObject);
    procedure dePaySumChange(Sender: TObject);
    procedure edLicevoyChange(Sender: TObject);
    procedure edCodeChange(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mmoNoticeChange(Sender: TObject);
  private
    { Private declarations }
    FPayment_id: Integer;
    cr: TCustomerInfo;
    FPaymentSRV: Boolean;
    FFine: Boolean;
    FShowLCPS: Boolean;
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

uses
  PrjConst, DM;

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
  bbOk.Enabled := false;

  cr := dmMain.FindCustomer(lic, code, id);
  CustomerInfoFrm.Customer := cr;
  CustomerInfoFrm.MakeHtml;

  if ((cr.CUSTOMER_ID > -1) and (edLicevoy.Text = '')) then
  begin
    edLicevoy.OnChange := nil;
    edLicevoy.Text := cr.Account_No;
    edLicevoy.OnChange := edLicevoyChange;
  end;

  bbOk.Enabled := ((cr.CUSTOMER_ID > -1) and (dePaySum.Value > 0));
end;

procedure TPaymentEditFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsPT.Close;
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

  vSF := dmMain.GetSettingsValue('SHOW_LCPS');
  FShowLCPS := (vSF = '1');
  pnlLCPS.Visible := FShowLCPS;

  dsPT.Open;
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

procedure TPaymentEditFrm.mmoNoticeChange(Sender: TObject);
begin
  bbOk.Enabled := ((cr.CUSTOMER_ID > -1) and ((dePaySum.Value > 0) or ((dePaySum.Value < 0) and FPayNegative)));
end;

procedure TPaymentEditFrm.SetPayID(Value: Integer);
begin
  FPayment_id := Value;
  with TpFIBQuery.Create(Nil) do
    try
      SQL.Text := 'select PAYMENT_SRV, PAY_TYPE_STR, LCPS from PAYMENT where payment_id = :payment_id';
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      ParamByName('PAYMENT_ID').AsInt64 := FPayment_id;
      Transaction.StartTransaction;
      ExecQuery;
      if FPaymentSRV and (not FldByName['PAYMENT_SRV'].IsNull) then
        luPaymentSrv.Value := FldByName['PAYMENT_SRV'].AsInteger;
      if not FldByName['PAY_TYPE_STR'].IsNull then
        cbbPayTypeStr.Value := FldByName['PAY_TYPE_STR'].AsString;
      if FShowLCPS and (not FldByName['LCPS'].IsNull) then
        ednLCPS.Value := FldByName['LCPS'].AsCurrency;
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
var
  f: Double;
begin
  bbOk.Enabled := ((cr.CUSTOMER_ID > -1) and ((dePaySum.Value > 0) or ((dePaySum.Value < 0) and FPayNegative)));
  ednItogo.Value := 0;
  try
    f := dePaySum.Value;
  except
    f := 0;
  end;
  ednItogo.Value := ednItogo.Value + f;
  try
    f := edtFine.Value;
  except
    f := 0;
  end;
  ednItogo.Value := ednItogo.Value + f;
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
      if FShowLCPS then
        SQL.Add('  , LCPS = :LCPS               ');
      SQL.Add('where PAYMENT_ID = :PAYMENT_ID   ');

      ParamByName('CUSTOMER_ID').AsInt64 := cr.CUSTOMER_ID;
      ParamByName('PAYMENT_ID').AsInt64 := FPayment_id;
      ParamByName('PAY_SUM').AsCurrency := dePaySum.Value;
      ParamByName('NOTICE').AsString := mmoNotice.Lines.Text;

      if (VarIsNumeric(edtFine.Value) and FFine) then
        ParamByName('FINE_SUM').AsCurrency := edtFine.Value
      else
        ParamByName('FINE_SUM').AsCurrency := 0;

      if FPaymentSRV then
      begin
        if VarIsNumeric(luPaymentSrv.Value) then
          ParamByName('PAYMENT_SRV').AsInteger := luPaymentSrv.Value
        else
          ParamByName('PAYMENT_SRV').IsNull := true;
      end
      else
        ParamByName('PAYMENT_SRV').IsNull := true;

      if cbbPayTypeStr.Text <> '' then
        ParamByName('PAY_TYPE_STR').AsString := cbbPayTypeStr.Value
      else
        ParamByName('PAY_TYPE_STR').IsNull := true;

      if FShowLCPS then
        ParamByName('LCPS').AsString := ednLCPS.Value;

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
