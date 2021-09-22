unit ReqCancelForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, OkCancel_frame;

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
