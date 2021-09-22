inherited NFileTypeForm: TNFileTypeForm
  Left = 381
  Top = 171
  Caption = #1058#1080#1087#1099' '#1092#1072#1081#1083#1086#1074' '#1076#1083#1103' '#1091#1079#1083#1086#1074
  ClientHeight = 394
  ClientWidth = 585
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 153
    Width = 585
  end
  inherited dbGrid: TDBGridEh
    Top = 156
    Width = 585
    Height = 238
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
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 167
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 310
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
    Height = 128
    ParentCtl3D = False
    object lbl2: TLabel [0]
      Left = 5
      Top = 15
      Width = 18
      Height = 13
      Caption = #1058#1080#1087
    end
    object lbl3: TLabel [1]
      Left = 5
      Top = 42
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    inherited btnSaveLink: TBitBtn
      Left = 72
      Top = 95
      Width = 400
      TabOrder = 2
    end
    inherited btnCancelLink: TBitBtn
      Left = 478
      Top = 95
      Width = 98
      Cancel = True
      TabOrder = 3
    end
    object edtName: TDBEditEh
      Left = 72
      Top = 12
      Width = 504
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1058#1080#1087' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dbmmoO_DESCRIPTION: TDBMemoEh
      Left = 72
      Top = 39
      Width = 504
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1080#1087#1072
      ShowHint = True
      TabOrder = 1
      Visible = True
      WantReturns = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsFileType
    OnDataChange = srcDataSourceDataChange
    Left = 256
    Top = 288
  end
  inherited actions: TActionList
    Left = 150
    Top = 288
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actEditExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 443
    Top = 287
  end
  inherited CnErrors: TCnErrorProvider
    Left = 344
    Top = 288
  end
  object dsFileType: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Objects_Iud(1, 40, :O_ID, :O_Name, :O_Descript' +
        'ion)')
    DeleteSQL.Strings = (
      'execute procedure Objects_Iud(2, 40, :OLD_O_ID)')
    InsertSQL.Strings = (
      
        'execute procedure Objects_Iud(0, 40, :O_ID, :O_Name, :O_Descript' +
        'ion)')
    RefreshSQL.Strings = (
      'select'
      '    o.O_ID, o.O_NAME, o.O_DESCRIPTION'
      '  from OBJECTS o'
      '  where  O_TYPE = 40'
      '     and O_DELETED = 0'
      '     and O.O_ID = :OLD_O_ID'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    o.O_ID, o.O_NAME, o.O_DESCRIPTION'
      '  from OBJECTS o'
      '  where O_TYPE = 40'
      '        and O_DELETED = 0'
      '  order by O_NAME  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 48
    Top = 296
  end
end
