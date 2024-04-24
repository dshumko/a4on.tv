unit SmsQuestForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  DBCtrlsEh, FIBQuery, pFIBQuery, PrjConst;

type
  TSmsQuestForm = class(TForm)
    ednSmsCount: TDBNumberEditEh;
    Label2: TLabel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    lblText: TLabel;
    procedure ednSmsCountChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
  private
    procedure ModalResultOk;
  public
  end;

function SmsQuest(const ForSendCount, ReciverCount, balance: Integer; var BatchSize: Integer): boolean;

implementation

uses
  DM;

{$R *.dfm}

function SmsQuest(const ForSendCount, ReciverCount, balance: Integer; var BatchSize: Integer): boolean;
begin
  result := false;
  with TSmsQuestForm.Create(Application) do
  begin
    try
      lblText.Caption := format(rsSMSInfo, [balance, ForSendCount, ReciverCount]);
      btnOk.Visible := (ForSendCount > 0) and (balance > 0);
      result := (ShowModal = mrOk);
      BatchSize := ednSmsCount.Value;
    finally
      free;
    end;
  end;
end;

procedure TSmsQuestForm.btnOkClick(Sender: TObject);
begin
  ModalResultOk;
end;

procedure TSmsQuestForm.ednSmsCountChange(Sender: TObject);
var
  f: Extended;
  b: boolean;
begin
  b := false;
  if ednSmsCount.Text <> '' then
  begin
    if TryStrToFloat(ednSmsCount.Value, f) then
      b := (f >= 0);
  end;

  btnOk.Enabled := b;
end;

procedure TSmsQuestForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    ModalResultOk;
end;

procedure TSmsQuestForm.ModalResultOk;
begin
  if btnOk.Enabled then
    ModalResult := mrOk;
end;

end.
