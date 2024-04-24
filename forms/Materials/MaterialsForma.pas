unit MaterialsForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.Controls, Vcl.ExtCtrls,
  pFIBDatabase, FIBDataSet, pFIBDataSet, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, frxClass,
  PropStorageEh,
  FIBQuery, pFIBQuery, FIBDatabase, PropFilerEh, MemTableDataEh, DataDriverEh, pFIBDataDriverEh, DBGridEhGrouping,
  ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, PrjConst, MemTableEh, EhLibMTE, frxDBSet, amSplitter,
  PrnDbgeh;

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
    dbgOut: TDBGridEh;
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
    pmPivot: TPopupMenu;
    miRowHight: TMenuItem;
    frxMaterials: TfrxDBDataset;
    pmSerial: TPopupMenu;
    mi1: TMenuItem;
    mi2: TMenuItem;
    mi3: TMenuItem;
    mi4: TMenuItem;
    miChSerial: TMenuItem;
    actChangeSerial: TAction;
    miN2: TMenuItem;
    Panel1: TPanel;
    btnShowSN: TBitBtn;
    Panel2: TPanel;
    btnShowSN1: TBitBtn;
    Panel3: TPanel;
    btnShowSN2: TBitBtn;
    Panel4: TPanel;
    btnShowSN3: TBitBtn;
    actShowSN: TAction;
    pnl2: TPanel;
    btnactCnPrefixWizard: TBitBtn;
    Panel5: TPanel;
    btnItog: TBitBtn;
    miSep1: TMenuItem;
    miStateChange: TMenuItem;
    miN01: TMenuItem;
    miN11: TMenuItem;
    miN21: TMenuItem;
    miN31: TMenuItem;
    miN41: TMenuItem;
    pmPopUp: TPopupMenu;
    mniFilterFLD: TMenuItem;
    mniN1: TMenuItem;
    pmgCopy: TMenuItem;
    pmgSelectAll: TMenuItem;
    pmgSep2: TMenuItem;
    pmgSaveSelection: TMenuItem;
    pmgSep1: TMenuItem;
    miRefresh: TMenuItem;
    btnPrintIncome: TBitBtn;
    btnPrintMove: TBitBtn;
    btnPrintInvent: TBitBtn;
    btnPrintOut: TBitBtn;
    miPrint: TMenuItem;
    Panel6: TPanel;
    BitBtn2: TBitBtn;
    printGridEh: TPrintDBGridEh;
    actPrintGrid: TAction;
    miPrintGrid: TMenuItem;
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
    procedure btn1Click(Sender: TObject);
    procedure DBGridEhGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure DBGridEhDblClick(Sender: TObject);
    procedure pgcInOutChange(Sender: TObject);
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
    procedure dbgSNDblClick(Sender: TObject);
    procedure actChangeSerialExecute(Sender: TObject);
    procedure DBGridGroupsDblClick(Sender: TObject);
    procedure actShowSNExecute(Sender: TObject);
    procedure miN41Click(Sender: TObject);
    procedure dbgGridPivotDblClick(Sender: TObject);
    procedure SetGridsPopUpMenu(pmGrid: TPopupMenu);
    procedure mniFilterFLDClick(Sender: TObject);
    procedure pmgCopyClick(Sender: TObject);
    procedure pmgSelectAllClick(Sender: TObject);
    procedure pmgSaveSelectionClick(Sender: TObject);
    procedure miRefreshClick(Sender: TObject);
    procedure btnPrintIncomeClick(Sender: TObject);
    procedure mi1Click(Sender: TObject);
    procedure mi2Click(Sender: TObject);
    procedure mi4Click(Sender: TObject);
    procedure actPrintGridExecute(Sender: TObject);
  private
    { Private declarations }
    fVisibleCost: Boolean;
    FAccessFull: Boolean;
    FAccessMat: Boolean;
    FPictHintWindow: THintWindow;
    FSortSN: string;
    FShowSN_Rem: Boolean;
    FShowSN_Inc: Boolean;
    FShowSN_Inv: Boolean;
    FShowSN_Out: Boolean;
    FShowSN_Mov: Boolean;
    FShowSN_Itog: Boolean;
    FMatDocFullAccess: Boolean;
    FMatDocAccessNew: Boolean;
    FMatDocAccessMove: Boolean;
    FMatDocAccessOut: Boolean;
    FMatDocAccessInv: Boolean;
    procedure InitDataSet;
    procedure ShowSNforGrid();
    procedure ShowSNforRem;
    procedure ShowSNforIncome;
    procedure ShowSNforMove;
    procedure ShowSNforItog;
    procedure ShowSNforInvent;
    procedure ShowSNforOut;
    procedure SetColumnVisibility(grid: TDBGridEh; const fld: string; vsbl: Boolean);
    procedure dbGridGetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure LoadReportBody(const fReport_ID: Integer);
  public
    { Public declarations }
  end;

var
  MaterialsForm: TMaterialsForm;

implementation

uses
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, System.Math,
  DM, MAIN, AtrStrUtils, MaterialForma, ReportPreview,
  RequestForma, MatCorrectionDocForma, MatIncomeDocForma,
  MatOutDocForma, TextEditForma, MatMoveDocForma,
  MatInventoryDocForma, CustomerForma, MatGroupForma;

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
    Add('  ,SOLD D_UID_NULL');
    Add('  ,RENT D_UID_NULL');
    Add('  ,LOAN D_UID_NULL');
    Add('  ,BL_ID  D_INTEGER');
    Add('  ,BL_NAME  D_VARCHAR255');
    Add(lk_vars_s);
    Add(')AS ');
    Add('BEGIN ');
    // Add('GR_ID = MG_ID;');
    Add('FOR');
    Add('  select M_ID, NAME, DIMENSION, M_NUMBER, DESCRIPTION, IS_UNIT, COST, m.BEST_SHIPPER_ID, m.BEST_COST, o.O_NAME,');
    Add('         m.Mg_Id, m.IS_DIGIT, m.IS_NET, M_TYPE, t.O_NAME TYPE_NAME, b.Bl_Id, b.Bl_Name, m.SOLD, m.RENT, m.LOAN  ');
    Add('  from MATERIALS m');
    Add('    left outer join OBJECTS o on (o.O_ID = m.BEST_SHIPPER_ID and o.O_TYPE = 29) ');
    Add('    left outer join OBJECTS t on (t.O_ID = m.M_Type and t.O_TYPE = 48) ');
    Add('    left outer join Blob_Tbl b on (b.Owner_Id = m.M_ID and b.Bl_Type = 4) ');
    Add('  where ((m.deleted =0 and :SHOW_DELETED = 0) or (:show_deleted = 1))');
    Add('    and ((:MG_ID = -1) or (((m.MG_ID = :MG_ID) and (not :MG_ID is null)) or ((coalesce(m.MG_ID, -1) = -1) and (:MG_ID is null))))');
    Add('  order by NAME');
    Add('  into :M_ID, :NAME, :DIMENSION, :M_NUMBER, :DESCRIPTION, :IS_UNIT, :COST, :BEST_SHIPPER_ID, :BEST_COST, :BEST_SHIPPER,');
    Add('       :GR_ID, :IS_DIGIT, :IS_NET, :M_TYPE, :TYPE_NAME, :BL_ID, :BL_NAME, :SOLD, :RENT, :LOAN ');
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

procedure TMaterialsForm.mi1Click(Sender: TObject);
var
  dbg: TDBGridEh;
begin
  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
        A4MainForm.CopyDBGrid(dbg)
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TMaterialsForm.mi2Click(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TMaterialsForm.mi4Click(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    A4MainForm.ExportDBGrid((ActiveControl as TDBGridEh), rsTable);
end;

procedure TMaterialsForm.miN41Click(Sender: TObject);
var
  State: Integer;
  mid: Integer;
  SERIAL: string;
begin
  //
  // Статус. 0-на складе, 1-выдан, 2-в ремонте, 3-продан, 4-списан
  // или временный статус = -1*ID объекта (заявки, склада)

  if dsSerials.FieldByName('M_ID').IsNull then
    exit;

  if dsSerials.FieldByName('SERIAL').IsNull then
    exit;

  if TrTemp.InTransaction then
    TrTemp.Rollback;

  mid := dsSerials.FieldByName('M_ID').AsInteger;
  SERIAL := dsSerials.FieldByName('SERIAL').AsString;
  State := (Sender as TMenuItem).Tag;

  if Application.MessageBox(PWideChar(Format('Сменить статус С/Н %s на "%s"?', [SERIAL, (Sender as TMenuItem).Caption])
    ), 'Сменить статус', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
  begin
    exit;
  end;

  QrTemp.Transaction := trWrite;
  QrTemp.SQL.Text := 'update MATERIAL_UNIT set STATE = :state where M_ID = :M_Id and SERIAL = :SERIAL';
  QrTemp.ParamByName('M_ID').AsInteger := mid;
  QrTemp.ParamByName('SERIAL').AsString := SERIAL;
  QrTemp.ParamByName('STATE').AsInteger := State;
  try
    QrTemp.Transaction.StartTransaction;
    QrTemp.ExecQuery;
    QrTemp.Transaction.Commit;
  finally
    if QrTemp.Transaction.InTransaction then
      QrTemp.Transaction.Rollback;
  end;
  QrTemp.Transaction := TrTemp;
  dsSerials.Refresh;
end;

procedure TMaterialsForm.miRefreshClick(Sender: TObject);
var
  bm: TbookMark;
  cr: TCursor;
  dbGrid: TDBGridEh;
begin
  if not(Sender is TMenuItem) then
    exit;

  if not(((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent is TDBGridEh) then
    exit;

  dbGrid := (((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent as TDBGridEh);
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    bm := dbGrid.DataSource.DataSet.GetBookMark;
    dbGrid.DataSource.DataSet.Close;
    dbGrid.DataSource.DataSet.Open;
    dbGrid.DataSource.DataSet.GotoBookmark(bm);
  finally
    Screen.Cursor := cr;
  end;
end;

procedure TMaterialsForm.mniFilterFLDClick(Sender: TObject);
var
  dbGrid: TDBGridEh;
  vis: Boolean;
begin
  if not(Sender is TMenuItem) then
    exit;

  if not(((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent is TDBGridEh) then
    exit;

  dbGrid := (((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent as TDBGridEh);

  vis := dbGrid.SearchPanel.Visible;
  try
    dbGrid.SearchPanel.Visible := True;
    dbGrid.SearchPanel.SearchingText := dbGrid.SelectedField.AsString;
    dbGrid.SearchPanel.ApplySearchFilter;
    dbGrid.SearchPanel.Active := True;
  except
    dbGrid.SearchPanel.CancelSearchFilter;
    dbGrid.SearchPanel.Visible := vis;
  end;
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
end;

procedure TMaterialsForm.pmgCopyClick(Sender: TObject);
var
  dbg: TDBGridEh;
begin
  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
        A4MainForm.CopyDBGrid(dbg)
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TMaterialsForm.pmgSaveSelectionClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    A4MainForm.ExportDBGrid((ActiveControl as TDBGridEh), rsTable);
end;

procedure TMaterialsForm.pmgSelectAllClick(Sender: TObject);
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

  MatGroupForm := TMatGroupForm.Create(Application);
  try
    if MatGroupForm.ShowModal = mrOk then
    begin
      dsMatGropups.Post;
    end
    else
      dsMatGropups.Cancel;
  finally
    FreeAndNil(MatGroupForm);
  end;
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

procedure TMaterialsForm.actChangeSerialExecute(Sender: TObject);
var
  SERIAL: String;
begin
  if (dsSerials.FieldByName('M_ID').IsNull) or (dsSerials.FieldByName('SERIAL').IsNull) then
    exit;

  SERIAL := InputBox(rsChangeSerial, dsSerials['SERIAL'] + ' ->', dsSerials['SERIAL']);

  if SERIAL.IsEmpty or (SERIAL = dsSerials['SERIAL']) then
    exit;

  if TrTemp.InTransaction then
    TrTemp.Rollback;

  QrTemp.Transaction := trWrite;
  QrTemp.SQL.Text := 'execute procedure MATERIAL_CHANGE_SN(:M_Id, :Old_Serial, :New_Serial)';
  QrTemp.ParamByName('M_Id').AsInteger := dsSerials['M_ID'];
  QrTemp.ParamByName('Old_Serial').AsString := dsSerials['SERIAL'];
  QrTemp.ParamByName('New_Serial').AsString := SERIAL;

  try
    QrTemp.Transaction.StartTransaction;
    QrTemp.ExecQuery;
    QrTemp.Transaction.Commit;
  finally
    if QrTemp.Transaction.InTransaction then
      QrTemp.Transaction.Rollback;
  end;
  QrTemp.Transaction := TrTemp;
  dsSerials.Close;
  dsSerials.Open;
  if not SERIAL.IsEmpty then
    dsSerials.Locate('SERIAL', SERIAL, []);
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
  MaterialForm := TMaterialForm.Create(Application);
  try
    if not dsMatGropups.FieldByName('MG_ID').IsNull then
      MaterialForm.dblMatGroup.Value := dsMatGropups['MG_ID'];

    if MaterialForm.ShowModal = mrOk then
    begin
      srcDataSource.DataSet.Post;
    end
    else
      srcDataSource.DataSet.Cancel;
  finally
    FreeAndNil(MaterialForm);
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
  MaterialForm := TMaterialForm.Create(Application);
  try
    if MaterialForm.ShowModal = mrOk then
      srcDataSource.DataSet.Post
    else
      srcDataSource.DataSet.Cancel;
  finally
    FreeAndNil(MaterialForm);
  end;
end;

procedure TMaterialsForm.ActEditGroupExecute(Sender: TObject);
begin
  if (not(FAccessFull or FAccessMat)) then
    exit;

  if (dsMatGropups.FieldByName('MG_ID').IsNull) then
    exit;

  if (dsMatGropups.FieldByName('MG_ID').AsInteger = -1) then
    exit;

  if (dsMatGropups.State in [dsInsert, dsEdit]) then
    dsMaterials.Post;

  dsMatGropups.Edit;
  MatGroupForm := TMatGroupForm.Create(Application);
  try
    if MatGroupForm.ShowModal = mrOk then
    begin
      dsMatGropups.Post;
    end
    else
      dsMatGropups.Cancel;
  finally
    FreeAndNil(MatGroupForm);
  end;
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

procedure TMaterialsForm.btnPrintIncomeClick(Sender: TObject);
var
  i, ri: Integer;
  dbGrid: TDBGridEh;
  printDoc: Boolean;
begin
  printDoc := True;
  if pgcInOut.ActivePage = tsIncome then
    dbGrid := dbgIncome
  else if pgcInOut.ActivePage = tsMove then
    dbGrid := dbgMove
  else if pgcInOut.ActivePage = tsInventory then
    dbGrid := dbgInvent
  else if pgcInOut.ActivePage = tsOUT then
    dbGrid := dbgOut
  else if pgcInOut.ActivePage = tsSerials then
  begin
    printDoc := false;
    dbGrid := dbgSN;
  end
  else
    exit;

  if printDoc and (not dbGrid.DataSource.DataSet.FieldByName('DT_REPORT').IsNull) then
  begin
    ri := dmMain.GET_ID_REPORT_BY_PATH(dbGrid.DataSource.DataSet['DT_REPORT']);
    if ri >= 0 then
    begin
      LoadReportBody(ri);
      ri := frxReport.Variables.IndexOf('DOC_ID');
      if (ri >= 0) and dbGrid.DataSource.DataSet.Active and (not dbGrid.DataSource.DataSet.FieldByName('DOC_ID').IsNull)
      then
        frxReport.Variables['DOC_ID'] := dbGrid.DataSource.DataSet['DOC_ID'];

      frxReport.PrepareReport(True);
      printDoc := True;
    end;
  end
  else
  begin
    printDoc := false;
    if pgcInOut.ActivePage = tsSerials then
    begin
      ri := dmMain.GET_ID_REPORT_BY_PATH('Материал_СН');
      if (ri >= 0) then
      begin
        LoadReportBody(ri);
        ri := frxReport.Variables.IndexOf('MAT_ID');
        if (ri >= 0) and dbGrid.DataSource.DataSet.Active and (not dbGrid.DataSource.DataSet.FieldByName('M_Id').IsNull)
        then
          frxReport.Variables['MAT_ID'] := dbGrid.DataSource.DataSet['M_Id'];

        printDoc := True;
        frxReport.PrepareReport(True);
      end;
    end;

  end;

  if printDoc then
  begin
    frxReport.ReportOptions.Name := frxReport.FILENAME;
    frxReport.ShowPreparedReport;
  end;
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

procedure TMaterialsForm.DBGridGroupsDblClick(Sender: TObject);
begin
  ActEditGroup.Execute;
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
begin
  // права пользователей
  FAccessMat := dmMain.AllowedAction(rght_Dictionary_Materials);
  FAccessFull := dmMain.AllowedAction(rght_Dictionary_full);
  fVisibleCost := dmMain.AllowedAction(rght_Material_Cost); // просмотр цены

  FMatDocFullAccess := dmMain.AllowedAction(rght_Materials_full) or dmMain.AllowedAction(rght_Dictionary_full);
  FMatDocAccessNew := FMatDocFullAccess or dmMain.AllowedAction(rght_Dictionary_MatDocNew);
  FMatDocAccessMove := FMatDocFullAccess or dmMain.AllowedAction(rght_Dictionary_MatDocMove);
  FMatDocAccessOut := FMatDocFullAccess or dmMain.AllowedAction(rght_Dictionary_MatDocOUT);
  FMatDocAccessInv := FMatDocFullAccess or dmMain.AllowedAction(rght_Dictionary_MatDocInvent);

  actPrintGrid.Visible := dmMain.AllowedAction(rght_Reports_view);

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
  actChangeSerial.Visible := FAccessFull or FAccessMat;
  actRemainRecalc.Visible := FAccessFull or FAccessMat;
  pgcInOut.ActivePage := tsIn;
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

  SetColumnVisibility(dbgIncome, 'SHIPPER_COST', fVisibleCost);
  SetColumnVisibility(dbgJournal, 'RM_COST', fVisibleCost);
  SetColumnVisibility(dbgJournal, 'ITOGO', fVisibleCost);
  SetColumnVisibility(dbgSN, 'COST', fVisibleCost);
  if FAccessFull then
    dbgSN.AllowedOperations := [alopUpdateEh]
  else
    dbgSN.AllowedOperations := [];

  SetColumnVisibility(DBGridIncome, 'SERIAL', false);
  SetColumnVisibility(dbgIncome, 'SERIAL', false);
  SetColumnVisibility(dbgMove, 'SERIAL', false);
  SetColumnVisibility(dbgInvent, 'SERIAL', false);
  SetColumnVisibility(dbgOut, 'SERIAL', false);
  SetColumnVisibility(dbgGridPivot, 'SERIAL', false);

  miStateChange.Visible := FAccessFull;
  miSep1.Visible := miStateChange.Visible;
  SetGridsPopUpMenu(pmPopUp);
end;

procedure TMaterialsForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Enabled;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Enabled;
  actInNew.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and (FAccessFull or FAccessMat);

  tsSerials.TabVisible := (not dsMaterials.FieldByName('IS_UNIT').IsNull) and (dsMaterials['IS_UNIT'] = 1);
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

procedure TMaterialsForm.actShowSNExecute(Sender: TObject);
begin
  ShowSNforGrid();
end;

procedure TMaterialsForm.actOpenMatDocExecute(Sender: TObject);
var
  d_id: Integer;
  dt_id: Integer;
  ds: TpFIBDataSet;
begin
  d_id := -1;
  dt_id := -1;

  if pgcInOut.ActivePage = tsIncome then
    ds := dsIncome
  else if pgcInOut.ActivePage = tsMove then
    ds := dsMove
  else if pgcInOut.ActivePage = tsOUT then
    ds := dsOut
  else if pgcInOut.ActivePage = tsInventory then
    ds := dsInvent
  else
    exit;

  if (not ds.FieldByName('DOC_ID').IsNull) and (not ds.FieldByName('DT_ID').IsNull) then
  begin
    d_id := ds['DOC_ID'];
    dt_id := ds['DT_ID'];
  end;

  if d_id < 0 then
    exit;

  case dt_id of
    1:
      if (FMatDocAccessNew) then
        MaterialIncomeDocument(d_id); // Приход материалов
    2:
      if (FMatDocAccessMove) then
        MaterialMoveDocument(d_id); // Перемещение по складам
    3:
      if (FMatDocAccessOut) then
        MaterialOutDocument(d_id); // Списание материалов
    4:
      if (FMatDocAccessInv) then
        MaterialCorrectionDocument(d_id); // Инвентаризация
    5:
      if (FMatDocAccessInv) then
        MaterialInventoryDocument(d_id); // Инвентаризация
  end;
end;

procedure TMaterialsForm.dbgIncomeDblClick(Sender: TObject);
begin
  actOpenMatDoc.Execute;
end;

procedure TMaterialsForm.actPrintGridExecute(Sender: TObject);
var
  dbg: TDBGridEh;
begin
  if (ActiveControl is TDBGridEh) then
  begin
    printGridEh.DBGridEh := (ActiveControl as TDBGridEh);
    printGridEh.Preview;
  end;
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
        frxReport.FILENAME := dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString;
        frxReport.PreviewForm.Caption := frxReport.FILENAME;
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

procedure TMaterialsForm.dbgGridPivotDblClick(Sender: TObject);
var
  i: Integer;
  ScrPt, GrdPt: TPoint;
  Cell: TGridCoord;
  f: String;
begin
  if dsItogo.FieldByName('DOC_ID').IsNull or dsItogo.FieldByName('M_TYPE_ID').IsNull then
    exit;
  ScrPt := Mouse.CursorPos;
  GrdPt := dbgGridPivot.ScreenToClient(ScrPt);
  Cell := dbgGridPivot.MouseCoord(GrdPt.X, GrdPt.Y);
  f := UpperCase(dbgGridPivot.Fields[Cell.X - 1].FieldName);
  if (f = 'M_DOC') or (f = 'M_TYPE') then
  begin
    {
      7 'возврат С заявки'
      8 'списание НА заявку'
    }
    i := dsItogo['M_TYPE_ID'];
    if (i in [7, 8]) then begin
      ReguestExecute(dsItogo['DOC_ID'], -2, 1);
    end
    else begin
      case i of
        1:
          if (FMatDocAccessNew) then
            MaterialIncomeDocument(dsItogo['DOC_ID']); // Приход материалов
        2:
          if (FMatDocAccessMove) then
            MaterialMoveDocument(dsItogo['DOC_ID']); // Перемещение по складам
        3:
          if (FMatDocAccessMove) then
            MaterialMoveDocument(dsItogo['DOC_ID']); // Перемещение по складам
        4:
          if (FMatDocAccessOut) then
            MaterialOutDocument(dsItogo['DOC_ID']); // Списание материалов
        5:
          if (FMatDocAccessInv) then
            MaterialCorrectionDocument(dsItogo['DOC_ID']); // Инвентаризация
        6:
          if (FMatDocAccessInv) then
            MaterialInventoryDocument(dsItogo['DOC_ID']); // Инвентаризация
      end;
    end;
  end;
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
    begin
      // ShowCustomer(dsJournal['Customer_Id'], false);
      A4MainForm.ShowCustomers(104, dsJournal['Customer_Id']); // customer_id
    end;
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

procedure TMaterialsForm.ShowSNforGrid();
begin
  if (pgcInOut.ActivePage = tsIn) then
    ShowSNforRem
  else if (pgcInOut.ActivePage = tsIncome) then
    ShowSNforIncome
  else if (pgcInOut.ActivePage = tsMove) then
    ShowSNforMove
  else if (pgcInOut.ActivePage = tsOUT) then
    ShowSNforOut
  else if (pgcInOut.ActivePage = tsInventory) then
    ShowSNforInvent
  else if (pgcInOut.ActivePage = tsItog) then
    ShowSNforItog
end;

procedure TMaterialsForm.ShowSNforRem;
begin
  FShowSN_Rem := not FShowSN_Rem;
  dsRemain.Close;
  if FShowSN_Rem then
  begin
    dsRemain.ParamByName('qnt_clause').Value := 'iif(u.Serial is null, m.Mr_Quant, 1)';
    dsRemain.ParamByName('sn_clause').Value := 'u.Serial';
    dsRemain.ParamByName('join_clause').Value := ' left outer join Material_Unit u on ' +
      '(u.M_Id = t.M_Id and u.Owner_Type = 0 and u.Owner = m.WH_ID)';
  end
  else
  begin
    dsRemain.Params.ByName['qnt_clause'].SetDefMacroValue;
    dsRemain.Params.ByName['sn_clause'].SetDefMacroValue;
    dsRemain.Params.ByName['join_clause'].SetDefMacroValue;
  end;
  dsRemain.Open;
  SetColumnVisibility(DBGridIncome, 'SERIAL', FShowSN_Rem);
end;

procedure TMaterialsForm.ShowSNforIncome;
begin
  FShowSN_Inc := not FShowSN_Inc;
  dsIncome.Close;
  if FShowSN_Inc then
  begin
    dsIncome.ParamByName('qnt_clause').Value := 'iif(u.Serial is null, im.M_Quant, 1)';
    dsIncome.ParamByName('sn_clause').Value := 'u.Serial';
    dsIncome.ParamByName('join_clause').Value :=
      'left outer join Materials_In_Doc_Unit u on (u.Doc_Id = d.Doc_Id and u.M_Id = im.M_Id and u.Id = im.Id)';
  end
  else
  begin
    dsIncome.Params.ByName['qnt_clause'].SetDefMacroValue;
    dsIncome.Params.ByName['sn_clause'].SetDefMacroValue;
    dsIncome.Params.ByName['join_clause'].SetDefMacroValue;
  end;
  dsIncome.Open;
  SetColumnVisibility(dbgIncome, 'SERIAL', FShowSN_Inc);
end;

procedure TMaterialsForm.ShowSNforMove;
begin
  FShowSN_Mov := not FShowSN_Mov;
  dsMove.Close;
  if FShowSN_Mov then
  begin
    dsMove.ParamByName('qnt_clause').Value := 'iif(u.Serial is null, im.M_Quant, 1)';
    dsMove.ParamByName('sn_clause').Value := 'u.Serial';
    dsMove.ParamByName('join_clause').Value :=
      'left outer join Materials_In_Doc_Unit u on (u.Doc_Id = d.Doc_Id and u.M_Id = :M_Id)';
  end
  else
  begin
    dsMove.Params.ByName['qnt_clause'].SetDefMacroValue;
    dsMove.Params.ByName['sn_clause'].SetDefMacroValue;
    dsMove.Params.ByName['join_clause'].SetDefMacroValue;
  end;
  dsMove.Open;
  SetColumnVisibility(dbgMove, 'SERIAL', FShowSN_Mov);
end;

procedure TMaterialsForm.ShowSNforItog;
begin
  FShowSN_Itog := not FShowSN_Itog;
  dsItogo.Close;
  drvFIB.SelectSQL.Text := Format('select * from MATERIALS_SUMMARY(:M_ID, %d)', [IfThen(FShowSN_Itog, 1, 0)]);
  dsItogo.Open;
  SetColumnVisibility(dbgGridPivot, 'SERIAL', FShowSN_Itog);
end;

procedure TMaterialsForm.ShowSNforInvent;
begin
  FShowSN_Inv := not FShowSN_Inv;
end;

procedure TMaterialsForm.ShowSNforOut;
begin
  FShowSN_Out := not FShowSN_Out;
  dsOut.Close;
  if FShowSN_Out then
  begin
    dsOut.ParamByName('qnt_clause').Value := 'iif(u.Serial is null, -1*im.M_Quant, -1)';
    dsOut.ParamByName('sn_clause').Value := 'u.Serial';
    dsOut.ParamByName('itg_clause').Value := 'iif(u.Serial is null, -1*im.M_Quant, -1)*m.Cost';
    dsOut.ParamByName('join_clause').Value :=
      'left outer join Materials_In_Doc_Unit u on (u.Doc_Id = d.Doc_Id and u.M_Id = im.M_Id and u.Id = im.Id)';
  end
  else
  begin
    dsOut.Params.ByName['qnt_clause'].SetDefMacroValue;
    dsOut.Params.ByName['sn_clause'].SetDefMacroValue;
    dsOut.Params.ByName['itg_clause'].SetDefMacroValue;
    dsOut.Params.ByName['join_clause'].SetDefMacroValue;
  end;
  dsOut.Open;
  SetColumnVisibility(dbgOut, 'SERIAL', FShowSN_Out);
end;

procedure TMaterialsForm.SetColumnVisibility(grid: TDBGridEh; const fld: string; vsbl: Boolean);
var
  i: Integer;
begin
  for i := 0 to grid.Columns.Count - 1 do
    if grid.Columns[i].FieldName = fld then
      grid.Columns[i].Visible := vsbl;
end;

procedure TMaterialsForm.SetGridsPopUpMenu(pmGrid: TPopupMenu);
var
  rghtExport: Boolean;
var
  i: Integer;
begin
  rghtExport := dmMain.AllowedAction(rght_Export);
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      (Components[i] as TDBGridEh).EditActions := (Components[i] as TDBGridEh).EditActions + [geaCopyEh];
      (Components[i] as TDBGridEh).Options := (Components[i] as TDBGridEh).Options - [dgRowSelect];
      (Components[i] as TDBGridEh).OptionsEh := (Components[i] as TDBGridEh).OptionsEh + [dghRowHighlight];
      if rghtExport then
      begin
        (Components[i] as TDBGridEh).AllowedSelections := [gstRecordBookmarks, gstRectangle, gstColumns, gstAll];
        (Components[i] as TDBGridEh).Options := (Components[i] as TDBGridEh).Options + [dgMultiSelect];
      end
      else
      begin
        (Components[i] as TDBGridEh).AllowedSelections := [];
        (Components[i] as TDBGridEh).Options := (Components[i] as TDBGridEh).Options - [dgMultiSelect];
      end;

      if ((Components[i] as TDBGridEh).PopUpMenu = nil) then
        (Components[i] as TDBGridEh).PopUpMenu := pmGrid;
    end;
  end;
end;

procedure TMaterialsForm.LoadReportBody(const fReport_ID: Integer);
var
  Stream: TStream;
begin
  try
    dmMain.fdsLoadReport.ParamByName('ID_REPORT').Value := fReport_ID;
    dmMain.fdsLoadReport.Open;
    if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').Value <> NULL then
    begin
      Stream := TMemoryStream.Create;
      try
        TBlobField(dmMain.fdsLoadReport.FieldByName('REPORT_BODY')).SaveToStream(Stream);
        Stream.Position := 0;
        frxReport.LoadFromStream(Stream);
        frxReport.FILENAME := dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString;
        frxReport.PreviewForm.Caption := frxReport.FILENAME;
      finally
        Stream.Free;
      end;
    end;
  finally
    if dmMain.fdsLoadReport.Active then
      dmMain.fdsLoadReport.Close;
  end;
end;

end.
