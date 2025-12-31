inherited HETypesForm: THETypesForm
  Left = 381
  Top = 171
  Caption = #1058#1080#1087#1099' '#1043#1057' ('#1059#1079#1083#1086#1074')'
  ClientHeight = 320
  ClientWidth = 576
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Width = 576
  end
  inherited dbGrid: TDBGridEh
    Width = 576
    Height = 235
    AllowedOperations = [alopUpdateEh]
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_ID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_TYPE'
        Footers = <>
        Visible = False
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DIMENSION'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Title.TitleButton = True
        Visible = False
        Width = 41
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DELETED'
        Footers = <>
        Visible = False
      end>
  end
  inherited tlbMain: TToolBar
    Width = 576
    inherited tbOk: TToolButton
      OnClick = tbOkClick
    end
    inherited tbCancel: TToolButton
      OnClick = tbCancelClick
    end
  end
  inherited pnlEdit: TPanel
    Width = 576
    inherited btnSaveLink: TBitBtn
      Width = 390
    end
    inherited btnCancelLink: TBitBtn
      Left = 481
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsHETypes
    OnDataChange = srcDataSourceDataChange
  end
  inherited actions: TActionList
    inherited actNew: TAction
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
  object dsHETypes: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_NAME = :O_NAME,'
      '    O_DESCRIPTION = :O_DESCRIPTION,'
      '    O_DELETED = :O_DELETED,'
      '    O_DIMENSION = :O_DIMENSION'
      'WHERE'
      '    O_ID = :OLD_O_ID  and O_TYPE = 9'
      '    ')
    DeleteSQL.Strings = (
      'update'
      '    OBJECTS'
      'set O_DELETED = 1'
      'WHERE'
      '        O_ID = :OLD_O_ID and O_TYPE = 9'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS('
      '    O_ID,'
      '    O_NAME,'
      '    O_DESCRIPTION,'
      '    O_DELETED,'
      '    O_DIMENSION,'
      '    O_TYPE'
      ')'
      'VALUES('
      '    :O_ID,'
      '    :O_NAME,'
      '    :O_DESCRIPTION,'
      '    :O_DELETED,'
      '    :O_DIMENSION,'
      '    9'
      ')')
    RefreshSQL.Strings = (
      'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION'
      'FROM OBJECTS'
      'WHERE(  O_TYPE = 9 AND O_DELETED = 0'
      '     ) and (     OBJECTS.O_ID = :OLD_O_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION'
      'FROM OBJECTS'
      'WHERE O_TYPE = 9 AND O_DELETED = 0'
      'order BY O_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 144
    Top = 56
  end
end
