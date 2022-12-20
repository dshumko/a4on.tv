unit MatGroupForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  DBLookupEh, DBCtrlsEh, FIBDataSet, pFIBDataSet, DBGridEh, CnErrorProvider, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery;

type
  TMatGroupForm = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    mmoMG_NOTICE: TDBMemoEh;
    edtNAME: TDBEditEh;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    CnErrors: TCnErrorProvider;
    trReadQ: TpFIBTransaction;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
  private
    { Private declarations }
  end;

var
  MatGroupForm: TMatGroupForm;

implementation

uses
  Winapi.ShellAPI,
  MaterialsForma, DM, PrjConst, ScanImageForma, AtrCommon;

{$R *.dfm}

procedure TMatGroupForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsSoldSRV.Close;
  dsServices.Close;
end;

procedure TMatGroupForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
  begin
    OkCancelFrame1bbOkClick(Sender);
  end;
end;

procedure TMatGroupForm.FormShow(Sender: TObject);
begin
  dsServices.Open;
  dsSoldSRV.Open;
end;

procedure TMatGroupForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  if not edtNAME.Text.IsEmpty then
    ModalResult := mrOk
  else
    CnErrors.SetError(edtNAME, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
end;

end.
