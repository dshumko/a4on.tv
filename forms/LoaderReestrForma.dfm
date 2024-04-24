object LoaderReestrForm: TLoaderReestrForm
  Left = 299
  Top = 177
  Caption = #1047#1072#1075#1088#1091#1079#1082#1072' '#1088#1077#1077#1089#1090#1088#1072
  ClientHeight = 625
  ClientWidth = 916
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter2: TSplitter
    Left = 0
    Top = 185
    Width = 916
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object spl1: TSplitter
    Left = 0
    Top = 484
    Width = 916
    Height = 4
    Cursor = crVSplit
    Align = alBottom
  end
  object pnl2: TPanel
    Left = 0
    Top = 591
    Width = 916
    Height = 34
    Align = alBottom
    TabOrder = 4
    object Button1: TButton
      Left = 10
      Top = 5
      Width = 201
      Height = 25
      Hint = 
        #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1078#1091#1088#1085#1072#1083' '#1086#1096#1080#1073#1086#1095#1085#1099#1093' '#1079#1072#1087#1080#1089#1077#1081', '#1076#1083#1103' '#1076#1072#1083#1100#1085#1077#1081#1096#1077#1081' '#1088#1091#1095#1085#1086#1081' '#1086#1073#1088#1072#1073#1086 +
        #1090#1082#1080#1090#1082#1080
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1078#1091#1088#1085#1072#1083' '#1086#1096#1080#1073#1086#1082' '#1074' '#1092#1072#1081#1083
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 916
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      916
      57)
    object Label6: TLabel
      Left = 8
      Top = 35
      Width = 26
      Height = 13
      Caption = #1060#1072#1081#1083
    end
    object Label7: TLabel
      Left = 8
      Top = 8
      Width = 45
      Height = 13
      Caption = #1055#1088#1086#1092#1080#1083#1100
    end
    object btnProcess: TButton
      Left = 547
      Top = 3
      Width = 110
      Height = 50
      Hint = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100' '#1092#1072#1081#1083', '#1073#1077#1079' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1074' '#1041#1044'.'
      Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100
      Enabled = False
      TabOrder = 2
      OnClick = btnProcessClick
    end
    object cbbProfile: TDBLookupComboboxEh
      Left = 61
      Top = 5
      Width = 235
      Height = 21
      DynProps = <>
      DataField = ''
      EditButtons = <>
      KeyField = 'Profile'
      ListField = 'Profile'
      ListSource = srcProfile
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = cbbProfileChange
    end
    object edtProcessedFile: TFilenameEdit
      Left = 61
      Top = 32
      Width = 468
      Height = 21
      NumGlyphs = 1
      TabOrder = 1
      Text = #1059#1082#1072#1078#1080#1090#1077' '#1086#1073#1088#1072#1073#1072#1090#1099#1074#1072#1077#1084#1099#1081' '#1092#1072#1081#1083
      OnChange = edtProcessedFileChange
      OnEnter = edtProcessedFileEnter
    end
    object btnNewProfile: TButton
      Left = 419
      Top = 3
      Width = 110
      Height = 25
      Caption = #1053#1086#1074#1099#1081' '#1087#1088#1086#1092#1080#1083#1100
      TabOrder = 5
      OnClick = btnNewProfileClick
    end
    object btnEditProfile: TButton
      Left = 302
      Top = 3
      Width = 110
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1088#1086#1092#1080#1083#1100
      TabOrder = 4
      OnClick = btnEditProfileClick
    end
    object btnLoadIntoDB: TButton
      Left = 670
      Top = 3
      Width = 242
      Height = 50
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1082#1086#1088#1088#1077#1082#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1074' '#1041#1044
      Anchors = [akLeft, akTop, akRight]
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1074' '#1041#1044
      Enabled = False
      TabOrder = 3
      OnClick = btnLoadIntoDBClick
    end
  end
  object pnlErrors: TPanel
    Left = 0
    Top = 488
    Width = 916
    Height = 103
    Align = alBottom
    TabOrder = 3
    object dbgehErrors: TDBGridEh
      Left = 1
      Top = 1
      Width = 638
      Height = 101
      Hint = #1044#1074#1086#1081#1085#1086#1081' '#1082#1083#1080#1082' - '#1087#1077#1088#1077#1093#1086#1076' '#1085#1072' '#1089#1090#1088#1086#1082#1091' '#1074' '#1092#1072#1081#1083#1077
      Align = alClient
      DataSource = srcErrors
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      SumList.Active = True
      TabOrder = 0
      OnDblClick = dbgehErrorsDblClick
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'eText'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1054#1096#1080#1073#1082#1072
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object mmoSQL: TDBMemoEh
      Left = 639
      Top = 1
      Width = 276
      Height = 101
      Lines.Strings = (
        #1057#1102#1076#1072' '#1087#1080#1096#1080#1084' '#1089#1082#1088#1080#1087#1090' '#1080' '#1087#1086#1090#1086#1084' '#1077#1075#1086' '#1074#1099#1087#1086#1083#1085#1103#1077#1084'. '#1085#1077' '#1091#1076#1072#1083#1103#1090#1100'!')
      ScrollBars = ssBoth
      Align = alRight
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 1
      Visible = False
      WantReturns = True
    end
  end
  object pcShowFile: TPageControl
    Left = 0
    Top = 57
    Width = 916
    Height = 128
    ActivePage = tsTXT
    Align = alTop
    MultiLine = True
    TabOrder = 1
    TabPosition = tpBottom
    object tsTXT: TTabSheet
      Caption = 'TXT FILE'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object strngrdFile: TStringGrid
        Left = 0
        Top = 0
        Width = 908
        Height = 120
        Align = alClient
        ColCount = 2
        Ctl3D = False
        RowCount = 2
        FixedRows = 0
        Options = [goFixedVertLine, goEditing, goAlwaysShowEditor]
        ParentCtl3D = False
        TabOrder = 0
      end
    end
    object tsDBF: TTabSheet
      Caption = 'DBF FILE'
      ImageIndex = 2
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 908
        Height = 120
        Align = alClient
        DataSource = srcDBF
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        TabOrder = 0
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsOTHER: TTabSheet
      Caption = 'OTHER'
      ImageIndex = 1
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  object pnlReestr: TPanel
    Left = 0
    Top = 188
    Width = 916
    Height = 296
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object pnl3: TPanel
      Left = 217
      Top = 0
      Width = 699
      Height = 296
      Align = alClient
      TabOrder = 1
      object dbgehReestr: TDBGridEh
        Left = 1
        Top = 1
        Width = 697
        Height = 294
        Align = alClient
        DataSource = srcReestr
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        FrozenCols = 1
        OddRowColor = clInfoBk
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        SearchPanel.Enabled = True
        SearchPanel.Location = splHorzScrollBarExtraPanelEh
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
            DropDownBox.AutoFitColWidths = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'pLine'
            Footers = <>
            Title.Caption = #1057#1090#1088#1086#1082#1072
            Title.TitleButton = True
            Width = 43
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'pAccount'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1051#1080#1094#1077#1074#1086#1081
            Title.TitleButton = True
            Width = 89
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'pFIO'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1060#1048#1054'|'#1080#1079' '#1092#1072#1081#1083#1072
            Title.TitleButton = True
            Width = 78
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'dbFio'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1060#1048#1054'|'#1080#1079' '#1041#1044
            Title.TitleButton = True
            Width = 78
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'pSum'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1057#1091#1084#1084#1072
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'pDate'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'pAdress'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1080#1079' '#1092#1072#1081#1083#1072
            Title.TitleButton = True
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'dbAdress'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1080#1079' '#1041#1044
            Title.TitleButton = True
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'pNotice'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'pPayment_No'
            Footers = <>
            Title.Caption = 'N '#1087#1083#1072#1090#1077#1078#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EXT_ID'
            Footers = <>
            Title.Caption = #1042#1085#1077#1096#1085#1080#1081' ID'
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object pnl1: TPanel
      Left = 0
      Top = 0
      Width = 217
      Height = 296
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 217
        Height = 296
        Align = alClient
        Caption = ' '#1047#1072#1075#1086#1083#1086#1074#1086#1082'  '#1087#1083'. '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '
        TabOrder = 0
        object Panel1: TPanel
          Left = 2
          Top = 128
          Width = 213
          Height = 166
          Align = alClient
          BevelOuter = bvNone
          Caption = 'Panel1'
          TabOrder = 1
          object Label1: TLabel
            Left = 0
            Top = 0
            Width = 61
            Height = 13
            Align = alTop
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          end
          object mmoNotice: TDBMemoEh
            Left = 0
            Top = 13
            Width = 213
            Height = 153
            ScrollBars = ssVertical
            Align = alClient
            AutoSize = False
            DynProps = <>
            EditButtons = <>
            ShowHint = True
            TabOrder = 0
            Visible = True
            WantReturns = True
          end
        end
        object Panel2: TPanel
          Left = 2
          Top = 15
          Width = 213
          Height = 113
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lbl1: TLabel
            Left = 8
            Top = 9
            Width = 31
            Height = 13
            Caption = #1053#1086#1084#1077#1088
          end
          object lbl3: TLabel
            Left = 8
            Top = 36
            Width = 48
            Height = 13
            Caption = #1048#1089#1090#1086#1095#1085#1080#1082
          end
          object lbl4: TLabel
            Left = 8
            Top = 63
            Width = 26
            Height = 13
            Caption = #1044#1072#1090#1072
          end
          object lbl2: TLabel
            Left = 8
            Top = 91
            Width = 31
            Height = 13
            Caption = #1057#1091#1084#1084#1072
          end
          object edtDocSum: TRxCalcEdit
            Left = 60
            Top = 88
            Width = 149
            Height = 21
            Margins.Left = 4
            Margins.Top = 1
            AutoSize = False
            NumGlyphs = 2
            TabOrder = 3
          end
          object deDocDate: TDBDateTimeEditEh
            Left = 61
            Top = 60
            Width = 148
            Height = 21
            DynProps = <>
            EditButtons = <>
            Kind = dtkDateEh
            ShowHint = True
            TabOrder = 2
            Visible = True
          end
          object cbbDocSrc: TDBLookupComboboxEh
            Left = 62
            Top = 33
            Width = 147
            Height = 21
            DynProps = <>
            DataField = ''
            EditButtons = <>
            KeyField = 'PAYSOURCE_ID'
            ListField = 'PAYSOURCE_DESCR'
            ListSource = srcPaymentSrc
            ShowHint = True
            TabOrder = 1
            Visible = True
          end
          object edtDocNumber: TDBEditEh
            Left = 62
            Top = 6
            Width = 147
            Height = 21
            DynProps = <>
            EditButtons = <>
            ShowHint = True
            TabOrder = 0
            Visible = True
          end
        end
      end
    end
  end
  object srcReestr: TDataSource
    DataSet = mdsReestr
    Left = 344
    Top = 305
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
      
        '    s.Street_Name||'#39' '#39'||s.Street_Short||'#39' '#1076'.'#39'||h.House_No||Coale' +
        'sce('#39' '#1082#1074'.'#39'||C.Flat_No,'#39#39') as ADRES'
      'FROM Customer C'
      '      INNER JOIN HOUSE h ON (C.House_Id = h.House_Id)'
      '      inner join street s  on (S.STREET_ID = h.STREET_ID)'
      '')
    Left = 272
    Top = 305
  end
  object srcPaymentSrc: TDataSource
    DataSet = dsPaymentSource
    Left = 232
    Top = 72
  end
  object srcErrors: TDataSource
    DataSet = mdsErrors
    Left = 136
    Top = 337
  end
  object srcProfile: TDataSource
    DataSet = mdsFileFormats
    Left = 152
    Top = 73
  end
  object FormStorage: TFormStorage
    Active = False
    IniSection = 'Main'
    StoredValues = <>
    Left = 64
    Top = 96
  end
  object srcDBF: TDataSource
    Left = 324
    Top = 69
  end
  object SaveTextFileDialog: TSaveTextFileDialog
    DefaultExt = 'TXT'
    Filter = #1090#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099'|*.TXT'
    Left = 336
    Top = 528
  end
  object dsPaymentSource: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT PAYSOURCE_ID, PAYSOURCE_DESCR, LEAK_PRC, TAX_PRC, Code'
      'FROM PAYSOURCE'
      'order by paysource_descr')
    AllowedUpdateKinds = []
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 416
    Top = 128
    oFetchAll = True
  end
  object Script: TpFIBScripter
    Database = dmMain.dbTV
    Transaction = trWriteQ
    OnExecuteError = ScriptExecuteError
    Left = 536
    Top = 128
  end
  object SelectQuery: TpFIBQuery
    Transaction = trReadQ
    Database = dmMain.dbTV
    Left = 536
    Top = 72
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
    Left = 688
    Top = 132
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
    Left = 644
    Top = 132
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
    Left = 644
    Top = 76
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
    Left = 688
    Top = 76
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
    Left = 272
    Top = 353
  end
  object mdsReestr: TMemTableEh
    Params = <>
    Left = 496
    Top = 312
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
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayLabel = 'pSum'
          DisplayWidth = 10
          currency = False
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
        object EXT_ID: TMTStringDataFieldEh
          FieldName = 'EXT_ID'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object mdsErrors: TMemTableEh
    Params = <>
    Left = 72
    Top = 392
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
  object mdsFileFormats: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'Profile'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FileType'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'FileExt'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FileDir'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'PaymentSrc'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'CodePage'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'DataFrom'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'DataTo'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'DataSprt'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DataRemZero'
        DataType = ftBoolean
      end
      item
        Name = 'DataRemCh'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'HeaderExist'
        DataType = ftBoolean
      end
      item
        Name = 'HeaderFrom'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'HeaderTo'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'HeadSprt'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'HeadRemCh'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ACCOUNT'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'FIO'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'ADRESS'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'SUMMA'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'PayDate'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'DATEfmt'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'headNumCol'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'headNumLine'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'headSumCol'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'headSumLine'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'headDateCol'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'headDateLine'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'headDateFmt'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'kopeyki'
        DataType = ftBoolean
      end
      item
        Name = 'DecimalSprt'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DBF_account'
        DataType = ftString
        Size = 31
      end
      item
        Name = 'DBF_date'
        DataType = ftString
        Size = 31
      end
      item
        Name = 'DBF_SUM'
        DataType = ftString
        Size = 31
      end
      item
        Name = 'DBF_FIO'
        DataType = ftString
        Size = 31
      end
      item
        Name = 'DBF_ADRES'
        DataType = ftString
        Size = 31
      end
      item
        Name = 'ArchDir'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'PAYMENT_NO'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'DBFPAYMENT_NO'
        DataType = ftString
        Size = 31
      end
      item
        Name = 'NOTICE1'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'NOTICE2'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'HOUSE'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'FLAT'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'DBF_HOUSE'
        DataType = ftString
        Size = 31
      end
      item
        Name = 'DBF_FLAT'
        DataType = ftString
        Size = 31
      end
      item
        Name = 'DBF_NOTICE'
        DataType = ftString
        Size = 31
      end
      item
        Name = 'DBF_KORP'
        DataType = ftString
        Size = 31
      end
      item
        Name = 'KORP'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'EXT_ID'
        DataType = ftString
        Size = 31
      end
      item
        Name = 'DBF_EXTERNAL'
        DataType = ftString
        Size = 31
      end
      item
        Name = 'DBF_NotLast'
        DataType = ftBoolean
      end
      item
        Name = 'SkipEmpDate'
        DataType = ftBoolean
      end
      item
        Name = 'headSrcCol'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'headSrcLine'
        DataType = ftSmallint
        Precision = 15
      end>
    IndexDefs = <
      item
        Name = 'mdsFileFormatsIndex1'
        Fields = 'Profile'
      end>
    Params = <>
    SortOrder = 'PROFILE'
    StoreDefs = True
    OnNewRecord = mdsFileFormatsNewRecord
    Left = 152
    Top = 128
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object Profile: TMTStringDataFieldEh
          FieldName = 'Profile'
          StringDataType = fdtStringEh
          DisplayLabel = 'Profile'
          DisplayWidth = 20
          Transliterate = True
        end
        object FileType: TMTNumericDataFieldEh
          FieldName = 'FileType'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'FileType'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object FileExt: TMTStringDataFieldEh
          FieldName = 'FileExt'
          StringDataType = fdtStringEh
          DisplayLabel = 'FileExt'
          DisplayWidth = 20
          Transliterate = True
        end
        object FileDir: TMTStringDataFieldEh
          FieldName = 'FileDir'
          StringDataType = fdtStringEh
          DisplayLabel = 'FileDir'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object PaymentSrc: TMTNumericDataFieldEh
          FieldName = 'PaymentSrc'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'PaymentSrc'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CodePage: TMTNumericDataFieldEh
          FieldName = 'CodePage'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CodePage'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DataFrom: TMTNumericDataFieldEh
          FieldName = 'DataFrom'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'DataFrom'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DataTo: TMTNumericDataFieldEh
          FieldName = 'DataTo'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'DataTo'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DataSprt: TMTStringDataFieldEh
          FieldName = 'DataSprt'
          StringDataType = fdtStringEh
          DisplayLabel = 'DataSprt'
          DisplayWidth = 20
          Transliterate = True
        end
        object DataRemZero: TMTBooleanDataFieldEh
          FieldName = 'DataRemZero'
          DisplayLabel = 'DataRemZero'
          DisplayWidth = 5
        end
        object DataRemCh: TMTStringDataFieldEh
          FieldName = 'DataRemCh'
          StringDataType = fdtStringEh
          DisplayLabel = 'DataRemCh'
          DisplayWidth = 20
          Transliterate = True
        end
        object HeaderExist: TMTBooleanDataFieldEh
          FieldName = 'HeaderExist'
          DisplayLabel = 'HeaderExist'
          DisplayWidth = 5
        end
        object HeaderFrom: TMTNumericDataFieldEh
          FieldName = 'HeaderFrom'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'HeaderFrom'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object HeaderTo: TMTNumericDataFieldEh
          FieldName = 'HeaderTo'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'HeaderTo'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object HeadSprt: TMTStringDataFieldEh
          FieldName = 'HeadSprt'
          StringDataType = fdtStringEh
          DisplayLabel = 'HeadSprt'
          DisplayWidth = 20
          Transliterate = True
        end
        object HeadRemCh: TMTStringDataFieldEh
          FieldName = 'HeadRemCh'
          StringDataType = fdtStringEh
          DisplayLabel = 'HeadRemCh'
          DisplayWidth = 20
          Transliterate = True
        end
        object ACCOUNT: TMTNumericDataFieldEh
          FieldName = 'ACCOUNT'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'ACCOUNT'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object FIO: TMTNumericDataFieldEh
          FieldName = 'FIO'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'FIO'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object ADRESS: TMTNumericDataFieldEh
          FieldName = 'ADRESS'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'ADRESS'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SUMMA: TMTNumericDataFieldEh
          FieldName = 'SUMMA'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'SUMMA'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object PayDate: TMTNumericDataFieldEh
          FieldName = 'PayDate'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'PayDate'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DATEfmt: TMTStringDataFieldEh
          FieldName = 'DATEfmt'
          StringDataType = fdtStringEh
          DisplayLabel = 'DATEfmt'
          DisplayWidth = 20
          Transliterate = True
        end
        object headNumCol: TMTNumericDataFieldEh
          FieldName = 'headNumCol'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'headNumCol'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object headNumLine: TMTNumericDataFieldEh
          FieldName = 'headNumLine'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'headNumLine'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object headSumCol: TMTNumericDataFieldEh
          FieldName = 'headSumCol'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'headSumCol'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object headSumLine: TMTNumericDataFieldEh
          FieldName = 'headSumLine'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'headSumLine'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object headDateCol: TMTNumericDataFieldEh
          FieldName = 'headDateCol'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'headDateCol'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object headDateLine: TMTNumericDataFieldEh
          FieldName = 'headDateLine'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'headDateLine'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object headDateFmt: TMTStringDataFieldEh
          FieldName = 'headDateFmt'
          StringDataType = fdtStringEh
          DisplayLabel = 'headDateFmt'
          DisplayWidth = 20
          Transliterate = True
        end
        object kopeyki: TMTBooleanDataFieldEh
          FieldName = 'kopeyki'
          DisplayLabel = 'kopeyki'
          DisplayWidth = 5
        end
        object DecimalSprt: TMTStringDataFieldEh
          FieldName = 'DecimalSprt'
          StringDataType = fdtStringEh
          DisplayLabel = 'DecimalSprt'
          DisplayWidth = 1
          Size = 1
          Transliterate = True
        end
        object DBF_account: TMTStringDataFieldEh
          FieldName = 'DBF_account'
          StringDataType = fdtStringEh
          DisplayLabel = 'DBF_account'
          DisplayWidth = 31
          Size = 31
          Transliterate = True
        end
        object DBF_date: TMTStringDataFieldEh
          FieldName = 'DBF_date'
          StringDataType = fdtStringEh
          DisplayLabel = 'DBF_date'
          DisplayWidth = 31
          Size = 31
          Transliterate = True
        end
        object DBF_SUM: TMTStringDataFieldEh
          FieldName = 'DBF_SUM'
          StringDataType = fdtStringEh
          DisplayLabel = 'DBF_SUM'
          DisplayWidth = 31
          Size = 31
          Transliterate = True
        end
        object DBF_FIO: TMTStringDataFieldEh
          FieldName = 'DBF_FIO'
          StringDataType = fdtStringEh
          DisplayLabel = 'DBF_FIO'
          DisplayWidth = 31
          Size = 31
          Transliterate = True
        end
        object DBF_ADRES: TMTStringDataFieldEh
          FieldName = 'DBF_ADRES'
          StringDataType = fdtStringEh
          DisplayLabel = 'DBF_ADRES'
          DisplayWidth = 31
          Size = 31
          Transliterate = True
        end
        object ArchDir: TMTStringDataFieldEh
          FieldName = 'ArchDir'
          StringDataType = fdtStringEh
          DisplayLabel = 'ArchDir'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object PAYMENT_NO: TMTNumericDataFieldEh
          FieldName = 'PAYMENT_NO'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'PAYMENT_NO'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DBFPAYMENT_NO: TMTStringDataFieldEh
          FieldName = 'DBFPAYMENT_NO'
          StringDataType = fdtStringEh
          DisplayLabel = 'DBFPAYMENT_NO'
          DisplayWidth = 31
          Size = 31
          Transliterate = True
        end
        object NOTICE1: TMTNumericDataFieldEh
          FieldName = 'NOTICE1'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'NOTICE1'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object NOTICE2: TMTNumericDataFieldEh
          FieldName = 'NOTICE2'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'NOTICE2'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object HOUSE: TMTNumericDataFieldEh
          FieldName = 'HOUSE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'HOUSE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object FLAT: TMTNumericDataFieldEh
          FieldName = 'FLAT'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'FLAT'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DBF_HOUSE: TMTStringDataFieldEh
          FieldName = 'DBF_HOUSE'
          StringDataType = fdtStringEh
          DisplayLabel = 'DBF_HOUSE'
          DisplayWidth = 31
          Size = 31
          Transliterate = True
        end
        object DBF_FLAT: TMTStringDataFieldEh
          FieldName = 'DBF_FLAT'
          StringDataType = fdtStringEh
          DisplayLabel = 'DBF_FLAT'
          DisplayWidth = 31
          Size = 31
          Transliterate = True
        end
        object DBF_NOTICE: TMTStringDataFieldEh
          FieldName = 'DBF_NOTICE'
          StringDataType = fdtStringEh
          DisplayLabel = 'DBF_NOTICE'
          DisplayWidth = 31
          Size = 31
          Transliterate = True
        end
        object DBF_KORP: TMTStringDataFieldEh
          FieldName = 'DBF_KORP'
          StringDataType = fdtStringEh
          DisplayLabel = 'DBF_KORP'
          DisplayWidth = 31
          Size = 31
          Transliterate = True
        end
        object KORP: TMTNumericDataFieldEh
          FieldName = 'KORP'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'KORP'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object EXT_ID: TMTStringDataFieldEh
          FieldName = 'EXT_ID'
          StringDataType = fdtStringEh
          DisplayWidth = 20
          Size = 31
        end
        object DBF_EXTERNAL: TMTStringDataFieldEh
          FieldName = 'DBF_EXTERNAL'
          StringDataType = fdtStringEh
          DisplayLabel = 'DBF_EXTERNAL'
          DisplayWidth = 31
          Size = 31
          Transliterate = True
        end
        object DBF_NotLast: TMTBooleanDataFieldEh
          FieldName = 'DBF_NotLast'
          DisplayWidth = 20
        end
        object SkipEmpDate: TMTBooleanDataFieldEh
          FieldName = 'SkipEmpDate'
          DisplayWidth = 20
        end
        object headSrcCol: TMTNumericDataFieldEh
          FieldName = 'headSrcCol'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object headSrcLine: TMTNumericDataFieldEh
          FieldName = 'headSrcLine'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 411
    Top = 72
  end
  object qFindByExtID: TpFIBQuery
    Transaction = trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'SELECT '
      '    C.Customer_Id,'
      '    C.Account_No,'
      '    C.Cust_Code,'
      '    C.Debt_Sum,'
      '    C.Surname||'#39' '#39'||coalesce(C.Initials,'#39#39') as FIO,'
      
        '    s.Street_Name||'#39' '#39'||s.Street_Short||'#39' '#1076'.'#39'||h.House_No||Coale' +
        'sce('#39' '#1082#1074'.'#39'||C.Flat_No,'#39#39') as ADRES'
      'FROM Customer C'
      '      INNER JOIN HOUSE h ON (C.House_Id = h.House_Id)'
      '      inner join street s  on (S.STREET_ID = h.STREET_ID)'
      '   '
      'where c.External_ID = :Ext_ID')
    Left = 272
    Top = 401
  end
end
