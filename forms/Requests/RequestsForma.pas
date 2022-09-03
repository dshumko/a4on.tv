unit RequestsForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Menus,
  DBGridEh, FIBDataSet, pFIBDataSet, DBCtrlsEh, frxClass, frxDBSet, EhLibFIB, DBGridEhImpExp, GridsEh, DBGridEhGrouping,
  ReqWorksFrame, MemTableDataEh, DataDriverEh, pFIBDataDriverEh, MemTableEh, ReqMaterialsFrame, PropFilerEh,
  PropStorageEh,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL, FIBDatabase, pFIBDatabase, DynVarsEh;

type
  TRequestsForm = class(TForm)
    ToolBar1: TToolBar;
    Actions: TActionList;
    actNew: TAction;
    actDelete: TAction;
    actEdit: TAction;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    actQuickFilter: TAction;
    pmPopUp: TPopupMenu;
    pmgCopy: TMenuItem;
    pmgSelectAll: TMenuItem;
    pmgSep1: TMenuItem;
    pmgSaveSelection: TMenuItem;
    pnlClientInfo: TPanel;
    dsAll: TpFIBDataSet;
    actShowInfo: TAction;
    ToolButton8: TToolButton;
    pnlContetnt: TPanel;
    Label5: TLabel;
    dbContent: TDBMemoEh;
    ToolButton11: TToolButton;
    actPrint: TAction;
    ToolButton13: TToolButton;
    actFilter: TAction;
    actEnableFilter: TAction;
    ToolButton14: TToolButton;
    frxReport: TfrxReport;
    ToolButton16: TToolButton;
    actSelectPrint: TAction;
    gridPopUp: TPopupMenu;
    N6: TMenuItem;
    N9: TMenuItem;
    N8: TMenuItem;
    ppmCopy: TMenuItem;
    ppmSelectAll: TMenuItem;
    MenuItem1: TMenuItem;
    ppmSaveSelection: TMenuItem;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    frxDBrequests: TfrxDBDataset;
    frxDBReqMaterials: TfrxDBDataset;
    mtPlan: TMemTableEh;
    drvPlan: TpFIBDataDriverEh;
    btnQuickFilter: TToolButton;
    btn2: TToolButton;
    actGIVE: TAction;
    actCancel: TAction;
    actRefresh: TAction;
    btnRefresh: TToolButton;
    N14: TMenuItem;
    N15: TMenuItem;
    actChangeDay: TAction;
    N16: TMenuItem;
    pgcGrids: TPageControl;
    tsPlan: TTabSheet;
    tsGive: TTabSheet;
    tsExec: TTabSheet;
    tsAll: TTabSheet;
    dbgGrid: TDBGridEh;
    dbgPlan: TDBGridEh;
    dbgGive: TDBGridEh;
    dbgExec: TDBGridEh;
    srcPlan: TDataSource;
    tlbGive: TToolBar;
    btnChangeDay: TToolButton;
    btn1: TToolButton;
    tlbPlan: TToolBar;
    btnSelectPrint: TToolButton;
    btn3: TToolButton;
    btnGIVE1: TToolButton;
    btn5: TToolButton;
    btnCancel: TToolButton;
    btn4: TToolButton;
    chkGroupPlan: TCheckBox;
    chkGroupGive: TCheckBox;
    mtGive: TMemTableEh;
    drvGive: TpFIBDataDriverEh;
    srcGive: TDataSource;
    mtExec: TMemTableEh;
    drvExec: TpFIBDataDriverEh;
    srcExec: TDataSource;
    mtAll: TMemTableEh;
    drvAll: TpFIBDataDriverEh;
    srcAll: TDataSource;
    tlb1: TToolBar;
    chkGrupeExec: TCheckBox;
    ToolBar2: TToolBar;
    chkGroupAll: TCheckBox;
    btnShowInfo: TToolButton;
    btnOpenAll: TToolButton;
    btn8: TToolButton;
    actOpenAll: TAction;
    btnPrint: TToolButton;
    btn7: TToolButton;
    actPrintAN: TAction;
    dsPlan: TpFIBDataSet;
    dsGive: TpFIBDataSet;
    dsExec: TpFIBDataSet;
    N17: TMenuItem;
    N18: TMenuItem;
    btnCloseGroup1: TToolButton;
    btnCloseGroup: TToolButton;
    actCloseGroup: TAction;
    btnFilterCustomer: TToolButton;
    actFilterCustomer: TAction;
    PropStorage: TPropStorageEh;
    btnDouble: TToolButton;
    btn12: TToolButton;
    actDouble: TAction;
    dsFilter: TMemTableEh;
    frxRequests: TfrxDBDataset;
    btnSelectPrint1: TToolButton;
    btn9: TToolButton;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    btn6: TToolButton;
    btnPlaner: TToolButton;
    actPlaner: TAction;
    pnl1: TPanel;
    pnlMaterials: TPanel;
    frmReqMaterials: TfrmReqMaterials;
    pnlWorks: TPanel;
    frmWorks: TfrmReqWorks;
    splMat: TSplitter;
    splWork: TSplitter;
    btnTask: TToolButton;
    actTask: TAction;
    actOpenHouse: TAction;
    miOpenHouse: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actShowInfoExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actEnableFilterExecute(Sender: TObject);
    procedure frxDBrequestsCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxDBrequestsFirst(Sender: TObject);
    procedure frxDBrequestsNext(Sender: TObject);
    procedure frxDBrequestsPrior(Sender: TObject);
    procedure actSelectPrintExecute(Sender: TObject);
    procedure dbgGridDblClick(Sender: TObject);
    procedure ppmCopyClick(Sender: TObject);
    procedure ppmSelectAllClick(Sender: TObject);
    procedure ppmSaveSelectionClick(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure dbGridSortMarkingChanged(Sender: TObject);
    procedure dbgGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure pmgCopyClick(Sender: TObject);
    procedure pmgSelectAllClick(Sender: TObject);
    procedure pmgSaveSelectionClick(Sender: TObject);
    procedure actQuickFilterExecute(Sender: TObject);
    function frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure FormCreate(Sender: TObject);
    procedure chkGroupPlanClick(Sender: TObject);
    procedure dsFilterNewRecord(DataSet: TDataSet);
    procedure actGIVEExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actChangeDayExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgGridDataGroupGetRowText(Sender: TCustomDBGridEh; GroupDataTreeNode: TGroupDataTreeNodeEh;
      var GroupRowText: string);
    procedure pgcGridsChange(Sender: TObject);
    procedure chkGroupGiveClick(Sender: TObject);
    procedure chkGrupeExecClick(Sender: TObject);
    procedure chkGroupAllClick(Sender: TObject);
    procedure actOpenAllExecute(Sender: TObject);
    procedure actPrintANExecute(Sender: TObject);
    procedure actCloseGroupExecute(Sender: TObject);
    procedure actFilterCustomerExecute(Sender: TObject);
    procedure actDoubleExecute(Sender: TObject);
    procedure actPlanerExecute(Sender: TObject);
    procedure PropStorageAfterLoadProps(Sender: TObject);
    procedure actTaskExecute(Sender: TObject);
    procedure dbGridGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
    procedure dbgPlanColumns13GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgGiveColumns13GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgExecColumns15GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgGridColumns14GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure actOpenHouseExecute(Sender: TObject);
  private
    { Private declarations }
    fSelectedRow: Integer; // число помеченных строк
    FullAccess: Boolean; // полный доступ
    FPersonalData: Boolean;
    CE: Boolean; // может изменять результат выполнения
    CC: Boolean; // может закрыть заявку
    CA: Boolean; // может добавить заявку
    CG: Boolean; // может выдать заявку
    CD: Boolean; // может Удалить заявку
    FCanSaveColumns: Boolean;
    fVisibleCost: Boolean;
    FVisibleSum: Boolean;
    fAsBalance: Boolean;
    function GenerateFilter: string;
    procedure GiveRequest(const req_id: Integer; const date: TDateTime; const WorkGroup: Integer = -1;
      const Workers: String = '');
    procedure ChangeDayRequest(const req_id: Integer; const date: TDateTime);
    procedure LoadReportBody(const fReport_ID: Integer);
    procedure AddReport(const r_id: Integer; const variable: string; const value: Variant;
      const AsNew: Boolean = False);
    procedure SwitchTreeMode(chkBox: TCheckBox; TreeGrid: TDBGridEh; FibDS: TpFIBDataSet; MemDS: TMemTableEh);
    function GetActiveGrid(): TDBGridEh;
  public
    { Public declarations }
    procedure SetDefaultFilter;

  end;

var
  RequestsForm: TRequestsForm;

implementation

uses
  System.DateUtils, System.StrUtils,
  RequestForma, RequestFilterForma, MAIN, DM, AtrCommon, AtrStrUtils, pFIBQuery, SelDateForma, RequestNewForma,
  ReqGiveForma, CF,
  ReportPreview, ReqPlanerForma;

{$R *.dfm}

// Найдем индекс поля в таблице по названюи
function findInex(const FLD_NAME: string; Grid: TDBGridEh): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 0 to Grid.Columns.Count - 1 do
  begin
    if AnsiUpperCase(Grid.Columns[i].FieldName) = FLD_NAME then
      Result := Grid.Columns[i].Index;
  end;
end;

procedure TRequestsForm.SetDefaultFilter;
var
  f: string;
begin
  dsFilter.Close;
  dsFilter.Open;
  dsFilter.EmptyTable;
  f := A4MainForm.GetUserFilterFolder + 'RDefault.JRF';
  if FileExists(f) then
  begin
    DatasetFromJson(dsFilter, f);
  end
  else
  begin
    f := A4MainForm.GetUserFilterFolder + 'RDefault.rf';
    if FileExists(f) then
    begin
      DatasetFromINI(dsFilter, f);
    end
  end;
end;

function TRequestsForm.GenerateFilter: string;
var
  whereStr: String;
  RecordFtr: string;
  filter: TStrings;
  default: string;
  cr: Integer;

  procedure addToFilter(const s: string);
  var
    clears: string;
  begin
    clears := StringReplace(s, ' ', '', [rfReplaceAll]);
    if clears <> '()' then
    begin
      if RecordFtr <> '' then
        RecordFtr := RecordFtr + ' and ' + s
      else
        RecordFtr := s;
    end;
  end;

  function DatesFltr(const fld, period, before, after: string): string;
  var
    startSQL, tmpSQL: string;
  begin
    tmpSQL := '';
    startSQL := '';
    if period <> '' then
      startSQL := '(' + fld + period + ' )';

    if (before <> '') then
      tmpSQL := '( ' + fld + before + ' )';

    if (after <> '') then
    begin
      if (tmpSQL <> '') then
        tmpSQL := '(' + tmpSQL + ' and ( ' + fld + after + ' ))'
      else
        tmpSQL := '( ' + fld + after + ' )';
    end;

    if (startSQL <> '') then
    begin
      if tmpSQL <> '' then
        startSQL := startSQL + ' OR ' + tmpSQL;
    end
    else
      startSQL := tmpSQL;
    Result := startSQL;
  end;

  function ListToFilter: String;
  var
    startSQL, tmpSQL, s, t: string;
    arr: TStringArray;
    i: Integer;
  begin
    Result := '';
    tmpSQL := '';
    startSQL := '';
    if (not dsFilter.FieldByName('ListBids').IsNull) then
    begin
      s := Trim(dsFilter.FieldByName('ListBids').AsString);
      s := ReplaceStr(s, '''', ' ');
      s := ReplaceStr(s, ' ', ',');
      s := ReplaceStr(s, #13, '');
      s := ReplaceStr(s, #10, ',');
      s := ReplaceStr(s, ';', ',');
      s := ReplaceStr(s, ',,', ',');
      s := ReplaceStr(s, ',,', ',');
      if pos(',', s) > 0 then
      begin
        arr := Explode(',', s);
        if Length(arr) > 0 then
        begin
          s := '';
          for i := 0 to Length(arr) - 1 do
          begin
            t := Trim(arr[i]);
            s := t + ',' + s;
          end;
          s := s.Trim([',']);
        end;
        startSQL := ' (R.RQ_ID in (' + s + ')) ';
      end
      else if s <> '' then
        startSQL := ' (R.RQ_ID = ' + s + ') '
      else
        startSQL := ' ( 1 = 1) ';

    end;

    // если скрываем абонентов, то скроем
    if dmMain.SuperMode >= 0 then
    begin
      if (dsFilter['SUPERMODE']) then
        tmpSQL := ' and ( c.INVISIBLE = 1 ) '
      else if dmMain.SuperMode = 0 then
        tmpSQL := ' and ( c.INVISIBLE = 0 ) ';
    end;

    Result := ' ( ' + startSQL + tmpSQL + ' ) ';

  end;

  function RecordToFilter: String;
  var
    s: string;
    period: String;
    before: string;
    after: string;
    fld: string;
    timeperiod: String;
  begin
    Result := '';

    // Фильтр по типу
    if not(dsFilter.FieldByName('REQUEST_TYPE').IsNull) then
      addToFilter(format('(R.RQ_TYPE = %d)', [dsFilter.FieldByName('REQUEST_TYPE').AsInteger]));

    // Фильтр для кого заявки
    if (not(dsFilter.FieldByName('Whose').IsNull) and (dsFilter['Whose'] > 0)) then
    begin
      if dsFilter['Whose'] = 1 then // абонентов
        addToFilter('(not R.RQ_CUSTOMER is null)')
      else if dsFilter['Whose'] = 2 then // узлов
        addToFilter('(not R.Node_ID is null)')
      else // Ни к узлу, ни к абоненту
        addToFilter(' ((r.RQ_CUSTOMER is null) and (r.NODE_ID is null)) ');
    end;

    // Фильтр по группе анализа
    if not(dsFilter.FieldByName('ANALYSE').IsNull) then
      addToFilter
        (format('( exists(select tss.rqtl_id from request_templates tss where tss.rqtl_id = R.RQTL_ID and tss.ANALYSE_ID = %d))',
        [dsFilter.FieldByName('ANALYSE').AsInteger]));

    // Фильтр по организации
    if (Not dsFilter.FieldByName('ORGZ_ID').IsNull) then
      addToFilter(format('(c.ORG_Id = %d)', [dsFilter.FieldByName('ORGZ_ID').AsInteger]));

    // Фильтр по ГС
    if (Not dsFilter.FieldByName('HE_ID').IsNull) then
      addToFilter(format('(he.he_id = %d)', [dsFilter.FieldByName('HE_ID').AsInteger]));

    // Фильтр по исполнителю
    if not(dsFilter.FieldByName('EXECUTOR_ID').IsNull) then
      addToFilter
        (format('( exists(select re.rq_id from request_executors re where re.RQ_ID = R.RQ_ID and re.exec_id = %d ))',
        [dsFilter.FieldByName('EXECUTOR_ID').AsInteger]));

    // Фильтр по выполненной работе
    if not(dsFilter.FieldByName('WORK_ID').IsNull) then
      addToFilter(format('( exists(select RQ_ID from REQUEST_WORKS rw where rw.RQ_ID = R.RQ_ID and rw.W_ID = %d))',
        [dsFilter.FieldByName('WORK_ID').AsInteger]));

    // Фильтр по результату
    if not(dsFilter.FieldByName('RESULT_ID').IsNull) then
      addToFilter(format('( R.RESULT_ID = %d )', [dsFilter.FieldByName('RESULT_ID').AsInteger]));

    // Фильтр по организации
    if (Not dsFilter.FieldByName('EXPIRED').IsNull) then
      addToFilter
        (format('( datediff(hour, r.RQ_COMPLETED, coalesce(r.RQ_EXEC_TIME, cast(''2100-1-1'' as TIMESTAMP))) > %d)',
        [dsFilter.FieldByName('EXPIRED').AsInteger]));
    // Условие отбора по адресу
    if (not dsFilter.FieldByName('HOUSE_ID').IsNull) then
      addToFilter(format(' (r.House_Id = %d) ', [dsFilter.FieldByName('HOUSE_ID').AsInteger]))
    else if (Not dsFilter.FieldByName('Street_Id').IsNull) then
      addToFilter(format(' (h.Street_Id = %d) ', [dsFilter.FieldByName('Street_Id').AsInteger]))
    else if (Not dsFilter.FieldByName('SUBAREA_ID').IsNull) then
      addToFilter(format(' (h.SUBAREA_ID = %d) ', [dsFilter.FieldByName('SUBAREA_ID').AsInteger]))
    else if (Not dsFilter.FieldByName('AREA_ID').IsNull) then
      addToFilter
        (format(' (exists(select cs.Area_Id from street cs where cs.Street_Id = h.Street_Id and cs.Area_Id = %d)) ',
        [dsFilter.FieldByName('AREA_ID').AsInteger]));

    if (not dsFilter.FieldByName('FLAT_NO').IsNull) then
      addToFilter(format(' (r.FLAT_NO = ''%s'')', [dsFilter.FieldByName('FLAT_NO').AsString]));

    // Фильтр по звену
    if (not dsFilter.FieldByName('WORKGROUP').IsNull) then
    begin
      case pgcGrids.ActivePageIndex of
        1, 2:
          addToFilter
            (format(' exists(select W.TEAM from REQUEST_EXECUTORS RE inner join WORKER W on (RE.EXEC_ID = W.WORKER_ID) '
            + 'where RE.RQ_ID = R.RQ_ID and W.TEAM = (select WI.NAME from WORKGROUPS WI where WI.WG_ID = %d))',
            [dsFilter.FieldByName('WORKGROUP').AsInteger]));
      else
        addToFilter(format(' (h.wg_Id = %d)', [dsFilter.FieldByName('WORKGROUP').AsInteger]));
      end
      // AddToFilter('((select wi.name from workgroups wi where wi.wg_id = '+
      // dsFilter.FieldByName('WORKGROUP').AsString+') like ''%''||coalesce(RE.TEAM, WG.NAME)||''%'')');
    end;

    // Фильтр по участку
    if (not dsFilter.FieldByName('WORKAREA').IsNull) then
      addToFilter(format(' ((wg.WA_Id  = %d ) or (wg.WA_Id is null))', [dsFilter.FieldByName('WORKAREA').AsInteger]));

    // Фильтр по виду заявки
    if (not dsFilter.FieldByName('RQTPL_ID').IsNull) then
      addToFilter(format(' (r.RQTL_ID  = %d )', [dsFilter.FieldByName('RQTPL_ID').AsInteger]));

    period := '';
    before := '';
    after := '';
    if (not dsFilter.FieldByName('DATE_FROM').IsNull) and (not dsFilter.FieldByName('DATE_TO').IsNull) then
    begin
      if (dsFilter['DATE_FROM'] = dsFilter['DATE_TO']) then
      begin
        dsFilter.Edit;
        dsFilter['DATE_TO'] := dsFilter['DATE_TO'] + 0.999999; // 23:59:59
        dsFilter.Post;
      end;

      period := format(' between CAST(''%s'' AS TIMESTAMP) and Cast(''%s'' as TIMESTAMP)',
        [FormatDateTime('yyyy-mm-dd hh:nn', dsFilter['DATE_FROM']), FormatDateTime('yyyy-mm-dd hh:nn',
        dsFilter['DATE_TO'])]);
    end
    else
    begin
      if (not dsFilter.FieldByName('DATE_FROM').IsNull) then
        period := format(' >= CAST(''%s'' AS TIMESTAMP)', [FormatDateTime('yyyy-mm-dd hh:nn', dsFilter['DATE_FROM'])]);
      if (not dsFilter.FieldByName('DATE_TO').IsNull) then
        period := format(' <= Cast(''%s'' as TIMESTAMP)', [FormatDateTime('yyyy-mm-dd hh:nn', dsFilter['DATE_TO'])]);
    end;

    // RQ_TIME_FROM
    // RQ_TIME_TO
    // TimeToStr
    timeperiod := '';
    if (not dsFilter.FieldByName('TimeFrom').IsNull) and (not dsFilter.FieldByName('TimeTo').IsNull) then
    begin
      timeperiod :=
        format('(coalesce(r.RQ_TIME_FROM, ''00:00'') < ''%s'') and (coalesce(r.RQ_TIME_TO, ''24:00'') > ''%s'')',
        [TimeToStr(dsFilter['TimeTo']), TimeToStr(dsFilter['TimeFrom'])]);
    end
    else
    begin
      if (not dsFilter.FieldByName('TimeFrom').IsNull) then
      begin
        timeperiod :=
          format('((coalesce(r.RQ_TIME_FROM, ''00:00'') > ''%s'') or (coalesce(r.RQ_TIME_TO, ''24:00'') > ''%s''))',
          [TimeToStr(dsFilter['TimeFrom']), TimeToStr(dsFilter['TimeFrom'])]);
      end;
      if (not dsFilter.FieldByName('TimeTo').IsNull) then
      begin
        timeperiod :=
          format('((coalesce(r.RQ_TIME_FROM, ''00:00'') < ''%s'') or (coalesce(r.RQ_TIME_TO, ''24:00'') < ''%s''))',
          [TimeToStr(dsFilter['TimeTo']), TimeToStr(dsFilter['TimeTo'])]);

      end;
    end;
    if timeperiod <> '' then
      addToFilter(timeperiod);

    if (not dsFilter.FieldByName('DaysBefore').IsNull) then
      before := format(' >= CAST(DATEADD(%d DAY TO CURRENT_DATE) as TIMESTAMP)',
        [(-1 * dsFilter.FieldByName('DaysBefore').AsInteger)]);

    if (not dsFilter.FieldByName('DaysAfter').IsNull) then
      after := format(' < CAST(DATEADD(%d DAY TO CURRENT_DATE) as TIMESTAMP)',
        [dsFilter.FieldByName('DaysAfter').AsInteger + 1]);

    // end;

    // ПОЛУЧЕНЫ    R.RQ_DATE
    // ВЫПОЛНЕНЫ   R.RQ_COMPLETED
    // ПЛАНОВАЯ    R.RQ_PLAN_DATE
    // ВЫДАНЫ      R.RQ_EXEC_TIME

    if (period <> '') or (before <> '') or (after <> '') then
    begin
      // dmMain.GetIniValue('REQALL')
      if pgcGrids.ActivePageIndex <= 2 then
      begin
        case pgcGrids.ActivePageIndex of
          0:
            fld := 'R.RQ_PLAN_DATE';
          1:
            fld := 'R.RQ_COMPLETED';
          2:
            fld := 'R.RQ_EXEC_TIME';
        end;
        if (period <> '') then
          s := DatesFltr(fld, period, '', '')
        else
          s := DatesFltr(fld, period, before, after);

        if s <> '' then
          addToFilter(' ( ' + s + ' ) ');
      end
      else
      begin
        fld := 'R.RQ_PLAN_DATE';
        s := DatesFltr(fld, period, before, after);
        fld := DatesFltr('R.added_on', period, before, after);
        s := format('( %s )', [fld]);
        fld := DatesFltr('R.RQ_COMPLETED', period, before, after);
        if s <> '' then
          s := format('(( %s ) or ( %s ))', [s, fld])
        else
          s := format('( %s )', [fld]);
        fld := DatesFltr('R.RQ_PLAN_DATE', period, before, after);
        if s <> '' then
          s := format('(( %s ) or ( %s ))', [s, fld])
        else
          s := format('( %s )', [fld]);
        fld := DatesFltr('R.RQ_EXEC_TIME', period, before, after);
        if s <> '' then
          s := format('(( %s ) or ( %s ))', [s, fld])
        else
          s := format('( %s )', [fld]);
        if s <> '' then
          addToFilter(format('( %s )', [s]));
      end;
      // повторяющиеся адреса
      if (not dsFilter.FieldByName('REPEATED').IsNull) and (dsFilter['REPEATED']) and (s <> '') then
      begin
        s := format
          (' exists(select rr.Rq_Id from request rr where rr.House_Id = r.House_Id and rr.Flat_No = r.Flat_No and rr.Rq_Id <> r.Rq_Id and %s)',
          [StringReplace(s, 'r.', 'rr.', [rfReplaceAll, rfIgnoreCase])]);
        addToFilter(s);
      end;
    end;

  end;

begin
  if (dmMain.GetIniValue('REQALL') = '1') then
    default := ' 1=1 '
  else
    case pgcGrids.ActivePageIndex of
      1:
        default := ' (R.RQ_COMPLETED  >= CURRENT_DATE and R.RQ_COMPLETED  < DATEADD(1 DAY TO CURRENT_DATE)) ';
      2:
        default := ' (R.RQ_EXEC_TIME  >= CURRENT_DATE and R.RQ_EXEC_TIME  < DATEADD(1 DAY TO CURRENT_DATE)) ';
    else
      default := ' (R.rq_plan_date  >= CURRENT_DATE and R.rq_plan_date  < DATEADD(1 DAY TO CURRENT_DATE)) ';
    end;

  whereStr := ' (1=1) ';
  // если = 1 то Объединение таблиц плана и выданых
  if dmMain.GetIniValue('REQUNION') = '1' then
    case pgcGrids.ActivePageIndex of
      2:
        whereStr := ' ( R.REQ_RESULT >= 2 ) ';
    else
      whereStr := ' (( R.REQ_RESULT <= 1) or ( R.REQ_RESULT is null )) ';
    end
  else
    case pgcGrids.ActivePageIndex of
      0:
        whereStr := ' (( R.REQ_RESULT = 0 ) or ( R.REQ_RESULT is null ))';
      1:
        whereStr := ' ( R.REQ_RESULT = 1 ) ';
      2:
        whereStr := ' ( R.REQ_RESULT >= 2 ) ';
    end;

  if dmMain.UserAreas <> '' then
    whereStr := format('%s and (wg.wa_id in (%s)) ', [whereStr, dmMain.UserAreas]);

  if (dsFilter.RecordCount = 0) or (not actEnableFilter.Checked) then
  begin
    Result := format(' where %s and ( %s ) ', [whereStr, default]);
    exit;
  end;

  filter := TStringList.Create;
  try
    dsFilter.First;
    filter.Clear;
    cr := 0;
    while not dsFilter.Eof do
    begin
      RecordFtr := '';
      if not dsFilter.FieldByName('ListBids').IsNull then
        RecordFtr := ListToFilter
      else
        RecordToFilter;

      if dsFilter['inversion'] then
        RecordFtr := format(' NOT ( %s ) ', [RecordFtr]);

      if cr <> 0 then
      begin
        if dsFilter['next_condition'] = 0 then
          RecordFtr := format(' or ( %s )', [RecordFtr])
        else
          RecordFtr := format(' and ( %s )', [RecordFtr]);
        filter.Add(RecordFtr);
      end
      else
        filter.Text := format('( %s )', [RecordFtr]);
      inc(cr);
      dsFilter.Next;
    end;
    whereStr := format(' where %s and ( %s ) ', [whereStr, filter.Text]);
    Result := whereStr;
  finally
    filter.Free;
  end;
end;

function TRequestsForm.GetActiveGrid(): TDBGridEh;
begin
  case pgcGrids.ActivePageIndex of
    1:
      Result := dbgGive;
    2:
      Result := dbgExec;
    3:
      Result := dbgGrid;
  else
    Result := dbgPlan;
  end;
end;

procedure TRequestsForm.FormActivate(Sender: TObject);
var
  rid: Integer;
  Grid: TDBGridEh;
  cr: TCursor;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  try
    Grid := GetActiveGrid();

    if (Grid.DataSource.DataSet.Active) and (not Grid.DataSource.DataSet.FieldByName('RQ_ID').IsNull) then
      rid := Grid.DataSource.DataSet['RQ_ID']
    else
      rid := -1;
    Grid.DataSource.DataSet.Close;
    Grid.DataSource.DataSet.Open;
    if rid > -1 then
      Grid.DataSource.DataSet.Locate('RQ_ID', rid, []);
  finally
    Screen.Cursor := cr;
  end;
end;

procedure TRequestsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // dbgPlan.DataGrouping.Active := False;
  if FCanSaveColumns then
  begin
    dbgPlan.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'ReqPlan', False);
    dbgGive.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'ReqGive', False);
    dbgGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'ReqGrid', False);
    dbgExec.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'ReqExec', False);
  end;
  RequestsForm := nil;
  Action := caFree;

end;

procedure TRequestsForm.FormCreate(Sender: TObject);
begin
  dmMain.frxAddFunctions(frxReport);
  FCanSaveColumns := true;
  pgcGrids.ActivePage := tsPlan;
end;

procedure TRequestsForm.actNewExecute(Sender: TObject);
var
  aRequest: Int64;
begin
  aRequest := NewRequest(-1, nil, true);
  // aRequest := ReguestExecute (aRequest, aCustomer, aMode);
  if (aRequest <> -1) then
  begin
    (dbgPlan.DataSource.DataSet).Close;
    (dbgPlan.DataSource.DataSet).Open;
    (dbgPlan.DataSource.DataSet).Locate('RQ_ID', aRequest, []);
  end;
end;

procedure TRequestsForm.actOpenAllExecute(Sender: TObject);
var
  i: Integer;
  b: TBookMark;
  aRequest: Integer;
  aCustomer: Integer;
  aMode: Byte;
begin

  if ((dbgGive.DataSource.DataSet).RecordCount = 0) then
    exit;

  if (dbgGive.SelectedRows.Count = 0) then
  begin
    aRequest := (dbgGive.DataSource.DataSet).FieldByName('RQ_ID').AsInteger;
    aMode := 1;

    if (dbgGive.DataSource.DataSet).FieldByName('RQ_CUSTOMER').IsNull then
      aCustomer := -1
    else
      aCustomer := (dbgGive.DataSource.DataSet).FieldByName('RQ_CUSTOMER').AsInteger;

    ReguestExecute(aRequest, aCustomer, aMode);

  end
  else
  begin
    b := dbgGive.DataSource.DataSet.GetBookmark;
    dbgGive.DataSource.DataSet.First;
    dbgGive.DataSource.DataSet.Disablecontrols;
    for i := 0 to dbgGive.SelectedRows.Count - 1 do
    begin
      dbgGive.DataSource.DataSet.Bookmark := dbgGive.SelectedRows[i];
      aRequest := (dbgGive.DataSource.DataSet).FieldByName('RQ_ID').AsInteger;
      aMode := 1;

      if (dbgGive.DataSource.DataSet).FieldByName('RQ_CUSTOMER').IsNull then
        aCustomer := -1
      else
        aCustomer := (dbgGive.DataSource.DataSet).FieldByName('RQ_CUSTOMER').AsInteger;

      ReguestExecute(aRequest, aCustomer, aMode);
    end;
    dbgGive.DataSource.DataSet.GotoBookmark(b);
    dbgGive.DataSource.DataSet.EnableControls;
  end;

end;

procedure TRequestsForm.actOpenHouseExecute(Sender: TObject);
var
  s: String;
  Grid: TDBGridEh;
begin
  Grid := GetActiveGrid();

  if not(Grid.DataSource.DataSet).Active then
    exit;

  if ((Grid.DataSource.DataSet).FieldByName('STREET_ID').IsNull) or
    ((Grid.DataSource.DataSet).FieldByName('HOUSE_ID').IsNull) then
    exit;

  s := (Grid.DataSource.DataSet).FieldByName('STREET_ID').AsString + '~' + (Grid.DataSource.DataSet)
    .FieldByName('HOUSE_ID').AsString;
  A4MainForm.ShowCustomers(14, s);
end;

procedure TRequestsForm.actEditExecute(Sender: TObject);
var
  aRequest: Integer;
  aCustomer: Integer;
  aNodeId: Integer;
  aMode: Byte;
  Grid: TDBGridEh;
begin
  Grid := GetActiveGrid();

  if not(Grid.DataSource.DataSet).Active then
    exit;

  if (Grid.DataSource.DataSet).FieldByName('RQ_ID').IsNull then
  begin
    aRequest := -1;
    aMode := 0;
  end
  else
  begin
    aRequest := (Grid.DataSource.DataSet).FieldByName('RQ_ID').AsInteger;
    aMode := 1;
  end;

  aNodeId := -1;
  if (Grid.DataSource.DataSet).FieldByName('RQ_CUSTOMER').IsNull then
  begin
    aCustomer := -1;
    if not(Grid.DataSource.DataSet).FieldByName('NODE_ID').IsNull then
      aNodeId := (Grid.DataSource.DataSet).FieldByName('NODE_ID').AsInteger;
  end
  else
  begin
    aCustomer := (Grid.DataSource.DataSet).FieldByName('RQ_CUSTOMER').AsInteger;
  end;

  if aNodeId = -1 then
    aRequest := ReguestExecute(aRequest, aCustomer, aMode)
  else
    aRequest := ReguestNodeExecute(aRequest, aNodeId, aMode);

  if (aRequest <> -1) then
  begin
    // mtPlan.RefreshRecord;
    if Grid.DataSource.DataSet.Active then
    begin
      if (Grid.DataSource.DataSet.Active) and (not Grid.DataSource.DataSet.FieldByName('RQ_ID').IsNull) then
        aRequest := Grid.DataSource.DataSet['RQ_ID']
      else
        aRequest := -1;
      Grid.DataSource.DataSet.Close;
      Grid.DataSource.DataSet.Open;
      if aRequest > -1 then
        Grid.DataSource.DataSet.Locate('RQ_ID', aRequest, []);
    end
    else
      Grid.DataSource.DataSet.Active := true;
  end;

end;

procedure TRequestsForm.actChangeDayExecute(Sender: TObject);
var
  Save_Cursor: TCursor;
  all: Boolean;
  date: TDate;
  i: Integer;
  // bm : TBookmark;
  Grid: TDBGridEh;
begin
  Grid := GetActiveGrid();

  date := Now;
  if SelectDate(date, rsToDate) then
  begin
    Save_Cursor := Screen.Cursor;
    if (Grid.SelectedRows.Count > 1) then
    begin
      all := (MessageDlg(rsTookSelectedBid, mtConfirmation, [mbYes, mbNo], 0) = mrYes);
      Screen.Cursor := crHourGlass; { Show hourglass cursor }
      if all then
      begin
        for i := 0 to Grid.SelectedRows.Count - 1 do
        begin
          Grid.DataSource.DataSet.Bookmark := Grid.SelectedRows[i];
          ChangeDayRequest(Grid.DataSource.DataSet['RQ_ID'], date);
        end;
      end
    end
    else
    begin
      ChangeDayRequest(Grid.DataSource.DataSet['RQ_ID'], date);
    end;

    // bm := grid.DataSource.DataSet.GetBookmark;
    Grid.DataSource.DataSet.Close;
    Grid.DataSource.DataSet.Open;
    // grid.DataSource.DataSet.GotoBookmark(bm);
    Screen.Cursor := Save_Cursor; { Always restore to normal }
  end;
end;

procedure TRequestsForm.actCloseGroupExecute(Sender: TObject);
var
  Grid: TDBGridEh;
  AS_RQ_ID: Integer;
  i: Integer;
  s: string;
begin
  Grid := GetActiveGrid();

  s := InputBox(rsRequestCloseAs, rsFromClosedRequest, '');
  if TryStrToInt(s, AS_RQ_ID) then
  begin
    with TpFIBQuery.Create(Nil) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text := 'execute procedure Request_Close_as(:P_REQUEST, :P_AS)';
        if (Grid.SelectedRows.Count = 0) then
        begin
          ParamByName('P_AS').AsInt64 := AS_RQ_ID;
          ParamByName('P_REQUEST').AsInt64 := Grid.DataSource.DataSet['RQ_ID'];
          Transaction.StartTransaction;
          ExecProc;
          Transaction.Commit;
        end
        else
        begin
          for i := 0 to Grid.SelectedRows.Count - 1 do
          begin
            Grid.DataSource.DataSet.Bookmark := Grid.SelectedRows[i];
            ParamByName('P_AS').AsInt64 := AS_RQ_ID;
            ParamByName('P_REQUEST').AsInt64 := Grid.DataSource.DataSet['RQ_ID'];
            Transaction.StartTransaction;
            ExecProc;
            Transaction.Commit;
          end;
        end;
        Grid.DataSource.DataSet.Close;
        Grid.DataSource.DataSet.Open;
      finally
        Free;
      end;
  end;
end;

procedure TRequestsForm.actDeleteExecute(Sender: TObject);
var
  Grid: TDBGridEh;
begin
  Grid := GetActiveGrid();

  if (MessageDlg(format(rsDeleteRequestWT, [Grid.DataSource.DataSet.FieldByName('RQ_ID').AsInteger]), mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
    Grid.DataSource.DataSet.Delete;
end;

procedure TRequestsForm.actDoubleExecute(Sender: TObject);
var
  aRequest: Integer;
  bm: TBookMark;
  Grid: TDBGridEh;
begin
  Grid := GetActiveGrid();

  if (Grid.DataSource.DataSet).FieldByName('RQ_ID').IsNull then
  begin
    aRequest := -1;
  end
  else
  begin
    aRequest := (Grid.DataSource.DataSet).FieldByName('RQ_ID').AsInteger;
  end;

  aRequest := NewRequestFromRequest(aRequest);
  if (aRequest <> -1) then
  begin
    if pgcGrids.ActivePageIndex = 0 then
    begin
      bm := (dbgPlan.DataSource.DataSet).GetBookmark;
      (dbgPlan.DataSource.DataSet).Close;
      (dbgPlan.DataSource.DataSet).Open;
      if not(dbgPlan.DataSource.DataSet).Locate('RQ_ID', aRequest, []) then
        (dbgPlan.DataSource.DataSet).GotoBookmark(bm);
    end;
  end;

end;

procedure TRequestsForm.actShowInfoExecute(Sender: TObject);
begin
  actShowInfo.Checked := Not actShowInfo.Checked;
  pnlClientInfo.Visible := actShowInfo.Checked;
end;

procedure TRequestsForm.actTaskExecute(Sender: TObject);
var
  Grid: TDBGridEh;
begin
  Grid := GetActiveGrid();

  if (Grid.DataSource.DataSet.RecordCount = 0) or (Grid.DataSource.DataSet.FieldByName('RQ_ID').IsNull) then
    exit;

  A4MainForm.MakeTask('R', Grid.DataSource.DataSet.FieldByName('RQ_ID').AsString);
end;

procedure TRequestsForm.chkGroupPlanClick(Sender: TObject);
begin
  SwitchTreeMode(chkGroupPlan, dbgPlan, dsPlan, mtPlan);
end;

procedure TRequestsForm.chkGroupGiveClick(Sender: TObject);
begin
  SwitchTreeMode(chkGroupGive, dbgGive, dsGive, mtGive);
end;

procedure TRequestsForm.chkGrupeExecClick(Sender: TObject);
begin
  SwitchTreeMode(chkGrupeExec, dbgExec, dsExec, mtExec);
end;

procedure TRequestsForm.chkGroupAllClick(Sender: TObject);
begin
  SwitchTreeMode(chkGroupAll, dbgGrid, dsAll, mtAll);
end;

procedure TRequestsForm.actPlanerExecute(Sender: TObject);
begin
  if Not Assigned(ReqPlanerForm) then
    ReqPlanerForm := TReqPlanerForm.Create(Application);
  ReqPlanerForm.Show;
end;

procedure TRequestsForm.actPrintANExecute(Sender: TObject);
var
  gridRow, vi, ri: Integer;
  b: TBookMark;
  ReqList: string;
  FirstReport: Boolean;
  cr: TCursor;

  function GridEOF: Boolean;
  begin
    if (dbgGive.SelectedRows.Count = 0) then
      Result := (dbgGive.DataSource.DataSet).Eof
    else
      Result := (gridRow = dbgGive.SelectedRows.Count);
  end;
  procedure GridFirst;
  begin
    gridRow := 0;
    ReqList := '';
    if (dbgGive.SelectedRows.Count = 0) then
      dbgGive.DataSource.DataSet.First
    else
      dbgGive.DataSource.DataSet.Bookmark := dbgGive.SelectedRows[gridRow];
  end;
  procedure GridNext;
  begin
    if (dbgGive.SelectedRows.Count = 0) then
      dbgGive.DataSource.DataSet.Next
    else
    begin
      inc(gridRow);
      if gridRow < dbgGive.SelectedRows.Count then
        dbgGive.DataSource.DataSet.Bookmark := dbgGive.SelectedRows[gridRow];
    end;
  end;

begin
  if ((dbgGive.DataSource.DataSet).RecordCount = 0) then
    exit;
  cr := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    vi := 0;
    ReqList := '';
    b := dbgGive.DataSource.DataSet.GetBookmark;
    dbgGive.DataSource.DataSet.Disablecontrols;

    // with TReportChild.Create(Application) do begin
    // PrepareReport(true);
    FirstReport := true;
    GridFirst;
    while not GridEOF do
    begin
      if (dbgGive.DataSource.DataSet.FieldByName('REPORT').IsNull) or
        (dbgGive.DataSource.DataSet.FieldByName('REPORT').AsString = '') then
        ReqList := ReqList + ',' + IntToStr(dbgGive.DataSource.DataSet['RQ_ID'])
      else
      begin
        ri := dmMain.GET_ID_REPORT_BY_PATH(dbgGive.DataSource.DataSet['REPORT']);
        if ri >= 0 then
        begin
          AddReport(ri, 'REQUEST', dbgGive.DataSource.DataSet['RQ_ID'], FirstReport);
          FirstReport := False;
        end
        else
          ReqList := ReqList + ',' + IntToStr(dbgGive.DataSource.DataSet['RQ_ID'])
      end;
      GridNext;
    end;

    dbgGive.DataSource.DataSet.GotoBookmark(b);
    dbgGive.DataSource.DataSet.EnableControls;

    // если есть заявки без формы, то выведем их в акт наряд
    if ReqList <> '' then
    begin
      ri := dmMain.GET_ID_REPORT_BY_PATH(rsRepRequest);
      if vi > -1 then
      begin
        ReqList := Copy(ReqList, 2, Length(ReqList) - 1);
        AddReport(ri, 'REQUESTLIST', '''' + ReqList + '''', FirstReport);
      end;
    end;
    frxReport.ShowPreparedReport;
    // Show;
    // end;
  finally
  end;
  Screen.Cursor := cr;
end;

procedure TRequestsForm.actPrintExecute(Sender: TObject);
begin
  ShowReport(rsRepRequestsList)
end;

procedure TRequestsForm.actQuickFilterExecute(Sender: TObject);
begin
  actQuickFilter.Checked := not actQuickFilter.Checked;
  dbgPlan.STFilter.Visible := actQuickFilter.Checked;
  dbgGrid.STFilter.Visible := actQuickFilter.Checked;
  dbgGive.STFilter.Visible := actQuickFilter.Checked;
  dbgExec.STFilter.Visible := actQuickFilter.Checked;

  if (not actQuickFilter.Checked) then
  begin
    dbgGrid.DataSource.DataSet.filter := '';
    dbgPlan.DataSource.DataSet.filter := '';
    dbgExec.DataSource.DataSet.filter := '';
    dbgGive.DataSource.DataSet.filter := '';
  end;

  dbgGrid.DataSource.DataSet.Filtered := (not actQuickFilter.Checked);
  dbgPlan.DataSource.DataSet.Filtered := (not actQuickFilter.Checked);
  dbgExec.DataSource.DataSet.Filtered := (not actQuickFilter.Checked);
  dbgGive.DataSource.DataSet.Filtered := (not actQuickFilter.Checked);
end;

procedure TRequestsForm.actRefreshExecute(Sender: TObject);
var
  Grid: TDBGridEh;
  cr: TCursor;
  id: Integer;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  try
    Grid := GetActiveGrid();

    if (Grid.DataSource.DataSet.Active) and (Grid.DataSource.DataSet.RecordCount > 0) then
    begin
      if not Grid.DataSource.DataSet.FieldByName('RQ_ID').IsNull then
        id := Grid.DataSource.DataSet['RQ_ID']
      else
        id := -1;
      Grid.DataSource.DataSet.Close;
      dbGridSortMarkingChanged(Grid);
      Grid.DataSource.DataSet.Open;
      if id <> -1 then
        Grid.DataSource.DataSet.Locate('RQ_ID', id, []);
    end;
  finally
    Screen.Cursor := cr;
  end;
end;

procedure TRequestsForm.actFilterCustomerExecute(Sender: TObject);
var
  Grid: TDBGridEh;
  i: Integer;
  b: TBookMark;
  customers: TStringList;
  s: string;
begin
  Grid := GetActiveGrid();

  customers := TStringList.Create;
  customers.Sorted := true;
  customers.Duplicates := dupIgnore;

  if (Grid.SelectedRows.Count = 0) then
  begin
    if not Grid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
      customers.Add(IntToStr(Grid.DataSource.DataSet['CUSTOMER_ID']));
  end
  else
  begin
    b := Grid.DataSource.DataSet.GetBookmark;
    Grid.DataSource.DataSet.Disablecontrols;
    // Grid.DataSource.DataSet.First;
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

procedure TRequestsForm.actFilterExecute(Sender: TObject);
var
  Grid: TDBGridEh;
  cr: TCursor;

begin
  cr := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    Grid := GetActiveGrid();

    if not dsFilter.Active then
      SetDefaultFilter;

    RequestFilterForm := TRequestFilterForm.Create(Application);
    if RequestFilterForm.ShowMOdal = mrOk then
    begin
      actEnableFilter.Checked := true;
      (Grid.DataSource.DataSet).Close;
      case pgcGrids.ActivePageIndex of
        0:
          dsPlan.ParamByName('Filter').value := GenerateFilter;
        1:
          dsGive.ParamByName('Filter').value := GenerateFilter;
        2:
          dsExec.ParamByName('Filter').value := GenerateFilter;
        3:
          dsAll.ParamByName('Filter').value := GenerateFilter;
      end;

      try
        (Grid.DataSource.DataSet).Open;
      except
        Application.MessageBox(PWideChar(rsErrorFilter), PWideChar(rsError), MB_OK + MB_ICONWARNING);
      end;
    end;
    RequestFilterForm.Free;
  finally
    Screen.Cursor := cr;
  end;
end;

procedure TRequestsForm.actGIVEExecute(Sender: TObject);
var
  all: Boolean;
  date: TDateTime;
  i: Integer;
  Save_Cursor: TCursor;
  WorkGroup: Integer;
  Workers: string;
begin
  if pgcGrids.ActivePage <> tsPlan then
  begin
    showMessage(rsNeedPlanRequest);
    exit;
  end;

  date := Now;
  Workers := '';
  if GiveRequestParams(WorkGroup, date, Workers) then
  begin
    all := (dbgPlan.SelectedRows.Count > 1);
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    { Show hourglass cursor }
    if all then
    begin
      for i := 0 to dbgPlan.SelectedRows.Count - 1 do
      begin
        dbgPlan.DataSource.DataSet.Bookmark := dbgPlan.SelectedRows[i];
        GiveRequest(dbgPlan.DataSource.DataSet['RQ_ID'], date, WorkGroup, Workers);
      end;
    end
    else
    begin
      if (not VarIsNull(dbgPlan.DataSource.DataSet['RQ_ID'])) then
        GiveRequest(dbgPlan.DataSource.DataSet['RQ_ID'], date, WorkGroup, Workers);
    end;
    // bm := dbgPlan.DataSource.DataSet.GetBookmark;
    dbgPlan.DataSource.DataSet.Close;
    dbgPlan.DataSource.DataSet.Open;
    // dbgPlan.DataSource.DataSet.GotoBookmark(bm);
    Screen.Cursor := Save_Cursor; { Always restore to normal }
  end;
end;

procedure TRequestsForm.actEnableFilterExecute(Sender: TObject);
begin
  actEnableFilter.Checked := not actEnableFilter.Checked;
  // dsRequests.ParamByName('FILTER').Value :=  GenerateFilter;
  pgcGridsChange(Sender);
  // reopen;
end;

procedure TRequestsForm.frxDBrequestsCheckEOF(Sender: TObject; var Eof: Boolean);
var
  Grid: TDBGridEh;
begin
  Grid := GetActiveGrid();
  if Grid.SelectedRows.Count > 0 then
    Eof := (fSelectedRow > Grid.SelectedRows.Count)
end;

procedure TRequestsForm.frxDBrequestsFirst(Sender: TObject);
var
  Grid: TDBGridEh;
begin
  Grid := GetActiveGrid();
  if Grid.SelectedRows.Count > 0 then
  begin
    fSelectedRow := 1;
    Grid.DataSource.DataSet.Bookmark := Grid.SelectedRows[0];
  end
end;

procedure TRequestsForm.frxDBrequestsNext(Sender: TObject);
var
  Grid: TDBGridEh;
begin
  Grid := GetActiveGrid();
  if (Grid.SelectedRows.Count > 0) then
  begin
    if fSelectedRow < Grid.SelectedRows.Count then
      Grid.DataSource.DataSet.Bookmark := Grid.SelectedRows[fSelectedRow];
    inc(fSelectedRow);
  end
end;

procedure TRequestsForm.frxDBrequestsPrior(Sender: TObject);
var
  Grid: TDBGridEh;
begin
  Grid := GetActiveGrid();

  if Grid.SelectedRows.Count > 0 then
  begin
    dec(fSelectedRow);
    Grid.DataSource.DataSet.Bookmark := Grid.SelectedRows[fSelectedRow - 1];
  end
  else
    Grid.DataSource.DataSet.Prior;
end;

function TRequestsForm.frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
begin
  Result := dmMain.frxReportUserFunction(MethodName, Params);
  {
    if MethodName = 'BASE64_DECODE'
    then Result := DecodeBase64(AnsiString(Params[0]));
    if MethodName = 'BASE64_ENCODE'
    then Result := EncodeBase64(AnsiString(Params[0]));
    if MethodName = 'GEN_BARCODE'
    then Result := dmMain.GenerateBarCode(Params[0], Params[1], Params[2], Params[3], Params[4], Params[5], Params[5]);
    if MethodName = 'InSuperMode'
    then Result := dmMain.SuperMode;
  }
end;

procedure TRequestsForm.LoadReportBody(const fReport_ID: Integer);
var
  Stream: TStream;
begin
  try
    dmMain.fdsLoadReport.ParamByName('ID_REPORT').value := fReport_ID;
    dmMain.fdsLoadReport.Open;
    if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').value <> NULL then
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
end;

procedure TRequestsForm.AddReport(const r_id: Integer; const variable: string; const value: Variant;
  const AsNew: Boolean = False);
var
  vi: Integer;
begin
  if r_id <= 0 then
    exit;

  LoadReportBody(r_id);
  vi := frxReport.Variables.IndexOf(variable);
  if vi > 0 then
    frxReport.Variables[variable] := value;

  frxReport.PrepareReport(AsNew);
end;

procedure TRequestsForm.actSelectPrintExecute(Sender: TObject);
var
  i, ri: Integer;
  b: TBookMark;
  FirstReport: Boolean;
  Grid: TDBGridEh;
begin
  Grid := GetActiveGrid();

  if ((Grid.DataSource.DataSet).RecordCount = 0) then
    exit;
  // with TReportChild.Create(Application) do begin
  FirstReport := true;
  if (Grid.SelectedRows.Count = 0) then
  begin
    if Application.MessageBox(PWideChar(rsPrintAllReguest), PWideChar(rsRequests), MB_YESNO + MB_ICONQUESTION) = IDYES
    then
    begin
      b := (Grid.DataSource.DataSet).GetBookmark;
      (Grid.DataSource.DataSet).First;
      (Grid.DataSource.DataSet).Disablecontrols;
      while not(Grid.DataSource.DataSet).Eof do
      begin
        if (not Grid.DataSource.DataSet.FieldByName('REPORT').IsNull) then
        begin
          ri := dmMain.GET_ID_REPORT_BY_PATH(Grid.DataSource.DataSet['REPORT']);
          if ri >= 0 then
          begin
            AddReport(ri, 'REQUEST', Grid.DataSource.DataSet['RQ_ID'], FirstReport);
            FirstReport := False;
          end;
        end;
        Grid.DataSource.DataSet.Next;
      end;
      Grid.DataSource.DataSet.GotoBookmark(b);
      Grid.DataSource.DataSet.EnableControls;
    end
    else
    begin
      if (not Grid.DataSource.DataSet.FieldByName('REPORT').IsNull) then
      begin
        ri := dmMain.GET_ID_REPORT_BY_PATH(Grid.DataSource.DataSet['REPORT']);
        if ri >= 0 then
        begin
          AddReport(ri, 'REQUEST', Grid.DataSource.DataSet['RQ_ID'], FirstReport);
          FirstReport := False;
        end;
      end;
    end;
  end
  else
  begin
    b := Grid.DataSource.DataSet.GetBookmark;
    Grid.DataSource.DataSet.First;
    Grid.DataSource.DataSet.Disablecontrols;
    for i := 0 to Grid.SelectedRows.Count - 1 do
    begin
      Grid.DataSource.DataSet.Bookmark := Grid.SelectedRows[i];
      ri := dmMain.GET_ID_REPORT_BY_PATH(Grid.DataSource.DataSet['REPORT']);
      if ri >= 0 then
      begin
        AddReport(ri, 'REQUEST', Grid.DataSource.DataSet['RQ_ID'], FirstReport);
        FirstReport := False;
      end;
    end;
    Grid.DataSource.DataSet.GotoBookmark(b);
    Grid.DataSource.DataSet.EnableControls;
  end;
  if not FirstReport then
    frxReport.ShowPreparedReport;
  // Show;
  // end;
end;

procedure TRequestsForm.dbgExecColumns15GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if (not FPersonalData) and (not Params.Text.IsEmpty) then
    Params.Text := HideSurname(Params.Text);

end;

procedure TRequestsForm.dbgGiveColumns13GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if (not FPersonalData) and (not Params.Text.IsEmpty) then
    Params.Text := HideSurname(Params.Text);

end;

procedure TRequestsForm.dbgGridColumns14GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if (not FPersonalData) and (not Params.Text.IsEmpty) then
    Params.Text := HideSurname(Params.Text);

end;

procedure TRequestsForm.dbgGridDataGroupGetRowText(Sender: TCustomDBGridEh; GroupDataTreeNode: TGroupDataTreeNodeEh;
  var GroupRowText: string);
var
  s: string;
  i: Integer;
begin
  s := GroupDataTreeNode.DisplayValue;
  i := pos(s, GroupRowText);
  GroupRowText := Copy(GroupRowText, i, Length(GroupRowText));
end;

procedure TRequestsForm.dbgGridDblClick(Sender: TObject);
begin
  if (Sender is TDBGridEh) then
    if ((Sender as TDBGridEh).DataSource.DataSet.Active) and ((Sender as TDBGridEh).DataSource.DataSet.RecordCount > 0)
    then
      actEdit.Execute;
end;

procedure TRequestsForm.dbgGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);

begin
  if ((Sender as TDBGridEh).DataSource.DataSet.Active) and ((Sender as TDBGridEh).DataSource.DataSet.RecordCount > 0)
  then
    if not(Sender as TDBGridEh).DataSource.DataSet.FieldByName('RT_COLOR').IsNull then
      try
        Background := StringToColor((Sender as TDBGridEh).DataSource.DataSet.FieldByName('RT_COLOR').value);
      except
      end;
  {
    try
    if dbgPlan.DataSource.DataSet.FieldByName('RQ_COMPLETED').IsNull
    then begin
    if not (dbgPlan.DataSource.DataSet.FieldByName('DAYS').IsNull
    OR dbgPlan.DataSource.DataSet.FieldByName('RQ_PLAN_DATE').IsNull)
    then begin
    if IncDay(dbgPlan.DataSource.DataSet.FieldByName('RQ_PLAN_DATE').AsDateTime, dbgPlan.DataSource.DataSet.FieldByName('DAYS').AsInteger) < Now()
    then Background := clRed;
    end;
    end;
    finally
    end;
  }
end;

procedure TRequestsForm.dbgPlanColumns13GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if (not FPersonalData) and (not Params.Text.IsEmpty) then
    Params.Text := HideSurname(Params.Text);
end;

procedure TRequestsForm.dbGridGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
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

procedure TRequestsForm.pgcGridsChange(Sender: TObject);
var
  cr: TCursor;
  Grid: TDBGridEh;
  filter: String;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  try
    Grid := GetActiveGrid();

    frxDBrequests.DataSource := Grid.DataSource;
    frxRequests.DataSource := Grid.DataSource;

    dsPlan.Close;
    dsGive.Close;
    dsExec.Close;
    dsAll.Close;

    actEnableFilter.Checked := true;
    Grid.DataSource.DataSet.Close;
    filter := GenerateFilter;
    case pgcGrids.ActivePageIndex of
      0:
        dsPlan.ParamByName('Filter').value := filter;
      1:
        dsGive.ParamByName('Filter').value := filter;
      2:
        dsExec.ParamByName('Filter').value := filter;
      3:
        dsAll.ParamByName('Filter').value := filter;
    end;
    try
      Grid.DataSource.DataSet.Open;
    except
      Application.MessageBox(PWideChar(rsErrorFilter), PWideChar(rsError), MB_OK + MB_ICONWARNING);
    end;

    mtPlan.Active := dbgPlan.DataGrouping.Active and (pgcGrids.ActivePage = tsPlan);
    mtGive.Active := dbgGive.DataGrouping.Active and (pgcGrids.ActivePage = tsGive);
    mtAll.Active := dbgGrid.DataGrouping.Active and (pgcGrids.ActivePage = tsAll);
    mtExec.Active := dbgExec.DataGrouping.Active and (pgcGrids.ActivePage = tsExec);
    try
      frmWorks.dsReqWorks.Active := (pgcGrids.ActivePage = tsExec);
      frmReqMaterials.dsReqMaterials.Active := (pgcGrids.ActivePage = tsExec);
    finally

    end;
    dbGridSortMarkingChanged(Grid);
  finally
    Screen.Cursor := cr;
  end;
end;

procedure TRequestsForm.pmgCopyClick(Sender: TObject);
var
  dbg: TDBGridEh;
begin

  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
        DBGridEh_DoCopyAction(dbg, False)
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TRequestsForm.pmgSaveSelectionClick(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  Ext: String;

begin
  inherited;

  A4MainForm.SaveDialog.FileName := rsTable;
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
        SaveDBGridEhToExportFile(ExpClass, TDBGridEh(ActiveControl), A4MainForm.SaveDialog.FileName, False);
      end;
    end;
end;

procedure TRequestsForm.pmgSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TRequestsForm.ppmCopyClick(Sender: TObject);
var
  dbg: TDBGridEh;
begin

  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
        DBGridEh_DoCopyAction(dbg, False)
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;

end;

procedure TRequestsForm.ppmSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;

end;

procedure TRequestsForm.PropStorageAfterLoadProps(Sender: TObject);
begin
  splMat.Align := alRight;
end;

procedure TRequestsForm.ppmSaveSelectionClick(Sender: TObject);

var
  ExpClass: TDBGridEhExportClass;
  Ext: String;

begin

  A4MainForm.SaveDialog.FileName := rsRequests;
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
        SaveDBGridEhToExportFile(ExpClass, TDBGridEh(ActiveControl), A4MainForm.SaveDialog.FileName, False);
      end;
    end;

end;

procedure TRequestsForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and (CG or CE or CC or FullAccess);
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and (FullAccess or CD);
end;

procedure TRequestsForm.FormShow(Sender: TObject);
var
  cr: TCursor;
  p: Integer;
  i, Font_size: Integer;
  Font_name: string;
  j: Integer;
begin
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TDBGridEh then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
    end;
  end;

  dbgPlan.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'ReqPlan', [crpColIndexEh, crpColWidthsEh, crpColVisibleEh,
    crpSortMarkerEh]);
  dbgGive.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'ReqGive', [crpColIndexEh, crpColWidthsEh, crpColVisibleEh,
    crpSortMarkerEh]);
  dbgGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'ReqGrid', [crpColIndexEh, crpColWidthsEh, crpColVisibleEh,
    crpSortMarkerEh]);
  dbgExec.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'ReqExec', [crpColIndexEh, crpColWidthsEh, crpColVisibleEh,
    crpSortMarkerEh]);

  // права пользователей

  frxReport.PreviewOptions.AllowEdit := (dmMain.AllowedAction(rght_Reports_Designer));
  if (not dmMain.AllowedAction(rght_Reports_Save)) then
  begin
    frxReport.PreviewOptions.Buttons := frxReport.PreviewOptions.Buttons - [pbSave];
    frxReport.PreviewOptions.Buttons := frxReport.PreviewOptions.Buttons - [pbLoad];
  end;

  FullAccess := dmMain.AllowedAction(rght_Request_full);
  FPersonalData := (not dmMain.AllowedAction(rght_Customer_PersonalData));
  // (50, 'ПОЛНЫЙ ДОСТУП', 'ЗАЯВКИ', 'Полный доступ');
  CE := dmMain.AllowedAction(rght_Request_edit);
  // (52, 'РЕДАКТИРОВАНИЕ', 'ЗАЯВКИ', 'Редактирование заявки');
  CC := dmMain.AllowedAction(rght_Request_Close);
  // (54, 'ЗАКРЫТИЕ', 'ЗАЯВКИ', 'Закрытие заявки');
  CG := dmMain.AllowedAction(rght_Request_Give);
  // (53, 'ВЫДАЧА', 'ЗАЯВКИ', 'Выдача заявок в работу');
  CA := dmMain.AllowedAction(rght_Request_add);
  // (51, 'ДОБАВЛЕНИЕ', 'ЗАЯВКИ', 'Добавление заявок');
  CD := dmMain.AllowedAction(rght_Request_del);
  // (55, 'Удаление', 'ЗАЯВКИ', 'Удаление заявок');
  fAsBalance := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1');
  fVisibleCost := dmMain.AllowedAction(rght_Material_Cost); // просмотр цены
  FVisibleSum := dmMain.AllowedAction(rght_Customer_Debt); // просмотр сумм
  FVisibleSum := FVisibleSum or dmMain.AllowedAction(rght_Programm_ViewMoney);
  FVisibleSum := FVisibleSum or dmMain.AllowedAction(rght_Customer_full);

  actNew.Enabled := (CA or FullAccess);
  actEdit.Enabled := (CG or CE or CC or FullAccess);
  actDelete.Enabled := (FullAccess);
  actGIVE.Enabled := (CG or FullAccess);
  actCloseGroup.Enabled := (CC or FullAccess);
  actChangeDay.Enabled := (CG or FullAccess);
  actPlaner.Enabled := (CA or CG or CE or CC or FullAccess);

  // mtPlan.Active := True;
  // dbGridSortMarkingChanged(dbgPlan);

  cr := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    SetDefaultFilter;
    dsPlan.Close;
    if (not(TryStrToInt(dmMain.GetIniValue('SHOWFILTER'), p))) then
      p := 0;
    if (p <> 0) and (not FileExists(A4MainForm.GetUserFilterFolder + 'RDefault.ftr')) then
      actFilter.Execute;
    dsPlan.ParamByName('FILTER').value := GenerateFilter;
    dbGridSortMarkingChanged(dbgPlan);
    dsPlan.Open;

  finally
    Screen.Cursor := cr;
  end;

  if dmMain.GetIniValue('REQUNION') = '1' then
  begin
    tsGive.TabVisible := False;
  end;

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      for j := 0 to (Components[i] as TDBGridEh).Columns.Count - 1 do
      begin
        Font_name := (Components[i] as TDBGridEh).Columns[j].FieldName;
        if Font_name = 'DEBT_SUM' then
          (Components[i] as TDBGridEh).Columns[j].Visible := (FVisibleSum and (not fAsBalance))
        else if Font_name = 'BALANCE' then
          (Components[i] as TDBGridEh).Columns[j].Visible := (FVisibleSum and fAsBalance);
      end;
    end;
  end;

  for i := 0 to frmReqMaterials.dbGrid.Columns.Count - 1 do
  begin
    if frmReqMaterials.dbGrid.Columns[i].FieldName = 'COST' then
      frmReqMaterials.dbGrid.Columns[i].Visible := fVisibleCost;
  end;

end;

procedure TRequestsForm.dbGridSortMarkingChanged(Sender: TObject);
var
  cr: TCursor;
  s: string;
  i, j: Integer;
  Grid: TCustomDBGridEh;
  id: Integer;
  FibDS: TpFIBDataSet;
  beOpened: Boolean;
begin
  if not(Sender is TDBGridEh) then
    exit;
  if not((Sender as TDBGridEh).DataSource.DataSet is TpFIBDataSet) then
    exit;

  cr := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  Grid := TCustomDBGridEh(Sender);
  FibDS := TpFIBDataSet(Grid.DataSource.DataSet);
  id := -1;
  if Sender is TCustomDBGridEh then
  begin
    beOpened := FibDS.Active;
    if beOpened then
    begin
      if (not(FibDS.FieldByName('RQ_ID').IsNull)) then
        id := FibDS['RQ_ID'];
      FibDS.Close;
    end;

    j := Grid.SortMarkedColumns.Count - 1;
    s := ' ';
    for i := 0 to j do
    begin
      if (AnsiUpperCase(Grid.SortMarkedColumns[i].FieldName) = 'ACCOUNT_NO') then
        s := s + 'C.account_no'
      else if (AnsiUpperCase(Grid.SortMarkedColumns[i].FieldName) = 'STREET_NAME') then
        s := s + 'S.Street_Name||s.street_short'
      else if (AnsiUpperCase(Grid.SortMarkedColumns[i].FieldName) = 'FLAT_NO') then
        s := s + 'C.FLAT_NO'
      else if (AnsiUpperCase(Grid.SortMarkedColumns[i].FieldName) = 'HOUSE_NO') then
        s := s + 'H.HOUSE_NO'
      else if (AnsiUpperCase(Grid.SortMarkedColumns[i].FieldName) = 'NOTICE') then
        s := s + 'R.NOTICE'
      else
        s := s + Grid.SortMarkedColumns[i].FieldName;
      // s := s + ' COLLATE UNICODE_CI_AI ';
      if Grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
        s := s + ' desc';
      if i <> j then
        s := s + ', ';
    end;

    FibDS.OrderClause := s;
    if beOpened then
    begin
      FibDS.Open;
      if id <> -1 then
        FibDS.Locate('RQ_ID', id, []);
    end;

  end;
  Screen.Cursor := cr;
end;

procedure TRequestsForm.dsFilterNewRecord(DataSet: TDataSet);
begin
  // dsFilter['PLAN_FROM'] := Today;
  // dsFilter['PLAN_TO'] := Today;

  dsFilter['INVERSION'] := False;
  dsFilter['repeated'] := False;

  dsFilter['NEXT_CONDITION'] := 1;
end;

procedure TRequestsForm.GiveRequest(const req_id: Integer; const date: TDateTime; const WorkGroup: Integer = -1;
  const Workers: String = '');
begin
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'execute procedure REQUESTGIVE(:P_REQUEST, :P_DATE, :WORKGROUP, :WORKERS)';
      ParamByName('P_REQUEST').AsInt64 := req_id;
      ParamByName('P_DATE').AsDateTime := date;
      ParamByName('WORKERS').AsString := Workers;
      if WorkGroup <> -1 then
        ParamByName('WORKGROUP').AsInt64 := WorkGroup
      else
        ParamByName('WORKGROUP').Clear;
      Transaction.StartTransaction;
      ExecProc;
      Transaction.Commit;
    finally
      Free;
    end;
end;

procedure TRequestsForm.ChangeDayRequest(const req_id: Integer; const date: TDateTime);
begin
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'execute procedure REQUESTMOVE(:P_REQUEST, :P_DATE)';
      ParamByName('P_REQUEST').AsInt64 := req_id;
      ParamByName('P_DATE').AsDate := date;
      Transaction.StartTransaction;
      ExecProc;
      Transaction.Commit;
    finally
      Free;
    end;
end;

procedure TRequestsForm.SwitchTreeMode(chkBox: TCheckBox; TreeGrid: TDBGridEh; FibDS: TpFIBDataSet; MemDS: TMemTableEh);
var
  Crsr: TCursor;
begin
  Crsr := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  try
    if chkBox.Checked then
    begin
      MemDS.Disablecontrols;
      TreeGrid.DataSource.DataSet := MemDS;
      TreeGrid.SortLocal := true;
      TreeGrid.DataGrouping.GroupPanelVisible := true;
      TreeGrid.DataGrouping.GroupLevels.Clear;
      FibDS.Close;
      MemDS.Open;
      TreeGrid.DataGrouping.Active := true;
      MemDS.First;
      MemDS.EnableControls;
      FCanSaveColumns := False;
    end
    else
    begin
      FibDS.Disablecontrols;
      TreeGrid.DataGrouping.Active := False;
      TreeGrid.SortLocal := False;
      TreeGrid.DataSource.DataSet := FibDS;
      MemDS.Close;
      TreeGrid.DataGrouping.GroupPanelVisible := False;
      FibDS.Open;
      FibDS.First;
      TreeGrid.DataGrouping.GroupLevels.Clear;
      FibDS.EnableControls;
    end;
  finally
    Screen.Cursor := Crsr;
  end;
end;

end.
