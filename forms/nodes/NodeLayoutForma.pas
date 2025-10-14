unit NodeLayoutForma;

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
  System.Actions, Vcl.ActnList;

type

  TNodeLayoutForm = class(TForm)
    srcDevType: TDataSource;
    dsSrvType: TpFIBDataSet;
    lcbSrvType: TDBLookupComboboxEh;
    memNotice: TDBMemoEh;
    lblAttribute: TLabel;
    CnErrors: TCnErrorProvider;
    ednCount: TDBNumberEditEh;
    lbl1: TLabel;
    ednСustCnt: TDBNumberEditEh;
    lbl11: TLabel;
    dbgMat: TDBGridEh;
    mtMat: TMemTableEh;
    chkReq: TDBCheckBoxEh;
    srcMat: TDataSource;
    btnAdd: TBitBtn;
    btnDel: TBitBtn;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    chkCustUnlum: TDBCheckBoxEh;
    chkMatUnlum: TDBCheckBoxEh;
    actlst1: TActionList;
    actAdd: TAction;
    actDel: TAction;
    procedure OkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure chkCustUnlumClick(Sender: TObject);
    procedure chkMatUnlumClick(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
  private
    fNl_Id: Integer;
    fNode_ID: Integer;
    procedure SetNlId(value: Integer);
    procedure SaveLayoutInDB;
    procedure LoadLayoutFromDB;
  public
    property NL_ID: Integer read fNl_Id write SetNlId;
    property Node_ID: Integer read fNode_ID write fNode_ID;
  end;

function EditLayoute(const aNODE_ID: Integer; var aNL_ID: Integer): Boolean;

implementation

uses
  DM, SelectOneMatForma, pFIBQuery, AtrStrUtils, MAIN;

{$R *.dfm}

function EditLayoute(const aNODE_ID: Integer; var aNL_ID: Integer): Boolean;
begin
  with TNodeLayoutForm.Create(Application) do
  begin
    try
      NL_ID := aNL_ID;
      Node_ID := aNODE_ID;
      result := (ShowModal = mrOk);
    finally
      free
    end;
  end;
end;

procedure TNodeLayoutForm.actAddExecute(Sender: TObject);
var
  sm: TSelectedMaterial;
begin
  sm := SelectOneMaterial;
  if sm.id = -1 then
    Exit;

  if not mtMat.Active then
    mtMat.Open;

  if not mtMat.Locate('M_ID', sm.id, []) then
  begin
    mtMat.Append;
    mtMat['M_ID'] := sm.id;
    mtMat['M_NAME'] := sm.Name;
    mtMat.Post;
    mtMat.SortByFields('M_NAME');
  end;
end;

procedure TNodeLayoutForm.actDelExecute(Sender: TObject);
begin
  if not mtMat.Active then
    Exit;

  if mtMat.RecordCount = 0 then
    Exit;

  if Application.MessageBox(PChar(Format(rsDeleteRecord, [mtMat['M_NAME']])), PWideChar(rsDeleteInfoAbout),
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    mtMat.Delete;
  end;
end;

procedure TNodeLayoutForm.btnOkClick(Sender: TObject);
begin
  OkClick(Sender);
end;

procedure TNodeLayoutForm.chkCustUnlumClick(Sender: TObject);
begin
  ednСustCnt.Enabled := not chkCustUnlum.Checked;
end;

procedure TNodeLayoutForm.chkMatUnlumClick(Sender: TObject);
begin
  ednCount.Enabled := not chkMatUnlum.Checked;
end;

procedure TNodeLayoutForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if mtMat.Active then
    mtMat.Close;
  if dsSrvType.Active then
    dsSrvType.Close;
end;

procedure TNodeLayoutForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkClick(Sender);
end;

procedure TNodeLayoutForm.FormShow(Sender: TObject);
begin
  dsSrvType.Open;
  mtMat.Open;
end;

procedure TNodeLayoutForm.OkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := false;
  if (VarIsNull(lcbSrvType.value)) then
  begin
    errors := true;
    CnErrors.SetError(lcbSrvType, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(lcbSrvType);

  if (not chkMatUnlum.Checked) and ((ednCount.Text = '') or (ednCount.value < -1)) then
  begin
    errors := true;
    CnErrors.SetError(ednCount, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(ednCount);

  if (not chkCustUnlum.Checked) and ((ednСustCnt.Text = '') or (ednСustCnt.value < -1)) then
  begin
    errors := true;
    CnErrors.SetError(ednСustCnt, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(ednСustCnt);

  if (not mtMat.Active) or (mtMat.RecordCount = 0) then
  begin
    errors := true;
    CnErrors.SetError(dbgMat, rsEmptyFieldError, iaTopCenter, bsNeverBlink);
  end
  else
    CnErrors.Dispose(dbgMat);

  if not errors then
  begin
    SaveLayoutInDB;
    ModalResult := mrOk;
  end
  else
    ModalResult := mrNone;
end;

procedure TNodeLayoutForm.SetNlId(value: Integer);
begin
  fNl_Id := value;
  LoadLayoutFromDB;
end;

procedure TNodeLayoutForm.SaveLayoutInDB;
var
  vMatList: string;
begin
  vMatList := '';
  mtMat.First;
  while not mtMat.Eof do
  begin
    vMatList := vMatList + mtMat.FieldByName('M_ID').AsString + ',';
    mtMat.Next;
  end;
  vMatList := vMatList.Trim([',']);
  with TpFIBQuery.Create(self) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text :=
        'update or insert into Node_Layout (Lt_Id, Node_Id, Srv_Type, Mat_Qnt, Cust_Qnt, Mat_Id_List, Mat_Req, Notice)';
      SQL.Add('values (:Lt_Id, :Node_Id, :Srv_Type, :Mat_Qnt, :Cust_Qnt, :Mat_Id_List, :Mat_Req, :Notice)');
      SQL.Add('matching(Lt_Id)');
      if fNl_Id = -1 then
        fNl_Id := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);

      ParamByName('Lt_Id').AsInteger := fNl_Id;
      ParamByName('Node_Id').AsInteger := fNode_ID;
      ParamByName('Srv_Type').AsInteger := lcbSrvType.value;
      if (not chkCustUnlum.Checked) then
        ParamByName('Cust_Qnt').AsInteger := ednСustCnt.value
      else
        ParamByName('Cust_Qnt').AsInteger := -1;
      if (not chkMatUnlum.Checked) then
        ParamByName('Mat_Qnt').AsFloat := ednCount.value
      else
        ParamByName('Mat_Qnt').AsFloat := -1;
      if chkReq.Checked then
        ParamByName('Mat_Req').AsInteger := 1
      else
        ParamByName('Mat_Req').AsInteger := 0;
      ParamByName('Mat_Id_List').AsString := vMatList;
      ParamByName('Notice').AsString := memNotice.Lines.Text;

      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      free;
    end;
  end;
end;

procedure TNodeLayoutForm.LoadLayoutFromDB;
var
  vMatList: string;
  r, t: TStringDynArray;
  i: Integer;
begin
  vMatList := '';
  {
    mtMat.First;
    while not mtMat.Eof do begin
    vMatList := vMatList + mtMat.FieldByName('M_ID').AsString + ',';
    mtMat.Next;
    end;
    vMatList := vMatList.Trim([',']);
  }
  if not mtMat.Active then
    mtMat.Open
  else
    mtMat.EmptyTable;

  if fNl_Id = -1 then
    Exit;
  chkCustUnlum.Checked := false;
  chkMatUnlum.Checked := false;
  with TpFIBQuery.Create(self) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Text := 'select l.*, (select list(m.M_Id || ''^'' || m.Name, ''~'') from materials m';
      SQL.Add(' where m.M_Id in ( select cast(STR as integer) from Explode_No_Empty('','', l.Mat_Id_List))) MAT_LIST');
      SQL.Add('from Node_Layout l where l.Lt_Id = :LT_ID');
      ParamByName('LT_ID').AsInteger := fNl_Id;

      Transaction.StartTransaction;
      ExecQuery;
      while not Eof do
      begin
        if not FN('Srv_Type').IsNull then
          lcbSrvType.value := FN('Srv_Type').AsInteger;
        if not FN('Cust_Qnt').IsNull then
        begin
          ednСustCnt.value := FN('Cust_Qnt').AsInteger;
          chkCustUnlum.Checked := (FN('Cust_Qnt').AsInteger = -1);
        end;
        if not FN('Mat_Qnt').IsNull then
        begin
          ednCount.value := FN('Mat_Qnt').AsFloat;
          chkMatUnlum.Checked := (FN('Mat_Qnt').AsInteger = -1);
        end;
        if not FN('Mat_Req').IsNull then
          chkReq.Checked := FN('Mat_Req').AsInteger = 1;
        if not FN('Notice').IsNull then
          memNotice.Lines.Text := FN('Notice').AsString;
        if not FN('Mat_List').IsNull then
          vMatList := FN('Mat_List').AsString;

        t := Explode('~', vMatList);
        for i := 0 to Length(t) - 1 do
        begin
          r := Explode('^', t[i]);
          mtMat.Append;
          mtMat['M_ID'] := StrToInt(r[0]);
          mtMat['M_NAME'] := r[1];
          mtMat.Post;
        end;
        Next;
      end;
      Transaction.Commit;
      mtMat.SortByFields('M_NAME');
    finally
      free;
    end;
  end;
end;

end.
