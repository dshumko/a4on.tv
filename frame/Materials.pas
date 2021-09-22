unit Materials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, FIBDataSet, pFIBDataSet, Grids, DBGridEh;

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
