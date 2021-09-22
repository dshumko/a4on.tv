unit RecourseTPLForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, ExtCtrls, Menus, ActnList, DB,
  ComCtrls, ToolWin, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, System.UITypes,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, System.Actions,
  Vcl.StdCtrls, Vcl.Buttons, PrjConst, CnErrorProvider, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, Vcl.Mask, DBCtrlsEh;

type
  TRecoursesTPLForm = class(TGridForm)
    pnlGrid: TPanel;
    dbgrdTPL: TDBGridEh;
    tlbBtns: TToolBar;
    btn5: TToolButton;
    btnContentAdd: TToolButton;
    btn6: TToolButton;
    btn2: TToolButton;
    btn7: TToolButton;
    btn3: TToolButton;
    btn8: TToolButton;
    btn10: TToolButton;
    btnCancelTPL: TToolButton;
    btn12: TToolButton;
    btn4: TToolButton;
    dsType: TpFIBDataSet;
    dsTPL: TpFIBDataSet;
    srcTPL: TDataSource;
    btnOkTPL: TToolButton;
    actTPLFilter: TAction;
    spl1: TSplitter;
    ActCONTAdd: TAction;
    actCONTEDIT: TAction;
    actCONTDEL: TAction;
    edtName: TDBEditEh;
    lbl2: TLabel;
    mmoNotice: TDBMemoEh;
    lbl3: TLabel;
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure tbOkClick(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure srcTPLStateChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actTPLFilterExecute(Sender: TObject);
    procedure dsTPLBeforePost(DataSet: TDataSet);
    procedure btnOkTPLClick(Sender: TObject);
    procedure btnCancelTPLClick(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure ActCONTAddExecute(Sender: TObject);
    procedure actCONTEDITExecute(Sender: TObject);
    procedure actCONTDELExecute(Sender: TObject);
    procedure srcTPLDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RecoursesTPLForm: TRecoursesTPLForm;

implementation

uses
  DM, MAIN;

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

procedure TRecoursesTPLForm.actTPLFilterExecute(Sender: TObject);
begin
  inherited;
  actTPLFilter.Checked := not actTPLFilter.Checked;
  dbgrdTPL.STFilter.Visible := actTPLFilter.Checked;
  if not actTPLFilter.Checked then
    dbgrdTPL.DataSource.DataSet.Filtered := False;
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

procedure TRecoursesTPLForm.FormShow(Sender: TObject);
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

  pnlGrid.Enabled := ((Sender as TDataSource).DataSet.State = dsBrowse);
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

end.
