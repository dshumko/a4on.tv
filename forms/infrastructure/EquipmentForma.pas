unit EquipmentForma;

interface

uses
  WinAPI.Windows, WinAPI.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Actions, System.UITypes,
  Data.DB, VCL.Forms, VCL.StdCtrls, VCL.ComCtrls, VCL.Mask, VCL.DBCtrls,
  VCL.Menus, VCL.ActnList, VCL.Dialogs, VCL.Grids,
  VCL.Buttons, VCL.ExtCtrls, VCL.ToolWin, VCL.Controls, VCL.Graphics,
  GridForma, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  DBGridEh, MemTableDataEh, PropFilerEh, PropStorageEh, DataDriverEh,
  pFIBDataDriverEh, MemTableEh, FIBDataSet, pFIBDataSet, DBCtrlsEh,
  DBLookupEh, CnErrorProvider, EhLibVCL, GridsEh, DBAxisGridsEh,
  EhLibFIB, EhLibMTE, FIBQuery, DBGridEhImpExp, PrjConst, A4onTypeUnit,
  AtrPages;

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
    actFindCustomer: TAction;
    btn1: TToolButton;
    chkGroup: TCheckBox;
    btnRefresh: TToolButton;
    btn2: TToolButton;
    actEditCustLan: TAction;
    actClone: TAction;
    N5: TMenuItem;
    actPAdd: TAction;
    actPEdit: TAction;
    pnlForms: TPanel;
    spl1: TSplitter;
    pnlDATA: TPanel;
    splMain: TSplitter;
    lstForms: TListBox;
    PropStorage: TPropStorageEh;
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
    procedure chkTREEClick(Sender: TObject);
    procedure dbGridSortMarkingChanged(Sender: TObject);
    procedure telnet1Click(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure miTreeCollapseClick(Sender: TObject);
    procedure miTreeExpandClick(Sender: TObject);
    procedure actNewChildExecute(Sender: TObject);
    procedure chkGroupClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure actCloneExecute(Sender: TObject);
    procedure dbGridColumns10GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure lstFormsClick(Sender: TObject);
  private
    FLastPage: TA4onPage;
    FAutoGen: Boolean; // автогенерация название
    FPageList: TA4onPages;
    FCanSave: Boolean;
    procedure SetGridTreeMode(const inTree: Boolean);
    procedure ShowPage(Page: TA4onPage);
    procedure UpdateCommands;
    procedure DoCreatePages;
    procedure StartCommand(Sender: TObject);
    procedure UpdatePage(Sender: TObject);
    function IndexToPage(Index: Integer): TA4onPage;
    procedure InitSecurity;
    procedure RefreshGridRecords;
  public
    { Public declarations }
  end;

var
  EquipmentForm: TEquipmentForm;

implementation

uses
  DM, MAIN, AtrCommon, AtrStrUtils, EquipAttributesForma,
  EquipCoverage, StrUtils, atrCmdUtils, RequestForma,
  EquipEditForma, TelnetForma, HtmlForma, pFIBQuery,
  CF, CustomerLanForma, EQPort,
  fmuEqpmntPorts, fmuEqpmntAttributes, fmuEqpmntRequests,
  fmuEqpmntRegion, fmuEqpmntInfo;

{$R *.dfm}

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
var
  i: Integer;
begin
  if (dsEquipments.Active) and (not dsEquipments.FieldByName('EID').IsNull) then
    i := dsEquipments['EID']
  else
    i := -1;
  dsEquipments.Close;
  dsEquipments.Open;
  if i > 0 then
    dsEquipments.Locate('EID', i, []);

  if Assigned(FLastPage) then
  begin
    FLastPage.CloseData;
    FLastPage.OpenData;
  end;
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
begin
  inherited;

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
  FPageList := TA4onPages.Create;
  FPageList.Add(TapgEqpmntInfo);
  FPageList.Add(TapgEqpmntAttributes);
  FPageList.Add(TapgEqpmntPort);
  FPageList.Add(TapgEqpmntRequests);
  FPageList.Add(TapgEqpmntRegion);

  FCanSave := true;
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
    srcDataSource.DataSet.Open;
    srcDataSource.DataSet.Locate('EID', id, []);
  end;
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
    dsEquipments.CloseOpen(True);
    dsEquipments.Locate('EID', id, []);
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
    mtEQ.Open;
    mtEQ.TreeList.Active := true;
    mtEQ.TreeList.DefaultNodeExpanded := true;
    FCanSave := False;
  end
  else
  begin
    srcDataSource.DataSet := dsEquipments;
    mtEQ.Close;
    dsEquipments.Open;
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
    else begin
      mtEQ.TreeList.Locate('EID', id, []);
      // mtEQ.TreeList.E
    end;
  end;
  dbGrid.SetFocus;
end;

procedure TEquipmentForm.chkTREEClick(Sender: TObject);
begin
  SetGridTreeMode(chkTREE.Checked);
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
  finally
    Screen.Cursor := cr;
  end;

end;

procedure TEquipmentForm.actEditExecute(Sender: TObject);
var
  bm: TBookmark;
  ci: TCustomerInfo;
  Fltrd : Boolean;
  Fltr : String;
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
      dsEquipments.Refresh;
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

procedure TEquipmentForm.FormShow(Sender: TObject);
var
  i: Integer;
  s: string;
begin
  inherited;

  dbGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbGrdEqpmnt',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
  dbGridSortMarkingChanged(dbGrid);
  if not dsEquipments.Active then
    dsEquipments.Open;

  InitSecurity;
  DoCreatePages;
  if FPageList.Count > 0 then
  begin
    lstForms.ItemIndex := 0;
    ShowPage(IndexToPage(0));
  end;

  UpdateCommands;
end;

procedure TEquipmentForm.InitSecurity;
begin
  // права пользователей
  actNew.Enabled := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment));
  actDelete.Enabled := actNew.Enabled;
  actEdit.Enabled := actNew.Enabled;

  actEditCustLan.Visible := dmMain.AllowedAction(rght_Customer_full) or dmMain.AllowedAction(rght_Customer_EditLan);

  chkTREE.Checked := (dmMain.GetIniValue('EQUIPMENTASTREE') = '1');
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
    srcDataSource.DataSet.Open;
    srcDataSource.DataSet.Locate('EID', id, []);
  end;
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

end.
