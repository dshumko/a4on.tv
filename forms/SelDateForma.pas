unit SelDateForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  DBCtrlsEh, OkCancel_frame, PrjConst;

type
  TSelDateForm = class(TForm)
    frm1: TOkCancelFrame;
    edtDate: TDBDateTimeEditEh;
    lblText: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure frm1bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SelectDate(var aDate: TDate; const Text: string = ''): Boolean;

implementation

{$R *.dfm}

function SelectDate(var aDate: TDate; const Text: string = ''): Boolean;
begin
  Result := False;
  with TSelDateForm.Create(Application) do
    try
      if Text = '' then
        lblText.Caption := rsSelectDate
      else
      begin
        Caption := Text;
        lblText.Caption := Text;
      end;
      edtDate.Value := aDate;
      if ShowModal = mrOk then
      begin
        aDate := edtDate.Value;
        Result := True;
      end;
    finally
      Free;
    end;
end;

procedure TSelDateForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    frm1bbOkClick(Sender);
end;

procedure TSelDateForm.frm1bbOkClick(Sender: TObject);
begin
  frm1.actExitExecute(Sender);
end;

end.
