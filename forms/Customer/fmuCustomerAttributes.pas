unit fmuCustomerAttributes;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnList,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TapgCustomerAttributes = class(TA4onPage)
    dsCustAttributes: TpFIBDataSet;
    srcCustAttributes: TDataSource;
    dbgCustAttr: TDBGridEh;
    ActListCustomers: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbgCustAttrDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure EnableControls;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses
  MAIN, AtrCommon, DM, EditAttributeForma;

class function TapgCustomerAttributes.GetPageName: string;
begin
  Result := rsClmnAttributes;
end;

procedure TapgCustomerAttributes.InitForm;
var
  FullAccess: Boolean;
begin

  FullAccess := (dmMain.AllowedAction(rght_Customer_full)); // Полный доступ
  // атрибуты
  pnlButtons.Visible := (dmMain.AllowedAction(rght_Customer_Attribute)) or (dmMain.AllowedAction(rght_Customer_edit)) or
    FullAccess;
  actAdd.Visible := pnlButtons.Visible;
  actDel.Visible := pnlButtons.Visible;
  actEdit.Visible := pnlButtons.Visible;

  dsCustAttributes.DataSource := FDataSource;
end;

procedure TapgCustomerAttributes.EnableControls;
begin
  actEdit.Enabled := dsCustAttributes.RecordCount > 0;
  actDel.Enabled := dsCustAttributes.RecordCount > 0;
end;

procedure TapgCustomerAttributes.OpenData;
begin
  if dsCustAttributes.Active then
    dsCustAttributes.Close;
  dsCustAttributes.OrderClause := GetOrderClause(dbgCustAttr);
  dsCustAttributes.Open;
  EnableControls;
end;

procedure TapgCustomerAttributes.actAddExecute(Sender: TObject);
var
  CanAdd: Boolean;
  Terminated: Boolean;
begin
  CanAdd := dmMain.AllowedAction(rght_Customer_full);
  Terminated := (not FDataSource.DataSet.FieldByName('VALID_TO').IsNull) and (FDataSource.DataSet['VALID_TO'] < Now());

  if not CanAdd then
  begin
    CanAdd := (not Terminated) or dmMain.AllowedAction(rght_Customer_Edit_Terminated);
    CanAdd := CanAdd and dmMain.AllowedAction(rght_Customer_Attribute);
  end;

  if not CanAdd then
  begin
    if Terminated then
      ShowMessage(rsContractNotValid);
    exit;
  end;

  if EditAttribute(FDataSource.DataSet['CUSTOMER_ID'], '') then
  begin
    dsCustAttributes.CloseOpen(true);
    EnableControls;
    UpdatePage;
  end;
end;

procedure TapgCustomerAttributes.actDelExecute(Sender: TObject);
var
  AllowDelete: Boolean;
  Terminated: Boolean;
begin
  if dsCustAttributes.RecordCount = 0 then
    exit;

  AllowDelete := dmMain.AllowedAction(rght_Customer_full);
  Terminated := (not FDataSource.DataSet.FieldByName('VALID_TO').IsNull) and (FDataSource.DataSet['VALID_TO'] < Now());

  if not AllowDelete then
  begin
    AllowDelete := (not Terminated) or dmMain.AllowedAction(rght_Customer_Edit_Terminated);
    AllowDelete := AllowDelete and dmMain.AllowedAction(rght_Customer_Attribute);
  end;

  if (not AllowDelete) then
  begin
    if Terminated then
      ShowMessage(rsContractNotValid);
    exit;
  end;

  if dsCustAttributes.State in [dsInsert, dsEdit] then
    dsCustAttributes.Cancel
  else
  begin
    if ((not dsCustAttributes.Active) or (dsCustAttributes.RecordCount = 0)) then
      exit;
    if (not dsCustAttributes.FieldByName('O_NAME').IsNull) then
    begin
      if (MessageDlg(Format(rsDeleteWithName, [dsCustAttributes['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
      then
      begin
        dsCustAttributes.Delete;
        EnableControls;
        UpdatePage;
      end;
    end;
  end;
end;

procedure TapgCustomerAttributes.actEditExecute(Sender: TObject);
var
  CanAdd: Boolean;
  Terminated: Boolean;
begin
  if (dsCustAttributes.RecordCount = 0) or (dsCustAttributes.FieldByName('CA_ID').IsNull) then
    exit;

  CanAdd := dmMain.AllowedAction(rght_Customer_full);
  Terminated := (not FDataSource.DataSet.FieldByName('VALID_TO').IsNull) and (FDataSource.DataSet['VALID_TO'] < Now());

  if not CanAdd then
  begin
    CanAdd := (not Terminated) or dmMain.AllowedAction(rght_Customer_Edit_Terminated);
    CanAdd := CanAdd and dmMain.AllowedAction(rght_Customer_Attribute);
  end;

  if not CanAdd then
  begin
    if Terminated then
      ShowMessage(rsContractNotValid);
    exit;
  end;

  if ((not dsCustAttributes.Active) or (dsCustAttributes.RecordCount = 0)) then
    exit;
  if (dsCustAttributes.FieldByName('O_NAME').IsNull) or (dsCustAttributes.FieldByName('CA_ID').IsNull) or
    (FDataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull) then
    exit;
  if EditAttribute(FDataSource.DataSet['CUSTOMER_ID'], dsCustAttributes['O_NAME'], dsCustAttributes['CA_ID']) then
  begin
    dsCustAttributes.Refresh;
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgCustomerAttributes.CloseData;
begin
  dsCustAttributes.Close;
end;

procedure TapgCustomerAttributes.dbgCustAttrDblClick(Sender: TObject);
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

end.
