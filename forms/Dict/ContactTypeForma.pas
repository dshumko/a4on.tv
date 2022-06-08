unit ContactTypeForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, CnErrorProvider,
  DBCtrlsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase;

type
  TContactTypeForm = class(TGridForm)
    dsContactType: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl3: TLabel;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    lbl4: TLabel;
    cbRegular: TDBComboBoxEh;
    chkUniq: TDBCheckBoxEh;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure cbRegularNotInList(Sender: TObject; NewText: string; var RecheckInList: Boolean);
  private
    procedure StartEdt(const New: Boolean = False);
  public
    { Public declarations }
  end;

var
  ContactTypeForm: TContactTypeForm;

implementation

uses
  DM;

{$R *.dfm}

procedure TContactTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsContactType.Close;
  ContactTypeForm := nil;
end;

procedure TContactTypeForm.StartEdt(const New: Boolean = False);
begin
  StartEdit(New);
  // запретим редактировать определенные контакты
  if ((not New) and (dsContactType.FieldByName('O_ID').AsInteger in [0, 1, 2, 5, 6, 7, 10])) then
    edtName.Enabled := False
  else
    edtName.Enabled := True;
end;

procedure TContactTypeForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
  begin
    StartEdt(True);
  end;
end;

procedure TContactTypeForm.btnSaveLinkClick(Sender: TObject);
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
    inherited;
end;

procedure TContactTypeForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;

  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
end;

procedure TContactTypeForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
  begin
    StartEdt();
  end;
end;

procedure TContactTypeForm.FormShow(Sender: TObject);
var
  vFull: Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Dictionary_full);
  fCanEdit := vFull;

  fCanCreate := fCanEdit;

  actNew.Visible := fCanEdit;
  // actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  dsContactType.Open;
  dbGrid.DefaultApplySorting;
  dsContactType.First;
end;

procedure TContactTypeForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  // actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TContactTypeForm.cbRegularNotInList(Sender: TObject; NewText: string; var RecheckInList: Boolean);
begin
  inherited;
  cbRegular.KeyItems.Add(NewText);
  cbRegular.Items.Add(NewText);
  cbRegular.Value := NewText;
  RecheckInList := False;
end;

end.
