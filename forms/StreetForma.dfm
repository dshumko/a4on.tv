inherited StreetForm: TStreetForm
  Left = 327
  Top = 117
  Caption = #1059#1083#1080#1094#1099' '#1080' '#1076#1086#1084#1072
  ClientHeight = 565
  ClientWidth = 993
  ExplicitWidth = 1009
  ExplicitHeight = 604
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 246
    Width = 993
    Height = 8
    Cursor = crVSplit
    Align = alTop
  end
  inherited splPG: TSplitter
    Top = 75
    Width = 993
    ExplicitTop = 75
    ExplicitWidth = 993
  end
  inherited dbGrid: TDBGridEh
    Top = 78
    Width = 993
    Height = 168
    Align = alTop
    AllowedOperations = [alopUpdateEh]
    FooterRowCount = 1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
    SumList.Active = True
    OnExit = dbGridExit
    OnSortMarkingChanged = dbGridSortMarkingChanged
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_ID'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_SHORT'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1057#1086#1082#1088'.'
        Title.TitleButton = True
        Width = 44
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_NAME'
        Footers = <>
        Title.Caption = #1059#1083#1080#1094#1072
        Title.TitleButton = True
        Width = 89
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'AREA_NAME'
        Footers = <>
        Title.Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090
        Title.TitleButton = True
        Width = 91
      end
      item
        Alignment = taRightJustify
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_CODE'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Title.TitleButton = True
        Width = 43
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSES'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1044#1086#1084#1086#1074
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLATS'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1050#1074#1072#1088#1090#1080#1088
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Q_PORCH'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1055#1086#1076#1098#1077#1079#1076#1086#1074
        Title.TitleButton = True
        Width = 66
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 231
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SUBAREA_LIST'
        Footers = <>
        Title.Caption = #1056#1072#1081#1086#1085#1099
        Title.TitleButton = True
        Width = 84
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WG_LIST'
        Footers = <>
        Title.Caption = #1047#1074#1077#1085#1100#1103
        Title.TitleButton = True
        Width = 90
      end>
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 254
    Width = 993
    Height = 311
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object Splitter2: TSplitter
      Left = 346
      Top = 25
      Height = 286
    end
    object DbGridHouse: TDBGridEh
      Left = 0
      Top = 25
      Width = 346
      Height = 286
      Align = alLeft
      AllowedOperations = []
      DataSource = srcHouses
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
      STFilter.Local = True
      SumList.Active = True
      TabOrder = 1
      TitleParams.MultiTitle = True
      OnDblClick = DbGridHouseDblClick
      Columns = <
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'HOUSE_NO'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
          Title.TitleButton = True
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Q_FLAT'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1050#1074#1072#1088#1090#1080#1088
          Title.Hint = #1050#1086#1083'-'#1074#1086' '#1082#1074#1072#1088#1090#1080#1088
          Title.TitleButton = True
          Title.Orientation = tohVertical
          Width = 41
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CONNECTED'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1055#1086#1076#1082#1083'.'
          Title.Hint = #1050#1086#1083'-'#1074#1086' '#1087#1086#1076#1083#1102#1095#1077#1085#1085#1099#1093' '#1082#1074#1072#1088#1090#1080#1088
          Title.TitleButton = True
          Title.Orientation = tohVertical
          Width = 39
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DISCONNECTED'
          Footers = <>
          Title.Caption = #1054#1090#1082#1083'.'
          Title.Hint = #1050#1086#1083'-'#1074#1086' '#1086#1090#1082#1083#1102#1095#1077#1085#1085#1099#1093' '#1082#1074#1072#1088#1090#1080#1088
          Title.TitleButton = True
          Title.Orientation = tohVertical
          Width = 34
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PERCENT'
          Footer.DisplayFormat = '#.0'
          Footer.ValueType = fvtAvg
          Footers = <>
          Title.Caption = '% '#1087#1086#1076#1082#1083'.'
          Title.Hint = '% '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
          Title.TitleButton = True
          Title.Orientation = tohVertical
          Width = 34
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'HOUSE_CODE'
          Footers = <>
          Title.Caption = #1050#1086#1076
          Title.TitleButton = True
          Width = 53
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DropDownBox.Columns = <
            item
              FieldName = 'SUBAREA_NAME'
            end>
          DynProps = <>
          EditButtons = <>
          FieldName = 'SUBAREA_NAME'
          Footers = <>
          Title.Caption = #1056#1072#1081#1086#1085
          Title.TitleButton = True
          Width = 75
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1047#1074#1077#1085#1086
          Title.TitleButton = True
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EXIST_TV'
          Footers = <>
          Title.Caption = 'TB'
          Title.Hint = 'TB'
          Title.TitleButton = True
          Title.Orientation = tohVertical
          Width = 20
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EXIST_LAN'
          Footers = <>
          Title.Caption = #1057#1055#1044
          Title.Hint = #1057#1055#1044
          Title.TitleButton = True
          Title.Orientation = tohVertical
          Width = 20
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EXIST_DTV'
          Footers = <>
          Title.Caption = #1062'TB'
          Title.Hint = #1062'TB'
          Title.TitleButton = True
          Title.Orientation = tohVertical
          Width = 20
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CHAIRMAN'
          Footers = <>
          Title.Caption = #1055#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1100
          Title.TitleButton = True
          Width = 133
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CHAIRMAN_PHONE'
          Footers = <>
          Title.Caption = #1058#1077#1083#1077#1092#1086#1085
          Title.TitleButton = True
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'POST_INDEX'
          Footers = <>
          Title.Caption = #1048#1085#1076#1077#1082#1089
          Title.TitleButton = True
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ORG_NAME'
          Footers = <>
          Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          Title.TitleButton = True
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'HE_NAME'
          Footers = <>
          Title.Caption = #1043#1057
          Title.TitleButton = True
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'IN_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072'|'#1042#1074#1086#1076#1072
          Title.TitleButton = True
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'REPAIR_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072'|'#1056#1077#1084#1086#1085#1090#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'LATITUDE'
          Footers = <>
          Title.Caption = #1064#1080#1088#1086#1090#1072' '
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'LONGITUDE'
          Footers = <>
          Title.Caption = #1044#1086#1083#1075#1086#1090#1072
          Title.TitleButton = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object ToolBar2: TToolBar
      Left = 0
      Top = 0
      Width = 993
      Height = 25
      Caption = 'ToolBar1'
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
      object tbHAdd: TToolButton
        Left = 5
        Top = 0
        Action = actHouseNew
      end
      object ToolButton11: TToolButton
        Left = 28
        Top = 0
        Width = 4
        Caption = 'ToolButton5'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object tbHEdit: TToolButton
        Left = 32
        Top = 0
        Action = actHouseEdit
      end
      object ToolButton13: TToolButton
        Left = 55
        Top = 0
        Width = 4
        Caption = 'ToolButton6'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object tbHDelete: TToolButton
        Left = 59
        Top = 0
        Action = actHouseDel
      end
      object ToolButton15: TToolButton
        Left = 82
        Top = 0
        Width = 15
        Caption = 'ToolButton9'
        ImageIndex = 27
        Style = tbsSeparator
      end
      object ToolButton17: TToolButton
        Left = 97
        Top = 0
        Width = 4
        Caption = 'ToolButton10'
        ImageIndex = 28
        Style = tbsSeparator
      end
      object ToolButton14: TToolButton
        Left = 101
        Top = 0
        Action = actQuickFilterHouse
      end
      object ToolButton18: TToolButton
        Left = 124
        Top = 0
        Width = 8
        Caption = 'ToolButton18'
        ImageIndex = 42
        Style = tbsSeparator
      end
      object ToolButton16: TToolButton
        Left = 132
        Top = 0
        Caption = 'ToolButton16'
        ImageIndex = 5
        OnClick = ToolButton16Click
      end
      object btn4: TToolButton
        Left = 155
        Top = 0
        Width = 8
        Caption = 'btn4'
        ImageIndex = 6
        Style = tbsSeparator
      end
      object btnFindHousCustomers: TToolButton
        Left = 163
        Top = 0
        Action = actFindHousCustomers
      end
      object Label2: TLabel
        Left = 186
        Top = 0
        Width = 222
        Height = 22
        Align = alClient
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1044#1086#1084#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
    end
    object pnlHouseInfo: TPanel
      Left = 349
      Top = 25
      Width = 644
      Height = 286
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object pcHouseInfo: TPageControl
        Left = 0
        Top = 0
        Width = 644
        Height = 286
        ActivePage = tsMap
        Align = alClient
        TabOrder = 0
        OnChange = pcHouseInfoChange
        object InfoSheet: TTabSheet
          Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
          object dbgServices: TDBGridEh
            Left = 0
            Top = 201
            Width = 636
            Height = 57
            Align = alClient
            DataSource = srcHouseService
            DynProps = <>
            Flat = True
            FooterParams.Color = clWindow
            TabOrder = 1
            Columns = <
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'NAME'
                Footers = <>
                HideDuplicates = True
                Title.Caption = #1059#1089#1083#1091#1075#1072
                Width = 72
              end
              item
                AutoFitColWidth = False
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'SRV_STATE'
                Footers = <>
                Title.Caption = #1057#1090#1072#1090#1091#1089
                Width = 97
              end
              item
                AutoFitColWidth = False
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'SRV_COUNT'
                Footers = <>
                Title.Caption = #1050#1086#1083'-'#1074#1086
                Width = 53
              end
              item
                AutoFitColWidth = False
                CellButtons = <>
                DisplayFormat = '###.##'
                DynProps = <>
                EditButtons = <>
                FieldName = 'percent'
                Footers = <>
                Title.Caption = '%'
                Width = 48
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object pnlHT: TPanel
            Left = 0
            Top = 0
            Width = 636
            Height = 201
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object pnlHM: TPanel
              Left = 339
              Top = 0
              Width = 297
              Height = 201
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object Label6: TLabel
                Left = 0
                Top = 0
                Width = 297
                Height = 13
                Align = alTop
                Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                ExplicitWidth = 61
              end
              object memHouseNotice: TDBMemoEh
                Left = 0
                Top = 13
                Width = 297
                Height = 188
                ScrollBars = ssVertical
                Align = alClient
                AutoSize = False
                DataField = 'NOTICE'
                DataSource = srcHouses
                DynProps = <>
                EditButtons = <>
                ShowHint = True
                TabOrder = 0
                Visible = True
                WantReturns = True
                OnExit = memHouseNoticeExit
              end
            end
            object pnlHI: TPanel
              Left = 0
              Top = 0
              Width = 339
              Height = 201
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object dbtxt1: TDBText
                Left = 98
                Top = 178
                Width = 241
                Height = 17
                DataField = 'HOUSE_CODE'
                DataSource = srcHouses
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbl3: TLabel
                Left = 2
                Top = 178
                Width = 20
                Height = 13
                Caption = #1050#1086#1076
              end
              object lbl2: TLabel
                Left = 2
                Top = 154
                Width = 90
                Height = 13
                Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1080#1085#1076#1077#1082#1089
              end
              object dbtxtpost: TDBText
                Left = 98
                Top = 154
                Width = 241
                Height = 17
                DataField = 'POST_INDEX'
                DataSource = srcHouses
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbtxtORG_NAME: TDBText
                Left = 98
                Top = 129
                Width = 241
                Height = 17
                DataField = 'ORG_NAME'
                DataSource = srcHouses
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbl1: TLabel
                Left = 2
                Top = 129
                Width = 87
                Height = 13
                Caption = #1054#1073#1089#1083#1091#1078'. '#1087#1088#1077#1076#1087#1088'.'
              end
              object dbtxtCHAIRMAN_PHONE: TDBText
                Left = 82
                Top = 105
                Width = 257
                Height = 17
                DataField = 'CHAIRMAN_PHONE'
                DataSource = srcHouses
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label5: TLabel
                Left = 2
                Top = 105
                Width = 71
                Height = 13
                Caption = #1058#1077#1083'. '#1087#1088#1077#1076#1089'-'#1083#1103
              end
              object dbtxtCHAIRMAN: TDBText
                Left = 82
                Top = 81
                Width = 257
                Height = 17
                DataField = 'CHAIRMAN'
                DataSource = srcHouses
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label4: TLabel
                Left = 2
                Top = 81
                Width = 74
                Height = 13
                Caption = #1055#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1100
              end
              object dbtxtSUBAREA_NAME: TDBText
                Left = 40
                Top = 32
                Width = 299
                Height = 17
                DataField = 'SUBAREA_NAME'
                DataSource = srcHouses
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label9: TLabel
                Left = 2
                Top = 32
                Width = 30
                Height = 13
                Caption = #1056#1072#1081#1086#1085
              end
              object Label7: TLabel
                Left = 2
                Top = 8
                Width = 31
                Height = 13
                Caption = #1053#1086#1084#1077#1088
              end
              object dbtxtHOUSE_NO: TDBText
                Left = 40
                Top = 8
                Width = 95
                Height = 17
                DataField = 'HOUSE_NO'
                DataSource = srcHouses
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label8: TLabel
                Left = 141
                Top = 8
                Width = 43
                Height = 13
                Caption = #1050#1074#1072#1088#1090#1080#1088
              end
              object dbtxtQ_FLAT: TDBText
                Left = 191
                Top = 8
                Width = 56
                Height = 17
                DataField = 'Q_FLAT'
                DataSource = srcHouses
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbtxtSUBAREA_NAME1: TDBText
                Left = 40
                Top = 57
                Width = 299
                Height = 17
                DataField = 'NAME'
                DataSource = srcHouses
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lbl7: TLabel
                Left = 2
                Top = 57
                Width = 30
                Height = 13
                Caption = #1047#1074#1077#1085#1086
              end
            end
          end
        end
        object tsEquipment: TTabSheet
          Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
          ImageIndex = 1
          object DBGridEh2: TDBGridEh
            Left = 0
            Top = 29
            Width = 636
            Height = 229
            Align = alClient
            AllowedOperations = [alopUpdateEh]
            DataSource = srcHouseEquipment
            DynProps = <>
            Flat = True
            FooterRowCount = 1
            FooterParams.Color = clWindow
            GridLineParams.VertEmptySpaceStyle = dessNonEh
            OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghColumnResize, dghColumnMove]
            SortLocal = True
            SumList.Active = True
            TabOrder = 1
            Columns = <
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'EID'
                Footers = <>
                Visible = False
              end
              item
                AutoFitColWidth = False
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'NAME'
                Footer.ValueType = fvtCount
                Footers = <>
                Title.Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
                Title.TitleButton = True
                Width = 93
              end
              item
                AutoFitColWidth = False
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'MAC'
                Footers = <>
                Title.TitleButton = True
              end
              item
                AutoFitColWidth = False
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'IP'
                Footers = <>
                Title.TitleButton = True
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'NOTICE'
                Footers = <>
                Title.Caption = #1047#1072#1084#1077#1090#1082#1080
                Title.TitleButton = True
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'NAME'
                Footers = <>
                Title.TitleButton = True
                Visible = False
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object tlbEqTb: TToolBar
            Left = 0
            Top = 0
            Width = 636
            Height = 29
            Caption = 'tlbEqTb'
            Images = A4MainForm.ICONS_ACTIVE
            TabOrder = 0
            object btnAddEqpmnt: TToolButton
              Left = 0
              Top = 0
              Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
              ImageIndex = 2
              OnClick = btnAddEqpmntClick
            end
            object btn2: TToolButton
              Left = 23
              Top = 0
              Width = 8
              Caption = 'btn2'
              ImageIndex = 5
              Style = tbsSeparator
            end
            object btnEditEqpmnt: TToolButton
              Left = 31
              Top = 0
              Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
              ImageIndex = 4
              OnClick = btnEditEqpmntClick
            end
          end
        end
        object tsMap: TTabSheet
          Caption = #1050#1072#1088#1090#1072' '#1076#1086#1084#1072
          ImageIndex = 4
          object spl2: TSplitter
            Left = 251
            Top = 0
            Height = 258
          end
          object pnl1: TPanel
            Left = 0
            Top = 0
            Width = 251
            Height = 258
            Align = alLeft
            BevelOuter = bvNone
            Caption = 'pnlPF'
            TabOrder = 0
            object spl1: TSplitter
              Left = 0
              Top = 149
              Width = 251
              Height = 3
              Cursor = crVSplit
              Align = alTop
            end
            object dbgrFloors: TDBGridEh
              Left = 0
              Top = 152
              Width = 251
              Height = 106
              Align = alClient
              DataSource = srcFloor
              DynProps = <>
              Flat = True
              FooterParams.Color = clWindow
              GridLineParams.VertEmptySpaceStyle = dessNonEh
              OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
              TabOrder = 2
              TitleParams.MultiTitle = True
              OnExit = dbgrFloorsExit
              Columns = <
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'FLOOR_N'
                  Footers = <>
                  Title.Caption = #1069#1090#1072#1078
                  Width = 38
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'FLATS'
                  Footers = <>
                  Title.Caption = #1050#1074#1072#1088#1090#1080#1088#1099
                  Title.Hint = #1050#1074#1072#1088#1090#1080#1088#1099' '#1076#1086#1084#1072', '#1084#1086#1078#1085#1086' '#1074#1085#1086#1089#1080#1090' '#1082#1072#1082' 1-5 '#1080#1083#1080' 1-3,4,5'
                  Width = 118
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NOTICE'
                  Footers = <>
                  Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                  Width = 256
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object dbgMap: TDBGridEh
              Left = 0
              Top = 25
              Width = 251
              Height = 124
              Align = alTop
              DataSource = srcPorch
              DynProps = <>
              Flat = True
              FooterParams.Color = clWindow
              GridLineParams.VertEmptySpaceStyle = dessNonEh
              OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
              TabOrder = 1
              TitleParams.MultiTitle = True
              OnExit = dbgMapExit
              Columns = <
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'PORCH_N'
                  Footers = <>
                  Title.Caption = #1055#1086#1076#1098#1077#1079#1076
                  Width = 53
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'FLOORS'
                  Footers = <>
                  Title.Caption = #1069#1090#1072#1078#1077#1081
                  Width = 46
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  Checkboxes = True
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'GARRET'
                  Footers = <>
                  Title.Caption = #1063#1077#1088#1076#1072#1082
                  Width = 44
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  Checkboxes = True
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CELLAR'
                  Footers = <>
                  Title.Caption = #1055#1086#1076#1074#1072#1083
                  Width = 46
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'FLAT_FROM'
                  Footers = <>
                  Title.Caption = #1050#1074#1072#1088#1090#1080#1088#1099'|c'
                  Width = 39
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'FLAT_TO'
                  Footers = <>
                  Title.Caption = #1050#1074#1072#1088#1090#1080#1088#1099'|'#1087#1086
                  Width = 37
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NOTICE'
                  Footers = <>
                  Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                  Width = 135
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object tlb1: TToolBar
              Left = 0
              Top = 0
              Width = 251
              Height = 25
              Caption = 'tlb1'
              Images = A4MainForm.ICONS_ACTIVE
              TabOrder = 0
              object btn3: TToolButton
                Left = 0
                Top = 0
                Caption = #1057#1086#1079#1076#1072#1090#1100' '#1082#1074#1072#1088#1090#1080#1088#1099
                ImageIndex = 2
                OnClick = btn3Click
              end
              object btn1: TToolButton
                Left = 23
                Top = 0
                Width = 8
                Caption = 'btn1'
                ImageIndex = 19
                Style = tbsSeparator
              end
              object btnHouseMap: TToolButton
                Left = 31
                Top = 0
                Hint = #1055#1077#1095#1072#1090#1100' '#1082#1072#1088#1090#1099' '#1076#1086#1084#1072
                Caption = #1050#1072#1088#1090#1072' '#1076#1086#1084#1072
                ImageIndex = 5
                OnClick = btnHouseMapClick
              end
              object btnMap: TToolButton
                Left = 54
                Top = 0
                Caption = 'btnMap'
                ImageIndex = 18
                OnClick = btnMapClick
              end
            end
          end
          object pnlFlats: TPanel
            Left = 254
            Top = 0
            Width = 382
            Height = 258
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object dbgFLATS: TDBGridEh
              Left = 0
              Top = 25
              Width = 382
              Height = 233
              Align = alClient
              AllowedSelections = [gstRecordBookmarks, gstAll]
              DataSource = srcFlats
              DynProps = <>
              Flat = True
              FooterRowCount = 1
              FooterParams.Color = clWindow
              Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
              STFilter.Local = True
              STFilter.Visible = True
              SumList.Active = True
              TabOrder = 1
              TitleParams.MultiTitle = True
              OnExit = dbgFLATSExit
              Columns = <
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'FLAT_NO'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #1050#1074'-'#1088#1072
                  Title.TitleButton = True
                  Width = 46
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'PORCH_N'
                  Footers = <>
                  Title.Caption = #1055#1086#1076'-'#1076
                  Title.TitleButton = True
                  Title.Orientation = tohVertical
                  Width = 24
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'FLOOR_N'
                  Footers = <>
                  Title.Caption = #1069#1090#1072#1078
                  Title.TitleButton = True
                  Title.Orientation = tohVertical
                  Width = 26
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NODE'
                  Footers = <>
                  Title.Caption = #1059#1079#1077#1083' '#1087#1086#1076#1082#1083'.'
                  Title.TitleButton = True
                  Width = 87
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NOTICE'
                  Footers = <>
                  Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                  Title.TitleButton = True
                  Width = 99
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'ADDED_BY'
                  Footers = <>
                  Title.Caption = #1044#1086#1073#1072#1074#1080#1083'|'#1050#1090#1086
                  Width = 75
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'ADDED_ON'
                  Footers = <>
                  Title.Caption = #1044#1086#1073#1072#1074#1080#1083'|'#1050#1086#1075#1076#1072
                  Width = 54
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'EDIT_BY'
                  Footers = <>
                  Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1090#1086
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'EDIT_ON'
                  Footers = <>
                  Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1086#1075#1076#1072
                  Width = 53
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'OWNER_NAME'
                  Footers = <>
                  Title.Caption = #1042#1083#1072#1076#1077#1083#1077#1094'|'#1060#1048#1054
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'OWNER_DOC'
                  Footers = <>
                  Title.Caption = #1042#1083#1072#1076#1077#1083#1077#1094'|'#1044#1086#1082#1091#1084#1077#1085#1090
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'MOBILE'
                  Footers = <>
                  Title.Caption = #1042#1083#1072#1076#1077#1083#1077#1094'|'#1084#1086#1073#1080#1083#1072
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object tlb2: TToolBar
              Left = 0
              Top = 0
              Width = 382
              Height = 25
              Caption = 'tlb1'
              Images = A4MainForm.ICONS_ACTIVE
              TabOrder = 0
              object btnFlatAdd: TToolButton
                Left = 0
                Top = 0
                Caption = #1057#1086#1079#1076#1072#1090#1100' '#1082#1074#1072#1088#1090#1080#1088#1099
                ImageIndex = 2
                OnClick = btnFlatAddClick
              end
              object btn8: TToolButton
                Left = 23
                Top = 0
                Width = 8
                Caption = 'btn8'
                ImageIndex = 4
                Style = tbsSeparator
              end
              object btnFlatEdit: TToolButton
                Left = 31
                Top = 0
                Caption = 'btnFlatEdit'
                ImageIndex = 4
                OnClick = btnFlatEditClick
              end
              object btn5: TToolButton
                Left = 54
                Top = 0
                Width = 8
                Caption = 'btn5'
                ImageIndex = 3
                Style = tbsSeparator
              end
              object btnFlatDel: TToolButton
                Left = 62
                Top = 0
                Caption = 'btnFlatDel'
                ImageIndex = 3
                OnClick = btnFlatDelClick
              end
            end
          end
        end
        object tsAtributes: TTabSheet
          Caption = #1040#1090#1088#1080#1073#1091#1090#1099
          ImageIndex = 6
          object pnlAtr: TPanel
            Left = 0
            Top = 26
            Width = 636
            Height = 232
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel1'
            TabOrder = 1
            object dbgAttr: TDBGridEh
              Left = 0
              Top = 100
              Width = 636
              Height = 132
              Align = alClient
              AllowedOperations = []
              DataSource = srcHousesAttr
              DynProps = <>
              Flat = True
              FooterParams.Color = clWindow
              GridLineParams.VertEmptySpaceStyle = dessNonEh
              OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghColumnResize, dghColumnMove]
              SortLocal = True
              TabOrder = 1
              Columns = <
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'O_NAME'
                  Footers = <>
                  Title.Caption = #1040#1090#1088#1080#1073#1091#1090
                  Title.TitleButton = True
                  Width = 169
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'O_DIMENSION'
                  Footers = <>
                  Title.Caption = #1050#1086#1076
                  Width = 34
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'HA_VALUE'
                  Footers = <>
                  Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
                  Title.TitleButton = True
                  Width = 103
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NOTICE'
                  Footers = <>
                  Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                  Title.TitleButton = True
                  Width = 200
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'O_DESCRIPTION'
                  Footers = <>
                  Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
                  Width = 200
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object pnlAttr: TPanel
              Left = 0
              Top = 0
              Width = 636
              Height = 100
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              Visible = False
              DesignSize = (
                636
                100)
              object lbl5: TLabel
                Left = 6
                Top = 10
                Width = 43
                Height = 13
                Caption = #1040#1090#1088#1080#1073#1091#1090
              end
              object lbl6: TLabel
                Left = 327
                Top = 10
                Width = 48
                Height = 13
                Caption = #1047#1085#1072#1095#1077#1085#1080#1077
              end
              object lbl4: TLabel
                Left = 6
                Top = 35
                Width = 61
                Height = 13
                Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              end
              object dbluAttribute: TDBLookupComboboxEh
                Left = 98
                Top = 7
                Width = 223
                Height = 21
                DynProps = <>
                DataField = 'O_ID'
                DataSource = srcHousesAttr
                EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1072#1090#1088#1080#1073#1091#1090
                EditButtons = <>
                KeyField = 'O_ID'
                ListField = 'O_NAME'
                ListSource = srcAttributes
                ShowHint = True
                TabOrder = 0
                Visible = True
                OnChange = dbluAttributeChange
              end
              object btnSaveAttr: TBitBtn
                Left = 98
                Top = 70
                Width = 434
                Height = 25
                Anchors = [akLeft, akRight, akBottom]
                Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
                TabOrder = 4
                OnClick = btnSaveAttrClick
              end
              object btnCancelAttr: TBitBtn
                Left = 545
                Top = 70
                Width = 86
                Height = 25
                Anchors = [akRight, akBottom]
                Caption = #1054#1090#1084#1077#1085#1072
                TabOrder = 5
                OnClick = btnCancelAttrClick
              end
              object mmoNOTICE: TDBMemoEh
                Left = 98
                Top = 32
                Width = 533
                Height = 33
                ScrollBars = ssVertical
                Anchors = [akLeft, akTop, akRight, akBottom]
                AutoSize = False
                DataField = 'NOTICE'
                DataSource = srcHousesAttr
                DynProps = <>
                EditButtons = <>
                ShowHint = True
                TabOrder = 3
                Visible = True
                WantReturns = True
              end
              object edtAtrValue: TDBEditEh
                Left = 381
                Top = 7
                Width = 250
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                DataField = 'HA_VALUE'
                DataSource = srcHousesAttr
                DynProps = <>
                EditButtons = <>
                EmptyDataInfo.Text = #1047#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072
                ShowHint = True
                TabOrder = 1
                Visible = True
              end
              object cbbList: TDBComboBoxEh
                Left = 381
                Top = 7
                Width = 250
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                AutoSize = False
                DataField = 'HA_VALUE'
                DataSource = srcHousesAttr
                DynProps = <>
                EmptyDataInfo.Text = #1047#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072
                EditButtons = <>
                ShowHint = True
                TabOrder = 2
                Visible = False
              end
            end
          end
          object tlbAttr: TToolBar
            Left = 0
            Top = 0
            Width = 636
            Height = 26
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            Images = A4MainForm.ICONS_ACTIVE
            TabOrder = 0
            object btnAttrAdd: TToolButton
              Left = 0
              Top = 0
              ImageIndex = 2
              OnClick = btnAttrAddClick
            end
            object btnAttrEdit: TToolButton
              Left = 23
              Top = 0
              ImageIndex = 4
              OnClick = btnAttrEditClick
            end
            object btnAttrDel: TToolButton
              Left = 46
              Top = 0
              ImageIndex = 3
              OnClick = btnAttrDelClick
            end
          end
        end
        object tsHouseWorks: TTabSheet
          Caption = #1054#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1077
          ImageIndex = 3
          object dbgWorks: TDBGridEh
            Left = 0
            Top = 25
            Width = 636
            Height = 233
            Align = alClient
            DataSource = srcWork
            DynProps = <>
            Flat = True
            FooterParams.Color = clWindow
            TabOrder = 1
            Columns = <
              item
                AutoFitColWidth = False
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'DATE_PPR'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'SURNAME'
                Footers = <>
                Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
                Width = 99
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'NOTICE'
                Footers = <>
                Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                Width = 195
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object tlbWork: TToolBar
            Left = 0
            Top = 0
            Width = 636
            Height = 25
            Caption = 'tlbWork'
            Images = A4MainForm.ICONS_ACTIVE
            TabOrder = 0
            object btnHouseWorkAdd: TToolButton
              Left = 0
              Top = 0
              Action = actHouseWorkAdd
            end
            object btnHouseWorkEdit: TToolButton
              Left = 23
              Top = 0
              Action = actHouseWorkEdit
            end
            object btnHouseWorkDelete: TToolButton
              Left = 46
              Top = 0
              Action = actHouseWorkDelete
            end
          end
        end
        object tsAbonents: TTabSheet
          Caption = #1040#1073#1086#1085#1077#1085#1090#1099
          ImageIndex = 4
          object dbgCustomer: TDBGridEh
            Left = 0
            Top = 0
            Width = 636
            Height = 258
            Align = alClient
            AllowedOperations = []
            DataSource = srcCustomers
            DynProps = <>
            EditActions = [geaCopyEh, geaSelectAllEh]
            EvenRowColor = clInfoBk
            Flat = True
            FooterRowCount = 1
            FooterParams.Color = clWindow
            GridLineParams.VertEmptySpaceStyle = dessNonEh
            OddRowColor = clWindow
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit, dgMultiSelect]
            OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
            PopupMenu = pmCustomers
            ReadOnly = True
            SortLocal = True
            STFilter.Local = True
            STFilter.Visible = True
            SumList.Active = True
            TabOrder = 0
            TitleParams.MultiTitle = True
            TitleParams.VTitleMargin = 8
            OnGetCellParams = dbgCustomerGetCellParams
            Columns = <
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'ACCOUNT_NO'
                Footer.Value = #1048#1090#1086#1075#1086
                Footer.ValueType = fvtStaticText
                Footers = <>
                Title.Caption = #1051#1080#1094' '#1089#1095#1077#1090
                Title.TitleButton = True
                Width = 46
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'SURNAME'
                Footer.FieldName = 'ACCOUNT_NO'
                Footer.ValueType = fvtCount
                Footers = <>
                Title.Caption = #1050#1083#1080#1077#1085#1090'|'#1060#1072#1084#1080#1083#1080#1103
                Title.TitleButton = True
                Width = 99
                OnGetCellParams = dbgCustomerColumns1GetCellParams
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'INITIALS'
                Footers = <>
                Title.Caption = #1050#1083#1080#1077#1085#1090'|'#1048'.'#1054'.'
                Title.TitleButton = True
                Width = 30
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'PHONE_NO'
                Footers = <>
                Title.Caption = #1058#1077#1083#1077#1092#1086#1085
                Title.TitleButton = True
                Width = 52
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'PORCH_N'
                Footers = <>
                Title.Caption = #1040#1076#1088#1077#1089'|'#1087
                Title.TitleButton = True
                Title.SortIndex = 1
                Title.SortMarker = smDownEh
                Width = 30
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'FLOOR_N'
                Footers = <>
                Title.Caption = #1040#1076#1088#1077#1089'|'#1069
                Title.TitleButton = True
                Title.SortIndex = 2
                Title.SortMarker = smDownEh
                Width = 28
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'FLAT_NO'
                Footers = <>
                Title.Caption = #1040#1076#1088#1077#1089'|'#1050#1074
                Title.TitleButton = True
                Title.SortIndex = 3
                Title.SortMarker = smDownEh
                Width = 33
              end
              item
                CellButtons = <>
                DisplayFormat = '#,##0.##'
                DynProps = <>
                EditButtons = <>
                FieldName = 'DEBT_SUM'
                Footer.DisplayFormat = '#,###'
                Footer.FieldName = 'DEBT_SUM'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #1057#1072#1083#1100#1076#1086' '#1088#1072#1089#1095#1077#1090#1086#1074
                Title.TitleButton = True
                Width = 69
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'CUST_STATE_DESCR'
                Footers = <>
                Title.Caption = #1057#1090#1072#1090#1091#1089
                Title.TitleButton = True
                Width = 165
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'NOTICE'
                Footers = <>
                Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                Title.TitleButton = True
                Width = 200
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        object tsCircuit: TTabSheet
          Caption = #1057#1093#1077#1084#1072
          ImageIndex = 5
          object imgPNG: TDBImageEh
            Left = 0
            Top = 0
            Width = 636
            Height = 258
            Align = alClient
            DataField = 'PNG'
            DataSource = srcCirciut
            DynProps = <>
            EditButton.DefaultAction = True
            EditButton.DropdownMenu = pmCircuit
            EditButton.Visible = True
            PopupMenu = pmCircuit
            ReadOnly = True
            TabOrder = 0
            OnDblClick = imgPNGDblClick
          end
        end
      end
    end
  end
  inherited tlbMain: TToolBar
    Width = 993
    ExplicitWidth = 993
    inherited ToolButton4: TToolButton
      Width = 8
      ExplicitWidth = 8
    end
    inherited btnNew: TToolButton
      Left = 8
      ExplicitLeft = 8
    end
    inherited btnEdit: TToolButton
      Left = 31
      ExplicitLeft = 31
    end
    inherited ToolButton5: TToolButton
      Left = 54
      ExplicitLeft = 54
    end
    inherited ToolButton6: TToolButton
      Left = 58
      ExplicitLeft = 58
    end
    inherited btnDelete: TToolButton
      Left = 62
      ExplicitLeft = 62
    end
    inherited ToolButton9: TToolButton
      Left = 85
      ExplicitLeft = 85
    end
    inherited tbOk: TToolButton
      Left = 100
      Visible = False
      OnClick = tbOkClick
      ExplicitLeft = 100
    end
    inherited ToolButton10: TToolButton
      Left = 123
      ExplicitLeft = 123
    end
    inherited tbCancel: TToolButton
      Left = 127
      Visible = False
      OnClick = tbCancelClick
      ExplicitLeft = 127
    end
    inherited ToolButton20: TToolButton
      Left = 150
      ExplicitLeft = 150
    end
    inherited btnQuickFilter: TToolButton
      Left = 158
      ExplicitLeft = 158
    end
    object ToolButton12: TToolButton
      Left = 181
      Top = 0
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 28
      Style = tbsSeparator
      Visible = False
    end
    object ToolButton8: TToolButton
      Left = 189
      Top = 0
      Caption = 'ToolButton8'
      ImageIndex = 5
      OnClick = ToolButton8Click
    end
    object btn6: TToolButton
      Left = 212
      Top = 0
      Width = 8
      Caption = 'btn6'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object btnFindStreetCustomers: TToolButton
      Left = 220
      Top = 0
      Action = actFindStreetCustomers
    end
    object btn7: TToolButton
      Left = 243
      Top = 0
      Width = 8
      Caption = 'btn7'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object btnViewCube: TToolButton
      Left = 251
      Top = 0
      Action = actViewCube
    end
    object Label1: TLabel
      Left = 274
      Top = 0
      Width = 222
      Height = 22
      Align = alClient
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1059#1083#1080#1094#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
  end
  inherited pnlEdit: TPanel
    Width = 993
    Height = 50
    ExplicitWidth = 993
    ExplicitHeight = 50
    inherited btnSaveLink: TBitBtn
      Top = 17
      Width = 407
      ExplicitTop = 17
      ExplicitWidth = 407
    end
    inherited btnCancelLink: TBitBtn
      Left = 498
      Top = 17
      ExplicitLeft = 498
      ExplicitTop = 17
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsStreets
    Left = 672
    Top = 176
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 262
    Top = 176
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1083#1080#1094#1091
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1083#1080#1094#1091
      ShortCut = 0
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1091#1083#1080#1094#1091
      OnExecute = actEditExecute
    end
    object actHouseNew: TAction
      Caption = #1053#1086#1074#1099#1081' '#1076#1086#1084
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1084
      ImageIndex = 2
      ShortCut = 16429
      OnExecute = actHouseNewExecute
    end
    object actHouseEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1084
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1087#1086' '#1076#1086#1084#1091
      ImageIndex = 4
      ShortCut = 16497
      OnExecute = actHouseEditExecute
    end
    object actHouseDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1084
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1076#1086#1084#1077
      ImageIndex = 3
      OnExecute = actHouseDelExecute
    end
    object actQuickFilterHouse: TAction
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083'/'#1042#1099#1082#1083' '#1073#1099#1089#1090#1088#1086#1075#1086' '#1092#1080#1083#1100#1090#1088#1072
      ImageIndex = 40
      OnExecute = actQuickFilterHouseExecute
    end
    object actHouseInfo: TAction
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      Checked = True
      ImageIndex = 24
      OnExecute = actHouseInfoExecute
    end
    object actHouseWorkAdd: TAction
      Caption = 'actHouseWorkAdd'
      ImageIndex = 2
      OnExecute = actHouseWorkAddExecute
    end
    object actHouseWorkEdit: TAction
      Caption = 'actHouseWorkEdit'
      ImageIndex = 4
      OnExecute = actHouseWorkEditExecute
    end
    object actHouseWorkDelete: TAction
      Caption = 'actHouseWorkDelete'
      ImageIndex = 3
      OnExecute = actHouseWorkDeleteExecute
    end
    object actFindStreetCustomers: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1091#1083#1080#1094#1091' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1091#1083#1080#1094#1091' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      ImageIndex = 9
      OnExecute = actFindStreetCustomersExecute
    end
    object actFindHousCustomers: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1076#1086#1084' '#1074' '#1089#1087#1080#1089#1082#1077
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1076#1086#1084' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      ImageIndex = 9
      OnExecute = actFindHousCustomersExecute
    end
    object actFindCustomer: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1086#1074' '#1074' '#1089#1087#1080#1089#1082#1077
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1086#1074' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1073#1086#1077#1085#1090#1086#1074
      ImageIndex = 9
      OnExecute = actFindCustomerExecute
    end
    object actViewCube: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1074#1089#1077#1093' '#1091#1083#1080#1094' '#1080' '#1076#1086#1084#1086#1074
      ImageIndex = 93
      OnExecute = actViewCubeExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Top = 175
  end
  inherited CnErrors: TCnErrorProvider
    Left = 328
    Top = 176
  end
  object dsHouses: TpFIBDataSet
    UpdateSQL.Strings = (
      'update HOUSE H'
      'set h.NOTICE = :NOTICE'
      'where H.HOUSE_ID = :OLD_HOUSE_ID')
    DeleteSQL.Strings = (
      
        'execute procedure HOUSE_IUD('#39'D'#39', :HOUSE_ID, null, null, null, nu' +
        'll, null, '
      
        '    null, null, null, null, null, null, null, null, null, null, ' +
        'null)')
    RefreshSQL.Strings = (
      'select'
      '    ah.*,'
      
        '    iif((coalesce(ah.Q_Flat,0) <> 0), round(ah.CONNECTED *100 / ' +
        'ah.Q_Flat,1), 0.0) PERCENT'
      '  from (select'
      '            H.*,'
      '            (select'
      '                 count(distinct a.Flat_No)'
      '               from CUSTOMER A'
      '               where a.HOUSE_ID = h.HOUSE_ID'
      
        '                  and exists(select ash.Customer_Id from Subscr_' +
        'Hist ash where (a.Customer_Id = ash.Customer_Id) and (current_da' +
        'te between ash.Date_From and ash.Date_To))'
      '               ) as CONNECTED,'
      '            (select'
      '                 count(distinct a.Flat_No)'
      '               from CUSTOMER A'
      '               where a.HOUSE_ID = h.HOUSE_ID'
      
        '                  and not exists(select ash.Customer_Id from Sub' +
        'scr_Hist ash where (a.Customer_Id = ash.Customer_Id) and (curren' +
        't_date between ash.Date_From and ash.Date_To))'
      '                     ) as DISCONNECTED'
      '            , o.ORG_NAME, s.SUBAREA_NAME, w.name, he.he_name'
      '          from HOUSE H'
      
        '               left outer join ORGANIZATION o on (o.ORG_ID = h.O' +
        'RG_ID)'
      
        '               left outer join SUBAREA s on (s.SUBAREA_ID = h.SU' +
        'BAREA_ID)'
      
        '               left outer join WORKGROUPS w on (w.WG_ID = h.WG_I' +
        'D)'
      
        '               left outer join headend he on (he.he_id = h.heade' +
        'nd_id)'
      '          where h.street_id = :STREET_ID) ah'
      ''
      ''
      ''
      'where(  ah.street_id = :STREET_ID'
      '     ) and (     aH.HOUSE_ID = :OLD_HOUSE_ID'
      '     )'
      '    '
      ''
      ' ')
    SelectSQL.Strings = (
      'select'
      '    ah.*,'
      
        '    iif((coalesce(ah.Q_Flat,0) <> 0), round(ah.CONNECTED *100 / ' +
        'ah.Q_Flat,1), 0.0) PERCENT'
      '  from (select'
      '            H.*,'
      '            (select'
      '                 count(distinct a.Flat_No)'
      '               from CUSTOMER A'
      '               where a.HOUSE_ID = h.HOUSE_ID'
      
        '                  and exists(select ash.Customer_Id from Subscr_' +
        'Hist ash where (a.Customer_Id = ash.Customer_Id) and (current_da' +
        'te between ash.Date_From and ash.Date_To))'
      '               ) as CONNECTED,'
      '            (select'
      '                 count(distinct a.Flat_No)'
      '               from CUSTOMER A'
      '               where a.HOUSE_ID = h.HOUSE_ID'
      
        '                  and not exists(select ash.Customer_Id from Sub' +
        'scr_Hist ash where (a.Customer_Id = ash.Customer_Id) and (curren' +
        't_date between ash.Date_From and ash.Date_To))'
      '                     ) as DISCONNECTED'
      '            , o.ORG_NAME, s.SUBAREA_NAME, w.name, he.he_name'
      '          from HOUSE H'
      
        '               left outer join ORGANIZATION o on (o.ORG_ID = h.O' +
        'RG_ID)'
      
        '               left outer join SUBAREA s on (s.SUBAREA_ID = h.SU' +
        'BAREA_ID)'
      
        '               left outer join WORKGROUPS w on (w.WG_ID = h.WG_I' +
        'D)'
      
        '               left outer join headend he on (he.he_id = h.heade' +
        'nd_id)'
      '          where h.street_id = :STREET_ID) ah'
      '  order by house_no')
    AutoUpdateOptions.UpdateTableName = 'HOUSE'
    AutoUpdateOptions.KeyFields = 'HOUSE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    BeforePost = dsHousesBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 48
    Top = 374
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object dsStreets: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    STREET'
      'WHERE'
      '        STREET_ID = :OLD_STREET_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    s.*'
      '  , a.area_name'
      '  ,'
      '    (select'
      '         count(*)'
      '       from house h'
      '       where (h.street_id = s.street_id)) as HOUSES'
      '  ,'
      '    (select'
      '         sum(h.q_flat)'
      '       from house h'
      '       where (h.street_id = s.street_id)) as FLATS'
      ''
      '  , p.q_porch'
      '  from STREET s'
      '       left outer join area a on (a.area_id = s.area_id)'
      '       left outer join(select'
      '                           h.Street_Id'
      '                         , count(hp.Porch_N) q_porch'
      '                         from house h'
      
        '                              inner join Houseporch hp on (hp.Ho' +
        'use_Id = h.House_Id)'
      
        '                         group by 1) p on (p.Street_Id = s.Stree' +
        't_Id)'
      ''
      'where'
      '        S.STREET_ID = :OLD_STREET_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    s.*'
      '  , a.area_name'
      '  ,'
      '    (select'
      '         count(*)'
      '       from house h'
      '       where (h.street_id = s.street_id)) as HOUSES'
      '  ,'
      '    (select'
      '         sum(h.q_flat)'
      '       from house h'
      '       where (h.street_id = s.street_id)) as FLATS'
      ''
      '  , cast((select'
      '    list(distinct sa.SUBAREA_NAME)'
      '  from HOUSE H'
      '       inner join SUBAREA sA on (sA.SUBAREA_ID = h.SUBAREA_ID)'
      
        '  where h.street_id = s.street_id ) as VARCHAR(500)) SUBAREA_LIS' +
        'T'
      ''
      '  , cast((select'
      '    list(distinct w.Name)'
      '  from HOUSE H'
      '       inner join WORKGROUPS w on (w.WG_ID = h.WG_ID)   '
      '  where h.street_id = s.street_id ) as VARCHAR(500)) WG_LIST'
      ''
      ''
      '  , p.q_porch'
      '  from STREET s'
      '       left outer join area a on (a.area_id = s.area_id)'
      '       left outer join(select'
      '                           h.Street_Id'
      '                         , count(hp.Porch_N) q_porch'
      '                         from house h'
      
        '                              inner join Houseporch hp on (hp.Ho' +
        'use_Id = h.House_Id)'
      
        '                         group by 1) p on (p.Street_Id = s.Stree' +
        't_Id)'
      ''
      '  order by STREET_NAME, a.area_name')
    BeforePost = dsStreetsBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 112
    Top = 176
  end
  object srcHouses: TDataSource
    DataSet = dsHouses
    OnDataChange = srcHousesDataChange
    Left = 48
    Top = 426
  end
  object frxStreets: TfrxDBDataset
    UserName = #1059#1051#1048#1062#1067
    CloseDataSource = False
    FieldAliases.Strings = (
      'STREET_ID='#1059#1053#1048#1050'_N_'#1059#1051#1048#1062#1067
      'STREET_CODE='#1050#1054#1044'_'#1059#1051#1048#1062#1067
      'STREET_NAME='#1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
      'STREET_SHORT='#1057#1054#1050#1056#1040#1065#1045#1053#1048#1045
      'AREA_ID='#1059#1053#1048#1050'_N_'#1056#1040#1049#1054#1053#1040
      'AREA_NAME='#1056#1040#1049#1054#1053
      'NOTICE='#1055#1056#1048#1052#1045#1063#1040#1053#1048#1045)
    DataSet = dsStreets
    BCDToCurrency = False
    Left = 41
    Top = 179
  end
  object frxHouses: TfrxDBDataset
    UserName = #1044#1054#1052#1040
    CloseDataSource = False
    FieldAliases.Strings = (
      'HOUSE_ID='#1059#1053#1048#1050'_N_'#1044#1054#1052#1040
      'STREET_ID='#1059#1053#1048#1050'_N_'#1059#1051#1048#1062#1067
      'HOUSE_NO=N_'#1044#1054#1052#1040
      'Q_FLAT='#1050#1054#1051#1042#1054'_'#1050#1042#1040#1056#1058#1048#1056
      'SUBAREA_ID='#1050#1054#1044'_'#1059#1063#1040#1057#1058#1050#1040
      'PORCH='#1050#1054#1051#1042#1054'_'#1055#1054#1044#1066#1045#1047#1044#1054#1042
      'CHAIRMAN='#1055#1056#1045#1044#1057#1045#1044#1040#1058#1045#1051#1068
      'CHAIRMAN_PHONE='#1058#1045#1051#1045#1060#1054#1053'_'#1055#1056#1045#1044#1057#1045#1044#1040#1058#1045#1051#1071
      'NOTICE='#1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
      'DATE_PPR='#1044#1040#1058#1040'_'#1055#1055#1056
      'WORKER_PPR='#1050#1054#1044'_'#1048#1057#1055#1054#1051#1053#1048#1058#1045#1051#1071'_'#1055#1055#1056
      'CONNECTED='#1055#1054#1044#1050#1051#1070#1063#1045#1053#1053#1054
      'DISCONNECTED='#1054#1058#1050#1051#1070#1063#1045#1053#1053#1054
      'PERCENT='#1055#1056#1054#1062#1045#1053#1058
      'SUBAREA_NAME='#1059#1063#1040#1057#1058#1054#1050)
    DataSet = dsHouses
    BCDToCurrency = False
    Left = 514
    Top = 178
  end
  object dsHouseEquipment: TpFIBDataSet
    UpdateSQL.Strings = (
      ''
      '    ')
    SelectSQL.Strings = (
      'SELECT E.*'
      'FROM EQUIPMENT E'
      'WHERE E.HOUSE_ID =  :HOUSE_ID')
    AutoUpdateOptions.UpdateTableName = 'HOUSE'
    AutoUpdateOptions.KeyFields = 'HOUSE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    BeforePost = dsHousesBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcHouses
    Left = 183
    Top = 364
  end
  object srcHouseEquipment: TDataSource
    AutoEdit = False
    DataSet = dsHouseEquipment
    OnDataChange = srcHouseEquipmentDataChange
    Left = 408
    Top = 176
  end
  object dsHouseService: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      
        '    s.Name, iif(ss.state_sgn = 1, '#39#1055#1086#1076#1082#1083#1102#1095#1077#1085#1086#39', '#39#1054#1090#1082#1083#1102#1095#1077#1085#1086#39') srv' +
        '_state, ss.srv_count, ss.flats,'
      
        '    iif(ss.flats <> 0, round(100 * ss.srv_count / ss.flats, 0), ' +
        '0) as PERCENT'
      '  from services s'
      '       inner join(select'
      
        '                      ss.Serv_Id, ss.state_sgn, coalesce(h.Q_Fla' +
        't, 0) flats, count(*) srv_count'
      ''
      '                    from customer c'
      
        '                         inner join house h on (c.house_id = h.h' +
        'ouse_id)'
      
        '                         inner join subscr_serv ss on (ss.custom' +
        'er_id = c.customer_id)'
      '                    where h.house_id = :HOUSE_ID'
      
        '                    group by 1, 2, 3) ss on (s.service_id = ss.s' +
        'erv_id)'
      '  order by 1  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcHouses
    Left = 184
    Top = 408
  end
  object srcHouseService: TDataSource
    DataSet = dsHouseService
    Left = 288
    Top = 368
  end
  object dsFloor: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE HOUSEFLOOR'
      'SET '
      '    PORCH_ID = :PORCH_ID,'
      '    FLOOR_N = :FLOOR_N,'
      '    NOTICE = :NOTICE,'
      '    FLATS = :FLATS'
      'WHERE'
      '    FLOOR_ID = :OLD_FLOOR_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    HOUSEFLOOR'
      'WHERE'
      '        FLOOR_ID = :OLD_FLOOR_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO HOUSEFLOOR('
      '    FLOOR_ID,'
      '    PORCH_ID,'
      '    FLOOR_N,'
      '    NOTICE,'
      '    FLATS'
      ')'
      'VALUES('
      '    :FLOOR_ID,'
      '    :PORCH_ID,'
      '    :FLOOR_N,'
      '    :NOTICE,'
      '    :FLATS'
      ')')
    RefreshSQL.Strings = (
      'SELECT F.*'
      'FROM Housefloor F'
      'WHERE(  F.Porch_Id =  :Porch_Id'
      '     ) and (     F.FLOOR_ID = :OLD_FLOOR_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT F.*'
      'FROM Housefloor F'
      'WHERE F.Porch_Id =  :Porch_Id'
      'order by f.Floor_N')
    OnNewRecord = dsFloorNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcPorch
    Left = 182
    Top = 455
  end
  object dsPorch: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE HOUSEPORCH'
      'SET '
      '    HOUSE_ID = :HOUSE_ID,'
      '    PORCH_N = :PORCH_N,'
      '    FLOORS = :FLOORS,'
      '    GARRET = :GARRET,'
      '    CELLAR = :CELLAR,'
      '    FLAT_FROM = :FLAT_FROM,'
      '    FLAT_TO = :FLAT_TO,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    PORCH_ID = :OLD_PORCH_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    HOUSEPORCH'
      'WHERE'
      '        PORCH_ID = :OLD_PORCH_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO HOUSEPORCH('
      '    PORCH_ID,'
      '    HOUSE_ID,'
      '    PORCH_N,'
      '    FLOORS,'
      '    GARRET,'
      '    CELLAR,'
      '    FLAT_FROM,'
      '    FLAT_TO,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :PORCH_ID,'
      '    :HOUSE_ID,'
      '    :PORCH_N,'
      '    :FLOORS,'
      '    :GARRET,'
      '    :CELLAR,'
      '    :FLAT_FROM,'
      '    :FLAT_TO,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'SELECT P.*'
      'FROM Houseporch P'
      'WHERE(  P.House_Id = :House_Id'
      '     ) and (     P.PORCH_ID = :OLD_PORCH_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT P.*'
      'FROM Houseporch P'
      'WHERE P.House_Id = :House_Id'
      'order by p.porch_n')
    AutoUpdateOptions.UpdateTableName = 'HOUSEPORCH'
    AutoUpdateOptions.KeyFields = 'PORCH_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    OnNewRecord = dsPorchNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcHouses
    Left = 468
    Top = 340
  end
  object dsWorks: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    HOUSEWORKS'
      'WHERE'
      '        HW_ID = :OLD_HW_ID'
      '    ')
    RefreshSQL.Strings = (
      'SELECT w.hw_id, W.Date_Ppr, W.Worker_Ppr, s.Surname, W.Notice'
      
        'FROM Houseworks W  LEFT outer join Worker s on (w.Worker_Ppr = s' +
        '.Worker_Id)'
      ''
      'WHERE(  w.House_Id = :House_Id'
      '     ) and (     W.HW_ID = :OLD_HW_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      
        'SELECT w.*, s.Surname||'#39' '#39'||coalesce(s.FirstName,'#39#39')||'#39' '#39'||coale' +
        'sce(s.MidleName,'#39#39') as Surname'
      
        'FROM Houseworks W  LEFT outer join Worker s on (w.Worker_Ppr = s' +
        '.Worker_Id)'
      ''
      'WHERE w.House_Id = :House_Id'
      'order BY Date_Ppr desc')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcHouses
    Left = 288
    Top = 464
  end
  object srcFloor: TDataSource
    DataSet = dsFloor
    Left = 399
    Top = 399
  end
  object srcWork: TDataSource
    DataSet = dsWorks
    OnStateChange = srcWorkStateChange
    Left = 398
    Top = 454
  end
  object srcPorch: TDataSource
    DataSet = dsPorch
    Left = 402
    Top = 346
  end
  object dsCustomers: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CUSTOMER'
      'SET '
      '    CUST_CODE = :CUST_CODE,'
      '    HOUSE_ID = :HOUSE_ID,'
      '    ACCOUNT_NO = :ACCOUNT_NO,'
      '    DOGOVOR_NO = :DOGOVOR_NO,'
      '    SURNAME = :SURNAME,'
      '    FIRSTNAME = :FIRSTNAME,'
      '    MIDLENAME = :MIDLENAME,'
      '    INITIALS = :INITIALS,'
      '    CONTRACT_DATE = :CONTRACT_DATE,'
      '    ACTIVIZ_DATE = :ACTIVIZ_DATE,'
      '    PHONE_NO = :PHONE_NO,'
      '    NOTICE = :NOTICE,'
      '    VALID_TO = :VALID_TO,'
      '    CUST_STATE = :CUST_STATE,'
      '    CUST_STATE_DESCR = :CUST_STATE_DESCR,'
      '    CUST_PROP = :CUST_PROP,'
      '    CUST_PROP_DESCR = :CUST_PROP_DESCR,'
      '    FLAT_NO = :FLAT_NO,'
      '    PASSPORT_NUMBER = :PASSPORT_NUMBER,'
      '    PASSPORT_REGISTRATION = :PASSPORT_REGISTRATION,'
      '    MANAGER_ID = :MANAGER_ID,'
      '    JURIDICAL = :JURIDICAL,'
      '    JUR_INN = :JUR_INN,'
      '    JUR_DIRECTOR = :JUR_DIRECTOR,'
      '    JUR_BUH = :JUR_BUH,'
      '    CGIS = :CGIS,'
      '    MOBILE_PHONE = :MOBILE_PHONE, '
      '    HIS_COLOR = :HIS_COLOR'
      'WHERE'
      '    CUSTOMER_ID = :OLD_CUSTOMER_ID'
      '    ')
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE DELETE_CUSTOMER(:CUSTOMER_ID)'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CUSTOMER('
      '    CUSTOMER_ID,'
      '    CUST_CODE,'
      '    HOUSE_ID,'
      '    ACCOUNT_NO,'
      '    DOGOVOR_NO,'
      '    SURNAME,'
      '    FIRSTNAME,'
      '    MIDLENAME,'
      '    INITIALS,'
      '    CONTRACT_DATE,'
      '    ACTIVIZ_DATE,'
      '    PHONE_NO,'
      '    NOTICE,'
      '    VALID_TO,'
      '    CUST_STATE,'
      '    CUST_STATE_DESCR,'
      '    CUST_PROP,'
      '    CUST_PROP_DESCR,'
      '    FLAT_NO,'
      '    DEBT_SUM,'
      '    PASSPORT_NUMBER,'
      '    PASSPORT_REGISTRATION,'
      '    MANAGER_ID,'
      '    JURIDICAL,'
      '    JUR_INN,'
      '    JUR_DIRECTOR,'
      '    JUR_BUH,'
      '    CGIS,'
      '    MOBILE_PHONE,'
      '    HIS_COLOR'
      ')'
      'VALUES('
      '    :CUSTOMER_ID,'
      '    :CUST_CODE,'
      '    :HOUSE_ID,'
      '    :ACCOUNT_NO,'
      '    :DOGOVOR_NO,'
      '    :SURNAME,'
      '    :FIRSTNAME,'
      '    :MIDLENAME,'
      '    :INITIALS,'
      '    :CONTRACT_DATE,'
      '    :ACTIVIZ_DATE,'
      '    :PHONE_NO,'
      '    :NOTICE,'
      '    :VALID_TO,'
      '    :CUST_STATE,'
      '    :CUST_STATE_DESCR,'
      '    :CUST_PROP,'
      '    :CUST_PROP_DESCR,'
      '    :FLAT_NO,'
      '    0,'
      '    :PASSPORT_NUMBER,'
      '    :PASSPORT_REGISTRATION,'
      '    :MANAGER_ID,'
      '    :JURIDICAL,'
      '    :JUR_INN,'
      '    :JUR_DIRECTOR,'
      '    :JUR_BUH,'
      '    :CGIS,'
      '    :MOBILE_PHONE,'
      '    :HIS_COLOR'
      ')')
    RefreshSQL.Strings = (
      'select'
      'C.*'
      ',s.street_short'
      ',S.Street_Name'
      ',H.House_No'
      ',h.Street_ID'
      ',-1*c.debt_sum as BALANCE'
      
        ', (select count(*) from SUBSCR_SERV ss where ss.CUSTOMER_ID = c.' +
        'CUSTOMER_ID and ss.STATE_SGN = 1) as connected'
      'FROM CUSTOMER C'
      '   INNER JOIN HOUSE H ON (C.HOUSE_ID = H.HOUSE_ID)'
      '   INNER JOIN STREET S ON (H.STREET_ID = S.STREET_ID)'
      'where(     C.CUSTOMER_ID = :OLD_CUSTOMER_ID     )'
      '')
    SelectSQL.Strings = (
      'select'
      'c.CUSTOMER_ID, '
      'c.ACCOUNT_NO, '
      'c.SURNAME, '
      'c.INITIALS, '
      'c.PHONE_NO, '
      'c.NOTICE, '
      'c.CUST_STATE_DESCR, '
      'c.FLAT_NO, '
      'c.DEBT_SUM, '
      'c.HIS_COLOR'
      ',f.PORCH_N'
      ',f.FLOOR_N'
      ',-1*c.debt_sum as BALANCE'
      
        'FROM CUSTOMER C left outer join Houseflats f on (c.House_Id = f.' +
        'House_Id and c.Flat_No = f.Flat_No)'
      'WHERE c.House_id = :HOUSE_ID'
      'order by 11, 12, C.flat_no')
    AutoUpdateOptions.UpdateTableName = 'CUSTOMER'
    AutoUpdateOptions.KeyFields = 'CUSTOMER_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_CUSTOMER_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcHouses
    Left = 592
    Top = 344
    poUseBooleanField = False
    poSetRequiredFields = True
    oVisibleRecno = True
    oFetchAll = True
  end
  object srcCustomers: TDataSource
    DataSet = dsCustomers
    Left = 404
    Top = 504
  end
  object PropStorage: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'Panel1.<P>.Height'
      'Panel1.DbGridHouse.<P>.Width'
      'Panel1.pnlHouseInfo.pcHouseInfo.<P>.ActivePage')
    Left = 590
    Top = 175
  end
  object dsFlats: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE HOUSEFLATS'
      'SET '
      '    HOUSE_ID = :HOUSE_ID,'
      '    FLAT_NO = :FLAT_NO,'
      '    PORCH_N = :PORCH_N,'
      '    FLOOR_N = :FLOOR_N,'
      '    NOTICE = :NOTICE,'
      '    OWNER_NAME = :OWNER_NAME,'
      '    OWNER_DOC = :OWNER_DOC    '
      'WHERE'
      '    HOUSE_ID = :OLD_HOUSE_ID'
      '    and FLAT_NO = :OLD_FLAT_NO'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    HOUSEFLATS'
      'WHERE'
      '        HOUSE_ID = :OLD_HOUSE_ID'
      '    and FLAT_NO = :OLD_FLAT_NO'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO HOUSEFLATS('
      '    HOUSE_ID,'
      '    FLAT_NO,'
      '    PORCH_N,'
      '    FLOOR_N,'
      '    NOTICE,'
      '    OWNER_NAME,'
      '    OWNER_DOC'
      ')'
      'VALUES('
      '    :HOUSE_ID,'
      '    :FLAT_NO,'
      '    :PORCH_N,'
      '    :FLOOR_N,'
      '    :NOTICE,'
      '    :OWNER_NAME,'
      '    :OWNER_DOC    '
      ')')
    RefreshSQL.Strings = (
      'select'
      '    F.*'
      '  , n.NAME NODE'
      '  from houseflats F'
      
        '       left outer join Node_Flats nf on (nf.House_Id = f.House_I' +
        'd and nf.Flat_No = f.Flat_No)'
      '       left outer join nodes n on (n.NODE_ID = nf.NODE_ID)'
      'WHERE  F.house_id =  :HOUSE_ID'
      '     and  F.FLAT_NO = :OLD_FLAT_NO'
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    F.*'
      '  , n.NAME NODE'
      '  from houseflats F'
      
        '       left outer join Node_Flats nf on (nf.House_Id = f.House_I' +
        'd and nf.Flat_No = f.Flat_No)'
      '       left outer join nodes n on (n.NODE_ID = nf.NODE_ID)'
      '  where F.house_id = :HOUSE_ID'
      '  order by f.porch_n, f.Floor_N, f.Flat_No')
    AutoUpdateOptions.UpdateTableName = 'HOUSEFLATS'
    AutoUpdateOptions.KeyFields = 'HF_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    OnNewRecord = dsFlatsNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcHouses
    Left = 528
    Top = 337
  end
  object srcFlats: TDataSource
    DataSet = dsFlats
    OnDataChange = srcFlatsDataChange
    Left = 399
    Top = 399
  end
  object pmCustomers: TPopupMenu
    Left = 529
    Top = 458
    object N1: TMenuItem
      Action = actFindCustomer
    end
  end
  object pmCircuit: TPopupMenu
    Left = 672
    Top = 440
    object mniCircuitView: TMenuItem
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      OnClick = mniCircuitViewClick
    end
    object mniN2: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnClick = mniN2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object miPNG1: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1082#1072#1088#1090#1080#1085#1082#1091
      Hint = #1060#1072#1081#1083' '#1092#1086#1088#1084#1072#1090#1072' JPG '#1080#1083#1080' PNG'
      OnClick = miPNG1Click
    end
    object miN4: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = N2Click
    end
  end
  object dsCirciut: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE HOUSE_CIRCUIT'
      'SET '
      '    HOUSE_ID = :HOUSE_ID,'
      '    NAME = :NAME,'
      '    CIRCUIT = :CIRCUIT,'
      '    PNG = :PNG,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    HC_ID = :OLD_HC_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    HOUSE_CIRCUIT'
      'WHERE'
      '        HC_ID = :OLD_HC_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO HOUSE_CIRCUIT('
      '    HC_ID,'
      '    HOUSE_ID,'
      '    NAME,'
      '    CIRCUIT,'
      '    PNG,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :HC_ID,'
      '    :HOUSE_ID,'
      '    :NAME,'
      '    :CIRCUIT,'
      '    :PNG,'
      '    :NOTICE'
      ')'
      'returning HC_ID'
      ' ')
    RefreshSQL.Strings = (
      'select'
      'hc.*'
      'from HOUSE_CIRCUIT hc'
      'where(  house_id = 1018'
      '     ) and (     HC.HC_ID = :OLD_HC_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      'hc.*'
      'from HOUSE_CIRCUIT hc'
      'where house_id = :house_id ')
    OnNewRecord = dsCirciutNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcHouses
    Left = 584
    Top = 424
    object dsCirciutHC_ID: TFIBIntegerField
      FieldName = 'HC_ID'
    end
    object dsCirciutHOUSE_ID: TFIBIntegerField
      FieldName = 'HOUSE_ID'
    end
    object dsCirciutNAME: TFIBWideStringField
      FieldName = 'NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object dsCirciutCIRCUIT: TFIBBlobField
      FieldName = 'CIRCUIT'
      Size = 8
    end
    object dsCirciutPNG: TFIBBlobField
      FieldName = 'PNG'
      BlobType = ftGraphic
      Size = 8
    end
    object dsCirciutNOTICE: TFIBWideStringField
      FieldName = 'NOTICE'
      Size = 1000
      EmptyStrToNull = True
    end
  end
  object srcCirciut: TDataSource
    DataSet = dsCirciut
    Left = 696
    Top = 496
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 744
    Top = 424
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 744
    Top = 488
  end
  object dsAttributes: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SERVICES_LINKS'
      'SET '
      '    LINK_TYPE = 6,'
      '    PARENT = :PARENT,'
      '    CHILD = :CHILD,'
      '    ADD_SRV = :ADD_SRV,    '
      '    DESCRIPTION = :DESCRIPTION'
      'WHERE'
      '    LINK_ID = :OLD_LINK_ID'
      '    '
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SERVICES_LINKS'
      'WHERE'
      '        LINK_ID = :OLD_LINK_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SERVICES_LINKS('
      '    LINK_ID,'
      '    LINK_TYPE,'
      '    PARENT,'
      '    CHILD,'
      '    ADD_SRV,'
      '    DESCRIPTION'
      ')'
      'VALUES('
      '    :LINK_ID,'
      '    6,'
      '    :PARENT,'
      '    :CHILD,'
      '    :ADD_SRV,'
      '    :DESCRIPTION'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    l.*, s.Name as SwitchTo, o.Name as SwitchSrv'
      '  from SERVICES_LINKS l'
      '       inner join services s on (s.Service_Id = l.Child)'
      '       inner join services o on (o.Service_Id = l.Add_Srv)'
      '  where L.LINK_ID = :OLD_LINK_ID'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      
        '    o.O_Name ||coalesce('#39'. '#39'||o.O_DIMENSION,'#39#39')||coalesce('#39'. '#39'||' +
        'o.O_DESCRIPTION, '#39#39') O_Name, '
      '    o.O_Id, '
      '    coalesce(o.O_CHARFIELD, '#39#39') VLIST,'
      '    coalesce(o.O_CHECK, '#39#39') REGEXP'
      '  from objects o'
      '  where o.O_Type = 37'
      '        and ((not exists(select'
      '                           sa.O_Id'
      '                         from houses_Attributes sa'
      '                         where sa.O_Id = o.O_Id'
      '                               and sa.house_Id = :HOUSE_Id))'
      '             or (o.O_Id = coalesce(:O_Id, -1)))'
      '  order by o.O_Name')
    AutoUpdateOptions.UpdateTableName = 'SERVICES_LINKS'
    AutoUpdateOptions.KeyFields = 'LINK_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 811
    Top = 358
    oFetchAll = True
  end
  object srcAttributes: TDataSource
    AutoEdit = False
    DataSet = dsAttributes
    Left = 805
    Top = 414
  end
  object srcHousesAttr: TDataSource
    AutoEdit = False
    DataSet = dsHousesAttr
    Left = 893
    Top = 430
  end
  object dsHousesAttr: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE HOUSES_ATTRIBUTES'
      'SET '
      '    HA_VALUE = :HA_VALUE,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    HA_ID = :OLD_HA_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    HOUSES_ATTRIBUTES'
      'WHERE'
      '        HA_ID = :OLD_HA_ID'
      ''
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO HOUSES_ATTRIBUTES('
      '    HOUSE_Id,'
      '    HA_VALUE,'
      '    NOTICE,'
      '    HA_ID,'
      '    O_ID'
      ')'
      'VALUES('
      '    :HOUSE_ID,'
      '    :HA_VALUE,'
      '    :NOTICE,'
      '    :HA_ID,'
      '    :O_ID'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    o.O_Name, o.O_DIMENSION, o.O_DESCRIPTION, sa.*'
      '  from Houses_Attributes sa'
      
        '       inner join objects o on (o.O_Id = sa.O_Id and o.O_Type = ' +
        '37)'
      '  where(  sa.HOUSE_Id = :HOUSE_Id'
      '     ) and (     SA.HOUSE_ID = :OLD_HOUSE_ID'
      '    and SA.O_ID = :OLD_O_ID'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    o.O_Name, o.O_DIMENSION, o.O_DESCRIPTION, sa.*'
      '  from Houses_Attributes sa'
      
        '       inner join objects o on (o.O_Id = sa.O_Id and o.O_Type = ' +
        '37)'
      '  where sa.HOUSE_Id = :HOUSE_Id'
      '  order by o.O_Name  ')
    AutoUpdateOptions.UpdateTableName = 'SERVICES_LINKS'
    AutoUpdateOptions.KeyFields = 'LINK_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    OnNewRecord = dsHousesAttrNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcHouses
    Left = 891
    Top = 366
    oFetchAll = True
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '*.png'
    Filter = 'png, jpg|*.png;*.jp*g'
    Left = 680
    Top = 344
  end
end
