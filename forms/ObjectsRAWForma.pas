unit ObjectsRAWForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, CnErrorProvider,
  DBCtrlsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, PrnDbgeh, FIBDatabase,
  pFIBDatabase, DBLookupEh;

type
  TObjectsRAWForm = class(TGridForm)
    dsObjects: TpFIBDataSet;
    edtName: TDBEditEh;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsObjType: TpFIBDataSet;
    srcObjType: TDataSource;
    lcbObjType: TDBLookupComboboxEh;
    edtO_Check: TDBEditEh;
    edtO_Charfield: TDBEditEh;
    ednO_Numericfield: TDBNumberEditEh;
    chkO_Deleted: TDBCheckBoxEh;
    edO_Datefield: TDBDateTimeEditEh;
    edtO_Charfield1: TDBEditEh;
    edO_Dateend: TDBDateTimeEditEh;
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
  ObjectsRAWForm: TObjectsRAWForm;

implementation

uses
  DM;

{$R *.dfm}

procedure TObjectsRAWForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dsObjType.Active then
    dsObjType.Close;

  dsObjects.Close;
  ObjectsRAWForm := nil;
end;

procedure TObjectsRAWForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if not fCanEdit
  then Exit;

  lcbObjType.Enabled := True;
  StartEdit(True);
end;

procedure TObjectsRAWForm.btnSaveLinkClick(Sender: TObject);
var
  errors : Boolean;
begin
  errors := False;

  CnErrors.Clear;
  if (edtName.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end;
  if (lcbObjType.Text = '')
  then begin
    errors := True;
    CnErrors.SetError(lcbObjType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end;

  if not errors
  then inherited;
end;

procedure TObjectsRAWForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then Exit;
  if fCanEdit
  then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo],
      0) = mrYes)
    then srcDataSource.DataSet.Delete;
end;

procedure TObjectsRAWForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if not fCanEdit
  then Exit;

  lcbObjType.Enabled := False;
  StartEdit();
end;

procedure TObjectsRAWForm.FormShow(Sender: TObject);
var
  vFull : Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Dictionary_full);
  fCanEdit   := vFull;
  fCanCreate := fCanEdit;
  actNew.Visible    := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible   := fCanEdit;

  dsObjType.Open;
  dsObjects.Open;
  dbGrid.DefaultApplySorting;
  dsObjects.First;

end;

procedure TObjectsRAWForm.srcDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  actEdit.Enabled   :=  ((sender as TDataSource).DataSet.RecordCount>0) and fCanEdit;
  actDelete.Enabled :=  ((sender as TDataSource).DataSet.RecordCount>0) and fCanEdit;
end;

end.
