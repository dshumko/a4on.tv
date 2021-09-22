unit OrganForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, ActnList, DB, ComCtrls, ToolWin, Grids, DBGridEh,
  FIBDataSet, pFIBDataSet, GridsEh, Menus, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, PrjConst, CnErrorProvider, EhLibVCL, System.UITypes,
  DBGridEhGrouping, DynVarsEh;

type
  TOrganForm = class(TGridForm)
    dsOrgan: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure tbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrganForm: TOrganForm;

implementation

uses DM, MAIN, OrgnzEditForma;

{$R *.dfm}

procedure TOrganForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsOrgan.Close;
  dbGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'CustGrid', true);
  OrganForm:=nil;
end;

procedure TOrganForm.srcDataSourceStateChange(Sender: TObject);
begin
  inherited;
  tbOk.Enabled := not ((sender as TDataSource).DataSet.State = dsBrowse);
  tbCancel.Enabled := tbOk.Enabled;
  btnNew.Enabled := not tbOk.Enabled;
  btnEdit.Enabled := not tbOk.Enabled;
  btnDelete.Enabled := not tbOk.Enabled;
end;

procedure TOrganForm.actEditExecute(Sender: TObject);
var
  Org_id : Integer;
begin
  inherited;
  if srcDataSource.DataSet.FieldByName('ORG_ID').IsNull then Exit;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_CONTRACTORS))) then exit;
  Org_id := dsOrgan['ORG_ID'];
  if  EditOrganization(Org_id)
  then begin
    srcDataSource.DataSet.Refresh;
  end;
end;

procedure TOrganForm.actNewExecute(Sender: TObject);
var
  Org_id : Integer;
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_CONTRACTORS))) then exit;
  Org_id := -1;
  if  EditOrganization(Org_id)
  then begin
    srcDataSource.DataSet.Close;
    srcDataSource.DataSet.Open;
  end;
end;

procedure TOrganForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.FieldByName('ORG_ID').IsNull then Exit;

  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_CONTRACTORS))) then exit;

  if (MessageDlg(Format( rsDeleteWithName, [srcDataSource.DataSet['ORG_NAME']] ), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then srcDataSource.DataSet.Delete;
end;

procedure TOrganForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Cancel;
end;

procedure TOrganForm.tbOkClick(Sender: TObject);
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_CONTRACTORS)))
  then dbGrid.DataSource.DataSet.Post
  else dbGrid.DataSource.DataSet.Cancel;
end;

procedure TOrganForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsOrgan.Open;
  // права пользователей
  actNew.Visible       := ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_CONTRACTORS)));
  actDelete.Visible    := actNew.Visible;
  actEdit.Visible      := actNew.Visible;
  tbOk.Visible         := actNew.Visible;
  tbCancel.Visible     := actNew.Visible;
  dbGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,       'Organizations',          [crpColIndexEh,crpColWidthsEh,crpColVisibleEh,crpSortMarkerEh]);
end;

procedure TOrganForm.srcDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  actEdit.Enabled   :=  ((sender as TDataSource).DataSet.RecordCount>0) and actNew.Enabled;
  actDelete.Enabled :=  ((sender as TDataSource).DataSet.RecordCount>0) and actNew.Enabled;
end;

end.
