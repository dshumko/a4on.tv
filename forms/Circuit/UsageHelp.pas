unit UsageHelp;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask,
  DBCtrlsEh;

type
  THelpOnActions = class(TForm)
    btnClose: TButton;
    mmoKeys: TDBMemoEh;
  public
    class procedure Execute;
  end;

implementation

{$R *.dfm}

{ THelpOnActions }

class procedure THelpOnActions.Execute;
begin
  with Create(Application) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

end.
