object apgEqpmntInfo: TapgEqpmntInfo
  Left = 0
  Top = 0
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
  ClientHeight = 243
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
    Height = 243
    Color = clBtnFace
    ParentColor = False
  end
  object splR: TSplitter
    Left = 313
    Top = 0
    Height = 243
    Color = clBtnFace
    ParentColor = False
  end
  object pnlInfo: TPanel
    Left = 0
    Top = 0
    Width = 313
    Height = 243
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      313
      243)
    object Label1: TLabel
      Left = 4
      Top = 52
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
      Top = 76
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
      Top = 4
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
      Top = 76
      Width = 31
      Height = 13
      Caption = #1055#1086#1076'-'#1076
    end
    object Label4: TLabel
      Left = 225
      Top = 76
      Width = 19
      Height = 13
      Caption = #1069'-'#1078
    end
    object lbl4: TLabel
      Left = 3
      Top = 28
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
      Top = 100
      Width = 31
      Height = 13
      Caption = #1052#1077#1089#1090#1086
    end
    object lbl5: TLabel
      Left = 3
      Top = 148
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
    object lbl51: TLabel
      Left = 3
      Top = 196
      Width = 53
      Height = 13
      Caption = #1054#1073#1089#1083'. '#1086#1088#1075'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl52: TLabel
      Left = 3
      Top = 220
      Width = 47
      Height = 13
      Caption = #1055#1088#1077#1076#1089'-'#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl6: TLabel
      Left = 3
      Top = 124
      Width = 24
      Height = 13
      Caption = #1059#1079#1077#1083
    end
    object lbl10: TLabel
      Left = 35
      Top = 172
      Width = 19
      Height = 13
      Caption = #1082' IP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbtxtNAME: TDBEditEh
      Left = 58
      Top = 1
      Width = 249
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'NAME'
      DataSource = srcData
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Visible = True
    end
    object dbtxtdbedt1: TDBEditEh
      Left = 184
      Top = 73
      Width = 34
      Height = 24
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'PORCH_N'
      DataSource = srcData
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Visible = True
    end
    object dbtxtDBEdit1: TDBEditEh
      Left = 246
      Top = 73
      Width = 61
      Height = 24
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'FLOOR_N'
      DataSource = srcData
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Visible = True
    end
    object dbtxtDBEdit2: TDBEditEh
      Left = 58
      Top = 97
      Width = 249
      Height = 24
      Hint = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' / '#1071#1097#1080#1082
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'PLACE'
      DataSource = srcData
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Visible = True
    end
    object dbtxtHOUSE: TDBEditEh
      Left = 58
      Top = 73
      Width = 83
      Height = 24
      Hint = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' / '#1071#1097#1080#1082
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'HOUSE_NO'
      DataSource = srcData
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      Visible = True
      OnDblClick = dbtxtHOUSEDblClick
    end
    object dbtxtSTREET: TDBEditEh
      Left = 58
      Top = 49
      Width = 249
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'STREET'
      DataSource = srcData
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Visible = True
      OnDblClick = dbtxtSTREETDblClick
    end
    object dbtxtSTREET1: TDBEditEh
      Left = 58
      Top = 145
      Width = 249
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'parent_name'
      DataSource = srcData
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      Visible = True
    end
    object dbtxtparent_name: TDBEditEh
      Left = 58
      Top = 169
      Width = 249
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'P_IP'
      DataSource = srcData
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
      Visible = True
    end
    object dbtxtparent_name1: TDBEditEh
      Left = 58
      Top = 193
      Width = 249
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'ORG_NAME'
      DataSource = srcData
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
      Visible = True
    end
    object dbtxtparent_name2: TDBEditEh
      Left = 58
      Top = 217
      Width = 249
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'CHAIRMAN'
      DataSource = srcData
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
      Visible = True
    end
    object dbtxtPLACE: TDBEditEh
      Left = 59
      Top = 121
      Width = 248
      Height = 24
      Hint = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' / '#1071#1097#1080#1082
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'NODE'
      DataSource = srcData
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Visible = True
    end
    object edtEQ_TYPE: TDBEditEh
      Left = 58
      Top = 25
      Width = 249
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      DataField = 'ET_NAME'
      DataSource = srcData
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Visible = True
    end
  end
  object pnlMemo: TPanel
    Left = 668
    Top = 0
    Width = 241
    Height = 243
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object lbl2: TLabel
      Left = 0
      Top = 0
      Width = 241
      Height = 13
      Align = alTop
      Caption = ' '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object mmoNotice: TDBMemoEh
      Tag = 9
      Left = 0
      Top = 13
      Width = 241
      Height = 230
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
    Height = 243
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object pgcTypeInfo: TPageControl
      Left = 0
      Top = 0
      Width = 349
      Height = 243
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
          212)
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
          TabOrder = 5
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
          TabOrder = 6
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
          TabOrder = 4
          Visible = True
          EditMask = ''
        end
      end
      object tsTV: TTabSheet
        Caption = #1058#1042
        ImageIndex = 1
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
      '  , CASE e.EQ_TYPE'
      '      when 1 then '#39#1057#1077#1090#1077#1074#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077#39
      '      when 2 then '#39#1050#1072#1073#1077#1083#1100#1085#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077#39
      '      when 3 then '#39#1055#1088#1086#1095#1077#1077#39
      '      else '#39#39
      '    end ET_NAME'
      '  , h.house_no'
      '  , s.street_name || '#39' '#39' || s.street_short as street'
      '  , o.o_name as eqgroup'
      '  , o.O_DIMENSION as COLOR'
      '  , v.name V_NAME'
      '  , p.name as parent_name'
      '  , p.IP as P_IP'
      '  , b.Org_Name'
      
        '  , coalesce(h.Chairman||coalesce('#39' '#1090#1077#1083':'#39'||h.Chairman_Phone, '#39#39')' +
        ', '#39#39') Chairman'
      '  , n.Name || coalesce('#39' / '#39'||nt.O_Name, '#39#39') NODE'
      '  , s.STREET_ID'
      '  from EQUIPMENT E'
      '       left outer join house h on (e.house_id = h.house_id)'
      '       left outer join street s on (s.street_id = h.street_id)'
      
        '       left outer join objects o on (e.eq_group = o.o_id and o.O' +
        '_TYPE = 7)'
      '       left outer join equipment p on (e.parent_id = p.eid)'
      '       left outer join vlans v on (v.V_Id = e.VLAN_ID)'
      '       left outer join ORGANIZATION b on (b.ORG_ID = h.ORG_ID)'
      '       left outer join NODES n on (n.Node_Id = e.Node_Id)'
      
        '       left outer join objects nt on (nt.O_Id = n.Type_Id and nt' +
        '.O_Type = 38)'
      '  where e.eid = :eid')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 259
    Top = 173
  end
  object srcData: TDataSource
    AutoEdit = False
    DataSet = dsData
    OnDataChange = FDataSourceDataChange
    Left = 335
    Top = 187
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
    Left = 251
    Top = 106
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
    Left = 259
    Top = 130
  end
end
