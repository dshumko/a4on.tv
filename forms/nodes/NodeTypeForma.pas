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
  PrnDbgeh;

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
    btnCopy: TSpeedButton;
    actCopy: TAction;
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
    procedure FormCreate(Sender: TObject);
    procedure srcLayoutDataChange(Sender: TObject; Field: TField);
    procedure actCopyExecute(Sender: TObject);
  private
    fNodeLayout: Boolean;
    procedure StartEdit(const New: Boolean = False); overload;
    procedure UpdateButtom;
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
  dsLayout.Close;
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
  NL_ID: Integer;
begin
  inherited;
  if not fCanEdit then
    Exit;
  if ((srcDataSource.DataSet.RecordCount = 0) or (srcDataSource.DataSet.FieldByName('O_ID').IsNull)) then
    Exit;

  NL_ID := -1;
  if EditLayoute(-1 * srcDataSource.DataSet['O_ID'], NL_ID) then
  begin
    dsLayout.CloseOpen(True);
    dsLayout.Locate('LT_ID', NL_ID, []);
  end
end;

procedure TNodeTypeForm.actEditLExecute(Sender: TObject);
var
  NL_ID: Integer;
begin
  inherited;
  if not fCanEdit then
    Exit;
  if ((srcDataSource.DataSet.RecordCount = 0) or (srcDataSource.DataSet.FieldByName('O_ID').IsNull)) then
    Exit;

  if (not dsLayout.FieldByName('LT_ID').IsNull) then
    NL_ID := dsLayout['LT_ID']
  else
    NL_ID := -1;

  if EditLayoute(-1 * srcDataSource.DataSet['O_ID'], NL_ID) then
  begin
    dsLayout.CloseOpen(True);
    dsLayout.Locate('LT_ID', NL_ID, []);
  end
end;

procedure TNodeTypeForm.actCopyExecute(Sender: TObject);
var
  old_n: string;
begin
  inherited;
  if not fCanEdit then
    Exit;
  if ((srcDataSource.DataSet.RecordCount = 0) or (srcDataSource.DataSet.FieldByName('O_ID').IsNull)) then
    Exit;

  if (dsLayout.RecordCount > 0) then
  begin
    if Application.MessageBox('Компановка будет очищена и скопирована с другого типа. ' + #13#10 + 'Продолжить?',
      'Скопировать компановку', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
    begin
      Exit;
    end;
  end;

  old_n := InputBox('Укажите Тип с которого скопировать', 'Компановка как у Типа', '');
  if (old_n <> '') then
  begin
    with TpFIBQuery.Create(self) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text := 'execute block as begin';
        SQL.Add('delete from Node_Layout where Node_Id = -' + srcDataSource.DataSet.FieldByName('O_ID').AsString + ';');
        SQL.Add('insert into Node_Layout (Node_Id, Notice, Srv_Type, Mat_Qnt, Cust_Qnt, Mat_Id_List, Mat_Req)');
        SQL.Add('select -' + srcDataSource.DataSet.FieldByName('O_ID').AsString);
        SQL.Add(', Notice, Srv_Type, Mat_Qnt, Cust_Qnt, Mat_Id_List, Mat_Req ');
        SQL.Add('from Node_Layout where Node_Id in (');
        SQL.Add(' select -1*O_ID from OBJECTS where O_TYPE = 38 and upper(O_NAME) = upper(''' + old_n + '''));');
        SQL.Add('end');
        // ShowMessage(SQL.Text);
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
      finally
        free;
      end;
    end;
    dsLayout.CloseOpen(True);
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

procedure TNodeTypeForm.actDelLExecute(Sender: TObject);
var
  s: string;
begin
  inherited;
  if not fCanEdit then
    Exit;

  if ((not dsLayout.Active) or (dsLayout.RecordCount = 0)) then
    Exit;

  if dsLayout.State in [dsInsert, dsEdit] then
    dsLayout.Cancel
  else
  begin
    if (not dsLayout.FieldByName('MAT_LIST').IsNull) then
      s := dsLayout['MAT_LIST']
    else
      s := '';

    if (MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then
      dsLayout.Delete;
  end;
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

  UpdateButtom;
end;

procedure TNodeTypeForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEdit.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
  actDelete.Enabled := ((Sender as TDataSource).DataSet.RecordCount > 0) and fCanEdit;
end;

procedure TNodeTypeForm.srcLayoutDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  actEditL.Enabled := (dsLayout.RecordCount > 0) and fCanEdit;
  actDelL.Enabled := (dsLayout.RecordCount > 0) and fCanEdit;
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
  if not fNodeLayout then
  begin
    if pnlBottom.Visible then
      pnlBottom.Visible := False;
    Exit;
  end;

  if not dsLayout.Active then
    dsLayout.Open;

end;

end.
