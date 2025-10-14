object PayDocsForm: TPayDocsForm
  Left = 256
  Top = 314
  ActiveControl = dbgPayDoc
  Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
  ClientHeight = 501
  ClientWidth = 1020
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
    Width = 1020
    Height = 501
    Align = alClient
    TabOrder = 0
    object dbgPayDoc: TDBGridEh
      Left = 1
      Top = 30
      Width = 1018
      Height = 470
      Align = alClient
      AllowedOperations = []
      AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
      DataSource = srcPayDocs
      DynProps = <>
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
      ReadOnly = True
      SearchPanel.Enabled = True
      SortLocal = True
      STFilter.Local = True
      SumList.Active = True
      TabOrder = 1
      TitleParams.MultiTitle = True
      OnDblClick = dbgPayDocDblClick
      OnGetCellParams = dbgPayDocGetCellParams
      OnGetFooterParams = dbgPayDocGetFooterParams
      OnKeyPress = dbgPayDocKeyPress
      Columns = <
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_DOC_NO'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #8470' '#1076#1086#1082'.'
          Title.TitleButton = True
          Title.SortIndex = 2
          Title.SortMarker = smDownEh
          Width = 52
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_DOC_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Title.TitleButton = True
          Title.SortIndex = 1
          Title.SortMarker = smDownEh
          Width = 66
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAYSOURCE_DESCR'
          Footers = <>
          Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1087#1083#1072#1090#1077#1078#1072
          Title.TitleButton = True
          Width = 112
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CNT_PAYS'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1050#1086#1083'-'#1074#1086' '#1087#1083#1072#1090#1077#1078#1077#1081
          Title.TitleButton = True
          Width = 70
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',0.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_DOC_SUM'
          Footer.DisplayFormat = ',#.##'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = False
          Title.Caption = #1057#1091#1084#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Title.TitleButton = True
          Width = 85
        end
        item
          CellButtons = <>
          DisplayFormat = ',0.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'SUM_PAID'
          Footer.DisplayFormat = ',0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1074#1085#1077#1089#1077#1085#1085#1099#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
          Width = 72
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',0.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'FINE_SUM'
          Footer.DisplayFormat = ',0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1055#1077#1085#1103
          Title.TitleButton = True
          Width = 58
        end
        item
          CellButtons = <>
          DisplayFormat = ',0.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'SUM_INTERED'
          Footer.DisplayFormat = ',0.00'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1077#1081' '#1085#1072' '#1089#1095#1077#1090#1072' '#1072#1073#1086#1085'.'
          Width = 80
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#.##'
          DynProps = <>
          EditButtons = <>
          FieldName = 'SUM_DIFFERENCE'
          Footer.DisplayFormat = ',#.##'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1056#1072#1079#1085#1080#1094#1072' '#1089#1091#1084#1084
          Title.TitleButton = True
          Width = 94
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#.##'
          DynProps = <>
          EditButtons = <>
          FieldName = 'LEAK_PRC'
          Footer.DisplayFormat = ',#.##'
          Footers = <>
          Title.Caption = #1050#1086#1084#1080#1089'. '#1089#1073#1086#1088'|%'
          Title.TitleButton = True
          Width = 38
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#.##'
          DynProps = <>
          EditButtons = <>
          FieldName = 'C_SUM_LEAK'
          Footer.DisplayFormat = ',#.##'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1050#1086#1084#1080#1089'. '#1089#1073#1086#1088'|'#1057#1091#1084#1084#1072
          Title.TitleButton = True
          Width = 94
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#.##'
          DynProps = <>
          EditButtons = <>
          FieldName = 'C_SUM_TAX'
          Footer.DisplayFormat = ',#.##'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1053#1044#1057
          Title.Hint = #1057#1091#1084#1084#1072' '#1053#1044#1057
          Title.TitleButton = True
          Title.ToolTips = True
          Width = 59
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#.##'
          DynProps = <>
          EditButtons = <>
          FieldName = 'C_SUM_LEAK_TAX'
          Footer.DisplayFormat = ',#.##'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1082#1086#1084'. '#1089#1073#1086#1088' '#1080' '#1053#1044#1057
          Title.Hint = #1057#1091#1084#1084#1072' '#1082#1086#1084#1080#1089#1089#1080#1086#1085#1085#1086#1075#1086' '#1089#1073#1086#1088#1072
          Title.TitleButton = True
          Title.ToolTips = True
          Width = 100
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 176
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_BY'
          Footers = <>
          Title.Caption = #1044#1086#1073#1072#1074#1080#1083'|'#1050#1090#1086
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_ON'
          Footers = <>
          Title.Caption = #1044#1086#1073#1072#1074#1080#1083'|'#1050#1086#1075#1076#1072
          Title.TitleButton = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object ToolBar3: TToolBar
      Left = 1
      Top = 1
      Width = 1018
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
      object luPayment: TDBLookupComboboxEh
        Left = 154
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
        DropDownBox.ListSource = srcPaymentSource
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
        DropDownBox.SortLocal = True
        DropDownBox.UseMultiTitle = True
        DropDownBox.AutoDrop = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        DropDownBox.Width = 150
        EmptyDataInfo.Text = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1080#1089#1090#1086#1095#1085#1080#1082#1091' '#1087#1083#1072#1090#1077#1078#1072
        EditButtons = <>
        KeyField = 'PAYSOURCE_ID'
        ListField = 'PAYSOURCE_DESCR'
        ListSource = srcPaymentSource
        ParentShowHint = False
        ShowHint = True
        Style = csDropDownEh
        TabOrder = 0
        Visible = True
      end
      object ToolButton20: TToolButton
        Left = 374
        Top = 0
        Width = 3
        Caption = 'ToolButton20'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 377
        Top = 0
        Action = actPaySourceFilter
      end
      object ToolButton27: TToolButton
        Left = 400
        Top = 0
        Action = actQuickFilter
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
    object actCopyID: TAction
      Caption = 'actCopyID'
      ShortCut = 24649
      OnExecute = actCopyIDExecute
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
  object dsPayDocs: TpFIBDataSet
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
      
        '    D.PAY_DOC_ID, D.PAYSOURCE_ID, D.PAY_DOC_NO, D.PAY_DOC_DATE, ' +
        'D.PAY_DOC_SUM, D.NOTICE, ps.paysource_descr, ps.leak_prc'
      
        '    , round(ps.leak_prc * (D.PAY_DOC_SUM + FINE_SUM) / 100, 2) a' +
        's c_SUM_leak'
      
        '    , round(ps.tax_prc * ps.leak_prc * (D.PAY_DOC_SUM + FINE_SUM' +
        ') / 10000, 2) as c_SUM_TAX'
      
        '    , ((p.SUM_INTERED + FINE_SUM) - round(((ps.tax_prc * ps.leak' +
        '_prc * (D.PAY_DOC_SUM + FINE_SUM)/ 10000) + (ps.leak_prc * (D.PA' +
        'Y_DOC_SUM + FINE_SUM) / 100)), 2)) as c_SUM_LEAK_TAX'
      '    , p.SUM_INTERED'
      '    , FINE_SUM'
      
        '    , ( coalesce(D.PAY_DOC_SUM,0) - coalesce(p.SUM_INTERED,0) ) ' +
        'as SUM_DIFFERENCE'
      
        '    , ( coalesce(p.SUM_INTERED,0) + coalesce(p.FINE_SUM, 0) ) SU' +
        'M_PAID     '
      '    , (select'
      '         count(*)'
      '       from pay_errors pe'
      '       where pe.pay_doc_id = Pay_Doc_Id) pay_errors,'
      '  coalesce(w.Surname, d.Added_By) Added_By,'
      '  d.Added_On       '
      '  from PAY_DOC D'
      
        '       left outer join PAYSOURCE PS on (D.PAYSOURCE_ID = PS.PAYS' +
        'OURCE_ID)'
      
        '       left outer join Worker w  on (w.Ibname =  d.Added_By)    ' +
        '   '
      '       left outer join(select'
      '                           PAY_DOC_ID'
      '                           , sum(PAY_SUM) as SUM_INTERED'
      
        '                           , sum(coalesce(Fine_Sum, 0)) as FINE_' +
        'SUM'
      '                         from PAYMENT'
      
        '                         group by PAY_DOC_ID) P on (P.PAY_DOC_ID' +
        ' = D.PAY_DOC_ID)'
      '  '
      'where   D.PAY_DOC_ID = :OLD_PAY_DOC_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    D.PAY_DOC_ID'
      '  , D.PAYSOURCE_ID'
      '  , D.PAY_DOC_NO'
      '  , D.PAY_DOC_DATE'
      '  , D.PAY_DOC_SUM'
      '  , D.NOTICE'
      '  , ps.paysource_descr'
      '  , ps.leak_prc'
      '  , p.c_SUM_leak'
      '  , round(ps.tax_prc * p.c_SUM_leak / 100, 2) as c_SUM_TAX'
      
        '  , ((p.SUM_INTERED + FINE_SUM) - round(((ps.tax_prc * p.c_SUM_l' +
        'eak / 100) + p.c_SUM_leak), 2)) as c_SUM_LEAK_TAX'
      '  , p.SUM_INTERED'
      
        '  , ( coalesce(p.SUM_INTERED,0) + coalesce(p.FINE_SUM, 0) ) SUM_' +
        'PAID  '
      '  , FINE_SUM'
      '  , CNT_PAYS'
      
        '  , (coalesce(D.PAY_DOC_SUM, 0) - coalesce(p.SUM_INTERED, 0) - c' +
        'oalesce(p.FINE_SUM, 0)) as SUM_DIFFERENCE'
      '  , (select'
      '         count(*)'
      '       from pay_errors pe'
      '       where pe.pay_doc_id = d.Pay_Doc_Id) pay_errors'
      '  , coalesce(w.Surname, d.Added_By) Added_By'
      '  , d.Added_On'
      '  from PAY_DOC D'
      
        '       left outer join PAYSOURCE PS on (D.PAYSOURCE_ID = PS.PAYS' +
        'OURCE_ID)'
      '       left outer join Worker w on (w.Ibname = d.Added_By)'
      '       left outer join(select'
      '                           p.PAY_DOC_ID'
      '                         , count(*) as CNT_PAYS'
      '                         , sum(p.PAY_SUM) as SUM_INTERED'
      
        '                         , sum(coalesce(p.Fine_Sum, 0)) as FINE_' +
        'SUM'
      
        '                         , sum(coalesce(p.Cmsn, ((p.Pay_Sum + p.' +
        'Fine_Sum) * ss.Leak_Prc)/ 100, 0)) as c_SUM_leak'
      '                         from PAYMENT p'
      
        '                           inner join PAY_DOC ds on (p.Pay_Doc_I' +
        'd = ds.Pay_Doc_Id)'
      
        '                           left outer join PAYSOURCE ss on (ds.P' +
        'AYSOURCE_ID = ss.PAYSOURCE_ID)'
      
        '                         group by PAY_DOC_ID) P on (P.PAY_DOC_ID' +
        ' = D.PAY_DOC_ID)'
      '  where D.Pay_Doc_Date between :StartDate and :EndDate @source'
      '  order by PAY_DOC_DATE, PAY_DOC_NO')
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
    Left = 46
    Top = 286
    poImportDefaultValues = False
    oRefreshAfterPost = False
    oRefreshDeletedRecord = True
  end
  object srcPayDocs: TDataSource
    AutoEdit = False
    DataSet = dsPayDocs
    Left = 88
    Top = 328
  end
  object frxDBPayDocs: TfrxDBDataset
    UserName = #1055#1051#1040#1058#1045#1046#1053#1067#1045'_'#1044#1054#1050#1059#1052#1045#1053#1058#1067
    OnCheckEOF = frxDBPayDocsCheckEOF
    OnFirst = frxDBPayDocsFirst
    OnNext = frxDBPayDocsNext
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
    DataSet = dsPayDocs
    BCDToCurrency = False
    DataSetOptions = []
    Left = 124
    Top = 399
  end
  object dsPaymentSource: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT PAYSOURCE_ID, PAYSOURCE_DESCR, LEAK_PRC, TAX_PRC'
      'FROM PAYSOURCE'
      'order by paysource_descr')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 244
    Top = 300
    oStartTransaction = False
    oFetchAll = True
  end
  object srcPaymentSource: TDataSource
    AutoEdit = False
    DataSet = dsPaymentSource
    Left = 384
    Top = 296
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
  end
  object MainMenu1: TMainMenu
    Left = 520
    Top = 184
    object N5: TMenuItem
      Caption = #1055#1083#1072#1090'. '#1076#1086#1082#1091#1084#1077#1085#1090#1099
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
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 312
    Top = 176
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
    Left = 384
    Top = 180
  end
end
