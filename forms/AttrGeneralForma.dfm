object AttrGeneralForm: TAttrGeneralForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1040#1090#1088#1080#1073#1091#1090
  ClientHeight = 311
  ClientWidth = 470
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
  OnShow = FormShow
  DesignSize = (
    470
    311)
  PixelsPerInch = 96
  TextHeight = 13
  object lblNotice: TLabel
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
  object dbluAttribute: TDBLookupComboboxEh
    Left = 71
    Top = 8
    Width = 392
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'AID'
    DataSource = srcAttr
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcAttributesList
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnChange = dbluAttributeChange
    OnEnter = dbluAttributeEnter
  end
  object mmoNOTICE: TDBMemoEh
    Left = 8
    Top = 80
    Width = 455
    Height = 190
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
    Width = 392
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'AVALUE'
    DataSource = srcAttr
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1047#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object cbbList: TDBComboBoxEh
    Left = 71
    Top = 37
    Width = 392
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'AVALUE'
    DataSource = srcAttr
    DynProps = <>
    EmptyDataInfo.Text = #1047#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = False
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 277
    Width = 374
    Height = 28
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 388
    Top = 277
    Width = 75
    Height = 28
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
  object mmoValue: TDBMemoEh
    Left = 71
    Top = 37
    Width = 392
    Height = 21
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'AVALUE'
    DataSource = srcAttr
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1047#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072
    ShowHint = True
    TabOrder = 6
    Visible = False
    WantReturns = True
  end
  object srcAttributesList: TDataSource
    AutoEdit = False
    DataSet = dsAttributesList
    Left = 228
    Top = 84
  end
  object dsAttributesList: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_DELETED'
      '  , O_DIMENSION'
      '  , coalesce(O_CHECK, '#39#39') REGEXP'
      '  , coalesce(O_CHARFIELD, '#39#39') VLIST'
      
        '  , cast(coalesce(BIN_AND(Cast(o.O_Numericfield as Integer), 1),' +
        ' 0) as INTEGER) O_UNIQ  -- '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
      
        '  , cast(coalesce(iif(BIN_AND(Cast(o.O_Numericfield as Integer),' +
        ' 2) = 2, 1, 0), 0) as INTEGER) O_MEMO  -- '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1082#1072#1082' '#1084#1077#1084#1086
      ''
      '  from OBJECTS o'
      '  where O_TYPE = :Type_Id'
      '        and O_DELETED = 0'
      '        and ((o.O_ID = :AID)'
      '          or (not exists(select'
      '                             ca.Aid'
      '                           from ATTRIBUTE ca'
      '                           where ca.Type_Id = :Type_Id'
      '                                 and ca.Object_Id = :Object_Id'
      '                                 and ca.Aid = o.O_ID'
      '                                 and ca.Adeleted = 0 )))'
      '  order by O_NAME')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 178
    Top = 66
  end
  object dsAttr: TpFIBDataSet
    UpdateSQL.Strings = (
      'update Attribute'
      'set Avalue = :Avalue,'
      '    Notice = :Notice'
      'where (Type_Id = :Type_Id)'
      '      and (Object_Id = :Object_Id)'
      '      and (Aid = :Aid)')
    DeleteSQL.Strings = (
      'update Attribute'
      'set ADELETED = 1'
      'where (Type_Id = :Type_Id)'
      '      and (Object_Id = :Object_Id)'
      '      and (Aid = :Aid)')
    InsertSQL.Strings = (
      
        'update or insert into Attribute (Type_Id, Object_Id, Aid, Avalue' +
        ', Notice, Adeleted)'
      'values (:Type_Id, :Object_Id, :Aid, :Avalue, :Notice, 0)'
      'matching (Type_Id, Object_Id, Aid)')
    SelectSQL.Strings = (
      'select'
      '    o.O_NAME'
      '  , A.*'
      '  from attribute A'
      
        '       inner join OBJECTS o on (o.O_ID = A.Aid and o.O_Type = A.' +
        'Type_Id)'
      '  where A.Type_Id = :Type_ID'
      '        and A.Object_Id = :Object_Id'
      '        and a.Aid = :Aid'
      '        and adeleted = 0   ')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 25
    Top = 103
  end
  object srcAttr: TDataSource
    DataSet = dsAttr
    Left = 64
    Top = 96
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 123
    Top = 62
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 300
    Top = 74
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
    Left = 363
    Top = 98
  end
end
