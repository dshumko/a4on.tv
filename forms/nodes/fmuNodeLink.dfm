object apgNodeLink: TapgNodeLink
  Left = 0
  Top = 0
  Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1085#1099#1077' '#1091#1079#1083#1099
  ClientHeight = 211
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
    Height = 211
    Align = alClient
    AllowedOperations = []
    DataSource = srcLink
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    RowDetailPanel.Active = True
    RowDetailPanel.Height = 100
    RowDetailPanel.BevelInner = bvNone
    RowDetailPanel.BevelOuter = bvNone
    RowDetailPanel.BorderStyle = bsNone
    RowDetailPanel.VertSizing = True
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
        Height = 92
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbgDetail: TDBGridEh
          Left = 0
          Top = 0
          Width = 738
          Height = 92
          Align = alClient
          DataSource = srcEQ
          DynProps = <>
          TabOrder = 0
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'Name'
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
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 211
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      26
      211)
    object btnDel1: TSpeedButton
      Left = 2
      Top = 188
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
    Left = 131
    Top = 61
  end
  object srcLink: TDataSource
    DataSet = dsLink
    Left = 119
    Top = 115
  end
  object ActList: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 198
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
      
        '  e.Name, p.Port, c.Customer_Id, c.Account_No, c.Cust_Code, l.Ip' +
        ', l.Mac'
      'from port p'
      '  inner join Equipment e on (e.Eid = p.Eid)'
      
        '  left outer join tv_lan l on (l.Eq_Id = e.Eid and l.Port = p.Po' +
        'rt)'
      '  left outer join customer c on (c.Customer_Id = l.Customer_Id)'
      'where p.Wid = :WID')
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
end
