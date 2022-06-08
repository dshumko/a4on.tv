unit SUBDIVForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls,
  GridForma, GridsEh, DBGridEh, MemTableDataEh, FIBDataSet, MemTableEh, DataDriverEh, pFIBDataDriverEh, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, DBGridEhGrouping, DynVarsEh, CnErrorProvider, EhLibVCL;

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
