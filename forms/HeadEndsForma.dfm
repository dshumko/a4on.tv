inherited HeadEndsForm: THeadEndsForm
  Caption = #1043#1086#1083#1086#1074#1085#1099#1077' '#1089#1090#1072#1085#1094#1080#1080
  ClientHeight = 490
  ClientWidth = 656
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbGrid: TDBGridEh
    Width = 656
    Height = 409
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HE_ID'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HE_NAME'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 161
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'o_name'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_ID'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_NAME'
        Footers = <>
        Title.Caption = #1059#1083#1080#1094#1072
        Title.TitleButton = True
        Width = 113
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_NO'
        Footers = <>
        Title.Caption = #1044#1086#1084
        Title.TitleButton = True
        Width = 34
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HE_PLACE'
        Footers = <>
        Title.Caption = #1052#1077#1089#1090#1086
        Title.TitleButton = True
        Width = 46
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HE_TYPE'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 161
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PARENT'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 656
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
    end
    inherited ToolButton20: TToolButton
      Visible = False
    end
    object btn1: TToolButton
      Left = 178
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 41
      Style = tbsSeparator
    end
    object chkTREE: TCheckBox
      Left = 186
      Top = 0
      Width = 165
      Height = 22
      Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1074' '#1074#1080#1076#1077' '#1076#1077#1088#1077#1074#1072
      TabOrder = 0
      OnClick = chkTREEClick
    end
  end
  inherited pnlEdit: TPanel
    Width = 656
  end
  inherited srcDataSource: TDataSource
    DataSet = dsHE
    OnStateChange = srcDataSourceStateChange
  end
  inherited actions: TActionList
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1043#1057
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1043#1057
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1043#1057
      OnExecute = actEditExecute
    end
  end
  object dsHE: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    HEADEND'
      'WHERE'
      '        HE_ID = :OLD_HE_ID'
      '    ')
    RefreshSQL.Strings = (
      
        'select he.*, s.street_name|| '#39' '#39'||s.street_short as street_name,' +
        ' h.house_no, o.o_name, hp.HE_NAME PARENT'
      'from HEADEND he'
      '  left outer join house h on (he.house_id = h.house_id)'
      '  left outer join street s on (h.street_id = s.street_id)'
      
        '  left outer join objects o on (o.o_id = he.he_type  and o.o_typ' +
        'e = 9)'
      '  left outer join HEADEND hp on (hp.HE_ID = he.PARENT_ID) '
      ''
      ' WHERE '
      '        HE.HE_ID = :OLD_HE_ID'
      '    ')
    SelectSQL.Strings = (
      
        'select he.*, s.street_name|| '#39' '#39'||s.street_short as street_name,' +
        ' h.house_no, o.o_name, hp.HE_NAME PARENT'
      'from HEADEND he'
      '  left outer join house h on (he.house_id = h.house_id)'
      '  left outer join street s on (h.street_id = s.street_id)'
      
        '  left outer join objects o on (o.o_id = he.he_type  and o.o_typ' +
        'e = 9)'
      '  left outer join HEADEND hp on (hp.HE_ID = he.PARENT_ID) '
      'order by he.he_name')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 185
    Top = 188
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 148
    Top = 266
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 252
    Top = 216
  end
  object mtHE: TMemTableEh
    Params = <>
    DataDriver = drvHE
    TreeList.KeyFieldName = 'HE_ID'
    TreeList.RefParentFieldName = 'PARENT_ID'
    TreeList.DefaultNodeExpanded = True
    Left = 386
    Top = 176
  end
  object drvHE: TpFIBDataDriverEh
    SelectCommand.Params = <>
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <>
    GetrecCommand.Params = <>
    ProviderDataSet = dsHE
    Left = 388
    Top = 230
  end
end
