object ContactForm: TContactForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1050#1086#1085#1090#1072#1082#1090' '#1072#1073#1086#1085#1077#1085#1090#1072
  ClientHeight = 258
  ClientWidth = 422
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 422
    Height = 83
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      422
      83)
    object lblAttribute: TLabel
      Left = 4
      Top = 12
      Width = 18
      Height = 13
      Caption = #1058#1080#1087
    end
    object Label1: TLabel
      Left = 4
      Top = 40
      Width = 43
      Height = 13
      Caption = #1050#1086#1085#1090#1072#1082#1090
    end
    object chkNotify: TDBCheckBoxEh
      Left = 56
      Top = 63
      Width = 268
      Height = 17
      Hint = #1059#1095#1072#1074#1089#1090#1074#1091#1077#1090' '#1074' '#1088#1072#1089#1089#1099#1083#1082#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1081' (SMS EMAIL ...)'
      Caption = #1044#1083#1103' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081'.'
      DynProps = <>
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbValue: TMaskEdit
      Left = 56
      Top = 37
      Width = 361
      Height = 21
      Hint = #1050#1086#1085#1090#1072#1082#1090'. '#1085#1086#1084#1088' '#1090#1077#1083#1077#1092#1086#1085#1072', email '#1080' '#1090'.'#1076'. ...'
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Text = ''
      OnExit = dbValueExit
    end
    object cbbContactType: TDBLookupComboboxEh
      Left = 56
      Top = 9
      Width = 361
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      EmptyDataInfo.Text = #1058#1080#1087' '#1082#1086#1085#1090#1072#1082#1090#1072
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcContactType
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = cbbContactTypeChange
    end
  end
  object pnlClient: TPanel
    Left = 0
    Top = 138
    Width = 422
    Height = 120
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlClient'
    TabOrder = 2
    DesignSize = (
      422
      120)
    object memNotice: TDBMemoEh
      Left = 4
      Top = 2
      Width = 413
      Height = 81
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSelect = False
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 0
      Visible = True
      WantReturns = True
    end
    object btnOk: TBitBtn
      Left = 56
      Top = 88
      Width = 277
      Height = 28
      Hint = 'Ctrl+Enter '#1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnOkClick
    end
    object btnCancel: TBitBtn
      Left = 342
      Top = 88
      Width = 75
      Height = 28
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 2
    end
  end
  object pnlOwner: TPanel
    Left = 0
    Top = 83
    Width = 422
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      422
      55)
    object Label2: TLabel
      Tag = 1
      Left = 4
      Top = 6
      Width = 42
      Height = 13
      Caption = #1055#1072#1089#1087#1086#1088#1090
    end
    object edtMIDLENAME: TDBEditEh
      Tag = 1
      Left = 326
      Top = 30
      Width = 91
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1090#1095#1077#1089#1090#1074#1086
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
    object edtFIRSTNAME: TDBEditEh
      Tag = 1
      Left = 188
      Top = 30
      Width = 136
      Height = 21
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1048#1084#1103
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object edtSURNAME: TDBEditEh
      Left = 4
      Top = 30
      Width = 182
      Height = 21
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1060#1072#1084#1080#1083#1080#1103
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object edtPASSPORT: TDBEditEh
      Tag = 1
      Left = 54
      Top = 3
      Width = 273
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1072
      MaxLength = 11
      ShowHint = True
      TabOrder = 0
      Text = '           '
      Visible = True
      OnExit = edtPASSPORTExit
      EditMask = '9999 999999;1;'
    end
    object chkFOwner: TDBCheckBoxEh
      Left = 336
      Top = 6
      Width = 81
      Height = 17
      Hint = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '#1082#1074#1072#1088#1090#1080#1088#1099
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1073#1089'-'#1082'. '#1082#1074'.'
      DynProps = <>
      State = cbGrayed
      TabOrder = 1
      Visible = False
    end
  end
  object srcContactType: TDataSource
    AutoEdit = False
    DataSet = dsContactType
    Left = 188
    Top = 164
  end
  object dsContactType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME|| coalesce('#39' '#39'||O_DESCRIPTION, '#39#39') O_NAME'
      '  , coalesce(O_CHECK, '#39#39') REGEXP'
      '  from OBJECTS'
      '  where O_TYPE = 45'
      '        and O_DELETED = 0'
      '  order by O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 106
    Top = 162
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 35
    Top = 160
  end
end
