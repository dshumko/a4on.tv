unit BanksForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, ActnList, DB, ComCtrls, ToolWin, Grids, DBGridEh,
  FIBDataSet, pFIBDataSet, GridsEh, Menus, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, CnErrorProvider, PrjConst, EhLibVCL, System.UITypes,
  DBGridEhGrouping, DynVarsEh, DBCtrlsEh, Vcl.Mask;

type
  TBanksForm = class(TGridForm)
    dsBanks: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl1: TLabel;
    edtBIK: TDBEditEh;
    lbl6: TLabel;
    mmoAddress: TDBMemoEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BanksForm: TBanksForm;

implementation

uses DM;

{$R *.dfm}

procedure TBanksForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsBanks.Close;
  BanksForm := nil;
end;

procedure TBanksForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Banks))) then exit;

  StartEdit(True);
end;

procedure TBanksForm.btnSaveLinkClick(Sender: TObject);
var
  errors : Boolean;
begin
  errors := False;
  if (edtName.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(edtName);

  if (edtBIK.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtBIK, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(edtBIK);

  if not errors
  then inherited;
end;

procedure TBanksForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Banks))) then exit;
  if (MessageDlg(format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then srcDataSource.DataSet.Delete;
end;

procedure TBanksForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Banks))) then exit;

  StartEdit();
end;

procedure TBanksForm.srcDataSourceStateChange(Sender: TObject);
begin
  inherited;

  tbOk.Enabled := not ((sender as TDataSource).DataSet.State = dsBrowse);
  tbCancel.Enabled := tbOk.Enabled;
  btnNew.Enabled := not tbOk.Enabled;
  btnEdit.Enabled := not tbOk.Enabled;
  btnDelete.Enabled := not tbOk.Enabled;
end;

procedure TBanksForm.FormShow(Sender: TObject);
begin
  inherited;

  dsBanks.Open;
  // права пользователей
  FCanEdit   := ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Banks)));
  actNew.Visible       := FCanEdit;
  actDelete.Visible    := FCanEdit;
  actEdit.Visible      := FCanEdit;
end;

procedure TBanksForm.srcDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  actEdit.Enabled   :=  ((sender as TDataSource).DataSet.RecordCount>0) and FCanEdit;
  actDelete.Enabled :=  ((sender as TDataSource).DataSet.RecordCount>0) and FCanEdit;
end;

end.
