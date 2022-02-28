unit DiscountForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OkCancel_frame, StdCtrls, DBCtrlsEh, Mask, DBLookupEh, System.UITypes,
  DB, FIBDataSet, pFIBDataSet, ExtCtrls, DBCtrls, FIBQuery, DBGridEh,
  Vcl.Buttons, CnErrorProvider, pFIBQuery, FIBDatabase, pFIBDatabase,
  PropFilerEh, PropStorageEh;

type
  TDiscountForm = class(TForm)
    srcService: TDataSource;
    dsluService: TpFIBDataSet;
    mmoNotice: TDBMemoEh;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbAll: TCheckBox;
    pnlService: TPanel;
    Label1: TLabel;
    luOnOffService: TDBLookupComboboxEh;
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
    procedure cbAllClick(Sender: TObject);
    procedure srcDiscountStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FNotChangeHistory: Boolean;
    FDiscount_ID: Integer;
    FCustomer_ID: Integer;
    procedure Save;
    procedure Save2DB;
    function CheckDataAndOk: Boolean;
  public
    { Public declarations }
    property customer_id: Integer read FCustomer_ID write FCustomer_ID;
    property Discount_ID: Integer read FDiscount_ID write FDiscount_ID;
  end;

function AddEditDiscount(aDISCOUNT_ID: Integer; const aCUSTOMER_ID: Integer): Boolean;

implementation

uses System.DateUtils, DM, CF, AtrCommon, PrjConst;

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
  dmMain.SetIniValue('DISCOUNT', ednDiscountValue.Value);
  Action := caFree;
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
  dsluService.Open;
  dsSrvType.Open;

  cbAll.Checked := True;

  // edtnumValue.Value := 0.5;
  luOnOffService.Value := -1;
  lcbSrvType.Value := -1;
  DecodeDate(Now(), y, m, d);
  deStart.Value := EncodeDate(y, m, 1);
  d := DaysInMonth(Now());
  deStop.Value := EncodeDate(y, m, d);

  if FDiscount_ID <> -1 then begin
    qDiscount.ParamByName('DISCOUNT_ID').Value := FDiscount_ID;
    with qDiscount do begin
      Transaction.StartTransaction;
      ExecQuery;
      if not FN('SERV_ID').IsNull then
        cbAll.Checked := (FN('SERV_ID').AsInteger = -1);
      if not FN('FACTOR_VALUE').IsNull then
        ednDiscountValue.Value := FN('FACTOR_VALUE').AsFloat;
      if not FN('SERV_ID').IsNull then
        luOnOffService.Value := FN('SERV_ID').AsInteger;
      if not FN('SRV_TYPE').IsNull then
        lcbSrvType.Value := FN('SRV_TYPE').AsInteger;
      if not FN('DATE_FROM').IsNull then
        deStart.Value := FN('DATE_FROM').AsDate;
      if not FN('DATE_TO').IsNull then
        deStop.Value := FN('DATE_TO').AsDate;
      if not FN('NOTICE').IsNull then
        mmoNotice.Lines.Text := FN('NOTICE').AsString;
      Close;
      Transaction.Rollback;
    end;
    if FNotChangeHistory and (deStart.Value < dmMain.CurrentMonth) then
      deStart.Enabled := False;
    if FNotChangeHistory and (deStop.Value < dmMain.CurrentMonth) then
      deStop.Enabled := False;
    if FNotChangeHistory and (not deStart.Enabled) and (not deStop.Enabled)  then begin
      luOnOffService.Enabled := False;
      ednDiscountValue.Enabled := False;
    end;
  end
  else begin
    if not TryStrToFloat(dmMain.GetIniValue('DISCOUNT'), v) then
      v := 0.5;
    ednDiscountValue.Value := v;
  end;
end;

procedure TDiscountForm.Save;
begin
  if CheckDataAndOk then begin
    Save2DB;
    ModalResult := mrOk;
  end;
end;

procedure TDiscountForm.Save2DB;
var
  All: Boolean;
  i: Integer;
begin
  with qDiscount do begin
    SQL.Text := 'execute procedure Discount_IU ' +
      '(:Discount_Id, :Customer_Id, :Date_From, :Date_To, :Factor_Value, :Serv_Id, :Srv_Type, :Notice)';

    if FDiscount_ID = -1 then
      ParamByName('Discount_Id').Clear;
    ParamByName('Customer_Id').AsInteger := FCustomer_ID;
    ParamByName('Factor_Value').AsFloat := ednDiscountValue.Value;
    ParamByName('Date_From').AsDate := deStart.Value;
    ParamByName('Date_To').AsDate := deStop.Value;
    if cbAll.Checked then begin
      ParamByName('Serv_Id').AsInteger := -1;
      ParamByName('Srv_Type').AsInteger := lcbSrvType.Value
    end
    else begin
      ParamByName('Serv_Id').AsInteger := luOnOffService.Value;
      ParamByName('Srv_Type').AsInteger := -1;
    end;
    ParamByName('Notice').AsString := mmoNotice.Lines.Text;
    Transaction := trWriteQ;
  end;

  All := False;

  if Assigned(CustomersForm) and (FDiscount_ID = -1) then
    if (CustomersForm.dbgCustomers.SelectedRows.Count > 0) then
      All := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);

  if All then begin
    for i := 0 to CustomersForm.dbgCustomers.SelectedRows.Count - 1 do begin
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
  else begin
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
  if (not TryStrToDate(deStart.Text, VD)) then begin
    allOk := False;
    cnErrors.SetError(deStart, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
  end
  else begin
    cnErrors.Dispose(deStart);
    if FNotChangeHistory and deStart.Enabled and (VarToDateTime(deStart.Value) < dmMain.CurrentMonth) then begin
      allOk := False;
      cnErrors.SetError(deStart, rsSuspiciousDate, iaMiddleLeft, bsNeverBlink);
    end
    else
      cnErrors.Dispose(deStart);
  end;

  if (not TryStrToDate(deStop.Text, VD)) then begin
    allOk := False;
    cnErrors.SetError(deStop, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
  end
  else begin
    cnErrors.Dispose(deStop);
    if FNotChangeHistory and deStop.Enabled and (VarToDateTime(deStop.Value) < dmMain.CurrentMonth) then begin
      allOk := False;
      cnErrors.SetError(deStop, rsSuspiciousDate, iaMiddleLeft, bsNeverBlink);
    end
    else
      cnErrors.Dispose(deStop);
  end;

  cnErrors.Dispose(luOnOffService);
  cnErrors.Dispose(lcbSrvType);
  if cbAll.Checked then begin
    if lcbSrvType.Text = '' then begin
      allOk := False;
      cnErrors.SetError(lcbSrvType, rsERROR_NOT_FILL_ALL, iaMiddleLeft, bsNeverBlink);
    end
  end
  else begin
    if luOnOffService.Text = '' then begin
      allOk := False;
      cnErrors.SetError(luOnOffService, rsERROR_NOT_FILL_ALL, iaMiddleLeft, bsNeverBlink);
    end
  end;

  if ednDiscountValue.Text = '' then begin
    allOk := False;
    cnErrors.SetError(ednDiscountValue, rsERROR_NOT_FILL_ALL, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnErrors.Dispose(ednDiscountValue);

  Result := allOk;
end;

end.
