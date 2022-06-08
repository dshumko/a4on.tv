unit PersonalTarifForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  DBCtrlsEh, FIBQuery, pFIBQuery, PrjConst, CnErrorProvider;

type
  TPersonalTarifForm = class(TForm)
    deTarif: TDBNumberEditEh;
    Label1: TLabel;
    deDate_from: TDBDateTimeEditEh;
    Label2: TLabel;
    Query: TpFIBQuery;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    lbl1: TLabel;
    deDate_to: TDBDateTimeEditEh;
    dbmNotice: TDBMemoEh;
    CnErrors: TCnErrorProvider;
    qSelect: TpFIBQuery;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ControlExit(Sender: TObject);
  private
    FAnyDate: Boolean;
    procedure ModalResultOk;
  public
  end;

function EditTarif(const aSerivce: String; const aService_ID: Integer; const aCustomer_ID: Integer;
  const aTarif_ID: Integer): Boolean;

implementation

uses
  System.DateUtils,
  DM;

{$R *.dfm}

function EditTarif(const aSerivce: String; const aService_ID: Integer; const aCustomer_ID: Integer;
  const aTarif_ID: Integer): Boolean;
begin
  result := false;
  with TPersonalTarifForm.Create(Application) do
    try
      Caption := Caption + ' ' + aSerivce;
      if aTarif_ID > -1 then
      begin
        qSelect.ParamByName('TARIF_ID').AsInteger := aTarif_ID;
        qSelect.ExecQuery;
        if not qSelect.FN('DATE_FROM').IsNull then
          deDate_from.Value := qSelect.FN('DATE_FROM').AsDate;
        if not qSelect.FN('DATE_TO').IsNull then
          deDate_to.Value := qSelect.FN('DATE_TO').AsDate;
        if not qSelect.FN('TARIF_SUM').IsNull then
          deTarif.Value := qSelect.FN('TARIF_SUM').AsFloat;
        if not qSelect.FN('NOTICE').IsNull then
          dbmNotice.Lines.Text := qSelect.FN('NOTICE').AsString;
        qSelect.Close;
      end;

      if ShowModal = mrOk then
      begin
        Query.ParamByName('TARIF_ID').AsInteger := aTarif_ID;
        Query.ParamByName('SERVICE_ID').AsInteger := aService_ID;
        Query.ParamByName('CUSTOMER_ID').AsInteger := aCustomer_ID;
        Query.ParamByName('DATE_FROM').AsDate := deDate_from.Value;
        Query.ParamByName('DATE_TO').AsDate := deDate_to.Value;
        Query.ParamByName('TARIF_SUM').AsFloat := deTarif.Value;
        Query.ParamByName('NOTICE').AsString := dbmNotice.Lines.Text;
        Query.Transaction.StartTransaction;
        Query.ExecQuery;
        try
          Query.Transaction.Commit;
          result := True;
        except
          result := True;
        end;

      end;
    finally
      free
    end;
end;

procedure TPersonalTarifForm.btnOkClick(Sender: TObject);
begin
  ModalResultOk;
end;

procedure TPersonalTarifForm.ControlExit(Sender: TObject);
begin
  if (Sender is TControl) then
    CnErrors.Dispose((Sender as TControl));
end;

procedure TPersonalTarifForm.FormCreate(Sender: TObject);
var
  y, m, d: Word;
begin
  FAnyDate := (dmMain.AllowedAction(rght_Customer_full)); // Полный доступ
  FAnyDate := (dmMain.AllowedAction(rght_Customer_History)) or FAnyDate; // Изменение истории

  DecodeDate(dmMain.CurrentMonth, y, m, d);

  deDate_from.Value := EncodeDate(y, m, 1);
  deDate_to.Value := EncodeDate(y, m, DaysInAMonth(y, m));
  deTarif.Value := 0;
end;

procedure TPersonalTarifForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    ModalResultOk;
end;

procedure TPersonalTarifForm.ModalResultOk;
var
  AllRight: Boolean;
  f: Extended;
begin
  AllRight := FAnyDate;

  // не даем править персональный тариф прошлым периодом, если нет прав
  if Not AllRight then
  begin
    if (deDate_from.Value < dmMain.CurrentMonth) then
    begin
      CnErrors.SetError(deDate_from, rsWrongDate, iaMiddleLeft, bsNeverBlink);
      AllRight := false;
      deDate_from.SetFocus;
    end
    else
      AllRight := True;
  end;

  if (deDate_from.Value >= deDate_to.Value) then
  begin
    AllRight := false;
    CnErrors.SetError(deDate_to, rsWrongDate, iaMiddleLeft, bsNeverBlink);
    deDate_to.SetFocus;
  end
  else
    AllRight := AllRight and True;

  if VarIsNull(deTarif.Value) or VarIsEmpty(deTarif.Value) then
  begin
    CnErrors.SetError(deTarif, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    AllRight := false;
    deTarif.SetFocus;
  end
  else if (not TryStrToFloat(deTarif.Value, f)) then
  begin
    CnErrors.SetError(deTarif, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
    AllRight := false;
    deTarif.SetFocus;
  end
  else
    AllRight := AllRight and True;

  if AllRight then
    ModalResult := mrOk
  else
    ModalResult := mrNone;
end;

end.
