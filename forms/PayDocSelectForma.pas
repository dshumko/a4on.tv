unit PayDocSelectForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls,
  DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, DBGridEh;

type
  TPayDocSelectForm = class(TForm)
    pnlBTNS: TPanel;
    Panel1: TPanel;
    srcPaymentDocs: TDataSource;
    dsPaymentDocs: TpFIBDataSet;
    pnlPayDoc: TPanel;
    dbluPayDoc: TDBLookupComboboxEh;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SelectPaymentDoc(): integer;

implementation

uses
  DM, MAIN;

{$R *.dfm}

function SelectPaymentDoc(): integer;
begin
  Result := -1;
  with TPayDocSelectForm.Create(Application) do
    try
      if ShowModal = mrOk
      then begin
        if VarIsNumeric(dbluPayDoc.Value)
        then Result := dbluPayDoc.Value;
      end;
    finally Free;
    end;
end;

procedure TPayDocSelectForm.FormCreate(Sender: TObject);
begin
  dsPaymentDocs.ParamByName('filter').Value := ' PAY_DOC_ID in (' + A4MAINForm.FindOpenPayDoc() + ')';
  dsPaymentDocs.Active := true;
  dsPaymentDocs.Open;
end;

procedure TPayDocSelectForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then ModalResult := mrOk;
end;

end.
