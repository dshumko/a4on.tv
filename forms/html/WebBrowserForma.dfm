object WebBrowserForm: TWebBrowserForm
  Left = 0
  Top = 0
  Caption = #1050#1072#1088#1090#1072' '#1087#1086#1082#1088#1099#1090#1080#1103
  ClientHeight = 493
  ClientWidth = 831
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object WkeWebBrowser1: TWkeWebbrowser
    Left = 0
    Top = 0
    Width = 831
    Height = 493
    Align = alClient
    Color = clWhite
    Taborder = 0
    UserAgent = 'miniblink A4on.TV'
    CspEnabled = True
    Headless = False
    TouchEnabled = False
    DragEnabled = False
  end
end
