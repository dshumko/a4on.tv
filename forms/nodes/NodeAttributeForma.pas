unit NodeAttributeForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  OkCancel_frame, FIBDataSet, pFIBDataSet, DBGridEh, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery, PrjConst;

type
  TNodeAttributForm = class(TForm)
    OkCancelFrame1: TOkCancelFrame;
    srcAttributes: TDataSource;
    dsAttributes: TpFIBDataSet;
    dbluAttribute: TDBLookupComboboxEh;
    memNotice: TDBMemoEh;
    Label1: TLabel;
    lblAttribute: TLabel;
    Label2: TLabel;
    edtNA_VALUE: TDBEditEh;
    CnErrors: TCnErrorProvider;
    dsNodeAttribute: TpFIBDataSet;
    srcNodeAttribute: TDataSource;
    cbbList: TDBComboBoxEh;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbluAttributeChange(Sender: TObject);
  private
    FCID: Integer;
  public
  end;

function EditAttribute(const NODE_ID: Integer; const Attribute: string; const NA_ID: Integer = -1): Boolean;

implementation

uses
  System.RegularExpressions,
  DM, NodesForma, pFIBQuery;

{$R *.dfm}

function EditAttribute(const NODE_ID: Integer; const Attribute: string; const NA_ID: Integer = -1): Boolean;
var
  ForSelected: Boolean;
  AID: Integer;
  NOTICE: string;
  VALUE: string;
  bm: TBookmark;
  Save_Cursor: TCursor;
  i: Integer;
begin

  with TNodeAttributForm.Create(Application) do
    try
      if Attribute = '' then begin
        dsAttributes.ParamByName('IS_OLD').AsInteger := 0;
      end
      else begin
        dsAttributes.ParamByName('IS_OLD').AsInteger := 1;
        dbluAttribute.Enabled := false;
      end;
      FCID := NODE_ID;
      dsAttributes.ParamByName('CID').AsInt64 := FCID;
      dsAttributes.Open;
      dsNodeAttribute.ParamByName('NA_ID').AsInteger := NA_ID;
      dsNodeAttribute.Open;
      if NA_ID = -1 then
        dsNodeAttribute.Insert
      else
        dsNodeAttribute.Edit;

      if ShowModal = mrOk then begin
        ForSelected := false;
        if Assigned(NodesForm) then begin
          if (NodesForm.dbgNodes.SelectedRows.Count > 0) then
            ForSelected := (MessageDlg(rsProcessAllSelectedRows, mtConfirmation, [mbYes, mbNo], 0) = mrYes);
        end;

        if ForSelected and (dsAttributes['O_UNIQ'] <> 1) then begin
          Save_Cursor := Screen.Cursor;
          Screen.Cursor := crHourGlass;
          AID := dbluAttribute.VALUE;
          NOTICE := memNotice.Lines.Text;
          VALUE := edtNA_VALUE.Text;
          dsNodeAttribute.Cancel;
          dsNodeAttribute.DisableControls;
          bm := NodesForm.dbgNodes.DataSource.DataSet.GetBookmark;
          NodesForm.dbgNodes.DataSource.DataSet.DisableControls;
          for i := 0 to NodesForm.dbgNodes.SelectedRows.Count - 1 do begin
            NodesForm.dbgNodes.DataSource.DataSet.Bookmark := NodesForm.dbgNodes.SelectedRows[i];
            try
              FCID := NodesForm.dbgNodes.DataSource.DataSet['NODE_ID'];
              dsNodeAttribute.Insert;
              dsNodeAttribute.FieldByName('O_ID').AsInteger := AID;
              dsNodeAttribute.FieldByName('NA_VALUE').AsString := VALUE;
              dsNodeAttribute.FieldByName('NOTICE').AsString := NOTICE;
              dsNodeAttribute.FieldByName('NODE_ID').AsInteger := FCID;
              dsNodeAttribute.Post;
            except
              //
            end;
          end;
          dsNodeAttribute.EnableControls;
          NodesForm.dbgNodes.DataSource.DataSet.GotoBookmark(bm);
          NodesForm.dbgNodes.DataSource.DataSet.EnableControls;
          Screen.Cursor := Save_Cursor;
        end
        else begin
          dsNodeAttribute.FieldByName('NODE_ID').AsInteger := NODE_ID;
          dsNodeAttribute.Post;
        end;
        result := true;
      end
      else begin
        dsNodeAttribute.Cancel;
        result := false;
      end;
      if dsAttributes.Active then
        dsAttributes.Close;
    finally
      free
    end;
end;

procedure TNodeAttributForm.dbluAttributeChange(Sender: TObject);
begin
  cbbList.Items.Clear;
  cbbList.KeyItems.Clear;
  cbbList.Items.Text := dsAttributes['VLIST'];
  cbbList.KeyItems.Text := dsAttributes['VLIST'];
  cbbList.Visible := (dsAttributes['VLIST'] <> '');
  edtNA_VALUE.Visible := not cbbList.Visible;
end;

procedure TNodeAttributForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TNodeAttributForm.OkCancelFrame1bbOkClick(Sender: TObject);
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
      s := edtNA_VALUE.Text;
      reg := '^' + dsAttributes['REGEXP'] + '$';
      errors := not TRegEx.IsMatch(s, reg);
      if errors then
        CnErrors.SetError(edtNA_VALUE, rsInputIncorrect, iaMiddleLeft, bsNeverBlink)
      else
        CnErrors.Dispose(edtNA_VALUE);
    end
  end;

  if (dsAttributes['O_UNIQ'] = 1) then begin
    fq := TpFIBQuery.Create(Self);
    try
      fq.Database := dmMain.dbTV;
      fq.Transaction := dmMain.trReadQ;
      with fq.sql do begin
        Clear;
        add('select first 1 c.Name as who');
        add('from Nodes_Attributes a inner join Nodes c on (a.Node_Id = c.Node_Id)');
        add('where a.O_Id = :aid and a.Node_Id <> :cid and upper(a.Na_Value) = upper(:val)');
      end;
      fq.ParamByName('cid').AsInteger := FCID;
      fq.ParamByName('aid').AsInteger := dbluAttribute.VALUE;
      if cbbList.Visible then
        fq.ParamByName('val').AsString := cbbList.Text
      else
        fq.ParamByName('val').AsString := edtNA_VALUE.Text;
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
        CnErrors.SetError(edtNA_VALUE, s, iaMiddleLeft, bsNeverBlink);
    end;
  end;

  if not errors then
    ModalResult := mrOk
  else
    ModalResult := mrNone;
end;

end.
