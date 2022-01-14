object EQPortForm: TEQPortForm
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1057#1086#1079#1076#1072#1085#1080#1077' '#1087#1086#1088#1090#1072'/'#1086#1074
  ClientHeight = 325
  ClientWidth = 478
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  DesignSize = (
    478
    325)
  PixelsPerInch = 96
  TextHeight = 13
  object lblCNT: TLabel
    Left = 8
    Top = 45
    Width = 74
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1087#1086#1088#1090#1086#1074
  end
  object lblStart: TLabel
    Left = 146
    Top = 45
    Width = 63
    Height = 13
    Caption = #1053#1091#1084#1077#1088#1072#1094#1080#1103' '#1089
  end
  object lbl3: TLabel
    Left = 8
    Top = 71
    Width = 51
    Height = 13
    Caption = #1058#1080#1087' '#1087#1086#1088#1090#1072
  end
  object lbl4: TLabel
    Left = 8
    Top = 148
    Width = 75
    Height = 13
    Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1087#1086#1088#1090
  end
  object lbl5: TLabel
    Left = 8
    Top = 97
    Width = 69
    Height = 13
    Caption = #1057#1090#1072#1090#1091#1089' '#1087#1086#1088#1090#1072
  end
  object lblEquipment: TLabel
    Left = 8
    Top = 8
    Width = 410
    Height = 25
    AutoSize = False
    Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
  end
  object lblVLAN: TLabel
    Left = 8
    Top = 122
    Width = 73
    Height = 13
    Caption = #1057#1077#1090#1100' '#1085#1072' '#1087#1086#1088#1090#1091
  end
  object lblWire: TLabel
    Left = 8
    Top = 173
    Width = 56
    Height = 13
    Caption = #1051#1080#1085#1080' c'#1074#1103#1079#1080
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 282
    Width = 478
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    DesignSize = (
      478
      43)
    object btnCancel: TBitBtn
      Left = 395
      Top = 10
      Width = 75
      Height = 27
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TBitBtn
      Left = 16
      Top = 10
      Width = 370
      Height = 27
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object edtNumber: TDBEditEh
    Left = 217
    Top = 42
    Width = 121
    Height = 21
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1053#1072#1095#1072#1090#1100' '#1085#1091#1084#1077#1088#1072#1094#1080#1102' '#1089
    TabOrder = 1
    Text = '1'
    Visible = True
  end
  object ednCount: TDBNumberEditEh
    Left = 88
    Top = 42
    Width = 49
    Height = 21
    DecimalPlaces = 0
    DynProps = <>
    EmptyDataInfo.Text = #1050#1086#1083'-'#1074#1086
    EditButtons = <>
    TabOrder = 0
    Value = 1.000000000000000000
    Visible = True
  end
  object lcbType: TDBLookupComboboxEh
    Left = 88
    Top = 68
    Width = 382
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    DropDownBox.Columns = <
      item
        FieldName = 'O_NAME'
      end
      item
        FieldName = 'O_DESCRIPTION'
      end>
    EmptyDataInfo.Text = #1058#1080#1087' '#1087#1086#1088#1090#1072
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcType
    TabOrder = 2
    Visible = True
  end
  object mmoNotice: TDBMemoEh
    Left = 8
    Top = 200
    Width = 462
    Height = 84
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    TabOrder = 6
    Visible = True
    WantReturns = True
  end
  object ednSpeed: TDBNumberEditEh
    Left = 88
    Top = 145
    Width = 89
    Height = 21
    DecimalPlaces = 0
    DynProps = <>
    EmptyDataInfo.Text = #1057#1082#1086#1088#1086#1089#1090#1100', '#1052#1041'/'#1089
    EditButtons = <>
    TabOrder = 5
    Visible = True
  end
  object lcbState: TDBLookupComboboxEh
    Left = 88
    Top = 94
    Width = 382
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    DropDownBox.Columns = <
      item
        FieldName = 'O_NAME'
      end
      item
        FieldName = 'O_DESCRIPTION'
      end>
    EmptyDataInfo.Text = #1057#1090#1072#1090#1091#1089' '#1087#1086#1088#1090#1072
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcState
    TabOrder = 3
    Visible = True
  end
  object lcbVLAN: TDBLookupComboboxEh
    Left = 88
    Top = 119
    Width = 382
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    DropDownBox.Columns = <
      item
        FieldName = 'NAME'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Width = 57
      end
      item
        AutoFitColWidth = False
        FieldName = 'IP_BEGIN'
        Title.Caption = 'IP c'
      end
      item
        AutoFitColWidth = False
        FieldName = 'IP_END'
        Title.Caption = 'IP '#1076#1086
      end
      item
        AutoFitColWidth = False
        FieldName = 'C_CNT'
        Title.Caption = #1055#1040
        Title.Hint = #1055#1086#1076#1082'. '#1072#1073#1086#1085#1077#1085#1090#1086#1074
        Width = 30
      end
      item
        AutoFitColWidth = False
        FieldName = 'E_CNT'
        Title.Caption = #1055#1054
        Title.Hint = #1055#1086#1076#1082'. '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
        Width = 30
      end>
    DropDownBox.ListSource = srcVLANS
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterAllColumns = True
    DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
    DropDownBox.SortLocal = True
    DropDownBox.AutoDrop = True
    DropDownBox.ShowTitles = True
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1057#1077#1090#1100' '#1085#1072' '#1087#1086#1088#1090#1091
    EditButtons = <>
    KeyField = 'V_ID'
    ListField = 'NAME_IP'
    ListSource = srcVLANS
    ParentShowHint = False
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 4
    Visible = True
  end
  object lcbWIRE: TDBLookupComboboxEh
    Left = 88
    Top = 170
    Width = 382
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    DropDownBox.Columns = <
      item
        FieldName = 'name'
        Title.Caption = #1051#1080#1085#1080#1103' '#1089#1074#1103#1079#1080
        Width = 70
      end
      item
        FieldName = 'NODE_S'
        Title.Caption = #1059#1079#1077#1083' '#1089
        Width = 35
      end
      item
        FieldName = 'NODE_E'
        Title.Caption = #1059#1079#1077#1083' '#1076#1086
        Width = 35
      end
      item
        AutoFitColWidth = False
        FieldName = 'Capacity'
        Title.Caption = #1045#1084#1082#1086#1089#1090#1100
        Width = 20
      end
      item
        AutoFitColWidth = False
        FieldName = 'FREE'
        Title.Caption = #1057#1074#1086#1073#1086#1076#1085#1086
        Width = 20
      end>
    DropDownBox.ListSource = srcWire
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterAllColumns = True
    DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
    DropDownBox.SortLocal = True
    DropDownBox.AutoDrop = True
    DropDownBox.ShowTitles = True
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1051#1080#1085#1080#1103' '#1089#1074#1103#1079#1080'/'#1082#1072#1073#1077#1083#1100' '#1085#1072' '#1087#1086#1088#1090#1091' '
    EditButtons = <>
    KeyField = 'Wid'
    ListField = 'NAME'
    ListSource = srcWire
    ParentShowHint = False
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 8
    Visible = True
    OnDropDownBoxGetCellParams = lcbWIREDropDownBoxGetCellParams
  end
  object cnError: TCnErrorProvider
    DoubleBuffer = False
    Left = 360
    Top = 16
  end
  object dsType: TpFIBDataSet
    DeleteSQL.Strings = (
      'UPDATE'
      '    REQUEST_TYPES'
      'SET RT_DELETED = 1'
      'WHERE RT_ID = :OLD_RT_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    *'
      '  from request_types t'
      '  where T.RT_ID = :OLD_RT_ID')
    SelectSQL.Strings = (
      'select'
      '    o.O_Id'
      '  , o.O_Name'
      '  , o.O_Description'
      '  from objects o'
      '  where o.O_TYPE = 57'
      '        and o.O_Deleted = 0'
      '  order by o.O_Name  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 24
    Top = 216
  end
  object srcType: TDataSource
    AutoEdit = False
    DataSet = dsType
    Left = 72
    Top = 216
  end
  object dsState: TpFIBDataSet
    DeleteSQL.Strings = (
      'UPDATE'
      '    REQUEST_TYPES'
      'SET RT_DELETED = 1'
      'WHERE RT_ID = :OLD_RT_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    *'
      '  from request_types t'
      '  where T.RT_ID = :OLD_RT_ID')
    SelectSQL.Strings = (
      'select'
      '    o.O_Id'
      '  , o.O_Name'
      '  , o.O_Description'
      '  from objects o'
      '  where o.O_TYPE = 60'
      '        and o.O_Deleted = 0'
      '  order by o.O_Name  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 136
    Top = 216
  end
  object srcState: TDataSource
    AutoEdit = False
    DataSet = dsState
    Left = 176
    Top = 216
  end
  object srcVLANS: TDataSource
    DataSet = dsVlans
    Left = 286
    Top = 210
  end
  object dsVlans: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      ''
      '    ')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    coalesce((select'
      '                  1'
      '                from objects_coverage oc'
      
        '                     inner join customer c on (c.house_id = oc.h' +
        'ouse_id)'
      '                where oc.oc_type = 2'
      '                      and c.customer_id = :CUSTOMER_ID'
      '                      and (v.v_id = oc.o_id)), 2) as finded'
      '  , v.v_id'
      '  , v.name'
      
        '  , v.name || coalesce('#39' / '#39'||v.ip_begin||'#39'-'#39'||v.ip_end, '#39#39') NAM' +
        'E_IP'
      '  , v.ip_begin'
      '  , v.ip_end'
      '  , l.C_CNT'
      '  , e.E_CNT'
      '  from vlans v'
      '       left outer join(select'
      '                           Vlan_Id'
      '                         , count(*) C_CNT'
      '                         from Tv_Lan'
      '                         group by 1) l on (l.Vlan_Id = v.V_Id)'
      '       left outer join(select'
      '                           Vlan_Id'
      '                         , count(*) E_CNT'
      '                         from Equipment'
      '                         group by 1) e on (e.Vlan_Id = v.V_Id)'
      '  where (coalesce(v.for_objects, 0) = 0'
      '          or (coalesce(v.for_objects, 0) = 1))'
      '  order by 1, 2')
    AutoCalcFields = False
    Database = dmMain.dbTV
    Left = 238
    Top = 207
  end
  object dsWire: TpFIBDataSet
    RefreshSQL.Strings = (
      'select'
      '    T.O_NAME CT_NAME'
      '  , t.O_Dimension COLOR'
      '  , C.*'
      '  , m.NAME MAT_NAME'
      '  , s.Node_Id NODE_S_ID'
      '  , s.Name NODE_S'
      '  , e.Node_Id NODE_E_ID'
      '  , e.Name NODE_E'
      '  , ST.O_Name S_TYPE'
      '  , SS.Street_Name || '#39' '#39' || SS.street_short S_STREET'
      '  , SH.House_No S_HOUSE'
      '  , ET.O_Name E_TYPE'
      '  , ES.Street_Name || '#39' '#39' || ES.street_short E_STREET'
      '  , EH.House_No E_HOUSE'
      '  from Wire C'
      
        '       inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O_TYPE = ' +
        '56)'
      ''
      '       inner join NODEs s on (s.Node_Id = c.Point_S)'
      '       inner join HOUSE SH on (SH.HOUSE_ID = S.HOUSE_ID)'
      '       inner join STREET SS on (SS.STREET_ID = SH.STREET_ID)'
      
        '       inner join objects ST on (ST.O_Id = s.Type_Id and ST.O_Ty' +
        'pe = 38)'
      ''
      '       left outer join MATERIALS m on (m.M_Id =  c.M_ID)'
      ''
      '       left outer join NODEs e on (e.Node_Id = c.Point_E)'
      '       left outer join HOUSE EH on (EH.HOUSE_ID = E.HOUSE_ID)'
      
        '       left outer join STREET ES on (ES.STREET_ID = EH.STREET_ID' +
        ')'
      
        '       left outer join objects ET on (ET.O_Id = e.Type_Id and ET' +
        '.O_Type = 38)'
      ''
      ' WHERE '
      '        C.WID = :OLD_WID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    c.Wid'
      '  , C.Name||'#39' ('#39'||T.O_NAME||'#39')'#39' name'
      '  , s.Name NODE_S'
      '  , e.Name NODE_E'
      '  , t.O_Dimension COLOR'
      '  , c.Capacity  '
      
        '  , (coalesce(c.Capacity, 0) - (select count(*) from port p wher' +
        'e p.Wid = c.Wid)) FREE -- '#1090#1091#1090' '#1085#1091#1078#1085#1086' '#1089#1095#1080#1090#1072#1090#1100
      '  from Wire C'
      
        '       inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O_TYPE = ' +
        '56)'
      '       inner join NODEs s on (s.Node_Id = c.Point_S)'
      '       left outer join NODEs e on (e.Node_Id = c.Point_E)'
      '  where (c.Point_S = :node)'
      '          or (c.Point_E = :node)'
      '  order by c.Name ')
    AutoCalcFields = False
    Database = dmMain.dbTV
    Left = 352
    Top = 208
  end
  object srcWire: TDataSource
    AutoEdit = False
    DataSet = dsWire
    Left = 366
    Top = 242
  end
end
