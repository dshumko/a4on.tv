unit ContactForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, DBGridEh, StdCtrls,
  DBCtrls, Mask, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery,
  PrjConst, System.UITypes, Vcl.Buttons, A4onTypeUnit;

type
  TMaskEdit = class(Mask.TMaskEdit)
  protected
    procedure ValidateError; override;
  end;

  TContactForm = class(TForm)
    srcContactType: TDataSource;
    dsContactType: TpFIBDataSet;
    cbbContactType: TDBLookupComboboxEh;
    memNotice: TDBMemoEh;
    lblAttribute: TLabel;
    Label2: TLabel;
    CnErrors: TCnErrorProvider;
    chkNotify: TDBCheckBoxEh;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    dbValue: TMaskEdit;
    procedure cbbContactTypeChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbValueExit(Sender: TObject);
  private
    FContact: TContact;
    procedure CheckPhone(const Show: Boolean = false);
  public
    property Contact: TContact read FContact write FContact;
  end;

function EditContact(var aContact: TContact): Boolean;

implementation

uses DM, RegularExpressions, pFIBQuery, Vcl.Consts, System.MaskUtils;

{$R *.dfm}

// перехватим вызов исключения при проверки maskedit и просто покажем сообщение
procedure TMaskEdit.ValidateError;
begin
  ShowMessage(SMaskEditErr);
end;

function EditContact(var aContact: TContact): Boolean;
begin
  with TContactForm.Create(Application) do
    try
      Contact := aContact;
      dsContactType.Open;
      chkNotify.Checked := false;
      if (Contact.cID > -1) then
      begin
        cbbContactType.Value := aContact.cID;
        dbValue.Text := aContact.Contact;
        chkNotify.Checked := (aContact.Notify = 1);
        memNotice.Lines.Text := aContact.Notice;
      end
      else
      begin
        cbbContactType.Value := 1;
        chkNotify.Checked := True;
      end;

      if ShowModal = mrOk then
      begin
        aContact.cID := cbbContactType.Value;
        aContact.cType := cbbContactType.Text;
        aContact.Contact := dbValue.Text;
        if chkNotify.Checked then
          aContact.Notify := 1
        else
          aContact.Notify := 0;
        aContact.Notice := memNotice.Lines.Text;
        result := True;
      end
      else
      begin
        result := false;
      end;
    finally
      free
    end;
end;

procedure TContactForm.btnOkClick(Sender: TObject);
var
  errors, ce: Boolean;
  s: string;
  reg: string;
  c: Char;
begin
  errors := false;
  if (cbbContactType.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(cbbContactType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(cbbContactType);

  ce := false;
  if ((dbValue.Text <> '')) then
  begin
    if dsContactType['REGEXP'] <> '' then
    begin
      s := dbValue.Text;
      reg := '^' + dsContactType['REGEXP'] + '$';
      ce := not TRegEx.IsMatch(s, reg);
    end
    else
    begin
      if (dbValue.EditMask <> '') then
      begin
        // проверим есть ли пустой символ шаблона в тексте
        c := MaskGetMaskBlank(dbValue.EditMask);
        ce := (Pos(c, dbValue.Text) > 0);
      end
      else
        ce := false;
    end;
  end;

  if ce then
  begin
    errors := True;
    CnErrors.SetError(dbValue, rsInputIncorrect, iaMiddleLeft, bsNeverBlink)
  end
  else
    CnErrors.Dispose(dbValue);

  CheckPhone(True);

  if not errors then
    ModalResult := mrOk
  else
    ModalResult := mrNone;
end;

procedure TContactForm.cbbContactTypeChange(Sender: TObject);
var
  s: string;
begin
  CnErrors.Dispose(dbValue);
  if dbValue.EditMask <> '' then
    dbValue.EditMask := '';

  if dsContactType['REGEXP'] = '' then
  begin
    s := '';
    if (cbbContactType.Value = 0) then
      s := dmMain.GetSettingsValue('PHONE_FMT')
    else if (cbbContactType.Value = 1) then
      s := dmMain.GetSettingsValue('MOBILE_FMT');
    if s <> '' then
      dbValue.EditMask := s + ';1;_';
  end;
end;

procedure TContactForm.dbValueExit(Sender: TObject);
begin
  CheckPhone(false);
end;

procedure TContactForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
  begin
    btnOkClick(Sender);
  end;
end;

procedure TContactForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then
  begin
    go := True;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBMemoEh) then
      go := (ActiveControl as TDBMemoEh).Lines.Text.IsEmpty;

    if go then
    begin
      Key := #0; // eat enter key
      PostMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TContactForm.CheckPhone(const Show: Boolean = false);
var
  result: string;
  fio: string;
  Warning: Boolean;
begin
  // проверим только телефоны
  if (cbbContactType.Value > 1) then
    Exit;

  result := '';
  Warning := false;
  fio := Trim(dbValue.Text);
  fio := fio.Trim(['+', '(', ')', ' ']);
  if (Length(fio) < 5) then
    Exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Clear;
      sql.Add(' select c.Customer_Id, c.Account_No, c.Debt_Sum, c.Cust_Code, c.Surname, c.Firstname, c.Midlename ');
      sql.Add(' from Customer_Contacts cc inner join customer c on (cc.Customer_Id = c.Customer_Id) ');
      sql.Add(' where cc.Cc_Type < 2 ');
      sql.Add('   and ((cc.Cc_Value = :STR) ');
      sql.Add('         or (position(:STR in cc.Cc_Value) > 0) ');
      sql.Add('         or (cc_val_reverse = reverse(ONLY_DIGITS(:STR)))) ');

      // ParamByName('CID').AsInteger := FContact.CustID;
      ParamByName('STR').AsString := fio;

      Transaction.StartTransaction;
      ExecQuery;
      while not EOF do
      begin
        if FieldByName('Customer_Id').Value <> FContact.CustID then
        begin
          if not FieldByName('Surname').IsNull then
            fio := FieldByName('Surname').Value
          else
            fio := '';
          if not FieldByName('Firstname').IsNull then
            fio := fio + ' ' + FieldByName('Firstname').Value;
          if not FieldByName('Midlename').IsNull then
            fio := fio + ' ' + FieldByName('Midlename').Value;

          result := result + format('Л/С: %s ФИО: %s Баланс: %f', [FieldByName('Account_No').Value, fio,
            -1 * FieldByName('Debt_Sum').AsFloat]) + #13#10;
          if ((not FieldByName('Debt_Sum').IsNull) and (FieldByName('Debt_Sum').AsFloat > 1)) then
            Warning := True;
        end;
        Next;
      end;
      result := result.Trim;
      Close;
      Transaction.Commit;
    finally
      free;
    end;
  end;

  if (not result.IsEmpty) then
  begin
    result := 'Номер совпадает с лицевыми: '#13#10 + result;
    if Show then
      ShowMessage(result)
    else
    begin
      if Warning then
        CnErrors.SetError(dbValue, result, iaMiddleLeft, bsNeverBlink).IconType := EP_ERROR
      else
        CnErrors.SetError(dbValue, result, iaMiddleLeft, bsNeverBlink).IconType := EP_WARNING;
    end;
  end
end;

end.
