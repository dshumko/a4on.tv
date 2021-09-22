unit ActDisActServicesForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OkCancel_frame, DBGridEh, StdCtrls, DBCtrlsEh, Mask, DBLookupEh;

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
