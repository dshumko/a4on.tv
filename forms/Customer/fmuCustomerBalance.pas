unit fmuCustomerBalance;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Menus, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnList, Vcl.Buttons,
  Vcl.ExtCtrls,
  EhLibVCL, DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, MemTableDataEh, DataDriverEh, pFIBDataDriverEh, MemTableEh,
  FIBDataSet, pFIBDataSet, GridsEh, DBGridEh, AtrPages, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst;

type
  TapgCustomerBalance = class(TA4onPage)
    dbgCustBalance: TDBGridEh;
    dsBalance: TpFIBDataSet;
    srcBalance: TDataSource;
    trRead: TpFIBTransaction;
    mtBalance: TMemTableEh;
    pmGrid: TPopupMenu;
    miN1: TMenuItem;
    miN2: TMenuItem;
    procedure miN1Click(Sender: TObject);
    procedure miN2Click(Sender: TObject);
    procedure dbgCustBalanceCellMouseClick(Grid: TCustomGridEh;
      Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer; var Processed: Boolean);
  private
    // FFine: boolean;
    // FTodayOnly: boolean;
    // FOnlyTheir: boolean;
    // FSavedID: Integer;
    // procedure DisableControls;
    // procedure EnableControls;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    procedure SavePosition; override;
    procedure GotoSavedPosition; override;
    class function GetPageName: string; override;
  end;

implementation

uses
  DM, pFIBQuery, PaymentForma, PaymentDocForma, MAIN;

{$R *.dfm}

class function TapgCustomerBalance.GetPageName: string;
begin
  Result := rsBALANCE;
end;

procedure TapgCustomerBalance.SavePosition;
begin
  //
end;

procedure TapgCustomerBalance.GotoSavedPosition;
begin
  //
end;

procedure TapgCustomerBalance.InitForm;
begin
  dsBalance.DataSource := FDataSource;
  // mtBalance.MasterSource := FDataSource;
  // drvFIB.SelectCommand.Params.ParamByName('CUSTOMER_ID').AsInteger := FDataSource.DataSet['CUSTOMER_ID'];
end;

procedure TapgCustomerBalance.miN1Click(Sender: TObject);
begin
  dbgCustBalance.DataGrouping.GroupLevels[0].CollapseNodes;
  dbgCustBalance.DataGrouping.GroupLevels[1].CollapseNodes;
end;

procedure TapgCustomerBalance.miN2Click(Sender: TObject);
begin
  dbgCustBalance.DataGrouping.GroupLevels[0].ExpandNodes;
  dbgCustBalance.DataGrouping.GroupLevels[1].ExpandNodes;
end;

procedure TapgCustomerBalance.OpenData;
begin
  if dsBalance.Active then
    dsBalance.Close;
  dsBalance.Open;
  srcBalance.DataSet.DisableControls;
  mtBalance.LoadFromDataSet(dsBalance, -1, lmCopy, false);
  mtBalance.Open;
  srcBalance.DataSet.EnableControls;
  dsBalance.Close;
  if mtBalance.RecordCount > 0 then
  begin
    dbgCustBalance.DataGrouping.Active := True;
    dbgCustBalance.DataGrouping.GroupLevels[0].ExpandNodes;
    dbgCustBalance.DataGrouping.GroupLevels[1].CollapseNodes;
    dbgCustBalance.DataGrouping.CurDataNode.Expanded := True;
  end;
end;

procedure TapgCustomerBalance.CloseData;
begin
  dsBalance.Close;
end;

procedure TapgCustomerBalance.dbgCustBalanceCellMouseClick(
  Grid: TCustomGridEh; Cell: TGridCoord; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; var Processed: Boolean);
var
  CurDataNode: TGroupDataTreeNodeEh;
begin
  if (ssDouble in Shift) and ((Grid as TDBGridEh).DataGrouping.Active) then
  begin
    CurDataNode := (Grid as TDBGridEh).DataGrouping.CurDataNode;
    if CurDataNode.NodeType = dntDataGroupEh then
      CurDataNode.Expanded := not CurDataNode.Expanded;
  end;
end;

end.
