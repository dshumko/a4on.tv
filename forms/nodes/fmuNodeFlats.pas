unit fmuNodeFlats;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnList,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TapgNodeFlats = class(TA4onPage)
    dsFlats: TpFIBDataSet;
    srcFlats: TDataSource;
    dbgNodeFiles: TDBGridEh;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    qRead: TpFIBQuery;
    actView: TAction;
    actCustomers: TAction;
    pnlButtons: TPanel;
    btnAdd1: TSpeedButton;
    btnFind: TSpeedButton;
    procedure actEditExecute(Sender: TObject);
    procedure dbgNodeFilesDblClick(Sender: TObject);
    procedure actCustomersExecute(Sender: TObject);
    procedure dbgNodeFilesSortMarkingChanged(Sender: TObject);
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
  Winapi.ShellAPI,
  MAIN, AtrCommon, DM, EditNodeFlatsForma, CF;

class function TapgNodeFlats.GetPageName: string;
begin
  Result := rsClmnHousesAndFlats;
end;

procedure TapgNodeFlats.InitForm;
begin
  actEdit.Visible := (dmMain.AllowedAction(rght_Comm_Nodes));
  dsFlats.DataSource := FDataSource;
end;

procedure TapgNodeFlats.EnableControls;
begin
  actEdit.Enabled := true;
end;

procedure TapgNodeFlats.OpenData;
begin
  dsFlats.Open;
  EnableControls;
end;

procedure TapgNodeFlats.actCustomersExecute(Sender: TObject);
var
  s: string;
  bm: TBookmark;
  i: Integer;
begin
  // фильтр по дому
  // if (FDataSource.DataSet.RecordCount > 0) and (not FDataSource.DataSet.FieldByName('house_id').IsNull) then
  // ShowCustomers(14, '0~' + FDataSource.DataSet.FieldByName('house_id').AsString);
  s := '';
  if dsFlats.RecordCount > 0 then
  begin
    dsFlats.DisableControls;
    bm := dsFlats.GetBookmark;
    dsFlats.First;
    if (dbgNodeFiles.SelectedRows.Count > 0) then
    begin
      for i := 0 to dbgNodeFiles.SelectedRows.Count - 1 do
      begin
        dbgNodeFiles.DataSource.DataSet.Bookmark := dbgNodeFiles.SelectedRows[i];
        if (not dbgNodeFiles.DataSource.DataSet.FieldByName('CST_LIST').IsNUll) then
          s := s + ',' + dbgNodeFiles.DataSource.DataSet['CST_LIST'];
      end
    end
    else
    begin
      while not dsFlats.EOF do
      begin
        if (not dsFlats.FieldByName('CST_LIST').IsNUll) then
          s := s + ',' + dsFlats['CST_LIST'];
        dsFlats.Next;
      end;
    end;

    dsFlats.GotoBookmark(bm);
    dsFlats.EnableControls;
  end;
  if (s <> '') then
  begin
    s := s.Trim([',']);
    ShowCustomers(7, s);
  end;
end;

procedure TapgNodeFlats.actEditExecute(Sender: TObject);
begin
  if (FDataSource.DataSet.FieldByName('NODE_ID').IsNUll) then
    Exit;

  if EditFlats(FDataSource.DataSet['NODE_ID']) then
  begin
    dsFlats.CloseOpen(true);
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgNodeFlats.CloseData;
begin
  dsFlats.Close;
end;

procedure TapgNodeFlats.dbgNodeFilesDblClick(Sender: TObject);
begin
  if actEdit.Visible then
    actEdit.Execute;
end;

procedure TapgNodeFlats.dbgNodeFilesSortMarkingChanged(Sender: TObject);
var
  cr: TCursor;
  s: string;
  Grid: TCustomDBGridEh;
  id: String;
  FIBDS: TpFIBDataSet;
  beOpened: Boolean;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;
  Grid := TCustomDBGridEh(Sender);
  FIBDS := Grid.DataSource.DataSet as TpFIBDataSet;
  id := '';
  if Sender is TCustomDBGridEh then
  begin
    beOpened := FIBDS.Active;
    if beOpened then
    begin
      if not FIBDS.FieldByName('FLAT_NO').IsNull then
        id := FIBDS.FieldByName('FLAT_NO').asString;
      FIBDS.Close;
    end;

    s := GetOrderClause(Sender as TDBGridEh);

    FIBDS.OrderClause := s;
    if beOpened then
    begin
      FIBDS.Open;
      if id <> '' then
        FIBDS.Locate('FLAT_NO', id, []);
    end;
  end;
  Screen.Cursor := cr;
end;

end.
