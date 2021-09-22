unit ReqWorksFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, Grids, DBGridEh, GridsEh,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh,
  EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  TfrmReqWorks = class(TFrame)
    dbGrid: TDBGridEh;
    dsReqWorks: TpFIBDataSet;
    srcDataSource: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
