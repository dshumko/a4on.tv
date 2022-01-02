object MaterialsForm: TMaterialsForm
  Left = 0
  Top = 0
  Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1080' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
  ClientHeight = 404
  ClientWidth = 829
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
    Top = 208
    Width = 829
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 829
    Height = 208
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 281
      Top = 0
      Height = 208
    end
    object pnlMat: TPanel
      Left = 284
      Top = 0
      Width = 545
      Height = 208
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 545
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
        object ToolButton19: TToolButton
          Left = 108
          Top = 0
          Action = actQuickFilter
        end
        object btn2: TToolButton
          Left = 131
          Top = 0
          Width = 8
          Caption = 'btn2'
          ImageIndex = 42
          Style = tbsSeparator
        end
        object btnRemainRecalc: TToolButton
          Left = 139
          Top = 0
          Hint = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1086#1089#1090#1072#1090#1082#1080' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
          Action = actRemainRecalc
          PopupMenu = pmRecalcAll
        end
      end
      object DBGridEh: TDBGridEh
        Left = 0
        Top = 23
        Width = 545
        Height = 185
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
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentShowHint = False
        PopupMenu = pmPopUp
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
      Height = 208
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object DBGridGroups: TDBGridEh
        Left = 0
        Top = 23
        Width = 281
        Height = 185
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
        object ToolButton21: TToolButton
          Left = 82
          Top = 0
          Width = 14
          Caption = 'ToolButton21'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object ToolButton22: TToolButton
          Left = 96
          Top = 0
          Action = ActPostGroup
        end
        object ToolButton25: TToolButton
          Left = 119
          Top = 0
          Width = 8
          Caption = 'ToolButton25'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object ToolButton24: TToolButton
          Left = 127
          Top = 0
          Action = actCancelGroup
        end
      end
    end
  end
  object pgcInOut: TPageControl
    Left = 0
    Top = 211
    Width = 829
    Height = 193
    ActivePage = tsIn
    Align = alBottom
    TabOrder = 1
    OnChange = pgcInOutChange
    object tsIn: TTabSheet
      Caption = #1054#1089#1090#1072#1090#1082#1080
      object DBGridIncome: TDBGridEh
        Left = 0
        Top = 0
        Width = 821
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
            FieldName = 'INVENTORY'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1080#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1080
            Width = 105
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WH'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1057#1082#1083#1072#1076
            Width = 235
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsIncome: TTabSheet
      Caption = #1055#1088#1080#1093#1086#1076
      ImageIndex = 2
      object dbgIncome: TDBGridEh
        Left = 0
        Top = 0
        Width = 821
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
        SortLocal = True
        STFilter.Local = True
        STFilter.Visible = True
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
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1052'/'#1044
            Title.Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077'  '#1082' '#1084#1072#1090#1077#1088#1080#1072#1083#1091', '#1095#1077#1088#1077#1079' / '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Title.TitleButton = True
            Width = 173
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsMove: TTabSheet
      Caption = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077
      ImageIndex = 4
      object dbgMove: TDBGridEh
        Left = 0
        Top = 0
        Width = 821
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
        SortLocal = True
        STFilter.Local = True
        STFilter.Visible = True
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
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1052'/'#1044
            Title.Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077'  '#1082' '#1084#1072#1090#1077#1088#1080#1072#1083#1091', '#1095#1077#1088#1077#1079' / '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Title.TitleButton = True
            Width = 108
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsInventory: TTabSheet
      Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103
      ImageIndex = 6
      object dbgInvent: TDBGridEh
        Left = 0
        Top = 0
        Width = 821
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
        SortLocal = True
        STFilter.Local = True
        STFilter.Visible = True
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
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsOUT: TTabSheet
      Caption = #1057#1087#1080#1089#1072#1085#1080#1077
      ImageIndex = 5
      object dbgOUT: TDBGridEh
        Left = 0
        Top = 0
        Width = 821
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
        SortLocal = True
        STFilter.Local = True
        STFilter.Visible = True
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
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1052'/'#1044
            Title.Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077'  '#1082' '#1084#1072#1090#1077#1088#1080#1072#1083#1091', '#1095#1077#1088#1077#1079' / '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Title.TitleButton = True
            Width = 108
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsJournal: TTabSheet
      Caption = #1042' '#1079#1072#1103#1074#1082#1072#1093
      ImageIndex = 2
      object dbgJournal: TDBGridEh
        Left = 26
        Top = 0
        Width = 795
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
        SortLocal = True
        STFilter.Local = True
        STFilter.Visible = True
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
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'Not_Calc'
            Footers = <>
            Title.Caption = #1053#1077' '#1085#1072#1095#1080#1089#1083#1103#1090#1100
            Title.Hint = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1085#1077' '#1085#1072#1095#1080#1089#1083#1103#1083#1072#1089#1100' '#1072#1073#1086#1085#1077#1085#1090#1091
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
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_WHERE'
            Footers = <>
            Title.Caption = #1051#1080#1094#1077#1074#1086#1081' / '#1059#1079#1077#1083
            Width = 69
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1080#1079' '#1079#1072#1103#1074#1082#1080
            Width = 87
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
      object DBGridEh1: TDBGridEh
        Left = 0
        Top = 0
        Width = 821
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
        STFilter.Location = stflInTitleFilterEh
        STFilter.Visible = True
        TabOrder = 0
        TitleParams.VTitleMargin = 5
        VertScrollBar.SmoothStep = True
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
            Width = 152
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_DOC'
            Footers = <>
            Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
            Width = 97
          end
          item
            CellButtons = <>
            DisplayFormat = ',#0.#####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'QUANT'
            Footers = <>
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Width = 100
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 38
    Top = 80
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
      OnExecute = ActDelGroupExecute
    end
    object ActPostGroup: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1075#1088#1091#1087#1087#1091' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      ImageIndex = 25
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
  end
  object dsRemain: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    m.Mr_Quant'
      '  , m.INVENTORY'
      '  , o.o_name as WH'
      '  from Materials_Remain m'
      '       inner join objects o on (o.o_id = m.WH_ID and'
      '             o.o_type = 10)'
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
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
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
      '    MG_NOTICE = :MG_NOTICE'
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
      '    MG_NOTICE'
      ')'
      'VALUES('
      '    :MG_ID,'
      '    :MG_NAME,'
      '    :PARENT_ID,'
      '    :MG_NOTICE'
      ')')
    RefreshSQL.Strings = (
      'Select * from materials_group'
      ''
      ' WHERE '
      '        MATERIALS_GROUP.MG_ID = :OLD_MG_ID'
      '    ')
    SelectSQL.Strings = (
      'select MG_ID, MG_NAME, PARENT_ID, MG_NOTICE'
      'from MATERIALS_GROUP'
      'union'
      
        'select null as MG_ID, '#39'<'#1041#1045#1047' '#1043#1056#1059#1055#1055#1067'>'#39' MG_NAME, null as PARENT_ID,' +
        ' '#39#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1073#1077#1079' '#1075#1088#1091#1087#1087#1099#39' as MG_NOTICE'
      'from RDB$DATABASE'
      'union'
      
        'select -1 as MG_ID, '#39' '#1042#1057#1045#39' MG_NAME, null as PARENT_ID, '#39#1042#1089#1077' '#1084#1072#1090#1077 +
        #1088#1080#1072#1083#1099#39' as MG_NOTICE'
      'from RDB$DATABASE'
      'order by 2, 1')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_GROUP'
    AutoUpdateOptions.KeyFields = 'MG_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 37
    Top = 131
  end
  object srcMatGropups: TDataSource
    AutoEdit = False
    DataSet = dsMatGropups
    OnStateChange = srcMatGropupsStateChange
    Left = 161
    Top = 76
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
      '    M_TYPE = :M_TYPE '
      'where (M_ID = :M_ID)')
    DeleteSQL.Strings = (
      'UPDATE Materials SET DELETED = 1 WHERE (M_ID = :M_ID)')
    InsertSQL.Strings = (
      
        'insert into MATERIALS (M_ID, NAME, DIMENSION, IS_UNIT, DESCRIPTI' +
        'ON, MG_ID, DELETED, M_NUMBER, COST, BEST_COST, BEST_SHIPPER_ID, ' +
        'IS_DIGIT, IS_NET, M_TYPE)'
      
        'values (:M_ID, :NAME, :DIMENSION, :IS_UNIT, :DESCRIPTION, :GR_ID' +
        ', 0, :M_NUMBER, :COST, :BEST_COST, :BEST_SHIPPER_ID, :IS_DIGIT, ' +
        ':IS_NET, :M_TYPE)'
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
        ' from MATERIALS m'
      
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
      '       :GR_ID, :IS_DIGIT, :IS_NET, :M_TYPE, :TYPE_NAME'
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
    Left = 573
    Top = 135
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 525
    Top = 135
  end
  object TrTemp: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 525
    Top = 183
  end
  object QrTemp: TpFIBQuery
    Transaction = TrTemp
    Database = dmMain.dbTV
    Left = 573
    Top = 183
  end
  object srcDataSource: TDataSource
    DataSet = dsMaterials
    Left = 367
    Top = 125
  end
  object pmPopUp: TPopupMenu
    Left = 156
    Top = 126
    object ppmCopy: TMenuItem
      Caption = '&'#1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = ppmCopyClick
    end
    object ppmSelectAll: TMenuItem
      Caption = '&'#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnClick = ppmSelectAllClick
    end
    object MenuItem1: TMenuItem
      Caption = '-'
    end
    object ppmSaveSelection: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082' ...'
      OnClick = ppmSaveSelectionClick
    end
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
      '  , coalesce(rm.Not_Calc, 0) Not_Calc'
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
      '  , 0 Not_Calc'
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
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 434
    Top = 286
    WaitEndMasterScroll = True
    dcForceOpen = True
  end
  object srcJournal: TDataSource
    AutoEdit = False
    DataSet = dsJournal
    OnDataChange = srcRemainDataChange
    Left = 436
    Top = 334
  end
  object dsIncome: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    d.Doc_N,'
      '    d.Doc_Date,'
      
        '    coalesce(im.M_Notice, '#39#39')||coalesce('#39'/'#39'||d.Notice, '#39#39') Notic' +
        'e,'
      '    w.O_Name wherehouse,'
      '    im.M_Quant,'
      '    im.Shipper_Cost,'
      '    d.Dt_Id,'
      '    d.Doc_Id'
      '  from Material_Docs d'
      '       inner join Materials_In_Doc im on (d.Doc_Id = im.Doc_Id)'
      
        '       inner join Objects t on (T.O_Id = d.Dt_Id and t.O_Type = ' +
        '28)'
      
        '       left outer join objects w on ( w.O_Id = d.Wh_Id and w.O_T' +
        'ype = 10)'
      '  where d.Doc_Closed = 1'
      '        and d.Dt_Id = 1'
      '        and im.M_Id = :M_ID   '
      'order by d.Doc_Date desc, d.Doc_N')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_INCOME'
    AutoUpdateOptions.KeyFields = 'MI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
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
    Version = '2021.2.8'
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
    Left = 524
    Top = 275
  end
  object drvFIB: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'M_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'M_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'M_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'M_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'M_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'M_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'M_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'M_ID'
        ParamType = ptUnknown
      end>
    SelectCommand.CommandText.Strings = (
      'select'
      '    w.O_Name WH, M_Id, M_DATE, m_type, m_doc, quant'
      '  from (select'
      
        '            md.M_Id, d.Wh_Id, d.Doc_Date M_DATE, '#39#1055#1088#1080#1093#1086#1076#39' m_type' +
        ', d.Doc_N m_doc, md.M_Quant quant'
      '          from Material_Docs d'
      
        '               inner join Materials_In_Doc md on (d.Doc_Id = md.' +
        'Doc_Id)'
      
        '          where d.Doc_Closed = 1 and d.Dt_Id = 1 and md.M_Id = :' +
        'M_ID'
      '        union'
      '        select'
      
        '            md.M_Id, d.Wh_Id, d.Doc_Date M_DATE, '#39#1087#1077#1088'-'#1080#1077' '#1053#1040' '#1089#1082#1083#1072 +
        #1076#39' m_type, d.Doc_N m_doc, md.M_Quant quant'
      '          from Material_Docs d'
      
        '               inner join Materials_In_Doc md on (d.Doc_Id = md.' +
        'Doc_Id)'
      
        '          where d.Doc_Closed = 1 and d.Dt_Id = 2 and md.M_Id = :' +
        'M_ID'
      '        union'
      '        select'
      
        '            md.M_Id, d.From_Wh Wh_Id, d.Doc_Date M_DATE, '#39#1087#1077#1088'-'#1080#1077 +
        ' '#1057#1054' '#1089#1082#1083#1072#1076#1072#39' m_type, d.Doc_N m_doc, -1 * md.M_Quant quant'
      '          from Material_Docs d'
      
        '               inner join Materials_In_Doc md on (d.Doc_Id = md.' +
        'Doc_Id)'
      
        '          where d.Doc_Closed = 1 and d.Dt_Id = 2 and md.M_Id = :' +
        'M_ID'
      '        union'
      '        select'
      
        '            md.M_Id, d.Wh_Id, d.Doc_Date M_DATE, '#39#1057#1087#1080#1089#1072#1085#1080#1077#39' m_ty' +
        'pe, d.Doc_N m_doc, -1 * md.M_Quant quant'
      '          from Material_Docs d'
      
        '               inner join Materials_In_Doc md on (d.Doc_Id = md.' +
        'Doc_Id)'
      
        '          where d.Doc_Closed = 1 and d.Dt_Id = 3 and md.M_Id = :' +
        'M_ID'
      '        union'
      '        select'
      
        '            md.M_Id, d.Wh_Id, d.Doc_Date M_DATE, '#39#1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072#39 +
        ' m_type, d.Doc_N m_doc,  md.M_Quant quant'
      '          from Material_Docs d'
      
        '               inner join Materials_In_Doc md on (d.Doc_Id = md.' +
        'Doc_Id)'
      
        '          where d.Doc_Closed = 1 and d.Dt_Id = 4 and md.M_Id = :' +
        'M_ID'
      '        union'
      '        select'
      
        '            md.M_Id, d.Wh_Id, d.Doc_Date M_DATE, '#39#1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103 +
        #39' m_type, d.Doc_N m_doc,  (md.M_Quant - coalesce(md.B_Quant, 0))' +
        ' quant'
      '          from Material_Docs d'
      
        '               inner join Materials_In_Doc md on (d.Doc_Id = md.' +
        'Doc_Id)'
      
        '          where d.Doc_Closed = 1 and d.Dt_Id = 5 and md.M_Id = :' +
        'M_ID'
      '        union'
      '        select'
      
        '            rm.M_Id, rm.Wh_Id, cast(r.RQ_EXEC_TIME as date) M_DA' +
        'TE, '#39#1074#1086#1079#1074#1088#1072#1090' '#1057' '#1079#1072#1103#1074#1082#1080#39' m_type, r.Rq_Id m_doc, rm.Quant quant'
      '          from Request_Materials_Return rm'
      '               inner join request r on (rm.Rq_Id = r.Rq_Id)'
      '          where rm.M_Id = :M_ID'
      '        union'
      '        select'
      
        '            rm.M_Id, rm.Wh_Id, cast(r.RQ_EXEC_TIME as date) M_DA' +
        'TE, '#39#1089#1087#1080#1089#1072#1085#1080#1077' '#1053#1040' '#1079#1072#1103#1074#1082#1091#39' m_type, r.Rq_Id m_doc, -1 * rm.Rm_Quant' +
        ' quant'
      '          from Request_Materials rm'
      '               inner join request r on (rm.Rq_Id = r.Rq_Id)'
      '          where rm.M_Id = :M_ID'
      '       ) m'
      
        '       inner join objects w on (w.O_Id = m.Wh_Id and O_Type = 10' +
        ')'
      '  order by 1, 2, 3')
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <>
    GetrecCommand.Params = <>
    Left = 588
    Top = 275
  end
  object srcItog: TDataSource
    DataSet = dsItogo
    Left = 524
    Top = 331
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
      '    d.Doc_N||'#39' ('#39'||t.O_Name||'#39')'#39' Doc_N,'
      '    d.Doc_Date,'
      
        '    coalesce(im.M_Notice, '#39#39')||coalesce('#39'/'#39'||d.Notice, '#39#39') Notic' +
        'e,'
      '    w.O_Name wherehouse,'
      '    im.M_Quant M_Quant,'
      '    im.Shipper_Cost,'
      '    wo.O_Name FROM_WH,'
      '    d.Dt_Id,'
      '    d.Doc_Id'
      '  from Material_Docs d'
      '       inner join Materials_In_Doc im on (d.Doc_Id = im.Doc_Id)'
      
        '       inner join Objects t on (T.O_Id = d.Dt_Id and t.O_Type = ' +
        '28)'
      
        '       left outer join objects w on ( w.O_Id = d.Wh_Id and w.O_T' +
        'ype = 10)'
      
        '       left outer join objects wo on (wo.O_Id = d.From_Wh and wo' +
        '.O_Type = 10)'
      '  where d.Doc_Closed = 1 '
      '        and d.Dt_Id = 2'
      '        and im.M_Id = :M_ID   '
      'order by d.Doc_Date desc, d.Doc_N')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_INCOME'
    AutoUpdateOptions.KeyFields = 'MI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
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
      
        '    coalesce(im.M_Notice, '#39#39')||coalesce('#39'/'#39'||d.Notice, '#39#39') Notic' +
        'e,'
      '    w.O_Name wherehouse,'
      '    im.M_Quant,'
      '    im.B_Quant,'
      '    (im.M_Quant - im.B_Quant) QDIF,'
      '    m.Cost,'
      '    (im.M_Quant - im.B_Quant) * m.Cost ITOGO,'
      '    d.Dt_Id,'
      '    d.Doc_Id'
      '  from Material_Docs d'
      '       inner join Materials_In_Doc im on (d.Doc_Id = im.Doc_Id)'
      '       inner join materials m on (m.M_Id = im.M_Id)'
      
        '       inner join Objects t on (T.O_Id = d.Dt_Id and t.O_Type = ' +
        '28)'
      
        '       left outer join objects w on ( w.O_Id = d.Wh_Id and w.O_T' +
        'ype = 10)'
      '  where d.Doc_Closed = 1'
      '        and d.Dt_Id = 5'
      '        and im.M_Id = :M_ID   '
      'order by d.Doc_Date desc, d.Doc_N'
      '')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_INCOME'
    AutoUpdateOptions.KeyFields = 'MI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
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
      '    d.Doc_N,'
      '    d.Doc_Date,'
      
        '    coalesce(im.M_Notice, '#39#39')||coalesce('#39'/'#39'||d.Notice, '#39#39') Notic' +
        'e,'
      '    w.O_Name wherehouse,'
      '    -1*im.M_Quant M_Quant,'
      '    -1*im.M_Quant * m.Cost ITOGO,'
      '    d.Dt_Id,'
      '    d.Doc_Id'
      '  from Material_Docs d'
      '       inner join Materials_In_Doc im on (d.Doc_Id = im.Doc_Id)'
      '       inner join materials m on (m.M_Id = im.M_Id)'
      
        '       left outer join objects w on ( w.O_Id = d.Wh_Id and w.O_T' +
        'ype = 10)'
      '  where d.Doc_Closed = 1'
      '        and d.Dt_Id = 3'
      '        and im.M_Id = :M_ID   '
      'order by d.Doc_Date desc, d.Doc_N')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_INCOME'
    AutoUpdateOptions.KeyFields = 'MI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
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
end
