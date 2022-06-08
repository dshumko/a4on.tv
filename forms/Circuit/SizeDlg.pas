unit SizeDlg;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  SimpleGraph;

type
  TSizeDialog = class(TForm)
    Horz: TRadioGroup;
    Vert: TRadioGroup;
    btnOK: TButton;
    btnCancel: TButton;
  public
    class function Execute(out HorzSize: TResizeOption;
      out VertSize: TResizeOption): Boolean;
  end;

implementation

{$R *.dfm}

class function TSizeDialog.Execute(out HorzSize: TResizeOption;
  out VertSize: TResizeOption): Boolean;
begin
  Result := False;
  with Create(Application) do
    try
      if ShowModal = mrOK then
      begin
        HorzSize := TResizeOption(Horz.ItemIndex);
        VertSize := TResizeOption(Vert.ItemIndex);
        Result := True;
      end;
    finally
      Free;
    end;
end;

end.
