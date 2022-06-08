unit AttributeEditForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.Classes, System.SysUtils, System.Variants, System.UITypes, System.RegularExpressions,
  Data.DB,
  Vcl.Graphics, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Controls, Vcl.Forms,
  OkCancel_frame, DBLookupEh, A4onTypeUnit, DBGridEh, CnErrorProvider, FIBDataSet, pFIBDataSet, DBCtrlsEh, FIBQuery, PrjConst,
  FIBDatabase, pFIBDatabase;

type
  TAttributeEditForm = class(TForm)
    OkCancelFrame1: TOkCancelFrame;
    srcAttributes: TDataSource;
    dsAttributes: TpFIBDataSet;
    dbluAttribute: TDBLookupComboboxEh;
    memNotice: TDBMemoEh;
    Label1: TLabel;
    lblAttribute: TLabel;
    Label2: TLabel;
    edtAVALUE: TDBEditEh;
    CnErrors: TCnErrorProvider;
    dsAtrRecord: TpFIBDataSet;
    srcAtrRecord: TDataSource;
    cbbList: TDBComboBoxEh;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbluAttributeChange(Sender: TObject);
  private
    FAttribute: TAttribute;
    procedure InitAttribute(value: TAttribute);
    procedure Save;
    function Check: Boolean;
  public
    property Attribute: TAttribute read FAttribute write InitAttribute;
  end;

function AttributeEdit(var aAttribute: TAttribute): Boolean;

implementation

uses
  DM, pFIBQuery;

{$R *.dfm}

function AttributeEdit(var aAttribute: TAttribute): Boolean;
begin
  with TAttributeEditForm.Create(Application) do
  begin
    try
      Attribute := aAttribute;
      if ShowModal = mrOk then
        result := true
      else
        result := false;
    finally
      free
    end;
  end;
end;

procedure TAttributeEditForm.InitAttribute(value: TAttribute);
begin
  FAttribute := value;

  case FAttribute.TYPE_ID of
    rsAttrID_eiptv:
      Caption := rsAttrName_eiptv;
    rsAttrID_etv:
      Caption := rsAttrName_etv;
    rsAttrID_cust:
      Caption := rsAttrName_cust;
    rsAttrID_etype:
      Caption := rsAttrName_etype;
    rsAttrID_home:
      Caption := rsAttrName_home;
    rsAttrID_elan:
      Caption := rsAttrName_elan;
    rsAttrID_vlan:
      Caption := rsAttrName_vlan;
    rsAttrID_node:
      Caption := rsAttrName_node;
    rsAttrID_srv:
      Caption := rsAttrName_srv;
  else
    Caption := 'Тип не определен'
  end;

  if FAttribute.ATTR_ID = -1 then
    dsAttributes.ParamByName('IS_OLD').AsInteger := 0
  else begin
    dsAttributes.ParamByName('IS_OLD').AsInteger := 1;
    dbluAttribute.ReadOnly := True;
  end;
  dsAttributes.ParamByName('ATR_TYPE').value := FAttribute.TYPE_ID;
  dsAttributes.ParamByName('OBJ_ID').value := FAttribute.OBJECT_ID;
  dsAttributes.Open;

  dsAtrRecord.ParamByName('ATR_TYPE').value := FAttribute.TYPE_ID;
  dsAtrRecord.ParamByName('OBJ_ID').AsInteger := FAttribute.OBJECT_ID;
  dsAtrRecord.ParamByName('AID').AsInteger := FAttribute.ATTR_ID;
  dsAtrRecord.Open;

  if FAttribute.ATTR_ID = -1 then
    dsAtrRecord.Insert
  else
    dsAtrRecord.Edit;
  {
    if ShowModal = mrOk then
    begin
    ForSelected := false;
    if Assigned(CustomersForm) then
    begin
    if (CustomersForm.dbgCustomers.SelectedRows.Count > 0) then
    ForSelected := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);
    end;

    if ForSelected and (dsAttributes['O_UNIQ'] <> 1) then
    begin
    Save_Cursor := Screen.Cursor;
    Screen.Cursor := crHourGlass;
    FAID := dbluAttribute.VALUE;
    NOTICE := memNotice.Lines.Text;
    VALUE := dbValue.Text;
    dsCustAttribut.Cancel;
    dsCustAttribut.DisableControls;
    bm := CustomersForm.dbgCustomers.DataSource.DataSet.GetBookmark;
    CustomersForm.dbgCustomers.DataSource.DataSet.DisableControls;
    for i := 0 to CustomersForm.dbgCustomers.SelectedRows.Count - 1 do
    begin
    CustomersForm.dbgCustomers.DataSource.DataSet.Bookmark := CustomersForm.dbgCustomers.SelectedRows[i];
    try
    FCID := CustomersForm.dbgCustomers.DataSource.DataSet['CUSTOMER_ID'];
    dsCustAttribut.Insert;
    dsCustAttribut.FieldByName('O_ID').AsInteger := FAID;
    dsCustAttribut.FieldByName('CA_VALUE').AsString := VALUE;
    dsCustAttribut.FieldByName('NOTICE').AsString := NOTICE;
    dsCustAttribut.FieldByName('CUSTOMER_ID').AsInteger := FCID;
    dsCustAttribut.Post;
    except
    //
    end;
    end;
    dsCustAttribut.EnableControls;
    CustomersForm.dbgCustomers.DataSource.DataSet.GotoBookmark(bm);
    CustomersForm.dbgCustomers.DataSource.DataSet.EnableControls;
    Screen.Cursor := Save_Cursor;
    end
    else
    begin
    dsCustAttribut.FieldByName('CUSTOMER_ID').AsInteger := Arrtibute.OBJECT_ID;
    dsCustAttribut.Post;
    end;
    result := true;
    end
    else
    begin
    dsCustAttribut.Cancel;
    result := false;
    end;
    if dsAttributes.Active then
    dsAttributes.Close;

  }
end;

procedure TAttributeEditForm.dbluAttributeChange(Sender: TObject);
begin
  cbbList.Items.Clear;
  cbbList.KeyItems.Clear;
  cbbList.Items.Text := dsAttributes['VLIST'];
  cbbList.KeyItems.Text := dsAttributes['VLIST'];
  cbbList.Visible := (dsAttributes['VLIST'] <> '');
  edtAVALUE.Visible := not cbbList.Visible;
end;

procedure TAttributeEditForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TAttributeEditForm.Save;
begin
  dsAtrRecord.FieldByName('OBJECT_ID').AsInteger := FAttribute.OBJECT_ID;
  dsAtrRecord.FieldByName('TYPE_ID').AsInteger := FAttribute.TYPE_ID;
  dsAtrRecord.Post;
end;

function TAttributeEditForm.Check: Boolean;
var
  errors: Boolean;
  s: string;
  reg: string;
  fq: TpFIBQuery;
begin
  errors := false;

  if (dbluAttribute.Text = '') then
  begin
    errors := true;
    CnErrors.SetError(dbluAttribute, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(dbluAttribute);

  if ((dbluAttribute.Text <> '')) then
  begin
    if dsAttributes['REGEXP'] <> '' then
    begin
      s := edtAVALUE.Text;
      reg := '^' + dsAttributes['REGEXP'] + '$';
      errors := not TRegEx.IsMatch(s, reg);
      if errors then
        CnErrors.SetError(edtAVALUE, rsInputIncorrect, iaMiddleLeft, bsNeverBlink)
      else
        CnErrors.Dispose(edtAVALUE);
    end
  end;

  if (dsAttributes['O_UNIQ'] = 1) then
  begin
    fq := TpFIBQuery.Create(Self);
    try
      fq.Database := dmMain.dbTV;
      fq.Transaction := dmMain.trReadQ;
      fq.sql.Text:= 'select Result from Attribute_Check_Uniq(:Type_Id, :Object_Id, :Aid, :Avalue)';

      fq.ParamByName('Type_Id').AsInteger := FAttribute.TYPE_ID;
      fq.ParamByName('Object_Id').AsInteger := FAttribute.OBJECT_ID;
      fq.ParamByName('aid').AsInteger := dbluAttribute.value;
      if cbbList.Visible then
        fq.ParamByName('Avalue').AsString := cbbList.Text
      else
        fq.ParamByName('Avalue').AsString := edtAVALUE.Text;
      fq.Transaction.StartTransaction;
      fq.ExecQuery;
      s := fq.FieldByName('Result').AsString;
      fq.Transaction.Commit;
      fq.Close;
    finally
      fq.free;
    end;
    if not s.IsEmpty then
    begin
      errors := true;
      s := format(rsERROR_UNIQUE, [s]);
      if cbbList.Visible then
        CnErrors.SetError(cbbList, s, iaMiddleLeft, bsNeverBlink)
      else
        CnErrors.SetError(dbluAttribute, s, iaMiddleLeft, bsNeverBlink);
    end;
  end;

  result := not errors;
end;

procedure TAttributeEditForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  if Check then
  begin
    Save;
    ModalResult := mrOk
  end
  else
    ModalResult := mrNone;
end;

end.
