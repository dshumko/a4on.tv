unit NewsForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridForma, ActnList, DB, ComCtrls, ToolWin, Grids, DBGridEh,
  FIBDataSet, pFIBDataSet, GridsEh, Menus, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, System.Actions, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, CnErrorProvider, Vcl.DBCtrls, Vcl.Mask, DBCtrlsEh, PrjConst,
  EhLibVCL, System.UITypes, DBGridEhGrouping, DynVarsEh;

type
  TNewsForm = class(TGridForm)
    dsNews: TpFIBDataSet;
    Label1: TLabel;
    Label2: TLabel;
    dbeName: TDBEditEh;
    mmoText: TDBMemoEh;
    lbl1: TLabel;
    edtURL: TDBEditEh;
    edStart: TDBDateTimeEditEh;
    edEND: TDBDateTimeEditEh;
    lbl2: TLabel;
    lbl3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure tbOkClick(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure dbeNameEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NewsForm: TNewsForm;

implementation

uses DM;

{$R *.dfm}

procedure TNewsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsNews.Close;
  NewsForm := nil;
end;

procedure TNewsForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_MANUFACTURERS))) then exit;
  StartEdit(True);
end;

procedure TNewsForm.btnSaveLinkClick(Sender: TObject);
var
  errors : Boolean;
begin
  errors := False;
  if (dbeName.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(dbeName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(dbeName);

  if (mmoText.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(mmoText, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(mmoText);

  if not errors
  then inherited;

end;

procedure TNewsForm.dbeNameEnter(Sender: TObject);
begin
  inherited;
  CnErrors.Dispose(dbeName);
end;

procedure TNewsForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Mobile_full) or dmMain.AllowedAction(rght_Mobile_news))) then exit;
  if (MessageDlg(format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then srcDataSource.DataSet.Delete;
end;

procedure TNewsForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Mobile_full) or dmMain.AllowedAction(rght_Mobile_news))) then exit;
    StartEdit();
end;

procedure TNewsForm.tbOkClick(Sender: TObject);
begin
  inherited;
  if (dmMain.AllowedAction(rght_Mobile_full) or dmMain.AllowedAction(rght_Mobile_news))
  then srcDataSource.DataSet.Post
  else srcDataSource.DataSet.Cancel;
end;

procedure TNewsForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Cancel;
end;

procedure TNewsForm.srcDataSourceStateChange(Sender: TObject);
begin
  inherited;

  tbOk.Enabled := not ((sender as TDataSource).DataSet.State = dsBrowse);
  tbCancel.Enabled := tbOk.Enabled;
  btnNew.Enabled := not tbOk.Enabled;
  btnEdit.Enabled := not tbOk.Enabled;
  btnDelete.Enabled := not tbOk.Enabled;
end;

procedure TNewsForm.FormCreate(Sender: TObject);
begin
  fCanEdit   := dmMain.AllowedAction(rght_Mobile_full) or dmMain.AllowedAction(rght_Mobile_news);
  fCanCreate := dmMain.AllowedAction(rght_Mobile_full) or dmMain.AllowedAction(rght_Mobile_news);
  inherited;
  // права пользователей
  actNew.Visible    := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible   := fCanEdit;
end;

procedure TNewsForm.FormShow(Sender: TObject);
begin
  inherited;
  dsNews.Open;
end;

procedure TNewsForm.srcDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  actEdit.Enabled   :=  ((sender as TDataSource).DataSet.RecordCount>0) and actNew.Enabled;
  actDelete.Enabled :=  ((sender as TDataSource).DataSet.RecordCount>0) and actNew.Enabled;
end;

end.
