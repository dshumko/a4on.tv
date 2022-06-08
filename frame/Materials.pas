unit Materials;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  FIBDataSet, pFIBDataSet, DBGridEh;

type
  TFrame1 = class(TFrame)
    dbGrid: TDBGridEh;
    dsReqMaterials: TpFIBDataSet;
    srcDataSource: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
