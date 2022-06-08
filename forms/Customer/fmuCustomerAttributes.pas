unit fmuCustomerAttributes;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnList,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase;

type
  TapgCustomerAttributes = class(TA4onPage)
    dsCustAttributes: TpFIBDataSet;
    srcCustAttributes: TDataSource;
    dbgCustAttr: TDBGridEh;
    tbAttributes: TToolBar;
    btnAdd: TToolButton;
    btnEdit: TToolButton;
    btnDel: TToolButton;
    ActListCustomers: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
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
  tbAttributes.Visible := (dmMain.AllowedAction(rght_Customer_Attribute)) or (dmMain.AllowedAction(rght_Customer_edit))
    or FullAccess;
  actAdd.Visible := tbAttributes.Visible;
  actDel.Visible := tbAttributes.Visible;
  actEdit.Visible := tbAttributes.Visible;

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
begin
  // dsCustAttributes.append;
  if EditAttribute(FDataSource.DataSet['CUSTOMER_ID'], '') then
  begin
    // dsCustAttributes.Post;
    dsCustAttributes.CloseOpen(true);
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgCustomerAttributes.actDelExecute(Sender: TObject);
begin
  if srcCustAttributes.DataSet.State in [dsInsert, dsEdit] then
    srcCustAttributes.DataSet.Cancel
  else
  begin
    if ((not dsCustAttributes.Active) or (dsCustAttributes.RecordCount = 0)) then
      Exit;
    if (not srcCustAttributes.DataSet.FieldByName('O_NAME').IsNull) then
    begin
      if (MessageDlg(Format(rsDeleteWithName, [srcCustAttributes.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
        = mrYes) then
      begin
        srcCustAttributes.DataSet.Delete;
        EnableControls;
        UpdatePage;
      end;
    end;
  end;
end;

procedure TapgCustomerAttributes.actEditExecute(Sender: TObject);
begin
  // dsCustAttributes.Edit;
  if ((not dsCustAttributes.Active) or (dsCustAttributes.RecordCount = 0)) then
    Exit;
  if (dsCustAttributes.FieldByName('O_NAME').IsNull) or (dsCustAttributes.FieldByName('CA_ID').IsNull) or
    (FDataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull) then
    Exit;
  if EditAttribute(FDataSource.DataSet['CUSTOMER_ID'], dsCustAttributes['O_NAME'], dsCustAttributes['CA_ID']) then
  begin
    // dsCustAttributes.Post;
    dsCustAttributes.Refresh;
    EnableControls;
    UpdatePage;
  end
  // else dsCustAttributes.Cancel;
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
