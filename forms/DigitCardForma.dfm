object DigitCardForm: TDigitCardForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1062#1080#1092#1088#1072
  ClientHeight = 231
  ClientWidth = 353
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  DesignSize = (
    353
    231)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 11
    Width = 84
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1076#1077#1082#1086#1076#1077#1088#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 8
    Top = 38
    Width = 52
    Height = 13
    Caption = #1053#1086#1084#1077#1088' STB'
  end
  object lbl2: TLabel
    Left = 8
    Top = 119
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object lbl3: TLabel
    Left = 8
    Top = 65
    Width = 54
    Height = 13
    Caption = #1052#1086#1076#1077#1083#1100' TV'
  end
  object lbl5: TLabel
    Left = 8
    Top = 92
    Width = 66
    Height = 13
    Caption = #1055#1088#1086#1096#1080#1074#1082#1072' TV'
  end
  object edtNumber: TDBEditEh
    Left = 98
    Top = 8
    Width = 247
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088' '#1076#1077#1082#1086#1076#1077#1088#1072
    MaxLength = 20
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnEnter = edtNumberEnter
    OnExit = edtNumberExit
  end
  object mmoNotice: TDBMemoEh
    Left = 8
    Top = 135
    Width = 337
    Height = 61
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    MaxLength = 1000
    ShowHint = True
    TabOrder = 4
    Visible = True
    WantReturns = True
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 202
    Width = 254
    Height = 23
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 270
    Top = 202
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 6
    OnClick = btnCancelClick
  end
  object edtSTB: TDBEditEh
    Left = 98
    Top = 35
    Width = 247
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088' STB ('#1077#1089#1083#1080' '#1077#1089#1090#1100')'
    MaxLength = 20
    ShowHint = True
    TabOrder = 1
    Visible = True
    OnEnter = edtSTBEnter
    OnExit = edtSTBExit
  end
  object edtTV: TDBEditEh
    Left = 98
    Top = 62
    Width = 247
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1052#1086#1076#1077#1083#1100' '#1058#1042
    MaxLength = 50
    ShowHint = True
    TabOrder = 2
    Visible = True
    OnEnter = edtSTBEnter
    OnExit = edtSTBExit
  end
  object edtTVSoft: TDBEditEh
    Left = 98
    Top = 89
    Width = 247
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1086#1096#1080#1074#1082#1072' '#1058#1042
    MaxLength = 50
    ShowHint = True
    TabOrder = 3
    Visible = True
    OnEnter = edtSTBEnter
    OnExit = edtSTBExit
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 128
    Top = 112
  end
end
