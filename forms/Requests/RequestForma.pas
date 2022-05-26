unit RequestForma;

{$I defines.inc}

interface

uses
  Vcl.Menus, System.Classes, System.Actions, Vcl.ActnList,
  Data.DB, FIBDataSet, pFIBDataSet, Vcl.Buttons, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, System.SysUtils, System.Variants,
  Vcl.Dialogs, System.UITypes, Vcl.dbcgrids, Vcl.Grids,
  Winapi.Windows, Winapi.Messages,

  frxClass, EhLibFIB, frxDBSet, DM, CustomerInfoFrame,
  ToolCtrlsEh, DBGridEhToolCtrls, FIBQuery, pFIBQuery,
  DBAxisGridsEh, PrjConst, EhLibVCL, DBLookupEh,
  CnErrorProvider, FIBDatabase, pFIBDatabase, GridsEh, DBCtrlsEh,
  A4onTypeUnit, PropFilerEh, PropStorageEh, DBGridEhGrouping, DynVarsEh,
  DBGridEh, OkCancel_frame;

type
  TRequestForm = class(TForm)
    srcExecutor: TDataSource;
    dsExecutor: TpFIBDataSet;
    srcRequest: TDataSource;
    dsRequest: TpFIBDataSet;
    srcRequestType: TDataSource;
    dsRequestType: TpFIBDataSet;
    OkCancelFrame: TOkCancelFrame;
    pnlHead: TPanel;
    ActionList1: TActionList;
    srcErrors: TDataSource;
    dsErrors: TpFIBDataSet;
    PageControl: TPageControl;
    tabRequest: TTabSheet;
    Panel2: TPanel;
    Label5: TLabel;
    mmoNotice: TDBMemoEh;
    tabExecute: TTabSheet;
    pnlExecTop: TPanel;
    pnlExecTime: TPanel;
    pnlBid: TPanel;
    Label11: TLabel;
    PLANDATE: TDBDateTimeEditEh;
    Label12: TLabel;
    Label13: TLabel;
    dsStreets: TpFIBDataSet;
    srcStreet: TDataSource;
    dsHouses: TpFIBDataSet;
    srcHouse: TDataSource;
    deTimeFrom: TDBDateTimeEditEh;
    deTimeTo: TDBDateTimeEditEh;
    Label10: TLabel;
    deEndExecDateTime: TDBDateTimeEditEh;
    actExecutors: TAction;
    actMaterials: TAction;
    actFindCustomer: TAction;
    tabGiveReq: TTabSheet;
    Panel12: TPanel;
    Label17: TLabel;
    bbExecutors: TButton;
    Panel13: TPanel;
    dbgWorkers: TDBGridEh;
    pnlGiveTime: TPanel;
    Label20: TLabel;
    deStartExecDateTime: TDBDateTimeEditEh;
    Label21: TLabel;
    cbResultExec: TDBComboBoxEh;
    dsRequests: TpFIBDataSet;
    frxDBrequests: TfrxDBDataset;
    btnReqForAdres: TButton;
    actReqForAdres: TAction;
    actWorks: TAction;
    btnSelectDate: TBitBtn;
    pnlRequestHead: TPanel;
    pnlReqType: TPanel;
    Label9: TLabel;
    luType: TDBLookupComboboxEh;
    pnlCustSearch: TPanel;
    Label4: TLabel;
    Label18: TLabel;
    edLicevoy: TEdit;
    edCode: TEdit;
    pnlAddress: TPanel;
    Label3: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    LupStreets: TDBLookupComboboxEh;
    LupHOUSE: TDBLookupComboboxEh;
    edFLAT_NO: TDBEditEh;
    btnFind: TButton;
    edPhone: TDBEditEh;
    EdPorch: TDBEditEh;
    EdFloor: TDBEditEh;
    pnlCI: TPanel;
    CustomerInfoFrm: TCustomerInfoFrm;
    dbtxtUchZv: TDBText;
    actSave: TAction;
    edDOOR: TDBEditEh;
    lbl2: TLabel;
    lbl12: TLabel;
    luTemplate: TDBLookupComboboxEh;
    pnlActions: TPanel;
    btnCancel: TButton;
    dsResult: TpFIBDataSet;
    srcResult: TDataSource;
    lblRes: TLabel;
    luResult: TDBLookupComboboxEh;
    lbl5: TLabel;
    edReceipt: TDBEditEh;
    lbl3: TLabel;
    edExExecutors: TDBEditEh;
    pnlNotice: TPanel;
    Label6: TLabel;
    dbMemDefect: TDBMemoEh;
    mmoContent: TDBMemoEh;
    btnPrint: TButton;
    actPrint: TAction;
    frxReport: TfrxReport;
    actMatIn: TAction;
    btnWorks: TButton;
    btnMaterials: TButton;
    btnMatIn: TButton;
    dsWorks: TpFIBDataSet;
    srcWorks: TDataSource;
    lbl1: TLabel;
    dbgWorks: TDBGridEh;
    dbgMaterials: TDBGridEh;
    splGrids: TSplitter;
    srcMaterials: TDataSource;
    dsMaterials: TpFIBDataSet;
    pnlWMbuttons: TPanel;
    pnlGrids: TPanel;
    pnlWM: TPanel;
    actSMS: TAction;
    mmRequest: TMainMenu;
    N1: TMenuItem;
    actExAddressEdit: TAction;
    N2: TMenuItem;
    cnError: TCnErrorProvider;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    tabFiles: TTabSheet;
    srcPhotos: TDataSource;
    dsPhotos: TpFIBDataSet;
    dbgPhotos: TDBGridEh;
    imgJPG: TDBImageEh;
    spl1: TSplitter;
    actFileAdd: TAction;
    pmGridMat: TPopupMenu;
    tabComments: TTabSheet;
    miDelMat: TMenuItem;
    pmGridWork: TPopupMenu;
    miDelWork: TMenuItem;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    dsMSG: TpFIBDataSet;
    srcMSG: TDataSource;
    actMSGAdd: TAction;
    actMSGDel: TAction;
    pnlMSG: TPanel;
    dbgMsg: TDBGridEh;
    spl3: TSplitter;
    pnlMSGText: TPanel;
    mmoComment: TDBMemoEh;
    pnlMSGButton: TPanel;
    btnMSGSave: TButton;
    btnMSGCancel: TButton;
    dbtParent: TDBText;
    dbtxtCHILD_INFO: TDBText;
    PropStorageEh: TPropStorageEh;
    spl2: TSplitter;
    actReqDel: TAction;
    miN3: TMenuItem;
    miReqDel: TMenuItem;
    Splitter: TSplitter;
    pnlAddInfo: TPanel;
    lbl14: TLabel;
    cbbAdd: TDBComboBoxEh;
    actFileDel: TAction;
    Panel1: TPanel;
    btnFileDel: TSpeedButton;
    btnFileAdd: TSpeedButton;
    procedure actExecutorsExecute(Sender: TObject);
    procedure actFindCustomerExecute(Sender: TObject);
    procedure actMaterialsExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure luTypeEnter(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure deTimeFromExit(Sender: TObject);
    procedure deTimeToExit(Sender: TObject);
    procedure OkCancelFrame1bbCancelClick(Sender: TObject);
    procedure dbDateChange(Sender: TObject);
    procedure edLicevoyExit(Sender: TObject);
    procedure edCodeExit(Sender: TObject);
    procedure PageControlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure deEndExecDateTimeUpdateData(Sender: TObject; var Handled: Boolean);
    procedure deEndExecDateTimeEnter(Sender: TObject);
    procedure dbMemDefectChange(Sender: TObject);
    procedure edPhoneExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actReqForAdresExecute(Sender: TObject);
    procedure actWorksExecute(Sender: TObject);
    procedure btnSelectDateClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBGridEhTemplateDblClick(Sender: TObject);
    procedure EdFloorExit(Sender: TObject);
    procedure OkCancelFramebbOkClick(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure luResultChange(Sender: TObject);
    procedure edExExecutorsExit(Sender: TObject);
    procedure luTemplateChange(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure CustomerInfoFrmlblFIODblClick(Sender: TObject);
    procedure dbgWorkersDblClick(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actMatInExecute(Sender: TObject);
    procedure dsWorksAfterOpen(DataSet: TDataSet);
    procedure dsMaterialsAfterOpen(DataSet: TDataSet);
    procedure actSMSExecute(Sender: TObject);
    procedure actExAddressEditExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    function frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure imgJPGDblClick(Sender: TObject);
    procedure actFileAddExecute(Sender: TObject);
    procedure miDelMatClick(Sender: TObject);
    procedure miDelWorkClick(Sender: TObject);
    procedure actMSGAddExecute(Sender: TObject);
    procedure actMSGDelExecute(Sender: TObject);
    procedure btnMSGSaveClick(Sender: TObject);
    procedure btnMSGCancelClick(Sender: TObject);
    procedure srcRequestDataChange(Sender: TObject; Field: TField);
    procedure dbtParentDblClick(Sender: TObject);
    procedure dbtxtCHILD_INFODblClick(Sender: TObject);
    procedure cbResultExecChange(Sender: TObject);
    procedure edPhoneChange(Sender: TObject);
    procedure dsRequestAfterOpen(DataSet: TDataSet);
    procedure PropStorageEhReadProp(Sender: TObject; Reader: TPropReaderEh; const PropName: string;
      var Processed: Boolean);
    procedure actReqDelExecute(Sender: TObject);
    procedure luTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure LupHOUSEChange(Sender: TObject);
    procedure luTypeChange(Sender: TObject);
    procedure actFileDelExecute(Sender: TObject);
  private
    { Private declarations }
    FCustomerInfo: TCustomerInfo;
    fEditMode: Byte;
    fRequest: Integer;
    fCustomer: Integer;
    fNodeId: Integer;
    FFullAccess: Boolean; // полный доступ
    FCanEdit: Boolean; // может изменять результат выполнения
    FCanClose: Boolean; // может закрыть заявку
    FCanCloseDay: Boolean; // может закрыть заявку
    FCanUnclose: Boolean; // может закрыть заявку
    FCanCreate: Boolean; // может добавить заявку
    FCanGive: Boolean; // может выдать заявку
    FPhoneSaved: Boolean;
    FNeedExecutor: Boolean; // Требовать исполнителя заявки
    fVisibleCost: Boolean;
    FDisableAddressEdit: Boolean;
    procedure CheckData;
    function FindCustomer(const lic: string; const code: string; id: Integer; const FindNode: Integer = 0): Integer;
    procedure FindNearFreeDay;
    procedure SetRequest(Value: Integer);
    procedure SetCustomer(Value: Integer; const FindNode: Integer = 0);
    procedure InitSecurity;
    procedure ShowAddInfo;
    procedure SetGridsHeight;
    procedure NewMSG;
    procedure SaveMSG;
    procedure CancelMSG;
    procedure SetExAddressEdit(const DisableEdit: Boolean = False);
    function CheckExecutor: Boolean;
    function SavePhone(Const Phone: String): String;
    procedure OpenLinkedReq();
    function HasLinkedReq(const OnlyClosed: Boolean = False): Boolean;
  public
    { Public declarations }
    constructor CreateA(aOwner: TComponent; aRequest: Integer; const aCustomer: Integer; const aEditMode: Byte;
      const FindNode: Integer = 0);
  end;

function ReguestExecute(aRequest: Integer; const aCustomer: Integer = -1; const aEditMode: Byte = 1): Integer;
function ReguestNodeExecute(aRequest: Integer; const aNodeId: Integer = -1; const aEditMode: Byte = 1): Integer;

implementation

uses Winapi.ShellAPI, ReqMaterialsForma, AtrCommon, MAIN, ReqExecutersForma, DateUtils,
  ReqForAdresForma, SelectDateForma, RequestWorksForma, CustomerForma,
  ReqMatReturnForma, EditRFileForma, ContactForma, System.StrUtils;

{$R *.dfm}

function ReguestExecute(aRequest: Integer; const aCustomer: Integer = -1; const aEditMode: Byte = 1): Integer;
var
  i: Integer;
  b: Boolean;
begin
  Result := 0;
  b := False;
  for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
    if Assigned(A4MainForm.MDIChildren[i]) then
      if (A4MainForm.MDIChildren[i].tag = aRequest) and (A4MainForm.MDIChildren[i] is TRequestForm) then
      begin
        b := true;
        A4MainForm.MDIChildren[i].Show;
      end;

  if not b then
  begin
    // -2 Найдем абонента при открытии заявки
    TRequestForm.CreateA(Application, aRequest, aCustomer, aEditMode);
  end;
end;

function ReguestNodeExecute(aRequest: Integer; const aNodeId: Integer = -1; const aEditMode: Byte = 1): Integer;
var
  i: Integer;
  b: Boolean;
begin
  Result := 0;
  b := False;
  for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
    if Assigned(A4MainForm.MDIChildren[i]) then
      if (A4MainForm.MDIChildren[i].tag = aRequest) and (A4MainForm.MDIChildren[i] is TRequestForm) then
      begin
        b := true;
        A4MainForm.MDIChildren[i].Show;
      end;

  if not b then
  begin
    // -2 Найдем узел при открытии заявки
    TRequestForm.CreateA(Application, aRequest, aNodeId, aEditMode, 1);
  end;
end;

constructor TRequestForm.CreateA(aOwner: TComponent; aRequest: Integer; const aCustomer: Integer; const aEditMode: Byte;
  const FindNode: Integer = 0);
begin
  Create(aOwner);
  fEditMode := aEditMode;
  SetRequest(aRequest);
  SetCustomer(aCustomer, FindNode);
end;

procedure TRequestForm.CustomerInfoFrmlblFIODblClick(Sender: TObject);
begin
  if (FCustomerInfo.CUSTOMER_ID <> -1) and (fNodeId = -1) then
    ShowCustomer(FCustomerInfo.CUSTOMER_ID);
end;

procedure TRequestForm.SetCustomer(Value: Integer; const FindNode: Integer = 0);
begin
  fNodeId := -1;
  fCustomer := -1;

  if Value = -2 // поищем абонента
  then
  begin
    with TpFIBQuery.Create(Nil) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        SQL.Text := 'select Rq_Customer, node_id from request where Rq_Id = :RQ_ID';
        ParamByName('RQ_ID').AsInteger := fRequest;
        Transaction.StartTransaction;
        ExecQuery;
        if not EOF then
          if not FieldByName('Rq_Customer').IsNull then
            fCustomer := FieldByName('Rq_Customer').AsInteger;
        if not FieldByName('node_id').IsNull then
          fNodeId := FieldByName('node_id').AsInteger;
        Close;
        Transaction.Commit;
      finally
        Free;
      end;
  end
  else
  begin
    if FindNode = 1 then
      fNodeId := Value
    else
      fCustomer := Value;
  end;
end;

procedure TRequestForm.SetRequest(Value: Integer);
begin
  fRequest := Value;
  tag := fRequest;
  if fRequest <> -1 then
  begin
    Caption := Format(rsReguestWN, [fRequest]);
  end
  else
    Caption := rsRequestNew;
end;

procedure TRequestForm.actExecutorsExecute(Sender: TObject);
begin
  ReqExecutors(dsRequest['RQ_ID'], 1);
  dsExecutor.CloseOpen(true);
  if (not dsExecutor.EOF) or (edExExecutors.Text <> '') then
  begin
    if VarIsNull(deStartExecDateTime.Value) then
    begin
      deStartExecDateTime.Value := NOW;
      // deStartExecTime.Value := time;
    end;
    dsRequest['REQ_RESULT'] := 1; // признак того что выдана
  end;
end;

procedure TRequestForm.actFileAddExecute(Sender: TObject);
begin
  if (dsRequest.FieldByName('RQ_ID').IsNull) or (dsRequest.FieldByName('HOUSE_ID').IsNull) then
    Exit;

  if EditFile(dsRequest['RQ_ID'], dsRequest['HOUSE_ID']) then
  begin
    dsPhotos.CloseOpen(true);
  end
end;

procedure TRequestForm.actFileDelExecute(Sender: TObject);
begin
  if not(dmMain.AllowedAction(rght_Customer_Files_Add) or dmMain.AllowedAction(rght_Customer_Files_Edit)) then
    Exit;

  if (dsPhotos.RecordCount = 0) or (dsPhotos.FieldByName('ID').IsNull) then
    Exit;

  if MessageDlg(Format(ms_DELETE_PAY_DOC, [dsPhotos.FieldByName('NOTICE').AsString,
    dsPhotos.FieldByName('ADDED_ON').AsString]), mtConfirmation, [mbNo, mbYes], 0) = mrYes then
  begin
    dsPhotos.Delete;
  end;
end;

procedure TRequestForm.actFindCustomerExecute(Sender: TObject);
var
  flat, p, f: String;
begin
  if dsRequest.FieldByName('HOUSE_ID').IsNull then
  begin
    LupHOUSE.SetFocus;
    LupHOUSE.DropDown;
    Exit;
  end;

  if not dsRequest.FieldByName('FLAT_NO').IsNull then
    flat := dsRequest['FLAT_NO']
  else
    flat := '';

  // если указана квартира, то не будем указывать подъезд/этаж
  if (flat = '') then
  begin
    f := EdFloor.Text;
    p := EdPorch.Text;
  end
  else
  begin
    f := '';
    p := '';
  end;

  FCustomerInfo := dmMain.FindCustomerAtAdress(dsRequest['HOUSE_ID'], flat, -1, p, f);
  CustomerInfoFrm.Customer := FCustomerInfo;

  if dsRequest.State in [dsEdit, dsInsert] then
  begin
    if FCustomerInfo.CUSTOMER_ID = -1 then
    begin
      dsRequest.FieldByName('RQ_CUSTOMER').Clear;
      dsRequest.FieldByName('NODE_ID').Clear;
      Exit;
    end;

    if FCustomerInfo.isType = 1 then
    begin
      dsRequest['NODE_ID'] := FCustomerInfo.CUSTOMER_ID;
      dsRequest.FieldByName('RQ_CUSTOMER').Clear;
    end
    else
    begin
      dsRequest['RQ_CUSTOMER'] := FCustomerInfo.CUSTOMER_ID;
      dsRequest.FieldByName('NODE_ID').Clear;
    end;

    dsRequest['STREET_ID'] := FCustomerInfo.STREET_ID;
    dsRequest['HOUSE_ID'] := FCustomerInfo.HOUSE_ID;
    dsRequest['FLAT_NO'] := FCustomerInfo.FLAT_NO;
    dsRequest['PHONE'] := FCustomerInfo.PHONE_NO;
    if FCustomerInfo.porch_n <> '' then
      EdPorch.Text := FCustomerInfo.porch_n;
    if FCustomerInfo.floor_n <> '' then
      EdFloor.Text := FCustomerInfo.floor_n;
  end;
end;

procedure TRequestForm.actMaterialsExecute(Sender: TObject);
begin
  ReqMaterials(dsRequest['RQ_ID'], 1);
  dsMaterials.CloseOpen(true);
end;

procedure TRequestForm.actReqDelExecute(Sender: TObject);
var
  dsOpen: Boolean;
  i: Integer;
begin
  if not(dmMain.AllowedAction(rght_Request_full) or dmMain.AllowedAction(rght_Request_del)) then
    Exit;

  dsOpen := dsWorks.Active;
  if not dsOpen then
    dsWorks.Open;
  if not dsMaterials.Active then
    dsMaterials.Open;

  i := dsWorks.RecordCount + dsMaterials.RecordCount;

  if not dsOpen then
  begin
    dsWorks.Close;
    dsMaterials.Close;
  end;

  if (i > 0) and (MessageDlg(rsDeleteRequestWMW, mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;

  if (MessageDlg(Format(rsDeleteRequestWT, [dsRequest.FieldByName('RQ_ID').AsInteger]), mtConfirmation, [mbYes, mbNo],
    0) = mrNo) then
    Exit;

  dsRequest.DElete;
  Close;
end;

procedure TRequestForm.actReqForAdresExecute(Sender: TObject);
begin
  ShowReqForAdres(dsRequest['RQ_ID'], dsRequest['HOUSE_ID'], dsRequest['rq_plan_date']);
end;

procedure TRequestForm.actSaveExecute(Sender: TObject);
begin
  if OkCancelFrame.bbOk.Enabled then
    OkCancelFramebbOkClick(Sender);
end;

procedure TRequestForm.actWorksExecute(Sender: TObject);
begin
  ReqWorks(dsRequest['RQ_ID'], 1, dsRequest['RQ_TYPE']);
  dsWorks.CloseOpen(true);
end;

procedure TRequestForm.btnCancelClick(Sender: TObject);
begin
  if not(dsRequest.State in [dsInsert, dsEdit]) then
    dsRequest.Edit;
  dsRequest['REQ_RESULT'] := 3;
  dsRequest['RQ_EXEC_TIME'] := NOW();
  OkCancelFramebbOkClick(Sender);
end;

procedure TRequestForm.btnMSGCancelClick(Sender: TObject);
begin
  CancelMSG;
end;

procedure TRequestForm.btnMSGSaveClick(Sender: TObject);
begin
  SaveMSG;
end;

procedure TRequestForm.btnSelectDateClick(Sender: TObject);
var
  d: TDate;
begin
  if SelectRequestDate(LupHOUSE.Value, luType.Value, d) then
    PLANDATE.Value := d;
end;

function TRequestForm.FindCustomer(const lic: string; const code: string; id: Integer;
  const FindNode: Integer = 0): Integer;
begin
  FCustomerInfo := dmMain.FindCustomer(lic, code, id, FindNode);
  Result := FCustomerInfo.CUSTOMER_ID;
  CustomerInfoFrm.Customer := FCustomerInfo;

  if dsRequest.State in [dsEdit, dsInsert] then
  begin
    if FCustomerInfo.CUSTOMER_ID = -1 then
    begin
      dsRequest.FieldByName('RQ_CUSTOMER').Clear;
      dsRequest.FieldByName('NODE_ID').Clear;
      Exit;
    end;

    if FCustomerInfo.isType = 1 then
    begin
      dsRequest['NODE_ID'] := FCustomerInfo.CUSTOMER_ID;
      dsRequest.FieldByName('RQ_CUSTOMER').Clear;
    end
    else
    begin
      dsRequest['RQ_CUSTOMER'] := FCustomerInfo.CUSTOMER_ID;
      dsRequest.FieldByName('NODE_ID').Clear;
    end;

    dsRequest['STREET_ID'] := FCustomerInfo.STREET_ID;
    dsRequest['HOUSE_ID'] := FCustomerInfo.HOUSE_ID;
    dsRequest['FLAT_NO'] := FCustomerInfo.FLAT_NO;
    if edPhone.Text.IsEmpty then
      edPhone.Text := Trim(FCustomerInfo.mobile + ',' + FCustomerInfo.PHONE_NO);
    if FCustomerInfo.porch_n <> '' then
      EdPorch.Text := FCustomerInfo.porch_n;
    if FCustomerInfo.floor_n <> '' then
      EdFloor.Text := FCustomerInfo.floor_n;
    FPhoneSaved := true;
  end;
end;

procedure TRequestForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  if A4MainForm.AddictSpell.tag = 1 then
  begin
    A4MainForm.AddictSpell.RemoveControl(mmoNotice);
    A4MainForm.AddictSpell.RemoveControl(mmoContent);
    A4MainForm.AddictSpell.RemoveControl(dbMemDefect);
    A4MainForm.AddictSpell.RemoveControl(mmoComment);
  end;

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, false);
  Action := caFree;
end;

procedure TRequestForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  FCustomerInfo.CUSTOMER_ID := -1;
  FPhoneSaved := true;
  FNeedExecutor := False;
  fVisibleCost := dmMain.AllowedAction(rght_Material_Cost); // просмотр цены
  for i := 0 to dbgMaterials.Columns.Count - 1 do
  begin
    if dbgMaterials.Columns[i].FieldName = 'COST' then
      dbgMaterials.Columns[i].Visible := fVisibleCost;
  end;
end;

procedure TRequestForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBMemoEh) then
      go := False;
    if (go) then
    begin
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TRequestForm.FormShow(Sender: TObject);
var
  i: Integer;
  Font_size: Integer;
  Font_name: string;
begin
  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      (Components[i] as TDBGridEh).RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
      if (Components[i] as TDBGridEh).DataSource.DataSet.Active then
        (Components[i] as TDBGridEh).DefaultApplySorting;
      if Font_size <> 0 then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
    end;
  end;

  dsRequest.ParamByName('Request').AsInteger := fRequest;
  try
    dsRequest.Open;
  except

  end;

  if dsRequest.RecordCount = 0 then
  begin
    ShowMessage(rsRecordNotFound);
    Close;
  end
  else
  begin
    dsRequestType.ParamByName('RT_ID').AsInteger := dsRequest['RQ_TYPE'];
    dsRequestType.ParamByName('house_ID').AsInteger := dsRequest['house_ID'];
    dsRequestType.Open;

    dsStreets.Open;
    dsHouses.Open;

    dsExecutor.Active := (PageControl.ActivePage = tabGiveReq);

    // права пользователей
    InitSecurity;

    if not dsRequest.FieldByName('ADDED_BY').IsNull then
    begin
      OkCancelFrame.Label1.Caption := Format(rsTook, [dsRequest.FieldByName('ADDED_BY').AsString]);
      if not dsRequest.FieldByName('ADDED_on').IsNull then
        OkCancelFrame.Label1.Caption := OkCancelFrame.Label1.Caption + ' ' + dsRequest.FieldByName('ADDED_on').AsString;
    end;
    if not dsRequest.FieldByName('edit_by').IsNull then
    begin
      OkCancelFrame.Label2.Caption := rsChangeBy + dsRequest.FieldByName('edit_by').AsString;
      if not dsRequest.FieldByName('edit_on').IsNull then
        OkCancelFrame.Label2.Caption := OkCancelFrame.Label2.Caption + ' ' + dsRequest.FieldByName('edit_on').AsString;
    end;

    if fEditMode = 0 then
    begin
      PageControl.ActivePage := tabRequest;
      dsRequest.Insert;
      tabExecute.Enabled := False;
    end
    else
    begin
      if dsRequest.FN('RQ_COMPLETED').IsNull then
      begin
        if FCanGive or FFullAccess then
        begin
          PageControl.ActivePage := tabGiveReq;
        end;
        actFindCustomer.Enabled := FFullAccess;
      end
      else
      begin
        if FCanEdit or FFullAccess then
        begin
          PageControl.ActivePage := tabExecute;
        end;
        actFindCustomer.Enabled := FFullAccess;
      end;
      PageControlChange(Sender);
      dsRequest.Edit;
    end;

    if fCustomer >= 0 then
    begin
      pnlCustSearch.Visible := False;
      pnlHead.Height := pnlHead.Height - pnlCustSearch.Height;
      FindCustomer('', '', fCustomer);
    end
    else if fNodeId >= 0 then
    begin
      pnlCustSearch.Visible := False;
      pnlHead.Height := pnlHead.Height - pnlCustSearch.Height;
      FindCustomer('', '', fNodeId, 1);
    end;

    actReqDel.Visible := (dmMain.AllowedAction(rght_Request_full) or dmMain.AllowedAction(rght_Request_del));
  end;

  if A4MainForm.AddictSpell.tag = 1 then
  begin
    A4MainForm.AddictSpell.AddControl(mmoNotice);
    A4MainForm.AddictSpell.AddControl(mmoContent);
    A4MainForm.AddictSpell.AddControl(dbMemDefect);
    A4MainForm.AddictSpell.AddControl(mmoComment);
  end;
end;

procedure TRequestForm.luResultChange(Sender: TObject);
begin
  if dsRequest.State in [dsEdit, dsInsert] then
  begin
    if (not VarIsNull(luResult.Value)) then
    begin
      if (not dsResult.FieldByName('FINISHED').IsNull) then
      begin
        if dsResult.FieldByName('FINISHED').AsInteger = 1 then
          dsRequest['REQ_RESULT'] := 2 // выполнена
        else
          dsRequest['REQ_RESULT'] := 4 // невозможно выполнить
      end
      else
        dsRequest['REQ_RESULT'] := 4; // невозможно выполнить
      if dsRequest.FieldByName('RQ_EXEC_TIME').IsNull then
        dsRequest['RQ_EXEC_TIME'] := NOW();
    end;
  end;
end;

procedure TRequestForm.luTemplateChange(Sender: TObject);
begin
  ShowAddInfo;
end;

procedure TRequestForm.luTypeChange(Sender: TObject);
begin
  CheckData;
  if (dsRequestType.Active) and (not dsRequestType.FieldByName('COLOR').IsNull) then
    luType.Color := StringToColor(dsRequestType['COLOR'])
  else
    luType.Color := clWindow;
end;

procedure TRequestForm.luTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsRequestType.Active) and (not dsRequestType.FieldByName('COLOR').IsNull) then
    Background := StringToColor(dsRequestType['COLOR'])
  else
    Background := clWindow;
end;

procedure TRequestForm.luTypeEnter(Sender: TObject);
begin
  if luType.Field.IsNull then
    luType.DropDown;
end;

procedure TRequestForm.miDelWorkClick(Sender: TObject);
begin
  if (actWorks.Enabled) and (dsWorks.RecordCount > 0) then
  begin
    dsWorks.DElete;
  end;
end;

procedure TRequestForm.miDelMatClick(Sender: TObject);
begin
  if (actMaterials.Enabled) and (dsMaterials.RecordCount > 0) then
  begin
    dsMaterials.DElete;
  end;
end;

procedure TRequestForm.Button2Click(Sender: TObject);
begin
  if dsErrors.EOF then
    Exit;
  if dsRequest.FieldByName('RQ_CONTENT').IsNull then
    dsRequest['RQ_CONTENT'] := dsErrors['RQ_CONTENT']
  else
    dsRequest['RQ_CONTENT'] := dsRequest['RQ_CONTENT'] + rsEOL + dsErrors['RQ_CONTENT'];

end;

procedure TRequestForm.deTimeFromExit(Sender: TObject);
var
  s: string;
begin
  try
    DateTimeToString(s, 'hh:nn', deTimeFrom.Value);
  except
    Exit;
  end;
  if dsRequest.State in [dsEdit, dsInsert] then
    dsRequest['RQ_TIME_FROM'] := s;
end;

procedure TRequestForm.deTimeToExit(Sender: TObject);
var
  s: string;
begin
  try
    DateTimeToString(s, 'hh:nn', deTimeTo.Value);
  except
    Exit;
  end;
  if dsRequest.State in [dsEdit, dsInsert] then
    dsRequest['RQ_TIME_TO'] := s;
end;

procedure TRequestForm.OkCancelFrame1bbCancelClick(Sender: TObject);
begin
  if dsRequest.State in [dsEdit, dsInsert] then
    dsRequest.Cancel;
  Close;
end;

procedure TRequestForm.OkCancelFramebbOkClick(Sender: TObject);
var
  AllFine: Boolean;
  NeedCheckLinkedReq: Boolean;
  s: String;
begin
  // права пользователей
  // if dsRequest.FieldByName('RQ_CUSTOMER').ISNull then  btnFind.OnClick(sender);
  AllFine := False;
  // проверим. открывать ли связную заявку
  NeedCheckLinkedReq := False;
  if ((fEditMode in [0, 1]) and (srcRequest.DataSet.State in [dsInsert, dsEdit])) then
  begin
    try
      if FFullAccess or FCanCreate or FCanEdit or FCanClose or FCanGive or FCanCloseDay or FCanUnclose then
      begin
        if FFullAccess then
          AllFine := true
        else
        begin
          if ((dsRequest.FieldByName('REQ_RESULT').IsNull) and (dsRequest.FieldByName('RQ_EXEC_TIME').IsNull)) then
            AllFine := true
          else
          begin
            if (not dsRequest.FieldByName('RQ_EXEC_TIME').IsNull) then
            begin
              if ((deEndExecDateTime.Value >= Date()) and FCanCloseDay) then
                AllFine := true
              else if ((deEndExecDateTime.Value >= dmMain.CurrentMonth) and FCanClose) then
                AllFine := true;
            end
            else
              AllFine := true;
          end;
        end;

        NeedCheckLinkedReq := AllFine and (not dsRequest.FieldByName('RQ_EXEC_TIME').IsNull);

        if AllFine then
          AllFine := CheckExecutor;

        if AllFine then
        begin
          // сохраним в заявке телефон, если введен руками
          s := edPhone.Text.Trim;
          if ((FCustomerInfo.CUSTOMER_ID = -1) or (s <> Trim(FCustomerInfo.mobile + ',' + FCustomerInfo.PHONE_NO))) then
          begin
            if NOT s.IsEmpty then
              srcRequest.DataSet.FieldByName('PHONE').AsString := LeftStr(s, 50)
            else
              srcRequest.DataSet.FieldByName('PHONE').Clear;
          end;
          srcRequest.DataSet.Post
        end
        else
        begin
          ModalResult := mrNone;
          Exit;
        end;
      end
      else
        srcRequest.DataSet.Cancel;

      if NeedCheckLinkedReq and HasLinkedReq(true) and
        (MessageDlg(rsRequestOpenLinked, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        OpenLinkedReq();

      Close;
    except
      on E: Exception do
      begin
        s := #13 + #10 + E.ClassName + #13 + #10 + E.Message;
        ShowMessage(rsErrorSave + #13 + #10 + s);
      end
      else
        s := '';
      ModalResult := mrNone;
    end;
  end;
end;

procedure TRequestForm.CheckData;
var
  b: Boolean;
begin
  b := true;
  b := b and (not VarIsNull(luType.Value));
  b := b and (not VarIsNull(LupHOUSE.Value));
  if b then
    FindNearFreeDay;
  btnSelectDate.Enabled := b;
  OkCancelFrame.bbOk.Enabled := b and (FCanCreate or FCanEdit or FCanClose or FCanCloseDay or FCanGive or FFullAccess);
end;

procedure TRequestForm.dbDateChange(Sender: TObject);
begin
  CheckData;
end;

procedure TRequestForm.dbgWorkersDblClick(Sender: TObject);
begin
  if actExecutors.Enabled then
    actExecutors.Execute;
end;

procedure TRequestForm.edLicevoyExit(Sender: TObject);
begin
  if edLicevoy.Text <> '' then
  begin
    if FindCustomer(edLicevoy.Text, '', -1) >= 0 then
    begin
      if tabRequest.Enabled then
        mmoNotice.SetFocus;
    end
    else
      LupStreets.SetFocus;
    edCode.Text := '';
  end;
end;

procedure TRequestForm.edPhoneChange(Sender: TObject);
begin
  FPhoneSaved := False;
end;

procedure TRequestForm.edPhoneExit(Sender: TObject);
var
  Phone: string;
begin
  Phone := Trim(edPhone.Text);

  if FPhoneSaved or Phone.IsEmpty or (FCustomerInfo.CUSTOMER_ID = -1) then
    Exit;

  if (Phone = Trim(FCustomerInfo.mobile + ',' + FCustomerInfo.PHONE_NO)) then
  begin
    FPhoneSaved := true;
    Exit;
  end;

  if (Pos(edPhone.Text, FCustomerInfo.mobile + ',' + FCustomerInfo.PHONE_NO) <> 0) then
  begin
    FPhoneSaved := true;
    Exit;
  end;

  edPhone.Text := SavePhone(Phone);
  FPhoneSaved := true;
end;

function TRequestForm.SavePhone(Const Phone: String): String;
var
  Contact: TContact;
begin
  Contact.cID := 999;
  Contact.Contact := Trim(Phone);
  Contact.Notify := 1;
  Contact.Notice := '';
  Contact.CustID := -1;
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
        ParamByName('Customer_Id').AsInteger := FCustomerInfo.CUSTOMER_ID;
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

procedure TRequestForm.edExExecutorsExit(Sender: TObject);
begin
  if (not dsExecutor.EOF) or (edExExecutors.Text <> '') then
  begin
    if VarIsNull(deStartExecDateTime.Value) then
    begin
      deStartExecDateTime.Value := NOW;
      // deStartExecTime.Value := time;
    end;
    dsRequest['REQ_RESULT'] := 1; // признак того что выдана
  end;
end;

procedure TRequestForm.edCodeExit(Sender: TObject);
begin
  if edCode.Text <> '' then
  begin
    if FindCustomer('', edCode.Text, -1) >= 0 then
    begin
      if tabRequest.Enabled then
        mmoNotice.SetFocus
    end
    else
      LupStreets.SetFocus;
    edLicevoy.Text := '';
  end;
end;

procedure TRequestForm.EdFloorExit(Sender: TObject);
var
  s: string;
  NeedSave: Boolean;
begin
  NeedSave := False;

  if (EdFloor.Text <> '') and (EdPorch.Text <> '') and (edFLAT_NO.Text <> '') then
  begin
    if (FCustomerInfo.CUSTOMER_ID > -1) then
    begin
      if (EdPorch.Text <> FCustomerInfo.porch_n) or (EdFloor.Text <> FCustomerInfo.floor_n) then
        s := Format(rsRequestPorchFloor, [EdPorch.Text, EdFloor.Text]);
      NeedSave := (Application.MessageBox(PWideChar(s), PWideChar(rsSavePorchFloor),
        MB_YESNO + MB_ICONQUESTION) = IDYES);
    end
    else
      NeedSave := true;
  end;

  if (Trim(edFLAT_NO.Text) <> '') and (Trim(EdPorch.Text) <> '') and (Trim(EdFloor.Text) <> '') and NeedSave then
  begin
    with TpFIBQuery.Create(Nil) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text := ' UPDATE OR INSERT INTO HOUSEFLATS (house_id, flat_no, porch_n, floor_n)       ' +
          ' VALUES (:house_id, :flat_no, :porch_n, :floor_n) matching (house_id, flat_no)';
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

procedure TRequestForm.PageControlChange(Sender: TObject);
begin
  dsErrors.Active := (PageControl.ActivePage = tabRequest);
  dsExecutor.Active := (PageControl.ActivePage = tabGiveReq);
  dsWorks.Active := (PageControl.ActivePage = tabExecute);
  dsMaterials.Active := (PageControl.ActivePage = tabExecute);
  dsPhotos.Active := (PageControl.ActivePage = tabFiles);
  dsMSG.Active := (PageControl.ActivePage = tabComments);
  dsResult.Active := (PageControl.ActivePage = tabExecute);

  // переопределим горячие клавиши
  actExecutors.ShortCut := TextToShortCut('');
  actMaterials.ShortCut := TextToShortCut('');
  actWorks.ShortCut := TextToShortCut('');
  actMatIn.ShortCut := TextToShortCut('');

  if PageControl.ActivePage = tabExecute then
  begin
    actWorks.ShortCut := TextToShortCut('F5');
    actMaterials.ShortCut := TextToShortCut('F6');
    actMatIn.ShortCut := TextToShortCut('F8');
    luResult.TabStop := (dsResult.RecordCount > 0);
  end;

  if PageControl.ActivePage = tabGiveReq then
  begin
    actExecutors.ShortCut := TextToShortCut('F5');
  end;

end;

procedure TRequestForm.PageControlChanging(Sender: TObject; var AllowChange: Boolean);
begin
  if ((fEditMode in [0]) and (srcRequest.DataSet.State in [dsInsert])) and (PageControl.ActivePage = tabRequest) then
  begin
    AllowChange := False;
    if dsRequest.FieldByName('RQ_CUSTOMER').IsNull then
      btnFind.OnClick(Sender);
    if ((fEditMode in [0]) and (srcRequest.DataSet.State in [dsInsert])) then
      try
        srcRequest.DataSet.Post;
        srcRequest.DataSet.Edit;
        AllowChange := true;
      except
        ShowMessage(rsERROR_NOT_FILL_ALL);
        ModalResult := mrNone;
      end;
  end
  else
    AllowChange := true;

end;

procedure TRequestForm.PropStorageEhReadProp(Sender: TObject; Reader: TPropReaderEh; const PropName: string;
  var Processed: Boolean);
begin
  if PropName = '111' then

    SetGridsHeight;
end;

procedure TRequestForm.DBGridEhTemplateDblClick(Sender: TObject);
begin
  Button2Click(Sender);
end;

procedure TRequestForm.deEndExecDateTimeUpdateData(Sender: TObject; var Handled: Boolean);
begin

  if dsRequest.FieldByName('REQ_RESULT').IsNull then
    dsRequest['REQ_RESULT'] := 2;

end;

procedure TRequestForm.deEndExecDateTimeEnter(Sender: TObject);
begin
  if dsRequest.FieldByName('RQ_EXEC_TIME').IsNull then
  begin
    deEndExecDateTime.Value := NOW;
    // deEndExecTime.Value := time;
  end;
end;

procedure TRequestForm.dbMemDefectChange(Sender: TObject);
begin
  if FCanClose or FFullAccess then
    if dsRequest.FieldByName('RQ_EXEC_TIME').IsNull then
    begin
      deEndExecDateTime.Value := NOW;
      // deEndExecTime.Value := time;
    end;
end;

procedure TRequestForm.dbtParentDblClick(Sender: TObject);
begin
  OpenLinkedReq();
end;

procedure TRequestForm.dbtxtCHILD_INFODblClick(Sender: TObject);
begin
  OpenLinkedReq();
end;

procedure TRequestForm.FindNearFreeDay;
begin
  if (dsRequest.State = dsInsert) then
  begin
    with TpFIBQuery.Create(Nil) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        SQL.Text := 'select FREE_DAY from GET_REQUEST_FREEDAY(:HOUSE_ID, :REQUEST_TYPE)';
        ParamByName('HOUSE_ID').AsInteger := LupHOUSE.Value;
        ParamByName('REQUEST_TYPE').AsInteger := luType.Value;
        Transaction.StartTransaction;
        ExecQuery;
        if not EOF then
          dsRequest['rq_plan_date'] := FieldByName('FREE_DAY').AsDate;
        Close;
        Transaction.Commit;
      finally
        Free;
      end;
  end;
end;

procedure TRequestForm.InitSecurity;
var
  NotClosed: Boolean;
  CloseDay: TDate;
  varBool: Boolean;
begin
  NotClosed := dsRequest.FieldByName('REQ_RESULT').IsNull;
  if not NotClosed then
  begin
    NotClosed := (not dsRequest.FieldByName('RQ_EXEC_TIME').IsNull);
    NotClosed := not(NotClosed and (dsRequest.FieldByName('REQ_RESULT').AsInteger >= 2));
  end;

  CloseDay := Yesterday;
  if (not NotClosed) and (not dsRequest.FieldByName('RQ_EXEC_TIME').IsNull) then
    CloseDay := dsRequest['RQ_EXEC_TIME'];

  FFullAccess := dmMain.AllowedAction(rght_Request_full);
  FCanEdit := dmMain.AllowedAction(rght_Request_edit);
  FCanClose := dmMain.AllowedAction(rght_Request_Close);
  FCanCloseDay := dmMain.AllowedAction(rght_Request_Close_Day);
  FCanGive := dmMain.AllowedAction(rght_Request_Give);
  FCanCreate := dmMain.AllowedAction(rght_Request_add);
  FCanUnclose := dmMain.AllowedAction(rght_Request_Unclose);

  pnlRequestHead.Enabled := ((FCanEdit or FCanCreate) and NotClosed) or FFullAccess; // запретим править заголовок
  tabRequest.Enabled := ((FCanEdit or FCanCreate) and NotClosed) or FFullAccess;
  tabGiveReq.Enabled := (FCanGive and NotClosed) or FFullAccess;

  varBool := ((FCanClose or FCanCloseDay) and NotClosed) or ((not NotClosed) and FCanUnclose) or FFullAccess;
  // вместо tabExecute.Enabled := CanEditClosed;
  // заблокируем по частям
  pnlExecTime.Enabled := varBool;
  pnlWMbuttons.Enabled := varBool;
  dbgWorks.ReadOnly := not varBool;
  dbgMaterials.ReadOnly := not varBool;

  varBool := (FCanGive and NotClosed) or FFullAccess;
  pnlGiveTime.Enabled := varBool;
  actExecutors.Enabled := varBool;
  actSMS.Enabled := (FCanGive and NotClosed) or varBool;
  dbgWorkers.ReadOnly := not varBool;

  actMaterials.Enabled := ((FCanClose or FCanCloseDay) and NotClosed) or FFullAccess;
  miDelMat.Enabled := actMaterials.Enabled;
  actWorks.Enabled := ((FCanClose or FCanCloseDay) and NotClosed) or FFullAccess;
  miDelWork.Enabled := actWorks.Enabled;
  actMatIn.Enabled := ((FCanClose or FCanCloseDay) and NotClosed) or FFullAccess;

  OkCancelFrame.bbOk.Enabled := ((FCanCreate or FCanEdit or FCanCloseDay or FCanClose or FCanGive) and NotClosed) or
    ((not NotClosed) and FCanUnclose) or FFullAccess;

  pnlGiveTime.Enabled := (FCanGive and NotClosed) or FFullAccess;

  cbResultExec.Enabled := ((FCanClose or FCanCloseDay) and NotClosed) or ((not NotClosed) and FCanUnclose) or
    FFullAccess;
  dbMemDefect.Enabled := ((FCanClose or FCanCloseDay) and NotClosed) or ((not NotClosed) and FCanUnclose) or
    FFullAccess;

  if (not cbResultExec.Enabled) and (dmMain.GetSettingsValue('BIDEDITNOTICE') = '1') then
  begin
    // дадим править текст результата если заявка закрыта сегодня
    dbMemDefect.Enabled := (CloseDay >= Today) and (FCanClose or FCanCloseDay);
    // tabExecute.Enabled := dbMemDefect.Enabled;
    OkCancelFrame.bbOk.Enabled := dbMemDefect.Enabled;
  end;

  pnlExecTime.Enabled := ((FCanClose or FCanCloseDay) and NotClosed) or ((not NotClosed) and FCanUnclose) or
    FFullAccess;

  deEndExecDateTime.Enabled := ((FCanClose or FCanCloseDay) and NotClosed) or ((not NotClosed) and FCanUnclose) or
    FFullAccess;

  // Запретим выбор даты вручную
  PLANDATE.ReadOnly := not(FFullAccess or (dmMain.AllowedAction(rght_Request_DateChange) and NotClosed));

  deEndExecDateTime.ReadOnly := not(((FCanClose or FCanCloseDay) and NotClosed) or FCanUnclose or FFullAccess);
  cbResultExec.ReadOnly := not(((FCanClose or FCanCloseDay) and NotClosed) or FCanUnclose or FFullAccess);
  luResult.ReadOnly := not(((FCanClose or FCanCloseDay) and NotClosed) or FCanUnclose or FFullAccess);

  FDisableAddressEdit := (dmMain.GetSettingsValue('EX_ADDRESS_EDIT') = '1');
  actExAddressEdit.Enabled := FDisableAddressEdit;
  actExAddressEdit.Visible := FDisableAddressEdit;
  SetExAddressEdit(FDisableAddressEdit);

  FNeedExecutor := (dmMain.GetSettingsValue('WH_REQ_EXECUTOR') = '1');
end;

procedure TRequestForm.LupHOUSEChange(Sender: TObject);
begin
  CheckData;
  dsRequestType.Close;
  dsRequestType.ParamByName('RT_ID').AsInteger := dsRequest['RQ_TYPE'];
  dsRequestType.ParamByName('house_ID').AsInteger := dsRequest['house_ID'];
  dsRequestType.Open;
  dsErrors.Active := (PageControl.ActivePage = tabRequest);
end;

procedure TRequestForm.ShowAddInfo;
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
  cbbAdd.Items.Delimiter := ';';
  cbbAdd.Items.DelimitedText := s;
  pnlAddInfo.Visible := cbbAdd.Items.Count > 0;
end;

procedure TRequestForm.srcRequestDataChange(Sender: TObject; Field: TField);
begin
  dbtParent.Visible := not(dsRequest.FieldByName('PARENT_INFO').IsNull);
  dbtxtCHILD_INFO.Visible := not(dsRequest.FieldByName('CHILD_ID').IsNull);
end;

procedure TRequestForm.actPrintExecute(Sender: TObject);
var
  ri: Integer;
  Stream: TStream;
begin
  if dsRequest.FieldByName('REPORT').IsNull then
    Exit;
  if dsRequest['REPORT'] = '' then
    Exit;

  ri := dmMain.GET_ID_REPORT_BY_PATH(dsRequest['REPORT']);
  if ri >= 0 then
  begin
    try
      dmMain.fdsLoadReport.ParamByName('ID_REPORT').Value := ri;
      dmMain.fdsLoadReport.Open;
      if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').Value <> null then
      begin
        Stream := TMemoryStream.Create;
        try
          TBlobField(dmMain.fdsLoadReport.FieldByName('REPORT_BODY')).SaveToStream(Stream);
          Stream.Position := 0;
          frxReport.LoadFromStream(Stream);
          frxReport.FileName := dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString;
          Caption := frxReport.FileName;
        finally
          Stream.Free;
        end;
      end;
    finally
      dmMain.fdsLoadReport.Close;
    end;

    ri := frxReport.Variables.IndexOf('REQUEST');
    if ri > 0 then
      frxReport.Variables['REQUEST'] := dsRequest['RQ_ID'];

    frxReport.ShowReport(true);
  end;

end;

procedure TRequestForm.actMatInExecute(Sender: TObject);
begin
  ReqMaterialsReturn(dsRequest['RQ_ID'], 1);
  dsMaterials.CloseOpen(true);
end;

procedure TRequestForm.actMSGAddExecute(Sender: TObject);
begin
  NewMSG;
end;

procedure TRequestForm.actMSGDelExecute(Sender: TObject);
begin
  if dsMSG.RecordCount = 0 then
    Exit;

  if Application.MessageBox(PWideChar(Format(rsDeleteRecord, [dsMSG.FieldByName('TEXT').AsString])),
    PWideChar(rsWarning), MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK then
  begin
    dsMSG.DElete;
  end;
end;

procedure TRequestForm.dsWorksAfterOpen(DataSet: TDataSet);
begin
  SetGridsHeight;
end;

procedure TRequestForm.dsMaterialsAfterOpen(DataSet: TDataSet);
begin
  SetGridsHeight;
end;

procedure TRequestForm.dsRequestAfterOpen(DataSet: TDataSet);
begin
  if (not dsRequest.FieldByName('PHONE').IsNull) then
    edPhone.Text := dsRequest['PHONE'];
  FPhoneSaved := true;
end;

procedure TRequestForm.SetGridsHeight;
begin
  dbgWorks.Visible := (dsWorks.RecordCount > 0);
  dbgMaterials.Visible := (dsMaterials.RecordCount > 0);
  splGrids.Visible := ((dsMaterials.RecordCount > 0) and (dsWorks.RecordCount > 0));

  if (dsMaterials.RecordCount > 0) or (dsWorks.RecordCount > 0) then
  begin
    pnlWMbuttons.Width := 100;
    dbgWorks.Height := Round(pnlGrids.Height * dsWorks.RecordCount / (dsMaterials.RecordCount + dsWorks.RecordCount));
  end
  else
  begin
    pnlWMbuttons.Width := pnlWM.Width;
    pnlNotice.Height := tabExecute.Height - (pnlWM.Top + btnMatIn.Top + btnMatIn.Height + 10);
  end;
end;

procedure TRequestForm.actSMSExecute(Sender: TObject);
begin
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'execute procedure Request_Send_Sms(:Request_Id, null)';
      ParamByName('Request_Id').AsInteger := dsRequest['RQ_ID'];
      Transaction.StartTransaction;
      ExecQuery;
      Close;
      Transaction.Commit;
      FPhoneSaved := true;
    finally
      Free;
    end;
end;

procedure TRequestForm.actExAddressEditExecute(Sender: TObject);
begin
  if not actExAddressEdit.Enabled then
    Exit;

  FDisableAddressEdit := not FDisableAddressEdit;
  SetExAddressEdit(FDisableAddressEdit);
end;

procedure TRequestForm.SetExAddressEdit(const DisableEdit: Boolean = False);
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

procedure TRequestForm.FormResize(Sender: TObject);
begin
  SetGridsHeight;
end;

function TRequestForm.frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
begin
  Result := dmMain.frxReportUserFunction(MethodName, Params);
end;

procedure TRequestForm.imgJPGDblClick(Sender: TObject);
var
  FileName: string;
begin
  if dsPhotos.FieldByName('ID').IsNull or dsPhotos.FieldByName('jpg').IsNull then
    Exit;

  FileName := GetTempDir + 'A4on\';
  if not DirectoryExists(FileName) then
    CreateDir(FileName);
  FileName := FileName + IntToStr(dsPhotos['RQ_ID']) + '_' + IntToStr(dsPhotos['ID']) + '.jpg';
  TBlobField(dsPhotos.FieldByName('jpg')).SaveToFile(FileName);
  ShellExecute(Handle, 'open', PWideChar(FileName), nil, nil, SW_SHOWNORMAL);
end;

procedure TRequestForm.NewMSG;
begin
  srcMSG.AutoEdit := true;
  mmoComment.DataField := '';
  mmoComment.DataSource := nil;
  pnlMSGButton.Visible := true;
  mmoComment.SetFocus;
end;

procedure TRequestForm.SaveMSG;
var
  s: String;
begin
  s := Trim(mmoComment.Lines.Text);
  if (not s.IsEmpty) then
  begin
    dsMSG.Insert;
    dsMSG['RQ_ID'] := dsRequest['RQ_ID'];
    dsMSG['Text'] := s;
    dsMSG.Post;
    dsMSG.CloseOpen(true);
  end;
  CancelMSG;
end;

procedure TRequestForm.CancelMSG;
begin
  srcMSG.AutoEdit := False;
  mmoComment.DataSource := srcMSG;
  mmoComment.DataField := 'TEXT';
  pnlMSGButton.Visible := False;
end;

procedure TRequestForm.cbResultExecChange(Sender: TObject);
begin
  CheckExecutor;
end;

function TRequestForm.CheckExecutor: Boolean;
var
  a: Boolean;
  c: Integer;
begin
  Result := true;
  if (not(srcRequest.DataSet.State in [dsInsert, dsEdit])) then
    Exit;
  if (dsRequest.FieldByName('REQ_RESULT').IsNull) then
    Exit;

  if FNeedExecutor and VarIsNumeric(cbResultExec.Value) and (cbResultExec.Value = 2) then
  begin
    a := dsExecutor.Active;
    if not a then
      dsExecutor.Open;
    c := dsExecutor.RecordCount;
    if not a then
      dsExecutor.Close;
    Result := (c > 0);
    if c = 0 then
    begin
      cnError.SetError(OkCancelFrame.bbOk, rsNeedBidExecutor, iaMiddleLeft, bsNeverBlink);
    end
    else
      cnError.Dispose(OkCancelFrame.bbOk);
  end;
end;

// если есть связная заявка откроем ее
procedure TRequestForm.OpenLinkedReq();
var
  aRequest: Integer;
  aNodeId: Integer;
  aCustomer: Integer;
begin
  if (not dsRequest.FieldByName('CHILD_RQ_ID').IsNull) then
  begin
    aRequest := dsRequest.FieldByName('CHILD_RQ_ID').AsInteger;

    if dsRequest.FieldByName('CHILD_ID').IsNull then
      aNodeId := -1
    else
      aNodeId := dsRequest['CHILD_ID'];

    ReguestNodeExecute(aRequest, aNodeId, 1);
  end
  else if (not dsRequest.FieldByName('Parent_Rq').IsNull) then
  begin
    aRequest := dsRequest.FieldByName('Parent_Rq').AsInteger;

    if dsRequest.FieldByName('PARENT_CUSTOMER').IsNull then
      aCustomer := -1
    else
      aCustomer := dsRequest['PARENT_CUSTOMER'];

    ReguestExecute(aRequest, aCustomer, 1);
  end;
end;

function TRequestForm.HasLinkedReq(const OnlyClosed: Boolean = False): Boolean;
var
  aRequest: Integer;
begin
  Result := (not dsRequest.FieldByName('CHILD_RQ_ID').IsNull) or (not dsRequest.FieldByName('Parent_Rq').IsNull);
  if (Result and OnlyClosed) then
  begin
    aRequest := -1;
    if (not dsRequest.FieldByName('CHILD_RQ_ID').IsNull) then
      aRequest := dsRequest.FieldByName('CHILD_RQ_ID').AsInteger
    else if (not dsRequest.FieldByName('Parent_Rq').IsNull) then
      aRequest := dsRequest.FieldByName('Parent_Rq').AsInteger;

    with TpFIBQuery.Create(Nil) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        SQL.Text := 'select RQ_EXEC_TIME from request where Rq_Id = :RQ_ID';
        ParamByName('RQ_ID').AsInteger := aRequest;
        Transaction.StartTransaction;
        ExecQuery;
        Result := FieldByName('RQ_EXEC_TIME').IsNull;
        Close;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  end;
end;

end.
