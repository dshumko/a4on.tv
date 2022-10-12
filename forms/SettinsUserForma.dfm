object SettingsUserForm: TSettingsUserForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 385
  ClientWidth = 522
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    522
    385)
  PixelsPerInch = 96
  TextHeight = 13
  object Label9: TLabel
    Left = 8
    Top = 164
    Width = 75
    Height = 13
    Caption = #1040#1074#1090#1086#1086#1090#1082#1088#1099#1090#1080#1077
  end
  object lbl7: TLabel
    Left = 172
    Top = 60
    Width = 29
    Height = 13
    Caption = #1095#1077#1088#1077#1079
  end
  object lbl1: TLabel
    Left = 271
    Top = 136
    Width = 45
    Height = 13
    Hint = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1080#1097#1077#1084' '#1087#1086' '#1087#1072#1088#1072#1084#1077#1090#1088#1091
    Caption = #1055#1086#1080#1089#1082' '#1087#1086
  end
  object btnUpdate: TSpeedButton
    Left = 8
    Top = 356
    Width = 77
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1055#1054
    Flat = True
    Layout = blGlyphRight
    OnClick = btnUpdateClick
  end
  object btnDelSettings: TSpeedButton
    Left = 91
    Top = 356
    Width = 71
    Height = 25
    Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
    Anchors = [akLeft, akBottom]
    Caption = #1047#1072#1073#1099#1090#1100' '#1074#1089#1077
    Flat = True
    Layout = blGlyphRight
    OnClick = btnDelSettingsClick
  end
  object Label1: TLabel
    Left = 8
    Top = 190
    Width = 236
    Height = 13
    Caption = #1057#1087#1086#1089#1086#1073' '#1087#1077#1088#1077#1082#1083#1102#1095#1077#1085#1080#1103' '#1088#1072#1089#1082#1083#1072#1076#1082#1080' '#1082#1083#1072#1074#1080#1072#1090#1091#1088#1099
  end
  object btnExplore: TSpeedButton
    Left = 175
    Top = 356
    Width = 18
    Height = 25
    Hint = #1054#1090#1082#1088#1099#1090#1100' '#1082#1072#1090#1072#1083#1086#1075' '#1089' '#1085#1072#1089#1090#1088#1086#1081#1082#1072#1084#1080
    Anchors = [akLeft, akBottom]
    Caption = '...'
    Flat = True
    Layout = blGlyphRight
    OnClick = btnExploreClick
  end
  object lblCBPSWD: TLabel
    Left = 271
    Top = 218
    Width = 68
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1055#1072#1088#1086#1083#1100' / '#1048#1053#1053
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 407
    Top = 164
    Width = 69
    Height = 13
    Hint = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1080#1097#1077#1084' '#1087#1086' '#1087#1072#1088#1072#1084#1077#1090#1088#1091
    Caption = #1042#1099#1089#1086#1090#1072' '#1089#1090#1088#1086#1082
  end
  object cbShowFilter: TCheckBox
    Left = 8
    Top = 7
    Width = 240
    Height = 17
    Hint = #1055#1088#1080' '#1086#1090#1082#1088#1099#1090#1080#1080' '#1089#1087#1080#1089#1082#1072' '#1072#1073#1086#1085#1077#1085#1090#1086#1074' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
    Alignment = taLeftJustify
    Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
    TabOrder = 0
  end
  object cbFetchAll: TCheckBox
    Left = 8
    Top = 33
    Width = 240
    Height = 17
    Hint = 
      #1042#1099#1074#1086#1076' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081' '#1089#1087#1080#1089#1082#1072' '#1040#1073#1086#1085#1077#1085#1090#1086#1074#13#10#1044#1083#1103' '#1091#1089#1082#1086#1088#1077#1085#1080#1103' '#1088#1072#1073#1086#1090#1099' '#1087#1086' '#1089#1077#1090 +
      #1080' '#1084#1086#1078#1085#1086' '#1079#1072#1075#1088#1091#1078#1072#1090#1100' '#1089' '#1089#1077#1088#1074#1077#1088#1072' '#13#10#1090#1086#1083#1100#1082#1086' '#1079#1072#1087#1080#1089#1080' '#1086#1090#1086#1073#1088#1072#1078#1072#1077#1084#1099#1077' '#1085#1072' '#1101#1082#1088#1072 +
      #1085#1077'.'
    Alignment = taLeftJustify
    Caption = #1042#1099#1074#1086#1076' '#1074#1089#1077#1093' '#1079#1072#1087#1080#1089#1077#1081' '#1089#1087#1080#1089#1082#1072
    TabOrder = 2
  end
  object cbPrintReq: TCheckBox
    Left = 271
    Top = 7
    Width = 243
    Height = 17
    Hint = #1055#1077#1095#1072#1090#1072#1090#1100' '#1092#1086#1088#1084#1091' '#1079#1072#1103#1074#1082#1080' '#1089#1088#1072#1079#1091' '#1087#1086#1089#1083#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103'.'
    Alignment = taLeftJustify
    Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1092#1086#1088#1084#1091' '#1079#1072#1103#1074#1082#1080
    TabOrder = 1
  end
  object chkNotUpdate: TCheckBox
    Left = 271
    Top = 33
    Width = 243
    Height = 17
    Hint = #1053#1077' '#1086#1073#1085#1086#1074#1083#1103#1090#1100' '#1055#1054' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
    Alignment = taLeftJustify
    Caption = #1053#1077' '#1086#1073#1085#1086#1074#1083#1103#1090#1100' '#1055#1054' '#1072#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080
    TabOrder = 3
  end
  object cbAutoOpen: TDBComboBoxEh
    Left = 91
    Top = 161
    Width = 157
    Height = 21
    DynProps = <>
    EditButtons = <>
    Items.Strings = (
      #1053#1080#1095#1077#1075#1086' '#1085#1077' '#1086#1090#1082#1088#1099#1074#1072#1090#1100
      #1057#1087#1080#1089#1086#1082' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      #1047#1072#1103#1074#1082#1080
      #1055#1083#1072#1090#1077#1078#1080
      #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      #1047#1072#1076#1072#1095#1080)
    KeyItems.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4'
      '5')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 13
    Text = #1053#1080#1095#1077#1075#1086' '#1085#1077' '#1086#1090#1082#1088#1099#1074#1072#1090#1100
    Visible = True
  end
  object cbAuto: TCheckBox
    Left = 8
    Top = 59
    Width = 154
    Height = 17
    Hint = 
      #1040#1074#1086#1084#1072#1090#1080#1095#1077#1089#1082#1086#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1089#1087#1080#1089#1082#1072' '#1072#1073#1086#1085#1077#1085#1090#1086#1074#13#10#1042#1088#1077#1084#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1091#1082#1072#1079 +
      #1099#1074#1072#1077#1090#1100#1089#1103' '#1074' '#1084#1080#1085#1091#1090#1072#1093
    Alignment = taLeftJustify
    Caption = #1040#1074#1090#1086#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1089#1087#1080#1089#1082#1086#1074
    TabOrder = 4
    OnClick = cbAutoClick
  end
  object edMinutes: TDBNumberEditEh
    Left = 212
    Top = 57
    Width = 36
    Height = 19
    Hint = #1084#1080#1085#1091#1090' '#1076#1083#1103' '#1072#1074#1090#1086#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1089#1087#1080#1089#1082#1086#1074
    DecimalPlaces = 0
    DynProps = <>
    Enabled = False
    EditButton.Visible = True
    EditButtons = <>
    Flat = True
    MaxValue = 999.000000000000000000
    MinValue = 5.000000000000000000
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Value = 0.000000000000000000
    Visible = True
  end
  object cbbSearchType: TDBComboBoxEh
    Left = 326
    Top = 133
    Width = 188
    Height = 21
    Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086' '#1095#1077#1084' '#1080#1089#1082#1072#1090#1100' '#1074' '#1089#1090#1088#1086#1082#1077' '#1087#1086#1080#1089#1082#1072' '#1075#1083#1072#1074#1085#1086#1075#1086' '#1086#1082#1085#1072
    Ctl3D = True
    DynProps = <>
    DropDownBox.Sizable = True
    EditButtons = <>
    Items.Strings = (
      #1044#1086#1075#1086#1074#1086#1088
      #1051#1080#1094#1077#1074#1086#1081
      #1050#1086#1076
      #1060#1072#1084#1080#1083#1080#1103
      #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      #1058#1077#1083#1077#1092#1086#1085)
    KeyItems.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6')
    ParentCtl3D = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    Visible = True
  end
  object chkReqUnion: TCheckBox
    Left = 8
    Top = 84
    Width = 240
    Height = 17
    Hint = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1079#1072#1082#1083#1072#1076#1082#1080' '#1079#1072#1103#1074#1086#1082' '#1087#1088#1080#1085#1103#1090#1099#1077' '#1080' '#1074#1099#1076#1072#1085#1085#1099#1077' '#1074' '#1086#1076#1085#1091
    Alignment = taLeftJustify
    Caption = #1054#1073#1098#1077#1076#1080#1085#1080#1090#1100' '#1079#1072#1082#1083#1072#1076#1082#1080' '#1079#1072#1103#1074#1086#1082' '
    TabOrder = 7
  end
  object chkReqAll: TCheckBox
    Left = 271
    Top = 84
    Width = 243
    Height = 17
    Hint = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1074#1089#1077' '#1079#1072#1103#1074#1082#1080', '#1072' '#1085#1077' '#1090#1086#1083#1100#1082#1086' '#1085#1072' '#1089#1077#1075#1086#1076#1085#1103
    Alignment = taLeftJustify
    Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1074#1089#1077' '#1079#1072#1103#1074#1082#1080
    TabOrder = 8
  end
  object chkReqToAddress: TCheckBox
    Left = 8
    Top = 110
    Width = 240
    Height = 17
    Hint = 
      #1042' '#1086#1082#1085#1077' '#1040#1073#1086#1085#1077#1085#1090#1099' '#1087#1088#1080#1074#1103#1079#1072#1090#1100' '#1079#1072#1103#1074#1082#1080' '#1082' '#1072#1076#1088#1077#1089#1091' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103','#13#10#1077#1089#1083#1080' '#1085#1077' '#1091 +
      #1089#1090#1072#1085#1086#1074#1083#1077#1085' '#1087#1072#1088#1072#1084#1077#1090#1088', '#1090#1086' '#1087#1088#1080#1074#1103#1079#1099#1074#1072#1090#1100' '#1082' '#1072#1073#1086#1085#1077#1085#1090#1091
    Alignment = taLeftJustify
    Caption = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1079#1072#1103#1074#1082#1080' '#1082' '#1072#1076#1088#1077#1089#1091' '
    TabOrder = 9
  end
  object chkReqOpen: TCheckBox
    Left = 271
    Top = 110
    Width = 243
    Height = 17
    Hint = #1054#1090#1082#1088#1099#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1087#1086#1089#1083#1077' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1085#1072' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
    Alignment = taLeftJustify
    Caption = #1054#1090#1082#1088#1099#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1087#1086#1089#1083#1077' '#1089#1086#1079#1076#1072#1085#1080#1103
    TabOrder = 10
  end
  object btnOk: TBitBtn
    Left = 201
    Top = 356
    Width = 175
    Height = 25
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 23
    OnClick = frmOkCancelbbOkClick
  end
  object btnCancel: TBitBtn
    Left = 385
    Top = 356
    Width = 129
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 24
  end
  object cbKBDSWITCH: TDBComboBoxEh
    Left = 271
    Top = 188
    Width = 243
    Height = 21
    DynProps = <>
    EditButtons = <>
    Items.Strings = (
      #1057#1090#1072#1088#1099#1081' '#1089#1087#1086#1089#1086#1073' ('#1084#1086#1078#1077#1090' '#1087#1088#1080#1090#1086#1088#1084#1072#1078#1080#1074#1072#1090#1100')'
      #1053#1086#1074#1099#1081' '#1089#1087#1086#1089#1086#1073' ('#1077#1089#1090#1100' '#1087#1088#1086#1073#1083#1077#1084#1072' '#1089' Wine)')
    KeyItems.Strings = (
      '0'
      '1'
      '2')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 16
    Visible = True
  end
  object chkPrintBothCheck: TCheckBox
    Left = 8
    Top = 135
    Width = 240
    Height = 17
    Hint = 
      #1055#1088#1080' '#1085#1072#1078#1072#1090#1080#1080' "'#1044#1086#1073#1072#1074#1080#1090#1100' '#1080' '#1088#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100'" '#1087#1077#1095#1072#1090#1072#1077#1090' '#1095#1077#1082' '#1087#1088#1080#1085#1090#1077#1088#1077' '#1080' '#1085#1072' ' +
      #1082#1072#1089#1089#1086#1074#1086#1084' '#1072#1087#1087#1072#1088#1072#1090#1077
    Alignment = taLeftJustify
    Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1095#1077#1082' '#1085#1072' '#1082#1072#1089#1089#1077' '#1080' '#1085#1072' '#1087#1088#1080#1085#1090#1077#1088#1077
    TabOrder = 11
  end
  object grp1: TGroupBox
    Left = 8
    Top = 288
    Width = 506
    Height = 61
    Caption = #1054#1090#1086#1073#1088#1072#1078#1077#1085#1080#1077' '#1082#1085#1086#1087#1086#1082' '#1085#1072' '#1075#1083#1072#1074#1085#1086#1081' '#1087#1072#1085#1077#1083#1080' '
    TabOrder = 22
    object chkBtnA: TCheckBox
      Tag = 1
      Left = 9
      Top = 19
      Width = 100
      Height = 17
      Caption = #1040#1073#1086#1085#1077#1085#1090#1099
      TabOrder = 0
    end
    object chkBtnP: TCheckBox
      Tag = 4
      Left = 9
      Top = 39
      Width = 100
      Height = 17
      Caption = #1047#1072#1103#1074#1082#1080
      TabOrder = 3
    end
    object chkBtnR: TCheckBox
      Tag = 2
      Left = 172
      Top = 19
      Width = 100
      Height = 17
      Caption = #1055#1083'. '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      TabOrder = 1
    end
    object chkBtnE: TCheckBox
      Tag = 8
      Left = 172
      Top = 39
      Width = 100
      Height = 17
      Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      TabOrder = 4
    end
    object chkBtnN: TCheckBox
      Tag = 16
      Left = 374
      Top = 19
      Width = 100
      Height = 17
      Caption = #1059#1079#1083#1099
      TabOrder = 2
    end
    object chkBtnT: TCheckBox
      Tag = 32
      Left = 374
      Top = 39
      Width = 100
      Height = 17
      Caption = #1047#1072#1076#1072#1095#1080
      TabOrder = 5
    end
  end
  object btnFont: TButton
    Left = 271
    Top = 161
    Width = 130
    Height = 21
    Caption = #1064#1088#1080#1092#1090' '#1090#1072#1073#1083#1080#1094
    TabOrder = 14
    OnClick = btnFontClick
  end
  object chkHint: TCheckBox
    Left = 8
    Top = 217
    Width = 240
    Height = 17
    Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1087#1086#1076#1089#1082#1072#1079#1082#1080' '#1085#1077' '#1074#1086#1079#1083#1077' '#1084#1099#1096#1080', '#1072' '#1074#1085#1080#1079#1091' '#1089#1083#1077#1074#1072' '#1075#1083#1072#1074#1085#1086#1075#1086' '#1086#1082#1085#1072
    Alignment = taLeftJustify
    Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1087#1086#1076#1089#1082#1072#1079#1082#1080' '#1074' '#1089#1090#1072#1090#1091#1089#1073#1072#1088
    TabOrder = 17
  end
  object edtCBPSWD: TDBEditEh
    Left = 362
    Top = 215
    Width = 152
    Height = 21
    Hint = #1087#1072#1088#1086#1083#1100' '#1060#1056' '#1080#1083#1080' '#1048#1053#1053' '#1082#1072#1089#1089#1080#1088#1072
    Anchors = [akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1087#1072#1088#1086#1083#1100' '#1060#1056' '#1080#1083#1080' '#1048#1053#1053' '#1082#1072#1089#1089#1080#1088#1072
    MRUList.Active = True
    MRUList.AutoAdd = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 18
    Visible = True
  end
  object chkToday: TCheckBox
    Left = 271
    Top = 59
    Width = 243
    Height = 17
    Hint = #1055#1088#1080' '#1088#1077#1076#1072#1082#1090#1086#1088#1086#1074#1072#1085#1080#1080' '#1076#1072#1085#1085#1099#1093' '#1087#1086#1083#1077' '#1089' '#1076#1072#1090#1086#1081' '#1079#1072#1087#1086#1083#1085#1103#1090#1100' '#1090#1077#1082#1091#1097#1077#1081' '#1076#1072#1090#1086#1081
    Alignment = taLeftJustify
    Caption = #1055#1086#1083#1077' '#1089' '#1076#1072#1090#1086#1081' '#1079#1072#1087#1086#1083#1085#1103#1090#1100' '#1090#1077#1082#1091#1097#1077#1081
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object chkRecToCustomer: TCheckBox
    Left = 8
    Top = 242
    Width = 240
    Height = 17
    Hint = 
      #1042' '#1086#1082#1085#1077' '#1040#1073#1086#1085#1077#1085#1090#1099' '#1087#1088#1080#1074#1103#1079#1072#1090#1100' '#1079#1072#1103#1074#1082#1080' '#1082' '#1072#1073#1086#1085#1077#1085#1090#1091', '#1072' '#1085#1077' '#1082' '#1072#1076#1088#1077#1089#1091' '#1087#1086#1089#1090#1091 +
      #1087#1083#1077#1085#1080#1103#13#10
    Alignment = taLeftJustify
    Caption = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1103' '#1082' '#1072#1073#1086#1085#1077#1085#1090#1091
    TabOrder = 20
  end
  object chkDBsettings: TCheckBox
    Left = 271
    Top = 242
    Width = 243
    Height = 17
    Hint = #1061#1088#1072#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1055#1054' '#1086#1090#1076#1077#1083#1100#1085#1086' '#1076#1083#1103' '#1082#1072#1078#1076#1086#1081' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
    Alignment = taLeftJustify
    Caption = #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1076#1083#1103' '#1082#1072#1078#1076#1086#1081' '#1041#1044
    TabOrder = 21
  end
  object ednRH: TDBNumberEditEh
    Left = 480
    Top = 161
    Width = 34
    Height = 21
    Hint = #1042#1099#1089#1086#1090#1072' '#1089#1090#1088#1086#1082' '#1090#1072#1073#1083#1080#1094'. 0 - '#1072#1074#1090#1086#1073#1086#1076#1073#1086#1088
    DecimalPlaces = 0
    DynProps = <>
    EditButtons = <>
    MaxValue = 100.000000000000000000
    TabOrder = 15
    Value = 0.000000000000000000
    Visible = True
  end
  object chkAlwaysShow: TCheckBox
    Left = 8
    Top = 265
    Width = 240
    Height = 17
    Hint = #1042' '#1086#1082#1085#1077' '#1040#1073#1086#1085#1077#1085#1090#1099' '#1074#1089#1077#1075#1076#1072' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1090#1077#1082#1091#1097#1091#1102' '#1089#1090#1088#1086#1082#1091
    Alignment = taLeftJustify
    Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1087#1086#1076#1089#1074#1077#1090#1082#1091' '#1089#1090#1088#1086#1082#1080' '#1040#1073#1086#1085#1077#1085#1090#1072
    TabOrder = 19
  end
  object dlgFont: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = []
    Left = 408
    Top = 72
  end
end
