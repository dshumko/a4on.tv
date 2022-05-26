unit ChangePwdForma;

interface

{$I defines.inc}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OkCancel_frame, PrjConst, FIBQuery, pFIBQuery, Vcl.Buttons,
  Vcl.ExtCtrls, CnErrorProvider;

type
  TChangePwdForm = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtOLD: TEdit;
    edtNEW: TEdit;
    edtCONFRM: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblLANG: TLabel;
    lblCAPS: TLabel;
    Timer1: TTimer;
    cnErrors: TCnErrorProvider;
    procedure FormShow(Sender: TObject);
    procedure frm1bbOkClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure edtNEWKeyPress(Sender: TObject; var Key: Char);
  private
    procedure UpdateKbdState;
    procedure ExecSQL(const aSQL: string);
  public
    { Public declarations }
  end;

implementation

uses
  DM, System.StrUtils, AtrCommon;

{$R *.dfm}

procedure TChangePwdForm.edtNEWKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '!', '@', '#', '$', '%', '&', '*', '_', #8]) then
  begin
    Key := #0;
    cnErrors.SetError((Sender as TEdit), rsEmptyOrIncorrect, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnErrors.Dispose((Sender as TEdit));
end;

procedure TChangePwdForm.FormShow(Sender: TObject);
begin
  edtOLD.Text := '';
  edtNEW.Text := '';
  edtCONFRM.Text := '';

  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

procedure TChangePwdForm.ExecSQL(const aSQL: string);
begin
  with TpFIBQuery.Create(Self) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := aSQL;
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

procedure TChangePwdForm.frm1bbOkClick(Sender: TObject);
var
  Changed: Boolean;
  p, SQL: string;
begin
  Changed := False;
  if pswdPrefix + edtOLD.Text = dmMain.Password then
  begin
    p := pswdPrefix + edtNEW.Text;
    if (Length(edtNEW.Text) <> 0) and (dmMain.User <> 'SYSDBA') and (p = (pswdPrefix + edtCONFRM.Text)) and
      (p <> dmMain.Password) then
    begin
      p := rsQUOTE + ReplaceStr(p, rsQUOTE, rsQUOTE + rsQUOTE) + rsQUOTE;
      SQL := Format('ALTER USER %s PASSWORD %s', [dmMain.User, p]);
      ExecSQL(SQL);
      ExecSQL(SQL + ' ACTIVE USING PLUGIN Legacy_UserManager');
      ExecSQL(SQL + ' ACTIVE USING PLUGIN Srp');

      SQL := Format('update Sys$User set Pswd_Changed = LOCALTIMESTAMP where Ibname = ''%s''', [dmMain.User]);
      ExecSQL(SQL);
      Changed := True;
    end;

    if not Changed then
      ShowMessage(rsPasswordNotChange)
    else
    begin
      if (dmMain.GetIniValue('KBDSWITCH') = '0') then
        SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
      else
        dmMain.RestoreKL;
    end;
  end;
end;

procedure TChangePwdForm.Timer1Timer(Sender: TObject);
begin
  UpdateKbdState;
end;

procedure TChangePwdForm.UpdateKbdState;
var
  Buf: array [0 .. KL_NAMELENGTH] of Char;
  Pk: PChar;
  C, i: Integer;
begin
  GetKeyboardLayoutName(@Buf);
  Pk := @Buf;
  Val(StrPas(Pk), i, C);

  case i of
    409:
      lblLANG.Caption := 'EN';
    419:
      lblLANG.Caption := 'RU';
    422:
      lblLANG.Caption := 'UA';
    10437:
      lblLANG.Caption := 'ქარ';
    42:
      lblLANG.Caption := 'HY';
  else
    lblLANG.Caption := IntToStr(i);
  end;
  lblCAPS.Width := lblLANG.Width;
  lblCAPS.Left := lblLANG.Left;
  lblCAPS.Visible := (GetKeyState(VK_CAPITAL) and $01) = 1;
end;

end.
