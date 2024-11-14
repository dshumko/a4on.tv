unit NodesForma;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.UITypes, System.Classes, System.SysUtils, System.Actions, System.Variants,
  Data.DB,
  Vcl.Menus, Vcl.ActnList, Vcl.Controls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Forms, Vcl.Graphics, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Dialogs,
  DBGridEh, ToolCtrlsEh, GridsEh, DBCtrlsEh, DBLookupEh, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, AtrPages,
  FIBQuery,
  pFIBQuery, DBGridEhToolCtrls, PropFilerEh, frxClass, frxDBSet, PropStorageEh, VKDBFDataSet, DBAxisGridsEh,
  MemTableDataEh,
  MemTableEh, PrjConst, EhLibVCL, DBGridEhGrouping, DynVarsEh, CnErrorProvider, DataDriverEh, pFIBDataDriverEh,
  amSplitter;

type
  TNodesForm = class(TForm)
    pnlForms: TPanel;
    pnlDATA: TPanel;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsNodes: TpFIBDataSet;
    srcNodes: TDataSource;
    pnl1: TPanel;
    lstForms: TListBox;
    spl1: TSplitter;
    ActListNodes: TActionList;
    actNodeAdd: TAction;
    actNodeEdit: TAction;
    actNodeDelete: TAction;
    ActSetFilter: TAction;
    actEnableFilter: TAction;
    actRequest: TAction;
    actQuickFilter: TAction;
    actAddressSearch: TAction;
    ActionRefresh: TAction;
    actSelectAll: TAction;
    actCopy: TAction;
    actSaveAs: TAction;
    actSetFilterNew: TAction;
    mmMenu: TMainMenu;
    N18: TMenuItem;
    N19: TMenuItem;
    N21: TMenuItem;
    N20: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N48: TMenuItem;
    miAbonent: TMenuItem;
    N35: TMenuItem;
    N30: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N38: TMenuItem;
    mimap: TMenuItem;
    N50: TMenuItem;
    N52: TMenuItem;
    dbgNodes: TDBGridEh;
    actlstSearch: TActionList;
    actFilterSearchText: TAction;
    actSearchNext: TAction;
    actSearchPrev: TAction;
    gridPopUp: TPopupMenu;
    N11: TMenuItem;
    N13: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    ppmCopy: TMenuItem;
    ppmSelectAll: TMenuItem;
    ppmSaveSelection: TMenuItem;
    pmFilters: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    pmFilter: TPopupMenu;
    N53: TMenuItem;
    PropStorage: TPropStorageEh;
    splMain: TSplitter;
    N17: TMenuItem;
    N39: TMenuItem;
    miExport: TMenuItem;
    N31: TMenuItem;
    N36: TMenuItem;
    N42: TMenuItem;
    pnlBtns: TPanel;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    tlbSearch: TToolBar;
    btnFilterSearchText: TToolButton;
    btnSearchNext: TToolButton;
    btnSearchPrev: TToolButton;
    edtSearch: TDBEditEh;
    pnlToolBars: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton16: TToolButton;
    ToolButton13: TToolButton;
    ToolButton12: TToolButton;
    ToolButton17: TToolButton;
    dsFilter: TMemTableEh;
    mniN28: TMenuItem;
    mniFilterFLD: TMenuItem;
    chkFldOnly: TCheckBox;
    dsStreets: TpFIBDataSet;
    srcStreet: TDataSource;
    dsHomes: TpFIBDataSet;
    srcHouse: TDataSource;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton8: TToolButton;
    pnlSearchAddress: TPanel;
    Label1: TLabel;
    lcbStreets: TDBLookupComboboxEh;
    lcbHOUSE: TDBLookupComboboxEh;
    Label2: TLabel;
    pnlEdit: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    btnSaveLink: TBitBtn;
    btnCancelLink: TBitBtn;
    cbbTYPE_ID: TDBLookupComboboxEh;
    mmoNOTICE: TDBMemoEh;
    CnErrors: TCnErrorProvider;
    lbl4: TLabel;
    cbbSTREET_ID: TDBLookupComboboxEh;
    lbl5: TLabel;
    cbbHOUSE_ID: TDBLookupComboboxEh;
    lbl6: TLabel;
    edtPlace: TDBEditEh;
    lbl7: TLabel;
    edtPORCH_N: TDBEditEh;
    lbl8: TLabel;
    edtFLOOR_N: TDBEditEh;
    edtLon: TDBNumberEditEh;
    btnMap: TSpeedButton;
    lbl10: TLabel;
    edtLat: TDBNumberEditEh;
    lbl9: TLabel;
    lbl11: TLabel;
    edtNAME: TDBEditEh;
    srcNodeType: TDataSource;
    dsNodeType: TpFIBDataSet;
    trReadQ: TpFIBTransaction;
    qCheck: TpFIBQuery;
    actTask: TAction;
    lbl12: TLabel;
    cbbPARENT: TDBLookupComboboxEh;
    dsParentNode: TpFIBDataSet;
    trReadParent: TpFIBTransaction;
    srcParent: TDataSource;
    btn1: TToolButton;
    chkTREE: TCheckBox;
    mtNodes: TMemTableEh;
    drvNodes: TpFIBDataDriverEh;
    miTreeBreak: TMenuItem;
    miTreeExpand: TMenuItem;
    miTreeCollapse: TMenuItem;
    actLinkNodes: TAction;
    miN2: TMenuItem;
    miLinkNodes: TMenuItem;
    miLinkNodes1: TMenuItem;
    procedure lstFormsClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchEnter(Sender: TObject);
    procedure edtSearchExit(Sender: TObject);
    procedure edtSearchKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actFilterSearchTextExecute(Sender: TObject);
    procedure actSearchNextExecute(Sender: TObject);
    procedure actSearchPrevExecute(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dbgNodesSortMarkingChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActSetFilterExecute(Sender: TObject);
    procedure actQuickFilterExecute(Sender: TObject);
    procedure actSetFilterNewExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure actAddressSearchExecute(Sender: TObject);
    procedure actRequestExecute(Sender: TObject);
    procedure actEnableFilterExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
    procedure actSaveAsExecute(Sender: TObject);
    procedure actNodeEditExecute(Sender: TObject);
    procedure actNodeAddExecute(Sender: TObject);
    procedure actNodeDeleteExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actFilterFLDExecute(Sender: TObject);
    procedure chkFldOnlyClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lcbFLATChange(Sender: TObject);
    procedure lcbHOUSEChange(Sender: TObject);
    procedure lcbStreetsChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    function frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure N10Click(Sender: TObject);
    procedure dsNodesAfterOpen(DataSet: TDataSet);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure OnAddressChange(Sender: TObject);
    procedure edtNAMEKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtNAMEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actTaskExecute(Sender: TObject);
    procedure dbgNodesDblClick(Sender: TObject);
    procedure chkTREEClick(Sender: TObject);
    procedure miTreeExpandClick(Sender: TObject);
    procedure miTreeCollapseClick(Sender: TObject);
    procedure dbgNodesGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
    procedure dbgNodesGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure dbgNodesSelectedRowsItemChanged(Sender: TCustomDBGridEh; Item: TArray<System.Byte>;
      Action: TListNotification);
    procedure actLinkNodesExecute(Sender: TObject);
    procedure dsFilterNewRecord(DataSet: TDataSet);
    procedure PropStorageWriteCustomProps(Sender: TObject; Writer: TPropWriterEh);
    procedure PropStorageReadProp(Sender: TObject; Reader: TPropReaderEh; const PropName: string;
      var Processed: Boolean);
  private
    FLastPage: TA4onPage;
    FSavedPageIndex: Integer;
    FAutoGen: Boolean; // автогенерация название
    FPageList: TA4onPages;
    FullAccess: Boolean;
    FinEditMode: Boolean;
    FCanSave: Boolean;
    FEnterSecondPress: Boolean;
    FAddressFilter: Boolean;
    FStreetID: Integer;
    FHouseID: Integer;
    function GenerateFilter: string;
    procedure ShowPage(Page: TA4onPage);
    procedure UpdateCommands;
    procedure DoCreatePages;
    procedure StartCommand(Sender: TObject);
    procedure UpdatePage(Sender: TObject);
    function IndexToPage(Index: Integer): TA4onPage;
    function GetOrderClause(grid: TCustomDBGridEh): string;
    procedure InitSecurity;
    procedure UpdateInfoPanel;
    procedure SwitchIfoTab(const next: Boolean);
    procedure StartSearchAddress;
    procedure StopSearchAddress;
    procedure SetAddressFilter();
    procedure RefreshGridRecords;
    procedure StartEdit(const New: Boolean = False);
    procedure StopEdit(const Cancel: Boolean);
    procedure SaveNode;
    procedure GenNodeName();
    function CheckNodeExists(const nid: Integer; const hid: Integer; const tid: Integer; const pn: string;
      const fn: string; const pl: string): Integer;
    procedure SetEditMode(const isEdit: Boolean; const isNew: Boolean = False);
  public
    procedure SetDefaultFilter;
    procedure SetFilter(const FilterFIELD: Integer; const FilterVALUE: string);
  end;

var
  NodesForm: TNodesForm;

implementation

uses
  System.DateUtils, System.StrUtils,
  A4onTypeUnit, AtrCommon, MAIN, DM, CustomerForma, DBGridEhFindDlgs, SelectColumnsForma, ExportSettingsForma,
  TextEditForma,
  SendMessagesForma, fs_iinterpreter, RecourseForma, RequestNewForma, NodesFilter, AtrStrUtils,
  RxStrUtils,
  EhLibFIB, pFIBProps, fmuNodeRequests, fmuNodeAttributes, fmuNodeFiles, fmuNodeCIRCUIT, fmuNodeFlats,
  fmuNodeMaterialsMove,
  fmuNodeLayout, fmuNodeMaterials, fmuNodeAppl, fmuNodeLink, NodeLinkForma;

{$R *.dfm}

procedure TNodesForm.DoCreatePages;
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
      Item.Page := Item.PageClass.CreatePageGrid(Self, dbgNodes);
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

procedure TNodesForm.dbgNodesDblClick(Sender: TObject);
begin
  if not srcNodes.DataSet.Active then
    Exit;
  if srcNodes.DataSet.RecordCount <> 0 then
    actNodeEdit.Execute
  else
    actNodeAdd.Execute;
end;

procedure TNodesForm.dbgNodesGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if not srcNodes.DataSet.FieldByName('COLOR').IsNull then
  begin
    try
      Background := StringToColor(srcNodes.DataSet.FieldByName('COLOR').Value);
    except
      Background := clWindow;
    end;
  end
  else
    Background := clWindow;
end;

procedure TNodesForm.dbgNodesGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
  var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
var
  i: Integer;
begin
  if (DataCol = 1) and (Row = 0) then
  begin
    i := (Sender as TDBGridEh).SelectedRows.Count;
    if i > 1 then
      Text := IntToStr(i);
  end;
end;

procedure TNodesForm.dbgNodesSelectedRowsItemChanged(Sender: TCustomDBGridEh; Item: TArray<System.Byte>;
  Action: TListNotification);
begin
  actLinkNodes.Visible := actLinkNodes.Enabled and (Sender.Selection.Rows.Count = 2);
end;

procedure TNodesForm.dbgNodesSortMarkingChanged(Sender: TObject);
var
  cr: TCursor;
  s: string;
  grid: TCustomDBGridEh;
  id: Integer;
  FIBDS: TpFIBDataSet;
  beOpened: Boolean;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  grid := TCustomDBGridEh(Sender);
  FIBDS := TpFIBDataSet(grid.DataSource.DataSet);
  id := -1;
  if Sender is TCustomDBGridEh then
  begin
    beOpened := FIBDS.Active;
    if beOpened then
    begin
      if not FIBDS.FieldByName('NODE_ID').IsNull then
        id := FIBDS['NODE_ID'];
      FIBDS.Close;
    end;

    s := GetOrderClause(grid);

    FIBDS.OrderClause := s;
    if beOpened then
    begin
      FIBDS.Open;
      if id <> -1 then
        FIBDS.Locate('NODE_ID', id, []);
    end;
  end;
  Screen.Cursor := cr;
end;

procedure TNodesForm.UpdateCommands;
begin
  //
end;

procedure TNodesForm.StartCommand(Sender: TObject);
begin
  //
end;

procedure TNodesForm.UpdatePage(Sender: TObject);
begin
  RefreshGridRecords;
  // srcNodes.DataSet.Refresh;
end;

procedure TNodesForm.ShowPage(Page: TA4onPage);
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

procedure TNodesForm.SpeedButton2Click(Sender: TObject);
begin
  ExecuteDBGridEhFindDialogProc(dbgNodes, edtSearch.Text, '', nil, False);
end;

procedure TNodesForm.FormActivate(Sender: TObject);
begin
  if srcNodes.DataSet.Active and FCanSave then
  begin
    srcNodes.DataSet.Refresh;
  end;
end;

procedure TNodesForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
  v: TfsCustomVariable;
begin
  if fsGlobalUnit <> nil then
  begin
    v := fsGlobalUnit.Find(Self.Name);
    if v <> nil then
      fsGlobalUnit.RemoveItems(Self);
  end;

  if FCanSave then
  begin
    for i := 0 to FPageList.Count - 1 do
      FPageList[i].Page.SaveState;
    dbgNodes.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'NodeGrid', False);
  end;

  FPageList.Free;
  NodesForm := nil;
  Action := caFree;
end;

procedure TNodesForm.FormCreate(Sender: TObject);
begin
  FSavedPageIndex := -1;
  with fsGlobalUnit do
  begin
    AddedBy := Self;
    AddForm(Self);
    AddedBy := nil;
  end;

  FPageList := TA4onPages.Create;
  FPageList.Add(TapgNodeFlats);
  FPageList.Add(TapgNodeRequests);
  FPageList.Add(TapgNodeAttributes);
  FPageList.Add(TapgNodeLayout);
  FPageList.Add(TapgNodeFiles);
  FPageList.Add(TapgNodeLink);
  FPageList.Add(TapgNodeCIRCUIT);
  FPageList.Add(TapgNodeMaterialsMove);
  FPageList.Add(TapgNodeMaterials); // ошибка отрисовки. не решил еще
  FPageList.Add(TapgNodeAppl);

  FCanSave := True;
end;

procedure TNodesForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (not FinEditMode) and (Shift = [ssAlt]) and ((Ord(Key) = VK_UP) or (Ord(Key) = VK_DOWN)) then
  begin
    SwitchIfoTab((Ord(Key) = VK_DOWN));
    Key := 0;
  end;
end;

procedure TNodesForm.FormShow(Sender: TObject);
var
  cr: TCursor;
  s: string;
  i: Integer;
  Font_size: Integer;
  Font_name: string;
  Row_height: Integer;
begin
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;

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
      if Font_size <> 0 then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;

      if Row_height <> 0 then
      begin
        (Components[i] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[i] as TDBGridEh).RowHeight := Row_height;
      end;
    end
    else if Font_size <> 0 then
    begin
      if (Components[i] is TMemo) then
      begin
        (Components[i] as TMemo).Font.Name := Font_name;
        (Components[i] as TMemo).Font.Size := Font_size;
      end
      else if (Components[i] is TDBMemoEh) then
      begin
        (Components[i] as TDBMemoEh).Font.Name := Font_name;
        (Components[i] as TDBMemoEh).Font.Size := Font_size;
      end
      else if (Components[i] is TDBMemo) then
      begin
        (Components[i] as TDBMemo).Font.Name := Font_name;
        (Components[i] as TDBMemo).Font.Size := Font_size;
      end;
    end;
  end;

  dbgNodes.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'NodeGrid',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);

  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  if not TryStrToInt(dmMain.GetIniValue('FETCHALL'), i) then
    i := 0;

  if (i = 0) then
    dsNodes.Options := dsNodes.Options - [poFetchAll];

  // dsNodes.ParamByName('Filter').value := GenerateFilter;
  s := GetOrderClause(TCustomDBGridEh(dbgNodes));
  if dsNodes.Active then
    dsNodes.Close;
  dsNodes.OrderClause := s;
  dsNodes.Open;

  Screen.Cursor := cr;

  InitSecurity;
  DoCreatePages;
  if FPageList.Count > 0 then
  begin
    if FSavedPageIndex < 0 then
      FSavedPageIndex := 0;
    lstForms.ItemIndex := FSavedPageIndex;
    ShowPage(IndexToPage(FSavedPageIndex));
  end;

  UpdateCommands;

  FinEditMode := False;
end;

procedure TNodesForm.edtNAMEKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FAutoGen := (edtNAME.Text = '');
end;

procedure TNodesForm.edtNAMEKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  FAutoGen := (edtNAME.Text = '');
end;

procedure TNodesForm.edtSearchChange(Sender: TObject);
  procedure FindOnFildOnly;
  var
    NesSs: string;
    f: string;
    bm: TBookMark;
    v: Extended;
  begin
    NesSs := edtSearch.Text;
    // Если ищем в цифровых полях, а ввели не цифры, то выйдем
    if (dbgNodes.Columns[dbgNodes.SelectedIndex].Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency,
      ftBCD]) then
      if not TryStrToFloat(NesSs, v) then
        Exit;

    dbgNodes.DataSource.DataSet.DisableControls;
    bm := dbgNodes.DataSource.DataSet.GetBookmark;
    try
      dbgNodes.DataSource.DataSet.First;
      if not srcNodes.DataSet.Locate(dbgNodes.Columns[dbgNodes.SelectedIndex].FieldName, VarArrayOf([NesSs]),
        [loPartialKey, loCaseInsensitive]) then
        dbgNodes.DataSource.DataSet.GotoBookmark(bm);
      dbgNodes.DataSource.DataSet.EnableControls;
    except
      dbgNodes.DataSource.DataSet.GotoBookmark(bm);
    end;

    f := Copy(dbgNodes.Columns[dbgNodes.SelectedIndex].DisplayText, 1, Length(edtSearch.Text));
    if (AnsiUpperCase(f) <> AnsiUpperCase(NesSs)) then
      edtSearch.Font.Color := clRed
    else
      edtSearch.Font.Color := clWindowText;
  end;

begin
  if not srcNodes.DataSet.Active then
    Exit;

  if chkFldOnly.Checked then
    FindOnFildOnly
  else
  begin
    dbgNodes.SearchPanel.SearchingText := edtSearch.Text;
    dbgNodes.SearchPanel.RestartFind;
    if edtSearch.Text <> '' then
      actFilterSearchText.ImageIndex := 5
    else
      actFilterSearchText.ImageIndex := 2;
  end;

end;

procedure TNodesForm.edtSearchEnter(Sender: TObject);
begin
  dbgNodes.SearchPanel.Active := True;
end;

procedure TNodesForm.edtSearchExit(Sender: TObject);
begin
  dbgNodes.SearchPanel.Active := False;
end;

procedure TNodesForm.edtSearchKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i: Integer;
  ctrlpressed: Boolean;
begin
  if not chkFldOnly.Checked then
  begin
    i := dbgNodes.SearchPanel.FoundColumnIndex;
    ctrlpressed := ssCtrl in Shift;
    if i >= 0 then
    begin
      case Key of
        VK_RETURN:
          begin
            if ctrlpressed then
              actFilterSearchText.Execute
            else
              dbgNodes.SetFocus
          end;
        VK_DOWN:
          actSearchNext.Execute;
        VK_UP:
          actSearchPrev.Execute;
      end;
    end;
  end;
end;

procedure TNodesForm.lstFormsClick(Sender: TObject);
begin
  ShowPage(IndexToPage(lstForms.ItemIndex));
end;

procedure TNodesForm.miTreeCollapseClick(Sender: TObject);
begin
  mtNodes.TreeList.FullCollapse;
end;

procedure TNodesForm.miTreeExpandClick(Sender: TObject);
begin
  mtNodes.TreeList.FullExpand;
end;

function TNodesForm.IndexToPage(Index: Integer): TA4onPage;
begin
  if (Index < 0) or (Index >= FPageList.Count) then
    raise Exception.Create('Invalid page index');
  Result := FPageList[Index].Page;
end;

procedure TNodesForm.actAddressSearchExecute(Sender: TObject);
begin
  if not actAddressSearch.Checked then
    StartSearchAddress
  else
    StopSearchAddress;
end;

procedure TNodesForm.StartSearchAddress;
begin
  if (actAddressSearch.Tag <> 1) and (dmMain.GetIniValue('FETCHALL') = '0') then
  begin
    if srcNodes.DataSet is TpFIBDataSet then
    begin
      dsNodes.Options := dsNodes.Options + [poFetchAll];
      dsNodes.CloseOpen(True);
      actAddressSearch.Tag := 1;
    end;
  end;

  actAddressSearch.Checked := True;
  pnlSearchAddress.Visible := True;
  FAddressFilter := True;
  lcbStreets.SetFocus;
  dsStreets.Open;
end;

procedure TNodesForm.StopSearchAddress;
var
  bm: TBookMark;
begin
  FAddressFilter := False;
  pnlSearchAddress.Visible := False;
  actAddressSearch.Checked := False;

  if dsHomes.Active then
    dsHomes.Close;
  if dsStreets.Active then
    dsStreets.Close;

  bm := NodesForm.dbgNodes.DataSource.DataSet.GetBookmark;
  dbgNodes.DataSource.DataSet.filter := '';
  dbgNodes.DataSource.DataSet.Filtered := False;
  dbgNodes.DataSource.DataSet.GotoBookmark(bm);

  dbgNodes.SetFocus;
end;

procedure TNodesForm.actCopyExecute(Sender: TObject);
var
  dbg: TDBGridEh;
begin

  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
      begin
        A4MainForm.CopyDBGrid(dbg);
      end
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TNodesForm.actLinkNodesExecute(Sender: TObject);
var
  LinkItem, SecondItem: TNodeLinkItem;
begin
  if ((not dsNodes.Active) or (dsNodes.RecordCount = 0)) then
    Exit;

  if (dbgNodes.SelectedRows.Count <> 2) then
    Exit;

  dbgNodes.DataSource.DataSet.Bookmark := dbgNodes.SelectedRows[0];
  LinkItem.NODE_ID := dbgNodes.DataSource.DataSet['NODE_ID'];
  LinkItem.NODE_Name := dbgNodes.DataSource.DataSet['NAME'];
  LinkItem.LINK_ID := -1;

  dbgNodes.DataSource.DataSet.Bookmark := dbgNodes.SelectedRows[0];
  LinkItem.NODE_ID := dbgNodes.DataSource.DataSet['NODE_ID'];
  LinkItem.LINK_ID := -1;

  dbgNodes.DataSource.DataSet.Bookmark := dbgNodes.SelectedRows[1];
  SecondItem.NODE_ID := dbgNodes.DataSource.DataSet['NODE_ID'];
  SecondItem.NODE_Name := dbgNodes.DataSource.DataSet['NAME'];
  SecondItem.LINK_ID := -1;

  if LinkNodes(LinkItem, SecondItem) then
  begin
    if (rsClmnLink = FPageList[lstForms.ItemIndex].PageClass.GetPageName) then
      FPageList[lstForms.ItemIndex].Page.UpdateObject;
  end
end;

procedure TNodesForm.actNodeAddExecute(Sender: TObject);
begin
  StartEdit(True);
end;

procedure TNodesForm.actNodeDeleteExecute(Sender: TObject);
var
  i: Integer;
  s: string;
  all: Boolean;
  Save_Cursor: TCursor;
begin
  if (srcNodes.DataSet.RecordCount = 0) then
    Exit;

  if MessageDlg(rsDeleteNodeWarning, mtConfirmation, [mbYes, mbNo], 0, mbNo) <> mrYes then
    Exit;

  all := False;

  if (dbgNodes.SelectedRows.Count > 0) then
    all := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);

  if all then
  begin
    if MessageDlg(rsDeleteInfoAbout + IntToStr(dbgNodes.SelectedRows.Count) + rsNodesQ, mtConfirmation, [mbNo, mbYes],
      0) = mrNo then
      Exit;
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourGlass; { Show hourglass cursor }
    for i := 0 to dbgNodes.SelectedRows.Count - 1 do
    begin
      dbgNodes.DataSource.DataSet.Bookmark := dbgNodes.SelectedRows[i];
      srcNodes.DataSet.Delete;
    end;
    Screen.Cursor := Save_Cursor; { Always restore to normal }
  end
  else
  begin
    s := '';
    if not(srcNodes.DataSet.FieldByName('NAME').IsNull) then
      s := s + srcNodes.DataSet['NAME'];

    if MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbNo, mbYes], 0) = mrNo then
      Exit;
    srcNodes.DataSet.Delete;
  end;
end;

procedure TNodesForm.actNodeEditExecute(Sender: TObject);
begin
  StartEdit(False);
end;

procedure TNodesForm.actEnableFilterExecute(Sender: TObject);
begin
  if srcNodes.DataSet is TpFIBDataSet then
  begin
    actEnableFilter.Checked := not actEnableFilter.Checked;
    dsNodes.ParamByName('Filter').Value := GenerateFilter;
    dsNodes.CloseOpen(True);
  end;
end;

procedure TNodesForm.actFilterFLDExecute(Sender: TObject);
begin
  edtSearch.Text := dbgNodes.SelectedField.AsString;
  actFilterSearchText.Execute;
end;

procedure TNodesForm.actFilterSearchTextExecute(Sender: TObject);
var
  cr: TCursor;
begin
  if actFilterSearchText.Checked then
  begin
    actFilterSearchText.Checked := False;
    dbgNodes.SearchPanel.CancelSearchFilter;
    edtSearch.Text := '';
  end
  else
  begin
    if edtSearch.Text <> '' then
    begin
      cr := Screen.Cursor;
      Screen.Cursor := crSQLWait;
      try
        actFilterSearchText.Checked := True;
        dbgNodes.SearchPanel.ApplySearchFilter;
      finally
        Screen.Cursor := cr;
      end;
    end;
  end;
end;

procedure TNodesForm.ActionRefreshExecute(Sender: TObject);
begin
  RefreshGridRecords;
end;

procedure TNodesForm.RefreshGridRecords;
var
  i: Integer;
begin
  if (srcNodes.DataSet.Active) and (not srcNodes.DataSet.FieldByName('NODE_ID').IsNull) then
    i := srcNodes.DataSet['NODE_ID']
  else
    i := -1;
  srcNodes.DataSet.Close;
  srcNodes.DataSet.Open;
  if i > 0 then
    srcNodes.DataSet.Locate('NODE_ID', i, []);

  if Assigned(FLastPage) then
  begin
    FLastPage.CloseData;
    FLastPage.OpenData;
  end;
end;

procedure TNodesForm.actQuickFilterExecute(Sender: TObject);
begin
  actQuickFilter.Checked := not actQuickFilter.Checked;
  dbgNodes.STFilter.Visible := actQuickFilter.Checked;
  if not actQuickFilter.Checked then
    dbgNodes.DataSource.DataSet.Filtered := False;
end;

procedure TNodesForm.actRequestExecute(Sender: TObject);
var
  aNode: Integer;
begin
  if not srcNodes.DataSet.FieldByName('NODE_ID').IsNull then
    aNode := srcNodes.DataSet['NODE_ID']
  else
    aNode := -1;

  NewNodeRequest(aNode);
end;

procedure TNodesForm.actSaveAsExecute(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    A4MainForm.ExportDBGrid((ActiveControl as TDBGridEh), rsTable);
end;

procedure TNodesForm.actSearchNextExecute(Sender: TObject);
begin
  dbgNodes.SearchPanel.FindNext;
end;

procedure TNodesForm.actSearchPrevExecute(Sender: TObject);
begin
  dbgNodes.SearchPanel.FindPrev;
end;

procedure TNodesForm.actSelectAllExecute(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TNodesForm.ActSetFilterExecute(Sender: TObject);
var
  filter: string;
begin
  if not(srcNodes.DataSet is TpFIBDataSet) then
    Exit;

  filter := '';

  with TNodesFilterForm.Create(Application) do
    try
      if not dsFilter.Active then
        SetDefaultFilter;

      actEnableFilter.Checked := (ShowModal = mrOk);
      filter := GenerateFilter;
    finally
      Free;
    end;

  if (srcNodes.DataSet.Filtered) then
  begin
    srcNodes.DataSet.filter := '';
    srcNodes.DataSet.Filtered := False;
  end;

  if filter <> '' then
  begin
    dsNodes.Close;
    dsNodes.ParamByName('Filter').Value := filter;
    try
      dsNodes.Open;
    except
      ShowMessage(rsErrorFilter);
      dsNodes.Close;
      dsNodes.ParamByName('Filter').Clear;
      dsNodes.Open;
    end;
  end;
  UpdateInfoPanel;
  dbgNodes.SetFocus;
end;

procedure TNodesForm.actSetFilterNewExecute(Sender: TObject);
var
  filter: string;
begin
  if not(srcNodes.DataSet is TpFIBDataSet) then
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

  with TNodesFilterForm.Create(Application) do
    try
      if ShowModal = mrOk then
      begin
        actEnableFilter.Checked := True;
        filter := GenerateFilter;
      end;
    finally
      Free;
    end;

  if (dsNodes.Filtered) then
  begin
    dsNodes.filter := '';
    dsNodes.Filtered := False;
  end;

  if filter <> '' then
  begin
    dsNodes.Close;
    dsNodes.ParamByName('Filter').Value := filter;
    dsNodes.Open;
    UpdateInfoPanel;
  end;
end;

procedure TNodesForm.actTaskExecute(Sender: TObject);
begin
  if (dbgNodes.DataSource.DataSet.RecordCount = 0) or (dbgNodes.DataSource.DataSet.FieldByName('Node_Id').IsNull) then
    Exit;
  A4MainForm.MakeTask('N', dbgNodes.DataSource.DataSet.FieldByName('Node_Id').AsString);
end;

procedure TNodesForm.chkFldOnlyClick(Sender: TObject);
begin
  tlbSearch.Visible := not chkFldOnly.Checked;
end;

procedure TNodesForm.chkTREEClick(Sender: TObject);
var
  id: Integer;
begin
  inherited;
  if (srcNodes.DataSet.RecordCount >= 0) and (not srcNodes.DataSet.FieldByName('NODE_ID').IsNull) then
    id := srcNodes.DataSet['NODE_ID']
  else
    id := -666;

  if chkTREE.Checked then
  begin
    drvNodes.SelectSQL.Text := dsNodes.SQLs.SelectSQL.Text;
    drvNodes.DeleteSQL.Text := dsNodes.SQLs.DeleteSQL.Text;
    drvNodes.UpdateSQL.Text := dsNodes.SQLs.UpdateSQL.Text;
    drvNodes.InsertSQL.Text := dsNodes.SQLs.InsertSQL.Text;
    drvNodes.GetrecSQL.Text := dsNodes.SQLs.RefreshSQL.Text;

    mtNodes.TreeList.Active := True;
    mtNodes.TreeList.DefaultNodeExpanded := True;
    srcNodes.DataSet := mtNodes;
    FCanSave := False;
    if (dsNodes.Active) then
      dsNodes.Close;
  end
  else
  begin
    srcNodes.DataSet := dsNodes;
    if (mtNodes.Active) then
      mtNodes.Close;
  end;
  {
    chkGroup.Enabled := not chkTREE.Checked;
  }
  miTreeBreak.Visible := chkTREE.Checked;
  miTreeCollapse.Visible := chkTREE.Checked;
  miTreeExpand.Visible := chkTREE.Checked;

  srcNodes.DataSet.DisableControls;
  if not srcNodes.DataSet.Active then
    srcNodes.DataSet.Open;
  if id <> -666 then
    srcNodes.DataSet.Locate('NODE_ID', id, []);
  srcNodes.DataSet.EnableControls;
  dbgNodes.SetFocus;
end;

function TNodesForm.GetOrderClause(grid: TCustomDBGridEh): string;
var
  s: string;
  i, J: Integer;
begin
  J := grid.SortMarkedColumns.Count;
  s := ' ';
  for i := 0 to pred(J) do
  begin
    if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'STREET_NAME') then
      s := s + 'S.Street_Name||s.street_short'
    else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'HOUSE_NO') then
      s := s + 'H.HOUSE_NO '
    else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'NOTICE') then
      s := s + 'N.NOTICE'
    else
      s := s + grid.SortMarkedColumns[i].FieldName;
    // s := s + ' COLLATE UNICODE_CI_AI ';
    if grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
      s := s + ' desc';
    if i <> pred(J) then
      s := s + ', ';
  end;
  Result := s;
end;

function TNodesForm.GenerateFilter: string;

  function RecordToFilter: string;
  var
    tmpSQL: string;
  begin
    tmpSQL := '';

    // Условие отбора по адресу
    if (dsFilter['CHECK_ADRESS'] = 1) then
    begin
      if (not dsFilter.FieldByName('HOUSE_ID').IsNull) then
      begin
        if (dsFilter.FieldByName('FLAT').IsNull) then
          tmpSQL := tmpSQL + Format(' and (n.House_Id = %d)', [dsFilter.FieldByName('HOUSE_ID').AsInteger])
        else
        begin
          //
          tmpSQL := tmpSQL +
            Format(' and ( exists(select f.node_id from Node_Flats f where f.node_id = n.NODE_ID and f.Flat_No = ''%s'' and f.House_Id = %d))',
            [dsFilter.FieldByName('FLAT').AsString, dsFilter.FieldByName('HOUSE_ID').AsInteger])
        end;
      end
      else if (not dsFilter.FieldByName('Street_Id').IsNull) then
        tmpSQL := tmpSQL + Format(' and (S.STREET_ID = %s)', [dsFilter.FieldByName('Street_Id').AsString]);

      if (not dsFilter.FieldByName('PORCH').IsNull) and (dsFilter['PORCH'] <> '') then
        tmpSQL := tmpSQL + Format(' and (n.PORCH_N  = ''%s'')', [dsFilter.FieldByName('PORCH').AsString]);

      if (not dsFilter.FieldByName('FLOOR').IsNull) and (dsFilter['FLOOR'] <> '') then
        tmpSQL := tmpSQL + Format(' and (n.FLOOR_N  = ''%s'')', [dsFilter.FieldByName('FLOOR').AsString]);

      if (not dsFilter.FieldByName('SUBAREA_ID').IsNull) then
        tmpSQL := tmpSQL + Format(' and (h.SUBAREA_ID  = %s)', [dsFilter.FieldByName('SUBAREA_ID').AsString]);

      if (not dsFilter.FieldByName('AREA_ID').IsNull) then
        tmpSQL := tmpSQL + Format(' and ( S.AREA_ID = %s) ', [dsFilter.FieldByName('AREA_ID').AsString]);
    end;

    if (not dsFilter.FieldByName('NODE_TYPE').IsNull) then
      tmpSQL := tmpSQL + Format(' and ( n.TYPE_ID = %s) ', [dsFilter.FieldByName('NODE_TYPE').AsString]);

    if (not dsFilter.FieldByName('NODE_ID').IsNull) then
      tmpSQL := tmpSQL + Format(' and ( n.NODE_ID = %s) ', [dsFilter.FieldByName('NODE_ID').AsString]);

    if (tmpSQL <> '') then
      Result := TrimAnd(tmpSQL)
    else
      Result := filter_1_1;

    if dsFilter['inversion'] then
      Result := Format(' NOT (%s)', [Result]);
  end;

var
  whereStr: string;
  default: string;
begin
  default := filter_1_1;
  Result := default;
  whereStr := '';

  if (dsFilter.RecordCount = 0) or (not actEnableFilter.Checked) then
    Exit;
  srcNodes.DataSet.DisableControls;

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
    whereStr := default;
    ShowMessage(rsErrorSetFilter);
  end;

  Result := whereStr;
  srcNodes.DataSet.EnableControls;
end;

procedure TNodesForm.SetDefaultFilter;
var
  f: string;
begin
  dsFilter.Close;
  dsFilter.Open;
  dsFilter.EmptyTable;
  f := A4MainForm.GetUserFilterFolder + 'nodes_default.ftr';
  if FileExists(f) then
  begin
    if dsFilter.State in [dsEdit, dsInsert] then
      dsFilter.Post;
    DatasetFromJSON(dsFilter, f);
  end;

  if dsFilter.RecordCount > 0 then
    actEnableFilter.Checked := True;
end;

procedure TNodesForm.InitSecurity;
begin
  FullAccess := (dmMain.AllowedAction(rght_Comm_Nodes));
  // Экспорт информации
  actSaveAs.Visible := (dmMain.AllowedAction(rght_Export));
  miExport.Visible := (dmMain.AllowedAction(rght_Export));

  actNodeDelete.Enabled := dmMain.AllowedAction(rght_Comm_Nodes) or FullAccess;
  actNodeEdit.Enabled := dmMain.AllowedAction(rght_Comm_Nodes) or FullAccess;
  actNodeAdd.Enabled := dmMain.AllowedAction(rght_Comm_Nodes) or FullAccess;
  actLinkNodes.Enabled := dmMain.AllowedAction(rght_Comm_Nodes) or FullAccess;

  actRequest.Enabled := dmMain.AllowedAction(rght_Request_add) or dmMain.AllowedAction(rght_Request_full);
end;

procedure TNodesForm.dsFilterNewRecord(DataSet: TDataSet);
begin
  DataSet['inversion'] := False; // инверсия фильтра т.е. добавляем not
  DataSet['next_condition'] := 0; // следующее условие AND/OR
end;

procedure TNodesForm.dsNodesAfterOpen(DataSet: TDataSet);
begin
  if Assigned(FLastPage) then
  begin
    FLastPage.CloseData;
    FLastPage.OpenData;
  end;
end;

procedure TNodesForm.UpdateInfoPanel;
begin
  ShowPage(IndexToPage(lstForms.ItemIndex));
end;

procedure TNodesForm.SetFilter(const FilterFIELD: Integer; const FilterVALUE: string);
var
  cr: TCursor;
  val: TStringArray;
  i: Integer;
begin
  if not(srcNodes.DataSet is TpFIBDataSet) or (FilterFIELD < 1) then
    Exit;

  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    SetDefaultFilter;
    case FilterFIELD of
      1:
        begin // По квартире
          val := Explode('~', FilterVALUE);
          dsFilter.EmptyTable;
          dsFilter.Insert;
          dsFilter['CHECK_ADRESS'] := 1;
          dsFilter['HOUSE_ID'] := StrToInt(val[0]);
          dsFilter['FLAT'] := val[1];
          dsFilter.Post;
        end;
      2:
        begin // По ID узла
          if not TryStrToInt(FilterVALUE, i) then
            i := -999;
          dsFilter.EmptyTable;
          dsFilter.Insert;
          dsFilter['NODE_ID'] := i;
          dsFilter.Post;
        end;

    end;
    actEnableFilter.Checked := True;

    dsNodes.Close;
    dsNodes.ParamByName('Filter').Value := GenerateFilter;
    dsNodes.filter := '';
    dsNodes.Filtered := False;
    dsNodes.Open;
    UpdateInfoPanel;
  finally
    Screen.Cursor := cr;
  end;
  if dsNodes.RecordCount = 0 then
  begin
    actSetFilterNewExecute(Self);
  end
end;

procedure TNodesForm.btnCancelLinkClick(Sender: TObject);
begin
  StopEdit(True);
end;

procedure TNodesForm.btnSaveLinkClick(Sender: TObject);
var
  errors: Boolean;
  nid: Integer;
begin
  errors := False;

  if (cbbSTREET_ID.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(cbbSTREET_ID, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(cbbSTREET_ID);

  if (cbbHOUSE_ID.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(cbbHOUSE_ID, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(cbbHOUSE_ID);

  if (cbbTYPE_ID.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(cbbTYPE_ID, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(cbbTYPE_ID);

  if not errors then
  begin
    if srcNodes.DataSet.State = dsInsert then
    begin
      if not srcNodes.DataSet.FieldByName('NODE_ID').IsNull then
        nid := srcNodes.DataSet.FieldByName('NODE_ID').AsInteger
      else
        nid := -1;
      nid := CheckNodeExists(nid, cbbHOUSE_ID.Value, cbbTYPE_ID.Value, edtPORCH_N.Text, edtFLOOR_N.Text, edtPlace.Text);
      if nid <> -1 then
      begin
        if Application.MessageBox('Похожий узел уже существует. Создать узел?', 'Похожий узел',
          MB_YESNO + MB_ICONINFORMATION + MB_DEFBUTTON2) = IDNO then
        begin
          StopEdit(True);
          srcNodes.DataSet.Locate('NODE_ID', nid, []);
        end
        else
          SaveNode;
      end
      else
        SaveNode;
    end
    else
      SaveNode;
  end;
end;

function TNodesForm.CheckNodeExists(const nid: Integer; const hid: Integer; const tid: Integer; const pn: string;
  const fn: string; const pl: string): Integer;
begin
  Result := -1;
  qCheck.SQL.Text := 'select Node_Id from Nodes where House_Id = :House_Id';
  qCheck.SQL.Add('and Type_Id = :Type_Id');
  qCheck.ParamByName('House_Id').AsInteger := hid;
  qCheck.ParamByName('Type_Id').AsInteger := tid;
  if nid <> -1 then
  begin
    qCheck.SQL.Add('and Node_Id <> :Node_Id');
    qCheck.ParamByName('Node_Id').AsInteger := nid;
  end;
  if fn <> '' then
  begin
    qCheck.SQL.Add('and Floor_N = :Floor_N');
    qCheck.ParamByName('Floor_N').AsString := fn;
  end;
  if pn <> '' then
  begin
    qCheck.SQL.Add('and Porch_N = :Porch_N');
    qCheck.ParamByName('Porch_N').AsString := pn;
  end;
  if pl <> '' then
  begin
    qCheck.SQL.Add('and Place = :Place');
    qCheck.ParamByName('Place').AsString := pl;
  end;
  try
    qCheck.ExecQuery;
    if not qCheck.fn('Node_Id').IsNull then
      Result := qCheck.fn('Node_Id').AsInteger;
    qCheck.Close;
  except
    Result := -1;
  end;
end;

procedure TNodesForm.N10Click(Sender: TObject);
begin
  lstForms.ItemIndex := 1;
  ShowPage(IndexToPage(lstForms.ItemIndex));
end;

procedure TNodesForm.SwitchIfoTab(const next: Boolean);
var
  i: Integer;
begin
  i := lstForms.ItemIndex;
  if next then
  begin
    inc(i);
    if i = lstForms.Items.Count then
      i := 0;
  end
  else
  begin
    dec(i);
    if i = -1 then
      i := lstForms.Items.Count - 1;
  end;
  lstForms.ItemIndex := i;
  ShowPage(IndexToPage(lstForms.ItemIndex));
end;

procedure TNodesForm.SetAddressFilter();
var
  filter: string;
begin
  filter := '';
  if (actAddressSearch.Checked) then
  begin
    if VarIsNumeric(lcbHOUSE.KeyValue) then
    begin
      filter := 'HOUSE_ID = ' + IntToStr(lcbHOUSE.KeyValue);
    end
    else
    begin
      if VarIsNumeric(lcbStreets.KeyValue) then
      begin
        filter := 'STREET_ID = ' + IntToStr(lcbStreets.KeyValue);
        if not dsHomes.Active then
          dsHomes.Open;
      end
      else
      begin
        if dsHomes.Active then
          dsHomes.Close;
      end;
    end;
  end
  else
  begin
    if dsHomes.Active then
      dsHomes.Close;

    if dsStreets.Active then
      dsStreets.Close;
  end;

  lcbHOUSE.Enabled := VarIsNumeric(lcbStreets.Value);

  dbgNodes.DataSource.DataSet.DisableControls;
  dbgNodes.DataSource.DataSet.filter := filter;
  dbgNodes.DataSource.DataSet.Filtered := (filter <> '');
  dbgNodes.DataSource.DataSet.EnableControls;
end;

procedure TNodesForm.lcbHOUSEChange(Sender: TObject);
begin
  if actAddressSearch.Checked then
    SetAddressFilter();
end;

procedure TNodesForm.lcbFLATChange(Sender: TObject);
begin
  if actAddressSearch.Checked then
    SetAddressFilter();
end;

procedure TNodesForm.lcbStreetsChange(Sender: TObject);
begin
  lcbHOUSE.Value := NULL;
  if actAddressSearch.Checked then
    SetAddressFilter();
end;

procedure TNodesForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if not actAddressSearch.Checked then
    Exit;

  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := True;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBComboBoxEh) then
      go := not(ActiveControl as TDBComboBoxEh).ListVisible
      // else if (ActiveControl is TDBGridEh) then
      // go := False
      // else if (ActiveControl is TDBSynEdit) and not(Trim((ActiveControl as TDBSynEdit).Lines.Text) = '') then
      // go := False;
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

function TNodesForm.frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
begin
  Result := dmMain.frxReportUserFunction(MethodName, Params);
end;

procedure TNodesForm.StartEdit(const New: Boolean = False);
begin
  if not actNodeAdd.Enabled then
    Exit;

  if (not New) and (srcNodes.DataSet.RecordCount = 0) then
    Exit;

  FStreetID := -1;
  FHouseID := -1;

  if FAddressFilter then
  begin
    FStreetID := lcbStreets.Value;
    if (lcbHOUSE.Text <> '') then
      FHouseID := lcbHOUSE.Value
  end;

  if Assigned(FLastPage) then
  begin
    FLastPage.CloseData;
  end;

  dsHomes.Open;
  dsNodeType.Open;
  dsStreets.Open;
  dsParentNode.Open;

  SetEditMode(True, New);

  if New then
  begin
    srcNodes.DataSet.Insert;
    if FAddressFilter then
    begin
      if (FHouseID <> -1) then
        cbbSTREET_ID.Value := FStreetID;
      if (FHouseID <> -1) then
        cbbHOUSE_ID.Value := FHouseID;
    end;
  end
  else
    srcNodes.DataSet.Edit;
end;

procedure TNodesForm.SaveNode;
begin
  StopEdit(False);
end;

procedure TNodesForm.StopEdit(const Cancel: Boolean);
begin
  if (Cancel) or (not actNodeEdit.Enabled) then
  begin
    if (srcNodes.DataSet.State in [dsEdit, dsInsert]) then
      srcNodes.DataSet.Cancel
  end
  else
  begin
    if (srcNodes.DataSet.State in [dsEdit, dsInsert]) then
      srcNodes.DataSet.Post;
  end;

  if not FAddressFilter then
  begin
    dsHomes.Close;
    dsStreets.Close;
  end;

  dsNodeType.Close;
  dsParentNode.Close;

  SetEditMode(False, False);
  dbgNodes.SetFocus;

  if FAddressFilter then
  begin
    if not dsStreets.Active then
      dsStreets.Open;
    if (FHouseID <> -1) then
      lcbStreets.Value := FStreetID;
    if (FHouseID <> -1) then
    begin
      if not dsHomes.Active then
        dsHomes.Open;
      lcbHOUSE.Value := FHouseID;
    end;
  end;

end;

procedure TNodesForm.GenNodeName();
var
  s: string;
begin
  s := '';
  if not FAutoGen then
    Exit;

  if cbbSTREET_ID.Text = '' then
    Exit;

  if (dsNodeType.Active) and (not dsNodeType.FieldByName('O_DIMENSION').IsNull) and (dsNodeType['O_DIMENSION'] <> '')
  then
    s := dsNodeType['O_DIMENSION'] + '-';

  if (not dsStreets.FieldByName('STREET_CODE').IsNull) and (dsStreets['STREET_CODE'] <> '') then
    s := s + dsStreets['STREET_CODE'] + '-';

  s := s + cbbHOUSE_ID.Text + '-' + edtPORCH_N.Text + '-' + edtFLOOR_N.Text + '-' + edtPlace.Text;

  edtNAME.Text := s.Trim(['-']);
end;

procedure TNodesForm.OnAddressChange(Sender: TObject);
begin
  // если запрещено изменять имя, то выйдем
  if not FAutoGen then
    Exit;

  GenNodeName();
end;

procedure TNodesForm.PropStorageReadProp(Sender: TObject; Reader: TPropReaderEh; const PropName: string;
  var Processed: Boolean);
begin
  if PropName = 'LastPage' then
  begin
    FSavedPageIndex := Reader.ReadInteger();
    Processed := True;
  end;
end;

procedure TNodesForm.PropStorageWriteCustomProps(Sender: TObject; Writer: TPropWriterEh);
begin
  Writer.WritePropName('LastPage');
  if lstForms.Items.Count > 0 then
    Writer.WriteInteger(lstForms.ItemIndex)
  else
    Writer.WriteInteger(-1);
end;

procedure TNodesForm.SetEditMode(const isEdit: Boolean; const isNew: Boolean = False);
begin
  FinEditMode := isEdit;
  FAutoGen := isEdit and isNew;

  pnlEdit.Visible := FinEditMode;
  dbgNodes.Enabled := not FinEditMode;
  pnlBtns.Enabled := not FinEditMode;
  pnlForms.Enabled := not FinEditMode;
  pnlSearchAddress.Visible := not FinEditMode;

  if FinEditMode then
  begin
    cbbHOUSE_ID.OnChange := OnAddressChange;
    pnlEdit.SetFocus;
    PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
  end
  else
  begin
    cbbHOUSE_ID.OnChange := nil;
    UpdateInfoPanel;
  end;
end;

end.
