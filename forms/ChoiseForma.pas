unit ChoiseForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, OkCancel_frame, DBGridEh;

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

uses
  DM;

{$R *.dfm}

end.
