unit RecourseTPLForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  GridForma, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  CnErrorProvider,
  EhLibVCL, DBGridEhGrouping, DynVarsEh, DBCtrlsEh, amSplitter, PrnDbgeh, CnClasses;

type
  TRecoursesTPLForm = class(TGridForm)
    dsType: TpFIBDataSet;
    dsTPL: TpFIBDataSet;
    srcTPL: TDataSource;
    actTPLFilter: TAction;
    spl1: TSplitter;
    ActCONTAdd: TAction;
    actCONTEDIT: TAction;
    actCONTDEL: TAction;
    chkDel: TDBCheckBoxEh;
    pnlTop: TPanel;
    cbDirect: TDBComboBoxEh;
    edtName: TDBEditEh;
    lbl2: TLabel;
    pnlTags: TPanel;
    mmoData: TDBMemoEh;
    mmoTags: TDBMemoEh;
    pnlNotice: TPanel;
    mmoNotice: TDBMemoEh;
    spl2: TSplitter;
    spl3: TSplitter;
    pgc: TPageControl;
    tsContetnt: TTabSheet;
    pnlContent: TPanel;
    dbgrdTPL: TDBGridEh;
    tlbBtns: TToolBar;
    btn5: TToolButton;
    btnContentAdd: TToolButton;
    btn6: TToolButton;
    btn2: TToolButton;
    btn7: TToolButton;
    btn3: TToolButton;
    btn8: TToolButton;
    btnOkTPL: TToolButton;
    btn10: TToolButton;
    btnCancelTPL: TToolButton;
    tsResult: TTabSheet;
    pnlResult: TPanel;
    dbgResult: TDBGridEh;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    dsResult: TpFIBDataSet;
    srcResult: TDataSource;
    actAddRes: TAction;
    actEditRes: TAction;
    actDelRes: TAction;
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure tbOkClick(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure srcTPLStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dsTPLBeforePost(DataSet: TDataSet);
    procedure btnOkTPLClick(Sender: TObject);
    procedure btnCancelTPLClick(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure ActCONTAddExecute(Sender: TObject);
    procedure actCONTEDITExecute(Sender: TObject);
    procedure actCONTDELExecute(Sender: TObject);
    procedure srcTPLDataChange(Sender: TObject; Field: TField);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure pgcChange(Sender: TObject);
    procedure actAddResExecute(Sender: TObject);
    procedure actEditResExecute(Sender: TObject);
    procedure actDelResExecute(Sender: TObject);
  private
    FclOutcome: TColor;
    FShowDirect: Boolean;
  public
    { Public declarations }
  end;

var
  RecoursesTPLForm: TRecoursesTPLForm;

implementation

uses
  DM, MAIN, EditRecResultForma;

{$R *.dfm}

procedure TRecoursesTPLForm.ActCONTAddExecute(Sender: TObject);
begin
  inherited;

  if ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_RecType))) then
    srcTPL.DataSet.Insert;
end;

procedure TRecoursesTPLForm.actCONTEDITExecute(Sender: TObject);
begin
  inherited;

  if ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_RecType))) then
    srcTPL.DataSet.Edit;
end;

procedure TRecoursesTPLForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_RecType))) then
    Exit;
  if (MessageDlg(format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then
    srcDataSource.DataSet.Delete;
end;

procedure TRecoursesTPLForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit();
end;

procedure TRecoursesTPLForm.actCONTDELExecute(Sender: TObject);
begin
  inherited;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_RecType))) then
    Exit;
  if (MessageDlg(format(rsDeleteWithName, [srcTPL.DataSet['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    srcTPL.DataSet.Delete;
end;

procedure TRecoursesTPLForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit(True);
end;

procedure TRecoursesTPLForm.btnCancelTPLClick(Sender: TObject);
begin
  inherited;
  srcTPL.DataSet.Cancel;
end;

procedure TRecoursesTPLForm.btnOkTPLClick(Sender: TObject);
begin
  inherited;
  if ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_RecType))) then
    srcTPL.DataSet.Post
  else
    srcTPL.DataSet.Cancel;
end;

procedure TRecoursesTPLForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  inherited;
  if (not dsType.FieldByName('O_DELETED').IsNull) and (dsType['O_DELETED'] = 1) then
    Background := $005555FF
  else if not(Sender as TDBGridEh).DataSource.DataSet.FieldByName('DIRECT').IsNull then
  begin
    if ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('DIRECT').AsInteger = 1) then
      Background := FclOutcome;
  end;
end;

procedure TRecoursesTPLForm.dsTPLBeforePost(DataSet: TDataSet);
begin
  inherited;
  dsTPL['TYPE_ID'] := dsType['O_ID'];
end;

procedure TRecoursesTPLForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  RecoursesTPLForm := nil;
end;

procedure TRecoursesTPLForm.FormCreate(Sender: TObject);
var
  s: string;
begin
  inherited;
  s := dmMain.GetSettingsValue('RECOURSE_DIRECT');
  FShowDirect := (s = '1');

  try
    s := dmMain.GetSettingsValue('ROW_HL_WARNING');
    FclOutcome := StringToColor(s);
  except
    FclOutcome := $0066FFFF;
  end;

end;

procedure TRecoursesTPLForm.FormShow(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  dsType.Open;
  fCanEdit := ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_RecType)));

  srcTPL.AutoEdit := fCanEdit;
  srcDataSource.AutoEdit := fCanEdit;

  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  ActCONTAdd.Visible := fCanEdit;
  actCONTEDIT.Visible := fCanEdit;
  actCONTDEL.Visible := fCanEdit;

  actAddRes.Visible := fCanEdit;
  actEditRes.Visible := fCanEdit;
  actDelRes.Visible := fCanEdit;
  pnlButtons.Visible := fCanEdit;

  chkDel.Visible := dmMain.UserIsAdmin;
  cbDirect.Visible := FShowDirect;
  if not FShowDirect then
    edtName.Width := pnlTop.Width - edtName.Left - 4;

  for i := 0 to dbGrid.Columns.Count - 1 do
  begin
    if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'O_DELETED') then
      dbGrid.Columns[i].Visible := chkDel.Visible
    else if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'DIRECT') then
      dbGrid.Columns[i].Visible := FShowDirect;
  end;

  pgc.ActivePageIndex := 0;
end;

procedure TRecoursesTPLForm.pgcChange(Sender: TObject);
begin
  inherited;
  dsTPL.Active := (pgc.ActivePageIndex = 0);
  dsResult.Active := (pgc.ActivePageIndex = 1);
end;

procedure TRecoursesTPLForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := (srcDataSource.DataSet.RecordCount > 0) and actEdit.Visible;
  actDelete.Enabled := (srcDataSource.DataSet.RecordCount > 0) and actDelete.Visible;
  ActCONTAdd.Enabled := (srcDataSource.DataSet.RecordCount > 0) and ActCONTAdd.Visible;
end;

procedure TRecoursesTPLForm.srcDataSourceStateChange(Sender: TObject);
begin
  inherited;

  pgc.Enabled := ((Sender as TDataSource).DataSet.State = dsBrowse);
  {
    ToolButton1.Enabled := pnlGrid.Enabled;
    ToolButton2.Enabled := pnlGrid.Enabled;
    ToolButton3.Enabled := pnlGrid.Enabled;
  }
end;

procedure TRecoursesTPLForm.srcTPLDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actCONTEDIT.Enabled := (srcTPL.DataSet.RecordCount > 0) and actCONTEDIT.Visible and (not btnOkTPL.Enabled);
  actCONTDEL.Enabled := (srcTPL.DataSet.RecordCount > 0) and actCONTDEL.Visible and (not btnOkTPL.Enabled);
end;

procedure TRecoursesTPLForm.srcTPLStateChange(Sender: TObject);
begin
  inherited;
  btnOkTPL.Enabled := not((Sender as TDataSource).DataSet.State = dsBrowse);
  btnCancelTPL.Enabled := btnOkTPL.Enabled;
  ActCONTAdd.Enabled := (not btnOkTPL.Enabled) and ActCONTAdd.Visible;
  actCONTEDIT.Enabled := (not btnOkTPL.Enabled) and actCONTEDIT.Visible and (srcTPL.DataSet.RecordCount > 0);
  actCONTDEL.Enabled := (not btnOkTPL.Enabled) and actCONTDEL.Visible and (srcTPL.DataSet.RecordCount > 0);
end;

procedure TRecoursesTPLForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Cancel;
end;

procedure TRecoursesTPLForm.tbOkClick(Sender: TObject);
begin
  inherited;
  if ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_RecType))) then
    srcDataSource.DataSet.Post
  else
    srcDataSource.DataSet.Cancel;
end;

procedure TRecoursesTPLForm.actAddResExecute(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  if (not dsType.Active) or (dsType.FieldByName('O_ID').IsNull) then
    Exit;

  i := EditRecResult(-1 * dsType['O_ID']);
  if i > 0 then
  begin
    dsResult.CloseOpen(True);
    dsResult.Locate('O_ID', i, []);
  end;
end;

procedure TRecoursesTPLForm.actEditResExecute(Sender: TObject);
begin
  inherited;
  if (not dsType.Active) or (dsResult.FieldByName('O_ID').IsNull) then
    Exit;

  if EditRecResult(dsResult['O_ID']) > 0 then
    dsResult.Refresh;
end;

procedure TRecoursesTPLForm.actDelResExecute(Sender: TObject);
begin
  inherited;
  if (not dsType.Active) or (dsResult.FieldByName('O_NAME').IsNull) then
    Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_RecType))) then
    Exit;
  if (MessageDlg(format(rsDeleteWithName, [dsResult['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dsResult.Delete
end;

end.
