object Frame1: TFrame1
  Left = 0
  Top = 0
  Width = 305
  Height = 236
  TabOrder = 0
  object dbGrid: TDBGridEh
    Left = 0
    Top = 0
    Width = 305
    Height = 236
    Align = alClient
    AutoFitColWidths = False
    Flat = True
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'Tahoma'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch]
    SortLocal = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    UseMultiTitle = True
    Columns = <
      item
        EditButtons = <>
        FieldName = 'O_ID'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
        Width = 150
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'RM_QUANT'
        Footers = <>
        Title.Caption = #1050'-'#1074#1086
      end
      item
        AutoFitColWidth = False
        EditButtons = <>
        FieldName = 'O_DIMENSION'
        Footers = <>
        Title.Caption = #1045#1076'. '#1080#1079#1084'.'
        Width = 63
      end>
  end
  object dsReqMaterials: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT O.O_ID, o.O_NAME, RM_QUANT, o.O_DIMENSION'
      'FROM OBJECTS o LEFT JOIN '
      'REQUEST_MATERIALS m ON (o.O_ID = m.M_ID and m.RQ_ID = :RQ_ID)'
      '')
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
