unit EquipAttributesForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  OkCancel_frame, FIBDataSet, pFIBDataSet, DBCtrlsEh, DBLookupEh, CnErrorProvider, PrjConst, DBGridEh;

type
  TEquipAttributesForm = class(TForm)
    OkCancelFrame1: TOkCancelFrame;
    srcAttributes: TDataSource;
    dsAttributes: TpFIBDataSet;
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
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbluAttributeEnter(Sender: TObject);
    procedure dbluAttributeChange(Sender: TObject);
  private
    FEQID: Integer;
  public
    { Public declarations }
  end;

function EditAttribute(const EQID: Integer; const EQ_TYPE: Integer; const Attribut: Integer): boolean;

function AttributeIPTV(const IPTV_ID: Integer; const Attribut: Integer): boolean;

implementation

uses
  System.RegularExpressions,
  DM, pFIBQuery;

{$R *.dfm}

function EditAttribute(const EQID: Integer; const EQ_TYPE: Integer; const Attribut: Integer): boolean;
begin
  with TEquipAttributesForm.Create(Application) do
    try
      FEQID := EQID;
      dsAttr.SQLs.SelectSQL.Clear;
      dsAttr.SQLs.SelectSQL.Add(' SELECT A.O_NAME, CA.* FROM equipment_attributes CA ');
      dsAttr.SQLs.SelectSQL.Add(' INNER JOIN OBJECTS A ON (CA.O_ID = A.O_ID and a.O_Type in (5,6,65))');
      dsAttr.SQLs.SelectSQL.Add(' where CA.eid = :eid and ca.O_ID = :oid ');

      dsAttr.SQLs.InsertSQL.Text :=
        'INSERT INTO EQUIPMENT_ATTRIBUTES( EID, O_ID, CA_VALUE, NOTICE ) VALUES(:EID, :O_ID, :CA_VALUE, :NOTICE )';

      dsAttr.SQLs.UpdateSQL.Clear;
      dsAttr.SQLs.UpdateSQL.Add
        ('UPDATE EQUIPMENT_ATTRIBUTES SET EID = :EID, O_ID = :O_ID, CA_VALUE = :CA_VALUE, NOTICE = :NOTICE');
      dsAttr.SQLs.UpdateSQL.Add('WHERE EA_ID = :OLD_EA_ID');

      dsAttr.ParamByName('EID').AsInt64 := EQID;
      dsAttr.ParamByName('OID').AsInt64 := Attribut;
      dsAttr.Open;
      if Attribut = -1 then
      begin
        dsAttr.Insert;
        dsAttr['EID'] := EQID;
        dsAttributes.ParamByName('EID').AsInt64 := EQID;
      end
      else
      begin
        dsAttr.Edit;
        dbluAttribute.Enabled := false;
        dsAttributes.ParamByName('EID').AsInt64 := -1;
      end;

      case EQ_TYPE of
        1:
          dsAttributes.ParamByName('TYPEEQ').AsInt64 := 5; // Сетевое оборудование
        2:
          dsAttributes.ParamByName('TYPEEQ').AsInt64 := 6; // Кабельное оборудование
      end;
      dsAttributes.Open;

      if ShowModal = mrOk then
      begin
        try
          dsAttr.Post;
          result := true;
        except
          result := false;
        end;
      end
      else
        result := false;
      if dsAttributes.Active then
        dsAttributes.Close;
    finally
      free
    end;
end;

function AttributeIPTV(const IPTV_ID: Integer; const Attribut: Integer): boolean;
begin
  with TEquipAttributesForm.Create(Application) do
    try
      dsAttributes.SQLs.SelectSQL.Clear;
      dsAttributes.SQLs.SelectSQL.Add
        ('SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, coalesce(O_CHECK, '''') REGEXP, coalesce(O_CHARFIELD, '''') VLIST');
      dsAttributes.SQLs.SelectSQL.Add('FROM OBJECTS o WHERE O_TYPE = :TYPEEQ AND O_DELETED = 0');
      dsAttributes.SQLs.SelectSQL.Add
        ('and not exists(select ca.o_id from Iptv_Group_Attributes ca where ca.o_id = o.O_ID and ca.Ig_Id = :Ig_Id)');
      dsAttributes.SQLs.SelectSQL.Add('order BY O_NAME');

      dsAttr.SQLs.SelectSQL.Clear;
      dsAttr.SQLs.SelectSQL.Add('SELECT A.O_NAME, CA.* FROM Iptv_Group_Attributes CA');
      dsAttr.SQLs.SelectSQL.Add('INNER JOIN OBJECTS A ON (CA.O_ID = A.O_ID and a.O_Type = 32)');
      dsAttr.SQLs.SelectSQL.Add('where CA.Ig_Id = :Ig_Id and ca.O_ID = :oid');

      dsAttr.SQLs.InsertSQL.Text :=
        'insert into Iptv_Group_Attributes (Ig_Id, O_Id, Ca_Value, Notice) values (:Ig_Id, :O_Id, :Ca_Value, :Notice)';

      dsAttr.SQLs.UpdateSQL.Clear;
      dsAttr.SQLs.UpdateSQL.Add('update Iptv_Group_Attributes');
      dsAttr.SQLs.UpdateSQL.Add('set Ig_Id = :Ig_Id, O_Id = :O_Id, Ca_Value = :Ca_Value, Notice = :Notice');
      dsAttr.SQLs.UpdateSQL.Add('where Iga_Id = :OLD_Iga_Id');

      dsAttr.ParamByName('Ig_Id').AsInt64 := IPTV_ID;
      dsAttr.ParamByName('OID').AsInt64 := Attribut;
      dsAttr.Open;
      if Attribut = -1 then
      begin
        dsAttr.Insert;
        dsAttr['Ig_Id'] := IPTV_ID;
        dsAttributes.ParamByName('Ig_Id').AsInt64 := IPTV_ID;
      end
      else
      begin
        dsAttr.Edit;
        dbluAttribute.Enabled := false;
        dsAttributes.ParamByName('Ig_Id').AsInt64 := -1;
      end;

      dsAttributes.ParamByName('TYPEEQ').AsInt64 := 32;
      dsAttributes.Open;

      if ShowModal = mrOk then
      begin
        try
          dsAttr.Post;
          result := true;
        except
          result := false;
        end;
      end
      else
        result := false;
      if dsAttributes.Active then
        dsAttributes.Close;
    finally
      free
    end;
end;

procedure TEquipAttributesForm.dbluAttributeChange(Sender: TObject);
begin
  cbbList.Items.Clear;
  cbbList.KeyItems.Clear;
  cbbList.Items.Text := dsAttributes['VLIST'];
  cbbList.KeyItems.Text := dsAttributes['VLIST'];
  cbbList.Visible := (dsAttributes['VLIST'] <> '');
  dbValue.Visible := not cbbList.Visible;
end;

procedure TEquipAttributesForm.dbluAttributeEnter(Sender: TObject);
begin
  CnErrors.Dispose(dbluAttribute);
end;

procedure TEquipAttributesForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    ModalResult := mrOk;
end;

procedure TEquipAttributesForm.OkCancelFrame1bbOkClick(Sender: TObject);
var
  errors: boolean;
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
      if dsAttributes['REGEXP'] <> '' then
      begin
        s := dbValue.Text;
        reg := '^' + dsAttributes['REGEXP'] + '$';
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

  if (dsAttributes['O_UNIQ'] = 1) then
  begin
    fq := TpFIBQuery.Create(Self);
    try
      fq.Database := dmMain.dbTV;
      fq.Transaction := dmMain.trReadQ;
      with fq.sql do
      begin
        Clear;
        Add('select first 1 c.Name as who');
        Add('from Equipment_Attributes a inner join Equipment c on (a.Eid = c.Eid)');
        Add('where a.O_Id = :aid and a.Eid <> :cid and upper(a.Ca_Value) = upper(:val)');
      end;
      fq.ParamByName('cid').AsInteger := FEQID;
      fq.ParamByName('aid').AsInteger := dbluAttribute.VALUE;
      if cbbList.Visible then
        fq.ParamByName('val').AsString := cbbList.Text
      else
        fq.ParamByName('val').AsString := dbValue.Text;
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

  if not errors then
    ModalResult := mrOk
  else
    ModalResult := mrNone
end;

end.
