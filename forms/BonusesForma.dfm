inherited BonusesForm: TBonusesForm
  Left = 381
  Top = 171
  Caption = #1041#1086#1085#1091#1089#1099
  ClientHeight = 418
  ClientWidth = 765
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 201
    Width = 765
  end
  inherited dbGrid: TDBGridEh
    Top = 205
    Width = 765
    AllowedOperations = [alopUpdateEh]
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'BT_ID'
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
        Title.Caption = #1058#1080#1087' '#1073#1086#1085#1091#1089#1072
        Title.TitleButton = True
        Width = 107
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DATE_FROM'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072'|c'
        Title.TitleButton = True
        Width = 80
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DATE_TO'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072'|'#1087#1086
        Title.TitleButton = True
        Width = 80
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'UNITS_FROM'
        Footers = <>
        Title.Caption = #1045#1076#1080#1085#1080#1094'|c'
        Title.TitleButton = True
        Width = 80
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'UNITS_TO'
        Footers = <>
        Title.Caption = #1045#1076#1080#1085#1080#1094'|'#1087#1086
        Title.TitleButton = True
        Width = 80
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RATE'
        Footers = <>
        Title.Caption = #1055#1088#1086#1094#1077#1085#1090' / '#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Title.TitleButton = True
        Width = 80
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 193
      end>
  end
  inherited tlbMain: TToolBar
    Width = 765
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
    Width = 765
    Height = 176
    object lbl2: TLabel [0]
      Left = 5
      Top = 9
      Width = 56
      Height = 13
      Caption = #1058#1080#1087' '#1073#1086#1085#1091#1089#1072
    end
    object lbl1: TLabel [1]
      Left = 5
      Top = 41
      Width = 85
      Height = 13
      Caption = #1044#1072#1090#1072' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1089
    end
    object lbl3: TLabel [2]
      Left = 5
      Top = 95
      Width = 61
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object lbl4: TLabel [3]
      Left = 234
      Top = 41
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object lbl5: TLabel [4]
      Left = 5
      Top = 68
      Width = 52
      Height = 13
      Caption = #1045#1076#1080#1085#1080#1094' '#1086#1090
    end
    object lbl6: TLabel [5]
      Left = 234
      Top = 68
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object lbl7: TLabel [6]
      Left = 397
      Top = 68
      Width = 143
      Height = 13
      Caption = #1055#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1077#1076#1080#1085#1080#1094' / '#1050#1086#1083'-'#1074#1086
    end
    inherited btnSaveLink: TBitBtn
      Left = 97
      Top = 143
      Width = 555
      TabOrder = 7
    end
    inherited btnCancelLink: TBitBtn
      Left = 658
      Top = 143
      Width = 98
      Cancel = True
      TabOrder = 8
    end
    object deFrom: TDBDateTimeEditEh
      Left = 97
      Top = 38
      Width = 120
      Height = 21
      DataField = 'DATE_FROM'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1095#1072#1083#1086
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object deTO: TDBDateTimeEditEh
      Left = 265
      Top = 38
      Width = 120
      Height = 21
      DataField = 'DATE_TO'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1082#1086#1085#1095#1072#1085#1080#1077
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object edtFrom: TDBNumberEditEh
      Left = 97
      Top = 65
      Width = 120
      Height = 21
      Hint = #1045#1076#1080#1085#1080#1094' '#1086#1090' ('#1089#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072' '#1076#1086#1083#1078#1085#1072' '#1073#1099#1090#1100' '#1073#1086#1083#1077#1077' '#1080#1083#1080' '#1088#1072#1074#1085#1072')'
      DataField = 'UNITS_FROM'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = #1045#1076#1080#1085#1080#1094' '#1086#1090
      EditButton.Visible = True
      EditButtons = <>
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object edtTO: TDBNumberEditEh
      Left = 265
      Top = 65
      Width = 120
      Height = 21
      Hint = #1045#1076#1080#1085#1080#1094' '#1076#1086' ('#1089#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072' '#1076#1086#1083#1078#1085#1072' '#1073#1099#1090#1100' '#1084#1077#1085#1077#1077')'
      DataField = 'UNITS_TO'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = #1045#1076#1080#1085#1080#1094' '#1076#1086
      EditButton.Visible = True
      EditButtons = <>
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
    object edtRate: TDBNumberEditEh
      Left = 546
      Top = 65
      Width = 127
      Height = 21
      Hint = #1055#1088#1086#1094#1077#1085#1090' '#1086#1090' '#1077#1076#1080#1085#1080#1094' ('#1087#1083#1072#1090#1077#1078#1072', '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081')'
      DataField = 'RATE'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = #1055#1088#1086#1094#1077#1085#1090' '#1080#1083#1080' '#1082#1086#1083'-'#1074#1086' '
      EditButton.Visible = True
      EditButtons = <>
      ShowHint = True
      TabOrder = 5
      Visible = True
    end
    object edtName: TDBLookupComboboxEh
      Left = 97
      Top = 6
      Width = 659
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'BT_ID'
      DataSource = srcDataSource
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcBT
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object mmoNOTICE: TDBMemoEh
      Left = 97
      Top = 92
      Width = 659
      Height = 45
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 6
      Visible = True
      WantReturns = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsBonuses
    OnDataChange = srcDataSourceDataChange
    Left = 312
    Top = 320
  end
  inherited actions: TActionList
    Left = 38
    Top = 296
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
  inherited pmPopUp: TPopupMenu
    Left = 371
    Top = 295
  end
  inherited CnErrors: TCnErrorProvider
    Left = 152
    Top = 296
  end
  object dsBonuses: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Bonus_Rate_Upd(:OLD_ID, :BT_ID, :Date_From, :D' +
        'ate_To, :Units_From, :Units_To, :Rate, :Notice)'
      '   ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    BONUS_RATE'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    InsertSQL.Strings = (
      
        'execute procedure Bonus_Rate_Ins(:id, :Bt_Id, :Date_From, :Date_' +
        'To, :Units_From, :Units_To, :Rate, :Notice)')
    RefreshSQL.Strings = (
      'Select r.*, o.O_Name'
      'from Bonus_Rate r'
      'inner join objects o on (r.Bt_Id = o.O_Id and o.O_Type = 30)'
      ''
      ' WHERE '
      '        R.ID = :OLD_ID'
      '    ')
    SelectSQL.Strings = (
      'Select r.*, o.O_Name'
      'from Bonus_Rate r'
      'inner join objects o on (r.Bt_Id = o.O_Id and o.O_Type = 30)'
      'order by o.O_Name, r.Date_From, r.Units_From')
    AutoUpdateOptions.UpdateTableName = 'BONUS_RATE'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 216
    Top = 296
  end
  object dsBT: TpFIBDataSet
    SelectSQL.Strings = (
      
        'Select o.O_Id, o.O_Name||coalesce('#39' '#39'||o.O_Description, '#39#39') O_Na' +
        'me'
      'from objects o where o.O_Type = 30'
      'order by o.O_Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 112
    Top = 312
  end
  object srcBT: TDataSource
    AutoEdit = False
    DataSet = dsBT
    Left = 72
    Top = 344
  end
end
