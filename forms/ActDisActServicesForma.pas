unit ActDisActServicesForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  OkCancel_frame, DBGridEh, DBCtrlsEh, DBLookupEh;

type
  TOnOffServiceForm = class(TForm)
    OkCancelFrame1: TOkCancelFrame;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OnOffServiceForm: TOnOffServiceForm;

implementation

{$R *.dfm}

end.
