unit WHForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, FIBDataSet, pFIBDataSet, GridsEh, DBGridEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, CnErrorProvider, PrjConst,
  EhLibVCL, DBCtrlsEh, DBGridEhGrouping, DynVarsEh, DBLookupEh, PrnDbgeh;

type
  TWHform = class(TGridForm)
    dsWH: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl3: TLabel;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    dbgRights: TDBGridEh;
    dsRights: TpFIBDataSet;
    srcRights: TDataSource;
    lbl1: TLabel;
    cbbOwner: TDBLookupComboboxEh;
    lbl4: TLabel;
    srcOwner: TDataSource;
    dsOwner: TpFIBDataSet;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WHform: TWHform;

implementation

uses
  DM;

{$R *.dfm}

procedure TWHform.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;

  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
end;

procedure TWHform.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then begin
    dsOwner.Open;
    StartEdit();
  end;
end;

procedure TWHform.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then begin
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
  if (edtName.Text = '') then begin
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
  if dsRights.State in [dsEdit] then begin
    if not dsWH.FieldByName('O_ID').IsNull then begin
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
