object EPGSourceForm: TEPGSourceForm
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1080#1089#1090#1086#1095#1085#1080#1082#1072' EPG'
  ClientHeight = 468
  ClientWidth = 761
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 403
    Top = 177
    Height = 250
    Align = alRight
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 427
    Width = 761
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      761
      41)
    object Button1: TButton
      Left = 670
      Top = 10
      Width = 84
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1053#1077' '#1089#1086#1093#1088#1072#1085#1103#1090#1100
      ModalResult = 2
      TabOrder = 2
    end
    object btnSave: TButton
      Left = 320
      Top = 10
      Width = 344
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnDel: TButton
      Left = 8
      Top = 10
      Width = 84
      Height = 25
      Anchors = [akLeft, akBottom]
      Cancel = True
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ModalResult = 1
      TabOrder = 0
      OnClick = btnDelClick
    end
  end
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 77
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      761
      77)
    object Label2: TLabel
      Left = 8
      Top = 13
      Width = 48
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object Label3: TLabel
      Left = 574
      Top = 13
      Width = 74
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1058#1080#1087' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
    end
    object Label6: TLabel
      Left = 8
      Top = 42
      Width = 29
      Height = 13
      Caption = #1055#1088#1080#1084'.'
    end
    object edName: TDBEditEh
      Left = 62
      Top = 10
      Width = 502
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NAME'
      DataSource = srcSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object cbType: TDBComboBoxEh
      Left = 654
      Top = 10
      Width = 100
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'PARSEAS'
      DataSource = srcSource
      DynProps = <>
      EmptyDataInfo.Text = #1058#1080#1087
      EditButtons = <>
      Items.Strings = (
        'A4on.TV'
        'xmltv file')
      KeyItems.Strings = (
        '1'
        '0')
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnChange = cbTypeChange
    end
    object edNotice: TDBEditEh
      Left = 62
      Top = 39
      Width = 411
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NOTICE'
      DataSource = srcSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object pb: TProgressBar
      Left = 0
      Top = 67
      Width = 761
      Height = 10
      Align = alBottom
      TabOrder = 5
      Visible = False
    end
    object btnLoad: TButton
      Left = 574
      Top = 39
      Width = 180
      Height = 21
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083' / '#1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1072#1081#1083
      TabOrder = 3
      OnClick = btnLoadClick
    end
    object chkHand: TDBCheckBoxEh
      Left = 484
      Top = 41
      Width = 80
      Height = 17
      Hint = #1040#1074#1090#1086#1084#1072#1090#1080#1095#1077#1089#1082#1080' '#1085#1077' '#1073#1091#1076#1077#1090' '#1079#1072#1075#1088#1091#1078#1072#1090#1100#1089#1103', '#1079#1072#1075#1088#1091#1078#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1088#1091#1082#1072#1084#1080'.'
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1056#1091#1095#1085#1072#1103' '#1086#1073#1088'.'
      DataField = 'HAND_ONLY'
      DataSource = srcSource
      DynProps = <>
      TabOrder = 4
    end
  end
  object pnlChennals: TPanel
    Left = 0
    Top = 177
    Width = 403
    Height = 250
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 403
      Height = 13
      Align = alTop
      Caption = '  '#1058#1072#1073#1083#1080#1094#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1081' '#1082#1072#1085#1072#1083#1086#1074
    end
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 13
      Width = 403
      Height = 237
      Align = alClient
      AutoFitColWidths = True
      DataSource = srcMAPChennals
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      SortLocal = True
      STFilter.Local = True
      STFilter.Visible = True
      SumList.Active = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footer.FieldName = 'NAME'
          Footer.ValueType = fvtCount
          Footers = <>
          LookupParams.KeyFieldNames = 'ID'
          LookupParams.LookupDataSet = dsChFromSRC
          LookupParams.LookupDisplayFieldName = 'NAME'
          LookupParams.LookupKeyFieldNames = 'ID'
          Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082
          Title.TitleButton = True
          Width = 126
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ATR_NAME'
          Footers = <>
          PopupMenu = pmGrid
          Title.Caption = #1055#1054' '#1040'4on.TV'
          Title.TitleButton = True
          Width = 150
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pnlGenre: TPanel
    Left = 406
    Top = 177
    Width = 355
    Height = 250
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    object Label8: TLabel
      Left = 0
      Top = 0
      Width = 355
      Height = 13
      Align = alTop
      Caption = '  '#1058#1072#1073#1083#1080#1094#1072' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1081' '#1078#1072#1085#1088#1086#1074
    end
    object DBGridEh2: TDBGridEh
      Left = 0
      Top = 13
      Width = 355
      Height = 237
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      AutoFitColWidths = True
      DataSource = srcMAPGenre
      DynProps = <>
      Flat = True
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      SortLocal = True
      STFilter.Local = True
      STFilter.Visible = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'XML_NAME'
          Footers = <>
          Title.Caption = #1046#1072#1085#1088' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
          Title.TitleButton = True
          Width = 100
        end
        item
          CellButtons = <>
          DropDownSizing = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'CAT_NAME'
          Footers = <>
          Title.Caption = #1046#1072#1085#1088' DVB'
          Title.TitleButton = True
          Width = 100
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pnlSettings: TPanel
    Left = 0
    Top = 77
    Width = 761
    Height = 100
    Align = alTop
    TabOrder = 1
    Visible = False
    DesignSize = (
      761
      100)
    object Label4: TLabel
      Left = 8
      Top = 9
      Width = 19
      Height = 13
      Caption = 'URL'
    end
    object Label5: TLabel
      Left = 574
      Top = 9
      Width = 76
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1057#1076#1074#1080#1075' '#1074#1088#1077#1084#1077#1085#1080
    end
    object Label9: TLabel
      Left = 62
      Top = 56
      Width = 454
      Height = 13
      Caption = 
        #1044#1083#1103' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1081' '#1082#1072#1085#1072#1083#1086#1074' '#1080' '#1078#1072#1085#1088#1086#1074' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1086#1090#1082#1088#1099#1090#1100' '#1092 +
        #1072#1081#1083' '#1080#1079' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
    end
    object Label7: TLabel
      Left = 8
      Top = 75
      Width = 26
      Height = 13
      Caption = #1060#1072#1081#1083
    end
    object Label10: TLabel
      Left = 8
      Top = 36
      Width = 30
      Height = 13
      Caption = #1051#1086#1075#1080#1085
    end
    object Label11: TLabel
      Left = 301
      Top = 36
      Width = 37
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object edtURL: TDBEditEh
      Left = 62
      Top = 6
      Width = 502
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'URL'
      DataSource = srcSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1057#1089#1099#1083#1082#1072' '#1085#1080' '#1080#1089#1090#1086#1095#1085#1080#1082
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object edtLOGIN: TDBEditEh
      Left = 64
      Top = 33
      Width = 227
      Height = 21
      Anchors = [akTop]
      DataField = 'URLLOGIN'
      DataSource = srcSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1051#1086#1075#1080#1085' '#1082' URL'
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object edtPASSWORD: TDBEditEh
      Left = 353
      Top = 33
      Width = 211
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'URLPASSWORD'
      DataSource = srcSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1072#1088#1086#1083#1100' '#1082' URL'
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object edTimeShift: TDBNumberEditEh
      Left = 654
      Top = 6
      Width = 100
      Height = 21
      Hint = #1045#1089#1083#1080' '#1085#1091#1078#1085#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1074#1088#1077#1084#1103' '#1080#1089#1090#1086#1095#1085#1080#1082#1072'. '#1057#1076#1074#1080#1075' '#1074' '#1084#1080#1085#1091#1090#1072#1093
      Anchors = [akTop, akRight]
      DataField = 'TIME_SHIFT'
      DataSource = srcSource
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = #1057#1076#1074#1080#1075' '#1074' '#1084#1080#1085'.'
      EditButton.Visible = True
      EditButtons = <>
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object cbIgnoreTimeZone: TDBCheckBoxEh
      Left = 574
      Top = 35
      Width = 180
      Height = 17
      Hint = 
        #1048#1075#1085#1086#1088#1080#1088#1086#1074#1072#1090#1100' '#1095#1072#1089#1086#1074#1086#1081' '#1087#1086#1103#1089' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1074' '#1092#1072#1081#1083#1077' '#1080' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1083#1086#1082#1072#1083 +
        #1100#1085#1099#1081
      Alignment = taLeftJustify
      Caption = #1051#1086#1082#1072#1083#1100#1085#1099#1081' '#1095#1072#1089#1086#1074#1081' '#1087#1086#1103#1089
      DataField = 'LOCAL_TZONE'
      DataSource = srcSource
      DynProps = <>
      TabOrder = 4
    end
    object edtXMLFile: TDBEditEh
      Left = 62
      Top = 72
      Width = 692
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'LOCAL_FILE'
      DataSource = srcSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 
        #1051#1086#1082#1072#1083#1100#1085#1099#1081' '#1092#1072#1081#1083#1072' ('#1082#1072#1082#1086#1081' '#1092#1072#1081#1083' '#1086#1090#1082#1088#1099#1074#1072#1090#1100' '#1080' '#1074' '#1082#1072#1082#1086#1081' '#1092#1072#1081#1083' '#1089#1082#1072#1095#1080#1074#1072#1090#1100' '#1080 +
        #1079' '#1048#1085#1090#1077#1088#1085#1077#1090#1072')'
      ShowHint = True
      TabOrder = 5
      Visible = True
    end
  end
  object dsChennals: TpFIBDataSet
    SelectSQL.Strings = (
      'select c.ch_id, c.ch_name, c.ch_notice from channels c'
      'order by c.ch_name')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 109
    Top = 275
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'read_committed'
      'rec_version')
    TPBMode = tpbDefault
    Left = 215
    Top = 387
  end
  object srcChennals: TDataSource
    Left = 106
    Top = 323
  end
  object srcMAPChennals: TDataSource
    DataSet = dsMAPChennals
    Left = 190
    Top = 331
  end
  object dsMAPChennals: TMemTableEh
    Params = <>
    Left = 193
    Top = 276
    object dsMAPChennalsID: TWideStringField
      FieldName = 'ID'
      Size = 100
    end
    object dsMAPChennalsNAME: TWideStringField
      FieldName = 'NAME'
      Size = 255
    end
    object dsMAPChennalsICON: TWideStringField
      FieldName = 'ICON'
      Size = 255
    end
    object dsMAPChennalsATR_ID: TIntegerField
      FieldName = 'ATR_ID'
    end
    object dsMAPChennalsATR_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'ATR_NAME'
      LookupDataSet = dsChennals
      LookupKeyFields = 'CH_ID'
      LookupResultField = 'CH_NAME'
      KeyFields = 'ATR_ID'
      Size = 255
      Lookup = True
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object ID: TMTStringDataFieldEh
          FieldName = 'ID'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'ID'
          DisplayWidth = 20
          Size = 100
          Transliterate = True
        end
        object NAME: TMTStringDataFieldEh
          FieldName = 'NAME'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'NAME'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object ICON: TMTStringDataFieldEh
          FieldName = 'ICON'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'ICON'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object ATR_ID: TMTNumericDataFieldEh
          FieldName = 'ATR_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'ATR_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object dsSource: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE EPG_SOURCES'
      'SET '
      '    NAME = :NAME,'
      '    URL = :URL,'
      '    NOTICE = :NOTICE,'
      '    TIME_SHIFT = :TIME_SHIFT,'
      '    PARSEAS = :PARSEAS,'
      '    URLLOGIN = :URLLOGIN, '
      '    URLPASSWORD = :URLPASSWORD,'
      '    LOCAL_TZONE = :LOCAL_TZONE,'
      '    LOCAL_FILE = :LOCAL_FILE,'
      '    HAND_ONLY = :HAND_ONLY'
      'WHERE'
      '   ID = :OLD_ID ')
    DeleteSQL.Strings = (
      ' '
      '        ')
    InsertSQL.Strings = (
      'INSERT INTO EPG_SOURCES('
      '    ID, '
      '    NAME,'
      '    URL,'
      '    NOTICE,'
      '    TIME_SHIFT,'
      '    PARSEAS,'
      '    URLLOGIN,'
      '    URLPASSWORD,'
      '    LOCAL_TZONE,'
      '    LOCAL_FILE,'
      '    HAND_ONLY'
      '    '
      ')'
      'VALUES('
      '    :ID,'
      '    :NAME,'
      '    :URL,'
      '    :NOTICE,'
      '    :TIME_SHIFT,'
      '    :PARSEAS,'
      '    :URLLOGIN,'
      '    :URLPASSWORD,'
      '    :LOCAL_TZONE,'
      '    :LOCAL_FILE,'
      '    :HAND_ONLY'
      ')')
    SelectSQL.Strings = (
      'select'
      '    *'
      '  from EPG_SOURCES e'
      'where e.id = :sid')
    AutoUpdateOptions.GeneratorName = 'GEN_EPG'
    OnNewRecord = dsSourceNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 36
    Top = 269
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 137
    Top = 385
  end
  object srcSource: TDataSource
    DataSet = dsSource
    Left = 35
    Top = 325
  end
  object Query: TpFIBQuery
    Transaction = trWriteQ
    Database = dmMain.dbTV
    Left = 35
    Top = 378
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.XML'
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*|XML|*.xml|JTV|*.jtv'
    Left = 98
    Top = 212
  end
  object dsGenre: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    Genre_ID,'
      '    SUBGENRE||'#39' ('#39'||GENRE||'#39')'#39' as NAME,'
      '    DVB_ID,'
      '    DVBSUBGENRE||'#39' ('#39'||DVBGENRE||'#39')'#39' as DVB_NAME'
      '  from EPG_Genre'
      'order by NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 507
    Top = 217
  end
  object srcGenre: TDataSource
    DataSet = dsGenre
    Left = 503
    Top = 265
  end
  object dsMAPGenre: TMemTableEh
    Params = <>
    Left = 281
    Top = 278
    object dsXMLChennalsCAT_NAME: TWideStringField
      FieldKind = fkLookup
      FieldName = 'CAT_NAME'
      LookupDataSet = dsGenre
      LookupKeyFields = 'Genre_ID'
      LookupResultField = 'NAME'
      KeyFields = 'CAT_ID'
      Size = 255
      Lookup = True
    end
    object dsMAPGenreXML_NAME: TWideStringField
      FieldName = 'XML_NAME'
      Size = 255
    end
    object dsMAPGenreCAT_ID: TIntegerField
      FieldName = 'CAT_ID'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object XML_NAME: TMTStringDataFieldEh
          FieldName = 'XML_NAME'
          StringDataType = fdtWideStringEh
          DisplayWidth = 100
          Size = 255
        end
        object CAT_ID: TMTNumericDataFieldEh
          FieldName = 'CAT_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CAT_NAME: TMTStringDataFieldEh
          FieldName = 'CAT_NAME'
          StringDataType = fdtWideStringEh
          DisplayWidth = 100
          Size = 255
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object srcMAPGenre: TDataSource
    DataSet = dsMAPGenre
    Left = 277
    Top = 327
  end
  object pmGrid: TPopupMenu
    Left = 192
    Top = 232
    object miClear: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1088#1080#1074#1103#1079#1082#1091
      OnClick = miClearClick
    end
  end
  object trWriteQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 305
    Top = 200
  end
  object dsChFromSRC: TMemTableEh
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 353
    Top = 276
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object ID: TMTStringDataFieldEh
          FieldName = 'ID'
          StringDataType = fdtStringEh
          DisplayWidth = 100
          Size = 100
        end
        object NAME: TMTStringDataFieldEh
          FieldName = 'NAME'
          StringDataType = fdtStringEh
          DisplayWidth = 255
          Size = 255
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object srcChFromSrc: TDataSource
    DataSet = dsChFromSRC
    Left = 350
    Top = 323
  end
end
