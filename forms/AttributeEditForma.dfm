object AttributeEditForm: TAttributeEditForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1040#1090#1088#1080#1073#1091#1090' '#1072#1073#1086#1085#1077#1085#1090#1072
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
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
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
    DataField = 'AID'
    DataSource = srcAtrRecord
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
    DataSource = srcAtrRecord
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 3
    Visible = True
    WantReturns = True
  end
  object edtAVALUE: TDBEditEh
    Left = 67
    Top = 37
    Width = 326
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'AVALUE'
    DataSource = srcAtrRecord
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
    DataField = 'AVALUE'
    DataSource = srcAtrRecord
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
    Top = 60
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
      '  where O_TYPE = :ATR_TYPE'
      '        and O_DELETED = 0'
      '        and (( not exists(select'
      '                               a.Aid'
      '                             from ATTRIBUTE A'
      '                             where a.Type_Id = :ATR_TYPE'
      '                                and a.Object_Id = :OBJ_ID'
      '                                and a.ADELETED  = 0))'
      '          or (1 = :IS_OLD))'
      '  order by O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    Left = 154
    Top = 58
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 35
    Top = 104
  end
  object dsAtrRecord: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE ATTRIBUTE'
      'SET '
      '    AVALUE = :AVALUE,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    TYPE_ID = :OLD_TYPE_ID'
      '    and OBJECT_ID = :OLD_OBJECT_ID'
      '    and AID = :OLD_AID'
      '    ')
    DeleteSQL.Strings = (
      'UPDATE ATTRIBUTE'
      'SET '
      '    ADELETED = 1'
      'WHERE'
      '    TYPE_ID = :OLD_TYPE_ID'
      '    and OBJECT_ID = :OLD_OBJECT_ID'
      '    and AID = :OLD_AID'
      '    ')
    InsertSQL.Strings = (
      
        'update or insert into Attribute (Type_Id, Object_Id, Aid, Avalue' +
        ', Notice, Adeleted)'
      'values (:Type_Id, :Object_Id, :Aid, :Avalue, :Notice, 0)'
      'matching (Type_Id, Object_Id, Aid)')
    SelectSQL.Strings = (
      'SELECT A.*'
      'FROM ATTRIBUTE A'
      'where A.Type_Id= :ATR_TYPE'
      '  and A.Object_Id = :OBJ_ID'
      '  and a.Aid = :AID  ')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 148
    Top = 113
  end
  object srcAtrRecord: TDataSource
    AutoEdit = False
    DataSet = dsAtrRecord
    Left = 232
    Top = 113
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 304
    Top = 60
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 304
    Top = 118
  end
end
