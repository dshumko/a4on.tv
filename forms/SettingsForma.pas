unit SettingsForma;

interface

{$I defines.inc}

uses
  Winapi.Windows,
  System.Classes, System.SysUtils, System.Variants,
  Data.DB,
  Vcl.Menus, Vcl.Controls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.Forms, Vcl.Graphics, Vcl.Dialogs,
  FIBQuery, pFIBQuery, OkCancel_frame, FIBDataSet, pFIBDataSet, DBCtrlsEh, PrjConst, FIBDatabase, pFIBDatabase,
  DBGridEh, DBLookupEh;

type
  TSettingsForm = class(TForm)
    Query: TpFIBQuery;
    OkCancelFrame1: TOkCancelFrame;
    select: TpFIBDataSet;
    pgSettings: TPageControl;
    tsPayment: TTabSheet;
    cbPaymentSrv: TCheckBox;
    cbNegativePay: TCheckBox;
    cbCreatePayDoc: TCheckBox;
    lbl1: TLabel;
    edtBC: TEdit;
    btnBarSettings: TButton;
    cbFine: TCheckBox;
    grpFine: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    FinePercent: TDBNumberEditEh;
    FineMonth: TDBNumberEditEh;
    FineDay: TDBNumberEditEh;
    btnCashReg: TButton;
    tsLAN: TTabSheet;
    Label10: TLabel;
    cbBilling: TDBComboBoxEh;
    tsGlobal: TTabSheet;
    tsVisual: TTabSheet;
    chkBalansSaldo: TCheckBox;
    Label1: TLabel;
    FEE: TDBNumberEditEh;
    cbPersonalTarrif: TCheckBox;
    Label2: TLabel;
    DOLG: TDBNumberEditEh;
    pnl1: TPanel;
    Label15: TLabel;
    lstSettings: TListBox;
    Label19: TLabel;
    Label20: TLabel;
    pnlBilling: TPanel;
    Label12: TLabel;
    BillIP: TDBEditEh;
    Label11: TLabel;
    BillPort: TDBNumberEditEh;
    billSSL: TCheckBox;
    Label13: TLabel;
    BillLogin: TDBEditEh;
    Label14: TLabel;
    billPass: TDBEditEh;
    lblPP: TLabel;
    edtRP: TDBNumberEditEh;
    chkAddTarif: TCheckBox;
    grpDisc: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    ed3M: TDBNumberEditEh;
    ed6M: TDBNumberEditEh;
    ed12M: TDBNumberEditEh;
    chkPayDiscount: TCheckBox;
    chkIPTVPacket: TCheckBox;
    tsComm: TTabSheet;
    gbMail: TGroupBox;
    lbl2: TLabel;
    lbl5: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    grp1: TGroupBox;
    chkEMAIL_REQ: TCheckBox;
    pnlSMSUtils: TPanel;
    pnlSMSPhone: TPanel;
    pnlSMS: TPanel;
    lbl3: TLabel;
    cbSMStype: TDBComboBoxEh;
    lbl4: TLabel;
    MainMenu1: TMainMenu;
    edtCOM: TDBNumberEditEh;
    lbl6: TLabel;
    PopupMenu1: TPopupMenu;
    edtSMcommand: TEdit;
    pnlSMSAdd: TPanel;
    chkSMSLAT: TCheckBox;
    lbl8: TLabel;
    edtSMSLen: TDBNumberEditEh;
    grpLS: TGroupBox;
    chkDOG: TCheckBox;
    Label3: TLabel;
    AccNumber: TDBNumberEditEh;
    lblORDER: TLabel;
    edtORDER: TDBEditEh;
    pmLS: TPopupMenu;
    btnCodeLS: TButton;
    btnInetSettings: TButton;
    lbl7: TLabel;
    edReqTime: TDateTimePicker;
    chkBARDELZERRO: TCheckBox;
    lbl9: TLabel;
    chkBARADDPAY: TCheckBox;
    chkIgnoreDate: TCheckBox;
    tsA4ON: TTabSheet;
    edtA4Login: TDBEditEh;
    edtA4APIkey: TDBEditEh;
    Label4: TLabel;
    lbl10: TLabel;
    cbFormat: TDBComboBoxEh;
    lbl11: TLabel;
    chkConfirmReceipt: TDBCheckBoxEh;
    cbSSLType: TDBComboBoxEh;
    chkCopyToMe: TDBCheckBoxEh;
    edtSmtpPort: TDBNumberEditEh;
    lbl12: TLabel;
    cbAuth: TDBComboBoxEh;
    lbl13: TLabel;
    lbl14: TLabel;
    edSMTP: TDBEditEh;
    edtEMAIL: TDBEditEh;
    edtSMTPLogin: TDBEditEh;
    edtSMTPpass: TDBEditEh;
    cbbRates: TDBComboBoxEh;
    lblRates: TLabel;
    tsMobile: TTabSheet;
    lbl16: TLabel;
    edtGMAPI: TDBEditEh;
    btnGoApi: TButton;
    chkShowAllInCustomer: TCheckBox;
    chkHidePayAdd: TCheckBox;
    chkHidePayPrint: TCheckBox;
    chkBidNotice: TCheckBox;
    tsEquipment: TTabSheet;
    dsServices: TpFIBDataSet;
    srcCardAdd: TDataSource;
    trRead: TpFIBTransaction;
    srcCardDel: TDataSource;
    grpSrv: TGroupBox;
    cbbCardDel: TDBLookupComboboxEh;
    cbbCardAdd: TDBLookupComboboxEh;
    chkPersChennals: TCheckBox;
    chkPersPackets: TCheckBox;
    chkVlanRequired: TCheckBox;
    lbl18: TLabel;
    dsRQtype: TpFIBDataSet;
    cbbRQ_TO_POSITIVE: TDBLookupComboboxEh;
    srcRQtype: TDataSource;
    lbl19: TLabel;
    edtSUM_POSITIVE: TDBNumberEditEh;
    chkAddressEdit: TCheckBox;
    tsOther: TTabSheet;
    Label8: TLabel;
    edtPswdExpire: TDBNumberEditEh;
    grp2: TGroupBox;
    lbl17: TLabel;
    lbl15: TLabel;
    edtPhFmt: TDBEditEh;
    edtMphFmt: TDBEditEh;
    grp3: TGroupBox;
    lbl20: TLabel;
    lbl21: TLabel;
    edtCheckPassportN: TDBEditEh;
    edtCheckPersN: TDBEditEh;
    chkWHOwner: TCheckBox;
    chkWHExecutor: TCheckBox;
    lbl22: TLabel;
    edtIdleHoure: TDBNumberEditEh;
    chkComplex: TCheckBox;
    chkStrictMode: TCheckBox;
    lbl23: TLabel;
    edtKeyMVD: TDBEditEh;
    lbl24: TLabel;
    edtMapUrl: TDBEditEh;
    chkRWD: TCheckBox;
    chkLANAddr: TCheckBox;
    chkDelLanEq: TCheckBox;
    chkVlans4Home: TCheckBox;
    chkDisableVlan: TCheckBox;
    chkOnDisact: TCheckBox;
    chkDisablePortDict: TCheckBox;
    lbl181: TLabel;
    cbbRQ_TO_NEGATIVE: TDBLookupComboboxEh;
    chkSrvWorker: TCheckBox;
    chkFlatOwner: TCheckBox;
    chkNewContract: TCheckBox;
    lbl25: TLabel;
    dlgColor1: TColorDialog;
    edtColorDolg: TDBEditEh;
    edtColorOFF: TDBEditEh;
    edtColorOFFMONEY: TDBEditEh;
    edtColorWOSRVFONT: TDBEditEh;
    lbl251: TLabel;
    edtColorHLERROR: TDBEditEh;
    lbl252: TLabel;
    lbl253: TLabel;
    edtColorHLWARNING: TDBEditEh;
    lbl241: TLabel;
    edtMapHouseUrl: TDBEditEh;
    lbl242: TLabel;
    edtIPv6Url: TDBEditEh;
    edtCheckAccount: TDBEditEh;
    lblCheckAC: TLabel;
    lbl2421: TLabel;
    edtPayCheckUrl: TDBEditEh;
    procedure BillIPExit(Sender: TObject);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCashRegClick(Sender: TObject);
    procedure billPassChange(Sender: TObject);
    procedure cbBillingChange(Sender: TObject);
    procedure btnBarSettingsClick(Sender: TObject);
    procedure cbFineClick(Sender: TObject);
    procedure chkPayDiscountClick(Sender: TObject);
    procedure lstSettingsClick(Sender: TObject);
    procedure cbSMStypeChange(Sender: TObject);
    procedure btnCodeLSClick(Sender: TObject);
    procedure btnInetSettingsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGoApiClick(Sender: TObject);
    procedure edtColorEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edtColorWOSRVFONTEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edtColorOFFMONEYEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edtColorOFFEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edtColorWOSRVFONT1EditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edtColorHLERROREditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure edtColorHLWARNINGEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
    FLastAccount: integer;
    FPassChanged: boolean;
    FPageList: TStrings;
    // procedure SaveBilling;
    function CheckCashReg: boolean;
    function CheckInternetSetting: boolean;
    function CashRegSettings: boolean;
    procedure SaveSettingsStr(const name: string; const value: string = '');
    procedure SaveSettingsInt(const name: string; const value: integer = 0);
    procedure SaveSettingsBoolean(const name: string; const chBox: TCheckBox); overload;
    procedure SaveSettingsBoolean(const name: string; const chBox: TDBCheckBoxEh); overload;
    procedure SaveSettingsBoolean(const name: string; const Checked: boolean); overload;
    procedure miClick(Sender: TObject);
    function Internet: boolean;
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;

implementation

uses
  DM, AtrStrUtils, BarSettingForma, ibase, synacode, atrCmdUtils;

type
  TCashSettingsDialog = function(AppHandle: THandle; OPER: PWChar; OPER_PASS: PWChar): integer; stdcall;

  TDLLInternetSetting = function(DBName: PWChar; UserName: PWChar; Password: PWChar): integer; StdCall;

{$R *.dfm}

procedure TSettingsForm.SaveSettingsStr(const name: string; const value: string = '');
begin
  Query.SQL.Text := 'execute procedure set_settings(:name, :value)';
  Query.Transaction.StartTransaction;
  Query.ParamByName('name').AsString := name;
  Query.ParamByName('value').AsString := value;
  Query.ExecQuery;
  Query.Transaction.Commit;
end;

procedure TSettingsForm.SaveSettingsBoolean(const name: string; const Checked: boolean);
begin
  if Checked then
    SaveSettingsStr(name, '1')
  else
    SaveSettingsStr(name, '0');
end;

procedure TSettingsForm.SaveSettingsBoolean(const name: string; const chBox: TCheckBox);
begin
  SaveSettingsBoolean(name, chBox.Checked);
end;

procedure TSettingsForm.SaveSettingsBoolean(const name: string; const chBox: TDBCheckBoxEh);
begin
  SaveSettingsBoolean(name, chBox.Checked);
end;

procedure TSettingsForm.SaveSettingsInt(const name: string; const value: integer = 0);
var
  s: string;
begin
  try
    s := IntToStr(value);
  except
    s := '0';
  end;
  SaveSettingsStr(name, s);
end;

{
  procedure TSettingsForm.SaveBilling;
  var
  s: string;
  begin
  SaveSettingsInt('USED_BILLING', cbBilling.value);
  SaveSettingsStr('BILLING_IP', BillIP.value);
  SaveSettingsInt('BILLING_PORT', BillPort.value);
  if not VarIsClear(edtRP.value) then
  SaveSettingsInt('UTM_RP_ID', edtRP.value)
  else
  begin
  Query.SQL.Text := 'execute procedure set_settings(''' + name + ''', '''')';
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
  end;
  SaveSettingsStr('BILLING_LOGIN', BillLogin.value);
  try
  s := billPass.value;
  except
  s := '';
  end;
  if PassChanged then
  s := EncodeBase64(s);
  SaveSettingsStr('BILLING_SECRET', s);

  if billSSL.Checked then
  s := '1'
  else
  s := '0';
  SaveSettingsStr('BILLING_SSL', s);

  if chkAddTarif.Checked then
  s := '1'
  else
  s := '0';
  SaveSettingsStr('BILLING_TP', s);

  end;
}
procedure TSettingsForm.cbBillingChange(Sender: TObject);
var
  i: integer;
begin
  i := cbBilling.value;
  pnlBilling.Visible := not(i in [0, 3]);
  billSSL.Visible := (i = 2);
  chkAddTarif.Visible := (i = 2);
  edtRP.Visible := (i = 2);
  lblPP.Visible := (i = 2);
end;

procedure TSettingsForm.cbFineClick(Sender: TObject);
begin
  FinePercent.Enabled := cbFine.Checked;
  FineMonth.Enabled := cbFine.Checked;
  FineDay.Enabled := cbFine.Checked;
end;

procedure TSettingsForm.cbSMStypeChange(Sender: TObject);
begin
  pnlSMSPhone.Visible := (cbSMStype.value = 1);
  pnlSMSUtils.Visible := (cbSMStype.value = 2);
  pnlSMSAdd.Visible := (cbSMStype.value <> 0);
end;

procedure TSettingsForm.BillIPExit(Sender: TObject);
begin
  if (Sender as TDBEditEh).Text = '' then
    Exit;

  if not CheckIP((Sender as TDBEditEh).Text) then
  begin
    ShowMessage(rsIPIncorrect);
    (Sender as TDBEditEh).SetFocus;
  end;
end;

procedure TSettingsForm.billPassChange(Sender: TObject);
begin
  FPassChanged := True;
end;

procedure TSettingsForm.btnBarSettingsClick(Sender: TObject);
begin
  With TBarSettingForm.Create(application) do
  begin
    CodeType := 0;
    BarCodeFormat := edtBC.Text;
    if showmodal = mrOk then
      edtBC.Text := BarCodeFormat;
  end;
end;

procedure TSettingsForm.btnCashRegClick(Sender: TObject);
begin
  CashRegSettings;
end;

procedure TSettingsForm.btnCodeLSClick(Sender: TObject);
begin
  With TBarSettingForm.Create(application) do
  begin
    CodeType := 1;
    BarCodeFormat := edtORDER.Text;
    if showmodal = mrOk then
      edtORDER.Text := BarCodeFormat;
  end;
end;

procedure TSettingsForm.btnGoApiClick(Sender: TObject);
var
  s: string;
begin
  s := 'https://developers.google.com/maps/documentation/javascript/get-api-key#key';
  atrCmdUtils.ShellExecute(application.MainForm.Handle, '', s);
end;

procedure TSettingsForm.btnInetSettingsClick(Sender: TObject);
begin
  Internet;
end;

procedure TSettingsForm.OkCancelFrame1bbOkClick(Sender: TObject);
var
  i, j: integer;
  s: string;
  cr: TCursor;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    if (dmMain.AllowedAction(rght_Programm_Settings)) then
    begin
      // saveBilling;

      SaveSettingsStr('A4LOGIN', edtA4Login.Text);
      SaveSettingsStr('A4APIKEY', edtA4APIkey.Text);
      SaveSettingsStr('FORMATN', cbFormat.Text);
      SaveSettingsStr('REG_PASSN', edtCheckPassportN.Text);
      SaveSettingsStr('REG_PERSN', edtCheckPersN.Text);

      SaveSettingsStr('KEY_MVD', edtKeyMVD.Text);
      SaveSettingsStr('MAP_URL', edtMapUrl.Text);
      SaveSettingsStr('MAP_HOUSE_URL', edtMapHouseUrl.Text);
      SaveSettingsInt('FEE_ROUND', FEE.value);
      SaveSettingsInt('DOLG', DOLG.value);
      SaveSettingsInt('PSWD_EXPIRE', edtPswdExpire.value);
      SaveSettingsInt('IDLEHOURS', edtIdleHoure.value);
      SaveSettingsStr('IPV6GETURL', edtIPv6Url.Text);
      SaveSettingsStr('PAY_CHECK_URL', edtPayCheckUrl.Text);

      SaveSettingsStr('BARCODE', edtBC.Text);
      SaveSettingsBoolean('BARNODELZERRO', chkBARDELZERRO);
      SaveSettingsBoolean('BARADDPAY', chkBARADDPAY);
      SaveSettingsBoolean('SHOWALLCUSTPAYS', chkShowAllInCustomer);
      SaveSettingsBoolean('HIDEPAYADD', chkHidePayAdd);
      SaveSettingsBoolean('HIDEPAYPRINT', chkHidePayPrint);
      SaveSettingsBoolean('BIDEDITNOTICE', chkBidNotice);

      SaveSettingsStr('SMTP', edSMTP.Text);
      SaveSettingsStr('SMTP_PORT', edtSmtpPort.Text);
      SaveSettingsStr('SMTP_LOGIN', edtSMTPLogin.Text);
      SaveSettingsStr('SMTP_PASS', edtSMTPpass.Text);
      SaveSettingsStr('EMAIL', edtEMAIL.Text);
      SaveSettingsStr('SMTP_AUTH', cbAuth.Text);
      SaveSettingsStr('SMTP_SSL', cbSSLType.Text);
      SaveSettingsStr('PHONE_FMT', edtPhFmt.Text);
      SaveSettingsStr('MOBILE_FMT', edtMphFmt.Text);
      if VarIsNull(cbbRates.value) then
        SaveSettingsStr('RATES_BANK', 'CBR')
      else
        SaveSettingsStr('RATES_BANK', cbbRates.value);
      SaveSettingsStr('GMAPI', edtGMAPI.Text);

      SaveSettingsBoolean('SMTP_2ME', chkCopyToMe);
      SaveSettingsBoolean('SMTP_CONF', chkConfirmReceipt);

      SaveSettingsStr('REQUEST_NEXT_DAY_TIME', FormatDateTime('hh:nn:ss', edReqTime.DateTime));
      SaveSettingsBoolean('REQUEST_SKIP_WEEKEND', chkRWD);

      try
        s := ColorToString(edtColorDolg.Font.Color);
      except
        s := 'clRed';
      end;
      SaveSettingsStr('COLOR_DOLG', s);

      try
        s := ColorToString(edtColorOFF.Font.Color);
      except
        s := 'clWindowText';
      end;

      SaveSettingsStr('COLOR_OFF', s);
      try
        s := ColorToString(edtColorOFFMONEY.Font.Color);
      except
        s := 'clSilver';
      end;

      SaveSettingsStr('COLOR_OFFMONEY', s);
      try
        s := ColorToString(edtColorWOSRVFONT.Font.Color);
      except
        s := 'clWindowText';
      end;
      SaveSettingsStr('ROW_HL_WITHOUTSRV', s);

      try
        s := ColorToString(edtColorHLERROR.Color);
      except
        s := '$006666FF';
      end;
      SaveSettingsStr('ROW_HL_ERROR', s);

      try
        s := ColorToString(edtColorHLWARNING.Color);
      except
        s := '$0066FFFF';
      end;
      SaveSettingsStr('ROW_HL_WARNING', s);

      SaveSettingsBoolean('EMAIL_REQ', chkEMAIL_REQ);
      SaveSettingsBoolean('PERSONEL_TARIF', cbPersonalTarrif);
      SaveSettingsBoolean('COMPLEX', chkComplex);
      SaveSettingsBoolean('ON_DISACT', chkOnDisact);
      SaveSettingsBoolean('IGNORE_CONTRACT', chkIgnoreDate);
      SaveSettingsBoolean('STRICT_MODE', chkStrictMode);
      SaveSettingsBoolean('IPTV_PACKET', chkIPTVPacket);
      SaveSettingsBoolean('VLAN_REQUIRED', chkVlanRequired);
      SaveSettingsBoolean('LAN_ADDRES', chkLANAddr);
      SaveSettingsBoolean('LAN_DELEQPMNT', chkDelLanEq);
      SaveSettingsBoolean('LAN_VALAN4HOME', chkVlans4Home);
      SaveSettingsBoolean('LAN_VALANDISABLE', chkDisableVlan);
      SaveSettingsBoolean('LAN_PORTDICTDISABLE', chkDisablePortDict);

      SaveSettingsBoolean('PAYMENT_SRV', cbPaymentSrv);
      SaveSettingsBoolean('NEGATIVE_PAY', cbNegativePay);
      SaveSettingsStr('ACCOUNT_FORMAT', edtORDER.Text);
      SaveSettingsBoolean('ACCOUNT_DOG', chkDOG);
      SaveSettingsStr('ACCOUNT_CHK', edtCheckAccount.Text);
      SaveSettingsBoolean('SAVE_SRV_WORKER', chkSrvWorker);
      SaveSettingsBoolean('FLAT_OWNER', chkFlatOwner);
      SaveSettingsBoolean('CAN_NEW_CONTRACT', chkNewContract);

      if FLastAccount <> AccNumber.value then
      begin
        try
          i := AccNumber.value;
          s := IntToStr(i);
          Query.SQL.Text := 'SET GENERATOR GEN_ACCOUNT_NO TO ' + s;
          Query.Transaction.StartTransaction;
          Query.ExecQuery;
          Query.Transaction.Commit;
        except
          s := '0';
        end;
      end;
      // пеня
      SaveSettingsBoolean('SHOW_FINE', cbFine);

      try
        j := FinePercent.value * 100;
        i := j mod 100;
        j := j div 100;
        s := IntToStr(j) + '.' + IntToStr(i);
      except
        s := '0';
      end;
      SaveSettingsStr('FINE_PERCENT', s);

      SaveSettingsInt('FINE_DAYS', FineDay.value);

      try
        s := IntToStr(FineMonth.value);
      except
        s := '1';
      end;
      SaveSettingsStr('FINE_MONTH', s);

      SaveSettingsBoolean('CREATE_PD', cbCreatePayDoc);
      SaveSettingsBoolean('SHOW_AS_BALANCE', chkBalansSaldo);
      SaveSettingsBoolean('PAY_DISCOUNT', chkPayDiscount);

      try
        j := ed3M.value * 10000;
        i := j mod 10000;
        j := j div 10000;
        s := IntToStr(j) + '.' + IntToStr(i);
      except
        s := '1';
      end;
      SaveSettingsStr('DISCOUNT_3', s);

      try
        j := ed6M.value * 10000;
        i := j mod 10000;
        j := j div 10000;
        s := IntToStr(j) + '.' + IntToStr(i);
      except
        s := '1';
      end;
      SaveSettingsStr('DISCOUNT_6', s);

      try
        j := ed12M.value * 10000;
        i := j mod 10000;
        j := j div 10000;
        s := IntToStr(j) + '.' + IntToStr(i);
      except
        s := '1';
      end;
      SaveSettingsStr('DISCOUNT_12', s);

      if VarIsNull(cbbCardAdd.KeyValue) then
        SaveSettingsStr('CARD_ADD_SRV', '')
      else
        SaveSettingsStr('CARD_ADD_SRV', cbbCardAdd.KeyValue);

      if VarIsNull(cbbCardDel.KeyValue) then
        SaveSettingsStr('CARD_DEL_SRV', '')
      else
        SaveSettingsStr('CARD_DEL_SRV', cbbCardDel.KeyValue);

      if VarIsNull(cbbRQ_TO_POSITIVE.KeyValue) then
        SaveSettingsStr('RQ_TO_POSITIVE', '')
      else
        SaveSettingsStr('RQ_TO_POSITIVE', cbbRQ_TO_POSITIVE.KeyValue);

      if VarIsNull(cbbRQ_TO_NEGATIVE.KeyValue) then
        SaveSettingsStr('RQ_TO_NEGATIVE', '')
      else
        SaveSettingsStr('RQ_TO_NEGATIVE', cbbRQ_TO_NEGATIVE.KeyValue);

      if (edtSUM_POSITIVE.Text = '') then
        SaveSettingsStr('RQ_SUM_POSITIVE', '0')
      else
        SaveSettingsStr('RQ_SUM_POSITIVE', edtSUM_POSITIVE.value);

      SaveSettingsBoolean('PERS_CHANNEL', chkPersChennals);
      SaveSettingsBoolean('PERS_PACKETS', chkPersPackets);
      SaveSettingsBoolean('EX_ADDRESS_EDIT', chkAddressEdit);
      SaveSettingsBoolean('WH_REQ_OWNER', chkWHOwner);
      SaveSettingsBoolean('WH_REQ_EXECUTOR', chkWHExecutor);

      dmMain.GetSettingsValue('ReloadSettingsFromDB');
    end;
  except
    ModalResult := mrNone;
  end;
  Screen.Cursor := cr;
end;

function TSettingsForm.CheckInternetSetting: boolean;
var
  CashSettingsDialog: TDLLInternetSetting; // TInternetSetting;
  HLib: THandle;
begin
  result := False;
  if FileExists(ExtractFilePath(application.ExeName) + 'internet.dll') then
  begin
    HLib := 0;
    try
      HLib := LoadLibrary('internet.dll');
      if HLib > HINSTANCE_ERROR then
      begin
        CashSettingsDialog := GetProcAddress(HLib, 'Settings');
        if Assigned(CashSettingsDialog) then
          result := True;
      end
    finally
      if HLib > HINSTANCE_ERROR then
        FreeLibrary(HLib);
    end;
  end
end;

function TSettingsForm.CheckCashReg: boolean;
var
  CashSettingsDialog: TCashSettingsDialog;
  HLib: THandle;
begin
  result := False;
  if FileExists(ExtractFilePath(application.ExeName) + 'cashrgst.dll') then
  begin
    HLib := 0;
    try
      HLib := LoadLibrary('cashrgst.dll');
      if HLib > HINSTANCE_ERROR then
      begin
        CashSettingsDialog := GetProcAddress(HLib, 'CashSettingsDialog');
        if Assigned(CashSettingsDialog) then
          result := True;
      end
    finally
      if HLib > HINSTANCE_ERROR then
        FreeLibrary(HLib);
    end;
  end
end;

procedure TSettingsForm.chkPayDiscountClick(Sender: TObject);
begin
  ed3M.Enabled := chkPayDiscount.Checked;
  ed6M.Enabled := chkPayDiscount.Checked;
  ed12M.Enabled := chkPayDiscount.Checked;
end;

procedure TSettingsForm.edtColorEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dlgColor1.Color := edtColorDolg.Font.Color;
  if dlgColor1.Execute then begin
    edtColorDolg.Font.Color := dlgColor1.Color;
    edtColorDolg.Text := ColorToString(edtColorDolg.Font.Color);
  end;
  Handled := True;
end;

procedure TSettingsForm.edtColorHLERROREditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dlgColor1.Color := edtColorHLERROR.Color;
  if dlgColor1.Execute then begin
    edtColorHLERROR.Color := dlgColor1.Color;
    edtColorHLERROR.Text := ColorToString(edtColorHLERROR.Color);
  end;
  Handled := True;
end;

procedure TSettingsForm.edtColorHLWARNINGEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dlgColor1.Color := edtColorHLWARNING.Color;
  if dlgColor1.Execute then begin
    edtColorHLWARNING.Color := dlgColor1.Color;
    edtColorHLWARNING.Text := ColorToString(edtColorHLWARNING.Color);
  end;
  Handled := True;
end;

procedure TSettingsForm.edtColorOFFEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dlgColor1.Color := edtColorOFF.Font.Color;
  if dlgColor1.Execute then begin
    edtColorOFF.Font.Color := dlgColor1.Color;
    edtColorOFF.Text := ColorToString(edtColorOFF.Font.Color);
  end;
  Handled := True;
end;

procedure TSettingsForm.edtColorOFFMONEYEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dlgColor1.Color := edtColorOFFMONEY.Font.Color;
  if dlgColor1.Execute then begin
    edtColorOFFMONEY.Font.Color := dlgColor1.Color;
    edtColorOFFMONEY.Text := ColorToString(edtColorOFFMONEY.Font.Color);
  end;
  Handled := True;
end;

procedure TSettingsForm.edtColorWOSRVFONT1EditButtons0Click(
  Sender: TObject; var Handled: Boolean);
begin
  dlgColor1.Color := edtColorWOSRVFONT.Font.Color;
  if dlgColor1.Execute then begin
    edtColorWOSRVFONT.Font.Color := dlgColor1.Color;
    edtColorWOSRVFONT.Text := ColorToString(edtColorWOSRVFONT.Font.Color);
  end;
  Handled := True;
end;

procedure TSettingsForm.edtColorWOSRVFONTEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  dlgColor1.Color := edtColorWOSRVFONT.Font.Color;
  if dlgColor1.Execute then begin
    edtColorWOSRVFONT.Font.Color := dlgColor1.Color;
    edtColorWOSRVFONT.Text := ColorToString(edtColorWOSRVFONT.Font.Color);
  end;
  Handled := True;
end;

function TSettingsForm.CashRegSettings: boolean;
var
  CashSettingsDialog: TCashSettingsDialog;
  HLib: THandle;
  i: integer;
  OPER: string;
begin
  // напечатаем чек
  result := False;
  if FileExists(ExtractFilePath(application.ExeName) + 'cashrgst.dll') then
  begin
    HLib := 0;
    try
      HLib := LoadLibrary('cashrgst.dll');
      if HLib > HINSTANCE_ERROR then
      begin
        CashSettingsDialog := GetProcAddress(HLib, 'CashSettingsDialog');
        if Assigned(CashSettingsDialog) then
        begin
          OPER := dmMain.GetOperatorFIO;
          i := CashSettingsDialog(application.Handle, PWChar(OPER), PWChar(dmMain.CashBoxPSWD));

          result := (i > 0); // показали диалог
        end
        else
          ShowMessage(Format(rsErrorDll, ['cashrgst.dll']));
      end
      else
        ShowMessage(Format(rsErrorLoadDll, ['cashrgst.dll']));
    finally
      if HLib > HINSTANCE_ERROR then
        FreeLibrary(HLib);
    end;
  end
end;

procedure TSettingsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FPageList.Free;
  dsServices.Close;
  dsRQtype.Close;
end;

procedure TSettingsForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TSettingsForm.FormShow(Sender: TObject);
var
  f: TFormatSettings;
  s: string;
  i: integer;
  Global: boolean;
  val: TStringArray;
begin
  dsServices.Open;
  dsRQtype.Open;
  FPageList := TStringList.Create();
  Global := True;
  lstSettings.Items.Clear;
  for i := 0 to pgSettings.PageCount - 1 do
  begin
    pgSettings.Pages[i].TabVisible := False;
    pgSettings.Pages[i].Visible := Global;

    if pgSettings.Pages[i].name = tsLAN.name then
    begin
{$IFDEF LAN}
      tsLAN.Visible := Global;
{$ELSE}
      tsLAN.Visible := False;
{$ENDIF}
    end;

    if pgSettings.Pages[i].Visible then
    begin
      FPageList.Add(IntToStr(i));
      lstSettings.Items.Add(pgSettings.Pages[i].Caption);
    end;
  end;

  lstSettings.ItemIndex := 0;
  pgSettings.ActivePageIndex := 0;

  btnCashReg.Visible := CheckCashReg;
  btnInetSettings.Visible := CheckInternetSetting;

  cbBilling.value := 0;
  edtMapHouseUrl.Text := 'http://openstreetmap.ru/#mmap=19/%lat%/%lon%&map=19/%lat%/%lon%';

  if Global then
  begin
    select.Open;
    cbPersonalTarrif.Checked := False;
    chkPersPackets.Checked := True;

    for i := 0 to ComponentCount - 1 do
      if Components[i] is TDBNumberEditEh then
        (Components[i] as TDBNumberEditEh).value := 0;

    while not select.Eof do
    begin
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'STRICT_MODE' then
        chkStrictMode.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'A4LOGIN' then
        edtA4Login.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'A4APIKEY' then
        edtA4APIkey.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'FORMATN' then
        cbFormat.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'REG_PASSN' then
        edtCheckPassportN.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'REG_PERSN' then
        edtCheckPersN.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'KEY_MVD' then
        edtKeyMVD.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'MAP_URL' then
        edtMapUrl.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'IPV6GETURL' then
        edtIPv6Url.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'PAY_CHECK_URL' then
        edtPayCheckUrl.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'MAP_HOUSE_URL' then
        edtMapHouseUrl.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'FEE_ROUND' then
        FEE.value := select.FN('VAR_VALUE').AsInteger;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'DOLG' then
        DOLG.value := select.FN('VAR_VALUE').AsInteger;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'PERSONEL_TARIF' then
        cbPersonalTarrif.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'COMPLEX' then
        chkComplex.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'ON_DISACT' then
        chkOnDisact.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'IGNORE_CONTRACT' then
        chkIgnoreDate.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'IPTV_PACKET' then
        chkIPTVPacket.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'VLAN_REQUIRED' then
        chkVlanRequired.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'LAN_ADDRES' then
        chkLANAddr.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'LAN_DELEQPMNT' then
        chkDelLanEq.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'LAN_VALAN4HOME' then
        chkVlans4Home.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'LAN_VALANDISABLE' then
        chkDisableVlan.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'LAN_PORTDICTDISABLE' then
        chkDisablePortDict.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'PAYMENT_SRV' then
        cbPaymentSrv.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'ACCOUNT_FORMAT' then
        edtORDER.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'ACCOUNT_CHK' then
        edtCheckAccount.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'ACCOUNT_DOG' then
        chkDOG.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'PERS_CHANNEL' then
        chkPersChennals.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'PERS_PACKETS' then
        chkPersPackets.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'EX_ADDRESS_EDIT' then
        chkAddressEdit.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'WH_REQ_OWNER' then
        chkWHOwner.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'PSWD_EXPIRE' then
        edtPswdExpire.value := select.FN('VAR_VALUE').AsInteger;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'IDLEHOURS' then
        edtIdleHoure.value := select.FN('VAR_VALUE').AsInteger;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'WH_REQ_EXECUTOR' then
        chkWHExecutor.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'SAVE_SRV_WORKER' then
        chkSrvWorker.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'FLAT_OWNER' then
        chkFlatOwner.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'CAN_NEW_CONTRACT' then
        chkNewContract.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      // пеня
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'SHOW_FINE' then
        cbFine.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'FINE_PERCENT' then
      begin
        s := select.FN('VAR_VALUE').AsString;
        f.DecimalSeparator := '.';
        FinePercent.value := StrToFloat(s, f);
      end;

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'FINE_DAYS' then
        FineDay.value := select.FN('VAR_VALUE').AsInteger;

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'BARCODE' then
        edtBC.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'BARNODELZERRO' then
        chkBARDELZERRO.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'BARADDPAY' then
        chkBARADDPAY.Checked := (select.FN('VAR_VALUE').AsInteger = 1);

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'SHOWALLCUSTPAYS' then
        chkShowAllInCustomer.Checked := (select.FN('VAR_VALUE').AsInteger = 1);

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'HIDEPAYADD' then
        chkHidePayAdd.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'HIDEPAYPRINT' then
        chkHidePayPrint.Checked := (select.FN('VAR_VALUE').AsInteger = 1);

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'BIDEDITNOTICE' then
        chkBidNotice.Checked := (select.FN('VAR_VALUE').AsInteger = 1);

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'FINE_MONTH' then
        FineMonth.value := select.FN('VAR_VALUE').AsInteger;

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'CREATE_PD' then
        cbCreatePayDoc.Checked := (select.FN('VAR_VALUE').AsInteger = 1);

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'NEGATIVE_PAY' then
        cbNegativePay.Checked := (select.FN('VAR_VALUE').AsInteger = 1);

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'SHOW_AS_BALANCE' then
        chkBalansSaldo.Checked := (select.FN('VAR_VALUE').AsInteger = 1);

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'PAY_DISCOUNT' then
        chkPayDiscount.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      chkPayDiscountClick(Sender);

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'DISCOUNT_3' then
      begin
        s := select.FN('VAR_VALUE').AsString;
        f.DecimalSeparator := '.';
        ed3M.value := StrToFloat(s, f);
      end;

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'DISCOUNT_6' then
      begin
        s := select.FN('VAR_VALUE').AsString;
        f.DecimalSeparator := '.';
        ed6M.value := StrToFloat(s, f);
      end;

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'DISCOUNT_12' then
      begin
        s := select.FN('VAR_VALUE').AsString;
        f.DecimalSeparator := '.';
        ed12M.value := StrToFloat(s, f);
      end;

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'PHONE_FMT' then
        edtPhFmt.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'MOBILE_FMT' then
        edtMphFmt.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'RATES_BANK' then
        cbbRates.value := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'GMAPI' then
        edtGMAPI.Text := select.FN('VAR_VALUE').AsString;
      // email
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'SMTP' then
        edSMTP.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'SMTP_LOGIN' then
        edtSMTPLogin.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'EMAIL' then
        edtEMAIL.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'SMTP_PASS' then
        edtSMTPpass.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'SMTP_PORT' then
        edtSmtpPort.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'SMTP_AUTH' then
        cbAuth.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'SMTP_SSL' then
        cbSSLType.Text := select.FN('VAR_VALUE').AsString;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'SMTP_2ME' then
        chkCopyToMe.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'SMTP_CONF' then
        chkConfirmReceipt.Checked := (select.FN('VAR_VALUE').AsInteger = 1);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'EMAIL_REQ' then
        chkEMAIL_REQ.Checked := (select.FN('VAR_VALUE').AsInteger = 1);

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'COLOR_DOLG' then begin
        try
          edtColorDolg.Font.Color := StringToColor(select.FN('VAR_VALUE').AsString);
        Except
          edtColorDolg.Font.Color := clRed;
        end;
        edtColorDolg.Text := ColorToString(edtColorDolg.Font.Color);
      end;

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'COLOR_OFF' then begin
        try
          edtColorOFF.Font.Color := StringToColor(select.FN('VAR_VALUE').AsString);
        Except
          edtColorOFF.Font.Color := clWindowText;
        end;
        edtColorOFF.Text := ColorToString(edtColorOFF.Font.Color);
      end;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'COLOR_OFFMONEY' then begin
        try
          edtColorOFFMONEY.Font.Color := StringToColor(select.FN('VAR_VALUE').AsString);
        Except
          edtColorOFFMONEY.Font.Color := clWindowText;
        end;
        edtColorOFFMONEY.Text := ColorToString(edtColorOFFMONEY.Font.Color);
      end;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'ROW_HL_WITHOUTSRV' then begin
        try
          edtColorWOSRVFONT.Font.Color := StringToColor(select.FN('VAR_VALUE').AsString);
        Except
          edtColorWOSRVFONT.Font.Color := clWindowText;
        end;
        edtColorWOSRVFONT.Text := ColorToString(edtColorWOSRVFONT.Font.Color);
      end;

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'ROW_HL_ERROR' then begin
        try
          edtColorHLERROR.Color := StringToColor(select.FN('VAR_VALUE').AsString);
        Except
          edtColorHLERROR.Color := clWindow;
        end;
        edtColorHLERROR.Text := ColorToString(edtColorHLERROR.Color);
      end;
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'ROW_HL_WARNING' then begin
        try
          edtColorHLWARNING.Color := StringToColor(select.FN('VAR_VALUE').AsString);
        Except
          edtColorHLWARNING.Color := clWindow;
        end;
        edtColorHLWARNING.Text := ColorToString(edtColorHLWARNING.Color);
      end;

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'REQUEST_NEXT_DAY_TIME' then
        edReqTime.DateTime := StrToDateTime(select.FN('VAR_VALUE').AsString);
      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'REQUEST_SKIP_WEEKEND' then
        chkRWD.Checked := (select.FN('VAR_VALUE').AsInteger = 1);

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'CARD_ADD_SRV' then
      begin
        if (TryStrToInt(select.FN('VAR_VALUE').AsString, i)) then
          cbbCardAdd.KeyValue := i;
      end;

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'CARD_DEL_SRV' then
      begin
        if (TryStrToInt(select.FN('VAR_VALUE').AsString, i)) then
          cbbCardDel.KeyValue := i;
      end;

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'RQ_TO_POSITIVE' then
      begin
        if (TryStrToInt(select.FN('VAR_VALUE').AsString, i)) then
          cbbRQ_TO_POSITIVE.KeyValue := i;
      end;

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'RQ_TO_NEGATIVE' then
      begin
        if (TryStrToInt(select.FN('VAR_VALUE').AsString, i)) then
          cbbRQ_TO_NEGATIVE.KeyValue := i;
      end;

      if AnsiUpperCase(select.FN('VAR_NAME').value) = 'RQ_SUM_POSITIVE' then
      begin
        if (TryStrToInt(select.FN('VAR_VALUE').AsString, i)) then
          edtSUM_POSITIVE.value := i;
      end;

      select.Next;
    end;
    FPassChanged := False;
    select.Close;

    select.SQLs.SelectSQL.Text := 'select gen_id(GEN_ACCOUNT_NO,0) as accN from rdb$database';
    select.Open;
    FLastAccount := select.FN('accN').AsInteger;
    AccNumber.value := FLastAccount;
    select.Close;

    val := Explode(';', ls_fields);
    pmLS.Items.Clear;
    for i := 0 to Length(val) - 1 do
    begin
      pmLS.Items.Add(NewItem(val[i], 0, False, True, miClick, 0, 'mils' + IntToStr(i)));
    end;
  end;
{$IFNDEF DEMOVERSION}
  edtA4Login.Enabled := True;
  edtA4APIkey.Enabled := True;
{$ENDIF}
end;

procedure TSettingsForm.miClick(Sender: TObject);
begin
  if (Sender is TMenuItem) then
    (ActiveControl as TDBEditEh).Text := (ActiveControl as TDBEditEh).Text + (Sender as TMenuItem).Caption;
end;

procedure TSettingsForm.lstSettingsClick(Sender: TObject);
begin
  pgSettings.ActivePageIndex := StrToInt(FPageList.Strings[lstSettings.ItemIndex]);
end;

function TSettingsForm.Internet: boolean;
var
  CashSettingsDialog: TDLLInternetSetting;
  HLib: THandle;
  i: integer;
  s: string;
begin
  // настройки интернет биллинга
  result := False;
  if FileExists(ExtractFilePath(application.ExeName) + 'internet.dll') then
  begin
    HLib := 0;
    try
      HLib := LoadLibrary('internet.dll');
      if HLib > HINSTANCE_ERROR then
      begin
        CashSettingsDialog := GetProcAddress(HLib, 'Settings');
        if Assigned(CashSettingsDialog) then
        begin
          s := dmMain.Server;
          s := s + ':' + dmMain.Database;
          i := CashSettingsDialog(PWChar(s), PWChar(dmMain.USER), PWChar(dmMain.Password));
          result := (i > 0); // показали диалог
        end
        else
          ShowMessage(Format(rsErrorDll, ['Internet.dll']));
      end
      else
        ShowMessage(Format(rsErrorLoadDll, ['Internet.dll']));
    finally
      if HLib > HINSTANCE_ERROR then
        FreeLibrary(HLib);
    end;
  end
end;

end.
