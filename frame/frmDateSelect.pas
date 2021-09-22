unit frmDateSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ExtCtrls, FIBDatabase,
  FIBQuery, pFIBQuery, PrjConst, System.Actions, Vcl.ActnList;

type
  TfrmRequestDate = class(TFrame)
    pnlGrid: TPanel;
    sgCalendar: TStringGrid;
    pnlInfo: TPanel;
    btnNextMon: TBitBtn;
    btnPrevMon: TBitBtn;
    qBusyDays: TpFIBQuery;
    actlst1: TActionList;
    actPrevMon: TAction;
    actNextMon: TAction;
    procedure bbPrevClick(Sender: TObject);
    procedure sgCalendarDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure sgCalendarSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure FrameResize(Sender: TObject);
    procedure actPrevMonExecute(Sender: TObject);
    procedure actNextMonExecute(Sender: TObject);
  private
    { Private declarations }
    FYear: Word;
    FMonth: Word;
    FDay: Word;
    FHouse: Integer;
    FType: Integer;
    FDisabledDays: TStrings;

    procedure ChangeMonth(const Value: Integer);
    procedure UpdateCalendar;
    function GetSelectedDate: TDate;
    procedure SetHouse(Value: Integer);
    procedure SetType(Value: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property House: Integer read FHouse write SetHouse;
    property RType: Integer read FType write SetType;
    property SelectedDate: TDate read GetSelectedDate;
  end;

implementation

{$R *.dfm}

uses DateUtils, DM, AtrStrUtils;

procedure TfrmRequestDate.SetHouse(Value: Integer);
begin
  FHouse := Value;
  ChangeMonth(0);
end;

procedure TfrmRequestDate.SetType(Value: Integer);
begin
  FType := Value;
  ChangeMonth(0);
end;

function TfrmRequestDate.GetSelectedDate: TDate;
begin
  Result := EncodeDate(FYear, FMonth, FDay);
end;

constructor TfrmRequestDate.Create(AOwner: TComponent);
var
  GridLines: Integer;
begin
  inherited Create(AOwner);
  FHouse := -1;
  FDisabledDays := TStringList.Create();
  with sgCalendar do begin
    GridLines := 6 * GridLineWidth;
    DefaultColWidth := (Width - GridLines - 1) div 7;
    DefaultRowHeight := (Height - GridLines - 1) div 7;
    Cells[0, 0] := rsMon;
    Cells[1, 0] := rsTue;
    Cells[2, 0] := rsWed;
    Cells[3, 0] := rsThu;
    Cells[4, 0] := rsFri;
    Cells[5, 0] := rsSat;
    Cells[6, 0] := rsSun;
  end;
  DecodeDate(Now(), FYear, FMonth, FDay);
end;

procedure TfrmRequestDate.bbPrevClick(Sender: TObject);
begin
  ChangeMonth(-1);
end;

procedure TfrmRequestDate.ChangeMonth(const Value: Integer);
var
  sd: TDate;
  y, m, d: Word;
  s: string;
  st: string;
begin
  IncAMonth(FYear, FMonth, FDay, Value);
  sd := EncodeDate(FYear, FMonth, 1);
  FDisabledDays.Clear;
  if FHouse >= 0
  then
    with qBusyDays do begin
      // qBusyDays.ParamByName('FROM_DATE').AsDate := Today();
      // qBusyDays.ParamByName('TO_DATE').Clear;
      // qBusyDays.ParamByName('HOUSE_ID').AsDate  := FHouse;
      if FType = -1
      then st := 'null'
      else st := IntToStr(FType);
      s := 'select BUSY_DAY from GET_REQUEST_BUSY_DAYS(' + IntToStr(FHouse) + ', ' + DateTOFBdate(sd) + ', null, '
        + st + ')';
      qBusyDays.Sql.Text := s;
      Transaction.StartTransaction;
      ExecQuery;
      while not Eof do begin
        if not FieldByName('BUSY_DAY').IsNull
        then begin
          DecodeDate(FieldByName('BUSY_DAY').AsDate, y, m, d);
          FDisabledDays.Add(IntToStr(d));
        end;
        Next;
      end;
      Transaction.Commit;
      Close;
    end;
  pnlInfo.Caption := FormatDateTime('mmmm, yyyy', EncodeDate(FYear, FMonth, 1));
  UpdateCalendar;
  actPrevMon.Enabled := not(EncodeDate(FYear, FMonth, 1) < Today);
end;

procedure TfrmRequestDate.UpdateCalendar;
var
  j, i, vC, vR: Integer;
  FirstDate: TDateTime;
  MonthOffset: Integer;
  SRect: TGridRect;
begin
  with sgCalendar do begin
    for i := 1 to RowCount - 1 do begin
      Rows[i].Clear;
      for j := 0 to ColCount - 1 do Cells[j, i] := '';
    end;

    FirstDate := EncodeDate(FYear, FMonth, 1);
    i := DayOfWeek(FirstDate); { day of week for 1st of month }
    if 2 < i
    then MonthOffset := i - 3
    else MonthOffset := 4 + i;
    vR := 1;
    for i := 1 to DaysInMonth(FirstDate) do begin
      vC := (i + MonthOffset) mod 7;
      if (vC = 0)
      then inc(vR);
      Cells[vC, vR] := IntToStr(i);
    end;
    i := -1;
    j := -1;
    for vR := 1 to 6 do
      for vC := 0 to 7 do
        if (i = -1)
        then
          if (Cells[vC, vR] <> '')
          then
            if (FDisabledDays.IndexOf(Cells[vC, vR]) = -1)
            then
              if (EncodeDate(FYear, FMonth, StrToInt(Cells[vC, vR])) >= Today())
              then begin
                i := vC;
                j := vR;
              end;
  end;
  if i > -1
  then begin
    sgCalendar.Row := j; { Устанавливаем Row/Col }
    sgCalendar.Col := i;
    SRect.Top := j; { Определяем выбранную область }
    SRect.Left := i;
    SRect.Bottom := j;
    SRect.Right := i;
    sgCalendar.Selection := SRect; { Устанавливаем выбор }
  end;

end;

procedure TfrmRequestDate.sgCalendarDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  TheText: string;
  OldColor: TColor;
begin
  with sgCalendar do begin
    OldColor := Canvas.Font.Color;
    TheText := Cells[ACol, ARow];
    if not(gdSelected in State)
    then
      if FDisabledDays.IndexOf(TheText) > -1
      then Canvas.Font.Color := clGrayText
      else begin
        Canvas.Font.Style := [fsBold];
        if ACol >= 5
        then Canvas.Font.Color := clRed;
      end
    else begin
      Canvas.Brush.Color := clHighlight;
      Canvas.Font.Color := clHighlightText;

    end;
    with Rect, Canvas do begin
      TextRect(Rect, Left + (Right - Left - TextWidth(TheText)) div 2, Top + (Bottom - Top - TextHeight(TheText))
        div 2, TheText);
    end;
    Canvas.Font.Color := OldColor;
  end;

end;

procedure TfrmRequestDate.sgCalendarSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
  TheText: String;
begin
  TheText := (Sender as TStringGrid).Cells[ACol, ARow];
  if (TheText = '') or (FDisabledDays.IndexOf(TheText) > -1) or (EncodeDate(FYear, FMonth, StrToInt(TheText)) < Today())
  then CanSelect := False
  else begin
    FDay := StrToInt(TheText);
    CanSelect := True;
  end;
end;

destructor TfrmRequestDate.Destroy;
begin
  inherited Destroy;
  FreeAndNil(FDisabledDays);
end;

procedure TfrmRequestDate.FrameResize(Sender: TObject);
var
  GridLines: Integer;
begin
  GridLines := 6 * sgCalendar.GridLineWidth;
  sgCalendar.DefaultColWidth := (pnlGrid.ClientWidth - GridLines - 2) div 7;
  sgCalendar.DefaultRowHeight := (pnlGrid.ClientHeight - pnlInfo.Height - GridLines) div 7;
end;

procedure TfrmRequestDate.actPrevMonExecute(Sender: TObject);
begin
  ChangeMonth(-1);
end;

procedure TfrmRequestDate.actNextMonExecute(Sender: TObject);
begin
  ChangeMonth(1);
end;

end.
