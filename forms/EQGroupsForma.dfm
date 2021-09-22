inherited EQGroupsForm: TEQGroupsForm
  Left = 381
  Top = 171
  Caption = #1043#1088#1091#1087#1087#1099' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
  ClientHeight = 311
  ClientWidth = 614
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 169
    Width = 614
  end
  inherited dbGrid: TDBGridEh
    Top = 172
    Width = 614
    Height = 139
    AllowedOperations = [alopUpdateEh]
    OnGetCellParams = dbGridGetCellParams
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
        AutoDropDown = True
        AutoFitColWidth = False
        CellButtons = <>
        DblClickNextVal = True
        DropDownSpecRow.Value = 5
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_TYPE'
        Footers = <>
        KeyList.Strings = (
          '5'
          '6')
        PickList.Strings = (
          #1057#1077#1090#1077#1074#1086#1077
          #1050#1072#1073#1077#1083#1100#1085#1086#1077)
        Title.Caption = #1058#1080#1087' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
        Visible = False
        Width = 91
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DblClickNextVal = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1043#1088#1091#1087#1087#1072' ('#1084#1072#1088#1082#1072')'
        Title.TitleButton = True
        Width = 109
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DIMENSION'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Visible = False
        Width = 41
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 213
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
    Width = 614
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
      OnClick = tbCancelClick
    end
    inherited ToolButton20: TToolButton
      Visible = False
    end
  end
  inherited pnlEdit: TPanel
    Width = 614
    Height = 144
    object lbl1: TLabel [0]
      Left = 5
      Top = 9
      Width = 36
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072
    end
    object lbl3: TLabel [1]
      Left = 5
      Top = 59
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    inherited btnSaveLink: TBitBtn
      Top = 111
      Width = 428
      TabOrder = 4
    end
    inherited btnCancelLink: TBitBtn
      Left = 519
      Top = 111
      TabOrder = 5
    end
    object edtName: TDBEditEh
      Left = 73
      Top = 6
      Width = 532
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1043#1088#1091#1087#1087#1072' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dbmmoO_DESCRIPTION: TDBMemoEh
      Left = 73
      Top = 56
      Width = 532
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099
      ShowHint = True
      TabOrder = 3
      Visible = True
      WantReturns = True
    end
    object btnColorClear: TButton
      Left = 519
      Top = 29
      Width = 86
      Height = 25
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1086#1085' '#1076#1083#1103' '#1074#1099#1076#1077#1083#1077#1085#1080#1103' '#1072#1073#1086#1085#1077#1085#1090#1072
      Anchors = [akTop, akRight]
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1086#1085
      TabOrder = 2
      TabStop = False
      OnClick = btnColorClearClick
    end
    object btnColorSet: TButtonColor
      Left = 73
      Top = 29
      Width = 428
      Anchors = [akLeft, akTop, akRight]
      Caption = #1062#1074#1077#1090' '#1075#1088#1091#1087#1087#1099
      TabOrder = 1
      OnClick = btnColorSetClick
    end
  end
  object dsEQGroups: TpFIBDataSet [4]
    UpdateSQL.Strings = (
      
        'execute procedure Attributes_Iud(:O_Id, :O_Name, :O_Description,' +
        ' :COLOR, :O_Deleted, null, null, 1, 7)')
    DeleteSQL.Strings = (
      
        'execute procedure Attributes_Iud(:O_Id, :O_Name, :O_Description,' +
        ' :COLOR, :O_Deleted, null, null, 2, 7)')
    InsertSQL.Strings = (
      
        'execute procedure Attributes_Iud(:O_Id, :O_Name, :O_Description,' +
        ' :COLOR, :O_Deleted, null, null, 0, 7)')
    RefreshSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_DELETED'
      '  , O_DIMENSION as COLOR'
      '  , O_TYPE'
      '  from OBJECTS'
      '  where OBJECTS.O_ID = :OLD_O_ID'
      '    and OBJECTS.O_TYPE = :OLD_O_TYPE'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_DELETED'
      '  , O_DIMENSION as COLOR'
      '  , O_TYPE'
      '  from OBJECTS'
      '  where O_TYPE = 7'
      '        and O_DELETED = 0'
      '  order by O_NAME ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 136
    Top = 112
  end
  inherited srcDataSource: TDataSource
    DataSet = dsEQGroups
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
  inherited pmPopUp: TPopupMenu
    inherited pmgCopy: TMenuItem
      OnClick = nil
    end
    inherited pmgSelectAll: TMenuItem
      OnClick = nil
    end
    inherited pmgSaveSelection: TMenuItem
      OnClick = nil
    end
  end
  inherited CnErrors: TCnErrorProvider
    Left = 32
    Top = 112
  end
end
