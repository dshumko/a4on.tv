object frmReqWorks: TfrmReqWorks
  Left = 0
  Top = 0
  Width = 420
  Height = 234
  ParentShowHint = False
  ShowHint = True
  TabOrder = 0
  object dbGrid: TDBGridEh
    Left = 0
    Top = 0
    Width = 420
    Height = 234
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
        Title.Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
        Width = 111
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
        Width = 66
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DisplayFormat = ',#0.###'
        DynProps = <>
        EditButtons = <>
        FieldName = 'TOTAL'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1085'/'#1095
        Width = 32
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DisplayFormat = ',#0.###'
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_COST'
        Footer.DisplayFormat = ',#.00'
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
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object dsReqWorks: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT w.w_id, w.name, w.notice, m.w_time, m.w_cost,  m.w_quant,' +
        ' round(m.w_time * m.w_quant,2) total,'
      'coalesce(m.w_cost * m.w_quant, 0) T_COST'
      ''
      'FROM WORKS w'
      '  INNER JOIN request_works m ON (w.w_id = m.w_id)'
      '  inner join request rq on (m.rq_id = rq.rq_id)'
      '  --left outer join services s on (w.as_service = s.service_id)'
      'where'
      'm.rq_id = :RQ_ID'
      'order by w.name'
      '')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 35
    Top = 61
  end
  object srcDataSource: TDataSource
    DataSet = dsReqWorks
    Left = 126
    Top = 62
  end
end
