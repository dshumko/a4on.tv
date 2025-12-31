inherited ShippersForm: TShippersForm
  Left = 381
  Top = 171
  Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074' '#1080' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
  ClientHeight = 487
  ClientWidth = 627
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 265
    Width = 627
  end
  inherited dbGrid: TDBGridEh
    Top = 269
    Width = 627
    Height = 218
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
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1085#1080#1077
        Title.TitleButton = True
        Width = 236
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DIMENSION'
        Footers = <>
        Title.Caption = #1059#1053#1055
        Title.TitleButton = True
        Width = 87
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_CHARFIELD'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089
        Title.TitleButton = True
        Width = 204
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 143
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
    Width = 627
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
    Width = 627
    Height = 240
    object lbl2: TLabel [0]
      Left = 5
      Top = 9
      Width = 67
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1085#1080#1077
    end
    object lbl3: TLabel [1]
      Left = 449
      Top = 60
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object lbl1: TLabel [2]
      Left = 5
      Top = 60
      Width = 64
      Height = 13
      Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099
    end
    object lbl4: TLabel [3]
      Left = 5
      Top = 35
      Width = 21
      Height = 13
      Caption = #1059#1053#1055
    end
    inherited btnSaveLink: TBitBtn
      Left = 72
      Top = 207
      Width = 442
      TabOrder = 4
    end
    inherited btnCancelLink: TBitBtn
      Left = 520
      Top = 207
      Width = 98
      Cancel = True
      TabOrder = 5
    end
    object edtName: TDBEditEh
      Left = 72
      Top = 6
      Width = 546
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object mmoAdres: TDBMemoEh
      Left = 72
      Top = 57
      Width = 371
      Height = 144
      ScrollBars = ssBoth
      Anchors = [akLeft, akTop, akBottom]
      AutoSize = False
      DataField = 'O_CHARFIELD'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1040#1076#1088#1077#1089' '#1080' '#1090#1077#1083#1077#1092#1086#1085#1099
      ShowHint = True
      TabOrder = 2
      Visible = True
      WantReturns = True
    end
    object mmoNotice: TDBMemoEh
      Left = 504
      Top = 57
      Width = 114
      Height = 144
      ScrollBars = ssBoth
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ShowHint = True
      TabOrder = 3
      Visible = True
      WantReturns = True
    end
    object edtO_NAME: TDBEditEh
      Left = 72
      Top = 32
      Width = 546
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_DIMENSION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1059#1053#1055' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsShippers
    OnDataChange = srcDataSourceDataChange
    Left = 240
    Top = 88
  end
  inherited actions: TActionList
    Left = 102
    Top = 160
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
    Left = 147
    Top = 95
  end
  inherited CnErrors: TCnErrorProvider
    Left = 216
    Top = 72
  end
  object dsShippers: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Objects_Iud(1, 29, :O_Id, :O_Name, :O_Descript' +
        'ion, :O_DIMENSION, :O_Deleted, :O_Charfield, null, null)')
    DeleteSQL.Strings = (
      'execute procedure Objects_Iud(2, 29, :OLD_O_ID)'
      '    ')
    InsertSQL.Strings = (
      
        'execute procedure Objects_Iud(0, 29, :O_Id, :O_Name, :O_Descript' +
        'ion, :O_DIMENSION, :O_Deleted, :O_Charfield, null, null)')
    RefreshSQL.Strings = (
      
        'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED, O_CHARFIELD, O_DI' +
        'MENSION'
      'FROM OBJECTS'
      'WHERE(  O_TYPE = 29 AND O_DELETED = 0'
      '     ) and (     OBJECTS.O_ID = :OLD_O_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      
        'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED, O_CHARFIELD, O_DI' +
        'MENSION'
      'FROM OBJECTS'
      'WHERE O_TYPE = 29 AND O_DELETED = 0'
      'order BY O_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 192
    Top = 128
  end
end
