inherited BCIssuesForm: TBCIssuesForm
  Caption = #1055#1088#1086#1073#1083#1077#1084#1099' '#1074#1077#1097#1072#1085#1080#1103
  ClientHeight = 306
  ClientWidth = 739
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Width = 739
    Height = 4
  end
  inherited dbGrid: TDBGridEh
    Top = 85
    Width = 739
    Height = 221
    DrawMemoText = True
    FooterRowCount = 1
    STFilter.InstantApply = False
    SumList.Active = True
    SumList.VirtualRecords = True
    OnGetCellParams = dbGridGetCellParams
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'BI_ID'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'BI_TYPE'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ISSUE_TYPE'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1087#1088#1086#1073#1083#1077#1084#1099
        Title.TitleButton = True
        Width = 146
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ISSUE'
        Footers = <>
        Title.Caption = #1055#1088#1086#1073#1083#1077#1084#1072
        Title.TitleButton = True
        Width = 152
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_CNT'
        Footers = <>
        Title.Caption = #1050#1072#1085#1072#1083#1086#1074
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DTV'
        Footers = <>
        Title.Caption = #1055#1088#1086#1073#1083#1077#1084#1072' '#1089'|DTV'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ATV'
        Footers = <>
        Title.Caption = #1055#1088#1086#1073#1083#1077#1084#1072' '#1089'|ATV'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IPTV'
        Footers = <>
        Title.Caption = #1055#1088#1086#1073#1083#1077#1084#1072' '#1089'|IPTV'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'OTT'
        Footers = <>
        Title.Caption = #1055#1088#1086#1073#1083#1077#1084#1072' '#1089'|OTT'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ISSUE_SOLUTION'
        Footers = <>
        Title.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
        Title.TitleButton = True
        Width = 89
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RESULT_TEXT'
        Footers = <>
        Title.Caption = #1063#1090#1086' '#1089#1076#1077#1083#1072#1085#1086
        Title.TitleButton = True
        Width = 141
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RESULT_ON'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ALTER_CONFIG'
        Footers = <>
        Title.Caption = #1050#1086#1085#1092#1080#1075
        Title.TitleButton = True
        Width = 55
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_LIST'
        Footers = <>
        Title.Caption = #1050#1072#1085#1072#1083#1099
        Width = 170
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_BY'
        Footers = <>
        Title.Caption = #1044#1086#1073#1072#1074#1080#1083'|'#1050#1090#1086
        Title.TitleButton = True
        Width = 123
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_ON'
        Footers = <>
        Title.Caption = #1044#1086#1073#1072#1074#1080#1083'|'#1050#1086#1075#1076#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_BY'
        Footers = <>
        Title.Caption = #1048#1089#1087#1088#1072#1074#1080#1083'|'#1050#1090#1086
        Title.TitleButton = True
        Width = 144
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_ON'
        Footers = <>
        Title.Caption = #1048#1089#1087#1088#1072#1074#1080#1083'|'#1050#1086#1075#1076#1072
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 739
    object btnDateFilter: TToolButton
      Left = 178
      Top = 0
      Action = actDateFilter
      DropdownMenu = pmPeriod
      Style = tbsDropDown
    end
    object btn1: TToolButton
      Left = 216
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object btnRefresh: TToolButton
      Left = 224
      Top = 0
      Action = actRefresh
    end
  end
  inherited pnlEdit: TPanel
    Width = 739
  end
  inherited srcDataSource: TDataSource
    DataSet = dsIssues
    OnDataChange = srcDataSourceDataChange
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 429
    Top = 197
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1073#1083#1077#1084#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1073#1083#1077#1084#1091
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1073#1083#1077#1084#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1073#1083#1077#1084#1091
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1087#1088#1086#1073#1083#1077#1084#1091
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1087#1088#1086#1073#1083#1077#1084#1091
      OnExecute = actEditExecute
    end
    object actDateFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077
      ImageIndex = 1
      ShortCut = 16452
      OnExecute = actDateFilterExecute
    end
    object actRefresh: TAction
      Caption = 'actRefresh'
      ImageIndex = 27
      OnExecute = actRefreshExecute
    end
  end
  object dsIssues: TpFIBDataSet
    DeleteSQL.Strings = (
      'execute block (OLD_BI_ID D_INTEGER = :OLD_BI_ID) as '
      'begin '
      'DELETE FROM BCISSUE WHERE BI_ID = :OLD_BI_ID;'
      'DELETE FROM BCI_CHANNELS WHERE BI_ID = :OLD_BI_ID;'
      'end'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    i.*'
      '  , o.O_Name ISSUE_TYPE'
      '  , r.O_Name ISSUE_SOLUTION'
      
        '  , (select count(*) from Bci_Channels c where c.Bi_Id = i.Bi_Id' +
        ' ) CH_CNT    '
      '  from Bcissue i'
      
        '    inner join objects o on (o.O_Id = i.Bi_Type and o.O_Type = 5' +
        '3)'
      
        '    left outer join objects r on (r.O_Id = i.SOLUTION and r.O_Ty' +
        'pe = 54)'
      ''
      ' WHERE '
      '        I.BI_ID = :OLD_BI_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    i.*'
      '  , o.O_Name ISSUE_TYPE'
      '  , r.O_Name ISSUE_SOLUTION'
      '  , c.CH_CNT'
      '  , c.CH_LIST'
      '  from Bcissue i'
      
        '       inner join objects o on (o.O_Id = i.Bi_Type and o.O_Type ' +
        '= 53)'
      
        '       left outer join objects r on (r.O_Id = i.SOLUTION and r.O' +
        '_Type = 54)'
      '       left outer join(select'
      '                           bc.Bi_Id'
      '                         , count(bc.Ch_Id) CH_CNT'
      '                         , list(c.Ch_Name) CH_LIST'
      '                         from Bci_Channels bc'
      
        '                              inner join Channels c on (c.Ch_Id ' +
        '= bc.Ch_Id)'
      
        '                         group by bc.Bi_Id) c on (c.Bi_Id = i.Bi' +
        '_Id)'
      
        '  where i.ADDED_ON between :start_date and dateadd(day, 1, :end_' +
        'date)'
      '  or @@not_closed%i.Edit_On is null@'
      '  order by I.Added_By desc'
      '')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 85
    Top = 200
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    oFetchAll = True
  end
  object pmPeriod: TPopupMenu
    Left = 225
    Top = 201
    object N1: TMenuItem
      Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #1047#1072' '#1087#1088#1086#1096#1083#1099#1081' '#1076#1077#1085#1100
      OnClick = N4Click
    end
    object N2: TMenuItem
      Caption = #1047#1072' '#1085#1077#1076#1077#1083#1102
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1047#1072' '#1084#1077#1089#1103#1094
      OnClick = N3Click
    end
    object miN5: TMenuItem
      Caption = '-'
    end
    object miNotClosed: TMenuItem
      Caption = #1053#1077#1079#1072#1082#1088#1099#1090#1099#1077' '#1087#1088#1086#1073#1083#1077#1084#1099
      Checked = True
      Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1085#1077#1079#1072#1082#1088#1099#1090#1099#1077' '#1079#1072' '#1083#1102#1073#1086#1081' '#1087#1077#1088#1080#1086#1076
      OnClick = miNotClosedClick
    end
  end
end
