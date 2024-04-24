object SmsQuestForm: TSmsQuestForm
  Left = 476
  Top = 214
  BorderStyle = bsDialog
  Caption = #1054#1090#1087#1088#1072#1074#1082#1072' SMS'
  ClientHeight = 130
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnKeyDown = FormKeyDown
  DesignSize = (
    359
    130)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 49
    Width = 239
    Height = 26
    Caption = 
      #1056#1072#1079#1073#1080#1090#1100' '#1086#1090#1087#1088#1072#1074#1082#1091' '#1085#1072' '#1087#1072#1095#1082#1080' '#1087#1086' '#1061' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1077#1081#13#10#1077#1089#1083#1080' '#1061'=0, '#1090#1086' '#1086#1090#1087#1088#1072#1074 +
      #1080#1090' '#1074#1089#1077' '#1086#1076#1085#1086#1081' '#1087#1072#1095#1082#1086#1081
  end
  object lblText: TLabel
    Left = 8
    Top = 8
    Width = 343
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    Caption = #1050' '#1086#1090#1087#1088#1072#1074#1082#1077' '#1061' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1077#1081' Y'
    ExplicitWidth = 360
  end
  object ednSmsCount: TDBNumberEditEh
    Left = 268
    Top = 51
    Width = 83
    Height = 21
    Anchors = [akTop, akRight]
    DynProps = <>
    EditButton.Visible = True
    EditButtons = <>
    ShowHint = True
    TabOrder = 0
    Value = 0.000000000000000000
    Visible = True
    OnChange = ednSmsCountChange
    ExplicitLeft = 285
  end
  object btnCancel: TBitBtn
    Left = 268
    Top = 99
    Width = 83
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
    ExplicitLeft = 321
    ExplicitTop = 155
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 99
    Width = 239
    Height = 23
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 1
    OnClick = btnOkClick
  end
end
