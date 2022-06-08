unit distrPeriodForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  DBCtrlsEh, CnErrorProvider;

type
  TdistrPeriodForm = class(TForm)
    lbl1: TLabel;
    cbMonth: TDBComboBoxEh;
    edtYear: TDBNumberEditEh;
    edtSubject: TDBEditEh;
    mmoBody: TDBMemoEh;
    btnCancel: TButton;
    btnOk: TButton;
    cnError: TCnErrorProvider;
    btnPrevMon: TButton;
    btnNextMonth: TButton;
    chkInFile: TDBCheckBoxEh;
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPrevMonClick(Sender: TObject);
    procedure btnNextMonthClick(Sender: TObject);
  private
    procedure ShiftMonth(const Shift: Integer);
    procedure SetPeriod(const value: TDate);
    function GetPeriod: TDate;
  public
    property ShowedPeriod: TDate read GetPeriod write SetPeriod;
  end;

var
  distrPeriodForm: TdistrPeriodForm;

implementation

{$R *.dfm}

uses
  System.DateUtils,
  PrjConst;

procedure TdistrPeriodForm.btnOkClick(Sender: TObject);
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

  if not chkInFile.Checked then
  begin

    if edtSubject.Text.IsEmpty then
    begin
      cnError.SetError(edtSubject, rsRequiredField, iaMiddleLeft, bsNeverBlink);
      AllOk := False;
    end
    else
      cnError.Dispose(edtSubject);
  end;

  if AllOk then
    ModalResult := mrOk;
end;

procedure TdistrPeriodForm.btnPrevMonClick(Sender: TObject);
begin
  ShiftMonth(-1);
end;

procedure TdistrPeriodForm.btnNextMonthClick(Sender: TObject);
begin
  ShiftMonth(1);
end;

procedure TdistrPeriodForm.FormShow(Sender: TObject);
begin
  ShiftMonth(-1);
end;

procedure TdistrPeriodForm.ShiftMonth(const Shift: Integer);
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

procedure TdistrPeriodForm.SetPeriod(const value: TDate);
begin
  ShiftMonth(0);
end;

function TdistrPeriodForm.GetPeriod: TDate;
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

end.
