﻿unit ReqTemplateForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OkCancel_frame, StdCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, Mask, DBCtrls, DBCtrlsEh, DBLookupEh,
  FIBQuery, pFIBQuery, DBGridEh, Vcl.Buttons, GridsEh, CnErrorProvider;

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
    lbl2: TLabel;
    luWork: TDBLookupComboboxEh;
    dsWorks: TpFIBDataSet;
    srcWorks: TDataSource;
    lbl3: TLabel;
    mmo1: TDBMemoEh;
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
    procedure dsRQTLAfterOpen(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure cbbRecreateTypeDropDownBoxGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
      var Background: TColor; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnColorClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ReguestTemplateModify(const aRQTL_ID: Integer; const aRT_ID: Integer): Integer;

implementation

uses
  DM, PrjConst;

{$R *.dfm}

function ReguestTemplateModify(const aRQTL_ID: Integer; const aRT_ID: Integer): Integer;
var
  needAdd: Boolean;
begin
  result := aRQTL_ID;
  with TReqTemplateForm.Create(Application) do
    try
      dsANALYS.Open;

      dsWorks.ParamByName('RT_ID').AsInteger := aRT_ID;
      dsWorks.Open;

      dsRQTL.ParamByName('RQTL_ID').AsInteger := aRQTL_ID;
      dsRQTL.Open;

      mmo1.Lines.Delimiter := ';';
      mmo1.Lines.Clear;
      if aRQTL_ID = -1 then
        dsRQTL.Insert
      else
      begin
        if not dsRQTL.FieldByName('ADD_FIELD').IsNull then
          mmo1.Lines.DelimitedText := dsRQTL['ADD_FIELD'];
      end;

      if ShowModal = mrOk then
      begin
        if aRQTL_ID = -1 then
        begin
          result := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);
          dsRQTL.ParamByName('RQTL_ID').AsInteger := result;
          dsRQTL['RQ_TYPE'] := aRT_ID;
          if mmo1.Lines.DelimitedText <> '' then
            dsRQTL['ADD_FIELD'] := mmo1.Lines.DelimitedText;
        end
        else
        begin
          if not dsRQTL.FieldByName('ADD_FIELD').IsNull then
            needAdd := mmo1.Lines.DelimitedText <> dsRQTL['ADD_FIELD']
          else
            needAdd := mmo1.Lines.DelimitedText <> '';

          if needAdd then
          begin
            if not(dsRQTL.State in [dsEdit]) then
              dsRQTL.Edit;
            dsRQTL['ADD_FIELD'] := mmo1.Lines.DelimitedText;
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
      free
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
begin
  if not dsRQTL.FieldByName('RQ_COLOR').IsNull then
    try
      Self.Color := StringToColor(dsRQTL.FieldByName('RQ_COLOR').Value);
    except
    end;
end;

procedure TReqTemplateForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
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