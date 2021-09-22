unit fmuNodeLayout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AtrPages, ToolCtrlsEh, ComCtrls, ToolWin,
  GridsEh, DBGridEh, DB, FIBDataSet, pFIBDataSet, ActnList,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, PrjConst,
  EhLibVCL, System.UITypes, DBGridEhGrouping, DynVarsEh, FIBDatabase,
  pFIBDatabase, Vcl.Buttons, Vcl.ExtCtrls;

type
  TapgNodeLayout = class(TA4onPage)
    dsLayout: TpFIBDataSet;
    srcLayout: TDataSource;
    dbgCustAttr: TDBGridEh;
    ActListCustomers: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    pnlBottLeft: TPanel;
    btnAddL: TSpeedButton;
    btnEditL: TSpeedButton;
    btnDelL: TSpeedButton;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbgCustAttrDblClick(Sender: TObject);
    procedure dbgCustAttrGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure srcLayoutDataChange(Sender: TObject; Field: TField);
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

uses MAIN, AtrCommon, DM, NodesForma, NodeLayouteForma, FIBQuery, pFIBQuery;

class function TapgNodeLayout.GetPageName: string;
begin
  Result := rsClmnLayout;
end;

procedure TapgNodeLayout.InitForm;
var
  FullAccess: Boolean;
begin
  FullAccess := (dmMain.AllowedAction(rght_Dictionary_Nodes));
  pnlBottLeft.Visible := (dmMain.AllowedAction(rght_Dictionary_Nodes)) or FullAccess;
  actAdd.Visible := pnlBottLeft.Visible;
  actDel.Visible := pnlBottLeft.Visible;
  actEdit.Visible := pnlBottLeft.Visible;
  dsLayout.DataSource := FDataSource;
end;

procedure TapgNodeLayout.EnableControls;
begin
  actEdit.Enabled := (dsLayout.RecordCount > 0) and (dsLayout['itsOwn'] = 1);
  actDel.Enabled := actEdit.Enabled;
end;

procedure TapgNodeLayout.OpenData;
begin
  dsLayout.Open;
end;

procedure TapgNodeLayout.srcLayoutDataChange(Sender: TObject;
  Field: TField);
begin
  EnableControls;
end;

procedure TapgNodeLayout.actAddExecute(Sender: TObject);
var
  NodeLayoutItem: TNodeLayoutItem;
  NeedInsert: Boolean;
begin
  if (FDataSource.DataSet.RecordCount = 0) then
    Exit;
  if FDataSource.DataSet.FieldByName('NODE_ID').IsNull then
    Exit;

  NeedInsert := True;

  if (dsLayout.RecordCount = 0) or (dsLayout['itsOwn'] = 0) then
  begin
    if FDataSource.DataSet.FieldByName('Type_Id').IsNull then
      Exit;

    if (MessageDlg(rsNodeLayotEmpty, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      with TpFIBQuery.Create(self) do
        try
          DataBase := dmMain.dbTV;
          Transaction := dmMain.trWriteQ;
          SQL.text := 'insert into Node_Layout (Node_Id, M_TYPE, Dev_Cnt, Notice)';
          SQL.Add(' select :Node_Id, M_TYPE, Dev_Cnt,  Notice');
          SQL.Add('from Node_Layout l where l.Node_Id = :O_ID');
          ParamByName('Node_Id').AsInteger := FDataSource.DataSet['NODE_ID'];
          ParamByName('O_ID').AsInteger := -1 * FDataSource.DataSet['Type_Id'];
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
        finally
          Free;
        end;
      dsLayout.CloseOpen(True);
      NeedInsert := (dsLayout.RecordCount = 0);
      EnableControls;
      UpdatePage;
    end;
  end;

  if NeedInsert then
  begin
    NodeLayoutItem.M_TYPE := -1;
    NodeLayoutItem.NODE_ID := FDataSource.DataSet['NODE_ID'];
    if EditLayoute(NodeLayoutItem) then
    begin
      dsLayout.Insert;
      dsLayout['NODE_ID'] := NodeLayoutItem.NODE_ID;
      dsLayout['M_TYPE'] := NodeLayoutItem.M_TYPE;
      dsLayout['DEV_CNT'] := NodeLayoutItem.quant;
      dsLayout['O_NAME'] := NodeLayoutItem.Name;
      dsLayout['NOTICE'] := NodeLayoutItem.notice;
      dsLayout.Post;
      // dsLayout.CloseOpen(true);
      EnableControls;
      UpdatePage;
    end
  end;
end;

procedure TapgNodeLayout.actDelExecute(Sender: TObject);
begin
  if ((not dsLayout.Active) or (dsLayout.RecordCount = 0)) then
    Exit;
  if (dsLayout['itsOwn'] = 0) then
  begin
    ShowMessage(rsLayoutNotDefined);
    Exit;
  end;
  if (not srcLayout.DataSet.FieldByName('O_NAME').IsNull) then
  begin
    if (MessageDlg(Format(rsDeleteWithName, [srcLayout.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then
    begin
      srcLayout.DataSet.Delete;
      EnableControls;
      UpdatePage;
    end;
  end;
end;

procedure TapgNodeLayout.actEditExecute(Sender: TObject);
var
  NodeLayoutItem: TNodeLayoutItem;
begin
  if ((not dsLayout.Active) or (dsLayout.RecordCount = 0)) then
    Exit;
  if (dsLayout['itsOwn'] = 0) then
  begin
    ShowMessage(rsLayoutNotDefined);
    Exit;
  end;
  if (dsLayout.FieldByName('O_NAME').IsNull) or (dsLayout.FieldByName('M_TYPE').IsNull) or
    (FDataSource.DataSet.FieldByName('NODE_ID').IsNull) then
    Exit;

  NodeLayoutItem.M_TYPE := dsLayout['M_TYPE'];
  NodeLayoutItem.quant := dsLayout['DEV_CNT'];
  NodeLayoutItem.NODE_ID := FDataSource.DataSet['NODE_ID'];
  if (not dsLayout.FieldByName('NOTICE').IsNull) then
    NodeLayoutItem.notice := dsLayout['NOTICE'];
  if EditLayoute(NodeLayoutItem) then
  begin
    dsLayout.Edit;
    dsLayout['NODE_ID'] := NodeLayoutItem.NODE_ID;
    dsLayout['M_TYPE'] := NodeLayoutItem.M_TYPE;
    dsLayout['DEV_CNT'] := NodeLayoutItem.quant;
    dsLayout['NOTICE'] := NodeLayoutItem.notice;
    dsLayout.Post;
    // dsLayout.CloseOpen(true);
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgNodeLayout.CloseData;
begin
  dsLayout.Close;
end;

procedure TapgNodeLayout.dbgCustAttrDblClick(Sender: TObject);
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

procedure TapgNodeLayout.dbgCustAttrGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsLayout['itsOwn'] = 0) then
    AFont.Color := clGrayText
  else
    AFont.Color := clWindowText;
end;

end.
