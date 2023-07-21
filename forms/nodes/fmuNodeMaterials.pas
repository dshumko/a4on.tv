unit fmuNodeMaterials;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnList, Vcl.Buttons, Vcl.ExtCtrls,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, MemTableDataEh, DataDriverEh, pFIBDataDriverEh,
  MemTableEh, Vcl.Grids, Vcl.DBGrids;

type
  TapgNodeMaterials = class(TA4onPage)
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    srcMat: TDataSource;
    ActList: TActionList;
    dsMat: TpFIBDataSet;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    actAdd: TAction;
    actDel: TAction;
    btnFind: TSpeedButton;
    actFind: TAction;
    dbgrd1: TDBGrid;
    procedure actDelExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
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

uses
  MAIN, AtrCommon, DM, RequestForma, NodeMaterialForma;

class function TapgNodeMaterials.GetPageName: string;
begin
  Result := rsEQUIPMENT;
end;

procedure TapgNodeMaterials.InitForm;
begin
  FullAccess := dmMain.AllowedAction(rght_Materials_full);

  actAdd.Enabled := FullAccess;
  actDel.Enabled := FullAccess;

  dsMat.DataSource := FDataSource;
end;

procedure TapgNodeMaterials.OpenData;
begin
  dsMat.Open;
  // EnableControls;
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

  if ((srcMat.DataSet.FieldByName('ROW_TYPE').AsString = 'e')) then
    Exit;

  if (MessageDlg(Format(rsDeleteWithName, [srcMat.DataSet['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    srcMat.DataSet.Delete;
    UpdatePage;
  end;
end;

procedure TapgNodeMaterials.actFindExecute(Sender: TObject);
begin
  if (not dsMat.Active) or (dsMat.RecordCount = 0) then
    Exit;

  if (dsMat.FieldByName('NAME').IsNull) then
    Exit;

  A4MainForm.OpenEquipmentByName(dsMat['NAME']);
end;

procedure TapgNodeMaterials.CloseData;
begin
  dsMat.Close;
end;

end.
