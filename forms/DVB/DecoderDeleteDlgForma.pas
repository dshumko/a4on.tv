unit DecoderDeleteDlgForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh,
  Vcl.ExtCtrls;

type
  TDecoderDeleteDlg = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    pnl1: TPanel;
    lblState: TLabel;
    cbbState: TDBComboBoxEh;
    pnlSTB: TPanel;
    lblSTB: TLabel;
    cbSTB: TDBComboBoxEh;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function DeleteDecoderDialog(const decoder: String): integer;
function DeleteDecoderStbDialog(const decoder: String; const stb: String; var s_dec, s_stb: integer): boolean;

implementation

{$R *.dfm}

uses DM, PrjConst;

function DeleteDecoderDialog(const decoder: String): integer;
var
  i: integer;
begin
  Result := -1;
  with TDecoderDeleteDlg.Create(Application) do
    try
      lblState.Caption := lblState.Caption + decoder;
      cbbState.Value := 1;
      if (not(dmMain.AllowedAction(rght_Digit_DelEQP))) then begin
        cbbState.Items.Text := 'На складе';
        cbbState.KeyItems.Text := '1';
      end;
      if ShowModal = mrOk
      then begin
        if TryStrToInt(cbbState.Value, i)
        then Result := i;
      end
    finally Free;
    end;
end;

function DeleteDecoderStbDialog(const decoder: String; const stb: String; var s_dec, s_stb: integer): boolean;
var
  i: integer;
begin
  Result := False;
  s_dec := -1;
  s_stb := -1;
  with TDecoderDeleteDlg.Create(Application) do
    try
      lblState.Caption := lblState.Caption + ' ' + decoder;
      cbbState.Value := 1;
      if (not(dmMain.AllowedAction(rght_Digit_DelEQP))) then begin
        cbbState.Items.Text := 'На складе';
        cbbState.KeyItems.Text := '1';
        cbSTB.Items.Text := 'На складе';
        cbSTB.KeyItems.Text := '1';
      end;

      pnlSTB.Visible := (stb <> '');
      lblSTB.Caption := lblSTB.Caption + ' ' + stb;
      cbSTB.Value := 1;

      if ShowModal = mrOk
      then begin
        if TryStrToInt(cbbState.Value, i)
        then begin
          s_dec := i;
          if TryStrToInt(cbSTB.Value, i)
          then s_stb := i
          else s_stb := s_dec;
          Result := True;
        end;
      end
    finally Free;
    end;
end;

end.
