unit CardsPaySettingsForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  FIBQuery, pFIBQuery, OkCancel_frame, FIBDataSet, pFIBDataSet, DBCtrlsEh;

type
  TCardsPaySettingsForm = class(TForm)
    Query: TpFIBQuery;
    OkCancelFrame1: TOkCancelFrame;
    select: TpFIBDataSet;
    GlobalGB: TGroupBox;
    PIN_LEN: TDBNumberEditEh;
    Label1: TLabel;
    Label2: TLabel;
    NUM_LEN: TDBNumberEditEh;
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  DM, PrjConst;

{$R *.dfm}

procedure TCardsPaySettingsForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  try
    if (dmMain.AllowedAction(rght_Programm_Settings)) then
    begin
      Query.SQL.Text := 'execute procedure set_settings(''CP_NUMBER_LEN'', ''' + FloatToStr(NUM_LEN.Value) + ''')';
      Query.Transaction.StartTransaction;
      Query.ExecQuery;
      Query.Transaction.Commit;

      Query.SQL.Text := 'execute procedure set_settings(''CP_PIN_LEN'', ''' + FloatToStr(PIN_LEN.Value) + ''')';
      Query.Transaction.StartTransaction;
      Query.ExecQuery;
      Query.Transaction.Commit;

      dmMain.GetSettingsValue('ReloadSettingsFromDB');
    end;
  except
    MOdalResult := mrNone;
  end;

end;

procedure TCardsPaySettingsForm.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    OkCancelFrame1bbOkClick(Sender);
end;

procedure TCardsPaySettingsForm.FormShow(Sender: TObject);
begin
  GlobalGB.Visible := (dmMain.AllowedAction(rght_Programm_Settings));
  if GlobalGB.Visible then
  begin
    select.Open;
    while not select.Eof do
    begin
      if AnsiUpperCase(select.FN('VAR_NAME').Value) = 'CP_NUMBER_LEN' then
        NUM_LEN.Value := select.FN('VAR_VALUE').AsFloat;
      if AnsiUpperCase(select.FN('VAR_NAME').Value) = 'CP_PIN_LEN' then
        PIN_LEN.Value := select.FN('VAR_VALUE').AsFloat;
      select.Next;
    end;
    select.Close;
  end
  else
    Height := Height - GlobalGB.Height;
end;

end.
