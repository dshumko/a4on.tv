inherited RecoursesForm: TRecoursesForm
  Caption = #1054#1073#1088#1072#1097#1077#1085#1080#1103' / '#1079#1074#1086#1085#1082#1080
  ClientHeight = 303
  ClientWidth = 852
  StyleElements = [seFont, seClient, seBorder]
  OnActivate = FormActivate
  ExplicitWidth = 868
  ExplicitHeight = 342
  TextHeight = 13
  inherited splPG: TSplitter
    Width = 852
    ExplicitWidth = 739
  end
  inherited dbGrid: TDBGridEh
    Width = 852
    Height = 218
    AllowedOperations = [alopInsertEh, alopUpdateEh, alopAppendEh]
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
        FieldName = 'STREET_NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1059#1083#1080#1094#1072
        Title.TitleButton = True
        Width = 137
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_NO'
        Footers = <>
        Title.Caption = #1044#1086#1084
        Title.TitleButton = True
        Width = 46
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLAT_NO'
        Footers = <>
        Title.Caption = #1050#1074'-'#1088#1072
        Title.TitleButton = True
        Width = 42
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACCOUNT_NO'
        Footers = <>
        Title.Caption = #1051#1080#1094#1077#1074#1086#1081
        Title.TitleButton = True
        Width = 75
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SURNAME'
        Footers = <>
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Title.TitleButton = True
        Width = 113
        OnGetCellParams = dbGridColumns4GetCellParams
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'INITIALS'
        Footers = <>
        Title.Caption = #1048'.'#1054'.'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 83
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 87
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 101
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_BY'
        Footers = <>
        Title.Caption = #1057#1086#1079#1076#1072#1083
        Title.TitleButton = True
        Width = 65
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_ON'
        Footers = <>
        Title.Caption = #1050#1086#1075#1076#1072
        Title.TitleButton = True
        Width = 95
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_BY'
        Footers = <>
        Title.Caption = #1048#1079#1084#1077#1085#1080#1083
        Title.TitleButton = True
        Width = 63
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_ON'
        Footers = <>
        Title.Caption = #1050#1086#1075#1076#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RC_ID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RC_TYPE'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUSTOMER_ID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_ID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CONTACT'
        Footers = <>
        Title.Caption = #1050#1086#1085#1090#1072#1082#1090
        Title.TitleButton = True
        Width = 57
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADD_DATA'
        Footers = <>
        Title.Caption = #1044#1086#1087'. '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
        Title.TitleButton = True
        Width = 75
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'TAG'
        Footers = <>
        Title.Caption = #1052#1077#1090#1082#1080
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RES_NAME'
        Footers = <>
        Title.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
        Title.TitleButton = True
        Width = 61
      end
      item
        Alignment = taLeftJustify
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DIRECT'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1'
          '-1')
        PickList.Strings = (
          #1042#1093'.'
          #1048#1089#1093'.'
          #1042#1089#1077)
        Title.Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
        Title.TitleButton = True
        Width = 91
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RQ_ID'
        Footers = <>
        Title.Caption = #1047#1072#1103#1074#1082#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'TASK_ID'
        Footers = <>
        Title.Caption = #1047#1072#1076#1072#1095#1072
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 852
    ExplicitWidth = 852
    object btnDateFilter: TToolButton
      Left = 186
      Top = 0
      Action = actDateFilter
      DropdownMenu = pmPeriod
      Style = tbsDropDown
    end
    object btn2: TToolButton
      Left = 224
      Top = 0
      Width = 8
      Caption = 'btn2'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object btnFilterCustomer: TToolButton
      Left = 232
      Top = 0
      Action = actFilterCustomer
    end
    object ToolButton7: TToolButton
      Left = 255
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object chkGroup: TCheckBox
      Left = 263
      Top = 0
      Width = 154
      Height = 22
      Alignment = taLeftJustify
      Caption = '  '#1042#1082#1083#1102#1095#1080#1090#1100' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1091
      TabOrder = 0
      OnClick = chkGroupClick
    end
  end
  inherited pnlEdit: TPanel
    Width = 852
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 852
    inherited btnSaveLink: TBitBtn
      Width = 364
      ExplicitWidth = 364
    end
    inherited btnCancelLink: TBitBtn
      Left = 455
      ExplicitLeft = 455
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsRecourses
    OnDataChange = srcDataSourceDataChange
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 69
    Top = 69
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      OnExecute = actEditExecute
    end
    object actDateFilter: TAction [5]
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077
      ImageIndex = 1
      ShortCut = 16452
      OnExecute = actDateFilterExecute
    end
    object actFilterCustomer: TAction [6]
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1089#1087#1080#1089#1082#1077
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      ImageIndex = 9
      OnExecute = actFilterCustomerExecute
    end
  end
  object dsRecourses: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM RECOURSE WHERE (RC_ID = :OLD_RC_ID)')
    RefreshSQL.Strings = (
      'select'
      '  s.street_name'
      '  , h.house_no'
      '  , rt.name'
      '  , o.o_name'
      '  , cast(o.O_Numericfield as INTEGER) DIRECT'
      '  , r.*'
      '  , c.account_no'
      '  , c.surname'
      '  , c.initials'
      '  , t.O_Name RES_NAME'
      'from recourse r'
      '  inner join recourse_templates rt on (r.rc_type = rt.rt_id)'
      '  inner join objects o on (rt.type_id = o.o_id and o.O_TYPE = 8)'
      '  left outer join house h on (h.house_id = r.house_id)'
      '  left outer join street s on (s.street_id = h.street_id)'
      '  left outer join customer c on (r.customer_id = c.customer_id)'
      
        '  left outer join objects t on (t.O_ID = r.Result_Id and t.O_TYP' +
        'E = 81)'
      'where r.Rc_Id = :OLD_Rc_Id')
    SelectSQL.Strings = (
      'select'
      '  s.street_name'
      '  , h.house_no'
      '  , rt.name'
      '  , o.o_name'
      '  , cast(o.O_Numericfield as INTEGER) DIRECT'
      '  , r.*'
      '  , c.account_no'
      '  , c.surname'
      '  , c.initials'
      '  , t.O_Name RES_NAME'
      'from recourse r'
      '  inner join recourse_templates rt on (r.rc_type = rt.rt_id)'
      '  inner join objects o on (rt.type_id = o.o_id and o.O_TYPE = 8)'
      '  left outer join house h on (h.house_id = r.house_id)'
      '  left outer join street s on (s.street_id = h.street_id)'
      '  left outer join customer c on (r.customer_id = c.customer_id)'
      
        '  left outer join objects t on (t.O_ID = r.Result_Id and t.O_TYP' +
        'E = 81)'
      
        'where r.Added_on between :start_date and dateadd(1 day to :end_d' +
        'ate)'
      '@@owned%@'
      'order by r.Added_on desc')
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
  end
  object mtRecourses: TMemTableEh
    Params = <>
    DataDriver = drvRecourses
    Left = 395
    Top = 205
  end
  object drvRecourses: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'RC_ID'
        ParamType = ptUnknown
      end>
    DeleteCommand.CommandText.Strings = (
      'DELETE FROM RECOURSE WHERE RC_ID = :RC_ID')
    GetrecCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'Rc_Id'
        ParamType = ptUnknown
      end>
    GetrecCommand.CommandText.Strings = (
      'select'
      '  s.street_name'
      '  , h.house_no'
      '  , rt.name'
      '  , o.o_name'
      '  , r.*'
      '  , c.account_no'
      '  , c.surname'
      '  , c.initials'
      'from recourse r'
      '  inner join recourse_templates rt on (r.rc_type = rt.rt_id)'
      '  inner join objects o on (rt.type_id = o.o_id and o.O_TYPE = 8)'
      '  inner join house h on (h.house_id = r.house_id)'
      '  inner join street s on (s.street_id = h.street_id)'
      '  left outer join customer c on (r.customer_id = c.customer_id)'
      'where'
      '        R.Rc_Id = :Rc_Id'
      '    ')
    ProviderDataSet = dsRecourses
    KeyFields = 'Rc_Id'
    Left = 470
    Top = 206
  end
end
