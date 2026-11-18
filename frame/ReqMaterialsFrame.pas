unit ReqMaterialsFrame;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  FIBDataSet, DBGridEh, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, EhLibVCL, DBGridEhGrouping,
  DynVarsEh;

type
  TfrmReqMaterials = class(TFrame)
    dbGrid: TDBGridEh;
    dsReqMaterials: TFIBDataSet;
    srcDataSource: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
