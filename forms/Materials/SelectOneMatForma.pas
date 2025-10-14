unit SelectOneMatForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, PropFilerEh, Data.DB, FIBDataSet, pFIBDataSet,
  PropStorageEh, DBGridEh, DBCtrlsEh, Vcl.Mask, DBLookupEh,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL,
  GridsEh, DBAxisGridsEh, CnErrorProvider, A4onTypeUnit;

type
  TSelectMaterialForm = class(TForm)
    pnlB: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    PropStorage: TPropStorageEh;
    dsMaterial: TpFIBDataSet;
    srcMaterial: TDataSource;
    CnErrors: TCnErrorProvider;
    lblDim: TLabel;
    pnlTop: TPanel;
    lbl1: TLabel;
    lcbEquipment: TDBLookupComboboxEh;
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function CheckAndSave: Boolean;
  public
  end;

function SelectOneMaterial: TSelectedMaterial;

implementation

uses
  PrjConst, DM, MAIN;

{$R *.dfm}

function SelectOneMaterial: TSelectedMaterial;
begin
  Result.id := -1;
  with TSelectMaterialForm.Create(Application) do
  begin
    dsMaterial.Open;
    if ShowModal = mrOk then
    begin
      Result.id := lcbEquipment.Value;
      if (dsMaterial['M_Id'] <> Result.id) then
        dsMaterial.Locate('M_Id', Result.id, []);
      Result.name := dsMaterial['NAME'];
    end;
    dsMaterial.Close;
  end;
end;

function TSelectMaterialForm.CheckAndSave: Boolean;
var
  HasErors: Boolean;
begin
  HasErors := False;

  CnErrors.Dispose(lcbEquipment);
  if VarIsNull(lcbEquipment.KeyValue) then
  begin
    HasErors := True;
    CnErrors.SetError(lcbEquipment, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end;

  Result := not HasErors;
end;

procedure TSelectMaterialForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    btnOkClick(Sender);
end;

procedure TSelectMaterialForm.btnOkClick(Sender: TObject);
begin
  if CheckAndSave then
    modalResult := mrOk
  else
    modalResult := mrNone;
end;

end.
