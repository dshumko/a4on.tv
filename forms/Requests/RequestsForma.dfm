object RequestsForm: TRequestsForm
  Left = 476
  Top = 207
  Caption = #1047#1072#1103#1074#1082#1080
  ClientHeight = 478
  ClientWidth = 799
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = True
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 799
    Height = 25
    Caption = 'ToolBar1'
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
    object ToolButton1: TToolButton
      Left = 5
      Top = 0
      Action = actNew
    end
    object ToolButton5: TToolButton
      Left = 28
      Top = 0
      Width = 4
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 32
      Top = 0
      Action = actEdit
    end
    object btn2: TToolButton
      Left = 55
      Top = 0
      Width = 15
      Caption = 'btn2'
      ImageIndex = 32
      Style = tbsSeparator
    end
    object btnDouble: TToolButton
      Left = 70
      Top = 0
      Action = actDouble
    end
    object btn12: TToolButton
      Left = 93
      Top = 0
      Width = 8
      Caption = 'btn12'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton11: TToolButton
      Left = 101
      Top = 0
      Action = actPrint
    end
    object ToolButton8: TToolButton
      Left = 124
      Top = 0
      Width = 9
      Caption = 'ToolButton8'
      ImageIndex = 27
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 133
      Top = 0
      Action = actFilter
      Style = tbsDropDown
    end
    object ToolButton14: TToolButton
      Left = 171
      Top = 0
      Action = actEnableFilter
    end
    object btnQuickFilter: TToolButton
      Left = 194
      Top = 0
      Action = actQuickFilter
    end
    object btnRefresh: TToolButton
      Left = 217
      Top = 0
      Action = actRefresh
    end
    object ToolButton16: TToolButton
      Left = 240
      Top = 0
      Width = 8
      Caption = 'ToolButton16'
      ImageIndex = 34
      Style = tbsSeparator
    end
    object btnFilterCustomer: TToolButton
      Left = 248
      Top = 0
      Action = actFilterCustomer
    end
    object btn6: TToolButton
      Left = 271
      Top = 0
      Width = 3
      Caption = 'btn6'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object btnPlaner: TToolButton
      Left = 274
      Top = 0
      Action = actPlaner
    end
    object btnTask: TToolButton
      Left = 297
      Top = 0
      Action = actTask
    end
  end
  object pgcGrids: TPageControl
    Left = 0
    Top = 25
    Width = 799
    Height = 453
    ActivePage = tsPlan
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 1
    OnChange = pgcGridsChange
    object tsPlan: TTabSheet
      Caption = #1047#1072#1087#1083#1072#1085#1080#1088#1086#1074#1072#1085#1099
      object dbgPlan: TDBGridEh
        Left = 0
        Top = 23
        Width = 791
        Height = 399
        Align = alClient
        AllowedOperations = []
        DataGrouping.DefaultStateExpanded = True
        DataSource = srcPlan
        DrawMemoText = True
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        OddRowColor = clWindow
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        PopupMenu = gridPopUp
        ReadOnly = True
        SearchPanel.Enabled = True
        STFilter.Local = True
        SumList.Active = True
        SumList.VirtualRecords = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnDblClick = dbgGridDblClick
        OnDataGroupGetRowText = dbgGridDataGroupGetRowText
        OnGetCellParams = dbgGridGetCellParams
        OnGetFooterParams = dbGridGetFooterParams
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_ID'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #8470' '#1079#1072#1103#1074#1082#1080
            Title.TitleButton = True
            Width = 57
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'DD.MM.YY'
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_PLAN_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1055#1083#1072#1085
            Title.TitleButton = True
            Width = 65
          end
          item
            CellButtons = <>
            DisplayFormat = 'HH:MM'
            DynProps = <>
            EditButtons = <>
            EditMask = 'HH:MM'
            FieldName = 'RQ_TIME_FROM'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1089
            Title.TitleButton = True
            Width = 29
          end
          item
            CellButtons = <>
            DisplayFormat = 'HH:MM'
            DynProps = <>
            EditButtons = <>
            EditMask = 'HH:MM'
            FieldName = 'RQ_TIME_TO'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1087#1086
            Title.TitleButton = True
            Width = 26
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'GIV_EXEC_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1042#1099#1076#1072#1095#1080
            Title.TitleButton = True
            Visible = False
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CONTETNT'
            Footers = <>
            Title.Caption = #1053#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100
            Title.TitleButton = True
            Width = 151
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STREET_NAME'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1059#1083#1080#1094#1072
            Title.TitleButton = True
            Width = 179
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOUSE_NO'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1044#1086#1084
            Title.TitleButton = True
            Width = 32
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLAT_NO'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1050#1074'.'
            Title.TitleButton = True
            Width = 37
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'PORCH_N'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1055'-'#1076
            Title.TitleButton = True
            Width = 22
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLOOR_N'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1069'-'#1078
            Title.TitleButton = True
            Width = 22
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CUST_CODE'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1050#1086#1076
            Title.TitleButton = True
            Width = 55
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ACCOUNT_NO'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1051#1080#1094'. '#1089#1095#1077#1090
            Title.TitleButton = True
            Width = 59
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FIO'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1060#1048#1054
            Title.TitleButton = True
            Width = 120
            OnGetCellParams = dbgPlanColumns13GetCellParams
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RT_NAME'
            Footers = <>
            Title.Caption = #1058#1080#1087
            Title.TitleButton = True
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RES_TEXT'
            Footers = <>
            Title.Caption = #1057#1090#1072#1090#1091#1089
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'TEAM'
            Footers = <>
            Title.Caption = #1047#1074#1077#1085#1086
            Title.TitleButton = True
            Width = 77
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 100
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_BY'
            Footers = <>
            Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1072'|'#1050#1077#1084
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'dd.mm.yy hh:nn'
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1072'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'dd.mm.yy hh:nn'
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_BY'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1090#1086
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'dd.mm.yy hh:nn'
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ALL_PHONES'
            Footers = <>
            Title.Caption = #1058#1077#1083#1077#1092#1086#1085#1099
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HE_NAME'
            Footers = <>
            Title.Caption = #1043#1057
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADD_INFO'
            Footers = <>
            Title.Caption = #1044#1086#1087'. '#1080#1085#1092'.'
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'AREA_NAME'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1043#1086#1088#1086#1076
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DEBT_SUM'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1057#1072#1083#1100#1076#1086
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BALANCE'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1041#1072#1083#1072#1085#1089
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object tlbPlan: TToolBar
        Left = 0
        Top = 0
        Width = 791
        Height = 23
        Caption = 'tlbPlan'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object btnGIVE1: TToolButton
          Left = 0
          Top = 0
          Action = actGIVE
        end
        object btn5: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'btn5'
          ImageIndex = 39
          Style = tbsSeparator
        end
        object btnCancel: TToolButton
          Left = 31
          Top = 0
          Action = actCancel
        end
        object btn4: TToolButton
          Left = 54
          Top = 0
          Width = 8
          Caption = 'btn4'
          ImageIndex = 54
          Style = tbsSeparator
        end
        object btnSelectPrint: TToolButton
          Left = 62
          Top = 0
          Action = actSelectPrint
        end
        object btn3: TToolButton
          Left = 85
          Top = 0
          Width = 8
          Caption = 'btn3'
          ImageIndex = 31
          Style = tbsSeparator
        end
        object btnCloseGroup1: TToolButton
          Left = 93
          Top = 0
          Action = actCloseGroup
        end
        object chkGroupPlan: TCheckBox
          Left = 116
          Top = 0
          Width = 154
          Height = 22
          Alignment = taLeftJustify
          Caption = '  '#1042#1082#1083#1102#1095#1080#1090#1100' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1091
          TabOrder = 0
          OnClick = chkGroupPlanClick
        end
      end
    end
    object tsGive: TTabSheet
      Caption = #1042#1099#1076#1072#1085#1099' '#1074' '#1088#1072#1073#1086#1090#1091
      ImageIndex = 1
      object dbgGive: TDBGridEh
        Left = 0
        Top = 25
        Width = 791
        Height = 397
        Align = alClient
        AllowedOperations = []
        DataGrouping.DefaultStateExpanded = True
        DataSource = srcGive
        DrawMemoText = True
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        OddRowColor = clWindow
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        PopupMenu = gridPopUp
        ReadOnly = True
        SearchPanel.Enabled = True
        STFilter.Local = True
        SumList.Active = True
        SumList.VirtualRecords = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnDblClick = dbgGridDblClick
        OnDataGroupGetRowText = dbgGridDataGroupGetRowText
        OnGetCellParams = dbgGridGetCellParams
        OnGetFooterParams = dbGridGetFooterParams
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_ID'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #8470' '#1079#1072#1103#1074#1082#1080
            Title.TitleButton = True
            Width = 57
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'DD.MM.YY'
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_PLAN_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1055#1083#1072#1085
            Title.TitleButton = True
            Width = 65
          end
          item
            CellButtons = <>
            DisplayFormat = 'HH:MM'
            DynProps = <>
            EditButtons = <>
            EditMask = 'HH:MM'
            FieldName = 'RQ_TIME_FROM'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1089
            Title.TitleButton = True
            Width = 29
          end
          item
            CellButtons = <>
            DisplayFormat = 'HH:MM'
            DynProps = <>
            EditButtons = <>
            EditMask = 'HH:MM'
            FieldName = 'RQ_TIME_TO'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1087#1086
            Title.TitleButton = True
            Width = 26
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'DD.MM.YY'
            DynProps = <>
            EditButtons = <>
            FieldName = 'GIV_EXEC_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1042#1099#1076#1072#1095#1080
            Title.TitleButton = True
            Width = 60
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CONTETNT'
            Footers = <>
            Title.Caption = #1053#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100
            Title.TitleButton = True
            Width = 151
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STREET_NAME'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1059#1083#1080#1094#1072
            Title.TitleButton = True
            Width = 179
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOUSE_NO'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1044#1086#1084
            Title.TitleButton = True
            Width = 32
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLAT_NO'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1050#1074'.'
            Title.TitleButton = True
            Width = 37
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'PORCH_N'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1055'-'#1076
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLOOR_N'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1069'-'#1078
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CUST_CODE'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1050#1086#1076
            Title.TitleButton = True
            Width = 55
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ACCOUNT_NO'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1051#1080#1094'. '#1089#1095#1077#1090
            Title.TitleButton = True
            Width = 59
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FIO'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1060#1048#1054
            Title.TitleButton = True
            Width = 120
            OnGetCellParams = dbgGiveColumns13GetCellParams
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ALL_PHONES'
            Footers = <>
            Title.Caption = #1058#1077#1083#1077#1092#1086#1085#1099
            Title.TitleButton = True
            Width = 65
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RT_NAME'
            Footers = <>
            Title.Caption = #1058#1080#1087
            Title.TitleButton = True
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RES_TEXT'
            Footers = <>
            Title.Caption = #1057#1090#1072#1090#1091#1089
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'TEAM'
            Footers = <>
            Title.Caption = #1047#1074#1077#1085#1086
            Title.TitleButton = True
            Width = 77
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 100
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_BY'
            Footers = <>
            Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1072'|'#1050#1077#1084
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'dd.mm.yy hh:nn'
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1072'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_BY'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1090#1086
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'dd.mm.yy hh:nn'
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HE_NAME'
            Footers = <>
            Title.Caption = #1043#1057
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WORKERS'
            Footers = <>
            Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADD_INFO'
            Footers = <>
            Title.Caption = #1044#1086#1087'. '#1080#1085#1092'.'
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'AREA_NAME'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1043#1086#1088#1086#1076
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DEBT_SUM'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1057#1072#1083#1100#1076#1086
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BALANCE'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1041#1072#1083#1072#1085#1089
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object tlbGive: TToolBar
        Left = 0
        Top = 0
        Width = 791
        Height = 25
        Caption = 'tlbGive'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object btnOpenAll: TToolButton
          Left = 0
          Top = 0
          Action = actOpenAll
        end
        object btn1: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'btn1'
          ImageIndex = 35
          Style = tbsSeparator
        end
        object btnChangeDay: TToolButton
          Left = 31
          Top = 0
          Action = actChangeDay
        end
        object btn8: TToolButton
          Left = 54
          Top = 0
          Width = 8
          Caption = 'btn8'
          ImageIndex = 36
          Style = tbsSeparator
        end
        object btnPrint: TToolButton
          Left = 62
          Top = 0
          Action = actPrintAN
        end
        object btn7: TToolButton
          Left = 85
          Top = 0
          Width = 8
          Caption = 'btn7'
          ImageIndex = 37
          Style = tbsSeparator
        end
        object btnCloseGroup: TToolButton
          Left = 93
          Top = 0
          Action = actCloseGroup
        end
        object chkGroupGive: TCheckBox
          Left = 116
          Top = 0
          Width = 154
          Height = 22
          Alignment = taLeftJustify
          Caption = '  '#1042#1082#1083#1102#1095#1080#1090#1100' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1091
          TabOrder = 0
          OnClick = chkGroupGiveClick
        end
      end
    end
    object tsExec: TTabSheet
      Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1099
      ImageIndex = 2
      object dbgExec: TDBGridEh
        Left = 0
        Top = 25
        Width = 791
        Height = 208
        Align = alClient
        AllowedOperations = []
        DataGrouping.DefaultStateExpanded = True
        DataSource = srcExec
        DrawMemoText = True
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        OddRowColor = clWindow
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        PopupMenu = gridPopUp
        ReadOnly = True
        SearchPanel.Enabled = True
        STFilter.Local = True
        SumList.Active = True
        SumList.VirtualRecords = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnDblClick = dbgGridDblClick
        OnDataGroupGetRowText = dbgGridDataGroupGetRowText
        OnGetCellParams = dbgGridGetCellParams
        OnGetFooterParams = dbGridGetFooterParams
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_ID'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #8470' '#1079#1072#1103#1074#1082#1080
            Title.TitleButton = True
            Width = 57
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'DD.MM.YY'
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_PLAN_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1055#1083#1072#1085
            Title.TitleButton = True
            Width = 65
          end
          item
            CellButtons = <>
            DisplayFormat = 'HH:MM'
            DynProps = <>
            EditButtons = <>
            EditMask = 'HH:MM'
            FieldName = 'RQ_TIME_FROM'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1089
            Title.TitleButton = True
            Width = 29
          end
          item
            CellButtons = <>
            DisplayFormat = 'HH:MM'
            DynProps = <>
            EditButtons = <>
            EditMask = 'HH:MM'
            FieldName = 'RQ_TIME_TO'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1087#1086
            Title.TitleButton = True
            Width = 26
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'DD.MM.YY'
            DynProps = <>
            EditButtons = <>
            FieldName = 'GIV_EXEC_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1042#1099#1087'-'#1080#1103
            Title.TitleButton = True
            Width = 60
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RESULT_NAME'
            Footers = <>
            Title.Caption = #1056#1072#1089#1096'. '#1088#1077#1079#1091#1083#1100#1090#1072#1090
            Title.TitleButton = True
            Width = 67
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CONTETNT'
            Footers = <>
            Title.Caption = #1053#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100'|'#1047#1072#1103#1074#1083#1077#1085#1085#1072#1103
            Title.TitleButton = True
            Width = 151
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_DEFECT'
            Footers = <>
            Title.Caption = #1053#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100'|'#1042#1099#1103#1074#1083#1077#1085#1085#1072#1103
            Title.TitleButton = True
            Width = 161
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STREET_NAME'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1059#1083#1080#1094#1072
            Title.TitleButton = True
            Width = 179
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOUSE_NO'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1044#1086#1084
            Title.TitleButton = True
            Width = 32
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLAT_NO'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1050#1074'.'
            Title.TitleButton = True
            Width = 37
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'PORCH_N'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1055'-'#1076
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLOOR_N'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1069'-'#1078
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CUST_CODE'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1050#1086#1076
            Title.TitleButton = True
            Width = 55
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ACCOUNT_NO'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1051#1080#1094'. '#1089#1095#1077#1090
            Title.TitleButton = True
            Width = 59
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FIO'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1060#1048#1054
            Title.TitleButton = True
            Width = 120
            OnGetCellParams = dbgExecColumns15GetCellParams
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RT_NAME'
            Footers = <>
            Title.Caption = #1058#1080#1087
            Title.TitleButton = True
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RES_TEXT'
            Footers = <>
            Title.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
            Title.TitleButton = True
            Width = 64
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'TEAM'
            Footers = <>
            Title.Caption = #1047#1074#1077#1085#1086
            Title.TitleButton = True
            Width = 77
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 100
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_BY'
            Footers = <>
            Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1072'|'#1050#1077#1084
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'dd.mm.yy hh:nn'
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1072'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_BY'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1090#1086
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'dd.mm.yy hh:nn'
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ALL_PHONES'
            Footers = <>
            Title.Caption = #1058#1077#1083#1077#1092#1086#1085#1099
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HE_NAME'
            Footers = <>
            Title.Caption = #1043#1057
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RECEIPT'
            Footers = <>
            Title.Caption = #1050#1074#1080#1090#1072#1085#1094#1080#1103
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WORKERS'
            Footers = <>
            Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Add_Info'
            Footers = <>
            Title.Caption = #1044#1086#1087'. '#1080#1085#1092'.'
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'AREA_NAME'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1043#1086#1088#1086#1076
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DEBT_SUM'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1057#1072#1083#1100#1076#1086
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BALANCE'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1041#1072#1083#1072#1085#1089
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EXEC_MINUT'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1086' '#1079#1072', '#1084#1080#1085
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object tlb1: TToolBar
        Left = 0
        Top = 0
        Width = 791
        Height = 25
        Caption = 'tlbGive'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object btnSelectPrint1: TToolButton
          Left = 0
          Top = 0
          Action = actSelectPrint
        end
        object btn9: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'btn9'
          ImageIndex = 25
          Style = tbsSeparator
        end
        object btnShowInfo: TToolButton
          Left = 31
          Top = 0
          Action = actShowInfo
        end
        object chkGrupeExec: TCheckBox
          Left = 54
          Top = 0
          Width = 159
          Height = 22
          Alignment = taLeftJustify
          Caption = '  '#1042#1082#1083#1102#1095#1080#1090#1100' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1091
          TabOrder = 0
          OnClick = chkGrupeExecClick
        end
      end
      object pnlClientInfo: TPanel
        Left = 0
        Top = 233
        Width = 791
        Height = 189
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object pnlContetnt: TPanel
          Left = 0
          Top = 0
          Width = 791
          Height = 189
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Label5: TLabel
            Left = 0
            Top = 0
            Width = 791
            Height = 13
            Align = alTop
            Caption = #1042#1103#1074#1083#1077#1085#1085#1072#1103' '#1085#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100' '
          end
          object splWork: TSplitter
            Left = 164
            Top = 13
            Height = 176
            Align = alRight
          end
          object dbContent: TDBMemoEh
            Left = 0
            Top = 13
            Width = 164
            Height = 176
            ScrollBars = ssVertical
            Align = alClient
            AutoSize = False
            DataField = 'RQ_DEFECT'
            DataSource = srcExec
            DynProps = <>
            EditButtons = <>
            ShowHint = True
            TabOrder = 0
            Visible = True
            WantReturns = True
          end
          object pnl1: TPanel
            Left = 167
            Top = 13
            Width = 624
            Height = 176
            Align = alRight
            BevelOuter = bvNone
            Caption = 'pnl1'
            TabOrder = 1
            object splMat: TSplitter
              Left = 271
              Top = 0
              Height = 176
              Align = alRight
            end
            object pnlMaterials: TPanel
              Left = 274
              Top = 0
              Width = 350
              Height = 176
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 1
              inline frmReqMaterials: TfrmReqMaterials
                Left = 0
                Top = 0
                Width = 350
                Height = 176
                Align = alClient
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                inherited dbGrid: TDBGridEh
                  Width = 350
                  Height = 176
                  Columns = <
                    item
                      CellButtons = <>
                      DynProps = <>
                      EditButtons = <>
                      FieldName = 'M_ID'
                      Footers = <>
                      Visible = False
                    end
                    item
                      CellButtons = <>
                      DynProps = <>
                      EditButtons = <>
                      FieldName = 'NAME'
                      Footer.ValueType = fvtCount
                      Footers = <>
                      Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
                      Title.TitleButton = True
                      Width = 111
                    end
                    item
                      AutoFitColWidth = False
                      CellButtons = <>
                      DisplayFormat = ',,#.#####'
                      DynProps = <>
                      EditButtons = <>
                      FieldName = 'QNT'
                      Footers = <>
                      Title.Caption = #1050'-'#1074#1086
                      Title.TitleButton = True
                      Width = 55
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
                      Width = 51
                    end
                    item
                      AutoFitColWidth = False
                      CellButtons = <>
                      DisplayFormat = ',#.##'
                      DynProps = <>
                      EditButtons = <>
                      FieldName = 'COST'
                      Footer.DisplayFormat = ',#.##'
                      Footer.FieldName = 'COST'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
                      Title.TitleButton = True
                    end
                    item
                      CellButtons = <>
                      DynProps = <>
                      EditButtons = <>
                      FieldName = 'RM_NOTICE'
                      Footers = <>
                      Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                      Title.TitleButton = True
                    end>
                end
                inherited dsReqMaterials: TpFIBDataSet
                  SelectSQL.Strings = (
                    'select'
                    
                      '    m.M_ID ID, m.NAME, rM.RM_NOTICE notice, m.DIMENSION, rM.RM_Q' +
                      'UANT QNT'
                    
                      '    , rM.RM_QUANT * rm.rm_cost as COST, coalesce(rm.CALC, 0) CAL' +
                      'C'
                    '    , o.O_Name WH_NAME'
                    '    from MATERIALS m'
                    '        inner join REQUEST_MATERIALS rM on (M.M_ID = rM.M_ID)'
                    
                      '        left outer join objects o on (o.O_Id = rm.Wh_Id and o.O_' +
                      'Type = 10)'
                    '    where rM.RQ_ID = :RQ_ID'
                    'union all'
                    'select'
                    
                      '    m.M_ID ID, m.NAME||'#39' ( '#1042#1086#1079#1074#1088#1072#1090' )'#39', rM.Notice notice, m.DEMEN' +
                      'SION, rM.Quant*(-1) QNT'
                    '    , rM.Quant*(-1) * m.Cost as COST, 0 as CALC '
                    '    , o.O_Name WH_NAME'
                    '    from MATERIALS m'
                    
                      '        inner join Request_Materials_Return rM on (M.M_ID = rM.M' +
                      '_ID)'
                    
                      '        left outer join objects o on (o.O_Id = rm.Wh_Id and o.O_' +
                      'Type = 10)'
                    '    where rM.RQ_ID = :RQ_ID'
                    'order by 2')
                  AutoCommit = False
                  DataSource = srcExec
                  Left = 275
                  Top = 70
                  WaitEndMasterScroll = True
                  dcForceOpen = True
                end
              end
            end
            object pnlWorks: TPanel
              Left = 0
              Top = 0
              Width = 271
              Height = 176
              Align = alClient
              BevelOuter = bvNone
              Caption = 'pnlWorks'
              TabOrder = 0
              inline frmWorks: TfrmReqWorks
                Left = 0
                Top = 0
                Width = 271
                Height = 176
                Align = alClient
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                inherited dbGrid: TDBGridEh
                  Width = 271
                  Height = 176
                  Columns = <
                    item
                      CellButtons = <>
                      DynProps = <>
                      EditButtons = <>
                      FieldName = 'M_ID'
                      Footers = <>
                      Visible = False
                    end
                    item
                      CellButtons = <>
                      DynProps = <>
                      EditButtons = <>
                      FieldName = 'NAME'
                      Footer.ValueType = fvtCount
                      Footers = <>
                      Title.Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
                      Width = 89
                    end
                    item
                      AutoFitColWidth = False
                      CellButtons = <>
                      DisplayFormat = ',#.#####'
                      DynProps = <>
                      EditButtons = <>
                      FieldName = 'W_QUANT'
                      Footers = <>
                      Title.Caption = #1050'-'#1074#1086
                      Width = 56
                    end
                    item
                      AutoFitColWidth = False
                      CellButtons = <>
                      DisplayFormat = ',#0.#####'
                      DynProps = <>
                      EditButtons = <>
                      FieldName = 'TOTAL'
                      Footer.DisplayFormat = ',#0.#####'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #1085'/'#1095
                    end
                    item
                      AutoFitColWidth = False
                      CellButtons = <>
                      DisplayFormat = ',#.##'
                      DynProps = <>
                      EditButtons = <>
                      FieldName = 'T_COST'
                      Footer.DisplayFormat = ',#.##'
                      Footer.ValueType = fvtSum
                      Footers = <>
                      Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
                    end
                    item
                      CellButtons = <>
                      DynProps = <>
                      EditButtons = <>
                      FieldName = 'NOTICE'
                      Footers = <>
                      Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                      Width = 69
                    end
                    item
                      AutoFitColWidth = False
                      CellButtons = <>
                      DynProps = <>
                      EditButtons = <>
                      FieldName = 'W_COST'
                      Footers = <>
                      Title.Caption = #1062#1077#1085#1072
                      Width = 0
                    end>
                end
                inherited dsReqWorks: TpFIBDataSet
                  DataSource = srcExec
                  Left = 36
                  WaitEndMasterScroll = True
                  dcForceOpen = True
                end
              end
            end
          end
        end
      end
    end
    object tsAll: TTabSheet
      Caption = #1042#1089#1077' '#1079#1072#1103#1074#1082#1080
      ImageIndex = 3
      object dbgGrid: TDBGridEh
        Left = 0
        Top = 25
        Width = 791
        Height = 397
        Align = alClient
        AllowedOperations = []
        DataGrouping.DefaultStateExpanded = True
        DataSource = srcAll
        DrawMemoText = True
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        OddRowColor = clWindow
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        PopupMenu = gridPopUp
        ReadOnly = True
        SearchPanel.Enabled = True
        STFilter.Local = True
        SumList.Active = True
        SumList.VirtualRecords = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnDblClick = dbgGridDblClick
        OnDataGroupGetRowText = dbgGridDataGroupGetRowText
        OnGetCellParams = dbgGridGetCellParams
        OnGetFooterParams = dbGridGetFooterParams
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_ID'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #8470' '#1079#1072#1103#1074#1082#1080
            Title.TitleButton = True
            Width = 57
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'DD.MM.YY'
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_PLAN_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1055#1083#1072#1085
            Title.TitleButton = True
            Width = 65
          end
          item
            CellButtons = <>
            DisplayFormat = 'HH:MM'
            DynProps = <>
            EditButtons = <>
            EditMask = 'HH:MM'
            FieldName = 'RQ_TIME_FROM'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1089
            Title.TitleButton = True
            Width = 29
          end
          item
            CellButtons = <>
            DisplayFormat = 'HH:MM'
            DynProps = <>
            EditButtons = <>
            EditMask = 'HH:MM'
            FieldName = 'RQ_TIME_TO'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1087#1086
            Title.TitleButton = True
            Width = 26
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'DD.MM.YY'
            DynProps = <>
            EditButtons = <>
            FieldName = 'GIV_EXEC_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072'|'#1042#1099#1076'/'#1042#1099#1087
            Title.TitleButton = True
            Width = 60
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CONTETNT'
            Footers = <>
            Title.Caption = #1053#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100'|'#1047#1072#1103#1074#1083#1077#1085#1085#1072#1103
            Title.TitleButton = True
            Width = 151
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'TROUBLE'
            Footers = <>
            Title.Caption = #1053#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100'|'#1042#1099#1103#1074#1083#1077#1085#1085#1072#1103
            Title.TitleButton = True
            Width = 161
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STREET_NAME'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1059#1083#1080#1094#1072
            Title.TitleButton = True
            Width = 179
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOUSE_NO'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1044#1086#1084
            Title.TitleButton = True
            Width = 32
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLAT_NO'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1050#1074'.'
            Title.TitleButton = True
            Width = 37
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'PORCH_N'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1055'-'#1076
            Title.TitleButton = True
            Width = 22
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLOOR_N'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1069'-'#1078
            Title.TitleButton = True
            Width = 22
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CUST_CODE'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1050#1086#1076
            Title.TitleButton = True
            Width = 55
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ACCOUNT_NO'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1051#1080#1094'. '#1089#1095#1077#1090
            Title.TitleButton = True
            Width = 59
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FIO'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1060#1048#1054
            Title.TitleButton = True
            Width = 120
            OnGetCellParams = dbgGridColumns14GetCellParams
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RT_NAME'
            Footers = <>
            Title.Caption = #1058#1080#1087
            Title.TitleButton = True
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RES_TEXT'
            Footers = <>
            Title.Caption = #1057#1090#1072#1090#1091#1089
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ALL_PHONES'
            Footers = <>
            Title.Caption = #1058#1077#1083#1077#1092#1086#1085#1099
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'TEAM'
            Footers = <>
            Title.Caption = #1047#1074#1077#1085#1086
            Title.TitleButton = True
            Width = 77
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 100
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_BY'
            Footers = <>
            Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1072'|'#1050#1077#1084
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'dd.mm.yy hh:nn'
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1072'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_BY'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1090#1086
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'dd.mm.yy hh:nn'
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1086#1075#1076#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HE_NAME'
            Footers = <>
            Title.Caption = #1043#1057
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WORKERS'
            Footers = <>
            Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADD_INFO'
            Footers = <>
            Title.Caption = #1044#1086#1087'. '#1080#1085#1092'.'
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'AREA_NAME'
            Footers = <>
            Title.Caption = #1040#1076#1088#1077#1089'|'#1043#1086#1088#1086#1076
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DEBT_SUM'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1057#1072#1083#1100#1076#1086
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BALANCE'
            Footers = <>
            Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1041#1072#1083#1072#1085#1089
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object ToolBar2: TToolBar
        Left = 0
        Top = 0
        Width = 791
        Height = 25
        Caption = 'tlbGive'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object chkGroupAll: TCheckBox
          Left = 0
          Top = 0
          Width = 154
          Height = 22
          Alignment = taLeftJustify
          Caption = '  '#1042#1082#1083#1102#1095#1080#1090#1100' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1091
          TabOrder = 0
          OnClick = chkGroupAllClick
        end
      end
    end
  end
  object pmPopUp: TPopupMenu
    Left = 159
    Top = 158
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
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082' ...'
      OnClick = pmgSaveSelectionClick
    end
  end
  object dsReqWorks: TpFIBDataSet
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 40
    Top = 211
  end
  object actions: TActionList
    Left = 98
    Top = 162
    object actQuickFilter: TAction
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 40
      ShortCut = 16465
      OnExecute = actQuickFilterExecute
    end
    object actNew: TAction
      Caption = #1053#1086#1074#1072#1103' '#1079#1072#1103#1074#1082#1072
      Hint = #1053#1086#1074#1072#1103' '#1079#1072#1103#1074#1082#1072
      ImageIndex = 2
      ShortCut = 45
      OnExecute = actNewExecute
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1103#1074#1082#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1103#1074#1082#1091
      ImageIndex = 3
      OnExecute = actDeleteExecute
    end
    object actShowInfo: TAction
      Caption = #1044#1086#1087'. '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      Checked = True
      Hint = #1044#1086#1087'. '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ImageIndex = 24
      ShortCut = 16457
      OnExecute = actShowInfoExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 5
      ShortCut = 16464
      OnExecute = actPrintExecute
    end
    object actFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088
      Hint = #1060#1080#1083#1100#1090#1088
      ImageIndex = 0
      ShortCut = 114
      OnExecute = actFilterExecute
    end
    object actEnableFilter: TAction
      Caption = #1042#1082#1083'./'#1042#1099#1082#1083'. '#1092#1080#1083#1100#1090#1088
      Checked = True
      Hint = #1042#1082#1083'./'#1042#1099#1082#1083'. '#1092#1080#1083#1100#1090#1088
      ImageIndex = 18
      OnExecute = actEnableFilterExecute
    end
    object actSelectPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      Hint = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ImageIndex = 30
      OnExecute = actSelectPrintExecute
    end
    object actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1103#1074#1082#1091
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1103#1074#1082#1091
      ImageIndex = 4
      ShortCut = 113
      OnExecute = actEditExecute
    end
    object actGIVE: TAction
      Caption = #1042#1099#1076#1072#1090#1100' '#1079#1072#1103#1074#1082#1080
      Hint = #1042#1099#1076#1072#1090#1100' '#1079#1072#1103#1074#1082#1080
      ImageIndex = 38
      OnExecute = actGIVEExecute
    end
    object actCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072' '#1079#1072#1103#1074#1082#1080
      Hint = #1054#1090#1084#1077#1085#1072' '#1079#1072#1103#1074#1082#1080
      ImageIndex = 53
      Visible = False
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 27
      OnExecute = actRefreshExecute
    end
    object actChangeDay: TAction
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1085#1072' '#1076#1072#1090#1091
      Hint = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1079#1072#1103#1074#1082#1091' '#1085#1072' '#1076#1088#1091#1075#1086#1081' '#1076#1077#1085#1100
      ImageIndex = 34
      OnExecute = actChangeDayExecute
    end
    object actOpenAll: TAction
      Caption = #1086#1090#1082#1088#1099#1090#1100
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1086#1090#1084#1077#1095#1077#1085#1099#1077' '#1079#1072#1103#1074#1082#1080
      ImageIndex = 54
      OnExecute = actOpenAllExecute
    end
    object actPrintAN: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1072#1082#1090'-'#1085#1072#1088#1103#1076
      Hint = #1055#1077#1095#1072#1090#1072#1090#1100' '#1040#1082#1090'-'#1085#1072#1088#1103#1076
      ImageIndex = 5
      OnExecute = actPrintANExecute
    end
    object actCloseGroup: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1075#1088#1091#1087#1087#1091
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1075#1088#1091#1087#1087#1091' '#1079#1072#1103#1074#1086#1082
      ImageIndex = 31
      OnExecute = actCloseGroupExecute
    end
    object actFilterCustomer: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1089#1087#1080#1089#1082#1077
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      ImageIndex = 9
      OnExecute = actFilterCustomerExecute
    end
    object actDouble: TAction
      Caption = #1044#1091#1073#1083#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1091
      Hint = #1044#1091#1073#1083#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1091
      ImageIndex = 13
      OnExecute = actDoubleExecute
    end
    object actPlaner: TAction
      Caption = 'actPlaner'
      ImageIndex = 80
      OnExecute = actPlanerExecute
    end
    object actTask: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      ImageIndex = 87
      ShortCut = 121
      OnExecute = actTaskExecute
    end
    object actOpenHouse: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1076#1086#1084
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1076#1086#1084' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      OnExecute = actOpenHouseExecute
    end
    object actCopyID: TAction
      Caption = 'actCopyID'
      ShortCut = 24649
      OnExecute = actCopyIDExecute
    end
  end
  object dsAll: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    REQUEST'
      'WHERE'
      '        RQ_ID = :OLD_RQ_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    C.CUSTOMER_ID,'
      '    R.RQ_ID,'
      '    R.RQ_TYPE,'
      '    R.ADDED_ON RQ_DATE,'
      '    R.RQ_CUSTOMER,'
      '    R.RQ_COMPLETED,'
      '    R.RQ_PLAN_DATE,'
      
        '    coalesce(TPL.RQ_CONTENT, '#39#39') || coalesce('#39'.'#39' || R.ADD_INFO, ' +
        #39#39') || iif(coalesce(R.RQ_CONTENT, '#39#39') <> '#39#39', coalesce('#39' ('#39' || R.' +
        'RQ_CONTENT || '#39')'#39', '#39#39'), '#39#39') as CONTETNT,'
      
        '    coalesce(RR.NAME, '#39#39') || '#39' '#39' || coalesce(R.RQ_DEFECT, '#39#39') as' +
        ' TROUBLE,'
      '    R.RQ_CONTENT,'
      '    R.RQ_DEFECT,'
      '    R.RQ_NOTICE,'
      '    R.EDIT_BY,'
      '    R.EDIT_ON,'
      '    S.STREET_ID,'
      '    R.HOUSE_ID,'
      '    R.ADDED_BY,'
      '    R.ADDED_ON,'
      '    R.RQ_TIME_FROM,'
      '    R.RQ_TIME_TO,'
      
        '    coalesce(cast(R.RQ_EXEC_TIME as date), cast(R.RQ_COMPLETED a' +
        's date)) as GIV_EXEC_DATE,'
      '    R.RQ_EXEC_TIME,'
      '    R.GIVE_BY,'
      '    R.GIVE_METHOD,'
      '    R.REQ_RESULT,'
      '    C.CUST_CODE,'
      '    coalesce(RT.RT_PRINTFORM, '#39#39') as REPORT,'
      '    coalesce(RT.RT_NAME, '#39#39') as RT_NAME,'
      '    S.STREET_NAME || '#39' '#39' || S.STREET_SHORT as STREET_NAME,'
      '    H.HOUSE_NO,'
      '    coalesce(R.FLAT_NO, '#39#39') as FLAT_NO,'
      '    case R.REQ_RESULT'
      '      when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      '      when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      '      when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      '      when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      '    end as RES_TEXT,'
      '    --rt.O_Numericfield as DAYS,'
      '    1 as DAYS,'
      '    coalesce(tpl.RQ_COLOR, RT.RT_COLOR) RT_COLOR,'
      '    R.PHONE,'
      '    HE.HE_NAME,'
      '    cast(coalesce(RE.TEAM, WG.NAME) as varchar(255)) as TEAM,'
      '    RE.WORKERS,'
      '    (select'
      '         list(distinct PHONE)'
      '         from (select'
      '                   R.PHONE'
      '                   from REQUEST RI'
      '                   where RI.RQ_ID = R.RQ_ID'
      '               union'
      '               select'
      '                   C.CC_VALUE PHONE'
      '                   from CUSTOMER_CONTACTS C'
      '                   where C.CUSTOMER_ID = R.RQ_CUSTOMER'
      '                         and C.CC_TYPE < 2)) ALL_PHONES,'
      '    R.RECEIPT,'
      '    RR.NAME as RESULT_NAME,     '
      '    coalesce(r.Porch_N, HF.porch_n) porch_n,'
      '    coalesce(R.Floor_N, hf.floor_n) floor_n, '
      '    r.Add_Info,'
      '    coalesce(C.SURNAME || '#39' '#39' || C.INITIALS, n.Name, '#39#39') as FIO,'
      '    coalesce(C.ACCOUNT_NO, '#39#1059#1079#1077#1083' '#39'||n.NAME, '#39#39') ACCOUNT_NO'
      '    , r.Node_id'
      '    , c.DEBT_SUM'
      '    , -1*c.debt_sum as BALANCE    '
      '    , a.AREA_NAME'
      '    from REQUEST R'
      '        inner join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)'
      '        inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      '        left outer join area a on (a.AREA_ID = s.AREA_ID)'
      '        left outer join WORKGROUPS WG on (WG.WG_ID = H.WG_ID)'
      
        '        left outer join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_I' +
        'D)'
      
        '        left outer join CUSTOMER C on (R.RQ_CUSTOMER = C.CUSTOME' +
        'R_ID)'
      
        '        left outer join REQUEST_TEMPLATES TPL on (TPL.RQTL_ID = ' +
        'R.RQTL_ID)'
      
        '        left outer join REQUEST_RESULTS RR on (RR.RR_ID = R.RESU' +
        'LT_ID)'
      '        left outer join HEADEND HE on (H.HEADEND_ID = HE.HE_ID)'
      
        '        left outer join HOUSEFLATS hf on (hf.house_id = r.house_' +
        'id and hf.flat_no = r.flat_no)'
      '        left outer join NODES n on (n.Node_Id = r.Node_Id)'
      '        left outer join(select'
      '                            RE.RQ_ID,'
      '                            list(distinct W.TEAM) TEAM,'
      
        '                            list(W.SURNAME || coalesce('#39' '#39' || W.' +
        'FIRSTNAME, '#39#39'), '#39', '#39') as WORKERS'
      '                            from REQUEST_EXECUTORS RE'
      
        '                                inner join WORKER W on (RE.EXEC_' +
        'ID = W.WORKER_ID)'
      
        '                            group by RE.RQ_ID) RE on (RE.RQ_ID =' +
        ' R.RQ_ID)'
      '   '
      ' WHERE '
      '        R.RQ_ID = :OLD_RQ_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    C.CUSTOMER_ID,'
      '    R.RQ_ID,'
      '    R.RQ_TYPE,'
      '    R.ADDED_ON RQ_DATE,'
      '    R.RQ_CUSTOMER,'
      '    R.RQ_COMPLETED,'
      '    R.RQ_PLAN_DATE,'
      
        '    coalesce(TPL.RQ_CONTENT, '#39#39') || coalesce('#39'.'#39' || R.ADD_INFO, ' +
        #39#39') || iif(coalesce(R.RQ_CONTENT, '#39#39') <> '#39#39', coalesce('#39' ('#39' || R.' +
        'RQ_CONTENT || '#39')'#39', '#39#39'), '#39#39') as CONTETNT,'
      
        '    coalesce(RR.NAME, '#39#39') || '#39' '#39' || coalesce(R.RQ_DEFECT, '#39#39') as' +
        ' TROUBLE,'
      '    R.RQ_CONTENT,'
      '    R.RQ_DEFECT,'
      '    R.RQ_NOTICE,'
      '    R.EDIT_BY,'
      '    R.EDIT_ON,'
      '    S.STREET_ID,'
      '    R.HOUSE_ID,'
      '    R.ADDED_BY,'
      '    R.ADDED_ON,'
      '    R.RQ_TIME_FROM,'
      '    R.RQ_TIME_TO,'
      
        '    coalesce(cast(R.RQ_EXEC_TIME as date), cast(R.RQ_COMPLETED a' +
        's date)) as GIV_EXEC_DATE,'
      '    R.RQ_EXEC_TIME,'
      '    R.GIVE_BY,'
      '    R.GIVE_METHOD,'
      '    R.REQ_RESULT,'
      '    C.CUST_CODE,'
      '    coalesce(RT.RT_PRINTFORM, '#39#39') as REPORT,'
      '    coalesce(RT.RT_NAME, '#39#39') as RT_NAME,'
      '    S.STREET_NAME || '#39' '#39' || S.STREET_SHORT as STREET_NAME,'
      '    H.HOUSE_NO,'
      '    coalesce(R.FLAT_NO, '#39#39') as FLAT_NO,'
      '    case R.REQ_RESULT'
      '      when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      '      when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      '      when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      '      when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      '    end as RES_TEXT,'
      '    --rt.O_Numericfield as DAYS,'
      '    1 as DAYS,'
      '    coalesce(tpl.RQ_COLOR, RT.RT_COLOR) RT_COLOR,'
      '    R.PHONE,'
      '    HE.HE_NAME,'
      '    cast(coalesce(RE.TEAM, WG.NAME) as varchar(255)) as TEAM,'
      '    RE.WORKERS,'
      '    (select'
      '         list(distinct PHONE)'
      '         from (select'
      '                   R.PHONE'
      '                   from REQUEST RI'
      '                   where RI.RQ_ID = R.RQ_ID'
      '               union'
      '               select'
      '                   C.CC_VALUE PHONE'
      '                   from CUSTOMER_CONTACTS C'
      '                   where C.CUSTOMER_ID = R.RQ_CUSTOMER'
      '                         and C.CC_TYPE < 2)) ALL_PHONES,'
      '    R.RECEIPT,'
      '    RR.NAME as RESULT_NAME,     '
      '    coalesce(r.Porch_N, HF.porch_n) porch_n,'
      '    coalesce(R.Floor_N, hf.floor_n) floor_n, '
      '    r.Add_Info,'
      '    coalesce(C.SURNAME || '#39' '#39' || C.INITIALS, n.Name, '#39#39') as FIO,'
      '    coalesce(C.ACCOUNT_NO, '#39#1059#1079#1077#1083' '#39'||n.NAME, '#39#39') ACCOUNT_NO'
      '    , r.Node_id'
      '    , c.DEBT_SUM'
      '    , -1*c.debt_sum as BALANCE    '
      '    , a.AREA_NAME'
      '    from REQUEST R'
      '        inner join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)'
      '        inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      '        left outer join area a on (a.AREA_ID = s.AREA_ID)'
      '        left outer join WORKGROUPS WG on (WG.WG_ID = H.WG_ID)'
      
        '        left outer join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_I' +
        'D)'
      
        '        left outer join CUSTOMER C on (R.RQ_CUSTOMER = C.CUSTOME' +
        'R_ID)'
      
        '        left outer join REQUEST_TEMPLATES TPL on (TPL.RQTL_ID = ' +
        'R.RQTL_ID)'
      
        '        left outer join REQUEST_RESULTS RR on (RR.RR_ID = R.RESU' +
        'LT_ID)'
      '        left outer join HEADEND HE on (H.HEADEND_ID = HE.HE_ID)'
      
        '        left outer join HOUSEFLATS hf on (hf.house_id = r.house_' +
        'id and hf.flat_no = r.flat_no)'
      '        left outer join NODES n on (n.Node_Id = r.Node_Id)'
      '        left outer join(select'
      '                            RE.RQ_ID,'
      '                            list(distinct W.TEAM) TEAM,'
      
        '                            list(W.SURNAME || coalesce('#39' '#39' || W.' +
        'FIRSTNAME, '#39#39'), '#39', '#39') as WORKERS'
      '                            from REQUEST_EXECUTORS RE'
      
        '                                inner join WORKER W on (RE.EXEC_' +
        'ID = W.WORKER_ID)'
      
        '                            group by RE.RQ_ID) RE on (RE.RQ_ID =' +
        ' R.RQ_ID)'
      '    WHERE'
      ''
      '    @@SQL_FILTER%1=1@'
      ''
      '    ORDER BY R.RQ_ID  ')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 576
    Top = 364
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
  object gridPopUp: TPopupMenu
    Left = 107
    Top = 235
    object N6: TMenuItem
      Action = actNew
    end
    object N9: TMenuItem
      Action = actEdit
    end
    object N8: TMenuItem
      Caption = '-'
    end
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
  object MainMenu1: TMainMenu
    Left = 240
    Top = 152
    object N1: TMenuItem
      Caption = #1047#1072#1103#1074#1082#1080
      GroupIndex = 3
      object N11: TMenuItem
        Action = actNew
      end
      object N12: TMenuItem
        Action = actEdit
      end
      object N14: TMenuItem
        Caption = '-'
      end
      object N15: TMenuItem
        Action = actGIVE
      end
      object N16: TMenuItem
        Action = actChangeDay
      end
      object miOpenHouse: TMenuItem
        Action = actOpenHouse
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object miN19: TMenuItem
        Caption = #1047#1072#1082#1088#1077#1087#1080#1090#1100' '#1089#1090#1086#1083#1073#1094#1099' '#1090#1072#1073#1083#1080#1094
        OnClick = miN19Click
      end
      object N2: TMenuItem
        Action = actFilter
      end
      object N3: TMenuItem
        Action = actEnableFilter
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object N5: TMenuItem
        Action = actSelectPrint
      end
      object N7: TMenuItem
        Action = actPrint
      end
      object N13: TMenuItem
        Action = actShowInfo
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object N18: TMenuItem
        Action = actDelete
      end
    end
  end
  object frxDBrequests: TfrxDBDataset
    UserName = #1047#1040#1071#1042#1050#1048
    OnCheckEOF = frxDBrequestsCheckEOF
    OnFirst = frxDBrequestsFirst
    OnNext = frxDBrequestsNext
    OnPrior = frxDBrequestsPrior
    CloseDataSource = False
    FieldAliases.Strings = (
      'ACCOUNT_NO='#1051#1048#1062#1045#1042#1054#1049'_'#1040#1041#1054#1053#1045#1053#1058#1040
      'ADDED_BY=ADDED_BY'
      'ADDED_ON=ADDED_ON'
      'ALL_PHONES=ALL_PHONES'
      'CONTETNT=CONTETNT'
      'CUST_CODE='#1050#1054#1044'_'#1040#1041#1054#1053#1045#1053#1058#1040
      'CUSTOMER_ID=CUSTOMER_ID'
      'DAYS=DAYS'
      'EDIT_BY=EDIT_BY'
      'EDIT_ON=EDIT_ON'
      'FIO='#1060#1048#1054'_'#1040#1041#1054#1053#1045#1053#1058#1040
      'FLAT_NO='#1082#1074#1072#1088#1090#1080#1088#1072
      'FLOOR_N='#1101#1090#1072#1078
      'GIV_EXEC_DATE='#1044#1040#1058#1040'_'#1042#1067#1055#1054#1051#1053#1045#1053#1048#1071
      'GIVE_BY=GIVE_BY'
      'GIVE_METHOD=GIVE_METHOD'
      'HE_NAME=HE_NAME'
      'HOUSE_ID='#1082#1086#1076'_'#1076#1086#1084#1072
      'HOUSE_NO='#1044#1054#1052
      'PHONE='#1058#1045#1051#1045#1060#1054#1053
      'PORCH_N='#1087#1086#1076#1098#1077#1079#1076
      'RECEIPT=RECEIPT'
      'REPORT=REPORT'
      'REQ_RESULT='#1056#1045#1047#1059#1051#1068#1058#1040#1058
      'RES_TEXT='#1053#1045#1048#1057#1055#1056#1040#1042#1053#1054#1057#1058#1068
      'RESULT_NAME=RESULT_NAME'
      'RQ_COMPLETED='#1042#1056#1045#1052#1071'_'#1042#1067#1044#1040#1063#1048
      'RQ_CONTENT=RQ_CONTENT'
      'RQ_CUSTOMER='#1059#1053'. '#1053#1054#1052#1045#1056' '#1040#1041#1054#1053#1045#1053#1058#1040
      'RQ_DATE='#1044#1040#1058#1040'_'#1055#1056#1048#1045#1052#1040
      'RQ_DEFECT=RQ_DEFECT'
      'RQ_EXEC_TIME='#1042#1056#1045#1052#1071'_'#1048#1057#1055#1054#1051#1053
      'RQ_ID='#1053#1054#1052#1045#1056
      'RQ_NOTICE='#1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
      'RQ_PLAN_DATE='#1053#1040'_'#1044#1040#1058#1059
      'RQ_TIME_FROM='#1042#1056#1045#1052#1071'_'#1057
      'RQ_TIME_TO='#1042#1056#1045#1052#1071'_'#1055#1054
      'RQ_TYPE='#1058#1048#1055
      'RT_COLOR=RT_COLOR'
      'RT_NAME=RT_NAME'
      'STREET_NAME='#1059#1051#1048#1062#1040
      'TEAM='#1047#1042#1045#1053#1054
      'TROUBLE='#1057#1054#1044#1045#1056#1046'_'#1047#1040#1071#1042#1050#1048
      'WORKERS=WORKERS')
    DataSource = srcPlan
    BCDToCurrency = False
    DataSetOptions = []
    Left = 191
    Top = 223
  end
  object frxDBReqMaterials: TfrxDBDataset
    UserName = #1052#1040#1058#1045#1056#1048#1040#1051#1067'_'#1047#1040#1071#1042#1050#1048
    CloseDataSource = False
    FieldAliases.Strings = (
      'O_ID=ID'
      'O_NAME='#1052#1040#1058#1045#1056#1048#1040#1051
      'RM_QUANT='#1050#1054#1051#1042#1054
      'O_DIMENSION='#1045#1044'_'#1048#1047#1052)
    BCDToCurrency = False
    DataSetOptions = []
    Left = 283
    Top = 225
  end
  object mtPlan: TMemTableEh
    Params = <>
    DataDriver = drvPlan
    Left = 395
    Top = 205
  end
  object drvPlan: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <
      item
        DataType = ftInteger
        Name = 'RQ_ID'
        ParamType = ptInput
      end>
    DeleteCommand.CommandText.Strings = (
      'DELETE FROM   REQUEST WHERE   RQ_ID = :RQ_ID')
    GetrecCommand.Params = <
      item
        DataType = ftInteger
        Name = 'RQ_ID'
        ParamType = ptInput
      end>
    GetrecCommand.CommandText.Strings = (
      'SELECT r.RQ_ID, '
      'r.RQ_TYPE, '
      'R.added_on RQ_DATE, '
      'r.RQ_CUSTOMER, '
      'r.RQ_COMPLETED,'
      'r.RQ_PLAN_DATE,'
      'coalesce(r.Rq_Defect, r.Rq_Content) as trouble,'
      'r.RQ_NOTICE,'
      'r.EDIT_BY,'
      'r.EDIT_ON, '
      's.STREET_ID,'
      'r.HOUSE_ID, '
      'r.FLAT_NO, '
      'r.PORCH_N, '
      'r.FLOOR_N, '
      'r.PHONE, '
      'r.ADDED_BY, '
      'r.ADDED_ON, '
      'r.RQ_TIME_FROM,'
      'r.RQ_TIME_TO,'
      
        'coalesce(cast(r.RQ_EXEC_TIME as date), cast(r.RQ_COMPLETED as da' +
        'te)) as GIV_EXEC_DATE,'
      'r.RQ_EXEC_TIME,'
      'r.GIVE_BY, '
      'r.GIVE_METHOD, '
      'r.REQ_RESULT,'
      'c.ACCOUNT_NO, c.CUST_CODE, c.SURNAME ||'#39' '#39' ||c.INITIALS as FIO, '
      
        'coalesce(RT.RT_PRINTFORM,'#39#39') as REPORT, coalesce(rt.RT_Name,'#39#39') ' +
        'as Rt_Name,'
      's.STREET_NAME||'#39' '#39'||s.street_short as STREET_NAME,'
      'h.HOUSE_NO,'
      'coalesce(r.flat_no,'#39#39') as FLAT_NO,'
      'CASE R.Req_Result'
      ' when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      ' when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      ' when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      ' when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      'end as Res_text,'
      '--rt.O_Numericfield as DAYS,'
      '1 as DAYS,'
      
        'coalesce(cast((select list(DISTINCT w.team) from Request_Executo' +
        'rs re inner join Worker w on (re.Exec_Id = w.Worker_Id) where re' +
        '.Rq_Id = r.Rq_Id) as VARCHAR(200)),'
      'wg.name) as TEAM'
      ''
      'FROM REQUEST R'
      '   inner join house h on (r.house_id = h.house_id)'
      '   inner join street s on (s.street_id = h.street_id)'
      '   left outer join workgroups wg on (wg.wg_id = h.wg_id)'
      '   LEFT OUTER JOIN REQUEST_TYPES RT ON (R.RQ_TYPE = RT.RT_Id)'
      '   LEFT OUTER JOIN CUSTOMER C ON (R.RQ_CUSTOMER = C.CUSTOMER_ID)'
      ' WHERE '
      '        R.RQ_ID = :RQ_ID'
      '    ')
    ProviderDataSet = dsPlan
    KeyFields = 'RQ_ID'
    Left = 454
    Top = 206
  end
  object srcPlan: TDataSource
    DataSet = dsPlan
    Left = 510
    Top = 206
  end
  object mtGive: TMemTableEh
    Params = <>
    DataDriver = drvGive
    Left = 393
    Top = 268
  end
  object drvGive: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <
      item
        DataType = ftInteger
        Name = 'RQ_ID'
        ParamType = ptInput
      end>
    DeleteCommand.CommandText.Strings = (
      'DELETE FROM   REQUEST WHERE   RQ_ID = :RQ_ID')
    GetrecCommand.Params = <
      item
        DataType = ftInteger
        Name = 'RQ_ID'
        ParamType = ptInput
      end>
    GetrecCommand.CommandText.Strings = (
      'SELECT r.RQ_ID, '
      'r.RQ_TYPE, '
      'R.added_on RQ_DATE, '
      'r.RQ_CUSTOMER, '
      'r.RQ_COMPLETED,'
      'r.RQ_PLAN_DATE,'
      'coalesce(r.Rq_Defect, r.Rq_Content) as trouble,'
      'r.RQ_NOTICE,'
      'r.EDIT_BY,'
      'r.EDIT_ON, '
      's.STREET_ID,'
      'r.HOUSE_ID, '
      'r.FLAT_NO, '
      'r.PORCH_N, '
      'r.FLOOR_N, '
      'r.PHONE, '
      'r.ADDED_BY, '
      'r.ADDED_ON, '
      'r.RQ_TIME_FROM,'
      'r.RQ_TIME_TO,'
      
        'coalesce(cast(r.RQ_EXEC_TIME as date), cast(r.RQ_COMPLETED as da' +
        'te)) as GIV_EXEC_DATE,'
      'r.RQ_EXEC_TIME,'
      'r.GIVE_BY, '
      'r.GIVE_METHOD, '
      'r.REQ_RESULT,'
      'c.ACCOUNT_NO, c.CUST_CODE, c.SURNAME ||'#39' '#39' ||c.INITIALS as FIO, '
      
        'coalesce(RT.RT_PRINTFORM,'#39#39') as REPORT, coalesce(rt.RT_Name,'#39#39') ' +
        'as Rt_Name,'
      's.STREET_NAME||'#39' '#39'||s.street_short as STREET_NAME,'
      'h.HOUSE_NO,'
      'coalesce(r.flat_no,'#39#39') as FLAT_NO,'
      'CASE R.Req_Result'
      ' when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      ' when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      ' when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      ' when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      'end as Res_text,'
      '--rt.O_Numericfield as DAYS,'
      '1 as DAYS,'
      
        'coalesce(cast((select list(DISTINCT w.team) from Request_Executo' +
        'rs re inner join Worker w on (re.Exec_Id = w.Worker_Id) where re' +
        '.Rq_Id = r.Rq_Id) as VARCHAR(200)),'
      'wg.name) as TEAM'
      ''
      'FROM REQUEST R'
      '   inner join house h on (r.house_id = h.house_id)'
      '   inner join street s on (s.street_id = h.street_id)'
      '   left outer join workgroups wg on (wg.wg_id = h.wg_id)'
      '   LEFT OUTER JOIN REQUEST_TYPES RT ON (R.RQ_TYPE = RT.RT_Id)'
      '   LEFT OUTER JOIN CUSTOMER C ON (R.RQ_CUSTOMER = C.CUSTOMER_ID)'
      ' WHERE '
      '        R.RQ_ID = :RQ_ID'
      '    ')
    ProviderDataSet = dsGive
    KeyFields = 'RQ_ID'
    Left = 457
    Top = 266
  end
  object srcGive: TDataSource
    DataSet = dsGive
    Left = 509
    Top = 262
  end
  object mtExec: TMemTableEh
    Params = <>
    DataDriver = drvExec
    Left = 395
    Top = 315
  end
  object drvExec: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <
      item
        DataType = ftInteger
        Name = 'RQ_ID'
        ParamType = ptInput
      end>
    DeleteCommand.CommandText.Strings = (
      'DELETE FROM   REQUEST WHERE   RQ_ID = :RQ_ID')
    GetrecCommand.Params = <
      item
        DataType = ftInteger
        Name = 'RQ_ID'
        ParamType = ptInput
      end>
    GetrecCommand.CommandText.Strings = (
      'SELECT r.RQ_ID, '
      'r.RQ_TYPE, '
      'R.added_on RQ_DATE, '
      'r.RQ_CUSTOMER, '
      'r.RQ_COMPLETED,'
      'r.RQ_PLAN_DATE,'
      'coalesce(r.Rq_Defect, r.Rq_Content) as trouble,'
      'r.RQ_NOTICE,'
      'r.EDIT_BY,'
      'r.EDIT_ON,'
      's.STREET_ID, '
      'r.HOUSE_ID, '
      'r.FLAT_NO, '
      'r.PORCH_N, '
      'r.FLOOR_N, '
      'r.PHONE, '
      'r.ADDED_BY, '
      'r.ADDED_ON, '
      'r.RQ_TIME_FROM,'
      'r.RQ_TIME_TO,'
      
        'coalesce(cast(r.RQ_EXEC_TIME as date), cast(r.RQ_COMPLETED as da' +
        'te)) as GIV_EXEC_DATE,'
      'r.RQ_EXEC_TIME,'
      'r.GIVE_BY, '
      'r.GIVE_METHOD, '
      'r.REQ_RESULT,'
      'c.ACCOUNT_NO, c.CUST_CODE, c.SURNAME ||'#39' '#39' ||c.INITIALS as FIO, '
      
        'coalesce(RT.RT_PRINTFORM,'#39#39') as REPORT, coalesce(rt.RT_Name,'#39#39') ' +
        'as Rt_Name,'
      's.STREET_NAME||'#39' '#39'||s.street_short as STREET_NAME,'
      'h.HOUSE_NO,'
      'coalesce(r.flat_no,'#39#39') as FLAT_NO,'
      'CASE R.Req_Result'
      ' when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      ' when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      ' when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      ' when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      'end as Res_text,'
      '--rt.O_Numericfield as DAYS,'
      '1 as DAYS,'
      
        'coalesce(cast((select list(DISTINCT w.team) from Request_Executo' +
        'rs re inner join Worker w on (re.Exec_Id = w.Worker_Id) where re' +
        '.Rq_Id = r.Rq_Id) as VARCHAR(200)),'
      'wg.name) as TEAM'
      ''
      'FROM REQUEST R'
      '   inner join house h on (r.house_id = h.house_id)'
      '   inner join street s on (s.street_id = h.street_id)'
      '   left outer join workgroups wg on (wg.wg_id = h.wg_id)'
      '   LEFT OUTER JOIN REQUEST_TYPES RT ON (R.RQ_TYPE = RT.RT_Id)'
      '   LEFT OUTER JOIN CUSTOMER C ON (R.RQ_CUSTOMER = C.CUSTOMER_ID)'
      ' WHERE '
      '        R.RQ_ID = :RQ_ID'
      '    ')
    ProviderDataSet = dsExec
    KeyFields = 'RQ_ID'
    Left = 457
    Top = 319
  end
  object srcExec: TDataSource
    DataSet = dsExec
    Left = 513
    Top = 315
  end
  object mtAll: TMemTableEh
    Params = <>
    DataDriver = drvAll
    Left = 392
    Top = 363
  end
  object drvAll: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <
      item
        DataType = ftInteger
        Name = 'RQ_ID'
        ParamType = ptInput
      end>
    DeleteCommand.CommandText.Strings = (
      'DELETE FROM   REQUEST WHERE   RQ_ID = :RQ_ID')
    GetrecCommand.Params = <
      item
        DataType = ftInteger
        Name = 'RQ_ID'
        ParamType = ptInput
      end>
    GetrecCommand.CommandText.Strings = (
      'SELECT r.RQ_ID, '
      'r.RQ_TYPE, '
      'R.added_on RQ_DATE, '
      'r.RQ_CUSTOMER, '
      'r.RQ_COMPLETED,'
      'r.RQ_PLAN_DATE,'
      'coalesce(r.Rq_Defect, r.Rq_Content) as trouble,'
      'r.RQ_NOTICE,'
      'r.EDIT_BY,'
      'r.EDIT_ON,'
      's.STREET_ID, '
      'r.HOUSE_ID, '
      'r.FLAT_NO, '
      'r.PORCH_N, '
      'r.FLOOR_N, '
      'r.PHONE, '
      'r.ADDED_BY, '
      'r.ADDED_ON, '
      'r.RQ_TIME_FROM,'
      'r.RQ_TIME_TO,'
      
        'coalesce(cast(r.RQ_EXEC_TIME as date), cast(r.RQ_COMPLETED as da' +
        'te)) as GIV_EXEC_DATE,'
      'r.RQ_EXEC_TIME,'
      'r.GIVE_BY, '
      'r.GIVE_METHOD, '
      'r.REQ_RESULT,'
      'c.ACCOUNT_NO, c.CUST_CODE, c.SURNAME ||'#39' '#39' ||c.INITIALS as FIO, '
      
        'coalesce(RT.RT_PRINTFORM,'#39#39') as REPORT, coalesce(rt.RT_Name,'#39#39') ' +
        'as Rt_Name,'
      's.STREET_NAME||'#39' '#39'||s.street_short as STREET_NAME,'
      'h.HOUSE_NO,'
      'coalesce(r.flat_no,'#39#39') as FLAT_NO,'
      'CASE R.Req_Result'
      ' when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      ' when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      ' when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      ' when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      'end as Res_text,'
      '--rt.O_Numericfield as DAYS,'
      '1 as DAYS,'
      
        'coalesce(cast((select list(DISTINCT w.team) from Request_Executo' +
        'rs re inner join Worker w on (re.Exec_Id = w.Worker_Id) where re' +
        '.Rq_Id = r.Rq_Id) as VARCHAR(200)),'
      'wg.name) as TEAM'
      ''
      'FROM REQUEST R'
      '   inner join house h on (r.house_id = h.house_id)'
      '   inner join street s on (s.street_id = h.street_id)'
      '   left outer join workgroups wg on (wg.wg_id = h.wg_id)'
      '   LEFT OUTER JOIN REQUEST_TYPES RT ON (R.RQ_TYPE = RT.RT_Id)'
      '   LEFT OUTER JOIN CUSTOMER C ON (R.RQ_CUSTOMER = C.CUSTOMER_ID)'
      ' WHERE '
      '        R.RQ_ID = :RQ_ID'
      '    ')
    ProviderDataSet = dsAll
    KeyFields = 'RQ_ID'
    Left = 456
    Top = 366
  end
  object srcAll: TDataSource
    DataSet = dsAll
    Left = 514
    Top = 364
  end
  object dsPlan: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    REQUEST'
      'WHERE'
      '        RQ_ID = :OLD_RQ_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    C.CUSTOMER_ID,'
      '    R.RQ_ID,'
      '    R.RQ_TYPE,'
      '    R.ADDED_ON RQ_DATE,'
      '    R.RQ_CUSTOMER,'
      '    R.RQ_COMPLETED,'
      '    R.RQ_PLAN_DATE,'
      
        '    coalesce(TPL.RQ_CONTENT, '#39#39') || coalesce('#39'.'#39' || R.ADD_INFO, ' +
        #39#39') || iif(coalesce(R.RQ_CONTENT, '#39#39') <> '#39#39', coalesce('#39' ('#39' || R.' +
        'RQ_CONTENT || '#39')'#39', '#39#39'), '#39#39') as CONTETNT,'
      
        '    coalesce(RR.NAME, '#39#39') || '#39' '#39' || coalesce(R.RQ_DEFECT, '#39#39') as' +
        ' TROUBLE,'
      '    R.RQ_CONTENT,'
      '    R.RQ_DEFECT,'
      '    R.RQ_NOTICE,'
      '    R.EDIT_BY,'
      '    R.EDIT_ON,'
      '    S.STREET_ID,    '
      '    R.HOUSE_ID,'
      '    R.ADDED_BY,'
      '    R.ADDED_ON,'
      '    R.RQ_TIME_FROM,'
      '    R.RQ_TIME_TO,'
      
        '    coalesce(cast(R.RQ_EXEC_TIME as date), cast(R.RQ_COMPLETED a' +
        's date)) as GIV_EXEC_DATE,'
      '    R.RQ_EXEC_TIME,'
      '    R.GIVE_BY,'
      '    R.GIVE_METHOD,'
      '    R.REQ_RESULT,'
      '    C.CUST_CODE,'
      '    coalesce(RT.RT_PRINTFORM, '#39#39') as REPORT,'
      '    coalesce(RT.RT_NAME, '#39#39') as RT_NAME,'
      '    S.STREET_NAME || '#39' '#39' || S.STREET_SHORT as STREET_NAME,'
      '    H.HOUSE_NO,'
      '    coalesce(R.FLAT_NO, '#39#39') as FLAT_NO,'
      '    case R.REQ_RESULT'
      '      when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      '      when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      '      when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      '      when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      '    end as RES_TEXT,'
      '    --rt.O_Numericfield as DAYS,'
      '    1 as DAYS,'
      '    coalesce(tpl.RQ_COLOR, RT.RT_COLOR) RT_COLOR,'
      '    R.PHONE,'
      '    HE.HE_NAME,'
      '    cast(coalesce(RE.TEAM, WG.NAME) as varchar(255)) as TEAM,'
      '    RE.WORKERS,'
      '    (select'
      '         list(distinct PHONE)'
      '         from (select'
      '                   R.PHONE'
      '                   from REQUEST RI'
      '                   where RI.RQ_ID = R.RQ_ID'
      '               union'
      '               select'
      '                   C.CC_VALUE PHONE'
      '                   from CUSTOMER_CONTACTS C'
      '                   where C.CUSTOMER_ID = R.RQ_CUSTOMER'
      '                         and C.CC_TYPE < 2)) ALL_PHONES,'
      '    R.RECEIPT,'
      '    RR.NAME as RESULT_NAME, '
      '    coalesce(r.Porch_N, HF.porch_n) porch_n,'
      '    coalesce(R.Floor_N, hf.floor_n) floor_n, '
      '    r.Add_Info'
      
        '    , coalesce(C.SURNAME || '#39' '#39' || C.INITIALS, n.Name, '#39#39') as FI' +
        'O'
      
        '    , coalesce(C.ACCOUNT_NO, '#39#1059#1079#1077#1083' '#39'||n.Name, '#39#39') ACCOUNT_NO    ' +
        '   '
      '    , r.Node_id'
      '    , c.DEBT_SUM'
      '    , -1*c.debt_sum as BALANCE    '
      '    , a.AREA_NAME'
      '    from REQUEST R'
      '        inner join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)'
      '        inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      '        left outer join area a on (a.AREA_ID = s.AREA_ID)'
      '        left outer join WORKGROUPS WG on (WG.WG_ID = H.WG_ID)'
      
        '        left outer join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_I' +
        'D)'
      
        '        left outer join CUSTOMER C on (R.RQ_CUSTOMER = C.CUSTOME' +
        'R_ID)'
      
        '        left outer join REQUEST_TEMPLATES TPL on (TPL.RQTL_ID = ' +
        'R.RQTL_ID)'
      
        '        left outer join REQUEST_RESULTS RR on (RR.RR_ID = R.RESU' +
        'LT_ID)'
      '        left outer join HEADEND HE on (H.HEADEND_ID = HE.HE_ID)'
      
        '        left outer join HOUSEFLATS hf on (hf.house_id = r.house_' +
        'id and hf.flat_no = r.flat_no)        '
      '        left outer join NODES n on (n.Node_Id = r.Node_Id)'
      '        left outer join(select'
      '                            RE.RQ_ID,'
      '                            list(distinct W.TEAM) TEAM,'
      
        '                            list(W.SURNAME || coalesce('#39' '#39' || W.' +
        'FIRSTNAME, '#39#39'), '#39', '#39') as WORKERS'
      '                            from REQUEST_EXECUTORS RE'
      
        '                                inner join WORKER W on (RE.EXEC_' +
        'ID = W.WORKER_ID)'
      
        '                            group by RE.RQ_ID) RE on (RE.RQ_ID =' +
        ' R.RQ_ID)'
      '    WHERE '
      '      R.RQ_ID = :OLD_RQ_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    C.CUSTOMER_ID,'
      '    R.RQ_ID,'
      '    R.RQ_TYPE,'
      '    R.ADDED_ON RQ_DATE,'
      '    R.RQ_CUSTOMER,'
      '    R.RQ_COMPLETED,'
      '    R.RQ_PLAN_DATE,'
      
        '    coalesce(TPL.RQ_CONTENT, '#39#39') || coalesce('#39'.'#39' || R.ADD_INFO, ' +
        #39#39') || iif(coalesce(R.RQ_CONTENT, '#39#39') <> '#39#39', coalesce('#39' ('#39' || R.' +
        'RQ_CONTENT || '#39')'#39', '#39#39'), '#39#39') as CONTETNT,'
      
        '    coalesce(RR.NAME, '#39#39') || '#39' '#39' || coalesce(R.RQ_DEFECT, '#39#39') as' +
        ' TROUBLE,'
      '    R.RQ_CONTENT,'
      '    R.RQ_DEFECT,'
      '    R.RQ_NOTICE,'
      '    R.EDIT_BY,'
      '    R.EDIT_ON,'
      '    S.STREET_ID,    '
      '    R.HOUSE_ID,'
      '    R.ADDED_BY,'
      '    R.ADDED_ON,'
      '    R.RQ_TIME_FROM,'
      '    R.RQ_TIME_TO,'
      
        '    coalesce(cast(R.RQ_EXEC_TIME as date), cast(R.RQ_COMPLETED a' +
        's date)) as GIV_EXEC_DATE,'
      '    R.RQ_EXEC_TIME,'
      '    R.GIVE_BY,'
      '    R.GIVE_METHOD,'
      '    R.REQ_RESULT,'
      '    C.CUST_CODE,'
      '    coalesce(RT.RT_PRINTFORM, '#39#39') as REPORT,'
      '    coalesce(RT.RT_NAME, '#39#39') as RT_NAME,'
      '    S.STREET_NAME || '#39' '#39' || S.STREET_SHORT as STREET_NAME,'
      '    H.HOUSE_NO,'
      '    coalesce(R.FLAT_NO, '#39#39') as FLAT_NO,'
      '    case R.REQ_RESULT'
      '      when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      '      when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      '      when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      '      when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      '    end as RES_TEXT,'
      '    --rt.O_Numericfield as DAYS,'
      '    1 as DAYS,'
      '    coalesce(tpl.RQ_COLOR, RT.RT_COLOR) RT_COLOR,'
      '    R.PHONE,'
      '    HE.HE_NAME,'
      '    cast(coalesce(RE.TEAM, WG.NAME) as varchar(255)) as TEAM,'
      '    RE.WORKERS,'
      '    (select'
      '         list(distinct PHONE)'
      '         from (select'
      '                   R.PHONE'
      '                   from REQUEST RI'
      '                   where RI.RQ_ID = R.RQ_ID'
      '               union'
      '               select'
      '                   C.CC_VALUE PHONE'
      '                   from CUSTOMER_CONTACTS C'
      '                   where C.CUSTOMER_ID = R.RQ_CUSTOMER'
      '                         and C.CC_TYPE < 2)) ALL_PHONES,'
      '    R.RECEIPT,'
      '    RR.NAME as RESULT_NAME, '
      '    coalesce(r.Porch_N, HF.porch_n) porch_n,'
      '    coalesce(R.Floor_N, hf.floor_n) floor_n, '
      '    r.Add_Info'
      
        '    , coalesce(C.SURNAME || '#39' '#39' || C.INITIALS, n.Name, '#39#39') as FI' +
        'O'
      
        '    , coalesce(C.ACCOUNT_NO, '#39#1059#1079#1077#1083' '#39'||n.Name, '#39#39') ACCOUNT_NO    ' +
        '   '
      '    , r.Node_id'
      '    , c.DEBT_SUM'
      '    , -1*c.debt_sum as BALANCE    '
      '    , a.AREA_NAME'
      '    from REQUEST R'
      '        inner join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)'
      '        inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      '        left outer join area a on (a.AREA_ID = s.AREA_ID)'
      '        left outer join WORKGROUPS WG on (WG.WG_ID = H.WG_ID)'
      
        '        left outer join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_I' +
        'D)'
      
        '        left outer join CUSTOMER C on (R.RQ_CUSTOMER = C.CUSTOME' +
        'R_ID)'
      
        '        left outer join REQUEST_TEMPLATES TPL on (TPL.RQTL_ID = ' +
        'R.RQTL_ID)'
      
        '        left outer join REQUEST_RESULTS RR on (RR.RR_ID = R.RESU' +
        'LT_ID)'
      '        left outer join HEADEND HE on (H.HEADEND_ID = HE.HE_ID)'
      
        '        left outer join HOUSEFLATS hf on (hf.house_id = r.house_' +
        'id and hf.flat_no = r.flat_no)        '
      '        left outer join NODES n on (n.Node_Id = r.Node_Id)'
      '        left outer join(select'
      '                            RE.RQ_ID,'
      '                            list(distinct W.TEAM) TEAM,'
      
        '                            list(W.SURNAME || coalesce('#39' '#39' || W.' +
        'FIRSTNAME, '#39#39'), '#39', '#39') as WORKERS'
      '                            from REQUEST_EXECUTORS RE'
      
        '                                inner join WORKER W on (RE.EXEC_' +
        'ID = W.WORKER_ID)'
      
        '                            group by RE.RQ_ID) RE on (RE.RQ_ID =' +
        ' R.RQ_ID)'
      '    WHERE '
      '      '
      '    @@SQL_FILTER%1=1@'
      ''
      '    ORDER BY R.RQ_ID  ')
    AutoUpdateOptions.UpdateTableName = 'REQUEST'
    AutoUpdateOptions.KeyFields = 'RQ_ID'
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 575
    Top = 206
  end
  object dsGive: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    REQUEST'
      'WHERE'
      '        RQ_ID = :OLD_RQ_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    C.CUSTOMER_ID,'
      '    R.RQ_ID,'
      '    R.RQ_TYPE,'
      '    R.ADDED_ON RQ_DATE,'
      '    R.RQ_CUSTOMER,'
      '    R.RQ_COMPLETED,'
      '    R.RQ_PLAN_DATE,'
      
        '    coalesce(TPL.RQ_CONTENT, '#39#39') || coalesce('#39'.'#39' || R.ADD_INFO, ' +
        #39#39') || iif(coalesce(R.RQ_CONTENT, '#39#39') <> '#39#39', coalesce('#39' ('#39' || R.' +
        'RQ_CONTENT || '#39')'#39', '#39#39'), '#39#39') as CONTETNT,'
      
        '    coalesce(RR.NAME, '#39#39') || '#39' '#39' || coalesce(R.RQ_DEFECT, '#39#39') as' +
        ' TROUBLE,'
      '    R.RQ_CONTENT,'
      '    R.RQ_DEFECT,'
      '    R.RQ_NOTICE,'
      '    R.EDIT_BY,'
      '    R.EDIT_ON,'
      '    S.STREET_ID,'
      '    R.HOUSE_ID,'
      '    R.ADDED_BY,'
      '    R.ADDED_ON,'
      '    R.RQ_TIME_FROM,'
      '    R.RQ_TIME_TO,'
      
        '    coalesce(cast(R.RQ_EXEC_TIME as date), cast(R.RQ_COMPLETED a' +
        's date)) as GIV_EXEC_DATE,'
      '    R.RQ_EXEC_TIME,'
      '    R.GIVE_BY,'
      '    R.GIVE_METHOD,'
      '    R.REQ_RESULT,'
      '    C.CUST_CODE,'
      '    coalesce(RT.RT_PRINTFORM, '#39#39') as REPORT,'
      '    coalesce(RT.RT_NAME, '#39#39') as RT_NAME,'
      '    S.STREET_NAME || '#39' '#39' || S.STREET_SHORT as STREET_NAME,'
      '    H.HOUSE_NO,'
      '    coalesce(R.FLAT_NO, '#39#39') as FLAT_NO,'
      '    case R.REQ_RESULT'
      '      when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      '      when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      '      when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      '      when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      '    end as RES_TEXT,'
      '    --rt.O_Numericfield as DAYS,'
      '    1 as DAYS,'
      '    coalesce(tpl.RQ_COLOR, RT.RT_COLOR) RT_COLOR,'
      '    R.PHONE,'
      '    HE.HE_NAME,'
      '    cast(coalesce(RE.TEAM, WG.NAME) as varchar(255)) as TEAM,'
      '    RE.WORKERS,'
      '    (select'
      '         list(distinct PHONE)'
      '         from (select'
      '                   R.PHONE'
      '                   from REQUEST RI'
      '                   where RI.RQ_ID = R.RQ_ID'
      '               union'
      '               select'
      '                   C.CC_VALUE PHONE'
      '                   from CUSTOMER_CONTACTS C'
      '                   where C.CUSTOMER_ID = R.RQ_CUSTOMER'
      '                         and C.CC_TYPE < 2)) ALL_PHONES,'
      '    R.RECEIPT,'
      '    RR.NAME as RESULT_NAME,     '
      '    coalesce(r.Porch_N, HF.porch_n) porch_n,'
      '    coalesce(R.Floor_N, hf.floor_n) floor_n, '
      '    r.Add_Info,'
      '    coalesce(C.SURNAME || '#39' '#39' || C.INITIALS, n.Name, '#39#39') as FIO,'
      '    coalesce(C.ACCOUNT_NO, '#39#1059#1079#1077#1083' '#39'||n.Name, '#39#39') ACCOUNT_NO'
      '    , r.Node_id    '
      '    , c.DEBT_SUM'
      '    , -1*c.debt_sum as BALANCE    '
      '    , a.AREA_NAME'
      '    from REQUEST R'
      '        inner join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)'
      '        inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      '        left outer join area a on (a.AREA_ID = s.AREA_ID)'
      '        left outer join WORKGROUPS WG on (WG.WG_ID = H.WG_ID)'
      
        '        left outer join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_I' +
        'D)'
      
        '        left outer join CUSTOMER C on (R.RQ_CUSTOMER = C.CUSTOME' +
        'R_ID)'
      
        '        left outer join REQUEST_TEMPLATES TPL on (TPL.RQTL_ID = ' +
        'R.RQTL_ID)'
      
        '        left outer join REQUEST_RESULTS RR on (RR.RR_ID = R.RESU' +
        'LT_ID)'
      '        left outer join HEADEND HE on (H.HEADEND_ID = HE.HE_ID)'
      
        '        left outer join HOUSEFLATS hf on (hf.house_id = r.house_' +
        'id and hf.flat_no = r.flat_no)'
      '        left outer join NODES n on (n.Node_Id = r.Node_Id)'
      '        left outer join(select'
      '                            RE.RQ_ID,'
      '                            list(distinct W.TEAM) TEAM,'
      
        '                            list(W.SURNAME || coalesce('#39' '#39' || W.' +
        'FIRSTNAME, '#39#39'), '#39', '#39') as WORKERS'
      '                            from REQUEST_EXECUTORS RE'
      
        '                                inner join WORKER W on (RE.EXEC_' +
        'ID = W.WORKER_ID)'
      
        '                            group by RE.RQ_ID) RE on (RE.RQ_ID =' +
        ' R.RQ_ID)'
      ' WHERE '
      '        R.RQ_ID = :OLD_RQ_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    C.CUSTOMER_ID,'
      '    R.RQ_ID,'
      '    R.RQ_TYPE,'
      '    R.ADDED_ON RQ_DATE,'
      '    R.RQ_CUSTOMER,'
      '    R.RQ_COMPLETED,'
      '    R.RQ_PLAN_DATE,'
      
        '    coalesce(TPL.RQ_CONTENT, '#39#39') || coalesce('#39'.'#39' || R.ADD_INFO, ' +
        #39#39') || iif(coalesce(R.RQ_CONTENT, '#39#39') <> '#39#39', coalesce('#39' ('#39' || R.' +
        'RQ_CONTENT || '#39')'#39', '#39#39'), '#39#39') as CONTETNT,'
      
        '    coalesce(RR.NAME, '#39#39') || '#39' '#39' || coalesce(R.RQ_DEFECT, '#39#39') as' +
        ' TROUBLE,'
      '    R.RQ_CONTENT,'
      '    R.RQ_DEFECT,'
      '    R.RQ_NOTICE,'
      '    R.EDIT_BY,'
      '    R.EDIT_ON,'
      '    S.STREET_ID,'
      '    R.HOUSE_ID,'
      '    R.ADDED_BY,'
      '    R.ADDED_ON,'
      '    R.RQ_TIME_FROM,'
      '    R.RQ_TIME_TO,'
      
        '    coalesce(cast(R.RQ_EXEC_TIME as date), cast(R.RQ_COMPLETED a' +
        's date)) as GIV_EXEC_DATE,'
      '    R.RQ_EXEC_TIME,'
      '    R.GIVE_BY,'
      '    R.GIVE_METHOD,'
      '    R.REQ_RESULT,'
      '    C.CUST_CODE,'
      '    coalesce(RT.RT_PRINTFORM, '#39#39') as REPORT,'
      '    coalesce(RT.RT_NAME, '#39#39') as RT_NAME,'
      '    S.STREET_NAME || '#39' '#39' || S.STREET_SHORT as STREET_NAME,'
      '    H.HOUSE_NO,'
      '    coalesce(R.FLAT_NO, '#39#39') as FLAT_NO,'
      '    case R.REQ_RESULT'
      '      when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      '      when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      '      when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      '      when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      '    end as RES_TEXT,'
      '    --rt.O_Numericfield as DAYS,'
      '    1 as DAYS,'
      '    coalesce(tpl.RQ_COLOR, RT.RT_COLOR) RT_COLOR,'
      '    R.PHONE,'
      '    HE.HE_NAME,'
      '    cast(coalesce(RE.TEAM, WG.NAME) as varchar(255)) as TEAM,'
      '    RE.WORKERS,'
      '    (select'
      '         list(distinct PHONE)'
      '         from (select'
      '                   R.PHONE'
      '                   from REQUEST RI'
      '                   where RI.RQ_ID = R.RQ_ID'
      '               union'
      '               select'
      '                   C.CC_VALUE PHONE'
      '                   from CUSTOMER_CONTACTS C'
      '                   where C.CUSTOMER_ID = R.RQ_CUSTOMER'
      '                         and C.CC_TYPE < 2)) ALL_PHONES,'
      '    R.RECEIPT,'
      '    RR.NAME as RESULT_NAME,     '
      '    coalesce(r.Porch_N, HF.porch_n) porch_n,'
      '    coalesce(R.Floor_N, hf.floor_n) floor_n, '
      '    r.Add_Info,'
      '    coalesce(C.SURNAME || '#39' '#39' || C.INITIALS, n.Name, '#39#39') as FIO,'
      '    coalesce(C.ACCOUNT_NO, '#39#1059#1079#1077#1083' '#39'||n.Name, '#39#39') ACCOUNT_NO'
      '    , r.Node_id    '
      '    , c.DEBT_SUM'
      '    , -1*c.debt_sum as BALANCE    '
      '    , a.AREA_NAME'
      '    from REQUEST R'
      '        inner join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)'
      '        inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      '        left outer join area a on (a.AREA_ID = s.AREA_ID)'
      '        left outer join WORKGROUPS WG on (WG.WG_ID = H.WG_ID)'
      
        '        left outer join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_I' +
        'D)'
      
        '        left outer join CUSTOMER C on (R.RQ_CUSTOMER = C.CUSTOME' +
        'R_ID)'
      
        '        left outer join REQUEST_TEMPLATES TPL on (TPL.RQTL_ID = ' +
        'R.RQTL_ID)'
      
        '        left outer join REQUEST_RESULTS RR on (RR.RR_ID = R.RESU' +
        'LT_ID)'
      '        left outer join HEADEND HE on (H.HEADEND_ID = HE.HE_ID)'
      
        '        left outer join HOUSEFLATS hf on (hf.house_id = r.house_' +
        'id and hf.flat_no = r.flat_no)'
      '        left outer join NODES n on (n.Node_Id = r.Node_Id)'
      '        left outer join(select'
      '                            RE.RQ_ID,'
      '                            list(distinct W.TEAM) TEAM,'
      
        '                            list(W.SURNAME || coalesce('#39' '#39' || W.' +
        'FIRSTNAME, '#39#39'), '#39', '#39') as WORKERS'
      '                            from REQUEST_EXECUTORS RE'
      
        '                                inner join WORKER W on (RE.EXEC_' +
        'ID = W.WORKER_ID)'
      
        '                            group by RE.RQ_ID) RE on (RE.RQ_ID =' +
        ' R.RQ_ID)'
      ''
      '    WHERE'
      ''
      '    @@SQL_FILTER%1=1@'
      ''
      '    ORDER BY R.RQ_ID  ')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 573
    Top = 261
  end
  object dsExec: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    REQUEST'
      'WHERE'
      '        RQ_ID = :OLD_RQ_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    C.CUSTOMER_ID,'
      '    R.RQ_ID,'
      '    R.RQ_TYPE,'
      '    R.ADDED_ON RQ_DATE,'
      '    R.RQ_CUSTOMER,'
      '    R.RQ_COMPLETED,'
      '    R.RQ_PLAN_DATE,'
      
        '    coalesce(TPL.RQ_CONTENT, '#39#39') || coalesce('#39'.'#39' || R.ADD_INFO, ' +
        #39#39') || iif(coalesce(R.RQ_CONTENT, '#39#39') <> '#39#39', coalesce('#39' ('#39' || R.' +
        'RQ_CONTENT || '#39')'#39', '#39#39'), '#39#39') as CONTETNT,'
      
        '    coalesce(RR.NAME, '#39#39') || '#39' '#39' || coalesce(R.RQ_DEFECT, '#39#39') as' +
        ' TROUBLE,'
      '    R.RQ_CONTENT,'
      '    R.RQ_DEFECT,'
      '    R.RQ_NOTICE,'
      '    R.EDIT_BY,'
      '    R.EDIT_ON,'
      '    S.STREET_ID,'
      '    R.HOUSE_ID,'
      '    R.ADDED_BY,'
      '    R.ADDED_ON,'
      '    R.RQ_TIME_FROM,'
      '    R.RQ_TIME_TO,'
      
        '    coalesce(cast(R.RQ_EXEC_TIME as date), cast(R.RQ_COMPLETED a' +
        's date)) as GIV_EXEC_DATE,'
      '    R.RQ_EXEC_TIME,'
      '    R.GIVE_BY,'
      '    R.GIVE_METHOD,'
      '    R.REQ_RESULT,'
      '    C.CUST_CODE,'
      '    coalesce(RT.RT_PRINTFORM, '#39#39') as REPORT,'
      '    coalesce(RT.RT_NAME, '#39#39') as RT_NAME,'
      '    S.STREET_NAME || '#39' '#39' || S.STREET_SHORT as STREET_NAME,'
      '    H.HOUSE_NO,'
      '    coalesce(R.FLAT_NO, '#39#39') as FLAT_NO,'
      '    case R.REQ_RESULT'
      '      when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      '      when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      '      when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      '      when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      '    end as RES_TEXT,'
      '    --rt.O_Numericfield as DAYS,'
      '    1 as DAYS,'
      '    coalesce(tpl.RQ_COLOR, RT.RT_COLOR) RT_COLOR,'
      '    R.PHONE,'
      '    HE.HE_NAME,'
      '    cast(coalesce(RE.TEAM, WG.NAME) as varchar(255)) as TEAM,'
      '    RE.WORKERS,'
      '    (select'
      '         list(distinct PHONE)'
      '         from (select'
      '                   R.PHONE'
      '                   from REQUEST RI'
      '                   where RI.RQ_ID = R.RQ_ID'
      '               union'
      '               select'
      '                   C.CC_VALUE PHONE'
      '                   from CUSTOMER_CONTACTS C'
      '                   where C.CUSTOMER_ID = R.RQ_CUSTOMER'
      '                         and C.CC_TYPE < 2)) ALL_PHONES,'
      '    R.RECEIPT,'
      '    RR.NAME as RESULT_NAME,     '
      '    coalesce(r.Porch_N, HF.porch_n) porch_n,'
      '    coalesce(R.Floor_N, hf.floor_n) floor_n, '
      '    r.Add_Info,'
      '    coalesce(C.SURNAME || '#39' '#39' || C.INITIALS, n.Name, '#39#39') as FIO,'
      '    coalesce(C.ACCOUNT_NO, '#39#1059#1079#1077#1083' '#39'||n.Name, '#39#39') ACCOUNT_NO'
      '    , r.Node_id'
      '    , c.DEBT_SUM'
      '    , -1*c.debt_sum as BALANCE    '
      '    , a.AREA_NAME'
      
        '    , datediff(minute, r.Rq_Completed, r.Rq_Exec_Time) EXEC_MINU' +
        'T'
      '    from REQUEST R'
      '        inner join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)'
      '        inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      '        left outer join area a on (a.AREA_ID = s.AREA_ID)'
      '        left outer join WORKGROUPS WG on (WG.WG_ID = H.WG_ID)'
      
        '        left outer join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_I' +
        'D)'
      
        '        left outer join CUSTOMER C on (R.RQ_CUSTOMER = C.CUSTOME' +
        'R_ID)'
      
        '        left outer join REQUEST_TEMPLATES TPL on (TPL.RQTL_ID = ' +
        'R.RQTL_ID)'
      
        '        left outer join REQUEST_RESULTS RR on (RR.RR_ID = R.RESU' +
        'LT_ID)'
      '        left outer join HEADEND HE on (H.HEADEND_ID = HE.HE_ID)'
      
        '        left outer join HOUSEFLATS hf on (hf.house_id = r.house_' +
        'id and hf.flat_no = r.flat_no)'
      '        left outer join NODES n on (n.Node_Id = r.Node_Id)'
      '        left outer join(select'
      '                            RE.RQ_ID,'
      '                            list(distinct W.TEAM) TEAM,'
      
        '                            list(W.SURNAME || coalesce('#39' '#39' || W.' +
        'FIRSTNAME, '#39#39'), '#39', '#39') as WORKERS'
      '                            from REQUEST_EXECUTORS RE'
      
        '                                inner join WORKER W on (RE.EXEC_' +
        'ID = W.WORKER_ID)'
      
        '                            group by RE.RQ_ID) RE on (RE.RQ_ID =' +
        ' R.RQ_ID)'
      ' WHERE '
      '        R.RQ_ID = :OLD_RQ_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    C.CUSTOMER_ID,'
      '    R.RQ_ID,'
      '    R.RQ_TYPE,'
      '    R.ADDED_ON RQ_DATE,'
      '    R.RQ_CUSTOMER,'
      '    R.RQ_COMPLETED,'
      '    R.RQ_PLAN_DATE,'
      
        '    coalesce(TPL.RQ_CONTENT, '#39#39') || coalesce('#39'.'#39' || R.ADD_INFO, ' +
        #39#39') || iif(coalesce(R.RQ_CONTENT, '#39#39') <> '#39#39', coalesce('#39' ('#39' || R.' +
        'RQ_CONTENT || '#39')'#39', '#39#39'), '#39#39') as CONTETNT,'
      
        '    coalesce(RR.NAME, '#39#39') || '#39' '#39' || coalesce(R.RQ_DEFECT, '#39#39') as' +
        ' TROUBLE,'
      '    R.RQ_CONTENT,'
      '    R.RQ_DEFECT,'
      '    R.RQ_NOTICE,'
      '    R.EDIT_BY,'
      '    R.EDIT_ON,'
      '    S.STREET_ID,'
      '    R.HOUSE_ID,'
      '    R.ADDED_BY,'
      '    R.ADDED_ON,'
      '    R.RQ_TIME_FROM,'
      '    R.RQ_TIME_TO,'
      
        '    coalesce(cast(R.RQ_EXEC_TIME as date), cast(R.RQ_COMPLETED a' +
        's date)) as GIV_EXEC_DATE,'
      '    R.RQ_EXEC_TIME,'
      '    R.GIVE_BY,'
      '    R.GIVE_METHOD,'
      '    R.REQ_RESULT,'
      '    C.CUST_CODE,'
      '    coalesce(RT.RT_PRINTFORM, '#39#39') as REPORT,'
      '    coalesce(RT.RT_NAME, '#39#39') as RT_NAME,'
      '    S.STREET_NAME || '#39' '#39' || S.STREET_SHORT as STREET_NAME,'
      '    H.HOUSE_NO,'
      '    coalesce(R.FLAT_NO, '#39#39') as FLAT_NO,'
      '    case R.REQ_RESULT'
      '      when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      '      when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      '      when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      '      when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      '    end as RES_TEXT,'
      '    --rt.O_Numericfield as DAYS,'
      '    1 as DAYS,'
      '    coalesce(tpl.RQ_COLOR, RT.RT_COLOR) RT_COLOR,'
      '    R.PHONE,'
      '    HE.HE_NAME,'
      '    cast(coalesce(RE.TEAM, WG.NAME) as varchar(255)) as TEAM,'
      '    RE.WORKERS,'
      '    (select'
      '         list(distinct PHONE)'
      '         from (select'
      '                   R.PHONE'
      '                   from REQUEST RI'
      '                   where RI.RQ_ID = R.RQ_ID'
      '               union'
      '               select'
      '                   C.CC_VALUE PHONE'
      '                   from CUSTOMER_CONTACTS C'
      '                   where C.CUSTOMER_ID = R.RQ_CUSTOMER'
      '                         and C.CC_TYPE < 2)) ALL_PHONES,'
      '    R.RECEIPT,'
      '    RR.NAME as RESULT_NAME,     '
      '    coalesce(r.Porch_N, HF.porch_n) porch_n,'
      '    coalesce(R.Floor_N, hf.floor_n) floor_n, '
      '    r.Add_Info,'
      '    coalesce(C.SURNAME || '#39' '#39' || C.INITIALS, n.Name, '#39#39') as FIO,'
      '    coalesce(C.ACCOUNT_NO, '#39#1059#1079#1077#1083' '#39'||n.Name, '#39#39') ACCOUNT_NO'
      '    , r.Node_id'
      '    , c.DEBT_SUM'
      '    , -1*c.debt_sum as BALANCE    '
      '    , a.AREA_NAME'
      
        '    , datediff(minute, r.Rq_Completed, r.Rq_Exec_Time) EXEC_MINU' +
        'T'
      '    from REQUEST R'
      '        inner join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)'
      '        inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      '        left outer join area a on (a.AREA_ID = s.AREA_ID)'
      '        left outer join WORKGROUPS WG on (WG.WG_ID = H.WG_ID)'
      
        '        left outer join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_I' +
        'D)'
      
        '        left outer join CUSTOMER C on (R.RQ_CUSTOMER = C.CUSTOME' +
        'R_ID)'
      
        '        left outer join REQUEST_TEMPLATES TPL on (TPL.RQTL_ID = ' +
        'R.RQTL_ID)'
      
        '        left outer join REQUEST_RESULTS RR on (RR.RR_ID = R.RESU' +
        'LT_ID)'
      '        left outer join HEADEND HE on (H.HEADEND_ID = HE.HE_ID)'
      
        '        left outer join HOUSEFLATS hf on (hf.house_id = r.house_' +
        'id and hf.flat_no = r.flat_no)'
      '        left outer join NODES n on (n.Node_Id = r.Node_Id)'
      '        left outer join(select'
      '                            RE.RQ_ID,'
      '                            list(distinct W.TEAM) TEAM,'
      
        '                            list(W.SURNAME || coalesce('#39' '#39' || W.' +
        'FIRSTNAME, '#39#39'), '#39', '#39') as WORKERS'
      '                            from REQUEST_EXECUTORS RE'
      
        '                                inner join WORKER W on (RE.EXEC_' +
        'ID = W.WORKER_ID)'
      
        '                            group by RE.RQ_ID) RE on (RE.RQ_ID =' +
        ' R.RQ_ID)'
      '    WHERE'
      ''
      '    @@SQL_FILTER%1=1@'
      ''
      '    ORDER BY R.RQ_ID  ')
    AutoUpdateOptions.UpdateTableName = 'REQUEST'
    AutoUpdateOptions.KeyFields = 'RQ_ID'
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.UpdateOnlyModifiedFields = True
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 576
    Top = 318
  end
  object PropStorage: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'pgcGrids.tsExec.pnlClientInfo.<P>.Height'
      'pgcGrids.tsExec.pnlClientInfo.pnlContetnt.pnl1.<P>.Width'
      
        'pgcGrids.tsExec.pnlClientInfo.pnlContetnt.pnl1.pnlMaterials.<P>.' +
        'Width')
    AfterLoadProps = PropStorageAfterLoadProps
    Left = 393
    Top = 21
  end
  object dsFilter: TMemTableEh
    Params = <>
    OnNewRecord = dsFilterNewRecord
    Left = 39
    Top = 154
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object TABS: TMTNumericDataFieldEh
          FieldName = 'TABS'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object R_STATE: TMTNumericDataFieldEh
          FieldName = 'R_STATE'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object ListBids: TMTStringDataFieldEh
          FieldName = 'ListBids'
          StringDataType = fdtStringEh
          DisplayWidth = 100
          Size = 2000
        end
        object WORKAREA: TMTNumericDataFieldEh
          FieldName = 'WORKAREA'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'WORKAREA'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object WORKGROUP: TMTNumericDataFieldEh
          FieldName = 'WORKGROUP'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'WORKGROUP'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object STREET_ID: TMTNumericDataFieldEh
          FieldName = 'STREET_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'STREET_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object HOUSE_ID: TMTNumericDataFieldEh
          FieldName = 'HOUSE_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'HOUSE_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object FLAT_NO: TMTStringDataFieldEh
          FieldName = 'FLAT_NO'
          StringDataType = fdtStringEh
          DisplayLabel = 'FLAT_NO'
          DisplayWidth = 20
          Transliterate = True
        end
        object DATE_FROM: TMTDateTimeDataFieldEh
          FieldName = 'DATE_FROM'
          DateTimeDataType = fdtDateEh
          DisplayLabel = 'DATE_FROM'
          DisplayWidth = 10
        end
        object DATE_TO: TMTDateTimeDataFieldEh
          FieldName = 'DATE_TO'
          DateTimeDataType = fdtDateEh
          DisplayLabel = 'DATE_TO'
          DisplayWidth = 10
        end
        object REQUEST_TYPE: TMTNumericDataFieldEh
          FieldName = 'REQUEST_TYPE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'REQUEST_TYPE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object EXECUTOR_ID: TMTNumericDataFieldEh
          FieldName = 'EXECUTOR_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'EXECUTOR_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object Analyse: TMTNumericDataFieldEh
          FieldName = 'Analyse'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'Analyse'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object AREA_ID: TMTNumericDataFieldEh
          FieldName = 'AREA_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'AREA_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SUBAREA_ID: TMTNumericDataFieldEh
          FieldName = 'SUBAREA_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'SUBAREA_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DaysBefore: TMTNumericDataFieldEh
          FieldName = 'DaysBefore'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'DaysBefore'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DaysAfter: TMTNumericDataFieldEh
          FieldName = 'DaysAfter'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'DaysAfter'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object INVERSION: TMTBooleanDataFieldEh
          FieldName = 'INVERSION'
          DisplayLabel = 'INVERSION'
          DisplayWidth = 5
        end
        object NEXT_CONDITION: TMTNumericDataFieldEh
          FieldName = 'NEXT_CONDITION'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'NEXT_CONDITION'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object ORGZ_ID: TMTNumericDataFieldEh
          FieldName = 'ORGZ_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'ORGZ_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object HE_ID: TMTNumericDataFieldEh
          FieldName = 'HE_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'HE_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object WORK_ID: TMTNumericDataFieldEh
          FieldName = 'WORK_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'WORK_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object RESULT_ID: TMTNumericDataFieldEh
          FieldName = 'RESULT_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'RESULT_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object RQTPL_ID: TMTNumericDataFieldEh
          FieldName = 'RQTPL_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'RQTPL_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object repeated: TMTBooleanDataFieldEh
          FieldName = 'repeated'
          DisplayWidth = 10
        end
        object Expired: TMTNumericDataFieldEh
          FieldName = 'Expired'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'Expired'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object TimeFrom: TMTDateTimeDataFieldEh
          FieldName = 'TimeFrom'
          DateTimeDataType = fdtTimeEh
          DisplayWidth = 20
        end
        object TimeTo: TMTDateTimeDataFieldEh
          FieldName = 'TimeTo'
          DateTimeDataType = fdtTimeEh
          DisplayWidth = 20
        end
        object Whose: TMTNumericDataFieldEh
          FieldName = 'Whose'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object frxRequests: TfrxDBDataset
    UserName = 'Requests'
    OnCheckEOF = frxDBrequestsCheckEOF
    OnFirst = frxDBrequestsFirst
    OnNext = frxDBrequestsNext
    OnPrior = frxDBrequestsPrior
    CloseDataSource = False
    DataSource = srcPlan
    BCDToCurrency = False
    DataSetOptions = []
    Left = 191
    Top = 271
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 141
    Top = 339
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 195
    Top = 335
  end
end
