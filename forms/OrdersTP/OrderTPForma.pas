﻿unit OrderTPForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.DateUtils,
  Data.DB,
  Vcl.StdCtrls, Vcl.Mask, Vcl.Controls, Vcl.Forms, Vcl.Graphics, Vcl.Dialogs, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Buttons,
  FIBDataSet, pFIBDataSet, FIBDatabase, DBGridEh, DBCtrlsEh, DBLookupEh, A4onTypeUnit, CnErrorProvider, ad3SpellBase,
  MemTableDataEh, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  MemTableEh,
  PropFilerEh, PropStorageEh, System.Actions, Vcl.ActnList, amSplitter;

type
  TOrderTPForm = class(TForm)
    dsOrderTP: TpFIBDataSet;
    srcOrderTP: TDataSource;
    dsOTPTypes: TpFIBDataSet;
    srcOTPTypes: TDataSource;
    CnErrors: TCnErrorProvider;
    pmSpell: TPopupMenu;
    miN1: TMenuItem;
    miN2: TMenuItem;
    miN3: TMenuItem;
    pnl3: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    pnlMain: TPanel;
    pnlText: TPanel;
    mmoText: TDBMemoEh;
    pnl2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl3: TLabel;
    edtAdress: TDBEditEh;
    edtPassport: TDBEditEh;
    edtFIO: TDBEditEh;
    edtPhone: TDBEditEh;
    pnlNumber: TPanel;
    lbl2: TLabel;
    lbl6: TLabel;
    edtNumber: TDBEditEh;
    edOTP_DATE: TDBDateTimeEditEh;
    pnl1: TPanel;
    lbl1: TLabel;
    lcbOTTP_TYPE: TDBLookupComboboxEh;
    pnlAddons: TPanel;
    pnlPeriod: TPanel;
    lbl7: TLabel;
    edFROM: TDBDateTimeEditEh;
    edTO: TDBDateTimeEditEh;
    srcAddons: TDataSource;
    mtAddons: TMemTableEh;
    dbgAddons: TDBGridEh;
    splitter: TSplitter;
    lblCharCNT: TLabel;
    lbl4: TLabel;
    ednAMOUNT: TDBNumberEditEh;
    lbl5: TLabel;
    edPAY_DATE: TDBDateTimeEditEh;
    miactCnPrefixWizard: TMenuItem;
    miactCnPrefixWizard1: TMenuItem;
    PropStorageEh: TPropStorageEh;
    btnPrint: TBitBtn;
    actlst1: TActionList;
    actPrint: TAction;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure lcbOTTP_TYPEChange(Sender: TObject);
    procedure mmoTextChange(Sender: TObject);
    procedure dsOrderTPBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure miN2Click(Sender: TObject);
    procedure miN3Click(Sender: TObject);
    procedure AddictSpellShowEndMessage(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edFROMChange(Sender: TObject);
    procedure edTOChange(Sender: TObject);
    procedure mtAddonsCalcFields(DataSet: TDataSet);
    procedure mtAddonsAfterPost(DataSet: TDataSet);
    procedure dbgAddonsExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnlAddonsResize(Sender: TObject);
    procedure mmoTextExit(Sender: TObject);
    function frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure actPrintExecute(Sender: TObject);
    procedure dsOrderTPAfterOpen(DataSet: TDataSet);
    procedure edtPhoneExit(Sender: TObject);
  private
    FCustomerInfo: TCustomerInfo;
    FReport: Integer;
    FCharCalc: Boolean;
    FCharCnt: Integer;
    FBasicCnt: Double;
    FMoreCnt: Double;
    FSingleSrv: Integer;
    FAfterOpen: Boolean;
    FInUpdateMode: Boolean;
    FOldService: Integer;
    FSpellCheck: Boolean;
    procedure SetCustomerInfo(ci: TCustomerInfo);
    function ParseJson(const json: String): Boolean;
    procedure PrintReport(const Preview: Boolean = True);
    procedure ExecuteAddons();
    function CheckData: Boolean;
    function CheckDataAndSave: Boolean;
    procedure RecalAmount;
    procedure SaveOrderAddons;
    procedure SaveContact;
    procedure SetInUpdateMode(const value: Boolean);
    procedure PreviewOrder;
    function GetCostOrder: Double;
    function FormatPhone(const phone: String; const SaveInError: Boolean = False): String;
  public
    property CustomerInfo: TCustomerInfo read FCustomerInfo write SetCustomerInfo;
    property InUpdateMode: Boolean write SetInUpdateMode;
    procedure MakeFrom(const FromOrder: Integer);
    procedure ShowAddons;
    procedure LoadOrderAddons(const jAddons: String);
    procedure AfterSave(const HandPrint: Boolean = False);
  end;

function CreateOrderTP(const aOTPID: Integer): Integer;
function CreateOrderTPForCustomer(const aOTPID: Integer; const ACustomerInfo: TCustomerInfo;
  const FromOrder: Integer = -1): Integer;

implementation

uses
  System.StrUtils, System.Math, System.MaskUtils,
  DM, PrjConst, JsonDataObjects, pFIBQuery, DBSumLst, MAIN, ReportPreview;

{$R *.dfm}

function StripNonConforming(const S: string; const ValidChars: TSysCharSet): string;
var
  DestI: Integer;
  SourceI: Integer;
begin
  SetLength(Result, Length(S));
  DestI := 0;
  for SourceI := 1 to Length(S) do
    if CharInSet(S[SourceI], ValidChars) then
    begin
      Inc(DestI);
      Result[DestI] := S[SourceI]
    end;
  SetLength(Result, DestI)
end;

function CountPhoneDigitPlace(const fmt: String): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to fmt.Length do
  begin
    if fmt[i] = '0' then
      Inc(Result);
  end
end;

function PlacePhoneDigit(const fmt: String; const digits: String): String;
var
  i, j: Integer;
begin
  Result := '';
  j := 1;
  for i := 1 to fmt.Length do
  begin
    if ((fmt[i] = '0') or (fmt[i] = digits[j])) then
    begin
      Result := Result + digits[j];
      Inc(j);
    end
    else
      Result := Result + fmt[i];
  end;
  if (j <= digits.Length) then
    Result := digits;
end;

function CheckFormat(const fmt: String; const str: String): Boolean;
var
  i: Integer;
begin
  Result := False;
  if (fmt.Length <> str.Length) then
    Exit;

  Result := True;
  i := 1;
  while (i <= fmt.Length) and Result do
  begin
    if (fmt[i] <> str[i]) and ((fmt[i] = '0') and (not CharInSet(str[i], ['0' .. '9']))) then
      Result := False;
    Inc(i);
  end
end;

function CreateOrderTP(const aOTPID: Integer): Integer;
var
  ACustomerInfo: TCustomerInfo;
begin
  ACustomerInfo.CUSTOMER_ID := -1;
  Result := CreateOrderTPForCustomer(aOTPID, ACustomerInfo);
end;

function CreateOrderTPForCustomer(const aOTPID: Integer; const ACustomerInfo: TCustomerInfo;
  const FromOrder: Integer = -1): Integer;
begin
  Result := -1;
  with TOrderTPForm.Create(Application) do
    try
      dsOTPTypes.Open;
      dsOrderTP.ParamByName('OTPId').AsInteger := aOTPID;
      dsOrderTP.Open;

      if aOTPID = -1 then
      begin
        InUpdateMode := False;
        dsOrderTP.Insert;
        dsOrderTP['OTP_DATE'] := Now();
        CustomerInfo := ACustomerInfo;
        MakeFrom(FromOrder);
      end
      else
      begin
        InUpdateMode := True;
        dsOrderTP.Edit;
        if not dsOrderTP.FieldByName('CUSTOMER_ID').IsNull then
          CustomerInfo := dmMain.FindCustomer('', '', dsOrderTP['CUSTOMER_ID']);

        ShowAddons;
        if (not dsOrderTP.FieldByName('Addons').IsNull) then
          LoadOrderAddons(dsOrderTP['Addons']);
        if not dsOrderTP.FieldByName('AMOUNT').IsNull then
          ednAMOUNT.value := dsOrderTP['AMOUNT'];
      end;

      if ShowModal = mrOk then
      begin
        try
          if dsOrderTP.State in [dsEdit, dsInsert] then
          begin
            dsOrderTP.Post;
            AfterSave;
          end
          else
          begin
            if (not lcbOTTP_TYPE.Text.ToUpper.Contains(rsFree.ToUpper)) then
              PrintReport();
          end;
          Result := dsOrderTP['OTP_ID'];
        except
          Result := -1;
        end;
      end
      else
      begin
        if dsOrderTP.State in [dsEdit, dsInsert] then
          dsOrderTP.Cancel;
      end;

      if dsOrderTP.Active then
        dsOrderTP.Close;
      if dsOTPTypes.Active then
        dsOTPTypes.Close;
    finally
      free
    end;
end;

procedure TOrderTPForm.dbgAddonsExit(Sender: TObject);
begin
  if mtAddons.State in [dsEdit] then
    mtAddons.Post;
end;

procedure TOrderTPForm.dsOrderTPAfterOpen(DataSet: TDataSet);
begin
  FAfterOpen := True;
end;

procedure TOrderTPForm.dsOrderTPBeforePost(DataSet: TDataSet);
begin
  if not VarIsNull(ednAMOUNT.value) then
    dsOrderTP['AMOUNT'] := ednAMOUNT.value;

  if (dsOrderTP.FieldByName('OTP_ID').IsNull or dsOrderTP['OTP_ID'] = -1) then
  begin
    dsOrderTP['OTP_ID'] := dmMain.dbTV.Gen_Id('GEN_ORDER_TP', 1, dmMain.trWriteQ);
  end;
end;

procedure TOrderTPForm.edFROMChange(Sender: TObject);
begin
  RecalAmount;
end;

procedure TOrderTPForm.edTOChange(Sender: TObject);
begin
  RecalAmount;
end;

procedure TOrderTPForm.edtPhoneExit(Sender: TObject);
var
  S: string;
begin
  S := FormatPhone(edtPhone.Text);
  if not S.IsEmpty then
  begin
    edtPhone.Text := S;
    CnErrors.Dispose(edtPhone);
  end
  else
  begin
    S := #13#10 + Trim(dmMain.GetSettingsValue('MOBILE_FMT') + #13#10 + dmMain.GetSettingsValue('PHONE_FMT'));
    CnErrors.SetError(edtPhone, Format(rsINPUT_VALUE_FORMAT, [S]), iaMiddleLeft, bsNeverBlink);
  end
end;

procedure TOrderTPForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  if A4MainForm.AddictSpell.Tag = 1 then
  begin
    A4MainForm.AddictSpell.RemoveControl(mmoText);
    A4MainForm.AddictSpell.OnShowEndMessage := nil;
  end;

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, False);
  // Action := caFree;
end;

procedure TOrderTPForm.FormCreate(Sender: TObject);
var
  i: Integer;
  Font_size: Integer;
  Font_name: string;
  Row_height: Integer;
begin
  FOldService := -1;
  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBMemoEh then
    begin
      if Font_size <> 0 then
      begin
        (Components[i] as TDBMemoEh).Font.Name := Font_name;
        (Components[i] as TDBMemoEh).Font.Size := Font_size;
      end;
    end
    else
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
        if Row_height <> 0 then
        begin
          (Components[i] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
          (Components[i] as TDBGridEh).RowHeight := Row_height;
        end;
      end
      else if Font_size <> 0 then
      begin
        if (Components[i] is TMemo) then
        begin
          (Components[i] as TMemo).Font.Name := Font_name;
          (Components[i] as TMemo).Font.Size := Font_size;
        end
        else if (Components[i] is TDBMemoEh) then
        begin
          (Components[i] as TDBMemoEh).Font.Name := Font_name;
          (Components[i] as TDBMemoEh).Font.Size := Font_size;
        end
        else if (Components[i] is TDBMemo) then
        begin
          (Components[i] as TDBMemo).Font.Name := Font_name;
          (Components[i] as TDBMemo).Font.Size := Font_size;
        end;
      end
    end;
  end;
  Font_name := '';
  Font_name := dmMain.GetSettingsValue('MOBILE_FMT');
  if Font_name.IsEmpty then
  begin
    edtPhone.EmptyDataInfo.Text := rsClmnMobilePhone;
  end
  else
  begin
    edtPhone.EditMask := Font_name + ';1;_';
    edtPhone.EmptyDataInfo.Text := '';
  end

end;

procedure TOrderTPForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    btnOkClick(Sender);
end;

procedure TOrderTPForm.FormShow(Sender: TObject);
begin
  btnOk.Enabled := dmMain.AllowedAction(rght_OrdersTP_full);
  if (dsOrderTP.State = dsInsert) then
    btnOk.Enabled := (btnOk.Enabled or dmMain.AllowedAction(rght_OrdersTP_add))
  else if (dsOrderTP.State = dsEdit) then
    btnOk.Enabled := (btnOk.Enabled or dmMain.AllowedAction(rght_OrdersTP_edit));

  actPrint.Visible := btnOk.Enabled;

  if A4MainForm.AddictSpell.Tag = 1 then
  begin
    A4MainForm.AddictSpell.AddControl(mmoText);
    A4MainForm.AddictSpell.OnShowEndMessage := AddictSpellShowEndMessage;
    FSpellCheck := False;
  end
  else
    FSpellCheck := True;

  if FInUpdateMode then
  begin
    mmoText.SetFocus;
    mmoText.SelStart := mmoText.Text.Length;
    mmoText.SelLength := 0;
  end;
end;

function TOrderTPForm.frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
begin
  Result := dmMain.frxReportUserFunction(MethodName, Params);
end;

procedure TOrderTPForm.lcbOTTP_TYPEChange(Sender: TObject);
begin
  ShowAddons;
end;

procedure TOrderTPForm.miN2Click(Sender: TObject);
begin
  A4MainForm.AddictSpell.CheckWinControl(mmoText, ctAll);
end;

procedure TOrderTPForm.miN3Click(Sender: TObject);
begin
  A4MainForm.AddictSpell.Setup;
end;

procedure TOrderTPForm.mmoTextChange(Sender: TObject);
begin
  RecalAmount;
end;

procedure TOrderTPForm.mmoTextExit(Sender: TObject);
begin
  if (dsOrderTP.State in [dsInsert, dsEdit]) and (mmoText.Lines.Text.Trim <> mmoText.Lines.Text) then
    mmoText.Lines.Text := mmoText.Lines.Text.Trim;
end;

procedure TOrderTPForm.mtAddonsAfterPost(DataSet: TDataSet);
begin
  RecalAmount;
end;

procedure TOrderTPForm.mtAddonsCalcFields(DataSet: TDataSet);
var
  d: Integer;
  k: Double;
begin
  if (not DataSet.FieldByName('rc').IsNull) then
    k := DataSet.FieldByName('rc').AsFloat
  else
    k := 1;

  if (not(DataSet.FieldByName('qnt').IsNull or DataSet.FieldByName('cost').IsNull)) then
  begin
    d := 1;
    if ((not DataSet.FieldByName('dc').IsNull) and (DataSet.FieldByName('dc').AsInteger = 1)) then
    begin
      if pnlPeriod.Visible and (not(VarIsNull(edFROM.value) or VarIsNull(edTO.value))) then
      begin
        d := (DaysBetween(edTO.value, edFROM.value) + 1);
      end
      else
        d := 0;
    end;

    DataSet['itog'] := DataSet['qnt'] * DataSet['cost'] * d * k;
  end
  else
    DataSet.FieldByName('itog').Clear;
end;

function TOrderTPForm.CheckDataAndSave: Boolean;
var
  allright: Boolean;
begin
  Result := False;
  if not(dmMain.AllowedAction(rght_OrdersTP_full) or dmMain.AllowedAction(rght_OrdersTP_add) or
    dmMain.AllowedAction(rght_OrdersTP_edit)) then
    Exit;

  if ((FInUpdateMode) and (not(dmMain.AllowedAction(rght_OrdersTP_full) or dmMain.AllowedAction(rght_OrdersTP_edit))))
  then
    Exit
  else
  begin
    if ((not FInUpdateMode) and (not(dmMain.AllowedAction(rght_OrdersTP_full) or
      dmMain.AllowedAction(rght_OrdersTP_add)))) then
      Exit;
  end;

  if not FSpellCheck then
    A4MainForm.AddictSpell.CheckWinControl(mmoText, ctAll);

  allright := CheckData;
  if allright and FSpellCheck then
  begin
    // Post;
    SaveContact;
    SaveOrderAddons;
    Result := True;
  end;
end;

function TOrderTPForm.CheckData: Boolean;
var
  errors: Boolean;
  NotFullRight: Boolean;
  PhoneCorrect: Boolean;
  S: string;
begin
  errors := False;

  if (edtFIO.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(edtFIO, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtFIO);

  if VarIsNull(ednAMOUNT.value) then
  begin
    errors := True;
    CnErrors.SetError(ednAMOUNT, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(ednAMOUNT);

  if (lcbOTTP_TYPE.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(lcbOTTP_TYPE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(lcbOTTP_TYPE);

  if VarIsNull(edOTP_DATE.value) then
  begin
    errors := True;
    CnErrors.SetError(edOTP_DATE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edOTP_DATE);

  if (edtPhone.Text.IsEmpty) then
  begin
    errors := True;
    CnErrors.SetError(edtPhone, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
  begin
    S := dmMain.GetSettingsValue('MOBILE_FMT');
    PhoneCorrect := (not S.IsEmpty) and (CheckFormat(S, edtPhone.Text));

    if not PhoneCorrect then
    begin
      S := dmMain.GetSettingsValue('PHONE_FMT');
      PhoneCorrect := (not S.IsEmpty) and (CheckFormat(S, edtPhone.Text));
    end;

    if not PhoneCorrect then
    begin
      errors := True;
      S := #13#10 + Trim(dmMain.GetSettingsValue('MOBILE_FMT') + #13#10 + dmMain.GetSettingsValue('PHONE_FMT'));
      CnErrors.SetError(edtPhone, Format(rsINPUT_VALUE_FORMAT, [S]), iaMiddleLeft, bsNeverBlink);
    end
    else
      CnErrors.Dispose(edtPhone);
  end;

  CnErrors.Dispose(edTO);
  CnErrors.Dispose(edFROM);
  if (pnlPeriod.Visible) then
  begin
    NotFullRight := (not dmMain.AllowedAction(rght_Dictionary_full));
    if (VarIsNull(edFROM.value)) or ((edFROM.value < Date()) and NotFullRight) then
    begin
      errors := True;
      CnErrors.SetError(edFROM, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end;

    if VarIsNull(edTO.value) or (edTO.value < edFROM.value) or ((edTO.value < Date()) and NotFullRight) then
    begin
      errors := True;
      CnErrors.SetError(edTO, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end;
  end;

  CnErrors.Dispose(mmoText);
  if (FCharCalc) then
  begin
    if (mmoText.Lines.Text.Trim = '') then
    begin
      errors := True;
      CnErrors.SetError(mmoText, rsEmptyFieldError, iaTopCenter, bsNeverBlink);
    end;
  end;

  Result := not errors;
end;

procedure TOrderTPForm.SetCustomerInfo(ci: TCustomerInfo);
begin
  FCustomerInfo := ci;
  if ci.CUSTOMER_ID > -1 then
  begin
    dsOrderTP['CUSTOMER_ID'] := ci.CUSTOMER_ID;
    if edtFIO.Text.IsEmpty then
      edtFIO.Text := Copy(ci.FIO, 1, 255);
    if edtAdress.Text.IsEmpty then
      edtAdress.Text := Copy(Trim(ci.STREET + ' ' + ci.HOUSE_no + ' ' + ci.FLAT_NO), 1, 500);
    // if edtPhone.Text.IsEmpty then
    // edtPhone.Text := Copy(Trim(ci.phone_no + ' ' + ci.mobile), 1, 50);
    if mmoText.Lines.Text.IsEmpty then
      mmoText.Lines.Text := ci.notice;
    ShowAddons;
  end
  else
    dsOrderTP.FieldByName('CUSTOMER_ID').Clear;
end;

function TOrderTPForm.ParseJson(const json: String): Boolean;
var
  JO: TJsonObject;
  i: Integer;
  ShowPanel: Boolean;
  ShowK: Boolean;
  ShowD: Boolean;
begin
  ShowPanel := False;
  JO := TJsonObject.Parse(json) as TJsonObject;
  try
    if JO.Contains('CharCalc') then
    begin
      if not JO['CharCalc'].IsNull then
        FCharCalc := JO.B['CharCalc'];
    end;
    if JO.Contains('CCnt') then
    begin
      if not JO['CCnt'].IsNull then
        FCharCnt := JO.i['CCnt'];
    end;
    if JO.Contains('BCost') then
    begin
      if not JO['BCost'].IsNull then
        FBasicCnt := JO.F['BCost'];
    end;
    if JO.Contains('MCost') then
    begin
      if not JO['MCost'].IsNull then
        FMoreCnt := JO.F['MCost'];
    end;
    if JO.Contains('MaxC') then
    begin
      if not JO['MaxC'].IsNull then
        mmoText.MaxLength := JO.i['MaxC'];
    end;
    if JO.Contains('report') then
    begin
      if not JO['report'].IsNull then
        FReport := JO.i['report'];
    end;
    if JO.Contains('SnglSrv') then
    begin
      if not JO['SnglSrv'].IsNull then
      begin
        FSingleSrv := JO.i['SnglSrv'];
        if FAfterOpen then
        begin
          // запомним старую услугу после открытием
          FOldService := FSingleSrv;
          FAfterOpen := False;
        end;
      end;
    end;

    if JO.Contains('Period') then
    begin
      ShowPanel := True;
      if not JO['Period'].IsNull then
      begin
        pnlPeriod.Visible := JO.B['Period'];
      end;
    end;

    if JO.Contains('Params') then
    begin
      ShowPanel := True;
      mtAddons.Open;
      mtAddons.EmptyTable;
      mtAddons.DisableControls;
      ShowK := False;
      ShowD := False;
      for i := 0 to JO.A['Params'].Count - 1 do
      begin
        mtAddons.Append;
        mtAddons['name'] := JO.A['Params'].O[i].S['name'];
        mtAddons['cost'] := JO.A['Params'].O[i].F['cost'];
        if JO.A['Params'].O[i].Contains('dc') then
        begin
          mtAddons['dc'] := JO.A['Params'].O[i].i['dc'];
          ShowD := ShowD or (JO.A['Params'].O[i].i['dc'] = 1);
        end
        else
          mtAddons['dc'] := 0;
        if JO.A['Params'].O[i].Contains('rc') then
        begin
          ShowK := ShowK or (JO.A['Params'].O[i].i['rc'] = 1);
          mtAddons['NeedK'] := (JO.A['Params'].O[i].i['rc'] = 1);
        end
        else
          mtAddons['NeedK'] := 0;
        mtAddons.Post;
      end;

      dbgAddons.FieldColumns['dc'].Visible := ShowK;
      dbgAddons.FieldColumns['rc'].Visible := ShowK;
      mtAddons.First;
      mtAddons.EnableControls;
    end;
  finally
    JO.free;
  end;
  Result := ShowPanel;
end;

procedure TOrderTPForm.pnlAddonsResize(Sender: TObject);
begin
  if dbgAddons.Visible then
  begin
    dbgAddons.Height := pnlAddons.Height - dbgAddons.Top - 6;
  end;
end;

procedure TOrderTPForm.ShowAddons;
begin
  FReport := -1;
  FCharCalc := False;
  FCharCnt := 0;
  FBasicCnt := 0;
  FMoreCnt := 0;
  FSingleSrv := -1;
  mmoText.MaxLength := 1000;

  pnlAddons.Visible := False;

  if lcbOTTP_TYPE.Text.IsEmpty then
    Exit;

  if lcbOTTP_TYPE.Text.ToUpper.Contains(rsFree.ToUpper) then
  begin
    edPAY_DATE.Enabled := False;
    edPAY_DATE.EmptyDataInfo.Text := rsFree;
  end
  else
  begin
    if FCustomerInfo.CUSTOMER_ID > 0 then
    begin
      edPAY_DATE.Enabled := dmMain.UserIsAdmin;
      edPAY_DATE.EmptyDataInfo.Text := rsSetPayDate;
    end
    else
    begin
      edPAY_DATE.Enabled := True;
      edPAY_DATE.EmptyDataInfo.Text := '';
    end;
  end;

  pnlPeriod.Visible := False;
  if mtAddons.Active then
  begin
    mtAddons.EmptyTable;
    mtAddons.Close;
  end;

  if (not dsOTPTypes.FieldByName('O_CHARFIELD').IsNull) then
  begin
    ParseJson(dsOTPTypes['O_CHARFIELD']);
  end;

  // сделано так чтоб сплиттер оставвался на месте
  if (pnlPeriod.Visible or mtAddons.Active) then
  begin
    pnlAddons.Visible := True;
    splitter.Visible := True;
  end
  else
  begin
    splitter.Visible := False;
    pnlAddons.Visible := False;
  end;

  dbgAddons.Visible := mtAddons.Active;
  pnlAddonsResize(Self);

  // не нужно устанавливать дату. пусть сами ставят
  if (dsOrderTP.State in [dsInsert]) then
  begin
    if pnlPeriod.Visible then
    begin
      dsOrderTP['DATE_FROM'] := Date() + 1;
      // dsOrderTP['DATE_TO'] := Date()+1;
    end
    else
    begin
      dsOrderTP.FieldByName('DATE_FROM').Clear;
      // dsOrderTP.FieldByName('DATE_TO').Clear;
    end;
  end;
  RecalAmount;
  ednAMOUNT.ReadOnly := pnlAddons.Visible;
end;

procedure TOrderTPForm.PrintReport(const Preview: Boolean = True);
var
  vi: Integer;
  Order_id: Integer;
begin
  // если редактируем объявление, то не будем печатать бланк
  if FInUpdateMode and Preview then
    Exit;

  if dsOrderTP.FieldByName('OTP_ID').IsNull then
    Exit;

  Order_id := dsOrderTP['OTP_ID'];
  if (FReport < 0) or (Order_id < 0) then
    Exit;

  with TReportChild.Create(Application) do
  begin
    REPORT_ID := FReport;
    LoadReportBody;
    vi := GetVariableID('ORDER_ID');
    if vi > 0 then
    begin
      SetVariable('ORDER_ID', Order_id);
    end;

    if Preview then
    begin
      ShowReportBody;
      Show;
    end
    else
    begin
      PrepareReport;
      PrintReport;
      Close;
    end;
  end;
end;

procedure TOrderTPForm.actPrintExecute(Sender: TObject);
begin
  PreviewOrder
end;

procedure TOrderTPForm.AddictSpellShowEndMessage(Sender: TObject);
begin
  FSpellCheck := True;
end;

procedure TOrderTPForm.AfterSave(const HandPrint: Boolean = False);
begin
  if dsOrderTP.FieldByName('OTP_ID').IsNull then
    Exit;
  ExecuteAddons;
  // если бесплатноЮ, то не печатаю шаблон заказа
  if (not lcbOTTP_TYPE.Text.ToUpper.Contains(rsFree.ToUpper)) or (HandPrint) then
    PrintReport(not HandPrint);
end;

procedure TOrderTPForm.btnOkClick(Sender: TObject);
begin
  if CheckDataAndSave then
    ModalResult := mrOk
  else
    ModalResult := mrNone;
end;

procedure TOrderTPForm.ExecuteAddons;
var
  Save_Cursor: TCursor;
  Order_id: Integer;
  S: String;
  qnt: Double;
begin
  if dsOrderTP.FieldByName('OTP_ID').IsNull then
    Exit;
  Order_id := dsOrderTP['OTP_ID'];
  if (Order_id = -1) or (FSingleSrv = -1) then
    Exit;
  if FCustomerInfo.CUSTOMER_ID = -1 then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;

        // если ранее были начисления за это объявление. удалим
        if FOldService <> -1 then
        begin
          sql.Text := 'DELETE FROM SINGLE_SERV WHERE Customer_Id = :CID and Service_Id = :SID and HISTORY_ID = :HID';
          ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
          ParamByName('SID').AsInteger := FOldService;
          ParamByName('HID').AsInteger := dsOrderTP['OTP_ID'];
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
        end;

        if FOldService <> FSingleSrv then
        begin
          sql.Text := 'DELETE FROM SINGLE_SERV WHERE Customer_Id = :CID and Service_Id = :SID and HISTORY_ID = :HID';
          ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
          ParamByName('SID').AsInteger := FSingleSrv;
          ParamByName('HID').AsInteger := dsOrderTP['OTP_ID'];
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
        end;

        // сохраним начисления как разовую услугу абоненту
        qnt := IfThen((not VarIsNull(ednAMOUNT.value)), ednAMOUNT.value, 1.0);
        sql.Text := 'execute procedure Add_Single_Service(:CID, :SID, :Units, :date, :Notice, :HID)';
        ParamByName('CID').AsInteger := FCustomerInfo.CUSTOMER_ID;
        ParamByName('SID').AsInteger := FSingleSrv;
        ParamByName('date').AsDate := dsOrderTP['OTP_DATE'];
        ParamByName('HID').AsInteger := dsOrderTP['OTP_ID'];
        ParamByName('Units').AsDouble := qnt;
        S := IfThen(edtNumber.Text.IsEmpty, dsOrderTP.FieldByName('OTP_ID').AsString, edtNumber.Text);
        S := rsOrderN + S + ' '#13#10 + lcbOTTP_TYPE.Text + ' '#13#10 + edtFIO.Text + ' '#13#10 + edtAdress.Text +
          ' '#13#10 + qnt.ToString;
        ParamByName('Notice').AsString := S;

        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        free;
      end;
    end;
  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TOrderTPForm.RecalAmount;
var
  cost, gc: Double;
  c, d, sl: Integer;
  charcost: Double;
  bm: TBookmark;
  k: Double;
begin
  cost := 0;

  d := 0;
  if pnlPeriod.Visible and (not(VarIsNull(edFROM.value) or VarIsNull(edTO.value))) then
  begin
    d := (DaysBetween(edTO.value, edFROM.value) + 1);
  end;

  if mtAddons.Active then
  begin
    // cost := dbgAddons.SumList.SumCollection.GetSumByOpAndFName(goSum, 'itog').SumValue;
    mtAddons.DisableControls;
    bm := mtAddons.GetBookmark;
    mtAddons.First;
    while not mtAddons.Eof do
    begin
      gc := 0;
      if (not(mtAddons.FieldByName('qnt').IsNull or mtAddons.FieldByName('cost').IsNull)) then
      begin
        mtAddons.AfterPost := nil;
        mtAddons.Edit;
        mtAddons['qnt'] := mtAddons['qnt'];
        mtAddons.Post;
        mtAddons.AfterPost := mtAddonsAfterPost;
        gc := mtAddons['qnt'] * mtAddons['cost'];
      end;
      if (not mtAddons.FieldByName('rc').IsNull) then
        k := mtAddons.FieldByName('rc').AsFloat
      else
        k := 1;
      gc := gc * k;
      if ((not mtAddons.FieldByName('dc').IsNull) and (mtAddons['dc'] = 1)) then
      begin
        gc := gc * d;
      end;
      cost := cost + gc;
      mtAddons.Next;
    end;
    mtAddons.GotoBookmark(bm);
    mtAddons.EnableControls;
  end;

  if FCharCalc then
  begin
    c := mmoText.Lines.Text.Trim.Length;
    charcost := FBasicCnt;
    c := c - FCharCnt;
    if (c > 0) then
      charcost := charcost + c * FMoreCnt;

    if d > 0 then
    begin
      cost := cost + charcost * d;
    end
    else
      cost := cost + charcost;
  end;

  c := mmoText.Lines.Text.Trim.Length;
  sl := Trunc(c / 300);
  if (c - sl * 300) > 0 then
    sl := sl + 1;

  lblCharCNT.Caption := Format(rsAdCharCount, [c, sl, d]);
  // FCharCnt,FBasicCnt, FMoreCnt]);

  ednAMOUNT.value := cost;
end;

procedure TOrderTPForm.LoadOrderAddons(const jAddons: String);
var
  JO: TJsonObject;
  i: Integer;
  ShowPanel: Boolean;
begin
  ShowPanel := False;
  JO := TJsonObject.Parse(jAddons) as TJsonObject;
  try
    if JO.Contains('ps') then
    begin
      pnlPeriod.Visible := True;
      ShowPanel := True;
      if (dsOrderTP.FieldByName('DATE_FROM').IsNull) then
        edFROM.value := JO.d['ps'];
    end;

    if JO.Contains('pe') then
    begin
      pnlPeriod.Visible := True;
      ShowPanel := True;
      if (dsOrderTP.FieldByName('DATE_TO').IsNull) then
        edTO.value := JO.d['pe'];
    end;

    if JO.Contains('add') then
    begin
      ShowPanel := True;
      if not mtAddons.Active then
        mtAddons.Open;
      mtAddons.DisableControls;
      for i := 0 to JO.A['add'].Count - 1 do
      begin
        if mtAddons.Locate('name', JO.A['add'].O[i].S['n'], []) then
        begin
          mtAddons.Edit;
          mtAddons['qnt'] := JO.A['add'].O[i].F['q'];
          if JO.A['add'].O[i].Contains('r') then
            mtAddons['rc'] := JO.A['add'].O[i].F['r'];
          mtAddons.Post;
        end
        else
        begin
          mtAddons.Append;
          mtAddons['name'] := JO.A['add'].O[i].S['n'];
          mtAddons['cost'] := JO.A['add'].O[i].F['c'];
          mtAddons['qnt'] := JO.A['add'].O[i].F['q'];
          if JO.A['add'].O[i].Contains('d') then
            mtAddons['dc'] := JO.A['add'].O[i].F['d'];
          if JO.A['add'].O[i].Contains('r') then
            mtAddons['rc'] := JO.A['add'].O[i].F['r'];
          mtAddons.Post;
        end;
      end;
      mtAddons.First;
      mtAddons.EnableControls;
    end;
  finally
    JO.free;
  end;

  pnlAddons.Visible := ShowPanel;
end;

procedure TOrderTPForm.SaveContact;
var
  phone: TContact;
  S: string;
begin
  if (FCustomerInfo.CUSTOMER_ID < 0) or (edtPhone.Text.IsEmpty) then
    Exit;

  phone.Contact := edtPhone.Text;
  phone.CustID := FCustomerInfo.CUSTOMER_ID;
  phone.cID := 0;
  phone.Notify := 0;

  if ((pos(phone.Contact, FCustomerInfo.phone_no) > 0) or (pos(phone.Contact, FCustomerInfo.mobile) > 0)) then
    Exit;

  phone.notice := edtFIO.Text;

  S := dmMain.GetSettingsValue('MOBILE_FMT');
  if (S.Length = phone.Contact.Length) then
    phone.cID := 1;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      sql.Text := 'execute procedure Customer_Contacts_Iu(:CID, :CV, :CT, :Notice, :Notify)';
      ParamByName('CId').AsInteger := phone.CustID;
      ParamByName('CV').AsString := phone.Contact;
      ParamByName('CT').AsInteger := phone.cID;
      ParamByName('Notify').AsInteger := phone.Notify;
      ParamByName('Notice').AsString := phone.notice;
      Transaction.StartTransaction;
      ExecQuery;
      Close;
      Transaction.Commit;
    finally
      free;
    end;
  end;
end;

procedure TOrderTPForm.SaveOrderAddons;
var
  JO, O: TJsonObject;
begin
  if not pnlAddons.Visible then
    dsOrderTP.FieldByName('Addons').Clear
  else
  begin
    JO := TJsonObject.Create;
    try
      if pnlPeriod.Visible then
      begin
        if not VarIsNull(edFROM.value) then
          JO.d['ps'] := edFROM.value;
        if not VarIsNull(edTO.value) then
          JO.d['pe'] := edTO.value;
      end;

      if (mtAddons.Active and (mtAddons.RecordCount > 0)) then
      begin
        mtAddons.DisableControls;
        mtAddons.First;
        while not mtAddons.Eof do
        begin
          if (not mtAddons.FieldByName('qnt').IsNull) and (mtAddons['qnt'] <> 0) then
          begin
            O := TJsonObject.Create;
            O.S['n'] := mtAddons['name'];
            O.F['c'] := mtAddons['cost'];
            O.F['q'] := mtAddons['qnt'];
            if (not mtAddons.FieldByName('dc').IsNull) and (mtAddons['dc'] <> 0) then
              O.F['d'] := mtAddons['dc'];
            if (not mtAddons.FieldByName('rc').IsNull) then
              O.F['r'] := mtAddons['rc'];
            JO.A['add'].Add(O);
          end;
          mtAddons.Next;
        end;
        mtAddons.EnableControls;
      end;
      if FSingleSrv > -1 then
        JO['srv'] := FSingleSrv;

      dsOrderTP['Addons'] := JO.ToString;
    finally
      JO.free;
    end;
  end;
end;

procedure TOrderTPForm.MakeFrom(const FromOrder: Integer);
var
  Save_Cursor: TCursor;
begin
  if FromOrder = -1 then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    with TpFIBQuery.Create(Self) do
    begin
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        sql.Text := 'select Ottp_Type, Fio, Adress, Passport, Phone, Notice, Customer_Id, addons ' +
          ' from Orders_Tp where Otp_Id = :Otp_Id';
        ParamByName('Otp_Id').AsInteger := FromOrder;
        Transaction.StartTransaction;
        ExecQuery;
        if not FN('Ottp_Type').IsNull then
          dsOrderTP['Ottp_Type'] := FN('Ottp_Type').AsInteger;
        if not FN('Customer_Id').IsNull then
        begin
          FCustomerInfo.CUSTOMER_ID := FN('Customer_Id').AsInteger;
          dsOrderTP['Customer_Id'] := FCustomerInfo.CUSTOMER_ID;
        end
        else
          FCustomerInfo.CUSTOMER_ID := -1;
        if not FN('Fio').IsNull then
          dsOrderTP['Fio'] := FN('Fio').AsString
        else
          dsOrderTP['Fio'] := '';
        if not FN('Adress').IsNull then
          dsOrderTP['Adress'] := FN('Adress').AsString
        else
          dsOrderTP['Adress'] := '';
        if not FN('Passport').IsNull then
          dsOrderTP['Passport'] := FN('Passport').AsString
        else
          dsOrderTP['Passport'] := '';
        if not FN('Notice').IsNull then
          dsOrderTP['Notice'] := FN('Notice').AsString
        else
          dsOrderTP['Notice'] := '';
        if not FN('addons').IsNull then
          LoadOrderAddons(FN('addons').AsString);
        Close;
        Transaction.Commit;
      finally
        free;
      end;
    end;
  finally
    Screen.Cursor := Save_Cursor;
  end;
end;

procedure TOrderTPForm.SetInUpdateMode(const value: Boolean);
begin
  FInUpdateMode := value;
  if FInUpdateMode then
    FOldService := FSingleSrv;
end;

procedure TOrderTPForm.PreviewOrder;
var
  ReportID, i: Integer;
  FILENAME: String;
begin
  FILENAME := 'PreviewOrder';
  // Загрузим отчет из БД
  ReportID := dmMain.GET_ID_REPORT_BY_PATH(FILENAME);
  if ReportID < 0 then
  begin
    Exit;
  end;

  // Отчет есть, значит подставим переменные и покажем
  with TReportChild.Create(Application) do
  begin
    REPORT_ID := ReportID;
    LoadReportBody;

    i := GetVariableID('CUSTOMER_ID');
    if i > 0 then
      SetVariable('CUSTOMER_ID', CustomerInfo.CUSTOMER_ID);

    i := GetVariableID('TEXT');
    if i > 0 then
      SetVariable('TEXT', '''' + mmoText.Lines.Text + '''');

    i := GetVariableID('COST');
    if i > 0 then
      SetVariable('COST', GetCostOrder);

    PrepareReport;
    PrintReport;
    Close;
  end;
end;

function TOrderTPForm.GetCostOrder: Double;
begin
  RecalAmount;
  Result := IfThen((not VarIsNull(ednAMOUNT.value)), ednAMOUNT.value, 0);
end;

function TOrderTPForm.FormatPhone(const phone: String; const SaveInError: Boolean = False): String;
var
  strDigit, fmtPhone: string;
  fmt: string;
  dp: Integer;
  digitSet: TSysCharSet;
  findFormat: Boolean;
begin
  digitSet := ['0' .. '9'];
  if SaveInError then
    Result := phone
  else
    Result := '';

  findFormat := False;
  fmt := dmMain.GetSettingsValue('MOBILE_FMT');
  if (CheckFormat(fmt, phone)) then
  begin
    Result := phone;
    findFormat := True;
  end
  else
  begin
    strDigit := StripNonConforming(phone, digitSet);
    dp := CountPhoneDigitPlace(fmt);
    if (strDigit.Length = dp) or (strDigit.Length = StripNonConforming(fmt, digitSet).Length) then
    begin
      fmtPhone := PlacePhoneDigit(fmt, strDigit);
      Result := fmtPhone;
      findFormat := True;
    end
  end;

  if not findFormat then
  begin
    fmt := dmMain.GetSettingsValue('PHONE_FMT');
    if (CheckFormat(fmt, phone)) then
    begin
      Result := phone;
    end
    else
    begin
      strDigit := StripNonConforming(phone, digitSet);
      dp := CountPhoneDigitPlace(fmt);
      if (strDigit.Length = dp) or (strDigit.Length = StripNonConforming(fmt, digitSet).Length) then
      begin
        fmtPhone := PlacePhoneDigit(fmt, strDigit);
        Result := fmtPhone;
      end
    end;
  end
end;

end.
