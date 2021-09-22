unit BlackListForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, ActnList, DB, ComCtrls, ToolWin, Grids, DBGridEh,
  FIBDataSet, pFIBDataSet, GridsEh, Menus, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, PrjConst, CnErrorProvider, Vcl.DBCtrls,
  Vcl.Mask, DBCtrlsEh, EhLibVCL, System.UITypes, DBGridEhGrouping, DynVarsEh;

type
  TBlackListForm = class(TGridForm)
    dsBlackList: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    edtO_DIMENSION: TDBEditEh;
    lbl1: TLabel;
    lbl3: TLabel;
    mmoNotice: TDBMemoEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BlackListForm: TBlackListForm;

implementation

uses DM;

{$R *.dfm}

procedure TBlackListForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsBlackList.Close;
  BlackListForm := nil;
end;

procedure TBlackListForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit(True);
end;

procedure TBlackListForm.btnSaveLinkClick(Sender: TObject);
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

procedure TBlackListForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;
  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
end;

procedure TBlackListForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit();
end;

procedure TBlackListForm.FormShow(Sender: TObject);
begin
  inherited;
  fCanEdit := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_BlacList);
  // может редактировать если разрешено редактировать все
  fCanCreate := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_BlacList);

  // права пользователей
  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  dsBlackList.Open;
end;

procedure TBlackListForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

end.
