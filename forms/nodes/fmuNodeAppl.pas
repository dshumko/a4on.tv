unit fmuNodeAppl;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.Classes, System.Actions, System.SysUtils, System.Variants, System.UITypes,
  Data.DB,
  Vcl.ActnList, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Controls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Graphics, Vcl.Forms, Vcl.Menus,
  Vcl.ToolWin, Vcl.Dialogs,
  FIBDataSet, pFIBDataSet, DBGridEh, DynVarsEh, FIBDatabase, pFIBDatabase, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DBAxisGridsEh, GridsEh, EhLibVCL, DM, PrjConst, AtrPages, A4onTypeUnit;

type
  TapgNodeAppl = class(TA4onPage)
    dsAppliance: TpFIBDataSet;
    srcAppliance: TDataSource;
    dbgAppliance: TDBGridEh;
    ActListCustomers: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbgApplianceDblClick(Sender: TObject);
    procedure srcApplianceDataChange(Sender: TObject; Field: TField);
    procedure srcApplianceStateChange(Sender: TObject);
  private
    FRightEdit: Boolean;
    FRightFull: Boolean;
    procedure EnableControls;
    function GetCustomerInfo: TCustomerInfo;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses
  MAIN, AtrCommon, AtrStrUtils, EditApplianceForma;

class function TapgNodeAppl.GetPageName: string;
begin
  Result := rsAppliance;
end;

procedure TapgNodeAppl.InitForm;
begin
  FRightFull := dmMain.AllowedAction(rght_Dictionary_Nodes); // Полный доступ

  actAdd.Visible := FRightEdit or FRightFull;
  actEdit.Visible := FRightEdit or FRightFull;
  actDel.Visible := FRightEdit or FRightFull;
  pnlButtons.Visible := FRightEdit or FRightFull;

  dsAppliance.DataSource := FDataSource;
end;

procedure TapgNodeAppl.EnableControls;
begin
  actEdit.Enabled := dsAppliance.RecordCount > 0;
  actDel.Enabled := dsAppliance.RecordCount > 0;
end;

procedure TapgNodeAppl.OpenData;
begin
  if dsAppliance.Active then
    dsAppliance.Close;
  dsAppliance.OrderClause := GetOrderClause(dbgAppliance);
  dsAppliance.Open;

  EnableControls;
end;

procedure TapgNodeAppl.srcApplianceDataChange(Sender: TObject; Field: TField);
begin
  EnableControls
end;

procedure TapgNodeAppl.srcApplianceStateChange(Sender: TObject);
begin
  EnableControls;
end;

procedure TapgNodeAppl.actAddExecute(Sender: TObject);
var
  ci: TCustomerInfo;
  aid: Integer;
begin
  ci := GetCustomerInfo;
  if ci.CUSTOMER_ID = -1 then
    Exit;
  aid := EditAppliance(ci, -1);
  if aid > -1 then
  begin
    dsAppliance.CloseOpen(true);
    dsAppliance.Locate('ID', aid, []);
  end;
end;

procedure TapgNodeAppl.actDelExecute(Sender: TObject);
begin
  if dsAppliance.RecordCount = 0 then
    Exit;

  if (MessageDlg(Format(rsDeleteWithName, [dsAppliance['Name']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    dsAppliance.Delete;
  end;
end;

procedure TapgNodeAppl.actEditExecute(Sender: TObject);
var
  ci: TCustomerInfo;
  aid: Integer;
begin
  if (dsAppliance.RecordCount = 0) or (dsAppliance.FieldByName('ID').IsNull) then
    Exit;

  ci := GetCustomerInfo;
  if ci.CUSTOMER_ID <> -1 then
  begin
    aid := EditAppliance(ci, dsAppliance['ID']);
    if aid > -1 then
    begin
      dsAppliance.CloseOpen(true);
      dsAppliance.Locate('ID', aid, []);
    end;
  end;
end;

procedure TapgNodeAppl.CloseData;
begin
  dsAppliance.Close;
end;

procedure TapgNodeAppl.dbgApplianceDblClick(Sender: TObject);
begin
  if (Sender as TDBGridEh).DataSource.DataSet.RecordCount > 0 then
  begin
    if actEdit.Enabled then
      actEdit.Execute;
  end
  else
  begin
    if actAdd.Enabled then
      actAdd.Execute;
  end;
end;

function TapgNodeAppl.GetCustomerInfo: TCustomerInfo;
begin
  with Result do
  begin
    if not FDataSource.DataSet.Eof then
    begin
      isType := 1; // Абонент
      if FDataSource.DataSet.FieldByName('NODE_ID').IsNull then
        CUSTOMER_ID := -1
      else
        CUSTOMER_ID := FDataSource.DataSet['NODE_ID'];

    end
    else
      CUSTOMER_ID := -1;
  end;
end;

end.
