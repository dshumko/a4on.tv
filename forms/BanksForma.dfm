inherited BanksForm: TBanksForm
  Left = 381
  Top = 171
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1073#1072#1085#1082#1086#1074
  ClientHeight = 524
  ClientWidth = 952
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 185
    Width = 952
  end
  inherited dbGrid: TDBGridEh
    Top = 189
    Width = 952
    Height = 335
    AllowedOperations = [alopUpdateEh]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
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
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1041#1072#1085#1082
        Title.TitleButton = True
        Width = 196
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DIMENSION'
        Footers = <>
        Title.Caption = #1041#1048#1050
        Title.TitleButton = True
        Width = 124
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089
        Title.TitleButton = True
        Width = 206
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DELETED'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end>
  end
  inherited tlbMain: TToolBar
    Width = 952
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
    end
  end
  inherited pnlEdit: TPanel
    Width = 952
    Height = 160
    object lbl2: TLabel [0]
      Left = 5
      Top = 9
      Width = 24
      Height = 13
      Caption = #1041#1072#1085#1082
    end
    object lbl1: TLabel [1]
      Left = 5
      Top = 36
      Width = 20
      Height = 13
      Caption = #1041#1048#1050
    end
    object lbl6: TLabel [2]
      Left = 5
      Top = 63
      Width = 31
      Height = 13
      Caption = #1040#1076#1088#1077#1089
    end
    inherited btnSaveLink: TBitBtn
      Left = 59
      Top = 127
      Width = 780
      Height = 27
      TabOrder = 3
    end
    inherited btnCancelLink: TBitBtn
      Left = 857
      Top = 127
      Height = 27
      TabOrder = 4
    end
    object edtName: TDBEditEh
      Left = 59
      Top = 6
      Width = 884
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072' ('#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1082' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1102')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object edtBIK: TDBEditEh
      Left = 59
      Top = 33
      Width = 254
      Height = 21
      DataField = 'O_DIMENSION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1041#1048#1050'/SWIFT '#1073#1072#1085#1082#1072' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1082' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1102')'
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object mmoAddress: TDBMemoEh
      Left = 59
      Top = 60
      Width = 884
      Height = 59
      ScrollBars = ssVertical
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1040#1076#1088#1077#1089' '#1073#1072#1085#1082#1072
      ShowHint = True
      TabOrder = 2
      Visible = True
      WantReturns = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsBanks
    OnDataChange = srcDataSourceDataChange
    Left = 152
    Top = 304
  end
  inherited actions: TActionList
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actEditExecute
    end
    inherited actQuickFilter: TAction
      Hint = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
    end
  end
  object dsBanks: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_NAME = :O_NAME,'
      '    O_DESCRIPTION = :O_DESCRIPTION,'
      '    O_DIMENSION = :O_DIMENSION,'
      '    O_DELETED = 0 '
      'WHERE'
      '    O_ID = :OLD_O_ID and O_TYPE = 11'
      '    ')
    DeleteSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_NAME = :O_NAME,'
      '    O_DESCRIPTION = :O_DESCRIPTION,'
      '    O_DIMENSION = :O_DIMENSION,'
      '    O_DELETED = 1'
      'WHERE'
      '    O_ID = :OLD_O_ID and O_TYPE = 11'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS('
      '    O_ID,'
      '    O_NAME,'
      '    O_DESCRIPTION,'
      '    O_DIMENSION,'
      '    O_DELETED,'
      '    O_TYPE'
      ')'
      'VALUES('
      '    :O_ID,'
      '    :O_NAME,'
      '    :O_DESCRIPTION,'
      '    :O_DIMENSION,    '
      '    :O_DELETED,'
      '    11'
      ')')
    RefreshSQL.Strings = (
      'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION'
      'FROM OBJECTS'
      'WHERE O_TYPE = 11 '
      '      and OBJECTS.O_ID = :OLD_O_ID'
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_DIMENSION'
      '  , O_DELETED'
      '  from OBJECTS'
      '  where O_TYPE = 11'
      '        and O_DELETED = 0'
      '  order by O_NAME')
    AutoUpdateOptions.UpdateTableName = 'OBJECTS'
    AutoUpdateOptions.KeyFields = 'O_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 144
    Top = 56
  end
end
