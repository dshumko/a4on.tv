unit PeriodForma;
{$I defines.inc}

interface

uses
  Winapi.Windows,
  System.SysUtils, System.Classes, System.Actions,
  Vcl.Graphics, Vcl.Forms, Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.ActnList, Vcl.ImgList,
  OkCancel_frame;

type
  TPeriodForm = class(TForm)
    pnlBtns: TPanel;
    ActionList1: TActionList;
    actTodayFilter: TAction;
    actMonthFilter: TAction;
    ImageList1: TImageList;
    actPrevMonth: TAction;
    actNextMonth: TAction;
    OkCancelFrame1: TOkCancelFrame;
    tlb1: TToolBar;
    btnPrevMonth: TToolButton;
    btnNextMonth: TToolButton;
    btnTodayFilter: TToolButton;
    btnMonthFilter: TToolButton;
    dePeriodTo: TDateTimePicker;
    lbl1: TLabel;
    dePeriodFrom: TDateTimePicker;
    lbl2: TLabel;
    procedure bbtnApplyClick(Sender: TObject);
    procedure actTodayFilterExecute(Sender: TObject);
    procedure actMonthFilterExecute(Sender: TObject);
    procedure actPrevMonthExecute(Sender: TObject);
    procedure actNextMonthExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure ChangeDate(aMonth: Integer);
  public
    { Public declarations }
  end;

  // возвращает данные по периоду отбора данных
function ChangePeriod(var aPeriodFrom, aPeriodTo: TDateTime): boolean;

implementation

uses
  AtrCommon, AtrStrUtils;
{$R *.DFM}
// возвращает период отбора данных
// true - ecли отбор произведен корректно

function ChangePeriod(var aPeriodFrom, aPeriodTo: TDateTime): boolean;
var
  oldShortDateFormat, oldLongDateFormat: String;

  fs: TFormatSettings;
  pf: TPeriodForm;
begin
{$WARN SYMBOL_PLATFORM OFF}
  fs := TFormatSettings.Create(LOCALE_SYSTEM_DEFAULT);
{$WARN SYMBOL_PLATFORM ON}
  //GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, fs);

  oldShortDateFormat := fs.ShortDateFormat;
  oldLongDateFormat := fs.LongDateFormat;
  pf := TPeriodForm.Create(Application);
  try
    with pf do begin
      dePeriodFrom.DateTime := aPeriodFrom;
      dePeriodTo.DateTime := aPeriodTo;
      if ShowModal = mrOk
      then begin
        if dePeriodFrom.DateTime < dePeriodTo.DateTime
        then begin
          aPeriodFrom := dePeriodFrom.DateTime;
          aPeriodTo := dePeriodTo.DateTime;
        end
        else begin
          aPeriodTo := dePeriodFrom.DateTime;
          aPeriodFrom := dePeriodTo.DateTime;
        end;
        Result := True
      end
      else Result := False;
    end;
  finally
    pf.Free;
  end;
end;

procedure TPeriodForm.ChangeDate(aMonth: Integer);
begin
  dePeriodFrom.DateTime := MonthFirstDay(IncMonth(dePeriodFrom.DateTime, aMonth));
  dePeriodTo.DateTime := MonthLastDay(IncMonth(dePeriodTo.DateTime, aMonth));
end;

procedure TPeriodForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl])
  then begin
    case Ord(Key) of
      VK_RETURN: OkCancelFrame1.bbOk.Click;
      VK_LEFT: actPrevMonth.Execute;
      VK_RIGHT: actNextMonth.Execute;
    end;
  end;
end;

procedure TPeriodForm.bbtnApplyClick(Sender: TObject);
begin
  try
    if dePeriodFrom.DateTime > dePeriodTo.DateTime
    then begin
      dePeriodFrom.DateTime := dePeriodTo.DateTime; // Начальная дата не должна превышать конечную
    end;
  except
  end;
end;

procedure TPeriodForm.actTodayFilterExecute(Sender: TObject);
begin
  dePeriodFrom.DateTime := (Now);
  dePeriodTo.DateTime := (Now);
end;

procedure TPeriodForm.actMonthFilterExecute(Sender: TObject);
begin
  dePeriodFrom.DateTime := MonthFirstDay(Now);
  dePeriodTo.DateTime := MonthLastDay(Now);
end;

procedure TPeriodForm.actPrevMonthExecute(Sender: TObject);
begin
  ChangeDate(-1);
end;

procedure TPeriodForm.actNextMonthExecute(Sender: TObject);
begin
  ChangeDate(1);
end;

end.
