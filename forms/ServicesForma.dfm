object ServicesForm: TServicesForm
  Left = 848
  Top = 62
  Caption = #1059#1089#1083#1091#1075#1080
  ClientHeight = 533
  ClientWidth = 836
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 285
    Width = 836
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 235
    ExplicitWidth = 828
  end
  object pcServices: TPageControl
    Left = 0
    Top = 26
    Width = 836
    Height = 259
    ActivePage = tsAbonent
    Align = alClient
    TabOrder = 1
    OnChange = pcServicesChange
    OnChanging = pcServicesChanging
    ExplicitHeight = 263
    object tsAbonent: TTabSheet
      Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1091#1089#1083#1091#1075#1080
      ExplicitHeight = 235
      object ASGrid: TDBGridEh
        Left = 0
        Top = 0
        Width = 828
        Height = 231
        Align = alClient
        AllowedOperations = []
        DataSource = srcServices
        DrawMemoText = True
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        ParentShowHint = False
        SearchPanel.Enabled = True
        SearchPanel.FilterOnTyping = True
        ShowHint = True
        SortLocal = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnDblClick = ASGridDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 157
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SHORTNAME'
            Footers = <>
            Title.Caption = #1050#1086#1076
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FIZ_TAR'
            Footers = <>
            Title.Caption = #1058#1072#1088#1080#1092' '#1085#1072' '#1089#1077#1075#1086#1076#1085#1103
            Title.TitleButton = True
            Width = 53
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DIMENSION'
            Footers = <>
            Title.Caption = #1045#1076'. '#1080#1079#1084'.'
            Title.TitleButton = True
            Width = 43
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'SHOW_SERVICE'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.Caption = #1040#1082#1090#1080#1074#1085#1072
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SHIFT_MONTHS'
            Footers = <>
            Title.Caption = #1057#1084#1077#1097#1077'- '#1085#1080#1077
            Title.Hint = #1057#1084#1077#1097#1077#1085#1080#1077' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086' '#1084#1077#1089#1103#1094#1072' '#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1086' '#1079#1072#1082#1088#1099#1074#1072#1077#1084#1086#1075#1086' '#1087#1077#1088#1080#1086#1076#1072
            Title.TitleButton = True
            Width = 58
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 90
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'O_NAME'
            Footers = <>
            Title.Caption = #1042#1080#1076' '#1091#1095#1077#1090#1072
            Title.TitleButton = True
            Width = 73
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BUSINESS'
            Footers = <>
            Title.Caption = #1042#1080#1076' '#1091#1089#1083#1091#1075#1080
            Title.TitleButton = True
            Width = 45
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ACT_CUST'
            Footers = <>
            Title.Caption = #1040#1082#1090'. '#1072#1073#1086#1085#1077#1085#1090#1086#1074
            Title.Hint = #1050#1086#1083'-'#1074#1086' '#1072#1073#1086#1085#1077#1085#1090#1086#1074' '#1089' '#1074#1082#1083'. '#1091#1089#1083#1091#1075#1086#1081' '#1085#1072' '#1089#1077#1075#1086#1076#1085#1103
            Title.TitleButton = True
            Width = 75
          end
          item
            Alignment = taLeftJustify
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CALC_TYPE'
            Footers = <>
            KeyList.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5')
            PickList.Strings = (
              #1056#1072#1079' '#1074' '#1084#1077#1089#1103#1094' ( '#1087#1088#1086#1087#1086#1088#1094#1080#1086#1085#1072#1083#1100#1085#1086' '#1076#1085#1103#1084')'
              #1055#1086#1083#1085#1099#1081'/0'
              #1045#1078#1077#1076#1085#1077#1074#1085#1099#1081
              '1-'#1099#1081' '#1084#1077#1089#1103#1094' '#1087#1088#1086#1087#1086#1088#1094#1080#1086#1085#1072#1083#1100#1085#1086' '#1076#1085#1103#1084', '#1076#1072#1083#1077#1077' '#1055#1054#1051#1053#1067#1049' '#1090#1072#1088#1080#1092' '
              #1044#1086#1085#1072#1095#1080#1089#1083#1077#1085#1080#1077
              #1045#1078#1077#1076#1085#1077#1074#1085#1099#1081' '#1089#1095#1080#1090#1072#1077#1084)
            Title.Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
            Title.TitleButton = True
            Width = 83
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Priority'
            Footers = <>
            Title.Caption = '^'
            Title.Hint = #1055#1088#1080#1086#1088#1080#1090#1077#1090
            Title.TitleButton = True
            Width = 24
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DESCRIPTION'
            Footers = <>
            Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1076#1083#1103' '#1072#1073#1086#1085#1077#1085#1090#1072
            Title.TitleButton = True
            Width = 150
          end
          item
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'AUTOOFF'
            Footers = <>
            Title.Caption = #1040'-'#1073#1083'.'
            Title.Hint = #1040#1074#1090#1086#1073#1083#1086#1082#1080#1088#1086#1074#1082#1072
            Width = 34
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ATR_LIST'
            Footers = <>
            Title.Caption = #1040#1090#1088#1080#1073#1091#1090#1099
            Title.TitleButton = True
            Width = 80
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsSingle: TTabSheet
      Tag = 1
      Caption = #1056#1072#1079#1086#1074#1099#1077' '#1091#1089#1083#1091#1075#1080
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object ssGrid: TDBGridEh
        Left = 0
        Top = 0
        Width = 828
        Height = 235
        Align = alClient
        AllowedOperations = []
        DataSource = srcServices
        DrawMemoText = True
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        ParentShowHint = False
        SearchPanel.Enabled = True
        SearchPanel.FilterOnTyping = True
        ShowHint = True
        SortLocal = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnDblClick = ASGridDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 157
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SHORTNAME'
            Footers = <>
            Title.Caption = #1050#1086#1076
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FIZ_TAR'
            Footers = <>
            Title.Caption = #1058#1072#1088#1080#1092' '#1085#1072' '#1089#1077#1075#1086#1076#1085#1103
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DIMENSION'
            Footers = <>
            Title.Caption = #1045#1076'.'#1080#1079#1084'.'
            Title.TitleButton = True
            Width = 43
          end
          item
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'SHOW_SERVICE'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.Caption = #1040#1082#1090#1080#1074#1085#1072
            Title.TitleButton = True
            Width = 38
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DESCRIPTION'
            Footers = <>
            Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 150
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'O_NAME'
            Footers = <>
            Title.Caption = #1042#1080#1076' '#1091#1095#1077#1090#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BUSINESS'
            Footers = <>
            Title.Caption = #1042#1080#1076' '#1091#1089#1083#1091#1075#1080
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ATR_LIST'
            Footers = <>
            Title.Caption = #1040#1090#1088#1080#1073#1091#1090#1099
            Title.TitleButton = True
            Width = 74
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsFact: TTabSheet
      Tag = 2
      Caption = #1059#1089#1083#1091#1075#1080' '#1087#1086' '#1092#1072#1082#1090#1091
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object fsGrid: TDBGridEh
        Left = 0
        Top = 0
        Width = 828
        Height = 235
        Align = alClient
        AllowedOperations = []
        DataSource = srcServices
        DrawMemoText = True
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        ParentShowHint = False
        SearchPanel.Enabled = True
        SearchPanel.FilterOnTyping = True
        ShowHint = True
        SortLocal = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnDblClick = ASGridDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 157
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SHORTNAME'
            Footers = <>
            Title.Caption = #1050#1086#1076
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DIMENSION'
            Footers = <>
            Title.Caption = #1045#1076'.'#1080#1079#1084'.'
            Title.TitleButton = True
            Width = 43
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'SHOW_SERVICE'
            Footers = <>
            KeyList.Strings = (
              '1'
              '0')
            Title.Caption = #1040#1082#1090#1080#1074#1085#1072
            Title.TitleButton = True
            Width = 37
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DESCRIPTION'
            Footers = <>
            Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 150
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'O_NAME'
            Footers = <>
            Title.Caption = #1042#1080#1076' '#1091#1095#1077#1090#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BUSINESS'
            Footers = <>
            Title.Caption = #1042#1080#1076' '#1091#1089#1083#1091#1075#1080
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ATR_LIST'
            Footers = <>
            Title.Caption = #1040#1090#1088#1080#1073#1091#1090#1099
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object ToolBar2: TToolBar
    Left = 0
    Top = 0
    Width = 836
    Height = 26
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Images = A4MainForm.ICONS_ACTIVE
    TabOrder = 0
    object tbSrvAdd: TToolButton
      Left = 0
      Top = 0
      Action = actAddSrv
    end
    object tbSrvEdit: TToolButton
      Left = 23
      Top = 0
      Action = actEditSrv
    end
    object ToolButton2: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object tbSrvDelete: TToolButton
      Left = 54
      Top = 0
      Action = actDelSrv
    end
    object ToolButton1: TToolButton
      Left = 77
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 4
      Style = tbsSeparator
      Visible = False
    end
    object tbSrvOk: TToolButton
      Left = 85
      Top = 0
      Caption = 'tbSrvOk'
      Enabled = False
      ImageIndex = 25
      Visible = False
      OnClick = tbSrvOkClick
    end
    object tbSrvCancel: TToolButton
      Left = 108
      Top = 0
      Caption = 'tbSrvCancel'
      Enabled = False
      ImageIndex = 26
      Visible = False
      OnClick = tbSrvCancelClick
    end
    object btn1: TToolButton
      Left = 131
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 28
      Style = tbsSeparator
    end
    object btnQF: TToolButton
      Left = 139
      Top = 0
      Caption = 'btnQF'
      ImageIndex = 33
      OnClick = btnQFClick
    end
    object chkHideOld: TCheckBox
      Left = 162
      Top = 0
      Width = 183
      Height = 22
      TabStop = False
      Alignment = taLeftJustify
      Caption = '   '#1057#1082#1088#1099#1090#1100' '#1085#1077#1072#1082#1090#1080#1074#1085#1099#1077' '#1091#1089#1083#1091#1075#1080
      TabOrder = 0
      OnClick = chkHideOldClick
    end
  end
  object AddonPage: TPageControl
    Left = 0
    Top = 290
    Width = 836
    Height = 243
    ActivePage = tsTarif
    Align = alBottom
    TabOrder = 2
    OnChange = AddonPageChange
    ExplicitTop = 294
    object tsTarif: TTabSheet
      Caption = #1058#1072#1088#1080#1092#1099
      object trfGrid: TDBGridEh
        Left = 28
        Top = 0
        Width = 800
        Height = 215
        Align = alClient
        AllowedOperations = []
        DataSource = srcTarif
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        SortLocal = True
        TabOrder = 0
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DATE_FROM'
            Footers = <>
            Title.Caption = #1057' '#1076#1072#1090#1099
            Width = 107
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DATE_TO'
            Footers = <>
            Title.Caption = #1055#1086' '#1076#1072#1090#1091
            Width = 93
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'TARIF_SUM'
            Footers = <>
            Title.Caption = #1058#1072#1088#1080#1092
            Width = 150
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'TARIF_SUM_JUR'
            Footers = <>
            Title.Caption = #1058#1072#1088#1080#1092' '#1102#1088'. '#1083#1080#1094
            Width = 150
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'VAT'
            Footers = <>
            Title.Caption = #1053#1044#1057
            Width = 61
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WHO_LAST'
            Footers = <>
            Title.Caption = #1050#1090#1086
            Width = 89
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            Title.Caption = #1050#1086#1075#1076#1072
            Width = 91
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnlPST: TPanel
        Left = 0
        Top = 0
        Width = 28
        Height = 215
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          28
          215)
        object btnPSTDel: TSpeedButton
          Left = 2
          Top = 192
          Width = 22
          Height = 22
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1072#1088#1080#1092
          Anchors = [akLeft, akBottom]
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008C98D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008390D500FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF008693D600334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00465CCE00334CCC007584D300FF00FF00FF00FF00FF00FF00909C
            D700334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00
            FF00465CCE00334CCC00334CCC00334CCC00808ED500FF00FF00FF00FF00FF00
            FF00445ACE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00465C
            CE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00445ACE00334CCC00334CCC00334CCC003D54CD00455BCE00334C
            CC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334CCC00334C
            CC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334C
            CC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334C
            CC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334CCC00334C
            CC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00465CCE00334CCC00334CCC00334CCC004057CD00445ACE00334C
            CC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00465CCE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00445A
            CE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00ABB2
            DA00364ECC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
            FF00445ACE00334CCC00334CCC00354DCC00A4ACD900FF00FF00FF00FF00FF00
            FF00A7AFDA00364ECC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00445ACE00354DCC00A2ABD900FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00A9B1DA00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00A6AED900FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          Layout = blGlyphTop
          OnClick = btnPSTDelClick
        end
        object btnPSTAdd: TSpeedButton
          Left = 2
          Top = 3
          Width = 22
          Height = 22
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1072#1088#1080#1092
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008DAF
            5D008BAE59008BAE59008BAE59008BAE590089AD560089AD560089AD560089AD
            56008BAE59008BAE59008BAE59008BAE59008BAE5900FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF008FB160008FB160008FB160008FB1
            6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = btnPSTAddClick
        end
      end
    end
    object tsLink: TTabSheet
      Caption = #1042#1082#1083#1102#1095#1077#1085#1080#1077' / '#1054#1090#1082#1083#1102#1095#1077#1085#1080#1077
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TPanel
        Left = 28
        Top = 0
        Width = 800
        Height = 215
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel2'
        TabOrder = 0
        object dbgLink: TDBGridEh
          Left = 0
          Top = 100
          Width = 800
          Height = 115
          Align = alClient
          AllowedOperations = []
          DataSource = srcLinks
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghColumnResize, dghColumnMove]
          SortLocal = True
          TabOrder = 1
          OnDblClick = dbgLinkDblClick
          Columns = <
            item
              Alignment = taLeftJustify
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'LINK_TYPE'
              Footers = <>
              KeyList.Strings = (
                '2'
                '3'
                '4'
                '5'
                '7'
                '8')
              PickList.Strings = (
                #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1087#1077#1088#1074#1080#1095#1085#1086#1077
                #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1087#1086#1074#1090#1086#1088#1085#1086#1077
                #1054#1090#1082#1083#1102#1095#1077#1085#1080#1077' '#1087#1086' '#1079#1072#1103#1074#1083#1077#1085#1080#1102
                #1054#1090#1082#1083#1102#1095#1077#1085#1080#1077' '#1079#1072' '#1085#1077#1091#1087#1083#1072#1090#1091
                'WEB - '#1042#1082#1083#1102#1095#1077#1085#1080#1077
                'WEB - '#1054#1090#1082#1083#1102#1095#1077#1085#1080#1077)
              Title.Caption = #1058#1080#1087
              Width = 157
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              Title.Caption = #1059#1089#1083#1091#1075#1072' '#1074#1082#1083#1102#1095#1077#1085#1080#1103'/'#1086#1090#1082#1083#1102#1095#1077#1085#1080#1103
              Width = 221
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DESCRIPTION'
              Footers = <>
              Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
              Width = 260
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pnlLink: TPanel
          Left = 0
          Top = 0
          Width = 800
          Height = 100
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          Visible = False
          DesignSize = (
            800
            100)
          object Label6: TLabel
            Left = 6
            Top = 8
            Width = 88
            Height = 13
            Caption = #1058#1080#1087' '#1087#1086#1076#1082#1083'./'#1086#1090#1082#1083'.'
          end
          object Label7: TLabel
            Left = 376
            Top = 8
            Width = 74
            Height = 13
            Anchors = [akLeft, akTop, akRight]
            Caption = #1050#1072#1082#1086#1081' '#1091#1089#1083#1091#1075#1086#1081
          end
          object Label8: TLabel
            Left = 6
            Top = 35
            Width = 61
            Height = 13
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          end
          object cbbCHILD: TDBLookupComboboxEh
            Left = 458
            Top = 5
            Width = 340
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DynProps = <>
            DataField = 'CHILD'
            DataSource = srcLinks
            EditButtons = <>
            KeyField = 'SERVICE_ID'
            ListField = 'NAME'
            ListSource = srcONOFFServices
            TabOrder = 1
            Visible = True
          end
          object btnSaveLink: TBitBtn
            Left = 98
            Top = 72
            Width = 586
            Height = 25
            Anchors = [akLeft, akRight, akBottom]
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            TabOrder = 3
            OnClick = btnSaveLinkClick
          end
          object btnCancelLink: TBitBtn
            Left = 690
            Top = 72
            Width = 108
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = #1054#1090#1084#1077#1085#1072
            TabOrder = 4
            OnClick = btnCancelLinkClick
          end
          object dbmmoDESCRIPTION: TDBMemoEh
            Left = 98
            Top = 32
            Width = 700
            Height = 34
            ScrollBars = ssVertical
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoSize = False
            DataField = 'DESCRIPTION'
            DataSource = srcLinks
            DynProps = <>
            EditButtons = <>
            TabOrder = 2
            Visible = True
            WantReturns = True
          end
          object cbLINK_TYPE: TDBComboBoxEh
            Left = 100
            Top = 5
            Width = 268
            Height = 21
            DataField = 'LINK_TYPE'
            DataSource = srcLinks
            DynProps = <>
            EditButtons = <>
            Items.Strings = (
              #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1087#1077#1088#1074#1080#1095#1085#1086#1077
              #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1087#1086#1074#1090#1086#1088#1085#1086#1077
              #1054#1090#1082#1083#1102#1095#1077#1085#1080#1077' '#1087#1086' '#1079#1072#1103#1074#1083#1077#1085#1080#1102
              #1054#1090#1082#1083#1102#1095#1077#1085#1080#1077' '#1079#1072' '#1085#1077#1091#1087#1083#1072#1090#1091
              #1042#1082#1083#1102#1095#1077#1085#1080#1077' '#1095#1077#1088#1077#1079' '#1082#1072#1073#1080#1085#1077#1090' (WEB/'#1050#1083#1080#1077#1085#1090')'
              #1054#1090#1082#1083#1102#1095#1077#1085#1080#1077' '#1095#1077#1088#1077#1079' '#1082#1072#1073#1080#1085#1077#1090' (WEB/'#1050#1083#1080#1077#1085#1090')')
            KeyItems.Strings = (
              '2'
              '3'
              '4'
              '5'
              '7'
              '8')
            TabOrder = 0
            Visible = True
          end
        end
      end
      object tbLink: TPanel
        Left = 0
        Top = 0
        Width = 28
        Height = 215
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          28
          215)
        object btnLinkDel: TSpeedButton
          Left = 2
          Top = 192
          Width = 22
          Height = 22
          Anchors = [akLeft, akBottom]
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008C98D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008390D500FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF008693D600334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00465CCE00334CCC007584D300FF00FF00FF00FF00FF00FF00909C
            D700334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00
            FF00465CCE00334CCC00334CCC00334CCC00808ED500FF00FF00FF00FF00FF00
            FF00445ACE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00465C
            CE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00445ACE00334CCC00334CCC00334CCC003D54CD00455BCE00334C
            CC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334CCC00334C
            CC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334C
            CC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334C
            CC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334CCC00334C
            CC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00465CCE00334CCC00334CCC00334CCC004057CD00445ACE00334C
            CC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00465CCE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00445A
            CE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00ABB2
            DA00364ECC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
            FF00445ACE00334CCC00334CCC00354DCC00A4ACD900FF00FF00FF00FF00FF00
            FF00A7AFDA00364ECC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00445ACE00354DCC00A2ABD900FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00A9B1DA00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00A6AED900FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          Layout = blGlyphTop
          OnClick = btnLinkDelClick
        end
        object btnLinkAdd: TSpeedButton
          Left = 2
          Top = 3
          Width = 22
          Height = 22
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008DAF
            5D008BAE59008BAE59008BAE59008BAE590089AD560089AD560089AD560089AD
            56008BAE59008BAE59008BAE59008BAE59008BAE5900FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF008FB160008FB160008FB160008FB1
            6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = btnLinkAddClick
        end
        object btnLinkEdit: TSpeedButton
          Left = 2
          Top = 32
          Width = 22
          Height = 22
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD68DDDDD
            DDDDD777D866DD877DDDD7FFFD6DD6DF7DDDD7FFFDDD666D8DDDD7FFFFD66666
            DDDDD7FFFFFD66666DDDD7FFFFFFD66666DDD7FFFFFFFD6666DDD7FFFFFFFFD6
            6DD6D7FFFFFFFFFDDD66D7FFFFFFFFFFD668D7FFFFFF77777DDDD7FFFFFF7FF8
            7DDDD7FFFFFF7F87DDDDD7FFFFFF787DDDDDD777777777DDDDDD}
          OnClick = btnLinkEditClick
        end
      end
    end
    object tsChannels: TTabSheet
      Caption = #1058#1042' '#1082#1072#1085#1072#1083#1099
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object TabChannelState: TTabControl
        Left = 0
        Top = 0
        Width = 828
        Height = 215
        Align = alClient
        MultiLine = True
        TabOrder = 0
        TabPosition = tpLeft
        Tabs.Strings = (
          #1055#1072#1082#1077#1090' '#1074#1082#1083#1102#1095#1077#1085
          #1055#1072#1082#1077#1090' '#1086#1090#1082#1083#1102#1095#1077#1085)
        TabIndex = 0
        OnChange = TabChannelStateChange
        object Panel3: TPanel
          Left = 24
          Top = 4
          Width = 800
          Height = 207
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter2: TSplitter
            Left = 321
            Top = 0
            Height = 207
          end
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 321
            Height = 207
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object Label1: TLabel
              Left = 0
              Top = 0
              Width = 125
              Height = 13
              Align = alTop
              Caption = '.:: '#1042#1082#1083#1102#1095#1077#1085#1099' '#1074' '#1087#1072#1082#1077#1090' ::.'
            end
            object GridSC: TDBGridEh
              Left = 0
              Top = 13
              Width = 284
              Height = 194
              Align = alClient
              AllowedOperations = []
              DataSource = srcSC
              DynProps = <>
              Flat = True
              FooterRowCount = 1
              FooterParams.Color = clWindow
              GridLineParams.VertEmptySpaceStyle = dessNonEh
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
              ReadOnly = True
              SearchPanel.Enabled = True
              SearchPanel.FilterOnTyping = True
              SumList.Active = True
              TabOrder = 0
              OnDblClick = GridSCDblClick
              Columns = <
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CH_NUMBER'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #1053#1086#1084#1077#1088
                  Title.TitleButton = True
                  Width = 82
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CH_NAME'
                  Footers = <>
                  Title.Caption = #1050#1072#1085#1072#1083
                  Title.TitleButton = True
                  Width = 169
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object pnlProgrBtn: TPanel
              Left = 284
              Top = 13
              Width = 37
              Height = 194
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              object sbChanAdd: TSpeedButton
                Left = 0
                Top = 0
                Width = 37
                Height = 60
                Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1082' '#1087#1072#1082#1077#1090#1091
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
                OnClick = sbChanAddClick
              end
              object sbChanRemove: TSpeedButton
                Left = 0
                Top = 134
                Width = 37
                Height = 60
                Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1080#1079' '#1087#1072#1082#1077#1090#1072
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
                OnClick = sbChanRemoveClick
              end
            end
          end
          object Panel5: TPanel
            Left = 324
            Top = 0
            Width = 476
            Height = 207
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Label2: TLabel
              Left = 0
              Top = 0
              Width = 106
              Height = 13
              Align = alTop
              Caption = '.:: '#1042#1089#1077' '#1076#1086#1089#1090#1091#1087#1085#1099#1077' ::.'
            end
            object GridC: TDBGridEh
              Left = 0
              Top = 13
              Width = 476
              Height = 194
              Align = alClient
              AllowedOperations = []
              DataSource = srcC
              DynProps = <>
              Flat = True
              FooterRowCount = 1
              FooterParams.Color = clWindow
              GridLineParams.VertEmptySpaceStyle = dessNonEh
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
              ReadOnly = True
              SearchPanel.Enabled = True
              SearchPanel.FilterOnTyping = True
              SumList.Active = True
              TabOrder = 0
              OnDblClick = GridCDblClick
              Columns = <
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CH_NUMBER'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #1053#1086#1084#1077#1088
                  Title.TitleButton = True
                  Width = 85
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CH_NAME'
                  Footers = <>
                  Title.Caption = #1050#1072#1085#1072#1083
                  Title.TitleButton = True
                  Width = 329
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
      end
    end
    object tsAllowSrv: TTabSheet
      Hint = #1056#1072#1079#1088#1077#1096#1077#1085#1086' '#1087#1077#1088#1077#1082#1083#1102#1095#1072#1090#1100' '#1085#1072' '#1091#1089#1083#1091#1075#1080
      Caption = #1055#1077#1088#1077#1082#1083#1102#1095#1072#1090#1100' '#1085#1072' '#1091#1089#1083#1091#1075#1080
      ImageIndex = 3
      TabVisible = False
      object dbgAllow: TDBGridEh
        Left = 28
        Top = 0
        Width = 800
        Height = 215
        Align = alClient
        AllowedOperations = [alopUpdateEh]
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
            FieldName = 'AllowSRV'
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
            Width = 155
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DESCRIPTION'
            Footers = <>
            Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            Width = 209
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 28
        Height = 215
        Align = alLeft
        Caption = 'ToolBar1'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object tbAllowOk: TToolButton
          Left = 0
          Top = 0
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          Enabled = False
          ImageIndex = 25
          Wrap = True
        end
        object ToolButton3: TToolButton
          Left = 0
          Top = 22
          Caption = #1054#1090#1084#1077#1085#1072
          Enabled = False
          ImageIndex = 26
          Wrap = True
        end
        object ToolButton4: TToolButton
          Left = 0
          Top = 44
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1091#1075#1091
          ImageIndex = 2
          Wrap = True
        end
        object ToolButton5: TToolButton
          Left = 0
          Top = 66
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100
          ImageIndex = 4
          Wrap = True
        end
        object ToolButton6: TToolButton
          Left = 0
          Top = 88
          Caption = #1059#1076#1072#1083#1080#1090#1100
          ImageIndex = 3
        end
      end
    end
    object tsSwitch: TTabSheet
      Caption = #1055#1077#1088#1077#1082#1083#1102#1095#1077#1085#1080#1077
      ImageIndex = 4
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel1: TPanel
        Left = 28
        Top = 0
        Width = 800
        Height = 215
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel1'
        TabOrder = 0
        object dbgSwitch: TDBGridEh
          Left = 0
          Top = 100
          Width = 800
          Height = 115
          Align = alClient
          AllowedOperations = []
          DataSource = srcSwitch
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghColumnResize, dghColumnMove]
          SortLocal = True
          TabOrder = 1
          OnDblClick = dbgSwitchDblClick
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'SWITCHTO'
              Footers = <>
              Title.Caption = #1055#1077#1088#1077#1082#1083#1102#1095#1080#1090#1100' '#1085#1072' '#1091#1089#1083#1091#1075#1091
              Width = 182
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'SWITCHSRV'
              Footers = <>
              Title.Caption = #1055#1077#1088#1077#1082#1083#1102#1095#1080#1090#1100' '#1091#1089#1083#1091#1075#1086#1081
              Width = 182
            end
            item
              Alignment = taLeftJustify
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'SWITCH_TIME'
              Footers = <>
              KeyList.Strings = (
                '-1'
                '0'
                '1'
                '2')
              PickList.Strings = (
                #1055#1088#1080' '#1072#1074#1090#1086#1073#1083#1086#1082#1077
                #1042' '#1083#1102#1073#1086#1077' '#1074#1088#1077#1084#1103
                #1053#1072#1095#1072#1083#1086' '#1089#1091#1090#1086#1082
                #1053#1072#1095#1072#1083#1086' '#1084#1077#1089#1103#1094#1072)
              Title.Caption = #1050#1086#1075#1076#1072
              Width = 47
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DESCRIPTION'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Width = 249
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pnlSwitch: TPanel
          Left = 0
          Top = 0
          Width = 800
          Height = 100
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          Visible = False
          DesignSize = (
            800
            100)
          object Label3: TLabel
            Left = 6
            Top = 10
            Width = 86
            Height = 13
            Caption = #1053#1072' '#1082#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091
          end
          object Label4: TLabel
            Left = 347
            Top = 10
            Width = 74
            Height = 13
            Anchors = [akTop, akRight]
            Caption = #1050#1072#1082#1086#1081' '#1091#1089#1083#1091#1075#1086#1081
            ExplicitLeft = 339
          end
          object Label5: TLabel
            Left = 6
            Top = 35
            Width = 61
            Height = 13
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          end
          object lbl5: TLabel
            Left = 635
            Top = 10
            Width = 31
            Height = 13
            Anchors = [akTop, akRight]
            Caption = #1050#1086#1075#1076#1072
            ExplicitLeft = 627
          end
          object dblSwitchTo: TDBLookupComboboxEh
            Left = 98
            Top = 7
            Width = 243
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DynProps = <>
            DataField = 'CHILD'
            DataSource = srcSwitch
            EmptyDataInfo.Text = #1053#1072' '#1082#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1077#1088#1077#1082#1083#1102#1095#1072#1090#1100
            EditButtons = <>
            KeyField = 'SERVICE_ID'
            ListField = 'NAME'
            ListSource = srcSwitchToSrv
            TabOrder = 0
            Visible = True
          end
          object dblSwitchSrv: TDBLookupComboboxEh
            Left = 427
            Top = 7
            Width = 201
            Height = 21
            Anchors = [akTop, akRight]
            DynProps = <>
            DataField = 'ADD_SRV'
            DataSource = srcSwitch
            EmptyDataInfo.Text = #1050#1072#1082#1086#1081' '#1091#1089#1083#1091#1075#1086#1081' '#1087#1077#1088#1077#1082#1083#1102#1095#1072#1090#1100
            EditButtons = <>
            KeyField = 'SERVICE_ID'
            ListField = 'NAME'
            ListSource = srcONOFFServices
            TabOrder = 1
            Visible = True
          end
          object bbSwitchSave: TBitBtn
            Left = 98
            Top = 72
            Width = 589
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            TabOrder = 4
            OnClick = bbSwitchSaveClick
          end
          object bbSwitchCancel: TBitBtn
            Left = 702
            Top = 72
            Width = 86
            Height = 25
            Anchors = [akTop, akRight]
            Caption = #1054#1090#1084#1077#1085#1072
            TabOrder = 5
            OnClick = bbSwitchCancelClick
          end
          object memSwitch: TDBMemoEh
            Left = 98
            Top = 32
            Width = 690
            Height = 34
            ScrollBars = ssVertical
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            DataField = 'DESCRIPTION'
            DataSource = srcSwitch
            DynProps = <>
            EditButtons = <>
            TabOrder = 3
            Visible = True
            WantReturns = True
          end
          object cbTime: TDBComboBoxEh
            Left = 672
            Top = 7
            Width = 116
            Height = 21
            Hint = #1050#1086#1075#1076#1072' '#1074#1086#1079#1084#1086#1078#1077#1085' '#1087#1077#1088#1077#1093#1086#1076
            Anchors = [akTop, akRight]
            DataField = 'SWITCH_TIME'
            DataSource = srcSwitch
            DynProps = <>
            EmptyDataInfo.Text = #1050#1086#1075#1076#1072' '#1087#1077#1088#1077#1082#1083#1102#1095#1072#1090#1100
            EditButtons = <>
            Items.Strings = (
              #1042' '#1083#1102#1073#1086#1077' '#1074#1088#1077#1084#1103
              #1053#1072#1095#1072#1083#1086' '#1089#1091#1090#1086#1082
              #1053#1072#1095#1072#1083#1086' '#1084#1077#1089#1103#1094#1072
              #1055#1088#1080' '#1072#1074#1090#1086#1073#1083#1086#1082#1080#1088#1086#1074#1082#1077)
            KeyItems.Strings = (
              '0'
              '1'
              '2'
              '-1')
            TabOrder = 2
            Visible = True
          end
        end
      end
      object tbSwitch: TPanel
        Left = 0
        Top = 0
        Width = 28
        Height = 215
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          28
          215)
        object btnSWDel: TSpeedButton
          Left = 2
          Top = 192
          Width = 22
          Height = 22
          Anchors = [akLeft, akBottom]
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008C98D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008390D500FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF008693D600334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00465CCE00334CCC007584D300FF00FF00FF00FF00FF00FF00909C
            D700334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00
            FF00465CCE00334CCC00334CCC00334CCC00808ED500FF00FF00FF00FF00FF00
            FF00445ACE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00465C
            CE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00445ACE00334CCC00334CCC00334CCC003D54CD00455BCE00334C
            CC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334CCC00334C
            CC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334C
            CC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334C
            CC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334CCC00334C
            CC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00465CCE00334CCC00334CCC00334CCC004057CD00445ACE00334C
            CC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00465CCE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00445A
            CE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00ABB2
            DA00364ECC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
            FF00445ACE00334CCC00334CCC00354DCC00A4ACD900FF00FF00FF00FF00FF00
            FF00A7AFDA00364ECC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00445ACE00354DCC00A2ABD900FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00A9B1DA00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00A6AED900FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          Layout = blGlyphTop
          OnClick = btnSWDelClick
        end
        object btnSWAdd: TSpeedButton
          Left = 2
          Top = 3
          Width = 22
          Height = 22
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008DAF
            5D008BAE59008BAE59008BAE59008BAE590089AD560089AD560089AD560089AD
            56008BAE59008BAE59008BAE59008BAE59008BAE5900FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF008FB160008FB160008FB160008FB1
            6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = btnSWAddClick
        end
        object btnSWEdit: TSpeedButton
          Left = 2
          Top = 32
          Width = 22
          Height = 22
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD68DDDDD
            DDDDD777D866DD877DDDD7FFFD6DD6DF7DDDD7FFFDDD666D8DDDD7FFFFD66666
            DDDDD7FFFFFD66666DDDD7FFFFFFD66666DDD7FFFFFFFD6666DDD7FFFFFFFFD6
            6DD6D7FFFFFFFFFDDD66D7FFFFFFFFFFD668D7FFFFFF77777DDDD7FFFFFF7FF8
            7DDDD7FFFFFF7F87DDDDD7FFFFFF787DDDDDD777777777DDDDDD}
          OnClick = btnSWEditClick
        end
      end
    end
    object tsAtributes: TTabSheet
      Caption = #1040#1090#1088#1080#1073#1091#1090#1099
      ImageIndex = 5
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object pnlAtr: TPanel
        Left = 28
        Top = 0
        Width = 800
        Height = 215
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel1'
        TabOrder = 0
        object dbgAttr: TDBGridEh
          Left = 0
          Top = 100
          Width = 800
          Height = 115
          Align = alClient
          AllowedOperations = []
          DataSource = srcSrvAttr
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghColumnResize, dghColumnMove]
          SortLocal = True
          TabOrder = 1
          OnDblClick = dbgAttrDblClick
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
              FieldName = 'SA_VALUE'
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
          Width = 800
          Height = 100
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          Visible = False
          DesignSize = (
            800
            100)
          object lbl2: TLabel
            Left = 6
            Top = 10
            Width = 43
            Height = 13
            Caption = #1040#1090#1088#1080#1073#1091#1090
          end
          object lbl3: TLabel
            Left = 418
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
            Width = 310
            Height = 21
            DynProps = <>
            DataField = 'O_ID'
            DataSource = srcSrvAttr
            EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1072#1090#1088#1080#1073#1091#1090
            EditButtons = <>
            KeyField = 'O_ID'
            ListField = 'O_NAME'
            ListSource = srcAttributes
            TabOrder = 0
            Visible = True
            OnChange = dbluAttributeChange
          end
          object btnSaveAttr: TBitBtn
            Left = 98
            Top = 70
            Width = 588
            Height = 25
            Anchors = [akLeft, akRight, akBottom]
            Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
            TabOrder = 4
            OnClick = btnSaveAttrClick
          end
          object btnCancelAttr: TBitBtn
            Left = 701
            Top = 70
            Width = 86
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = #1054#1090#1084#1077#1085#1072
            TabOrder = 5
            OnClick = btnCancelAttrClick
          end
          object dbmmoNOTICE: TDBMemoEh
            Left = 98
            Top = 32
            Width = 689
            Height = 34
            ScrollBars = ssVertical
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoSize = False
            DataField = 'NOTICE'
            DataSource = srcSrvAttr
            DynProps = <>
            EditButtons = <>
            TabOrder = 3
            Visible = True
            WantReturns = True
          end
          object edtAtrValue: TDBEditEh
            Left = 475
            Top = 7
            Width = 312
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'SA_VALUE'
            DataSource = srcSrvAttr
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1047#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072
            TabOrder = 1
            Visible = True
          end
          object cbbList: TDBComboBoxEh
            Left = 475
            Top = 7
            Width = 312
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'SA_VALUE'
            DataSource = srcSrvAttr
            DynProps = <>
            EmptyDataInfo.Text = #1047#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072
            EditButtons = <>
            TabOrder = 2
            Visible = False
          end
        end
      end
      object tbAttr: TPanel
        Left = 0
        Top = 0
        Width = 28
        Height = 215
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          28
          215)
        object sbAttrDel: TSpeedButton
          Left = 2
          Top = 192
          Width = 22
          Height = 22
          Anchors = [akLeft, akBottom]
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008C98D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008390D500FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF008693D600334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00465CCE00334CCC007584D300FF00FF00FF00FF00FF00FF00909C
            D700334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00
            FF00465CCE00334CCC00334CCC00334CCC00808ED500FF00FF00FF00FF00FF00
            FF00445ACE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00465C
            CE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00445ACE00334CCC00334CCC00334CCC003D54CD00455BCE00334C
            CC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334CCC00334C
            CC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334C
            CC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334C
            CC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334CCC00334C
            CC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00465CCE00334CCC00334CCC00334CCC004057CD00445ACE00334C
            CC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00465CCE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00445A
            CE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00ABB2
            DA00364ECC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
            FF00445ACE00334CCC00334CCC00354DCC00A4ACD900FF00FF00FF00FF00FF00
            FF00A7AFDA00364ECC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00445ACE00354DCC00A2ABD900FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00A9B1DA00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00A6AED900FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          Layout = blGlyphTop
          OnClick = sbAttrDelClick
        end
        object sbAttrAdd: TSpeedButton
          Left = 2
          Top = 3
          Width = 22
          Height = 22
          Flat = True
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008DAF
            5D008BAE59008BAE59008BAE59008BAE590089AD560089AD560089AD560089AD
            56008BAE59008BAE59008BAE59008BAE59008BAE5900FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF008FB160008FB160008FB160008FB1
            6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          OnClick = sbAttrAddClick
        end
        object sbAttrEdit: TSpeedButton
          Left = 2
          Top = 32
          Width = 22
          Height = 22
          Flat = True
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDD68DDDDD
            DDDDD777D866DD877DDDD7FFFD6DD6DF7DDDD7FFFDDD666D8DDDD7FFFFD66666
            DDDDD7FFFFFD66666DDDD7FFFFFFD66666DDD7FFFFFFFD6666DDD7FFFFFFFFD6
            6DD6D7FFFFFFFFFDDD66D7FFFFFFFFFFD668D7FFFFFF77777DDDD7FFFFFF7FF8
            7DDDD7FFFFFF7F87DDDDD7FFFFFF787DDDDDD777777777DDDDDD}
          OnClick = sbAttrEditClick
        end
      end
    end
    object tsCOMPLEX: TTabSheet
      Caption = #1050#1086#1084#1087#1083#1077#1082#1089
      ImageIndex = 6
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object dbgCMPLX: TDBGridEh
        Left = 329
        Top = 0
        Width = 499
        Height = 215
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = srcCMPLX
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        SumList.Active = True
        TabOrder = 0
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1043#1088#1091#1087#1087#1099
            Title.TitleButton = True
            Title.SortIndex = 2
            Title.SortMarker = smDownEh
            Width = 164
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'PERCENT'
            Footer.DisplayFormat = '#,###.##'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1055#1088#1086#1094#1077#1085#1090
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = '#.##'
            DynProps = <>
            EditButtons = <>
            FieldName = 'INMONEY'
            Footer.DisplayFormat = '#,###.##'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Title.Caption = #1042' '#1076#1077#1085#1100#1075#1072#1093' '#1085#1072' '#1089#1077#1075#1086#1076#1085#1103
            Width = 120
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DATE_FROM'
            Footers = <>
            Title.Caption = #1057' '#1076#1072#1090#1099
            Title.TitleButton = True
            Title.SortIndex = 1
            Title.SortMarker = smUpEh
            Width = 75
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DATE_TO'
            Footers = <>
            Title.Caption = #1055#1086' '#1076#1072#1090#1091
            Title.TitleButton = True
            Width = 77
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 413
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnlCmxButtons: TPanel
        Left = 0
        Top = 0
        Width = 25
        Height = 215
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          25
          215)
        object btnCmxDel: TSpeedButton
          Left = 1
          Top = 191
          Width = 22
          Height = 22
          Action = actCmxDel
          Anchors = [akLeft, akBottom]
          Flat = True
          Layout = blGlyphTop
        end
        object btnCmxAdd: TSpeedButton
          Left = 1
          Top = 3
          Width = 22
          Height = 22
          Action = actCmxAdd
          Flat = True
        end
      end
      object pnlCmxAdd: TPanel
        Left = 25
        Top = 0
        Width = 304
        Height = 215
        Align = alLeft
        BevelOuter = bvLowered
        TabOrder = 2
        Visible = False
        object edCmxFrom: TDBDateTimeEditEh
          Left = 6
          Top = 43
          Width = 130
          Height = 21
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1057' '#1076#1072#1090#1099
          Kind = dtkDateEh
          TabOrder = 2
          Visible = True
        end
        object edCmxTo: TDBDateTimeEditEh
          Left = 168
          Top = 43
          Width = 130
          Height = 21
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1055#1086' '#1076#1072#1090#1091
          Kind = dtkDateEh
          TabOrder = 3
          Visible = True
        end
        object dbcCmxGroup: TDBComboBoxEh
          Left = 6
          Top = 16
          Width = 203
          Height = 21
          DynProps = <>
          EmptyDataInfo.Text = #1043#1088#1091#1087#1087#1072
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
        object enCmxValue: TDBNumberEditEh
          Left = 215
          Top = 16
          Width = 83
          Height = 21
          DecimalPlaces = 4
          DynProps = <>
          EditButton.Visible = True
          EditButtons = <>
          TabOrder = 1
          Visible = True
        end
        object btn2: TButton
          Left = 6
          Top = 127
          Width = 203
          Height = 25
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 5
          OnClick = btn2Click
        end
        object btn3: TButton
          Left = 223
          Top = 127
          Width = 75
          Height = 25
          Caption = #1054#1090#1084#1077#1085#1072
          TabOrder = 6
          OnClick = btn3Click
        end
        object dbmCmxNotice: TDBMemoEh
          Left = 6
          Top = 72
          Width = 292
          Height = 49
          AutoSize = False
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          TabOrder = 4
          Visible = True
          WantReturns = True
        end
      end
    end
  end
  object srcTarif: TDataSource
    AutoEdit = False
    DataSet = dsTarif
    OnDataChange = srcTarifDataChange
    Left = 64
    Top = 472
  end
  object srcLinks: TDataSource
    AutoEdit = False
    DataSet = dsLinks
    OnDataChange = srcLinksDataChange
    Left = 133
    Top = 479
  end
  object srcServices: TDataSource
    AutoEdit = False
    DataSet = dsServices
    OnStateChange = srcServicesStateChange
    OnDataChange = srcServicesDataChange
    Left = 72
    Top = 72
  end
  object dsServices: TpFIBDataSet
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE SERVICES_D(:OLD_SERVICE_ID)'
      '    ')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      'select'
      '    *'
      '  from (select'
      '            Service_Id'
      '          , Srv_Type_Id'
      '          , Shift_Months'
      '          , Name'
      '          , Shortname'
      '          , Description'
      '          , Dimension'
      '          , Extra'
      '          , Priority'
      '          , CALC_TYPE'
      '          , Note'
      '          , AUTOOFF'
      '          ,'
      '            case(select'
      '                     1'
      '                   from SERVICES_LINKS sl'
      '                   where sl.PARENT is null'
      '                         and sl.CHILD = s.SERVICE_ID)'
      '              when 1 then 1'
      '              else 0'
      '            end as SHOW_SERVICE,'
      '            (select'
      '                 o.O_Name'
      '               from Objects o'
      '               where o.O_Id = s.Expense_Type'
      '                     and o.O_TYPE = 2) as O_Name'
      '          ,'
      '            (select'
      '                 o.O_NAME'
      '               from objects o'
      '               where o.O_Id = s.BUSINESS_TYPE'
      '                     and o.O_TYPE = 15) BUSINESS'
      '          ,'
      '            (select'
      '                 t.Tarif_Sum'
      '               from Tarif t'
      '               where t.Service_Id = s.Service_Id'
      
        '                     and current_date between t.Date_From and t.' +
        'Date_To) FIZ_TAR'
      '          ,'
      '            (select'
      '                 count(*)'
      '               from subscr_hist h'
      '               where h.Serv_Id = s.Service_Id'
      
        '                     and current_date between h.Date_From and h.' +
        'Date_To) ACT_CUST'
      '          ,'
      '            (select'
      '                 list(o.O_Dimension)'
      '               from Services_Attributes a'
      
        '                 inner join objects o on (o.O_Id = a.O_Id and o.' +
        'O_Type = 25)'
      '               where a.Service_Id = s.Service_Id) ATR_LIST'
      '          from SERVICES s'
      
        '          where (s.SRV_TYPE_ID = :SERV_TYPE) and (S.SERVICE_ID =' +
        ' :OLD_SERVICE_ID)'
      '        )'
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    *'
      '  from (select'
      '            Service_Id'
      '          , Srv_Type_Id'
      '          , Shift_Months'
      '          , Name'
      '          , Shortname'
      '          , Description'
      '          , Dimension'
      '          , Extra'
      '          , Priority'
      '          , CALC_TYPE'
      '          , Note'
      '          , AUTOOFF'
      '          ,'
      '            case(select'
      '                     1'
      '                   from SERVICES_LINKS sl'
      '                   where sl.PARENT is null'
      '                         and sl.CHILD = s.SERVICE_ID)'
      '              when 1 then 1'
      '              else 0'
      '            end as SHOW_SERVICE,'
      '            (select'
      '                 o.O_Name'
      '               from Objects o'
      '               where o.O_Id = s.Expense_Type'
      '                     and o.O_TYPE = 2) as O_Name'
      '          ,'
      '            (select'
      '                 o.O_NAME'
      '               from objects o'
      '               where o.O_Id = s.BUSINESS_TYPE'
      '                     and o.O_TYPE = 15) BUSINESS'
      '          ,'
      '            (select'
      '                 t.Tarif_Sum'
      '               from Tarif t'
      '               where t.Service_Id = s.Service_Id'
      
        '                     and current_date between t.Date_From and t.' +
        'Date_To) FIZ_TAR'
      '          ,'
      '            (select'
      '                 count(*)'
      '               from subscr_hist h'
      '               where h.Serv_Id = s.Service_Id'
      
        '                     and current_date between h.Date_From and h.' +
        'Date_To) ACT_CUST'
      '          ,'
      '            (select'
      '                 list(o.O_Dimension)'
      '               from Services_Attributes a'
      
        '                 inner join objects o on (o.O_Id = a.O_Id and o.' +
        'O_Type = 25)'
      '               where a.Service_Id = s.Service_Id) ATR_LIST'
      '          from SERVICES s'
      '          where s.SRV_TYPE_ID = :SERV_TYPE)'
      '  where @@where_actual%1=1@'
      '  order by NAME  ')
    AutoUpdateOptions.UpdateTableName = 'SERVICES'
    AutoUpdateOptions.KeyFields = 'SERVICE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 73
    Top = 121
    oFetchAll = True
  end
  object dsTarif: TpFIBDataSet
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE TARIF_IUD('
      '  :TARIF_ID, '
      '  :SERVICE_ID, '
      '  :DATE_FROM, '
      '  :DATE_TO, '
      '  :TARIF_SUM, 0, '
      '  2)'
      '    ')
    RefreshSQL.Strings = (
      'SELECT t.*'
      'FROM TARIF t'
      'where  T.TARIF_ID = :OLD_TARIF_ID    '
      'order by t.DATE_FROM, t.DATE_TO')
    SelectSQL.Strings = (
      'select'
      '    t.*'
      '  , coalesce(w.Surname, t.Edit_By) as WHO_LAST'
      '  from TARIF t'
      '       left outer join worker w on (w.Ibname = t.Edit_By)'
      '  where t.SERVICE_ID = :SERVICE_ID'
      '  order by t.DATE_FROM desc, t.DATE_TO')
    AutoUpdateOptions.UpdateTableName = 'TARIF'
    AutoUpdateOptions.KeyFields = 'TARIF_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    OnNewRecord = dsTarifNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcServices
    Left = 64
    Top = 432
    oFetchAll = True
  end
  object dsLinks: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SERVICES_LINKS'
      'SET '
      '    LINK_ID = :LINK_ID,'
      '    LINK_TYPE = :LINK_TYPE,'
      '    PARENT = :PARENT,'
      '    CHILD = :CHILD,'
      '    DESCRIPTION = :DESCRIPTION'
      'WHERE'
      '    LINK_ID = :OLD_LINK_ID'
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
      '    DESCRIPTION'
      ')'
      'VALUES('
      '    :LINK_ID,'
      '    :LINK_TYPE,'
      '    :PARENT,'
      '    :CHILD,'
      '    :DESCRIPTION'
      ')')
    RefreshSQL.Strings = (
      'SELECT l.*, s.NAME'
      'FROM SERVICES_LINKS l, services s'
      'where(  s.SERVICE_ID = l.CHILD'
      'and l.PARENT = :SERVICE_ID'
      '     ) and (     L.LINK_ID = :OLD_LINK_ID'
      '     )'
      '    '
      'order by s.NAME')
    SelectSQL.Strings = (
      'select'
      '    l.*, s.Name'
      'FROM SERVICES_LINKS l'
      '       inner join services s on (s.Service_Id = l.Child)'
      'where l.PARENT = :SERVICE_ID'
      'and l.LINK_TYPE <> 6'
      'order by l.LINK_TYPE, s.Name')
    AutoUpdateOptions.UpdateTableName = 'SERVICES_LINKS'
    AutoUpdateOptions.KeyFields = 'LINK_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    OnNewRecord = dsLinksNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcServices
    Left = 133
    Top = 431
    oFetchAll = True
  end
  object srcONOFFServices: TDataSource
    AutoEdit = False
    DataSet = dsONOFFServices
    Left = 90
    Top = 241
  end
  object dsONOFFServices: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT s.*'
      'FROM SERVICES s'
      'where s.SRV_TYPE_ID in (1,2)'
      'order by s.NAME')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 90
    Top = 193
    oFetchAll = True
  end
  object dsSC: TpFIBDataSet
    SelectSQL.Strings = (
      'select c.Ch_Id, c.Ch_Number, c.Ch_Name'
      'FROM Channels c, Channels_In_Servce cs'
      'where c.Ch_Id = cs.Ch_Id'
      '  and cs.Srv_Id = :service'
      '  and cs.On_Off = :Channel_On'
      'order by c.Ch_Name')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 368
    Top = 412
    dcForceOpen = True
  end
  object srcSC: TDataSource
    AutoEdit = False
    DataSet = dsSC
    OnStateChange = srcSCStateChange
    Left = 368
    Top = 460
  end
  object dsC: TpFIBDataSet
    SelectSQL.Strings = (
      'select c.Ch_Id, c.Ch_Number, c.Ch_Name'
      'FROM Channels c'
      
        'where not exists( select cs.Ch_Id from Channels_In_Servce cs whe' +
        're cs.Ch_Id = c.Ch_Id and cs.Srv_Id = :service and cs.On_Off = :' +
        'Channel_On)'
      'order by c.Ch_Name'
      '')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 400
    Top = 188
    dcForceMasterRefresh = True
    dcForceOpen = True
    oFetchAll = True
  end
  object srcC: TDataSource
    AutoEdit = False
    DataSet = dsC
    OnStateChange = srcCStateChange
    Left = 400
    Top = 244
  end
  object ActionList1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 349
    Top = 139
    object Action1: TAction
      Caption = 'Action1'
    end
    object actAddSrv: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1091#1075#1091
      ImageIndex = 2
      ShortCut = 45
      OnExecute = actAddSrvExecute
    end
    object actEditSrv: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1091#1089#1083#1091#1075#1091
      ImageIndex = 4
      ShortCut = 113
      OnExecute = actEditSrvExecute
    end
    object actDelSrv: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1089#1083#1091#1075#1091
      ImageIndex = 3
      OnExecute = actDelSrvExecute
    end
    object actCmxAdd: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1084#1087#1083#1077#1082#1089
      ImageIndex = 2
      OnExecute = actCmxAddExecute
    end
    object actCmxDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1082#1086#1084#1087#1083#1077#1082#1089
      ImageIndex = 3
      OnExecute = actCmxDelExecute
    end
  end
  object srcSwitch: TDataSource
    AutoEdit = False
    DataSet = dsSwitch
    OnDataChange = srcSwitchDataChange
    Left = 245
    Top = 242
  end
  object dsSwitch: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SERVICES_LINKS'
      'SET '
      '    LINK_TYPE = 6,'
      '    PARENT = :PARENT,'
      '    CHILD = :CHILD,'
      '    ADD_SRV = :ADD_SRV,    '
      '    SWITCH_TIME = :SWITCH_TIME,'
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
      '    SWITCH_TIME,'
      '    DESCRIPTION'
      ')'
      'VALUES('
      '    :LINK_ID,'
      '    6,'
      '    :PARENT,'
      '    :CHILD,'
      '    :ADD_SRV,'
      '    :SWITCH_TIME,'
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
      '    l.*, s.Name as SwitchTo, o.Name as SwitchSrv'
      'FROM SERVICES_LINKS l'
      '       left outer join services s on (s.Service_Id = l.Child)'
      '       left outer join services o on (o.Service_Id = l.Add_Srv)'
      'where l.PARENT = :SERVICE_ID'
      'and l.LINK_TYPE = 6'
      'order by l.LINK_TYPE, s.Name')
    AutoUpdateOptions.UpdateTableName = 'SERVICES_LINKS'
    AutoUpdateOptions.KeyFields = 'LINK_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    OnNewRecord = dsSwitchNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcServices
    Left = 243
    Top = 190
    oFetchAll = True
  end
  object srcSwitchToSrv: TDataSource
    AutoEdit = False
    DataSet = dsSwitchToSrv
    Left = 273
    Top = 457
  end
  object dsSwitchToSrv: TpFIBDataSet
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE SERVICES_D(:OLD_SERVICE_ID)'
      '    ')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      
        'SELECT Service_Id, Srv_Type_Id, Shift_Months, Name, Shortname, D' +
        'escription, Dimension,  Extra,'
      
        ' CASE (select 1 from SERVICES_LINKS sl where sl.PARENT is null a' +
        'nd sl.CHILD = s.SERVICE_ID)'
      ' when 1 then 1'
      ' else 0 END as SHOW_SERVICE,'
      
        ' (select o.O_Name from Objects o where o.O_Id = s.Expense_Type a' +
        'nd o.O_TYPE = 2) as O_Name,'
      
        ' (Select o.O_NAME from objects o where o.O_Id = s.BUSINESS_TYPE ' +
        'and o.O_TYPE = 15) BUSINESS,'
      'CALC_TYPE'
      ''
      'FROM SERVICES s '
      'where(  s.SRV_TYPE_ID = :SERV_TYPE'
      '     ) and (     S.SERVICE_ID = :OLD_SERVICE_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    s.Service_Id, s.Name, s.Description'
      '  from services s'
      '       inner join services_links sl on (s.Service_Id = sl.Child)'
      '  where sl.Link_Type = 0'
      '        and s.Service_Id <> :Service_id   '
      'order by s.Name')
    AutoUpdateOptions.UpdateTableName = 'SERVICES'
    AutoUpdateOptions.KeyFields = 'SERVICE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 274
    Top = 405
    oFetchAll = True
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
    Left = 160
    Top = 120
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
    Left = 216
    Top = 124
  end
  object dsSrvAttr: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SERVICES_ATTRIBUTES'
      'SET '
      '    SA_VALUE = :SA_VALUE,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    SA_ID = :OLD_SA_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SERVICES_ATTRIBUTES'
      'WHERE'
      '        SA_ID = :OLD_SA_ID'
      ''
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SERVICES_ATTRIBUTES('
      '    Service_Id,'
      '    SA_VALUE,'
      '    NOTICE,'
      '    SA_ID,'
      '    O_ID'
      ')'
      'VALUES('
      '    :Service_Id,'
      '    :SA_VALUE,'
      '    :NOTICE,'
      '    :SA_ID,'
      '    :O_ID'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    o.O_Name, o.O_DIMENSION, o.O_DESCRIPTION, sa.*'
      '  from Services_Attributes sa'
      
        '       inner join objects o on (o.O_Id = sa.O_Id and o.O_Type = ' +
        '25)'
      '  where(  sa.Service_Id = :Service_Id'
      '     ) and (     SA.SERVICE_ID = :OLD_SERVICE_ID'
      '    and SA.O_ID = :OLD_O_ID'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    o.O_Name, o.O_DIMENSION, o.O_DESCRIPTION, sa.*'
      '  from Services_Attributes sa'
      
        '       inner join objects o on (o.O_Id = sa.O_Id and o.O_Type = ' +
        '25)'
      '  where sa.Service_Id = :Service_Id'
      '  order by o.O_Name  ')
    AutoUpdateOptions.UpdateTableName = 'SERVICES_LINKS'
    AutoUpdateOptions.KeyFields = 'LINK_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    OnNewRecord = dsSrvAttrNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcServices
    Left = 563
    Top = 190
    oFetchAll = True
  end
  object srcSrvAttr: TDataSource
    AutoEdit = False
    DataSet = dsSrvAttr
    OnDataChange = srcSrvAttrDataChange
    Left = 565
    Top = 238
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
      '  where o.O_Type = 25'
      '        and ((not exists(select'
      '                           sa.O_Id'
      '                         from Services_Attributes sa'
      '                         where sa.O_Id = o.O_Id'
      '                               and sa.Service_Id = :Service_Id))'
      '             or (o.O_Id = :O_Id))'
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
    DataSource = srcServices
    Left = 459
    Top = 414
    oFetchAll = True
  end
  object srcAttributes: TDataSource
    AutoEdit = False
    DataSet = dsAttributes
    Left = 461
    Top = 470
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 123
    Top = 62
  end
  object dsCMPLX: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SERVICES_CMPLX'
      'SET '
      '    SERVICE_ID = :SERVICE_ID,'
      '    NAME = :NAME,'
      '    PERCENT = :PERCENT,'
      '    DATE_FROM = :DATE_FROM,'
      '    DATE_TO = :DATE_TO,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    SERVICE_ID = :OLD_SERVICE_ID '
      '    and NAME = :OLD_NAME '
      '    and PERCENT = :OLD_PERCENT '
      '    and DATE_FROM = :OLD_DATE_FROM')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SERVICES_CMPLX'
      'WHERE'
      '    SERVICE_ID = :OLD_SERVICE_ID '
      '    and NAME = :OLD_NAME '
      '    and "PERCENT" = :OLD_PERCENT '
      '    and DATE_FROM = :OLD_DATE_FROM        ')
    InsertSQL.Strings = (
      'INSERT INTO SERVICES_CMPLX('
      '    SERVICE_ID,'
      '    NAME,'
      '    PERCENT,'
      '    DATE_FROM,'
      '    DATE_TO,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :SERVICE_ID,'
      '    :NAME,'
      '    :PERCENT,'
      '    :DATE_FROM,'
      '    :DATE_TO,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    c.*'
      '    , (coalesce(t.Tarif_Sum, 0) * c.Percent / 100) as InMoney'
      '  from Services_Cmplx c'
      
        '    left outer join tarif t on (c.Service_Id = t.Service_Id and ' +
        'c.Date_From between t.Date_From and t.Date_To)'
      '  where c.Service_Id = :Service_Id'
      '    and c.NAME = :NAME '
      '    and c."PERCENT" = :PERCENT '
      '    and c.DATE_FROM = :DATE_FROM  '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    C.*'
      '  , round((coalesce((select first 1'
      '                   T.TARIF_SUM'
      '                 from TARIF T'
      '                 where (C.SERVICE_ID = T.SERVICE_ID'
      
        '                       and c.Date_From between T.DATE_FROM and T' +
        '.DATE_TO)), 0) * C.PERCENT / 100), 2) as INMONEY'
      '  from SERVICES_CMPLX C'
      '  where C.SERVICE_ID = :SERVICE_ID'
      '  order by C.DATE_FROM desc, C.NAME')
    AutoUpdateOptions.UpdateTableName = 'SERVICES_LINKS'
    AutoUpdateOptions.KeyFields = 'LINK_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcServices
    Left = 587
    Top = 414
    oFetchAll = True
  end
  object srcCMPLX: TDataSource
    DataSet = dsCMPLX
    OnDataChange = srcCMPLXDataChange
    Left = 589
    Top = 470
  end
end
