object LoaderForm: TLoaderForm
  Left = 0
  Top = 0
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1087#1083#1072#1090#1077#1078#1077#1081
  ClientHeight = 650
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 198
    Width = 792
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object pcShowFile: TPageControl
    Left = 0
    Top = 78
    Width = 792
    Height = 120
    ActivePage = TabSheet1
    Align = alTop
    MultiLine = True
    TabOrder = 1
    TabPosition = tpBottom
    object tsTXT: TTabSheet
      Caption = 'TXT FILE'
      TabVisible = False
      object strngrdFile: TStringGrid
        Left = 0
        Top = 0
        Width = 784
        Height = 112
        Align = alClient
        ColCount = 2
        RowCount = 2
        FixedRows = 0
        Options = [goFixedVertLine, goEditing, goAlwaysShowEditor]
        TabOrder = 0
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'DBF FILE'
      ImageIndex = 2
      TabVisible = False
      object dbgehDBF: TDBGridEh
        Left = 0
        Top = 0
        Width = 784
        Height = 112
        Align = alClient
        DataSource = srcDBF
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        IndicatorOptions = [gioShowRowIndicatorEh]
        TabOrder = 0
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsDBF: TTabSheet
      Caption = 'DBF FILE'
      ImageIndex = 1
      TabVisible = False
    end
  end
  object pnlErrors: TPanel
    Left = 0
    Top = 569
    Width = 792
    Height = 81
    Align = alBottom
    TabOrder = 3
    Visible = False
    object dbgehErrors: TDBGridEh
      Left = 1
      Top = 1
      Width = 439
      Height = 79
      Hint = #1054#1096#1080#1073#1082#1080' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1076#1072#1085#1085#1099#1093
      Align = alClient
      AutoFitColWidths = False
      DataSource = srcErrors
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      IndicatorOptions = [gioShowRowIndicatorEh]
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'eText'
          Footers = <>
          Title.Caption = #1054#1096#1080#1073#1082#1072
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object mmoSQL: TDBMemoEh
      Left = 515
      Top = 1
      Width = 276
      Height = 79
      Align = alRight
      Lines.Strings = (
        #1057#1102#1076#1072' '#1087#1080#1096#1077#1084' '#1089#1082#1088#1080#1087#1090' '#1080' '#1087#1086#1090#1086#1084' '#1077#1075#1086' '#1074#1099#1087#1086#1083#1085#1103#1077#1084'. '#1085#1077' '#1091#1076#1072#1083#1103#1090#1100'!')
      ScrollBars = ssBoth
      TabOrder = 2
      Visible = False
    end
    object btnErrors: TButton
      Left = 440
      Top = 1
      Width = 75
      Height = 79
      Align = alRight
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1086#1096#1080#1073#1082#1080' '#1074' '#1092#1072#1081#1083
      TabOrder = 1
      WordWrap = True
      OnClick = btnErrorsClick
    end
  end
  object pnlReestr: TPanel
    Left = 0
    Top = 201
    Width = 792
    Height = 368
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object pnl3: TPanel
      Left = 0
      Top = 187
      Width = 792
      Height = 181
      Align = alClient
      TabOrder = 2
      object dbgehReestr: TDBGridEh
        Left = 1
        Top = 1
        Width = 790
        Height = 179
        Hint = #1054#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
        Align = alClient
        AutoFitColWidths = False
        DataSource = srcReestr
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        FrozenCols = 1
        IndicatorOptions = [gioShowRowIndicatorEh]
        OddRowColor = clInfoBk
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghExtendVertLines]
        ParentShowHint = False
        ShowHint = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.Font.Charset = DEFAULT_CHARSET
        TitleParams.Font.Color = clWindowText
        TitleParams.Font.Height = -11
        TitleParams.Font.Name = 'Tahoma'
        TitleParams.Font.Style = [fsBold]
        TitleParams.ParentFont = False
        TitleParams.MultiTitle = True
        Columns = <
          item
            AutoFitColWidth = False
            DynProps = <>
            DropDownBox.AutoFitColWidths = False
            EditButtons = <>
            FieldName = 'pLine'
            Footers = <>
            Title.Caption = #1057#1090#1088#1086#1082#1072
            Width = 58
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'pAccount'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1051#1080#1094#1077#1074#1086#1081
            Width = 89
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'pFIO'
            Footers = <>
            Title.Caption = #1060#1048#1054'|'#1080#1079' '#1092#1072#1081#1083#1072
            Width = 78
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'dbFio'
            Footers = <>
            Title.Caption = #1060#1048#1054'|'#1080#1079' '#1041#1044
            Width = 78
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'pSum'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'pDate'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'pAdress'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1080#1079' '#1092#1072#1081#1083#1072
            Width = 80
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'dbAdress'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1080#1079' '#1041#1044
            Width = 80
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'pNotice'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Width = 80
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'pPayment_No'
            Footers = <>
            Title.Caption = 'N '#1087#1083#1072#1090#1077#1078#1072
            Width = 70
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object grpHead: TGroupBox
      Left = 0
      Top = 0
      Width = 792
      Height = 135
      Align = alTop
      Caption = ' '#1047#1072#1075#1086#1083#1086#1074#1086#1082'  '#1087#1083'. '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object pnl2: TPanel
        Left = 232
        Top = 15
        Width = 558
        Height = 118
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel1'
        TabOrder = 1
        object lbl5: TLabel
          Left = 0
          Top = 0
          Width = 61
          Height = 13
          Align = alTop
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object mmoNotice: TDBMemoEh
          Left = 0
          Top = 13
          Width = 558
          Height = 105
          Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ScrollBars = ssVertical
          ShowHint = True
          TabOrder = 0
        end
      end
      object pnl4: TPanel
        Left = 2
        Top = 15
        Width = 230
        Height = 118
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object lbl1: TLabel
          Left = 26
          Top = 9
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
        object lbl3: TLabel
          Left = 8
          Top = 36
          Width = 48
          Height = 13
          Caption = #1048#1089#1090#1086#1095#1085#1080#1082
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 32
          Top = 63
          Width = 26
          Height = 13
          Caption = #1044#1072#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl2: TLabel
          Left = 26
          Top = 91
          Width = 31
          Height = 13
          Caption = #1057#1091#1084#1084#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object deDocDate: TDBDateTimeEditEh
          Left = 69
          Top = 60
          Width = 148
          Height = 21
          Hint = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          DynProps = <>
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Kind = dtkDateEh
          ParentFont = False
          TabOrder = 2
          Visible = True
        end
        object edtDocNumber: TDBEditEh
          Left = 70
          Top = 6
          Width = 147
          Height = 21
          Hint = #1053#1086#1084#1077#1088' '#1087#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          DynProps = <>
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Visible = True
        end
        object cbbDocSrc: TDBLookupComboboxEh
          Left = 70
          Top = 34
          Width = 147
          Height = 21
          DynProps = <>
          DataField = 'PaymentSrc'
          DataSource = srcFileFormats
          EditButtons = <>
          KeyField = 'PAYSOURCE_ID'
          ListField = 'PAYSOURCE_DESCR'
          ListSource = srcPaymentSrc
          TabOrder = 1
          Visible = True
        end
        object edtDocSum: TDBNumberEditEh
          Left = 69
          Top = 88
          Width = 148
          Height = 21
          DynProps = <>
          EditButton.Visible = True
          EditButtons = <>
          TabOrder = 3
          Visible = True
        end
      end
    end
    object grp2: TGroupBox
      Left = 0
      Top = 135
      Width = 792
      Height = 52
      Align = alTop
      Caption = ' '#1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1077#1088#1074#1080#1089' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Visible = False
      object lbl6: TLabel
        Left = 21
        Top = 23
        Width = 40
        Height = 13
        Caption = #1057#1077#1088#1074#1080#1089':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object cbbServices: TDBLookupComboboxEh
        Left = 72
        Top = 21
        Width = 147
        Height = 21
        Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1077#1088#1074#1080#1089
        DynProps = <>
        DataField = ''
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'SERVICE_ID'
        ListField = 'NAME'
        ListSource = srcServices
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnChange = cbbServicesChange
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 792
    Height = 78
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      792
      78)
    object lbl7: TLabel
      Left = 10
      Top = 18
      Width = 45
      Height = 13
      Caption = #1055#1088#1086#1092#1080#1083#1100
    end
    object lbl8: TLabel
      Left = 10
      Top = 50
      Width = 26
      Height = 13
      Caption = #1060#1072#1081#1083
    end
    object lcbPROFILE: TDBLookupComboboxEh
      Left = 72
      Top = 15
      Width = 472
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1087#1088#1086#1092#1080#1083#1100' '#1079#1072#1075#1088#1091#1079#1095#1080#1082#1072
      EditButtons = <>
      ListField = 'PROFILE'
      ListSource = srcFileFormats
      TabOrder = 2
      Visible = True
      OnChange = cbb_ProfileChange
    end
    object btnEditProfile: TButton
      Left = 550
      Top = 11
      Width = 115
      Height = 30
      Cursor = crHandPoint
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1087#1088#1086#1092#1080#1083#1100
      Anchors = [akTop, akRight]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1088#1086#1092#1080#1083#1100
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnEditProfileClick
    end
    object btnNewProfile: TButton
      Left = 671
      Top = 11
      Width = 115
      Height = 30
      Cursor = crHandPoint
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1087#1088#1086#1092#1080#1083#1100
      Anchors = [akTop, akRight]
      Caption = #1053#1086#1074#1099#1081' '#1087#1088#1086#1092#1080#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnNewProfileClick
    end
    object edtFile: TDBEditEh
      Left = 72
      Top = 47
      Width = 472
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <
        item
          Action = actSelectFile
          Images.NormalImages = MainForm.il12x12
          Style = ebsGlyphEh
          Width = 21
        end>
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1086#1073#1088#1072#1073#1072#1090#1099#1074#1072#1077#1084#1099#1081' '#1092#1072#1081#1083
      TabOrder = 5
      Visible = True
    end
    object btnZagr: TButton
      Left = 550
      Top = 45
      Width = 115
      Height = 27
      Cursor = crHandPoint
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1074' '#1041#1044
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnZagrClick
    end
    object btnObrab: TButton
      Left = 671
      Top = 43
      Width = 115
      Height = 29
      Cursor = crHandPoint
      Hint = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100' '#1074#1093#1086#1076#1085#1086#1081' '#1092#1072#1081#1083
      Anchors = [akTop, akRight]
      Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnObrabClick
    end
  end
  object fmStorage: TFormStorage
    StoredValues = <>
    Left = 328
    Top = 52
  end
  object dsFileFormats: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    PROFILES '
      'WHERE '
      '    PROFTYPE=:PROFTYPE'
      'ORDER BY'
      '    PROFILE    ')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 416
    Top = 80
  end
  object srcFileFormats: TDataSource
    DataSet = dsFileFormats
    Left = 496
    Top = 80
  end
  object mdsReestr: TMemTableEh
    Params = <>
    Left = 96
    Top = 152
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object pLine: TMTNumericDataFieldEh
          FieldName = 'pLine'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'pLine'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object pCustomer_ID: TMTNumericDataFieldEh
          FieldName = 'pCustomer_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'pCustomer_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object pAccount: TMTStringDataFieldEh
          FieldName = 'pAccount'
          StringDataType = fdtStringEh
          DisplayLabel = 'pAccount'
          DisplayWidth = 20
          Transliterate = True
        end
        object pFIO: TMTStringDataFieldEh
          FieldName = 'pFIO'
          StringDataType = fdtStringEh
          DisplayLabel = 'pFIO'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object pSum: TMTNumericDataFieldEh
          FieldName = 'pSum'
          NumericDataType = fdtCurrencyEh
          AutoIncrement = False
          DisplayLabel = 'pSum'
          DisplayWidth = 10
          currency = True
          Precision = 15
        end
        object pDate: TMTDateTimeDataFieldEh
          FieldName = 'pDate'
          DateTimeDataType = fdtDateEh
          DisplayLabel = 'pDate'
          DisplayWidth = 10
        end
        object pAdress: TMTStringDataFieldEh
          FieldName = 'pAdress'
          StringDataType = fdtStringEh
          DisplayLabel = 'pAdress'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object pNotice: TMTStringDataFieldEh
          FieldName = 'pNotice'
          StringDataType = fdtStringEh
          DisplayLabel = 'pNotice'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object dbFio: TMTStringDataFieldEh
          FieldName = 'dbFio'
          StringDataType = fdtStringEh
          DisplayLabel = 'dbFio'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object dbAdress: TMTStringDataFieldEh
          FieldName = 'dbAdress'
          StringDataType = fdtStringEh
          DisplayLabel = 'dbAdress'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object pPayment_No: TMTStringDataFieldEh
          FieldName = 'pPayment_No'
          StringDataType = fdtStringEh
          DisplayLabel = 'pPayment_No'
          DisplayWidth = 20
          Transliterate = True
        end
        object street: TMTStringDataFieldEh
          FieldName = 'street'
          StringDataType = fdtStringEh
          DisplayLabel = 'street'
          DisplayWidth = 50
          Size = 50
          Transliterate = True
        end
        object house: TMTStringDataFieldEh
          FieldName = 'house'
          StringDataType = fdtStringEh
          DisplayLabel = 'house'
          DisplayWidth = 20
          Transliterate = True
        end
        object flat: TMTStringDataFieldEh
          FieldName = 'flat'
          StringDataType = fdtStringEh
          DisplayLabel = 'flat'
          DisplayWidth = 20
          Transliterate = True
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object srcReestr: TDataSource
    DataSet = mdsReestr
    Left = 32
    Top = 153
  end
  object mdsErrors: TMemTableEh
    Params = <>
    Left = 160
    Top = 152
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object eText: TMTStringDataFieldEh
          FieldName = 'eText'
          StringDataType = fdtStringEh
          DisplayLabel = 'eText'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object fileLine: TMTNumericDataFieldEh
          FieldName = 'fileLine'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'fileLine'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object reestrLine: TMTNumericDataFieldEh
          FieldName = 'reestrLine'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'reestrLine'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object srcErrors: TDataSource
    DataSet = mdsErrors
    Left = 216
    Top = 153
  end
  object srcPaymentSrc: TDataSource
    DataSet = dsPaymentSource
    Left = 280
    Top = 256
  end
  object dsPaymentSource: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT PAYSOURCE_ID, PAYSOURCE_DESCR, LEAK_PRC, TAX_PRC'
      'FROM PAYSOURCE'
      'order by paysource_descr')
    AllowedUpdateKinds = []
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 360
    Top = 256
    oFetchAll = True
  end
  object qFindCustomer: TpFIBQuery
    Transaction = trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'SELECT '
      '    C.Customer_Id,'
      '    C.Account_No,'
      '    C.Cust_Code,'
      '    C.Debt_Sum,'
      '    C.Surname||'#39' '#39'||coalesce(C.Initials,'#39#39') as FIO,'
      
        '    A.Street_Name ||'#39' '#1076'.'#39'||A.House_No||Coalesce('#39' '#1082#1074'.'#39'||C.Flat_N' +
        'o,'#39#39') as ADRES'
      'FROM Customer C'
      '   INNER JOIN V_Adress A ON (C.House_Id = A.House_Id)'
      'where c.Account_no = :account')
    Left = 445
    Top = 255
  end
  object qFindCustomerForAdres: TpFIBQuery
    Transaction = trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'SELECT '
      '    C.Customer_Id,'
      '    C.Account_No,'
      '    C.Cust_Code,'
      '    C.Debt_Sum,'
      '    C.Surname||'#39' '#39'||coalesce(C.Initials,'#39#39') as FIO,'
      
        '    s.Street_Name ||'#39' '#1076'.'#39'||h.House_No||Coalesce('#39' '#1082#1074'.'#39'||C.Flat_N' +
        'o,'#39#39') as ADRES'
      'FROM Customer C'
      '   INNER JOIN HOUSE h ON (C.House_Id = h.House_Id)'
      '     INNER JOIN Street S on (s.Street_Id = h.Street_Id)'
      'where UPPER(s.Street_Name) = :STREET_N'
      '  and UPPER(h.House_No) = :HOUSE_N'
      '    and UPPER(c.Flat_No) = :FLAT_N')
    Left = 544
    Top = 255
  end
  object trReadQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 660
    Top = 292
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
    Left = 704
    Top = 292
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
    Left = 660
    Top = 244
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
    Left = 704
    Top = 244
  end
  object srcDBF: TDataSource
    Left = 444
    Top = 156
  end
  object SelectQuery: TpFIBQuery
    Transaction = trReadQ
    Database = dmMain.dbTV
    Left = 440
    Top = 304
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object Script: TpFIBScripter
    Database = dmMain.dbTV
    Transaction = trWriteQ
    Left = 360
    Top = 304
  end
  object qFindServices: TpFIBQuery
    Transaction = trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'SELECT '
      '    C.Customer_Id,'
      '    C.Account_No,'
      '    C.Cust_Code,'
      '    C.Debt_Sum,'
      '    C.Surname||'#39' '#39'||coalesce(C.Initials,'#39#39') as FIO,'
      
        '    A.Street_Name ||'#39' '#1076'.'#39'||A.House_No||Coalesce('#39' '#1082#1074'.'#39'||C.Flat_N' +
        'o,'#39#39') as ADRES'
      'FROM Customer C'
      '   INNER JOIN V_Adress A ON (C.House_Id = A.House_Id)'
      'where c.Account_no = :account')
    Left = 541
    Top = 303
  end
  object SaveTextFileDialog: TSaveTextFileDialog
    DefaultExt = 'TXT'
    Filter = #1090#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.TXT'
    Left = 256
    Top = 592
  end
  object dsServices: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT SERVICE_ID, NAME'
      'FROM SERVICES'
      'WHERE NAME IS NOT NULL'
      'order by NAME')
    AllowedUpdateKinds = []
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    Left = 272
    Top = 432
    oFetchAll = True
  end
  object srcServices: TDataSource
    DataSet = dsServices
    Left = 336
    Top = 432
  end
  object actlst: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 236
    Top = 90
    object actSelectFile: TAction
      Caption = #1042#1099#1073#1086#1088' '#1092#1072#1081#1083#1072
      ImageIndex = 78
      OnExecute = actSelectFileExecute
    end
  end
  object dlgOpen: TOpenDialog
    Left = 572
    Top = 118
  end
end
