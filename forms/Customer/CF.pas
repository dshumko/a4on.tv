unit CF;
{$I defines.inc}

interface

uses
  WinAPI.Windows, WinAPI.Messages, System.SysUtils, System.Variants, System.Classes,
  System.Actions, System.UITypes,
  Vcl.Graphics, Vcl.Menus, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList,
  Vcl.Buttons, Vcl.Mask, Data.DB, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  DBGridEh, ToolCtrlsEh, GridsEh, DBCtrlsEh, DBLookupEh,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  AtrPages, FIBQuery, pFIBQuery, DBGridEhToolCtrls,
  PropFilerEh, frxClass, frxDBSet, PropStorageEh, VKDBFDataSet,
  DBAxisGridsEh, MemTableDataEh, MemTableEh, PrjConst,
  EhLibVCL, dnSplitter, DBGridEhGrouping, DynVarsEh;

type
  TCustomersForm = class(TForm)
    pnlForms: TPanel;
    pnlDATA: TPanel;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsCustomers: TpFIBDataSet;
    srcCustomer: TDataSource;
    pnlGrdForms: TPanel;
    ActListCustomers: TActionList;
    actCustomerAdd: TAction;
    actCustomerEdit: TAction;
    actCustomerDelete: TAction;
    ActSetFilter: TAction;
    ActBalance: TAction;
    actReCalc: TAction;
    ActPrintGrid: TAction;
    ActLetters: TAction;
    ActCancelContract: TAction;
    actEnableFilter: TAction;
    actRequest: TAction;
    actItogo: TAction;
    actQuickFilter: TAction;
    ActAddPayment: TAction;
    actAddressSearch: TAction;
    ActionRefresh: TAction;
    actSelectColumns: TAction;
    actSelectAll: TAction;
    actCopy: TAction;
    actSaveAs: TAction;
    actFltrManyAccounts: TAction;
    actSendMessages: TAction;
    actSetFilterNew: TAction;
    actPrepay: TAction;
    mmMenu: TMainMenu;
    N18: TMenuItem;
    N19: TMenuItem;
    N21: TMenuItem;
    N20: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    miAbonent: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N38: TMenuItem;
    N26: TMenuItem;
    mimap: TMenuItem;
    N27: TMenuItem;
    actSendMessages1: TMenuItem;
    N50: TMenuItem;
    N52: TMenuItem;
    miPrint: TMenuItem;
    ActLetters1: TMenuItem;
    N37: TMenuItem;
    dbgCustomers: TDBGridEh;
    actlstSearch: TActionList;
    actFilterSearchText: TAction;
    actSearchNext: TAction;
    actSearchPrev: TAction;
    gridPopUp: TPopupMenu;
    N11: TMenuItem;
    N13: TMenuItem;
    N12: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N6: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N8: TMenuItem;
    ppmCopy: TMenuItem;
    ppmSelectAll: TMenuItem;
    ppmSaveSelection: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    pmFilters: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    pmFilter: TPopupMenu;
    N53: TMenuItem;
    PropStorage: TPropStorageEh;
    pmGridTitle: TPopupMenu;
    N45: TMenuItem;
    N46: TMenuItem;
    N44: TMenuItem;
    N47: TMenuItem;
    actGTSelectColumns1: TMenuItem;
    pmExport: TPopupMenu;
    qBalance: TpFIBQuery;
    UpdateTimer: TTimer;
    frxFIBCustomers: TfrxDBDataset;
    frxReport: TfrxReport;
    actRecAdd: TAction;
    splMain: TdnSplitter;
    spl1: TdnSplitter;
    N2: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N39: TMenuItem;
    miExport: TMenuItem;
    N22: TMenuItem;
    frxCustomer: TfrxDBDataset;
    frxmdsBalance: TfrxDBDataset;
    N25: TMenuItem;
    N31: TMenuItem;
    N36: TMenuItem;
    N42: TMenuItem;
    pmSelectPrintDoc: TPopupMenu;
    N43: TMenuItem;
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
    btnItogo: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton16: TToolButton;
    ToolButton13: TToolButton;
    ToolButton12: TToolButton;
    ToolButton17: TToolButton;
    btn3: TToolButton;
    btnAddRec1: TToolButton;
    dsFilter: TMemTableEh;
    mdsBalance: TMemTableEh;
    mniN28: TMenuItem;
    actFilterFLD: TAction;
    mniFilterFLD: TMenuItem;
    chkFldOnly: TCheckBox;
    dsStreets: TpFIBDataSet;
    srcStreet: TDataSource;
    dsHomes: TpFIBDataSet;
    srcHouse: TDataSource;
    dsFLAT: TpFIBDataSet;
    srcFLAT: TDataSource;
    ToolBar2: TToolBar;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton8: TToolButton;
    ToolButton5: TToolButton;
    pnlSearchAdres: TPanel;
    Label1: TLabel;
    lcbStreets: TDBLookupComboboxEh;
    lcbHOUSE: TDBLookupComboboxEh;
    lcbFLAT: TDBLookupComboboxEh;
    actAddBlackList: TAction;
    N28: TMenuItem;
    N40: TMenuItem;
    btnNPS: TToolButton;
    actNPS: TAction;
    btn1: TToolButton;
    miNPS: TMenuItem;
    miRecAdd: TMenuItem;
    actResetpassword: TAction;
    N41: TMenuItem;
    btnTask: TToolButton;
    actTask: TAction;
    cbbAREA: TDBLookupComboboxEh;
    dsArea: TpFIBDataSet;
    srcArea: TDataSource;
    dbgForms: TDBGridEh;
    mtbPages: TMemTableEh;
    srcPages: TDataSource;
    N51: TMenuItem;
    actCustNode: TAction;
    N56: TMenuItem;
    actCheckPassport: TAction;
    N57: TMenuItem;
    pmRecourse: TPopupMenu;
    actRecAddWAdres: TAction;
    miRecAddWAdres: TMenuItem;
    miRecAdd1: TMenuItem;
    mmiPrepay: TMenuItem;
    mmiTask: TMenuItem;
    actOrderTP: TAction;
    miOrderTP: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgrdh1DblClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchEnter(Sender: TObject);
    procedure edtSearchExit(Sender: TObject);
    procedure edtSearchKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actFilterSearchTextExecute(Sender: TObject);
    procedure actSearchNextExecute(Sender: TObject);
    procedure actSearchPrevExecute(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure dbgCustomersGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure dbgCustomersSortMarkingChanged(Sender: TObject);
    procedure ActSetFilterExecute(Sender: TObject);
    procedure actQuickFilterExecute(Sender: TObject);
    procedure actItogoExecute(Sender: TObject);
    procedure actSetFilterNewExecute(Sender: TObject);
    procedure actPrepayExecute(Sender: TObject);
    procedure actSendMessagesExecute(Sender: TObject);
    procedure actFltrManyAccountsExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure actAddressSearchExecute(Sender: TObject);
    procedure ActAddPaymentExecute(Sender: TObject);
    procedure actRequestExecute(Sender: TObject);
    procedure actEnableFilterExecute(Sender: TObject);
    procedure ActCancelContractExecute(Sender: TObject);
    procedure ActLettersExecute(Sender: TObject);
    procedure ActPrintGridExecute(Sender: TObject);
    procedure ActBalanceExecute(Sender: TObject);
    procedure UpdateTimerTimer(Sender: TObject);
    procedure actRecAddExecute(Sender: TObject);
    procedure actSelectColumnsExecute(Sender: TObject);
    procedure actSelectAllExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
    procedure actSaveAsExecute(Sender: TObject);
    procedure dbgCustomersDblClick(Sender: TObject);
    procedure frxFIBCustomersCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxFIBCustomersFirst(Sender: TObject);
    procedure frxFIBCustomersNext(Sender: TObject);
    procedure frxFIBCustomersPrior(Sender: TObject);
    procedure actCustomerEditExecute(Sender: TObject);
    procedure dsFilterNewRecord(DataSet: TDataSet);
    procedure actCustomerAddExecute(Sender: TObject);
    procedure actCustomerDeleteExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actFilterFLDExecute(Sender: TObject);
    procedure chkFldOnlyClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lcbFLATChange(Sender: TObject);
    procedure lcbHOUSEChange(Sender: TObject);
    procedure lcbStreetsChange(Sender: TObject);
    procedure actAddBlackListExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    function frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure actNPSExecute(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure dsCustomersAfterOpen(DataSet: TDataSet);
    procedure actResetpasswordExecute(Sender: TObject);
    procedure actTaskExecute(Sender: TObject);
    procedure cbbAREAChange(Sender: TObject);
    procedure srcPagesDataChange(Sender: TObject; Field: TField);
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCustNodeExecute(Sender: TObject);
    procedure dbgCustomersGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
    procedure actCheckPassportExecute(Sender: TObject);
    procedure actRecAddWAdresExecute(Sender: TObject);
    procedure actOrderTPExecute(Sender: TObject);
    procedure dbgCustomersColumnsGetCellParams(Sender: TObject;
      EditMode: Boolean; Params: TColCellParamsEh);
  private
    FLastPage: TA4onPage;
    FPageList: TA4onPages;
    fFinded: Boolean;
    FNeedRefresh: Boolean;
    SaldoSign: Integer;
    fVisibleColumns: Cardinal;
    vRED_SUMM: single;
    fSelectedRow: Integer;
    FullAccess: Boolean;
    FVisiblePassport: Boolean;
    ChangeHistory: Boolean;
    FgCustActiveDebt: TColor;
    FgCustDisconted: TColor;
    FgCustDiscontedWithMoney: TColor;
    FFilterField: Integer;
    FFilterValue: string;
    FCheckPassport: Boolean;
    function GenerateFilter: String;
    function ReplaceFields(const str: string): string;
    procedure ShowPage(Page: TA4onPage);
    procedure InitPages;
    procedure StartCommand(Sender: TObject);
    procedure RefreshCurrentRecord(Sender: TObject);
    function IndexToPage(Index: Integer): TA4onPage;
    procedure SetPageIndex(Index: Integer);
    procedure CreatGridColumns(Mask: Integer);
    procedure SetVisibleColumns(Mask: Integer);
    function GetOrderClause(grid: TCustomDBGridEh): string;
    procedure InitForm;
    procedure InitSecurity;
    procedure CreatePages;
    procedure InitExportPopUpMenus;
    procedure InitPrintPopUpMenus;
    procedure dsCustomers_Refresh(const full: Boolean = False);
    procedure UpdateInfoPanel;
    procedure miExportClick(Sender: TObject);
    procedure miExportSettingsClick(Sender: TObject);
    procedure ExportToDBF(const FILE_DIR, FILENAME, FILE_BODY: string; FILE_CODEPAGE: Integer);
    procedure ExportToTXT(const FILE_DIR, FILENAME, FILE_HEAD, FILE_BODY, FILE_FOOTER: string; FILE_CODEPAGE: Integer;
      const DEC_SEP: Char);
    procedure miPrintReportClick(Sender: TObject);
    procedure SwitchIfoTab(const next: Boolean);
    procedure StartSearchAddress;
    procedure StopSearchAdres;
    procedure SetAdresFilter();
    procedure AddReport(const r_id: Integer; const variable: string; const value: Variant;
      const AsNew: Boolean = False);
    procedure LoadReportBody(const fReport_ID: Integer);
    procedure RefreshCustomerRecords;
    procedure OpenDataSet(const FindCustomerID: Integer = -1);
    procedure ValidatePassport;
  public
    constructor CreateA(const FilterFIELD: Integer = -1; const FilterVALUE: string = '');
    procedure SetDefaultFilter;
    function FieldsToStr(const str: string; const DEC_SEP: Char): string;
    property Finded: Boolean read fFinded;
    procedure AddPhoneForCustomer(const phone: string);
    procedure SetFilter(const FilterFIELD: Integer; const FilterVALUE: string; var FindResult: Boolean);
    procedure RefreshRequestsList(aRequest: Integer = -1; aCustomer: Integer = -1);
    procedure NewTaskCallBack(const TaskID: Integer);
  end;

var
  CustomersForm: TCustomersForm;

function ShowCustomers(const FilterFIELD: Integer = -1; const FilterVALUE: string = ''): Integer;

implementation

{$R *.dfm}

uses
  AtrCommon, DM, MAIN, CustomerForma, DBGridEhFindDlgs, DateUtils, SelectColumnsForma, ExportSettingsForma,
  TextEditForma, SendMessagesForma, fs_iinterpreter, RecourseForma, RequestNewForma, DBGridEhImpExp, AtrStrUtils,
  RxStrUtils, StrUtils, EhLibFIB, pFIBProps, fmuCustomerInfo, fmuCustomerSrv, fmuCustomerPayments, fmuCustomerSingleSrv,
  fmuCustomerKoef, fmuCustomerLetters, fmuCustomerRecourse, fmuCustomerRequests, fmuCustomerMaterialsMove,
  fmuCustomerAttributes, fmuCustomerLan, fmuCustomerInternet, fmuCustomerCard, fmuCustomerDigit, fmuCustomerAppl,
  PaymentForma, CancelContractForma, SelectLetterTypeForma, CustomersFilter, ReportPreview, fmuCustomerNew,
  fmuCustomerBonus, fmuCustomerFiles, NPSAddForma, OrderTPForma, A4onTypeUnit,
  OverbyteIcsWndControl, OverbyteIcsHttpProt, OverbyteIcsWSocket, OverbyteIcsUrl;

const
  cst_OneRecord: string = ' first 1 ';
  const_default_filter: string = ' ((C.Valid_To > CURRENT_DATE) or (C.Valid_To is null)) ';
  clc_FullIO = 1; // Полное И.О.
  clc_DatDog = 1024; // Дата договора
  clc_Pasport = 128; // Паспорт
  clc_Lan = 131072; // IP - MAC
  clc_KOD = 16; // Код
  clc_Status = 16384; // Статус
  clc_IO = 2; // Сокращенное И.О.
  clc_DogovorDo = 2048; // Договор до даты
  clc_Atrib = 256; // Атрибуты
  clc_Notice = 32; // Примечание
  clc_Koef = 32768; // Коэффициенты
  clc_Phone = 4; // Телефон
  clc_DataAct = 4096; // Дата первого подключения
  clc_DogovorN = 512; // Договор №
  clc_PE = 64; // Подъезд этаж город
  clc_Decoder = 65536; // Декодеры
  clc_MobPhone = 8; // Моб. телефон
  clc_Jur = 8192; // Юр. лицо
  clc_Email = 262144; // Email
  clc_Prepay = 524288; // Обещанный платеж
  clc_TAP = 1048576; // Отвод
  clc_ATRLINE = 2097152; // Атрибуты в строку
  clc_ExtID = 4194304; // Внешний ИД
  clc_Nps = 8388608; // НПС оценка и комментарий
  clc_MonPay = 16777216; // Ежемесячный тариф
  clc_HeadEnd = 33554432; // Гол. станция
  clc_Org = 67108864; // Обсл. орган.

function ShowCustomers(const FilterFIELD: Integer = -1; const FilterVALUE: string = ''): Integer;
begin
  Result := -1;

  if not dmMain.CanViewCustomers then
    Exit;

  if Not Assigned(CustomersForm) then
    CustomersForm := TCustomersForm.CreateA(FilterFIELD, FilterVALUE)
  else
  begin
    // if (FilterFIELD <> -1) and (FilterVALUE <> '') then
    if (FilterFIELD <> -1) then
    begin
      with CustomersForm do
      begin
        FFilterField := FilterFIELD;
        FFilterValue := FilterVALUE;
        SetDefaultFilter;
        dsCustomers.Close;
        dsCustomers.ParamByName('Filter').value := GenerateFilter;
        dsCustomers.filter := '';
        dsCustomers.Filtered := False;
        OpenDataSet;
        fFinded := (CustomersForm.dsCustomers.RecordCount > 0);
      end;
    end
  end;

  if CustomersForm.dsCustomers.RecordCount > 0 then
    Result := 1
  else
    Result := 0;

  CustomersForm.Show;
end;

constructor TCustomersForm.CreateA(const FilterFIELD: Integer = -1; const FilterVALUE: string = '');
var
  i: Integer;
begin
  inherited Create(Application);
  InitForm;

  with fsGlobalUnit do
  begin
    AddedBy := Self;
    AddForm(Self);
    AddedBy := nil;
  end;

  if (FilterFIELD <> -1) and (FilterVALUE <> '') then
  begin
    FFilterField := FilterFIELD;
    FFilterValue := FilterVALUE;
    SetDefaultFilter;
    dsCustomers.Close;
    dsCustomers.ParamByName('Filter').value := GenerateFilter;
    dsCustomers.filter := '';
    dsCustomers.Filtered := False;
    OpenDataSet;
  end
  else
  begin
    // откроем окно фильтра или установим фильтр по умолчанию
    if not(TryStrToInt(dmMain.GetIniValue('SHOWFILTER'), i)) then
      i := 0;

    if (i <> 0) then
      ActSetFilter.Execute
    else
      OpenDataSet;
  end;

  fFinded := (dsCustomers.RecordCount > 0);
end;

procedure TCustomersForm.InitPages;
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
      Item.Page := Item.PageClass.CreatePageGrid(Self, dbgCustomers);
      Page := Item.Page;
      Page.InitForm;
      Page.OnUpdate := RefreshCurrentRecord;
      Page.OnStart := StartCommand;
      Page.BorderStyle := bsNone;
      Page.Parent := pnlDATA;
      Page.Width := pnlDATA.ClientHeight;
      Page.Height := pnlDATA.ClientHeight;
    end;
  end;

  if mtbPages.Active then
    mtbPages.Close;

  mtbPages.Open;
  mtbPages.EmptyTable;
  mtbPages.DisableControls;
  try
    for i := 0 to FPageList.Count - 1 do
    begin
      PageName := FPageList[i].PageClass.GetPageName;
      mtbPages.Append;
      mtbPages['id'] := i;
      mtbPages['name'] := PageName;
      mtbPages.Post;
    end;
    mtbPages.First;
  finally
    mtbPages.EnableControls;
  end;

  if FPageList.Count > 0 then
  begin
    if not(TryStrToInt(dmMain.GetIniValue('LASTPAGE'), i)) then
      i := 0;
    SetPageIndex(i);
  end;

end;

procedure TCustomersForm.dbgCustomersColumnsGetCellParams(
  Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if not Params.Text.IsEmpty then
    Params.Text := StringReplace(Params.Text, #13#10, ' ', [rfReplaceAll]);
end;

procedure TCustomersForm.dbgCustomersDblClick(Sender: TObject);
begin
  if not dsCustomers.Active then
    Exit;

  if not dsCustomers.FieldByName('Customer_ID').IsNull then
    ShowCustomer(dsCustomers.FieldValues['Customer_ID'], False);
end;

procedure TCustomersForm.dbgCustomersGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
var
  s: string;
begin
  if not(Sender as TDBGridEh).DataSource.DataSet.Active then
    Exit;

  // DBTextDebt.Color:=AFont.Color;
  if (gdSelected in State) then
  begin
    AFont.Color := clHighlightText;
    Background := clHighlight;
  end
  else
  begin
    if not(Sender as TDBGridEh).DataSource.DataSet.FieldByName('HIS_COLOR').IsNull then
    begin
      s := (Sender as TDBGridEh).DataSource.DataSet.FieldByName('HIS_COLOR').AsString;
      if not s.IsEmpty then
        Background := StringToColor(s);
    end;

    if ((Sender as TDBGridEh).DataSource.DataSet.FieldDefs.IndexOf('CONNECTED') > -1) and
      ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('CONNECTED').value > 0) // Подключен
    then
    begin
      if ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('DEBT_SUM').value > vRED_SUMM) then
        AFont.Color := FgCustActiveDebt
      else
        AFont.Color := clWindowText;
    end
    else
    begin
      if ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('DEBT_SUM').value > 0) then
        AFont.Color := FgCustDisconted
      else
        AFont.Color := FgCustDiscontedWithMoney;
    end;
  end;
end;

procedure TCustomersForm.dbgCustomersGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh;
  AFont: TFont; var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
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

procedure TCustomersForm.dbgCustomersSortMarkingChanged(Sender: TObject);
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
  FIBDS := grid.DataSource.DataSet as TpFIBDataSet;
  id := -1;
  if Sender is TCustomDBGridEh then
  begin
    beOpened := FIBDS.Active;
    if beOpened then
    begin
      if not FIBDS.FieldByName('CUSTOMER_ID').IsNull then
        id := FIBDS.FieldByName('CUSTOMER_ID').AsInteger;
      FIBDS.Close;
    end;

    s := GetOrderClause(grid);

    FIBDS.OrderClause := s;
    if beOpened then
    begin
      FIBDS.Open;
      if id <> -1 then
        FIBDS.Locate('CUSTOMER_ID', id, []);
    end;
  end;
  Screen.Cursor := cr;
end;

procedure TCustomersForm.dbgrdh1DblClick(Sender: TObject);
begin
  ShowCustomer(dsCustomers['Customer_ID'], False);
end;

procedure TCustomersForm.StartCommand(Sender: TObject);
begin
  //
end;

procedure TCustomersForm.RefreshCurrentRecord(Sender: TObject);
begin
  // FLastPage.SavePosition;
  dsCustomers.Refresh;
  FLastPage.GotoSavedPosition;
end;

procedure TCustomersForm.UpdateTimerTimer(Sender: TObject);
begin
  if (Screen.ActiveForm is TCustomersForm) then
    if not(dsCustomers.State in [dsEdit, dsInsert]) then
      ActionRefresh.Execute;
end;

procedure TCustomersForm.ShowPage(Page: TA4onPage);
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

procedure TCustomersForm.SpeedButton2Click(Sender: TObject);
begin
  ExecuteDBGridEhFindDialogProc(dbgCustomers, edtSearch.Text, '', nil, False);
end;

procedure TCustomersForm.srcPagesDataChange(Sender: TObject; Field: TField);
begin
  if not mtbPages.FieldByName('ID').IsNull then
    ShowPage(IndexToPage(mtbPages['ID']));
end;

procedure TCustomersForm.FormActivate(Sender: TObject);
begin
  if (dsCustomers.Active) and (FNeedRefresh) then
  begin
    RefreshCurrentRecord(Self);
  end;
end;

procedure TCustomersForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  v: TfsCustomVariable;
  i: Integer;
begin
  if Assigned(FPageList) then
  begin
    for i := 0 to FPageList.Count - 1 do
    begin
      if Assigned(FPageList[i].Page) then
        FPageList[i].Page.SaveState;
    end;
    FPageList.Free;
  end;

  if fsGlobalUnit <> nil then
  begin
    v := fsGlobalUnit.Find(Self.Name);
    if v <> nil then
      fsGlobalUnit.RemoveItems(Self);
  end;

  if actAddressSearch.Checked then
    dmMain.SetIniValue('SHOWADDRESSFILTER', '1')
  else
    dmMain.SetIniValue('SHOWADDRESSFILTER', '0');

  if (mtbPages.RecordCount > 0) and (not mtbPages.FieldByName('ID').IsNull) then
    dmMain.SetIniValue('LASTPAGE', IntToStr(mtbPages['ID']));

  if mtbPages.Active then
  begin
    mtbPages.EmptyTable;
    mtbPages.Close;
  end;

  dbgCustomers.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'CustGrid', False);
  CustomersForm := nil;

  Action := caFree;
end;

procedure TCustomersForm.FormDeactivate(Sender: TObject);
begin
  FNeedRefresh := True;
end;

procedure TCustomersForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssAlt]) and ((Ord(Key) = VK_UP) or (Ord(Key) = VK_DOWN)) and (not(ActiveControl is TDBLookupComboboxEh))
  then
  begin
    SwitchIfoTab((Ord(Key) = VK_DOWN));
    Key := 0;
  end;
end;

procedure TCustomersForm.frxFIBCustomersCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  if dbgCustomers.SelectedRows.Count > 0 then
    Eof := (fSelectedRow > dbgCustomers.SelectedRows.Count)
end;

procedure TCustomersForm.frxFIBCustomersFirst(Sender: TObject);
begin
  if dbgCustomers.SelectedRows.Count > 0 then
  begin
    fSelectedRow := 1;
    dbgCustomers.DataSource.DataSet.Bookmark := dbgCustomers.SelectedRows[0];
  end
end;

procedure TCustomersForm.frxFIBCustomersNext(Sender: TObject);
begin
  if (dbgCustomers.SelectedRows.Count > 0) then
  begin
    if fSelectedRow < dbgCustomers.SelectedRows.Count then
      dbgCustomers.DataSource.DataSet.Bookmark := dbgCustomers.SelectedRows[fSelectedRow];
    inc(fSelectedRow);
  end
end;

procedure TCustomersForm.frxFIBCustomersPrior(Sender: TObject);
begin
  if dbgCustomers.SelectedRows.Count > 0 then
  begin
    dec(fSelectedRow);
    dbgCustomers.DataSource.DataSet.Bookmark := dbgCustomers.SelectedRows[fSelectedRow - 1];
  end
end;

procedure TCustomersForm.edtSearchChange(Sender: TObject);
  procedure FindOnFildOnly;
  var
    NesSs: string;
    f: string;
    bm: TBookMark;
    v: Extended;
  begin
    NesSs := edtSearch.Text;
    // Если ищем в цифровых полях, а ввели не цифры, то выйдем
    if (dbgCustomers.Columns[dbgCustomers.SelectedIndex].Field.DataType in [ftSmallint, ftInteger, ftWord, ftFloat,
      ftCurrency, ftBCD]) then
      if not TryStrToFloat(NesSs, v) then
        Exit;

    // Нужно заменить все запятые на точки
    if (dbgCustomers.Columns[dbgCustomers.SelectedIndex].FieldName = 'CUST_CODE') then
    begin
      NesSs := StringReplace(edtSearch.Text, '.', '-', [rfReplaceAll]);
      NesSs := StringReplace(NesSs, ',', '-', [rfReplaceAll]);
      NesSs := StringReplace(NesSs, ' ', '-', [rfReplaceAll]);
    end;

    if (dbgCustomers.Columns[dbgCustomers.SelectedIndex].FieldName = 'ACCOUNT_NO') then
    begin
      NesSs := StringReplace(edtSearch.Text, ',', '.', [rfReplaceAll]);
    end;

    dbgCustomers.DataSource.DataSet.DisableControls;
    bm := dbgCustomers.DataSource.DataSet.GetBookmark;
    try
      dbgCustomers.DataSource.DataSet.First;
      if not dsCustomers.Locate(dbgCustomers.Columns[dbgCustomers.SelectedIndex].FieldName, VarArrayOf([NesSs]),
        [loPartialKey, loCaseInsensitive]) then
        dbgCustomers.DataSource.DataSet.GotoBookmark(bm);
      dbgCustomers.DataSource.DataSet.EnableControls;
    except
      dbgCustomers.DataSource.DataSet.GotoBookmark(bm);
    end;

    f := Copy(dbgCustomers.Columns[dbgCustomers.SelectedIndex].DisplayText, 1, Length(edtSearch.Text));
    if (AnsiUpperCase(f) <> AnsiUpperCase(NesSs)) then
      edtSearch.Font.Color := clRed
    else
      edtSearch.Font.Color := clWindowText;
  end;

begin
  if not dsCustomers.Active then
    Exit;

  if chkFldOnly.Checked then
    FindOnFildOnly
  else
  begin
    dbgCustomers.SearchPanel.SearchingText := edtSearch.Text;
    dbgCustomers.SearchPanel.RestartFind;
    if edtSearch.Text <> '' then
      actFilterSearchText.ImageIndex := 5
    else
      actFilterSearchText.ImageIndex := 2;
  end;

end;

procedure TCustomersForm.edtSearchEnter(Sender: TObject);
begin
  dbgCustomers.SearchPanel.Active := True;
end;

procedure TCustomersForm.edtSearchExit(Sender: TObject);
begin
  dbgCustomers.SearchPanel.Active := False;
end;

procedure TCustomersForm.edtSearchKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i: Integer;
  ctrlpressed: Boolean;
begin
  if not chkFldOnly.Checked then
  begin
    i := dbgCustomers.SearchPanel.FoundColumnIndex;
    ctrlpressed := ssCtrl in Shift;
    if i >= 0 then
    begin
      case Key of
        VK_RETURN:
          begin
            if ctrlpressed then
              actFilterSearchText.Execute
            else
              dbgCustomers.SetFocus
          end;
        VK_DOWN:
          actSearchNext.Execute;
        VK_UP:
          actSearchPrev.Execute;
      end;
    end;
  end;
end;

function TCustomersForm.IndexToPage(Index: Integer): TA4onPage;
begin
  Result := nil;
  if not Assigned(FPageList) then
    Exit;

  if (Index < 0) or (Index >= FPageList.Count) then
    raise Exception.Create('Invalid page index');
  Result := FPageList[Index].Page;
end;

procedure TCustomersForm.SetPageIndex(Index: Integer);
begin
  if not(mtbPages.Active) then
    Exit;

  mtbPages.DisableControls;
  mtbPages.First;
  while (mtbPages['ID'] <> Index) and (not mtbPages.Eof) do
    mtbPages.next;
  mtbPages.EnableControls;
end;

procedure TCustomersForm.ActAddPaymentExecute(Sender: TObject);
var
  dt: TDate;
  sm: Currency;
begin
  dt := NOW;
  sm := 0;
  if ReceivePayment(dsCustomers['CUSTOMER_ID'], -1, -1, dt, sm) <> -1 then
  begin
    dsCustomers_Refresh;
  end;
end;

procedure TCustomersForm.actAddressSearchExecute(Sender: TObject);
begin
  if not actAddressSearch.Checked then
    StartSearchAddress
  else
    StopSearchAdres;

  {
    if not TryStrToInt(dmMain.GetIniValue('FETCHALL'), i)
    then
    i := 0;
    if i = 0
    then begin
    dmMain.SetIniValue('FETCHALL', '1');
    dsCustomers.CloseOpen(True);
    end;

    if Not Assigned(AdresSearchForm)
    then
    AdresSearchForm := TAdresSearchForm.Create(Self);
    AdresSearchForm.Show;
  }
end;

procedure TCustomersForm.StartSearchAddress;
begin
  if (actAddressSearch.Tag <> 1) and (dmMain.GetIniValue('FETCHALL') = '0') then
  begin
    actAddressSearch.Tag := 1;
  end;

  actAddressSearch.Checked := True;
  pnlSearchAdres.Visible := True;
  lcbStreets.SetFocus;
  dsArea.Open;
  dsStreets.Open;
end;

procedure TCustomersForm.StopSearchAdres;
var
  bm: TBookMark;
begin
  pnlSearchAdres.Visible := False;
  actAddressSearch.Checked := False;

  if dsFLAT.Active then
    dsFLAT.Close;
  if dsHomes.Active then
    dsHomes.Close;
  if dsStreets.Active then
    dsStreets.Close;
  if dsArea.Active then
    dsArea.Close;
  bm := CustomersForm.dbgCustomers.DataSource.DataSet.GetBookmark;
  dbgCustomers.DataSource.DataSet.filter := '';
  dbgCustomers.DataSource.DataSet.Filtered := False;
  dbgCustomers.DataSource.DataSet.GotoBookmark(bm);

  dbgCustomers.SetFocus;
end;

procedure TCustomersForm.ActCancelContractExecute(Sender: TObject);
var
  i: Integer;
  all: Boolean;
  s: string;
  Save_Cursor: TCursor;
  fq: TpFIBQuery;
begin
  with TCancelContractForm.Create(Self) do
    try
      s := '';
      if not dsCustomers.FieldByName('SURNAME').IsNull then
      begin
        s := dsCustomers['SURNAME'];
        if not dsCustomers.FieldByName('INITIALS').IsNull then
          s := s + ' ' + dsCustomers['INITIALS'];
      end;

      FIO := s;
      if ShowModal = mrOk then
      begin
        all := False;

        if (dbgCustomers.SelectedRows.Count > 0) then
          all := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);

        if all then
        begin
          Save_Cursor := Screen.Cursor;
          Screen.Cursor := crHourGlass; { Show hourglass cursor }
          fq := TpFIBQuery.Create(Self);
          try
            fq.Database := dmMain.dbTV;
            fq.Transaction := dmMain.trWriteQ;
            fq.sql.Text := 'EXECUTE PROCEDURE CANCEL_CONTRACT (:CUSTOMER_ID,:CANCEL_DATE,:OFF_SERV_ID)';

            for i := 0 to dbgCustomers.SelectedRows.Count - 1 do
            begin
              dbgCustomers.DataSource.DataSet.Bookmark := dbgCustomers.SelectedRows[i];
              fq.ParamByName('CUSTOMER_ID').AsInteger := dsCustomers['customer_id'];
              fq.ParamByName('CANCEL_DATE').AsDate := CancelDate.value;
              if VarIsNull(ServiceOff.KeyValue) then
                fq.ParamByName('OFF_SERV_ID').IsNull := True
              else
                fq.ParamByName('OFF_SERV_ID').AsInteger := ServiceOff.KeyValue;
              fq.Transaction.StartTransaction;
              fq.ExecQuery;
              fq.Transaction.Commit;
              fq.Close;
              dsCustomers_Refresh;
            end;
          finally
            fq.Free;
          end;

          Screen.Cursor := Save_Cursor; { Always restore to normal }
        end
        else
        begin
          fq := TpFIBQuery.Create(Self);
          try
            fq.Database := dmMain.dbTV;
            fq.Transaction := dmMain.trWriteQ;
            fq.sql.Text := 'EXECUTE PROCEDURE CANCEL_CONTRACT (:CUSTOMER_ID,:CANCEL_DATE,:SERVICE_ID)';
            fq.ParamByName('CUSTOMER_ID').AsInteger := dsCustomers['customer_id'];
            fq.ParamByName('CANCEL_DATE').AsDate := CancelDate.value;
            if VarIsNull(ServiceOff.KeyValue) then
              fq.ParamByName('SERVICE_ID').IsNull := True
            else
              fq.ParamByName('SERVICE_ID').AsInteger := ServiceOff.KeyValue;
            fq.Transaction.StartTransaction;
            fq.ExecQuery;
            fq.Transaction.Commit;
            fq.Close;
            dsCustomers_Refresh;
          finally
            fq.Free;
          end;
        end;
      end;
    finally
      Free;
    end;
end;

procedure TCustomersForm.actCheckPassportExecute(Sender: TObject);
var
  i: Integer;
  all: Boolean;
begin
  all := False;
  if (dbgCustomers.SelectedRows.Count > 0) then
    all := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);

  if all then
  begin
    for i := 0 to dbgCustomers.SelectedRows.Count - 1 do
    begin
      dbgCustomers.DataSource.DataSet.Bookmark := dbgCustomers.SelectedRows[i];
      ValidatePassport;
    end;
  end
  else
    ValidatePassport;
end;

procedure TCustomersForm.actCopyExecute(Sender: TObject);
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
          DBGridEh_DoCopyAction(dbg, False);
      end
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TCustomersForm.actCustNodeExecute(Sender: TObject);
begin
  if (dsCustomers.FieldByName('HOUSE_ID').IsNull) or (dsCustomers.FieldByName('FLAT_NO').IsNull) then
    Exit;

  A4MainForm.OpnenNodeByFlat(dsCustomers['HOUSE_ID'], dsCustomers['FLAT_NO']);
end;

procedure TCustomersForm.actCustomerAddExecute(Sender: TObject);
var
  i: Integer;
begin
  i := NewCustomer;
  if i > 0 then
  begin
    dsCustomers_Refresh(True);
    dsCustomers.Locate('CUSTOMER_ID', i, []);
    if (not mtbPages.FieldByName('ID').IsNull) then
      ShowPage(IndexToPage(mtbPages['ID']));
  end;
end;

procedure TCustomersForm.actCustomerDeleteExecute(Sender: TObject);
var
  i: Integer;
  s: string;
  all: Boolean;
  Save_Cursor: TCursor;
begin
  if dmMain.InStrictMode then
    Exit;

  if (dsCustomers.RecordCount = 0) then
    Exit;

  If MessageDlg(rsDeleteCustomerWarning, mtConfirmation, [mbYes, mbNo], 0, mbNo) <> mrYes then
    Exit;

  all := False;

  if (dbgCustomers.SelectedRows.Count > 0) then
    all := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);

  if all then
  begin
    If MessageDlg(rsDeleteInfoAbout + IntToStr(dbgCustomers.SelectedRows.Count) + rsCustomersQ, mtConfirmation,
      [mbNo, mbYes], 0) = mrNo then
      Exit;
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourGlass; { Show hourglass cursor }
    for i := 0 to dbgCustomers.SelectedRows.Count - 1 do
    begin
      dbgCustomers.DataSource.DataSet.Bookmark := dbgCustomers.SelectedRows[i];
      dsCustomers.Delete;
    end;
    Screen.Cursor := Save_Cursor; { Always restore to normal }
  end
  else
  begin
    s := '';
    if not(dsCustomers.FieldByName('SURNAME').IsNull) then
      s := s + dsCustomers['SURNAME'];
    if not(dsCustomers.FieldByName('INITIALS').IsNull) then
      s := s + ' ' + dsCustomers['INITIALS'];
    s := s + rsACCOUNT + ' ' + dsCustomers['ACCOUNT_NO'] + '?';
    If MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbNo, mbYes], 0) = mrNo then
      Exit;
    dsCustomers.Delete;
  end;
end;

procedure TCustomersForm.actCustomerEditExecute(Sender: TObject);
begin
  if not dsCustomers.FieldByName('Customer_ID').IsNull then
    ShowCustomer(dsCustomers.FieldValues['Customer_ID'], True);
  // dsCustomers_Refresh;
end;

procedure TCustomersForm.actEnableFilterExecute(Sender: TObject);
begin
  actEnableFilter.Checked := not actEnableFilter.Checked;
  dsCustomers.ParamByName('Filter').value := GenerateFilter;
  dsCustomers.CloseOpen(True);
end;

procedure TCustomersForm.actFilterFLDExecute(Sender: TObject);
begin
  edtSearch.Text := dbgCustomers.SelectedField.AsString;
  actFilterSearchText.Execute;
end;

procedure TCustomersForm.actFilterSearchTextExecute(Sender: TObject);
begin
  if actFilterSearchText.Checked then
  begin
    actFilterSearchText.Checked := False;
    dbgCustomers.SearchPanel.CancelSearchFilter;
    edtSearch.Text := '';
  end
  else
  begin
    if edtSearch.Text <> '' then
    begin
      actFilterSearchText.Checked := True;
      dbgCustomers.SearchPanel.ApplySearchFilter;
    end;
  end;
end;

procedure TCustomersForm.actFltrManyAccountsExecute(Sender: TObject);
var
  acts: TStrings;
begin
  acts := TStringList.Create;
  try
    if EditText(acts) then
      ShowMessage(acts.Text);
  finally
    acts.Free;
  end;
end;

procedure TCustomersForm.ActionRefreshExecute(Sender: TObject);
begin
  RefreshCustomerRecords;
end;

procedure TCustomersForm.RefreshCustomerRecords;
var
  i: Integer;
begin
  if (dsCustomers.Active) and (not dsCustomers.FieldByName('CUSTOMER_ID').IsNull) then
    i := dsCustomers['CUSTOMER_ID']
  else
    i := -1;
  dsCustomers.CloseOpen(True);
  if i > 0 then
    dsCustomers.Locate('CUSTOMER_ID', i, []);

  if Assigned(FLastPage) then
  begin
    FLastPage.CloseData;
    FLastPage.OpenData;
  end;
end;

procedure TCustomersForm.actItogoExecute(Sender: TObject);
begin
  if not actItogo.Visible then
  begin
    dbgCustomers.SumList.Active := False;
    dbgCustomers.FooterRowCount := 0;
    Exit;
  end;

  if dbgCustomers.SumList.Active then
    dbgCustomers.FooterRowCount := 0
  else
    dbgCustomers.FooterRowCount := 1;

  dbgCustomers.SumList.Active := not dbgCustomers.SumList.Active;
  actItogo.Checked := dbgCustomers.SumList.Active;
end;

procedure TCustomersForm.ActLettersExecute(Sender: TObject);
var
  i: Integer;
  RecordInDB: Boolean;
  SavePDF: Boolean;
  periodFrom: TDateTime;
  FILENAME: String;
begin
  i := SelectLetterType(0, FILENAME, RecordInDB, SavePDF);
  if i = -1 then
    Exit;
  if FILENAME = '' then
    Exit;

  dsCustomers.DisableControls;

  ShowReport(FILENAME);

  if (RecordInDB) then
    if MessageDlg(rsSaveLetterDate, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

      with TpFIBQuery.Create(Nil) do
        try
          Database := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          sql.Add('insert into CustLetter (customer_id, custletterid, lettertypeid, custletterdate)');
          sql.Add('values (:customer_id, GEN_ID(gen_operations_uid,1), :lettertypeid, :custletterdate);');
          ParamByName('lettertypeid').AsInteger := i;

          // try
          // periodFrom := frxReport.Script.Variables['DATEFROM'];
          // except
          periodFrom := NOW;
          // end;
          ParamByName('custletterdate').AsDate := periodFrom;

          if dbgCustomers.SelectedRows.Count > 0 then
            for i := 0 to dbgCustomers.SelectedRows.Count - 1 do
            begin
              dbgCustomers.DataSource.DataSet.Bookmark := dbgCustomers.SelectedRows[i];
              ParamByName('customer_id').AsInteger := dsCustomers['customer_ID'];
              Transaction.StartTransaction;
              ExecQuery;
              Transaction.Commit;
            end
          else
          begin
            dsCustomers.First;
            while not dsCustomers.Eof do
            begin
              Transaction.StartTransaction;
              ParamByName('customer_id').AsInteger := dsCustomers['customer_ID'];
              ExecQuery;
              Transaction.Commit;
              dsCustomers.next;
            end;
          end;
        finally
          Free;
        end;
    end;
  dsCustomers.EnableControls;
end;

procedure TCustomersForm.actPrepayExecute(Sender: TObject);
var
  s: string;
  v: Extended;
  all: Boolean;
  Save_Cursor: TCursor;
  i: Integer;

  procedure AddPrepay(const psum: Extended; cid: Integer);
  begin
    with TpFIBQuery.Create(Self) do
    begin
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        sql.Text := 'execute procedure Set_Prepay(:Customer_Id,:Prepay_Sum)';
        ParamByName('Prepay_Sum').value := psum; // v;
        ParamByName('Customer_Id').value := cid; // dsCustomers.FieldByName('customer_id').AsInteger;
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
        Close;
        RefreshCurrentRecord(Self);
      finally
        Free;
      end;
    end;
  end;

begin
  s := '0';
  if InputQuery(rsPrepay, rsAmount, s) then
  begin
    if TryStrToFloat(s, v) then
    begin
      all := (dbgCustomers.SelectedRows.Count > 1);
      if all then
        all := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);

      Save_Cursor := Screen.Cursor;
      Screen.Cursor := crHourGlass;

      if all then
      begin
        for i := 0 to dbgCustomers.SelectedRows.Count - 1 do
        begin
          dbgCustomers.DataSource.DataSet.Bookmark := dbgCustomers.SelectedRows[i];
          AddPrepay(v, dsCustomers['customer_id']);
        end
      end
      else
        AddPrepay(v, dsCustomers['customer_id']);

      Screen.Cursor := Save_Cursor;
    end;
  end;
end;

procedure TCustomersForm.ActPrintGridExecute(Sender: TObject);
var
  bm: TBookMark;
begin
  if not dsCustomers.Active then
    Exit;

  dsCustomers.DisableControls;
  bm := dsCustomers.GetBookmark;
  dsCustomers.First;
  ShowReport(rsReportListAccounts);
  dsCustomers.GotoBookmark(bm);
  dsCustomers.EnableControls;
end;

procedure TCustomersForm.actQuickFilterExecute(Sender: TObject);
begin
  actQuickFilter.Checked := not actQuickFilter.Checked;
  dbgCustomers.STFilter.Visible := actQuickFilter.Checked;
  if not actQuickFilter.Checked then
    dbgCustomers.DataSource.DataSet.Filtered := False;
end;

procedure TCustomersForm.actRequestExecute(Sender: TObject);
var
  aCustomer: Integer;
begin
  if (not(dmMain.AllowedAction(rght_Request_Add) or dmMain.AllowedAction(rght_Request_Full))) then
    Exit;
  if (dsCustomers.RecordCount > 0) and (not dsCustomers.FieldByName('CUSTOMER_ID').IsNull) then
    aCustomer := dsCustomers['CUSTOMER_ID']
  else
    aCustomer := -1;

  NewRequest(aCustomer);
end;

procedure TCustomersForm.actResetpasswordExecute(Sender: TObject);
var
  pswd: String;
begin
  // Сброс пароля
  if (dsCustomers.RecordCount = 0) then
    Exit;

  if dsCustomers.FieldByName('CUSTOMER_ID').IsNull then
    Exit;

  if (not dmMain.AllowedAction(rght_Customer_PSWD)) then
    Exit;

  pswd := GenPassword(8);
  EditText(pswd, 'Новый пароль', Format('Абоненту %s будет установлен пароль', [dsCustomers['ACCOUNT_NO']]));
  with TpFIBQuery.Create(Self) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      sql.Text := 'UPDATE customer set Secret = :pswd where Customer_Id = :CID';
      ParamByName('pswd').AsString := pswd;
      ParamByName('CID').AsInteger := dsCustomers['CUSTOMER_ID'];
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      Close;
    finally
      Free;
    end;
  end;
end;

procedure TCustomersForm.actSaveAsExecute(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  Ext: String;

begin
  // Экспорт информации
  if (not dmMain.AllowedAction(rght_Export)) then
    Exit;

  A4MainForm.SaveDialog.FILENAME := rsCustomers;
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
        if AnsiUpperCase(Copy(A4MainForm.SaveDialog.FILENAME, Length(A4MainForm.SaveDialog.FILENAME) - 2, 3)) <>
          AnsiUpperCase(Ext) then
          A4MainForm.SaveDialog.FILENAME := A4MainForm.SaveDialog.FILENAME + '.' + Ext;

        SaveDBGridEhToExportFile(ExpClass, TDBGridEh(ActiveControl), A4MainForm.SaveDialog.FILENAME, False);
      end;
    end;
end;

procedure TCustomersForm.actSearchNextExecute(Sender: TObject);
begin
  dbgCustomers.SearchPanel.FindNext;
end;

procedure TCustomersForm.actSearchPrevExecute(Sender: TObject);
begin
  dbgCustomers.SearchPanel.FindPrev;
end;

procedure TCustomersForm.actSelectAllExecute(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TCustomersForm.actSelectColumnsExecute(Sender: TObject);
var
  i: Cardinal;
begin
  i := SelectCustomerColumns(fVisibleColumns);
  if fVisibleColumns <> i then
    SetVisibleColumns(i);
end;

procedure TCustomersForm.actSendMessagesExecute(Sender: TObject);
begin
  // рассылка сообщений абонентам
  SendMessages();
end;

procedure TCustomersForm.ActSetFilterExecute(Sender: TObject);
var
  filter: string;
  fidx: Integer;
begin
  filter := '';
  with TCustomersFilterForm.Create(Application) do
    try
      if not dsFilter.Active then
        SetDefaultFilter;

      actEnableFilter.Checked := (ShowModal = mrOk);
      filter := GenerateFilter;
    finally
      Free;
    end;

  if (dsCustomers.Filtered) then
  begin
    dsCustomers.filter := '';
    dsCustomers.Filtered := False;
  end;

  if filter <> '' then
  begin
    dsCustomers.Close;
    if (dmMain.AllowedAction(rght_Customer_Only_ONE) and (filter = const_default_filter)) then
    begin
      fidx := dsCustomers.SelectSQL.IndexOf(cst_OneRecord);
      if (fidx = -1) then
      begin
        dsCustomers.SelectSQL.Insert(1, cst_OneRecord);
      end;
    end;
    dsCustomers.ParamByName('Filter').value := filter;
    try
      OpenDataSet;
    except
      ShowMessage(rsErrorFilter);
      dsCustomers.Close;
      dsCustomers.ParamByName('Filter').Clear;
      OpenDataSet;
    end;
  end;

end;

procedure TCustomersForm.actSetFilterNewExecute(Sender: TObject);
var
  filter: string;
begin
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

  with TCustomersFilterForm.Create(Application) do
    try
      if ShowModal = mrOk then
      begin
        actEnableFilter.Checked := True;
        filter := GenerateFilter;
      end;
    finally
      Free;
    end;

  if (dsCustomers.Filtered) then
  begin
    dsCustomers.filter := '';
    dsCustomers.Filtered := False;
  end;

  if filter <> '' then
  begin
    dsCustomers.Close;
    dsCustomers.ParamByName('Filter').value := filter;
    OpenDataSet;
  end;
end;

procedure TCustomersForm.actTaskExecute(Sender: TObject);
begin
  if (dsCustomers.RecordCount = 0) or (dsCustomers.FieldByName('ACCOUNT_NO').IsNull) then
    Exit;
  A4MainForm.MakeTask('A', dsCustomers['ACCOUNT_NO'], NewTaskCallBack);
end;

procedure TCustomersForm.NewTaskCallBack(const TaskID: Integer);
var
  all: Boolean;
  fq: TpFIBQuery;
  fobj: string;
  i: Integer;
begin

  if (dbgCustomers.SelectedRows.Count > 0) then
    all := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  else
    all := False;

  if not all then
    Exit;

  fobj := dsCustomers['ACCOUNT_NO'];

  fq := TpFIBQuery.Create(Self);
  try
    fq.Database := dmMain.dbTV;
    fq.Transaction := dmMain.trWriteQ;
    fq.sql.Add('execute block (                                                       ');
    fq.sql.Add('    TASK_ID  d_integer = :TASK_ID,                                    ');
    fq.sql.Add('    FROM_OBJ D_VARCHAR100 = :FROM_OBJ,                                ');
    fq.sql.Add('    OBJ_TYPE D_VARCHAR5   = :OBJ_TYPE,                                ');
    fq.sql.Add('    OBJ_ID   D_VARCHAR100 = :OBJ_ID)                                  ');
    fq.sql.Add('as                                                                    ');
    fq.sql.Add('declare variable NOTICE    D_VARCHAR500;                              ');
    fq.sql.Add('begin                                                                 ');
    fq.sql.Add('  select TEXT from TASKMSG                                            ');
    fq.sql.Add('  where TASK_ID = :TASK_ID and OBJ_TYPE=:OBJ_TYPE and OBJ_ID=:FROM_OBJ');
    fq.sql.Add('  into :NOTICE;                                                       ');
    fq.sql.Add('  insert into TASKMSG (TASK_ID, TEXT, OBJ_TYPE, OBJ_ID)               ');
    fq.sql.Add('  values (:TASK_ID, :NOTICE, :OBJ_TYPE, :OBJ_ID);                     ');
    fq.sql.Add('end                                                                   ');

    for i := 0 to dbgCustomers.SelectedRows.Count - 1 do
    begin
      dbgCustomers.DataSource.DataSet.Bookmark := dbgCustomers.SelectedRows[i];
      if fobj <> dsCustomers['ACCOUNT_NO'] then
      begin
        fq.ParamByName('TASK_ID').AsInteger := TaskID;
        fq.ParamByName('FROM_OBJ').AsString := fobj;
        fq.ParamByName('OBJ_TYPE').AsString := 'A';
        fq.ParamByName('OBJ_ID').AsString := dsCustomers['ACCOUNT_NO'];
        fq.Transaction.StartTransaction;
        fq.ExecQuery;
        fq.Transaction.Commit;
      end;
    end;
  finally
    fq.Free;
  end;
end;

procedure TCustomersForm.ActBalanceExecute(Sender: TObject);
var
  smb: TBookMark;

  procedure addFeeRecord;
  begin
    mdsBalance.Append;
    mdsBalance['FDESCRIPTION'] := qBalance.FieldByName('FDESCRIPTION').AsString;
    mdsBalance['FSUMMA'] := qBalance.FieldByName('FSUMMA').AsCurrency;
  end;

  procedure addPayRecord;
  begin
    while not(mdsBalance.FieldByName('PDESCRIPTION').IsNull or mdsBalance.Eof) do
      mdsBalance.next;
    if mdsBalance.Eof then
      mdsBalance.Append
    else
      mdsBalance.Edit;
    mdsBalance['PDESCRIPTION'] := qBalance.FieldByName('PDESCRIPTION').AsString;
    mdsBalance['PSUMMA'] := qBalance.FieldByName('PSUMMA').AsCurrency;
  end;

begin
  if dsCustomers.FieldByName('CUSTOMER_ID').IsNull then
    Exit;

  qBalance.ParamByName('CUSTOMER_ID').AsInteger := dsCustomers['CUSTOMER_ID'];
  qBalance.Transaction.StartTransaction;
  qBalance.ExecQuery;
  mdsBalance.Open;
  mdsBalance.EmptyTable;
  smb := mdsBalance.GetBookmark;
  while not qBalance.Eof do
  begin
    if (mdsBalance['RMONTH'] <> qBalance.FieldByName('RMONTH').AsDate) then
    begin
      mdsBalance.Append;
      mdsBalance['RMONTH'] := qBalance.FieldByName('RMONTH').AsDate;
      if not qBalance.FieldByName('FDESCRIPTION').IsNull then
      begin
        mdsBalance['FDESCRIPTION'] := qBalance.FieldByName('FDESCRIPTION').AsString;
        mdsBalance['FSUMMA'] := qBalance.FieldByName('FSUMMA').AsCurrency;
      end
      else
      begin
        mdsBalance['PDESCRIPTION'] := qBalance.FieldByName('PDESCRIPTION').AsString;
        mdsBalance['PSUMMA'] := qBalance.FieldByName('PSUMMA').AsCurrency;
      end;
      mdsBalance['CUSTOMER_ID'] := qBalance.FieldByName('RCUSTOMER_ID').AsInteger;
      mdsBalance.Post;
      smb := mdsBalance.GetBookmark;
    end
    else
    begin
      mdsBalance.GotoBookmark(smb);
      if not qBalance.FieldByName('PDESCRIPTION').IsNull then
        addPayRecord
      else
        addFeeRecord;
      mdsBalance['RMONTH'] := qBalance.FieldByName('RMONTH').AsDate;
      mdsBalance['CUSTOMER_ID'] := qBalance.FieldByName('RCUSTOMER_ID').AsInteger;
      mdsBalance.Post;
    end;
    qBalance.next;
  end;
  qBalance.Transaction.Commit;
  qBalance.Close;

  ShowReport(rsRepCustomerBalance);
end;

procedure TCustomersForm.cbbAREAChange(Sender: TObject);
begin
  if (VarIsNumeric(cbbAREA.KeyValue)) then
    dsStreets.ParamByName('area_id').AsInteger := cbbAREA.KeyValue
  else
    dsStreets.ParamByName('area_id').Clear;

  dsCustomers.DisableControls;
  if dsFLAT.Active then
  begin
    lcbFLAT.Clear;
    dsFLAT.Close;
  end;
  if dsHomes.Active then
  begin
    lcbHOUSE.Clear;
    dsHomes.Close;
  end;
  if dsStreets.Active then
  begin
    lcbStreets.Clear;
    dsStreets.Close;
  end;
  dsCustomers.EnableControls;
  dsStreets.Open;
end;

procedure TCustomersForm.chkFldOnlyClick(Sender: TObject);
begin
  tlbSearch.Visible := not chkFldOnly.Checked;
end;

procedure TCustomersForm.SetVisibleColumns(Mask: Integer);
var
  Opened: Boolean;
  select, from, where, order: string;
  filter: string;
  cid: Integer;
begin
  cid := -1;
  fVisibleColumns := Mask;
  Opened := dsCustomers.Active;
  if Opened then
  begin
    if not dsCustomers.FieldByName('CUSTOMER_ID').IsNull then
      cid := dsCustomers['CUSTOMER_ID'];
    filter := dsCustomers.ParamByName('Filter').value;
    dsCustomers.Close;
  end;

  select := ' C.* ,s.street_short ,S.Street_Name ,H.House_No, h.POST_INDEX ,h.Street_ID ,-1*c.debt_sum as BALANCE ' +
    rsEOL + ' , iif(exists(select ss.Customer_Id from SUBSCR_SERV ss where ss.CUSTOMER_ID = c.CUSTOMER_ID and ss.STATE_SGN = 1) ,1, 0) as connected ';
  from := ' FROM CUSTOMER C INNER JOIN HOUSE H ON (C.HOUSE_ID = H.HOUSE_ID) INNER JOIN STREET S ON (H.STREET_ID = S.STREET_ID)';
  where := ' WHERE @filter ';
  // Ограничим видимость по участкам
  order := dmMain.UserAreas;
  if order <> '' then
  begin
    from := from + ' inner join workgroups wg on (wg.wg_id = h.wg_id) inner join workarea wa on (wg.wa_id = wa.wa_id) ';
    where := where + ' and wa.WA_ID in (' + dmMain.UserAreas + ')';
  end;
  order := ' Order by C.account_no ';

  if (Mask and clc_Koef) <> 0 then
  begin
    select := select + rsEOL + ', df.factor_value, df.DATE_FROM, df.DATE_TO ';
    from := from + rsEOL +
      ' left outer join discount_factor df on (df.customer_id = c.customer_id and CURRENT_DATE between df.date_from and df.date_to) ';
  end;

  if (Mask and clc_PE) <> 0 then
  begin
    select := select + rsEOL + ', hf.porch_n, hf.floor_n, ar.Area_Name, sa.Subarea_Name ';
    from := from + rsEOL + ' left outer join houseflats hf on (hf.house_id = c.house_id and hf.flat_no = c.flat_no) ';
    from := from + rsEOL + ' left outer join area ar on (ar.Area_Id = s.Area_Id) ';
    from := from + rsEOL + ' left outer join Subarea sa on (sa.Subarea_Id = h.Subarea_Id) ';
  end
  else
    select := select + rsEOL + ', '''' as porch_n, '''' as floor_n ';

  if (Mask and clc_Lan) <> 0 then
  begin
    select := select + rsEOL + ', l.ip, l.mac, l.port, le.name as LE_NAME, le.IP as LE_IP, l.TAG, l.TAG_STR';
    from := from + rsEOL +
      ' left outer join tv_lan l on (l.customer_id = c.customer_id) left outer join equipment le on (l.eq_id = le.eid) ';
  end;
  if (Mask and clc_Atrib) <> 0 then
  begin
    select := select + rsEOL + ', ca.o_name as ca_name, ca.ca_value, ca.notice as ca_notice ';
    from := from + rsEOL +
      ' left outer join (select CA.CUSTOMER_ID, o.o_name, ca.ca_value, ca.notice from CUSTOMER_ATTRIBUTES CA ' +
      '                  inner join OBJECTS o on (o.O_ID = CA.O_ID and o.O_TYPE = 4)) ca on (C.CUSTOMER_ID = CA.CUSTOMER_ID) ';
  end;

  if (Mask and clc_Nps) <> 0 then
  begin
    select := select + rsEOL + ', nps.Nps_Date, nps.Rating, nps.notice as nps_notice ';
    from := from + rsEOL + ' left outer join (select n.Customer_Id, n.Rating, n.Notice, n.Nps_Date from nps n ' +
      ' where n.NPS_DATE = (select max(s.NPS_DATE) from Nps s where s.Customer_Id = n.Customer_Id)) nps ' +
      '  on (C.CUSTOMER_ID = nps.CUSTOMER_ID) ';
  end;

  if (Mask and clc_Decoder) <> 0 then
  begin
    select := select + rsEOL + ', dgt.decoder_n, dgt.STB_N, dgt.NOTICE as dgt_notice, dgt.TV_MODEL';
    from := from + rsEOL + ' left outer join CUSTOMER_DECODERS dgt on (C.CUSTOMER_ID = dgt.CUSTOMER_ID) ';
  end;

  if (Mask and clc_ATRLINE) <> 0 then
  begin
    select := select + rsEOL + ', cal.ATR_LINE ';
    from := from + rsEOL +
      ' left outer join (select ca.Customer_Id, list(o.O_DIMENSION||(coalesce( '' (''||ca.Ca_Value||'')'', '''' ))) ATR_LINE'
      + ' from Customer_Attributes ca inner join objects o on (ca.O_Id = o.O_Id and o.O_Type = 4) group by 1 ) cal ' +
      ' on (cal.Customer_Id = c.Customer_Id ) '
  end;

  if (Mask and clc_MonPay) <> 0 then
  begin
    select := select + rsEOL +
      ', (select M_Tarif from Get_Tarif_Sum_Customer_Srv(c.Customer_Id, null, CURRENT_DATE)) MonPay ';
  end;

  if (Mask and clc_HeadEnd) <> 0 then
  begin
    select := select + rsEOL + ', he.He_Name';
    from := from + rsEOL + ' left outer join Headend he on (h.Headend_Id = he.He_Id) ';
  end;

  if (Mask and clc_Org) <> 0 then
  begin
    select := select + rsEOL + ', coalesce(oc.Org_Name, og.Org_Name) Org_Name ';
    from := from + rsEOL + ' left outer join Organization oc on (oc.Org_Id = c.Org_Id) ';
    from := from + rsEOL + ' left outer join Organization og on (og.Org_Id = h.Org_Id) ';
  end;

  if (Mask and clc_Pasport) <> 0 then
  begin
    select := select + rsEOL + ', datediff(year, C.BIRTHDAY, dateadd(month, 1, current_date)) as YEARS';
  end;

  from := from + rsEOL + '@from_add';
  CreatGridColumns(Mask);

  dsCustomers.SQLs.SelectSQL.Text := 'select ';
  if (dmMain.AllowedAction(rght_Customer_Only_ONE)) then
    dsCustomers.SQLs.SelectSQL.Add(cst_OneRecord);
  dsCustomers.SQLs.SelectSQL.Add(select);
  dsCustomers.SQLs.SelectSQL.Add(from);
  dsCustomers.SQLs.SelectSQL.Add(where);
  dsCustomers.SQLs.SelectSQL.Add(order);

  dsCustomers.SQLs.RefreshSQL.Text := 'select ';
  dsCustomers.SQLs.RefreshSQL.Add(select);
  dsCustomers.SQLs.RefreshSQL.Add(from);
  dsCustomers.SQLs.RefreshSQL.Add('WHERE  ( C.CUSTOMER_ID = :OLD_CUSTOMER_ID)');

  if Opened then
  begin
    dsCustomers.ParamByName('Filter').value := filter;
    OpenDataSet(cid);
  end;

  dmMain.SetIniValue('COLUMNS', IntToStr(fVisibleColumns));
end;

procedure TCustomersForm.CreatGridColumns(Mask: Integer);
var
  vVisibleSum: Boolean;
  vAsBalance: Boolean;
  vDec: Integer;
  DispNum: string;
begin
  SaldoSign := 1;
  vVisibleSum := dmMain.AllowedAction(rght_Customer_Debt); // просмотр сумм
  vVisibleSum := vVisibleSum or dmMain.AllowedAction(rght_Programm_ViewMoney);
  // просмотр сумм
  vVisibleSum := vVisibleSum or dmMain.AllowedAction(rght_Customer_full);
  // просмотр сумм

  vAsBalance := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1');
  // пеня
  vDec := dmMain.GetSettingsValue('FEE_ROUND');
  if vDec > 0 then
    DispNum := '#,##0.00'
  else
    DispNum := '#,##0';

  actItogo.Visible := vVisibleSum and dmMain.AllowedAction(rght_Export);

  dbgCustomers.Columns.Clear;

  with dbgCustomers.Columns.Add do
  begin
    FieldName := 'ACCOUNT_NO';
    Footer.value := rsItogo;
    Footer.ValueType := fvtStaticText;
    Title.Caption := rsACCOUNT;
    Title.SortIndex := 1;
    Title.SortMarker := smDownEh;
    Title.TitleButton := True;
    Width := 46;
  end;
  if (Mask and clc_KOD) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'CUST_CODE';
      Title.Caption := rsCODE;
      Title.TitleButton := True;
      Width := 50;
    end;
  with dbgCustomers.Columns.Add do
  begin
    FieldName := 'SURNAME';
    Footer.FieldName := 'ACCOUNT_NO';
    Footer.ValueType := fvtCount;
    Footer.DisplayFormat := '#,##0';
    Title.Caption := rsClientSN;
    Title.TitleButton := True;
    Width := 99;
  end;
  if (Mask and clc_IO) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'INITIALS';
      Title.Caption := rsClientFM;
      Title.TitleButton := True;
      Width := 30;
    end;
  if (Mask and clc_FullIO) <> 0 then
  begin
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'FIRSTNAME';
      Title.Caption := rsClientFN;
      Title.TitleButton := True;
      Width := 30;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'MIDLENAME';
      Title.Caption := rsClientMN;
      Title.TitleButton := True;
      Width := 30;
    end;
  end;
  with dbgCustomers.Columns.Add do
  begin
    FieldName := 'STREET_SHORT';
    Title.Caption := rsAddresST;
    Title.TitleButton := True;
    Width := 20;
  end;
  with dbgCustomers.Columns.Add do
  begin
    FieldName := 'STREET_NAME';
    Title.Caption := rsAddresStreet;
    Title.TitleButton := True;
    Width := 105;
  end;
  with dbgCustomers.Columns.Add do
  begin
    FieldName := 'HOUSE_NO';
    Title.Caption := rsAddresHouse;
    Title.TitleButton := True;
    Width := 44;
  end;
  with dbgCustomers.Columns.Add do
  begin
    FieldName := 'FLAT_NO';
    Title.Caption := rsAddresFlat;
    Title.TitleButton := True;
    Width := 41;
  end;
  if (Mask and clc_TAP) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'TAP';
      Title.Caption := rsAddresTAP;
      Title.TitleButton := True;
      Width := 41;
    end;

  if (Mask and clc_PE) <> 0 then
  begin
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'PORCH_N';
      Title.Caption := rsPorch;
      Title.TitleButton := True;
      Width := 21;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'FLOOR_N';
      Title.Caption := rsFloor;
      Title.TitleButton := True;
      Width := 18;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'POST_INDEX';
      Title.Caption := rsPostIndex;
      Title.TitleButton := True;
      Width := 40;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'Area_Name';
      Title.Caption := rsCity;
      Title.TitleButton := True;
      Width := 45;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'Subarea_Name';
      Title.Caption := rsDistrict;
      Title.TitleButton := True;
      Width := 45;
    end;
  end;

  if vVisibleSum then
  begin
    with dbgCustomers.Columns.Add do
    begin
      if vAsBalance then
      begin
        SaldoSign := -1;
        Title.Caption := rsBALANCE;
        FieldName := 'BALANCE';
        Footer.FieldName := 'BALANCE';
      end
      else
      begin
        SaldoSign := 1;
        FieldName := 'DEBT_SUM';
        Footer.FieldName := 'DEBT_SUM';
        Title.Caption := rsSaldo;
      end;
      DisplayFormat := DispNum;
      Footer.DisplayFormat := DispNum;
      Footer.ValueType := fvtSum;
      Title.TitleButton := True;
      Width := 69;
    end;
  end;

  if (Mask and clc_Phone) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'PHONE_NO';
      Title.Caption := rsClmnPhone;
      Title.TitleButton := True;
      Width := 52;
    end;

  if (Mask and clc_MobPhone) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'MOBILE_PHONE';
      Title.Caption := rsClmnMobilePhone;
      Title.TitleButton := True;
      Width := 97;
    end;

  if (Mask and clc_ExtID) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'EXTERNAL_ID';
      Title.Caption := rsClmnExternalID;
      Title.TitleButton := True;
      Width := 97;
    end;

  if (Mask and clc_Nps) <> 0 then
  begin
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'Rating';
      Title.Caption := rsNpsRating;
      Title.TitleButton := True;
      Width := 40;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'Nps_Date';
      Title.Caption := rsNpsDay;
      Title.TitleButton := True;
      Width := 65;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'nps_notice';
      Title.Caption := rsNpsNotice;
      Title.TitleButton := True;
      Width := 97;
    end;
  end;

  if (Mask and clc_Status) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'CUST_STATE_DESCR';
      Title.Caption := rsSTATE;
      Title.TitleButton := True;
      Width := 165;
    end;
  if (Mask and clc_Notice) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'NOTICE';
      Title.Caption := rsClmnNotice;
      Title.TitleButton := True;
      Width := 200;
      OnGetCellParams := dbgCustomersColumnsGetCellParams;
    end;
  if (Mask and clc_DogovorN) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'DOGOVOR_NO';
      Title.Caption := rsClmnContract;
      Title.TitleButton := True;
      Width := 60;
    end;
  if (Mask and clc_DatDog) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'CONTRACT_DATE';
      Title.Caption := rsClmnContractDate;
      Title.TitleButton := True;
      Width := 60;
    end;
  if (Mask and clc_DataAct) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'ACTIVIZ_DATE';
      Title.Caption := rsClmnFirstConnect;
      Title.TitleButton := True;
      Width := 60;
    end;
  if (Mask and clc_ATRLINE) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'ATR_LINE';
      Title.Caption := rsClmnAttributes;
      Title.TitleButton := True;
      Width := 70;
    end;

  if (Mask and clc_MonPay) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'MonPay';
      Title.Caption := rsMonthPay;
      Title.TitleButton := True;
      DisplayFormat := DispNum;
      Footer.DisplayFormat := DispNum;
      Footer.ValueType := fvtSum;
      Width := 70;
    end;

  if (Mask and clc_HeadEnd) <> 0 then
  begin
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'He_Name';
      Title.Caption := rsHeadEnd;
      Title.TitleButton := True;
      Width := 70;
    end;
  end;

  if (Mask and clc_Org) <> 0 then
  begin
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'Org_Name';
      Title.Caption := rsOrg;
      Title.TitleButton := True;
      Width := 70;
    end;
  end;

  if (Mask and clc_DogovorDo) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'VALID_TO';
      Title.Caption := rsClmnValidTo;
      Title.TitleButton := True;
      Width := 60;
    end;

  if (Mask and clc_Jur) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'JURIDICAL';
      Title.Caption := rsClmnJur;
      Title.TitleButton := True;
      Width := 15;
    end;

  if (Mask and clc_Email) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'Email';
      Title.Caption := rsClmnEmail;
      Title.TitleButton := True;
      Width := 30;
    end;

  if (Mask and clc_Prepay) <> 0 then
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'PREPAY';
      Title.Caption := rsClmnPrepay;
      Title.TitleButton := True;
      Width := 70;
    end;

  if ((Mask and clc_Pasport) <> 0) and FVisiblePassport then
  begin
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'PASSPORT_NUMBER';
      Title.Caption := rsPassNumber;
      Title.TitleButton := True;
      Width := 97;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'PASSPORT_REGISTRATION';
      Title.Caption := rsPassIssued;
      Title.TitleButton := True;
      Width := 97;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'BIRTHDAY';
      Title.Caption := rsPassBirthDay;
      Title.TitleButton := True;
      Width := 65;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'YEARS';
      Title.Caption := rsPassYears;
      Title.TitleButton := True;
      Width := 65;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'ADRES_REGISTR';
      Title.Caption := rsPassAdres;
      Title.TitleButton := True;
      Width := 97;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'PERSONAL_N';
      Title.Caption := rsPassPrivatNumber;
      Title.TitleButton := True;
      Width := 97;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'CONTRACT_BASIS';
      Title.Caption := rsBirthPlace;
      Title.TitleButton := True;
      Width := 97;
    end;
  end;

{$IFDEF DIGIT}
  if (Mask and clc_Decoder) <> 0 then
  begin
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'decoder_n';
      dbgCustomers.DrawMemoText := True;
      Title.Caption := rsDigitDecoder;
      Title.TitleButton := True;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'STB_N';
      dbgCustomers.DrawMemoText := True;
      Title.Caption := rsDigitSTBCAM;
      Title.TitleButton := True;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'TV_MODEL';
      dbgCustomers.DrawMemoText := True;
      Title.Caption := rsDigitTV;
      Title.TitleButton := True;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'dgt_notice';
      dbgCustomers.DrawMemoText := True;
      Title.Caption := rsDigitNotice;
      Title.TitleButton := True;
    end;

  end;
{$ENDIF}
  if (Mask and clc_Atrib) <> 0 then
  begin
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'CA_NAME';
      Title.Caption := rsAttrName;
      Title.TitleButton := True;
      Width := 70;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'CA_VALUE';
      Title.Caption := rsAttrValue;
      Title.TitleButton := True;
      Width := 70;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'CA_NOTICE';
      Title.Caption := rsAttrNotice;
      Title.TitleButton := False;
      Width := 70;
    end;
  end;

  if (Mask and clc_Koef) <> 0 then
  begin
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'factor_value';
      Title.Caption := rsKoefValue;
      Title.TitleButton := True;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'DATE_FROM';
      Title.Caption := rsKoefToD;
      Title.TitleButton := True;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'DATE_TO';
      Title.Caption := rsKoefFromD;
      Title.TitleButton := True;
    end;
  end;

{$IFDEF LAN}
  if (Mask and clc_Lan) <> 0 then
  begin
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'ip';
      Title.Caption := rsColumnIP;
      Title.TitleButton := True;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'mac';
      Title.Caption := rsColumnMAC;
      Title.TitleButton := True;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'LE_NAME';
      Title.Caption := rsColumnConnectTo;
      Title.TitleButton := True;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'LE_IP';
      Title.Caption := rsColumnConnectToIP;
      Title.TitleButton := True;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'PORT';
      Title.Caption := rsColumnConnectToPort;
      Title.TitleButton := True;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'TAG';
      Title.Caption := rsColumnLanTag;
      Title.TitleButton := True;
    end;
    with dbgCustomers.Columns.Add do
    begin
      FieldName := 'TAG_STR';
      Title.Caption := rsColumnLanTagStr;
      Title.TitleButton := True;
    end;
  end;
{$ENDIF}
end;

function TCustomersForm.GetOrderClause(grid: TCustomDBGridEh): string;
var
  s: string;
  i, J: Integer;
begin
  J := grid.SortMarkedColumns.Count;
  s := ' ';
  for i := 0 to pred(J) do
  begin
    if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'ACCOUNT_NO') then
      s := s + 'C.account_no'
    else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'STREET_NAME') then
      s := s + 'S.Street_Name||s.street_short'
    else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'FLAT_NO') then
      s := s + 'C.Flat_No'
    else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'HOUSE_NO') then
      s := s + 'H.HOUSE_NO '
    else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'ATR_LINE') then
      s := s + 'cast(cal.ATR_LINE as varchar(50))'
    else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'NOTICE') then
      s := s + 'C.NOTICE'
    else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'CUST_CODE')
    // then s := s + 'FOR_ADRES_SORT'
    then
      s := s + 'C.CUST_CODE'
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

function TCustomersForm.GenerateFilter: String;

const
  fltr_1_1 = ' (1=1) ';
  function Del_1_1(const where_sql: String): String;
  begin
    Result := ReplaceStr(where_sql, fltr_1_1 + ' and ', '');
  end;

// если скрываем абонентов, то скроем
  function AddInvisible: String;
  begin
    Result := '';
    if dmMain.SuperMode >= 0 then
    begin
      if (dsFilter['SUPERMODE']) then
        Result := ' and ( c.INVISIBLE = 1 ) '
      else if dmMain.SuperMode = 0 then
        Result := ' and ( c.INVISIBLE = 0 ) ';
    end;
  end;

  function RecordToFilter: String;
  var
    startSQL, tmpSQL, s: string;
    st: String;
    AFormatSettings: TFormatSettings;
  begin
    AFormatSettings := TFormatSettings.Create;
    AFormatSettings.DecimalSeparator := '.';
    Result := ' ((C.Valid_To > current_date) or (C.Valid_To is null)) ';
    dsCustomers.ParamByName('from_add').value := '';

    if (dsFilter['SFLTR_TYPE'] > 0) and (not dsFilter.FieldByName('SFLTR_TEXT').IsNull) then
    begin
      s := dsFilter.FieldByName('SFLTR_TEXT').AsString;
      if s <> '' then
      begin
        if (pos('%', s) > 0) or (pos('_', s) > 0) then
          startSQL := 'like'
        else
          startSQL := '=';
        s := '''' + s + '''';
        tmpSQL := '';
        case dsFilter['SFLTR_TYPE'] of
          // Договор
          1:
            tmpSQL := Format
              (' ((c.dogovor_no %s %s) or (exists(select ss.customer_id from subscr_serv ss where ss.contract %s %s and ss.customer_id = c.customer_id)))',
              [startSQL, s, startSQL, s]);
          // Лицевой
          2:
            tmpSQL := Format(' (C.ACCOUNT_NO %s %s) ', [startSQL, s]);
          // Код
          3:
            if pos(',', dsFilter.FieldByName('SFLTR_TEXT').AsString) > 0 then
            begin
              tmpSQL := dsFilter.FieldByName('SFLTR_TEXT').AsString;
              tmpSQL := '''' + ReplaceStr(tmpSQL, ',', ''',''') + '''';
              tmpSQL := Format(' (C.CUST_CODE in ( %s )) ', [tmpSQL]);
            end
            else
              tmpSQL := Format(' (C.CUST_CODE %s %s) ', [startSQL, s]);
          // Фамилия
          4:
            tmpSQL := Format(' (upper(C.SURNAME) %s upper(%s)) ', [startSQL, s]);
          // Примечание
          5:
            tmpSQL := Format(' (upper(C.notice) %s upper(%s)) ', [startSQL, s]);
          6:
            begin
              s := ReverseString(DigitsOnly(s));
              s := Copy(s, 0, 7);
              dsCustomers.ParamByName('from_add').value :=
                ' inner join CUSTOMER_CONTACTS cc on ((c.customer_id = cc.customer_id) and (cc.cc_val_reverse starting with '''
                + s + ''')) ';
              tmpSQL := '';
              Exit;
            end;
          // Список ID абонентов
          7:
            begin
              if pos(',', dsFilter.FieldByName('SFLTR_TEXT').AsString) > 0 then
              begin
                tmpSQL := dsFilter.FieldByName('SFLTR_TEXT').AsString;
                tmpSQL := Format(' (C.CUSTOMER_ID in ( %s )) ', [tmpSQL]);
              end
              else
                tmpSQL := ' (C.CUSTOMER_ID = ' + dsFilter.FieldByName('SFLTR_TEXT').AsString + ') ';
            end;
          8:
            tmpSQL := Format(' (upper(S.STREET_NAME) %s upper(%s)) ', [startSQL, s]);
          // десодер
          9:
            tmpSQL := Format
              (' (exists(select 1 from Customer_Decoders cd where cd.Customer_Id = c.customer_id and cd.Decoder_N %s %s)) ',
              [startSQL, s]);
          // IP
          10:
            tmpSQL := Format(' (exists(select 1 from Tv_Lan cd where cd.Customer_Id = c.customer_id and cd.Ip %s %s)) ',
              [startSQL, s]);
          // MAC
          11:
            tmpSQL := Format
              (' (exists(select 1 from Tv_Lan cd where cd.Customer_Id = c.customer_id and cd.MAC %s %s)) ',
              [startSQL, s]);
          // тюнер
          12:
            tmpSQL := Format
              (' (exists(select 1 from Customer_Decoders cd where cd.Customer_Id = c.customer_id and cd.Stb_N %s %s)) ',
              [startSQL, s]);
          // 13: Street_id
          // 14: house_id
          15: // ИНН/УНН
            if (pos('%', dsFilter.FieldByName('SFLTR_TEXT').AsString) > 0) or
              (pos('_', dsFilter.FieldByName('SFLTR_TEXT').AsString) > 0) then
            begin
              tmpSQL := dsFilter.FieldByName('SFLTR_TEXT').AsString;
              tmpSQL := Format(' (upper(C.Jur_Inn) like ''%s'' ) ', [tmpSQL]);
            end
            else
              tmpSQL := ' (C.Jur_Inn = ''' + dsFilter.FieldByName('SFLTR_TEXT').AsString + ''') ';
        end;

        if tmpSQL <> '' then
        begin
          Result := tmpSQL;
          Exit;
        end;
      end;
    end;

    tmpSQL := '';
    // Признак разрыва договора
    if (dsFilter['VALID_TO_SGN'] = 1) then
      if (dsFilter['VALID_TO_ON'] = 1) and (dsFilter['VALID_TO_OFF'] = 1) then
        startSQL := fltr_1_1
      else if (dsFilter['VALID_TO_OFF'] = 1) then
        startSQL := ' (C.Valid_To <= current_date) '
      else
        startSQL := ' ((C.Valid_To > current_date) or (C.Valid_To is null)) '
    else
      startSQL := fltr_1_1;

    // Фильтр по сумме долга
    if (dsFilter['CHECK_DEBT'] = 1) then
    begin
      if (not dsFilter.FieldByName('MONTH').IsNull) then
      begin
        if dsFilter['PREPAY'] then
          tmpSQL := tmpSQL + ' and ((c.Debt_Sum - coalesce(c.PREPAY,0)) '
        else
          tmpSQL := tmpSQL + ' and (c.Debt_Sum ';
        // Ошибка в том что учитывало и отключенные услуги
        // tmpSQL := tmpSQL + ' > (' + IntToStr(dsFilter['MONTH']) +
        // ' * (select sum(iif(pt.Tarif_Sum is null, t.Tarif_Sum * coalesce(k.Factor_Value, 1), pt.Tarif_Sum)) ' + rsEOL
        // + ' from Subscr_hist sh left outer join Tarif t on (t.Service_Id = sh.Serv_Id and current_date between t.Date_From and t.Date_To) '
        // + rsEOL + '  left outer join Personal_Tarif pt on (pt.Service_Id = sh.Serv_Id and pt.Customer_Id = sh.Customer_Id and current_date between pt.Date_From and pt.Date_To) '
        // + rsEOL + '  left outer join Discount_Factor k on (((k.Serv_Id = sh.Serv_Id) or (k.Serv_Id = -1)) and k.Customer_Id = sh.Customer_Id and current_date between k.Date_From and k.Date_To) '
        // + rsEOL + ' where sh.customer_id = c.customer_id))) ' + rsEOL;

        tmpSQL := tmpSQL +
          ' > coalesce((select sum(f.Fee) from Monthly_Fee f where f.Customer_Id = c.Customer_Id and f.Month_Id >=' +
          ' DateAdd(month, ' + IntToStr(-1 * (dsFilter['MONTH'] - 1)) +
          ', (current_date - extract(day from current_date) + 1))), ' + IntToStr(dsFilter['MONTH']) +
          '*(select min(t.Tarif_Sum) from services sr inner join Tarif t on (sr.Service_Id = t.Service_Id) ' +
          ' where sr.Srv_Type_Id = 0 and current_date between t.Date_From and t.Date_To)) ' + ' and c.Debt_Sum > 0 )'
      end
      else
      begin
        if (dsFilter['DEBT_SIGN'] < 6) and (not dsFilter.FieldByName('DEBT_SUM').IsNull) then
        begin
          tmpSQL := tmpSQL + ' and ((C.Debt_Sum ';
          if (dsFilter.FieldByName('DebtMode').AsInteger = 1) then
            tmpSQL := tmpSQL + ' - (select sum(f.fee) from monthly_fee f where f.customer_id = c.customer_id and ' +
              rsEOL + ' f.month_id >= (select s.var_value from settings s where s.var_name = ''CURRENT_DATE'') )' +
              rsEOL;
          tmpSQL := tmpSQL + ')';
          if (SaldoSign = 1) then
          begin
            case dsFilter['DEBT_SIGN'] of
              0:
                tmpSQL := tmpSQL + '<';
              1:
                tmpSQL := tmpSQL + '<=';
              2:
                tmpSQL := tmpSQL + '=';
              3:
                tmpSQL := tmpSQL + '>=';
              4:
                tmpSQL := tmpSQL + '>';
              5:
                tmpSQL := tmpSQL + '<>';
            else
              tmpSQL := tmpSQL + '>';
            end; // case
          end
          else
          begin
            case dsFilter['DEBT_SIGN'] of
              0:
                tmpSQL := tmpSQL + '>';
              1:
                tmpSQL := tmpSQL + '>=';
              2:
                tmpSQL := tmpSQL + '=';
              3:
                tmpSQL := tmpSQL + '<=';
              4:
                tmpSQL := tmpSQL + '<';
              5:
                tmpSQL := tmpSQL + '<>';
            else
              tmpSQL := tmpSQL + '>';
            end; // case
          end;
          tmpSQL := tmpSQL + ' ' + FloatToStr(SaldoSign * dsFilter.FieldByName('DEBT_SUM').AsFloat,
            AFormatSettings) + ')';
        end
        else
        begin
          if (Not dsFilter.FieldByName('DEBT_SUM').IsNull) and (Not dsFilter.FieldByName('DebtTo').IsNull) then
          begin
            tmpSQL := tmpSQL + ' and ((C.Debt_Sum';

            if (dsFilter.FieldByName('DebtMode').AsInteger = 1) then
              tmpSQL := tmpSQL + ' - (select sum(f.fee) from monthly_fee f where f.customer_id = c.customer_id and ' +
                rsEOL + ' f.month_id >= (select s.var_value from settings s where s.var_name = ''CURRENT_DATE'') )' +
                rsEOL;

            tmpSQL := tmpSQL + ') between ';

            if (SaldoSign = 1) then
              tmpSQL := tmpSQL + FloatToStr((SaldoSign * dsFilter.FieldByName('DEBT_SUM').AsFloat), AFormatSettings) +
                ' and ' + FloatToStr((SaldoSign * dsFilter.FieldByName('DebtTo').AsFloat), AFormatSettings) + ')'
            else
              tmpSQL := tmpSQL + FloatToStr((SaldoSign * dsFilter.FieldByName('DebtTo').AsFloat), AFormatSettings) +
                ' and ' + FloatToStr((SaldoSign * dsFilter.FieldByName('DEBT_SUM').AsFloat), AFormatSettings) + ')';
          end;
        end;
      end;
    end;

    // Условие отбора по адресу
    if (dsFilter['CHECK_ADRESS'] = 1) then
    begin
      if (not dsFilter.FieldByName('HOUSE_ID').IsNull) then
        tmpSQL := tmpSQL + Format(' and (C.House_Id = %d) ', [dsFilter.FieldByName('HOUSE_ID').AsInteger])
      else if (Not dsFilter.FieldByName('Street_Id').IsNull) then
        tmpSQL := tmpSQL + Format(' and (S.STREET_ID = %d) ', [dsFilter.FieldByName('Street_Id').AsInteger]);

      if (Not dsFilter.FieldByName('SUBAREA_ID').IsNull) then
        tmpSQL := tmpSQL + Format(' and (h.SUBAREA_ID  = %d) ', [dsFilter.FieldByName('SUBAREA_ID').AsInteger]);

      if (Not dsFilter.FieldByName('AREA_ID').IsNull) then
        tmpSQL := tmpSQL + Format(' and ( S.AREA_ID = %s) ', [dsFilter.FieldByName('AREA_ID').AsString]);

      if (not dsFilter.FieldByName('FLAT_NO').IsNull) and (dsFilter['FLAT_NO'] <> '') then
      begin
        tmpSQL := tmpSQL + Format(' and (C.FLAT_NO = ''%s'') ', [dsFilter.FieldByName('FLAT_NO').AsString]);
      end;

      if (Not dsFilter.FieldByName('ORGZ_ID').IsNull) then
      begin
        tmpSQL := tmpSQL + Format(' and ( coalesce(c.ORG_Id, h.ORG_ID) = %d ) ',
          [dsFilter.FieldByName('ORGZ_ID').AsInteger]);
      end;

      if (not dsFilter.FieldByName('WORKGROUP').IsNull) then
        tmpSQL := tmpSQL + Format(' and (h.wg_id = %d) ', [dsFilter.FieldByName('WORKGROUP').AsInteger]);

      if (not dsFilter.FieldByName('WORKAREA').IsNull) then
        tmpSQL := tmpSQL +
          Format(' and (exists(select w.wg_id from workgroups w where h.wg_id = w.wg_id and w.wa_id = %d))',
          [dsFilter.FieldByName('WORKAREA').AsInteger]);

      if (not dsFilter.FieldByName('MAINHEAD').IsNull) then
        tmpSQL := tmpSQL + Format(' and (h.HEADEND_ID = %d) ', [dsFilter.FieldByName('MAINHEAD').AsInteger]);
    end;

    // еще не подключились
    // if (dsFilter['SUBSCR_HIST_SGN'] = 1)
    // then  tmpSQL:=tmpSQL+' and (not exists (select sh.Customer_Id from Subscr_serv sh where sh.Customer_Id = C.Customer_Id))';

    // с непустым примечанием
    // if (dsFilter['NOTICE_SGN'] = 1)
    // then tmpSQL:=tmpSQL+' and (trim(coalesce(c.notice,'''')) <> '''')';

    // юр. лица
    if (dsFilter.FieldByName('JURIDICAL').AsInteger in [0, 1]) then
      tmpSQL := tmpSQL + Format(' and (c.juridical = %d) ', [dsFilter.FieldByName('JURIDICAL').AsInteger]);

    // ручное управление
    if ((not dsFilter.FieldByName('HANDCONTROL').IsNull)) then
      tmpSQL := tmpSQL + Format(' and (c.HAND_CONTROL = %d) ', [dsFilter.FieldByName('HANDCONTROL').AsInteger]);

    // установлен атрибут
    if (not dsFilter.FieldByName('CUST_ATTRIBUTE').IsNull) then
    begin
      if (not dsFilter.FieldByName('ATTRIB_VALUE').IsNull) then
        s := dsFilter.FieldByName('ATTRIB_VALUE').AsString
      else
        s := '';

      if s <> '' then
      begin
        if pos('%', s) > 0 then
          s := ' like ''' + s + ''''
        else
          s := ' = ''' + s + '''';
      end;

      tmpSQL := tmpSQL + ' and (';

      if (dsFilter.FieldByName('CUST_NOT_ATTRIBUTE').AsInteger = 1) then
        tmpSQL := tmpSQL + ' not ';

      case dsFilter.FieldByName('ATTRTYPE').AsInteger of
        37:
          begin // Домов атрибуты
            tmpSQL := tmpSQL +
              'exists (select House_Id from Houses_Attributes CA WHERE CA.House_Id = C.House_Id AND CA.O_ID =' +
              dsFilter.FieldByName('CUST_ATTRIBUTE').AsString;
            if s <> '' then
              tmpSQL := tmpSQL + ' and CA.Ha_Value ' + s;
          end;
        5:
          begin // Сетевого оборудования атрибуты
            tmpSQL := tmpSQL +
              'exists ( select O_Id from Equipment_Attributes CA inner join Tv_Lan t on (ca.Eid = t.Eq_Id) ' +
              ' WHERE t.Customer_Id = C.Customer_Id AND CA.O_ID =' + dsFilter.FieldByName('CUST_ATTRIBUTE').AsString;
            if s <> '' then
              tmpSQL := tmpSQL + ' and CA.CA_VALUE ' + s;
          end;
        6:
          begin // ТВ оборудования атрибуты
            tmpSQL := tmpSQL + ' ( 1=1 '; // Не реализовано
          end;
        39:
          begin // Узлов атрибуты
            tmpSQL := tmpSQL +
              'exists ( select O_Id from Nodes_Attributes CA inner join houseflats t on (ca.Node_Id = t.Node_Id) ' +
              ' WHERE t.House_Id = C.House_Id and t.Flat_No = c.Flat_No AND CA.O_ID = ' +
              dsFilter.FieldByName('CUST_ATTRIBUTE').AsString;
            if s <> '' then
              tmpSQL := tmpSQL + ' and CA.NA_VALUE ' + s;
          end;
        25:
          begin // Услуг атрибуты
            tmpSQL := tmpSQL +
              'exists ( select O_Id from Services_Attributes CA inner join subscr_hist t on (ca.Service_Id = t.Serv_Id) '
              + ' WHERE t.Customer_Id = C.Customer_Id and current_date between t.Date_From and t.Date_To AND CA.O_ID =  '
              + dsFilter.FieldByName('CUST_ATTRIBUTE').AsString;
            if s <> '' then
              tmpSQL := tmpSQL + ' and CA.SA_Value ' + s;
          end;
      else
        // атрибут абонента
        tmpSQL := tmpSQL +
          'exists (SELECT CA.CUSTOMER_ID FROM CUSTOMER_ATTRIBUTES CA WHERE CA.Customer_Id = C.Customer_Id AND CA.O_ID = '
          + dsFilter.FieldByName('CUST_ATTRIBUTE').AsString;
        if s <> '' then
          tmpSQL := tmpSQL + ' and CA.CA_VALUE ' + s;
      end;

      tmpSQL := tmpSQL + ' ))';
    end;

    // установлен тип файла
    if (not dsFilter.FieldByName('FILE_TYPE').IsNull) then
    begin
      tmpSQL := tmpSQL + ' and (';

      if (dsFilter.FieldByName('FILE_TYPE_EXCLUDE').AsInteger = 1) then
        tmpSQL := tmpSQL + ' not ';

      tmpSQL := tmpSQL +
        'exists (select cf.Customer_Id from Customer_Files cf where cf.Customer_Id = c.Customer_Id and cf.Cf_Type = ' +
        dsFilter.FieldByName('FILE_TYPE').AsString;

      tmpSQL := tmpSQL + ' ))';
    end;

    // имеющие скидку
    if (dsFilter['DISCOUNT_FACTOR_SGN'] = 1) then
    begin
      tmpSQL := tmpSQL + ' and (exists (select D.Customer_Id from  Discount_Factor D' +
        ' where C.Customer_Id = D.Customer_Id and D.Factor_Value <> 1';
      if (not dsFilter.FieldByName('DISCOUNT_DATE').IsNull) then
        tmpSQL := tmpSQL + ' and ''' + FormatDateTime('yyyy-mm-dd', dsFilter['DISCOUNT_DATE']) +
          ''' between d.Date_From and d.Date_To ';

      tmpSQL := tmpSQL + '))';
    end;
    // имеющие персональный тариф
    if (dsFilter['PERS_TARIF'] = 1) then
    begin
      tmpSQL := tmpSQL + ' and (exists (select D.Customer_Id from PERSONAL_TARIF D' +
        ' where C.Customer_Id = D.Customer_Id';
      if (not dsFilter.FieldByName('PERS_TARIF_DATE').IsNull) then
        tmpSQL := tmpSQL + ' and ''' + FormatDateTime('yyyy-mm-dd', dsFilter['PERS_TARIF_DATE']) +
          ''' between d.Date_From and d.Date_To ';

      tmpSQL := tmpSQL + '))';

    end;
    // дата активизации меньше даты договора
    if (dsFilter['INVALID_CONTRACT_DATE'] = 1) then
      tmpSQL := tmpSQL + ' and (C.CONTRACT_DATE > C.ACTIVIZ_DATE)';

    // повторяющиеся адреса
    if (dsFilter['DoubleAddress'] = 1) then
      tmpSQL := tmpSQL + 'and exists( select r.HOUSE_ID from customer r' + rsEOL +
        'where r.HOUSE_ID = c.HOUSE_ID and (r.VALID_TO > CURRENT_DATE) or (r.VALID_TO is null)' + rsEOL +
        'group by r.HOUSE_ID, r.FLAT_NO' + rsEOL + 'HAVING Count(*)>1 and c.FLAT_NO = r.FLAT_NO)';

    // состояние подключения
    if (dsFilter['STATE_1'] > 0) then
    begin
      // 1. Предоставлялась
      if (dsFilter['state_1'] = 1) then
      begin
        if (dsFilter['serv_id'] >= 0) then
        begin
          tmpSQL := tmpSQL + ' and (exists(select ss.customer_id from subscr_serv ss ' + ' where ss.serv_id = ' +
            dsFilter.FieldByName('serv_id').AsString;
          tmpSQL := tmpSQL + ' and c.customer_id = ss.customer_id )) ';
        end
        else if not dsFilter.FieldByName('SRVTYPES').IsNull then
        begin
          tmpSQL := tmpSQL +
            ' and (exists(select ss.customer_id from subscr_serv ss inner join services st on (ss.serv_id = st.service_id) '
            + ' where st.business_type = ' + dsFilter.FieldByName('SRVTYPES').AsString +
            ' and c.customer_id = ss.customer_id )) ';
        end
        else if dsFilter.FieldByName('SRVTYPES').IsNull then
        begin
          tmpSQL := tmpSQL +
            ' and (exists(select ss.customer_id from subscr_serv ss inner join services st on (ss.serv_id = st.service_id) '
            + ' where c.customer_id = ss.customer_id )) ';
        end;
      end;

      // 2. Подключен
      if (dsFilter['state_1'] = 2) then
      begin

        if (dsFilter['serv_id'] >= 0) then
        begin

          // tmpSQL := tmpSQL + ' and (exists(select ss.customer_id from subscr_serv ss ' +
          // ' where ss.state_sgn = 1 and ss.serv_id = ' + dsFilter.FieldByName('serv_id').AsString +
          // ' and c.customer_id = ss.customer_id )) ';

          // правильная фильтрация подключенных абонентов
          // tmpSQL := tmpSQL + ' and (exists(select ss.customer_id from Subscr_Hist ss ' +
          // ' inner join services s on (s.Service_Id = ss.Serv_Id)' + #13#10 +
          // '  where ss.Customer_Id = c.customer_id' + #13#10 +
          // '        and ss.serv_id = ' + dsFilter.FieldByName('serv_id').AsString +
          // '        and ss.Date_From <= current_date' + #13#10 +
          // '        and ((s.CALC_TYPE <> 5 and ss.date_to > dateadd(day, -1, current_date))' + #13#10 +
          // '          or (s.CALC_TYPE = 5 and ss.date_to >= dateadd(day, -1, current_date)))))';

          // и короткий вариант
          tmpSQL := tmpSQL + ' and (exists(select Srv_On from Check_Srv_Active(c.Customer_Id, ' +
            dsFilter.FieldByName('serv_id').AsString + ') where Srv_On = 1))';
        end
        else if not dsFilter.FieldByName('SRVTYPES').IsNull then
        begin
          tmpSQL := tmpSQL +
            ' and (exists(select ss.customer_id from subscr_serv ss inner join services st on (ss.serv_id = st.service_id) '
            + ' where ss.state_sgn = 1 and coalesce(st.business_type,0) = ' + dsFilter.FieldByName('SRVTYPES').AsString
            + ' and c.customer_id = ss.customer_id )) ';
        end
        else
        begin
          tmpSQL := tmpSQL +
            ' and (exists(select Srv_On from Check_Srv_Active(c.Customer_Id, null) where Srv_On = 1)) ';
        end;
      end;

      // 8. По заявлению и неуплату
      if (dsFilter['STATE_1'] = 3) or (dsFilter['STATE_1'] = 4) or (dsFilter['STATE_1'] = 8) then
      begin
        case dsFilter['STATE_1'] of
          3:
            st := ' = 5 '; // 4. Отключен за неуплату
          4:
            st := ' = 4 '; // 5. отключен по заявлению
        else
          st := ' in (5, 4) ';
        end;

        tmpSQL := tmpSQL + ' and ( exists (SELECT sh.CUSTOMER_ID' + rsEOL + ' FROM SUBSCR_HIST sh where ' +
          ' sh.DATE_TO = (select max(h.DATE_TO) FROM SUBSCR_HIST h inner join SERVICES S on (h.serv_id = s.service_id) '
          + ' where sh.CUSTOMER_ID = h.CUSTOMER_ID ';

        if (dsFilter['SERV_ID'] >= 0) then
          tmpSQL := tmpSQL + ' and h.serv_id = ' + dsFilter.FieldByName('SERV_ID').AsString
        else
        begin
          if not dsFilter.FieldByName('SRVTYPES').IsNull then
            tmpSQL := tmpSQL + ' and s.business_type = ' + dsFilter.FieldByName('SRVTYPES').AsString;
        end;

        tmpSQL := tmpSQL +
          ') and exists(select SL.CHILD from SERVICES_LINKS SL inner join SERVICES S on (S.SERVICE_ID = SL.PARENT) ' +
          ' where SL.LINK_TYPE ' + st;

        if (dsFilter['SERV_ID'] >= 0) then
          tmpSQL := tmpSQL + ' and Sl.Parent = ' + dsFilter.FieldByName('SERV_ID').AsString
        else
        begin
          if not dsFilter.FieldByName('SRVTYPES').IsNull then
            tmpSQL := tmpSQL + ' and s.business_type = ' + dsFilter.FieldByName('SRVTYPES').AsString;
        end;

        tmpSQL := tmpSQL + ' and SH.DISACT_SERV_ID = SL.CHILD) and sh.Customer_id = c.Customer_id)) ';
      end;

      // 5. Не предоставлялась
      if (dsFilter['STATE_1'] = 5) then
      begin
        if (dsFilter['serv_id'] >= 0) then
        begin
          tmpSQL := tmpSQL + ' and (not Exists(select ss.customer_id from subscr_serv ss ' + ' where ss.serv_id = ' +
            dsFilter.FieldByName('serv_id').AsString + ' and ss.Customer_id = c.Customer_id )) ';
        end
        else if not dsFilter.FieldByName('SRVTYPES').IsNull then
        begin
          tmpSQL := tmpSQL +
            ' and (not exists(select ss.customer_id from subscr_serv ss inner join services st on (ss.serv_id = st.service_id) '
            + ' where coalesce(st.business_type,0) = ' + dsFilter.FieldByName('SRVTYPES').AsString +
            ' and ss.Customer_id = c.Customer_id)) ';
        end
        else
          tmpSQL := tmpSQL +
            ' and (not exists(select ss.customer_id from subscr_serv ss where ss.Customer_id = c.Customer_id )) ';
      end;
      // 6. Автоблокировка
      if (dsFilter['STATE_1'] = 6) then
      begin
        tmpSQL := tmpSQL + ' and ( exists (select ss.Customer_Id from subscr_serv ss ' +
          '     where ss.Customer_Id = c.Customer_Id ' +
          '       and ss.State_Srv = -3 and ss.State_Date <= current_date ';

        if not dsFilter.FieldByName('serv_id').IsNull then
          tmpSQL := tmpSQL + Format(' and ss.serv_id = %d', [dsFilter.FieldByName('serv_id').AsInteger])
        else if not dsFilter.FieldByName('SRVTYPES').IsNull then
          tmpSQL := tmpSQL +
            Format(' and (exists(select si.Service_Id from services si where si.Service_Id = ss.Serv_Id and si.business_type = %s))',
            [dsFilter.FieldByName('SRVTYPES').AsString]);

        tmpSQL := tmpSQL + ') or ' +
          ' exists ( select ab.Customer_Id from subscr_hist ab where ab.Customer_Id = c.customer_id ' +
          '   and ab.Disact_Serv_Id = -3 and (ab.Date_To + 0) < current_date' +
          '   and (not exists(select o.Customer_Id from Subscr_Hist o ' +
          '      where o.Customer_Id = ab.Customer_Id and o.Serv_Id = ab.Serv_Id ' +
          '        and o.Date_From > ab.Date_To)) ';

        if not dsFilter.FieldByName('serv_id').IsNull then
          tmpSQL := tmpSQL + Format(' and ab.serv_id = %d', [dsFilter.FieldByName('serv_id').AsInteger])
        else if not dsFilter.FieldByName('SRVTYPES').IsNull then
          tmpSQL := tmpSQL +
            Format(' and (exists(select si.Service_Id from services si where si.Service_Id = ab.Serv_Id and si.business_type = %s))',
            [dsFilter.FieldByName('SRVTYPES').AsString]);
        tmpSQL := tmpSQL + ')) ';
      end;

      // 7. Снятие блокировки
      if (dsFilter['STATE_1'] = 7) then
      begin
        tmpSQL := tmpSQL + ' and (Exists(select ss.customer_id from subscr_serv ss ' +
          ' where ss.State_Srv = -2 and ss.Customer_id = c.Customer_id ';

        if not dsFilter.FieldByName('serv_id').IsNull then
          tmpSQL := tmpSQL + Format(' and ss.serv_id = %d', [dsFilter.FieldByName('serv_id').AsInteger])
        else if not dsFilter.FieldByName('SRVTYPES').IsNull then
          tmpSQL := tmpSQL + Format(' and (exists(select si.Service_Id from services si where si.business_type = %s))',
            [dsFilter.FieldByName('SRVTYPES').AsString]);

        tmpSQL := tmpSQL + ')) ';
      end;

      // 9. Подключен только к выбранной услуге
      if (dsFilter['STATE_1'] = 9) then
      begin
        if not dsFilter.FieldByName('serv_id').IsNull then
        begin
          tmpSQL := tmpSQL +
            Format(' and (%d = (select list(ss.Serv_Id) from Subscr_Serv ss where ss.State_Sgn = 1 and ss.Customer_Id = c.customer_id)) ',
            [dsFilter.FieldByName('serv_id').AsInteger]);
        end;
      end;
    end;

    if (dsFilter['PERIOD_SGN'] = 1) then
    begin

      // Заключили договор
      if ((not dsFilter.FieldByName('CONTRACT_DATE_SGN').IsNull) and (dsFilter['CONTRACT_DATE_SGN'] = 1)) then
      begin
        tmpSQL := tmpSQL + ' and (';
        if (not dsFilter.FieldByName('DATE_FROM').IsNull) and (not dsFilter.FieldByName('DATE_TO').IsNull) then
        begin
          tmpSQL := tmpSQL + GenerateBetweenDateSql('c.contract_date', dsFilter['DATE_FROM'], dsFilter['DATE_TO']) + ')'
        end;
      end;

      // Не/Отсылались письма
      if ((not dsFilter.FieldByName('LETTERS_SEND').IsNull) and (dsFilter['LETTERS_SEND'] = 1)) then
      begin
        tmpSQL := tmpSQL + ' and (';

        if ((not dsFilter.FieldByName('LETTERS_NOT_SEND').IsNull) and (dsFilter['LETTERS_NOT_SEND'] = 1)) then
          tmpSQL := tmpSQL + ' not ';

        tmpSQL := tmpSQL + ' EXISTS(select CL2.Customer_Id from CUSTLETTER CL2 where CL2.CUSTOMER_ID = C.Customer_Id ';
        if (not dsFilter.FieldByName('DATE_FROM').IsNull) and (not dsFilter.FieldByName('DATE_TO').IsNull) then
        begin
          tmpSQL := tmpSQL + ' and ' + GenerateBetweenDateSql('CL2.CustLetterDate', dsFilter['DATE_FROM'],
            dsFilter['DATE_TO'])
        end;

        if (not dsFilter.FieldByName('LETTERS_TYPE').IsNull) then
          tmpSQL := tmpSQL + ' and CL2.LetterTypeId  = ' + dsFilter.FieldByName('LETTERS_TYPE').AsString;
        tmpSQL := tmpSQL + '))'
      end;

      // Не/Отсылались сообщения
      if ((not dsFilter.FieldByName('MSG_SEND').IsNull) and (dsFilter['MSG_SEND'] = 1)) then
      begin
        tmpSQL := tmpSQL + ' and (';

        if ((not dsFilter.FieldByName('MSG_NOT').IsNull) and (dsFilter['MSG_NOT'] = 1)) then
          tmpSQL := tmpSQL + ' not ';

        tmpSQL := tmpSQL + ' EXISTS(select m.Customer_Id from Messages m where m.Customer_Id = C.Customer_Id ';
        if (not dsFilter.FieldByName('DATE_FROM').IsNull) and (not dsFilter.FieldByName('DATE_TO').IsNull) then
        begin
          tmpSQL := tmpSQL + ' and ' + GenerateBetweenDateSql('m.Send_Date', dsFilter['DATE_FROM'], dsFilter['DATE_TO'])
        end;
        tmpSQL := tmpSQL + '))'
      end;

      // Были/не были начисления
      if ((not dsFilter.FieldByName('beFee').IsNull) and (dsFilter['beFee'] > 0)) then
      begin
        tmpSQL := tmpSQL + ' and (';

        if (dsFilter['beFee'] = 2) then
          tmpSQL := tmpSQL + ' not ';

        tmpSQL := tmpSQL + ' EXISTS(select f.Customer_Id from monthly_fee f where f.Customer_Id = C.Customer_Id';
        if (not dsFilter.FieldByName('DATE_FROM').IsNull) and (not dsFilter.FieldByName('DATE_TO').IsNull) then
        begin
          tmpSQL := tmpSQL + ' and ' + GenerateBetweenDateSql('f.Month_Id', dsFilter['DATE_FROM'], dsFilter['DATE_TO'])
        end;
        tmpSQL := tmpSQL + '))'
      end;

      // День рождения. Юбилеи
      if ((not dsFilter.FieldByName('BIRTHDAY').IsNull) and (not dsFilter.FieldByName('DATE_FROM').IsNull) and
        (not dsFilter.FieldByName('DATE_TO').IsNull)) then
      begin

        if (dsFilter['BIRTHDAY'] > 0) then
        begin
          tmpSQL := tmpSQL + ' and ( (not c.Birthday is null) and (' +
            GenerateBetweenDateSql('DATEADD(YEAR, datediff(YEAR, c.Birthday, ' + GetFirebirdDate(dsFilter['DATE_FROM'])
            + '), c.Birthday)', dsFilter['DATE_FROM'], dsFilter['DATE_TO']) + '))';

          if (dsFilter['BIRTHDAY'] = 2) then
          begin
            tmpSQL := tmpSQL +
              ' and ((datediff(year, C.BIRTHDAY, dateadd(month, 1, current_date)) - (trunc(datediff(year, C.BIRTHDAY, dateadd(month, 1, current_date)) / 10) * 10) = 0) '
              + '      or (datediff(year, C.BIRTHDAY, dateadd(month, 1, current_date)) - (trunc(datediff(year, C.BIRTHDAY, dateadd(month, 1, current_date)) / 10) * 10) = 5))';
          end;
        end;

      end;

      if (not dsFilter.FieldByName('DATE_FROM').IsNull) and (not dsFilter.FieldByName('DATE_TO').IsNull) then
      begin
        // подключились
        if (dsFilter['ACT_SGN'] = 1) then
        begin
          tmpSQL := tmpSQL + ' and ( exists (SELECT sh.CUSTOMER_ID' + rsEOL + ' FROM SUBSCR_HIST sh where ' +
            ' sh.DATE_FROM = (select max(h.DATE_FROM) FROM SUBSCR_HIST h where sh.CUSTOMER_ID = h.CUSTOMER_ID';
          if (not dsFilter.FieldByName('SERV_ID').IsNull) then
            tmpSQL := tmpSQL + ' and h.serv_id = ' + dsFilter.FieldByName('SERV_ID').AsString;
          tmpSQL := tmpSQL +
            ' ) and  exists(SELECT sl.CHILD FROM SERVICES_LINKS sl where sl.CHILD = sh.ACT_SERV_ID and sl.LINK_TYPE = 2';
          if (not dsFilter.FieldByName('SERV_ID').IsNull) then
            tmpSQL := tmpSQL + ' and Sl.Parent = ' + dsFilter.FieldByName('SERV_ID').AsString;
          tmpSQL := tmpSQL + ') and  ' + GenerateBetweenDateSql('SH.Date_From', dsFilter['DATE_FROM'],
            dsFilter['DATE_TO']) + ' and sh.Customer_id = c.Customer_id))';

        end;

        // подключились повторно
        if (dsFilter['ACT_SGN'] = 2) then
        begin
          tmpSQL := tmpSQL + ' and ( exists (SELECT sh.CUSTOMER_ID' + rsEOL + ' FROM SUBSCR_HIST sh where ' +
            ' sh.DATE_FROM = (select max(h.DATE_FROM) FROM SUBSCR_HIST h where sh.CUSTOMER_ID = h.CUSTOMER_ID';
          if (not dsFilter.FieldByName('SERV_ID').IsNull) then
            tmpSQL := tmpSQL + ' and h.serv_id = ' + dsFilter.FieldByName('SERV_ID').AsString;
          tmpSQL := tmpSQL +
            ' ) and exists(SELECT sl.CHILD FROM SERVICES_LINKS sl where sl.CHILD = sh.ACT_SERV_ID and sl.LINK_TYPE = 3';
          if (not dsFilter.FieldByName('SERV_ID').IsNull) then
            tmpSQL := tmpSQL + ' and Sl.Parent = ' + dsFilter.FieldByName('SERV_ID').AsString;
          tmpSQL := tmpSQL + ') and  ' + GenerateBetweenDateSql('SH.Date_From', dsFilter['DATE_FROM'],
            dsFilter['DATE_TO']) + ' and sh.Customer_id = c.Customer_id))';
        end;

        // откл. по заявке
        if (dsFilter['ACT_SGN'] = 3) then
        begin
          tmpSQL := tmpSQL + ' and ( exists (SELECT sh.CUSTOMER_ID FROM SUBSCR_HIST sh where ' +
            ' sh.DATE_TO = (select max(h.DATE_TO) FROM SUBSCR_HIST h where sh.CUSTOMER_ID = h.CUSTOMER_ID ';
          if (not dsFilter.FieldByName('SERV_ID').IsNull) then
            tmpSQL := tmpSQL + ' and h.serv_id = ' + dsFilter.FieldByName('SERV_ID').AsString;
          tmpSQL := tmpSQL +
            ' ) and  exists(SELECT sl.CHILD FROM SERVICES_LINKS sl where sl.CHILD = sh.DISACT_SERV_ID and sl.LINK_TYPE = 4 ';
          if (not dsFilter.FieldByName('SERV_ID').IsNull) then
            tmpSQL := tmpSQL + ' and Sl.Parent = ' + dsFilter.FieldByName('SERV_ID').AsString;
          tmpSQL := tmpSQL + ' ) and  ' + GenerateBetweenDateSql('SH.Date_TO', dsFilter['DATE_FROM'],
            dsFilter['DATE_TO']) + ' and sh.Customer_id = c.Customer_id))';
        end;

        // откл. за неуплату
        if (dsFilter['ACT_SGN'] = 4) then
        begin
          tmpSQL := tmpSQL + ' and ( exists (SELECT sh.CUSTOMER_ID FROM SUBSCR_HIST sh where ' +
            ' sh.DATE_TO = (select max(h.DATE_TO) FROM SUBSCR_HIST h where sh.CUSTOMER_ID = h.CUSTOMER_ID ';
          if (not dsFilter.FieldByName('SERV_ID').IsNull) then
            tmpSQL := tmpSQL + ' and h.serv_id = ' + dsFilter.FieldByName('SERV_ID').AsString;
          tmpSQL := tmpSQL +
            ' ) and exists(SELECT sl.CHILD FROM SERVICES_LINKS sl where sl.CHILD = sh.DISACT_SERV_ID and sl.LINK_TYPE = 5 ';
          if (not dsFilter.FieldByName('SERV_ID').IsNull) then
            tmpSQL := tmpSQL + ' and Sl.Parent = ' + dsFilter.FieldByName('SERV_ID').AsString;
          tmpSQL := tmpSQL + ' ) and  ' + GenerateBetweenDateSql('SH.Date_TO', dsFilter['DATE_FROM'],
            dsFilter['DATE_TO']) + ' and sh.Customer_id = c.Customer_id))';
        end;

        // Автоблокировка
        if (dsFilter['ACT_SGN'] = 5) then
        begin
          tmpSQL := tmpSQL + ' and ( exists ( select ab.Customer_Id from subscr_hist ab ' +
            ' where ab.Customer_Id = c.customer_id and ab.Disact_Serv_Id = -3 ' +
            ' and ab.Date_To between dateadd(-1 day to cast(''' + FormatDateTime('yyyy-mm-dd', dsFilter['DATE_FROM']) +
            ''' as DATE)) ' + ' and dateadd(-1 day to cast(''' + FormatDateTime('yyyy-mm-dd', dsFilter['DATE_TO']) +
            ''' as DATE) )))';
        end;

        // Платили PAY_SGN
        case dsFilter['PAY_SGN'] of
          // Клиенты у которых были платежи за период
          1:
            tmpSQL := tmpSQL + 'and (exists ( select P.Customer_Id from Payment P ' + rsEOL +
              ' where P.Customer_Id = c.CUSTOMER_ID and ' + GenerateBetweenDateSql('P.Pay_Date', dsFilter['DATE_FROM'],
              dsFilter['DATE_TO']) + '))';
          // Клиенты у которых не были платежи за период
          2:
            tmpSQL := tmpSQL + 'and (not exists ( select P.Customer_Id from Payment P ' + rsEOL +
              ' where P.Customer_Id = c.CUSTOMER_ID and ' + GenerateBetweenDateSql('P.Pay_Date', dsFilter['DATE_FROM'],
              dsFilter['DATE_TO']) + '))';
        end;

        // была разовая услуга
        if (not dsFilter.FieldByName('single_id').IsNull) then
        begin
          tmpSQL := tmpSQL + ' and ( exists (SELECT ss.CUSTOMER_ID FROM SINGLE_SERV ss ' +
            ' where ss.CUSTOMER_ID = c.CUSTOMER_ID and ' + GenerateBetweenDateSql('ss.SERV_DATE', dsFilter['DATE_FROM'],
            dsFilter['DATE_TO']) + ' and ss.SERVICE_ID =' + dsFilter.FieldByName('single_id').AsString + ')) '
        end;
      end;
    end;

    // Отключен более Х дней
    if (not dsFilter.FieldByName('OFFDAYS').IsNull) then
    begin
      tmpSQL := tmpSQL +
        Format(' and ( not exists (select ss.Customer_Id from subscr_hist ss where ss.Date_To >= dateadd(Day, -1 * %d, current_date) and ss.CUSTOMER_ID = c.CUSTOMER_ID))',
        [dsFilter.FieldByName('OFFDAYS').AsInteger])
    end;

    // не платил более Х дней
    if (not dsFilter.FieldByName('NOTPAYDAYS').IsNull) then
    begin
      tmpSQL := tmpSQL +
        Format(' and ( not exists (select ss.Customer_Id from payment ss where ss.Pay_Date >= dateadd(Day, -1 * %d, current_date) and ss.CUSTOMER_ID = c.CUSTOMER_ID))',
        [dsFilter.FieldByName('NOTPAYDAYS').AsInteger])
    end;

    // Отключен более Х дней
    if ((not dsFilter.FieldByName('debtLow').IsNull) and (dsFilter['debtLow'])) then
    begin
      tmpSQL := tmpSQL +
        ' and (-1*c.DEBT_SUM < (select M_Tarif from Get_Tarif_Sum_Customer_Srv(c.Customer_Id, null, MONTH_FIRST_DAY(dateadd(month, 1, current_date))))) '
    end;

    // если скрываем абонентов, то скроем
    startSQL := startSQL + AddInvisible;

    Result := Del_1_1(' ( ' + startSQL + tmpSQL + ' ) ');

    if dsFilter['inversion'] then
      Result := ' NOT ' + Result;

  end;

  function ListToFilter: String;
  var
    startSQL, tmpSQL, s, t: string;
    arr: TStringArray;
    i: Integer;
    ListType: Integer;
    Quote: String;
  begin
    Result := ' ((C.Valid_To > CURRENT_DATE) or (C.Valid_To is null)) ';
    tmpSQL := '';
    startSQL := '';

    if (dsFilter.FieldByName('ListType').IsNull) and (dsFilter.FieldByName('ListValues').IsNull) then
      Exit;

    ListType := dsFilter['ListType'];

    case ListType of
      0: // 0 Лицевые счета
        Quote := '''';
      1: // 1 Код абонента
        Quote := '''';
      2: // 2 IP адрес
        Quote := '''';
      3: // 3 Карта доступа
        Quote := '''';
      4: // 4 Customer_id
        Quote := '';
      5: // 5 MAC адрес
        Quote := '''';
      6: // 6 Телефон
        Quote := '''';
    else
      // если непонятно по чем, то по лицевому
      Quote := '''';
      ListType := 0;
    end;

    s := Trim(dsFilter.FieldByName('ListValues').AsString);
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
        for i := 0 to Length(arr) - 2 do
        begin
          t := Trim(arr[i]);
          if t <> '' then
            s := t + Quote + ',' + Quote + s;
        end;
        s := s + arr[Length(arr) - 1];
      end;
      s := Quote + s + Quote;
    end
    else if s <> '' then
      s := Quote + s + Quote;

    if s <> '' then
    begin
      case ListType of
        0: // 0 Лицевые счета
          startSQL := ' (C.ACCOUNT_NO in (' + s + ')) ';
        1: // 1 Код абонента
          startSQL := ' (C.CUST_CODE in (' + s + ')) ';
        2: // 2 IP адрес
          startSQL := ' ( exists(select t.customer_id from tv_lan t where t.customer_id = c.customer_id and t.Ip in (' +
            s + '))) ';
        3: // 3 Карта доступа
          startSQL :=
            ' ( exists(select t.Customer_Id from Customer_Decoders t where t.customer_id = c.customer_id and t.Decoder_N in ('
            + s + '))) ';
        4: // 4 Customer_id
          startSQL := ' (C.Customer_id in (' + s + ')) ';
        5: // 5 MAC адрес
          startSQL := ' ( exists(select t.customer_id from tv_lan t where t.customer_id = c.customer_id and t.Mac in ('
            + s + '))) ';
        6: // 6 Телефон
          startSQL :=
            ' ( exists(select t.Customer_Id from Customer_Contacts t where t.Customer_Id = c.customer_id and t.Cc_Type < 2 and t.Cc_Value in('
            + s + '))) ';
        7: // 7 ИНН / УНН
          startSQL := ' (C.Jur_Inn in (' + s + ')) ';
      end;
    end
    else
      startSQL := fltr_1_1;

    // если скрываем абонентов, то скроем
    tmpSQL := AddInvisible;

    Result := Del_1_1(' ( ' + startSQL + tmpSQL + ' ) ');
  end;

  function SQLToFilter: String;
  var
    startSQL, tmpSQL: string;
  begin
    Result := ' ((C.Valid_To > CURRENT_DATE) or (C.Valid_To is null)) ';
    tmpSQL := '';
    // startSQL := ' c.customer_id in ( ' + dsFilter['SQL_FLTR'] + ' ) ';
    startSQL := ' (exists (select ff.customer_id from ( ' + dsFilter['SQL_FLTR'] +
      ') ff where ff.customer_id = c.customer_id) ) ';
    // если скрываем абонентов, то скроем
    tmpSQL := AddInvisible;

    Result := Del_1_1(' ( ' + startSQL + tmpSQL + ' ) ');
  end;

var
  whereStr: String;
  ListSql: String;
  default: string;
  fidx: Integer;

begin
  default := const_default_filter;
  if dmMain.SuperMode = 0 then
    default := default +' and ( c.INVISIBLE = 0 ) ';

  Result := default;
  whereStr := '';

  if (dsFilter.RecordCount = 0) or (not actEnableFilter.Checked) then
    Exit;
  srcCustomer.DataSet.DisableControls;

  try
    dsFilter.First;

    if (not dsFilter.FieldByName('ListValues').IsNull) then
      ListSql := ' ( ' + ListToFilter + ' ) ';

    if (not dsFilter.FieldByName('SQL_FLTR').IsNull) then
    begin
      if not ListSql.IsEmpty then
        ListSql := ListSql + ' and ';
      ListSql := ListSql + ' ( ' + SQLToFilter + ' ) ';
    end;

    while not dsFilter.Eof do
    begin
      whereStr := whereStr + ' ( ' + RecordToFilter + ' ) ';
      // проверим, если ограничение одной записи и фильтр по квартире. то скинем ограничение

      if (dmMain.AllowedAction(rght_Customer_Only_ONE)) then
      begin
        if ((not dsFilter.FieldByName('FLAT_NO').IsNull) and (dsFilter['CHECK_ADRESS'] = 1)) then
        begin
          fidx := dsCustomers.SelectSQL.IndexOf(cst_OneRecord);
          if (fidx = 1) then
          begin
            if dsCustomers.Active then
              dsCustomers.Close;
            dsCustomers.SelectSQL.Delete(fidx);
          end;
        end
        else
        begin
          if (dmMain.AllowedAction(rght_Customer_Only_ONE)) then
          begin
            fidx := dsCustomers.SelectSQL.IndexOf(cst_OneRecord);
            if (fidx = -1) then
            begin
              if dsCustomers.Active then
                dsCustomers.Close;
              dsCustomers.SelectSQL.Insert(1, cst_OneRecord);
            end;
          end;
        end;
      end;
      dsFilter.next;
      if not dsFilter.Eof then
        if dsFilter['next_condition'] = 0 then
          whereStr := whereStr + ' OR '
        else
          whereStr := whereStr + ' AND '
    end;

    if (not ListSql.IsEmpty) and (not whereStr.IsEmpty) then
      whereStr := whereStr + ' and ' + ListSql;

  except
    whereStr := default;
    ShowMessage(rsErrorSetFilter);
  end;

  // Восстановим сортировку
  // dbgCustomerSortMarkingChanged(dbgCustomers);

  // LogEvent('Customer', 'ФИЛЬТР', whereStr);
  Result := whereStr;
  srcCustomer.DataSet.EnableControls;

end;

procedure TCustomersForm.SetDefaultFilter;
var
  f: string;
  sa: TStringArray;
begin
  dsFilter.Close;
  dsFilter.Open;
  dsFilter.EmptyTable;
  if (FFilterField > 0) and (FFilterValue <> '') then
  begin
    // 13: Street_id  // 14: house_id
    if (FFilterField = 13) or (FFilterField = 14) then
    begin
      sa := Explode('~', FFilterValue);
      dsFilter.Insert;
      dsFilter['CHECK_ADRESS'] := 1;
      dsFilter['Street_Id'] := StrToInt(sa[0]);
      if (FFilterField = 14) and (Length(sa) > 1) then
        dsFilter['HOUSE_ID'] := StrToInt(sa[1]);
      dsFilter.Post;
    end
    else if FFilterField > 99 then
    begin
      {
        100 Лицевые счета
        101 Код абонента
        102 IP адрес
        103 Карта доступа
        104 Customer_id
        105 MAC адрес
        106 Телефон
      }
      if (dsFilter.FieldByName('ListType').IsNull) and (dsFilter.FieldByName('ListValues').IsNull) then
        dsFilter.Insert;
      dsFilter['ListType'] := FFilterField - 100;
      dsFilter['ListValues'] := FFilterValue;
      dsFilter.Post;
    end
    else if (FFilterField < 13) or (FFilterField > 14) then
    begin
      { 1: Договор  2: Лицевой 3: Код 4: Фамилия 5: Примечание 6: телефон 7: Список CUSTOMER_ID }
      dsFilter.Insert;
      dsFilter['SFLTR_TYPE'] := FFilterField;
      dsFilter['SFLTR_TEXT'] := FFilterValue;
      dsFilter.Post;
    end;

  end
  else
  begin
    f := A4MainForm.GetUserFilterFolder + 'default.jcf'; // новый формат в json
    if FileExists(f) then
    begin
      if dsFilter.State in [dsEdit, dsInsert] then
        dsFilter.Post;
      DatasetFromJson(dsFilter, f);
    end
    else
    begin
      f := A4MainForm.GetUserFilterFolder + 'default.ftr'; // старый формат
      if FileExists(f) then
      begin
        if dsFilter.State in [dsEdit, dsInsert] then
          dsFilter.Post;
        DatasetFromINI(dsFilter, f);
      end
      else
      begin
        dsFilter.Append;
        dsFilter.Post;
      end;
    end;
  end;
  if dsFilter.RecordCount > 0 then
    actEnableFilter.Checked := True;
end;

procedure TCustomersForm.InitSecurity;
var
  notEmptyDS: Boolean;
begin
  if dsCustomers.Active then
    notEmptyDS := (dsCustomers.RecordCount > 0)
  else
    notEmptyDS := True;

  FullAccess := (dmMain.AllowedAction(rght_Customer_full));
  ChangeHistory := (dmMain.AllowedAction(rght_Customer_History));
  FVisiblePassport := (dmMain.AllowedAction(rght_Customer_add)) or (dmMain.AllowedAction(rght_Customer_edit)) or
    FullAccess;

  // Экспорт информации
  actSaveAs.Visible := notEmptyDS and ((dmMain.AllowedAction(rght_Export)));
  miExport.Visible := notEmptyDS and ((dmMain.AllowedAction(rght_Export)));

  actCustomerDelete.Enabled := notEmptyDS and (not dmMain.InStrictMode) and
    (dmMain.AllowedAction(rght_Customer_del) or FullAccess);

  actCustomerEdit.Enabled := notEmptyDS and (dmMain.AllowedAction(rght_Customer_edit) or FullAccess);
  actCustomerAdd.Enabled := dmMain.AllowedAction(rght_Customer_add) or FullAccess;
  ActCancelContract.Enabled := notEmptyDS and (dmMain.AllowedAction(rght_Customer_EditSrv) or FullAccess);
  actRequest.Enabled := notEmptyDS and (dmMain.AllowedAction(rght_Request_Add) or
    dmMain.AllowedAction(rght_Request_Full));
  ActAddPayment.Enabled := notEmptyDS and (dmMain.AllowedAction(rght_Pays_add) or dmMain.AllowedAction(rght_Pays_full)
    or dmMain.AllowedAction(rght_Pays_AddToday));
  actPrepay.Enabled := notEmptyDS and (dmMain.AllowedAction(rght_Pays_add) or dmMain.AllowedAction(rght_Pays_full) or
    dmMain.AllowedAction(rght_Pays_AddPromis));

  // Обращения
  actRecAdd.Enabled := notEmptyDS and ((dmMain.AllowedAction(rght_Recourses_add)) or FullAccess);
  actSendMessages.Visible := notEmptyDS and ((dmMain.AllowedAction(rght_Messages_add)) or FullAccess);

  actNPS.Visible := notEmptyDS and ((dmMain.AllowedAction(rght_Customer_NPS)) or FullAccess);
  actResetpassword.Visible := notEmptyDS and ((dmMain.AllowedAction(rght_Customer_PSWD)) or FullAccess);

  pnlForms.Enabled := notEmptyDS;
  FCheckPassport := (dmMain.GetSettingsValue('KEY_MVD') <> '');
  actCheckPassport.Visible := FCheckPassport;

  actOrderTP.Visible := dmMain.AllowedAction(rght_OrdersTP_full) or dmMain.AllowedAction(rght_OrdersTP_add);
end;

procedure TCustomersForm.InitExportPopUpMenus;
var
  i: Integer;
  s: string;
begin
  while miExport.Count > 0 do
    miExport.Items[0].Free;

  with TpFIBQuery.Create(Nil) do
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := 'select NAME from EXPORTTYPES order by NAME';
      Transaction.StartTransaction;
      ExecQuery;
      i := 1;
      while not Eof do
      begin
        s := FieldByName('NAME').value;
        miExport.Add(NewItem(s, 0, False, True, miExportClick, 0, 'mie' + IntToStr(i)));
        next;
        i := i + 1;
      end;
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  miExport.Add(NewLine);
  miExport.Add(NewItem(rsProfileExportSettings, 0, False, True, miExportSettingsClick, 0, 'mieExport'));
end;

procedure TCustomersForm.InitPrintPopUpMenus;
var
  i: Integer;
  s: string;
  mi: TMenuItem;
begin
  with TpFIBQuery.Create(Nil) do
    try
      // ActBalanceExecute
      // ActPrintGridExecute
      pmSelectPrintDoc.Items.Add(NewItem(ActPrintGrid.Caption, 0, False, True, ActPrintGrid.OnExecute, 0,
        'miRPPrintGrid'));

      pmSelectPrintDoc.Items.Add(NewItem('-', 0, False, True, nil, 0, 'miRPsprt0'));

      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Clear;
      sql.Add(' select LETTERTYPEID, Lettertypedescr, Filename, coalesce(Recordindb, 0) Recordindb ');
      sql.Add(' from LETTERTYPE l inner join(select REPLACE(upper(FULL_PATH),''.FR3'','''') FULL_PATH from Get_All_Reports) r ');
      sql.Add(' on (r.FULL_PATH = REPLACE(upper(l.Filename),''.FR3'','''')) ');
      sql.Add(' where coalesce(FOR_FORM, 0) = 0 order by Lettertypedescr ');
      Transaction.StartTransaction;
      ExecQuery;
      i := 1;
      while not Eof do
      begin
        s := FieldByName('LETTERTYPEDESCR').value;
        mi := NewItem(s, 0, False, True, miPrintReportClick, 0, 'miRP' + IntToStr(i));
        mi.Tag := FieldByName('LETTERTYPEID').value;
        mi.ImageIndex := FieldByName('RECORDINDB').value;
        mi.Hint := FieldByName('FILENAME').value;
        pmSelectPrintDoc.Items.Add(mi);
        // miPrint.Add(mi);
        next;
        i := i + 1;
      end;
      Close;
      Transaction.Commit;

      pmSelectPrintDoc.Items.Add(NewItem('-', 0, False, True, nil, 0, 'miRPsprt1'));
      pmSelectPrintDoc.Items.Add(NewItem(ActBalance.Caption, 0, False, True, ActBalance.OnExecute, 0, 'miBalance'));

    finally
      Free;
    end;
end;

procedure TCustomersForm.dsCustomersAfterOpen(DataSet: TDataSet);
begin
  if Assigned(FLastPage) then
  begin
    FLastPage.CloseData;
    FLastPage.OpenData;
  end;

  InitSecurity;
end;

procedure TCustomersForm.dsCustomers_Refresh(const full: Boolean = False);
begin
  if full then
    dsCustomers.CloseOpen(True)
  else
    RefreshCurrentRecord(Self);
end;

procedure TCustomersForm.dsFilterNewRecord(DataSet: TDataSet);
begin
  DataSet['CHECK_ADRESS'] := 0;
  DataSet['DEBT_SUM'] := 0;
  DataSet['CHECK_DEBT'] := 0;
  DataSet['DEBT_SIGN'] := 4;
  DataSet['STATE_1'] := 0;
  DataSet['PAYSOURCE_ID'] := 1;
  DataSet['NOTICE_SGN'] := 0;
  DataSet['SUBSCR_HIST_SGN'] := 0;
  DataSet['DISCOUNT_FACTOR_SGN'] := 0;
  DataSet['PERIOD_SGN'] := 0;
  DataSet['ACT_SGN'] := 0;
  DataSet['PAY_SGN'] := 0;
  DataSet['VALID_TO_SGN'] := 0;
  DataSet['VALID_TO_ON'] := 0;
  DataSet['VALID_TO_OFF'] := 0;
  DataSet['INVALID_CONTRACT_DATE'] := 0;
  DataSet['CONTRACT_DATE_SGN'] := 0;
  DataSet['DoubleAddress'] := 0;
  DataSet['DebtMode'] := 0;
  DataSet['DebtTo'] := 0;
  DataSet['LETTERS_SEND'] := 0;
  DataSet['LETTERS_NOT_SEND'] := 0;
  DataSet['CUST_NOT_ATTRIBUTE'] := 0; // содержит атрибут
  DataSet['JURIDICAL'] := -1; // юр. лица
  DataSet['inversion'] := False; // инверсия фильтра т.е. добавляем not
  DataSet['next_condition'] := 0; // следующее условие AND/OR
  DataSet['SUPERMODE'] := False;
  DataSet['PREPAY'] := False;
  DataSet['EXTENDED_FLTR'] := 0;
  DataSet.FieldByName('Accounts').Clear;
  DataSet.FieldByName('SQL_FLTR').Clear;
  DataSet['SFLTR_TYPE'] := 0;
  DataSet['SRVTYPES'] := 0;
  DataSet['MSG_NOT'] := 0;
  DataSet['MSG_SEND'] := 0;
  DataSet['PERS_TARIF'] := 0;
  DataSet['ATTRTYPE'] := 4;
end;

procedure TCustomersForm.UpdateInfoPanel;
begin
  //
end;

procedure TCustomersForm.actRecAddExecute(Sender: TObject);
var
  s, h: Integer;
  f: String;
begin
  if (not dmMain.AllowedAction(rght_Recourses_add)) then
    Exit;

  if not dsCustomers.FieldByName('CUSTOMER_ID').IsNull then
    EditRecourse(dsCustomers.FieldByName('CUSTOMER_ID').AsInteger)
  else
  begin
    if not dsFilter.FieldByName('STREET_ID').IsNull then
      s := dsFilter['STREET_ID']
    else
      s := -1;
    if not dsFilter.FieldByName('House_ID').IsNull then
      h := dsFilter['House_id']
    else
      h := -1;
    if not dsFilter.FieldByName('FLAT_NO').IsNull then
      f := dsFilter['FLAT_NO']
    else
      f := '';

    EditRecourseByAdres(s, h, f);
  end;
end;

procedure TCustomersForm.actRecAddWAdresExecute(Sender: TObject);
begin
  if (not dmMain.AllowedAction(rght_Recourses_add)) then
    Exit;
  EditRecourse(-1);
end;

procedure TCustomersForm.miExportClick(Sender: TObject);
var
  FILE_DIR, FILENAME, FILE_HEAD, FILE_BODY, FILE_FOOTER: string;
  s: string;
  FILE_FORMAT, FILE_CODEPAGE: Integer;
  bm: TBookMark;
  Cur: TCursor;
  DEC_SEP: Char;
begin
  //
  if not(Sender is TMenuItem) then
    Exit;

  Cur := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  bm := dsCustomers.GetBookmark;

  s := (Sender as TMenuItem).Caption;
  DEC_SEP := '.';
  with TpFIBQuery.Create(Nil) do
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      s := ReplaceStr(s, '&', '');
      s := 'select * from EXPORTTYPES where NAME = ''' + s + '''';
      sql.Text := s;
      Transaction.StartTransaction;
      ExecQuery;
      FILE_FORMAT := FieldByName('FILE_FORMAT').AsInteger;
      FILE_CODEPAGE := FieldByName('FILE_CODEPAGE').AsInteger;
      FILE_DIR := FieldByName('FILE_DIR').AsString;
      FILENAME := FieldByName('FILENAME').AsString;
      FILE_HEAD := FieldByName('FILE_HEAD').AsString;
      FILE_BODY := FieldByName('FILE_BODY').AsString;
      FILE_FOOTER := FieldByName('FILE_FOOTER').AsString;
      if not FieldByName('SEPARATOR').IsNull then
      begin
        s := FieldByName('SEPARATOR').AsString;
        DEC_SEP := s[1];
      end;

      Close;
      Transaction.Commit;
    finally
      Free;
    end;

  FILENAME := ReplaceStr(FILENAME, rsFldMonth, FormatDateTime('mm', NOW()));
  FILENAME := ReplaceStr(FILENAME, rsFldCurrentYear, FormatDateTime('yyyy', NOW()));
  FILENAME := ReplaceStr(FILENAME, rsFldCurrentDay, FormatDateTime('dd', NOW()));
  FILENAME := ReplaceStr(FILENAME, rsFldCurrentTime, FormatDateTime('hhmmss', NOW()));
  if FILE_FORMAT = 0 then
    ExportToTXT(FILE_DIR, FILENAME, FILE_HEAD, FILE_BODY, FILE_FOOTER, FILE_CODEPAGE, DEC_SEP)
  else
    ExportToDBF(FILE_DIR, FILENAME, FILE_BODY, FILE_CODEPAGE);

  dsCustomers.GotoBookmark(bm);
  Screen.Cursor := Cur;
end;

procedure TCustomersForm.miExportSettingsClick(Sender: TObject);
begin
  with TExportSettingsForm.Create(Application) do
    try
      ShowModal;
      InitExportPopUpMenus;
    finally
      Free;
    end;
end;

procedure TCustomersForm.ExportToDBF(const FILE_DIR, FILENAME, FILE_BODY: string; FILE_CODEPAGE: Integer);
var
  dbf: TVKSmartDBF;
  s: string;
  i, v: Integer;
  fldcount: Integer;
  sum: Currency;
  lines, l: TStringArray;
  ar_data: TStringArray;
begin

  if FILENAME = '' then
    s := 'EXPORT.DBF'
  else
    s := FILENAME;

  if FILE_DIR = '' then
    s := ExtractFilePath(Application.ExeName) + '\' + s
  else
    s := FILE_DIR + '\' + s;
  s := ReplaceStr(s, '\\', '\');
  fldcount := 0;
  dbf := TVKSmartDBF.Create(Self);
  try
    dbf.DBFFileName := AnsiString(s);
    dbf.DbfVersion := xBaseIV;
    dbf.LobBlockSize := 512;
    dbf.AccessMode.AccessMode := 18;
    dbf.OEM := (FILE_CODEPAGE = 0);
    lines := Explode(#10, FILE_BODY);

    for i := 0 to Length(lines) - 1 do
    begin
      s := Trim(lines[i]);
      l := Explode('&', s);
      if Length(l) > 4 then
      begin
        fldcount := fldcount + 1;
        SetLength(ar_data, fldcount);
        ar_data[fldcount - 1] := l[0];
        with dbf.DBFFieldDefs.Add as TVKDBFFieldDef do
        begin
          Name := l[1];
          field_type := AnsiChar(Ord(l[2][1]));
          FieldFlag.FieldFlag := 0;
          dec := 0;
          len := 0;
          case field_type of
            'C':
              if TryStrToInt(l[3], v) then
                len := v;
            'N':
              begin
                if TryStrToInt(l[3], v) then
                  len := v;
                if TryStrToInt(l[4], v) then
                  dec := v;
              end;
          end;

        end;
      end;
    end;

    try
      dbf.CreateTable;

      dbf.Open;
      dsCustomers.DisableControls;
      dsCustomers.First;

      sum := 0;
      while not dsCustomers.Eof do
      begin
        dbf.Append;
        for i := 0 to fldcount - 1 do
        begin
          s := ar_data[i];
          s := ReplaceFields(s);
          dbf.Fields[i].AsString := s;
        end;
        dbf.Post;
        sum := sum + dsCustomers.FieldByName('DEBT_SUM').AsCurrency;
        dsCustomers.next;
      end;
      dbf.Close;
      dsCustomers.EnableControls
    except
      on e: Exception do
      begin
        ShowMessage(e.Message);
      end;
    end;
  finally
    freeAndNil(dbf);
  end;
end;

procedure TCustomersForm.ExportToTXT(const FILE_DIR, FILENAME, FILE_HEAD, FILE_BODY, FILE_FOOTER: string;
  FILE_CODEPAGE: Integer; const DEC_SEP: Char);
var
  body: TStrings;
  s: string;
  Count: Integer;
  sum: Currency;
  s_dolg: Currency;
  last_day: string;
  AYear, AMonth, ADay: Word;
  fs: TFormatSettings;
  Encoding: TEncoding;
begin

  fs.DecimalSeparator := DEC_SEP;

  dsCustomers.DisableControls;
  dsCustomers.First;
  body := TStringList.Create;
  try
    sum := 0;
    s_dolg := 0;
    Count := 0;
    DecodeDate(NOW(), AYear, AMonth, ADay);
    ADay := DaysInAMonth(AYear, AMonth);
    last_day := IntToStr(ADay);
    while not dsCustomers.Eof do
    begin
      s := FILE_BODY;
      s := FieldsToStr(s, DEC_SEP);
      // if FILE_CODEPAGE = 0
      // then s := StrToOem(AnsiString(s));
      body.Add(s);
      sum := sum + dsCustomers.FieldByName('DEBT_SUM').AsCurrency;
      if dsCustomers.FieldByName('DEBT_SUM').AsCurrency < 0 then
        s_dolg := s_dolg + -1 * dsCustomers.FieldByName('DEBT_SUM').AsCurrency;
      Count := Count + 1;
      dsCustomers.next;
    end;

    s := FILE_HEAD;
    if s <> '' then
    begin
      s := ReplaceStr(s, rsFldCurrentDay, FormatDateTime('dd', NOW()));
      s := ReplaceStr(s, rsFldMonth, FormatDateTime('mm', NOW()));
      s := ReplaceStr(s, rsFldCurrentYear, FormatDateTime('yyyy', NOW()));
      s := ReplaceStr(s, rsFldTOTAL, FloatToStr(-1 * sum, fs));
      s := ReplaceStr(s, rsFldTOTAL100, FloatToStr(sum, fs));
      s := ReplaceStr(s, rsFldRecCOUNT, IntToStr(Count));
      s := ReplaceStr(s, rsFldDaysOfMonth, last_day);
      // if FILE_CODEPAGE = 0
      // then s := StrToOem(AnsiString(s));
      body.Insert(0, s);
    end;
    s := FILE_FOOTER;
    if s <> '' then
    begin
      s := ReplaceStr(s, rsFldCurrentDay, FormatDateTime('dd', NOW()));
      s := ReplaceStr(s, rsFldMonth, FormatDateTime('mm', NOW()));
      s := ReplaceStr(s, rsFldCurrentYear, FormatDateTime('yyyy', NOW()));
      s := ReplaceStr(s, rsFldTOTAL, FloatToStr(s_dolg));
      s := ReplaceStr(s, rsFldTOTAL100, FloatToStr(sum));
      s := ReplaceStr(s, rsFldRecCOUNT, IntToStr(Count));
      s := ReplaceStr(s, rsFldDaysOfMonth, last_day);
      // if FILE_CODEPAGE = 0
      // then s := StrToOem(AnsiString(s));
      body.Add(s);
    end;

    if FILENAME = '' then
      s := 'EXPORT.TXT'
    else
      s := FILENAME;

    if FILE_DIR = '' then
      s := ExtractFilePath(Application.ExeName) + '\' + s
    else
    begin
      if not System.SysUtils.DirectoryExists(FILE_DIR) then
        System.SysUtils.ForceDirectories(FILE_DIR);
      s := FILE_DIR + '\' + s;
    end;
    s := ReplaceStr(s, '\\', '\');
    case FILE_CODEPAGE of
      0:
        begin
          Encoding := TEncoding.GetEncoding(GetOEMCP);
          body.SaveToFile(s, Encoding);
        end;
      2:
        body.SaveToFile(s, TEncoding.UTF8);
    else
      body.SaveToFile(s, TEncoding.ANSI);
    end;
  finally
    freeAndNil(body);
  end;
  dsCustomers.EnableControls
end;

function TCustomersForm.FieldsToStr(const str: string; const DEC_SEP: Char): string;
var
  s, last_day: string;
  AYear, AMonth, ADay: Word;
  fs: TFormatSettings;
  i, perc, form_perc: Integer;
  need: Double;

begin
  s := str;
  Result := s;
  if str = '' then
    Exit;

  fs.DecimalSeparator := DEC_SEP;
  DecodeDate(NOW(), AYear, AMonth, ADay);
  ADay := DaysInAMonth(AYear, AMonth);
  last_day := IntToStr(ADay);
  // fs.DecimalSeparator := '.';
  with dsCustomers do
  begin
    s := ReplaceStr(s, rsFldACCOUNT, FieldByName('ACCOUNT_NO').AsString);
    s := ReplaceStr(s, rsFldContract, FieldByName('DOGOVOR_NO').AsString);
    s := ReplaceStr(s, rsFldSaldo, FloatToStr(FieldByName('DEBT_SUM').AsFloat, fs));
    s := ReplaceStr(s, rsFldBalance, FloatToStr(-1 * FieldByName('DEBT_SUM').AsFloat, fs));
    s := ReplaceStr(s, rsFldSURNAME, FieldByName('SURNAME').AsString);
    s := ReplaceStr(s, rsFldFIRSTNAME, FieldByName('FIRSTNAME').AsString);
    s := ReplaceStr(s, rsFldMiddleName, FieldByName('MIDLENAME').AsString);
    s := ReplaceStr(s, rsFldINITIALS, FieldByName('INITIALS').AsString);
    s := ReplaceStr(s, rsFldSTREET, FieldByName('STREET_NAME').AsString);
    s := ReplaceStr(s, rsFldStreetShort, FieldByName('STREET_SHORT').AsString);
    s := ReplaceStr(s, rsFldHouse, FieldByName('HOUSE_NO').AsString);
    s := ReplaceStr(s, rsFldFlat, FieldByName('FLAT_NO').AsString);
    s := ReplaceStr(s, rsFldPHONE, FieldByName('PHONE_NO').AsString);
    s := ReplaceStr(s, rsFldMobile, FieldByName('MOBILE_PHONE').AsString);
    s := ReplaceStr(s, rsFldPassportN, FieldByName('PASSPORT_NUMBER').AsString);
    s := ReplaceStr(s, rsFldPASSPORTDATE, FieldByName('PASSPORT_REGISTRATION').AsString);
    s := ReplaceStr(s, rsFldEmail, FieldByName('EMAIL').AsString);
    s := ReplaceStr(s, rsFldSecret, FieldByName('SECRET').AsString);
    s := ReplaceStr(s, rsFldCurrentDay, FormatDateTime('dd', NOW()));
    s := ReplaceStr(s, rsFldDaysOfMonth, last_day);
    s := ReplaceStr(s, rsFldMonth, FormatDateTime('mm', NOW()));
    s := ReplaceStr(s, rsFldCurrentYear, FormatDateTime('yyyy', NOW()));

    if dsCustomers.FieldExist('MonPay', i) then
    begin
      // выведем тариф на услуги в месяц. и сумму доплаты
      if not FieldByName('MonPay').IsNull then
      begin
        form_perc := 2;
        need := FieldByName('MonPay').AsFloat;
        perc := Trunc(Frac(need) * 100);
        if perc = 0 then
          form_perc := 0
        else
          form_perc := 2;

        s := ReplaceStr(s, rsFldMonthFee, FloatToStrF(need, ffFixed, 8, form_perc, fs));
        need := need + FieldByName('DEBT_SUM').AsFloat;
        if (need < 0) then
          need := 0;
        perc := Trunc(Frac(need) * 100);
        if perc = 0 then
          form_perc := 0
        else
          form_perc := 2;
        s := ReplaceStr(s, rsFldMonthNeed, FloatToStrF(need, ffFixed, 8, form_perc, fs));
      end
      else
      begin
        s := ReplaceStr(s, rsFldMonthNeed, '');
        s := ReplaceStr(s, rsFldMonthFee, '');
      end;
    end
    else
    begin
      s := ReplaceStr(s, rsFldMonthNeed, '');
      s := ReplaceStr(s, rsFldMonthFee, '');
    end;
  end;
  Result := s;
end;

procedure TCustomersForm.AddPhoneForCustomer(const phone: string);
var
  phtp: Integer;
begin
  if (MessageDlg(Format(rsAddPhone, [phone, dsCustomers.FieldByName('STREET_NAME').AsString,
    dsCustomers.FieldByName('HOUSE_NO').AsString, dsCustomers.FieldByName('Flat_NO').AsString]), mtConfirmation,
    [mbYes, mbNo], 0) = mrYes) then
  begin
    phtp := 0; // обычный телефонж
    if (Length(phone) > 7) and (Copy(phone, 0, 1) <> '0') then
      phtp := 1; // мобильник телефонж

    with TpFIBQuery.Create(Self) do
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;

        sql.Text :=
          'INSERT INTO CUSTOMER_CONTACTS(CUSTOMER_ID, CC_VALUE, CC_TYPE) VALUES(:CUSTOMER_ID, :CC_VALUE, :CC_TYPE)';
        ParamByName('CUSTOMER_ID').value := dsCustomers['customer_id'];
        ParamByName('CC_VALUE').value := phone;
        ParamByName('CC_TYPE').value := phtp;
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;
  end;
end;

procedure TCustomersForm.SetFilter(const FilterFIELD: Integer; const FilterVALUE: string; var FindResult: Boolean);
var
  cr: TCursor;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    FFilterField := FilterFIELD;
    FFilterValue := FilterVALUE;
    SetDefaultFilter;
    dsCustomers.Close;
    dsCustomers.ParamByName('Filter').value := GenerateFilter;
    dsCustomers.filter := '';
    dsCustomers.Filtered := False;
    OpenDataSet;
  finally
    Screen.Cursor := cr;
  end;
  if dsCustomers.RecordCount = 0 then
  begin
    FindResult := False;
    actSetFilterNewExecute(Self);
  end
  else
    FindResult := True;
end;

procedure TCustomersForm.LoadReportBody(const fReport_ID: Integer);
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
        frxReport.FILENAME := dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString;
        Caption := frxReport.FILENAME;
      finally
        Stream.Free;
      end;
    end;
  finally
    dmMain.fdsLoadReport.Close;
  end;
end;

procedure TCustomersForm.AddReport(const r_id: Integer; const variable: string; const value: Variant;
  const AsNew: Boolean = False);
var
  vi: Integer;
begin
  LoadReportBody(r_id);
  vi := frxReport.Variables.IndexOf(variable);
  if vi > 0 then
    frxReport.Variables[variable] := value;

  frxReport.PrepareReport(AsNew);
end;

procedure TCustomersForm.RefreshRequestsList(aRequest: Integer = -1; aCustomer: Integer = -1);
var
  i, rq_id, ri: Integer;
  aAll: Boolean;
  Save_Cursor: TCursor;
  cmr: Integer;
  rqList: TStrings;
  PrintForm: string;
  FirstReport: Boolean;
begin
  // Если заявку добавили
  if aRequest > 0 then
  begin
    if (dbgCustomers.SelectedRows.Count > 0) then
    begin

      aAll := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);

      if aAll then
      begin
        rqList := TStringList.Create;
        try
          Save_Cursor := Screen.Cursor;
          Screen.Cursor := crHourGlass; { Show hourglass cursor }
          with TpFIBQuery.Create(Nil) do
          begin
            try
              Database := dmMain.dbTV;
              Transaction := dmMain.trWriteQ;
              sql.Text := 'select REQUEST_ID from DUBLICATE_REQUEST(:RQ_ID, :CUSTOMER_ID)';
              for i := 0 to dbgCustomers.SelectedRows.Count - 1 do
              begin
                dbgCustomers.DataSource.DataSet.Bookmark := dbgCustomers.SelectedRows[i];
                cmr := dbgCustomers.DataSource.DataSet['CUSTOMER_ID'];
                // Если этот абонент не тот которому уже добавили заявку, то продубоируем
                if cmr <> aCustomer then
                begin
                  // dmMain.dbTV.Execute(IntToStr(cmr) + ')');
                  ParamByName('RQ_ID').AsInteger := aRequest;
                  ParamByName('CUSTOMER_ID').AsInteger := cmr;
                  Transaction.StartTransaction;
                  ExecQuery;
                  rqList.Add(FieldByName('REQUEST_ID').AsString);
                  Transaction.Commit;
                end;
              end;
            finally
              Free;
            end;
          end;

          if not(TryStrToInt(dmMain.GetIniValue('PRINTREQ'), i)) then
            i := 0;

          if (i = 1) then
          begin
            FirstReport := True;
            for i := 0 to rqList.Count - 1 do
            begin
              rq_id := StrToInt(rqList[i]);
              with TpFIBQuery.Create(Nil) do
              begin
                try
                  Database := dmMain.dbTV;
                  Transaction := dmMain.trReadQ;
                  sql.Text := 'select coalesce(rt.rt_printform,'''') as printform ' +
                    'from request_types rt inner join request r on (rt.rt_id = r.rq_type) where r.rq_id = :RQ_ID';
                  ParamByName('RQ_ID').AsInteger := rq_id;
                  Transaction.StartTransaction;
                  ExecQuery;
                  PrintForm := FieldByName('printform').AsString;
                  Close;
                  Transaction.Commit;
                finally
                  Free;
                end;
              end;

              ri := dmMain.GET_ID_REPORT_BY_PATH(PrintForm);
              if ri >= 0 then
              begin
                AddReport(ri, 'REQUEST', rq_id, FirstReport);
                FirstReport := False;
              end;
            end;

            if not FirstReport then
              frxReport.Print;

          end;
        finally
          rqList.Free;
        end;
        Screen.Cursor := Save_Cursor; { Always restore to normal }
      end
    end;
  end;

end;

procedure TCustomersForm.miPrintReportClick(Sender: TObject);
var
  ReportID, i, ci: Integer;
  RecordInDB: Boolean;
  periodFrom: TDateTime;
  FILENAME: String;
  Stream: TStream;

begin
  if not(Sender is TMenuItem) then
    Exit;

  FILENAME := (Sender as TMenuItem).Hint;
  RecordInDB := ((Sender as TMenuItem).ImageIndex = 1);
  ReportID := (Sender as TMenuItem).Tag;

  if FILENAME = '' then
    Exit;

  if not(RecordInDB) then
    ShowReport(FILENAME)
  else
  begin
    // Загрузим отчет из БД
    i := dmMain.GET_ID_REPORT_BY_PATH(FILENAME);
    if i < 0 then
      Exit;
    try
      dmMain.fdsLoadReport.ParamByName('ID_REPORT').value := i;
      dmMain.fdsLoadReport.Open;
      if dmMain.fdsLoadReport.FieldByName('REPORT_BODY').value <> NULL then
      begin
        Stream := TMemoryStream.Create;
        try
          TBlobField(dmMain.fdsLoadReport.FieldByName('REPORT_BODY')).SaveToStream(Stream);
          Stream.Position := 0;
          dmMain.frxModalReport.LoadFromStream(Stream);
          dmMain.frxModalReport.FILENAME := dmMain.fdsLoadReport.FieldByName('REPORT_NAME').AsString;
          Caption := dmMain.frxModalReport.FILENAME;
        finally
          Stream.Free;
        end;
      end;
    finally
      dmMain.fdsLoadReport.Close;
    end;

    ci := dmMain.frxModalReport.Variables.IndexOf('CUSTOMER_ID');
    if ci > 0 then
      dmMain.frxModalReport.Variables['CUSTOMER_ID'] := dsCustomers['CUSTOMER_ID'];

    dmMain.frxModalReport.ShowReport(True);

    if MessageDlg(rsSaveLetterDate, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      dsCustomers.DisableControls;
      dsCustomers.First;
      with TpFIBQuery.Create(Nil) do
        try
          Database := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          sql.Add('insert into CustLetter (customer_id, custletterid, lettertypeid, custletterdate)');
          sql.Add('values (:customer_id, GEN_ID(gen_operations_uid,1), :lettertypeid, :custletterdate);');
          ParamByName('lettertypeid').AsInteger := i;

          try
            periodFrom := frxReport.Script.Variables['DATEFROM'];
          except
            periodFrom := NOW;
          end;
          ParamByName('custletterdate').AsDate := periodFrom;
          Transaction.StartTransaction;
          if dbgCustomers.SelectedRows.Count > 0 then
            for i := 0 to dbgCustomers.SelectedRows.Count - 1 do
            begin
              dbgCustomers.DataSource.DataSet.Bookmark := dbgCustomers.SelectedRows[i];
              ParamByName('custletterdate').AsDate := periodFrom;
              ParamByName('lettertypeid').AsInteger := ReportID;
              ParamByName('customer_id').AsInteger := dsCustomers['customer_ID'];
              ExecQuery;
            end
          else
            while not dsCustomers.Eof do
            begin
              ParamByName('custletterdate').AsDate := periodFrom;
              ParamByName('lettertypeid').AsInteger := ReportID;
              ParamByName('customer_id').AsInteger := dsCustomers['customer_ID'];
              ExecQuery;
              dsCustomers.next;
            end;
          Transaction.Commit;
        finally
          Free;
        end;
      dsCustomers.EnableControls;
    end;
  end;

end;

procedure TCustomersForm.N10Click(Sender: TObject);
begin
  // TapgCustomerPayments
  SetPageIndex(4);
end;

procedure TCustomersForm.N6Click(Sender: TObject);
begin
  // TapgCustomerInfo
  SetPageIndex(1);
end;

procedure TCustomersForm.N9Click(Sender: TObject);
begin
  // TapgCustomerSingleSrv
  SetPageIndex(2);
end;

procedure TCustomersForm.SwitchIfoTab(const next: Boolean);
begin
  if (not mtbPages.FieldByName('ID').IsNull) then
  begin
    if next then
    begin
      if mtbPages.Eof then
        mtbPages.First
      else
        mtbPages.next;
    end
    else
    begin
      if mtbPages.BOF then
        mtbPages.Last
      else
        mtbPages.Prior;
    end;
  end;
end;

procedure TCustomersForm.SetAdresFilter();
var
  filter: string;
  id: Integer;
  s: string;
begin
  filter := '';
  if (actAddressSearch.Checked) then
  begin
    if VarIsNumeric(lcbHOUSE.KeyValue) then
    begin
      id := lcbHOUSE.KeyValue;
      filter := Format('HOUSE_ID = %d ', [id]);
      if not dsFLAT.Active then
        dsFLAT.Open;
      if lcbFLAT.Text <> '' then
      begin
        s := lcbFLAT.Text;
        if s = '-' then
          s := ''' or  FLAT_NO = ''-'; // некоторые операторы вместо пустого номера ставят -
        filter := Format('%s and (FLAT_NO = ''%s'')', [filter, s]);
      end;
    end
    else
    begin
      if VarIsNumeric(lcbStreets.KeyValue) then
      begin
        id := lcbStreets.KeyValue;
        filter := Format('STREET_ID = %d ', [id]);
        if not dsHomes.Active then
          dsHomes.Open;
      end
    end;
    lcbHOUSE.Enabled := VarIsNumeric(lcbStreets.KeyValue);
    lcbFLAT.Enabled := lcbHOUSE.Enabled and VarIsNumeric(lcbHOUSE.KeyValue);
    if (not lcbFLAT.Enabled) and dsFLAT.Active then
      dsFLAT.Close;
    if (not lcbHOUSE.Enabled) and dsHomes.Active then
      dsHomes.Close;
  end
  else
  begin
    if dsFLAT.Active then
      dsFLAT.Close;

    if dsHomes.Active then
      dsHomes.Close;

    if dsStreets.Active then
      dsStreets.Close;
  end;

  dbgCustomers.DataSource.DataSet.DisableControls;
  dbgCustomers.DataSource.DataSet.filter := filter;
  dbgCustomers.DataSource.DataSet.Filtered := (filter <> '');
  dbgCustomers.DataSource.DataSet.EnableControls;
end;

procedure TCustomersForm.lcbHOUSEChange(Sender: TObject);
begin
  lcbFLAT.value := NULL;
  if actAddressSearch.Checked then
    SetAdresFilter();
end;

procedure TCustomersForm.lcbFLATChange(Sender: TObject);
begin
  if actAddressSearch.Checked then
    SetAdresFilter();
end;

procedure TCustomersForm.lcbStreetsChange(Sender: TObject);
begin
  lcbHOUSE.value := NULL;
  lcbFLAT.value := NULL;
  if actAddressSearch.Checked then
    SetAdresFilter();
end;

procedure TCustomersForm.actAddBlackListExecute(Sender: TObject);
var
  i: Integer;
  s, f: String;
  bm: TBookMark;
  Q: TpFIBQuery;

  procedure SaveInBlackList(const n: String);
  begin
    if not n.IsEmpty then
    begin
      Q.Transaction.StartTransaction;
      Q.ParamByName('O_NAME').AsString := Trim(n);
      if not dsCustomers.FieldByName('SURNAME').IsNull then
        f := dbgCustomers.DataSource.DataSet['SURNAME']
      else
        f := '';
      if not dsCustomers.FieldByName('FIRSTNAME').IsNull then
        f := f + ' ' + dbgCustomers.DataSource.DataSet['FIRSTNAME'];
      if not dsCustomers.FieldByName('MIDLENAME').IsNull then
        f := f + ' ' + dbgCustomers.DataSource.DataSet['MIDLENAME'];
      Q.ParamByName('O_DESCRIPTION').AsString := f;
      Q.ParamByName('O_CHARFIELD').AsString := ReplaceFields(s);
      Q.ExecQuery;
      Q.Transaction.Commit;
    end;
  end;

begin

  if not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_BlacList)) then
    Exit;
  {
    rsFldACCOUNT,
    rsFldContract,
    rsFldPHONE,
    rsFldMobile,
    rsFldEmail;
  }
  s := Format(rsBlackListLine, [rsFldACCOUNT, rsFldDEBT, rsFldSTREET, rsFldHouse, rsFldFlat, rsFldPHONE, rsFldMobile,
    rsFldState]);
  if not EditText(s, rsBlackListTitle, Format(rsBlackListHint, [rsFldACCOUNT, rsFldDEBT, rsFldSTREET, rsFldHouse,
    rsFldFlat, rsFldPHONE, rsFldMobile, rsFldState])) then
    Exit;

  bm := dbgCustomers.DataSource.DataSet.GetBookmark;

  Q := TpFIBQuery.Create(Self);
  try
    Q.Database := dmMain.dbTV;
    Q.Transaction := dmMain.trWriteQ;
    Q.sql.Add('INSERT INTO OBJECTS(O_NAME, O_DESCRIPTION, O_CHARFIELD, O_TYPE ) ');
    Q.sql.Add('VALUES( upper(:O_NAME), :O_DESCRIPTION, :O_CHARFIELD, 31 )');

    if dbgCustomers.SelectedRows.Count > 0 then
    begin
      for i := 0 to dbgCustomers.SelectedRows.Count - 1 do
      begin
        dbgCustomers.DataSource.DataSet.Bookmark := dbgCustomers.SelectedRows[i];
        if not dsCustomers.FieldByName('PERSONAL_N').IsNull then
        begin
          SaveInBlackList(dbgCustomers.DataSource.DataSet['PERSONAL_N']);
        end;
        // номер пасспорта
        if not dsCustomers.FieldByName('PASSPORT_NUMBER').IsNull then
        begin
          SaveInBlackList(dbgCustomers.DataSource.DataSet['PASSPORT_NUMBER']);
        end;
      end;
    end
    else
    begin
      if not dsCustomers.FieldByName('PERSONAL_N').IsNull then
      begin
        SaveInBlackList(dbgCustomers.DataSource.DataSet['PERSONAL_N']);
      end;
      // номер пасспорта
      if not dsCustomers.FieldByName('PASSPORT_NUMBER').IsNull then
      begin
        SaveInBlackList(dbgCustomers.DataSource.DataSet['PASSPORT_NUMBER']);
      end;
    end;
  finally
    Q.Free;
  end;
  dbgCustomers.DataSource.DataSet.GotoBookmark(bm);
end;

function TCustomersForm.ReplaceFields(const str: string): string;
var
  s, last_day: string;
  dolg: string;
  AYear, AMonth, ADay: Word;

begin
  s := str;
  DecodeDate(NOW(), AYear, AMonth, ADay);
  ADay := DaysInAMonth(AYear, AMonth);
  last_day := IntToStr(ADay);
  with dsCustomers do
  begin

    if FieldByName('DEBT_SUM').AsCurrency < 0 then
      dolg := FloatToStr(-1 * FieldByName('DEBT_SUM').AsCurrency)
    else
      dolg := '0';

    s := ReplaceStr(s, rsFldACCOUNT, FieldByName('ACCOUNT_NO').AsString);
    s := ReplaceStr(s, rsFldContract, FieldByName('DOGOVOR_NO').AsString);
    s := ReplaceStr(s, rsFldSaldo, FieldByName('DEBT_SUM').AsString);
    s := ReplaceStr(s, rsFldDEBT, dolg);
    s := ReplaceStr(s, rsFldSURNAME, FieldByName('SURNAME').AsString);
    s := ReplaceStr(s, rsFldFIRSTNAME, FieldByName('FIRSTNAME').AsString);
    s := ReplaceStr(s, rsFldMiddleName, FieldByName('MIDLENAME').AsString);
    s := ReplaceStr(s, rsFldINITIALS, FieldByName('INITIALS').AsString);
    s := ReplaceStr(s, rsFldSTREET, FieldByName('STREET_NAME').AsString);
    s := ReplaceStr(s, rsFldStreetShort, FieldByName('STREET_SHORT').AsString);
    s := ReplaceStr(s, rsFldHouse, FieldByName('HOUSE_NO').AsString);
    s := ReplaceStr(s, rsFldFlat, FieldByName('FLAT_NO').AsString);
    s := ReplaceStr(s, rsFldPHONE, FieldByName('PHONE_NO').AsString);
    s := ReplaceStr(s, rsFldMobile, FieldByName('MOBILE_PHONE').AsString);
    s := ReplaceStr(s, rsFldPassportN, FieldByName('PASSPORT_NUMBER').AsString);
    s := ReplaceStr(s, rsFldPASSPORTDATE, FieldByName('PASSPORT_REGISTRATION').AsString);
    s := ReplaceStr(s, rsFldEmail, FieldByName('EMAIL').AsString);
    s := ReplaceStr(s, rsFldCurrentDay, FormatDateTime('dd', NOW()));
    s := ReplaceStr(s, rsFldDaysOfMonth, last_day);
    s := ReplaceStr(s, rsFldMonth, FormatDateTime('mm', NOW()));
    s := ReplaceStr(s, rsFldCurrentYear, FormatDateTime('yyyy', NOW()));
    s := ReplaceStr(s, rsFldState, FieldByName('CUST_STATE_DESCR').AsString);
  end;
  Result := s;
end;

procedure TCustomersForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if not actAddressSearch.Checked then
    Exit;

  go := False;
  if (Key = #13) then
  begin
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible;

    if go then
    begin
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end
end;

procedure TCustomersForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  if (TryStrToInt(dmMain.GetIniValue('SHOWADDRESSFILTER'), i)) then
  begin
    if (i <> 0) then
      actAddressSearch.Execute();
  end;
end;

function TCustomersForm.frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
begin
  Result := dmMain.frxReportUserFunction(MethodName, Params);
end;

procedure TCustomersForm.actNPSExecute(Sender: TObject);
begin
  if (dsCustomers.RecordCount = 0) or dsCustomers.FieldByName('CUSTOMER_ID').IsNull then
    Exit;

  if not(dmMain.AllowedAction(rght_Customer_full) or dmMain.AllowedAction(rght_Customer_NPS)) then
    Exit;

  AddNpsRating(dsCustomers['CUSTOMER_ID']);
end;

procedure TCustomersForm.actOrderTPExecute(Sender: TObject);
var
  ci: TCustomerInfo;
begin
  ci.CUSTOMER_ID := dsCustomers.FieldByName('CUSTOMER_ID').AsInteger;
  ci.cust_code := dsCustomers.FieldByName('cust_code').AsString;
  ci.Account_No := dsCustomers.FieldByName('Account_No').AsString;
  ci.CUST_STATE_DESCR := dsCustomers.FieldByName('CUST_STATE_DESCR').AsString;

  if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
    ci.Debt_sum := -1 * dsCustomers.FieldByName('Debt_sum').AsCurrency
  else
    ci.Debt_sum := dsCustomers.FieldByName('Debt_sum').AsCurrency;

  ci.FIO := Trim(dsCustomers.FieldByName('Surname').AsString + ' ' + dsCustomers.FieldByName('Firstname').AsString + ' ' +
    dsCustomers.FieldByName('Midlename').AsString);
  ci.STREET_ID := dsCustomers.FieldByName('street_ID').AsInteger;
  ci.STREET := dsCustomers.FieldByName('STREET_SHORT').AsString + ' ' + dsCustomers.FieldByName('STREET_NAME').AsString;
  ci.HOUSE_ID := dsCustomers.FieldByName('HOUSE_ID').AsInteger;
  ci.HOUSE_no := dsCustomers.FieldByName('House_No').AsString;
  ci.FLAT_NO := dsCustomers.FieldByName('FLAT_No').AsString;
  ci.phone_no := dsCustomers.FieldByName('phone_no').AsString;
  ci.mobile := dsCustomers.FieldByName('MOBILE_PHONE').AsString;
  ci.notice := dsCustomers.FieldByName('notice').AsString;
  ci.Color := dsCustomers.FieldByName('HIS_COLOR').AsString;
  ci.isType := 0;
  ci.INN := dsCustomers.FieldByName('JUR_INN').AsString;
  ci.isJur := dsCustomers.FieldByName('Juridical').AsInteger;
  if ci.isJur = 1 then
    ci.FIO := Trim(dsCustomers.FieldByName('Firstname').AsString + ' ' + dsCustomers.FieldByName('Surname').AsString);
  CreateOrderTPForCustomer(-1, ci);
end;

procedure TCustomersForm.InitForm;
var
  s: string;
  i: Integer;
  Font_size: Integer;
  Row_height: Integer;
  Font_name: string;
begin
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
    if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
      i := 0;
    Row_height := i;
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TDBGridEh then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
        (Components[i] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[i] as TDBGridEh).RowHeight := Row_height;
      end;
    end;
  end;

  if not(TryStrToInt(dmMain.GetIniValue('COLUMNS'), i)) then
  begin
    i := clc_IO or clc_Phone or clc_KOD or clc_Notice or clc_Status;
    dmMain.SetIniValue('COLUMNS', IntToStr(i));
  end;
  SetVisibleColumns(i);

  dbgCustomers.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'CustGrid',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);

  try
    FgCustActiveDebt := StringToColor(dmMain.GetSettingsValue('COLOR_DOLG'));
  except
    FgCustActiveDebt := clRed;
  end;
  try
    FgCustDisconted := StringToColor(dmMain.GetSettingsValue('COLOR_OFF'));
  except
    FgCustDisconted := clGray;
  end;
  try
    FgCustDiscontedWithMoney := StringToColor(dmMain.GetSettingsValue('COLOR_OFFMONEY'));
  except
    FgCustDiscontedWithMoney := clBlue;
  end;

  if TryStrToInt(dmMain.GetIniValue('FETCHALL'), i) then
  begin
    if (i = 0) then
      dsCustomers.Options := dsCustomers.Options - [poFetchAll];
  end;

  vRED_SUMM := dmMain.GetSettingsValue('DOLG');

  SetDefaultFilter;
  if dsFilter.RecordCount > 0 then
  begin
    s := GenerateFilter;
    dsCustomers.ParamByName('Filter').value := s;
    s := GetOrderClause(TCustomDBGridEh(dbgCustomers));
    if dsCustomers.Active then
      dsCustomers.Close;
    dsCustomers.OrderClause := s;
  end;

  // права
  InitSecurity;
  CreatePages;
  InitExportPopUpMenus;
  InitPrintPopUpMenus;
end;

procedure TCustomersForm.CreatePages;
begin
  FPageList := TA4onPages.Create;
  FPageList.Add(TapgCustomerInfo);
  FPageList.Add(TapgCustomerSrv);
  FPageList.Add(TapgCustomerSingleSrv);
  FPageList.Add(TapgCustomerKoef);
  FPageList.Add(TapgCustomerPayments);
  FPageList.Add(TapgCustomerRequests);
  FPageList.Add(TapgCustomerAttributes);
  FPageList.Add(TapgCustomerLan);
  FPageList.Add(TapgCustomerInternet);
  FPageList.Add(TapgCustomerDigit);
  FPageList.Add(TapgCustomerLetters);
  FPageList.Add(TapgCustomerRecourse);
  FPageList.Add(TapgCustomerBonus);
  FPageList.Add(TapgCustomerFiles);
  FPageList.Add(TapgCustomerMaterialsMove);
  FPageList.Add(TapgCustomerAppl);
  FPageList.Add(TapgCustomerCard);
end;

procedure TCustomersForm.OpenDataSet(const FindCustomerID: Integer = -1);
var
  i: Integer;
  cr: TCursor;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  try
    dsCustomers.Open;
    if FindCustomerID <> -1 then
      dsCustomers.Locate('CUSTOMER_ID', FindCustomerID, []);
    InitPages;
    UpdateInfoPanel;
  finally
    Screen.Cursor := cr;
  end;

  // авто обновление списка
  FNeedRefresh := False;
  UpdateTimer.Enabled := False;
  if (TryStrToInt(dmMain.GetIniValue('AutoUpdate'), i)) then
  begin
    if (i > 0) then
    begin
      UpdateTimer.Enabled := True;
      UpdateTimer.Interval := i * 60 * 1000
    end
  end;
end;

procedure TCustomersForm.ValidatePassport;
var
  FHttpCli: TSslHttpCli;
  FSslContext: TSslContext;
  Datax: TStringStream;
  url: string;
  unp, ps, pn: string;
  answer: string;
  pValid: Integer;
  qry: TpFIBQuery;

  edtPERSONAL_N, edtPASSPORT_NUMBER: string;
  eFIRSTNAME: string;
  eSURNAME: string;
  eMIDLENAME: string;

  function HasInvalidChar(const s: string): Boolean;
  var
    i: Integer;
  begin
    i := 1;
    Result := False;
    while (i <= Length(s)) do
    begin
      if (not CharInSet(s[i], [' ', '0' .. '9', 'a' .. 'z', 'A' .. 'Z'])) then
        Result := True;
      inc(i);
    end;
  end;

  procedure SplitNumber(const s: string; var ser: string; var num: string);
  var
    v: string;
  begin
    v := Trim(UpperCase(s));
    ser := Copy(v, 1, 2);
    num := Trim(Copy(v, 3, 15));
  end;

  function GetV(const FN: string): String;
  begin
    if (not dsCustomers.FieldByName(FN).IsNull) then
      Result := dsCustomers[FN]
    else
      Result := '';
  end;

begin
  if (not FCheckPassport) or (not dsCustomers.Active) or (dsCustomers.RecordCount = 0) then
    Exit;

  if (not dsCustomers.FieldByName('JURIDICAL').IsNull) and (dsCustomers['JURIDICAL'] = 1) then
    Exit;

  if (not dsCustomers.FieldByName('PASSPORT_VALID').IsNull) and (dsCustomers['PASSPORT_VALID'] = 1) then
    Exit;

  answer := '';
  edtPERSONAL_N := GetV('PERSONAL_N');
  eFIRSTNAME := GetV('FIRSTNAME');
  eSURNAME := GetV('SURNAME');
  eMIDLENAME := GetV('MIDLENAME');
  edtPASSPORT_NUMBER := GetV('PASSPORT_NUMBER');
  pValid := -1;

  if eSURNAME = '' then
    answer := 'Фамилия - ' + rsEmptyFieldError + #13#10;

  if eFIRSTNAME = '' then
    answer := answer + 'Имя - ' + rsEmptyFieldError + #13#10;

  if ((edtPERSONAL_N = '') or (HasInvalidChar(edtPERSONAL_N)) or (Length(edtPERSONAL_N) <> 14)) then
    answer := answer + 'Личный номер - ' + rsEmptyOrIncorrect + #13#10;

  if ((edtPASSPORT_NUMBER = '') or (HasInvalidChar(edtPASSPORT_NUMBER))) then
    answer := answer + 'Номер паспорта - ' + rsEmptyOrIncorrect + #13#10;

  if not answer.IsEmpty then
  begin
    ShowMessage(Trim(answer));
    Exit;
  end;

  SplitNumber(edtPASSPORT_NUMBER, ps, pn);
  unp := dmMain.GetCompanyValue('UNN');
  if unp = '' then
    unp := dmMain.GetCompanyValue('UNP');

  url := Format('surname=%s&name=%s&lastname=%s', [UrlEncode(eSURNAME), UrlEncode(eFIRSTNAME), UrlEncode(eMIDLENAME)]) +
    Format('&ser=%s&num=%s&identif=%s', [UrlEncode(ps), UrlEncode(pn), UrlEncode(edtPERSONAL_N)]) +
    Format('&unp=%s&region=%s&district=%s&city=%s&street=%s&house=%s&housing=%s&room=%s',
    [UrlEncode(unp), UrlEncode(dmMain.GetCompanyValue('REGION')), UrlEncode(dmMain.GetCompanyValue('DISTRICT')),
    UrlEncode(dmMain.GetCompanyValue('CITY')), UrlEncode(dmMain.GetCompanyValue('STREET')),
    UrlEncode(dmMain.GetCompanyValue('HOUSE')), UrlEncode(dmMain.GetCompanyValue('HOUSING')),
    UrlEncode(dmMain.GetCompanyValue('ROOM'))]);

  FSslContext := TSslContext.Create(nil);
  FSslContext.Name := 'FSslContext';
  FSslContext.SslDHParamLines.Clear;
  FSslContext.SslVerifyPeer := False;

  FHttpCli := TSslHttpCli.Create(nil);
  FHttpCli.Name := 'FHttpCli';
  FHttpCli.Agent := 'a4on/1.0';
  FHttpCli.ServerAuth := httpAuthBearer;
  FHttpCli.AuthBearerToken := dmMain.GetSettingsValue('KEY_MVD');
  FHttpCli.ProxyAuth := httpAuthNone;
  FHttpCli.TimeOut := 30;
  FHttpCli.SslContext := FSslContext;
  FHttpCli.ResponseNoException := True;
  Datax := TStringStream.Create('', TEncoding.UTF8);
  FHttpCli.OnRequestDone := Nil;
  FHttpCli.RcvdStream := Datax;
  FHttpCli.url := rsCheckPassportURL + url;
  FHttpCli.Get; // sync

  if FHttpCli.StatusCode = 200 then
  begin
    answer := Datax.DataString;
    if answer.ToLower.Contains('выдан, действителен') then
      pValid := 1
    else
    begin
      ShowMessage(answer);
      pValid := 0;
    end
  end
  else
  begin
    answer := rsError + ' ' + FHttpCli.StatusCode.ToString;
    ShowMessage(answer);
  end;

  FHttpCli.RcvdStream.Free;
  FHttpCli.RcvdStream := nil;
  FHttpCli.Free;
  FSslContext.Free;

  qry := TpFIBQuery.Create(Nil);
  try
    qry.Database := dmMain.dbTV;
    qry.Transaction := dmMain.trWriteQ;
    if pValid > -1 then
    begin
      qry.sql.Text := 'update customer c set c.Passport_Valid = :PV where c.Customer_Id = :CID';
      qry.ParamByName('PV').value := pValid;
      qry.ParamByName('CID').value := dsCustomers['CUSTOMER_ID'];
      qry.Transaction.StartTransaction;
      qry.ExecQuery;
      qry.Transaction.Commit;
    end;

    if answer <> '' then
    begin
      qry.sql.Text := 'insert into Changelog (Log_Group, Object_Id, Value_Before, Value_After)';
      qry.sql.Add(' values (:Log_Group, :Object_Id, :Value_Before, :Value_After)');
      qry.ParamByName('Log_Group').value := 'PASSPORT_CHECK';
      qry.ParamByName('Object_Id').value := dsCustomers['CUSTOMER_ID'];
      qry.ParamByName('Value_Before').value := Format('%s %s %s|%s%s|%s', [eSURNAME, eFIRSTNAME, eMIDLENAME, ps, pn,
        edtPERSONAL_N]);
      qry.ParamByName('Value_After').value := answer;
      qry.Transaction.StartTransaction;
      qry.ExecQuery;
      qry.Transaction.Commit;
    end;
  finally
    qry.Free;
  end;
  RefreshCurrentRecord(Self);
end;

end.
