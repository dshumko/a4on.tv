unit MaterialsForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.Controls, Vcl.ExtCtrls,
  pFIBDatabase, FIBDataSet, pFIBDataSet, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, DBGridEhImpExp, frxClass,
  PropStorageEh,
  FIBQuery, pFIBQuery, FIBDatabase, PropFilerEh, MemTableDataEh, DataDriverEh, pFIBDataDriverEh, DBGridEhGrouping,
  ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, PrjConst, MemTableEh, EhLibMTE, frxDBSet;

type
  TMaterialsForm = class(TForm)
    Actions: TActionList;
    actNew: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actQuickFilter: TAction;
    actInNew: TAction;
    ActInDelete: TAction;
    dsRemain: TpFIBDataSet;
    srcRemain: TDataSource;
    pnlHead: TPanel;
    pnlMat: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    ToolButton2: TToolButton;
    ToolButton9: TToolButton;
    pnlGroup: TPanel;
    DBGridGroups: TDBGridEh;
    ToolBar3: TToolBar;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton16: TToolButton;
    ToolButton18: TToolButton;
    ToolButton20: TToolButton;
    Splitter2: TSplitter;
    dsMatGropups: TpFIBDataSet;
    srcMatGropups: TDataSource;
    ActAllMaterials: TAction;
    actAddGroup: TAction;
    ActEditGroup: TAction;
    ActDelGroup: TAction;
    ToolButton21: TToolButton;
    ToolButton22: TToolButton;
    ToolButton24: TToolButton;
    ToolButton25: TToolButton;
    ActPostGroup: TAction;
    actCancelGroup: TAction;
    DBGridEh: TDBGridEh;
    dsMaterials: TpFIBDataSet;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    TrTemp: TpFIBTransaction;
    QrTemp: TpFIBQuery;
    srcDataSource: TDataSource;
    pgcInOut: TPageControl;
    tsIn: TTabSheet;
    pmPopUp: TPopupMenu;
    ppmCopy: TMenuItem;
    ppmSelectAll: TMenuItem;
    MenuItem1: TMenuItem;
    ppmSaveSelection: TMenuItem;
    DBGridIncome: TDBGridEh;
    PropStorage: TPropStorageEh;
    spl1: TSplitter;
    actOutMaterials: TAction;
    actMatOutEdit: TAction;
    tsJournal: TTabSheet;
    dbgJournal: TDBGridEh;
    dsJournal: TpFIBDataSet;
    srcJournal: TDataSource;
    actInEdit: TAction;
    tsIncome: TTabSheet;
    dbgIncome: TDBGridEh;
    dsIncome: TpFIBDataSet;
    srcIncome: TDataSource;
    btnRemainRecalc: TToolButton;
    actRemainRecalc: TAction;
    actOpenMatDoc: TAction;
    pnl1: TPanel;
    btnPrintHistory: TBitBtn;
    actPrintHistory: TAction;
    frxReport: TfrxReport;
    tsItog: TTabSheet;
    dsItogo: TMemTableEh;
    drvFIB: TpFIBDataDriverEh;
    srcItog: TDataSource;
    dbgGridPivot: TDBGridEh;
    pmRecalcAll: TPopupMenu;
    actRecalcAll: TAction;
    N1: TMenuItem;
    tsMove: TTabSheet;
    tsOUT: TTabSheet;
    tsInventory: TTabSheet;
    dbgOUT: TDBGridEh;
    dbgInvent: TDBGridEh;
    dbgMove: TDBGridEh;
    dsMove: TpFIBDataSet;
    srcMove: TDataSource;
    dsInvent: TpFIBDataSet;
    srcInvent: TDataSource;
    srcOut: TDataSource;
    dsOut: TpFIBDataSet;
    qReqFile: TpFIBQuery;
    tsSerials: TTabSheet;
    dsSerials: TpFIBDataSet;
    srcSerials: TDataSource;
    dbgSN: TDBGridEh;
    trWriteDS: TpFIBTransaction;
    trReadDS: TpFIBTransaction;
    btn1: TToolButton;
    btnQuickFilter: TToolButton;
    tsPivotSN: TTabSheet;
    dbgGridPivotSN: TDBGridEh;
    srcPivotSN: TDataSource;
    dsPivotSN: TMemTableEh;
    drvPivotSN: TpFIBDataDriverEh;
    pmPivot: TPopupMenu;
    miRowHight: TMenuItem;
    frxMaterials: TfrxDBDataset;
    procedure actAddGroupExecute(Sender: TObject);
    procedure ActAllMaterialsExecute(Sender: TObject);
    procedure actCancelGroupExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure ActDelGroupExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure ActEditGroupExecute(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure ActPostGroupExecute(Sender: TObject);
    procedure actQuickFilterExecute(Sender: TObject);
    procedure DbGridMatDblClick(Sender: TObject);
    procedure srcRemainDataChange(Sender: TObject; Field: TField);
    procedure srcMatGropupsStateChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure DBGridEhGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure DBGridEhDblClick(Sender: TObject);
    procedure pgcInOutChange(Sender: TObject);
    procedure ppmCopyClick(Sender: TObject);
    procedure ppmSaveSelectionClick(Sender: TObject);
    procedure ppmSelectAllClick(Sender: TObject);
    procedure actRemainRecalcExecute(Sender: TObject);
    procedure actOpenMatDocExecute(Sender: TObject);
    procedure dbgIncomeDblClick(Sender: TObject);
    procedure actPrintHistoryExecute(Sender: TObject);
    procedure dbgJournalDblClick(Sender: TObject);
    function frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure actRecalcAllExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEhDataHintShow(Sender: TCustomDBGridEh; CursorPos: TPoint; Cell: TGridCoord;
      InCellCursorPos: TPoint; Column: TColumnEh; var Params: TDBGridEhDataHintParams; var Processed: Boolean);
    procedure DBGridEhMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure dbgColumnsZerroCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgGridPivotSNDblClick(Sender: TObject);
    procedure miRowHightClick(Sender: TObject);
    procedure dsPivotSNNewRecord(DataSet: TDataSet);
    procedure dsMaterialsAfterScroll(DataSet: TDataSet);
    procedure dsPivotSNAfterOpen(DataSet: TDataSet);
    procedure dbgGridPivotSNSortMarkingChanged(Sender: TObject);
    procedure dbgGridPivotSNColumns3GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgSNDblClick(Sender: TObject);
  private
    { Private declarations }
    fVisibleCost: Boolean;
    FAccessFull: Boolean;
    FAccessMat: Boolean;
    FPictHintWindow: THintWindow;
    FSortSN: string;
    procedure InitDataSet;
    procedure dbGridGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
  public
    { Public declarations }
  end;

var
  MaterialsForm: TMaterialsForm;

implementation

uses
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg,
  DM, MAIN, AtrStrUtils, MaterialForma, ReportPreview, RequestForma, MatCorrectionDocForma, MatIncomeDocForma,
  MatOutDocForma, TextEditForma,
  MatMoveDocForma, MatInventoryDocForma, CustomerForma;

const
  // макс. размеры сторон хинта
  HintMaxSize: Integer = 300;

{$R *.dfm}

procedure TMaterialsForm.InitDataSet;
var
  lk_Col: TColumnEh;
  lk_vars_s: string;
  lk_body_s: string;
  lk_total_s: string;
  lk_total_s_cst: string;
  lk_vars_u: string;
  lk_body_u: string;
  lk_FldName: string;
  lk_FldNameCst: string;
  crsr: TCursor;
const
  FldPrfx = 'QNT';
  FldPrfxCst = 'CST';
begin

  if not dmMain.dbTV.Connected then
    exit;
  if trRead.InTransaction then
    trRead.Rollback;
  crsr := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  DBGridEh.Visible := false;
  DBGridEh.FrozenCols := 0;
  DBGridEh.Columns.Clear;
  lk_Col := DBGridEh.Columns.Add;
  // lk_Col.Color         := DBGridEh.FixedColor;
  lk_Col.FieldName := 'NAME';
  lk_Col.Title.Caption := rsTitle;
  lk_Col.Title.TitleButton := True;
  lk_Col.Width := 320;
  lk_Col.Tag := 666;
  lk_Col.Footer.ValueType := fvtStaticText;
  lk_Col.Footer.Alignment := taLeftJustify;
  lk_Col.Footer.Value := rsItogo;

  lk_Col := DBGridEh.Columns.Add;
  lk_Col.FieldName := 'DIMENSION';
  lk_Col.Title.Caption := rsMeasure;
  lk_Col.Title.TitleButton := True;
  lk_Col.Footer.ValueType := fvtCount;
  lk_Col.Width := 30;

  if fVisibleCost then
  begin
    lk_Col := DBGridEh.Columns.Add;
    lk_Col.FieldName := 'COST';
    lk_Col.Title.Caption := rsCost;
    lk_Col.Title.TitleButton := True;
    lk_Col.DisplayFormat := '#,###.##';
    lk_Col.Width := 50;
  end;

  lk_Col := DBGridEh.Columns.Add;
  lk_Col.FieldName := 'M_NUMBER';
  lk_Col.Title.Caption := rsNumber;
  lk_Col.Title.TitleButton := True;
  lk_Col.Width := 50;

  lk_Col := DBGridEh.Columns.Add;
  lk_Col.FieldName := 'TYPE_NAME';
  lk_Col.Title.Caption := rsMatType;
  lk_Col.Title.TitleButton := True;
  lk_Col.Width := 50;

  if TrTemp.InTransaction then
    TrTemp.Rollback;
  TrTemp.StartTransaction;
  QrTemp.SQL.Text := 'select O_ID as ID, O_NAME as NAME from OBJECTS o where O_TYPE = 10 and O_DELETED = 0';
  QrTemp.SQL.Add(' and (exists(select w.wh_id from SYS$USER u inner join sys$user_wh w on (w.user_id = u.id) ');
  QrTemp.SQL.Add
    (' where w.wh_id = o.O_ID and u.ibname = current_user and w.can_view = 1) or current_user = ''SYSDBA'') order by O_NAME');
  try
    QrTemp.ExecQuery;
  except
    DBGridEh.Visible := True;
    exit;
  end;
  lk_vars_s := '';
  lk_body_s := '';
  lk_total_s := '';
  lk_total_s_cst := '';
  lk_vars_u := '';
  lk_body_u := '';
  while not QrTemp.Eof do
  begin
    lk_FldName := FldPrfx + FormatFloat('00000000', QrTemp.FN('ID').AsInteger);
    lk_FldNameCst := FldPrfxCst + FormatFloat('00000000', QrTemp.FN('ID').AsInteger);
    lk_vars_s := lk_vars_s + '  ,' + lk_FldName + ' NUMERIC(15,3) ' + rsEOL;
    lk_vars_s := lk_vars_s + '  ,' + lk_FldNameCst + ' NUMERIC(15,3) ' + rsEOL;
    lk_body_s := lk_body_s + 'select SUM(MR_QUANT), sum(MR_QUANT*:COST) from MATERIALS_REMAIN';
    lk_body_s := lk_body_s + ' where (M_ID = :M_ID) and (WH_ID = ' + QrTemp.FN('ID').AsString + ') INTO :' + lk_FldName
      + ',' + lk_FldNameCst + '; ' + rsEOL;
    lk_total_s := lk_total_s + ' + coalesce(:' + lk_FldName + ',0)';
    lk_total_s_cst := lk_total_s_cst + ' + coalesce(:' + lk_FldNameCst + ',0)';

    lk_Col := DBGridEh.Columns.Add;
    lk_Col.FieldName := lk_FldName;
    lk_Col.DisplayFormat := ',#0.###';
    lk_Col.Title.Caption := rsMatPlace + QrTemp.FN('NAME').AsString + rsPQuant;
    lk_Col.Title.TitleButton := True;
    lk_Col.Width := 56;
    lk_Col.Tag := 1; // будем окрашивать по этому признаку
    lk_Col.Footer.ValueType := fvtSum;
    lk_Col.Footer.FieldName := lk_FldName;
    lk_Col.Footer.DisplayFormat := ',#0.###';
    lk_Col.Footer.Alignment := taRightJustify;
    lk_Col.OnGetCellParams := dbGridGetCellParams;

    if fVisibleCost then
    begin
      lk_Col := DBGridEh.Columns.Add;
      lk_Col.FieldName := lk_FldNameCst;
      lk_Col.DisplayFormat := ',#0.###';
      lk_Col.Title.Caption := rsMatPlace + QrTemp.FN('NAME').AsString + rsSummaS;
      lk_Col.Title.TitleButton := True;
      lk_Col.Width := 56;
      lk_Col.Tag := 1; // будем окрашивать по этому признаку
      lk_Col.Footer.ValueType := fvtSum;
      lk_Col.Footer.FieldName := lk_FldNameCst;
      lk_Col.Footer.DisplayFormat := ',#0.###';
      lk_Col.Footer.Alignment := taRightJustify;
      lk_Col.OnGetCellParams := dbGridGetCellParams;
    end;
    QrTemp.Next;
  end;

  if TrTemp.InTransaction then
    TrTemp.Rollback;

  lk_FldName := FldPrfx + 'TOTAL';
  lk_FldNameCst := FldPrfxCst + 'TOTAL';
  lk_vars_s := lk_vars_s + '  ,' + lk_FldName + ' NUMERIC(15,3) ' + rsEOL;
  lk_vars_s := lk_vars_s + '  ,' + lk_FldNameCst + ' NUMERIC(15,3) ' + rsEOL;
  lk_body_s := '    ' + lk_FldName + ' = 0;' + rsEOL + '    ' + lk_FldNameCst + ' = 0;' + rsEOL + lk_body_s + '    ' +
    lk_FldName + ' = :' + lk_FldName + lk_total_s + ';' + rsEOL + '    ' + lk_FldNameCst + ' = :' + lk_FldNameCst +
    lk_total_s_cst + ';' + rsEOL;

  lk_Col := DBGridEh.Columns.Add;
  lk_Col.Color := DBGridEh.FixedColor;
  lk_Col.DisplayFormat := ',#0.###';
  lk_Col.FieldName := lk_FldName;
  lk_Col.Title.Caption := rsItogQuant;
  lk_Col.Title.TitleButton := True;
  lk_Col.Width := 62;
  lk_Col.Footer.ValueType := fvtSum;
  lk_Col.Footer.FieldName := lk_FldName;
  lk_Col.Footer.DisplayFormat := ',#0.###';
  lk_Col.Footer.Alignment := taRightJustify;
  lk_Col.OnGetCellParams := dbGridGetCellParams;

  if fVisibleCost then
  begin
    lk_Col := DBGridEh.Columns.Add;
    lk_Col.Color := DBGridEh.FixedColor;
    lk_Col.DisplayFormat := ',#0.###';
    lk_Col.FieldName := lk_FldNameCst;
    lk_Col.Title.Caption := rsItogSum;
    lk_Col.Title.TitleButton := True;
    lk_Col.Width := 62;
    lk_Col.Footer.ValueType := fvtSum;
    lk_Col.Footer.FieldName := lk_FldNameCst;
    lk_Col.Footer.DisplayFormat := ',#0.###';
    lk_Col.Footer.Alignment := taRightJustify;
  end;

  lk_Col := DBGridEh.Columns.Add;
  lk_Col.FieldName := 'DESCRIPTION';
  lk_Col.Title.Caption := rsClmnNotice;
  lk_Col.Title.TitleButton := True;
  lk_Col.Width := 255;

  with dsMaterials.SQLs.SelectSQL do
  begin
    Clear;
    Add('EXECUTE BLOCK (');
    Add('MG_ID D_INTEGER = :MG_ID,');
    Add('SHOW_DELETED D_integer = :SHOW_DELETED)');
    Add('RETURNS(');
    Add('   M_ID   D_INTEGER ');
    Add('  ,GR_ID   D_INTEGER ');
    Add('  ,NAME D_VARCHAR100');
    Add('  ,DIMENSION D_VARCHAR10');
    Add('  ,COST D_N15_3');
    Add('  ,M_NUMBER  D_VARCHAR20');
    Add('  ,DESCRIPTION D_NOTICE');
    Add('  ,BEST_SHIPPER_ID D_INTEGER ');
    Add('  ,BEST_SHIPPER D_VARCHAR255');
    Add('  ,BEST_COST D_N15_3');
    Add('  ,IS_UNIT D_IBOOLEAN');
    Add('  ,IS_NET D_IBOOLEAN');
    Add('  ,IS_DIGIT D_IBOOLEAN');
    Add('  ,M_TYPE  D_INTEGER');
    Add('  ,TYPE_NAME D_VARCHAR255');
    Add('  ,BL_ID  D_INTEGER');
    Add('  ,BL_NAME  D_VARCHAR255');
    Add(lk_vars_s);
    Add(')AS ');
    Add('BEGIN ');
    // Add('GR_ID = MG_ID;');
    Add('FOR');
    Add('  select M_ID, NAME, DIMENSION, M_NUMBER, DESCRIPTION, IS_UNIT, COST, m.BEST_SHIPPER_ID, m.BEST_COST, o.O_NAME,');
    Add('         m.Mg_Id, m.IS_DIGIT, m.IS_NET, M_TYPE, t.O_NAME TYPE_NAME, b.Bl_Id, b.Bl_Name ');
    Add('  from MATERIALS m');
    Add('    left outer join OBJECTS o on (o.O_ID = m.BEST_SHIPPER_ID and o.O_TYPE = 29) ');
    Add('    left outer join OBJECTS t on (t.O_ID = m.M_Type and t.O_TYPE = 48) ');
    Add('    left outer join Blob_Tbl b on (b.Owner_Id = m.M_ID and b.Bl_Type = 4) ');
    Add('  where ((m.deleted =0 and :SHOW_DELETED = 0) or (:show_deleted = 1))');
    Add('    and ((:MG_ID = -1) or (((m.MG_ID = :MG_ID) and (not :MG_ID is null)) or ((coalesce(m.MG_ID, -1) = -1) and (:MG_ID is null))))');
    Add('  order by NAME');
    Add('  into :M_ID, :NAME, :DIMENSION, :M_NUMBER, :DESCRIPTION, :IS_UNIT, :COST, :BEST_SHIPPER_ID, :BEST_COST, :BEST_SHIPPER,');
    Add('       :GR_ID, :IS_DIGIT, :IS_NET, :M_TYPE, :TYPE_NAME, :BL_ID, :BL_NAME');
    Add('DO BEGIN');
    Add('      ' + lk_body_s);
    Add('    SUSPEND;');
    Add('END');
    Add('END');
  end;

  if not trRead.InTransaction then
    trRead.StartTransaction;
  try
    // Показ не удаленных или всех
    dsMaterials.ParamByName('SHOW_DELETED').AsInteger := 0;
    dsMaterials.DataSource := srcMatGropups;
    dsMaterials.Open;
  except
  end;
  if DBGridEh.Columns.Count > 0 then
    DBGridEh.FrozenCols := 1;
  DBGridEh.Visible := True;

  Screen.Cursor := crsr;
end;

procedure TMaterialsForm.miRowHightClick(Sender: TObject);
begin
  miRowHight.Checked := not miRowHight.Checked;
  if miRowHight.Checked then
    dbgGridPivotSN.OptionsEh := dbgGridPivotSN.OptionsEh + [dghAutoFitRowHeight]
  else
    dbgGridPivotSN.OptionsEh := dbgGridPivotSN.OptionsEh - [dghAutoFitRowHeight];
end;

procedure TMaterialsForm.pgcInOutChange(Sender: TObject);
begin
  dsRemain.Active := (pgcInOut.ActivePage = tsIn);
  dsJournal.Active := (pgcInOut.ActivePage = tsJournal);
  dsIncome.Active := (pgcInOut.ActivePage = tsIncome);
  dsMove.Active := (pgcInOut.ActivePage = tsMove);
  dsOut.Active := (pgcInOut.ActivePage = tsOUT);
  dsInvent.Active := (pgcInOut.ActivePage = tsInventory);
  dsItogo.Active := (pgcInOut.ActivePage = tsItog);
  dsSerials.Active := (pgcInOut.ActivePage = tsSerials);
  dsPivotSN.Active := (pgcInOut.ActivePage = tsPivotSN);
end;

procedure TMaterialsForm.ppmCopyClick(Sender: TObject);
var
  dbg: TDBGridEh;
begin

  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
      begin
        // Экспорт информации
        if (dmMain.AllowedAction(rght_Export)) then
          DBGridEh_DoCopyAction(dbg, false);
      end
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TMaterialsForm.ppmSaveSelectionClick(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  Ext: String;

begin
  // Экспорт информации
  if (not dmMain.AllowedAction(rght_Export)) then
    exit;

  A4MainForm.SaveDialog.FileName := rsMaterials;
  if (ActiveControl is TDBGridEh) then
    if A4MainForm.SaveDialog.Execute then
    begin
      case A4MainForm.SaveDialog.FilterIndex of
        1:
          begin
            ExpClass := TDBGridEhExportAsUnicodeText;
            Ext := 'txt';
          end;
        2:
          begin
            ExpClass := TDBGridEhExportAsCSV;
            Ext := 'csv';
          end;
        3:
          begin
            ExpClass := TDBGridEhExportAsHTML;
            Ext := 'htm';
          end;
        4:
          begin
            ExpClass := TDBGridEhExportAsRTF;
            Ext := 'rtf';
          end;
        5:
          begin
            ExpClass := TDBGridEhExportAsOLEXLS;
            Ext := 'xls';
          end;
      else
        ExpClass := nil;
        Ext := '';
      end;
      if ExpClass <> nil then
      begin
        if AnsiUpperCase(Copy(A4MainForm.SaveDialog.FileName, Length(A4MainForm.SaveDialog.FileName) - 2, 3)) <>
          AnsiUpperCase(Ext) then
          A4MainForm.SaveDialog.FileName := A4MainForm.SaveDialog.FileName + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass, TDBGridEh(ActiveControl), A4MainForm.SaveDialog.FileName, false);
      end;
    end;
end;

procedure TMaterialsForm.ppmSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;

end;

procedure TMaterialsForm.actAddGroupExecute(Sender: TObject);
begin
  if (not(FAccessFull or FAccessMat)) then
    exit;
  if (dsMaterials.State in [dsInsert, dsEdit]) then
    dsMaterials.Post;
  dsMatGropups.Insert;
  DBGridGroups.SetFocus;
end;

procedure TMaterialsForm.ActAllMaterialsExecute(Sender: TObject);
begin
  //
  ActAllMaterials.Checked := not ActAllMaterials.Checked;
  dsMaterials.Close;
  // Показ всех или группы
  if ActAllMaterials.Checked then
    dsMaterials.ParamByName('IN_GR').AsInteger := 0
  else
    dsMaterials.ParamByName('IN_GR').AsInteger := 1;
  dsMaterials.Open;

  pnlGroup.Enabled := not ActAllMaterials.Checked;
  pnlGroup.Visible := not ActAllMaterials.Checked;
  actAddGroup.Enabled := pnlGroup.Enabled;
  ActEditGroup.Enabled := pnlGroup.Enabled;
  ActDelGroup.Enabled := pnlGroup.Enabled;
end;

procedure TMaterialsForm.actCancelGroupExecute(Sender: TObject);
begin
  dsMatGropups.Cancel;
end;

procedure TMaterialsForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
    begin
      if (((Components[i] as TDBGridEh).DataGrouping.GroupLevels.Count = 0)) then
      begin
        (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
          Self.Name + '.' + Components[i].Name, false);
      end;
    end;
  Action := caFree;
  dsMaterials.Close;
  dsMatGropups.Close;
  MaterialsForm := nil;
end;

procedure TMaterialsForm.actNewExecute(Sender: TObject);
begin
  if (not(FAccessFull or FAccessMat)) then
    exit;
  srcDataSource.DataSet.Insert;
  MaterailForm := TMaterailForm.Create(Application);
  try
    if not dsMatGropups.FieldByName('MG_ID').IsNull then
      MaterailForm.dblMatGroup.Value := dsMatGropups['MG_ID'];

    if MaterailForm.ShowModal = mrOk then
    begin
      srcDataSource.DataSet.Post;
    end
    else
      srcDataSource.DataSet.Cancel;
  finally
    FreeAndNil(MaterailForm);
  end;
end;

procedure TMaterialsForm.actDeleteExecute(Sender: TObject);
begin
  if (not(FAccessFull or FAccessMat)) then
    exit;
  if (MessageDlg(rsDeleteMaterial, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    srcDataSource.DataSet.Delete;
end;

procedure TMaterialsForm.ActDelGroupExecute(Sender: TObject);
begin
  if (not(FAccessFull or FAccessMat)) then
    exit;
  if (MessageDlg(rsDeleteMaterialGroup + rsEOL + rsMatNotDelete, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dsMatGropups.Delete;
end;

procedure TMaterialsForm.actEditExecute(Sender: TObject);
begin
  if (not(FAccessFull or FAccessMat)) then
    exit;
  if (srcDataSource.DataSet.Eof) then
    exit;
  srcDataSource.DataSet.Edit;
  MaterailForm := TMaterailForm.Create(Application);
  try
    if MaterailForm.ShowModal = mrOk then
      srcDataSource.DataSet.Post
    else
      srcDataSource.DataSet.Cancel;
  finally
    FreeAndNil(MaterailForm);
  end;
end;

procedure TMaterialsForm.ActEditGroupExecute(Sender: TObject);
begin
  if (not(FAccessFull or FAccessMat)) then
    exit;

  if (dsMatGropups.FieldByName('MG_ID').IsNull) then
    exit;

  if (dsMatGropups.State in [dsInsert, dsEdit]) then
    dsMaterials.Post;

  dsMatGropups.Edit;
  DBGridGroups.SetFocus;
end;

procedure TMaterialsForm.ActPostGroupExecute(Sender: TObject);
begin
  if ((FAccessFull or FAccessMat)) then
    dsMatGropups.Post
  else
    dsMatGropups.Cancel;
end;

procedure TMaterialsForm.actQuickFilterExecute(Sender: TObject);
var
  i: Integer;
begin
  actQuickFilter.Checked := not actQuickFilter.Checked;

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).STFilter.Visible := actQuickFilter.Checked;
  end;

  if not actQuickFilter.Checked then
  begin
    DBGridGroups.DataSource.DataSet.Filtered := false;
    DBGridEh.DataSource.DataSet.Filtered := false;
    DBGridIncome.DataSource.DataSet.Filtered := false;
  end;
end;

procedure TMaterialsForm.btn1Click(Sender: TObject);
begin
  InitDataSet;
end;

procedure TMaterialsForm.DBGridEhDataHintShow(Sender: TCustomDBGridEh; CursorPos: TPoint; Cell: TGridCoord;
  InCellCursorPos: TPoint; Column: TColumnEh; var Params: TDBGridEhDataHintParams; var Processed: Boolean);
{
  var
  FileName: string;
  ms: TFileStream;

  aCol, aRow, // колонка-строка
  n // порядковый номер ячейки в гриде
  : Integer;
  Pict: TPicture; // TPicture;
  aRect, // ячейка грида
  bRect: TRect; // прямоугольник хинта
  GlobPnt: TPoint; // "лишняя" переменная для удобства отладки и читабельности кода
}
begin
  Processed := false;
  {
    if (dsMaterials.RecordCount = 0) or (dsMaterials.FieldByName('BL_ID').IsNull) or
    (dsMaterials.FieldByName('Bl_Name').IsNull) then
    begin
    // прибьем предыдущий хинт если он еще живой
    if FPictHintWindow <> nil then
    FPictHintWindow.ReleaseHandle;
    exit;
    end;

    // ms := TFileStream.Create(, fmOpenReadWrite) ;
    try
    qReqFile.ParamByName('BL_ID').AsInteger := dsMaterials['BL_ID'];
    qReqFile.Transaction.StartTransaction;
    qReqFile.ExecQuery;
    // qReqFile.FieldByName('Bl_Body').SaveToStream(ms);
    qReqFile.FieldByName('Bl_Body').SaveToFile('b:\hint.jpg');
    qReqFile.Close;
    qReqFile.Transaction.Rollback;
    // if ms.Size > 0 then
    // begin
    // переводим координаты курсора мыши из "компонентных" в "экранные"
    GlobPnt := ClientToScreen(CursorPos);

    // высчитываем координаты прямоугольника хинта,
    // чтоб "правильно" умещался на экране при любом положении мыши
    bRect.Top := GlobPnt.X;
    bRect.Left := GlobPnt.Y;
    bRect.Height := HintMaxSize;
    bRect.Width := HintMaxSize;
    if FPictHintWindow <> nil then
    FPictHintWindow.ReleaseHandle;
    Pict := TPicture.Create; // создаем картинку
    Pict.LoadFromFile('b:\hint.jpg');
    try
    FPictHintWindow := THintWindow.Create(MaterialsForm);
    FPictHintWindow.ActivateHint(bRect, '');
    FPictHintWindow.Canvas.StretchDraw(bRect, Pict.Graphic);
    finally
    FreeAndNil(Pict);
    end;
    // end
    finally
    // ms.Free;
    end;
    Processed := True;
  }
end;

procedure TMaterialsForm.DBGridEhDblClick(Sender: TObject);
begin
  actEdit.Execute;
end;

procedure TMaterialsForm.DBGridEhGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if Column.Tag <> 1 then
    exit;
  if (not Column.Field.DataSet.Active) then
    exit;
  if (Column.Field.AsFloat >= 0) then
    AFont.Color := clBlack
  else
    AFont.Color := clRed;
end;

procedure TMaterialsForm.DBGridEhMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if FPictHintWindow <> nil then
    FPictHintWindow.ReleaseHandle;
end;

procedure TMaterialsForm.dbGridGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Params.Text = '0' then
    Params.Text := '';
end;

procedure TMaterialsForm.DbGridMatDblClick(Sender: TObject);
begin
  if not dsMaterials.FieldByName('M_ID').IsNull then
    actEdit.Execute;
end;

procedure TMaterialsForm.dbgSNDblClick(Sender: TObject);
var
  ScrPt, GrdPt: TPoint;
  Cell: TGridCoord;
  S: String;
  i: Integer;
begin
  ScrPt := Mouse.CursorPos;
  GrdPt := dbgSN.ScreenToClient(ScrPt);
  Cell := dbgSN.MouseCoord(GrdPt.X, GrdPt.Y);
  S := UpperCase(dbgSN.Fields[Cell.X - 1].FieldName);
  if (S = 'OWNER_STR') and (not dsSerials.FieldByName('Owner_Type').IsNull) then
  begin
    if (dsSerials['Owner_Type'] = 1) and (not dsSerials.FieldByName('Owner').IsNull) then
      A4MainForm.ShowCustomers(104, dsSerials['Owner']); // customer_id
  end
end;

procedure TMaterialsForm.dsMaterialsAfterScroll(DataSet: TDataSet);
begin
  if dsPivotSN.Active then
    dsPivotSN.SortOrder := FSortSN;
end;

procedure TMaterialsForm.dsPivotSNAfterOpen(DataSet: TDataSet);
begin
  dbgGridPivotSNSortMarkingChanged(dbgGridPivotSN);
end;

procedure TMaterialsForm.dsPivotSNNewRecord(DataSet: TDataSet);
begin
  dsPivotSN['M_ID'] := dsMaterials['M_ID'];
end;

procedure TMaterialsForm.tbCancelClick(Sender: TObject);
begin
  srcDataSource.DataSet.Cancel;
end;

procedure TMaterialsForm.srcDataSourceStateChange(Sender: TObject);
var
  b: Boolean;
begin
  b := ((Sender as TDataSource).DataSet.State = dsBrowse);
  ToolButton1.Enabled := b;
  ToolButton2.Enabled := b;
  ToolButton3.Enabled := b;
end;

procedure TMaterialsForm.srcRemainDataChange(Sender: TObject; Field: TField);
begin
  ActInDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actInNew.Enabled;
end;

procedure TMaterialsForm.FormCreate(Sender: TObject);
var
  b: Boolean;
  i: Integer;
begin
  // права пользователей
  FAccessMat := dmMain.AllowedAction(rght_Dictionary_Materials);
  FAccessFull := dmMain.AllowedAction(rght_Dictionary_full);
  fVisibleCost := dmMain.AllowedAction(rght_Material_Cost); // просмотр цены

  tsPivotSN.TabVisible := dmMain.CompanyName.Contains('ЛТВ');

  b := FAccessFull or FAccessMat;
  InitDataSet;
  dsMatGropups.Open;
  dsMaterials.Open;

  actNew.Enabled := b;
  actDelete.Enabled := b;
  actEdit.Enabled := b;
  actAddGroup.Enabled := b;
  ActEditGroup.Enabled := b;
  ActDelGroup.Enabled := b;
  actInNew.Enabled := FAccessFull;
  actInEdit.Visible := FAccessFull;
  ActInDelete.Visible := FAccessFull;
  actRemainRecalc.Visible := FAccessFull or FAccessMat;
  pgcInOut.ActivePage := tsIn;

  for i := 0 to dbgIncome.Columns.Count - 1 do
  begin
    if dbgIncome.Columns[i].FieldName = 'SHIPPER_COST' then
      dbgIncome.Columns[i].Visible := fVisibleCost;
  end;

  for i := 0 to dbgJournal.Columns.Count - 1 do
  begin
    if dbgJournal.Columns[i].FieldName = 'RM_COST' then
      dbgJournal.Columns[i].Visible := fVisibleCost
    else if dbgJournal.Columns[i].FieldName = 'ITOGO' then
      dbgJournal.Columns[i].Visible := fVisibleCost;
  end;

  if FAccessFull then
    dbgSN.AllowedOperations := [alopUpdateEh]
  else
    dbgSN.AllowedOperations := [];
  for i := 0 to dbgSN.Columns.Count - 1 do
  begin
    if dbgSN.Columns[i].FieldName = 'COST' then
      dbgSN.Columns[i].Visible := fVisibleCost;
  end;
end;

procedure TMaterialsForm.FormShow(Sender: TObject);
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
end;

procedure TMaterialsForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Enabled;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Enabled;
  actInNew.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and (FAccessFull or FAccessMat);

  tsSerials.TabVisible := (not dsMaterials.FieldByName('IS_UNIT').IsNull) and (dsMaterials['IS_UNIT'] = 1);
end;

procedure TMaterialsForm.srcMatGropupsStateChange(Sender: TObject);
begin
  ActPostGroup.Enabled := not((Sender as TDataSource).DataSet.State = dsBrowse);
  actCancelGroup.Enabled := ActPostGroup.Enabled;
  actAddGroup.Enabled := not ActPostGroup.Enabled;
  ActEditGroup.Enabled := not ActPostGroup.Enabled;
  ActDelGroup.Enabled := not ActPostGroup.Enabled;
end;

procedure TMaterialsForm.actRecalcAllExecute(Sender: TObject);
var
  mid: Integer;
begin
  mid := -1;
  if dsMaterials.FieldByName('M_ID').IsNull then
    mid := dsMaterials.FieldByName('M_ID').AsInteger;

  if TrTemp.InTransaction then
    TrTemp.Rollback;
  QrTemp.Transaction := trWrite;

  QrTemp.SQL.Clear;
  QrTemp.SQL.Add('execute block as');
  QrTemp.SQL.Add('declare variable M_Id integer;');
  QrTemp.SQL.Add('begin');
  QrTemp.SQL.Add('  for select m.M_Id from materials m into :M_Id');
  QrTemp.SQL.Add('  do begin');
  QrTemp.SQL.Add('    execute procedure Material_Remain_Recalc(:M_Id);');
  QrTemp.SQL.Add('  end');
  QrTemp.SQL.Add('end');

  try
    QrTemp.Transaction.StartTransaction;
    QrTemp.ExecQuery;
    QrTemp.Transaction.Commit;
  finally
    if QrTemp.Transaction.InTransaction then
      QrTemp.Transaction.Rollback;
  end;
  QrTemp.Transaction := TrTemp;
  dsMaterials.Close;
  dsMaterials.Open;
  if mid <> -1 then
    dsMaterials.Locate('M_ID', mid, []);
end;

procedure TMaterialsForm.actRemainRecalcExecute(Sender: TObject);
var
  mid: Integer;
begin
  if dsMaterials.FieldByName('M_ID').IsNull then
    exit;

  if TrTemp.InTransaction then
    TrTemp.Rollback;
  mid := dsMaterials.FieldByName('M_ID').AsInteger;
  QrTemp.Transaction := trWrite;
  QrTemp.SQL.Text := 'execute procedure Material_Remain_Recalc(:M_Id)';
  QrTemp.ParamByName('M_ID').AsInteger := mid;
  try
    QrTemp.Transaction.StartTransaction;
    QrTemp.ExecQuery;
    QrTemp.Transaction.Commit;
  finally
    if QrTemp.Transaction.InTransaction then
      QrTemp.Transaction.Rollback;
  end;
  QrTemp.Transaction := TrTemp;
  dsMaterials.Close;
  dsMaterials.Open;
  dsMaterials.Locate('M_ID', mid, []);
end;

procedure TMaterialsForm.actOpenMatDocExecute(Sender: TObject);
var
  d_id: Integer;
  dt_id: Integer;
begin
  d_id := -1;
  dt_id := -1;
  if (dsOut.Active and (not dsOut.FieldByName('DOC_ID').IsNull) and (not dsOut.FieldByName('DT_ID').IsNull)) then
  begin
    d_id := dsOut['DOC_ID'];
    dt_id := dsOut['DT_ID'];
  end
  else
  begin
    if (dsIncome.Active and (not dsIncome.FieldByName('DOC_ID').IsNull) and (not dsIncome.FieldByName('DT_ID').IsNull))
    then
    begin
      d_id := dsIncome['DOC_ID'];
      dt_id := dsIncome['DT_ID'];
    end
  end;

  if d_id < 0 then
    exit;

  case dt_id of
    1:
      MaterialIncomeDocument(d_id); // Приход материалов
    2:
      MaterialMoveDocument(d_id); // Перемещение по складам
    3:
      MaterialOutDocument(d_id); // Списание материалов
    4:
      MaterialCorrectionDocument(d_id); // Коррекция
    5:
      MaterialInventoryDocument(d_id); // Инвентаризация
  end;

end;

procedure TMaterialsForm.dbgIncomeDblClick(Sender: TObject);
begin
  actOpenMatDoc.Execute;
end;

procedure TMaterialsForm.actPrintHistoryExecute(Sender: TObject);
var
  ReportID: Integer;
  Stream: TStream;
begin
  if dsMaterials.FieldByName('M_ID').IsNull then
    exit;

  ReportID := dmMain.GET_ID_REPORT_BY_PATH(rsReportMaterialHistory);

  if ReportID < 0 then
    exit;

  try
    dmMain.fdsLoadReport.ParamByName('ID_REPORT').Value := ReportID;
    dmMain.fdsLoadReport.Open;
    if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').Value <> NULL then
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

  ReportID := frxReport.Variables.IndexOf('MATERIAL');
  if ReportID > 0 then
    frxReport.Variables['MATERIAL'] := dsMaterials['M_ID'];

  frxReport.PrepareReport(True);
  frxReport.ShowPreparedReport;
end;

procedure TMaterialsForm.dbgColumnsZerroCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if Params.Text = '0' then
    Params.Text := '';
end;

procedure TMaterialsForm.dbgGridPivotSNColumns3GetCellParams(Sender: TObject; EditMode: Boolean;
  Params: TColCellParamsEh);

  function HasCyrChar(S: String): Boolean;
  const
    rus: string = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
  var
    p, i: Integer;
  begin
    Result := false;
    if (Copy(S, 1, 6) = 'ПРОДАН') then
      exit;

    for i := 1 to Length(S) do
    begin
      p := Pos(S[i], rus);
      if p > 1 then
      begin
        Result := True;
        Break;
      end;
    end;
  end;

begin
  if EditMode then
    exit;

  if HasCyrChar(Params.Text) then
    Params.Background := clLime;
end;

procedure TMaterialsForm.dbgGridPivotSNDblClick(Sender: TObject);
var
  ScrPt, GrdPt: TPoint;
  Cell: TGridCoord;
  S: String;
  i: Integer;
begin
  ScrPt := Mouse.CursorPos;
  GrdPt := dbgGridPivotSN.ScreenToClient(ScrPt);
  Cell := dbgGridPivotSN.MouseCoord(GrdPt.X, GrdPt.Y);
  S := UpperCase(dbgGridPivotSN.Fields[Cell.X - 1].FieldName);
  if (S = 'ACCOUNT_NO') then
  begin
    if not dsPivotSN.FieldByName('ACCOUNT_NO').IsNull then
      A4MainForm.ShowCustomers(2, dsPivotSN['ACCOUNT_NO']);
  end
  else
  begin
    if not dsPivotSN.FieldByName('RQ_ID').IsNull then
    begin
      if (S = 'RQ_DEFECT') and (dmMain.AllowedAction(rght_Request_full)) then
      begin
        if dsPivotSN.FieldByName('RQ_DEFECT').IsNull then
          S := ''
        else
          S := dsPivotSN.FieldByName('RQ_DEFECT').AsString;

        if EditText(S, 'Примечание', 'Примечание заявки') then
        begin
          if (dsPivotSN.State <> dsEdit) then
            dsPivotSN.Edit;
          dsPivotSN.FieldByName('RQ_DEFECT').AsString := S;
          dsPivotSN.Post;
        end;
      end
      else
      begin
        i := dsPivotSN['RQ_ID'];
        ReguestExecute(i, -2, 1);
      end;
    end;
  end;
end;

procedure TMaterialsForm.dbgGridPivotSNSortMarkingChanged(Sender: TObject);
var
  S: string;
  i, J: Integer;
begin
  J := dbgGridPivotSN.SortMarkedColumns.Count;
  S := ' ';
  for i := 0 to pred(J) do
  begin
    S := S + ' ' + dbgGridPivotSN.SortMarkedColumns[i].FieldName;
    if dbgGridPivotSN.SortMarkedColumns[i].Title.SortMarker = smDownEh then
      S := S + ' desc';
    if i <> pred(J) then
      S := S + ',';
  end;
  FSortSN := S.Trim([',']);

  dsPivotSN.SortOrder := FSortSN;
end;

procedure TMaterialsForm.dbgJournalDblClick(Sender: TObject);
var
  i: Integer;
  ScrPt, GrdPt: TPoint;
  Cell: TGridCoord;
  S: String;
begin
  ScrPt := Mouse.CursorPos;
  GrdPt := dbgJournal.ScreenToClient(ScrPt);
  Cell := dbgJournal.MouseCoord(GrdPt.X, GrdPt.Y);
  S := UpperCase(dbgJournal.Fields[Cell.X - 1].FieldName);
  if (S = 'M_WHERE') then
  begin
    if not dsJournal.FieldByName('Customer_Id').IsNull then
      ShowCustomer(dsJournal['Customer_Id'], false);
  end
  else
  begin
    if dsJournal.FieldByName('RQ_ID').IsNull then
      exit;
    i := dsJournal['RQ_ID'];
    ReguestExecute(i, -2, 1);
  end;
end;

function TMaterialsForm.frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
begin
  Result := dmMain.frxReportUserFunction(MethodName, Params);
end;

end.
