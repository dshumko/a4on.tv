unit fmuNodeAttributes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AtrPages, ToolCtrlsEh, ComCtrls, ToolWin,
  GridsEh, DBGridEh, DB, FIBDataSet, pFIBDataSet, ActnList,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, PrjConst,
  EhLibVCL, System.UITypes, DBGridEhGrouping, DynVarsEh, FIBDatabase,
  pFIBDatabase;

type
  TapgNodeAttributes = class(TA4onPage)
    dsAttributes: TpFIBDataSet;
    srcAttributes: TDataSource;
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
    procedure EnableControls;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses MAIN, AtrCommon, DM, NodesForma, NodeAttributeForma;

class function TapgNodeAttributes.GetPageName: string;
begin
  Result := rsClmnAttributes;
end;

procedure TapgNodeAttributes.InitForm;
var
  FullAccess: Boolean;
begin
  FullAccess := (dmMain.AllowedAction(rght_Dictionary_Nodes));
  tbAttributes.Visible := (dmMain.AllowedAction(rght_Dictionary_Nodes)) or FullAccess;
  actAdd.Visible := tbAttributes.Visible;
  actDel.Visible := tbAttributes.Visible;
  actEdit.Visible := tbAttributes.Visible;
  dsAttributes.DataSource := FDataSource;
end;

procedure TapgNodeAttributes.EnableControls;
begin
  actEdit.Enabled := dsAttributes.RecordCount > 0;
  actDel.Enabled := dsAttributes.RecordCount > 0;
end;

procedure TapgNodeAttributes.OpenData;
begin
  dsAttributes.Open;
  EnableControls;
end;

procedure TapgNodeAttributes.actAddExecute(Sender: TObject);
begin
  if EditAttribute(FDataSource.DataSet['NODE_ID'], '') then
  begin
    dsAttributes.CloseOpen(true);
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgNodeAttributes.actDelExecute(Sender: TObject);
begin
  if srcAttributes.DataSet.State in [dsInsert, dsEdit] then
    srcAttributes.DataSet.Cancel
  else
  begin
    if ((not dsAttributes.Active) or (dsAttributes.RecordCount = 0)) then
      Exit;
    if (not srcAttributes.DataSet.FieldByName('O_NAME').IsNull) then
    begin
      if (MessageDlg(Format(rsDeleteWithName, [srcAttributes.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
        = mrYes) then
      begin
        srcAttributes.DataSet.Delete;
        EnableControls;
        UpdatePage;
      end;
    end;
  end;
end;

procedure TapgNodeAttributes.actEditExecute(Sender: TObject);
begin
  if ((not dsAttributes.Active) or (dsAttributes.RecordCount = 0)) then
    Exit;
  if (dsAttributes.FieldByName('O_NAME').IsNull) or (dsAttributes.FieldByName('NA_ID').IsNull) or
    (FDataSource.DataSet.FieldByName('NODE_ID').IsNull) then
    Exit;
  if EditAttribute(FDataSource.DataSet['NODE_ID'], dsAttributes['O_NAME'], dsAttributes['NA_ID']) then
  begin
    dsAttributes.Refresh;
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgNodeAttributes.CloseData;
begin
  dsAttributes.Close;
end;

procedure TapgNodeAttributes.dbgCustAttrDblClick(Sender: TObject);
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
