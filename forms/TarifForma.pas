unit TarifForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  DBCtrlsEh, FIBQuery, pFIBQuery, PrjConst;

type
  TTarifForm = class(TForm)
    deTarif: TDBNumberEditEh;
    Label1: TLabel;
    deDate_from: TDBDateTimeEditEh;
    Label2: TLabel;
    Query: TpFIBQuery;
    qryChannel: TpFIBQuery;
    lbl1: TLabel;
    deTarifJur: TDBNumberEditEh;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    lblVAT: TLabel;
    ednVAT: TDBNumberEditEh;
    lblPARTNER: TLabel;
    ednPARTNER: TDBNumberEditEh;
    procedure deTarifChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
  private
    procedure ModalResultOk;
  public
  end;

function EditTarif (const aSerivce:String; const aService_ID : Integer; const aTarif_ID:Integer; const itsVAT:Boolean = false): boolean;
function NewChTarif (const aChannel :String; const aChannae_ID : Integer; const aTarif_ID:Integer): boolean;

implementation

uses
  DM;

{$R *.dfm}

function NewChTarif (const aChannel :String; const aChannae_ID : Integer; const aTarif_ID:Integer): boolean;
var
  Year, Month, Day : WORD;
begin
  result := false;
  with TTarifForm.Create(Application) do
  try
    lbl1.Visible := False;
    deTarifJur.Visible := False;
    lblVAT.Visible := False;
    ednVAT.Visible := False;
    lblPARTNER.Visible := False;
    ednPARTNER.Visible := False;
    Height := deTarif.Top + 100;
    Caption := format(rsTarChan, [aChannel]);
    qryChannel.ParamByName('CHT_ID').AsInteger := aTarif_ID;
    qryChannel.ParamByName('CHANNEL_ID').AsInteger := aChannae_ID;
    if aTarif_ID = -1
    then qryChannel.ParamByName('ACTION').AsInteger := 0
    else qryChannel.ParamByName('ACTION').AsInteger := 1;
    DecodeDate(NOW(), Year, Month, Day);
    deDate_from.Value := IncMonth(EncodeDate(Year, Month, 1), 1);
    if ShowModal = mrOk
    then begin
      if deTarif.Value>0 then begin
        qryChannel.ParamByName('DATE_FROM').AsDate := deDate_from.Value;
        qryChannel.ParamByName('TARIF_SUM').AsFloat := deTarif.Value;
        qryChannel.Transaction.StartTransaction;
        qryChannel.ExecProc;
        qryChannel.Transaction.Commit;
        result := true;
      end;
    end;
  finally
    free
  end;
end;

function EditTarif (const aSerivce:String; const aService_ID : Integer; const aTarif_ID:Integer; const itsVAT:Boolean = false): boolean;
var
  Year, Month, Day : WORD;
begin
  result := false;
  with TTarifForm.Create(Application) do
  try
    Caption := Caption + ' ' + aSerivce;

    lbl1.Visible := not itsVAT;
    deTarifJur.Visible := not itsVAT;
    lblVAT.Visible := not itsVAT;
    ednVAT.Visible := not itsVAT;
    if not deTarifJur.Visible then
      Height := deTarif.Top + 100;
    Query.ParamByName('TARIF_ID').AsInteger := aTarif_ID;
    Query.ParamByName('SERVICE_ID').AsInteger := aService_ID;
    if aTarif_ID = -1
    then Query.ParamByName('ACTION').AsInteger := 0
    else Query.ParamByName('ACTION').AsInteger := 1;
    Query.ParamByName('DATE_TO').IsNull := true;
    DecodeDate(NOW(), Year, Month, Day);
    deDate_from.Value := IncMonth(EncodeDate(Year, Month, 1), 1);
    if ShowModal = mrOk
    then begin
      Query.ParamByName('DATE_FROM').AsDate := deDate_from.Value;
      Query.ParamByName('TARIF_SUM').AsFloat := deTarif.Value;
      if itsVAT then begin
        Query.ParamByName('tarif_sum_jur').AsFloat := deTarif.Value;
        Query.ParamByName('VAT').AsFloat := 0;
      end
      else begin
        Query.ParamByName('tarif_sum_jur').AsFloat := deTarifJur.Value;
        if ednVAT.Text <> ''
        then Query.ParamByName('VAT').AsFloat := ednVAT.Value
        else Query.ParamByName('VAT').AsFloat := 0;
      end;

      if ednPARTNER.Text <> ''
      then Query.ParamByName('PARTNER_TARIF').AsFloat := ednPARTNER.Value
      else Query.ParamByName('PARTNER_TARIF').Clear;

      Query.Transaction.StartTransaction;
      Query.ExecProc;
      Query.Transaction.Commit;
      result := true;
    end;
  finally
    free
  end;
end;

procedure TTarifForm.btnOkClick(Sender: TObject);
begin
  ModalResultOk;
end;

procedure TTarifForm.deTarifChange(Sender: TObject);
var
  f : Extended;
  b : Boolean;
begin
  b := False;
  if deTarif.Text <> ''
  then begin
    if TryStrToFloat(deTarif.Value, f)
    then b := true;
  end;

  btnOk.Enabled := b;
end;

procedure TTarifForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then ModalResultOk;
end;

procedure TTarifForm.ModalResultOk;
begin
  if btnOk.Enabled then
    ModalResult := mrOk;
end;

end.
