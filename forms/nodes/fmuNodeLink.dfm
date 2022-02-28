object apgNodeLink: TapgNodeLink
  Left = 0
  Top = 0
  Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1085#1099#1077' '#1091#1079#1083#1099
  ClientHeight = 229
  ClientWidth = 797
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgNodeLink: TDBGridEh
    Left = 26
    Top = 0
    Width = 771
    Height = 229
    Align = alClient
    AllowedOperations = []
    DataSource = srcLink
    DynProps = <>
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    RowDetailPanel.Active = True
    RowDetailPanel.Height = 106
    RowDetailPanel.BevelInner = bvNone
    RowDetailPanel.BevelOuter = bvNone
    RowDetailPanel.BorderStyle = bsNone
    RowDetailPanel.VertSizing = True
    SearchPanel.Enabled = True
    SearchPanel.FilterOnTyping = True
    SumList.Active = True
    TabOrder = 0
    TitleParams.MultiTitle = True
    OnDblClick = dbgNodeLinkDblClick
    OnGetCellParams = dbgNodeLinkGetCellParams
    OnRowDetailPanelHide = dbgNodeLinkRowDetailPanelHide
    OnRowDetailPanelShow = dbgNodeLinkRowDetailPanelShow
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLOW'
        Footers = <>
        Title.Caption = #1050#1091#1076#1072
        Title.TitleButton = True
        Width = 35
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CONN_NODE'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083'. '#1091#1079#1077#1083
        Title.TitleButton = True
        Width = 155
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1050#1072#1073#1077#1083#1100
        Title.TitleButton = True
        Width = 158
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1082#1072#1073#1077#1083#1103
        Title.TitleButton = True
        Width = 103
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MAT_NAME'
        Footers = <>
        Title.Caption = #1050#1072#1073#1077#1083#1100
        Title.TitleButton = True
        Width = 88
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'METERS'
        Footers = <>
        Title.Caption = #1044#1083#1080#1085#1072', '#1084
        Title.TitleButton = True
        Width = 58
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STOCK'
        Footers = <>
        Title.Caption = #1047#1072#1087#1072#1089', '#1084
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        EditMask = 'CAPACITY'
        FieldName = 'CAPACITY'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1045#1084#1082#1086#1089#1090#1100'|'#1042#1089#1077#1075#1086
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'USED'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1045#1084#1082#1086#1089#1090#1100'|'#1047#1072#1085#1103#1090#1086
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
        Width = 157
      end>
    object RowDetailData: TRowDetailPanelControlEh
      object pnlRow: TPanel
        Left = 0
        Top = 0
        Width = 738
        Height = 98
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbgDetail: TDBGridEh
          Left = 29
          Top = 0
          Width = 709
          Height = 98
          Align = alClient
          DataSource = srcEQ
          DynProps = <>
          Flat = True
          FooterRowCount = 1
          PopupMenu = pmOpen
          SumList.Active = True
          TabOrder = 0
          OnDblClick = dbgDetailDblClick
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Name'
              Footer.ValueType = fvtCount
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
              Width = 156
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'PORT'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1055#1086#1088#1090
              Width = 87
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Account_No'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1051#1080#1094#1077#1074#1086#1081
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cust_Code'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1076
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Ip'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = 'IP'
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Mac'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = 'MAC'
              Width = 97
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'WLABEL'
              Footers = <>
              Title.Caption = #1052#1077#1090#1082#1072' '#1082#1072#1073#1077#1083#1103
              Title.TitleButton = True
              Width = 105
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pnlDBtns: TPanel
          Left = 0
          Top = 0
          Width = 29
          Height = 98
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object btnFindCustomer: TSpeedButton
            Left = 4
            Top = 6
            Width = 22
            Height = 22
            Action = actOpenObject
            Flat = True
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00A924
              C46A982CB97F982CB97F982CB97F982CB97F982CB97F982CB97F982CB97F982C
              B97F982CB97F982CB97F982CB97F992CB97ED807DD2BFF00FF00F902FA0762B2
              E7FD63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FEAA5CEF86FF00FF00E909F01A63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FEA06BF099FF00FF00DB0FE62C63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE9578EEABFF00FF00CC15DC3F63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE8985ECBEFF00FF00BC1CD15263B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE7E92EAD1FF00FF00AE22C76463B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE729FE8E3FF00FF009E29BD7763B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE67ACE6F6FF00FF00D807DD2B992C
              B97E982CB97F982CB97F982CB97F982CB97F982CB97F982CB97F982CB97F982C
              B97F982CB97F982CB97F982CB97F982CB97FA924C46AFF00FF00FF00FF008A1C
              A47F2B7494FE2B7494FE2B7494FE2B7494FE2B7494FE2B7494FE2B7494FE2B74
              94FE2B7494FE2B7494FE2B7494FE2B7494FEFF00FF00FF00FF00FF00FF008A1C
              A47F2B7494FE2B7494FE2B7494FE2B7494FE2B7494FE2B7494FE2B7494FE2B74
              94FE2B7494FE2B7494FE2B7494FE3C699CE9FF00FF00FF00FF00FF00FF008B1C
              A57E2B7494FE2B7494FE2B7494FE2B7494FE2B7494FE8E2BB680FC00FC03FF00
              FF00FF00FF00FF00FF00F401F30CA225977A9E27927F9E27927FFF00FF00D504
              DA2B8B1CA57E8A1CA47F8A1CA47F8A1CA47FAE13C058FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00C915C346A93E9687809852F67D9E4DFEFF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00F701F708A0727DB8A26F81B37D9E4DFEFF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E304
              E21F9E27927F9E27927F9A7876C2A56B85ADF900F9069D7679BEFF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E404
              E31E9E27927F9E27927FB31EAA63FB00FB04FF00FF00F501F40B}
          end
        end
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 229
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      26
      229)
    object btnDel1: TSpeedButton
      Left = 2
      Top = 206
      Width = 22
      Height = 22
      Action = actDel
      Anchors = [akLeft, akBottom]
      Flat = True
      Layout = blGlyphTop
    end
    object btnAdd1: TSpeedButton
      Left = 2
      Top = 3
      Width = 22
      Height = 22
      Action = actAdd
      Flat = True
    end
    object btnAdd: TSpeedButton
      Left = 2
      Top = 32
      Width = 22
      Height = 22
      Action = actEdit
      Flat = True
    end
  end
  object dsLink: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    WIRE'
      'WHERE'
      '    WID = :OLD_WID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    l.*'
      '    , m.NAME MAT_NAME'
      
        '    , (select count(*) from port p where p.Wid = l.Wid) as USED ' +
        '   '
      '  from (select'
      '            '#39'>'#39' FLOW'
      '          , T.O_NAME'
      '          , t.O_Dimension COLOR'
      '          , n.Node_Id'
      '          , n.Name CONN_NODE   '
      '          , C.*'
      '          from Wire C'
      
        '               inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O' +
        '_TYPE = 56)'
      
        '               left outer join NODEs n on (n.Node_Id = c.Point_E' +
        ')'
      '          where (C.Point_S = :OLD_NODE_ID)'
      '        union'
      '        select'
      '            '#39'<'#39' FLOW'
      '          , T.O_NAME'
      '          , t.O_Dimension COLOR'
      '          , n.Node_Id'
      '          , n.Name CONN_NODE         '
      '          , C.*'
      '          from Wire C'
      
        '               inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O' +
        '_TYPE = 56)'
      
        '               left outer join NODEs n on (n.Node_Id = c.Point_S' +
        ')'
      '          where (C.Point_E = :OLD_NODE_ID)) l'
      '       left outer join MATERIALS m on (m.M_Id =  l.M_ID)')
    SelectSQL.Strings = (
      'select'
      '    l.*'
      '    , m.NAME MAT_NAME'
      
        '    , (select count(*) from port p where p.Wid = l.Wid and not p' +
        '.Con_Id is null) as USED'
      '  from (select'
      '            '#39'>'#39' FLOW'
      '          , T.O_NAME'
      '          , t.O_Dimension COLOR'
      '          , n.Node_Id'
      '          , n.Name CONN_NODE   '
      '          , C.*'
      '          from Wire C'
      
        '               inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O' +
        '_TYPE = 56)'
      
        '               left outer join NODEs n on (n.Node_Id = c.Point_E' +
        ')'
      '          where (C.Point_S = :NODE_ID)'
      '        union'
      '        select'
      '            '#39'<'#39' FLOW'
      '          , T.O_NAME'
      '          , t.O_Dimension COLOR'
      '          , n.Node_Id'
      '          , n.Name CONN_NODE         '
      '          , C.*'
      '          from Wire C'
      
        '               inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O' +
        '_TYPE = 56)'
      
        '               left outer join NODEs n on (n.Node_Id = c.Point_S' +
        ')'
      '          where (C.Point_E = :NODE_ID)) l'
      
        '       left outer join MATERIALS m on (m.M_Id =  l.M_ID)        ' +
        '  '
      '  order by FLOW, O_NAME, Name')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 155
    Top = 77
  end
  object srcLink: TDataSource
    DataSet = dsLink
    Left = 175
    Top = 107
  end
  object ActList: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 230
    Top = 101
    object actAdd: TAction
      ImageIndex = 2
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actDel: TAction
      ImageIndex = 3
      OnExecute = actDelExecute
    end
    object actPEdit: TAction
      Caption = 'actPEdit'
      OnExecute = actPEditExecute
    end
    object actOpenObject: TAction
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1086#1073#1098#1077#1082#1090#1091
      ImageIndex = 99
      OnExecute = actOpenObjectExecute
    end
    object actOpenEqpmnt: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      OnExecute = actOpenEqpmntExecute
    end
    object actOpenCustomer: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      OnExecute = actOpenCustomerExecute
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
  object dsEQ: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    w.WID'
      '  , w.LABEL WLABEL'
      '  , e.Name'
      '  , p.Port'
      '  , c.Customer_Id'
      '  , c.Account_No'
      '  , c.Cust_Code'
      '  , l.Ip'
      '  , l.Mac'
      '  , e.Eid'
      '  , e.Eq_Type'
      '  , e.Eq_Group'
      '  , e.Ip eIP'
      '  , e.Mac EMAC'
      '  from (select'
      '            cast(:WID as integer) WID'
      '          , STR as LABEL'
      '          from Explode_No_Empty('#39','#39', coalesce((select'
      '                                          w.Labels'
      '                                        from WIRE w'
      
        '                                        where w.Wid = :WID), '#39#39')' +
        ')) w'
      '       left outer join port p on (w.wid = p.Wid and'
      '             w.LABEL = p.Wlabel)'
      '       left outer join Equipment e on (e.Eid = p.Eid)'
      '       left outer join tv_lan l on (l.Eq_Id = e.Eid and'
      '             l.Port = p.Port)'
      
        '       left outer join customer c on (c.Customer_Id = l.Customer' +
        '_Id)'
      '  where w.Wid = :WID'
      'union'
      'select'
      '    P.WID'
      '  , P.WLABEL'
      '  , e.Name'
      '  , p.Port'
      '  , c.Customer_Id'
      '  , c.Account_No'
      '  , c.Cust_Code'
      '  , l.Ip'
      '  , l.Mac'
      '  , e.Eid'
      '  , e.Eq_Type'
      '  , e.Eq_Group'
      '  , e.Ip eIP'
      '  , e.Mac EMAC'
      '  from port p'
      '       left outer join Equipment e on (e.Eid = p.Eid)'
      '       left outer join tv_lan l on (l.Eq_Id = e.Eid and'
      '             l.Port = p.Port)'
      
        '       left outer join customer c on (c.Customer_Id = l.Customer' +
        '_Id)'
      '  where p.Wid = :WID'
      '        and (p.Wlabel is null'
      '          or not exists(select'
      '                            STR'
      '                          from Explode_No_Empty('#39','#39', (select'
      '                                                 w.Labels'
      '                                               from WIRE w'
      
        '                                               where w.Wid = :WI' +
        'D))'
      '                          where STR = p.Wlabel))')
    AutoUpdateOptions.UpdateTableName = 'REQUEST'
    AutoUpdateOptions.KeyFields = 'RQ_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_REQUEST'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcLink
    Left = 454
    Top = 95
  end
  object srcEQ: TDataSource
    DataSet = dsEQ
    Left = 518
    Top = 95
  end
  object pmOpen: TPopupMenu
    Left = 600
    Top = 96
    object miEqpmnt: TMenuItem
      Action = actOpenEqpmnt
    end
    object miNodeFrom: TMenuItem
      Action = actOpenCustomer
    end
  end
end
