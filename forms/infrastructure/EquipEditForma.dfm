object EquipEditForm: TEquipEditForm
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
  ClientHeight = 481
  ClientWidth = 419
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
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcTypeInfo: TPageControl
    Left = 0
    Top = 244
    Width = 419
    Height = 194
    ActivePage = tsLan
    Align = alClient
    Style = tsButtons
    TabOrder = 1
    object tsLan: TTabSheet
      Caption = #1057#1077#1090#1100
      DesignSize = (
        411
        163)
      object Label4: TLabel
        Left = 0
        Top = 27
        Width = 22
        Height = 13
        Caption = #1052#1040#1057
      end
      object Label5: TLabel
        Left = 0
        Top = 51
        Width = 10
        Height = 13
        Caption = 'IP'
      end
      object Label7: TLabel
        Left = 0
        Top = 75
        Width = 27
        Height = 13
        Caption = 'MASK'
      end
      object lbl3: TLabel
        Left = 0
        Top = 3
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
      object btnPing: TSpeedButton
        Left = 292
        Top = 48
        Width = 51
        Height = 21
        Anchors = [akTop, akRight]
        Caption = 'PING'
        Flat = True
        OnClick = btnPingClick
      end
      object lbl2: TLabel
        Left = 0
        Top = 123
        Width = 25
        Height = 13
        Caption = 'Login'
      end
      object lbl5: TLabel
        Left = 208
        Top = 123
        Width = 46
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Password'
        OnDblClick = lbl5DblClick
      end
      object Label9: TLabel
        Left = 0
        Top = 147
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
      object btnTelnet: TSpeedButton
        Left = 350
        Top = 48
        Width = 57
        Height = 21
        Anchors = [akTop, akRight]
        Caption = 'telnet'
        Flat = True
        OnClick = btnTelnetClick
      end
      object lbl12: TLabel
        Left = 0
        Top = 99
        Width = 22
        Height = 13
        Caption = 'IPv6'
      end
      object edtMAC: TDBEditEh
        Left = 37
        Top = 24
        Width = 165
        Height = 21
        Hint = #1052#1040#1057' '#1072#1076#1088#1077#1089
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        DataField = 'MAC'
        DataSource = srcDataSource
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = 'MAC '#1072#1076#1088#1077#1089
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnEnter = edtMACEnter
        OnExit = edtMACExit
        EditMask = ''
      end
      object edtIP: TDBEditEh
        Left = 37
        Top = 48
        Width = 165
        Height = 21
        Hint = 'IP '#1072#1076#1088#1077#1089
        Anchors = [akLeft, akTop, akRight]
        DataField = 'IP'
        DataSource = srcDataSource
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = 'IP '#1072#1076#1088#1077#1089
        MaxLength = 19
        ShowHint = True
        TabOrder = 3
        Visible = True
        OnEnter = edtMACEnter
        OnExit = edtIPExit
        EditMask = ''
      end
      object edtMASK: TDBEditEh
        Left = 37
        Top = 72
        Width = 165
        Height = 21
        Hint = #1052#1072#1089#1082#1072' '#1089#1077#1090#1080
        Anchors = [akLeft, akTop, akRight]
        DataField = 'MASK'
        DataSource = srcDataSource
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1052#1072#1089#1082#1072' '#1089#1077#1090#1080
        ShowHint = True
        TabOrder = 4
        Visible = True
        OnEnter = edtMACEnter
        OnExit = edtIPExit
        EditMask = ''
      end
      object dbleVLAN: TDBLookupComboboxEh
        Left = 37
        Top = 0
        Width = 370
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'VLAN_ID'
        DataSource = srcDataSource
        DropDownBox.Columns = <
          item
            FieldName = 'NAME'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 57
          end
          item
            FieldName = 'IP_BEGIN'
            Title.Caption = 'IP c'
          end
          item
            FieldName = 'IP_END'
            Title.Caption = 'IP '#1076#1086
          end>
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'V_ID'
        ListField = 'NAME'
        ListSource = srcVLANS
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnDropDownBoxGetCellParams = dbleVLANDropDownBoxGetCellParams
      end
      object edtADMIN: TDBEditEh
        Left = 37
        Top = 120
        Width = 165
        Height = 21
        Hint = 'IP '#1072#1076#1088#1077#1089
        Anchors = [akLeft, akTop, akRight]
        DataField = 'E_ADMIN'
        DataSource = srcDataSource
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = 'Admin login'
        ShowHint = True
        TabOrder = 6
        Visible = True
        OnEnter = edtADMINEnter
        OnExit = edtADMINExit
        EditMask = ''
      end
      object edtPWD: TDBEditEh
        Left = 260
        Top = 120
        Width = 147
        Height = 21
        Hint = #1055#1072#1088#1086#1083#1100' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072
        Anchors = [akTop, akRight]
        DataField = 'E_PASS'
        DataSource = srcDataSource
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = 'Admin password'
        PasswordChar = '*'
        ShowHint = True
        TabOrder = 7
        Visible = True
        OnEnter = edtPWDEnter
        OnExit = edtPWDExit
        EditMask = ''
      end
      object cbbEQG: TDBLookupComboboxEh
        Left = 37
        Top = 144
        Width = 370
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'EQ_GROUP'
        DataSource = srcDataSource
        DropDownBox.Columns = <
          item
            AutoFitColWidth = False
            FieldName = 'O_NAME'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Width = 90
          end
          item
            FieldName = 'O_DESCRIPTION'
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          end>
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'O_ID'
        ListField = 'O_NAME'
        ListSource = srcEQGroups
        ShowHint = True
        TabOrder = 8
        Visible = True
      end
      object btnFindIP: TBitBtn
        Left = 211
        Top = 47
        Width = 75
        Height = 23
        Action = actFindIP
        Anchors = [akTop, akRight]
        Caption = #1053#1072#1081#1090#1080' IP'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00AD6D
          3000CEAE8F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AD6E3200AA66
          2500AA662500D3AC8700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D0B29500AA66
          2500AA662500AA662500D3AA8200FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D5B3
          9300AA662500AA662500AA662500D2A87F00FF00FF00FF00FF00CFAE9000C99F
          7700CBA58000D5C1AE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00D5B59600AA662500AA662500AA662500BF834A00AA662500AA662500AA66
          2500AA662500AA662500AA672700FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00D6B79A00AA662500AA662500AA662500AA662500C48A5300D3AA
          8200CFA07200AA662500AA662500AA662500D8BDA400FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00C38D5A00AA662500AA662500F6EBE100FDFDFD00FDFD
          FD00FFFFFF00FDFDFD00C4956900AA662500AA662500FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00AA662500AA662500F5E9DE00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00B77E4700AA662500C19A7400FF00FF00FF00
          FF00FF00FF00D1B59A00AA662500C2864C00FDFDFD00FFFFFF00FDFDFD00FDFD
          FD00FFFFFF00FDFDFD00FDFDFD00EBD6C200AA662500B0743B00FF00FF00FF00
          FF00FF00FF00CBA58100AA662500D1A47A00FDFDFD00FFFFFF00FDFDFD00FDFD
          FD00FFFFFF00FDFDFD00FDFDFD00F9F2EC00AA662500AA662500FF00FF00FF00
          FF00FF00FF00CEAD8D00AA662500CB986600FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00F2E5D900AA662500AC6B2D00FF00FF00FF00
          FF00FF00FF00FF00FF00AA662500AA662500FDFDFD00FFFFFF00FDFDFD00FDFD
          FD00FFFFFF00FDFDFD00FDFDFD00D5A97F00AA662500B9885900FF00FF00FF00
          FF00FF00FF00FF00FF00AE713500AA662500BD895700FFFFFF00FDFDFD00FDFD
          FD00FFFFFF00FDFDFD00F0DECC00AA662500AA662500D5C1AE00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00AA662500AA662500B2743A00E6CDB500F4E9
          DF00F0E0D100D3A57A00AA662500AA662500C1895400FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00AA662500AA662500AA662500AA66
          2500AA662500AA662500AA662500C28A5600FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C6A58500B47D4900AD6D
          3000AF723700BB8D6000FF00FF00FF00FF00FF00FF00FF00FF00}
        TabOrder = 2
        TabStop = False
      end
      object edtIP1: TDBEditEh
        Left = 37
        Top = 96
        Width = 370
        Height = 21
        Hint = 'IP '#1072#1076#1088#1077#1089
        Anchors = [akLeft, akTop, akRight]
        DataField = 'IPV6'
        DataSource = srcDataSource
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = 'IPv6 '#1072#1076#1088#1077#1089
        ShowHint = True
        TabOrder = 5
        Visible = True
        OnEnter = edtIP1Enter
        OnExit = edtIP1Exit
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
      object lbl8: TLabel
        Left = 3
        Top = 54
        Width = 89
        Height = 13
        Caption = #1059#1088#1086#1074#1077#1085#1100' '#1074#1093#1086#1076#1085#1086#1081
      end
      object lbl9: TLabel
        Left = 3
        Top = 79
        Width = 97
        Height = 13
        Caption = #1059#1088#1086#1074#1077#1085#1100' '#1074#1099#1093#1086#1076#1085#1086#1081
      end
      object cbbLine: TDBComboBoxEh
        Left = 106
        Top = 26
        Width = 121
        Height = 21
        DataField = 'EQ_LINE'
        DataSource = srcDataSource
        DynProps = <>
        EditButtons = <>
        Items.Strings = (
          #1052#1072#1075#1080#1089#1090#1088'.'
          #1044#1086#1084#1086#1074#1072#1103)
        KeyItems.Strings = (
          '0'
          '1')
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
        DataSource = srcDataSource
        DynProps = <>
        EditButtons = <>
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
        DataSource = srcDataSource
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 3
        Visible = True
      end
      object dbckActive: TDBCheckBoxEh
        Left = 3
        Top = 3
        Width = 116
        Height = 18
        Alignment = taLeftJustify
        Caption = #1040#1082#1090#1080#1074#1085#1086#1077
        DataField = 'EQ_ACTIVE'
        DataSource = srcDataSource
        DynProps = <>
        TabOrder = 0
      end
    end
    object tsOther: TTabSheet
      Caption = #1055#1088#1086#1095#1077#1077
      ImageIndex = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 419
    Height = 244
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      419
      244)
    object Label1: TLabel
      Left = 5
      Top = 56
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
      Left = 5
      Top = 79
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
      Left = 5
      Top = 33
      Width = 55
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 292
      Top = 79
      Width = 18
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1055'-'#1076
    end
    object Label6: TLabel
      Left = 350
      Top = 79
      Width = 19
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1069'-'#1078
    end
    object lbl4: TLabel
      Left = 5
      Top = 10
      Width = 20
      Height = 13
      Caption = #1058#1080#1087
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 146
      Top = 79
      Width = 31
      Height = 13
      Caption = #1052#1077#1089#1090#1086
    end
    object lbl6: TLabel
      Left = 4
      Top = 149
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
    object lbl10: TLabel
      Left = 4
      Top = 127
      Width = 68
      Height = 13
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082
    end
    object lbl11: TLabel
      Left = 336
      Top = 127
      Width = 24
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1087#1086#1088#1090
    end
    object lblNODE: TLabel
      Left = 5
      Top = 102
      Width = 24
      Height = 13
      Caption = #1059#1079#1077#1083
    end
    object luStreet: TDBLookupComboboxEh
      Left = 76
      Top = 53
      Width = 335
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'STREET_ID'
      DataSource = srcDataSource
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1059#1083#1080#1094#1072
      EditButtons = <>
      KeyField = 'STREET_ID'
      ListField = 'STREET_NAME'
      ListSource = srcStreet
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object luHouse: TDBLookupComboboxEh
      Left = 76
      Top = 76
      Width = 65
      Height = 21
      DynProps = <>
      DataField = 'HOUSE_ID'
      DataSource = srcDataSource
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1044#1086#1084
      EditButtons = <>
      KeyField = 'HOUSE_ID'
      ListField = 'HOUSE_NO'
      ListSource = srcHouse
      ShowHint = True
      TabOrder = 3
      Visible = True
      OnChange = luHouseChange
    end
    object edtNAME: TDBEditEh
      Left = 76
      Top = 30
      Width = 335
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object DBMemo1: TDBMemoEh
      Tag = 9
      Left = 6
      Top = 179
      Width = 405
      Height = 59
      ScrollBars = ssVertical
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 11
      Visible = True
      WantReturns = True
    end
    object dbedt1: TDBEditEh
      Left = 313
      Top = 76
      Width = 35
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'PORCH_N'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 5
      Visible = True
    end
    object DBEdit1: TDBEditEh
      Left = 372
      Top = 76
      Width = 39
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'FLOOR_N'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 6
      Visible = True
    end
    object cbTypeEQ: TDBComboBoxEh
      Left = 76
      Top = 7
      Width = 335
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'EQ_TYPE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      Items.Strings = (
        #1057#1077#1090#1077#1074#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        #1050#1072#1073#1077#1083#1100#1085#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        #1055#1088#1086#1095#1077#1077)
      KeyItems.Strings = (
        '1'
        '2'
        '3')
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = cbTypeEQChange
    end
    object edtPlace: TDBEditEh
      Left = 183
      Top = 76
      Width = 103
      Height = 21
      Hint = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' / '#1071#1097#1080#1082
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PLACE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
      ShowHint = True
      TabOrder = 4
      Visible = True
      OnExit = edtPlaceExit
    end
    object edtSerial: TDBEditEh
      Left = 76
      Top = 146
      Width = 335
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'SERIAL_N'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 10
      Visible = True
    end
    object luParent: TDBLookupComboboxEh
      Left = 76
      Top = 123
      Width = 254
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'PARENT_ID'
      DataSource = srcDataSource
      DropDownBox.Columns = <
        item
          FieldName = 'NAME'
        end
        item
          FieldName = 'ADRES'
        end>
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'EID'
      ListField = 'NAME'
      ListSource = srcParent
      ShowHint = True
      TabOrder = 8
      Visible = True
    end
    object edtPort: TDBEditEh
      Left = 365
      Top = 123
      Width = 46
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'PARENT_PORT'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 9
      Visible = True
    end
    object lcbNODE: TDBLookupComboboxEh
      Left = 76
      Top = 100
      Width = 335
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'NODE_ID'
      DataSource = srcDataSource
      DropDownBox.Columns = <
        item
          FieldName = 'NAME'
          Width = 30
        end
        item
          FieldName = 'O_NAME'
          Width = 20
        end>
      DropDownBox.ListSource = srcNODE
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085' '#1074' '#1091#1079#1083#1077
      EditButtons = <>
      KeyField = 'NODE_ID'
      ListField = 'NODE_NAME'
      ListSource = srcNODE
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 7
      Visible = True
      OnDropDownBoxGetCellParams = lcbNODEDropDownBoxGetCellParams
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 438
    Width = 419
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      419
      43)
    object btnCancel: TBitBtn
      Left = 336
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
      Left = 41
      Top = 10
      Width = 286
      Height = 27
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akRight, akBottom]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      NumGlyphs = 2
      TabOrder = 0
      OnClick = okcnclfrmbbOkClick
    end
  end
  object srcVLANS: TDataSource
    DataSet = dsVlans
    Left = 264
    Top = 126
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
      'select '
      '  1 as FINDED, '
      '  v.v_id, '
      '  v.name, '
      '  v.ip_begin, '
      '  v.ip_end'
      'from vlans v'
      '  inner join objects_coverage oc on (v.v_id = oc.o_id)'
      'where oc.oc_type = 2'
      '  and oc.house_id = :HOUSE_ID'
      
        '  and (coalesce(v.for_objects,0) = 0 or (coalesce(v.for_objects,' +
        '0) = 2))'
      ''
      'union'
      ''
      'select '
      '  2 as FINDED, '
      '  v.v_id, '
      '  v.name, '
      '  v.ip_begin, '
      '  v.ip_end'
      'from vlans v '
      
        'where not exists(select oc.o_id from objects_coverage oc where o' +
        'c.o_id = v.v_id and oc.oc_type = 2 and oc.house_id = :HOUSE_ID)'
      '  and coalesce(v.for_objects,0) in (0,2)'
      'order by 1,2')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 277
    Top = 133
  end
  object dsEQGroups: TpFIBDataSet
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
      'SELECT O_ID, O_NAME, O_DESCRIPTION'
      'FROM OBJECTS'
      'WHERE O_TYPE = 7 AND O_DELETED = 0'
      'order BY O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcDataSource
    Left = 221
    Top = 119
  end
  object srcEQGroups: TDataSource
    DataSet = dsEQGroups
    Left = 208
    Top = 179
  end
  object dsEquipment: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE EQUIPMENT'
      'SET '
      '    HOUSE_ID = :HOUSE_ID,'
      '    NAME = :NAME,'
      '    IP = :IP,'
      '    MAC = :MAC,'
      '    NOTICE = :NOTICE,'
      '    EQ_TYPE = :EQ_TYPE,'
      '    PORCH_N = :PORCH_N,'
      '    FLOOR_N = :FLOOR_N,'
      '    PLACE = :PLACE,'
      '    MASK = :MASK,'
      '    VLAN_ID = :VLAN_ID,'
      '    EQ_GROUP = :EQ_GROUP,'
      '    E_ADMIN = :E_ADMIN,'
      '    E_PASS = :E_PASS,'
      '    SERIAL_N = :SERIAL_N,'
      '    PARENT_ID = :PARENT_ID,'
      '    PARENT_PORT = :PARENT_PORT,'
      '    EQ_LINE = :EQ_LINE,'
      '    SIGNAL_IN = :SIGNAL_IN,'
      '    SIGNAL_OUT = :SIGNAL_OUT,'
      '    EQ_ACTIVE = :EQ_ACTIVE ,'
      '    IPV6 = :IPV6,'
      '    NODE_ID = :NODE_ID'
      'WHERE'
      '    EID = :OLD_EID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EQUIPMENT'
      'WHERE'
      '        EID = :OLD_EID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO EQUIPMENT('
      '    EID,'
      '    HOUSE_ID,'
      '    NAME,'
      '    IP,'
      '    MAC,'
      '    NOTICE,'
      '    EQ_TYPE,'
      '    PORCH_N,'
      '    FLOOR_N,'
      '    PLACE,'
      '    MASK,'
      '    VLAN_ID,'
      '    EQ_GROUP,'
      '    E_ADMIN,'
      '    E_PASS,'
      '    SERIAL_N,'
      '    PARENT_ID,'
      '    PARENT_PORT,'
      '    EQ_LINE,'
      '    SIGNAL_IN,'
      '    SIGNAL_OUT,'
      '    EQ_ACTIVE,'
      '    IPV6,'
      '    NODE_ID'
      ')'
      'VALUES('
      '    :EID,'
      '    :HOUSE_ID,'
      '    :NAME,'
      '    :IP,'
      '    :MAC,'
      '    :NOTICE,'
      '    :EQ_TYPE,'
      '    :PORCH_N,'
      '    :FLOOR_N,'
      '    :PLACE,'
      '    :MASK,'
      '    :VLAN_ID,'
      '    :EQ_GROUP,'
      '    :E_ADMIN,'
      '    :E_PASS,'
      '    :SERIAL_N,'
      '    :PARENT_ID,'
      '    :PARENT_PORT,'
      '    :EQ_LINE,'
      '    :SIGNAL_IN,'
      '    :SIGNAL_OUT,'
      '    :EQ_ACTIVE,'
      '    :IPV6,'
      '    :NODE_ID'
      ')')
    RefreshSQL.Strings = (
      'SELECT E.*, h.street_id'
      'FROM EQUIPMENT E'
      '  left outer join house h on (e.House_id =h.house_id)'
      'WHERE(  EID = :EID'
      '     ) and (     E.EID = :OLD_EID'
      '     )'
      '    '
      ''
      '')
    SelectSQL.Strings = (
      'SELECT E.*, h.street_id'
      'FROM EQUIPMENT E'
      '  left outer join house h on (e.House_id = h.house_id)'
      'WHERE EID = :EID'
      '')
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = trSRead
    Database = dmMain.dbTV
    UpdateTransaction = trSWrite
    Left = 62
    Top = 383
  end
  object srcDataSource: TDataSource
    AutoEdit = False
    DataSet = dsEquipment
    Left = 296
    Top = 154
  end
  object dsStreets: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select s.street_name||'#39' '#39'||s.street_short as STREET_NAME, s.stre' +
        'et_code, s.street_id'
      'from STREET s'
      'order by STREET_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 111
    Top = 105
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 112
    Top = 151
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
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcStreet
    Left = 159
    Top = 105
  end
  object srcHouse: TDataSource
    DataSet = dsHomes
    Left = 157
    Top = 162
  end
  object trSWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 325
    Top = 221
  end
  object trSRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 272
    Top = 215
  end
  object actlst1: TActionList
    Left = 279
    Top = 4
    object actFindIP: TAction
      Caption = #1053#1072#1081#1090#1080' IP'
      Hint = #1053#1072#1081#1090#1080' '#1089#1074#1086#1073#1086#1076#1085#1099#1081' IP'
      ImageIndex = 7
      ShortCut = 118
      OnExecute = actFindIPExecute
    end
    object actExit: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 16397
      OnExecute = actExitExecute
    end
  end
  object dsParent: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select e.eid, e.name, s.street_name|| '#39' '#39'||s.street_short||'#39' '#39'||' +
        'h.house_no as adres'
      'from equipment e'
      '  inner join house h on (e.house_id = h.house_id)'
      '  inner join street s on (h.street_id = s.street_id)'
      'where e.eid <> :eid'
      'order by e.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcDataSource
    Left = 256
    Top = 298
  end
  object srcParent: TDataSource
    DataSet = dsParent
    Left = 302
    Top = 296
  end
  object cnError: TCnErrorProvider
    DoubleBuffer = False
    Left = 24
    Top = 176
  end
  object srcNODE: TDataSource
    DataSet = dsNODE
    Left = 149
    Top = 274
  end
  object dsNODE: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    N.Node_Id'
      
        '  , n.Name || '#39'/'#39' || o.O_Name || coalesce('#39' ('#39' || N.Notice || '#39')' +
        #39', '#39#39') as NODE_NAME'
      '  , N.Name'
      '  , N.Notice'
      '  , N.Floor_N'
      '  , N.Porch_N'
      '  , N.Place'
      '  , o.O_Name'
      '  , o.O_DIMENSION as COLOR'
      '  from NODES n'
      
        '       inner join objects o on (o.O_Id = n.Type_Id and o.O_Type ' +
        '= 38)'
      'where n.HOUSE_ID = :HOUSE_ID'
      'order by 2')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcHouse
    Left = 87
    Top = 273
  end
end
