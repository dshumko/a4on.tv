inherited BlackListForm: TBlackListForm
  Left = 381
  Top = 171
  Caption = '"'#1063#1077#1088#1085#1099#1081'" '#1089#1087#1080#1089#1086#1082' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
  ClientHeight = 308
  ClientWidth = 585
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 173
    Width = 585
  end
  inherited dbGrid: TDBGridEh
    Top = 177
    Width = 585
    Height = 131
    AllowedOperations = [alopUpdateEh]
    FooterRowCount = 1
    FrozenCols = 1
    SumList.Active = True
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
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1051#1080#1095#1085#1099#1081' / '#1055#1072#1089#1087#1086#1088#1090
        Title.TitleButton = True
        Width = 136
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'IN_DOC_LIST'
        Footers = <>
        Title.Caption = #1042' '#1089#1087#1089#1080#1082#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1060#1048#1054
        Title.TitleButton = True
        Width = 112
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_CHARFIELD'
        Footers = <>
        Title.Caption = #1055#1088#1080#1095#1080#1085#1072
        Title.TitleButton = True
        Width = 315
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DELETED'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_ON'
        Footers = <>
        Title.Caption = #1050#1086#1075#1076#1072' '#1074#1085#1077#1089#1077#1085
        Title.TitleButton = True
        Width = 56
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_BY'
        Footers = <>
        Title.Caption = #1050#1077#1084' '#1074#1085#1077#1089#1077#1085
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 585
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
  end
  inherited pnlEdit: TPanel
    Width = 585
    Height = 148
    object lbl2: TLabel [0]
      Left = 5
      Top = 9
      Width = 85
      Height = 13
      Caption = #1051#1080#1095#1085#1099#1081'/'#1055#1072#1089#1087#1086#1088#1090
    end
    object lbl1: TLabel [1]
      Left = 5
      Top = 36
      Width = 23
      Height = 13
      Caption = #1060#1048#1054
    end
    object lbl3: TLabel [2]
      Left = 5
      Top = 63
      Width = 43
      Height = 13
      Caption = #1055#1088#1080#1095#1080#1085#1072
    end
    inherited btnSaveLink: TBitBtn
      Left = 104
      Top = 115
      Width = 368
      TabOrder = 3
    end
    inherited btnCancelLink: TBitBtn
      Left = 478
      Top = 115
      Width = 98
      Cancel = True
      TabOrder = 4
    end
    object edtName: TDBEditEh
      Left = 104
      Top = 6
      Width = 472
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1051#1080#1095#1085#1099#1081' '#1085#1086#1084#1077#1088'  '#1080#1083#1080' '#1085#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1072' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object edtO_DIMENSION: TDBEditEh
      Left = 104
      Top = 33
      Width = 472
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1060#1048#1054' '#1072#1073#1086#1085#1077#1090#1072' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086')'
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object mmoNotice: TDBMemoEh
      Left = 104
      Top = 60
      Width = 472
      Height = 49
      ScrollBars = ssVertical
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_CHARFIELD'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1095#1080#1085#1072' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
      ShowHint = True
      TabOrder = 2
      Visible = True
      WantReturns = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsBlackList
    OnDataChange = srcDataSourceDataChange
    Left = 296
    Top = 240
  end
  inherited actions: TActionList
    Left = 310
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
  inherited CnErrors: TCnErrorProvider
    Left = 232
    Top = 240
  end
  object dsBlackList: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_NAME = upper(:O_NAME),'
      '    O_DESCRIPTION = :O_DESCRIPTION,'
      '    O_CHARFIELD = :O_CHARFIELD'
      'WHERE'
      '    O_ID = :OLD_O_ID and O_TYPE = 31'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    OBJECTS'
      'WHERE'
      '        O_ID = :OLD_O_ID  and O_TYPE = 31'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS('
      '    O_ID,'
      '    O_NAME,'
      '    O_DESCRIPTION,'
      '    O_CHARFIELD,'
      '    O_TYPE'
      ')'
      'VALUES('
      '    :O_ID,'
      '    upper(:O_NAME),'
      '    :O_DESCRIPTION,'
      '    :O_CHARFIELD,'
      '    31'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_CHARFIELD'
      '  , Added_By'
      '  , Added_On'
      '  , (@@fld_doc_list%null@) in_DOC_LIST  '
      '  from OBJECTS'
      'WHERE O_TYPE = 31'
      'and ( OBJECTS.O_ID = :OLD_O_ID )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_CHARFIELD'
      '  , Added_By'
      '  , Added_On'
      '  , (@@fld_doc_list%null@) in_DOC_LIST'
      '  from OBJECTS'
      '  where O_TYPE = 31'
      '  order by O_NAME  ')
    AutoUpdateOptions.UpdateTableName = 'OBJECTS'
    AutoUpdateOptions.KeyFields = 'O_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 152
    Top = 240
  end
end
