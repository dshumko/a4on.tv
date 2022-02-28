unit fmuCustomerNew;
{$I defines.inc}

interface

uses
  WinAPI.Windows, WinAPI.Messages, System.SysUtils, System.Variants,
  System.Classes, System.UITypes, System.Actions,
  VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, VCL.StdCtrls, VCL.ActnList,
  VCL.DBCtrls, VCL.Mask, VCL.Buttons, VCL.ExtCtrls, VCL.Menus,
  Data.DB,
  AtrPages,
  FIBDatabase, pFIBDataSet, FIBDataSet, FIBQuery, pFIBQuery, pFIBDatabase,
  ToolCtrlsEh, GridsEh, DBGridEhToolCtrls, DBAxisGridsEh, DBLookupEh, DBCtrlsEh, DBGridEh,
  MemTableDataEh, MemTableEh, CnErrorProvider,
  EhLibVCL, DBGridEhGrouping, DynVarsEh,
  PropFilerEh, PropStorageEh, EhlibFIB;

type
  TapgCustomerNew = class(TA4onPage)
    srcContacts: TDataSource;
    pnlInfo: TPanel;
    pnl1: TPanel;
    pnlContacts: TPanel;
    lbl5: TLabel;
    btnCAdd: TSpeedButton;
    btnCdel: TSpeedButton;
    dbgrdhContacts: TDBGridEh;
    ds: TDataSource;
    pnl2: TPanel;
    GroupBox2: TGroupBox;
    dsOrg: TpFIBDataSet;
    srcOrg: TDataSource;
    dsVATG: TpFIBDataSet;
    srcVATG: TDataSource;
    srcStreet: TDataSource;
    dsStreets: TpFIBDataSet;
    dsAttributes: TpFIBDataSet;
    srcAttributes: TDataSource;
    dsHouses: TpFIBDataSet;
    srcHouse: TDataSource;
    Query: TpFIBQuery;
    srcExecutor: TDataSource;
    dsExecutor: TpFIBDataSet;
    DataSource1: TDataSource;
    Panel1: TPanel;
    chkJURIDICAL: TDBCheckBoxEh;
    luCreator: TDBLookupComboboxEh;
    Label19: TLabel;
    deDogovor: TDBEditEh;
    eACCOUNT_NO: TDBEditEh;
    lblAccount: TLabel;
    Label2: TLabel;
    eValid_to: TDBDateTimeEditEh;
    eCONTRACT_DATE: TDBDateTimeEditEh;
    Label10: TLabel;
    btnGetDogNumber: TButton;
    LupStreets: TDBLookupComboboxEh;
    Label6: TLabel;
    Label1: TLabel;
    LupHOUSE_ID: TDBLookupComboboxEh;
    Label8: TLabel;
    eFLAT_NO: TDBEditEh;
    Label21: TLabel;
    edPORCH: TDBEditEh;
    Label23: TLabel;
    edFLOOR: TDBEditEh;
    lblContract: TLabel;
    pnlFIZ: TPanel;
    Label3: TLabel;
    eSURNAME: TDBEditEh;
    Label13: TLabel;
    edtPASSPORT_NUMBER: TDBEditEh;
    lbl2: TLabel;
    edtBIRTHDAY: TDBDateTimeEditEh;
    edtADRES_REGISTR: TDBEditEh;
    lbl3: TLabel;
    edRegistration: TDBEditEh;
    Label12: TLabel;
    eFIRSTNAME: TDBEditEh;
    Label4: TLabel;
    eMIDLENAME: TDBEditEh;
    Label9: TLabel;
    pnlJUR: TPanel;
    Label18: TLabel;
    edSURNAME: TDBEditEh;
    lblINN: TLabel;
    eJURINN: TDBEditEh;
    Label17: TLabel;
    eBUH: TDBEditEh;
    lbl4: TLabel;
    ed1: TDBEditEh;
    cbbVATG: TDBLookupComboboxEh;
    lblVAT: TLabel;
    eDIRECTOR: TDBEditEh;
    Label16: TLabel;
    Panel2: TPanel;
    dbchkHiden: TDBCheckBox;
    Button1: TButton;
    Button2: TButton;
    lblOrg: TLabel;
    cbbORG_ID: TDBLookupComboboxEh;
    dsCustomerMEM: TMemTableEh;
    dsContacts: TMemTableEh;
    ColorDialog1: TColorDialog;
    pnlBUTTONS: TPanel;
    btnCancel: TButton;
    btnSAVE: TButton;
    edtSecret: TDBEditEh;
    Label7: TLabel;
    Label5: TLabel;
    edtPERSONAL_N: TDBEditEh;
    CnErrors: TCnErrorProvider;
    btn1: TSpeedButton;
    chkHAND: TDBCheckBoxEh;
    mmoNOTICE: TDBMemoEh;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    trReadQ: TpFIBTransaction;
    trWriteQ: TpFIBTransaction;
    Label11: TLabel;
    DBEditEh1: TDBEditEh;
    lbl8: TLabel;
    edtCONTRACT_BASIS: TDBEditEh;
    edtPlaceBirth: TDBEditEh;
    lbl9: TLabel;
    PropStorageEh: TPropStorageEh;
    pnlPassport: TPanel;
    btnPassport: TButton;
    actlst: TActionList;
    actScan: TAction;
    btnCEdit: TSpeedButton;
    edtTO: TDBEditEh;
    Label14: TLabel;
    lbl1: TLabel;
    edtBANK_ACCOUNT: TDBEditEh;
    lcbBANK: TDBLookupComboboxEh;
    Label15: TLabel;
    srcBanks: TDataSource;
    dsBANKS: TpFIBDataSet;
    procedure dbgrdhContactsExit(Sender: TObject);
    procedure chkJURIDICALClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnGetDogNumberClick(Sender: TObject);
    procedure eFLAT_NOExit(Sender: TObject);
    procedure btnCAddClick(Sender: TObject);
    procedure btnCdelClick(Sender: TObject);
    procedure dsContactsNewRecord(DataSet: TDataSet);
    procedure dsContactsBeforePost(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure LupHOUSE_IDEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure LupStreetsEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure eACCOUNT_NOExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure eACCOUNT_NOEnter(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure eCONTRACT_DATEExit(Sender: TObject);
    procedure srcContactsUpdateData(Sender: TObject);
    procedure eSURNAMEExit(Sender: TObject);
    procedure LupHOUSE_IDChange(Sender: TObject);
    procedure LupStreetsChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtPERSONAL_NExit(Sender: TObject);
    procedure actScanExecute(Sender: TObject);
    procedure edtPASSPORT_NUMBERExit(Sender: TObject);
    procedure edtBANK_ACCOUNTExit(Sender: TObject);
    procedure edtBIKExit(Sender: TObject);
    procedure edtPASSPORT_NUMBEREnter(Sender: TObject);
    procedure edtPERSONAL_NEnter(Sender: TObject);
    procedure edtBANK_ACCOUNTEnter(Sender: TObject);
    procedure edtBIKEnter(Sender: TObject);
    procedure btnCEditClick(Sender: TObject);
    procedure dbgrdhContactsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSAVEClick(Sender: TObject);
    procedure eACCOUNT_NOChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcbBANKExit(Sender: TObject);
  private
    { Private declarations }
    FFullAccess: Boolean;
    FCanAdd: Boolean;
    FNotIgnoreContract: Boolean;
    FNeedSaveScan: Boolean;
    FFileScan: String;
    FKeyMVD: string;
    FNeedCheckAccount: Boolean;
    procedure GenerateAccountN;
    procedure SetJurVisible;
    function SaveInDB: Integer;
    function CheckValidData: Boolean;
    procedure TextToFileds(scResult: TStringList);
    function ParseCaptured(const _scanName: string; scResult: TStringList): Boolean;
    procedure CheckInBlackList(const Sender: TDBEditEh; const NT: Integer = 0);
    procedure CheckBankAccount;
    function CheckControlText(const Contrl: TDBEditEh; const regexp: String): Boolean;
    function ValidPassport: Boolean;
    function CheckAccount: Boolean;
    procedure CheckIOfromDB();
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

function NewCustomer: Int64;

implementation

uses System.Typinfo, System.RegularExpressions,
  DM, PrjConst, HouseForma, StreetEditForma, AtrStrUtils,
  ScanImageForma, AtrCommon,
  EditCFileForma, A4onTypeUnit, ContactForma,
  OverbyteIcsWndControl, OverbyteIcsHttpProt, OverbyteIcsWSocket, OverbyteIcsUrl;

{$R *.dfm}

function NewCustomer: Int64;
var
  ci: TCustomerInfo;
begin
  Result := -1;
  with TapgCustomerNew.Create(Application) do
  begin
    try
      InitForm;
      if (ShowModal = mrOk) then
      begin
        Result := SaveInDB;

        if FNeedSaveScan and ((dmMain.AllowedAction(rght_Customer_full)) or
          (dmMain.AllowedAction(rght_Customer_Files_add))) then
        begin
          with ci do
          begin
            CUSTOMER_ID := Result;
            Account_No := eACCOUNT_NO.Text.Trim;
            Debt_sum := 0;
            FIO := Trim(eSURNAME.Text + ' ' + eFIRSTNAME.Text + ' ' + eMIDLENAME.Text);
            if not dsCustomerMEM.FieldByName('street_ID').IsNull then
              STREET_ID := dsCustomerMEM['street_ID'];
            STREET := LupStreets.Text;
            if not dsCustomerMEM.FieldByName('HOUSE_ID').IsNull then
              HOUSE_ID := dsCustomerMEM['HOUSE_ID'];
            HOUSE_no := LupHOUSE_ID.Text;
            FLAT_NO := eFLAT_NO.Text;
            notice := mmoNOTICE.Text;
            isType := 0
          end;
          EditFile(ci, 'Паспорт', -1, FFileScan);
        end;
      end;
      CloseData;
    finally
      Free;
    end;
  end;
end;

function PropertyExists(aObject: TObject; const aPropertyName: String): Boolean;
begin
  Result := (GetPropInfo(aObject.ClassInfo, aPropertyName) <> nil);
end;

class function TapgCustomerNew.GetPageName: string;
begin
  Result := rsNewCustomerForm;
end;

procedure TapgCustomerNew.InitForm;
var
 s: string;
begin
  // i := (dmMain.AllowedAction(rght_Customer_edit));      // Изменение инфы о абоненте
  FFullAccess := (dmMain.AllowedAction(rght_Customer_full)); // полный доступ
  FCanAdd := (dmMain.AllowedAction(rght_Customer_add)); // полный доступ

  btnSAVE.Visible := FFullAccess or FCanAdd;

  FNotIgnoreContract := dmMain.GetSettingsValue('IGNORE_CONTRACT') <> '1';
  FKeyMVD := dmMain.GetSettingsValue('KEY_MVD');
  dsContacts.Open;
  dsOrg.Open;
  dsVATG.Open;
  dsStreets.Open;
  dsAttributes.Open;
  s := dmMain.GetSettingsValue('AREA_LOCK');
  if (s <> '') and (not dmMain.AllowedAction(rght_Programm_NotLockArea)) then
  begin
    dsHouses.ParamByName('AREA_LOCK').Value := Format(' and ((h.Subarea_Id) is null or (h.Subarea_Id in (%s))) ', [s]);
  end;
  dsHouses.Open;
  dsBANKS.Open;
  dsExecutor.Open;
  if dsExecutor.Locate('LOGIN', VarArrayOf([dmMain.User]), []) then
    luCreator.Value := dsExecutor['WORKER_ID'];

  dbchkHiden.Visible := dmMain.SuperMode > 0;
  // спрячем кнопку + для добавления адреса если это запрещено
  LupStreets.EditButtons[0].Visible :=
    ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street)));
  LupHOUSE_ID.EditButtons[0].Visible :=
    ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street)));

  if not ds.DataSet.FieldByName('HIS_COLOR').IsNull then
  begin
    try
      Self.Color := StringToColor(ds.DataSet.FieldByName('HIS_COLOR').Value);
    except
    end;
  end;
  dsCustomerMEM.Open;
  dsCustomerMEM.Insert;
  dsCustomerMEM['CONTRACT_DATE'] := Now();
  dsCustomerMEM['HAND_CONTROL'] := 0;
  dsCustomerMEM['JURIDICAL'] := 0;
  edtSecret.Text := GenPassword(8);

  SetJurVisible;

  // pnlPassport.Visible := ;
  actScan.Enabled := DirectoryExists(ExtractFileDir(Application.ExeName) + '\smartid');
  if actScan.Enabled then
    btnPassport.Action := actScan;
  pnlPassport.Visible := actScan.Enabled;
end;

procedure TapgCustomerNew.lcbBANKExit(Sender: TObject);
begin
  CheckBankAccount;
end;

procedure TapgCustomerNew.LupHOUSE_IDEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  i: Int64;
begin
  i := EditHouse(-1, dsStreets['STREET_ID']);
  if i > -1 then
  begin
    dsHouses.CloseOpen(True);
    LupHOUSE_ID.Value := i;
  end;
  Handled := True;
end;

procedure TapgCustomerNew.LupStreetsEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  i: Int64;
begin
  i := EditStreet(-1);
  if i > -1 then
  begin
    dsStreets.CloseOpen(True);
    LupStreets.Value := i;
  end;
  Handled := True;

end;

procedure TapgCustomerNew.dbgrdhContactsExit(Sender: TObject);
begin
  if dsContacts.State in [dsEdit, dsInsert] then
    dsContacts.Post;
end;

procedure TapgCustomerNew.dbgrdhContactsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ActiveControl = dbgrdhContacts then
  begin
    case Key of
      VK_INSERT:
        btnCAdd.Click;
      VK_DELETE:
        btnCdel.Click;
      VK_F2:
        btnCEdit.Click;
    end;
  end;
end;

procedure TapgCustomerNew.dsContactsBeforePost(DataSet: TDataSet);
begin
  dsContacts['EDITED'] := True;
end;

procedure TapgCustomerNew.dsContactsNewRecord(DataSet: TDataSet);
begin
  dsContacts['INSERTED'] := True;
  dsContacts['Cc_Notify'] := 1;
end;

procedure TapgCustomerNew.eACCOUNT_NOChange(Sender: TObject);
begin
  FNeedCheckAccount := True;
end;

procedure TapgCustomerNew.eACCOUNT_NOEnter(Sender: TObject);
begin
  // CnErrors.Dispose((Sender as TControl));
end;

procedure TapgCustomerNew.eACCOUNT_NOExit(Sender: TObject);
begin
  CheckValidData;
end;

procedure TapgCustomerNew.eFLAT_NOExit(Sender: TObject);
begin
  if VarIsNull(LupHOUSE_ID.KeyValue) then
    exit;
  if ds.DataSet.State in [dsInsert, dsEdit] then
  begin
    Query.SQL.Clear;
    Query.SQL.Add('select first 1 C.ACCOUNT_NO, C.SURNAME||coalesce('' ''||c.Initials, '''') FIO, ');
    Query.SQL.Add('    C.CUST_STATE_DESCR, C.DEBT_SUM, C.DOGOVOR_NO, f.Porch_N, f.Floor_N ');
    Query.SQL.Add('  from house h ');
    Query.SQL.Add('  left outer join customer c on (c.House_Id = h.House_Id and c.Flat_No = :flat_no )');
    Query.SQL.Add('  left outer join HOUSEFLATS f on (f.House_Id = h.House_Id and f.Flat_No = :flat_no) ');
    Query.SQL.Add('  where h.House_Id=:house_id ');
    Query.SQL.Add('  order by c.VALID_TO');

    Query.ParamByName('HOUSE_ID').asInteger := LupHOUSE_ID.KeyValue;
    Query.ParamByName('FLAT_NO').AsString := eFLAT_NO.Text;
    Query.Transaction.StartTransaction;
    Query.ExecQuery;

    if not(Query.FN('PORCH_N').IsNull) then
      edPORCH.Text := Query.FN('PORCH_N').AsString;
    if not(Query.FN('FLOOR_N').IsNull) then
      edFLOOR.Text := Query.FN('FLOOR_N').AsString;
    if not(Query.FN('ACCOUNT_NO').IsNull) then
      ShowMessage(rsSAME_ADRES + rsEOL + Format(rsCustomerInfo, [Query.FN('ACCOUNT_NO').AsString,
        Query.FN('DOGOVOR_NO').AsString, Query.FN('FIO').AsString, Query.FN('DEBT_SUM').AsString,
        Query.FN('CUST_STATE_DESCR').AsString]));

    Query.Transaction.Commit;
    Query.Close;

    if ds.DataSet.State = dsInsert then
    begin
      GenerateAccountN;
      CheckValidData;
    end;
  end;
end;

procedure TapgCustomerNew.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    btnSAVEClick(Sender);
end;

procedure TapgCustomerNew.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then
  begin
    go := True;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBGridEh) then
      go := False
    else if (ActiveControl is TDBMemoEh) then
      go := False;

    if go then
    begin
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TapgCustomerNew.FormShow(Sender: TObject);
begin
  if dmMain.CompanyCountry = 'RU' then
    lblINN.Caption := 'ИНН'
  else
    lblINN.Caption := 'УНП';
end;

procedure TapgCustomerNew.OpenData;
begin
  dsContacts.Open;
end;

procedure TapgCustomerNew.actScanExecute(Sender: TObject);
var
  scResult: TStringList;
  cr: TCursor;
begin
  FFileScan := ScanDocument(True, FNeedSaveScan);
  if not FFileScan.IsEmpty then
  begin
    scResult := TStringList.Create;
    cr := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    try
      if ParseCaptured(FFileScan, scResult) then
      begin
        TextToFileds(scResult);
      end;
    finally
      FreeAndNil(scResult);
      Screen.Cursor := cr;
    end;
  end;
end;

procedure TapgCustomerNew.btn1Click(Sender: TObject);
begin
  edtSecret.Text := GenPassword(8);
end;

procedure TapgCustomerNew.btnCAddClick(Sender: TObject);
var
  Contact: TContact;
begin
  if not(dmMain.AllowedAction(rght_Customer_add) or dmMain.AllowedAction(rght_Customer_full)) then
    exit;

  if not dsContacts.Active then
    dsContacts.Open;

  Contact.cID := -1;
  if EditContact(Contact) then
  begin
    dsContacts.Insert;
    dsContacts['CC_TYPE'] := Contact.cID;
    dsContacts['CC_VALUE'] := Contact.Contact;
    dsContacts['CC_NOTICE'] := Contact.notice;
    dsContacts['Cc_Notify'] := (Contact.Notify = 1);
    dsContacts['O_Name'] := Contact.cType;
    dsContacts.Post;
    dbgrdhContacts.SetFocus;
  end
end;

procedure TapgCustomerNew.btnCdelClick(Sender: TObject);
var
  s: String;
begin
  if not dsContacts.FieldByName('CC_VALUE').IsNull then
    s := Format(rsDeleteWithName, [dsContacts.FieldByName('CC_VALUE').AsString])
  else
    s := rsContactDelete;

  if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    dsContacts.Delete;
end;

procedure TapgCustomerNew.btnCEditClick(Sender: TObject);
var
  Contact: TContact;
begin
  if not(dmMain.AllowedAction(rght_Customer_add) or dmMain.AllowedAction(rght_Customer_full)) then
    exit;
  if (not dsContacts.Active) then
    dsContacts.Open;
  if dsContacts.RecordCount > 0 then
  begin
    Contact.cID := dsContacts['CC_TYPE'];
    if not dsContacts.FieldByName('CC_VALUE').IsNull then
      Contact.Contact := dsContacts['CC_VALUE']
    else
      Contact.Contact := '';
    if not dsContacts.FieldByName('CC_NOTICE').IsNull then
      Contact.notice := dsContacts['CC_NOTICE']
    else
      Contact.notice := '';
    if not dsContacts.FieldByName('Cc_Notify').IsNull then
      Contact.Notify := dsContacts['Cc_Notify']
    else
      Contact.Notify := 0;
    if not dsContacts.FieldByName('O_Name').IsNull then
      Contact.cType := dsContacts['O_Name']
    else
      Contact.cType := '';
  end
  else
    Contact.cID := -1;

  if EditContact(Contact) then
  begin
    if dsContacts.RecordCount > 0 then
      dsContacts.Edit
    else
      dsContacts.Insert;
    dsContacts['CC_TYPE'] := Contact.cID;
    dsContacts['CC_VALUE'] := Contact.Contact;
    dsContacts['CC_NOTICE'] := Contact.notice;
    dsContacts['Cc_Notify'] := Contact.Notify;
    dsContacts['O_Name'] := Contact.cType;
    dsContacts.Post;
    dbgrdhContacts.SetFocus;
  end
end;

procedure TapgCustomerNew.btnGetDogNumberClick(Sender: TObject);
begin
  GenerateAccountN;
  CheckValidData;
end;

procedure TapgCustomerNew.btnSAVEClick(Sender: TObject);
var
  AllOk: Boolean;
begin
  AllOk := CheckValidData;
  if AllOk then
  begin
    if (dsContacts.RecordCount = 0) and (Application.MessageBox(PWideChar(rsNeedContact), PWideChar(rsContact),
      MB_YESNO + MB_ICONWARNING) = IDYES) then
    begin
      btnCAddClick(Sender);
      AllOk := False;
    end
    else
    begin
      if (not FKeyMVD.IsEmpty) and (Application.MessageBox(PWideChar(rsNeedPassportCheck), PWideChar(rsAplicationName),
        MB_YESNO + MB_ICONWARNING) = IDYES) then
        AllOk := ValidPassport
      else
        AllOk := True;
    end;
  end;

  if AllOk then
    modalResult := mrOk
  else
    modalResult := mrNone;
end;

procedure TapgCustomerNew.Button1Click(Sender: TObject);
begin
  if ColorDialog1.Execute then
  begin
    Self.Color := ColorDialog1.Color;
    if not(ds.State in [dsInsert, dsEdit]) then
      ds.DataSet.Edit;
    ds.DataSet['HIS_COLOR'] := ColorToString(Self.Color);
  end;
end;

procedure TapgCustomerNew.Button2Click(Sender: TObject);
begin
  Self.Color := clBtnFace;
  if not(ds.DataSet.State in [dsInsert, dsEdit]) then
    ds.DataSet.Edit;
  ds.DataSet.FieldByName('HIS_COLOR').Clear;
end;

procedure TapgCustomerNew.chkJURIDICALClick(Sender: TObject);
begin
  SetJurVisible;
end;

procedure TapgCustomerNew.CloseData;
begin
  if dsContacts.Active then
    dsContacts.Close;
  if dsOrg.Active then
    dsOrg.Close;
  if dsVATG.Active then
    dsVATG.Close;
  if dsStreets.Active then
    dsStreets.Close;
  if dsAttributes.Active then
    dsAttributes.Close;
  if dsHouses.Active then
    dsHouses.Close;
  if dsBANKS.Active then
    dsBANKS.Close;
  if dsExecutor.Active then
    dsExecutor.Close;
  if dsCustomerMEM.Active then
  begin
    if dsCustomerMEM.State = dsInsert then
      dsCustomerMEM.Cancel;
    dsCustomerMEM.Close;
  end;
end;

procedure TapgCustomerNew.edtBIKEnter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

procedure TapgCustomerNew.edtBIKExit(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;
  CheckBankAccount;
end;

procedure TapgCustomerNew.GenerateAccountN;
var
  flat: string;
begin
  if LupHOUSE_ID.Text = '' then
  begin
    CnErrors.SetError(LupHOUSE_ID, rsSelectHouse, iaTopCenter, bsNeverBlink);
    LupHOUSE_ID.SetFocus;
    exit;
  end
  else
    CnErrors.Dispose(LupHOUSE_ID);

  flat := eFLAT_NO.Text;
  eACCOUNT_NO.Text := dmMain.GenerateDogNumber(LupHOUSE_ID.Value, flat, -1);
  if (dmMain.GetSettingsValue('ACCOUNT_DOG') = 1) then
    deDogovor.Text := eACCOUNT_NO.Text;
end;

procedure TapgCustomerNew.SetJurVisible;
begin
  // Важна последовательность включения
  if chkJURIDICAL.Checked then
  begin
    pnlJUR.Visible := True;
    pnlFIZ.Visible := False;
  end
  else
  begin
    pnlFIZ.Visible := True;
    pnlJUR.Visible := False;
  end;
  pnlInfo.Update;
end;

function TapgCustomerNew.SaveInDB: Integer;
var
  cust_id: Integer;
  s_insert: string;
  s_values: string;
  qry: TpFIBQuery;
  fldList: TStrings;

  function GenInsertSQL(const ds: TDataSet): Boolean;
  var
    i: Integer;
    fldsCount: Integer;
  begin
    fldsCount := 0;
    for i := 0 to fldList.Count - 1 do
    begin
      if not ds.FieldByName(fldList[i]).IsNull then
      begin
        s_insert := s_insert + ' ' + fldList[i] + ',';
        s_values := s_values + ':' + fldList[i] + ',';
        Inc(fldsCount);
      end;
    end;

    if fldsCount > 0 then
    begin
      s_insert := Copy(s_insert, 1, Length(s_insert) - 1);
      s_values := Copy(s_values, 1, Length(s_values) - 1);
    end;
    Result := (fldsCount > 2);
  end;

  procedure SetParams(const ds: TDataSet);
  var
    i: Integer;
  begin
    for i := 0 to fldList.Count - 1 do
    begin
      if not ds.FieldByName(fldList[i]).IsNull then
        qry.ParamByName(fldList[i]).Value := ds.FieldByName(fldList[i]).Value;
    end;
  end;

  function InsertQuery(const ds: TDataSet; const inTbl: string; const stmnt: string = 'insert into';
    const stend: string = ''): Boolean;
  begin
    qry := TpFIBQuery.Create(Nil);
    with qry do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text := stmnt + ' ' + inTbl + ' (' + s_insert + ') values (' + s_values + ') ' + stend;
        SetParams(ds);
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
        Result := True;
      finally
        Free;
      end;
  end;

  function InsertProc(const ds: TDataSet; const inProc: string): Boolean;
  begin
    qry := TpFIBQuery.Create(Nil);
    with qry do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text := inProc;
        SetParams(ds);
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
        Result := True;
      finally
        Free;
      end;
  end;

begin
  Result := -1;
{$REGION 'Insert CUSTOMER'}
  fldList := TStringList.Create;
  try
    if dsCustomerMEM.FieldByName('CUSTOMER_ID').IsNull then
    begin
      cust_id := dmMain.dbTV.Gen_Id('GEN_CUSTOMER_UID', 1);
      if not(dsCustomerMEM.State in [dsEdit, dsInsert]) then
        dsCustomerMEM.Edit;
      dsCustomerMEM['CUSTOMER_ID'] := cust_id;
      dsCustomerMEM.Post;
    end
    else
      cust_id := dsCustomerMEM['CUSTOMER_ID'];

    if dsCustomerMEM['ACCOUNT_NO'] <> Trim(dsCustomerMEM['ACCOUNT_NO']) then
    begin
      dsCustomerMEM.Edit;
      dsCustomerMEM['ACCOUNT_NO'] := Trim(dsCustomerMEM['ACCOUNT_NO']);
      dsCustomerMEM.Post;
    end;

    s_insert := '';
    s_values := '';
    fldList.Add('CUSTOMER_ID');
    fldList.Add('HOUSE_ID');
    fldList.Add('ACCOUNT_NO');
    fldList.Add('DOGOVOR_NO');
    fldList.Add('SURNAME');
    fldList.Add('FIRSTNAME');
    fldList.Add('MIDLENAME');
    fldList.Add('CONTRACT_DATE');
    fldList.Add('ACTIVIZ_DATE');
    fldList.Add('NOTICE');
    fldList.Add('VALID_TO');
    fldList.Add('FLAT_NO');
    fldList.Add('PASSPORT_NUMBER');
    fldList.Add('PASSPORT_REGISTRATION');
    fldList.Add('PERSONAL_N');
    fldList.Add('MANAGER_ID');
    fldList.Add('JURIDICAL');
    fldList.Add('JUR_INN');
    fldList.Add('JUR_DIRECTOR');
    fldList.Add('JUR_BUH');
    fldList.Add('HIS_COLOR');
    fldList.Add('INVISIBLE');
    fldList.Add('BIRTHDAY');
    fldList.Add('ADRES_REGISTR');
    fldList.Add('ORG_ID');
    fldList.Add('VATG_ID');
    fldList.Add('TAP');
    fldList.Add('SECRET');
    fldList.Add('HAND_CONTROL');
    fldList.Add('BANK_ID');
    fldList.Add('BANK_ACCOUNT');
    fldList.Add('EXTERNAL_ID');
    fldList.Add('CONTRACT_BASIS');
    fldList.Add('PASSPORT_VALID');
{$ENDREGION}
    if GenInsertSQL(dsCustomerMEM) then
    begin
      if InsertQuery(dsCustomerMEM, 'CUSTOMER') then
      begin
        Result := cust_id;
{$REGION 'INSERT PORCH'}
        fldList.Clear;
        s_insert := '';
        s_values := '';
        fldList.Add('PORCH_N');
        fldList.Add('FLOOR_N');
        fldList.Add('FLAT_NO');
        fldList.Add('HOUSE_ID');
        if GenInsertSQL(dsCustomerMEM) then
          InsertQuery(dsCustomerMEM, 'Houseflats', 'update or insert into', 'matching (House_Id, Flat_No)');
{$ENDREGION}
{$REGION 'SAVE CONTACTS'}
        if dsContacts.State in [dsEdit, dsInsert] then
          dsContacts.Post;
        fldList.Clear;
        fldList.Add('CUSTOMER_ID');
        fldList.Add('CC_VALUE');
        fldList.Add('CC_TYPE');
        fldList.Add('CC_NOTICE');
        fldList.Add('Cc_Notify');
        dsContacts.First;
        while not dsContacts.Eof do
        begin
          dsContacts.Edit;
          dsContacts['CUSTOMER_ID'] := cust_id;
          dsContacts.Post;
          InsertProc(dsContacts,
            'execute procedure Customer_Contacts_Iu(:Customer_Id, :Cc_Value, :Cc_Type, :Cc_Notice, :Cc_Notify)');
          dsContacts.Next;
        end;
{$ENDREGION}
      end;
    end;
  finally
    fldList.Free;
  end;
end;

function TapgCustomerNew.CheckValidData: Boolean;
var
  AllRight: Boolean;
begin
  if not(FFullAccess or FCanAdd) then
    exit;

  AllRight := True;

  if (LupStreets.Text = '') then
  begin
    AllRight := False;
    CnErrors.SetError(LupStreets, rsSelectStreet, iaTopCenter, bsNeverBlink);
  end
  else
    CnErrors.Dispose(LupStreets);

  if (LupHOUSE_ID.Text = '') then
  begin
    AllRight := False;
    CnErrors.SetError(LupHOUSE_ID, rsSelectHouse, iaTopCenter, bsNeverBlink);
  end
  else
    CnErrors.Dispose(LupHOUSE_ID);

  if (eACCOUNT_NO.Text.Trim = '') then
  begin
    AllRight := False;
    CnErrors.SetError(eACCOUNT_NO, rsSelectAccount, iaTopCenter, bsNeverBlink);
  end
  else if CheckAccount then
    CnErrors.Dispose(eACCOUNT_NO)
  else
    AllRight := False;

  if (not FFullAccess) and (not(VarIsEmpty(eCONTRACT_DATE.Value) or VarIsNull(eCONTRACT_DATE.Value))) and
    (eCONTRACT_DATE.Value < dmMain.CurrentMonth) and (FNotIgnoreContract) then
  begin
    AllRight := False;
    CnErrors.SetError(eCONTRACT_DATE, rsContractDateError, iaTopCenter, bsNeverBlink);
  end
  else
    CnErrors.Dispose(eCONTRACT_DATE);
  Result := AllRight and btnSAVE.Visible;
  btnSAVE.Enabled := Result;
end;

procedure TapgCustomerNew.eCONTRACT_DATEExit(Sender: TObject);
begin
  CheckValidData;
end;

procedure TapgCustomerNew.srcContactsUpdateData(Sender: TObject);
begin
  if dsContacts.State in [dsInsert, dsEdit] then
  begin
    if (dsContacts.FieldByName('CC_VALUE').IsNull) or (Trim(dsContacts.FieldByName('CC_VALUE').AsString) = '') then
      dsContacts.Cancel;
  end;
end;

procedure TapgCustomerNew.eSURNAMEExit(Sender: TObject);
var
  s: string;
begin
  s := (Sender as TDBEditEh).Text;
  if (Length(s) > 0) and (ds.State in [dsEdit, dsInsert]) then
  begin
    (Sender as TDBEditEh).Text := NormalizeFIO(s);
  end;
  CheckIOfromDB();
end;

procedure TapgCustomerNew.LupHOUSE_IDChange(Sender: TObject);
begin
  dsOrg.CloseOpen(True);
  if dsHouses.FieldByName('ORG_ID').IsNull then
    cbbORG_ID.Value := null
  else
  begin
    if (dsOrg.RecordCount > 0) then
    begin
      if not(ds.State in [dsEdit, dsInsert]) then
        ds.DataSet.Insert;
      ds.DataSet['ORG_ID'] := dsHouses['ORG_ID'];
    end;
  end;
end;

procedure TapgCustomerNew.LupStreetsChange(Sender: TObject);
begin
  cbbORG_ID.Value := null;
end;

procedure TapgCustomerNew.btnCancelClick(Sender: TObject);
begin
  if dsCustomerMEM.State in [dsInsert, dsEdit] then
    dsCustomerMEM.Cancel;

end;

procedure TapgCustomerNew.edtBANK_ACCOUNTEnter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

procedure TapgCustomerNew.edtBANK_ACCOUNTExit(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;
  CheckBankAccount;
end;

procedure TapgCustomerNew.edtPASSPORT_NUMBEREnter(Sender: TObject);
begin
  if dmMain.CompanyCountry = 'BY' then
  begin
    if (dmMain.GetIniValue('KBDSWITCH') = '0') then
      SetKeyboardLayout('EN')
    else
      dmMain.SaveKLAndSelectEnglish;
  end;
end;

procedure TapgCustomerNew.edtPASSPORT_NUMBERExit(Sender: TObject);
begin
  if dmMain.CompanyCountry = 'BY' then
  begin
    if (dmMain.GetIniValue('KBDSWITCH') = '0') then
      SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
    else
      dmMain.RestoreKL;
  end;

  if CheckControlText((Sender as TDBEditEh), dmMain.GetSettingsValue('REG_PASSN')) then
    CheckInBlackList((Sender as TDBEditEh), 1);
end;

procedure TapgCustomerNew.edtPERSONAL_NEnter(Sender: TObject);
begin
  if dmMain.CompanyCountry = 'BY' then
  begin
    if (dmMain.GetIniValue('KBDSWITCH') = '0') then
      SetKeyboardLayout('EN')
    else
      dmMain.SaveKLAndSelectEnglish;
  end;
end;

procedure TapgCustomerNew.edtPERSONAL_NExit(Sender: TObject);
begin
  if dmMain.CompanyCountry = 'BY' then
  begin
    if (dmMain.GetIniValue('KBDSWITCH') = '0') then
      SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
    else
      dmMain.RestoreKL;
  end;
  if CheckControlText((Sender as TDBEditEh), dmMain.GetSettingsValue('REG_PERSN')) then
    CheckInBlackList((Sender as TDBEditEh));
end;

procedure TapgCustomerNew.TextToFileds(scResult: TStringList);
var
  s: string;
  i: Integer;
  r: TStringArray;
  fs: TFormatSettings;
  pn: String;
  ps: String;
  p_RO: String;
  P_RD: String;
  d: TDate;
begin
  fs.DateSeparator := '.';
  fs.ShortDateFormat := 'dd.mm.yyyy';
  if (not(ds.DataSet.State in [dsInsert, dsEdit])) then
    ds.DataSet.Insert;
  p_RO := '';
  P_RD := '';
  for i := 0 to scResult.Count - 1 do
  begin
    s := Trim(scResult[i]);
    r := Explode(']', s);
    if Length(r) > 0 then
    begin
      s := r[0];
      s := Copy(s, 1, pos(' ', s) - 1);
      if s = 'name' then
        eFIRSTNAME.Text := NormalizeFIO(Trim(r[1]))
      else if s = 'surname' then
        eSURNAME.Text := NormalizeFIO(Trim(r[1]))
      else if s = 'patronymic' then
        eMIDLENAME.Text := NormalizeFIO(Trim(r[1]))
      else if s = 'birthdate' then
      begin
        s := Trim(r[1]);
        try
          d := StrToDate(s, fs);
          edtBIRTHDAY.Value := d;
        except
          //
        end;
      end
      else if s = 'birthplace' then
        edtPlaceBirth.Text := Trim(r[1])
      else if s = 'series' then
      begin
        ps := Trim(r[1]);
      end
      else if s = 'number' then
      begin
        pn := Trim(r[1]);
      end
      else if s = 'authority' then
        p_RO := Trim(r[1])
      else if s = 'issue_date' then
      begin
        s := Trim(r[1]);
        try
          d := StrToDate(s, fs);
          P_RD := dateToStr(d, fs);
        except
          //
        end;
      end

    end;
  end;
  if not(ps.IsEmpty and pn.IsEmpty) then
  begin
    edtPASSPORT_NUMBER.Text := Trim(ps + ' ' + pn);
    CheckInBlackList(edtPASSPORT_NUMBER, 1);
  end;
  edRegistration.Text := Trim(P_RD + ' ' + p_RO);
end;

function TapgCustomerNew.ParseCaptured(const _scanName: string; scResult: TStringList): Boolean;
var
  start: TStartupInfo;
  procInfo: TProcessInformation;
  tmp: THandle;
  tmpSec: TSecurityAttributes;
  res: TStringList;
  return: Cardinal;
  TmpFile, vdirName, _exeName, _cmdLine: string;
begin
  vdirName := ExtractFilePath(Application.ExeName);
  _exeName := 'smartid\smartid.exe';
  _cmdLine := _scanName + ' smartid\passport_rf.zip';

  TmpFile := _scanName + '.tmp';

  Result := False;
  try
    { Set a temporary file }

    FillChar(tmpSec, SizeOf(tmpSec), #0);
    tmpSec.nLength := SizeOf(tmpSec);
    tmpSec.bInheritHandle := True;
    tmp := CreateFile(PChar(TmpFile), Generic_Write, File_Share_Write, @tmpSec, Create_Always,
      File_Attribute_Normal, 0);
    try
      FillChar(start, SizeOf(start), #0);
      start.cb := SizeOf(start);
      start.hStdOutput := tmp;
      start.dwFlags := StartF_UseStdHandles or StartF_UseShowWindow;
      start.wShowWindow := SW_Minimize;
      { Start the program }
      if CreateProcess(nil, PChar(_exeName + ' ' + _cmdLine), nil, nil, True, 0, nil, PChar(vdirName), start, procInfo)
      then
      begin
        SetPriorityClass(procInfo.hProcess, Idle_Priority_Class);
        WaitForSingleObject(procInfo.hProcess, Infinite);
        GetExitCodeProcess(procInfo.hProcess, return);
        Result := (return = 0);
        CloseHandle(procInfo.hThread);
        CloseHandle(procInfo.hProcess);
        CloseHandle(tmp);
        { Add the output }
        res := TStringList.Create;
        try
          res.LoadFromFile(TmpFile, TEncoding.UTF8);
          scResult.AddStrings(res);
        finally
          res.Free;
        end;
        DeleteFile(PChar(TmpFile));
      end
      else
      begin
        Application.MessageBox(PChar(SysErrorMessage(GetLastError())), 'RunCaptured Error', MB_OK);
      end;
    except
      CloseHandle(tmp);
      DeleteFile(PChar(TmpFile));
      raise;
    end;
  finally
  end;
end;

procedure TapgCustomerNew.CheckInBlackList(const Sender: TDBEditEh; const NT: Integer = 0);
var
  s, n: string;
begin
  // NT 0 - Личный номер 1 - номер паспота
  CnErrors.Dispose(Sender);
  if (Sender.Text = '') then
    exit;
  s := '';
  n := Trim(Sender.Text);
  if ds.DataSet.State in [dsInsert, dsEdit] then
  begin
    Query.SQL.Clear;
    Query.SQL.Add('select o.O_Name, o.O_Description, o.O_Charfield');
    Query.SQL.Add('from objects o where o.O_Type = 31 and upper(o.O_Name) = upper(:PN)');
    Query.ParamByName('PN').AsString := n;
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
    if not(Query.FN('O_Name').IsNull) then
      s := Query.FN('O_Name').AsString + ' ';
    if not(Query.FN('O_Description').IsNull) then
      s := s + Query.FN('O_Description').AsString;
    if not(Query.FN('O_Charfield').IsNull) then
      s := s + #13#10 + Query.FN('O_Charfield').AsString;
    Query.Transaction.Commit;
    Query.Close;
  end;

  if s <> '' then
  begin
    CnErrors.SetError(Sender, rsCustomerInBlackList + #13#10 + s, iaTopCenter, bsNeverBlink);
    ShowMessage(rsCustomerInBlackList + #13#10 + s);
  end;
end;

procedure TapgCustomerNew.CheckBankAccount;
var
  bav: Boolean;
begin
  if (edtBANK_ACCOUNT.Text.IsEmpty) then
    exit;

  bav := True;
  if dmMain.CompanyCountry = 'BY' then
    bav := CheckIBAN(edtBANK_ACCOUNT.Text)
  else if dmMain.CompanyCountry = 'RU' then
  begin
    if (not lcbBANK.Text.IsEmpty) and (not dsBANKS.FieldByName('BUK').IsNull) then
      bav := CheckRusBA(edtBANK_ACCOUNT.Text, dsBANKS['BUK']);
  end;

  if bav then
    CnErrors.Dispose(edtBANK_ACCOUNT)
  else
    CnErrors.SetError(edtBANK_ACCOUNT, Format(rsErrorQuestWT, ['р/с']), iaTopCenter, bsNeverBlink);
end;

function TapgCustomerNew.CheckControlText(const Contrl: TDBEditEh; const regexp: String): Boolean;
begin
  Result := True;
  if (Contrl.Text.IsEmpty or regexp.IsEmpty) then
    exit;

  Result := TRegEx.IsMatch(Contrl.Text, '^' + regexp + '$');
  if (not Result) then
    CnErrors.SetError(Contrl, rsInputIncorrect, iaTopCenter, bsNeverBlink)
  else
    CnErrors.Dispose(Contrl);
end;

function TapgCustomerNew.ValidPassport: Boolean;
var
  FHttpCli: TSslHttpCli;
  FSslContext: TSslContext;
  Datax: TStringStream;
  url: string;
  errors: Boolean;
  unp, ps, pn: string;
  answer: string;
  pValid: Integer;
  qry: TpFIBQuery;

  function HasInvalidChar(const s: string): Boolean;
  var
    i: Integer;
  begin
    i := 1;
    Result := False;
    while (i <= Length(s)) do
    begin
      if (not CharInSet(s[i], [' ', '0' .. '9', 'a' .. 'z', 'A' .. 'Z'])) then
        Result := True;
      Inc(i);
    end;
  end;

  procedure SplitNumber(const s: string; var ser: string; var num: string);
  var
    v: string;
  begin
    v := Trim(UpperCase(s));
    ser := Copy(v, 1, 2);
    num := Trim(Copy(v, 3, 15));
  end;

begin
  Result := False;
  errors := False;
  if chkJURIDICAL.Checked or FKeyMVD.IsEmpty then
    exit;

  if eSURNAME.Text = '' then
  begin
    errors := True;
    CnErrors.SetError(eSURNAME, rsEmptyFieldError, iaTopCenter, bsNeverBlink);
  end
  else
    CnErrors.Dispose(eSURNAME);

  if eFIRSTNAME.Text = '' then
  begin
    errors := True;
    CnErrors.SetError(eFIRSTNAME, rsEmptyFieldError, iaTopCenter, bsNeverBlink);
  end
  else
    CnErrors.Dispose(eFIRSTNAME);

  if ((edtPERSONAL_N.Text = '') or (HasInvalidChar(edtPERSONAL_N.Text)) or (Length(edtPERSONAL_N.Text) <> 14)) then
  begin
    errors := True;
    CnErrors.SetError(edtPERSONAL_N, rsEmptyOrIncorrect, iaTopCenter, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtPERSONAL_N);

  if ((edtPASSPORT_NUMBER.Text = '') or (HasInvalidChar(edtPASSPORT_NUMBER.Text))) then
  begin
    errors := True;
    CnErrors.SetError(edtPASSPORT_NUMBER, rsEmptyOrIncorrect, iaTopCenter, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtPASSPORT_NUMBER);

  if errors then
    exit;

  SplitNumber(edtPASSPORT_NUMBER.Text, ps, pn);
  unp := dmMain.GetCompanyValue('UNN');
  if unp = '' then
    unp := dmMain.GetCompanyValue('UNP');

  url := Format('surname=%s&name=%s&lastname=%s', [UrlEncode(eSURNAME.Text), UrlEncode(eFIRSTNAME.Text),
    UrlEncode(eMIDLENAME.Text)]) + Format('&ser=%s&num=%s&identif=%s',
    [UrlEncode(ps), UrlEncode(pn), UrlEncode(edtPERSONAL_N.Text)]) +
    Format('&unp=%s&region=%s&district=%s&city=%s&street=%s&house=%s&housing=%s&room=%s',
    [UrlEncode(unp), UrlEncode(dmMain.GetCompanyValue('REGION')), UrlEncode(dmMain.GetCompanyValue('DISTRICT')),
    UrlEncode(dmMain.GetCompanyValue('CITY')), UrlEncode(dmMain.GetCompanyValue('STREET')),
    UrlEncode(dmMain.GetCompanyValue('HOUSE')), UrlEncode(dmMain.GetCompanyValue('HOUSING')),
    UrlEncode(dmMain.GetCompanyValue('ROOM'))]);

  FSslContext := TSslContext.Create(nil);
  FSslContext.Name := 'FSslContext';
  FSslContext.SslDHParamLines.Clear;
  FSslContext.SslVerifyPeer := False;

  FHttpCli := TSslHttpCli.Create(nil);
  FHttpCli.Name := 'FHttpCli';
  FHttpCli.Agent := 'a4on/1.0';
  FHttpCli.ServerAuth := httpAuthBearer;
  FHttpCli.AuthBearerToken := FKeyMVD;
  FHttpCli.ProxyAuth := httpAuthNone;
  FHttpCli.TimeOut := 30;
  FHttpCli.SslContext := FSslContext;
  FHttpCli.ResponseNoException := True;
  Datax := TStringStream.Create('', TEncoding.UTF8);
  FHttpCli.OnRequestDone := Nil;
  FHttpCli.RcvdStream := Datax;
  FHttpCli.url := rsCheckPassportURL + url;
  FHttpCli.Get; // sync

  if FHttpCli.StatusCode = 200 then
  begin
    // {"rs":"Машиночитаемый документ - 0A0007083 - не выдавался"}
    // {"rs":"Машиночитаемый документ - MC2134811 - выдан, действителен, дата выдачи 11.06.2010"}
    // {"rs":"Машиночитаемый документ - MC1828933 - недействителен, дата постановки на учет 10.12.2019"}
    answer := Datax.DataString;
    if answer.ToLower.Contains('выдан, действителен') then
      pValid := 1
    else
    begin
      ShowMessage(answer);
      CnErrors.SetError(edtPASSPORT_NUMBER, answer, iaTopCenter, bsAlwaysBlink);
      pValid := 0;
    end
  end
  else
  begin
    answer := rsError + ' ' + FHttpCli.StatusCode.ToString;
    ShowMessage(answer);
    CnErrors.SetError(edtPASSPORT_NUMBER, answer, iaTopCenter, bsAlwaysBlink);
    pValid := -1;
    {
      401 Unauthorized	Возвращается в случаях несанкционированного доступа к сервису
      403 Forbidden	Возвращается в случае, если запрашиваемый ресурс существует, но у клиента  недостаточно прав на его просмотр или модификацию
      500 Internal Server Error
      502 Bad Gateway
      504 Gateway Timeout
      200 ОК	Пакет получен
      400 Bad Request	Структура пакета неверна
      500 Internal Server Error	Непредвиденная ошибка сервера
    }
  end;

  FHttpCli.RcvdStream.Free;
  FHttpCli.RcvdStream := nil;
  FHttpCli.Free;
  FSslContext.Free;

  if dsCustomerMEM.FieldByName('CUSTOMER_ID').IsNull then
  begin
    if not(dsCustomerMEM.State in [dsEdit, dsInsert]) then
      dsCustomerMEM.Edit;
    dsCustomerMEM['CUSTOMER_ID'] := dmMain.dbTV.Gen_Id('GEN_CUSTOMER_UID', 1);;
    dsCustomerMEM['PASSPORT_VALID'] := pValid;
    dsCustomerMEM.Post;
  end;

  qry := TpFIBQuery.Create(Nil);
  try
    qry.DataBase := dmMain.dbTV;
    qry.Transaction := dmMain.trWriteQ;
    qry.SQL.Text := 'insert into Changelog (Log_Group, Object_Id, Value_Before, Value_After)';
    qry.SQL.Add(' values (:Log_Group, :Object_Id, :Value_Before, :Value_After)');
    qry.ParamByName('Log_Group').Value := 'PASSPORT_CHECK';
    qry.ParamByName('Object_Id').Value := dsCustomerMEM['CUSTOMER_ID'];
    qry.ParamByName('Value_Before').Value := Format('%s %s %s|%s%s|%s',
      [eSURNAME.Text, eFIRSTNAME.Text, eMIDLENAME.Text, ps, pn, edtPERSONAL_N.Text]);
    qry.ParamByName('Value_After').Value := answer;
    qry.Transaction.StartTransaction;
    qry.ExecQuery;
    qry.Transaction.Commit;
  finally
    qry.Free;
  end;

  Result := (pValid = 1);
end;

function TapgCustomerNew.CheckAccount: Boolean;
var
  s: string;
  ac: string;
begin
  Result := True;
  if FNeedCheckAccount then
  begin
    ac := eACCOUNT_NO.Text.Trim;
    Query.SQL.Clear;
    Query.SQL.Add
      ('select C.ACCOUNT_NO, C.SURNAME, C.FIRSTNAME, C.MIDLENAME, C.CUST_CODE, C.CUST_STATE_DESCR, C.DEBT_SUM, C.DOGOVOR_NO ');
    Query.SQL.Add('from CUSTOMER C where c.ACCOUNT_NO= :ACCOUNT_NO');
    Query.ParamByName('ACCOUNT_NO').Value := ac;
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
    if not(Query.Fields[0].IsNull) then
    begin
      s := rsAccountExists + rsEOL + rsCODE + ': %s ' + rsEOL + rsFIO + ': %s ' + rsEOL + rsSTATE + ': %s';
      if (dmMain.AllowedAction(rght_Customer_Debt)) or (dmMain.AllowedAction(rght_Customer_full)) // просмотр сумм
      then
      begin
        s := s + rsEOL;
        if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
          s := s + rsBALANCE
        else
          s := s + rsSALDO;
        s := s + ': %8.0f';
        s := Format(s, [ac, Query.Fields[4].AsString, Query.Fields[1].AsString + ' ' + Query.Fields[2].AsString + ' ' +
          Query.Fields[3].AsString, Query.Fields[5].AsString, Query.Fields[6].AsFloat]);
      end
      else
        s := Format(s, [ac, Query.Fields[4].AsString, Query.Fields[1].AsString + ' ' + Query.Fields[2].AsString + ' ' +
          Query.Fields[3].AsString, Query.Fields[5].AsString]);

      ShowMessage(s);
      CnErrors.SetError(eACCOUNT_NO, s, iaTopCenter, bsNeverBlink);
      Result := False;
      eACCOUNT_NO.SetFocus;
    end
    else
      FNeedCheckAccount := False;
    Query.Transaction.Commit;
    Query.Close;
  end
  else
    FNeedCheckAccount := False;
  if Result then
    CnErrors.Dispose(eACCOUNT_NO);
end;

procedure TapgCustomerNew.CheckIOfromDB();
var
  f, m: Integer;
begin
  if ((eFIRSTNAME.Text.IsEmpty) and (eMIDLENAME.Text.IsEmpty)) then
    exit;

  f := 0;
  m := 0;

  Query.SQL.Clear;
  Query.SQL.Add('select ');
  Query.SQL.Add('  (select count(*) from customer c where c.Firstname  = :F) F_CNT ');
  Query.SQL.Add(', (select count(*) from customer c where c.Midlename  = :M) M_CNT ');
  Query.SQL.Add('from rdb$database ');

  Query.ParamByName('F').Value := eFIRSTNAME.Text;
  Query.ParamByName('M').Value := eMIDLENAME.Text;

  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if not(Query.FieldByName('F_CNT').IsNull) then
    f := Query.FieldByName('F_CNT').asInteger;
  if not(Query.FieldByName('M_CNT').IsNull) then
    m := Query.FieldByName('M_CNT').asInteger;
  Query.Transaction.Commit;
  Query.Close;

  if ((f = 0) and (not eFIRSTNAME.Text.IsEmpty)) then
    CnErrors.SetError(eFIRSTNAME, rsCheckWrite, iaTopCenter, bsNeverBlink)
  else
    CnErrors.Dispose(eFIRSTNAME);

  if ((m = 0) and (not eMIDLENAME.Text.IsEmpty)) then
    CnErrors.SetError(eMIDLENAME, rsCheckWrite, iaTopCenter, bsNeverBlink)
  else
    CnErrors.Dispose(eMIDLENAME);
end;

end.
