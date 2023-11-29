object UsersForm: TUsersForm
  Left = 294
  Top = 200
  Caption = #1043#1088#1091#1087#1087#1099' '#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
  ClientHeight = 487
  ClientWidth = 717
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TPageControl
    Left = 0
    Top = 0
    Width = 717
    Height = 487
    ActivePage = tabGroup
    Align = alClient
    TabOrder = 0
    OnChange = pcChange
    object tabGroup: TTabSheet
      Caption = #1043#1088#1091#1087#1087#1099
      object Splitter1: TSplitter
        Left = 305
        Top = 0
        Height = 459
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 305
        Height = 459
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object dbgGroups: TDBGridEh
          Left = 0
          Top = 25
          Width = 305
          Height = 434
          Align = alClient
          AllowedOperations = []
          DataSource = srcGroups
          DrawMemoText = True
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          SearchPanel.Enabled = True
          SearchPanel.FilterOnTyping = True
          TabOrder = 1
          OnDblClick = dbgGroupsDblClick
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'GROUP_NAME'
              Footers = <>
              Title.Caption = #1043#1088#1091#1087#1087#1072
              Title.TitleButton = True
              Width = 72
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'LOCKEDOUT'
              Footers = <>
              Title.Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1085#1072
              Title.TitleButton = True
              Width = 42
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 67
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'USER_LST'
              Footers = <>
              Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
              Title.TitleButton = True
              Width = 82
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 305
          Height = 25
          Caption = 'ToolBar1'
          Images = ICONS_ACTIVE
          TabOrder = 0
          object ToolButton13: TToolButton
            Left = 0
            Top = 0
            Width = 5
            Caption = 'ToolButton6'
            ImageIndex = 4
            Style = tbsSeparator
          end
          object tbHAdd: TToolButton
            Left = 5
            Top = 0
            Action = actAddGroup
          end
          object tbHEdit: TToolButton
            Left = 28
            Top = 0
            Action = actEditGroup
          end
          object ToolButton3: TToolButton
            Left = 51
            Top = 0
            Width = 5
            Caption = 'ToolButton3'
            ImageIndex = 30
            Style = tbsSeparator
          end
          object tbHDelete: TToolButton
            Left = 56
            Top = 0
            Action = actDelGroup
          end
          object ToolButton17: TToolButton
            Left = 79
            Top = 0
            Width = 4
            Caption = 'ToolButton10'
            ImageIndex = 28
            Style = tbsSeparator
          end
        end
      end
      object pgcRights: TPageControl
        Left = 308
        Top = 0
        Width = 401
        Height = 459
        ActivePage = tsRights
        Align = alClient
        TabOrder = 1
        OnChange = pgcRightsChange
        object tsRights: TTabSheet
          Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1085#1099#1077' '#1086#1087#1077#1088#1072#1094#1080#1080
          ImageIndex = 3
          object dbgRights: TDBGridEh
            Left = 0
            Top = 0
            Width = 393
            Height = 431
            Align = alClient
            AllowedOperations = [alopUpdateEh]
            DataSource = srcRights
            DynProps = <>
            Flat = True
            FooterParams.Color = clWindow
            GridLineParams.VertEmptySpaceStyle = dessNonEh
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
            SearchPanel.Enabled = True
            STFilter.Local = True
            STFilter.Visible = True
            TabOrder = 0
            OnExit = dbgRightsExit
            OnGetCellParams = dbgRightsGetCellParams
            Columns = <
              item
                AutoFitColWidth = False
                CellButtons = <>
                Checkboxes = True
                DynProps = <>
                EditButtons = <>
                FieldName = 'RALLOWED'
                Footers = <>
                Title.Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100
                Title.TitleButton = True
                Width = 66
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'CATEGORY'
                Footers = <>
                ReadOnly = True
                Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103
                Title.TitleButton = True
                Title.SortIndex = 1
                Title.SortMarker = smUpEh
                Width = 103
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'RIGHTS'
                Footers = <>
                ReadOnly = True
                Title.Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1080#1077
                Title.TitleButton = True
                Title.SortIndex = 2
                Title.SortMarker = smUpEh
                Width = 155
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'NOTICE'
                Footers = <>
                ReadOnly = True
                Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
                Title.TitleButton = True
                Width = 158
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        object tsReports: TTabSheet
          Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1085#1099#1077' '#1086#1090#1095#1077#1090#1099
          ImageIndex = 1
          object dbgReports: TDBGridEh
            Left = 0
            Top = 0
            Width = 393
            Height = 431
            Align = alClient
            AllowedOperations = [alopUpdateEh]
            DataSource = srcReports
            DynProps = <>
            Flat = True
            FooterParams.Color = clWindow
            GridLineParams.VertEmptySpaceStyle = dessNonEh
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
            SearchPanel.Enabled = True
            STFilter.Local = True
            STFilter.Visible = True
            TabOrder = 0
            OnExit = dbgRightsExit
            Columns = <
              item
                AutoFitColWidth = False
                CellButtons = <>
                Checkboxes = True
                DynProps = <>
                EditButtons = <>
                FieldName = 'RALLOWED'
                Footers = <>
                Title.Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100
                Title.TitleButton = True
                Width = 62
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'FULL_NAME'
                Footers = <>
                Title.Caption = #1052#1077#1085#1102' '#1086#1090#1095#1077#1090#1072
                Title.TitleButton = True
                Title.SortIndex = 1
                Title.SortMarker = smUpEh
                Width = 164
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'REPORT_NAME'
                Footers = <>
                Title.Caption = #1054#1090#1095#1077#1090
                Title.TitleButton = True
                Title.SortIndex = 2
                Title.SortMarker = smUpEh
                Width = 191
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        object tsModules: TTabSheet
          Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1085#1099#1077' '#1084#1086#1076#1091#1083#1080
          ImageIndex = 2
          object dbgModules: TDBGridEh
            Left = 0
            Top = 0
            Width = 393
            Height = 431
            Align = alClient
            AllowedOperations = [alopUpdateEh]
            DataSource = srcModules
            DynProps = <>
            Flat = True
            FooterParams.Color = clWindow
            GridLineParams.VertEmptySpaceStyle = dessNonEh
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
            SearchPanel.Enabled = True
            STFilter.Local = True
            STFilter.Visible = True
            TabOrder = 0
            OnExit = dbgRightsExit
            Columns = <
              item
                AutoFitColWidth = False
                CellButtons = <>
                Checkboxes = True
                DynProps = <>
                EditButtons = <>
                FieldName = 'RALLOWED'
                Footers = <>
                Title.Caption = #1056#1072#1079#1088#1077#1096#1080#1090#1100
                Title.TitleButton = True
                Width = 62
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'NAME'
                Footers = <>
                Title.Caption = #1052#1086#1076#1091#1083#1100
                Title.TitleButton = True
                Title.SortIndex = 1
                Title.SortMarker = smUpEh
                Width = 184
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
      end
    end
    object tabUsers: TTabSheet
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      ImageIndex = 1
      object Splitter4: TSplitter
        Left = 0
        Top = 200
        Width = 709
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object Panel8: TPanel
        Left = 0
        Top = 0
        Width = 709
        Height = 200
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object dbgUsers: TDBGridEh
          Left = 0
          Top = 24
          Width = 709
          Height = 176
          Align = alClient
          AllowedOperations = []
          DataSource = srcUsers
          DrawMemoText = True
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          PopupMenu = PopupMenu1
          SearchPanel.Enabled = True
          SearchPanel.FilterOnTyping = True
          STFilter.Local = True
          TabOrder = 1
          OnDblClick = dbgUsersDblClick
          Columns = <
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'IBNAME'
              Footers = <>
              Title.Caption = 'LOGIN'
              Title.TitleButton = True
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'LOCKEDOUT'
              Footers = <>
              Title.Caption = #1041#1083#1086#1082
              Title.TitleButton = True
              Width = 32
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'SURNAME'
              Footers = <>
              Title.Caption = #1060#1072#1084#1080#1083#1080#1103
              Title.TitleButton = True
              Width = 94
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'FIRSTNAME'
              Footers = <>
              Title.Caption = #1048#1084#1103
              Title.TitleButton = True
              Width = 74
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'MIDLENAME'
              Footers = <>
              Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
              Title.TitleButton = True
              Width = 86
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'PHONE_NO'
              Footers = <>
              Title.Caption = #1058#1077#1083#1077#1092#1086#1085
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
              Width = 149
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'GROUPS'
              Footers = <>
              Title.Caption = #1043#1088#1091#1087#1087#1099
              Title.TitleButton = True
              Width = 104
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'LAST_LOGGED'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083'. '#1074#1093#1086#1076#1072
              Visible = False
              Width = 60
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'PSWD_CHANGED'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1089#1084#1077#1085#1099' '#1087#1072#1088#1086#1083#1103
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ToolBar1: TToolBar
          Left = 0
          Top = 0
          Width = 709
          Height = 24
          ButtonHeight = 24
          ButtonWidth = 24
          Caption = 'ToolBar1'
          Images = ICONS_ACTIVE
          TabOrder = 0
          object ToolButton2: TToolButton
            Left = 0
            Top = 0
            Action = actAddUSer
          end
          object btnUserForWorker: TToolButton
            Left = 24
            Top = 0
            Hint = #1057#1086#1079#1076#1072#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1076#1083#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
            Action = actUserForWorker
          end
          object ToolButton4: TToolButton
            Left = 48
            Top = 0
            Action = actEditUser
          end
          object ToolButton1: TToolButton
            Left = 72
            Top = 0
            Action = actCloneUser
          end
          object btn1: TToolButton
            Left = 96
            Top = 0
            Width = 31
            Caption = 'btn1'
            ImageIndex = 9
            Style = tbsSeparator
          end
          object ToolButton6: TToolButton
            Left = 127
            Top = 0
            Action = actDelUser
          end
        end
      end
      object pcUserRA: TPageControl
        Left = 0
        Top = 203
        Width = 709
        Height = 256
        ActivePage = tsGroups
        Align = alClient
        TabOrder = 1
        OnChange = pcUserRAChange
        object tsGroups: TTabSheet
          Caption = #1043#1088#1091#1087#1087#1099' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 701
            Height = 228
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Splitter3: TSplitter
              Left = 337
              Top = 0
              Height = 228
            end
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 337
              Height = 228
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object dbgGU: TDBGridEh
                Left = 0
                Top = 0
                Width = 300
                Height = 228
                Align = alClient
                AllowedOperations = []
                DataSource = srcGU
                DynProps = <>
                Flat = True
                FooterParams.Color = clWindow
                GridLineParams.VertEmptySpaceStyle = dessNonEh
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
                ReadOnly = True
                TabOrder = 0
                OnDblClick = dbgGUDblClick
                Columns = <
                  item
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'GROUP_NAME'
                    Footers = <>
                    Title.Caption = #1043#1088#1091#1087#1087#1072
                  end
                  item
                    AutoFitColWidth = False
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'LOCKEDOUT'
                    Footers = <>
                    Title.Caption = #1041#1083#1086#1082
                    Width = 29
                  end
                  item
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'NOTICE'
                    Footers = <>
                    Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                    Width = 89
                  end>
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
              object Panel10: TPanel
                Left = 300
                Top = 0
                Width = 37
                Height = 228
                Align = alRight
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 1
                object sbUGAdd: TSpeedButton
                  Left = 2
                  Top = 2
                  Width = 33
                  Height = 60
                  Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1074' '#1075#1088#1091#1087#1087#1091
                  Align = alTop
                  Flat = True
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3
                    783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    B1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EB3783EB3783EB3
                    783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FB1773EB3783E
                    B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                    3EB3783EB3783EB3783EFF00FFB1773EB3783EB3783EB3783EB3783EB3783EB3
                    783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FFF00FFFF00FF
                    B1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3
                    783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                  OnClick = sbUGAddClick
                end
                object sbUGremove: TSpeedButton
                  Left = 2
                  Top = 166
                  Width = 33
                  Height = 60
                  Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1080#1079' '#1075#1088#1091#1087#1087#1099
                  Align = alBottom
                  Flat = True
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3049CC30
                    49CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FF3049CC3049CC3049CC3049CCFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FF3049CC3049CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3049CC3049CC3049CC3049
                    CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FF3049CC3049CC3049CC3049CCFF00FFFF00FF3049CC3049CC
                    3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049
                    CC3049CC3049CCFF00FF3049CC3049CC3049CC3049CC3049CC3049CC3049CC30
                    49CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC
                    3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049
                    CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FF3049CC3049CC3049CC3049CCFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3049CC3049CC3049CC3049
                    CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FF3049CC3049CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FF3049CC3049CC3049CC3049CCFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3049CC30
                    49CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                  OnClick = sbUGremoveClick
                end
              end
            end
            object Panel7: TPanel
              Left = 340
              Top = 0
              Width = 361
              Height = 228
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object dbgG: TDBGridEh
                Left = 0
                Top = 0
                Width = 361
                Height = 228
                Align = alClient
                AllowedOperations = []
                DataSource = srcG
                DynProps = <>
                Flat = True
                FooterParams.Color = clWindow
                GridLineParams.VertEmptySpaceStyle = dessNonEh
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
                ReadOnly = True
                TabOrder = 0
                OnDblClick = dbgGDblClick
                Columns = <
                  item
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'GROUP_NAME'
                    Footers = <>
                    Title.Caption = #1043#1088#1091#1087#1087#1072
                  end
                  item
                    AutoFitColWidth = False
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'LOCKEDOUT'
                    Footers = <>
                    Title.Caption = #1041#1083#1086#1082
                    Width = 29
                  end
                  item
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'NOTICE'
                    Footers = <>
                    Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                  end>
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
            end
          end
        end
        object tsAreas: TTabSheet
          Caption = #1042#1080#1076#1080#1084#1086#1089#1090#1100' '#1091#1095#1072#1089#1090#1082#1086#1074
          ImageIndex = 1
          object pnlAreas: TPanel
            Left = 0
            Top = 24
            Width = 701
            Height = 204
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Splitter2: TSplitter
              Left = 337
              Top = 0
              Height = 204
            end
            object Panel12: TPanel
              Left = 0
              Top = 0
              Width = 337
              Height = 204
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object lbl2: TLabel
                Left = 0
                Top = 0
                Width = 337
                Height = 13
                Align = alTop
                Caption = #1042#1080#1076#1080#1084#1099#1077' '#1091#1095#1072#1089#1090#1082#1080
                ExplicitWidth = 89
              end
              object dbgUG: TDBGridEh
                Left = 0
                Top = 13
                Width = 300
                Height = 191
                Align = alClient
                AllowedOperations = []
                DataSource = srcAU
                DynProps = <>
                Flat = True
                FooterParams.Color = clWindow
                GridLineParams.VertEmptySpaceStyle = dessNonEh
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
                ReadOnly = True
                TabOrder = 0
                OnDblClick = dbgUGDblClick
                Columns = <
                  item
                    AutoFitColWidth = False
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'NAME'
                    Footers = <>
                    Title.Caption = #1059#1095#1072#1089#1090#1086#1082
                    Width = 157
                  end
                  item
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'NOTICE'
                    Footers = <>
                    Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                  end>
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
              object Panel13: TPanel
                Left = 300
                Top = 13
                Width = 37
                Height = 191
                Align = alRight
                BevelInner = bvRaised
                BevelOuter = bvLowered
                TabOrder = 1
                object btnAddArea: TSpeedButton
                  Left = 2
                  Top = 2
                  Width = 33
                  Height = 60
                  Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1102' '#1091#1095#1072#1089#1090#1086#1082
                  Align = alTop
                  Flat = True
                  Glyph.Data = {
                    36030000424D3603000000000000360000002800000010000000100000000100
                    18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3
                    783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    B1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EB3783EB3783EB3
                    783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FB1773EB3783E
                    B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                    3EB3783EB3783EB3783EFF00FFB1773EB3783EB3783EB3783EB3783EB3783EB3
                    783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FFF00FFFF00FF
                    B1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3
                    783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                    FF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00
                    FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                    00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                  OnClick = btnAddAreaClick
                end
                object btnRemoveArea: TSpeedButton
                  Left = 2
                  Top = 129
                  Width = 33
                  Height = 60
                  Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1102' '#1091#1095#1072#1089#1090#1086#1082
                  Align = alBottom
                  Flat = True
                  Glyph.Data = {
                    F6000000424DF600000000000000760000002800000010000000100000000100
                    0400000000008000000000000000000000001000000000000000000000000000
                    8000008000000080800080000000800080008080000080808000C0C0C0000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                    DDDDDDDDDD9999DDDDDDDDDDDDD9999DDDDDDDDDDDDD9999DDDDDDDDDDDDD999
                    9DDDDDDDDDDDDD9999DD999999999999999D9999999999999999999999999999
                    999DDDDDDDDDDD9999DDDDDDDDDDD9999DDDDDDDDDDD9999DDDDDDDDDDD9999D
                    DDDDDDDDDD9999DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
                  OnClick = btnRemoveAreaClick
                end
              end
            end
            object Panel14: TPanel
              Left = 340
              Top = 0
              Width = 361
              Height = 204
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object lbl1: TLabel
                Left = 0
                Top = 0
                Width = 361
                Height = 13
                Align = alTop
                Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1091#1095#1072#1089#1090#1082#1080' '
                ExplicitWidth = 104
              end
              object dbgUGA: TDBGridEh
                Left = 0
                Top = 13
                Width = 361
                Height = 191
                Align = alClient
                AllowedOperations = []
                DataSource = srcA
                DynProps = <>
                Flat = True
                FooterParams.Color = clWindow
                GridLineParams.VertEmptySpaceStyle = dessNonEh
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
                ReadOnly = True
                TabOrder = 0
                OnDblClick = dbgUGADblClick
                Columns = <
                  item
                    AutoFitColWidth = False
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'NAME'
                    Footers = <>
                    Title.Caption = #1059#1095#1072#1089#1090#1086#1082
                    Width = 174
                  end
                  item
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'NOTICE'
                    Footers = <>
                    Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                  end>
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
            end
          end
          object pnl1: TPanel
            Left = 0
            Top = 0
            Width = 701
            Height = 24
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object chkALL_AREAS: TDBCheckBoxEh
              Left = 0
              Top = 0
              Width = 701
              Height = 24
              Align = alClient
              Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1074#1080#1076#1080#1090' '#1074#1089#1077' '#1091#1095#1072#1089#1090#1082#1080
              DataField = 'ALL_AREAS'
              DataSource = srcUsers
              DynProps = <>
              TabOrder = 0
              OnClick = chkALL_AREASClick
              OnExit = chkALL_AREASExit
            end
          end
        end
      end
    end
  end
  object ActionList: TActionList
    Left = 52
    Top = 112
    object actAddGroup: TAction
      Caption = 'actAddGroup'
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 0
      OnExecute = actAddGroupExecute
    end
    object actEditGroup: TAction
      Caption = 'actEditGroup'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 2
      OnExecute = actEditGroupExecute
    end
    object actDelGroup: TAction
      Caption = 'actDelGroup'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      ImageIndex = 1
      OnExecute = actDelGroupExecute
    end
    object AddRights: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1077
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1077' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1077' ('#1087#1088#1072#1074#1086')'
      ImageIndex = 15
    end
    object actRemoveRight: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1077
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1075#1088#1091#1087#1087#1077' '#1088#1072#1079#1088#1077#1096#1077#1085#1080#1077' ('#1087#1088#1072#1074#1086')'
      ImageIndex = 16
    end
    object actAddUSer: TAction
      Caption = 'actAddUSer'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      ImageIndex = 6
      Visible = False
      OnExecute = actAddUSerExecute
    end
    object actEditUser: TAction
      Caption = 'actEditUser'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      ImageIndex = 7
      OnExecute = actEditUserExecute
    end
    object actDelUser: TAction
      Caption = 'actDelUser'
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      ImageIndex = 8
      OnExecute = actDelUserExecute
    end
    object actGrant: TAction
      Caption = #1056#1072#1079#1076#1072#1090#1100' '#1087#1088#1072#1074#1072' '#1085#1072' '#1086#1073#1098#1077#1082#1090#1099
      Hint = #1056#1072#1079#1076#1072#1090#1100' '#1087#1088#1072#1074#1072' '#1085#1072' '#1086#1073#1098#1077#1082#1090#1099
      OnExecute = actGrantExecute
    end
    object actCloneUser: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' Firebird'
      Hint = #1047#1072#1088#1077#1075#1077#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1089#1080#1089#1090#1077#1084#1077' '#1089#1091#1097#1077#1089#1090#1074#1091#1102#1097#1077#1075#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' Firebird'
      ImageIndex = 17
      OnExecute = actCloneUserExecute
    end
    object actUserForWorker: TAction
      Caption = #1057#1086#1079#1076#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1076#1083#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      Hint = #1057#1086#1079#1076#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1076#1083#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      ImageIndex = 6
      OnExecute = actUserForWorkerExecute
    end
  end
  object dsGroups: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SYS$GROUP'
      'SET '
      '    ID = :ID,'
      '    GROUP_NAME = :GROUP_NAME,'
      '    LOCKEDOUT = :LOCKEDOUT,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SYS$GROUP'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SYS$GROUP('
      '    ID,'
      '    GROUP_NAME,'
      '    LOCKEDOUT,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :ID,'
      '    :GROUP_NAME,'
      '    :LOCKEDOUT,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    id'
      '  , group_name'
      '  , lockedout'
      '  , notice'
      '  , (select'
      '         list(u.Ibname, '#39', '#39')'
      '       from Sys$User_Groups ug'
      '            inner join Sys$User u on (ug.User_Id = u.Id)'
      '       where ug.Group_Id = g.Id) USER_LST'
      '  from sys$group g'
      'where'
      '  ID = :OLD_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    id'
      '  , group_name'
      '  , lockedout'
      '  , notice'
      '  , (select'
      '         list(u.Ibname, '#39', '#39')'
      '       from Sys$User_Groups ug'
      '            inner join Sys$User u on (ug.User_Id = u.Id)'
      '       where ug.Group_Id = g.Id) USER_LST'
      '  from sys$group g'
      '  order by group_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 36
    Top = 360
    oFetchAll = True
  end
  object srcGroups: TDataSource
    AutoEdit = False
    DataSet = dsGroups
    Left = 36
    Top = 408
  end
  object srcUsers: TDataSource
    DataSet = dsUsers
    Left = 164
    Top = 96
  end
  object dsUsers: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure worker_iud (2, :worker_id, :surname, :firstnam' +
        'e, :midlename, :phone_no, :notice, :working, :ibname, :lockedout' +
        ', :all_areas)')
    DeleteSQL.Strings = (
      
        'execute procedure worker_iud (3, :worker_id, null, null, null, n' +
        'ull, null, null, :ibname, null, null)')
    InsertSQL.Strings = (
      
        'execute procedure worker_iud (1, :worker_id, :surname, :firstnam' +
        'e, :midlename, :phone_no, :notice, :working, :ibname, :lockedout' +
        ', :all_areas)')
    RefreshSQL.Strings = (
      'select'
      '    u.id'
      '  , u.ibname'
      '  , u.lockedout'
      '  , u.all_areas'
      '  , u.Last_Logged'
      '  , u.Pswd_Changed'
      '  , w.*'
      '  , (select'
      '         list(g.group_name, '#39', '#39')'
      '       from sys$user_groups ug'
      '            inner join sys$group g on (g.id = ug.group_id)'
      '       where ug.user_id = u.id) as groups'
      '  from sys$USER u'
      '       left outer join worker w on (w.ibname = u.ibname)'
      ' WHERE '
      '        U.ID = :OLD_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    u.id'
      '  , u.ibname'
      '  , u.lockedout'
      '  , u.all_areas'
      '  , u.Last_Logged'
      '  , u.Pswd_Changed'
      '  , w.*'
      '  , (select'
      '         list(g.group_name, '#39', '#39')'
      '       from sys$user_groups ug'
      '            inner join sys$group g on (g.id = ug.group_id)'
      '       where ug.user_id = u.id) as groups'
      '  from sys$USER u'
      '       left outer join worker w on (w.ibname = u.ibname)'
      '  order by u.ibname')
    AutoUpdateOptions.UpdateTableName = 'WORKER'
    AutoUpdateOptions.KeyFields = 'WORKER_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoCalcFields = False
    AfterOpen = dsUsersAfterOpen
    OnNewRecord = dsUsersNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 116
    Top = 96
    oFetchAll = True
  end
  object dsGU: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SYS$USER_GROUPS'
      'SET '
      '    GROUP_ID = :GROUP_ID,'
      '    USER_ID = :USER_ID'
      'WHERE'
      '    GROUP_ID = :OLD_GROUP_ID'
      '    and USER_ID = :OLD_USER_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SYS$USER_GROUPS'
      'WHERE'
      '        GROUP_ID = :OLD_GROUP_ID'
      '    and USER_ID = :OLD_USER_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SYS$USER_GROUPS('
      '    GROUP_ID,'
      '    USER_ID'
      ')'
      'VALUES('
      '    :GROUP_ID,'
      '    :USER_ID'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    u.Group_Id, g.group_name, g.lockedout, g.notice, u.User_Id'
      '  from sys$user_groups u'
      '       left outer join sys$group g on (g.id = u.group_id)'
      '  where (     U.GROUP_ID = :OLD_GROUP_ID'
      '    and U.USER_ID = :OLD_USER_ID'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    u.Group_Id, g.group_name, g.lockedout, g.notice, u.User_Id'
      '  from sys$user_groups u'
      '       left outer join sys$group g on (g.id = u.group_id)'
      '  where u.user_id = :ID'
      '  order by g.group_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcUsers
    Left = 483
    Top = 356
    dcForceOpen = True
    oFetchAll = True
  end
  object srcGU: TDataSource
    AutoEdit = False
    DataSet = dsGU
    Left = 516
    Top = 357
  end
  object dsG: TpFIBDataSet
    SelectSQL.Strings = (
      'select g.id, g.group_name, g.lockedout, g.notice'
      'from sys$group g'
      
        'where not exists(select group_id from sys$user_groups where grou' +
        'p_id = g.id  and user_id = :ID)'
      'order by  g.group_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcUsers
    Left = 392
    Top = 356
    dcForceMasterRefresh = True
    dcForceOpen = True
    oFetchAll = True
  end
  object srcG: TDataSource
    AutoEdit = False
    DataSet = dsG
    Left = 424
    Top = 356
  end
  object FormStorage: TFormStorage
    IniSection = 'USER'
    Options = []
    StoredProps.Strings = (
      'Panel1.Width'
      'Panel8.Top')
    StoredValues = <>
    Left = 285
    Top = 174
  end
  object PopupMenu1: TPopupMenu
    Left = 147
    Top = 368
    object N1: TMenuItem
      Action = actGrant
    end
    object N2: TMenuItem
      Caption = #1056#1072#1079#1076#1072#1090#1100' '#1087#1088#1072#1074#1072' '#1085#1072' '#1086#1073#1098#1077#1082#1090#1099' '#1074#1089#1077#1084' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103#1084
      Hint = #1056#1072#1079#1076#1072#1090#1100' '#1087#1088#1072#1074#1072' '#1085#1072' '#1086#1073#1098#1077#1082#1090#1099' '#1074#1089#1077#1084' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103#1084
      OnClick = N2Click
    end
  end
  object ICONS_ACTIVE: TImageList
    Left = 71
    Top = 274
    Bitmap = {
      494C010112001500040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B1773E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D2BEAB00B6814D00B175
      3A00B0723600B1743A00B6804C00D3C1B0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B1773E00B3783E00B1773E0000000000000000000000
      0000000000000000000000000000000000000000000000000000BDD4E3008FC4
      E5006EB8E7005FB3E8005EB3E90079BCE70000000000B3753700B0723600B072
      3600B0723600B0723600B0723600B07236000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B1773E00B3783E00B3783E00B3783E00B1773E00000000000000
      000000000000000000000000000000000000000000005EB3E9005EB3E9005EB3
      E9005EB3E9005EB3E9005EB3E90066B6E80000000000B67D4300B0723600B072
      3600B0723600B0723600B0723600B7824F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B1773E00B3783E00B3783E00B3783E00B3783E00B3783E00B1773E000000
      00000000000000000000000000000000000062B7ED005EB3E9005EB3E9005EB3
      E9005EB3E9005EB3E9005EB3E9005EB3E900B5D1E30000000000B0723600B379
      420000000000B6814D00B0723600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B177
      3E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B177
      3E000000000000000000000000000000000060B7EE005EB3E9005EB3E9005EB3
      E9005EB3E9005EB3E9005EB3E9005EB3E90067B6E80000000000000000000000
      0000C5A280000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B1773E00B378
      3E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B378
      3E00B1773E0000000000000000000000000060B7EE005EB3E9005EB3E9005EB3
      E9005EB3E9005EB3E9005EB3E9005EB3E9005EB3E90000000000D3BCA600B072
      3600B0723600B0723600CCAE9100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B1773E00B3783E00B378
      3E00B3783E0000000000B3783E00B3783E00B3783E0000000000B3783E00B378
      3E00B3783E00B1773E00000000000000000060B7EE005EB3E9005EB3E9005EB3
      E9005EB3E9005EB3E9005EB3E9005EB3E90060B3E80000000000BA7F4400B072
      3600B0723600B0723600B3753700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3783E00B3783E00B378
      3E000000000000000000B3783E00B3783E00B3783E000000000000000000B378
      3E00B3783E00B3783E00000000000000000060B7EE005EB3E9005EB3E9005EB3
      E9005EB3E9005EB3E9005EB3E9005EB3E9005EB3E90000000000C2946500B072
      3600B0723600B0723600BA855100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3783E00B3783E000000
      00000000000000000000B3783E00B3783E00B3783E0000000000000000000000
      0000B3783E00B3783E00000000000000000060B7EE005EB3E9005EB3E9005EB3
      E9005EB3E9005EB3E9005EB3E9005EB3E9005EB3E900A0CAE40000000000B680
      4C00B0723600B379420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3783E00000000000000
      00000000000000000000B3783E00B3783E00B3783E0000000000000000000000
      000000000000B3783E00000000000000000060B7EE005EB3E9005EB3E9005EB3
      E9005EB3E9005EB3E9005DB2E9005EB3E9005EB3E9005FB3E800A8CDE4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B3783E00B3783E00B3783E0000000000000000000000
      00000000000000000000000000000000000060B7EE0057B0E8004FACE70049A9
      E60045A7E50042A6E5004AA8E50042A6E50045A7E50049A9E6004EABE60060B2
      E7007BBDE7000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B3783E00B3783E00B3783E0000000000000000000000
      00000000000000000000000000000000000046AAEA007EC0EC00CDE7F800FEFE
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D1E8F90081C2
      EC0042A6E5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B3783E00B3783E00B3783E0000000000000000000000
      000000000000000000000000000000000000F3FBFF00FEFFFF00A7D5F10074BD
      EB0054AEE60041A5E50043A6E50041A5E50053AEE60074BDEB00A6D5F000FBFD
      FF00F5FAFD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B3783E00B3783E00B3783E0000000000000000000000
      0000000000000000000000000000000000009DD4F50041A5E50052ADE70058B0
      E8005CB2E8005EB3E9005EB3E9005EB3E9005CB2E80058B0E80052ADE70042A5
      E50091CCEF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B3783E00B3783E00B3783E0000000000000000000000
      00000000000000000000000000000000000068B7EA005DB3E9005EB3E9005EB3
      E9005EB3E9005EB3E9005EB3E9005EB3E9005EB3E9005EB3E9005EB3E9005EB3
      E9005FB2E6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B3783F00B3783E00B3783F0000000000000000000000
      00000000000000000000000000000000000000000000000000009EC9E50082BF
      E60071B9E70066B6E80064B5E80066B6E80071B9E70082BFE6009DC9E5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008996D6005C6FD100465CCE00465CCE005D70D1008B97D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A96A2B00CDB59E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B3783F00B3783E00B3783F00000000000000
      0000000000000000000000000000000000000000000000000000000000008895
      D600374FCC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC003850
      CC008E9AD7000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000811E0000811E0000F7AC
      5100831F00000000000000000000000000000000000000000000BDD4E30093C5
      E50000000000CFBAA500AB6B2B00A96A2B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B3783E00B3783E00B3783E00000000000000
      00000000000000000000000000000000000000000000000000006B7CD200334C
      CC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334C
      CC00334CCC007181D30000000000000000000000000000000000000000000000
      0000000000000000000000000000831F000084200000BD4F0300AD450600FFAD
      4300FFB85A00831F0000831F000000000000000000005EB3E9005EB3E9005EB3
      E900A7CCE40000000000A96A2B000000000000000000A96A2B0000000000ACCE
      E400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B3783E00B3783E00B3783E00000000000000
      000000000000000000000000000000000000000000008794D600334CCC00334C
      CC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00354ECC00334C
      CC00334CCC00334CCC008E9AD700000000000000000000000000000000000000
      00000000000000000000000000008C2600009E330000FF921300FF860300E67F
      1700FFA43200FFBB5F00831F00000000000062B7ED005EB3E9005EB3E9005EB3
      E9006CB8E800000000000000000000000000AB6B2B00AC6F3100A96A2B000000
      0000ADCEE4000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B3783E00B3783E00B3783E00000000000000
      00000000000000000000000000000000000000000000374FCC00334CCC00334C
      CC007586DC00FFFFFF003D55CE00334CCC00334CCC003E56CE00FFFFFF008594
      E000334CCC00334CCC003951CC00000000000000000000000000000000000000
      0000000000000000000000000000912900009A300000FFA43200F7880F00821F
      000089240100FFB14900D58238000000000060B7EE005EB3E9005EB3E9005EB3
      E9005EB3E90078BCE70000000000A96A2B00AD713400AB6B2B00AC6F3100A96A
      2B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B3783E00B3783E00B3783E00000000000000
      0000000000000000000000000000000000008693D600334CCC00334CCC00344D
      CC00FFFFFF00FFFFFF00FFFFFF003D55CE003E56CE00FFFFFF00FFFFFF00FFFF
      FF00364FCC00334CCC00334CCC008D99D6000000000000000000000000000000
      0000004B8200004B82005E2D1500A94D1900FFD9A100FFCA80009A3000004C00
      0000690E0000FF9C2300FFA73700831F000060B7EE005EB3E9005EB3E9005EB3
      E9005EB3E9005EB3E90079BCE70000000000A96A2B00AD713400AB6B2B00AC6F
      3100A96A2B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B3783E00B3783E00B3783E00000000000000
      000000000000000000000000000000000000576BD000334CCC00334CCC00334C
      CC004159CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004058
      CF00334CCC00334CCC00334CCC005E71D100000000000000000000000000004B
      8200004B82006FDCF800035F9600B5440000AD5A2C00FFD89E009A300000680D
      0000962D0000FF921300FF9D2500811E000060B7EE005EB3E9005EB3E9005EB3
      E9005EB3E9005EB3E9005EB3E90079BCE70000000000A96A2B00AD713400AB6B
      2B00AC6F3100A96A2B0000000000000000000000000000000000B3783E000000
      0000000000000000000000000000B3783E00B3783E00B3783E00000000000000
      00000000000000000000B3783E00000000004158CD00334CCC00334CCC00334C
      CC00334CCC004159CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004058CF00334C
      CC00334CCC00334CCC00334CCC00485ECE000000000000589000046799000FC7
      FE0021CEFE004CD9FE0065E0FF009AEBFF00035F9600FFD9A100FFD9A100FFC4
      7300FFAF4600FF880600831F00000000000060B7EE005EB3E9005EB3E9005EB3
      E9005EB3E9005EB3E9005EB3E9005EB3E90079BCE70000000000A96A2B00AD71
      3400AB6B2B00AC6F310000000000000000000000000000000000B3783E00B378
      3E00000000000000000000000000B3783E00B3783E00B3783E00000000000000
      000000000000B3783E00B3783E00000000004057CD00334CCC00334CCC00334C
      CC00334CCC003E56CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF003D55CE00334C
      CC00334CCC00334CCC00334CCC00475DCE0000000000005B93000364980011C7
      FE0011C7FE0037D4FE004ED9FE0081E6FF00035F9600FFD9A100FFD9A100FFD5
      9800FFC26E00FF991E00831F00000000000060B7EE005EB3E9005EB3E9005EB3
      E9005EB3E9005EB3E9005EB3E9005EB3E9005EB3E90079BCE70000000000A96A
      2B00AD7134000000000000000000A96A2B000000000000000000B3783E00B378
      3E00B3783E000000000000000000B3783E00B3783E00B3783E00000000000000
      0000B3783E00B3783E00B3783E00000000005569D000334CCC00334CCC00334C
      CC003E56CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003D55
      CE00334CCC00334CCC00334CCC005B6FD000004B82000B76A60062B8D50052DA
      FF00004B8200004B8200004B820053DAFF005AD0F0005B2D1800EE730000FFD9
      A100831F000000000000000000000000000060B7EE005EB3E9005EB3E9005EB3
      E9005EB3E9005EB3E9005DB2E9005EB3E9005EB3E9005EB3E90079BCE7000000
      00000000000000000000A96A2B00A96A2B000000000000000000B1773E00B378
      3E00B3783E00B3783E0000000000B3783E00B3783E00B3783E0000000000B378
      3E00B3783E00B3783E00B1773E0000000000828FD500334CCC00334CCC00344D
      CC00FFFFFF00FFFFFF00FFFFFF004158CF004158CF00FFFFFF00FFFFFF00FFFF
      FF00354DCC00334CCC00334CCC008895D600004B820069BAD500BAF2FF007BE5
      FF00004B820000518900004B82003ED5FE0055DCFF00035F96008C2600009536
      0F000000000000000000000000000000000060B7EE0057B0E8004FACE70049A9
      E60045A7E50042A6E5004AA8E50042A6E50045A7E50049A9E6004EABE60075BA
      E60000000000A96A2B00A96A2B00D3C2B200000000000000000000000000B177
      3E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B378
      3E00B3783E00B1773E00000000000000000000000000354DCC00334CCC00334C
      CC007A8ADD00FFFFFF004158CF00334CCC00334CCC004158CF00FFFFFF008291
      DF00334CCC00334CCC00374FCC000000000000000000038BC5000C7EAD00BAF2
      FF0083D3EA00036A9D000D8BBC0018CAFE001AA6D50000000000000000000000
      00000000000000000000000000000000000046AAEA007EC0EC00CDE7F800FEFE
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D1E8F90081C2
      EC005CAFE4000000000000000000000000000000000000000000000000000000
      0000B1773E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B378
      3E00B1773E0000000000000000000000000000000000808ED500334CCC00334C
      CC00334CCC00354DCC00334CCC00334CCC00334CCC00334CCC00364ECC00334C
      CC00334CCC00334CCC008693D6000000000000000000004B82000593C900BAF2
      FF00B8F2FF006EE1FF0042D7FE000CC6FE00004B820000000000000000000000
      000000000000000000000000000000000000F3FBFF00FEFFFF00A7D5F10074BD
      EB0054AEE60041A5E50043A6E50041A5E50053AEE60074BDEB00A6D5F000FBFD
      FF00F5FAFD000000000000000000000000000000000000000000000000000000
      000000000000B1773E00B3783E00B3783E00B3783E00B3783E00B3783E00B177
      3E000000000000000000000000000000000000000000000000006274D100334C
      CC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334C
      CC00334CCC006879D200000000000000000000000000027DB600004B82003099
      C1003A9DC100B7F2FF006AC6E300004B82000979AA0000000000000000000000
      0000000000000000000000000000000000009DD4F50041A5E50052ADE70058B0
      E8005CB2E8005EB3E9005EB3E9005EB3E9005CB2E80058B0E80052ADE70042A5
      E50091CCEF000000000000000000000000000000000000000000000000000000
      00000000000000000000B1773E00B3783E00B3783E00B3783E00B1773E000000
      0000000000000000000000000000000000000000000000000000000000007C8B
      D400344DCC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00354D
      CC00818FD500000000000000000000000000000000000000000000000000005C
      950006A9E100ABE9F800004B8200000000000000000000000000000000000000
      00000000000000000000000000000000000068B7EA005DB3E9005EB3E9005EB3
      E9005EB3E9005EB3E9005EB3E9005EB3E9005EB3E9005EB3E9005EB3E9005EB3
      E9005FB2E6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B1773E00B3783E00B1773E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007D8BD4004F64CF003A52CC003B53CC005165CF00808ED5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009EC9E50082BF
      E60071B9E70066B6E80064B5E80066B6E80071B9E70082BFE6009DC9E5000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1773E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DFBCAD00CCB6AD00C4ABA200D5B2A400000000000000
      0000000000000000000000000000000000000000000095959500696969006969
      6900696969006969690069696900696969006969690069696900696969006969
      6900696969006969690094949400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C5A38200BA8A
      5B00B37B4400B0743900AF713500D4C4B4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E1BCAC00D9CDCA00C7CACE00B2B0B400B3A39D00E1BCAC000000
      0000000000000000000000000000000000000000000069696900FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0069696900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEB39900AE703400AF713400AF71
      3400AF713400AF713400AF73370000000000314ACC00314ACC00314ACC00314A
      CC00314ACC00314ACC00314ACC00314ACC000000000000000000000000000000
      0000E1C0AF00E8DCD900E3E5E800D0A79600C49B8A00B4AFB100B4A49F00D4B2
      A300000000000000000000000000000000000000000069696900FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0069696900000000000000000000000000000000000000
      0000000000000000000082AA4A00000000000000000000000000000000000000
      000000000000000000000000000000000000B2733400AE703400AF713400AF71
      3400AF713400AF713400AF73370000000000314ACC00314ACC00314ACC00314A
      CC00314ACC00314ACC00314ACC00314ACC00000000000000000000000000E1BC
      AC00EFE6E200F5FEFF00D3957800BA3C0800BC3D0A00C27F6300B6B3B600B2A1
      9E00E1BCAC000000000000000000000000000000000069696900FEFEFE00FFFF
      FF005A5A5A005A5A5A00FFFFFF009D9D9D009D9D9D009D9D9D009D9D9D009999
      9900FFFFFF00FFFFFF0069696900000000000000000000000000000000000000
      00000000000082AA4A0082AA4A0082AA4A000000000000000000000000000000
      000000000000000000000000000000000000B4773B00AE703400AF713400AF71
      3400AF713400AF713400AF713400D3C2B2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E1BCAC00F3E8
      E200FEFFFF00D99E8400C55C2E00E5B39A00E5B29900C85D2E00C1795A00B5B2
      B600B2A29E00D3B1A20000000000000000000000000069696900FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0069696900000000000000000000000000000000000000
      000082AA4A0082AA4A0082AA4A0082AA4A0082AA4A0000000000000000000000
      000000000000000000000000000000000000C8A48000AE703300AF713400AF71
      3400AF713400AF72360000000000B1773E00AF713400AF713400AF713400AE70
      3400C5A3810000000000000000000000000000000000E1BCAC00F5E9E500FFFF
      FF00DFA58B00BA421000BF502000F8EBE400F7E8E000BF502000BE461300C27C
      5E00B6B2B500B2A19E00E1BCAC00000000000000000069696900FEFEFE00FFFF
      FF005A5A5A005A5A5A00FFFFFF009D9D9D009D9D9D009D9D9D009D9D9D009999
      9900FFFFFF00FFFFFF00696969000000000000000000000000000000000082AA
      4A0082AA4A0082AA4A0082AA4A0082AA4A0082AA4A0082AA4A00000000000000
      00000000000000000000000000000000000000000000AE703300AF713400AF71
      3400AF713400000000000000000000000000AF713400AF713400AF713400AE70
      330000000000000000000000000000000000E1BCAB00F5E8E300FFFFFF00E8B9
      9F00C4552000C14F1F00C0501F00F5E1D800F4DED400BF4C1D00BE4A1B00BF46
      1300C1795A00B4ADB000AE9F9C00D4B2A2000000000069696900FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006969690000000000000000000000000082AA4A0082AA
      4A0082AA4A0082AA4A0082AA4A0082AA4A0082AA4A0082AA4A0082AA4A000000
      0000000000000000000000000000000000000000000000000000AE703400AF71
      34000000000000000000000000000000000000000000AF713400AF7134000000
      000000000000000000000000000000000000E7C9BC00FFFFFF00F6E2D200D378
      3E00CE6F3800CA653000C65C2A00F6E4DA00F4DFD500BF4D1E00BE4B1C00BF4E
      1E00BF441200C4978400B3B2B500C2AAA2000000000069696900FEFEFE00FFFF
      FF005A5A5A005A5A5A00FFFFFF009D9D9D009D9D9D009D9D9D009D9D9D009999
      9900FFFFFF00FFFFFF0069696900000000000000000082AA4A0082AA4A0082AA
      4A0082AA4A0082AA4A000000000082AA4A0082AA4A0082AA4A0082AA4A0082AA
      4A00000000000000000000000000000000000000000000000000000000000000
      000000000000C7A78800C1916200C5A382000000000000000000000000000000
      000000000000000000000000000000000000E7C9BC00FFFFFF00F8E6D700DD8F
      5000D8834800D3784000CE6F3800F8EAE100F5E3D900C0512000BE4B1B00BE4B
      1C00BD471500D0AC9E00C8CACE00CFB6AD000000000069696900FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006969690000000000000000000000000082AA4A0082AA
      4A0082AA4A0000000000000000000000000082AA4A0082AA4A0082AA4A0082AA
      4A0082AA4A000000000000000000000000000000000000000000000000000000
      0000AE703400AF713400AE703300AF713400AF71340000000000000000000000
      000000000000000000000000000000000000E1BCAB00F5E8E200FFFFFF00F3D7
      BA00DF955500D9894A00DD946100F5DECD00EDC9B300C8602D00C1511F00BC46
      1400D69F8700E3E8EB00DACBC600DFBAA9000000000069696900FEFEFE00FFFF
      FF005A5A5A005A5A5A00FFFFFF009D9D9D009D9D9D009D9D9D009D9D9D009999
      9900FFFFFF00FFFFFF00696969000000000000000000000000000000000082AA
      4A00000000000000000000000000000000000000000082AA4A0082AA4A0082AA
      4A0082AA4A0082AA4A000000000000000000000000000000000000000000AF72
      3700AF713400AF713400AF713400AF713400AF713400AE703300000000000000
      00000000000000000000000000000000000000000000E1BCAC00F3E5DF00FFFF
      FF00F6DEC300E4A16000DF965800E1A07000DB926300CE6F3700CA622B00E0AF
      9700F4FEFF00E7DAD500E1BCAC00000000000000000069696900FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0069696900000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000082AA4A0082AA
      4A0082AA4A0082AA4A0082AA4A0000000000000000000000000000000000AD70
      3300AF713400AF713400AF713400AF713400AF713400AE703300000000000000
      0000000000000000000000000000000000000000000000000000E0BAA900F2E5
      DE00FFFFFF00F8E0C600E7A86500FBEFE300F9E7DB00D57E4000E8B79A00FEFF
      FF00EEE4E000E0BCAC0000000000000000000000000069696900FDFDFD00FFFF
      FF005A5A5A005A5A5A00FFFFFF009D9D9D009D9D9D009D9D9D009D9D9D009999
      9900FFFFFF00FFFFFF0069696900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000082AA
      4A0082AA4A0082AA4A000000000000000000000000000000000000000000AD70
      3300AF713400AF713400AF713400AF713400AF713400AE703300000000000000
      000000000000000000000000000000000000000000000000000000000000E1BC
      AC00F2E3DB00FFFFFF00F8E4CA00F4D2A500EFC19200F0CBA900FFFFFF00F4E9
      E300E1BCAC000000000000000000000000000000000069696900FDFDFD00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0069696900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000082AA4A00000000000000000000000000000000000000000000000000AD6F
      3300AF713400AF713400AF713400AF713400AF713400AE703300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E0B9A700F2E2DB00FFFFFF00FBEFDD00F8E7D300FFFFFF00F7EBE600E1BF
      AE000000000000000000000000000000000000000000B2783E00B3783E00B378
      3E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B378
      3E00B3783E00B3783E00B3783E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AE703300AF713400AF713400AF713400AF71340000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E1BCAC00F2E2DA00FFFFFF00FFFFFF00F6ECE700E1BCAC000000
      00000000000000000000000000000000000000000000B3783E00B3783E00B378
      3E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B378
      3E00B3783E00B3783E00B3783E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BF956C00B6824E00BE9268000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E1BCAB00E7C9BC00E7C9BC00E1BCAB00000000000000
      00000000000000000000000000000000000000000000B57D4600B3783E00B378
      3E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B378
      3E00B3783E00B3783E00B47C4500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C39D7700B8855300B3794100B1743900B1753900B47B4300B9885700C5A2
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000085AD
      4C0085AD4B000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C8AA8E00B6825000AA67
      2700B6825000C8AA8E0000000000000000000000000000000000CBAE9100B072
      3500B0723500B0723500B0723500B0723500B0723500B0723500B0723500B072
      3500B0723500D4C2B10000000000000000000000000000000000000000000000
      0000824B4B00824B4B00A64B4B00A94D4D004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000C5A38200BA8A
      5B00B37B4400B0743900AF713500B0743900B37B4400BA8A5A000000000085AD
      4C0085AD4B000000000000000000000000000000000000000000C5A38200BA8A
      5B00B37B4400B0743900B989590000000000BC8F6500AA672700AA672700CCA4
      7D00AA672700AA672700BC8F6500000000000000000000000000B1733500B072
      3500B0723500B0723500B0723500B0723500B0723500B0723500B0723500B072
      3500B0723500BA87550000000000000000000000000000000000824B4B00824B
      4B00B64F5000C24F5000C54D4E00B24D4E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B0000000000CEB39900AE703400AF713400AF71
      3400AF713400AF713400AF713400D3C2B20000000000000000000000000085AD
      4C0085AD4B00000000000000000000000000CEB39900AE703400AF713400AF71
      3400AF713400AF71340000000000C8AA8E00AA672700AA672700CCA47D00FFFF
      FF00CCA47D00AA672700AA672700C8AA8E000000000000000000B2733500B072
      3500B0723500B0723500B0723500B0723500B0723500B0723500B0723500B072
      3500B0723500BA87550000000000000000000000000000000000824B4B00D458
      5900CB555600C9545500C9525300B74F52004E1E1F00FE8B8C00FB9A9C00F8AA
      AB00F7B5B600F7B5B600824B4B0000000000B2733400AE703400AF713400AF71
      3400AF713400AF713400AF7337000000000085AD4B0085AD4B0085AD4B0085AD
      4B0085AD4B0085AD4B0085AD4B0085AD4B00B2733400AE703400AF713400AF71
      3400AF713400AF71340000000000B6825000AA672700AA672700CCA47D00FFFF
      FF00CCA47D00AA672700AA672700B68250000000000000000000B9844F00B072
      3500B0723500B0723500B0723500B0723500B0723500B0723500B0723500B072
      3500B0723400C39B740000000000000000000000000000000000824B4B00D75C
      5D00D05A5B00CF595A00CF575800BD5356004E1E1F0023B54A0013C1480016BD
      48000CBC4100F7B5B600824B4B0000000000B4773B00AE703400AF713400AF71
      3400AF713400AF713400AF7337000000000085AD4B0085AD4B0085AD4B0085AD
      4B0085AD4B0085AD4B0085AD4B0085AD4B00B4773B00AE703400AF713400AF71
      3400AF713400AF71340000000000AA672700AA672700AA672700CCA47D00FFFF
      FF00CCA47D00AA672700AA672700AA6727000000000000000000C7B39E00B172
      3300B0723500B0723500B07235000000000000000000B0723500B0723500B072
      3500B2723200CABEB10000000000000000000000000000000000824B4B00DD63
      6400D75F6000D55E5F00D55C5D00C2575A004E1E1F002AB44D001CBF4C001EBC
      4C0013BC4500F7B5B600824B4B0000000000C8A48000AE703300AF713400AF71
      3400AF713400AF72360000000000D4C4B50000000000000000000000000085AD
      4C0085AD4B00000000000000000000000000C8A48000AE703300AF713400AF71
      3400AF713400AF72360000000000B6825000AA672700AA672700AA672700CCA4
      7D00AA672700AA672700AA672700B68250008D8D8D00797B7C0000000000B880
      4700B0723400B0723500000000000000000000000000CEB69E00B0723500B172
      3400BF9A7300000000007A7B7C00979797000000000000000000824B4B00E368
      6900DD656600DA636400DE666700C6595B004E1E1F0026B1490016BC48001BBB
      490010BB4300F7B5B600824B4B000000000000000000AE703300AF713400AF71
      3400AF713400000000000000000000000000AF713400AF7134000000000085AD
      4C0085AD4B0000000000000000000000000000000000AE703300AF713400AF71
      3400AF7134000000000000000000C8AA8E00AA672700AA672700CCA47D00FFFF
      FF00CCA47D00B77F4A00AA672700C8AA8E0084848400838383007C7F7F000000
      0000B7834E00CAB0950000000000000000000000000000000000C29D7600BD94
      6900000000007B7D7E00828282008D8D8D000000000000000000824B4B00EB6D
      6E00E2676800E67E7F00FAD3D400CC6E70004E1E1F00A5D8970050D16F0042C9
      66002DC75800F7B5B600824B4B00000000000000000000000000AE703400AF71
      34000000000000000000000000000000000000000000AF7134000000000085AD
      4C0085AD4B000000000000000000000000000000000000000000AE703400AF71
      340000000000000000000000000000000000BC8F6500AA672700AA672700CCA4
      7D00AA672700AA672700BC8F6500000000009A9A9A00818181007D7D7D00A3A5
      A5000000000000000000C0997100B0723500B0723500C4A17D00000000000000
      00009C9D9E007F7F7F0080808000A4A4A4000000000000000000824B4B00F273
      7400E96C6D00EB818200FCD1D300CF6E70004E1E1F00FFF2CC00FFFFD700FFFF
      D400E6FCC700F7B5B600824B4B00000000000000000000000000000000000000
      000000000000C7A78800C1916200C5A382000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C7A78800C19162000000000000000000C8AA8E00B6825000AA67
      2700B6825000C8AA8E000000000000000000000000007A7A7A00A1A1A1000000
      000000000000B5804A00B0723400B0723500B0723500B0723400BA8D60000000
      000000000000979898007E7E7E00000000000000000000000000824B4B00F878
      7900F0757600EE727300F0737400D16566004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD700F7B5B600824B4B00000000000000000000000000000000000000
      0000AE703400AF713400AE703300AF713400AF71340000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AE703400AF713400AE703300AF713400B988570000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009EA1
      A20000000000B1723300B0723500B0723500B0723500B0723500B27233000000
      0000A0A2A2000000000000000000000000000000000000000000824B4B00FE7F
      8000F77A7B00F6797A00F7777900D76B6B004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B0000000000000000000000000000000000AF72
      3700AF713400AF713400AF713400AF713400AF713400AE703300000000000000
      000000000000000000000000000000000000000000000000000000000000AF72
      3700AF713400AF713400AF713400AF713400AF713400AE703300000000000000
      00000000000000000000000000000000000000000000000000007C7C7C008386
      8A00CDBCAB00B1723400B0723500B0723500B0723500B0723500B1723300D0C4
      B8007A7D80007F7F7F0000000000000000000000000000000000824B4B00FF83
      8400FC7F8000FB7E7F00FE7F8000DA6E6F004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B0000000000000000000000000000000000AD70
      3300AF713400AF713400AF713400AF713400AF713400AE703300000000000000
      000000000000000000000000000000000000000000000000000000000000AD70
      3300AF713400AF713400AF713400AF713400AF713400AE703300000000000000
      00000000000000000000000000000000000000000000B8B8B8007E7E7E008689
      8B00CDBDAD00B1723400B0723500B0723500B0723500B0723500B17233000000
      00007E8184007E7E7E00BFBFBF00000000000000000000000000824B4B00FF88
      8900FF828300FF818200FF828300E07374004E1E1F00FCEFC700FFFFD500FFFF
      D300FFFFD500F7B5B600824B4B0000000000000000000000000000000000AD70
      3300AF713400AF713400AF713400AF713400AF713400AE703300000000000000
      000000000000000000000000000000000000000000000000000000000000AD70
      3300AF713400AF713400AF713400AF713400AF713400AE703300000000000000
      00000000000000000000000000000000000000000000BFBFBF007D7D7D007D7F
      810000000000B2723200B0723500B0723500B0723500B0723500B27232000000
      00007D7F81007C7C7C00C5C5C500000000000000000000000000824B4B00824B
      4B00E2757600FE818200FF868700E57677004E1E1F00FAEBC500FCFBD100FCFB
      CF00FCFBD100F7B5B600824B4B0000000000000000000000000000000000AD6F
      3300AF713400AF713400AF713400AF713400AF713400AE703300000000000000
      000000000000000000000000000000000000000000000000000000000000AD6F
      3300AF713400AF713400AF713400AF713400AF713400AE703300000000000000
      00000000000000000000000000000000000000000000000000008B8B8B007879
      7900ADABA900B9895800B0723400B0723500B0723500B0723400BE987000A6A4
      A200787979009191910000000000000000000000000000000000000000000000
      0000824B4B009C565700CB6C6D00CF6E6E004E1E1F00824B4B00824B4B00824B
      4B00824B4B00824B4B00824B4B00000000000000000000000000000000000000
      0000AE703300AF713400AF713400AF713400AF71340000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AE703300AF713400AF713400AF713400AF71340000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C7A58400B57E4700B67F4A00CAAD9000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000824B4B00824B4B004E1E1F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BF956C00B6824E00BE9268000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BF956C00B6824E00BE9268000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000777777008D8D
      8D0000000000A96A2B00CDB59E000000000000000000A3A3A300636363006363
      6300636363007777770000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000089AD560089AD560089AD560089AD5600000000000000
      0000000000000000000000000000000000000000000000000000000000008C98
      D600000000000000000000000000000000000000000000000000000000000000
      00008390D500000000000000000000000000000000000000000066666600FDFD
      FD0000000000CFBAA500AB6B2B00A96A2B000000000000000000EDEDED00FEFE
      FE00FFFFFF006666660000000000000000000000000000000000006601000066
      0100006601002B5E17002B5E1700000000000000000000669A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000089AD560089AD560089AD560089AD5600000000000000
      00000000000000000000000000000000000000000000000000008693D600334C
      CC003D54CD00000000000000000000000000000000000000000000000000465C
      CE00334CCC007584D3000000000000000000777777000000000066666600FFFF
      FF00EEEEEE0000000000A96A2B000000000000000000A96A2B0000000000EDED
      ED00FEFEFE00666666000000000000000000000000000066010005A60D0005AD
      0A00006601000190080000669A000058000000669A0038B9FA0000669A000000
      000000669A000000000000000000000000000000000000000000000000000000
      0000000000000000000089AD560089AD560089AD560089AD5600000000000000
      00000000000000000000000000000000000000000000909CD700334CCC00334C
      CC00334CCC003D54CD0000000000000000000000000000000000465CCE00334C
      CC00334CCC00334CCC00808ED50000000000666666000000000066666600FFFF
      FF00FBFBFB00000000000000000000000000AB6B2B00AC6F3100A96A2B000000
      0000EDEDED00666666000000000000000000000000000066010011B121000FB1
      1F000066010000669A0037C5D50000669A0000669A0038B9FA0000669A000066
      9A0062C4DD0000669A0000000000000000000000000000000000000000000000
      0000000000000000000089AD560089AD560089AD560089AD5600000000000000
      0000000000000000000000000000000000000000000000000000445ACE00334C
      CC00334CCC00334CCC003D54CD000000000000000000465CCE00334CCC00334C
      CC00334CCC004057CD000000000000000000666666000000000066666600FFFF
      FF00FFFFFF00F8F8F80000000000A96A2B00AD713400AB6B2B00AC6F3100A96A
      2B0000000000AFAFAF00000000000000000000000000006601001BBA35001BBB
      3500006601002AA36D0000669A0038D2F70018C5F10021BBF80030B2E30049BE
      DE0000669A000000000000000000000000000000000000000000000000000000
      0000000000000000000089AD560089AD560089AD560089AD5600000000000000
      000000000000000000000000000000000000000000000000000000000000445A
      CE00334CCC00334CCC00334CCC003D54CD00455BCE00334CCC00334CCC00334C
      CC004057CD00000000000000000000000000666666000000000066666600FFFF
      FF00FFFFFF00FFFFFF00F8F8F80000000000A96A2B00AD713400AB6B2B00AC6F
      3100A96A2B00000000000000000000000000000000000066010024C2480023C6
      48000066010000669A0000669A006DE5FF0024C7DE0000669A0021A8C2003ABA
      EC0000669A0000669A000000000000000000000000008BAE5A0089AD560089AD
      560089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
      560089AD560089AD560089AD5600000000000000000000000000000000000000
      0000445ACE00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC004057
      CD0000000000000000000000000000000000666666000000000066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F8F8F80000000000A96A2B00AD713400AB6B
      2B00AC6F3100A96A2B00000000000000000000000000006601002ECE5C001FBE
      450000669A00BBE5F300B9EEF50086E0F80000669A001884300000669A0022AB
      D00036B6E9004FC1E50000669A0000000000000000008BAE5A0089AD560089AD
      560089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
      560089AD560089AD560089AD5600000000000000000000000000000000000000
      000000000000445ACE00334CCC00334CCC00334CCC00334CCC004057CD000000
      000000000000000000000000000000000000666666000000000066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F80000000000A96A2B00AD71
      3400AB6B2B00AC6F31000000000000000000000000000066010037D76D0030D0
      63000066010000669A0000669A00B2EDFD00B2EDFD0000669A001BBCE5001BBC
      E50000669A0000669A000000000000000000000000008BAE5A0089AD560089AD
      560089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
      560089AD560089AD560089AD5600000000000000000000000000000000000000
      000000000000465CCE00334CCC00334CCC00334CCC00334CCC003D54CD000000
      000000000000000000000000000000000000666666000000000066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F80000000000A96A
      2B00AD7134000000000000000000A96A2B00000000000066010041E17C0042E3
      7F00006601001DAF530000669A00DFFCFF00B0EAF50060C9C90045D1EB0023DC
      FF0000669A00000000000000000000000000000000008DAF5D008BAE59008BAE
      59008BAE59008BAE590089AD560089AD560089AD560089AD56008BAE59008BAE
      59008BAE59008BAE59008BAE5900000000000000000000000000000000000000
      0000465CCE00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC003D54
      CD0000000000000000000000000000000000666666000000000066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007F7F7F007D7D7D000000
      00000000000000000000A96A2B00A96A2B0000000000006601004AEA86004BEC
      8A000066010000669A00D2F3FF0000669A0000669A00B5F4FF0000669A000066
      9A001ED2FB0000669A0000000000000000000000000000000000000000000000
      0000000000000000000089AD560089AD560089AD560089AD5600000000000000
      000000000000000000000000000000000000000000000000000000000000465C
      CE00334CCC00334CCC00334CCC004057CD00445ACE00334CCC00334CCC00334C
      CC003D54CD00000000000000000000000000666666000000000066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0064646400FDFDFD00F8F8
      F80000000000A96A2B00A96A2B00D3C2B200000000000066010055F48D0056F7
      92000066010049C2800000669A003DD0820000669A00D7F1FF0000669A000066
      010000669A000000000000000000000000000000000000000000000000000000
      0000000000000000000089AD560089AD560089AD560089AD5600000000000000
      0000000000000000000000000000000000000000000000000000465CCE00334C
      CC00334CCC00334CCC004057CD000000000000000000445ACE00334CCC00334C
      CC00334CCC003D54CD000000000000000000666666000000000066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0064646400FDFDFD00B1B1
      B10082828200000000000000000000000000000000000066010062FF9E0062FF
      A2000066010048D4740058FC930052F4860058DE990000669A0062E4AB000066
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000089AD560089AD560089AD560089AD5600000000000000
      00000000000000000000000000000000000000000000ABB2DA00364ECC00334C
      CC00334CCC004057CD0000000000000000000000000000000000445ACE00334C
      CC00334CCC00354DCC00A4ACD90000000000666666000000000066666600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0066666600AFAFAF006D6D
      6D0000000000000000000000000000000000000000000066010053E987003EB5
      5700006601000066010034C6590046E3790058F991005CFE98005CFE98000066
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000089AD560089AD560089AD560089AD5600000000000000
      0000000000000000000000000000000000000000000000000000A7AFDA00364E
      CC004057CD00000000000000000000000000000000000000000000000000445A
      CE00354DCC00A2ABD90000000000000000006666660000000000777777006363
      6300636363006363630063636300636363006363630063636300707070000000
      0000000000000000000000000000000000000000000000660100006601007E79
      5C00D8C5C100D8DBCE000066010000660100006601005CFE98005DF893000066
      0100000000000000000000000000000000000000000000000000000000000000
      000000000000000000008FB160008FB160008FB160008FB16000000000000000
      000000000000000000000000000000000000000000000000000000000000A9B1
      DA00000000000000000000000000000000000000000000000000000000000000
      0000A6AED9000000000000000000000000006666660000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000175F
      0B002B5E17002B5E17007E795C00C6A4A100C6A4A10000660100006601000066
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007777770063636300636363006363
      6300636363006363630063636300636363007070700000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000660100006601000066010000660100000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF00FEFFFF8000000000FC7FC08000000000
      F83F808000000000F01F004900000000E00F007700000000C007004100000000
      84430041000000008C630041000000009C73002300000000BC7B001F00000000
      FC7F000700000000FC7F000700000000FC7F000700000000FC7F000700000000
      FC7F000700000000FC7FC01F00000000F81FFFFFF9FFFE3FE007FF87C8FFFE3F
      C003FE0185AFFE3F8001FE010717FE3F8001FE01020FFE3F0000F0000107FE3F
      0000E0000083DE3D000080010043CE39000080010026C63100000007001CC221
      0000000F0008E0038001807F0007F0078001807F0007F80FC003807F0007FC1F
      E007E1FF0007FE3FF81FFFFFC01FFF7FFFFFFC3F8001FFFFC0FFF81F8001FFFF
      0100F00F8001FDFF0100E0078001F8FF00FFC0038001F07F020780018001E03F
      870F00008001C01FCF9F00008001820FF8FF00008001C707F07F00008001EF83
      E03F80018001FFC1E03FC0038001FFE3E03FE0078001FFF7E03FF00F8001FFFF
      F07FF81F8001FFFFF8FFFC3F8001FFFFF00FFE7FFFE7FF83C003F07FC027C101
      C003C00100E70200C003C00101000200C003C00101000200C183C00102E70200
      2384C0018727860013C8C001CFA7CF010C30C001F8FFF9839819C001F07FF07F
      E817C001E03FE03FC003C001E03FE03F8011C001E03FE03F8811C001E03FE03F
      C003F001F07FF07FFC3FFC7FF8FFF8FFFFFFFFFFC983FFFFFC3FEFF7C8C3C1BF
      FC3FC7E345A38017FC3F83C147138003FC3FC183420B8007FC3FE00741078003
      8001F00F408380018001F81F404380038001F81F402680078001F00F401C8003
      FC3FE00740088007FC3FC1834007800FFC3F83C1400F800FFC3FC7E3401F800F
      FC3FEFF77FFFE00FFFFFFFFF007FFC3F00000000000000000000000000000000
      000000000000}
  end
  object srcAU: TDataSource
    AutoEdit = False
    DataSet = dsAU
    Left = 422
    Top = 411
  end
  object dsAU: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    u.id, u.user_id, A.wa_id, A.name, A.notice'
      'from sys$user_areas u'
      '   inner join WORKAREA a on (u.area_id = a.wa_id)'
      'where u.user_id = :ID'
      'order by a.name'
      '')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcUsers
    Left = 390
    Top = 411
    dcForceOpen = True
    oFetchAll = True
  end
  object dsA: TpFIBDataSet
    SelectSQL.Strings = (
      'select A.wa_id, A.name, A.notice'
      'from WORKAREA A'
      
        'where not exists(select area_id from sys$user_areas where area_i' +
        'd = A.wa_id  and user_id = :ID)'
      'order by a.name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcUsers
    Left = 483
    Top = 410
    dcForceMasterRefresh = True
    dcForceOpen = True
    oFetchAll = True
  end
  object srcA: TDataSource
    AutoEdit = False
    DataSet = dsA
    Left = 514
    Top = 410
  end
  object fSecurity: TpFIBSecurityService
    SecurityAction = ActionAddUser
    UserID = 0
    GroupID = 0
    Left = 94
    Top = 162
  end
  object qModify: TpFIBQuery
    Transaction = trWriteQ
    Database = dmMain.dbTV
    GoToFirstRecordOnExecute = False
    Left = 388
    Top = 160
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object dsReports: TpFIBDataSet
    UpdateSQL.Strings = (
      'execute block ('
      '    GROUP_ID  integer = :GROUP_ID,'
      '    REPORT_ID integer = :id_report,'
      '    rALLOWED  integer = :rALLOWED)'
      'as'
      'begin'
      
        '  if ((not(rALLOWED is null)) and (not(GROUP_ID is null)) and (n' +
        'ot(REPORT_ID is null))) then begin'
      '    if (rALLOWED = 1) then begin'
      
        '      insert into Sys$Group_Rights (Group_Id, Rights_Type, Right' +
        '_Id)'
      '      values (:GROUP_ID, 1, :REPORT_ID);'
      '    end'
      '    else begin'
      '      delete from Sys$Group_Rights where Rights_Type = 1'
      '            and Right_Id = :REPORT_ID'
      '            and Group_Id = :Group_Id;'
      '    end'
      '  end'
      'end')
    InsertSQL.Strings = (
      'execute block ('
      '    GROUP_ID  integer = :GROUP_ID,'
      '    REPORT_ID integer = :id_report,'
      '    rALLOWED  integer = :rALLOWED)'
      'as'
      'begin'
      
        '  if ((not(rALLOWED is null)) and (not(GROUP_ID is null)) and (n' +
        'ot(REPORT_ID is null))) then begin'
      '    if (rALLOWED = 1) then begin'
      
        '      insert into Sys$Group_Rights (Group_Id, Rights_Type, Right' +
        '_Id)'
      '      values (:GROUP_ID, 1, :REPORT_ID);'
      '    end'
      '    else begin'
      '      delete from Sys$Group_Rights where Rights_Type = 1'
      '            and Right_Id = :REPORT_ID'
      '            and Group_Id = :Group_Id;'
      '    end'
      '  end'
      'end')
    RefreshSQL.Strings = (
      'select'
      '  r.id_report,'
      '  p.Full_Name,'
      '  r.report_name,'
      '  iif(gr.Id is null,  0, 1) as rAllowed'
      'from reports r'
      
        '  left outer join Get_Fullname_Allreports('#39'\'#39') p on (p.Id_Report' +
        ' = r.id_report)'
      
        '  left outer join Sys$Group_Rights gr on (r.Id_Report = gr.Right' +
        '_Id and gr.Rights_Type = 1 and gr.Group_Id = :ID)'
      'where r.id_report = :old_id_report')
    SelectSQL.Strings = (
      'select'
      '  r.id_report,'
      '  p.Full_Name,'
      '  r.report_name,'
      '  coalesce(gr.Group_Id,:ID) Group_Id ,'
      '  iif(gr.Id is null,  0, 1) as rAllowed'
      'from reports r'
      
        '  left outer join Get_Fullname_Allreports('#39'\'#39') p on (p.Id_Report' +
        ' = r.id_report)'
      
        '  left outer join Sys$Group_Rights gr on (r.Id_Report = gr.Right' +
        '_Id and gr.Rights_Type = 1 and gr.Group_Id = :ID)'
      'where r.Report_Body is not null  '
      'order by p.Full_Name, r.report_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcGroups
    Left = 592
    Top = 212
    dcForceMasterRefresh = True
    dcForceOpen = True
    oFetchAll = True
  end
  object srcReports: TDataSource
    DataSet = dsReports
    Left = 520
    Top = 220
  end
  object srcModules: TDataSource
    DataSet = dsModules
    Left = 520
    Top = 284
  end
  object dsModules: TpFIBDataSet
    UpdateSQL.Strings = (
      'execute block ('
      '    GROUP_ID  integer = :GROUP_ID,'
      '    MODULE_ID integer = :id_MODULE,'
      '    rALLOWED  integer = :rALLOWED)'
      'as'
      'begin'
      
        '  if ((not(rALLOWED is null)) and (not(GROUP_ID is null)) and (n' +
        'ot(MODULE_ID is null))) then begin'
      '    if (rALLOWED = 1) then begin'
      
        '      insert into Sys$Group_Rights (Group_Id, Rights_Type, Right' +
        '_Id)'
      '      values (:GROUP_ID, 2, :MODULE_ID);'
      '    end'
      '    else begin'
      '      delete from Sys$Group_Rights where Rights_Type = 2'
      '            and Right_Id = :MODULE_ID'
      '            and Group_Id = :Group_Id;'
      '    end'
      '  end'
      'end')
    InsertSQL.Strings = (
      'execute block ('
      '    GROUP_ID  integer = :GROUP_ID,'
      '    MODULE_ID integer = :id_MODULE,'
      '    rALLOWED  integer = :rALLOWED)'
      'as'
      'begin'
      
        '  if ((not(rALLOWED is null)) and (not(GROUP_ID is null)) and (n' +
        'ot(MODULE_ID is null))) then begin'
      '    if (rALLOWED = 1) then begin'
      
        '      insert into Sys$Group_Rights (Group_Id, Rights_Type, Right' +
        '_Id)'
      '      values (:GROUP_ID, 2, :MODULE_ID);'
      '    end'
      '    else begin'
      '      delete from Sys$Group_Rights where Rights_Type = 2'
      '            and Right_Id = :MODULE_ID'
      '            and Group_Id = :Group_Id;'
      '    end'
      '  end'
      'end')
    RefreshSQL.Strings = (
      'select'
      '  m.Id_Module,'
      '  m.Name,'
      '  coalesce(gr.Group_Id,:ID) Group_Id ,'
      '  iif(gr.Id is null,  0, 1) as rAllowed'
      'from modules m'
      
        '  left outer join Sys$Group_Rights gr on (m.Id_Module = gr.Right' +
        '_Id and gr.Rights_Type = 2 and gr.Group_Id = :ID)'
      'where m.Id_Module = :old_Id_Module')
    SelectSQL.Strings = (
      'select'
      '  m.Id_Module,'
      '  m.Name,'
      '  coalesce(gr.Group_Id,:ID) Group_Id ,'
      '  iif(gr.Id is null,  0, 1) as rAllowed'
      'from modules m'
      
        '  left outer join Sys$Group_Rights gr on (m.Id_Module = gr.Right' +
        '_Id and gr.Rights_Type = 2 and gr.Group_Id = :ID)'
      'order by m.Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcGroups
    Left = 584
    Top = 284
    dcForceMasterRefresh = True
    dcForceOpen = True
    oFetchAll = True
  end
  object srcRights: TDataSource
    DataSet = dsRights
    Left = 520
    Top = 124
  end
  object dsRights: TpFIBDataSet
    UpdateSQL.Strings = (
      'execute block ('
      '    GROUP_ID  integer = :GROUP_ID,'
      '    RIGHT_ID integer = :Right_Id,'
      '    rALLOWED  integer = :rALLOWED)'
      'as'
      'begin'
      
        '  if ((not(rALLOWED is null)) and (not(GROUP_ID is null)) and (n' +
        'ot(RIGHT_ID is null))) then begin'
      '    if (rALLOWED = 1) then begin'
      
        '      insert into Sys$Group_Rights (Group_Id, Rights_Type, Right' +
        '_Id)'
      '      values (:GROUP_ID, 0, :RIGHT_ID);'
      '    end'
      '    else begin'
      '      delete from Sys$Group_Rights where Rights_Type = 0'
      '            and Right_Id = :RIGHT_ID'
      '            and Group_Id = :Group_Id;'
      '    end'
      '  end'
      'end')
    InsertSQL.Strings = (
      'execute block ('
      '    GROUP_ID  integer = :GROUP_ID,'
      '    RIGHT_ID integer = :Right_Id,'
      '    rALLOWED  integer = :rALLOWED)'
      'as'
      'begin'
      
        '  if ((not(rALLOWED is null)) and (not(GROUP_ID is null)) and (n' +
        'ot(RIGHT_ID is null))) then begin'
      '    if (rALLOWED = 1) then begin'
      
        '      insert into Sys$Group_Rights (Group_Id, Rights_Type, Right' +
        '_Id)'
      '      values (:GROUP_ID, 0, :RIGHT_ID);'
      '    end'
      '    else begin'
      '      delete from Sys$Group_Rights where Rights_Type = 0'
      '            and Right_Id = :RIGHT_ID'
      '            and Group_Id = :Group_Id;'
      '    end'
      '  end'
      'end')
    RefreshSQL.Strings = (
      'select'
      '  r.Id Right_Id,'
      '  r.Rights,'
      '  r.Category,'
      '  r.Notice,'
      '  coalesce(gr.Group_Id,:ID) Group_Id ,'
      '  iif(gr.Id is null,  0, 1) as rAllowed'
      'from Sys$Rights r'
      
        '  left outer join Sys$Group_Rights gr on (r.Id = gr.Right_Id and' +
        ' gr.Rights_Type = 0 and gr.Group_Id = :ID)'
      'where r.Id = :old_Right_Id')
    SelectSQL.Strings = (
      'select'
      '  r.Id Right_Id,'
      '  r.Rights,'
      '  r.Category,'
      '  r.Notice,'
      '  coalesce(gr.Group_Id,:ID) Group_Id ,'
      '  iif(gr.Id is null,  0, 1) as rAllowed'
      'from Sys$Rights r'
      
        '  left outer join Sys$Group_Rights gr on (r.Id = gr.Right_Id and' +
        ' gr.Rights_Type = 0 and gr.Group_Id = :ID)'
      'where @@right_fltr%1=1@  '
      'order by r.Category, r.Rights')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcGroups
    Left = 592
    Top = 124
    dcForceMasterRefresh = True
    dcForceOpen = True
    oFetchAll = True
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
    Left = 393
    Top = 104
  end
end
