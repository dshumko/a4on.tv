inherited PaymentTypeForm: TPaymentTypeForm
  Left = 393
  Top = 353
  Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
  ClientHeight = 281
  ClientWidth = 562
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Width = 562
  end
  inherited dbGrid: TDBGridEh
    Width = 562
    Height = 197
    TitleParams.MultiTitle = False
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
        Title.Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
        Title.TitleButton = True
        Width = 127
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 562
    inherited tbOk: TToolButton
      OnClick = tbOkClick
    end
    inherited tbCancel: TToolButton
      OnClick = tbCancelClick
    end
  end
  inherited pnlEdit: TPanel
    Width = 562
    inherited btnSaveLink: TBitBtn
      Width = 376
    end
    inherited btnCancelLink: TBitBtn
      Left = 467
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsPaymentType
    OnStateChange = srcDataSourceStateChange
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
  object dsPaymentType: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'EXECUTE PROCEDURE PAYMENTTYPE_IUD(:O_ID, :O_NAME, :O_DESCRIPTION' +
        ', 1)')
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE DELETE_OBJECT(:OID)')
    InsertSQL.Strings = (
      
        'EXECUTE PROCEDURE PAYMENTTYPE_IUD(:O_ID, :O_NAME, :O_DESCRIPTION' +
        ', 0)')
    SelectSQL.Strings = (
      'SELECT o.O_ID, o.O_NAME, o.O_DESCRIPTION'
      'FROM V_PAYMENTTYPE o'
      'order BY O.O_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 144
    Top = 56
  end
end
