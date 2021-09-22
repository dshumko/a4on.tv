unit WorkTeamForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, ActnList, DB, ComCtrls, ToolWin, Grids, DBGridEh,
  ExtCtrls, FIBDataSet, pFIBDataSet, FIBQuery, GridsEh, Menus,
  StdCtrls, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh,
  System.Actions, Vcl.Buttons, CnErrorProvider, PrjConst, System.UITypes,
  EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  TWorkTeamForm = class(TGridForm)
    dsAreas: TpFIBDataSet;
    Splitter1: TSplitter;
    srcWORKGROUPS: TDataSource;
    dsWORKGROUPS: TpFIBDataSet;
    actSubNew: TAction;
    actSubDelete: TAction;
    actSubEdit: TAction;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    actPaymentEdit1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    pgcADD: TPageControl;
    tsTeams: TTabSheet;
    tsHouses: TTabSheet;
    Panel1: TPanel;
    dbSubArea: TDBGridEh;
    dbgrdHouses: TDBGridEh;
    dsHouses: TpFIBDataSet;
    srcHouses: TDataSource;
    dsWH: TpFIBDataSet;
    tsLimit: TTabSheet;
    dsLimit: TpFIBDataSet;
    srcLimit: TDataSource;
    dbg1: TDBGridEh;
    tlb2: TToolBar;
    btn14: TToolButton;
    btn11: TToolButton;
    btn15: TToolButton;
    btn12: TToolButton;
    btn16: TToolButton;
    btn13: TToolButton;
    ToolBar2: TToolBar;
    ToolButton7: TToolButton;
    actSu: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton14: TToolButton;
    actlst1: TActionList;
    actHouseNew: TAction;
    actHouseEdit: TAction;
    ToolBar3: TToolBar;
    ToolButton8: TToolButton;
    tbHAdd: TToolButton;
    ToolButton16: TToolButton;
    tbHEdit: TToolButton;
    Label2: TLabel;
    ToolButton17: TToolButton;
    tbOkSub: TToolButton;
    btn1: TToolButton;
    tbCancelSub: TToolButton;
    ActLimitNew: TAction;
    actLimitEdit: TAction;
    actLimitDEl: TAction;
    procedure FormCreate(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure tbOkClick(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure tbOkSubClick(Sender: TObject);
    procedure tbCancelSubClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure srcWORKGROUPSStateChange(Sender: TObject);
    procedure actSubNewExecute(Sender: TObject);
    procedure actSubEditExecute(Sender: TObject);
    procedure actSubDeleteExecute(Sender: TObject);
    procedure srcWORKGROUPSDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure pgcADDChange(Sender: TObject);
    procedure actHouseNewExecute(Sender: TObject);
    procedure actHouseEditExecute(Sender: TObject);
    procedure dbgrdHousesDblClick(Sender: TObject);
    procedure ActLimitNewExecute(Sender: TObject);
    procedure actLimitEditExecute(Sender: TObject);
    procedure actLimitDElExecute(Sender: TObject);
    procedure srcHousesDataChange(Sender: TObject; Field: TField);
    procedure srcLimitDataChange(Sender: TObject; Field: TField);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure dsWORKGROUPSBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WorkTeamForm: TWorkTeamForm;

implementation

uses DM, MAIN, WorkAreaLimitForma, HouseForma;

{$R *.dfm}

procedure TWorkTeamForm.srcWORKGROUPSStateChange(Sender: TObject);
begin
  inherited;
  tbOkSub.Enabled := not((Sender as TDataSource).DataSet.State = dsBrowse);
  tbCancelSub.Enabled := tbOkSub.Enabled;
  actSubNew.Enabled := not(tbOkSub.Enabled) and ((dsAreas.RecordCount > 0) and actSubNew.Visible);
end;

procedure TWorkTeamForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dbGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbGrid', true);
  dbSubArea.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbSubArea', true);
  dsWORKGROUPS.Close;
  dsAreas.Close;
  WorkTeamForm := nil;
end;

procedure TWorkTeamForm.tbCancelSubClick(Sender: TObject);
begin
  inherited;
  dbSubArea.DataSource.DataSet.Cancel;
end;

procedure TWorkTeamForm.tbOkSubClick(Sender: TObject);
begin
  inherited;
  if (dsAreas.State in [dsEdit, dsInsert]) then
  begin
    if (dsWORKGROUPS.State in [dsEdit, dsInsert]) then
      dsWORKGROUPS.Cancel;
    Exit;
  end;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_WorkAreas))) then
  begin
    dsWORKGROUPS.Cancel;
    Exit;
  end;

  dsWORKGROUPS.Post;
end;

procedure TWorkTeamForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_WorkAreas))) then
    Exit;
  if dsWORKGROUPS.RecordCount = 0 then
  begin
    if (MessageDlg(Format(rsDeleteWorkTeam, [dsAreas['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      dsAreas.Delete;
  end
  else
    ShowMessage(rsErrorNeedDeleteTeam);
end;

procedure TWorkTeamForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_WorkAreas))) then
    Exit;
  dbGrid.DataSource.DataSet.Insert;
end;

procedure TWorkTeamForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_WorkAreas))) then
    Exit;
  dbGrid.DataSource.DataSet.Edit;
end;

procedure TWorkTeamForm.actHouseEditExecute(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;
  if EditHouse(dsHouses['HOUSE_ID'], dsHouses['STREET_ID']) > -1 then
  begin
    dsHouses.Refresh;
  end;
end;

procedure TWorkTeamForm.actHouseNewExecute(Sender: TObject);
var
  i: int64;
begin
  inherited;
  if (not dsAreas.Active) or (dsAreas.RecordCount = 0) or (dsAreas.FieldByName('WA_ID').IsNull) then
    Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street))) then
    Exit;
  i := EditHouse(-1, -1);
  if i > -1 then
  begin
    dsHouses.CloseOpen(true);
    dsHouses.Locate('HOUSE_ID', VarArrayOf([i]), []);
  end;
end;

procedure TWorkTeamForm.actLimitDElExecute(Sender: TObject);
begin
  inherited;
  if ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_WorkAreas))) then
  begin
    if (MessageDlg(rsDeleteQuote, mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      dsLimit.Delete;
  end;
end;

procedure TWorkTeamForm.actLimitEditExecute(Sender: TObject);
var
  rt_id: Integer;
begin
  inherited;
  if (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_WorkAreas)) then
  begin
    rt_id := dsLimit['W_ID'];
    if WorkLimitEdit(dsAreas['WA_ID'], rt_id) then
      dsLimit.CloseOpen(true);
  end;
end;

procedure TWorkTeamForm.ActLimitNewExecute(Sender: TObject);
var
  rt_id: Integer;
begin
  inherited;
  if (not dsAreas.Active) then
    Exit;
  if (dsAreas.State in [dsEdit, dsInsert]) then
    dsAreas.Post;

  if (dsAreas.RecordCount = 0) or (dsAreas.FieldByName('WA_ID').IsNull) then
    Exit;

  if (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_WorkAreas)) then
  begin
    rt_id := -1;
    if WorkLimitEdit(dsAreas['WA_ID'], rt_id) then
      dsLimit.CloseOpen(true);
  end;
end;

procedure TWorkTeamForm.tbOkClick(Sender: TObject);
begin
  inherited;
  if (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_WorkAreas)) then
  begin
    if (dbGrid.DataSource.DataSet.State in [dsEdit, dsInsert]) then
      dbGrid.DataSource.DataSet.Post;
  end
  else
    dbGrid.DataSource.DataSet.Cancel;
end;

procedure TWorkTeamForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  dbGrid.DataSource.DataSet.Cancel;
end;

procedure TWorkTeamForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
var
  b: boolean;
begin
  inherited;
  b := (dsAreas.RecordCount > 0);
  actEdit.Enabled := b and actNew.Enabled;
  actDelete.Enabled := actEdit.Enabled;

  // actSubNew.Enabled := b and actSubNew.Visible;
  actHouseNew.Enabled := b and actHouseNew.Visible;
  ActLimitNew.Enabled := b and ActLimitNew.Visible;

end;

procedure TWorkTeamForm.srcDataSourceStateChange(Sender: TObject);
begin
  inherited;
  actNew.Enabled := ((Sender as TDataSource).DataSet.State = dsBrowse);
  actEdit.Enabled := actNew.Enabled;
  actDelete.Enabled := actNew.Enabled;
  tbOk.Enabled := not actNew.Enabled;
  tbCancel.Enabled := not actNew.Enabled;

  actSubNew.Enabled := not tbOk.Enabled;
  actSubEdit.Enabled := actSubNew.Enabled;
  actSubDelete.Enabled := actSubNew.Enabled;
end;

procedure TWorkTeamForm.srcHousesDataChange(Sender: TObject; Field: TField);
var
  b: boolean;
begin
  inherited;
  b := (dsHouses.RecordCount > 0);
  actHouseEdit.Enabled := b and actHouseEdit.Visible;
end;

procedure TWorkTeamForm.srcLimitDataChange(Sender: TObject; Field: TField);
var
  b: boolean;
begin
  inherited;
  b := (dsLimit.RecordCount > 0);
  actLimitEdit.Enabled := b and actLimitEdit.Visible;
  actLimitDEl.Enabled := b and actLimitDEl.Visible;
end;

procedure TWorkTeamForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsAreas.Open;
  dsWORKGROUPS.Open;

  // права пользователей
  actNew.Visible := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_WorkAreas));
  actDelete.Visible := actNew.Visible;
  actEdit.Visible := actNew.Visible;
  actSubNew.Visible := actNew.Visible;
  actSubEdit.Visible := actNew.Visible;
  actSubDelete.Visible := actNew.Visible;
  tbOk.Visible := actNew.Visible;
  tbCancel.Visible := actNew.Visible;
  tbOkSub.Visible := actNew.Visible;
  tbCancelSub.Visible := actNew.Visible;

  // права пользователей полный доступ или редактирование домов
  actHouseNew.Visible := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street));
  actHouseEdit.Visible := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street));

end;

procedure TWorkTeamForm.FormShow(Sender: TObject);
begin
  inherited;
  dbGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbGrid', [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);
  dbSubArea.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbSubArea',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);
  dsWH.Open;

  actSubNew.Visible := ((dmMain.AllowedAction(rght_Dictionary_full) or
    dmMain.AllowedAction(rght_Dictionary_WorkAreas)));
  actSubDelete.Visible := actSubNew.Visible;
  actSubEdit.Visible := actSubNew.Visible;

  actHouseNew.Visible := ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Street)));
  actHouseEdit.Visible := actHouseNew.Visible;

  ActLimitNew.Visible :=
    ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_WorkAreas)));
  actLimitEdit.Visible := ActLimitNew.Visible;
  actLimitDEl.Visible := ActLimitNew.Visible;

end;

procedure TWorkTeamForm.pgcADDChange(Sender: TObject);
var
  cr: TCursor;
begin
  inherited;
  cr := screen.Cursor;
  screen.Cursor := crSQLWait;
  dsWORKGROUPS.Active := (pgcADD.ActivePage = tsTeams);
  dsHouses.Active := (pgcADD.ActivePage = tsHouses);
  dsLimit.Active := (pgcADD.ActivePage = tsLimit);
  screen.Cursor := cr;
end;

procedure TWorkTeamForm.actSubNewExecute(Sender: TObject);
begin
  inherited;
  if (dsAreas.State in [dsEdit, dsInsert]) then
    Exit;

  if (not dsAreas.Active) or (dsAreas.RecordCount = 0) or (dsAreas.FieldByName('WA_ID').IsNull) then
    Exit;

  if ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_WorkAreas))) then
  begin
    dbSubArea.DataSource.DataSet.Insert;
    dbSubArea.DataSource.DataSet['WA_ID'] := dsAreas['WA_ID'];
  end;
end;

procedure TWorkTeamForm.dbgrdHousesDblClick(Sender: TObject);
begin
  inherited;
  actHouseEdit.Execute;
end;

procedure TWorkTeamForm.dsWORKGROUPSBeforePost(DataSet: TDataSet);
begin
  inherited;
  dsWORKGROUPS['WA_ID'] := dsAreas['WA_ID'];
end;

procedure TWorkTeamForm.actSubEditExecute(Sender: TObject);
begin
  inherited;
  if (dsAreas.State in [dsEdit, dsInsert]) then
    Exit;
  dbSubArea.DataSource.DataSet.Edit;
end;

procedure TWorkTeamForm.actSubDeleteExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if (dsAreas.State in [dsEdit, dsInsert]) then
    Exit;

  if ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_WorkAreas))) then
  begin
    s := '';
    if not(dsWORKGROUPS.FieldByName('NAME').IsNull) then
      s := dsWORKGROUPS.FieldByName('NAME').AsString;

    if (MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      dsWORKGROUPS.Delete;
  end;
end;

procedure TWorkTeamForm.srcWORKGROUPSDataChange(Sender: TObject; Field: TField);
var
  b: boolean;
begin
  inherited;
  b := (dsWORKGROUPS.RecordCount > 0);
  actSubEdit.Enabled := b and actSubEdit.Visible;
  actSubDelete.Enabled := b and actSubDelete.Visible;
end;

end.
