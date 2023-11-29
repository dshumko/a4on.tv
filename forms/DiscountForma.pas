unit DiscountForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons,
  DBCtrlsEh, GridsEh, DBLookupEh, DBGridEh, PropFilerEh, PropStorageEh,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase,
  CnErrorProvider;

type
  TDiscountForm = class(TForm)
    srcService: TDataSource;
    dsluService: TpFIBDataSet;
    mmoNotice: TDBMemoEh;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbAll: TCheckBox;
    deStart: TDBDateTimeEditEh;
    deStop: TDBDateTimeEditEh;
    ednDiscountValue: TDBNumberEditEh;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    cnErrors: TCnErrorProvider;
    lbl1: TLabel;
    lcbSrvType: TDBLookupComboboxEh;
    dsSrvType: TpFIBDataSet;
    srcSrvType: TDataSource;
    pnlSrvType: TPanel;
    qDiscount: TpFIBQuery;
    trRead: TpFIBTransaction;
    trReadQ: TpFIBTransaction;
    trWriteQ: TpFIBTransaction;
    PropStorageEh: TPropStorageEh;
    pnlPromo: TPanel;
    lcbPromo: TDBLookupComboboxEh;
    btnPromo: TButton;
    dsPromo: TpFIBDataSet;
    srcPromo: TDataSource;
    pnlService: TPanel;
    Label1: TLabel;
    luOnOffService: TDBLookupComboboxEh;
    procedure cbAllClick(Sender: TObject);
    procedure srcDiscountStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure deStartChange(Sender: TObject);
    procedure btnPromoClick(Sender: TObject);
    procedure lcbPromoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure luOnOffServiceDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
      var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
    FNotChangeHistory: Boolean;
    FDiscount_ID: Integer;
    FCustomer_ID: Integer;
    FPromo_ID: Integer;
    procedure Save;
    procedure Save2DB;
    function CheckDataAndOk: Boolean;
    procedure SetDiscount(value: Integer);
    procedure GetPromo;
    procedure ParseJson(const json: string);
    procedure SavePromoID(const value: Integer);
  public
    { Public declarations }
    property customer_id: Integer read FCustomer_ID write FCustomer_ID;
    property Discount_ID: Integer read FDiscount_ID write SetDiscount;
  end;

function AddEditDiscount(aDISCOUNT_ID: Integer; const aCUSTOMER_ID: Integer): Boolean;

implementation

uses
  System.DateUtils, JsonDataObjects,
  DM, CF, AtrCommon, PrjConst;

function AddEditDiscount(aDISCOUNT_ID: Integer; const aCUSTOMER_ID: Integer): Boolean;
begin
  with TDiscountForm.Create(application) do
    try
      customer_id := aCUSTOMER_ID;
      Discount_ID := aDISCOUNT_ID;
      Result := (ShowModal = mrOk);
    finally
      free;
    end;
end;

{$R *.dfm}

procedure TDiscountForm.btnPromoClick(Sender: TObject);
var
  json: string;
  i: Integer;
begin
  SavePromoID(-1);
  if varIsNull(lcbPromo.value) then
    Exit;
  i := lcbPromo.value;
  if not dsPromo.Locate('O_ID', VarArrayOf([i]), []) then
    Exit;
  if ((dsPromo.FieldByName('O_CHARFIELD').IsNull) or (dsPromo['O_CHARFIELD'] = '')) then
    Exit;

  SavePromoID(i);
  json := dsPromo['O_CHARFIELD'];
  ParseJson(json);
end;

procedure TDiscountForm.cbAllClick(Sender: TObject);
begin
  pnlService.Visible := not cbAll.Checked;
  pnlSrvType.Visible := cbAll.Checked;
end;

procedure TDiscountForm.srcDiscountStateChange(Sender: TObject);
begin
  btnOk.Enabled := not((Sender as TDataSource).DataSet.State = dsBrowse);
end;

procedure TDiscountForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not ednDiscountValue.Text.IsEmpty then
    dmMain.SetIniValue('DISCOUNT', ednDiscountValue.value);

  if dsPromo.Active then
    dsPromo.Close;
  Action := caFree;
end;

procedure TDiscountForm.FormCreate(Sender: TObject);
begin
  SavePromoID(-1);
end;

procedure TDiscountForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    Save;
end;

procedure TDiscountForm.FormShow(Sender: TObject);
var
  y, m, d: Word;
  v: Double;
begin
  FNotChangeHistory := not((dmMain.AllowedAction(rght_Customer_History)) or (dmMain.AllowedAction(rght_Customer_full)));

  cbAll.Checked := False;
  dsluService.ParamByName('CUSTOMER_ID').AsInteger := FCustomer_ID;
  dsluService.Open;
  dsSrvType.Open;

  cbAll.Checked := True;

  // edtnumValue.Value := 0.5;
  luOnOffService.value := -1;
  lcbSrvType.value := -1;
  DecodeDate(Now(), y, m, d);
  deStart.value := EncodeDate(y, m, 1);
  d := DaysInMonth(Now());
  deStop.value := EncodeDate(y, m, d);

  if FDiscount_ID <> -1 then
  begin
    qDiscount.ParamByName('DISCOUNT_ID').value := FDiscount_ID;
    with qDiscount do
    begin
      Transaction.StartTransaction;
      ExecQuery;
      if not FN('SERV_ID').IsNull then
        cbAll.Checked := (FN('SERV_ID').AsInteger = -1);
      if not FN('FACTOR_VALUE').IsNull then
        ednDiscountValue.value := FN('FACTOR_VALUE').AsFloat;
      if not FN('SERV_ID').IsNull then
        luOnOffService.value := FN('SERV_ID').AsInteger;
      if not FN('SRV_TYPE').IsNull then
        lcbSrvType.value := FN('SRV_TYPE').AsInteger;
      if not FN('DATE_FROM').IsNull then
        deStart.value := FN('DATE_FROM').AsDate;
      if not FN('DATE_TO').IsNull then
        deStop.value := FN('DATE_TO').AsDate;
      if not FN('NOTICE').IsNull then
        mmoNotice.Lines.Text := FN('NOTICE').AsString;
      Close;
      Transaction.Rollback;
    end;
    if FNotChangeHistory and (deStart.value < dmMain.CurrentMonth) then
      deStart.Enabled := False;
    if FNotChangeHistory and (deStop.value < dmMain.CurrentMonth) then
      deStop.Enabled := False;
    if FNotChangeHistory and (not deStart.Enabled) and (not deStop.Enabled) then
    begin
      luOnOffService.Enabled := False;
      ednDiscountValue.Enabled := False;
    end;
  end
  else
  begin
    if not TryStrToFloat(dmMain.GetIniValue('DISCOUNT'), v) then
      v := 0.5;
    ednDiscountValue.value := v;
  end;
end;

procedure TDiscountForm.Save;
begin
  if CheckDataAndOk then
  begin
    Save2DB;
    ModalResult := mrOk;
  end;
end;

procedure TDiscountForm.Save2DB;
var
  All: Boolean;
  i: Integer;
begin
  with qDiscount do
  begin
    SQL.Text :=
      'execute procedure Discount_IU(:Discount_Id, :Customer_Id, :Date_From, :Date_To, :Factor_Value, :Serv_Id, :Srv_Type, :Notice, :Promo_ID)';

    if FDiscount_ID = -1 then
      ParamByName('Discount_Id').Clear;
    ParamByName('Customer_Id').AsInteger := FCustomer_ID;
    ParamByName('Factor_Value').AsFloat := ednDiscountValue.value;
    ParamByName('Date_From').AsDate := deStart.value;
    ParamByName('Date_To').AsDate := deStop.value;
    if cbAll.Checked then
    begin
      ParamByName('Serv_Id').AsInteger := -1;
      ParamByName('Srv_Type').AsInteger := lcbSrvType.value
    end
    else
    begin
      ParamByName('Serv_Id').AsInteger := luOnOffService.value;
      ParamByName('Srv_Type').AsInteger := -1;
    end;
    ParamByName('Notice').AsString := mmoNotice.Lines.Text;
    ParamByName('Promo_ID').AsInteger := FPromo_ID;
    Transaction := trWriteQ;
  end;

  All := False;

  if Assigned(CustomersForm) and (FDiscount_ID = -1) then
    if (CustomersForm.dbgCustomers.SelectedRows.Count > 0) then
      All := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);

  if All then
  begin
    for i := 0 to CustomersForm.dbgCustomers.SelectedRows.Count - 1 do
    begin
      CustomersForm.dbgCustomers.DataSource.DataSet.Bookmark := CustomersForm.dbgCustomers.SelectedRows[i];
      qDiscount.ParamByName('Customer_Id').AsInteger := CustomersForm.dbgCustomers.DataSource.DataSet['CUSTOMER_ID'];
      try
        qDiscount.Transaction.StartTransaction;
        qDiscount.ExecQuery;
        qDiscount.Transaction.Commit;
      except
        ShowMessage(rsErrorSave + ' ' + format(rsAccountWT,
          [CustomersForm.dbgCustomers.DataSource.DataSet.FieldByName('ACCOUNT_NO').AsString]));
      end;
      CustomersForm.dsCustomers.Refresh;
    end;
  end
  else
  begin
    try
      qDiscount.ParamByName('Customer_Id').AsInteger := FCustomer_ID;
      if FDiscount_ID <> -1 then
        qDiscount.ParamByName('Discount_Id').AsInteger := FDiscount_ID;
      qDiscount.Transaction.StartTransaction;
      qDiscount.ExecQuery;
      qDiscount.Transaction.Commit;
    except
      ShowMessage(rsErrorSave);
    end;
  end;
end;

procedure TDiscountForm.btnOkClick(Sender: TObject);
begin
  Save;
end;

function TDiscountForm.CheckDataAndOk: Boolean;
var
  allOk: Boolean;
  VD: TDateTime;
begin
  allOk := True;
  if (not TryStrToDate(deStart.Text, VD)) then
  begin
    allOk := False;
    cnErrors.SetError(deStart, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
  end
  else
  begin
    cnErrors.Dispose(deStart);
    if FNotChangeHistory and deStart.Enabled and (VarToDateTime(deStart.value) < dmMain.CurrentMonth) then
    begin
      allOk := False;
      cnErrors.SetError(deStart, rsSuspiciousDate, iaMiddleLeft, bsNeverBlink);
    end
    else
      cnErrors.Dispose(deStart);
  end;

  if (not TryStrToDate(deStop.Text, VD)) then
  begin
    allOk := False;
    cnErrors.SetError(deStop, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
  end
  else
  begin
    cnErrors.Dispose(deStop);
    if FNotChangeHistory and deStop.Enabled and (VarToDateTime(deStop.value) < dmMain.CurrentMonth) then
    begin
      allOk := False;
      cnErrors.SetError(deStop, rsSuspiciousDate, iaMiddleLeft, bsNeverBlink);
    end
    else
      cnErrors.Dispose(deStop);
  end;

  cnErrors.Dispose(luOnOffService);
  cnErrors.Dispose(lcbSrvType);
  if cbAll.Checked then
  begin
    if lcbSrvType.Text = '' then
    begin
      allOk := False;
      cnErrors.SetError(lcbSrvType, rsERROR_NOT_FILL_ALL, iaMiddleLeft, bsNeverBlink);
    end
  end
  else
  begin
    if luOnOffService.Text = '' then
    begin
      allOk := False;
      cnErrors.SetError(luOnOffService, rsERROR_NOT_FILL_ALL, iaMiddleLeft, bsNeverBlink);
    end
  end;

  if ednDiscountValue.Text = '' then
  begin
    allOk := False;
    cnErrors.SetError(ednDiscountValue, rsERROR_NOT_FILL_ALL, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnErrors.Dispose(ednDiscountValue);

  Result := allOk;
end;

procedure TDiscountForm.deStartChange(Sender: TObject);
begin
  GetPromo;
end;

procedure TDiscountForm.SetDiscount(value: Integer);
begin
  FDiscount_ID := value;
end;

procedure TDiscountForm.GetPromo;
begin
  if (FDiscount_ID <> -1) then
    Exit;

  if dsPromo.Active then
    dsPromo.Close;

  if varIsNull(deStart.value) then
    Exit;

  dsPromo.ParamByName('pdate').AsDate := deStart.value;
  dsPromo.Open;
  pnlPromo.Visible := (dsPromo.RecordCount > 0);
  if (dsPromo.RecordCount = 0) then
    dsPromo.Close;
end;

procedure TDiscountForm.lcbPromoChange(Sender: TObject);
begin
  SavePromoID(-1);
end;

procedure TDiscountForm.luOnOffServiceDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsluService['SRV_EXISTS'] = 1) then
    Background := clMoneyGreen
  else
    Background := clWindow;
end;

procedure TDiscountForm.ParseJson(const json: string);
var
  JO, o: TJsonObject;
begin
  JO := TJsonObject.Parse(json) as TJsonObject;
  try
    if JO.Contains('dur') then
    begin
      if not JO['dur'].IsNull then
        deStop.value := IncMonth(deStart.value, JO['dur']);
    end;
    if JO.Contains('cfs') then
    begin
      o := JO.A['cfs'][0];
      if not o['cf'].IsNull then
        ednDiscountValue.value := o['cf'];
    end;
    if JO.Contains('all') then
    begin
      if not JO['all'].IsNull then
        cbAll.Checked := JO.B['all'];
    end;
    if JO.Contains('srv') then
    begin
      if not JO['srv'].IsNull then
        luOnOffService.value := JO['srv'];
    end;
    if JO.Contains('srvt') then
    begin
      if not JO['srvt'].IsNull then
        lcbSrvType.value := JO['srvt'];
    end;
  finally
    JO.free;
  end;
end;

procedure TDiscountForm.SavePromoID(const value: Integer);
begin
  FPromo_ID := value;
  ednDiscountValue.Enabled := (value = -1);
  cbAll.Enabled := (value = -1);
  pnlService.Enabled := (value = -1);
  pnlSrvType.Enabled := (value = -1);
end;

end.
