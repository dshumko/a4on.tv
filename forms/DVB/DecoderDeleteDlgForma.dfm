object DecoderDeleteDlg: TDecoderDeleteDlg
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1076#1077#1082#1086#1076#1077#1088#1072' '#1091' '#1072#1073#1086#1085#1077#1085#1090#1072
  ClientHeight = 128
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  DesignSize = (
    338
    128)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TButton
    Left = 6
    Top = 84
    Width = 238
    Height = 35
    Anchors = [akRight, akBottom]
    Caption = #1059#1076#1072#1083#1080#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TButton
    Left = 255
    Top = 84
    Width = 75
    Height = 35
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 338
    Height = 39
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lblState: TLabel
      Left = 6
      Top = 14
      Width = 74
      Height = 13
      Caption = 'C'#1090#1072#1090#1091#1089' '#1082#1072#1088#1090#1099' '
    end
    object cbbState: TDBComboBoxEh
      Left = 184
      Top = 11
      Width = 146
      Height = 21
      DynProps = <>
      EditButtons = <>
      Items.Strings = (
        #1053#1072' '#1089#1082#1083#1072#1076#1077
        #1059#1090#1077#1088#1103#1085'/'#1057#1087#1080#1089#1072#1085
        #1056#1077#1084#1086#1085#1090
        #1059#1076#1072#1083#1077#1085)
      KeyItems.Strings = (
        '1'
        '3'
        '4'
        '0')
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
  end
  object pnlSTB: TPanel
    Left = 0
    Top = 39
    Width = 338
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lblSTB: TLabel
      Left = 6
      Top = 9
      Width = 57
      Height = 13
      Caption = 'C'#1090#1072#1090#1091#1089' STB'
    end
    object cbSTB: TDBComboBoxEh
      Left = 184
      Top = 6
      Width = 146
      Height = 21
      DynProps = <>
      EditButtons = <>
      Items.Strings = (
        #1053#1072' '#1089#1082#1083#1072#1076#1077
        #1059#1090#1077#1088#1103#1085'/'#1057#1087#1080#1089#1072#1085
        #1056#1077#1084#1086#1085#1090
        #1059#1076#1072#1083#1077#1085)
      KeyItems.Strings = (
        '1'
        '3'
        '4'
        '0')
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
  end
end
