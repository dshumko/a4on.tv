unit LabelTypeForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, ActnList, DB, ComCtrls, ToolWin, Grids, DBGridEh,
  FIBDataSet, pFIBDataSet, GridsEh, Menus, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, PrjConst, CnErrorProvider, Vcl.DBCtrls,
  Vcl.Mask, DBCtrlsEh, EhLibVCL, System.UITypes, DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase;

type
  TLabelTypeForm = class(TGridForm)
    dsData: TpFIBDataSet;
    edtName: TDBEditEh;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    mmoLabels: TDBMemoEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
  private
    procedure StartEdt(const New: Boolean = False);
  public
    { Public declarations }
  end;

var
  LabelTypeForm: TLabelTypeForm;

implementation

uses DM, AtrStrUtils;

{$R *.dfm}

procedure TLabelTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsData.Close;
  LabelTypeForm := nil;
end;

procedure TLabelTypeForm.StartEdt(const New: Boolean = False);
begin
  mmoLabels.Lines.Clear;
  StartEdit(New);
  // запретим редактировать определенные контакты
  if New then
    edtName.SetFocus
  else begin
    if not dsData.FieldByName('O_CHARFIELD').IsNull then begin
      mmoLabels.Lines.Delimiter := ';';
      mmoLabels.Lines.CommaText := dsData['O_CHARFIELD'];
    end;
    mmoLabels.SetFocus;
  end;
end;

procedure TLabelTypeForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
  begin
    StartEdt(True);
  end;
end;

procedure TLabelTypeForm.btnSaveLinkClick(Sender: TObject);
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

  if not errors then begin
    mmoLabels.Lines.Delimiter := ';';
    dsData['O_CHARFIELD'] := mmoLabels.Lines.CommaText;
    inherited;
  end;
end;

procedure TLabelTypeForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;

  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
end;

procedure TLabelTypeForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
  begin
    StartEdt();
  end;
end;

procedure TLabelTypeForm.FormShow(Sender: TObject);
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

  dsData.Open;
  dbGrid.DefaultApplySorting;
  dsData.First;
end;

procedure TLabelTypeForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  // actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

end.
