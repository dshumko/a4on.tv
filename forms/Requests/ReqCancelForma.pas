unit ReqCancelForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  DBCtrlsEh, OkCancel_frame;

type
  TReqCancelForm = class(TForm)
    frmBtns: TOkCancelFrame;
    edtDate: TDBDateTimeEditEh;
    lbl: TLabel;
    mmoResult: TDBMemoEh;
    lbl1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReqCancelForm: TReqCancelForm;

implementation

{$R *.dfm}

end.
