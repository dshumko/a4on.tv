unit NodeTypeForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask,
  VclTee.TeCanvas, GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh,
  PrjConst,
  CnErrorProvider, DBCtrlsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, amSplitter,
  PrnDbgeh, CnClasses;

type
  TNodeTypeForm = class(TGridForm)
    dsFileType: TpFIBDataSet;
    lbl2: TLabel;
    edtName: TDBEditEh;
    lbl3: TLabel;
    dbmmoO_DESCRIPTION: TDBMemoEh;
    edtO_DIMENSION: TDBEditEh;
    lbl1: TLabel;
    btnColorSet: TButtonColor;
    btnColorClear: TButton;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
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
    procedure FormCreate(Sender: TObject);
  private
    fNodeLayout: Boolean;
    procedure StartEdit(const New: Boolean = False); overload;
    procedure UpdateBottom;
  public
    { Public declarations }
  end;

var
  NodeTypeForm: TNodeTypeForm;

implementation

uses
  DM, MAIN, A4onTypeUnit, NodeLayoutForma, pFIBQuery;

{$R *.dfm}

procedure TNodeTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsFileType.Close;
  NodeTypeForm := nil;
end;

procedure TNodeTypeForm.FormCreate(Sender: TObject);
begin
  inherited;
  fNodeLayout := (dmMain.GetSettingsValue('NODE_LAYOUT') = '1');
end;

procedure TNodeTypeForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit(True);
end;

procedure TNodeTypeForm.btnColorClearClick(Sender: TObject);
begin
  inherited;
  btnColorSet.SymbolColor := clBtnFace;
  if not(srcDataSource.DataSet.State in [dsInsert, dsEdit]) then
    srcDataSource.DataSet.Edit;
  srcDataSource.DataSet.FieldByName('O_DIMENSION').Clear;
end;

procedure TNodeTypeForm.btnColorSetClick(Sender: TObject);
begin
  inherited;
  if not(srcDataSource.State in [dsInsert, dsEdit]) then
    srcDataSource.DataSet.Edit;
  srcDataSource.DataSet['O_DIMENSION'] := ColorToString(btnColorSet.SymbolColor);
end;

procedure TNodeTypeForm.btnSaveLinkClick(Sender: TObject);
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

procedure TNodeTypeForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if not dsFileType.FieldByName('O_DIMENSION').IsNull then
    try
      Background := StringToColor(dsFileType.FieldByName('O_DIMENSION').Value);
    except
    end;
end;

procedure TNodeTypeForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;
  if fCanEdit then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      srcDataSource.DataSet.Delete;
end;

procedure TNodeTypeForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit();
end;

procedure TNodeTypeForm.FormShow(Sender: TObject);
var
  vFull: Boolean;
begin
  inherited;
  vFull := dmMain.AllowedAction(rght_Comm_Nodes) or dmMain.AllowedAction(rght_Dictionary_full);
  fCanEdit := vFull;
  fCanCreate := fCanEdit;
  actNew.Visible := fCanEdit;
  actDelete.Visible := fCanEdit;
  actEdit.Visible := fCanEdit;

  dsFileType.Open;
  dbGrid.DefaultApplySorting;
  dsFileType.First;

  UpdateBottom;
end;

procedure TNodeTypeForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TNodeTypeForm.StartEdit(const New: Boolean = False);
var
  Background: TColor;
begin
  btnColorSet.SymbolColor := clBtnFace;
  if not(New or dsFileType.FieldByName('O_DIMENSION').IsNull) then
    try
      Background := StringToColor(dsFileType.FieldByName('O_DIMENSION').Value);
      btnColorSet.SymbolColor := Background;
    except
    end;
  inherited;
end;

procedure TNodeTypeForm.UpdateBottom;
begin
end;

end.
