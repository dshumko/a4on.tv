object ContactForm: TContactForm
  Left = 540
  Top = 390
  ActiveControl = dbValue
  BorderIcons = [biSystemMenu]
  Caption = #1050#1086#1085#1090#1072#1082#1090' '#1072#1073#1086#1085#1077#1085#1090#1072
  ClientHeight = 194
  ClientWidth = 340
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
  DesignSize = (
    340
    194)
  PixelsPerInch = 96
  TextHeight = 13
  object lblAttribute: TLabel
    Left = 5
    Top = 12
    Width = 18
    Height = 13
    Caption = #1058#1080#1087
  end
  object Label2: TLabel
    Left = 5
    Top = 40
    Width = 43
    Height = 13
    Caption = #1050#1086#1085#1090#1072#1082#1090
  end
  object cbbContactType: TDBLookupComboboxEh
    Left = 56
    Top = 9
    Width = 277
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
  object memNotice: TDBMemoEh
    Left = 5
    Top = 88
    Width = 328
    Height = 65
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
  object chkNotify: TDBCheckBoxEh
    Left = 56
    Top = 64
    Width = 268
    Height = 17
    Hint = #1059#1095#1072#1074#1089#1090#1074#1091#1077#1090' '#1074' '#1088#1072#1089#1089#1099#1083#1082#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1081' (SMS EMAIL ...)'
    Caption = #1044#1083#1103' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1081'.'
    DynProps = <>
    TabOrder = 2
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object btnOk: TBitBtn
    Left = 56
    Top = 160
    Width = 195
    Height = 28
    Hint = 'Ctrl+Enter '#1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 258
    Top = 160
    Width = 75
    Height = 28
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
  object dbValue: TMaskEdit
    Left = 56
    Top = 37
    Width = 277
    Height = 21
    Hint = #1050#1086#1085#1090#1072#1082#1090'. '#1085#1086#1084#1088' '#1090#1077#1083#1077#1092#1086#1085#1072', email '#1080' '#1090'.'#1076'. ...'
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    Text = ''
    OnExit = dbValueExit
  end
  object srcContactType: TDataSource
    AutoEdit = False
    DataSet = dsContactType
    Left = 220
    Top = 108
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
    Left = 122
    Top = 106
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 35
    Top = 104
  end
end
