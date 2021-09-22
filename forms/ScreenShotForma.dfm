object ScreenShotForm: TScreenShotForm
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1057#1085#1080#1084#1086#1082' '#1101#1082#1088#1072#1085#1072' '#1076#1086' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1103' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 366
  ClientWidth = 584
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      584
      32)
    object lblInfo: TLabel
      Left = 11
      Top = 6
      Width = 35
      Height = 16
      Caption = 'lblInfo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btn1: TButton
      Left = 505
      Top = 3
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
    end
  end
  object scrlbx: TScrollBox
    Left = 0
    Top = 32
    Width = 584
    Height = 334
    Align = alClient
    TabOrder = 1
    object imgScreen: TImage
      Left = 0
      Top = 0
      Width = 900
      Height = 1600
      AutoSize = True
    end
  end
end
