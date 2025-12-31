unit MatGroupForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  DBLookupEh, DBCtrlsEh, FIBDataSet, pFIBDataSet, DBGridEh, CnErrorProvider, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery;

type
  TMatGroupForm = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    mmoMG_NOTICE: TDBMemoEh;
    edtNAME: TDBEditEh;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    CnErrors: TCnErrorProvider;
    trRead: TpFIBTransaction;
    lbl41: TLabel;
    lbl42: TLabel;
    dsServices: TpFIBDataSet;
    srcServices: TDataSource;
    lcbRENT: TDBLookupComboboxEh;
    lcbLAON: TDBLookupComboboxEh;
    lblSold: TLabel;
    lcbSOLD: TDBLookupComboboxEh;
    dsSoldSRV: TpFIBDataSet;
    srcSoldSRV: TDataSource;
    srcMGropups: TDataSource;
    dsMGropups: TpFIBDataSet;
    lcbGR_ID: TDBLookupComboboxEh;
    lbl1: TLabel;
    trWrite: TpFIBTransaction;
    dsGroup: TpFIBDataSet;
    srcGroup: TDataSource;
    cbProp: TDBComboBoxEh;
    lblPCE1: TLabel;
    ednPCE: TDBNumberEditEh;
    lblPCE: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
  private
    { Private declarations }
  end;

function EditMatGroup(var GroupID: Integer; const RootID: Integer = -3): Boolean;

implementation

uses
  Winapi.ShellAPI,
  MaterialsForma, DM, PrjConst, AtrCommon;

{$R *.dfm}

function EditMatGroup(var GroupID: Integer; const RootID: Integer = -3): Boolean;
var
  MatGroupForm: TMatGroupForm;
begin
  Result := False;
  if (not(dmMain.AllowedAction(rght_Dictionary_Materials) or dmMain.AllowedAction(rght_Dictionary_full))) then
    Exit;

  with TMatGroupForm.Create(Application) do
  begin
    try

      dsServices.Open;
      dsSoldSRV.Open;
      dsMGropups.ParamByName('GID').AsInteger := GroupID;
      dsMGropups.Open;

      if GroupID > 0 then
      begin
        dsGroup.ParamByName('MG_ID').AsInteger := GroupID;
        dsGroup.Open;
        if not dsGroup.FieldByName('MG_NAME').IsNull then
          edtNAME.Text := dsGroup['MG_NAME'];
        if not dsGroup.FieldByName('MG_NOTICE').IsNull then
          mmoMG_NOTICE.Lines.Text := dsGroup['MG_NOTICE'];

        if not dsGroup.FieldByName('SOLD').IsNull then
          lcbSOLD.Value := dsGroup['SOLD'];
        if not dsGroup.FieldByName('RENT').IsNull then
          lcbRENT.Value := dsGroup['RENT'];
        if not dsGroup.FieldByName('LOAN').IsNull then
          lcbLAON.Value := dsGroup['LOAN'];
        if not dsGroup.FieldByName('PARENT_ID').IsNull then
          lcbGR_ID.Value := dsGroup['PARENT_ID'];
        if not dsGroup.FieldByName('PROP').IsNull then
          cbProp.Value := dsGroup['PROP'];
        if not dsGroup.FieldByName('PCE').IsNull then
          ednPCE.Value := dsGroup['PCE'];


        dsGroup.Close;
      end
      else
        lcbGR_ID.Value := RootID;

      if ShowModal = mrOk then
      begin
        dsGroup.Open;
        if GroupID < 0 then
        begin
          GroupID := dmMain.dbTV.Gen_Id('GEN_UID', 1);
          dsGroup.Insert;
        end
        else
          dsGroup.Edit;

        dsGroup['MG_ID'] := GroupID;
        dsGroup['MG_NAME'] := edtNAME.Text;
        dsGroup['MG_NOTICE'] := mmoMG_NOTICE.Lines.Text;
        if not lcbSOLD.Text.IsEmpty then
          dsGroup['SOLD'] := lcbSOLD.Value
        else
          dsGroup.FieldByName('SOLD').Clear;
        if not lcbRENT.Text.IsEmpty then
          dsGroup['RENT'] := lcbRENT.Value
        else
          dsGroup.FieldByName('RENT').Clear;
        if not lcbLAON.Text.IsEmpty then
          dsGroup['LOAN'] := lcbLAON.Value
        else
          dsGroup.FieldByName('LOAN').Clear;
        if not lcbGR_ID.Text.IsEmpty then
          dsGroup['PARENT_ID'] := lcbGR_ID.Value
        else
          dsGroup.FieldByName('PARENT_ID').Clear;
        if not cbProp.Text.IsEmpty then
          dsGroup['PROP'] := cbProp.Value
        else
          dsGroup.FieldByName('PROP').Clear;
        if not ednPCE.Text.IsEmpty then
          dsGroup['PCE'] := ednPCE.Value
        else
          dsGroup.FieldByName('PCE').Clear;

        dsGroup.Post;
        Result := True;
      end;

      dsSoldSRV.Close;
      dsServices.Close;
      dsMGropups.Close;
    finally
      FreeAndNil(MatGroupForm);
    end;
  end;
end;

procedure TMatGroupForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
  begin
    OkCancelFrame1bbOkClick(Sender);
  end;
end;

procedure TMatGroupForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  if not edtNAME.Text.IsEmpty then
    ModalResult := mrOk
  else
    CnErrors.SetError(edtNAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
end;

end.
