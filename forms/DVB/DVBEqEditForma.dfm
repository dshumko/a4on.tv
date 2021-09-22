object DVBEqEditForm: TDVBEqEditForm
  ShowHint = True
  Left = 526
  Top = 248
  ActiveControl = cbState
  BorderIcons = [biSystemMenu]
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1085#1080#1077
  ClientHeight = 238
  ClientWidth = 426
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
    426
    238)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 39
    Width = 31
    Height = 13
    Caption = #1053#1086#1084#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl4: TLabel
    Left = 8
    Top = 95
    Width = 36
    Height = 13
    Caption = #1057#1090#1072#1090#1091#1089
  end
  object lbl2: TLabel
    Left = 8
    Top = 149
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object Label1: TLabel
    Left = 8
    Top = 67
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
    Top = 122
    Width = 96
    Height = 13
    Caption = #1058#1077#1082#1089#1090' '#1074' '#1082#1086#1076#1080#1088#1086#1074#1082#1077
  end
  inline okcnclfrm: TOkCancelFrame
    Left = 0
    Top = 203
    Width = 426
    Height = 35
    Align = alBottom
    TabOrder = 6
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 150
      Top = 6
      Width = 187
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ModalResult = 0
      OnClick = okcnclfrmbbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 343
      Top = 6
    end
  end
  object edtNumber: TDBEditEh
    Left = 112
    Top = 36
    Width = 306
    Height = 21
    TabStop = False
    Anchors = [akLeft, akTop, akRight]
    Color = clBtnFace
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1095#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
    ReadOnly = True
    TabOrder = 1
    Visible = True
  end
  object cbState: TDBComboBoxEh
    Left = 112
    Top = 92
    Width = 306
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EmptyDataInfo.Text = #1043#1076#1077' '#1089#1077#1081#1095#1072#1089' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1086
    EditButtons = <>
    Items.Strings = (
      #1059#1076#1072#1083#1077#1085
      #1053#1072' '#1089#1082#1083#1072#1076#1077
      #1053#1072' '#1088#1091#1082#1072#1093
      #1059#1090#1077#1088#1103#1085'/'#1057#1087#1080#1089#1072#1085
      #1042' '#1088#1077#1084#1086#1085#1090#1077)
    KeyItems.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4')
    TabOrder = 3
    Visible = True
  end
  object mmoNotice: TDBMemoEh
    Left = 112
    Top = 146
    Width = 306
    Height = 54
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 5
  end
  object cbMAN: TDBLookupComboboxEh
    Left = 112
    Top = 64
    Width = 306
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
    TabOrder = 2
    Visible = True
  end
  object lcbType: TDBLookupComboboxEh
    Left = 112
    Top = 8
    Width = 306
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
    TabOrder = 0
    Visible = True
  end
  object cbEncode: TDBComboBoxEh
    Left = 112
    Top = 119
    Width = 306
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
    TabOrder = 4
    Visible = True
  end
  object srcMAN: TDataSource
    DataSet = dsMan
    Left = 248
    Top = 168
  end
  object dsMan: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT O_ID, O_NAME'
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
    Left = 192
    Top = 168
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
    Left = 313
    Top = 165
  end
  object srcType: TDataSource
    DataSet = dsType
    Left = 362
    Top = 163
  end
end
