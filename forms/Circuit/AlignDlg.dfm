object AlignDialog: TAlignDialog
  ShowHint = True
  Left = 192
  Top = 160
  BorderStyle = bsDialog
  Caption = #1042#1099#1088#1072#1074#1085#1080#1074#1072#1085#1080#1077
  ClientHeight = 222
  ClientWidth = 312
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
  object Horz: TRadioGroup
    Left = 8
    Top = 8
    Width = 145
    Height = 169
    Caption = ' '#1055#1086' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1080' '
    ItemIndex = 0
    Items.Strings = (
      #1053#1077' '#1084#1077#1085#1103#1090#1100
      #1055#1086' '#1083#1077#1074#1086#1084#1091' '#1082#1088#1072#1102
      #1055#1086' '#1094#1077#1085#1090#1088#1091
      #1055#1086' '#1087#1088#1072#1074#1086#1084#1091' '#1082#1088#1072#1102
      #1042#1099#1088#1086#1074#1085#1103#1090#1100)
    TabOrder = 2
  end
  object Vert: TRadioGroup
    Left = 160
    Top = 8
    Width = 145
    Height = 169
    Caption = ' '#1055#1086' '#1074#1077#1088#1090#1080#1082#1072#1083#1080' '
    ItemIndex = 0
    Items.Strings = (
      #1053#1077' '#1084#1077#1085#1103#1090#1100
      #1055#1086' '#1074#1077#1088#1093#1085#1077#1081' '#1075#1088#1072#1085#1080#1094#1077
      #1055#1086' '#1094#1077#1085#1090#1088#1091
      #1055#1086' '#1085#1080#1078#1085#1077#1081' '#1075#1088#1072#1085#1080#1094#1077
      #1042#1099#1088#1086#1074#1085#1103#1090#1100)
    TabOrder = 3
  end
  object btnOK: TButton
    Left = 8
    Top = 187
    Width = 219
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 230
    Top = 187
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
end
