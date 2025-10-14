unit ReqTemplateForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Forms, Vcl.DBCtrls, Vcl.Menus, Vcl.StdCtrls, Vcl.Controls, Vcl.Mask, Vcl.Dialogs, Vcl.Buttons,
  OkCancel_frame, CnErrorProvider, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, DBGridEh,
  GridsEh,
  DBCtrlsEh, DBLookupEh, Vcl.ComCtrls, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, DBAxisGridsEh, Vcl.ExtCtrls,
  MemTableDataEh, MemTableEh, System.Actions, Vcl.ActnList;

type
  TReqTemplateForm = class(TForm)
    srcRQTL: TDataSource;
    dsRQTL: TpFIBDataSet;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    Label2: TLabel;
    edContent: TDBEditEh;
    luAnalysGrp: TDBLookupComboboxEh;
    dsANALYS: TpFIBDataSet;
    srcANALYS: TDataSource;
    lbl1: TLabel;
    dsAllWorks: TpFIBDataSet;
    lbl3: TLabel;
    mmoAddons: TDBMemoEh;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    CnErrors: TCnErrorProvider;
    chkNeedPhoto: TDBCheckBoxEh;
    chkNEED_NODE_RQ: TDBCheckBoxEh;
    lblRecreate: TLabel;
    edtDaysRecreate: TDBNumberEditEh;
    cbbRecreateType: TDBLookupComboboxEh;
    srcTypes: TDataSource;
    dsTypes: TpFIBDataSet;
    btnClear: TButton;
    btnColor: TBitBtn;
    dlgColor: TColorDialog;
    pmSMS: TPopupMenu;
    miNN1: TMenuItem;
    miPD1: TMenuItem;
    miTEXT: TMenuItem;
    pgc: TPageControl;
    tsAdd: TTabSheet;
    tsWorks: TTabSheet;
    chkFlatsResult: TDBCheckBoxEh;
    mmoFlatsResult: TDBMemoEh;
    tsSMS: TTabSheet;
    lbl5: TLabel;
    mmoCreate: TDBMemoEh;
    lbl4: TLabel;
    mmoClose: TDBMemoEh;
    pnlRWorks: TPanel;
    dbgWorks: TDBGridEh;
    pnlBW: TPanel;
    btnAddWork: TButton;
    btnDelWork: TButton;
    mtWorks: TMemTableEh;
    srcWorks: TDataSource;
    actlst: TActionList;
    actAddWork: TAction;
    actDelWork: TAction;
    procedure dsRQTLAfterOpen(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure cbbRecreateTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
      var Background: TColor; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnColorClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure miTEXTClick(Sender: TObject);
    procedure actAddWorkExecute(Sender: TObject);
    procedure actDelWorkExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ReguestTemplateModify(const aRQTL_ID: Integer; const aRT_ID: Integer): Integer;

implementation

uses
  DM, PrjConst, JsonDataObjects, ReqAddWorkForma;

{$R *.dfm}

function ReguestTemplateModify(const aRQTL_ID: Integer; const aRT_ID: Integer): Integer;
var
  needAdd: Boolean;
  ja: TJsonArray;
  jv: TJsonObject;
  s: string;
begin
  result := aRQTL_ID;
  with TReqTemplateForm.Create(Application) do
    try
      dsANALYS.Open;

      dsRQTL.ParamByName('RQTL_ID').AsInteger := aRQTL_ID;
      dsRQTL.Open;

      mmoAddons.Lines.Delimiter := ';';
      mmoAddons.Lines.Clear;
      mmoFlatsResult.Lines.Delimiter := ';';
      mmoFlatsResult.Lines.Clear;
      if aRQTL_ID = -1 then
        dsRQTL.Insert
      else
      begin
        if not dsRQTL.FieldByName('ADD_FIELD').IsNull then
          mmoAddons.Lines.DelimitedText := dsRQTL['ADD_FIELD'];
        if not dsRQTL.FieldByName('FLATS_RESULT').IsNull then
          mmoFlatsResult.Lines.DelimitedText := dsRQTL['FLATS_RESULT'];
      end;

      if ShowModal = mrOk then
      begin
        if aRQTL_ID = -1 then
        begin
          result := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);
          dsRQTL.ParamByName('RQTL_ID').AsInteger := result;
          dsRQTL['RQ_TYPE'] := aRT_ID;
          if mmoAddons.Lines.DelimitedText <> '' then
            dsRQTL['ADD_FIELD'] := mmoAddons.Lines.DelimitedText;
          if mmoFlatsResult.Lines.DelimitedText <> '' then
            dsRQTL['FLATS_RESULT'] := mmoFlatsResult.Lines.DelimitedText;
        end
        else
        begin
          if not(dsRQTL.State in [dsEdit]) then
            dsRQTL.Edit;

          if not dsRQTL.FieldByName('ADD_FIELD').IsNull then
            needAdd := mmoAddons.Lines.DelimitedText <> dsRQTL['ADD_FIELD']
          else
            needAdd := mmoAddons.Lines.DelimitedText <> '';
          if needAdd then
            dsRQTL['ADD_FIELD'] := mmoAddons.Lines.DelimitedText;

          if not dsRQTL.FieldByName('FLATS_RESULT').IsNull then
            needAdd := mmoFlatsResult.Lines.DelimitedText <> dsRQTL['FLATS_RESULT']
          else
            needAdd := mmoFlatsResult.Lines.DelimitedText <> '';

          if needAdd then
          begin
            if not(dsRQTL.State in [dsEdit]) then
              dsRQTL.Edit;
            dsRQTL['FLATS_RESULT'] := mmoFlatsResult.Lines.DelimitedText;
          end;

          dsRQTL.FieldByName('WORKS').Clear;
          dsRQTL.FieldByName('WORKS').Clear;
          if (mtWorks.Active) and (mtWorks.RecordCount > 0) then
          begin
            ja := TJsonArray.Create;
            try
              mtWorks.First;
              while not mtWorks.Eof do
              begin
                jv := JsonDataObjects.TJsonObject.Create;
                // try
                jv.I['i'] := mtWorks['W_ID'];
                if not mtWorks.FieldByName('quant').IsNull then
                  jv.F['q'] := mtWorks['quant']
                else
                  jv.F['q'] := 0;
                if (not mtWorks.FieldByName('NOTICE').IsNull) and (mtWorks['NOTICE'] <> '') then
                  jv.s['n'] := mtWorks['NOTICE'];

                ja.Add(jv);
                // finally
                // jv.Free;
                // end;
                mtWorks.Next;
              end;

              s := ja.ToString;
              dsRQTL['WORKS'] := s;
            finally
              ja.Free;
            end;
          end;

        end;

        if dsRQTL.State in [dsEdit, dsInsert] then
          dsRQTL.Post;
      end
      else
      begin
        if dsRQTL.State in [dsEdit, dsInsert] then
          dsRQTL.Cancel;
        result := -1;
      end;
      dsRQTL.Close;
      dsANALYS.Close;
    finally
      Free
    end;
end;

procedure TReqTemplateForm.actAddWorkExecute(Sender: TObject);
var
  work_id: Integer;
  wname, notice: string;
  quant, w_time, w_cost: double;
begin
  if (pgc.ActivePage <> tsWorks) then
    Exit;

  if SelectWork(work_id, wname, quant, w_time, w_cost, notice) then
  begin
    mtWorks.DisableControls;
    if not mtWorks.Active then
    begin
      mtWorks.Open;
      mtWorks.EmptyTable;
    end;

    mtWorks.Append;
    mtWorks['W_ID'] := work_id;
    mtWorks['name'] := wname;
    mtWorks['quant'] := quant;
    mtWorks['w_time'] := w_time;
    mtWorks['w_cost'] := w_cost;
    mtWorks['notice'] := notice;
    mtWorks.Post;
    mtWorks.EnableControls;
  end;
end;

procedure TReqTemplateForm.actDelWorkExecute(Sender: TObject);
begin
  if (pgc.ActivePage <> tsWorks) then
    Exit;

  if mtWorks.FieldByName('NAME').IsNull then
    Exit;

  if Application.MessageBox(PWideChar(format(rsDeleteWithName, [mtWorks['NAME']])), PWideChar(rsDeleteWork),
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    mtWorks.Delete;
  end;
end;

procedure TReqTemplateForm.btnClearClick(Sender: TObject);
begin
  Self.Color := clBtnFace;
  if not(dsRQTL.State in [dsInsert, dsEdit]) then
    dsRQTL.Edit;
  dsRQTL.FieldByName('RQ_COLOR').Clear;
end;

procedure TReqTemplateForm.btnColorClick(Sender: TObject);
begin
  if dlgColor.Execute then
  begin
    Self.Color := dlgColor.Color;
    if not(dsRQTL.State in [dsInsert, dsEdit]) then
      dsRQTL.Edit;
    dsRQTL['RQ_COLOR'] := ColorToString(dlgColor.Color);
  end;
end;

procedure TReqTemplateForm.dsRQTLAfterOpen(DataSet: TDataSet);
var
  ja: TJsonArray;
  Value: TJsonDataValueHelper;
begin

  if not dsRQTL.FieldByName('RQ_COLOR').IsNull then
    try
      Self.Color := StringToColor(dsRQTL.FieldByName('RQ_COLOR').Value);
    except
    end;

  // set Works
  if not dsRQTL.FieldByName('WORKS').IsNull then
  begin
    ja := (TJsonObject.Parse(dsRQTL['WORKS']) as TJsonArray);
    try
      if (ja.Count > 0) then
      begin
        if not dsAllWorks.Active then
          dsAllWorks.Open;
        if dsAllWorks.RecordCount > 0 then
        begin

          mtWorks.DisableControls;
          if not mtWorks.Active then
          begin
            mtWorks.Open;
            mtWorks.EmptyTable;
          end;

          for Value in ja do
          begin
            if dsAllWorks.Locate('W_ID', Value.I['i'], []) then
            begin
              mtWorks.Append;
              mtWorks['W_ID'] := dsAllWorks['W_ID'];
              mtWorks['name'] := dsAllWorks['NAME'];
              mtWorks['quant'] := Value.F['q'];
              mtWorks['w_time'] := dsAllWorks['W_TIME'];
              mtWorks['w_cost'] := dsAllWorks['W_COST'];
              if (Value.s['n'] <> '') then
                mtWorks['notice'] := Value.s['n'];
              mtWorks.Post;
            end;
          end;

        end;
        mtWorks.EnableControls;
      end;
    finally
      ja.Free;
    end;
  end;
end;

procedure TReqTemplateForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsAllWorks.Active then
    dsAllWorks.Close;
  dsTypes.Close;
end;

procedure TReqTemplateForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    btnOkClick(Sender);
end;

procedure TReqTemplateForm.FormShow(Sender: TObject);
begin
  dsTypes.Open;
end;

procedure TReqTemplateForm.miTEXTClick(Sender: TObject);
begin
  if (Sender is TMenuItem) then
    (ActiveControl as TDBMemoEh).SelText := (Sender as TMenuItem).Hint;
end;

procedure TReqTemplateForm.btnOkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := false;
  if (edContent.Text = '') then
  begin
    errors := true;
    CnErrors.SetError(edContent, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edContent);

  if not errors then
    ModalResult := mrOk
  else
    ModalResult := mrNone;
end;

procedure TReqTemplateForm.cbbRecreateTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsTypes.Active) and (not dsTypes.FieldByName('COLOR').IsNull) then
    Background := StringToColor(dsTypes['COLOR']);
end;

end.
