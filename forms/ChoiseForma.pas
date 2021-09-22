unit ChoiseForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, DBCtrlsEh, DBLookupEh, FIBDataSet,
  pFIBDataSet, OkCancel_frame, DBGridEh;

type
  TChoiseForm = class(TForm)
    OkCancelFrame1: TOkCancelFrame;
    dsChoise: TpFIBDataSet;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    srcChoise: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses DM;

{$R *.dfm}

end.
