inherited EquipmentForm: TEquipmentForm
  Left = 344
  Top = 228
  Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1074' '#1089#1077#1090#1080
  ClientHeight = 623
  ClientWidth = 979
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 57
    Width = 979
  end
  object splMain: TSplitter [1]
    Left = 0
    Top = 413
    Width = 979
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  inherited dbGrid: TDBGridEh
    Top = 60
    Width = 979
    Height = 353
    AllowedOperations = []
    FooterRowCount = 1
    IndicatorTitle.ShowDropDownSign = True
    IndicatorTitle.TitleButton = True
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    SortLocal = False
    SumList.Active = True
    OnGetCellParams = dbGridGetCellParams
    OnSortMarkingChanged = dbGridSortMarkingChanged
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EID'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EQ_TYPE'
        Footers = <>
        KeyList.Strings = (
          '1'
          '2'
          '3')
        PickList.Strings = (
          #1057
          #1050
          #1055)
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 24
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 167
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET'
        Footers = <>
        Title.Caption = #1059#1083#1080#1094#1072
        Title.TitleButton = True
        Width = 129
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
        Width = 28
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PORCH_N'
        Footers = <>
        Title.Caption = #1055'-'#1076
        Title.TitleButton = True
        Width = 27
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLOOR_N'
        Footers = <>
        Title.Caption = #1069'-'#1078
        Title.TitleButton = True
        Width = 29
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PLACE'
        Footers = <>
        Title.Caption = #1052#1077#1089#1090#1086
        Title.TitleButton = True
        Width = 63
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MAC'
        Footers = <>
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IP'
        Footers = <>
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
        OnGetCellParams = dbGridColumns10GetCellParams
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EQGROUP'
        Footers = <>
        Title.Caption = #1043#1088#1091#1087#1087#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SERIAL_N'
        Footers = <>
        Title.Caption = #1057#1077#1088#1080#1081#1085#1099#1081
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'EQ_ACTIVE'
        Footers = <>
        Title.Caption = #1040#1082#1090'/'#1055#1072#1089
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EQ_LINE'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1')
        PickList.Strings = (
          #1052#1072#1075#1080#1089#1090#1088'.'
          #1044#1086#1084#1086#1074#1072#1103)
        Title.Caption = #1057#1077#1090#1100
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SIGNAL_IN'
        Footers = <>
        Title.Caption = #1059#1088#1086#1074#1077#1085#1100'|'#1042#1093
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SIGNAL_OUT'
        Footers = <>
        Title.Caption = #1059#1088#1086#1074#1077#1085#1100'|'#1042#1099#1093
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PARENT_NAME'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082'|'#1059#1089#1090#1088#1086#1081#1089#1090#1074#1086
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Parent_Port_sort'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082'|'#1055#1086#1088#1090
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IPV6'
        Footers = <>
        Title.Caption = 'IPv6'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NODE_NAME'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NODE_TYPE'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1091#1079#1083#1072
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 979
    inherited ToolButton5: TToolButton
      Visible = False
    end
    inherited ToolButton9: TToolButton
      Visible = False
    end
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
      OnClick = tbCancelClick
    end
    inherited ToolButton20: TToolButton
      Visible = False
    end
    object btnActSetFilter: TToolButton
      Left = 178
      Top = 0
      Action = ActSetFilter
      DropdownMenu = pmFilter
      Style = tbsDropDown
    end
    object btn2: TToolButton
      Left = 216
      Top = 0
      Width = 8
      Caption = 'btn2'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object btnRefresh: TToolButton
      Left = 224
      Top = 0
      Caption = 'btnRefresh'
      ImageIndex = 27
      OnClick = btnRefreshClick
    end
    object btn1: TToolButton
      Left = 247
      Top = 0
      Width = 24
      Caption = 'btn1'
      ImageIndex = 41
      Style = tbsSeparator
      Visible = False
    end
    object pnlChkTree: TPanel
      Left = 271
      Top = 0
      Width = 172
      Height = 22
      BevelOuter = bvNone
      TabOrder = 0
      object chkTREE: TCheckBox
        Left = 10
        Top = 0
        Width = 162
        Height = 22
        Align = alClient
        Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1074' '#1074#1080#1076#1077' '#1076#1077#1088#1077#1074#1072
        TabOrder = 0
        OnClick = chkTREEClick
      end
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 10
        Height = 22
        ParentCustomHint = False
        Align = alLeft
        BevelOuter = bvNone
        BiDiMode = bdLeftToRight
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
    end
    object chkGroup: TCheckBox
      Left = 443
      Top = 0
      Width = 224
      Height = 22
      Align = alClient
      Alignment = taLeftJustify
      Caption = '('#1053#1077' '#1075#1086#1090#1086#1074#1086')   '#1042#1082#1083#1102#1095#1080#1090#1100' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1091
      TabOrder = 1
      Visible = False
      OnClick = chkGroupClick
    end
    object btn3: TToolButton
      Left = 667
      Top = 0
      Width = 18
      Caption = 'btn3'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object btnLayout: TToolButton
      Left = 685
      Top = 0
      Action = actLayout
    end
  end
  inherited pnlEdit: TPanel
    Width = 979
    Height = 32
    inherited btnSaveLink: TBitBtn
      Left = 108
      Top = 103
      Width = 300
      TabOrder = 1
    end
    inherited btnCancelLink: TBitBtn
      Left = 391
      Top = -1
      TabOrder = 0
    end
  end
  object pnlForms: TPanel [5]
    Left = 0
    Top = 416
    Width = 979
    Height = 207
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object splLst: TSplitter
      Left = 118
      Top = 0
      Height = 207
    end
    object pnlDATA: TPanel
      Left = 121
      Top = 0
      Width = 858
      Height = 207
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
    end
    object lstForms: TListBox
      Left = 0
      Top = 0
      Width = 118
      Height = 207
      Align = alLeft
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clBtnHighlight
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnClick = lstFormsClick
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsEquipments
    Left = 88
    Top = 272
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 38
    Top = 160
    inherited actNew: TAction
      Caption = #1053#1086#1074#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actEditExecute
    end
    object actCoverAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1086#1085#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1086#1085#1091
      ImageIndex = 2
    end
    object actCoverEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1086#1085#1091
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1086#1085#1091
      ImageIndex = 4
    end
    object actCoverDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1086#1085#1091
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1086#1085#1091
      ImageIndex = 3
    end
    object actAtrADD: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1090#1088#1080#1073#1091#1090
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1090#1088#1080#1073#1091#1090
      ImageIndex = 2
    end
    object actAtrEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072
      ImageIndex = 4
    end
    object actAtrDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1072#1090#1088#1080#1073#1091#1090
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1072#1090#1088#1080#1073#1091#1090
      ImageIndex = 3
    end
    object actNewChild: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1082' '#1076#1086#1095#1077#1088#1085#1080#1081' '#1091#1079#1077#1083
      ImageIndex = 28
      ShortCut = 16429
      OnExecute = actNewChildExecute
    end
    object actFindCustomer: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      Hint = #1054#1090#1082#1088#1099#1090' '#1072#1073#1086#1085#1077#1085#1090#1072'('#1086#1074') '#1074' '#1089#1087#1080#1089#1082#1077' '#1040#1073#1086#1085#1077#1085#1090#1086#1074
      ImageIndex = 9
    end
    object actEditCustLan: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1077#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      ImageIndex = 4
    end
    object actClone: TAction
      Caption = #1050#1083#1086#1085#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 8237
      OnExecute = actCloneExecute
    end
    object actPAdd: TAction
      Category = #1055#1086#1088#1090
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1088#1090'/'#1099
      ImageIndex = 2
    end
    object actPEdit: TAction
      Category = #1055#1086#1088#1090
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1088#1090
      ImageIndex = 4
    end
    object actLayout: TAction
      Hint = #1055#1077#1088#1077#1082#1083#1102#1095#1080#1090#1100' '#1088#1077#1078#1080#1084' '#1092#1086#1088#1084#1099'. '#1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086'/'#1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086
      ImageIndex = 93
      OnExecute = actLayoutExecute
    end
    object ActSetFilter: TAction
      Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1092#1080#1083#1100#1090#1088#1072
      Hint = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1092#1080#1083#1100#1090#1088#1072
      ImageIndex = 0
      ShortCut = 114
      OnExecute = ActSetFilterExecute
    end
    object actEnableFilter: TAction
      Caption = #1074#1082#1083'/'#1074#1099#1082#1083' '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100'/'#1074#1099#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ShortCut = 16498
      OnExecute = actEnableFilterExecute
    end
    object actSetFilterN: TAction
      Caption = #1053#1086#1074#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1092#1080#1083#1100#1090#1088' '#1089' '#1086#1095#1080#1089#1090#1082#1086#1081' '#1089#1090#1072#1088#1086#1075#1086
      ImageIndex = 0
      ShortCut = 8306
      OnExecute = actSetFilterNExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Top = 140
    object N1: TMenuItem [0]
      Action = actNew
    end
    object N2: TMenuItem [1]
      Action = actEdit
    end
    object miNewChild: TMenuItem [2]
      Action = actNewChild
    end
    object N5: TMenuItem [3]
      Action = actClone
    end
    object N3: TMenuItem [4]
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object telnet1: TMenuItem
      Caption = 'telnet'
      OnClick = telnet1Click
    end
    object miTreeBreak: TMenuItem
      Caption = '-'
    end
    object miTreeCollapse: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      Visible = False
      OnClick = miTreeCollapseClick
    end
    object miTreeExpand: TMenuItem
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      Visible = False
      OnClick = miTreeExpandClick
    end
    object miTreeExpandCurrent: TMenuItem
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1077#1090#1082#1091
      Visible = False
      OnClick = miTreeExpandCurrentClick
    end
  end
  object dsEquipments: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE EQUIPMENT SET NOTICE = :NOTICE WHERE EID = :OLD_EID')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EQUIPMENT'
      'WHERE'
      '        EID = :OLD_EID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    E.*'
      '  , h.house_no'
      '  , s.street_name || '#39' '#39' || s.street_short as street'
      '  , o.o_name as eqgroup'
      '  , p.name as parent_name'
      '  , o.O_DIMENSION as COLOR'
      '  , n.NAME NODE_NAME'
      '  , nt.o_name as node_type '
      '  , case(char_length(e.Parent_Port))'
      '      when 1 then '#39'0'#39' || e.Parent_Port'
      '      when 3 then '#39'0'#39' || e.Parent_Port'
      '      else e.Parent_Port'
      '    end Parent_Port_sort  '
      '  from EQUIPMENT E'
      '       left outer join house h on (e.house_id = h.house_id)'
      '       left outer join street s on (s.street_id = h.street_id)'
      
        '       left outer join objects o on (e.eq_group = o.o_id and o.O' +
        '_TYPE = 7)'
      '       left outer join equipment p on (e.parent_id = p.eid)'
      '       left outer join nodes n on (n.NODE_ID = e.NODE_ID)'
      
        '       left join objects nt on (nt.O_Id = n.Type_Id and o.O_Type' +
        ' = 38)              '
      'where'
      '        E.EID = :OLD_EID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    E.*'
      '  , h.house_no'
      '  , s.street_name || '#39' '#39' || s.street_short as street'
      '  , o.o_name as eqgroup'
      '  , p.name as parent_name'
      '  , o.O_DIMENSION as COLOR'
      '  , n.NAME NODE_NAME'
      '  , nt.o_name as node_type '
      '  , case(char_length(e.Parent_Port))'
      '      when 1 then '#39'0'#39' || e.Parent_Port'
      '      when 3 then '#39'0'#39' || e.Parent_Port'
      '      else e.Parent_Port'
      '    end Parent_Port_sort  '
      '  from EQUIPMENT E'
      '       left outer join house h on (e.house_id = h.house_id)'
      '       left outer join street s on (s.street_id = h.street_id)'
      
        '       left outer join objects o on (e.eq_group = o.o_id and o.O' +
        '_TYPE = 7)'
      '       left outer join equipment p on (e.parent_id = p.eid)'
      '       left outer join nodes n on (n.NODE_ID = e.NODE_ID)'
      
        '       left join objects nt on (nt.O_Id = n.Type_Id and nt.O_Typ' +
        'e = 38)    '
      'WHERE @@filter%1=1@                  '
      'order by NAME')
    AutoUpdateOptions.UpdateTableName = 'EQUIPMENT'
    AutoUpdateOptions.KeyFields = 'EID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 88
    Top = 224
  end
  object mtEQ: TMemTableEh
    FieldDefs = <>
    FetchAllOnOpen = True
    IndexDefs = <
      item
        Name = 'mtEQIndexEID'
        Fields = 'EID'
      end
      item
        Name = 'mtEQIndexPARENT'
        Fields = 'PARENT_ID'
      end>
    Params = <>
    DataDriver = drvEQ
    StoreDefs = True
    TreeList.KeyFieldName = 'EID'
    TreeList.RefParentFieldName = 'PARENT_ID'
    TreeList.DefaultNodeExpanded = True
    Left = 351
    Top = 228
  end
  object drvEQ: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    UpdateCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'NOTICE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EID'
        ParamType = ptUnknown
      end>
    UpdateCommand.CommandText.Strings = (
      'UPDATE EQUIPMENT SET NOTICE = :NOTICE WHERE EID = :EID')
    InsertCommand.Params = <>
    DeleteCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'EID'
        ParamType = ptUnknown
      end>
    DeleteCommand.CommandText.Strings = (
      'DELETE FROM'
      '    EQUIPMENT'
      'WHERE'
      '        EID = :EID')
    GetrecCommand.Params = <
      item
        DataType = ftInteger
        Name = 'EID'
        ParamType = ptInput
      end>
    GetrecCommand.CommandText.Strings = (
      'select'
      '    E.*'
      '  , h.house_no'
      '  , s.street_name || '#39' '#39' || s.street_short as street'
      '  , o.o_name as eqgroup'
      '  , p.name as parent_name'
      '  , o.O_DIMENSION as COLOR'
      '  , n.NAME NODE_NAME'
      '  , nt.o_name as node_type '
      '  from EQUIPMENT E'
      '       left outer join house h on (e.house_id = h.house_id)'
      '       left outer join street s on (s.street_id = h.street_id)'
      
        '       left outer join objects o on (e.eq_group = o.o_id and o.O' +
        '_TYPE = 7)'
      '       left outer join equipment p on (e.parent_id = p.eid)'
      '       left outer join nodes n on (n.NODE_ID = e.NODE_ID)'
      
        '       left join objects nt on (nt.O_Id = n.Type_Id and o.O_Type' +
        ' = 38) '
      ''
      ' WHERE '
      '        E.EID = :EID')
    ProviderDataSet = dsEquipments
    KeyFields = 'EID'
    Left = 258
    Top = 258
  end
  object dsFilter: TMemTableEh
    Params = <>
    Left = 483
    Top = 163
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object inversion: TMTBooleanDataFieldEh
          FieldName = 'inversion'
          DefaultExpression = 'False'
          DisplayWidth = 20
        end
        object next_condition: TMTNumericDataFieldEh
          FieldName = 'next_condition'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DefaultExpression = '0'
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object FLOOR: TMTStringDataFieldEh
          FieldName = 'FLOOR'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object PORCH: TMTStringDataFieldEh
          FieldName = 'PORCH'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object CHECK_ADRESS: TMTNumericDataFieldEh
          FieldName = 'CHECK_ADRESS'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DefaultExpression = '0'
          DisplayLabel = 'CHECK_ADRESS'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object STREET_ID: TMTNumericDataFieldEh
          FieldName = 'STREET_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'STREET_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object HOUSE_ID: TMTNumericDataFieldEh
          FieldName = 'HOUSE_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'HOUSE_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object AREA_ID: TMTNumericDataFieldEh
          FieldName = 'AREA_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'AREA_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SUBAREA_ID: TMTNumericDataFieldEh
          FieldName = 'SUBAREA_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'SUBAREA_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object EQ_TYPE: TMTNumericDataFieldEh
          FieldName = 'EQ_TYPE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'LETTERS_TYPE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object FLAT: TMTStringDataFieldEh
          FieldName = 'FLAT'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object PLACE: TMTStringDataFieldEh
          FieldName = 'PLACE'
          StringDataType = fdtStringEh
          DisplayWidth = 100
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object pmFilter: TPopupMenu
    Left = 668
    Top = 218
    object N31: TMenuItem
      Action = actEnableFilter
    end
    object miSetFilterN: TMenuItem
      Action = actSetFilterN
    end
    object N42: TMenuItem
      Caption = '-'
    end
    object N36: TMenuItem
      Action = actQuickFilter
    end
  end
end
