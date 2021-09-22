unit ShippersForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, ActnList, DB, ComCtrls, ToolWin, Grids, DBGridEh,
  FIBDataSet, pFIBDataSet, GridsEh, Menus, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, PrjConst, CnErrorProvider, Vcl.DBCtrls,
  Vcl.Mask, DBCtrlsEh, EhLibVCL, System.UITypes, DBGridEhGrouping, DynVarsEh;

type
  TShippersForm = class(TGridForm)
    dsShippers: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl3: TLabel;
    lbl1: TLabel;
    mmoAdres: TDBMemoEh;
    mmoNotice: TDBMemoEh;
    lbl4: TLabel;
    edtO_NAME: TDBEditEh;
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
  ShippersForm: TShippersForm;

implementation

uses DM;

{$R *.dfm}

procedure TShippersForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsShippers.Close;
  ShippersForm := nil;
end;

procedure TShippersForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then StartEdit(True);
end;

procedure TShippersForm.btnSaveLinkClick(Sender: TObject);
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

  if not errors
  then inherited;
end;

procedure TShippersForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then Exit;
  if fCanEdit
  then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo],
      0) = mrYes)
    then srcDataSource.DataSet.Delete;
end;

procedure TShippersForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then StartEdit();
end;

procedure TShippersForm.FormShow(Sender: TObject);
begin
  inherited;
  fCanEdit   := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Shippers);
  fCanCreate := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Shippers);

  // права пользователей
  actNew.Visible    := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible   := fCanEdit;

  dsShippers.Open;
end;

procedure TShippersForm.srcDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  actEdit.Enabled   :=  ((sender as TDataSource).DataSet.RecordCount>0) and fCanEdit;
  actDelete.Enabled :=  ((sender as TDataSource).DataSet.RecordCount>0) and fCanEdit;
end;

end.
