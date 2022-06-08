unit UTMAddIPForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  OkCancel_frame, DBCtrlsEh;

type
  TUTMAddIPForm = class(TForm)
    edtInetIP: TDBEditEh;
    okcnclfrm1: TOkCancelFrame;
    lbl1: TLabel;
    Label3: TLabel;
    edLogin: TDBEditEh;
    Label5: TLabel;
    edtSecret: TDBEditEh;
    lbl2: TLabel;
    edt1: TDBEditEh;
    btnnEXTip: TSpeedButton;
    chkNotVPN: TDBCheckBoxEh;
    procedure edtInetIPExit(Sender: TObject);
    procedure edtInetIPEnter(Sender: TObject);
    procedure chkNotVPNClick(Sender: TObject);
    procedure edtSecretExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UTMAddIPForm: TUTMAddIPForm;

implementation

uses
  AtrCommon, AtrStrUtils, RxStrUtils, DM, CustBillUTMForma;
{$R *.dfm}

procedure TUTMAddIPForm.chkNotVPNClick(Sender: TObject);
begin
  edLogin.Enabled   := not chkNotVPN.Checked;
  edtSecret.Enabled := not chkNotVPN.Checked;
end;

procedure TUTMAddIPForm.edtInetIPEnter(Sender: TObject);
begin
  SetKeyboardLayout('EN');
end;

procedure TUTMAddIPForm.edtInetIPExit(Sender: TObject);
begin
  SetKeyboardLayout( dmMain.GetIniValue('KEYBOARD'));
  if (Sender as TDBEditEh).Text = '' then Exit;
  (Sender as TDBEditEh).Text := ReplaceStr((Sender as TDBEditEh).Text,',','.');
  if not CheckIP((Sender as TDBEditEh).Text)
  then begin
    ShowMessage('Неверный IP');
    (Sender as TDBEditEh).SetFocus;
  end;
end;

procedure TUTMAddIPForm.edtSecretExit(Sender: TObject);
begin
  SetKeyboardLayout( dmMain.GetIniValue('KEYBOARD'));
end;

end.
