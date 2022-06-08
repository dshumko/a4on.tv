unit BonusesForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, CnErrorProvider,
  DBCtrlsEh, EhLibVCL, DBLookupEh, DBGridEhGrouping, DynVarsEh;

type
  TBonusesForm = class(TGridForm)
    dsBonuses: TpFIBDataSet;
    lbl2: TLabel;
    lbl1: TLabel;
    lbl3: TLabel;
    deFrom: TDBDateTimeEditEh;
    deTO: TDBDateTimeEditEh;
    edtFrom: TDBNumberEditEh;
    edtTO: TDBNumberEditEh;
    edtRate: TDBNumberEditEh;
    dsBT: TpFIBDataSet;
    edtName: TDBLookupComboboxEh;
    srcBT: TDataSource;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    mmoNOTICE: TDBMemoEh;
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
  BonusesForm: TBonusesForm;

implementation

uses
  DM;

{$R *.dfm}

procedure TBonusesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  srcDataSource.DataSet.Close;
  dsBT.Close;
  BonusesForm := nil;
end;

procedure TBonusesForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then StartEdit(True);
end;

procedure TBonusesForm.btnSaveLinkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := False;
  if (edtName.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(edtName);

  if (deFrom.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(deFrom, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(deFrom);

  if (edtFrom.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtFrom, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(edtFrom);

  if (edtRate.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtRate, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(edtRate);

  if not errors
  then inherited;
end;

procedure TBonusesForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0
  then Exit;
  if fCanEdit
  then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo],
      0) = mrYes)
    then srcDataSource.DataSet.Delete;
end;

procedure TBonusesForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then StartEdit();
end;

procedure TBonusesForm.FormShow(Sender: TObject);
begin
  inherited;
  fCanEdit := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Bonuses);
  // может редактировать если разрешено редактировать все
  fCanCreate := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Bonuses);

  // права пользователей
  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  srcDataSource.DataSet.Open;
  dsBT.Open;
end;

procedure TBonusesForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

end.
