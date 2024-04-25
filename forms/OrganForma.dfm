inherited OrganForm: TOrganForm
  Left = 346
  Top = 218
  Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
  ClientHeight = 282
  ClientWidth = 646
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Width = 646
  end
  inherited dbGrid: TDBGridEh
    Width = 646
    Height = 197
    AllowedOperations = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ORG_ID'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ORG_NAME'
        Footers = <>
        Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
        Title.TitleButton = True
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DIRECTOR'
        Footers = <>
        Title.Caption = #1044#1080#1088#1077#1082#1090#1086#1088
        Title.TitleButton = True
        Width = 108
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'BUHGALTER'
        Footers = <>
        Title.Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADRES'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PHONE'
        Footers = <>
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'BANK'
        Footers = <>
        Title.Caption = #1041#1072#1085#1082
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ORG_ACCOUNT'
        Footers = <>
        Title.Caption = #1057#1095#1077#1090
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ORG_UNN'
        Footers = <>
        Title.Caption = #1059#1053#1053
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ORG_CODE'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ORG_CONTRACT'
        Footers = <>
        Title.Caption = #1044#1086#1075#1086#1074#1086#1088
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EMAIL'
        Footers = <>
        Title.Caption = 'E-MAIL'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 646
    inherited tbOk: TToolButton
      OnClick = tbOkClick
    end
    inherited tbCancel: TToolButton
      OnClick = tbCancelClick
    end
  end
  inherited pnlEdit: TPanel
    Width = 646
  end
  inherited srcDataSource: TDataSource
    DataSet = dsOrgan
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
  object dsOrgan: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE ORGANIZATION'
      'SET '
      '    ORG_NAME = :ORG_NAME,'
      '    DIRECTOR = :DIRECTOR,'
      '    BUHGALTER = :BUHGALTER,'
      '    ADRES = :ADRES,'
      '    PHONE = :PHONE,'
      '    EMAIL = :EMAIL,'
      '    NOTICE = :NOTICE,'
      '    ORG_BANK = :ORG_BANK,'
      '    ORG_ACCOUNT = :ORG_ACCOUNT,'
      '    ORG_UNN = :ORG_UNN,'
      '    ORG_CODE = :ORG_CODE,'
      '    ORG_CONTRACT = :ORG_CONTRACT'
      'WHERE'
      '    ORG_ID = :OLD_ORG_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    ORGANIZATION'
      'WHERE'
      '        ORG_ID = :OLD_ORG_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO ORGANIZATION('
      '    ORG_ID,'
      '    ORG_NAME,'
      '    DIRECTOR,'
      '    BUHGALTER,'
      '    ADRES,'
      '    PHONE,'
      '    EMAIL,'
      '    NOTICE,'
      '    ORG_BANK,'
      '    ORG_ACCOUNT,'
      '    ORG_UNN,'
      '    ORG_CODE,'
      '    ORG_CONTRACT'
      ')'
      'VALUES('
      '    :ORG_ID,'
      '    :ORG_NAME,'
      '    :DIRECTOR,'
      '    :BUHGALTER,'
      '    :ADRES,'
      '    :PHONE,'
      '    :EMAIL,'
      '    :NOTICE,'
      '    :ORG_BANK,'
      '    :ORG_ACCOUNT,'
      '    :ORG_UNN,'
      '    :ORG_CODE,'
      '    :ORG_CONTRACT'
      ')')
    RefreshSQL.Strings = (
      'select *'
      'from ORGANIZATION'
      ''
      ' WHERE '
      '        ORGANIZATION.ORG_ID = :OLD_ORG_ID'
      '    ')
    SelectSQL.Strings = (
      'select o.*,  b.o_name as bank'
      'from ORGANIZATION o'
      
        ' left outer join objects b on (b.o_id = o.org_bank and b.o_type ' +
        '= 11)'
      'order by ORG_NAME'
      ''
      '')
    AutoUpdateOptions.UpdateTableName = 'ORGANIZATION'
    AutoUpdateOptions.KeyFields = 'ORG_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 137
    Top = 54
  end
end
