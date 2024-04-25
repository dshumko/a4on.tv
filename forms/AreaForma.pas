unit AreaForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB, 
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh,
  CnErrorProvider, PrjConst, EhLibVCL, FIBDatabase, pFIBDatabase, DBCtrlsEh, DBGridEhGrouping, DynVarsEh, amSplitter,
  PrnDbgeh;

type
  TAreaForm = class(TGridForm)
    dsAreas: TpFIBDataSet;
    pnlBottom: TPanel;
    Splitter: TSplitter;
    dbSubArea: TDBGridEh;
    ToolBar2: TToolBar;
    ToolButton7: TToolButton;
    actSu: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    tbOkSub: TToolButton;
    ToolButton17: TToolButton;
    tbCancelSub: TToolButton;
    srcSubAreas: TDataSource;
    dsSubAreas: TpFIBDataSet;
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
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
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
    procedure srcSubAreasStateChange(Sender: TObject);
    procedure actSubNewExecute(Sender: TObject);
    procedure actSubEditExecute(Sender: TObject);
    procedure actSubDeleteExecute(Sender: TObject);
    procedure srcSubAreasDataChange(Sender: TObject; Field: TField);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AreaForm: TAreaForm;

implementation

uses
  DM, MAIN, AreaEditForma, SubAreaEditForma;

{$R *.dfm}

procedure TAreaForm.srcSubAreasStateChange(Sender: TObject);
begin
  inherited;
  tbOkSub.Enabled := not((Sender as TDataSource).DataSet.State = dsBrowse);
  tbCancelSub.Enabled := tbOkSub.Enabled;
  actSubNew.Enabled := not tbOkSub.Enabled;
end;

procedure TAreaForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dbGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbGrid', false);
  dbSubArea.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbSubArea', false);
  dsSubAreas.Close;
  dsAreas.Close;
  AreaForm := nil;
end;

procedure TAreaForm.tbCancelSubClick(Sender: TObject);
begin
  inherited;
  dbSubArea.DataSource.DataSet.Cancel;
end;

procedure TAreaForm.tbOkSubClick(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas)))
  then begin
    dbSubArea.DataSource.DataSet.Cancel;
    exit;
  end;
  dbSubArea.DataSource.DataSet.Post;
  dbSubArea.DataSource.DataSet.Refresh;
end;

procedure TAreaForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas)))
  then
    exit;
  if dsSubAreas.RecordCount = 0
  then begin
    if (MessageDlg(Format(rsDeleteCity, [dsAreas['AREA_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then
      dsAreas.Delete;
  end
  else
    ShowMessage(rsErrorNeedDeleteArea);
end;

procedure TAreaForm.actNewExecute(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas)))
  then
    exit;
  i := EditArea(-1);
  if i > 0
  then begin
    dsAreas.CloseOpen(true);
    dsAreas.Locate('area_id', i, []);
  end;

end;

procedure TAreaForm.actEditExecute(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas)))
  then
    exit;
  i := EditArea(dsAreas['area_id']);
  if i > 0
  then
    dsAreas.Refresh
end;

procedure TAreaForm.tbOkClick(Sender: TObject);
begin
  inherited;
  if ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas)))
  then
    dbGrid.DataSource.DataSet.Post
  else
    dbGrid.DataSource.DataSet.Cancel;

end;

procedure TAreaForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  dbGrid.DataSource.DataSet.Cancel;
end;

procedure TAreaForm.srcDataSourceStateChange(Sender: TObject);
begin
  inherited;
  actNew.Enabled := ((Sender as TDataSource).DataSet.State = dsBrowse);
  actEdit.Enabled := actNew.Enabled;
  actDelete.Enabled := actNew.Enabled;
end;

procedure TAreaForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsAreas.Open;
  dsSubAreas.Open;

  // права пользователей
  actNew.Visible := ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas)));
  actDelete.Visible := actNew.Visible;
  actEdit.Visible := actNew.Visible;
  actSubNew.Visible := actNew.Visible;
  actSubEdit.Visible := actNew.Visible;
  actSubDelete.Visible := actNew.Visible;
end;

procedure TAreaForm.FormResize(Sender: TObject);
begin
  inherited;
  dbGrid.Height := round(Self.Height / 2) - tlbMain.Height - Splitter.Height;
end;

procedure TAreaForm.FormShow(Sender: TObject);
begin
  inherited;
  dbGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbGrid', [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);
  dbSubArea.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbSubArea',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);
end;

procedure TAreaForm.actSubNewExecute(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas)))
  then
    exit;
  i := EditSubArea(dsAreas['area_id'], -1);
  if i > 0
  then begin
    dsSubAreas.CloseOpen(true);
    dsSubAreas.Locate('SubArea_id', i, []);
  end;
  // dbSubArea.DataSource.DataSet.Insert;
  // dsSubAreas['AREA_ID']:=dsAreas['AREA_ID'];

end;

procedure TAreaForm.actSubEditExecute(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas)))
  then
    exit;
  i := EditSubArea(dsAreas['area_id'], dsSubAreas['SubArea_id']);
  if i > 0
  then
    dsSubAreas.Refresh
end;

procedure TAreaForm.actSubDeleteExecute(Sender: TObject);
var
  Query: TpFIBQuery;
begin
  inherited;
  Query := TpFIBQuery.Create(self);
  try
    Query.Database := dmMain.dbTV;
    Query.Transaction := dmMain.trRead;
    Query.SQL.Text := 'select count(h.house_id) from house h where h.subarea_id = ' +
      dsSubAreas.FieldByName('SUBAREA_ID').AsString;
    Query.ExecQuery;
    if Query.Fields[0].AsInteger = 0
    then begin
      if (MessageDlg( Format(rsDeleteSubArea, [dsSubAreas['SUBAREA_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
      then begin
        // dsSubAreas.UpdateTransaction.StartTransaction;
        dsSubAreas.Delete;
        dsSubAreas.UpdateTransaction.Commit;
      end;
    end
    else
      ShowMessage(rsErrorNeedDeleteSubArea);
  finally
    Query.Free;
  end;

end;

procedure TAreaForm.srcSubAreasDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actSubEdit.Enabled := (dsSubAreas.RecordCount > 0) and actSubNew.Enabled;
  actSubDelete.Enabled := actSubEdit.Enabled;
end;

procedure TAreaForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actSubNew.Enabled := dsAreas.RecordCount > 0;
  actEdit.Enabled := (dsAreas.RecordCount > 0) and actNew.Enabled;
  actDelete.Enabled := actEdit.Enabled;
end;

end.

