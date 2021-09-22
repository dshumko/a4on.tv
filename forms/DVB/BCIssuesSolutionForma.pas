unit BCIssuesSolutionForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, DB, FIBDataSet, pFIBDataSet, Menus,
  ActnList, ComCtrls, ToolWin, GridsEh, DBGridEh, ToolCtrlsEh, System.UITypes,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, CnErrorProvider, PrjConst, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, MemTableDataEh, DataDriverEh, pFIBDataDriverEh,
  MemTableEh, EhLibFIB, DBCtrlsEh, Vcl.Mask;

type
  TBCIssuesSolutionForm = class(TGridForm)
    dsData: TpFIBDataSet;
    pmPeriod: TPopupMenu;
    N1: TMenuItem;
    N4: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    lbl3: TLabel;
    mmoO_DESCRIPTION: TDBMemoEh;
    edtName: TDBEditEh;
    lbl2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
  private
    { Private declarations }
    FFirstOpen: Boolean;
  public
    { Public declarations }
  end;

var
  BCIssuesSolutionForm: TBCIssuesSolutionForm;

implementation

uses
  DM, RecourseForma, MAIN, PeriodForma, AtrStrUtils, CF, pFIBProps;

{$R *.dfm}

procedure TBCIssuesSolutionForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := actEdit.Visible and (srcDataSource.DataSet.RecordCount > 0);
  actDelete.Enabled := actDelete.Enabled and (srcDataSource.DataSet.RecordCount > 0);
end;

procedure TBCIssuesSolutionForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;
  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
end;

procedure TBCIssuesSolutionForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit();
end;

procedure TBCIssuesSolutionForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit(True)
end;

procedure TBCIssuesSolutionForm.btnSaveLinkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := False;

  if (edtName.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtName);

  if not errors then
  begin
    inherited;
  end;
end;

procedure TBCIssuesSolutionForm.FormActivate(Sender: TObject);
begin
  inherited;
  if (not dsData.Active) then
    dsData.Open;
end;

procedure TBCIssuesSolutionForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsData.Close;
  BCIssuesSolutionForm := nil;
  Action := caFree;
end;

procedure TBCIssuesSolutionForm.FormCreate(Sender: TObject);
begin
  inherited;
  FFirstOpen := True;
end;

procedure TBCIssuesSolutionForm.FormShow(Sender: TObject);
var
  I: integer;
begin
  inherited;

  actNew.Visible := dmMain.AllowedAction(rght_BCIssuesType);
  actEdit.Visible := dmMain.AllowedAction(rght_BCIssuesType);
  actDelete.Visible := dmMain.AllowedAction(rght_BCIssuesType);
  fCanEdit := dmMain.AllowedAction(rght_BCIssuesType);

  if not TryStrToInt(dmMain.GetIniValue('FETCHALL'), I) then
    I := 0;
  if (I = 0) then
    dsData.Options := dsData.Options - [poFetchAll];

end;

end.
