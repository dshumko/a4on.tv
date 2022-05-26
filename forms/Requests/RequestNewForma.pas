unit RequestNewForma;

interface

{$I defines.inc}

uses
  WinAPI.Windows, WinAPI.Messages, System.SysUtils, System.Variants,
  VCL.Graphics, VCL.Controls, VCL.Forms, VCL.Dialogs, System.Classes,
  System.Actions, VCL.ActnList, VCL.Buttons, VCL.ExtCtrls,
  VCL.Mask, VCL.DBCtrls, System.UITypes, Data.DB, VCL.StdCtrls,

  DBGridEh, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  MemTableDataEh, PropFilerEh, CnErrorProvider, PropStorageEh, CustomerInfoFrame,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, MemTableEh, DBCtrlsEh, DBLookupEh,
  EhLibVCL, GridsEh, DBAxisGridsEh, OkCancel_frame, PrjConst, DM, A4onTypeUnit;

type
  TRequestNewForm = class(TForm)
    pnlAdresInfo: TPanel;
    pnlAdres: TPanel;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl2: TLabel;
    LupStreets: TDBLookupComboboxEh;
    LupHOUSE: TDBLookupComboboxEh;
    edFLAT_NO: TDBEditEh;
    btnFind: TButton;
    edPhone: TDBEditEh;
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
  private
    { Private declarations }
    fRQ_ID: Integer;
    FFindNode: Boolean;
    FCustomerInfo: TCustomerInfo;
    FullAccess: Boolean; // полный доступ
    FCanEdit: Boolean; // может изменять результат выполнения
    FCanClose: Boolean; // может закрыть заявку
    FCanCreate: Boolean; // может добавить заявку
    FCanGive: Boolean; // может выдать заявку
    FPhoneChanged: Boolean;
    function FindCustomer(const lic: string; const code: string; id: Integer; const FindNode: Integer = 0): Integer;
    procedure ChangeWorks;
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
    procedure ShowReqForAdres(HOUSE_ID: Integer; plan_date: Variant);
    procedure ShowAddInfo;
    procedure AplySortSameReq(const AdresSort: Boolean = False);
    function SavePhone(Const Phone: String): String;
  public
    { Public declarations }
    property Request_id: Integer read fRQ_ID;
    property Customer_id: Integer read GetCustomer_ID write SetCustomer_ID;
    property Node_id: Integer read GetNode_ID write SetNode_ID;
    property FindNode: Boolean read GetFindNode write SetFindNode; // поиск узлов
    property FromRequest: Integer write SetFromRequest;
  end;

function NewRequest(const aCustomer: Integer = -1; CallBack: TCallBack = nil; const FindNodes: Boolean = False)
  : Integer;
function NewRequestByAdres(const Street_ID: Integer = -1; const HOUSE_ID: Integer = -1;
  const Flat: String = ''): Integer;
function NewRequestFromRequest(const aRequest: Integer = -1): Integer;
function NewRequestFromPlaner(const plan_date: TDateTime; const TYPE_ID: Integer = -1): Integer;
function NewNodeRequest(const aNode: Integer = -1; CallBack: TCallBack = nil): Integer;
function NewFileRequest(const aCustomer: Integer = -1; const ReqType: Integer = -1; const ReqTempl: Integer = -1;
  const rd: TDate = 0; const Notice: String = ''): Integer;

implementation

{$R *.dfm}

uses System.StrUtils, SelectDateForma, pFIBQuery, DateUtils, ReqAddWorkForma, MAIN,
  FIBQuery, pFIBProps, AtrCommon, HouseForma, StreetEditForma,
  CF, RequestForma, ReqTypeForma, ReqTemplateForma, ContactForma, System.MaskUtils;

function NewRequest(const aCustomer: Integer = -1; CallBack: TCallBack = nil; const FindNodes: Boolean = False)
  : Integer;
begin
  Result := -1;
  with TRequestNewForm.Create(Application) do
  begin
    if FindNodes then
    begin
      Node_id := aCustomer;
    end
    else
    begin
      Customer_id := aCustomer;
    end;
    FindNode := FindNodes;
    if showModal = mrOk then
    begin
      Result := Request_id;
      if Assigned(CallBack) then
        CallBack;
    end;
    Free;
  end;
end;

function NewRequestByAdres(const Street_ID: Integer = -1; const HOUSE_ID: Integer = -1;
  const Flat: String = ''): Integer;
begin
  Result := -1;
  with TRequestNewForm.Create(Application) do
  begin
    LupStreets.Value := Street_ID;
    LupHOUSE.Value := HOUSE_ID;
    edFLAT_NO.Value := Flat;
    Customer_id := -1;
    if showModal = mrOk then
      Result := Request_id;
    Free;
  end;
end;

function NewNodeRequest(const aNode: Integer = -1; CallBack: TCallBack = nil): Integer;
begin
  Result := NewRequest(aNode, CallBack, true);
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

function NewFileRequest(const aCustomer: Integer = -1; const ReqType: Integer = -1; const ReqTempl: Integer = -1;
  const rd: TDate = 0; const Notice: String = ''): Integer;
begin
  Result := -1;
  with TRequestNewForm.Create(Application) do
  begin
    Customer_id := aCustomer;
    if ReqType <> -1 then
      lupType.Value := ReqType;
    if ReqTempl <> -1 then
      luTemplate.Value := ReqTempl;
    edtPLANDATE.Value := rd;
    mmoNotice.Lines.Text := Notice;
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
          edPhone.Text := FldByName['PHONE'].AsString;

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
begin
  FCustomerInfo := dmMain.FindCustomer(lic, code, id, FindNode);
  Result := FCustomerInfo.Customer_id;
  CustomerInfoFrm.Customer := FCustomerInfo;
  if FCustomerInfo.Customer_id > -1 then
  begin
    LupStreets.Value := FCustomerInfo.Street_ID;
    LupHOUSE.Value := FCustomerInfo.HOUSE_ID;
    edFLAT_NO.Text := FCustomerInfo.FLAT_NO;
    edPhone.Text := Trim(FCustomerInfo.mobile + ',' + FCustomerInfo.PHONE_NO);
    edPhone.Hint := FCustomerInfo.mobile + #13#10 + FCustomerInfo.PHONE_NO;
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
  Notice: string;
begin
  if varIsNull(lupType.Value) then
    Exit;
  if SelectRequestWork(lupType.Value, work_id, wname, quant, w_time, w_cost, Notice) then
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
    dsWorks['notice'] := Notice;
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
begin
  if dsWorks.FieldByName('w_id').IsNull then
    Exit;

  if Application.MessageBox(PWideChar(rsDeleteWork), PWideChar(format(rsDeleteWithName, [dsWorks['NAME']])),
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    dsWorks.Delete;
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
    edPhone.Text := Trim(FCustomerInfo.mobile + ',' + FCustomerInfo.PHONE_NO);
    edPhone.Hint := FCustomerInfo.mobile + #13#10 + FCustomerInfo.PHONE_NO;
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
begin
  if varIsNull(lupType.Value) then
  begin
    lupType.SetFocus;
    Exit;
  end;
  if varIsNull(LupHOUSE.Value) then
  begin
    LupHOUSE.SetFocus;
    Exit;
  end;
  if varIsNull(edtPLANDATE.Value) then
  begin
    edtPLANDATE.SetFocus;
    Exit;
  end;
  if ((pnlAddInfo.Visible) and (cbbAdd.Text = '')) then
  begin
    cbbAdd.SetFocus;
    Exit;
  end;

  if ((not dsRequestType.FieldByName('CAUSE_NEED').IsNull) and (dsRequestType['CAUSE_NEED']) and
    (varIsNull(luTemplate.Value))) then
  begin
    luTemplate.SetFocus;
    Exit;
  end;

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

      // сохраним в заявке телефон, если введен руками
      s := Trim(edPhone.Text);
      if ((FCustomerInfo.Customer_id = -1) or (s <> Trim(FCustomerInfo.mobile + ',' + FCustomerInfo.PHONE_NO))) then
      begin
        if NOT s.IsEmpty then
          ParamByName('PHONE').AsString := LeftStr(s, 50)
        else
          ParamByName('PHONE').Clear;
      end;

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
        allFine := true;
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
      allFine := true;

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
                Caption := dmMain.frxModalReport.FILENAME;
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
            dmMain.frxModalReport.PrepareReport(true);
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
        ReguestExecute(fRQ_ID, FCustomerInfo.Customer_id, 1);
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
  if (not dsWorks.FieldByName('W_ID').IsNull) and (dsWorks.State in [dsInsert, dsEdit]) then
    dsWorks.Post;

end;

procedure TRequestNewForm.dsRequestTypeAfterOpen(DataSet: TDataSet);
begin
  if not dsRequestType.FieldByName('RT_ID').IsNull then
    lupType.Value := dsRequestType['RT_ID'];
end;

procedure TRequestNewForm.edFLAT_NOExit(Sender: TObject);
begin
  actFindCustomer.Execute;

  if ((EdPorch.Text = '') or (EdFloor.Text = '')) and VarIsNumeric(LupHOUSE.Value) then
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
end;

procedure TRequestNewForm.EdFloorExit(Sender: TObject);
var
  s: string;
  NeedSave: Boolean;
begin
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
      NeedSave := true;
  end;

  if NeedSave then
  begin
    with TpFIBQuery.Create(Nil) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text :=
          'UPDATE OR INSERT INTO HOUSEFLATS (house_id, flat_no, porch_n, floor_n) VALUES (:house_id, :flat_no, :porch_n, :floor_n) matching (house_id, flat_no)';
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
  FPhoneChanged := true;
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

  edPhone.Text := SavePhone(edPhone.Text);
  FPhoneChanged := False;
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
  if A4MainForm.AddictSpell.Tag = 1 then begin
    A4MainForm.AddictSpell.RemoveControl(mmoNotice);
    A4MainForm.AddictSpell.RemoveControl(mmoContent);
  end;

  dbgSame.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgSame', false);
  Action := caFree;
  // Free;
end;

procedure TRequestNewForm.FormCreate(Sender: TObject);
var
  s : string;
begin
  dbgSame.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgSame',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);
  dsStreets.Open;
  s := dmMain.GetSettingsValue('AREA_LOCK');
  if (s <> '') and (not dmMain.AllowedAction(rght_Programm_NotLockArea)) then
  begin
    dsHouse.ParamByName('AREA_LOCK').Value := Format(' and ((h.Subarea_Id) is null or (h.Subarea_Id in (%s))) ', [s]);
  end;
  dsHouse.Open;
  dsRequestType.Open;
  dsWorks.Open;
  dsDefaultWorks.Open;
  dsErrors.Open;
  fRQ_ID := -1;
  FFindNode := False;
  FPhoneChanged := False;
  FCustomerInfo.Customer_id := -1;
  InitSecurity;
  AplySortSameReq(true);
  chkOpenBid.Checked := (dmMain.GetIniValue('REQOPENNEW') = '1');
end;

procedure TRequestNewForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    bbOkClick(Sender);
end;

procedure TRequestNewForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then
  begin
    go := true;

    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else
    begin
      if (ActiveControl is TDBGridEh) then
      begin
        if (ActiveControl as TDBGridEh).DataSource.State in [dsEdit, dsInsert] then
          go := False
        else
          go := true;
      end;
    end;

    if (go) then
    begin
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TRequestNewForm.FormShow(Sender: TObject);
begin
  if A4MainForm.AddictSpell.Tag = 1 then begin
    A4MainForm.AddictSpell.AddControl(mmoContent);
    A4MainForm.AddictSpell.AddControl(mmoNotice);
  end;

  // спрячем кнопку + для добавления адреса если это запрещено
  LupStreets.EditButtons[0].Visible :=
    ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street)));
  LupHOUSE.EditButtons[0].Visible :=
    ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street)));
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
  actSave.Execute;
end;

procedure TRequestNewForm.btnClearClick(Sender: TObject);
begin
  FindCustomer('', '', -1);
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
    dsHouse.CloseOpen(true);
    LupHOUSE.Value := i;
  end;
  Handled := true;
end;

procedure TRequestNewForm.LupHOUSEExit(Sender: TObject);
begin
  // Если не найдем дату, то проверим данные
  // Установка даты вызовет проверку сама
  if not FindNearFreeDay then
    CheckData;
end;

procedure TRequestNewForm.LupStreetsEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  i: int64;
begin
  i := EditStreet(-1);
  if i > -1 then
  begin
    dsStreets.CloseOpen(true);
    LupStreets.Value := i;
  end;
  Handled := true;
end;

procedure TRequestNewForm.lupTypeChange(Sender: TObject);
begin
  CheckData;
  ChangeWorks;
  if (dsRequestType.Active) and (not dsRequestType.FieldByName('COLOR').IsNull) then
    lupType.Color := StringToColor(dsRequestType['COLOR'])
  else
    lupType.Color := clWindow;

  if ((not dsRequestType.FieldByName('CAUSE_NEED').IsNull) and (dsRequestType['CAUSE_NEED'])) then
    lblCAUSE.Font.Style := lblCAUSE.Font.Style + [fsBold]
  else
    lblCAUSE.Font.Style := lblCAUSE.Font.Style - [fsBold];
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
  Handled := true;
  if ReguestTypeModify(-1) > -1 then
    dsRequestType.CloseOpen(true);
end;

procedure TRequestNewForm.luTemplateChange(Sender: TObject);
begin
  if not varIsNull(luTemplate.Value) then
  begin
    dsWorks.First;
    while not dsWorks.Eof do
      dsWorks.Delete;

    if not dsErrors.FieldByName('w_id').IsNull then
    begin
      dsWorks.Append;
      dsWorks['W_ID'] := dsErrors['W_ID'];
      dsWorks['W_TIME'] := dsErrors['W_TIME'];
      dsWorks['W_COST'] := dsErrors['W_COST'];
      dsWorks['NAME'] := dsErrors['NAME'];
      dsWorks['QUANT'] := 1;
      dsWorks.Post;
    end;

    chkRecreate.Visible := (not dsErrors.FieldByName('RECREATE_DAYS').IsNull);
    if (chkRecreate.Visible) then
      chkRecreate.Caption := format(rsRequestRecreateD, [dsErrors.FieldByName('RECREATE_DAYS').AsInteger]);

    FindNearFreeDay;

    ShowAddInfo;
  end;

end;

procedure TRequestNewForm.luTemplateEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  Handled := true;
  if lupType.Text = '' then
    Exit;

  if ReguestTemplateModify(-1, dsRequestType['RT_ID']) > -1 then
    dsErrors.CloseOpen(true);
end;

procedure TRequestNewForm.pnlRClientResize(Sender: TObject);
begin
  mmoNotice.Height := pnlRClient.Height - 30;
end;

procedure TRequestNewForm.rbADRSClick(Sender: TObject);
begin
  AplySortSameReq(true);
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

procedure TRequestNewForm.ChangeWorks;
begin
  dsWorks.Close;
  dsWorks.Open;
  while not dsWorks.Eof do
    dsWorks.Delete;
  if not dsDefaultWorks.Active then
    dsDefaultWorks.Open;
  dsDefaultWorks.First;
  while not dsDefaultWorks.Eof do
  begin
    dsWorks.Append;
    dsWorks['W_ID'] := dsDefaultWorks['W_ID'];
    dsWorks['W_TIME'] := dsDefaultWorks['W_TIME'];
    dsWorks['NAME'] := dsDefaultWorks['NAME'];
    dsWorks['QUANT'] := 1;
    dsWorks.Post;
    dsDefaultWorks.Next;
  end;
  dsWorks.First;
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
  FullAccess := dmMain.AllowedAction(rght_Request_full);
  // (50, 'ПОЛНЫЙ ДОСТУП', 'ЗАЯВКИ', 'Полный доступ');
  FCanEdit := dmMain.AllowedAction(rght_Request_edit);
  // (52, 'РЕДАКТИРОВАНИЕ', 'ЗАЯВКИ', 'Редактирование заявки');
  FCanClose := dmMain.AllowedAction(rght_Request_Close); // (54, 'ЗАКРЫТИЕ', 'ЗАЯВКИ', 'Закрытие заявки');
  FCanGive := dmMain.AllowedAction(rght_Request_Give); // (53, 'ВЫДАЧА', 'ЗАЯВКИ', 'Выдача заявок в работу');
  FCanCreate := dmMain.AllowedAction(rght_Request_add); // (51, 'ДОБАВЛЕНИЕ', 'ЗАЯВКИ', 'Добавление заявок');

  frmOkCancel.bbOk.Enabled := (FCanCreate or FullAccess);

  // Запретим выбор даты вручную
  edtPLANDATE.ReadOnly := not(FullAccess or dmMain.AllowedAction(rght_Request_DateChange));
  // 56, 'Изменение даты заявки
  edtPLANDATE.EditButton.Visible := FullAccess or dmMain.AllowedAction(rght_Request_DateChange);
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
          isSet := true;
        end
        else
        begin
          // проверим изменялась ли дата, если нет, то установим ее
          if (FindedDate > Tomorrow) then
          begin
            edtPLANDATE.Value := FindedDate;
            isSet := true;
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
  Contact.cID := 999;
  Contact.Contact := Phone;
  Contact.Notify := 1;
  Contact.Notice := '';
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
        ParamByName('Cc_Notice').AsString := Contact.Notice;
        Transaction.StartTransaction;
        ExecQuery;
        Close;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  end;
  Result := Trim(Contact.Contact + ' ' + Contact.Notice);
end;

end.
