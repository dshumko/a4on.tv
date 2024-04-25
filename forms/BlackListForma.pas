unit BlackListForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, CnErrorProvider,
  DBCtrlsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, PrnDbgeh;

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

uses
  DM;

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
var
 i : Integer;
begin
  inherited;
  fCanEdit := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_BlacList);
  // может редактировать если разрешено редактировать все
  fCanCreate := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_BlacList);

  // права пользователей
  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  if (dmMain.GetSettingsValue('SHOW_DOC_LIST') = '1') then begin
    dsBlackList.ParamByName('fld_doc_list').value := 'iif(exists( select d.Doc_Number from doc_list d where d.Doc_Number = O_NAME), 1, 0)';
    for i := 0 to dbGrid.Columns.Count - 1 do
    begin
      if (AnsiUpperCase(dbGrid.Columns[i].FieldName) = 'IN_DOC_LIST') then
        dbGrid.Columns[i].Visible := True;
    end;
  end;

  dsBlackList.Open;
end;

procedure TBlackListForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

end.
