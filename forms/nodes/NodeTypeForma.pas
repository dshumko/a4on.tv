unit NodeTypeForma;

interface

uses
  WinAPI.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  VCL.Graphics, VCL.Controls, VCL.Forms, Vcl.Dialogs, Vcl.ActnList, Data.DB, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.Grids, Vcl.Menus, System.Actions, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, System.UITypes, VCLTee.TeCanvas,
  GridForma, DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, PrjConst, CnErrorProvider,
  DBCtrlsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase;

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
    pnlBottom: TPanel;
    dbgLayout: TDBGridEh;
    actAddL: TAction;
    actEditL: TAction;
    actDelL: TAction;
    pnlBottLeft: TPanel;
    btnAddL: TSpeedButton;
    btnEditL: TSpeedButton;
    btnDelL: TSpeedButton;
    srcLayout: TDataSource;
    dsLayout: TpFIBDataSet;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    lbl4: TLabel;
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
    procedure actAddLExecute(Sender: TObject);
    procedure actEditLExecute(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure actDelLExecute(Sender: TObject);
    procedure srcLayoutStateChange(Sender: TObject);
    procedure srcLayoutDataChange(Sender: TObject; Field: TField);
  private
    procedure StartEdit(const New: Boolean = False); overload;
    procedure UpdateButtom;
  public
    { Public declarations }
  end;

var
  NodeTypeForm: TNodeTypeForm;

implementation

uses DM, MAIN, A4onTypeUnit, NodeLayouteForma;

{$R *.dfm}

procedure TNodeTypeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsLayout.Close;
  dsFileType.Close;
  NodeTypeForm := nil;
end;

procedure TNodeTypeForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit(True);
end;

procedure TNodeTypeForm.btnCancelLinkClick(Sender: TObject);
begin
  inherited;
  pnlBottom.Enabled := True;
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
    pnlBottom.Enabled := True;
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

procedure TNodeTypeForm.actAddLExecute(Sender: TObject);
var
  NodeLayoutItem: TNodeLayoutItem;
begin
  inherited;
  if not fCanEdit then
    Exit;
  if ((srcDataSource.DataSet.RecordCount = 0) or (srcDataSource.DataSet.FieldByName('NODE_ID').IsNull)) then
    Exit;

  NodeLayoutItem.M_TYPE := -1;
  NodeLayoutItem.NODE_ID := srcDataSource.DataSet['NODE_ID'];
  if EditLayoute(NodeLayoutItem) then
  begin
    dsLayout.Insert;
    dsLayout['NODE_ID'] := NodeLayoutItem.NODE_ID;
    dsLayout['M_TYPE'] := NodeLayoutItem.M_TYPE;
    dsLayout['DEV_CNT'] := NodeLayoutItem.quant;
    dsLayout['O_NAME'] := NodeLayoutItem.Name;
    dsLayout['NOTICE'] := NodeLayoutItem.notice;
    dsLayout.Post;
  end
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

procedure TNodeTypeForm.actDelLExecute(Sender: TObject);
begin
  inherited;
  if not fCanEdit then
    Exit;

  if ((not dsLayout.Active) or (dsLayout.RecordCount = 0)) then
    Exit;

  if srcLayout.DataSet.State in [dsInsert, dsEdit] then
    srcLayout.DataSet.Cancel
  else
  begin
    if (not srcLayout.DataSet.FieldByName('O_NAME').IsNull) then
    begin
      if (MessageDlg(Format(rsDeleteWithName, [srcLayout.DataSet['O_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
      then
        srcLayout.DataSet.Delete;
    end;
  end;
end;

procedure TNodeTypeForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if fCanEdit then
    StartEdit();
end;

procedure TNodeTypeForm.actEditLExecute(Sender: TObject);
var
  NodeLayoutItem: TNodeLayoutItem;
begin
  inherited;
  if not fCanEdit then
    Exit;
  if ((srcDataSource.DataSet.RecordCount = 0) or (srcDataSource.DataSet.FieldByName('NODE_ID').IsNull)) then
    Exit;

  if (dsLayout.FieldByName('O_NAME').IsNull) or (dsLayout.FieldByName('M_TYPE').IsNull) then
    Exit;

  NodeLayoutItem.M_TYPE := dsLayout['M_TYPE'];
  NodeLayoutItem.quant := dsLayout['DEV_CNT'];
  NodeLayoutItem.NODE_ID := srcDataSource.DataSet['NODE_ID'];
  if (not dsLayout.FieldByNAme('NOTICE').IsNull) then
    NodeLayoutItem.notice := dsLayout['NOTICE'];
  if EditLayoute(NodeLayoutItem) then
  begin
    dsLayout.Edit;
    dsLayout['NODE_ID'] := NodeLayoutItem.NODE_ID;
    dsLayout['M_TYPE'] := NodeLayoutItem.M_TYPE;
    dsLayout['DEV_CNT'] := NodeLayoutItem.quant;
    dsLayout['NOTICE'] := NodeLayoutItem.notice;
    dsLayout.Post;
  end
end;

procedure TNodeTypeForm.FormShow(Sender: TObject);
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

  dsFileType.Open;
  dbGrid.DefaultApplySorting;
  dsFileType.First;
  dsLayout.Open;
  UpdateButtom;
end;

procedure TNodeTypeForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TNodeTypeForm.srcLayoutDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  UpdateButtom;
end;

procedure TNodeTypeForm.srcLayoutStateChange(Sender: TObject);
begin
  inherited;
  UpdateButtom;
end;

procedure TNodeTypeForm.StartEdit(const New: Boolean = False);
var
  Background: TColor;
begin
  pnlBottom.Enabled := False;
  btnColorSet.SymbolColor := clBtnFace;
  if not(New or dsFileType.FieldByName('O_DIMENSION').IsNull) then
    try
      Background := StringToColor(dsFileType.FieldByName('O_DIMENSION').Value);
      btnColorSet.SymbolColor := Background;
    except
    end;
  inherited;
end;

procedure TNodeTypeForm.UpdateButtom;
begin
  actEditL.Enabled := (dsLayout.RecordCount > 0) and fCanEdit;
  actDelL.Enabled := (dsLayout.RecordCount > 0) and fCanEdit;
end;

end.
