unit fmuNodeMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AtrPages, ToolCtrlsEh, ComCtrls, ToolWin,
  GridsEh, DBGridEh, DB, FIBDataSet, pFIBDataSet, ActnList,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, PrjConst,
  EhLibVCL, System.UITypes, DBGridEhGrouping, DynVarsEh, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, MemTableDataEh, DataDriverEh,
  pFIBDataDriverEh, MemTableEh, Vcl.Buttons, Vcl.ExtCtrls;

type
  TapgNodeMaterials = class(TA4onPage)
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dbgMat: TDBGridEh;
    srcMat: TDataSource;
    ActListCustomers: TActionList;
    dsMat: TpFIBDataSet;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    actAdd: TAction;
    actDel: TAction;
    procedure actDelExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
  private
    FullAccess: Boolean;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses MAIN, AtrCommon, DM, RequestForma, NodeMaterialForma;

class function TapgNodeMaterials.GetPageName: string;
begin
  Result := rsEQUIPMENT;
end;

procedure TapgNodeMaterials.InitForm;
begin
  dsMat.DataSource := FDataSource;

  FullAccess := dmMain.AllowedAction(rght_Materials_full);

  actAdd.Enabled := FullAccess;
  actDel.Enabled := FullAccess;
end;

procedure TapgNodeMaterials.OpenData;
begin
  dsMat.Open;
end;

procedure TapgNodeMaterials.actAddExecute(Sender: TObject);
begin
  if (FDataSource.DataSet.RecordCount = 0) or (FDataSource.DataSet.FieldByName('NODE_ID').IsNull) then
    Exit;
  if AddMaterial(FDataSource.DataSet['NODE_ID']) then
  begin
    dsMat.CloseOpen(True);
    UpdatePage;
  end
end;

procedure TapgNodeMaterials.actDelExecute(Sender: TObject);
begin
  if ((not dsMat.Active) or (dsMat.RecordCount = 0) or (srcMat.DataSet.FieldByName('NAME').IsNull)) then
    Exit;

  if (MessageDlg(Format(rsDeleteWithName, [srcMat.DataSet['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    srcMat.DataSet.Delete;
    UpdatePage;
  end;
end;

procedure TapgNodeMaterials.CloseData;
begin
  dsMat.Close;
end;

end.
