unit PaymentSourcesForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask,
  GridForma, ToolCtrlsEh, DBGridEhToolCtrls, FIBDataSet, pFIBDataSet, CnErrorProvider, GridsEh, DBAxisGridsEh, DBGridEh, PrjConst,
  DBCtrlsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, PrnDbgeh;

type
  TPaymentSourcesForm = class(TGridForm)
    dsPaymentSource: TpFIBDataSet;
    lbl2: TLabel;
    lbl3: TLabel;
    edtName: TDBEditEh;
    edtLEAK_PRC: TDBNumberEditEh;
    edtTAX_PRC: TDBNumberEditEh;
    edtCODE: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dsPaymentSourceNewRecord(DataSet: TDataSet);
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentSourcesForm: TPaymentSourcesForm;

implementation

uses
  DM;

{$R *.dfm}

procedure TPaymentSourcesForm.FormShow(Sender: TObject);
begin
  inherited;
  FCanEdit := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_PaySources));
  FCanCreate := (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_PaySources));

  dsPaymentSource.Open;
  // права пользователей
  actNew.Visible := FCanCreate;
  actDelete.Visible := FCanEdit;
  actEdit.Visible := FCanEdit;
end;

procedure TPaymentSourcesForm.dsPaymentSourceNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet['LEAK_PRC'] := 0;
  DataSet['TAX_PRC'] := 0;
end;

procedure TPaymentSourcesForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if FCanEdit
  then StartEdit(True);
end;

procedure TPaymentSourcesForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if FCanEdit
  then StartEdit(False);
end;

procedure TPaymentSourcesForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if FCanEdit
  then
    if (MessageDlg( Format(rsDeleteWithName, [srcDataSource.DataSet['PAYSOURCE_DESCR']]), mtConfirmation, [mbYes, mbNo],
      0) = mrYes)
    then
      srcDataSource.DataSet.Delete;
end;

procedure TPaymentSourcesForm.btnSaveLinkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := False;
  if (edtName.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtName);

  if (edtLEAK_PRC.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtLEAK_PRC, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtLEAK_PRC);

  if (edtTAX_PRC.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtTAX_PRC, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtTAX_PRC);

  if not errors
  then
    inherited;
end;

procedure TPaymentSourcesForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsPaymentSource.Close;
  PaymentSourcesForm := nil;
end;

procedure TPaymentSourcesForm.srcDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

end.
