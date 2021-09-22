unit EditCFileForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, DBGridEh, StdCtrls,
  DBCtrls, Mask, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery,
  PrjConst, System.UITypes, Vcl.Buttons, FIBDatabase, pFIBDatabase,
  A4onTypeUnit, PropFilerEh, PropStorageEh, Vcl.ExtCtrls;

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
    lblFileCh: TLabel;
    edtFILE: TDBEditEh;
    btnScaner: TButton;
    edtNAME: TDBEditEh;
    dbluFileType: TDBLookupComboboxEh;
    lblFile: TLabel;
    Label2: TLabel;
    pnlClient: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    memNotice: TDBMemoEh;
    pnlAddons: TPanel;
    edDate: TDBDateTimeEditEh;
    lcbService: TDBLookupComboboxEh;
    lcbOnOffSrv: TDBLookupComboboxEh;
    lblOnOff: TLabel;
    dsService: TpFIBDataSet;
    srcService: TDataSource;
    dsOnOffService: TpFIBDataSet;
    srcOnOffService: TDataSource;
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
  private
    FNeedDelete: Boolean;
    FFileForSave: String;
    FCustomerInfo: TCustomerInfo;
    FNeedSrv: Boolean;
    FIsOff: Integer;
    FOpenInet: Boolean;
    FReqType: Integer;
    FReqTempl: Integer;
    function FieldsToStr(const str: string): string;
    procedure ShowAddons;
    procedure ParseJson(const json: String);
    function CheckAddons(const errors: Boolean): Boolean;
    procedure ExecuteAddons;
    procedure UpdateNotice;
  public
    property CustomerInfo: TCustomerInfo read FCustomerInfo write FCustomerInfo;
    property FileForSave: String read GetFile write SetFile;
  end;

function EditFile(const ci: TCustomerInfo; const Name: string; const CF_ID: Integer = -1;
  const FileName: String = ''): Boolean;

implementation

uses DM, JsonDataObjects, pFIBQuery, StrUtils,
  ScanImageForma, BillEditForma, RequestNewForma;

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
        dsCustFile.Insert
      else
        dsCustFile.Edit;

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
        dsCustFile.Post;
        if ForInsert then
          ExecuteAddons;

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
  fs: TFormatSettings;
begin
  s := str;
  result := s;
  if s.IsEmpty then
    Exit;
  fs.DecimalSeparator := '.';
  // fs.ThousandSeparator := ;
  s := ReplaceStr(s, rsFldACCOUNT, FCustomerInfo.Account_No);
  s := ReplaceStr(s, rsFldBalance, FloatToStr(-1 * FCustomerInfo.Debt_sum, fs));
  s := ReplaceStr(s, rsFldSTREET, FCustomerInfo.STREET);
  s := ReplaceStr(s, rsFldHouse, FCustomerInfo.HOUSE_no);
  s := ReplaceStr(s, rsFldFlat, FCustomerInfo.FLAT_NO);
  s := ReplaceStr(s, rsFldFULLNAME, FCustomerInfo.FIO);
  s := ReplaceStr(s, rsFldCodeAbonent, FCustomerInfo.cust_code);
  s := ReplaceStr(s, rsFldOperator, dmMain.UserFIO);
  s := ReplaceStr(s, rsFldCurrentDate, FormatDateTime('dd.mm.yyyy', NOW()));
  if pnlAddons.Visible then
  begin
    if not lcbService.Text.IsEmpty then
      s := ReplaceStr(s, rsFldFileSrv, lcbService.Text);
    if not lcbOnOffSrv.Text.IsEmpty then
      s := ReplaceStr(s, rsFldFileOnOffSrv, lcbOnOffSrv.Text);
    if not VarIsNull(edDate.value) then
      s := ReplaceStr(s, rsFldFileDate, edDate.Text);
  end;
  result := s;
end;

procedure TEditCFileForm.btnOkClick(Sender: TObject);
var
  errors: Boolean;
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

  errors := CheckAddons(errors);

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
  NeedSave: Boolean;
begin
  FileName := ScanDocument(False, NeedSave);
  if not FileName.IsEmpty then
  begin
    FileForSave := FileName;
    edtFILE.Text := ExtractFileName(ChangeFileExt(FileName, '.jpg'));
    edtFILE.Enabled := False;
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

procedure TEditCFileForm.edDateChange(Sender: TObject);
begin
  UpdateNotice;
end;

procedure TEditCFileForm.edtFILEEditButtons0Click(Sender: TObject; var Handled: Boolean);
begin
  if dlgOpen.Execute then
  begin
    FileForSave := dlgOpen.FileName;
  end;

  Handled := true;
end;

procedure TEditCFileForm.FormCreate(Sender: TObject);
begin
  FNeedDelete := False;
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
  pnlAddons.Visible := False;
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
  v: Boolean;
begin
  v := (CustomerInfo.CUSTOMER_ID > 0);
  v := v and (not dsFiles.FieldByName('O_CHARFIELD').IsNull);
  pnlAddons.Visible := v;

  if v then
  begin
    ParseJson(dsFiles['O_CHARFIELD']);
  end;
end;

procedure TEditCFileForm.ParseJson(const json: String);
var
  JO: TJsonObject;
  srv_state: Integer;
begin
  srv_state := -1;
  JO := TJsonObject.Parse(json) as TJsonObject;
  try
    if JO.Contains('OnOff') then
    begin
      if not JO['OnOff'].IsNull then
        srv_state := JO.i['OnOff'];
    end;

    case srv_state of
      0:
        lblOnOff.Caption := rsOff;
      1:
        lblOnOff.Caption := rsOn;
    else
      lblOnOff.Caption := '????';
    end;
    FNeedSrv := False;
    if JO.Contains('SrvType') then
    begin
      FNeedSrv := true;
      if not JO['SrvType'].IsNull then
      begin
        dsService.ParamByName('CUSTOMER_ID').AsInteger := CustomerInfo.CUSTOMER_ID;
        dsService.ParamByName('srv_type').AsInteger := JO.i['SrvType'];
        dsService.ParamByName('state').AsInteger := srv_state;
        dsService.Open;
        dsOnOffService.ParamByName('customer_id').AsInteger := CustomerInfo.CUSTOMER_ID;
        if srv_state = 1 then
          FIsOff := 0
        else
          FIsOff := 1;
        dsOnOffService.ParamByName('off').AsInteger := FIsOff;
        dsOnOffService.Open;
      end;
    end;

    FOpenInet := False;
    if JO.Contains('OpenInet') then
      FOpenInet := JO.B['OpenInet'];

    if JO.Contains('SrvOnOff') then
    begin
      lcbOnOffSrv.Enabled := (not JO['SrvOnOff'].IsNull);
      if not JO['SrvOnOff'].IsNull then
        lcbOnOffSrv.value := JO['SrvOnOff'];
    end;

    FReqType := -1;
    if JO.Contains('ReqType') then
    begin
      if not JO['ReqType'].IsNull then
        FReqType := JO.i['ReqType'];
    end;
    FReqTempl := -1;
    if JO.Contains('ReqTempl') then
    begin
      if not JO['ReqTempl'].IsNull then
        FReqTempl := JO.i['ReqTempl'];
    end;
  finally
    JO.Free;
  end;
end;

procedure TEditCFileForm.UpdateNotice;
var
  s: string;
begin
  if (dsCustFile.State = dsInsert) and (not dsFiles.FieldByName('O_DESCRIPTION').IsNull) then
  begin
    s := FieldsToStr(dsFiles['O_DESCRIPTION']);
    memNotice.Lines.Text := s;
  end;
end;

function TEditCFileForm.CheckAddons(const errors: Boolean): Boolean;
begin
  result := errors;
  if pnlAddons.Visible then
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
        CnErrors.Dispose(lcbOnOffSrv);

      if (VarIsNull(edDate.value)) then
      begin
        result := true;
        CnErrors.SetError(edDate, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
      end
      else
        CnErrors.Dispose(edDate);
    end
    else
    begin
      CnErrors.Dispose(lcbService);
      CnErrors.Dispose(edDate);
      CnErrors.Dispose(lcbOnOffSrv);
    end;
  end;
end;

procedure TEditCFileForm.ExecuteAddons;
var
  s: String;
  Save_Cursor: TCursor;
  d: TDate;
begin
  if not pnlAddons.Visible then
    Exit;

  Save_Cursor := Screen.Cursor;
  try
    Screen.Cursor := crSQLWait;
    if FNeedSrv then
    begin
      with TpFIBQuery.Create(self) do
      begin
        try
          DataBase := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          SQL.Text := 'execute procedure Api_Set_Customer_Service' +
            '(:Customer_Id, :Service_Id, :Set_On, :Set_Date, :Srv_On_Off)';
          ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
          ParamByName('Service_Id').AsInteger := lcbService.value;
          if FIsOff = 1 then
            ParamByName('Set_On').AsInteger := 0
          else
            ParamByName('Set_On').AsInteger := 1;
          ParamByName('Set_Date').AsDate := edDate.value;
          ParamByName('Srv_On_Off').AsInteger := lcbOnOffSrv.value;
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;

          if not memNotice.Lines.Text.IsEmpty then
          begin
            SQL.Text := 'update Subscr_Serv set Notice = :notice ' +
              ' where Serv_Id = :Service_Id and Customer_Id = :customer_id';
            ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
            ParamByName('Service_Id').AsInteger := lcbService.value;
            ParamByName('notice').AsString := memNotice.Lines.Text;
            Transaction.StartTransaction;
            ExecQuery;
            Transaction.Commit;

            SQL.Text := 'update Single_Serv set Notice = :notice ' +
              ' where Service_Id = :Service_Id and Customer_Id = :customer_id and Serv_Date = :Set_Date';
            ParamByName('Customer_Id').AsInteger := CustomerInfo.CUSTOMER_ID;
            ParamByName('Set_Date').AsDate := edDate.value;
            ParamByName('Service_Id').AsInteger := lcbOnOffSrv.value;
            ParamByName('notice').AsString := memNotice.Lines.Text;
            Transaction.StartTransaction;
            ExecQuery;
            Transaction.Commit;
          end;
        finally
          Free;
        end;
      end;
    end;
  finally
    Screen.Cursor := Save_Cursor;
  end;

  if FOpenInet then
    EditBillInfo(-1, CustomerInfo.CUSTOMER_ID, CustomerInfo.Account_No, memNotice.Lines.Text, False);

  if FReqType > -1 then
  begin
    if not VarIsNull(edDate.value) then
      d := edDate.value
    else
      d := NOW();
    NewFileRequest(CustomerInfo.CUSTOMER_ID, FReqType, FReqTempl, d, memNotice.Lines.Text);
  end;
end;

end.
