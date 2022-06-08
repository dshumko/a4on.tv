unit EditAttributeForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  OkCancel_frame, FIBDataSet, pFIBDataSet, DBGridEh, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery, PrjConst;

type
  TEditAttributForm = class(TForm)
    OkCancelFrame1: TOkCancelFrame;
    srcAttributes: TDataSource;
    dsAttributes: TpFIBDataSet;
    dbluAttribute: TDBLookupComboboxEh;
    memNotice: TDBMemoEh;
    Label1: TLabel;
    lblAttribute: TLabel;
    Label2: TLabel;
    dbValue: TDBEditEh;
    CnErrors: TCnErrorProvider;
    dsCustAttribut: TpFIBDataSet;
    srcCustAttribut: TDataSource;
    cbbList: TDBComboBoxEh;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbluAttributeChange(Sender: TObject);
  private
    FCID: Integer;
    FAID: Integer;
  public
  end;

function EditAttribute(const Customer_ID: Integer; const Attribut: string; const CA_ID: Integer = -1): Boolean;

implementation

uses
  System.RegularExpressions,
  DM, CF, pFIBQuery;

{$R *.dfm}

function EditAttribute(const Customer_ID: Integer; const Attribut: string; const CA_ID: Integer = -1): Boolean;
var
  ForSelected: Boolean;
  NOTICE: string;
  VALUE: string;
  bm: TBookmark;
  Save_Cursor: TCursor;
  i: Integer;
begin

  with TEditAttributForm.Create(Application) do
    try
      if Attribut = '' then begin
        dsAttributes.ParamByName('IS_OLD').AsInteger := 0;
      end
      else begin
        dsAttributes.ParamByName('IS_OLD').AsInteger := 1;
        dbluAttribute.Enabled := false;
      end;
      FCID := Customer_ID;
      FAID := CA_ID;
      dsAttributes.ParamByName('CID').AsInt64 := FCID;
      dsAttributes.Open;
      dsCustAttribut.ParamByName('CA_ID').AsInteger := CA_ID;
      dsCustAttribut.Open;
      if CA_ID = -1 then
        dsCustAttribut.Insert
      else
        dsCustAttribut.Edit;

      if ShowModal = mrOk then begin
        ForSelected := false;
        if Assigned(CustomersForm) then begin
          if (CustomersForm.dbgCustomers.SelectedRows.Count > 0) then
            ForSelected := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);
        end;

        if ForSelected and (dsAttributes['O_UNIQ'] <> 1) then begin
          Save_Cursor := Screen.Cursor;
          Screen.Cursor := crHourGlass;
          FAID := dbluAttribute.VALUE;
          NOTICE := memNotice.Lines.Text;
          VALUE := dbValue.Text;
          dsCustAttribut.Cancel;
          dsCustAttribut.DisableControls;
          bm := CustomersForm.dbgCustomers.DataSource.DataSet.GetBookmark;
          CustomersForm.dbgCustomers.DataSource.DataSet.DisableControls;
          for i := 0 to CustomersForm.dbgCustomers.SelectedRows.Count - 1 do begin
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
        else begin
          dsCustAttribut.FieldByName('CUSTOMER_ID').AsInteger := Customer_ID;
          dsCustAttribut.Post;
        end;
        result := true;
      end
      else begin
        dsCustAttribut.Cancel;
        result := false;
      end;
      if dsAttributes.Active then
        dsAttributes.Close;
    finally
      free
    end;
end;

procedure TEditAttributForm.dbluAttributeChange(Sender: TObject);
begin
  cbbList.Items.Clear;
  cbbList.KeyItems.Clear;
  cbbList.Items.Text := dsAttributes['VLIST'];
  cbbList.KeyItems.Text := dsAttributes['VLIST'];
  cbbList.Visible := (dsAttributes['VLIST'] <> '');
  dbValue.Visible := not cbbList.Visible;
end;

procedure TEditAttributForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TEditAttributForm.OkCancelFrame1bbOkClick(Sender: TObject);
var
  errors: Boolean;
  s: string;
  reg: string;
  fq: TpFIBQuery;
begin
  errors := false;
  if (dbluAttribute.Text = '') then begin
    errors := true;
    CnErrors.SetError(dbluAttribute, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(dbluAttribute);
  if ((dbluAttribute.Text <> '')) then begin
    if dsAttributes['REGEXP'] <> '' then begin
      s := dbValue.Text;
      reg := '^' + dsAttributes['REGEXP'] + '$';
      errors := not TRegEx.IsMatch(s, reg);
      if errors then
        CnErrors.SetError(dbValue, rsInputIncorrect, iaMiddleLeft, bsNeverBlink)
      else
        CnErrors.Dispose(dbValue);
    end
  end;

  if (dsAttributes['O_UNIQ'] = 1) then begin
    fq := TpFIBQuery.Create(Self);
    try
      fq.Database := dmMain.dbTV;
      fq.Transaction := dmMain.trReadQ;
      with fq.sql do begin
        Clear;
        add('select first 1');
        add(' c.Account_No || '' код '' || c.Cust_Code || '' ФИО '' || c.Firstname || '' '' || c.Initials as who');
        add('from Customer_Attributes a');
        add('  inner join customer c on (a.Customer_Id = c.Customer_Id)');
        add('where a.O_Id = :aid');
        add('  and a.Customer_Id <> :cid');
        add('  and upper(a.Ca_Value) = upper(:val)');
      end;
      fq.ParamByName('cid').AsInteger := FCID;
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
    if s <> '' then begin
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
    ModalResult := mrNone;
end;

end.







