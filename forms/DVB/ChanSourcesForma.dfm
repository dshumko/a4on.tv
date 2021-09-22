object ChanSourcesForm: TChanSourcesForm
  Left = 496
  Top = 494
  Caption = #1048#1089#1090#1086#1095#1085#1080#1082#1080' '#1082#1072#1085#1072#1083#1086#1074
  ClientHeight = 557
  ClientWidth = 953
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
    Width = 953
    Height = 557
    ActivePage = tsEdit
    Align = alClient
    TabOrder = 0
    OnChange = pgcModeChange
    object tsEdit: TTabSheet
      Caption = ' '#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '
      object Splitter1: TSplitter
        Left = 0
        Top = 225
        Width = 945
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object pnlNetwork: TPanel
        Left = 0
        Top = 0
        Width = 945
        Height = 225
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object dbgSource: TDBGridEh
          Left = 0
          Top = 22
          Width = 945
          Height = 203
          Align = alClient
          AllowedOperations = []
          DataSource = srcSource
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
          TabOrder = 1
          TitleParams.MultiTitle = True
          OnDblClick = dbgSourceDblClick
          Columns = <
            item
              CellButtons = <>
              Checkboxes = False
              DynProps = <>
              EditButtons = <>
              FieldName = 'NAME'
              Footer.ValueType = fvtCount
              Footers = <>
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 120
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DEG'
              Footers = <>
              Title.Caption = #1043#1088#1072#1076#1091#1089
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_COUNT'
              Footer.ValueType = fvtSum
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
              CellDataIsLink = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'URL'
              Footers = <>
              Title.Caption = 'WEB'
              Width = 66
              OnCellDataLinkClick = dbgSourceColumns5CellDataLinkClick
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 945
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
            Caption = ' '#1048#1089#1090#1086#1095#1085#1080#1082
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowAccelChar = False
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
              Action = actSrcNew
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
              Action = actSrcEdit
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
              Action = actSrcDel
            end
          end
        end
      end
      object pnlStream: TPanel
        Left = 0
        Top = 228
        Width = 945
        Height = 301
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 945
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
            Caption = ' '#1050#1072#1085#1072#1083#1099
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowAccelChar = False
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
              Action = actCHnew
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
              Action = actCHedit
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
              Action = actCHdel
            end
          end
        end
        object dbgChannel: TDBGridEh
          Left = 0
          Top = 22
          Width = 945
          Height = 279
          Align = alClient
          AllowedOperations = []
          DataSource = srcChannel
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
          TabOrder = 1
          TitleParams.MultiTitle = True
          OnDblClick = dbgChannelDblClick
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Ch_Name'
              Footer.ValueType = fvtCount
              Footers = <>
              Title.Caption = #1050#1072#1085#1072#1083
              Title.TitleButton = True
              Width = 133
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Definition'
              Footers = <>
              Title.Caption = 'Def'
              Title.TitleButton = True
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'VIDEO_Codec'
              Footers = <>
              Title.Caption = #1042#1080#1076#1077#1086' '#1082#1086#1076#1077#1082
              Title.Hint = #1050#1072#1085#1072#1083#1086#1074' '#1074' '#1087#1086#1090#1086#1082#1077
              Title.TitleButton = True
              Width = 68
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'S_SYSTEM'
              Footers = <>
              Title.Caption = #1057#1090#1072#1085#1076#1072#1088#1090
              Width = 81
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CRYPT'
              Footers = <>
              Title.Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072
              Title.TitleButton = True
              Width = 78
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'FREQ'
              Footers = <>
              Title.Caption = #1063#1072#1089#1090#1086#1090#1072
              Title.TitleButton = True
              Width = 72
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Symrate'
              Footers = <>
              Title.Caption = #1057#1082#1086#1088#1086#1089#1090#1100
              Title.TitleButton = True
              Width = 71
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Ip'
              Footers = <>
              Title.Caption = 'IP'
              Title.TitleButton = True
              Width = 102
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 101
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CARD'
              Footers = <>
              Title.Caption = #1050#1072#1088#1090#1086#1095#1082#1072
              Title.TitleButton = True
              Width = 65
            end
            item
              CellButtons = <>
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'ON_ANALOG'
              Footers = <>
              Title.Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1076#1083#1103'|'#1040#1085#1072#1083#1086#1075
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'ON_DVB'
              Footers = <>
              Title.Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1076#1083#1103'|DVB'
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'ON_IPTV'
              Footers = <>
              Title.Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1076#1083#1103'|IPTV'
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NID'
              Footers = <>
              Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1085#1072#1083#1072' '#1080#1089#1090#1086#1095#1085#1080#1082#1072'|NID'
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'ONID'
              Footers = <>
              Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1085#1072#1083#1072' '#1080#1089#1090#1086#1095#1085#1080#1082#1072'|ONID'
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'TSID'
              Footers = <>
              Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1085#1072#1083#1072' '#1080#1089#1090#1086#1095#1085#1080#1082#1072'|TSID'
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'SID'
              Footers = <>
              Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1085#1072#1083#1072' '#1080#1089#1090#1086#1095#1085#1080#1082#1072'|SID'
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'VPID'
              Footers = <>
              Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1085#1072#1083#1072' '#1080#1089#1090#1086#1095#1085#1080#1082#1072'|VPID'
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'APID'
              Footers = <>
              Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1085#1072#1083#1072' '#1080#1089#1090#1086#1095#1085#1080#1082#1072'|APID'
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'A2PID'
              Footers = <>
              Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1085#1072#1083#1072' '#1080#1089#1090#1086#1095#1085#1080#1082#1072'|A2PID'
              Title.TitleButton = True
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
        Width = 945
        Height = 529
        Align = alClient
        DataGrouping.Active = True
        DataGrouping.DefaultStateExpanded = True
        DataGrouping.FootersDefValues.ShowFunctionName = True
        DataGrouping.FootersDefValues.RunTimeCustomizable = True
        DataGrouping.GroupLevels = <
          item
            ColumnName = 'Column_0_NAME'
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
        OnDblClick = dbgViewDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082
            Title.TitleButton = True
            Visible = False
            Width = 67
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
            FieldName = 'ST_NAME'
            Footers = <>
            Title.Caption = #1057#1090#1072#1085#1076#1072#1088#1090
            Title.TitleButton = True
            Width = 69
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Freq'
            Footers = <>
            PopupMenu = pmPopUp
            Title.Caption = #1063#1072#1089#1090#1086#1090#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Symrate'
            Footers = <>
            Title.Caption = #1057#1082#1086#1088#1086#1089#1090#1100
            Title.TitleButton = True
            Visible = False
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'VIDEO_Codec'
            Footers = <>
            Title.Caption = #1050#1086#1076#1077#1082
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'S_CRYPT'
            Footers = <>
            Title.Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072
            Title.TitleButton = True
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DEG'
            Footers = <>
            Title.Caption = #1043#1088#1072#1076#1091#1089
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CARD'
            Footers = <>
            Title.Caption = #1050#1072#1088#1090#1086#1095#1082#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'ON_ANALOG'
            Footers = <>
            Title.Caption = #1040#1085#1072#1083#1086#1075
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'ON_DVB'
            Footers = <>
            Title.Caption = 'DVB'
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'ON_IPTV'
            Footers = <>
            Title.Caption = 'IPTV'
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object srcChannel: TDataSource
    AutoEdit = False
    DataSet = dsChannel
    Left = 152
    Top = 352
  end
  object actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 430
    Top = 120
    object actCHnew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1085#1072#1083
      ImageIndex = 2
      OnExecute = actCHnewExecute
    end
    object actCHedit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1085#1072#1083
      ImageIndex = 4
      OnExecute = actCHeditExecute
    end
    object actCHdel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1085#1072#1083
      ImageIndex = 3
      OnExecute = actCHdelExecute
    end
    object actSrcNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080#1089#1090#1086#1095#1085#1080#1082
      ImageIndex = 2
      OnExecute = actSrcNewExecute
    end
    object actSrcEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1089#1090#1086#1095#1085#1080#1082
      ImageIndex = 4
      OnExecute = actSrcEditExecute
    end
    object actSrcDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1080#1089#1090#1086#1095#1085#1080#1082
      ImageIndex = 3
      OnExecute = actSrcDelExecute
    end
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082' ...'
      OnExecute = actSaveExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1099
      OnExecute = actPrintExecute
    end
  end
  object pmPopUp: TPopupMenu
    Left = 283
    Top = 159
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
    Left = 228
    Top = 402
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
    Left = 300
    Top = 408
  end
  object dsChannel: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CHANNEL_SRC_PARAM'
      'WHERE'
      '        CS_ID = :OLD_CS_ID'
      '    and CH_ID = :OLD_CH_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '   c.Ch_Name'
      '  , c.Definition'
      '  , vc.O_Name VIDEO_Codec'
      '  , cr.O_Name CRYPT'
      '  , sc.O_Name S_SYSTEM'
      '  , cd.O_Name CARD  '
      '  , p.*'
      '  from Channel_Src_Param p'
      '       inner join Channels c on (c.Ch_Id = p.Ch_Id)'
      
        '       left outer join objects sc on (sc.O_Id = p.Cs_System and ' +
        'sc.O_Type = 41)'
      
        '       left outer join objects vc on (vc.O_Id = p.V_Codec and vc' +
        '.O_Type = 42)'
      
        '       left outer join objects cr on (cr.O_Id = p.S_Crypt and cr' +
        '.O_Type = 43)'
      
        '       left outer join objects cd on (cd.O_Id = p.Card_Id and cd' +
        '.O_Type = 44)'
      'where p.Cs_Id = :OLD_Cs_Id'
      'and  p.Ch_Id = :OLD_Ch_Id ')
    SelectSQL.Strings = (
      'select'
      '   c.Ch_Name'
      '  , c.Definition'
      '  , vc.O_Name VIDEO_Codec'
      '  , cr.O_Name CRYPT'
      '  , sc.O_Name S_SYSTEM'
      '  , cd.O_Name CARD  '
      '  , p.*'
      '  from Channel_Src_Param p'
      '       inner join Channels c on (c.Ch_Id = p.Ch_Id)'
      
        '       left outer join objects sc on (sc.O_Id = p.Cs_System and ' +
        'sc.O_Type = 41)'
      
        '       left outer join objects vc on (vc.O_Id = p.V_Codec and vc' +
        '.O_Type = 42)'
      
        '       left outer join objects cr on (cr.O_Id = p.S_Crypt and cr' +
        '.O_Type = 43)'
      
        '       left outer join objects cd on (cd.O_Id = p.Card_Id and cd' +
        '.O_Type = 44)       '
      'where p.Cs_Id = :Cs_Id'
      'order by c.Ch_Name')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcSource
    Left = 73
    Top = 348
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
  object srcSource: TDataSource
    AutoEdit = False
    DataSet = dsSource
    Left = 216
    Top = 120
  end
  object dsSource: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    Channel_Src'
      'WHERE'
      '        Cs_Id = :OLD_Cs_Id'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    s.*'
      '  , (select'
      '         count(sc.Ch_Id)'
      '       from Channel_Src_Param sc'
      '       where sc.Cs_Id = s.Cs_Id) CH_COUNT'
      '  from Channel_Src s'
      'where s.Cs_Id = :OLD_Cs_Id'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    s.*'
      '  , (select'
      '         count(sc.Ch_Id)'
      '       from Channel_Src_Param sc'
      '       where sc.Cs_Id = s.Cs_Id) CH_COUNT'
      '  from Channel_Src s'
      '  order by s.Name')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 153
    Top = 116
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
      '    s.Name'
      '  , s.Deg'
      '  , st.O_Name ST_NAME'
      '  , p.Freq'
      '  , p.Symrate'
      '  , vc.O_Name VIDEO_Codec'
      '  , cr.O_Name CRYPT'
      '  , c.Ch_Name'
      '  , c.Definition'
      '  , cd.O_Name CARD'
      '  , p.On_Analog'
      '  , p.On_Dvb'
      '  , p.On_Iptv'
      '  , p.Cs_Id'
      '  , p.Ch_Id'
      '  from Channel_Src s'
      '       inner join Channel_Src_Param p on (s.Cs_Id = p.Cs_Id)'
      '       inner join Channels c on (c.Ch_Id = p.Ch_Id)'
      
        '       left outer join objects st on (st.O_Id = p.Cs_System and ' +
        'st.O_Type = 41)'
      
        '       left outer join objects vc on (vc.O_Id = p.V_Codec and vc' +
        '.O_Type = 42)'
      
        '       left outer join objects cr on (cr.O_Id = p.S_Crypt and cr' +
        '.O_Type = 43)'
      
        '       left outer join objects cd on (cd.O_Id = p.Card_Id and cd' +
        '.O_Type = 44)'
      'order by s.name , c.Ch_Name')
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <>
    GetrecCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'OLD_Cs_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_Ch_Id'
        ParamType = ptUnknown
      end>
    GetrecCommand.CommandText.Strings = (
      'select'
      '    s.Name'
      '  , s.Deg'
      '  , st.O_Name ST_NAME'
      '  , p.Freq'
      '  , p.Symrate'
      '  , vc.O_Name VIDEO_Codec'
      '  , cr.O_Name CRYPT'
      '  , c.Ch_Name'
      '  , c.Definition'
      '  , cd.O_Name CARD'
      '  , p.On_Analog'
      '  , p.On_Dvb'
      '  , p.On_Iptv'
      '  , p.Cs_Id'
      '  , p.Ch_Id'
      '  from Channel_Src s'
      '       inner join Channel_Src_Param p on (s.Cs_Id = p.Cs_Id)'
      '       inner join Channels c on (c.Ch_Id = p.Ch_Id)'
      
        '       left outer join objects st on (st.O_Id = p.Cs_System and ' +
        'st.O_Type = 41)'
      
        '       left outer join objects vc on (vc.O_Id = p.V_Codec and vc' +
        '.O_Type = 42)'
      
        '       left outer join objects cr on (cr.O_Id = p.S_Crypt and cr' +
        '.O_Type = 43)'
      
        '       left outer join objects cd on (cd.O_Id = p.Card_Id and cd' +
        '.O_Type = 44)'
      'where'
      '  p.Cs_Id = :OLD_Cs_Id'
      '  and p.Ch_Id = :OLD_Ch_Id')
    Left = 644
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
    Left = 444
    Top = 376
  end
  object pmViewGrid: TPopupMenu
    Left = 560
    Top = 376
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
      'pgcMode.tsEdit.pnlNetwork.<P>.Height'
      'pgcMode.tsEdit.pnlStream.<P>.Height')
    Left = 140
    Top = 408
  end
end
