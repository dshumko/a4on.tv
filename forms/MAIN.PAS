unit MAIN;
{$I defines.inc}

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Win.ComObj,
  System.SysUtils,
  System.Classes,
  System.Variants,
  System.UITypes,
  System.Actions,
  Data.DB,
  Vcl.Graphics,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.StdActns,
  Vcl.ActnList,
  Vcl.ToolWin,
  Vcl.ImgList,
  Vcl.Mask,
  Vcl.AppEvnts,
{$IFDEF VER290}
  System.ImageList,
{$ENDIF}
  FIBQuery,
  pFIBQuery,
  frxExportPDF,
  frxExportRTF,
  frxExportTXT,
  frxExportHTML,
  frxExportXLS,
  frxExportImage,
  frxExportCSV,
  frxExportBIFF,
  frxExportDBF,
  frxExportODF,
  frxExportMail,
  JvDesktopAlert,
  DBCtrlsEh,
  frxClass,
  frxExportXML,
  EhLibLangConsts,
  EhLibEmbeddedLangConsts,
  LanguageResManEh,
  MDIChildBar,
  A4onTypeUnit,
  DM, DBGridEh,
  ad3SpellBase,
  ad3Spell,
  ad4Live;

type
  TA4MainForm = class(TForm)
    MainMenu: TMainMenu;
    File1: TMenuItem;
    FileNewItem: TMenuItem;
    FileOpenItem: TMenuItem;
    Window1: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    Edit1: TMenuItem;
    actlstMain: TActionList;
    OpenCustomers: TAction;
    ApplicationExit: TAction;
    OpenPaymentsDoc: TAction;
    HelpAbout1: TAction;
    WindowClose1: TWindowClose;
    N3: TMenuItem;
    ICONS_ACTIVE: TImageList;
    actServices: TAction;
    actBuildings: TAction;
    actZones: TAction;
    actPaymentSources: TAction;
    N2: TMenuItem;
    N5: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    actSettings: TAction;
    actLogin: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    actClosePeriod: TAction;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    miCompany: TMenuItem;
    actReturnToPreviosMonth: TAction;
    N4: TMenuItem;
    miReports: TMenuItem;
    actEquipment: TAction;
    N6: TMenuItem;
    ActRequest: TAction;
    N18: TMenuItem;
    actWorkers: TAction;
    actRequestType: TAction;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    actMaterials: TAction;
    miPlugIns: TMenuItem;
    SaveDialog: TSaveDialog;
    actPaymentType: TAction;
    miPaymentType: TMenuItem;
    actAttributes: TAction;
    N23: TMenuItem;
    HelpContents1: THelpContents;
    N24: TMenuItem;
    ActHelp: TAction;
    Help2: TMenuItem;
    actRecalcPeriod: TAction;
    actLetters: TAction;
    N25: TMenuItem;
    mi: TMenuItem;
    actChannel: TAction;
    N28: TMenuItem;
    N29: TMenuItem;
    actCardsPay: TAction;
    actCardsPaySerials: TAction;
    N30: TMenuItem;
    actLoadPays: TAction;
    N27: TMenuItem;
    N31: TMenuItem;
    actBillingAll: TAction;
    N33: TMenuItem;
    actVLANS: TAction;
    N34: TMenuItem;
    actCashRegReports: TAction;
    N35: TMenuItem;
    N36: TMenuItem;
    actJournal: TAction;
    N11: TMenuItem;
    actAdminUsers: TAction;
    actAdminQuery: TAction;
    actAdminService: TAction;
    N37: TMenuItem;
    miAdmin: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    miEvents: TMenuItem;
    N38: TMenuItem;
    N42: TMenuItem;
    actEquipmentCommands: TAction;
    N43: TMenuItem;
    actOrgz: TAction;
    actOrgz1: TMenuItem;
    actEQGroups: TAction;
    N44: TMenuItem;
    ilWin: TImageList;
    miIndexSatat: TMenuItem;
    N45: TMenuItem;
    actHeadEnds: TAction;
    N46: TMenuItem;
    actRecourseTPL: TAction;
    N47: TMenuItem;
    actRecourses: TAction;
    miRecourses: TMenuItem;
    actSubDiv: TAction;
    N51: TMenuItem;
    actWorkTeams: TAction;
    N50: TMenuItem;
    actWareHouses: TAction;
    actWareHouses1: TMenuItem;
    actSearchCustomer: TAction;
    miMonitorDB: TMenuItem;
    actVATGroups: TAction;
    N52: TMenuItem;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowTileVertical1: TWindowTileVertical;
    ileHorizontally1: TMenuItem;
    ileVertically1: TMenuItem;
    miChangePWD: TMenuItem;
    actChangePWD: TAction;
    miUploadUpdate: TMenuItem;
    N26: TMenuItem;
    miHETypes: TMenuItem;
    actBanks: TAction;
    N53: TMenuItem;
    actSettingUser: TAction;
    actSettingUser1: TMenuItem;
    N54: TMenuItem;
    actPayments: TAction;
    N55: TMenuItem;
    mdchldbr1: TMDIChildBar;
    actMessages: TAction;
    N56: TMenuItem;
    ActOrdersTPType: TAction;
    ActOrdersTP: TAction;
    ilFilter: TImageList;
    pnl1: TPanel;
    tbMain: TToolBar;
    btnA: TToolButton;
    spP: TToolButton;
    btnP: TToolButton;
    spR: TToolButton;
    btnR: TToolButton;
    pnlDate: TPanel;
    pnlSearch: TPanel;
    btnSearchCustomer: TSpeedButton;
    cbSearchType: TDBComboBoxEh;
    edtSearch: TDBEditEh;
    actDecoders: TAction;
    N58: TMenuItem;
    actMan: TAction;
    N59: TMenuItem;
    N581: TMenuItem;
    N571: TMenuItem;
    miEPG: TMenuItem;
    miDVB: TMenuItem;
    miFeedback: TMenuItem;
    miDVBsettings: TMenuItem;
    miLanguage: TMenuItem;
    mniLoadServices: TMenuItem;
    il12x12: TImageList;
    actLoadServices: TAction;
    miMaterialsSubMenu: TMenuItem;
    N22: TMenuItem;
    actMatDoc: TAction;
    N60: TMenuItem;
    actCloseDay: TAction;
    N61: TMenuItem;
    actEPG: TAction;
    actDVB: TAction;
    actEpgAd: TAction;
    miEpgAd: TMenuItem;
    actShippers: TAction;
    N63: TMenuItem;
    N64: TMenuItem;
    actBonuses: TAction;
    N65: TMenuItem;
    actBlackList: TAction;
    actBlackList1: TMenuItem;
    spE: TToolButton;
    btnE: TToolButton;
    N17: TMenuItem;
    miRates: TMenuItem;
    actIPTVsettings: TAction;
    mniN48: TMenuItem;
    mniIPTVsettings: TMenuItem;
    actNewCustomer: TAction;
    mniNewCustomer: TMenuItem;
    actFileTypes: TAction;
    mniFileTypes: TMenuItem;
    miMobile: TMenuItem;
    miCustomer: TMenuItem;
    miWorker: TMenuItem;
    N32: TMenuItem;
    English1: TMenuItem;
    actGPSMap: TAction;
    N48: TMenuItem;
    miNodes: TMenuItem;
    miNodesType: TMenuItem;
    actNFileTypes: TAction;
    N49: TMenuItem;
    actNodes: TAction;
    spN: TToolButton;
    btnN: TToolButton;
    actTaskList: TAction;
    N57: TMenuItem;
    tmrTaskCheck: TTimer;
    spT: TToolButton;
    btnT: TToolButton;
    actCallCenter: TAction;
    N62: TMenuItem;
    actChanSources: TAction;
    N66: TMenuItem;
    N67: TMenuItem;
    actFiles: TAction;
    N68: TMenuItem;
    miSatCards: TMenuItem;
    actSatCards: TAction;
    actDistributors: TAction;
    N69: TMenuItem;
    tmrIdleClose: TTimer;
    StatusBar: TStatusBar;
    ApplicationEvents: TApplicationEvents;
    actFreqPlan: TAction;
    N70: TMenuItem;
    Action1: TAction;
    actSetToSearch: TAction;
    miTypes: TMenuItem;
    actDeviceType: TAction;
    miDeviceType: TMenuItem;
    miMapDev: TMenuItem;
    miMap: TMenuItem;
    actMap: TAction;
    miN71: TMenuItem;
    actBroadcasIssues: TAction;
    miBroadcasIssues: TMenuItem;
    actBCItypes: TAction;
    miBCItypes: TMenuItem;
    actBCISolution: TAction;
    miBCISolution: TMenuItem;
    actReqPhotos: TAction;
    miReqFiles: TMenuItem;
    miN72: TMenuItem;
    actMobileNews: TAction;
    actMobileNews1: TMenuItem;
    edtcpy1: TEditCopy;
    edtpst1: TEditPaste;
    AddictSpell: TAddictSpell;
    miCommunication: TMenuItem;
    actLinks: TAction;
    miLinks: TMenuItem;
    actSearch: TAction;
    actPortView: TAction;
    actCableType: TAction;
    miCableType: TMenuItem;
    highDPIImageListContainer: TImageList;
    miPortView: TMenuItem;
    actContactTypes: TAction;
    miContactType: TMenuItem;
    actLabelType: TAction;
    miLabelType: TMenuItem;
    actConnectType: TAction;
    miConnectType: TMenuItem;
    actPortType: TAction;
    miPortType: TMenuItem;
    actDocList: TAction;
    miDocList: TMenuItem;
    actPromo: TAction;
    miPromo: TMenuItem;
    procedure actReturnToPreviosMonthExecute(Sender: TObject);
    procedure actClosePeriodExecute(Sender: TObject);
    procedure actServicesExecute(Sender: TObject);
    procedure actBuildingsExecute(Sender: TObject);
    procedure actZonesExecute(Sender: TObject);
    procedure miCompanyClick(Sender: TObject);
    procedure actPaymentSourcesExecute(Sender: TObject);
    procedure OpenPaymentsDocExecute(Sender: TObject);
    procedure OpenCustomersExecute(Sender: TObject);
    procedure ApplicationExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miReportClick(Sender: TObject);
    procedure miModuleClick(Sender: TObject);
    procedure actEquipmentExecute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActRequestExecute(Sender: TObject);
    procedure actWorkersExecute(Sender: TObject);
    procedure actRequestTypeExecute(Sender: TObject);
    procedure actMaterialsExecute(Sender: TObject);
    procedure miPlugInsClick(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure actPaymentTypeExecute(Sender: TObject);
    procedure actAttributesExecute(Sender: TObject);
    procedure HelpContents1Execute(Sender: TObject);
    procedure ActHelpExecute(Sender: TObject);
    procedure actRecalcPeriodExecute(Sender: TObject);
    procedure actLettersExecute(Sender: TObject);
    procedure actChannelExecute(Sender: TObject);
    procedure actCardsPayExecute(Sender: TObject);
    procedure actCardsPaySerialsExecute(Sender: TObject);
    procedure actLoadPaysExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N28Click(Sender: TObject);
    procedure actVLANSExecute(Sender: TObject);
    procedure actCashRegReportsExecute(Sender: TObject);
    procedure actJournalExecute(Sender: TObject);
    procedure actAdminQueryExecute(Sender: TObject);
    procedure actAdminUsersExecute(Sender: TObject);
    procedure actAdminServiceExecute(Sender: TObject);
    procedure miEventsClick(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure actEquipmentCommandsExecute(Sender: TObject);
    procedure actOrgzExecute(Sender: TObject);
    procedure actEQGroupsExecute(Sender: TObject);
    procedure pnlDateDblClick(Sender: TObject);
    procedure miIndexSatatClick(Sender: TObject);
    procedure actHeadEndsExecute(Sender: TObject);
    procedure actRecourseTPLExecute(Sender: TObject);
    procedure actRecoursesExecute(Sender: TObject);
    procedure actSubDivExecute(Sender: TObject);
    procedure actWorkTeamsExecute(Sender: TObject);
    procedure actWareHousesExecute(Sender: TObject);
    procedure edtSearchEnter(Sender: TObject);
    procedure edtSearchKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actSearchCustomerExecute(Sender: TObject);
    procedure ed1Enter(Sender: TObject);
    procedure pnlSearchResize(Sender: TObject);
    procedure miMonitorDBClick(Sender: TObject);
    procedure edtSearchEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure actVATGroupsExecute(Sender: TObject);
    procedure actChangePWDExecute(Sender: TObject);
    procedure UploadUpdateToDB;
    procedure miUploadUpdateClick(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure miHETypesClick(Sender: TObject);
    procedure actBanksExecute(Sender: TObject);
    procedure actSettingUserExecute(Sender: TObject);
    procedure actPaymentsExecute(Sender: TObject);
    procedure actMessagesExecute(Sender: TObject);
    procedure actDecodersExecute(Sender: TObject);
    procedure actManExecute(Sender: TObject);
    procedure miEPGClick(Sender: TObject);
    procedure ActOrdersTPTypeExecute(Sender: TObject);
    procedure ActOrdersTPExecute(Sender: TObject);
    procedure miFeedbackClick(Sender: TObject);
    procedure actMatDocExecute(Sender: TObject);
    procedure actCloseDayExecute(Sender: TObject);
    procedure actEPGExecute(Sender: TObject);
    procedure actDVBExecute(Sender: TObject);
    procedure actEpgAdExecute(Sender: TObject);
    procedure actShippersExecute(Sender: TObject);
    procedure actBonusesExecute(Sender: TObject);
    procedure actBlackListExecute(Sender: TObject);
    procedure miRatesClick(Sender: TObject);
    procedure actIPTVsettingsExecute(Sender: TObject);
    procedure actNewCustomerExecute(Sender: TObject);
    procedure actFileTypesExecute(Sender: TObject);
    procedure actGPSMapExecute(Sender: TObject);
    procedure cbSearchTypeChange(Sender: TObject);
    procedure miNodesTypeClick(Sender: TObject);
    procedure actNFileTypesExecute(Sender: TObject);
    procedure actNodesExecute(Sender: TObject);
    procedure actTaskListExecute(Sender: TObject);
    procedure tmrTaskCheckTimer(Sender: TObject);
    procedure actCallCenterExecute(Sender: TObject);
    procedure AlertClick(Sender: TObject);
    procedure actChanSourcesExecute(Sender: TObject);
    procedure actFilesExecute(Sender: TObject);
    procedure actSatCardsExecute(Sender: TObject);
    procedure actDistributorsExecute(Sender: TObject);
    procedure tmrIdleCloseTimer(Sender: TObject);
    procedure ApplicationEventsHint(Sender: TObject);
    procedure actFreqPlanExecute(Sender: TObject);
    procedure actSetToSearchExecute(Sender: TObject);
    procedure actDeviceTypeExecute(Sender: TObject);
    procedure actMapExecute(Sender: TObject);
    procedure actBroadcasIssuesExecute(Sender: TObject);
    procedure actBCItypesExecute(Sender: TObject);
    procedure actBCISolutionExecute(Sender: TObject);
    procedure actReqPhotosExecute(Sender: TObject);
    procedure actMobileNewsExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actCableTypeExecute(Sender: TObject);
    procedure actLinksExecute(Sender: TObject);
    procedure actPortViewExecute(Sender: TObject);
    procedure actContactTypesExecute(Sender: TObject);
    procedure actLabelTypeExecute(Sender: TObject);
    procedure actConnectTypeExecute(Sender: TObject);
    procedure actPortTypeExecute(Sender: TObject);
    procedure actDocListExecute(Sender: TObject);
    procedure actPromoExecute(Sender: TObject);
  private
    { Private declarations }
    FRunning: Boolean; // скрипт работает
    FStopped: Boolean; // скрипт остановлен
    fApplicarionInIdle: Boolean; // программа простаивает. можем обновить список
    FLogedRight: Boolean;
    FToolTipStack: TjvDesktopAlertStack;
    procedure LoadLang;
    procedure ReadUserSettings;
    procedure ReadInitSettings;
    procedure WriteSettings;
    function CheckCashReg: Boolean;
    function GetApplicationPath: string;
    procedure UpdateFromDB;
    procedure SetVisibleButtons;
    procedure CreateReportMenu;
    procedure CreateModulesMenu;
    procedure miPreviewReportClick(Sender: TObject);
    procedure miReportsManagerClick(Sender: TObject);
    procedure InitSecurity;
    procedure InitSecurityDictionary;
    procedure InitSecurityMobile;
    procedure SearchHandle(const SearchValue: String = ''; const SearchType: Integer = 0);
    procedure SendMessagesToCallListiner(const alias: String = '');
    // закроем приложение при переходе в спящий режим
    procedure PowerStatusChange(var Message: TMessage); message WM_POWERBROADCAST;
    procedure CheckAndChangePassword;
    procedure AppOnMessage(var Msg: TMsg; var Handled: Boolean);
    procedure CloseAllConnect;
    procedure CreateScreenShot(scrsht: TBitMap);
    procedure ResizeImageListImagesforHighDPI(const ImgList: TImageList);
    // procedure AppOnIdle(Sender: TObject; var Done: Boolean);
  public
    property ApplicarionInIdle: Boolean read fApplicarionInIdle;
    property ApplicationPath: string read GetApplicationPath;
    // Возвращает имя файла в котором сохраним последнего юзвера
    function GetLastIniFileName: string;
    function GetIniFileName: String;
    function GetUserFilterFolder: String;
    function GetMainIniFileName: String;
    function FindOpenPayDoc: string;
    procedure AddAlert(const Alert: TAlertItem);
    procedure CallBack(const param: string; const value: string);
    function SendSMS(const phone: string; const text: string): Boolean;
    function TelnetQuery(const host: string; const commands: String; const EOL_CHRS: Integer = 0): string;
    procedure DoUpdate;
    procedure ClearAlert(const All: Boolean = True);
    function SuspiciousDate(const vDate: TDateTime): Boolean;
    procedure MakeCall(const CallType: Integer; const CallNumber: String);
    procedure MakeTask(const Object_Type: string; const Object_ID: string; CallBackVar: TTaskCreateCallBack = nil);
    procedure SearchFromTask(const Object_Type: string; const Object_ID: string);
    procedure ReceiveMessage(var Msg: TMessage); message WM_COPYDATA;
    procedure OpnenNodeByFlat(const HOUSE: Integer; const Flat: String);
    procedure OpnenNodeByID(const ID: Integer);
    procedure OpenEquipmentByName(const name: String);
    function OpenEquipmentByID(const eid: Integer): Boolean;
    function OpenRequest(const rq_id: Integer): Boolean;
    function ShowCustomers(const FilterFIELD: Integer = -1; const FilterVALUE: string = ''): Integer;
    procedure ExportDBGrid(const aDBGrid: TDBGridEh; const aFileName: string);
    procedure CopyDBGrid(const aDBGrid: TDBGridEh; const ForWholeGrid: Boolean = False);
    procedure OpenCustomerWithData(const aCustomer: Integer; const TabType: Integer; const DataValue: string);
    function ParseCaptured(const _scanName: string; scResult: TStringList): Boolean;
  end;

var
  A4MainForm: TA4MainForm;
  idOper: Integer;

  // TODO: нужно контролировать логичность дат предоставления услуг

implementation

{$R *.dfm}

uses
  Winapi.CommCtrl,
  System.Threading,
  System.DateUtils,
{$IFDEF EurekaLog}
  FeedbackForma,
{$ENDIF}
  System.StrUtils,
  System.IniFiles,
  DBGridEhImpExp,
  RxStrUtils,
  AtrCommon,
  PrjConst,
  PeriodForma,
  PaymentSourcesForma,
  ScreenShotForma,
  CompanyForma,
  AreaForma,
  StreetForma,
  ServicesForma,
  EquipmentForma,
  AboutForma,
  WorkersForma,
  RequestTypeForma,
  RequestsForma,
  MaterialsForma,
  FIBDatabase,
  UserLoginDlg,
  SettingsForma,
  PaymentTypeForma,
  AttributesForma,
  LettersForma,
  PayDocsForma,
  ChannelsForma,
  CardsPayForma,
  CardSerialsForma,
  ReportPreview,
  LoaderReestrForma,
  AtrStrUtils,
  VlansForma,
  JournalForma,
  QueryForma,
  UsersForma,
  SrvServiceForma,
  ScriptModule,
  fs_iinterpreter,
  ScripEditorForma,
  EventsForma,
  EquipmentComands,
  OrganForma,
  EQGroupsForma,
  HeadEndsForma,
  RecourseTPLForma,
  RecoursesForma,
  SUBDIVForma,
  WorkTeamForma,
  WHForma,
  monitoringUnitMain,
  VATForma,
  ChangePwdForma,
  HETypesForma,
  BanksForma,
  SettinsUserForma,
  PaymentsForma,
  CF,
  MessagesForma,
  PaymentDocForma,
  ReportDesignerForma,
  DVBEquipmentForma,
  ManForma,
  EPGView,
  OTPTypesForma,
  OrdersTPForma,
  DVBSettings,
  MatDocsForma,
  EPGAdForma,
  ShippersForma,
  atrCmdUtils,
  BonusesForma,
  BlackListForma,
  RequestForma,
  RatesForma,
  IPTVSettings,
  fmuCustomerNew,
  CustomerForma,
  FileTypeForma,
  MapForma,
  NodesForma,
  NodeTypeForma,
  NFileTypeForma,
  TaskForma,
  NewTaskForma,
  CallCenterForma,
  ChanSourcesForma,
  CustFilesForma,
  BCIssuesForma,
  BCIssuesTypeForma,
  SatCardsForma,
  DistribForma,
  FreqPlanForma,
  JclLocales,
  DeviceTypesForma,
  WebBrowserForma,
  BCIssuesSolutionForma,
  ReqPhotosForma,
  NewsForma,
  NHunspell,
  WireTypeForma,
  WireForma,
  PortListForma,
  ContactTypeForma,
  LabelTypeForma,
  ConnectTypeForma,
  PortTypeForma, DocListForma, PromoForma;

type

  TCashReportsDialog = function(AppHandle: THandle; OPER: PWChar; OPER_PASS: PWChar): Integer; stdcall;

  { * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * }
  { * Display a message in the memo field, breaking with CR                   * }
procedure TStringsAddLines(Memo: TStrings; const Msg: String);
const
  CR = #13;
  LF = #10;
var
  Start, Stop: Integer;
begin
  if Memo.Count = 0 then
    Memo.Add('');

  Start := 1;
  Stop := Pos(CR, Msg);
  if Stop = 0 then
    Stop := Length(Msg) + 1;
  while Start <= Length(Msg) do
  begin
    Memo.Strings[Memo.Count - 1] := Memo.Strings[Memo.Count - 1] + Copy(Msg, Start, Stop - Start);
    if Msg[Stop] = CR then
    begin
      Memo.Add('');
    end;
    Start := Stop + 1;
    if Start > Length(Msg) then
      Break;
    if Msg[Start] = LF then
      Start := Start + 1;
    Stop := Start;
    while (Msg[Stop] <> CR) and (Stop <= Length(Msg)) do
      Stop := Stop + 1;
  end;
end;

procedure RunDosInMemo(const CmdLine: String);
const
  ReadBuffer = 2400;
var
  Security: TSecurityAttributes;
  ReadPipe, WritePipe: THandle;
  Start: TStartUpInfo;
  ProcessInfo: TProcessInformation;
  Buffer: PAnsiChar;
  BytesRead: DWord;
  Apprunning: DWord;
begin
  Screen.Cursor := CrHourGlass;
  With Security do
  begin
    nlength := SizeOf(TSecurityAttributes);
    binherithandle := True;
    lpsecuritydescriptor := nil;
  end;
  if Createpipe(ReadPipe, WritePipe, @Security, 0) then
  begin
    Buffer := AllocMem(ReadBuffer + 1);
    FillChar(Start, SizeOf(Start), #0);
    Start.cb := SizeOf(Start);
    Start.hStdOutput := WritePipe;
    Start.hStdInput := ReadPipe;
    Start.dwFlags := STARTF_USESTDHANDLES + STARTF_USESHOWWINDOW;
    Start.wShowWindow := SW_HIDE;

    if CreateProcess(nil, PChar(CmdLine), @Security, @Security, True, NORMAL_PRIORITY_CLASS, nil, nil, Start,
      ProcessInfo) then
    begin
      repeat
        Apprunning := WaitForSingleObject(ProcessInfo.hProcess, 100);
        ReadFile(ReadPipe, Buffer[0], ReadBuffer, BytesRead, nil);
        Buffer[BytesRead] := #0;
        OemToAnsi(Buffer, Buffer);
        // AMemo.Text := AMemo.text + String(Buffer);

        Application.ProcessMessages;
      until (Apprunning <> WAIT_TIMEOUT);
    end;
    FreeMem(Buffer);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
    CloseHandle(ReadPipe);
    CloseHandle(WritePipe);
  end;
  Screen.Cursor := CrDefault;
end;

procedure TA4MainForm.ResizeImageListImagesforHighDPI(const ImgList: TImageList);
const
  DevImgSIZE = 16;
var
  ii: Integer;
  mb, ib, sib, smb: TBitMap;
begin

  // http://zarko-gajic.iz.hr/resizing-delphis-timagelist-bitmaps-to-fit-high-dpi-scaling-size-for-menus-toolbars-trees-etc/

  if Screen.PixelsPerInch = 96 then
    Exit;

  // clear images
  highDPIImageListContainer.Clear;

  // add from source image list
  for ii := 0 to -1 + ImgList.Count do
    highDPIImageListContainer.AddImage(ImgList, ii);

  // set size to match DPI size (like 250% of 16px = 40px)
  ImgList.SetSize(MulDiv(DevImgSIZE, Screen.PixelsPerInch, 96), MulDiv(DevImgSIZE, Screen.PixelsPerInch, 96));

  // add images back to original ImageList stretched (if DPI scaling > 150%) or centered (if DPI scaling <= 150%)
  for ii := 0 to -1 + highDPIImageListContainer.Count do
  begin
    sib := TBitMap.Create; // stretched (or centered) image
    smb := TBitMap.Create; // stretched (or centered) mask
    try
      sib.Width := ImgList.Width;
      sib.Height := ImgList.Height;
      sib.Canvas.FillRect(sib.Canvas.ClipRect);
      smb.Width := ImgList.Width;
      smb.Height := ImgList.Height;
      smb.Canvas.FillRect(smb.Canvas.ClipRect);

      ib := TBitMap.Create;
      mb := TBitMap.Create;
      try
        ib.Width := DevImgSIZE;
        ib.Height := DevImgSIZE;
        ib.Canvas.FillRect(ib.Canvas.ClipRect);

        mb.Width := DevImgSIZE;
        mb.Height := DevImgSIZE;
        mb.Canvas.FillRect(mb.Canvas.ClipRect);

        ImageList_DrawEx(highDPIImageListContainer.Handle, ii, ib.Canvas.Handle, 0, 0, ib.Width, ib.Height, CLR_NONE,
          CLR_NONE, ILD_NORMAL);
        ImageList_DrawEx(highDPIImageListContainer.Handle, ii, mb.Canvas.Handle, 0, 0, mb.Width, mb.Height, CLR_NONE,
          CLR_NONE, ILD_MASK);

        if Screen.PixelsPerInch * 100 / 96 <= 150 then // center if <= 150%
        begin
          sib.Canvas.Draw((sib.Width - ib.Width) DIV 2, (sib.Height - ib.Height) DIV 2, ib);
          smb.Canvas.Draw((smb.Width - mb.Width) DIV 2, (smb.Height - mb.Height) DIV 2, mb);
        end
        else // stretch if > 150%
        begin
          sib.Canvas.StretchDraw(Rect(0, 0, sib.Width, sib.Width), ib);
          smb.Canvas.StretchDraw(Rect(0, 0, smb.Width, smb.Width), mb);
        end;
      finally
        ib.Free;
        mb.Free;
      end;

      ImgList.Add(sib, smb);
    finally
      sib.Free;
      smb.Free;
    end;
  end;
end;

function TA4MainForm.FindOpenPayDoc(): string;
var
  i: Integer;
  s: string;
begin
  s := '';
  for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
    if (A4MainForm.MDIChildren[i] is TPaymentDocForm) then
      s := IntToStr(A4MainForm.MDIChildren[i].Tag) + ',' + s;
  if s = '' then
    s := '-1,';
  Result := Copy(s, 1, Length(s) - 1);
end;

procedure TA4MainForm.CallBack(const param: string; const value: string);
begin
  cbSearchType.value := 6;
  edtSearch.text := value;
  actSearchCustomer.Execute;
end;

procedure TA4MainForm.cbSearchTypeChange(Sender: TObject);
begin
  edtSearch.SetFocus;
end;

function TA4MainForm.GetApplicationPath: string;
begin
  Result := ExtractFilePath(Application.ExeName);
end;

function TA4MainForm.CheckCashReg: Boolean;
var
  CashReportsDialog: TCashReportsDialog;
  HLib: THandle;
begin
  Result := False;
  if FileExists(ExtractFilePath(Application.ExeName) + 'cashrgst.dll') then
  begin
    HLib := 0;
    try
      HLib := LoadLibrary('cashrgst.dll');
      if HLib > HINSTANCE_ERROR then
      begin
        CashReportsDialog := GetProcAddress(HLib, 'CashReportsDialog');
        if Assigned(CashReportsDialog) then
          Result := True;
      end
    finally
      if HLib > HINSTANCE_ERROR then
        FreeLibrary(HLib);
    end;
  end
end;

// Возвращает каталог с настройками пользователя
function TA4MainForm.GetUserFilterFolder: string;
var
  s: string;
  f: string;
begin
  s := rsAplicationName;

  f := GetSpecialFolderPath();
  if f <> '' then
    f := f + '\' + s + '\'
  else
    f := GetApplicationPath() + 'FILTERS\';
  ForceDirectories(f);
  Result := f
end;

// Возвращает имя файла с настройками пользователя
function TA4MainForm.GetIniFileName: string;
var
  s: string;
  f: string;
  alias: string;
begin
  s := rsAplicationName;
  f := dmMain.GetIniValue('DBSETTINGS');
  if (f = '1') then
  begin
    f := dmMain.DBAlias;
    f := f.Replace('\', '_').Replace(' ', '_').Replace(':', '_');
    alias := Copy('_' + f, 1, 255);
  end
  else
    alias := '';

  f := GetSpecialFolderPath();
  if f <> '' then
  begin
    f := f + '\' + s + '\';
    ForceDirectories(f);
    if FileExists(f + s + '.ini') then
      RenameFile(f + s + '.ini', f + s + '_' + dmMain.User + '.ini');

    f := f + s + '_' + dmMain.User + alias + '.ini';
  end
  else
  begin
    f := GetApplicationPath() + s + '_' + dmMain.User + alias + '.ini';
  end;
  Result := f;
end;

// Возвращает имя файла в котором сохраним последнего юзвера
function TA4MainForm.GetLastIniFileName: string;
var
  s: string;
  f: string;
begin
  s := rsAplicationName;

  f := GetSpecialFolderPath();
  if f <> '' then
  begin
    f := f + '\' + s + '\';
    ForceDirectories(f);
    f := f + 'LAST_LOGGED.INI';
  end
  else
  begin
    f := GetApplicationPath() + 'LAST_LOGGED.INI';
  end;
  // ShowMessage(f);
  Result := f
end;

// Возвращает имя файла с настройками подключения
function TA4MainForm.GetMainIniFileName: string;
begin
  Result := ChangeFileExt(Application.ExeName, '.INI');
end;

procedure TA4MainForm.WriteSettings;
var
  AppIni: TIniFile;
  fName: string;
begin
  fName := GetLastIniFileName;
  if WaitForFileWrite(fName) then
  begin
    AppIni := TIniFile.Create(fName);
    try
      AppIni.WriteString('MAIN', 'LASTDATABASE', dmMain.GetIniValue('LASTDATABASE'));
      AppIni.WriteString('MAIN', 'LASTUSERNAME', dmMain.GetIniValue('LASTUSERNAME'));
      AppIni.WriteString('MAIN', 'CONNECTDLL', dmMain.GetIniValue('CONNECTDLL'));
      AppIni.WriteString('MAIN', 'DBSETTINGS', dmMain.GetIniValue('DBSETTINGS'));
    finally
      FreeAndNil(AppIni);
    end;
  end;

  fName := GetIniFileName;
  if WaitForFileWrite(fName) then
  begin
    AppIni := TIniFile.Create(fName);
    try
      AppIni.WriteString('MAIN', 'SET_AS_CURRENT_DATE', dmMain.GetIniValue('SET_AS_CURRENT_DATE'));
      AppIni.WriteString('MAIN', 'SHOWFILTER', dmMain.GetIniValue('SHOWFILTER'));
      AppIni.WriteString('MAIN', 'SHOWADDRESSFILTER', dmMain.GetIniValue('SHOWADDRESSFILTER'));
      AppIni.WriteString('MAIN', 'FETCHALL', dmMain.GetIniValue('FETCHALL'));
      AppIni.WriteString('MAIN', 'PAYDOC_BEGIN', dmMain.GetIniValue('PAYDOC_BEGIN'));
      AppIni.WriteString('MAIN', 'PAYDOC_END', dmMain.GetIniValue('PAYDOC_END'));
      AppIni.WriteString('MAIN', 'PRINTREQ', dmMain.GetIniValue('PRINTREQ'));
      AppIni.WriteString('MAIN', 'REQOPENNEW', dmMain.GetIniValue('REQOPENNEW'));
      AppIni.WriteString('MAIN', 'REQTOADRES', dmMain.GetIniValue('REQTOADRES'));
      AppIni.WriteString('MAIN', 'RECTOCUSTOMER', dmMain.GetIniValue('RECTOCUSTOMER'));
      AppIni.WriteString('MAIN', 'ALWAYSSHOW', dmMain.GetIniValue('ALWAYSSHOW'));
      AppIni.WriteString('MAIN', 'REQUNION', dmMain.GetIniValue('REQUNION'));
      AppIni.WriteString('MAIN', 'REQALL', dmMain.GetIniValue('REQALL'));
      AppIni.WriteString('MAIN', 'AUTOOPEN', dmMain.GetIniValue('AUTOOPEN'));
      AppIni.WriteString('MAIN', 'DEFSEARCH', dmMain.GetIniValue('DEFSEARCH'));
      AppIni.WriteString('MAIN', 'KBDSWITCH', dmMain.GetIniValue('KBDSWITCH'));
      AppIni.WriteString('MAIN', 'AUTOUPDATE', dmMain.GetIniValue('AUTOUPDATE'));
      AppIni.WriteString('MAIN', 'NOTAUTOUPDATE', dmMain.GetIniValue('NOTAUTOUPDATE'));
      AppIni.WriteString('MAIN', 'COLUMNS', dmMain.GetIniValue('COLUMNS'));
      AppIni.WriteString('MAIN', 'BUTTONS', dmMain.GetIniValue('BUTTONS'));
      AppIni.WriteString('MAIN', 'HIDEHINT', dmMain.GetIniValue('HIDEHINT'));
      AppIni.WriteString('MAIN', 'PRINT_CHECK_AND_REPORT', dmMain.GetIniValue('PRINT_CHECK_AND_REPORT'));
      AppIni.WriteString('MAIN', 'CASHBOXPSWD', dmMain.GetIniValue('CASHBOXPSWD'));
      AppIni.WriteString('MAIN', 'DISCOUNT', dmMain.GetIniValue('DISCOUNT'));

      if dmMain.GetIniValue('FONT_SIZE') <> '' then
      begin
        AppIni.WriteString('MAIN', 'FONT_SIZE', dmMain.GetIniValue('FONT_SIZE'));
        AppIni.WriteString('MAIN', 'FONT_NAME', dmMain.GetIniValue('FONT_NAME'));
      end;
      AppIni.WriteString('MAIN', 'ROW_HEIGHT', dmMain.GetIniValue('ROW_HEIGHT'));

      AppIni.WriteString('GRIDS', 'ServiceGrid', dmMain.GetIniValue('ServiceGrid'));
      AppIni.WriteString('GRIDS', 'StreetGrid', dmMain.GetIniValue('StreetGrid'));
      AppIni.WriteString('GRIDS', 'HIDE_NOT_ACTUAL_SRV', dmMain.GetIniValue('HIDE_NOT_ACTUAL_SRV'));

      AppIni.WriteString('EQPMNT', 'EQUIPMENTASTREE', dmMain.GetIniValue('EQUIPMENTASTREE'));
      AppIni.WriteString('EQPMNT', 'EQUIPMENT_INFOLAYOUT', dmMain.GetIniValue('EQUIPMENT_INFOLAYOUT'));
      AppIni.WriteString('EQPMNT', 'EQUIPMENT_FSIZE', dmMain.GetIniValue('EQUIPMENT_FSIZE'));
      AppIni.WriteString('EQPMNT', 'EQUIPMENT_LSIZE', dmMain.GetIniValue('EQUIPMENT_LSIZE'));
      AppIni.WriteString('EQPMNT', 'EQUIPMENT_ISIZE', dmMain.GetIniValue('EQUIPMENT_ISIZE'));
      AppIni.WriteString('EQPMNT', 'EQUIPMENT_PSIZE', dmMain.GetIniValue('EQUIPMENT_PSIZE'));

      AppIni.WriteString('MSGSFRM', 'MSG_SENDED_ONLY', dmMain.GetIniValue('MSG_SENDED_ONLY'));
      AppIni.WriteString('MSGSFRM', 'MSG_MY_ONLY', dmMain.GetIniValue('MSG_MY_ONLY'));
    finally
      FreeAndNil(AppIni);
    end;
  end;
end;

procedure TA4MainForm.ReadUserSettings;
var
  AppIni: TIniFile;
  s, f: string;

  procedure SetFromIniSettings(const section: String; const Settings: String; const default: string = '0');
  var
    v: string;
  begin
    v := AppIni.ReadString(section, Settings, default);
    dmMain.SetIniValue(Settings, v);
  end;

begin
  s := GetIniFileName;
  if FileExists(s) then
  begin
    AppIni := TIniFile.Create(s);

    SetFromIniSettings('MAIN', 'SET_AS_CURRENT_DATE', '1');
    SetFromIniSettings('MAIN', 'NOTAUTOUPDATE', '0');
    SetFromIniSettings('MAIN', 'SHOWFILTER', '0');
    SetFromIniSettings('MAIN', 'SHOWADDRESSFILTER', '0');
    SetFromIniSettings('MAIN', 'FETCHALL', '0');
    SetFromIniSettings('MAIN', 'PAYDOC_BEGIN', DateToStr(DATE() - 7));
    SetFromIniSettings('MAIN', 'PAYDOC_END', DateToStr(DATE()));
    SetFromIniSettings('MAIN', 'PRINTREQ', '0');
    SetFromIniSettings('MAIN', 'REQUNION', '0');
    SetFromIniSettings('MAIN', 'REQOPENNEW', '0');
    SetFromIniSettings('MAIN', 'REQALL', '0');
    SetFromIniSettings('MAIN', 'REQTOADRES', '0');
    SetFromIniSettings('MAIN', 'RECTOCUSTOMER', '0');
    SetFromIniSettings('MAIN', 'ALWAYSSHOW', '0');
    SetFromIniSettings('MAIN', 'AUTOOPEN', '0');
    SetFromIniSettings('MAIN', 'HIDEHINT', '0');
    SetFromIniSettings('MAIN', 'DEFSEARCH', '0');
    SetFromIniSettings('MAIN', 'AUTOUPDATE', '0');
    SetFromIniSettings('MAIN', 'COLUMNS', '');
    SetFromIniSettings('MAIN', 'BUTTONS', '15');
    SetFromIniSettings('MAIN', 'KBDSWITCH', '0');
    SetFromIniSettings('GRIDS', 'ServiceGrid', '');
    SetFromIniSettings('GRIDS', 'StreetGrid', '');
    SetFromIniSettings('GRIDS', 'HIDE_NOT_ACTUAL_SRV', '0');
    SetFromIniSettings('MAIN', 'PRINT_CHECK_AND_REPORT', '0');
    SetFromIniSettings('MAIN', 'CASHBOXPSWD', '');
    SetFromIniSettings('MAIN', 'DISCOUNT', '0');
    SetFromIniSettings('MAIN', 'DBSETTINGS', '0');
    SetFromIniSettings('MAIN', 'ROW_HEIGHT', '0');

    SetFromIniSettings('EQPMNT', 'EQUIPMENTASTREE', '0');
    SetFromIniSettings('EQPMNT', 'EQUIPMENT_INFOLAYOUT', '0');
    SetFromIniSettings('EQPMNT', 'EQUIPMENT_FSIZE', '200');
    SetFromIniSettings('EQPMNT', 'EQUIPMENT_LSIZE', '120');
    SetFromIniSettings('EQPMNT', 'EQUIPMENT_ISIZE', '330');
    SetFromIniSettings('EQPMNT', 'EQUIPMENT_PSIZE', '350');

    SetFromIniSettings('MSGSFRM', 'MSG_SENDED_ONLY', '1');
    SetFromIniSettings('MSGSFRM', 'MSG_MY_ONLY', '0');

    s := AppIni.ReadString('MAIN', 'FONT_SIZE', '0');
    if s <> '0' then
    begin
      dmMain.SetIniValue('FONT_SIZE', s);
      s := AppIni.ReadString('MAIN', 'FONT_NAME', '0');
      dmMain.SetIniValue('FONT_NAME', s);
    end;

    FreeAndNil(AppIni);
  end
  else
  begin
    dmMain.SetIniValue('NOTAUTOUPDATE', '0');
    dmMain.SetIniValue('SHOWFILTER', '0');
    dmMain.SetIniValue('FETCHALL', '1');
    dmMain.SetIniValue('PAYDOC_BEGIN', DateToStr(DATE() - 7));
    dmMain.SetIniValue('PAYDOC_END', DateToStr(DATE()));
    dmMain.SetIniValue('PRINTREQ', '0');
    dmMain.SetIniValue('REQUNION', '0');
    dmMain.SetIniValue('REQALL', '0');
    dmMain.SetIniValue('AUTOOPEN', '0');
    dmMain.SetIniValue('HIDEHINT', '0');
    dmMain.SetIniValue('AUTOUPDATE', '0');
    dmMain.SetIniValue('COLUMNS', '16502');
    dmMain.SetIniValue('SMS_TYPE', '0');
    dmMain.SetIniValue('SMS_COM', '1');
    dmMain.SetIniValue('SMS_CMD', '');
    dmMain.SetIniValue('SMS_LEN', '0');
    dmMain.SetIniValue('SMS_LAT', '1');
    dmMain.SetIniValue('PRINT_CHECK_AND_REPORT', '0');
    dmMain.SetIniValue('RECTOCUSTOMER', '0');
    dmMain.SetIniValue('ALWAYSSHOW', '0');
    dmMain.SetIniValue('DBSETTINGS', '0');
    actSettingUser.Execute;
  end;

  f := ExtractFileDir(Application.ExeName);
  if FileExists(f + '\hunspell.dll') and FileExists(f + '\dict_ru_ru.oxt') then
  begin
    s := ExtractFileDir(GetIniFileName);
    AddictSpell.ConfigFilename := s + '\A4on.TV_spell.cfg';
    AddictSpell.ConfigStorage := csFile;

    if not FileExists(AddictSpell.ConfigFilename) then
    begin
      AddictSpell.ConfigDictionaryDir.Clear;
      AddictSpell.ConfigDictionaryDir.Add(f);
      AddictSpell.ConfigDefaultMain.Clear;
      AddictSpell.ConfigDefaultCustom.Clear;
      AddictSpell.ConfigDefaultCustom.Add(s + '\Autocorrect.adu');
      AddictSpell.ConfigDefaultCustom.Add(s + '\A4on.TV.adu');
      AddictSpell.ConfigDefaultActiveCustom := s + '\A4on.TV.adu';
      AddictSpell.SuggestionsLearningDict := ChangeFileExt(AddictSpell.ConfigFilename, '.adl');
      AddictSpell.ConfigUseMSWordCustom := False; // не использовать словарь MS office
      AddictSpell.KeepDictionariesActive := False; // хранить словарь в ОЗУ или нет
    end;

    Hunspell.ReadFolder(f);
    with AddictSpell.Configuration.MainDictionaries do
    begin
      Clear;
      Add('dict_ru_ru.oxt::russian-aot.aff::russian-aot.dic');
      // default value, this is the "InternalFileID" of the US English dictionary
    end;
    Hunspell.UpdateAndLoadDictionaries;
    AddictSpell.Tag := 1;
  end;
end;

procedure TA4MainForm.ReadInitSettings;
var
  AppIni: TIniFile;
  s: string;
  // KeyboradLocalesList: TJclKeyboardLayoutList;
  // i: Integer;
  HasRU: Boolean;
begin
  HasRU := True;
  {
    KeyboradLocalesList := TJclKeyboardLayoutList.Create();
    try
    s := '';
    HasRU := False;
    for i := 0 to KeyboradLocalesList.Count - 1 do
    begin
    if KeyboradLocalesList.Items[i].LocaleID = 1049 then
    HasRU := True;
    end;
    finally
    FreeAndNil(KeyboradLocalesList);
    end;
  }
  s := rsAplicationName;

  dmMain.SetIniValue('LASTDATABASE', s);
  dmMain.SetIniValue('LASTUSERNAME', 'SYSDBA');

  AppIni := TIniFile.Create(GetMainIniFileName);

  s := AppIni.ReadString('MAIN', 'CHARSET', 'UTF8');
  dmMain.SetIniValue('CHARSET', s);
  if HasRU then
    s := 'RU'
  else
    s := 'EN';
  s := AppIni.ReadString('MAIN', 'KEYBOARD', s);
  dmMain.SetIniValue('KEYBOARD', s);
  s := AppIni.ReadString('MAIN', 'CONNECTDLL', '');
  dmMain.SetIniValue('CONNECTDLL', s);
  FreeAndNil(AppIni);

  AppIni := TIniFile.Create(GetLastIniFileName);
  s := AppIni.ReadString('MAIN', 'LASTDATABASE', '');
  dmMain.SetIniValue('LASTDATABASE', s);

  s := AppIni.ReadString('MAIN', 'LASTUSERNAME', 'SYSDBA');
  dmMain.SetIniValue('LASTUSERNAME', s);

  s := AppIni.ReadString('MAIN', 'DBSETTINGS', '0');
  dmMain.SetIniValue('DBSETTINGS', s);

  FreeAndNil(AppIni);
end;

procedure TA4MainForm.ed1Enter(Sender: TObject);
begin
  (Sender as TCustomEdit).SelectAll;
end;

procedure TA4MainForm.edtSearchEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if Assigned(CustomersForm) and (cbSearchType.value = 6) then
  begin
    CustomersForm.AddPhoneForCustomer(edtSearch.text);
    edtSearch.Color := clRed;
  end;
  Handled := True;
end;

procedure TA4MainForm.edtSearchEnter(Sender: TObject);
begin
  (Sender as TEdit).SelectAll;
end;

procedure TA4MainForm.edtSearchKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    actSearchCustomer.Execute
  else
  begin
    edtSearch.Color := clWindow;
    edtSearch.Hint := rsFindHint;
    edtSearch.EditButtons[0].Visible := False;
  end;
end;

procedure TA4MainForm.miReportClick(Sender: TObject);
var
  rt: string;
begin
  if Pos('.fr3', (Sender as TMenuItem).Hint) = 0 then
    Exit;
  rt := (Sender as TMenuItem).Hint;
  ShowReport(rt);
end;

procedure TA4MainForm.miModuleClick(Sender: TObject);
var
  text: String;
begin
  if (not dmMain.AllowedAction(rght_Modules_Exec)) then
    Exit;

  if FRunning then
  begin
    FStopped := False;
    Exit;
  end;

  SM.fs.Clear;
  SM.fs.SyntaxType := 'PascalScript';

  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.text := 'select coalesce(Lang,0) Lang, Module from Modules where Id_Module = :Id_Module';

      ParamByName('Id_Module').AsInteger := (Sender as TMenuItem).Tag;
      Transaction.StartTransaction;
      ExecQuery;
      if not EOF then
      begin
        case fn('LANG').AsInteger of
          1:
            SM.fs.SyntaxType := 'C++Script';
          2:
            SM.fs.SyntaxType := 'JScript';
          3:
            SM.fs.SyntaxType := 'BasicScript';
        else
          SM.fs.SyntaxType := 'PascalScript';
        end;
        SM.fs.Lines.text := fn('MODULE').AsString;
      end;
      Transaction.Commit;
    finally
      Free;
    end;

  SM.fs.Parent := fsGlobalUnit;

  if not SM.fs.Compile then
  begin
    if SM.fs.ErrorUnit = '' then
      text := SM.fs.ErrorMsg
    else
      text := SM.fs.ErrorUnit + ': ' + SM.fs.ErrorMsg;
    text := SM.fs.ErrorPos + ' Error' + text;
    ShowMessage(text);
    Exit;
  end;
  FRunning := True;
  try
    SM.fs.Execute;
    SM.fs.ClearRTTI;
    SM.fs.Clear;
  finally
    FRunning := False;
  end;
end;

procedure TA4MainForm.miMonitorDBClick(Sender: TObject);
begin
  if Not Assigned(MonDBForm) then
    MonDBForm := TMonDBForm.Create(Application);
  MonDBForm.Show;
end;

procedure TA4MainForm.miNodesTypeClick(Sender: TObject);
begin
  if Not Assigned(NodeTypeForm) then
    NodeTypeForm := TNodeTypeForm.Create(Application);
  NodeTypeForm.Show;
end;

procedure TA4MainForm.OpenCustomersExecute(Sender: TObject);
begin
  ShowCustomers();
end;

procedure TA4MainForm.ApplicationEventsHint(Sender: TObject);
begin
  if StatusBar.SimplePanel then
    StatusBar.SimpleText := Application.Hint;
end;

procedure TA4MainForm.ApplicationExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TA4MainForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  // ”dm” is the name of the TDataModule instance
  if Screen.PixelsPerInch <> 96 then
  begin
    for i := 0 to -1 + ComponentCount do
      if Components[i] is TImageList then
        ResizeImageListImagesforHighDPI(TImageList(Components[i]));
  end;

  FLogedRight := False;
  FToolTipStack := TjvDesktopAlertStack.Create(self);
  LoadLang;
  ReadInitSettings;
end;

procedure TA4MainForm.OpenPaymentsDocExecute(Sender: TObject);
begin
  if not(dmMain.AllowedAction(rght_Pays_full) or dmMain.AllowedAction(rght_Programm_ViewMoney) or
    dmMain.AllowedAction(rght_Pays_add) or dmMain.AllowedAction(rght_Pays_AddToday)) then
    Exit;

  if Not Assigned(PayDocsForm) then
    PayDocsForm := TPayDocsForm.Create(Application);
  PayDocsForm.Show;
end;

procedure TA4MainForm.pnlDateDblClick(Sender: TObject);
begin
  if dmMain.SuperMode = 1 then
  begin
    dmMain.SuperMode := 0;
    pnlDate.Color := clBtnFace;
  end;

end;

procedure TA4MainForm.pnlSearchResize(Sender: TObject);
begin
  btnSearchCustomer.Left := pnlSearch.Width - 2 - btnSearchCustomer.Width;
  if pnlSearch.Width > 250 then
    cbSearchType.Width := 80
  else
    cbSearchType.Width := Round((btnSearchCustomer.Left - 2) / 3);
  edtSearch.Left := cbSearchType.Width + 6;
  edtSearch.Width := btnSearchCustomer.Left - edtSearch.Left - 2;
end;

procedure TA4MainForm.actPaymentsExecute(Sender: TObject);
begin
  if Not Assigned(PaymentsForm) then
    PaymentsForm := TPaymentsForm.Create(Application);
  PaymentsForm.Show;
end;

procedure TA4MainForm.actPaymentSourcesExecute(Sender: TObject);
begin
  if Not Assigned(PaymentSourcesForm) then
    PaymentSourcesForm := TPaymentSourcesForm.Create(Application);
  PaymentSourcesForm.Show;
end;

procedure TA4MainForm.miCompanyClick(Sender: TObject);
begin
  if Not Assigned(CompanyForm) then
    CompanyForm := TCompanyForm.Create(Application);
  CompanyForm.Show;
end;

procedure TA4MainForm.actZonesExecute(Sender: TObject);
begin
  if Not Assigned(AreaForm) then
    AreaForm := TAreaForm.Create(Application);
  AreaForm.Show;
end;

procedure TA4MainForm.actBanksExecute(Sender: TObject);
begin
  if Not Assigned(BanksForm) then
    BanksForm := TBanksForm.Create(Application);
  BanksForm.Show;
end;

procedure TA4MainForm.actBCISolutionExecute(Sender: TObject);
begin
  if not Assigned(BCIssuesSolutionForm) then
  begin
    BCIssuesSolutionForm := TBCIssuesSolutionForm.Create(Application);
  end;
  BCIssuesSolutionForm.Show;
end;

procedure TA4MainForm.actBCItypesExecute(Sender: TObject);
begin
  if not Assigned(BCIssuesTypeForm) then
  begin
    BCIssuesTypeForm := TBCIssuesTypeForm.Create(Application);
  end;
  BCIssuesTypeForm.Show;
end;

procedure TA4MainForm.actBuildingsExecute(Sender: TObject);
begin
  if Not Assigned(StreetForm) then
    StreetForm := TStreetForm.Create(Application);
  StreetForm.Show;
end;

procedure TA4MainForm.actSatCardsExecute(Sender: TObject);
begin
  if Not Assigned(SatCardsForm) then
    SatCardsForm := TSatCardsForm.Create(Application);
  SatCardsForm.Show;
end;

procedure TA4MainForm.actSearchCustomerExecute(Sender: TObject);
var
  sv: String;
  i: Integer;
begin
  sv := edtSearch.text.Trim;
  if (VarIsNull(cbSearchType.value)) then
    i := 0
  else
    i := cbSearchType.value;

  if ((i > 0) or (sv <> '')) then
    SearchHandle(sv, i);
end;

procedure TA4MainForm.actSearchExecute(Sender: TObject);
begin
  if edtSearch.Visible then
    edtSearch.SetFocus;
end;

procedure TA4MainForm.actServicesExecute(Sender: TObject);
begin
  if Not Assigned(ServicesForm) then
    ServicesForm := TServicesForm.Create(Application);
  ServicesForm.Show;
end;

procedure TA4MainForm.actClosePeriodExecute(Sender: TObject);
var
  s: TDate;
  b: TDateTime;
  Save_Cursor: TCursor;
begin
  if (not dmMain.AllowedAction(rght_Calc_CLose)) then
    Exit;

  Save_Cursor := Screen.Cursor;
  s := dmMain.CurrentMonth;
  if (MessageDlg(Format(rsCloseDay, [FormatDateTime('mmmm yyyy', s + 32)]),

    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    b := Now();
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(self) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.text := 'EXECUTE PROCEDURE CLOSE_MONTH_PROC(:P_MONTH, null)';
        ParamByName('P_MONTH').AsDate := s + 32;

        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;

    dmMain.GetSettingsValue('ReloadSettingsFromDB');
    dmMain.CurrentMonth := FBdateToDate(VarToStr(dmMain.GetSettingsValue('CURRENT_DATE')));

    pnlDate.Caption := FormatDateTime('mmmm yyyy г.', dmMain.CurrentMonth);

    Screen.Cursor := Save_Cursor;
    b := b - Now();
    ShowMessage(Format(rsCalculateComplite, [TimeToStr(b)]));
  end;

end;

procedure TA4MainForm.actConnectTypeExecute(Sender: TObject);
begin
  if Not Assigned(ConnectTypeForm) then
    ConnectTypeForm := TConnectTypeForm.Create(Application);
  ConnectTypeForm.Show;
end;

procedure TA4MainForm.actContactTypesExecute(Sender: TObject);
begin
  if Not Assigned(ContactTypeForm) then
    ContactTypeForm := TContactTypeForm.Create(Application);
  ContactTypeForm.Show;
end;

procedure TA4MainForm.actDecodersExecute(Sender: TObject);
begin
  if Not Assigned(DVBEquipmentForm) then
    DVBEquipmentForm := TDVBEquipmentForm.Create(Application);
  DVBEquipmentForm.Show;
end;

procedure TA4MainForm.actDeviceTypeExecute(Sender: TObject);
begin
  if Not Assigned(DeviceTypesForm) then
    DeviceTypesForm := TDeviceTypesForm.Create(Application);
  DeviceTypesForm.Show;
end;

procedure TA4MainForm.actDistributorsExecute(Sender: TObject);
begin
  if Not Assigned(DistribForm) then
    DistribForm := TDistribForm.Create(Application);
  DistribForm.Show;
end;

procedure TA4MainForm.actDocListExecute(Sender: TObject);
begin
  if Not Assigned(DocListForm) then
    DocListForm := TDocListForm.Create(Application);
  DocListForm.Show;
end;

procedure TA4MainForm.actReturnToPreviosMonthExecute(Sender: TObject);
var
  s: TDate;
begin
  if (not dmMain.AllowedAction(rght_Calc_Back)) then
    Exit;
  s := dmMain.CurrentMonth;
  if (MessageDlg(s_ReturnMonth + FormatDateTime('mmmm yyyy', s - 15) + ') ?',

    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(self) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.text := 'EXECUTE PROCEDURE DELETE_MONTH_PROC(:P_MONTH)';
        ParamByName('P_MONTH').AsDate := s;
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;
    dmMain.GetSettingsValue('ReloadSettingsFromDB');
    dmMain.CurrentMonth := FBdateToDate(VarToStr(dmMain.GetSettingsValue('CURRENT_DATE')));

    pnlDate.Caption := FormatDateTime('mmmm yyyy г.', dmMain.CurrentMonth);

    Screen.Cursor := CrDefault;
  end;
end;

procedure TA4MainForm.miEPGClick(Sender: TObject);
begin
  if Not Assigned(EPGViewForm) then
    EPGViewForm := TEPGViewForm.Create(Application);
  EPGViewForm.Show;
end;

procedure TA4MainForm.miEventsClick(Sender: TObject);
begin
  if Not Assigned(EventsForm) then
    EventsForm := TEventsForm.Create(Application);
  EventsForm.Show;
end;

procedure TA4MainForm.miFeedbackClick(Sender: TObject);
begin
{$IFDEF EurekaLog}
  if Not Assigned(FeedbackForm) then
    FeedbackForm := TFeedbackForm.Create(Application);
  FeedbackForm.Show;
{$ENDIF}
end;

procedure TA4MainForm.miIndexSatatClick(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  with TpFIBQuery.Create(self) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.text := 'EXECUTE PROCEDURE INDICES_REBUILD_SELECTIVITY';
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      Free;
    end;
  Screen.Cursor := CrDefault;
end;

procedure TA4MainForm.actEQGroupsExecute(Sender: TObject);
begin
  if Not Assigned(EQGroupsForm) then
    EQGroupsForm := TEQGroupsForm.Create(Application);
  EQGroupsForm.Show;
end;

procedure TA4MainForm.actEquipmentCommandsExecute(Sender: TObject);
begin
  if Not Assigned(EquipmentCommandsForm) then
    EquipmentCommandsForm := TEquipmentCommandsForm.Create(Application);
  EquipmentCommandsForm.Show;
end;

procedure TA4MainForm.actEquipmentExecute(Sender: TObject);
begin
  if Not Assigned(EquipmentForm) then
    EquipmentForm := TEquipmentForm.Create(Application);
  EquipmentForm.Show;
end;

procedure TA4MainForm.OpenEquipmentByName(const name: String);
begin
  if not actEquipment.Visible then
    Exit;

  actEquipmentExecute(self);
  EquipmentForm.dbGrid.DataSource.DataSet.Locate('NAME', name, [loCaseInsensitive]);
end;

function TA4MainForm.OpenEquipmentByID(const eid: Integer): Boolean;
begin
  Result := False;

  if not actEquipment.Visible then
    Exit;

  actEquipmentExecute(self);

  if (EquipmentForm.mtEQ.Active and EquipmentForm.mtEQ.TreeList.Active) then
  begin
    //
    Result := EquipmentForm.mtEQ.TreeList.Locate('EID', eid, []);
    if not Result then
    begin
      if EquipmentForm.mtEQ.Filtered then
      begin
        EquipmentForm.mtEQ.Filtered := False;
        Result := EquipmentForm.mtEQ.TreeList.Locate('EID', eid, []);
      end;
      if not Result then
      begin
        EquipmentForm.dbGrid.SearchPanel.CancelSearchFilter;
        Result := EquipmentForm.mtEQ.TreeList.Locate('EID', eid, []);
      end;
    end;
  end
  else
  begin
    Result := EquipmentForm.dbGrid.DataSource.DataSet.Locate('EID', eid, []);
    if not Result then
    begin
      if EquipmentForm.dbGrid.DataSource.DataSet.Filtered then
      begin
        EquipmentForm.dbGrid.DataSource.DataSet.Filtered := False;
        Result := EquipmentForm.dbGrid.DataSource.DataSet.Locate('EID', eid, []);
      end;
      if not Result then
      begin
        EquipmentForm.dbGrid.SearchPanel.CancelSearchFilter;
        Result := EquipmentForm.dbGrid.DataSource.DataSet.Locate('EID', eid, []);
      end;
    end;
  end;
end;

procedure TA4MainForm.actHeadEndsExecute(Sender: TObject);
begin
  if Not Assigned(HeadEndsForm) then
    HeadEndsForm := THeadEndsForm.Create(Application);
  HeadEndsForm.Show;
end;

procedure TA4MainForm.HelpAbout1Execute(Sender: TObject);
begin
  with TAboutForm.Create(Application) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TA4MainForm.FormShow(Sender: TObject);
var
  DB, User, pass, alias, s: String;
  hiden_pass, setting_pass, strError: string;
  i: Integer;
  Handle: THandle;
begin
  DB := dmMain.GetIniValue('LASTDATABASE');
  User := dmMain.GetIniValue('LASTUSERNAME');
  dmMain.dbTV.ConnectParams.CharSet := dmMain.GetIniValue('CHARSET');

  // попытка проверить есть ли длл в системе. и найти нужную
  s := dmMain.GetIniValue('CONNECTDLL');
  if s.IsEmpty then
  begin
    s := dmMain.GetIniValue('CLIENTDLL');
    if s.IsEmpty then
    begin
      // если не нашли нужный параметр, прочитаем второй возможный
      s := 'fbclient.dll';
      dmMain.SetIniValue('CONNECTDLL', s);
    end;
  end;

  Handle := LoadLibrary(PWideChar(s));
  if Handle <> 0 then
    FreeLibrary(Handle)
  else
  begin
    if s.ToUpper.Contains('FBCLIENT') then
      s := 'gds32.dll'
    else
      s := 'fbclient.dll';

    Handle := LoadLibrary(PWideChar(s));
    if Handle <> 0 then
    begin
      FreeLibrary(Handle);
      dmMain.SetIniValue('CONNECTDLL', s);
    end
    else
    begin
      ShowMessage(Format(rsErrorDll, [dmMain.GetIniValue('CONNECTDLL')]));
      Halt;
    end;
  end;

  dmMain.dbTV.LibraryName := s;

  pass := Copy(ParamStr(1), 1, 3);
  if (pass = '/p:') then
    pass := Copy(ParamStr(1), 4, Length(ParamStr(1)))
  else
  begin
{$IFNDEF DEMOVERSION}
    pass := GetEnvVarValue('A4ON_' + User);
{$ELSE}
    pass := 'masterkey';
{$ENDIF}
  end;

  SetKeyboardLayout('EN');

  if not LoginDialogA(DB, User, pass, alias) then
    Halt;

  s := dmMain.GetIniValue('KEYBOARD');
  if not s.IsEmpty then
  begin
    SetKeyboardLayout(s);
  end;

  dmMain.DBAlias := alias;
  dmMain.dbTV.DatabaseName := DB;
  dmMain.dbTV.ConnectParams.UserName := User;
  if User.ToUpper <> 'SYSDBA' then
  begin
    pass := passprefix + pass;
    dmMain.dbTV.ConnectParams.RoleName := 'ROLE_A4USER';
  end;
  dmMain.dbTV.SQLDialect := 3;
  dmMain.dbTV.ConnectParams.Password := pass;
  dmMain.dbTV.DBParams.Add('no_garbage_collect');
  dmMain.dbTV.Tag := 0;
  try
    dmMain.dbTV.Open;
  except
    On E: Exception do
    begin
      strError := E.Message;
      strError := strError + #13#10 + dmMain.dbTV.DatabaseName;
      strError := strError + #13#10 + dmMain.dbTV.ConnectParams.UserName;
      strError := strError + #13#10 + dmMain.dbTV.LibraryName;
    end;
  end;

  if ((not dmMain.dbTV.Connected) and (dmMain.dbTV.Tag = 1)) then
  begin
    // проверим не защита ли для сокрытия пльзователей
    if User.ToUpper = 'SYSDBA' then
    begin
      hiden_pass := Copy(pass, 1, 4);
      pass := Copy(pass, 5, Length(pass) - 4)
    end
    else
    begin
      hiden_pass := Copy(pass, 3, 4);
      pass := passprefix + Copy(pass, 7, Length(pass) - 6);
      dmMain.dbTV.ConnectParams.RoleName := 'ROLE_A4USER';
    end;
    dmMain.dbTV.Tag := 1; // SuperMode Check
    dmMain.dbTV.SQLDialect := 3;
    dmMain.dbTV.ConnectParams.Password := pass;
    try
      dmMain.dbTV.Open;
    except
      On E: Exception do
      begin
        strError := E.Message;
        strError := strError + #13#10 + dmMain.dbTV.DatabaseName;
        strError := strError + #13#10 + dmMain.dbTV.ConnectParams.UserName;
        strError := strError + #13#10 + dmMain.dbTV.LibraryName;
      end;
    end;
  end;

  if (not dmMain.dbTV.Connected) then
  begin
    ShowMessage(Format(rsErrorConnect, [strError]));
    Halt;
  end;

  FLogedRight := True;

  dmMain.iniPropStorage.IniFileName := A4MainForm.GetIniFileName;

  // Если сменили пользователя, перечитаем настройки
  ReadUserSettings;
  // DBGridEhInplaceSearchTimeOut := 5000;
  dmMain.InitData;

  dmMain.SetIniValue('LASTDATABASE', dmMain.dbTV.DBName);
  dmMain.SetIniValue('LASTUSERNAME', dmMain.dbTV.ConnectParams.UserName);

  if (FileExists(alias + '.ico')) then
    Application.Icon.LoadFromFile(alias + '.ico');

  Caption := Format('%s %s %s', [alias, dmMain.dbTV.ConnectParams.UserName, rsAplicationName]);
  Application.title := Format('%s %s %s', [alias, dmMain.dbTV.ConnectParams.UserName, rsAplicationName]);

  {
    with TpFIBQuery.Create(self) do
    try
    DataBase := dmMain.dbTV;
    Transaction := dmMain.trReadQ;
    SQL.text := 'SELECT var_value from settings where var_name = ''DB_VER''';

    Transaction.StartTransaction;
    ExecQuery;
    if not FieldByName('var_value').IsNull then
    begin
    VERSION_DB := FieldByName('var_value').value;
    end
    else
    VERSION_DB := -1;
    Close;
    Transaction.Commit;
    finally
    Free;
    end;

    if VERSION_DB < DB_VERSION then
    begin
    MessageDlg(rsDBVersionWrong, mtWarning, [mbOK], 0);
    end;
  }

  UpdateFromDB;

  dmMain.CurrentMonth := FBdateToDate(VarToStr(dmMain.GetSettingsValue('CURRENT_DATE')));

  pnlDate.Caption := FormatDateTime('mmmm yyyy г.', dmMain.CurrentMonth);

  // выставим режим работы программы
  // -1 отключено скрытие абонентов
  // 0 отоброжать только не скрытых абонентов
  // 1 отоброжать всех (и скрытых абонентов)
  dmMain.SuperMode := -1;
  setting_pass := dmMain.GetSettingsValue('SECRET');

  if setting_pass <> '' then
    dmMain.SuperMode := 0;

  if dmMain.dbTV.Tag = 1 then
  begin
    dmMain.dbTV.Tag := 0;
    if hiden_pass = dmMain.GetSettingsValue('SECRET') then
      dmMain.SuperMode := 1;
  end;

  if dmMain.SuperMode = 1 then
    pnlDate.Color := clRed
  else
    pnlDate.Color := clBtnFace;

  fsGlobalUnit.AddConst('A4ON_SERVER', 'string', dmMain.Server);
  fsGlobalUnit.AddConst('A4ON_DB', 'string', dmMain.DataBase);
  fsGlobalUnit.AddConst('A4ON_USER', 'string', dmMain.User);
  fsGlobalUnit.AddConst('A4ON_PASSWORD', 'string', dmMain.Password);
  fsGlobalUnit.AddConst('A4ON_DBNAME', 'string', dmMain.DBName);
  fsGlobalUnit.AddConst('A4ON_PATH', 'string', A4MainForm.ApplicationPath);

  fsGlobalUnit.AddConst('ATIRRA_SERVER', 'string', dmMain.Server);
  fsGlobalUnit.AddConst('ATIRRA_DB', 'string', dmMain.DataBase);
  fsGlobalUnit.AddConst('ATIRRA_USER', 'string', dmMain.User);
  fsGlobalUnit.AddConst('ATIRRA_PASSWORD', 'string', dmMain.Password);

  // Проверим все права
  InitSecurity;
  // создадим меню отчетов
  CreateReportMenu;
  // создадим меню подгружаемых модулей
  CreateModulesMenu;
  // покажем кнопки
  SetVisibleButtons;

  if dmMain.GetIniValue('DEFSEARCH') <> '' then
  begin
    cbSearchType.OnChange := nil; // иначе срабатывает открытие абонентов
    cbSearchType.value := dmMain.GetIniValue('DEFSEARCH');
    cbSearchType.OnChange := cbSearchTypeChange;
  end;

  if TryStrToInt(dmMain.GetIniValue('AUTOOPEN'), i) then
    case i of
      1:
        OpenCustomers.Execute;
      2:
        ActRequest.Execute;
      3:
        OpenPaymentsDoc.Execute;
      4:
        actEquipment.Execute;
      5:
        actTaskList.Execute;
    end;

  if TryStrToInt(dmMain.GetIniValue('HIDEHINT'), i) then
  begin
    // StatusBar.AutoHint := (i = 1);
    StatusBar.SimplePanel := (i = 1);
    Application.ShowHint := (i <> 1);
  end
  else
  begin
    // показываем подсказку всегда
    StatusBar.SimplePanel := False;
    Application.ShowHint := True;
  end;

  tmrTaskCheck.Enabled := True;
  SendMessagesToCallListiner(alias);
  CheckAndChangePassword;

  if dmMain.GetSettingsValue('IDLEHOURS') <> '' then
  begin
    if TryStrToInt(dmMain.GetSettingsValue('IDLEHOURS'), i) and (i > 0) then
    begin
      // не даем программе висеть IDLE часов
      tmrIdleClose.Interval := i * 60 * 60 * 1000;
      // 24*60*60 24 часа 60 минут 60 секунд
      Application.OnMessage := AppOnMessage;
    end;
  end;
end;

procedure TA4MainForm.ActRequestExecute(Sender: TObject);
begin
  if Not Assigned(RequestsForm) then
    RequestsForm := TRequestsForm.Create(Application);
  RequestsForm.Show;
end;

procedure TA4MainForm.actWareHousesExecute(Sender: TObject);
begin
  if Not Assigned(WHform) then
    WHform := TWHform.Create(Application);
  WHform.Show;
end;

procedure TA4MainForm.actWorkersExecute(Sender: TObject);
begin
  if Not Assigned(WorkersForm) then
    WorkersForm := TWorkersForm.Create(Application);
  WorkersForm.Show;
end;

procedure TA4MainForm.actWorkTeamsExecute(Sender: TObject);
begin
  if Not Assigned(WorkTeamForm) then
    WorkTeamForm := TWorkTeamForm.Create(Application);
  WorkTeamForm.Show;
end;

procedure TA4MainForm.actRequestTypeExecute(Sender: TObject);
begin
  if Not Assigned(RequestTypeForm) then
    RequestTypeForm := TRequestTypeForm.Create(Application);
  RequestTypeForm.Show;
end;

procedure TA4MainForm.actManExecute(Sender: TObject);
begin
  if Not Assigned(ManForm) then
    ManForm := TManForm.Create(Application);
  ManForm.Show;
end;

procedure TA4MainForm.actMapExecute(Sender: TObject);
begin
  if Not Assigned(WebBrowserForm) then
    WebBrowserForm := TWebBrowserForm.Create(Application);
  WebBrowserForm.Show;
end;

procedure TA4MainForm.actMaterialsExecute(Sender: TObject);
begin
  if Not Assigned(MaterialsForm) then
    MaterialsForm := TMaterialsForm.Create(Application);
  MaterialsForm.Show;
end;

procedure TA4MainForm.actMessagesExecute(Sender: TObject);
begin
  if Not Assigned(MessagesForm) then
    MessagesForm := TMessagesForm.Create(Application);
  MessagesForm.Show;
end;

procedure TA4MainForm.actMobileNewsExecute(Sender: TObject);
begin
  if Not Assigned(NewsForm) then
    NewsForm := TNewsForm.Create(Application);
  NewsForm.Show;
end;

procedure TA4MainForm.ActOrdersTPExecute(Sender: TObject);
begin
  ShowOrders(-1);
end;

procedure TA4MainForm.ActOrdersTPTypeExecute(Sender: TObject);
begin
  if Not Assigned(OTPTypesForm) then
    OTPTypesForm := TOTPTypesForm.Create(Application);
  OTPTypesForm.Show;
end;

procedure TA4MainForm.actOrgzExecute(Sender: TObject);
begin
  if Not Assigned(OrganForm) then
    OrganForm := TOrganForm.Create(Application);
  OrganForm.Show;
end;

procedure TA4MainForm.miPlugInsClick(Sender: TObject);
begin
  if Not Assigned(ScripEditorForm) then
    ScripEditorForm := TScripEditorForm.Create(Application);
  ScripEditorForm.Show;
end;

procedure TA4MainForm.actSettingsExecute(Sender: TObject);
begin
  With TSettingsForm.Create(Application) do
  begin
    ShowModal;
  end;
end;

procedure TA4MainForm.actSettingUserExecute(Sender: TObject);
begin
  With TSettingsUserForm.Create(Application) do
  begin
    ShowModal;
    SetVisibleButtons;
  end;
end;

procedure TA4MainForm.actSetToSearchExecute(Sender: TObject);
begin
  edtSearch.SetFocus;
end;

procedure TA4MainForm.actSubDivExecute(Sender: TObject);
begin
  if Not Assigned(SubDivForm) then
    SubDivForm := TSubDivForm.Create(Application);
  SubDivForm.Show;
end;

procedure TA4MainForm.actTaskListExecute(Sender: TObject);
begin
  if Not Assigned(TaskForm) then
    TaskForm := TTaskForm.Create(Application);
  TaskForm.Show;
end;

procedure TA4MainForm.actVATGroupsExecute(Sender: TObject);
begin
  if Not Assigned(VATForm) then
    VATForm := TVATForm.Create(Application);
  VATForm.Show;
end;

procedure TA4MainForm.actVLANSExecute(Sender: TObject);
begin
  if Not Assigned(VlansForm) then
    VlansForm := TVlansForm.Create(Application);
  VlansForm.Show;
end;

procedure TA4MainForm.actPaymentTypeExecute(Sender: TObject);
begin
  if Not Assigned(PaymentTypeForm) then
    PaymentTypeForm := TPaymentTypeForm.Create(Application);
  PaymentTypeForm.Show;
end;

procedure TA4MainForm.actPortTypeExecute(Sender: TObject);
begin
  if Not Assigned(PortTypeForm) then
    PortTypeForm := TPortTypeForm.Create(Application);
  PortTypeForm.Show;
end;

procedure TA4MainForm.actPortViewExecute(Sender: TObject);
begin
  if Not Assigned(PortListForm) then
    PortListForm := TPortListForm.Create(Application);
  PortListForm.Show;
end;

procedure TA4MainForm.actPromoExecute(Sender: TObject);
begin
  if Not Assigned(PromoForm) then
    PromoForm := TPromoForm.Create(Application);
  PromoForm.Show;
end;

procedure TA4MainForm.actAdminQueryExecute(Sender: TObject);
begin
  if (dmMain.User <> 'SYSDBA') then
    Exit;
  if Not Assigned(QueryForm) then
    QueryForm := TQueryForm.Create(Application);
  QueryForm.Show;
end;

procedure TA4MainForm.actAdminServiceExecute(Sender: TObject);
begin
  if (dmMain.User <> 'SYSDBA') then
    Exit;
  if Not Assigned(SrvServiceForm) then
    SrvServiceForm := TSrvServiceForm.Create(Application);
  SrvServiceForm.Show;
end;

procedure TA4MainForm.actAdminUsersExecute(Sender: TObject);
begin
  if (dmMain.User <> 'SYSDBA') then
    Exit;

  if Not Assigned(UsersForm) then
    UsersForm := TUsersForm.Create(Application);
  UsersForm.Show;
end;

procedure TA4MainForm.actAttributesExecute(Sender: TObject);
begin
  if Not Assigned(AttributesForm) then
    AttributesForm := TAttributesForm.Create(Application);
  AttributesForm.Show;
end;

procedure TA4MainForm.HelpContents1Execute(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTENTS, 0);
end;

procedure TA4MainForm.ActHelpExecute(Sender: TObject);
begin
  Application.HelpCommand(HELP_CONTEXT, 0);
end;

procedure TA4MainForm.actRecalcPeriodExecute(Sender: TObject);
var
  bDate, eDate: TDateTime;

begin
  if (not dmMain.AllowedAction(rght_Calc_Recalc)) then
    Exit;
  bDate := Now;
  eDate := Now;

  if ChangePeriod(bDate, eDate) then
  begin
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(self) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.text := 'EXECUTE PROCEDURE CLOSE_PERIOD_PROC(:P_START_MONTH, :P_END_MONTH, null)';
        ParamByName('P_START_MONTH').AsDate := bDate;
        ParamByName('P_END_MONTH').AsDate := eDate;

        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;

      finally
        Free;
      end;
    Screen.Cursor := CrDefault;
    ShowMessage(srCalcFinished);
  end;
end;

procedure TA4MainForm.actRecoursesExecute(Sender: TObject);
begin
  if Not Assigned(RecoursesForm) then
    RecoursesForm := TRecoursesForm.Create(Application);
  RecoursesForm.Show;
end;

procedure TA4MainForm.actRecourseTPLExecute(Sender: TObject);
begin
  if Not Assigned(RecoursesTPLForm) then
    RecoursesTPLForm := TRecoursesTPLForm.Create(Application);
  RecoursesTPLForm.Show;
end;

procedure TA4MainForm.actReqPhotosExecute(Sender: TObject);
begin
  if Not Assigned(ReqPhotosForm) then
    ReqPhotosForm := TReqPhotosForm.Create(Application);
  ReqPhotosForm.Show;
end;

procedure TA4MainForm.actJournalExecute(Sender: TObject);
begin
  if Not Assigned(JournalForm) then
    JournalForm := TJournalForm.Create(Application);
  JournalForm.Show;
end;

procedure TA4MainForm.actLabelTypeExecute(Sender: TObject);
begin
  if Not Assigned(LabelTypeForm) then
    LabelTypeForm := TLabelTypeForm.Create(Application);
  LabelTypeForm.Show;
end;

procedure TA4MainForm.actLettersExecute(Sender: TObject);
begin
  if Not Assigned(LettersForm) then
    LettersForm := TLettersForm.Create(Application);
  LettersForm.Show;

end;

procedure TA4MainForm.actLinksExecute(Sender: TObject);
begin
  if Not Assigned(WireForm) then
    WireForm := TWireForm.Create(Application);
  WireForm.Show;
end;

procedure TA4MainForm.actChangePWDExecute(Sender: TObject);
begin
  With TChangePwdForm.Create(Application) do
  begin
    ShowModal;
  end;
end;

procedure TA4MainForm.actChannelExecute(Sender: TObject);
begin
  if Not Assigned(ChannelsForm) then
    ChannelsForm := TChannelsForm.Create(Application);
  ChannelsForm.Show;
end;

procedure TA4MainForm.actChanSourcesExecute(Sender: TObject);
begin
  if Not Assigned(ChanSourcesForm) then
    ChanSourcesForm := TChanSourcesForm.Create(Application);
  ChanSourcesForm.Show;
end;

procedure TA4MainForm.actCardsPayExecute(Sender: TObject);
begin
  if Not Assigned(fmCardsPay) then
    fmCardsPay := TfmCardsPay.Create(Application);
  fmCardsPay.Show;
end;

procedure TA4MainForm.actCardsPaySerialsExecute(Sender: TObject);
begin
  if Not Assigned(fmCardPaySerials) then
    fmCardPaySerials := TfmCardPaySerials.Create(Application);
  fmCardPaySerials.Show;
end;

procedure TA4MainForm.actCashRegReportsExecute(Sender: TObject);
var
  CashReportsDialog: TCashReportsDialog;
  HLib: THandle;
  s: string;
  OPER: string;
begin
  if FileExists(ExtractFileDir(Application.ExeName) + '\cashrgst.dll') then
  begin
    HLib := 0;
    try
      HLib := LoadLibrary('cashrgst.dll');
      if HLib > HINSTANCE_ERROR then
      begin
        CashReportsDialog := GetProcAddress(HLib, 'CashReportsDialog');
        if Assigned(CashReportsDialog) then
        begin
          OPER := dmMain.GetOperatorFIO;
          s := dmMain.CashBoxPSWD;
          CashReportsDialog(Application.Handle, PWChar(OPER), PWChar(s));

        end
        else
          ShowMessage(Format(rsErrorDll, ['cashrgst.dll']));
      end
      else
        ShowMessage(Format(rsErrorLoadDll, ['cashrgst.dll']));
    finally
      if HLib > HINSTANCE_ERROR then
        FreeLibrary(HLib);
    end;
  end
end;

procedure TA4MainForm.actLoadPaysExecute(Sender: TObject);
begin
  // TODO: ShowLoader(0);
  if not Assigned(LoaderReestrForm) then
    LoaderReestrForm := TLoaderReestrForm.Create(Application);
  LoaderReestrForm.Show;
end;

procedure TA4MainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := A4MainForm.MDIChildCount - 1 DownTo 0 Do
    if Assigned(A4MainForm.MDIChildren[i]) then
      A4MainForm.MDIChildren[i].Close;

  if FLogedRight then
    WriteSettings;

  try
    if DirectoryExists(GetTempDir + 'A4on\') then
      DeleteDir(GetTempDir + 'A4on\');
  except
    //
  end;

  if Assigned(FToolTipStack) then
  begin
    try
      FToolTipStack.Free;
    finally
      FToolTipStack := nil;
    end;
  end;
end;

procedure TA4MainForm.miUploadUpdateClick(Sender: TObject);
begin
  UploadUpdateToDB;
end;

procedure TA4MainForm.N26Click(Sender: TObject);
begin
  Screen.Cursor := CrDefault;
end;

procedure TA4MainForm.N28Click(Sender: TObject);
begin
  miPaymentType.Visible := False;
end;

procedure TA4MainForm.N38Click(Sender: TObject);
begin
  dmMain.GetScriptForUpdateDB(ChangeFileExt(Application.ExeName, '.adb'));
end;

procedure TA4MainForm.miHETypesClick(Sender: TObject);
begin
  if Not Assigned(HETypesForm) then
    HETypesForm := THETypesForm.Create(Application);
  HETypesForm.Show;
end;

procedure TA4MainForm.UpdateFromDB;
var
  SearchRec: TSearchRec;
  DateFile, DateUpdate: TDateTime;
  DTF: Extended;
  dstr: string;
begin
  // Отключено автообновление
  if dmMain.GetIniValue('NOTAUTOUPDATE') = '1' then
    Exit;

  // определение даты файла
  FindFirst(Application.ExeName, faanyfile, SearchRec);
  DateFile := SearchRec.TimeStamp;
  findclose(SearchRec);

  dstr := '';
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.text := 'SELECT NOTICE FROM BLB_GZIP WHERE BLB_ID=-111';
      Transaction.StartTransaction;
      ExecQuery;
      if not(fn('NOTICE').IsNull) then
        dstr := fn('NOTICE').AsString;
      Close;
      Transaction.Commit;
    finally
      Free;
    end;

  if dstr <> '' then
  begin
    DateUpdate := DateFile;
    if not TryStrToFloat(dstr, DTF) then
    begin
      dstr := ReplaceStr(dstr, '.', ',');
    end;
    if TryStrToFloat(dstr, DTF) then
      DateUpdate := FloatToDateTime(DTF);

    if DateUpdate > DateFile then
    begin
      if MessageDlg(rsUpdateApplication, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        DoUpdate;
    end;
  end;
end;

procedure TA4MainForm.UploadUpdateToDB;
var
  filename: string;
  dstr: string;
  CR: TCursor;
begin
  CR := Screen.Cursor;
  Screen.Cursor := CrHourGlass;
  try
    // DTF  := DateTimeToTimeStamp( Now() );
    dstr := FloatToStr(Now());
    dstr := ReplaceStr(dstr, ',', '.');
    filename := Application.ExeName;
    if FileExists(filename) then
    begin
      with TpFIBQuery.Create(Nil) do
        try
          DataBase := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          SQL.text := 'DELETE FROM BLB_GZIP WHERE BLB_ID=-111';
          Transaction.StartTransaction;
          ExecQuery;
          Close;
          Transaction.Commit;
          SQL.text := 'insert into BLB_GZIP (BLB_ID, BL_NAME, BLB_BODY, NOTICE) ' +
            ' VALUES(-111, :BL_NAME, :BLB_BODY, :NOTICE)';
          Transaction.StartTransaction;
          ParamByName('BL_NAME').AsString := ExtractFileName(Application.ExeName);
          ParamByName('NOTICE').AsString := dstr;
          ParamByName('BLB_BODY').LoadFromFile(filename);
          ExecQuery;
          Close;
          Transaction.Commit;
          DeleteFile(filename);
        finally
          Free;
        end;
    end;

    filename := 'fbclient.dll';
    if FileExists(filename) then
    begin
      with TpFIBQuery.Create(Nil) do
        try
          DataBase := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          SQL.text := 'DELETE FROM BLB_GZIP WHERE BLB_ID=-112';
          Transaction.StartTransaction;
          ExecQuery;
          Close;
          Transaction.Commit;

          SQL.text := 'insert into BLB_GZIP (BLB_ID, BL_NAME, BLB_BODY, NOTICE) ' +
            ' VALUES(-112, :BL_NAME, :BLB_BODY, :NOTICE)';
          Transaction.StartTransaction;
          ParamByName('BL_NAME').AsString := 'fbclient.dll';
          ParamByName('NOTICE').AsString := dstr;
          ParamByName('BLB_BODY').LoadFromFile(filename);
          ExecQuery;
          Close;
          Transaction.Commit;
          DeleteFile(filename);
        finally
          Free;
        end;
    end;

  finally
    Screen.Cursor := CR;
  end;
end;

procedure TA4MainForm.DoUpdate;
var
  sTmpDir, s: string;
  iFileName: String;
  iFileNameBak: String;
  iFileNameNew: String;
  CR: TCursor;
  i: Int64;
  strm: TFileStream;

begin
  CR := Screen.Cursor;
  Screen.Cursor := CrHourGlass;

  // fbclient.dll
  try
    iFileNameNew := FileGetTempName('fbclient');
    strm := TFileStream.Create(iFileNameNew, fmCreate);
    try
      with TpFIBQuery.Create(Nil) do
      begin
        try
          DataBase := dmMain.dbTV;
          Transaction := dmMain.trReadQ;
          SQL.text := 'SELECT BLB_BODY FROM BLB_GZIP WHERE BLB_ID = -112';
          Transaction.StartTransaction;
          ExecQuery;
          fn('BLB_BODY').SaveToStream(strm);
          Close;
          Transaction.Commit;
        finally
          Free;
        end;
      end;
      i := strm.Size;
    finally
      strm.Free;
    end;

    if i < 500000 then
      DeleteFile(iFileNameNew);

    if FileExists(iFileNameNew) then
    begin
      iFileName := dmMain.dbTV.LibraryName;
      iFileNameBak := iFileName + '.bak';

      if FileExists(iFileNameBak) then
      begin
        // сначала во временную, а потом удалим
        s := FileGetTempName('fbclient');
        MoveFile(PChar(iFileNameBak), PChar(s));
        DeleteFile(s);
        if FileExists(iFileNameBak) then
          DeleteFile(iFileNameBak);
      end;

      if (not FileExists(iFileNameBak)) and (MoveFile(PChar(iFileName), PChar(iFileNameBak))) then
      begin
        if CopyFile(PChar(iFileNameNew), PChar(iFileName), False) then
        begin
          DeleteFile(iFileNameNew);
        end
        else
        begin
          MoveFile(PChar(iFileNameBak), PChar(iFileName));
        end;
      end;
    end;
  finally
    //
  end;

  // a4on.exe
  try
    iFileNameNew := FileGetTempName('a4on');
    strm := TFileStream.Create(iFileNameNew, fmCreate);
    try
      with TpFIBQuery.Create(Nil) do
      begin
        try
          DataBase := dmMain.dbTV;
          Transaction := dmMain.trReadQ;
          SQL.text := 'SELECT BLB_BODY FROM BLB_GZIP WHERE BLB_ID = -111';
          Transaction.StartTransaction;
          ExecQuery;
          fn('BLB_BODY').SaveToStream(strm);
          Close;
          Transaction.Commit;
        finally
          Free;
        end;
      end;
      i := strm.Size;
    finally
      strm.Free;
    end;

    if i < 1048576 then
      DeleteFile(iFileNameNew);

    if FileExists(iFileNameNew) then
    begin
      iFileName := Application.ExeName;
      iFileNameBak := iFileName + '.bak';

      if FileExists(iFileNameBak) then
      begin
        // сначала во временную, а потом удалим
        s := FileGetTempName('a4on');
        MoveFile(PChar(iFileNameBak), PChar(s));
        DeleteFile(s);
        if FileExists(iFileNameBak) then
          DeleteFile(iFileNameBak);
      end;

      if MoveFile(PChar(iFileName), PChar(iFileNameBak)) then
      begin
        Sleep(100);
        if CopyFile(PChar(iFileNameNew), PChar(iFileName), False) then
        begin
          DeleteFile(iFileNameNew);
        end
        else
        begin
          MoveFile(PChar(iFileNameBak), PChar(iFileName));
        end;
        PostMessage(Application.Handle, WM_CLOSE, 0, 0);
        sTmpDir := dmMain.Password;
        if (Copy(sTmpDir, 1, Length(passprefix)) = passprefix) then
          sTmpDir := Copy(sTmpDir, Length(passprefix) + 1, Length(sTmpDir));
        atrCmdUtils.ShellExecute(0, 'open', iFileName, '/p:' + sTmpDir, '', SW_SHOW);
      end;
    end;
  finally
    //
  end;
  Screen.Cursor := CR;
end;

function TA4MainForm.SendSMS(const phone: string; const text: string): Boolean;
begin
  with dmMain.Query do
  begin
    try
      SQL.text :=
        'insert into MESSAGES (RECIVER, MES_HEAD, MES_TEXT, MES_TYPE) values (:RECIVER, :MES_HEAD, :MES_TEXT, :MES_TYPE);';
      ParamByName('RECIVER').AsString := phone;
      ParamByName('MES_TEXT').AsString := text;
      ParamByName('MES_HEAD').AsString := '';
      ParamByName('MES_TYPE').AsString := 'SMS';
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      Result := True;
    except
      Result := False;
    end;
  end;
end;

function TA4MainForm.TelnetQuery(const host: string; const commands: String; const EOL_CHRS: Integer = 0): string;
begin
  Result := '';
  // Окно телнета
  // Result := telnet(host, 'telnet', ReplaceStr(commands,#13#10,'\r'), EOL_CHRS, True);
end;

procedure TA4MainForm.tmrIdleCloseTimer(Sender: TObject);
begin
  tmrIdleClose.Enabled := False;
  CloseAllConnect;
  with TScreenShotForm.Create(self) do
  begin
    CreateScreenShot(imgScreen.Picture.BitMap);
    lblInfo.Caption := Format(rsIdleDisconnect, [trunc(tmrIdleClose.Interval / (60 * 60 * 1000))]);
    ShowModal;
  end;
end;

procedure TA4MainForm.tmrTaskCheckTimer(Sender: TObject);
begin
  tmrTaskCheck.Enabled := False;
  dmMain.ProceedTask('');
  tmrTaskCheck.Enabled := True;
end;

procedure TA4MainForm.CreateReportMenu;

  function findMenuItem(miParent: TMenuItem; const parentTag: Integer): TMenuItem;
  var
    i: Integer;
  begin
    Result := nil;
    for i := 0 to miParent.Count - 1 do
    begin
      if miParent.Items[i].Tag = parentTag then
      begin
        Result := miParent.Items[i];
        Exit;
      end;
      if miParent.Items[i].Count >= 1 then
        Result := findMenuItem(miParent.Items[i], parentTag);
    end;
  end;

  procedure AddMenuItem(const PARENT_ID: Integer; const miName: String; const miTag: Integer);
  var
    NewItem: TMenuItem;
    miParent: TMenuItem;
  begin
    miParent := nil;
    if PARENT_ID <> 0 then
      miParent := findMenuItem(miReports, PARENT_ID);

    if miParent = nil then
      miParent := miReports;

    NewItem := TMenuItem.Create(miParent);
    try
      NewItem.name := 'miReport' + IntToStr(miTag);
      NewItem.Caption := miName;
      NewItem.Tag := miTag;
      NewItem.onclick := miPreviewReportClick;

      miParent.Add(NewItem);
    except
      NewItem.Free;
      raise;
    end;
  end;

  procedure AddSubMenuItem(const PARENT_ID: Integer; const miName: String; const miTag: Integer);
  var
    NewItem: TMenuItem;
    miParent: TMenuItem;
  begin
    miParent := nil;
    if PARENT_ID <> 0 then
      miParent := findMenuItem(miReports, PARENT_ID);

    if miParent = nil then
      miParent := miReports;

    NewItem := NewSubMenu(miName, 0, 'miReport' + IntToStr(miTag), []);
    try
      NewItem.Tag := miTag;
      // NewItem.onclick:=Click;

      miParent.Add(NewItem);
    except
      NewItem.Free;
      raise;
    end;
  end;

var
  tr: TFIBTransaction;
begin

  with dmMain.qCommon do
  begin
    tr := Transaction;
    try
      Transaction := dmMain.trRepRead;
      SQL.text := 'select ID_REPORT, ID_PARENT, REPORT_NAME, NO_VISIBLE, LVL, IS_FILE, PATH from Get_All_Reports ' +
        ' order by IS_FILE, ID_PARENT, REPORT_NAME';
      Transaction.StartTransaction;
      ExecQuery;

      while not EOF do
      begin
        if fn('NO_VISIBLE').AsInteger = 0 then
        begin
          if fn('is_file').AsInteger = 1 then
            AddMenuItem(fn('id_parent').AsInteger, fn('report_name').AsString, fn('id_report').AsInteger)
          else
            AddSubMenuItem(fn('id_parent').AsInteger, fn('report_name').AsString, fn('id_report').AsInteger);
        end;
        Next;
      end;
    finally
      Transaction.Rollback;
      Transaction := tr;
    end;
  end;

  if dmMain.AllowedAction(rght_Reports_Designer) then
  begin
    miReports.Add(NewLine);
    miReports.Add(NewItem(rsReportManager, 0, False, True, miReportsManagerClick, 0, 'miReportsManager'));
  end;

end;

procedure TA4MainForm.miPreviewReportClick(Sender: TObject);
begin
  if (Sender is TMenuItem) then
    ShowReport((Sender as TMenuItem).Tag);
end;

procedure TA4MainForm.miReportsManagerClick(Sender: TObject);
begin
  if not Assigned(ReportDesignerForm) then
  begin
    ReportDesignerForm := TReportDesignerForm.Create(Application);
  end;
  ReportDesignerForm.Show;
end;

procedure TA4MainForm.CreateModulesMenu;
var
  NewItem: TMenuItem;
  tr: TFIBTransaction;
begin
  if dmMain.AllowedAction(rght_Modules_Exec) then
  begin
    with dmMain.qCommon do
    begin
      tr := Transaction;
      try
        Transaction := dmMain.trRepRead;
        SQL.text := 'select ID_MODULE, NAME, LANG, NOTICE from GET_MODULES_for_MENU order by name';
        Transaction.StartTransaction;
        ExecQuery;

        while not EOF do
        begin
          NewItem := TMenuItem.Create(miPlugIns);
          NewItem.name := 'miModules' + IntToStr(fn('Id_Module').AsInteger);
          NewItem.Caption := fn('Name').AsString;
          NewItem.Tag := fn('Id_Module').AsInteger;
          if not fn('NOTICE').IsNull then
            NewItem.Hint := fn('NOTICE').AsString;
          NewItem.onclick := miModuleClick;
          miPlugIns.Add(NewItem);
          Next;
        end;
      finally
        Transaction.Rollback;
        Transaction := tr;
      end;
    end;

    if (dmMain.AllowedAction(rght_Modules_edit)) then
    begin
      NewItem := TMenuItem.Create(miPlugIns);
      NewItem.Caption := '-';
      miPlugIns.Insert(miPlugIns.Count, NewItem);
      NewItem := TMenuItem.Create(miPlugIns);
      NewItem.Caption := rsModuleEditor;
      NewItem.Checked := False;
      FRunning := False;
      NewItem.onclick := miPlugInsClick;
      miPlugIns.Insert(miPlugIns.Count, NewItem);
    end;
  end
  else
    miPlugIns.Visible := False;
end;

// закроем приложение при переходе в спящий режим
procedure TA4MainForm.PowerStatusChange(var Message: TMessage);
begin
  if (message.WParam = PBT_APMSUSPEND) or (message.WParam = PBT_APMSTANDBY) then
  begin
    CloseAllConnect;
  end;
end;

procedure TA4MainForm.actMatDocExecute(Sender: TObject);
begin
  if not Assigned(MatDocsForm) then
  begin
    MatDocsForm := TMatDocsForm.Create(Application);
  end;
  MatDocsForm.Show;
end;

procedure TA4MainForm.actCloseDayExecute(Sender: TObject);
var
  b: TDateTime;
begin
  if (not dmMain.AllowedAction(rght_Calc_CLose)) then
    Exit;

  if (MessageDlg(Format(rsCloseDay, [FormatDateTime('dd mmmm', Now())]),

    mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    b := Now();
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(self) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.text := 'execute procedure Close_Day_Proc(current_date, null)';
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;

    Screen.Cursor := CrDefault;
    b := b - Now();
    ShowMessage(Format(rsCalculateComplite, [TimeToStr(b)]));
  end;

end;

procedure TA4MainForm.actEPGExecute(Sender: TObject);
begin
  if Not Assigned(EPGViewForm) then
    EPGViewForm := TEPGViewForm.Create(Application);
  EPGViewForm.Show;
end;

procedure TA4MainForm.actDVBExecute(Sender: TObject);
begin
  if Not Assigned(DVBSettinsForm) then
    DVBSettinsForm := TDVBSettinsForm.Create(Application);
  DVBSettinsForm.Show;
end;

procedure TA4MainForm.actEpgAdExecute(Sender: TObject);
begin
  if Not Assigned(EPGAdForm) then
    EPGAdForm := TEPGAdForm.Create(Application);
  EPGAdForm.Show;
end;

procedure TA4MainForm.actShippersExecute(Sender: TObject);
begin
  if Not Assigned(ShippersForm) then
    ShippersForm := TShippersForm.Create(Application);
  ShippersForm.Show;
end;

procedure TA4MainForm.actBonusesExecute(Sender: TObject);
begin
  if Not Assigned(BonusesForm) then
    BonusesForm := TBonusesForm.Create(Application);
  BonusesForm.Show;
end;

procedure TA4MainForm.actBroadcasIssuesExecute(Sender: TObject);
begin
  if not Assigned(BCIssuesForm) then
  begin
    BCIssuesForm := TBCIssuesForm.Create(Application);
  end;
  BCIssuesForm.Show;
end;

procedure TA4MainForm.actBlackListExecute(Sender: TObject);
begin
  if Not Assigned(BlackListForm) then
    BlackListForm := TBlackListForm.Create(Application);
  BlackListForm.Show;
end;

function TA4MainForm.SuspiciousDate(const vDate: TDateTime): Boolean;
var
  i: Integer;
begin
  Result := False;
  i := DaysBetween(vDate, Now());
  if ((i > 31) or (i < -31)) then
  begin
    Result := not(Application.MessageBox(PWideChar(Format(rsSuspiciousDateQuest, [FormatDateTime('dd.mm.yyyy', vDate)])
      ), PWideChar(rsSuspiciousDate), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes);
  end;
end;

procedure TA4MainForm.InitSecurity;
var
  isSYSDBA: Boolean;
  DictFull: Boolean;
begin
  DictFull := dmMain.AllowedAction(rght_Dictionary_full);
  // проверим права пользователей
  actClosePeriod.Visible := dmMain.AllowedAction(rght_Calc_CLose);
  actCloseDay.Visible := dmMain.AllowedAction(rght_Calc_CLose);
  actReturnToPreviosMonth.Visible := dmMain.AllowedAction(rght_Calc_Back);
  actRecalcPeriod.Visible := False; // dmMain.AllowedAction(rght_Calc_Recalc);
  actCallCenter.Visible := dmMain.AllowedAction(rght_CallCenter);

  // смотреть И РЕДАКТИРОВАНИЕ журнал
  actJournal.Visible := dmMain.AllowedAction(rght_Programm_ViewLog);

  // если можно настраивать систему
  actSettings.Visible := dmMain.AllowedAction(rght_Programm_Settings);

  actDVB.Visible := DictFull or (dmMain.AllowedAction(rght_DVB_edit) or dmMain.AllowedAction(rght_DVB_view));
  actChanSources.Visible := DictFull or (dmMain.AllowedAction(rght_Dictionary_Channels));
  actSatCards.Visible := DictFull or (dmMain.AllowedAction(rght_Dictionary_Channels));
  actDistributors.Visible := DictFull or (dmMain.AllowedAction(rght_Dictionary_Distributor));
  actEpgAd.Visible := DictFull or (dmMain.AllowedAction(rght_DVB_edit) or dmMain.AllowedAction(rght_DVB_view) or
    (dmMain.AllowedAction(rght_EPG_EditEvent)));
  actFreqPlan.Visible := DictFull or dmMain.AllowedAction(rght_DVB_edit) or dmMain.AllowedAction(rght_DVB_view) or
    dmMain.AllowedAction(rght_Dictionary_Channels) or dmMain.AllowedAction(rght_Dictionary_View);

  actLoadPays.Enabled := (dmMain.AllowedAction(rght_Pays_full) or dmMain.AllowedAction(rght_Pays_add) or
    dmMain.AllowedAction(rght_Pays_AddToday));
  actCashRegReports.Visible := actLoadPays.Enabled and CheckCashReg;
  actLoadServices.Enabled := (dmMain.AllowedAction(rght_Customer_full) or dmMain.AllowedAction(rght_Customer_AddSrv));
  miEvents.Visible := dmMain.AllowedAction(rght_Programm_ViewLog);

  isSYSDBA := (dmMain.User = 'SYSDBA');
  actAdminUsers.Visible := isSYSDBA;
  actAdminQuery.Visible := isSYSDBA;
  actAdminService.Visible := isSYSDBA;
  actChangePWD.Visible := (not isSYSDBA) and (dmMain.AllowedAction(rght_Programm_ChangePswd));
  miUploadUpdate.Visible := isSYSDBA;
  miAdmin.Visible := isSYSDBA;

  OpenCustomers.Visible := dmMain.CanViewCustomers;
  actNewCustomer.Visible := (not dmMain.CanViewCustomers) and (dmMain.AllowedAction(rght_Customer_add));
{$IFDEF LAN}
  actBillingAll.Visible := (dmMain.GetSettingsValue('USED_BILLING') = '1') and dmMain.AllowedAction(rght_Billing_view);
  actVLANS.Visible := True;
  actEquipmentCommands.Visible := True;
{$ELSE}
  actBillingAll.Visible := False;
  actVLANS.Visible := False;
  actEquipmentCommands.Visible := False;
{$ENDIF}
  actBroadcasIssues.Visible := DictFull or (dmMain.AllowedAction(rght_BCIssues_add) or
    dmMain.AllowedAction(rght_BCIssues_close));
  actBCItypes.Visible := DictFull or dmMain.AllowedAction(rght_BCIssuesType);
  actBCISolution.Visible := DictFull or dmMain.AllowedAction(rght_BCIssuesType);

  actLinks.Visible := DictFull or dmMain.AllowedAction(rght_Comm_Nodes) or dmMain.AllowedAction(rght_Comm_View);
  actNodes.Visible := DictFull or dmMain.AllowedAction(rght_Comm_Nodes) or dmMain.AllowedAction(rght_Comm_View);
  miNodesType.Visible := DictFull or dmMain.AllowedAction(rght_Comm_Nodes) or dmMain.AllowedAction(rght_Comm_View);
  actPortView.Visible := DictFull or dmMain.AllowedAction(rght_Comm_Equipment) or dmMain.AllowedAction(rght_Comm_View);
  actDeviceType.Visible := DictFull or dmMain.AllowedAction(rght_Comm_Equipment) or
    dmMain.AllowedAction(rght_Comm_View);
  actNFileTypes.Visible := DictFull or dmMain.AllowedAction(rght_Comm_Nodes) or dmMain.AllowedAction(rght_Comm_View);

  actFiles.Visible := dmMain.AllowedAction(rght_Customer_Files_Add) or dmMain.AllowedAction(rght_Customer_Files_Edit) or
    dmMain.AllowedAction(rght_Customer_full);

  InitSecurityDictionary;
  InitSecurityMobile;
end;

procedure TA4MainForm.InitSecurityDictionary;
var
  rFull: Boolean;
begin
  // Справочники
  rFull := dmMain.AllowedAction(rght_Dictionary_full);
  rFull := rFull or dmMain.AllowedAction(rght_Dictionary_View);

  actAttributes.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_AtrAbonents) or
    dmMain.AllowedAction(rght_Dictionary_AtrEquipments) or dmMain.AllowedAction(rght_Dictionary_AtrServices) or
    dmMain.AllowedAction(rght_Dictionary_AtrIPTV);

  actBanks.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Banks);
  actBillingAll.Visible := rFull or dmMain.AllowedAction(rght_Billing_view);
  actBlackList.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_BlacList);
  actBonuses.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Bonuses);
  actPromo.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Services);
  actBuildings.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Street);
  actChannel.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Channels);
  actDecoders.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_DigitEQP);
  actEQGroups.Visible := rFull or dmMain.AllowedAction(rght_Comm_Equipment) or dmMain.AllowedAction(rght_Comm_View);
  actEquipment.Visible := rFull or dmMain.AllowedAction(rght_Comm_Equipment) or dmMain.AllowedAction(rght_Comm_View);
  actEquipmentCommands.Visible := rFull or dmMain.AllowedAction(rght_Comm_Equipment) or
    dmMain.AllowedAction(rght_Comm_View);
  actHeadEnds.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_HeadEnd);
  actLetters.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Reports);
  actMan.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_MANUFACTURERS);
  actOrgz.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_CONTRACTORS);
  actRecourseTPL.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_RecType);
  actRequestType.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_ReqType);
  actServices.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Services);
  actShippers.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Shippers);
  actSubDiv.Visible := rFull;
  actVATGroups.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Services);
  actVLANS.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Vlans);
  actWareHouses.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Warehouses);
  actWorkers.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Workers);
  actWorkTeams.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_WorkAreas);
  actZones.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Areas);
  actFileTypes.Visible := rFull;
  actContactTypes.Visible := rFull;
  actCableType.Visible := rFull;
  actLabelType.Visible := rFull;
  actConnectType.Visible := rFull;
  actPortType.Visible := rFull;

  ActOrdersTPType.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_OrdersTPType);
  ActOrdersTP.Visible := dmMain.AllowedAction(rght_OrdersTP_full) or dmMain.AllowedAction(rght_OrdersTP_add) or
    dmMain.AllowedAction(rght_OrdersTP_edit) or dmMain.AllowedAction(rght_OrdersTP_del) or
    dmMain.AllowedAction(rght_OrdersTP_View);

  actMessages.Visible := rFull or dmMain.AllowedAction(rght_Messages_add);

  actMaterials.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Materials) or
    dmMain.AllowedAction(rght_Materials_full);

  actMatDoc.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_MatDoc_Edit) or
    dmMain.AllowedAction(rght_Materials_full);

  actPaymentSources.Visible := rFull or dmMain.AllowedAction(rght_Pays_full) or
    dmMain.AllowedAction(rght_Dictionary_PaySources);

  OpenPaymentsDoc.Visible := dmMain.AllowedAction(rght_Pays_full) or dmMain.AllowedAction(rght_Programm_ViewMoney) or
    dmMain.AllowedAction(rght_Pays_add) or dmMain.AllowedAction(rght_Pays_AddToday);

  actPayments.Visible := rFull or dmMain.AllowedAction(rght_Pays_full) or dmMain.AllowedAction(rght_Programm_ViewMoney)
    or dmMain.AllowedAction(rght_Pays_add) or dmMain.AllowedAction(rght_Pays_AddToday);

  actLoadPays.Visible := rFull or dmMain.AllowedAction(rght_Pays_full) or dmMain.AllowedAction(rght_Pays_add);

  actCardsPay.Visible := dmMain.AllowedAction(rght_Pays_full) or dmMain.AllowedAction(rght_Pays_CardsView);

  actCardsPaySerials.Visible := dmMain.AllowedAction(rght_Pays_full) or dmMain.AllowedAction(rght_Pays_CardsView) or
    dmMain.AllowedAction(rght_Dictionary_full);

  actEPG.Visible := rFull or dmMain.AllowedAction(rght_EPG_EditEvent);

  miHETypes.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_HeadEnd);
  miCompany.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Company);
  miRecourses.Visible := rFull or dmMain.AllowedAction(rght_Recourses_add) or dmMain.AllowedAction(rght_Recourses_del)
    or dmMain.AllowedAction(rght_Recourses_edit);

  actIPTVsettings.Visible := rFull or dmMain.AllowedAction(rght_IPTV_edit) or dmMain.AllowedAction(rght_IPTV_view);

  ActRequest.Visible := dmMain.AllowedAction(rght_Request_full) or dmMain.AllowedAction(rght_Request_Add) or
    dmMain.AllowedAction(rght_Request_Edit) or dmMain.AllowedAction(rght_Request_Give) or
    dmMain.AllowedAction(rght_Request_Close) or dmMain.AllowedAction(rght_Request_Del) or
    dmMain.AllowedAction(rght_Request_DateChange) or dmMain.AllowedAction(rght_Request_Close_Day) or
    dmMain.AllowedAction(rght_Request_Unclose);

  actReqPhotos.Visible := ActRequest.Visible;

  if (dmMain.GetSettingsValue('SHOW_DOC_LIST') = '1') then
    actDocList.Visible := rFull or dmMain.AllowedAction(rght_Dictionary_Doclist)
  else
    actDocList.Visible := False;
end;

procedure TA4MainForm.InitSecurityMobile;
var
  rFull: Boolean;
begin
  rFull := dmMain.AllowedAction(rght_Mobile_full);

  actMobileNews.Visible := rFull or dmMain.AllowedAction(rght_Mobile_news);
  miMobile.Visible := rFull or actMobileNews.Visible;
end;

procedure TA4MainForm.SetVisibleButtons;
var
  i: Integer;
  w: Integer;
  mapExists: Boolean;
begin
  mapExists := FileExists(ExtractFilePath(Application.ExeName) + 'miniblink.dll');
  actMap.Visible := mapExists;
  miMapDev.Visible := actMap.Visible;

  if not TryStrToInt(dmMain.GetIniValue('BUTTONS'), i) then
    i := 15;

  btnA.Visible := ((i and btnA.Tag) <> 0) and OpenCustomers.Visible;
  btnP.Visible := ((i and btnP.Tag) <> 0) and OpenPaymentsDoc.Visible;
  btnR.Visible := ((i and btnR.Tag) <> 0) and ActRequest.Visible;
  btnE.Visible := ((i and btnE.Tag) <> 0) and actEquipment.Visible;
  btnN.Visible := ((i and btnN.Tag) <> 0) and actNodes.Visible;
  btnT.Visible := ((i and btnT.Tag) <> 0) and actTaskList.Visible;

  i := 0;
  w := 0;
  if btnA.Visible then
  begin
    inc(i);
    w := w + btnA.Width;
  end;
  if btnP.Visible then
  begin
    inc(i);
    w := w + btnP.Width;
  end;
  if btnR.Visible then
  begin
    inc(i);
    w := w + btnR.Width;
  end;
  if btnE.Visible then
  begin
    inc(i);
    w := w + btnE.Width;
  end;
  if btnN.Visible then
  begin
    inc(i);
    w := w + btnN.Width;
  end;
  if btnT.Visible then
  begin
    inc(i);
    w := w + btnT.Width;
  end;

  spP.Visible := btnP.Visible;
  spR.Visible := btnR.Visible;
  spE.Visible := btnE.Visible;
  spN.Visible := btnN.Visible;
  spT.Visible := btnT.Visible;

  tbMain.Width := w + i * 5; // + i + 4;
  // pnlSearch.Width := tbMain.Width - pnlSearch.Left - pnlDate.Width - 5;
end;

procedure TA4MainForm.miRatesClick(Sender: TObject);
begin
  if Not Assigned(RatesForm) then
    RatesForm := TRatesForm.Create(Application);
  RatesForm.Show;
end;

procedure TA4MainForm.actIPTVsettingsExecute(Sender: TObject);
begin
  if Not Assigned(IPTVSettinsForm) then
    IPTVSettinsForm := TIPTVSettinsForm.Create(Application);
  IPTVSettinsForm.Show;
end;

procedure TA4MainForm.actNewCustomerExecute(Sender: TObject);
var
  i: Integer;
begin
  if not dmMain.AllowedAction(rght_Customer_add) then
    Exit;

  i := NewCustomer;
  if i > 0 then
    ShowCustomer(i, False);
end;

procedure TA4MainForm.actNFileTypesExecute(Sender: TObject);
begin
  if Not Assigned(NFileTypeForm) then
    NFileTypeForm := TNFileTypeForm.Create(Application);
  NFileTypeForm.Show;
end;

procedure TA4MainForm.actNodesExecute(Sender: TObject);
begin
  if Not Assigned(NodesForm) then
    NodesForm := TNodesForm.Create(Application);
  NodesForm.Show;
end;

procedure TA4MainForm.actFilesExecute(Sender: TObject);
begin
  if Not Assigned(CustFilesForm) then
    CustFilesForm := TCustFilesForm.Create(Application);
  CustFilesForm.Show;
end;

procedure TA4MainForm.actFileTypesExecute(Sender: TObject);
begin
  if Not Assigned(FileTypeForm) then
    FileTypeForm := TFileTypeForm.Create(Application);
  FileTypeForm.Show;
end;

procedure TA4MainForm.actFreqPlanExecute(Sender: TObject);
begin
  if not Assigned(FreqPlanForm) then
  begin
    FreqPlanForm := TFreqPlanForm.Create(Application);
  end;
  FreqPlanForm.Show;
end;

procedure TA4MainForm.actCableTypeExecute(Sender: TObject);
begin
  if Not Assigned(WireTypeForm) then
    WireTypeForm := TWireTypeForm.Create(Application);
  WireTypeForm.Show;
end;

procedure TA4MainForm.actCallCenterExecute(Sender: TObject);
begin
  if Not Assigned(CallCenterForm) then
    CallCenterForm := TCallCenterForm.Create(Application);
  CallCenterForm.Show;
end;

procedure TA4MainForm.actGPSMapExecute(Sender: TObject);
begin
  if Not Assigned(MapForm) then
    MapForm := TMapForm.Create(Application);
  MapForm.Show;
end;

procedure TA4MainForm.MakeCall(const CallType: Integer; const CallNumber: String);
var
  s: string;
begin
  if CallNumber.Trim = '' then
    Exit;

  case CallType of
    0:
      s := 'callto:';
    1:
      s := 'callto:';
    2:
      s := 'mailto:';
    3:
      s := 'skype:';
  end;

  if (s <> '') then
  begin
    atrCmdUtils.ShellExecute(Handle, 'open', PChar(s + CallNumber), '', '', SW_Normal);
  end;
end;

procedure TA4MainForm.AddAlert(const Alert: TAlertItem);
var
  s: String;
  c: TComponent;
begin
  if Alert.Tag > 0 then
  begin
    s := Format('JDA_%d', [Alert.Tag]);
    c := self.FindComponent(s);
    if Assigned(c) then
      c.Free;
  end;

  with TJvDesktopAlert.Create(self) do
  begin
    if Alert.Tag > 0 then
      Name := s;
    AutoFree := True;
    Form.Tag := Alert.Tag;
    AlertStack := FToolTipStack;
    HeaderText := Alert.title;
    MessageText := Alert.text;
    if (Alert.Color <> '') then
      Colors.WindowFrom := StringToColor(Alert.Color)
    else
      Colors.WindowFrom := clWhite;
    Colors.WindowTo := Colors.WindowFrom;

    if (Alert.FrameColor <> '') then
    begin
      Colors.CaptionFrom := StringToColor(Alert.FrameColor);
      Colors.CaptionTo := StringToColor(Alert.FrameColor);
      Colors.WindowTo := StringToColor(Alert.FrameColor);
    end;
    StyleOptions.DisplayDuration := 60 * 1000; // 60 сек
    if (not HeaderText.Contains('ответ в ВА')) then
      Options := [daoCanMove, daoCanMoveAnywhere, daoCanClose, daoCanClick]
    else
      Options := [daoCanMove, daoCanMoveAnywhere, daoCanClick];
    // daoCanClick,
    OnMessageClick := AlertClick;
    Execute(self.Handle);
  end;
end;

procedure TA4MainForm.ClearAlert(const All: Boolean = True);
var
  i: Integer;
begin
  if All then
  begin
    i := FToolTipStack.Count - 1;
    while i > 0 do
    begin
      if FToolTipStack.Items[i].Closeable then
        FToolTipStack.Items[i].Close;

      i := i - 1;
    end;
  end;
end;

procedure TA4MainForm.MakeTask(const Object_Type: string; const Object_ID: string;
  CallBackVar: TTaskCreateCallBack = nil);
begin
  NewTask(Object_Type, Object_ID, CallBackVar);
end;

procedure TA4MainForm.SearchFromTask(const Object_Type: string; const Object_ID: string);
begin
  if Object_Type = 'A' then
  begin
    cbSearchType.value := 2;
    edtSearch.text := Object_ID;
    actSearchCustomerExecute(nil);
  end
  else if Object_Type = 'R' then
  begin
    cbSearchType.value := 12;
    edtSearch.text := Object_ID;
    actSearchCustomerExecute(nil);
  end
  else if Object_Type = 'ALL_CUST' then
  begin
    ShowCustomers(100, Object_ID); // 100 = Список лицевых код
  end
  else if Object_Type = 'ALL_CUST_ADDR' then
  begin
    ShowCustomers(101, Object_ID); // 101 Код абонента
  end
  // else if Object_Type = 'P' then s := 'Платеж'
  // else if Object_Type = 'N' then s := 'Узел';
end;

procedure TA4MainForm.AlertClick(Sender: TObject);
var
  i: NativeInt;
begin
  if (Sender is TJvDesktopAlert) then
  begin
    i := (Sender as TJvDesktopAlert).Form.Tag;
    FindTask(i);
  end;
end;

procedure TA4MainForm.SearchHandle(const SearchValue: String = ''; const SearchType: Integer = 0);
var
  FindResult: Integer;
  i, search_field: Integer;
  search_text, search_word: string;

  function SetSearchField(const sw: string): Integer;
  var
    s: string;
  begin
    s := sw.ToUpper;
    if (s = rsFindContract) then
      Result := 1
    else if (s = rsFindAccount) then
      Result := 2
    else if (s = rsFindCode) then
      Result := 3
    else if (s = rsFindSurname) then
      Result := 4
    else if (s = rsFindNotice) then
      Result := 5
    else if (s = rsFindPhone) then
      Result := 6
    else if (s = rsFindStreet) then
      Result := 8
    else if (s = rsFindDigit) then
      Result := 9
    else if (s = rsFindIP) or (s = rsFindIPEng) then
      Result := 10
    else if (s = rsFindMAC) or (s = rsFindMacEng) then
      Result := 11
    else if (s = rsFindRequest) then
      Result := 12
    else if (s = rsFindTask) then
      Result := 13
    else if (s = rsFindJur) then
      Result := 15
    else
      Result := 0;
  end;

begin
  search_text := SearchValue;
  if SearchValue <> '' then
  begin
    search_word := ExtractWord(1, search_text, [' ']);
    search_field := SetSearchField(search_word);
  end;
  // проверим, может первое слово это сокращение для поиска А З и т.д.
  if search_field <> 0 then
  begin
    search_text := Trim(Copy(search_text, Length(search_word) + 2, Length(search_text)));
    cbSearchType.value := search_field;
    edtSearch.text := search_text;
  end
  else
  begin
    if (SearchType = 0) then
    begin
      if not TryStrToInt(dmMain.GetIniValue('DEFSEARCH'), search_field) then
        search_field := 0;

      if (search_field <> 0) then
        cbSearchType.value := search_field
      else
      begin
        cbSearchType.SetFocus;
        cbSearchType.DropDown();
      end;
    end
    else
      search_field := SearchType;
  end;

  if search_field = 0 then
    Exit;

  if (search_field <> 12) and (search_field <> 13) // 12 - поиск по заявке Заявка, 13 - Задача
  then
  begin
    if (search_text <> '+') then
    begin
      FindResult := ShowCustomers(search_field, search_text);
      { TODO: переделать поиск в главном окне }
      if FindResult = 0 then
      begin
        edtSearch.Color := clRed;
        edtSearch.Hint := rsNOT_FOUND_CUST;
      end
      else
        edtSearch.Color := clWindow;
      edtSearch.EditButtons[0].Visible := (FindResult = 0) and (search_field = 6) and (Length(search_text) > 4);
    end
    else
      actNewCustomer.Execute;
  end
  else
  begin
    if TryStrToInt(search_text, i) then
    begin
      if (search_field = 12) then
        ReguestExecute(i, -2, 1)
      else if (search_field = 13) then
        FindTask(i);
    end;
  end;
end;

procedure TA4MainForm.ReceiveMessage;
var
  pcd: PCopyDataStruct;
  Data: String;
  Params: TStringArray;
begin
  // В PCopyDataStruct передадим данные вида
  // БАЗА;ТИП;данные для типа
  // ТИП = P - поиск по телефону
  pcd := PCopyDataStruct(Msg.LParam);
  Msg.Result := 1;
  SetLength(Data, pcd.cbData div SizeOf(Char));
  Move(pcd.lpData^, PChar(Data)^, pcd.cbData and (not 1));

  // Data := string(pcd.lpData);

  Params := explode(';', Data);
  if (Params[0] <> UpperCase(dmMain.DataBase)) then
    Exit;
  if (Params[1] = 'P') then
  begin
    // в сообщении поиск по телефону
    SearchHandle(rsFindPhone + ' ' + Params[2], 6);
    Application.BringToFront;
  end;
end;

procedure TA4MainForm.SendMessagesToCallListiner(const alias: String = '');
var
  task: ITask;
  Data: String;
  Handle: HWnd;
begin
  // сообщение типа
  // P;хэндл окна;алиас;база;логин;пароль
  Handle := self.Handle;
  Data := 'P;' + IntToStr(Handle) + ';' + alias + ';' + dmMain.dbTV.DBName + ';' + dmMain.User + ';' +
    dmMain.dbTV.ConnectParams.Password;
  // Создаём поток поиска и если находим, то
  task := TTask.Create(
    procedure()
    var
      cData: TCopyDataStruct;
      wHandle: HWnd;
    begin
      with cData do
      begin
        DWData := 0;
        cbData := Length(Data) * SizeOf(Char);
        lpData := PChar(Data);
      end;
      wHandle := FindWindow(PChar('TA4CallListenerForm'), nil);
      if (wHandle <> 0) then
        SendMessage(wHandle, WM_COPYDATA, 0, LParam(@cData));
    end);
  // Запускаем задачу.
  task.Start;
end;

procedure TA4MainForm.LoadLang;
begin
  LanguageResourceManagerEh.ResourcePlacement := lrpEmbeddedEh;
  LanguageResourceManagerEh.LoadListOfAvailableLanguages('TEhLibLanguageConsts');
  LanguageResourceManagerEh.ActiveLanguageAbbr := 'RUS';
end;

procedure TA4MainForm.OpnenNodeByFlat(const HOUSE: Integer; const Flat: String);
begin
  if (not actNodes.Visible) then
    Exit;

  // TNodesForm.SetFilter(const FilterFIELD: Integer; const FilterVALUE: string; var FindResult: Boolean);
  if Not Assigned(NodesForm) then
    NodesForm := TNodesForm.Create(Application);
  NodesForm.SetFilter(1, IntToStr(HOUSE) + '~' + Flat);
  NodesForm.Show;
end;

procedure TA4MainForm.OpnenNodeByID(const ID: Integer);
begin
  if (not actNodes.Visible) then
    Exit;

  // TNodesForm.SetFilter(const FilterFIELD: Integer; const FilterVALUE: string; var FindResult: Boolean);
  if Not Assigned(NodesForm) then
    NodesForm := TNodesForm.Create(Application);
  NodesForm.SetFilter(2, IntToStr(ID));
  NodesForm.Show;
end;

procedure TA4MainForm.CheckAndChangePassword;
var
  i, E: Integer;
begin
  if not actChangePWD.Visible then
    Exit;

  if (not TryStrToInt(dmMain.GetSettingsValue('PSWD_EXPIRE'), i)) then
    i := 0;

  if i <= 0 then
    Exit;

  E := -1;
  with TpFIBQuery.Create(self) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Clear;
      SQL.Add('select datediff(DAY, coalesce(u.Pswd_Changed, cast(''2019-07-01'' as timestamp)), CURRENT_TIMESTAMP) as PE from Sys$User u');
      SQL.Add(Format('where u.Ibname = ''%s''', [dmMain.User]));
      Transaction.StartTransaction;
      ExecQuery;
      if (not fn('PE').IsNull) then
        E := fn('PE').AsInteger;
      Transaction.Commit;
    finally
      Free;
    end;

  if E < i then
    Exit;

  // если не меняли уже 10 дней. то заставим
  if E > (i + 10) then
    actChangePWD.Execute
  else
  begin
    if Application.MessageBox(PWideChar(rsPswdExpire), PWideChar(rsWarning), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2)
      = IDYES then
    begin
      actChangePWD.Execute
    end;
  end;

end;

procedure TA4MainForm.AppOnMessage(var Msg: TMsg; var Handled: Boolean);
begin
  case Msg.Message of
    WM_MOUSEMOVE, WM_KEYDOWN, WM_MOUSEWHEEL:
      begin
        tmrIdleClose.Enabled := False;
        tmrIdleClose.Enabled := True;
      end;
  end;
end;

procedure TA4MainForm.CloseAllConnect;
var
  i: Integer;
begin
  if dmMain.dbTV.Connected then
  begin
    for i := 0 to dmMain.dbTV.TransactionCount - 1 do
      if dmMain.dbTV.Transactions[i].InTransaction then
        dmMain.dbTV.Transactions[i].Rollback;
    dmMain.dbTV.CloseDataSets;
    dmMain.dbTV.Close;
  end;
end;

procedure TA4MainForm.CreateScreenShot(scrsht: TBitMap);
var
  DC: hDC;
begin
  DC := GetDC(HWND_DESKTOP);
  try
    scrsht.Width := self.Width;
    scrsht.Height := self.Height;
    BitBlt(scrsht.Canvas.Handle, 0, 0, scrsht.Width, scrsht.Height, DC, self.Left, self.Top, SRCCOPY);
  finally
    ReleaseDC(DC, HWND_DESKTOP);
  end;
end;

function TA4MainForm.ShowCustomers(const FilterFIELD: Integer = -1; const FilterVALUE: string = ''): Integer;
begin
  Result := CF.ShowCustomers(FilterFIELD, FilterVALUE);
end;

procedure TA4MainForm.ExportDBGrid(const aDBGrid: TDBGridEh; const aFileName: string);
var
  ExpClass: TDBGridEhExportClass;
  Ext: String;
begin
  // Экспорт информации
  if (not dmMain.AllowedAction(rght_Export)) then
    Exit;

  A4MainForm.SaveDialog.filename := aFileName;
  if (aDBGrid is TDBGridEh) then
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
        6:
          begin
            ExpClass := TDBGridEhExportAsXlsx;
            Ext := 'xlsx';
          end;
      else
        ExpClass := nil;
        Ext := '';
      end;
      if ExpClass <> nil then
      begin
        if AnsiUpperCase(Copy(A4MainForm.SaveDialog.filename, Length(A4MainForm.SaveDialog.filename) - 2, 3)) <>
          AnsiUpperCase(Ext) then
          A4MainForm.SaveDialog.filename := A4MainForm.SaveDialog.filename + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass, aDBGrid, A4MainForm.SaveDialog.filename, False);
      end;
    end;
end;

procedure TA4MainForm.CopyDBGrid(const aDBGrid: TDBGridEh; const ForWholeGrid: Boolean = False);
begin
  if (not dmMain.AllowedAction(rght_Export)) then
    Exit;

  DBGridEh_DoCopyAction(aDBGrid, ForWholeGrid);
end;

procedure TA4MainForm.OpenCustomerWithData(const aCustomer: Integer; const TabType: Integer; const DataValue: string);
var
  finded: Integer;
  i: Integer;
begin
  ShowCustomer(aCustomer);
  finded := -1;
  for i := MDIChildCount - 1 DownTo 0 Do
  begin
    if Assigned(MDIChildren[i]) then
      if (MDIChildren[i] is TCustomerForm) then
      begin
        if (MDIChildren[i].Tag = aCustomer) then
          finded := i;
      end;
  end;
  if finded >= 0 then
  begin
    (MDIChildren[finded] as TCustomerForm).FindDataOnTab(TabType, DataValue);
  end;
end;

function TA4MainForm.OpenRequest(const rq_id: Integer): Boolean;
begin
  Result := (ReguestExecute(rq_id, -2, 1) >= 0);
end;

function TA4MainForm.ParseCaptured(const _scanName: string; scResult: TStringList): Boolean;
var
  Start: TStartUpInfo;
  procInfo: TProcessInformation;
  tmp: THandle;
  tmpSec: TSecurityAttributes;
  res: TStringList;
  return: Cardinal;
  TmpFile, vdirName, _exeName, _cmdLine: string;
begin
  vdirName := ExtractFilePath(Application.ExeName);
  _exeName := 'smartid\smartid.exe';
  _cmdLine := 'smartid\passport_rf.zip';
  if (not FileExists(vdirName + _exeName)) or (not FileExists(vdirName + _cmdLine)) then
  begin
    Result := False;
    Exit;
  end;

  _cmdLine := '"' + _scanName + '" ' + _cmdLine;
  TmpFile := _scanName + '.tmp';
  Result := False;
  try
    FillChar(tmpSec, SizeOf(tmpSec), #0);
    tmpSec.nlength := SizeOf(tmpSec);
    tmpSec.binherithandle := True;
    tmp := CreateFile(PChar(TmpFile), Generic_Write, File_Share_Write, @tmpSec, Create_Always,
      File_Attribute_Normal, 0);
    try
      FillChar(Start, SizeOf(Start), #0);
      Start.cb := SizeOf(Start);
      Start.hStdOutput := tmp;
      Start.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
      Start.wShowWindow := SW_Minimize;
      { Start the program }
      if CreateProcess(nil, PChar(_exeName + ' ' + _cmdLine), nil, nil, True, 0, nil, PChar(vdirName), Start, procInfo)
      then
      begin
        SetPriorityClass(procInfo.hProcess, Idle_Priority_Class);
        WaitForSingleObject(procInfo.hProcess, Infinite);
        GetExitCodeProcess(procInfo.hProcess, return);
        Result := (return = 0);
        CloseHandle(procInfo.hThread);
        CloseHandle(procInfo.hProcess);
        CloseHandle(tmp);
        res := TStringList.Create;
        try
          res.LoadFromFile(TmpFile, TEncoding.UTF8);
          scResult.AddStrings(res);
        finally
          res.Free;
        end;
        DeleteFile(PChar(TmpFile));
      end
      else
      begin
        Application.MessageBox(PChar(SysErrorMessage(GetLastError())), 'RunCaptured Error', MB_OK);
      end;
    except
      CloseHandle(tmp);
      DeleteFile(PChar(TmpFile));
      raise;
    end;
  finally
  end;
end;

end.
