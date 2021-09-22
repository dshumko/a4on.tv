unit fmuNodeFlats;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AtrPages, ToolCtrlsEh, ComCtrls, ToolWin,
  GridsEh, DBGridEh, DB, FIBDataSet, pFIBDataSet, ActnList,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, PrjConst,
  EhLibVCL, System.UITypes, DBGridEhGrouping, DynVarsEh, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery;

type
  TapgNodeFlats = class(TA4onPage)
    dsFlats: TpFIBDataSet;
    srcFlats: TDataSource;
    dbgNodeFiles: TDBGridEh;
    tbAttributes: TToolBar;
    btnEdit: TToolButton;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    qRead: TpFIBQuery;
    actView: TAction;
    actCustomers: TAction;
    btn1: TToolButton;
    btnCustomers: TToolButton;
    procedure actEditExecute(Sender: TObject);
    procedure dbgNodeFilesDblClick(Sender: TObject);
    procedure actCustomersExecute(Sender: TObject);
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

uses ShellApi, MAIN, AtrCommon, DM, EditNodeFlatsForma, CF;

class function TapgNodeFlats.GetPageName: string;
begin
  Result := rsClmnFlats;
end;

procedure TapgNodeFlats.InitForm;
begin
  // Attributes.Visible := FullAccess;
  actEdit.Visible := tbAttributes.Visible;
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
 s : string;
begin
  // фильтр по дому
  //if (FDataSource.DataSet.RecordCount > 0) and (not FDataSource.DataSet.FieldByName('house_id').IsNull) then
  //ShowCustomers(14, '0~' + FDataSource.DataSet.FieldByName('house_id').AsString);
  s := '';
  if dsFlats.RecordCount > 0 then begin
    dsFlats.DisableControls;
    dsFlats.First;
    while not dsFlats.EOF do begin
      if (not dsFlats.FieldByName('CST_LIST').IsNUll) then
        s := s +','+ dsFlats['CST_LIST'];
      dsFlats.Next;
    end;
    dsFlats.EnableControls;
  end;
  if (s <> '') then begin
    s := s.Trim([',']);
    ShowCustomers(7, s);
  end;
end;

procedure TapgNodeFlats.actEditExecute(Sender: TObject);
begin
  if (FDataSource.DataSet.FieldByName('NODE_ID').IsNull) then
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

end.
