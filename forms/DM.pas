unit DM;

{$I defines.inc}

interface

uses
  Winapi.Windows,
  System.SysUtils, System.Classes, System.UITypes, System.Variants, System.Types,
  Data.DB,
  Vcl.ImgList, Vcl.Dialogs,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBErrorHandler, FIBDatabase, FIB, pFIBDatabase, OverbyteIcsWndControl,
  MemTableDataEh, frxDMPExport, frxGradient, frxOLE, frxRich, frxChart, frxChBox, frxDCtrl, frxCross, frxExportText,
  frxExportHTML, frxExportMail, frxExportImage, frxExportXML, frxExportODF, frxExportRTF, frxExportPDF, frxExportBIFF,
  frxExportXLS, frxExportTXT, frxExportCSV, frxClass, frxExportDBF, frxExportDOCX, frxExportXLSX, frxExportHTMLDiv,
  frxExportPPTX,
  MemTableEh, DataDriverEh, pFIBDataDriverEh, frxDesgn, frxADOComponents, frxFIBComponents, frxBarcode, frxDBSet,
  JclLocales,
{$IFDEF USE_ZEOS}
  frxZeosComponents,
{$ENDIF}
  PrjConst, frxExportSVG, PropStorageEh, A4onTypeUnit, frxGZip, frxTableObject, frxZipCode, frxCellularTextObject,
  frxMap,
  frxGaugeView, frxPDFViewer;

type
  TCallBack = procedure of object;
  TTaskCreateCallBack = procedure(const TaskID: Integer) of object;

  TdmMain = class(TDataModule)
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dbTV: TpFIBDatabase;
    dsSettings: TpFIBDataSet;
    Query: TpFIBQuery;
    trReadQ: TpFIBTransaction;
    trWriteQ: TpFIBTransaction;
    dsCompany: TpFIBDataSet;
    FibErrorHandler: TpFibErrorHandler;
    trReadCustomer: TpFIBTransaction;
    srcSrvTypes: TDataSource;
    qRead: TpFIBQuery;
    fddReport: TpFIBDataDriverEh;
    mtReportsTree: TMemTableEh;
    fdsLoadReport: TpFIBDataSet;
    qCommon: TpFIBQuery;
    fdsReport: TpFIBDataSet;
    trRepRead: TpFIBTransaction;
    trRepWrite: TpFIBTransaction;
    frxCrossObject1: TfrxCrossObject;
    frxDialogControls1: TfrxDialogControls;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxRichObject1: TfrxRichObject;
    frxOLEObject1: TfrxOLEObject;
    frxGradientObject1: TfrxGradientObject;
    frxDotMatrixExport1: TfrxDotMatrixExport;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxADOComponents1: TfrxADOComponents;
    frxmdsCompany: TfrxDBDataset;
    frxModalReport: TfrxReport;
    mdsCompany: TMemTableEh;
    dsmSrvTypes: TMemTableEh;
    iniPropStorage: TIniPropStorageManEh;
    dsFindCN: TpFIBDataSet;
    trReadFind: TpFIBTransaction;
    frxGaugeObject1: TfrxGaugeObject;
    frxMapObject1: TfrxMapObject;
    frxReportCellularTextObject1: TfrxReportCellularTextObject;
    frxZipCodeObject1: TfrxZipCodeObject;
    frxReportTableObject1: TfrxReportTableObject;
    frxGZipCompressor1: TfrxGZipCompressor;
    frxPDFObject1: TfrxPDFObject;
    frxFIBComponents1: TfrxFIBComponents;
    procedure DataModuleDestroy(Sender: TObject);
    procedure dbTVAfterDisconnect(Sender: TObject);
    procedure FormStorage1SavePlacement(Sender: TObject);
    procedure FibErrorHandlerFIBErrorEvent(Sender: TObject; ErrorValue: EFIBError; KindIBError: TKindIBError;
      var DoRaise: Boolean);
    function frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure frxAddFunctions(Report: TfrxReport);
    procedure DataModuleCreate(Sender: TObject);
    procedure frxDesignerShow(Sender: TObject);
    procedure dbTVAfterConnect(Sender: TObject);
    procedure frxModalReportPreview(Sender: TObject);
  private
    { Private declarations }
    fLicRec: Integer;
    fSuperMode: Integer;
    // режим отображения абонентов -1 - режим отключен 0 - все 1 - скрыть абонентов
    FRightsList: TStringList;
    FPersonalData: Boolean;
    FUserGroups: TStringList;
    FSettingsList: TStringList;
    FA4onList: TStringList;
    fCurrentMonth: TDateTime;
    fUserAreas: string;
    fCashBoxPSWD: String;
    fTelNetAnswer: TStrings; // Ответ от telnet запросов
    FNeedDelExport: Boolean;
    FKeyboradLocalesList: TJclKeyboardLayoutList;
    FSavedKL: HKL;
    FCanViewCustomers: Integer;
    FTaskProceed: Boolean;
    FTaskLastTimeCheck: TDateTime;
    FUserFIO: String;
    FDBAlias: String;
    FInStrictMode: Boolean;
    procedure Company2MemDS(aDS: TDataSet);
    procedure GetRightsFromDB;
    procedure SetCurrentMonth(Value: TDateTime);
    procedure SetSuperMode(Value: Integer);
    function GetServer: String;
    function GetDatabase: String;
    function GetUser: String;
    function GetUserGroups: String;
    function GetPassword: String;
    function GetCashBoxPSWD: String;
    function GetClientLib: String;
    function GetUserAreas: String;
    function GetDBName: String;
    procedure CreateKL;
    function FindCustomerSQL(const SQL: string; const NODE_SQL: string = ' 1=2 '): TCustomerInfo;
    function GetCompanyCountry: String;
    function GetCompanyName: String;
    procedure GetCompany;
    procedure CheckFirebirdVersion;
    function CheckAdminUser: Boolean;
    function FrSHA256(const Str: String): string;
  public
    { Public declarations }
    frxChartObject1: TfrxChartObject;
    frxBIFFExport: TfrxBIFFExport;
    frxBMPExport: TfrxBMPExport;
    frxCSVExport: TfrxCSVExport;
    frxDBFExport: TfrxDBFExport;
    frxHTMLExport: TfrxHTMLExport;
    frxJPEGExport: TfrxJPEGExport;
    frxMailExport: TfrxMailExport;
    frxODSExport: TfrxODSExport;
    frxODTExport: TfrxODTExport;
    frxPDFExport: TfrxPDFExport;
    frxRTFExport: TfrxRTFExport;
    frxTXTExport: TfrxTXTExport;
    frxXLSExport: TfrxXLSExport;
    frxXMLExport: TfrxXMLExport;
    frxSVGExport: TfrxSVGExport;
    frxDOCXExport: TfrxDOCXExport;
    frxPPTXExport: TfrxPPTXExport;
    frxXLSXExport: TfrxXLSXExport;
    frxHTML5Div: TfrxHTML5DivExport;
    frxTIFFExport: TfrxTIFFExport;
    frxSimpleExp: TfrxSimpleTextExport;
{$IFDEF USE_ZEOS}
    frxzscmpnts1: TfrxZeosComponents;
{$ENDIF}
    frxDesigner: TfrxDesigner;
    property LICREC: Integer read fLicRec;
    property SuperMode: Integer read fSuperMode write SetSuperMode;
    property Server: string read GetServer;
    property DBName: string read GetDBName;
    property DBAlias: string read FDBAlias write FDBAlias;
    property Database: string read GetDatabase;
    property User: string read GetUser;
    property UserIsAdmin: Boolean read CheckAdminUser;
    property UserGroups: string read GetUserGroups;
    property UserFio: string read FUserFIO;
    property Password: string read GetPassword;
    property CashBoxPSWD: string read GetCashBoxPSWD;
    property ClientLib: string read GetClientLib;
    property UserAreas: string read GetUserAreas;
    property CompanyCountry: string read GetCompanyCountry;
    property CompanyName: string read GetCompanyName;
    property InStrictMode: Boolean read FInStrictMode;
    property CurrentMonth: TDateTime read fCurrentMonth write SetCurrentMonth;
    function GetRecordsCount(const aTableName, aWhereStr: String): Integer;
    function GetSettingsValue(const aSettingName: string): Variant;
    function GetCompanyValue(const aSettingName: string): Variant;
    function AllowedAction(const aRightsID: Integer): Boolean;
    procedure SetIniValue(const aSettingName: string; const aSettingValue: string);
    function GetIniValue(const aSettingName: string): string;
    procedure ClearSetings;
    // расчет пени абоненту
    function GetCustomerFine(const aCUSTOMER_ID: Integer; const aPayDate: TDateTime): Extended;
    function FindCustomer(const lic: string; const code: string; id: Integer; const FindNode: Integer = 0)
      : TCustomerInfo;
    function FindCustomerAtAdress(HOUSE_ID: Integer; const Flat: string; const FindNode: Integer = 0;
      const porch: string = ''; const floor: string = ''): TCustomerInfo;
    function GetNextIP(InetIP: Boolean; const mask: string = ''): string;
    function GetNextVlanIP(const id: Integer; const itsVlan: Boolean): string;
    function GetOperatorFIO: String;
    function GenerateBarCodeFromFormat(const FORMAT, ACCOUNT: string; const DEBT: Currency; const id: Integer;
      const UL, HOUSE, Flat, FIO: string): string;
    function GenerateDogNumber(const HOUSE_ID: Integer; const Flat: string; const SRV_ID: Integer): string;
    function GenerateDogNumberForCustomer(const CUSTOMER_ID: Integer; const SRV_ID: Integer): string;
    function GenerateDogNumberFromFormat(const FORMAT: string; const HOUSE_ID: Integer; const Flat: string;
      const SRV_ID: Integer): string;
    function GenerateBarCode(const ACCOUNT: string; const DEBT: Currency; const id: Integer;
      const UL, HOUSE, Flat, FIO: string): string;
    function ParseBarCode(const barcode: string; var id: Integer; var ACCOUNT: string; var SUM: Currency): Boolean;
    function GetScriptForUpdateDB(const FileName: string): Integer;
    procedure InitData;
    function GetSingleSqlResult(const vSql: string): Variant;
    function GET_ID_REPORT_BY_PATH(PATH: string): Integer;
    procedure GlobalInitReport(Report: TfrxReport);
    procedure LoadWeekFromA4onTV(const FileName: String);
    procedure LoadChannelsFromA4onTV(const FileName: String);
    procedure SaveKLAndSelectEnglish;
    procedure RestoreKL;
    function CanViewCustomers: Boolean;
    function GetServerDateTime: TDateTime;
    procedure ProceedTask(const EventName: String);
    function IpInfo(const ip: String; const vlan_id: Integer = -1): String;
    procedure RefreshCompanyData;
  end;

var
  dmMain: TdmMain;

implementation

uses
  System.StrUtils, System.Rtti,
  pFIBProps, AtrStrUtils, RxStrUtils, pFIBExtract, LibMoney, httpsend, synautil, ZLibExGZ,
  JsonDataObjects, mormot.crypt.core, synacode,
  SelectOneForma, MAIN;

{$R *.dfm}

procedure PackBuffer(var Buffer: PChar; var BufSize: LongInt);
var
  srcStream, dstStream: TStream;
begin
  dstStream := TMemoryStream.Create;
  try
    srcStream := TMemoryStream.Create;
    try
      srcStream.WriteBuffer(Buffer^, BufSize);
      srcStream.Position := 0;
      frxCompressStream(srcStream, dstStream, gzDefault, '');
    finally
      srcStream.Free;
    end;
    BufSize := dstStream.Size;
    dstStream.Position := 0;
    ReallocMem(Buffer, BufSize);
    dstStream.ReadBuffer(Buffer^, BufSize);
  finally
    dstStream.Free;
  end;
end;

procedure UnpackBuffer(var Buffer: PChar; var BufSize: LongInt);
var
  srcStream, dstStream: TStream;
begin
  dstStream := TMemoryStream.Create;
  try
    srcStream := TMemoryStream.Create;
    try
      srcStream.WriteBuffer(Buffer^, BufSize);
      srcStream.Position := 0;
      frxDecompressStream(srcStream, dstStream);
    finally
      srcStream.Free;
    end;
    BufSize := dstStream.Size;
    dstStream.Position := 0;
    ReallocMem(Buffer, BufSize);
    dstStream.ReadBuffer(Buffer^, BufSize);
  finally
    dstStream.Free;
  end;
end;

procedure TdmMain.GetCompany;
begin
  dsCompany.Open;
  Company2MemDS(dsCompany);
  frxmdsCompany.DataSet := mdsCompany;
  dsCompany.Close;
end;

procedure TdmMain.InitData;
var
  CPSWD: string;
begin
  if not dbTV.Connected then
  begin
    ShowMessage(rsERROR_DB_COONECT);
    Halt(1);
  end;

  // trRead.Active := true;
  // trWrite.Active := true;
  // trReadQ.Active := true;
  // trWriteQ.Active := true;

  GetSettingsValue('ReloadSettingsFromDB');
  GetCompany;
  GetRightsFromDB;

  dsmSrvTypes.Open;
  dsmSrvTypes.EmptyTable;
  qRead.SQL.text := 'select o.o_id, o.o_name, o.o_description from objects o ';
  qRead.SQL.Add(' where o.o_type = 15 and o.o_deleted = 0 order by o.o_name');
  qRead.Transaction.StartTransaction;
  qRead.ExecQuery;
  // Прочитаем типы услуг
  while not qRead.Eof do
  begin
    dsmSrvTypes.append;
    dsmSrvTypes['ID'] := qRead.FN('O_ID').AsInteger;
    dsmSrvTypes['NAME'] := qRead.FN('O_NAME').AsString;
    dsmSrvTypes['DESCRIPTION'] := qRead.FN('O_DESCRIPTION').AsString;
    dsmSrvTypes.Post;
    qRead.Next;
  end;
  dsmSrvTypes.append;
  dsmSrvTypes['ID'] := -1;
  dsmSrvTypes['NAME'] := 'Любой вид';
  dsmSrvTypes['DESCRIPTION'] := 'Любой вид услуг';
  dsmSrvTypes.Post;
  qRead.Close;
  qRead.Transaction.Commit;

  if (dmMain.AllowedAction(rght_Reports_Designer)) then
  begin
    frxDesigner := TfrxDesigner.Create(self);
    frxDesigner.OnShow := frxDesignerShow;
  end;
  FPersonalData := (not dmMain.AllowedAction(rght_Customer_PersonalData));
  // пароль для работы с кассой или из настроек или из базы
  CPSWD := GetIniValue('CASHBOXPSWD');
  if CPSWD <> '' then
    fCashBoxPSWD := CPSWD
  else
    fCashBoxPSWD := Copy(dbTV.ConnectParams.Password, 3, 255);

  GlobalInitReport(frxModalReport);
  // прочитаем задачи
  ProceedTask('START_A4ON');
end;

procedure TdmMain.ClearSetings;
begin
  FSettingsList.Clear;
end;

procedure TdmMain.SetIniValue(const aSettingName: string; const aSettingValue: string);
begin
  FSettingsList.Values[AnsiUpperCase(aSettingName)] := aSettingValue;
end;

function TdmMain.GetIniValue(const aSettingName: string): string;
begin
  Result := FSettingsList.Values[AnsiUpperCase(aSettingName)];
end;

function TdmMain.FindCustomerSQL(const SQL: string; const NODE_SQL: string = ' 1=2 '): TCustomerInfo;
var
  selected: Boolean;
begin
  Result.CUSTOMER_ID := -1;

  dsFindCN.ParamByName('FILTER').Value := SQL;
  dsFindCN.ParamByName('filter_node').Value := NODE_SQL;
  if (dmMain.GetSettingsValue('RQ_PHONE_ONLY_NOTYFY') = '1') then
    dsFindCN.ParamByName('ONLY_NOTYFY').Value := ' and cc.CC_NOTIFY = 1 '
  else
    dsFindCN.ParamByName('ONLY_NOTYFY').Value := ' ';

  dsFindCN.Open;
  selected := False;
  if dsFindCN.RecordCount > 0 then
  begin
    if dsFindCN.RecordCount > 1 then
    begin
      with TSelectOneForm.Create(self) do
      begin
        srcSelect.DataSet := dsFindCN;
        selected := (ShowModal = mrOk);
        Free;
      end;
    end
    else
      selected := true;
  end;

  if selected then
  begin
    with Result do
    begin
      CUSTOMER_ID := dsFindCN.FN('CUSTOMER_ID').AsInteger;
      cust_code := dsFindCN.FN('cust_code').AsString;
      Account_No := dsFindCN.FN('Account_No').AsString;
      CUST_STATE_DESCR := dsFindCN.FN('CUST_STATE_DESCR').AsString;

      if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
        Debt_sum := -1 * dsFindCN.FN('Debt_sum').AsCurrency
      else
        Debt_sum := dsFindCN.FN('Debt_sum').AsCurrency;

      FIO := dsFindCN.FN('FIO').AsString;
      STREET_ID := dsFindCN.FN('street_ID').AsInteger;
      STREET := dsFindCN.FN('STREET').AsString;
      HOUSE_ID := dsFindCN.FN('HOUSE_ID').AsInteger;
      HOUSE_no := dsFindCN.FN('House_No').AsString;
      FLAT_NO := dsFindCN.FN('FLAT_No').AsString;
      phone_no := dsFindCN.FN('phone_no').AsString.Trim([',', ' ']);
      notice := dsFindCN.FN('notice').AsString;
      color := dsFindCN.FN('HIS_COLOR').AsString;
      porch_n := dsFindCN.FN('PORCH_N').AsString;
      floor_n := dsFindCN.FN('FLOOR_N').AsString;
      mobile := dsFindCN.FN('MOBILE').AsString.Trim([',', ' ']);
      mobile_wn := dsFindCN.FN('MOBILE_WN').AsString;
      City := dsFindCN.FN('City').AsString;
      email := dsFindCN.FN('email').AsString;
      if dsFindCN.FN('O_TYPE').AsString = 'А' then
      begin
        isType := 0;
        INN := dsFindCN.FN('JUR_INN').AsString;
        isJur := dsFindCN.FN('Juridical').AsInteger;
      end
      else
      begin
        isType := 1;
        INN := '';
        isJur := 0;
      end;

      if (isJur = 0) and (not FPersonalData) then
        FIO := HideSurname(FIO);
    end;
  end;
  dsFindCN.Close;
end;

function TdmMain.FindCustomerAtAdress(HOUSE_ID: Integer; const Flat: string; const FindNode: Integer = 0;
  const porch: string = ''; const floor: string = ''): TCustomerInfo;
var
  where, tmp: string;
  filter_node: string;
begin
  Result.CUSTOMER_ID := -1;
  if FindNode < 1 then
  begin
    where := ' C.House_Id = ' + IntToStr(HOUSE_ID);
    if Flat <> '' then
      where := where + ' and  c.flat_no = ''' + Flat + '''';

    if ((porch <> '') or (floor <> '')) then
    begin
      tmp := ' and exists(select hf.Flat_No from Houseflats hf where hf.Flat_No = c.flat_no and hf.House_Id = ' +
        IntToStr(HOUSE_ID);
      if porch <> '' then
        tmp := tmp + ' and  hf.Porch_N = ''' + porch + '''';

      if floor <> '' then
        tmp := tmp + ' and  hf.FLOOR_N = ''' + floor + '''';

      tmp := tmp + ')';
      where := where + tmp;
    end;

    if dmMain.UserAreas <> '' then
      tmp := ' ( exists(select h.house_id from house h ' + rsEOL + ' inner join workgroups wg on (h.wg_id = wg.wg_id) '
        + rsEOL + ' inner join workarea wa on (wg.wa_id = wa.wa_id) where C.House_Id = h.house_id and wa.WA_ID in (' +
        dmMain.UserAreas + '))) and '
    else
      tmp := '';
    where := tmp + ' ( ' + where + ' ) ';
  end
  else
    where := ' 1=2 ';

  if (FindNode = -1) or (FindNode = 1) then
  begin

    filter_node := ' C.House_Id = ' + IntToStr(HOUSE_ID);
    if Flat <> '' then
      filter_node := filter_node + ' and  c.place = ''' + Flat + '''';

    if porch <> '' then
      filter_node := filter_node + ' and  c.PORCH_N = ''' + porch + '''';

    if floor <> '' then
      filter_node := filter_node + ' and  c.FLOOR_N = ''' + floor + '''';

    if dmMain.UserAreas <> '' then
      tmp := ' ( exists(select h.house_id from house h ' + rsEOL + ' inner join workgroups wg on (h.wg_id = wg.wg_id) '
        + rsEOL + ' inner join workarea wa on (wg.wa_id = wa.wa_id) where C.House_Id = h.house_id and wa.WA_ID in (' +
        dmMain.UserAreas + '))) and '
    else
      tmp := '';
    filter_node := tmp + ' ( ' + filter_node + ' ) ';
  end
  else
    filter_node := ' 1=2 ';

  Result := FindCustomerSQL(where, filter_node);
end;

// Ищем абонета или узел
// FindNode
// -1 и абонента и узел
// 0 только абонента
// 1 только узел
function TdmMain.FindCustomer(const lic: string; const code: string; id: Integer; const FindNode: Integer = 0)
  : TCustomerInfo;
var
  where, tmp: string;
  filter_node: string;
begin
  Result.CUSTOMER_ID := -1;

  if FindNode < 1 then
  begin
    if code <> '' then
      where := ' cust_code = ''' + code + '''';
    if lic <> '' then
      where := ' account_no = ''' + lic + '''';
    if id > -1 then
      where := ' customer_id = ' + IntToStr(id);
    if where = '' then
    begin
      exit;
    end;

    if dmMain.UserAreas <> '' then
      tmp := ' ( exists(select h.house_id from house h ' + rsEOL + ' inner join workgroups wg on (h.wg_id = wg.wg_id) '
        + rsEOL + ' inner join workarea wa on (wg.wa_id = wa.wa_id) where C.House_Id = h.house_id and wa.WA_ID in (' +
        dmMain.UserAreas + '))) and '
    else
      tmp := '';
    where := tmp + ' ( ' + where + ' ) ';
  end
  else
    where := ' 1=2 ';

  if (FindNode = -1) or (FindNode = 1) then
  begin

    if id > -1 then
      filter_node := ' c.node_id = ' + IntToStr(id);

    if dmMain.UserAreas <> '' then
      tmp := ' ( exists(select h.house_id from house h ' + rsEOL + ' inner join workgroups wg on (h.wg_id = wg.wg_id) '
        + rsEOL + ' inner join workarea wa on (wg.wa_id = wa.wa_id) where h.house_id = C.House_Id and wa.WA_ID in (' +
        dmMain.UserAreas + '))) and '
    else
      tmp := '';
    filter_node := tmp + ' ( ' + filter_node + ' ) ';
  end
  else
    filter_node := ' 1=2 ';

  Result := FindCustomerSQL(where, filter_node);
end;

procedure TdmMain.SetSuperMode(Value: Integer);
begin
  fSuperMode := Value;
end;

procedure TdmMain.SetCurrentMonth(Value: TDateTime);
begin
  fCurrentMonth := Value;
end;

function TdmMain.GetOperatorFIO: String;
var
  s: string;
begin
  s := '';
  with TpFIBQuery.Create(Nil) do
    try
      Database := dbTV;
      Transaction := trReadQ;
      SQL.text :=
        'select w.surname||'' ''||Coalesce(w.firstname,'''')||'' ''||Coalesce(w.midlename,'''')||'' '' as FIO from worker w where w.ibname = CURRENT_USER';
      Transaction.StartTransaction;
      ExecQuery;
      if not Eof then
        s := FieldByName('FIO').Value;

      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  Result := s;
end;

// Функция создания списка прав пользователя
procedure TdmMain.GetRightsFromDB;
var
  LOCKEDOUT: Boolean;
  setting_pass: string;
begin
{$IFDEF WITHRIGHTS}
  // Если юзер блокирован. выйдем из системы
  if GetUser.ToUpper <> 'SYSDBA' then
  begin
    with TpFIBQuery.Create(Nil) do
    begin
      try
        Database := dbTV;
        Transaction := trReadQ;
        SQL.text := 'select coalesce(u.LOCKEDOUT, 0) as LOCKEDOUT';
        SQL.Add(', coalesce(w.Surname || coalesce('' '' || w.Firstname || coalesce('' '' || w.Midlename, ''''), ''''), u.IBNAME) FIO');
        SQL.Add('from sys$user u left outer join Worker W on (u.Ibname = w.Ibname)');
        SQL.Add('where u.ibname  = CURRENT_USER');

        Transaction.StartTransaction;
        ExecQuery;
        LOCKEDOUT := (FieldByName('LOCKEDOUT').Value = 1);
        FUserFIO := FieldByName('FIO').AsString;
        Close;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
    FNeedDelExport := False;
  end
  else
  begin
    LOCKEDOUT := False;
    FNeedDelExport := true;
    FUserFIO := 'SYSDBA';
  end;

  if LOCKEDOUT then
  begin
    ShowMessage(rsUSER_BLOCKED);
    dbTV.CloseDataSets;
    dbTV.Close;
    Halt;
  end;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dbTV;
      Transaction := trReadQ;
      SQL.Clear;
      SQL.Add('select distinct coalesce(gr.Right_Id, -999) Right_Id                 ');
      SQL.Add('  from sys$user u                                                    ');
      SQL.Add('       inner join sys$user_groups ug on (u.id = ug.user_id)          ');
      SQL.Add('       inner join sys$group_rights gr on (ug.group_id = gr.group_id) ');
      SQL.Add('       inner join sys$group g on (ug.group_id = g.id)                ');
      SQL.Add('  where (g.lockedout = 0)                                            ');
      SQL.Add('        and coalesce(gr.rights_type,0)=0                             ');
      SQL.Add('        and u.ibname = current_user                                  ');
      Transaction.StartTransaction;
      ExecQuery;
      while not Eof do
      begin
        FRightsList.Add(FieldByName('Right_Id').Value);
        if (FieldByName('Right_Id').AsInteger = rght_Export) then
          FNeedDelExport := true;
        Next;
      end;
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  end;

  FUserGroups.Clear;
  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dbTV;
      Transaction := trReadQ;
      SQL.Clear;
      SQL.Add('select distinct coalesce(ug.group_id, -999) group_id                 ');
      SQL.Add('  from sys$user u                                                    ');
      SQL.Add('       inner join sys$user_groups ug on (u.id = ug.user_id)          ');
      SQL.Add('       inner join sys$group g on (ug.group_id = g.id)                ');
      SQL.Add('  where (g.lockedout = 0)                                            ');
      SQL.Add('        and u.ibname = current_user                                  ');
      Transaction.StartTransaction;
      ExecQuery;
      while not Eof do
      begin
        FUserGroups.Add(FieldByName('group_id').Value);
        Next;
      end;
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  end;

  if FNeedDelExport then
  begin
    frxTXTExport := TfrxTXTExport.Create(self);
    frxCSVExport := TfrxCSVExport.Create(self);
    frxBMPExport := TfrxBMPExport.Create(self);
    frxHTMLExport := TfrxHTMLExport.Create(self);
    frxXLSExport := TfrxXLSExport.Create(self);
    frxRTFExport := TfrxRTFExport.Create(self);
    frxRTFExport.Creator := rsWWW;
    frxPDFExport := TfrxPDFExport.Create(self);
    frxPDFExport.Creator := rsWWW;
    frxPDFExport.Subject := 'A4on.TV PDF export';
    frxBIFFExport := TfrxBIFFExport.Create(self);
    frxDBFExport := TfrxDBFExport.Create(self);
    frxJPEGExport := TfrxJPEGExport.Create(self);
    frxMailExport := TfrxMailExport.Create(self);
    frxODSExport := TfrxODSExport.Create(self);
    frxODSExport.Creator := rsWWW;
    frxODTExport := TfrxODTExport.Create(self);
    frxODTExport.Creator := setting_pass;
    frxXMLExport := TfrxXMLExport.Create(self);
    frxXMLExport.Creator := rsWWW;

    frxDOCXExport := TfrxDOCXExport.Create(self);
    frxPPTXExport := TfrxPPTXExport.Create(self);
    frxXLSXExport := TfrxXLSXExport.Create(self);
    frxHTML5Div := TfrxHTML5DivExport.Create(self);
    frxTIFFExport := TfrxTIFFExport.Create(self);
    frxSimpleExp := TfrxSimpleTextExport.Create(self);
    frxSVGExport := TfrxSVGExport.Create(self);
  end;
{$ENDIF}
end;

function TdmMain.AllowedAction(const aRightsID: Integer): Boolean;
begin
  if (dbTV.ConnectParams.UserName.ToUpper <> 'SYSDBA') then
  begin
    Result := (FRightsList.IndexOf(IntToStr(aRightsID)) >= 0);
  end
  else
  begin
    // исключим ограничивающие права для SYSDBA
    Result := true and (not(aRightsID in [rght_Customer_View, rght_Customer_Only_ONE, rght_Customer_PersonalData,
      rght_Pays_TheirAdd, rght_Pays_AddToday, rght_Recourses_owner, rght_OrdersTP_Today]));
  end;

  // справочник документов скроем, если не включен в настройках
  if ((GetSettingsValue('SHOW_DOC_LIST') <> '1') and (aRightsID = rght_Dictionary_Doclist)) then
    Result := False;
end;

// Функция подсчета количества записей из таблицы aTableName
// Удовлетворяющих условию aWhereStr

function TdmMain.GetRecordsCount(const aTableName, aWhereStr: String): Integer;
begin
  with TpFIBQuery.Create(Nil) do
    try
      Database := dbTV;
      Transaction := trReadQ;
      SQL.text := 'select count(*) as QRecords from ' + aTableName + ' ' + aWhereStr;
      Transaction.StartTransaction;
      ExecQuery;
      Result := FieldByName('QRecords').Value;
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
end;

function TdmMain.GetCustomerFine(const aCUSTOMER_ID: Integer; const aPayDate: TDateTime): Extended;
begin
  Result := 0;
  with TpFIBQuery.Create(self) do
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.text := 'select sum(fine_sum) as FINE_SUMMA from calculate_fine(' + IntToStr(aCUSTOMER_ID) + ',''' +
        FormatDateTime('yyyy-mm-dd', aPayDate) + ''')';
      Transaction.StartTransaction;
      ExecQuery;
      if not FieldByName('FINE_SUMMA').IsNull then
        Result := FieldByName('FINE_SUMMA').Value;
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
end;

function TdmMain.GetCompanyValue(const aSettingName: string): Variant;
begin
  if (not mdsCompany.Active) or (aSettingName = 'ReloadSettingsFromDB') then
    GetCompany;
  Result := mdsCompany.FieldByName(aSettingName).Value;
end;

function TdmMain.GetSettingsValue(const aSettingName: string): Variant;
var
  v: Variant;
  s: string;
begin
  if not dbTV.Connected then
    exit;

  if (FA4onList.Count = 0) or (aSettingName = 'ReloadSettingsFromDB') then
  begin
    FInStrictMode := true;
    dsSettings.Open;
    FA4onList.Clear;
    while not dsSettings.Eof do
    begin
      s := '';
      if (not dsSettings.FieldByName('VAR_VALUE').IsNull) then
        s := dsSettings['VAR_VALUE'];

      if dsSettings['VAR_NAME'] = 'STRICT_MODE' then
        FInStrictMode := (s = '1');

      FA4onList.Values[dsSettings['VAR_NAME']] := s;
      dsSettings.Next;
    end;
    dsSettings.Close;
  end;
  v := FA4onList.Values[AnsiUpperCase(aSettingName)];
  if not VarIsNull(v) then
    Result := v
  else
    Result := '';
end;

procedure TdmMain.FibErrorHandlerFIBErrorEvent(Sender: TObject; ErrorValue: EFIBError; KindIBError: TKindIBError;
  var DoRaise: Boolean);
var
  s: string;
begin
  case KindIBError of
    keLostConnect:
      begin
        MessageDlg(rsERROR_CONNECT_LOST, mtWarning, [mbOK], 0);
        DoRaise := False;
      end;
    keUniqueViolation:
      begin
        case ErrorValue.IBErrorCode of
          // уникальное значение
          335544665:
            begin
              s := ErrorValue.IBMessage;
              MessageDlg(FORMAT(rsERROR_UNIQUE, [s]), mtError, [mbOK], 0);
              DoRaise := true;
            end;
        end;
      end;
    keOther:
      begin
        case ErrorValue.IBErrorCode of
          // не найден файл базы данных
          335544344:
            begin
              s := ErrorValue.IBMessage;
              MessageDlg(rsERROR_CONNECT + rsEOL + rsERROR_RESONE + rsEOL + rsERROR_DB_NOT_FOUND + rsEOL + s, mtWarning, [mbOK], 0);
              DoRaise := False;
            end;

          // неверно указано имя пользователя и пароль
          335544472:
            begin
              DoRaise := False;
              if dbTV.Tag = 1 then
              begin
                s := ErrorValue.IBMessage;
                MessageDlg(rsERROR_CONNECT + rsEOL + rsERROR_RESONE + rsEOL + rsERROR_DB_USER + rsEOL + s, mtWarning, [mbOK], 0);
              end;
              dbTV.Tag := 1;
            end;

          // неверно указано имя пользователя и пароль
          335545106:
            begin
              DoRaise := False;
              if dbTV.Tag = 1 then
              begin
                s := ErrorValue.IBMessage;
                MessageDlg(rsERROR_CONNECT + rsEOL + rsERROR_RESONE + rsEOL + rsERROR_DB_USER + rsEOL + s, mtWarning, [mbOK], 0);
              end;
              dbTV.Tag := 1;
            end;

          // база данных не доступна
          335544375:
            begin
              s := ErrorValue.IBMessage;
              MessageDlg(rsERROR_DB_DENIED + rsEOL + rsERROR_FIREBIRD_NOT_RUN + rsEOL + s, mtWarning, [mbOK], 0);
              DoRaise := False;
            end;

          // Версия сервера не соответствует формату БД
          335544379:
            begin
              s := ErrorValue.IBMessage;
              MessageDlg(rsERROR_FIREBIRD_WRONG_VERSION + rsEOL + rsERROR_FIREBIRD_LAST_VERSION + rsEOL + s, mtWarning, [mbOK], 0);
              DoRaise := False;
            end;
          // нет активной БД
          335544324:
            begin
              // MessageDlg('Нет подключения базе данных!', mtError, [mbOK], 0);
              DoRaise := False;
            end;
          // не найден пользователь Firebird
          336723990:
            DoRaise := False;
          // нет плагина авторзации SRP Legacy
          335544382:
            DoRaise := False;
        else
          DoRaise := true;
        end;
      end;
  end;
end;

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
{$IFDEF USE_ZEOS}
  frxzscmpnts1 := TfrxZeosComponents.Create(self);
{$ENDIF}
  frxChartObject1 := TfrxChartObject.Create(self);
  frxChartObject1.Name := 'frxChartObject1';

  FTaskProceed := False;
  fSuperMode := -1; // режим в котором видны все абоненты
  FRightsList := TStringList.Create;
  FRightsList.Sorted := true;
  FRightsList.Duplicates := dupIgnore;
  FUserGroups := TStringList.Create;
  FUserGroups.Sorted := true;
  FUserGroups.Duplicates := dupIgnore;
  FSettingsList := TStringList.Create;
  FA4onList := TStringList.Create;
  dbTV.RegisterBlobFilter(-15, @PackBuffer, @UnpackBuffer);
  fUserAreas := 'NOT SET';
  FCanViewCustomers := 0;
  FTaskLastTimeCheck := now();
end;

procedure TdmMain.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(frxTXTExport) then
    FreeAndNil(frxTXTExport);
  if Assigned(frxCSVExport) then
    FreeAndNil(frxCSVExport);
  if Assigned(frxBMPExport) then
    FreeAndNil(frxBMPExport);
  if Assigned(frxHTMLExport) then
    FreeAndNil(frxHTMLExport);
  if Assigned(frxXLSExport) then
    FreeAndNil(frxXLSExport);
  if Assigned(frxRTFExport) then
    FreeAndNil(frxRTFExport);
  if Assigned(frxPDFExport) then
    FreeAndNil(frxPDFExport);
  if Assigned(frxBIFFExport) then
    FreeAndNil(frxBIFFExport);
  if Assigned(frxDBFExport) then
    FreeAndNil(frxDBFExport);
  if Assigned(frxJPEGExport) then
    FreeAndNil(frxJPEGExport);
  if Assigned(frxMailExport) then
    FreeAndNil(frxMailExport);
  if Assigned(frxODSExport) then
    FreeAndNil(frxODSExport);
  if Assigned(frxODTExport) then
    FreeAndNil(frxODTExport);
  if Assigned(frxXMLExport) then
    FreeAndNil(frxXMLExport);
  if Assigned(frxDOCXExport) then
    FreeAndNil(frxDOCXExport);
  if Assigned(frxPPTXExport) then
    FreeAndNil(frxPPTXExport);
  if Assigned(frxXLSXExport) then
    FreeAndNil(frxXLSXExport);
  if Assigned(frxHTML5Div) then
    FreeAndNil(frxHTML5Div);
  if Assigned(frxTIFFExport) then
    FreeAndNil(frxTIFFExport);
  if Assigned(frxSimpleExp) then
    FreeAndNil(frxSimpleExp);
  if Assigned(frxSVGExport) then
    FreeAndNil(frxSVGExport);

  if (dmMain.AllowedAction(rght_Reports_Designer)) then
    FreeAndNil(frxDesigner);

  if Assigned(FKeyboradLocalesList) then
    FreeAndNil(FKeyboradLocalesList);

  FRightsList.Free;
  FUserGroups.Free;
  FSettingsList.Free;
  FA4onList.Free;
  fTelNetAnswer.Free;
  frxChartObject1.Free;

{$IFDEF USE_ZEOS}
  if Assigned(frxzscmpnts1) then
    FreeAndNil(frxzscmpnts1);
{$ENDIF}
  if dbTV.Connected then
  begin
    dbTV.CloseDataSets;
    dbTV.Close;
  end;
end;

procedure TdmMain.Company2MemDS(aDS: TDataSet);
var
  i: Integer;
  cd: Boolean;
begin
  mdsCompany.Close;
  aDS.DisableControls;
  aDS.First;
  // aMemDS.LoadFromFile();
  // очистим мемДС от полей
  for i := mdsCompany.FieldDefs.Count - 1 downto 0 do
    mdsCompany.FieldDefs.Delete(i);

  cd := False;
  // aMemDS.Fields.Create();
  // TField
  while not aDS.Eof do
  begin
    // if UPPERCASE(aDS.FieldByName('C_TYPE').AsString) = 'FTSTRING' then непонятно зачем эта проверка
    if (mdsCompany.FieldDefs.IndexOf(aDS.FieldByName('C_CODE').AsString) = -1) then
    begin
      with mdsCompany.FieldDefs.AddFieldDef do
      begin
        DataType := ftString;
        Size := 500;
        Name := aDS.FieldByName('C_CODE').AsString;
        cd := true;
      end;
    end;
    aDS.Next;
  end;
  // если нет полей для создания
  if not cd then
    exit;

  mdsCompany.CreateDataSet;
  mdsCompany.Open;
  mdsCompany.append;
  aDS.First;
  while not aDS.Eof do
  begin
    mdsCompany.FieldByName(aDS.FieldByName('C_CODE').AsString).AsString := aDS.FieldByName('C_VALUE').AsString;
    aDS.Next;
  end;
  mdsCompany.Post;
  aDS.EnableControls;
end;

procedure TdmMain.dbTVAfterConnect(Sender: TObject);
begin
  CheckFirebirdVersion;
end;

procedure TdmMain.dbTVAfterDisconnect(Sender: TObject);
begin
  if Assigned(mdsCompany) and (mdsCompany.Active) then
    mdsCompany.Close;
end;

procedure TdmMain.FormStorage1SavePlacement(Sender: TObject);
begin
  dbTV.ConnectParams.Password := '';
end;

function TdmMain.frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
begin
  if MethodName = 'NUMTOSTR' then
    Result := NumToStr(Params[0], Params[1])
  else if MethodName = 'STRREPLACE' then
    Result := StringReplace(Params[0], Params[1], Params[2], [rfReplaceAll, rfIgnoreCase])
  else if MethodName = 'BASE64_DECODE' then
    Result := DecodeBase64(AnsiString(Params[0]))
  else if MethodName = 'BASE64_ENCODE' then
    Result := EncodeBase64(AnsiString(Params[0]))
  else if MethodName = 'GEN_BARCODE' then
    Result := GenerateBarCode(Params[0], Params[1], Params[2], Params[3], Params[4], Params[5], Params[5])
  else if MethodName = 'INMODE' then
    Result := SuperMode
  else if MethodName = 'MONTHASSTRING' then
    Result := MonthAsString(Params[0], Params[1], Params[2])
  else if MethodName = 'OPENCUSTOMERBYACCOUNT' then
    Result := A4MainForm.ShowCustomers(100, Trim(Params[0])) // 100 - лицевой
  else if MethodName = 'OPENCUSTOMERBYID' then
    Result := A4MainForm.ShowCustomers(104, Trim(Params[0])) // 104 - customer_id
  else if MethodName = 'OPENREQUEST' then
    Result := A4MainForm.OpenRequest(Params[0])
  else if MethodName = 'INCMAC' then
    Result := AtrStrUtils.IncMAC(Params[0], Params[1])
  else if MethodName = 'SHA256' then
    Result := FrSHA256(Params[0])
  else
    Result := null;
end;

function TdmMain.FrSHA256(const Str: String): string;
begin
  Result := string(Sha256(RawByteString(Str)));
end;

procedure TdmMain.GlobalInitReport(Report: TfrxReport);
begin
  Report.OnUserFunction := frxReportUserFunction;
  Report.PreviewOptions.AllowEdit := (AllowedAction(rght_Reports_Designer));
  // редактирование отчета
  if (not AllowedAction(rght_Reports_Save)) // Сохранение отчета
  then
  begin
    Report.PreviewOptions.Buttons := Report.PreviewOptions.Buttons - [pbSave];
    Report.PreviewOptions.Buttons := Report.PreviewOptions.Buttons - [pbLoad];
  end;
  frxAddFunctions(Report);
end;

procedure TdmMain.frxAddFunctions(Report: TfrxReport);
begin
  Report.AddFunction('function NumToStr(n: double; c: byte = 0): string', rsFunctionsA4onTV, rsFunctionNumberToWord +
    (* #13#10 *) '  c=0 - 21.05 : "Двадцать один рубль 05 копеек."' +
    (* #13#10 *) '  с=1 - 21.05 : "двадцать один"' +
    (* #13#10 *) '  c=2 - 21.05 : "21-05", 21.00 : "21="');
  Report.AddFunction('function StrReplace(const S, OldS, NewS: string): string', rsFunctionsA4onTV, rsNumToStrDesc);
  Report.AddFunction('function BASE64_ENCODE(s: String):String', rsFunctionsA4onTV, rsFromBASE64toString);
  Report.AddFunction('function BASE64_DECODE(s: String):String', rsFunctionsA4onTV, rsStringToBASE64);
  Report.AddFunction('function GEN_BARCODE(const ACCOUNT : string; const DEBT : Currency;' +
    ' const ID : INTEGER; const UL, HOUSE, FLAT, FIO : string):string', rsFunctionsA4onTV, rsFunctionBarCode);
  Report.AddFunction('function INMODE:Integer', rsFunctionsA4onTV, rsSOFTMODE);
  Report.AddFunction('function StrReplace(const S, OldS, NewS: string): string', rsFunctionsA4onTV,
    'Заменяет в строке S подстроку OldS на подстроку NewS');
  Report.AddFunction('function MonthAsString(D: TDateTime; const beforeDay : string; const AfterDay :string): string',
    rsFunctionsA4onTV, 'Вывод месяца как строка, например 01.01.2013 - «1» января 2013');
  Report.AddFunction('function OpenCustomerByAccount(const ACCOUNT: String): Integer', rsFunctionsA4onTV,
    'Открыть абонента в списке абонентов по лицевому');
  Report.AddFunction('function OpenCustomerByID(const CUSTOMER_ID: Integer): Integer', rsFunctionsA4onTV,
    'Открыть абонента в списке абонентов по его ID');
  Report.AddFunction('function OpenRequest(const RQ_ID: String): Integer', rsFunctionsA4onTV, 'Открыть заявку');
  Report.AddFunction('function IncMAC(const MAC: string; const step: Integer): String;', rsFunctionsA4onTV,
    'Увеличить/уменьшить MAC адресс на STEP');
  Report.AddFunction('function Sha256(const text: string): String;', rsFunctionsA4onTV, 'Считаем Sha256 для строки');
end;

function TdmMain.GetNextIP(InetIP: Boolean; const mask: string = ''): string;
var
  FLD: string;
begin
  Result := '';
  FLD := 'SELECT IP FROM GET_FREE_IP(''' + mask + ''')';
  with TpFIBQuery.Create(self) do
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.text := FLD;
      Transaction.StartTransaction;
      ExecQuery;
      if not FieldByName('IP').IsNull then
        Result := FieldByName('IP').Value;
      Transaction.Commit;
    finally
      Free;
    end;
end;

function TdmMain.GetNextVlanIP(const id: Integer; const itsVlan: Boolean): string;
var
  FLD: string;
begin
  Result := '';
  if itsVlan then
    FLD := 'select IP from GET_FREE_VLAN_IP(:id)'
  else
    FLD := 'select IP from GET_FREE_VLAN_IP((select e.vlan_id from equipment e where e.eid = :id))';

  with TpFIBQuery.Create(self) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.text := FLD;
      ParamByName('id').AsInteger := id;
      Transaction.StartTransaction;
      ExecQuery;
      if not FieldByName('IP').IsNull then
        Result := FieldByName('IP').Value;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

function TdmMain.GetServer: String;
var
  s: string;
  i: Integer;
begin
  s := dbTV.DatabaseName;
  i := Pos(':', s);
  s := Copy(s, 1, i - 1);
  if Length(s) >= 3 then
  begin
    // i := Pos('/', s);
    // if i>0 then s := Copy(s, 1, i - 1);
    Result := s;
  end
  else
    Result := '127.0.0.1';
end;

function TdmMain.GetDBName: String;
begin
  Result := string(dbTV.DBFileName);
end;

function TdmMain.GetDatabase: String;
begin
  Result := dbTV.DatabaseName;
end;

function TdmMain.GetUser: String;
begin
  Result := UpperCase(dbTV.ConnectParams.UserName);
end;

function TdmMain.GetUserGroups: String;
begin
  Result := FUserGroups.DelimitedText;
end;

function TdmMain.GetPassword: String;
begin
  Result := dbTV.ConnectParams.Password;
end;

function TdmMain.GetCashBoxPSWD: String;
begin
  Result := fCashBoxPSWD;
end;

function TdmMain.GetClientLib: String;
begin
  Result := dbTV.LibraryName;
end;

function TdmMain.GetUserAreas: String;
begin
  if fUserAreas = 'NOT SET' then
  begin
    with TpFIBQuery.Create(Nil) do
      try
        fUserAreas := '';
        Database := dbTV;
        Transaction := trReadQ;
        SQL.text := 'select coalesce(u.all_areas,0) as all_areas, a.area_id' + rsEOL +
          'from sys$user u left outer join sys$user_areas a on (u.id = a.user_id)' + rsEOL +
          'where u.ibname = current_user';
        Transaction.StartTransaction;
        ExecQuery;
        if FieldByName('all_areas').Value = 0 then
        begin
          while not Eof do
          begin
            if not FieldByName('area_id').IsNull then
              fUserAreas := fUserAreas + FieldByName('area_id').AsString + ',';
            Next;
          end;
          if Length(fUserAreas) > 0 then
            fUserAreas := fUserAreas.TrimRight([',']);
        end;
        Close;
        Transaction.Commit;
      finally
        Free;
      end;
  end;
  Result := fUserAreas
end;

function TdmMain.GenerateDogNumberForCustomer(const CUSTOMER_ID: Integer; const SRV_ID: Integer): string;
var
  HOUSE_ID: Integer;
  Flat: string;
begin
  with TpFIBQuery.Create(Nil) do
    try
      Database := dbTV;
      Transaction := trReadQ;
      SQL.text := 'select c.house_id, c.flat_no from customer c where c.customer_id = :CUSTOMER_ID';
      ParamByName('CUSTOMER_ID').AsInteger := CUSTOMER_ID;
      Transaction.StartTransaction;
      ExecQuery;
      if not Eof then
      begin
        HOUSE_ID := FieldByName('house_id').Value;
        Flat := FieldByName('flat_no').Value;
      end
      else
      begin
        HOUSE_ID := 0;
        Flat := '';
      end;
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  Result := GenerateDogNumber(HOUSE_ID, Flat, SRV_ID);
end;

function TdmMain.GenerateDogNumber(const HOUSE_ID: Integer; const Flat: string; const SRV_ID: Integer): string;
var
  FORMAT: string;
begin
  FORMAT := GetSettingsValue('ACCOUNT_FORMAT');
  Result := GenerateDogNumberFromFormat(FORMAT, HOUSE_ID, Flat, SRV_ID);
end;

function TdmMain.GenerateDogNumberFromFormat(const FORMAT: string; const HOUSE_ID: Integer; const Flat: string;
  const SRV_ID: Integer): string;
begin
  Result := '';
  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dbTV;
      Transaction := trReadQ;
      SQL.text := 'select Get_New_Account (:House_Id, :Flat, :Srv_Id) ACC from Rdb$Database';
      if HOUSE_ID > -1 then
        ParamByName('House_Id').AsInteger := HOUSE_ID;
      if not Flat.IsEmpty then
        ParamByName('Flat').AsString := Flat;
      if SRV_ID > -1 then
        ParamByName('Srv_Id').AsInteger := SRV_ID;
      Transaction.StartTransaction;
      ExecQuery;
      if not Eof then
        Result := FieldByName('ACC').Value;
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

// создание строки для штрихкода
function TdmMain.GenerateBarCode(const ACCOUNT: string; const DEBT: Currency; const id: Integer;
  const UL, HOUSE, Flat, FIO: string): string;
var
  FORMAT: string;
begin
  FORMAT := GetSettingsValue('BARCODE');
  Result := GenerateBarCodeFromFormat(FORMAT, ACCOUNT, DEBT, id, UL, HOUSE, Flat, FIO);
end;

function TdmMain.GenerateBarCodeFromFormat(const FORMAT, ACCOUNT: string; const DEBT: Currency; const id: Integer;
  const UL, HOUSE, Flat, FIO: string): string;
var
  sa, sl: TStringDynArray;
  cnt, i, j: Integer;
  barcode: string;
  rubl: string;
  ms: string;
  ys: string;
  kop: string;
  surname: string;
  pms: string;
  pys: string;
  s: string;
  c: string;
  y, m, d: word;
  tolen: Integer;

  function ReplaceDATA(s: string): string;
  begin
    s := ReplaceText(s, rsFldCodeAbonent, IntToStr(id));
    s := ReplaceText(s, rsFldACCOUNT, ACCOUNT);
    s := ReplaceText(s, rsFldPAYMENT, rubl);
    s := ReplaceText(s, rsFldSTREET, UL);
    s := ReplaceText(s, rsFldHouse, HOUSE);
    s := ReplaceText(s, rsFldFlat, Flat);
    s := ReplaceText(s, rsFldFULLNAME, FIO);
    s := ReplaceText(s, rsFldMonth, ms);
    s := ReplaceText(s, rsFldCurrentYear, ys);
    s := ReplaceText(s, rsFldPAYMENT100, kop);
    s := ReplaceText(s, rsFldSURNAME, surname);
    s := ReplaceText(s, rsFldPrevMONTH, pms);
    s := ReplaceText(s, rsFldPrevYEAR, pys);
    Result := s;
  end;

begin
  rubl := IntToStr(Trunc(DEBT));
  DecodeDate(CurrentMonth, y, m, d);
  ms := IntToStr(m);
  ys := IntToStr(y);
  kop := IntToStr(Trunc(DEBT * 100));
  sa := Explode(' ', FIO);
  if Length(sa) > 0 then
    surname := sa[0]
  else
    surname := FIO;
  DecodeDate((EncodeDate(y, m, 1) - 1), y, m, d);
  pms := IntToStr(m);
  pys := IntToStr(y);

  barcode := '';
  Result := '';
  sa := Explode('^', FORMAT);
  cnt := Length(sa);
  for i := 0 to cnt - 1 do
  begin
    s := '';
    sl := Explode('~', sa[i]);
    j := Length(sl);
    // вставим данные
    if j > 0 then
      s := ReplaceDATA(sl[0])
    else
      s := '';
    // обрежем до нужной длины
    if j > 1 then
      try
        tolen := StrToInt(sl[1])
      except
        tolen := Length(s);
      end
    else
      tolen := Length(s);
    // дополним символом
    if j > 2 then
    begin
      c := sl[2];
      if Length(c) = 0 then
        c := '0';
    end;
    if (tolen >= 0) then
    begin
      s := Copy(s, 0, tolen);
      s := AddChar(c[1], s, tolen);
    end
    else
      s := Copy(s, Length(s) + tolen + 1, -1 * tolen);
    barcode := barcode + s;
  end;

  Result := AnsiUpperCase(barcode);
end;

// разбор штрихкода
function TdmMain.ParseBarCode(const barcode: string; var id: Integer; var ACCOUNT: string; var SUM: Currency): Boolean;
var
  old: Extended;
  i, j, cp, tolen: Integer;
  FORMAT, c: string;
  sa, sl: TStringDynArray;
  pos_id, len_id, pos_rub, len_rub, pos_kop, len_kop, pos_acc, len_acc: Integer;
  chr_id, chr_rub, chr_kop, chr_acc: Char;
  NeedDelZerro: Boolean;
begin
  FORMAT := GetSettingsValue('BARCODE');
  NeedDelZerro := (GetSettingsValue('BARNODELZERRO') = '0');
  Result := False;
  id := -1;
  ACCOUNT := '';
  SUM := 0;

  pos_id := -1;
  pos_rub := -1;
  pos_kop := -1;
  pos_acc := -1;
  len_id := -1;
  len_rub := -1;
  len_kop := -1;
  len_acc := -1;
  chr_id := #0;
  chr_rub := #0;
  chr_kop := #0;
  chr_acc := #0;

  // если формат версии 4 и более ранний
  if FORMAT = '' then
  begin
    if TryStrToFloat(barcode, old) then
    begin
      ACCOUNT := '';
      id := -1;
      if old < 10000000 then
        exit;
      SUM := round(old) mod 10000000;
      SUM := SUM / 100; // выделим копейки
      id := round(old) div 10000000;
      Result := true;
      exit;
    end;
  end;
  // 1234500000000010000010050
  {
    [КОД_АБОНЕНТА]
    [ЛИЦЕВОЙ]
    [СУММА]
    [СУММА_В_КОПЕЙКАХ]
  }
  sa := Explode('^', FORMAT);
  cp := 1;
  for i := 0 to Length(sa) - 1 do
  begin
    sl := Explode('~', sa[i]);
    j := Length(sl);
    // обрежем до нужной длины
    if j > 1 then
      tolen := StrToInt(sl[1])
    else
      tolen := 5;
    // дополним символом
    c := '';
    if j > 2 then
      c := sl[2];
    if Length(c) = 0 then
      c := '0';
    if AnsiPos(rsFldCodeAbonent, sa[i]) > 0 then
    begin
      pos_id := cp;
      chr_id := c[1];
      len_id := tolen;
    end;
    if AnsiPos(rsFldACCOUNT, sa[i]) > 0 then
    begin
      pos_acc := cp;
      chr_acc := c[1];
      len_acc := tolen;
    end;
    if AnsiPos(rsFldPAYMENT, sa[i]) > 0 then
    begin
      pos_rub := cp;
      chr_rub := c[1];
      len_rub := tolen;
    end;
    if AnsiPos(rsFldPAYMENT100, sa[i]) > 0 then
    begin
      pos_kop := cp;
      chr_kop := c[1];
      len_kop := tolen;
    end;
    if tolen > 0 then
      cp := cp + tolen
    else
      cp := cp + -1 * tolen;
  end;
  if pos_id > 0 then
  begin
    c := Copy(barcode, pos_id, len_id);
    c := LeftTrimChar(c, chr_id);
    try
      id := StrToInt(c);
    except
      id := -1;
    end;
  end;
  if pos_acc > 0 then
  begin
    ACCOUNT := Copy(barcode, pos_acc, len_acc);
    if NeedDelZerro then
      ACCOUNT := LeftTrimChar(ACCOUNT, chr_acc);
  end;
  if pos_rub > 0 then
  begin
    c := Copy(barcode, pos_rub, len_rub);
    c := LeftTrimChar(c, chr_rub);
    try
      SUM := StrToInt(c);
    except
      SUM := 0;
    end;
  end;
  if pos_kop > 0 then
  begin
    c := Copy(barcode, pos_kop, len_kop);
    c := LeftTrimChar(c, chr_kop);
    try
      SUM := StrToInt(c) / 100;
    except
      SUM := 0;
    end;
  end;
  Result := (ACCOUNT <> '') or (id <> -1);
end;

function TdmMain.GetScriptForUpdateDB(const FileName: string): Integer;
var
  sc: TStrings;
  extr: TpFIBExtract;
  l: string;
  srcStream, dstStream: TStream;
  fs: TFileStream;
  BufSize: int64;
begin
  sc := TStringList.Create;
  extr := TpFIBExtract.Create(self);
  srcStream := TMemoryStream.Create;
  dstStream := TMemoryStream.Create;
  fs := TFileStream.Create(FileName, fmCreate or fmOpenWrite);
  try
    extr.Database := dbTV;
    extr.Transaction := trReadQ;
    extr.ExtractOptions := [CreateDB, Filters, Domains, AllTables, Index, Foreigns, Generators, Views, Checks,
      Exceptions, Procedures, Triggers];
    extr.IncludeSetTerm := true;
    extr.ExtractObject(eoDatabase);
    sc.AddStrings(extr.Items);

    with TpFIBQuery.Create(self) do
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        l := 'SELECT BL_BODY FROM BLOB_TBL WHERE BL_ID = 0';
        SQL.text := l;
        Transaction.StartTransaction;
        ExecQuery;
        if not FieldByName('BL_BODY').IsNull then
          sc.Insert(0, '-- ' + FieldByName('BL_BODY').AsString);
        Transaction.Commit;
        l := 'select count(*) as cnt_cust from customer';
        SQL.text := l;
        Transaction.StartTransaction;
        ExecQuery;
        if not FieldByName('cnt_cust').IsNull then
          sc.Insert(0, '-- ' + FieldByName('cnt_cust').AsString);
        Transaction.Commit;
        l := 'select C_VALUE as fld_text from COMPANY where C_CODE = ''NAME''';
        SQL.text := l;
        Transaction.StartTransaction;
        ExecQuery;
        if not FieldByName('fld_text').IsNull then
          sc.Insert(0, '-- ' + FieldByName('fld_text').AsString);
        Transaction.Commit;
      finally
        Free;
      end;
    sc.SaveToStream(srcStream);
    srcStream.Position := 0;
    frxCompressStream(srcStream, dstStream, gzDefault, 'DUMP.SQL');
    BufSize := dstStream.Size;
    dstStream.Position := 0;
    fs.CopyFrom(dstStream, BufSize);
    GetScriptForUpdateDB := 1;
    ShowMessage(rsCreateA4onADBSuccess);
  finally
    fs.Free;
    srcStream.Free;
    dstStream.Free;
    extr.Free;
    sc.Free;
  end;

end;

function TdmMain.GET_ID_REPORT_BY_PATH(PATH: string): Integer;
var
  s: string;
begin
  // удалим расширение .FR3 если оно есть
  s := Copy(PATH, Length(PATH) - 3, 4);
  if AnsiUpperCase(s) = '.FR3' then
    PATH := Copy(PATH, 1, Length(PATH) - 4);

  Result := -1;
  qCommon.Close;
  qCommon.SQL.text := 'select ID_REPORT from GET_REPORT_ID(:PATH, null)';
  qCommon.ParamByName('PATH').AsString := PATH;
  try
    qCommon.ExecQuery;
    if qCommon.RecordCount > 0 then
      if not qCommon.Fields[0].IsNull then
        Result := qCommon.Fields[0].AsInteger;
  finally
    qCommon.Close;
  end;
end;

procedure TdmMain.LoadChannelsFromA4onTV(const FileName: String);
const
  // Константы для отправки SMS по SMTP
  API_URL: String = 'http://a4on.tv/channel/epg/';
var
  strmData: TStringStream;
  Str: string;
  fHTTP: THTTPSend;
  fError: string;
  json: TJsonObject;
  action: string;
begin
  Str := dmMain.GetSettingsValue('A4LOGIN');
  if Str = '' then
    exit;

  if System.SysUtils.FileExists(FileName) then
    System.SysUtils.DeleteFile(FileName);

  action := 'day';
  json := TJsonObject.Create;
  json.s['login'] := Str;
  json.s['password'] := dmMain.GetSettingsValue('A4APIKEY');
  Str := string(mormot.crypt.core.MD5(json.ToString));
  json.s['hash'] := Str;
  fError := '';

  fHTTP := THTTPSend.Create;
  strmData := TStringStream.Create;
  try
    Str := json.ToString;
    strmData.WriteString(Str);
    fHTTP.TargetHost := 'a4on.tv';
    fHTTP.Protocol := '1.1';
    fHTTP.MimeType := 'application/x-www-form-urlencoded';
    fHTTP.Headers.Add('Accept-Encoding: gzip');
    fHTTP.Document.LoadFromStream(strmData);
    fHTTP.HTTPMethod('post', API_URL + action + '/');
    strmData.Clear;
    HeadersToList(fHTTP.Headers);
    if Trim(fHTTP.Headers.Values['Content-Encoding']) = 'gzip' then
      GZDecompressStream(fHTTP.Document, strmData)
    else
      fHTTP.Document.SaveToStream(strmData);
    strmData.SaveToFile(FileName);
  finally
    strmData.Free;
    fHTTP.Free;
    json.Free;
  end
end;

procedure TdmMain.LoadWeekFromA4onTV(const FileName: String);
const
  // Константы для отправки SMS по SMTP
  API_URL: String = 'http://a4on.tv/channel/epg/';
var
  strmData: TStringStream;
  Str: string;
  fHTTP: THTTPSend;
  fError: string;
  json: TJsonObject;
  action: string;
begin
  if System.SysUtils.FileExists(FileName) then
    System.SysUtils.DeleteFile(FileName);

  action := 'week';
  json := TJsonObject.Create;
  json.s['login'] := dmMain.GetSettingsValue('A4LOGIN');
  json.s['password'] := dmMain.GetSettingsValue('A4APIKEY');
  Str := string(mormot.crypt.core.MD5(json.ToString));
  json.s['hash'] := Str;
  fError := '';

  fHTTP := THTTPSend.Create;
  strmData := TStringStream.Create;
  try
    Str := json.ToString;
    strmData.WriteString(Str);
    fHTTP.TargetHost := 'a4on.tv';
    fHTTP.Protocol := '1.1';
    fHTTP.MimeType := 'application/x-www-form-urlencoded';
    fHTTP.Headers.Add('Accept-Encoding: gzip');
    fHTTP.Document.LoadFromStream(strmData);
    fHTTP.HTTPMethod('post', API_URL + action + '/');
    strmData.Clear;
    HeadersToList(fHTTP.Headers);
    if Trim(fHTTP.Headers.Values['Content-Encoding']) = 'gzip' then
      GZDecompressStream(fHTTP.Document, strmData)
    else
      fHTTP.Document.SaveToStream(strmData);
    strmData.SaveToFile(FileName);
  finally
    strmData.Free;
    fHTTP.Free;
    json.Free;
  end
end;

function TdmMain.GetSingleSqlResult(const vSql: string): Variant;
begin
  Result := null;
  with TpFIBQuery.Create(Nil) do
    try
      Database := dbTV;
      Transaction := trReadQ;
      SQL.text := vSql;
      Transaction.StartTransaction;
      ExecQuery;
      if not Eof then
        Result := Fields[0].Value;

      Close;
      Transaction.Commit;
    finally
      Free;
    end;
end;

procedure TdmMain.SaveKLAndSelectEnglish;
var
  LKbLt: TJclKeyboardLayout;
begin
  if not Assigned(FKeyboradLocalesList) then
    CreateKL;

  if (FSavedKL = 0) // для соблюдения парности вызовов, иначе надо делать стек
  then
  begin
    FSavedKL := FKeyboradLocalesList.ActiveLayout.Layout;
    LKbLt := FKeyboradLocalesList.LayoutFromLocaleID[$409];
    if Assigned(LKbLt) then
      LKbLt.Activate([klActivate, klSubstituteOK]);
  end;
end;

procedure TdmMain.RestoreKL;
begin
  if (FSavedKL <> 0) then
    FKeyboradLocalesList.ItemFromHKL[FSavedKL].Activate([klActivate, klSubstituteOK]);
  FSavedKL := 0;
end;

procedure TdmMain.CreateKL;
begin
  FKeyboradLocalesList := TJclKeyboardLayoutList.Create;
end;

function TdmMain.GetServerDateTime: TDateTime;
begin
  qRead.SQL.text := 'select localtimestamp CD from rdb$database';
  qRead.Transaction.StartTransaction;
  qRead.ExecQuery;
  Result := qRead.FN('CD').AsDateTime;
  qRead.Close;
  qRead.Transaction.Commit;
end;

function TdmMain.CanViewCustomers(): Boolean;
var
  vView: Boolean;
begin
  // Проверим, первый раз эта функция вызвана или нет
  if FCanViewCustomers = 0 then
  begin
    // если первый раз. то проверим права и запомним доступ.
    vView := AllowedAction(rght_Customer_full)
    // or AllowedAction(rght_Abonents_add    )
      or AllowedAction(rght_Customer_del) or AllowedAction(rght_Customer_edit)
    // or AllowedAction(rght_Abonents_AddSrv )
      or AllowedAction(rght_Customer_DelSrv) or AllowedAction(rght_Customer_EditSrv) or
      AllowedAction(rght_Customer_History)
    // or AllowedAction(rght_Abonents_EditLan   )
    // or AllowedAction(rght_Abonents_EditDigit )
    // or AllowedAction(rght_Abonents_Discount  )
      or AllowedAction(rght_Customer_Bonus) or AllowedAction(rght_Customer_View);

    if vView then
      FCanViewCustomers := 1
    else
      FCanViewCustomers := -1;
  end;

  Result := (FCanViewCustomers = 1);
end;

procedure TdmMain.ProceedTask(const EventName: String);
var
  Alert: TAlertItem;
  FclOverdue: String;
  FclSoon: String;
begin
  if not dbTV.Connected then
    exit;

  if FTaskProceed then
    exit;

  if trReadQ.InTransaction then
    exit;

  try
    FclOverdue := GetSettingsValue('COLOR_DOLG');
  except
    FclOverdue := 'clRed';
  end;
  try
    FclSoon := GetSettingsValue('COLOR_OFFMONEY');
  except
    FclSoon := 'clBlue';
  end;

  FTaskProceed := true;

  qRead.SQL.Clear;
  qRead.SQL.Add('select first 10');
  qRead.SQL.Add('  t.Id, coalesce(t.Title, '''') Title ');
  qRead.SQL.Add('  , coalesce(t.Notice, '''') Notice ');
  qRead.SQL.Add('  , coalesce(t.COLOR, '''')  COLOR ');
  qRead.SQL.Add('  , t.Edit_On, t.PLAN_DATE ');
  qRead.SQL.Add('  , (select first 1 coalesce(w.Surname, m.Added_By)||'': ''||m.Text ');
  qRead.SQL.Add('      from Taskmsg m left outer join worker w on (m.Added_By = w.Ibname) ');
  qRead.SQL.Add('      where m.Task_Id = t.Id order by m.Added_On desc) LM ');
  qRead.SQL.Add(' from Tasklist t  ');
  qRead.SQL.Add(' where t.Deleted = 0 and (t.EXEC_DATE is null) ');
  qRead.SQL.Add('   and (t.Added_By = CURRENT_USER ');
  qRead.SQL.Add('         or exists(select u.Task_Id from Taskuser u where u.Task_Id = t.Id ');
  qRead.SQL.Add('                    and (u.Foruser = CURRENT_USER or u.Foruser = ''ALL'')))');

  if (EventName = 'START_A4ON') then
  begin
    // проверка при запуске приложения. покажем все события на сегодня
    qRead.SQL.Add(' and (t.PLAN_DATE < ''TOMORROW'' or t.PLAN_DATE is null) ');
  end
  else
  begin
    // проверка событий по таймеру. покажем новые и у которых время плана подошло
    qRead.SQL.Add
      (' and ((t.Edit_On >= :CHECK_TIME or ( t.PLAN_DATE between :CHECK_TIME and CURRENT_TIME)) and (t.Edit_By <> CURRENT_USER)) ');
    qRead.ParamByName('CHECK_TIME').AsDateTime := FTaskLastTimeCheck;
  end;

  qRead.SQL.Add(' order by t.id');

  qRead.Transaction.StartTransaction;
  qRead.ExecQuery;
  while (not qRead.Eof) do
  begin
    Alert.title := rsTask + ' ' + qRead.FN('Title').AsString;
    Alert.text := qRead.FN('Notice').AsString;
    Alert.color := qRead.FN('Color').AsString;
    Alert.FrameColor := '';
    if (not qRead.FN('PLAN_DATE').IsNull) then
    begin
      if (qRead.FN('PLAN_DATE').AsDateTime < FTaskLastTimeCheck) then
      begin
        Alert.title := '! ' + Alert.title;
        Alert.FrameColor := FclOverdue;
      end
      else if (qRead.FN('PLAN_DATE').AsDateTime > date()) then
        Alert.FrameColor := FclSoon;
    end;

    if (not qRead.FN('Edit_On').IsNull) and (qRead.FN('Edit_On').AsDateTime < FTaskLastTimeCheck) and
      (not qRead.FN('LM').IsNull) then
    begin
      Alert.title := '* ' + Alert.title;
      Alert.text := qRead.FN('LM').AsString + #13#10 + ' ' + Alert.text;
    end;

    Alert.Tag := qRead.FN('ID').AsInteger;
    A4MainForm.AddAlert(Alert);
    qRead.Next;
  end;
  qRead.Close;
  qRead.Transaction.Commit;
  qRead.SQL.Clear;

  FTaskProceed := False;
  FTaskLastTimeCheck := now();
end;

function TdmMain.IpInfo(const ip: String; const vlan_id: Integer = -1): String;
begin
  Result := '';
  if ip = '' then
    exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.text := 'select';
      SQL.Add('  ''Абонент ''||c.Account_No||coalesce('' MAC ''||t.Mac, '''')||coalesce('' VLAN ''||v.Name, '''') IP_INFO');
      SQL.Add('  from Tv_Lan t');
      SQL.Add('       inner join customer c on (t.Customer_Id = c.Customer_Id)');
      SQL.Add('       left outer join Vlans v on (t.Vlan_Id = v.V_Id)');
      SQL.Add('  where t.Ip = :ip');
      if vlan_id <> -1 then
        SQL.Add('   and t.Vlan_Id = :Vlan_Id');
      SQL.Add('union all');
      SQL.Add('select');
      SQL.Add('  ''Оборудование ''||e.Name||coalesce('' MAC ''||e.Mac, '''')||coalesce('' VLAN ''||v.Name, '''') IP_INFO');
      SQL.Add('  from EQUIPMENT E');
      SQL.Add('       left outer join Vlans v on (e.Vlan_Id = v.V_Id)');
      SQL.Add('  where e.Ip = :ip');
      if vlan_id <> -1 then
        SQL.Add('   and e.Vlan_Id = :Vlan_Id');
      ParamByName('ip').AsString := ip;
      if vlan_id <> -1 then
        ParamByName('Vlan_Id').AsInteger := vlan_id;
      Transaction.StartTransaction;
      ExecQuery;
      while not Eof do
      begin
        Result := Result + FieldByName('IP_INFO').Value + #13#10;
        Next;
      end;
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

function TdmMain.GetCompanyCountry: String;
begin
  Result := UpperCase(GetSettingsValue('FORMATN'));
end;

function TdmMain.GetCompanyName: String;
begin
  Result := mdsCompany.FieldByName('NAME').AsString;
end;

procedure TdmMain.frxDesignerShow(Sender: TObject);
begin
  if not(Sender is TfrxDesignerForm) then
    exit;

  TfrxDesignerForm(Sender).SaveAsMI.Visible := False;
  TfrxDesignerForm(Sender).SaveAsCmd.Visible := False;
end;

procedure TdmMain.frxModalReportPreview(Sender: TObject);
begin
  if (Sender is TfrxReport) then
    (Sender as TfrxReport).PreviewForm.Caption := (Sender as TfrxReport).FileName;
end;

procedure TdmMain.CheckFirebirdVersion;
begin
  if (not dbTV.Version.Contains('Firebird 4.')) then
    exit;
  {
    SELECT RDB$GET_CONTEXT('SYSTEM', 'ENGINE_VERSION') AS ENGINE_VERSION FROM RDB$DATABASE

    DataTypeCompatibility = 3.0 in databases.conf

    There is also just issuing:
    SET BIND OF TIMESTAMP WITH TIME ZONE TO LEGACY;
    SET BIND OF TIME WITH TIME ZONE TO LEGACY;
    SET BIND OF DECFLOAT TO LEGACY;
    SET BIND OF NUMERIC(38) TO LEGACY;

    after connecting to Firebird 4 database.
  }
  dbTV.Execute('SET BIND OF TIMESTAMP WITH TIME ZONE TO LEGACY;');
  dbTV.Execute('SET BIND OF TIME WITH TIME ZONE TO LEGACY;');
  dbTV.Execute('SET BIND OF DECFLOAT TO LEGACY;');
  dbTV.Execute('SET BIND OF NUMERIC(38) TO LEGACY;');
end;

procedure TdmMain.RefreshCompanyData;
var
  i: Integer;
begin
  dsCompany.DisableControls;
  i := -1;
  if not dsCompany.FieldByName('C_ORDER').IsNull then
    i := dsCompany.FieldByName('C_ORDER').AsInteger;
  GetCompany;
  if not dsCompany.Active then
    dsCompany.Open;
  if i <> -1 then
    dsCompany.Locate('C_ORDER', i, []);
  dsCompany.EnableControls;
end;

function TdmMain.CheckAdminUser: Boolean;
begin
  Result := (GetUser.ToUpper = 'SYSDBA');
end;

end.
