inherited RatesForm: TRatesForm
  Left = 381
  Top = 171
  Caption = #1050#1091#1088#1089#1099' '#1074#1072#1083#1102#1090
  ClientHeight = 399
  ClientWidth = 652
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Width = 652
  end
  inherited dbGrid: TDBGridEh
    Width = 652
    Height = 315
    AllowedOperations = [alopUpdateEh, alopDeleteEh]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RDATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
        Title.TitleButton = True
        Width = 79
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUR'
        Footers = <>
        Title.Caption = #1042#1072#1083#1102#1090#1072
        Title.TitleButton = True
        Width = 69
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'USD'
        Footers = <>
        Title.TitleButton = True
        Width = 80
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EUR'
        Footers = <>
        Title.TitleButton = True
        Width = 80
      end>
  end
  inherited tlbMain: TToolBar
    Width = 652
    object ToolButton19: TToolButton [0]
      Left = 0
      Top = 0
      Visible = False
    end
    inherited ToolButton4: TToolButton
      Visible = False
    end
    inherited btnNew: TToolButton
      Visible = False
    end
    inherited btnEdit: TToolButton
      Visible = False
    end
    inherited ToolButton5: TToolButton
      Visible = False
    end
    inherited ToolButton6: TToolButton
      Visible = False
    end
    inherited btnDelete: TToolButton
      Visible = False
    end
    inherited ToolButton9: TToolButton
      Visible = False
    end
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
    end
    inherited ToolButton20: TToolButton
      Visible = False
    end
    object btnGet: TToolButton
      Left = 178
      Top = 0
      Hint = #1055#1086#1083#1091#1095#1080#1090#1100' '#1082#1091#1088#1089#1099' '#1085#1072#1094'. '#1073#1072#1085#1082#1072
      Caption = 'btnGet'
      ImageIndex = 17
      OnClick = btnGetClick
    end
  end
  inherited pnlEdit: TPanel
    Width = 652
    inherited btnSaveLink: TBitBtn
      Width = 466
    end
    inherited btnCancelLink: TBitBtn
      Left = 557
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsRates
    Left = 120
    Top = 208
  end
  inherited actions: TActionList
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
    end
    inherited actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    end
    inherited actQuickFilter: TAction
      Hint = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 203
    Top = 207
  end
  object dsRates: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_NAME = :O_NAME,'
      '    O_DESCRIPTION = :O_DESCRIPTION,'
      '    O_DELETED = 0'
      'WHERE'
      '    O_ID = :OLD_O_ID and O_TYPE = 11'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    RATES'
      'WHERE'
      '        RDATE = :OLD_RDATE'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS('
      '    O_ID,'
      '    O_NAME,'
      '    O_DESCRIPTION,'
      '    O_DELETED,'
      '    O_TYPE'
      ')'
      'VALUES('
      '    :O_ID,'
      '    :O_NAME,'
      '    :O_DESCRIPTION,'
      '    :O_DELETED,'
      '    11'
      ')')
    RefreshSQL.Strings = (
      'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED'
      'FROM OBJECTS'
      'WHERE(  O_TYPE = 11 AND O_DELETED = 0'
      '     ) and (     OBJECTS.O_ID = :OLD_O_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    Rdate, Cur, Usd, Eur'
      '  from Rates'
      '  order by Cur, Rdate desc')
    AutoUpdateOptions.UpdateTableName = 'OBJECTS'
    AutoUpdateOptions.KeyFields = 'O_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 72
    Top = 264
  end
  object qInsert: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      
        'update or insert into Rates (Rdate, Cur, Usd) values (:Rdate, :C' +
        'ur, :Usd) matching (Rdate, Cur)')
    Left = 352
    Top = 216
  end
end
