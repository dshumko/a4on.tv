unit RequestNewForma;

interface

{$I defines.inc}

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes, System.Types,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.StdCtrls,
  DBGridEh, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, MemTableDataEh, PropFilerEh, CnErrorProvider,
  PropStorageEh, CustomerInfoFrame, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, MemTableEh, DBCtrlsEh,
  DBLookupEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, OkCancel_frame, PrjConst, DM, A4onTypeUnit;

type
  TRequestNewForm = class(TForm)
    pnlAdresInfo: TPanel;
    pnlAdres: TPanel;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl2: TLabel;
    LupStreets: TDBLookupComboboxEh;
    LupHOUSE: TDBLookupComboboxEh;
    edFLAT_NO: TDBEditEh;
    btnFind: TButton;
    EdPorch: TDBEditEh;
    EdFloor: TDBEditEh;
    edDOOR: TDBEditEh;
    pnlCI: TPanel;
    CustomerInfoFrm: TCustomerInfoFrm;
    frmOkCancel: TOkCancelFrame;
    dsWorks: TMemTableEh;
    srcWorks: TDataSource;
    dsStreets: TpFIBDataSet;
    srcStreet: TDataSource;
    dsHouse: TpFIBDataSet;
    srcHouse: TDataSource;
    srcRequestType: TDataSource;
    dsRequestType: TpFIBDataSet;
    actlst: TActionList;
    actFindCustomer: TAction;
    actReqForAdres: TAction;
    actSave: TAction;
    dsErrors: TpFIBDataSet;
    srcErrors: TDataSource;
    dsDefaultWorks: TpFIBDataSet;
    actAddWork: TAction;
    actDelWork: TAction;
    trQuery: TpFIBTransaction;
    actDateSelect: TAction;
    pnl1: TPanel;
    pnlRType: TPanel;
    pnlRWorks: TPanel;
    dbgWorks: TDBGridEh;
    pnlBW: TPanel;
    btnAddWork: TButton;
    btnDelWork: TButton;
    pnlInfo: TPanel;
    srcSame: TDataSource;
    dsSame: TpFIBDataSet;
    pnlTime: TPanel;
    dbgSame: TDBGridEh;
    rgShowAs: TRadioGroup;
    rbZV: TRadioButton;
    rbADRS: TRadioButton;
    pnlRTOP: TPanel;
    lbl8: TLabel;
    lupType: TDBLookupComboboxEh;
    lblCAUSE: TLabel;
    luTemplate: TDBLookupComboboxEh;
    pnlAddInfo: TPanel;
    pnlRClient: TPanel;
    lbl9: TLabel;
    btnSelectDate: TBitBtn;
    lbl10: TLabel;
    edtTimeFrom: TDBDateTimeEditEh;
    lbl11: TLabel;
    edtTimeTo: TDBDateTimeEditEh;
    lbl13: TLabel;
    mmoNotice: TDBMemoEh;
    cbbAdd: TDBComboBoxEh;
    lbl14: TLabel;
    dbtxtUchZv: TDBText;
    mmoContent: TDBMemoEh;
    PropStorage: TPropStorageEh;
    btnClear: TButton;
    edtPLANDATE: TDBDateTimeEditEh;
    chkOpenBid: TDBCheckBoxEh;
    chkRecreate: TDBCheckBoxEh;
    cnError: TCnErrorProvider;
    lbl5: TLabel;
    edPhone: TDBEditEh;
    cbContact: TDBComboBoxEh;
    dsAllWorks: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure edPhoneExit(Sender: TObject);
    procedure EdFloorExit(Sender: TObject);
    procedure actFindCustomerExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actSaveExecute(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure lupTypeChange(Sender: TObject);
    procedure edtPLANDATEChange(Sender: TObject);
    procedure dsRequestTypeAfterOpen(DataSet: TDataSet);
    procedure actAddWorkExecute(Sender: TObject);
    procedure actDelWorkExecute(Sender: TObject);
    procedure LupHOUSEExit(Sender: TObject);
    procedure edFLAT_NOExit(Sender: TObject);
    procedure dbgWorksExit(Sender: TObject);
    procedure actDateSelectExecute(Sender: TObject);
    procedure dbgTmpltsDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rbZVClick(Sender: TObject);
    procedure rbADRSClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure luTemplateChange(Sender: TObject);
    procedure pnlRClientResize(Sender: TObject);
    procedure frmOkCancelbbCancelClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LupStreetsEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure LupHOUSEEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure edtTimeFromEnter(Sender: TObject);
    procedure lupTypeEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure luTemplateEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure lupTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure edPhoneChange(Sender: TObject);
    procedure LupHOUSEDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure DBLookupComboboxClick(Sender: TObject);
    procedure LupHOUSEChange(Sender: TObject);
    procedure cbContactNotInList(Sender: TObject; NewText: string; var RecheckInList: Boolean);
    procedure DBLookupComboboxEnter(Sender: TObject);
    procedure LupStreetsChange(Sender: TObject);
    procedure cbContactEnter(Sender: TObject);
    procedure cbContactClick(Sender: TObject);
    procedure lupTypeButtonClick(Sender: TObject; var Handled: Boolean);
    procedure cbContactButtonClick(Sender: TObject; var Handled: Boolean);
  private
    { Private declarations }
    fRQ_ID: Integer;
    FFindNode: Boolean;
    FCustomerInfo: TCustomerInfo;
    FFullAccess: Boolean; // полный доступ
    FAddressRight: Boolean;
    FCanEdit: Boolean; // может изменять результат выполнения
    FCanClose: Boolean; // может закрыть заявку
    FCanCreate: Boolean; // может добавить заявку
    FCanGive: Boolean; // может выдать заявку
    FPhoneChanged: Boolean;
    FEnterSecondPress: Boolean;
    FReqType: Integer;
    FReqTempl: Integer;
    FLastFlat: string;
    FDenyCancel: Boolean;
    function FindCustomer(const lic: string; const code: string; id: Integer; const FindNode: Integer = 0): Integer;
    procedure CheckData;
    function FindNearFreeDay: Boolean;
    procedure InitSecurity;
    function GetCustomer_ID: Integer;
    procedure SetCustomer_ID(Value: Integer);
    function GetNode_ID: Integer;
    procedure SetNode_ID(Value: Integer);
    procedure SetFindNode(Value: Boolean);
    function GetFindNode: Boolean;
    procedure SetFromRequest(Value: Integer);
    procedure SetCanCancel(Value: Boolean);
    procedure SetReqType(Value: Integer);
    procedure SetReqTempl(Value: Integer);
    procedure ShowReqForAdres(HOUSE_ID: Integer; plan_date: Variant);
    procedure ShowAddInfo;
    procedure AplySortSameReq(const AdresSort: Boolean = False);
    function SavePhone(Const Phone: String): String;
    procedure SetPhonesCB(const list: String);
    procedure InitDataSetFilters;
    procedure ClearWorks;
    procedure InsertWorks;
  public
    { Public declarations }
    property Request_id: Integer read fRQ_ID;
    property ReqType: Integer read FReqType write SetReqType;
    property ReqTempl: Integer read FReqTempl write SetReqTempl;
    property Customer_id: Integer read GetCustomer_ID write SetCustomer_ID;
    property Node_id: Integer read GetNode_ID write SetNode_ID;
    property FindNode: Boolean read GetFindNode write SetFindNode; // поиск узлов
    property FromRequest: Integer write SetFromRequest;
    property CanCancel: Boolean write SetCanCancel;
  end;

function NewRequest(const aCustomer: Integer = -1; CallBack: TCallBack = nil; const FindNodes: Boolean = False;
  const Phone: string = ''; const notice: string = ''): Integer;
function NewRequestByAdres(const Street_ID: Integer = -1; const HOUSE_ID: Integer = -1; const Flat: String = '';
  const Phone: string = ''; const notice: string = ''): Integer;
function NewRequestFromRequest(const aRequest: Integer = -1): Integer;
function NewRequestFromPlaner(const plan_date: TDateTime; const TYPE_ID: Integer = -1): Integer;
function NewNodeRequest(const aNode: Integer = -1; CallBack: TCallBack = nil): Integer;
function NewFileRequest(const aCustomer: Integer = -1; const aReqType: Integer = -1; const aReqTempl: Integer = -1;
  const rd: TDate = 0; const notice: String = ''; const CanClose: Boolean = True): Integer;

implementation

{$R *.dfm}

uses
  System.StrUtils, System.DateUtils, System.MaskUtils, JsonDataObjects,
  SelectDateForma, pFIBQuery, ReqAddWorkForma, MAIN, FIBQuery, pFIBProps,
  AtrStrUtils, AtrCommon, HouseForma, StreetEditForma, CF,
  RequestForma, ReqTypeForma, ReqTemplateForma, ContactForma;

function NewRequest(const aCustomer: Integer = -1; CallBack: TCallBack = nil; const FindNodes: Boolean = False;
  const Phone: string = ''; const notice: string = ''): Integer;
begin
  Result := -1;
  with TRequestNewForm.Create(Application) do
  begin
    if FindNodes then
      Node_id := aCustomer
    else
      Customer_id := aCustomer;

    FindNode := FindNodes;

    if not Phone.IsEmpty then
    begin
      edPhone.OnChange := nil;
      edPhone.Text := Phone;
      edPhone.OnChange := edPhoneChange;
    end;

    if not notice.IsEmpty then
      mmoNotice.Lines.Text := notice;

    if showModal = mrOk then
    begin
      Result := Request_id;
      if Assigned(CallBack) then
        CallBack;
    end;
    try
      Free;
    finally
      //
    end;
  end;
end;

function NewRequestByAdres(const Street_ID: Integer = -1; const HOUSE_ID: Integer = -1; const Flat: String = '';
  const Phone: string = ''; const notice: string = ''): Integer;
begin
  Result := -1;
  with TRequestNewForm.Create(Application) do
  begin
    LupStreets.Value := Street_ID;
    LupHOUSE.Value := HOUSE_ID;
    edFLAT_NO.Value := Flat;
    Customer_id := -1;
    if not Phone.IsEmpty then
    begin
      edPhone.OnChange := nil;
      edPhone.Text := Phone;
      edPhone.OnChange := edPhoneChange;
    end;

    if not notice.IsEmpty then
      mmoNotice.Lines.Text := notice;

    if showModal = mrOk then
      Result := Request_id;
    Free;
  end;
end;

function NewNodeRequest(const aNode: Integer = -1; CallBack: TCallBack = nil): Integer;
begin
  Result := NewRequest(aNode, CallBack, True);
end;

function NewRequestFromPlaner(const plan_date: TDateTime; const TYPE_ID: Integer = -1): Integer;
begin
  Result := -1;
  with TRequestNewForm.Create(Application) do
  begin
    lupType.Value := TYPE_ID;
    edtPLANDATE.Value := plan_date;
    edtTimeFrom.Value := plan_date;
    Customer_id := -1;
    if showModal = mrOk then
      Result := Request_id;
    Free;
  end;
end;

function NewRequestFromRequest(const aRequest: Integer = -1): Integer;
begin
  Result := -1;
  if aRequest = -1 then
    Exit;
  with TRequestNewForm.Create(Application) do
  begin
    FromRequest := aRequest;
    showModal;
    Free;
  end;
end;

function NewFileRequest(const aCustomer: Integer = -1; const aReqType: Integer = -1; const aReqTempl: Integer = -1;
  const rd: TDate = 0; const notice: String = ''; const CanClose: Boolean = True): Integer;
begin
  Result := -1;
  with TRequestNewForm.Create(Application) do
  begin
    Customer_id := aCustomer;
    if aReqTempl <> -1 then
      ReqTempl := aReqTempl;

    if aReqType <> -1 then
      ReqType := aReqType;

    edtPLANDATE.Value := rd;
    edtPLANDATE.Enabled := False;
    actDateSelect.Enabled := False;
    mmoNotice.Lines.Text := notice;

    CanCancel := CanClose;

    ActiveControl := mmoContent;
    if aReqTempl = -1 then
      ActiveControl := luTemplate;
    if aReqType = -1 then
      ActiveControl := luTemplate;
    if aCustomer = -1 then
      ActiveControl := LupStreets;

    if showModal = mrOk then
      Result := Request_id;
    Free;
  end;
end;

function TRequestNewForm.GetCustomer_ID: Integer;
begin
  Result := -1;
  if FCustomerInfo.Customer_id <> -1 then
    if FCustomerInfo.isType = 0 then
      Result := FCustomerInfo.Customer_id;
end;

function TRequestNewForm.GetNode_ID: Integer;
begin
  Result := -1;
  if FCustomerInfo.Customer_id <> -1 then
    if FCustomerInfo.isType = 1 then
      Result := FCustomerInfo.Customer_id;
end;

procedure TRequestNewForm.InitDataSetFilters;
var
  o: Boolean;
  s: string;
begin
  o := dsRequestType.Active;

  if o then
  begin
    // dsRequestType.AfterOpen := nil;
    dsErrors.Close;
    dsRequestType.Close;
  end;

  if (dmMain.GetSettingsValue('REQUEST_TYPE_RESTRICT') = '1') then
  begin
    if (FReqType > -1) then
    begin
      dsRequestType.ParamByName('RT_RESTRICT').AsString := ' and w.RT_ID = ' + FReqType.ToString;
      if (FReqTempl > -1) then
        dsErrors.ParamByName('RT_RESTRICT').AsString := ' and rt.RQTL_ID = ' + FReqTempl.ToString;
    end
    else
    begin
      // для ЛТВ исключим все причины которые есть в типах файлов
      if (dmMain.User <> 'SYSDBA') then
      begin
        s := dmMain.GetCompanyValue('NAME');
        if ((not s.Contains('ЛТВ'))) then
          dsRequestType.ParamByName('RT_RESTRICT').AsString := ' and exists(select gr.Right_Id ' + #13#10 +
            ' from sys$user u inner join sys$user_groups ug on (u.id = ug.user_id) ' + #13#10 +
            ' inner join sys$group g on (ug.group_id = g.id) ' + #13#10 +
            ' inner join sys$group_rights gr on (ug.group_id = gr.group_id) ' + #13#10 +
            ' where u.ibname = current_user and u.Lockedout = 0 and g.lockedout = 0 and gr.rights_type = 3 ' +
            ' and gr.Right_Id = w.Rt_Id) '
        else
          dsErrors.ParamByName('RT_RESTRICT').AsString := ' and not exists(select O_ID from Objects ' +
            ' where O_Type = 33 and O_Charfield like ''%"ReqTempl":''||rt.RQTL_ID||'',%'')';
      end;
    end;
  end;

  if o then
  begin
    dsRequestType.Open;
    dsErrors.Open;
    // dsRequestType.AfterOpen := dsRequestTypeAfterOpen;
  end;

  if (FReqType > -1) then
  begin
    lupType.Value := FReqType;
    lupType.Enabled := False;
  end;

  if (FReqTempl > -1) then
  begin
    luTemplate.Value := FReqTempl;
  end
end;

procedure TRequestNewForm.SetReqTempl(Value: Integer);
begin
  FReqTempl := Value;
  InitDataSetFilters;
end;

procedure TRequestNewForm.SetReqType(Value: Integer);
begin
  FReqType := Value;
  InitDataSetFilters;
end;

procedure TRequestNewForm.SetCanCancel(Value: Boolean);
begin
  FDenyCancel := not Value;
  if FDenyCancel then
  begin
    frmOkCancel.bbOk.Enabled := True;
    frmOkCancel.bbCancel.Visible := False;
    frmOkCancel.bbCancel.Tag := 1;
  end;
end;

procedure TRequestNewForm.SetFromRequest(Value: Integer);
var
  i: Integer;
begin
  i := Value;
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := trQuery;
      Options := [qoStartTransaction, qoAutoCommit];
      SQL.Clear;
      SQL.Add('select r.rq_id, r.RQ_TYPE, r.RQ_CUSTOMER, r.RQ_CONTENT, r.RQ_PLAN_DATE, r.RQ_TIME_FROM, r.RQ_TIME_TO, ');
      SQL.Add('r.HOUSE_ID, r.FLAT_NO, coalesce(HF.porch_n, r.Porch_N) Porch_N, coalesce(hf.floor_n, r.Floor_N) floor_n, ');
      SQL.Add('r.PHONE, r.RQTL_ID, r.DOOR_CODE, r.ADD_INFO, r.RQ_NOTICE, h.street_id ');
      SQL.Add('from REQUEST r inner join house h on (r.house_id = h.house_id) ');
      SQL.Add('     left outer join HOUSEFLATS HF on (HF.HOUSE_ID = R.house_id and HF.FLAT_NO = R.flat_no) ');
      SQL.Add('where rq_id = :req ');

      ParamByName('req').AsInteger := i;
      ExecQuery;
      if not FldByName['rq_id'].IsNull then
      begin
        if not FldByName['RQ_CUSTOMER'].IsNull then
          SetCustomer_ID(FldByName['RQ_CUSTOMER'].AsInteger)
        else
        begin
          LupStreets.Value := FldByName['street_id'].AsInteger;
          LupHOUSE.Value := FldByName['HOUSE_ID'].AsInteger;
          if not FldByName['PORCH_N'].IsNull then
            EdPorch.Text := FldByName['PORCH_N'].AsString;
          if not FldByName['FLOOR_N'].IsNull then
            EdFloor.Text := FldByName['FLOOR_N'].AsString;
          if not FldByName['FLAT_NO'].IsNull then
            edFLAT_NO.Text := FldByName['FLAT_NO'].AsString;
        end;
        if not FldByName['RQ_PLAN_DATE'].IsNull then
          edtPLANDATE.Value := FldByName['RQ_PLAN_DATE'].AsDate;
        if not FldByName['RQ_TIME_FROM'].IsNull then
          edtTimeFrom.Value := FldByName['RQ_TIME_FROM'].AsTime;
        if not FldByName['RQ_TIME_TO'].IsNull then
          edtTimeTo.Value := FldByName['RQ_TIME_TO'].AsTime;
        if not FldByName['DOOR_CODE'].IsNull then
          edDOOR.Text := FldByName['DOOR_CODE'].AsString;

        lupType.Value := FldByName['RQ_TYPE'].AsInteger;
        if not FldByName['RQTL_ID'].IsNull then
          luTemplate.Value := FldByName['RQTL_ID'].AsInteger;
        if not FldByName['ADD_INFO'].IsNull then
          cbbAdd.Text := FldByName['ADD_INFO'].AsString;

        if (not FldByName['PHONE'].IsNull) then
        begin
          edPhone.OnChange := nil;
          edPhone.Text := FldByName['PHONE'].AsString;
          edPhone.OnChange := edPhoneChange;
        end;

        mmoContent.Lines.Text := FldByName['RQ_CONTENT'].AsString;
        mmoNotice.Lines.Text := FldByName['RQ_NOTICE'].AsString;
      end;
      Close;
    finally
      Free;
    end;

end;

procedure TRequestNewForm.SetCustomer_ID(Value: Integer);
begin
  if Value > -1 then
  begin
    FindCustomer('', '', Value);
    CheckData;
  end;
end;

procedure TRequestNewForm.SetNode_ID(Value: Integer);
begin
  if Value > -1 then
  begin
    FindCustomer('', '', Value, 1);
    CheckData;
  end;
end;

function TRequestNewForm.GetFindNode: Boolean;
begin
  Result := FFindNode;
end;

procedure TRequestNewForm.SetFindNode(Value: Boolean);
begin
  FFindNode := Value;
end;

// Ищем абонета или узел
// FindNode
// -1 и абонента и узел
// 0 только абонента
// 1 только узел
function TRequestNewForm.FindCustomer(const lic: string; const code: string; id: Integer;
  const FindNode: Integer = 0): Integer;
var
  s: string;
begin
  FCustomerInfo := dmMain.FindCustomer(lic, code, id, FindNode);
  Result := FCustomerInfo.Customer_id;
  CustomerInfoFrm.Customer := FCustomerInfo;
  if FCustomerInfo.Customer_id > -1 then
  begin
    s := dmMain.GetCompanyValue('NAME');
    LupStreets.Value := FCustomerInfo.Street_ID;
    LupHOUSE.Value := FCustomerInfo.HOUSE_ID;
    edFLAT_NO.Text := FCustomerInfo.FLAT_NO;

    edPhone.OnChange := nil;
    if not s.Contains('ЛТВ') then
    begin
      edPhone.Text := Trim(FCustomerInfo.mobile + ',' + FCustomerInfo.PHONE_NO).Trim([',', ' ']);
      edPhone.Hint := FCustomerInfo.mobile + #13#10 + FCustomerInfo.PHONE_NO.Trim([#13, #10, ',', ' ']);
    end
    else
    begin
      edPhone.Text := FCustomerInfo.mobile_wn;
      edPhone.Hint := FCustomerInfo.mobile_wn;
    end;
    edPhone.OnChange := edPhoneChange;

    if not s.Contains('ЛТВ') then
      s := Trim(FCustomerInfo.mobile + ',' + FCustomerInfo.PHONE_NO).Trim([',', ' '])
    else
      s := Trim(FCustomerInfo.mobile_wn).Trim([',', ' ']);

    SetPhonesCB(s);

    if FCustomerInfo.porch_n <> '' then
      EdPorch.Text := FCustomerInfo.porch_n;
    if FCustomerInfo.floor_n <> '' then
      EdFloor.Text := FCustomerInfo.floor_n;

    ActiveControl := EdPorch;
    if EdPorch.Text = '' then
      ActiveControl := EdPorch
    else
    begin
      if EdPorch.Text = '' then
        ActiveControl := EdPorch
      else
        ActiveControl := lupType;
    end;

  end;
end;

procedure TRequestNewForm.actAddWorkExecute(Sender: TObject);
var
  work_id: Integer;
  wname: String;
  quant: Integer;
  w_time: single;
  w_cost: single;
  notice: string;
begin
  if varIsNull(lupType.Value) then
    Exit;
  if SelectRequestWork(lupType.Value, work_id, wname, quant, w_time, w_cost, notice) then
  begin
    if not dsWorks.Active then
    begin
      dsWorks.Open;
      dsWorks.EmptyTable;
    end;

    dsWorks.Append;
    dsWorks['W_ID'] := work_id;
    dsWorks['name'] := wname;
    dsWorks['quant'] := quant;
    dsWorks['w_time'] := w_time;
    dsWorks['w_cost'] := w_cost;
    dsWorks['notice'] := notice;
    dsWorks.Post;
  end;
end;

procedure TRequestNewForm.actDateSelectExecute(Sender: TObject);
var
  d: TDate;
  W_id: Integer;
begin
  if not varIsNull(luTemplate.Value) then
    W_id := luTemplate.Value
  else
    W_id := -1;

  if SelectRequestDate(LupHOUSE.Value, W_id, d) then
    edtPLANDATE.Value := d;
end;

procedure TRequestNewForm.actDelWorkExecute(Sender: TObject);
var
  CanDelete: Boolean;
  s: string;
begin
  if dsWorks.FieldByName('NAME').IsNull or dsWorks.FieldByName('W_ID').IsNull then
    Exit;

  CanDelete := FFullAccess;
  // проверим, можно ли удалять работу добавленную автоматически
  if not CanDelete then
  begin
    if (dmMain.GetSettingsValue('REQUEST_WORKS_DEL_RESTRICT') <> '1') or dsErrors.FieldByName('WORKS').IsNull then
      CanDelete := True
    else
    begin
      // [{"i":832878,"q":1}]
      s := '"i":' + dsWorks.FieldByName('W_ID').AsString + ',';
      // Еслі не нашлі, то разрешім удаліть
      CanDelete := not(Pos(s, dsErrors['WORKS']) > 0);
    end;
  end;

  if CanDelete then
  begin
    if Application.MessageBox(PWideChar(format(rsDeleteWithName, [dsWorks['NAME']])), PWideChar(rsDeleteWork),
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      dsWorks.Delete;
    end;
  end;
end;

procedure TRequestNewForm.actFindCustomerExecute(Sender: TObject);
var
  Flat, p, f: String;
  fn: Integer;
begin
  if varIsNull(LupHOUSE.Value) then
  begin
    LupHOUSE.SetFocus;
    LupHOUSE.DropDown;
    Exit;
  end;

  if varIsNull(edFLAT_NO.Value) then
    Flat := ''
  else
    Flat := edFLAT_NO.Value;

  f := EdFloor.Text;
  p := EdPorch.Text;

  if FFindNode then
    fn := -1
  else
    fn := 0;
  FCustomerInfo := dmMain.FindCustomerAtAdress(LupHOUSE.Value, Flat, fn, p, f);

  CustomerInfoFrm.Customer := FCustomerInfo;
  if FCustomerInfo.Customer_id > -1 then
  begin
    if Flat <> FCustomerInfo.FLAT_NO then
      edFLAT_NO.Value := FCustomerInfo.FLAT_NO;

    // LupStreets.Value := FCustomerInfo.STREET_ID;
    // LupHouse.Value   := FCustomerInfo.HOUSE_ID;
    // edFLAT_NO.Text   := FCustomerInfo.FLAT_NO;
    edPhone.OnChange := nil;
    edPhone.Text := Trim(FCustomerInfo.mobile + ',' + FCustomerInfo.PHONE_NO).Trim([',', ' ']);
    edPhone.Hint := FCustomerInfo.mobile + #13#10 + FCustomerInfo.PHONE_NO.Trim([#13, #10, ',', ' ']);
    edPhone.OnChange := edPhoneChange;

    if FCustomerInfo.porch_n <> '' then
      EdPorch.Text := FCustomerInfo.porch_n;
    if FCustomerInfo.floor_n <> '' then
      EdFloor.Text := FCustomerInfo.floor_n;

    ActiveControl := EdPorch;
    if EdPorch.Text = '' then
      ActiveControl := EdPorch
    else
    begin
      if EdPorch.Text = '' then
        ActiveControl := EdPorch
      else
      begin
        if lupType.Enabled then
          ActiveControl := lupType
        else
          ActiveControl := mmoContent;
      end;
    end;

    p := dmMain.GetCompanyValue('NAME');
    if not p.Contains('ЛТВ') then
      p := Trim(FCustomerInfo.mobile + ',' + FCustomerInfo.PHONE_NO).Trim([',', ' '])
    else
      p := Trim(FCustomerInfo.mobile_wn).Trim([',', ' ']);
    SetPhonesCB(p);
  end;
end;

procedure TRequestNewForm.actSaveExecute(Sender: TObject);
var
  allFine: Boolean;
  PrintForm, s: string;
  vi, p: Integer;
  CE, FA, CC, CG: Boolean;
  i: Integer;
  Stream: TStream;
  innerQuery: TpFIBQuery;
  vOpen: Boolean;
  ExistsError: Boolean;
begin
  ExistsError := False;

  if varIsNull(lupType.Value) then
  begin
    lupType.SetFocus;
    ExistsError := True;
    cnError.SetError(lupType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnError.Dispose(lupType);

  if varIsNull(LupHOUSE.Value) then
  begin
    LupHOUSE.SetFocus;
    ExistsError := True;
    cnError.SetError(LupHOUSE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnError.Dispose(LupHOUSE);

  if varIsNull(edtPLANDATE.Value) then
  begin
    edtPLANDATE.SetFocus;
    ExistsError := True;
    cnError.SetError(edtPLANDATE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnError.Dispose(edtPLANDATE);

  if ((pnlAddInfo.Visible) and (cbbAdd.Text = '')) then
  begin
    cbbAdd.SetFocus;
    ExistsError := True;
    cnError.SetError(cbbAdd, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnError.Dispose(cbbAdd);

  if ((not dsRequestType.FieldByName('CAUSE_NEED').IsNull) and (dsRequestType['CAUSE_NEED']) and
    (varIsNull(luTemplate.Value))) then
  begin
    luTemplate.SetFocus;
    ExistsError := True;
    cnError.SetError(luTemplate, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnError.Dispose(luTemplate);

  if ((GetCustomer_ID <> -1) and (cbContact.Text = '')) then
  begin
    cbContact.SetFocus;
    ExistsError := True;
    cnError.SetError(cbContact, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnError.Dispose(cbContact);

  if ExistsError then
    Exit;

  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Clear;
      SQL.Add('execute procedure Request_Add(:Rq_Type, :Rq_Customer, :Rq_Content, :Rq_Notice, :Rq_Plan_Date, :Rq_Time_From, :Rq_Time_To,');
      SQL.Add(':House_Id, :Flat_No, :Porch_N, :Floor_N, :Phone, :Rqtl_Id, :Door_Code, :Add_Info, :O_TYPE)');

      ParamByName('RQ_CONTENT').AsString := Trim(mmoContent.Lines.Text);
      ParamByName('RQ_NOTICE').AsString := Trim(mmoNotice.Lines.Text);
      ParamByName('RQ_TYPE').AsInteger := lupType.Value;
      ParamByName('HOUSE_ID').AsInteger := LupHOUSE.Value;
      ParamByName('RQ_PLAN_DATE').AsDate := edtPLANDATE.Value;

      if (Trim(edFLAT_NO.Text) <> '') then
        ParamByName('FLAT_NO').AsString := Trim(edFLAT_NO.Text);
      if (Trim(EdPorch.Text) <> '') then
        ParamByName('PORCH_N').AsString := Trim(EdPorch.Text);
      if (Trim(EdFloor.Text) <> '') then
        ParamByName('FLOOR_N').AsString := Trim(EdFloor.Text);

      s := Trim(cbContact.Text);
      if (NOT s.IsEmpty) then
        ParamByName('PHONE').AsString := LeftStr(s, 50)
      else
        ParamByName('PHONE').Clear;

      if Trim(edDOOR.Text) <> '' then
        ParamByName('DOOR_CODE').AsString := Trim(edDOOR.Text);
      if pnlAddInfo.Visible then
        ParamByName('ADD_INFO').AsString := cbbAdd.Text;
      if FCustomerInfo.Customer_id > -1 then
      begin
        ParamByName('RQ_CUSTOMER').AsInteger := FCustomerInfo.Customer_id;
        ParamByName('O_TYPE').AsInteger := FCustomerInfo.isType;
      end;
      if not varIsNull(luTemplate.Value) then
        ParamByName('RQTL_ID').AsInteger := luTemplate.Value;
      if not varIsNull(edtTimeFrom.Value) then
        ParamByName('RQ_TIME_FROM').AsTime := edtTimeFrom.Value;
      if not varIsNull(edtTimeTo.Value) then
        ParamByName('RQ_TIME_TO').AsTime := edtTimeTo.Value;

      // ParamByName('RQ_ID').AsInteger := fRQ_ID;
      Transaction.StartTransaction;
      ExecQuery;
      fRQ_ID := fn('RQ_ID').AsInteger;
      Close;
      Transaction.Commit;

      // сохраним работы
      if dsWorks.RecordCount > 0 then
      begin
        SQL.Clear;
        SQL.Add('insert into REQUEST_WORKS (RQ_ID, W_ID, W_TIME, W_QUANT, W_COST, NOTICE)');
        SQL.Add('values (:RQ_ID, :W_ID, :W_TIME, :W_QUANT, :W_COST, :NOTICE)');
        dsWorks.First;
        while not dsWorks.Eof do
        begin
          if not dsWorks.FieldByName('W_ID').IsNull then
          begin
            ParamByName('RQ_ID').AsInteger := fRQ_ID;
            ParamByName('W_ID').AsInteger := dsWorks['W_ID'];
            if not dsWorks.FieldByName('W_TIME').IsNull then
              ParamByName('W_TIME').AsFloat := dsWorks['W_TIME']
            else
              ParamByName('W_TIME').Clear;
            if not dsWorks.FieldByName('QUANT').IsNull then
              ParamByName('W_QUANT').AsFloat := dsWorks['QUANT']
            else
              ParamByName('W_QUANT').Clear;
            if not dsWorks.FieldByName('W_COST').IsNull then
              ParamByName('W_COST').AsFloat := dsWorks['W_COST']
            else
              ParamByName('W_COST').Clear;
            if not dsWorks.FieldByName('NOTICE').IsNull then
              ParamByName('NOTICE').AsString := dsWorks['NOTICE']
            else
              ParamByName('NOTICE').Clear;
            Transaction.StartTransaction;
            ExecQuery;
            Close;
            Transaction.Commit;
          end;
          dsWorks.Next;
        end;
        allFine := True;
      end;

      // если автоматом создавать заявку на узел, то создадим ее
      if (dsErrors.Active) and (dsErrors.RecordCount > 0) and (not dsErrors.FieldByName('NEED_NODE_RQ').IsNull) and
        (dsErrors['NEED_NODE_RQ'] = 1) and (FCustomerInfo.Customer_id <> -1) and (FCustomerInfo.isType = 0) then
      begin

        // if Application.MessageBox(PWideChar(rsNeedNodeBid), PWideChar(rsNodeBid), MB_YESNO + MB_ICONQUESTION) = IDYES
        // then
        begin
          SQL.Text := 'select REQUEST_ID from DUBLICATE_REQUEST(:RQ_ID, :CUSTOMER_ID, 1)';
          ParamByName('RQ_ID').AsInteger := fRQ_ID;
          ParamByName('CUSTOMER_ID').AsInteger := FCustomerInfo.Customer_id;
          Transaction.StartTransaction;
          ExecQuery;
          Close;
          Transaction.Commit;
        end;
      end;

      // продублируем заявку через Х дней
      if (chkRecreate.Visible) and (chkRecreate.Checked) then
      begin
        SQL.Text := 'execute procedure Request_Recreate(:RQ_ID)';
        ParamByName('RQ_ID').AsInteger := fRQ_ID;
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      end;
      allFine := True;

      if not(TryStrToInt(dmMain.GetIniValue('PRINTREQ'), p)) then
        p := 0;

      if (p = 1) then
      begin
        innerQuery := TpFIBQuery.Create(Nil);
        try
          innerQuery.DataBase := dmMain.dbTV;
          innerQuery.Transaction := dmMain.trReadQ;
          innerQuery.SQL.Text := 'select coalesce(rt.rt_printform,'''') as printform ' +
            'from request_types rt inner join request r on (rt.rt_id = r.rq_type) where r.rq_id = :RQ_ID';
          innerQuery.ParamByName('RQ_ID').AsInteger := fRQ_ID;
          innerQuery.Transaction.StartTransaction;
          innerQuery.ExecQuery;
          PrintForm := innerQuery.FieldByName('printform').AsString;
          innerQuery.Close;
          innerQuery.Transaction.Commit;
        finally
          innerQuery.Free;
        end;

        if (PrintForm <> '') then
        begin
          i := dmMain.GET_ID_REPORT_BY_PATH(PrintForm);
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

          vi := dmMain.frxModalReport.Variables.IndexOf('REQUEST');
          if vi > 0 then
          begin
            dmMain.frxModalReport.Variables['REQUEST'] := fRQ_ID;
            dmMain.frxModalReport.PrepareReport(True);
            dmMain.frxModalReport.Print;
          end;
        end;
      end;
      vOpen := chkOpenBid.Checked;
    finally
      Free;
    end;

  if allFine then
  begin
    if Assigned(CustomersForm) then
      CustomersForm.RefreshRequestsList(fRQ_ID, FCustomerInfo.Customer_id);

    if (vOpen) then
    begin
      // права пользователей
      FA := dmMain.AllowedAction(rght_Request_full);
      CE := dmMain.AllowedAction(rght_Request_edit);
      CC := dmMain.AllowedAction(rght_Request_Close);
      CG := dmMain.AllowedAction(rght_Request_Give);
      if (FA or CE or CC or CG) then
      begin
        if (not FFindNode) then
          ReguestExecute(fRQ_ID, FCustomerInfo.Customer_id, 1)
        else
          ReguestNodeExecute(fRQ_ID, FCustomerInfo.Customer_id, 1);
      end;
    end;

    ModalResult := mrOk;
  end;
end;

procedure TRequestNewForm.dbgTmpltsDblClick(Sender: TObject);
begin
  if not dsErrors.FieldByName('RQTL_ID').IsNull then
    luTemplate.Value := dsErrors['RQTL_ID'];
end;

procedure TRequestNewForm.dbgWorksExit(Sender: TObject);
begin
  if (dsWorks.State in [dsInsert, dsEdit]) then
  begin
    if (not dsWorks.FieldByName('W_ID').IsNull) then
      dsWorks.Post
    else
      dsWorks.Cancel;
  end;
end;

procedure TRequestNewForm.dsRequestTypeAfterOpen(DataSet: TDataSet);
begin
  if (not dsRequestType.FieldByName('RT_ID').IsNull) then
  begin
    if FReqType = -1 then
      lupType.Value := dsRequestType['RT_ID']
    else
    begin
      lupType.Value := FReqType;
      if FReqTempl <> -1 then
        luTemplate.Value := FReqTempl;
    end;
  end;
end;

procedure TRequestNewForm.edFLAT_NOExit(Sender: TObject);
begin
  actFindCustomer.Execute;

  if ((FLastFlat <> edFLAT_NO.Text) or (EdPorch.Text = '') or (EdFloor.Text = '')) and VarIsNumeric(LupHOUSE.Value) then
  begin
    with TpFIBQuery.Create(Nil) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        SQL.Text := 'select PORCH_N, FLOOR_N from HOUSEFLATS where HOUSE_ID = :HOUSE_ID and FLAT_NO = :FLAT_NO';
        ParamByName('flat_no').AsString := edFLAT_NO.Text;
        ParamByName('house_id').AsInteger := LupHOUSE.Value;
        Transaction.StartTransaction;
        ExecQuery;
        if EdPorch.Text = '' then
          EdPorch.Text := fn('PORCH_N').AsString;
        if EdFloor.Text = '' then
          EdFloor.Text := fn('FLOOR_N').AsString;
        Close;
        Transaction.Commit;
      finally
        Free;
      end;
  end;
  FLastFlat := edFLAT_NO.Text;
end;

procedure TRequestNewForm.EdFloorExit(Sender: TObject);
var
  s: string;
  NeedSave: Boolean;
begin
  if (not FAddressRight) and (dmMain.GetSettingsValue('FP_ADDRESS_CHECK') = '1') then
    Exit;

  NeedSave := False;

  if (EdFloor.Text <> '') and (EdPorch.Text <> '') and (edFLAT_NO.Text <> '') then
  begin
    if (FCustomerInfo.Customer_id > -1) then
    begin
      if (EdPorch.Text <> FCustomerInfo.porch_n) or (EdFloor.Text <> FCustomerInfo.floor_n) then
        s := format(rsRequestPorchFloor, [EdPorch.Text, EdFloor.Text]);
      NeedSave := (Application.MessageBox(PWideChar(s), PWideChar(rsSavePorchFloor),
        MB_YESNO + MB_ICONQUESTION) = IDYES);
    end
    else
      NeedSave := True;
  end;

  if NeedSave and (FCustomerInfo.HOUSE_ID > 0) then
  begin
    with TpFIBQuery.Create(Nil) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text := 'execute procedure Set_Flat_Pf(:House_Id, :Flat_No, :Porch_N, :Floor_N)';
        ParamByName('PORCH_N').AsString := EdPorch.Text;
        ParamByName('FLOOR_N').AsString := EdFloor.Text;
        ParamByName('flat_no').AsString := edFLAT_NO.Text;
        ParamByName('house_id').AsInteger := FCustomerInfo.HOUSE_ID;
        Transaction.StartTransaction;
        ExecQuery;
        Close;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TRequestNewForm.edPhoneChange(Sender: TObject);
begin
  FPhoneChanged := True;
end;

procedure TRequestNewForm.edPhoneExit(Sender: TObject);
var
  Phone: string;
begin
  if not FPhoneChanged then
    Exit;

  Phone := Trim(edPhone.Text);

  if (Phone = '') or (FCustomerInfo.Customer_id = -1) then
  begin
    FPhoneChanged := False;
    Exit;
  end;

  if (Phone = Trim(FCustomerInfo.mobile + ',' + FCustomerInfo.PHONE_NO)) then
  begin
    FPhoneChanged := False;
    Exit;
  end;

  if (Pos(edPhone.Text, FCustomerInfo.mobile + ',' + FCustomerInfo.PHONE_NO) <> 0) then
  begin
    FPhoneChanged := False;
    Exit;
  end;

  edPhone.OnChange := nil;
  edPhone.Text := SavePhone(edPhone.Text);
  FPhoneChanged := False;
  edPhone.OnChange := edPhoneChange;
end;

procedure TRequestNewForm.edtPLANDATEChange(Sender: TObject);
begin
  CheckData;
end;

procedure TRequestNewForm.edtTimeFromEnter(Sender: TObject);
begin
  if (Sender is TDBDateTimeEditEh) then
    (Sender as TDBDateTimeEditEh).SelectAll;
end;

procedure TRequestNewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsAllWorks.Active then
    dsAllWorks.Close;

  if A4MainForm.AddictSpell.Tag = 1 then
  begin
    A4MainForm.AddictSpell.RemoveControl(mmoNotice);
    A4MainForm.AddictSpell.RemoveControl(mmoContent);
  end;

  if (not frmOkCancel.bbCancel.Visible) and (FDenyCancel) then
  begin
    Action := caNone;
  end
  else
  begin
    dbgSame.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgSame', False);
    Action := caFree;
  end;
  // Free;
end;

procedure TRequestNewForm.FormCreate(Sender: TObject);
var
  s: string;
begin
  dbgSame.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgSame',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);
  dsStreets.Open;
  s := dmMain.GetSettingsValue('AREA_LOCK');
  if (s <> '') and (not dmMain.AllowedAction(rght_Programm_NotLockArea)) then
  begin
    dsHouse.ParamByName('AREA_LOCK').Value := format(' and ((h.Subarea_Id) is null or (h.Subarea_Id in (%s))) ', [s]);
  end;

  dsHouse.Open;

  SetReqType(-1);
  dsRequestType.AfterOpen := nil;
  dsRequestType.Open;
  dsRequestType.AfterOpen := dsRequestTypeAfterOpen;

  dsWorks.Open;
  dsDefaultWorks.Open;
  dsErrors.Open;
  fRQ_ID := -1;
  FFindNode := False;
  FPhoneChanged := False;
  FCustomerInfo.Customer_id := -1;
  InitSecurity;
  AplySortSameReq(True);
  chkOpenBid.Checked := (dmMain.GetIniValue('REQOPENNEW') = '1');
  FReqTempl := -1;
  FDenyCancel := False;
end;

procedure TRequestNewForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (ssCtrl in Shift) and (Ord(Key) = VK_RETURN) then
  begin
    if ssShift in Shift then
      chkOpenBid.Checked := True;

    bbOkClick(Sender);
  end;
end;

procedure TRequestNewForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then
  begin
    go := True;

    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBComboBoxEh) then
      go := not(ActiveControl as TDBComboBoxEh).ListVisible
    else
    begin
      if (ActiveControl is TDBGridEh) then
      begin
        if (ActiveControl as TDBGridEh).DataSource.State in [dsEdit, dsInsert] then
          go := False
        else
          go := True;
      end
      else
      begin
        if (ActiveControl is TDBMemoEh) and
          (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
        begin
          go := False;
          FEnterSecondPress := True;
        end;
      end;
    end;

    if (go) then
    begin
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

procedure TRequestNewForm.FormShow(Sender: TObject);
begin
  if A4MainForm.AddictSpell.Tag = 1 then
  begin
    A4MainForm.AddictSpell.AddControl(mmoContent);
    A4MainForm.AddictSpell.AddControl(mmoNotice);
  end;

  // спрячем кнопку + для добавления адреса если это запрещено
  LupStreets.EditButtons[0].Visible := FAddressRight;
  LupHOUSE.EditButtons[0].Visible := FAddressRight;
  lupType.EditButtons[0].Visible := (dmMain.AllowedAction(rght_Dictionary_full) or
    dmMain.AllowedAction(rght_Dictionary_ReqType));
  luTemplate.EditButtons[0].Visible := (dmMain.AllowedAction(rght_Dictionary_full) or
    dmMain.AllowedAction(rght_Dictionary_ReqTemplate));
end;

procedure TRequestNewForm.frmOkCancelbbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TRequestNewForm.bbOkClick(Sender: TObject);
begin
  if (not frmOkCancel.bbCancel.Visible) and (FDenyCancel) then
  begin
    // проверка на запрет закрытия окна
    frmOkCancel.bbCancel.Tag := 0;
    FDenyCancel := False;
  end;
  actSave.Execute;
end;

procedure TRequestNewForm.btnClearClick(Sender: TObject);
begin
  FindCustomer('', '', -1);
end;

procedure TRequestNewForm.cbContactButtonClick(Sender: TObject; var Handled: Boolean);
var
  cb: TComponent;
begin
  cb := (Sender as TComponent).Owner;
  if not(cb is TDBComboBoxEh) then
    Exit;

  if (cb as TDBComboBoxEh).Tag = 2 then
  begin
    if not(cb as TDBComboBoxEh).ListVisible then
      (cb as TDBComboBoxEh).DropDown
    else
      (cb as TDBComboBoxEh).CloseUp(False);
    (cb as TDBComboBoxEh).Tag := 0;
  end
  else
  begin
    (cb as TDBComboBoxEh).Tag := 2;
  end;

  Handled := ((cb as TDBComboBoxEh).Tag = 2);
end;

procedure TRequestNewForm.cbContactClick(Sender: TObject);
begin
  if not(Sender is TDBComboBoxEh) then
    Exit;

  if (Sender as TDBComboBoxEh).Items.Count = 0 then
    Exit;

  if (Sender as TDBComboBoxEh).Tag = 0 then
  begin
    if not(Sender as TDBComboBoxEh).ListVisible then
      (Sender as TDBComboBoxEh).DropDown
    else
      (Sender as TDBComboBoxEh).CloseUp(False);
  end;

  (Sender as TDBComboBoxEh).Tag := 0;
end;

procedure TRequestNewForm.cbContactEnter(Sender: TObject);
begin
  if not(Sender is TDBComboBoxEh) then
    Exit;

  if not(Sender as TDBComboBoxEh).ListVisible then
  begin
    (Sender as TDBComboBoxEh).DropDown;
    (Sender as TDBComboBoxEh).Tag := 1;
  end;
end;

procedure TRequestNewForm.cbContactNotInList(Sender: TObject; NewText: string; var RecheckInList: Boolean);
begin
  if (not NewText.Trim.IsEmpty) and (FCustomerInfo.Customer_id > 0) then
    SavePhone(NewText);
  RecheckInList := False;
  // FPhoneChanged := False;
end;

procedure TRequestNewForm.LupHOUSEChange(Sender: TObject);
begin
  if (dsHouse.Active) and (dsHouse['inService'] <> '') then
    LupHOUSE.Color := clYellow
  else
    LupHOUSE.Color := clWindow;

  FLastFlat := '';
end;

procedure TRequestNewForm.LupHOUSEDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsHouse.Active) and (dsHouse['inService'] <> '') then
    Background := clYellow
  else
    Background := clWindow;
end;

procedure TRequestNewForm.LupHOUSEEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  i: int64;
  sid: int64;
begin
  if (not VarIsNumeric(LupStreets.Value)) then
  begin
    LupStreets.SetFocus;
    Exit;
  end;
  sid := LupStreets.Value;
  i := EditHouse(-1, sid);
  if i > -1 then
  begin
    dsHouse.CloseOpen(True);
    LupHOUSE.Value := i;
  end;
  Handled := True;
end;

procedure TRequestNewForm.LupHOUSEExit(Sender: TObject);
begin
  // Если не найдем дату, то проверим данные
  // Установка даты вызовет проверку сама
  if not FindNearFreeDay then
    CheckData;
end;

procedure TRequestNewForm.LupStreetsChange(Sender: TObject);
begin
  FLastFlat := '';
end;

procedure TRequestNewForm.LupStreetsEditButtons0Click(Sender: TObject; var Handled: Boolean);
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

procedure TRequestNewForm.lupTypeButtonClick(Sender: TObject; var Handled: Boolean);
var
  cb: TComponent;
  i: Integer;
  v: Boolean;
begin
  cb := (Sender as TComponent).Owner;
  if not(cb is TDBLookupComboboxEh) then
    Exit;

  i := (cb as TDBLookupComboboxEh).Tag;
  v := (cb as TDBLookupComboboxEh).ListVisible;
  if i = 2 then
  begin
    if not v then
      (cb as TDBLookupComboboxEh).DropDown
    else
      (cb as TDBLookupComboboxEh).CloseUp(False);
    (cb as TDBLookupComboboxEh).Tag := 0;
  end
  else
    (cb as TDBLookupComboboxEh).Tag := 2;

  Handled := ((cb as TDBLookupComboboxEh).Tag = 2);
end;

procedure TRequestNewForm.lupTypeChange(Sender: TObject);
begin
  CheckData;
  ClearWorks;
  if (dsRequestType.Active) and (not dsRequestType.FieldByName('COLOR').IsNull) then
    lupType.Color := StringToColor(dsRequestType['COLOR'])
  else
    lupType.Color := clWindow;

  if ((not dsRequestType.FieldByName('CAUSE_NEED').IsNull) and (dsRequestType['CAUSE_NEED'])) then
    lblCAUSE.Font.Style := lblCAUSE.Font.Style + [fsBold]
  else
    lblCAUSE.Font.Style := lblCAUSE.Font.Style - [fsBold];
end;

procedure TRequestNewForm.DBLookupComboboxClick(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    Exit;

  if (Sender as TDBLookupComboboxEh).Tag = 0 then
  begin
    if not(Sender as TDBLookupComboboxEh).ListVisible then
      (Sender as TDBLookupComboboxEh).DropDown
    else
      (Sender as TDBLookupComboboxEh).CloseUp(False);
  end;

  (Sender as TDBLookupComboboxEh).Tag := 0;
end;

procedure TRequestNewForm.lupTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsRequestType.Active) and (not dsRequestType.FieldByName('COLOR').IsNull) then
    Background := StringToColor(dsRequestType['COLOR'])
  else
    Background := clWindow;
end;

procedure TRequestNewForm.lupTypeEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  Handled := True;
  if ReguestTypeModify(-1) > -1 then
    dsRequestType.CloseOpen(True);
end;

procedure TRequestNewForm.DBLookupComboboxEnter(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    Exit;

  if not(Sender as TDBLookupComboboxEh).ListVisible then
  begin
    (Sender as TDBLookupComboboxEh).DropDown;
    (Sender as TDBLookupComboboxEh).Tag := 1;
  end;
end;

procedure TRequestNewForm.luTemplateChange(Sender: TObject);
begin
  if not varIsNull(luTemplate.Value) then
  begin
    InsertWorks;

    chkRecreate.Visible := (not dsErrors.FieldByName('RECREATE_DAYS').IsNull);
    if (chkRecreate.Visible) then
      chkRecreate.Caption := format(rsRequestRecreateD, [dsErrors.FieldByName('RECREATE_DAYS').AsInteger]);

    FindNearFreeDay;

    ShowAddInfo;
  end;

end;

procedure TRequestNewForm.InsertWorks;
var
  ja: TJsonArray;
  jv: TJsonDataValueHelper;
begin
  dsWorks.DisableControls;
  ClearWorks;

  if not dsErrors.FieldByName('WORKS').IsNull then
  begin
    ja := (TJsonObject.Parse(dsErrors['WORKS']) as TJsonArray);
    try
      if (ja.Count > 0) then
      begin
        if not dsAllWorks.Active then
          dsAllWorks.Open;

        if dsAllWorks.RecordCount > 0 then
        begin
          for jv in ja do
          begin
            if dsAllWorks.Locate('W_ID', jv.i['i'], []) then
            begin
              dsWorks.Append;
              dsWorks['W_ID'] := dsAllWorks['W_ID'];
              dsWorks['name'] := dsAllWorks['NAME'];
              dsWorks['quant'] := jv.f['q'];
              dsWorks['w_time'] := dsAllWorks['W_TIME'];
              dsWorks['w_cost'] := dsAllWorks['W_COST'];
              if (jv.s['n'] <> '') then
                dsWorks['notice'] := jv.s['n'];
              dsWorks.Post;
            end;
          end;
        end;
      end;
    finally
      ja.Free;
    end;
  end;
  dsWorks.EnableControls;
end;

procedure TRequestNewForm.luTemplateEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  Handled := True;
  if lupType.Text = '' then
    Exit;

  if ReguestTemplateModify(-1, dsRequestType['RT_ID']) > -1 then
    dsErrors.CloseOpen(True);
end;

procedure TRequestNewForm.pnlRClientResize(Sender: TObject);
begin
  mmoNotice.Height := pnlRClient.Height - 30;
end;

procedure TRequestNewForm.rbADRSClick(Sender: TObject);
begin
  AplySortSameReq(True);
end;

procedure TRequestNewForm.rbZVClick(Sender: TObject);
begin
  AplySortSameReq(False);
end;

procedure TRequestNewForm.AplySortSameReq(const AdresSort: Boolean = False);
var
  isOpen: Boolean;
begin
  isOpen := dsSame.Active;
  if isOpen then
    dsSame.Close;
  if AdresSort then
    dsSame.ParamByName('FILTER').AsString := ' ( exists(select H1.HOUSE_ID ' +
      ' from HOUSE H1 where H1.HOUSE_ID = R.HOUSE_ID and exists(select h2.STREET_ID from HOUSE h2 ' +
      ' where H2.STREET_ID = H1.STREET_ID and HOUSE_ID = :HOUSE_ID))) '
  else
    dsSame.ParamByName('FILTER').AsString :=
      ' (exists(select WG_ID from HOUSE where WG_ID = H.WG_ID and HOUSE_ID = :HOUSE_ID)) ';
  if isOpen then
    dsSame.Open;
end;

procedure TRequestNewForm.ClearWorks;
begin
  if dsWorks.Active then
    dsWorks.Close;
  dsWorks.Open;
  dsWorks.EmptyTable;
  {
    if not dsDefaultWorks.Active then
    dsDefaultWorks.Open;
    dsDefaultWorks.First;
    while not dsDefaultWorks.Eof do
    begin
    dsWorks.Append;
    dsWorks['W_ID'] := dsDefaultWorks['W_ID'];
    dsWorks['NAME'] := dsDefaultWorks['NAME'];
    dsWorks['W_TIME'] := dsDefaultWorks['W_TIME'];
    dsWorks['W_COST'] := dsDefaultWorks['W_COST'];
    dsWorks['QUANT'] := 1;
    dsWorks.Post;
    dsDefaultWorks.Next;
    end;
    dsWorks.First;
  }
end;

procedure TRequestNewForm.CheckData;
begin
  actDateSelect.Enabled := not(varIsNull(lupType.Value) or varIsNull(LupHOUSE.Value));
  actReqForAdres.Enabled := not(varIsNull(edtPLANDATE.Value) or varIsNull(LupHOUSE.Value));
  // Найдем свободный день для дома
  // if (not varIsNull(LupHOUSE.Value)) // and (varIsNull(edtPLANDATE.Value))
  // then FindNearFreeDay;

  if (not varIsNull(LupHOUSE.Value)) then
  begin
    if (not varIsNull(edtPLANDATE.Value)) then
      ShowReqForAdres(LupHOUSE.Value, edtPLANDATE.Value)
    else
      ShowReqForAdres(LupHOUSE.Value, NULL);
  end
end;

procedure TRequestNewForm.InitSecurity;
begin
  FFullAccess := dmMain.AllowedAction(rght_Request_full);
  // (50, 'ПОЛНЫЙ ДОСТУП', 'ЗАЯВКИ', 'Полный доступ');
  FCanEdit := dmMain.AllowedAction(rght_Request_edit);
  // (52, 'РЕДАКТИРОВАНИЕ', 'ЗАЯВКИ', 'Редактирование заявки');
  FCanClose := dmMain.AllowedAction(rght_Request_Close); // (54, 'ЗАКРЫТИЕ', 'ЗАЯВКИ', 'Закрытие заявки');
  FCanGive := dmMain.AllowedAction(rght_Request_Give); // (53, 'ВЫДАЧА', 'ЗАЯВКИ', 'Выдача заявок в работу');
  FCanCreate := dmMain.AllowedAction(rght_Request_add); // (51, 'ДОБАВЛЕНИЕ', 'ЗАЯВКИ', 'Добавление заявок');
  FAddressRight := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street);

  frmOkCancel.bbOk.Enabled := (FCanCreate or FFullAccess);

  // Запретим выбор даты вручную
  edtPLANDATE.ReadOnly := not(FFullAccess or dmMain.AllowedAction(rght_Request_DateChange));
  // 56, 'Изменение даты заявки
  edtPLANDATE.EditButton.Visible := FFullAccess or dmMain.AllowedAction(rght_Request_DateChange);
  // 56, 'Изменение даты заявки
end;

function TRequestNewForm.FindNearFreeDay: Boolean;
var
  FindedDate: TDate;
  isSet: Boolean;
begin
  Result := False;
  if varIsNull(LupHOUSE.Value) then
    Exit;
  isSet := False;
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := trQuery;
      SQL.Text := 'select FREE_DAY from GET_REQUEST_FREEDAY(:HOUSE_ID, :TEMPLATE_ID)';
      ParamByName('HOUSE_ID').AsInteger := LupHOUSE.Value;
      if not varIsNull(luTemplate.Value) then
      begin
        ParamByName('TEMPLATE_ID').AsInteger := luTemplate.Value;
      end
      else
        ParamByName('TEMPLATE_ID').Clear;
      Transaction.StartTransaction;
      ExecQuery;
      if not Eof then
      begin
        FindedDate := FieldByName('FREE_DAY').AsDate;
        // попытка изменить дату заявки
        // если дата пустая, то установим найденную
        if varIsNull(edtPLANDATE.Value) then
        begin
          edtPLANDATE.Value := FindedDate;
          isSet := True;
        end
        else
        begin
          // проверим изменялась ли дата, если нет, то установим ее
          if (FindedDate > Tomorrow) then
          begin
            edtPLANDATE.Value := FindedDate;
            isSet := True;
          end;
        end;
      end;
      Close;
      if Transaction.Active then
        Transaction.Commit;
    finally
      Free;
    end;
  Result := isSet;
end;

procedure TRequestNewForm.ShowReqForAdres(HOUSE_ID: Integer; plan_date: Variant);
var
  i: Integer;
begin
  if dsSame.Active then
    dsSame.Close;

  dsSame.ParamByName('RQ_ID').AsInteger := -1;
  if dsSame.ParamExist('HOUSE_ID', i) then
    dsSame.Params[i].AsInteger := HOUSE_ID;

  if varIsNull(plan_date) then
    dsSame.ParamByName('RQ_PLAN_DATE').Clear
  else
    dsSame.ParamByName('RQ_PLAN_DATE').AsDate := plan_date;
  dsSame.Open;
end;

procedure TRequestNewForm.ShowAddInfo;
var
  s: String;
begin
  if dsErrors.FieldByName('ADD_FIELD').IsNull then
  begin
    pnlAddInfo.Visible := False;
    Exit;
  end;

  s := dsErrors['ADD_FIELD'];
  cbbAdd.Items.Clear;
  cbbAdd.Text := '';
  cbbAdd.Items.Delimiter := ';';
  cbbAdd.Items.DelimitedText := s;
  cbbAdd.KeyItems.Delimiter := ';';
  cbbAdd.KeyItems.DelimitedText := s;
  pnlAddInfo.Visible := cbbAdd.Items.Count > 0;
end;

function TRequestNewForm.SavePhone(Const Phone: String): String;
var
  Contact: TContact;
begin
  Contact.cID := -1;
  Contact.Contact := Phone;
  Contact.Notify := 1;
  Contact.notice := '';
  Contact.CustID := FCustomerInfo.Customer_id;
  if EditContact(Contact) then
  begin
    with TpFIBQuery.Create(Nil) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text :=
          'execute procedure Customer_Contacts_Iu(:Customer_Id, :Cc_Value, :Cc_Type, :Cc_Notice, :Cc_Notify, null)';
        ParamByName('Customer_Id').AsInteger := FCustomerInfo.Customer_id;
        ParamByName('Cc_Value').AsString := Contact.Contact;
        ParamByName('CC_TYPE').AsInteger := Contact.cID;
        ParamByName('Cc_Notify').AsInteger := Contact.Notify;
        ParamByName('Cc_Notice').AsString := Contact.notice;
        Transaction.StartTransaction;
        ExecQuery;
        Close;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  end;
  Result := Trim(Contact.Contact + ' ' + Contact.notice);
end;

procedure TRequestNewForm.SetPhonesCB(const list: String);
var
  i: Integer;
  s: string;
  phones: TStringDynArray;
begin
  phones := Explode(',', list);
  cbContact.Items.Clear;
  for i := 0 to Length(phones) - 1 do
  begin
    s := Trim(phones[i]);
    if not s.IsEmpty then
      cbContact.Items.Add(s);
  end;
  cbContact.Items.Add('Без номера');
end;

end.
