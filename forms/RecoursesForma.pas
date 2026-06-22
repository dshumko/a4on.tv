unit RecoursesForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls,
  GridForma, FIBDataSet, pFIBDataSet, GridsEh, DBGridEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, CnErrorProvider,
  PrjConst,
  EhLibVCL, DBGridEhGrouping, DynVarsEh, MemTableDataEh, DataDriverEh, pFIBDataDriverEh, MemTableEh, EhLibFIB,
  PrnDbgeh, CnClasses;

type
  TRecoursesForm = class(TGridForm)
    dsRecourses: TpFIBDataSet;
    btnDateFilter: TToolButton;
    btn2: TToolButton;
    actDateFilter: TAction;
    pmPeriod: TPopupMenu;
    N1: TMenuItem;
    N4: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    actFilterCustomer: TAction;
    btnFilterCustomer: TToolButton;
    mtRecourses: TMemTableEh;
    drvRecourses: TpFIBDataDriverEh;
    ToolButton7: TToolButton;
    chkGroup: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actDateFilterExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure actDeleteExecute(Sender: TObject);
    procedure actFilterCustomerExecute(Sender: TObject);
    procedure chkGroupClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbGridColumns4GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbGridDblClick(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    { Private declarations }
    FFirstOpen: Boolean;
    fStartDate: TDateTime;
    fEndDate: TDateTime;
    FCanSaveColumns: Boolean;
    FHidePersonalData: Boolean;
    FHidePersonalName: Boolean;
    FTodayOnly: Boolean;
    FOnlyTheir: Boolean;
    FclOutcome: TColor;
    FShowDirect: Boolean;
    procedure SetFilter;
    procedure SwitchTreeMode(chkBox: TCheckBox; TreeGrid: TDBGridEh; FibDS: TpFIBDataSet; MemDS: TMemTableEh);
  public
    { Public declarations }
  end;

var
  RecoursesForm: TRecoursesForm;

implementation

uses
  DM, RecourseForma, MAIN, PeriodForma, AtrStrUtils, CF, pFIBProps, atrCmdUtils;

{$R *.dfm}

procedure TRecoursesForm.actDateFilterExecute(Sender: TObject);
var
  bDate, eDate: TDateTime;
begin
  inherited;
  bDate := fStartDate;
  eDate := fEndDate;
  if ChangePeriod(bDate, eDate) then
  begin
    fStartDate := bDate;
    fEndDate := eDate;
    SetFilter;
  end;
end;

procedure TRecoursesForm.SetFilter;
var
  cr: TCursor;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  if (FTodayOnly) then
  begin
    fStartDate := Now;
    fEndDate := fStartDate;
  end;

  dsRecourses.Close;
  if FOnlyTheir then
    dsRecourses.ParamByName('owned').AsString := 'and r.ADDED_BY = CURRENT_USER'
  else
    dsRecourses.ParamByName('owned').AsString := '';

  dsRecourses.ParamByName('Start_Date').AsDate := fStartDate;
  dsRecourses.ParamByName('End_Date').AsDate := fEndDate;

  Caption := Format(rsRecoursePeriod, [DateToStr(fStartDate), DateToStr(fEndDate)]);
  dsRecourses.Open;
  Screen.Cursor := cr;
end;

procedure TRecoursesForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := actEdit.Visible and (srcDataSource.DataSet.RecordCount > 0);
  actDelete.Enabled := actDelete.Enabled and (srcDataSource.DataSet.RecordCount > 0);
end;

procedure TRecoursesForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (not dmMain.AllowedAction(rght_Recourses_del)) then
    exit;
  if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then
    srcDataSource.DataSet.Delete;
end;

procedure TRecoursesForm.actEditExecute(Sender: TObject);
begin
  inherited;
  // EditRecourse(dsRecourses['RC_ID']);
end;

procedure TRecoursesForm.actNewExecute(Sender: TObject);
begin
  inherited;
  EditRecourse(-1);
end;

procedure TRecoursesForm.chkGroupClick(Sender: TObject);
begin
  inherited;
  SwitchTreeMode(chkGroup, dbGrid, dsRecourses, mtRecourses);
end;

procedure TRecoursesForm.dbGridColumns4GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  inherited;
  if (FHidePersonalData or FHidePersonalName) and (not Params.Text.IsEmpty) then
    Params.Text := HideFullName(Params.Text, FHidePersonalData, FHidePersonalName);
end;

procedure TRecoursesForm.dbGridDblClick(Sender: TObject);
var
  ScrPt, GrdPt: TPoint;
  Cell: TGridCoord;
  s: String;
  i: Integer;
begin
  inherited;

  ScrPt := Mouse.CursorPos;
  GrdPt := dbGrid.ScreenToClient(ScrPt);
  Cell := dbGrid.MouseCoord(GrdPt.X, GrdPt.Y);
  s := UpperCase(dbGrid.Fields[Cell.X - 1].FieldName);
  if (s = 'NOTICE') then
  begin
    if not dbGrid.DataSource.DataSet.FieldByName('NOTICE').IsNull then
    begin
      s := dbGrid.DataSource.DataSet.FieldByName('NOTICE').AsString;
      if s.ToUpper.Contains('HTTP') then
      begin
        i := Pos('HTTP', s.ToUpper);
        s := Copy(s, i, 1000);
        atrCmdUtils.ShellExecute(Application.MainForm.Handle, '', s.trim);
      end
    end;
  end
  else if (s = 'RQ_ID') and (not dbGrid.DataSource.DataSet.FieldByName('RQ_ID').IsNull) then
    A4MainForm.OpenRequest(dbGrid.DataSource.DataSet.FieldByName('RQ_ID').AsInteger)
  else if (s = 'TASK_ID') and (not dbGrid.DataSource.DataSet.FieldByName('TASK_ID').IsNull) then
    A4MainForm.OpenTask(dbGrid.DataSource.DataSet.FieldByName('TASK_ID').AsInteger);

end;

procedure TRecoursesForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if not(Sender as TDBGridEh).DataSource.DataSet.Active then
    exit;

  if not(Sender as TDBGridEh).DataSource.DataSet.FieldByName('DIRECT').IsNull then
  begin
    if ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('DIRECT').AsInteger = 1) then
      Background := FclOutcome;
  end;
end;

procedure TRecoursesForm.FormActivate(Sender: TObject);
var
  b: Integer;
  filter: string;
  inFilter: Boolean;
begin
  inherited;
  if FFirstOpen then
  begin
    FFirstOpen := False;
    exit;
  end;

  if not((dsRecourses.Active) and (dsRecourses.RecordCount > 0) and (not dsRecourses.FieldByName('RC_ID').IsNull)) then
    exit;

  inFilter := dsRecourses.Filtered;
  filter := dsRecourses.filter;
  b := dsRecourses['RC_ID'];
  dsRecourses.CloseOpen(true);
  if inFilter then
  begin
    dsRecourses.filter := filter;
    dsRecourses.Filtered := inFilter;
    if dbGrid.SearchPanel.SearchingText <> '' then
      dbGrid.SearchPanel.ApplySearchFilter;
  end;
  dsRecourses.Locate('RC_ID', b, []);
end;

procedure TRecoursesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if FCanSaveColumns then
    inherited;
  dsRecourses.Close;
  RecoursesForm := nil;
  if not FCanSaveColumns then
    Action := caFree;
end;

procedure TRecoursesForm.FormCreate(Sender: TObject);
begin
  inherited;
  FFirstOpen := true;
  try
    FclOutcome := StringToColor(dmMain.GetSettingsValue('ROW_HL_WARNING'));
  except
    FclOutcome := $0066FFFF;
  end;
end;

procedure TRecoursesForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  FCanSaveColumns := true;
  actNew.Visible := (dmMain.AllowedAction(rght_Recourses_add));
  actEdit.Visible := (dmMain.AllowedAction(rght_Recourses_edit)) and False;
  actDelete.Visible := (dmMain.AllowedAction(rght_Recourses_del));
  FHidePersonalData := (dmMain.AllowedAction(rght_Customer_PersonalData));
  FHidePersonalName := (dmMain.AllowedAction(rght_Customer_PersonalName));

  FTodayOnly := dmMain.AllowedAction(rght_Recourses_TodayOnly);
  FOnlyTheir := dmMain.AllowedAction(rght_Recourses_owner);

  FShowDirect := (dmMain.GetSettingsValue('RECOURSE_DIRECT') = '1');
  for i := 0 to dbGrid.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'DIRECT') then
      dbGrid.Columns[i].Visible := FShowDirect;
  end;

  fStartDate := Now - 7;
  fEndDate := Now;
  if not TryStrToInt(dmMain.GetIniValue('FETCHALL'), i) then
    i := 0;
  if (i = 0) then
    dsRecourses.Options := dsRecourses.Options - [poFetchAll];

  SetFilter;
end;

procedure TRecoursesForm.N1Click(Sender: TObject);
begin
  inherited;
  fStartDate := Now;
  fEndDate := Now;
  SetFilter;
end;

procedure TRecoursesForm.N2Click(Sender: TObject);
begin
  inherited;
  fStartDate := Now - 7;
  fEndDate := Now;
  SetFilter;
end;

procedure TRecoursesForm.N3Click(Sender: TObject);
begin
  inherited;
  fStartDate := MonthFirstDay(Now);
  fEndDate := MonthLastDay(Now);
  SetFilter;
end;

procedure TRecoursesForm.N4Click(Sender: TObject);
begin
  inherited;
  fStartDate := Now - 1;
  fEndDate := Now - 1;
  SetFilter;
end;

procedure TRecoursesForm.actFilterCustomerExecute(Sender: TObject);
var
  i: Integer;
  b: TBookMark;
  customers: TStringList;
  s: string;
begin

  customers := TStringList.Create;
  customers.Sorted := true;
  customers.Duplicates := dupIgnore;

  if (dbGrid.SelectedRows.Count = 0) then
  begin
    if not dbGrid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
      customers.Add(IntToStr(dbGrid.DataSource.DataSet['CUSTOMER_ID']));
  end
  else
  begin
    b := dbGrid.DataSource.DataSet.GetBookmark;
    dbGrid.DataSource.DataSet.Disablecontrols;
    dbGrid.DataSource.DataSet.First;
    for i := 0 to dbGrid.SelectedRows.Count - 1 do
    begin
      dbGrid.DataSource.DataSet.Bookmark := dbGrid.SelectedRows[i];
      if not dbGrid.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
        customers.Add(IntToStr(dbGrid.DataSource.DataSet['CUSTOMER_ID']));
    end;
    dbGrid.DataSource.DataSet.GotoBookmark(b);
    dbGrid.DataSource.DataSet.EnableControls;
  end;

  if (customers.Count > 0) then
    s := customers.CommaText
  else
    s := '';

  FreeAndNil(customers);

  if (s <> '') then
    ShowCustomers(7, s);
end;

procedure TRecoursesForm.SwitchTreeMode(chkBox: TCheckBox; TreeGrid: TDBGridEh; FibDS: TpFIBDataSet;
  MemDS: TMemTableEh);
var
  Crsr: TCursor;
begin
  Crsr := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  try
    if chkBox.Checked then
    begin
      MemDS.Disablecontrols;
      TreeGrid.DataSource.DataSet := MemDS;
      TreeGrid.SortLocal := true;
      TreeGrid.DataGrouping.GroupPanelVisible := true;
      TreeGrid.DataGrouping.GroupLevels.Clear;
      FibDS.Close;
      MemDS.Open;
      TreeGrid.DataGrouping.Active := true;
      MemDS.First;
      MemDS.EnableControls;
      FCanSaveColumns := False;
    end
    else
    begin
      FibDS.Disablecontrols;
      TreeGrid.DataGrouping.Active := False;
      TreeGrid.SortLocal := False;
      TreeGrid.DataSource.DataSet := FibDS;
      MemDS.Close;
      TreeGrid.DataGrouping.GroupPanelVisible := False;
      FibDS.Open;
      FibDS.First;
      TreeGrid.DataGrouping.GroupLevels.Clear;
      FibDS.EnableControls;
    end;
  finally
    Screen.Cursor := Crsr;
  end;
end;

end.
