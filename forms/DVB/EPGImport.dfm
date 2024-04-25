object EPGImportForm: TEPGImportForm
  Left = 267
  Top = 132
  Caption = #1048#1084#1087#1086#1088#1090' EPG'
  ClientHeight = 479
  ClientWidth = 530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter
    Left = 0
    Top = 414
    Width = 530
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object memLog: TDBMemoEh
    Left = 0
    Top = 417
    Width = 530
    Height = 62
    ScrollBars = ssBoth
    Align = alBottom
    AutoSize = False
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    DynProps = <>
    EditButtons = <>
    ParentCtl3D = False
    ShowHint = True
    TabOrder = 2
    Visible = True
    WantReturns = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 530
    Height = 93
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      530
      93)
    object Label1: TLabel
      Left = 8
      Top = 9
      Width = 69
      Height = 12
      Caption = #1048#1089#1090#1086#1095#1085#1080#1082' EPG'
    end
    object Label7: TLabel
      Left = 8
      Top = 34
      Width = 55
      Height = 12
      Caption = #1060#1072#1081#1083' c EPG'
    end
    object Label2: TLabel
      Left = 0
      Top = 81
      Width = 530
      Height = 12
      Align = alBottom
      Caption = ' '#1050#1072#1085#1072#1083#1099' '#1080#1079' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
    end
    object cbSource: TDBLookupComboboxEh
      Left = 80
      Top = 6
      Width = 320
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.Columns = <
        item
          FieldName = 'NAME'
          Width = 55
        end
        item
          FieldName = 'NOTICE'
          Width = 47
        end>
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1091#1082#1072#1079#1072#1090#1100' '#1080#1089#1090#1086#1095#1085#1080#1082' EPG'
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = srcSources
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = cbSourceChange
    end
    object edtXMLFile: TDBEditEh
      Left = 80
      Top = 31
      Width = 320
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1092#1072#1081#1083' '#1080#1079' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
    object btnOpenAndLoad: TButton
      Left = 405
      Top = 31
      Width = 121
      Height = 45
      Hint = #1054#1090#1082#1088#1099#1090#1100' ('#1080#1083#1080' '#1057#1082#1072#1095#1072#1090#1100' '#1092#1072#1081#1083') '#1080' '#1089#1088#1072#1079#1091' '#1077#1075#1086' '#1086#1073#1088#1072#1073#1086#1090#1072#1090#1100'  '#1086#1073#1088#1072#1073#1086#1090#1072#1090#1100
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1080' '#1086#1073#1088#1072#1073#1086#1090#1072#1090#1100
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      WordWrap = True
      OnClick = btnOpenAndLoadClick
    end
    object btnCreate: TButton
      Left = 404
      Top = 6
      Width = 60
      Height = 20
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1080#1089#1090#1086#1095#1085#1080#1082' EPG'
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1079#1076#1072#1090#1100
      TabOrder = 2
      OnClick = Button3Click
    end
    object btnLoad: TButton
      Left = 244
      Top = 54
      Width = 156
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100' '#1092#1072#1081#1083
      Enabled = False
      TabOrder = 6
      OnClick = btnLoadClick
    end
    object btnOpen: TButton
      Left = 80
      Top = 54
      Width = 158
      Height = 22
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1080#1083#1080' '#1057#1082#1072#1095#1072#1090#1100' '#1092#1072#1081#1083
      Enabled = False
      TabOrder = 5
      WordWrap = True
      OnClick = btnOpenClick
    end
    object btnEdit: TButton
      Left = 466
      Top = 6
      Width = 60
      Height = 20
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1080#1089#1090#1086#1095#1085#1080#1082' EPG'
      Anchors = [akTop, akRight]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 3
      OnClick = btnEditClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 93
    Width = 530
    Height = 321
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object DBGridEh2: TDBGridEh
      Left = 0
      Top = 15
      Width = 530
      Height = 306
      Align = alClient
      AutoFitColWidths = True
      DataSource = srcSrcChennals
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      SearchPanel.Enabled = True
      SearchPanel.FilterOnTyping = True
      SumList.Active = True
      TabOrder = 1
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CH_NAME'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1050#1072#1085#1072#1083
          Width = 178
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CH_NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 279
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object ProgressBar: TProgressBar
      Left = 0
      Top = 0
      Width = 530
      Height = 15
      Align = alTop
      Smooth = True
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  object srcSources: TDataSource
    DataSet = dsSources
    Left = 127
    Top = 194
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 218
    Top = 144
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 214
    Top = 255
  end
  object dsSources: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '  s.id, '
      '  s.name, '
      '  s.url, '
      '  s.URLLOGIN, '
      '  s.URLPASSWORD, '
      '  s.notice, '
      '  coalesce(s.time_shift, 0) time_shift, '
      '  s.parseas,'
      '  coalesce(s.LOCAL_TZONE, 0) LOCAL_TZONE,'
      '  coalesce(LOCAL_FILE,'#39#39') LOCAL_FILE'
      'from epg_sources s'
      'order by s.name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 128
    Top = 146
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.XML'
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*|XML|*.xml|JTV|*.jtv'
    Left = 432
    Top = 146
  end
  object dsSrcChennals: TpFIBDataSet
    SelectSQL.Strings = (
      'select c.ch_name, c.ch_notice, m.epg_code, c.ch_id'
      'from epg_mapping m '
      'inner join channels c on (m.ch_id = c.ch_id)'
      'where m.epg_id = :id'
      'order by c.ch_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcSources
    Left = 126
    Top = 257
  end
  object srcSrcChennals: TDataSource
    DataSet = dsSrcChennals
    Left = 125
    Top = 317
  end
  object Query: TpFIBQuery
    Transaction = trWrite
    Database = dmMain.dbTV
    Left = 214
    Top = 312
  end
  object mpg: TMemTableEh
    Params = <>
    Left = 215
    Top = 204
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object channel: TMTStringDataFieldEh
          FieldName = 'channel'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'channel'
          DisplayWidth = 20
          Transliterate = True
        end
        object START: TMTDateTimeDataFieldEh
          FieldName = 'START'
          DateTimeDataType = fdtDateTimeEh
          DisplayLabel = 'START'
          DisplayWidth = 18
        end
        object STOP: TMTDateTimeDataFieldEh
          FieldName = 'STOP'
          DateTimeDataType = fdtDateTimeEh
          DisplayLabel = 'STOP'
          DisplayWidth = 18
        end
        object TITLE: TMTStringDataFieldEh
          FieldName = 'TITLE'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'TITLE'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object DESCRIPTION: TMTStringDataFieldEh
          FieldName = 'DESCRIPTION'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'DESCRIPTION'
          DisplayWidth = 1024
          Size = 1024
          Transliterate = True
        end
        object Genre: TMTStringDataFieldEh
          FieldName = 'Genre'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'Genre'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object STR: TMTStringDataFieldEh
          FieldName = 'STR'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'STR'
          DisplayWidth = 20
          Transliterate = True
        end
        object STP: TMTStringDataFieldEh
          FieldName = 'STP'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'STP'
          DisplayWidth = 20
          Transliterate = True
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object mtAssoc: TMemTableEh
    Active = True
    Params = <>
    Left = 304
    Top = 229
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object EPG_CODE: TMTStringDataFieldEh
          FieldName = 'EPG_CODE'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'EPG_CODE'
          DisplayWidth = 100
          Size = 100
          Transliterate = True
        end
        object CH_ID: TMTNumericDataFieldEh
          FieldName = 'CH_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CH_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
end
