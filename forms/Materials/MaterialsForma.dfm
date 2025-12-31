object MaterialsForm: TMaterialsForm
  Left = 0
  Top = 0
  Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1080' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
  ClientHeight = 452
  ClientWidth = 922
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = mmMaterials
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 0
    Top = 219
    Width = 922
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 922
    Height = 219
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 281
      Top = 0
      Height = 219
    end
    object pnlMat: TPanel
      Left = 284
      Top = 0
      Width = 638
      Height = 219
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGridEh: TDBGridEh
        Left = 0
        Top = 27
        Width = 638
        Height = 192
        Align = alClient
        AllowedOperations = [alopDeleteEh]
        AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
        DataSource = srcDataSource
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        FrozenCols = 3
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentShowHint = False
        PopupMenu = pmPopUp
        SearchPanel.Enabled = True
        ShowHint = True
        SortLocal = True
        STFilter.Local = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnDblClick = DBGridEhDblClick
        OnDataHintShow = DBGridEhDataHintShow
        OnGetCellParams = DBGridEhGetCellParams
        OnMouseMove = DBGridEhMouseMove
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnlMatTop: TPanel
        Left = 0
        Top = 0
        Width = 638
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object pnlBreadCrumps: TPanel
          Left = 165
          Top = 0
          Width = 473
          Height = 27
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
        end
        object pnlMatBtns: TPanel
          Left = 0
          Top = 0
          Width = 165
          Height = 27
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object btnNew: TSpeedButton
            Left = 4
            Top = 2
            Width = 22
            Height = 22
            Action = actNew
            Flat = True
          end
          object btnEdit2: TSpeedButton
            Left = 30
            Top = 2
            Width = 22
            Height = 22
            Action = actEdit
            Flat = True
          end
          object btnDelete: TSpeedButton
            Left = 72
            Top = 2
            Width = 22
            Height = 22
            Action = actDelete
            Flat = True
          end
        end
      end
    end
    object pnlGroup: TPanel
      Left = 0
      Top = 0
      Width = 281
      Height = 219
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object DBGridGroups: TDBGridEh
        Left = 0
        Top = 27
        Width = 281
        Height = 192
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = srcMatGropups
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        SearchPanel.Enabled = True
        SortLocal = True
        STFilter.Local = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnDblClick = DBGridGroupsDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'MG_NAME'
            Footers = <>
            Title.Caption = #1043#1088#1091#1087#1087#1072
            Title.TitleButton = True
            Width = 93
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'MG_NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 170
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 281
        Height = 27
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          281
          27)
        object btnAddGroup: TSpeedButton
          Left = 5
          Top = 2
          Width = 22
          Height = 22
          Action = actAddGroup
          Flat = True
        end
        object btnActEditGroup: TSpeedButton
          Left = 31
          Top = 2
          Width = 22
          Height = 22
          Action = ActEditGroup
          Flat = True
        end
        object btnActDelGroup: TSpeedButton
          Left = 73
          Top = 2
          Width = 22
          Height = 22
          Action = ActDelGroup
          Flat = True
        end
        object btnQuickFilter: TSpeedButton
          Left = 115
          Top = 2
          Width = 22
          Height = 22
          Action = actQuickFilter
          Flat = True
        end
        object btnOpenDocs: TSpeedButton
          Left = 250
          Top = 2
          Width = 22
          Height = 22
          Action = actOpenDocs
          Anchors = [akTop, akRight]
          Flat = True
        end
      end
    end
  end
  object pgcInOut: TPageControl
    Left = 0
    Top = 222
    Width = 922
    Height = 230
    ActivePage = tsIn
    Align = alBottom
    TabOrder = 1
    OnChange = pgcInOutChange
    object tsIn: TTabSheet
      Caption = #1054#1089#1090#1072#1090#1082#1080
      object DBGridIncome: TDBGridEh
        Left = 26
        Top = 0
        Width = 888
        Height = 202
        Align = alClient
        AllowedOperations = []
        DataSource = srcRemain
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        PopupMenu = pmPopUp
        SearchPanel.Enabled = True
        SortLocal = True
        STFilter.Local = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = ',#.#####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'MR_QUANT'
            Footer.DisplayFormat = ',#.#####'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Title.TitleButton = True
            Width = 107
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WH'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1057#1082#1083#1072#1076
            Title.TitleButton = True
            Width = 146
          end
          item
            CellButtons = <>
            DisplayFormat = ',#0.###'
            DynProps = <>
            EditButtons = <>
            FieldName = 'MR_COST'
            Footer.DisplayFormat = ',#0.###'
            Footer.FieldName = 'TOTAL'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1062#1077#1085#1072' '#1077#1076#1080#1085#1080#1094#1099
            Title.TitleButton = True
            Width = 73
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SERIAL'
            Footers = <>
            Title.Caption = 'C/H'
            Title.TitleButton = True
            Visible = False
            Width = 115
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'INVENTORY'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080
            Title.TitleButton = True
            Width = 105
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 202
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object btnactCnPrefixWizard: TSpeedButton
          Left = 1
          Top = 4
          Width = 23
          Height = 23
          Action = actShowSN
          Flat = True
        end
      end
    end
    object tsIncome: TTabSheet
      Caption = #1055#1088#1080#1093#1086#1076
      ImageIndex = 2
      object dbgIncome: TDBGridEh
        Left = 26
        Top = 0
        Width = 888
        Height = 202
        Align = alClient
        AllowedOperations = []
        DataSource = srcIncome
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        PopupMenu = pmPopUp
        SearchPanel.Enabled = True
        SortLocal = True
        STFilter.Local = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnDblClick = dbgIncomeDblClick
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DOC_DATE'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 74
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = ',#0.#####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_QUANT'
            Footer.DisplayFormat = ',#0.#####'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Title.TitleButton = True
            Width = 70
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SHIPPER_COST'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
            Title.TitleButton = True
            Width = 107
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DOC_N'
            Footers = <>
            Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            Title.TitleButton = True
            Width = 116
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WHEREHOUSE'
            Footers = <>
            Title.Caption = #1053#1072' '#1089#1082#1083#1072#1076
            Title.TitleButton = True
            Width = 108
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SERIAL'
            Footers = <>
            Title.Caption = #1057'/'#1053
            Title.TitleButton = True
            Visible = False
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1052'/'#1044
            Title.Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077'  '#1082' '#1084#1072#1090#1077#1088#1080#1072#1083#1091', '#1095#1077#1088#1077#1079' / '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Title.TitleButton = True
            Width = 173
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_BY'
            Footers = <>
            Title.Caption = #1057#1086#1079#1076#1072#1085'|'#1050#1077#1084
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1057#1086#1079#1076#1072#1085'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_BY'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1077#1084
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 202
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object btnShowSN: TSpeedButton
          Left = 1
          Top = 4
          Width = 23
          Height = 23
          Action = actShowSN
          Flat = True
        end
        object btnPrintIncome: TSpeedButton
          Left = 1
          Top = 31
          Width = 23
          Height = 23
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00959595FF777777FF777777FF777777FF777777FF7777
            77FF777777FF939393FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFFFFFFFFD9BB9EFFD9BB9EFFD9BB9EFFD9BB
            9EFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00868686FF7777
            77FF777777FF777777FF777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FF777777FF777777FF777777FF8C8C8CFF777777FFFF00
            FF00FF00FF00777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FFD7D7D7FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFEFFD9D9D9FF777777FF777777FF777777FF7777
            77FFFCFCFCFFBC8955FFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFBD8956FFFEFEFEFF777777FF777777FF777777FF7777
            77FFFBFBFAFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFDFDFCFF777777FF777777FF848484FF7777
            77FFFBFBFAFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFDFDFCFF777777FF898989FFFF00FF00FF00
            FF00FF00FF00B3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEFF777777FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEFF777777FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00939393FF777777FF777777FF777777FF777777FF7777
            77FF777777FF959595FFFF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = btnPrintIncomeClick
        end
      end
    end
    object tsMove: TTabSheet
      Caption = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077
      ImageIndex = 4
      object dbgMove: TDBGridEh
        Left = 26
        Top = 0
        Width = 888
        Height = 202
        Align = alClient
        AllowedOperations = []
        DataSource = srcMove
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        PopupMenu = pmPopUp
        SearchPanel.Enabled = True
        SortLocal = True
        STFilter.Local = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnDblClick = dbgIncomeDblClick
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DOC_DATE'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 74
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = ',#0.#####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_QUANT'
            Footer.DisplayFormat = ',#0.#####'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Title.TitleButton = True
            Width = 70
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DOC_N'
            Footers = <>
            Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            Title.TitleButton = True
            Width = 116
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WHEREHOUSE'
            Footers = <>
            Title.Caption = #1053#1072' '#1089#1082#1083#1072#1076
            Title.TitleButton = True
            Width = 108
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FROM_WH'
            Footers = <>
            Title.Caption = #1057#1086' '#1089#1082#1083#1072#1076#1072
            Title.TitleButton = True
            Width = 109
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SERIAL'
            Footers = <>
            Title.Caption = #1057'/'#1053
            Title.TitleButton = True
            Title.ShowImageAndText = False
            Visible = False
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1052'/'#1044
            Title.Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077'  '#1082' '#1084#1072#1090#1077#1088#1080#1072#1083#1091', '#1095#1077#1088#1077#1079' / '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Title.TitleButton = True
            Width = 108
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_BY'
            Footers = <>
            Title.Caption = #1057#1086#1079#1076#1072#1085'|'#1050#1077#1084
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1057#1086#1079#1076#1072#1085'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_BY'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1077#1084
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 202
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object btnShowSN1: TSpeedButton
          Left = 1
          Top = 4
          Width = 23
          Height = 23
          Action = actShowSN
          Flat = True
        end
        object btnPrintMove: TSpeedButton
          Left = 1
          Top = 31
          Width = 23
          Height = 23
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00959595FF777777FF777777FF777777FF777777FF7777
            77FF777777FF939393FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFFFFFFFFD9BB9EFFD9BB9EFFD9BB9EFFD9BB
            9EFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00868686FF7777
            77FF777777FF777777FF777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FF777777FF777777FF777777FF8C8C8CFF777777FFFF00
            FF00FF00FF00777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FFD7D7D7FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFEFFD9D9D9FF777777FF777777FF777777FF7777
            77FFFCFCFCFFBC8955FFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFBD8956FFFEFEFEFF777777FF777777FF777777FF7777
            77FFFBFBFAFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFDFDFCFF777777FF777777FF848484FF7777
            77FFFBFBFAFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFDFDFCFF777777FF898989FFFF00FF00FF00
            FF00FF00FF00B3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEFF777777FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEFF777777FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00939393FF777777FF777777FF777777FF777777FF7777
            77FF777777FF959595FFFF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = btnPrintIncomeClick
        end
      end
    end
    object tsInventory: TTabSheet
      Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103
      ImageIndex = 6
      object dbgInvent: TDBGridEh
        Left = 26
        Top = 0
        Width = 888
        Height = 202
        Align = alClient
        AllowedOperations = []
        DataSource = srcInvent
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        PopupMenu = pmPopUp
        SearchPanel.Enabled = True
        SortLocal = True
        STFilter.Local = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnDblClick = dbgIncomeDblClick
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DOC_DATE'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 74
          end
          item
            CellButtons = <>
            DisplayFormat = ',#0.#####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'B_QUANT'
            Footers = <>
            Title.Caption = #1050#1086#1083'-'#1074#1086'|'#1044#1086
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = ',#0.#####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_QUANT'
            Footers = <>
            Title.Caption = #1050#1086#1083'-'#1074#1086'|'#1055#1086#1089#1083#1077
            Title.TitleButton = True
            Width = 70
          end
          item
            CellButtons = <>
            DisplayFormat = ',#0.#####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'QDIF'
            Footer.DisplayFormat = '#,###.##'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1050#1086#1083'-'#1074#1086'|'#1056#1072#1079#1085#1080#1094#1072
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITOGO'
            Footer.DisplayFormat = '#,###.##'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
            Title.TitleButton = True
            Width = 70
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DOC_N'
            Footers = <>
            Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            Title.TitleButton = True
            Width = 116
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WHEREHOUSE'
            Footers = <>
            Title.Caption = #1057#1082#1083#1072#1076
            Title.TitleButton = True
            Width = 108
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1052'/'#1044
            Title.Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077'  '#1082' '#1084#1072#1090#1077#1088#1080#1072#1083#1091', '#1095#1077#1088#1077#1079' / '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Title.TitleButton = True
            Width = 108
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_BY'
            Footers = <>
            Title.Caption = #1057#1086#1079#1076#1072#1085'|'#1050#1077#1084
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1057#1086#1079#1076#1072#1085'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_BY'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1077#1084
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 202
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        object btnShowSN2: TSpeedButton
          Left = 1
          Top = 4
          Width = 23
          Height = 23
          Action = actShowSN
          Flat = True
        end
        object btnPrintInvent: TSpeedButton
          Left = 1
          Top = 31
          Width = 23
          Height = 23
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00959595FF777777FF777777FF777777FF777777FF7777
            77FF777777FF939393FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFFFFFFFFD9BB9EFFD9BB9EFFD9BB9EFFD9BB
            9EFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00868686FF7777
            77FF777777FF777777FF777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FF777777FF777777FF777777FF8C8C8CFF777777FFFF00
            FF00FF00FF00777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FFD7D7D7FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFEFFD9D9D9FF777777FF777777FF777777FF7777
            77FFFCFCFCFFBC8955FFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFBD8956FFFEFEFEFF777777FF777777FF777777FF7777
            77FFFBFBFAFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFDFDFCFF777777FF777777FF848484FF7777
            77FFFBFBFAFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFDFDFCFF777777FF898989FFFF00FF00FF00
            FF00FF00FF00B3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEFF777777FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEFF777777FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00939393FF777777FF777777FF777777FF777777FF7777
            77FF777777FF959595FFFF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = btnPrintIncomeClick
        end
      end
    end
    object tsOUT: TTabSheet
      Caption = #1057#1087#1080#1089#1072#1085#1080#1077
      ImageIndex = 5
      object dbgOut: TDBGridEh
        Left = 26
        Top = 0
        Width = 888
        Height = 202
        Align = alClient
        AllowedOperations = []
        DataSource = srcOut
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        PopupMenu = pmPopUp
        SearchPanel.Enabled = True
        SortLocal = True
        STFilter.Local = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnDblClick = dbgIncomeDblClick
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DOC_DATE'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 74
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = ',#0.#####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_QUANT'
            Footer.DisplayFormat = '#,###.##'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Title.TitleButton = True
            Width = 70
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = ',#0.#####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITOGO'
            Footer.DisplayFormat = '#,###.##'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
            Title.TitleButton = True
            Width = 70
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DOC_N'
            Footers = <>
            Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            Title.TitleButton = True
            Width = 116
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WHEREHOUSE'
            Footers = <>
            Title.Caption = #1057#1086' '#1089#1082#1083#1072#1076#1072
            Title.TitleButton = True
            Width = 108
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SERIAL'
            Footers = <>
            Title.Caption = #1057'/'#1053
            Title.TitleButton = True
            Visible = False
            Width = 72
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1052'/'#1044
            Title.Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077'  '#1082' '#1084#1072#1090#1077#1088#1080#1072#1083#1091', '#1095#1077#1088#1077#1079' / '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Title.TitleButton = True
            Width = 108
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_BY'
            Footers = <>
            Title.Caption = #1057#1086#1079#1076#1072#1085'|'#1050#1077#1084
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1057#1086#1079#1076#1072#1085'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_BY'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1077#1084
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 202
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object btnShowSN3: TSpeedButton
          Left = 1
          Top = 4
          Width = 23
          Height = 23
          Action = actShowSN
          Flat = True
        end
        object btnPrintOut: TSpeedButton
          Left = 1
          Top = 31
          Width = 23
          Height = 23
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00959595FF777777FF777777FF777777FF777777FF7777
            77FF777777FF939393FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFFFFFFFFD9BB9EFFD9BB9EFFD9BB9EFFD9BB
            9EFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00868686FF7777
            77FF777777FF777777FF777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FF777777FF777777FF777777FF8C8C8CFF777777FFFF00
            FF00FF00FF00777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FFD7D7D7FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFEFFD9D9D9FF777777FF777777FF777777FF7777
            77FFFCFCFCFFBC8955FFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFBD8956FFFEFEFEFF777777FF777777FF777777FF7777
            77FFFBFBFAFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFDFDFCFF777777FF777777FF848484FF7777
            77FFFBFBFAFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFDFDFCFF777777FF898989FFFF00FF00FF00
            FF00FF00FF00B3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEFF777777FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEFF777777FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00939393FF777777FF777777FF777777FF777777FF7777
            77FF777777FF959595FFFF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = btnPrintIncomeClick
        end
      end
    end
    object tsJournal: TTabSheet
      Caption = #1042' '#1079#1072#1103#1074#1082#1072#1093
      ImageIndex = 2
      object dbgJournal: TDBGridEh
        Left = 26
        Top = 0
        Width = 888
        Height = 202
        Align = alClient
        AllowedOperations = []
        DataSource = srcJournal
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        PopupMenu = pmPopUp
        SearchPanel.Enabled = True
        SortLocal = True
        STFilter.Local = True
        SumList.Active = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnDblClick = dbgJournalDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_ID'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1047#1072#1103#1074#1082#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
            Title.TitleButton = True
            Width = 125
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'O_NAME'
            Footers = <>
            Title.Caption = #1057#1082#1083#1072#1076
            Title.TitleButton = True
            Width = 62
          end
          item
            Alignment = taLeftJustify
            CellButtons = <>
            Checkboxes = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROP'
            Footers = <>
            KeyList.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5')
            PickList.Strings = (
              #1055#1088#1086#1076#1072#1078#1072
              #1042' '#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1080' ('#1072#1088#1077#1085#1076#1072' '#1073#1077#1079' '#1086#1087#1083#1072#1090#1099')'
              #1056#1072#1089#1089#1088#1086#1095#1082#1072
              #1040#1088#1077#1085#1076#1072
              #1042#1086#1079#1074#1088#1072#1090' '#1073#1077#1089#1087#1083#1072#1090#1085#1086
              #1042#1099#1082#1091#1087'('#1042#1086#1079#1074#1088#1072#1090' '#1079#1072' '#1076#1077#1085#1100#1075#1080')')
            Title.Caption = #1053#1072#1095#1080#1089#1083'.'
            Title.Hint = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1085#1077' '#1085#1072#1095#1080#1089#1083#1103#1083#1072#1089#1100' '#1072#1073#1086#1085#1077#1085#1090#1091
            Title.TitleButton = True
            Width = 47
          end
          item
            CellButtons = <>
            DisplayFormat = ',#0.###'
            DynProps = <>
            EditButtons = <>
            FieldName = 'RM_QUANT'
            Footer.DisplayFormat = ',#0.###'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1057#1087#1080#1089#1072#1085#1086'|'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
            Title.TitleButton = True
            Width = 97
            OnGetCellParams = dbgColumnsZerroCellParams
          end
          item
            CellButtons = <>
            DisplayFormat = ',#0.###'
            DynProps = <>
            EditButtons = <>
            FieldName = 'RM_COST'
            Footers = <>
            Title.Caption = #1057#1087#1080#1089#1072#1085#1086'|'#1062#1077#1085#1072
            Title.TitleButton = True
            OnGetCellParams = dbgColumnsZerroCellParams
          end
          item
            CellButtons = <>
            DisplayFormat = ',#0.###'
            DynProps = <>
            EditButtons = <>
            FieldName = 'ITOGO'
            Footer.DisplayFormat = ',#0.###'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1057#1087#1080#1089#1072#1085#1086'|'#1057#1090#1086#1080#1084#1086#1089#1090#1100
            Title.TitleButton = True
            Width = 61
            OnGetCellParams = dbgColumnsZerroCellParams
          end
          item
            CellButtons = <>
            DisplayFormat = ',#0.###'
            DynProps = <>
            EditButtons = <>
            FieldName = 'RETURN_QUANT'
            Footer.DisplayFormat = ',#0.###'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1042#1086#1079#1074#1088#1072#1090'|'#1050#1086#1083'-'#1074#1086
            Title.TitleButton = True
            Width = 83
            OnGetCellParams = dbgColumnsZerroCellParams
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_WHERE'
            Footers = <>
            Title.Caption = #1051#1080#1094#1077#1074#1086#1081' / '#1059#1079#1077#1083
            Title.TitleButton = True
            Width = 69
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1080#1079' '#1079#1072#1103#1074#1082#1080
            Title.TitleButton = True
            Width = 87
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SERIAL'
            Footers = <>
            Title.Caption = #1057'/'#1053
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADR_CODE'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1050#1086#1076
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STREET'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1059#1083#1080#1094#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOUSE_NO'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1044#1086#1084
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'PLACE'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1082#1074'./'#1084'-'#1090#1086
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 202
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object btnPrintHistory: TSpeedButton
          Left = 1
          Top = 4
          Width = 23
          Height = 23
          Action = actPrintHistory
          Flat = True
        end
      end
    end
    object tsItog: TTabSheet
      Caption = #1057#1074#1086#1076
      ImageIndex = 3
      object dbgGridPivot: TDBGridEh
        Left = 26
        Top = 0
        Width = 888
        Height = 202
        Align = alClient
        AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
        ColumnDefValues.AlwaysShowEditButton = True
        ColumnDefValues.Title.TitleButton = True
        ColumnDefValues.Title.ToolTips = True
        ColumnDefValues.ToolTips = True
        Ctl3D = True
        DataGrouping.Active = True
        DataGrouping.Color = clGradientInactiveCaption
        DataGrouping.Footers = <
          item
            ColumnItems = <
              item
              end
              item
              end
              item
              end
              item
              end
              item
              end
              item
                ValueType = gfvSumEh
              end
              item
              end>
            Visible = True
          end>
        DataGrouping.GroupPanelVisible = True
        DataGrouping.GroupRowDefValues.FooterInGroupRow = True
        DataGrouping.GroupRowDefValues.RowHeight = 4
        DataGrouping.GroupRowDefValues.RowLines = 1
        DataGrouping.ParentColor = False
        DataSource = srcItog
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        EvenRowColor = clWindow
        Flat = True
        FooterParams.Color = clBtnFace
        GridLineParams.GridBoundaries = True
        IndicatorTitle.ShowDropDownSign = True
        IndicatorTitle.TitleButton = True
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghHotTrack, dghExtendVertLines]
        ParentCtl3D = False
        ParentShowHint = False
        PopupMenu = pmPopUp
        RowDetailPanel.Height = 200
        RowSizingAllowed = True
        ShowHint = True
        SortLocal = True
        STFilter.FilterButtonDrawTime = fbdtWhenRowHotEh
        STFilter.InstantApply = True
        STFilter.Local = True
        TabOrder = 0
        TitleParams.VTitleMargin = 5
        VertScrollBar.SmoothStep = True
        OnDblClick = dbgGridPivotDblClick
        OnDataGroupGetRowParams = dbgGridPivotDataGroupGetRowParams
        OnGetCellParams = dbgGridPivotGetCellParams
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WH'
            Footers = <>
            Title.Caption = #1057#1082#1083#1072#1076
            Title.TitleButton = True
            Width = 155
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 87
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_TYPE'
            Footers = <>
            Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
            Title.Hint = #1044#1074#1086#1081#1085#1086#1081' '#1082#1083#1080#1082' '#1087#1086' '#1087#1086#1083#1102' - '#1086#1090#1082#1088#1099#1090#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '
            Title.TitleButton = True
            Width = 152
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_DOC'
            Footers = <>
            Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            Title.Hint = #1044#1074#1086#1081#1085#1086#1081' '#1082#1083#1080#1082' '#1087#1086' '#1087#1086#1083#1102' - '#1086#1090#1082#1088#1099#1090#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072' '
            Title.TitleButton = True
            Width = 97
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SERIAL'
            Footers = <>
            Title.Caption = #1057'/'#1053
            Title.TitleButton = True
            Visible = False
          end
          item
            CellButtons = <>
            DisplayFormat = ',#0.#####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'QUANT'
            Footers = <>
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Title.TitleButton = True
            Width = 88
          end
          item
            CellButtons = <>
            DisplayFormat = ',#0.#####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'QUANT_BEFORE'
            Footers = <>
            Title.Caption = #1050#1086#1083'-'#1074#1086' '#1076#1086
            Title.Hint = #1050#1086#1083'-'#1074#1086' '#1076#1086' '#1076#1072#1090#1099' '#1086#1087#1077#1088#1072#1094#1080#1080' '#1085#1072' '#1089#1082#1083#1072#1076#1077
            Title.TitleButton = True
            Width = 73
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 202
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object btnItog: TSpeedButton
          Left = 1
          Top = 4
          Width = 23
          Height = 23
          Action = actShowSN
          Flat = True
        end
      end
    end
    object tsSerials: TTabSheet
      Caption = #1057#1077#1088'. '#1085#1086#1084#1077#1088#1072
      ImageIndex = 7
      object dbgSN: TDBGridEh
        Left = 26
        Top = 0
        Width = 888
        Height = 202
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
        DataSource = srcSerials
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        FrozenCols = 1
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentShowHint = False
        PopupMenu = pmSerial
        SearchPanel.Enabled = True
        ShowHint = True
        EditButtonsShowOptions = [sebShowOnlyForCurCellEh]
        SortLocal = True
        STFilter.Local = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnDblClick = dbgSNDblClick
        OnDataHintShow = DBGridEhDataHintShow
        OnMouseMove = DBGridEhMouseMove
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SERIAL'
            Footer.ValueType = fvtCount
            Footers = <>
            ReadOnly = True
            Title.Caption = #1057'/'#1053
            Title.TitleButton = True
            Width = 127
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'MAC'
            Footers = <>
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'COST'
            Footers = <>
            Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'S_VERSION'
            Footers = <>
            Title.Caption = #1042#1077#1088#1089#1080#1103
            Title.TitleButton = True
            Width = 103
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STATE_STR'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1057#1090#1072#1090#1091#1089
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'OT_NAME'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1042#1083#1072#1076#1077#1083#1077#1094'|'#1058#1080#1087
            Title.TitleButton = True
            Width = 75
          end
          item
            Alignment = taLeftJustify
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'PROPERTY'
            Footers = <>
            KeyList.Strings = (
              '0'
              '1'
              '2'
              '3')
            PickList.Strings = (
              #1053#1072#1095#1080#1089#1083'.'
              #1042' '#1087#1086#1083#1100#1079'.'
              #1056#1072#1089#1089#1088'.'
              #1040#1088#1077#1085#1076#1072)
            Title.Caption = #1042#1083#1072#1076#1077#1083#1077#1094'|'#1053#1072#1095#1080#1089#1083'.'
            Title.TitleButton = True
            Width = 66
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'OWNER_STR'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1042#1083#1072#1076#1077#1083#1077#1094'|'#1042#1083#1072#1076#1077#1083#1077#1094
            Title.TitleButton = True
            Width = 98
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 283
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_BY'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1086'|'#1050#1077#1084
            Title.TitleButton = True
            Width = 115
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1086'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_BY'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085#1086'|'#1050#1077#1084
            Title.TitleButton = True
            Width = 97
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085#1086'|'#1050#1077#1084
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 202
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object BitBtn2: TSpeedButton
          Left = 1
          Top = 4
          Width = 23
          Height = 24
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00959595FF777777FF777777FF777777FF777777FF7777
            77FF777777FF939393FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFFFFFFFFD9BB9EFFD9BB9EFFD9BB9EFFD9BB
            9EFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FFFF00FF00FF00FF00FF00FF00FF00FF00868686FF7777
            77FF777777FF777777FF777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFF787878FF777777FF777777FF777777FF8C8C8CFF777777FFFF00
            FF00FF00FF00777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
            77FFD7D7D7FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFEFFD9D9D9FF777777FF777777FF777777FF7777
            77FFFCFCFCFFBC8955FFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFBD8956FFFEFEFEFF777777FF777777FF777777FF7777
            77FFFBFBFAFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFDFDFCFF777777FF777777FF848484FF7777
            77FFFBFBFAFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFDFDFCFF777777FF898989FFFF00FF00FF00
            FF00FF00FF00B3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
            3DFFB3773DFFB3773DFFB3773DFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEFF777777FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFEFEFEFF777777FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00939393FF777777FF777777FF777777FF777777FF7777
            77FF777777FF959595FFFF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = btnPrintIncomeClick
        end
      end
    end
    object tsFiles: TTabSheet
      Caption = #1060#1072#1081#1083' ('#1092#1086#1090#1086')'
      ImageIndex = 8
      object pnlFiles: TPanel
        Left = 0
        Top = 0
        Width = 24
        Height = 202
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          24
          202)
        object btnFileDel: TSpeedButton
          Left = 1
          Top = 175
          Width = 22
          Height = 22
          Anchors = [akLeft, akBottom]
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
            DDDDDDD8DDDDDDDD8DDDDD893DDDDDD797DDD89993DDDD79998DDD79993DD799
            93DDDDD7999379993DDDDDDD79999993DDDDDDDDD799993DDDDDDDDDD799993D
            DDDDDDDD79999993DDDDDDD7999379993DDDDD79993DD79993DDD83993DDDD79
            998DDD833DDDDDD798DDDDD8DDDDDDDD8DDDDDDDDDDDDDDDDDDD}
          Layout = blGlyphTop
          OnClick = btnFileDelClick
        end
        object btnFileAdd: TSpeedButton
          Left = 1
          Top = 3
          Width = 22
          Height = 22
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD55FF89AD55FF89AD55FF89AD
            55FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD55FF89AD55FF89AD55FF89AD
            55FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD55FF89AD55FF89AD55FF89AD
            55FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD55FF89AD55FF89AD55FF89AD
            55FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD55FF89AD55FF89AD55FF89AD
            55FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008BAE
            59FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD
            55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FFFF00FF00FF00FF008BAE
            59FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD
            55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FFFF00FF00FF00FF008BAE
            59FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD
            55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FFFF00FF00FF00FF008DAF
            5CFF8BAE58FF8BAE58FF8BAE58FF8BAE58FF89AD55FF89AD55FF89AD55FF89AD
            55FF8BAE58FF8BAE58FF8BAE58FF8BAE58FF8BAE58FFFF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD55FF89AD55FF89AD55FF89AD
            55FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD55FF89AD55FF89AD55FF89AD
            55FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD55FF89AD55FF89AD55FF89AD
            55FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD55FF89AD55FF89AD55FF89AD
            55FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF008FB15FFF8FB15FFF8FB15FFF8FB1
            5FFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = btnFileAddClick
        end
        object btnSavePhoto1: TSpeedButton
          Left = 1
          Top = 29
          Width = 22
          Height = 22
          Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1081#1083
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C30E0000C30E00000000000000000000B17AA29F528A
            9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F52
            8A9F528A9F528AAB6E9B9F538B9F528AF4EDF2FCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF5EFF39F528A9F538A9F528A9F528A
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFC9F528A9F528A9F528A9F528AFCFCFCFCFCFCE1E1E1B3B2B2B3B2B2B3
            B2B2B3B2B2B3B2B2B3B2B2E1E1E1FCFCFCFCFCFC9F528A9F528A9F528A9F528A
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFC9F528A9F528A9F528A9F528AFCFCFCFCFCFCE1E1E1B3B2B2B3B2B2B3
            B2B2B3B2B2B3B2B2B3B2B2E1E1E1FCFCFCFCFCFC9F528A9F528A9F528A9F528A
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFC9F528A9F528A9F528A9F528AF5F0F4FCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCF5EFF39F528A9F528A9F528A9F528A
            9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F52
            8A9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F
            528A9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F528A9F528A
            9F528AF0E7EEFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCEEE3
            EB9F528A9F528A9F528A9F528A9F528A9F528AFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFC73706F73706FFCFCFCFCFCFC9F528A9F528A9F528A9F528A9F528A
            9F528AFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC706D6C706D6CFCFCFCFCFC
            FC9F528A9F528A9F528A9F528A9F528A9F528AFCFCFCFCFCFCFCFCFCFCFCFCFC
            FCFCFCFCFC73706F73706FFCFCFCFCFCFC9F528A9F528AA0538BA0548B9F528A
            9F528AFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFCFC
            FC9F528A9E528BC4A3BAAF77A09F528A9F528A9F528A9F528A9F528A9F528A9F
            528A9F528A9F528A9F528A9F528A9F528AA0568CC8ADC1FF00FF}
          OnClick = btnSavePhoto1Click
        end
        object btnViewPhoto: TSpeedButton
          Left = 1
          Top = 71
          Width = 22
          Height = 22
          Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1081#1083
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DD878DDDDDDD
            DDDDD66667DD8DDDDDDD76DD867868DDDDDD67DDD867868DDDDD67DDDD867868
            DDDD868D7DD867868DDDD86876DD867868DDDD86876DD867868DDDD86876DD86
            D868DDDD86876876DD76DDDDD868766DDDD6DDDDDD868DDDDD76DDDDDDD868DD
            DD68DDDDDDDD868D767DDDDDDDDDD86668DDDDDDDDDDDDDDDDDD}
          OnClick = btnViewPhotoClick
        end
      end
      object dbgPhotos: TDBGridEh
        Left = 24
        Top = 0
        Width = 890
        Height = 202
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = srcFiles
        DrawGraphicData = True
        DynProps = <>
        Flat = True
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        TabOrder = 1
        OnDblClick = dbgPhotosDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BL_ID'
            Footers = <>
            ReadOnly = True
            Visible = False
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BL_NAME'
            Footers = <>
            Title.Caption = #1060#1072#1081#1083
            Title.TitleButton = True
            Width = 249
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 352
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 174
    Top = 80
    object actNew: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083'/'#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      ImageIndex = 2
      ShortCut = 16461
      OnExecute = actNewExecute
    end
    object actDelete: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083'/'#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      ImageIndex = 3
      OnExecute = actDeleteExecute
    end
    object actEdit: TAction
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083'/'#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actQuickFilter: TAction
      Hint = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 40
      OnExecute = actQuickFilterExecute
    end
    object actAddGroup: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 2
      ShortCut = 49223
      OnExecute = actAddGroupExecute
    end
    object ActEditGroup: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 4
      OnExecute = ActEditGroupExecute
    end
    object ActDelGroup: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 3
      OnExecute = ActDelGroupExecute
    end
    object actRemainRecalc: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1086#1089#1090#1072#1090#1082#1080' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
      Hint = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1086#1089#1090#1072#1090#1082#1080' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
      ImageIndex = 39
      OnExecute = actRemainRecalcExecute
    end
    object actOpenMatDoc: TAction
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      OnExecute = actOpenMatDocExecute
    end
    object actPrintHistory: TAction
      ImageIndex = 5
      OnExecute = actPrintHistoryExecute
    end
    object actRecalcAll: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1074#1089#1077' '#1086#1089#1090#1072#1090#1082#1080
      ImageIndex = 101
      OnExecute = actRecalcAllExecute
    end
    object actChangeSerial: TAction
      Caption = #1057#1084#1077#1085#1080#1090#1100' '#1057'/'#1053
      Hint = #1057#1084#1077#1085#1080#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1057'/'#1053' '#1085#1072' '#1085#1086#1074#1099#1081' '#1087#1086' '#1074#1089#1077#1081' '#1073#1072#1079#1077
      OnExecute = actChangeSerialExecute
    end
    object actShowSN: TAction
      Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1057'/'#1053' '#1074' '#1090#1072#1073#1083#1080#1094#1077
      ImageIndex = 47
      OnExecute = actShowSNExecute
    end
    object actPrintGrid: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1099
      OnExecute = actPrintGridExecute
    end
    object actCopyID: TAction
      Caption = 'actCopyID'
      ShortCut = 24649
      OnExecute = actCopyIDExecute
    end
    object actOpenDocs: TAction
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1060#1086#1088#1084#1091' '#1044#1074#1080#1078#1077#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      ImageIndex = 28
      OnExecute = actOpenDocsExecute
    end
    object actRecalcWH: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1089#1082#1072#1083#1072#1076
      OnExecute = actRecalcWHExecute
    end
  end
  object dsRemain: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    m.INVENTORY'
      '  , o.o_name as WH'
      '  , t.COST MR_COST'
      '  , @@qnt_clause%m.Mr_Quant@ Mr_Quant'
      '  , @@sn_clause%null@ SERIAL'
      '  , t.COST*(@@qnt_clause%m.Mr_Quant@) TOTAL'
      '  , o.O_DESCRIPTION WH_NOTICE'
      '  , m.WH_ID'
      '  from Materials_Remain m'
      
        '       inner join objects o on (o.o_id = m.WH_ID and o.o_type = ' +
        '10)'
      '       inner join materials t on (t.M_Id = m.M_Id)'
      '       @@join_clause%@'
      ''
      '  where m.M_Id = :M_ID'
      '        and (exists(select'
      '                        w.wh_id'
      '                      from SYS$USER u'
      
        '                           inner join sys$user_wh w on (w.user_i' +
        'd = u.id)'
      '                      where u.ibname = current_user'
      '                            and w.Wh_Id = o.O_ID'
      '                            and w.can_view = 1)'
      '          or current_user = '#39'SYSDBA'#39')'
      '        and coalesce(m.MR_QUANT, 0) <> 0'
      '  order by m.Mr_Quant desc')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_INCOME'
    AutoUpdateOptions.KeyFields = 'MI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWriteDS
    AutoCommit = True
    DataSource = srcDataSource
    Left = 59
    Top = 279
    WaitEndMasterScroll = True
    dcForceOpen = True
  end
  object srcRemain: TDataSource
    AutoEdit = False
    DataSet = dsRemain
    Left = 58
    Top = 334
  end
  object dsMatGropups: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE MATERIALS_GROUP'
      'SET '
      '    MG_NAME = :MG_NAME,'
      '    PARENT_ID = :PARENT_ID,'
      '    MG_NOTICE = :MG_NOTICE,'
      '    SOLD = :SOLD,'
      '    RENT = :RENT,'
      '    LOAN = :LOAN'
      'WHERE'
      '    MG_ID = :OLD_MG_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    MATERIALS_GROUP'
      'WHERE'
      '        MG_ID = :OLD_MG_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO MATERIALS_GROUP('
      '    MG_ID,'
      '    MG_NAME,'
      '    PARENT_ID,'
      '    MG_NOTICE,'
      '    SOLD,'
      '    RENT,'
      '    LOAN'
      ')'
      'VALUES('
      '    :MG_ID,'
      '    :MG_NAME,'
      '    :PARENT_ID,'
      '    :MG_NOTICE,'
      '    :SOLD,'
      '    :RENT,'
      '    :LOAN'
      ')')
    RefreshSQL.Strings = (
      'select * from materials_group'
      'WHERE '
      '  MG_ID = :OLD_MG_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    MG_ID'
      '  , MG_NAME'
      '  , PARENT_ID'
      '  , MG_NOTICE'
      '  , SOLD'
      '  , RENT'
      '  , LOAN'
      '  , PATH'
      '  from MATERIALS_GROUP'
      'union'
      'select'
      '    -999 as MG_ID'
      '  , '#39' '#1041#1045#1047' '#1043#1056#1059#1055#1055#1067#39' MG_NAME'
      '  , null as PARENT_ID'
      '  , '#39#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1073#1077#1079' '#1075#1088#1091#1087#1087#1099#39' as MG_NOTICE'
      '  , null SOLD'
      '  , null RENT'
      '  , null LOAN'
      '  , null PATH'
      '  from RDB$DATABASE'
      '  where (exists(select'
      '                    m.M_Id'
      '                  from materials m'
      '                  where m.Mg_Id is null'
      '                        and m.DELETED = 0))'
      'union'
      'select'
      '    -1 as MG_ID'
      '  , '#39'  '#1042#1057#1045' '#1052#1040#1058#1045#1056#1048#1040#1051#1067#39' MG_NAME'
      '  , null as PARENT_ID'
      '  , '#39#1042#1089#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1099#39' as MG_NOTICE'
      '  , null SOLD'
      '  , null RENT'
      '  , null LOAN'
      '  , null PATH'
      '  from RDB$DATABASE'
      '  order by 2, 1'
      ''
      '   ')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_GROUP'
    AutoUpdateOptions.KeyFields = 'MG_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWriteDS
    AutoCommit = True
    Left = 53
    Top = 99
  end
  object srcMatGropups: TDataSource
    AutoEdit = False
    DataSet = mtGroups
    OnDataChange = srcMatGropupsDataChange
    Left = 49
    Top = 156
  end
  object dsMaterials: TpFIBDataSet
    UpdateSQL.Strings = (
      'update MATERIALS'
      'set NAME = :NAME,'
      '    DIMENSION = :DIMENSION,'
      '    DESCRIPTION = :DESCRIPTION,'
      '    MG_ID = :GR_ID, -- '#1042#1072#1078#1085#1086' MG_ID - GR_ID!!!'
      '    M_NUMBER = :M_NUMBER,'
      '    COST = :COST,'
      '    BEST_COST = :BEST_COST, '
      '    BEST_SHIPPER_ID = :BEST_SHIPPER_ID,'
      '    IS_UNIT = :IS_UNIT,'
      '    IS_DIGIT = :IS_DIGIT, '
      '    IS_NET = :IS_NET,'
      '    M_TYPE = :M_TYPE,'
      '    SOLD = :SOLD,'
      '    RENT = :RENT, '
      '    LOAN = :LOAN,'
      '    PCE = :PCE,'
      '    PROP = :PROP '
      'where (M_ID = :M_ID)')
    DeleteSQL.Strings = (
      'UPDATE Materials SET DELETED = 1 WHERE (M_ID = :M_ID)')
    InsertSQL.Strings = (
      
        'insert into MATERIALS (M_ID, NAME, DIMENSION, IS_UNIT, DESCRIPTI' +
        'ON, MG_ID, DELETED, M_NUMBER, COST, BEST_COST, BEST_SHIPPER_ID, ' +
        'IS_DIGIT, IS_NET, M_TYPE, SOLD, RENT, LOAN, PCE, PROP)'
      
        'values (:M_ID, :NAME, :DIMENSION, :IS_UNIT, :DESCRIPTION, :GR_ID' +
        ', 0, :M_NUMBER, :COST, :BEST_COST, :BEST_SHIPPER_ID, :IS_DIGIT, ' +
        ':IS_NET, :M_TYPE, :SOLD, :RENT, :LOAN, :PCE, :PROP)'
      '-- '#1042#1072#1078#1085#1086' MG_ID - GR_ID!!!')
    SelectSQL.Strings = (
      '-- Select SQL'
      'EXECUTE BLOCK ('
      'MG_ID INTEGER = :MG_ID,'
      'IN_GR INTEGER = :IN_GR,'
      'SHOW_DELETED integer = :SHOW_DELETED)'
      'RETURNS('
      '   M_ID    INTEGER '
      '  ,GR_ID   INTEGER'
      '  ,NAME VARCHAR(255)'
      '  ,DIMENSION VARCHAR(10)'
      '  ,COST NUMERIC(15,3)'
      '  ,PCE NUMERIC(15,3)      '
      '  ,M_NUMBER  VARCHAR(20)'
      '  ,BEST_SHIPPER_ID   INTEGER '
      '  ,BEST_SHIPPER VARCHAR(255)'
      '  ,BEST_COST NUMERIC(15,3)  '
      '  ,DESCRIPTION D_NOTICE'
      '  ,IS_UNIT D_IBOOLEAN'
      '  ,IS_NET D_IBOOLEAN'
      '  ,IS_DIGIT D_IBOOLEAN'
      '  ,M_TYPE  INTEGER'
      '  ,SOLD D_UID_NULL  '
      '  ,RENT D_UID_NULL'
      '  ,LOAN D_UID_NULL  '
      '  ,TYPE_NAME VARCHAR(255)  '
      '  ,QNT00000020 NUMERIC(15,3) '
      '  ,CST00000020 NUMERIC(15,3) '
      '  ,QNT00000021 NUMERIC(15,3) '
      '  ,CST00000021 NUMERIC(15,3) '
      '  ,QNT00004408 NUMERIC(15,3) '
      '  ,CST00004408 NUMERIC(15,3) '
      '  ,QNTTOTAL NUMERIC(15,3) '
      '  ,CSTTOTAL NUMERIC(15,3) '
      ''
      ')AS '
      'BEGIN '
      'GR_ID = MG_ID;'
      'FOR'
      
        '  select M_ID, NAME, DIMENSION, M_NUMBER, DESCRIPTION, IS_UNIT, ' +
        'COST, m.BEST_SHIPPER_ID, m.BEST_COST, o.O_NAME,'
      
        '         m.Mg_Id, m.IS_DIGIT, m.IS_NET, M_TYPE, t.O_NAME MT_NAME' +
        ', RENT, LOAN, m.PCE '
      '  from MATERIALS m'
      
        '    left outer join OBJECTS o on (o.O_ID = m.BEST_SHIPPER_ID and' +
        ' o.O_TYPE = 29) '
      
        '    left outer join OBJECTS t on (t.O_ID = m.M_Type and t.O_TYPE' +
        ' = 48) '
      
        '  where ((m.deleted =0 and :SHOW_DELETED = 0) or (:show_deleted ' +
        '= 1))'
      
        '    and ((:MG_ID = -1) or (((m.MG_ID = :MG_ID) and (not :MG_ID i' +
        's null)) or ((coalesce(m.MG_ID, -1) = -1) and (:MG_ID is null)))' +
        ')'
      '  order by NAME'
      
        '  into :M_ID, :NAME, :DIMENSION, :M_NUMBER, :DESCRIPTION, :IS_UN' +
        'IT, :COST, :BEST_SHIPPER_ID, :BEST_COST, :BEST_SHIPPER,'
      
        '       :GR_ID, :IS_DIGIT, :IS_NET, :M_TYPE, :TYPE_NAME, :RENT, :' +
        'LOAN, :PCE'
      'DO BEGIN'
      '          QNTTOTAL = 0;'
      '    CSTTOTAL = 0;'
      
        'select SUM(MR_QUANT), sum(MR_QUANT*MR_COST) from MATERIALS_REMAI' +
        'N where (M_ID = :M_ID) and (WH_ID = 20) INTO :QNT00000020,CST000' +
        '00020; '
      
        'select SUM(MR_QUANT), sum(MR_QUANT*MR_COST) from MATERIALS_REMAI' +
        'N where (M_ID = :M_ID) and (WH_ID = 21) INTO :QNT00000021,CST000' +
        '00021; '
      
        'select SUM(MR_QUANT), sum(MR_QUANT*MR_COST) from MATERIALS_REMAI' +
        'N where (M_ID = :M_ID) and (WH_ID = 4408) INTO :QNT00004408,CST0' +
        '0004408; '
      
        '    QNTTOTAL = :QNTTOTAL + coalesce(:QNT00000020,0) + coalesce(:' +
        'QNT00000021,0) + coalesce(:QNT00004408,0);'
      
        '    CSTTOTAL = :CSTTOTAL + coalesce(:CST00000020,0) + coalesce(:' +
        'CST00000021,0) + coalesce(:CST00004408,0);'
      ''
      '    SUSPEND;'
      'END'
      'END')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 366
    Top = 78
    oFetchAll = True
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 549
    Top = 87
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 501
    Top = 87
  end
  object TrTemp: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 501
    Top = 135
  end
  object QrTemp: TpFIBQuery
    Transaction = TrTemp
    Database = dmMain.dbTV
    Left = 549
    Top = 135
  end
  object srcDataSource: TDataSource
    DataSet = dsMaterials
    OnDataChange = srcDataSourceDataChange
    Left = 367
    Top = 125
  end
  object PropStorage: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'pgcInOut.<P>.Height'
      'pnlHead.pnlGroup.<P>.Width')
    Left = 493
    Top = 37
  end
  object dsJournal: TpFIBDataSet
    SelectSQL.Strings = (
      'select r.*'
      ', h.house_no'
      ', s.street_name||'#39' '#39'||s.street_short STREET'
      
        ', s.Street_Code||'#39'-'#39'||h.House_No||'#39'-'#39'||coalesce(r.PLACE, '#39#39') ADR' +
        '_CODE'
      'from'
      '('
      'select'
      '    r.rq_id'
      '  , cast(r.RQ_EXEC_TIME as date) as m_date'
      '  , rm.rm_quant'
      '  , rm.Rm_Cost'
      '  , coalesce(rm.rm_quant, 0) * coalesce(rm.Rm_Cost, 0) itogo'
      '  , 0.00 as return_quant'
      '  , o.O_Name'
      '  , coalesce(c.Account_No, '#39#1059#1079'. '#39'||n.Name) M_WHERE'
      '  , rm.Rm_Notice NOTICE'
      '  , r.Rq_Customer Customer_Id'
      '  , r.Node_Id'
      '  , coalesce(rm.PROP, 0) PROP'
      '  , rm.Serial'
      '  , r.House_Id'
      '  , coalesce(c.flat_no, n.place) place'
      '  from request_materials rm'
      '       inner join request r on (rm.rq_id = r.rq_id)'
      
        '       left outer join objects o on (o.O_Id = rm.Wh_Id and o.O_T' +
        'ype = 10)'
      
        '       left outer join Customer c on (c.Customer_Id = r.Rq_Custo' +
        'mer)'
      '       left outer join nodes n on (n.Node_Id = r.Node_Id)'
      '  where rm.m_id = :M_ID'
      'union'
      'select'
      '    r.rq_id'
      '  , cast(r.RQ_EXEC_TIME as date) as m_date'
      '  , 0.00 as rm_quant'
      '  , 0.00 Rm_Cost'
      '  , 0.00 itogo'
      '  , rm.Quant as return_quant'
      '  , o.O_Name'
      '  , coalesce(c.Account_No, '#39#1059#1079'. '#39'||n.Name) M_WHERE'
      '  , rm.Notice NOTICE'
      '  , r.Rq_Customer Customer_Id'
      '  , r.Node_Id  '
      '  , coalesce(PROP, rm.CALC, 4) as PROP'
      '  , rm.Serial'
      '  , r.House_Id'
      '  , coalesce(c.flat_no, n.place) place'
      '  from Request_Materials_Return rm'
      '       inner join request r on (rm.rq_id = r.rq_id)'
      
        '       left outer join objects o on (o.O_Id = rm.Wh_Id and o.O_T' +
        'ype = 10)'
      
        '       left outer join Customer c on (c.Customer_Id = r.Rq_Custo' +
        'mer)'
      '       left outer join nodes n on (n.Node_Id = r.Node_Id)'
      '  where rm.m_id = :M_ID'
      ')  r'
      '       inner join house h on (h.House_Id = r.House_Id)'
      '       inner join street s on (s.Street_Id = h.Street_Id)'
      'order by r.m_date desc, r.rq_id')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_INCOME'
    AutoUpdateOptions.KeyFields = 'MI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWriteDS
    AutoCommit = True
    DataSource = srcDataSource
    Left = 378
    Top = 286
    WaitEndMasterScroll = True
    dcForceOpen = True
  end
  object srcJournal: TDataSource
    AutoEdit = False
    DataSet = dsJournal
    Left = 372
    Top = 334
  end
  object dsIncome: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    d.Doc_N'
      '  , d.Doc_Date'
      
        '  , trim('#39'/'#39' from coalesce(im.M_Notice, '#39#39') || coalesce('#39'/'#39' || d' +
        '.Notice, '#39#39')) Notice'
      '  , w.O_Name wherehouse'
      '  , im.Shipper_Cost'
      '  , d.Dt_Id'
      '  , d.Doc_Id'
      '  , D.Added_On'
      '  , D.Edit_On'
      '  , coalesce(a.Surname, d.Added_By) as Added_By'
      '  , coalesce(e.Surname, d.Edit_By) as Edit_By'
      '  , t.O_CHARFIELD DT_REPORT'
      '  , @@qnt_clause%im.M_Quant@ M_Quant  '
      '  , @@sn_clause%null@ SERIAL'
      '  , d.Wh_Id '
      '  from Material_Docs d'
      '       inner join Materials_In_Doc im on (d.Doc_Id = im.Doc_Id)'
      
        '       inner join Objects t on (T.O_Id = d.Dt_Id and t.O_Type = ' +
        '28)'
      
        '       left outer join objects w on ( w.O_Id = d.Wh_Id and w.O_T' +
        'ype = 10)'
      '       left outer join worker a on (a.Ibname = d.Added_By)'
      '       left outer join worker e on (e.Ibname = d.Edit_By)'
      '       @@join_clause%@'
      '              '
      '  where d.Doc_Closed = 1'
      '        and d.Dt_Id = 1'
      '        and im.M_Id = :M_ID   '
      'order by d.Doc_Date desc, d.Doc_N')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_INCOME'
    AutoUpdateOptions.KeyFields = 'MI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWriteDS
    AutoCommit = True
    DataSource = srcDataSource
    Left = 131
    Top = 279
    WaitEndMasterScroll = True
    dcForceOpen = True
  end
  object srcIncome: TDataSource
    AutoEdit = False
    DataSet = dsIncome
    Left = 132
    Top = 331
  end
  object frxReport: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38761.722679213000000000
    ReportOptions.LastChange = 41847.539245937500000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnUserFunction = frxReportUserFunction
    Left = 312
    Top = 152
  end
  object dsItogo: TMemTableEh
    AggregatesActive = True
    AutoCalcFields = False
    DetailFields = 'M_ID'
    FetchAllOnOpen = True
    MasterDetailSide = mdsOnProviderEh
    MasterFields = 'M_ID'
    MasterSource = srcDataSource
    Params = <>
    DataDriver = drvFIB
    ReadOnly = True
    Left = 500
    Top = 283
  end
  object drvFIB: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'M_ID'
        ParamType = ptUnknown
        Value = Null
      end>
    SelectCommand.CommandText.Strings = (
      'select * from MATERIALS_SUMMARY(:M_ID, 0)')
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <>
    GetrecCommand.Params = <>
    Left = 580
    Top = 283
  end
  object srcItog: TDataSource
    DataSet = dsItogo
    Left = 500
    Top = 331
  end
  object dsMove: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    d.Doc_N || '#39' ('#39' || t.O_Name || '#39')'#39' Doc_N'
      '  , d.Doc_Date'
      
        '  , trim('#39'/'#39' from coalesce(im.M_Notice, '#39#39') || coalesce('#39'/'#39' || d' +
        '.Notice, '#39#39')) Notice'
      '  , w.O_Name wherehouse'
      '  , im.Shipper_Cost'
      '  , wo.O_Name FROM_WH'
      '  , d.Dt_Id'
      '  , d.Doc_Id'
      '  , D.Added_On'
      '  , D.Edit_On'
      '  , coalesce(a.Surname, d.Added_By) as Added_By'
      '  , coalesce(e.Surname, d.Edit_By) as Edit_By'
      '  , t.O_CHARFIELD DT_REPORT  '
      '  , @@qnt_clause%im.M_Quant@ M_Quant  '
      '  , @@sn_clause%null@ SERIAL'
      '  , d.Wh_Id      '
      '  from Material_Docs d'
      '       inner join(select'
      '                      im.Doc_Id'
      '                    , im.Shipper_Cost'
      '                    , coalesce(im.M_Notice, '#39#39') M_Notice'
      '                    , sum(im.M_Quant) M_Quant'
      '                    from Materials_In_Doc im'
      '                    where im.M_Id = :M_ID'
      
        '                    group by 1, 2, 3) im on (d.Doc_Id = im.Doc_I' +
        'd)'
      '       inner join Objects t on (T.O_Id = d.Dt_Id and'
      '             t.O_Type = 28)'
      '       left outer join objects w on (w.O_Id = d.Wh_Id and'
      '             w.O_Type = 10)'
      '       left outer join objects wo on (wo.O_Id = d.From_Wh and'
      '             wo.O_Type = 10)'
      '       left outer join worker a on (a.Ibname = d.Added_By)'
      '       left outer join worker e on (e.Ibname = d.Edit_By) '
      '       '
      '       @@join_clause%@'
      '                   '
      '  where d.Doc_Closed = 1'
      '        and d.Dt_Id = 2'
      '  order by d.Doc_Date desc, d.Doc_N')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_INCOME'
    AutoUpdateOptions.KeyFields = 'MI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWriteDS
    AutoCommit = True
    DataSource = srcDataSource
    Left = 195
    Top = 279
    WaitEndMasterScroll = True
    dcForceOpen = True
  end
  object srcMove: TDataSource
    AutoEdit = False
    DataSet = dsMove
    Left = 196
    Top = 331
  end
  object dsInvent: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    d.Doc_N,'
      '    d.Doc_Date,'
      
        '    trim('#39'/'#39' from coalesce(im.M_Notice, '#39#39') || coalesce('#39'/'#39' || d' +
        '.Notice, '#39#39')) Notice,'
      '    w.O_Name wherehouse,'
      '    im.M_Quant,'
      '    im.B_Quant,'
      '    (im.M_Quant - im.B_Quant) QDIF,'
      '    m.Cost,'
      '    (im.M_Quant - im.B_Quant) * m.Cost ITOGO,'
      '    d.Dt_Id,'
      '    d.Doc_Id'
      '  , D.Added_On'
      '  , D.Edit_On'
      '  , t.O_CHARFIELD DT_REPORT  '
      '  , coalesce(a.Surname, d.Added_By) as Added_By'
      '  , coalesce(e.Surname, d.Edit_By) as Edit_By'
      '  , d.Wh_Id      '
      '  from Material_Docs d'
      '       inner join Materials_In_Doc im on (d.Doc_Id = im.Doc_Id)'
      '       inner join materials m on (m.M_Id = im.M_Id)'
      
        '       inner join Objects t on (T.O_Id = d.Dt_Id and t.O_Type = ' +
        '28)'
      
        '       left outer join objects w on ( w.O_Id = d.Wh_Id and w.O_T' +
        'ype = 10)'
      '       left outer join worker a on (a.Ibname = d.Added_By)'
      '       left outer join worker e on (e.Ibname = d.Edit_By)       '
      '  where d.Doc_Closed = 1'
      '        and d.Dt_Id = 5'
      '        and im.M_Id = :M_ID   '
      'order by d.Doc_Date desc, d.Doc_N'
      '')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_INCOME'
    AutoUpdateOptions.KeyFields = 'MI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWriteDS
    AutoCommit = True
    DataSource = srcDataSource
    Left = 251
    Top = 279
    WaitEndMasterScroll = True
    dcForceOpen = True
  end
  object srcInvent: TDataSource
    AutoEdit = False
    DataSet = dsInvent
    Left = 252
    Top = 331
  end
  object srcOut: TDataSource
    AutoEdit = False
    DataSet = dsOut
    Left = 308
    Top = 331
  end
  object dsOut: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    d.Doc_N'
      '  , d.Doc_Date'
      
        '  , trim('#39'/'#39' from coalesce(im.M_Notice, '#39#39') || coalesce('#39'/'#39' || d' +
        '.Notice, '#39#39')) Notice'
      '  , w.O_Name wherehouse'
      '  , d.Dt_Id'
      '  , d.Doc_Id'
      '  , D.Added_On'
      '  , D.Edit_On'
      '  , coalesce(a.Surname, d.Added_By) as Added_By'
      '  , coalesce(e.Surname, d.Edit_By) as Edit_By'
      '  , t.O_CHARFIELD DT_REPORT'
      '  , @@qnt_clause%-1*im.M_Quant@ M_Quant'
      '  , @@itg_clause%-1*im.M_Quant*m.Cost@ ITOGO  '
      '  , @@sn_clause%null@ SERIAL'
      '  , d.Wh_Id        '
      '  from Material_Docs d'
      '       inner join Materials_In_Doc im on (d.Doc_Id = im.Doc_Id)'
      '       inner join materials m on (m.M_Id = im.M_Id)'
      
        '       left outer join objects w on ( w.O_Id = d.Wh_Id and w.O_T' +
        'ype = 10)'
      
        '       left outer join objects t on (t.O_Id = d.Dt_Id and t.O_TY' +
        'PE = 28)'
      '       left outer join worker a on (a.Ibname = d.Added_By)'
      '       left outer join worker e on (e.Ibname = d.Edit_By)'
      '       '
      '       @@join_clause%@'
      '       '
      '  where d.Doc_Closed = 1'
      '        and d.Dt_Id = 3'
      '        and im.M_Id = :M_ID   '
      'order by d.Doc_Date desc, d.Doc_N')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_INCOME'
    AutoUpdateOptions.KeyFields = 'MI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWriteDS
    AutoCommit = True
    DataSource = srcDataSource
    Left = 307
    Top = 279
    WaitEndMasterScroll = True
    dcForceOpen = True
  end
  object qReqFile: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select b.Bl_Body from Blob_Tbl b where b.Bl_Id = :Bl_Id')
    Left = 669
    Top = 88
  end
  object dsSerials: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE MATERIAL_UNIT'
      'SET '
      '    NOTICE = :NOTICE,'
      '    MAC = :MAC,'
      '    COST = :COST,'
      '    S_VERSION = :S_VERSION'
      'WHERE'
      '    M_ID = :OLD_M_ID'
      '    and SERIAL = :OLD_SERIAL'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    u.*'
      '  , case u.State'
      '      when 0 then '#39#1085#1072' '#1089#1082#1083#1072#1076#1077#39
      '      when 1 then '#39#1074#1099#1076#1072#1085#39
      '      when 2 then '#39#1074' '#1088#1077#1084#1086#1085#1090#1077#39
      '      when 3 then '#39#1087#1088#1086#1076#1072#1085#39
      '      when 4 then '#39#1089#1087#1080#1089#1072#1085#39
      '      else u.State || '#39' '#1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085#39
      '    end STATE_STR'
      '  , o.O_Name OT_NAME'
      '  , case u.Owner_Type'
      
        '      when 0 then (select first 1 w.O_Name from Objects w where ' +
        'u.Owner = w.O_Id and w.O_Type = 10)'
      
        '      when 1 then (select first 1 c.Account_No||'#39' '#39'||c.Surname||' +
        #39' '#39'||c.Initials from customer c where u.Owner = c.Customer_Id)'
      
        '      when 2 then (select first 1 n.Name from Nodes n where u.Ow' +
        'ner = n.Node_Id)'
      '      else u.Owner_Type || '#39' '#1085#1077#1086#1087#1088#1077#1076#1077#1083#1077#1085#39
      '    end OWNER_STR'
      '  , case u.Owner_Type'
      
        '      when 1 then (select first 1 a.Property from Appliance a wh' +
        'ere a.Own_Id = u.Owner and a.M_Id = u.M_Id and a.Serial = u.Seri' +
        'al)'
      '      else null'
      '    end PROPERTY'
      '  from Material_Unit u'
      
        '  left outer join Objects o on (u.Owner_Type = o.O_Id and o.O_Ty' +
        'pe = 51)'
      '  where'
      '    U.M_ID = :OLD_M_ID'
      '    and U.SERIAL = :OLD_SERIAL'
      ''
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    u.*'
      '  , case u.State'
      '      when 0 then '#39#1085#1072' '#1089#1082#1083#1072#1076#1077#39
      '      when 1 then '#39#1074#1099#1076#1072#1085#39
      '      when 2 then '#39#1074' '#1088#1077#1084#1086#1085#1090#1077#39
      '      when 3 then '#39#1087#1088#1086#1076#1072#1085#39
      '      when 4 then '#39#1089#1087#1080#1089#1072#1085#39
      '      when 5 then '#39#1074#1099#1082#1091#1087#39
      '      else u.State || '#39' '#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39
      '    end STATE_STR'
      '  , o.O_Name OT_NAME'
      '  , case u.Owner_Type'
      
        '      when 0 then (select first 1 w.O_Name from Objects w where ' +
        'u.Owner = w.O_Id and w.O_Type = 10)'
      
        '      when 1 then (select first 1 c.Account_No||'#39' '#39'||c.Surname||' +
        #39' '#39'||c.Initials from customer c where u.Owner = c.Customer_Id)'
      
        '      when 2 then (select first 1 n.Name from Nodes n where u.Ow' +
        'ner = n.Node_Id)'
      '      else u.Owner_Type || '#39' '#1085#1077' '#1086#1087#1088#1077#1076#1077#1083#1077#1085#39
      '    end OWNER_STR'
      '  , case u.Owner_Type'
      
        '      when 1 then (select first 1 a.Property from Appliance a wh' +
        'ere a.Own_Id = u.Owner and a.M_Id = u.M_Id and a.Serial = u.Seri' +
        'al)'
      '      else null'
      '    end PROPERTY'
      '  from Material_Unit u'
      
        '  left outer join Objects o on (u.Owner_Type = o.O_Id and o.O_Ty' +
        'pe = 51)'
      '  where u.M_Id = :M_ID'
      '  order by u.Serial')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_INCOME'
    AutoUpdateOptions.KeyFields = 'MI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 442
    Top = 286
    WaitEndMasterScroll = True
    dcForceOpen = True
  end
  object srcSerials: TDataSource
    DataSet = dsSerials
    Left = 436
    Top = 334
  end
  object trWriteDS: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 688
    Top = 320
  end
  object trReadDS: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 784
    Top = 280
  end
  object pmPivot: TPopupMenu
    Left = 668
    Top = 152
    object miRowHight: TMenuItem
      Caption = #1040#1074#1090#1086#1074#1099#1089#1086#1090#1072' '#1089#1090#1088#1086#1082
    end
  end
  object frxMaterials: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = 'frxMaterials'
    CloseDataSource = False
    DataSet = dsMaterials
    BCDToCurrency = False
    DataSetOptions = []
    Left = 611
    Top = 112
  end
  object pmSerial: TPopupMenu
    Left = 628
    Top = 326
    object miChSerial: TMenuItem
      Action = actChangeSerial
    end
    object miN2: TMenuItem
      Caption = '-'
    end
    object miStateChange: TMenuItem
      AutoHotkeys = maManual
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1090#1072#1090#1091#1089
      object miN01: TMenuItem
        Caption = '0 - '#1085#1072' '#1089#1082#1083#1072#1076#1077' '
        OnClick = miN41Click
      end
      object miN11: TMenuItem
        Tag = 1
        Caption = '1 - '#1074#1099#1076#1072#1085
        OnClick = miN41Click
      end
      object miN21: TMenuItem
        Tag = 2
        Caption = '2 - '#1074' '#1088#1077#1084#1086#1085#1090#1077
        OnClick = miN41Click
      end
      object miN31: TMenuItem
        Tag = 3
        Caption = '3 - '#1087#1088#1086#1076#1072#1085
        OnClick = miN41Click
      end
      object miN41: TMenuItem
        Tag = 4
        Caption = '4 - '#1089#1087#1080#1089#1072#1085
        OnClick = miN41Click
      end
    end
    object miSep1: TMenuItem
      Caption = '-'
    end
    object mi1: TMenuItem
      Caption = '&'#1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = mi1Click
    end
    object mi2: TMenuItem
      Caption = '&'#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnClick = mi2Click
    end
    object mi3: TMenuItem
      Caption = '-'
    end
    object mi4: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082' ...'
      OnClick = mi4Click
    end
    object miPrint: TMenuItem
      Action = actPrintGrid
    end
  end
  object pmPopUp: TPopupMenu
    OnPopup = pmPopUpPopup
    Left = 219
    Top = 119
    object mniFilterFLD: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1079#1085#1072#1095#1077#1085#1080#1102
      OnClick = mniFilterFLDClick
    end
    object mniN1: TMenuItem
      Caption = '-'
    end
    object pmgCopy: TMenuItem
      Caption = '&'#1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = pmgCopyClick
    end
    object pmgSelectAll: TMenuItem
      Caption = '&'#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnClick = pmgSelectAllClick
    end
    object pmgSep2: TMenuItem
      Caption = '-'
    end
    object pmgSaveSelection: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082' ...'
      OnClick = pmgSaveSelectionClick
    end
    object miPrintGrid: TMenuItem
      Action = actPrintGrid
    end
    object pmgSep1: TMenuItem
      Caption = '-'
    end
    object miRefresh: TMenuItem
      Caption = '&'#1055#1077#1088#1077#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077
      OnClick = miRefreshClick
    end
    object miSpltWh: TMenuItem
      Caption = '-'
      Visible = False
    end
    object miRecalcWH: TMenuItem
      Action = actRecalcWH
      Visible = False
    end
    object miRemainRecalcMat: TMenuItem
      Action = actRemainRecalc
      Visible = False
    end
  end
  object printGridEh: TPrintDBGridEh
    Options = []
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'Tahoma'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'Tahoma'
    PageHeader.Font.Style = []
    Units = MM
    Left = 744
    Top = 160
  end
  object mmMaterials: TMainMenu
    Images = A4MainForm.ICONS_ACTIVE
    Left = 144
    Top = 144
    object miMi: TMenuItem
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
      GroupIndex = 2
      object miQuickFilter: TMenuItem
        Action = actQuickFilter
        Caption = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      end
      object miMiFrozen: TMenuItem
        Caption = #1047#1072#1082#1088#1077#1087#1080#1090#1100' '#1089#1090#1086#1083#1073#1094#1099' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
        OnClick = miMiFrozenClick
      end
      object miN3: TMenuItem
        Caption = '-'
      end
      object miN4: TMenuItem
        Caption = #1043#1088#1091#1087#1087#1099
        object miAddGroup: TMenuItem
          Action = actAddGroup
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
          ShortCut = 16455
        end
        object miActEditGroup: TMenuItem
          Action = ActEditGroup
          Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1075#1088#1091#1087#1087#1091
        end
        object miN8: TMenuItem
          Caption = '-'
        end
        object miActDelGroup: TMenuItem
          Action = ActDelGroup
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
        end
      end
      object miME: TMenuItem
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099'/'#1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        object miNew: TMenuItem
          Action = actNew
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083'/'#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        end
        object miEdit: TMenuItem
          Action = actEdit
          Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083'/'#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        end
        object miN5: TMenuItem
          Caption = '-'
        end
        object miDelete: TMenuItem
          Action = actDelete
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083'/'#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        end
        object miN9: TMenuItem
          Caption = '-'
        end
        object miRemainRecalc: TMenuItem
          Action = actRemainRecalc
          Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1086#1089#1090#1072#1090#1082#1080
        end
      end
      object miN7: TMenuItem
        Caption = '-'
      end
      object miOpenDocs1: TMenuItem
        Action = actOpenDocs
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1060#1086#1088#1084#1091' '#1044#1074#1080#1078#1077#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      end
      object miN6: TMenuItem
        Caption = '-'
      end
      object miRemainRecalcMatMain: TMenuItem
        Action = actRemainRecalc
      end
      object miN1: TMenuItem
        Caption = '-'
      end
      object miRecalcAll: TMenuItem
        Action = actRecalcAll
      end
    end
  end
  object dsFiles: TpFIBDataSet
    UpdateSQL.Strings = (
      ''
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    BLOB_TBL'
      'WHERE'
      '        BL_ID = :OLD_BL_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    b.Bl_Id'
      '  , b.Bl_Name'
      '  , b.OWNER_ID'
      '  , b.NOTICE'
      '  from Blob_Tbl b '
      ' where'
      '  BL_ID = :OLD_BL_ID'
      'order by b.Bl_Name'
      ''
      ''
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    b.Bl_Id'
      '  , b.Bl_Name'
      '  , b.OWNER_ID'
      '  , b.NOTICE'
      '  from Blob_Tbl b '
      ' where'
      '  b.Owner_Id = :M_ID and b.Bl_Type = 4'
      'order by b.Bl_Name')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_INCOME'
    AutoUpdateOptions.KeyFields = 'MI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 762
    Top = 286
    WaitEndMasterScroll = True
    dcForceOpen = True
  end
  object srcFiles: TDataSource
    DataSet = dsFiles
    Left = 764
    Top = 334
  end
  object qryBlobFile: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select b.Bl_Body from Blob_Tbl b where b.Bl_Id = :Bl_Id')
    Left = 813
    Top = 288
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '*.*'
    Left = 864
    Top = 288
  end
  object qSaveFile: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'INSERT INTO Blob_Tbl (Bl_Type, Owner_Id, Bl_Name, Bl_Body)'
      'VALUES (:Bl_Type, :Owner_Id, :Bl_Name, :Bl_Body)'
      '')
    Left = 813
    Top = 336
  end
  object dlgSave: TSaveDialog
    Left = 860
    Top = 336
  end
  object mtGroups: TMemTableEh
    Params = <>
    DataDriver = drvFibGroups
    TreeList.Active = True
    TreeList.KeyFieldName = 'MG_ID'
    TreeList.RefParentFieldName = 'Parent_ID'
    TreeList.DefaultNodeExpanded = True
    TreeList.FilterNodeIfParentVisible = False
    Left = 104
    Top = 112
  end
  object drvFibGroups: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    SelectCommand.CommandText.Strings = (
      'select'
      '    MG_ID'
      '  , MG_NAME'
      '  , PARENT_ID'
      '  , MG_NOTICE'
      '  , SOLD'
      '  , RENT'
      '  , LOAN'
      '  , iif(coalesce(PATH, '#39#39') = '#39#39', MG_NAME, PATH) PATH'
      '  , g.Pce'
      '  , g.Prop'
      '  from MATERIALS_GROUP g'
      '  where coalesce(g.Deleted, 0) = 0'
      'union'
      'select'
      '    -999 as MG_ID'
      '  , '#39' '#1041#1045#1047' '#1043#1056#1059#1055#1055#1067#39' MG_NAME'
      '  , null as PARENT_ID'
      '  , '#39#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1073#1077#1079' '#1075#1088#1091#1087#1087#1099#39' as MG_NOTICE'
      '  , null SOLD'
      '  , null RENT'
      '  , null LOAN'
      '  , null PATH'
      '  , null Pce'
      '  , null Prop'
      '  from RDB$DATABASE'
      '  where (exists(select'
      '                    m.M_Id'
      '                  from materials m'
      '                  where m.Mg_Id is null'
      '                        and m.DELETED = 0))'
      'union'
      'select'
      '    -1 as MG_ID'
      '  , '#39'  '#1042#1057#1045' '#1052#1040#1058#1045#1056#1048#1040#1051#1067#39' MG_NAME'
      '  , null as PARENT_ID'
      '  , '#39#1042#1089#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1099#39' as MG_NOTICE'
      '  , null SOLD'
      '  , null RENT'
      '  , null LOAN'
      '  , null PATH'
      '  , null Pce'
      '  , null Prop'
      '  from RDB$DATABASE'
      '  order by 2, 1'
      '')
    UpdateCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'MG_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARENT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MG_NOTICE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SOLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOAN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PCE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_MG_ID'
        ParamType = ptUnknown
      end>
    UpdateCommand.CommandText.Strings = (
      'UPDATE MATERIALS_GROUP'
      'SET '
      '    MG_NAME = :MG_NAME,'
      '    PARENT_ID = :PARENT_ID,'
      '    MG_NOTICE = :MG_NOTICE,'
      '    SOLD = :SOLD,'
      '    RENT = :RENT,'
      '    LOAN = :LOAN,'
      '    PCE = :PCE,'
      '    PROP = :PROP'
      'WHERE'
      '    MG_ID = :OLD_MG_ID')
    InsertCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'MG_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MG_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARENT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MG_NOTICE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SOLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOAN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PCE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PROP'
        ParamType = ptUnknown
      end>
    InsertCommand.CommandText.Strings = (
      'INSERT INTO MATERIALS_GROUP('
      '    MG_ID,'
      '    MG_NAME,'
      '    PARENT_ID,'
      '    MG_NOTICE,'
      '    SOLD,'
      '    RENT,'
      '    LOAN,'
      '    PCE,'
      '    PROP'
      ')'
      'VALUES('
      '    :MG_ID,'
      '    :MG_NAME,'
      '    :PARENT_ID,'
      '    :MG_NOTICE,'
      '    :SOLD,'
      '    :RENT,'
      '    :LOAN,'
      '    :PCE,'
      '    :PROP'
      ')')
    DeleteCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'OLD_MG_ID'
        ParamType = ptUnknown
      end>
    DeleteCommand.CommandText.Strings = (
      'UPDATE MATERIALS_GROUP'
      'SET '
      '    DELETED = 1'
      'WHERE'
      '    MG_ID = :OLD_MG_ID')
    GetrecCommand.Params = <>
    Left = 84
    Top = 59
  end
end
