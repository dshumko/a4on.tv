unit ReqWorksFrame;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,
  FIBDataSet, pFIBDataSet, DBGridEh, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, EhLibVCL, DBGridEhGrouping,
  DynVarsEh;

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
