object PaymentsForm: TPaymentsForm
  Left = 256
  Top = 314
  Caption = #1055#1083#1072#1090#1077#1078#1080' '#1079#1072' '#1087#1077#1088#1080#1086#1076
  ClientHeight = 491
  ClientWidth = 917
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAll: TPanel
    Left = 0
    Top = 0
    Width = 917
    Height = 283
    Align = alClient
    TabOrder = 0
    object dbgPayments: TDBGridEh
      Left = 1
      Top = 30
      Width = 915
      Height = 252
      Align = alClient
      AllowedOperations = []
      AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
      DataSource = srcPayments
      DynProps = <>
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
      PopupMenu = gridPopUp
      ReadOnly = True
      SortLocal = True
      STFilter.Local = True
      SumList.Active = True
      TabOrder = 1
      TitleParams.MultiTitle = True
      OnDblClick = dbgPaymentsDblClick
      OnDataGroupGetRowText = dbgPaymentsDataGroupGetRowText
      OnGetCellParams = dbgPaymentsGetCellParams
      OnGetFooterParams = dbgPaymentsGetFooterParams
      OnKeyPress = dbgPaymentsKeyPress
      Columns = <
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
          FieldName = 'PAY_DATE'
          Footer.DisplayFormat = ',#0'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1055#1083#1072#1090#1077#1078'|'#1044#1072#1090#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DisplayFormat = ',#.##'
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_SUM'
          Footer.DisplayFormat = ',#.##'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1055#1083#1072#1090#1077#1078'|'#1057#1091#1084#1084#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DisplayFormat = ',#.##'
          DynProps = <>
          EditButtons = <>
          FieldName = 'FINE_SUM'
          Footer.DisplayFormat = ',#.##'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1055#1083#1072#1090#1077#1078'|'#1055#1077#1085#1103
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAYMENT_ID'
          Footers = <>
          Title.Caption = #1055#1083#1072#1090#1077#1078'|'#8470' '#1087#1083#1072#1090#1077#1078#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EXT_PAY_ID'
          Footers = <>
          Title.Caption = #1055#1083#1072#1090#1077#1078'|'#8470' '#1087#1083'. '#1089#1080#1089'.'
          Title.TitleButton = True
          Width = 67
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1083#1072#1090#1077#1078'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 80
        end
        item
          CellButtons = <>
          DisplayFormat = 'hh:nn dd-mm-yy'
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_DATETIME'
          Footers = <>
          Title.Caption = #1055#1083#1072#1090#1077#1078'|'#1042#1088#1077#1084#1103
          Title.TitleButton = True
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
          FieldName = 'O_NAME'
          Footers = <>
          Title.Caption = #1058#1080#1087#1072' '#1087#1083#1072#1090#1077#1078#1072
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
          FieldName = 'srv_name'
          Footers = <>
          Title.Caption = #1059#1089#1083#1091#1075#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_DOC_NO'
          Footers = <>
          Title.Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090'|'#1053#1086#1084#1077#1088
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'pay_doc_date'
          Footers = <>
          Title.Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090'|'#1044#1072#1090#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAYSOURCE_DESCR'
          Footers = <>
          Title.Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090'|'#1048#1089#1090#1086#1095#1085#1080#1082
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_TYPE_STR'
          Footers = <>
          Title.Caption = #1057#1087#1086#1089#1086#1073' '#1086#1087#1083#1072#1090#1099
          Title.TitleButton = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object ToolBar3: TToolBar
      Left = 1
      Top = 1
      Width = 915
      Height = 29
      Caption = 'ToolBar2'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Images = A4MainForm.ICONS_ACTIVE
      TabOrder = 0
      object ToolButton14: TToolButton
        Left = 0
        Top = 0
        Action = actPayDocNew
        Caption = 'W4w4'
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Action = actPayDocEdit
      end
      object ToolButton6: TToolButton
        Left = 46
        Top = 0
        Action = actPayDocDel
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
        Action = actPayDocSetPeriod
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
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082
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
            FieldName = 'PAYSOURCE_DESCR'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          end
          item
            AutoFitColWidth = False
            FieldName = 'LEAK_PRC'
            Title.Caption = #1055#1088#1086#1094#1077#1085#1090'|'#1080#1089#1090#1086#1095#1085#1080#1082#1091
          end
          item
            AutoFitColWidth = False
            FieldName = 'TAX_PRC'
            Title.Caption = #1055#1088#1086#1094#1077#1085#1090'|'#1053#1044#1057
          end>
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
        DropDownBox.UseMultiTitle = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        DropDownBox.Width = 150
        EditButtons = <>
        KeyField = 'PAYSOURCE_ID'
        ListField = 'PAYSOURCE_DESCR'
        ListSource = srcPaymentSource
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Visible = True
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
        Action = actPaySourceFilter
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
      object chkGroup: TCheckBox
        Left = 538
        Top = 0
        Width = 144
        Height = 22
        Action = actGroup
        Alignment = taLeftJustify
        TabOrder = 2
      end
    end
  end
  object pnlErrors: TPanel
    Left = 0
    Top = 283
    Width = 917
    Height = 208
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object lbl1: TLabel
      Left = 0
      Top = 0
      Width = 917
      Height = 13
      Align = alTop
      Caption = #1054#1096#1080#1073#1082#1080' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1087#1083#1072#1090#1077#1078#1077#1081
    end
    object dbgrdErrors: TDBGridEh
      Left = 0
      Top = 13
      Width = 917
      Height = 195
      Align = alClient
      AutoFitColWidths = False
      DataSource = srcErrors
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      RowPanel.Active = True
      SumList.Active = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      Columns = <
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ERROR_TEXT'
          Footer.Value = #1048#1090#1086#1075#1086
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Caption = #1054#1096#1080#1073#1082#1072
          Width = 118
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'LINE'
          Footers = <>
          Title.Caption = #1057#1090#1088#1086#1082#1072' '#1089' '#1086#1096#1080#1073#1082#1086#1081
          Width = 462
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
          Width = 79
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_SUM'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 80
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object alGuide: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 272
    Top = 112
    object actPayDocNew: TAction
      Caption = #1053#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 2
      ShortCut = 45
      OnExecute = actPayDocNewExecute
    end
    object actPayDocEdit: TAction
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
      Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      ImageIndex = 4
      ShortCut = 113
      OnExecute = actPayDocEditExecute
    end
    object actPayDocDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 3
      ShortCut = 16430
      OnExecute = actPayDocDelExecute
    end
    object actPayDocSearch: TAction
      Caption = #1055#1086#1080#1089#1082
      Hint = #1055#1086#1080#1089#1082'|'#1041#1099#1089#1090#1088#1099#1081' '#1087#1086#1080#1089#1082' '#1087#1086' '#1086#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1085#1085#1086#1084#1091' '#1089#1090#1086#1083#1073#1094#1091
      ImageIndex = 7
      ShortCut = 16454
    end
    object actPayDocSetPeriod: TAction
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1077#1088#1080#1086#1076
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1077#1088#1080#1086#1076' '#1086#1090#1073#1086#1088#1072' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 1
      ShortCut = 16452
      OnExecute = actPayDocSetPeriodExecute
    end
    object actPaySourceFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1080#1089#1090#1086#1095#1085#1080#1082#1072#1084
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1080#1089#1090#1086#1095#1085#1080#1082#1072#1084' '#1087#1083#1072#1090#1077#1078#1077#1081
      ImageIndex = 0
      OnExecute = actPaySourceFilterExecute
    end
    object actPrintDoc: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' / '#1087#1077#1095#1072#1090#1100' '#1087#1072#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084
      ImageIndex = 5
      ShortCut = 16464
      OnExecute = actPrintDocExecute
    end
    object actEditPayment: TAction
      Category = 'Payment'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1083#1072#1090#1077#1078
      ImageIndex = 24
    end
    object actQuickFilter: TAction
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083'/'#1042#1099#1082#1083' '#1073#1099#1089#1090#1088#1086#1075#1086' '#1092#1080#1083#1100#1090#1088#1072
      ImageIndex = 40
      ShortCut = 16465
      OnExecute = actQuickFilterExecute
    end
    object actGroup: TAction
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1091
      OnExecute = actGroupExecute
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
  object dsPayments: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PAY_DOC'
      'SET '
      '    PAYSOURCE_ID = :PAYSOURCE_ID,'
      '    PAY_DOC_NO = :PAY_DOC_NO,'
      '    PAY_DOC_DATE = :PAY_DOC_DATE,'
      '    PAY_DOC_SUM = :PAY_DOC_SUM,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    PAY_DOC_ID = :OLD_PAY_DOC_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PAY_DOC'
      'WHERE'
      '        PAY_DOC_ID = :OLD_PAY_DOC_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PAY_DOC('
      '    PAY_DOC_ID,'
      '    PAYSOURCE_ID,'
      '    PAY_DOC_NO,'
      '    PAY_DOC_DATE,'
      '    PAY_DOC_SUM,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :PAY_DOC_ID,'
      '    :PAYSOURCE_ID,'
      '    :PAY_DOC_NO,'
      '    :PAY_DOC_DATE,'
      '    :PAY_DOC_SUM,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select'
      
        '    P.PAYMENT_ID, P.PAY_DOC_ID, P.CUSTOMER_ID, P.PAY_DATE, P.PAY' +
        '_SUM,'
      '    P.FINE_SUM, P.NOTICE, P.PAYMENT_SRV, cs.HIS_COLOR,'
      '    coalesce(W.SURNAME, P.ADDED_BY) ADDED_BY, P.ADDED_ON,'
      
        '    coalesce(E.SURNAME, P.EDIT_BY) EDIT_BY, P.EDIT_ON, P.EXT_PAY' +
        '_ID, P.TAG,'
      '    P.PAY_DATETIME, P.NEED_CHECK, CS.CUST_CODE, CS.ACCOUNT_NO,'
      
        '    CS.SURNAME || coalesce('#39' '#39' || CS.INITIALS,'#39#39') as FIO, CS.DEB' +
        'T_SUM,'
      
        '    -1 * CS.DEBT_SUM as BALANCE, S.STREET_NAME, H.HOUSE_NO, CS.F' +
        'LAT_NO,'
      
        '    R.NAME SRV_NAME, D.PAY_DOC_NO, D.PAY_DOC_DATE, PS.PAYSOURCE_' +
        'DESCR'
      '    , p.PAY_TYPE_STR'
      '  from PAYMENT P'
      '       inner join PAY_DOC D on (P.PAY_DOC_ID = D.PAY_DOC_ID)'
      
        '       inner join PAYSOURCE PS on (PS.PAYSOURCE_ID = D.PAYSOURCE' +
        '_ID)'
      
        '       inner join CUSTOMER CS on (CS.CUSTOMER_ID = P.CUSTOMER_ID' +
        ')'
      '       inner join HOUSE H on (H.HOUSE_ID = CS.HOUSE_ID)'
      '       inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      
        '       left outer join SERVICES R on (P.PAYMENT_SRV = R.SERVICE_' +
        'ID)'
      '       left outer join WORKER W on (W.IBNAME = P.ADDED_BY)'
      '       left outer join WORKER E on (E.IBNAME = P.EDIT_BY)'
      '  where P.PAYMENT_ID = :OLD_PAYMENT_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      
        '    P.PAYMENT_ID, P.PAY_DOC_ID, P.CUSTOMER_ID, P.PAY_DATE, P.PAY' +
        '_SUM,'
      '    P.FINE_SUM, P.NOTICE, P.PAYMENT_SRV, cs.HIS_COLOR,'
      '    coalesce(W.SURNAME, P.ADDED_BY) ADDED_BY, P.ADDED_ON,'
      
        '    coalesce(E.SURNAME, P.EDIT_BY) EDIT_BY, P.EDIT_ON, P.EXT_PAY' +
        '_ID, P.TAG,'
      '    P.PAY_DATETIME, P.NEED_CHECK, CS.CUST_CODE, CS.ACCOUNT_NO,'
      
        '    CS.SURNAME || coalesce('#39' '#39' || CS.INITIALS,'#39#39') as FIO, CS.DEB' +
        'T_SUM,'
      
        '    -1 * CS.DEBT_SUM as BALANCE, S.STREET_NAME, H.HOUSE_NO, CS.F' +
        'LAT_NO,'
      
        '    R.NAME SRV_NAME, D.PAY_DOC_NO, D.PAY_DOC_DATE, PS.PAYSOURCE_' +
        'DESCR'
      '    , p.PAY_TYPE_STR'
      '  from PAYMENT P'
      '       inner join PAY_DOC D on (P.PAY_DOC_ID = D.PAY_DOC_ID)'
      
        '       inner join PAYSOURCE PS on (PS.PAYSOURCE_ID = D.PAYSOURCE' +
        '_ID)'
      
        '       inner join CUSTOMER CS on (CS.CUSTOMER_ID = P.CUSTOMER_ID' +
        ')'
      '       inner join HOUSE H on (H.HOUSE_ID = CS.HOUSE_ID)'
      '       inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      
        '       left outer join SERVICES R on (P.PAYMENT_SRV = R.SERVICE_' +
        'ID)'
      '       left outer join WORKER W on (W.IBNAME = P.ADDED_BY)'
      '       left outer join WORKER E on (E.IBNAME = P.EDIT_BY)'
      '  where P.PAY_DATE between :STARTDATE and :ENDDATE'
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
  object srcPayments: TDataSource
    AutoEdit = False
    DataSet = dsPayments
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
    DataSet = dsPayments
    BCDToCurrency = False
    Left = 315
    Top = 211
  end
  object dsPaymentSource: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT PAYSOURCE_ID, PAYSOURCE_DESCR, LEAK_PRC, TAX_PRC'
      'FROM PAYSOURCE'
      'order by paysource_descr')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 512
    Top = 344
    oStartTransaction = False
    oFetchAll = True
  end
  object srcPaymentSource: TDataSource
    AutoEdit = False
    DataSet = dsPaymentSource
    Left = 512
    Top = 400
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
  object qDetailCount: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select count(*) from payment p where p.pay_doc_id = :pay_doc_id')
    Left = 128
    Top = 216
    qoStartTransaction = True
  end
  object MainMenu1: TMainMenu
    Left = 520
    Top = 184
    object N5: TMenuItem
      Caption = #1055#1083#1072#1090#1077#1078#1080
      GroupIndex = 4
      object N10: TMenuItem
        Action = actPayDocSetPeriod
      end
      object N11: TMenuItem
        Action = actPaySourceFilter
      end
      object N15: TMenuItem
        Action = actQuickFilter
      end
      object N13: TMenuItem
        Action = actGroup
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object N6: TMenuItem
        Action = actPayDocNew
      end
      object N7: TMenuItem
        Action = actPayDocEdit
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Action = actPrintDoc
      end
    end
  end
  object mtPayments: TMemTableEh
    Params = <>
    DataDriver = drvPayments
    Left = 378
    Top = 135
  end
  object drvPayments: TpFIBDataDriverEh
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
      
        'iif(cast(r.RQ_COMPLETED as date) is null,r.RQ_TIME_FROM, lpad(ex' +
        'tract(HOUR from r.RQ_COMPLETED),2,'#39'0'#39')||'#39':'#39'||extract(minute from' +
        ' r.RQ_COMPLETED)) as G_E_FROM,'
      
        'iif(cast(r.RQ_EXEC_TIME as date) is null,r.RQ_TIME_TO, extract(H' +
        'OUR from r.RQ_EXEC_TIME)||'#39':'#39'||extract(minute from r.RQ_EXEC_TIM' +
        'E)) as G_E_TO,'
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
    ProviderDataSet = dsPayments
    KeyFields = 'payment_id'
    Left = 457
    Top = 135
  end
  object dsErrors: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PAY_ERRORS'
      'WHERE'
      '        PE_ID = :OLD_PE_ID'
      '    ')
    SelectSQL.Strings = (
      'select PE_ID, PAY_DOC_ID, PAY_DATE, PAY_SUM, LINE, ERROR_TEXT'
      'from PAY_ERRORS'
      'where PAY_DATE between :StartDate and :EndDate'
      'order by 1')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 335
    Top = 345
  end
  object srcErrors: TDataSource
    DataSet = dsErrors
    Left = 330
    Top = 402
  end
  object pmGridClick: TPopupMenu
    Left = 569
    Top = 117
    object miPayDoc: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      OnClick = miPayDocClick
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
end
