unit EquipmentComands;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, ActnList, DB, ComCtrls, ToolWin, GridsEh, DBGridEh,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, Menus, StdCtrls,
  DBCtrls, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh,
  System.Actions, Vcl.Buttons, Vcl.ExtCtrls, PrjConst,
  CnErrorProvider, System.UITypes, EhLibVCL, DBGridEhGrouping, DynVarsEh,
  Vcl.Mask, DBCtrlsEh;

type
  TEquipmentCommandsForm = class(TGridForm)
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    dsCGR: TpFIBDataSet;
    dbmCMD: TDBMemoEh;
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure tbOkClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EquipmentCommandsForm: TEquipmentCommandsForm;

implementation

uses
  DM, EquipmentCommandForma;

{$R *.dfm}

procedure TEquipmentCommandsForm.actDeleteExecute(Sender: TObject);
begin
  inherited;

  if srcDataSource.DataSet.FieldByName('NAME').IsNull then Exit;

  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then exit;

  if (MessageDlg(Format( rsDeleteWithName, [srcDataSource.DataSet['NAME']] ), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then srcDataSource.DataSet.Delete;
end;

procedure TEquipmentCommandsForm.actEditExecute(Sender: TObject);
var
  bm : TBookmark;
begin
  inherited;
  if srcDataSource.DataSet.FieldByName('EC_ID').IsNull then Exit;

  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then exit;

  if EditGroupCommand(dsCGR['EC_ID'])
  then begin
    bm := dsCGR.GetBookmark;
    dsCGR.CloseOpen(true);
    dsCGR.GotoBookmark(bm);
  end;
end;

procedure TEquipmentCommandsForm.actNewExecute(Sender: TObject);
var
  bm : TBookmark;
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment))) then exit;

  if EditGroupCommand(-1)
  then begin
    bm := dsCGR.GetBookmark;
    dsCGR.CloseOpen(true);
    dsCGR.GotoBookmark(bm);
  end;
end;

procedure TEquipmentCommandsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  EquipmentCommandsForm := nil;
end;

procedure TEquipmentCommandsForm.FormShow(Sender: TObject);
begin
  inherited;
  dsCGR.Open;
  // права пользователей
  actNew.Visible       := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment));
  actDelete.Visible    := actNew.Visible;
  actEdit.Visible      := actNew.Visible;
  tbOk.Visible         := actNew.Visible;
  tbCancel.Visible     := actNew.Visible;
end;

procedure TEquipmentCommandsForm.srcDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  actEdit.Enabled   :=  ((sender as TDataSource).DataSet.RecordCount>0) and actNew.Enabled;
  actDelete.Enabled :=  ((sender as TDataSource).DataSet.RecordCount>0) and actNew.Enabled;
end;

procedure TEquipmentCommandsForm.srcDataSourceStateChange(Sender: TObject);
begin
  inherited;
  tbOk.Enabled := not ((sender as TDataSource).DataSet.State = dsBrowse);
  tbCancel.Enabled := tbOk.Enabled;
  actNew.Enabled := not tbOk.Enabled;
  actEdit.Enabled := not tbOk.Enabled;
  actDelete.Enabled := not tbOk.Enabled;
end;

procedure TEquipmentCommandsForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  dsCGR.Cancel;
end;

procedure TEquipmentCommandsForm.tbOkClick(Sender: TObject);
begin
  inherited;
  dsCGR.Post;
end;

end.
