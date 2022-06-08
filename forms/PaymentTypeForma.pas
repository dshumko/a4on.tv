unit PaymentTypeForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, EhLibFIB, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  CnErrorProvider, EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  TPaymentTypeForm = class(TGridForm)
    dsPaymentType: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure tbOkClick(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PaymentTypeForm: TPaymentTypeForm;

implementation

uses
  MAIN;

{$R *.dfm}

procedure TPaymentTypeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  PaymentTypeForm := nil;
end;

procedure TPaymentTypeForm.actNewExecute(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Insert;
end;

procedure TPaymentTypeForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (MessageDlg(rsDeletePayType, mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then srcDataSource.DataSet.Delete;
end;

procedure TPaymentTypeForm.actEditExecute(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Edit;
end;

procedure TPaymentTypeForm.tbOkClick(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Post;
end;

procedure TPaymentTypeForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Cancel;
end;

procedure TPaymentTypeForm.srcDataSourceStateChange(Sender: TObject);
begin
  inherited;

  tbOk.Enabled := not ((sender as TDataSource).DataSet.State = dsBrowse);
  tbCancel.Enabled := tbOk.Enabled;
  btnNew.Enabled := not tbOk.Enabled;
  btnEdit.Enabled := not tbOk.Enabled;
  btnDelete.Enabled := not tbOk.Enabled;
end;

procedure TPaymentTypeForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsPaymentType.Open;
end;

end.
