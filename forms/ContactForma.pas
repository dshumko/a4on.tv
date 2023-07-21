unit ContactForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons,
  FIBDataSet, pFIBDataSet, DBGridEh, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery, PrjConst, A4onTypeUnit,
  Vcl.ExtCtrls;

type
  TMaskEdit = class(Vcl.Mask.TMaskEdit)
  protected
    procedure ValidateError; override;
  end;

  TContactForm = class(TForm)
    srcContactType: TDataSource;
    dsContactType: TpFIBDataSet;
    CnErrors: TCnErrorProvider;
    pnlTop: TPanel;
    chkNotify: TDBCheckBoxEh;
    dbValue: TMaskEdit;
    cbbContactType: TDBLookupComboboxEh;
    lblAttribute: TLabel;
    Label1: TLabel;
    pnlClient: TPanel;
    memNotice: TDBMemoEh;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    pnlOwner: TPanel;
    edtMIDLENAME: TDBEditEh;
    edtFIRSTNAME: TDBEditEh;
    edtSURNAME: TDBEditEh;
    Label2: TLabel;
    edtPASSPORT: TDBEditEh;
    chkFOwner: TDBCheckBoxEh;
    procedure cbbContactTypeChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbValueExit(Sender: TObject);
    procedure edtPASSPORTExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FContact: TContact;
    FEnterSecondPress: Boolean;
    procedure CheckPhone(const Show: Boolean = false);
    function HasErrorInPhone: Boolean;
    procedure FindSamePassport;
    procedure SetContact(const Value: TContact);
  public
    property Contact: TContact read FContact write SetContact;
  end;

function EditContact(var aContact: TContact): Boolean;

implementation

uses
  System.RegularExpressions, System.MaskUtils,
  Vcl.Consts,
  DM, pFIBQuery,
  AtrStrUtils;

{$R *.dfm}

// перехватим вызов исключения при проверки maskedit и просто покажем сообщение
procedure TMaskEdit.ValidateError;
begin
  ShowMessage(SMaskEditErr);
end;

function EditContact(var aContact: TContact): Boolean;
begin
  with TContactForm.Create(Application) do
  begin
    try
      dsContactType.Open;
      Contact := aContact;

      if ShowModal = mrOk then
      begin
        aContact.cID := cbbContactType.Value;
        aContact.cType := cbbContactType.Text;
        aContact.Contact := dbValue.Text;
        if chkNotify.Checked then
          aContact.Notify := 1
        else
          aContact.Notify := 0;
        aContact.Notice := Trim(memNotice.Lines.Text);
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
end;

procedure TContactForm.btnOkClick(Sender: TObject);
var
  errors: Boolean;
  s, pn, own: string;
begin
  errors := false;
  if (cbbContactType.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(cbbContactType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(cbbContactType);

  if HasErrorInPhone then
    errors := True;

  if not errors then
  begin
    if pnlOwner.Visible then
    begin
      s := edtFIRSTNAME.Text + ' ' + edtMIDLENAME.Text + ' ' + edtSURNAME.Text;
      pn := edtPASSPORT.Text;

      if chkFOwner.State <> cbGrayed then
      begin
        if chkFOwner.Checked then
          own := dmMain.GetSettingsValue('FLAT_OWNER_C_STR')
        else
          own := dmMain.GetSettingsValue('FLAT_RENT_C_STR');
        s := s + '. ' + Format(own, [pn]);
      end
      else
        s := s + ' ' + pn;
      s := Trim(s);
      if not s.IsEmpty then
        memNotice.Lines.Text := s + #13#10 + memNotice.Lines.Text;
    end;
    ModalResult := mrOk
  end
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

procedure TContactForm.edtPASSPORTExit(Sender: TObject);
begin
  FindSamePassport;
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
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := True;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else
    begin
      if (ActiveControl is TDBMemoEh) and
        (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
      begin
        go := false;
        FEnterSecondPress := True;
      end;
    end;

    if go then
    begin
      FEnterSecondPress := false;
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end
  else
  begin
    if (ActiveControl is TDBMemoEh) then
      FEnterSecondPress := false;
  end;
end;

procedure TContactForm.FormShow(Sender: TObject);
var
  s: String;
begin
  s := dmMain.GetCompanyValue('NAME');
  pnlOwner.Visible := s.Contains('ЛТВ');
  chkFOwner.Visible := (dmMain.GetSettingsValue('FLAT_OWNER') = '1');
end;

procedure TContactForm.CheckPhone(const Show: Boolean = false);
var
  result: string;
  fio: string;
  Warning: Boolean;
  ShowBalance: Boolean;
  NeedNotice: Boolean;
begin
  NeedNotice := ((pnlOwner.Visible) and (FContact.cID < 0));

  // проверим только телефоны
  if (cbbContactType.Value > 1) then
    Exit;

  if HasErrorInPhone then
    Exit;

  result := '';
  Warning := false;
  fio := Trim(dbValue.Text);
  fio := fio.Trim(['+', '(', ')', ' ']);
  if (Length(fio) < 5) then
    Exit;

  ShowBalance := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1');
  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Clear;
      sql.Add('select first 10 1 fnd, c.Customer_Id, c.Account_No, c.Debt_Sum, c.Cust_Code, c.Surname, c.Firstname, c.Midlename');
      sql.Add(', coalesce((select i.Cust_Code from customer i where i.Customer_Id = :CID), '''') OLD_CODE');
      sql.Add('from Customer_Contacts cc inner join customer c on (cc.Customer_Id = c.Customer_Id)');
      sql.Add('where cc.Cc_Type < 2  and ((cc.Cc_Value = :STR) or (position(:STR in cc.Cc_Value) > 0) or (cc_val_reverse = reverse(ONLY_DIGITS(:STR))))');
      if NeedNotice then
      begin
        sql.Add('union');
        sql.Add('select 0 fnd, null Customer_Id, null Account_No, null Debt_Sum, null Cust_Code, null Surname, null Firstname, null Midlename, Cc_Notice OLD_CODE');
        sql.Add('from Customer_Contacts');
        sql.Add('where Cc_Value = :CVAL and Customer_Id = :CID and Cc_Type = :CType');
      end;
      ParamByName('CID').AsInteger := FContact.CustID;
      ParamByName('STR').AsString := fio;
      if NeedNotice then
      begin
        ParamByName('CType').AsInteger := cbbContactType.Value;
        ParamByName('CVAL').AsString := Trim(dbValue.Text);
      end;
      Transaction.StartTransaction;
      ExecQuery;
      while not EOF do
      begin
        if (FieldByName('fnd').Value = 1) then
        begin
          if ((FieldByName('Customer_Id').Value <> FContact.CustID) and
            (FieldByName('Cust_Code').Value <> FieldByName('OLD_CODE').Value)) then
          begin
            if not FieldByName('Surname').IsNull then
              fio := FieldByName('Surname').Value
            else
              fio := '';
            if not FieldByName('Firstname').IsNull then
              fio := fio + ' ' + FieldByName('Firstname').Value;
            if not FieldByName('Midlename').IsNull then
              fio := fio + ' ' + FieldByName('Midlename').Value;

            if ShowBalance then
              result := result + Format('Л/С: %s ФИО: %s Баланс: %f', [FieldByName('Account_No').Value, fio,
                -1 * FieldByName('Debt_Sum').AsFloat]) + #13#10
            else
              result := result + Format('Л/С: %s ФИО: %s Сальдо: %f', [FieldByName('Account_No').Value, fio,
                FieldByName('Debt_Sum').AsFloat]) + #13#10;

            if ((not FieldByName('Debt_Sum').IsNull) and (FieldByName('Debt_Sum').AsFloat > 1)) then
              Warning := True;
          end;
        end
        else
        begin
          if NeedNotice then
          begin
            if not(FN('OLD_CODE').IsNull) and (Trim(memNotice.Lines.Text) = '') then begin
              memNotice.Lines.Text := FN('OLD_CODE').AsString;
              memNotice.SelStart := Length(memNotice.Text);
              memNotice.SelLength := 0;
            end;
          end;
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
        CnErrors.SetError(dbValue, result, iaMiddleLeft, bsNeverBlink).IconType := EP_WARNING
      else
        CnErrors.SetError(dbValue, result, iaMiddleLeft, bsNeverBlink).IconType := EP_ERROR;
    end;
  end;
end;

function TContactForm.HasErrorInPhone: Boolean;
var
  ce: Boolean;
  s: string;
  reg: string;
begin
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
        ce := ValueHasMaskError(dbValue.EditMask, dbValue.Text);
      end
      else
        ce := (dbValue.Text = '');
    end;
  end;

  if ce then
    CnErrors.SetError(dbValue, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink)
  else
    CnErrors.Dispose(dbValue);

  result := ce;
end;

procedure TContactForm.FindSamePassport;
var
  n: string;
begin
  if (not pnlOwner.Visible) or (FContact.cID > -1) then
    Exit;
  n := Trim(edtPASSPORT.Text);
  if n.IsEmpty then
    Exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Clear;

      sql.Add('select d.Surname, d.Firstname, d.Midlename');
      sql.Add('from DOC_LIST d');
      sql.Add('where d.Doc_Number = :PN and d.Doc_Type = 1');
      sql.Add('UNION ALL');
      sql.Add('select c.Surname, c.Firstname, c.Midlename');
      sql.Add('from customer c where c.Passport_Number = :PN');

      ParamByName('PN').AsString := n;

      Transaction.StartTransaction;
      ExecQuery;
      if not(FN('Surname').IsNull) then
        edtSURNAME.Text := FN('Surname').AsString;
      if not(FN('Firstname').IsNull) then
        edtFIRSTNAME.Text := FN('Firstname').AsString;
      if not(FN('Midlename').IsNull) then
        edtMIDLENAME.Text := FN('Midlename').AsString;
      Close;
      Transaction.Commit;
    finally
      free;
    end;
  end;
  edtSURNAME.TabStop := (edtSURNAME.Text = '');
  edtFIRSTNAME.TabStop := (edtFIRSTNAME.Text = '');
  edtMIDLENAME.TabStop := (edtMIDLENAME.Text = '');
end;


procedure TContactForm.SetContact(const Value: TContact);
var
  s, fd, pd : string;
  i, ctype : integer;
begin
  FContact := Value;

  if (FContact.cID > -1) then
  begin
    cbbContactType.Value := FContact.cID;
    dbValue.Text := FContact.Contact;
    chkNotify.Checked := (FContact.Notify = 1);
    memNotice.Lines.Text := FContact.Notice;
  end
  else
  begin
    ctype := -1;
    // попробуем определить тип контакта
    s := dmMain.GetSettingsValue('MOBILE_FMT');
    fd := DigitsOnly(s);
    pd := DigitsOnly(FContact.Contact);
    if Length(fd) = Length(pd) then begin
      i := Pos('0', fd);
      pd := Copy(pd, i, 255);
      pd := ReplaceInMask(s, pd);
      ctype := 1;
    end
    else begin
      s := dmMain.GetSettingsValue('PHONE_FMT');
      fd := DigitsOnly(s);
      pd := DigitsOnly(FContact.Contact);
      if Length(fd) = Length(pd) then begin
        i := Pos('0', fd);
        pd := Copy(pd, i, 255);
        pd := ReplaceInMask(s, pd);
        ctype := 0;
      end
    end;

    if ctype = -1 then begin
      cbbContactType.Value := 999;
      chkNotify.Checked := false;
      dbValue.Text := FContact.Contact;
    end
    else begin
      cbbContactType.Value := ctype;
      chkNotify.Checked := (ctype = 1);
      dbValue.Text := pd;
    end;
  end;

  memNotice.Lines.Text := FContact.Notice;
end;

end.
