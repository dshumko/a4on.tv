unit UsageHelp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Vcl.Mask, DBCtrlsEh;

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
