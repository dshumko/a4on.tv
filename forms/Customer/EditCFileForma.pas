unit EditCFileForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBDatabase, FIBDatabase,
  GridsEh, DBGridEh, DBCtrlsEh, DBLookupEh, PropFilerEh, PropStorageEh,
  CnErrorProvider,
  PrjConst, A4onTypeUnit;

type
  TEditCFileForm = class(TForm)
    srcFiles: TDataSource;
    dsFiles: TpFIBDataSet;
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
    memNotice: TDBMemoEh;
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
    edDate: TDBDateTimeEditEh;
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
    lblBP11: TLabel;
    edPBegin: TDBDateTimeEditEh;
    edPEnd: TDBDateTimeEditEh;
    procedure btnOkClick(Sender: TObject);
    procedure edtFILEEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnScanerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SetFile(value: String);
    function GetFile: String;
    procedure dbluFileTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lcbServiceChange(Sender: TObject);
    procedure edDateChange(Sender: TObject);
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
  private
    FNeedDelete: Boolean;
    FFileForSave: String;
    FCustomerInfo: TCustomerInfo;
    FNeedSrv: Boolean;
    FIsOff: Integer;
    FOpenInet: Boolean;
    FSingleSrv: Integer;
    FSinglSrvOnOff: Integer;
    FReqType: Integer;
    FReqTempl: Integer;
    FShowFlatOwner: Boolean;
    FNewContract: Boolean;
    FHandNameInput: String;
    FOwnerS: string;
    FRentS: string;
    FContract: string;
    FNameFmt: string;
    FOldNumber: string;
    FFullAccess: Boolean;
    FChangeHistory: Boolean;
    FOnlyToday: Boolean;
    FIsLTV: Boolean;
    FLstSrv: string;
    FWorker: string;
    FOwnerOldState: Integer;
    function FieldsToStr(const str: string): string;
    procedure ShowAddons;
    procedure ShowControlsJson(const json: String);
    function CheckAddons(const errors: Boolean): Boolean;
    procedure ExecuteAddons;
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
    function GetCustomerByAddress(var oldOwner: Integer): Integer;
    procedure AddSingleSrv;
    procedure MakeBidPayment;
    procedure SetPasswordIfEmpty();
    procedure Renegotiation();
    procedure CheckPromo();
    procedure ToBlackList();
    procedure ToJudge();
    procedure CreateTask;
    function CheckEnoughMoney: Boolean;
    procedure SetInfoFromRequest;
    function CheckBlockDays: String;
    procedure MakeBlock;
    procedure MakePromo;
    function GetSrvList: String;
  public
    property CustomerInfo: TCustomerInfo read FCustomerInfo write FCustomerInfo;
    property FileForSave: String read GetFile write SetFile;
  end;

function EditFile(const ci: TCustomerInfo; const Name: string; const CF_ID: Integer = -1;
  const FileName: String = ''): Boolean;

implementation

uses
  Winapi.ShellAPI, System.StrUtils, System.RegularExpressions, System.MaskUtils, AtrCommon,
  AtrStrUtils, DM, JsonDataObjects, ScanImageForma, BillEditForma, RequestNewForma, synacode;

{$R *.dfm}

function EditFile(const ci: TCustomerInfo; const Name: string; const CF_ID: Integer = -1;
  const FileName: String = ''): Boolean;
var
  ForInsert: Boolean;
  i: Integer;
  fs: TFileStream;
begin

  with TEditCFileForm.Create(Application) do
    try
      CustomerInfo := ci;
      dsFiles.Open;
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
          fs := TFileStream.Create(FileForSave, fmShareDenyNone);
          try
            TBlobField(dsCustFile.FieldByName('CONTENT')).LoadFromStream(fs);
          finally
            fs.Free;
          end;
        end;
        dsCustFile.FieldByName('ADDONS').AsString := GetFldAsJson;
        dsCustFile.Post;

        if ForInsert then
        begin
          ExecuteAddons;
          SaveDocument(i);
          SavePhone();
          UpdateCustomerInfo(ci.CUSTOMER_ID);
          SaveFlatOwner(ci.CUSTOMER_ID);
          CreateTask();
          MakeBlock();
          MakePromo();
        end;

        result := true;
      end
      else
      begin
        dsCustFile.Cancel;
        result := False;
      end;
      if dsFiles.Active then
        dsFiles.Close;
    finally
      Free
    end;
end;

function TEditCFileForm.FieldsToStr(const str: string): string;
var
  s: string;
  own: string;
  sum, rest: Double;
  fs: TFormatSettings;
begin
  s := str;
  result := s;
  if s.IsEmpty then
    Exit;
  fs.DecimalSeparator := '.';
  // fs.ThousandSeparator := ;
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
  if (FCustomerInfo.FIO <> '') then
    s := ReplaceStr(s, rsFldFULLNAME, FCustomerInfo.FIO);

  if (pnlPassport.Visible) then
  begin
    if Trim(edtSURNAME.Text + ' ' + edtFIRSTNAME.Text + ' ' + edtMIDLENAME.Text) <> '' then
      s := ReplaceStr(s, rsFldApplicantName, Trim(edtSURNAME.Text + ' ' + edtFIRSTNAME.Text + ' ' + edtMIDLENAME.Text));
  end;
  if (FCustomerInfo.cust_code <> '') then
    s := ReplaceStr(s, rsFldCodeAbonent, FCustomerInfo.cust_code);
  if (dmMain.UserFIO <> '') then
    s := ReplaceStr(s, rsFldOperator, dmMain.UserFIO);
  s := ReplaceStr(s, rsFldCurrentDate, FormatDateTime('dd.mm.yyyy', NOW()));
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

  if pnlSrv.Visible then
  begin
    if not lcbService.Text.IsEmpty then
      s := ReplaceStr(s, rsFldFileSrv, lcbService.Text);
    if not lcbOnOffSrv.Text.IsEmpty then
      s := ReplaceStr(s, rsFldFileOnOffSrv, lcbOnOffSrv.Text);
    if not VarIsNull(edDate.value) then
      s := ReplaceStr(s, rsFldFileDate, edDate.Text);
  end;

  if pnlPeriod.Visible then
  begin
    if (not VarIsNull(edPBegin.value)) then
      s := ReplaceStr(s, '[ДАТА_Н]', FormatDateTime('dd.mm.yyyy', edPBegin.value));
    if (not VarIsNull(edPEnd.value)) then
      s := ReplaceStr(s, '[ДАТА_О]', FormatDateTime('dd.mm.yyyy', edPEnd.value));
  end;

  if pnlBidPay.Visible then
  begin
    s := ReplaceStr(s, '[ИСПОЛН]', FWorker);
    if (ednBid.Text <> '') then
      s := ReplaceStr(s, rsBidN, ednBid.Text);

    if ednBidSum.Visible then
    begin
      sum := 0;
      if not ednCheckSum.Text.IsEmpty then
      begin
        s := ReplaceStr(s, rsFldPAYMENT, FloatToStr(ednCheckSum.value));
        sum := ednCheckSum.value;
      end;
      if not ednBidSum.Text.IsEmpty then
      begin
        s := ReplaceStr(s, '[СУММА_ЗАЯВКИ]', FloatToStr(ednBidSum.value));
        sum := sum - ednBidSum.value;
      end;
      if not ednFineSum.Text.IsEmpty then
        sum := sum - ednFineSum.value;
      s := ReplaceStr(s, '[СУММА_ОСТАТОК]', FloatToStr(Round(sum * 100) / 100));
    end;
  end;

  if pnlAdr.Visible then
  begin
    own := FCustomerInfo.STREET + ' ' + FCustomerInfo.HOUSE_no + ' ' + FCustomerInfo.FLAT_NO;
    if (own.Trim <> '') then
      s := ReplaceStr(s, rsAddress, own);
    own := lcbStreets.Text + ' ' + lcbHOUSE.Text + ' ' + lcbFLAT.Text;
    if (own.Trim <> '') then
      s := ReplaceStr(s, rsNewAddress, own);
  end;

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

  result := s;
end;

function TEditCFileForm.ParseCaptured(const _scanName: string; scResult: TStringList): Boolean;
var
  start: TStartupInfo;
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
    result := False;
    Exit;
  end;
  _cmdLine := _scanName + ' ' + _cmdLine;

  TmpFile := _scanName + '.tmp';

  result := False;
  try
    { Set a temporary file }

    FillChar(tmpSec, SizeOf(tmpSec), #0);
    tmpSec.nLength := SizeOf(tmpSec);
    tmpSec.bInheritHandle := true;
    tmp := CreateFile(PChar(TmpFile), Generic_Write, File_Share_Write, @tmpSec, Create_Always,
      File_Attribute_Normal, 0);
    try
      FillChar(start, SizeOf(start), #0);
      start.cb := SizeOf(start);
      start.hStdOutput := tmp;
      start.dwFlags := StartF_UseStdHandles or StartF_UseShowWindow;
      start.wShowWindow := SW_Minimize;
      { Start the program }
      if CreateProcess(nil, PChar(_exeName + ' ' + _cmdLine), nil, nil, true, 0, nil, PChar(vdirName), start, procInfo)
      then
      begin
        SetPriorityClass(procInfo.hProcess, Idle_Priority_Class);
        WaitForSingleObject(procInfo.hProcess, Infinite);
        GetExitCodeProcess(procInfo.hProcess, return);
        result := (return = 0);
        CloseHandle(procInfo.hThread);
        CloseHandle(procInfo.hProcess);
        CloseHandle(tmp);
        { Add the output }
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

procedure TEditCFileForm.TextToFileds(scResult: TStringList);
var
  s: string;
  i: Integer;
  r: TStringArray;
  fs: TFormatSettings;
  pn: String;
  ps: String;
  p_RO: String;
  P_RD: String;
  d: TDate;
begin
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
        try
          d := StrToDate(s, fs);
          edtBIRTHDAY.value := d;
        except
          try
            edtBIRTHDAY.Text := s;
          except
            //
          end;
        end;
      end
      else if s = 'birthplace' then
        edtPlaceBirth.Text := Trim(r[1])
      else if s = 'series' then
      begin
        ps := Trim(r[1]);
      end
      else if s = 'number' then
      begin
        pn := Trim(r[1]);
      end
      else if s = 'authority' then
        p_RO := Trim(r[1])
      else if s = 'issue_date' then
      begin
        s := Trim(r[1]);
        try
          d := StrToDate(s, fs);
          P_RD := dateToStr(d, fs);
          edtDOCDATE.value := P_RD;
        except
          try
            edtDOCDATE.Text := s;
          except
            //
          end;
        end;
      end

    end;
  end;

  if not(ps.IsEmpty and pn.IsEmpty) then
  begin
    edtPASSPORT.Text := Trim(ps + ' ' + pn);
  end;

  edtRegistration.Text := Trim(p_RO);
end;

procedure TEditCFileForm.btnOcrClick(Sender: TObject);
var
  scResult: TStringList;
  FileName: String;
  cr: TCursor;
begin
  FileName := edtFILE.Hint;
  if (not edtFILE.Text.IsEmpty) and (not FileName.IsEmpty) then
  begin
    scResult := TStringList.Create;
    cr := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    try
      if ParseCaptured(FileName, scResult) then
        TextToFileds(scResult);
    finally
      FreeAndNil(scResult);
      Screen.Cursor := cr;
    end;
  end;
end;

procedure TEditCFileForm.btnOkClick(Sender: TObject);
var
  errors: Boolean;
  cs: string;
begin
  errors := False;
  if (dbluFileType.Text = '') then
  begin
    errors := true;
    CnErrors.SetError(dbluFileType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(dbluFileType);

  if (edtNAME.Text = '') then
  begin
    errors := true;
    CnErrors.SetError(edtNAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtNAME);

  if (edtFILE.Text = '') then
  begin
    errors := true;
    CnErrors.SetError(edtFILE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtFILE);

  if dsCustFile.State = dsInsert then
  begin
    if (pnlPassport.Visible) and (edtPASSPORT.Text = '') then
    begin
      errors := true;
      CnErrors.SetError(edtPASSPORT, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtPASSPORT);

    if (pnlContract.Visible) then
    begin
      if (chkContract.State = cbGrayed) then
      begin
        errors := true;
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
          errors := true;
          CnErrors.SetError(edtContract, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
        end
        else
          CnErrors.Dispose(edtContract);

        if (VarIsNull(edtContractDate.value)) then
        begin
          errors := true;
          CnErrors.SetError(edtContractDate, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
        end
        else
          CnErrors.Dispose(edtContractDate);
      end;

      if (pnlMobile.Visible) then
      begin
        if HasErrorInPhone then
          errors := true;
      end;
    end;

    if (pnlBidPay.Visible) then
    begin
      if ednBid.Visible and ednBid.Text.IsEmpty then
      begin
        errors := true;
        CnErrors.SetError(ednBid, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(ednBid);

      if ednBid.Visible and ednBidSum.Text.IsEmpty then
      begin
        errors := true;
        CnErrors.SetError(ednBidSum, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(ednBidSum);

      if ednCheckSum.Text.IsEmpty then
      begin
        errors := true;
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
        errors := true;
        CnErrors.SetError(edtTskName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(edtTskName);

      if edTskDate.Text.IsEmpty then
      begin
        errors := true;
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
      if edPBegin.Text.IsEmpty then
      begin
        errors := true;
        CnErrors.SetError(edPBegin, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(edPBegin);

      if edPEnd.Text.IsEmpty then
      begin
        errors := true;
        CnErrors.SetError(edPEnd, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(edPEnd);
    end
    else
    begin
      CnErrors.Dispose(edPBegin);
      CnErrors.Dispose(edPEnd);
    end;

    if (FShowFlatOwner and (pnlContract.Visible) and (chkFOwner.State = cbGrayed)) then
    begin
      errors := true;
      CnErrors.SetError(chkFOwner, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(chkFOwner);

    errors := CheckPasport(errors);
    errors := CheckAddons(errors);
  end; // Only for Insert

  if not errors then
  begin
    ModalResult := mrOk
  end
  else
    ModalResult := mrNone;
end;

procedure TEditCFileForm.btnScanerClick(Sender: TObject);
var
  FileName: String;
  fext: string;
  NeedSave: Boolean;
begin
  FileName := ScanDocument(False, NeedSave);
  if not FileName.IsEmpty then
  begin
    // FileForSave := FileName;
    // edtFILE.Text := ExtractFileName(ChangeFileExt(FileName, '.jpg'));
    fext := ExtractFileExt(FileName);
    if fext.Contains('tmp') then
    begin
      RenameFile(FileName, ChangeFileExt(FileName, '.jpg'));
      FileName := ChangeFileExt(FileName, '.jpg');
    end;
    SetFile(FileName);
    // edtFILE.ReadOnly := False;
    FNeedDelete := true;
  end;
end;

procedure TEditCFileForm.dbluFileTypeChange(Sender: TObject);
begin
  if (dsCustFile.State = dsInsert) then
  begin
    ShowAddons;
    UpdateNotice;
  end;
end;

procedure TEditCFileForm.dbluFileTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsFiles.Active) and (not dsFiles.FieldByName('O_DIMENSION').IsNull) then
    Background := StringToColor(dsFiles['O_DIMENSION'])
  else
    Background := clWindow;
end;

procedure TEditCFileForm.dbluFileTypeExit(Sender: TObject);
var
  pn: string;
begin
  pn := dbluFileType.Text.ToUpper;
  if (pn.Contains('ОТКЛ') or pn.Contains('СМЕН')) then
    CheckPromo;
end;

procedure TEditCFileForm.edDateChange(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.ednBidExit(Sender: TObject);
begin
  SetInfoFromRequest;
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
  if dlgOpen.Execute then
  begin
    FileForSave := dlgOpen.FileName;
    btnScaner.TabStop := False;
  end
  else
    btnScaner.TabStop := true;

  Handled := true;
end;

procedure TEditCFileForm.edtFILEEditButtons1Click(Sender: TObject; var Handled: Boolean);
begin
  ShowFile;
  Handled := true;
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
begin
  FHandNameInput := edtNAME.Text;
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
  (Sender as TDBEditEh).Text := Trim(s);

  if FOldNumber = (Sender as TDBEditEh).Text then
    Exit;

  if CheckControlText((Sender as TDBEditEh), dmMain.GetSettingsValue('REG_PASSN')) then
    CheckInBlackList((Sender as TDBEditEh), 1);

  FindSamePassport;
  UpdateNotice;
end;

procedure TEditCFileForm.edtSURNAMEChange(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.FormCreate(Sender: TObject);
var
  s: string;
begin
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
end;

procedure TEditCFileForm.FormDestroy(Sender: TObject);
begin
  if FNeedDelete and (not FFileForSave.IsEmpty) and FileExists(FFileForSave) then
    DeleteFile(FFileForSave);

  if dsOnOffService.Active then
    dsOnOffService.Close;
  if dsService.Active then
    dsService.Close;
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
begin
  FFileForSave := value;
  if not value.IsEmpty then
  begin
    s := ExtractFileExt(FFileForSave);

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
  end;
end;

function TEditCFileForm.GetFile: String;
begin
  result := FFileForSave;
end;

procedure TEditCFileForm.lcbFLATExit(Sender: TObject);
var
  CID: Integer;
  oldOwner: Integer;
begin
  if pnlSrv.Visible then
  begin
    if dsOnOffService.Active then
      dsOnOffService.Close;
    if dsService.Active then
      dsService.Close;
    CID := GetCustomerByAddress(oldOwner);
    if CID > 0 then
    begin
      dsService.ParamByName('CUSTOMER_ID').AsInteger := CID;
      dsOnOffService.ParamByName('customer_id').AsInteger := CID;
      // if FIsOff = 1 then begin
      dsService.ParamByName('state').AsInteger := FIsOff;
      dsOnOffService.ParamByName('off').AsInteger := FIsOff;

      if ((FIsOff = 1) and (FCustomerInfo.Debt_sum > 0)) then
      begin
        if (FIsLTV) then
          dsOnOffService.ParamByName('debt').AsString := 's.Name Like ''%неуп%'''
      end
      else
        dsOnOffService.ParamByName('debt').AsString := '1=1';
      // end
      // else begin
      // dsService.ParamByName('state').AsInteger := 1;
      // dsOnOffService.ParamByName('off').AsInteger := 1;
      // end;
      dsService.Open;
      dsOnOffService.Open;
    end;
  end;
end;

procedure TEditCFileForm.lcbOnOffSrvChange(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.lcbServiceChange(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.ShowAddons;
var
  ItsJson: Boolean;
  WindowLocked: Boolean;
  s: string;
begin
  WindowLocked := LockWindowUpdate(Self.Handle);
  try
    memNotice.ReadOnly := False;
    ItsJson := (CustomerInfo.CUSTOMER_ID > 0);
    ItsJson := ItsJson and (not dsFiles.FieldByName('O_CHARFIELD').IsNull);
    pnlContract.Visible := ItsJson and FNewContract;
    pnlClient.Visible := pnlContract.Visible;

    pnlSrv.Visible := False;
    pnlPassport.Visible := False;
    pnlDoc.Visible := False;
    pnlMobile.Visible := False;
    pnlTask.Visible := False;
    pnlPeriod.Visible := False;
    pnlBidPay.Visible := False;
    pnlAdr.Visible := False;
    pnlText.Visible := False;
    ednBid.Visible := False;
    ednBidSum.Visible := False;
    ednCheckSum.Visible := False;
    ednFineSum.Visible := False;

    edtText.Text := '';
    edtText.EmptyDataInfo.Text := '';

    dsService.Active := False;
    dsOnOffService.Active := False;
    dsStreets.Active := False;
    dsHomes.Active := False;
    dsFLAT.Active := False;

    FNameFmt := '';

    FSingleSrv := -1;
    FSinglSrvOnOff := -1;
    FReqType := -1;
    FReqTempl := -1;
    FOpenInet := False;
    FNeedSrv := False;

    if ItsJson then
    begin
      ShowControlsJson(dsFiles['O_CHARFIELD']);
    end;
    pnlClient.Visible := true;

    edtNAME.EmptyDataInfo.Text := 'Наименование / номер документа ' + FNameFmt;

    dsStreets.Active := pnlAdr.Visible;
    dsHomes.Active := pnlAdr.Visible;
    dsFLAT.Active := pnlAdr.Visible;

    dsService.Active := (pnlSrv.Visible and (not pnlAdr.Visible));
    dsOnOffService.Active := (pnlSrv.Visible and (not pnlAdr.Visible));

    s := dbluFileType.Text.ToUpper;
    if (s.Contains('ПЕРЕОФОРМЛЕНИЕ ДОГОВОРА')) then
    begin
      edtText.Text := GetSrvList;
      edtText.EmptyDataInfo.Text := GetSrvList;
    end;

    //if chkFOwner.Visible then
    //  chkFOwner.Enabled := (not FIsLTV) or s.Contains('ПАСПОРТ') or s.Contains('СОБСТВЕННОСТЬ');
  finally
    if WindowLocked then
      LockWindowUpdate(0);
  end;
end;

procedure TEditCFileForm.ShowControlsJson(const json: String);
var
  JO: TJsonObject;
  srv_state: Integer;
  ShowPnl: Boolean;
  tPosition: Integer;
  s: string;
begin
  srv_state := -1;
  tPosition := 1000; // pnlTop.Top + pnlTop.Height + 1;

  JO := TJsonObject.Parse(json) as TJsonObject;
  try
    if JO.Contains('OnOff') then
    begin
      ShowPnl := true;

      if not JO['OnOff'].IsNull then
        srv_state := JO.i['OnOff'];

      case srv_state of
        0:
          lblOnOff.Caption := rsOff;
        1:
          lblOnOff.Caption := rsOn;
      else
        begin
          lblOnOff.Caption := '????';
          ShowPnl := False;
        end;
      end;
      pnlSrv.Visible := ShowPnl;

      if (ShowPnl and (dmMain.GetIniValue('SET_AS_CURRENT_DATE') <> '0')) then
        edDate.value := NOW;
    end;

    if JO.Contains('SrvType') then
    begin
      FNeedSrv := true;
      if not JO['SrvType'].IsNull then
      begin
        dsService.ParamByName('CUSTOMER_ID').AsInteger := CustomerInfo.CUSTOMER_ID;
        dsService.ParamByName('srv_type').AsInteger := JO.i['SrvType'];
        dsService.ParamByName('state').AsInteger := srv_state;
        dsOnOffService.ParamByName('customer_id').AsInteger := CustomerInfo.CUSTOMER_ID;
        if srv_state = 1 then
          FIsOff := 0
        else
          FIsOff := 1;
        dsOnOffService.ParamByName('off').AsInteger := FIsOff;
        if ((FIsOff = 1) and (FCustomerInfo.Debt_sum > 0)) then
        begin
          if (FIsLTV) then
            dsOnOffService.ParamByName('debt').AsString := 'upper(s.Name) Like ''%НЕУП%'''
        end
        else
          dsOnOffService.ParamByName('debt').AsString := '1=1';
      end;
    end;

    if JO.Contains('OpenInet') then
      FOpenInet := JO.B['OpenInet'];

    if JO.Contains('SSrv') then
      FSingleSrv := JO.i['SSrv'];
    if JO.Contains('SrvOnOff') then
    begin
      lcbOnOffSrv.Enabled := (not JO['SrvOnOff'].IsNull);
      if not JO['SrvOnOff'].IsNull then
      begin
        lcbOnOffSrv.value := JO['SrvOnOff'];
        FSinglSrvOnOff := lcbOnOffSrv.value;
      end;
    end;

    if JO.Contains('ReqType') then
    begin
      if not JO['ReqType'].IsNull then
        FReqType := JO.i['ReqType'];
    end;

    if JO.Contains('ReqTempl') then
    begin
      if not JO['ReqTempl'].IsNull then
        FReqTempl := JO.i['ReqTempl'];
    end;

    if JO.Contains('Psprt') then
    begin
      if not JO['Psprt'].IsNull then
        pnlPassport.Visible := JO.B['Psprt'];

      if JO.Contains('Card') then
      begin
        if not JO['Card'].IsNull then
          pnlDoc.Visible := JO.B['Card'];
      end;
    end;

    if JO.Contains('Mobile') then
    begin
      if not JO['Mobile'].IsNull then
        pnlMobile.Visible := JO.B['Mobile'];
    end;

    if JO.Contains('Txt') then
    begin
      if not JO['Txt'].IsNull then
        pnlText.Visible := JO.B['Txt'];
      if JO.Contains('Hint') then
      begin
        if not JO['Hint'].IsNull then
        begin
          s := JO.s['Hint'];
          if s.Contains('|') then
          begin
            edtText.Text := Copy(s, 1, pos('|', s) - 1);
            edtText.EmptyDataInfo.Text := Copy(s, pos('|', s) + 1, length(s));
          end
          else
            edtText.Text := s;
        end;

      end;
    end;

    if JO.Contains('mRO') then
    begin
      if not JO['mRO'].IsNull then
        memNotice.ReadOnly := (JO.B['mRO'] and (not dmMain.AllowedAction(rght_Customer_full)));
    end;

    if JO.Contains('Nfmt') then
    begin
      if not JO['Nfmt'].IsNull then
        FNameFmt := JO.s['Nfmt'];
    end;

    if JO.Contains('Bid') then
    begin
      if not JO['Bid'].IsNull then
        ednBid.Visible := JO.B['Bid'];
    end;

    if JO.Contains('Pay') then
    begin
      if not JO['Pay'].IsNull then
      begin
        ednBidSum.Visible := ednBid.Visible and JO.B['Pay'];
        ednCheckSum.Visible := JO.B['Pay'];
        ednFineSum.Visible := (JO.B['Pay'] and (dmMain.GetSettingsValue('SHOW_FINE') = '1'));
      end;
    end;

    if JO.Contains('Adr') then
    begin
      if not JO['Adr'].IsNull then
        pnlAdr.Visible := JO.B['Adr'];
    end;

    if JO.Contains('Tsk') then
    begin
      if not JO['Tsk'].IsNull then
        pnlTask.Visible := JO.B['Tsk'];
    end;

    if JO.Contains('Prd') then
    begin
      if not JO['Prd'].IsNull then
        pnlPeriod.Visible := JO.B['Prd'];
    end;

    lblBP.Visible := ednBid.Visible;
    pnlBidPay.Visible := ednBid.Visible or ednCheckSum.Visible;

    if pnlPassport.Visible then
      pnlPassport.Top := tPosition;
    if pnlContract.Visible then
      pnlContract.Top := tPosition;
    if pnlAdr.Visible then
      pnlAdr.Top := tPosition;
    if pnlSrv.Visible then
      pnlSrv.Top := tPosition;
    if pnlDoc.Visible then
      pnlDoc.Top := tPosition;
    if pnlBidPay.Visible then
      pnlBidPay.Top := tPosition;
    if pnlTask.Visible then
      pnlTask.Top := tPosition;
    if pnlPeriod.Visible then
      pnlPeriod.Top := tPosition;
    if pnlMobile.Visible then
      pnlMobile.Top := tPosition;
    if pnlText.Visible then
      pnlText.Top := tPosition;

    // если имя заполняем автоматом, то опустим поле вниз
    if (not FNameFmt.IsEmpty) then
    begin
      pnlName.Top := tPosition;
      pnlName.TabOrder := pnlNotice.TabOrder - 1;
    end;

  finally
    JO.Free;
  end;
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
    if (not dsFiles.FieldByName('O_DESCRIPTION').IsNull) then
    begin
      s := FieldsToStr(dsFiles['O_DESCRIPTION']);
      memNotice.Lines.Text := s;
    end;
  end;
end;

function TEditCFileForm.CheckAddons(const errors: Boolean): Boolean;
var
  s: string;
begin
  result := errors;
  if pnlSrv.Visible then
  begin
    if FNeedSrv then
    begin
      if (lcbService.Text = '') then
      begin
        result := true;
        CnErrors.SetError(lcbService, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(lcbService);

      if (lcbOnOffSrv.Text = '') then
      begin
        result := true;
        CnErrors.SetError(lcbOnOffSrv, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
      begin
        if ((FSinglSrvOnOff > -1) and (FSinglSrvOnOff <> lcbOnOffSrv.value)) then
        begin
          result := true;
          CnErrors.SetError(lcbOnOffSrv, rsNotAllowedService, iaMiddleLeft, bsNeverBlink);
        end
        else
          CnErrors.Dispose(lcbOnOffSrv);
      end;

      if (VarIsNull(edDate.value)) then
      begin
        result := true;
        CnErrors.SetError(edDate, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
      begin
        if (not FFullAccess) and (FIsOff = 1) and (VarToDateTime(edDate.value) < (Date() + 1)) then
        begin
          result := true;
          CnErrors.SetError(edDate, rsPastDateIncorrect, iaMiddleLeft, bsNeverBlink);
        end
        else
        begin
          // прверим даты подключения
          if (FOnlyToday and (VarToDateTime(edDate.value) < Date())) then
          begin
            result := true;
            CnErrors.SetError(edDate, rsPastDateIncorrect, iaMiddleLeft, bsNeverBlink);
          end
          else
          begin
            if (((dmMain.InStrictMode) or (not(FFullAccess or FChangeHistory))) and
              (VarToDateTime(edDate.value) < dmMain.CurrentMonth)) then
            begin
              result := true;
              CnErrors.SetError(edDate, rsPastDateIncorrect, iaMiddleLeft, bsNeverBlink);
            end
            else
              CnErrors.Dispose(edDate);
          end;
        end;
      end;
      if not CheckEnoughMoney then
      begin
        result := true;
        CnErrors.SetError(edDate, rsEnoughMoneyDateIncorrect, iaMiddleLeft, bsNeverBlink);
      end;
    end
    else
    begin
      CnErrors.Dispose(lcbService);
      CnErrors.Dispose(edDate);
      CnErrors.Dispose(lcbOnOffSrv);
    end;
  end;

  CnErrors.Dispose(edPBegin);
  if pnlPeriod.Visible then
  begin
    s := CheckBlockDays;
    if s <> '' then
    begin
      result := true;
      CnErrors.SetError(edPBegin, s, iaMiddleLeft, bsNeverBlink);
    end;
  end;
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
      edtContractDate.value := NOW();
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

  if FContract.IsEmpty then
    CheckAndGenContract
  else
    SetContract;

  UpdateNotice;
end;

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

procedure TEditCFileForm.ExecuteAddons;
var
  d: TDate;
  NewCustomer: Integer;
  s, rs, os: String;
  oldOwner: Integer;
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
  // переоформление договора
  Renegotiation();

  if FOpenInet then
  begin
    EditBillInfo(-1, CustomerInfo.CUSTOMER_ID, CustomerInfo.Account_No, memNotice.Lines.Text, False);
    SetPasswordIfEmpty();
  end;

  if (FSingleSrv > -1) then
    AddSingleSrv;

  if FReqType > -1 then
  begin
    if not VarIsNull(edDate.value) then
      d := edDate.value
    else
      d := NOW();

    NewFileRequest(CustomerInfo.CUSTOMER_ID, FReqType, FReqTempl, d, memNotice.Lines.Text, False);
    if pnlAdr.Visible and (NewCustomer > 0) then
    begin
      if FIsLTV then
      begin
        case FReqTempl of
          126631: // 214 Отключить от И-нет. Переезд на адрес -
            FReqTempl := 126629;
          126629: // 214	Подключить к И-нет. Переезд с адреса -
            FReqTempl := 126631;
          126628: // 101	Подключить к СТВ. Переезд с Адреса -
            FReqTempl := 126630;
          126630: // 101	Отключить от СТВ. Переезд на Адрес -
            FReqTempl := 126628;
        end;
      end;

      s := memNotice.Lines.Text;
      if FShowFlatOwner then
      begin
        GetCustomerByAddress(oldOwner);
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
end;

function TEditCFileForm.CheckControlText(const Contrl: TDBEditEh; const regexp: String): Boolean;
begin
  result := true;
  if (Contrl.Text.IsEmpty or regexp.IsEmpty) then
    Exit;

  result := TRegEx.IsMatch(Contrl.Text, '^' + regexp + '$');
  if (not result) then
    CnErrors.SetError(Contrl, rsInputIncorrect + ' ' + regexp, iaMiddleLeft, bsNeverBlink)
  else
    CnErrors.Dispose(Contrl);
end;

function TEditCFileForm.CheckInBlackList(const Sender: TDBEditEh; const NT: Integer = 0): Boolean;
var
  s, n: string;
begin
  result := true;

  if (Sender.Text = '') then
  begin
    Exit;
  end;

  s := '';
  n := Trim(Sender.Text);

  Query.SQL.Clear;
  Query.SQL.Add('select o.O_Name, o.O_Description, o.O_Charfield');
  Query.SQL.Add('from objects o where o.O_Type = 31 ');
  Query.SQL.Add(' and upper(replace(replace(o.O_Name, '' '', ''''), ''№'', '''')) ');
  Query.SQL.Add('     = upper(replace(replace(cast(:PN as VARCHAR(500)), '' '', ''''), ''№'', ''''))');
  Query.ParamByName('PN').AsString := n;
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

  result := s.IsEmpty;

  // btnOk.Enabled := (s.IsEmpty) or dmMain.AllowedAction(rght_Customer_full);
  if (not result) then
  begin
    CnErrors.Dispose(Sender);
    CnErrors.SetError(Sender, rsCustomerInBlackList + #13#10 + s, iaMiddleLeft, bsNeverBlink);
    ShowMessage(rsCustomerInBlackList + #13#10 + s);
  end;
end;

procedure TEditCFileForm.FindSamePassport;
var
  s, n: string;
  ft: Integer;
  FullInfo: Boolean;
  TmpFile: string;
begin
  FOwnerOldState := 0;
  n := Trim(edtPASSPORT.Text);
  if n.IsEmpty then
    Exit;

  FullInfo := pnlDoc.Visible;

  s := '';
  Query.SQL.Clear;

  chkFOwner.Checked := False;
  FOwnerOldState := -1;

  if (dmMain.GetSettingsValue('SHOW_DOC_LIST') = '1') then
  begin
    Query.SQL.Add('select first 1 d.Surname, d.Firstname, d.Midlename');
    Query.SQL.Add(', d.Doc_Reg, d.Birthday, d.Addr_Registr, d.Addr_Birth, d.Doc_Date');
    if FShowFlatOwner then
    begin
      Query.SQL.Add
        (', coalesce((select f.Owner_Doc from Houseflats f where f.House_Id = :House_Id and f.Flat_No = :Flat_No), '''') OWN_DOC');
    end;
    Query.SQL.Add('from DOC_LIST d ');
    Query.SQL.Add('where d.Doc_Number = :PN and d.Doc_Type = 1');
    Query.SQL.Add('UNION ALL');
  end;
  Query.SQL.Add('select first 1 c.Surname, c.Firstname, c.Midlename');
  Query.SQL.Add(', c.Passport_Registration Doc_Reg, c.Birthday, c.ADRES_REGISTR Addr_Registr');
  Query.SQL.Add(', c.CONTRACT_BASIS Addr_Birth, null Doc_Date');
  if FShowFlatOwner then
  begin
    Query.SQL.Add
      (', coalesce((select f.Owner_Doc from Houseflats f where f.House_Id = :House_Id and f.Flat_No = :Flat_No), '''') OWN_DOC');
  end;
  Query.SQL.Add('from customer c where c.Passport_Number = :PN');

  Query.ParamByName('PN').AsString := n;
  if FShowFlatOwner then
  begin
    Query.ParamByName('House_Id').AsInteger := FCustomerInfo.HOUSE_ID;
    Query.ParamByName('Flat_No').AsString := FCustomerInfo.FLAT_NO;
  end;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if not(Query.FN('Surname').IsNull) then
    s := Query.FN('Surname').AsString;

  edtSURNAME.Text := s;
  if not(Query.FN('Firstname').IsNull) then
    edtFIRSTNAME.Text := Query.FN('Firstname').AsString;
  if not(Query.FN('Midlename').IsNull) then
    edtMIDLENAME.Text := Query.FN('Midlename').AsString;

  if (FShowFlatOwner and (not(Query.FN('OWN_DOC').IsNull))) then
  begin
    if Query.FN('OWN_DOC').AsString <> '' then
    begin
      chkFOwner.Checked := (Query.FN('OWN_DOC').AsString = n);
      if chkFOwner.Checked then
        FOwnerOldState := 1
      else
        FOwnerOldState := -1;
    end;
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

  if (edtFILE.Text.IsEmpty) and (dmMain.GetSettingsValue('SHOW_DOC_LIST') = '1') then
  begin
    ft := -1;
    if dbluFileType.Text.ToUpper.Contains('ПАСПОРТ - ФОТО') then
      ft := 47675
    else if dbluFileType.Text.ToUpper.Contains('ПРОПИСКА') then
      ft := 50378;

    if ((ft > 0) and (n <> '')) then
    begin
      Query.SQL.Clear;
      Query.SQL.Add('select first 1 cf.Filename, cf.Content from Customer_Files cf');
      Query.SQL.Add('where not cf.Filename is null and not cf.Content is null ');
      Query.SQL.Add(' and cf.Cf_Type = :ft and cf.Name like :pn');
      Query.SQL.Add('order by cf.added_on desc');
      Query.ParamByName('ft').AsInteger := ft;
      Query.ParamByName('pn').AsString := '%' + n + '%';
      Query.Transaction.StartTransaction;
      Query.ExecQuery;
      if not Query.FN('Filename').IsNull then
      begin
        TmpFile := GetTempDir() + Query.FN('Filename').AsString;
        Query.FieldByName('CONTENT').SaveToFile(TmpFile);
        SetFile(TmpFile);
        FNeedDelete := true;
      end;
      Query.Transaction.Commit;
      Query.Close;
    end;
  end;

  if s.IsEmpty then
  begin
    CnErrors.Dispose(edtPASSPORT);
    CnErrors.SetError(edtPASSPORT, rsNeedPassportCheck, iaMiddleLeft).IconType := EP_INFO2;
  end;
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

  if NOT s.IsEmpty then
    s := '{' + s.TrimRight([',']) + '}';

  result := s;
end;

procedure TEditCFileForm.SaveDocument(const FileID: Integer);
var
  pn: string;
  nf: Boolean;
begin
  if (dmMain.GetSettingsValue('SHOW_DOC_LIST') <> '1') then
    Exit;

  pn := dbluFileType.Text.ToUpper;
  nf := pn.Contains('ПАСПОРТ - ФОТО');

  if (not pnlDoc.Visible) or (not pnlPassport.Visible) then
    Exit;

  pn := edtPASSPORT.Text.Trim;
  if pn.IsEmpty then
    Exit;

  if dbluFileType.Text.ToUpper.Contains('НЕУПЛАТА') then
  begin
    ToJudge();
    ToBlackList();
    Exit;
  end;

  Query.Transaction := trWrite;
  Query.SQL.Clear;
  Query.SQL.Add('update or insert into Doc_LIST (Doc_Type, Doc_Number, Doc_Reg, Doc_Date, ' +
    'Birthday, Addr_Registr, Addr_Birth, PERSONAL_N, Surname, Firstname, Midlename' + IfThen(nf, ', Cf_Id', '') + ')');
  Query.SQL.Add('values (:Doc_Type, :Doc_Number, :Doc_Reg, :Doc_Date, ' +
    ':Birthday, :Addr_Registr, :Addr_Birth, :PERSONAL_N, :Surname, :Firstname, :Midlename' + IfThen(nf, ', :Cf_Id',
    '') + ')');
  Query.SQL.Add('matching (Doc_Type, Doc_Number)');

  Query.ParamByName('Doc_Type').AsInteger := 1;
  Query.ParamByName('Doc_Number').AsString := pn;
  if nf then
  begin
    Query.ParamByName('Cf_Id').AsInteger := FileID;
  end;

  Query.ParamByName('Surname').AsString := Trim(edtSURNAME.Text);
  Query.ParamByName('Firstname').AsString := Trim(edtFIRSTNAME.Text);
  Query.ParamByName('Midlename').AsString := Trim(edtMIDLENAME.Text);

  if not edtRegistration.IsEmpty then
    Query.ParamByName('Doc_Reg').AsString := Trim(edtRegistration.Text);

  if not edtADRES_REGISTR.IsEmpty then
    Query.ParamByName('Addr_Registr').AsString := Trim(edtADRES_REGISTR.Text);
  if not VarIsNull(edtDOCDATE.value) then
    Query.ParamByName('Doc_Date').AsDate := edtDOCDATE.value;
  if not VarIsNull(edtBIRTHDAY.value) then
    Query.ParamByName('Birthday').AsDate := edtBIRTHDAY.value;
  if not edtPlaceBirth.IsEmpty then
    Query.ParamByName('Addr_Birth').AsString := Trim(edtPlaceBirth.Text);

  if (pnlMobile.Visible) and (not edtMobile.IsEmpty) then
  begin
    Query.ParamByName('PERSONAL_N').AsString := edtMobile.Text;
  end;

  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
  Query.Close;
end;

procedure TEditCFileForm.SavePhone;
var
  s, pn, phone: string;
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
    pn := edtPASSPORT.Text;
  end
  else
  begin
    s := FCustomerInfo.FIO;
    pn := '';
  end;

  if FShowFlatOwner then
  begin
    if chkFOwner.Checked then
      s := s + '. ' + Format(FOwnerS, [pn])
    else
    begin
      if chkFOwner.State <> cbGrayed then
        s := s + '. ' + Format(FRentS, [pn]);
    end;
  end
  else
    s := s + ' ' + pn;

  phone := edtMobile.Text;
  Query.Transaction := trWrite;
  Query.SQL.Clear;
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
  pn: string;
  nf: Boolean;
begin
  if (dmMain.GetSettingsValue('SHOW_DOC_LIST') <> '1') then
    Exit;

  pn := dbluFileType.Text.ToUpper;
  nf := pn.Contains('ПАСПОРТ - ФОТО');
  if not nf then
    Exit;

  if (not pnlDoc.Visible) or (not pnlPassport.Visible) then
    Exit;

  pn := edtPASSPORT.Text.Trim;
  if pn.IsEmpty then
    Exit;

  if Application.MessageBox('Заменить информацию в карточке абонента?', 'Обновление информации',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
    Exit;

  Query.Transaction := trWrite;
  Query.SQL.Clear;
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
  Query.ParamByName('Passport_Number').AsString := pn;
  if not VarIsNull(edtDOCDATE.value) then
    pn := FormatDateTime('dd.mm.yyyy', edtDOCDATE.value)
  else
    pn := '';
  if not edtRegistration.IsEmpty then
    Query.ParamByName('Passport_Registration').AsString := Trim(pn + ' ' + edtRegistration.Text);
  if not VarIsNull(edtBIRTHDAY.value) then
    Query.ParamByName('Birthday').AsDate := edtBIRTHDAY.value;
  if not edtPlaceBirth.IsEmpty then
    Query.ParamByName('Addr_Birth').AsString := Trim(edtPlaceBirth.Text);
  if not edtADRES_REGISTR.IsEmpty then
    Query.ParamByName('Adres_Registr').AsString := Trim(edtADRES_REGISTR.Text);

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

  result := ce;
end;

function TEditCFileForm.CheckPasport(const errors: Boolean): Boolean;
begin
  result := errors;

  if pnlDoc.Visible then
  begin
    if not CheckControlText(edtPASSPORT, dmMain.GetSettingsValue('REG_PASSN')) then
      result := true;

    if (edtSURNAME.Text = '') then
    begin
      result := true;
      CnErrors.SetError(edtSURNAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtSURNAME);

    if (edtFIRSTNAME.Text = '') then
    begin
      result := true;
      CnErrors.SetError(edtFIRSTNAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtFIRSTNAME);

    if (edtMIDLENAME.Text = '') then
    begin
      result := true;
      CnErrors.SetError(edtMIDLENAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtMIDLENAME);

    if (VarIsNull(edtDOCDATE.value)) then
    begin
      result := true;
      CnErrors.SetError(edtDOCDATE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtDOCDATE);

    if (VarIsNull(edtBIRTHDAY.value)) then
    begin
      result := true;
      CnErrors.SetError(edtBIRTHDAY, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtBIRTHDAY);

    if (edtPlaceBirth.Text = '') then
    begin
      result := true;
      CnErrors.SetError(edtPlaceBirth, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtPlaceBirth);

    if (edtADRES_REGISTR.Text = '') then
    begin
      result := true;
      CnErrors.SetError(edtADRES_REGISTR, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtADRES_REGISTR);
  end;
end;

procedure TEditCFileForm.ShowFile;
var
  FileName: String;
begin
  FileName := edtFILE.Hint;
  if (not edtFILE.Text.IsEmpty) and (not FileName.IsEmpty) then
    ShellExecute(Handle, 'open', PWideChar(FileName), nil, nil, SW_SHOWNORMAL);
end;

procedure TEditCFileForm.SaveFlatOwner(const CID: Integer);
var
  pn: string;
  nf: Boolean;
  s: string;
  ItsOwner: Boolean;
begin
  if (dmMain.GetSettingsValue('SHOW_DOC_LIST') <> '1') then
    Exit;

  pn := dbluFileType.Text.ToUpper;
  nf := pn.Contains('СОБСТВЕННОСТЬ');
  if nf then
  begin
    ItsOwner := true;
  end
  else
  begin
    nf := pn.Contains('ПАСПОРТ');
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

  pn := edtPASSPORT.Text.Trim;
  if pn.IsEmpty then
    Exit;

  s := Trim(edtSURNAME.Text + ' ' + edtFIRSTNAME.Text + ' ' + edtMIDLENAME.Text);

  Query.Transaction := trWrite;
  Query.SQL.Clear;
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
  Query.ParamByName('OWNER_DOC').AsString := pn;
  Query.ParamByName('MOBILE').AsString := edtMobile.Text;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
end;

procedure TEditCFileForm.AddOrOffService;
var
  Save_Cursor: TCursor;
  pn: string;
  addCharge: Boolean;
  vDebt: Double;
begin
  if not pnlSrv.Visible then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;

    pn := dbluFileType.Text.ToUpper;
    addCharge := FIsLTV and pn.Contains('ОТКЛ');

    if FNeedSrv then
    begin
      with TpFIBQuery.Create(Self) do
      begin
        try
          DataBase := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          SQL.Text := 'execute block (';
          SQL.Add('    CUSTOMER_ID UID = :CUSTOMER_ID,');
          SQL.Add('    SERVICE_ID  UID = :SERVICE_ID,');
          SQL.Add('    SET_ON      D_INTEGER = :Set_On,');
          SQL.Add('    SET_DATE    D_DATE = :Set_Date,');
          SQL.Add('    SRV_ON_OFF  type of UID = :Srv_On_Off,');
          SQL.Add('    CONTR_N     D_VARCHAR20 = :CONTR_N,');
          SQL.Add('    CONTR_DATE  D_DATE = :CONTR_DATE,');
          SQL.Add('    NOTICE      varchar(1000) = :NOTICE)');
          SQL.Add('as');
          SQL.Add('declare variable bal D_N15_4;');
          SQL.Add('declare variable tar D_N15_4;');
          SQL.Add('declare variable md D_INTEGER;');
          SQL.Add('declare variable cd D_INTEGER;');
          SQL.Add('begin');
          SQL.Add('  bal = 0;');

          // для ЛТВ: доначисление услуги до полного тарифа
          if (addCharge) then
          begin
            // if (pn.Contains('СТВ.') or pn.Contains('СПД.')) then
            if pn.Contains('СТВ.') then
            begin
              SQL.Add('  select M_Tarif from Get_Tarif_Sum_Customer_Srv(:Customer_Id, :Service_Id, :Set_Date) into :tar;');
              SQL.Add('  tar = coalesce(tar, 0);');
              SQL.Add('  cd = extract(day from Set_Date)-1;');
              SQL.Add('  md = extract(day from Month_Last_Day(Set_Date));');
              SQL.Add('  bal = round(((md-cd)*tar/md) ,2);');
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
          if addCharge then
          begin
            // 942519  'Доначисление СТВ'
            if pn.Contains('СТВ.') then
              SQL.Add('  if (bal>0) then execute procedure Add_Single_Service(:Customer_Id, 942519, :bal, :Set_Date, :notice);');
            // 942520  'Доначисление СПД'
            // if pn.Contains('СПД.') then
            // SQL.Add('  if (bal>0) then execute procedure Add_Single_Service(:Customer_Id, 942520, :bal, :Set_Date, :notice);');

            // спишем долги АБОНЕНТА если нет услуг
            // 39964 услуга "остаток"
            SQL.Add('bal = null;');
            SQL.Add('select c.Debt_Sum from customer c where c.Customer_Id = :Customer_Id');
            SQL.Add(' and (not exists(select ss.Subscr_Serv_Id from Subscr_Serv ss');
            SQL.Add('      where ss.Customer_Id = c.Customer_Id and ss.State_Sgn = 1 and ss.Serv_Id <> 819519)) into :bal;');
            SQL.Add('if (coalesce(bal,0) < 0) then execute procedure Add_Single_Service(:Customer_Id, 39964, (-1*:bal), :Set_Date, :notice);');
            // если долг, то подготовка документов в суд
            // 473760 услуга "документов в суд"
            SQL.Add('else if (coalesce(bal,0) > 0) then execute procedure IBE$toJUDGE(:Customer_Id, :notice, 1);');
          end;

          SQL.Add('end');

          ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
          ParamByName('Service_Id').AsInteger := lcbService.value;
          if FIsOff = 1 then
            ParamByName('Set_On').AsInteger := 0
          else
            ParamByName('Set_On').AsInteger := 1;
          ParamByName('Set_Date').AsDate := edDate.value;
          ParamByName('Srv_On_Off').AsInteger := lcbOnOffSrv.value;
          ParamByName('notice').AsString := Trim(memNotice.Lines.Text);
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
begin
  result := -1;

  if not pnlSrv.Visible then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    if FNeedSrv then
    begin
      result := GetCustomerByAddress(oldOwner);
      if result > 0 then
      begin
        with TpFIBQuery.Create(Self) do
        begin
          try
            DataBase := dmMain.dbTV;
            Transaction := dmMain.trWriteQ;
            SQL.Text := 'execute block (';
            SQL.Add('  CUSTOMER_ID    D_INTEGER = :CUSTOMER_ID,');
            SQL.Add('  OLD_CUSTOMER_ID    D_INTEGER = :OLD_CUSTOMER_ID,');
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
            SQL.Add('  CF_ID       D_INTEGER = :CF_ID)');
            SQL.Add('as');
            SQL.Add('declare variable old_own integer;');
            SQL.Add('declare variable NCF integer;');
            SQL.Add('declare variable bal D_N15_4;');
            SQL.Add('declare variable tar D_N15_4;');
            SQL.Add('declare variable srA integer;');
            SQL.Add('declare variable md D_INTEGER;');
            SQL.Add('declare variable cd D_INTEGER;');
            SQL.Add('begin');
            SQL.Add('  bal = 0;');
            SQL.Add('  FRentS = coalesce(FRentS, ''''); FOwnerS = coalesce(FOwnerS, '''');');
            SQL.Add('  if (not CONTR_N is null) then begin');
            SQL.Add('    CONTR_DATE = coalesce(CONTR_DATE, SET_DATE);');
            SQL.Add('  end');
            SQL.Add('  if (not OLD_CUSTOMER_ID is null) then begin');

            // для ЛТВ: доначисление услуги до полного тарифа
            if (FIsLTV) then
            begin
              SQL.Add('  select M_Tarif from Get_Tarif_Sum_Customer_Srv(:OLD_Customer_Id, :Service_Id, :Set_Date) into :tar;');
              SQL.Add('  tar = coalesce(tar, 0);');
              SQL.Add('  cd = extract(day from Set_Date)-1;');
              SQL.Add('  md = extract(day from Month_Last_Day(Set_Date));');
              SQL.Add('  bal = round(((md-cd)*tar/md) ,2);');
            end;

            if FShowFlatOwner then
            begin
              SQL.Add('    select iif(exists(select f.Owner_Doc from Houseflats f where f.House_Id = c.House_Id');
              SQL.Add('           and f.Flat_No = c.Flat_No and f.Owner_Doc = c.Passport_Number), 1, 0) OWNER');
              SQL.Add('    from customer c where c.Customer_Id = :OLD_CUSTOMER_ID');
              SQL.Add('    into :old_own;');
              SQL.Add('    old_own = coalesce(old_own, 0);');
              SQL.Add('    NEW_OWN = coalesce(NEW_OWN, 0);');
              SQL.Add('    if (old_own <> NEW_OWN) then begin');
              SQL.Add('      if (OLD_OWN = 1) then begin');
              SQL.Add('        CONTR_N = replace(CONTR_N, FRentS, FOwnerS);');
              SQL.Add('        notice = replace(notice, FRentS, FOwnerS);');
              SQL.Add('      end');
              SQL.Add('      else begin');
              SQL.Add('        CONTR_N = replace(CONTR_N, FOwnerS, FRentS);');
              SQL.Add('        notice = replace(notice, FOwnerS, FRentS);');
              SQL.Add('      end');
              SQL.Add('    end');
            end;
            SQL.Add('    execute procedure Api_Set_Customer_Service(:OLD_Customer_Id, :Service_Id, :Set_On, :Set_Date, :Srv_On_Off, :CONTR_N, :CONTR_DATE);');
            SQL.Add('    NOTICE = coalesce(NOTICE, '''');');
            SQL.Add('    if (NOTICE <> '''') then begin');
            SQL.Add('      update Subscr_Serv set Notice = :notice where Serv_Id = :Service_Id and Customer_Id = :OLD_Customer_Id;');
            SQL.Add('      update Single_Serv set Notice = :notice where Service_Id = :Srv_On_Off and Customer_Id = :OLD_Customer_Id and Serv_Date = :Set_Date;');
            SQL.Add('    end');

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
            end;

            SQL.Add('    NCF = gen_id(Gen_Operations_Uid, 1);');
            SQL.Add('    insert into Customer_Files (CF_ID, Customer_Id, Name, Cf_Type, Date_From, Date_To, Filename, Notice, Act, Anotice, Content, Addons)');
            SQL.Add('    select :NCF, :OLD_customer_id, Name, Cf_Type, Date_From, Date_To, Filename, Notice, Act, Anotice, Content, Addons');
            SQL.Add('    from Customer_Files where Cf_Id = :Cf_Id;');

            if FShowFlatOwner then
            begin
              SQL.Add('    if (old_own <> NEW_OWN) then begin');
              SQL.Add('      if (OLD_OWN = 1) then');
              SQL.Add('        update Customer_Files set NAME = replace(NAME, :FRentS, :FOwnerS), Notice = replace(Notice, :FRentS, :FOwnerS) where CF_ID = :NCF;');
              SQL.Add('      else');
              SQL.Add('        update Customer_Files set NAME = replace(NAME, :FOwnerS, :FRentS), Notice = replace(Notice, :FOwnerS, :FRentS) where CF_ID = :NCF;');
              SQL.Add('    end');
            end;

            SQL.Add('  end');
            SQL.Add('end');

            ParamByName('CUSTOMER_ID').AsInteger := FCustomerInfo.CUSTOMER_ID;
            ParamByName('OLD_CUSTOMER_ID').AsInteger := result;
            ParamByName('NEW_OWN').AsInteger := 0;
            if chkFOwner.Checked then
              ParamByName('NEW_OWN').AsInteger := 1;
            ParamByName('FOwnerS').AsString := Format(FOwnerS, ['']);
            ParamByName('FRentS').AsString := Format(FRentS, ['']);
            ParamByName('Service_Id').AsInteger := lcbService.value;
            ParamByName('Set_On').AsInteger := 0;
            if FIsOff = 1 then
              ParamByName('Set_On').AsInteger := 1;
            ParamByName('Set_Date').AsDate := edDate.value;
            ParamByName('Srv_On_Off').AsInteger := lcbOnOffSrv.value;
            ParamByName('notice').AsString := Trim(memNotice.Lines.Text);
            ParamByName('CF_ID').AsInteger := dsCustFile.FieldByName('CF_ID').AsInteger;
            if FShowFlatOwner then
              ParamByName('CONTR_N').AsString := edtContract.Text;
            if (pnlContract.Visible) and (chkContract.Checked) then
            begin
              ParamByName('CONTR_N').AsString := edtContract.value;
              if not VarIsNull(edtContractDate.value) then
                ParamByName('CONTR_DATE').AsDate := edtContractDate.value;
            end;
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
  qnt := 1;
  if pnlBidPay.Visible and ednCheckSum.Visible then
  begin
    try
      qnt := ednCheckSum.value;
    except
      qnt := 1;
    end;
  end;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text :=
          'execute procedure Add_Single_Service(:CUSTOMER_ID, :SERVICE_ID, :QNT, CURRENT_DATE, :NOTICE, null);';
        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('Service_Id').AsInteger := FSingleSrv;
        ParamByName('QNT').AsFloat := qnt;
        ParamByName('notice').AsString := Trim(memNotice.Lines.Text);
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
begin
  if (not pnlBidPay.Visible) or (not ednBid.Visible) or ednBid.Text.IsEmpty then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    SRV_SUM := 0;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text := 'execute block (';
        SQL.Add('    RQ_ID    integer = :RQ_ID ,');
        SQL.Add('    CUSTOMER_ID    integer = :CUSTOMER_ID,');
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
        SQL.Add('  execute procedure Add_Payment(:Customer_Id, :BID_SUM, localtimestamp, null, null, :Bsrv_ID, :Notice)');
        SQL.Add('        returning_values :Payment_Id;');
        SQL.Add('  update Request r set r.Receipt = :Payment_Id where r.Rq_Id = :Rq_Id;');
        SQL.Add('  if (SRV_SUM > 0) then begin');
        if FIsLTV then
          SQL.Add('    Bsrv_ID = 422541;')
        else
          SQL.Add('    Bsrv_ID = null;');
        SQL.Add('    execute procedure Add_Payment_Fine(:Customer_Id, :SRV_SUM, current_date, null, null, :Bsrv_ID, :Notice, :FINE_SUM)');
        SQL.Add('        returning_values :Payment_Id;');
        SQL.Add('  end');
        SQL.Add('end');

        // s := SQL.Text; // отладка
        // ParamByName('notice').AsString := s;

        ParamByName('RQ_ID').AsInteger := ednBid.value;
        ParamByName('CUSTOMER_ID').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('notice').AsString := memNotice.Lines.Text;
        if (not ednCheckSum.Text.IsEmpty) and (VarIsNumeric(ednCheckSum.value)) then
        begin
          SRV_SUM := ednCheckSum.value;
        end;
        if (not ednBidSum.Text.IsEmpty) and (VarIsNumeric(ednBidSum.value)) then
        begin
          ParamByName('BID_SUM').AsExtended := ednBidSum.value;
          SRV_SUM := Round((SRV_SUM - ednBidSum.value) * 100) / 100;
        end;
        if (not ednFineSum.Text.IsEmpty) and (VarIsNumeric(ednFineSum.value)) then
        begin
          ParamByName('FINE_SUM').AsExtended := ednFineSum.value;
        end;
        ParamByName('SRV_SUM').AsExtended := SRV_SUM;

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

function TEditCFileForm.GetCustomerByAddress(var oldOwner: Integer): Integer;
begin
  result := -1;
  oldOwner := -1;
  if lcbHOUSE.Text.IsEmpty or lcbFLAT.Text.IsEmpty then
    Exit;

  with TpFIBQuery.Create(Self) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Add('select first 1 Customer_Id');
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
      Transaction.StartTransaction;
      ExecQuery;
      if not FN('CUSTOMER_ID').IsNull then
        result := FN('CUSTOMER_ID').AsInteger;
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
      Transaction := dmMain.trWriteQ;
      SQL.Add('update customer set Secret = :pswd where Customer_Id = :CID and coalesce(SECRET, '''') = ''''');
      ParamByName('CID').AsInteger := CustomerInfo.CUSTOMER_ID;
      ParamByName('pswd').AsString := EncodeBase64(CustomerInfo.Account_No);
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
  pn: string;
begin
  pn := dbluFileType.Text.ToUpper;
  if (not pn.Contains('ПЕРЕОФОРМЛЕНИЕ ДОГОВОРА')) then
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
        Transaction := dmMain.trWriteQ;
        SQL.Text := 'EXECUTE PROCEDURE IBE$RENEGOTIATION(:CUSTOMER_ID, :CONTR_N, :CONTR_DATE, :forSRV, :NOTICE)';
        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('forSRV').AsString := Trim(edtText.Text);
        ParamByName('notice').AsString := Trim(memNotice.Lines.Text);
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

procedure TEditCFileForm.CheckPromo;
var
  alert: Boolean;
begin
  Query.SQL.Clear;
  Query.SQL.Add('select count(*) CNT from subscr_serv s where s.Customer_Id = :CID ');
  Query.SQL.Add('and s.State_Sgn = 1 and s.State_Date > dateadd(year, -1, current_date) ');
  Query.SQL.Add('and s.State_Srv in (57386, 791412, 791414)');
  Query.ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  alert := Query.FN('CNT').AsInteger > 0;
  Query.Transaction.Commit;
  Query.Close;

  if (alert) then
  begin
    ShowMessage(rsPromoWarning);
  end;
end;

procedure TEditCFileForm.ToJudge();
begin
  if not FIsLTV then
    Exit;

  Query.SQL.Clear;
  Query.SQL.Text := 'execute procedure IBE$toJUDGE(:CID, :notice)';

  Query.ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
  Query.ParamByName('notice').AsString := Trim(memNotice.Lines.Text);

  Query.Transaction := trWrite;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
  Query.Close;
end;

procedure TEditCFileForm.ToBlackList();
begin
  Query.SQL.Clear;
  Query.SQL.Add('update or insert into Objects (O_NAME, O_DESCRIPTION, O_CHARFIELD, O_TYPE ) ');
  Query.SQL.Add('VALUES( upper(:O_NAME), :O_DESCRIPTION, :O_CHARFIELD, 31 ) matching (O_NAME, O_Type)');

  Query.ParamByName('O_NAME').AsString := Trim(edtPASSPORT.Text);
  Query.ParamByName('O_DESCRIPTION').AsString :=
    Trim(edtSURNAME.Text + ' ' + edtFIRSTNAME.Text + ' ' + edtMIDLENAME.Text);
  Query.ParamByName('O_CHARFIELD').AsString := 'Суд подготовка документов';

  Query.Transaction := trWrite;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
  Query.Close;
end;

function TEditCFileForm.CheckEnoughMoney: Boolean;
var
  Save_Cursor: TCursor;
  pn: string;
  addCharge: Boolean;
begin
  result := true;
  if not pnlSrv.Visible then
    Exit;

  // проверим. это отключение СПД и ЛТВ ли
  pn := dbluFileType.Text.ToUpper;
  addCharge := FIsLTV and (pn.Contains('ОТКЛ') and (pn.Contains('СПД.') or pn.Contains('СТВ.')));
  if not addCharge then
    Exit;

  // за неуплату можно отключать в любой день
  pn := lcbOnOffSrv.Text.ToUpper;
  if pn.Contains('НЕУП') then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text := 'execute procedure IBE$EnoughMoney(:CUSTOMER_ID, :SET_DATE, :Service_Id, :SRV_OFF);';
        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('Set_Date').AsDate := edDate.value;
        ParamByName('Service_Id').AsInteger := lcbService.value;
        ParamByName('SRV_OFF').AsInteger := lcbOnOffSrv.value;
        Transaction.StartTransaction;
        ExecQuery;
        result := (FN('enough').AsInteger = 1);
        Transaction.Rollback;
      finally
        Free;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TEditCFileForm.CreateTask;
begin
  if not pnlTask.Visible then
    Exit;

  Query.SQL.Clear;

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

  Query.Transaction := trWrite;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
  Query.Close;
end;

procedure TEditCFileForm.SetInfoFromRequest;
var
  r: Integer;
begin
  if (not ednBid.Text.IsEmpty) and (not TryStrToInt(ednBid.Text, r)) then
    Exit;

  Query.SQL.Clear;
  Query.SQL.Add('select sum(COST) as COST from (');
  Query.SQL.Add(' select coalesce(r.W_Quant*r.W_Cost, 0) COST from Request_works r where r.Rq_Id = :rq_id');
  Query.SQL.Add(' union all');
  Query.SQL.Add
    (' select coalesce(r.Rm_Quant*r.Rm_Cost, 0) COST from Request_Materials r where r.Rq_Id = :rq_id and r.Calc = 1');
  Query.SQL.Add(')');
  Query.ParamByName('rq_id').AsInteger := r;
  Query.Transaction := dmMain.trReadQ;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if (not Query.FieldByName('COST').IsNull) and (ednBidSum.Text.IsEmpty) then
    ednBidSum.value := Query.FieldByName('COST').AsDouble;
  Query.Transaction.Commit;
  Query.Close;

  Query.SQL.Clear;
  Query.SQL.Add('select list(w.Surname||'' ''||coalesce(w.Firstname||'' ''||coalesce(w.Midlename, ''''), '''')) FIO');
  Query.SQL.Add(' from Request_Executors e inner join worker w on (e.Exec_Id = w.Worker_Id)');
  Query.SQL.Add(' where e.Rq_Id = :rq_id');
  Query.ParamByName('rq_id').AsInteger := r;
  Query.Transaction := dmMain.trReadQ;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if (not Query.FieldByName('FIO').IsNull) then
    FWorker := Query.FieldByName('FIO').AsString;
  Query.Transaction.Commit;
  Query.Close;
end;

function TEditCFileForm.CheckBlockDays: String;
var
  Save_Cursor: TCursor;
  pn: string;
  addCharge: Boolean;
begin
  result := '';
  if not pnlPeriod.Visible then
    Exit;

  // проверим. это отключение СПД и ЛТВ ли
  pn := dbluFileType.Text.ToUpper;
  // СПД. Добр. Блок.  ПОДКЛЮЧИТЬ.
  addCharge := FIsLTV and (pn.Contains('СПД.') and (pn.Contains('БЛОК') and pn.Contains('ПОДКЛ')));
  if not addCharge then
    Exit;

  if (VarIsNull(edPBegin.value) or VarIsNull(edPEnd.value)) then
  begin
    result := rsERROR_NOT_FILL_ALL;
    Exit;
  end;

  if ((edPBegin.value > edPEnd.value) or (edPBegin.value < NOW())) then
  begin
    result := rsERROR_NOT_FILL_ALL;
    Exit;
  end;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trReadQ;

        SQL.Clear;
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
        SQL.Add('    where s.Srv_Type_Id = 0 and s.Name like ''%Блок%'' and ss.Customer_Id = :CUSTOMER_ID');
        SQL.Add('    order by ss.State_Date desc');
        SQL.Add('    into :Date_E, :days;');
        SQL.Add('    days = coalesce(days, 0);');
        SQL.Add('    if (days = 1) then enough = ''Абонент в блокировке с ''||Date_E;');
        SQL.Add('    else');
        SQL.Add('    if ((not Date_E is null) and (Date_S <= dateadd(day, 14, Date_E))) then enough = ''Прошло менее 14 дней'';');
        SQL.Add('  end');
        SQL.Add('  suspend;');
        SQL.Add('end');

        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('Date_S').AsDate := edPBegin.value;
        ParamByName('Date_E').AsDate := edPEnd.value;
        Transaction.StartTransaction;
        ExecQuery;
        result := (FN('enough').AsString);
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
  pn: string;
  addCharge: Boolean;
begin
  if not pnlPeriod.Visible then
    Exit;

  // проверим. это отключение СПД и ЛТВ ли
  pn := dbluFileType.Text.ToUpper;
  // СПД. Добр. Блок.  ПОДКЛЮЧИТЬ.
  addCharge := FIsLTV and (pn.Contains('СПД.') and (pn.Contains('БЛОК') and pn.Contains('ПОДКЛ')));

  if not addCharge then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;

        SQL.Text := 'execute procedure IBE$MAKEBLOCK(:Customer_Id, :DATE_B, :DATE_E, :NOTICE, :CONTR_N);';

        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('DATE_B').AsDate := edPBegin.value;
        ParamByName('DATE_E').AsDate := edPEnd.value;
        ParamByName('NOTICE').AsString := memNotice.Lines.Text;
        ParamByName('CONTR_N').AsString := edtContract.Text;
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

function TEditCFileForm.GetSrvList: String;
var
  Save_Cursor: TCursor;
begin
  if not FLstSrv.IsEmpty then
  begin
    result := FLstSrv;
    Exit;
  end;
  result := '';
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        SQL.Text :=
          'select list(s.Shortname) lst from Subscr_hist ss inner join services s on (s.Service_Id = ss.Serv_Id) ';
        SQL.Add(' where ss.Customer_Id = :CUSTOMER_ID and current_date between ss.Date_From and ss.Date_To ');
        SQL.Add(' and ss.Serv_Id <> 819519 and s.Business_Type <> 16 ');
        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        Transaction.StartTransaction;
        ExecQuery;
        FLstSrv := (FN('lst').AsString);
        result := FLstSrv;
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
  pn: string;
begin
  // if not pnlPeriod.Visible then
  // Exit;

  pn := dbluFileType.Text.ToUpper;
  if not pn.Contains('СПД. ПОДКЛ. И-НЕТ.') then
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
        Transaction := dmMain.trWriteQ;

        SQL.Text := 'execute procedure IBE$MAKEPROMO(:Customer_Id, :DATE_B, :DATE_E, :NOTICE, :CONTR_N, :TEXT);';

        ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
        ParamByName('DATE_B').AsDate := edDate.value;
        ParamByName('DATE_E').AsDate := edDate.value;
        ParamByName('NOTICE').AsString := memNotice.Lines.Text;
        ParamByName('CONTR_N').AsString := edtContract.Text;
        ParamByName('TEXT').AsString := lcbService.Text;

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

end.
