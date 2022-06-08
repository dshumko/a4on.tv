unit NodeMaterialForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  OkCancel_frame, FIBDataSet, pFIBDataSet, DBGridEh, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery, PrjConst, FIBDatabase,
  pFIBDatabase;

type
  TNodeMaterialForm = class(TForm)
    OkCancelFrame1: TOkCancelFrame;
    CnErrors: TCnErrorProvider;
    dsMaterials: TpFIBDataSet;
    srcMaterials: TDataSource;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    lblAttribute: TLabel;
    dbluMat: TDBLookupComboboxEh;
    ednCount: TDBNumberEditEh;
    lbl1: TLabel;
    memNotice: TDBMemoEh;
    Label1: TLabel;
    edtSN: TDBEditEh;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    function SaveInDb(const NODE_ID: Integer): Boolean;
  public
  end;

function AddMaterial(const NODE_ID: Integer): Boolean;

implementation

uses
  System.RegularExpressions,
  DM, NodesForma, pFIBQuery;

{$R *.dfm}

function AddMaterial(const NODE_ID: Integer): Boolean;
begin

  with TNodeMaterialForm.Create(Application) do
    try
      dsMaterials.ParamByName('NODE_ID').AsInteger := NODE_ID;
      dsMaterials.Open;
      if ShowModal = mrOk then
      begin
        result := SaveInDb(NODE_ID);
      end
      else
      begin
        result := false;
      end;
      dsMaterials.Close;
    finally
      free
    end;
end;

procedure TNodeMaterialForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TNodeMaterialForm.OkCancelFrame1bbOkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := false;

  if dbluMat.Text.IsEmpty then
  begin
    CnErrors.SetError(dbluMat, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
    errors := true;
  end
  else
    CnErrors.Dispose(dbluMat);

  if edtSN.Text.IsEmpty then
  begin
    CnErrors.SetError(edtSN, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
    errors := true;
  end
  else
    CnErrors.Dispose(edtSN);

  if not errors then
    ModalResult := mrOk
  else
    ModalResult := mrNone;
end;

function TNodeMaterialForm.SaveInDb(const NODE_ID: Integer): Boolean;
var
  fq: TpFIBQuery;
begin
  result := false;
  fq := TpFIBQuery.Create(Self);
  try
    fq.Database := dmMain.dbTV;
    fq.Transaction := trWrite;
    fq.sql.Text := 'insert into Inventory (Owner, Owner_Type, M_Id, Serial, ownership, Quant, Notice)';
    fq.sql.add('values (:Owner, :Owner_Type, :M_Id, :Serial, :ownership, :Quant, :Notice)');
    fq.ParamByName('Owner').AsInteger := NODE_ID;
    fq.ParamByName('Owner_Type').AsInteger := 2; // 2=Узел
    fq.ParamByName('ownership').AsInteger := 0;
    fq.ParamByName('M_Id').AsInteger := dbluMat.KeyValue;
    fq.ParamByName('Serial').AsString := edtSN.Text;
    fq.ParamByName('Notice').AsString := memNotice.Lines.Text;
    if not ednCount.Text.IsEmpty then
      fq.ParamByName('Quant').AsDouble := ednCount.Value;
    fq.Transaction.StartTransaction;
    fq.ExecQuery;
    fq.Transaction.Commit;
    fq.Close;
    result := true;
  finally
    fq.free;
  end;
end;

end.
