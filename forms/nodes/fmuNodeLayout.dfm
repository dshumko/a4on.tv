object apgNodeLayout: TapgNodeLayout
  Left = 0
  Top = 0
  Caption = #1050#1086#1084#1087#1086#1085#1086#1074#1082#1072
  ClientHeight = 166
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgCustAttr: TDBGridEh
    Left = 32
    Top = 0
    Width = 472
    Height = 166
    Align = alClient
    AllowedOperations = []
    DataSource = srcLayout
    DynProps = <>
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    SearchPanel.Enabled = True
    SearchPanel.FilterOnTyping = True
    SumList.Active = True
    TabOrder = 0
    OnDblClick = dbgCustAttrDblClick
    OnGetCellParams = dbgCustAttrGetCellParams
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1084#1072#1090#1077#1088#1080#1072#1083#1072' / '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
        Title.TitleButton = True
        Width = 84
      end
      item
        CellButtons = <>
        DisplayFormat = ',#.##'
        DynProps = <>
        EditButtons = <>
        FieldName = 'DEV_CNT'
        Footer.Alignment = taRightJustify
        Footer.DisplayFormat = ',#.##'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Title.TitleButton = True
        Width = 89
      end
      item
        CellButtons = <>
        DisplayFormat = ',#.##'
        DynProps = <>
        EditButtons = <>
        FieldName = 'USED_CNT'
        Footer.Alignment = taRightJustify
        Footer.DisplayFormat = ',#.##'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1060#1072#1082#1090
        Title.Hint = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1086' '#1085#1072' '#1091#1079#1083#1077
        Width = 66
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 189
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlBottLeft: TPanel
    Left = 0
    Top = 0
    Width = 32
    Height = 166
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      32
      166)
    object btnAddL: TSpeedButton
      Left = 5
      Top = 6
      Width = 23
      Height = 22
      Action = actAdd
      Flat = True
    end
    object btnEditL: TSpeedButton
      Left = 5
      Top = 34
      Width = 23
      Height = 22
      Action = actEdit
      Flat = True
    end
    object btnDelL: TSpeedButton
      Left = 5
      Top = 142
      Width = 23
      Height = 22
      Action = actDel
      Anchors = [akLeft, akBottom]
      Flat = True
    end
  end
  object dsLayout: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE NODE_LAYOUT'
      'SET '
      '    NODE_ID = :NODE_ID,'
      '    M_TYPE = :M_TYPE,'
      '    DEV_CNT = :DEV_CNT,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    NODE_ID = :OLD_NODE_ID'
      '    and M_TYPE = :OLD_M_TYPE'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    NODE_LAYOUT'
      'WHERE'
      '        NODE_ID = :OLD_NODE_ID'
      '    and M_TYPE = :OLD_M_TYPE'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO NODE_LAYOUT('
      '    NODE_ID,'
      '    M_TYPE,'
      '    DEV_CNT,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :NODE_ID,'
      '    :M_TYPE,'
      '    :DEV_CNT,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    l.O_NAME'
      '  , l.Node_Id'
      '  , l.M_Type'
      '  , l.Dev_Cnt'
      '  , l.Notice'
      '  , l.itsOwn'
      '  , (select'
      '         sum(i.Quant)'
      '       from Inventory i'
      '            inner join materials m on (m.M_Id = i.M_Id)'
      '       where i.Owner_Type = 2'
      '             and m.M_Type = l.M_Type'
      '             and i.Owner = :OLD_NODE_ID) USED_CNT'
      '  from (select'
      '            A.O_NAME'
      '          , CA.*'
      '          , 1 itsOwn'
      '          from Node_Layout CA'
      '               inner join OBJECTS A on (CA.M_TYPE = A.O_ID and'
      '                     A.O_TYPE = 48)'
      '          where CA.Node_Id = :OLD_NODE_ID'
      '        union all'
      '        select'
      '            A.O_NAME'
      '          , CA.*'
      '          , 0 itsOwn'
      '          from Node_Layout CA'
      '               inner join OBJECTS A on (CA.M_TYPE = A.O_ID and'
      '                     A.O_TYPE = 48)'
      '          where CA.Node_Id in (select'
      '                                   -1 * n.Type_Id'
      '                                 from nodes n'
      '                                 where n.Node_Id = :OLD_NODE_ID'
      '                                       and not exists(select'
      
        '                                                          nl.Nod' +
        'e_Id'
      
        '                                                        from Nod' +
        'e_Layout nl'
      
        '                                                        where nl' +
        '.Node_Id = :OLD_NODE_ID))) l'
      'where l.NODE_ID = :OLD_NODE_ID'
      '        and l.M_TYPE = :OLD_M_TYPE'
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    l.O_NAME'
      '  , l.Node_Id'
      '  , l.M_Type'
      '  , l.Dev_Cnt'
      '  , l.Notice'
      '  , l.itsOwn'
      '  , (select'
      '         sum(i.Quant)'
      '       from Inventory i'
      '            inner join materials m on (m.M_Id = i.M_Id)'
      '       where i.Owner_Type = 2'
      '             and m.M_Type = l.M_Type'
      '             and i.Owner = :NODE_ID) USED_CNT'
      '  from (select'
      '            A.O_NAME'
      '          , CA.*'
      '          , 1 itsOwn'
      '          from Node_Layout CA'
      '               inner join OBJECTS A on (CA.M_TYPE = A.O_ID and'
      '                     A.O_TYPE = 48)'
      '          where CA.Node_Id = :NODE_ID'
      '        union all'
      '        select'
      '            A.O_NAME'
      '          , CA.*'
      '          , 0 itsOwn'
      '          from Node_Layout CA'
      '               inner join OBJECTS A on (CA.M_TYPE = A.O_ID and'
      '                     A.O_TYPE = 48)'
      '          where CA.Node_Id in (select'
      '                                   -1 * n.Type_Id'
      '                                 from nodes n'
      '                                 where n.Node_Id = :NODE_ID'
      '                                       and not exists(select'
      
        '                                                          nl.Nod' +
        'e_Id'
      
        '                                                        from Nod' +
        'e_Layout nl'
      
        '                                                        where nl' +
        '.Node_Id = :NODE_ID))) l')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 131
    Top = 69
  end
  object srcLayout: TDataSource
    AutoEdit = False
    DataSet = dsLayout
    OnDataChange = srcLayoutDataChange
    Left = 63
    Top = 35
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 206
    Top = 37
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
end
