object apgEqpmntInfo: TapgEqpmntInfo
  Left = 0
  Top = 0
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
  ClientHeight = 235
  ClientWidth = 909
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object splMemo: TSplitter
    Left = 665
    Top = 0
    Height = 235
    Color = clBtnFace
    ParentColor = False
  end
  object splR: TSplitter
    Left = 313
    Top = 0
    Height = 235
    Color = clBtnFace
    ParentColor = False
  end
  object pnlInfo: TPanel
    Left = 0
    Top = 0
    Width = 313
    Height = 235
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 47
      Width = 31
      Height = 13
      Caption = #1059#1083#1080#1094#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 4
      Top = 69
      Width = 20
      Height = 13
      Caption = #1044#1086#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 4
      Top = 3
      Width = 48
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 147
      Top = 69
      Width = 31
      Height = 13
      Caption = #1055#1086#1076'-'#1076
    end
    object Label4: TLabel
      Left = 224
      Top = 69
      Width = 19
      Height = 13
      Caption = #1069'-'#1078
    end
    object lbl4: TLabel
      Left = 3
      Top = 25
      Width = 18
      Height = 13
      Caption = #1058#1080#1087
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 4
      Top = 91
      Width = 31
      Height = 13
      Caption = #1052#1077#1089#1090#1086
    end
    object dbtxtNAME: TDBText
      Left = 58
      Top = 1
      Width = 71
      Height = 16
      AutoSize = True
      Color = clBtnFace
      DataField = 'NAME'
      DataSource = srcData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbtxtdbedt1: TDBText
      Left = 184
      Top = 67
      Width = 81
      Height = 16
      AutoSize = True
      Color = clBtnFace
      DataField = 'PORCH_N'
      DataSource = srcData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbtxtDBEdit1: TDBText
      Left = 246
      Top = 67
      Width = 84
      Height = 16
      AutoSize = True
      Color = clBtnFace
      DataField = 'FLOOR_N'
      DataSource = srcData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbtxtDBEdit2: TDBText
      Left = 58
      Top = 89
      Width = 84
      Height = 16
      Hint = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' / '#1071#1097#1080#1082
      AutoSize = True
      Color = clBtnFace
      DataField = 'PLACE'
      DataSource = srcData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbtxtHOUSE: TDBText
      Left = 58
      Top = 67
      Width = 76
      Height = 16
      Hint = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' / '#1071#1097#1080#1082
      AutoSize = True
      Color = clBtnFace
      DataField = 'HOUSE_NO'
      DataSource = srcData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbtxtSTREET: TDBText
      Left = 58
      Top = 45
      Width = 80
      Height = 16
      AutoSize = True
      Color = clBtnFace
      DataField = 'STREET'
      DataSource = srcData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 3
      Top = 113
      Width = 51
      Height = 13
      Caption = #1055#1086#1076#1082#1083'-'#1085' '#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbtxtSTREET1: TDBText
      Left = 58
      Top = 111
      Width = 88
      Height = 16
      AutoSize = True
      Color = clBtnFace
      DataField = 'parent_name'
      DataSource = srcData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object dbtxtparent_name: TDBText
      Left = 58
      Top = 133
      Width = 122
      Height = 16
      AutoSize = True
      Color = clBtnFace
      DataField = 'P_IP'
      DataSource = srcData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object cbTypeEQ: TDBComboBoxEh
      Left = 58
      Top = 23
      Width = 159
      Height = 16
      AutoSelect = False
      BorderStyle = bsNone
      Color = clBtnFace
      Ctl3D = False
      DataField = 'EQ_TYPE'
      DataSource = srcData
      DynProps = <>
      EditButton.Visible = False
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Items.Strings = (
        #1057#1077#1090#1077#1074#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        #1050#1072#1073#1077#1083#1100#1085#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        #1055#1088#1086#1095#1077#1077)
      KeyItems.Strings = (
        '1'
        '2'
        '3')
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
  end
  object pnlMemo: TPanel
    Left = 668
    Top = 0
    Width = 241
    Height = 235
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object lbl2: TLabel
      Left = 0
      Top = 0
      Width = 241
      Height = 13
      Align = alTop
      Caption = ' '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ExplicitWidth = 64
    end
    object mmoNotice: TDBMemoEh
      Tag = 9
      Left = 0
      Top = 13
      Width = 241
      Height = 222
      ScrollBars = ssVertical
      Align = alClient
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1056#1077#1076#1072#1082#1090#1080#1088#1091#1077#1084#1086#1077' '#1087#1086#1083#1077
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = True
      WantReturns = True
      OnChange = mmoNoticeChange
      OnExit = mmoNoticeExit
    end
  end
  object pnlPages: TPanel
    Left = 316
    Top = 0
    Width = 349
    Height = 235
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    object pgcTypeInfo: TPageControl
      Left = 0
      Top = 0
      Width = 349
      Height = 235
      ActivePage = tsLan
      Align = alClient
      DoubleBuffered = True
      ParentDoubleBuffered = False
      Style = tsFlatButtons
      TabOrder = 0
      StyleElements = [seFont, seClient]
      object tsLan: TTabSheet
        Caption = #1057#1077#1090#1100
        DesignSize = (
          341
          204)
        object Label6: TLabel
          Left = 0
          Top = 3
          Width = 22
          Height = 13
          Caption = #1052#1040#1057
        end
        object Label7: TLabel
          Left = 0
          Top = 26
          Width = 10
          Height = 13
          Caption = 'IP'
        end
        object Label8: TLabel
          Left = 0
          Top = 49
          Width = 27
          Height = 13
          Caption = 'MASK'
        end
        object lbl3: TLabel
          Left = 0
          Top = 96
          Width = 25
          Height = 13
          Caption = 'VLAN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 0
          Top = 119
          Width = 36
          Height = 13
          Caption = #1043#1088#1091#1087#1087#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 0
          Top = 72
          Width = 22
          Height = 13
          Caption = 'IPv6'
        end
        object eMAC: TDBEditEh
          Left = 37
          Top = 0
          Width = 304
          Height = 21
          Hint = #1052#1040#1057' '#1072#1076#1088#1077#1089
          Anchors = [akLeft, akTop, akRight]
          DataField = 'MAC'
          DataSource = srcData
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = 'MAC'
          MaxLength = 17
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          Visible = True
          EditMask = 'AA:AA:AA:AA:AA:AA'
        end
        object eIP: TDBEditEh
          Left = 37
          Top = 23
          Width = 304
          Height = 21
          Hint = 'IP '#1072#1076#1088#1077#1089
          Anchors = [akLeft, akTop, akRight]
          DataField = 'IP'
          DataSource = srcData
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = 'IP '#1072#1076#1088#1077#1089
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
          Visible = True
          EditMask = ''
        end
        object DBEditEh1: TDBEditEh
          Left = 37
          Top = 46
          Width = 304
          Height = 21
          Hint = #1052#1072#1089#1082#1072' '#1089#1077#1090#1080
          Anchors = [akLeft, akTop, akRight]
          DataField = 'MASK'
          DataSource = srcData
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1052#1072#1089#1082#1072' '#1089#1077#1090#1080
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 2
          Visible = True
          EditMask = ''
        end
        object edtGroup: TDBEditEh
          Left = 37
          Top = 116
          Width = 304
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'EQGROUP'
          DataSource = srcData
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1043#1088#1091#1087#1087#1072' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 4
          Visible = True
        end
        object edtIP: TDBEditEh
          Left = 37
          Top = 69
          Width = 304
          Height = 21
          Hint = 'IP '#1072#1076#1088#1077#1089
          Anchors = [akLeft, akTop, akRight]
          DataField = 'IPV6'
          DataSource = srcData
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = 'IP v6'
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 3
          Visible = True
          EditMask = ''
        end
        object btnCMD: TButton
          Left = 37
          Top = 139
          Width = 304
          Height = 19
          Anchors = [akLeft, akTop, akRight]
          Caption = 'CMD'
          TabOrder = 5
          OnClick = btnCMDClick
        end
        object edtIPV6: TDBEditEh
          Left = 37
          Top = 93
          Width = 304
          Height = 21
          Hint = 'IP '#1072#1076#1088#1077#1089
          Anchors = [akLeft, akTop, akRight]
          DataField = 'V_NAME'
          DataSource = srcData
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = 'VLAN'
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 6
          Visible = True
          EditMask = ''
        end
      end
      object tsTV: TTabSheet
        Caption = #1058#1042
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object lbl7: TLabel
          Left = 3
          Top = 29
          Width = 25
          Height = 13
          Caption = #1057#1077#1090#1100
        end
        object lbl9: TLabel
          Left = 3
          Top = 79
          Width = 97
          Height = 13
          Caption = #1059#1088#1086#1074#1077#1085#1100' '#1074#1099#1093#1086#1076#1085#1086#1081
        end
        object lbl8: TLabel
          Left = 3
          Top = 54
          Width = 89
          Height = 13
          Caption = #1059#1088#1086#1074#1077#1085#1100' '#1074#1093#1086#1076#1085#1086#1081
        end
        object dbckActive: TDBCheckBoxEh
          Left = 3
          Top = 3
          Width = 116
          Height = 18
          Alignment = taLeftJustify
          Caption = #1040#1082#1090#1080#1074#1085#1086#1077
          DataField = 'EQ_ACTIVE'
          DynProps = <>
          ReadOnly = True
          TabOrder = 0
        end
        object cbbLine: TDBComboBoxEh
          Left = 106
          Top = 26
          Width = 121
          Height = 21
          DataField = 'EQ_LINE'
          DynProps = <>
          EditButtons = <>
          Items.Strings = (
            #1052#1072#1075#1080#1089#1090#1088'.'
            #1044#1086#1084#1086#1074#1072#1103)
          KeyItems.Strings = (
            '0'
            '1')
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
          Visible = True
        end
        object edSIN: TDBNumberEditEh
          Left = 106
          Top = 51
          Width = 121
          Height = 21
          DataField = 'SIGNAL_IN'
          DynProps = <>
          EditButtons = <>
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 2
          Visible = True
        end
        object edSOUT: TDBNumberEditEh
          Left = 106
          Top = 76
          Width = 121
          Height = 21
          DataField = 'SIGNAL_OUT'
          DynProps = <>
          EditButtons = <>
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 3
          Visible = True
        end
      end
      object tsOther: TTabSheet
        Caption = #1055#1088#1086#1095#1077#1077
        ImageIndex = 2
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
      end
    end
  end
  object pmLanPopUp: TPopupMenu
    Left = 693
    Top = 47
  end
  object actlstLAN: TActionList
    Left = 770
    Top = 47
    object ActLanPing: TAction
      Caption = 'PING IP adress'
      Hint = 'PING IP adress'
      OnExecute = ActLanPingExecute
    end
    object actLanTelnet: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' IP '#1074' '#1090#1077#1083#1085#1077#1090
      Hint = #1054#1090#1082#1088#1099#1090#1100' IP '#1074' '#1090#1077#1083#1085#1077#1090
      OnExecute = actLanTelnetExecute
    end
    object actLanHttp: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077' IP'
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077' IP'
      OnExecute = actLanHttpExecute
    end
    object actParentPing: TAction
      Caption = 'PING '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1082
      OnExecute = actParentPingExecute
    end
    object actParentTelnet: TAction
      Caption = 'Telnet '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1082
      OnExecute = actParentTelnetExecute
    end
    object actParentWeb: TAction
      Caption = 'Web '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1082
      OnExecute = actParentWebExecute
    end
    object actLanHttpName: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077' '#1048#1052#1071
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077' '#1089#1089#1099#1083#1082#1091' '#1048#1052#1071' '#1086#1073#1088#1091#1076#1086#1074#1072#1085#1080#1103
      OnExecute = actLanHttpNameExecute
    end
    object actLanHttpUserLoginIP: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077' Login:Password@IP'
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077' IP '#1089' '#1087#1077#1088#1077#1076#1072#1095#1077#1081' Login:Password'
      OnExecute = actLanHttpUserLoginIPExecute
    end
  end
  object dsData: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE EQUIPMENT SET NOTICE = :NOTICE WHERE EID = :OLD_EID')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EQUIPMENT_COVERAGE'
      'WHERE'
      '        EID = :OLD_EID'
      '    and HOUSE_ID = :OLD_HOUSE_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    E.*'
      '  , h.house_no'
      '  , s.street_name || '#39' '#39' || s.street_short as street'
      '  , o.o_name as eqgroup'
      '  , o.O_DIMENSION as COLOR'
      '  , v.name V_NAME'
      '  , p.name as parent_name'
      '  from EQUIPMENT E'
      '       left outer join house h on (e.house_id = h.house_id)'
      '       left outer join street s on (s.street_id = h.street_id)'
      
        '       left outer join objects o on (e.eq_group = o.o_id and o.O' +
        '_TYPE = 7)'
      '       left outer join equipment p on (e.parent_id = p.eid)'
      
        '       left outer join vlans v on (v.V_Id = e.VLAN_ID)          ' +
        '    '
      '  where e.eid = :OLD_EID')
    SelectSQL.Strings = (
      'select'
      '    E.*'
      '  , h.house_no'
      '  , s.street_name || '#39' '#39' || s.street_short as street'
      '  , o.o_name as eqgroup'
      '  , o.O_DIMENSION as COLOR'
      '  , v.name V_NAME'
      '  , p.name as parent_name'
      '  , p.IP as P_IP'
      '  from EQUIPMENT E'
      '       left outer join house h on (e.house_id = h.house_id)'
      '       left outer join street s on (s.street_id = h.street_id)'
      
        '       left outer join objects o on (e.eq_group = o.o_id and o.O' +
        '_TYPE = 7)'
      '       left outer join equipment p on (e.parent_id = p.eid)'
      
        '       left outer join vlans v on (v.V_Id = e.VLAN_ID)          ' +
        '         '
      '  where e.eid = :eid'
      '')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 59
    Top = 141
  end
  object srcData: TDataSource
    AutoEdit = False
    DataSet = dsData
    OnDataChange = FDataSourceDataChange
    Left = 111
    Top = 139
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
    Left = 171
    Top = 138
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
    Left = 219
    Top = 138
  end
end
