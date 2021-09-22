inherited DVBEquipmentForm: TDVBEquipmentForm
  Left = 411
  Top = 154
  Caption = #1062#1080#1092#1088#1086#1074#1099#1077' '#1076#1077#1082#1086#1076#1077#1088#1099' '#1080' STB/CAM'
  ClientHeight = 422
  ClientWidth = 778
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object splitter: TSplitter [0]
    Left = 0
    Top = 290
    Width = 778
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Visible = False
  end
  inherited dbGrid: TDBGridEh
    Width = 778
    Height = 209
    AllowedOperations = []
    FooterRowCount = 1
    SumList.Active = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'eq_type_name'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'eq_n'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'man_name'
        Footers = <>
        Title.Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
        Title.TitleButton = True
        Width = 108
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STATE_NAME'
        Footers = <>
        Title.Caption = #1057#1090#1072#1090#1091#1089
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
        Width = 76
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACCOUNT_NO'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1051#1080#1094#1077#1074#1086#1081
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1050#1086#1076
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FIO'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1060#1048#1054
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DEBT_SUM'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1057#1072#1083#1100#1076#1086
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_NAME'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1059#1083#1080#1094#1072
        Title.TitleButton = True
        Width = 111
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_NO'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1044#1086#1084
        Title.TitleButton = True
        Width = 47
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLAT_NO'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1050#1074'.'
        Title.TitleButton = True
        Width = 36
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_BY'
        Footers = <>
        Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085'|'#1050#1077#1084
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_ON'
        Footers = <>
        Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085'|'#1050#1086#1075#1076#1072
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 778
    inherited ToolButton9: TToolButton
      Visible = False
    end
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
    end
    object btn2: TToolButton
      Left = 178
      Top = 0
      Width = 8
      Caption = 'btn2'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object btnHistory: TToolButton
      Left = 186
      Top = 0
      Action = actHistory
    end
    object btn1: TToolButton
      Left = 209
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object btnFindCustomer: TToolButton
      Left = 217
      Top = 0
      Action = actFindCustomer
    end
  end
  inherited pnlEdit: TPanel
    Width = 778
  end
  object pnlHistory: TPanel [4]
    Left = 0
    Top = 293
    Width = 778
    Height = 129
    Align = alBottom
    Caption = 'pnlHistory'
    TabOrder = 3
    Visible = False
    object dbgHistory: TDBGridEh
      Left = 28
      Top = 1
      Width = 749
      Height = 127
      Align = alClient
      AllowedOperations = []
      DataSource = srcHistory
      DynProps = <>
      Flat = True
      TabOrder = 1
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EDIT_BY'
          Footers = <>
          Title.Caption = #1050#1090#1086
          Width = 87
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EDIT_ON'
          Footers = <>
          Title.Caption = #1050#1086#1075#1076#1072
          Width = 82
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STATE_NAME'
          Footers = <>
          Title.Caption = #1063#1090#1086
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ACCOUNT_NO'
          Footers = <>
          Title.Caption = #1051#1080#1094#1077#1074#1086#1081
          Width = 64
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FIO'
          Footers = <>
          Title.Caption = #1060#1048#1054
          Width = 143
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DEBT_SUM'
          Footers = <>
          Title.Caption = #1057#1072#1083#1100#1076#1086
          Width = 59
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STREET_NAME'
          Footers = <>
          Title.Caption = #1059#1083#1080#1094#1072
          Width = 138
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'HOUSE_NO'
          Footers = <>
          Title.Caption = #1044#1086#1084
          Width = 34
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FLAT_NO'
          Footers = <>
          Title.Caption = #1050#1074'.'
          Width = 35
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 27
      Height = 127
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object btnCustHist: TSpeedButton
        Left = 3
        Top = 2
        Width = 23
        Height = 22
        Action = actCustHist
        Flat = True
      end
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsEQ
    OnDataChange = srcDataSourceDataChange
    Left = 64
    Top = 160
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 118
    Top = 184
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1077#1082#1086#1076#1077#1088#1099
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = actEditExecute
    end
    object actHistory: TAction
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1082#1072#1088#1090#1086#1095#1082#1080
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1089#1090#1086#1088#1080#1102' '#1082#1072#1088#1090#1086#1095#1082#1080
      ImageIndex = 34
      OnExecute = actHistoryExecute
    end
    object actFindCustomer: TAction
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072'/'#1086#1074' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1082#1072#1088#1090
      ImageIndex = 9
      OnExecute = actFindCustomerExecute
    end
    object actCustHist: TAction
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072'/'#1086#1074' '#1080#1079' '#1080#1089#1090#1086#1088#1080#1080' '#1082#1072#1088#1090#1099
      ImageIndex = 9
      OnExecute = actCustHistExecute
    end
  end
  object dsEQ: TpFIBDataSet
    DeleteSQL.Strings = (
      'delete from EQUIPMENT_DVB e'
      'where e.Eq_Id = :OLD_EQ_ID'
      '      and (not exists(select *'
      '                        from Customer_Decoders d'
      '                        where d.Decoder_N = :OLD_EQ_N))'
      ''
      '  ')
    RefreshSQL.Strings = (
      'select '
      '    d.eq_id,'
      '    d.eq_type,'
      '    t.o_name eq_type_name,'
      '    d.eq_n,'
      '    d.eq_state,'
      '    case d.eq_state'
      '      when 0 then '#39#1059#1076#1072#1083#1077#1085#39
      '      when 1 then '#39#1053#1072' '#1089#1082#1083#1072#1076#1077#39
      '      when 2 then '#39#1042#1099#1076#1072#1085#39
      '      when 3 then '#39#1059#1090#1077#1088#1103#1085'/'#1057#1087#1080#1089#1072#1085#39
      '      when 4 then '#39#1042' '#1088#1077#1084#1086#1085#1090#1077#39'       '
      '      else '#39#1053#1077#1087#1086#1085#1103#1090#1082#1080#39
      '    end state_name,'
      '    d.eq_man,'
      '    m.o_name man_name,'
      '    d.notice,'
      '    c.customer_id, '
      '    c.account_no,'
      '    c.cust_code,'
      '    c.surname||coalesce('#39' '#39'||c.initials,'#39#39') fio,'
      '    c.debt_sum,'
      '    s.street_name,'
      '    h.house_no,'
      '    c.flat_no,'
      '    d.added_by,'
      '    d.added_on'
      'from EQUIPMENT_DVB  d'
      
        '   left outer join customer_decoders cd on ((d.eq_n = cd.decoder' +
        '_n and d.eq_type = 0)'
      
        '                                             or (d.eq_n = cd.stb' +
        '_n and d.eq_type > 0))'
      
        '   left outer join customer c on (cd.customer_id = c.customer_id' +
        ')'
      '   left outer join house h on (c.house_id = h.house_id)'
      '   left outer join street s on (h.street_id = s.street_id)'
      
        '   left outer join objects t on (t.o_id = d.eq_type and t.o_type' +
        ' = 19)'
      
        '   left outer join objects m on (m.o_id = d.eq_man and m.o_type ' +
        '= 18)'
      'where'
      '        D.EQ_N = :OLD_DECODER_N'
      '    ')
    SelectSQL.Strings = (
      'select '
      '    d.eq_id,'
      '    d.eq_type,'
      '    t.o_name eq_type_name,'
      '    d.eq_n,'
      '    d.eq_state,'
      '    case d.eq_state'
      '      when 0 then '#39#1059#1076#1072#1083#1077#1085#39
      '      when 1 then '#39#1053#1072' '#1089#1082#1083#1072#1076#1077#39
      '      when 2 then '#39#1042#1099#1076#1072#1085#39
      '      when 3 then '#39#1059#1090#1077#1088#1103#1085'/'#1057#1087#1080#1089#1072#1085#39
      '      when 4 then '#39#1042' '#1088#1077#1084#1086#1085#1090#1077#39'      '
      '      else '#39#1053#1077#1087#1086#1085#1103#1090#1082#1080#39
      '    end state_name,'
      '    d.eq_man,'
      '    m.o_name man_name,'
      '    d.notice,'
      '    c.CUSTOMER_ID,'
      '    c.account_no,'
      '    c.cust_code,'
      '    c.surname||coalesce('#39' '#39'||c.initials,'#39#39') fio,'
      '    c.debt_sum,'
      '    s.street_name,'
      '    h.house_no,'
      '    c.flat_no,'
      '    d.added_by,'
      '    d.added_on'
      'from EQUIPMENT_DVB  d'
      
        '   left outer join customer_decoders cd on ((d.eq_n = cd.decoder' +
        '_n)or (d.eq_n = cd.stb_n))'
      
        '   left outer join customer c on (cd.customer_id = c.customer_id' +
        ' @@SupeMode@)      '
      '   left outer join house h on (c.house_id = h.house_id)'
      '   left outer join street s on (h.street_id = s.street_id)'
      
        '   left outer join objects t on (t.o_id = d.eq_type and t.o_type' +
        ' = 19)'
      
        '   left outer join objects m on (m.o_id = d.eq_man and m.o_type ' +
        '= 18)'
      ''
      'order by d.eq_type, d.eq_n')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 143
    Top = 76
  end
  object dsHistory: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '    eh.Edit_By,'
      '    eh.Edit_On,'
      '    case eh.Eq_State'
      '      when 0 then '#39#1059#1076#1072#1083#1077#1085#39
      '      when 1 then '#39#1053#1072' '#1089#1082#1083#1072#1076#1077#39
      '      when 2 then '#39#1042#1099#1076#1072#1085#39
      '      when 3 then '#39#1059#1090#1077#1088#1103#1085'/'#1057#1087#1080#1089#1072#1085#39
      '      when 4 then '#39#1042' '#1088#1077#1084#1086#1085#1090#1077#39'      '
      '      else '#39#1053#1077#1087#1086#1085#1103#1090#1082#1080#39
      '    end state_name,'
      '    c.account_no,'
      '    c.cust_code,'
      '    c.surname||coalesce('#39' '#39'||c.initials,'#39#39') fio,'
      '    c.debt_sum,'
      '    s.street_name,'
      '    h.house_no,'
      '    c.flat_no,'
      '    eh.customer_id'
      'from Equipment_History eh'
      
        '   left outer join customer c on (eh.customer_id = c.customer_id' +
        ')'
      '   left outer join house h on (c.house_id = h.house_id)'
      '   left outer join street s on (h.street_id = s.street_id)'
      'where eh.Eq_N = :Eq_N'
      'order by eh.Edit_On desc')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcDataSource
    Left = 272
    Top = 352
  end
  object srcHistory: TDataSource
    AutoEdit = False
    DataSet = dsHistory
    Left = 344
    Top = 352
  end
end
