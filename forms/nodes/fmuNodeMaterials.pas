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
    ActList: TActionList;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    actAdd: TAction;
    actDel: TAction;
    btnFind: TSpeedButton;
    actFind: TAction;
    dsEquipment: TpFIBDataSet;
    srcEquipment: TDataSource;
    dbgEquip: TDBGridEh;
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

  dsEquipment.DataSource := FDataSource;
end;

procedure TapgNodeMaterials.OpenData;
begin
  dsEquipment.Open;
  // EnableControls;
end;

procedure TapgNodeMaterials.actAddExecute(Sender: TObject);
begin
  if (FDataSource.DataSet.RecordCount = 0) or (FDataSource.DataSet.FieldByName('NODE_ID').IsNull) then
    Exit;
  if AddMaterial(FDataSource.DataSet['NODE_ID']) then
  begin
    dsEquipment.CloseOpen(True);
    UpdatePage;
  end
end;

procedure TapgNodeMaterials.actDelExecute(Sender: TObject);
begin
  if ((not dsEquipment.Active) or (dsEquipment.RecordCount = 0) or (dsEquipment.FieldByName('NAME').IsNull)) then
    Exit;

  if ((dsEquipment.FieldByName('ROW_TYPE').AsString = 'e')) then
    Exit;

  if (MessageDlg(Format(rsDeleteWithName, [dsEquipment['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dsEquipment.Delete;
    UpdatePage;
  end;
end;

procedure TapgNodeMaterials.actFindExecute(Sender: TObject);
begin
  if (not dsEquipment.Active) or (dsEquipment.RecordCount = 0) then
    Exit;

  if (dsEquipment.FieldByName('NAME').IsNull) then
    Exit;

  A4MainForm.OpenEquipmentByName(dsEquipment['NAME']);
end;

procedure TapgNodeMaterials.CloseData;
begin
  dsEquipment.Close;
end;

end.
