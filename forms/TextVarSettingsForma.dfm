object TextVarSettings: TTextVarSettings
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074' '#1090#1077#1082#1089#1090#1086#1074#1086#1081' '#1087#1077#1088#1077#1077#1085#1085#1086#1081
  ClientHeight = 130
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    304
    130)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 8
    Width = 65
    Height = 13
    Caption = #1058#1077#1082#1089#1090' '#1074' '#1087#1086#1083#1077
  end
  object lbl2: TLabel
    Left = 8
    Top = 35
    Width = 101
    Height = 13
    Caption = #1055#1086#1076#1089#1082#1072#1079#1082#1072' '#1074' '#1089#1090#1088#1086#1082#1077
  end
  object lbl3: TLabel
    Left = 8
    Top = 62
    Width = 49
    Height = 13
    Caption = #1055#1088#1074#1077#1082#1088#1082#1072
  end
  object edtName: TDBEditEh
    Left = 115
    Top = 5
    Width = 181
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1058#1077#1082#1089#1090' '#1074' '#1087#1086#1083#1077
    TabOrder = 0
    Visible = True
  end
  object edtRegexp: TDBEditEh
    Left = 115
    Top = 59
    Width = 181
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = 'reqExp '#1087#1088#1086#1074#1077#1088#1082#1072
    TabOrder = 2
    Visible = True
  end
  object edtPropmpt: TDBEditEh
    Left = 115
    Top = 32
    Width = 181
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1086#1076#1089#1082#1072#1079#1082#1072' '#1074' '#1089#1090#1088#1086#1082#1077' '#1080' '#1084#1077#1090#1082#1080
    TabOrder = 1
    Visible = True
  end
  object btn1: TButton
    Left = 8
    Top = 96
    Width = 207
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 221
    Top = 96
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
  end
end
