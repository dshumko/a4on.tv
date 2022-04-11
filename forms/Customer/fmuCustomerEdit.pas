unit fmuCustomerEdit;
{$I defines.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AtrPages, StdCtrls, ToolCtrlsEh, GridsEh,
  DBGridEh, DBCtrls, DBCtrlsEh, Mask, Buttons, ExtCtrls, DB, FIBDataSet,
  pFIBDataSet, Menus, DBGridEhToolCtrls, DBAxisGridsEh, DBLookupEh,
  FIBQuery, pFIBQuery, MemTableDataEh, CnErrorProvider,
  EhLibVCL, System.UITypes, DBGridEhGrouping, DynVarsEh, FIBDatabase,
  pFIBDatabase, System.Actions, Vcl.ActnList, PropFilerEh, PropStorageEh;

type
  TapgCustomerEdit = class(TA4onPage)
    srcContacts: TDataSource;
    pnl1: TPanel;
    pnlContacts: TPanel;
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
    dsHouses: TpFIBDataSet;
    srcHouse: TDataSource;
    Query: TpFIBQuery;
    srcExecutor: TDataSource;
    dsExecutor: TpFIBDataSet;
    dsContacts: TpFIBDataSet;
    ColorDialog1: TColorDialog;
    CnErrors: TCnErrorProvider;
    dbmmoNOTICE: TDBMemoEh;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    trReadQ: TpFIBTransaction;
    scrlbx1: TScrollBox;
    spl1: TSplitter;
    pnlAddress: TPanel;
    Label19: TLabel;
    lblAccount: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label8: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    lblContract: TLabel;
    chkJURIDICAL: TDBCheckBoxEh;
    luCreator: TDBLookupComboboxEh;
    deDogovor: TDBEditEh;
    eACCOUNT_NO: TDBEditEh;
    eValid_to: TDBDateTimeEditEh;
    eCONTRACT_DATE: TDBDateTimeEditEh;
    btnGetDogNumber: TButton;
    LupStreets: TDBLookupComboboxEh;
    LupHOUSE_ID: TDBLookupComboboxEh;
    eFLAT_NO: TDBEditEh;
    edPORCH: TDBEditEh;
    edFLOOR: TDBEditEh;
    chkHAND: TDBCheckBoxEh;
    pnlFIZ: TPanel;
    Label3: TLabel;
    Label13: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    Label12: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    lbl9: TLabel;
    eSURNAME: TDBEditEh;
    edtPASSPORT_NUMBER: TDBEditEh;
    edtBIRTHDAY: TDBDateTimeEditEh;
    edtADRES_REGISTR: TDBEditEh;
    edRegistration: TDBEditEh;
    eFIRSTNAME: TDBEditEh;
    eMIDLENAME: TDBEditEh;
    edtPERSONAL_N: TDBEditEh;
    edtPlaceBirth: TDBEditEh;
    pnlJUR: TPanel;
    Label18: TLabel;
    lblINN: TLabel;
    Label17: TLabel;
    lbl4: TLabel;
    lblVAT: TLabel;
    Label16: TLabel;
    lbl1: TLabel;
    lbl8: TLabel;
    edSURNAME: TDBEditEh;
    eJURINN: TDBEditEh;
    eBUH: TDBEditEh;
    ed1: TDBEditEh;
    cbbVATG: TDBLookupComboboxEh;
    eDIRECTOR: TDBEditEh;
    edtBANK_ACCOUNT: TDBEditEh;
    edtBASIS: TDBEditEh;
    Panel2: TPanel;
    lblOrg: TLabel;
    Label7: TLabel;
    btn1: TSpeedButton;
    lbl7: TLabel;
    dbchkHiden: TDBCheckBox;
    btnSelectColor: TButton;
    btnClearColor: TButton;
    cbbORG_ID: TDBLookupComboboxEh;
    edtSECRET: TDBEditEh;
    edtExtID: TDBEditEh;
    pnlBtns: TPanel;
    Label11: TLabel;
    btnCall: TSpeedButton;
    Label14: TLabel;
    btnCAdd: TSpeedButton;
    btnCDel: TSpeedButton;
    Label20: TLabel;
    actlst1: TActionList;
    actMakeCall: TAction;
    PropStorageEh1: TPropStorageEh;
    pnlScan: TPanel;
    btnScan: TButton;
    actScan: TAction;
    actExAddressEdit: TAction;
    edtTO: TDBEditEh;
    lbl5: TLabel;
    btnCEdit: TSpeedButton;
    srcBanks: TDataSource;
    dsBANKS: TpFIBDataSet;
    lcbBANK: TDBLookupComboboxEh;
    Label15: TLabel;
    procedure dbgrdhContactsExit(Sender: TObject);
    procedure chkJURIDICALClick(Sender: TObject);
    procedure btnSelectColorClick(Sender: TObject);
    procedure btnGetDogNumberClick(Sender: TObject);
    procedure eFLAT_NOExit(Sender: TObject);
    procedure btnCAddClick(Sender: TObject);
    procedure btnCdelClick(Sender: TObject);
    procedure LupHOUSE_IDEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure LupStreetsEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dsContactsNewRecord(DataSet: TDataSet);
    procedure btnClearColorClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure LupHOUSE_IDExit(Sender: TObject);
    procedure LupStreetsExit(Sender: TObject);
    procedure eCONTRACT_DATEExit(Sender: TObject);
    procedure srcContactsUpdateData(Sender: TObject);
    procedure eSURNAMEExit(Sender: TObject);
    procedure eACCOUNT_NOExit(Sender: TObject);
    procedure edtExtIDExit(Sender: TObject);
    procedure edtBIRTHDAYExit(Sender: TObject);
    procedure edtBIRTHDAYEnter(Sender: TObject);
    procedure dbgrdhContactsDblClick(Sender: TObject);
    procedure actMakeCallExecute(Sender: TObject);
    procedure actScanExecute(Sender: TObject);
    procedure actExAddressEditExecute(Sender: TObject);
    procedure edtPERSONAL_NExit(Sender: TObject);
    procedure edtPASSPORT_NUMBERExit(Sender: TObject);
    procedure edtBANK_ACCOUNTExit(Sender: TObject);
    procedure edtBIKExit(Sender: TObject);
    procedure edtPASSPORT_NUMBEREnter(Sender: TObject);
    procedure edtPERSONAL_NEnter(Sender: TObject);
    procedure edtBANK_ACCOUNTEnter(Sender: TObject);
    procedure edtBIKEnter(Sender: TObject);
    procedure btnCEditClick(Sender: TObject);
    procedure dbgrdhContactsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure lcbBANKExit(Sender: TObject);
  private
    { Private declarations }
    FullAccess: Boolean;
    FNotIgnoreContract: Boolean;
    FDisableAddressEdit: Boolean;
    procedure GenerateAccountN;
    procedure SetJurVisible;
    procedure SetExAddressEdit(const DisableEdit: Boolean = False);
    procedure SetColor(const COLOR: String);
    function FindSameAccount(const ACCNT: string; const CurID: Integer): String;
    function FindSameExtID(const ExternalID: string; const CustomerID: Integer): String;
    procedure UpdateFloorPorch();
    procedure SaveContact;
    procedure TextToFileds(scResult: TStringList);
    function ParseCaptured(const _scanName: string; scResult: TStringList): Boolean;
    procedure CreateMainMenuItem;
    function CheckInBlackList(const Sender: TDBEditEh; const NT: Integer = 0) : Boolean;
    procedure CheckBankAccount;
    function CheckControlText(const Contrl: TDBEditEh; const regexp: String): Boolean;
    procedure CheckIOfromDB();
  public
    procedure InitForm; override;
    procedure OpenData; override;
    function ValidateData: Boolean; override;
    procedure SaveData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

uses DM, Typinfo, PrjConst, HouseForma, StreetEditForma, AtrStrUtils, MAIN, ScanImageForma, CustomerForma,
  RegularExpressions, AtrCommon, EditCFileForma, A4onTypeUnit, ContactForma;

{$R *.dfm}

function PropertyExists(aObject: TObject; const aPropertyName: String): Boolean;
begin
  Result := (GetPropInfo(aObject.ClassInfo, aPropertyName) <> nil);
end;

class function TapgCustomerEdit.GetPageName: string;
begin
  Result := rsEditCustomerForm;
end;

procedure TapgCustomerEdit.InitForm;
begin
  FullAccess := dmMain.AllowedAction(rght_Customer_full); // полный доступ
  FullAccess := FullAccess or dmMain.AllowedAction(rght_Customer_History); // изменение истории
  FNotIgnoreContract := dmMain.GetSettingsValue('IGNORE_CONTRACT') <> '1';

  dsContacts.DataSource := FDataSource;
  ds.DataSet := FDataSource.DataSet;

  dbchkHiden.Visible := dmMain.SuperMode > 0;
  // спрячем кнопку + для добавления адреса если это запрещено
  LupStreets.EditButtons[0].Visible :=
    ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street)));
  LupHOUSE_ID.EditButtons[0].Visible :=
    ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street)));

  if not ds.DataSet.FieldByName('HIS_COLOR').IsNull then
    SetColor(ds.DataSet.FieldByName('HIS_COLOR').Value);

  SetJurVisible;

  pnlScan.Visible := DirectoryExists(ExtractFileDir(Application.ExeName) + '\smartid');
  actScan.Enabled := pnlScan.Visible;

  FDisableAddressEdit := (dmMain.GetSettingsValue('EX_ADDRESS_EDIT') = '1');
  actExAddressEdit.Enabled := FDisableAddressEdit;
  actExAddressEdit.Visible := FDisableAddressEdit;
  if FDisableAddressEdit then
  begin
    CreateMainMenuItem;
  end;
  SetExAddressEdit(FDisableAddressEdit);

  // dsContacts.DataSource := FDataSource;
  // ds.DataSet := FDataSource.DataSet;
  // UpdatetNotice := False;
end;

procedure TapgCustomerEdit.lcbBANKExit(Sender: TObject);
begin
  CheckBankAccount;
end;

procedure TapgCustomerEdit.LupHOUSE_IDEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  i: int64;
begin
  if dsStreets.FieldByName('STREET_ID').IsNull then
    Exit;

  i := EditHouse(-1, dsStreets['STREET_ID']);
  if i > -1 then
  begin
    dsHouses.CloseOpen(True);
    LupHOUSE_ID.Value := i;
  end;
  Handled := True;
end;

procedure TapgCustomerEdit.LupStreetsEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  i: int64;
begin
  i := EditStreet(-1);
  if i > -1 then
  begin
    dsStreets.CloseOpen(True);
    LupStreets.Value := i;
  end;
  Handled := True;

end;

procedure TapgCustomerEdit.dbgrdhContactsDblClick(Sender: TObject);
begin
  actMakeCallExecute(Sender);
end;

procedure TapgCustomerEdit.dbgrdhContactsExit(Sender: TObject);
begin
  SaveContact;
end;

procedure TapgCustomerEdit.dbgrdhContactsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ActiveControl = dbgrdhContacts then
  begin
    case Key of
      VK_INSERT:
        btnCAdd.Click;
      VK_DELETE:
        btnCDel.Click;
      VK_F2:
        btnCEdit.Click;
    end;
  end;
end;

procedure TapgCustomerEdit.SaveContact;
begin
  if dsContacts.State in [dsEdit, dsInsert] then
    dsContacts.Post;
end;

procedure TapgCustomerEdit.dsContactsNewRecord(DataSet: TDataSet);
begin
  dsContacts['CUSTOMER_ID'] := ds.DataSet['CUSTOMER_ID'];
  dsContacts['CC_NOTIFY'] := 1;
end;

function TapgCustomerEdit.FindSameAccount(const ACCNT: string; const CurID: Integer): String;
var
  s: string;
begin
  Result := '';
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('select C.ACCOUNT_NO, C.SURNAME, C.FIRSTNAME, C.MIDLENAME, C.CUST_CODE, ');
  Query.SQL.Add(' C.CUST_STATE_DESCR, C.DEBT_SUM, C.DOGOVOR_NO ');
  Query.SQL.Add('from CUSTOMER C');
  Query.SQL.Add('where c.ACCOUNT_NO = :ACCOUNT_NO and c.CUSTOMER_ID <> :CUSTOMER_ID');
  Query.ParamByName('ACCOUNT_NO').Value := ACCNT;
  Query.ParamByName('CUSTOMER_ID').Value := CurID;
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
      s := Format(s, [eACCOUNT_NO.Text, Query.Fields[4].AsString, Query.Fields[1].AsString + ' ' +
        Query.Fields[2].AsString + ' ' + Query.Fields[3].AsString, Query.Fields[5].AsString, Query.Fields[6].AsFloat]);
    end
    else
      s := Format(s, [eACCOUNT_NO.Text, Query.Fields[4].AsString, Query.Fields[1].AsString + ' ' +
        Query.Fields[2].AsString + ' ' + Query.Fields[3].AsString, Query.Fields[5].AsString]);

    Result := s;

  end;
  Query.Transaction.Commit;
  Query.Close;
end;

procedure TapgCustomerEdit.eFLAT_NOExit(Sender: TObject);
begin
  if VarIsNull(LupHOUSE_ID.KeyValue) then
    Exit;
  if ds.DataSet.State in [dsInsert, dsEdit] then
  begin
    Query.SQL.Clear;
    Query.SQL.Add('select first 1 C.ACCOUNT_NO, C.SURNAME||coalesce('' ''||c.Initials, '''') FIO, ');
    Query.SQL.Add('    C.CUST_STATE_DESCR, C.DEBT_SUM, C.DOGOVOR_NO, f.Porch_N, f.Floor_N ');
    Query.SQL.Add('  from house h ');
    Query.SQL.Add('  left outer join customer c on (c.House_Id = h.House_Id and c.Flat_No = :flat_no ');
    Query.SQL.Add('                        and c.CUSTOMER_ID <> :CUSTOMER_ID) ');
    Query.SQL.Add('  left outer join HOUSEFLATS f on (f.House_Id = h.House_Id and f.Flat_No = :flat_no) ');
    Query.SQL.Add('  where h.House_Id=:house_id ');
    Query.SQL.Add('  order by c.VALID_TO');

    Query.ParamByName('HOUSE_ID').asInteger := LupHOUSE_ID.KeyValue;
    Query.ParamByName('FLAT_NO').AsString := eFLAT_NO.Text;
    Query.ParamByName('CUSTOMER_ID').Value := ds.DataSet['CUSTOMER_ID'];
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
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
      GenerateAccountN;
  end;
end;

procedure TapgCustomerEdit.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TapgCustomerEdit.FormShow(Sender: TObject);
begin
  if dmMain.CompanyCountry = 'RU' then
    lblINN.Caption := 'ИНН'
  else
    lblINN.Caption := 'УНП';
end;

procedure TapgCustomerEdit.OpenData;
begin
  dsContacts.Open;
  dsOrg.Open;
  dsVATG.Open;
  dsStreets.Open;
  dsHouses.Open;
  dsExecutor.Open;
end;

procedure TapgCustomerEdit.actExAddressEditExecute(Sender: TObject);
begin
  if not actExAddressEdit.Enabled then
    Exit;

  FDisableAddressEdit := not FDisableAddressEdit;
  SetExAddressEdit(FDisableAddressEdit);
end;

procedure TapgCustomerEdit.actMakeCallExecute(Sender: TObject);
begin
  if (dsContacts.RecordCount = 0) or (dsContacts.FieldByName('CC_TYPE').IsNull) or
    (dsContacts.FieldByName('CC_VALUE').IsNull) then
    Exit;

  A4MainForm.MakeCall(dsContacts['CC_TYPE'], dsContacts['CC_VALUE']);
end;

procedure TapgCustomerEdit.actScanExecute(Sender: TObject);
var
  scResult: TStringList;
  fileName: String;
  cr: TCursor;
  NeedSave: Boolean;
  ci: TCustomerInfo;
begin
  fileName := ScanDocument(True, NeedSave);
  if not fileName.IsEmpty then
  begin
    scResult := TStringList.Create;
    cr := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    try
      if ParseCaptured(fileName, scResult) then
      begin
        TextToFileds(scResult);
      end;
    finally
      FreeAndNil(scResult);
      Screen.Cursor := cr;
    end;
  end;

  NeedSave := NeedSave and ((dmMain.AllowedAction(rght_Customer_full)) or
    (dmMain.AllowedAction(rght_Customer_Files_add)));

  if NeedSave then
  begin
    with ci do
    begin
      if not ds.DataSet.FieldByName('CUSTOMER_ID').IsNull then
        CUSTOMER_ID := ds.DataSet['CUSTOMER_ID']
      else
        CUSTOMER_ID := -1;
      if not ds.DataSet.FieldByName('cust_code').IsNull then
        cust_code := ds.DataSet['cust_code'];
      if not ds.DataSet.FieldByName('Account_No').IsNull then
        Account_No := ds.DataSet['Account_No'];
      if not ds.DataSet.FieldByName('CUST_STATE_DESCR').IsNull then
        CUST_STATE_DESCR := ds.DataSet['CUST_STATE_DESCR'];
      if not ds.DataSet.FieldByName('Debt_sum').IsNull then
      begin
        if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
          Debt_sum := -1 * ds.DataSet['Debt_sum']
        else
          Debt_sum := ds.DataSet['Debt_sum'];
      end;
      if not ds.DataSet.FieldByName('SURNAME').IsNull then
        FIO := ds.DataSet['SURNAME'];
      if not ds.DataSet.FieldByName('FIRSTNAME').IsNull then
        FIO := trim(FIO + ' ' + ds.DataSet['FIRSTNAME']);
      if not ds.DataSet.FieldByName('MIDLENAME').IsNull then
        FIO := trim(FIO + ' ' + ds.DataSet['MIDLENAME']);
      if not ds.DataSet.FieldByName('street_ID').IsNull then
        STREET_ID := ds.DataSet['street_ID'];
      if not ds.DataSet.FieldByName('STREET_NAME').IsNull then
        STREET := ds.DataSet['STREET_NAME'];
      if not ds.DataSet.FieldByName('HOUSE_ID').IsNull then
        HOUSE_ID := ds.DataSet['HOUSE_ID'];
      if not ds.DataSet.FieldByName('House_No').IsNull then
        HOUSE_no := ds.DataSet['House_No'];
      if not ds.DataSet.FieldByName('FLAT_No').IsNull then
        FLAT_NO := ds.DataSet['FLAT_No'];
      if not ds.DataSet.FieldByName('notice').IsNull then
        notice := ds.DataSet['notice'];
      isType := 0
    end;
    EditFile(ci, 'Паспорт', -1, fileName);
  end;
end;

procedure TapgCustomerEdit.btn1Click(Sender: TObject);
begin
  edtSECRET.Text := GenPassword(8);
end;

procedure TapgCustomerEdit.btnCAddClick(Sender: TObject);
var
  Contact: TContact;
begin
  if not(dmMain.AllowedAction(rght_Customer_edit) or dmMain.AllowedAction(rght_Customer_full)) then
    Exit;

  if not dsContacts.Active then
    dsContacts.Open;

  Contact.cID := -1;
  Contact.CustID := ds.DataSet['CUSTOMER_ID'];
  if EditContact(Contact) then
  begin
    dsContacts.Insert;
    dsContacts['CUSTOMER_ID'] := ds.DataSet['CUSTOMER_ID'];
    dsContacts['CC_TYPE'] := Contact.cID;
    dsContacts['CC_VALUE'] := Contact.Contact;
    dsContacts['CC_NOTICE'] := Contact.notice;
    dsContacts['Cc_Notify'] := Contact.Notify;
    dsContacts['O_Name'] := Contact.cType;
    dsContacts.Post;
    dbgrdhContacts.SetFocus;
  end
end;

procedure TapgCustomerEdit.btnCdelClick(Sender: TObject);
var
  s: String;
begin
  if not dsContacts.Active then
    Exit;
  if dsContacts.RecordCount = 0 then
    Exit;

  if not dsContacts.FieldByName('CC_VALUE').IsNull then
    s := Format(rsDeleteWithName, [dsContacts.FieldByName('CC_VALUE').AsString])
  else
    s := rsContactDelete;

  if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    dsContacts.Delete;
end;

procedure TapgCustomerEdit.btnCEditClick(Sender: TObject);
var
  Contact: TContact;
begin
  if not(dmMain.AllowedAction(rght_Customer_edit) or dmMain.AllowedAction(rght_Customer_full)) then
    Exit;
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

  Contact.CustID := ds.DataSet['CUSTOMER_ID'];
  if EditContact(Contact) then
  begin
    if dsContacts.RecordCount > 0 then
      dsContacts.Edit
    else
      dsContacts.Insert;
    dsContacts['CUSTOMER_ID'] := ds.DataSet['CUSTOMER_ID'];
    dsContacts['CC_TYPE'] := Contact.cID;
    dsContacts['CC_VALUE'] := Contact.Contact;
    dsContacts['CC_NOTICE'] := Contact.notice;
    dsContacts['Cc_Notify'] := Contact.Notify;
    dsContacts['O_Name'] := Contact.cType;
    dsContacts.Post;
    dbgrdhContacts.SetFocus;
  end
end;

procedure TapgCustomerEdit.btnGetDogNumberClick(Sender: TObject);
begin
  GenerateAccountN;
end;

procedure TapgCustomerEdit.btnSelectColorClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
  begin
    if not(ds.State in [dsInsert, dsEdit]) then
      ds.DataSet.Edit;
    ds.DataSet['HIS_COLOR'] := ColorToString(ColorDialog1.COLOR);
    Self.COLOR := ColorDialog1.COLOR;
  end;
end;

procedure TapgCustomerEdit.btnClearColorClick(Sender: TObject);
begin
  if not(ds.DataSet.State in [dsInsert, dsEdit]) then
    ds.DataSet.Edit;
  ds.DataSet.FieldByName('HIS_COLOR').Clear;
  Self.COLOR := clBtnFace;
end;

procedure TapgCustomerEdit.chkJURIDICALClick(Sender: TObject);
begin
  SetJurVisible;
end;

procedure TapgCustomerEdit.SaveData;
begin
  UpdateFloorPorch();
end;

procedure TapgCustomerEdit.CloseData;
begin
  SaveContact;
  dsContacts.Close;
  // dsCustomerMEM.Close;
  dsContacts.Close;
  dsOrg.Close;
  dsVATG.Close;
  dsStreets.Close;
  dsHouses.Close;
  dsExecutor.Close;
end;

procedure TapgCustomerEdit.GenerateAccountN;
var
  flat: string;
begin
  if LupHOUSE_ID.Text = '' then
  begin
    CnErrors.SetError(LupHOUSE_ID, rsSelectHouse, iaTopCenter, bsNeverBlink);
    LupHOUSE_ID.SetFocus;
    Exit;
  end
  else
    CnErrors.Dispose(LupHOUSE_ID);

  flat := eFLAT_NO.Text;
  eACCOUNT_NO.Text := dmMain.GenerateDogNumber(LupHOUSE_ID.Value, flat, -1);
  if (dmMain.GetSettingsValue('ACCOUNT_DOG') = 1) then
    deDogovor.Text := eACCOUNT_NO.Text;
end;

procedure TapgCustomerEdit.SetJurVisible;
begin
  // Важна последовательность включения
  Panel2.Visible := False;
  if chkJURIDICAL.Checked then
  begin
    pnlFIZ.Visible := False;
    pnlJUR.Visible := True;
  end
  else
  begin
    pnlJUR.Visible := False;
    pnlFIZ.Visible := True;
  end;
  dsBANKS.Active := pnlJUR.Visible;
  // scrlbx1.Realign;
  Panel2.Visible := True;
end;

procedure TapgCustomerEdit.SetExAddressEdit(const DisableEdit: Boolean = False);
var
  i: Integer;
begin
  for i := 0 to pnlAddress.ControlCount - 1 do
  begin
    if (pnlAddress.Controls[i] is TDBLookupComboboxEh) then
      (pnlAddress.Controls[i] as TDBLookupComboboxEh).ReadOnly := DisableEdit
    else if (pnlAddress.Controls[i] is TDBEditEh) then
      (pnlAddress.Controls[i] as TDBEditEh).ReadOnly := DisableEdit
    else if (pnlAddress.Controls[i] is TDBEditEh) then
      (pnlAddress.Controls[i] as TDBCheckBoxEh).ReadOnly := DisableEdit
    else if (pnlAddress.Controls[i] is TButton) then
      (pnlAddress.Controls[i] as TButton).Enabled := not DisableEdit;
  end;
end;

procedure TapgCustomerEdit.SetColor(const COLOR: String);
begin
  try
    Self.COLOR := StringToColor(COLOR);
  except
    Self.COLOR := clBtnFace;
  end;
end;

function TapgCustomerEdit.ValidateData: Boolean;
var
  s: string;
begin
  { TODO : Сделать сохранение этажа / подъезда при нажатии зеленой галочки
    if (Assigned(ActiveControl)) and ((ActiveControl.Name = edPORCH.Name) or (ActiveControl.Name = edFLOOR.Name))
    then begin
    UpdateFloorPorch();
    end;
  }
  Result := True;
  if not ds.DataSet.Active then
    Exit;

  if (LupStreets.Text = '') then
  begin
    Result := False;
    CnErrors.SetError(LupStreets, rsSelectStreet, iaTopCenter, bsNeverBlink);
  end
  else
    CnErrors.Dispose(LupStreets);

  if (LupHOUSE_ID.Text = '') then
  begin
    Result := False;
    CnErrors.SetError(LupHOUSE_ID, rsSelectHouse, iaTopCenter, bsNeverBlink);
  end
  else
    CnErrors.Dispose(LupHOUSE_ID);

  if (eACCOUNT_NO.Text = '') then
  begin
    Result := False;
    CnErrors.SetError(eACCOUNT_NO, rsSelectAccount, iaTopCenter, bsNeverBlink);
  end
  else
  begin
    s := FindSameAccount(eACCOUNT_NO.Text, ds.DataSet['CUSTOMER_ID']);
    if (s <> '') then
    begin
      Result := False;
      CnErrors.SetError(eACCOUNT_NO, s, iaTopCenter, bsNeverBlink);
    end
    else
      CnErrors.Dispose(eACCOUNT_NO);
  end;

  if (not edtPERSONAL_N.Text.IsEmpty) then
  begin
    if CheckControlText(edtPERSONAL_N, dmMain.GetSettingsValue('REG_PERSN'))
    then begin
      if not CheckInBlackList(edtPERSONAL_N)
      then Result := False;
    end
    else Result := False;
  end
  else CnErrors.Dispose(edtPERSONAL_N);

  if (not edtPASSPORT_NUMBER.Text.IsEmpty) then
  begin
    if CheckControlText(edtPASSPORT_NUMBER, dmMain.GetSettingsValue('REG_PASSN'))
    then begin
      if not CheckInBlackList(edtPASSPORT_NUMBER, 1)
      then Result := False;
    end
    else Result := False;
  end
  else CnErrors.Dispose(edtPASSPORT_NUMBER);

  if (not FullAccess) and (FNotIgnoreContract) and
    (not(ds.DataSet.FieldByName('CONTRACT_DATE').IsNull and (VarIsEmpty(eCONTRACT_DATE.Value) or
    VarIsNull(eCONTRACT_DATE.Value)))) and ((ds.DataSet.FieldByName('CONTRACT_DATE').OldValue <> eCONTRACT_DATE.Value)
    and ((ds.DataSet.FieldByName('CONTRACT_DATE').OldValue < dmMain.CurrentMonth) or
    (eCONTRACT_DATE.Value < dmMain.CurrentMonth))) then
  begin
    Result := False;
    CnErrors.SetError(eCONTRACT_DATE, rsContractDateError, iaTopCenter, bsNeverBlink);
  end
  else
    CnErrors.Dispose(eCONTRACT_DATE);
end;

procedure TapgCustomerEdit.LupHOUSE_IDExit(Sender: TObject);
begin
  ValidateData;
  if (ds.DataSet.FieldByName('HOUSE_ID').OldValue <> LupHOUSE_ID.Value) then
  begin
    if (not edPORCH.Text.IsEmpty) then
    begin
      CnErrors.SetError(edPORCH, 'Проверьте этаж. был ' + edPORCH.Text, iaTopCenter, bsNeverBlink);
      edPORCH.Text := '';
    end;
    if (not edFLOOR.Text.IsEmpty) then
    begin
      CnErrors.SetError(edFLOOR, 'Проверьте подъезд. был ' + edFLOOR.Text, iaTopCenter, bsNeverBlink);
      edFLOOR.Text := '';
    end;
  end;
end;

procedure TapgCustomerEdit.LupStreetsExit(Sender: TObject);
begin
  ValidateData;
end;

procedure TapgCustomerEdit.eCONTRACT_DATEExit(Sender: TObject);
begin
  ValidateData;
end;

procedure TapgCustomerEdit.srcContactsUpdateData(Sender: TObject);
begin
  if dsContacts.State in [dsInsert, dsEdit] then
  begin
    if (dsContacts.FieldByName('CC_VALUE').IsNull) or (trim(dsContacts.FieldByName('CC_VALUE').AsString) = '') then
      dsContacts.Cancel;
  end;
end;

procedure TapgCustomerEdit.eSURNAMEExit(Sender: TObject);
var
  s: string;
begin
  s := (Sender as TDBEditEh).Text;
  if (length(s) > 0) and (ds.State in [dsEdit, dsInsert]) then
  begin
    (Sender as TDBEditEh).Text := NormalizeFIO(s);
  end;
  CheckIOfromDB();
end;

procedure TapgCustomerEdit.eACCOUNT_NOExit(Sender: TObject);
begin
  ValidateData;
end;

function TapgCustomerEdit.FindSameExtID(const ExternalID: string; const CustomerID: Integer): String;
var
  s: string;
begin
  Result := '';
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('select C.ACCOUNT_NO, C.SURNAME, C.FIRSTNAME, C.MIDLENAME, C.CUST_CODE, ');
  Query.SQL.Add(' C.CUST_STATE_DESCR, C.DEBT_SUM, C.DOGOVOR_NO ');
  Query.SQL.Add('from CUSTOMER C');
  Query.SQL.Add('where c.EXTERNAL_ID = :EXTERNAL_ID and c.CUSTOMER_ID <> :CUSTOMER_ID');
  Query.ParamByName('EXTERNAL_ID').Value := ExternalID;
  Query.ParamByName('CUSTOMER_ID').Value := CustomerID;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.ExecQuery;
  if not(Query.Fields[0].IsNull) then
  begin
    s := rsExtIDExists + rsEOL + rsCODE + ': %s ' + rsEOL + rsFIO + ': %s ' + rsEOL + rsSTATE + ': %s';
    if (dmMain.AllowedAction(rght_Customer_Debt)) or (dmMain.AllowedAction(rght_Customer_full)) // просмотр сумм
    then
    begin
      s := s + rsEOL;
      if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
        s := s + rsBALANCE
      else
        s := s + rsSALDO;
      s := s + ': %8.2f';
      s := Format(s, [eACCOUNT_NO.Text, Query.Fields[4].AsString, Query.Fields[1].AsString + ' ' +
        Query.Fields[2].AsString + ' ' + Query.Fields[3].AsString, Query.Fields[5].AsString, Query.Fields[6].AsFloat]);
    end
    else
      s := Format(s, [eACCOUNT_NO.Text, Query.Fields[4].AsString, Query.Fields[1].AsString + ' ' +
        Query.Fields[2].AsString + ' ' + Query.Fields[3].AsString, Query.Fields[5].AsString]);

    Result := s;

  end;
  Query.Transaction.Commit;
  Query.Close;
end;

procedure TapgCustomerEdit.edtPASSPORT_NUMBEREnter(Sender: TObject);
begin
  if dmMain.CompanyCountry = 'BY' then
  begin
    if (dmMain.GetIniValue('KBDSWITCH') = '0') then
      SetKeyboardLayout('EN')
    else
      dmMain.SaveKLAndSelectEnglish;
  end;
end;

procedure TapgCustomerEdit.edtPASSPORT_NUMBERExit(Sender: TObject);
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

procedure TapgCustomerEdit.edtBANK_ACCOUNTEnter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

procedure TapgCustomerEdit.edtBANK_ACCOUNTExit(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;

  CheckBankAccount;
end;

procedure TapgCustomerEdit.edtBIKEnter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

procedure TapgCustomerEdit.edtBIKExit(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;
  CheckBankAccount;
end;

procedure TapgCustomerEdit.edtBIRTHDAYEnter(Sender: TObject);
begin
  CnErrors.Dispose(edtBIRTHDAY);
end;

procedure TapgCustomerEdit.edtBIRTHDAYExit(Sender: TObject);
var
  d: TDateTime;
begin
  if (edtBIRTHDAY.Text.replace(' ', '').length > 2) and (not(TryStrToDate(edtBIRTHDAY.Text, d))) then
  begin
    CnErrors.SetError(edtBIRTHDAY, rsInputIncorrect, iaTopCenter, bsNeverBlink);
    edtBIRTHDAY.SetFocus;
  end;
end;

procedure TapgCustomerEdit.edtExtIDExit(Sender: TObject);
var
  s: string;
begin
  if not ds.DataSet.Active then
    Exit;

  if (edtExtID.Text <> '') then
  begin
    s := FindSameExtID(edtExtID.Text, ds.DataSet['CUSTOMER_ID']);
    if (s <> '') then
      CnErrors.SetError(edtExtID, s, iaMiddleLeft, bsNeverBlink)
    else
      CnErrors.Dispose(edtExtID);
  end
  else
    CnErrors.Dispose(edtExtID);
end;

procedure TapgCustomerEdit.UpdateFloorPorch();
var
  qry: TpFIBQuery;
begin
  if ((edFLOOR.Text <> '') or (edPORCH.Text <> '')) and (eFLAT_NO.Text <> '') and (LupHOUSE_ID.Text <> '') then
  begin
    qry := TpFIBQuery.Create(Nil);
    with qry do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text := 'execute procedure Set_Flat_Pf(:House_Id, :Flat_No, :Porch_N, :Floor_N)';
        if (edPORCH.Text <> '') then
          ParamByName('PORCH_N').Value := edPORCH.Text;
        if (edFLOOR.Text <> '') then
          ParamByName('FLOOR_N').Value := edFLOOR.Text;
        ParamByName('FLAT_NO').Value := eFLAT_NO.Text;
        ParamByName('HOUSE_ID').Value := LupHOUSE_ID.KeyValue;
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;
  end;
end;

procedure TapgCustomerEdit.TextToFileds(scResult: TStringList);
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
    ds.DataSet.Edit;
  p_RO := '';
  P_RD := '';
  for i := 0 to scResult.Count - 1 do
  begin
    s := trim(scResult[i]);
    r := Explode(']', s);
    if length(r) > 0 then
    begin
      s := r[0];
      s := Copy(s, 1, pos(' ', s) - 1);
      if s = 'name' then
        eFIRSTNAME.Text := NormalizeFIO(trim(r[1]))
      else if s = 'surname' then
        eSURNAME.Text := NormalizeFIO(trim(r[1]))
      else if s = 'patronymic' then
        eMIDLENAME.Text := NormalizeFIO(trim(r[1]))
      else if s = 'birthdate' then
      begin
        s := trim(r[1]);
        try
          d := StrToDate(s, fs);
          edtBIRTHDAY.Value := d;
        except
          //
        end;
      end
      else if s = 'birthplace' then
        edtPlaceBirth.Text := trim(r[1])
      else if s = 'series' then
      begin
        ps := trim(r[1]);
      end
      else if s = 'number' then
      begin
        pn := trim(r[1]);
      end
      else if s = 'authority' then
        p_RO := trim(r[1])
      else if s = 'issue_date' then
      begin
        s := trim(r[1]);
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
    edtPASSPORT_NUMBER.Text := trim(ps + ' ' + pn);
    CheckInBlackList(edtPASSPORT_NUMBER, 1);
  end;
  edRegistration.Text := trim(P_RD + ' ' + p_RO);
end;

function TapgCustomerEdit.ParseCaptured(const _scanName: string; scResult: TStringList): Boolean;
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

procedure TapgCustomerEdit.CreateMainMenuItem;
var
  item: TMenuItem;

  AOwner: TComponent;
  mmMenu: TComponent;
begin
  AOwner := Self.Owner;
  mmMenu := AOwner.FindComponent('mmiCustomer');

  if not Assigned(mmMenu) then
    Exit;

  if not(mmMenu is TMenuItem) then
    Exit;

  item := TMenuItem.Create(Self);
  item.Caption := '-';
  (mmMenu as TMenuItem).Add(item);

  item := TMenuItem.Create(Self);
  item.Action := actExAddressEdit;
  (mmMenu as TMenuItem).Add(item);
end;

procedure TapgCustomerEdit.edtPERSONAL_NEnter(Sender: TObject);
begin
  if dmMain.CompanyCountry = 'BY' then
  begin
    if (dmMain.GetIniValue('KBDSWITCH') = '0') then
      SetKeyboardLayout('EN')
    else
      dmMain.SaveKLAndSelectEnglish;
  end;
end;

procedure TapgCustomerEdit.edtPERSONAL_NExit(Sender: TObject);
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

function TapgCustomerEdit.CheckInBlackList(const Sender: TDBEditEh; const NT: Integer = 0) : Boolean;
var
  s, n: string;
begin
  // NT 0 - Личный номер 1 - номер паспота
  CnErrors.Dispose(Sender);
  Result:= True;
  if (Sender.Text = '') then begin
    if ((Owner<>Nil) and (Owner is TCustomerForm)) then
      (Owner as TCustomerForm).actSave.Enabled := True;
    Exit;
  end;
  s := '';
  n := trim(Sender.Text);
  if ds.DataSet.State in [dsInsert, dsEdit] then
  begin
    Query.SQL.Clear;
    Query.SQL.Add('select o.O_Name, o.O_Description, o.O_Charfield');
    Query.SQL.Add('from objects o where o.O_Type = 31 ');
    Query.SQL.Add(' and upper(replace(replace(o.O_Name, '' '', ''''), ''№'', '''')) ');
    Query.SQL.Add('     = upper(replace(replace(cast(:PN as VARCHAR(500)), '' '', ''''), ''№'', ''''))');
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

  Result := s.IsEmpty;
  if ((Owner<>Nil) and (Owner is TCustomerForm)) then begin
    //
    (Owner as TCustomerForm).actSave.Enabled := (s.IsEmpty) or dmMain.AllowedAction(rght_Customer_full);
  end;

  if (not Result) then
  begin
    CnErrors.SetError(Sender, rsCustomerInBlackList + #13#10 + s, iaTopCenter, bsNeverBlink);
    ShowMessage(rsCustomerInBlackList + #13#10 + s);
  end;
end;

procedure TapgCustomerEdit.CheckBankAccount;
var
  bav: Boolean;
begin
  if (edtBANK_ACCOUNT.Text.IsEmpty) then
    Exit;

  bav := True;
  if dmMain.CompanyCountry = 'BY' then
    bav := CheckIBAN(edtBANK_ACCOUNT.Text)
  else if dmMain.CompanyCountry = 'RU' then
  begin
    if (not lcbBANK.Text.IsEmpty) and (not dsBANKS.FieldByName('BIK').IsNull) then
      bav := CheckRusBA(edtBANK_ACCOUNT.Text, dsBANKS['BIK']);
  end;

  if bav then
    CnErrors.Dispose(edtBANK_ACCOUNT)
  else
    CnErrors.SetError(edtBANK_ACCOUNT, Format(rsErrorQuestWT, ['р/с']), iaMiddleLeft, bsNeverBlink);

  if ((lcbBANK.Text.IsEmpty) and (not edtBANK_ACCOUNT.Text.IsEmpty)) then
    CnErrors.SetError(lcbBANK, rsRequiredField, iaMiddleLeft, bsNeverBlink)
  else
    CnErrors.Dispose(lcbBANK);
end;

function TapgCustomerEdit.CheckControlText(const Contrl: TDBEditEh; const regexp: String): Boolean;
begin
  Result := True;
  if (Contrl.Text.IsEmpty or regexp.IsEmpty) then
    Exit;

  Result := TRegEx.IsMatch(Contrl.Text, '^' + regexp + '$');
  if (not Result) then
    CnErrors.SetError(Contrl, rsInputIncorrect, iaTopCenter, bsNeverBlink)
  else
    CnErrors.Dispose(Contrl);
end;

procedure TapgCustomerEdit.CheckIOfromDB();
var
  f, m: Integer;
begin
  if ((eFIRSTNAME.Text.IsEmpty) and (eMIDLENAME.Text.IsEmpty)) then
    Exit;

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
