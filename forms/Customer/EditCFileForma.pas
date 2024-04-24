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
  PrjConst, A4onTypeUnit, Vcl.Menus;

type
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
    lblPeriod: TLabel;
    edPBegin: TDBDateTimeEditEh;
    edPEnd: TDBDateTimeEditEh;
    pmFile: TPopupMenu;
    miFileClear: TMenuItem;
    trWriteQ: TpFIBTransaction;
    trReadQ: TpFIBTransaction;
    trRead: TpFIBTransaction;
    lblText1: TLabel;
    edtText1: TDBEditEh;
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
    procedure edtFILEExit(Sender: TObject);
    procedure miFileClearClick(Sender: TObject);
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
    FFileType: Integer;
    FFileTypeName: String;
    FFileInMem: TMemoryStream;
    FFileScaned: TMemoryStream;
    FFileScanedName: String;
    function FieldsToStr(const str: string): string;
    procedure ShowAddons;
    procedure ShowControlsJson(const json: String);
    function CheckAddons(const errors: Boolean): Boolean;
    procedure ExecuteAddons(const FileID: Integer);
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
    procedure CheckPromo();
    procedure ToBlackList();
    procedure ToJudge();
    procedure CreateTask;
    function CheckEnoughMoney: Boolean;
    procedure SetInfoFromRequest;
    function CheckBlockDays: String;
    function CheckDecoder: String;
    function CheckDatesOnOff: String;
    procedure MakePromo;
    procedure MoveDVB();
    function GetSrvList: String;
    function ExistsPassportInAccount(const PN: String): Boolean;
    procedure SetImage;
    procedure CheckTypeReuse;
    function ValidateData(): Boolean;
    function ParamExists(const Param: String): Boolean;
    procedure GetBlockSrvName(var SrvName: String; var OffSrvName: String);
    procedure MakeBlock;
    procedure GetUnBlockSrvName(var SrvName: String; var OffSrvName: String);
    procedure UnMakeBlock;
    procedure QueryClear;
    procedure SetPanelOrder;
  public
    property CustomerInfo: TCustomerInfo read FCustomerInfo write FCustomerInfo;
    property FileForSave: String read GetFile write SetFile;
    property NeedDelete: Boolean read FNeedDelete;
    property FileInMem: TMemoryStream read FFileInMem;
    procedure SetFileType(const FileType: Integer = -1; const FileTypeName: String = '');
  end;

function EditFile(const ci: TCustomerInfo; const Name: string; const CF_ID: Integer = -1;
  const FileName: String = ''): Boolean;

implementation

uses
  Winapi.ShellAPI, System.StrUtils, System.DateUtils, System.RegularExpressions, System.MaskUtils, AtrCommon,
  AtrStrUtils, DM, JsonDataObjects, ScanImageForma, BillEditForma, RequestNewForma, synacode, MAIN;

{$R *.dfm}

function EditFile(const ci: TCustomerInfo; const Name: string; const CF_ID: Integer = -1;
  const FileName: String = ''): Boolean;
var
  ForInsert: Boolean;
  i: Integer;
begin

  with TEditCFileForm.Create(Application) do
    try
      CustomerInfo := ci;
      if CF_ID >= 0
      then
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
          SetFileType(dsCustFile['Cf_Type'], dsCustFile['O_NAME']);
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
          ExecuteAddons(i);

          if NeedDelete and FileExists(FileForSave) then
            DeleteFile(FileForSave);
        end;

        result := true;
      end
      else
      begin
        dsCustFile.Cancel;
        result := False;
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
  sum, rest: Double;
  fs: TFormatSettings;
  oc: TCustomerInfo;
  ow: Integer;
begin
  s := str;
  result := s;
  if s.IsEmpty then
    Exit;

  RenameFileName;

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
  if (FCustomerInfo.cust_code <> '') then
    s := ReplaceStr(s, rsFldCodeAbonent, FCustomerInfo.cust_code);
  if (FCustomerInfo.FIO <> '') then
    s := ReplaceStr(s, rsFldFULLNAME, FCustomerInfo.FIO);
  if (pnlPassport.Visible) then
  begin
    if (Trim(edtSURNAME.Text + ' ' + edtFIRSTNAME.Text + ' ' + edtMIDLENAME.Text) <> '') then
      s := ReplaceStr(s, rsFldApplicantName, Trim(edtSURNAME.Text + ' ' + edtFIRSTNAME.Text + ' ' + edtMIDLENAME.Text))
  end
  else
  begin
    if (FCustomerInfo.FIO <> '') then
      s := ReplaceStr(s, rsFldApplicantName, FCustomerInfo.FIO);
  end;

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
  s := ReplaceStr(s, rsFldText1, edtText1.Text);

  if pnlSrv.Visible then
  begin
    if not lcbService.Text.IsEmpty then
      s := ReplaceStr(s, rsFldFileSrv, lcbService.Text);
    if not lcbOnOffSrv.Text.IsEmpty then
      s := ReplaceStr(s, rsFldFileOnOffSrv, lcbOnOffSrv.Text);
    if not VarIsNull(edDate.value) then
      s := ReplaceStr(s, rsFldFileDate, edDate.Text);
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
    if (not VarIsNull(edPBegin.value)) then
      s := ReplaceStr(s, '[ДАТА_Н]', FormatDateTime('dd.mm.yyyy', edPBegin.value));
    if (not VarIsNull(edPEnd.value)) then
      s := ReplaceStr(s, '[ДАТА_О]', FormatDateTime('dd.mm.yyyy', edPEnd.value));
  end;

  s := ReplaceStr(s, '[ИСПОЛН]', FWorker);
  if pnlBidPay.Visible then
  begin
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
    end
    else
    begin
      if not ednCheckSum.Text.IsEmpty then
        s := ReplaceStr(s, rsFldPAYMENT, FloatToStr(ednCheckSum.value));
    end;
  end;

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
begin
  result := A4MainForm.ParseCaptured(_scanName, scResult);
end;

procedure TEditCFileForm.TextToFileds(scResult: TStringList);
var
  s: string;
  i: Integer;
  r: TStringArray;
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
var
  scResult: TStringList;
  TmpFile: String;
  cr: TCursor;
  vNeed: Boolean;
begin
  vNeed := False;
  if FFileScaned.Size <> 0 then
  begin
    TmpFile := GetTempDir() + FFileScanedName;
    if FileExists(TmpFile) then
      DeleteFile(TmpFile);

    FFileScaned.SaveToFile(TmpFile);
    vNeed := true;
  end
  else
  begin
    //
    if FFileInMem.Size <> 0 then
    begin
      TmpFile := ExtractFileName(edtFILE.Text);
      TmpFile := GetTempDir() + TmpFile;
      if FileExists(TmpFile) then
        DeleteFile(TmpFile);

      FFileInMem.SaveToFile(TmpFile);
      vNeed := true;
    end
  end;

  if not vNeed then
    Exit;

  scResult := TStringList.Create;
  cr := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if ParseCaptured(TmpFile, scResult) then
      TextToFileds(scResult);
    SetFile(TmpFile);
  finally
    FreeAndNil(scResult);
    Screen.Cursor := cr;
  end;
end;

procedure TEditCFileForm.btnOkClick(Sender: TObject);
var
  errors: Boolean;
  cs: string;
begin
  if not btnOk.Visible then
    Exit;

  errors := ValidateData();

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
    fext := ExtractFileExt(FileName);
    if fext.Contains('tmp') then
    begin
      RenameFile(FileName, ChangeFileExt(FileName, '.jpg'));
      FileName := ChangeFileExt(FileName, '.jpg');
    end;
    if FFileScaned.Size > 0 then
      FFileScaned.Clear;

    FFileScaned.LoadFromFile(FileName);
    FFileScaned.Seek(0, soBeginning);
    FFileScanedName := ExtractFileName(FileName);

    SetFile(FileName);
    FNeedDelete := true;
  end;
end;

procedure TEditCFileForm.dbluFileTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsFileTypes.Active) and (not dsFileTypes.FieldByName('O_DIMENSION').IsNull) then
    Background := StringToColor(dsFileTypes['O_DIMENSION'])
  else
    Background := clWindow;
end;

procedure TEditCFileForm.dbluFileTypeExit(Sender: TObject);
begin
  if dbluFileType.Text = '' then
    Exit;

  if (not VarIsNull(dbluFileType.value)) then
  begin
    if (FFileType <> dbluFileType.value) then
    begin
      SetFileType(dbluFileType.value, dbluFileType.Text);
      if (dsCustFile.State = dsInsert) then
      begin
        ShowAddons;
        UpdateNotice;

        if (FFileTypeName.Contains('ОТКЛ') or FFileTypeName.Contains('СМЕН')) then
          CheckPromo;
      end;
    end;

    if FIsLTV then
      edtFILE.EditButtons[0].Visible := (not FFileTypeName.Contains('ПАСПОРТ'));
  end
  else
    SetFileType(-1);
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
  s, n: string;
begin
  s := (Sender as TDBEditEh).Text;
  if FIsLTV then
  begin
    s := DigitsOnly(s);
    s := Copy(s, 1, 4) + ' ' + Copy(s, 5, 255);
    if length(s) <> 11 then
    begin
      ShowMessage('Проверьте номер паспорта');
      edtPASSPORT.OnEnter := nil;
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
      {
        n := '';
        n := InputBox('Повторный ввод номера паспорта', 'Номер паспорта', n);
        n := Trim(n);
        if n <> s then
        begin
        edtPASSPORT.SetFocus;
        FOldNumber := '';
        Exit;
        end
      }
    end;
  end;

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
  FFileInMem := TMemoryStream.Create;
  FFileScaned := TMemoryStream.Create;
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
end;

procedure TEditCFileForm.FormDestroy(Sender: TObject);
begin
  if FNeedDelete and (not FFileForSave.IsEmpty) and FileExists(FFileForSave) then
    DeleteFile(FFileForSave);

  if dsOnOffService.Active then
    dsOnOffService.Close;
  if dsService.Active then
    dsService.Close;
  if FFileInMem.Size > 0 then
    FFileInMem.Clear;
  FreeAndNil(FFileInMem);
  if FFileScaned.Size > 0 then
    FFileScaned.Clear;
  FreeAndNil(FFileScaned);
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
    FFileInMem.LoadFromFile(value);
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

  edtFILE.Text := new.Replace(' ', '_') + '.' + FormatDateTime('yymmdd', NOW()) + ext;
end;

function TEditCFileForm.GetFile: String;
begin
  result := FFileForSave;
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
  s, json: string;
begin
  WindowLocked := LockWindowUpdate(Self.Handle);
  try
    memNotice.ReadOnly := False;
    edtNAME.Text := '';
    FHandNameInput := '';
    edtNAME.ReadOnly := False;

    ItsJson := (CustomerInfo.CUSTOMER_ID > 0);
    json := '';
    if dsFileTypes.Locate('O_ID', FFileType, []) then
    begin
      if (not dsFileTypes.FieldByName('O_CHARFIELD').IsNull) then
        json := dsFileTypes['O_CHARFIELD'];
      ItsJson := ItsJson and (not json.IsEmpty);
    end;

    chkContract.Visible := ItsJson and FNewContract and (ParamExists(rsFldContract) or ParamExists(rsFldContractDate));

    pnlSrv.Visible := False;
    btnOcr.Visible := False;
    pnlPassport.Visible := False;
    pnlDoc.Visible := False;
    pnlMobile.Visible := False;
    pnlTask.Visible := False;
    pnlPeriod.Visible := False;
    pnlBidPay.Visible := False;
    pnlAdr.Visible := False;
    pnlText.Visible := False;
    edtText1.Visible := False;
    ednBid.Visible := False;
    ednBidSum.Visible := False;
    ednCheckSum.Visible := False;
    ednFineSum.Visible := False;
    chkFOwner.Visible := False;
    // chkFOwner.Enabled := False;
    edtText.Text := '';
    lblText.Caption := 'Доп. текст';
    edtText.EmptyDataInfo.Text := '';
    edtText.Hint := '';
    lblText1.Caption := 'Доп. текст 1';
    edtText1.EmptyDataInfo.Text := '';
    edtText1.Hint := '';
    FFileInMem.Clear;

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
      ShowControlsJson(json);

    pnlClient.Visible := true;

    pnlContract.Visible := chkContract.Visible or chkFOwner.Visible;

    if not FNameFmt.IsEmpty then
      edtNAME.EmptyDataInfo.Text := 'Наименование / номер документа ' + FNameFmt;

    dsStreets.Active := pnlAdr.Visible;
    dsHomes.Active := pnlAdr.Visible;
    dsFLAT.Active := pnlAdr.Visible;

    dsService.Active := (pnlSrv.Visible and (not pnlAdr.Visible));
    dsOnOffService.Active := (pnlSrv.Visible and (not pnlAdr.Visible));

    if (FFileTypeName.Contains('ПЕРЕОФОРМЛЕНИЕ ДОГОВОРА')) then
    begin
      edtText.Text := GetSrvList;
      edtText.EmptyDataInfo.Text := GetSrvList;
    end;

    // if chkFOwner.Visible then
    // chkFOwner.Enabled := (not FIsLTV) or s.Contains('ПАСПОРТ') or s.Contains('СОБСТВЕННОСТЬ');
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
  s: string;
begin
  srv_state := -1;

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

        if (JO.Contains('Srv') and (not JO['Srv'].IsNull)) then
          dsService.ParamByName('Srv').AsInteger := JO.i['Srv']
        else
          dsService.ParamByName('Srv').AsInteger := -999;

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
        begin
          pnlDoc.Visible := JO.B['Card'];
          btnOcr.Visible := pnlDoc.Visible;
        end;
      end;
    end;

    if JO.Contains('Own') then
    begin
      if not JO['Own'].IsNull then
        chkFOwner.Visible := JO.B['Own'];
      // chkFOwner.Enabled := JO.B['Own'];
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

      if JO.Contains('Txt1') then
      begin
        if not JO['Txt1'].IsNull then
        begin
          edtText1.Visible := true;
          s := JO.s['Txt1'];
          if s.Contains('|') then
          begin
            edtText1.Text := Copy(s, 1, pos('|', s) - 1);
            edtText1.EmptyDataInfo.Text := Copy(s, pos('|', s) + 1, length(s));
            if not edtText1.EmptyDataInfo.Text.IsEmpty then
            begin
              lblText1.Caption := edtText1.EmptyDataInfo.Text;
              edtText1.Hint := edtText1.EmptyDataInfo.Text;
            end;
          end
          else
            edtText1.Text := s;
        end;
      end;
    end;

    if JO.Contains('mRO') then
    begin
      if not JO['mRO'].IsNull then
        memNotice.ReadOnly := (JO.B['mRO'] and (not dmMain.UserIsAdmin) and
          (not dmMain.AllowedAction(rght_Customer_full)));
    end;

    if JO.Contains('Nfmt') then
    begin
      if not JO['Nfmt'].IsNull then
        FNameFmt := JO.s['Nfmt'];
    end;
    if JO.Contains('nRO') then
    begin
      if not JO['nRO'].IsNull then
        edtNAME.ReadOnly := (not FNameFmt.IsEmpty) and
          (JO.B['nRO'] and (not dmMain.UserIsAdmin) and (not dmMain.AllowedAction(rght_Customer_full)));
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
      begin
        edPEnd.Visible := true;
        if (JO['Prd'].Typ = jdtBool) then
          pnlPeriod.Visible := JO.B['Prd']
        else if (JO['Prd'].Typ = jdtInt) then
        begin
          pnlPeriod.Visible := (JO.i['Prd'] > 0);
          edPEnd.Visible := (JO.i['Prd'] = 1);
          if edPEnd.Visible then
            lblPeriod.Caption := 'Перод'
          else
            lblPeriod.Caption := 'Дата';
        end;
      end;
    end;

    // убрал, так как смотрим только на настройку Собственик в типе файлов
    // if not chkFOwner.Visible then begin
    // chkFOwner.Visible := FShowFlatOwner and (not pnlPassport.Visible);
    // end;

    lblBP.Visible := ednBid.Visible;
    pnlBidPay.Visible := ednBid.Visible or ednCheckSum.Visible;

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
        ednCheckSum.EmptyDataInfo.Text := 'Сумма';
        ednCheckSum.Left := 85;
        lblBP.Visible := true;
        lblBP.Caption := ednCheckSum.EmptyDataInfo.Text;
      end;
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
    if dsFileTypes.Locate('O_ID', FFileType, []) then
    begin
      if (not dsFileTypes.FieldByName('O_DESCRIPTION').IsNull) then
      begin
        s := FieldsToStr(dsFileTypes['O_DESCRIPTION']);
        memNotice.Lines.Text := s;
      end;
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
      s := CheckDatesOnOff();
      if not s.IsEmpty then
      begin
        result := true;
        CnErrors.SetError(edDate, s, iaMiddleLeft, bsNeverBlink);
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

  if pnlText.Visible then
  begin
    s := CheckDecoder;
    if s <> '' then
    begin
      result := true;
      CnErrors.SetError(edtText, s, iaMiddleLeft, bsNeverBlink);
    end;
  end;

  if not edtNAME.ReadOnly and edtNAME.Text.Contains('***') then
  begin
    result := true;
    CnErrors.SetError(edtNAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtNAME);

  if not memNotice.ReadOnly and memNotice.Lines.Text.Contains('***') then
  begin
    result := true;
    CnErrors.SetError(memNotice, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(memNotice);
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

procedure TEditCFileForm.ExecuteAddons(const FileID: Integer);
var
  d: TDate;
  NewCustomer: Integer;
  s, rs, os: String;
  oldOwner: Integer;
  c: TCustomerInfo;
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
  SaveDocument(FileID);
  SavePhone();
  UpdateCustomerInfo(FCustomerInfo.CUSTOMER_ID);
  SaveFlatOwner(FCustomerInfo.CUSTOMER_ID);
  CreateTask();
  MakeBlock();
  UnMakeBlock();
  MakePromo();
  MoveDVB();

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

      s := memNotice.Lines.Text; // ReplaceStr(memNotice.Lines.Text, os, rs);
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

  QueryClear;
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
  s, n, vSurn: string;
  ft: Integer;
  FullInfo: Boolean;
  TmpFile: string;
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
  begin
    vSurn := Query.FN('Surname').AsString;
    edtSURNAME.Text := vSurn;
  end;
  if not(Query.FN('Firstname').IsNull) then
    edtFIRSTNAME.Text := Query.FN('Firstname').AsString;
  if not(Query.FN('Midlename').IsNull) then
    edtMIDLENAME.Text := Query.FN('Midlename').AsString;

  if (FShowFlatOwner and (not(Query.FN('OWN_DOC').IsNull))) then
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
      {
        // блокируем все операции кроме паспорта
        if (FIsLTV) and //
        (not(FFileTypeName.Contains('ПАСПОРТ') //
        or FFileTypeName.Contains('ПЕРЕОФ') //
        or FFileTypeName.Contains('СОБСТВЕН')) //
        ) then
        begin
        btnOk.Visible := False;
        MessageDlg('Отсутствует признак собственника данной квартиры.' + #13#10 + 'Варианты решения:' + #13#10 +
        '- Файл - Паспорт,' + #13#10 + '- Файл - Переоформление,' + #13#10 + '- Файл - Собственность,' + #13#10 +
        '- прописать номер паспорта для квартиры в карте дома.', mtError, [mbOK], 0);
        end;
      }
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

  chkFOwner.OnClick := nil;
  chkFOwner.Checked := (FOwnerOldState = 1);
  chkFOwner.OnClick := chkFOwnerClick;

  { // отключен поиск подобных паспортов
    ft := -1;
    if FFileTypeName.Contains('ПАСПОРТ') then
    begin
    if FFileTypeName.Contains('ФОТО') then
    ft := 47675
    else if FFileTypeName.Contains('ПРОПИСКА') then
    ft := 50378;
    end;

    if ((ft > 0) and (n <> '')) then
    begin
    QueryClear;
    Query.SQL.Add('select first 1 cf.Filename, cf.Content from Customer_Files cf');
    Query.SQL.Add('where not cf.Filename is null and not cf.Content is null ');
    Query.SQL.Add(' and cf.Cf_Type = :ft and cf.Name like :pn');
    Query.SQL.Add('order by cf.added_on desc');
    Query.ParamByName('ft').AsInteger := ft;
    Query.ParamByName('pn').AsString := '%' + n + '%';
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
    if (not Query.FN('Filename').IsNull) and (not Query.FN('Content').IsNull) then
    begin
    if (dmMain.GetSettingsValue('SHOW_DOC_LIST') = '1') //
    and ( //
    (edtFILE.Text.IsEmpty) //
    or //
    (Application.MessageBox('Вы указали имя файла, заменить его тем, что был ранее сохранен для данного паспорта?',
    'Замена файла', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES) //
    ) then
    begin
    TmpFile := ExtractFileExt(Query.FN('Filename').AsString);
    TmpFile := GetTempDir() + n.Replace(' ', '_') + '.' + SecondOfTheDay(NOW).ToString + TmpFile;
    if FileExists(TmpFile) then
    DeleteFile(TmpFile);
    Query.FieldByName('CONTENT').SaveToFile(TmpFile);
    SetFile(TmpFile);
    // edtPASSPORT.ReadOnly := true;
    FNeedDelete := true;
    end;
    Query.Transaction.Commit;
    Query.Close;
    end;
    end;
  }

  if vSurn.IsEmpty then
  begin
    CnErrors.Dispose(edtPASSPORT);
    CnErrors.SetError(edtPASSPORT, rsNeedPassportCheck, iaMiddleLeft).IconType := EP_INFO2;
  end;

  if FContract.IsEmpty then
    CheckAndGenContract
  else
    SetContract;

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
    if not VarIsNull(edDate.value) then
      s := s + '"srvdt:"' + FormatDateTime('yyyy-mm-dd', edDate.value) + '",';
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
    if not VarIsNull(edPBegin.value) then
      s := s + '"prdf:"' + FormatDateTime('yyyy-mm-dd', edPBegin.value) + '",';
    if (edPEnd.Visible) and (not VarIsNull(edPEnd.value)) then
      s := s + '"prdt:"' + FormatDateTime('yyyy-mm-dd', edPEnd.value) + '",';
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

  result := s;
end;

procedure TEditCFileForm.SaveDocument(const FileID: Integer);
var
  PN: string;
  nf: Boolean;
begin
  if (dmMain.GetSettingsValue('SHOW_DOC_LIST') <> '1') then
    Exit;

  if FFileTypeName.Contains('НЕУПЛАТА') then
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
  Query.SQL.Add('update or insert into Doc_LIST (Doc_Type, Doc_Number, Doc_Reg, Doc_Date, ' +
    'Birthday, Addr_Registr, Addr_Birth, PERSONAL_N, Surname, Firstname, Midlename' + IfThen(nf, ', Cf_Id', '') + ')');
  Query.SQL.Add('values (:Doc_Type, :Doc_Number, :Doc_Reg, :Doc_Date, ' +
    ':Birthday, :Addr_Registr, :Addr_Birth, :PERSONAL_N, :Surname, :Firstname, :Midlename' + IfThen(nf, ', :Cf_Id',
    '') + ')');
  Query.SQL.Add('matching (Doc_Type, Doc_Number)');

  Query.ParamByName('Doc_Type').AsInteger := 1;
  Query.ParamByName('Doc_Number').AsString := PN;
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
  nf: Boolean;
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
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  Query.Transaction.Commit;
end;

procedure TEditCFileForm.AddOrOffService;
var
  Save_Cursor: TCursor;
  PN: string;
  vDebt: Double;
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
            if (FFileTypeName.Contains('ОТКЛ') and FFileTypeName.Contains('СТВ.')) then
            begin
              SQL.Add('  CalcDate = dateadd(DAY, -1, Set_Date);');
              SQL.Add('  select M_Tarif from Get_Tarif_Sum_Customer_Srv(:Customer_Id, :Service_Id, :CalcDate) into :tar;');
              SQL.Add('  tar = coalesce(tar, 0);');
              SQL.Add('  cd = extract(day from dateadd(DAY, -1, Set_Date));');
              SQL.Add('  md = extract(day from Month_Last_Day(CalcDate));');
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
          if FIsLTV then
          begin
            if FFileTypeName.Contains('ОТКЛ') then
            begin
              // 942519  'Доначисление СТВ'
              if FFileTypeName.Contains('СТВ.') then
                SQL.Add('  if (bal>0) then execute procedure Add_Single_Service(:Customer_Id, 942519, :bal, current_date, :notice);');
              // 942520  'Доначисление СПД'
              // if FFileTypeName.Contains('СПД.') then
              // SQL.Add('  if (bal>0) then execute procedure Add_Single_Service(:Customer_Id, 942520, :bal, :Set_Date, :notice);');

              // спишем долги АБОНЕНТА если нет услуг
              // 39964 услуга "остаток"
              SQL.Add('  bal = null;');
              SQL.Add('  select c.Debt_Sum from customer c where c.Customer_Id = :Customer_Id');
              SQL.Add('   and (not exists(select ss.Subscr_Serv_Id from Subscr_Serv ss');
              SQL.Add('      where ss.Customer_Id = c.Customer_Id and ss.State_Sgn = 1 and ss.Serv_Id <> 819519)) into :bal;');
              SQL.Add('  if (coalesce(bal,0) < 0) then execute procedure Add_Single_Service(:Customer_Id, 39964, (-1*:bal), :Set_Date, :notice);');
              // если долг, то подготовка документов в суд
              // 473760 услуга "документов в суд"
              SQL.Add('  else if (coalesce(bal,0) > 0) then execute procedure IBE$toJUDGE(:Customer_Id, :notice, 1);');
            end
            else if FFileTypeName.Contains('РАССР') then // расскрочка
            begin
              // wi-fi рассрочка
              if ((lcbService.value = 559932) or (lcbService.value = 876662)) then
              begin
                SQL.Add('  Srv_On_Off = 606068;');
                SQL.Add('  CalcDate = dateadd(Year, 2, Set_Date);');
                SQL.Add('  execute procedure Onoff_Service_By_Id(:Customer_Id, :Service_Id, :Srv_On_Off, :CalcDate, 1, :NOTICE, 1, 0);');
              end;
            end
            else if FFileTypeName.Contains('СМЕНА') then // смена услуг
            begin
              // попытка найти услугу такого же типа и отключить
              SQL.Add('  cd = null;');
              SQL.Add('  select s.Business_Type from services s where s.Service_Id = :Service_Id into :md;');
              SQL.Add('  select first 1 ss.Serv_Id from Subscr_hist ss inner join services s on (s.Service_Id = ss.Serv_Id and s.Business_Type = :md)');
              SQL.Add('  where ss.Customer_Id = :Customer_Id and ss.Serv_Id <> :Service_Id and :SET_DATE between ss.Date_From and ss.Date_To');
              SQL.Add('  into :cd;');
              SQL.Add('  if (not cd is null) then');
              SQL.Add('    execute procedure Onoff_Service_By_Id(:Customer_Id, :cd, :Srv_On_Off, dateadd(DAY,-1,:Set_Date), 1, :NOTICE, 1);');
            end;
          end;
          SQL.Add('end');

          //ShowMessage(SQL.Text);

          ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
          ParamByName('Service_Id').AsInteger := lcbService.value;
          if FIsOff = 1 then
            ParamByName('Set_On').AsInteger := 0
          else
            ParamByName('Set_On').AsInteger := 1;
          ParamByName('Set_Date').AsDate := edDate.value;
          ParamByName('Srv_On_Off').AsInteger := lcbOnOffSrv.value;
          if FIsLTV then
          begin
            // СПД. ПЕРЕНОС И-НЕТ. (ПОДКЛ.)
            // 996190 И-нет.  ПЕРЕНОС услуги. (подключить).
            // 996193 И-нет.  ПЕРЕНОС услуги. (отключить).

            // СТВ. ПЕРЕНОС. (ПОДКЛ.)
            // 996415 СТВ.  ПЕРЕНОС услуги. (подключить).
            // 996413 СТВ.  ПЕРЕНОС услуги. (отключить).
            if FFileTypeName = 'СПД. ПЕРЕНОС И-НЕТ. (ПОДКЛ.)' then
              ParamByName('Srv_On_Off').AsInteger := 996190
            else if FFileTypeName = 'СТВ. ПЕРЕНОС. (ПОДКЛ.)' then
              ParamByName('Srv_On_Off').AsInteger := 996415;
          end;
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
  oldC: TCustomerInfo;
begin
  result := -1;

  if not pnlSrv.Visible then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    if FNeedSrv then
    begin
      oldC := GetCustomerByAddress(oldOwner);
      result := oldC.CUSTOMER_ID;
      if result > 0 then
      begin
        with TpFIBQuery.Create(Self) do
        begin
          try
            DataBase := dmMain.dbTV;
            Transaction := trWriteQ;
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
            SQL.Add('  CF_ID       D_INTEGER = :CF_ID,');
            SQL.Add('  New_Type D_INTEGER = :New_Type)');
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
            SQL.Add('    select :NCF, :OLD_customer_id, Name, coalesce(:New_Type, Cf_Type), Date_From, Date_To, Filename, Notice, Act, Anotice, Content, Addons');
            SQL.Add('    from Customer_Files where Cf_Id = :Cf_Id;');
            SQL.Add('    if (not New_Type is null) then begin');
            SQL.Add('       update Customer_Files cf ');
            SQL.Add('       set cf.Name = replace(replace(cf.Name, ''Подкл'', ''Откл''), ''подкл'', ''откл''), ');
            SQL.Add('       cf.Notice = replace(replace(cf.Notice, ''Подкл'', ''Откл''), ''подкл'', ''откл'')  ');
            SQL.Add('       where cf.Cf_Id = :NCF; ');
            SQL.Add('    end');

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

            if FIsLTV and FFileTypeName.Contains('СТВ') then
            begin
              // если перенос СТВ, то спишем остаток со строго лицевого
              SQL.Add('  bal = null;');
              SQL.Add('  select c.Debt_Sum from customer c where c.Customer_Id = :OLD_customer_id');
              SQL.Add('    and (not exists(select ss.Subscr_Serv_Id from Subscr_Serv ss');
              SQL.Add('      where ss.Customer_Id = c.Customer_Id and ss.State_Sgn = 1 and ss.Serv_Id <> 819519)) into :bal;');
              SQL.Add('  if (coalesce(bal,0) < 0) then execute procedure Add_Single_Service(:OLD_customer_id, 39964, (-1*:bal), :Set_Date, :notice);');
              SQL.Add('  -- else if (coalesce(bal,0) > 0) then execute procedure IBE$toJUDGE(:OLD_customer_id, :notice, 1);');
            end;

            SQL.Add('end');

            //ShowMessage(SQL.Text);

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
            ParamByName('New_Type').Clear;
            ParamByName('Srv_On_Off').AsInteger := lcbOnOffSrv.value;
            if FIsLTV then
            begin
              // СПД. ПЕРЕНОС И-НЕТ. (ПОДКЛ.)
              // 996190 И-нет.  ПЕРЕНОС услуги. (подключить).
              // 996193 И-нет.  ПЕРЕНОС услуги. (отключить).

              // СТВ. ПЕРЕНОС. (ПОДКЛ.)
              // 996415 СТВ.  ПЕРЕНОС услуги. (подключить).
              // 996413 СТВ.  ПЕРЕНОС услуги. (отключить).
              if FFileTypeName = 'СПД. ПЕРЕНОС И-НЕТ. (ПОДКЛ.)' then
              begin
                ParamByName('Srv_On_Off').AsInteger := 996193;
                ParamByName('New_Type').AsInteger := 48500; // СПД. Перенос И-нет. (откл.)
              end
              else if FFileTypeName = 'СТВ. ПЕРЕНОС. (ПОДКЛ.)' then
              begin
                ParamByName('Srv_On_Off').AsInteger := 996413;
                ParamByName('New_Type').AsInteger := 48501; // СТВ. Перенос. (откл.)
              end;
            end;
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
        Transaction := trWriteQ;
        SQL.Text := 'execute procedure Add_Single_Service' +
          '(:CUSTOMER_ID, :SERVICE_ID, :QNT, CURRENT_DATE, :NOTICE, null);';
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
        Transaction := trWriteQ;
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

function TEditCFileForm.GetCustomerByAddress(var oldOwner: Integer): TCustomerInfo;
begin
  result.CUSTOMER_ID := -1;
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
      Transaction.StartTransaction;
      ExecQuery;
      if not FN('CUSTOMER_ID').IsNull then
        result.CUSTOMER_ID := FN('CUSTOMER_ID').AsInteger;
      if not FN('Account_NO').IsNull then
        result.Account_No := FN('Account_NO').AsString;
      if not FN('cust_code').IsNull then
        result.cust_code := FN('cust_code').AsString;
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
  PN: string;
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
  QueryClear;
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
    ShowMessage(rsPromoWarning);
end;

procedure TEditCFileForm.ToJudge();
begin
  if not FIsLTV then
    Exit;

  QueryClear;
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
  QueryClear;
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
  PN: string;
  addCharge: Boolean;
begin
  result := true;
  if not pnlSrv.Visible then
    Exit;

  // проверим. это отключение СПД и ЛТВ ли
  addCharge := FIsLTV and (FFileTypeName.Contains('ОТКЛ') and (FFileTypeName.Contains('СПД.') or
    FFileTypeName.Contains('СТВ.')));
  if not addCharge then
    Exit;

  // за неуплату можно отключать в любой день
  PN := lcbOnOffSrv.Text.ToUpper;
  if PN.Contains('НЕУП') then
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
  rc, rs: Double;
begin
  CnErrors.Dispose(ednBid);
  HasError := False;

  if (ednBid.Text.IsEmpty) or (not TryStrToInt(ednBid.Text, r)) then
    Exit;

  rc := 0;
  rs := 0;

  QueryClear;
  Query.SQL.Add('select coalesce(r.Rq_Customer, -1) customer_id ');
  Query.SQL.Add(' , Get_Request_Money(r.Rq_Id) COST ');
  Query.SQL.Add
    (' , (select sum(w_quant * w_cost) SU_COST from request_works where rq_id = r.Rq_Id and w_id = 983987) ');
  Query.SQL.Add('from request r where r.Rq_Id = :rq_id');
  Query.ParamByName('rq_id').AsInteger := r;
  Query.Transaction := trReadQ;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if (not Query.FieldByName('COST').IsNull) then
    rc := Query.FieldByName('COST').AsDouble;
  if (not Query.FieldByName('SU_COST').IsNull) then
    rs := Query.FieldByName('SU_COST').AsDouble;
  if (Query.FieldByName('customer_id').AsInteger <> FCustomerInfo.CUSTOMER_ID) then
  begin
    HasError := true;
    CnErrors.SetError(ednBid, 'Эта заявка для другого абонента', iaMiddleLeft, bsNeverBlink);
  end;
  Query.Transaction.Commit;
  Query.Close;
  if HasError then
  begin
    ednBid.SetFocus;
    Exit;
  end;

  QueryClear;
  Query.SQL.Add('select sum(p.Pay_Sum) as PAY from payment p where p.customer_id = :cid and p.Rq_Id =  :rq_id');
  Query.ParamByName('cid').AsInteger := FCustomerInfo.CUSTOMER_ID;
  Query.ParamByName('rq_id').AsInteger := r;
  Query.Transaction := trReadQ;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if (Query.FieldByName('PAY').AsFloat > 0) then
  begin
    HasError := true;
    CnErrors.SetError(ednBid, 'Эта заявка уже оплачена', iaMiddleLeft, bsNeverBlink);
  end;
  Query.Transaction.Commit;
  Query.Close;
  if HasError then
  begin
    ednBid.SetFocus;
    Exit;
  end;

  if (ednBidSum.Text.IsEmpty) then
    ednBidSum.value := rc - rs;

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

function TEditCFileForm.CheckDecoder: String;
var
  Save_Cursor: TCursor;
  s, f: string;
  h: Integer;
begin
  result := '';
  if not pnlText.Visible then
    Exit;

  s := AnsiUpperCase(edtText.EmptyDataInfo.Text);
  if not(s.Contains('НОМЕР КАМ') //
    or s.Contains('ДЕКОДЕР ') //
    ) then
    Exit;

  if edtText.Text.IsEmpty then
  begin
    result := rsIncorrectDecoder;
    Exit;
  end;

  h := -1;
  f := '';
  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := trReadQ;

        SQL.Clear;
        SQL.Add('select d.Eq_N, c.House_Id, c.flat_no');
        SQL.Add('  from EQUIPMENT_DVB d');
        SQL.Add('       left outer join customer_decoders cd on (d.eq_n = cd.decoder_n)');
        SQL.Add('       left outer join customer c on (cd.customer_id = c.customer_id)');
        SQL.Add('  where d.Eq_N = :DECODER');

        ParamByName('DECODER').AsString := edtText.Text;
        Transaction.StartTransaction;
        ExecQuery;
        if (FN('Eq_N').IsNull) then
          result := rsNOT_FOUND_DECODER
        else
        begin
          if (not FN('House_Id').IsNull) then
            h := FN('House_Id').AsInteger;
          if (not FN('flat_no').IsNull) then
            f := FN('flat_no').AsString;
        end;
        Transaction.Commit;
      finally
        Free;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor;
  end;

  if result.IsEmpty then
  begin
    if pnlAdr.Visible then
    begin
      if (h <> lcbHOUSE.value) or (f <> lcbFLAT.Text) then
        result := 'Декодера ' + edtText.Text + ' нет по старому адресу';
    end
  end;
end;

function TEditCFileForm.CheckBlockDays: String;
var
  Save_Cursor: TCursor;
  PN: string;
  addCharge: Boolean;
begin
  result := '';
  if not pnlPeriod.Visible then
    Exit;

  // проверим. это отключение СПД и ЛТВ ли
  // СПД. Добр. Блок.  ПОДКЛЮЧИТЬ.
  addCharge := FIsLTV and (FFileTypeName.Contains('СПД.') and (FFileTypeName.Contains('БЛОК') and
    FFileTypeName.Contains('ПОДКЛ')));
  if not addCharge then
    Exit;

  if (VarIsNull(edPBegin.value) or (edPEnd.Visible and VarIsNull(edPEnd.value))) then
  begin
    result := rsERROR_NOT_FILL_ALL;
    Exit;
  end;

  if edPEnd.Visible and ((edPBegin.value > edPEnd.value) or (edPBegin.value < NOW())) then
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
        Transaction := trReadQ;

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
  PN: string;
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

procedure TEditCFileForm.GetBlockSrvName(var SrvName: String; var OffSrvName: String);
var
  Save_Cursor: TCursor;
  PN: string;
  SRVID: Integer;
  ONSRVID: Integer;
  ONSRVNAME: string;
  OFFSRVID: Integer;
  BLKSRVID: Integer;
  BLKSRVNAME: string;
  addCharge: Boolean;
begin
  SrvName := '';
  OffSrvName := '';

  if not pnlPeriod.Visible then
    Exit;

  if (VarIsNull(edPBegin.value) or VarIsNull(edPEnd.value)) then
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
        ParamByName('DATE_B').AsDate := edPBegin.value;
        ParamByName('DATE_E').AsDate := edPEnd.value;
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
        Transaction := trReadQ;
        SQL.Text :=
          'select list(s.Shortname) lst from Subscr_hist ss inner join services s on (s.Service_Id = ss.Serv_Id) ';
        SQL.Add(' where ss.Customer_Id = :CUSTOMER_ID and current_date between ss.Date_From and ss.Date_To ');
        SQL.Add(' and ss.Serv_Id <> 819519 ');
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
  PN: string;
begin
  // if not pnlPeriod.Visible then
  // Exit;

  if not FFileTypeName.Contains('СПД. ПОДКЛ. И-НЕТ.') then
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

procedure TEditCFileForm.miFileClearClick(Sender: TObject);
begin
  edtFILE.Text := '';
  SetFile(edtFILE.Text);
end;

procedure TEditCFileForm.SetFileType(const FileType: Integer = -1; const FileTypeName: String = '');
begin
  if (FileTypeName.IsEmpty) or (FileType = -1) then
  begin
    FFileType := -1;
    FFileTypeName := '';
    FFileInMem.Clear;
  end
  else
  begin
    FFileType := FileType;
    FFileTypeName := FileTypeName.ToUpper.Trim;
    if FFileTypeName.StartsWith('РТ') then
      SetImage;
    if dsCustFile.State = dsInsert then
      CheckTypeReuse;
  end;
end;

function TEditCFileForm.ExistsPassportInAccount(const PN: String): Boolean;
begin
  result := False;

  QueryClear;
  Query.SQL.Add('select count(*) cnt from Customer_Files cf');
  Query.SQL.Add('where cf.customer_id = :CID and (cf.Name like :pn or cf.Notice like :pn)');
  Query.ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
  Query.ParamByName('pn').AsString := '%' + PN + '%';
  Query.Transaction := trReadQ;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if not Query.FN('cnt').IsNull then
    result := (Query.FN('cnt').AsInteger > 0);
  Query.Transaction.Commit;
  Query.Close;
end;

procedure TEditCFileForm.SetImage;
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

procedure TEditCFileForm.CheckTypeReuse;
var
  ShowWarning: Boolean;
begin
  ShowWarning := False;

  QueryClear;
  Query.SQL.Add('select count(*) cnt from Customer_Files ');
  Query.SQL.Add(' where customer_id = :CID and CF_TYPE = :FT and cast(Added_On as Date) = current_date');
  Query.ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
  Query.ParamByName('FT').AsInteger := FFileType;
  Query.Transaction := trReadQ;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if not Query.FN('cnt').IsNull then
    ShowWarning := (Query.FN('cnt').AsInteger > 0);
  Query.Transaction.Commit;
  Query.Close;

  if ShowWarning then
    ShowMessage(dbluFileType.Text + ' такой тип сегодня уже добавляли абоненту');
end;

function TEditCFileForm.CheckDatesOnOff: String;
begin
  result := '';

  if lcbService.Text.IsEmpty then
    Exit;

  QueryClear;
  Query.SQL.Add('select State_Date from Subscr_Serv where Customer_Id = :CID and Serv_Id = :SID');
  Query.ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
  Query.ParamByName('SID').AsInteger := lcbService.value;
  Query.Transaction := trReadQ;
  Query.Transaction.StartTransaction;
  Query.ExecQuery;
  if not Query.FN('State_Date').IsNull then
  begin
    if VarToDateTime(edDate.value) < Query.FN('State_Date').AsDate then
      result := 'Дата не может быть раньше чем ' + FormatDateTime('dd.mm.yyyy', Query.FN('State_Date').AsDate);
  end;
  Query.Transaction.Commit;
  Query.Close;
end;

function TEditCFileForm.ValidateData: Boolean;
var
  errors: Boolean;
  cs: string;
begin
  result := False;

  if (FFileTypeName.IsEmpty) then
  begin
    result := true;
    CnErrors.SetError(dbluFileType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(dbluFileType);

  if (edtNAME.Text = '') then
  begin
    result := true;
    CnErrors.SetError(edtNAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtNAME);

  if (edtFILE.Text = '') then
  begin
    result := true;
    CnErrors.SetError(edtFILE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtFILE);

  if dsCustFile.State <> dsInsert then
    Exit;

  // Only for Insert

  if (pnlPassport.Visible) and (edtPASSPORT.Text = '') then
  begin
    result := true;
    CnErrors.SetError(edtPASSPORT, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtPASSPORT);

  if (pnlContract.Visible) then
  begin
    if (chkContract.State = cbGrayed) then
    begin
      result := true;
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
        result := true;
        CnErrors.SetError(edtContract, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(edtContract);

      if (VarIsNull(edtContractDate.value)) then
      begin
        result := true;
        CnErrors.SetError(edtContractDate, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(edtContractDate);
    end;

    if (pnlMobile.Visible) then
    begin
      if HasErrorInPhone then
        result := true;
    end;
  end;

  if (pnlText.Visible) and (edtText.Text.IsEmpty) then
  begin
    if (not FNameFmt.IsEmpty) and FNameFmt.Contains(rsFldText) then
    begin
      result := true;
      CnErrors.SetError(edtText, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else if (not dsFileTypes.FieldByName('O_DESCRIPTION').IsNull) then
    begin
      if (dsFileTypes.FieldByName('O_DESCRIPTION').AsString.Contains(rsFldText)) then
      begin
        result := true;
        CnErrors.SetError(edtText, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(edtText);
    end
  end
  else
    CnErrors.Dispose(edtText);

  if (pnlBidPay.Visible) then
  begin
    if ednBid.Visible and ednBid.Text.IsEmpty then
    begin
      result := true;
      CnErrors.SetError(ednBid, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(ednBid);

    if ednBid.Visible and ednBidSum.Text.IsEmpty then
    begin
      result := true;
      CnErrors.SetError(ednBidSum, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(ednBidSum);

    if ednCheckSum.Text.IsEmpty then
    begin
      result := true;
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
      result := true;
      CnErrors.SetError(edtTskName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtTskName);

    if edTskDate.Text.IsEmpty then
    begin
      result := true;
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
      result := true;
      CnErrors.SetError(edPBegin, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edPBegin);

    if edPEnd.Visible and edPEnd.Text.IsEmpty then
    begin
      result := true;
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

  if (FShowFlatOwner and (pnlContract.Visible) and (chkFOwner.State = cbGrayed)) and (ParamExists(rsFldOwnerText)) then
  begin
    result := true;
    CnErrors.SetError(chkFOwner, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(chkFOwner);

  result := CheckPasport(result);
  result := CheckAddons(result);
end;

procedure TEditCFileForm.MoveDVB();
var
  ci: TCustomerInfo;
  i: Integer;
  PN: string;
begin
  if not FIsLTV then
    Exit;

  if not FFileTypeName.Contains('ЦТВ. КАМ STV-CRYPT') then
    Exit;

  if not( //
    (FFileTypeName.Contains('ПРОДАЖА')) //
    or (FFileTypeName.Contains('ПЕРЕНОС')) //
    or (FFileTypeName.Contains('ПОДКЛЮЧИТЬ')) //
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
      SQL.Add('  NOTICE      varchar(1000) = :NOTICE)');
      SQL.Add('as');
      SQL.Add('declare variable s D_INTEGER;');
      SQL.Add('declare variable n D_INTEGER;');
      SQL.Add('declare variable f D_INTEGER;');
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

      if (FFileTypeName.Contains('ПОДКЛЮЧИТЬ')) then
      begin
        // 385285 КАМ_STV-Crypt.  Рассрочка - 1.
        // 468026 КАМ_STV-Crypt.  Рассрочка - 2.
        SQL.Add('  select count(*) from Customer_Decoders where Customer_Id = :CUSTOMER_ID into :s; ');
        SQL.Add('  if (s = 1) then begin s = 385285; n = 385291; f = 415690; end ');
        SQL.Add('  else begin s = 468026; n = 468030; f = 712297; end ');
        SQL.Add('  execute procedure Add_Subscr_Service(:Customer_Id, :s, :n, current_date, :NOTICE, 1, :CONTR_N, null);');
        SQL.Add('  execute procedure Onoff_Service_By_Id(:Customer_Id, :s, :f, dateadd(YEAR,2,current_date), 1, :NOTICE, 1);');
      end
      else if (FFileTypeName.Contains('ПЕРЕНОС')) then
      begin
        // 994408, 'КАМ STV Crypt.  ПЕРЕНОС. (отключить).'
        // 994407, 'КАМ STV Crypt.  ПЕРЕНОС. (подключить).'
        SQL.Add('  if (not DVB_SUM is null) then begin');
        SQL.Add('    execute procedure Add_Single_Service(:CUSTOMER_ID, 994407, :DVB_SUM, current_date, :NOTICE);');
        SQL.Add('    execute procedure Add_Single_Service(:FROM_CID, 994408, :DVB_SUM, current_date, :NOTICE);');
        SQL.Add('  end');
      end;

      SQL.Add('end');

      PN := SQL.Text;

      ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
      ParamByName('DECODER_N').AsString := edtText.Text;
      ParamByName('NOTICE').AsString := memNotice.Lines.Text;
      if FShowFlatOwner then
        ParamByName('CONTR_N').AsString := edtContract.Text;

      if (FFileTypeName.Contains('ПЕРЕНОС')) then
      begin
        ci := GetCustomerByAddress(i);
        ParamByName('FROM_CID').AsInteger := ci.CUSTOMER_ID;
        if not ednCheckSum.Text.IsEmpty then
          ParamByName('DVB_SUM').AsDouble := ednCheckSum.value;
      end;

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
  result := False;
  if not FNameFmt.IsEmpty then
    result := FNameFmt.Contains(Param);

  if (not dsFileTypes.FieldByName('O_DESCRIPTION').IsNull) then
    result := result or dsFileTypes.FieldByName('O_DESCRIPTION').AsString.Contains(Param);
end;

procedure TEditCFileForm.UnMakeBlock;
var
  Save_Cursor: TCursor;
  PN: string;
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
        ParamByName('DATE_B').AsDate := edPBegin.value;
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

procedure TEditCFileForm.GetUnBlockSrvName(var SrvName: String; var OffSrvName: String);
var
  Save_Cursor: TCursor;
  PN: string;
  SRVID: Integer;
  ONSRVID: Integer;
  ONSRVNAME: string;
  OFFSRVID: Integer;
  BLKSRVID: Integer;
  BLKSRVNAME: string;
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
        if (pnlPeriod.Visible) and (not VarIsNull(edPBegin.value)) then
          ParamByName('DATE_B').AsDate := edPBegin.value
        else
          ParamByName('DATE_B').AsDate := NOW();
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

begin
  tPosition := 1000; // pnlTop.Top + pnlTop.Height + 1;
  // pnlBidPay.TabOrder := 6;
  vTabOrder := 1;
  if pnlPassport.Visible then
  begin
    pnlPassport.Top := tPosition;
    pnlPassport.TabOrder := vTabOrder;
    Inc(vTabOrder);
  end;
  if pnlDoc.Visible then
  begin
    pnlDoc.Top := tPosition;
    pnlDoc.TabOrder := vTabOrder;
    Inc(vTabOrder);
  end;
  if pnlContract.Visible then
  begin
    pnlContract.Top := tPosition;
    pnlContract.TabOrder := vTabOrder;
    Inc(vTabOrder);
  end;
  if pnlAdr.Visible then
  begin
    pnlAdr.Top := tPosition;
    pnlAdr.TabOrder := vTabOrder;
    Inc(vTabOrder);
  end;
  if pnlSrv.Visible then
  begin
    pnlSrv.Top := tPosition;
    pnlSrv.TabOrder := vTabOrder;
    Inc(vTabOrder);
  end;
  if pnlBidPay.Visible then
  begin
    ednBidSum.ReadOnly := FIsLTV and (not dmMain.UserIsAdmin);
    pnlBidPay.Top := tPosition;
    pnlBidPay.TabOrder := vTabOrder;
    Inc(vTabOrder);
  end;
  if pnlTask.Visible then
  begin
    pnlTask.Top := tPosition;
    pnlTask.TabOrder := vTabOrder;
    Inc(vTabOrder);
  end;
  if pnlPeriod.Visible then
  begin
    pnlPeriod.Top := tPosition;
    pnlPeriod.TabOrder := vTabOrder;
    Inc(vTabOrder);
  end;
  if pnlMobile.Visible then
  begin
    pnlMobile.Top := tPosition;
    pnlMobile.TabOrder := vTabOrder;
    Inc(vTabOrder);
  end;
  if pnlText.Visible then
  begin
    pnlText.Top := tPosition;
    lblText1.Visible := edtText1.Visible;
    if edtText1.Visible then
    begin
      pnlText.Height := edtText1.Top + edtText1.Height + 6;
    end
    else
      pnlText.Height := edtText.Top + edtText.Height + 6;

    pnlText.TabOrder := vTabOrder;
    Inc(vTabOrder);

    if pnlBidPay.Visible then
    begin
      ednFineSum.Visible := False;
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

end.
