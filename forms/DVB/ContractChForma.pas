unit ContractChForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  DBGridEh, FIBDataSet, pFIBDataSet, DBCtrlsEh, DBLookupEh, OkCancel_frame, CnErrorProvider, FIBDatabase, pFIBDatabase;

type
  TContractChForm = class(TForm)
    okf: TOkCancelFrame;
    DBLChannels: TDBLookupComboboxEh;
    DBMemo1: TDBMemoEh;
    srcChannel: TDataSource;
    dsChannel: TpFIBDataSet;
    srcChannList: TDataSource;
    dsChannList: TpFIBDataSet;
    Label1: TLabel;
    Label3: TLabel;
    CnErrors: TCnErrorProvider;
    edtCOST: TDBNumberEditEh;
    trSWrite: TpFIBTransaction;
    trSRead: TpFIBTransaction;
    lbl1: TLabel;
    ednCOST: TDBNumberEditEh;
    chkATV: TDBCheckBoxEh;
    chkDTV: TDBCheckBoxEh;
    chkIPTV: TDBCheckBoxEh;
    chkOTT: TDBCheckBoxEh;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure okfbbCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ContractChannel(const aContract_ID: Integer; const CH_ID : Integer = -1): Integer;

implementation

uses
  DM, PrjConst;

{$R *.dfm}

function ContractChannel(const aContract_ID: Integer; const CH_ID : Integer = -1): Integer;
begin
  Result := -1;
  with TContractChForm.Create(application) do
    try
      dsChannList.Open;
      dsChannel.ParamByName('Contract_ID').AsInteger := aContract_ID;
      dsChannel.ParamByName('CH_ID').AsInteger := CH_ID;
      dsChannel.Open;
      if (CH_ID = -1) then begin
         dsChannel.Insert;
         dsChannel['Contract_ID'] := aContract_ID;
      end
      else
         dsChannel.Edit;

      DBLChannels.Enabled := (CH_ID = -1);
      if ShowModal = mrOk then begin
        dsChannel.Post;
        Result := dsChannel['CH_ID'];
      end
      else
        dsChannel.Cancel;
      dsChannList.Close;
    finally
      free;
    end;
end;

procedure TContractChForm.OkCancelFrame1bbOkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := False;

  if (DBLChannels.Text = '') then begin
    errors := True;
    CnErrors.SetError(DBLChannels, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(DBLChannels);

  if not errors then
    ModalResult := mrOk;
end;

procedure TContractChForm.okfbbCancelClick(Sender: TObject);
begin
  dsChannel.Cancel;
end;

end.
