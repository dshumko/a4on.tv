object apgCustomerBalance: TapgCustomerBalance
  Left = 0
  Top = 0
  Caption = #1041#1072#1083#1072#1085#1089
  ClientHeight = 168
  ClientWidth = 761
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object dbgCustBalance: TDBGridEh
    Left = 0
    Top = 0
    Width = 761
    Height = 168
    Align = alClient
    AllowedOperations = []
    AutoFitColWidths = True
    DataGrouping.Color = clBtnFace
    DataGrouping.DefaultStateExpanded = True
    DataGrouping.Font.Charset = DEFAULT_CHARSET
    DataGrouping.Font.Color = clWindowText
    DataGrouping.Font.Height = -11
    DataGrouping.Font.Name = 'Tahoma'
    DataGrouping.Font.Style = [fsBold]
    DataGrouping.Footers = <
      item
        Color = clBtnFace
        ColumnItems = <
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end
          item
            ValueType = gfvSumEh
          end
          item
          end>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Visible = True
      end>
    DataGrouping.GroupLevels = <
      item
        ColumnName = 'Column_0_RYAER'
        SortOrder = soDescEh
      end
      item
        ColumnName = 'Column_1_RMONTH'
        SortOrder = soDescEh
      end>
    DataGrouping.GroupRowDefValues.FooterInGroupRow = True
    DataGrouping.ParentColor = False
    DataGrouping.ParentFont = False
    DataSource = srcBalance
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    IndicatorTitle.DropdownMenu = pmGrid
    IndicatorTitle.TitleButton = True
    IndicatorTitle.UseGlobalMenu = False
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    PopupMenu = pmGrid
    ReadOnly = True
    SearchPanel.Enabled = True
    SortLocal = True
    STFilter.Local = True
    STFilter.Visible = True
    SumList.Active = True
    TabOrder = 0
    TitleParams.VTitleMargin = 4
    OnCellMouseClick = dbgCustBalanceCellMouseClick
    Columns = <
      item
        Alignment = taCenter
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RYAER'
        Footers = <>
        HideDuplicates = True
        Title.Alignment = taCenter
        Title.Caption = #1043#1086#1076
        Visible = False
        Width = 10
      end
      item
        Alignment = taCenter
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RMONTH'
        Footers = <>
        HideDuplicates = True
        Title.Alignment = taCenter
        Title.Caption = #1052#1077#1089#1103#1094
        Visible = False
        Width = 5
      end
      item
        Alignment = taLeftJustify
        AutoFitColWidth = False
        CellButtons = <>
        DisplayFormat = 'mmmm'
        DynProps = <>
        EditButtons = <>
        FieldName = 'B_MONTH'
        Footers = <>
        HideDuplicates = True
        Title.Alignment = taCenter
        Title.Caption = #1044#1072#1090#1072
        Width = 59
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'B_DESCRIPTION'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Width = 158
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DEBT'
        Footers = <>
        Title.Alignment = taRightJustify
        Title.Caption = #1041#1072#1083#1072#1085#1089' '#1076#1086
        Width = 82
      end
      item
        Alignment = taRightJustify
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'B_SUM'
        Footers = <>
        Title.Alignment = taRightJustify
        Title.Caption = #1057#1091#1084#1084#1072
        Title.Hint = #1057#1091#1084#1084#1072' '#1089#1087#1080#1089#1072#1085#1080#1103' / '#1086#1087#1083#1072#1090#1099
        Width = 87
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DEBT_A'
        Footers = <>
        Title.Alignment = taRightJustify
        Title.Caption = #1041#1072#1083#1072#1085#1089' '#1087#1086#1089#1083#1077
        Width = 89
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object dsBalance: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    extract(YEAR FROM B_Month) RYAER'
      '  , extract(MONTH FROM B_Month) RMONTH'
      '  , B_Month'
      '  , B_Description'
      '  , B_Sum'
      '  , Sum_Type'
      '  , DEBT'
      '  , DEBT + B_Sum DEBT_A'
      '  from API_GET_CUSTOMER_BALANCE(:CUSTOMER_ID)'
      '  order by B_MONTH desc, Sum_Type  ')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 184
    Top = 59
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcBalance: TDataSource
    AutoEdit = False
    DataSet = mtBalance
    Left = 258
    Top = 42
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
    Left = 492
    Top = 42
  end
  object mtBalance: TMemTableEh
    AutoCalcFields = False
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 384
    Top = 80
  end
  object pmGrid: TPopupMenu
    Left = 560
    Top = 88
    object miN1: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = miN1Click
    end
    object miN2: TMenuItem
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = miN2Click
    end
  end
end
