unit fmuNodeLink;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, VCL.Graphics, VCL.Forms,
  VCL.Dialogs, VCL.ComCtrls, VCL.ToolWin, VCL.Controls, VCL.Buttons,
  VCL.ExtCtrls, VCL.ActnList, Data.DB, System.Actions, System.UITypes,

  PrjConst, AtrPages, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TapgNodeLink = class(TA4onPage)
    dsLink: TpFIBDataSet;
    srcLink: TDataSource;
    dbgNodeLink: TDBGridEh;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    qRead: TpFIBQuery;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnAdd: TSpeedButton;
    pnlRow: TPanel;
    dbgDetail: TDBGridEh;
    dsEQ: TpFIBDataSet;
    srcEQ: TDataSource;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbgNodeLinkGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure dbgNodeLinkDblClick(Sender: TObject);
    procedure dbgNodeLinkRowDetailPanelShow(Sender: TCustomDBGridEh;
      var CanShow: Boolean);
    procedure dbgNodeLinkRowDetailPanelHide(Sender: TCustomDBGridEh;
      var CanHide: Boolean);
  private
    { Private declarations }
    procedure EnableControls;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    procedure UpdateObject; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses
  MAIN, A4onTypeUnit, AtrCommon, DM, NodeLinkForma;

class function TapgNodeLink.GetPageName: string;
begin
  Result := rsClmnLink;
end;

procedure TapgNodeLink.InitForm;
var
  FullAccess: Boolean;
begin
  FullAccess := (dmMain.AllowedAction(rght_Dictionary_Nodes)) or (dmMain.AllowedAction(rght_Dictionary_Nodes));

  pnlButtons.Visible := FullAccess;
  actAdd.Visible := pnlButtons.Visible;
  actDel.Visible := pnlButtons.Visible;
  actEdit.Visible := pnlButtons.Visible;

  dsLink.DataSource := FDataSource;
end;

procedure TapgNodeLink.EnableControls;
begin
  actEdit.Enabled := dsLink.RecordCount > 0;
  actDel.Enabled := dsLink.RecordCount > 0;
end;

procedure TapgNodeLink.OpenData;
begin
  dsLink.Open;
  EnableControls;
end;

procedure TapgNodeLink.actAddExecute(Sender: TObject);
var
  LinkItem, SecondItem: TNodeLinkItem;
begin
  if (FDataSource.DataSet.RecordCount = 0) then
    Exit;
  LinkItem.LINK_ID := -1;
  LinkItem.NODE_ID := FDataSource.DataSet['NODE_ID'];
  if (not FDataSource.DataSet.FieldByName('NAME').IsNull) then
    LinkItem.NODE_Name := FDataSource.DataSet['NAME']
  else
    LinkItem.NODE_Name := '';
  SecondItem.NODE_ID := -1;

  if LinkNodes(LinkItem, SecondItem) then
  begin
    dsLink.CloseOpen(true);
    dsLink.Locate('WID', LinkItem.LINK_ID, []);
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgNodeLink.actDelExecute(Sender: TObject);
begin
  if ((not dsLink.Active) or (dsLink.RecordCount = 0)) then
    Exit;
  if (not dsLink.FieldByName('NAME').IsNull) then
  begin
    if (MessageDlg(Format(rsDeleteWithName, [dsLink['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      dsLink.Delete;
      EnableControls;
      UpdatePage;
    end;
  end;
end;

procedure TapgNodeLink.actEditExecute(Sender: TObject);
var
  LinkItem, SecondItem: TNodeLinkItem;
begin
  if (FDataSource.DataSet.RecordCount = 0) then
    Exit;
  if ((not dsLink.Active) or (dsLink.RecordCount = 0)) then
    Exit;
  if (dsLink.FieldByName('NAME').IsNull) or (dsLink.FieldByName('WID').IsNull) or
    (FDataSource.DataSet.FieldByName('NODE_ID').IsNull) then
    Exit;

  // редактируем только если с этого узла
  if (dsLink['FLOW'] = '>') then
  begin
    LinkItem.NODE_ID := FDataSource.DataSet['NODE_ID'];
    LinkItem.LINK_ID := dsLink['WID'];
    if (not FDataSource.DataSet.FieldByName('NAME').IsNull) then
      LinkItem.NODE_Name := FDataSource.DataSet['NAME']
    else
      LinkItem.NODE_Name := '';

    if (not dsLink.FieldByName('Node_Id').IsNull) then
      SecondItem.NODE_ID := dsLink['Node_Id']
    else
      SecondItem.NODE_ID := -1;
  end
  else
  begin
    LinkItem.LINK_ID := dsLink['WID'];
    if (not dsLink.FieldByName('Node_Id').IsNull) then
      LinkItem.NODE_ID := dsLink['Node_Id']
    else
      LinkItem.NODE_ID := -1;
    if (not dsLink.FieldByName('CONN_NODE').IsNull) then
      LinkItem.NODE_Name := dsLink['CONN_NODE']
    else
      LinkItem.NODE_Name := '';

    SecondItem.NODE_ID := FDataSource.DataSet['NODE_ID'];
    if (not FDataSource.DataSet.FieldByName('NAME').IsNull) then
      SecondItem.NODE_Name := FDataSource.DataSet['NAME']
    else
      SecondItem.NODE_Name := '';
  end;

  if LinkNodes(LinkItem, SecondItem) then
  begin
    dsLink.Refresh;
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgNodeLink.CloseData;
begin
  dsLink.Close;
end;

procedure TapgNodeLink.dbgNodeLinkDblClick(Sender: TObject);
begin
  if dsLink.RecordCount = 0 then
  begin
    if actAdd.Enabled then
      actAdd.Execute;
  end
  else
  begin
    if actEdit.Enabled then
      actEdit.Execute
  end;
end;

procedure TapgNodeLink.dbgNodeLinkGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsLink.RecordCount > 0) and (not(dsLink.FieldByName('COLOR').IsNull)) then
    Background := StringToColor(dsLink.FieldByName('COLOR').Value);
end;

procedure TapgNodeLink.dbgNodeLinkRowDetailPanelHide(
  Sender: TCustomDBGridEh; var CanHide: Boolean);
begin
  dsEQ.Close;
end;

procedure TapgNodeLink.dbgNodeLinkRowDetailPanelShow(
  Sender: TCustomDBGridEh; var CanShow: Boolean);
begin
  dsEQ.Open;
end;

procedure TapgNodeLink.UpdateObject;
var
  bm: TBookmark;

begin
  if not dsLink.Active then
    Exit;
  if dsLink.RecordCount > 0 then
    bm := dsLink.GetBookmark;
  dsLink.CloseOpen(true);
  if Assigned(bm) then
    dsLink.GotoBookmark(bm);
end;

end.
