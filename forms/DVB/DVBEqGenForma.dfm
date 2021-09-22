object DVBEqGenForm: TDVBEqGenForm
  Left = 526
  Top = 248
  BorderIcons = [biSystemMenu]
  Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1094#1080#1092#1088'. '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
  ClientHeight = 234
  ClientWidth = 389
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
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    389
    234)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 33
    Width = 90
    Height = 13
    Caption = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 8
    Top = 58
    Width = 35
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086
  end
  object lbl2: TLabel
    Left = 10
    Top = 82
    Width = 79
    Height = 13
    Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 8
    Top = 131
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 94
    Height = 13
    Caption = #1058#1080#1087' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 8
    Top = 107
    Width = 96
    Height = 13
    Caption = #1058#1077#1082#1089#1090' '#1074' '#1082#1086#1076#1080#1088#1086#1074#1082#1077
  end
  object edCount: TDBNumberEditEh
    Left = 111
    Top = 55
    Width = 271
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DecimalPlaces = 0
    DynProps = <>
    EditButton.Visible = True
    EditButtons = <>
    MaxValue = 10000000.000000000000000000
    MinValue = 1.000000000000000000
    ShowHint = True
    TabOrder = 2
    Value = 1.000000000000000000
    Visible = True
  end
  object edtNumber: TDBEditEh
    Left = 111
    Top = 30
    Width = 271
    Height = 21
    Hint = 
      #1053#1072' '#1087#1088#1080#1084#1077#1088': ABC001 '#1080' '#1082#1086#1083#1074#1086' 5, '#1073#1091#1076#1091#1090' '#1089#1086#1079#1076#1072#1085#1099' ABC001, ABC002.. ABC0' +
      '05'#13#10'[Sn] - '#1057#1091#1084#1084#1072' '#1074#1089#1077#1093' '#1095#1080#1089#1077#1083' '#1076#1086#1087#1086#1083#1085#1077#1085#1085#1072#1103' '#1076#1086' n-'#1093' '#1089#1080#1084#1074#1086#1083#1086#1074' '#1089#1083#1077#1074#1072' ([' +
      'S3] '#1076#1086' 3-'#1093')'
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object cbMAN: TDBLookupComboboxEh
    Left = 111
    Top = 79
    Width = 271
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    DropDownBox.Columns = <
      item
        FieldName = 'O_NAME'
      end
      item
        FieldName = 'O_DESCRIPTION'
        Width = 60
      end>
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcMAN
    ShowHint = True
    TabOrder = 3
    Visible = True
  end
  object mmoNotice: TDBMemoEh
    Left = 111
    Top = 128
    Width = 271
    Height = 65
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 5
    Visible = True
    WantReturns = True
  end
  object cbType: TDBLookupComboboxEh
    Left = 111
    Top = 5
    Width = 271
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    DropDownBox.Columns = <
      item
        FieldName = 'O_NAME'
      end
      item
        FieldName = 'O_DESCRIPTION'
        Width = 60
      end>
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1090#1080#1087
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcType
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object cbEncode: TDBComboBoxEh
    Left = 111
    Top = 104
    Width = 271
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EmptyDataInfo.Text = #1055#1077#1088#1077#1076#1072#1074#1072#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077' '#1085#1072' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086' '#1074' '#1082#1086#1076#1080#1088#1086#1074#1082#1077
    EditButtons = <>
    Items.Strings = (
      'UTF'
      'ISO')
    KeyItems.Strings = (
      'UTF'
      'ISO')
    ShowHint = True
    TabOrder = 4
    Visible = True
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 199
    Width = 293
    Height = 30
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1085#1086#1074#1086#1075#1086' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
    NumGlyphs = 2
    TabOrder = 6
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 307
    Top = 199
    Width = 75
    Height = 30
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 7
  end
  object srcMAN: TDataSource
    DataSet = dsMan
    Left = 148
    Top = 140
  end
  object dsMan: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED'
      'FROM OBJECTS'
      'WHERE O_TYPE = 18 AND O_DELETED = 0'
      'order BY O_NAME')
    AutoUpdateOptions.UpdateTableName = 'OBJECTS'
    AutoUpdateOptions.KeyFields = 'O_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 211
    Top = 134
  end
  object srcType: TDataSource
    DataSet = dsType
    Left = 322
    Top = 139
  end
  object dsType: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED'
      'FROM OBJECTS'
      'WHERE O_TYPE = 19 AND O_DELETED = 0'
      'order BY O_NAME')
    AutoUpdateOptions.UpdateTableName = 'OBJECTS'
    AutoUpdateOptions.KeyFields = 'O_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 273
    Top = 141
  end
  object cnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 64
    Top = 56
  end
end
