object CustomerLanForm: TCustomerLanForm
  Left = 593
  Top = 259
  ActiveControl = dbleEquipment
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1057#1055#1044
  ClientHeight = 382
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    535
    382)
  PixelsPerInch = 96
  TextHeight = 13
  inline OkCancelFrame: TOkCancelFrame
    Left = 0
    Top = 347
    Width = 535
    Height = 35
    Align = alBottom
    TabOrder = 4
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 74
      Width = 364
      Height = 27
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ModalResult = 0
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 445
      Width = 85
      Height = 27
      OnClick = OkCancelFrame1bbCancelClick
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 156
    Width = 535
    Height = 153
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      535
      153)
    object Label4: TLabel
      Left = 5
      Top = 7
      Width = 25
      Height = 13
      Caption = #1055#1086#1088#1090
    end
    object Label2: TLabel
      Left = 5
      Top = 81
      Width = 22
      Height = 13
      Caption = 'MAC'
    end
    object Label1: TLabel
      Left = 5
      Top = 56
      Width = 10
      Height = 13
      Caption = 'IP'
    end
    object lbl3: TLabel
      Left = 5
      Top = 31
      Width = 25
      Height = 13
      Caption = #1057#1077#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 5
      Top = 105
      Width = 22
      Height = 13
      Caption = 'IPv6'
    end
    object lbl2: TLabel
      Left = 5
      Top = 130
      Width = 20
      Height = 13
      Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1076#1083#1103' '#1074#1085#1091#1090#1088#1077#1085#1085#1086#1075#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103
      Caption = 'TAG'
    end
    object eMAC: TDBEditEh
      Left = 74
      Top = 78
      Width = 456
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      DataField = 'MAC'
      DataSource = srcLan
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'MAC '#1072#1076#1088#1077#1089
      ShowHint = True
      TabOrder = 4
      Visible = True
      OnEnter = eMACEnter
      OnExit = eMACExit
      EditMask = ''
    end
    object eIP: TDBEditEh
      Left = 74
      Top = 53
      Width = 456
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'IP'
      DataSource = srcLan
      DynProps = <>
      EditButtons = <
        item
          Hint = #1053#1072#1081#1090#1080' IP'
          Style = ebsEllipsisEh
          OnClick = eIPEditButtons0Click
        end>
      EmptyDataInfo.Text = 'IP '#1072#1076#1088#1077#1089
      ShowHint = True
      TabOrder = 3
      Visible = True
      OnEnter = eIPEnter
      OnExit = eIPExit
    end
    object dbleVLAN: TDBLookupComboboxEh
      Left = 74
      Top = 28
      Width = 456
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'VLAN_ID'
      DataSource = srcLan
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
      EmptyDataInfo.Text = #1042' '#1082#1072#1082#1086#1081' '#1089#1077#1090#1080' '#1088#1072#1073#1086#1090#1072#1077#1090
      EditButtons = <>
      KeyField = 'V_ID'
      ListField = 'NAME_IP'
      ListSource = srcVLANS
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 2
      Visible = True
      OnClick = DBLookupComboboxClick
      OnDropDownBoxGetCellParams = dbleVLANDropDownBoxGetCellParams
      OnEnter = DBLookupComboboxEnter
    end
    object eIPv6: TDBEditEh
      Left = 74
      Top = 102
      Width = 456
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecLowerCase
      DataField = 'IPV6'
      DataSource = srcLan
      DynProps = <>
      EditButtons = <
        item
          Action = actGetIpv6
          Style = ebsEllipsisEh
        end>
      EmptyDataInfo.Text = 'IPv6 '#1072#1076#1088#1077#1089
      ShowHint = True
      TabOrder = 5
      Visible = True
      OnEnter = eIPv6Enter
      OnExit = eIPv6Exit
      EditMask = ''
    end
    object edtTAGSTR: TDBEditEh
      Left = 200
      Top = 127
      Width = 330
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'TAG_STR'
      DataSource = srcLan
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1086#1080#1079#1074#1086#1083#1100#1085#1072#1103' '#1090#1077#1082#1089#1090#1086#1074#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
      ShowHint = True
      TabOrder = 7
      Visible = True
      EditMask = ''
    end
    object edtTAG: TDBNumberEditEh
      Left = 74
      Top = 127
      Width = 111
      Height = 21
      Alignment = taLeftJustify
      DataField = 'TAG'
      DataSource = srcLan
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = #1062#1080#1092#1088#1086#1074#1072#1103' '#1080#1085#1092'.'
      EditButtons = <>
      ShowHint = True
      TabOrder = 6
      Visible = True
    end
    object lcbPort: TDBLookupComboboxEh
      Left = 201
      Top = 4
      Width = 329
      Height = 21
      Hint = 
        #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1087#1086#1088#1090#1091#13#10#1089#1077#1088#1099#1081' '#1094#1074#1077#1090' - '#1087#1086#1088#1090' '#1079#1072#1085#1103#1090', '#1082#1091#1088#1089#1080#1074' - '#1089#1083#1091#1078#1077#1073#1085#1099#1081' '#1087 +
        #1086#1088#1090', '#1079#1072#1095#1077#1088#1082#1085#1091#1090' - '#1085#1077#1080#1089#1087#1088#1072#1074#1077#1085
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'PORT'
      DataSource = srcLan
      DropDownBox.Columns = <
        item
          AutoFitColWidth = False
          FieldName = 'PORT'
          Title.Caption = #1055#1086#1088#1090
          Title.Hint = 
            #1089#1077#1088#1099#1081' '#1094#1074#1077#1090' - '#1087#1086#1088#1090' '#1079#1072#1085#1103#1090', '#1082#1091#1088#1089#1080#1074' - '#1089#1083#1091#1078#1077#1073#1085#1099#1081' '#1087#1086#1088#1090', '#1079#1072#1095#1077#1088#1082#1085#1091#1090' - '#1085#1077 +
            #1080#1089#1087#1088#1072#1074#1077#1085
          Width = 25
        end
        item
          AutoFitColWidth = False
          FieldName = 'SPEED'
          Title.Caption = #1057#1082#1086#1088#1086#1089#1090#1100
          Width = 25
        end
        item
          FieldName = 'O_NAME'
          Title.Caption = #1058#1080#1087
          Width = 20
        end
        item
          FieldName = 'NOTICE'
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 40
        end
        item
          FieldName = 'V_NAME'
          Title.Caption = #1057#1077#1090#1100
          Width = 30
        end
        item
          Alignment = taLeftJustify
          AutoFitColWidth = False
          FieldName = 'WHOSE'
          Title.Caption = #1063#1090#1086
          Width = 10
        end
        item
          AutoFitColWidth = False
          FieldName = 'WHOSE_NAME'
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Width = 40
        end>
      DropDownBox.ListSource = srcPort
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
      DropDownBox.SortLocal = True
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1087#1086#1088#1090#1091
      EditButtons = <
        item
          Action = actAddPort
          DefaultAction = False
          ShortCut = 113
          Style = ebsEllipsisEh
        end>
      KeyField = 'PORT'
      ListField = 'NAME'
      ListSource = srcPort
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 1
      Visible = True
      OnChange = lcbPortChange
      OnClick = DBLookupComboboxClick
      OnDropDownBoxGetCellParams = lcbPortDropDownBoxGetCellParams
      OnEnter = DBLookupComboboxEnter
      OnExit = lcbPortExit
    end
    object edtPort: TDBEditEh
      Left = 74
      Top = 4
      Width = 111
      Height = 21
      DataField = 'PORT'
      DataSource = srcLan
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1087#1086#1088#1090#1091
      ShowHint = True
      TabOrder = 0
      Visible = False
    end
    object cbbTagList: TDBComboBoxEh
      Left = 200
      Top = 118
      Width = 330
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'TAG_STR'
      DataSource = srcLan
      DynProps = <>
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1080#1079' '#1089#1087#1080#1089#1082#1072
      EditButtons = <>
      ShowHint = True
      TabOrder = 8
      Visible = False
    end
  end
  object btn1: TButton
    Left = 3
    Top = 351
    Width = 63
    Height = 27
    Anchors = [akLeft, akBottom]
    Caption = 'CMD'
    DropDownMenu = pmLanPopUp
    TabOrder = 5
    OnClick = btn1Click
  end
  object pnlAddres: TPanel
    Left = 0
    Top = 0
    Width = 535
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      535
      29)
    object Label3: TLabel
      Left = 3
      Top = 10
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
    object lbl4: TLabel
      Left = 317
      Top = 10
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1044#1086#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 414
      Top = 10
      Width = 31
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1052#1077#1089#1090#1086
    end
    object LupStreets: TDBLookupComboboxEh
      Left = 74
      Top = 7
      Width = 239
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'STREET_ID'
      DataSource = srcLan
      DropDownBox.Columns = <
        item
          FieldName = 'STREET_NAME'
          Title.Caption = #1059#1083#1080#1094#1072
        end
        item
          FieldName = 'AREA_NAME'
          Title.Caption = #1056#1072#1081#1086#1085
        end>
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1059#1083#1080#1094#1072', '#1077#1089#1083#1080' '#1086#1090#1083#1080#1095#1072#1077#1090#1089#1103' '#1086#1090' '#1072#1076#1088#1077#1089#1072' '#1072#1073#1086#1085#1077#1085#1090#1072
      EditButtons = <>
      KeyField = 'STREET_ID'
      ListField = 'STREET_NAME'
      ListSource = srcStreet
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object lcbHOUSE_ID: TDBLookupComboboxEh
      Left = 342
      Top = 7
      Width = 68
      Height = 21
      Anchors = [akTop, akRight]
      DynProps = <>
      DataField = 'HOUSE_ID'
      DataSource = srcLan
      EmptyDataInfo.Text = #1044#1086#1084
      EditButtons = <>
      KeyField = 'HOUSE_ID'
      ListField = 'HOUSE_NO'
      ListSource = srcHouse
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnChange = lcbHOUSE_IDChange
    end
    object edtPLACE: TDBEditEh
      Tag = 7
      Left = 448
      Top = 7
      Width = 82
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'PLACE'
      DataSource = srcLan
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1052#1077#1089#1090#1086'/'#1050#1074#1072#1088#1090#1080#1088#1072
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
  end
  object pnlMemo: TPanel
    Left = 0
    Top = 309
    Width = 535
    Height = 38
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 6
    object mmoNOTICE: TDBMemoEh
      Left = 5
      Top = 0
      Width = 525
      Height = 38
      Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcLan
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 0
      Visible = True
      WantReturns = True
    end
  end
  object pnlEthernet: TPanel
    Left = 0
    Top = 29
    Width = 535
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      535
      30)
    object Label5: TLabel
      Left = 3
      Top = 7
      Width = 45
      Height = 13
      Hint = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1102
      Caption = #1055#1086#1076#1082#1083'. '#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object dbleEquipment: TDBLookupComboboxEh
      Left = 74
      Top = 4
      Width = 456
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'EQ_ID'
      DataSource = srcLan
      DropDownBox.Columns = <
        item
          FieldName = 'NAME'
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Width = 90
        end
        item
          FieldName = 'STREET_NAME'
          Title.Caption = #1059#1083#1080#1094#1072
          Width = 60
        end
        item
          AutoFitColWidth = False
          FieldName = 'HOUSE_NO'
          Title.Caption = #1044#1086#1084
          Width = 35
        end
        item
          AutoFitColWidth = False
          FieldName = 'PORCH_N'
          Title.Caption = #1055'-'#1076
          Width = 20
        end
        item
          AutoFitColWidth = False
          FieldName = 'FLOOR_N'
          Title.Caption = #1069#1058'.'
          Width = 20
        end
        item
          AutoFitColWidth = False
          FieldName = 'PLACE'
          Title.Caption = #1052#1077#1089#1090#1086
          Width = 20
        end
        item
          AutoFitColWidth = False
          FieldName = 'IP'
          Width = 80
        end
        item
          AutoFitColWidth = False
          FieldName = 'MAC'
          Width = 100
        end>
      DropDownBox.ListSource = srcEQ
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
      DropDownBox.SortLocal = True
      DropDownBox.AutoDrop = True
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1091
      EditButtons = <
        item
          DefaultAction = False
          ShortCut = 45
          Style = ebsPlusEh
          OnClick = dbleEquipmentEditButtons0Click
        end
        item
          DefaultAction = False
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C40E0000C40E00000000000000000001FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            3B3B3B656565AFAFAFF3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6565656C6C6C656565343434C3C3C3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            AFAFAF656565FFFFFFCBCBCB343434C4C4C4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3343434C4C4C4FFFFFFCACACA34
            3434C5C5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFCCCCCC343434C5C5C5FFFFFFCACACA343434C5C5C5FFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCB343434C6C6C6FF
            FFFFC9C9C9343434C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFCBCBCB343434C6C6C6FFFFFFC8C8C8343434C7C7C7FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCACACA34
            3434C7C7C7FFFFFFC8C8C8343434C7C7C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC9C9C9343434C7C7C7C7C7C73434343434
            34C9C9C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFC9C9C9343434343434C8C8C8C2C2C23C3C3CFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC8C8C8343434C2C2C2D3D3
            D3323232FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFC9C9C93C3C3C313131B2B2B2FFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ShortCut = 113
          Style = ebsGlyphEh
          OnClick = dbleEquipmentEditButtons1Click
        end>
      KeyField = 'EID'
      ListField = 'NAME_IP'
      ListSource = srcEQ
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnChange = dbleEquipmentChange
      OnClick = DBLookupComboboxClick
      OnDropDownBoxGetCellParams = dbleEquipmentDropDownBoxGetCellParams
      OnEnter = DBLookupComboboxEnter
      OnExit = dbleEquipmentExit
    end
  end
  object pnlDOCSYS: TPanel
    Left = 0
    Top = 59
    Width = 535
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    DesignSize = (
      535
      97)
    object Label6: TLabel
      Left = 3
      Top = 3
      Width = 33
      Height = 13
      Caption = #1052#1086#1076#1077#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl6: TLabel
      Left = 3
      Top = 28
      Width = 54
      Height = 13
      Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl7: TLabel
      Left = 3
      Top = 52
      Width = 62
      Height = 13
      Caption = #1052#1040#1057' '#1084#1086#1076#1077#1084#1072
    end
    object lbl8: TLabel
      Left = 3
      Top = 77
      Width = 50
      Height = 13
      Caption = 'IP '#1084#1086#1076#1077#1084#1072
    end
    object edtModem: TDBEditEh
      Left = 74
      Top = 0
      Width = 456
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object edtSerialModem: TDBEditEh
      Left = 74
      Top = 25
      Width = 456
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object edtMACmodem: TDBEditEh
      Left = 74
      Top = 49
      Width = 238
      Height = 21
      Hint = #1052#1040#1057' '#1072#1076#1088#1077#1089
      CharCase = ecUpperCase
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'MAC '#1072#1076#1088#1077#1089' '#1084#1086#1076#1077#1084#1072
      ShowHint = True
      TabOrder = 2
      Visible = True
      OnEnter = edtMACmodemEnter
      OnExit = edtMACmodemExit
      EditMask = ''
    end
    object edtIPmodem: TDBEditEh
      Left = 74
      Top = 74
      Width = 238
      Height = 21
      Hint = 'IP '#1072#1076#1088#1077#1089' '#1084#1086#1076#1077#1084#1072
      DynProps = <>
      EditButtons = <
        item
          Style = ebsEllipsisEh
          DrawBackTime = edbtAlwaysEh
          OnClick = edtIPmodemEditButtons0Click
        end>
      EmptyDataInfo.Text = 'IP '#1072#1076#1088#1077#1089' '#1084#1086#1076#1077#1084#1072
      MaxLength = 19
      ShowHint = True
      TabOrder = 3
      Visible = True
      OnEnter = edtIPmodemEnter
      EditMask = ''
    end
  end
  object srcLan: TDataSource
    DataSet = dsLAN
    Left = 32
    Top = 232
  end
  object dsLAN: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TV_LAN'
      'SET '
      '    CUSTOMER_ID = :CUSTOMER_ID,'
      '    IP = :IP,'
      '    MAC = :MAC,'
      '    IP_ADD = :IP_ADD,'
      '    PORT = :PORT,'
      '    NOTICE = :NOTICE,'
      '    EQ_ID = :EQ_ID,'
      '    VLAN_ID = :VLAN_ID,'
      '    TAG = :TAG,'
      '    TAG_STR = :TAG_STR,'
      '    IPV6 = :IPV6,'
      '    HOUSE_ID = :HOUSE_ID,'
      '    PLACE = :PLACE'
      'WHERE'
      '    LAN_ID = :OLD_LAN_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TV_LAN'
      'WHERE'
      '        LAN_ID = :OLD_LAN_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TV_LAN('
      '    LAN_ID,'
      '    CUSTOMER_ID,'
      '    IP,'
      '    MAC,'
      '    IP_ADD,'
      '    PORT,'
      '    NOTICE,'
      '    EQ_ID,'
      '    VLAN_ID,'
      '    TAG,'
      '    TAG_STR ,'
      '    IPV6,'
      '    HOUSE_ID,'
      '    PLACE'
      ')'
      'VALUES('
      '    :LAN_ID,'
      '    :CUSTOMER_ID,'
      '    :IP,'
      '    :MAC,'
      '    :IP_ADD,'
      '    :PORT,'
      '    :NOTICE,'
      '    :EQ_ID,'
      '    :VLAN_ID,'
      '    :TAG,'
      '    :TAG_STR,'
      '    :IPV6,'
      '    :HOUSE_ID,'
      '    :PLACE    '
      ')')
    RefreshSQL.Strings = (
      'select'
      '    f.*'
      '  , h.Street_Id'
      '  , (select first 1'
      '         n.Node_Id'
      '       from node_flats f'
      '            inner join nodes n on (n.Node_Id = f.Node_Id)'
      '       where f.House_Id = c.house_id'
      '             and f.Flat_No = c.flat_no) as NODE_ID'
      '  from TV_LAN f'
      '       inner join customer c on (c.Customer_Id = f.Customer_Id)'
      '       left outer join house h on (h.House_Id = f.House_Id)'
      '  where F.LAN_ID = :OLD_LAN_ID')
    SelectSQL.Strings = (
      'select'
      '    f.*'
      '  , h.Street_Id'
      '  , (select first 1'
      '         n.Node_Id'
      '       from node_flats f'
      '            inner join nodes n on (n.Node_Id = f.Node_Id)'
      '       where f.House_Id = c.house_id'
      '             and f.Flat_No = c.flat_no) as NODE_ID'
      '  from TV_LAN f'
      '       inner join customer c on (c.Customer_Id = f.Customer_Id)'
      '       left outer join house h on (h.House_Id = f.House_Id)'
      '  where f.LAN_ID = :LAN_ID')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DISCOUNT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 40
    Top = 248
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcVLANS: TDataSource
    DataSet = dsVlans
    Left = 96
    Top = 232
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
      '    iif(oc.o_id is null, 2, 1) as finded'
      '  , v.v_id'
      '  , v.name'
      
        '  , v.name || coalesce('#39' / '#39' || v.ip_begin || '#39'-'#39' || v.ip_end, '#39 +
        #39') NAME_IP'
      '  , v.ip_begin'
      '  , v.ip_end'
      '  , l.C_CNT'
      '  , e.E_CNT'
      '  from vlans v'
      
        '       left outer join objects_coverage oc on (oc.oc_type = 2 an' +
        'd'
      '             v.v_id = oc.o_id and'
      '             oc.house_id = :House_Id)'
      '         left outer join(select'
      '                           Vlan_Id'
      '                         , count(*) C_CNT'
      '                         from Tv_Lan'
      '                         group by 1) l on (l.Vlan_Id = v.V_Id)'
      '       left outer join(select'
      '                           Vlan_Id'
      '                         , count(*) E_CNT'
      '                         from Equipment'
      '                         group by 1) e on (e.Vlan_Id = v.V_Id)'
      '  where ((v.for_objects is null)'
      '          or (v.for_objects = 0)'
      '          or (v.for_objects = 1))'
      '  '
      '  ')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 104
    Top = 248
  end
  object srcEQ: TDataSource
    DataSet = dsEQ
    Left = 160
    Top = 232
  end
  object dsEQ: TpFIBDataSet
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
      '    1 as FINDED'
      '  , E.EID'
      '  , E.NAME'
      '  , E.IP'
      '  , E.VLAN_ID'
      '  , S.STREET_NAME'
      '  , H.HOUSE_NO'
      '  , E.PLACE'
      '  , E.MAC'
      '  , E.PORCH_N'
      '  , E.FLOOR_N'
      '  , E.NAME || coalesce('#39' / '#39' || E.IP, '#39#39') NAME_IP'
      '  , e.Node_Id'
      '  , iif((:LID <> -1), 999, coalesce((select'
      '                  min(LVL)'
      '                from GET_NODE_FLAT_LVL(e.Node_Id)'
      '                where (position(:CUSTOMER_ID in CST_LIST) > 0)'
      '                      and (exists(select'
      '                                      STR'
      
        '                                    from Explode_No_Empty('#39','#39', C' +
        'ST_LIST)'
      
        '                                    where STR = :CUSTOMER_ID))),' +
        ' 999)) LVL'
      '  from EQUIPMENT E'
      '       inner join HOUSE H on (H.HOUSE_ID = E.HOUSE_ID)'
      '       inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      '  where E.EQ_TYPE = 1'
      '        and ('
      '           ('
      '             exists(select'
      '                        EC.HOUSE_ID'
      '                      from EQUIPMENT_COVERAGE ec'
      '                      where EC.EID = E.EID'
      '                            and (ec.House_Id = :House_Id))'
      '           )'
      '           or ('
      '            exists(select'
      '                         L.EQ_ID'
      '                       from TV_LAN L'
      '                       where L.CUSTOMER_ID = :CUSTOMER_ID'
      '                             and L.EQ_ID = E.EID)'
      '           )'
      '        )'
      '  order by 1 desc, 3')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 168
    Top = 248
    oFetchAll = True
  end
  object actlst1: TActionList
    Left = 392
    Top = 224
    object actFindIP: TAction
      Caption = #1053#1072#1081#1090#1080' IP'
      Hint = #1053#1072#1081#1090#1080' '#1089#1074#1086#1073#1086#1076#1085#1099#1081' IP (F7)'
      ImageIndex = 7
      ShortCut = 118
    end
    object actAddPort: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100'/'#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1088#1090'/'#1099
      OnExecute = actAddPortExecute
    end
    object actEditPort: TAction
      Caption = 'actEditPort'
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1088#1090
      OnExecute = actEditPortExecute
    end
  end
  object cnError: TCnErrorProvider
    DoubleBuffer = False
    Left = 352
    Top = 112
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
    Left = 216
    Top = 112
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
    Left = 256
    Top = 128
  end
  object pmLanPopUp: TPopupMenu
    Left = 424
    Top = 168
  end
  object ActListEQ: TActionList
    Left = 160
    Top = 88
    object ActLanPing: TAction
      Caption = 'ActLanPing'
      Hint = 'PING IP adress'
      OnExecute = ActLanPingExecute
    end
    object actLanTelnet: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' IP '#1074' '#1090#1077#1083#1085#1077#1090
      OnExecute = actLanTelnetExecute
    end
    object actLanHttp: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077' IP'
      OnExecute = actLanHttpExecute
    end
    object actGetIpv6: TAction
      Caption = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' IPv6'
      Hint = #1047#1072#1087#1088#1086#1089#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' IPv6'
      Visible = False
      OnExecute = actGetIpv6Execute
    end
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 344
    Top = 232
  end
  object dsStreets: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT s.street_id, s.street_name||'#39' '#39'||s.street_short street_na' +
        'me, a.area_name'
      'FROM STREET s left outer join area a on (a.area_id = s.area_id)'
      'ORDER BY STREET_NAME, a.area_name')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 360
    Top = 240
  end
  object srcHouse: TDataSource
    DataSet = dsHomes
    Left = 288
    Top = 232
  end
  object dsHomes: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    H.HOUSE_ID,'
      '    H.STREET_ID,'
      '    H.HOUSE_NO,'
      '    H.Q_FLAT'
      'FROM'
      '    HOUSE H'
      'where h.street_id = :street_id'
      'order by h.HOUSE_NO'
      '')
    Transaction = trRead
    Database = dmMain.dbTV
    DataSource = srcStreet
    Left = 296
    Top = 240
  end
  object srcPort: TDataSource
    DataSet = dsPort
    Left = 216
    Top = 232
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
      '    p.Port'
      '  , p.Notice'
      '  , o.O_Name'
      '  , p.Speed'
      '  , p.CON'
      '  , p.P_STATE'
      
        '  , p.Port ||coalesce('#39' / '#39'||p.Speed,  '#39#39')||coalesce('#39' / '#39'||o.O_' +
        'Name,  '#39#39') NAME'
      '  , p.VLAN_ID'
      '  , v.Name V_NAME'
      '  , case p.Con'
      '      when 0 then '#39#1054#39
      '      when 1 then '#39#1040#39
      '      else '#39#39
      '    end whose'
      
        '  , coalesce(c.ACCOUNT_NO, iif( p.Con = 0, e.Name, null)) WHOSE_' +
        'NAME'
      '  , coalesce(c.HIS_COLOR, et.O_DIMENSION) as COLOR'
      '  , p.Con_Id  '
      '  , p.Wid'
      '  , coalesce(p.Wlabel, '#39#39') Wlabel'
      '  from port p'
      
        '       inner join objects o on (p.P_Type = o.O_Id and o.O_Type =' +
        ' 57)'
      '       left outer join VLANS v on (v.V_ID = p.Vlan_Id)'
      
        '       left outer join tv_lan t on (t.Eq_Id = p.Eid and t.Port =' +
        ' p.Port and p.Con = 1)'
      
        '       left outer join CUSTOMER C on (t.customer_id = c.customer' +
        '_id)'
      
        '       left outer join equipment e on (e.Eid = p.Con_Id and p.Co' +
        'n = 0)'
      
        '       left outer join objects et on (e.eq_group = et.o_id and o' +
        '.O_TYPE = 7)'
      '  where(  p.Eid = :EID'
      '     ) and (     P.PORT = :OLD_PORT'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    p.Port'
      '  , p.Notice'
      '  , o.O_Name'
      '  , p.Speed'
      '  , p.CON'
      '  , p.P_STATE'
      
        '  , p.Port ||coalesce('#39' / '#39'||p.Speed,  '#39#39')||coalesce('#39' / '#39'||o.O_' +
        'Name,  '#39#39') NAME'
      '  , p.VLAN_ID'
      '  , v.Name V_NAME'
      '  , case p.Con'
      '      when 0 then '#39#1054#39
      '      when 1 then '#39#1040#39
      
        '      else iif(not ((c.ACCOUNT_NO is null) and (e.Name is null))' +
        ', '#39#1056#1077#1082#1086#1084#1077#1085#1076#1091#1077#1090#1089#1103' '#1087#1086#1088#1090' '#1086#1095#1080#1089#1090#1080#1090#1100' '#1080' '#1087#1088#1086#1087#1080#1089#1072#1090#1100' '#1079#1072#1085#1086#1074#1086#39', '#39#39')'
      '    end whose'
      '  , coalesce(c.ACCOUNT_NO, e.Name, null) WHOSE_NAME'
      '  , coalesce(c.HIS_COLOR, et.O_DIMENSION) as COLOR'
      '  , p.Con_Id  '
      '  , p.Wid'
      '  , coalesce(p.Wlabel, '#39#39') Wlabel'
      '  from port p'
      
        '       inner join objects o on (p.P_Type = o.O_Id and o.O_Type =' +
        ' 57)'
      '       left outer join VLANS v on (v.V_ID = p.Vlan_Id)'
      
        '       left outer join tv_lan t on (t.Eq_Id = p.Eid and t.Port =' +
        ' p.Port)  -- and p.Con = 1'
      
        '       left outer join CUSTOMER C on (t.customer_id = c.customer' +
        '_id)'
      
        '       left outer join equipment e on (e.Eid = p.Con_Id)  -- and' +
        ' p.Con = 0'
      
        '       left outer join objects et on (e.eq_group = et.o_id and o' +
        '.O_TYPE = 7)'
      '  where p.Eid = :EID'
      '  @@where_port_line%@'
      '  order by p.Port  ')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    DataSource = srcEQ
    Left = 232
    Top = 232
    oFetchAll = True
  end
end
