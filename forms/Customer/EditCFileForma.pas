unit EditCFileForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Types,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBDatabase, FIBDatabase,
  GridsEh, DBGridEh, DBCtrlsEh, DBLookupEh, PropFilerEh, PropStorageEh,
  CnErrorProvider,
  PrjConst, A4onTypeUnit;

type

  TProhibitiontType = record
    Lock: Boolean;
    Message: string;
  end;

  TFileTypeAddendumResult = record
    RemoveFile: Boolean;
    Processed: Boolean;
    Message: string;
    Result: Integer;
    RQ_ID: Integer;
    FROM_CID: Integer;
    FROM_RQ_ID: Integer;
  end;

  TEditCFileForm = class(TForm)
    srcFileTypes: TDataSource;
    dsFileTypes: TpFIBDataSet;
    CnErrors: TCnErrorProvider;
    dsCustFile: TpFIBDataSet;
    srcCustFile: TDataSource;
    dlgOpen: TOpenDialog;
    trWrite: TpFIBTransaction;
    PropStorageEh: TPropStorageEh;
    pnlTop: TPanel;
    dbluFileType: TDBLookupComboboxEh;
    lblFile: TLabel;
    dsService: TpFIBDataSet;
    srcService: TDataSource;
    dsOnOffService: TpFIBDataSet;
    srcOnOffService: TDataSource;
    pnlBtm: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    Query: TpFIBQuery;
    pnlClient: TPanel;
    pnlNotice: TPanel;
    mmoDesc: TDBMemoEh;
    pnlText: TPanel;
    lblText: TLabel;
    edtText: TDBEditEh;
    pnlMobile: TPanel;
    lblMobile: TLabel;
    edtMobile: TDBEditEh;
    pnlDoc: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    Label6: TLabel;
    lbl9: TLabel;
    lbl21: TLabel;
    edtBIRTHDAY: TDBDateTimeEditEh;
    edtADRES_REGISTR: TDBEditEh;
    edtRegistration: TDBEditEh;
    edtPlaceBirth: TDBEditEh;
    edtDOCDATE: TDBDateTimeEditEh;
    pnlPassport: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    edtPASSPORT: TDBEditEh;
    edtSURNAME: TDBEditEh;
    edtFIRSTNAME: TDBEditEh;
    edtMIDLENAME: TDBEditEh;
    btnOcr: TButton;
    pnlSrv: TPanel;
    lblOnOff: TLabel;
    edDateSrv: TDBDateTimeEditEh;
    lcbService: TDBLookupComboboxEh;
    lcbOnOffSrv: TDBLookupComboboxEh;
    pnlContract: TPanel;
    lblContr: TLabel;
    edtContractDate: TDBDateTimeEditEh;
    edtContract: TDBEditEh;
    chkContract: TCheckBox;
    chkFOwner: TDBCheckBoxEh;
    pnlAdr: TPanel;
    lbl: TLabel;
    pnlBidPay: TPanel;
    lblBP: TLabel;
    ednBid: TDBNumberEditEh;
    ednBidSum: TDBNumberEditEh;
    ednCheckSum: TDBNumberEditEh;
    ednFineSum: TDBNumberEditEh;
    pnlTopFile: TPanel;
    lblFileCh: TLabel;
    edtFILE: TDBEditEh;
    btnScaner: TButton;
    pnlName: TPanel;
    lbl1: TLabel;
    edtNAME: TDBEditEh;
    dsStreets: TpFIBDataSet;
    srcStreet: TDataSource;
    dsHomes: TpFIBDataSet;
    srcHouse: TDataSource;
    dsFLAT: TpFIBDataSet;
    srcFLAT: TDataSource;
    lcbStreets: TDBLookupComboboxEh;
    lcbHOUSE: TDBLookupComboboxEh;
    lcbFLAT: TDBLookupComboboxEh;
    chkNewOwner: TDBCheckBoxEh;
    edtEMAIL: TDBEditEh;
    chkWA: TCheckBox;
    pnlTask: TPanel;
    lblBP1: TLabel;
    edTskDate: TDBDateTimeEditEh;
    edtTskName: TDBEditEh;
    pnlPeriod: TPanel;
    lblPeriod: TLabel;
    edDateBegin: TDBDateTimeEditEh;
    edDateEnd: TDBDateTimeEditEh;
    pmFile: TPopupMenu;
    miFileClear: TMenuItem;
    trWriteQ: TpFIBTransaction;
    trReadQ: TpFIBTransaction;
    trRead: TpFIBTransaction;
    lblText1: TLabel;
    edtText1: TDBEditEh;
    pnlPayment: TPanel;
    lblBP2: TLabel;
    lcbPayment: TDBLookupComboboxEh;
    dsPayment: TpFIBDataSet;
    srcPayment: TDataSource;
    lcbServiceFrom: TDBLookupComboboxEh;
    dsServiceFrom: TpFIBDataSet;
    srcServiceFrom: TDataSource;
    mmoNotice: TDBMemoEh;
    splMemo: TSplitter;
    pnlMaterials: TPanel;
    lblMat: TLabel;
    lcbMaterial: TDBLookupComboboxEh;
    dsMaterials: TpFIBDataSet;
    srcMaterials: TDataSource;
    lblText2: TLabel;
    edtText2: TDBEditEh;
    lblText3: TLabel;
    edtText3: TDBEditEh;
    lblText4: TLabel;
    edtText4: TDBEditEh;
    procedure btnOkClick(Sender: TObject);
    procedure edtFILEEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnScanerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SetFile(value: String);
    function GetFile: String;
    procedure RenameFileName;
    procedure FormShow(Sender: TObject);
    procedure lcbServiceChange(Sender: TObject);
    procedure edDateSrvChange(Sender: TObject);
    procedure lcbOnOffSrvChange(Sender: TObject);
    procedure chkContractClick(Sender: TObject);
    procedure chkFOwnerClick(Sender: TObject);
    procedure edtPASSPORTExit(Sender: TObject);
    procedure edtContractExit(Sender: TObject);
    procedure edtContractDateExit(Sender: TObject);
    procedure edtFIOChange(Sender: TObject);
    procedure edtMobileExit(Sender: TObject);
    procedure btnOcrClick(Sender: TObject);
    procedure edtSURNAMEChange(Sender: TObject);
    procedure edtNAMEChange(Sender: TObject);
    procedure edtFILEEditButtons1Click(Sender: TObject; var Handled: Boolean);
    procedure edtPASSPORTEnter(Sender: TObject);
    procedure ednBidExit(Sender: TObject);
    procedure lcbFLATExit(Sender: TObject);
    procedure dbluFileTypeExit(Sender: TObject);
    procedure dbluFileTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
      var Background: TColor; State: TGridDrawState);
    procedure edtFILEExit(Sender: TObject);
    procedure miFileClearClick(Sender: TObject);
    procedure edDateBeginExit(Sender: TObject);
    procedure dbluFileTypeEnter(Sender: TObject);
    procedure dbluFileTypeClick(Sender: TObject);
    procedure lcbPaymentChange(Sender: TObject);
    procedure lcbServiceEnter(Sender: TObject);
    procedure lcbServiceClick(Sender: TObject);
    procedure edDateEndExit(Sender: TObject);
    procedure lcbPaymentExit(Sender: TObject);
    procedure mmoNoticeExit(Sender: TObject);
    procedure mmoNoticeChange(Sender: TObject);
    procedure lcbMaterialChange(Sender: TObject);
    procedure edtTextExit(Sender: TObject);
    procedure ednBidKeyPress(Sender: TObject; var Key: Char);
  private
    FNeedDelete: Boolean;
    FFileForSave: String;
    FCustomerInfo: TCustomerInfo;
    FNeedSrv: Boolean;
    FIsOff: Integer;
    FOpenInet: Boolean;
    FSingleSrv: Integer;
    FSinglSrvOnOff: Integer;
    FPeriodService: Integer;
    FPeriodServiceFrm: Integer;
    FPeriodSrvType: Integer;
    FPeriodSrvState: Integer;
    FReqType: Integer;
    FReqTempl: Integer;
    FShowFlatOwner: Boolean;
    FNewContract: Boolean;
    FHandNameInput: String;
    FOwnerS: string;
    FRentS: string;
    FContract: string;
    FNameFmt: string;
    FNoticeFmt: string;
    FOldNumber: string;
    FFullAccess: Boolean;
    FChangeHistory: Boolean;
    FOnlyToday: Boolean;
    FIsLTV: Boolean;
    FLstSrv: string;
    FWorker: string;
    FTextReg: string;
    FText1Reg: string;
    FText2Reg: string;
    FText3Reg: string;
    FText4Reg: string;
    FOwnerOldState: Integer;
    FFileType: Integer;
    FFileTypeName: String;
    FFileInMem: TMemoryStream;
    FProcList: string;
    FCheckTypeProc: string;
    FCheckSaveProc: string;
    FFileRequred: Boolean;
    function FieldsToStr(const str: string): string;
    procedure ShowAddons;
    procedure GetDefValues;
    procedure ShowControlsJson(const json: String);
    function CheckAddons(const errors: Boolean): Boolean;
    function ExecuteAddons(const FileID: Integer): Boolean;
    procedure UpdateNotice;
    procedure CheckAndGenContract;
    procedure SetContract;
    function CheckInBlackList(const Sender: TDBEditEh; const NT: Integer = 0): Boolean;
    function CheckControlText(const Contrl: TDBEditEh; const regexp: String): Boolean;
    procedure FindSamePassport;
    function GetFldAsJson: String;
    procedure SaveDocument(const FileID: Integer);
    function ParseCaptured(const _scanName: string; scResult: TStringList): Boolean;
    procedure TextToFileds(scResult: TStringList);
    procedure SavePhone;
    procedure UpdateCustomerInfo(const CID: Integer);
    function HasErrorInPhone: Boolean;
    function CheckPasport(const errors: Boolean): Boolean;
    procedure ShowFile;
    procedure SaveFlatOwner(const CID: Integer);
    procedure AddOrOffService;
    function MoveService: Integer;
    function GetCustomerByAddress(var oldOwner: Integer): TCustomerInfo;
    procedure AddSingleSrv;
    procedure MakeBidPayment;
    procedure SetPasswordIfEmpty();
    procedure Renegotiation();
    procedure CheckPromo(const CID: Integer = -1);
    procedure ToJudge();
    procedure CreateTask;
    function CheckEnoughMoney: Boolean;
    procedure SetInfoFromRequest;
    function CheckBlockDays: String;
    function CheckDecoder(edt: TDBEditEh): String;
    function IsDecoderText(edt: TDBEditEh): Boolean;
    function CheckDatesOnOff: String;
    procedure MakePromo;
    procedure MoveDVB();
    function GetSrvList: String;
    function ExistsPassportInAccount(const PN: String): Boolean;
    procedure SetImageFromImageList();
    procedure SetFileFromInMemStream();
    function CheckTypeReuse: String;
    function ValidateData(): Boolean;
    function ParamExists(const Param: String): Boolean;
    procedure GetBlockSrvName(var SrvName: String; var OffSrvName: String);
    procedure MakeBlock;
    procedure GetUnBlockSrvName(var SrvName: String; var OffSrvName: String);
    procedure UnMakeBlock;
    procedure QueryClear;
    procedure SetPanelOrder;
    procedure GetCurrentBlock;
    Procedure SetBlockDays;
    function UpdatePayment: Boolean;
    procedure PaymentOrder();
    procedure InstallmentPay;
    procedure OcrFile;
    procedure SetServiceDSparams(CID: Integer; SrvState: Integer);
    procedure ADD_RT();
    procedure GenMaterialsSelect(const CustOnly: Boolean = true);
    function CheckAllowedFT(): TProhibitiontType;
    function ExecSQLforFileType(const aCustomerID: Integer; const aFileID: Integer): TFileTypeAddendumResult;
    function ExecCheckSaveSQL(): TFileTypeAddendumResult;
    function GetProcParams(proc: string; var rSQL: string): TStringDynArray;
    procedure SetProcParamsValue(const aCustomerID: Integer; const aFileID: Integer; qry: TpFIBQuery;
      FList: TStringDynArray);
    procedure MakeDebugLog(Module, SQL: string);
    procedure OpenInetDialog;
    procedure GetRentReturnFields;
    function CheckFileTypeExists(const TypeID: Integer): Boolean;
    // procedure CheckRegistration; // отключили проверку прописку пасопрта
  public
    property CustomerInfo: TCustomerInfo read FCustomerInfo write FCustomerInfo;
    property FileForSave: String read GetFile write SetFile;
    property NeedDelete: Boolean read FNeedDelete;
    property FileInMem: TMemoryStream read FFileInMem;
    procedure SetFileType(const FileType: Integer = -1; const FileTypeName: String = ''; const ProcList: String = '');
  end;

function EditFile(const ci: TCustomerInfo; const Name: string; const CF_ID: Integer = -1;
  const FileName: String = ''): Boolean;

implementation

uses
  Winapi.ShellAPI, System.StrUtils, System.DateUtils, System.RegularExpressions, System.MaskUtils, System.Math,
  AtrCommon, AtrStrUtils, DM, JsonDataObjects, ScanImageForma, BillEditForma, RequestNewForma, synacode, MAIN,
  RequestForma;

{$R *.dfm}

const
  UndefinedSrv = -999;

function EditFile(const ci: TCustomerInfo; const Name: string; const CF_ID: Integer = -1;
  const FileName: String = ''): Boolean;
var
  ForInsert: Boolean;
  i: Integer;
begin

  with TEditCFileForm.Create(Application) do
    try
      CustomerInfo := ci;
      if CF_ID >= 0 then
        dsFileTypes.ParamByName('IsEdit').AsInteger := 1
      else
        dsFileTypes.ParamByName('IsEdit').AsInteger := 0;
      dsFileTypes.Open;
      dsCustFile.ParamByName('CF_ID').AsInteger := CF_ID;
      dsCustFile.Open;
      ForInsert := (CF_ID = -1);
      if ForInsert then
      begin
        dsCustFile.Insert;
        ActiveControl := dbluFileType;
      end
      else
      begin
        dsCustFile.Edit;
        ActiveControl := edtFILE;
        if not dsCustFile.FieldByName('Cf_Type').IsNull then
          SetFileType(dsCustFile['Cf_Type'], dsCustFile['O_NAME'], dsCustFile['O_CHECK']);
      end;

      if not FileName.IsEmpty then
        FileForSave := FileName;

      if ShowModal = mrOk then
      begin
        if ForInsert then
          i := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1)
        else
          i := CF_ID;

        dsCustFile.FieldByName('CF_ID').AsInteger := i;
        dsCustFile.FieldByName('CUSTOMER_ID').AsInteger := ci.CUSTOMER_ID;
        if not(FileForSave.IsEmpty) then
        begin
          try
            TBlobField(dsCustFile.FieldByName('CONTENT')).LoadFromStream(FileInMem);
          finally
            FileInMem.Clear;
          end;
        end;
        dsCustFile.FieldByName('ADDONS').AsString := GetFldAsJson;
        dsCustFile.Post;

        if ForInsert then
        begin
          Result := ExecuteAddons(i);

          if NeedDelete and FileExists(FileForSave) then
            DeleteFile(FileForSave);
        end
        else
          Result := true;
      end
      else
      begin
        dsCustFile.Cancel;
        Result := False;
      end;
      if dsFileTypes.Active then
        dsFileTypes.Close;
    finally
      Free
    end;
end;

function TEditCFileForm.FieldsToStr(const str: string): string;
var
  s, r, o: string;
  own: string;
  sum: Double;
  BID_SUM: Double;
  SRV_SUM: Double;
  PAY_SUM: Double;
  PAYED: Double;
  FINE: Double;
  fs: TFormatSettings;
  oc: TCustomerInfo;
  ow: Integer;
begin
  s := str;
  Result := s;
  if s.IsEmpty then
    Exit;

  RenameFileName;

  fs.ThousandSeparator := '.';
  fs.DecimalSeparator := ',';
  if (FCustomerInfo.Account_No <> '') then
    s := ReplaceStr(s, rsFldACCOUNT, FCustomerInfo.Account_No);
  s := ReplaceStr(s, rsFldBalance, FloatToStr(-1 * FCustomerInfo.Debt_sum, fs));
  s := ReplaceStr(s, rsFldSaldo, FloatToStr(FCustomerInfo.Debt_sum, fs));
  if (FCustomerInfo.STREET <> '') then
    s := ReplaceStr(s, rsFldSTREET, FCustomerInfo.STREET);
  if (FCustomerInfo.HOUSE_no <> '') then
    s := ReplaceStr(s, rsFldHouse, FCustomerInfo.HOUSE_no);
  if (FCustomerInfo.FLAT_NO <> '') then
    s := ReplaceStr(s, rsFldFlat, FCustomerInfo.FLAT_NO);
  if (FCustomerInfo.cust_code <> '') then
    s := ReplaceStr(s, rsFldCodeAbonent, FCustomerInfo.cust_code);
  if (FCustomerInfo.FIO <> '') then
    s := ReplaceStr(s, rsFldFULLNAME, FCustomerInfo.FIO);
  if (pnlPassport.Visible) then
  begin
    if (Trim(edtSURNAME.Text + ' ' + edtFIRSTNAME.Text + ' ' + edtMIDLENAME.Text) <> '') then
    begin
      s := ReplaceStr(s, rsFldApplicantName, Trim(edtSURNAME.Text + ' ' + edtFIRSTNAME.Text + ' ' + edtMIDLENAME.Text));
      s := ReplaceStr(s, rsFldPassportName, Trim(edtSURNAME.Text + ' ' + edtFIRSTNAME.Text + ' ' + edtMIDLENAME.Text));
    end;

    // rsFldPassportResidence = '[ПАСПОРТ_ПРОПИСКА]';
    // rsFldPassportIssue = '[ПАСПОРТ_ВЫДАН_МЕСТО]';
    // rsFldPassportDate = '[ПАСПОРТ_ВЫДАН]';
    // rsFldPassportBirthPlace = '[ПАСПОРТ_РОЖД_МЕСТО]';
    // rsFldPassportBirthDate = '[ПАСПОРТ_РОЖД_ДАТА]';

    if (edtRegistration.Text <> '') then
      s := ReplaceStr(s, rsFldPassportIssue, edtRegistration.Text);
    if (not VarIsNull(edtDOCDATE.value)) then
      s := ReplaceStr(s, rsFldPassportDate, FormatDateTime('dd.mm.yyyy', edtDOCDATE.value));
    if (edtPlaceBirth.Text <> '') then
      s := ReplaceStr(s, rsFldPassportBirthPlace, edtPlaceBirth.Text);
    if (not VarIsNull(edtBIRTHDAY.value)) then
      s := ReplaceStr(s, rsFldPassportBirthDate, FormatDateTime('dd.mm.yyyy', edtBIRTHDAY.value));
    if (edtADRES_REGISTR.Text <> '') then
      s := ReplaceStr(s, rsFldPassportResidence, edtADRES_REGISTR.Text);
  end
  else
  begin
    if (FCustomerInfo.FIO <> '') then
      s := ReplaceStr(s, rsFldApplicantName, FCustomerInfo.FIO);
  end;

  if (dmMain.UserFIO <> '') then
    s := ReplaceStr(s, rsFldOperator, dmMain.UserFIO);
  s := ReplaceStr(s, rsFldCurrentDate, FormatDateTime('dd.mm.yyyy', Date()));
  if (edtFILE.Text <> '') then
    s := ReplaceStr(s, rsFldFile, edtFILE.Text);
  if (edtNAME.Text <> '') then
    s := ReplaceStr(s, rsFldFileName, edtNAME.Text);
  if (edtPASSPORT.Text <> '') then
    s := ReplaceStr(s, rsFldPassportN, edtPASSPORT.Text);
  if pnlMobile.Visible and (edtMobile.Text <> '') then
    s := ReplaceStr(s, rsFldMobile, edtMobile.Text)
  else
    s := ReplaceStr(s, rsFldMobile, FCustomerInfo.mobile);

  s := ReplaceStr(s, rsFldText, edtText.Text);
  s := ReplaceStr(s, rsFldText1, edtText1.Text);
  s := ReplaceStr(s, rsFldText2, edtText2.Text);
  s := ReplaceStr(s, rsFldText3, edtText3.Text);
  s := ReplaceStr(s, rsFldText4, edtText4.Text);

  if pnlSrv.Visible then
  begin
    if not lcbService.Text.IsEmpty then
      s := ReplaceStr(s, rsFldFileSrv, lcbService.Text);
    if not lcbOnOffSrv.Text.IsEmpty then
      s := ReplaceStr(s, rsFldFileOnOffSrv, lcbOnOffSrv.Text);
    if not VarIsNull(edDateSrv.value) then
      s := ReplaceStr(s, rsFldFileDate, edDateSrv.Text);
  end
  else
  begin
    if s.Contains(rsFldFileSrv) or s.Contains(rsFldFileOnOffSrv) then
    begin
      // s := GetAndRepalceSrvFromDB(s);
      GetBlockSrvName(r, o);
      if (r.IsEmpty and o.IsEmpty) then
        // если не блокировка, то может снятие блокировки
        GetUnBlockSrvName(r, o);

      if not r.IsEmpty then
        s := ReplaceStr(s, rsFldFileSrv, r);
      if not o.IsEmpty then
        s := ReplaceStr(s, rsFldFileOnOffSrv, o);

    end;
  end;

  if pnlPeriod.Visible then
  begin
    if (not VarIsNull(edDateBegin.value)) then
      s := ReplaceStr(s, '[ДАТА_Н]', FormatDateTime('dd.mm.yyyy', edDateBegin.value));
    if (not VarIsNull(edDateEnd.value)) then
      s := ReplaceStr(s, '[ДАТА_О]', FormatDateTime('dd.mm.yyyy', edDateEnd.value));
    if not VarIsNull(edDateSrv.value) then
      s := ReplaceStr(s, rsFldFileDate, edDateSrv.Text);
  end;

  s := ReplaceStr(s, '[ИСПОЛН]', FWorker);
  fs.ThousandSeparator := '.';
  fs.DecimalSeparator := ',';
  if pnlBidPay.Visible then
  begin
    if (ednBid.Text <> '') then
      s := ReplaceStr(s, rsBidN, ednBid.Text);

    if not ednFineSum.Text.IsEmpty then
      s := ReplaceStr(s, rsFldFINE, FloatToStr(ednFineSum.value, fs))
    else
      s := ReplaceStr(s, rsFldFINE, '');

    if ednBidSum.Visible then
    begin
      sum := 0;
      PAY_SUM := 0; // оплата
      PAYED := 0; // оплата до
      SRV_SUM := 0; // оплата услуг
      FINE := 0; // пеня
      BID_SUM := 0; // Сумма в заявке
      // ednBidSum.Tag Сумма оплаты услуг
      if not ednBidSum.Text.IsEmpty then
      begin
        BID_SUM := ednBidSum.value;
        SRV_SUM := ednBidSum.Tag / 100;
      end;
      // ednCheckSum.Tag Сумма частиной опалты
      if not ednCheckSum.Text.IsEmpty then
      begin
        PAY_SUM := ednCheckSum.value;
        PAYED := ednCheckSum.Tag / 100;
      end;
      if not ednFineSum.Text.IsEmpty then
        FINE := ednFineSum.value;

      sum := BID_SUM + SRV_SUM - PAY_SUM - PAYED - FINE;

      if sum < 0 then
      begin
        sum := -1 * sum + SRV_SUM;
        // PAY_SUM := BID_SUM - SRV_SUM - PAYED - FINE;
      end
      else
      begin
        if sum = 0 then
        begin
          sum := SRV_SUM;
        end
        else
        begin
          if BID_SUM < PAY_SUM then
          begin
            sum := PAY_SUM - BID_SUM;
            PAY_SUM := BID_SUM;
          end
          else
          begin
            sum := 0;
          end;
        end;
      end;

      sum := Round(sum * 100) / 100;

      s := ReplaceStr(s, '[СУММА_ЗАЯВКИ]', FloatToStr(BID_SUM, fs));
      s := ReplaceStr(s, rsFldPAYMENT, FloatToStr(PAY_SUM, fs));
      s := ReplaceStr(s, '[СУММА_ОСТАТОК]', FloatToStr(sum, fs));
    end
    else
    begin
      if not ednCheckSum.Text.IsEmpty then
        s := ReplaceStr(s, rsFldPAYMENT, FloatToStr(ednCheckSum.value, fs));
    end;
  end;

  if pnlPayment.Visible then
    s := ReplaceStr(s, rsFldPAYMENTINFO, lcbPayment.Text);

  if pnlMaterials.Visible then
    s := ReplaceStr(s, rsFldMaterial, lcbMaterial.Text);

  own := FCustomerInfo.STREET + ' ' + FCustomerInfo.HOUSE_no + ' ' + FCustomerInfo.FLAT_NO;
  if (own.Trim <> '') then
    s := ReplaceStr(s, rsAddress, own);

  if pnlAdr.Visible then
  begin
    own := lcbStreets.Text + ' ' + lcbHOUSE.Text + ' ' + lcbFLAT.Text;
    if (own.Trim <> '') then
      s := ReplaceStr(s, rsOldAddress, own);
    if (s.Contains(rsOldAccount) or s.Contains(rsOldCode)) then
    begin
      //
      oc := GetCustomerByAddress(ow);
      if oc.CUSTOMER_ID > 0 then
      begin
        s := ReplaceStr(s, rsOldAccount, oc.Account_No);
        s := ReplaceStr(s, rsOldCode, oc.cust_code);
      end
    end;
  end;
  if mmoNotice.Visible then
    s := ReplaceStr(s, rsFldNOTICE, mmoNotice.Lines.Text);

  own := '';
  if chkFOwner.Checked then
    own := Trim(Format(FOwnerS, ['']))
  else
  begin
    if chkFOwner.State <> cbGrayed then
      own := Trim(Format(FRentS, ['']));
  end;

  if not own.IsEmpty then
  begin
    s := ReplaceStr(s, rsFldOwner, own);
  end;

  if FShowFlatOwner then
  begin
    if chkFOwner.Checked then
      s := ReplaceStr(s, rsFldOwnerText, 'СОБСТВЕННИК')
    else if (chkFOwner.State = cbUnchecked) then
      s := ReplaceStr(s, rsFldOwnerText, 'АРЕНДАТОР')
    else
      s := ReplaceStr(s, rsFldOwnerText, '');

    if not VarIsNull(edtContractDate.value) then
      s := ReplaceStr(s, rsFldContractDate, FormatDateTime('dd.mm.yyyy', edtContractDate.value));
    if (edtContract.Text <> '') then
      s := ReplaceStr(s, rsFldContract, edtContract.Text);
  end;

  if s.Contains('[СПИСОК_УСЛ]') then
    s := ReplaceStr(s, '[СПИСОК_УСЛ]', GetSrvList());

  Result := s;
end;

function TEditCFileForm.ParseCaptured(const _scanName: string; scResult: TStringList): Boolean;
begin
  Result := A4MainForm.ParseCaptured(_scanName, scResult);
end;

procedure TEditCFileForm.TextToFileds(scResult: TStringList);
var
  s: string;
  i: Integer;
  r: TStringDynArray;
  fs: TFormatSettings;
  PN: String;
  ps: String;
  p_RO: String;
  P_RD: String;
  d: TDateTime;
begin
  edtBIRTHDAY.Clear;
  edtDOCDATE.Clear;
  edtFIRSTNAME.Text := '';
  edtSURNAME.Text := '';
  edtMIDLENAME.Text := '';
  edtPlaceBirth.Text := '';
  edtPASSPORT.Text := '';
  edtRegistration.Text := '';

  fs.DateSeparator := '.';
  fs.ShortDateFormat := 'dd.mm.yyyy';
  p_RO := '';
  P_RD := '';
  for i := 0 to scResult.Count - 1 do
  begin
    s := Trim(scResult[i]);
    r := Explode(']', s);
    if length(r) > 0 then
    begin
      s := r[0];
      s := Copy(s, 1, pos(' ', s) - 1);
      if s = 'name' then
        edtFIRSTNAME.Text := NormalizeFIO(Trim(r[1]))
      else if s = 'surname' then
        edtSURNAME.Text := NormalizeFIO(Trim(r[1]))
      else if s = 'patronymic' then
        edtMIDLENAME.Text := NormalizeFIO(Trim(r[1]))
      else if s = 'birthdate' then
      begin
        s := Trim(r[1]);
        if (not s.IsEmpty) and TryStrToDate(s, d, fs) then
          edtBIRTHDAY.value := d;
      end
      else if s = 'birthplace' then
        edtPlaceBirth.Text := Trim(r[1])
      else if s = 'series' then
      begin
        ps := Trim(r[1]);
      end
      else if s = 'number' then
      begin
        PN := Trim(r[1]);
      end
      else if s = 'authority' then
        p_RO := Trim(r[1])
      else if s = 'issue_date' then
      begin
        s := Trim(r[1]);
        if (not s.IsEmpty) and TryStrToDate(s, d, fs) then
        begin
          P_RD := DateToStr(d, fs);
          edtDOCDATE.value := d;
        end;
      end

    end;
  end;

  if not(ps.IsEmpty and PN.IsEmpty) then
  begin
    edtPASSPORT.Text := Trim(ps + ' ' + PN);
  end;

  edtRegistration.Text := Trim(p_RO);
end;

procedure TEditCFileForm.btnOcrClick(Sender: TObject);
begin
  OcrFile;
end;

procedure TEditCFileForm.OcrFile;
var
  scResult: TStringList;
  TmpFile: String;
  cr: TCursor;
  vNeed: Boolean;
begin
  vNeed := False;
  if FFileInMem.Size <> 0 then
  begin
    TmpFile := ExtractFileName(edtFILE.Text);
    TmpFile := GetTempDir() + TmpFile;
    if FileExists(TmpFile) then
      DeleteFile(TmpFile);

    FFileInMem.SaveToFile(TmpFile);
    vNeed := true;
  end;

  if not vNeed then
    Exit;

  scResult := TStringList.Create;
  cr := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if ParseCaptured(TmpFile, scResult) then
      TextToFileds(scResult);
    // SetFile(TmpFile);
    if FileExists(TmpFile) then
      DeleteFile(TmpFile);
  finally
    FreeAndNil(scResult);
    Screen.Cursor := cr;
  end;
end;

procedure TEditCFileForm.btnOkClick(Sender: TObject);
var
  errors: Boolean;
  AResult: TFileTypeAddendumResult;
begin
  if not btnOk.Visible then
    Exit;

  errors := ValidateData();

  if (not errors) and (FIsLTV) and (btnOk.Tag = 0) then
  begin
    if (dsCustFile.State = dsInsert) and FFileRequred and
      (Application.MessageBox('Вы проверили файл который добавляете?', 'Проверка файла',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO) then
    begin
      errors := true;
      btnOk.Tag := 1;
      ShowFile;
    end;
  end;

  if (not errors) and (FCheckSaveProc <> '') then
  begin
    AResult := ExecCheckSaveSQL();
    errors := AResult.RemoveFile;
    if (AResult.Message <> '') then
      MessageBoxW(Handle, PWideChar(WideFormat('Ошибка: %s', [AResult.Message])), 'Проверка', MB_OK + MB_ICONSTOP);
  end;

  if not errors then
  begin
    ModalResult := mrOk
  end
  else
    ModalResult := mrNone;
end;

procedure TEditCFileForm.btnScanerClick(Sender: TObject);
begin
  btnOk.Tag := 0; // покажем запрос проверки файла после сканирования

  if FFileInMem.Size > 0 then
    FFileInMem.Clear;

  if ScanDocumentToStream(FFileInMem) then
  begin
    FFileInMem.Seek(0, soBeginning);
    SetFileFromInMemStream();
    FNeedDelete := true;
  end;
end;

procedure TEditCFileForm.dbluFileTypeClick(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    Exit;

  if (Sender as TDBLookupComboboxEh).Tag = 0 then
  begin
    if not(Sender as TDBLookupComboboxEh).ListVisible then
      (Sender as TDBLookupComboboxEh).DropDown
    else
      (Sender as TDBLookupComboboxEh).CloseUp(False);
  end;

  (Sender as TDBLookupComboboxEh).Tag := 0;
end;

procedure TEditCFileForm.dbluFileTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsFileTypes.Active) and (not dsFileTypes.FieldByName('O_DIMENSION').IsNull) then
    Background := StringToColor(dsFileTypes['O_DIMENSION'])
  else
    Background := clWindow;
end;

procedure TEditCFileForm.dbluFileTypeEnter(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    Exit;

  if not(Sender as TDBLookupComboboxEh).ListVisible then
  begin
    (Sender as TDBLookupComboboxEh).DropDown;
    (Sender as TDBLookupComboboxEh).Tag := 1;
  end;
end;

procedure TEditCFileForm.dbluFileTypeExit(Sender: TObject);
var
  Prohibit: TProhibitiontType;
begin
  if dbluFileType.Text = '' then
    Exit;

  if (not VarIsNull(dbluFileType.value)) then
  begin
    if (FFileType <> dbluFileType.value) then
    begin
      if (dsCustFile.State = dsInsert) then
      begin
        FFileRequred := true;
        dsFileTypes.DisableControls;
        dsFileTypes.Locate('O_ID', dbluFileType.value, []);
        dsFileTypes.EnableControls;
        Prohibit := CheckAllowedFT();
        if (not Prohibit.Message.IsEmpty) then
          ShowMessage(Prohibit.Message);

        // если нет запрета, то разрешаем этот тип файла, продолжаем
        if (not Prohibit.Lock) then
        begin
          SetFileType(dbluFileType.value, dbluFileType.Text, dsFileTypes['O_CHECK']);
          ShowAddons;
          UpdateNotice;

          if FIsLTV then
          begin
            if (FFileTypeName.Contains('ОТКЛ') or FFileTypeName.Contains('СМЕН')) then
              CheckPromo;
            edtFILE.EditButtons[0].Visible := (not FFileTypeName.Contains('ПАСПОРТ'));
          end;
        end
        else
        begin
          FFileType := -1;
          dbluFileType.SetFocus;
        end;
      end;
    end;
  end
  else
    SetFileType(-1);
end;

procedure TEditCFileForm.edDateSrvChange(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.ednBidExit(Sender: TObject);
begin
  SetInfoFromRequest;
  UpdateNotice;
end;

procedure TEditCFileForm.ednBidKeyPress(Sender: TObject; var Key: Char);
begin
  ednBid.Tag := 0;
end;

procedure TEditCFileForm.edDateBeginExit(Sender: TObject);
begin
  if FIsLTV then
  begin
    if FFileTypeName.Contains('ПОДК') then
    begin
      if FFileTypeName.Contains('СПД.') and (FFileTypeName.Contains('БЛОК')) then
        SetBlockDays
      else
      begin
        if FFileTypeName.Contains('РАССР') then
          if edDateEnd.Visible and VarIsNull(edDateEnd.value) and not VarIsNull(edDateBegin.value) then
            edDateEnd.value := IncMonth(edDateBegin.value, 25);
      end;
    end;
  end;

  UpdateNotice;
end;

procedure TEditCFileForm.edDateEndExit(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.edtContractDateExit(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.edtContractExit(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.edtFILEEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if edtFILE.EditButtons[0].Visible then
  begin
    if dlgOpen.Execute then
    begin
      SetFile(dlgOpen.FileName);
      btnScaner.TabStop := False;
    end
    else
      btnScaner.TabStop := true;
  end;

  Handled := true;
end;

procedure TEditCFileForm.edtFILEEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  ShowFile;
  Handled := true;
end;

procedure TEditCFileForm.edtFILEExit(Sender: TObject);
begin
  if (edtFILE.Text.IsEmpty) and (not FFileForSave.IsEmpty) then
    SetFile(edtFILE.Text);
end;

procedure TEditCFileForm.edtFIOChange(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.edtMobileExit(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.edtNAMEChange(Sender: TObject);
var
  s: string;
begin
  if not FNameFmt.IsEmpty then
  begin
    s := FieldsToStr(FNameFmt);
    FHandNameInput := ReplaceStr(edtNAME.Text, s, '').Trim;
  end;
end;

procedure TEditCFileForm.edtPASSPORTEnter(Sender: TObject);
begin
  FOldNumber := edtPASSPORT.Text;
end;

procedure TEditCFileForm.edtPASSPORTExit(Sender: TObject);
var
  s: string;
begin
  s := (Sender as TDBEditEh).Text;
  if FIsLTV then
  begin
    s := DigitsOnly(s);
    s := Copy(s, 1, 4) + ' ' + Copy(s, 5, 255);
    if length(s) <> 11 then
    begin
      edtPASSPORT.OnEnter := nil;

      if Application.MessageBox('Номер паспорта не заполнен.'#13#10'Попробовать распознать?',
        'Проверьте номер паспорта', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDYES then
      begin
        OcrFile;
      end;
      edtPASSPORT.SetFocus;
      edtPASSPORT.OnEnter := edtPASSPORTEnter;
      Exit;
    end;
  end
  else
    s := s.Trim;

  if s <> (Sender as TDBEditEh).Text then
    (Sender as TDBEditEh).Text := s;

  if FOldNumber = (Sender as TDBEditEh).Text then
    Exit;

  if CheckControlText((Sender as TDBEditEh), dmMain.GetSettingsValue('REG_PASSN')) then
    CheckInBlackList((Sender as TDBEditEh), 1);

  if not ExistsPassportInAccount(s) then
  begin
    if Application.MessageBox('Ранее паспорт у абонента не регистрировался. Продолжить?', 'Странный паспорт',
      MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDNO then
    begin
      edtPASSPORT.OnEnter := nil;
      edtPASSPORT.SetFocus;
      edtPASSPORT.OnEnter := edtPASSPORTEnter;
      FOldNumber := '';
      Exit;
    end
    else
    begin
      if not FFileTypeName.Contains('ПАСПОРТ - ФОТО') then
      begin
        ShowMessage('Необходимо для этого паспорта создать файл ПАСПОРТ - ФОТО');
        edtPASSPORT.OnEnter := nil;
        edtPASSPORT.SetFocus;
        edtPASSPORT.OnEnter := edtPASSPORTEnter;
        FOldNumber := '';
        Exit;
      end;
    end;
  end;

  FindSamePassport;
  UpdateNotice;
end;

procedure TEditCFileForm.edtSURNAMEChange(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.edtTextExit(Sender: TObject);
begin
  if (Sender is TDBEditEh) then
  begin
    if ((Sender as TDBEditEh).Text <> (Sender as TDBEditEh).Text.Trim) then
      (Sender as TDBEditEh).Text := (Sender as TDBEditEh).Text.Trim;
  end;
  UpdateNotice;
end;

procedure TEditCFileForm.FormCreate(Sender: TObject);
var
  s: string;
begin
  FFileInMem := TMemoryStream.Create;
  SetFileType(-1);
  FNeedDelete := False;
  FLstSrv := '';
  FFullAccess := dmMain.AllowedAction(rght_Customer_full);
  FChangeHistory := dmMain.AllowedAction(rght_Customer_History);
  FOnlyToday := dmMain.AllowedAction(rght_Pays_AddToday);

  s := dmMain.GetSettingsValue('MOBILE_FMT');
  if s <> '' then
    edtMobile.EditMask := s + ';1;_';

  s := dmMain.GetCompanyValue('NAME');
  FIsLTV := s.Contains('ЛТВ');

  FCheckTypeProc := dmMain.GetSettingsValue('FT_CHECK_PERMISSIONS');
  FCheckSaveProc := dmMain.GetSettingsValue('FT_CHECK_SAVE');
end;

procedure TEditCFileForm.FormDestroy(Sender: TObject);
begin
  if FNeedDelete and (not FFileForSave.IsEmpty) and FileExists(FFileForSave) then
    DeleteFile(FFileForSave);

  if dsOnOffService.Active then
    dsOnOffService.Close;
  if dsService.Active then
    dsService.Close;
  if dsMaterials.Active then
    dsMaterials.Close;
  if dsFLAT.Active then
    dsFLAT.Close;
  if dsHomes.Active then
    dsHomes.Close;
  if dsStreets.Active then
    dsStreets.Close;

  if FFileInMem.Size > 0 then
    FFileInMem.Clear;
  FreeAndNil(FFileInMem);
end;

procedure TEditCFileForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    btnOkClick(Sender);
end;

procedure TEditCFileForm.FormShow(Sender: TObject);
begin
  FShowFlatOwner := (dmMain.GetSettingsValue('FLAT_OWNER') = '1');
  FNewContract := (dmMain.GetSettingsValue('CAN_NEW_CONTRACT') = '1');
  FContract := '';
  chkFOwner.Visible := FShowFlatOwner;
  // chkNewOwner.Visible := FShowFlatOwner;

  if FShowFlatOwner then
  begin
    FOwnerS := dmMain.GetSettingsValue('FLAT_OWNER_C_STR');
    FRentS := dmMain.GetSettingsValue('FLAT_RENT_C_STR');
    if FOwnerS.IsEmpty then
      FOwnerS := '%s' // Для функции формат
    else
    begin
      if not FOwnerS.Contains('%s') then
        FOwnerS := FOwnerS + '%s';
    end;

    if FRentS.IsEmpty then
      FRentS := '%s' // Для функции формат
    else
    begin
      if not FRentS.Contains('%s') then
        FRentS := FRentS + '%s';
    end;
  end;

  pnlSrv.Visible := False;
end;

procedure TEditCFileForm.SetFile(value: String);
var
  s: String;
  Stream: TStream;
begin
  if not value.IsEmpty then
  begin
    s := ExtractFileExt(value);

    if UpperCase(s) = '.TMP' then
    begin
      s := ExtractFileName(value);
      s := ChangeFileExt(s, '.JPG');
    end
    else
      s := ExtractFileName(value);

    edtFILE.Text := s;
    edtFILE.Hint := value;
    edtFILE.Tag := 1;

    Stream := TFileStream.Create(value, fmShareDenyNone); // fmOpenRead
    try
      FFileInMem.LoadFromStream(Stream);
    finally
      Stream.Free;
    end;

    FFileInMem.Seek(0, soBeginning);
    if FNeedDelete then
      DeleteFile(value);
    FNeedDelete := False;
    dbluFileType.Enabled := False;
  end
  else
  begin
    edtFILE.Text := '';
    edtFILE.Hint := '';
    edtFILE.Tag := 0;
    FFileInMem.Clear;
    FNeedDelete := False;
    dbluFileType.Enabled := true;
  end;

  FFileForSave := value;
end;

procedure TEditCFileForm.SetFileFromInMemStream();
var
  s: String;
  new, ext: string;
begin
  if FFileInMem.Size > 0 then
  begin
    ext := '.jpg';
    new := FCustomerInfo.Account_No;
    if pnlPassport.Visible and (edtPASSPORT.Text <> '') then
    begin
      new := new + '.' + edtPASSPORT.Text.Trim;
    end
    else if pnlBidPay.Visible and ednBid.Visible and (ednBid.Text <> '') then
    begin
      new := new + '.' + ednBid.Text.Trim;
    end
    else
      new := new + '.' + IntToStr(dbluFileType.value);

    FFileForSave := GetTempDir() + new.Replace(' ', '_') + '.' + FormatDateTime('yymdnsz', now()) + ext;

    s := ExtractFileName(FFileForSave);

    edtFILE.Text := s;
    edtFILE.Hint := FFileForSave;
    edtFILE.Tag := 1;

    FNeedDelete := False;
    dbluFileType.Enabled := False;
  end
  else
  begin
    edtFILE.Text := '';
    edtFILE.Hint := '';
    edtFILE.Tag := 0;
    FFileInMem.Clear;
    FNeedDelete := False;
    dbluFileType.Enabled := true;
    FFileForSave := '';
  end;

end;

procedure TEditCFileForm.RenameFileName;
var
  TmpFile, new, ext: string;
begin
  if (edtFILE.Hint = '') then
    Exit;

  TmpFile := ExtractFileName(edtFILE.Hint);
  ext := ExtractFileExt(edtFILE.Hint);

  new := FCustomerInfo.Account_No;

  if pnlPassport.Visible and (edtPASSPORT.Text <> '') then
  begin
    new := new + '.' + edtPASSPORT.Text.Trim;
  end
  else if pnlBidPay.Visible and ednBid.Visible and (ednBid.Text <> '') then
  begin
    new := new + '.' + ednBid.Text.Trim;
  end
  else
    new := new + '.' + IntToStr(dbluFileType.value);

  edtFILE.Text := new.Replace(' ', '_') + '.' + FormatDateTime('yymdnsz', now()) + ext;
end;

function TEditCFileForm.GetFile: String;
begin
  Result := FFileForSave;
end;

procedure TEditCFileForm.lcbFLATExit(Sender: TObject);
var
  c: TCustomerInfo;
  CID: Integer;
  oldOwner: Integer;
begin
  if pnlSrv.Visible then
  begin
    if dsOnOffService.Active then
      dsOnOffService.Close;
    if dsService.Active then
      dsService.Close;
    c := GetCustomerByAddress(oldOwner);
    CID := c.CUSTOMER_ID;
    if CID > 0 then
    begin
      SetServiceDSparams(CID, FIsOff);

      if FIsLTV then
        CheckPromo(CID);
    end;
  end;
end;

procedure TEditCFileForm.lcbMaterialChange(Sender: TObject);
begin
  if not VarIsNull(lcbMaterial.KeyValue) then
    ednCheckSum.value := lcbMaterial.KeyValue;
end;

procedure TEditCFileForm.SetServiceDSparams(CID: Integer; SrvState: Integer);
begin
  if dsOnOffService.Active then
    dsOnOffService.Close;
  if dsService.Active then
    dsService.Close;
  if dsServiceFrom.Active then
    dsServiceFrom.Close;

  if FPeriodServiceFrm = UndefinedSrv then
  begin
    dsService.ParamByName('CUSTOMER_ID').AsInteger := CID;
    if FIsLTV and (FFileTypeName.Contains('ОТКЛ') and FFileTypeName.Contains('ДОСРОЧНО')) then
    begin
      if FFileTypeName.Contains('СТВ') then
        dsService.ParamByName('state').AsInteger := 0
      else
        dsService.ParamByName('state').AsInteger := 1
    end
    else
      dsService.ParamByName('state').AsInteger := SrvState;
    dsService.ParamByName('srv_type').AsInteger := FPeriodSrvType;
    dsService.ParamByName('Srv').AsInteger := FPeriodService;
  end
  else
  begin
    dsService.ParamByName('CUSTOMER_ID').AsInteger := CID;
    dsService.ParamByName('state').AsInteger := 1; // FPeriodSrvState;
    dsService.ParamByName('srv_type').AsInteger := FPeriodSrvType;
    dsService.ParamByName('Srv').AsInteger := FPeriodService;

    dsServiceFrom.ParamByName('CUSTOMER_ID').AsInteger := CID;
    dsServiceFrom.ParamByName('state').AsInteger := 0; // FPeriodSrvState;
    dsServiceFrom.ParamByName('srv_type').AsInteger := FPeriodSrvType;
    dsServiceFrom.ParamByName('Srv').AsInteger := FPeriodServiceFrm;
  end;

  dsOnOffService.ParamByName('customer_id').AsInteger := CID;
  dsOnOffService.ParamByName('off').AsInteger := FIsOff;

  if ((FIsOff = 1) and (FIsLTV) and (FCustomerInfo.Debt_sum > 0)) then
  begin
    if FSinglSrvOnOff > UndefinedSrv then
      dsOnOffService.ParamByName('add_filter').AsString := '(upper(o.Name) Like ''%НЕУП%'') or (ID = :onoffsrv)'
    else
      dsOnOffService.ParamByName('add_filter').AsString := 'upper(o.Name) Like ''%НЕУП%'''
  end
  else
    dsOnOffService.ParamByName('add_filter').AsString := '1=1';

  dsOnOffService.ParamByName('onoffsrv').AsInteger := FSinglSrvOnOff;

  if FPeriodServiceFrm <> UndefinedSrv then
    dsServiceFrom.Open;

  dsService.Open;
  dsOnOffService.Open;
end;

procedure TEditCFileForm.lcbOnOffSrvChange(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.lcbPaymentChange(Sender: TObject);
begin
  //
  if lcbPayment.Text.IsEmpty then
  begin
    ednCheckSum.Text := '';
    ednFineSum.Text := '';
  end
  else
  begin
    if not dsPayment.FieldByName('PAY_SUM').IsNull then
      ednCheckSum.value := dsPayment['PAY_SUM'];
    if not dsPayment.FieldByName('FINE_SUM').IsNull then
      ednFineSum.value := dsPayment['FINE_SUM'];
  end;
end;

procedure TEditCFileForm.lcbPaymentExit(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.lcbServiceChange(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.lcbServiceClick(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    Exit;

  if (Sender as TDBLookupComboboxEh).Tag = 0 then
  begin
    if not(Sender as TDBLookupComboboxEh).ListVisible then
      (Sender as TDBLookupComboboxEh).DropDown
    else
      (Sender as TDBLookupComboboxEh).CloseUp(False);
  end;

  (Sender as TDBLookupComboboxEh).Tag := 0;
end;

procedure TEditCFileForm.lcbServiceEnter(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    Exit;

  if not(Sender as TDBLookupComboboxEh).ListVisible then
  begin
    (Sender as TDBLookupComboboxEh).DropDown;
    (Sender as TDBLookupComboboxEh).Tag := 1;
  end;
end;

procedure TEditCFileForm.GetDefValues;
var
  Q: TpFIBQuery;
  s: string;
begin
  if not FIsLTV then
    Exit;

  GetRentReturnFields;

  s := '';
  if FFileTypeName.Contains('СУД.') then
  begin
    if FFileTypeName.Contains('ГОСПОШЛИНА') then
      s := 'select get_setting_int_value(''JUDGE_N'') JN from rdb$database '
    else
      s := Format('select Ca_Value JN from Customer_Attributes where O_Id = 212343 and Customer_Id = %s',
        [FCustomerInfo.CUSTOMER_ID.ToString]);
    //

    if not s.IsEmpty then
    begin
      Q := TpFIBQuery.Create(Self);
      try
        Q.DataBase := dmMain.dbTV;
        Q.Transaction := trReadQ;
        Q.SQL.Text := s;
        Q.Transaction.StartTransaction;
        Q.ExecQuery;
        if (Q.FieldIndex['JN'] >= 0) and (not Q.FN('JN').IsNull) then
        begin
          if edtText.EmptyDataInfo.Text.ToUpper.Contains('ПРЕТЕНЗ') then
            edtText.Text := Q.FN('JN').AsString
          else if edtText1.EmptyDataInfo.Text.ToUpper.Contains('ПРЕТЕНЗ') then
            edtText1.Text := Q.FN('JN').AsString
          else if edtText2.EmptyDataInfo.Text.ToUpper.Contains('ПРЕТЕНЗ') then
            edtText2.Text := Q.FN('JN').AsString;
          Q.Transaction.Commit;
        end;
      finally
        Q.Free;
      end;
    end
  end;
end;

procedure TEditCFileForm.ShowAddons;
var
  ItsJson: Boolean;
  WindowLocked: Boolean;
  json: string;
begin
  WindowLocked := LockWindowUpdate(Self.Handle);
  try
    edtNAME.Text := '';
    FHandNameInput := '';
    edtNAME.ReadOnly := False;
    edtNAME.Color := clWindow;
    mmoDesc.ReadOnly := False;
    mmoDesc.Color := clWindow;

    ItsJson := (CustomerInfo.CUSTOMER_ID > 0);
    json := '';
    // if dsFileTypes.Locate('O_ID', FFileType, []) then
    // begin
    if (not dsFileTypes.FieldByName('O_CHARFIELD').IsNull) then
      json := dsFileTypes['O_CHARFIELD'];
    ItsJson := ItsJson and (not json.IsEmpty);
    // end;

    chkContract.Visible := ItsJson and FNewContract and (ParamExists(rsFldContract) or ParamExists(rsFldContractDate));

    pnlSrv.Visible := False;
    btnOcr.Visible := False;
    pnlPassport.Visible := False;
    pnlDoc.Visible := False;
    pnlMobile.Visible := False;
    pnlTask.Visible := False;
    pnlPeriod.Visible := False;
    pnlPayment.Visible := False;
    pnlBidPay.Visible := False;
    pnlAdr.Visible := False;
    ednBid.Visible := False;
    ednBidSum.Visible := False;
    ednCheckSum.Visible := False;
    ednFineSum.Visible := False;
    chkFOwner.Visible := False;
    edDateBegin.Enabled := true;
    // chkFOwner.Enabled := False;
    pnlText.Visible := False;
    lblText.Caption := 'Доп. текст';
    edtText.Visible := False;
    edtText.Text := '';
    edtText.EmptyDataInfo.Text := '';
    edtText.Hint := '';

    lblText1.Caption := rsFldText1;
    edtText1.Visible := False;
    edtText1.EmptyDataInfo.Text := '';
    edtText1.Hint := '';

    lblText2.Visible := False;
    lblText2.Caption := rsFldText2;
    edtText2.Visible := False;

    lblText3.Visible := False;
    lblText3.Caption := rsFldText3;
    edtText3.Visible := False;

    lblText4.Visible := False;
    lblText4.Caption := rsFldText4;
    edtText4.Visible := False;

    FTextReg := '';
    FText1Reg := '';
    FText2Reg := '';
    FText3Reg := '';
    FText4Reg := '';

    FFileInMem.Clear;
    pnlMaterials.Visible := False;
    lcbServiceFrom.Visible := False;
    lcbService.Left := edDateSrv.Left;
    lcbService.Width := pnlSrv.Width - edDateSrv.Left - 5;

    dsService.Active := False;
    dsOnOffService.Active := False;
    dsStreets.Active := False;
    dsHomes.Active := False;
    dsFLAT.Active := False;
    dsMaterials.Active := False;

    FNameFmt := '';
    if (not dsFileTypes.FieldByName('O_DESCRIPTION').IsNull) then
      FNoticeFmt := dsFileTypes['O_DESCRIPTION']
    else
      FNoticeFmt := '';

    FSingleSrv := -1;
    FSinglSrvOnOff := UndefinedSrv;
    FPeriodService := UndefinedSrv;
    FPeriodServiceFrm := UndefinedSrv;
    FPeriodSrvType := -1;
    FPeriodSrvState := -1;
    FReqType := -1;
    FReqTempl := -1;
    FOpenInet := False;
    FNeedSrv := False;

    if ItsJson then
      ShowControlsJson(json);

    mmoNotice.Visible := FNoticeFmt.Contains(rsFldNOTICE);
    splMemo.Visible := mmoNotice.Visible;
    if mmoNotice.Visible then
    begin
      mmoNotice.Height := 40;
    end;

    pnlClient.Visible := true;

    pnlContract.Visible := chkContract.Visible or chkFOwner.Visible;

    if not FNameFmt.IsEmpty then
      edtNAME.EmptyDataInfo.Text := 'Наименование / номер документа ' + FNameFmt;

    dsStreets.Active := pnlAdr.Visible;
    dsHomes.Active := pnlAdr.Visible;
    dsFLAT.Active := pnlAdr.Visible;

    dsService.Active := (pnlSrv.Visible and (not pnlAdr.Visible));
    dsOnOffService.Active := (pnlSrv.Visible and (not pnlAdr.Visible));
    if FIsLTV then
    begin
      if (FFileTypeName.Contains('ПЕРЕОФОРМЛЕНИЕ ДОГОВОРА')) then
      begin
        edtText.Text := GetSrvList;
        edtText.EmptyDataInfo.Text := GetSrvList;
      end
      else if (FFileTypeName.Contains('БЛОК') and FFileTypeName.Contains('ДОСРОЧНО')) then
      begin
        if not FFileTypeName.Contains('ОТКЛ') then
        begin
          edDateBegin.Enabled := False;
          GetCurrentBlock;
        end
        else
        begin
          edDateBegin.Enabled := true;
          edDateBegin.EmptyDataInfo.Text := 'откл. досрочного';
        end;
      end
      else if FFileTypeName.Contains('СПД.') and (FFileTypeName.Contains('БЛОК') and FFileTypeName.Contains('ПОДКЛ'))
      then
        SetBlockDays;
    end;
    GetDefValues;
  finally
    if WindowLocked then
      LockWindowUpdate(0);
  end;
end;

procedure TEditCFileForm.ShowControlsJson(const json: String);
var
  JO: TJsonObject;
  ShowPnl: Boolean;
  s: string;
  w: Integer;
  sa: TStringDynArray;

  procedure SetTextField(cntrl: TDBEditEh; lbl: TLabel; fld: string; var regFld: string);
  begin
    if JO.Contains(fld) and (not JO[fld].IsNull) then
    begin
      cntrl.Visible := true;
      s := JO.s[fld];
      if s.Contains('|') then
      begin
        // меняем двойной || на символы чтоб корректно разбить строук
        s := s.Replace('||', '@^#');
        sa := Explode('|', s);
        cntrl.Text := sa[0];
        if length(sa) > 1 then
          cntrl.EmptyDataInfo.Text := sa[1];
        if length(sa) > 2 then
        begin
          FText1Reg := sa[2].Replace('@^#', '|');
        end;
        if not cntrl.EmptyDataInfo.Text.IsEmpty then
        begin
          lbl.Caption := cntrl.EmptyDataInfo.Text;
          cntrl.Hint := cntrl.EmptyDataInfo.Text;
        end;
      end
      else
        cntrl.Text := s;
    end;
  end;

begin
  JO := TJsonObject.Parse(json) as TJsonObject;
  try
    if JO.Contains('EF') and (not JO['EF'].IsNull) then
      FFileRequred := (JO.i['EF'] <> 1)
    else
      FFileRequred := true;

    if JO.Contains('Nfmt') and (not JO['Nfmt'].IsNull) then
      FNameFmt := JO.s['Nfmt'];

    if JO.Contains('nRO') and (not JO['nRO'].IsNull) then
    begin
      edtNAME.ReadOnly := (not FNameFmt.IsEmpty) and
        (JO.B['nRO'] and (not dmMain.UserIsAdmin) and (not dmMain.AllowedAction(rght_Customer_full)));
      if edtNAME.ReadOnly then
        edtNAME.Color := clBtnFace;
    end;

    if JO.Contains('OnOff') then
    begin
      ShowPnl := true;

      if not JO['OnOff'].IsNull then
        FPeriodSrvState := JO.i['OnOff'];

      case FPeriodSrvState of
        0:
          lblOnOff.Caption := rsOff;
        1:
          lblOnOff.Caption := rsOn;
        2:
          lblOnOff.Caption := 'Переключение';
      else
        begin
          lblOnOff.Caption := '????';
          ShowPnl := False;
        end;
      end;
      pnlSrv.Visible := ShowPnl;

      // if (dmMain.GetIniValue('SET_AS_CURRENT_DATE') <> '0') then
      // begin
      if ShowPnl then
        edDateSrv.value := Date();
      if pnlPeriod.Visible then
        edDateBegin.value := Date();
      // end;
    end;

    if JO.Contains('OpenInet') then
      FOpenInet := JO.B['OpenInet'];

    if JO.Contains('SSrv') and (not JO['SSrv'].IsNull) then
    begin
      FSingleSrv := JO.i['SSrv'];
    end;

    if JO.Contains('SrvOnOff') then
    begin
      FSinglSrvOnOff := JO['SrvOnOff'];
      lcbOnOffSrv.value := FSinglSrvOnOff;
      lcbOnOffSrv.Enabled := False;
    end;

    if JO.Contains('SrvType') then
    begin
      FNeedSrv := true;
      if not JO['SrvType'].IsNull then
      begin
        FPeriodSrvType := JO.i['SrvType'];
        if (JO.Contains('Srv') and (not JO['Srv'].IsNull)) then
        begin
          FPeriodService := JO.i['Srv'];
          lcbService.value := FPeriodService;
          lcbService.Enabled := False;
        end
        else
        begin
          FPeriodService := UndefinedSrv;
          lcbService.Enabled := true;
        end;

        if (JO.Contains('SrvFrm') and (not JO['SrvFrm'].IsNull)) then
        begin
          FPeriodServiceFrm := JO.i['SrvFrm'];
          lcbServiceFrom.value := FPeriodServiceFrm;
          lcbServiceFrom.Enabled := False;

          w := Round((pnlSrv.Width - edDateSrv.Left - 5) / 2);
          lcbServiceFrom.Width := w - 5;
          lcbService.Left := lcbServiceFrom.Left + w;
          lcbService.Width := w;
          lcbServiceFrom.Visible := true;
        end
        else
        begin
          FPeriodServiceFrm := UndefinedSrv;
          lcbServiceFrom.Enabled := true;
        end;

        if FPeriodSrvState = 1 then
          FIsOff := 0
        else
          FIsOff := 1;

        SetServiceDSparams(CustomerInfo.CUSTOMER_ID, FPeriodSrvState);
      end;
    end;

    if JO.Contains('ReqType') and (not JO['ReqType'].IsNull) then
      FReqType := JO.i['ReqType'];

    if JO.Contains('ReqTempl') and (not JO['ReqTempl'].IsNull) then
      FReqTempl := JO.i['ReqTempl'];

    if JO.Contains('Psprt') then
    begin
      if not JO['Psprt'].IsNull then
        pnlPassport.Visible := JO.B['Psprt'];

      if JO.Contains('Card') and (not JO['Card'].IsNull) then
      begin
        pnlDoc.Visible := JO.B['Card'];
        btnOcr.Visible := pnlDoc.Visible;
      end;
    end;

    if JO.Contains('Own') and (not JO['Own'].IsNull) then
      chkFOwner.Visible := JO.B['Own'];

    if JO.Contains('Mobile') and (not JO['Mobile'].IsNull) then
      pnlMobile.Visible := JO.B['Mobile'];

    if JO.Contains('Txt') then
    begin
      if not JO['Txt'].IsNull then
      begin
        pnlText.Visible := JO.B['Txt'];
        edtText.Visible := JO.B['Txt'];
      end;
      {
        SetTextField(edtText, lblText, 'Hint', FTextReg);
        SetTextField(edtText1, lblText1, 'Txt1', FText1Reg);
        SetTextField(edtText2, lblText2, 'Txt2', FText2Reg);
        SetTextField(edtText3, lblText3, 'Txt3', FText3Reg);
      }
      if JO.Contains('Hint') then
      begin
        if not JO['Hint'].IsNull then
        begin
          s := JO.s['Hint'];
          if s.Contains('|') then
          begin
            // меняем двойной || на символы чтоб корректно разбить строук
            s := s.Replace('||', '@^#');
            sa := Explode('|', s);
            edtText.Text := sa[0];
            if length(sa) > 1 then
              edtText.EmptyDataInfo.Text := sa[1];
            if length(sa) > 2 then
            begin
              FTextReg := sa[2].Replace('@^#', '|');
            end;

            if not edtText.EmptyDataInfo.Text.IsEmpty then
            begin
              lblText.Caption := edtText.EmptyDataInfo.Text;
              edtText.Hint := edtText.EmptyDataInfo.Text;
            end;
          end
          else
            edtText.Text := s;
        end;
      end;

      if JO.Contains('Txt1') and (not JO['Txt1'].IsNull) then
      begin
        edtText1.Visible := true;
        s := JO.s['Txt1'];
        if s.Contains('|') then
        begin
          // меняем двойной || на символы чтоб корректно разбить строук
          s := s.Replace('||', '@^#');
          sa := Explode('|', s);
          edtText1.Text := sa[0];
          if length(sa) > 1 then
            edtText1.EmptyDataInfo.Text := sa[1];
          if length(sa) > 2 then
          begin
            FText1Reg := sa[2].Replace('@^#', '|');
          end;
          if not edtText1.EmptyDataInfo.Text.IsEmpty then
          begin
            lblText1.Caption := edtText1.EmptyDataInfo.Text;
            edtText1.Hint := edtText1.EmptyDataInfo.Text;
          end;
        end
        else
          edtText1.Text := s;
      end;

      if JO.Contains('Txt2') and (not JO['Txt2'].IsNull) then
      begin
        edtText2.Visible := true;
        lblText2.Visible := true;
        s := JO.s['Txt2'];
        if s.Contains('|') then
        begin
          s := s.Replace('||', '@^#');
          sa := Explode('|', s);
          edtText2.Text := sa[0];
          if length(sa) > 1 then
            edtText2.EmptyDataInfo.Text := sa[1];
          if length(sa) > 2 then
          begin
            FText2Reg := sa[2].Replace('@^#', '|');
          end;
          if not edtText2.EmptyDataInfo.Text.IsEmpty then
          begin
            lblText2.Caption := edtText2.EmptyDataInfo.Text;
            edtText2.Hint := edtText2.EmptyDataInfo.Text;
          end;
        end
        else
          edtText2.Text := s;
      end;

      if JO.Contains('Txt3') and (not JO['Txt3'].IsNull) then
      begin
        edtText3.Visible := true;
        lblText3.Visible := true;
        s := JO.s['Txt3'];
        if s.Contains('|') then
        begin
          s := s.Replace('||', '@^#');
          sa := Explode('|', s);
          edtText3.Text := sa[0];
          if length(sa) > 1 then
            edtText3.EmptyDataInfo.Text := sa[1];
          if length(sa) > 2 then
          begin
            FText3Reg := sa[2].Replace('@^#', '|');
          end;
          if not edtText3.EmptyDataInfo.Text.IsEmpty then
          begin
            lblText3.Caption := edtText3.EmptyDataInfo.Text;
            edtText3.Hint := edtText3.EmptyDataInfo.Text;
          end;
        end
        else
          edtText3.Text := s;
      end;

      if JO.Contains('Txt4') and (not JO['Txt4'].IsNull) then
      begin
        edtText4.Visible := true;
        lblText4.Visible := true;
        s := JO.s['Txt4'];
        if s.Contains('|') then
        begin
          s := s.Replace('||', '@^#');
          sa := Explode('|', s);
          edtText4.Text := sa[0];
          if length(sa) > 1 then
            edtText4.EmptyDataInfo.Text := sa[1];
          if length(sa) > 2 then
          begin
            FText4Reg := sa[2].Replace('@^#', '|');
          end;
          if not edtText4.EmptyDataInfo.Text.IsEmpty then
          begin
            lblText4.Caption := edtText4.EmptyDataInfo.Text;
            edtText4.Hint := edtText4.EmptyDataInfo.Text;
          end;
        end
        else
          edtText4.Text := s;
      end;

    end;

    if JO.Contains('mRO') and (not JO['mRO'].IsNull) then
    begin
      mmoDesc.ReadOnly := (JO.B['mRO'] and (not dmMain.UserIsAdmin) and (not dmMain.AllowedAction(rght_Customer_full)));
      if mmoDesc.ReadOnly then
        mmoDesc.Color := clBtnFace;
    end;

    if JO.Contains('Bid') and (not JO['Bid'].IsNull) then
      ednBid.Visible := JO.B['Bid'];

    if JO.Contains('Pay') and (not JO['Pay'].IsNull) then
    begin
      ednBidSum.Visible := ednBid.Visible and JO.B['Pay'];
      ednCheckSum.Visible := JO.B['Pay'];
      ednFineSum.Visible := (JO.B['Pay'] and (dmMain.GetSettingsValue('SHOW_FINE') = '1'));
    end;

    if JO.Contains('Adr') and (not JO['Adr'].IsNull) then
      pnlAdr.Visible := JO.B['Adr'];

    if JO.Contains('Tsk') and (not JO['Tsk'].IsNull) then
      pnlTask.Visible := JO.B['Tsk'];

    if JO.Contains('Prd') and (not JO['Prd'].IsNull) then
    begin
      edDateEnd.Visible := true;
      if (JO['Prd'].Typ = jdtBool) then
        pnlPeriod.Visible := JO.B['Prd']
      else if (JO['Prd'].Typ = jdtInt) then
      begin
        pnlPeriod.Visible := (JO.i['Prd'] > 0);
        edDateEnd.Visible := (JO.i['Prd'] = 1);
        if edDateEnd.Visible then
        begin
          lblPeriod.Caption := 'Перод';
          edDateBegin.EmptyDataInfo.Text := 'Начало';
        end
        else
        begin
          lblPeriod.Caption := 'Дата';
          edDateBegin.EmptyDataInfo.Text := 'Дата';
        end;
      end;
    end;

    // убрал, так как смотрим только на настройку Собственик в типе файлов
    // if not chkFOwner.Visible then begin
    // chkFOwner.Visible := FShowFlatOwner and (not pnlPassport.Visible);
    // end;

    lblBP.Visible := ednBid.Visible;
    pnlBidPay.Visible := ednBid.Visible or ednCheckSum.Visible;
    if (FIsLTV) then
    begin
      if (FFileTypeName.Trim = 'КОРРЕКТИРОВКА ПЛАТЕЖА.')
      // or (FFileTypeName.Contains('ОПЛАТА') and FFileTypeName.Contains('ЗАЯВК') and FFileTypeName.Contains('ВЗАИМОРАСЧЕТ'))
      then
      begin
        pnlPayment.Visible := true;
        pnlBidPay.Visible := true;
        ednCheckSum.Visible := true;
        ednFineSum.Visible := (FFileTypeName.Trim = 'КОРРЕКТИРОВКА ПЛАТЕЖА.');
        dsPayment.ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
        dsPayment.Open;
      end;

      if (FFileTypeName.Contains('ШТРАФ')) then
      begin
        ednCheckSum.Visible := False;
      end;
    end;

    if (JO.Contains('Mat')) and (not JO['Mat'].IsNull) and (JO.B['Mat']) then
    begin
      pnlMaterials.Visible := true;
      if (JO.Contains('MatCO')) and (not JO['MatCO'].IsNull) and (JO.B['MatCO']) then
        GenMaterialsSelect(JO.B['MatCO'])
      else
        GenMaterialsSelect(False);
    end
    else
    begin
      pnlMaterials.Visible := (FIsLTV and FFileTypeName.StartsWith('РАССРОЧКА'));
      GenMaterialsSelect(False);
    end;

    SetPanelOrder;

    if ednCheckSum.Visible then
    begin
      if ednBid.Visible then
      begin
        ednCheckSum.EmptyDataInfo.Text := 'Сумма ПКО';
        ednCheckSum.Left := ednBid.Left + ednBid.Width + 6;
      end
      else
      begin
        if not pnlPayment.Visible then
          ednCheckSum.EmptyDataInfo.Text := 'Сумма'
        else
          ednCheckSum.EmptyDataInfo.Text := 'Новая сумма';
        ednCheckSum.Left := 85;
        lblBP.Visible := true;
        lblBP.Caption := ednCheckSum.EmptyDataInfo.Text;
      end;
    end;
  finally
    JO.Free;
  end;
end;

procedure TEditCFileForm.GenMaterialsSelect(const CustOnly: Boolean = true);
begin
  if dsMaterials.Active then
    dsMaterials.Close;

  dsMaterials.SelectSQL.Clear;

  // if CustOnly then пока не реалізовано
  begin
    dsMaterials.SelectSQL.Add('select a.Name, a.Cost, a.M_Id, a.Serial');
    dsMaterials.SelectSQL.Add('  from Appliance a');
    dsMaterials.SelectSQL.Add('  where a.OWN_ID = :CID');
    dsMaterials.SelectSQL.Add('        and a.OWN_TYPE = 1 -- Абонент');
    dsMaterials.SelectSQL.Add('        and a.Property = 2 -- Абонента (Рассрочка)');
    dsMaterials.SelectSQL.Add('  order by a.Name');
    dsMaterials.ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
  end;

  dsMaterials.Active := true;
end;

procedure TEditCFileForm.UpdateNotice;
var
  s: string;
begin

  if (dsCustFile.State = dsInsert) then
  begin
    if not FNameFmt.IsEmpty then
    begin
      s := FieldsToStr(FNameFmt);
      edtNAME.OnChange := nil;
      edtNAME.Text := Trim(s + ' ' + FHandNameInput);
      edtNAME.OnChange := edtNAMEChange;
    end;
    if not FNoticeFmt.IsEmpty then
    begin
      s := FieldsToStr(FNoticeFmt);
      mmoDesc.Lines.Text := s;
    end;
  end;
end;

function TEditCFileForm.CheckAddons(const errors: Boolean): Boolean;
var
  s: string;
  d1, d2: Integer;
begin
  Result := errors;

  if pnlSrv.Visible then
  begin
    if FNeedSrv then
    begin
      if (lcbService.Text = '') then
      begin
        Result := true;
        CnErrors.SetError(lcbService, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(lcbService);

      if (lcbOnOffSrv.Text = '') then
      begin
        Result := true;
        CnErrors.SetError(lcbOnOffSrv, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
      begin
        if ((FSinglSrvOnOff > -1) and (FSinglSrvOnOff <> lcbOnOffSrv.value)) then
        begin
          Result := true;
          CnErrors.SetError(lcbOnOffSrv, rsNotAllowedService, iaMiddleLeft, bsNeverBlink);
        end
        else
          CnErrors.Dispose(lcbOnOffSrv);
      end;

      if (VarIsNull(edDateSrv.value)) then
      begin
        Result := true;
        CnErrors.SetError(edDateSrv, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
      begin
        if (not FFullAccess) and (FIsOff = 1) and (VarToDateTime(edDateSrv.value) < (Date() + 1)) then
        begin
          Result := true;
          CnErrors.SetError(edDateSrv, rsPastDateIncorrect, iaMiddleLeft, bsNeverBlink);
        end
        else
        begin
          // прверим даты подключения
          if (FOnlyToday and (VarToDateTime(edDateSrv.value) < Date())) then
          begin
            Result := true;
            CnErrors.SetError(edDateSrv, rsPastDateIncorrect, iaMiddleLeft, bsNeverBlink);
          end
          else
          begin
            if (((dmMain.InStrictMode) or (not(FFullAccess or FChangeHistory))) and
              (VarToDateTime(edDateSrv.value) < dmMain.CurrentMonth)) then
            begin
              Result := true;
              CnErrors.SetError(edDateSrv, rsPastDateIncorrect, iaMiddleLeft, bsNeverBlink);
            end
            else
              CnErrors.Dispose(edDateSrv);
          end;
        end;

        if (FPeriodServiceFrm <> UndefinedSrv) then
        begin
          s := ExtractDigit(lcbServiceFrom.Text);
          if not TryStrToInt(s, d1) then
            d1 := 1;
          s := ExtractDigit(lcbService.Text);
          if not TryStrToInt(s, d2) then
            d2 := 999;

          if (d2 > d1) or (d1 = 350) then
          begin
            if (VarToDateTime(edDateSrv.value) < Date()) then
            begin
              Result := true;
              CnErrors.SetError(edDateSrv, rsPastDateIncorrect, iaMiddleLeft, bsNeverBlink);
            end
            else
              CnErrors.Dispose(edDateSrv);
          end
          else
          begin
            if (VarToDateTime(edDateSrv.value) <> IncMonth(dmMain.CurrentMonth, 1)) and
              (VarToDateTime(edDateSrv.value) <> IncMonth(dmMain.CurrentMonth, 2)) then
            begin
              Result := true;
              CnErrors.SetError(edDateSrv, rsPastDateIncorrect, iaMiddleLeft, bsNeverBlink);
            end
            else
              CnErrors.Dispose(edDateSrv);
          end;
        end;
      end;

      if not CheckEnoughMoney then
      begin
        Result := true;
        CnErrors.SetError(edDateSrv, rsEnoughMoneyDateIncorrect, iaMiddleLeft, bsNeverBlink);
      end;

      s := CheckDatesOnOff();
      if not s.IsEmpty then
      begin
        Result := true;
        CnErrors.SetError(edDateSrv, s, iaMiddleLeft, bsNeverBlink);
      end;
    end
    else
    begin
      CnErrors.Dispose(lcbService);
      CnErrors.Dispose(edDateSrv);
      CnErrors.Dispose(lcbOnOffSrv);
    end;
  end;

  if pnlPeriod.Visible then
  begin
    if (VarIsNull(edDateBegin.value)) then
    begin
      Result := true;
      CnErrors.SetError(edDateBegin, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
    begin
      if (edDateBegin.value < Date()) and (not dmMain.AllowedAction(rght_Customer_full)) and edDateBegin.Enabled then
      begin
        Result := true;
        CnErrors.SetError(edDateBegin, rsSuspiciousDate, iaMiddleLeft, bsNeverBlink);
      end
      else
      begin
        if (edDateBegin.value <> Date()) and FFileTypeName.Contains('ПОРУЧЕНИЕ') and edDateBegin.Visible and
          edDateBegin.Enabled then
        begin
          Result := true;
          CnErrors.SetError(edDateBegin, rsSuspiciousDate, iaMiddleLeft, bsNeverBlink);
        end
        else
          CnErrors.Dispose(edDateBegin);
      end;
    end;

    if (edDateEnd.Visible) and (VarIsNull(edDateEnd.value)) then
    begin
      Result := true;
      CnErrors.SetError(edDateEnd, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edDateEnd);

    if (edDateEnd.Visible) and (not Result) then
    begin
      s := CheckBlockDays;
      if s <> '' then
      begin
        Result := true;
        CnErrors.SetError(edDateBegin, s, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(edDateBegin);

      if (edDateEnd.value < edDateBegin.value) or (edDateEnd.value < Date()) then
      begin
        Result := true;
        CnErrors.SetError(edDateEnd, rsSuspiciousDate, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(edDateEnd);
    end;
  end;

  if pnlText.Visible then
  begin
    s := CheckDecoder(edtText);
    if s <> '' then
    begin
      Result := true;
      CnErrors.SetError(edtText, s, iaMiddleLeft, bsNeverBlink);
    end;
    s := CheckDecoder(edtText1);
    if s <> '' then
    begin
      Result := true;
      CnErrors.SetError(edtText1, s, iaMiddleLeft, bsNeverBlink);
    end;
    s := CheckDecoder(edtText2);
    if s <> '' then
    begin
      Result := true;
      CnErrors.SetError(edtText2, s, iaMiddleLeft, bsNeverBlink);
    end;
    s := CheckDecoder(edtText3);
    if s <> '' then
    begin
      Result := true;
      CnErrors.SetError(edtText3, s, iaMiddleLeft, bsNeverBlink);
    end;
  end;

  if (not edtNAME.ReadOnly) and edtNAME.Text.Contains('*') then
  begin
    Result := true;
    CnErrors.SetError(edtNAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtNAME);

  if (not mmoDesc.ReadOnly) and mmoDesc.Lines.Text.Contains('***') then
  begin
    Result := true;
    CnErrors.SetError(mmoDesc, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(mmoDesc);
end;

procedure TEditCFileForm.CheckAndGenContract;
begin
  if chkContract.Checked then
  begin
    if not FShowFlatOwner then
    begin
      if not VarIsNull(lcbService.KeyValue) then
        FContract := dmMain.GenerateDogNumberForCustomer(FCustomerInfo.CUSTOMER_ID, lcbService.KeyValue)
      else
        FContract := dmMain.GenerateDogNumberForCustomer(FCustomerInfo.CUSTOMER_ID, -1);
    end
    else
    begin
      if pnlPassport.Visible then
        FContract := edtPASSPORT.Text;
    end;

    SetContract;

    if (dmMain.GetIniValue('SET_AS_CURRENT_DATE') <> '0') then
      edtContractDate.value := Date();
  end;

  if (FShowFlatOwner and FContract.IsEmpty) then
  begin
    if pnlPassport.Visible then
      FContract := edtPASSPORT.Text;

    SetContract;
  end;
end;

procedure TEditCFileForm.chkContractClick(Sender: TObject);
begin
  edtContract.Visible := chkContract.Checked;
  edtContractDate.Visible := chkContract.Checked;
  lblContr.Visible := chkContract.Checked;

  CheckAndGenContract;

  UpdateNotice;
end;

procedure TEditCFileForm.chkFOwnerClick(Sender: TObject);
begin
  if (FOwnerOldState <> 0) then
  begin
    if ((FOwnerOldState = 1) and (not chkFOwner.Checked)) then
      MessageDlg('Ранее этот абонент был отмечен как Собственник', mtWarning, [mbOK], 0)
    else
    begin
      if ((FOwnerOldState = -1) and (chkFOwner.Checked)) then
        MessageDlg('Ранее этот абонент НЕ был отмечен как Собственник', mtWarning, [mbOK], 0);
    end;
  end;

  // CheckRegistration; // отключили проверку прописку пасопрта

  if FContract.IsEmpty then
    CheckAndGenContract
  else
    SetContract;

  UpdateNotice;
end;

{
  // отключили проверку прописку пасопрта
  procedure TEditCFileForm.CheckRegistration;
  begin
  if FIsLTV and chkFOwner.Checked then
  begin
  if FFileTypeName.Contains('ПРОПИСКА') then
  begin
  // 47999 собственность
  if (not edtADRES_REGISTR.Text.Contains(FCustomerInfo.cust_code)) and (not CheckFileTypeExists(47999)) then
  begin
  chkFOwner.Checked := False;
  MessageDlg('Прописка ' + edtADRES_REGISTR.Text + ' отличается от адреса ' + FCustomerInfo.cust_code + #13#10 +
  'Нужен документ Собственность', mtWarning, [mbOK], 0);
  end;
  end;
  end;
  end;
}

procedure TEditCFileForm.SetContract;
var
  s: string;
begin
  s := FContract;
  if FShowFlatOwner then
  begin
    if chkFOwner.Checked then
    begin
      s := Format(FOwnerS, [s]);
    end
    else
    begin
      s := Format(FRentS, [s]);
    end;
  end;
  edtContract.Text := s;
end;

function TEditCFileForm.ExecuteAddons(const FileID: Integer): Boolean;
var
  d: TDate;
  NewCustomer: Integer;
  s, rs, os: String;
  oldOwner: Integer;
  c: TCustomerInfo;
  AResult: TFileTypeAddendumResult;
begin
  // если для типа файла есть процедура, то выполняем только ее, иначе все работает как раньше - пошагово
  AResult := ExecSQLforFileType(FCustomerInfo.CUSTOMER_ID, FileID);
  if AResult.RemoveFile then
  begin
    // удалим файл если ошибка
    //
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;
        SQL.Text := 'delete from Customer_Files where Cf_Id = :FileID';
        ParamByName('FileID').AsInteger := FileID;
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
    Result := False;
    Exit;
  end;

  Result := true;

  // если старый режим работы, то выполним оп шагам
  if (not AResult.Processed) then
  begin
    NewCustomer := -1;
    if (pnlSrv.Visible and FNeedSrv) then
    begin
      AddOrOffService();
      // если указан новый адрес. перенесем туда
      if pnlAdr.Visible then
        NewCustomer := MoveService;
    end;

    MakeBidPayment();
    Renegotiation();
    CreateTask();
    MakeBlock();
    UnMakeBlock();
    MakePromo();
    MoveDVB();
    UpdatePayment();
    PaymentOrder();
    InstallmentPay();
    ADD_RT();
  end;

  if FIsLTV then
  begin
    SavePhone();
    SaveDocument(FileID);
    UpdateCustomerInfo(FCustomerInfo.CUSTOMER_ID);
    SaveFlatOwner(FCustomerInfo.CUSTOMER_ID);
  end;

  if (AResult.Processed) then
  begin
    if (AResult.RQ_ID > 0) then
      ReguestExecute(AResult.RQ_ID, FCustomerInfo.CUSTOMER_ID, 1);
    NewCustomer := AResult.FROM_CID;
  end;

  if (FSingleSrv > -1) then
    AddSingleSrv;

  if FReqType > -1 then
  begin
    if pnlSrv.Visible and (not VarIsNull(edDateSrv.value)) then
      d := edDateSrv.value
    else
    begin
      if pnlPeriod.Visible and (not VarIsNull(edDateBegin.value)) then
        d := edDateBegin.value
      else
        d := Date();
    end;

    NewFileRequest(CustomerInfo.CUSTOMER_ID, FReqType, FReqTempl, d, mmoDesc.Lines.Text, False);
    if pnlAdr.Visible and (NewCustomer > 0) then
    begin
      if FIsLTV then
      begin
        case FReqTempl of
          126631:
            begin // 214 Отключить от И-нет. Переезд на адрес -
              FReqTempl := 126629;
              os := 'Откл';
              rs := 'Подкл';
            end;
          126629:
            begin // 214	Подключить к И-нет. Переезд с адреса -
              FReqTempl := 126631;
              os := 'Подкл';
              rs := 'Откл';
            end;
          126628:
            begin // 101	Подключить к СТВ. Переезд с Адреса -
              FReqTempl := 126630;
              os := 'Подкл';
              rs := 'Откл';
            end;
          352026:
            begin // 101	Подключить к СТВ. Переезд на Адрес -
              FReqTempl := 126630;
              os := 'Подкл';
              rs := 'Откл';
            end;
          126630:
            begin // 101	Отключить от СТВ. Переезд на Адрес -
              FReqTempl := 126628;
              os := 'Откл';
              rs := 'Подл';
            end;
        end;
      end;

      s := mmoDesc.Lines.Text; // ReplaceStr(mmoDesc.Lines.Text, os, rs);
      s := s.Replace(os, rs);
      s := s.Replace(AnsiLowerCase(os), AnsiLowerCase(rs));
      if FShowFlatOwner then
      begin
        c := GetCustomerByAddress(oldOwner);
        if ((chkFOwner.Checked and (oldOwner = 0)) or ((not chkFOwner.Checked) and (oldOwner = 1))) then
        begin
          os := Format(FOwnerS, ['']);
          rs := Format(FRentS, ['']);
          if (chkFOwner.Checked and (oldOwner = 0)) then
            s := ReplaceStr(s, os, rs)
          else
            s := ReplaceStr(s, rs, os);
        end;
      end;
      NewFileRequest(NewCustomer, FReqType, FReqTempl, d, s, False)
    end;
  end;

  if FOpenInet then
    OpenInetDialog;
end;

function TEditCFileForm.CheckControlText(const Contrl: TDBEditEh; const regexp: String): Boolean;
begin
  Result := true;
  if (Contrl.Text.IsEmpty or regexp.IsEmpty) then
    Exit;

  Result := TRegEx.IsMatch(Contrl.Text, '^' + regexp + '$');
  if (not Result) then
    CnErrors.SetError(Contrl, rsInputIncorrect + ' ' + regexp, iaMiddleLeft, bsNeverBlink)
  else
    CnErrors.Dispose(Contrl);
end;

function TEditCFileForm.CheckInBlackList(const Sender: TDBEditEh; const NT: Integer = 0): Boolean;
var
  s, n: string;
begin
  Result := true;

  if (Sender.Text = '') then
  begin
    Exit;
  end;

  s := '';
  n := Trim(Sender.Text);

  QueryClear;
  Query.SQL.Add('select o.O_Name, o.O_Description, o.O_Charfield');
  Query.SQL.Add('from objects o where o.O_Type = 31 ');
  Query.SQL.Add(' and upper(replace(replace(o.O_Name, '' '', ''''), ''№'', '''')) ');
  Query.SQL.Add('     = upper(replace(replace(cast(:PN as VARCHAR(500)), '' '', ''''), ''№'', ''''))');
  Query.ParamByName('PN').AsString := n;

  MakeDebugLog('CheckInBlackList', Query.SQL.Text);

  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if not(Query.FN('O_Name').IsNull) then
    s := Query.FN('O_Name').AsString + ' ';
  if not(Query.FN('O_Description').IsNull) then
    s := s + Query.FN('O_Description').AsString;
  if not(Query.FN('O_Charfield').IsNull) then
    s := s + #13#10 + Query.FN('O_Charfield').AsString;
  Query.Transaction.Commit;
  Query.Close;

  Result := s.IsEmpty;

  // btnOk.Enabled := (s.IsEmpty) or dmMain.AllowedAction(rght_Customer_full);
  if (not Result) then
  begin
    CnErrors.Dispose(Sender);
    CnErrors.SetError(Sender, rsCustomerInBlackList + #13#10 + s, iaMiddleLeft, bsNeverBlink);
    ShowMessage(rsCustomerInBlackList + #13#10 + s);
  end;
end;

procedure TEditCFileForm.FindSamePassport;
var
  n, vSurn: string;
  FullInfo: Boolean;
begin
  FOwnerOldState := 0;
  n := Trim(edtPASSPORT.Text);
  if n.IsEmpty then
    Exit;

  FullInfo := pnlDoc.Visible;
  edtSURNAME.Text := '';
  edtFIRSTNAME.Text := '';
  edtMIDLENAME.Text := '';
  if FullInfo then
  begin
    edtRegistration.Text := '';
    edtADRES_REGISTR.Text := '';
    edtBIRTHDAY.Text := '';
    edtPlaceBirth.Text := '';
    edtDOCDATE.Text := '';
  end;
  vSurn := '';

  if Query.Open then
  begin
    Query.Transaction.Rollback;
    Query.Close;
  end;

  QueryClear;

  FOwnerOldState := -1;

  if (dmMain.GetSettingsValue('SHOW_DOC_LIST') = '1') then
  begin
    Query.SQL.Add('select first 1 d.Surname, d.Firstname, d.Midlename');
    Query.SQL.Add(', d.Doc_Reg, d.Birthday, d.Addr_Registr, d.Addr_Birth, d.Doc_Date');
    if FShowFlatOwner then
      Query.SQL.Add(', coalesce((select f.Owner_Doc from Houseflats f where f.House_Id ' +
        '= :House_Id and f.Flat_No = :Flat_No), '''') OWN_DOC');
    if FIsLTV then
    begin
      Query.SQL.Add
        (' , iif(position(''СОБ.'',  coalesce((select first 1 upper(c.Name) from Customer_Files c where c.Customer_Id = :CID ');
      Query.SQL.Add(' and c.Cf_Type in (47675/*фото*/,50378/*прописка*/,47999/*собств*/) ');
      Query.SQL.Add(' and c.Name like ''%''||:PN||''%'' order by c.Added_On desc), '''')) > 0 , 1, 0) OWN_DOC_LTV ');
    end;
    Query.SQL.Add('from DOC_LIST d ');
    Query.SQL.Add('where d.Doc_Number = :PN and d.Doc_Type = 1');
    Query.SQL.Add('UNION ALL');
  end;
  Query.SQL.Add('select first 1 c.Surname, c.Firstname, c.Midlename');
  Query.SQL.Add(', c.Passport_Registration Doc_Reg, c.Birthday, c.ADRES_REGISTR Addr_Registr');
  Query.SQL.Add(', c.CONTRACT_BASIS Addr_Birth, null Doc_Date');
  if FShowFlatOwner then
    Query.SQL.Add(', coalesce((select f.Owner_Doc from Houseflats f where f.House_Id ' +
      '= :House_Id and f.Flat_No = :Flat_No), '''') OWN_DOC');
  if FIsLTV then
  begin
    Query.SQL.Add
      (' , iif(position(''СОБ.'',  coalesce((select first 1 upper(c.Name) from Customer_Files c where c.Customer_Id = :CID ');
    Query.SQL.Add(' and c.Cf_Type in (47675/*фото*/,50378/*прописка*/,47999/*собств*/) ');
    Query.SQL.Add(' and c.Name like ''%''||:PN||''%'' order by c.Added_On desc), '''')) > 0 , 1, 0) OWN_DOC_LTV ');
  end;
  Query.SQL.Add('from customer c where c.Passport_Number = :PN');

  Query.ParamByName('PN').AsString := n;
  if FShowFlatOwner then
  begin
    Query.ParamByName('House_Id').AsInteger := FCustomerInfo.HOUSE_ID;
    Query.ParamByName('Flat_No').AsString := FCustomerInfo.FLAT_NO;
  end;
  if FIsLTV then
  begin
    Query.ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
  end;

  MakeDebugLog('FindSamePassport', Query.SQL.Text);

  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if not(Query.FN('Surname').IsNull) then
  begin
    vSurn := Query.FN('Surname').AsString;
    edtSURNAME.Text := vSurn;
  end;
  if not(Query.FN('Firstname').IsNull) then
    edtFIRSTNAME.Text := Query.FN('Firstname').AsString;
  if not(Query.FN('Midlename').IsNull) then
    edtMIDLENAME.Text := Query.FN('Midlename').AsString;

  if (FShowFlatOwner) then
  begin
    if (not(Query.FN('OWN_DOC').IsNull)) then
    begin
      if Query.FN('OWN_DOC').AsString <> '' then
      begin
        if (Query.FN('OWN_DOC').AsString = n) then
          FOwnerOldState := 1
        else
          FOwnerOldState := -1;
      end
      else
      begin
        FOwnerOldState := -1;
      end;
    end;
    if FIsLTV and (not Query.FN('OWN_DOC_LTV').IsNull) and (Query.FN('OWN_DOC_LTV').AsInteger = 1) then
      FOwnerOldState := 1;
  end;

  if FullInfo then
  begin
    if not(Query.FN('Doc_Reg').IsNull) then
      edtRegistration.Text := Query.FN('Doc_Reg').AsString;
    if not(Query.FN('Addr_Registr').IsNull) then
      edtADRES_REGISTR.Text := Query.FN('Addr_Registr').AsString;
    if not(Query.FN('Birthday').IsNull) then
      edtBIRTHDAY.value := Query.FN('Birthday').AsDate;
    if not(Query.FN('Addr_Birth').IsNull) then
      edtPlaceBirth.Text := Query.FN('Addr_Birth').AsString;
    if not(Query.FN('Doc_Date').IsNull) then
      edtDOCDATE.value := Query.FN('Doc_Date').AsDate;
  end;

  Query.Transaction.Commit;
  Query.Close;

  chkFOwner.OnClick := nil;
  chkFOwner.Checked := (FOwnerOldState = 1);
  // CheckRegistration; // отключили проверку прописку пасопрта
  chkFOwner.OnClick := chkFOwnerClick;

  if vSurn.IsEmpty then
  begin
    CnErrors.Dispose(edtPASSPORT);
    CnErrors.SetError(edtPASSPORT, rsNeedPassportCheck, iaMiddleLeft).IconType := EP_INFO2;
  end;

  if FContract.IsEmpty then
    CheckAndGenContract
  else
    SetContract;

  if (FOwnerOldState <> -1) then
  begin
    if ((FOwnerOldState = 1) and (FFileTypeName.Contains('(АР.)'))) then
      ShowMessage('Абонент собственник. Проверьте тип файла.');
    if ((FOwnerOldState <> 1) and (FFileTypeName.Contains('(СОБ.)'))) then
      ShowMessage('Абонент НЕ указан собственником. Проверьте тип файла.');
  end;

  UpdateNotice;
end;

function TEditCFileForm.GetFldAsJson: String;
var
  s: string;
begin
  s := '';
  if pnlPassport.Visible then
  begin
    if not edtPASSPORT.IsEmpty then
      s := s + '"pn":"' + edtPASSPORT.Text + '",';
  end;

  if pnlDoc.Visible then
  begin
    if not edtSURNAME.IsEmpty then
      s := s + '"s":"' + Trim(edtSURNAME.Text) + '",';
    if not edtFIRSTNAME.IsEmpty then
      s := s + '"f":"' + Trim(edtFIRSTNAME.Text) + '",';
    if not edtMIDLENAME.IsEmpty then
      s := s + '"m":"' + Trim(edtMIDLENAME.Text) + '",';
    if not edtRegistration.IsEmpty then
      s := s + '"pr":"' + Trim(edtRegistration.Text) + '",';
    if not edtADRES_REGISTR.IsEmpty then
      s := s + '"ar:"' + Trim(edtADRES_REGISTR.Text) + '",';
    if not VarIsNull(edtBIRTHDAY.value) then
      s := s + '"bd:"' + FormatDateTime('yyyy-mm-dd', edtBIRTHDAY.value) + '",';
    if not edtPlaceBirth.IsEmpty then
      s := s + '"ab:"' + Trim(edtPlaceBirth.Text) + '",';
  end;

  if pnlSrv.Visible then
  begin
    if not lcbService.IsEmpty then
      s := s + '"srv":' + FloatToStr(lcbService.value) + ',';
    if not lcbOnOffSrv.IsEmpty then
      s := s + '"srvo":' + FloatToStr(lcbOnOffSrv.value) + ',';
    if not VarIsNull(edDateSrv.value) then
      s := s + '"srvdt:"' + FormatDateTime('yyyy-mm-dd', edDateSrv.value) + '",';
    if not lcbServiceFrom.IsEmpty then
      s := s + '"srvFrm":' + FloatToStr(lcbServiceFrom.value) + ',';
  end;

  if pnlBidPay.Visible then
  begin
    if not ednBid.IsEmpty then
      s := s + '"bid":"' + Trim(ednBid.Text) + '",';
    if not ednCheckSum.IsEmpty then
      s := s + '"chks":' + FloatToStr(ednCheckSum.value) + ',';
    if not ednBidSum.IsEmpty then
      s := s + '"bids":' + FloatToStr(ednBidSum.value) + ',';
    if not ednFineSum.IsEmpty then
      s := s + '"fine":' + FloatToStr(ednFineSum.value) + ',';
  end;

  if pnlPeriod.Visible then
  begin
    if not VarIsNull(edDateBegin.value) then
      s := s + '"prdf:"' + FormatDateTime('yyyy-mm-dd', edDateBegin.value) + '",';
    if (edDateEnd.Visible) and (not VarIsNull(edDateEnd.value)) then
      s := s + '"prdt:"' + FormatDateTime('yyyy-mm-dd', edDateEnd.value) + '",';
  end;

  if pnlTask.Visible then
  begin
    if not edtTskName.IsEmpty then
      s := s + '"tsk:"' + Trim(edtTskName.Text) + '",';
    if not VarIsNull(edTskDate.value) then
      s := s + '"tskdt:"' + FormatDateTime('yyyy-mm-dd', edTskDate.value) + '",';
  end;

  if not edtText.IsEmpty then
    s := s + '"txt":"' + Trim(edtText.Text) + '",';

  if NOT s.IsEmpty then
    s := '{' + s.TrimRight([',']) + '}';

  Result := s;
end;

procedure TEditCFileForm.SaveDocument(const FileID: Integer);
var
  PN: string;
  nf: Boolean;
begin
  if (dmMain.GetSettingsValue('SHOW_DOC_LIST') <> '1') then
    Exit;

  if ((FFileTypeName.Contains('НЕУПЛ')) and (not FFileTypeName.Contains('ПРИОСТАН'))) then
  begin
    ToJudge();
    Exit;
  end;

  PN := edtPASSPORT.Text.Trim;
  if PN.IsEmpty then
    Exit;

  nf := FFileTypeName.Contains('ПАСПОРТ - ФОТО');
  if (not nf) or (not pnlDoc.Visible) then
    Exit;

  QueryClear;
  Query.Transaction := trWrite;
  Query.SQL.Add('update or insert into Doc_LIST (Doc_Type, Doc_Number, Doc_Reg, Doc_Date, ');
  Query.SQL.Add('  Birthday, Addr_Registr, Addr_Birth, PERSONAL_N, Surname, Firstname, Midlename');
  Query.SQL.Add(IfThen(nf, ', Cf_Id', '') + ')');
  Query.SQL.Add('values (:Doc_Type, :Doc_Number, :Doc_Reg, :Doc_Date, ');
  Query.SQL.Add('  :Birthday, :Addr_Registr, :Addr_Birth, :PERSONAL_N, :Surname, :Firstname, :Midlename');
  Query.SQL.Add(IfThen(nf, ', :Cf_Id', '') + ')');
  Query.SQL.Add('matching (Doc_Type, Doc_Number)');

  if nf then
    Query.ParamByName('Cf_Id').AsInteger := FileID;

  Query.ParamByName('Doc_Type').AsInteger := 1;
  Query.ParamByName('Doc_Number').AsString := PN;
  Query.ParamByName('Surname').AsString := Trim(edtSURNAME.Text);
  Query.ParamByName('Firstname').AsString := Trim(edtFIRSTNAME.Text);
  Query.ParamByName('Midlename').AsString := Trim(edtMIDLENAME.Text);
  Query.ParamByName('Doc_Reg').AsString := Trim(edtRegistration.Text);
  Query.ParamByName('Addr_Registr').AsString := Trim(edtADRES_REGISTR.Text);
  if not VarIsNull(edtDOCDATE.value) then
    Query.ParamByName('Doc_Date').AsDate := edtDOCDATE.value;
  if not VarIsNull(edtBIRTHDAY.value) then
    Query.ParamByName('Birthday').AsDate := edtBIRTHDAY.value;
  Query.ParamByName('Addr_Birth').AsString := Trim(edtPlaceBirth.Text);

  if (pnlMobile.Visible) then
    Query.ParamByName('PERSONAL_N').AsString := edtMobile.Text;

  MakeDebugLog('SaveDocument', Query.SQL.Text);

  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
  Query.Close;
end;

procedure TEditCFileForm.SavePhone;
var
  s, PN, phone: string;
begin
  if not(pnlMobile.Visible) then
    Exit;

  if FCustomerInfo.CUSTOMER_ID = -1 then
    Exit;

  if (edtMobile.IsEmpty) then
    Exit;

  if HasErrorInPhone then
    Exit;

  s := ReplaceStr(s, rsFldFULLNAME, FCustomerInfo.FIO);
  if (pnlPassport.Visible) then
  begin
    s := edtFIRSTNAME.Text + ' ' + edtMIDLENAME.Text + ' ' + edtSURNAME.Text;
    PN := edtPASSPORT.Text;
  end
  else
  begin
    s := FCustomerInfo.FIO;
    PN := '';
  end;

  if FShowFlatOwner then
  begin
    if chkFOwner.Checked then
      s := s + '. ' + Format(FOwnerS, [PN])
    else
    begin
      if chkFOwner.State <> cbGrayed then
        s := s + '. ' + Format(FRentS, [PN]);
    end;
  end
  else
    s := s + ' ' + PN;

  phone := edtMobile.Text;

  QueryClear;
  Query.Transaction := trWrite;
  Query.SQL.Add('execute procedure Customer_Contacts_Iu(:Customer_Id, :Cc_Value, :Cc_Type, :Cc_Notice, :Cc_Notify)');
  Query.ParamByName('Customer_Id').AsInteger := FCustomerInfo.CUSTOMER_ID;
  Query.ParamByName('Cc_Value').AsString := phone;
  Query.ParamByName('Cc_Type').AsInteger := 1;
  Query.ParamByName('Cc_Notice').AsString := Trim(s);
  Query.ParamByName('Cc_Notify').AsInteger := 1;

  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
  Query.Close;

  if chkWA.Checked then
  begin
    phone := DigitsOnly(phone);
    if Copy(phone, 1, 1) = '8' then
    begin
      if (dmMain.CompanyCountry = 'BY') then
      begin
        phone := '375' + Copy(phone, 2, 255);
      end
      else
        phone := '7' + Copy(phone, 2, 255);
    end;

    Query.ParamByName('Customer_Id').AsInteger := FCustomerInfo.CUSTOMER_ID;
    Query.ParamByName('Cc_Value').AsString := phone;
    Query.ParamByName('Cc_Type').AsInteger := 10;
    Query.ParamByName('Cc_Notice').AsString := Trim(s);
    Query.ParamByName('Cc_Notify').AsInteger := 1;
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
    Query.Transaction.Commit;
    Query.Close;
  end;

  if (not edtEMAIL.IsEmpty) then
  begin
    phone := edtEMAIL.Text;
    Query.ParamByName('Customer_Id').AsInteger := FCustomerInfo.CUSTOMER_ID;
    Query.ParamByName('Cc_Value').AsString := phone;
    Query.ParamByName('Cc_Type').AsInteger := 2;
    Query.ParamByName('Cc_Notice').AsString := Trim(s);
    Query.ParamByName('Cc_Notify').AsInteger := 1;
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
    Query.Transaction.Commit;
    Query.Close;
  end;
end;

procedure TEditCFileForm.UpdateCustomerInfo(const CID: Integer);
var
  PN: string;
begin
  if (dmMain.GetSettingsValue('SHOW_DOC_LIST') <> '1') then
    Exit;

  if not FFileTypeName.Contains('ПАСПОРТ - ФОТО') then
    Exit;

  if (not pnlDoc.Visible) or (not pnlPassport.Visible) then
    Exit;

  PN := edtPASSPORT.Text.Trim;
  if PN.IsEmpty then
    Exit;

  if Application.MessageBox('Заменить информацию в карточке абонента?', 'Обновление информации',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
    Exit;

  QueryClear;
  Query.Transaction := trWrite;
  Query.SQL.Add('update Customer ');
  Query.SQL.Add('set Surname = :Surname,');
  Query.SQL.Add('    Firstname = :Firstname,');
  Query.SQL.Add('    Midlename = :Midlename,');
  Query.SQL.Add('    Passport_Number = :Passport_Number,');
  Query.SQL.Add('    Passport_Registration = :Passport_Registration,');
  Query.SQL.Add('    Birthday = :Birthday,');
  Query.SQL.Add('    Contract_Basis = :Addr_Birth,');
  Query.SQL.Add('    Adres_Registr = :Adres_Registr');
  Query.SQL.Add('where Customer_Id = :Customer_Id');

  Query.ParamByName('Customer_Id').AsInteger := CID;
  Query.ParamByName('Surname').AsString := Trim(edtSURNAME.Text);
  Query.ParamByName('Firstname').AsString := Trim(edtFIRSTNAME.Text);
  Query.ParamByName('Midlename').AsString := Trim(edtMIDLENAME.Text);
  Query.ParamByName('Passport_Number').AsString := PN;
  if not VarIsNull(edtDOCDATE.value) then
    PN := FormatDateTime('dd.mm.yyyy', edtDOCDATE.value)
  else
    PN := '';
  if not edtRegistration.IsEmpty then
    Query.ParamByName('Passport_Registration').AsString := Trim(PN + ' ' + edtRegistration.Text);
  if not VarIsNull(edtBIRTHDAY.value) then
    Query.ParamByName('Birthday').AsDate := edtBIRTHDAY.value;
  if not edtPlaceBirth.IsEmpty then
    Query.ParamByName('Addr_Birth').AsString := Trim(edtPlaceBirth.Text);
  if not edtADRES_REGISTR.IsEmpty then
    Query.ParamByName('Adres_Registr').AsString := Trim(edtADRES_REGISTR.Text);

  MakeDebugLog('UpdateCustomerInfo', Query.SQL.Text);

  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
  Query.Close;
end;

function TEditCFileForm.HasErrorInPhone: Boolean;
var
  ce: Boolean;
begin
  ce := False;
  if ((edtMobile.Text <> '')) then
  begin
    if (edtMobile.EditMask <> '') then
    begin
      // проверим есть ли пустой символ шаблона в тексте
      ce := ValueHasMaskError(edtMobile.EditMask, edtMobile.Text);
    end
    else
      ce := (edtMobile.Text = '');
  end;

  if ce then
    CnErrors.SetError(edtMobile, rsInputIncorrect, iaMiddleLeft, bsNeverBlink)
  else
    CnErrors.Dispose(edtMobile);

  Result := ce;
end;

function TEditCFileForm.CheckPasport(const errors: Boolean): Boolean;
begin
  Result := errors;

  if pnlDoc.Visible then
  begin
    if not CheckControlText(edtPASSPORT, dmMain.GetSettingsValue('REG_PASSN')) then
      Result := true;

    if (edtSURNAME.Text = '') then
    begin
      Result := true;
      CnErrors.SetError(edtSURNAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtSURNAME);

    if (edtFIRSTNAME.Text = '') then
    begin
      Result := true;
      CnErrors.SetError(edtFIRSTNAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtFIRSTNAME);

    if (edtMIDLENAME.Text = '') then
    begin
      Result := true;
      CnErrors.SetError(edtMIDLENAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtMIDLENAME);

    if (VarIsNull(edtDOCDATE.value)) then
    begin
      Result := true;
      CnErrors.SetError(edtDOCDATE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtDOCDATE);

    if (VarIsNull(edtBIRTHDAY.value)) then
    begin
      Result := true;
      CnErrors.SetError(edtBIRTHDAY, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtBIRTHDAY);

    if (edtPlaceBirth.Text = '') then
    begin
      Result := true;
      CnErrors.SetError(edtPlaceBirth, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtPlaceBirth);

    if (edtADRES_REGISTR.Text = '') then
    begin
      Result := true;
      CnErrors.SetError(edtADRES_REGISTR, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtADRES_REGISTR);
  end;
end;

procedure TEditCFileForm.ShowFile;
var
  FileName, ext: String;
begin
  if not edtFILE.Hint.IsEmpty then
    FileName := edtFILE.Hint
  else
  begin
    if not edtFILE.Text.IsEmpty then
      FileName := edtFILE.Text
  end;
  if FileName.IsEmpty then
    Exit;

  if (dsCustFile.State = dsEdit) and (FFileInMem.Size = 0) then
  begin
    if not dsCustFile.FieldByName('CONTENT').IsNull then
      TBlobField(dsCustFile.FieldByName('CONTENT')).SaveToStream(FileInMem);
  end;

  if FFileInMem.Size = 0 then
    Exit;

  ext := ExtractFileExt(FileName);
  FileName := GetTempA4onFile(ext);

  if FileName.IsEmpty then
  begin
    ShowMessage('Ошибка создания временного файла');
    Exit;
  end;

  if FileExists(FileName) then
    DeleteFile(FileName);
  FFileInMem.SaveToFile(FileName);
  ShellExecute(Handle, 'open', PWideChar(FileName), nil, nil, SW_SHOWNORMAL);
  // DeleteFile(FileName);
end;

procedure TEditCFileForm.SaveFlatOwner(const CID: Integer);
var
  PN: string;
  nf: Boolean;
  s: string;
  ItsOwner: Boolean;
begin
  if (dmMain.GetSettingsValue('SHOW_DOC_LIST') <> '1') then
    Exit;

  nf := FFileTypeName.Contains('СОБСТВЕННОСТЬ');
  if nf then
  begin
    ItsOwner := true;
  end
  else
  begin
    nf := FFileTypeName.Contains('ПАСПОРТ');
    if nf then
      ItsOwner := chkFOwner.Checked
    else
      ItsOwner := False;
  end;

  // если ни СОБСТВЕННСТЬ ни паспорт. то выходим
  if not nf then
    Exit;

  if (not pnlDoc.Visible) or (not pnlPassport.Visible) then
    Exit;

  PN := edtPASSPORT.Text.Trim;
  if PN.IsEmpty then
    Exit;

  s := Trim(edtSURNAME.Text + ' ' + edtFIRSTNAME.Text + ' ' + edtMIDLENAME.Text);

  QueryClear;
  Query.Transaction := trWrite;
  Query.SQL.Add('execute block (');
  Query.SQL.Add('    Customer_ID   integer = :Customer_ID,');
  Query.SQL.Add('    OWNER_NAME D_VARCHAR100 = :OWNER_NAME,');
  Query.SQL.Add('    OWNER_DOC  D_VARCHAR255 = :OWNER_DOC,');
  Query.SQL.Add('    MOBILE  D_VARCHAR255 = :MOBILE)');
  Query.SQL.Add('as');
  Query.SQL.Add('declare variable House_Id   integer;');
  Query.SQL.Add('declare variable  Flat_No    D_FLAT_NS;');
  Query.SQL.Add('begin');
  Query.SQL.Add('  select c.House_Id, c.Flat_No from customer c where c.Customer_Id = :Customer_ID');
  Query.SQL.Add('  into :House_Id, :Flat_No;');
  Query.SQL.Add('  if (not Flat_No is null) then begin');
  if ItsOwner then
  begin
    // установим этот паспорт владельцем
    Query.SQL.Add('    update or insert into Houseflats (House_Id, Flat_No, Owner_Name, Owner_Doc, MOBILE)');
    Query.SQL.Add('    values (:House_Id, :Flat_No, :Owner_Name, :Owner_Doc, :MOBILE)');
    Query.SQL.Add('    matching(House_Id, Flat_No);');
  end
  else
  begin
    // очистим если этот паспорт был ранне владельцем
    Query.SQL.Add('    update Houseflats f');
    Query.SQL.Add('    set Owner_Name = '''', Owner_Doc = '''', MOBILE = ''''');
    Query.SQL.Add('    where f.House_ID = :House_Id and f.Flat_No = :Flat_No and Owner_Doc = :Owner_Doc;');
  end;
  Query.SQL.Add('  end');
  Query.SQL.Add('end');

  Query.ParamByName('Customer_Id').AsInteger := CID;
  Query.ParamByName('OWNER_NAME').AsString := s;
  Query.ParamByName('OWNER_DOC').AsString := PN;
  Query.ParamByName('MOBILE').AsString := edtMobile.Text;

  MakeDebugLog('SaveFlatOwner', Query.SQL.Text);

  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
end;

procedure TEditCFileForm.AddOrOffService;
var
  Save_Cursor: TCursor;
  s: String;
begin
  if not pnlSrv.Visible then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;

    if FNeedSrv then
    begin
      with TpFIBQuery.Create(Self) do
      begin
        try
          DataBase := dmMain.dbTV;
          Transaction := trWriteQ;
          SQL.Text := 'execute block (';
          SQL.Add(' CUSTOMER_ID UID = :CUSTOMER_ID,');
          SQL.Add(' SERVICE_ID  UID = :SERVICE_ID,');
          SQL.Add(' SET_ON      D_INTEGER = :Set_On,');
          SQL.Add(' SET_DATE    D_DATE = :Set_Date,');
          SQL.Add(' SRV_ON_OFF  type of UID = :Srv_On_Off,');
          SQL.Add(' CONTR_N     D_VARCHAR20 = :CONTR_N,');
          SQL.Add(' CONTR_DATE  D_DATE = :CONTR_DATE,');
          SQL.Add(' NOTICE      varchar(1000) = :NOTICE');
          SQL.Add(') as');
          SQL.Add('declare variable bal D_N15_4;');
          SQL.Add('declare variable tar D_N15_4;');
          SQL.Add('declare variable md D_INTEGER;');
          SQL.Add('declare variable cd D_INTEGER;');
          SQL.Add('declare variable CalcDate D_DATE;');
          SQL.Add('begin');
          SQL.Add('  bal = 0;');

          // для ЛТВ ОТКЛ: доначисление услуги до полного тарифа
          if FIsLTV then
          begin
            if FFileTypeName.Contains('ОТКЛ') then
            begin

              if (FFileTypeName.Contains('ДОСРОЧНО')) then
              begin
                // если отключаем досрочно, то откатим отключение и потом отключим нужной датой
                SQL.Add('  select Subscr_Serv_Id from Subscr_Serv where Customer_Id = :Customer_Id and State_Sgn = 0 and Serv_Id = :Service_Id');
                SQL.Add('  into :md;');
                SQL.Add('  if (not md is null) then');
                SQL.Add('    select Result from Cancel_Last_Subscribe_Action(:md) into :md;');
              end;

              if FFileTypeName.Contains('СТВ.') then
              begin
                SQL.Add('  CalcDate = dateadd(DAY, -1, Set_Date);');
                SQL.Add('  select M_Tarif from Get_Tarif_Sum_Customer_Srv(:Customer_Id, :Service_Id, :CalcDate) into :tar;');
                SQL.Add('  tar = coalesce(tar, 0);');
                SQL.Add('  cd = extract(day from dateadd(DAY, -1, Set_Date));');
                SQL.Add('  md = extract(day from Month_Last_Day(CalcDate));');
                SQL.Add('  bal = round(((md-cd)*tar/md) ,2);');
              end;
            end;
          end;

          SQL.Add('  if (not CONTR_N is null) then CONTR_DATE = coalesce(CONTR_DATE, SET_DATE);');
          SQL.Add('  execute procedure Api_Set_Customer_Service(:Customer_Id, :Service_Id, :Set_On, :Set_Date, :Srv_On_Off, :CONTR_N, :CONTR_DATE);');
          SQL.Add('  NOTICE = coalesce(NOTICE, '''');');
          SQL.Add('  if (NOTICE <> '''') then begin');
          SQL.Add('    update Subscr_Serv set Notice = :notice where Serv_Id = :Service_Id and Customer_Id = :customer_id;');
          SQL.Add('    update Single_Serv set Notice = :notice where Service_Id = :Srv_On_Off and Customer_Id = :customer_id and Serv_Date = :Set_Date;');
          SQL.Add('  end');

          // для ЛТВ
          if FIsLTV then
          begin
            if FFileTypeName.Contains('ОТКЛ') then
            begin
              // 942519  'Доначисление СТВ'
              if FFileTypeName.Contains('СТВ.') then
              begin
                SQL.Add('  if (bal>0) then ');
                SQL.Add('    execute procedure Add_Single_Service(:Customer_Id, 942519, :bal, current_date, :notice);');
              end;

              // спишем долги АБОНЕНТА если нет услуг
              // 39964 услуга "остаток"
              SQL.Add('  bal = null;');
              SQL.Add('  select c.Debt_Sum from customer c where c.Customer_Id = :Customer_Id');
              SQL.Add('    and (not exists(select ss.Subscr_Serv_Id from Subscr_Serv ss');
              SQL.Add('      where ss.Customer_Id = c.Customer_Id and ss.State_Sgn = 1 and ss.Serv_Id <> 819519))');
              SQL.Add('  into :bal;');
              SQL.Add('  if (coalesce(bal,0) < 0) then ');
              SQL.Add('    execute procedure Add_Single_Service(:Customer_Id, 39964, (-1*:bal), :Set_Date, :notice);');
              SQL.Add('  execute procedure IBE$toJUDGE(:Customer_Id, :notice, 1);');
            end
            else if FFileTypeName.Contains('РАССР') then // расскрочка
            begin
              // тут настраиваем отключение рассрочки через 25 месяцев
              SQL.Add('  Srv_On_Off = null;');
              if ((lcbService.value = 559932) or (lcbService.value = 876662)) then
                SQL.Add('  Srv_On_Off = 606068;') // Wi-Fi роутер.   Рассрочка+Подкл-СПД. (ОТКЛЮЧИТЬ)
              else if (lcbService.value = 674213) then
                SQL.Add('  Srv_On_Off = 683921;') // TV Box. ОТКЛ. РАССРОЧКА. X96 Max Plus. 2/16.  ПЕРВЫЙ.
              else if (lcbService.value = 709148) then
                SQL.Add('  Srv_On_Off = 878782;') // TV Box. ОТКЛ. РАССРОЧКА. X96 Max Plus. 2/16.  ВТОРОЙ.
              else if (lcbService.value = 878750) then
                SQL.Add('  Srv_On_Off = 878785;'); // TV Box. ОТКЛ. РАССРОЧКА. X96 Max Plus. 2/16.  ТРЕТИЙ.

              SQL.Add('  if (not Srv_On_Off is null) then begin');
              SQL.Add('    CalcDate = dateadd(Year, 2, Set_Date);');
              SQL.Add('    execute procedure Onoff_Service_By_Id(:Customer_Id, :Service_Id, :Srv_On_Off, :CalcDate, 1, :NOTICE, 1, 0);');
              SQL.Add('  end');
            end
            else if ((FFileTypeName.Contains('СМЕНА')) and (FPeriodServiceFrm = UndefinedSrv)) then // смена услуг
            begin
              // попытка найти услугу такого же типа и отключить
              SQL.Add('  cd = null;');
              SQL.Add('  select s.Business_Type from services s where s.Service_Id = :Service_Id into :md;');
              SQL.Add('  select first 1 ss.Serv_Id from Subscr_hist ss inner join services s on (s.Service_Id = ss.Serv_Id and s.Business_Type = :md)');
              SQL.Add('  where ss.Customer_Id = :Customer_Id and ss.Serv_Id <> :Service_Id and :SET_DATE between ss.Date_From and ss.Date_To');
              SQL.Add('  into :cd;');
              SQL.Add('  if (not cd is null) then');
              SQL.Add('    execute procedure Onoff_Service_By_Id(:Customer_Id, :cd, :Srv_On_Off, :Set_Date, 1, :NOTICE, 1);');
            end;

            if (FPeriodServiceFrm <> UndefinedSrv) then // смена услуг
            begin
              SQL.Add('  cd = ' + FPeriodServiceFrm.ToString + ';');
              SQL.Add('  execute procedure Onoff_Service_By_Id(:Customer_Id, :cd, :Srv_On_Off, :Set_Date, 1, :NOTICE, 1);');
            end;
          end;

          if FIsLTV and FFileTypeName.Contains('DVB') and FFileTypeName.Contains('ПОДКЛ') then
          begin
            s := '';
            if IsDecoderText(edtText) then
              s := edtText.Text
            else if IsDecoderText(edtText1) then
              s := edtText1.Text
            else if IsDecoderText(edtText2) then
              s := edtText2.Text
            else if IsDecoderText(edtText3) then
              s := edtText3.Text;

            if not s.IsEmpty then
            begin
              // КАМ
              SQL.Add('  delete from Decoder_Packets p where p.Service_Id = :SERVICE_ID and p.Decoder_N in (select d.Decoder_N from Customer_Decoders d where d.Customer_Id = :Customer_Id);');
              SQL.Add('  insert into Decoder_Packets (Decoder_N, Service_Id, Notice) values (''' + s +
                ''', :Service_Id, :NOTICE);');
            end
          end;

          SQL.Add('end');

          // ShowMessage(SQL.Text); // debug

          ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
          // если не указана услуга переключения
          if (FPeriodServiceFrm = UndefinedSrv) then
          begin
            ParamByName('Service_Id').AsInteger := lcbService.value;
            if FIsOff = 1 then
              ParamByName('Set_On').AsInteger := 0
            else
              ParamByName('Set_On').AsInteger := 1;
          end
          else
          begin
            ParamByName('Service_Id').AsInteger := FPeriodService;
            ParamByName('Set_On').AsInteger := 1;
          end;

          ParamByName('Set_Date').AsDate := edDateSrv.value;
          ParamByName('Srv_On_Off').AsInteger := lcbOnOffSrv.value;
          if (FIsLTV and (FPeriodServiceFrm = UndefinedSrv)) then
          begin
            // СПД. ПЕРЕНОС И-НЕТ. (ПОДКЛ.)
            // 996190 И-нет.  ПЕРЕНОС услуги. (подключить).
            // 996193 И-нет.  ПЕРЕНОС услуги. (отключить).

            // СТВ. ПЕРЕНОС. (ПОДКЛ.)
            // 996415 СТВ.  ПЕРЕНОС услуги. (подключить).
            // 996413 СТВ.  ПЕРЕНОС услуги. (отключить).
            if (FFileTypeName.Contains('СПД.') and FFileTypeName.Contains('ПЕРЕНОС')) then
              ParamByName('Srv_On_Off').AsInteger := 996190
            else if (FFileTypeName.Contains('СТВ.') and FFileTypeName.Contains('ПЕРЕНОС')) then
              ParamByName('Srv_On_Off').AsInteger := 996415;
          end;
          ParamByName('notice').AsString := Trim(mmoDesc.Lines.Text);
          if (pnlContract.Visible) and (chkContract.Checked) then
          begin
            ParamByName('CONTR_N').AsString := edtContract.value;
            if not VarIsNull(edtContractDate.value) then
              ParamByName('CONTR_DATE').AsDate := edtContractDate.value;
          end
          else
          begin
            if FShowFlatOwner then
              ParamByName('CONTR_N').AsString := edtContract.Text;
          end;

          MakeDebugLog('AddOrOffService', SQL.Text);

          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
        finally
          Free;
        end;
      end;
    end;
  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

function TEditCFileForm.MoveService: Integer;
var
  Save_Cursor: TCursor;
  oldOwner: Integer;
  oldC: TCustomerInfo;
begin
  Result := -1;

  if not pnlSrv.Visible then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    if FNeedSrv then
    begin
      oldC := GetCustomerByAddress(oldOwner);
      Result := oldC.CUSTOMER_ID;
      if Result > 0 then
      begin
        with TpFIBQuery.Create(Self) do
        begin
          try
            DataBase := dmMain.dbTV;
            Transaction := trWriteQ;
            SQL.Text := 'execute block (';
            SQL.Add('  CUSTOMER_ID     D_INTEGER = :CUSTOMER_ID,');
            SQL.Add('  OLD_CUSTOMER_ID D_INTEGER = :OLD_CUSTOMER_ID,');
            SQL.Add('  SERVICE_ID  UID = :SERVICE_ID,');
            SQL.Add('  SET_ON      D_INTEGER = :Set_On,');
            SQL.Add('  SET_DATE    D_DATE = :Set_Date,');
            SQL.Add('  SRV_ON_OFF  type of UID = :Srv_On_Off,');
            SQL.Add('  CONTR_N     D_VARCHAR20 = :CONTR_N,');
            SQL.Add('  CONTR_DATE  D_DATE = :CONTR_DATE,');
            SQL.Add('  NOTICE      varchar(1000) = :NOTICE,');
            SQL.Add('  NEW_OWN     D_integer = :NEW_OWN,');
            SQL.Add('  FOwnerS     varchar(10) = :FOwnerS,');
            SQL.Add('  FRentS      varchar(10) = :FRentS,');
            SQL.Add('  CF_ID       D_INTEGER = :CF_ID,');
            SQL.Add('  New_Type    D_INTEGER = :New_Type)');
            SQL.Add('as');
            SQL.Add('declare variable old_own D_integer;');
            SQL.Add('declare variable NCF  D_integer;');
            SQL.Add('declare variable bal  D_N15_4;');
            SQL.Add('declare variable tar  D_N15_4;');
            SQL.Add('declare variable srA  D_integer;');
            SQL.Add('declare variable md   D_INTEGER;');
            SQL.Add('declare variable cd   D_INTEGER;');
            SQL.Add('begin');
            SQL.Add('  if (OLD_CUSTOMER_ID is null) then exit;');
            SQL.Add('  bal = 0;');
            SQL.Add('  FRentS = coalesce(FRentS, ''''); FOwnerS = coalesce(FOwnerS, '''');');
            SQL.Add('  if (not CONTR_N is null) then begin');
            SQL.Add('    CONTR_DATE = coalesce(CONTR_DATE, SET_DATE);');
            SQL.Add('  end');

            if (FIsLTV) then
            begin
              if FFileTypeName.Contains('ПЕРЕНОС') and FFileTypeName.Contains('СПД.') then
              begin
                // еслі есть промо услуги, то отключим их
                SQL.Add('  for select ss.Subscr_Serv_Id, ss.State_Sgn');
                SQL.Add('    from subscr_serv ss inner join services s on (s.Service_Id = ss.Serv_Id)');
                SQL.Add('    where ss.Customer_Id = :OLD_CUSTOMER_ID and s.Business_Type = 1');
                SQL.Add('        and ss.State_Date >= :SET_DATE and upper(s.Name) like ''%PROMO%''');
                SQL.Add('    into :old_own, :md');
                SQL.Add('  do begin');
                SQL.Add('    select Result from Cancel_Last_Subscribe_Action(:old_own) into :srA;');
                SQL.Add('    if ((srA = 1) and (md = 0)) then');
                SQL.Add('      execute procedure Onoff_Service(:OLD_CUSTOMER_ID, :old_own, :Srv_On_Off, :SET_DATE, 1, :NOTICE, 1, 1)');
                SQL.Add('      returning_values :srA;');
                SQL.Add('    old_own = null; md = null; srA = null;');
                SQL.Add('  end');
                // перенос закладки Интернет к новому
                SQL.Add('  delete from billing where customer_id = :CUSTOMER_ID;');
                SQL.Add('  update billing set customer_id = :CUSTOMER_ID where customer_id = :OLD_CUSTOMER_ID;');
              end;
              // для ЛТВ: доначисление услуги до полного тарифа
              SQL.Add('  select M_Tarif from Get_Tarif_Sum_Customer_Srv(:OLD_Customer_Id, :Service_Id, :Set_Date) into :tar;');
              SQL.Add('  tar = coalesce(tar, 0);');
              SQL.Add('  cd = extract(day from Set_Date)-1;');
              SQL.Add('  md = extract(day from Month_Last_Day(Set_Date));');
              SQL.Add('  bal = round(((md-cd)*tar/md) ,2);');
            end;

            if FShowFlatOwner then
            begin
              SQL.Add('  select iif(exists(select f.Owner_Doc from Houseflats f where f.House_Id = c.House_Id');
              SQL.Add('         and f.Flat_No = c.Flat_No and f.Owner_Doc = c.Passport_Number), 1, 0) OWNER');
              SQL.Add('    from customer c where c.Customer_Id = :OLD_CUSTOMER_ID');
              SQL.Add('  into :old_own;');
              SQL.Add('  old_own = coalesce(old_own, 0);');
              SQL.Add('  NEW_OWN = coalesce(NEW_OWN, 0);');
              SQL.Add('  if (old_own <> NEW_OWN) then begin');
              SQL.Add('    if (OLD_OWN = 1) then begin');
              SQL.Add('      CONTR_N = replace(CONTR_N, FRentS, FOwnerS);');
              SQL.Add('      notice = replace(notice, FRentS, FOwnerS);');
              SQL.Add('    end');
              SQL.Add('    else begin');
              SQL.Add('      CONTR_N = replace(CONTR_N, FOwnerS, FRentS);');
              SQL.Add('      notice = replace(notice, FOwnerS, FRentS);');
              SQL.Add('    end');
              SQL.Add('  end');
            end;

            SQL.Add('  execute procedure Api_Set_Customer_Service(:OLD_Customer_Id, :Service_Id, :Set_On, :Set_Date, :Srv_On_Off, :CONTR_N, :CONTR_DATE);');
            SQL.Add('  NOTICE = coalesce(NOTICE, '''');');
            SQL.Add('  if (NOTICE <> '''') then begin');
            SQL.Add('    update Subscr_Serv set Notice = :notice where Serv_Id = :Service_Id and Customer_Id = :OLD_Customer_Id;');
            SQL.Add('    update Single_Serv set Notice = :notice where Service_Id = :Srv_On_Off and Customer_Id = :OLD_Customer_Id and Serv_Date = :Set_Date;');
            SQL.Add('  end');

            // для ЛТВ
            if FIsLTV then
            begin
              // спишем долги АБОНЕНТА если нет услуг
              // 942519  'Доначисление СТВ'
              // спд не доначисляем 942520  'Доначисление СПД'
              SQL.Add('  if (bal>0) then begin');
              SQL.Add('    srA = null;');
              SQL.Add('    select BUSINESS_TYPE from services where BUSINESS_TYPE = 0 and Service_Id = :Service_Id into :srA;');
              SQL.Add('    if ((not srA is null) and (srA = 0)) then begin');
              SQL.Add('        srA = 942519;');
              SQL.Add('        execute procedure Add_Single_Service(:OLD_Customer_Id, :srA, :bal, :Set_Date, :notice);');
              SQL.Add('    end');
              SQL.Add('  end');

              SQL.Add('  if (not New_Type is null) then begin');
              SQL.Add('    NCF = gen_id(Gen_Operations_Uid, 1);');
              SQL.Add('    insert into Customer_Files (CF_ID, Customer_Id, Name, Cf_Type, Date_From, Date_To, Filename, Notice, Act, Anotice, Content, Addons)');
              SQL.Add('    select :NCF, :OLD_customer_id, Name, :New_Type, Date_From, Date_To, Filename, Notice, Act, Anotice, Content, Addons');
              SQL.Add('    from Customer_Files where Cf_Id = :Cf_Id;');
              SQL.Add('    update Customer_Files cf ');
              SQL.Add('       set cf.Name = replace(replace(cf.Name, ''Подкл'', ''Откл''), ''подкл'', ''откл''), ');
              SQL.Add('       cf.Notice = replace(replace(cf.Notice, ''Подкл'', ''Откл''), ''подкл'', ''откл'')  ');
              SQL.Add('    where cf.Cf_Id = :NCF; ');
              SQL.Add('  end');
            end;

            if FShowFlatOwner then
            begin
              SQL.Add('    if (old_own <> NEW_OWN) then begin');
              SQL.Add('      if (OLD_OWN = 1) then');
              SQL.Add('        update Customer_Files set NAME = replace(NAME, :FRentS, :FOwnerS), Notice = replace(Notice, :FRentS, :FOwnerS) where CF_ID = :NCF;');
              SQL.Add('      else');
              SQL.Add('        update Customer_Files set NAME = replace(NAME, :FOwnerS, :FRentS), Notice = replace(Notice, :FOwnerS, :FRentS) where CF_ID = :NCF;');
              SQL.Add('    end');
            end;

            if FIsLTV then // and FFileTypeName.Contains('СТВ') then // если перенос СТВ, то
            begin
              // спишем остаток со строго лицевого
              SQL.Add('  bal = null;');
              SQL.Add('  select c.Debt_Sum from customer c where c.Customer_Id = :OLD_customer_id');
              SQL.Add('    and (not exists(select ss.Subscr_Serv_Id from Subscr_Serv ss');
              SQL.Add('      where ss.Customer_Id = c.Customer_Id and ss.State_Sgn = 1 and ss.Serv_Id <> 819519)) into :bal;');
              SQL.Add('  if (coalesce(bal,0) < 0) then execute procedure Add_Single_Service(:OLD_customer_id, 39964, (-1*:bal), :Set_Date, :notice);');
            end;

            SQL.Add('end');

            // SQL.SaveToFile('b:\move.sql');

            ParamByName('CUSTOMER_ID').AsInteger := FCustomerInfo.CUSTOMER_ID;
            ParamByName('OLD_CUSTOMER_ID').AsInteger := Result;
            ParamByName('NEW_OWN').AsInteger := 0;
            if chkFOwner.Checked then
              ParamByName('NEW_OWN').AsInteger := 1;
            ParamByName('FOwnerS').AsString := Format(FOwnerS, ['']);
            ParamByName('FRentS').AsString := Format(FRentS, ['']);
            ParamByName('Service_Id').AsInteger := lcbService.value;
            ParamByName('Set_On').AsInteger := 0;
            if FIsOff = 1 then
              ParamByName('Set_On').AsInteger := 1;
            ParamByName('Set_Date').AsDate := edDateSrv.value;
            ParamByName('New_Type').Clear;
            ParamByName('Srv_On_Off').AsInteger := lcbOnOffSrv.value;
            if FIsLTV and FFileTypeName.Contains('ПЕРЕНОС') then
            begin
              if FFileTypeName.Contains('СПД.') then
              begin
                ParamByName('Srv_On_Off').AsInteger := 996193;
                ParamByName('New_Type').AsInteger := 48500; // СПД. Перенос И-нет. (откл.)
              end
              else if FFileTypeName.Contains('СТВ.') then
              begin
                ParamByName('Srv_On_Off').AsInteger := 996413;
                ParamByName('New_Type').AsInteger := 48501; // СТВ. Перенос. (откл.)
              end;
            end;
            ParamByName('notice').AsString := Trim(mmoDesc.Lines.Text);
            ParamByName('CF_ID').AsInteger := dsCustFile.FieldByName('CF_ID').AsInteger;
            if FShowFlatOwner then
              ParamByName('CONTR_N').AsString := edtContract.Text;
            if (pnlContract.Visible) and (chkContract.Checked) then
            begin
              ParamByName('CONTR_N').AsString := edtContract.value;
              if not VarIsNull(edtContractDate.value) then
                ParamByName('CONTR_DATE').AsDate := edtContractDate.value;
            end;

            MakeDebugLog('MoveService', SQL.Text);

            Transaction.StartTransaction;
            ExecQuery;
            Transaction.Commit;
          finally
            Free;
          end;
        end;
      end;
    end;
  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TEditCFileForm.AddSingleSrv;
var
  Save_Cursor: TCursor;
  qnt: Double;
  // d: TDate;
begin
  qnt := -1;
  if pnlBidPay.Visible and ednCheckSum.Visible then
  begin
    try
      qnt := ednCheckSum.value;
    except
      qnt := -1;
    end;
  end;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;
        SQL.Clear;
        SQL.Add('execute procedure Add_Single_Service(:CUSTOMER_ID, :SERVICE_ID, :QNT, :SrvDate, :NOTICE, null);');

        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('Service_Id').AsInteger := FSingleSrv;

        if qnt <> -1 then
          ParamByName('QNT').AsFloat := qnt
        else
          ParamByName('QNT').Clear;

        if pnlSrv.Visible and (not VarIsNull(edDateSrv.value)) then
          ParamByName('SrvDate').AsDate := edDateSrv.value
        else
        begin
          if pnlPeriod.Visible and (not VarIsNull(edDateBegin.value)) then
            ParamByName('SrvDate').AsDate := edDateBegin.value
          else
            ParamByName('SrvDate').AsDate := Date();
        end;

        ParamByName('notice').AsString := Trim(mmoDesc.Lines.Text);

        MakeDebugLog('AddSingleSrv', SQL.Text);

        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TEditCFileForm.MakeBidPayment;
var
  Save_Cursor: TCursor;
  SRV_SUM: Double;
  PAY_SUM: Double;
  PAYED: Double;
  BID_SUM: Double;
  FINE: Double;
  sum: Double;
begin
  if (not pnlBidPay.Visible) or (not ednBid.Visible) or ednBid.Text.IsEmpty then
    Exit;

  // ПКО
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    SRV_SUM := 0;
    PAY_SUM := 0;
    BID_SUM := 0;
    PAYED := 0;
    FINE := 0;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;
        SQL.Text := 'execute block (';
        SQL.Add('    RQ_ID    integer = :RQ_ID ,');
        SQL.Add('    CUSTOMER_ID    integer = :CUSTOMER_ID,');
        SQL.Add('    PAY_SUM  numeric(18,2) = :PAY_SUM,');
        SQL.Add('    SRV_SUM  numeric(18,2) = :SRV_SUM,');
        SQL.Add('    BID_SUM  numeric(18,2) = :BID_SUM,');
        SQL.Add('    FINE_SUM numeric(18,2) = :FINE_SUM,');
        SQL.Add('    NOTICE   varchar(1000) = :NOTICE)');
        SQL.Add('as');
        SQL.Add('declare variable PAYMENT_ID  integer;');
        SQL.Add('declare variable Bsrv_ID  integer;');
        SQL.Add('begin');
        SQL.Add('  BID_SUM = round(coalesce(BID_SUM, 0),2);');
        SQL.Add('  SRV_SUM = round(coalesce(SRV_SUM, 0),2);');
        SQL.Add('  FINE_SUM = round(coalesce(FINE_SUM, 0),2);');
        if FIsLTV then
          SQL.Add('  Bsrv_ID = 307044;')
        else
          SQL.Add('  Bsrv_ID = null;');
        SQL.Add('  execute procedure Add_Payment(:Customer_Id, :PAY_SUM, localtimestamp, null, null, :Bsrv_ID, :Notice)');
        SQL.Add('        returning_values :Payment_Id;');
        SQL.Add('  update payment set Rq_Id = :RQ_ID where Payment_Id = :Payment_Id;');
        SQL.Add('  update Request r set r.Receipt = :Payment_Id where r.Rq_Id = :Rq_Id;');
        SQL.Add('  if (SRV_SUM > 0) then begin');
        if FIsLTV then
          SQL.Add('    Bsrv_ID = 422541;')
        else
          SQL.Add('    Bsrv_ID = null;');
        SQL.Add('    execute procedure Add_Payment_Fine(:Customer_Id, :SRV_SUM, current_date, null, null, :Bsrv_ID, :Notice, :FINE_SUM)');
        SQL.Add('        returning_values :Payment_Id;');
        SQL.Add('    update payment set Rq_Id = :RQ_ID where Payment_Id = :Payment_Id;');
        SQL.Add('  end');
        SQL.Add('end');

        // s := SQL.Text; // отладка
        // ParamByName('notice').AsString := s;

        // GetBidRestSum(BID_SUM, PAY_SUM, SUM);
        PAY_SUM := 0; // оплата
        PAYED := 0; // оплата до
        SRV_SUM := 0; // оплата услуг
        FINE := 0; // пеня
        BID_SUM := 0; // Сумма в заявке
        // ednBidSum.Tag Сумма оплаты услуг
        if not ednBidSum.Text.IsEmpty then
        begin
          BID_SUM := ednBidSum.value;
          SRV_SUM := ednBidSum.Tag / 100;
        end;
        // ednCheckSum.Tag Сумма частиной опалты
        if not ednCheckSum.Text.IsEmpty then
        begin
          PAY_SUM := ednCheckSum.value;
          PAYED := ednCheckSum.Tag / 100;
        end;
        if not ednFineSum.Text.IsEmpty then
          FINE := ednFineSum.value;

        sum := BID_SUM + SRV_SUM - PAY_SUM - PAYED - FINE;

        if sum < 0 then
        begin
          sum := -1 * sum + SRV_SUM;
          // PAY_SUM := BID_SUM - SRV_SUM - PAYED - FINE;
        end
        else
        begin
          if sum = 0 then
          begin
            sum := SRV_SUM;
            PAY_SUM := PAY_SUM - SRV_SUM;
          end
          else
          begin
            if BID_SUM < PAY_SUM then
            begin
              sum := PAY_SUM - BID_SUM;
              PAY_SUM := BID_SUM;
            end
            else
            begin
              sum := 0;
            end;
          end;
        end;

        sum := Round(sum * 100) / 100;

        ParamByName('PAY_SUM').AsExtended := PAY_SUM;
        ParamByName('BID_SUM').AsExtended := BID_SUM;
        ParamByName('SRV_SUM').AsExtended := sum;
        ParamByName('FINE_SUM').AsExtended := FINE;
        ParamByName('RQ_ID').AsInteger := ednBid.value;
        ParamByName('CUSTOMER_ID').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('NOTICE').AsString := mmoDesc.Lines.Text;

        MakeDebugLog('MakeBidPayment', SQL.Text);

        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

function TEditCFileForm.GetCustomerByAddress(var oldOwner: Integer): TCustomerInfo;
begin
  Result.CUSTOMER_ID := -1;
  oldOwner := -1;
  if lcbHOUSE.Text.IsEmpty or lcbFLAT.Text.IsEmpty then
    Exit;

  with TpFIBQuery.Create(Self) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := trReadQ;
      SQL.Add('select first 1 CUSTOMER_ID, cust_code, Account_NO');
      if FShowFlatOwner then
      begin
        SQL.Add(' , iif(exists(select f.Owner_Doc from Houseflats f where f.House_Id = c.House_Id');
        SQL.Add(' and f.Flat_No = c.Flat_No and f.Owner_Doc = :PN), 1, 0) OWNER ');
      end;
      SQL.Add(' from customer c where House_Id = :HOUSE_ID and Flat_No = :FLAT');
      ParamByName('HOUSE_ID').AsInteger := lcbHOUSE.value;
      ParamByName('FLAT').AsString := lcbFLAT.Text;
      if FShowFlatOwner then
        ParamByName('PN').AsString := edtPASSPORT.Text;

      MakeDebugLog('GetCustomerByAddress', SQL.Text);

      Transaction.StartTransaction;
      ExecQuery;
      if not FN('CUSTOMER_ID').IsNull then
        Result.CUSTOMER_ID := FN('CUSTOMER_ID').AsInteger;
      if not FN('Account_NO').IsNull then
        Result.Account_No := FN('Account_NO').AsString;
      if not FN('cust_code').IsNull then
        Result.cust_code := FN('cust_code').AsString;
      if FShowFlatOwner then
        if (not FN('OWNER').IsNull) then
          oldOwner := FN('OWNER').AsInteger;
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

procedure TEditCFileForm.SetPasswordIfEmpty();
begin
  with TpFIBQuery.Create(Self) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := trWriteQ;
      SQL.Add('update customer set Secret = :pswd where Customer_Id = :CID and coalesce(SECRET, '''') = ''''');
      ParamByName('CID').AsInteger := CustomerInfo.CUSTOMER_ID;
      ParamByName('pswd').AsString := EncodeBase64(CustomerInfo.Account_No);

      MakeDebugLog('SetPasswordIfEmpty', SQL.Text);

      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

procedure TEditCFileForm.Renegotiation;
var
  Save_Cursor: TCursor;
begin
  if (not FFileTypeName.Contains('ПЕРЕОФОРМЛЕНИЕ ДОГОВОРА')) then
    Exit;

  if (not FIsLTV) then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;
        SQL.Text := 'EXECUTE PROCEDURE IBE$RENEGOTIATION(:CUSTOMER_ID, :CONTR_N, :CONTR_DATE, :forSRV, :NOTICE)';
        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('forSRV').AsString := Trim(edtText.Text);
        ParamByName('notice').AsString := Trim(mmoDesc.Lines.Text);
        if (pnlContract.Visible) and (chkContract.Checked) then
        begin
          ParamByName('CONTR_N').AsString := edtContract.Text;
          if not VarIsNull(edtContractDate.value) then
            ParamByName('CONTR_DATE').AsDate := edtContractDate.value;
        end
        else
        begin
          if FShowFlatOwner then
            ParamByName('CONTR_N').AsString := edtContract.Text;
        end;

        MakeDebugLog('Renegotiation', SQL.Text);

        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TEditCFileForm.CheckPromo(const CID: Integer = -1);
var
  alert: Boolean;
begin
  QueryClear;
  // еслі передан параметр, то проверим есть ли у этого абонента промо услуги
  if CID = -1 then
  begin
    Query.SQL.Add('select count(*) CNT from subscr_serv s where s.Customer_Id = :CID ');
    Query.SQL.Add('and s.State_Sgn = 1 and s.State_Date > dateadd(year, -1, current_date) ');
    Query.SQL.Add('and s.State_Srv in (57386, 791412, 791414)');
    Query.ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID
  end
  else
  begin
    Query.SQL.Add('select count(*) CNT ');
    Query.SQL.Add('    from subscr_serv ss inner join services s on (s.Service_Id = ss.Serv_Id)');
    Query.SQL.Add('    where ss.Customer_Id = :CID and s.Business_Type = 1');
    Query.SQL.Add('          and ss.State_Date >= CURRENT_DATE and upper(s.Name) like ''%PROMO%''');;
    Query.ParamByName('CID').AsInteger := CID;
  end;

  MakeDebugLog('CheckPromo', Query.SQL.Text);

  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  alert := Query.FN('CNT').AsInteger > 0;
  Query.Transaction.Commit;
  Query.Close;

  if (alert) then
    ShowMessage(rsPromoWarning);
end;

procedure TEditCFileForm.ToJudge();
begin
  if not FIsLTV then
    Exit;

  QueryClear;
  Query.SQL.Text := 'execute procedure IBE$toJUDGE(:CID, :notice)';

  Query.ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
  Query.ParamByName('notice').AsString := Trim(mmoDesc.Lines.Text);

  MakeDebugLog('ToJudge', Query.SQL.Text);

  Query.Transaction := trWrite;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
  Query.Close;
end;

function TEditCFileForm.CheckEnoughMoney: Boolean;
var
  Save_Cursor: TCursor;
  PN: string;
  addCharge: Boolean;
begin
  Result := true;
  if not pnlSrv.Visible then
    Exit;

  // проверим. это отключение СПД и ЛТВ ли
  addCharge := FIsLTV and (FFileTypeName.Contains('ОТКЛ') and (FFileTypeName.Contains('СПД.') or
    FFileTypeName.Contains('СТВ.')));
  if not addCharge then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;
        SQL.Text := 'execute procedure IBE$EnoughMoney(:CUSTOMER_ID, :SET_DATE, :Service_Id, :SRV_OFF);';
        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        if not VarIsNull(edDateSrv.value) then
          ParamByName('Set_Date').AsDate := edDateSrv.value;
        ParamByName('Service_Id').AsInteger := lcbService.value;
        ParamByName('SRV_OFF').AsInteger := lcbOnOffSrv.value;

        MakeDebugLog('CheckEnoughMoney', SQL.Text);

        Transaction.StartTransaction;
        ExecQuery;
        Result := (FN('enough').AsInteger = 1);
        Transaction.Rollback;
      finally
        Free;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor;
  end;

  if not Result then
    ShowMessage(rsEnoughMoneyDateIncorrect);

  // за неуплату можно отключать в любой день
  PN := lcbOnOffSrv.Text.ToUpper;
  if PN.Contains('НЕУП') then
    Result := true;
end;

procedure TEditCFileForm.CreateTask;
begin
  if not pnlTask.Visible then
    Exit;

  QueryClear;
  Query.SQL.Add('execute block (');
  Query.SQL.Add('    Customer_ID D_integer = :Customer_ID,');
  Query.SQL.Add('    ACCOUNT     D_VARCHAR100 = :ACCOUNT,');
  Query.SQL.Add('    TITLE       D_VARCHAR100 = :TITLE,');
  Query.SQL.Add('    TDATE       d_date = :TDATE,');
  Query.SQL.Add('    FILE_TYPE D_integer = :FILE_TYPE');
  Query.SQL.Add(')');
  Query.SQL.Add('as');
  Query.SQL.Add('declare variable ID D_INTEGER;');
  Query.SQL.Add('declare variable CLR D_VARCHAR10;');
  Query.SQL.Add('begin');
  Query.SQL.Add('  ID = gen_id(Gen_Task, 1);');
  Query.SQL.Add('  select O_Dimension from objects where O_Type = 33 and O_Id = :FILE_TYPE into :CLR;');
  Query.SQL.Add
    ('  insert into TASKLIST (ID, TITLE, NOTICE, PLAN_DATE, WHO_CAN, DELETED, COLOR) values (:ID, :TITLE, '''', :TDATE, 1, 0, :CLR);');
  Query.SQL.Add('  insert into Taskuser (Task_Id, Foruser) values (:ID, current_user);');
  Query.SQL.Add
    ('  insert into TASKMSG (TASK_ID, TEXT, OBJ_TYPE, OBJ_ID, DELETED) values (:ID, :TITLE, ''A'', :ACCOUNT, 0);');
  Query.SQL.Add('end');

  Query.ParamByName('Customer_Id').AsInteger := FCustomerInfo.CUSTOMER_ID;
  Query.ParamByName('ACCOUNT').AsString := FCustomerInfo.Account_No;
  Query.ParamByName('FILE_TYPE').AsInteger := dbluFileType.value;
  Query.ParamByName('TITLE').AsString := edtTskName.Text;
  Query.ParamByName('TDATE').AsDate := edTskDate.value;

  MakeDebugLog('CreateTask', Query.SQL.Text);

  Query.Transaction := trWrite;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
  Query.Close;
end;

procedure TEditCFileForm.SetInfoFromRequest;
var
  r: Integer;
  HasError: Boolean;
  COST, SRV_COST, PAYED: Double;
  CID: Integer;
begin
  CnErrors.Dispose(ednBid);
  HasError := False;

  if (ednBid.Text.IsEmpty) or (not TryStrToInt(ednBid.Text, r)) then
    Exit;

  COST := 0;
  SRV_COST := 0;
  PAYED := 0;
  CID := -1;

  QueryClear;
  Query.SQL.Add('select coalesce(r.Rq_Customer, -1) customer_id ');
  Query.SQL.Add(' , coalesce(Get_Request_Money(r.Rq_Id), 0) COST ');
  Query.SQL.Add(' , coalesce((select sum(w_quant) ');
  Query.SQL.Add('      from request_works where rq_id = r.Rq_Id ');
  Query.SQL.Add('           and w_id in (984742, 983987)), 0) SRV_COST '); // Две услуги для зачисления на счет
  Query.SQL.Add(' , coalesce((select sum(p.Pay_Sum) as PAY ');
  Query.SQL.Add('     from payment p where p.customer_id = r.rq_customer and p.Rq_Id = r.rq_id), 0) PAYED');
  Query.SQL.Add('from request r where r.Rq_Id = :rq_id');
  Query.ParamByName('rq_id').AsInteger := r;
  Query.Transaction := trReadQ;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if Query.RecordCount > 0 then
  begin
    COST := Query.FieldByName('COST').AsDouble;
    SRV_COST := Query.FieldByName('SRV_COST').AsDouble;
    PAYED := Query.FieldByName('PAYED').AsDouble;
    if Query.FieldByName('customer_id').AsInteger > 0 then
    begin
      CID := Query.FieldByName('customer_id').AsInteger;
      if (not FFileTypeName.Contains('ШТРАФ')) and
        (Query.FieldByName('customer_id').AsInteger <> FCustomerInfo.CUSTOMER_ID) then
      begin
        HasError := true;
        CID := -1;
        CnErrors.SetError(ednBid, 'Эта заявка для другого абонента', iaMiddleLeft, bsNeverBlink);
      end;
    end;
  end;
  Query.Transaction.Commit;
  Query.Close;

  if HasError then
  begin
    ednBid.SetFocus;
    Exit;
  end;

  if (ednBidSum.Text.IsEmpty) then
    ednBidSum.value := COST;

  COST := COST + SRV_COST - PAYED;

  if COST <= 0 then
  begin
    HasError := true;
    CnErrors.SetError(ednBid, 'Эта заявка уже оплачена', iaMiddleLeft, bsNeverBlink);
  end
  else if PAYED > 0 then
  begin
    if ednBid.Tag = 0 then
      ShowMessage('Заявка частично оплачена. Остаток по оплате: ' + COST.ToString);
    ednBid.Tag := 1;
  end;

  ednBidSum.Tag := Trunc(SRV_COST * 100); // Сумма оплаты услуг
  ednCheckSum.Tag := Trunc(PAYED * 100); // Сумма частиной опалты

  if HasError then
  begin
    ednBid.SetFocus;
    Exit;
  end;

  if (FIsLTV and (FFileTypeName.Contains('ШТРАФ'))) then
    ednCheckSum.value := ednBidSum.value;

  QueryClear;
  Query.SQL.Add('select list(w.Surname||'' ''||coalesce(w.Firstname||'' ''||coalesce(w.Midlename, ''''), '''')) FIO');
  Query.SQL.Add(' from Request_Executors e inner join worker w on (e.Exec_Id = w.Worker_Id)');
  Query.SQL.Add(' where e.Rq_Id = :rq_id');
  Query.ParamByName('rq_id').AsInteger := r;
  Query.Transaction := trReadQ;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if (not Query.FieldByName('FIO').IsNull) then
    FWorker := Query.FieldByName('FIO').AsString;
  Query.Transaction.Commit;
  Query.Close;
end;

function TEditCFileForm.IsDecoderText(edt: TDBEditEh): Boolean;
var
  s: String;
begin
  Result := (pnlText.Visible) and (edt.Visible);
  if Result then
  begin
    s := AnsiUpperCase(edt.EmptyDataInfo.Text);
    Result := (s.Contains('НОМЕР КАМ') or s.Contains('ДЕКОДЕР'));
  end;
end;

function TEditCFileForm.CheckDecoder(edt: TDBEditEh): String;
var
  Save_Cursor: TCursor;
  f, a: string;
  h: Integer;
  CID: Integer;
begin
  Result := '';
  {
    if (not pnlText.Visible) or (not edt.Visible) then
    Exit;

    s := AnsiUpperCase(edt.EmptyDataInfo.Text);
    if not(s.Contains('НОМЕР КАМ') //
    or s.Contains('ДЕКОДЕР ') //
    ) then
    Exit;
  }

  if not IsDecoderText(edt) then
    Exit;

  if edt.Text.IsEmpty then
  begin
    Result := rsIncorrectDecoder;
    Exit;
  end;

  h := -1;
  f := '';
  CID := -1;
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trReadQ;

        SQL.Clear;
        SQL.Add('select d.Eq_N, c.House_Id, c.flat_no, c.customer_id, c.account_no');
        SQL.Add('  from EQUIPMENT_DVB d');
        SQL.Add('       left outer join customer_decoders cd on (d.eq_n = cd.decoder_n)');
        SQL.Add('       left outer join customer c on (cd.customer_id = c.customer_id)');
        SQL.Add('  where d.Eq_N = :DECODER');

        ParamByName('DECODER').AsString := edt.Text;
        Transaction.StartTransaction;
        ExecQuery;
        if (FN('Eq_N').IsNull) then
          Result := rsNOT_FOUND_DECODER
        else
        begin
          if (not FN('House_Id').IsNull) then
            h := FN('House_Id').AsInteger;
          if (not FN('flat_no').IsNull) then
            f := FN('flat_no').AsString;
        end;
        if (not FN('customer_id').IsNull) then
        begin
          CID := FN('customer_id').AsInteger;
          a := FN('account_no').AsString;
        end;
        Transaction.Commit;
      finally
        Free;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor;
  end;

  if Result.IsEmpty then
  begin
    if pnlAdr.Visible then
    begin
      if (h <> lcbHOUSE.value) or (f <> lcbFLAT.Text) then
        Result := 'Декодера ' + edt.Text + ' нет по старому адресу';
    end
    else if (CID > -1) and (CID <> FCustomerInfo.CUSTOMER_ID) then
    begin
      Result := 'Декодер ' + edt.Text + ' выдан абоненту ' + a;
    end;
  end;
end;

function TEditCFileForm.CheckBlockDays: String;
var
  Save_Cursor: TCursor;
  addCharge: Boolean;
begin
  Result := '';
  if not pnlPeriod.Visible then
    Exit;

  // проверим. это отключение СПД и ЛТВ ли
  // СПД. Добр. Блок.  ПОДКЛЮЧИТЬ.
  addCharge := FIsLTV and (FFileTypeName.Contains('СПД.') and (FFileTypeName.Contains('БЛОК') and
    FFileTypeName.Contains('ПОДКЛ')));
  if not addCharge then
    Exit;

  if (VarIsNull(edDateBegin.value) or (edDateEnd.Visible and VarIsNull(edDateEnd.value))) then
  begin
    Result := rsERROR_NOT_FILL_ALL;
    Exit;
  end;

  if (not edDateEnd.Visible) or (edDateBegin.value > edDateEnd.value) or (edDateBegin.value < Date()) then
  begin
    Result := rsERROR_NOT_FILL_ALL;
    Exit;
  end;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trReadQ;

        SQL.Text := 'select enough from ibe$check_lan_block(:customer_id, :date_s, :date_e)';
        {
          SQL.Add('execute block( CUSTOMER_ID D_INTEGER = :CUSTOMER_ID, Date_S D_DATE = :Date_S, Date_E D_DATE = :Date_E )');
          SQL.Add('returns (enough D_Varchar255) as');
          SQL.Add('declare variable days D_Integer;');
          SQL.Add('begin');
          SQL.Add('  select sum(EXISTS_DAYS) EXISTS_DAYS from IBE$GET_CUSTOMERS_BLOCK_DAYS(:CUSTOMER_ID, :Date_S) into :days;');
          SQL.Add('  days = coalesce(days, 180);');
          SQL.Add('  if (Date_E <= dateadd(day, days, Date_S)) then enough = ''''; else enough = ''Разрешена блокировка до ''||dateadd(day, days, Date_S);');
          SQL.Add('  if (enough = '''') then begin');
          SQL.Add('    days = null; Date_E = null;');
          SQL.Add('    select first 1 ss.State_Date, ss.State_Sgn');
          SQL.Add('    from Subscr_Serv ss inner join services s on (s.Service_Id = ss.Serv_Id)');
          SQL.Add('    where s.Srv_Type_Id = 0 and s.Name like ''%СПД%ДБ%'' and ss.Customer_Id = :CUSTOMER_ID');
          SQL.Add('    order by ss.State_Date desc');
          SQL.Add('    into :Date_E, :days;');
          SQL.Add('    days = coalesce(days, 0);');
          SQL.Add('    if (days = 1) then enough = ''Абонент в блокировке с ''||Date_E;');
          SQL.Add('    else');
          SQL.Add('    if ((not Date_E is null) and (Date_S <= dateadd(day, 14, Date_E))) then enough = ''Прошло менее 14 дней'';');
          SQL.Add('  end');
          SQL.Add('  suspend;');
          SQL.Add('end');
        }
        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('Date_S').AsDate := edDateBegin.value;
        ParamByName('Date_E').AsDate := edDateEnd.value;
        Transaction.StartTransaction;
        ExecQuery;
        Result := (FN('enough').AsString);
        Transaction.Commit;
      finally
        Free;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TEditCFileForm.MakeBlock;
var
  Save_Cursor: TCursor;
  addCharge: Boolean;
begin
  if not pnlPeriod.Visible then
    Exit;

  // проверим. это отключение СПД и ЛТВ ли
  // СПД. Добр. Блок.  ПОДКЛЮЧИТЬ.
  addCharge := FIsLTV and (FFileTypeName.Contains('СПД.') and (FFileTypeName.Contains('БЛОК') and
    FFileTypeName.Contains('ПОДКЛ')));

  if not addCharge then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;

        SQL.Text := 'execute procedure IBE$MAKEBLOCK(:Customer_Id, :DATE_B, :DATE_E, :NOTICE, :CONTR_N);';

        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('DATE_B').AsDate := edDateBegin.value;
        ParamByName('DATE_E').AsDate := edDateEnd.value;
        ParamByName('NOTICE').AsString := mmoDesc.Lines.Text;
        ParamByName('CONTR_N').AsString := edtContract.Text;

        MakeDebugLog('MakeBlock', SQL.Text);

        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TEditCFileForm.GetBlockSrvName(var SrvName: String; var OffSrvName: String);
var
  Save_Cursor: TCursor;
  addCharge: Boolean;
begin
  SrvName := '';
  OffSrvName := '';

  if not pnlPeriod.Visible then
    Exit;

  if (VarIsNull(edDateBegin.value) or VarIsNull(edDateEnd.value)) then
    Exit;

  // проверим. это отключение СПД и ЛТВ ли
  // СПД. Добр. Блок.  ПОДКЛЮЧИТЬ.
  addCharge := FIsLTV and (FFileTypeName.Contains('СПД.') and (FFileTypeName.Contains('БЛОК') and
    FFileTypeName.Contains('ПОДКЛ')));

  if not addCharge then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;
        SQL.Text := 'select srvName, OFFSRVNAME from IBE$MAKEBLOCK_SRV(:Customer_Id, :DATE_B, :DATE_E)';
        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('DATE_B').AsDate := edDateBegin.value;
        ParamByName('DATE_E').AsDate := edDateEnd.value;
        Transaction.StartTransaction;
        ExecQuery;
        if not FN('srvName').IsNull then
          SrvName := FN('srvName').AsString;
        if not FN('OffSrvName').IsNull then
          OffSrvName := FN('OffSrvName').AsString;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

function TEditCFileForm.GetSrvList: String;
var
  Save_Cursor: TCursor;
begin
  if not FLstSrv.IsEmpty then
  begin
    Result := FLstSrv;
    Exit;
  end;
  Result := '';
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trReadQ;
        SQL.Text :=
          'select list(s.Shortname) lst from Subscr_hist ss inner join services s on (s.Service_Id = ss.Serv_Id) ';
        SQL.Add(' where ss.Customer_Id = :CUSTOMER_ID and current_date between ss.Date_From and ss.Date_To ');
        SQL.Add(' and ss.Serv_Id <> 819519 ');
        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        Transaction.StartTransaction;
        ExecQuery;
        FLstSrv := (FN('lst').AsString);
        Result := FLstSrv;
        Transaction.Commit;
      finally
        Free;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TEditCFileForm.MakePromo;
var
  Save_Cursor: TCursor;
begin
  // if not pnlPeriod.Visible then
  // Exit;

  if not(FFileTypeName.Contains('СПД.') and FFileTypeName.Contains('ПОДКЛ.') and FFileTypeName.Contains('И-НЕТ.')) then
    Exit;

  if not lcbService.Text.Contains('PROMO') then
    Exit;

  if not FIsLTV then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;

        SQL.Text := 'execute procedure IBE$MAKEPROMO(:Customer_Id, :DATE_B, :DATE_E, :NOTICE, :CONTR_N, :TEXT);';

        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('DATE_B').AsDate := edDateSrv.value;
        ParamByName('DATE_E').AsDate := edDateSrv.value;
        ParamByName('NOTICE').AsString := mmoDesc.Lines.Text;
        ParamByName('CONTR_N').AsString := edtContract.Text;
        ParamByName('TEXT').AsString := lcbService.Text;

        MakeDebugLog('MakePromo', SQL.Text);

        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TEditCFileForm.miFileClearClick(Sender: TObject);
begin
  edtFILE.Text := '';
  SetFile(edtFILE.Text);
end;

procedure TEditCFileForm.mmoNoticeChange(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.mmoNoticeExit(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.SetFileType(const FileType: Integer = -1; const FileTypeName: String = '';
  const ProcList: String = '');
begin
  if (FileTypeName.IsEmpty) or (FileType = -1) then
  begin
    FFileType := -1;
    FFileTypeName := '';
    FFileInMem.Clear;
    FProcList := '';
  end
  else
  begin
    FFileType := FileType;
    FProcList := ProcList;
    FFileTypeName := FileTypeName.ToUpper.Trim;
    if FFileTypeName.StartsWith('РТ') then
      SetImageFromImageList;
  end;
end;

function TEditCFileForm.ExistsPassportInAccount(const PN: String): Boolean;
begin
  Result := False;

  QueryClear;
  Query.SQL.Add('select count(*) cnt from Customer_Files cf');
  Query.SQL.Add('where cf.customer_id = :CID and (cf.Name like :pn or cf.Notice like :pn)');
  Query.ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
  Query.ParamByName('pn').AsString := '%' + PN + '%';
  Query.Transaction := trReadQ;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if not Query.FN('cnt').IsNull then
    Result := (Query.FN('cnt').AsInteger > 0);
  Query.Transaction.Commit;
  Query.Close;
end;

procedure TEditCFileForm.SetImageFromImageList();
var
  Bitmap: TBitmap;
  FN: String;
begin
  Bitmap := TBitmap.Create;
  FN := GetTempDir + 'PT.bmp';
  try
    Bitmap := TBitmap.Create;
    Bitmap.PixelFormat := pf32bit;
    Bitmap.AlphaFormat := afIgnored;
    A4MainForm.ICONS_ACTIVE.GetBitmap(53, Bitmap);
    if FileExists(FN) then
      DeleteFile(FN);
    Bitmap.SaveToFile(FN);
    SetFile(FN);
    FNeedDelete := true;
  finally
    Bitmap.Free;
  end;
end;

function TEditCFileForm.CheckTypeReuse: String;
var
  ShowWarning: Boolean;
begin
  ShowWarning := False;
  Result := '';

  QueryClear;
  Query.SQL.Add('select count(*) cnt from Customer_Files ');
  Query.SQL.Add(' where customer_id = :CID and CF_TYPE = :FT and cast(Added_On as Date) = current_date');
  Query.ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
  Query.ParamByName('FT').AsInteger := dbluFileType.value;
  Query.Transaction := trReadQ;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if not Query.FN('cnt').IsNull then
    ShowWarning := (Query.FN('cnt').AsInteger > 0);
  Query.Transaction.Commit;
  Query.Close;

  if ShowWarning then
    Result := dbluFileType.Text + ' такой тип сегодня уже добавляли абоненту';
end;

function TEditCFileForm.CheckDatesOnOff: String;
begin
  Result := '';

  if lcbService.Text.IsEmpty then
    Exit;

  if FIsLTV and (FFileTypeName.Contains('ОТКЛ') and FFileTypeName.Contains('ДОСРОЧНО')) then
  begin
    if VarToDateTime(edDateSrv.value) < Date() then
      Result := 'Дата не может быть раньше чем ' + FormatDateTime('dd.mm.yyyy', Date());
  end
  else
  begin
    QueryClear;
    Query.SQL.Add('select State_Date from Subscr_Serv where Customer_Id = :CID and Serv_Id = :SID');
    Query.ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
    Query.ParamByName('SID').AsInteger := lcbService.value;
    Query.Transaction := trReadQ;
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
    if not Query.FN('State_Date').IsNull then
    begin
      if VarToDateTime(edDateSrv.value) < Query.FN('State_Date').AsDate then
        Result := 'Дата не может быть раньше чем ' + FormatDateTime('dd.mm.yyyy', Query.FN('State_Date').AsDate);
    end;
    Query.Transaction.Commit;
    Query.Close;
  end;
end;

function TEditCFileForm.ValidateData: Boolean;
var
  errors: Boolean;
  cs: string;
begin
  Result := False;

  if (FFileTypeName.IsEmpty) then
  begin
    Result := true;
    CnErrors.SetError(dbluFileType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(dbluFileType);

  if (edtNAME.Text = '') then
  begin
    Result := true;
    CnErrors.SetError(edtNAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtNAME);

  if (edtFILE.Text = '') and FFileRequred then
  begin
    Result := true;
    CnErrors.SetError(edtFILE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtFILE);

  if dsCustFile.State <> dsInsert then
    Exit;

  // Only for Insert

  if (pnlPassport.Visible) and (edtPASSPORT.Text = '') then
  begin
    Result := true;
    CnErrors.SetError(edtPASSPORT, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtPASSPORT);

  if (pnlContract.Visible) then
  begin
    if (chkContract.State = cbGrayed) then
    begin
      Result := true;
      CnErrors.SetError(chkContract, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(chkContract);

    if (chkContract.Checked) then
    begin
      cs := '';
      if chkFOwner.Checked then
        cs := Format(FOwnerS, [''])
      else
      begin
        if not chkFOwner.Checked then
          cs := Format(FRentS, ['']);
      end;

      if (edtContract.Text.IsEmpty) or (Trim(edtContract.Text) = cs) or (FContract.IsEmpty) then
      begin
        Result := true;
        CnErrors.SetError(edtContract, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(edtContract);

      if (VarIsNull(edtContractDate.value)) then
      begin
        Result := true;
        CnErrors.SetError(edtContractDate, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(edtContractDate);
    end;

    if (pnlMobile.Visible) then
    begin
      if HasErrorInPhone then
        Result := true;
    end;
  end;

  if (pnlText.Visible) then
  begin
    if (edtText.Text.IsEmpty) then
    begin
      if (not FNameFmt.IsEmpty) and FNameFmt.Contains(rsFldText) then
      begin
        Result := true;
        CnErrors.SetError(edtText, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else if (not dsFileTypes.FieldByName('O_DESCRIPTION').IsNull) then
      begin
        if (dsFileTypes.FieldByName('O_DESCRIPTION').AsString.Contains(rsFldText)) then
        begin
          Result := true;
          CnErrors.SetError(edtText, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
        end
        else
          CnErrors.Dispose(edtText);
      end
    end
    else
    begin
      if (not FTextReg.IsEmpty) then
      begin
        errors := not CheckControlText(edtText, FTextReg);
        if errors then
          Result := true;
      end;
    end;
  end
  else
    CnErrors.Dispose(edtText);

  if (edtText1.Visible) then
  begin
    if (edtText1.Text.IsEmpty) then
    begin
      if (not FNameFmt.IsEmpty) and FNameFmt.Contains(rsFldText) then
      begin
        Result := true;
        CnErrors.SetError(edtText1, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else if (not dsFileTypes.FieldByName('O_DESCRIPTION').IsNull) then
      begin
        if (dsFileTypes.FieldByName('O_DESCRIPTION').AsString.Contains(rsFldText)) then
        begin
          Result := true;
          CnErrors.SetError(edtText1, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
        end
        else
          CnErrors.Dispose(edtText1);
      end
    end
    else
    begin
      if (not FText1Reg.IsEmpty) then
      begin
        errors := not CheckControlText(edtText1, FText1Reg);
        if errors then
          Result := true;
      end;
    end;
  end
  else
    CnErrors.Dispose(edtText1);

  if (edtText2.Visible) then
  begin
    if (edtText2.Text.IsEmpty) then
    begin
      if (not FNameFmt.IsEmpty) and FNameFmt.Contains(rsFldText2) then
      begin
        Result := true;
        CnErrors.SetError(edtText2, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else if (not dsFileTypes.FieldByName('O_DESCRIPTION').IsNull) then
      begin
        if (dsFileTypes.FieldByName('O_DESCRIPTION').AsString.Contains(rsFldText2)) then
        begin
          Result := true;
          CnErrors.SetError(edtText2, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
        end
        else
          CnErrors.Dispose(edtText2);
      end
    end
    else
    begin
      if (not FText2Reg.IsEmpty) then
      begin
        errors := not CheckControlText(edtText2, FText2Reg);
        if errors then
          Result := true;
      end;
    end;
  end
  else
    CnErrors.Dispose(edtText2);

  if (edtText3.Visible) then
  begin
    if (edtText3.Text.IsEmpty) then
    begin
      if (not FNameFmt.IsEmpty) and FNameFmt.Contains(rsFldText3) then
      begin
        Result := true;
        CnErrors.SetError(edtText3, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else if (not dsFileTypes.FieldByName('O_DESCRIPTION').IsNull) then
      begin
        if (dsFileTypes.FieldByName('O_DESCRIPTION').AsString.Contains(rsFldText3)) then
        begin
          Result := true;
          CnErrors.SetError(edtText3, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
        end
        else
          CnErrors.Dispose(edtText3);
      end
    end
    else
    begin
      if (not FText3Reg.IsEmpty) then
      begin
        errors := not CheckControlText(edtText3, FText3Reg);
        if errors then
          Result := true;
      end;
    end;
  end
  else
    CnErrors.Dispose(edtText3);

  if (edtText4.Visible) then
  begin
    if (edtText4.Text.IsEmpty) then
    begin
      if (not FNameFmt.IsEmpty) and FNameFmt.Contains(rsFldText3) then
      begin
        Result := true;
        CnErrors.SetError(edtText4, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else if (not dsFileTypes.FieldByName('O_DESCRIPTION').IsNull) then
      begin
        if (dsFileTypes.FieldByName('O_DESCRIPTION').AsString.Contains(rsFldText3)) then
        begin
          Result := true;
          CnErrors.SetError(edtText4, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
        end
        else
          CnErrors.Dispose(edtText4);
      end
    end
    else
    begin
      if (not FText4Reg.IsEmpty) then
      begin
        errors := not CheckControlText(edtText4, FText4Reg);
        if errors then
          Result := true;
      end;
    end;
  end
  else
    CnErrors.Dispose(edtText4);

  if (pnlBidPay.Visible) then
  begin
    if ednBid.Visible and ednBid.Text.IsEmpty then
    begin
      Result := true;
      CnErrors.SetError(ednBid, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(ednBid);

    if ednBid.Visible and ednBidSum.Text.IsEmpty then
    begin
      Result := true;
      CnErrors.SetError(ednBidSum, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(ednBidSum);

    if ednCheckSum.Text.IsEmpty then
    begin
      Result := true;
      CnErrors.SetError(ednCheckSum, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(ednCheckSum);
  end
  else
  begin
    CnErrors.Dispose(ednBid);
    CnErrors.Dispose(ednBidSum);
    CnErrors.Dispose(ednCheckSum);
  end;

  if pnlTask.Visible then
  begin
    if edtTskName.Text.IsEmpty then
    begin
      Result := true;
      CnErrors.SetError(edtTskName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtTskName);

    if edTskDate.Text.IsEmpty then
    begin
      Result := true;
      CnErrors.SetError(edTskDate, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edTskDate);
  end
  else
  begin
    CnErrors.Dispose(edTskDate);
    CnErrors.Dispose(edtTskName);
  end;

  if pnlPeriod.Visible then
  begin
    if edDateBegin.Text.IsEmpty then
    begin
      Result := true;
      CnErrors.SetError(edDateBegin, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edDateBegin);

    if edDateEnd.Visible and edDateEnd.Text.IsEmpty then
    begin
      Result := true;
      CnErrors.SetError(edDateEnd, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edDateEnd);
  end
  else
  begin
    CnErrors.Dispose(edDateBegin);
    CnErrors.Dispose(edDateEnd);
  end;

  if (FShowFlatOwner and (pnlContract.Visible) and (chkFOwner.State = cbGrayed)) and (ParamExists(rsFldOwnerText)) then
  begin
    Result := true;
    CnErrors.SetError(chkFOwner, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(chkFOwner);

  if (pnlPayment.Visible) and (lcbPayment.Text.IsEmpty) then
  begin
    Result := true;
    CnErrors.SetError(lcbPayment, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(lcbPayment);

  Result := CheckPasport(Result);
  Result := CheckAddons(Result);
end;

procedure TEditCFileForm.MoveDVB();
var
  ci: TCustomerInfo;
  i: Integer;
begin
  if not FIsLTV then
    Exit;

  if (not FFileTypeName.Contains('ЦТВ.')) or (not FFileTypeName.Contains('КАМ STV-CRYPT')) then
    Exit;

  if not( //
    (FFileTypeName.Contains('ПРОДАЖА')) //
    or (FFileTypeName.Contains('ПЕРЕНОС')) //
    or (FFileTypeName.Contains('ПОДКЛ')) //
    ) then
    Exit;

  with TpFIBQuery.Create(Self) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := trWriteQ;
      SQL.Text := 'execute block (';
      SQL.Add('  CUSTOMER_ID D_integer     = :CUSTOMER_ID,');
      SQL.Add('  DECODER_N   D_DECODER     = :DECODER_N,');
      SQL.Add('  CONTR_N     D_VARCHAR20   = :CONTR_N,');
      SQL.Add('  FROM_CID    D_integer     = :FROM_CID,');
      SQL.Add('  DVB_SUM     D_N15_2       = :DVB_SUM,');
      SQL.Add('  CF_ID       D_INTEGER     = :CF_ID,');
      SQL.Add('  SRV_ID      D_INTEGER     = :SRV_ID,');
      SQL.Add('  NOTICE      varchar(1000) = :NOTICE)');
      SQL.Add('as');
      SQL.Add('declare variable s D_INTEGER;');
      SQL.Add('declare variable n D_INTEGER;');
      SQL.Add('declare variable f D_INTEGER;');
      SQL.Add('declare variable i D_INTEGER;');
      SQL.Add('begin');

      if (FFileTypeName.Contains('ПЕРЕНОС')) then
      begin
        SQL.Add('  update CUSTOMER_DECODERS set CUSTOMER_ID = :CUSTOMER_ID, NOTICE = :NOTICE  ');
        SQL.Add('  where DECODER_N = :DECODER_N and CUSTOMER_ID = :FROM_CID;');

        SQL.Add('  update Single_Serv set Notice = :Notice ');
        SQL.Add('  where Notice = :DECODER_N and Customer_Id = :FROM_CID and Serv_Date = current_date;');

        // 621281 КАМ STV-Crypt.  ПЕРЕНОС  БЕСПЛАТНО  (0.00руб.)
        SQL.Add('  n = 621281; f = 621281;');
        SQL.Add('  for select Service_Id from Decoder_Packets where Decoder_N = :DECODER_N into :s do begin');
        SQL.Add('    execute procedure Add_Subscr_Service(:Customer_Id, :s, :n, current_date, :NOTICE, 1, :CONTR_N, null);');
        SQL.Add('    execute procedure Onoff_Service_By_Id(:FROM_CID, :s, :f, current_date, 1, :NOTICE, 1);');
        SQL.Add('  end');
      end
      else
      begin
        SQL.Add('  if (not exists(select Customer_Id from CUSTOMER_DECODERS ');
        SQL.Add('   where CUSTOMER_ID = :CUSTOMER_ID and DECODER_N = :DECODER_N)) then ');
        SQL.Add('    update or insert into CUSTOMER_DECODERS (CUSTOMER_ID, DECODER_N, NOTICE) ');
        SQL.Add('    values (:CUSTOMER_ID, :DECODER_N, :NOTICE) matching (CUSTOMER_ID, DECODER_N);');
        SQL.Add('  else');
        SQL.Add('    update CUSTOMER_DECODERS set NOTICE = :NOTICE ');
        SQL.Add('    where CUSTOMER_ID = :CUSTOMER_ID and DECODER_N = :DECODER_N; ');
      end;

      SQL.Add('  update Single_Serv set Notice = :Notice ');
      SQL.Add('  where Notice = :DECODER_N and Customer_Id = :CUSTOMER_ID and Serv_Date = current_date;');

      if (FIsLTV) then
      begin
        if FFileTypeName.Contains('ПЕРЕНОС') then
        begin
          // 994408, 'КАМ STV Crypt.  ПЕРЕНОС. (отключить).'
          // 994407, 'КАМ STV Crypt.  ПЕРЕНОС. (подключить).'
          SQL.Add('  if (not DVB_SUM is null) then begin');
          SQL.Add('    execute procedure Add_Single_Service(:CUSTOMER_ID, 994407, :DVB_SUM, current_date, :NOTICE);');
          SQL.Add('    execute procedure Add_Single_Service(:FROM_CID, 994408, :DVB_SUM, current_date, :NOTICE);');
          SQL.Add('  end');
          // нужно вставіть файл абоненту с которого переносім
          SQL.Add('  i = gen_id(Gen_Operations_Uid, 1);');
          SQL.Add('  insert into Customer_Files (CF_ID, Customer_Id, Name, Cf_Type, Date_From, Date_To, Filename, Notice, Act, Anotice, Content, Addons)');
          SQL.Add('  select :i, :FROM_CID, Name, 47970, Date_From, Date_To, Filename, Notice, Act, Anotice, Content, Addons');
          SQL.Add('  from Customer_Files where Cf_Id = :Cf_Id;');
          SQL.Add('  update Customer_Files cf ');
          SQL.Add('    set cf.Name = replace(replace(replace(cf.Name, ''Подкл'', ''Откл''), ''подкл'', ''откл''), ''ПОДКЛ'', ''ОТКЛ''), ');
          SQL.Add('    cf.Notice = replace(replace(replace(cf.Notice, ''Подкл'', ''Откл''), ''подкл'', ''откл''), ''ПОДКЛ'', ''ОТКЛ'')  ');
          SQL.Add('  where cf.Cf_Id = :i; ');
        end
        else
        begin
          if (FFileTypeName.Contains('РАССР')) and (FFileTypeName.Contains('ПОДКЛ')) then
          begin
            // 385285 КАМ_STV-Crypt.  Рассрочка - 1.
            // 468026 КАМ_STV-Crypt.  Рассрочка - 2.
            // SQL.Add('  select count(*) from Customer_Decoders where Customer_Id = :CUSTOMER_ID into :s; ');
            // SQL.Add('  if (s = 1) then begin s = 385285; n = 385291; f = 415690; end ');
            // SQL.Add('  else begin s = 468026; n = 468030; f = 712297; end ');
            // SQL.Add('  execute procedure Add_Subscr_Service(:Customer_Id, :s, :n, current_date, :NOTICE, 1, :CONTR_N, null);');
            SQL.Add('  if (SRV_ID = 385285) then f = 415690;'); // КАМ_STV-Crypt.  Рассрочка - 1
            SQL.Add('  if (SRV_ID = 468026) then f = 712297;'); // КАМ_STV-Crypt.  Рассрочка - 2
            SQL.Add('  if (SRV_ID = 563493) then f = 712300;'); // КАМ_STV-Crypt.  Рассрочка - 3
            SQL.Add('  if (SRV_ID = 1061007) then f = 1061012;'); // КАМ_STV-Crypt.  Рассрочка - 4
            SQL.Add('  execute procedure Onoff_Service_By_Id(:Customer_Id, :SRV_ID, :f, dateadd(YEAR,2,current_date), 1, :NOTICE, 1);');
          end;
        end;
      end;

      // if (FFileTypeName.Contains('ПРОДАЖА')) then
      // begin
      // end;

      SQL.Add('end');

      // showMessage(SQL.Text);

      ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
      ParamByName('CF_ID').AsInteger := dsCustFile.FieldByName('CF_ID').AsInteger;
      ParamByName('DECODER_N').AsString := edtText.Text;
      ParamByName('NOTICE').AsString := mmoDesc.Lines.Text;
      if FShowFlatOwner then
        ParamByName('CONTR_N').AsString := edtContract.Text;

      if (FFileTypeName.Contains('ПЕРЕНОС')) then
      begin
        ci := GetCustomerByAddress(i);
        ParamByName('FROM_CID').AsInteger := ci.CUSTOMER_ID;
        if not ednCheckSum.Text.IsEmpty then
          ParamByName('DVB_SUM').AsDouble := ednCheckSum.value;
      end
      else if (FFileTypeName.Contains('РАССР')) then
      begin
        ParamByName('SRV_ID').AsInteger := lcbService.KeyValue;
      end;

      MakeDebugLog('MoveDVB', SQL.Text);

      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

function TEditCFileForm.ParamExists(const Param: String): Boolean;
begin
  // проверим есть ли переменная в имени или описании
  Result := False;
  if not FNameFmt.IsEmpty then
    Result := FNameFmt.Contains(Param);

  if (not dsFileTypes.FieldByName('O_DESCRIPTION').IsNull) then
    Result := Result or dsFileTypes.FieldByName('O_DESCRIPTION').AsString.Contains(Param);
end;

procedure TEditCFileForm.UnMakeBlock;
var
  Save_Cursor: TCursor;
  addCharge: Boolean;
begin
  if not pnlPeriod.Visible then
    Exit;

  // проверим. это отключение СПД и ЛТВ ли
  // СПД. Добр. Блок.  ПОДКЛЮЧИТЬ.
  addCharge := FIsLTV and (FFileTypeName.Contains('СПД.') and (FFileTypeName.Contains('БЛОК') and
    FFileTypeName.Contains('ОТКЛ')));

  if not addCharge then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;

        SQL.Text := 'execute procedure IBE$MAKEUNBLOCK(:Customer_Id, :DATE_B, :NOTICE, :CONTR_N);';

        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('DATE_B').AsDate := edDateEnd.value;
        ParamByName('NOTICE').AsString := mmoDesc.Lines.Text;
        ParamByName('CONTR_N').AsString := edtContract.Text;

        MakeDebugLog('UnMakeBlock', SQL.Text);

        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TEditCFileForm.GetUnBlockSrvName(var SrvName: String; var OffSrvName: String);
var
  Save_Cursor: TCursor;
  addCharge: Boolean;
begin
  SrvName := '';
  OffSrvName := '';

  // проверим. это отключение СПД и ЛТВ ли
  // СПД. Добр. Блок.  ПОДКЛЮЧИТЬ.
  addCharge := FIsLTV and (FFileTypeName.Contains('СПД.') and (FFileTypeName.Contains('БЛОК') and
    FFileTypeName.Contains('ОТКЛ')));

  if not addCharge then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;
        SQL.Text := 'select srvName, OFFSRVNAME from IBE$MAKEUNBLOCK_SRV(:Customer_Id, :DATE_B)';
        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        if (pnlPeriod.Visible) and (not VarIsNull(edDateBegin.value)) then
          ParamByName('DATE_B').AsDate := edDateBegin.value
        else
          ParamByName('DATE_B').AsDate := Date();
        Transaction.StartTransaction;
        ExecQuery;
        if not FN('srvName').IsNull then
          SrvName := FN('srvName').AsString;
        if not FN('OffSrvName').IsNull then
          OffSrvName := FN('OffSrvName').AsString;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TEditCFileForm.QueryClear;
begin
  if Query.Open then
  begin
    Query.Transaction.Rollback;
    Query.Close;
  end;
  Query.SQL.Clear;
end;

procedure TEditCFileForm.SetPanelOrder;
var
  vTabOrder: Integer;
  tPosition: Integer;

  procedure MoveControl(c: TCustomControl);
  begin
    if c.Visible then
    begin
      c.Top := tPosition;
      c.TabOrder := vTabOrder;
      Inc(vTabOrder);
    end;
  end;

begin
  tPosition := 1000; // pnlTop.Top + pnlTop.Height + 1;
  // pnlBidPay.TabOrder := 6;
  vTabOrder := 1;

  MoveControl((pnlPassport as TCustomControl));
  MoveControl((pnlDoc as TCustomControl));
  MoveControl((pnlContract as TCustomControl));
  MoveControl((pnlAdr as TCustomControl));
  MoveControl((pnlSrv as TCustomControl));
  MoveControl((pnlPayment as TCustomControl));
  MoveControl((pnlMaterials as TCustomControl));

  if pnlBidPay.Visible then
  begin
    ednBidSum.ReadOnly := FIsLTV and (not dmMain.UserIsAdmin);
    pnlBidPay.Top := tPosition;
    pnlBidPay.TabOrder := vTabOrder;
    Inc(vTabOrder);
  end;

  MoveControl((pnlTask as TCustomControl));
  MoveControl((pnlPeriod as TCustomControl));
  MoveControl((pnlMobile as TCustomControl));

  pnlText.Visible := edtText.Visible or edtText1.Visible or edtText2.Visible or edtText3.Visible or edtText4.Visible;
  if pnlText.Visible then
  begin
    pnlText.Top := tPosition;
    lblText1.Visible := edtText1.Visible;
    pnlText.Height := edtText4.Top + edtText4.Height + (edtText4.Top - edtText3.Top - edtText3.Height);
    if not edtText1.Visible then
      pnlText.Height := edtText1.Top
    else if not edtText2.Visible then
      pnlText.Height := edtText2.Top
    else if not edtText3.Visible then
      pnlText.Height := edtText3.Top
    else if not edtText4.Visible then
      pnlText.Height := edtText4.Top;

    pnlText.TabOrder := vTabOrder;
    Inc(vTabOrder);

    if (pnlBidPay.Visible and (not pnlPayment.Visible)) then
    begin
      ednFineSum.Visible := pnlPayment.Visible;
      pnlBidPay.Top := tPosition;
      pnlBidPay.TabOrder := vTabOrder;
      Inc(vTabOrder);
    end;
  end;

  // если имя заполняем автоматом, то опустим поле вниз
  if (not FNameFmt.IsEmpty) then
  begin
    pnlName.Top := tPosition;
    pnlName.TabOrder := pnlNotice.TabOrder - 1;
  end;
end;

procedure TEditCFileForm.GetCurrentBlock;
var
  Save_Cursor: TCursor;
  addCharge: Boolean;
begin
  if not pnlPeriod.Visible then
    Exit;

  // проверим. это отключение СПД и ЛТВ ли
  // СПД. Добр. Блок.  ПОДКЛЮЧИТЬ.
  addCharge := FIsLTV and FFileTypeName.Contains('СПД') and FFileTypeName.Contains('БЛОК') and
    FFileTypeName.Contains('ДОСРОЧНО');
  if not addCharge then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trReadQ;

        SQL.Clear;
        SQL.Add('select * from IBE$MAKEUNBLOCK_SRV(:Customer_Id, current_date)');

        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        Transaction.StartTransaction;
        ExecQuery;
        if not FN('SrvName').IsNull then
          edtText.Text := FN('SrvName').AsString;
        if not FN('Date_from').IsNull then
          edDateBegin.value := FN('Date_from').AsDate;
        if not FN('Date_to').IsNull then
        begin
          // edDateEnd.Value := FN('Date_to').AsDate;
          edDateSrv.value := FN('Date_to').AsDate;
        end;
        Transaction.Commit;
      finally
        Free;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

Procedure TEditCFileForm.SetBlockDays;
var
  Save_Cursor: TCursor;
  addCharge: Boolean;
begin
  if not pnlPeriod.Visible then
    Exit;

  // проверим. это отключение СПД и ЛТВ ли
  // СПД. Добр. Блок.  ПОДКЛЮЧИТЬ.
  addCharge := FIsLTV and (FFileTypeName.Contains('СПД.') and (FFileTypeName.Contains('БЛОК') and
    FFileTypeName.Contains('ПОДКЛ')));
  if not addCharge then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trReadQ;

        SQL.Clear;
        SQL.Add('execute block( CUSTOMER_ID D_INTEGER = :CUSTOMER_ID, Date_S D_DATE = :Date_S)');
        SQL.Add('returns (Date_E D_DATE) as');
        SQL.Add('declare variable days D_Integer;');
        SQL.Add('begin');
        SQL.Add('  Date_S = coalesce(Date_S, dateadd(DAY, 1, CURRENT_DATE));');
        SQL.Add('  select sum(EXISTS_DAYS) EXISTS_DAYS from IBE$GET_CUSTOMERS_BLOCK_DAYS(:CUSTOMER_ID, :Date_S) into :days;');
        SQL.Add('  days = coalesce(days, 180);');
        SQL.Add('  if (days > 0) then Date_E = dateadd(day, days, Date_S);');
        SQL.Add('  suspend;');
        SQL.Add('end');

        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        if (not VarIsNull(edDateBegin.value)) then
          ParamByName('Date_S').AsDate := edDateBegin.value;

        Transaction.StartTransaction;
        ExecQuery;
        if (VarIsNull(edDateBegin.value)) then
          edDateBegin.value := Date() + 1;
        if not FN('Date_E').IsNull then
          edDateEnd.value := FN('Date_E').AsDate;

        Transaction.Commit;
      finally
        Free;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

function TEditCFileForm.UpdatePayment: Boolean;
begin
  Result := False;
  if (FFileTypeName.Trim <> 'КОРРЕКТИРОВКА ПЛАТЕЖА.') then
    Exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Clear;
      SQL.Add('update PAYMENT set               ');
      SQL.Add('  PAY_SUM = :PAY_SUM           ');
      SQL.Add('  , NOTICE = :NOTICE             ');
      SQL.Add('  , FINE_SUM = :FINE_SUM         ');
      SQL.Add('where PAYMENT_ID = :PAYMENT_ID   ');

      ParamByName('PAYMENT_ID').AsInt64 := lcbPayment.value;
      if (not ednCheckSum.Text.IsEmpty) and (VarIsNumeric(ednCheckSum.value)) then
        ParamByName('PAY_SUM').AsCurrency := ednCheckSum.value
      else
        ParamByName('PAY_SUM').AsCurrency := 0;
      if (not ednFineSum.Text.IsEmpty) and (VarIsNumeric(ednFineSum.value)) then
        ParamByName('FINE_SUM').AsCurrency := ednFineSum.value
      else
        ParamByName('FINE_SUM').AsCurrency := 0;
      ParamByName('NOTICE').AsString := mmoDesc.Lines.Text;

      MakeDebugLog('UpdatePayment', SQL.Text);

      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      Close;
      Result := true;
    finally
      Free;
    end;
  end;
end;

procedure TEditCFileForm.PaymentOrder();
var
  Save_Cursor: TCursor;
begin
  if (not FIsLTV) or (not FFileTypeName.Contains('ПОРУЧЕНИЕ')) then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;

        SQL.Text := 'execute procedure Ibe$Payorder(:FT, :CI, :PD, :PS, :N, :ON, :PDN)';
        ParamByName('FT').AsString := FFileTypeName;
        ParamByName('CI').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('PD').AsDate := edDateBegin.value;
        ParamByName('PS').AsFloat := ednCheckSum.value;
        ParamByName('N').AsString := Trim(mmoDesc.Lines.Text);
        if edtText.EmptyDataInfo.Text.ToUpper.Contains('П/П') then
        begin
          ParamByName('PDN').AsString := Trim(edtText.Text);
          if edtText1.EmptyDataInfo.Text.ToUpper.Contains('СЗ') then
            ParamByName('ON').AsString := Trim(edtText1.Text)
        end
        else
          ParamByName('PDN').AsString := Trim(edtText1.Text);

        MakeDebugLog('PaymentOrder', SQL.Text);

        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TEditCFileForm.InstallmentPay;
var
  Save_Cursor: TCursor;
begin
  if (not FIsLTV) or (not FFileTypeName.StartsWith('РАССРОЧКА')) then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;
        SQL.Text := 'execute procedure Ibe$InstallmentPay(:FT, :CI, :COST, :MC, :N, :SD)';
        ParamByName('FT').AsString := FFileTypeName;
        ParamByName('CI').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('COST').AsFloat := ednCheckSum.value;
        ParamByName('MC').AsString := Trim(edtText.Text);
        ParamByName('N').AsString := Trim(mmoDesc.Lines.Text);
        // ParamByName('SD').AsDate := edDateBegin.value;

        MakeDebugLog('InstallmentPay', SQL.Text);

        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TEditCFileForm.ADD_RT();
begin
  if not FIsLTV then
    Exit;

  if not(FFileTypeName.StartsWith('СТВ') or FFileTypeName.StartsWith('СПД')) then
    Exit;

  if not(FFileTypeName.Contains('ОТКЛ') or FFileTypeName.Contains('ЗАЯВЛ')) then
    Exit;

  if not((AnsiUpperCase(edtText.Text) = 'ДА') //
    or (AnsiUpperCase(edtText1.Text) = 'ДА') //
    or (AnsiUpperCase(edtText2.Text) = 'ДА') //
    or (AnsiUpperCase(edtText3.Text) = 'ДА')) then
    Exit;

  with TpFIBQuery.Create(Self) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := trWriteQ;
      SQL.Text :=
        'execute procedure Add_Subscr_Service(:Customer_Id, 819519, 650507, current_date, :NOTICE, 1, :CONTR_N, null, 0);';
      ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
      ParamByName('NOTICE').AsString := mmoDesc.Lines.Text;
      ParamByName('CONTR_N').AsString := edtContract.Text;
      MakeDebugLog('ADD_RT', SQL.Text);

      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

function TEditCFileForm.CheckAllowedFT(): TProhibitiontType;
var
  JO: TJsonObject;
  s: string;
  CheckFT: Integer;
begin
  Result.Lock := False; // запрет на выбор типа файла
  Result.Message := '';

  // сначала проверим, можно ли добавлять этот тип файла по настройкам из JOSN
  s := '';
  CheckFT := -1;
  if dsFileTypes.Locate('O_ID', Integer(dbluFileType.value), []) then
  begin
    if (not dsFileTypes.FieldByName('O_CHARFIELD').IsNull) then
    begin
      s := dsFileTypes['O_CHARFIELD'];
      JO := TJsonObject.Parse(s) as TJsonObject;
      try
        if JO.Contains('AFT') then
        begin
          if not JO['AFT'].IsNull then
            CheckFT := JO.i['AFT'];
        end;
      finally
        JO.Free;
      end;
    end;
  end;

  // если указано что тип можно добавлять просле определенных типов, то проверим это
  if CheckFT <> -1 then
  begin
    // if not FIsLTV then Exit;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;
        SQL.Text := 'select o.O_ID, o.O_NAME ' +
          '  , iif(exists(select first 1 Cf_Id from CUSTOMER_FILES where Customer_Id = :CID and Cf_Type = o.O_Id order by CF_ID desc), 1, 0) ALLOW '
          + '  from OBJECTS o  where O_TYPE = 33 and o.O_ID = :AFT';
        ParamByName('CID').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('AFT').AsInteger := CheckFT;
        Transaction.StartTransaction;
        ExecQuery;
        if (not FN('ALLOW').IsNull) and (FN('ALLOW').AsInteger = 0) then
        begin
          Result.Lock := true;
          // запрет на выбор типа файла
          Result.Message := Format(rsNeedFileType, [FN('O_NAME').AsString]);
        end;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  end;

  // если по настройкам было можно,
  // то проверим есть ли процедура проверки и выполним ее если есть
  if (Result.Message.IsEmpty) and (FCheckTypeProc <> '') then
  begin
    // процедура вида
    // select Prohibit, Prohibit_text from FT_CHECK_PERMISSIONS(CUSTOMER_ID, FileType_ID)
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;
        SQL.Text := 'select Prohibit, Prohibit_text from ' + FCheckTypeProc + '(:CUSTOMER_ID, :FileType_ID)';
        ParamByName('CUSTOMER_ID').AsInteger := FCustomerInfo.CUSTOMER_ID;
        ParamByName('FileType_ID').AsInteger := dbluFileType.value;
        Transaction.StartTransaction;
        ExecQuery;
        if (not FN('Prohibit').IsNull) then
        begin
          Result.Lock := (FN('Prohibit').AsInteger = 1); // запрет на выбор типа файла
          Result.Message := FN('Prohibit').AsString;
        end;
        if (not FN('Prohibit_text').IsNull) then
          Result.Message := FN('Prohibit_text').AsString;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  end;

  // проверим, был ли такйо файл у абонента сегодня.
  // если был сообщим, но разрешим
  if (Result.Message.IsEmpty) then
  begin
    Result.Lock := False; // запрет на выбор типа файла
    Result.Message := CheckTypeReuse;
  end;
end;

procedure TEditCFileForm.OpenInetDialog;
var
  id: Integer;
begin
  id := -1;
  if FIsLTV then
  begin
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trReadQ;
        SQL.Text := 'select BLNG_ID from billing where customer_id = :CID';
        ParamByName('CID').AsInteger := CustomerInfo.CUSTOMER_ID;
        Transaction.StartTransaction;
        ExecQuery;
        if not FN('BLNG_ID').IsNull then
          id := FN('BLNG_ID').AsInteger;
        Transaction.Commit;

        // удалім другіе запісі, еслі оні есть
        if id <> -1 then
        begin
          Transaction := trWriteQ;
          SQL.Text := 'delete from billing where customer_id = :CID and BLNG_ID <> :ID';
          ParamByName('CID').AsInteger := CustomerInfo.CUSTOMER_ID;
          ParamByName('ID').AsInteger := id;
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
        end;
      finally
        Free;
      end;
    end;
  end;

  EditBillInfo(id, CustomerInfo.CUSTOMER_ID, CustomerInfo.Account_No, mmoDesc.Lines.Text, False, true);
  SetPasswordIfEmpty();

  if id <> -1 then
  begin
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trWriteQ;
        SQL.Add('update billing set blocked = 0 where BLNG_ID = :BLNG_ID');
        ParamByName('BLNG_ID').AsInteger := CustomerInfo.CUSTOMER_ID;
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  end
end;

procedure TEditCFileForm.MakeDebugLog(Module, SQL: string);
var
  FN: string;
begin
  if AtrCommon.GetComputerNetName.ToUpper.Contains('A4ON') then
  begin
    FN := ChangeFileExt(Application.ExeName, '.log');
    LogEvent('FT_' + FFileType.ToString, Module, SQL, FN);
  end;
end;

procedure TEditCFileForm.GetRentReturnFields;
var
  st: string;
begin
  if not FIsLTV then
    Exit;

  if not(FFileTypeName.Contains('АРЕНД') and FFileTypeName.Contains('ОТКЛ')) then
    Exit;

  if not(FFileTypeName.Contains('АРЕНД') and FFileTypeName.Contains('ОТКЛ')) then
    Exit;

  if (FFileTypeName.Contains('GPON_И')) then
    st := 'GPON_NTE'
  else if (FFileTypeName.Contains('GPON_Т')) then
    st := 'GEPON_WDM_FTTH'
  else if (FFileTypeName.Contains('WI-FI')) then
    st := 'Wi-Fi';

  if st.IsEmpty then
    Exit;

  with TpFIBQuery.Create(Self) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := trReadQ;
      SQL.Text := 'select first 1 a.Mac, a.Serial, a.Name from Appliance a ' +
        ' where a.Own_Id = :CID and a.Own_Type = 1 and a.Name like ''%' + st + '%''';
      ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
      Transaction.StartTransaction;
      ExecQuery;
      if (not FFileTypeName.Contains('WI-FI')) then
      begin
        if (not FN('Serial').IsNull) then
          edtText.Text := FN('Serial').AsString;
        if (not FN('Mac').IsNull) then
          edtText1.Text := FN('Mac').AsString;
      end
      else
      begin
        if (not FN('Name').IsNull) then
          edtText.Text := FN('Name').AsString;
        if (not FN('Serial').IsNull) then
          edtText1.Text := FN('Serial').AsString;
      end;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

function TEditCFileForm.CheckFileTypeExists(const TypeID: Integer): Boolean;
begin
  Result := False;

  QueryClear;
  Query.SQL.Add('select count(*) cnt from Customer_Files cf');
  Query.SQL.Add('where cf.customer_id = :CID and cf.Cf_Type = :FT ');
  if FIsLTV and pnlPassport.Visible and (not edtPASSPORT.Text.IsEmpty) then
  begin
    Query.SQL.Add(' and (cf.Name like :pn or cf.Notice like :pn)');
    Query.ParamByName('pn').AsString := '%' + edtPASSPORT.Text + '%';
  end;
  Query.ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
  Query.ParamByName('FT').AsInteger := TypeID;
  Query.Transaction := trReadQ;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if not Query.FN('cnt').IsNull then
    Result := (Query.FN('cnt').AsInteger > 0);
  Query.Transaction.Commit;
  Query.Close;
end;

function TEditCFileForm.GetProcParams(proc: string; var rSQL: string): TStringDynArray;
var
  c: Integer;
begin
  rSQL := 'select * from ' + proc + '(';
  with TpFIBQuery.Create(Self) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := trReadQ;
      SQL.Text := 'SELECT p.Rdb$Parameter_Name FLD FROM rdb$procedure_parameters p ' + //
        ' WHERE p.Rdb$Procedure_Name = :ProcName and p.Rdb$Parameter_Type = 0 ' + //
        ' order by p.Rdb$Parameter_Number';
      ParamByName('ProcName').AsString := proc;
      Transaction.StartTransaction;
      ExecQuery;
      c := 0;
      SetLength(Result, 255);
      while not EOF do
      begin
        if (not FN('FLD').IsNull) then
        begin
          Result[c] := FN('FLD').AsString.Trim;
          rSQL := rSQL + ':' + FN('FLD').AsString.Trim + ',';
          Inc(c);
        end;
        Next;
      end;
      SetLength(Result, c);
      Transaction.Commit;
    finally
      Free;
    end;
  end;
  rSQL := rSQL.TrimRight([',']) + ')';
end;

procedure TEditCFileForm.SetProcParamsValue(const aCustomerID: Integer; const aFileID: Integer; qry: TpFIBQuery;
  FList: TStringDynArray);
var
  fi: Integer;
  f, err: string;

  function CheckVarSet(const V: Variant): Boolean;
  begin
    Result := (not VarIsEmpty(V)) and (not VarIsNull(V)) and (not VarIsClear(V));
  end;

begin
  err := '';
  for fi := 0 to length(FList) - 1 do
  begin
    f := AnsiUpperCase(FList[fi]);
    try
      if (f = 'FFILETYPE') then
        qry.ParamByName(FList[fi]).AsInteger := FFileType
      else if (f = 'FFILETYPENAME') then
        qry.ParamByName(FList[fi]).AsString := FFileTypeName
      else if (f = 'FILEID') then
        qry.ParamByName(FList[fi]).AsInteger := aFileID
      else if (f = 'CUSTOMERID') then
        qry.ParamByName(FList[fi]).AsInteger := aCustomerID
      else if (f = 'CHKCONTRACT') then
        qry.ParamByName(FList[fi]).AsInteger := IfThen(chkContract.Checked, 1, 0)
      else if (f = 'CHKFOWNER') then
        qry.ParamByName(FList[fi]).AsInteger := IfThen(chkFOwner.Checked, 1, 0)
      else if ((f = 'CHKNEWOWNER')) then
        qry.ParamByName(FList[fi]).AsInteger := IfThen(chkNewOwner.Checked, 1, 0)
      else if ((f = 'CHKWA')) then
        qry.ParamByName(FList[fi]).AsInteger := IfThen(chkWA.Checked, 1, 0)
      else if ((f = 'DBLUFILETYPE') and CheckVarSet(dbluFileType.value)) then
        qry.ParamByName(FList[fi]).AsInteger := dbluFileType.value
      else if ((f = 'EDDATESRV') and CheckVarSet(edDateSrv.value)) then
        qry.ParamByName(FList[fi]).AsDate := edDateSrv.value
      else if ((f = 'EDDATE') and CheckVarSet(edDateSrv.value)) then
        qry.ParamByName(FList[fi]).AsDate := edDateSrv.value
      else if ((f = 'EDDATEBEGIN') and CheckVarSet(edDateBegin.value)) then
        qry.ParamByName(FList[fi]).AsDate := edDateBegin.value
      else if ((f = 'EDPBEGIN') and CheckVarSet(edDateBegin.value)) then
        qry.ParamByName(FList[fi]).AsDate := edDateBegin.value
      else if ((f = 'EDDATEEND') and CheckVarSet(edDateEnd.value)) then
        qry.ParamByName(FList[fi]).AsDate := edDateEnd.value
      else if ((f = 'EDPEND') and CheckVarSet(edDateEnd.value)) then
        qry.ParamByName(FList[fi]).AsDate := edDateEnd.value
      else if ((f = 'EDTSKDATE') and CheckVarSet(edTskDate.value)) then
        qry.ParamByName(FList[fi]).AsDate := edTskDate.value
      else if ((f = 'EDNBID') and CheckVarSet(ednBid.value)) then
        qry.ParamByName(FList[fi]).AsInteger := ednBid.value
      else if ((f = 'EDNBIDSUM') and CheckVarSet(ednBidSum.value)) then
        qry.ParamByName(FList[fi]).AsFloat := ednBidSum.value
      else if ((f = 'EDNCHECKSUM') and CheckVarSet(ednCheckSum.value)) then
        qry.ParamByName(FList[fi]).AsFloat := ednCheckSum.value
      else if ((f = 'EDNFINESUM') and CheckVarSet(ednFineSum.value)) then
        qry.ParamByName(FList[fi]).AsFloat := ednFineSum.value
      else if ((f = 'EDTADRES_REGISTR') and CheckVarSet(edtADRES_REGISTR.value)) then
        qry.ParamByName(FList[fi]).AsString := edtADRES_REGISTR.value
      else if ((f = 'EDTBIRTHDAY') and CheckVarSet(edtBIRTHDAY.value)) then
        qry.ParamByName(FList[fi]).AsDate := edtBIRTHDAY.value
      else if ((f = 'EDTCONTRACT') and CheckVarSet(edtContract.value)) then
        qry.ParamByName(FList[fi]).AsString := edtContract.value
      else if ((f = 'EDTCONTRACTDATE') and CheckVarSet(edtContractDate.value)) then
        qry.ParamByName(FList[fi]).AsDate := edtContractDate.value
      else if ((f = 'EDTDOCDATE') and CheckVarSet(edtDOCDATE.value)) then
        qry.ParamByName(FList[fi]).AsDate := edtDOCDATE.value
      else if ((f = 'EDTEMAIL') and CheckVarSet(edtEMAIL.value)) then
        qry.ParamByName(FList[fi]).AsString := edtEMAIL.value
      else if ((f = 'EDTFILE') and CheckVarSet(edtFILE.value)) then
        qry.ParamByName(FList[fi]).AsString := edtFILE.value
      else if ((f = 'EDTFIRSTNAME') and CheckVarSet(edtFIRSTNAME.value)) then
        qry.ParamByName(FList[fi]).AsString := edtFIRSTNAME.value
      else if ((f = 'EDTMIDLENAME') and CheckVarSet(edtMIDLENAME.value)) then
        qry.ParamByName(FList[fi]).AsString := edtMIDLENAME.value
      else if ((f = 'EDTMOBILE') and CheckVarSet(edtMobile.value)) then
        qry.ParamByName(FList[fi]).AsString := edtMobile.value
      else if ((f = 'EDTNAME') and CheckVarSet(edtNAME.value)) then
        qry.ParamByName(FList[fi]).AsString := edtNAME.value
      else if ((f = 'EDTPASSPORT') and CheckVarSet(edtPASSPORT.value)) then
        qry.ParamByName(FList[fi]).AsString := edtPASSPORT.value
      else if ((f = 'EDTPLACEBIRTH') and CheckVarSet(edtPlaceBirth.value)) then
        qry.ParamByName(FList[fi]).AsString := edtPlaceBirth.value
      else if ((f = 'EDTREGISTRATION') and CheckVarSet(edtRegistration.value)) then
        qry.ParamByName(FList[fi]).AsString := edtRegistration.value
      else if ((f = 'EDTSURNAME') and CheckVarSet(edtSURNAME.value)) then
        qry.ParamByName(FList[fi]).AsString := edtSURNAME.value
      else if ((f = 'EDTTEXT') and CheckVarSet(edtText.value)) then
        qry.ParamByName(FList[fi]).AsString := edtText.value
      else if ((f = 'EDTTEXT1') and CheckVarSet(edtText1.value)) then
        qry.ParamByName(FList[fi]).AsString := edtText1.value
      else if ((f = 'EDTTEXT2') and CheckVarSet(edtText2.value)) then
        qry.ParamByName(FList[fi]).AsString := edtText2.value
      else if ((f = 'EDTTEXT3') and CheckVarSet(edtText3.value)) then
        qry.ParamByName(FList[fi]).AsString := edtText3.value
      else if ((f = 'EDTTEXT4') and CheckVarSet(edtText4.value)) then
        qry.ParamByName(FList[fi]).AsString := edtText4.value
      else if ((f = 'EDTTSKNAME') and CheckVarSet(edtTskName.value)) then
        qry.ParamByName(FList[fi]).AsString := edtTskName.value
      else if ((f = 'LCBFLAT') and CheckVarSet(lcbFLAT.value)) then
        qry.ParamByName(FList[fi]).AsString := lcbFLAT.Text
      else if ((f = 'LCBHOUSE') and CheckVarSet(lcbHOUSE.value)) then
        qry.ParamByName(FList[fi]).AsInteger := lcbHOUSE.value
      else if ((f = 'LCBMATERIAL') and CheckVarSet(lcbMaterial.value)) then
        qry.ParamByName(FList[fi]).AsInteger := lcbMaterial.value
      else if ((f = 'LCBONOFFSRV') and CheckVarSet(lcbOnOffSrv.value)) then
        qry.ParamByName(FList[fi]).AsInteger := lcbOnOffSrv.value
      else if ((f = 'LCBPAYMENT') and CheckVarSet(lcbPayment.value)) then
        qry.ParamByName(FList[fi]).AsInteger := lcbPayment.value
      else if ((f = 'LCBSERVICE') and CheckVarSet(lcbService.value)) then
        qry.ParamByName(FList[fi]).AsInteger := lcbService.value
      else if ((f = 'LCBSERVICEFROM') and lcbServiceFrom.Visible and CheckVarSet(lcbServiceFrom.value)) then
        qry.ParamByName(FList[fi]).AsInteger := lcbServiceFrom.value
      else if ((f = 'LCBSTREETS') and CheckVarSet(lcbStreets.value)) then
        qry.ParamByName(FList[fi]).AsInteger := lcbStreets.value
      else if ((f = 'MMODESC') and CheckVarSet(mmoDesc.value)) then
        qry.ParamByName(FList[fi]).AsString := mmoDesc.Lines.Text
      else if ((f = 'MMONOTICE') and CheckVarSet(mmoNotice.value)) then
        qry.ParamByName(FList[fi]).AsString := mmoNotice.Lines.Text;
    except
      err := err + #13#10 + f;
    end;
  end;
  if not err.IsEmpty then
    ShowMessage('Ошибка установки параметров: ' + #13#10 + err);
end;

function TEditCFileForm.ExecCheckSaveSQL(): TFileTypeAddendumResult;
var
  ProcList, FieldList: TStringDynArray;
  Q: TpFIBQuery;
  vSql: string;
begin
  Result.RemoveFile := False;
  Result.RQ_ID := -1;
  Result.Result := 0;
  Result.Message := '';
  Result.Processed := False;
  Result.FROM_CID := -1;
  Result.FROM_RQ_ID := -1;

  if FCheckSaveProc.IsEmpty then
    Exit;

  FieldList := GetProcParams(FCheckSaveProc, vSql);
  Q := TpFIBQuery.Create(Self);
  try
    Q.DataBase := dmMain.dbTV;
    Q.Transaction := trWriteQ;
    Q.SQL.Text := vSql;
    SetProcParamsValue(FCustomerInfo.CUSTOMER_ID, FFileType, Q, FieldList);
    Q.Transaction.StartTransaction;
    Q.ExecQuery;
    if (Q.FieldIndex['PROHIBIT_TEXT'] >= 0) and (not Q.FN('PROHIBIT_TEXT').IsNull) then
      Result.Message := Q.FN('PROHIBIT_TEXT').AsString;
    if (Q.FieldIndex['PROHIBIT'] >= 0) and (not Q.FN('PROHIBIT').IsNull) then
      Result.RemoveFile := (Q.FN('PROHIBIT').AsInteger = 1);
    Q.Transaction.Commit;
  finally
    Q.Free;
  end;
end;

// если для типа файла есть процедура, то выполняем ее
// 0 - нет процедур, не обрабатывалась
// 1 - все ок
// -1 - Ошибка удалим файл
function TEditCFileForm.ExecSQLforFileType(const aCustomerID: Integer; const aFileID: Integer): TFileTypeAddendumResult;
var
  ProcList, FieldList: TStringDynArray;
  i: Integer;
  Q: TpFIBQuery;
  vSql: string;
begin
  Result.RemoveFile := False;
  Result.RQ_ID := -1;
  Result.Result := 0;
  Result.Message := '';
  Result.Processed := False;
  Result.FROM_CID := -1;
  Result.FROM_RQ_ID := -1;

  if FProcList.IsEmpty then
    Exit;

  ProcList := Explode(',', FProcList);
  i := 0;
  // TODO: Переделать условіе проверкі Result.Message.IsEmpty
  // подумать над выполнением каскада процедур
  while ((i < length(ProcList)) and (not Result.Processed)) do
  begin
    FieldList := GetProcParams(ProcList[i], vSql);
    Q := TpFIBQuery.Create(Self);
    try
      Q.DataBase := dmMain.dbTV;
      Q.Transaction := trWriteQ;
      Q.SQL.Text := vSql;
      SetProcParamsValue(aCustomerID, aFileID, Q, FieldList);

      MakeDebugLog('ExecSQLforFileType', Q.SQL.Text);

      Q.Transaction.StartTransaction;
      Q.ExecQuery;
      vSql := '';
      if (Q.FieldIndex['RESULT_TEXT'] >= 0) and (not Q.FN('RESULT_TEXT').IsNull) then
      begin
        Result.Message := Q.FN('RESULT_TEXT').AsString;
        Result.Processed := true;
      end;
      if (Q.FieldIndex['RQ_ID'] >= 0) and (not Q.FN('RQ_ID').IsNull) then
        Result.RQ_ID := Q.FN('RQ_ID').AsInteger;
      if (Q.FieldIndex['FROM_CID'] >= 0) and (not Q.FN('FROM_CID').IsNull) then
        Result.FROM_CID := Q.FN('FROM_CID').AsInteger;
      if (Q.FieldIndex['FROM_RQ_ID'] >= 0) and (not Q.FN('FROM_RQ_ID').IsNull) then
        Result.FROM_RQ_ID := Q.FN('FROM_RQ_ID').AsInteger;
      Q.Transaction.Commit;
    finally
      Q.Free;
    end;

    if not Result.Message.IsEmpty then
    begin
      MessageBoxW(Handle, PWideChar(WideFormat('Ошибка: %s'#13#10'Файл будет удален.', [Result.Message])),
        'Ошибка добавления', MB_OK + MB_ICONSTOP);
      Result.RemoveFile := true;
    end;
    Inc(i);
  end;

  {
    // выполняем процедуру такого плана
    create or alter procedure IBE$EXAMPLE (
    FFileType              Integer ,
    FFileTypeName          Varchar(255)  ,
    CustomerID             Integer ,
    FileID                 Integer ,
    chkContract            Integer ,
    chkFOwner              Integer ,
    chkNewOwner            Integer ,
    chkWA                  Integer ,
    dbluFileType           Integer ,
    edDate                 Date    ,
    edDateSrv              Date    ,
    edDateBegin            Date    ,
    edDateEnd              Date    ,
    edTskDate              Date    ,
    ednBid                 Integer ,
    ednBidSum              Float   ,
    ednCheckSum            Float   ,
    ednFineSum             Float   ,
    edtADRES_REGISTR       Varchar(255)  ,
    edtBIRTHDAY            Date    ,
    edtContract            Varchar(255)  ,
    edtContractDate        Date    ,
    edtDOCDATE             Date    ,
    edtEMAIL               Varchar(255)  ,
    edtFILE                Varchar(255)  ,
    edtFIRSTNAME           Varchar(255)  ,
    edtMIDLENAME           Varchar(255)  ,
    edtMobile              Varchar(255)  ,
    edtNAME                Varchar(255)  ,
    edtPASSPORT            Varchar(255)  ,
    edtPlaceBirth          Varchar(255)  ,
    edtRegistration        Varchar(255)  ,
    edtSURNAME             Varchar(255)  ,
    edtText                Varchar(255)  ,
    edtText1               Varchar(255)  ,
    edtText2               Varchar(255)  ,
    edtText3               Varchar(255)  ,
    edtTskName             Varchar(255)  ,
    lcbFLAT                Varchar(255)  ,
    lcbHOUSE               Integer ,
    lcbMaterial            Integer ,
    lcbOnOffSrv            Integer ,
    lcbPayment             Integer ,
    lcbService             Integer ,
    lcbServiceFrom         Integer ,
    lcbStreets             Integer ,
    mmoNotice              Varchar(1000)  ,
    mmoDesc                Varchar(1000)
    )
    returns (
    FROM_CID      integer,
    RQ_ID         integer,
    FROM_RQ_ID         integer,
    RESULT_TEXT varchar(255)
    )
    as
    begin
    -- возращаем RESULT_TEXT
    -- если пустое RESULT_TEXT, то нет ошибки иначе покажем Ошибку пользователю

    RESULT_TEXT = '';
    suspend;
    end
  }
end;

end.
