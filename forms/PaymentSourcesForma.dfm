inherited PaymentSourcesForm: TPaymentSourcesForm
  Caption = #1048#1089#1090#1086#1095#1085#1080#1082#1080' '#1087#1083#1072#1090#1077#1078#1077#1081
  ClientHeight = 393
  ClientWidth = 655
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 129
    Width = 655
  end
  inherited dbGrid: TDBGridEh
    Top = 133
    Width = 655
    Height = 260
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PAYSOURCE_DESCR'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 300
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'LEAK_PRC'
        Footers = <>
        Title.Caption = '%  '#1079#1072' '#1091#1089#1083
        Title.Hint = '% '#1086#1090#1076#1072#1074#1072#1077#1084#1099#1081' '#1079#1072' '#1091#1089#1083#1091#1075#1080
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'TAX_PRC'
        Footers = <>
        Title.Caption = #1053#1044#1057
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CODE'
        Footers = <>
        Title.Caption = #1050#1086#1076' '#1074' '#1087#1083#1072#1090'. '#1089#1080#1089#1090#1077#1084#1072#1093
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 655
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
  end
  inherited pnlEdit: TPanel
    Width = 655
    Height = 104
    object lbl2: TLabel [0]
      Left = 5
      Top = 9
      Width = 48
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object lbl3: TLabel [1]
      Left = 5
      Top = 36
      Width = 62
      Height = 13
      Caption = '% '#1079#1072' '#1091#1089#1083#1091#1075#1080
    end
    object Label1: TLabel [2]
      Left = 214
      Top = 36
      Width = 22
      Height = 13
      Caption = #1053#1044#1057
    end
    object Label2: TLabel [3]
      Left = 405
      Top = 36
      Width = 20
      Height = 13
      Caption = #1050#1086#1076
    end
    inherited btnSaveLink: TBitBtn
      Left = 192
      Top = 71
      Width = 350
      TabOrder = 4
    end
    inherited btnCancelLink: TBitBtn
      Left = 560
      Top = 71
      TabOrder = 5
    end
    object edtName: TDBEditEh
      Left = 73
      Top = 6
      Width = 573
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PAYSOURCE_DESCR'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object edtLEAK_PRC: TDBNumberEditEh
      Left = 72
      Top = 33
      Width = 121
      Height = 21
      DataField = 'LEAK_PRC'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = '% '#1079#1072' '#1091#1089#1083#1091#1075#1080
      EditButton.Visible = True
      EditButtons = <>
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object edtTAX_PRC: TDBNumberEditEh
      Left = 256
      Top = 33
      Width = 121
      Height = 21
      DataField = 'TAX_PRC'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = #1053#1044#1057
      EditButton.Visible = True
      EditButtons = <>
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object edtCODE: TDBEditEh
      Left = 449
      Top = 33
      Width = 197
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CODE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1050#1086#1076
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsPaymentSource
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
  inherited CnErrors: TCnErrorProvider
    Top = 280
  end
  object dsPaymentSource: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PAYSOURCE'
      'SET '
      '    PAYSOURCE_ID = :PAYSOURCE_ID,'
      '    PAYSOURCE_DESCR = :PAYSOURCE_DESCR,'
      '    LEAK_PRC = :LEAK_PRC,'
      '    TAX_PRC = :TAX_PRC,'
      '    CODE = :CODE'
      'WHERE'
      '    PAYSOURCE_ID = :OLD_PAYSOURCE_ID'
      '    ')
    DeleteSQL.Strings = (
      'update PAYSOURCE'
      'set DELETED = 1'
      'where PAYSOURCE_ID = :OLD_PAYSOURCE_ID')
    InsertSQL.Strings = (
      'INSERT INTO PAYSOURCE('
      '    PAYSOURCE_ID,'
      '    PAYSOURCE_DESCR,'
      '    LEAK_PRC,'
      '    TAX_PRC,'
      '    CODE'
      ')'
      'VALUES('
      '    :PAYSOURCE_ID,'
      '    :PAYSOURCE_DESCR,'
      '    :LEAK_PRC,'
      '    :TAX_PRC,'
      '    :CODE'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    *'
      '  from PAYSOURCE'
      '  where PAYSOURCE.PAYSOURCE_ID = :OLD_PAYSOURCE_ID'
      '        and coalesce(DELETED, 0) = 0   '
      '    ')
    SelectSQL.Strings = (
      'select'
      '    *'
      '  from PAYSOURCE'
      '  where coalesce(DELETED, 0) = 0'
      '  order by paysource_descr')
    AutoUpdateOptions.UpdateTableName = 'PAYSOURCE'
    AutoUpdateOptions.KeyFields = 'PAYSOURCE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    OnNewRecord = dsPaymentSourceNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 152
    Top = 208
  end
end
