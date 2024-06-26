﻿unit RecoursesForma;

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
  PrnDbgeh;

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
  private
    { Private declarations }
    FFirstOpen: Boolean;
    fStartDate: TDateTime;
    fEndDate: TDateTime;
    FCanSaveColumns: Boolean;
    FPersonalData: Boolean;
    FTodayOnly: Boolean;
    FOnlyTheir: Boolean;
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
  if (FTodayOnly) then begin
    fStartDate := Now;
    fEndDate := fStartDate;
  end;

  dsRecourses.Close;
  if FOnlyTheir  then
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
  if (not FPersonalData) and (not Params.Text.IsEmpty) then
    Params.Text := HideSurname(Params.Text);

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
  end;
end;

procedure TRecoursesForm.FormActivate(Sender: TObject);
var
  b: integer;
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

end;

procedure TRecoursesForm.FormShow(Sender: TObject);
var
  I: integer;
begin
  inherited;

  FCanSaveColumns := true;
  actNew.Visible := (dmMain.AllowedAction(rght_Recourses_add));
  actEdit.Visible := (dmMain.AllowedAction(rght_Recourses_edit)) and False;
  actDelete.Visible := (dmMain.AllowedAction(rght_Recourses_del));
  FPersonalData := (not dmMain.AllowedAction(rght_Customer_PersonalData));

  FTodayOnly := dmMain.AllowedAction(rght_Recourses_TodayOnly);
  FOnlyTheir := dmMain.AllowedAction(rght_Recourses_owner);

  fStartDate := now - 7;
  fEndDate := now;
  if not TryStrToInt(dmMain.GetIniValue('FETCHALL'), I) then
    I := 0;
  if (I = 0) then
    dsRecourses.Options := dsRecourses.Options - [poFetchAll];

  SetFilter;
end;

procedure TRecoursesForm.N1Click(Sender: TObject);
begin
  inherited;
  fStartDate := now;
  fEndDate := now;
  SetFilter;
end;

procedure TRecoursesForm.N2Click(Sender: TObject);
begin
  inherited;
  fStartDate := now - 7;
  fEndDate := now;
  SetFilter;
end;

procedure TRecoursesForm.N3Click(Sender: TObject);
begin
  inherited;
  fStartDate := MonthFirstDay(now);
  fEndDate := MonthLastDay(now);
  SetFilter;
end;

procedure TRecoursesForm.N4Click(Sender: TObject);
begin
  inherited;
  fStartDate := now - 1;
  fEndDate := now - 1;
  SetFilter;
end;

procedure TRecoursesForm.actFilterCustomerExecute(Sender: TObject);
var
  I: integer;
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
    for I := 0 to dbGrid.SelectedRows.Count - 1 do
    begin
      dbGrid.DataSource.DataSet.Bookmark := dbGrid.SelectedRows[I];
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
