object EquipAttributesForm: TEquipAttributesForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1040#1090#1088#1080#1073#1091#1090
  ClientHeight = 170
  ClientWidth = 434
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
  OnKeyUp = FormKeyUp
  DesignSize = (
    434
    170)
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
    Top = 135
    Width = 434
    Height = 35
    Align = alBottom
    TabOrder = 4
    TabStop = True
    inherited bbOk: TBitBtn
      Left = 72
      Top = 1
      Width = 271
      Height = 28
      Anchors = [akLeft, akTop, akRight]
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 352
      Top = 1
      Height = 28
    end
  end
  object dbluAttribute: TDBLookupComboboxEh
    Left = 72
    Top = 8
    Width = 355
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'O_ID'
    DataSource = srcAttr
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcAttributes
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnChange = dbluAttributeChange
    OnEnter = dbluAttributeEnter
  end
  object DBMemo1: TDBMemoEh
    Left = 8
    Top = 80
    Width = 419
    Height = 49
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcAttr
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 3
    Visible = True
    WantReturns = True
  end
  object dbValue: TDBEditEh
    Left = 71
    Top = 37
    Width = 355
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'CA_VALUE'
    DataSource = srcAttr
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object cbbList: TDBComboBoxEh
    Left = 72
    Top = 37
    Width = 354
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'CA_VALUE'
    DataSource = srcAttr
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = False
  end
  object srcAttributes: TDataSource
    AutoEdit = False
    DataSet = dsAttributes
    Left = 228
    Top = 84
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
      '  from OBJECTS o'
      '  where O_TYPE = :TYPEEQ'
      '        and O_DELETED = 0'
      '        and not exists(select'
      '                             ca.o_id'
      '                           from EQUIPMENT_ATTRIBUTES ca'
      '                           where ca.o_id = o.O_ID and ca.EID = :EID)'
      '  order by O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 178
    Top = 66
  end
  object dsAttr: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE EQUIPMENT_ATTRIBUTES'
      'SET '
      '    EID = :EID,'
      '    O_ID = :O_ID,'
      '    CA_VALUE = :CA_VALUE,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    EA_ID = :OLD_EA_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EQUIPMENT_ATTRIBUTES'
      'WHERE'
      '        EA_ID = :OLD_EA_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO EQUIPMENT_ATTRIBUTES('
      '    EID,'
      '    O_ID,'
      '    CA_VALUE,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :EID,'
      '    :O_ID,'
      '    :CA_VALUE,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'SELECT A.O_NAME, CA.*'
      'FROM equipment_attributes CA'
      '   INNER JOIN OBJECTS A ON (CA.O_ID = A.O_ID)'
      'where(  CA.eid = :eid and ca.O_ID = :oid'
      '     ) and (     CA.EA_ID = :OLD_EA_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT A.O_NAME, CA.*'
      'FROM equipment_attributes CA'
      '   INNER JOIN OBJECTS A ON (CA.O_ID = A.O_ID)'
      'where CA.eid = :eid and ca.O_ID = :oid')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 25
    Top = 103
  end
  object srcAttr: TDataSource
    DataSet = dsAttr
    Left = 72
    Top = 112
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 123
    Top = 62
  end
end
