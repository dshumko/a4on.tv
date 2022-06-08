unit GroupForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  DBCtrlsEh;

type
  TGF = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEditEh;
    DBCheckBox1: TDBCheckBox;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    Button1: TButton;
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GF: TGF;

implementation

uses
  UsersForma;

{$R *.dfm}

end.
