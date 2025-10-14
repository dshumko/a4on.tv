unit ReqMaterialsForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Math,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.ExtCtrls, Vcl.StdCtrls,
  FIBDataSet, pFIBDataSet, DBGridEh, EhLibFIB, OkCancel_frame, GridsEh, PropFilerEh, PropStorageEh, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, PrjConst,
  FIBDatabase, pFIBDatabase, amSplitter, Vcl.Tabs, MemTableDataEh,
  DataDriverEh, pFIBDataDriverEh, MemTableEh, Vcl.Menus;

type
  TReqMaterialsForm = class(TForm)
    pnlBottom: TPanel;
    pnlGrids: TPanel;
    dbGrid: TDBGridEh;
    srcDataSource: TDataSource;
    dsReqMaterials: TpFIBDataSet;
    OkCancelFrame1: TOkCancelFrame;
    srcMatGropups: TDataSource;
    Splitter1: TSplitter;
    PropStorage: TPropStorageEh;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    tsGroup: TTabSet;
    mtGroups: TMemTableEh;
    drvFibGroups: TpFIBDataDriverEh;
    dbGridGroups: TDBGridEh;
    pmTreeView: TPopupMenu;
    miFE: TMenuItem;
    miN1: TMenuItem;
    procedure dbGridExit(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure dsReqMaterialsBeforePost(DataSet: TDataSet);
    procedure srcDataSourceUpdateData(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OkCancelFrame1bbCancelClick(Sender: TObject);
    procedure dbGridGroupsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure tsGroupChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure miFEClick(Sender: TObject);
    procedure miN1Click(Sender: TObject);
  private
    { Private declarations }
    FReadOnly: Boolean;
    FRequest: Integer;
    FVisibleCost: Boolean;
    FGroupIndex: Integer;
    FROW_HL_WARNING: TColor;
    procedure SetRequest(const Value: Integer);
    procedure SetEditMode(const Value: Boolean);
    procedure SaveAndExit;
    procedure SetMatGroup(const GrpIndex: Integer);
    procedure TreeExpandBranch(const MG_ID: Integer);
  public
    { Public declarations }
    property ReadOnlyMode: Boolean read FReadOnly write SetEditMode;
    property pRequest: Integer read FRequest write SetRequest;
  end;

function ReqMaterials(const aRequest: Integer; const aReadOnly: Boolean = True): Boolean;

var
  ReqMaterialsForm: TReqMaterialsForm;

implementation

uses
  DM, MAIN;

{$R *.dfm}

function ReqMaterials(const aRequest: Integer; const aReadOnly: Boolean = True): Boolean;
var
  FWHOwner: Boolean;
begin
  result := false;
  with TReqMaterialsForm.Create(Application) do
    try
      ReadOnlyMode := aReadOnly;

      FWHOwner := (dmMain.GetSettingsValue('WH_REQ_OWNER') = '1');

      pRequest := aRequest;
      // if (FWHOwner and (not(dmMain.AllowedAction(rght_Materials_full) or dmMain.AllowedAction(rght_Dictionary_full))))
      if (FWHOwner and (not(dmMain.AllowedAction(rght_Materials_full)))) then
        dsReqMaterials.ParamByName('Rq_Owner').AsInteger := 1
      else
        dsReqMaterials.ParamByName('Rq_Owner').AsInteger := 0;

      dsReqMaterials.ParamByName('RQ_ID').AsInteger := aRequest;

      if ShowModal = mrOk then
        result := True;
    finally
      free
    end;
end;

procedure TReqMaterialsForm.SetRequest(const Value: Integer);
begin
  FRequest := Value;
end;

procedure TReqMaterialsForm.dbGridExit(Sender: TObject);
begin
  if (srcDataSource.DataSet.State in [dsInsert, dsEdit]) then
  begin
    srcDataSource.DataSet.Post;
  end;
end;

procedure TReqMaterialsForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if gdFocused in State then
  begin
    if (Column.ReadOnly) then
    begin
      if not(dghPreferIncSearch in dbGrid.OptionsEh) then
        dbGrid.OptionsEh := dbGrid.OptionsEh + [dghPreferIncSearch];
    end
    else
    begin
      if dghPreferIncSearch in dbGrid.OptionsEh then
        dbGrid.OptionsEh := dbGrid.OptionsEh - [dghPreferIncSearch];
    end;
  end
end;

procedure TReqMaterialsForm.dbGridGroupsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if not(Sender as TDBGridEh).DataSource.DataSet.Active then
    Exit;

  if (gdSelected in State) then
  begin
    AFont.Color := clHighlightText;
    Background := clHighlight;
  end
  else if (Sender as TDBGridEh).DataSource.DataSet['MG_ID'] = -1 then
    Background := FROW_HL_WARNING;
end;

procedure TReqMaterialsForm.dsReqMaterialsBeforePost(DataSet: TDataSet);
begin
  DataSet['RQ_ID'] := FRequest;
  if not DataSet.FieldByName('RM_QUANT').IsNull then
    DataSet['RM_QUANT'] := RoundTo(DataSet['RM_QUANT'], -5);
end;

procedure TReqMaterialsForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  dmMain.SetIniValue('BIDMATGROUPIDX', FGroupIndex.ToString);
  if (FGroupIndex = 0) and mtGroups.Active then begin
    if (not mtGroups.FieldByName('MG_ID').IsNull) and (mtGroups['MG_ID'] > 0) then
      dmMain.SetIniValue('BIDMATGROUPSEL', mtGroups.FieldByName('MG_ID').AsString);
  end;

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, false);
end;

procedure TReqMaterialsForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  if (dmMain.GetIniValue('BIDMATGROUPIDX') = '1') then
    FGroupIndex := 1
  else
    FGroupIndex := 0;
  FVisibleCost := dmMain.AllowedAction(rght_Material_Cost); // просмотр цены

  for i := 0 to dbGrid.Columns.Count - 1 do
  begin
    if dbGrid.Columns[i].FieldName = 'RM_COST' then
      dbGrid.Columns[i].Visible := FVisibleCost;
  end;
end;

procedure TReqMaterialsForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    SaveAndExit;
end;

procedure TReqMaterialsForm.FormShow(Sender: TObject);
var
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
      (Components[i] as TDBGridEh).RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
      if (Components[i] as TDBGridEh).DataSource.DataSet.Active then
        (Components[i] as TDBGridEh).DefaultApplySorting;
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
      end;
    end;
  end;

  try
    FROW_HL_WARNING := StringToColor(dmMain.GetSettingsValue('ROW_HL_WARNING'));
  except
    FROW_HL_WARNING := $0066FFFF;
  end;

  tsGroup.OnChange := nil;
  tsGroup.TabIndex := FGroupIndex;
  tsGroup.OnChange := tsGroupChange;
  SetMatGroup(FGroupIndex);
end;

procedure TReqMaterialsForm.miFEClick(Sender: TObject);
begin
  mtGroups.TreeList.FullExpand;
end;

procedure TReqMaterialsForm.miN1Click(Sender: TObject);
begin
  mtGroups.TreeList.FullCollapse;
end;

procedure TReqMaterialsForm.OkCancelFrame1bbCancelClick(Sender: TObject);
begin
  SaveAndExit;
end;

procedure TReqMaterialsForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  SaveAndExit;
end;

procedure TReqMaterialsForm.srcDataSourceUpdateData(Sender: TObject);
begin
  dsReqMaterials.DisableControls;
  if (dsReqMaterials['RM_QUANT'] <> 0) then
  begin
    if not(dsReqMaterials.FieldByName('RM_QUANT').IsNull) then
    begin
      if (dsReqMaterials['RM_QUANT'] > 0) then
      begin
        if (dsReqMaterials['RM_QUANT'] > dsReqMaterials['QUANT_TOTAL']) then
          dsReqMaterials['RM_QUANT'] := dsReqMaterials['QUANT_IN_REQUEST'];
      end
    end
  end
  else
  begin
    if not(dsReqMaterials.FieldByName('RM_QUANT').IsNull) then
    begin
      if (dsReqMaterials['RM_QUANT'] > 0) then
      begin
        if (dsReqMaterials.FieldByName('RM_QUANT').NewValue > dsReqMaterials['QUANT_TOTAL']) then
          dsReqMaterials.FieldByName('RM_QUANT').Value := dsReqMaterials['QUANT_TOTAL'];
      end
      else
        dsReqMaterials['RM_QUANT'] := 0;
    end;
  end;
  dsReqMaterials.EnableControls;
end;

procedure TReqMaterialsForm.tsGroupChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
begin
  SetMatGroup(NewTab);
end;

procedure TReqMaterialsForm.SetMatGroup(const GrpIndex: Integer);
var
  s : string;
begin
  mtGroups.Close;
  dsReqMaterials.Close;

  FGroupIndex := GrpIndex;
  if FGroupIndex = 1 then
  begin
    dbGridGroups.Columns[0].Title.Caption := 'Склад';
    with drvFibGroups.SelectSQL do
    begin
      Clear;
      Add('select -5 MG_ID, W.O_Name MG_NAME, -1 PARENT_ID, w.O_Description MG_NOTICE, w.O_Id FOR_WH_ID from OBJECTS W where W.O_TYPE = 10 and w.O_Deleted = 0');
    end
  end
  else
  begin
    dbGridGroups.Columns[0].Title.Caption := 'Группа';
    with drvFibGroups.SelectSQL do
    begin
      Clear;
      Add('select MG_ID, MG_NAME, PARENT_ID, MG_NOTICE, -2 GRP_WH_ID from MATERIALS_GROUP g  where coalesce(g.Deleted, 0) = 0');
      Add('union');
      Add('select null as MG_ID, '' БЕЗ ГРУППЫ'' MG_NAME, null as PARENT_ID, ''Материалы без группы'' as MG_NOTICE, -2 FOR_WH_ID from RDB$DATABASE where (exists(select m.M_Id from materials m where m.Mg_Id is null and m.DELETED = 0))');
      Add('union');
      Add('select -2 as MG_ID, ''  В ЗАЯВКЕ'' MG_NAME, null as PARENT_ID, ''Материалы выданы для заявки'' as MG_NOTICE, -2 FOR_WH_ID from RDB$DATABASE');
      Add('union');
      Add('select -1 as MG_ID, ''  ВСЕ МАТЕРИАЛЫ'' MG_NAME, null as PARENT_ID, ''Все материалы'' as MG_NOTICE, -2 FOR_WH_ID from RDB$DATABASE');
      // TODO: Сделать выкуп
      //Add('union');
      //Add('select -3 as MG_ID, ''  НА ВЫКУП '' MG_NAME, null as PARENT_ID, ''Оборудование у абонента в аренде для выкупа'' as MG_NOTICE, -2 FOR_WH_ID from RDB$DATABASE');
    end;
  end;
  drvFibGroups.SelectSQL.Add('order by 2');

  mtGroups.Open;
  mtGroups.Last;
  mtGroups.First;
  s := dmMain.GetIniValue('BIDMATGROUPSEL');
  if (s <> '') then
    TreeExpandBranch(s.ToInteger);

  dsReqMaterials.Open;
end;


procedure TReqMaterialsForm.TreeExpandBranch(const MG_ID: Integer);
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
      id := CurSubNode.Rec.DataValues['MG_ID', dvvValueEh];
      mtGroups.TreeList.Locate('MG_ID', id, []);
      OpenTreeNode(CurSubNode);
    end;
  end;

begin
  EID := MG_ID;
  dbGrid.DataSource.DataSet.DisableControls;
  mtGroups.TreeList.FullCollapse;
  mtGroups.TreeList.Locate('MG_ID', EID, []);
  CurrNode := mtGroups.RecView;
  OpenTreeNode(CurrNode);
  mtGroups.TreeList.Locate('MG_ID', EID, []);
  dbGrid.DataSource.DataSet.EnableControls;
end;

procedure TReqMaterialsForm.SetEditMode(const Value: Boolean);
var
  i: Integer;
begin
  FReadOnly := Value;

  if FReadOnly then
    Caption := Caption + rsRequestReadOnly;

  for i := 0 to dbGrid.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'RM_QUANT') then
      dbGrid.Columns[i].ReadOnly := FReadOnly
    else if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'CALC') then
      dbGrid.Columns[i].ReadOnly := FReadOnly
    else if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'RM_COST') then
      dbGrid.Columns[i].ReadOnly := FReadOnly
    else if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'PROP') then
      dbGrid.Columns[i].ReadOnly := FReadOnly
    else if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'RM_NOTICE') then
      dbGrid.Columns[i].ReadOnly := FReadOnly;
  end;
end;

procedure TReqMaterialsForm.SaveAndExit;
begin
  if (srcDataSource.DataSet.State in [dsInsert, dsEdit]) then
  begin
    srcDataSource.DataSet.Post;
  end;

  OkCancelFrame1.actExitExecute(nil);
  ModalResult := mrOk;
end;

end.
