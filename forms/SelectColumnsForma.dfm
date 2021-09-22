object SelectColumnsForm: TSelectColumnsForm
  Left = 0
  Top = 0
  Hint = 'Gjl]tpl'
  BorderStyle = bsDialog
  Caption = #1042#1099#1073#1086#1088' '#1074#1080#1076#1080#1084#1086#1089#1090#1080' '#1082#1086#1083#1086#1085#1086#1082
  ClientHeight = 398
  ClientWidth = 382
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
  PixelsPerInch = 96
  TextHeight = 13
  object grpMulti: TGroupBox
    Left = 4
    Top = 212
    Width = 370
    Height = 139
    TabOrder = 2
    object lblWarning: TLabel
      Left = 2
      Top = 85
      Width = 366
      Height = 52
      Align = alBottom
      Caption = 
        #1042#1085#1080#1084#1072#1085#1080#1077'!  '#13#10#13#10#1055#1088#1080' '#1074#1099#1073#1086#1088#1077' '#1086#1087#1094#1080#1080' '#1074#1086#1079#1084#1086#1078#1085#1086' '#1076#1091#1073#1083#1080#1088#1086#1074#1072#1085#1080#1077' '#1079#1072#1087#1080#1089#1077#1081' '#1074' ' +
        #1090#1072#1073#1083#1080#1094#1077','#13#10#1072' '#1090#1072#1082#1078#1077' '#1079#1072#1084#1077#1076#1083#1077#1085#1080#1077' '#1074#1099#1074#1086#1076#1072' '#1089#1087#1080#1089#1082#1072' '#1072#1073#1086#1085#1077#1085#1090#1086#1074'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object chk1: TCheckBox
      Tag = 32768
      Left = 2
      Top = 15
      Width = 366
      Height = 17
      Align = alTop
      Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099
      TabOrder = 0
      OnClick = chk4Click
    end
    object chkIP: TCheckBox
      Tag = 131072
      Left = 2
      Top = 49
      Width = 366
      Height = 17
      Align = alTop
      Caption = 'IP - MAC'
      TabOrder = 2
      OnClick = chk4Click
    end
    object chkdec: TCheckBox
      Tag = 65536
      Left = 2
      Top = 32
      Width = 366
      Height = 17
      Align = alTop
      Caption = #1044#1077#1082#1086#1076#1077#1088#1099
      TabOrder = 1
      OnClick = chk4Click
    end
    object chk4: TCheckBox
      Tag = 256
      Left = 2
      Top = 66
      Width = 366
      Height = 17
      Align = alTop
      Caption = #1040#1090#1088#1080#1073#1091#1090#1099' '#1080' '#1080#1093' '#1079#1085#1072#1095#1077#1085#1080#1103
      TabOrder = 3
      OnClick = chk4Click
    end
  end
  inline okcnclfrm1: TOkCancelFrame
    Left = 0
    Top = 357
    Width = 382
    Height = 41
    Align = alBottom
    TabOrder = 3
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 185
      Width = 110
      Height = 34
      TabOrder = 1
      OnClick = okcnclfrm1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Top = 3
      Height = 35
      TabOrder = 0
    end
  end
  object pnl1: TPanel
    Left = 8
    Top = 4
    Width = 171
    Height = 205
    BevelOuter = bvNone
    TabOrder = 0
    object chk7: TCheckBox
      Tag = 32
      Left = 0
      Top = 85
      Width = 171
      Height = 17
      Align = alTop
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      TabOrder = 5
    end
    object chk8: TCheckBox
      Tag = 64
      Left = 0
      Top = 102
      Width = 171
      Height = 17
      Align = alTop
      Caption = #1055#1086#1076#1098#1077#1079#1076'/'#1101#1090#1072#1078'. '#1043#1086#1088#1086#1076'. '#1056#1072#1081#1086#1085
      TabOrder = 6
    end
    object chk3: TCheckBox
      Tag = 16
      Left = 0
      Top = 68
      Width = 171
      Height = 17
      Align = alTop
      Caption = #1050#1086#1076
      TabOrder = 4
    end
    object CheckBox3: TCheckBox
      Tag = 4
      Left = 0
      Top = 34
      Width = 171
      Height = 17
      Align = alTop
      Caption = #1058#1077#1083#1077#1092#1086#1085
      TabOrder = 2
    end
    object CheckBox4: TCheckBox
      Tag = 8
      Left = 0
      Top = 51
      Width = 171
      Height = 17
      Align = alTop
      Caption = #1052#1086#1073'. '#1090#1077#1083#1077#1092#1086#1085
      TabOrder = 3
    end
    object CheckBox8: TCheckBox
      Tag = 2
      Left = 0
      Top = 17
      Width = 171
      Height = 17
      Align = alTop
      Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1085#1086#1077' '#1048'.'#1054'.'
      TabOrder = 1
    end
    object CheckBox9: TCheckBox
      Tag = 1
      Left = 0
      Top = 0
      Width = 171
      Height = 17
      Align = alTop
      Caption = #1055#1086#1083#1085#1086#1077' '#1048'.'#1054'.'
      TabOrder = 0
    end
    object chkMonPay: TCheckBox
      Tag = 16777216
      Left = 0
      Top = 170
      Width = 171
      Height = 17
      Align = alTop
      Caption = #1057#1091#1084#1084#1072' '#1090#1072#1088#1080#1092#1086#1074
      TabOrder = 10
    end
    object CheckBox12: TCheckBox
      Tag = 1048576
      Left = 0
      Top = 119
      Width = 171
      Height = 17
      Align = alTop
      Caption = #1054#1090#1074#1086#1076
      TabOrder = 7
    end
    object CheckBox13: TCheckBox
      Tag = 2097152
      Left = 0
      Top = 136
      Width = 171
      Height = 17
      Align = alTop
      Caption = #1040#1090#1088#1080#1073#1091#1090#1099' ('#1089#1087#1080#1089#1086#1082')'
      TabOrder = 8
    end
    object chkNPS: TCheckBox
      Tag = 8388608
      Left = 0
      Top = 153
      Width = 171
      Height = 17
      Align = alTop
      Caption = 'NPS '#1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1086#1094#1077#1085#1082#1072
      TabOrder = 9
    end
  end
  object Panel1: TPanel
    Left = 185
    Top = 4
    Width = 185
    Height = 205
    BevelOuter = bvNone
    TabOrder = 1
    object CheckBox5: TCheckBox
      Tag = 512
      Left = 0
      Top = 17
      Width = 185
      Height = 17
      Align = alTop
      Caption = #1044#1086#1075#1086#1074#1086#1088' '#8470
      TabOrder = 1
    end
    object chk5: TCheckBox
      Tag = 1024
      Left = 0
      Top = 34
      Width = 185
      Height = 17
      Align = alTop
      Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
      TabOrder = 2
    end
    object CheckBox6: TCheckBox
      Tag = 2048
      Left = 0
      Top = 51
      Width = 185
      Height = 17
      Align = alTop
      Caption = #1044#1086#1075#1086#1074#1086#1088' '#1076#1086' '#1076#1072#1090#1099
      TabOrder = 3
    end
    object CheckBox2: TCheckBox
      Tag = 8192
      Left = 0
      Top = 85
      Width = 185
      Height = 17
      Align = alTop
      Caption = #1070#1088'. '#1083#1080#1094#1086
      TabOrder = 5
    end
    object CheckBox10: TCheckBox
      Tag = 4096
      Left = 0
      Top = 68
      Width = 185
      Height = 17
      Align = alTop
      Caption = #1044#1072#1090#1072' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
      TabOrder = 4
    end
    object CheckBox1: TCheckBox
      Tag = 16384
      Left = 0
      Top = 102
      Width = 185
      Height = 17
      Align = alTop
      Caption = #1057#1090#1072#1090#1091#1089
      TabOrder = 6
    end
    object CheckBox11: TCheckBox
      Tag = 262144
      Left = 0
      Top = 119
      Width = 185
      Height = 17
      Align = alTop
      Caption = 'Email'
      TabOrder = 7
    end
    object chkExtID: TCheckBox
      Tag = 33554432
      Left = 0
      Top = 170
      Width = 185
      Height = 17
      Align = alTop
      Caption = #1043#1086#1083#1086#1074#1085#1072#1103' '#1089#1090#1072#1085#1094#1080#1103
      TabOrder = 10
    end
    object CheckBox7: TCheckBox
      Tag = 128
      Left = 0
      Top = 0
      Width = 185
      Height = 17
      Align = alTop
      Caption = #1055#1072#1089#1087#1086#1088#1090', '#1044#1056
      TabOrder = 0
    end
    object chkPrepay: TCheckBox
      Tag = 524288
      Left = 0
      Top = 136
      Width = 185
      Height = 17
      Align = alTop
      Caption = #1057#1091#1084#1084#1072' '#1086#1073#1077#1097#1072#1085#1085#1086#1075#1086' '#1087#1083#1072#1090#1077#1078#1072
      TabOrder = 8
    end
    object chkHE: TCheckBox
      Tag = 4194304
      Left = 0
      Top = 153
      Width = 185
      Height = 17
      Align = alTop
      Caption = #1042#1085#1077#1096#1085#1080#1081' ID'
      TabOrder = 9
    end
    object chkORG: TCheckBox
      Tag = 67108864
      Left = 0
      Top = 187
      Width = 185
      Height = 17
      Align = alTop
      Caption = #1054#1073#1089#1083'. '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      TabOrder = 11
    end
  end
end
