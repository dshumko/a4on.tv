unit BCIssuesForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls,
  GridForma, FIBDataSet, pFIBDataSet, GridsEh, DBGridEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, CnErrorProvider, PrjConst,
  EhLibVCL, DBGridEhGrouping, DynVarsEh, MemTableDataEh, DataDriverEh, pFIBDataDriverEh, MemTableEh, EhLibFIB,
  PrnDbgeh;

type
  TBCIssuesForm = class(TGridForm)
    dsIssues: TpFIBDataSet;
    btnDateFilter: TToolButton;
    actDateFilter: TAction;
    pmPeriod: TPopupMenu;
    N1: TMenuItem;
    N4: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    miN5: TMenuItem;
    miNotClosed: TMenuItem;
    btn1: TToolButton;
    btnRefresh: TToolButton;
    actRefresh: TAction;
    actCheckIssue: TAction;
    miCheckIssue: TMenuItem;
    miN6: TMenuItem;
    btn2: TToolButton;
    btnCheckIssue: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actDateFilterExecute(Sender: TObject);
    procedure miNotClosedClick(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure actCheckIssueExecute(Sender: TObject);
  private
    { Private declarations }
    FFirstOpen: Boolean;
    fStartDate: TDateTime;
    fEndDate: TDateTime;
    FCanSaveColumns: Boolean;
    FNotClosed: Boolean;
    FUrlChIssue: string;
    procedure SetFilter;
  public
    { Public declarations }
  end;

var
  BCIssuesForm: TBCIssuesForm;

implementation

uses
  System.StrUtils,
  DM, BCIForma, MAIN, AtrStrUtils, pFIBProps, PeriodForma, HtmlForma;

{$R *.dfm}

procedure TBCIssuesForm.actCheckIssueExecute(Sender: TObject);
var
  Url: string;
begin
  inherited;
  Url := FUrlChIssue;
  if not dsIssues.FieldByName('BI_ID').IsNull then
  Url :=  ReplaceStr(FUrlChIssue, '<id>', dsIssues.FieldByName('BI_ID').AsString);

  ShowHtml(url, '', actCheckIssue.Caption);
end;

procedure TBCIssuesForm.actDateFilterExecute(Sender: TObject);
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

procedure TBCIssuesForm.SetFilter;
var
  cr: TCursor;
begin
  cr := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  dsIssues.Close;
  dsIssues.ParamByName('Start_Date').AsDate := fStartDate;
  dsIssues.ParamByName('End_Date').AsDate := fEndDate;
  if FNotClosed then
    dsIssues.ParamByName('not_closed').AsString := 'i.Edit_On is null'
  else
    dsIssues.ParamByName('not_closed').AsString := '1>1';

  Caption := Format(rsBCIssuesPeriod, [DateToStr(fStartDate), DateToStr(fEndDate)]);
  dsIssues.Open;
  Screen.Cursor := cr;
end;

procedure TBCIssuesForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := actEdit.Visible and (srcDataSource.DataSet.RecordCount > 0);
  actDelete.Enabled := actDelete.Enabled and (srcDataSource.DataSet.RecordCount > 0);
end;

procedure TBCIssuesForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (not dmMain.AllowedAction(rght_Recourses_del)) then
    exit;
  if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['ISSUE_TYPE']]), mtConfirmation, [mbYes, mbNo], 0)
    = mrYes) then
    srcDataSource.DataSet.Delete;
end;

procedure TBCIssuesForm.actEditExecute(Sender: TObject);
var
  IssueId: Integer;
begin
  inherited;
  IssueId := dsIssues['BI_ID'];
  if BroadCastIssue(IssueId) then
    dsIssues.Refresh;
end;

procedure TBCIssuesForm.actNewExecute(Sender: TObject);
var
  IssueId: Integer;
begin
  inherited;
  IssueId := -1;
  if BroadCastIssue(IssueId) then
  begin
    dsIssues.CloseOpen(true);
    dsIssues.Locate('BI_ID', IssueId, []);
  end;
end;

procedure TBCIssuesForm.actRefreshExecute(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  if (dsIssues.Active) and (not dsIssues.FieldByName('BI_ID').IsNull) then
    i := dsIssues['BI_ID']
  else
    i := -1;
  dsIssues.CloseOpen(true);
  if i > 0 then
    dsIssues.Locate('BI_ID', i, []);
end;

procedure TBCIssuesForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;

  if not(Sender as TDBGridEh).DataSource.DataSet.Active then
    exit;

  // DBTextDebt.Color:=AFont.Color;
  if (gdSelected in State) then
  begin
    AFont.Color := clHighlightText;
    Background := clHighlight;
  end
  else
  begin
    if ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('ISSUE_SOLUTION').IsNull) or
      ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('ISSUE_SOLUTION').AsString.IsEmpty) then
      Background := clYellow;
  end;
end;

procedure TBCIssuesForm.FormActivate(Sender: TObject);
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

  if not((dsIssues.Active) and (dsIssues.RecordCount > 0) and (not dsIssues.FieldByName('BI_ID').IsNull)) then
    exit;

  inFilter := dsIssues.Filtered;
  filter := dsIssues.filter;
  b := dsIssues['BI_ID'];
  dsIssues.CloseOpen(true);
  if inFilter then
  begin
    dsIssues.filter := filter;
    dsIssues.Filtered := inFilter;
    if dbGrid.SearchPanel.SearchingText <> '' then
      dbGrid.SearchPanel.ApplySearchFilter;
  end;
  dsIssues.Locate('BI_ID', b, []);
end;

procedure TBCIssuesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if FCanSaveColumns then
    inherited;
  dsIssues.Close;
  BCIssuesForm := nil;
  if not FCanSaveColumns then
    Action := caFree;
end;

procedure TBCIssuesForm.FormCreate(Sender: TObject);
begin
  inherited;
  FFirstOpen := true;
end;

procedure TBCIssuesForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  FCanSaveColumns := true;
  actNew.Visible := (dmMain.AllowedAction(rght_BCIssues_add));
  actEdit.Visible := (dmMain.AllowedAction(rght_BCIssues_close)) and true;
  actDelete.Visible := (dmMain.AllowedAction(rght_BCIssues_del));

  FUrlChIssue := dmMain.GetSettingsValue('CH_ISSUE_CHECK_URL');
  actCheckIssue.Visible := (FUrlChIssue <> '');

  fStartDate := now - 7;
  fEndDate := now;
  FNotClosed := true;
  if not TryStrToInt(dmMain.GetIniValue('FETCHALL'), i) then
    i := 0;
  if (i = 0) then
    dsIssues.Options := dsIssues.Options - [poFetchAll];

  SetFilter;
end;

procedure TBCIssuesForm.miNotClosedClick(Sender: TObject);
begin
  inherited;
  FNotClosed := not FNotClosed;
  miNotClosed.Checked := FNotClosed;
  SetFilter;
end;

procedure TBCIssuesForm.N1Click(Sender: TObject);
begin
  inherited;
  fStartDate := now;
  fEndDate := now;
  SetFilter;
end;

procedure TBCIssuesForm.N2Click(Sender: TObject);
begin
  inherited;
  fStartDate := now - 7;
  fEndDate := now;
  SetFilter;
end;

procedure TBCIssuesForm.N3Click(Sender: TObject);
begin
  inherited;
  fStartDate := MonthFirstDay(now);
  fEndDate := MonthLastDay(now);
  SetFilter;
end;

procedure TBCIssuesForm.N4Click(Sender: TObject);
begin
  inherited;
  fStartDate := now - 1;
  fEndDate := now - 1;
  SetFilter;
end;

end.
