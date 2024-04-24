unit DeviceTypesForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, CnErrorProvider,
  DBCtrlsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, amSplitter;

type
  TDeviceTypesForm = class(TGridForm)
    dsTypes: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl3: TLabel;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    lbl1: TLabel;
    edtO_NAME: TDBEditEh;
    pnlBottom: TPanel;
    dbgLayout: TDBGridEh;
    dsDevices: TpFIBDataSet;
    srcDevices: TDataSource;
    spl1: TSplitter;
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
  DeviceTypesForm: TDeviceTypesForm;

implementation

uses
  DM, MAIN;

{$R *.dfm}

procedure TDeviceTypesForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dsDevices.Close;
  dsTypes.Close;
  DeviceTypesForm := nil;
end;

procedure TDeviceTypesForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then StartEdit(True);
end;

procedure TDeviceTypesForm.btnSaveLinkClick(Sender: TObject);
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

procedure TDeviceTypesForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then Exit;
  if fCanEdit
  then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo],
      0) = mrYes)
    then srcDataSource.DataSet.Delete;
end;

procedure TDeviceTypesForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit
  then StartEdit();
end;

procedure TDeviceTypesForm.FormShow(Sender: TObject);
var
  vFull : Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Dictionary_full);
  fCanEdit   := dmMain.AllowedAction(rght_Comm_Equipment) or vFull;
  fCanCreate := fCanEdit;
  actNew.Visible    := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible   := fCanEdit;

  dsTypes.Open;
  dbGrid.DefaultApplySorting;
  dsTypes.First;

  dsDevices.Open;
end;

procedure TDeviceTypesForm.srcDataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  actEdit.Enabled   :=  ((sender as TDataSource).DataSet.RecordCount>0) and fCanEdit;
  actDelete.Enabled :=  ((sender as TDataSource).DataSet.RecordCount>0) and fCanEdit;
end;

end.
