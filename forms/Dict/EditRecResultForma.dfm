object EditRecResultForm: TEditRecResultForm
  Left = 540
  Top = 390
  ActiveControl = edtName
  BorderIcons = [biSystemMenu]
  Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1086#1073#1088#1072#1097#1077#1085#1080#1103' / '#1079#1074#1086#1085#1082#1072
  ClientHeight = 194
  ClientWidth = 401
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnKeyUp = FormKeyUp
  DesignSize = (
    401
    194)
  PixelsPerInch = 96
  TextHeight = 13
  object lblResult: TLabel
    Left = 8
    Top = 12
    Width = 53
    Height = 13
    Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
  end
  object memNotice: TDBMemoEh
    Left = 8
    Top = 64
    Width = 385
    Height = 89
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 3
    Visible = True
    WantReturns = True
  end
  object chkBid: TDBCheckBoxEh
    Left = 67
    Top = 39
    Width = 150
    Height = 17
    Caption = #1057#1086#1079#1076#1072#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1091
    DynProps = <>
    TabOrder = 1
  end
  object chkTask: TCheckBox
    Left = 232
    Top = 39
    Width = 161
    Height = 17
    Caption = #1057#1086#1079#1076#1072#1074#1072#1090#1100' '#1079#1072#1076#1072#1095#1091
    TabOrder = 2
  end
  object btnOk: TBitBtn
    Left = 67
    Top = 163
    Width = 245
    Height = 23
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 318
    Top = 163
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
  object edtName: TDBEditEh
    Left = 72
    Top = 8
    Width = 321
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1072
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 35
    Top = 104
  end
end
