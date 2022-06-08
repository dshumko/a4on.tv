unit CompanyForma;

interface

{$I defines.inc}

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.Grids, Vcl.ToolWin, Vcl.Mask, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  DBGridEh, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, DBGridEhGrouping, DynVarsEh, EhLibVCL, DBCtrlsEh,
  CnErrorProvider;

type
  TCompanyForm = class(TForm)
    tlbMain: TToolBar;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    ToolButton9: TToolButton;
    tbOk: TToolButton;
    ToolButton10: TToolButton;
    tbCancel: TToolButton;
    srcCompany: TDataSource;
    ActionList1: TActionList;
    actEdit: TAction;
    dbGrid: TDBGridEh;
    actNew: TAction;
    actDelete: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    pnlEdit: TPanel;
    btnSaveLink: TBitBtn;
    btnCancelLink: TBitBtn;
    lbl3: TLabel;
    edtO_DIMENSION: TDBEditEh;
    lbl1: TLabel;
    edtName: TDBEditEh;
    lbl2: TLabel;
    mmoDesc: TDBMemoEh;
    lbl4: TLabel;
    edtPP: TDBEditEh;
    lbl5: TLabel;
    edtC_KODE: TDBEditEh;
    CnErrors: TCnErrorProvider;
    procedure actEditExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbCancelClick(Sender: TObject);
    procedure tbOkClick(Sender: TObject);
    procedure srcCompanyStateChange(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure srcCompanyDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure dbGridDblClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FNeedUpdate: Boolean;
    FCanEdit: Boolean;
    FCanCreate: Boolean;
    FinEditMode: Boolean;
    procedure StartEdit(const New: Boolean = False);
    procedure StopEdit(const Cancel: Boolean);
  public
    { Public declarations }
  end;

var
  CompanyForm: TCompanyForm;

implementation

uses
  DM, MAIN, PrjConst;

{$R *.dfm}

procedure TCompanyForm.srcCompanyStateChange(Sender: TObject);
begin
  tbOk.Enabled := not((Sender as TDataSource).DataSet.State = dsBrowse);
  tbCancel.Enabled := tbOk.Enabled;
  actNew.Enabled := not tbOk.Enabled;
  FneedUpdate := True;
end;

procedure TCompanyForm.tbOkClick(Sender: TObject);
begin
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Company)))
  then srcCompany.DataSet.Cancel
  else srcCompany.DataSet.Post;
end;

procedure TCompanyForm.tbCancelClick(Sender: TObject);
begin
  srcCompany.DataSet.Cancel;
end;

procedure TCompanyForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FneedUpdate
  then begin
    srcCompany.DataSet.Close;
    srcCompany.DataSet.Open;
  end;

  Action := CaFree;
  CompanyForm := nil;
end;

procedure TCompanyForm.FormCreate(Sender: TObject);
begin
  FneedUpdate := False;
  if not srcCompany.DataSet.Active
  then srcCompany.DataSet.Open;
end;

procedure TCompanyForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) and FinEditMode
  then
      StopEdit(False);
end;

procedure TCompanyForm.actEditExecute(Sender: TObject);
begin
  // if ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Shippers)))
  // then srcCompany.DataSet.Edit;
  StartEdit(False);
end;

procedure TCompanyForm.actNewExecute(Sender: TObject);
begin
  // if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Shippers))) then exit;
  // srcCompany.DataSet.Append;
  StartEdit(True);
end;

procedure TCompanyForm.actDeleteExecute(Sender: TObject);
begin
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Company)))
  then exit;
  srcCompany.DataSet.Delete;
end;

procedure TCompanyForm.FormShow(Sender: TObject);
begin
  // права пользователей
  FCanEdit := ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Company)));
  FCanCreate := FCanEdit;
  actNew.Visible := FCanEdit;
  actDelete.Visible := FCanEdit;
  actEdit.Visible := FCanEdit;
  // tbOk.Visible         := False;
  // tbCancel.Visible     := False;
end;

procedure TCompanyForm.srcCompanyDataChange(Sender: TObject; Field: TField);
begin
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Enabled;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and actNew.Enabled;
end;

procedure TCompanyForm.StartEdit(const New: Boolean = False);
begin
  if not FCanEdit
  then exit;

  if (not New) and (srcCompany.DataSet.RecordCount = 0)
  then exit;

  pnlEdit.Visible := True;
  dbGrid.Enabled := False;
  tlbMain.Enabled := False;

  // pnlEdit.SetFocus;

  if New
  then begin
    srcCompany.DataSet.Append;
    edtPP.Setfocus;
  end
  else begin
    srcCompany.DataSet.Edit;
    if edtName.Text.IsEmpty then edtName.SetFocus
    else edtO_DIMENSION.SetFocus;
  end;

  FinEditMode := True;
end;

procedure TCompanyForm.StopEdit(const Cancel: Boolean);
var
  errors: Boolean;
begin
  if (Cancel) or (not FCanEdit)
  then begin
    CnErrors.Dispose(edtPP);
    CnErrors.Dispose(edtC_KODE);
    CnErrors.Dispose(edtName);
    if (srcCompany.DataSet.State in [dsEdit, dsInsert])
    then srcCompany.DataSet.Cancel;
    errors := False;
  end
  else begin
    errors := False;

    if (edtPP.Text = '')
    then begin
      errors := True;
      CnErrors.SetError(edtPP, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else CnErrors.Dispose(edtPP);
    if (edtC_KODE.Text = '')
    then begin
      errors := True;
      CnErrors.SetError(edtC_KODE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else CnErrors.Dispose(edtC_KODE);
    if (edtName.Text = '')
    then begin
      errors := True;
      CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else CnErrors.Dispose(edtName);

    if not errors
    then srcCompany.DataSet.Post;
  end;

  pnlEdit.Visible := errors;
  dbGrid.Enabled := not errors;
  tlbMain.Enabled := not errors;
  FinEditMode := errors;
  if not errors
  then dbGrid.SetFocus;
end;

procedure TCompanyForm.btnSaveLinkClick(Sender: TObject);
begin
  StopEdit(False);
end;

procedure TCompanyForm.btnCancelLinkClick(Sender: TObject);
begin
  StopEdit(True);
end;

procedure TCompanyForm.dbGridDblClick(Sender: TObject);
begin
  if srcCompany.DataSet.RecordCount > 0
  then begin
    if not(actEdit.Enabled or actEdit.Visible)
    then exit;
    actEdit.Execute;
  end
  else begin
    if not(actNew.Enabled or actNew.Visible)
    then exit;
    actNew.Execute;
  end;
end;

end.
