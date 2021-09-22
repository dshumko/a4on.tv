object frmReqMaterials: TfrmReqMaterials
  Left = 0
  Top = 0
  Width = 451
  Height = 305
  Align = alClient
  ParentShowHint = False
  ShowHint = True
  TabOrder = 0
  object dbGrid: TDBGridEh
    Left = 0
    Top = 0
    Width = 451
    Height = 305
    Align = alClient
    AutoFitColWidths = False
    DataSource = srcDataSource
    DynProps = <>
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghColumnResize, dghColumnMove]
    SortLocal = True
    SumList.Active = True
    TabOrder = 0
    TitleParams.MultiTitle = True
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
        DisplayFormat = ',#.#####'
        DynProps = <>
        EditButtons = <>
        FieldName = 'RM_QUANT'
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
        Width = 35
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DisplayFormat = ',#0.###'
        DynProps = <>
        EditButtons = <>
        FieldName = 'COST'
        Footer.DisplayFormat = ',#.00'
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
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object dsReqMaterials: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    m.M_ID,'
      '    m.NAME,'
      '    m.DIMENSION,'
      '    rM.RM_QUANT,'
      '    rM.RM_NOTICE,'
      '    rM.RM_QUANT * rm.rm_cost as COST,'
      '    rm.RM_ID'
      '    from MATERIALS m'
      '        inner join REQUEST_MATERIALS rM on (M.M_ID = rM.M_ID)'
      '    where rM.RQ_ID = :RQ_ID'
      'order by 2  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 72
    Top = 80
  end
  object srcDataSource: TDataSource
    DataSet = dsReqMaterials
    Left = 72
    Top = 128
  end
end
