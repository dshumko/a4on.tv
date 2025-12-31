unit EquipmentForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Forms, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Menus, Vcl.ActnList, Vcl.Dialogs, Vcl.Grids,
  Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ToolWin, Vcl.Controls, Vcl.Graphics,
  GridForma, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBGridEh, MemTableDataEh, PropFilerEh,
  PropStorageEh,
  DataDriverEh, pFIBDataDriverEh, MemTableEh, FIBDataSet, pFIBDataSet, DBCtrlsEh, DBLookupEh, CnErrorProvider, EhLibVCL,
  GridsEh,
  DBAxisGridsEh, EhLibFIB, EhLibMTE, FIBQuery, PrjConst, A4onTypeUnit, AtrPages, amSplitter,
  PrnDbgeh;

type
  TEquipmentForm = class(TGridForm)
    dsEquipments: TpFIBDataSet;
    actCoverAdd: TAction;
    actCoverEdit: TAction;
    actCoverDelete: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    mtEQ: TMemTableEh;
    N4: TMenuItem;
    telnet1: TMenuItem;
    actAtrADD: TAction;
    actAtrEdit: TAction;
    actAtrDel: TAction;
    miTreeBreak: TMenuItem;
    miTreeCollapse: TMenuItem;
    miTreeExpand: TMenuItem;
    actNewChild: TAction;
    miNewChild: TMenuItem;
    actFindCustomer: TAction;
    btnRefresh: TToolButton;
    btn2: TToolButton;
    actEditCustLan: TAction;
    actClone: TAction;
    N5: TMenuItem;
    actPAdd: TAction;
    actPEdit: TAction;
    pnlForms: TPanel;
    splLst: TSplitter;
    pnlDATA: TPanel;
    splMain: TSplitter;
    lstForms: TListBox;
    actLayout: TAction;
    miTreeExpandCurrent: TMenuItem;
    dsFilter: TMemTableEh;
    btnActSetFilter: TToolButton;
    ActSetFilter: TAction;
    pmFilter: TPopupMenu;
    miSetFilterN: TMenuItem;
    N42: TMenuItem;
    N36: TMenuItem;
    actSetFilterN: TAction;
    drvEQ: TDataSetDriverEh;
    miN6: TMenuItem;
    actFrize: TAction;
    mmMain: TMainMenu;
    miMi: TMenuItem;
    miMiFrozen: TMenuItem;
    miLayout: TMenuItem;
    miTree: TMenuItem;
    actTree: TAction;
    miN7: TMenuItem;
    miN8: TMenuItem;
    actCopyID: TAction;
    miN9: TMenuItem;
    miDelete: TMenuItem;
    actGroup: TAction;
    miGroup: TMenuItem;
    btn1: TToolButton;
    btnTree: TToolButton;
    btnGroup: TToolButton;
    btn3: TToolButton;
    btnLayout: TToolButton;
    procedure tbCancelClick(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbgCustomerGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure pmgCopyClick(Sender: TObject);
    procedure pmgSelectAllClick(Sender: TObject);
    procedure pmgSaveSelectionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbGridSortMarkingChanged(Sender: TObject);
    procedure telnet1Click(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure miTreeCollapseClick(Sender: TObject);
    procedure miTreeExpandClick(Sender: TObject);
    procedure actNewChildExecute(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure actCloneExecute(Sender: TObject);
    procedure dbGridColumns10GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure lstFormsClick(Sender: TObject);
    procedure actLayoutExecute(Sender: TObject);
    procedure miTreeExpandCurrentClick(Sender: TObject);
    procedure ActSetFilterExecute(Sender: TObject);
    procedure actSetFilterNExecute(Sender: TObject);
    procedure miN6Click(Sender: TObject);
    procedure actFrizeExecute(Sender: TObject);
    procedure actTreeExecute(Sender: TObject);
    procedure miN8Click(Sender: TObject);
    procedure actQuickFilterExecute(Sender: TObject);
    procedure actCopyIDExecute(Sender: TObject);
    procedure actGroupExecute(Sender: TObject);
    procedure dbGridDataGroupGetRowText(Sender: TCustomDBGridEh;
      GroupDataTreeNode: TGroupDataTreeNodeEh; var GroupRowText: string);
    procedure dsFilterNewRecord(DataSet: TDataSet);
  private
    FLastPage: TA4onPage;
    // FAutoGen: Boolean; // автогенерация название
    FPageList: TA4onPages;
    FCanSave: Boolean;
    FInTreeView: Boolean;
    FinGroupView: Boolean;
    FIsVertical: Boolean;
    FFrozencols: Integer;
    function GenerateFilter: string;
    procedure SetGridTreeMode(const inTree: Boolean);
    procedure SetGridGroupMode(const inGroup: Boolean);
    procedure ShowPage(Page: TA4onPage);
    procedure UpdateCommands;
    procedure DoCreatePages;
    procedure StartCommand(Sender: TObject);
    procedure UpdatePage(Sender: TObject);
    function IndexToPage(Index: Integer): TA4onPage;
    procedure InitSecurity;
    procedure UpdateInfoPanel;
    procedure RefreshGridRecords;
    procedure SwitchLayout(const InVertical: Boolean);
    procedure SetLayout(Value: Boolean);
    function GetOrderColumns: String;
    procedure SetFrozen(const v: Integer);
    procedure SetFilter(const filter: string);
  public
    { Public declarations }
    property IsVertical: Boolean read FIsVertical write SetLayout;
    procedure SetDefaultFilter;
  end;

var
  EquipmentForm: TEquipmentForm;

implementation

uses
  System.StrUtils,
  DM, MAIN, AtrCommon, AtrStrUtils, fs_iinterpreter, EquipAttributesForma, EquipCoverage, atrCmdUtils, RequestForma,
  EquipEditForma, TelnetForma, HtmlForma, pFIBQuery, CF, CustomerLanForma, EQPort, fmuEqpmntPorts, fmuEqpmntAttributes,
  fmuEqpmntRequests, fmuEqpmntRegion, fmuEqpmntInfo, EquipFilter;

{$R *.dfm}

// TODO: Убрать костыль в виде Parent_Port_sort
procedure TEquipmentForm.DoCreatePages;
var
  i: Integer;
  Page: TA4onPage;
  Item: TA4onPageItem;
  PageName: string;
begin
  for i := 0 to FPageList.Count - 1 do
  begin
    Item := FPageList[i];
    if Item.Page = nil then
    begin
      Item.Page := Item.PageClass.CreatePageGrid(Self, dbGrid);
      Page := Item.Page;
      Page.InitForm;
      Page.OnUpdate := UpdatePage;
      Page.OnStart := StartCommand;
      Page.BorderStyle := bsNone;
      Page.Parent := pnlDATA;
      Page.Width := pnlDATA.ClientHeight;
      Page.Height := pnlDATA.ClientHeight;
    end;
  end;
  with lstForms do
  begin
    Items.BeginUpdate;
    try
      Items.Clear;
      for i := 0 to FPageList.Count - 1 do
      begin
        PageName := FPageList[i].PageClass.GetPageName;
        Items.Add(PageName);
      end;
    finally
      Items.EndUpdate;
    end;
  end;
end;

procedure TEquipmentForm.dsFilterNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet['NOT_NAME'] := 0;
end;

procedure TEquipmentForm.StartCommand(Sender: TObject);
begin
  //
end;

procedure TEquipmentForm.UpdatePage(Sender: TObject);
begin
  RefreshGridRecords;
end;

function TEquipmentForm.IndexToPage(Index: Integer): TA4onPage;
begin
  if (Index < 0) or (Index >= FPageList.Count) then
    raise Exception.Create('Invalid page index');
  Result := FPageList[Index].Page;
end;

procedure TEquipmentForm.RefreshGridRecords;
begin
  if (srcDataSource.DataSet = mtEQ) then
    Exit;

  dsEquipments.Refresh;
  {
    if (srcDataSource.DataSet.Active) and (not srcDataSource.DataSet.FieldByName('EID').IsNull) then
    i := srcDataSource.DataSet['EID']
    else
    i := -1;
    srcDataSource.DataSet.Close;
    srcDataSource.DataSet.Open;
    if i > 0 then
    srcDataSource.DataSet.Locate('EID', i, []);

    if Assigned(FLastPage) then
    begin
    FLastPage.CloseData;
    FLastPage.OpenData;
    end;
  }
end;

procedure TEquipmentForm.ShowPage(Page: TA4onPage);
begin
  if FLastPage <> nil then
  begin
    FLastPage.Visible := False;
    FLastPage.CloseData;
  end;
  FLastPage := Page;
  if Page <> nil then
  begin
    Page.Align := alClient;
    Page.Visible := True;
    Page.Width := pnlDATA.ClientWidth;
    Page.OpenData;
  end;
end;

procedure TEquipmentForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
  v: TfsCustomVariable;
begin
  inherited;

  if fsGlobalUnit <> nil then
  begin
    v := fsGlobalUnit.Find(Self.Name);
    if v <> nil then
      fsGlobalUnit.RemoveItems(Self);
  end;

  if Assigned(FPageList) then
  begin
    for i := 0 to FPageList.Count - 1 do
    begin
      if Assigned(FPageList[i].Page) then
        FPageList[i].Page.SaveState;
    end;
    FPageList.Free;
  end;

  if FCanSave then
    dbGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbGrdEqpmnt', False);

  dmMain.SetIniValue('EQUIPMENTASTREE', IfThen(FInTreeView, '1', '0'));
  dmMain.SetIniValue('EQUIPMENTGROUP', IfThen(FinGroupView, '1', '0'));
  dmMain.SetIniValue('EQUIPMENT_INFOLAYOUT', IfThen(FIsVertical, '1', '0'));
  dmMain.SetIniValue('EQPMNTGRIDFROZEN', FFrozencols.ToString);

  if FIsVertical then
  begin
    dmMain.SetIniValue('EQUIPMENT_FSIZE', pnlForms.Width.ToString);
    dmMain.SetIniValue('EQUIPMENT_LSIZE', lstForms.Height.ToString);
  end
  else
  begin
    dmMain.SetIniValue('EQUIPMENT_FSIZE', pnlForms.Height.ToString);
    dmMain.SetIniValue('EQUIPMENT_LSIZE', lstForms.Width.ToString);
  end;
  dmMain.SetIniValue('EQUIPMENT_LASTPAGE', lstForms.ItemIndex.ToString);

  srcDataSource.DataSet.Close;
  EquipmentForm := nil;
end;

procedure TEquipmentForm.FormCreate(Sender: TObject);
begin
  inherited;

  FPageList := TA4onPages.Create;
  FPageList.Add(TapgEqpmntInfo);
  FPageList.Add(TapgEqpmntAttributes);
  FPageList.Add(TapgEqpmntPort);
  FPageList.Add(TapgEqpmntRequests);
  FPageList.Add(TapgEqpmntRegion);

  FCanSave := True;
  FInTreeView := False;
  FinGroupView := False;
end;

procedure TEquipmentForm.actCloneExecute(Sender: TObject);
var
  ci: TCustomerInfo;
  id: Integer;
begin
  inherited;
  if (dsEquipments.RecordCount = 0) then
    Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment))) then
    Exit;
  ci.CUSTOMER_ID := -1;

  id := CloneEquipment(dbGrid.DataSource.DataSet['EID']);
  if id <> -1 then
  begin
    srcDataSource.DataSet.Close;
    srcDataSource.DataSet.Open;
    srcDataSource.DataSet.Locate('EID', id, []);
  end;
end;

procedure TEquipmentForm.actCopyIDExecute(Sender: TObject);
begin
  inherited;
  A4MainForm.CopyDataSetFldToClipboard(dbGrid.DataSource.DataSet, 'EID');
end;

procedure TEquipmentForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment))) then
    Exit;
  if (MessageDlg(rsDeleteSelectedRecords, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dbGrid.DataSource.DataSet.Delete;
end;

procedure TEquipmentForm.actNewExecute(Sender: TObject);
var
  ci: TCustomerInfo;
  id: Integer;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment))) then
    Exit;
  ci.CUSTOMER_ID := -1;

  id := EditEquipment(-1, ci, -1);
  if id <> -1 then
  begin
    srcDataSource.DataSet.Close;
    srcDataSource.DataSet.Open;
    srcDataSource.DataSet.Locate('EID', id, []);
  end;
end;

procedure TEquipmentForm.actQuickFilterExecute(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  if Assigned(FPageList) then
  begin
    for i := 0 to FPageList.Count - 1 do
    begin
      if Assigned(FPageList[i].Page) then
      begin
        FPageList[i].Page.ShowQuickFilter(actQuickFilter.Checked);
      end;
    end;
  end;
end;

procedure TEquipmentForm.ActSetFilterExecute(Sender: TObject);
var
  filter: string;
  fResult: Boolean;
begin
  inherited;
  {
    if not(srcDataSource.DataSet is TpFIBDataSet) then
    Exit;

    if FInTreeView then
    begin
    ShowMessage(rsTreeMode);
    Exit;
    end;
  }

  // filter := '';

  // if not dsFilter.Active then
  // SetDefaultFilter;

  filter := '';
  with TEquipFilterForm.Create(Application) do
  begin
    try
      if ShowModal = mrOk then
        filter := GenerateFilter;
    finally
      Free;
    end;
  end;

  if not filter.IsEmpty then
    SetFilter(filter);
end;

procedure TEquipmentForm.actSetFilterNExecute(Sender: TObject);
var
  filter: string;
begin
  inherited;

  if not(srcDataSource.DataSet is TpFIBDataSet) then
    Exit;

  filter := '';
  with dsFilter do
  begin
    DisableControls;
    if Active then
      Close;
    Open;
    EmptyTable;
    Insert;
    EnableControls;
  end;

  filter := '';
  with TEquipFilterForm.Create(Application) do
  begin
    try
      if ShowModal = mrOk then
        filter := GenerateFilter;
    finally
      Free;
    end;
  end;

  if not filter.IsEmpty then
    SetFilter(filter);
end;

procedure TEquipmentForm.actTreeExecute(Sender: TObject);
begin
  inherited;
  SetGridTreeMode(not FInTreeView);
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

procedure TEquipmentForm.dbGridColumns10GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  inherited;
  if not Params.Text.IsEmpty then
    Params.Text := StringReplace(Params.Text, #13#10, '. ', [rfReplaceAll]);
end;

procedure TEquipmentForm.dbGridDataGroupGetRowText(Sender: TCustomDBGridEh;
  GroupDataTreeNode: TGroupDataTreeNodeEh; var GroupRowText: string);
var
 i : Integer;
begin
  inherited;
  i := Pos(': ',  GroupRowText);
  if i>0 then
    GroupRowText := copy(GroupRowText, i+2, 255);
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
  id: Integer;
begin
  inherited;
  if not(Sender is TCustomDBGridEh) then
    Exit;
  cr := Screen.Cursor;
  Screen.Cursor := crSqlWait;

  if (dbGrid.DataSource.DataSet.Active) and (not dbGrid.DataSource.DataSet.FieldByName('EID').IsNull) then
    id := dbGrid.DataSource.DataSet['EID']
  else
    id := -666;

  try
    Grid := TCustomDBGridEh(Sender);
    if (not FInTreeView) and (not FinGroupView) then
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
        FIBDS.Open;
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
    if id <> -666 then
      dbGrid.DataSource.DataSet.Locate('EID', id, []);

  finally
    Screen.Cursor := cr;
  end;
end;

procedure TEquipmentForm.actEditExecute(Sender: TObject);
var
  ci: TCustomerInfo;
  id: Integer;
  s: string;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment))) then
    Exit;
  ci.CUSTOMER_ID := -1;
  if (dsEquipments.RecordCount = 0) then
    Exit;

  // if (srcDataSource.DataSet is TMemTableEh) then
  // expanded := mtEQ.RecView.NodeExpanded
  // else
  // expanded := False;

  id := dbGrid.DataSource.DataSet['EID'];
  if EditEquipment(id, ci, -1) <> -1 then
  begin
    if (srcDataSource.DataSet is TMemTableEh) then
    begin
      { TODO: Переделать обновление записи }
      s := mtEQ.SortOrder;
      if s.IsEmpty then
        s := GetOrderColumns;
      mtEQ.DisableControls;
      mtEQ.Close;
      mtEQ.Open;
      mtEQ.SortOrder := s;
      mtEQ.TreeList.Locate('EID', id, []);
      mtEQ.EnableControls;
      // R:= mtEQ.RecView;
      // mtEQ.RecordsView.MemoryTreeList.Collapse(r.NodeParent, True);
      // mtEQ.RecordsView.MemoryTreeList.Expand(r, expanded);
      // dbGridSortMarkingChanged(dbGrid);

      // mtEQ.RefreshRecord;
    end
    else
    begin
      dsEquipments.Refresh;
    end;
  end;
end;

procedure TEquipmentForm.actFrizeExecute(Sender: TObject);
var
  q: string;
  i: Integer;
begin
  inherited;
  q := FFrozencols.ToString;
  if InputQuery('Закрепить столбцы', 'Количество', q) then
  begin
    if not TryStrToInt(q, i) then
      i := 0;
    SetFrozen(i);
  end;
end;

procedure TEquipmentForm.actGroupExecute(Sender: TObject);
begin
  inherited;
  SetGridGroupMode(not FinGroupView);
end;

procedure TEquipmentForm.actLayoutExecute(Sender: TObject);
begin
  inherited;
  SwitchLayout(not FIsVertical);
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

procedure TEquipmentForm.FormShow(Sender: TObject);
var
  i: Integer;
  b: Boolean;
begin
  inherited;

  dbGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbGrdEqpmnt',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);

  if (TryStrToInt(dmMain.GetIniValue('EQPMNTGRIDFROZEN'), FFrozencols)) then
    SetFrozen(FFrozencols)
  else
    SetFrozen(0);

  FIsVertical := False;
  b := (dmMain.GetIniValue('EQUIPMENT_INFOLAYOUT') = '1');
  SwitchLayout(b);
  if FIsVertical then
  begin
    if TryStrToInt(dmMain.GetIniValue('EQUIPMENT_FSIZE'), i) then
      pnlForms.Width := i;
    if TryStrToInt(dmMain.GetIniValue('EQUIPMENT_LSIZE'), i) then
      lstForms.Height := i;
  end
  else
  begin
    if TryStrToInt(dmMain.GetIniValue('EQUIPMENT_FSIZE'), i) then
      pnlForms.Height := i;
    if TryStrToInt(dmMain.GetIniValue('EQUIPMENT_LSIZE'), i) then
      lstForms.Width := i;
  end;

  InitSecurity;
  DoCreatePages;
  if FPageList.Count > 0 then
  begin
    if not TryStrToInt(dmMain.GetIniValue('EQUIPMENT_LASTPAGE'), i) then
      i := 0;
    lstForms.ItemIndex := i;
    ShowPage(IndexToPage(i));
  end;

  with fsGlobalUnit do
  begin
    AddedBy := Self;
    AddForm(Self);
    AddedBy := nil;
  end;

  dbGridSortMarkingChanged(dbGrid);
  SetFilter(GenerateFilter);

  if (dmMain.GetIniValue('EQUIPMENTASTREE') = '1') then
     SetGridTreeMode(True)
  else if (dmMain.GetIniValue('EQUIPMENTGROUP') = '1') then
     SetGridGroupMode(True);

  UpdateCommands;
end;

procedure TEquipmentForm.InitSecurity;
begin
  // права пользователей
  actNew.Enabled := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment));
  actDelete.Enabled := actNew.Enabled;
  actEdit.Enabled := actNew.Enabled;

  actEditCustLan.Visible := dmMain.AllowedAction(rght_Customer_full) or dmMain.AllowedAction(rght_Customer_LanFull);
end;

procedure TEquipmentForm.lstFormsClick(Sender: TObject);
begin
  inherited;
  ShowPage(IndexToPage(lstForms.ItemIndex));
end;

procedure TEquipmentForm.UpdateCommands;
begin
  //
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

procedure TEquipmentForm.miTreeExpandCurrentClick(Sender: TObject);
var
  EID: Integer;
  CurrNode: TMemRecViewEh;

  procedure OpenTreeNode(Node: TMemRecViewEh);
  var
    i, id: Integer;
    CurSubNode: TMemRecViewEh;
  begin
    for i := 0 to Node.NodesCount - 1 do
    begin
      CurSubNode := Node.NodeItems[i];
      // CurSubNode.NodeExpanded := True;
      id := CurSubNode.Rec.DataValues['EID', dvvValueEh];
      mtEQ.TreeList.Locate('EID', id, []);
      OpenTreeNode(CurSubNode);
    end;
  end;

begin
  inherited;
  if dbGrid.DataSource.DataSet.FieldByName('EID').IsNull then
    Exit;

  { TODO: Переделатью сделано через ... }
  EID := dbGrid.DataSource.DataSet['EID'];
  dbGrid.DataSource.DataSet.DisableControls;
  mtEQ.TreeList.FullCollapse;
  mtEQ.TreeList.Locate('EID', EID, []);
  CurrNode := mtEQ.RecView;
  OpenTreeNode(CurrNode);
  mtEQ.TreeList.Locate('EID', EID, []);
  dbGrid.DataSource.DataSet.EnableControls;
end;

procedure TEquipmentForm.miN6Click(Sender: TObject);
var
  CurrNode: TMemRecViewEh;
begin
  inherited;

  CurrNode := mtEQ.RecView;
  mtEQ.RecordsView.MemoryTreeList.Collapse(CurrNode, True);
end;

procedure TEquipmentForm.miN8Click(Sender: TObject);
begin
  inherited;
  if not dsEquipments.FieldByName('HOUSE_ID').IsNull then
    A4MainForm.OpnenHouseByID(dsEquipments['HOUSE_ID']);
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

procedure TEquipmentForm.actNewChildExecute(Sender: TObject);
var
  ci: TCustomerInfo;
  id: Integer;
  prnt: Integer;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment))) then
    Exit;
  ci.CUSTOMER_ID := -1;
  prnt := -1;
  if not dbGrid.DataSource.DataSet.FieldByName('EID').IsNull then
    prnt := dbGrid.DataSource.DataSet.FieldByName('EID').Value;

  id := EditEquipment(-1, ci, -1, prnt);
  if id <> -1 then
  begin
    srcDataSource.DataSet.Close;
    srcDataSource.DataSet.Open;
    srcDataSource.DataSet.Locate('EID', id, []);
  end;
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
  Crsr: TCursor;
  id: Integer;
begin
  inherited;

  if (srcDataSource.DataSet.Active) and (srcDataSource.DataSet.RecordCount >= 0) and
    (not srcDataSource.DataSet.FieldByName('EID').IsNull) then
    id := srcDataSource.DataSet['EID']
  else
    id := -666;

  Crsr := Screen.Cursor;
  Screen.Cursor := crSqlWait;

  FInTreeView := inTree;
  actTree.Checked := FInTreeView;

  FinGroupView := FInTreeView;
  actGroup.Checked := FinGroupView;

  FinGroupView := False;
  actGroup.Checked := FinGroupView;
  actGroup.Enabled := not FInTreeView;

  if FInTreeView then
  begin
    srcDataSource.DataSet := mtEQ;
    FCanSave := False;
  end
  else
  begin
    srcDataSource.DataSet := dsEquipments;
    if mtEQ.Active then
      mtEQ.Close;
  end;

  srcDataSource.DataSet.DisableControls;
  srcDataSource.DataSet.Open;
  mtEQ.TreeList.Active := FInTreeView;
  mtEQ.TreeList.DefaultNodeExpanded := FInTreeView;

  miTreeBreak.Visible := FInTreeView;
  miTreeCollapse.Visible := FInTreeView;
  miTreeExpand.Visible := FInTreeView;
  miTreeExpandCurrent.Visible := FInTreeView;

  if FInTreeView then
    mtEQ.TreeList.FullCollapse;

  if id <> -666 then
  begin
    if not FInTreeView then
      srcDataSource.DataSet.Locate('EID', id, [])
    else
    begin
      mtEQ.TreeList.Locate('EID', id, []);
      // mtEQ.TreeList.E
    end;
  end;

  if FLastPage <> nil then
  begin
    FLastPage.CloseData;
    FLastPage.OpenData;
  end;
  srcDataSource.DataSet.EnableControls;
  Screen.Cursor := Crsr;
  dbGrid.SetFocus;

end;

procedure TEquipmentForm.SetGridGroupMode(const inGroup: Boolean);
var
  Crsr: TCursor;
  id: Integer;
begin
  inherited;

  if (srcDataSource.DataSet.Active) and (srcDataSource.DataSet.RecordCount >= 0) and
    (not srcDataSource.DataSet.FieldByName('EID').IsNull) then
    id := srcDataSource.DataSet['EID']
  else
    id := -666;

  Crsr := Screen.Cursor;
  Screen.Cursor := crSqlWait;

  FinGroupView := inGroup;
  actGroup.Checked := FinGroupView;

  FInTreeView := False;
  actTree.Checked := FInTreeView;
  actTree.Enabled := not FinGroupView;

  if FinGroupView then
  begin
    srcDataSource.DataSet := mtEQ;
    mtEQ.TreeList.Active := False;
    FCanSave := False; // not FinGroupView;
  end
  else
  begin
    srcDataSource.DataSet := dsEquipments;
    mtEQ.Close;
  end;

  srcDataSource.DataSet.DisableControls;
  srcDataSource.DataSet.Active := True;
  dbGrid.DataGrouping.GroupPanelVisible := FinGroupView;
  dbGrid.DataGrouping.Active := FinGroupView;


  if FLastPage <> nil then
  begin
    FLastPage.CloseData;
    FLastPage.OpenData;
  end;

  if id <> -666 then
  begin
    srcDataSource.DataSet.Locate('EID', id, [])
  end;

  srcDataSource.DataSet.EnableControls;
  Screen.Cursor := Crsr;

  dbGrid.SetFocus;
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
  srcDataSource.DataSet.Open;
  if i > 0 then
  begin
    srcDataSource.DataSet.Locate('EID', i, []);
  end;
  srcDataSource.DataSet.EnableControls;
end;

procedure TEquipmentForm.SetLayout(Value: Boolean);
begin
  SwitchLayout(Value);
end;

procedure TEquipmentForm.SwitchLayout(const InVertical: Boolean);
var
  sp, sl: Integer;
begin
  if (FIsVertical = InVertical) then
    Exit;

  FIsVertical := InVertical;
  if FIsVertical then
    dmMain.SetIniValue('EQUIPMENT_INFOLAYOUT', '1')
  else
    dmMain.SetIniValue('EQUIPMENT_INFOLAYOUT', '0');

  if not FIsVertical then
  begin
    sp := pnlForms.Width;
    if sp > (Self.Height / 2) then
      sp := Trunc(Self.Height / 2);

    sl := lstForms.Height;
    pnlForms.Align := alBottom;
    splMain.Align := alBottom;
    pnlForms.Height := sp;
    splLst.Align := alLeft;
    lstForms.Align := alLeft;
    lstForms.Width := sl;
  end
  else
  begin
    sp := pnlForms.Height;
    if sp > (Self.Width / 2) then
      sp := Trunc(Self.Width / 2);

    sl := lstForms.Width;
    pnlForms.Align := alRight;
    splMain.Align := alRight;
    pnlForms.Width := sp;
    lstForms.Align := alTop;
    splLst.Align := alTop;
    lstForms.Height := sl;
  end;
end;

function TEquipmentForm.GenerateFilter: string;

  function RecordToFilter: string;
  var
    tmpSQL: string;
    s : String;
  begin
    tmpSQL := '';

    // Условие отбора по адресу
    if (dsFilter['CHECK_ADRESS'] = 1) then
    begin
      if (not dsFilter.FieldByName('HOUSE_ID').IsNull) then
      begin
        tmpSQL := tmpSQL + Format(' and (e.House_Id = %d)', [dsFilter.FieldByName('HOUSE_ID').AsInteger])
      end
      else if (not dsFilter.FieldByName('Street_Id').IsNull) then
        tmpSQL := tmpSQL + Format(' and (S.STREET_ID = %s)', [dsFilter.FieldByName('Street_Id').AsString]);

      if (not dsFilter.FieldByName('PLACE').IsNull) and (dsFilter['PLACE'] <> '') then
        tmpSQL := tmpSQL + Format(' and (e.PLACE  = ''%s'')', [dsFilter.FieldByName('PLACE').AsString]);

      if (not dsFilter.FieldByName('PORCH').IsNull) and (dsFilter['PORCH'] <> '') then
        tmpSQL := tmpSQL + Format(' and (e.PORCH_N  = ''%s'')', [dsFilter.FieldByName('PORCH').AsString]);

      if (not dsFilter.FieldByName('FLOOR').IsNull) and (dsFilter['FLOOR'] <> '') then
        tmpSQL := tmpSQL + Format(' and (e.FLOOR_N  = ''%s'')', [dsFilter.FieldByName('FLOOR').AsString]);

      if (not dsFilter.FieldByName('SUBAREA_ID').IsNull) then
        tmpSQL := tmpSQL + Format(' and (h.SUBAREA_ID  = %s)', [dsFilter.FieldByName('SUBAREA_ID').AsString]);

      if (not dsFilter.FieldByName('AREA_ID').IsNull) then
        tmpSQL := tmpSQL + Format(' and (S.AREA_ID = %s) ', [dsFilter.FieldByName('AREA_ID').AsString]);
    end;

    if (not dsFilter.FieldByName('Eq_Type').IsNull) then
      tmpSQL := tmpSQL + Format(' and (e.Eq_Type = %d)', [dsFilter.FieldByName('Eq_Type').AsInteger]);

    if (not dsFilter.FieldByName('NAME').IsNull) then begin
      s := dsFilter['NAME'];
      if s.Contains('%') or s.Contains('_')  then
        s := 'E.Name like ''%s'''
      else
        s := 'E.Name = ''%s''';
      if (dsFilter['NOT_NAME'] = 1) then
        s:= 'not '+s;
      tmpSQL := tmpSQL + Format(' and ('+s+')', [dsFilter.FieldByName('NAME').AsString]);
    end;

    if (not dsFilter.FieldByName('NODE_ID').IsNull) then
      tmpSQL := tmpSQL + Format(' and (E.NODE_ID = %s)', [dsFilter.FieldByName('NODE_ID').AsString]);

    // if (not dsFilter.FieldByName('NODE_TYPE').IsNull) then
    // tmpSQL := tmpSQL + Format(' and ( n.TYPE_ID = %s) ', [dsFilter.FieldByName('NODE_TYPE').AsString]);

    if (tmpSQL <> '') then
      Result := TrimAnd(tmpSQL)
    else
      Result := filter_1_1;

    if dsFilter['inversion'] then
      Result := Format(' NOT (%s)', [Result]);
  end;

var
  whereStr: string;
begin
  whereStr := '';

  if (not dsFilter.Active) or (dsFilter.RecordCount = 0) then
    SetDefaultFilter;

  try
    dsFilter.First;

    whereStr := '';
    while not dsFilter.Eof do
    begin
      whereStr := whereStr + ' ( ' + RecordToFilter + ' ) ';
      // проверим, если ограничение одной записи и фильтр по квартире. то скинем ограничение
      dsFilter.next;
      if not dsFilter.Eof then
        if dsFilter['next_condition'] = 0 then
          whereStr := whereStr + ' OR '
        else
          whereStr := whereStr + ' AND '
    end;
  except
    whereStr := '';
    ShowMessage(rsErrorSetFilter);
  end;

  if not whereStr.IsEmpty then
    Result := whereStr
  else
    Result := filter_1_1;
end;

procedure TEquipmentForm.UpdateInfoPanel;
begin
  ShowPage(IndexToPage(lstForms.ItemIndex));
end;

procedure TEquipmentForm.SetDefaultFilter;
var
  f: string;
begin
  dsFilter.Close;
  dsFilter.Open;
  dsFilter.EmptyTable;
  f := A4MainForm.GetUserFilterFolder + 'eqpmnt_default.jnf';
  if FileExists(f) then
  begin
    if dsFilter.State in [dsEdit, dsInsert] then
      dsFilter.Post;
    DatasetFromJson(dsFilter, f);
  end;
end;

procedure TEquipmentForm.SetFilter(const filter: string);
begin
  srcDataSource.DataSet.DisableControls;

  if FInTreeView or FinGroupView then
    mtEQ.Close;

  if dsEquipments.Active then
    dsEquipments.Close;
  if (not filter.IsEmpty) then
  begin
    dsEquipments.ParamByName('Filter').Value := filter;
    try
      dsEquipments.Open;
    except
      ShowMessage(rsErrorFilter);
      if dsEquipments.Active then
        dsEquipments.Close;
      dsEquipments.ParamByName('Filter').Clear;
    end;
  end
  else
  begin
    dsEquipments.ParamByName('Filter').Clear;
  end;
  if (not dsEquipments.Active) then
    dsEquipments.Open;

  if FInTreeView or FinGroupView then
    mtEQ.Open;

  srcDataSource.DataSet.EnableControls;
  UpdateInfoPanel;
end;

function TEquipmentForm.GetOrderColumns: String;
var
  s: string;
  i, J: Integer;
  fn: string;
begin
  if not FInTreeView then
  begin
    J := dbGrid.SortMarkedColumns.Count;
    s := ' ';
    for i := 0 to pred(J) do
    begin
      fn := AnsiUpperCase(dbGrid.SortMarkedColumns[i].FieldName);
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
        s := s + dbGrid.SortMarkedColumns[i].FieldName;
      // s := s + ' COLLATE UNICODE_CI_AI ';
      if dbGrid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
        s := s + ' desc';
      if i <> pred(J) then
        s := s + ', ';
    end;
  end
  else
  begin
    // Работаем с MemTable
    J := dbGrid.SortMarkedColumns.Count;
    s := ' ';
    for i := 0 to pred(J) do
    begin
      s := s + dbGrid.SortMarkedColumns[i].FieldName;
      if dbGrid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
        s := s + ' desc';
      if i <> pred(J) then
        s := s + ', ';
    end;
  end;

  Result := s;
end;

procedure TEquipmentForm.SetFrozen(const v: Integer);
begin
  FFrozencols := v;

  if (dbGrid.Columns.Count >= FFrozencols) then
    dbGrid.FrozenCols := FFrozencols;
end;

end.
