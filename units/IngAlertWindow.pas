unit IngAlertWindow;

interface

uses
  Winapi.Windows,
  System.SysUtils, System.Classes, System.Types,
  Vcl.Controls, Vcl.Graphics, Vcl.Forms, Vcl.ExtCtrls;

type

  TPopupLocation = (plLeft, plRight);
  TAlertDirection = (adNone, adUp, adDown);
  TBackgroundStyle = (bgsAuto, bgsSolid, bgsVerticalGradient, bgsHorizontalGradient);
  TVerticalAlignment = (taAlignTop, taAlignBottom, taVerticalCenter);
  TWrapKind = (wkNone, wkEllipsis, wkPathEllipsis, wkWordWrap);

  TIngAlertWindow = class(TCustomControl)
  private
    fAlertDirection: TAlertDirection;
    fAlignment: TAlignment;
    fBackgroundStyle: TBackgroundStyle;
    fBorderColor: TColor;
    fCloseDelay: Cardinal;
    fCloseTimer: TTimer;
    fColor: TColor;
    fHeaderColor: TColor;
    fHeaderBackgroundStyle: TBackgroundStyle;
    fHeaderFont: TFont;
    fHeaderSize: Byte;
    fHeaderText: WideString;
    fHeaderToColor: TColor;
    fOnClose: TNotifyEvent;
    fOnPopup: TNotifyEvent;
    fPopupLocation: TPopupLocation;
    fText: WideString;
    fToColor: TColor;
    fVerticalAlignment: TVerticalAlignment;
    fWordWrap: Boolean;
    procedure DrawFmtText(Canvas: TCanvas; TextRect: TRect; Value: WideString;
    Alignment: TAlignment; VerticalAlignment: TVerticalAlignment;
    WrapKind: TWrapKind; BiDiMode: TBiDiMode; Disabled: Boolean = False);
    procedure DrawGradient(ACanvas: TCanvas; ARect: TRect; AHoricontal: Boolean; AFromColor, AToColor: TColor);
    procedure DrawHeader(Rect: TRect); virtual;
    procedure DrawHeaderContent(Rect: TRect); virtual;
    procedure DrawMessage(Rect: TRect); virtual;
    procedure DrawMessageContent(Rect: TRect); virtual;
    procedure DrawTextRect(Canvas: TCanvas; ARect: TRect; Text: WideString;
    BidiMode: TBiDiMode = bdLeftToRight);
    function GetHeaderRect: TRect;
    function GetTextRect: TRect;
    function Lighten(C: TColor; Amount: Integer): TColor;
    procedure SetHeaderSize(const Value: Byte);
    procedure SetHeaderText(const Value: WideString);
    procedure SetCloseDelay(const Value: Cardinal);
    procedure SetBackgroundStyle(const Value: TBackgroundStyle);
    procedure SetHeaderBackgroundStyle(const Value: TBackgroundStyle);
    procedure SetAlignment(const Value: TAlignment);
    procedure SetHeaderFont(const Value: TFont);
    procedure SetText(const Value: WideString);
    procedure SetVerticalAlignment(const Value: TVerticalAlignment);
    procedure SetWordWrap(const Value: Boolean);
    procedure SetColor(const Value: TColor);
    procedure SetHeaderColor(const Value: TColor);
    procedure SetHeaderToColor(const Value: TColor);
    procedure SetToColor(const Value: TColor);
    procedure SetBorderColor(const Value: TColor);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DoCloseTimer(Sender: TObject);
  public
    procedure Close;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DoClosed; dynamic;
    procedure DoPopup; dynamic;
    procedure Paint; override;
    procedure Popup; overload;
    procedure Popup(const Text: WideString; CloseDelay: Cardinal = 0); overload;
  published
    property Alignment: TAlignment read fAlignment write SetAlignment default taCenter;
    property BackgroundStyle: TBackgroundStyle read fBackgroundStyle write SetBackgroundStyle default bgsAuto;
    property BiDiMode;
    property BorderColor: TColor read fBorderColor write SetBorderColor default clActiveCaption;
    property CloseDelay: Cardinal read fCloseDelay write SetCloseDelay default 0;
    property Color: TColor read fColor write SetColor default clWindow;
    property Font;
    property HeaderBackgroundStyle: TBackgroundStyle read fHeaderBackgroundStyle write SetHeaderBackgroundStyle default bgsAuto;
    property HeaderColor: TColor read fHeaderColor write SetHeaderColor default clActiveCaption;
    property HeaderFont: TFont read fHeaderFont write SetHeaderFont;
    property HeaderSize: Byte read fHeaderSize write SetHeaderSize default 18;
    property HeaderToColor: TColor read fHeaderToColor write SetHeaderToColor default clGradientActiveCaption;
    property HeaderText: WideString read fHeaderText write SetHeaderText;
    property OnClick;
    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnDblClick;
    property OnPopup: TNotifyEvent read FOnPopup write FOnPopup;
    property PopupLocation: TPopupLocation read fPopupLocation write fPopupLocation default plRight;
    property Showing;
    property Text: WideString read fText write SetText;
    property ToColor: TColor read fToColor write SetToColor default clBtnFace;
    property VerticalAlignment: TVerticalAlignment read fVerticalAlignment write SetVerticalAlignment default taVerticalCenter;
		property WordWrap: Boolean read fWordWrap write SetWordWrap default false;
  end;

procedure Register;

var
  IsUnicodeSupported: Boolean;

implementation

procedure Register;
begin
  RegisterComponents('Standard', [TIngAlertWindow]);
end;

{ TIngAlertWindow }

function TIngAlertWindow.Lighten(C: TColor; Amount: Integer): TColor;
var
  R, G, B: Integer;
begin
  if C < 0 then
    C := GetSysColor(C and $000000FF);
  R := C and $FF + Amount;
  G := C shr 8 and $FF + Amount;
  B := C shr 16 and $FF + Amount;
  if R < 0 then
    R := 0
  else
    if R > 255 then
      R := 255;
  if G < 0 then
    G := 0
  else
    if G > 255 then
      G := 255;
  if B < 0 then
    B := 0
  else
    if B > 255 then
      B := 255;
  Result := R or (G shl 8) or (B shl 16);
end;

{procedure DrawGradient(ACanvas: TCanvas; ARect: TRect;
  AHoricontal: Boolean; AColors: array of TColor);
type
  RGBArray = array[0..2] of Byte;
var
  merkp: TColor;
  merks: TPenStyle;
  merkw: integer;
  x, y, z, stelle, mx, bis, faColorsh, mass, x1, x2, y1, y2: Integer;
  Faktor: Double;
  A: RGBArray;
  B: array of RGBArray;
begin
  mx := High(AColors);
  if mx < 1 then
  begin
    if mx = 0 then
    begin
      ACanvas.Brush.Color := AColors[0];
      ACanvas.FillRect(ARect);
    end;
    Exit;
  end;

  if AHoricontal then
    mass := ARect.Right - ARect.Left
  else
    mass := ARect.Bottom - ARect.Top;
  SetLength(b, mx + 1);
  for x := 0 to mx do
  begin
    AColors[x] := ColorToRGB(AColors[x]);
    b[x][0] := GetRValue(AColors[x]);
    b[x][1] := GetGValue(AColors[x]);
    b[x][2] := GetBValue(AColors[x]);
  end;
  merkw := ACanvas.Pen.Width;
  merks := ACanvas.Pen.Style;
  merkp := ACanvas.Pen.Color;
  ACanvas.Pen.Width := 1;
  ACanvas.Pen.Style := psSolid;
  faColorsh := Round(mass / mx);
  x1 := ARect.Left;
  x2 := ARect.Right;
  y1 := ARect.Top;
  y2 := ARect.Bottom;
  for y := 0 to mx - 1 do
  begin
    if y = mx - 1 then
      bis := mass - y * faColorsh - 1
    else
      bis := faColorsh;
    for x := 0 to bis do
    begin
      Stelle := x + y * faColorsh;
      faktor := x / bis;
      for z := 0 to 3 do
        a[z] := Trunc(b[y][z] + ((b[y + 1][z] - b[y][z]) * Faktor));
      ACanvas.Pen.Color := RGB(a[0], a[1], a[2]);
      if AHoricontal then
      begin
        x1 := ARect.Left + Stelle;
        x2 := ARect.Left + Stelle;
      end
      else
      begin
        y1 := ARect.Top + Stelle;
        y2 := ARect.Top + Stelle;
      end;
      ACanvas.MoveTo(x1, y1);
      ACanvas.LineTo(x2, y2);
    end;
  end;
  b := nil;
  ACanvas.Pen.Width := merkw;
  ACanvas.Pen.Style := merks;
  ACanvas.Pen.Color := merkp;
end;}

procedure TIngAlertWindow.DrawGradient(ACanvas: TCanvas; ARect: TRect;
  AHoricontal: Boolean; AFromColor, AToColor: TColor);
var
  i, n, x1, x2, y1, y2: Integer;
  Faktor: Double;
  StartRGB, EndRGB: array[0..2] of Byte;
begin
  if AHoricontal then
    n := ARect.Right - ARect.Left - 1 else
    n := ARect.Bottom - ARect.Top - 1;

  AFromColor := ColorToRGB(AFromColor);
  AToColor := ColorToRGB(AToColor);

  StartRGB[0] := GetRValue(AFromColor);
  StartRGB[1] := GetGValue(AFromColor);
  StartRGB[2] := GetBValue(AFromColor);

  EndRGB[0] := GetRValue(AToColor);
  EndRGB[1] := GetGValue(AToColor);
  EndRGB[2] := GetBValue(AToColor);

  ACanvas.Pen.Width := 1;
  ACanvas.Pen.Style := psSolid;

  x1 := ARect.Left;
  x2 := ARect.Right;
  y1 := ARect.Top;
  y2 := ARect.Bottom;

  if AHoricontal then
    for i := 0 to n do
    begin
      Faktor := i / n;
      ACanvas.Pen.Color :=
        RGB(
          Trunc(StartRGB[0] + ((EndRGB[0] - StartRGB[0]) * Faktor)),
          Trunc(StartRGB[1] + ((EndRGB[1] - StartRGB[1]) * Faktor)),
          Trunc(StartRGB[2] + ((EndRGB[2] - StartRGB[2]) * Faktor))
        );
      x1 := ARect.Left + i;
      ACanvas.MoveTo(x1, y1);
      ACanvas.LineTo(x1, y2);
    end else
    for i := 0 to n do
    begin
      Faktor := i / n;
      ACanvas.Pen.Color :=
        RGB(
          Trunc(StartRGB[0] + ((EndRGB[0] - StartRGB[0]) * Faktor)),
          Trunc(StartRGB[1] + ((EndRGB[1] - StartRGB[1]) * Faktor)),
          Trunc(StartRGB[2] + ((EndRGB[2] - StartRGB[2]) * Faktor))
        );
      y1 := ARect.Top + i;
      ACanvas.MoveTo(x1, y1);
      ACanvas.LineTo(x2, y1);
    end;
end;

constructor TIngAlertWindow.Create(AOwner: TComponent);
begin
  inherited;
  Visible := csDesigning in ComponentState;
  Width := 210;
  Height := 140;
  fAlertDirection := adDown;
  fPopupLocation := plRight;
  fBorderColor := clActiveCaption;

  fCloseTimer := TTimer.Create(Self);
  fCloseTimer.Enabled := false;
  fCloseTimer.OnTimer := DoCloseTimer;
  fCloseDelay := 0;
  
  fHeaderText := 'Внимание';
  fHeaderColor := clActiveCaption;
  fHeaderToColor := clGradientActiveCaption;
  fHeaderFont := TFont.Create;
  fHeaderFont.Style := [fsBold];
  fHeaderBackgroundStyle := bgsAuto;
  fHeaderSize := 18;

  fText := 'Сообщение';
  fColor := clWindow;
  fToColor := clBtnFace;
  fBackgroundStyle := bgsAuto;
  fVerticalAlignment := taVerticalCenter;
  fAlignment := taCenter;

  fWordWrap := false;
end;

procedure TIngAlertWindow.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    if not (csDesigning in ComponentState) then
    begin
      WndParent := GetDesktopWindow;
      Style := WS_CLIPSIBLINGS or WS_CHILD;
      ExStyle := WS_EX_TOPMOST or WS_EX_TOOLWINDOW;
      WindowClass.Style := CS_DBLCLKS or CS_SAVEBITS and not (CS_HREDRAW or CS_VREDRAW);
    end;
end;

procedure TIngAlertWindow.CreateWnd;
begin
  inherited;

end;

destructor TIngAlertWindow.Destroy;
begin
  fCloseTimer.Enabled := false;
  fCloseTimer.FreeAndNil;
  fHeaderFont.FreeAndNil;

  inherited;
end;

procedure TIngAlertWindow.Paint;
var
  BorderRect: TRect;
begin
  BorderRect := ClientRect;
  BorderRect.Bottom := Height;
  Canvas.Brush.Color := fBorderColor;

  Canvas.FrameRect(BorderRect);
  InflateRect(BorderRect, -1, -1);
  Canvas.Brush.Color := clWhite;
  Canvas.FrameRect(BorderRect);

  DrawHeader(GetHeaderRect);
  DrawHeaderContent(GetHeaderRect);
  DrawMessage(Rect(1, fHeaderSize + 1, ClientWidth - 1, Height - 1));
  DrawMessageContent(Rect(1, fHeaderSize + 1, ClientWidth - 1, Height - 1));
end;

procedure TIngAlertWindow.Popup;
var
  X, Y, i, Delta, YD: Integer;
begin
  X := Screen.WorkAreaLeft;
  Y := 0;
  ShowWindow(Handle, SW_HIDE);
  if fPopupLocation = plRight then
    X := Screen.WorkAreaWidth - Width;
  case fAlertDirection of
    adDown: Y := Screen.WorkAreaHeight - Height;
    adNone: ;
    adUp: Y := Screen.WorkAreaTop;
  end;
  Delta := Height div 10;
  YD := 0;
  for i := 0 to 10 do
  begin
    case fAlertDirection of
      adDown: YD := Y + Height - Delta * i;
      adUp: YD := Y - Height + Delta * i;
    end;
    SetWindowPos(Handle, HWND_TOPMOST, X, YD, Width, Height, SWP_SHOWWINDOW);
    Repaint;
    Sleep(1);
  end;
  SetWindowPos(Handle, HWND_TOPMOST, X, Y, Width, Height, SWP_SHOWWINDOW);
  fCloseTimer.Enabled := (fCloseDelay > 0);
end;

procedure TIngAlertWindow.SetHeaderSize(const Value: Byte);
begin
  fHeaderSize := Value;
  Invalidate;
end;

function TIngAlertWindow.GetHeaderRect: TRect;
begin
  Result := Rect(1, 1, ClientWidth - 1, 2 + fHeaderSize);
end;

function TIngAlertWindow.GetTextRect: TRect;
begin
  Result := Rect(1, fHeaderSize + 1, ClientWidth - 2, ClientHeight - 2);
  with Result do
  begin
    Left := 12;
    Top := 7 + fHeaderSize;
    Right := ClientWidth - 12;
    Bottom := Height - 6;
  end;
end;

procedure TIngAlertWindow.DrawHeader(Rect: TRect);
var
  PaintRect: TRect;
begin
  PaintRect := Rect;
  Dec(PaintRect.Bottom, 1);
  case fHeaderBackgroundStyle of
    bgsSolid: DrawGradient(Canvas, PaintRect, false, fHeaderColor, fHeaderColor);
    bgsAuto, bgsVerticalGradient, bgsHorizontalGradient: DrawGradient(Canvas, PaintRect, (fHeaderBackgroundStyle = bgsHorizontalGradient), fHeaderColor, fHeaderToColor);
  end;
  Canvas.Pen.Color := fHeaderColor;
  Canvas.Polyline([Point(1, PaintRect.Bottom - 2), Point(ClientWidth - 1, PaintRect.Bottom - 2)]);
  Canvas.Pen.Color := fHeaderToColor;
  Canvas.Polyline([Point(1, PaintRect.Bottom - 1), Point(ClientWidth - 1, PaintRect.Bottom - 1)]);
end;

procedure TIngAlertWindow.DrawTextRect(Canvas: TCanvas; ARect: TRect; Text: WideString;
  BidiMode: TBiDiMode = bdLeftToRight);
var
  Flags: Integer;
  StringText: string;
begin
  Flags := DT_NOPREFIX or	DT_VCENTER or DT_END_ELLIPSIS or DT_EXTERNALLEADING or DT_SINGLELINE or DT_LEFT;
  if BidiMode = bdRightToLeft then Flags := Flags or DT_RTLREADING;
  Canvas.Brush.Style := bsClear;
  if IsUnicodeSupported then
    DrawTextW(Canvas.Handle, PWideChar(Text), Length(Text), ARect, Flags) else
    begin
      StringText := Text;
      Windows.DrawText(Canvas.Handle, PAnsiChar(StringText), Length(StringText), ARect, Flags);
    end;
  Canvas.Brush.Style := bsSolid;
end;

procedure TIngAlertWindow.DrawFmtText(Canvas: TCanvas; TextRect: TRect; Value: WideString; Alignment: TAlignment;
  VerticalAlignment: TVerticalAlignment; WrapKind: TWrapKind; BiDiMode: TBiDiMode; Disabled: Boolean = False);
var
  Flags: Integer;
  R: TRect;
  StringText: string;
begin
  R := TextRect;
  Flags := DT_NOPREFIX; { don't replace & char }
  with Canvas do
  begin
    case WrapKind of
      wkNone: Flags := Flags or DT_SINGLELINE;
      wkEllipsis: Flags := Flags or DT_END_ELLIPSIS or DT_SINGLELINE;
      wkPathEllipsis: Flags := Flags or DT_PATH_ELLIPSIS;
      wkWordWrap: Flags := Flags or DT_WORDBREAK;
    end;
    case Alignment of
      taLeftJustify: Flags := Flags or DT_LEFT;
      taRightJustify: Flags := Flags or DT_RIGHT;
      taCenter: Flags := Flags or DT_CENTER;
    end;
    case VerticalAlignment of
      taAlignTop: Flags := Flags or DT_TOP;
      taVerticalCenter: Flags := Flags or DT_VCENTER;
      taAlignBottom: Flags := Flags or DT_BOTTOM;
    end;
    
    if BiDiMode <> bdLeftToRight then
      Flags := Flags or DT_RTLREADING;
    
    Brush.Style := bsClear;
    if IsUnicodeSupported then
    begin
      if Disabled then
      begin
        OffsetRect(R, 1, 1);
        Font.Color := clBtnHighlight;
      end;
      DrawTextW(Canvas.Handle, PWideChar(Value), Length(Value), R, Flags);
      if Disabled then
      begin
        OffsetRect(R, -1, -1);
        Font.Color := clBtnShadow;
        DrawTextW(Canvas.Handle, PWideChar(Value), Length(Value), R, Flags);
      end;
    end else
    begin
      StringText := Value;
      Windows.DrawText(Canvas.Handle, PAnsiChar(StringText), Length(StringText), R, Flags);
    end;
    Brush.Style := Graphics.bsSolid;
  end;
end;

procedure TIngAlertWindow.DrawHeaderContent(Rect: TRect);
begin
  Canvas.Font.Assign(fHeaderFont);
  DrawTextRect(Canvas, Types.Rect(4, 1, ClientWidth, fHeaderSize), fHeaderText, BiDiMode);
end;

procedure TIngAlertWindow.SetHeaderText(const Value: WideString);
begin
  fHeaderText := Value;
  Invalidate;
end;

procedure TIngAlertWindow.Close;
begin
  DoClosed;
end;

procedure TIngAlertWindow.DoCloseTimer(Sender: TObject);
begin
  DoClosed;
end;

procedure TIngAlertWindow.SetCloseDelay(const Value: Cardinal);
begin
  fCloseDelay := Value;
  fCloseTimer.Interval := fCloseDelay;
end;

procedure TIngAlertWindow.DrawMessage(Rect: TRect);
var
  PaintRect: TRect;
begin
  PaintRect := Rect;
  case fBackgroundStyle of
    bgsSolid: DrawGradient(Canvas, PaintRect, false, fColor, fColor);
    bgsAuto, bgsVerticalGradient, bgsHorizontalGradient: DrawGradient(Canvas, PaintRect, (fBackgroundStyle = bgsHorizontalGradient), fColor, fToColor);
  end;
end;

procedure TIngAlertWindow.DrawMessageContent(Rect: TRect);
var
  WrapKind: TWrapKind;
begin
  Canvas.Font.Assign(Self.Font);
  if WordWrap then
    WrapKind := wkWordWrap else
    WrapKind := wkNone;
  DrawFmtText(Canvas, GetTextRect, Text, Alignment, VerticalAlignment, WrapKind, BiDiMode);
end;

procedure TIngAlertWindow.SetBackgroundStyle(const Value: TBackgroundStyle);
begin
  fBackgroundStyle := Value;
  if Value = bgsAuto then
  begin
    Color := clWindow;
    ToColor := clBtnFace;
  end;
  Invalidate;
end;

procedure TIngAlertWindow.SetHeaderBackgroundStyle(const Value: TBackgroundStyle);
begin
  fHeaderBackgroundStyle := Value;
  if Value = bgsAuto then
  begin
    HeaderColor := clActiveCaption;
    HeaderToColor := clGradientActiveCaption;
  end;
  Invalidate;
end;

procedure TIngAlertWindow.SetAlignment(const Value: TAlignment);
begin
  FAlignment := Value;
  Invalidate;
end;

procedure TIngAlertWindow.SetHeaderFont(const Value: TFont);
begin
  fHeaderFont.Assign(Value);
  Repaint;
end;

procedure TIngAlertWindow.SetText(const Value: WideString);
begin
  FText := Value;
  Invalidate;
end;

procedure TIngAlertWindow.SetVerticalAlignment(
  const Value: TVerticalAlignment);
begin
  fVerticalAlignment := Value;
  Invalidate;
end;

procedure TIngAlertWindow.SetWordWrap(const Value: Boolean);
begin
  fWordWrap := Value;
  Invalidate;
end;

procedure TIngAlertWindow.DoPopup;
begin
  if Assigned(fOnPopup) then
    fOnPopup(Self);
end;

procedure TIngAlertWindow.DoClosed;
begin
  fCloseTimer.Enabled := False;
  ShowWindow(Handle, SW_HIDE);
  if Assigned(fOnClose) then
    fOnClose(Self);
end;

procedure TIngAlertWindow.Popup(const Text: WideString; CloseDelay: Cardinal);
begin
  if Text <> '' then
    fText := Text;
  fCloseDelay := CloseDelay;
  Popup;
end;

procedure TIngAlertWindow.SetColor(const Value: TColor);
begin
  fColor := Value;
  Invalidate;
end;

procedure TIngAlertWindow.SetHeaderColor(const Value: TColor);
begin
  fHeaderColor := Value;
  Invalidate;
end;

procedure TIngAlertWindow.SetHeaderToColor(const Value: TColor);
begin
  fHeaderToColor := Value;
  Invalidate;
end;

procedure TIngAlertWindow.SetToColor(const Value: TColor);
begin
  fToColor := Value;
  Invalidate;
end;

procedure TIngAlertWindow.SetBorderColor(const Value: TColor);
begin
  fBorderColor := Value;
  Invalidate;
end;

end.

