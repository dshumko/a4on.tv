object FormTetris: TFormTetris
  ShowHint = True
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Tetris 2D'
  ClientHeight = 369
  ClientWidth = 305
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object TimerFPS: TTimer
    Interval = 40
    OnTimer = TimerFPSTimer
    Left = 16
    Top = 16
  end
  object TimerGravity: TTimer
    Interval = 800
    OnTimer = TimerGravityTimer
    Left = 88
    Top = 16
  end
end
