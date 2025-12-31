object IPTVSettinsForm: TIPTVSettinsForm
  Left = 496
  Top = 494
  Caption = 'IPTV '#1085#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 557
  ClientWidth = 843
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
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcMode: TPageControl
    Left = 0
    Top = 0
    Width = 843
    Height = 557
    ActivePage = tsEdit
    Align = alClient
    TabOrder = 0
    OnChange = pgcModeChange
    object tsEdit: TTabSheet
      Caption = ' '#1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '
      object spl2: TSplitter
        Left = 0
        Top = 249
        Width = 835
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 835
        Height = 249
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object spl1: TSplitter
          Left = 517
          Top = 22
          Height = 227
          Align = alRight
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 835
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
            Caption = ' '#1043#1088#1091#1087#1087#1099' '
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
            object btnGroupNEW: TToolButton
              Left = 5
              Top = 0
              Action = actGroupNEW
            end
            object ToolButton11: TToolButton
              Left = 28
              Top = 0
              Width = 4
              Caption = 'ToolButton5'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object btnGroupEdit: TToolButton
              Left = 32
              Top = 0
              Action = actGroupEdit
            end
            object ToolButton13: TToolButton
              Left = 55
              Top = 0
              Width = 4
              Caption = 'ToolButton6'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object btnNetworkDel: TToolButton
              Left = 59
              Top = 0
              Action = actGroupDel
            end
          end
        end
        object dbgIPTVGroup: TDBGridEh
          Left = 0
          Top = 22
          Width = 517
          Height = 227
          Align = alClient
          AllowedOperations = []
          DataSource = srcIPTVGroup
          DynProps = <>
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterRowCount = 1
          FooterParams.Color = clWindow
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
          PopupMenu = pmPopUp
          SearchPanel.Enabled = True
          SortLocal = True
          STFilter.Local = True
          SumList.Active = True
          TabOrder = 1
          TitleParams.MultiTitle = True
          OnDblClick = dbgIPTVGroupDblClick
          OnGetCellParams = dbgIPTVGroupGetCellParams
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
              Width = 78
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CODE'
              Footers = <>
              Title.Caption = #1050#1086#1076
              Title.TitleButton = True
              Width = 45
            end
            item
              CellButtons = <>
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'DISABLED'
              Footers = <>
              Title.Caption = #1054#1090#1082#1083'.'
              Title.Hint = #1043#1088#1091#1087#1087#1072' '#1086#1090#1082#1083#1102#1095#1077#1085#1072
              Title.TitleButton = True
              Width = 36
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'URL'
              Footers = <>
              Title.TitleButton = True
              Width = 151
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 149
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'ADDED_BY'
              Footers = <>
              Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085'|'#1050#1077#1084
              Title.TitleButton = True
              Width = 80
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'ADDED_ON'
              Footers = <>
              Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085'|'#1050#1086#1075#1076#1072
              Title.TitleButton = True
              Width = 80
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'EDIT_BY'
              Footers = <>
              Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1077#1084
              Title.TitleButton = True
              Width = 80
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'EDIT_ON'
              Footers = <>
              Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1086#1075#1076#1072
              Title.TitleButton = True
              Width = 80
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pnl1: TPanel
          Left = 520
          Top = 22
          Width = 315
          Height = 227
          Align = alRight
          BevelOuter = bvNone
          Caption = 'pnl1'
          TabOrder = 2
          object dbgAtr: TDBGridEh
            Left = 0
            Top = 23
            Width = 315
            Height = 204
            Align = alClient
            AllowedOperations = []
            DataSource = srcAttributes
            DynProps = <>
            Flat = True
            FooterParams.Color = clWindow
            TabOrder = 1
            OnDblClick = dbgAtrDblClick
            Columns = <
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'O_NAME'
                Footers = <>
                Title.Caption = #1040#1090#1088#1080#1073#1091#1090
                Title.TitleButton = True
                Width = 101
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'CA_VALUE'
                Footers = <>
                Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
                Title.TitleButton = True
                Width = 74
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'NOTICE'
                Footers = <>
                Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                Title.TitleButton = True
                Width = 109
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object tlbAttributes: TToolBar
            Left = 0
            Top = 0
            Width = 315
            Height = 23
            Images = A4MainForm.ICONS_ACTIVE
            TabOrder = 0
            object btnAddAtr: TToolButton
              Left = 0
              Top = 0
              Action = actAtrAdd
              ParentShowHint = False
              ShowHint = True
            end
            object btnEditAtr: TToolButton
              Left = 23
              Top = 0
              Action = actAtrEdit
              ParentShowHint = False
              ShowHint = True
            end
            object btnDelAtr: TToolButton
              Left = 46
              Top = 0
              Action = actAtrDel
              ParentShowHint = False
              ShowHint = True
            end
          end
        end
      end
      object dbgCh: TDBGridEh
        Left = 0
        Top = 252
        Width = 835
        Height = 277
        Align = alClient
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
        TabOrder = 1
        TitleParams.MultiTitle = True
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'LCN'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088
            Title.TitleButton = True
            Width = 40
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CH_NAME'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 176
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CODE'
            Footers = <>
            Title.Caption = #1050#1086#1076
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'URL'
            Footers = <>
            Title.TitleButton = True
            Width = 217
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
            Width = 298
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsView: TTabSheet
      Caption = ' '#1055#1088#1086#1089#1084#1086#1090#1088' '
      ImageIndex = 1
      object dbgView: TDBGridEh
        Left = 0
        Top = 0
        Width = 835
        Height = 529
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
          end
          item
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
        STFilter.Local = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1043#1088#1091#1087#1087#1072'|'#1053#1072#1079#1074#1072#1085#1080#1077
            Title.TitleButton = True
            Visible = False
            Width = 84
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CODE'
            Footers = <>
            Title.Caption = #1043#1088#1091#1087#1087#1072'|'#1050#1086#1076
            Title.TitleButton = True
            Width = 78
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'URL'
            Footers = <>
            Title.Caption = #1043#1088#1091#1087#1087#1072'|URL'
            Title.TitleButton = True
            Width = 75
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CH_NAME'
            Footers = <>
            Title.Caption = #1050#1072#1085#1072#1083'|'#1053#1072#1079#1074#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 118
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'LCN'
            Footers = <>
            Title.Caption = #1050#1072#1085#1072#1083'|'#1053#1086#1084#1077#1088
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'C_CODE'
            Footers = <>
            Title.Caption = #1050#1072#1085#1072#1083'|'#1050#1086#1076
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'C_URL'
            Footers = <>
            Title.Caption = #1050#1072#1085#1072#1083'|URL'
            Title.TitleButton = True
            Width = 163
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 398
    Top = 120
    object actGroupNEW: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 2
      OnExecute = actGroupNEWExecute
    end
    object actGroupEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 4
      OnExecute = actGroupEditExecute
    end
    object actGroupDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 3
      OnExecute = actGroupDelExecute
    end
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082' ...'
      OnExecute = actSaveExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1099
      OnExecute = actPrintExecute
    end
    object actAtrAdd: TAction
      Caption = 'actAtrAdd'
      ImageIndex = 2
      OnExecute = actAtrAddExecute
    end
    object actAtrEdit: TAction
      Caption = 'actAtrEdit'
      ImageIndex = 4
      OnExecute = actAtrEditExecute
    end
    object actAtrDel: TAction
      Caption = 'actAtrDel'
      ImageIndex = 3
      OnExecute = actAtrDelExecute
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
    object miN2: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1099
      OnClick = miN2Click
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
    Top = 418
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
    Left = 76
    Top = 440
  end
  object actlstSearch: TActionList
    Images = A4MainForm.ilFilter
    Left = 89
    Top = 109
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
  object srcIPTVGroup: TDataSource
    AutoEdit = False
    DataSet = dsIPTVGroup
    Left = 280
    Top = 128
  end
  object srcChannels: TDataSource
    AutoEdit = False
    DataSet = dsChannels
    Left = 224
    Top = 328
  end
  object dsIPTVGroup: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    IPTV_GROUP'
      'WHERE'
      '        IG_ID = :OLD_IG_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '*'
      'from Iptv_Group g'
      ''
      ' WHERE '
      '        G.IG_ID = :OLD_IG_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '*'
      'from Iptv_Group g'
      'order by G.Name')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 201
    Top = 124
  end
  object dsChannels: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    gc.Ig_Id'
      '  , gc.Lcn'
      '  , c.CH_NAME'
      '  , gc.Url'
      '  , gc.Code'
      '  , c.Definition'
      
        '  , coalesce(gc.Notice || '#39'.'#39', '#39#39') || coalesce(c.CH_NOTICE, '#39#39') ' +
        'NOTICE'
      '  from Iptv_Group_Channels gc'
      '       inner join Channels c on (gc.Ch_Id = c.Ch_Id)'
      '  where gc.Ig_Id = :IG_ID'
      '  order by gc.Lcn')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    DataSource = srcIPTVGroup
    Left = 164
    Top = 322
  end
  object mtView: TMemTableEh
    AutoCalcFields = False
    FetchAllOnOpen = True
    Params = <>
    DataDriver = drvFIBView
    Options = [mtoTextFieldsCaseInsensitive]
    ReadOnly = True
    Left = 380
    Top = 304
  end
  object drvFIBView: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    SelectCommand.CommandText.Strings = (
      'select'
      '    g.Name, g.Code, g.Url,'
      '    c.Ch_Name, gc.Lcn, gc.Code C_CODE, gc.Url C_URL'
      '  from Iptv_Group g'
      
        '       left outer join Iptv_Group_Channels gc on (g.Ig_Id = gc.I' +
        'g_Id)'
      '       left outer join Channels c on (gc.Ch_Id = c.Ch_Id)'
      'order by g.Name, c.Ch_Name')
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <>
    GetrecCommand.Params = <>
    Left = 380
    Top = 424
  end
  object dsView: TDataSource
    AutoEdit = False
    DataSet = mtView
    Left = 380
    Top = 360
  end
  object pmViewGrid: TPopupMenu
    Left = 536
    Top = 344
    object actPrint1: TMenuItem
      Action = actPrint
    end
    object N1: TMenuItem
      Action = actSave
    end
  end
  object dsAttributes: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    IPTV_GROUP_ATTRIBUTES'
      'WHERE'
      '        IGA_ID = :OLD_IGA_ID'
      '    ')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      'select'
      '    A.O_NAME, CA.*'
      '  from Iptv_Group_Attributes CA'
      
        '       inner join OBJECTS A on (CA.O_ID = A.O_ID and a.O_Type = ' +
        '32)'
      '  where(  CA.Ig_Id = :Ig_Id'
      '     ) and (     CA.IGA_ID = :OLD_IGA_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    A.O_NAME, CA.*'
      '  from Iptv_Group_Attributes CA'
      
        '       inner join OBJECTS A on (CA.O_ID = A.O_ID and a.O_Type = ' +
        '32)'
      '  where CA.Ig_Id = :Ig_Id')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcIPTVGroup
    Left = 649
    Top = 117
  end
  object srcAttributes: TDataSource
    DataSet = dsAttributes
    Left = 736
    Top = 120
  end
end
