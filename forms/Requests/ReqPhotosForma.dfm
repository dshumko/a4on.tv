object ReqPhotosForm: TReqPhotosForm
  Left = 256
  Top = 314
  Caption = #1060#1072#1081#1083#1099' '#1079#1072' '#1087#1077#1088#1080#1086#1076
  ClientHeight = 491
  ClientWidth = 1033
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAll: TPanel
    Left = 0
    Top = 0
    Width = 1033
    Height = 491
    Align = alClient
    TabOrder = 0
    object ToolBar3: TToolBar
      Left = 1
      Top = 1
      Width = 1031
      Height = 29
      Caption = 'ToolBar2'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Images = A4MainForm.ICONS_ACTIVE
      TabOrder = 0
      object btnEdit: TToolButton
        Left = 0
        Top = 0
        Action = actEdit
      end
      object ToolButton16: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'W4w4'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 31
        Top = 0
        Action = actSetPeriod
        Caption = 'W4w4'
        DropdownMenu = pmPeriod
        Style = tbsDropDown
      end
      object ToolButton3: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'W4w4'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 77
        Top = 0
        Action = actPrintDoc
      end
      object ToolButton1: TToolButton
        Left = 100
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object Panel4: TPanel
        Left = 108
        Top = 0
        Width = 58
        Height = 22
        Align = alLeft
        BevelOuter = bvNone
        Caption = #1058#1080#1087
        TabOrder = 0
      end
      object luPayment: TDBLookupComboboxEh
        Left = 166
        Top = 0
        Width = 220
        Height = 22
        AutoSize = False
        DynProps = <>
        DataField = ''
        DropDownBox.Columns = <
          item
            FieldName = 'O_NAME'
            Title.Caption = #1058#1080#1087
            Width = 60
          end
          item
            AutoFitColWidth = False
            FieldName = 'O_DESCRIPTION'
            Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            Width = 90
          end>
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
        DropDownBox.UseMultiTitle = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        DropDownBox.Width = 150
        EmptyDataInfo.Text = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1090#1080#1087#1091' '#1092#1072#1081#1083#1072
        EditButtons = <>
        KeyField = 'O_ID'
        ListField = 'O_NAME'
        ListSource = srcFileType
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object ToolButton20: TToolButton
        Left = 386
        Top = 0
        Width = 3
        Caption = 'ToolButton20'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 389
        Top = 0
        Action = actTypeFilter
      end
      object ToolButton27: TToolButton
        Left = 412
        Top = 0
        Action = actQuickFilter
      end
      object btn1: TToolButton
        Left = 435
        Top = 0
        Width = 18
        Caption = 'btn1'
        ImageIndex = 41
        Style = tbsSeparator
      end
      object btnFilterCustomers: TToolButton
        Left = 453
        Top = 0
        Action = actFilterCustomers
      end
      object btn2: TToolButton
        Left = 476
        Top = 0
        Width = 16
        Caption = 'btn2'
        ImageIndex = 42
        Style = tbsSeparator
      end
    end
    object pnlMain: TPanel
      Left = 1
      Top = 30
      Width = 1031
      Height = 460
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object spl1: TSplitter
        Left = 669
        Top = 0
        Height = 460
        Align = alRight
      end
      object imgJPG: TDBImageEh
        Left = 672
        Top = 0
        Width = 359
        Height = 460
        Align = alRight
        DataField = 'JPG'
        DataSource = srcFiles
        DynProps = <>
        TabOrder = 0
        OnDblClick = imgJPGDblClick
      end
      object dbgFiles: TDBGridEh
        Left = 0
        Top = 0
        Width = 669
        Height = 460
        Align = alClient
        AllowedOperations = []
        DataGrouping.DefaultStateExpanded = True
        DataSource = srcFiles
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
        STFilter.Local = True
        SumList.Active = True
        SumList.VirtualRecords = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnDblClick = dbgFilesDblClick
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
    end
  end
  object alGuide: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 272
    Top = 112
    object actAct: TAction
      Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1090#1100
      Hint = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1086#1090#1084#1077#1090#1082#1091' '#1086' '#1086#1073#1088#1072#1073#1086#1090#1082#1077
      ImageIndex = 25
      ShortCut = 114
    end
    object actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1092#1072#1081#1083
      ImageIndex = 4
      ShortCut = 113
      OnExecute = actEditExecute
    end
    object actDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1090#1084#1077#1090#1082#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1086#1090#1084#1077#1090#1082#1091' '#1086' '#1086#1073#1088#1072#1073#1086#1090#1082#1077
      ImageIndex = 3
      ShortCut = 16430
      OnExecute = actDelExecute
    end
    object actSearch: TAction
      Caption = #1055#1086#1080#1089#1082
      Hint = #1055#1086#1080#1089#1082'|'#1041#1099#1089#1090#1088#1099#1081' '#1087#1086#1080#1089#1082' '#1087#1086' '#1086#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1085#1085#1086#1084#1091' '#1089#1090#1086#1083#1073#1094#1091
      ImageIndex = 7
      ShortCut = 16454
    end
    object actSetPeriod: TAction
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1077#1088#1080#1086#1076
      Hint = #1055#1077#1088#1080#1086#1076' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1092#1072#1081#1083#1072
      ImageIndex = 1
      ShortCut = 16452
      OnExecute = actSetPeriodExecute
    end
    object actTypeFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1090#1080#1087#1091' '#1092#1072#1081#1083#1072
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1090#1080#1087#1091' '#1092#1072#1081#1083#1072
      ImageIndex = 0
      OnExecute = actTypeFilterExecute
    end
    object actPrintDoc: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' / '#1087#1077#1095#1072#1090#1100' '#1092#1072#1081#1083#1072
      ImageIndex = 5
      ShortCut = 16464
      OnExecute = actPrintDocExecute
    end
    object actQuickFilter: TAction
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083'/'#1042#1099#1082#1083' '#1073#1099#1089#1090#1088#1086#1075#1086' '#1092#1080#1083#1100#1090#1088#1072
      ImageIndex = 40
      ShortCut = 16465
      OnExecute = actQuickFilterExecute
    end
    object actFilterCustomers: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1089#1087#1080#1089#1082#1077
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      ImageIndex = 9
      OnExecute = actFilterCustomersExecute
    end
  end
  object gridPopUp: TPopupMenu
    Left = 132
    Top = 142
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
  object dsFiles: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CUSTOMER_FILES'
      'SET '
      '    ACT = :ACT,'
      '    ANOTICE = :ANOTICE'
      'WHERE'
      '    CF_ID = :OLD_CF_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    REQUEST_PHOTOS'
      'WHERE'
      '        ID = :OLD_FILE_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    CF.Cf_Id'
      '  , coalesce(CF.Name, '#39#39') Name'
      '  , CF.Cf_Type'
      '  , O.O_Name'
      '  , CF.Filename'
      '  , CF.Notice'
      '  , coalesce(CF.Act, 0) ACT'
      '  , CF.Anotice'
      '  , c.HIS_COLOR'
      '  , coalesce(W.SURNAME, cf.ADDED_BY) ADDED_BY'
      '  , cf.ADDED_ON'
      '  , coalesce(E.SURNAME, cf.EDIT_BY) EDIT_BY'
      '  , cf.EDIT_ON'
      '  , C.CUST_CODE'
      '  , C.ACCOUNT_NO'
      '  , C.SURNAME || coalesce('#39' '#39' || C.INITIALS, '#39#39') as FIO'
      '  , C.DEBT_SUM'
      '  , -1 * C.DEBT_SUM as BALANCE'
      '  , S.STREET_NAME'
      '  , H.HOUSE_NO'
      '  , C.FLAT_NO'
      '  , cf.CUSTOMER_ID'
      '  from Customer_Files CF'
      
        '       INNER JOIN OBJECTS O ON (O.O_Id = CF.Cf_Type AND O.O_TYPE' +
        ' = 33)'
      '       inner join CUSTOMER C on (C.CUSTOMER_ID = cf.CUSTOMER_ID)'
      '       inner join HOUSE H on (H.HOUSE_ID = C.HOUSE_ID)'
      '       inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      '       left outer join WORKER W on (W.IBNAME = cf.ADDED_BY)'
      '       left outer join WORKER E on (E.IBNAME = cf.EDIT_BY)'
      '  where CF.CF_ID = :OLD_CF_ID'
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
      '    , p.Id FILE_ID'
      '    , p.Jpg'
      '    , p.Notice FILE_NOTICE'
      '    from REQUEST R'
      '        inner join Request_Photos p on (p.Rq_Id = r.RQ_ID)'
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
      'where '
      
        '(R.RQ_EXEC_TIME  >= :StartDate and R.RQ_EXEC_TIME  < DATEADD(1 D' +
        'AY TO :EndDate))'
      '@@SOURCE%and 1 = 1@'
      'order by R.RQ_ID  ')
    AutoUpdateOptions.UpdateTableName = 'PAY_DOC'
    AutoUpdateOptions.KeyFields = 'PAY_DOC_ID'
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DefaultFormats.NumericDisplayFormat = '#'
    Left = 124
    Top = 345
    poImportDefaultValues = False
    oRefreshAfterPost = False
    oRefreshDeletedRecord = True
  end
  object srcFiles: TDataSource
    AutoEdit = False
    DataSet = dsFiles
    Left = 119
    Top = 397
  end
  object frxDBPayments: TfrxDBDataset
    UserName = #1055#1051#1040#1058#1045#1046#1053#1067#1045'_'#1044#1054#1050#1059#1052#1045#1053#1058#1067
    OnCheckEOF = frxDBPaymentsCheckEOF
    OnFirst = frxDBPaymentsFirst
    OnNext = frxDBPaymentsNext
    CloseDataSource = False
    FieldAliases.Strings = (
      'PAY_DOC_ID='#1050#1054#1044'_'#1055#1044
      '-PAYSOURCE_ID='#1050#1054#1044'_'#1048#1057#1058#1054#1063#1053#1048#1050#1040'_'#1055#1051#1040#1058#1045#1046#1045#1049
      'PAY_DOC_NO='#1053#1054#1052#1045#1056'_'#1055#1044
      'PAY_DOC_DATE='#1044#1040#1058#1040'_'#1055#1044
      'PAY_DOC_SUM='#1057#1059#1052#1052#1040'_'#1055#1044
      'NOTICE='#1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
      'PAYSOURCE_DESCR='#1048#1057#1058#1054#1063#1053#1048#1050'_'#1055#1051#1040#1058#1045#1046#1045#1049
      'C_SUM_LEAK=C_SUM_LEAK'
      'C_SUM_TAX=C_SUM_TAX'
      'C_SUM_LEAK_TAX=C_SUM_LEAK_TAX'
      'SUM_INTERED=SUM_INTERED'
      'SUM_DIFFERENCE='#1056#1040#1047#1053#1048#1062#1040'_'#1057#1059#1052#1052
      'LEAK_PRC=LEAK_PRC')
    DataSet = dsFiles
    BCDToCurrency = False
    Left = 315
    Top = 211
  end
  object pmPeriod: TPopupMenu
    Left = 225
    Top = 201
    object N1: TMenuItem
      Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #1047#1072' '#1087#1088#1086#1096#1083#1099#1081' '#1076#1077#1085#1100
      OnClick = N4Click
    end
    object N2: TMenuItem
      Caption = #1047#1072' '#1085#1077#1076#1077#1083#1102
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1047#1072' '#1084#1077#1089#1103#1094
      OnClick = N3Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 520
    Top = 184
    object N5: TMenuItem
      Caption = #1060#1072#1081#1083#1099
      GroupIndex = 4
      object N10: TMenuItem
        Action = actSetPeriod
      end
      object N11: TMenuItem
        Action = actTypeFilter
      end
      object N15: TMenuItem
        Action = actQuickFilter
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Action = actPrintDoc
      end
    end
  end
  object pmGridClick: TPopupMenu
    Left = 569
    Top = 117
    object miPayDoc: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
    end
    object miAbonent: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      OnClick = miAbonentClick
    end
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 709
    Top = 147
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 763
    Top = 151
  end
  object dsFileType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    Rt_Id O_ID'
      '  , Rt_Name O_NAME'
      '  , '#39#39' O_DESCRIPTION'
      '  , 0 O_DELETED'
      '  from Request_Types'
      'order by 2')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 512
    Top = 344
    oStartTransaction = False
    oFetchAll = True
  end
  object srcFileType: TDataSource
    AutoEdit = False
    DataSet = dsFileType
    Left = 512
    Top = 400
  end
  object qRead: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select'
      'p.Jpg'
      'from Request_Photos p '
      'where p.Id = :ID')
    Left = 536
    Top = 280
  end
  object PropStorageEh: TPropStorageEh
    Section = 'RequestsPhoto'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'pnlAll.pnlMain.imgJPG.<P>.Width')
    Left = 322
    Top = 304
  end
end
