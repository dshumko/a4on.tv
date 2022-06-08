unit fmuNodeFiles;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnList,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery;

type
  TapgNodeFiles = class(TA4onPage)
    dsFiles: TpFIBDataSet;
    srcFiles: TDataSource;
    dbgNodeFiles: TDBGridEh;
    tbAttributes: TToolBar;
    btnAdd: TToolButton;
    btnEdit: TToolButton;
    btnDel: TToolButton;
    ActList: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    qRead: TpFIBQuery;
    btnView: TToolButton;
    btn1: TToolButton;
    actView: TAction;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbgNodeFilesDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
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
  MAIN, AtrCommon, DM, EditNFileForma;

class function TapgNodeFiles.GetPageName: string;
begin
  Result := rsClmnFiles;
end;

procedure TapgNodeFiles.InitForm;
var
  FullAccess: Boolean;
begin
  FullAccess := (dmMain.AllowedAction(rght_Dictionary_Nodes)) or (dmMain.AllowedAction(rght_Dictionary_Nodes));

  tbAttributes.Visible := FullAccess;
  actAdd.Visible := tbAttributes.Visible;
  actDel.Visible := tbAttributes.Visible;
  actEdit.Visible := tbAttributes.Visible;

  dsFiles.DataSource := FDataSource;
end;

procedure TapgNodeFiles.EnableControls;
begin
  actEdit.Enabled := dsFiles.RecordCount > 0;
  actDel.Enabled := dsFiles.RecordCount > 0;
end;

procedure TapgNodeFiles.OpenData;
begin
  dsFiles.Open;
  EnableControls;
end;

procedure TapgNodeFiles.actAddExecute(Sender: TObject);
begin
  if EditFile(FDataSource.DataSet['NODE_ID'], '') then
  begin
    dsFiles.CloseOpen(true);
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgNodeFiles.actDelExecute(Sender: TObject);
begin
  if ((not dsFiles.Active) or (dsFiles.RecordCount = 0)) then
    Exit;
  if (not srcFiles.DataSet.FieldByName('NAME').IsNull) then
  begin
    if (MessageDlg(Format(rsDeleteWithName, [srcFiles.DataSet['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then
    begin
      srcFiles.DataSet.Delete;
      EnableControls;
      UpdatePage;
    end;
  end;
end;

procedure TapgNodeFiles.actEditExecute(Sender: TObject);
begin
  if ((not dsFiles.Active) or (dsFiles.RecordCount = 0)) then
    Exit;
  if (dsFiles.FieldByName('NAME').IsNull) or (dsFiles.FieldByName('NF_ID').IsNull) or
    (FDataSource.DataSet.FieldByName('NODE_ID').IsNull) then
    Exit;
  if EditFile(FDataSource.DataSet['NODE_ID'], dsFiles['NAME'], dsFiles['NF_ID']) then
  begin
    dsFiles.Refresh;
    EnableControls;
    UpdatePage;
  end
end;

procedure TapgNodeFiles.CloseData;
begin
  dsFiles.Close;
end;

procedure TapgNodeFiles.dbgNodeFilesDblClick(Sender: TObject);
begin
  actViewExecute(Sender);
end;

procedure TapgNodeFiles.actViewExecute(Sender: TObject);
var
  fileName: string;
begin
  if dbgNodeFiles.DataSource.DataSet.RecordCount > 0 then
  begin
    fileName := GetTempDir + 'A4on\';
    if not DirectoryExists(fileName) then
      CreateDir(fileName);
    fileName := fileName + dsFiles['FILENAME'];
    qRead.ParamByName('NF_ID').AsInteger := dsFiles['NF_ID'];
    qRead.Transaction.StartTransaction;
    qRead.ExecQuery;
    qRead.FieldByName('content').SaveToFile(fileName);
    qRead.Close;
    qRead.Transaction.Rollback;
    ShellExecute(Handle, 'open', PWideChar(fileName), nil, nil, SW_SHOWNORMAL);
  end;
end;

end.
