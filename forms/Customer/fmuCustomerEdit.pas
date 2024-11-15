﻿unit fmuCustomerEdit;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.ActnList,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, DBCtrlsEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh,
  DBLookupEh,
  FIBQuery, pFIBQuery, MemTableDataEh, CnErrorProvider, EhLibVCL, DBGridEhGrouping, DynVarsEh, FIBDatabase,
  pFIBDatabase, EhLibFIB,
  PropFilerEh, PropStorageEh, amSplitter;

type
  TapgCustomerEdit = class(TA4onPage)
    srcContacts: TDataSource;
    pnlRight: TPanel;
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
    pnlWarningInfo: TPanel;
    mmoWarning: TDBMemoEh;
    btnCloseWarningInfo: TButton;
    procedure dbgrdhContactsExit(Sender: TObject);
    procedure chkJURIDICALClick(Sender: TObject);
    procedure btnSelectColorClick(Sender: TObject);
    procedure btnGetDogNumberClick(Sender: TObject);
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
    procedure eSURNAMEEnter(Sender: TObject);
    procedure eFIRSTNAMEEnter(Sender: TObject);
    procedure LupHOUSE_IDChange(Sender: TObject);
    procedure btnCloseWarningInfoClick(Sender: TObject);
    procedure eFLAT_NOExit(Sender: TObject);
    procedure dbgrdhContactsGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    { Private declarations }
    FullAccess: Boolean;
    FPersonalData: Boolean;
    FNotIgnoreContract: Boolean;
    FDisableAddressEdit: Boolean;
    FSavedFloor: string;
    FSavedPorch: string;
    FSavedFlat: string;
    FSavedHouseID: Integer;
    FOldNumber: string;
    FEnterSecondPress: Boolean;
    FGenAccountFlat: string;
    FGenAccountHouse: Integer;
    procedure FindSamePassport;
    procedure GenerateAccountN;
    procedure SetJurVisible;
    procedure SetExAddressEdit(const DisableEdit: Boolean = False);
    procedure SetColor(const COLOR: String);
    function FindSameAccount(const ACCNT: string; const CurID: Integer): String;
    function FindSameExtID(const ExternalID: string; const CustomerID: Integer): String;
    procedure CheckPorchandFloor();
    procedure UpdateFloorPorch();
    procedure SaveFlatOwner();
    function CheckFlatOwner(var OldOwner: String): Boolean;
    procedure SaveContact;
    procedure TextToFileds(scResult: TStringList);
    function ParseCaptured(const _scanName: string; scResult: TStringList): Boolean;
    procedure CreateMainMenuItem;
    function CheckInBlackList(const Sender: TDBEditEh; const NT: Integer = 0): Boolean;
    procedure CheckBankAccount;
    function CheckControlText(const Contrl: TDBEditEh; const regexp: String): Boolean;
    procedure CheckIOfromDB();
    procedure ShowWarningMessage(const s: String);
    procedure HideWarningMessage;
    function GetOrderClause(grid: TCustomDBGridEh): string;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    function ValidateData: Boolean; override;
    procedure SaveData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

uses
  System.TypInfo, System.RegularExpressions,
  DM, PrjConst, HouseForma, StreetEditForma, AtrStrUtils, MAIN, ScanImageForma, CustomerForma, AtrCommon,
  EditCFileForma, A4onTypeUnit, ContactForma;

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
  FPersonalData := (not dmMain.AllowedAction(rght_Customer_PersonalData));

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
  FGenAccountFlat := '';
  FGenAccountHouse := -1;
end;

procedure TapgCustomerEdit.lcbBANKExit(Sender: TObject);
begin
  CheckBankAccount;
end;

procedure TapgCustomerEdit.LupHOUSE_IDChange(Sender: TObject);
begin
  CheckPorchandFloor;
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

procedure TapgCustomerEdit.dbgrdhContactsGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (not (Sender as TDBGridEh).DataSource.DataSet.FieldByName('Cc_Notify').IsNull) //
    and ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('Cc_Notify').AsInteger = 1) then
      Background := $00D7FFD7;
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

procedure TapgCustomerEdit.eFIRSTNAMEEnter(Sender: TObject);
begin
  if ((dmMain.CompanyCountry = 'BY') or (dmMain.CompanyCountry = 'RU')) then
  begin
    if (dmMain.GetIniValue('KBDSWITCH') = '0') then
      SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
    else
      dmMain.RestoreKL;
  end;
end;

procedure TapgCustomerEdit.eFLAT_NOExit(Sender: TObject);
begin
  if ds.DataSet.State = dsInsert then
    GenerateAccountN;
end;

procedure TapgCustomerEdit.CheckPorchandFloor;
begin
  if VarIsNull(LupHOUSE_ID.KeyValue) then
    Exit;

  if (FSavedHouseID = LupHOUSE_ID.Value) and (FSavedFlat = eFLAT_NO.Text) then
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

    if (edPORCH.Text <> FSavedPorch) then
      CnErrors.SetError(edPORCH, 'Проверьте подъезд, был: ' + FSavedPorch, iaTopCenter, bsNeverBlink);

    if not(Query.FN('FLOOR_N').IsNull) then
      edFLOOR.Text := Query.FN('FLOOR_N').AsString;

    if (edFLOOR.Text <> FSavedFloor) then
      CnErrors.SetError(edFLOOR, 'Проверьте этаж, был: ' + FSavedFloor, iaTopCenter, bsNeverBlink);

    if not(Query.FN('ACCOUNT_NO').IsNull) then
      ShowWarningMessage(rsSAME_ADRES + rsEOL + Format(rsCustomerInfo, [Query.FN('ACCOUNT_NO').AsString,
        Query.FN('DOGOVOR_NO').AsString, Query.FN('FIO').AsString, Query.FN('DEBT_SUM').AsString,
        Query.FN('CUST_STATE_DESCR').AsString]));
    Query.Transaction.Commit;
    Query.Close;
  end;
end;

procedure TapgCustomerEdit.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := True;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBComboBoxEh) then
      go := not(ActiveControl as TDBComboBoxEh).ListVisible
    else if (ActiveControl is TDBGridEh) then
      go := False
    else
    begin
      if (ActiveControl is TDBMemoEh) and
        (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
      begin
        go := False;
        FEnterSecondPress := True;
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

procedure TapgCustomerEdit.FormShow(Sender: TObject);
begin
  if dmMain.CompanyCountry = 'RU' then
    lblINN.Caption := 'ИНН'
  else
    lblINN.Caption := 'УНП';
end;

function TapgCustomerEdit.GetOrderClause(grid: TCustomDBGridEh): string;
var
  s: string;
  i, J: Integer;
begin
  J := grid.SortMarkedColumns.Count;
  s := ' ';
  for i := 0 to pred(J) do
  begin
      s := s + grid.SortMarkedColumns[i].FieldName;

    if grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
      s := s + ' desc';
    if i <> pred(J) then
      s := s + ', ';
  end;
  Result := s;
end;

procedure TapgCustomerEdit.OpenData;
var
  s : string;
begin

  dsOrg.Open;
  dsVATG.Open;
  dsStreets.Open;
  dsHouses.Open;
  dsExecutor.Open;

  if not ds.DataSet.FieldByName('PORCH_N').IsNull then
    FSavedPorch := ds.DataSet['PORCH_N'];
  if not ds.DataSet.FieldByName('FLOOR_N').IsNull then
    FSavedFloor := ds.DataSet['FLOOR_N'];
  if not ds.DataSet.FieldByName('FLOOR_N').IsNull then
    FSavedFloor := ds.DataSet['FLOOR_N'];
  if not ds.DataSet.FieldByName('FLAT_NO').IsNull then
    FSavedFlat := ds.DataSet['FLAT_NO'];
  if not ds.DataSet.FieldByName('HOUSE_ID').IsNull then
    FSavedHouseID := ds.DataSet['HOUSE_ID']
  else
    FSavedHouseID := -1;

  LupHOUSE_ID.OnChange := LupHOUSE_IDChange;
  eFLAT_NO.OnChange := LupHOUSE_IDChange;

  if (not dsContacts.Active) then begin
    s := A4MainForm.GetIniFileName;
    dbgrdhContacts.RestoreColumnsLayoutIni(s, 'apgCustomerEdit.dbgrdhContacts',
        [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
    s := GetOrderClause(dbgrdhContacts);
    dsContacts.OrderClause := s;
    dsContacts.Open;
  end;
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
        FIO := Trim(FIO + ' ' + ds.DataSet['FIRSTNAME']);
      if not ds.DataSet.FieldByName('MIDLENAME').IsNull then
        FIO := Trim(FIO + ' ' + ds.DataSet['MIDLENAME']);
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
  FGenAccountHouse := -1;
  FGenAccountFlat := '';
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

procedure TapgCustomerEdit.btnCloseWarningInfoClick(Sender: TObject);
begin
  HideWarningMessage;
end;

procedure TapgCustomerEdit.chkJURIDICALClick(Sender: TObject);
begin
  SetJurVisible;
end;

procedure TapgCustomerEdit.SaveData;
var
  s: string;
  b: Boolean;
begin
  UpdateFloorPorch();
  // Владелец квартиры
  if (dmMain.GetSettingsValue('FLAT_OWNER') = '1') then
  begin
    // проверим, владелиц ли квартиры и пометим если да
    b := CheckFlatOwner(s);
    if not s.IsEmpty then
      s := rsQstFlatOwner + #13#10 + 'Прежний: ' + s
    else
      s := rsQstFlatOwner;
    if (not b) and (Application.MessageBox(PWideChar(s), PWideChar(rsAplicationName),
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES) then
    begin
      SaveFlatOwner;
    end
  end;
end;

procedure TapgCustomerEdit.CloseData;
var
  ini: string;
begin
  ini := A4MainForm.GetIniFileName;
  dbgrdhContacts.SaveColumnsLayoutIni(ini, 'apgCustomerEdit.dbgrdhContacts' , false);

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

  if (FGenAccountHouse <> LupHOUSE_ID.Value) or (FGenAccountFlat <> flat) then
  begin
    FGenAccountHouse := LupHOUSE_ID.Value;
    FGenAccountFlat := flat;
    eACCOUNT_NO.Text := dmMain.GenerateDogNumber(LupHOUSE_ID.Value, flat, -1);
    if (dmMain.GetSettingsValue('ACCOUNT_DOG') = 1) then
      deDogovor.Text := eACCOUNT_NO.Text;
  end;
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

    eSURNAME.Visible := FPersonalData;
    edtPASSPORT_NUMBER.Visible := FPersonalData;
    edRegistration.Visible := FPersonalData;
    edtBIRTHDAY.Visible := FPersonalData;
    edtPERSONAL_N.Visible := FPersonalData;
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
  reg: string;
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

  if (eACCOUNT_NO.Text = '') then
  begin
    Result := False;
    CnErrors.SetError(eACCOUNT_NO, rsSelectAccount, iaTopCenter, bsNeverBlink);
  end
  else
  begin
    reg := dmMain.GetSettingsValue('ACCOUNT_CHK');
    if reg <> '' then
    begin
      reg := reg.Trim(['^', '$']);
      Result := TRegEx.IsMatch(eACCOUNT_NO.Text, '^' + reg + '$');
      if not Result then
      begin
        CnErrors.SetError(lblAccount, Format(rsINPUT_VALUE_FORMAT, [reg]), iaMiddleRight, bsNeverBlink);
      end
      else
        CnErrors.Dispose(lblAccount);
    end;

    if Result then
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
  end;

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

  if (FPersonalData) and (not edtPERSONAL_N.Text.IsEmpty) then
  begin
    if CheckControlText(edtPERSONAL_N, dmMain.GetSettingsValue('REG_PERSN')) then
    begin
      if not CheckInBlackList(edtPERSONAL_N) then
        Result := False;
    end
    else
      Result := False;
  end
  else
    CnErrors.Dispose(edtPERSONAL_N);

  if (FPersonalData) and (not edtPASSPORT_NUMBER.Text.IsEmpty) then
  begin
    if CheckControlText(edtPASSPORT_NUMBER, dmMain.GetSettingsValue('REG_PASSN')) then
    begin
      if not CheckInBlackList(edtPASSPORT_NUMBER, 1) then
        Result := False;
    end
    else
      Result := False;
  end
  else
    CnErrors.Dispose(edtPASSPORT_NUMBER);

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
  CheckPorchandFloor;
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
    if (dsContacts.FieldByName('CC_VALUE').IsNull) or (Trim(dsContacts.FieldByName('CC_VALUE').AsString) = '') then
      dsContacts.Cancel;
  end;
end;

procedure TapgCustomerEdit.eSURNAMEEnter(Sender: TObject);
begin
  if ((dmMain.CompanyCountry = 'BY') or (dmMain.CompanyCountry = 'RU')) then
  begin
    if (dmMain.GetIniValue('KBDSWITCH') = '0') then
      SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
    else
      dmMain.RestoreKL;
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
var
  s: string;
begin
  s := DelBlankChars(eACCOUNT_NO.Text);
  if (s <> eACCOUNT_NO.Text) then
    eACCOUNT_NO.Text := s;

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
  FOldNumber := edtPASSPORT_NUMBER.Text;
  if ((dmMain.CompanyCountry = 'BY') or (dmMain.CompanyCountry = 'RU')) then
  begin
    if (dmMain.GetIniValue('KBDSWITCH') = '0') then
      SetKeyboardLayout('EN')
    else
      dmMain.SaveKLAndSelectEnglish;
  end;
end;

procedure TapgCustomerEdit.edtPASSPORT_NUMBERExit(Sender: TObject);
var
  s: string;
begin

  s := (Sender as TDBEditEh).Text;
  (Sender as TDBEditEh).Text := Trim(s);

  if FOldNumber <> (Sender as TDBEditEh).Text then
    FindSamePassport;

  if ((dmMain.CompanyCountry = 'BY') or (dmMain.CompanyCountry = 'RU')) then
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
  if (edtBIRTHDAY.Text.Replace(' ', '').length > 2) and (not(TryStrToDate(edtBIRTHDAY.Text, d))) then
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
  if (eFLAT_NO.Text <> '') and (LupHOUSE_ID.Text <> '') then
  begin
    if (edFLOOR.Text <> FSavedFloor) or (edPORCH.Text <> FSavedPorch) or (eFLAT_NO.Text <> FSavedFlat) or
      (LupHOUSE_ID.Value <> FSavedHouseID) then
    begin
      qry := TpFIBQuery.Create(Nil);
      with qry do
      begin
        try
          DataBase := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          SQL.Text := 'execute procedure Set_Flat_Pf(:House_Id, :Flat_No, :Porch_N, :Floor_N)';
          ParamByName('PORCH_N').Value := edPORCH.Text;
          ParamByName('FLOOR_N').Value := edFLOOR.Text;
          ParamByName('FLAT_NO').Value := eFLAT_NO.Text;
          ParamByName('HOUSE_ID').Value := LupHOUSE_ID.KeyValue;

          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
          FSavedFloor := edFLOOR.Text;
          FSavedPorch := edPORCH.Text;
          FSavedFlat := eFLAT_NO.Text;
          FSavedHouseID := LupHOUSE_ID.Value;
        finally
          Free;
        end;
      end;
    end;
  end;
end;

function TapgCustomerEdit.CheckFlatOwner(var OldOwner: String): Boolean;
var
  n: string;
begin
  Result := False;
  OldOwner := '';
  Query.Transaction := trReadQ;
  n := Trim(eSURNAME.Text + ' ' + eFIRSTNAME.Text + ' ' + eMIDLENAME.Text);

  Query.SQL.Clear;
  Query.SQL.Add('execute block (');
  Query.SQL.Add('    House_Id   integer = :House_Id,');
  Query.SQL.Add('    Flat_No    D_FLAT_NS = :Flat_No,');
  Query.SQL.Add('    OWNER_NAME D_VARCHAR100 = :OWNER_NAME,');
  Query.SQL.Add('    OWNER_DOC  D_VARCHAR255 = :OWNER_DOC)');
  Query.SQL.Add('returns (itsOwner D_INTEGER, ownerS D_VARCHAR255)');
  Query.SQL.Add('as');
  Query.SQL.Add('begin');
  Query.SQL.Add('  itsOwner = 0;');
  Query.SQL.Add('  select');
  Query.SQL.Add('      count(*)');
  Query.SQL.Add('    from Houseflats');
  Query.SQL.Add('    where House_Id = :House_Id');
  Query.SQL.Add('          and Flat_No = :Flat_No');
  Query.SQL.Add('          and Owner_Name = :Owner_Name');
  Query.SQL.Add('          and Owner_Doc = :Owner_Doc');
  Query.SQL.Add('  into :itsOwner;');
  Query.SQL.Add('  if (itsOwner = 0) then');
  Query.SQL.Add('    select');
  Query.SQL.Add('        list(Owner_Name||'' ''||Owner_Doc)');
  Query.SQL.Add('      from Houseflats');
  Query.SQL.Add('      where House_Id = :House_Id');
  Query.SQL.Add('            and Flat_No = :Flat_No');
  Query.SQL.Add('    into :ownerS;');
  Query.SQL.Add('  suspend;');
  Query.SQL.Add('end');

  Query.ParamByName('House_Id').asInteger := LupHOUSE_ID.KeyValue;
  Query.ParamByName('Flat_No').AsString := eFLAT_NO.Text;
  Query.ParamByName('OWNER_NAME').AsString := n;
  Query.ParamByName('OWNER_DOC').AsString := edtPASSPORT_NUMBER.Text;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if not(Query.FN('itsOwner').IsNull) then
  begin
    Result := (Query.FN('itsOwner').asInteger > 0);
  end;
  if not(Query.FN('ownerS').IsNull) then
  begin
    OldOwner := Query.FN('ownerS').AsString;
  end;
  Query.Transaction.Commit;
  Query.Close;

  Query.Transaction := trReadQ;
end;

procedure TapgCustomerEdit.SaveFlatOwner();
var
  oQuery: TpFIBQuery;
  s: string;
begin
  s := Trim(eSURNAME.Text + ' ' + eFIRSTNAME.Text + ' ' + eMIDLENAME.Text);
  oQuery := TpFIBQuery.Create(Nil);
  with oQuery do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;

      oQuery.SQL.Clear;
      oQuery.SQL.Add('execute block (');
      oQuery.SQL.Add('    House_Id   integer = :House_Id,');
      oQuery.SQL.Add('    Flat_No    D_FLAT_NS = :Flat_No,');
      oQuery.SQL.Add('    OWNER_NAME D_VARCHAR100 = :OWNER_NAME,');
      oQuery.SQL.Add('    OWNER_DOC  D_VARCHAR255 = :OWNER_DOC)');
      oQuery.SQL.Add('as');
      oQuery.SQL.Add('begin');
      oQuery.SQL.Add('  update or insert into Houseflats (House_Id, Flat_No, Owner_Name, Owner_Doc)');
      oQuery.SQL.Add('  values (:House_Id, :Flat_No, :Owner_Name, :Owner_Doc)');
      oQuery.SQL.Add('  matching(House_Id, Flat_No);');
      oQuery.SQL.Add('end');

      oQuery.ParamByName('House_Id').asInteger := LupHOUSE_ID.KeyValue;
      oQuery.ParamByName('Flat_No').AsString := eFLAT_NO.Text;
      oQuery.ParamByName('OWNER_NAME').AsString := s;
      oQuery.ParamByName('OWNER_DOC').AsString := edtPASSPORT_NUMBER.Text;
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
    s := Trim(scResult[i]);
    r := Explode(']', s);
    if length(r) > 0 then
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

function TapgCustomerEdit.ParseCaptured(const _scanName: string; scResult: TStringList): Boolean;
begin
  Result := A4MainForm.ParseCaptured(_scanName, scResult);
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

function TapgCustomerEdit.CheckInBlackList(const Sender: TDBEditEh; const NT: Integer = 0): Boolean;
var
  s, n: string;
begin
  // NT 0 - Личный номер 1 - номер паспота
  CnErrors.Dispose(Sender);
  Result := True;
  if (Sender.Text = '') then
  begin
    if ((Owner <> Nil) and (Owner is TCustomerForm)) then
      (Owner as TCustomerForm).actSave.Enabled := True;
    Exit;
  end;
  s := '';
  n := Trim(Sender.Text);
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
  if ((Owner <> Nil) and (Owner is TCustomerForm)) then
  begin
    //
    (Owner as TCustomerForm).actSave.Enabled := (s.IsEmpty) or dmMain.AllowedAction(rght_Customer_full);
  end;

  if (not Result) then
  begin
    CnErrors.SetError(Sender, rsCustomerInBlackList + #13#10 + s, iaTopCenter, bsNeverBlink);
    ShowWarningMessage(rsCustomerInBlackList + #13#10 + s);
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

procedure TapgCustomerEdit.ShowWarningMessage(const s: String);
begin
  mmoWarning.Lines.Text := s;
  pnlWarningInfo.Visible := True;
end;

procedure TapgCustomerEdit.HideWarningMessage;
begin
  pnlWarningInfo.Visible := False;
end;

procedure TapgCustomerEdit.FindSamePassport;
var
  s, n: string;
begin
  n := Trim(edtPASSPORT_NUMBER.Text);
  if n.IsEmpty then
    Exit;

  Query.SQL.Clear;

  if (dmMain.GetSettingsValue('SHOW_DOC_LIST') = '1') then
  begin
    Query.SQL.Add('select first 1 d.Surname, d.Firstname, d.Midlename, d.PERSONAL_N');
    Query.SQL.Add(', d.Doc_Reg, d.Birthday, d.Addr_Registr, d.Addr_Birth, d.Doc_Date');
    Query.SQL.Add('from DOC_LIST d');
    Query.SQL.Add('where d.Doc_Number = :PN and d.Doc_Type = 1');
    Query.SQL.Add('UNION ALL');
  end;
  Query.SQL.Add('select first 1 c.Surname, c.Firstname, c.Midlename, c.PERSONAL_N');
  Query.SQL.Add(', c.Passport_Registration Doc_Reg, c.Birthday, c.ADRES_REGISTR Addr_Registr');
  Query.SQL.Add(', c.CONTRACT_BASIS Addr_Birth, null Doc_Date');
  Query.SQL.Add('from customer c where c.Passport_Number = :PN');
  Query.SQL.Add(' and c.CUSTOMER_ID <> :CID');

  Query.ParamByName('PN').AsString := n;
  Query.ParamByName('CID').asInteger := ds.DataSet['CUSTOMER_ID'];
  Query.Transaction.StartTransaction;
  Query.ExecQuery;

  if (Query.RecordCount > 0) then
  begin
    s := '';
    if not(Query.FN('Surname').IsNull) then
      s := s + Query.FN('Surname').AsString;
    if not(Query.FN('Firstname').IsNull) then
      s := s + ' ' + Query.FN('Firstname').AsString;
    if not(Query.FN('Midlename').IsNull) then
      s := s + ' ' + Query.FN('Midlename').AsString;
    s := s.Trim + #13#10;
    if not(Query.FN('Birthday').IsNull) then
      s := s + ' д.р. ' + Query.FN('Birthday').AsString;
    if not(Query.FN('Doc_Reg').IsNull) then
      s := s + ' ' + Query.FN('Doc_Reg').AsString;
    s := s.Trim + #13#10;
    if not(Query.FN('Addr_Registr').IsNull) then
      s := s + ' ' + Query.FN('Addr_Registr').AsString;
    s := s.Trim;

    if Application.MessageBox(PWideChar('Найдены паспортные данные. '#13#10 + s + #13#10'Прописать их в карточку?'),
      'Найдены паспортные данные', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      if not(Query.FN('Surname').IsNull) then
        eSURNAME.Text := Query.FN('Surname').AsString
      else
        eSURNAME.Text := '';
      if not(Query.FN('Firstname').IsNull) then
        eFIRSTNAME.Text := Query.FN('Firstname').AsString
      else
        eFIRSTNAME.Text := Text;
      if not(Query.FN('Midlename').IsNull) then
        eMIDLENAME.Text := Query.FN('Midlename').AsString
      else
        eMIDLENAME.Text := '';
      if not(Query.FN('Doc_Reg').IsNull) then
        edRegistration.Text := Query.FN('Doc_Reg').AsString
      else
        edRegistration.Text := '';
      if not(Query.FN('Addr_Registr').IsNull) then
        edtADRES_REGISTR.Text := Query.FN('Addr_Registr').AsString
      else
        edtADRES_REGISTR.Text := '';
      if not(Query.FN('Birthday').IsNull) then
        edtBIRTHDAY.Value := Query.FN('Birthday').AsDate
      else
        edtBIRTHDAY.Clear;
      if not(Query.FN('Addr_Birth').IsNull) then
        edtPlaceBirth.Text := Query.FN('Addr_Birth').AsString
      else
        edtPlaceBirth.Text := '';

      if (dmMain.GetSettingsValue('SHOW_DOC_LIST') <> '1') then
      begin
        if not(Query.FN('PERSONAL_N').IsNull) then
          edtPERSONAL_N.Text := Query.FN('PERSONAL_N').AsString
        else
          edtPERSONAL_N.Text := '';
      end;
    end;
  end;
  Query.Transaction.Commit;
  Query.Close;
end;

end.
