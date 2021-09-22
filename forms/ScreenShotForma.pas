unit ScreenShotForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Imaging.jpeg;

type
  TScreenShotForm = class(TForm)
    pnlTop: TPanel;
    scrlbx: TScrollBox;
    btn1: TButton;
    lblInfo: TLabel;
    imgScreen: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
