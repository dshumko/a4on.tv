unit TimeShiftForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  DBCtrlsEh;

type
  TTimeShiftForm = class(TForm)
    pnlBottom: TPanel;
    btnOk: TButton;
    btnCancel: TButton;
    ednMinutes: TDBNumberEditEh;
    chkUTC: TDBCheckBoxEh;
    chkLocal: TDBCheckBoxEh;
    chkUpdateDVB: TDBCheckBoxEh;
    lbl1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TimeShiftForm: TTimeShiftForm;

implementation

{$R *.dfm}

end.
