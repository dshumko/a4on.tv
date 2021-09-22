object ChImportForm: TChImportForm
  Left = 0
  Top = 0
  ActiveControl = btnOpen
  Caption = #1048#1084#1087#1086#1088#1090' '#1089#1087#1080#1089#1082#1072' '#1082#1072#1085#1072#1083#1086#1074' '#1080#1079' '#1092#1072#1081#1083#1072
  ClientHeight = 468
  ClientWidth = 636
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
  OnShow = FormShow
  DesignSize = (
    636
    468)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 9
    Top = 13
    Width = 53
    Height = 13
    Caption = #1058#1080#1087' '#1092#1072#1081#1083#1072
    FocusControl = cbType
  end
  object LabelXML: TLabel
    Left = 179
    Top = 13
    Width = 26
    Height = 13
    Caption = #1060#1072#1081#1083
    FocusControl = edXMLFile
    Visible = False
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 427
    Width = 636
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      636
      41)
    object Button1: TButton
      Left = 545
      Top = 10
      Width = 84
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1053#1077' '#1089#1086#1093#1088#1072#1085#1103#1090#1100
      ModalResult = 2
      TabOrder = 1
    end
    object btnSave: TButton
      Left = 367
      Top = 10
      Width = 172
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 0
      OnClick = btnSaveClick
    end
  end
  object pnlChennals: TPanel
    Left = 0
    Top = 37
    Width = 636
    Height = 390
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 636
      Height = 13
      Align = alTop
      Caption = 
        ' '#1057#1087#1080#1089#1086#1082' '#1082#1072#1085#1072#1083#1086#1074' '#1076#1083#1103' '#1089#1086#1093#1088#1072#1085#1077#1085#1077#1080#1103' ('#1091#1076#1072#1083#1080#1090#1077' '#1085#1077#1085#1091#1078#1085#1099#1077' '#1089#1090#1088#1086#1082#1080' Ctrl+De' +
        'l)'
    end
    object lblNoNew: TLabel
      Left = 0
      Top = 13
      Width = 636
      Height = 19
      Align = alTop
      Alignment = taRightJustify
      Caption = #1053#1077#1090' '#1085#1086#1074#1099#1093' '#1082#1072#1085#1072#1083#1086#1074' '#1076#1083#1103' '#1079#1072#1075#1088#1091#1079#1082#1080'  '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object dbgChannels: TDBGridEh
      Left = 0
      Top = 32
      Width = 636
      Height = 358
      Align = alClient
      AutoFitColWidths = False
      DataSource = srcXMLChennals
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      SortLocal = True
      STFilter.Local = True
      STFilter.Visible = True
      SumList.Active = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      Columns = <
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ATR_ID'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 242
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 276
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object cbType: TDBComboBoxEh
    Left = 68
    Top = 10
    Width = 100
    Height = 21
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
    TabOrder = 0
    Visible = True
    OnChange = cbTypeChange
  end
  object edXMLFile: TDBEditEh
    Left = 216
    Top = 10
    Width = 297
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1088' '#1092#1072#1081#1083#1072' '#1080#1079' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
    ShowHint = True
    TabOrder = 1
    Visible = False
  end
  object btnOpen: TButton
    Left = 517
    Top = 10
    Width = 112
    Height = 21
    Anchors = [akTop, akRight]
    Caption = #1055#1088#1086#1095#1080#1090#1072#1090#1100' '#1089#1087#1080#1089#1086#1082
    TabOrder = 2
    OnClick = btnOpenClick
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 383
    Top = 371
  end
  object srcXMLChennals: TDataSource
    DataSet = dsXMLChennals
    Left = 238
    Top = 283
  end
  object dsXMLChennals: TMemTableEh
    FieldDefs = <
      item
        Name = 'NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'NOTICE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'ATR_ID'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'UNAME'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 225
    Top = 172
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object NAME: TMTStringDataFieldEh
          FieldName = 'NAME'
          StringDataType = fdtWideStringEh
          DisplayWidth = 100
          Size = 255
        end
        object NOTICE: TMTStringDataFieldEh
          FieldName = 'NOTICE'
          StringDataType = fdtWideStringEh
          DisplayWidth = 100
          Size = 255
        end
        object ATR_ID: TMTNumericDataFieldEh
          FieldName = 'ATR_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object UNAME: TMTStringDataFieldEh
          FieldName = 'UNAME'
          StringDataType = fdtWideStringEh
          DisplayWidth = 100
          Size = 255
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 321
    Top = 361
  end
  object Query: TpFIBQuery
    Transaction = trWrite
    Database = dmMain.dbTV
    Left = 35
    Top = 370
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.XML'
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*|XML|*.xml|JTV|*.jtv'
    Left = 98
    Top = 212
  end
end
