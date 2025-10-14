object CustFilesForm: TCustFilesForm
  Left = 256
  Top = 314
  ActiveControl = dbgFiles
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
    object dbgFiles: TDBGridEh
      Left = 1
      Top = 30
      Width = 1031
      Height = 460
      Align = alClient
      AllowedOperations = []
      AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
      DataSource = srcFiles
      DynProps = <>
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
      PopupMenu = gridPopUp
      ReadOnly = True
      SearchPanel.Enabled = True
      SortLocal = True
      STFilter.Local = True
      SumList.Active = True
      TabOrder = 1
      TitleParams.MultiTitle = True
      OnDblClick = dbgFilesDblClick
      OnDataGroupGetRowText = dbgFilesDataGroupGetRowText
      OnGetCellParams = dbgFilesGetCellParams
      OnGetFooterParams = dbgFilesGetFooterParams
      OnKeyPress = dbgFilesKeyPress
      Columns = <
        item
          CellButtons = <>
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'ACT'
          Footers = <>
          Title.Caption = #1054#1073#1088'.'
          Title.Hint = #1054#1073#1088#1072#1073#1086#1090#1072#1085#1086
          Title.TitleButton = True
          Width = 34
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ACCOUNT_NO'
          Footers = <>
          Title.Caption = #1051#1080#1094#1077#1074#1086#1081
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CUST_CODE'
          Footers = <>
          Title.Caption = #1050#1086#1076
          Title.TitleButton = True
          Width = 70
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FIO'
          Footers = <>
          Title.Caption = #1060#1048#1054
          Title.TitleButton = True
          Width = 134
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'O_NAME'
          Footer.DisplayFormat = ',#.##'
          Footers = <>
          Title.Caption = #1060#1072#1081#1083'|'#1058#1080#1087
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1060#1072#1081#1083'|'#1053#1072#1079#1074#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 72
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FILENAME'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1060#1072#1081#1083'|'#1060#1072#1081#1083
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1060#1072#1081#1083'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 80
          OnGetCellParams = dbgFilesColumns7GetCellParams
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_BY'
          Footers = <>
          Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085'|'#1050#1077#1084
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_ON'
          Footers = <>
          Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085'|'#1050#1086#1075#1076#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EDIT_BY'
          Footers = <>
          Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1077#1084
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EDIT_ON'
          Footers = <>
          Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1086#1075#1076#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DEBT_SUM'
          Footers = <>
          Title.Caption = #1057#1072#1083#1100#1076#1086
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'BALANCE'
          Footers = <>
          Title.Caption = #1041#1072#1083#1072#1085#1089
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STREET_NAME'
          Footers = <>
          Title.Caption = #1059#1083#1080#1094#1072
          Title.TitleButton = True
          Width = 106
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'HOUSE_NO'
          Footers = <>
          Title.Caption = #1044#1086#1084
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FLAT_NO'
          Footers = <>
          Title.Caption = #1050#1074'.'
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ANOTICE'
          Footers = <>
          Title.Caption = #1058#1077#1082#1089#1090' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
          Title.TitleButton = True
          Width = 104
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
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
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Action = actAct
      end
      object ToolButton6: TToolButton
        Left = 46
        Top = 0
        Action = actDel
        Caption = 'W4w4'
      end
      object ToolButton16: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'W4w4'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 77
        Top = 0
        Action = actSetPeriod
        Caption = 'W4w4'
        DropdownMenu = pmPeriod
        Style = tbsDropDown
      end
      object ToolButton3: TToolButton
        Left = 115
        Top = 0
        Width = 8
        Caption = 'W4w4'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 123
        Top = 0
        Action = actPrintDoc
      end
      object ToolButton1: TToolButton
        Left = 146
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object Panel4: TPanel
        Left = 154
        Top = 0
        Width = 58
        Height = 22
        Align = alLeft
        BevelOuter = bvNone
        Caption = #1058#1080#1087
        TabOrder = 0
      end
      object luPayment: TDBLookupComboboxEh
        Left = 212
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
        DropDownBox.ListSource = srcFileType
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterType = lsftContainsEh
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
        DropDownBox.UseMultiTitle = True
        DropDownBox.AutoDrop = True
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
        Style = csDropDownEh
        TabOrder = 1
        Visible = True
        OnClick = luPaymentClick
        OnEnter = luPaymentEnter
      end
      object ToolButton20: TToolButton
        Left = 432
        Top = 0
        Width = 3
        Caption = 'ToolButton20'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 435
        Top = 0
        Action = actTypeFilter
      end
      object ToolButton27: TToolButton
        Left = 458
        Top = 0
        Action = actQuickFilter
      end
      object btn1: TToolButton
        Left = 481
        Top = 0
        Width = 18
        Caption = 'btn1'
        ImageIndex = 41
        Style = tbsSeparator
      end
      object btnFilterCustomers: TToolButton
        Left = 499
        Top = 0
        Action = actFilterCustomers
      end
      object btn2: TToolButton
        Left = 522
        Top = 0
        Width = 16
        Caption = 'btn2'
        ImageIndex = 42
        Style = tbsSeparator
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
      OnExecute = actActExecute
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
      '  , @@SQL_COLOR%c.HIS_COLOR@ HIS_COLOR'
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
      '    CF.Cf_Id'
      '  , coalesce(CF.Name, '#39#39') Name'
      '  , CF.Cf_Type'
      '  , O.O_Name'
      '  , CF.Filename'
      '  , CF.Notice'
      '  , coalesce(CF.Act, 0) ACT'
      '  , CF.Anotice'
      '  , @@SQL_COLOR%c.HIS_COLOR@ HIS_COLOR'
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
      
        '  where cf.Added_On between :STARTDATE and dateadd(day, 1, :ENDD' +
        'ATE)'
      '      @@SOURCE%and 1 = 1@')
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
    DataSetOptions = []
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
      'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED'
      'FROM OBJECTS'
      'WHERE O_TYPE = 33 AND O_DELETED = 0'
      'order BY O_NAME')
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
      'select Content from Customer_Files where Cf_Id = :Cf_Id')
    Left = 656
    Top = 360
  end
end
