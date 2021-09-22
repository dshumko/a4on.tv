inherited VlansForm: TVlansForm
  Left = 381
  Top = 171
  Caption = #1051#1086#1082#1072#1083#1100#1085#1099#1077' '#1089#1077#1090#1080
  ClientHeight = 538
  ClientWidth = 740
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter [0]
    Left = 0
    Top = 349
    Width = 740
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  inherited splPG: TSplitter
    Top = 193
    Width = 740
  end
  inherited dbGrid: TDBGridEh
    Top = 196
    Width = 740
    Height = 153
    AllowedOperations = []
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize]
    SumList.Active = True
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
        Width = 111
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IP_BEGIN'
        Footers = <>
        Title.Caption = 'IP '#1072#1076#1088#1077#1089#1072'|'#1089
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IP_END'
        Footers = <>
        Title.Caption = 'IP '#1072#1076#1088#1077#1089#1072'|'#1087#1086
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MASK'
        Footers = <>
        Title.Caption = #1052#1072#1089#1082#1072' '#1089#1077#1090#1080
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'GATEWAY'
        Footers = <>
        Title.Caption = #1064#1083#1102#1079
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'V_ID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DNS'
        Footers = <>
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'VLAN_NUM'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FOR_OBJECTS'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1'
          '2'
          '-1')
        PickList.Strings = (
          #1042#1089#1077#1093
          #1040#1073#1086#1085'-'#1086#1074
          #1054#1073#1086#1088#1091#1076'.'
          #1048#1085#1092#1086#1088#1084'.')
        Title.Caption = #1057#1077#1090#1100' '#1076#1083#1103
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'C_CNT'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1086'|'#1040#1073#1086#1085#1077#1085#1090'.'
        Title.TitleButton = True
        Width = 57
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'E_CNT'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1086'|'#1054#1073#1086#1088#1091#1076'.'
        Title.TitleButton = True
        Width = 58
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CONFIG_FILE'
        Footers = <>
        Title.Caption = #1060#1072#1081#1083' '#1082#1086#1085#1092#1080#1075'.'
        Title.TitleButton = True
        Width = 87
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 222
      end>
  end
  object pgcInfo: TPageControl [3]
    Left = 0
    Top = 352
    Width = 740
    Height = 186
    ActivePage = tsCoverage
    Align = alBottom
    TabOrder = 3
    OnChange = pgcInfoChange
    object tsCoverage: TTabSheet
      Caption = #1047#1086#1085#1072' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
      object pnlCoverage: TPanel
        Left = 0
        Top = 0
        Width = 732
        Height = 158
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object spl2: TSplitter
          Left = 333
          Top = 0
          Height = 158
          Align = alRight
        end
        object pnlLeft: TPanel
          Left = 0
          Top = 0
          Width = 333
          Height = 158
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object lbl1: TLabel
            Left = 0
            Top = 0
            Width = 333
            Height = 19
            Align = alTop
            AutoSize = False
            Caption = #1044#1086#1084#1072' '#1074' '#1079#1086#1085#1077' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103' '
          end
          object dbgEnabled: TDBGridEh
            Left = 0
            Top = 19
            Width = 333
            Height = 139
            Align = alClient
            AllowedOperations = []
            AllowedSelections = [gstRecordBookmarks]
            DataSource = srcEnabled
            DragMode = dmAutomatic
            DynProps = <>
            Flat = True
            FooterRowCount = 1
            FooterParams.Color = clWindow
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
            ReadOnly = True
            SearchPanel.Enabled = True
            SearchPanel.FilterOnTyping = True
            STFilter.InstantApply = True
            STFilter.Local = True
            SumList.Active = True
            TabOrder = 0
            OnDragDrop = dbgEnabledDragDrop
            OnDragOver = dbgEnabledDragOver
            Columns = <
              item
                AutoFitColWidth = False
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'STREET_SHORT'
                Footers = <>
                Title.Caption = #1089#1086#1082#1088'.'
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'STREET_NAME'
                Footers = <>
                Title.Caption = #1059#1083#1080#1094#1072
                Width = 168
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'HOUSE_NO'
                Footer.ValueType = fvtCount
                Footers = <>
                Title.Caption = #1044#1086#1084
                Width = 58
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        object pnlAddAdres: TPanel
          Left = 336
          Top = 0
          Width = 396
          Height = 158
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          Visible = False
          object lbl2: TLabel
            Left = 0
            Top = 0
            Width = 396
            Height = 13
            Align = alTop
            Caption = #1044#1086#1084#1072' '#1074#1085#1077' '#1079#1086#1085#1099' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103' '
          end
          object dbgExists: TDBGridEh
            Left = 37
            Top = 13
            Width = 359
            Height = 145
            Align = alClient
            AllowedOperations = []
            AllowedSelections = [gstRecordBookmarks]
            DataSource = srcExists
            DragMode = dmAutomatic
            DynProps = <>
            Flat = True
            FooterRowCount = 1
            FooterParams.Color = clWindow
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
            ReadOnly = True
            SearchPanel.Enabled = True
            SearchPanel.FilterOnTyping = True
            STFilter.InstantApply = True
            SumList.Active = True
            TabOrder = 1
            OnDragDrop = dbgExistsDragDrop
            OnDragOver = dbgExistsDragOver
            Columns = <
              item
                AutoFitColWidth = False
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'STREET_SHORT'
                Footers = <>
                Title.Caption = #1089#1086#1082#1088'.'
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'STREET_NAME'
                Footers = <>
                Title.Caption = #1059#1083#1080#1094#1072
                Width = 189
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'HOUSE_NO'
                Footer.ValueType = fvtCount
                Footers = <>
                Title.Caption = #1044#1086#1084
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'AREA_NAME'
                Footers = <>
                Title.Caption = #1053'.'#1055'.'
                Title.TitleButton = True
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object pnlButtons: TPanel
            Left = 0
            Top = 13
            Width = 37
            Height = 145
            Align = alLeft
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 0
            object btnUGAdd: TSpeedButton
              Left = 2
              Top = 2
              Width = 33
              Height = 60
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1084' '#1074' '#1079#1086#1085#1091' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
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
              OnClick = btnUGAddClick
            end
            object btnUGremove: TSpeedButton
              Left = 2
              Top = 83
              Width = 33
              Height = 60
              Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1084' '#1080#1079' '#1079#1086#1085#1099' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
              Align = alBottom
              Flat = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3
                783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB177
                3EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00FFB3783FB3783E
                B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                3EB3783EB1773EFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
                783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB1773EB3783FB3783E
                B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                3EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB177
                3EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3
                783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              OnClick = btnUGremoveClick
            end
          end
        end
      end
    end
    object tsUsers: TTabSheet
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1099
      ImageIndex = 1
      object dbgUsed: TDBGridEh
        Left = 0
        Top = 0
        Width = 732
        Height = 158
        Align = alClient
        DataSource = srcUsed
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        STFilter.Local = True
        STFilter.Visible = True
        SumList.Active = True
        TabOrder = 0
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'TIP'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1058#1080#1087
            Width = 25
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SURNAME'
            Footers = <>
            Title.Caption = #1060#1048#1054' / '#1053#1072#1079#1074#1072#1085#1080#1077
            Width = 235
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STREET_SHORT'
            Footers = <>
            Title.Caption = #1089#1086#1082#1088
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STREET_NAME'
            Footers = <>
            Title.Caption = #1059#1083#1080#1094#1072
            Width = 181
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOUSE_NO'
            Footers = <>
            Title.Caption = #1044#1086#1084
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLAT_NO'
            Footers = <>
            Title.Caption = #1050#1074'.'
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'IP'
            Footers = <>
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'MAC'
            Footers = <>
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  inherited tlbMain: TToolBar
    Width = 740
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
    end
    inherited ToolButton20: TToolButton
      Visible = False
    end
    object btn1: TToolButton
      Left = 178
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object btnViewInfo: TToolButton
      Left = 186
      Top = 0
      Action = actViewInfo
      ImageIndex = 24
    end
    object btnFindIP: TToolButton
      Left = 209
      Top = 0
      Hint = #1053#1072#1081#1090#1080' '#1089#1074#1086#1073#1086#1076#1085#1099#1081' IP'
      Caption = #1053#1072#1081#1090#1080' '#1089#1074#1086#1073#1086#1076#1085#1099#1081' IP'
      ImageIndex = 23
      OnClick = btnFindIPClick
    end
  end
  inherited pnlEdit: TPanel
    Width = 740
    Height = 168
    object Label1: TLabel [0]
      Left = 564
      Top = 36
      Width = 47
      Height = 13
      Caption = #1057#1077#1090#1100' '#1076#1083#1103
    end
    object Label2: TLabel [1]
      Left = 5
      Top = 9
      Width = 48
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object lbl3: TLabel [2]
      Left = 4
      Top = 90
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object Label3: TLabel [3]
      Left = 6
      Top = 36
      Width = 57
      Height = 13
      Caption = 'IP '#1072#1076#1088#1077#1089#1072' '#1089
    end
    object Label4: TLabel [4]
      Left = 390
      Top = 36
      Width = 31
      Height = 13
      Caption = #1052#1072#1089#1082#1072
    end
    object lbl5: TLabel [5]
      Left = 212
      Top = 36
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object Label5: TLabel [6]
      Left = 6
      Top = 63
      Width = 30
      Height = 13
      Caption = #1064#1083#1102#1079
    end
    object Label6: TLabel [7]
      Left = 212
      Top = 63
      Width = 20
      Height = 13
      Caption = 'DNS'
    end
    object Label7: TLabel [8]
      Left = 572
      Top = 9
      Width = 31
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1053#1086#1084#1077#1088
    end
    object lbl6: TLabel [9]
      Left = 376
      Top = 63
      Width = 59
      Height = 13
      Caption = #1060#1072#1081#1083' '#1082#1086#1085#1092'.'
    end
    inherited btnSaveLink: TBitBtn
      Left = 68
      Top = 137
      Width = 576
      TabOrder = 10
    end
    inherited btnCancelLink: TBitBtn
      Left = 650
      Top = 137
      TabOrder = 11
    end
    object dbmmoNotice: TDBMemoEh
      Left = 68
      Top = 87
      Width = 668
      Height = 44
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 9
      Visible = True
      WantReturns = True
    end
    object edtName: TDBEditEh
      Left = 68
      Top = 6
      Width = 490
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object cbType: TDBComboBoxEh
      Left = 616
      Top = 33
      Width = 120
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'FOR_OBJECTS'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = #1044#1083#1103' '#1082#1086#1075#1086' '#1101#1090#1072' '#1079#1086#1085#1072
      EditButtons = <>
      Items.Strings = (
        #1042#1089#1077#1093
        #1040#1073#1086#1085'-'#1086#1074
        #1054#1073#1086#1088#1091#1076'.'
        #1048#1085#1092#1086#1088#1084#1072#1094#1080#1080)
      KeyItems.Strings = (
        '0'
        '1'
        '2'
        '-1')
      ShowHint = True
      TabOrder = 5
      Visible = True
    end
    object edtVLAN_NUM: TDBEditEh
      Left = 616
      Top = 6
      Width = 120
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'VLAN_NUM'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1089#1077#1090#1080' '#1085#1072' '#1082#1086#1084#1084#1091#1090#1072#1090#1086#1088#1077
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object edtIP_BEGIN: TDBEditEh
      Left = 68
      Top = 33
      Width = 120
      Height = 21
      DataField = 'IP_BEGIN'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1087#1077#1088#1074#1099#1081' IP'
      MaxLength = 19
      ShowHint = True
      TabOrder = 2
      Visible = True
      OnEnter = edtDNSEnter
      OnExit = edtIP_BEGINExit
    end
    object edtMASK: TDBEditEh
      Left = 438
      Top = 33
      Width = 120
      Height = 21
      CharCase = ecUpperCase
      DataField = 'MASK'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1052#1072#1089#1082#1072' '#1089#1077#1090#1080
      ShowHint = True
      TabOrder = 4
      Visible = True
      OnEnter = edtDNSEnter
      OnExit = edtIP_BEGINExit
      EditMask = ''
    end
    object edtIP_END: TDBEditEh
      Left = 250
      Top = 33
      Width = 120
      Height = 21
      DataField = 'IP_END'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1087#1086#1089#1083#1077#1076#1085#1080#1081' IP'
      MaxLength = 19
      ShowHint = True
      TabOrder = 3
      Visible = True
      OnEnter = edtDNSEnter
      OnExit = edtIP_BEGINExit
    end
    object edtGATEWAY: TDBEditEh
      Left = 68
      Top = 60
      Width = 120
      Height = 21
      DataField = 'GATEWAY'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1096#1083#1102#1079
      ShowHint = True
      TabOrder = 6
      Visible = True
      OnEnter = edtDNSEnter
      OnExit = edtIP_BEGINExit
    end
    object edtDNS: TDBEditEh
      Left = 250
      Top = 60
      Width = 120
      Height = 21
      DataField = 'DNS'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'DNS'
      ShowHint = True
      TabOrder = 7
      Visible = True
      OnEnter = edtDNSEnter
      OnExit = edtIP_BEGINExit
    end
    object edtCONFIG_FILE: TDBEditEh
      Left = 438
      Top = 60
      Width = 298
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CONFIG_FILE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1060#1072#1081#1083' '#1082#1086#1085#1092#1080#1075#1091#1088#1072#1094#1080#1080' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
      ShowHint = True
      TabOrder = 8
      Visible = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsVlans
    OnDataChange = srcDataSourceDataChange
    Left = 88
    Top = 288
  end
  inherited actions: TActionList
    Left = 279
    Top = 101
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1077#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1077#1090#1100
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1077#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1077#1090#1100
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1077#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1077#1090#1100
      OnExecute = actEditExecute
    end
    object actViewInfo: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1079#1086#1085' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
      Checked = True
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1079#1086#1085' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
      OnExecute = actViewInfoExecute
    end
    object actEditZones: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1086#1085#1091' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
      OnExecute = actEditZonesExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      Enabled = False
      ShortCut = 27
      OnExecute = actCancelExecute
    end
  end
  inherited CnErrors: TCnErrorProvider
    Left = 464
    Top = 120
  end
  object dsVlans: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE VLANS'
      'SET '
      '    NAME = :NAME,'
      '    IP_BEGIN = :IP_BEGIN,'
      '    IP_END = :IP_END,'
      '    MASK = :MASK,'
      '    GATEWAY = :GATEWAY,'
      '    NOTICE = :NOTICE,'
      '    CONFIG_FILE = :CONFIG_FILE,'
      '    FOR_OBJECTS = :FOR_OBJECTS,'
      '    VLAN_NUM = :VLAN_NUM,'
      '    DNS = :DNS'
      'WHERE'
      '    V_ID = :OLD_V_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    VLANS'
      'WHERE'
      '        V_ID = :OLD_V_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO VLANS('
      '    V_ID,'
      '    NAME,'
      '    IP_BEGIN,'
      '    IP_END,'
      '    MASK,'
      '    GATEWAY,'
      '    NOTICE,'
      '    CONFIG_FILE,'
      '    FOR_OBJECTS, '
      '    VLAN_NUM, '
      '    DNS'
      ')'
      'VALUES('
      '    :V_ID,'
      '    :NAME,'
      '    :IP_BEGIN,'
      '    :IP_END,'
      '    :MASK,'
      '    :GATEWAY,'
      '    :NOTICE,'
      '    :CONFIG_FILE,'
      '    :FOR_OBJECTS, '
      '    :VLAN_NUM,'
      '    :DNS'
      ')')
    RefreshSQL.Strings = (
      'select *'
      'from vlans'
      ''
      ' WHERE '
      '        VLANS.V_ID = :OLD_V_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    v.*'
      '  , l.C_CNT'
      '  , e.E_CNT'
      '  from vlans v'
      '       left outer join(select'
      '                           Vlan_Id'
      '                         , count(*) C_CNT'
      '                         from Tv_Lan'
      '                         group by 1) l on (l.Vlan_Id = v.V_Id)'
      '       left outer join(select'
      '                           Vlan_Id'
      '                         , count(*) E_CNT'
      '                         from Equipment'
      '                         group by 1) e on (e.Vlan_Id = v.V_Id)'
      '  order by ip_begin_bin  ')
    AutoUpdateOptions.UpdateTableName = 'VLANS'
    AutoUpdateOptions.KeyFields = 'v_id'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 32
    Top = 288
  end
  object dsEnabled: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    OBJECTS_COVERAGE'
      'WHERE'
      '        O_ID = :OLD_O_ID'
      '    and HOUSE_ID = :OLD_HOUSE_ID'
      '    ')
    InsertSQL.Strings = (
      
        'insert into OBJECTS_COVERAGE (OC_TYPE, O_ID, HOUSE_ID) values (2' +
        ', :O_ID, :HOUSE_ID)')
    RefreshSQL.Strings = (
      
        'select c.O_ID, h.HOUSE_ID, s.street_name, s.street_short, h.HOUS' +
        'E_NO'
      'from HOUSE h'
      '  inner join street s on (s.street_id = h.street_id)'
      '  inner join objects_coverage c on (c.house_id = h.house_id)'
      'where(  c.oc_type = 2 and c.o_id = :v_id'
      '     ) and (     H.HOUSE_ID = :OLD_HOUSE_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    c.O_ID'
      '  , c.HOUSE_ID'
      '  , s.street_name'
      '  , s.street_short'
      '  , h.HOUSE_NO'
      '  , c.OC_ID'
      '  , a.Area_Name'
      '  from HOUSE h'
      '       inner join street s on (s.street_id = h.street_id)'
      
        '       inner join objects_coverage c on (c.house_id = h.house_id' +
        ')'
      '       left outer join area a on (a.area_id = s.area_id)'
      '  where c.oc_type = 2'
      '        and c.o_id = :v_id'
      
        '  order by a.Area_Name, s.street_name, s.street_short, H.HOUSE_N' +
        'O  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 213
    Top = 299
    oFetchAll = True
  end
  object dsExists: TpFIBDataSet
    RefreshSQL.Strings = (
      'select h.HOUSE_ID, s.street_name, s.street_short, h.HOUSE_NO'
      'from HOUSE h'
      '    inner join street s on (s.street_id = h.street_id)'
      'where( '
      '    not h.house_id in ('
      '        select c.house_id'
      '        from objects_coverage c'
      '        where c.oc_type = 2 and c.o_id = :v_id'
      '    )'
      '     ) and (     H.HOUSE_ID = :OLD_HOUSE_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    h.HOUSE_ID'
      '  , s.street_name'
      '  , s.street_short'
      '  , h.HOUSE_NO'
      '  , a.Area_Name'
      '  from HOUSE h'
      '       inner join street s on (s.street_id = h.street_id)'
      '       left outer join area a on (a.area_id = s.area_id)'
      '  where not exists(select c.house_id'
      '                             from objects_coverage c'
      
        '                             where c.house_id = h.house_id and  ' +
        ' c.oc_type = 2'
      '                                   and c.o_id = :v_id)'
      
        '  order by a.Area_Name, s.street_name, s.street_short, H.HOUSE_N' +
        'O'
      '')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 561
    Top = 139
    poUseBooleanField = False
    poGetOrderInfo = False
    poEmptyStrToNull = False
    oFetchAll = True
  end
  object srcExists: TDataSource
    DataSet = dsExists
    Left = 491
    Top = 142
  end
  object srcEnabled: TDataSource
    DataSet = dsEnabled
    Left = 265
    Top = 302
  end
  object srcUsed: TDataSource
    DataSet = dsUsed
    Left = 453
    Top = 298
  end
  object dsUsed: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select '#39#1040#39' as TIP , u.ip_bin, c.customer_id, c.surname, s.street' +
        '_name, s.street_short, h.house_no, c.Flat_no, u.ip, u.mac'
      'from TV_LAN u'
      '   inner join customer c on (c.customer_id = u.customer_id)'
      '   inner join house h on (c.house_id = h.house_id)'
      '   inner join street s on (h.street_id = s.street_id)'
      'where u.vlan_id = :V_ID'
      'union'
      
        'select '#39#1052#39' as TIP, e.ip_bin, e.eid, e.name, s.street_name, s.str' +
        'eet_short, h.house_no, e.Place, e.ip, e.mac'
      'from equipment e'
      '   left outer join house h on (e.house_id = h.house_id)'
      '   inner join street s on (h.street_id = s.street_id)'
      'where e.vlan_id = :V_ID'
      'order by 1,2')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcDataSource
    Left = 407
    Top = 291
  end
end
