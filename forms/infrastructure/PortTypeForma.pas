﻿unit PortTypeForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  VclTee.TeCanvas, GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  CnErrorProvider, DBCtrlsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase;

type
  TPortTypeForm = class(TGridForm)
    dsType: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl3: TLabel;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    actAddL: TAction;
    actEditL: TAction;
    actDelL: TAction;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    spl1: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
  private
    procedure StartEdit(const New: Boolean = False); overload;
  public
    { Public declarations }
  end;

var
  PortTypeForm: TPortTypeForm;

implementation

uses
  DM, MAIN;

{$R *.dfm}

procedure TPortTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsType.Close;
  PortTypeForm := nil;
end;

procedure TPortTypeForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit(True);
end;

procedure TPortTypeForm.btnSaveLinkClick(Sender: TObject);
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
  begin
    inherited;
  end;
end;

procedure TPortTypeForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;
  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
end;

procedure TPortTypeForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit();
end;

procedure TPortTypeForm.FormShow(Sender: TObject);
var
  vFull: Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Dictionary_Nodes);
  fCanEdit := vFull;
  fCanCreate := fCanEdit;
  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  dsType.Open;
  dbGrid.DefaultApplySorting;
  dsType.First;
end;

procedure TPortTypeForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TPortTypeForm.StartEdit(const New: Boolean = False);
begin
  inherited;
end;

end.
