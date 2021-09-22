unit SUBDIVForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, Menus, ActnList, DB, ComCtrls,
  ToolWin, GridsEh, DBGridEh, MemTableDataEh, FIBDataSet,
  MemTableEh, DataDriverEh, pFIBDataDriverEh, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, DBGridEhGrouping, DynVarsEh, CnErrorProvider,
  EhLibVCL;

type
  TSubDivForm = class(TGridForm)
    pfbdtdrvrh1: TpFIBDataDriverEh;
    mtSUBDIV: TMemTableEh;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SubDivForm: TSubDivForm;

implementation

uses
  DM;

{$R *.dfm}

procedure TSubDivForm.FormShow(Sender: TObject);
begin
  inherited;
  mtSUBDIV.Active := True;
end;

end.
