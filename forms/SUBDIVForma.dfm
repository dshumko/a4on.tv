inherited SubDivForm: TSubDivForm
  Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
  ClientHeight = 301
  ClientWidth = 581
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Width = 581
  end
  inherited dbGrid: TDBGridEh
    Width = 581
    Height = 216
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
        Title.TitleButton = True
        Width = 155
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 120
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ID_PARENT'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADRES'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089
        Title.TitleButton = True
        Width = 91
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'BOSS'
        Footers = <>
        Title.Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
        Title.TitleButton = True
        Width = 100
      end>
  end
  inherited tlbMain: TToolBar
    Width = 581
  end
  inherited pnlEdit: TPanel
    Width = 581
    inherited btnSaveLink: TBitBtn
      Width = 395
    end
    inherited btnCancelLink: TBitBtn
      Left = 486
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = mtSUBDIV
  end
  object pfbdtdrvrh1: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    SelectCommand.CommandText.Strings = (
      'select * from SUBDIVISIONS')
    UpdateCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOTICE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PARENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ADRES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BOSS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    UpdateCommand.CommandText.Strings = (
      'UPDATE SUBDIVISIONS'
      'SET '
      '    NAME = :NAME,'
      '    NOTICE = :NOTICE,'
      '    ID_PARENT = :ID_PARENT,'
      '    ADRES = :ADRES,'
      '    BOSS = :BOSS'
      'WHERE'
      '    ID = :ID'
      '    ')
    InsertCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOTICE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PARENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ADRES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'BOSS'
        ParamType = ptUnknown
      end>
    InsertCommand.CommandText.Strings = (
      'INSERT INTO SUBDIVISIONS('
      '    ID,'
      '    NAME,'
      '    NOTICE,'
      '    ID_PARENT,'
      '    ADRES,'
      '    BOSS'
      ')'
      'VALUES('
      '    :ID,'
      '    :NAME,'
      '    :NOTICE,'
      '    :ID_PARENT,'
      '    :ADRES,'
      '    :BOSS'
      ')')
    DeleteCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'ID'
        ParamType = ptUnknown
      end>
    DeleteCommand.CommandText.Strings = (
      'DELETE FROM'
      '    SUBDIVISIONS'
      'WHERE'
      '        ID = :ID')
    GetrecCommand.Params = <>
    KeyFields = 'ID'
    Left = 284
    Top = 165
  end
  object mtSUBDIV: TMemTableEh
    Params = <>
    DataDriver = pfbdtdrvrh1
    TreeList.Active = True
    TreeList.KeyFieldName = 'ID'
    TreeList.RefParentFieldName = 'ID_PARENT'
    Left = 142
    Top = 150
  end
end
