unit EquipmentForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, ActnList, DB, ComCtrls, ToolWin, Grids, DBGridEh,
  ExtCtrls, FIBDataSet, pFIBDataSet, StdCtrls, DBCtrls, DBCtrlsEh, Mask,
  DBLookupEh, RxPlacemnt, EhLibFIB, EhLibMTE, FIBQuery, Menus, DBGridEhImpExp,
  GridsEh, Buttons, MemTableDataEh, DataDriverEh, DynVarsEh,
  pFIBDataDriverEh, MemTableEh, ToolCtrlsEh, DBGridEhToolCtrls,
  DBAxisGridsEh, System.Actions, CnErrorProvider, PrjConst,
  EhLibVCL, System.UITypes, DBGridEhGrouping, A4onTypeUnit;

type
  TEquipmentForm = class(TGridForm)
    dsEquipments: TpFIBDataSet;
    pnlInfo: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl1: TLabel;
    Label6: TLabel;
    srcAttributes: TDataSource;
    dsAttributes: TpFIBDataSet;
    srcEC: TDataSource;
    dsEC: TpFIBDataSet;
    actCoverAdd: TAction;
    actCoverEdit: TAction;
    actCoverDelete: TAction;
    cbTypeEQ: TDBComboBoxEh;
    lbl4: TLabel;
    srcVLANS: TDataSource;
    dsVlans: TpFIBDataSet;
    dsCustomers: TpFIBDataSet;
    srcCustomer: TDataSource;
    Splitter1: TSplitter;
    Label8: TLabel;
    dsRequests: TpFIBDataSet;
    srcRequests: TDataSource;
    frmStore: TFormStorage;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    dbtxtNAME: TDBText;
    dbtxtdbedt1: TDBText;
    dbtxtDBEdit1: TDBText;
    dbtxtDBEdit2: TDBText;
    dbtxtHOUSE: TDBText;
    dbtxtSTREET: TDBText;
    mtEQ: TMemTableEh;
    drvEQ: TpFIBDataDriverEh;
    N4: TMenuItem;
    telnet1: TMenuItem;
    actAtrADD: TAction;
    actAtrEdit: TAction;
    actAtrDel: TAction;
    pnlChkTree: TPanel;
    chkTREE: TCheckBox;
    miTreeBreak: TMenuItem;
    miTreeCollapse: TMenuItem;
    miTreeExpand: TMenuItem;
    actNewChild: TAction;
    miNewChild: TMenuItem;
    pnlMemo: TPanel;
    memNotice: TDBMemoEh;
    Label11: TLabel;
    pnlI2: TPanel;
    pnlGrids: TPanel;
    pgcEquipment: TPageControl;
    tsInfo: TTabSheet;
    dbgAtr: TDBGridEh;
    tbAttributes: TToolBar;
    bbAddAtr: TToolButton;
    bbEditAtr: TToolButton;
    bbDelAtr: TToolButton;
    tsHouses: TTabSheet;
    dbgHouses: TDBGridEh;
    tlbZO: TToolBar;
    btnCoverAdd: TToolButton;
    btnCoverEdit: TToolButton;
    tsAbonents: TTabSheet;
    dbgCustomer: TDBGridEh;
    tsRequests: TTabSheet;
    Panel5: TPanel;
    dbGridCustReq: TDBGridEh;
    pnlTabs: TPanel;
    pgcTypeInfo: TPageControl;
    tsLan: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    lbl3: TLabel;
    Label9: TLabel;
    lbl2: TLabel;
    eMAC: TDBEditEh;
    eIP: TDBEditEh;
    DBEditEh4: TDBEditEh;
    clb1: TDBLookupComboboxEh;
    edtGroup: TDBEditEh;
    edtIP: TDBEditEh;
    tsTV: TTabSheet;
    lbl7: TLabel;
    lbl9: TLabel;
    lbl8: TLabel;
    dbckActive: TDBCheckBoxEh;
    cbbLine: TDBComboBoxEh;
    edSIN: TDBNumberEditEh;
    edSOUT: TDBNumberEditEh;
    tsOther: TTabSheet;
    Splitter2: TSplitter;
    tlbCustomers: TToolBar;
    btnCustomer: TToolButton;
    actFindCustomer: TAction;
    btn1: TToolButton;
    chkGroup: TCheckBox;
    btnCMD: TButton;
    pmLanPopUp: TPopupMenu;
    actlstLAN: TActionList;
    ActLanPing: TAction;
    actLanTelnet: TAction;
    actLanHttp: TAction;
    actParentPing: TAction;
    actParentTelnet: TAction;
    actParentWeb: TAction;
    btnRefresh: TToolButton;
    btn2: TToolButton;
    btn3: TToolButton;
    actEditCustLan: TAction;
    pmCustomerLanPopUp: TPopupMenu;
    btn4: TToolButton;
    btn5: TToolButton;
    actCustPing: TAction;
    actCustTelnet: TAction;
    actCustHttp: TAction;
    actClone: TAction;
    N5: TMenuItem;
    btnCoverDelete: TToolButton;
    procedure tbCancelClick(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel2Resize(Sender: TObject);
    procedure dsEquipmentsAfterOpen(DataSet: TDataSet);
    procedure dsEquipmentsBeforeClose(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure actCoverAddExecute(Sender: TObject);
    procedure actCoverEditExecute(Sender: TObject);
    procedure actCoverDeleteExecute(Sender: TObject);
    procedure pgcEquipmentChange(Sender: TObject);
    procedure dbgCustomerGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure dbGridCustReqDblClick(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure pmgCopyClick(Sender: TObject);
    procedure pmgSelectAllClick(Sender: TObject);
    procedure pmgSaveSelectionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkTREEClick(Sender: TObject);
    procedure dbGridSortMarkingChanged(Sender: TObject);
    procedure telnet1Click(Sender: TObject);
    procedure actAtrADDExecute(Sender: TObject);
    procedure actAtrEditExecute(Sender: TObject);
    procedure actAtrDelExecute(Sender: TObject);
    procedure srcAttributesDataChange(Sender: TObject; Field: TField);
    procedure srcECDataChange(Sender: TObject; Field: TField);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure miTreeCollapseClick(Sender: TObject);
    procedure miTreeExpandClick(Sender: TObject);
    procedure actNewChildExecute(Sender: TObject);
    procedure memNoticeExit(Sender: TObject);
    procedure memNoticeChange(Sender: TObject);
    procedure actFindCustomerExecute(Sender: TObject);
    procedure chkGroupClick(Sender: TObject);
    procedure btnCMDClick(Sender: TObject);
    procedure ActLanPingExecute(Sender: TObject);
    procedure actLanTelnetExecute(Sender: TObject);
    procedure actParentPingExecute(Sender: TObject);
    procedure actParentTelnetExecute(Sender: TObject);
    procedure actLanHttpExecute(Sender: TObject);
    procedure actParentWebExecute(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure actEditCustLanExecute(Sender: TObject);
    procedure dbgCustomerDblClick(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure dbgCustomerMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure actCustPingExecute(Sender: TObject);
    procedure actCustTelnetExecute(Sender: TObject);
    procedure actCustHttpExecute(Sender: TObject);
    procedure actCloneExecute(Sender: TObject);
    procedure dbGridColumns10GetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
  private
    { Private declarations }
    FUpdatetNotice: Boolean;
    FCanSave: Boolean;
    procedure GenerateLANPopUp;
    procedure miLanGroupCMDClick(Sender: TObject);
    function GetCustomerInfo: TCustomerInfo;
    procedure GenerateCustomerLANPopUp;
    procedure miCustomerLanClick(Sender: TObject);
    procedure SetGridTreeMode(const inTree: Boolean);
  public
    { Public declarations }
  end;

var
  EquipmentForm: TEquipmentForm;

implementation

uses DM, MAIN, AtrCommon, AtrStrUtils, EquipAttributesForma, EquipCoverage, StrUtils,
  atrCmdUtils, RequestForma, EquipEditForma, TelnetForma, HtmlForma,
  pFIBQuery, CF, CustomerLanForma;

{$R *.dfm}

procedure TEquipmentForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if FCanSave then
    dbGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbGrdEqpmnt', true);

  if chkTREE.Checked then
    dmMain.SetIniValue('EQUIPMENTASTREE', '1')
  else
    dmMain.SetIniValue('EQUIPMENTASTREE', '0');

  srcDataSource.DataSet.Close;
  EquipmentForm := nil;
end;

procedure TEquipmentForm.FormCreate(Sender: TObject);
begin
  inherited;
  frmStore.IniFileName := A4MainForm.GetIniFileName;
  FCanSave := true;
end;

procedure TEquipmentForm.actAtrADDExecute(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    exit;
  if EditAttribute(srcDataSource.DataSet['EID'], srcDataSource.DataSet['EQ_TYPE'], -1) then
  begin
    dsAttributes.Close;
    dsAttributes.OPen;
  end;
end;

procedure TEquipmentForm.actAtrDelExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if (dsAttributes.RecordCount = 0) then
    exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    exit;

  if not(dsAttributes.FieldByName('O_NAME').IsNull) then
    s := dsAttributes['O_NAME']
  else
    s := '';

  if (MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dsAttributes.Delete;
end;

procedure TEquipmentForm.actAtrEditExecute(Sender: TObject);
begin
  inherited;
  if (dsAttributes.RecordCount = 0) then
    exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    exit;
  if EditAttribute(srcDataSource.DataSet['EID'], srcDataSource.DataSet['EQ_TYPE'], dsAttributes['O_ID']) then
  begin
    dsAttributes.Close;
    dsAttributes.OPen;
  end;
end;

procedure TEquipmentForm.actCloneExecute(Sender: TObject);
var
  ci: TCustomerInfo;
  id: Integer;
begin
  inherited;
  if (dsEquipments.RecordCount = 0) then
    exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    exit;
  ci.CUSTOMER_ID := -1;

  id := CloneEquipment(dbGrid.DataSource.DataSet['EID']);
  if id <> -1 then
  begin
    srcDataSource.DataSet.Close;
    srcDataSource.DataSet.OPen;
    srcDataSource.DataSet.Locate('EID', id, []);
  end;
end;

procedure TEquipmentForm.actCoverAddExecute(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    exit;
  if EditEQCoverage(srcDataSource.DataSet['EID'], -1) then
  begin
    dsEC.Close;
    dsEC.OPen;
  end;
end;

procedure TEquipmentForm.actCoverDeleteExecute(Sender: TObject);
var
  cnt: Integer;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    exit;

  if dsEC.RecordCount = 0 then
    exit;

  if (dsEC.FieldByName('eid').IsNull) or (dsEC.FieldByName('HOUSE_ID').IsNull) then
    exit;

  cnt := 0;
  try
    with dmMain.qRead do
    begin
      sql.Clear;
      sql.Add('select count(*) CNT');
      sql.Add('from equipment_coverage ec');
      sql.Add('inner join Tv_Lan l on (l.Eq_Id = ec.Eid)');
      sql.Add('inner join customer c on (l.Customer_Id = c.Customer_Id)');
      sql.Add('where ec.eid = :eid  and c.HOUSE_ID = :House_ID');
      ParamByName('EID').AsInteger := dsEC.FieldByName('eid').AsInteger;
      ParamByName('HOUSE_ID').AsInteger := dsEC.FieldByName('HOUSE_ID').AsInteger;
      Transaction.StartTransaction;
      ExecQuery;
      if (not Eof) and (not FieldByName('CNT').IsNull) then
        cnt := FieldByName('CNT').AsInteger;
      Close;
      Transaction.Rollback;
    end;
  except
    cnt := 0;
  end;

  if (cnt = 0) and (Application.MessageBox(PWideChar(rsHouseInService), PWideChar(rsWarning),
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES) then
  begin
    if (MessageDlg(rsDeleteHouseZone, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      dsEC.Delete;
  end;

end;

procedure TEquipmentForm.actCoverEditExecute(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    exit;
  if EditEQCoverage(srcDataSource.DataSet['EID'], dsEC['HOUSE_ID']) then
  begin
    dsEC.Close;
    dsEC.OPen;
  end;
end;

procedure TEquipmentForm.actCustHttpExecute(Sender: TObject);
var
  s: string;
begin
  if (dsCustomers.RecordCount = 0) then
    exit;
  if (dsCustomers.FieldByName('IP').IsNull) then
    exit;

  s := 'http://' + dsCustomers.FieldByName('IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', s, '', '', SW_SHOW);
end;

procedure TEquipmentForm.actCustPingExecute(Sender: TObject);
var
  s: String;
begin
  inherited;
  if (dsCustomers.RecordCount = 0) then
    exit;
  if (dsCustomers.FieldByName('IP').IsNull) then
    exit;

  s := dsCustomers.FieldByName('IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', 'cmd', '/K ping ' + s + ' -t', '', SW_SHOW)
end;

procedure TEquipmentForm.actCustTelnetExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if (dsCustomers.RecordCount = 0) then
    exit;
  if (dsCustomers.FieldByName('IP').IsNull) then
    exit;

  s := dsCustomers.FieldByName('IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', 'telnet', s, '', SW_SHOW);
end;

procedure TEquipmentForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    exit;
  if (MessageDlg(rsDeleteSelectedRecords, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dbGrid.DataSource.DataSet.Delete;
end;

procedure TEquipmentForm.actNewExecute(Sender: TObject);
var
  ci: TCustomerInfo;
  id: Integer;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    exit;
  ci.CUSTOMER_ID := -1;

  id := EditEquipment(-1, ci, -1);
  if id <> -1 then
  begin
    srcDataSource.DataSet.Close;
    srcDataSource.DataSet.OPen;
    srcDataSource.DataSet.Locate('EID', id, []);
  end;

end;

procedure TEquipmentForm.actParentPingExecute(Sender: TObject);
var
  s: string;
begin
  if (srcDataSource.DataSet.FieldByName('Parent_Id').IsNull) then
    exit;

  with dmMain.qRead do
  begin
    sql.Clear;
    sql.Add('SELECT E.Ip FROM EQUIPMENT E where e.Eid = :EID');
    ParamByName('EID').AsInteger := srcDataSource.DataSet.FieldByName('Parent_Id').AsInteger;
    Transaction.StartTransaction;
    ExecQuery;
    if (not Eof) and (not FieldByName('Ip').IsNull) then
      s := FieldByName('Ip').asString;
    Close;
    Transaction.Rollback;
  end;

  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', 'cmd', '/K ping ' + s + ' -t', '', SW_SHOW)
end;

procedure TEquipmentForm.actParentTelnetExecute(Sender: TObject);
var
  s: string;
begin
  if (srcDataSource.DataSet.FieldByName('Parent_Id').IsNull) then
    exit;

  with dmMain.qRead do
  begin
    sql.Clear;
    sql.Add('SELECT E.Ip FROM EQUIPMENT E where e.Eid = :EID');
    ParamByName('EID').AsInteger := srcDataSource.DataSet.FieldByName('Parent_Id').AsInteger;
    Transaction.StartTransaction;
    ExecQuery;
    if (not Eof) and (not FieldByName('Ip').IsNull) then
      s := FieldByName('Ip').asString;
    Close;
    Transaction.Rollback;
  end;

  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', 'telnet', s, '', SW_SHOW);
end;

procedure TEquipmentForm.actParentWebExecute(Sender: TObject);
var
  s: string;
begin
  if (srcDataSource.DataSet.FieldByName('Parent_Id').IsNull) then
    exit;

  with dmMain.qRead do
  begin
    sql.Clear;
    sql.Add('SELECT E.Ip FROM EQUIPMENT E where e.Eid = :EID');
    ParamByName('EID').AsInteger := srcDataSource.DataSet.FieldByName('Parent_Id').AsInteger;
    Transaction.StartTransaction;
    ExecQuery;
    if (not Eof) and (not FieldByName('Ip').IsNull) then
      s := FieldByName('Ip').asString;
    Close;
    Transaction.Rollback;
  end;
  s := 'http://' + s;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', s, '', '', SW_SHOW);
end;

procedure TEquipmentForm.SetGridTreeMode(const inTree: Boolean);
  function findInex(const FLD_NAME: string; Grid: TDBGridEh): Integer;
  var
    i: Integer;
  begin
    Result := 0;
    for i := 0 to Grid.Columns.Count - 1 do
    begin
      if UpperCase(Grid.Columns[i].FieldName) = FLD_NAME then
        Result := Grid.Columns[i].Index;
    end;
  end;

var
  id: Integer;
begin
  inherited;
  if (srcDataSource.DataSet.RecordCount >= 0) and (not srcDataSource.DataSet.FieldByName('EID').IsNull) then
    id := srcDataSource.DataSet['EID']
  else
    id := -666;

  if inTree then
  begin
    srcDataSource.DataSet := mtEQ;
    mtEQ.OPen;
    mtEQ.TreeList.Active := true;
    mtEQ.TreeList.DefaultNodeExpanded := true;
    FCanSave := False;
  end
  else
  begin
    srcDataSource.DataSet := dsEquipments;
    mtEQ.Close;
    dsEquipments.OPen;
  end;
  chkGroup.Enabled := not inTree;
  miTreeBreak.Visible := inTree;
  miTreeCollapse.Visible := inTree;
  miTreeExpand.Visible := inTree;
  if inTree then
    mtEQ.TreeList.FullCollapse;

  if id <> -666 then
  begin
    if not inTree then
      srcDataSource.DataSet.Locate('EID', id, [])
    else
      mtEQ.TreeList.Locate('EID', id, []);
  end;
  dbGrid.SetFocus;
end;

procedure TEquipmentForm.chkTREEClick(Sender: TObject);
begin
  SetGridTreeMode(chkTREE.Checked);
end;

procedure TEquipmentForm.dbgCustomerDblClick(Sender: TObject);
begin
  inherited;
  actEditCustLan.Execute;
end;

procedure TEquipmentForm.dbgCustomerGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
var
  ds: TDataSet;
begin
  inherited;
  ds := (Sender as TDBGridEh).DataSource.DataSet;

  if not ds.FieldByName('HIS_COLOR').IsNull then
    try
      Background := StringToColor(ds.FieldByName('HIS_COLOR').Value);
    except
    end;
end;

procedure TEquipmentForm.dbgCustomerMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbRight then
    GenerateCustomerLANPopUp;
end;

procedure TEquipmentForm.dbGridColumns10GetCellParams(Sender: TObject;
  EditMode: Boolean; Params: TColCellParamsEh);
begin
  inherited;
  if not Params.Text.IsEmpty then
    Params.Text := StringReplace(Params.Text, #13#10, '. ', [rfReplaceAll]);
end;

procedure TEquipmentForm.dbGridCustReqDblClick(Sender: TObject);
var
  aRequest: Integer;
  aCustomer: Integer;
  aMode: Byte;
  CE, FullAccess, CC, CG, CA: Boolean;
begin
  inherited;
  // права пользователей
  FullAccess := dmMain.AllowedAction(rght_Request_full);
  CE := dmMain.AllowedAction(rght_Request_edit);
  CC := dmMain.AllowedAction(rght_Request_Close);
  CG := dmMain.AllowedAction(rght_Request_Give);
  CA := dmMain.AllowedAction(rght_Request_add);

  if not(FullAccess or CE or CC or CG or CA) then
    exit;

  if not dsRequests.FieldByName('RQ_ID').IsNull then
  begin
    if not(FullAccess or CE or CC or CG) then
      exit;
    aMode := 1;
    aRequest := dsRequests.FieldByName('RQ_ID').AsInteger;
  end
  else
  begin
    if not(FullAccess or CA) then
      exit;
    aMode := 0;
    aRequest := -1;
  end;

  aCustomer := -1;

  ReguestExecute(aRequest, aCustomer, aMode);
  dsRequests.closeopen(true);
end;

procedure TEquipmentForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if not dbGrid.DataSource.DataSet.FieldByName('COLOR').IsNull then
    try
      Background := StringToColor(dbGrid.DataSource.DataSet.FieldByName('COLOR').Value);
    except
    end;
end;

procedure TEquipmentForm.dbGridSortMarkingChanged(Sender: TObject);
var
  cr: TCursor;
  s: string;
  i, J: Integer;
  Grid: TCustomDBGridEh;
  FIBDS: TpFIBDataSet;
  beOpened: Boolean;
  fn: string;
begin
  inherited;
  if not(Sender is TCustomDBGridEh) then
    exit;
  cr := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  try
    Grid := TCustomDBGridEh(Sender);
    if not chkTREE.Checked then
    begin
      // Работаем с Firebird
      FIBDS := TpFIBDataSet(Grid.DataSource.DataSet);
      beOpened := FIBDS.Active;
      if beOpened then
        FIBDS.Close;
      J := Grid.SortMarkedColumns.Count;
      s := ' ';
      for i := 0 to pred(J) do
      begin
        fn := AnsiUpperCase(Grid.SortMarkedColumns[i].FieldName);
        if (fn = 'ACCOUNT_NO') then
          s := s + 'C.account_no'
        else if (fn = 'STREET_NAME') then
          s := s + 'S.Street_Name||s.street_short'
        else if (fn = 'FLAT_NO') then
          s := s + 'C.Flat_No'
        else if (fn = 'HOUSE_NO') then
          s := s + 'H.HOUSE_NO '
        else if (fn = 'CUST_CODE') then
          s := s + 'C.CUST_CODE'
        else if (fn = 'IP') then
          s := s + 'E.IP_BIN'
        else
          s := s + Grid.SortMarkedColumns[i].FieldName;
        // s := s + ' COLLATE UNICODE_CI_AI ';
        if Grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
          s := s + ' desc';
        if i <> pred(J) then
          s := s + ', ';
      end;
      FIBDS.OrderClause := s;
      if beOpened then
        FIBDS.OPen;
    end
    else
    begin
      // Работаем с MemTable
      J := Grid.SortMarkedColumns.Count;
      s := ' ';
      for i := 0 to pred(J) do
      begin
        s := s + Grid.SortMarkedColumns[i].FieldName;
        // s := s + ' COLLATE UNICODE_CI_AI ';
        if Grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
          s := s + ' desc';
        if i <> pred(J) then
          s := s + ', ';
      end;
      if Trim(s) <> '' then
        mtEQ.SortOrder := s;
    end;
  finally
    Screen.Cursor := cr;
  end;

end;

procedure TEquipmentForm.dsEquipmentsAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pgcEquipmentChange(pgcEquipment);
end;

procedure TEquipmentForm.dsEquipmentsBeforeClose(DataSet: TDataSet);
begin
  inherited;
  dsAttributes.Close;
end;

procedure TEquipmentForm.actEditCustLanExecute(Sender: TObject);
var
  ci: TCustomerInfo;
  lan_id: Integer;
begin
  inherited;
  if not actEditCustLan.Visible then
    exit;

  if (dsCustomers.RecordCount = 0) or (dsCustomers.FieldByName('LAN_ID').IsNull) then
    exit;

  ci := GetCustomerInfo;
  if ci.CUSTOMER_ID > -1 then
  begin
    lan_id := dsCustomers['LAN_ID'];
    if EditCustomerLAN(ci, lan_id) then
    begin
      dsCustomers.DisableControls;
      dsCustomers.closeopen(true);
      dsCustomers.Locate('LAN_ID', lan_id, []);
      dsCustomers.EnableControls;
    end;
  end;
end;

procedure TEquipmentForm.actEditExecute(Sender: TObject);
var
  bm: TBookmark;
  ci: TCustomerInfo;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    exit;
  ci.CUSTOMER_ID := -1;
  if (dsEquipments.RecordCount = 0) then
    exit;
  if EditEquipment(dbGrid.DataSource.DataSet['EID'], ci, -1) <> -1 then
  begin
    if (srcDataSource.DataSet is TMemTableEh) then
    begin
      drvEQ.GetrecCommand.Params.ParamByName('OLD_EID').Value := dbGrid.DataSource.DataSet['EID'];
      mtEQ.RefreshRecord;
    end
    else
    begin
      bm := srcDataSource.DataSet.GetBookmark;
      srcDataSource.DataSet.Close;
      srcDataSource.DataSet.OPen;
      srcDataSource.DataSet.GotoBookmark(bm);
    end;
  end;
end;

procedure TEquipmentForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  dbGrid.DataSource.DataSet.Cancel;
end;

procedure TEquipmentForm.telnet1Click(Sender: TObject);
var
  Host: string;
begin
  inherited;
  if dsEquipments.FieldByName('IP').IsNull then
    Host := ''
  else
    Host := dsEquipments['IP'];
  telnet(Host, 'telnet', '');
end;

procedure TEquipmentForm.srcAttributesDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actAtrEdit.Enabled := actAtrEdit.Visible and (srcAttributes.DataSet.RecordCount > 0);
  actAtrDel.Enabled := actAtrDel.Visible and (srcAttributes.DataSet.RecordCount > 0);
end;

procedure TEquipmentForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actAtrADD.Enabled := actAtrADD.Visible and (srcDataSource.DataSet.RecordCount > 0);
  actCoverAdd.Enabled := actCoverAdd.Visible and (srcDataSource.DataSet.RecordCount > 0);

  if not srcDataSource.DataSet.FieldByName('eq_type').IsNull then
  begin
    dsVlans.Active := False;
    pgcTypeInfo.Visible := False;
    case srcDataSource.DataSet['eq_type'] of
      1:
        begin
          pgcTypeInfo.ActivePage := tsLan;
          dsVlans.Active := true;
          pgcTypeInfo.Visible := true;
        end;
      2:
        begin
          pgcTypeInfo.ActivePage := tsTV;
          pgcTypeInfo.Visible := true;
        end;
      3:
        pgcTypeInfo.ActivePage := tsOther;
    end;
  end;

  if srcDataSource.DataSet.FieldByName('Notice').IsNull then
    memNotice.Lines.Text := ''
  else
    memNotice.Lines.Text := srcDataSource.DataSet.FieldByName('Notice').asString;
  FUpdatetNotice := False;
end;

procedure TEquipmentForm.srcECDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actCoverEdit.Enabled := actCoverEdit.Visible and (srcEC.DataSet.RecordCount > 0);
  actCoverDelete.Enabled := actCoverDelete.Visible and (srcEC.DataSet.RecordCount > 0);
end;

procedure TEquipmentForm.FormShow(Sender: TObject);
var
  i: Integer;
  vFINE: Boolean;
  s: string;
begin
  inherited;

  dbGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbGrdEqpmnt',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
  dbGridSortMarkingChanged(dbGrid);
  if not dsEquipments.Active then
    dsEquipments.OPen;

  for i := 0 to pgcTypeInfo.PageCount - 1 do
    pgcTypeInfo.Pages[i].TabVisible := False;

  vFINE := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1'); // пеня
  if vFINE then
    for i := 0 to dbgCustomer.Columns.Count - 1 do
    begin
      if (AnsiUpperCase(dbgCustomer.Columns[i].FieldName) = 'DEBT_SUM') then
      begin
        dbgCustomer.Columns[i].Title.Caption := rsBALANCE;
        dbgCustomer.Columns[i].FieldName := 'BALANCE';
      end;
    end;

  if srcDataSource.DataSet.Eof then
    exit;
  if not srcDataSource.DataSet.FieldByName('eq_type').IsNull then
    dsVlans.Active := (srcDataSource.DataSet['eq_type'] = 1);
  pgcTypeInfo.Visible := srcDataSource.DataSet['eq_type'] = 1;
  case srcDataSource.DataSet['eq_type'] of
    1:
      pgcTypeInfo.ActivePage := tsLan;
    2:
      pgcTypeInfo.ActivePage := tsTV;
    3:
      pgcTypeInfo.ActivePage := tsOther;
  end;

  // memNotice.Width := Panel2.Width - memNotice.Left - 10;
  // права пользователей

  actNew.Enabled := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment));
  actDelete.Enabled := actNew.Enabled;
  actEdit.Enabled := actNew.Enabled;
  actAtrADD.Visible := actNew.Enabled;
  actAtrEdit.Visible := actNew.Enabled;
  actAtrDel.Visible := actNew.Enabled;
  actCoverAdd.Visible := actNew.Enabled;
  actCoverEdit.Visible := actNew.Enabled;
  actCoverDelete.Visible := actNew.Enabled;
  memNotice.ReadOnly := not actNew.Enabled;

  actEditCustLan.Visible := dmMain.AllowedAction(rght_Customer_full) or dmMain.AllowedAction(rght_Customer_EditLan);

  s := dmMain.GetIniValue('EQUIPMENTASTREE');
  chkTREE.Checked := s = '1';
end;

procedure TEquipmentForm.Panel2Resize(Sender: TObject);
begin
  inherited;
  // memNotice.Height := Panel2.Height - memNotice.Top - 10;
  // memNotice.Width := Panel2.Width - memNotice.Left - 10;
end;

procedure TEquipmentForm.pgcEquipmentChange(Sender: TObject);
begin
  inherited;
  dsAttributes.Active := (pgcEquipment.ActivePage = tsInfo);
  dsEC.Active := (pgcEquipment.ActivePage = tsHouses);
  dsCustomers.Active := (pgcEquipment.ActivePage = tsAbonents);
  dsRequests.Active := (pgcEquipment.ActivePage = tsRequests);
end;

procedure TEquipmentForm.pmgCopyClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TEquipmentForm.pmgSaveSelectionClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TEquipmentForm.pmgSelectAllClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TEquipmentForm.miTreeCollapseClick(Sender: TObject);
begin
  inherited;
  mtEQ.TreeList.FullCollapse;
end;

procedure TEquipmentForm.miTreeExpandClick(Sender: TObject);
begin
  inherited;
  mtEQ.TreeList.FullExpand;
end;

procedure TEquipmentForm.actLanTelnetExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if (srcDataSource.DataSet.FieldByName('IP').IsNull) then
    exit;

  s := srcDataSource.DataSet.FieldByName('IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', 'telnet', s, '', SW_SHOW);
end;

procedure TEquipmentForm.actNewChildExecute(Sender: TObject);
var
  ci: TCustomerInfo;
  id: Integer;
  prnt: Integer;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    exit;
  ci.CUSTOMER_ID := -1;
  prnt := -1;
  if not dbGrid.DataSource.DataSet.FieldByName('EID').IsNull then
    prnt := dbGrid.DataSource.DataSet.FieldByName('EID').Value;

  id := EditEquipment(-1, ci, -1, prnt);
  if id <> -1 then
  begin
    srcDataSource.DataSet.Close;
    srcDataSource.DataSet.OPen;
    srcDataSource.DataSet.Locate('EID', id, []);
  end;
end;

procedure TEquipmentForm.memNoticeExit(Sender: TObject);
var
  s: string;
begin
  inherited;
  if (FUpdatetNotice) and (not srcDataSource.DataSet.FieldByName('EID').IsNull) then
  begin
    s := memNotice.Lines.Text;
    srcDataSource.DataSet.Edit;
    srcDataSource.DataSet['NOTICE'] := s;
    srcDataSource.DataSet.Post;
  end;
end;

procedure TEquipmentForm.memNoticeChange(Sender: TObject);
begin
  inherited;
  FUpdatetNotice := true;
end;

procedure TEquipmentForm.actFindCustomerExecute(Sender: TObject);
var
  Grid: TDBGridEh;
  i: Integer;
  b: TBookmark;
  customers: string;
begin
  inherited;

  if dbgCustomer.DataSource.DataSet.RecordCount = 0 then
    exit;

  Grid := dbgCustomer;
  customers := '';

  if (Grid.SelectedRows.Count = 0) then
  begin
    if not Grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
      customers := customers + ',' + IntToStr(Grid.DataSource.DataSet['CUSTOMER_ID']);
  end
  else
  begin
    b := Grid.DataSource.DataSet.GetBookmark;
    Grid.DataSource.DataSet.DisableControls;
    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      Grid.DataSource.DataSet.Bookmark := Grid.SelectedRows[i];
      if not Grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
        customers := customers + ',' + IntToStr(Grid.DataSource.DataSet['CUSTOMER_ID']);
    end;
    Grid.DataSource.DataSet.GotoBookmark(b);
    Grid.DataSource.DataSet.EnableControls;
  end;

  customers := Copy(customers, 2, Length(customers) - 1);

  if (customers <> '') then
    ShowCustomers(7, customers);
end;

procedure TEquipmentForm.actLanHttpExecute(Sender: TObject);
var
  s: string;
begin
  if (srcDataSource.DataSet.FieldByName('IP').IsNull) then
    exit;

  s := 'http://' + srcDataSource.DataSet.FieldByName('IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', s, '', '', SW_SHOW);
end;

procedure TEquipmentForm.ActLanPingExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if (srcDataSource.DataSet.FieldByName('IP').IsNull) then
    exit;

  s := srcDataSource.DataSet.FieldByName('IP').asString;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, 'open', 'cmd', '/K ping ' + s + ' -t', '', SW_SHOW)
end;

procedure TEquipmentForm.chkGroupClick(Sender: TObject);
var
  Crsr: TCursor;
begin
  inherited;
  Crsr := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  if chkGroup.Checked then
  begin
    srcDataSource.DataSet := mtEQ;
    dsEquipments.Close;
    dbGrid.DataGrouping.GroupPanelVisible := true;
    dbGrid.DataGrouping.Active := true;
    srcDataSource.DataSet.Active := true;
    FCanSave := False;
  end
  else
  begin
    dbGrid.DataGrouping.Active := False;
    dbGrid.DataGrouping.GroupPanelVisible := False;
    srcDataSource.DataSet := dsEquipments;
    mtEQ.Active := False;
    srcDataSource.DataSet.Active := true;
  end;
  chkTREE.Enabled := not chkGroup.Checked;
  Screen.Cursor := Crsr;
end;

procedure TEquipmentForm.btn4Click(Sender: TObject);
begin
  inherited;
  GenerateCustomerLANPopUp;
end;

procedure TEquipmentForm.btnCMDClick(Sender: TObject);
begin
  inherited;
  GenerateLANPopUp;
end;

procedure TEquipmentForm.btnRefreshClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if (srcDataSource.DataSet.Active) and (not srcDataSource.DataSet.FieldByName('EID').IsNull) then
    i := srcDataSource.DataSet['EID']
  else
    i := -1;
  srcDataSource.DataSet.DisableControls;
  srcDataSource.DataSet.Close;
  srcDataSource.DataSet.OPen;
  if i > 0 then
  begin
    srcDataSource.DataSet.Locate('EID', i, []);
  end;
  srcDataSource.DataSet.EnableControls;
end;

procedure TEquipmentForm.GenerateLANPopUp;
var
  NewItem: TMenuItem;
  rCursor: TPoint;
begin
  if srcDataSource.DataSet.RecordCount = 0 then
    exit;
  pmLanPopUp.Items.Clear;
  NewItem := TMenuItem.Create(pmLanPopUp);
  NewItem.Action := ActLanPing;
  pmLanPopUp.Items.Add(NewItem);
  NewItem := TMenuItem.Create(pmLanPopUp);
  NewItem.Action := actLanTelnet;
  pmLanPopUp.Items.Add(NewItem);
  NewItem := TMenuItem.Create(pmLanPopUp);
  NewItem.Action := actLanHttp;
  pmLanPopUp.Items.Add(NewItem);

  if (not srcDataSource.DataSet.FieldByName('Parent_Id').IsNull) then
  begin
    NewItem := TMenuItem.Create(pmLanPopUp);
    NewItem.Caption := '-';
    pmLanPopUp.Items.Add(NewItem);
    NewItem := TMenuItem.Create(pmLanPopUp);
    NewItem.Action := actParentPing;
    pmLanPopUp.Items.Add(NewItem);
    NewItem := TMenuItem.Create(pmLanPopUp);
    NewItem.Action := actParentTelnet;
    pmLanPopUp.Items.Add(NewItem);
    NewItem := TMenuItem.Create(pmLanPopUp);
    NewItem.Action := actParentWeb;
    pmLanPopUp.Items.Add(NewItem);
  end;

  if (not srcDataSource.DataSet.FieldByName('Eq_Group').IsNull) then
  begin
    with dmMain.qRead do
    begin
      sql.Clear;
      sql.Add('select ec.ec_id, ec.name, ec.command');
      sql.Add('from equipment_cmd_grp ec');
      sql.Add('where ec.in_gui = 1 and (ec.eg_id = :eg_id or ec.eg_id = -1)');
      sql.Add('order by ec.name');
      ParamByName('eg_id').AsInteger := srcDataSource.DataSet.FieldByName('Eq_Group').AsInteger;
      Transaction.StartTransaction;
      ExecQuery;

      NewItem := TMenuItem.Create(pmLanPopUp);
      NewItem.Caption := '-';
      pmLanPopUp.Items.Add(NewItem);

      while not Eof do
      begin
        if ((not FieldByName('ec_id').IsNull) and (not FieldByName('name').IsNull)) Then
        begin
          NewItem := TMenuItem.Create(pmLanPopUp);
          NewItem.Caption := FieldByName('name').asString;
          NewItem.Tag := FieldByName('ec_id').AsInteger;
          NewItem.OnClick := miLanGroupCMDClick;
          pmLanPopUp.Items.Add(NewItem);
        end;
        next;
      end;
      Close;
      Transaction.Rollback;
    end;
  end;

  if pmLanPopUp.Items.Count > 0 then
  begin
    GetCursorPos(rCursor);
    pmLanPopUp.Popup(rCursor.X, rCursor.Y);
  end;
end;

procedure TEquipmentForm.miLanGroupCMDClick(Sender: TObject);
var
  Host: string;
  user: string;
  pswd: string;
  H_MAC, C_IP, C_MAC, C_PORT, C_VLAN: string;
  cmd: string;
  eol_chars: Integer;
  CMD_TYPE: Integer;
  URL, AUT_USER, AUT_PSWD: String;
begin
  if not(Sender is TMenuItem) then
    exit;

  with dmMain.qRead do
  begin
    sql.Clear;
    sql.Add('select ec.ec_id, ec.name, ec.command, e.ip, e.mac, e.e_admin, e.e_pass, ec.eol_chrs');
    sql.Add(', ec.CMD_TYPE, ec.URL, ec.AUT_USER, ec.AUT_PSWD');
    sql.Add('from equipment_cmd_grp ec inner join equipment e on (ec.eg_id = e.eq_group)');
    sql.Add('where ec.ec_id = :ec_id and e.eid = :eq_id');
    ParamByName('ec_id').AsInteger := (Sender as TMenuItem).Tag;
    ParamByName('eq_id').AsInteger := srcDataSource.DataSet.FieldByName('Eid').AsInteger;
    Transaction.StartTransaction;
    ExecQuery;
    if FieldByName('ip').IsNull then
      Host := ''
    else
      Host := FieldByName('ip').asString;

    if FieldByName('e_admin').IsNull then
      user := ''
    else
      user := FieldByName('e_admin').asString;

    if FieldByName('e_pass').IsNull then
      pswd := ''
    else
      pswd := FieldByName('e_pass').asString;

    if FieldByName('CMD_TYPE').IsNull then
      CMD_TYPE := 0
    else
      CMD_TYPE := FieldByName('CMD_TYPE').AsInteger;
    if FieldByName('URL').IsNull then
      URL := ''
    else
      URL := FieldByName('URL').asString;
    if FieldByName('AUT_USER').IsNull then
      AUT_USER := ''
    else
      AUT_USER := FieldByName('AUT_USER').asString;
    if FieldByName('AUT_PSWD').IsNull then
      AUT_PSWD := ''
    else
      AUT_PSWD := FieldByName('AUT_PSWD').asString;

    H_MAC := '';
    if (not FieldByName('mac').IsNull) then
    begin
      H_MAC := FieldByName('mac').asString;
    end;

    if FieldByName('command').IsNull then
      cmd := ''
    else
      cmd := FieldByName('command').asString;
    if FieldByName('eol_chrs').IsNull then
      eol_chars := 0
    else
    begin
      if FieldByName('eol_chrs').asString = '\r\n' then
        eol_chars := 0
      else if FieldByName('eol_chrs').asString = '\n\r' then
        eol_chars := 1
      else if FieldByName('eol_chrs').asString = '\n' then
        eol_chars := 2
      else if FieldByName('eol_chrs').asString = '\r' then
        eol_chars := 3
      else
        eol_chars := 0
    end;

    Close;
    Transaction.Rollback;
  end;
  if cmd <> '' then
  begin
    cmd := ReplaceStr(cmd, '<e_admin>', user);
    cmd := ReplaceStr(cmd, '<e_pass>', pswd);
    cmd := ReplaceStr(cmd, '<e_mac>', H_MAC);
    cmd := ReplaceStr(cmd, '<e_mac_h>', H_MAC.Replace(':', '-'));
    cmd := ReplaceStr(cmd, '<e_mac_d>', H_MAC.Replace(':', '.'));
    cmd := ReplaceStr(cmd, '<e_mac_j>', FormatMACas4CD(H_MAC));
    cmd := ReplaceStr(cmd, '<e_ip>', Host);
    cmd := ReplaceStr(cmd, '<c_ip>', C_IP);
    cmd := ReplaceStr(cmd, '<c_mac>', C_MAC);
    cmd := ReplaceStr(cmd, '<c_mac_h>', C_MAC.Replace(':', '-'));
    cmd := ReplaceStr(cmd, '<c_mac_d>', C_MAC.Replace(':', '.'));
    cmd := ReplaceStr(cmd, '<c_mac_j>', FormatMACas4CD(C_MAC));
    cmd := ReplaceStr(cmd, '<c_port>', C_PORT);
    cmd := ReplaceStr(cmd, '<c_vlan>', C_VLAN);
  end;

    URL := ReplaceStr(URL, '<e_ip>', Host);
    URL := ReplaceStr(URL, '<c_ip>', C_IP);

    case CMD_TYPE of
      2:
        cmd := GetHtml(URL, AUT_USER, AUT_PSWD, cmd, true, (Sender as TMenuItem).Caption);
    else
      cmd := telnet(Host, 'telnet', ReplaceStr(cmd, #13#10, '\r'), eol_chars, true);
    end;

end;

function TEquipmentForm.GetCustomerInfo: TCustomerInfo;
begin
  with Result do
  begin
    if not dsCustomers.Eof then
    begin
      FLAT_NO := '';
      phone_no := '';
      notice := '';
      color := '';
      porch_n := '';
      floor_n := '';
      STREET_ID := -1;
      STREET := '';
      HOUSE_ID := -1;
      HOUSE_NO := '';

      if dsCustomers.FieldByName('CUSTOMER_ID').IsNull then
        CUSTOMER_ID := -1
      else
        CUSTOMER_ID := dsCustomers['CUSTOMER_ID'];
      if dsCustomers.FieldByName('cust_code').IsNull then
        Cust_Code := ''
      else
        Cust_Code := dsCustomers['cust_code'];
      if dsCustomers.FieldByName('Account_No').IsNull then
        Account_No := ''
      else
        Account_No := dsCustomers['Account_No'];
      if dsCustomers.FieldByName('CUST_STATE_DESCR').IsNull then
        CUST_STATE_DESCR := ''
      else
        CUST_STATE_DESCR := dsCustomers['CUST_STATE_DESCR'];

      if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
        Debt_sum := dsCustomers['BALANCE']
      else
        Debt_sum := dsCustomers['Debt_sum'];

      if not dsCustomers.FieldByName('SURNAME').IsNull then
        FIO := dsCustomers['SURNAME']
      else
        FIO := '';
      if not dsCustomers.FieldByName('street_ID').IsNull then
      begin
        STREET_ID := dsCustomers['street_ID'];
        STREET := dsCustomers['STREET_NAME'];
      end;
      if not dsCustomers.FieldByName('HOUSE_ID').IsNull then
      begin
        HOUSE_ID := dsCustomers['HOUSE_ID'];
        HOUSE_NO := dsCustomers['House_No'];
      end;
      if not dsCustomers.FieldByName('FLAT_No').IsNull then
        FLAT_NO := dsCustomers['FLAT_No'];
      if not dsCustomers.FieldByName('phone_no').IsNull then
        phone_no := dsCustomers['phone_no'];
      if not dsCustomers.FieldByName('notice').IsNull then
        notice := dsCustomers['notice'];
      if not dsCustomers.FieldByName('HIS_COLOR').IsNull then
        color := dsCustomers['HIS_COLOR'];
      if not dsCustomers.FieldByName('PORCH_N').IsNull then
        porch_n := dsCustomers['PORCH_N'];
      if not dsCustomers.FieldByName('FLOOR_N').IsNull then
        floor_n := dsCustomers['FLOOR_N'];
    end
    else
      CUSTOMER_ID := -1;
  end;
end;

procedure TEquipmentForm.GenerateCustomerLANPopUp;
var
  NewItem: TMenuItem;
  rCursor: TPoint;
begin
  if dsCustomers.RecordCount = 0 then
    exit;
  if srcDataSource.DataSet.RecordCount = 0 then
    exit;

  pmCustomerLanPopUp.Items.Clear;
  NewItem := TMenuItem.Create(pmCustomerLanPopUp);
  NewItem.Action := actCustPing;
  pmCustomerLanPopUp.Items.Add(NewItem);
  NewItem := TMenuItem.Create(pmCustomerLanPopUp);
  NewItem.Action := actCustTelnet;
  pmCustomerLanPopUp.Items.Add(NewItem);
  NewItem := TMenuItem.Create(pmCustomerLanPopUp);
  NewItem.Action := actCustHttp;
  pmCustomerLanPopUp.Items.Add(NewItem);
  NewItem := TMenuItem.Create(pmCustomerLanPopUp);
  NewItem.Caption := '-';
  NewItem.Tag := 0;
  pmCustomerLanPopUp.Items.Add(NewItem);
  if not srcDataSource.DataSet.FieldByName('EID').IsNull then
  begin
    with dmMain.qRead do
    begin
      sql.Clear;
      sql.Add('select ec.ec_id, ec.name, ec.command');

      sql.Add('from equipment_cmd_grp ec inner join equipment e on (ec.eg_id = e.eq_group)');
      sql.Add('where ec.in_gui = 1 and e.eid = :eq_id');
      sql.Add('order by ec.name');
      ParamByName('eq_id').AsInteger := srcDataSource.DataSet.FieldByName('EID').AsInteger;
      Transaction.StartTransaction;
      ExecQuery;
      while not Eof do
      begin
        NewItem := TMenuItem.Create(pmCustomerLanPopUp);
        NewItem.Caption := FieldByName('name').asString;
        NewItem.Tag := FieldByName('ec_id').AsInteger;
        NewItem.OnClick := miCustomerLanClick;
        pmCustomerLanPopUp.Items.Add(NewItem);
        next;
      end;
      Close;
      Transaction.Rollback;
    end;
  end;

  if pmCustomerLanPopUp.Items.Count > 0 then
  begin
    GetCursorPos(rCursor);
    pmCustomerLanPopUp.Popup(rCursor.X, rCursor.Y);
  end;
end;

procedure TEquipmentForm.miCustomerLanClick(Sender: TObject);
var
  Host: string;
  user: string;
  pswd: string;
  H_MAC, C_IP, C_MAC, C_PORT, C_VLAN: string;
  C_TAG, C_TAGSTR: string;
  cmd: string;
  eol_chars: Integer;
  CMD_TYPE: Integer;
  URL, AUT_USER, AUT_PSWD: String;

  procedure replaceParams(var InStr: String);
  begin
    InStr := ReplaceStr(InStr, '<e_admin>', user);
    InStr := ReplaceStr(InStr, '<e_pass>', pswd);
    InStr := ReplaceStr(InStr, '<e_mac>', H_MAC);
    InStr := ReplaceStr(InStr, '<e_mac_h>', H_MAC.Replace(':', '-'));
    InStr := ReplaceStr(InStr, '<e_mac_d>', H_MAC.Replace(':', '.'));
    InStr := ReplaceStr(InStr, '<e_ip>', Host);
    InStr := ReplaceStr(InStr, '<c_ip>', C_IP);
    InStr := ReplaceStr(InStr, '<c_mac>', C_MAC);
    InStr := ReplaceStr(InStr, '<c_mac_h>', C_MAC.Replace(':', '-'));
    InStr := ReplaceStr(InStr, '<c_mac_d>', C_MAC.Replace(':', '.'));
    InStr := ReplaceStr(InStr, '<c_port>', C_PORT);
    InStr := ReplaceStr(InStr, '<c_vlan>', C_VLAN);
    InStr := ReplaceStr(InStr, '<c_tag>', C_TAG);
    InStr := ReplaceStr(InStr, '<c_tagstr>', C_TAGSTR);
  end;

begin
  if not(Sender is TMenuItem) then
    exit;
  if srcDataSource.DataSet.RecordCount = 0 then
    exit;
  if dsCustomers.RecordCount = 0 then
    exit;

  if (not dsCustomers.FieldByName('IP').IsNull) then
    C_IP := dsCustomers.FieldByName('IP').asString;

  if (not dsCustomers.FieldByName('MAC').IsNull) then
    C_MAC := dsCustomers.FieldByName('MAC').asString;

  if (not dsCustomers.FieldByName('PORT').IsNull) then
    C_PORT := dsCustomers.FieldByName('PORT').asString;

  with dmMain.qRead do
  begin
    sql.Clear;
    sql.Add('select ec.ec_id, ec.name, ec.command, e.ip, e.mac, e.e_admin, e.e_pass, ec.eol_chrs');
    sql.Add(', ec.CMD_TYPE, ec.URL, ec.AUT_USER, ec.AUT_PSWD');
    sql.Add('from equipment_cmd_grp ec inner join equipment e on (ec.eg_id = e.eq_group)');
    sql.Add('where ec.ec_id = :ec_id and e.eid = :eq_id');
    ParamByName('ec_id').AsInteger := (Sender as TMenuItem).Tag;
    ParamByName('eq_id').AsInteger := srcDataSource.DataSet.FieldByName('EID').AsInteger;
    Transaction.StartTransaction;
    ExecQuery;

    if not FieldByName('ip').IsNull then
      Host := FieldByName('ip').asString;

    if not FieldByName('e_admin').IsNull then
      user := FieldByName('e_admin').asString;

    if not FieldByName('e_pass').IsNull then
      pswd := FieldByName('e_pass').asString;

    if (not FieldByName('mac').IsNull) then
      H_MAC := FieldByName('mac').asString;

    if not FieldByName('command').IsNull then
      cmd := FieldByName('command').asString;

    if FieldByName('eol_chrs').IsNull then
      eol_chars := 0
    else
    begin
      if FieldByName('eol_chrs').asString = '\r\n' then
        eol_chars := 0
      else if FieldByName('eol_chrs').asString = '\n\r' then
        eol_chars := 1
      else if FieldByName('eol_chrs').asString = '\n' then
        eol_chars := 2
      else if FieldByName('eol_chrs').asString = '\r' then
        eol_chars := 3
      else
        eol_chars := 0
    end;

    if FieldByName('CMD_TYPE').IsNull then
      CMD_TYPE := 0
    else
      CMD_TYPE := FieldByName('CMD_TYPE').AsInteger;
    if not FieldByName('URL').IsNull then
      URL := FieldByName('URL').asString;
    if not FieldByName('AUT_USER').IsNull then
      AUT_USER := FieldByName('AUT_USER').asString;
    if not FieldByName('AUT_PSWD').IsNull then
      AUT_PSWD := FieldByName('AUT_PSWD').asString;

    Close;
    Transaction.Rollback;
  end;
  if cmd <> '' then
    replaceParams(cmd);
  if cmd <> '' then
    replaceParams(URL);

  case CMD_TYPE of
    2:
      cmd := GetHtml(URL, AUT_USER, AUT_PSWD, cmd, true, (Sender as TMenuItem).Caption);
  else
    if cmd <> '' then
      cmd := telnet(Host, 'telnet', ReplaceStr(cmd, #13#10, '\r'), eol_chars, true);
  end;
end;

end.
