object distrPeriodForm: TdistrPeriodForm
  Left = 0
  Top = 0
  ActiveControl = edtSubject
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = #1056#1072#1089#1089#1099#1083#1082#1072' '#1072#1082#1090#1086#1074' '#1079#1072' '#1087#1077#1088#1080#1086#1076
  ClientHeight = 287
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    405
    287)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 11
    Top = 16
    Width = 38
    Height = 13
    Caption = #1055#1077#1088#1080#1086#1076
  end
  object cbMonth: TDBComboBoxEh
    Left = 52
    Top = 13
    Width = 239
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EmptyDataInfo.Text = #1052#1077#1089#1103#1094
    EditButtons = <>
    Items.Strings = (
      '1. '#1071#1085#1074#1072#1088#1100
      '2. '#1060#1077#1074#1088#1072#1083#1100
      '3. '#1052#1072#1088#1090
      '4. '#1040#1087#1088#1077#1083#1100
      '5. '#1052#1072#1081
      '6. '#1048#1102#1085#1100
      '7. '#1048#1102#1083#1100
      '8. '#1040#1074#1075#1091#1089#1090
      '9. '#1057#1077#1085#1090#1103#1073#1088#1100
      '10. '#1054#1082#1090#1103#1073#1088#1100
      '11. '#1053#1086#1103#1073#1088#1100
      '12. '#1044#1077#1082#1072#1073#1088#1100
      '')
    KeyItems.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8'
      '9'
      '10'
      '11'
      '12')
    TabOrder = 0
    Visible = True
  end
  object edtYear: TDBNumberEditEh
    Left = 303
    Top = 13
    Width = 94
    Height = 21
    Anchors = [akTop, akRight]
    DynProps = <>
    EmptyDataInfo.Text = #1043#1086#1076
    EditButtons = <>
    MaxValue = 2100.000000000000000000
    MinValue = 2010.000000000000000000
    TabOrder = 1
    Visible = True
  end
  object edtSubject: TDBEditEh
    Left = 11
    Top = 93
    Width = 386
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1087#1080#1089#1100#1084#1072
    TabOrder = 5
    Visible = True
  end
  object mmoBody: TDBMemoEh
    Left = 11
    Top = 120
    Width = 386
    Height = 128
    ScrollBars = ssBoth
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1058#1077#1082#1089#1090' '#1087#1080#1089#1100#1084#1072
    TabOrder = 6
    Visible = True
    WantReturns = True
  end
  object btnCancel: TButton
    Left = 325
    Top = 252
    Width = 72
    Height = 26
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 8
  end
  object btnOk: TButton
    Left = 11
    Top = 252
    Width = 308
    Height = 26
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1056#1072#1079#1086#1089#1083#1072#1090#1100
    Default = True
    TabOrder = 7
    OnClick = btnOkClick
  end
  object btnPrevMon: TButton
    Left = 52
    Top = 40
    Width = 109
    Height = 25
    Caption = '< '#1085#1072' '#1084#1077#1089#1103#1094' '#1088#1072#1085#1077#1077
    TabOrder = 2
    OnClick = btnPrevMonClick
  end
  object btnNextMonth: TButton
    Left = 182
    Top = 40
    Width = 109
    Height = 25
    Anchors = [akTop, akRight]
    Caption = #1085#1072' '#1084#1077#1089#1103#1094' '#1087#1086#1079#1078#1077' >'
    TabOrder = 3
    OnClick = btnNextMonthClick
  end
  object chkInFile: TDBCheckBoxEh
    Left = 52
    Top = 70
    Width = 248
    Height = 17
    Hint = #1041#1091#1076#1091#1090' '#1089#1092#1086#1088#1084#1080#1088#1086#1074#1072#1085#1099' '#1092#1072#1081#1083#1099', '#1085#1086' '#1085#1077' '#1088#1072#1079#1086#1089#1083#1072#1085#1099' '#1085#1072' email'
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1072#1082#1090#1099' '#1074' '#1092#1072#1081#1083' '#1080' '#1085#1077' '#1088#1072#1089#1089#1099#1083#1072#1090#1100
    DynProps = <>
    TabOrder = 4
  end
  object cnError: TCnErrorProvider
    DoubleBuffer = False
    Left = 116
    Top = 114
  end
end
