unit NodeLayoutFactForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes, System.Types,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  OkCancel_frame, FIBDataSet, pFIBDataSet, DBGridEh, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery, PrjConst,
  A4onTypeUnit,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  MemTableDataEh, Vcl.Buttons, MemTableEh, EhLibVCL, GridsEh, DBAxisGridsEh,
  System.Actions, Vcl.ActnList, PropFilerEh, PropStorageEh;

type

  TNodeLayoutFactForm = class(TForm)
    CnErrors: TCnErrorProvider;
    mtLayout: TMemTableEh;
    srcLayout: TDataSource;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    dsLayout: TpFIBDataSet;
    dbgCustAttr: TDBGridEh;
    PropStorage: TPropStorageEh;
    procedure OkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure dbgCustAttrColumns2GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgCustAttrColumns6GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure FormShow(Sender: TObject);
  private
    FNode_ID: Integer;
    procedure SetNodeId(value: Integer);
    procedure SaveLayoutInDB;
    procedure LoadLayoutFromDB;
  public
    property Node_ID: Integer read FNode_ID write SetNodeId;
  end;

function EditLayouteFact(const aNODE_ID: Integer): Boolean;

implementation

uses
  DM, SelectOneMatForma, pFIBQuery, AtrStrUtils, MAIN;

{$R *.dfm}

function EditLayouteFact(const aNODE_ID: Integer): Boolean;
begin
  with TNodeLayoutFactForm.Create(Application) do
  begin
    try
      Node_ID := aNODE_ID;
      result := (ShowModal = mrOk);
    finally
      free
    end;
  end;
end;

procedure TNodeLayoutFactForm.btnOkClick(Sender: TObject);
begin
  OkClick(Sender);
end;

procedure TNodeLayoutFactForm.dbgCustAttrColumns2GetCellParams(Sender: TObject; EditMode: Boolean;
  Params: TColCellParamsEh);
var
  cp, cf: Integer;
begin
  if EditMode or (mtLayout.RecordCount = 0) then
    Exit;

  cp := 0;
  cf := 0;

  if (not mtLayout.FieldByName('CUST_QNT').IsNull) then
    cp := mtLayout['CUST_QNT'];
  if (not mtLayout.FieldByName('CUST_QNT_FACT').IsNull) then
    cf := mtLayout['CUST_QNT_FACT'];

  if (cf = cp) then
    Params.Background := $00B4FEB4;
end;

procedure TNodeLayoutFactForm.dbgCustAttrColumns6GetCellParams(Sender: TObject; EditMode: Boolean;
  Params: TColCellParamsEh);
var
  cp, cf: Integer;
  mp, mf: Double;
begin
  if EditMode then
    Exit;

  cp := 0;
  cf := 0;
  mp := 0;
  mf := 0;

  if (not mtLayout.FieldByName('CUST_QNT').IsNull) then
    cp := mtLayout['CUST_QNT'];
  if (not mtLayout.FieldByName('MAT_QNT').IsNull) then
    mp := mtLayout['MAT_QNT'];
  if (not mtLayout.FieldByName('CUST_QNT_FACT').IsNull) then
    cf := mtLayout['CUST_QNT_FACT'];
  if (not mtLayout.FieldByName('MAT_QNT_FACT').IsNull) then
    mf := mtLayout['MAT_QNT_FACT'];

  if ((cf = cp) and (mf <> mp)) or ((cf <> cp) and (mf <> 0)) then
    Params.Background := clYellow;

end;

procedure TNodeLayoutFactForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if mtLayout.Active then
    mtLayout.Close;
end;

procedure TNodeLayoutFactForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkClick(Sender);
end;

procedure TNodeLayoutFactForm.FormShow(Sender: TObject);
var
  i: Integer;
  Font_size: Integer;
  Font_name: string;
  Row_height: Integer;
begin
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;
  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;

  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      (Components[i] as TDBGridEh).RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
      if Font_size <> 0 then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
      if Row_height <> 0 then
      begin
        (Components[i] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[i] as TDBGridEh).RowHeight := Row_height;
      end;
    end
    else if Font_size <> 0 then
    begin
      if (Components[i] is TMemo) then
      begin
        (Components[i] as TMemo).Font.Name := Font_name;
        (Components[i] as TMemo).Font.Size := Font_size;
      end;
    end;
  end;
end;

procedure TNodeLayoutFactForm.OkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := false;
  if (mtLayout.State = dsEdit) then
    mtLayout.Post;

  errors := (Application.MessageBox('Обновить материалы узла?', 'Обновить материалы',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO);

  {
    if (VarIsNull(lcbSrvType.value)) then
    begin
    errors := true;
    CnErrors.SetError(lcbSrvType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    end
    else
    CnErrors.Dispose(lcbSrvType);
  }
  if not errors then
  begin
    SaveLayoutInDB;
    ModalResult := mrOk;
  end
  else
    ModalResult := mrNone;
end;

procedure TNodeLayoutFactForm.SetNodeId(value: Integer);
begin
  FNode_ID := value;
  LoadLayoutFromDB;
end;

procedure TNodeLayoutFactForm.SaveLayoutInDB;
var
  vMatList: string;
  i: Integer;
  o, n: Double;
begin
  vMatList := '';
  mtLayout.First;
  while not mtLayout.Eof do
  begin
    if (not mtLayout.FieldByName('MAT_ID').IsNull) then
    begin
      i := mtLayout.FieldByName('MAT_ID').AsInteger;
      o := 0;
      n := 0;

      if (not mtLayout.FieldByName('Mat_Qnt_Save').IsNull) then
        o := mtLayout.FieldByName('Mat_Qnt_Save').AsFloat;
      if (not mtLayout.FieldByName('Mat_Qnt_Fact').IsNull) then
        n := mtLayout.FieldByName('Mat_Qnt_Fact').AsFloat;

      if (n <> o) then
        vMatList := vMatList + '{"i":' + i.ToString + ',"o":' + o.ToString + ',"n":' + n.ToString + '};';
    end;
    mtLayout.Next;
  end;
  vMatList := vMatList.TrimRight([';']);
  if vMatList.IsEmpty then
    Exit;

  with TpFIBQuery.Create(self) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'execute procedure Ibe$Update_From_Layout(:Node_Id, :Mat_List)';

      ParamByName('Node_Id').AsInteger := FNode_ID;
      ParamByName('Mat_List').AsString := vMatList;

      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      free;
    end;
  end;
end;

procedure TNodeLayoutFactForm.LoadLayoutFromDB;
begin
  if not mtLayout.Active then
    mtLayout.Open
  else
    mtLayout.EmptyTable;

  if FNode_ID = -1 then
    Exit;

  dsLayout.ParamByName('NODE_ID').AsInteger := FNode_ID;
  dsLayout.Open;
  try
    mtLayout.LoadFromDataSet(dsLayout, 0, lmCopy, false);
  finally
    dsLayout.Close;
  end;
end;

end.
