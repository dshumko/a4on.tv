unit AttrGeneralForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  FIBDataSet, pFIBDataSet, DBCtrlsEh, DBLookupEh, CnErrorProvider, PrjConst, DBGridEh,
  Vcl.Buttons, FIBDatabase, pFIBDatabase;

type
  TAttrGeneralForm = class(TForm)
    srcAttributesList: TDataSource;
    dsAttributesList: TpFIBDataSet;
    dbluAttribute: TDBLookupComboboxEh;
    DBMemo1: TDBMemoEh;
    Label1: TLabel;
    lblAttribute: TLabel;
    Label2: TLabel;
    dbValue: TDBEditEh;
    dsAttr: TpFIBDataSet;
    srcAttr: TDataSource;
    CnErrors: TCnErrorProvider;
    cbbList: TDBComboBoxEh;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbluAttributeEnter(Sender: TObject);
    procedure dbluAttributeChange(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FObj_ID: Integer;
    FType_ID: Integer;
    FAttr_ID: Integer;
    function CheckAllRight: Boolean;
  public
    property Obj_ID: Integer read FObj_ID write FObj_ID;
    property Type_ID: Integer read FType_ID write FType_ID;
    property Attr_ID: Integer read FAttr_ID write FAttr_ID;
  end;

function AddOrEditAttribute(const pType_ID: Integer; const pObj_ID: Integer; const pAttr_ID: Integer): Boolean;

implementation

uses
  System.RegularExpressions,
  DM, pFIBQuery;

{$R *.dfm}

function AddOrEditAttribute(const pType_ID: Integer; const pObj_ID: Integer; const pAttr_ID: Integer): Boolean;
begin
  with TAttrGeneralForm.Create(Application) do
  begin
    try
      Obj_ID := pObj_ID;
      Type_ID := pType_ID;
      Attr_ID := pAttr_ID;

      if ShowModal = mrOk then
      begin
        result := true;
      end
      else
        result := false;
    finally
      free
    end;
  end;
end;

procedure TAttrGeneralForm.btnOkClick(Sender: TObject);
begin
  //
  if CheckAllRight then begin
    if dsAttr.State in [dsInsert, dsEdit]
    then dsAttr.Post;
    ModalResult := mrOk;
  end
  else
    ModalResult := mrNone

end;

procedure TAttrGeneralForm.dbluAttributeChange(Sender: TObject);
begin
  cbbList.Items.Clear;
  cbbList.KeyItems.Clear;
  cbbList.Items.Text := dsAttributesList['VLIST'];
  cbbList.KeyItems.Text := dsAttributesList['VLIST'];
  cbbList.Visible := (dsAttributesList['VLIST'] <> '');
  dbValue.Visible := not cbbList.Visible;
end;

procedure TAttrGeneralForm.dbluAttributeEnter(Sender: TObject);
begin
  CnErrors.Dispose(dbluAttribute);
end;

procedure TAttrGeneralForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    ModalResult := mrOk;
end;

procedure TAttrGeneralForm.FormShow(Sender: TObject);
begin
  dsAttributesList.ParamByName('Type_ID').AsInt64 := FType_ID;
  dsAttributesList.ParamByName('Object_Id').AsInt64 := FObj_ID;
  dsAttributesList.ParamByName('Aid').AsInt64 := FAttr_ID;
  dsAttributesList.Open;

  dsAttr.ParamByName('Type_Id').AsInt64 := FType_ID;
  dsAttr.ParamByName('Object_Id').AsInt64 := FObj_ID;
  dsAttr.ParamByName('Aid').AsInt64 := FAttr_ID;
  dsAttr.Open;

  if FAttr_ID = -1 then
  begin
    dsAttr.Insert;
    dsAttr['Type_Id'] := FType_ID;
    dsAttr['Object_Id'] := FObj_ID;
  end
  else
  begin
    dsAttr.Edit;
    dbluAttribute.Enabled := false;
  end;

end;

function TAttrGeneralForm.CheckAllRight: Boolean;
var
  errors: Boolean;
  s, reg: string;
  fq: TpFIBQuery;
begin
  errors := false;
  if dbluAttribute.Text = '' then
  begin
    CnErrors.SetError(dbluAttribute, rsSelectAttribute, iaMiddleLeft, bsNeverBlink);
    errors := true;
  end
  else
    CnErrors.Dispose(dbluAttribute);

  if ((dbluAttribute.Text <> '')) then
  begin
    if dbValue.Visible then
    begin
      if dsAttributesList['REGEXP'] <> '' then
      begin
        s := dbValue.Text;
        reg := '^' + dsAttributesList['REGEXP'] + '$';
        errors := not TRegEx.IsMatch(s, reg);
        if errors then
          CnErrors.SetError(dbValue, rsInputIncorrect, iaMiddleLeft, bsNeverBlink)
        else
          CnErrors.Dispose(dbValue);
      end
    end
    else
    begin
      if cbbList.Text = '' then
      begin
        CnErrors.SetError(cbbList, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
        errors := true;
      end
      else
        CnErrors.Dispose(cbbList);
    end;
  end;

  if (dsAttributesList['O_UNIQ'] = 1) then
  begin
    fq := TpFIBQuery.Create(Self);
    try
      fq.Database := dmMain.dbTV;
      fq.Transaction := dmMain.trReadQ;
      with fq.sql do
      begin
        Clear;
        Add('execute block (OBJECT_ID D_INTEGER = :OBJECT_ID, AID D_INTEGER = :AID, AVALUE D_VARCHAR100 = :AVALUE )');
        Add('returns (who D_Varchar255) as');
        Add('declare variable W_ID D_Integer;');
        Add('begin');
        Add('  W_ID = null;');
        Add('  who = '''';');
        Add('  select first 1 a.Object_Id from Attribute a');
        Add('  where a.Aid = :aid and a.Object_Id <> :OBJECT_ID and upper(a.Avalue) = upper(:AVALUE) and adeleted = 0 ');
        Add('  into :W_ID;');
        Add('  if (W_ID is null)');
        Add('  then begin');
        Add('    suspend;');
        Add('    exit;');
        Add('  end');
        Add('  who = ''Значение уже используется'';');
        Add('  suspend;');
        Add('end');
      end;
      fq.ParamByName('OBJECT_ID').AsInteger := FObj_ID;
      fq.ParamByName('AID').AsInteger := dbluAttribute.VALUE;
      if cbbList.Visible then
        fq.ParamByName('AVALUE').AsString := cbbList.Text
      else
        fq.ParamByName('AVALUE').AsString := dbValue.Text;
      fq.Transaction.StartTransaction;
      fq.ExecQuery;
      s := '';
      if not fq.FieldByName('who').IsNull then
        s := fq.FieldByName('who').AsString;
      fq.Transaction.Commit;
      fq.Close;
    finally
      fq.free;
    end;
    if s <> '' then
    begin
      errors := true;
      s := format(rsERROR_UNIQUE, [s]);
      if cbbList.Visible then
        CnErrors.SetError(cbbList, s, iaMiddleLeft, bsNeverBlink)
      else
        CnErrors.SetError(dbValue, s, iaMiddleLeft, bsNeverBlink);
    end;
  end;

  result := not errors;
end;

end.
