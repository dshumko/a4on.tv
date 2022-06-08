unit HETypesForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, CnErrorProvider, PrjConst,
  EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  THETypesForm = class(TGridForm)
    dsHETypes: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actNewExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure tbOkClick(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure srcDataSourceStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HETypesForm: THETypesForm;

implementation

uses
  DM;

{$R *.dfm}

procedure THETypesForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsHETypes.Close;
  HETypesForm := nil;
end;

procedure THETypesForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_HeadEnd))) then exit;
  srcDataSource.DataSet.Insert;
end;

procedure THETypesForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_HeadEnd))) then exit;
  if (MessageDlg(format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then srcDataSource.DataSet.Delete;
end;

procedure THETypesForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if (not (dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_HeadEnd))) then exit;
  srcDataSource.DataSet.Edit;
end;

procedure THETypesForm.tbOkClick(Sender: TObject);
begin
  inherited;
  if ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_HeadEnd)))
  then srcDataSource.DataSet.Post
  else srcDataSource.DataSet.Cancel;
end;

procedure THETypesForm.tbCancelClick(Sender: TObject);
begin
  inherited;
  srcDataSource.DataSet.Cancel;
end;

procedure THETypesForm.srcDataSourceStateChange(Sender: TObject);
begin
  inherited;

  tbOk.Enabled := not ((sender as TDataSource).DataSet.State = dsBrowse);
  tbCancel.Enabled := tbOk.Enabled;
  btnNew.Enabled := not tbOk.Enabled;
  btnEdit.Enabled := not tbOk.Enabled;
  btnDelete.Enabled := not tbOk.Enabled;
end;

procedure THETypesForm.FormCreate(Sender: TObject);
begin
  inherited;
  dsHETypes.Open;
  // права пользователей
  actNew.Visible       := ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_HeadEnd)));
  actDelete.Visible    := actNew.Visible;
  actEdit.Visible      := actNew.Visible;
  tbOk.Visible         := actNew.Visible;
  tbCancel.Visible     := actNew.Visible;
end;

procedure THETypesForm.srcDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  actEdit.Enabled   :=  ((sender as TDataSource).DataSet.RecordCount>0) and actNew.Enabled;
  actDelete.Enabled :=  ((sender as TDataSource).DataSet.RecordCount>0) and actNew.Enabled;
end;

end.
