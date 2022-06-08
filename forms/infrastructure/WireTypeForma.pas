unit WireTypeForma;

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
  TWireTypeForm = class(TGridForm)
    dsType: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl3: TLabel;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    btnColorSet: TButtonColor;
    btnColorClear: TButton;
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
    procedure btnColorSetClick(Sender: TObject);
    procedure btnColorClearClick(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    procedure StartEdit(const New: Boolean = False); overload;
  public
    { Public declarations }
  end;

var
  WireTypeForm: TWireTypeForm;

implementation

uses
  DM, MAIN;

{$R *.dfm}

procedure TWireTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsType.Close;
  WireTypeForm := nil;
end;

procedure TWireTypeForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit(True);
end;

procedure TWireTypeForm.btnColorClearClick(Sender: TObject);
begin
  inherited;
  btnColorSet.SymbolColor := clBtnFace;
  if not(srcDataSource.DataSet.State in [dsInsert, dsEdit]) then
    srcDataSource.DataSet.Edit;
  srcDataSource.DataSet.FieldByName('O_DIMENSION').Clear;
end;

procedure TWireTypeForm.btnColorSetClick(Sender: TObject);
begin
  inherited;
  if not(srcDataSource.State in [dsInsert, dsEdit]) then
    srcDataSource.DataSet.Edit;
  srcDataSource.DataSet['O_DIMENSION'] := ColorToString(btnColorSet.SymbolColor);
end;

procedure TWireTypeForm.btnSaveLinkClick(Sender: TObject);
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

procedure TWireTypeForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if not dsType.FieldByName('O_DIMENSION').IsNull then
    try
      Background := StringToColor(dsType.FieldByName('O_DIMENSION').Value);
    except
    end;
end;

procedure TWireTypeForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;
  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
end;

procedure TWireTypeForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit();
end;

procedure TWireTypeForm.FormShow(Sender: TObject);
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

procedure TWireTypeForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TWireTypeForm.StartEdit(const New: Boolean = False);
var
  Background: TColor;
begin
  btnColorSet.SymbolColor := clBtnFace;
  if not(New or dsType.FieldByName('O_DIMENSION').IsNull) then
    try
      Background := StringToColor(dsType.FieldByName('O_DIMENSION').Value);
      btnColorSet.SymbolColor := Background;
    except
    end;
  inherited;
end;

end.
