unit CardPayGenerateForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  OkCancel_frame, DBCtrlsEh, FIBDataSet, pFIBDataSet, DBLookupEh, PrjConst, DBGridEh;

type
  TfmCardPayGenerate = class(TForm)
    lbl1: TLabel;
    lupSerials: TDBLookupComboboxEh;
    srcCardSerial: TDataSource;
    dsCardSerial: TpFIBDataSet;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    edNominal: TDBNumberEditEh;
    edCount: TDBNumberEditEh;
    dedExp: TDBDateTimeEditEh;
    okcnclfrm: TOkCancelFrame;
    procedure LupStreetsEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure okcnclfrm1bbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function GenerateCardPay(): Boolean;

implementation

uses
  System.DateUtils,
  DM, CardSerialForma, pFIBQuery;

{$R *.dfm}

function GenerateCardPay(): Boolean;
var
  fq: TpFIBQuery;
begin
  result := False;
  with TfmCardPayGenerate.Create(Application) do
    try
      dsCardSerial.Open;
      dedExp.Value := IncYear(now(), 1);
      if ShowModal = mrOk then
      begin
        try
          if (MessageDlg(format(rsPayCardCreate, [edCount.Value, edNominal.Value]), mtConfirmation, [mbYes, mbNo], 0)
            = mrYes) then
          begin
            screen.cursor := crSQLWait;
            fq := TpFIBQuery.Create(dmMain);
            try
              fq.Database := dmMain.dbTV;
              fq.Transaction := dmMain.trWriteQ;
              fq.SQL.Text :=
                'EXECUTE PROCEDURE CARDS_PREPAY_GENERATE (:Cp_Count, :Cp_Nominal, :Cp_Serial, :Cp_Exp_Date)';
              fq.ParamByName('Cp_Count').AsInteger := edCount.Value;
              fq.ParamByName('Cp_Nominal').AsInteger := edNominal.Value;
              fq.ParamByName('Cp_Serial').AsInteger := lupSerials.Value;
              fq.ParamByName('Cp_Exp_Date').AsDate := dedExp.Value;

              fq.Transaction.StartTransaction;
              fq.ExecQuery;
              fq.Transaction.Commit;
            finally
              fq.free;
            end;
            screen.cursor := crDefault;
          end;
          result := true;
        except
          result := False;
        end;

      end;

      dsCardSerial.Close;
    finally
      free
    end;
end;

procedure TfmCardPayGenerate.LupStreetsEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  i: int64;
begin
  i := EditCardSerial(-1);
  if i <> -1 then
  begin
    dsCardSerial.CloseOpen(true);
    lupSerials.Value := i;
  end;
  Handled := true;
end;

procedure TfmCardPayGenerate.okcnclfrm1bbOkClick(Sender: TObject);
begin
  ModalResult := mrNone;
  if (VarIsNumeric(lupSerials.Value) and VarIsNumeric(edNominal.Value) and VarIsNumeric(edCount.Value) and
    not VarIsNull(dedExp.Value)) then
    ModalResult := mrOk
  else
    ShowMessage(rsERROR_NOT_FILL_ALL);
end;

procedure TfmCardPayGenerate.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    okcnclfrm1bbOkClick(Sender);
end;

procedure TfmCardPayGenerate.FormShow(Sender: TObject);
var
  FullAcces: Boolean;
begin
  FullAcces := dmMain.AllowedAction(rght_Pays_full); // полный доступ к платежам
  okcnclfrm.bbOk.Visible := (dmMain.AllowedAction(rght_Pays_CardsGen)) or FullAcces; // Генерация карт оплат

end;

end.
