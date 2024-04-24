inherited NewsForm: TNewsForm
  Left = 381
  Top = 171
  Caption = #1053#1086#1074#1086#1089#1090#1080' '#1076#1083#1103' '#1083#1080#1095#1085#1086#1075#1086' '#1082#1072#1073#1080#1085#1077#1090#1072
  ClientHeight = 435
  ClientWidth = 926
  ExplicitWidth = 942
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 193
    Width = 926
    Height = 4
    ExplicitTop = 193
    ExplicitWidth = 926
    ExplicitHeight = 4
  end
  inherited dbGrid: TDBGridEh
    Top = 197
    Width = 926
    Height = 238
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
        Title.Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
        Width = 196
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = 'URL'
        Width = 131
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_CHARFIELD'
        Footers = <>
        Title.Caption = #1058#1077#1082#1089#1090
        Width = 206
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DATEFIELD'
        Footers = <>
        Title.Caption = #1055#1091#1073#1083#1080#1082#1086#1074#1072#1089#1090#1100'|'#1089
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DATEEND'
        Footers = <>
        Title.Caption = #1055#1091#1073#1083#1080#1082#1086#1074#1072#1089#1090#1100'|'#1076#1086
      end>
  end
  inherited tlbMain: TToolBar
    Width = 926
    ExplicitWidth = 926
    inherited ToolButton5: TToolButton [2]
      Left = 28
      ExplicitLeft = 28
    end
    inherited btnEdit: TToolButton [3]
      Left = 32
      ExplicitLeft = 32
    end
    inherited ToolButton9: TToolButton
      Visible = False
    end
    inherited tbOk: TToolButton
      Visible = False
      OnClick = tbOkClick
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
      OnClick = tbCancelClick
    end
  end
  inherited pnlEdit: TPanel
    Width = 926
    Height = 168
    ExplicitWidth = 926
    ExplicitHeight = 168
    object Label1: TLabel [0]
      Left = 5
      Top = 7
      Width = 53
      Height = 13
      Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
    end
    object Label2: TLabel [1]
      Left = 5
      Top = 56
      Width = 29
      Height = 13
      Caption = #1058#1077#1082#1089#1090
    end
    object lbl1: TLabel [2]
      Left = 5
      Top = 32
      Width = 19
      Height = 13
      Caption = 'URL'
    end
    object lbl2: TLabel [3]
      Left = 5
      Top = 118
      Width = 65
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    end
    object lbl3: TLabel [4]
      Left = 248
      Top = 118
      Width = 83
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
    end
    inherited btnSaveLink: TBitBtn
      Left = 90
      Top = 139
      Width = 723
      TabOrder = 5
      ExplicitLeft = 90
      ExplicitTop = 139
      ExplicitWidth = 723
    end
    inherited btnCancelLink: TBitBtn
      Left = 831
      Top = 139
      Cancel = True
      TabOrder = 6
      ExplicitLeft = 831
      ExplicitTop = 139
    end
    object dbeName: TDBEditEh
      Left = 90
      Top = 4
      Width = 827
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1047#1072#1075#1086#1083#1086#1074#1086#1082' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnEnter = dbeNameEnter
    end
    object mmoText: TDBMemoEh
      Left = 90
      Top = 53
      Width = 827
      Height = 58
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_CHARFIELD'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1058#1077#1082#1089#1090' '#1085#1086#1074#1086#1089#1090#1080' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 2
      Visible = True
      WantReturns = True
    end
    object edtURL: TDBEditEh
      Left = 90
      Top = 29
      Width = 827
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1042#1077#1073' '#1089#1089#1099#1083#1082#1072' '#1085#1072' '#1085#1086#1074#1086#1089#1090#1100
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnEnter = dbeNameEnter
    end
    object edStart: TDBDateTimeEditEh
      Left = 90
      Top = 115
      Width = 143
      Height = 21
      Anchors = [akLeft, akBottom]
      DataField = 'O_DATEFIELD'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1091#1073#1083#1080#1082#1086#1074#1072#1090#1100' '#1089' '#1076#1072#1090#1099
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object edEND: TDBDateTimeEditEh
      Left = 351
      Top = 115
      Width = 151
      Height = 21
      Anchors = [akLeft, akBottom]
      DataField = 'O_DATEEND'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1091#1073#1083#1080#1082#1086#1074#1072#1090#1100' '#1076#1086' '#1076#1072#1090#1099
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsNews
    OnStateChange = srcDataSourceStateChange
    OnDataChange = srcDataSourceDataChange
    Left = 64
    Top = 296
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
  inherited CnErrors: TCnErrorProvider
    Left = 16
    Top = 208
  end
  object dsNews: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '  O_ID           =:O_ID,'
      '  O_NAME         =:O_NAME,'
      '  O_CHARFIELD    =:O_CHARFIELD,'
      '  O_DESCRIPTION  =:O_DESCRIPTION,'
      '  O_DATEFIELD    =:O_DATEFIELD,'
      '  O_DATEEND      =:O_DATEEND,'
      '  O_DELETED      =:O_DELETED'
      'WHERE'
      '    O_ID = :OLD_O_ID and O_TYPE = 34'
      '')
    DeleteSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_DELETED = 1'
      'WHERE'
      '    O_ID = :OLD_O_ID '
      '    and O_TYPE = 34'
      '    '
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS('
      '    O_ID'
      '  , O_NAME'
      '  , O_CHARFIELD'
      '  , O_DESCRIPTION'
      '  , O_DATEFIELD'
      '  , O_DATEEND'
      '  , O_DELETED'
      '  , O_TYPE'
      ')'
      'VALUES('
      '    :O_ID'
      '  , :O_NAME'
      '  , :O_CHARFIELD'
      '  , :O_DESCRIPTION'
      '  , :O_DATEFIELD'
      '  , :O_DATEEND'
      '  , 0'
      '  , 34'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME -- N_TITLE'
      '  , O_CHARFIELD -- N_TEXT'
      '  , O_DESCRIPTION -- N_URL'
      '  , O_DATEFIELD -- N_SART'
      '  , O_DATEEND  -- N_END'
      '  , O_DELETED'
      '  from OBJECTS'
      '  where O_TYPE = 34 '
      '    and O_ID = :OLD_O_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME -- N_TITLE'
      '  , O_CHARFIELD -- N_TEXT'
      '  , O_DESCRIPTION -- N_URL'
      '  , O_DATEFIELD -- N_SART'
      '  , O_DATEEND  -- N_END'
      '  , O_DELETED'
      '  from OBJECTS'
      '  where O_TYPE = 34'
      '')
    AutoUpdateOptions.UpdateTableName = 'OBJECTS'
    AutoUpdateOptions.KeyFields = 'O_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 192
    Top = 208
  end
end
