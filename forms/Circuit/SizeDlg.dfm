object SizeDialog: TSizeDialog
  ShowHint = True
  Left = 192
  Top = 160
  BorderStyle = bsDialog
  Caption = #1056#1072#1079#1084#1077#1088
  ClientHeight = 160
  ClientWidth = 360
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
    Width = 165
    Height = 110
    Caption = ' '#1055#1086' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1080' '
    ItemIndex = 0
    Items.Strings = (
      #1053#1077' '#1080#1079#1084#1077#1085#1103#1090#1100
      #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1076#1086' '#1084#1077#1085#1100#1096#1077#1075#1086
      #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1076#1086' '#1073#1086#1083#1100#1096#1077#1075#1086)
    TabOrder = 2
  end
  object Vert: TRadioGroup
    Left = 185
    Top = 8
    Width = 165
    Height = 110
    Caption = ' '#1055#1086' '#1074#1077#1088#1090#1080#1082#1072#1083#1080' '
    ItemIndex = 0
    Items.Strings = (
      #1053#1077' '#1080#1079#1084#1077#1085#1103#1090#1100
      #1059#1084#1077#1085#1100#1096#1080#1090#1100' '#1076#1086' '#1084#1077#1085#1100#1096#1077#1075#1086
      #1059#1074#1077#1083#1080#1095#1080#1090#1100' '#1076#1086' '#1073#1086#1083#1100#1096#1077#1075#1086)
    TabOrder = 3
  end
  object btnOK: TButton
    Left = 185
    Top = 126
    Width = 84
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 275
    Top = 126
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
end
