object StreetViewForm: TStreetViewForm
  Left = 378
  Top = 361
  ActiveControl = dbEditStreetName
  Caption = #1059#1083#1080#1094#1072
  ClientHeight = 240
  ClientWidth = 394
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    394
    240)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 4
    Top = 50
    Width = 55
    Height = 13
    Caption = #1050#1086#1076' '#1091#1083#1080#1094#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 112
    Top = 7
    Width = 84
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 4
    Top = 7
    Width = 64
    Height = 13
    Caption = #1057#1086#1082#1088#1072#1097#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 114
    Top = 50
    Width = 95
    Height = 13
    Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
  end
  object dblShort: TDBLookupComboboxEh
    Left = 4
    Top = 23
    Width = 102
    Height = 21
    DynProps = <>
    DataField = 'STREET_SHORT'
    DataSource = srcStreet
    DropDownBox.AutoDrop = True
    EmptyDataInfo.Text = #1089#1086#1082#1088'.'
    EditButtons = <>
    KeyField = 'STRTYPE_SHORT'
    ListField = 'STRTYPE_NAME'
    ListSource = srcStreeType
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  inline OkCancelFrame: TOkCancelFrame
    Left = 0
    Top = 203
    Width = 394
    Height = 37
    Align = alBottom
    TabOrder = 7
    TabStop = True
    inherited bbOk: TBitBtn
      Left = 166
      Top = 8
      Width = 142
      Enabled = False
      OnClick = OkCancelFramebbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 314
      Top = 8
    end
  end
  object dbEditCode: TDBEditEh
    Left = 4
    Top = 69
    Width = 102
    Height = 21
    DataField = 'STREET_CODE'
    DataSource = srcStreet
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1050#1086#1076' '#1091#1083#1080#1094#1099
    ShowHint = True
    TabOrder = 2
    Visible = True
  end
  object dbEditStreetName: TDBEditEh
    Left = 112
    Top = 23
    Width = 277
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'STREET_NAME'
    DataSource = srcStreet
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1085#1080#1077
    ShowHint = True
    TabOrder = 1
    Visible = True
    OnChange = dbEditStreetNameChange
  end
  object dblArea: TDBLookupComboboxEh
    Left = 112
    Top = 69
    Width = 277
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'AREA_ID'
    DataSource = srcStreet
    DropDownBox.AutoDrop = True
    EmptyDataInfo.Text = #1053#1072#1089'. '#1087#1091#1085#1082#1090
    EditButtons = <
      item
        ShortCut = 45
        Style = ebsPlusEh
        OnClick = dblAreaEditButtons0Click
      end>
    KeyField = 'AREA_ID'
    ListField = 'AREA_NAME'
    ListSource = srcAreas
    ShowHint = True
    TabOrder = 3
    Visible = True
  end
  object DBMemo1: TDBMemoEh
    Left = 4
    Top = 128
    Width = 385
    Height = 73
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcStreet
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 6
    Visible = True
    WantReturns = True
  end
  object ednTAG: TDBNumberEditEh
    Left = 4
    Top = 98
    Width = 102
    Height = 21
    Hint = #1062#1080#1092#1088#1086#1074#1086#1077' '#1087#1086#1083#1077' '#1076#1083#1103' '#1080#1089#1087#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' '#1086#1087#1077#1088#1072#1090#1086#1088#1086#1084' (TAG)'
    DataField = 'TAG'
    DecimalPlaces = 8
    DynProps = <>
    EmptyDataInfo.Text = #1062#1080#1092#1088#1086#1074#1086#1077' '#1087#1086#1083#1077
    EditButtons = <>
    ShowHint = True
    TabOrder = 4
    Visible = True
  end
  object edtTAGSTR: TDBEditEh
    Left = 114
    Top = 98
    Width = 275
    Height = 21
    Hint = #1058#1077#1082#1089#1090#1086#1074#1086#1077' '#1087#1086#1083#1077' '#1076#1083#1103' '#1080#1089#1087#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' '#1086#1087#1077#1088#1072#1090#1086#1088#1086#1084' (TAG_STR)'
    Anchors = [akLeft, akTop, akRight]
    DataField = 'TAG_STR'
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1058#1077#1082#1089#1090#1086#1074#1086#1077' '#1087#1086#1083#1077
    ShowHint = True
    TabOrder = 5
    Visible = True
  end
  object srcAreas: TDataSource
    AutoEdit = False
    DataSet = dsAreas
    Left = 208
    Top = 95
  end
  object dsAreas: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SUBAREA'
      'SET '
      '    AREA_ID = :AREA_ID,'
      '    SUBAREA_ID = :SUBAREA_ID,'
      '    SUBAREA_NAME = :SUBAREA_NAME'
      'WHERE'
      '    SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SUBAREA'
      'WHERE'
      '        SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SUBAREA('
      '    AREA_ID,'
      '    SUBAREA_ID,'
      '    SUBAREA_NAME'
      ')'
      'VALUES('
      '    :AREA_ID,'
      '    :SUBAREA_ID,'
      '    :SUBAREA_NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM SUBAREA'
      'where(  area_ID = :AREA_ID'
      'and subarea_id <> 0'
      '     ) and (     SUBAREA.SUBAREA_ID = :OLD_SUBAREA_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM AREA'
      'order by AREA_NAME')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 200
    Top = 87
  end
  object srcStreeType: TDataSource
    AutoEdit = False
    DataSet = dsStreeType
    Left = 144
    Top = 95
  end
  object dsStreeType: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT *'
      'FROM STREET_TYPE'
      'order by STRTYPE_SHORT')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 136
    Top = 87
  end
  object srcStreet: TDataSource
    AutoEdit = False
    DataSet = dsEditStreet
    Left = 192
    Top = 39
  end
  object dsEditStreet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE STREET'
      'SET '
      '    STREET_CODE = :STREET_CODE,'
      '    STREET_SHORT = :STREET_SHORT,'
      '    STREET_NAME = :STREET_NAME,'
      '    AREA_ID = :AREA_ID,'
      '    NOTICE = :NOTICE,'
      '    TAG = :TAG,'
      '    TAG_STR = :TAG_STR'
      'WHERE'
      '    STREET_ID = :OLD_STREET_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    STREET'
      'WHERE'
      '        STREET_ID = :OLD_STREET_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO STREET('
      '    STREET_ID,'
      '    STREET_CODE,'
      '    STREET_SHORT,'
      '    STREET_NAME,'
      '    AREA_ID,'
      '    NOTICE,'
      '    TAG,'
      '    TAG_STR'
      ')'
      'VALUES('
      '    :STREET_ID,'
      '    :STREET_CODE,'
      '    :STREET_SHORT,'
      '    :STREET_NAME,'
      '    :AREA_ID,'
      '    :NOTICE,'
      '    :TAG,'
      '    :TAG_STR'
      ')')
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT s.*, a.area_name'
      'FROM STREET s left outer join area a on (a.area_id = s.area_id)'
      'WHERE STREET_ID = :STREET_ID ')
    Transaction = trSRead
    Database = dmMain.dbTV
    UpdateTransaction = trSWrite
    Left = 128
    Top = 39
  end
  object trSRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 248
    Top = 39
  end
  object trSWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 320
    Top = 95
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 304
    Top = 31
  end
end
