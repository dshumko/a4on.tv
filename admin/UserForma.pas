unit UserForma;

interface

uses
  WinAPI.Windows, WinAPI.Messages, System.SysUtils, System.Variants, System.Classes,
  VCL.Graphics, VCL.Forms, VCL.StdCtrls, VCL.ComCtrls, VCL.Mask,
  VCL.Controls, VCL.ExtCtrls, VCL.Dialogs, VCL.DBCtrls, Data.DB,

  DBCtrlsEh, PrjConst, CnErrorProvider;

type
  TUF = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    pnlNewUser: TPanel;
    Label4: TLabel;
    edU: TDBEditEh;
    Label7: TLabel;
    pnlExistUser: TPanel;
    cbUsers: TDBComboBoxEh;
    Label8: TLabel;
    edPWD: TDBEditEh;
    pgcWorker: TPageControl;
    tsNew: TTabSheet;
    tsExists: TTabSheet;
    pnlFIO: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edF: TDBEditEh;
    etPhone: TDBEditEh;
    edI: TDBEditEh;
    edO: TDBEditEh;
    cbWorker: TDBComboBoxEh;
    lbl1: TLabel;
    dmN: TDBMemoEh;
    pnl1: TPanel;
    chkWork: TDBCheckBoxEh;
    chkLock: TDBCheckBoxEh;
    cnErrors: TCnErrorProvider;
    procedure edUEnter(Sender: TObject);
    procedure edUExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edUKeyPress(Sender: TObject; var Key: Char);
    procedure edPWDKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UF: TUF;

implementation

uses UsersForma, DM, AtrCommon;

{$R *.dfm}

function CheckName(const Input: String): boolean;
var
  i: integer;
  Alpha, Digit, s: string;
begin
  if Length(Input) < 2 then
  begin
    Result := False;
    Exit;
  end;

  Digit := '0123456789_';
  Alpha := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  s := AnsiUpperCase(Input);
  // First is char
  if (pos(s[1], Alpha) = 0) then
  begin
    Result := False;
    Exit;
  end;

  Alpha := Alpha + Digit;
  Result := true;
  for i := 2 to Length(s) do
  begin
    if pos(s[i], Alpha) = 0 then
    begin
      Result := False;
      break;
    end
  end;
end;

function CheckPassword(const Input: String): boolean;
begin
  Result := (Length(Input) <> 0);
end;

procedure TUF.Button1Click(Sender: TObject);
begin
  ModalResult := mrOk;

  if pnlNewUser.Visible then
  begin
    if (not CheckName(edU.Text)) then
    begin
      ModalResult := mrNone;
      edU.SetFocus;
    end
    else if ((not CheckPassword(edPWD.Text)) and (pgcWorker.Visible)) then
    begin
      ModalResult := mrNone;
      edPWD.SetFocus;
    end;
  end
  else
  begin
    if (cbUsers.Text = '') then
    begin
      ModalResult := mrNone;
      cbUsers.SetFocus;
    end
  end;

  if not pgcWorker.Visible then
    Exit;

  if (pgcWorker.ActivePageIndex = 0) then
  begin
    if (edF.Text = '') then
    begin
      ModalResult := mrNone;
      edF.SetFocus;
    end
  end
  else
  begin
    if (cbWorker.Text = '') then
    begin
      ModalResult := mrNone;
      cbWorker.SetFocus;
    end
  end
end;

procedure TUF.edPWDKeyPress(Sender: TObject; var Key: Char);
begin
  if not(CharInSet(Key, ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '!', '@', '#', '$', '%', '&', '*', '_', #8])) then
  begin
    Key := #0;
    cnErrors.SetError(edPWD, rsEmptyOrIncorrect, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnErrors.Dispose(edPWD);
end;

procedure TUF.edUEnter(Sender: TObject);
begin
  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout('EN')
  else
    dmMain.SaveKLAndSelectEnglish;
end;

procedure TUF.edUExit(Sender: TObject);
var
  s: string;
begin
  s := UpperCase(edU.Text);
  if (s = 'ADMIN') or (s = 'USER') or (s = 'GROUP') or (s = 'SYSDBA') then
  begin
    edU.Hint := Format(rsErrorIncorrectUserName, ['ADMIN, USER, GROUP, SYSDBA']);
    edU.SetFocus;
    Exit;
  end;

  if (dmMain.GetIniValue('KBDSWITCH') = '0') then
    SetKeyboardLayout(dmMain.GetIniValue('KEYBOARD'))
  else
    dmMain.RestoreKL;
end;

procedure TUF.edUKeyPress(Sender: TObject; var Key: Char);
begin
  if not(CharInSet(Key, ['a' .. 'z', 'A' .. 'Z', '0' .. '9', '_', #8])) then
  begin
    Key := #0;
    cnErrors.SetError(edU, rsEmptyOrIncorrect, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnErrors.Dispose(edU);
end;

end.
