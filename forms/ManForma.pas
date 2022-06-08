unit ManForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, CnErrorProvider,
  DBCtrlsEh, PrjConst, EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  TManForm = class(TGridForm)
    dsMan: TpFIBDataSet;
    Label1: TLabel;
    Label2: TLabel;
    dbeName: TDBEditEh;
    DBMemo1: TDBMemoEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure tbOkClick(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure dbeNameEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ManForm: TManForm;

implementation

uses
  DM;

{$R *.dfm}

procedure TManForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsMan.Close;
  ManForm := nil;
end;

procedure TManForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_MANUFACTURERS))) then exit;
  StartEdit(True);
end;

procedure TManForm.btnSaveLinkClick(Sender: TObject);
var
  errors : Boolean;
begin
  errors := False;
  if (dbeName.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(dbeName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(dbeName);

  if not errors
  then inherited;

end;

procedure TManForm.dbeNameEnter(Sender: TObject);
begin
  inherited;
  CnErrors.Dispose(dbeName);
end;

procedure TManForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_MANUFACTURERS))) then exit;
  if (MessageDlg(format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then srcDataSource.DataSet.Delete;
end;

procedure TManForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_MANUFACTURERS))) then exit;
    StartEdit();
end;

procedure TManForm.tbOkClick(Sender: TObject);
begin
  inherited;
  if ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_MANUFACTURERS)))
  then srcDataSource.DataSet.Post
  else srcDataSource.DataSet.Cancel;
end;

procedure TManForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Cancel;
end;

procedure TManForm.srcDataSourceStateChange(Sender: TObject);
begin
  inherited;

  tbOk.Enabled := not ((sender as TDataSource).DataSet.State = dsBrowse);
  tbCancel.Enabled := tbOk.Enabled;
  btnNew.Enabled := not tbOk.Enabled;
  btnEdit.Enabled := not tbOk.Enabled;
  btnDelete.Enabled := not tbOk.Enabled;
end;

procedure TManForm.FormCreate(Sender: TObject);
begin
  fCanEdit   := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_MANUFACTURERS);
  fCanCreate := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_MANUFACTURERS);
  inherited;
  // права пользователей
  actNew.Visible    := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible   := fCanEdit;
end;

procedure TManForm.FormShow(Sender: TObject);
begin
  inherited;
  dsMan.Open;
end;

procedure TManForm.srcDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  actEdit.Enabled   :=  ((sender as TDataSource).DataSet.RecordCount>0) and actNew.Enabled;
  actDelete.Enabled :=  ((sender as TDataSource).DataSet.RecordCount>0) and actNew.Enabled;
end;

end.
