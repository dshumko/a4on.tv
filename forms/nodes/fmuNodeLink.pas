﻿unit fmuNodeLink;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Controls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ActnList,
  Vcl.Menus,
  PrjConst, AtrPages, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, A4onTypeUnit;

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
    actPEdit: TAction;
    pnlDBtns: TPanel;
    actOpenObject: TAction;
    btnFindCustomer: TSpeedButton;
    pmOpen: TPopupMenu;
    miEqpmnt: TMenuItem;
    miNodeFrom: TMenuItem;
    actOpenEqpmnt: TAction;
    actOpenCustomer: TAction;
    btnLink: TSpeedButton;
    actWireLink: TAction;
    btnDel: TSpeedButton;
    pmGrid: TPopupMenu;
    miWireLink: TMenuItem;
    miAdd: TMenuItem;
    miN1: TMenuItem;
    miEdit: TMenuItem;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbgNodeLinkGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure dbgNodeLinkDblClick(Sender: TObject);
    procedure dbgNodeLinkRowDetailPanelShow(Sender: TCustomDBGridEh; var CanShow: Boolean);
    procedure dbgNodeLinkRowDetailPanelHide(Sender: TCustomDBGridEh; var CanHide: Boolean);
    procedure dbgDetailDblClick(Sender: TObject);
    procedure actPEditExecute(Sender: TObject);
    procedure actOpenObjectExecute(Sender: TObject);
    procedure actOpenEqpmntExecute(Sender: TObject);
    procedure actOpenCustomerExecute(Sender: TObject);
    procedure actWireLinkExecute(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
  private
    FRightEdit: Boolean;
    FRightFull: Boolean;
    procedure EnableControls;
    function GetEquipmentRecord: TEquipmentRecord;
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
  MAIN, AtrCommon, DM, NodeLinkForma, WireLinkForma, EQPort;

class function TapgNodeLink.GetPageName: string;
begin
  Result := rsClmnLink;
end;

procedure TapgNodeLink.InitForm;
begin
  FRightFull := (dmMain.AllowedAction(rght_Dictionary_full)) or (dmMain.AllowedAction(rght_Comm_Nodes));
  FRightEdit := (dmMain.AllowedAction(rght_Comm_Node_Links));

  pnlButtons.Visible := FRightFull or FRightEdit;
  actAdd.Visible := pnlButtons.Visible;
  actDel.Visible := pnlButtons.Visible;
  actEdit.Visible := pnlButtons.Visible;

  actPEdit.Enabled := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Comm_Equipment) or
    dmMain.AllowedAction(rght_Comm_Equipment_Ports);

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
  LinkItem.NODE_Name := '';
  LinkItem.NODE_TYPE := '';
  LinkItem.NODE_ID := FDataSource.DataSet['NODE_ID'];
  if (not FDataSource.DataSet.FieldByName('NAME').IsNull) then
  begin
    LinkItem.NODE_Name := FDataSource.DataSet['NAME'];
    LinkItem.NODE_TYPE := FDataSource.DataSet['O_NAME']; // тип узла
  end;
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

procedure TapgNodeLink.actOpenCustomerExecute(Sender: TObject);
begin
  if dsEQ.RecordCount = 0 then
    Exit;

  if not dsEQ.FieldByName('CUSTOMER_ID').IsNull then
    A4MainForm.ShowCustomers(7, IntToStr(dsEQ['CUSTOMER_ID']));
end;

procedure TapgNodeLink.actOpenEqpmntExecute(Sender: TObject);
begin
  if ((dsEQ.RecordCount = 0) or (dsEQ.FieldByName('Name').IsNull)) then
    Exit;

  A4MainForm.OpenEquipmentByName(dsEQ['Name']);
end;

procedure TapgNodeLink.actOpenObjectExecute(Sender: TObject);
begin
  pmOpen.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TapgNodeLink.actPEditExecute(Sender: TObject);
var
  EQ: TEquipmentRecord;
  Port: string;
begin
  inherited;

  if not dsEQ.FieldByName('PORT').IsNull then
    Port := dsEQ.FieldByName('PORT').asString
  else
    Exit;

  EQ := GetEquipmentRecord;

  if EQ.id = -1 then
    Exit;

  if EditPort(EQ, Port) then
  begin
    dsLink.Refresh;
    dsEQ.CloseOpen(true);
  end;
end;

procedure TapgNodeLink.actWireLinkExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if (dsLink.FieldByName('POINT_S').IsNull) or (dsLink.FieldByName('POINT_E').IsNull) then
    Exit;

  if (dsLink.FieldByName('LABELS').IsNull) then
    s := ''
  else
    s := dsLink['LABELS'];

  WireLink(dsLink['WID'], s, dsLink['POINT_S'], dsLink['POINT_E']);
  if dsEQ.Active then
    dsEQ.CloseOpen(true);
end;

procedure TapgNodeLink.btnDelClick(Sender: TObject);
begin
  if not(FRightFull or FRightEdit) then
    Exit;

  if (dsEQ.RecordCount = 0) or (dsEQ.FieldByName('WID').IsNull) then
    Exit;

  if Application.MessageBox(PWideChar(rsWireUnLinkQuest), PWideChar(rsWireUnLink),
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
    Exit;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'update Port set WID = null, WLABEL = null where WID = :WID ';
      if not dsEQ.FieldByName('Wlabel').IsNull then
      begin
        SQL.Add(' and WLABEL = :WLABEL ');
        ParamByName('WLABEL').asString := dsEQ['WLABEL'];
      end;
      ParamByName('WID').AsInteger := dsEQ['WID'];
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      Free;
    end;
  end;

  dsEQ.CloseOpen(true);
end;

procedure TapgNodeLink.CloseData;
begin
  dsLink.Close;
end;

procedure TapgNodeLink.dbgDetailDblClick(Sender: TObject);
var
  ScrPt, GrdPt: TPoint;
  Cell: TGridCoord;
  s: String;
begin
  inherited;
  ScrPt := Mouse.CursorPos;
  GrdPt := dbgDetail.ScreenToClient(ScrPt);
  Cell := dbgDetail.MouseCoord(GrdPt.X, GrdPt.Y);
  s := UpperCase(dbgDetail.Fields[Cell.X - 1].FieldName);
  if (s = 'PORT') then
  begin
    actPEdit.Execute;
  end;
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

procedure TapgNodeLink.dbgNodeLinkRowDetailPanelHide(Sender: TCustomDBGridEh; var CanHide: Boolean);
begin
  dsEQ.Close;
end;

procedure TapgNodeLink.dbgNodeLinkRowDetailPanelShow(Sender: TCustomDBGridEh; var CanShow: Boolean);
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

function TapgNodeLink.GetEquipmentRecord: TEquipmentRecord;
begin
  if (dbgDetail.DataSource.DataSet.RecordCount = 0) then
  begin
    Result.id := -1;
    Exit;
  end;

  Result.id := dbgDetail.DataSource.DataSet.FieldByName('Eid').AsInteger;
  if not dbgDetail.DataSource.DataSet.FieldByName('Eq_Type').IsNull then
    Result.TypeID := dbgDetail.DataSource.DataSet.FieldByName('Eq_Type').AsInteger;
  if not dbgDetail.DataSource.DataSet.FieldByName('Eq_Group').IsNull then
    Result.TypeName := dbgDetail.DataSource.DataSet.FieldByName('Eq_Group').asString;
  if not dbgDetail.DataSource.DataSet.FieldByName('Name').IsNull then
    Result.Name := dbgDetail.DataSource.DataSet.FieldByName('Name').asString;
  if not dbgDetail.DataSource.DataSet.FieldByName('EIp').IsNull then
    Result.IP := dbgDetail.DataSource.DataSet.FieldByName('EIp').asString;
  if not dbgDetail.DataSource.DataSet.FieldByName('EMac').IsNull then
    Result.MAC := dbgDetail.DataSource.DataSet.FieldByName('EMac').asString;
end;

end.
