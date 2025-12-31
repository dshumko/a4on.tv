unit WHForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, FIBDataSet, pFIBDataSet, GridsEh, DBGridEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, CnErrorProvider,
  PrjConst, amSplitter,
  EhLibVCL, DBCtrlsEh, DBGridEhGrouping, DynVarsEh, DBLookupEh, PrnDbgeh;

type
  TWHform = class(TGridForm)
    dsWH: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl3: TLabel;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    dsRights: TpFIBDataSet;
    srcRights: TDataSource;
    cbbOwner: TDBLookupComboboxEh;
    lbl4: TLabel;
    srcOwner: TDataSource;
    dsOwner: TpFIBDataSet;
    actCopyID: TAction;
    chkDel: TDBCheckBoxEh;
    pnlBtm: TPanel;
    dbgRights: TDBGridEh;
    lbl1: TLabel;
    Splitter1: TSplitter;
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure dbgRightsExit(Sender: TObject);
    procedure dsRightsBeforePost(DataSet: TDataSet);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure actCopyIDExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WHform: TWHform;

implementation

uses
  DM, MAIN;

{$R *.dfm}

procedure TWHform.actCopyIDExecute(Sender: TObject);
begin
  inherited;
  A4MainForm.CopyDataSetFldToClipboard(dbGrid.DataSource.DataSet, 'O_ID');
end;

procedure TWHform.actDeleteExecute(Sender: TObject);
var
  s: string;
  i: Integer;
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;

  if not fCanEdit then
    Exit;

  i := 0;
  if (not srcDataSource.DataSet.FieldByName('REM').IsNull) and (trunc(srcDataSource.DataSet['REM']) <> 0) then
    i := 1
  else
  begin
    try
      with dmMain.qRead do
      begin
        SQL.Clear;
        SQL.Add('select 1 CNT from Rdb$Database where');
        SQL.Add(' exists(select first 1 m.Wh_Id from MATERIALS_REMAIN m where m.Wh_Id = :WH)');
        SQL.Add(' or (exists(select first 1 m.Wh_Id from MATERIAL_DOCS m where m.Wh_Id = :WH))');
        SQL.Add(' or (exists(select first 1 m.Wh_Id from MATERIAL_DOCS m where m.From_Wh = :WH))');
        SQL.Add(' or (exists(select first 1 m.Wh_Id from REQUEST_MATERIALS m where m.Wh_Id = :WH))');
        SQL.Add(' or (exists(select first 1 m.Wh_Id from REQUEST_MATERIALS_RETURN m where m.Wh_Id = :WH))');
        ParamByName('WH').AsInteger := srcDataSource.DataSet['O_ID'];
        Transaction.StartTransaction;
        ExecQuery;
        if not FN('CNT').IsNull then
          i := FN('CNT').AsInteger;
        Close;
        Transaction.Commit;
      end
    except
      i := 1
    end;
  end;

  s := srcDataSource.DataSet['O_NAME'];

  if (i > 0) then
  begin
    if (srcDataSource.DataSet['O_DELETED'] = 0) and
      (MessageDlg(Format(rsSetAsDeletedWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      srcDataSource.DataSet.Edit;
      srcDataSource.DataSet.FieldByName('O_DELETED').AsInteger := 1;
      srcDataSource.DataSet.Post;
    end
  end
  else
  begin
    if (MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
      srcDataSource.DataSet.Delete;
  end;
end;

procedure TWHform.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
  begin
    dsOwner.Open;
    StartEdit();
  end;
end;

procedure TWHform.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
  begin
    dsOwner.Open;
    StartEdit(True);
  end;
end;

procedure TWHform.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if dsRights.State in [dsEdit] then
    dsRights.Post;
  if dsWH.Active then
    dsWH.Close;
  if dsRights.Active then
    dsRights.Close;
  if dsOwner.Active then
    dsOwner.Close;
  WHform := nil;
end;

procedure TWHform.FormShow(Sender: TObject);
begin
  inherited;

  fCanEdit := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Warehouses);
  // может редактировать если разрешено редактировать все
  fCanCreate := fCanEdit;

  // права пользователей
  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;
  srcRights.AutoEdit := fCanEdit;
  dbgRights.ReadOnly := not fCanEdit;
  dsWH.Open;
  dsRights.Open;
end;

procedure TWHform.srcDataSourceStateChange(Sender: TObject);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  dsRights.CloseOpen(True);
end;

procedure TWHform.btnCancelLinkClick(Sender: TObject);
begin
  inherited;
  dsOwner.Close;
end;

procedure TWHform.btnSaveLinkClick(Sender: TObject);
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
  dsOwner.Close;
end;

procedure TWHform.dbgRightsExit(Sender: TObject);
begin
  inherited;
  if dsRights.State in [dsEdit] then
  begin
    if not dsWH.FieldByName('O_ID').IsNull then
    begin
      dsRights['WH_ID'] := dsWH['O_ID'];
      dsRights.Post;
    end
    else
      dsRights.Cancel;
  end;
end;

procedure TWHform.dsRightsBeforePost(DataSet: TDataSet);
begin
  inherited;
  dsRights['WH_ID'] := dsWH['O_ID'];
end;

end.
