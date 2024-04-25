object MaterialsForm: TMaterialsForm
  Left = 0
  Top = 0
  Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1080' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
  ClientHeight = 412
  ClientWidth = 935
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
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
    Top = 216
    Width = 935
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 935
    Height = 216
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 281
      Top = 0
      Height = 216
    end
    object pnlMat: TPanel
      Left = 284
      Top = 0
      Width = 651
      Height = 216
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 651
        Height = 23
        Caption = 'ToolBar1'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = actNew
        end
        object ToolButton3: TToolButton
          Left = 23
          Top = 0
          Action = actEdit
        end
        object ToolButton5: TToolButton
          Left = 46
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton2: TToolButton
          Left = 54
          Top = 0
          Action = actDelete
        end
        object ToolButton9: TToolButton
          Left = 77
          Top = 0
          Width = 31
          Caption = 'ToolButton9'
          ImageIndex = 27
          Style = tbsSeparator
        end
        object btnRemainRecalc: TToolButton
          Left = 108
          Top = 0
          Hint = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1086#1089#1090#1072#1090#1082#1080' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
          Action = actRemainRecalc
          PopupMenu = pmRecalcAll
        end
      end
      object DBGridEh: TDBGridEh
        Left = 0
        Top = 23
        Width = 651
        Height = 193
        Align = alClient
        AllowedOperations = [alopDeleteEh]
        AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
        DataSource = srcDataSource
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        FrozenCols = 1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentShowHint = False
        SearchPanel.Enabled = True
        SearchPanel.FilterOnTyping = True
        ShowHint = True
        SortLocal = True
        STFilter.Local = True
        SumList.Active = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnDblClick = DBGridEhDblClick
        OnDataHintShow = DBGridEhDataHintShow
        OnGetCellParams = DBGridEhGetCellParams
        OnMouseMove = DBGridEhMouseMove
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object pnlGroup: TPanel
      Left = 0
      Top = 0
      Width = 281
      Height = 216
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object DBGridGroups: TDBGridEh
        Left = 0
        Top = 23
        Width = 281
        Height = 193
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = srcMatGropups
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
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
            Width = 93
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'MG_NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Width = 154
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object ToolBar3: TToolBar
        Left = 0
        Top = 0
        Width = 281
        Height = 23
        Caption = 'ToolBar1'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object ToolButton10: TToolButton
          Left = 0
          Top = 0
          Width = 5
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton12: TToolButton
          Left = 5
          Top = 0
          Action = actAddGroup
        end
        object ToolButton13: TToolButton
          Left = 28
          Top = 0
          Width = 4
          Caption = 'ToolButton5'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object ToolButton16: TToolButton
          Left = 32
          Top = 0
          Action = ActEditGroup
        end
        object ToolButton18: TToolButton
          Left = 55
          Top = 0
          Width = 4
          Caption = 'ToolButton6'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object ToolButton20: TToolButton
          Left = 59
          Top = 0
          Action = ActDelGroup
        end
        object btn1: TToolButton
          Left = 82
          Top = 0
          Width = 34
          Caption = 'btn1'
          ImageIndex = 27
          Style = tbsSeparator
        end
        object btnQuickFilter: TToolButton
          Left = 116
          Top = 0
          Action = actQuickFilter
        end
      end
    end
  end
  object pgcInOut: TPageControl
    Left = 0
    Top = 219
    Width = 935
    Height = 193
    ActivePage = tsIn
    Align = alBottom
    TabOrder = 1
    OnChange = pgcInOutChange
    object tsIn: TTabSheet
      Caption = #1054#1089#1090#1072#1090#1082#1080
      object DBGridIncome: TDBGridEh
        Left = 26
        Top = 0
        Width = 901
        Height = 165
        Align = alClient
        AllowedOperations = []
        DataSource = srcRemain
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
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
            Width = 105
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 165
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object btnactCnPrefixWizard: TBitBtn
          Left = 1
          Top = 4
          Width = 23
          Height = 23
          Action = actShowSN
          TabOrder = 0
        end
      end
    end
    object tsIncome: TTabSheet
      Caption = #1055#1088#1080#1093#1086#1076
      ImageIndex = 2
      object dbgIncome: TDBGridEh
        Left = 26
        Top = 0
        Width = 901
        Height = 165
        Align = alClient
        AllowedOperations = []
        DataSource = srcIncome
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        SearchPanel.Enabled = True
        SearchPanel.FilterOnTyping = True
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
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1057#1086#1079#1076#1072#1085'|'#1050#1086#1075#1076#1072
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_BY'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1077#1084
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1086#1075#1076#1072
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 165
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object btnShowSN: TBitBtn
          Left = 1
          Top = 4
          Width = 23
          Height = 23
          Action = actShowSN
          TabOrder = 0
        end
        object btnPrintIncome: TBitBtn
          Left = 1
          Top = 33
          Width = 23
          Height = 23
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
          TabOrder = 1
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
        Width = 901
        Height = 165
        Align = alClient
        AllowedOperations = []
        DataSource = srcMove
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        SearchPanel.Enabled = True
        SearchPanel.FilterOnTyping = True
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
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1057#1086#1079#1076#1072#1085'|'#1050#1086#1075#1076#1072
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_BY'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1077#1084
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1086#1075#1076#1072
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 165
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object btnShowSN1: TBitBtn
          Left = 1
          Top = 4
          Width = 23
          Height = 23
          Action = actShowSN
          TabOrder = 0
        end
        object btnPrintMove: TBitBtn
          Left = 1
          Top = 33
          Width = 23
          Height = 23
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
          TabOrder = 1
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
        Width = 901
        Height = 165
        Align = alClient
        AllowedOperations = []
        DataSource = srcInvent
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        SearchPanel.Enabled = True
        SearchPanel.FilterOnTyping = True
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
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1057#1086#1079#1076#1072#1085'|'#1050#1086#1075#1076#1072
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_BY'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1077#1084
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1086#1075#1076#1072
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 165
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        object btnShowSN2: TBitBtn
          Left = 1
          Top = 4
          Width = 23
          Height = 23
          Action = actShowSN
          TabOrder = 0
        end
        object btnPrintInvent: TBitBtn
          Left = 1
          Top = 33
          Width = 23
          Height = 23
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
          TabOrder = 1
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
        Width = 901
        Height = 165
        Align = alClient
        AllowedOperations = []
        DataSource = srcOut
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        SearchPanel.Enabled = True
        SearchPanel.FilterOnTyping = True
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
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1057#1086#1079#1076#1072#1085'|'#1050#1086#1075#1076#1072
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_BY'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1077#1084
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1086#1075#1076#1072
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 165
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object btnShowSN3: TBitBtn
          Left = 1
          Top = 4
          Width = 23
          Height = 23
          Action = actShowSN
          TabOrder = 0
        end
        object btnPrintOut: TBitBtn
          Left = 1
          Top = 33
          Width = 23
          Height = 23
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
          TabOrder = 1
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
        Width = 901
        Height = 165
        Align = alClient
        AllowedOperations = []
        DataSource = srcJournal
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        SearchPanel.Enabled = True
        SearchPanel.FilterOnTyping = True
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
              '3')
            PickList.Strings = (
              #1053#1072#1095#1080#1089#1083#1103#1090#1100
              #1042' '#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1080
              #1056#1072#1089#1089#1088#1086#1095#1082#1072
              #1040#1088#1077#1085#1076#1072)
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
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 165
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object btnPrintHistory: TBitBtn
          Left = 1
          Top = 4
          Width = 23
          Height = 23
          Action = actPrintHistory
          TabOrder = 0
        end
      end
    end
    object tsItog: TTabSheet
      Caption = #1057#1074#1086#1076
      ImageIndex = 3
      object dbgGridPivot: TDBGridEh
        Left = 26
        Top = 0
        Width = 901
        Height = 165
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
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WH'
            Footers = <>
            Title.Caption = #1057#1082#1083#1072#1076
            Width = 155
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
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
            Width = 97
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SERIAL'
            Footers = <>
            Title.Caption = #1057'/'#1053
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
            Width = 125
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 165
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object btnItog: TBitBtn
          Left = 1
          Top = 4
          Width = 23
          Height = 23
          Action = actShowSN
          TabOrder = 0
        end
      end
    end
    object tsSerials: TTabSheet
      Caption = #1057#1077#1088'. '#1085#1086#1084#1077#1088#1072
      ImageIndex = 7
      object dbgSN: TDBGridEh
        Left = 26
        Top = 0
        Width = 901
        Height = 165
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
        SearchPanel.FilterOnTyping = True
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
        Height = 165
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object BitBtn2: TBitBtn
          Left = 1
          Top = 4
          Width = 23
          Height = 24
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
          TabOrder = 0
          OnClick = btnPrintIncomeClick
        end
      end
    end
  end
  object actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 142
    Top = 64
    object actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1090#1077#1078
      ImageIndex = 2
      ShortCut = 16461
      OnExecute = actNewExecute
    end
    object actDelete: TAction
      Caption = 'actPaymentDelete'
      ImageIndex = 3
      OnExecute = actDeleteExecute
    end
    object actEdit: TAction
      Caption = 'actPaymentEdit'
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actQuickFilter: TAction
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 40
      OnExecute = actQuickFilterExecute
    end
    object actInNew: TAction
      Caption = 'actInNew'
      Hint = #1042#1085#1077#1089#1090#1080' '#1082#1086#1083'-'#1074#1086
      ImageIndex = 2
      ShortCut = 16464
    end
    object ActInDelete: TAction
      Caption = 'ActInDelete'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1080#1093#1086#1076
      ImageIndex = 3
    end
    object ActAllMaterials: TAction
      Caption = #1042#1089#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1099
      Hint = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1074#1089#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1099'. '#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1075#1088#1091#1087#1087'.'
      OnExecute = ActAllMaterialsExecute
    end
    object actAddGroup: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 2
      ShortCut = 16455
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
      Visible = False
      OnExecute = ActDelGroupExecute
    end
    object ActPostGroup: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1075#1088#1091#1087#1087#1091' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      ImageIndex = 25
      Visible = False
      OnExecute = ActPostGroupExecute
    end
    object actCancelGroup: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1075#1088#1091#1087#1087#1099
      ImageIndex = 26
      OnExecute = actCancelGroupExecute
    end
    object actOutMaterials: TAction
      Caption = #1057#1087#1080#1089#1072#1085#1080#1077
      ImageIndex = 2
    end
    object actMatOutEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 4
    end
    object actInEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 4
    end
    object actRemainRecalc: TAction
      Caption = 'actRemainRecalc'
      ImageIndex = 39
      OnExecute = actRemainRecalcExecute
    end
    object actOpenMatDoc: TAction
      Caption = 'actOpenMatDoc'
      OnExecute = actOpenMatDocExecute
    end
    object actPrintHistory: TAction
      ImageIndex = 5
      OnExecute = actPrintHistoryExecute
    end
    object actRecalcAll: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1074#1089#1077' '#1086#1089#1090#1072#1090#1082#1080
      ImageIndex = 39
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
    OnDataChange = srcRemainDataChange
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
      'select MG_ID, MG_NAME, PARENT_ID, MG_NOTICE, SOLD, RENT, LOAN'
      'from MATERIALS_GROUP'
      'union'
      
        'select null as MG_ID, '#39' '#1041#1045#1047' '#1043#1056#1059#1055#1055#1067#39' MG_NAME, null as PARENT_ID, ' +
        #39#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1073#1077#1079' '#1075#1088#1091#1087#1087#1099#39' as MG_NOTICE, null SOLD, null RENT, null ' +
        'LOAN'
      'from RDB$DATABASE'
      
        'where (exists(select m.M_Id from materials m where m.Mg_Id is nu' +
        'll and m.DELETED = 0))'
      'union'
      
        'select -1 as MG_ID, '#39'  '#1042#1057#1045' '#1052#1040#1058#1045#1056#1048#1040#1051#1067#39' MG_NAME, null as PARENT_ID' +
        ', '#39#1042#1089#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1099#39' as MG_NOTICE, null SOLD, null RENT, null LOAN'
      'from RDB$DATABASE'
      'order by 2, 1')
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
    DataSet = dsMatGropups
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
      '    LOAN = :LOAN '
      'where (M_ID = :M_ID)')
    DeleteSQL.Strings = (
      'UPDATE Materials SET DELETED = 1 WHERE (M_ID = :M_ID)')
    InsertSQL.Strings = (
      
        'insert into MATERIALS (M_ID, NAME, DIMENSION, IS_UNIT, DESCRIPTI' +
        'ON, MG_ID, DELETED, M_NUMBER, COST, BEST_COST, BEST_SHIPPER_ID, ' +
        'IS_DIGIT, IS_NET, M_TYPE, SOLD, RENT, LOAN)'
      
        'values (:M_ID, :NAME, :DIMENSION, :IS_UNIT, :DESCRIPTION, :GR_ID' +
        ', 0, :M_NUMBER, :COST, :BEST_COST, :BEST_SHIPPER_ID, :IS_DIGIT, ' +
        ':IS_NET, :M_TYPE, :SOLD, :RENT, :LOAN)'
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
      '  ,COST NUMERIC(15,3)  '
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
        ', RENT, LOAN '
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
        'LOAN'
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
      '  , 0 PROP'
      '  , rm.Serial'
      '  from Request_Materials_Return rm'
      '       inner join request r on (rm.rq_id = r.rq_id)'
      
        '       left outer join objects o on (o.O_Id = rm.Wh_Id and o.O_T' +
        'ype = 10)'
      
        '       left outer join Customer c on (c.Customer_Id = r.Rq_Custo' +
        'mer)'
      '       left outer join nodes n on (n.Node_Id = r.Node_Id)'
      '  where rm.m_id = :M_ID'
      '  order by 2 desc')
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
    OnDataChange = srcRemainDataChange
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
      '   '
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
    Top = 307
  end
  object drvFIB: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'M_ID'
        ParamType = ptUnknown
      end>
    SelectCommand.CommandText.Strings = (
      'select * from MATERIALS_SUMMARY(:M_ID, 0)')
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <>
    GetrecCommand.Params = <>
    Left = 500
    Top = 251
  end
  object srcItog: TDataSource
    DataSet = dsItogo
    Left = 500
    Top = 347
  end
  object pmRecalcAll: TPopupMenu
    Left = 580
    Top = 40
    object N1: TMenuItem
      Action = actRecalcAll
    end
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
      '      '
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
      '  , coalesce(e.Surname, d.Edit_By) as Edit_By    '
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
    Top = 295
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
      '        '
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
    Left = 720
    Top = 312
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
    Left = 720
    Top = 248
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
    Left = 203
    Top = 87
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
end
