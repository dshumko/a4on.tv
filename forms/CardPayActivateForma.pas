unit CardPayActivateForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls,
  DBCtrlsEh, DBLookupEh, OkCancel_frame, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, DBGridEh, A4onTypeUnit;

type
  TfmCardPayActivate = class(TForm)
    pnl1: TPanel;
    dsStreets: TpFIBDataSet;
    srcStreet: TDataSource;
    dsHomes: TpFIBDataSet;
    srcHouse: TDataSource;
    grpCustomer: TGroupBox;
    lbl1: TLabel;
    edtLicevoy: TEdit;
    lbl2: TLabel;
    edtCode: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    grp2: TGroupBox;
    mmoAbonent: TDBMemoEh;
    okcnclfrm: TOkCancelFrame;
    grp3: TGroupBox;
    lbl3: TLabel;
    LupStreets: TDBLookupComboboxEh;
    lbl4: TLabel;
    LupHOUSE: TDBLookupComboboxEh;
    lbl5: TLabel;
    edtFLAT_NO: TDBEditEh;
    btnFind: TButton;
    qActivate: TpFIBQuery;
    pnl2: TPanel;
    lbl9: TLabel;
    srcCardPay: TDataSource;
    pnlCard: TPanel;
    grpCard: TGroupBox;
    dsCardSerial: TpFIBDataSet;
    srcCardSerial: TDataSource;
    cbSerialSerials: TDBLookupComboboxEh;
    lbl10: TLabel;
    lbl11: TLabel;
    edtNUMBER: TEdit;
    lblPIN: TLabel;
    edtPIN: TEdit;
    btnCardFind: TButton;
    pnl3: TPanel;
    lbl8: TLabel;
    dePayDate: TDBDateTimeEditEh;
    lblSUMMA: TLabel;
    procedure btnFindClick(Sender: TObject);
    procedure edtLicevoyExit(Sender: TObject);
    procedure edtCodeExit(Sender: TObject);
    procedure LupStreetsEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure okcnclfrmbbOkClick(Sender: TObject);
    procedure edtNUMBERExit(Sender: TObject);
    procedure btnCardFindClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    cr: TCustomerInfo;
    Card_id: Integer;
    fullAccess: Boolean;
    // CanAddPayment : boolean;
    function FindCustomer(const lic, code: string; const id: Integer): Integer;
    function FindCard(aCard_ID: Integer): Integer;
  public
    { Public declarations }
  end;

function CardPayActivate(aCard_ID: Integer; aCUSTOMER_ID: Integer): Boolean;

implementation

uses
  PrjConst, DM;

{$R *.dfm}

function CardPayActivate(aCard_ID: Integer; aCUSTOMER_ID: Integer): Boolean;
var
  tmpstr: string;
  vfullAccess, vCanAddPayment: Boolean;
begin
  result := false;
  vfullAccess := dmMain.AllowedAction(rght_Pays_full);
  vCanAddPayment := dmMain.AllowedAction(rght_Pays_add);

  // если неразрешено добавлять платежи, то выходим
  if not(vfullAccess or vCanAddPayment) then
    Exit;

  with TfmCardPayActivate.Create(Application) do
    try
      Card_id := aCard_ID;
      if (aCard_ID <> -1) then
      begin
        pnlCard.Visible := false;
      end
      else
      begin
        tmpstr := dmMain.GetSettingsValue('CP_PIN_LEN');
        lblPIN.Visible := (tmpstr <> '0');
        edtPIN.Visible := (tmpstr <> '0');
        pnlCard.Visible := True;
        dsCardSerial.Open;
      end;
      cr.CUSTOMER_ID := -1;
      if (aCUSTOMER_ID <> -1) then
      begin
        FindCustomer('', '', aCUSTOMER_ID);
        grpCustomer.Visible := cr.CUSTOMER_ID = -1;
      end
      else
        grpCustomer.Visible := True;

      if (dmMain.GetIniValue('SET_AS_CURRENT_DATE') <> '0') then
        dePayDate.Value := NOW;

      if ShowModal = mrOk then
      begin
        qActivate.ParamByName('CARD_ID').AsInteger := Card_id;
        qActivate.ParamByName('PAY_DATE').AsDate := dePayDate.Value;
        qActivate.ExecQuery;
        qActivate.Transaction.Commit;
        result := True;
      end;
    finally
      free
    end;
end;

procedure TfmCardPayActivate.btnFindClick(Sender: TObject);
var
  i: Integer;
begin
  if not varIsNull(LupHOUSE.Value) then
    with TpFIBQuery.Create(Nil) do
      try
        i := -1;
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        SQL.Text := 'select c.customer_id from customer c where c.house_id = ' + IntToStr(LupHOUSE.Value);
        if not varIsNull(edtFLAT_NO.Value) then
          SQL.Add(' and c.flat_no =''' + edtFLAT_NO.Value + '''');
        Transaction.StartTransaction;
        ExecQuery;
        if not EOF then
          i := FieldByName('customer_id').Value;
        Close;
        Transaction.Commit;
        FindCustomer('', '', i);
      finally
        free;
      end;
end;

function TfmCardPayActivate.FindCustomer(const lic, code: string; const id: Integer): Integer;
var
  s: string;
begin
  okcnclfrm.bbOk.Enabled := false;
  cr := dmMain.FindCustomer(lic, code, id);
  result := cr.CUSTOMER_ID;
  mmoAbonent.Lines.Clear;
  if cr.CUSTOMER_ID = -1 then
  begin
    mmoAbonent.Lines.Text := rsNOT_FOUND_CUST;
    Exit;
  end;

  okcnclfrm.bbOk.Enabled := True and (Card_id <> -1);

  s := ' ' + rsACCOUNT + ' ' + cr.Account_no + ' ' + rsCODE + ' ' + cr.cust_code;
  mmoAbonent.Lines.Add(s);
  if dmMain.AllowedAction(rght_Programm_ViewMoney) then
  begin
    s := ' ' + rsSALDO + ' ' + floatToStr(cr.Debt_sum);
    mmoAbonent.Lines.Add(s);
  end;
  s := cr.FIO;
  mmoAbonent.Lines.Add(s);
  s := Format(rsPrintCheckAdr, [cr.Street + rsEOL, cr.HOUSE_NO, cr.flat_No]);
  mmoAbonent.Lines.Add(s);
  qActivate.ParamByName('CUSTOMER_ID').AsInteger := cr.CUSTOMER_ID;
end;

function TfmCardPayActivate.FindCard(aCard_ID: Integer): Integer;
begin
  okcnclfrm.bbOk.Enabled := false;
  result := -1;
  Card_id := -1;
  lblSUMMA.Caption := '';
  if (aCard_ID = -1) then
    if ((not VarIsNumeric(cbSerialSerials.Value)) or (edtNUMBER.Text = '') or ((edtPIN.Text = '') and edtPIN.Visible))
    then
      Exit;
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Text := 'SELECT Card_Id, Card_State, Expiration_Date, Card_Nominal FROM Cards_Prepay WHERE ';
      if aCard_ID = -1 then
      begin
        SQL.Text := SQL.Text + ' Card_Serial = :cs and Card_Number = :cn ';
        if edtPIN.Visible then
        begin
          SQL.Text := SQL.Text + ' and Card_Pin = :cp ';
          ParamByName('cp').AsString := edtPIN.Text;
        end;
        ParamByName('cs').AsInt64 := cbSerialSerials.Value;
        ParamByName('cn').AsString := edtNUMBER.Text;
      end
      else
      begin
        SQL.Text := SQL.Text + ' Card_Id = :ci ';
        ParamByName('ci').AsInt64 := aCard_ID;
      end;
      Transaction.StartTransaction;
      ExecQuery;
      if not EOF then
      begin
        lblSUMMA.Caption := FieldByName('Card_Nominal').AsString;

        Card_id := FieldByName('Card_Id').Value;
        if FieldByName('Expiration_Date').AsDate < NOW then
        begin
          Card_id := -1;
          lblSUMMA.Caption := rsPaymentCardExpired;
        end;

        if FieldByName('Card_State').AsInteger <> 0 then
        begin
          Card_id := -1;
          lblSUMMA.Caption := rsPayCardActivated;
        end;

      end
      else
        lblSUMMA.Caption := rsPayCardNotFound;
      Close;
      Transaction.Commit;
    finally
      free;
    end;

  if Card_id = -1 then
    Exit
  else
    dePayDate.SetFocus;

  okcnclfrm.bbOk.Enabled := True and (cr.CUSTOMER_ID <> -1);
end;

procedure TfmCardPayActivate.edtLicevoyExit(Sender: TObject);
begin
  if edtLicevoy.Text <> '' then
  begin
    FindCustomer(edtLicevoy.Text, '', -1);
    edtCode.Text := '';
  end
  else
    edtCode.SetFocus;
end;

procedure TfmCardPayActivate.edtNUMBERExit(Sender: TObject);
begin
  FindCard(-1);
end;

procedure TfmCardPayActivate.edtCodeExit(Sender: TObject);
begin
  if edtCode.Text <> '' then
  begin
    FindCustomer('', edtCode.Text, -1);
    edtLicevoy.Text := '';
  end;
end;

procedure TfmCardPayActivate.LupStreetsEnter(Sender: TObject);
begin
  dsStreets.Open;
  dsHomes.Open;
end;

procedure TfmCardPayActivate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsStreets.Active Then
    dsStreets.Close;
  if dsHomes.Active then
    dsHomes.Close;
end;

procedure TfmCardPayActivate.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) and (okcnclfrm.bbOk.Enabled) then
    okcnclfrmbbOkClick(Sender);
end;

procedure TfmCardPayActivate.FormShow(Sender: TObject);
begin
  FindCard(Card_id);
  if grpCustomer.Visible then
    edtLicevoy.SetFocus;
  if pnlCard.Visible then
    cbSerialSerials.SetFocus;
end;

procedure TfmCardPayActivate.okcnclfrmbbOkClick(Sender: TObject);
begin
  if varIsNull(dePayDate.Value) then
  begin
    ModalResult := mrNone;
    dePayDate.SetFocus;
  end
  else if not fullAccess then
    if (dePayDate.Value < dmMain.CurrentMonth) then
    begin
      ModalResult := mrNone;
      dePayDate.SetFocus;
    end
end;

procedure TfmCardPayActivate.btnCardFindClick(Sender: TObject);
begin
  FindCard(-1);
end;

end.
