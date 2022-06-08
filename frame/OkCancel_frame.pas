unit OkCancel_frame;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ActnList;

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
