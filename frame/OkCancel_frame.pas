unit OkCancel_frame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, Buttons, ExtCtrls, ActnList;

type
  TOkCancelFrame = class(TFrame)
    Label2: TLabel;
    Label1: TLabel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    procedure actExitExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TOkCancelFrame.actExitExecute(Sender: TObject);
begin
  bbOk.ModalResult := mrOk;
end;

end.
