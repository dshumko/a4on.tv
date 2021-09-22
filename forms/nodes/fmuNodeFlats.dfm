object apgNodeFlats: TapgNodeFlats
  Left = 0
  Top = 0
  Caption = #1050#1074#1072#1088#1090#1080#1088#1099' '#1091#1079#1083#1072
  ClientHeight = 211
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgNodeFiles: TDBGridEh
    Left = 27
    Top = 0
    Width = 752
    Height = 211
    Align = alClient
    AllowedOperations = []
    DataSource = srcFlats
    DrawMemoText = True
    DynProps = <>
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    SumList.Active = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    OnDblClick = dbgNodeFilesDblClick
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'LVL'
        Footers = <>
        Title.Caption = #1059#1088#1086#1074#1077#1085#1100
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLAT_NO'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1050#1074#1072#1088#1090#1080#1088#1072
        Title.TitleButton = True
        Width = 95
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SRV_LIST'
        Footers = <>
        ShowImageAndText = True
        Title.Caption = #1059#1089#1083#1091#1075#1080' '#1082#1074#1072#1088#1090#1080#1088#1099
        Width = 139
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PORCH_N'
        Footers = <>
        Title.Caption = #1055#1086#1076'-'#1076
        Title.TitleButton = True
        Width = 44
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLOOR_N'
        Footers = <>
        Title.Caption = #1069#1090#1072#1078
        Title.TitleButton = True
        Width = 46
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_NO'
        Footers = <>
        Title.Caption = #1044#1086#1084
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_NAME'
        Footers = <>
        Title.Caption = #1059#1083#1080#1094#1072
        Title.TitleButton = True
        Width = 136
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 156
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object tbAttributes: TToolBar
    Left = 0
    Top = 0
    Width = 27
    Height = 211
    Align = alLeft
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Images = A4MainForm.ICONS_ACTIVE
    TabOrder = 0
    object btnEdit: TToolButton
      Left = 0
      Top = 0
      Action = actEdit
      ParentShowHint = False
      ShowHint = True
    end
    object btn1: TToolButton
      Left = 0
      Top = 0
      Width = 17
      Caption = 'btn1'
      ImageIndex = 5
      Wrap = True
      Style = tbsSeparator
    end
    object btnCustomers: TToolButton
      Left = 0
      Top = 39
      Action = actCustomers
    end
  end
  object dsFlats: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CUSTOMER_FILES'
      'WHERE'
      '        CF_ID = :OLD_CF_ID'
      '    ')
    SelectSQL.Strings = (
      'execute block ('
      '    NODE_ID integer = :NODE_ID)'
      'returns ('
      '    HOUSE_ID    integer,'
      '    LVL         integer,'
      '    FLAT_NO     varchar(400),'
      '    PORCH_N     varchar(40),'
      '    FLOOR_N     varchar(40),'
      '    SRV_LIST    varchar(400),'
      '    CST_LIST    varchar(400),'
      '    STREET_NAME varchar(250),'
      '    HOUSE_NO    varchar(80),'
      '    NOTICE      D_Notice)'
      'as'
      'declare variable T_NODE integer;'
      'begin'
      '  for with recursive Node_tree'
      '      as (select'
      '              t.Node_Id'
      '            , t.parent_id'
      '            , 1 lvl'
      '            from Nodes t'
      '            where node_id = :NODE_ID'
      '          union all'
      '          select'
      '              t.Node_Id'
      '            , t.parent_id'
      '            , prior.lvl + 1 lvl'
      '            from Nodes t'
      
        '                 inner join Node_tree prior on prior.Node_Id = t' +
        '.parent_id'
      ''
      '      )'
      '      select'
      '          nt.Node_Id'
      '        , nt.lvl'
      '        from Node_tree nt'
      '      into :T_NODE, :LVL'
      '  do begin'
      '    for select'
      '            nF.House_Id'
      '          , nf.Flat_No'
      '          , f.Porch_N'
      '          , f.Floor_N'
      
        '          , s.Street_Name || '#39' '#39' || s.Street_Short as Street_Nam' +
        'e'
      '          , h.House_No'
      '          , nf.NOTICE'
      '          from Node_Flats NF'
      '               inner join house h on (nf.House_Id = h.House_Id)'
      
        '               inner join street s on (s.Street_Id = h.Street_Id' +
        ')'
      
        '               left outer join houseflats F on (f.House_Id = nf.' +
        'House_Id and f.Flat_No = nf.Flat_No)'
      '          where nf.NODE_ID = :T_NODE'
      '          order by f.porch_n, f.Floor_N, f.Flat_No'
      
        '        into :HOUSE_ID, :FLAT_NO, :PORCH_N, :FLOOR_N, :STREET_NA' +
        'ME, :HOUSE_NO, :NOTICE'
      '    do begin'
      '      SRV_LIST = null;'
      '      CST_LIST = null;'
      '      select'
      '        -- list(distinct c.CUSTOMER_ID) CST_LIST , '
      '        list(distinct R.Shortname) SRV_LIST'
      '        from customer c'
      
        '             left outer join subscr_serv ss on (ss.Customer_Id =' +
        ' c.Customer_Id and ss.State_Sgn = 1)'
      
        '             left outer join services r on (r.Service_Id = ss.Se' +
        'rv_Id)'
      '        where c.House_Id = :HOUSE_ID'
      '              and c.Flat_No = :Flat_No'
      '      into -- :CST_LIST, '
      '           :SRV_LIST;'
      '      suspend;'
      '    end'
      '  end'
      'end')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 131
    Top = 85
    oFetchAll = True
  end
  object srcFlats: TDataSource
    DataSet = dsFlats
    Left = 63
    Top = 35
  end
  object ActList: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 206
    Top = 37
    object actAdd: TAction
      Caption = 'actAdd'
      ImageIndex = 2
    end
    object actEdit: TAction
      Caption = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1082#1074#1072#1088#1090#1080#1088#1099
      Hint = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1082#1074#1072#1088#1090#1080#1088#1099' '#1082' '#1091#1079#1083#1091
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actDel: TAction
      Caption = 'actDel'
      ImageIndex = 3
    end
    object actView: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1072#1081#1083#1072
      ImageIndex = 38
    end
    object actCustomers: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1086#1074' '#1076#1086#1084#1072
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1086#1074' '#1076#1086#1084#1072
      ImageIndex = 9
      OnExecute = actCustomersExecute
    end
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
    Left = 331
    Top = 42
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
    Left = 371
    Top = 42
  end
  object qRead: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select Content from node_Files where NF_Id = :NF_Id')
    Left = 296
    Top = 120
  end
end
