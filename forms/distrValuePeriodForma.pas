unit distrValuePeriodForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, DBCtrlsEh, Vcl.Mask,
  CnErrorProvider, Vcl.ExtCtrls;

type
  TdistrValuePeriodForm = class(TForm)
    cnError: TCnErrorProvider;
    pnlEdit: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl7: TLabel;
    edCNTB: TDBNumberEditEh;
    edVT: TDBEditEh;
    edVD: TDBDateTimeEditEh;
    edCNTE: TDBNumberEditEh;
    edSUMB: TDBNumberEditEh;
    edSUME: TDBNumberEditEh;
    edVN: TDBNumberEditEh;
    pnlPeriod: TPanel;
    pnlAll: TPanel;
    pnlClnt: TPanel;
    mmoBody: TDBMemoEh;
    btnCancel: TButton;
    btnOk: TButton;
    chkPrevios: TCheckBox;
    Label1: TLabel;
    cbMonth: TDBComboBoxEh;
    edtYear: TDBNumberEditEh;
    btnNextMonth: TButton;
    btnPrevMon: TButton;
    procedure btnOkClick(Sender: TObject);
    procedure chkPreviosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrevMonClick(Sender: TObject);
    procedure btnNextMonthClick(Sender: TObject);
  private
    procedure ShiftMonth(const Shift: Integer);
    function GetPeriod: TDate;
    procedure SetPeriod(const aPeriod : TDate);
  public
    property Period : TDate read GetPeriod write SetPeriod;
  end;

implementation

{$R *.dfm}

uses DateUtils, PrjConst;

procedure TdistrValuePeriodForm.btnNextMonthClick(Sender: TObject);
begin
  ShiftMonth(1);
end;

procedure TdistrValuePeriodForm.btnOkClick(Sender: TObject);
var
  AllOk: Boolean;
begin
  AllOk := True;

  if cbMonth.Text.IsEmpty then
  begin
    cnError.SetError(cbMonth, rsRequiredField, iaMiddleLeft, bsNeverBlink);
    AllOk := False;
  end
  else
    cnError.Dispose(cbMonth);
  if edtYear.Text.IsEmpty then
  begin
    cnError.SetError(edtYear, rsRequiredField, iaMiddleLeft, bsNeverBlink);
    AllOk := False;
  end
  else
    cnError.Dispose(edtYear);

  if AllOk then
    ModalResult := mrOk;
end;

procedure TdistrValuePeriodForm.btnPrevMonClick(Sender: TObject);
begin
  ShiftMonth(-1);
end;

procedure TdistrValuePeriodForm.chkPreviosClick(Sender: TObject);
begin
  pnlEdit.Enabled := not chkPrevios.Checked;
  mmoBody.Enabled := not chkPrevios.Checked;
end;

procedure TdistrValuePeriodForm.FormCreate(Sender: TObject);
begin
  ShiftMonth(-1);
end;

function TdistrValuePeriodForm.GetPeriod: TDate;
var
  y, m: Integer;
begin
  if not TryStrToInt(edtYear.Text, y) then
    y := YearOf(now());

  if (VarIsNull(cbMonth.value)) then
    m := MonthOf(now())
  else
    m := cbMonth.value;
  Result := EncodeDate(y, m, 1);
end;

procedure TdistrValuePeriodForm.ShiftMonth(const Shift: Integer);
var
  y, m, d: Word;
  FShowedPeriod: TDate;
begin
  FShowedPeriod := GetPeriod;
  FShowedPeriod := IncMonth(FShowedPeriod, Shift);
  DecodeDate(FShowedPeriod, y, m, d);
  edtYear.value := y;
  cbMonth.value := m;
end;

procedure TdistrValuePeriodForm.SetPeriod(const aPeriod : TDate);
var
  y, m, d: Word;
begin
  DecodeDate(aPeriod, y, m, d);
  edtYear.value := y;
  cbMonth.value := m;
end;

end.
