unit CustomerForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.UITypes, System.Actions, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ActnList, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Menus, Vcl.Controls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask, Vcl.DBCtrls,
  PropStorageEh, FIBQuery, pFIBQuery, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, GridsEh, DBGridEh, MemTableDataEh,
  MemTableEh, EhLibVCL, DBAxisGridsEh, fmuCustomerBalance, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  PropFilerEh, DBCtrlsEh, DBLookupEh, AtrPages;

type
  TCustomerForm = class(TForm)
    pnlForms: TPanel;
    pnlDATA: TPanel;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsCustomer: TpFIBDataSet;
    mmCustomer: TMainMenu;
    mmiCustomer: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    miDelete: TMenuItem;
    srcCustomer: TDataSource;
    Query: TpFIBQuery;
    spl1: TSplitter;
    Actions: TActionList;
    actPrint: TAction;
    actEdit: TAction;
    actFilterCustomer: TAction;
    actDouble: TAction;
    ToolBar1: TToolBar;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    ToolButton8: TToolButton;
    btnFilterCustomer: TToolButton;
    ToolButton1: TToolButton;
    actSave: TAction;
    ActCancel: TAction;
    ToolButton2: TToolButton;
    sprtr1: TToolButton;
    sprtr2: TToolButton;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Splitter1: TSplitter;
    prpstrgh1: TPropStorageEh;
    dbgForms: TDBGridEh;
    srcPages: TDataSource;
    mtbPages: TMemTableEh;
    pnlTop: TPanel;
    pnlMain: TPanel;
    actCustNode: TAction;
    miCustNode: TMenuItem;
    actPrepay: TAction;
    miPrepay: TMenuItem;
    actTask: TAction;
    miTask: TMenuItem;
    miN1: TMenuItem;
    ActAddPayment: TAction;
    miActAddPayment: TMenuItem;
    actRequest: TAction;
    miRequest: TMenuItem;
    actRecAdd: TAction;
    miRecAdd: TMenuItem;
    actNPS: TAction;
    miNPS: TMenuItem;
    actResetpassword: TAction;
    miN2: TMenuItem;
    miResetpassword: TMenuItem;
    actCheckPassport: TAction;
    miCheckPassport: TMenuItem;
    actDelete: TAction;
    actOrderTP: TAction;
    miOrderTP: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actFilterCustomerExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure ActCancelExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure srcPagesDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure actCustNodeExecute(Sender: TObject);
    procedure actPrepayExecute(Sender: TObject);
    procedure actTaskExecute(Sender: TObject);
    procedure ActAddPaymentExecute(Sender: TObject);
    procedure actRecAddExecute(Sender: TObject);
    procedure actNPSExecute(Sender: TObject);
    procedure actResetpasswordExecute(Sender: TObject);
    procedure actCheckPassportExecute(Sender: TObject);
    procedure actRequestExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actOrderTPExecute(Sender: TObject);
  private
    FLastPage: TA4onPage;
    FInfoPage: TA4onPage;
    // FBalancePage: TA4onPage;
    FPageList: TA4onPages;
    FInEditState: Boolean;
    FCheckPassport: Boolean;
    procedure StartEdit();
    procedure StopEdit(const Cancel: Boolean);
    procedure CreateCustomerPage(const Edit: Boolean = False);
    procedure ShowPage(const index: Integer);
    procedure UpdateCommands;
    procedure StartCommand(Sender: TObject);
    procedure UpdatePage(Sender: TObject);
    procedure SwitchIfoTab(const next: Boolean);
    procedure ValidatePassport;
    procedure InitSecurity;
  public
    constructor CreateA(AOwner: TComponent; aCustomer: Integer; const Edit: Boolean = False);
    destructor Destroy; override;
  end;

procedure ShowCustomer(aCustomer: Integer; const Edit: Boolean = False);

implementation

{$R *.dfm}

uses
  AtrCommon, AtrStrUtils, MAIN, DM, CF, PrjConst, OverbyteIcsWndControl, OverbyteIcsHttpProt, OverbyteIcsWSocket, OverbyteIcsUrl,
  fmuCustomerInfo, fmuCustomerSrv, fmuCustomerPayments, fmuCustomerSingleSrv, fmuCustomerKoef, fmuCustomerLetters,
  fmuCustomerRecourse, fmuCustomerRequests, fmuCustomerAttributes, fmuCustomerLan, fmuCustomerInternet, fmuCustomerCard,
  fmuCustomerDigit, fmuCustomerEdit, fmuCustomerBonus, fmuCustomerFiles, fmuCustomerMaterialsMove, fmuCustomerAppl, PaymentForma,
  RequestNewForma, RecourseForma, NPSAddForma, OrderTPForma, A4onTypeUnit, TextEditForma;

procedure ShowCustomer(aCustomer: Integer; const Edit: Boolean = False);
var
  i: Integer;
  finded: Integer;
  fCnt: Integer;
begin
  finded := -1;
  fCnt := 0;
  for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
    if Assigned(A4MainForm.MDIChildren[i]) then
      if (A4MainForm.MDIChildren[i] is TCustomerForm) then
      begin
        Inc(fCnt);
        if (A4MainForm.MDIChildren[i].tag = aCustomer) then
          finded := i;
      end;

  if finded = -1 then
  begin
    if fCnt > 10 then
    begin
      if Application.MessageBox(PChar(rsManyCustomerForm), PChar(rsManyCustomerFormCaption), MB_YESNO + MB_ICONWARNING)
        = IDYES then
      begin
        for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
          if Assigned(A4MainForm.MDIChildren[i]) then
            if (A4MainForm.MDIChildren[i] is TCustomerForm) then
              A4MainForm.MDIChildren[i].Close;
      end;
    end;

    TCustomerForm.CreateA(Application, aCustomer, Edit);
  end
  else
    A4MainForm.MDIChildren[finded].Show;
end;

procedure TCustomerForm.ActAddPaymentExecute(Sender: TObject);
var
  dt: TDate;
  sm: Currency;
begin
  dt := NOW;
  sm := 0;
  ReceivePayment(dsCustomer['CUSTOMER_ID'], -1, -1, dt, sm);
end;

procedure TCustomerForm.ActCancelExecute(Sender: TObject);
begin
  if actSave.Visible then
  begin
    StopEdit(true);
    dbgForms.SetFocus;
  end
  else
  begin
    Close;
  end;
end;

procedure TCustomerForm.actCheckPassportExecute(Sender: TObject);
begin
  ValidatePassport;
end;

procedure TCustomerForm.actCustNodeExecute(Sender: TObject);
begin
  if (dsCustomer.FieldByName('HOUSE_ID').IsNull) or (dsCustomer.FieldByName('FLAT_NO').IsNull) then
    Exit;

  A4MainForm.OpnenNodeByFlat(dsCustomer['HOUSE_ID'], dsCustomer['FLAT_NO']);
end;

procedure TCustomerForm.actDeleteExecute(Sender: TObject);
var
  s: string;
begin
  if dmMain.InStrictMode then
    Exit;

  if (dsCustomer.RecordCount = 0) then
    Exit;

  If MessageDlg(rsDeleteCustomerWarning, mtConfirmation, [mbYes, mbNo], 0, mbNo) <> mrYes then
    Exit;

  s := '';
  if not(dsCustomer.FieldByName('SURNAME').IsNull) then
    s := s + dsCustomer['SURNAME'];
  if not(dsCustomer.FieldByName('INITIALS').IsNull) then
    s := s + ' ' + dsCustomer['INITIALS'];
  s := s + rsACCOUNT + ' ' + dsCustomer['ACCOUNT_NO'] + '?';

  If MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbNo, mbYes], 0) = mrNo then
    Exit;

  dsCustomer.Delete;
  Close;
end;

procedure TCustomerForm.actEditExecute(Sender: TObject);
begin
  StartEdit;
end;

procedure TCustomerForm.actFilterCustomerExecute(Sender: TObject);
var
  customers: string;
begin
  if dsCustomer.State in [dsEdit, dsInsert] then
    Exit;

  customers := dsCustomer.FieldByName('CUSTOMER_ID').AsString;

  if (customers <> '') then
    ShowCustomers(7, customers);
end;

procedure TCustomerForm.actNPSExecute(Sender: TObject);
begin
  if (dsCustomer.RecordCount = 0) or dsCustomer.FieldByName('CUSTOMER_ID').IsNull then
    Exit;

  if not(dmMain.AllowedAction(rght_Customer_full) or dmMain.AllowedAction(rght_Customer_NPS)) then
    Exit;

  AddNpsRating(dsCustomer['CUSTOMER_ID']);
end;

procedure TCustomerForm.actOrderTPExecute(Sender: TObject);
var
  ci: TCustomerInfo;
begin
  ci.CUSTOMER_ID := dsCustomer.FieldByName('CUSTOMER_ID').AsInteger;
  ci.cust_code := dsCustomer.FieldByName('cust_code').AsString;
  ci.Account_No := dsCustomer.FieldByName('Account_No').AsString;
  ci.CUST_STATE_DESCR := dsCustomer.FieldByName('CUST_STATE_DESCR').AsString;

  if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
    ci.Debt_sum := -1 * dsCustomer.FieldByName('Debt_sum').AsCurrency
  else
    ci.Debt_sum := dsCustomer.FieldByName('Debt_sum').AsCurrency;

  ci.FIO := Trim(dsCustomer.FieldByName('Surname').AsString + ' ' + dsCustomer.FieldByName('Firstname').AsString + ' ' +
    dsCustomer.FieldByName('Midlename').AsString);
  ci.STREET_ID := dsCustomer.FieldByName('street_ID').AsInteger;
  ci.STREET := dsCustomer.FieldByName('STREET_SHORT').AsString + ' ' + dsCustomer.FieldByName('STREET_NAME').AsString;
  ci.HOUSE_ID := dsCustomer.FieldByName('HOUSE_ID').AsInteger;
  ci.HOUSE_no := dsCustomer.FieldByName('House_No').AsString;
  ci.FLAT_NO := dsCustomer.FieldByName('FLAT_No').AsString;
  ci.phone_no := dsCustomer.FieldByName('phone_no').AsString;
  ci.mobile := dsCustomer.FieldByName('MOBILE_PHONE').AsString;
  ci.notice := dsCustomer.FieldByName('notice').AsString;
  ci.Color := dsCustomer.FieldByName('HIS_COLOR').AsString;
  ci.isType := 0;
  ci.INN := dsCustomer.FieldByName('JUR_INN').AsString;
  ci.isJur := dsCustomer.FieldByName('Juridical').AsInteger;
  if ci.isJur = 1 then
    ci.FIO := Trim(dsCustomer.FieldByName('Firstname').AsString + ' ' + dsCustomer.FieldByName('Surname').AsString);
  CreateOrderTPForCustomer(-1, ci);
end;

procedure TCustomerForm.actPrepayExecute(Sender: TObject);
var
  s: string;
  v: Extended;
  Save_Cursor: TCursor;

  procedure AddPrepay(const psum: Extended; cid: Integer);
  begin
    with TpFIBQuery.Create(Self) do
    begin
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        sql.Text := 'execute procedure Set_Prepay(:Customer_Id, :Prepay_Sum)';
        ParamByName('Prepay_Sum').value := psum; // v;
        ParamByName('Customer_Id').value := cid; // dsCustomers.FieldByName('customer_id').AsInteger;
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
        Close;
      finally
        Free;
      end;
    end;
  end;

begin
  s := '0';
  if InputQuery(rsPrepay, rsAmount, s) then
  begin
    if TryStrToFloat(s, v) then
    begin
      Save_Cursor := Screen.Cursor;
      Screen.Cursor := crHourGlass;
      AddPrepay(v, dsCustomer['customer_id']);
      Screen.Cursor := Save_Cursor;
    end;
  end;
end;

procedure TCustomerForm.actRecAddExecute(Sender: TObject);
begin
  if (not dmMain.AllowedAction(rght_Recourses_add)) then
    Exit;

  if not dsCustomer.FieldByName('CUSTOMER_ID').IsNull then
    EditRecourse(dsCustomer.FieldByName('CUSTOMER_ID').AsInteger)
end;

procedure TCustomerForm.actRequestExecute(Sender: TObject);
var
  aCustomer: Integer;
begin
  if (not(dmMain.AllowedAction(rght_Request_Add) or dmMain.AllowedAction(rght_Request_Full))) then
    Exit;
  if (dsCustomer.RecordCount > 0) and (not dsCustomer.FieldByName('CUSTOMER_ID').IsNull) then
    aCustomer := dsCustomer['CUSTOMER_ID']
  else
    aCustomer := -1;

  NewRequest(aCustomer);
end;

procedure TCustomerForm.actResetpasswordExecute(Sender: TObject);
var
  pswd: String;
begin
  // Сброс пароля
  if (dsCustomer.RecordCount = 0) or (dsCustomer.FieldByName('CUSTOMER_ID').IsNull) then
    Exit;

  if (not dmMain.AllowedAction(rght_Customer_PSWD)) then
    Exit;

  pswd := GenPassword(8);
  EditText(pswd, 'Новый пароль', Format('Абоненту %s будет установлен пароль', [dsCustomer['ACCOUNT_NO']]));
  with TpFIBQuery.Create(Self) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      sql.Text := 'UPDATE customer set Secret = :pswd where Customer_Id = :CID';
      ParamByName('pswd').AsString := pswd;
      ParamByName('CID').AsInteger := dsCustomer['CUSTOMER_ID'];
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      Close;
    finally
      Free;
    end;
  end;
end;

procedure TCustomerForm.actSaveExecute(Sender: TObject);
begin
  if FInEditState then
    StopEdit(False);
end;

procedure TCustomerForm.actTaskExecute(Sender: TObject);
begin
  if (dsCustomer.RecordCount = 0) or (dsCustomer.FieldByName('ACCOUNT_NO').IsNull) then
    Exit;
  A4MainForm.MakeTask('A', dsCustomer['ACCOUNT_NO'], nil);
end;

constructor TCustomerForm.CreateA(AOwner: TComponent; aCustomer: Integer; const Edit: Boolean = False);
var
  CanEdit: Boolean;
begin
  inherited Create(AOwner);
  FInEditState := Edit;
  dsCustomer.ParamByName('CUSTOMER_ID').AsInteger := aCustomer;
  dsCustomer.Open;
  tag := aCustomer;

  CanEdit := dmMain.AllowedAction(rght_Customer_add) or dmMain.AllowedAction(rght_Customer_edit) or
    (dmMain.AllowedAction(rght_Customer_full));

  FPageList := TA4onPages.Create;

  if aCustomer <> -1 then
  begin
    Caption := 'А';
    if not dsCustomer.FieldByName('ACCOUNT_NO').IsNull then
      Caption := Caption + ' ' + dsCustomer['ACCOUNT_NO'];
    if not dsCustomer.FieldByName('SURNAME').IsNull then
      Caption := Caption + ' ' + dsCustomer['SURNAME'];

    CreateCustomerPage(Edit and CanEdit);
    FPageList.Add(TapgCustomerSrv);
    FPageList.Add(TapgCustomerSingleSrv);
    FPageList.Add(TapgCustomerKoef);
    FPageList.Add(TapgCustomerPayments);
    FPageList.Add(TapgCustomerRequests);
    FPageList.Add(TapgCustomerAttributes);
    FPageList.Add(TapgCustomerDigit);
    FPageList.Add(TapgCustomerLan);
    FPageList.Add(TapgCustomerInternet);
    FPageList.Add(TapgCustomerLetters);
    FPageList.Add(TapgCustomerRecourse);
    FPageList.Add(TapgCustomerBonus);
    FPageList.Add(TapgCustomerFiles);
    FPageList.Add(TapgCustomerMaterialsMove);
    FPageList.Add(TapgCustomerAppl);
    FPageList.Add(TapgCustomerCard);
    FPageList.Add(TapgCustomerBalance);
  end;
  UpdateCommands;

  actEdit.Enabled := ((not Edit) and CanEdit);
  actSave.Enabled := (Edit and CanEdit);
end;

procedure TCustomerForm.UpdateCommands;
var
  i: Integer;
  PageName: string;
begin
  if mtbPages.Active then
    mtbPages.Close;
  mtbPages.Open;
  mtbPages.DisableControls;
  if Assigned(FPageList) then
  begin
    try
      for i := 0 to FPageList.Count - 1 do
      begin
        PageName := FPageList[i].PageClass.GetPageName;
        mtbPages.Append;
        mtbPages['id'] := i;
        mtbPages['name'] := PageName;
        mtbPages.Post;
      end;
      mtbPages.First;
    finally
      mtbPages.EnableControls;
    end;
    if FPageList.Count > 0 then
    begin
      ShowPage(0);
    end;
  end;
end;

procedure TCustomerForm.StartCommand(Sender: TObject);
begin
  //
end;

procedure TCustomerForm.UpdatePage(Sender: TObject);
begin
  if not FInEditState then
  begin
    dsCustomer.Refresh;
    if Assigned(FInfoPage) then
    begin
      FInfoPage.UpdateObject;
    end;
  end;
end;

procedure TCustomerForm.ShowPage(const index: Integer);
var
  Item: TA4onPageItem;
  Page: TA4onPage;
begin
  if (Index < 0) or (Index >= FPageList.Count) then
    raise Exception.Create('Invalid page index');
  Item := FPageList[Index];
  if Item.Page = nil then
  begin
    Item.Page := Item.PageClass.CreatePage(Self, srcCustomer);
    Page := Item.Page;
    Page.InitForm;
    Page.OnUpdate := UpdatePage;
    Page.OnStart := StartCommand;
    Page.BorderStyle := bsNone;
    Page.Parent := pnlDATA;
    Page.Width := pnlDATA.ClientHeight;
    Page.Height := pnlDATA.ClientHeight;
  end
  else
    Page := Item.Page;

  if Page <> FLastPage then
  begin
    Page.Align := alClient;
    Page.Visible := true;
    Page.Width := pnlDATA.ClientWidth;
    Page.OpenData;

    if FLastPage <> nil then
    begin
      FLastPage.Visible := False;
      FLastPage.CloseData;
    end;
    FLastPage := Page;
  end;
end;

procedure TCustomerForm.srcPagesDataChange(Sender: TObject; Field: TField);
begin
  if not mtbPages.FieldByName('ID').IsNull then
    ShowPage(mtbPages['ID']);
end;

procedure TCustomerForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  if Assigned(FPageList) then
  begin
    for i := FPageList.Count - 1 downto 0 do
    begin
      if Assigned(FPageList[i].Page) then
      begin
        FPageList[i].Page.SaveState;
        FPageList[i].Page.CloseData;
        FPageList[i].Free;
      end;
    end;
    FPageList.Free;
  end;

  if Assigned(FInfoPage) then
  begin
    FInfoPage.CloseData;
    FInfoPage.Free;
    FInfoPage := nil;
    // FreeAndNil(FInfoPage);
  end;

  Action := caFree;
end;

destructor TCustomerForm.Destroy;
begin
  inherited Destroy;
end;

procedure TCustomerForm.StartEdit();
begin
  actEdit.Enabled := False;
  FInEditState := true;
  CreateCustomerPage(true);
end;

procedure TCustomerForm.CreateCustomerPage(const Edit: Boolean = False);
var
  CanEdit: Boolean;
begin
  CanEdit := dmMain.AllowedAction(rght_Customer_add) or dmMain.AllowedAction(rght_Customer_edit) or
    (dmMain.AllowedAction(rght_Customer_full));

  if Assigned(FInfoPage) then
  begin
    FInfoPage.CloseData;
    FInfoPage := nil;
  end;

  if not Edit then
  begin
    FInfoPage := TapgCustomerInfo.CreatePage(Self, srcCustomer);
    // (FInfoPage as TapgCustomerInfo).pnlInfo.Enabled := False;
  end
  else
  begin
    FInfoPage := TapgCustomerEdit.CreatePage(Self, srcCustomer);
  end;

  with FInfoPage do
  begin
    Parent := pnlMain;
    OnUpdate := UpdatePage;
    OnStart := StartCommand;
    BorderStyle := bsNone;
    Align := alClient;
    Visible := true;
    if Edit then
      FInfoPage.SetFocus;
    InitForm;
    OpenData;
  end;

  actEdit.Visible := not Edit;
  actSave.Enabled := CanEdit;
  actSave.Visible := Edit;
  ActCancel.Visible := Edit;
  sprtr1.Visible := Edit;
  sprtr2.Visible := Edit;
end;

procedure TCustomerForm.StopEdit(const Cancel: Boolean);
var
  CanSave: Boolean;
begin

  if not Cancel then
  begin
    if (not Assigned(FInfoPage)) then
      CanSave := true
    else
    begin
      CanSave := (FInfoPage.ValidateData);
      if not CanSave then
      begin
        CanSave := (Application.MessageBox(PWideChar(rsErrorQuestContinue), PWideChar(rsError),
          MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK);
      end;

      if (CanSave and (dsCustomer.State in [dsEdit, dsInsert])) then
      begin
        FInfoPage.SaveData;
        dsCustomer.Post;
      end;
    end;
  end
  else
  begin
    CanSave := true;
    if dsCustomer.State in [dsEdit, dsInsert] then
      dsCustomer.Cancel;
  end;

  if CanSave then
  begin
    actEdit.Enabled := true;
    FInEditState := False;
    // ActCancel.Enabled := False;
    actSave.Enabled := False;
    CreateCustomerPage(False);
  end;
end;

procedure TCustomerForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and ((Ord(Key) = VK_UP) or (Ord(Key) = VK_DOWN)) then
  begin
    SwitchIfoTab((Ord(Key) = VK_DOWN));
    Key := 0;
  end
  else if FInEditState and (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    StopEdit(False);
end;

procedure TCustomerForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Ord(Key) = VK_RETURN) then
  begin
    go := true;
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

procedure TCustomerForm.FormShow(Sender: TObject);
var
  i: Integer;
  Font_size: Integer;
  Font_name: string;
begin
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TDBGridEh then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
    end;
  end;

  InitSecurity;
end;

procedure TCustomerForm.SwitchIfoTab(const next: Boolean);
begin
  if (not mtbPages.FieldByName('ID').IsNull) then
  begin
    if next then
    begin
      if mtbPages.Eof then
        mtbPages.First
      else
        mtbPages.next;
    end
    else
    begin
      if mtbPages.BOF then
        mtbPages.Last
      else
        mtbPages.Prior;
    end;
  end;
end;

procedure TCustomerForm.ValidatePassport;
var
  FHttpCli: TSslHttpCli;
  FSslContext: TSslContext;
  Datax: TStringStream;
  url: string;
  unp, ps, pn: string;
  answer: string;
  pValid: Integer;
  qry: TpFIBQuery;

  edtPERSONAL_N, edtPASSPORT_NUMBER: string;
  eFIRSTNAME: string;
  eSURNAME: string;
  eMIDLENAME: string;

  function HasInvalidChar(const s: string): Boolean;
  var
    i: Integer;
  begin
    i := 1;
    Result := False;
    while (i <= Length(s)) do
    begin
      if (not CharInSet(s[i], [' ', '0' .. '9', 'a' .. 'z', 'A' .. 'Z'])) then
        Result := true;
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

  function GetV(const FN: string): String;
  begin
    if (not dsCustomer.FieldByName(FN).IsNull) then
      Result := dsCustomer[FN]
    else
      Result := '';
  end;

begin
  if (not FCheckPassport) or (not dsCustomer.Active) or (dsCustomer.RecordCount = 0) then
    Exit;

  if (not dsCustomer.FieldByName('JURIDICAL').IsNull) and (dsCustomer['JURIDICAL'] = 1) then
    Exit;

  if (not dsCustomer.FieldByName('PASSPORT_VALID').IsNull) and (dsCustomer['PASSPORT_VALID'] = 1) then
    Exit;

  answer := '';
  edtPERSONAL_N := GetV('PERSONAL_N');
  eFIRSTNAME := GetV('FIRSTNAME');
  eSURNAME := GetV('SURNAME');
  eMIDLENAME := GetV('MIDLENAME');
  edtPASSPORT_NUMBER := GetV('PASSPORT_NUMBER');
  pValid := -1;

  if eSURNAME = '' then
    answer := 'Фамилия - ' + rsEmptyFieldError + #13#10;

  if eFIRSTNAME = '' then
    answer := answer + 'Имя - ' + rsEmptyFieldError + #13#10;

  if ((edtPERSONAL_N = '') or (HasInvalidChar(edtPERSONAL_N)) or (Length(edtPERSONAL_N) <> 14)) then
    answer := answer + 'Личный номер - ' + rsEmptyOrIncorrect + #13#10;

  if ((edtPASSPORT_NUMBER = '') or (HasInvalidChar(edtPASSPORT_NUMBER))) then
    answer := answer + 'Номер паспорта - ' + rsEmptyOrIncorrect + #13#10;

  if not answer.IsEmpty then
  begin
    ShowMessage(Trim(answer));
    Exit;
  end;

  SplitNumber(edtPASSPORT_NUMBER, ps, pn);
  unp := dmMain.GetCompanyValue('UNN');
  if unp = '' then
    unp := dmMain.GetCompanyValue('UNP');

  url := Format('surname=%s&name=%s&lastname=%s', [UrlEncode(eSURNAME), UrlEncode(eFIRSTNAME), UrlEncode(eMIDLENAME)]) +
    Format('&ser=%s&num=%s&identif=%s', [UrlEncode(ps), UrlEncode(pn), UrlEncode(edtPERSONAL_N)]) +
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
  FHttpCli.AuthBearerToken := dmMain.GetSettingsValue('KEY_MVD');
  FHttpCli.ProxyAuth := httpAuthNone;
  FHttpCli.TimeOut := 30;
  FHttpCli.SslContext := FSslContext;
  FHttpCli.ResponseNoException := true;
  Datax := TStringStream.Create('', TEncoding.UTF8);
  FHttpCli.OnRequestDone := Nil;
  FHttpCli.RcvdStream := Datax;
  FHttpCli.url := rsCheckPassportURL + url;
  FHttpCli.Get; // sync

  if FHttpCli.StatusCode = 200 then
  begin
    answer := Datax.DataString;
    if answer.ToLower.Contains('выдан, действителен') then
      pValid := 1
    else
    begin
      ShowMessage(answer);
      pValid := 0;
    end
  end
  else
  begin
    answer := rsError + ' ' + FHttpCli.StatusCode.ToString;
    ShowMessage(answer);
  end;

  FHttpCli.RcvdStream.Free;
  FHttpCli.RcvdStream := nil;
  FHttpCli.Free;
  FSslContext.Free;

  qry := TpFIBQuery.Create(Nil);
  try
    qry.Database := dmMain.dbTV;
    qry.Transaction := dmMain.trWriteQ;
    if pValid > -1 then
    begin
      qry.sql.Text := 'update customer c set c.Passport_Valid = :PV where c.Customer_Id = :CID';
      qry.ParamByName('PV').value := pValid;
      qry.ParamByName('CID').value := dsCustomer['CUSTOMER_ID'];
      qry.Transaction.StartTransaction;
      qry.ExecQuery;
      qry.Transaction.Commit;
    end;

    if answer <> '' then
    begin
      qry.sql.Text := 'insert into Changelog (Log_Group, Object_Id, Value_Before, Value_After)';
      qry.sql.Add(' values (:Log_Group, :Object_Id, :Value_Before, :Value_After)');
      qry.ParamByName('Log_Group').value := 'PASSPORT_CHECK';
      qry.ParamByName('Object_Id').value := dsCustomer['CUSTOMER_ID'];
      qry.ParamByName('Value_Before').value := Format('%s %s %s|%s%s|%s', [eSURNAME, eFIRSTNAME, eMIDLENAME, ps, pn,
        edtPERSONAL_N]);
      qry.ParamByName('Value_After').value := answer;
      qry.Transaction.StartTransaction;
      qry.ExecQuery;
      qry.Transaction.Commit;
    end;
  finally
    qry.Free;
  end;
end;

procedure TCustomerForm.InitSecurity;
var
  FullAccess: Boolean;
begin
  FullAccess := dmMain.AllowedAction(rght_Request_Full);

  FCheckPassport := (dmMain.GetSettingsValue('KEY_MVD') <> '');

  actCheckPassport.Visible := FCheckPassport;
  actRequest.Visible := (FullAccess or dmMain.AllowedAction(rght_Request_Add));
  actRecAdd.Visible := (FullAccess or dmMain.AllowedAction(rght_Recourses_add));
  actNPS.Visible := (FullAccess or dmMain.AllowedAction(rght_Customer_NPS));
  actResetpassword.Visible := (FullAccess or dmMain.AllowedAction(rght_Customer_PSWD));
  ActAddPayment.Visible := (FullAccess or dmMain.AllowedAction(rght_Pays_add) or
    dmMain.AllowedAction(rght_Pays_AddToday));
  actDelete.Enabled := (not dmMain.InStrictMode) and (dmMain.AllowedAction(rght_Customer_del) or FullAccess);
  actOrderTP.Visible := dmMain.AllowedAction(rght_OrdersTP_full) or dmMain.AllowedAction(rght_OrdersTP_add) or
    dmMain.AllowedAction(rght_OrdersTP_View);
  // actPrepay.Visible := (FullAccess or  dmMain.AllowedAction(rght_Customer_NPS));
  // actTask.Visible := (FullAccess or  dmMain.AllowedAction(rght_Customer_NPS));
  // actCheckPassport.Visible := (FullAccess or  dmMain.AllowedAction(rght_Customer_NPS));
end;

end.
