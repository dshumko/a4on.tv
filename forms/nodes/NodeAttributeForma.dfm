object NodeAttributForm: TNodeAttributForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1040#1090#1088#1080#1073#1091#1090' '#1091#1079#1083#1072
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
  object Label1: TLabel
    Left = 8
    Top = 64
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object lblAttribute: TLabel
    Left = 8
    Top = 12
    Width = 43
    Height = 13
    Caption = #1040#1090#1088#1080#1073#1091#1090
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 48
    Height = 13
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077
  end
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 159
    Width = 401
    Height = 35
    Align = alBottom
    TabOrder = 4
    TabStop = True
    inherited bbOk: TBitBtn
      Left = 67
      Width = 245
      Anchors = [akLeft, akRight, akBottom]
      ModalResult = 0
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 318
    end
  end
  object dbluAttribute: TDBLookupComboboxEh
    Left = 67
    Top = 9
    Width = 326
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'O_ID'
    DataSource = srcNodeAttribute
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcAttributes
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnChange = dbluAttributeChange
  end
  object memNotice: TDBMemoEh
    Left = 8
    Top = 84
    Width = 385
    Height = 69
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcNodeAttribute
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 3
    Visible = True
    WantReturns = True
  end
  object edtNA_VALUE: TDBEditEh
    Left = 67
    Top = 37
    Width = 326
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'NA_VALUE'
    DataSource = srcNodeAttribute
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object cbbList: TDBComboBoxEh
    Left = 67
    Top = 37
    Width = 326
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'NA_VALUE'
    DataSource = srcNodeAttribute
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = False
  end
  object srcAttributes: TDataSource
    AutoEdit = False
    DataSet = dsAttributes
    Left = 236
    Top = 68
  end
  object dsAttributes: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_DELETED'
      '  , O_DIMENSION'
      '  , coalesce(O_CHECK, '#39#39') REGEXP'
      '  , coalesce(O_CHARFIELD, '#39#39') VLIST'
      
        '  , cast(coalesce(O_Numericfield, 0) as integer) O_UNIQ -- '#1091#1085#1080#1082#1072 +
        #1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
      '  from OBJECTS o1'
      '  where O_TYPE = 39'
      '        and O_DELETED = 0'
      '        and (( not exists(select'
      '                               ca.o_id'
      '                             from NODES_ATTRIBUTES ca'
      '                             where ca.o_id = o1.O_ID and ca.node_id = :CID))'
      '          or (1 = :IS_OLD))'
      '  order by O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    Left = 154
    Top = 74
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 75
    Top = 80
  end
  object dsNodeAttribute: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE NODES_ATTRIBUTES'
      'SET '
      '    NA_VALUE = :NA_VALUE,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    NA_ID = :OLD_NA_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    NODES_ATTRIBUTES'
      'WHERE'
      '        NA_ID = :OLD_NA_ID')
    InsertSQL.Strings = (
      'INSERT INTO NODES_ATTRIBUTES('
      '    NODE_ID,'
      '    O_ID,'
      '    NA_VALUE,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :NODE_ID,'
      '    :O_ID,'
      '    :NA_VALUE,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'SELECT A.O_NAME, CA.*'
      'FROM NODES_ATTRIBUTES CA'
      '   INNER JOIN OBJECTS A ON (CA.O_ID = A.O_ID)'
      'where CA.NA_ID = :NA_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT A.O_NAME, CA.*'
      'FROM NODES_ATTRIBUTES CA'
      '   INNER JOIN OBJECTS A ON (CA.O_ID = A.O_ID and A.O_TYPE = 39)'
      'where CA.NA_ID = :NA_ID')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 28
    Top = 113
  end
  object srcNodeAttribute: TDataSource
    AutoEdit = False
    DataSet = dsNodeAttribute
    Left = 88
    Top = 121
  end
end
