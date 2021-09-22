object ChangePwdForm: TChangePwdForm
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1057#1084#1077#1085#1072' '#1087#1072#1088#1086#1083#1103
  ClientHeight = 156
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  ShowHint = True
  OnShow = FormShow
  DesignSize = (
    261
    156)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 19
    Width = 78
    Height = 13
    Caption = #1057#1090#1072#1088#1099#1081' '#1087#1072#1088#1086#1083#1100
  end
  object lbl2: TLabel
    Left = 16
    Top = 52
    Width = 72
    Height = 13
    Caption = #1053#1086#1074#1099#1081' '#1087#1072#1088#1086#1083#1100
  end
  object lbl3: TLabel
    Left = 16
    Top = 88
    Width = 94
    Height = 13
    Caption = #1055#1086#1074#1090#1086#1088#1080#1090#1077' '#1087#1072#1088#1086#1083#1100
  end
  object lblLANG: TLabel
    Left = 8
    Top = 125
    Width = 35
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    AutoSize = False
    BiDiMode = bdLeftToRight
    Caption = ' EN '
    Color = clGray
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = False
  end
  object lblCAPS: TLabel
    Left = 8
    Top = 138
    Width = 35
    Height = 13
    Alignment = taCenter
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'CAPS'
    Color = clTeal
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
    Visible = False
  end
  object edtOLD: TEdit
    Left = 116
    Top = 16
    Width = 131
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    Text = 'edtOLD'
  end
  object edtNEW: TEdit
    Left = 116
    Top = 49
    Width = 131
    Height = 21
    Hint = #1055#1072#1088#1086#1083#1100' '#1076#1086#1083#1078#1077#1085' '#1089#1086#1089#1090#1086#1103#1090#1100' '#1093#1086#1090#1103' '#1073#1099' '#1080#1079' '#1086#1076#1085#1086#1075#1086' '#1089#1080#1084#1074#1086#1083#1072
    PasswordChar = '*'
    TabOrder = 1
    Text = 'edtOLD'
    OnKeyPress = edtNEWKeyPress
  end
  object edtCONFRM: TEdit
    Left = 116
    Top = 86
    Width = 131
    Height = 21
    Hint = #1055#1072#1088#1086#1083#1100' '#1076#1086#1083#1078#1077#1085' '#1089#1086#1089#1090#1086#1103#1090#1100' '#1093#1086#1090#1103' '#1073#1099' '#1080#1079' '#1086#1076#1085#1086#1075#1086' '#1089#1080#1084#1074#1086#1083#1072
    PasswordChar = '*'
    TabOrder = 2
    Text = 'edtOLD'
    OnKeyPress = edtNEWKeyPress
  end
  object btnOk: TBitBtn
    Left = 49
    Top = 125
    Width = 121
    Height = 26
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akRight, akBottom]
    Caption = #1057#1084#1077#1085#1080#1090#1100
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 3
    OnClick = frm1bbOkClick
  end
  object btnCancel: TBitBtn
    Left = 178
    Top = 125
    Width = 69
    Height = 26
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 17
    Top = 45
  end
  object cnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 72
    Top = 64
  end
end
