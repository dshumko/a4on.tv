object DVBSettinsForm: TDVBSettinsForm
  Left = 496
  Top = 494
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' DVB'
  ClientHeight = 543
  ClientWidth = 827
  Color = clBtnFace
  Constraints.MinHeight = 320
  Constraints.MinWidth = 240
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcMode: TPageControl
    Left = 0
    Top = 0
    Width = 827
    Height = 543
    ActivePage = tsEdit
    Align = alClient
    TabOrder = 0
    OnChange = pgcModeChange
    object tsEdit: TTabSheet
      Caption = ' '#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '
      object spl2: TSplitter
        Left = 0
        Top = 292
        Width = 819
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Splitter1: TSplitter
        Left = 0
        Top = 137
        Width = 819
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object pnlChannels: TPanel
        Left = 0
        Top = 295
        Width = 819
        Height = 220
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object spl1: TSplitter
          Left = 449
          Top = 0
          Height = 220
        end
        object grdCh: TDBGridEh
          Left = 0
          Top = 0
          Width = 449
          Height = 220
          Align = alLeft
          AllowedOperations = []
          DataSource = srcChannels
          DynProps = <>
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterRowCount = 1
          FooterParams.Color = clWindow
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
              DynProps = <>
              EditButtons = <>
              FieldName = 'TSID'
              Footers = <>
              Title.TitleButton = True
              Width = 41
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'SID'
              Footer.ValueType = fvtCount
              Footers = <>
              Title.TitleButton = True
              Width = 42
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'LCN'
              Footers = <>
              Title.TitleButton = True
              Width = 40
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_NAME'
              Footers = <>
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 106
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DEFINITION'
              Footers = <>
              Title.Caption = 'DEF'
              Title.TitleButton = True
              Width = 27
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 92
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'VPID'
              Footers = <>
              Title.Caption = 'Video PID'
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'APID'
              Footers = <>
              Title.Caption = 'Audio PID'
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'A2PID'
              Footers = <>
              Title.Caption = 'Audio sec. PID'
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'BITRATE'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'Bitrate'
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CNID'
              Footers = <>
              Title.Caption = 'NID'
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CONID'
              Footers = <>
              Title.Caption = 'ONID'
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object dbgEPG: TDBGridEh
          Left = 452
          Top = 0
          Width = 367
          Height = 220
          Align = alClient
          AllowedOperations = []
          DataSource = srcEPG
          DrawMemoText = True
          DynProps = <>
          Flat = True
          EmptyDataInfo.Text = #1053#1077#1090' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1087#1077#1088#1077#1076#1072#1095' '#1085#1072' '#1101#1090#1086#1090' '#1082#1072#1085#1072#1083
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
          STFilter.Local = True
          STFilter.Visible = True
          TabOrder = 1
          TitleParams.MultiTitle = True
          OnGetCellParams = dbgEPGGetCellParams
          Columns = <
            item
              AutoFitColWidth = False
              CellButtons = <>
              DisplayFormat = 'HH:MM'
              DynProps = <>
              EditButtons = <>
              FieldName = 'DATE_START'
              Footers = <>
              Title.Caption = #1042#1088#1077#1084#1103' UTC|'#1057#1090#1072#1088#1090
              Title.TitleButton = True
              Width = 40
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DisplayFormat = 'HH:MM'
              DynProps = <>
              EditButtons = <>
              FieldName = 'DATE_STOP'
              Footers = <>
              Title.Caption = #1042#1088#1077#1084#1103' UTC|'#1057#1090#1086#1087
              Title.TitleButton = True
              Width = 40
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'TITLE'
              Footers = <>
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 76
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'minage'
              Footers = <>
              Title.Caption = #1052#1080#1085'. '#1074#1086#1079#1088#1072#1089#1090
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DESCRIPTION'
              Footers = <>
              Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 128
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object pnlNetwork: TPanel
        Left = 0
        Top = 0
        Width = 819
        Height = 137
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object grdNetwork: TDBGridEh
          Left = 0
          Top = 22
          Width = 819
          Height = 115
          Align = alClient
          AllowedOperations = []
          DataSource = srcNetwork
          DynProps = <>
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterParams.Color = clWindow
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
          PopupMenu = pmPopUp
          SearchPanel.Enabled = True
          SearchPanel.PersistentShowing = False
          SortLocal = True
          STFilter.Local = True
          TabOrder = 1
          TitleParams.MultiTitle = True
          OnDblClick = grdNetworkDblClick
          Columns = <
            item
              CellButtons = <>
              Checkboxes = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 95
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NID'
              Footers = <>
              Title.TitleButton = True
              Width = 53
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'ONID'
              Footers = <>
              Width = 54
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'PIDS'
              Footers = <>
              Title.Caption = 'PIDs'
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'TIMEOFFSET'
              Footers = <>
              Title.Caption = #1063#1072#1089#1086#1074#1086#1081' '#1087#1086#1103#1089' '#1089#1077#1090#1080', '#1084#1080#1085'.'
              Title.TitleButton = True
              Width = 58
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'LANG'
              Footers = <>
              Title.Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1103#1079#1099#1082' '#1089#1077#1090#1080
              Width = 65
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_COUNT'
              Footers = <>
              Title.Caption = #1050#1072#1085#1072#1083#1086#1074
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 125
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'EPG_UPDATED'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
              Title.Hint = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103
              Title.TitleButton = True
              Width = 98
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 819
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label1: TLabel
            Left = 0
            Top = 0
            Width = 82
            Height = 22
            Align = alLeft
            AutoSize = False
            Caption = ' '#1057#1077#1090#1080
            FocusControl = edtSearch
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowAccelChar = False
          end
          object Panel4: TPanel
            Left = 167
            Top = 0
            Width = 309
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object SpeedButton1: TSpeedButton
              Left = 0
              Top = 0
              Width = 46
              Height = 22
              Hint = #1055#1086#1080#1089#1082'|'#1055#1086#1080#1089#1082
              Align = alLeft
              Caption = #1055#1086#1080#1089#1082
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Layout = blGlyphRight
              ParentFont = False
              Spacing = 10
            end
            object ToolBar2: TToolBar
              Left = 236
              Top = 0
              Width = 73
              Height = 22
              Align = alRight
              Caption = 'tlbSearch'
              Images = A4MainForm.ilFilter
              TabOrder = 1
              object ToolButton1: TToolButton
                Left = 0
                Top = 0
                Action = actFilterSearchText
              end
              object ToolButton2: TToolButton
                Left = 23
                Top = 0
                Action = actSearchNext
              end
              object ToolButton3: TToolButton
                Left = 46
                Top = 0
                Action = actSearchPrev
              end
            end
            object edtSearch: TDBEditEh
              Left = 46
              Top = 0
              Width = 190
              Height = 22
              Align = alClient
              DynProps = <>
              EditButtons = <>
              EmptyDataInfo.Text = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
              ShowHint = True
              TabOrder = 0
              Visible = True
              OnChange = edtSearchChange
              OnEnter = edtSearchEnter
              OnExit = edtSearchExit
              OnKeyUp = edtSearchKeyUp
            end
          end
          object ToolBar3: TToolBar
            Left = 82
            Top = 0
            Width = 85
            Height = 22
            Align = alLeft
            Caption = 'tlbMain'
            Images = A4MainForm.ICONS_ACTIVE
            TabOrder = 0
            object ToolButton4: TToolButton
              Left = 0
              Top = 0
              Width = 5
              Caption = 'ToolButton4'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object ToolButton5: TToolButton
              Left = 5
              Top = 0
              Action = actNetworkNew
            end
            object ToolButton6: TToolButton
              Left = 28
              Top = 0
              Width = 4
              Caption = 'ToolButton5'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object ToolButton9: TToolButton
              Left = 32
              Top = 0
              Action = actNetworkEdit
            end
            object ToolButton10: TToolButton
              Left = 55
              Top = 0
              Width = 4
              Caption = 'ToolButton6'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object ToolButton15: TToolButton
              Left = 59
              Top = 0
              Action = actNetworkDel
            end
          end
          object ToolBar4: TToolBar
            Left = 476
            Top = 0
            Width = 93
            Height = 22
            Align = alLeft
            Caption = 'tlbMain'
            Images = A4MainForm.ICONS_ACTIVE
            TabOrder = 2
            object ToolButton16: TToolButton
              Left = 0
              Top = 0
              Width = 5
              Caption = 'ToolButton4'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object btnExport: TToolButton
              Left = 5
              Top = 0
              Action = actExport
            end
            object ToolButton18: TToolButton
              Left = 28
              Top = 0
              Width = 4
              Caption = 'ToolButton5'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object btnImport: TToolButton
              Left = 32
              Top = 0
              Action = actImport
            end
          end
        end
      end
      object pnlStream: TPanel
        Left = 0
        Top = 140
        Width = 819
        Height = 152
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 819
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label2: TLabel
            Left = 0
            Top = 0
            Width = 82
            Height = 22
            Align = alLeft
            AutoSize = False
            Caption = ' '#1055#1086#1090#1086#1082#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowAccelChar = False
          end
          object Panel6: TPanel
            Left = 167
            Top = 0
            Width = 309
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object SpeedButton2: TSpeedButton
              Left = 0
              Top = 0
              Width = 46
              Height = 22
              Hint = #1055#1086#1080#1089#1082'|'#1055#1086#1080#1089#1082
              Align = alLeft
              Caption = #1055#1086#1080#1089#1082
              Flat = True
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              Layout = blGlyphRight
              ParentFont = False
              Spacing = 10
            end
            object tlbSearch: TToolBar
              Left = 236
              Top = 0
              Width = 73
              Height = 22
              Align = alRight
              Caption = 'tlbSearch'
              Images = A4MainForm.ilFilter
              TabOrder = 1
              object btnFilterSearchText: TToolButton
                Left = 0
                Top = 0
                Action = actFilterSearchText
              end
              object btnSearchNext: TToolButton
                Left = 23
                Top = 0
                Action = actSearchNext
              end
              object btnSearchPrev: TToolButton
                Left = 46
                Top = 0
                Action = actSearchPrev
              end
            end
            object edtSearch1: TDBEditEh
              Left = 46
              Top = 0
              Width = 190
              Height = 22
              Align = alClient
              DynProps = <>
              EditButtons = <>
              EmptyDataInfo.Text = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
              ShowHint = True
              TabOrder = 0
              Visible = True
              OnChange = edtSearchChange
              OnEnter = edtSearchEnter
              OnExit = edtSearchExit
              OnKeyUp = edtSearchKeyUp
            end
          end
          object ToolBar1: TToolBar
            Left = 82
            Top = 0
            Width = 85
            Height = 22
            Align = alLeft
            Caption = 'tlbMain'
            Images = A4MainForm.ICONS_ACTIVE
            TabOrder = 0
            object ToolButton7: TToolButton
              Left = 0
              Top = 0
              Width = 5
              Caption = 'ToolButton4'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object ToolButton8: TToolButton
              Left = 5
              Top = 0
              Action = actTSNEW
            end
            object ToolButton11: TToolButton
              Left = 28
              Top = 0
              Width = 4
              Caption = 'ToolButton5'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object ToolButton12: TToolButton
              Left = 32
              Top = 0
              Action = actTSedit
            end
            object ToolButton13: TToolButton
              Left = 55
              Top = 0
              Width = 4
              Caption = 'ToolButton6'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object ToolButton14: TToolButton
              Left = 59
              Top = 0
              Action = actTSdel
            end
          end
        end
        object grdTS: TDBGridEh
          Left = 0
          Top = 22
          Width = 819
          Height = 130
          Align = alClient
          AllowedOperations = []
          DataSource = srcTS
          DynProps = <>
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterRowCount = 1
          FooterParams.Color = clWindow
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
          PopupMenu = pmPopUp
          SearchPanel.Enabled = True
          SearchPanel.PersistentShowing = False
          SortLocal = True
          STFilter.Local = True
          SumList.Active = True
          TabOrder = 1
          TitleParams.MultiTitle = True
          OnDblClick = grdTSDblClick
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NAME'
              Footer.ValueType = fvtCount
              Footers = <>
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Title.TitleButton = True
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'TSID'
              Footers = <>
              Title.TitleButton = True
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_COUNT'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1050#1072#1085#1072#1083#1086#1074
              Title.Hint = #1050#1072#1085#1072#1083#1086#1074' '#1074' '#1087#1086#1090#1086#1082#1077
              Title.TitleButton = True
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'QAM'
              Footers = <>
              Title.Caption = #1057#1077#1090#1100'|QAM'
              Title.TitleButton = True
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'FREQ'
              Footers = <>
              Title.Caption = #1057#1077#1090#1100'|Freq'
              Title.TitleButton = True
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'ES_IP'
              Footers = <>
              Title.Caption = 'EPG|IP'
              Title.TitleButton = True
              Width = 102
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'ES_PORT'
              Footers = <>
              Title.Caption = 'EPG|port'
              Title.TitleButton = True
              Width = 45
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'BITRATE'
              Footers = <>
              Title.Caption = 'EPG|bitrate'
              Title.TitleButton = True
              Width = 56
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'AOSTRM'
              Footers = <>
              Title.Caption = 'EPG|EIT other'
              Title.TitleButton = True
              Width = 44
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 93
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'EPG_UPDATED'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103
              Title.Hint = #1044#1072#1090#1072' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103
              Title.TitleButton = True
              Width = 106
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object tsView: TTabSheet
      Caption = ' '#1055#1088#1086#1089#1084#1086#1090#1088' '
      ImageIndex = 1
      object dbgView: TDBGridEh
        Left = 0
        Top = 0
        Width = 819
        Height = 515
        Align = alClient
        DataGrouping.Active = True
        DataGrouping.DefaultStateExpanded = True
        DataGrouping.FootersDefValues.ShowFunctionName = True
        DataGrouping.FootersDefValues.RunTimeCustomizable = True
        DataGrouping.GroupLevels = <
          item
            ColumnName = 'Column_0_NAME'
          end
          item
            ColumnName = 'Column_1_TS_NAME'
          end>
        DataGrouping.GroupPanelVisible = True
        DataGrouping.GroupRowDefValues.FooterInGroupRow = True
        DataSource = dsView
        DynProps = <>
        Flat = True
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghColumnResize, dghColumnMove, dghExtendVertLines]
        PopupMenu = pmViewGrid
        SearchPanel.Enabled = True
        SortLocal = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1057#1077#1090#1100
            Title.TitleButton = True
            Visible = False
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'TS_NAME'
            Footers = <>
            Title.Caption = #1055#1086#1090#1086#1082
            Title.TitleButton = True
            Visible = False
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NID'
            Footers = <>
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ONID'
            Footers = <>
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DVBS_ID'
            Footers = <>
            Title.TitleButton = True
            Visible = False
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DVBN_ID'
            Footers = <>
            Title.TitleButton = True
            Visible = False
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ES_IP'
            Footers = <>
            Title.Caption = 'EPG UDP IP'
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'QAM'
            Footers = <>
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SID'
            Footers = <>
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CH_TSID'
            Footers = <>
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'LCN'
            Footers = <>
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CH_TSID'
            Footers = <>
            Title.TitleButton = True
            Visible = False
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CH_NAME'
            Footers = <>
            Title.Caption = #1050#1072#1085#1072#1083
            Title.TitleButton = True
            Width = 209
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DEFINITION'
            Footers = <>
            Title.Caption = 'DEF'
            Title.TitleButton = True
            Width = 64
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'LANG'
            Footers = <>
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SRC_NAME'
            Footers = <>
            Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1076#1083#1103' DVB'
            Width = 78
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CARD_NAME'
            Footers = <>
            Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1082#1072#1088#1090#1086#1095#1082#1072
            Width = 55
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'IP'
            Footers = <>
            Title.Caption = 'IP '#1080#1089#1090#1086#1095#1085#1080#1082#1072
            Width = 59
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'VPID'
            Footers = <>
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'APID'
            Footers = <>
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'A2PID'
            Footers = <>
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object srcTS: TDataSource
    AutoEdit = False
    DataSet = dsTS
    Left = 208
    Top = 240
  end
  object actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 430
    Top = 120
    object actTSNEW: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' TS'
      ImageIndex = 2
      OnExecute = actTSNEWExecute
    end
    object actTSedit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' TS'
      ImageIndex = 4
      OnExecute = actTSeditExecute
    end
    object actTSdel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' TS'
      ImageIndex = 3
      OnExecute = actTSdelExecute
    end
    object actNetworkNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1077#1090#1100
      ImageIndex = 2
      OnExecute = actNetworkNewExecute
    end
    object actNetworkEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1077#1090#1100
      ImageIndex = 4
      OnExecute = actNetworkEditExecute
    end
    object actNetworkDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1077#1090#1100
      ImageIndex = 3
      OnExecute = actNetworkDelExecute
    end
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082' ...'
      OnExecute = actSaveExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1099
      OnExecute = actPrintExecute
    end
    object actExport: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1085#1072#1089#1090#1088#1086#1077#1082' DVB'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1085#1072#1089#1090#1088#1086#1077#1082' DVB'
      ImageIndex = 85
      OnExecute = actExportExecute
    end
    object actImport: TAction
      Caption = #1048#1084#1087#1086#1088#1090' '#1085#1072#1089#1090#1088#1086#1077#1082' DVB'
      Hint = #1048#1084#1087#1086#1088#1090' '#1085#1072#1089#1090#1088#1086#1077#1082' DVB'
      ImageIndex = 86
      OnExecute = actImportExecute
    end
  end
  object pmPopUp: TPopupMenu
    Left = 331
    Top = 223
    object pmgCopy: TMenuItem
      Caption = '&'#1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = pmgCopyClick
    end
    object pmgSelectAll: TMenuItem
      Caption = '&'#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnClick = pmgSelectAllClick
    end
    object pmgSep1: TMenuItem
      Caption = '-'
    end
    object pmgSaveSelection: TMenuItem
      Action = actSave
    end
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
    Left = 148
    Top = 266
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
    Left = 252
    Top = 216
  end
  object dsTS: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DVB_STREAMS'
      'WHERE'
      '        DVBN_ID = :OLD_DVBN_ID'
      '    and DVBS_ID = :OLD_DVBS_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    s.*,'
      
        '    (select count(*) from DVB_Stream_Channels ec where ec.DVBS_I' +
        'd = s.DVBS_Id) as ch_count'
      '  from DVB_Streams s'
      '  where(  s.DVBN_ID = :DVBN_ID'
      '     ) and (     S.DVBN_ID = :OLD_DVBN_ID'
      '    and S.DVBS_ID = :OLD_DVBS_ID'
      '     )'
      '     '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    s.*,'
      
        '    (select count(*) from DVB_Stream_Channels ec where ec.DVBS_I' +
        'd = s.DVBS_Id) as ch_count'
      '  from DVB_Streams s'
      '  where s.DVBN_ID = :DVBN_ID '
      '  order by s.Name  ')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcNetwork
    Left = 169
    Top = 228
  end
  object actlstSearch: TActionList
    Images = A4MainForm.ilFilter
    Left = 97
    Top = 117
    object actFilterSearchText: TAction
      Caption = 'actFilterSearchText'
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086'  '#1074#1074#1077#1076#1077#1085#1085#1086#1084#1091' '#1090#1077#1082#1089#1090#1091
      ImageIndex = 2
    end
    object actSearchNext: TAction
      Caption = 'actSearchNext'
      Hint = #1053#1072#1081#1090#1080' '#1089#1083#1077#1076#1091#1102#1097#1091#1102' '#1087#1086#1079#1080#1094#1080#1102
      ImageIndex = 3
    end
    object actSearchPrev: TAction
      Caption = 'actSearchPrev'
      Hint = #1053#1072#1081#1090#1080' '#1087#1088#1077#1076#1080#1076#1091#1097#1091#1102' '#1087#1086#1079#1080#1094#1080#1102
      ImageIndex = 4
    end
  end
  object srcNetwork: TDataSource
    AutoEdit = False
    DataSet = dsNetwork
    Left = 200
    Top = 112
  end
  object srcChannels: TDataSource
    AutoEdit = False
    DataSet = dsChannels
    Left = 112
    Top = 368
  end
  object srcEPG: TDataSource
    AutoEdit = False
    DataSet = dsEPG
    Left = 592
    Top = 456
  end
  object dsNetwork: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DVB_NETWORK'
      'WHERE'
      '        DVBN_ID = :OLD_DVBN_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    n.*'
      '  from DVB_Network n'
      ''
      ' WHERE '
      '        N.DVBN_ID = :OLD_DVBN_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    n.*'
      '  , (select'
      '         count(sc.Ch_Id)'
      '       from Dvb_Stream_Channels sc'
      '            inner join Dvb_Streams s on (sc.Dvbs_Id = s.Dvbs_Id)'
      '       where s.Dvbn_Id = n.Dvbn_Id) CH_COUNT'
      '  from DVB_Network n'
      '  order by n.Name  ')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 153
    Top = 116
  end
  object dsChannels: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    dc.DVBS_Id'
      '  , dc.Ch_Id'
      '  , dc.Sid'
      '  , dc.Lcn'
      '  , c.CH_NAME'
      '  , dc.Tsid'
      '  , c.Definition'
      
        '  , coalesce(dc.Notice || '#39'.'#39', '#39#39') || coalesce(c.CH_NOTICE, '#39#39') ' +
        'NOTICE'
      '  , dc.Vpid'
      '  , dc.Apid'
      '  , dc.A2pid'
      '  , dc.BITRATE'
      '  , dc.CNID'
      '  , dc.CONID  '
      '  from Dvb_Stream_Channels dc'
      '       inner join Channels c on (dc.Ch_Id = c.Ch_Id)'
      '  where dc.DVBS_Id = :DVBS_id'
      '  order by dc.Sid')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    DataSource = srcTS
    Left = 180
    Top = 362
  end
  object dsEPG: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    e.Date_Start'
      '  , e.Date_Stop'
      '  , e.Title'
      '  , e.minage'
      '  , e.Description'
      '  from Get_Epg(:DVBS_Id, null, null, 0) e'
      '  where e.CH_ID = :CH_ID'
      
        '    -- and cast(e.Date_Start as date) = cast(dateadd(minute, :h_' +
        'shift, cast(current_date as timestamp)) as date)'
      '    and cast(e.Date_Start as date) = current_date'
      '  order by e.DATE_START  ')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    DataSource = srcChannels
    Left = 670
    Top = 458
    WaitEndMasterScroll = True
  end
  object mtView: TMemTableEh
    AutoCalcFields = False
    FetchAllOnOpen = True
    Params = <>
    DataDriver = drvFIBView
    Options = [mtoTextFieldsCaseInsensitive]
    ReadOnly = True
    Left = 548
    Top = 136
  end
  object drvFIBView: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    SelectCommand.CommandText.Strings = (
      'select'
      '    n.Name'
      '  , n.Nid'
      '  , n.Onid'
      '  , s.Dvbn_Id'
      '  , s.Dvbs_Id'
      '  , s.Name ts_name'
      '  , s.Es_Ip'
      '  , s.Tsid'
      '  , s.Qam'
      '  , sc.Sid'
      '  , sc.Lcn'
      '  , coalesce(sc.Tsid, s.Tsid) as ch_tsid'
      '  , c.Ch_Name'
      '  , c.Definition'
      '  , coalesce(c.Lang, n.Lang) Lang'
      '  , cs.Name SRC_NAME'
      '  , ac.O_Name CARD_NAME'
      '  , sc.Vpid'
      '  , sc.Apid'
      '  , sc.A2pid'
      '  , csp.Ip'
      '  from Dvb_Network n'
      '       inner join Dvb_Streams s on (n.Dvbn_Id = s.Dvbn_Id)'
      
        '       inner join Dvb_Stream_Channels sc on (sc.Dvbs_Id = s.Dvbs' +
        '_Id)'
      '       inner join Channels c on (sc.Ch_Id = c.Ch_Id)'
      
        '       left outer join Channel_Src_Param csp on (c.Ch_Id = csp.C' +
        'h_Id and csp.On_Dvb = 1)'
      '       left outer join Channel_Src cs on (csp.Cs_Id = cs.Cs_Id)'
      
        '       left outer join OBJECTS ac on (ac.O_Id = csp.Card_Id and ' +
        'ac.O_Type = 44)'
      '  order by s.Dvbn_Id, s.Dvbs_Id, sc.Sid')
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <>
    GetrecCommand.Params = <>
    Left = 620
    Top = 136
  end
  object dsView: TDataSource
    AutoEdit = False
    DataSet = mtView
    Left = 588
    Top = 136
  end
  object PrintGrid: TPrintDBGridEh
    DBGridEh = dbgView
    Options = [pghFitGridToPageWidth, pghColored, pghOptimalColWidths]
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
    Title.Strings = (
      #1057#1090#1088#1091#1082#1090#1091#1088#1072' DVB '#1087#1086#1090#1086#1082#1086#1074)
    Units = MM
    Left = 532
    Top = 280
  end
  object pmViewGrid: TPopupMenu
    Left = 416
    Top = 280
    object actPrint1: TMenuItem
      Action = actPrint
    end
    object N1: TMenuItem
      Action = actSave
    end
  end
  object actlstDVB: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 356
    Top = 120
  end
  object PropStorageEh: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'pgcMode.tsEdit.pnlChannels.grdCh.<P>.Width'
      'pgcMode.tsEdit.pnlNetwork.<P>.Height'
      'pgcMode.tsEdit.pnlStream.<P>.Height')
    Left = 164
    Top = 448
  end
end
