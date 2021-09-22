unit StreetForma;

interface

uses
  WinAPI.Windows, WinAPI.Messages, WinAPI.ShellAPI, System.SysUtils, System.Variants, System.Classes,
  System.Actions, System.UITypes, Vcl.Graphics, Vcl.Menus, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList, Vcl.Buttons, Vcl.Mask,
  Data.DB, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.ToolWin, System.RegularExpressions,
  GridForma, Grids, DBGridEh, FIBDataSet, pFIBDataSet, frxClass, frxDBSet, EhLibFIB,
  DBCtrlsEh, GridsEh, PropFilerEh, PropStorageEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh,
  CnErrorProvider, PrjConst, EhLibVCL, DBGridEhGrouping, DynVarsEh, FIBDatabase,
  pFIBDatabase, DBLookupEh;

type
  TStreetForm = class(TGridForm)
    Panel1: TPanel;
    DbGridHouse: TDBGridEh;
    ToolBar2: TToolBar;
    ToolButton7: TToolButton;
    tbHAdd: TToolButton;
    ToolButton11: TToolButton;
    tbHEdit: TToolButton;
    ToolButton13: TToolButton;
    tbHDelete: TToolButton;
    ToolButton15: TToolButton;
    ToolButton17: TToolButton;
    Splitter1: TSplitter;
    dsHouses: TpFIBDataSet;
    dsStreets: TpFIBDataSet;
    srcHouses: TDataSource;
    Label2: TLabel;
    actHouseNew: TAction;
    actHouseEdit: TAction;
    actHouseDel: TAction;
    Label1: TLabel;
    ToolButton8: TToolButton;
    ToolButton12: TToolButton;
    frxStreets: TfrxDBDataset;
    frxHouses: TfrxDBDataset;
    actQuickFilterHouse: TAction;
    pnlHouseInfo: TPanel;
    pcHouseInfo: TPageControl;
    InfoSheet: TTabSheet;
    actHouseInfo: TAction;
    dsHouseEquipment: TpFIBDataSet;
    srcHouseEquipment: TDataSource;
    Splitter2: TSplitter;
    tsEquipment: TTabSheet;
    DBGridEh2: TDBGridEh;
    dsHouseService: TpFIBDataSet;
    srcHouseService: TDataSource;
    tsHouseWorks: TTabSheet;
    tsMap: TTabSheet;
    dbgWorks: TDBGridEh;
    dsFloor: TpFIBDataSet;
    dsPorch: TpFIBDataSet;
    dsWorks: TpFIBDataSet;
    srcFloor: TDataSource;
    srcWork: TDataSource;
    srcPorch: TDataSource;
    tlbWork: TToolBar;
    btnHouseWorkAdd: TToolButton;
    dbgServices: TDBGridEh;
    btnHouseWorkEdit: TToolButton;
    btnHouseWorkDelete: TToolButton;
    actHouseWorkAdd: TAction;
    actHouseWorkEdit: TAction;
    actHouseWorkDelete: TAction;
    ToolButton14: TToolButton;
    tsAbonents: TTabSheet;
    dbgCustomer: TDBGridEh;
    dsCustomers: TpFIBDataSet;
    srcCustomers: TDataSource;
    PropStorage: TPropStorageEh;
    tlbEqTb: TToolBar;
    btnAddEqpmnt: TToolButton;
    btnEditEqpmnt: TToolButton;
    btn2: TToolButton;
    pnl1: TPanel;
    dbgrFloors: TDBGridEh;
    dbgMap: TDBGridEh;
    spl1: TSplitter;
    dsFlats: TpFIBDataSet;
    srcFlats: TDataSource;
    ToolButton16: TToolButton;
    ToolButton18: TToolButton;
    tlb1: TToolBar;
    btn3: TToolButton;
    btnHouseMap: TToolButton;
    btnMap: TToolButton;
    btn1: TToolButton;
    pnlFlats: TPanel;
    dbgFLATS: TDBGridEh;
    tlb2: TToolBar;
    btnFlatAdd: TToolButton;
    btn5: TToolButton;
    btnFlatDel: TToolButton;
    btnFlatEdit: TToolButton;
    btn8: TToolButton;
    btnFindStreetCustomers: TToolButton;
    btn6: TToolButton;
    actFindStreetCustomers: TAction;
    actFindHousCustomers: TAction;
    btn4: TToolButton;
    btnFindHousCustomers: TToolButton;
    pmCustomers: TPopupMenu;
    actFindCustomer: TAction;
    N1: TMenuItem;
    tsCircuit: TTabSheet;
    pmCircuit: TPopupMenu;
    mniCircuitView: TMenuItem;
    mniN2: TMenuItem;
    dsCirciut: TpFIBDataSet;
    dsCirciutHC_ID: TFIBIntegerField;
    dsCirciutHOUSE_ID: TFIBIntegerField;
    dsCirciutNAME: TFIBWideStringField;
    dsCirciutCIRCUIT: TFIBBlobField;
    dsCirciutPNG: TFIBBlobField;
    dsCirciutNOTICE: TFIBWideStringField;
    srcCirciut: TDataSource;
    imgPNG: TDBImageEh;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    N2: TMenuItem;
    N3: TMenuItem;
    spl2: TSplitter;
    tsAtributes: TTabSheet;
    pnlAtr: TPanel;
    dbgAttr: TDBGridEh;
    pnlAttr: TPanel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl4: TLabel;
    dbluAttribute: TDBLookupComboboxEh;
    btnSaveAttr: TBitBtn;
    btnCancelAttr: TBitBtn;
    mmoNOTICE: TDBMemoEh;
    edtAtrValue: TDBEditEh;
    cbbList: TDBComboBoxEh;
    tlbAttr: TToolBar;
    btnAttrAdd: TToolButton;
    btnAttrEdit: TToolButton;
    btnAttrDel: TToolButton;
    dsAttributes: TpFIBDataSet;
    srcAttributes: TDataSource;
    srcHousesAttr: TDataSource;
    dsHousesAttr: TpFIBDataSet;
    pnlHT: TPanel;
    pnlHM: TPanel;
    Label6: TLabel;
    memHouseNotice: TDBMemoEh;
    pnlHI: TPanel;
    dbtxt1: TDBText;
    lbl3: TLabel;
    lbl2: TLabel;
    dbtxtpost: TDBText;
    dbtxtORG_NAME: TDBText;
    lbl1: TLabel;
    dbtxtCHAIRMAN_PHONE: TDBText;
    Label5: TLabel;
    dbtxtCHAIRMAN: TDBText;
    Label4: TLabel;
    dbtxtSUBAREA_NAME: TDBText;
    Label9: TLabel;
    Label7: TLabel;
    dbtxtHOUSE_NO: TDBText;
    Label8: TLabel;
    dbtxtQ_FLAT: TDBText;
    dbtxtSUBAREA_NAME1: TDBText;
    lbl7: TLabel;
    btn7: TToolButton;
    btnViewCube: TToolButton;
    actViewCube: TAction;
    miN4: TMenuItem;
    miPNG1: TMenuItem;
    dlgOpen: TOpenDialog;
    procedure tbHOkClick(Sender: TObject);
    procedure tbHCancelClick(Sender: TObject);
    procedure actHouseEditExecute(Sender: TObject);
    procedure actHouseNewExecute(Sender: TObject);
    procedure actHouseDelExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure tbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton8Click(Sender: TObject);
    procedure actQuickFilterHouseExecute(Sender: TObject);
    procedure dsHousesBeforePost(DataSet: TDataSet);
    procedure dsStreetsBeforePost(DataSet: TDataSet);
    procedure dbGridExit(Sender: TObject);
    procedure actHouseInfoExecute(Sender: TObject);
    procedure srcHousesDataChange(Sender: TObject; Field: TField);
    procedure pcHouseInfoChange(Sender: TObject);
    procedure FormStorageRestorePlacement(Sender: TObject);
    procedure dbGridSortMarkingChanged(Sender: TObject);
    procedure DbGridHouseDblClick(Sender: TObject);
    procedure actHouseWorkAddExecute(Sender: TObject);
    procedure actHouseWorkEditExecute(Sender: TObject);
    procedure dsPorchNewRecord(DataSet: TDataSet);
    procedure dbgMapExit(Sender: TObject);
    procedure dsFloorNewRecord(DataSet: TDataSet);
    procedure dbgrFloorsExit(Sender: TObject);
    procedure btnHouseMapClick(Sender: TObject);
    procedure dbgCustomerGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure actHouseWorkDeleteExecute(Sender: TObject);
    procedure srcWorkStateChange(Sender: TObject);
    procedure btnMapClick(Sender: TObject);
    procedure btnAddEqpmntClick(Sender: TObject);
    procedure btnEditEqpmntClick(Sender: TObject);
    procedure dsFlatsNewRecord(DataSet: TDataSet);
    procedure btn3Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure btnFlatDelClick(Sender: TObject);
    procedure btnFlatAddClick(Sender: TObject);
    procedure dbgFLATSExit(Sender: TObject);
    procedure btnFlatEditClick(Sender: TObject);
    procedure srcFlatsDataChange(Sender: TObject; Field: TField);
    procedure srcHouseEquipmentDataChange(Sender: TObject; Field: TField);
    procedure actFindStreetCustomersExecute(Sender: TObject);
    procedure actFindHousCustomersExecute(Sender: TObject);
    procedure actFindCustomerExecute(Sender: TObject);
    procedure mniN2Click(Sender: TObject);
    procedure mniCircuitViewClick(Sender: TObject);
    procedure imgPNGDblClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure dsCirciutNewRecord(DataSet: TDataSet);
    procedure btnAttrAddClick(Sender: TObject);
    procedure btnAttrEditClick(Sender: TObject);
    procedure btnAttrDelClick(Sender: TObject);
    procedure dsHousesAttrNewRecord(DataSet: TDataSet);
    procedure btnSaveAttrClick(Sender: TObject);
    procedure btnCancelAttrClick(Sender: TObject);
    procedure dbluAttributeChange(Sender: TObject);
    procedure memHouseNoticeExit(Sender: TObject);
    procedure dbGridGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
    procedure actViewCubeExecute(Sender: TObject);
    procedure miPNG1Click(Sender: TObject);
  private
    { Private declarations }
    FCanEdit: Boolean;
    procedure SaveFlatGrid;
    procedure StartAttr(const New: Boolean = True);
    procedure StopAttr(const Cancel: Boolean);
    procedure actViewFile;
  public
    { Public declarations }
  end;

var
  StreetForm: TStreetForm;

implementation

uses DM, AtrCommon, StreetEditForma, MAIN, HouseForma, HouseWorkForma, FIBQuery, pFIBQuery,
  ReportPreview, HouseMapForma, EquipEditForma, FlatsAddForma, CF, CircuitMain, StreetHousesViewForma;

{$R *.dfm}

function GetColumnIndex(const Grid: TDBGridEh; const Column: string): Integer;
var
  i: Integer;
  ci: Integer;
begin
  ci := -1;
  i := 0;
  while (i < Grid.Columns.Count - 1) and (ci = -1) do
  begin
    if Grid.Columns.Items[i].FieldName = Column then
      ci := i;
    i := i + 1;
  end;
  Result := ci;
end;

procedure TStreetForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DbGridHouse.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, Self.Name + '.' + DbGridHouse.Name, True);
  dmMain.SetIniValue('StreetGrid', IntToStr(dbGrid.Height));
  dsHouses.Close;
  dsStreets.Close;
  StreetForm := nil;
end;

procedure TStreetForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsStreets.Open;
  dsHouses.Open;

  // права пользователей полный доступ или редактирование улиц
  actNew.Visible := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street));
  actDelete.Visible := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street));
  actEdit.Visible := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street));

  // права пользователей полный доступ или редактирование домов
  actHouseNew.Visible := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street));
  actHouseEdit.Visible := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street));
  actHouseDel.Visible := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street));
  FCanEdit := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street));

  memHouseNotice.ReadOnly := not FCanEdit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
  begin
    srcPorch.AutoEdit := False;
    srcFloor.AutoEdit := False;
  end;
  DbGridHouse.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, Self.Name + '.' + DbGridHouse.Name,
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
end;

procedure TStreetForm.FormShow(Sender: TObject);
var
  vFINE: Boolean;
  i: Integer;
  s: string;
begin
  inherited;
  if dmMain.SuperMode = 0 then
  begin
    dbGrid.FooterRowCount := 0;
    dbGrid.SumList.Active := False;
    DbGridHouse.FooterRowCount := 0;
    DbGridHouse.SumList.Active := False;
    dbgServices.Visible := False;
    i := GetColumnIndex(DbGridHouse, 'CONNECTED');
    DbGridHouse.Columns[i].Visible := False;
    i := GetColumnIndex(DbGridHouse, 'DISCONNECTED');
    DbGridHouse.Columns[i].Visible := False;
    i := GetColumnIndex(DbGridHouse, 'PERCENT');
    DbGridHouse.Columns[i].Visible := False;
    i := GetColumnIndex(DbGridHouse, 'PERCENT');
    DbGridHouse.Columns[i].Visible := False;
    i := GetColumnIndex(dbGrid, 'FLATS');
    dbGrid.Columns[i].Visible := False;
    tsAbonents.TabVisible := False;
  end;

  s := dmMain.GetIniValue('StreetGrid');
  if TryStrToInt(s, i) then
    dbGrid.Height := i;

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

  pcHouseInfoChange(Sender);
end;

procedure TStreetForm.FormStorageRestorePlacement(Sender: TObject);
begin
  inherited;
  pcHouseInfoChange(Sender);
end;

procedure TStreetForm.tbOkClick(Sender: TObject);
begin
  inherited;
  dsStreets.Post;
end;

procedure TStreetForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  dsStreets.Cancel;
end;

procedure TStreetForm.actNewExecute(Sender: TObject);
var
  i: int64;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;
  i := EditStreet(-1);
  if i > -1 then
  begin
    dsStreets.CloseOpen(True);
    dsStreets.Locate('STREET_ID', VarArrayOf([i]), []);
    actNew.Enabled := dsStreets.RecordCount > 0;
    actEdit.Enabled := actNew.Enabled;
    actDelete.Enabled := actNew.Enabled;
    actHouseNew.Enabled := dsStreets.RecordCount > 0;
  end;
end;

procedure TStreetForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if dsStreets.FieldByName('STREET_ID').IsNull then
    Exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;
  if EditStreet(dsStreets['STREET_ID']) > -1 then
  begin
    dsStreets.refresh;
    actNew.Enabled := dsStreets.RecordCount > 0;
    actEdit.Enabled := actNew.Enabled;
    actDelete.Enabled := actNew.Enabled;
    actHouseNew.Enabled := dsStreets.RecordCount > 0;

  end;
end;

procedure TStreetForm.actDeleteExecute(Sender: TObject);
begin
  inherited;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;

  if dsHouses.RecordCount = 0 then
  begin
    if (MessageDlg(Format(rsDeleteWithName, [dsStreets['STREET_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      dsStreets.Delete;
    end;
  end
  else
    ShowMessage(rsErrorNeedDeleteHouse);
end;

procedure TStreetForm.actHouseDelExecute(Sender: TObject);
var
  s: String;
  i, j: Integer;
begin
  inherited;
  if dsHouses.FieldByName('HOUSE_NO').IsNull then
    Exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Clear;
      SQL.Add('execute block (HOUSE_ID D_INTEGER = :HOUSE_ID) returns ( CWHAT  D_Varchar10,  CCOUNT d_INTEGER) as ');
      SQL.Add('begin ');
      SQL.Add('  ccount = 0; ');
      SQL.Add('  CWHAT = ''''; ');
      SQL.Add('  select count(*) from CUSTOMER where HOUSE_ID = :HOUSE_ID into ccount; ');
      SQL.Add('  if (ccount > 0) then ');
      SQL.Add('    CWHAT = ''Абонентов''; ');
      SQL.Add('  else begin ');
      SQL.Add('    select count(*) from REQUEST where HOUSE_ID = :HOUSE_ID into ccount; ');
      SQL.Add('    if (ccount > 0) then ');
      SQL.Add('      CWHAT = ''Заявок''; ');
      SQL.Add('    else begin ');
      SQL.Add('      select count(*) from Nodes where HOUSE_ID = :HOUSE_ID into ccount; ');
      SQL.Add('      if (ccount > 0) then ');
      SQL.Add('        CWHAT = ''Узлов'';  ');
      SQL.Add('    end ');
      SQL.Add('  end ');
      SQL.Add('  suspend; ');
      SQL.Add('end ');
      ParamByName('HOUSE_ID').AsInteger := dsHouses['HOUSE_ID'];
      Transaction.StartTransaction;
      ExecQuery;
      i := FN('CCOUNT').AsInteger;
      if i > 0 then
        s := FN('CWHAT').AsString
      else
        s := '';
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
  if i > 0 then
    ShowMessageFmt(rsErrorNeedHouseClear, [s, i])
  else
  begin
    if (MessageDlg(Format(rsDeleteWithName, [dsHouses['HOUSE_NO']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      try
        // dsHouses.UpdateTransaction.StartTransaction;
        dsHouses.Delete;
        // dsHouses.UpdateTransaction.Commit;
      except
        on E: Exception do
        begin
          s := '';
          i := Pos('#', E.Message);
          if (i > 0) then
          begin
            j := Pos(' ', E.Message, i + 1);
            s := Copy(E.Message, i + 1, j - i - 1);
          end;
          if s = '1' then
            ShowMessage(rsDelHouseError)
          else
            raise;
        end;
      end;
    end;
  end;
end;

procedure TStreetForm.actHouseNewExecute(Sender: TObject);
var
  i: int64;
begin
  inherited;
  if dsStreets.FieldByName('STREET_ID').IsNull then
    Exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;

  i := EditHouse(-1, dsStreets['STREET_ID']);
  if i > -1 then
  begin
    dsHouses.CloseOpen(True);
    dsHouses.Locate('HOUSE_ID', VarArrayOf([i]), []);
  end;
end;

procedure TStreetForm.actHouseWorkAddExecute(Sender: TObject);
begin
  inherited;
  if dsHouses.FieldByName('HOUSE_ID').IsNull then
    Exit;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;

  if HouseWorkEdit(dsHouses['HOUSE_ID'], -1) then
    dsWorks.CloseOpen(True);

end;

procedure TStreetForm.actHouseWorkDeleteExecute(Sender: TObject);
begin
  inherited;
  if dsWorks.FieldByName('DATE_PPR').IsNull then
    Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;

  If MessageDlg(Format(rsDeleteWithName, [DateToStr(dsWorks['DATE_PPR'])]), mtConfirmation, [mbNo, mbYes], 0) = mrYes
  then
    dsWorks.Delete;
end;

procedure TStreetForm.actHouseWorkEditExecute(Sender: TObject);
begin
  inherited;
  if dsWorks.FieldByName('HW_ID').IsNull then
    Exit;
  if dsHouses.FieldByName('HOUSE_ID').IsNull then
    Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;

  if HouseWorkEdit(dsHouses['HOUSE_ID'], dsWorks['HW_ID']) then
    dsWorks.CloseOpen(True);
end;

procedure TStreetForm.actHouseEditExecute(Sender: TObject);
begin
  inherited;
  if dsStreets.FieldByName('STREET_ID').IsNull then
    Exit;
  if dsHouses.FieldByName('HOUSE_ID').IsNull then
    Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;

  if EditHouse(dsHouses['HOUSE_ID'], dsStreets['STREET_ID']) > -1 then
  begin
    dsHouses.refresh;
  end;
end;

procedure TStreetForm.tbHCancelClick(Sender: TObject);
begin
  inherited;
  dsHouses.Cancel;
end;

procedure TStreetForm.tbHOkClick(Sender: TObject);
begin
  inherited;
  dsHouses.Post;
  dsHouses.refresh;
end;

procedure TStreetForm.ToolButton16Click(Sender: TObject);
var
  vi: Integer;
begin
  inherited;
  if dsStreets.FieldByName('STREET_ID').IsNull then
    Exit;

  vi := dmMain.GET_ID_REPORT_BY_PATH(rsRepHouses);
  if vi > -1 then
  begin
    with TReportChild.Create(Application) do
    begin
      REPORT_ID := vi;
      LoadReportBody;
      vi := GetVariableID('V_STREET_ID');
      if vi > 0 then
      begin
        SetVariable('V_STREET_ID', dsStreets['STREET_ID']);
      end;
      ShowReportBody;
      Show;
    end;
  end;
end;

procedure TStreetForm.ToolButton8Click(Sender: TObject);
begin
  inherited;
  ShowReport(rsRepHouses);
end;

procedure TStreetForm.actQuickFilterHouseExecute(Sender: TObject);
begin
  inherited;
  actQuickFilterHouse.Checked := not actQuickFilterHouse.Checked;
  DbGridHouse.STFilter.Visible := actQuickFilterHouse.Checked;
  if not actQuickFilter.Checked then
    DbGridHouse.DataSource.DataSet.Filtered := False;
end;

procedure TStreetForm.actViewCubeExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(StreetHouseViewForm) then
    StreetHouseViewForm := TStreetHouseViewForm.Create(Application);
  StreetHouseViewForm.Show;
end;

procedure TStreetForm.btnHouseMapClick(Sender: TObject);
var
  vi: Integer;
begin
  inherited;
  if dsHouses.FieldByName('house_id').IsNull then
    Exit;

  vi := dmMain.GET_ID_REPORT_BY_PATH(rsRepHouseMap);
  if vi > -1 then
  begin
    with TReportChild.Create(Application) do
    begin
      REPORT_ID := vi;
      LoadReportBody;
      vi := GetVariableID('V_HOUSE_ID');
      if vi > 0 then
      begin
        SetVariable('V_HOUSE_ID', dsHouses['HOUSE_ID']);
      end;
      ShowReportBody;
      Show;
    end;
  end;
end;

procedure TStreetForm.btn3Click(Sender: TObject);
begin
  inherited;
  if dsHouses.FieldByName('house_id').IsNull then
    Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;

  if CreateFlats(dsHouses['house_id']) then
  begin
    dsPorch.CloseOpen(True);
    dsFloor.CloseOpen(True);
    dsFlats.CloseOpen(True);
  end;
end;

procedure TStreetForm.btnAddEqpmntClick(Sender: TObject);
var
  bm: TBookmark;
begin
  inherited;
  if (dsHouses.FieldByName('street_id').IsNull or dsHouses.FieldByName('house_id').IsNull) then
    Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    Exit;

  if EditHouseEquipment(-1, dsHouses['street_id'], dsHouses['house_id'], 2) <> -1 then
  begin
    bm := dsHouseEquipment.GetBookmark;
    dsHouseEquipment.CloseOpen(True);
    dsHouseEquipment.GotoBookmark(bm);
  end;
end;

procedure TStreetForm.StartAttr(const New: Boolean = True);
begin
  if not FCanEdit then
    Exit;

  if not dsHousesAttr.Active then
    dsHousesAttr.Open;

  dsAttributes.ParamByName('HOUSE_ID').Value := dsHouses['HOUSE_ID'];
  if New then
    dsAttributes.ParamByName('O_ID').Value := -1
  else
    dsAttributes.ParamByName('O_ID').Value := dsHousesAttr['O_ID'];

  dsAttributes.Open;

  pnlAttr.Visible := True;
  dbgAttr.Enabled := False;
  tlbAttr.Enabled := False;
  if New then
  begin
    dsHousesAttr.Append;
    dbluAttribute.Enabled := True;
    dbluAttribute.SetFocus;
  end
  else
  begin
    dsHousesAttr.Edit;
    dbluAttribute.Enabled := False;
    if edtAtrValue.Visible then
      edtAtrValue.SetFocus
    else if cbbList.Visible then
      cbbList.SetFocus;
  end;
end;

procedure TStreetForm.StopAttr(const Cancel: Boolean);
var
  errors: Boolean;
  s, reg: string;
begin
  errors := False;
  if not Cancel then
  begin
    if dbluAttribute.Text = '' then
    begin
      CnErrors.SetError(dbluAttribute, rsSelectAttribute, iaTopCenter, bsNeverBlink);
      errors := True;
    end
    else
      CnErrors.Dispose(dbluAttribute);

    if ((dbluAttribute.Text <> '')) then
    begin
      if dsAttributes['REGEXP'] <> '' then
      begin
        s := edtAtrValue.Text;
        reg := '^' + dsAttributes['REGEXP'] + '$';
        errors := not TRegEx.IsMatch(s, reg);
        if errors then
          CnErrors.SetError(edtAtrValue, rsInputIncorrect, iaMiddleLeft, bsNeverBlink)
        else
          CnErrors.Dispose(edtAtrValue);
      end
    end;
  end;

  if not errors then
  begin
    pnlAttr.Visible := False;
    dbgAttr.Enabled := True;
    tlbAttr.Enabled := True;
    if not(dsHousesAttr.State in [dsEdit, dsInsert]) then
      Exit;
    if (Cancel) or (not FCanEdit) then
      dsHousesAttr.Cancel
    else if FCanEdit then
      dsHousesAttr.Post
    else
      dsHousesAttr.Cancel;

    dsAttributes.Close;
    dbgAttr.SetFocus;
  end;
end;

procedure TStreetForm.btnAttrAddClick(Sender: TObject);
begin
  inherited;
  if FCanEdit then
    StartAttr;
end;

procedure TStreetForm.btnAttrDelClick(Sender: TObject);
begin
  inherited;
  if FCanEdit and (not dsHousesAttr.FieldByName('O_NAME').IsNull) then
    if (MessageDlg(Format(rsDeleteWithName, [dsHousesAttr['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      dsHousesAttr.Delete;
end;

procedure TStreetForm.btnAttrEditClick(Sender: TObject);
begin
  inherited;
  if FCanEdit and (not dsHousesAttr.FieldByName('O_NAME').IsNull) then
    StartAttr(False);
end;

procedure TStreetForm.btnCancelAttrClick(Sender: TObject);
begin
  inherited;
  StopAttr(True);
end;

procedure TStreetForm.btnEditEqpmntClick(Sender: TObject);
var
  bm: TBookmark;
begin
  inherited;
  if (dsHouseEquipment.FieldByName('EID').IsNull or dsHouses.FieldByName('house_id').IsNull) then
    Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then
    Exit;

  if EditHouseEquipment(dsHouseEquipment['EID'], dsHouses['street_id'], dsHouses['house_id'], 2) <> -1 then
  begin
    bm := dsHouseEquipment.GetBookmark;
    dsHouseEquipment.CloseOpen(True);
    dsHouseEquipment.GotoBookmark(bm);
  end;
end;

procedure TStreetForm.btnMapClick(Sender: TObject);
begin
  inherited;
  if dsHouses.FieldByName('house_id').IsNull then
    Exit;

  with THouseMapForm.Create(Application) do
    try
      HouseID := dsHouses['HOUSE_ID'];
      ShowModal;
    finally
      Free;
    end;
end;

procedure TStreetForm.btnSaveAttrClick(Sender: TObject);
begin
  inherited;
  StopAttr(False);
end;

procedure TStreetForm.dsCirciutNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsCirciut['HOUSE_ID'] := dsHouses['HOUSE_ID'];
end;

procedure TStreetForm.dsFlatsNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsFlats['HOUSE_ID'] := dsHouses['HOUSE_ID'];
end;

procedure TStreetForm.dsFloorNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsFloor['PORCH_ID'] := dsPorch['PORCH_ID'];
end;

procedure TStreetForm.dsHousesAttrNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsHousesAttr['HOUSE_ID'] := dsHouses['HOUSE_ID'];
end;

procedure TStreetForm.dsHousesBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dsHouses.FieldByName('STREET_ID').IsNull then
    dsHouses['STREET_ID'] := dsStreets['STREET_ID'];
  if dsHouses.FieldByName('Q_FLAT').IsNull then
    dsHouses['Q_FLAT'] := 0;
end;

procedure TStreetForm.dsPorchNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsPorch['HOUSE_ID'] := dsHouses['HOUSE_ID'];
end;

procedure TStreetForm.dsStreetsBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dsStreets.FieldByName('STREET_CODE').IsNull then
    ShowMessage(rsStreetCodeReq);
end;

procedure TStreetForm.dbGridExit(Sender: TObject);
begin
  inherited;
  if not(srcDataSource.State = dsBrowse) then
    srcDataSource.DataSet.Post;
end;

procedure TStreetForm.dbGridGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
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

procedure TStreetForm.dbGridSortMarkingChanged(Sender: TObject);
var
  cr: TCursor;
  s: string;
  i, j: Integer;
  Grid: TCustomDBGridEh;
  FIBDS: TpFIBDataSet;

begin

  inherited;

  cr := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  Grid := TCustomDBGridEh(Sender);
  FIBDS := TpFIBDataSet(Grid.DataSource.DataSet);
  if Sender is TCustomDBGridEh then
  begin
    FIBDS.Close;

    j := Grid.SortMarkedColumns.Count;
    s := ' ';
    for i := 0 to pred(j) do
    begin
      if (AnsiUpperCase(Grid.SortMarkedColumns[i].FieldName) = 'STREET_CODE') then
        s := s + 's.STREET_CODE'
      else if (AnsiUpperCase(Grid.SortMarkedColumns[i].FieldName) = 'NOTICE') then
        s := s + 'S.NOTICE'
      else
        s := s + Grid.SortMarkedColumns[i].FieldName;
      // s := s + ' COLLATE UNICODE_CI_AI ';
      if Grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
        s := s + ' desc';
      if i <> pred(j) then
        s := s + ', ';
    end;
    FIBDS.OrderClause := s;
    LogEvent('Streets', 'sort sql', FIBDS.SQLs.SelectSQL.Text);
    FIBDS.Open;
  end;
  Screen.Cursor := cr;

end;

procedure TStreetForm.dbluAttributeChange(Sender: TObject);
begin
  inherited;
  cbbList.Items.Clear;
  cbbList.KeyItems.Clear;
  cbbList.Items.Text := dsAttributes['VLIST'];
  cbbList.KeyItems.Text := dsAttributes['VLIST'];
  cbbList.Visible := (dsAttributes['VLIST'] <> '');
  edtAtrValue.Visible := not cbbList.Visible;
end;

procedure TStreetForm.actHouseInfoExecute(Sender: TObject);
begin
  inherited;
  actHouseInfo.Checked := Not actHouseInfo.Checked;
  pnlHouseInfo.Visible := actHouseInfo.Checked;
end;

procedure TStreetForm.srcHousesDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actHouseNew.Enabled := dsStreets.RecordCount > 0;
  actHouseEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actHouseNew.Enabled;
  actHouseDel.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actHouseNew.Enabled;
end;

procedure TStreetForm.srcWorkStateChange(Sender: TObject);
begin
  inherited;
  actHouseWorkAdd.Enabled := (Sender as TDataSource).DataSet.CanModify and
    ((Sender as TDataSource).DataSet.State = dsBrowse);
  actHouseWorkEdit.Enabled := (Sender as TDataSource).DataSet.CanModify and
    not((Sender as TDataSource).DataSet.BOF and (Sender as TDataSource).DataSet.EOF) and
    ((Sender as TDataSource).DataSet.State = dsBrowse);
  actHouseWorkDelete.Enabled := actHouseWorkEdit.Enabled
end;

procedure TStreetForm.pcHouseInfoChange(Sender: TObject);
begin
  inherited;
  dsHouseEquipment.Active := (pcHouseInfo.ActivePage = tsEquipment);
  dsHouseService.Active := ((pcHouseInfo.ActivePage = InfoSheet) and (dbgServices.Visible));
  dsPorch.Active := (pcHouseInfo.ActivePage = tsMap);
  dsFloor.Active := (pcHouseInfo.ActivePage = tsMap);
  dsFlats.Active := (pcHouseInfo.ActivePage = tsMap);
  dsWorks.Active := (pcHouseInfo.ActivePage = tsHouseWorks);
  dsCustomers.Active := (pcHouseInfo.ActivePage = tsAbonents);
  dsCirciut.Active := (pcHouseInfo.ActivePage = tsCircuit);
  dsHousesAttr.Active := (pcHouseInfo.ActivePage = tsAtributes);
end;

procedure TStreetForm.dbgCustomerGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
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

procedure TStreetForm.dbgMapExit(Sender: TObject);
begin
  inherited;
  if dsPorch.State in [dsEdit, dsInsert] then
  begin
    if dsHouses.RecordCount > 0 then
      dsPorch.Post
    else
      dsPorch.Cancel;
  end;
end;

procedure TStreetForm.dbgrFloorsExit(Sender: TObject);
begin
  inherited;
  if dsFloor.State in [dsEdit, dsInsert] then
    dsFloor.Post;
end;

procedure TStreetForm.DbGridHouseDblClick(Sender: TObject);
begin
  inherited;
  actHouseEdit.Execute;
end;

procedure TStreetForm.btnFlatDelClick(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;
  if (not dsFlats.Active) or (dsFlats.RecordCount = 0) then
    Exit;

  if dbgFLATS.SelectedRows.Count > 0 then
    if (MessageDlg(rsDeleteSelectedRecords, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      for i := dbgFLATS.SelectedRows.Count - 1 downto 0 do
      begin
        dbgFLATS.DataSource.DataSet.Bookmark := dbgFLATS.SelectedRows[i];
        dsFlats.Delete;
      end
    end
    else
    begin
      if (MessageDlg(Format(rsDeleteRecord, [dsFlats['FLAT_NO']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        dsFlats.Delete;
    end;
end;

procedure TStreetForm.btnFlatAddClick(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;
  dsFlats.Insert;
end;

procedure TStreetForm.dbgFLATSExit(Sender: TObject);
begin
  inherited;
  SaveFlatGrid;
end;

procedure TStreetForm.SaveFlatGrid;
begin
  if not(dsFlats.State in [dsEdit, dsInsert]) then
    Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    dsFlats.Cancel;

  if dsFlats.FieldByName('FLAT_NO').IsNull then
    dsFlats.Cancel;
  if dsFlats.State in [dsEdit, dsInsert] then
    dsFlats.Post;
end;

procedure TStreetForm.btnFlatEditClick(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;

  dsFlats.Edit;
end;

procedure TStreetForm.srcFlatsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  btnFlatAdd.Enabled := (Sender as TDataSource).DataSet.Active;
  btnFlatEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and btnFlatAdd.Enabled;
  btnFlatDel.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and btnFlatAdd.Enabled;
end;

procedure TStreetForm.srcHouseEquipmentDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  btnAddEqpmnt.Enabled := (Sender as TDataSource).DataSet.Active;
  btnEditEqpmnt.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and btnAddEqpmnt.Enabled;
end;

procedure TStreetForm.actFindStreetCustomersExecute(Sender: TObject);
begin
  inherited;
  if (dsStreets.Active) and (dsStreets.RecordCount > 0) and (not dsStreets.FieldByName('street_id').IsNull) then
    ShowCustomers(13, dsStreets.FieldByName('street_id').AsString + '~0');
end;

procedure TStreetForm.actFindHousCustomersExecute(Sender: TObject);
begin
  inherited;
  if (dsStreets.Active) and (dsStreets.RecordCount > 0) and (not dsStreets.FieldByName('street_id').IsNull) and
    (dsHouses.Active) and (dsHouses.RecordCount > 0) and (not dsHouses.FieldByName('house_id').IsNull) then
    ShowCustomers(14, dsStreets.FieldByName('street_id').AsString + '~' + dsHouses.FieldByName('house_id').AsString);
end;

procedure TStreetForm.actFindCustomerExecute(Sender: TObject);
var
  Grid: TDBGridEh;
  i: Integer;
  b: TBookmark;
  customers: TStringList;
  s: string;
begin

  inherited;
  Grid := dbgCustomer;

  customers := TStringList.Create;
  customers.Sorted := True;
  customers.Duplicates := dupIgnore;

  if (Grid.SelectedRows.Count = 0) then
  begin
    if not Grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
      customers.Add(IntToStr(Grid.DataSource.DataSet['CUSTOMER_ID']));
  end
  else
  begin
    b := Grid.DataSource.DataSet.GetBookmark;
    Grid.DataSource.DataSet.DisableControls;
    Grid.DataSource.DataSet.First;
    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      Grid.DataSource.DataSet.Bookmark := Grid.SelectedRows[i];
      if not Grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
        customers.Add(IntToStr(Grid.DataSource.DataSet['CUSTOMER_ID']));
    end;
    Grid.DataSource.DataSet.GotoBookmark(b);
    Grid.DataSource.DataSet.EnableControls;
  end;

  if (customers.Count > 0) then
    s := customers.CommaText
  else
    s := '';

  FreeAndNil(customers);

  if (s <> '') then
    ShowCustomers(7, s);
end;

procedure TStreetForm.mniN2Click(Sender: TObject);
var
  CircuitData: TMemoryStream;
  PngData: TMemoryStream;
  NeedSave: Boolean;
begin
  inherited;

  if (dsHouses.RecordCount = 0) or (dsHouses.FieldByName('HOUSE_ID').IsNull) then
    Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;

  CircuitData := TMemoryStream.Create;
  PngData := TMemoryStream.Create;
  try
    if (dsCirciut.RecordCount = 0) or (dsCirciut.FieldByName('CIRCUIT').IsNull) then
      NeedSave := EditCircuit(CircuitData, PngData)
    else
    begin
      TBlobField(dsCirciut.FieldByName('CIRCUIT')).SaveToStream(CircuitData);
      CircuitData.Seek(0, soBeginning);
      NeedSave := EditCircuit(CircuitData, PngData);
    end;
    if NeedSave then
    begin
      if not dsCirciut.Active then
        dsCirciut.Open;

      if dsCirciut.RecordCount > 0 then
        dsCirciut.Edit
      else
      begin
        dsCirciut.Insert;
        dsCirciut['NAME'] := 'Схема';
        dsCirciut['NOTICE'] := '';
        dsCirciut['HOUSE_ID'] := dsHouses['HOUSE_ID'];
      end;
      TBlobField(dsCirciut.FieldByName('CIRCUIT')).LoadFromStream(CircuitData);
      TBlobField(dsCirciut.FieldByName('PNG')).LoadFromStream(PngData);
      dsCirciut.Post;
    end;
  finally
    CircuitData.Free;
    PngData.Free;
  end;
end;

procedure TStreetForm.memHouseNoticeExit(Sender: TObject);
begin
  inherited;
  if srcHouses.State in [dsEdit] then
    srcHouses.DataSet.Post;

end;

procedure TStreetForm.miPNG1Click(Sender: TObject);
begin
  inherited;
  if (dsHouses.RecordCount = 0) then
    Exit;

  if dlgOpen.Execute then
  begin
    if not dsCirciut.Active then
      dsCirciut.Open;

    if dsCirciut.RecordCount > 0 then
      dsCirciut.Edit
    else
    begin
      dsCirciut.Insert;
      dsCirciut['NOTICE'] := '';
      dsCirciut['HOUSE_ID'] := dsHouses['HOUSE_ID'];
    end;
    dsCirciut['NAME'] := ExtractFileName(dlgOpen.FileName);
    dsCirciut.FieldByName('CIRCUIT').Clear;
    TBlobField(dsCirciut.FieldByName('PNG')).LoadFromFile(dlgOpen.FileName);
    dsCirciut.Post;
  end;
end;

procedure TStreetForm.mniCircuitViewClick(Sender: TObject);
var
  CircuitData: TMemoryStream;
  PngData: TMemoryStream;
begin
  inherited;

  if (dsHouses.RecordCount = 0) then
    Exit;

  if (not dsCirciut.FieldByName('CIRCUIT').IsNull) then
  begin
    CircuitData := TMemoryStream.Create;
    PngData := TMemoryStream.Create;
    try
      TBlobField(dsCirciut.FieldByName('CIRCUIT')).SaveToStream(CircuitData);
      CircuitData.Seek(0, soBeginning);
      EditCircuit(CircuitData, PngData, True);
    finally
      CircuitData.Free;
      PngData.Free;
    end;
  end
  else if (not dsCirciut.FieldByName('PNG').IsNull) then
  begin
    actViewFile;
  end;
end;

procedure TStreetForm.actViewFile;
var
  FileName: string;
  PngData: TFileStream;
begin
  FileName := GetTempDir + 'A4on\';
  if not DirectoryExists(FileName) then
    CreateDir(FileName);
  FileName := FileName + dsCirciut.FieldByName('NAME').AsString;
  PngData := TFileStream.Create(FileName, fmCreate, fmShareDenyWrite);
  try
    TBlobField(dsCirciut.FieldByName('PNG')).SaveToStream(PngData);
  finally
    PngData.Free;
  end;
  if FileExists(FileName) then
    ShellExecute(Handle, 'open', PWideChar(FileName), nil, nil, SW_SHOWNORMAL);
end;

procedure TStreetForm.imgPNGDblClick(Sender: TObject);
begin
  inherited;
  mniCircuitView.Click;
end;

procedure TStreetForm.N2Click(Sender: TObject);
begin
  inherited;
  if dsHouses.RecordCount = 0 then
    Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;

  if (MessageDlg(Format(rsDeleteWithName, [dsCirciut['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dsCirciut.Delete;
end;

end.
