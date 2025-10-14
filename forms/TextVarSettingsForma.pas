unit TextVarSettingsForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DBCtrlsEh;

type
  TTextVarSettings = class(TForm)
    edtName: TDBEditEh;
    edtRegexp: TDBEditEh;
    edtPropmpt: TDBEditEh;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    btn1: TButton;
    btnCancel: TButton;
  private
    procedure SetValue(value: string);
    function GetValue: string;
  public
    property Settings: string read GetValue write SetValue;
  end;

function EditTextVarSettings(var aSettings: String): Boolean;

implementation

{$R *.dfm}

uses System.StrUtils, System.Types;

function EditTextVarSettings(var aSettings: String): Boolean;
begin
  with TTextVarSettings.Create(Application) do
    try
      Settings := aSettings;
      if ShowModal = mrOk then
      begin
        aSettings := Settings;
        result := True;
      end
      else
        result := false;

    finally
      free
    end;
end;

procedure TTextVarSettings.SetValue(value: string);
var
  sa : TStringDynArray;
begin
  // меняем двойной || на символы чтоб корректно разбить строук
  sa := SplitString(value.Replace('||', '@^#'), '|');
  if Length(sa) > 0 then
    edtName.Text := sa[0];
  if Length(sa) > 1 then
    edtPropmpt.Text := sa[1];
  if Length(sa) > 2 then
    edtRegexp.Text := sa[2].Replace('@^#', '|');
end;

function TTextVarSettings.GetValue: string;
begin
  Result := edtName.Text + '|' + edtPropmpt.Text + '|' + edtRegexp.Text;
end;

end.
