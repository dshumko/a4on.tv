inherited PortListForm: TPortListForm
  Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1088#1090#1086#1074' '#1074' '#1089#1077#1090#1080
  ClientHeight = 424
  ClientWidth = 782
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Width = 782
  end
  inherited dbGrid: TDBGridEh
    Width = 782
    Height = 340
    FooterRowCount = 1
    SortLocal = False
    SumList.Active = True
    OnSortMarkingChanged = dbGridSortMarkingChanged
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EQ_NAME'
        Footers = <>
        Title.Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 95
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Port'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1055#1086#1088#1090
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PS_NAME'
        Footers = <>
        Title.Caption = #1057#1090#1072#1090#1091#1089
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Notice'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1087#1086#1088#1090#1072
        Title.TitleButton = True
        Width = 94
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PT_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Speed'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1057#1082#1086#1088#1086#1089#1090#1100', '#1052#1041'/'#1089
        Title.TitleButton = True
        Width = 65
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Ip'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Mac'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'street'
        Footers = <>
        Title.Caption = #1059#1083#1080#1094#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'house_no'
        Footers = <>
        Title.Caption = #1044#1086#1084
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'eqgroup'
        Footers = <>
        Title.Caption = #1043#1088#1091#1087#1087#1072
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
        FieldName = 'node_type'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1091#1079#1083#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CON'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1'
          '2')
        PickList.Strings = (
          #1086#1073#1086#1088'-'#1080#1077
          #1072#1073#1086#1085#1077#1085#1090
          #1082#1072#1073#1077#1083#1100)
        Title.Caption = #1053#1072' '#1087#1086#1088#1090#1091'|'#1058#1080#1087
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'OP_NAME'
        Footers = <>
        Title.Caption = #1053#1072' '#1087#1086#1088#1090#1091'|'#1053#1072#1079#1074#1072#1085#1080#1077
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'OP_IP'
        Footers = <>
        Title.Caption = #1053#1072' '#1087#1086#1088#1090#1091'|IP'
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'OP_MAC'
        Footers = <>
        Title.Caption = #1053#1072' '#1087#1086#1088#1090#1091'|MAC'
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'V_NAME'
        Footers = <>
        Title.Caption = 'VLAN|'#1057#1077#1090#1100
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IP_BEGIN'
        Footers = <>
        Title.Caption = 'VLAN|IP '#1089
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IP_END'
        Footers = <>
        Title.Caption = 'VLAN|IP '#1087#1086
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 782
    inherited btnNew: TToolButton
      Visible = False
    end
    inherited ToolButton5: TToolButton
      Visible = False
    end
    inherited ToolButton6: TToolButton
      Visible = False
    end
    inherited btnDelete: TToolButton
      Visible = False
    end
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
    inherited ToolButton20: TToolButton
      Visible = False
    end
    inherited btnQuickFilter: TToolButton
      Visible = False
    end
  end
  inherited pnlEdit: TPanel
    Width = 782
    inherited btnSaveLink: TBitBtn
      Width = 596
    end
    inherited btnCancelLink: TBitBtn
      Left = 687
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsPort
  end
  inherited actions: TActionList
    inherited actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1088#1090
      OnExecute = actEditExecute
    end
  end
  object dsPort: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      ''
      '    ')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      'select'
      '  E.Name EQ_NAME'
      '  , p.Port'
      '  , p.Notice'
      '  , pt.O_Name PT_NAME'
      '  , p.Speed'
      '  , p.CON'
      '  , p.P_STATE'
      '  , e.Ip'
      '  , e.Mac'
      '  , s.street_name || '#39' '#39' || s.street_short as street'
      '  , h.house_no'
      '  , eg.o_name as eqgroup'
      '  , eg.O_DIMENSION as COLOR'
      '  , n.NAME NODE_NAME'
      '  , nt.o_name as node_type'
      '  , p.Eid '
      '  , e.eq_group'
      '  , p.P_Type'
      '  , n.Type_Id'
      '  , e.eq_type'
      '  , p.Con'
      '  , coalesce(cc.Account_No, ce.Name, '#39#39') OP_NAME'
      '  , coalesce(l.Ip, ce.Ip, '#39#39') OP_IP'
      '  , coalesce(l.MAC, ce.MAC, '#39#39') OP_MAC'
      '  , ps.O_Name PS_NAME'
      '  , v.Name V_NAME'
      '  , v.Ip_Begin'
      '  , v.Ip_End'
      '  from port p'
      
        '       inner join objects pt on (p.P_Type = pt.O_Id and pt.O_Typ' +
        'e = 57)'
      
        '       inner join objects ps on (p.P_State = ps.O_Id and ps.O_Ty' +
        'pe = 60)'
      '       inner join EQUIPMENT E on (e.Eid = p.Eid)'
      '       left outer join vlans v on (v.V_Id = p.Vlan_Id)'
      '       left outer join house h on (e.house_id = h.house_id)'
      '       left outer join street s on (s.street_id = h.street_id)'
      
        '       left outer join objects eg on (e.eq_group = eg.o_id and e' +
        'g.O_TYPE = 7)'
      '       left outer join nodes n on (n.NODE_ID = e.NODE_ID)'
      
        '       left outer join objects nt on (nt.O_Id = n.Type_Id and eg' +
        '.O_Type = 38)'
      
        '       left outer join EQUIPMENT ce on (ce.Eid = p.Con_Id and p.' +
        'Con = 0)'
      
        '       left outer join customer cc on (cc.Customer_Id = p.Con_Id' +
        ' and p.Con = 1)'
      
        '       left outer join tv_lan l on (l.Customer_Id = cc.Customer_' +
        'Id and l.Port = p.Port)'
      'WHERE'
      '        P.PORT = :OLD_PORT'
      '    and P.EID = :OLD_EID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '  E.Name EQ_NAME'
      '  , p.Port'
      '  , p.Notice'
      '  , pt.O_Name PT_NAME'
      '  , p.Speed'
      '  , p.CON'
      '  , p.P_STATE'
      '  , e.Ip'
      '  , e.Mac'
      '  , s.street_name || '#39' '#39' || s.street_short as street'
      '  , h.house_no'
      '  , eg.o_name as eqgroup'
      '  , eg.O_DIMENSION as COLOR'
      '  , n.NAME NODE_NAME'
      '  , nt.o_name as node_type'
      '  , p.Eid '
      '  , e.eq_group'
      '  , p.P_Type'
      '  , n.Type_Id'
      '  , e.eq_type'
      '  , p.Con'
      '  , coalesce(cc.Account_No, ce.Name, '#39#39') OP_NAME'
      '  , coalesce(l.Ip, ce.Ip, '#39#39') OP_IP'
      '  , coalesce(l.MAC, ce.MAC, '#39#39') OP_MAC'
      '  , ps.O_Name PS_NAME'
      '  , v.Name V_NAME'
      '  , v.Ip_Begin'
      '  , v.Ip_End'
      '  from port p'
      
        '       inner join objects pt on (p.P_Type = pt.O_Id and pt.O_Typ' +
        'e = 57)'
      
        '       inner join objects ps on (p.P_State = ps.O_Id and ps.O_Ty' +
        'pe = 60)'
      '       inner join EQUIPMENT E on (e.Eid = p.Eid)'
      '       left outer join vlans v on (v.V_Id = p.Vlan_Id)'
      '       left outer join house h on (e.house_id = h.house_id)'
      '       left outer join street s on (s.street_id = h.street_id)'
      
        '       left outer join objects eg on (e.eq_group = eg.o_id and e' +
        'g.O_TYPE = 7)'
      '       left outer join nodes n on (n.NODE_ID = e.NODE_ID)'
      
        '       left outer join objects nt on (nt.O_Id = n.Type_Id and eg' +
        '.O_Type = 38)'
      
        '       left outer join EQUIPMENT ce on (ce.Eid = p.Con_Id and p.' +
        'Con = 0)'
      
        '       left outer join customer cc on (cc.Customer_Id = p.Con_Id' +
        ' and p.Con = 1)'
      
        '       left outer join tv_lan l on (l.Customer_Id = cc.Customer_' +
        'Id and l.Port = p.Port)'
      'order by p.Port')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    Left = 184
    Top = 224
    oFetchAll = True
  end
end
