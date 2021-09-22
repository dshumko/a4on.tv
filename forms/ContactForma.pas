unit ContactForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, DBGridEh, StdCtrls,
  DBCtrls, Mask, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery,
  PrjConst, System.UITypes, Vcl.Buttons;

type
  TContact = Record
    cID: Integer;
    cType: String;
    Contact: String;
    Notice: String;
    Notify: Integer;
  End;

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
  end;

function EditContact(var Contact: TContact): Boolean;

implementation

uses DM, CF, RegularExpressions, pFIBQuery, Vcl.Consts, System.MaskUtils;

{$R *.dfm}

// перехватим вызов исключения при проверки maskedit и просто покажем сообщение
procedure TMaskEdit.ValidateError;
begin
  ShowMessage(SMaskEditErr);
end;

function EditContact(var Contact: TContact): Boolean;
begin
  with TContactForm.Create(Application) do
    try
      dsContactType.Open;
      chkNotify.Checked := False;
      if (Contact.cID > -1) then
      begin
        cbbContactType.Value := Contact.cID;
        dbValue.Text := Contact.Contact;
        chkNotify.Checked := (Contact.Notify = 1);
        memNotice.Lines.Text := Contact.Notice;
      end
      else begin
        cbbContactType.Value := 1;
        chkNotify.Checked := True;
      end;

      if ShowModal = mrOk then
      begin
        Contact.cID := cbbContactType.Value;
        Contact.cType := cbbContactType.Text;
        Contact.Contact := dbValue.Text;
        if chkNotify.Checked then
          Contact.Notify := 1
        else
          Contact.Notify := 0;
        Contact.Notice := memNotice.Lines.Text;
        result := true;
      end
      else
      begin
        result := False;
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
  errors := False;
  if (cbbContactType.Text = '') then
  begin
    errors := true;
    CnErrors.SetError(cbbContactType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(cbbContactType);

  ce := False;
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
        ce := False;
    end;
  end;

  if ce then
  begin
    errors := true;
    CnErrors.SetError(dbValue, rsInputIncorrect, iaMiddleLeft, bsNeverBlink)
  end
  else
    CnErrors.Dispose(dbValue);

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
  //
end;

procedure TContactForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    btnOkClick(Sender);
end;

procedure TContactForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then
  begin
    go := true;
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

end.
