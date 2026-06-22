object A4MainForm: TA4MainForm
  Left = 320
  Top = 200
  Caption = 'A4ON.TV'
  ClientHeight = 529
  ClientWidth = 979
  Color = clAppWorkSpace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Default'
  Font.Style = []
  FormStyle = fsMDIForm
  KeyPreview = True
  Menu = MainMenu
  Position = poDesigned
  ShowHint = True
  WindowState = wsMaximized
  WindowMenu = Window1
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object mdchldbr1: TMDIChildBar
    Left = 0
    Top = 484
    Width = 979
    Height = 26
    ParentColor = False
    ParentBackground = False
    Color = clBtnFace
    Align = alBottom
    MaxButtonWidth = 100
    GradientStartColor = clWhite
    ButtonGradientEndColor = 115185
    ButtonGradientStartColor = clWhite
    ButtonFrameColor = 102072
    ButtonSelectedColor = clInactiveCaption
    TopLine = False
    BottomLine = False
    UseMainMenu = False
    ShowMenuBtn = False
    ShowCloseBtn = False
    LineColor = 14922381
    HighLightFont.Charset = DEFAULT_CHARSET
    HighLightFont.Color = clWindowText
    HighLightFont.Height = -11
    HighLightFont.Name = 'Tahoma'
    HighLightFont.Style = []
    SeparateLineColor = clWhite
    HighLightFrameColor = 16046784
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 979
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object tbMain: TToolBar
      Left = 0
      Top = 0
      Width = 737
      Height = 25
      Align = alLeft
      BorderWidth = 1
      ButtonHeight = 21
      ButtonWidth = 117
      GradientEndColor = clBtnFace
      GradientStartColor = clBtnFace
      HotTrackColor = clBtnFace
      Indent = 5
      ShowCaptions = True
      TabOrder = 0
      Wrapable = False
      object btnA: TToolButton
        Tag = 1
        Left = 5
        Top = 0
        Action = OpenCustomers
      end
      object spP: TToolButton
        Tag = 2
        Left = 122
        Top = 0
        Width = 4
        Caption = 'spP'
        ImageIndex = 11
        Style = tbsSeparator
      end
      object btnP: TToolButton
        Tag = 2
        Left = 126
        Top = 0
        Action = OpenPaymentsDoc
      end
      object spR: TToolButton
        Tag = 4
        Left = 243
        Top = 0
        Width = 4
        Caption = 'spR'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object btnR: TToolButton
        Tag = 4
        Left = 247
        Top = 0
        Action = ActRequest
      end
      object spE: TToolButton
        Tag = 8
        Left = 364
        Top = 0
        Width = 4
        Caption = 'spE'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object btnE: TToolButton
        Tag = 8
        Left = 368
        Top = 0
        Action = actEquipment
      end
      object spN: TToolButton
        Left = 485
        Top = 0
        Width = 6
        Caption = 'spN'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object btnN: TToolButton
        Tag = 16
        Left = 491
        Top = 0
        Action = actNodes
      end
      object spT: TToolButton
        Left = 608
        Top = 0
        Width = 6
        Caption = 'spT'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object btnT: TToolButton
        Tag = 32
        Left = 614
        Top = 0
        Action = actTaskList
      end
    end
    object pnlDate: TPanel
      Left = 838
      Top = 0
      Width = 141
      Height = 25
      Align = alRight
      Anchors = [akRight]
      BevelInner = bvLowered
      Caption = #1040#1055#1056#1045#1051#1068' 2005'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Default'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnDblClick = pnlDateDblClick
    end
    object pnlSearch: TPanel
      Left = 737
      Top = 0
      Width = 101
      Height = 25
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      OnResize = pnlSearchResize
      DesignSize = (
        101
        25)
      object btnSearchCustomer: TSpeedButton
        Left = 74
        Top = 2
        Width = 23
        Height = 21
        Action = actSearchCustomer
        Anchors = [akTop, akRight]
        Flat = True
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
      end
      object cbSearchType: TDBComboBoxEh
        Left = 5
        Top = 2
        Width = 44
        Height = 19
        Hint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1086' '#1095#1077#1084' '#1080#1089#1082#1072#1090#1100' ('#1050#1054#1044') '#1082#1086#1076' '#1089#1090#1088#1086#1080#1082#1080' '#1087#1086#1080#1089#1082#1072' '#1087#1086' '#1101#1090#1086#1084#1091' '#1087#1086#1083#1102
        Ctl3D = True
        DynProps = <>
        DropDownBox.Rows = 15
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1063#1090#1086' '#1080#1097#1077#1084'?'
        EditButtons = <>
        Flat = True
        Items.Strings = (
          #1051#1080#1094#1077#1074#1086#1081' ('#1051')'
          #1050#1086#1076' ('#1050')'
          #1044#1086#1075#1086#1074#1086#1088' ('#1044')'
          #1060#1072#1084#1080#1083#1080#1103' ('#1060')'
          #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' ('#1055')'
          #1058#1077#1083#1077#1092#1086#1085' ('#1058')'
          #1059#1083#1080#1094#1072' ('#1059')'
          #1044#1077#1082#1086#1076#1077#1088' ('#1062')'
          'IP ('#1048' '#1080#1083#1080' I)'
          'MAC (M)'
          #1047#1072#1103#1074#1082#1072' ('#1047')'
          #1047#1072#1076#1072#1095#1072' ('#1063')'
          #1048#1053#1053'/'#1059#1053#1053' ('#1070')'
          #1050#1086#1085#1090#1072#1082#1090'('#1054')')
        KeyItems.Strings = (
          '2'
          '3'
          '1'
          '4'
          '5'
          '6'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '15'
          '16')
        ParentCtl3D = False
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnChange = cbSearchTypeChange
      end
      object edtSearch: TDBEditEh
        Left = 53
        Top = 2
        Width = 18
        Height = 19
        Hint = 
          '(F11) '#1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'. '#13#10#1089#1090#1088#1086#1082#1072' "'#1083' 1234"  '#1073#1091#1076#1077#1090' '#1085#1072#1081#1076#1077#1085' ' +
          #1072#1073#1086#1085#1077#1085#1090' '#1089' '#1083#1080#1094#1077#1074#1099#1084' 1234'#13#10'"'#1090' 223344" - '#1073#1091#1076#1077#1090' '#1085#1072#1081#1076#1077#1085' '#1072#1073#1086#1085#1077#1085#1090' '#1089' '#1090#1077#1083#1077 +
          #1092#1086#1085#1086#1084' 223344. '#13#10#1055#1091#1089#1090#1072#1103' '#1089#1090#1088#1086#1082#1072' - '#1089#1073#1088#1086#1089' '#1092#1080#1083#1100#1090#1088#1072'.'#13#10#1042#1086#1079#1084#1086#1078#1085#1086' '#1079#1072#1076#1072#1074#1072#1090 +
          #1100' '#1096#1072#1073#1083#1086#1085' '#1087#1086#1080#1089#1082#1072' '#1095#1077#1088#1077#1079' '#1089#1080#1084#1074#1086#1083' %.'#13#10#1053#1072#1087#1088#1080#1084#1077#1088' 2% - '#1074#1099#1076#1072#1089#1090' '#1074#1089#1077' '#1083#1080#1094#1077#1074#1099 +
          #1077' '#1085#1072#1095#1080#1085#1072#1102#1097#1080#1077#1089#1103' '#1089' 2'#13#10#1045#1089#1083#1080' '#1089#1087#1080#1089#1086#1082', '#1090#1086' '#1088#1072#1079#1076#1077#1083#1103#1077#1090#1089#1103' '#1079#1072#1087#1103#1090#1086#1081' '#1073#1077#1079' '#1087#1088#1086#1073 +
          #1077#1083#1086#1074' 1,2,3,4'
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EditButtons = <
          item
            ShortCut = 16467
            Style = ebsPlusEh
            Visible = False
          end>
        EmptyDataInfo.Text = #1057#1090#1088#1086#1082#1072' '#1073#1099#1089#1090#1088#1086#1075#1086' '#1087#1086#1080#1089#1082#1072' (F11)'
        Flat = True
        MRUList.Active = True
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnEnter = ed1Enter
        OnKeyUp = edtSearchKeyUp
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 510
    Width = 979
    Height = 19
    AutoHint = True
    Panels = <
      item
        Width = 50
      end>
  end
  object MainMenu: TMainMenu
    Left = 77
    Top = 232
    object N10: TMenuItem
      Caption = #1060#1072#1081#1083
      object miLanguage: TMenuItem
        Caption = #1042#1099#1073#1086#1088' '#1071#1079#1099#1082#1072
        Visible = False
        object N32: TMenuItem
          Tag = 1
          Caption = #1056#1091#1089#1089#1082#1080#1081' '#1103#1079#1099#1082
        end
        object English1: TMenuItem
          Tag = 2
          Caption = 'English'
        end
      end
      object actSettingUser1: TMenuItem
        Action = actSettingUser
      end
      object miChangePWD: TMenuItem
        Action = actChangePWD
      end
      object N26: TMenuItem
        Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1082#1091#1088#1089#1086#1088
        OnClick = N26Click
      end
      object N54: TMenuItem
        Caption = '-'
      end
      object miEvents: TMenuItem
        Caption = #1046#1091#1088#1085#1072#1083' '#1089#1086#1073#1099#1090#1080#1081
        OnClick = miEventsClick
      end
      object N11: TMenuItem
        Action = actJournal
      end
      object N37: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Action = actSettings
      end
      object miAdmin: TMenuItem
        Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1077
        object N39: TMenuItem
          Action = actAdminService
        end
        object miIndexSatat: TMenuItem
          Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1089#1090#1072#1090#1080#1089#1090#1080#1082#1091' '#1080#1085#1076#1077#1082#1089#1086#1074
          Hint = #1045#1089#1083#1080' '#1076#1072#1074#1085#1086' '#1085#1077' '#1076#1077#1083#1072#1083#1086#1089#1100' '#1074#1086#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#1073#1072#1079', '#1090#1086' '#1091#1089#1082#1086#1088#1080#1090' '#1088#1072#1073#1086#1090#1091' '#1055#1054
          OnClick = miIndexSatatClick
        end
        object N40: TMenuItem
          Action = actAdminQuery
        end
        object N41: TMenuItem
          Action = actAdminUsers
        end
        object miMonitorDB: TMenuItem
          Caption = #1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1081
          OnClick = miMonitorDBClick
        end
        object N42: TMenuItem
          Caption = '-'
        end
        object N38: TMenuItem
          Caption = #1055#1086#1076#1075#1086#1090#1086#1074#1080#1090#1100' '#1092#1072#1081#1083' '#1076#1083#1103' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1103' '#1055#1054
          OnClick = N38Click
        end
        object miUploadUpdate: TMenuItem
          Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1074' '#1041#1044
          OnClick = miUploadUpdateClick
        end
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object FileExitItem: TMenuItem
        Action = ApplicationExit
      end
    end
    object File1: TMenuItem
      Caption = #1054#1087#1077#1088#1072#1094#1080#1080
      Hint = #1054#1087#1077#1088#1072#1094#1080#1080
      object FileNewItem: TMenuItem
        Action = OpenCustomers
      end
      object mniNewCustomer: TMenuItem
        Action = actNewCustomer
      end
      object N18: TMenuItem
        Action = ActRequest
      end
      object miRecourses: TMenuItem
        Action = actRecourses
      end
      object N56: TMenuItem
        Action = actMessages
      end
      object N58: TMenuItem
        Action = actOrdersTP
      end
      object N57: TMenuItem
        Action = actTaskList
      end
      object N62: TMenuItem
        Action = actCallCenter
      end
      object miN72: TMenuItem
        Caption = '-'
      end
      object N68: TMenuItem
        Action = actFiles
      end
      object miReqFiles: TMenuItem
        Action = actReqPhotos
      end
      object N13: TMenuItem
        Caption = '-'
      end
      object N14: TMenuItem
        Action = actClosePeriod
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1084#1077#1089#1103#1094' ('#1053#1072#1095#1080#1089#1083#1080#1090#1100' '#1072#1073#1086#1085#1087#1083#1072#1090#1091')'
      end
      object N61: TMenuItem
        Action = actCloseDay
      end
      object N15: TMenuItem
        Action = actRecalcPeriod
      end
      object N4: TMenuItem
        Action = actReturnToPreviosMonth
        Caption = #1042#1086#1079#1074#1088#1072#1090' '#1085#1072' '#1087#1088#1077#1076#1099#1076#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
      end
      object miMapDev: TMenuItem
        Caption = '-'
      end
      object miMap: TMenuItem
        Action = actMap
      end
    end
    object Edit1: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Hint = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N9: TMenuItem
        Action = actServices
      end
      object N65: TMenuItem
        Action = actBonuses
      end
      object miPromo: TMenuItem
        Action = actPromo
      end
      object actBlackList1: TMenuItem
        Action = actBlackList
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object N34: TMenuItem
        Action = actVLANS
      end
      object N59: TMenuItem
        Action = actMan
      end
      object N44: TMenuItem
        Action = actEQGroups
      end
      object N43: TMenuItem
        Action = actEquipmentCommands
      end
      object N33: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Action = actZones
      end
      object N5: TMenuItem
        Action = actBuildings
      end
      object actOrgz1: TMenuItem
        Action = actOrgz
      end
      object N53: TMenuItem
        Action = actBanks
      end
      object miDocList: TMenuItem
        Action = actDocList
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object miTypes: TMenuItem
        Caption = #1058#1080#1087#1099' '#1076#1072#1085#1085#1099#1093
        object N20: TMenuItem
          Action = actRequestType
        end
        object N47: TMenuItem
          Action = actRecourseTPL
        end
        object N571: TMenuItem
          Action = ActOrdersTPType
        end
        object mniFileTypes: TMenuItem
          Action = actFileTypes
        end
        object miContactType: TMenuItem
          Action = actContactTypes
        end
        object miDeviceType: TMenuItem
          Action = actDeviceType
        end
        object miNodesType: TMenuItem
          Caption = #1058#1080#1087#1099' '#1091#1079#1083#1086#1074
          OnClick = miNodesTypeClick
        end
        object N49: TMenuItem
          Action = actNFileTypes
        end
        object miNodeLayouts: TMenuItem
          Action = actNodeLayouts
        end
        object miCableType: TMenuItem
          Action = actCableType
        end
        object miLabelType: TMenuItem
          Action = actLabelType
        end
        object miPortType: TMenuItem
          Action = actPortType
        end
        object miConnectType: TMenuItem
          Action = actConnectType
        end
        object miN73: TMenuItem
          Caption = '-'
        end
        object miObjectsRAW: TMenuItem
          Action = actObjectsRAW
        end
      end
      object N45: TMenuItem
        Caption = '-'
      end
      object N23: TMenuItem
        Action = actAttributes
      end
      object miMaterialsSubMenu: TMenuItem
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
        object N22: TMenuItem
          Action = actMaterials
        end
        object N60: TMenuItem
          Action = actMatDoc
        end
        object N63: TMenuItem
          Caption = '-'
        end
        object N64: TMenuItem
          Action = actShippers
        end
        object actWareHouses1: TMenuItem
          Action = actWareHouses
        end
      end
      object N25: TMenuItem
        Action = actLetters
      end
      object miRates: TMenuItem
        Caption = #1050#1091#1088#1089#1099' '#1074#1072#1083#1102#1090' (USD, EURO)'
        OnClick = miRatesClick
      end
      object miTimeSeries: TMenuItem
        Action = actTimeSeries
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object N51: TMenuItem
        Caption = #1055#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077
        object N19: TMenuItem
          Action = actWorkers
        end
        object N50: TMenuItem
          Action = actWorkTeams
        end
        object miCompany: TMenuItem
          Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
          OnClick = miCompanyClick
        end
        object N52: TMenuItem
          Action = actVATGroups
        end
      end
    end
    object N28: TMenuItem
      Caption = #1055#1083#1072#1090#1077#1078#1080
      OnClick = N28Click
      object FileOpenItem: TMenuItem
        Action = OpenPaymentsDoc
      end
      object N55: TMenuItem
        Action = actPayments
      end
      object N8: TMenuItem
        Action = actPaymentSources
      end
      object miPaymentType: TMenuItem
        Action = actPaymentType
      end
      object N29: TMenuItem
        Caption = '-'
      end
      object N30: TMenuItem
        Action = actCardsPay
      end
      object N27: TMenuItem
        Caption = '-'
      end
      object N31: TMenuItem
        Action = actLoadPays
      end
      object mniLoadServices: TMenuItem
        Action = actLoadServices
      end
      object N35: TMenuItem
        Caption = '-'
      end
      object N36: TMenuItem
        Action = actCashRegReports
      end
    end
    object miDVB: TMenuItem
      Caption = ' '#1058#1042' '
      object mi: TMenuItem
        Action = actChannel
      end
      object miEPG: TMenuItem
        Action = actEPG
      end
      object miEpgAd: TMenuItem
        Action = actEpgAd
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object N581: TMenuItem
        Action = actDecoders
      end
      object miDVBsettings: TMenuItem
        Action = actDVB
      end
      object miHETypes: TMenuItem
        Caption = #1058#1080#1087#1099' '#1043#1057
        OnClick = miHETypesClick
      end
      object N46: TMenuItem
        Action = actHeadEnds
      end
      object mniN48: TMenuItem
        Caption = '-'
      end
      object mniIPTVsettings: TMenuItem
        Action = actIPTVsettings
      end
      object N66: TMenuItem
        Caption = '-'
      end
      object N67: TMenuItem
        Action = actChanSources
      end
      object miSatCards: TMenuItem
        Action = actSatCards
      end
      object N69: TMenuItem
        Action = actDistributors
      end
      object N70: TMenuItem
        Action = actFreqPlan
      end
      object miN71: TMenuItem
        Caption = '-'
      end
      object miBroadcasIssues: TMenuItem
        Action = actBroadcasIssues
      end
      object miBCItypes: TMenuItem
        Action = actBCItypes
      end
      object miBCISolution: TMenuItem
        Action = actBCISolution
      end
    end
    object miCommunication: TMenuItem
      Caption = #1054#1073#1098#1077#1082#1090#1099' '#1089#1074#1103#1079#1080
      object N6: TMenuItem
        Action = actEquipment
      end
      object miNodes: TMenuItem
        Action = actNodes
      end
      object miLinks: TMenuItem
        Action = actLinks
      end
      object miPortView: TMenuItem
        Action = actPortView
      end
      object miN74: TMenuItem
        Caption = '-'
      end
      object miEE: TMenuItem
        Caption = #1069#1083#1077#1082#1090#1088#1086#1101#1085#1077#1088#1075#1080#1103
        object miEPoint: TMenuItem
          Action = actEPoint
        end
        object miERecipient: TMenuItem
          Action = actERecipient
        end
      end
    end
    object miMobile: TMenuItem
      Caption = #1052#1086#1073'. '#1082#1083#1080#1077#1085#1090
      object miCustomer: TMenuItem
        Caption = #1040#1073#1086#1085#1077#1085#1090
        object actMobileNews1: TMenuItem
          Action = actMobileNews
        end
      end
      object miWorker: TMenuItem
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
      end
      object N48: TMenuItem
        Action = actGPSMap
      end
    end
    object miReports: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1099
    end
    object miPlugIns: TMenuItem
      Caption = #1052#1086#1076#1091#1083#1080
    end
    object Window1: TMenuItem
      Caption = #1054#1082#1085#1072
      GroupIndex = 5
      Hint = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1086#1082#1085#1072#1084#1080
      object ileHorizontally1: TMenuItem
        Action = WindowTileHorizontal1
      end
      object ileVertically1: TMenuItem
        Action = WindowTileVertical1
      end
      object N3: TMenuItem
        Action = WindowClose1
      end
    end
    object Help1: TMenuItem
      Caption = '&'#1055#1086#1084#1086#1097#1100
      GroupIndex = 5
      Hint = #1055#1086#1084#1086#1097#1100
      object miFeedback: TMenuItem
        Caption = #1054#1073#1088#1072#1090#1085#1072#1103' '#1089#1074#1103#1079#1100
        Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1086#1096#1080#1073#1082#1091' '#1080#1083#1080' '#1087#1086#1078#1077#1083#1072#1085#1080#1077' '#1088#1072#1079#1088#1072#1073#1086#1090#1095#1080#1082#1091
        OnClick = miFeedbackClick
      end
      object N24: TMenuItem
        Action = HelpContents1
      end
      object Help2: TMenuItem
        Action = ActHelp
      end
      object HelpAboutItem: TMenuItem
        Action = HelpAbout1
      end
    end
  end
  object actlstMain: TActionList
    Images = ICONS_ACTIVE
    Left = 77
    Top = 160
    object OpenCustomers: TAction
      Category = 'Main'
      Caption = #1040#1073#1086#1085#1077#1085#1090#1099
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1072#1073#1086#1085#1077#1085#1090#1086#1074'|'#1057#1087#1080#1089#1086#1082' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      ShortCut = 16462
      OnExecute = OpenCustomersExecute
    end
    object OpenPaymentsDoc: TAction
      Category = #1055#1083#1072#1090#1077#1078#1080
      Caption = #1055#1083'. '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      Hint = #1055#1083#1072#1090#1077#1078#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099'| '#1054#1090#1082#1088#1099#1090#1100' '#1055#1083#1072#1090#1077#1078#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
      ShortCut = 16463
      OnExecute = OpenPaymentsDocExecute
    end
    object ApplicationExit: TAction
      Category = 'Main'
      Caption = #1042#1099#1093#1086#1076
      Hint = #1042#1099#1093#1086#1076' | '#1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      ImageIndex = 16
      OnExecute = ApplicationExitExecute
    end
    object HelpAbout1: TAction
      Caption = '&'#1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      Hint = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077'|'#1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1077#1088#1089#1080#1102' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      OnExecute = HelpAbout1Execute
    end
    object WindowClose1: TWindowClose
      Category = 'Window'
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1086#1082#1085#1086
      Enabled = False
      Hint = #1047#1072#1082#1088#1099#1090#1100' | '#1047#1072#1082#1088#1099#1090#1100' '#1072#1082#1090#1080#1074#1085#1086#1077' '#1086#1082#1085#1086
    end
    object actServices: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1059#1089#1083#1091#1075#1080
      Hint = #1059#1089#1083#1091#1075#1080
      OnExecute = actServicesExecute
    end
    object actBuildings: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1059#1083#1080#1094#1099' '#1080' '#1076#1086#1084#1072
      Hint = #1059#1083#1080#1094#1099' '#1080' '#1076#1086#1084#1072
      OnExecute = actBuildingsExecute
    end
    object actZones: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090#1099' '#1080' '#1088#1072#1081#1086#1085#1099
      Hint = #1059#1095#1072#1089#1090#1082#1080' '#1080' '#1079#1074#1077#1085#1100#1103
      ImageIndex = 19
      OnExecute = actZonesExecute
    end
    object actPaymentSources: TAction
      Category = #1055#1083#1072#1090#1077#1078#1080
      Caption = #1048#1089#1090#1086#1095#1085#1080#1082#1080' '#1087#1083#1072#1090#1077#1078#1077#1081
      Hint = #1048#1089#1090#1086#1095#1085#1080#1082#1080' '#1087#1083#1072#1090#1077#1078#1077#1081
      ImageIndex = 17
      OnExecute = actPaymentSourcesExecute
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1080#1089#1090#1077#1084#1099
      OnExecute = actSettingsExecute
    end
    object actLogin: TAction
      Caption = #1042#1093#1086#1076
    end
    object actClosePeriod: TAction
      Category = 'Main'
      Caption = #1053#1072#1095#1080#1089#1083#1080#1090#1100' '#1072#1073#1086#1085#1087#1083#1072#1090#1091' ('#1047#1072#1082#1088#1099#1090#1100' '#1084#1077#1089#1103#1094')'
      Hint = #1053#1072#1095#1080#1089#1083#1080#1090#1100' '#1072#1073#1086#1085#1087#1083#1072#1090#1091' '#1079#1072' '#1089#1083#1077#1076#1091#1102#1097#1080#1081' '#1087#1077#1088#1080#1086#1076
      OnExecute = actClosePeriodExecute
    end
    object actReturnToPreviosMonth: TAction
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1085#1072' '#1087#1088#1077#1076#1080#1076#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
      Hint = #1042#1077#1088#1085#1091#1090#1100#1089#1103' '#1085#1072' '#1087#1088#1077#1076#1080#1076#1091#1097#1080#1081' '#1084#1077#1089#1103#1094
      OnExecute = actReturnToPreviosMonthExecute
    end
    object actEquipment: TAction
      Category = 'Communication'
      Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1074' '#1089#1077#1090#1080
      Hint = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1086#1077' '#1074' '#1089#1077#1090#1080
      OnExecute = actEquipmentExecute
    end
    object ActRequest: TAction
      Category = 'Main'
      Caption = #1047#1072#1103#1074#1082#1080
      Hint = #1055#1055#1056' '#1080' '#1086#1073#1088#1072#1097#1077#1085#1080#1103' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      OnExecute = ActRequestExecute
    end
    object actWorkers: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
      Hint = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
      ImageIndex = 36
      OnExecute = actWorkersExecute
    end
    object actRequestType: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1058#1080#1087#1099' '#1079#1072#1103#1074#1086#1082
      Hint = #1058#1080#1087#1099' '#1088#1072#1073#1086#1090
      ImageIndex = 6
      OnExecute = actRequestTypeExecute
    end
    object actMaterials: TAction
      Category = #1052#1072#1090#1077#1088#1080#1072#1083#1099
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
      Hint = #1052#1072#1090#1077#1088#1080#1072#1083#1099
      ImageIndex = 38
      OnExecute = actMaterialsExecute
    end
    object actPaymentType: TAction
      Category = #1055#1083#1072#1090#1077#1078#1080
      Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1077#1081
      Hint = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1077#1081
      ImageIndex = 39
      OnExecute = actPaymentTypeExecute
    end
    object actAttributes: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1040#1090#1088#1080#1073#1091#1090#1099
      Hint = #1040#1090#1088#1080#1073#1091#1090#1099' '#1072#1073#1086#1085#1077#1085#1090#1086#1074', '#1091#1089#1083#1091#1075', '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103' '#1080' '#1090'.'#1076'.'
      ImageIndex = 41
      OnExecute = actAttributesExecute
    end
    object HelpContents1: THelpContents
      Category = 'Help'
      Caption = '&'#1057#1087#1088#1072#1074#1082#1072
      Enabled = False
      Hint = #1042#1099#1079#1086#1074' '#1089#1087#1088#1072#1074#1082#1080
      ImageIndex = 42
      OnExecute = HelpContents1Execute
    end
    object ActHelp: TAction
      Category = 'Help'
      Caption = #1055#1086#1084#1086#1097#1100
      ShortCut = 112
      Visible = False
      OnExecute = ActHelpExecute
    end
    object actRecalcPeriod: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1087#1077#1088#1080#1086#1076
      Visible = False
      OnExecute = actRecalcPeriodExecute
    end
    object actLetters: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1055#1077#1095#1072#1090#1085#1099#1077' '#1092#1086#1088#1084#1099
      ImageIndex = 30
      OnExecute = actLettersExecute
    end
    object actChannel: TAction
      Category = 'TV'
      Caption = #1058#1042' '#1082#1072#1085#1072#1083#1099
      ImageIndex = 28
      OnExecute = actChannelExecute
    end
    object actCardsPay: TAction
      Category = #1055#1083#1072#1090#1077#1078#1080
      Caption = #1050#1072#1088#1090#1099' '#1086#1087#1083#1072#1090
      Hint = #1050#1072#1088#1090#1099' '#1086#1087#1083#1072#1090
      OnExecute = actCardsPayExecute
    end
    object actCardsPaySerials: TAction
      Category = #1055#1083#1072#1090#1077#1078#1080
      Caption = #1057#1077#1088#1080#1080' '#1082#1072#1088#1090' '#1086#1087#1083#1072#1090
      Hint = #1057#1077#1088#1080#1080' '#1082#1072#1088#1090' '#1086#1087#1083#1072#1090
      OnExecute = actCardsPaySerialsExecute
    end
    object actLoadPays: TAction
      Category = #1055#1083#1072#1090#1077#1078#1080
      Caption = #1047#1072#1075#1088#1091#1079#1095#1080#1082' '#1087#1083#1072#1090#1077#1078#1077#1081
      Hint = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090' '#1076#1083#1103' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1101#1083'. '#1088#1077#1077#1089#1090#1088#1086#1074' '#1087#1083#1072#1090#1077#1078#1077#1081
      OnExecute = actLoadPaysExecute
    end
    object actBillingAll: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1041#1080#1083#1080#1085#1075' Internet'
    end
    object actVLANS: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1051#1086#1082#1072#1083#1100#1085#1099#1077' '#1089#1077#1090#1080
      Hint = #1051#1086#1082#1072#1083#1100#1085#1099#1077' '#1089#1077#1090#1080
      OnExecute = actVLANSExecute
    end
    object actCashRegReports: TAction
      Category = #1055#1083#1072#1090#1077#1078#1080
      Caption = #1054#1090#1095#1077#1090#1099' '#1060#1056
      OnExecute = actCashRegReportsExecute
    end
    object actJournal: TAction
      Caption = #1046#1091#1088#1085#1072#1083' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      OnExecute = actJournalExecute
    end
    object actAdminUsers: TAction
      Category = 'ADMIN'
      Caption = #1059#1087#1088#1072#1074#1083#1077#1085#1080#1077' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103#1084#1080
      OnExecute = actAdminUsersExecute
    end
    object actAdminQuery: TAction
      Category = 'ADMIN'
      Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077' '#1079#1072#1087#1088#1086#1089#1086#1074
      OnExecute = actAdminQueryExecute
    end
    object actAdminService: TAction
      Category = 'ADMIN'
      Caption = #1054#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1077' '#1089#1077#1088#1074#1077#1088#1072
      OnExecute = actAdminServiceExecute
    end
    object actEquipmentCommands: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1050#1086#1084#1072#1085#1076#1099' '#1076#1083#1103' '#1075#1088#1091#1087#1087
      OnExecute = actEquipmentCommandsExecute
    end
    object actOrgz: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      Hint = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1102#1097#1080#1077' '#1076#1086#1084#1072
      OnExecute = actOrgzExecute
    end
    object actEQGroups: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1043#1088#1091#1087#1087#1099' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
      Hint = #1043#1088#1091#1087#1087#1072' ('#1084#1072#1088#1082#1072') '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
      OnExecute = actEQGroupsExecute
    end
    object actHeadEnds: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1043#1086#1083#1086#1074#1085#1099#1077' '#1089#1090#1072#1085#1094#1080#1080
      OnExecute = actHeadEndsExecute
    end
    object actRecourseTPL: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1058#1080#1087#1099' '#1086#1073#1088#1072#1097#1077#1085#1080#1081
      Hint = #1058#1080#1087#1099' '#1086#1073#1088#1072#1097#1077#1085#1080#1081' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      ImageIndex = 49
      OnExecute = actRecourseTPLExecute
    end
    object actRecourses: TAction
      Caption = #1054#1073#1088#1072#1097#1077#1085#1080#1103' / '#1079#1074#1086#1085#1082#1080
      OnExecute = actRecoursesExecute
    end
    object actSubDiv: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
      OnExecute = actSubDivExecute
    end
    object actWorkTeams: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1059#1095#1072#1089#1090#1082#1080' '#1080' '#1047#1074#1077#1085#1100#1103
      OnExecute = actWorkTeamsExecute
    end
    object actWareHouses: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1057#1082#1083#1072#1076#1099
      ImageIndex = 39
      OnExecute = actWareHousesExecute
    end
    object actSearchCustomer: TAction
      Category = 'Actions'
      Hint = #1055#1086#1080#1089#1082' '#1072#1073#1086#1085#1077#1085#1090#1072
      ImageIndex = 7
      OnExecute = actSearchCustomerExecute
    end
    object actVATGroups: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1043#1088#1091#1087#1087#1099' '#1053#1044#1057
      OnExecute = actVATGroupsExecute
    end
    object WindowTileHorizontal1: TWindowTileHorizontal
      Category = 'Window'
      Caption = #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086
      Enabled = False
      Hint = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1086#1082#1085#1087' '#1075#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086
      ImageIndex = 51
    end
    object WindowTileVertical1: TWindowTileVertical
      Category = 'Window'
      Caption = #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086
      Enabled = False
      Hint = #1056#1072#1089#1087#1086#1083#1086#1078#1080#1090#1100' '#1086#1082#1085#1072' '#1074#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086
      ImageIndex = 52
    end
    object actChangePWD: TAction
      Category = 'ADMIN'
      Caption = #1057#1084#1077#1085#1072' '#1087#1072#1088#1086#1083#1103
      OnExecute = actChangePWDExecute
    end
    object actBanks: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1041#1072#1085#1082#1080
      OnExecute = actBanksExecute
    end
    object actSettingUser: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      OnExecute = actSettingUserExecute
    end
    object actPayments: TAction
      Category = #1055#1083#1072#1090#1077#1078#1080
      Caption = #1055#1083#1072#1090#1077#1078#1080
      OnExecute = actPaymentsExecute
    end
    object actMessages: TAction
      Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1103
      OnExecute = actMessagesExecute
    end
    object actDecoders: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1062#1080#1092#1088#1086#1074#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      OnExecute = actDecodersExecute
    end
    object actMan: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1080' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
      OnExecute = actManExecute
    end
    object ActOrdersTPType: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1058#1080#1087' '#1089#1090#1086#1088#1086#1085#1085#1080#1093' '#1079#1072#1082#1072#1079#1086#1074
      OnExecute = ActOrdersTPTypeExecute
    end
    object actOrdersTP: TAction
      Caption = #1057#1090#1086#1088#1086#1085#1085#1080#1077' '#1079#1072#1082#1072#1079#1099
      OnExecute = actOrdersTPExecute
    end
    object actLoadServices: TAction
      Category = #1055#1083#1072#1090#1077#1078#1080
      Caption = #1047#1072#1075#1088#1091#1079#1095#1080#1082' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
      Hint = #1048#1085#1089#1090#1088#1091#1084#1077#1085#1090' '#1076#1083#1103' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1101#1083'. '#1088#1077#1077#1089#1090#1088#1086#1074' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
      Visible = False
    end
    object actMatDoc: TAction
      Category = #1052#1072#1090#1077#1088#1080#1072#1083#1099
      Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      OnExecute = actMatDocExecute
    end
    object actCloseDay: TAction
      Category = 'Main'
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1076#1077#1085#1100
      Hint = #1053#1072#1095#1080#1089#1083#1080#1090#1100' '#1072#1073#1086#1085#1087#1083#1072#1090#1091' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1076#1077#1085#1100
      OnExecute = actCloseDayExecute
    end
    object actEPG: TAction
      Category = 'TV'
      Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1077#1088#1077#1076#1072#1095' (EPG)'
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1080' '#1087#1088#1086#1089#1084#1086#1090#1088' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1087#1077#1088#1077#1076#1072#1095
      OnExecute = actEPGExecute
    end
    object actDVB: TAction
      Category = 'TV'
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' DVB'
      Hint = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1077#1090#1080' DVB'
      OnExecute = actDVBExecute
    end
    object actEpgAd: TAction
      Category = 'TV'
      Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1074' EPG'
      Hint = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1074' '#1090#1077#1083#1077#1087#1088#1086#1075#1088#1072#1084#1084#1077
      OnExecute = actEpgAdExecute
    end
    object actShippers: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082#1080
      OnExecute = actShippersExecute
    end
    object actBonuses: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1041#1086#1085#1091#1089#1099
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1089#1080#1089#1090#1077#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1073#1086#1085#1091#1089#1086#1074' '#1072#1073#1086#1085#1077#1085#1090#1091
      OnExecute = actBonusesExecute
    end
    object actBlackList: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = '"'#1063#1077#1088#1085#1099#1081'" '#1089#1087#1080#1089#1086#1082
      OnExecute = actBlackListExecute
    end
    object actIPTVsettings: TAction
      Category = 'TV'
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' IPTV'
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080' IPTV'
      OnExecute = actIPTVsettingsExecute
    end
    object actNewCustomer: TAction
      Category = 'Actions'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      ImageIndex = 20
      OnExecute = actNewCustomerExecute
    end
    object actFileTypes: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1058#1080#1087#1099' '#1072#1073#1086#1085#1077#1085#1090#1089#1082#1080#1093' '#1092#1072#1081#1083#1086#1074
      OnExecute = actFileTypesExecute
    end
    object actGPSMap: TAction
      Category = #1052#1086#1073'_'#1082#1083#1080#1077#1085#1090
      Caption = #1050#1072#1088#1090#1072
      OnExecute = actGPSMapExecute
    end
    object actNFileTypes: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1058#1080#1087#1099' '#1092#1072#1081#1083#1086#1074' '#1091#1079#1083#1086#1074
      OnExecute = actNFileTypesExecute
    end
    object actNodes: TAction
      Tag = 16
      Category = 'Communication'
      Caption = #1059#1079#1083#1099' '#1089#1074#1103#1079#1080
      OnExecute = actNodesExecute
    end
    object actTaskList: TAction
      Category = 'Main'
      Caption = #1047#1072#1076#1072#1095#1080
      OnExecute = actTaskListExecute
    end
    object actCallCenter: TAction
      Category = 'Main'
      Caption = #1054#1090#1076#1077#1083' '#1086#1073#1079#1074#1086#1085#1072
      ImageIndex = 81
      OnExecute = actCallCenterExecute
    end
    object actChanSources: TAction
      Category = 'TV'
      Caption = #1048#1089#1090#1086#1095#1085#1080#1082#1080' '#1082#1072#1085#1072#1083#1086#1074
      OnExecute = actChanSourcesExecute
    end
    object actFiles: TAction
      Caption = #1060#1072#1081#1083#1099' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      Hint = #1060#1072#1081#1083#1099' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      OnExecute = actFilesExecute
    end
    object actSatCards: TAction
      Category = 'TV'
      Caption = #1050#1072#1088#1090#1086#1095#1082#1080' '#1086#1087#1077#1088#1072#1090#1086#1088#1072
      Hint = #1050#1072#1088#1090#1086#1095#1082#1080' / '#1076#1077#1082#1086#1076#1077#1088#1099' '#1080#1089#1087#1086#1083#1100#1079#1091#1077#1084#1099#1077' '#1085#1072' '#1043#1057' '#1086#1087#1077#1088#1072#1090#1086#1088#1072
      OnExecute = actSatCardsExecute
    end
    object actDistributors: TAction
      Category = 'TV'
      Caption = #1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088#1099' '#1082#1072#1085#1072#1083#1086#1074
      OnExecute = actDistributorsExecute
    end
    object actFreqPlan: TAction
      Category = 'TV'
      Caption = #1063#1072#1089#1090#1086#1090#1085#1099#1081' '#1087#1083#1072#1085
      OnExecute = actFreqPlanExecute
    end
    object Action1: TAction
      Caption = 'Action1'
    end
    object actSetToSearch: TAction
      Category = 'Actions'
      Caption = #1055#1086#1080#1089#1082
      ShortCut = 122
      OnExecute = actSetToSearchExecute
    end
    object actDeviceType: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1058#1080#1087' '#1084#1072#1090#1077#1088#1080#1072#1083#1072' / '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
      OnExecute = actDeviceTypeExecute
    end
    object actMap: TAction
      Caption = #1050#1072#1088#1090#1072' '#1087#1086#1082#1088#1099#1090#1080#1103
      OnExecute = actMapExecute
    end
    object actBroadcasIssues: TAction
      Category = 'TV'
      Caption = #1055#1088#1086#1073#1083#1077#1084#1099' '#1074#1077#1097#1072#1085#1080#1103
      OnExecute = actBroadcasIssuesExecute
    end
    object actBCItypes: TAction
      Category = 'TV'
      Caption = #1058#1080#1087' '#1087#1088#1086#1073#1083#1077#1084' '#1074#1077#1097#1072#1085#1080#1103
      OnExecute = actBCItypesExecute
    end
    object actBCISolution: TAction
      Category = 'TV'
      Caption = #1056#1077#1096#1077#1085#1080#1103' '#1087#1088#1086#1073#1083#1077#1084' '#1074#1077#1097#1072#1085#1080#1103
      OnExecute = actBCISolutionExecute
    end
    object actReqPhotos: TAction
      Category = 'Main'
      Caption = #1060#1086#1090#1086' '#1089' '#1079#1072#1103#1074#1086#1082
      OnExecute = actReqPhotosExecute
    end
    object actMobileNews: TAction
      Category = #1052#1086#1073'_'#1082#1083#1080#1077#1085#1090
      Caption = #1053#1086#1074#1086#1089#1090#1080' '#1076#1083#1103' '#1051#1050
      OnExecute = actMobileNewsExecute
    end
    object edtcpy1: TEditCopy
      Caption = '&'#1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1089#1090
      Hint = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1090#1077#1082#1089#1090' '#1074' '#1073#1091#1092#1077#1088#1072' '#1086#1073#1084#1077#1085#1072
      ImageIndex = 94
      ShortCut = 16451
    end
    object edtpst1: TEditPaste
      Caption = '&'#1042#1089#1090#1072#1074#1080#1090#1100' '#1090#1077#1082#1089#1090
      Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1090#1077#1082#1089#1090' '#1080#1079' '#1073#1091#1092#1077#1088#1072' '#1086#1073#1084#1077#1085#1072
      ImageIndex = 95
      ShortCut = 16470
    end
    object actLinks: TAction
      Category = 'Communication'
      Caption = #1050#1072#1073#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1088#1072#1089#1090#1088#1091#1082#1090#1091#1088#1072
      OnExecute = actLinksExecute
    end
    object actSearch: TAction
      Category = 'Actions'
      Caption = 'actSearch'
      ShortCut = 123
      OnExecute = actSearchExecute
    end
    object actPortView: TAction
      Category = 'Communication'
      Caption = #1057#1087#1080#1089#1086#1082' '#1087#1086#1088#1090#1086#1074' '#1074' '#1089#1077#1090#1080
      OnExecute = actPortViewExecute
    end
    object actCableType: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1058#1080#1087#1099' '#1082#1072#1073#1077#1083#1077#1081
      OnExecute = actCableTypeExecute
    end
    object actContactTypes: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1058#1080#1087#1099' '#1082#1086#1085#1090#1072#1082#1090#1086#1074' '#1072#1073#1086#1085#1077#1085#1090#1072
      OnExecute = actContactTypesExecute
    end
    object actLabelType: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1058#1080#1087#1099' '#1084#1072#1088#1082#1080#1088#1086#1074#1086#1082' '#1083#1080#1085#1080#1081' '#1089#1074#1103#1079#1080
      OnExecute = actLabelTypeExecute
    end
    object actConnectType: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1042#1080#1076' '#1082#1086#1085#1085#1077#1082#1090#1086#1088#1072
      Hint = #1042#1080#1076' '#1082#1086#1085#1085#1077#1082#1090#1086#1088#1072
      OnExecute = actConnectTypeExecute
    end
    object actPortType: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1058#1080#1087' '#1087#1086#1088#1090#1072
      Hint = #1058#1080#1087' '#1087#1086#1088#1090#1072
      OnExecute = actPortTypeExecute
    end
    object actDocList: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1056#1077#1077#1089#1090#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      OnExecute = actDocListExecute
    end
    object actPromo: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1040#1082#1094#1080#1080
      OnExecute = actPromoExecute
    end
    object EditCut1: TEditCut
      Caption = 'Cu&t'
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 105
      ShortCut = 16472
    end
    object EditCopy1: TEditCopy
      Caption = '&Copy'
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 106
      ShortCut = 16451
    end
    object EditPaste1: TEditPaste
      Caption = '&Paste'
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 107
      ShortCut = 16470
    end
    object EditSelectAll1: TEditSelectAll
      Caption = 'Select &All'
      Hint = 'Select All|Selects the entire document'
      ShortCut = 16449
    end
    object actObjectsRAW: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1055#1088#1103#1084#1086#1081' '#1076#1086#1089#1090#1091#1087' '#1082' '#1090#1072#1073#1083#1080#1094#1077' OBJECTS'
      Hint = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1077#1089#1083#1080' '#1087#1086#1085#1080#1084#1072#1077#1090#1077', '#1095#1090#1086' '#1076#1077#1083#1072#1077#1090#1077
      OnExecute = actObjectsRAWExecute
    end
    object actEPoint: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1058#1086#1095#1082#1080' '#1091#1095#1077#1090#1072' '#1101#1083#1077#1082#1090#1088#1086#1101#1085#1077#1088#1075#1080#1080
      OnExecute = actEPointExecute
    end
    object actERecipient: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1080' '#1086#1087#1083#1072#1090#1099' '#1101#1083#1077#1082#1090#1088#1086#1101#1085#1077#1088#1075#1080#1080
      OnExecute = actERecipientExecute
    end
    object actTimeSeries: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1061#1088#1086#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 56
      OnExecute = actTimeSeriesExecute
    end
    object actNodeLayouts: TAction
      Category = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Caption = #1058#1080#1087#1099' '#1082#1086#1084#1087#1086#1085#1086#1074#1082#1080' '#1091#1079#1083#1086#1074
      OnExecute = actNodeLayoutsExecute
    end
  end
  object ICONS_ACTIVE: TImageList
    ColorDepth = cd32Bit
    Left = 77
    Top = 96
    Bitmap = {
      494C01016B006C00040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000B0010000010020000000000000B0
      0100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6C6BFF6F6C6BFF000000006F6C
      6BFF0000000063B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF000000006F6C6BFF6F6C6BFF0000000068B8E8FF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF68B8E8FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000006F6C6BFF6F6C6BFF000000000000
      00000000000063B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF000000006F6C6BFF6F6C6BFF0000000063B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF6FBCEAFF9DD0F0FF70BCEAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      00000000000063B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF0000000000000000000000000000000063B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFFA6D5F1FFFFFFFFFFAAD7F2FF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000086868600008080008686
      8600008080008686860080000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00800000006F6C6BFF00000000000000000000
      00000000000063B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF0000000063B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF91CBEEFFFFFFFFFF99CFEFFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000868686000080
      8000868686000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      00000000000063B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF0000000063B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF99CEEFFFFFFFFFFFA5D4F1FF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000086868600008080008686
      8600008080008686860080000000FFFFFF00000000000000000000000000FFFF
      FF0080000000800000008000000080000000ACA9A7FFACA9A7FFACA9A7FFACA9
      A7FF0000000063B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF0000000063B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFFDBEDF9FFFFFFFFFFE7F3FAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000868686000080
      8000868686000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF008000000000000000ACA9A7FFACA9A7FFACA9A7FFACA9
      A7FF0000000063B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF0000000063B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFFA3D3F1FFEEF6FBFFADD8F2FF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000086868600008080008686
      8600008080008686860080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000800000000000000000000000ACA9A7FFACA9A7FFACA9A7FFACA9
      A7FF0000000063B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF0000000063B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000868686000080
      8000868686000080800080000000800000008000000080000000800000008000
      000080000000000000000000000000000000ACA9A7FFACA9A7FFACA9A7FFACA9
      A7FF0000000063B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF0000000067B7E8FF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF68B8E8FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000086868600008080008686
      8600008080008686860000808000868686000080800086868600008080008686
      860000808000000000000000000000000000ACA9A7FFACA9A7FFACA9A7FFACA9
      A7FF0000000063B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF0000000000000000B5B4B4FFC0C6
      C9FF00000000000000000000000000000000000000000000000000000000BCC1
      C4FFB5B4B4FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000868686000000
      0000000000000000000000000000000000000000000000000000000000008686
      860086868600000000000000000000000000ACA9A7FFACA9A7FFACA9A7FFACA9
      A7FF0000000063B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF63B7
      EAFF63B7EAFF63B7EAFF63B7EAFF63B7EAFF0000000000000000B4B3B3FFC5C5
      C5FF00000000000000000000000000000000000000000000000000000000C1C0
      C0FFB4B3B3FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000086868600868686000000
      0000000000000000000000000000000000000000000000000000000000008686
      860000808000000000000000000000000000ACA9A7FFACA9A7FFACA9A7FFACA9
      A7FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B8B7B7FFBFBE
      BEFF00000000000000000000000000000000000000000000000000000000BABA
      BAFFB9B8B8FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000868686000080
      80000000000000FFFF00000000000000000000FFFF0000000000868686000080
      800086868600000000000000000000000000ACA9A7FFACA9A7FFACA9A7FFACA9
      A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FF0000
      00000000000000000000000000006F6C6BFF0000000000000000C5C5C5FFB4B3
      B3FF000000000000000000000000000000000000000000000000D3D3D3FFB5B4
      B4FFC6C6C6FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ACA9
      A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FF0000
      000000000000000000000000000000000000000000000000000000000000B6B5
      B5FFB9B8B8FF00000000000000000000000000000000D5D4D4FFB7B6B6FFB7B6
      B6FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6C6BFF6F6C6BFF00000000ACA9
      A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FF0000
      000000000000000000006F6C6BFF6F6C6BFF000000000000000000000000D4D4
      D4FFB6B5B5FFB4B3B3FFBFBEBEFFC5C4C4FFBEBDBDFFB4B3B3FFB7B6B6FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6C6BFF6F6C6BFF00000000ACA9
      A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FFACA9A7FF0000
      00006F6C6BFF000000006F6C6BFF6F6C6BFF0000000000000000000000000000
      000000000000C6C6C6FFBAB9B9FFB6B5B5FFBAB9B9FFC7C7C7FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B9D4BFE7B9D4BFE7B9D4BFE7B9D
      4BFE1D24137F6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE1D23
      147F7B9D4BFE7B9D4BFE7B9D4BFE7B9D4BFE000000006F6C6BFF6F6C6BFF6F6C
      6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C
      6BFF6F6C6BFF767372FFF9F9F9FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B9D4BFE7B9D4BFE7B9D4BFE7B9D
      4BFE1D24137F6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE1D23
      147F7B9D4BFE7B9D4BFE7B9D4BFE7B9D4BFE0000000092908FFF6F6C6BFF6F6C
      6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C
      6BFF6F6C6BFF6F6C6BFFB6B5B4FF000000000000000000000000000000000000
      0000000000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006E6B6AFE6E6B6AFE00000000000000000000
      00000000000000000000000000000000000000000000F6F5F5FF8B8988FF7370
      6FFFDBDADAFF000000000000000000000000000000000000000000000000EAE9
      E9FFB5B4B3FF6F6C6BFF92908FFF000000000000000000000000000000000000
      0000800000000000000000000000800000000000000000000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      00000000000000000000000000001B1D177F1B1D177F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000008380
      7DFF6F6C6BFFEAE9E9FF00000000000000000000000000000000000000000000
      00000000000092908FFF6F6C6BFF000000000000000000000000000000000000
      0000800000000000000000000000800000000000000080000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      00000000000000000000000000007B9D4BFE7B9D4BFE00000000000000000000
      000000000000000000000000000000000000000000000000000000000000EAE9
      E9FF7B7978FF858282FFF2F2F2FF000000000000000000000000000000000000
      000000000000DAD9D9FF8D8B8AFF000000000000000000000000000000000000
      0000800000000000000000000000800000000000000080000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000000000000000000000
      00000000000000000000000000007B9D4BFE7B9D4BFE00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000767372FF6F6C6BFFFBFBFBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000000000000080000000000000000000
      0000800000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      00000000000000000000000000001D23147F1D23147F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000DAD9D9FF737170FF9E9B9BFFFDFDFDFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000000000000080000000800000008000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000005F5C5CEE6E6B6AFE6E6B6AFE6E6B
      6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B
      6AFE6E6B6AFE6E6B6AFE6E6B6AFE5F5C5CEE0000000000000000000000000000
      0000000000000000000000000000706D6CFF6F6C6BFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000000000000080000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000006E6B6AFEFBFBFBFEFBFBFBFEFBFB
      FBFEFBFBFBFEFBFBFBFEFBFBFBFEFBFBFBFEFBFBFBFEFBFBFBFEFBFBFBFEFBFB
      FBFEFBFBFBFEFBFBFBFEFBFBFBFE6B6867FD0000000000000000000000000000
      0000000000000000000000000000716E6DFF6F6C6BFFC7C6C6FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF000000000000000000FFFF
      FF00800000008000000080000000800000006E6B6AFED0CFCFFDAAA9A8FDA3A2
      A1FDD0CFCFFD585655FED0CFCFFDAAA9A8FDA3A2A1FDD0CFCFFD585655FED0CF
      CFFDAAA9A8FDA3A2A1FDD0CFCFFD6B6867FD0000000000000000000000000000
      000000000000EBEBEAFF7B7978FF6F6C6BFF6F6C6BFFF2F1F1FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000000000006E6B6AFEFBFBFBFE8C8B8AFD8786
      85FDF8F8F8FDF9F9F9FDF9F9F9FD8C8B8AFD878685FDF8F8F8FDF9F9F9FDF9F9
      F9FD8C8B8AFD878685FDF8F8F8FD6B6867FD0000000000000000000000000000
      000000000000858282FF6F6C6BFF6F6C6BFF797675FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000000000000000000006E6B6AFEFBFBFBFE8D8C8BFD9492
      92FDF9F9F9FDF9F9F9FDF9F9F9FD8D8C8BFD949292FDF9F9F9FDF9F9F9FDF9F9
      F9FD8D8C8BFD949292FDFBFBFBFE6B6867FD000000000000000000000000FDFD
      FDFF9D9B9AFF6F6C6BFF6F6C6BFFD1D0CFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000800000008000000080000000800000008000
      0000800000000000000000000000000000006E6B6AFED6D6D6FD9C9A9AFDA4A3
      A3FDD7D7D7FDF9F9F9FDD6D6D6FD9C9A9AFDA4A3A3FDD7D7D7FDF9F9F9FDD6D6
      D6FD9C9A9AFDA4A3A3FDD7D7D7FD6B6867FD000000000000000000000000A8A6
      A5FF6F6C6BFF6F6C6BFF6F6C6BFF000000000000000000000000000000000000
      000000000000A3A1A0FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000006E6B6AFEFBFBFBFEFBFBFBFEFBFB
      FBFEFBFBFBFEFBFBFBFEFBFBFBFEFBFBFBFEFBFBFBFEFBFBFBFEFBFBFBFEFBFB
      FBFEFBFBFBFEFBFBFBFEFBFBFBFE6B6867FD0000000000000000C8C7C6FF6F6C
      6BFF6F6C6BFFA3A1A0FFFEFEFEFF000000000000000000000000000000000000
      0000ABA9A9FF999796FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005E5B5BED6E6B6AFE6E6B6AFE6E6B
      6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B
      6AFE6E6B6AFE6E6B6AFE6E6B6AFE5E5B5BED00000000D6D5D5FF716E6DFF6F6C
      6BFF6F6C6BFFFBFBFBFF0000000000000000000000000000000000000000D2D1
      D1FF706D6CFFA5A3A2FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006F6C6BFF6F6C6BFF6F6C
      6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C6BFF6F6C
      6BFF6F6C6BFFC0BFBEFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B4773CFF402B159A000000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000912175160B2E5FD62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B4E7FE0E1B2364000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003B271493B4773CFF402B159A0000
      0001000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000172B377D62B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF1D37478D000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      000080000000800000008000000080000000000000013B271493B4773CFF402B
      159A000000010000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000203C4C9362B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF26475BA0000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008000000000000000000000013B271493B477
      3CFF402B159A0000000100000000000000000000000000000000000000000000
      0000000000000000000000000000000000002B4F65A962B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF305873B3000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000000000000000013D29
      1495B4773CFF3D29149500000001000000070000000400000000000000000000
      000000000000000000000000000000000000386783C062B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF3B6D8BC6000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      00013D291495B4773CFF784F29D0B0753CFCA76F38F6462E17A00000000E0000
      0000000000000000000000000000000000004580A4D762B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF4784A8D9000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000000000000000000000
      000000000001784F29D0B4773CFFB4773CFFB4773CFFB4773CFF462E17A00000
      000000000000000000000000000000000000559DC8ED62B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF539AC5EB000000000000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      000000000007B0753CFCB4773CFFB4773CFFB4773CFFB4773CFFA76F38F60000
      0005000000000000000000000000000000004F92BBE562B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6E9FF62B6
      E9FF62B6E9FF62B6E9FF4C8DB5E1000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF000000000000000000FFFF
      FF00800000008000000080000000800000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF000000000000000000FFFF
      FF00800000008000000080000000800000000000000000000000000000000000
      000000000007B0753CFCB4773CFFB4773CFFB4773CFFB4773CFFAE733AFB0000
      000700000000000000000000000000000000000000000B202A880B202A880B20
      2A880B202A880B202A880B202A880B202A880B202A880B202A880B202A880B20
      2A880B202A880B20298700000000000000000000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000000000000000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000000000000000000000000000000000000000
      000000000001784F29D0B4773CFFB4773CFFB4773CFFB4773CFF784F29D00000
      000100000000000000000000000000000000000000002A7496FF2A7496FF2A74
      96FF2A7496FF2A7496FF2A7496FF2A7496FF2A7496FF2A7496FF2A7496FF2A74
      96FF2A7496FF2A7294FD00000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000000000000000000000000000000000000000000000000
      00013D291495B4773CFF784F29D0B0753CFCB0753CFC784F29D0B4773CFF3D29
      149500000001000000000000000000000000000000002A7496FF2A7496FF2A74
      96FF2A7496FF2A7496FF2A7496FF143949B30919207709192077091920770919
      2077091920770610156000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000013D29
      1495B4773CFF3D291495000000010000000700000007000000013D291495B477
      3CFF3D29149500000001000000000000000000000000235D79E52A7496FF2A74
      96FF2A7496FF2A7292FC0D252F90000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000013B271493B477
      3CFF402B159A0000000200000000000000000000000000000000000000013B27
      1493B4773CFF402B159A00000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001A2210777CA14CFF7CA14CFF7CA14CFF0000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000013B271493B4773CFF402B
      159A000000020000000000000000000000000000000000000000000000000000
      00013B271493B4773CFF402B159A000000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000080B05456C8C42EE7CA14CFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003B271493B4773CFF402B159A0000
      0002000000000000000000000000000000000000000000000000000000000000
      0000000000013B271493B4773CFF402B159A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000C10075167843FE8080A04427CA14CFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B4773CFF402B159A000000020000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000013B271493B4773CFF0000000000000000000000000000
      000000000000000000000000000000000000000100177CA14CFF7CA14CFF7CA1
      4CFF566F35D40304022B000000001F2813800000000000000007130C06540000
      0000000000000000000000000000000000000000000000000000000000000000
      00000707073F090909470000000000000000B1753AFFB1753AFFB1753AFFB175
      3AFFB1753AFFB1753AFFB1753AFFB1753AFFB1753AFFB1753AFFB1753AFFB175
      3AFFB1753AFFB1753AFFB1753AFFB1753AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000085F3E1FBBAE743BFD0F0A
      054C000000000000000000000000000000000000000000000000000000000A0A
      0A4D4E4E4ED0585858DD0C0C0C5300000000B07339FFEBE0D4FFEBE0D4FFEBE0
      D4FFEBE0D4FFB07339FFEBE0D4FFEBE0D4FFEBE0D4FFEBE0D4FFEBE0D4FFB073
      39FFECE1D5FFE8DFD6FFDADAE6FF2E48CAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      000080000000800000008000000080000000412B159CB0763BFEB0763BFE9E69
      34F10C0804450000000000000000000000000000000000000000080808456D6D
      6DF618181876252525912424248E00000000B07339FFEBE0D4FFEBE0D4FFEBE0
      D4FFEBE0D4FFB07339FFEBE0D4FFEBE0D4FFEBE0D4FFEBE0D4FFEBE0D4FFB073
      39FFE2DDDDFFD4D7EDFFD2D7F0FF2E48CAFF0000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008000000019100861A56D36F6B0763BFEB076
      3BFEA76F38F80D0804460000000000000000000000000606063E6B6B6BF47676
      76FE767676FE3D3D3DB90000000800000000B1753AFFB1753AFFB1753AFFB175
      3AFFB1753AFFB1753AFFB1753AFFB1753AFFB1753AFFB1753AFFB1753AFFB073
      39FF2E48CAFF2E48CAFF2E48CAFF2E48CAFF0000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000086868600008080008686
      8600008080008686860080000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF0080000000000000000A07033FA56D36F6B076
      3BFEB0763BFE986532ED0000000B0000000005050537696969F1767676FE7676
      76FE3E3E3EBB000000090000000000000000757575FFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFF2E48
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2E48CAFF0000000000000000000000000000
      000000000000000000000000000080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000808000868686000080
      8000868686000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008000000000000000000000001A110863AD73
      3AFCB0763BFE927151FA0404043204040431656565ED767676FE767676FE4141
      41BE0000000A000000000000000000000000757575FFFCFCFCFFFCFCFCFFE9E9
      E9FF939190FFEAEAEAFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFF2E48
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2E48CAFF0000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000086868600008080008686
      8600008080008686860080000000FFFFFF00000000000000000000000000FFFF
      FF0080000000800000008000000080000000000000000000000000000000120C
      0652513C27B73A3A39B304040430626262EA767676FE767676FE424242C00000
      000B00000000000000000000000000000000757575FFFCFCFCFFEDEDEDFF817D
      7BFF6D6A69FF827D7BFFEEEEEEFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFF2E48
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2E48CAFF0000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000808000868686000080
      8000868686000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000000000000000000000000000000000000000
      000000000000030202295F5F5FE6767676FE767676FE444444C30000000C0000
      000000000000000000000000000000000000757575FFFCFCFCFFD7D6D5FFBEBD
      BCFF6E6B6AFFBDBCBCFFD8D7D7FFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFF2E48
      CAFF2E48CAFF2E48CAFF2E48CAFF2E48CAFF0000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000086868600008080008686
      8600008080008686860080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000000000000000000000000000000000002070707410F0F
      0F5C080808465B5B5BE1767676FE767676FE464646C50000000E000000000000
      0000000000011E1E1E830202022700000000757575FFFCFCFCFFF8F8F8FFF9F9
      F9FF6E6B6AFFFBFBFBFFF8F8F8FFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFF2E48
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2E48CAFF0000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF000000000000000000FFFF
      FF00800000008000000080000000800000000000000000808000868686000080
      8000868686000080800080000000800000008000000080000000800000008000
      00008000000000000000000000000000000000000007424242C0767676FE7676
      76FE767676FE767676FE767676FE474747C70303032A494949C90303032C0000
      00001A1A1A7A767676FE5D5D5DE301010122757575FFFCFCFCFFFCFCFCFFF9F9
      F9FF6E6B6AFFFBFBFBFFFAFAFAFFDCDBDBFFEEEEEEFFFCFCFCFFFBFBFBFF2E48
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2E48CAFF0000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000000000000000000086868600008080008686
      8600008080008686860000808000868686000080800086868600008080008686
      86000080800000000000000000000000000018181876767676FE767676FE5B5B
      5BE1767676FE767676FE4D4D4DCF0000000F1C1C1C7E767676FE5F5F5FE62F2F
      2FA2494949C9767676FE767676FE545454D9757575FFFCFCFCFFFCFCFCFFFAFA
      FAFF767373FFE0DFDFFFFBFBFBFFC2C1C0FF807A79FFE8E7E7FFFBFBFBFF2E48
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2E48CAFF0000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000000000000000000000000000000808000868686000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600868686000000000000000000000000004C4C4CCD767676FE1E1E1E820000
      00002B2B2B9C767676FE3C3C3CB700000000000000012E2E2EA1737373FD7676
      76FE757575FE757575FE6C6C6CF50D0D0D58757575FFFCFCFCFFFCFCFCFFFCFC
      FCFFCAC9C9FF757271FF726F6EFF726F6EFF6D6A69FF8A8887FFFAFAFAFF2E48
      CAFF2E48CAFF2E48CAFF2E48CAFF2E48CAFF0000000000000000FFFFFF000000
      000000000000FFFFFF0000000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000086868600868686000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600008080000000000000000000000000005D5D5DE42121218A000000000000
      00001616166F767676FE4F4F4FD10000000000000000050505366F6F6FF87676
      76FE767676FE696969F20000000C00000000757575FFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFF9F9F9FFF5F5F5FFC6C5C5FF787675FFE1E1E0FFFBFBFBFF2E48
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2E48CAFF0000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000868686000080
      80000000000000FFFF00000000000000000000FFFF0000000000868686000080
      8000868686000000000000000000000000000F0F0F5C00000000000000000808
      08456D6D6DF6767676FE2E2E2EA00000000000000000080808456D6D6DF67676
      76FE747474FD191919770000000000000000757575FFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFAFAFAFFD3D2D1FFE8E7E7FFFCFCFCFFFBFBFBFF2E48
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2E48CAFF0000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000707073F6B6B
      6BF4767676FE4F4F4FD10101011A090909482222228A6F6F6FF8767676FE7373
      73FD1C1C1C7E000000000000000000000000757575FFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFF2E48
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2E48CAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000171717722121
      21890D0D0D56000000050000000002020223121212651E1E1E831C1C1C7D0606
      063E00000000000000000000000000000000757575FF757575FF757575FF7575
      75FF757575FF757575FF757575FF757575FF757575FF757575FF737373FF2E48
      CAFF2E48CAFF2E48CAFF2E48CAFF2E48CAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000393837B96B6867FD6E6B
      6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B
      6AFE6E6B6AFE6B6867FD393837B9000000000000000000000000000000000000
      0000000000000000000000000000000000000101001C27321891313E1EA21319
      0C670000000C0000000000000000000000000000000000000000B1763CFEB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFF000000000000000000000000808000FF808000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6867FDF8F8F8FDF9F9
      F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FDF6F6F6FCF4F3F6FCF9F9
      F9FDF9F9F9FDF8F8F8FD6C6968FD00000000353535AC737373FC747474FD7474
      74FD747474FD747474FD02020228171E0E71242F168C212B1486293518941921
      1076181C13741C1D1B7F03030129000000000000000000000000AF743CFDB376
      3CFFB3763CFFB3763CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3763CFFB376
      3CFFB3763CFFB3763CFF000000000000000000000000808000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E6B6AFEF9F9F9FDC1BC
      B9FDD8D6D4FDE8E7E6FDF9F9F9FDF9F9F9FDDBD9F3FCD5D2F2FCDAD8F3FCD4D1
      F2FCF1F0F6FCF9F9F9FD6E6B6AFE00000000747474FCF5F5F5FCF7F7F7FCF7F7
      F7FCF7F7F7FCF7F7F7FC0000000B181F0E722B381B99161D0D6F1A220F771A22
      0F77252B1E9040413EBD171D0F712D3B1B9D0000000000000000B3763CFFB376
      3CFFB3763CFFB3763CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3763CFFB376
      3CFFB3763CFFB3763CFF00000000000000000000000000000000000000008080
      00FF808000FF808000FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E6B6AFEF9F9F9FDF0EF
      EFFD9E9691FD978F89FDB1ABA8FDA69FA8FDB2ACC5FCD3D0DDFCCFCBE8FCF2F1
      F6FCD6D4F2FCF9F9F9FD6E6B6AFE00000000747474FDF7F7F7FCA47F58FDA47F
      58FDA47F58FDA47F58FD0000000B161C0D6D2935189418200F7413190B662834
      1893252B1E90414340BF20291585273318920000000000000000B3763CFFB275
      3BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB275
      3BFFB2753BFFB3763CFF00000000000000000000000000000000000000008080
      00FF808000FF808000FF808000FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000006E6B6AFEF9F9F9FDE3E1
      E0FDCAC6C4FCE2E0DFFCECEBEAFCBDBAD6FCBEB9C1FBB2ACCDFB9A92B3FCE3E1
      F2FCDAD7F3FCF9F9F9FD6E6B6AFE00000000747474FDF7F7F7FCA47F58FDF4E4
      C7FDF4E4C7FDA27D57FC000000081D25117D1E27127F6C8C43F0789D4AFD2D39
      1C9C191B1879434341C026311990181F0E730000000000000000B2753BFFB275
      3BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB275
      3BFFB2753BFFB3763CFF00000000000000000000000000000000000000008080
      00FF808000FF808000FF808000FF808000FF0000000000000000000000000000
      000000000000000000000000000000000000000000006E6B6AFEF9F9F9FDF9F9
      F9FDE6E4E3FDCAC6C3FDCFCCCAFDE1DFF4FCE2E0F4FCD2CFF2FCD2CFF2FCDCDA
      F3FCD7D4F2FCF9F9F9FD6E6B6AFE00000000747474FDF7F7F7FCA47F58FDF4E4
      C7FDF4E4C7FDA27D57FC010100122530168E789B48FC6D8D43F1272E1C92383A
      35B14C4C48CD2B33219A2B371A9812180B640000000500000000B2753BFFB275
      3BFFFFFFFFFFFFFFFFFFB2753BFFFFFFFFFFFFFFFFFFB2753BFFFFFFFFFFFFFF
      FFFFB2753BFFB3763CFF00000000000000000000000000000000000000000000
      0000808000FF808000FF808000FF808000FF808000FF00000000000000000000
      000000000000000000000000000000000000000000006E6B6AFEF9F9F9FDF9F9
      F9FDF9F9F9FDF9F9F9FDF9F9F9FDF6F6F6FCD1CDF2FCE0DEF4FCE5E3F4FCD5D2
      F2FCE9E8F5FCF9F9F9FD6E6B6AFE00000000747474FDF7F7F7FCA47F58FDA47F
      58FDA47F58FDA47F58FD4D3C2AAF0504022D02030125090B0749545454D9292D
      23964A5D2FC77B9D4BFE65833EE910160A600000000000000000B2753BFFB275
      3BFFFFFFFFFFFFFFFFFFB2753BFFFFFFFFFFFFFFFFFFB2753BFFFFFFFFFFFFFF
      FFFFB2753BFFB2753BFF00000000000000000000000000000000000000000000
      000000000000808000FF808000FF808000FF808000FF808000FF000000000000
      000000000000000000000000000000000000000000006E6B6AFEF9F9F9FDF9F9
      F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FDE9E8F5FCE2E1F4FCF3F3
      F6FCF9F9F9FDF9F9F9FD6E6B6AFE00000000747474FDF7F7F7FCF7F7F7FCF7F7
      F7FCF7F7F7FCA47F58FDF4E4C7FDF2E2C5FC5D4833C012110F46000000031015
      095E4A5F2DC72935189400000014000000000000000000000000B2753BFFB275
      3BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB275
      3BFFB2753BFFB2753BFF00000000000000000000000000000000000000000000
      00000000000000000000808000FF808000FF808000FF808000FF808000FF0000
      000000000000000000000000000000000000000000006E6B6AFEF6F6F6FCB6B5
      B5FDB1B0B0FEB1B0B0FEB1B0B0FEB1B0B0FEB1B0B0FEB1B0B0FEB1B0B0FEB1B0
      B0FEB7B6B6FDF9F9F9FD6E6B6AFE00000000747474FDF7F7F7FCF7F7F7FCF7F7
      F7FCF7F7F7FCA47F58FDF4E4C7FDF4E4C7FDA27D57FCF4E4C7FDC9BCA5E6433E
      368503030227111111434F4F4FD1000000000000000000000000B2753BFFB275
      3BFFFFFFFFFFFFFFFFFFB2753BFFFFFFFFFFFFFFFFFFB2753BFFFFFFFFFFFFFF
      FFFFB2753BFFB2753BFF00000000000000000000000000000000000000000000
      0000000000000000000000000000808000FF808000FF808000FF808000FF8080
      00FF00000000000000000000000000000000000000006E6B6AFEF9F9F9FDF9F9
      F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9
      F9FDF9F9F9FDF9F9F9FD6E6B6AFE00000000747474FDF7F7F7FCF7F7F7FCF7F7
      F7FCF7F7F7FCA47F58FDA47F58FDA47F58FDA47F58FDA47F58FDA47F58FDA47F
      58FDA47F58FDF5F5F5FB747474FD000000000000000000000000B2753BFFB275
      3BFFFFFFFFFFFFFFFFFFB2753BFFFFFFFFFFFFFFFFFFB2753BFFFFFFFFFFFFFF
      FFFFB2753BFFB2753BFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000808000FF808000FF808000FF8080
      00FF808000FF000000000000000000000000000000006E6B6AFEF6F6F6FCB6B5
      B5FDB1B0B0FEB1B0B0FEB1B0B0FEB1B0B0FEB7B6B6FDF9F9F9FDF9F9F9FDF9F9
      F9FDF9F9F9FDF9F9F9FD6E6B6AFE00000000747474FDF7F7F7FCF7F7F7FCF7F7
      F7FCF7F7F7FCF7F7F7FCF7F7F7FCF7F7F7FCF7F7F7FCF7F7F7FCF7F7F7FCF7F7
      F7FCF7F7F7FCF7F7F7FC747474FD000000000000000000000000B2753BFFB275
      3BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB275
      3BFFB2753BFFB2753BFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000808000FF808000FF8080
      00FF808000FF808000FF0000000000000000000000006E6B6AFEF9F9F9FDF9F9
      F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FD918E8EFD6E6B
      6AFE6E6B6AFE6E6B6AFE5F5C5CEE00000000AE743BFDAE743BFDAE743BFDAE74
      3BFDAE743BFDAE743BFDAE743BFDAE743BFDAE743BFDAE743BFDAE743BFDAE74
      3BFDAE743BFDAE743BFDAE743BFD000000000000000000000000B2753BFFB275
      3BFFFFFFFFFFFFFFFFFFB2753BFFFFFFFFFFFFFFFFFFB2753BFFFFFFFFFFFFFF
      FFFFB2753BFFB2753BFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808000FF8080
      00FF00000000000000000000000000000000000000006E6B6AFEF6F6F6FC8383
      83FD767676FE767676FE767676FE767676FE858585FDF9F9F9FD6E6B6AFEF6F6
      F6FCE6E5E5FD7C7978FC0F0F0F6100000000AE743BFDAE743BFDAE743BFDAE74
      3BFDAE743BFDAE743BFDAE743BFDAE743BFDAE743BFDAE743BFDAE743BFDAE74
      3BFDAE743BFDAE743BFDAE743BFD000000000000000000000000B2753BFFB275
      3BFFFFFFFFFFFFFFFFFFB2753BFFFFFFFFFFFFFFFFFFB2753BFFFFFFFFFFFFFF
      FFFFB2753BFFB2753BFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      00FF00000000808000FF808000FF00000000000000006E6B6AFEF9F9F9FDF9F9
      F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FD6E6B6AFEE6E6
      E6FD7C7A79FC111110660000000000000000AC7138FBAE743BFD000000007474
      74FD00000000AE743BFDAE743BFDAE743BFDAE743BFDAE743BFD000000007474
      74FD00000000AE743BFDAC7138FB000000000000000000000000B2753BFFB275
      3BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB2753BFFB275
      3BFFB2753BFFB2753BFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808000FF808000FF00000000000000006C6968FDF8F8F8FDF9F9
      F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FDF9F9F9FD6E6B6AFE7C7A
      79FC11111167000000000000000000000000452E17A0AC7138FB000000007474
      74FD00000000AE743BFDAE743BFDAE743BFDAE743BFDAE743BFD000000007474
      74FD00000000AC7138FB452E17A0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000393837B96B6867FD6E6B
      6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE6E6B6AFE605D5CEF1010
      1064000000000000000000000000000000000000000000000000000000007474
      74FD000000000000000000000000000000000000000000000000000000007474
      74FD000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000798BD3FF000000000000
      000000000000000000007889D2FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000001100000001000000000000000083A9
      49FD85AD49FF0000000500000000000000000000000000000000000000000000
      0000000000000000000000000000000000007889D4FF132FC5FF132FC5FF0000
      000000000000132FC5FF132FC5FF798AD2FF0000000000000000BDD4E3FF8FC4
      E5FF6CB8E7FF5DB3E8FF5CB3E9FF5CB3E8FF6BB8E8FF8CC3E6FFB8D2E3FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDD4E3FF8FC4E5FF6CB8E7FF5DB3E8FF5CB3E9FF5CB3E8FF6BB8
      E8FF8CC3E6FFB8D2E3FF00000000000000000000000000000000000000000000
      00000000000002020228555555D8767676FF5C5C5CE2050505390000000083A9
      49FD85AD49FF00000005000000000000000000000000808080FF737373FF7373
      73FF737373FF737373FF737373FFAEAEAEFF00000000132FC5FF132FC5FF233D
      C7FF2A43C8FF132FC5FF132FC5FF00000000000000005CB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3
      E9FF000000000000000000000000000000000000000000000000000000000000
      00005CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF5CB3E9FF000000000000000000000000000000000000
      000000000000292B2B9957585ADC0505053900000002000000020000000083A9
      49FD85AD49FF00000005000000000000000000000000737373FF737373FF7373
      73FF737373FF737373FF737373FF747474FFB9B9B9FF000000002C44C8FF132F
      C5FF132FC5FF2D45C8FF000000000000000060B7EDFF5CB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF78BDE7FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000077BCE7FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF5CB3E9FF5DB3E8FF00000000000000000000000C0306
      072F070E12490D151A5C101A20670000000585AD49FF85AD49FF85AD49FF85AD
      49FF85AD49FF85AD49FF85AD49FF85AD49FF00000000737373FF737373FF7373
      73FF737373FF737373FF737373FF747474FFB9B9B9FF000000002942C8FF132F
      C5FF132FC5FF233DC7FF00000000000000005EB7EEFF5CB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF9CC9E5FF00000000AB508DFFAB50
      8DFFAB508DFF000000000000000000000000000000000000000085AD49FF85AD
      49FF85AD49FF000000007CBEE6FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF152630754984ABDA64B5E8FE64B7
      EAFF64B7EAFF64B7EAFF60AFE0FA0000000585AD49FF85AD49FF85AD49FF85AD
      49FF85AD49FF85AD49FF85AD49FF85AD49FF00000000737373FF737373FF7373
      73FF737373FF737373FF737373FFAFAFAFFF00000000132FC5FF132FC5FF2C44
      C8FF2A43C8FF132FC5FF132FC5FF000000005EB7EEFF5CB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF5CB3E9FF74BBE7FF86C1E6FF0000000000000000AB50
      8DFFAB508DFFAB508DFF000000000000000000000000000000000000000085AD
      49FF85AD49FF85AD49FF0000000082BFE6FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF0912175162B3E6FD64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF64B7EAFF070D104500000003000000030000000183A9
      49FD85AD49FF00000005000000010000000000000000737373FF737373FF7373
      73FF737373FF0000000000000000000000007486D4FF132FC5FF132FC5FF0000
      000000000000132FC5FF132FC5FF7B8CD3FF5EB7EEFF5CB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF9AC8E5FF000000000000000000000000000000000000
      0000AB508DFFAB508DFFAB508DFF000000000000000000000000000000000000
      000085AD49FF85AD49FF85AD49FF0000000085C0E6FF5CB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF00000000172B367C64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF0000000583A9
      49FD85AD49FF00000005000000000000000000000000737373FF737373FF7373
      73FF737373FF00000000B47133FFB77A41FF000000007587D4FF00000000B9B9
      B9FFB9B9B9FF000000007889D4FF000000005EB7EEFF5CB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FFB7D2E3FFAE5190FFAE5190FFAC518EFFAB508DFFAB50
      8DFFAB508DFFAB508DFFAB508DFFAB508DFF87B04AFF87B04AFF85AD49FF85AD
      49FF85AD49FF85AD49FF85AD49FF85AD49FF000000006DB9E7FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF00000000000000023E7190C964B7
      EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF0000000583A9
      49FD85AD49FF0000000500000000000000000000000000000000000000000000
      00000000000000000000B47133FFB47133FFB77A41FF00000000000000000000
      0000000000000000000000000000000000005EB7EEFF5CB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FFB6D2E3FFAB508DFFAB508DFFAB508DFFAB508DFFAB50
      8DFFAB508DFFAB508DFFAB508DFFAB508DFF85AD49FF85AD49FF85AD49FF85AD
      49FF85AD49FF85AD49FF85AD49FF85AD49FF000000006FB9E7FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF00000000000000000911154F64B7
      EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF080F134A0000
      000300000001000000000000000000000000737373FF737373FF737373FF7373
      73FF737373FF0000000000000000000000000000000000000000737373FF7373
      73FF737373FF737373FF737373FF000000005EB7EEFF5CB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF97C6E5FF000000000000000000000000000000000000
      0000AB508DFFAB508DFFAB508DFF000000000000000000000000000000000000
      000085AD49FF85AD49FF85AD49FF0000000089C2E6FF5BB2E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF00000000000000000000000A62B3
      E4FC64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7
      EAFF0205072D000000000000000000000000737373FF737373FF737373FF7373
      73FF737373FF737373FF737373FF737373FF737373FF737373FF737373FF7373
      73FF737373FF737373FF737373FF000000005EB7EEFF55B0E8FF4DACE7FF47A9
      E6FF43A7E5FF40A6E5FF48A8E5FF59AFE4FF6AB5E3FF0000000000000000AB50
      8DFFAB508DFFAB508DFF000000000000000000000000000000000000000085AD
      49FF85AD49FF85AD49FF000000006FB7E3FF40A6E5FF48A8E5FF40A6E5FF43A7
      E5FF47A9E6FF4CABE6FF55AFE8FF5CB3E9FF000000000000000000000000579F
      CBEE64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B5
      E8FE00000007000000000000000000000000737373FF737373FF737373FF7373
      73FF737373FF737373FF737373FF737373FF737373FF737373FF737373FF7373
      73FF737373FF737373FF737373FF0000000044AAEAFF7CC0ECFFCDE7F8FFFEFE
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2FF00000000AB508DFFAB50
      8DFFAB508DFF000000000000000000000000000000000000000085AD49FF85AD
      49FF85AD49FF00000000F6F6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFD1E8F9FF81C2ECFF40A6E5FF0000000000000000000000003C6E
      8CC664B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF4B89
      AFDD00000000000000000000000000000000828282FF757575FF737373FF7575
      75FF757575FF757575FF757575FF757575FF757575FF757575FF757575FF7575
      75FF757575FF737373FF848484FF00000000F3FBFFFFFEFFFFFFA7D5F1FF72BD
      EBFF52AEE6FF3FA5E5FF41A6E5FF3FA5E5FF69B6E5FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B2D7EDFF72BDEBFF52AEE6FF3FA5E5FF41A6E5FF3FA5E5FF51AE
      E6FF72BDEBFFA6D5F0FFFBFDFFFFF5FAFDFF0000000000000000000000000A14
      195564B5E8FE64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF1120
      286B00000000000000000000000000000000000000000000000000000000B4B4
      B4FF00000000000000000000000000000000000000000000000000000000BBBB
      BBFF000000000000000000000000000000009DD4F5FF3FA5E5FF50ADE7FF56B0
      E8FF5AB2E8FF5CB3E9FF5CB3E9FF5CB3E9FF5AB2E8FF56B0E8FF50ADE7FF40A5
      E5FF91CCEFFF0000000000000000000000000000000000000000000000009DD4
      F5FF3FA5E5FF50ADE7FF56B0E8FF5AB2E8FF5CB3E9FF5CB3E9FF5CB3E9FF5AB2
      E8FF56B0E8FF50ADE7FF40A5E5FF91CCEFFF0000000000000000000000000000
      00001526307560AFE0FA64B7EAFF64B7EAFF64B7EAFF62B3E6FD1C3441880000
      0000000000000000000000000000000000000000000000000000000000007373
      73FFABABABFF0000000000000000000000000000000000000000ABABABFF7373
      73FF0000000000000000000000000000000066B7EAFF5BB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3
      E9FF5DB2E6FF00000000000000000000000000000000000000000000000066B7
      EAFF5BB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3E9FF5CB3
      E9FF5CB3E9FF5CB3E9FF5CB3E9FF5DB2E6FF0000000000000000000000000000
      000000000000010203215092BBE464B7EAFF64B7EAFF050A0D3D000000000000
      000000000000000000000000000000000000000000000000000000000000B0B0
      B0FF737373FF737373FF737373FF737373FF737373FF737373FF737373FFB0B0
      B0FF0000000000000000000000000000000000000000000000009EC9E5FF82BF
      E6FF6FB9E7FF64B6E8FF62B5E8FF64B6E8FF6FB9E7FF82BFE6FF9DC9E5FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009EC9E5FF82BFE6FF6FB9E7FF64B6E8FF62B5E8FF64B6E8FF6FB9
      E7FF82BFE6FF9DC9E5FF00000000000000000000000000000000000000000000
      000000000000000000001628347962B3E6FD36627EBB00000001000000000000
      000000000000000000000000000000000000959595FF676767FF676767FF6767
      67FF676767FF676767FF676767FF676767FF676767FF676767FF676767FF6767
      67FF676767FF676767FF676767FF949494FF0000000000000000CAAD90FFA965
      24FFC29C76FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000085AD
      4AFF85AD49FF0000000000000000000000000000000000000000000000000000
      000000000000A96627FFCDB59EFF000000000000000000000000000000000000
      000000000000000000000000000000000000676767FFFEFEFEFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF00000000B88651FFF9F7F5FFA25B
      14FFAB6727FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000085AD
      4AFF85AD49FF0000000000000000000000000000000000000000000000000000
      000000000000CFBAA5FFAB6727FFA96627FF0000000000000000000000000000
      000000000000000000000000000000000000676767FFFEFEFEFFFEFEFEFF9D9D
      9DFF999999FF999999FF999999FF999999FF999999FF999999FF999999FF9999
      99FF9D9D9DFFFFFFFFFFFFFFFFFF676767FFC7A88AFFA65F1CFFDCC1A8FFCCA6
      7DFFA86220FFB98A5AFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000808080FF757575FF7575
      75FF757575FF757575FF757575FFC4C4C4FF00000000000000000000000085AD
      4AFF85AD49FF00000000000000000000000000000000808080FF737373FF7373
      73FFB2B2B2FF00000000A96627FF0000000000000000A96627FF00000000B6B6
      B6FF737373FF808080FF0000000000000000676767FFFEFEFEFFFEFEFEFF9999
      99FFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFF
      FFFF999999FFFFFFFFFFFFFFFFFF676767FFB07339FFAA6727FFA6601DFFFDFE
      FDFFA6601DFFAA6727FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000757575FF757575FF7575
      75FF757575FF757575FF777777FF0000000085AD49FF85AD49FF85AD49FF85AD
      49FF85AD49FF85AD49FF85AD49FF85AD49FF00000000737373FF737373FF7373
      73FF838383FF000000000000000000000000AB6727FFAC6B2DFFA96627FF0000
      0000B6B6B6FF737373FF0000000000000000676767FFFEFEFEFFFEFEFEFF9999
      99FFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFF
      FFFF999999FFFFFFFFFFFFFFFFFF676767FFAF7237FFAB6828FFA86220FFCBA1
      79FFDEC3ABFFA65F1CFFC59F78FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000757575FF757575FF7575
      75FF757575FF757575FF777777FF0000000085AD49FF85AD49FF85AD49FF85AD
      49FF85AD49FF85AD49FF85AD49FF85AD49FF00000000737373FF737373FF7373
      73FF737373FF8C8C8CFF00000000A96627FFAD6D30FFAB6727FFAC6B2DFFA966
      27FF00000000B6B6B6FF0000000000000000676767FFFEFEFEFFFEFEFEFF9D9D
      9DFF999999FF999999FF999999FF999999FF999999FF999999FF999999FF9999
      99FF999999FFFFFFFFFFFFFFFFFF676767FFC09970FFAB6828FFAB6827FFA25A
      15FFF9F5F0FFC5A382FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000757575FF757575FF7575
      75FF757575FF757575FF757575FFC4C4C4FF00000000000000000000000085AD
      4AFF85AD49FF00000000000000000000000000000000737373FF737373FF7373
      73FF737373FF737373FF8D8D8DFF00000000A96627FFAD6D30FFAB6727FFAC6B
      2DFFA96627FF000000000000000000000000676767FFFEFEFEFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFF
      FFFF999999FFFFFFFFFFFFFFFFFF676767FF00000000AB6828FFAB6828FFAA67
      26FFC19D77FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000757575FF757575FF7575
      75FF757575FF00000000000000000000000000000000000000000000000085AD
      4AFF85AD49FF00000000000000000000000000000000737373FF737373FF7373
      73FF737373FF00000000000000000000000000000000A96627FFAD6D30FFAB67
      27FFAC6B2DFFA96627FF0000000000000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFF
      FFFF999999FFFFFFFFFFFFFFFFFF676767FF00000000B98A5AFFAB6828FFAB68
      28FFAF7339FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000757575FF757575FF7575
      75FF757575FF00000000B47335FFB47335FFB47335FF000000000000000085AD
      4AFF85AD49FF00000000000000000000000000000000737373FF737373FF7373
      73FF737373FF00000000B47133FFB47133FFBD8B57FF00000000A96627FFAD6D
      30FFAB6727FFAC6B2DFF0000000000000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF9D9D9DFF999999FF999999FF9D9D9DFF999999FF9999
      99FF9D9D9DFFFFFFFFFFFFFFFFFF676767FF0000000000000000AB6828FFAB68
      28FFAB6828FFC6A788FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B47335FFB47335FFB47335FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B47133FFB47133FFB47133FF0000000000000000A966
      27FFAD6D30FF0000000000000000A96627FF676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF0000000000000000CAAD92FFAB68
      28FFAB6828FFAB6828FFCFBAA6FF000000000000000000000000000000000000
      000000000000000000000000000000000000757575FF757575FF757575FF7575
      75FF757575FF0000000000000000000000000000000000000000757575FF7575
      75FF757575FF757575FF757575FF00000000737373FF737373FF737373FF7373
      73FF737373FF00000000000000000000000000000000000000008D8D8DFF0000
      00000000000000000000A96627FFA96627FF676767FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF000000000000000000000000B98A
      59FFAB6828FFAB6828FFAB6828FFCAAE93FF0000000000000000C7A889FFA964
      22FFB1773FFF000000000000000000000000757575FF757575FF757575FF7575
      75FF757575FF757575FF757575FF757575FF757575FF757575FF757575FF7575
      75FF757575FF757575FF757575FF00000000737373FF737373FF737373FF7373
      73FF737373FF737373FF737373FF737373FF737373FF737373FF737373FF8E8E
      8EFF00000000A96627FFA96627FFD3C2B2FFB2763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF0000000000000000000000000000
      0000B88755FFAB6828FFAB6828FFAB6828FFB37B45FFCAAB8BFFFDFBF9FFB67D
      47FFA65F1BFFAA6727FFC29E79FF00000000757575FF757575FF757575FF7575
      75FF757575FF757575FF757575FF757575FF757575FF757575FF757575FF7575
      75FF757575FF757575FF757575FF00000000737373FF737373FF737373FF7373
      73FF737373FF737373FF737373FF737373FF737373FF737373FF737373FF7373
      73FF888888FFB4B4B4FFB7B7B7FF00000000B2763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF0000000000000000000000000000
      000000000000B88856FFAB6828FFAB6828FFAB6828FFA96421FFAC6A2BFFF3EB
      E1FFDBBEA4FFA35B15FFA96625FFB07238FF828282FF777777FF757575FF7777
      77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
      77FF777777FF757575FF848484FF00000000828282FF757575FF737373FF7575
      75FF757575FF757575FF757575FF757575FF757575FF757575FF757575FF7575
      75FF757575FF737373FF848484FF00000000B3763CFFB3763CFF000000006767
      67FF00000000B3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFF0000
      0000676767FF00000000B3763CFFB3763CFF0000000000000000000000000000
      00000000000000000000C4A281FFAB6828FFAB6828FFAB6828FFAA6626FFA35A
      15FFD0AB88FFF9F5F1FFB3743AFFB0753DFF000000000000000000000000B4B4
      B4FF00000000000000000000000000000000000000000000000000000000BBBB
      BBFF00000000000000000000000000000000000000000000000000000000B4B4
      B4FF00000000000000000000000000000000000000000000000000000000BBBB
      BBFF00000000000000000000000000000000B57B44FFB3763CFF000000006767
      67FF00000000B3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFF0000
      0000676767FF00000000B3763CFFB47A43FF0000000000000000000000000000
      000000000000000000000000000000000000AE6F33FFAB6828FFAB6828FFAB68
      27FFA7601EFFB17237FFF0E7DEFF000000000000000000000000000000007575
      75FFABABABFF0000000000000000000000000000000000000000ABABABFF7575
      75FF000000000000000000000000000000000000000000000000000000007373
      73FFABABABFF0000000000000000000000000000000000000000ABABABFF7373
      73FF000000000000000000000000000000000000000000000000000000006767
      67FF000000000000000000000000000000000000000000000000000000000000
      0000676767FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CDB59EFFB1763EFFAB68
      28FFAD6D2FFFC09A72FF0000000000000000000000000000000000000000B0B0
      B0FF757575FF757575FF757575FF757575FF757575FF757575FF757575FFB0B0
      B0FF00000000000000000000000000000000000000000000000000000000B0B0
      B0FF737373FF737373FF737373FF737373FF737373FF737373FF737373FFB0B0
      B0FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000FFFF0000FFFF0000000000CC
      FFFF00CCFFFF00000000008000FF008000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B3763CFFB3763CFFB3763CFFB1753CFF000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000700000007000000000000FFFF0000FFFF0000000000CC
      FFFF00CCFFFF00000000008000FF008000FF0000000000000000000000000000
      00000000000000000000B1753CFFB3763CFFB3763CFFB3763CFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B3763CFFB3763CFFB3763CFFB1753CFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D
      4DFF4D4D4DFF4D4D4DFF4D4D4DFF000000000000FFFF0000FFFF0000000000CC
      FFFF00CCFFFF00000000008000FF008000FF0000000000000000000000000000
      000000000000B1753CFFB3763CFFB3763CFFB3763CFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3763CFFB3763CFFB3763CFFB175
      3CFF00000000000000000000000000000000FFFFFFFF393939FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF3B3B3BFFFFFFFFFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D
      4DFF4D4D4DFF4D4D4DFF4D4D4DFF000000000000FFFF0000FFFF0000000000CC
      FFFF00CCFFFF00000000008000FF008000FF0000000000000000000000000000
      0000B1753CFFB3763CFFB3763CFFB3763CFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3763CFFB3763CFFB376
      3CFFB1753CFF000000000000000000000000FFFFFFFF3D3D3DFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF3F3F3FFFFFFFFFFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D
      4DFF4D4D4DFF4D4D4DFF4D4D4DFF000000000000FFFF0000FFFF4D4D4DFF4D4D
      4DFF4D4D4DFF00000000008000FF008000FF000000000000000000000000B175
      3CFFB3763CFFB3763CFFB3763CFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3763CFFB376
      3CFFB3763CFFB1753CFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D
      4DFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D
      4DFF4D4D4DFF00000000008000FF008000FF0000000000000000B1753CFFB376
      3CFFB3763CFFB3763CFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3763DFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB1753CFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF010101224D4D4DFF4D4D4DFF4D4D
      4DFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D
      4DFF4D4D4DFF00000000008000FF008000FF00000000B1753CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763DFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB1753CFFFFFFFFFF393939FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF3B3B3BFFFFFFFFFF00000000000000000000001A4040
      40E94D4D4DFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D4DFF4D4D4DFF1C1C1C9B0000
      000000000000000000000000000000000000B1753CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763DFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB1753CFF00000000FFFFFFFF3D3D3DFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF3F3F3FFFFFFFFFFF0000000000000000000000000000
      0000000000004B4B4BFFEFEFEFFF4C4C4CFF4D4D4DFF00000000000000000000
      00000000000000000000000000000000000000000000B1753CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3763CFFB376
      3CFFB3763CFFB1753CFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      00003A3A3ADD4D4D4DFF929292FF454545FF4D4D4DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000B1753CFFB376
      3CFFB3763CFFB3763CFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3763CFFB3763CFFB376
      3CFFB1753CFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      00004D4D4DFF4A4A4AFFFFFFFFFF434343FF4D4D4DFF4D4D4DFF000000000000
      000000000000000000000000000000000000000000000000000000000000B175
      3CFFB3763CFFB3763CFFB3763CFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3763CFFB3763CFFB3763CFFB175
      3CFF00000000000000000000000000000000FFFFFFFF393939FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF3B3B3BFFFFFFFFFF0000000000000000000000000F0F
      0F704D4D4DFF4C4C4CFFF9F9F9FF5E5E5EFF4D4D4DFF4D4D4DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B1753CFFB3763CFFB3763CFFB3763CFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B3763CFFB3763CFFB3763CFFB1753CFF0000
      000000000000000000000000000000000000FFFFFFFF3D3D3DFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF3F3F3FFFFFFFFFFF0000000000000000000000003B3B
      3BDD4D4D4DFF4D4D4DFF474747FFFFFFFFFF505050FF4D4D4DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B1753CFFB3763CFFB3763CFFB3763CFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B3763CFFB3763CFFB3763CFFB1753CFF000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000003F3F
      3FE54D4D4DFF595959FF494949FF808080FFD9D9D9FF4D4D4DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B1753CFFB3763CFFB3763CFFB3763CFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000001313
      137F4D4D4DFFEEEEEEFFFFFFFFFFFFFFFFFF4E4E4EFF4D4D4DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      00004D4D4DFF4C4C4CFF464646FF474747FF4D4D4DFF0E0E0E6F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2B1A6FF995D24FF9453
      16FF975A20FFBEA99AFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2B1A6FF995D24FF9453
      16FF975A20FFBEA99AFF00000000000000000000000000000000000000000000
      0000EAEAEAFFA29F9EFF6F6D6DFF6F6D6DFF6F6D6DFF6F6D6DFF6F6D6DFF6F6D
      6DFF6F6D6DFF6F6D6DFF6F6D6DFF939090FF0000000000000000B56C9DFFAB50
      8DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB50
      8DFFAB508DFFAB508DFFAB508DFFAB508DFF0000000000000000000000000000
      000000000000000000000000000000000000A8795BFFA46C37FFD2B79DFFC8A8
      88FFCEB296FFA46C37FFA06A46FF0000000000000000AC558FFFAB508DFFAB50
      8DFFAB508DFFAB508DFFAB508DFFC9A1BBFFA8795BFFA46C37FFD2B79DFFC8A8
      88FFCEB296FFA46C37FFA06A46FF000000000000000000000000000000000000
      0000F6F6F6FF797777FFB2B2B2FFE2E2E2FFEEEEEEFFECECECFFE9E9E9FFEBEB
      EBFFEEEEEEFFE9E9E9FFB0B0B0FF6F6D6DFF00000000B4689BFFAB508DFFAC52
      8EFFFFFFFFFFFFFFFFFFAB518DFFAE5792FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFAB508DFFAB508DFFAB508DFF00000000A2C8E0FF64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF96C7E6FFC1ADA0FFA46C37FFFFFFFFFFA46C37FFFCFA
      F9FFA46C37FFFFFFFFFFA46C37FFC1AE9CFFB4689BFFAB508DFFAC528EFFFFFF
      FFFFFFFFFFFFAB518DFFC28EB0FFC1ADA0FFA46C37FFFFFFFFFFA46C37FFFCFA
      F9FFA46C37FFFFFFFFFFA46C37FFC1AE9CFF0000000000000000000000000000
      0000F6F6F6FF797777FFD6D4D3FF9E9C9CFFEBE7E6FFE5E1E0FFDEDBDAFFE4E0
      DFFFEBE8E7FFA3A1A1FFD1CFCEFF6F6D6DFF00000000AB518DFFAB508DFFAC52
      8EFFFFFFFFFFFFFFFFFFAB518DFFAE5792FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFAB508DFFAB508DFFAB508DFFAFB4B7FFB2CCDCFF64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF00000000A46C37FFA46C37FFA46C37FFA46C37FFA46C
      37FFA46C37FFA46C37FFA46C37FFA46C37FFAB518DFFAB508DFFAC528EFFFFFF
      FFFFFFFFFFFFAB518DFF00000000A46C37FFA46C37FFA46C37FFA46C37FFA46C
      37FFA46C37FFA46C37FFA46C37FFA46C37FF0000000000000000000000000000
      0000F6F6F6FF797777FFEFECEBFFCDCAC8FF9D9A99FFB4B0AFFF8F8D8DFFB0AD
      ACFFA6A3A2FFC3BFBEFFF0EEECFF6F6D6DFF00000000AB518DFFAB508DFFAC52
      8EFFFFFFFFFFFFFFFFFFAB518DFFAE5792FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFAB508DFFAB508DFFAB508DFF999A9CFF0000000064B7EAFF64B7
      EAFF64B7EAFF64B7EAFF00000000A46C37FFFFFFFFFFFFFFFFFF945316FFFFFF
      FFFF945316FFFFFFFFFFFFFFFFFFA46C37FFAB518DFFAB508DFFAC528EFFFFFF
      FFFFFFFFFFFFAB518DFF00000000A46C37FFFFFFFFFFFFFFFFFF945316FFFFFF
      FFFF945316FFFFFFFFFFFFFFFFFFA46C37FF0000000000000000000000000000
      0000F3F3F3FF797777FFEBE9E7FFE7E3E0FF8C8A8AFFACAAAAFFEDEAEAFFB5B3
      B3FF838282FFE4E0DEFFECE9E8FF6F6D6DFF00000000AB518DFFAB508DFFAC52
      8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFAB508DFFAB508DFFAB508DFF828383FF000000006EB9E8FF64B7
      EAFF64B7EAFF64B7EAFF00000000A46C37FFA46C37FFA46C37FFA46C37FFA46C
      37FFA46C37FFA46C37FFA46C37FFA46C37FFAB518DFFAB508DFFAC528EFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000A46C37FFA46C37FFA46C37FFA46C37FFA46C
      37FFA46C37FFA46C37FFA46C37FFA46C37FF00000000C6A48BFFBE916EFFC097
      76FFEEE2DAFF797777FFE8E6E4FFAAA8A7FFBBBABAFFFDF9F9FFFDF5F5FFFDF8
      F8FFC7C6C6FF9E9D9CFFE7E4E3FF6F6D6DFF00000000AB518DFFAB508DFFAB50
      8DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB50
      8DFFAB508DFFAB508DFFAB508DFFAB508DFF767676FF000000008CC1E3FF64B7
      EAFF64B7EAFF64B7EAFF00000000C3B0A2FFA46C37FFFFFFFFFFA46C37FFFCFA
      F9FFA46C37FFFFFFFFFFA46C37FFC3B09EFFAB518DFFAB508DFFAB508DFFAB50
      8DFFAB508DFFAB508DFF00000000C3B0A2FFA46C37FFFFFFFFFFA46C37FFFCFA
      F9FFA46C37FFFFFFFFFFA46C37FFC3B09EFFC09B81FFEBD1BAFFFFFCE9FFFFFF
      E9FFFFFFF7FF797777FFB3B2B1FFC2C1C1FFFDFBFBFFFEF9F9FFFEF9F9FFFEF9
      F9FFFDFBFBFFC9C8C8FFABAAA9FF6F6D6DFF00000000AB518DFFAB508DFFAB50
      8DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB50
      8DFFAB508DFFAB508DFFAB508DFFAB508DFF767676FFBDC0C2FFA9CADEFF64B7
      EAFF64B7EAFF64B7EAFF96C7E6FF00000000A6785AFFA46C37FFD2B79DFFC8A8
      88FFCEB296FFA46C37FF9F6945FF00000000AB518DFFAB508DFFAB508DFFAB50
      8DFFAB508DFFAB508DFFC08AADFF00000000A6785AFFA46C37FFD2B79DFFC8A8
      88FFCEB296FFA46C37FF9F6945FF00000000B78863FFFFFFF0FFFFFFEDFFFFFD
      DFFFFFFDF3FF797777FFBEBEBEFFF8F7F7FFF8F7F7FFF8F7F7FFF8F7F7FFF8F7
      F7FFF8F7F7FFF8F7F7FFC5C5C5FF6F6D6DFF00000000AB518DFFAB508DFFE5CA
      DCFFFEFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFE7CDDEFFAB508DFFAB508DFF767676FFA5A7A8FF0000000064B7
      EAFF64B7EAFF64B7EAFF64B7EAFFAACEE4FF00000000C7B6AAFF995B23FF9453
      16FF975920FFC1AC9EFFBBD4E3FF00000000AB518DFFAB508DFFE5CADCFFFEFD
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEFF00000000C7B6AAFF995B23FF9453
      16FF975920FFC1AC9EFFC9A1BBFF00000000B68864FFFEF7E8FFFEFEECFFFEFC
      DEFFFFFDF0FFB4B2ACFF797777FF797777FF797777FF797777FF797777FF7977
      77FF797777FF797777FF797777FFA8A7A6FF00000000AB518DFFAB508DFFFDFB
      FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFAB508DFFAB508DFF767676FF8E8F8FFF0000000068B8
      E9FF64B7EAFF64B7EAFF64B7EAFF64B7EAFF96C7E6FF00000000000000000000
      00000000000096C7E6FF6BB9E9FF00000000AB518DFFAB508DFFFDFBFCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FF00000000000000000000
      000000000000C08AADFFAB508DFF00000000D1BDAEFFCDA88AFFFDEAD8FFFFFB
      E0FFFAF9DFFFFFFEF1FFFFFDF3FFFFFDF3FFFFFEF4FFFFFEF6FFFFFFF8FFFFFC
      F7FFF2E8E1FFF2EBE7FFF6F6F6FFEDEDEDFF00000000AB518DFFAB508DFFFDFC
      FDFFFFFFFFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
      B8FFFFFFFFFFFFFFFFFFAB518DFFAB508DFF767676FF787878FF000000008CC2
      E4FF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF64B7E9FF00000000AB518DFFAB508DFFFDFCFDFFFFFF
      FFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFFFFF
      FFFFFFFFFFFFAB518DFFAB508DFF0000000000000000D3C1B3FFBD9473FFEED5
      BDFFFFFFEBFFFFFFE5FFFDFDE1FFFEFEE2FFFEFEE8FFFEFEEEFFFEEEDBFFCAA4
      87FFD2BDADFF00000000000000000000000000000000AB518DFFAB508DFFFDFC
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFAB518DFFAB508DFF767676FF767676FFBDBFC0FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AB518DFFAB508DFFFDFCFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFAB518DFFAB508DFF000000000000000000000000CCB4A0FFE8CF
      BAFFFFFFF8FFFFFFF4FFFEFEF1FFFFFFEEFFFDEBD6FFFFF8E9FFEAD4C0FFCBAD
      97FF0000000000000000000000000000000000000000AB518DFFAB508DFFFDFC
      FDFFFFFFFFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
      B8FFFFFFFFFFFFFFFFFFAB518DFFAB508DFF767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF767676FF767676FF767676FF767676FF7676
      76FF767676FF767676FF0000000000000000AB518DFFAB508DFFFDFCFDFFFFFF
      FFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFFFFF
      FFFFFFFFFFFFAB518DFFAB508DFF00000000000000000000000000000000CEAD
      93FFFFF2E5FFFFFFFFFFFEFEFDFFEFDBC8FFC7A183FFD1B299FFC9AA92FF0000
      00000000000000000000000000000000000000000000AB518DFFAB508DFFFDFB
      FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFAB508DFFAB508DFF767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF767676FF767676FF767676FF767676FF7676
      76FF767676FF7D7D7DFF0000000000000000AB518DFFAB508DFFFDFBFCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFAB508DFFAB508DFF00000000000000000000000000000000CEB7
      A7FFC9A58AFFD6B69EFFD3B299FFC5A38AFF0000000000000000000000000000
      00000000000000000000000000000000000000000000AB518DFFAB508DFFE5CA
      DCFFFEFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFE7CEDEFFAB508DFFAB508DFF767676FF767676FF767676FF7676
      76FF767676FF767676FF7A7A7AFFB4B4B4FF0000000000000000000000000000
      000000000000000000000000000000000000AB518DFFAB508DFFE5CADCFFFEFD
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFE7CEDEFFAB508DFFAB508DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AB518DFFAB508DFFAB50
      8DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB50
      8DFFAB508DFFAB508DFFAB508DFFAB508DFF828282FF767676FF767676FF7676
      76FF767676FF767676FFB4B4B4FF000000000000000000000000000000000000
      000000000000000000000000000000000000AB518DFFAB508DFFAB508DFFAB50
      8DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB508DFFAB50
      8DFFAB508DFFAB508DFFAB508DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000042A7E5FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1
      E8FF57B1E8FF57B1E8FF57B1E8FF5AB1E6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A96829FFDEC7B0FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000656565FF656565FF656565FF656565FF6565
      65FF656565FF656565FF656565FF656565FF0000000000000000000000000000
      000000000000000000003CA3E2FF57B1E8FF57B1E8FF57B1E8FF000000FF0000
      00FF57B1E8FF57B1E8FF57B1E8FF8EC9EEFFCEA986FFB1753CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB1753CFFD0AD8AFF0000000000000000000000000000
      000000000000E1CCB8FFAB6929FFA96829FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000656565FFFFFFFFFF656565FFFEECCDFFFEEC
      CDFFFEECCDFF656565FFFFFFFFFF656565FFB47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFDDC4ACFF0000000042A7E5FF57B1E8FF57B1E8FF57B1E8FF57B1
      E8FF57B1E8FF57B1E8FF42A7E5FF00000000B1753BFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB1753CFFCEA986FFB1753CFFB3763CFFB376
      3CFFDCC2A9FF00000000A96829FF0000000000000000A96829FF00000000DFC7
      B1FFB1753BFFB1753CFFD0AD8AFF00000000CEA986FFB1753CFFB3763CFFB376
      3CFFB3763CFFB3763CFF00000000656565FF656565FF656565FFFEECCDFFFEEC
      CDFFFEECCDFF656565FF656565FF656565FFB47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFB7814AFF000000006DBAE9FF57B1E8FF57B1E8FF000000FF0000
      00FF57B1E8FF57B1E8FF6FBBE9FF00000000B3763CFFB3763CFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3CD
      B8FFB3763CFFF5EEE7FFF5EEE7FFB3763CFFB1753BFFB3763CFFB3763CFFB376
      3CFFBA8550FF000000000000000000000000AB6929FFAC6C2FFFA96829FF0000
      0000DFC7B1FFB1753BFFB1753CFF00000000B1753BFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFF00000000656565FFFFFFFFFF656565FFFEECCDFFFEEC
      CDFFFEECCDFF656565FFFFFFFFFF656565FFB8824CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFD4B596FF0000000042A7E5FF57B1E8FF000000FF0000
      00FF57B1E8FF42A7E5FF0000000000000000B3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB3763CFFF5EEE7FFF5EEE7FFB3763CFFB3763CFFB3763CFFE3CDB8FFFFFF
      FFFFFFFFFFFFFDFDFDFF00000000A96829FFAD6F32FFAB6929FFAC6C2FFFA968
      29FF00000000F9F6F3FFB1753BFF00000000B3763CFFB3763CFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000656565FF656565FF656565FF696969FF6B6B
      6BFF696969FF656565FF656565FF656565FFBB8854FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB37840FF0000000097CDEFFF57B1E8FF000000FF0000
      00FF57B1E8FF9ACEEFFF0000000000000000B3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFF00000000A96829FFAD6F32FFAB6929FFAC6C
      2FFFA96829FF00000000DFC7B1FF00000000B3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000656565FFFFFFFFFF656565FFFEECCDFFFEEC
      CDFFFEECCDFF656565FFFFFFFFFF656565FFBE8E5CFFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFEFCFBFFFEFCFBFFCCA57DFF0000000057B1E8FF57B1E8FF57B1
      E8FF57B1E8FF000000000000000000000000B3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF00000000A96829FFAD6F32FFAB69
      29FFAC6C2FFFA96829FF0000000000000000B3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000656565FF656565FF656565FFFEECCDFFFEEC
      CDFFFEECCDFF656565FF656565FF656565FFC29465FFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFEFCFBFFFEFCFBFFB1753BFFFDFCFCFFC4E3F7FF57B1E8FF57B1
      E8FFC4E3F7FFEDE0D4FF0000000000000000B3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB3763CFFF5EEE7FFF5EEE7FFB3763CFFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF00000000A96829FFAD6F
      32FFAB6929FFAC6C2FFF0000000000000000B3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000656565FFFFFFFFFF656565FFFEECCDFFFEEC
      CDFFFEECCDFF656565FFFFFFFFFF656565FFC59A6DFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFC39668FF0000000042A7E5FF42A7
      E5FF00000000C39567FF0000000000000000B3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF00000000A968
      29FFAD6F32FF0000000000000000A96829FFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000656565FF656565FF656565FF656565FF6565
      65FF646464FF646464FF656565FF656565FFC9A076FFB3763CFFB3763CFFB378
      40FFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFE5D3C1FF000000000000
      0000E4D0BDFFB3763CFF0000000000000000B3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB3763CFFF5EEE7FFF5EEE7FFB3763CFFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF0000
      00000000000000000000A96829FFA96829FFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCA680FFB3763CFFB3763CFFC9A0
      76FFBE8E5CFFB3763CFFB3763CFFB3763CFFB3763CFFE2CCB7FFDDC4ABFFDBC0
      A6FFB67D47FFB3763CFF0000000000000000B3763CFFB3763CFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3CD
      B8FFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3CDB8FFC294
      65FF00000000A96829FFA96829FFE8D7C7FFB3763CFFB3763CFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3CDB8FFB376
      3CFFB3763CFFB3763CFFB3763CFF00000000CFAB88FFB3763CFFB3763CFFCBA4
      7CFF00000000D4B394FFB1753BFFB3763CFFB3763CFF00000000EEE3D7FFBA87
      51FFB3763CFFB3763CFF0000000000000000B1753BFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB1753CFFB1753BFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFBE8C5AFFDDC5AEFFE0C9B3FF00000000B1753BFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB1753CFF00000000D2B191FFB3763CFFB3763CFFCEA9
      86FF0000000000000000EADBCCFFB9854FFFB2763DFF00000000000000000000
      0000C79D72FFB3763CFF0000000000000000CBA580FFB1753BFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB1753BFFCDA984FFCBA580FFB1753BFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB1753BFFCDA984FF00000000CBA580FFB1753BFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB1753BFFCDA984FF00000000D6B799FFB3763CFFB3763CFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF00000000000000000000000000000000000000000000
      0000666666FF666666FFC0C0C0FFD7D7D7FF666666FF666666FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000666666FF666666FFC0C0C0FFD7D7D7FF666666FF676767FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000666666FF666666FFC0C0C0FFD7D7D7FF666666FF676767FF000000000000
      000000000000000000000000000000000000D9BDA1FFB3763CFFB3763CFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006666
      66FF666666FF9C9C9CFF0000000000000000D8D8D8FF666666FF666666FF0000
      0000000000000000000000000000000000000000000000000000000000006666
      66FF666666FF9C9C9CFF0000000000000000D8D8D8FF666666FF666666FF0000
      0000000000000000000000000000000000000000000000000000000000006666
      66FF666666FF9C9C9CFF0000000000000000D8D8D8FF666666FF666666FF0000
      000000000000000000000000000000000000DCC3ABFFB3763CFFB3763CFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DCDCDCFF00000000000000000000000000000000B3B3B3FF666666FF6666
      66FF000000000000000000000000000000000000000000000000000000000000
      0000DCDCDCFF00000000000000000000000000000000B3B3B3FF666666FF6666
      66FF000000000000000000000000000000000000000000000000000000000000
      0000DCDCDCFF00000000000000000000000000000000B3B3B3FF666666FF6666
      66FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D0AD8DFFBE8D5CFFBE8D
      5CFFD0AD8DFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000669920FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CECECEFF929292FF838383FFABAAA6FFA3AC
      DAFF9D9D9BFF7D7D7DFF888888FFCDCDCDFF0000000000000000000000000000
      0000000000000000000000000000E2CDB9FFB3763CFFB47940FFB2743AFFB274
      3AFFB3763DFFB3763CFFE2CDB9FF000000000000000000000000000000000000
      00000000000000000000000000000000000065991DFF65991DFF65991DFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000767676FF767676FF737373FFB9B9B3FF556B
      E2FFB3B1ABFF737373FF767676FF777777FFB47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFEBDCCFFF00000000B57B46FFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFB2743AFFB2753BFFB57B46FF00000000B47A43FFB3763CFFB3763CFFB376
      3CFFB2763DFFE1CBB6FF0000000065991DFF65991DFF65991DFF65991DFF6599
      1DFF00000000ECDED2FF0000000000000000B47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB2773EFF000000002F48CCFF2F48CCFF2F48CCFF2F48
      CCFF2F48CCFF2F48CCFF2F48CCFF2F48CCFFB47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFC5996CFF00000000767676FF767676FF727272FFC3C2BBFF344E
      D8FFBFBEB6FF727272FF767676FF848484FFB47A43FFB3763CFFB3763CFFB376
      3CFFBD8B59FF00000000D0AD8DFFAE6D30FFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFB4783FFFB2753AFFAE6D30FFD0AD8DFFB47A43FFB3763CFFB3763CFFB376
      3CFFD2B090FF0000000065991DFF65991DFF65991DFF0000000071A030FF6599
      1DFF65991DFF000000000000000000000000B47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB2773EFF000000002F48CCFF2F48CCFF2F48CCFF2F48
      CCFF2F48CCFF2F48CCFF2F48CCFF2F48CCFFB47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFB67D47FF00000000929292FF767676FF707070FFD3D1CBFF3952
      D6FFCECDC6FF717171FF767676FFAEAEAEFFB8824CFFB3763CFFB3763CFFB376
      3CFFBD8B59FF00000000BE8D5CFFAE6D30FFB2753AFFB3763CFFFFFFFFFFFFFF
      FFFFB3763CFFB67D46FFAE6D30FFBE8D5CFFB8824CFFB3763CFFB3763CFFB376
      3CFFCEA985FF0000000065991DFF65991DFF0000000000000000000000006A9C
      26FF65991DFF65991DFF0000000000000000B8824CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFE8D8C9FF0000000000000000000000000000
      000000000000000000000000000000000000B8824CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFDBC1A7FF00000000A4A4A4FF6D6D6DFFE4E4E5FF8C9C
      EDFFE0E1DDFF6D6D6DFFB1B1B1FF00000000BB8854FFB3763CFFB3763CFFB376
      3CFFBD8B59FF00000000BE8D5CFFAE6D30FFB3763CFFB3763CFFD2AF8EFFD2AF
      8EFFB3763CFFB3763CFFAE6D30FFBE8D5CFFBB8854FFB3763CFFB3763CFFB376
      3CFFB1753BFFDEC6AFFF0000000000000000E8D7C8FFB37840FFDFC7B1FF0000
      0000679921FF65991DFF65991DFF00000000BB8854FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFF0000000000000000BB8854FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB1753CFFD4B596FF0000000000000000D6D6D6FFD3D3
      D4FFE2E2E3FF000000000000000000000000BE8E5CFFB3763CFFB3763CFFB376
      3CFFFCF9F9FF00000000D0AD8DFFAE6D30FFB3763CFFB3763CFFD2AF8EFFD2AF
      8EFFB3763CFFB3763CFFAE6D30FFD0AD8DFFBE8E5CFFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFCFAF9FFFCFBFBFFD7BA9FFFFCFAF9FFFEFCFBFFFCFAF9FFE0C9
      B3FF0000000064981DFF65991DFF669920FFBE8E5CFFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFEFCFBFFFEFCFBFFB3763CFFFEFCFBFFFEFCFBFFFEFCFBFFB376
      3CFFB3763CFFB3763CFF0000000000000000BE8E5CFFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFEFCFBFFFEFCFBFFB3773FFF00000000BFBFBFFF717171FF7373
      72FF717170FFDFDFDFFF0000000000000000C29465FFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFDFCFCFF00000000B57B46FFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFB3763CFFBA8651FFB57B46FF00000000C29465FFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFEFCFBFFFEFCFBFFB3763CFFFEFCFBFFFEFCFBFFFEFCFBFFB175
      3CFFE0CBB4FF0000000065991DFF00000000C29465FFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFEFCFBFFFEFCFBFFB3763CFFFEFCFBFFFEFCFBFFFEFCFBFFB376
      3CFFB3763CFFB3763CFF0000000000000000C29465FFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFEFCFBFFFEFCFBFFC39668FF00000000757575FF767676FF7676
      76FF767676FF848484FF0000000000000000C59A6DFFB3763CFFB3763CFFB376
      3CFFB3763CFFBB8954FF00000000E2CDB9FFB57B46FFAE6D30FFAE6D30FFAE6D
      30FFAE6D30FFB57B46FFE2CDB9FF00000000C59A6DFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB2763DFFE1CBB6FF0000000000000000C59A6DFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFF0000000000000000C59A6DFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFC9A178FF00000000767676FF767676FF7676
      76FF767676FF767676FF0000000000000000C9A076FFB3763CFFB3763CFFB378
      40FFB3763CFFB3763CFFCCA783FF0000000000000000D0AD8DFFBE8D5CFFBE8D
      5CFFD0AD8DFF000000000000000000000000C9A076FFB3763CFFB3763CFFB378
      40FFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB1753BFF0000000000000000C9A076FFB3763CFFB3763CFFB378
      40FFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFF0000000000000000C9A076FFB3763CFFB3763CFFB378
      40FFB3763CFFB3763CFFB3763CFFBB8753FF00000000838383FF767676FF7676
      76FF767676FFA2A2A2FF0000000000000000CCA680FFB3763CFFB3763CFFC9A0
      76FFBE8E5CFFB3763CFFB3763CFFBD8B59FFECDFD4FF00000000000000000000
      000000000000EFE4DAFF0000000000000000CCA680FFB3763CFFB3763CFFC9A0
      76FFBE8E5CFFB3763CFFB3763CFFB3763CFFB3763CFFDFC9B2FFB37840FFB376
      3CFFB3763CFFB3763CFF0000000000000000CCA680FFB3763CFFB3763CFFC9A0
      76FFBE8E5CFFB3763CFFB3763CFFB3763CFFB3763CFFDFC9B2FFB37840FFB376
      3CFFB3763CFFB3763CFF0000000000000000CCA680FFB3763CFFB3763CFFC9A0
      76FFBE8E5CFFB3763CFFB3763CFFB3763CFFE4D0BDFF00000000858585FF7676
      76FF989898FF000000000000000000000000CFAB88FFB3763CFFB3763CFFCBA4
      7CFF00000000D4B394FFB1753BFFB3763CFFB3763CFF00000000F0E7DEFFC599
      6DFFBD8B59FFB3763CFF0000000000000000CFAB88FFB3763CFFB3763CFFCBA4
      7CFF00000000D4B394FFB1753BFFB3763CFFB3763CFF00000000EEE3D7FFBA87
      51FFB3763CFFB3763CFF0000000000000000CFAB88FFB3763CFFB3763CFFCBA4
      7CFF00000000D4B394FFB1753BFFB3763CFFB3763CFF00000000EEE3D7FFBA87
      51FFB3763CFFB3763CFF0000000000000000CFAB88FFB3763CFFB3763CFFCBA4
      7CFF00000000D4B394FFB1753BFFB3763CFFB47A43FF00000000000000000000
      000000000000D9BCA2FF0000000000000000D2B191FFB3763CFFB3763CFFCEA9
      86FF0000000000000000EADBCCFFB9854FFFB2763DFF00000000000000000000
      0000C79D72FFB3763CFF0000000000000000D2B191FFB3763CFFB3763CFFCEA9
      86FF0000000000000000EADBCCFFB9854FFFB2763DFF00000000000000000000
      0000C79D72FFB3763CFF0000000000000000D2B191FFB3763CFFB3763CFFCEA9
      86FF0000000000000000EADBCCFFB9854FFFB2763DFF00000000000000000000
      0000C79D72FFB3763CFF0000000000000000D2B191FFB3763CFFB3763CFFCEA9
      86FF0000000000000000EADBCCFFB9854FFFB2763DFF00000000000000000000
      0000CAA37BFFB3763CFF0000000000000000D6B799FFB3763CFFB3763CFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D6B799FFB3763CFFB3763CFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D6B799FFB3763CFFB3763CFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D6B799FFB3763CFFB3763CFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D9BDA1FFB3763CFFB3763CFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3763CFFB3763CFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3763CFFB3763CFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3763CFFB3763CFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3763CFFB3763CFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3763CFFB3763CFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3763CFFB3763CFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3763CFFB3763CFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EADBCCFFC29364FFB78048FFB47A42FFB377
      3EFFB47A43FFB6814AFFC4986BFFF1E8DFFF0000000000000000000000000000
      000000000000000000000000000000000000DDDDDDFF6F6F6FFF515151FF4E4E
      4EFF676767FFCDCDCDFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008B99E1FF000000000000
      000000000000000000008996E0FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000919EE2FF5E70D5FF5E70
      D5FF919EE2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFFAE6D
      2FFFAE6D2FFFAE6D2FFFAE6D2FFFB37840FF0000000000000000000000000000
      0000000000000000000000000000969696FF4C4C4CFFA5A5A5FFE2E2E2FFE6E6
      E6FFB1B1B1FF505050FF7D7D7DFF000000000000000000000000000000000000
      0000000000000000000000000000000000008A98E2FF1531C5FF1531C5FF0000
      0000000000001531C5FF1531C5FF8A98E0FF0000000000000000000000000000
      0000000000000000000000000000B7C1EBFF2B45CAFF2F47CAFF2F47CAFF2F47
      CAFF2F47CAFF2B45CAFFB7C1EBFF00000000B47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFC09262FF00000000AE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFFAE6D
      2FFFAE6D2FFFAE6D2FFFAE6D2FFFB8834EFFB47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFDFC8B1FFE2E2E2FF4B4B4BFFE1E1E1FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF5F5F5FF505050FFCCCCCCFFB47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFD9BDA1FF000000001531C5FF1531C5FF2740
      C8FF2F47CAFF1531C5FF1531C5FF00000000B47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFEBDCCFFF000000002842C8FF2F48CBFF2F48CBFFFFFFFFFFFFFF
      FFFF2F48CBFF2F48CBFF2842C8FF00000000B47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFB37840FF00000000C19263FFAE6D2FFFAE6D2FFFAE6D2FFFAE6D
      2FFFAE6D2FFFAE6D2FFFAE6D2FFFD0AD8BFFB47A43FFB3763CFFB3763CFFB376
      3CFFB1753BFF00000000747474FF9A9A9AFFFFFFFFFFFFFFFFFFFDFDFDFFFCFB
      F8FFFFFFFFFFFFFFFFFFB8B9BAFF666666FFB47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB2763DFFE1CBB6FF000000003149CAFF1531
      C5FF1531C5FF314ACBFF0000000000000000B47A43FFB3763CFFB3763CFFB376
      3CFFBD8B59FF00000000919EE2FF2842CAFF3049CCFF3049CCFF203AC6FF203A
      C6FF3049CCFF3049CCFF2842CAFF919EE2FFB8824CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFDEC6AEFF00000000AE6D2FFFAE6D2FFFAE6D2FFFAE6D
      2FFFAE6D2FFFAE6D2FFFAE6D2FFF00000000B8824CFFB3763CFFB3763CFFB376
      3CFFB8834DFF00000000595959FFD0D0D0FFFFFFFFFFFFFFFFFF9D5009FF9D50
      09FF9D5009FFD1BEABFFD1BEABFF4D4E51FFB8824CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB2763DFFE1CBB6FF000000002E47C9FF1531
      C5FF1531C5FF2740C8FF0000000000000000B8824CFFB3763CFFB3763CFFB376
      3CFFBD8B59FF000000005E70D5FF314ACCFF2E47CBFF2E47CBFFFFFFFFFFFFFF
      FFFF2E47CBFF2E47CBFF314ACCFF5E70D5FFBB8854FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB67D47FFF2E9E0FFF2E9E1FFCEAA87FF000000000000
      0000F1E8DEFFCDA783FF0000000000000000BB8854FFB3763CFFB3763CFFB376
      3CFFB7824BFF000000005D5D5DFFCECECEFFFFFFFFFFFFFFFFFF9D5009FFE7D6
      C5FFF2E9E0FFF2E9E0FFE9EAEBFF4D4D4DFFBB8854FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFD9BDA3FF000000001531C5FF1531C5FF3149
      CAFF2F47CAFF1531C5FF1531C5FF00000000BB8854FFB3763CFFB3763CFFB376
      3CFFBD8B59FF000000005E70D5FF314ACCFF2E47CBFF2E47CBFFFFFFFFFFFFFF
      FFFF2E47CBFF2E47CBFF314ACCFF5E70D5FFBE8E5CFFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFEFCFBFFFEFCFBFFB78049FF0000000000000000B37840FFAE6D
      2FFFB68048FF000000000000000000000000BE8E5CFFB3763CFFB3763CFFB376
      3CFFFEFCFBFF00000000787878FF909090FFFFFFFFFFFFFFFFFF9D5009FFF2E9
      E0FFFFFFFFFFFFFFFFFFADADADFF6A6A6AFFBE8E5CFFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFEFCFBFFFEFCFBFFE3CFBCFF8593E1FF1531C5FF1531C5FF0000
      0000000000001531C5FF1531C5FF8E9BE1FFBE8E5CFFB3763CFFB3763CFFB376
      3CFFFCF9F9FF00000000919EE2FF2842CAFF2D46CBFF2D46CBFFFFFFFFFFFFFF
      FFFF2D46CBFF2D46CBFF2842CAFF919EE2FFC29465FFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFEFCFBFFFEFCFBFFBC8A57FF00000000B07339FFAE6D2FFFAE6D
      2FFFAE6D2FFFB8824CFF0000000000000000C29465FFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFDFCFBFF000000004B4B4BFFD2D2D2FFFFFFFFFFD1BEABFFF2E9
      E0FFFFFFFFFFE9E9E9FF4D4D4DFFD8D8D8FFC29465FFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFEFCFBFFFEFCFBFFB7824BFFFDFCFCFF8695E1FF00000000E1CB
      B6FFE1CBB6FF000000008A98E1FF00000000C29465FFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFDFCFCFF000000002842C8FF2B45CAFF2B45CAFFFFFFFFFFFFFF
      FFFF2B45CAFF2B45CAFF2842C8FF00000000C59A6DFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFC89F75FF00000000AE6D2FFFAE6D2FFFAE6D
      2FFFAE6D2FFFAE6D2FFF0000000000000000C59A6DFFB3763CFFB3763CFFB376
      3CFFB3763CFFB7814AFF00000000A3A3A3FF4B4B4BFF909091FFD4D4D4FFD4D4
      D4FF9D9D9DFF4D4D4DFF909090FF00000000C59A6DFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB7824BFFE3CEBAFFD9BDA1FFB276
      3DFFB2763DFFD9BDA3FF0000000000000000C59A6DFFB3763CFFB3763CFFB376
      3CFFB3763CFFBB8954FF00000000B7C1EBFF2842C8FF253FC9FF253FC9FF253F
      C9FF253FC9FF2842CAFFB7C1EBFF00000000C9A076FFB3763CFFB3763CFFB378
      40FFB3763CFFB3763CFFB3763CFFBD8B59FF00000000AE7136FFAE6D2FFFAE6D
      2FFFAE6D2FFFB6814AFF0000000000000000C9A076FFB3763CFFB3763CFFB378
      40FFB3763CFFB3763CFFC09060FF0000000000000000777777FF585858FF5454
      54FF707070FFDDDDDDFF0000000000000000C9A076FFB3763CFFB3763CFFB378
      40FFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFF0000000000000000C9A076FFB3763CFFB3763CFFB378
      40FFB3763CFFB3763CFFCCA783FF0000000000000000919EE2FF5E70D5FF5E70
      D5FF919EE2FF000000000000000000000000CCA680FFB3763CFFB3763CFFC9A0
      76FFBE8E5CFFB3763CFFB3763CFFB3763CFFE8D8C7FF00000000B07239FFAE6D
      2FFFB37840FF000000000000000000000000CCA680FFB3763CFFB3763CFFC9A0
      76FFBE8E5CFFB3763CFFB3763CFFB7824BFFDCC2A9FF00000000000000000000
      000000000000E1CBB6FF0000000000000000CCA680FFB3763CFFB3763CFFC9A0
      76FFBE8E5CFFB3763CFFB3763CFFB3763CFFB3763CFFDFC9B2FFB37840FFB376
      3CFFB3763CFFB3763CFF0000000000000000CCA680FFB3763CFFB3763CFFC9A0
      76FFBE8E5CFFB3763CFFB3763CFFBD8B59FFECDFD4FF00000000000000000000
      000000000000EFE4DAFF0000000000000000CFAB88FFB3763CFFB3763CFFCBA4
      7CFF00000000D4B394FFB1753BFFB3763CFFB68148FF00000000000000000000
      000000000000E4D1BEFF0000000000000000CFAB88FFB3763CFFB3763CFFCBA4
      7CFF00000000D4B394FFB1753BFFB3763CFFB3763CFF00000000F0E6DDFFC295
      66FFB1753CFFB3763CFF0000000000000000CFAB88FFB3763CFFB3763CFFCBA4
      7CFF00000000D4B394FFB1753BFFB3763CFFB3763CFF00000000EEE3D7FFBA87
      51FFB3763CFFB3763CFF0000000000000000CFAB88FFB3763CFFB3763CFFCBA4
      7CFF00000000D4B394FFB1753BFFB3763CFFB3763CFF00000000F0E7DEFFC599
      6DFFBD8B59FFB3763CFF0000000000000000D2B191FFB3763CFFB3763CFFCEA9
      86FF0000000000000000EADBCCFFB9854FFFB2763DFF00000000000000000000
      0000CEAA87FFB3763CFF0000000000000000D2B191FFB3763CFFB3763CFFCEA9
      86FF0000000000000000EADBCCFFB9854FFFB2763DFF00000000000000000000
      0000C79D72FFB3763CFF0000000000000000D2B191FFB3763CFFB3763CFFCEA9
      86FF0000000000000000EADBCCFFB9854FFFB2763DFF00000000000000000000
      0000C79D72FFB3763CFF0000000000000000D2B191FFB3763CFFB3763CFFCEA9
      86FF0000000000000000EADBCCFFB9854FFFB2763DFF00000000000000000000
      0000C79D72FFB3763CFF0000000000000000D6B799FFB3763CFFB3763CFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D6B799FFB3763CFFB3763CFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D6B799FFB3763CFFB3763CFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D6B799FFB3763CFFB3763CFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D9BDA1FFB3763CFFB3763CFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3763CFFB3763CFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3763CFFB3763CFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3763CFFB3763CFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3763CFFB3763CFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3763CFFB3763CFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3763CFFB3763CFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3763CFFB3763CFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EDF1E5FFACC785FF84AB49FF72A22FFF72A22FFF82AA45FFAAC583FFE9EF
      E0FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084AB
      49FF85AD49FF0000000000000000000000000000000000000000000000000000
      00000000000000000000CEE6F6FF8CC7EEFF67B7E9FF56AFE6FF53AEE6FF5EB3
      E7FF78C0EBFFACD7F2FF0000000000000000000000000000000000000000A3C1
      77FF72A231FF6C9D28FF6B9D25FF83AC47FF85AC48FF6B9D26FF6C9D26FF72A2
      2FFF9EBE71FF000000000000000000000000B1753CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084AB
      49FF85AD49FF0000000000000000000000000000000000000000000000000000
      000000000000B7DFF7FF9BD0F1FFC5E3F7FFC1E1F6FFC0E0F6FFBEDEF4FFBBDF
      F4FFB8DCF4FFB3DAF4FF66B6E8FF0000000000000000000000008AB051FF6FA0
      2CFF78A538FFD1E1BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3E2C0FF7BA6
      3DFF6EA02BFF85AD4BFF0000000000000000B47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFE8D8C9FF00000000000000000000000084AB
      49FF85AD49FF000000000000000000000000B47A43FFB3763CFFB3763CFFB376
      3CFFECDFD4FFD7EEFCFF79C1EDFF51AEE7FF54AFE8FF59B0E7FF70BCEAFF77BF
      EBFF6EBAE9FF55AFE7FF9DD1F0FF0000000000000000A8C480FF6FA02CFF8BB0
      53FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF91B55AFF6EA02CFF9FBE70FF00000000B8824CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB47A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB2773EFF0000000085AD49FF85AD49FF85AD49FF85AD
      49FF85AD49FF85AD49FF85AD49FF85AD49FFB47A43FFB3763CFFB3763CFFB376
      3CFFDBC1A7FF000000007CC1EAFFC7E4F6FF00000000D6EAF7FFC0E0F5FFBADE
      F4FFC8E4F6FFE5F1FAFF00000000000000000000000072A231FF75A335FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7FFB8B8
      B9FFFFFFFFFF7AA63CFF72A231FFEAF0E1FFBB8854FFB3763CFFB3763CFFB376
      3CFFB3763CFFFEFCFBFFFEFCFBFFFEFCFBFFB3763CFFB3763CFFFEFCFBFFFEFC
      FBFFFEFCFBFFB3763CFFB3763CFFB3763CFFB8824CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB2773EFF0000000085AD49FF85AD49FF85AD49FF85AD
      49FF85AD49FF85AD49FF85AD49FF85AD49FFB8824CFFB3763CFFB3763CFFB376
      3CFFB37840FFEDE1D6FF0000000069B8E8FF6EBBEAFF97CCEFFFABD6F2FFADD9
      F3FFA4D4F1FF89C6EEFF59B1E7FFB3DAF3FFB1CA8DFF6C9D28FFCBDCB4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCFF434343FFFCFC
      FCFFFFFFFFFFD2E1BEFF6C9D28FFABC684FFBE8E5CFFB3763CFFB3763CFFB376
      3CFFB3763CFFFEFCFBFFFEFCFBFFFEFCFBFFB3763CFFB3763CFFFEFCFBFFFEFC
      FBFFFEFCFBFFB3763CFFB3763CFFB3763CFFBB8854FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFE8D8C9FF00000000000000000000000084AB
      49FF85AD49FF000000000000000000000000BB8854FFB3763CFFB3763CFFB376
      3CFFB3763CFFEBDCCFFFC3E5FAFFC8E5F7FFA9D6F2FF80C3EDFF69B9EAFF63B5
      E9FF6CB9EAFF86C6EEFFB0D9F4FFA0D2F0FF8BB054FF689A22FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B6FF343434FFDEDEDEFFFFFF
      FFFFFFFFFFFFFFFFFFFF6A9B24FF85AC4BFFC29465FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFBE8E5CFFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFEFCFBFFFEFCFBFFB3763CFFFEFCFBFFFEFCFBFF0000000084AB
      49FF85AD49FF000000000000000000000000BE8E5CFFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFDFCFCFFDDF0FCFF4EADE7FF55B0E8FF59B1E8FF5AB2E8FF5BB2
      E8FF5AB2E8FF59B1E8FF54B0E8FF6EBAE9FF6E9E2CFF72A12FFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3FF363636FFBCBCBCFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF80AA45FF71A02EFFC59A6DFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFC29465FFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFEFCFBFFFEFCFBFFB3763CFFFEFCFBFFFEFCFBFF0000000084AB
      49FF85AD49FF000000000000000000000000C29465FFB3763CFFB3763CFFB376
      3CFFFEFCFBFFFCFBFAFF00000000DFEFFAFF9CD0F1FF76BEEAFF63B5E8FF60B4
      E7FF6AB8E9FF87C6EEFFB8DDF5FF00000000FDFDFDFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF757575FF828282FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF80A941FF72A132FFC9A076FFB3763CFFB3763CFFC69B
      6FFFB37840FFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFCEAA87FFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFC59A6DFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFE7D6C5FF0000
      000000000000E8D8C9FF0000000000000000C59A6DFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFBB8954FFDCC3ABFFF1E7DEFF00000000000000000000
      000000000000000000000000000000000000F1F5EAFFF9FBF9FFF9FBF8FFF8FB
      F7FFFFFFFFFFFFFFFFFFFFFFFFFF888888FF919191FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF699C23FF89AE4FFFCCA680FFB3763CFFB3763CFFC9A0
      76FFF0E5DBFFBE8E5CFFB3763CFFB3763CFFB3763CFFB3763CFF00000000DFC9
      B2FFB37840FFB3763CFFB3763CFFB3763CFFC9A076FFB3763CFFB3763CFFB378
      40FFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFF0000000000000000C9A076FFB3763CFFB3763CFFB378
      40FFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB47941FFBA8751FFBC89
      56FFB7814AFFB1753BFF00000000000000006A9B25FF699B23FF699B23FF6398
      1BFF589009FFFBFCF9FFFFFFFFFF999999FF9B9B9BFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFCBDCB4FF6C9D28FFB0C98BFFCFAB88FFB3763CFFB3763CFFCBA4
      7CFF0000000000000000D4B394FFB1753BFFB3763CFFB3763CFF000000000000
      0000EEE3D7FFBA8751FFB3763CFFB3763CFFCCA680FFB3763CFFB3763CFFC9A0
      76FFBE8E5CFFB3763CFFB3763CFFB3763CFFB3763CFFDFC9B2FFB37840FFB376
      3CFFB3763CFFB3763CFF0000000000000000CCA680FFB3763CFFB3763CFFC9A0
      76FFBE8E5CFFB3763CFFB3763CFFB3763CFFB3763CFFDFC9B2FFB37840FFB376
      3CFFB3763CFFB3763CFF000000000000000077A438FF74A333FF6E9E2AFFC7D9
      ACFFCADBB1FFDCE7CBFFFFFFFFFFAFAFAFFFAEAEAEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF74A332FF73A231FF00000000D2B191FFB3763CFFB3763CFFCEA9
      86FF000000000000000000000000EADBCCFFB9854FFFB2763DFF000000000000
      00000000000000000000C79D72FFB3763CFFCFAB88FFB3763CFFB3763CFFCBA4
      7CFF00000000D4B394FFB1753BFFB3763CFFB3763CFF00000000EEE3D7FFBA87
      51FFB3763CFFB3763CFF0000000000000000CFAB88FFB3763CFFB3763CFFCBA4
      7CFF00000000D4B394FFB1753BFFB3763CFFB3763CFF00000000EEE3D7FFBA87
      51FFB3763CFFB3763CFF000000000000000077A438FF76A337FF72A12FFF87AE
      4DFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D4FFCCCCCCFFFFFFFFFFFFFFFFFFFFFF
      FFFF86AE4AFF6FA02DFFAAC583FF00000000D6B799FFB3763CFFB3763CFFD0AD
      8BFF0000000000000000000000000000000000000000CEAA87FF000000000000
      0000000000000000000000000000D8BB9EFFD2B191FFB3763CFFB3763CFFCEA9
      86FF0000000000000000EADBCCFFB9854FFFB2763DFF00000000000000000000
      0000C79D72FFB3763CFF0000000000000000D2B191FFB3763CFFB3763CFFCEA9
      86FF0000000000000000EADBCCFFB9854FFFB2763DFF00000000000000000000
      0000C79D72FFB3763CFF000000000000000074A333FFB7CE96FF9DBC6EFF71A1
      2EFF6FA12DFFC2D5A4FFFCFDFBFFFFFFFFFFFFFFFFFFFDFEFEFFC5D8AAFF72A2
      2FFF71A12DFF91B45CFF0000000000000000D9BDA1FFB3763CFFB3763CFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6B799FFB3763CFFB3763CFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D6B799FFB3763CFFB3763CFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF000000000000000074A333FFAAC583FF00000000B4CC
      92FF73A231FF6D9E29FF699B22FF72A231FF74A233FF699B22FF6D9E29FF73A2
      31FFAFC98BFF000000000000000000000000DCC3ABFFB3763CFFB3763CFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3763CFFB3763CFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3763CFFB3763CFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BAD09AFF93B65EFF7DA843FF7CA740FF92B55EFFB7CE96FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3763CFFB3763CFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3763CFFB3763CFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000666666FF666666FF666666FF6666
      66FF666666FF666666FF666666FF666666FF666666FF666666FF666666FF6666
      66FF666666FF666666FF666666FF00000000000000000000000000000000C394
      B4FFCCAAC0FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009BBB6BFF679A22FF6599
      1DFF6A9B25FFA5C279FFDAE5C7FF65991DFF0000000000000000000000000000
      000000000000000000000000000000000000DDDDDDFF6F6F6FFF515151FF4E4E
      4EFF676767FFCDCDCDFF0000000000000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF676767FF000000000000000000000000AE5A92FFAA50
      8DFFBF82ACFFA94D8BFFCAA4BEFF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C091
      62FFB3763CFFB3763CFFC19262FF000000007BA73FFF64981DFFCCDCB5FFE5ED
      D9FFC7D8ACFF75A337FF74A234FF65991DFF0000000000000000000000000000
      0000000000000000000000000000969696FF4C4C4CFFA5A5A5FFE2E2E2FFE6E6
      E6FFB1B1B1FF505050FF7D7D7DFF00000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF676767FF00000000C8A1BBFFAB508DFFAA4F8CFFAC53
      8FFFC78DB4FFA94B8AFFAB508DFFB05E95FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C091
      62FFB3763CFFB3763CFFEEE2D6FFB3CB91FF64971CFF00000000000000000000
      0000C9DAB1FF8DB256FF65991DFF65991DFF0000000000000000000000000000
      00000000000000000000E2E2E2FF4B4B4BFFE1E1E1FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF5F5F5FF505050FFCCCCCCFF676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF676767FF00000000AB508DFFAB508DFFAA4F8CFFAC52
      8FFFC68AB1FFA94B8AFFAB508DFFAB508DFFAB508DFFBF87ACFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000065991DFF65991DFF65991DFF65991DFF0000000000000000C5E1F2FF8FCB
      F2FF68B7EAFF00000000747474FF9A9A9AFFFFFFFFFFFFFFFFFFFDFDFDFFFCFB
      F8FFFFFFFFFFFFFFFFFFB8B9BAFF666666FF676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF676767FF00000000AB508DFFAB508DFFA94D8BFFA94E
      8BFFC68BB2FFA74787FFAB508DFFAB508DFFAA4F8CFFAD5790FFB874A1FFD1B6
      C8FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000065991DFF65991DFF65991DFF65991DFF0000
      000000000000000000000000000000000000DDECF5FF56B0E8FF53AFE7FF4FAD
      E7FF5DB3E6FF00000000595959FFD0D0D0FFFFFFFFFFFFFFFFFF9D5009FF9D50
      09FF9D5009FFD1BEABFFD1BEABFF4D4E51FF676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF676767FF00000000AA4F8CFFA74887FFB96C9FFFD5AB
      C7FFC992B7FFC88EB4FFA64686FFA94D8BFFAA4E8CFFB25F97FFBD75A5FFA94D
      8BFFB56C9DFF000000000000000000000000C5996CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFF0000000065991DFF65991DFF8DB256FFC9DAB1FF0000
      0000000000000000000064971CFFB3CB91FF54B1EAFF4FADE6FF90CBEFFFC4E3
      F6FFD5E9F6FF000000005D5D5DFFCECECEFFFFFFFFFFFFFFFFFF9D5009FFE7D6
      C5FFF2E9E0FFF2E9E0FFE9EAEBFF4D4D4DFF676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF676767FF00000000A84B89FFD3A5C4FFC384AEFFA646
      86FFA84988FFAF5A94FFD3A6C3FFBC73A3FFA64686FFB26097FFBA71A3FFA94D
      8BFFAB508DFFAB508DFFC18EB0FF00000000B47940FFBD9060FFB98855FFB988
      55FFB98855FFB98855FFEFE5DBFF65991DFF74A234FF75A337FFC7D8ACFFE5ED
      D9FFCCDCB5FF64981DFF7BA73FFF0000000087C7F0FFCAE5F6FF8AC8EEFF57B0
      E8FF4DADE6FF00000000787878FF909090FFFFFFFFFFFFFFFFFF9D5009FFF2E9
      E0FFFFFFFFFFFFFFFFFFADADADFF6A6A6AFF676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF676767FF00000000D3A5C3FFA84C8AFFA94B8AFFAB50
      8DFFAB508DFFAA4E8CFFA74787FFBC74A6FFD4A6C5FFB86C9FFFB86CA0FFA94D
      8BFFAB508DFFAB508DFFAB508DFFAC558FFFB47940FFB98855FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFF65991DFFDAE5C7FFA5C279FF6A9B25FF6599
      1DFF679A22FF9BBB6BFF000000000000000087C7F0FF4CABE6FF53AFE7FF56B0
      E7FF57B1E8FFB3DAF3FF000000004B4B4BFFD2D2D2FFFFFFFFFFD1BEABFFF2E9
      E0FFFFFFFFFFE9E9E9FF4D4D4DFFD8D8D8FF676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF676767FF0000000000000000BE87ACFFAA4F8CFFAA4F
      8CFFAB508DFFAB508DFFAB508DFFA94C8AFFA23F81FFDEBDD2FFD5A9C7FFA849
      89FFA84B8AFFAB508DFFAB508DFFAB508DFFB47940FFB98855FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF0000000000000000C7D8ACFF9DBD
      6FFFC9DAB1FF000000000000000000000000CAE2F3FF56B1E8FF57B1E8FF57B1
      E8FF57B1E8FF67B7E8FF00000000A3A3A3FF4B4B4BFF909091FFD4D4D4FFD4D4
      D4FF9D9D9DFF4D4D4DFF909090FF00000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF676767FF00000000000000000000000000000000B468
      9AFFAA4F8CFFAB4F8CFFA84B8AFFAB518DFFD09EBEFFB7699DFFA84C8AFFD3A5
      C3FFC68AB2FFA64686FFA94D8BFFAB508DFFB47940FFB98855FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFDFF000000000000
      00000000000000000000C29668FF000000000000000000000000ABD7F3FF94CC
      EEFF00000000C4E4F8FFA5D5F4FF0000000000000000777777FF585858FF5454
      54FF707070FFDDDDDDFF0000000000000000676767FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF676767FF000000000000000000000000000000000000
      0000D0B3C6FFA74A89FFC387AFFFCB95B8FFA64788FFA94D8BFFAA4F8CFFA748
      88FFB36399FFD6ACC7FFB96EA0FFA74787FFB47940FFB98855FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB98855FFB57B43FF00000000000000000000000000000000DCEE
      FAFF56B0E8FF53AFE7FF4FADE7FF5AB2E6FFB0D9F2FF00000000000000000000
      000000000000BFE0F5FFDDEEF9FF00000000676767FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF676767FF000000000000000000000000000000000000
      00000000000000000000C99DBAFFA74988FFAB4F8CFFAB508DFFAB508DFFAB50
      8DFFAA4E8BFFA64686FFC180ABFFD2A3C2FFB47940FFB98855FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB98855FFB57B43FF0000000000000000000000000000000054B1
      EAFF4FADE6FF90CBEFFFC4E3F6FFD4EAF8FFD7EBF8FFD8EBFAFFDEEFF9FFC9E4
      F4FF8EC8EDFF4FABE6FF53AFE7FF00000000B2763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFF000000000000000000000000000000000000
      000000000000000000000000000000000000B56C9DFFAB4F8DFFAB4F8DFFAB50
      8DFFAB508DFFAB508DFFA84B8AFFD4BFCDFFB47940FFB98855FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB98855FFB57B43FF0000000000000000000000000000000087C7
      F0FFCAE5F6FF8AC8EEFF57B0E8FF4DADE6FF4DADE6FF4DADE6FF4BABE6FF64B6
      E9FF9CCFF0FFDEEFFAFF82C3EDFF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D2BACAFFAC568FFFAA4F
      8CFFAB508DFFBF89ADFF0000000000000000B47940FFB98855FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB98855FFB57B43FF0000000000000000000000000000000087C7
      F0FF4CABE6FF53AFE7FF56B0E7FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF55B0
      E7FF52AEE7FF49AAE6FF9DD1F1FF00000000B57B44FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB47A43FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C79A
      B8FF00000000000000000000000000000000B47940FFBD9060FFB98855FFB988
      55FFB98855FFB98855FFB98855FFB98855FFB98855FFB98855FFB98855FFB988
      55FFB98855FFBD9060FFB57B43FF00000000000000000000000000000000C9E4
      F6FF56B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1
      E8FF57B1E8FF56B0E8FFC3E1F4FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C09262FFB47940FFB47940FFB479
      40FFB47940FFB47940FFB47940FFB47940FFB47940FFB47940FFB47940FFB479
      40FFB47940FFB47940FFC09162FF000000000000000000000000000000000000
      000000000000AAD7F3FF75BEE9FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF73BD
      EAFFA8D6F2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000828282FF535353FF535353FF6C6C6CFF6C6C6CFF818181FF0000
      00000000000000000000000000000000000000000000AD6B2EFFCEAE8FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000666666FF666666FF666666FF6666
      66FF666666FF666666FF666666FF666666FF666666FF666666FF666666FF6666
      66FF666666FF666666FF666666FF666666FF0000000000000000B47A43FFB376
      3CFFB3763CFFB3763CFF000000000000000000000000B3763CFFB3763CFFB376
      3CFFB67D46FF0000000000000000000000000000000000000000000000000000
      00000000000000000000E8E8E8FF535353FF6C6C6CFFE6E6E6FF000000000000
      000000000000000000000000000000000000AD6C30FFAA6423FFAA6423FFD3AC
      87FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF0000000000000000B3763CFFB376
      3CFFB3763CFFB3763CFF000000000000000000000000B3763CFFB3763CFFB376
      3CFFB3763CFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000535353FF6C6C6CFF00000000000000000000
      000000000000000000000000000000000000D0B295FFAA6423FFAA6423FFAA64
      23FFD3AA82FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF0000000000000000B3763CFFB376
      3CFFB3763CFFB3763CFF000000000000000000000000B3763CFFB3763CFFB376
      3CFFB3763CFF0000000000000000000000000000000000000000000000000000
      000000000000ADADADFF535353FF535353FF535353FF535353FFADADADFF0000
      00000000000000000000000000000000000000000000D5B393FFAA6423FFAA64
      23FFAA6423FFD2A87DFF0000000000000000CFAE90FFC99F75FFCBA580FFD5C1
      AEFF00000000000000000000000000000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF0000000000000000B3763CFFB376
      3CFFB3763CFFB3763CFF000000000000000000000000B3763CFFB3763CFFB376
      3CFFB3763CFF0000000000000000000000000000000000000000000000000000
      0000535353FF535353FFDEDBD9FF0000000000000000DEDBD8FF535353FF5353
      53FF000000000000000000000000000000000000000000000000D5B596FFAA64
      23FFAA6423FFAA6423FFBF8348FFAA6423FFAA6423FFAA6423FFAA6423FFAA64
      23FFAA6525FF000000000000000000000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF0000000000000000B3763CFFB376
      3CFFB3763CFFB3763CFF000000000000000000000000B3763CFFB3763CFFB376
      3CFFB3763CFF000000000000000000000000000000000000000000000000C2C2
      C2FF535353FF0000000000000000CAA27AFFCAA27AFF00000000000000005353
      53FFC4C4C4FF000000000000000000000000000000000000000000000000D6B7
      9AFFAA6423FFAA6423FFAA6423FFAA6423FFC48A51FFD3AA82FFCFA070FFAA64
      23FFAA6423FFAA6423FFD8BDA4FF00000000B2763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF0000000000000000B3763CFFB376
      3CFFB3763CFFB3763CFF000000000000000000000000B3763CFFB3763CFFB376
      3CFFB3763CFF0000000000000000000000000000000000000000000000005353
      53FFD8D5D3FF00000000AE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFF00000000DAD6
      D1FF535353FF0000000000000000000000000000000000000000000000000000
      0000C38D58FFAA6423FFAA6423FFF6EBE1FFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFC49567FFAA6423FFAA6423FF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF0000000000000000B3763CFFB376
      3CFFB3763CFFB3763CFF000000000000000000000000B3763CFFB3763CFFB376
      3CFFB3763CFF0000000000000000000000000000000000000000000000005353
      53FF00000000CAA27AFFAE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFFCAA27AFF0000
      0000535353FF0000000000000000000000000000000000000000000000000000
      0000AA6423FFAA6423FFF5E9DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB77C45FFAA6423FFC19A72FFAF753EFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB0753EFF0000000000000000B3763CFFB376
      3CFFB3763CFFB3763CFF000000000000000000000000B3763CFFB3763CFFB376
      3CFFB3763CFF0000000000000000000000000000000000000000000000005353
      53FF00000000AC6B2DFFAE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFF0000
      0000535353FF000000000000000000000000000000000000000000000000D1B5
      9AFFAA6423FFC2864AFFFDFDFDFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFFDFDFDFFEBD6C2FFAA6423FFB07239FF676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF0000000000000000B3763CFFB376
      3CFFB3763CFFB3763CFF000000000000000000000000B3763CFFB3763CFFB376
      3CFFB3763CFF0000000000000000000000000000000000000000000000005353
      53FF00000000AE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFF0000
      0000535353FF000000000000000000000000000000000000000000000000CBA5
      81FFAA6423FFD1A478FFFDFDFDFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFFDFDFDFFF9F2ECFFAA6423FFAA6423FF676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF0000000000000000B3763CFFB376
      3CFFB3763CFFB3763CFF000000000000000000000000B3763CFFB3763CFFB376
      3CFFB3763CFF0000000000000000000000000000000000000000000000000000
      000000000000AE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFF0000
      000000000000000000000000000000000000000000000000000000000000CEAD
      8DFFAA6423FFCB9864FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF2E5D9FFAA6423FFAC692BFF676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF0000000000000000B3763CFFB376
      3CFFB3763CFFB3763CFF000000000000000000000000B3763CFFB3763CFFB376
      3CFFB3763CFF0000000000000000000000000000000000000000000000000000
      000000000000AE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AA6423FFAA6423FFFDFDFDFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFFDFDFDFFD5A97DFFAA6423FFB98857FF676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF0000000000000000B3763CFFB376
      3CFFB3763CFFB3763CFF000000000000000000000000B3763CFFB3763CFFB376
      3CFFB3763CFF0000000000000000000000000000000000000000000000000000
      000000000000AE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AE6F33FFAA6423FFBD8955FFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFF0DECCFFAA6423FFAA6423FFD5C1AEFFB2763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF0000000000000000B3763CFFB376
      3CFFB3763CFFB3763CFF000000000000000000000000B3763CFFB3763CFFB376
      3CFFB3763CFF0000000000000000000000000000000000000000000000000000
      000000000000B07238FFAE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFFAE7035FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AA6423FFAA6423FFB27238FFE6CDB5FFF4E9DFFFF0E0D1FFD3A5
      78FFAA6423FFAA6423FFC18952FF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF0000000000000000B67D48FFB376
      3CFFB3763CFFB3763CFF000000000000000000000000B3763CFFB3763CFFB376
      3CFFB67D48FF0000000000000000000000000000000000000000000000000000
      000000000000CBA57CFFAE6C2EFFAE6C2EFFAE6C2EFFAE6C2EFFCAA37AFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AA6423FFAA6423FFAA6423FFAA6423FFAA6423FFAA64
      23FFAA6423FFC28A54FF0000000000000000B57B44FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB47A43FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CAA37AFFAF7034FFAF6F34FFCAA27AFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6A585FFB47B47FFAD6B2EFFAF7035FFBB8D
      5EFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005B5B
      5BFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000095C6
      E4FF76BCE6FF67B6E7FF87C1E5FF000000005B5B5BFF919191FF767676FF5B5B
      5BFF797979FF7C7C7CFF5B5B5BFF00000000D2D2D2FF818181FF797979FF7979
      79FF797979FF797979FF797979FF797979FF797979FF797979FF797979FF7979
      79FF797979FF797979FF818181FFD2D2D2FF0000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000007ABDE6FF57B1E8FF57B1
      E8FF57B1E8FF57B1E8FF88C1E5FF00000000828282FF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF949494FF00000000818181FFE3E3E3FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFE3E3E3FF818181FF0000000000000000000000000000
      0000000000FF000000FF00000000000000000000000000000000840000FF8400
      00FF840000FF0000000000000000000000000000000000000000000000000000
      0000000000FF000000FF00000000000000000000000000000000840000FF8400
      00FF840000FF00000000000000000000000085C0E5FF57B1E8FF57B1E8FF57B1
      E8FF57B1E8FF67B6E7FF00000000000000007D7D7DFF5B5B5BFF838383FF0000
      0000858585FF5B5B5BFF777777FF00000000767676FFFEFEFEFFFBFBFBFFFDFD
      FDFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
      FBFFFBFBFBFFFBFBFBFFFDFDFDFF767676FF000000FF00000000000000000000
      0000000000FF000000FF00000000000000000000000000000000840000FF8400
      00FF840000FF000000000000000000000000000000FF00000000000000000000
      0000000000FF000000FF00000000000000000000000000000000840000FF8400
      00FF840000FF00000000000000000000000057B1E8FF57B1E8FF57B1E8FF57B1
      E8FF57B1E8FF76BCE6FF000000005D5D5DFF5B5B5BFF5B5B5BFF000000000000
      0000000000005B5B5BFF5B5B5BFF5B5B5BFF767676FFFEFEFEFF4A4A4AFFFDFD
      FDFFAAAAAAFFC6C6C6FF666666FFE5E5E5FFA5A5A5FF8C8C8CFFDCDCDCFF7171
      71FFFBFBFBFF4B4B4BFFFDFDFDFF767676FF000000FF000000FF000000000000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000057B1E8FF57B1E8FF57B1E8FF57B1
      E8FF57B1E8FF67B6E7FF00000000000000007D7D7DFF5B5B5BFF777777FF0000
      0000797979FF5B5B5BFF828282FF00000000767676FFFEFEFEFF4A4A4AFFFDFD
      FDFF9C9C9CFFFEFEFEFF797979FFECECECFF9E9E9EFF7B7B7BFFDBDBDBFF4B4B
      4BFFFBFBFBFF4B4B4BFFFDFDFDFF767676FF000000FF000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000840000FF8400
      00FF840000FF000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000840000FF8400
      00FF840000FF00000000000000000000000057B1E8FF57B1E8FF57B1E8FF57B1
      E8FF57B1E8FF57B1E8FF83BFE5FF000000009A9A9AFF5B5B5BFF5B5B5BFF5B5B
      5BFF5B5B5BFF5B5B5BFF757575FF00000000767676FFFEFEFEFF4A4A4AFFFDFD
      FDFFFEFEFEFFE9E9E9FFFEFEFEFFE9E9E9FFFDFDFDFFE8E8E8FFEBEBEBFFFDFD
      FDFFFBFBFBFF4B4B4BFFFDFDFDFF767676FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000840000FF8400
      00FF840000FF000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000840000FF8400
      00FF840000FF00000000000000000000000057B1E8FF57B1E8FF57B1E8FF57B1
      E8FF57B1E8FF57B1E8FF73BBE6FF000000005B5B5BFF7A7A7AFF898989FF5B5B
      5BFF7C7C7CFF9D9D9DFF5B5B5BFF00000000767676FFFEFEFEFF4B4B4BFFFDFD
      FDFF515151FFF8F8F8FF4F4F4FFF4F4F4FFFF8F8F8FF4F4F4FFFF5F5F5FF4949
      49FFFBFBFBFF4B4B4BFFFDFDFDFF767676FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000000000008400
      00FF840000FF840000FF0000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000000000008400
      00FF840000FF840000FF000000000000000057B1E8FF57B1E8FF57B1E8FF57B1
      E8FF57B1E8FF57B1E8FF57B1E8FFA9CDE3FF0000000000000000000000005B5B
      5BFF00000000000000000000000000000000767676FFFEFEFEFF4B4B4BFFFDFD
      FDFF515151FFF8F8F8FF4F4F4FFF4F4F4FFFF8F8F8FF4F4F4FFFF5F5F5FF4949
      49FFFBFBFBFF494949FFFDFDFDFF767676FF000000FF000000FF000000FF0000
      00FF000000FF000000FF00000000000000000000000000000000000000000000
      0000840000FF840000FF840000FF00000000000000FF000000FF000000FF0000
      00FF000000FF000000FF00000000000000000000000000000000000000000000
      0000840000FF840000FF840000FF0000000057B1E8FF57B1E8FF57B1E8FF57B1
      E8FF57B1E8FF57B1E8FF57B1E8FF57B1E7FF80BEE5FF87C1E5FF000000000000
      000000000000000000000000000000000000767676FFFEFEFEFF4B4B4BFFFDFD
      FDFF515151FFF8F8F8FF4F4F4FFF4F4F4FFFF8F8F8FF4F4F4FFFF5F5F5FF4949
      49FFFBFBFBFF494949FFFDFDFDFF767676FF000000FF000000FF000000FF0000
      00FF000000FF0000000000000000840000FF840000FF840000FF000000000000
      000000000000840000FF840000FF840000FF000000FF000000FF000000FF0000
      00FF000000FF0000000000000000840000FF840000FF840000FF000000000000
      000000000000840000FF840000FF840000FF57B1E8FF57B1E8FF57B1E8FF57B1
      E8FF57B1E7FF5FB4E7FF64B5E7FF60B4E7FF58B1E7FF57B1E8FF65B6E7FF77BC
      E6FF69B7E7FF000000000000000000000000757575FFFEFEFEFF4B4B4BFFFDFD
      FDFF515151FFF8F8F8FF4F4F4FFF4F4F4FFFF8F8F8FF4F4F4FFFF5F5F5FF4949
      49FFFBFBFBFF494949FFFDFDFDFF767676FF000000FF000000FF000000FF0000
      00FF000000000000000000000000840000FF840000FF840000FF000000000000
      000000000000840000FF840000FF840000FF000000FF000000FF000000FF0000
      00FF000000000000000000000000840000FF840000FF840000FF000000000000
      000000000000840000FF840000FF840000FF57B1E8FF77BCE6FFA8CDE3FF0000
      0000000000000000000000000000000000000000000000000000ACCEE3FF7CBE
      E6FF57B1E8FF000000000000000000000000757575FFFEFEFEFF4B4B4BFFFDFD
      FDFF515151FFF8F8F8FF4F4F4FFF4F4F4FFFF8F8F8FF4F4F4FFFF5F5F5FF4949
      49FFFBFBFBFF494949FFFDFDFDFF767676FF000000FF000000FF000000FF0000
      0000000000000000000000000000840000FF840000FF840000FF000000000000
      000000000000840000FF840000FF840000FF000000FF000000FF000000FF0000
      0000000000000000000000000000840000FF840000FF840000FF000000000000
      000000000000840000FF840000FF840000FFBDD4E2FFBBD3E2FF8FC4E5FF72BA
      E6FF60B4E7FF57B1E7FF57B1E8FF57B1E7FF60B4E7FF71BAE6FF8DC3E5FFB7D2
      E3FFBCD4E2FF000000000000000000000000757575FFFDFDFDFFFBFBFBFFFBFB
      FBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
      FBFFFBFBFBFFFBFBFBFFFDFDFDFF767676FF000000FF000000FF000000000000
      000000000000000000000000000000000000840000FF840000FF840000FF8400
      00FF840000FF840000FF840000FF00000000000000FF000000FF000000000000
      000000000000000000000000000000000000840000FF840000FF840000FF8400
      00FF840000FF840000FF840000FF0000000091C4E5FF57B1E8FF57B1E8FF57B1
      E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1
      E8FF86C1E5FF000000000000000000000000878787FFDBDBDBFFFBFBFBFFFBFB
      FBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
      FBFFFBFBFBFFFBFBFBFFDBDBDBFF878787FF000000FF00000000000000000000
      00000000000000000000000000000000000000000000840000FF840000FF8400
      00FF840000FF840000FF0000000000000000000000FF00000000000000000000
      00000000000000000000000000000000000000000000840000FF840000FF8400
      00FF840000FF840000FF000000000000000085C0E5FF57B1E8FF57B1E8FF57B1
      E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1
      E8FF79BDE6FF000000000000000000000000D9D9D9FF898989FF787878FF7878
      78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
      78FF787878FF787878FF898989FFDADADAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AECFE3FF85C0E5FF69B7
      E7FF5AB2E7FF57B1E8FF57B1E8FF57B1E8FF59B1E7FF68B7E7FF83C0E5FFABCD
      E3FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000319FE2FF89C6EDFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C4A587FFBA90
      66FFCAB19AFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D4B595FFBF8E5CFFB47941FFB47A42FFBF8F5EFFD5B597FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C09161FFBB8853FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A3D3F1FF2198E1FF3BA3E3FF00000000000000000000
      00000000000000000000000000000000000000000000A8692FFF954200FF9542
      00FF954200FFB98F64FF0000000000000000CAB199FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000D4B3
      93FFAD6D2FFFAD6B2CFFAD6B2CFFAD6B2CFFAD6B2CFFAD6B2CFFAD6B2CFFAD6E
      31FFD6B89AFF00000000000000000000000000000000909090FF515151FF5151
      51FF515151FF0000000000000000BF8F5DFFAC692AFFB9844EFFF1E6DDFFC895
      63FFC58E57FFE0C3A7FF00000000000000000000000000000000000000000000
      0000000000006C6C6CFFC7C7C7FF82C4ECFF2198E1FF2297DFFF83C4ECFF0000
      000000000000000000000000000000000000BA8F65FF954200FF000000000000
      0000C4A688FF954200FFB98F64FFCEBBA8FF954200FFC7AB90FF000000000000
      0000000000000000000000000000000000000000000000000000C69B6EFFAD6B
      2CFFAD6B2CFFAD6B2CFFAD6B2CFFBB8750FFB8824BFFAD6B2CFFAD6B2CFFAD6B
      2CFFAD6B2CFFC9A175FF000000000000000000000000515151FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000BD8B59FFAC692AFFAC692AFFAC69
      2AFFAB692DFFAC692AFFAC692AFF000000000000000000000000000000000000
      0000000000006C6C6CFF7C7C7CFF0000000036A1E2FF2198E1FF2198E1FF309E
      E1FFCDE6F6FF000000000000000000000000954200FFBE9872FF000000000000
      000000000000C6A98EFF954200FFB98F64FFC9B097FF954200FFC7AA8FFF0000
      00000000000000000000000000000000000000000000D3B293FFAD6B2CFFAD6B
      2CFFAD6B2CFFAD6B2CFFB3783EFFFFFFFFFFFCFAF7FFAD6B2CFFAD6B2CFFAD6B
      2CFFAD6B2CFFAD6B2CFFD6B89AFF0000000000000000515151FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFF00000000F0E5DBFFAC692AFFCFAE8EFFFCFC
      FCFFFFFFFFFFEDE5DCFFAC692AFFCBA175FF0000000000000000000000000000
      0000000000006B6B6BFFE9E9E9FF00000000000000002598DFFF2198E1FF2198
      E1FF2699E0FF69B8E9FF0000000000000000954200FFC09C78FF000000000000
      00000000000000000000C7AC92FF954200FFB98F64FFC9B098FF954200FFC7AA
      8FFF00000000000000000000000000000000F2EAE2FFAD6D2FFFAD6B2CFFAD6B
      2CFFAD6B2CFFAD6B2CFFB07136FFEFE2D6FFEADACBFFAD6B2CFFAD6B2CFFAD6B
      2CFFAD6B2CFFAD6B2CFFAE6E32FF0000000000000000515151FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000C59460FFAC692AFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFB98E62FFAF6B2BFF0000000000000000000000000000
      0000000000006C6C6CFF000000002B9BE0FF2198E1FF2198E1FF2198E1FF2198
      E1FF2198E1FF2198E1FF2498DFFF00000000C9AF96FF954200FFCDB8A4FF0000
      0000C09D79FF0000000000000000C9AF96FF954200FFB98F64FFC9B098FF9542
      00FFC6AA8EFF000000000000000000000000D2B190FFAD6B2CFFAD6B2CFFAD6B
      2CFFAD6B2CFFAD6B2CFFAE6D2FFFAD6B2CFFAD6B2CFFAD6B2CFFAD6B2CFFAD6B
      2CFFAD6B2CFFAD6B2CFFAD6B2CFFD5B799FF00000000515151FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000C18D55FFAC692AFFFFFFFFFFFCFC
      FCFFFFFFFFFFFFFFFFFFBE9972FFAF6B2BFF0000000000000000000000000000
      0000000000006C6C6CFF939393FF0000000051ADE6FF2198E1FF2198E1FF2198
      E1FF35A0E2FF00000000000000000000000000000000C7AC92FF954200FFCDB8
      A4FFBB9268FF954200FF0000000000000000CAB29BFF954200FFB98F64FFCAB1
      99FF954200FFC6A98EFF0000000000000000BC8A57FFAD6B2CFFAD6B2CFFAD6B
      2CFFAD6B2CFFAD6B2CFFAE6E30FFFCFBF8FFFCFAF7FFB3763CFFAD6B2CFFAD6B
      2CFFAD6B2CFFAD6B2CFFAD6B2CFFC0905EFF00000000515151FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFF00000000DEC2A7FFAC692AFFE8DBCFFFFCFC
      FCFFFFFFFFFFF6F6F6FFAC692AFFBE8954FF0000000000000000000000000000
      0000000000006C6C6CFF6C6C6CFFDDDDDDFF000000002198E1FF2198E1FF2198
      E1FF2198E1FF2198E1FFACD7F2FF000000000000000000000000C7AC92FF9542
      00FFCDB8A4FFBA9167FF954200FF0000000000000000CBB49EFF954200FFBC95
      6DFFCAB19AFF954200FFC6A98DFF00000000B2753CFFAD6B2CFFAD6B2CFFAD6B
      2CFFAD6B2CFFAD6B2CFFAD6B2CFFDEC5AEFFFFFFFFFFF3E9E1FFB8814AFFAD6B
      2CFFAD6B2CFFAD6B2CFFAD6B2CFFB57B44FF00000000515151FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFF0000000000000000AB692BFFAC692AFFB889
      59FFBD976DFFAC692AFFAC692AFF000000000000000000000000000000000000
      0000929292FF6C6C6CFF6C6C6CFFC6C6C6FFD2D2D2FF000000002198E1FF2198
      E1FF2198E1FF2198E1FF2198E1FF4FACE5FF000000000000000000000000C7AC
      92FF954200FFCDB8A4FFBB936AFF954200FF0000000000000000C6AA8EFF9542
      00FF00000000CAB19AFF954200FFC7AC91FFB1753BFFAD6B2CFFAD6B2CFFAD6B
      2CFFAD6B2CFFAD6B2CFFAD6B2CFFAF6E31FFE4D0BCFFFFFFFFFFF7F2EEFFB57B
      43FFAD6B2CFFAD6B2CFFAD6B2CFFB57A43FF00000000515151FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF0000000000000000CCA47BFFAC69
      2AFFAC692AFFBC8A54FF0000000000000000000000000000000000000000AAAA
      AAFF6C6C6CFF6C6C6CFF6C6C6CFF858585FFE7E7E7FFE2E2E2FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C7AC92FF954200FFCDB8A4FFBC956DFF954200FFC9AF96FFB6885AFF9542
      00FF0000000000000000C19F7CFF954200FFBB8854FFAD6B2CFFAD6B2CFFAD6B
      2CFFC08F5DFFCFAA87FFB67D46FFAD6B2CFFAD6C2DFFE5D1BEFFFFFFFFFFD6B6
      98FFAD6B2CFFAD6B2CFFAD6B2CFFBE8E5CFF00000000515151FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFDFF00000000000000000000
      0000000000000000000000000000000000000000000000000000C5C5C5FF6B6B
      6BFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFFC9C9C9FFDEDEDEFF8D8D8DFFD4D4
      D4FF000000000000000000000000000000000000000000000000000000000000
      000000000000C7AC92FF954200FFCDB8A4FFBE9973FF954200FF954200FF0000
      0000000000000000000000000000954200FFD0AD8BFFAD6B2CFFAD6B2CFFAD6B
      2CFFDCC2A8FFFFFFFFFFDEC5ADFFAD6B2CFFAD6B2CFFE0C8B1FFFFFFFFFFD9BC
      A0FFAD6B2CFFAD6B2CFFAD6B2CFFD3B392FF00000000515151FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFF515151FF00000000000000000000000000000000DBDBDBFF6E6E6EFF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF808080FFFCFCFCFFCECECEFF6F6F
      6FFFDFDFDFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000C7AC92FF954200FFCDB8A4FF00000000000000000000
      00000000000000000000BA9167FF954200FFF0E7DEFFAC6B2DFFAD6B2CFFAD6B
      2CFFBB8752FFFCFAF8FFFFFFFFFFF0E4D8FFF1E6DBFFFFFFFFFFFDFCFBFFBC88
      53FFAD6B2CFFAD6B2CFFAD6D2FFF0000000000000000515151FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFF515151FF00000000000000000000000000000000777777FF6C6C6CFF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFFC3C3C3FFFFFFFFFFB9B9
      B9FF7A7A7AFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C7AC92FF954200FFCDB8A4FF000000000000
      00000000000000000000954200FFC4A688FF00000000CFAD8AFFAD6B2CFFAD6B
      2CFFAD6B2CFFBF8E5CFFEADACBFFFDFBFAFFFDFBFAFFEADACBFFC19161FFAD6B
      2CFFAD6B2CFFAD6B2CFFD3B191FF0000000000000000515151FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFF515151FF000000000000000000000000898989FF6C6C6CFF6C6C6CFF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF7A7A7AFFFAFAFAFFFEFE
      FEFF9F9F9FFF8C8C8CFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000C7AC92FF954200FFC3A486FF0000
      0000BC946CFF954200FFB17B49FF000000000000000000000000C19364FFAD6B
      2CFFAD6B2CFFAD6B2CFFAD6B2CFFAD6B2DFFAD6B2CFFAD6B2CFFAD6B2CFFAD6B
      2CFFAD6B2CFFC4986AFF000000000000000000000000515151FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFF515151FF0000000000000000000000006C6C6CFF6C6C6CFF6C6C6CFF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6E6E6EFF6E6E
      6EFF6C6C6CFF6C6C6CFFB6B6B6FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C9AF96FF954200FF9542
      00FF954200FFC3A486FF0000000000000000000000000000000000000000CEA9
      85FFAB6A2CFFAD6B2CFFAD6B2CFFAD6B2CFFAD6B2CFFAD6B2CFFAD6B2CFFAC6B
      2DFFD0AD8BFF00000000000000000000000000000000515151FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFF515151FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFE4D9FFCEA985FFB9834CFFAE6F33FFAF7034FFB9844EFFCFAD8AFFF0E6
      DDFF0000000000000000000000000000000000000000909090FF515151FF5151
      51FF515151FF515151FF515151FF515151FF515151FF515151FF515151FF5151
      51FF909090FF0000000000000000000000004056CDFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF4056CDFF0000000000000000000000000000
      00000000000000000000000000000000000000000000D2BEABFFB6814BFFB173
      38FFB07034FFB17238FFB6804AFFD3C1B0FF8BC2DDFF4FABD7FF4FABD7FF4FAB
      D7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FAB
      D7FFFFFFFFFFB9E9FCFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF0000000000000000000000000000
      000000000000939393FF787878FF888888FF00000000B37335FFB07034FFB070
      34FFB07034FFB07034FFB07034FFB07034FF4FABD7FF4FABD7FF4FABD7FF4FAB
      D7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FAB
      D7FFFFFFFFFF4FABD7FF90C4DEFFFFFFFFFFB57B44FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB67D48FF00000000B57C46FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB57C46FF00000000314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFFF9FAFDFFFAFBFDFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF0000000000000000000000008686
      86FF5F5F5FFF606060FF7C7C7CFF919191FF00000000B67B41FFB07034FFB070
      34FFB07034FFB07034FFB07034FFB7824DFF4FABD7FF4FABD7FF4FABD7FF4FAB
      D7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FAB
      D7FFFFFFFFFF4FABD7FF4FABD7FFFFFFFFFFB3763CFFB4783FFFC08F5DFFB376
      3CFFC19261FFB4783FFFB3763DFF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFF00000000314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFFF9FAFDFFFAFBFDFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF0000000000000000717171FF5F5F
      5FFFA3A3A3FFEFEFEFFFFFFFFFFFFFFFFFFFEBEBEBFF00000000B07034FFB377
      40FF00000000B6814BFFB07034FF000000004FABD7FF4FABD7FF4FABD7FF4FAB
      D7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FAB
      D7FFFFFFFFFF4FABD7FF4FABD7FF70B9DCFFB3763CFFC19261FFF8F3EEFFD6B6
      97FFF8F3EEFFC08F5DFFB3763DFF00000000B3763CFFECDED0FFFFFFFFFFFFFF
      FFFFFFFFFFFFECDED0FFB3763CFF00000000314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFFF9FAFDFFFAFBFDFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF00000000828282FF5F5F5FFFC2C2
      C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFF00000000000000000000
      0000C5A280FF0000000000000000000000004FABD7FF4FABD7FF4FABD7FF4FAB
      D7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FAB
      D7FFFFFFFFFF4FABD7FF4FABD7FF4FABD7FFB3763CFFB3763CFFD7B89AFFFFFF
      FFFFD4B292FFB3763CFFB3763DFF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFF00000000314ACCFF314ACCFF314ACCFF314A
      CCFFF9FAFDFFF9FAFDFFF9FAFDFFF9FAFDFFF9FAFDFFF9FAFDFFF9FAFDFFFAFB
      FDFF314ACCFF314ACCFF314ACCFF314ACCFFBBBBBBFF5F5F5FFF9D9D9DFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000D3BCA6FFB070
      34FFB07034FFB07034FFCCAE91FF000000004FABD7FF4FABD7FF4FABD7FF4FAB
      D7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FABD7FF4FAB
      D7FFFFFFFFFF4FABD7FF4FABD7FF4FABD7FFB3763CFFC19261FFF8F3EEFFD5B5
      96FFF8F3EEFFBF8D5BFFB3763DFF00000000B3763CFFECDED0FFFFFFFFFFFFFF
      FFFFFFFFFFFFECDED0FFB3763CFF00000000314ACCFF314ACCFF314ACCFF314A
      CCFFF9FAFDFFFAFBFDFFFAFBFDFFFAFBFDFFFAFBFDFFF9FAFDFFFAFBFDFFFAFB
      FDFF314ACCFF314ACCFF314ACCFF314ACCFF8B8B8BFF5F5F5FFFEAEAEAFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF00000000BA7D42FFB070
      34FFB07034FFB07034FFB37335FF000000004FABD7FF4FABD7FF4FABD7FF4FAB
      D7FF4FABD7FFFFFFFFFFFFFFFFFFFFFFFFFF4FABD7FF4FABD7FF4FABD7FF4FAB
      D7FFFFFFFFFF4FABD7FF4FABD7FF4FABD7FFB3763CFFB4783FFFC08F5DFFB376
      3CFFC0905EFFB3773DFFB3763DFF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFF00000000314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFFF9FAFDFFFAFBFDFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF6D6D6DFF777777FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFF1E7DDFFF3EAE2FF00000000C29463FFB070
      34FFB07034FFB07034FFBA854FFF000000004FABD7FF4FABD7FF4FABD7FF4FAB
      D7FF4FABD7FFFFFFFFFFFFFFFFFFFFFFFFFF4FABD7FF4FABD7FF4FABD7FF4FAB
      D7FFFFFFFFFF4FABD7FF4FABD7FF4FABD7FFB57C45FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB68049FF00000000B67D46FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB67D46FF00000000314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFFF9FAFDFFFAFBFDFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF636363FF888888FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF5ECE5FFAF6F32FFAF6F32FFC8A98CFF00000000B680
      4AFFB07034FFB37740FF00000000000000004FABD7FF4FABD7FF4FABD7FF4FAB
      D7FF4FABD7FFFFFFFFFFFFFFFFFFFFFFFFFF4FABD7FF4FABD7FF4FABD7FF4FAB
      D7FFFFFFFFFF4FABD7FF4FABD7FF4FABD7FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFFF9FAFDFFFAFBFDFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF6B6B6BFF7B7B7BFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF7F0EAFFAF6F32FFF3EBE2FFFCFBFAFFEDEDEDFF0000
      00000000000000000000B7B7B7FF000000004FABD7FF4FABD7FF4FABD7FF4FAB
      D7FF4FABD7FFFFFFFFFFFFFFFFFFFFFFFFFF4FABD7FF4FABD7FF4FABD7FF4FAB
      D7FFFFFFFFFF4FABD7FF4FABD7FF4FABD7FFB57C46FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB7814AFF00000000B67D48FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB67D48FF00000000314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF858585FF616161FFF1F1F1FFFFFF
      FFFFFFFFFFFFFFFFFFFFFCFBF9FFAF7034FFFDFDFCFFFFFFFFFFFFFFFFFFFCFC
      FCFFEBEBEBFF6A6A6AFF888888FF000000004FABD7FF4FABD7FF4FABD7FF4FAB
      D7FF4FABD7FFFFFFFFFFFFFFFFFFFFFFFFFF4FABD7FF4FABD7FF4FABD7FF4FAB
      D7FFFFFFFFFF4FABD7FF4FABD7FF4FABD7FFB3763CFFB3763CFFB4783FFFEADB
      CBFFB3763CFFB3763CFFB3763DFF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFF000000003C53CDFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF3C53CDFFB1B1B1FF5F5F5FFFADADADFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8752FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAAAAAAFF5F5F5FFFB4B4B4FF00000000FEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB2E7FFFF4FABD7FF4FABD7FFB3763CFFB3763CFFB47940FFFDFC
      FAFFB3763CFFB3763CFFB3763DFF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFF00000000000000000000000000000000B0B0
      B0FFB0B0B0FF000000000000000000000000000000000000000000000000B0B0
      B0FFB0B0B0FF00000000000000000000000000000000757575FF626262FFD6D6
      D6FFFFFFFFFFFFFFFFFFFFFFFFFFD2B08EFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4
      D4FF616161FF777777FF0000000000000000C2E9F8FF68BBE2FF51AEDBFF51AE
      DBFF68BBE2FFC1F0FFFFFFFFFFFFFFFFFFFFD7FFFFFF4FABD7FF4FABD7FF4FAB
      D7FF4FABD7FFE2FFFFFF4FABD7FF4FABD7FFB3763CFFECDED0FFFDFBFAFFFEFE
      FEFFFDFBFAFFE9D7C6FFB3763DFF00000000B3763CFFEBDBCCFFFDFBFAFFFDFB
      FAFFFDFBFAFFEBDBCCFFB3763CFF000000000000000000000000000000006666
      66FF666666FF0000000000000000000000000000000000000000000000006666
      66FF666666FF0000000000000000000000000000000000000000676767FF6464
      64FFBCBCBCFFFCFCFCFFFFFFFFFFFAF6F1FFFFFFFFFFFBFBFBFFBABABAFF6363
      63FF696969FF000000000000000000000000FFFFFFFFA6CCDEFF59B1DBFF51AE
      DBFF51AEDBFF51AEDBFF54B0DBFFBCEEFFFFFFFFFFFF90D3F4FF4FABD7FF4FAB
      D7FF4FABD7FF4FABD7FFDCFFFFFF4FABD7FFB3763CFFB4783FFFB67C45FFFDFC
      FAFFB47940FFB4783FFFB3763DFF00000000B3763CFFB4783FFFB47940FFB479
      40FFB47940FFB4783FFFB3763CFF000000000000000000000000000000007878
      78FF666666FF666666FF666666FF666666FF666666FF666666FF666666FF6666
      66FF787878FF0000000000000000000000000000000000000000000000007272
      72FF5F5F5FFF6D6D6DFF989898FFA6A6A6FF979797FF6C6C6CFF5F5F5FFF7474
      74FF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF87C1
      DDFF54AFDBFF54AFDBFF54AFDBFF54AFDBFF7AC5EAFFFEFEFEFFA3DEFCFF4FAB
      D7FF4FABD7FF4FABD7FF4FABD7FFD9FEFEFFB3763CFFB3763CFFB4783FFFECDE
      D0FFB3763CFFB3763CFFB3763DFF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFF000000000000000000000000000000000000
      0000787878FF666666FF666666FF666666FF666666FF666666FF666666FF7878
      78FF000000000000000000000000000000000000000000000000000000000000
      0000ADADADFF7D7D7DFF646464FF5F5F5FFF646464FF808080FFAEAEAEFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB57A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB67D47FF00000000B57C45FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB57B44FF000000000000000000000000000000000000
      00000000000000000000005000FF005000FF005000FF005000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002F9EE1FF7ABAE1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6BFF515151FF4F4F
      4FFF646464FFBABABAFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000005000FF5B976BFF5A9F80FF439E56FF22AF3FFF005000FF0050
      00FF005000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000093C3E1FF2198E1FF39A1E1FF00000000000000000000
      000000000000000000000000000000000000646464FF676767FF676767FF6767
      67FF676767FF747474FF000000008B8B8BFF4C4C4CFFA5A5A5FFE2E2E2FFE6E6
      E6FFB1B1B1FF505050FF767676FF00000000C19160FFAA6523FFAA6523FFAA65
      23FFAA6523FFAA6523FFAA6523FFAA6523FFAA6523FFAA6523FFAA6523FFAA65
      23FFAA6523FFAA6523FFAA6523FFC39464FF0000000000000000000000000000
      0000005000FF61C45CFF294D4DFF383EDCFF3F4391FF5E70B6FF708B9CFF53A1
      83FF4AC171FF005000FF005000FF005000FF0000000000000000000000000000
      0000000000006C6C6CFFB6B6B6FF75B8E1FF2198E1FF2398E1FF75B8E1FF0000
      000000000000000000000000000000000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFCDCDCDFF000000004B4B4BFFE1E1E1FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF5F5F5FF505050FFB9B9B9FFAB6928FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA86322FF0000000000000000000000000050
      00FF62C062FF008200FF07661CFF132D5CFF0A0F38FF2739BDFF25236EFF4F51
      DEFF5C6284FF68C075FF5EBB7CFF004A01FF0000000000000000000000000000
      0000000000006C6C6CFF7A7A7AFF00000000349FE1FF2198E1FF2198E1FF2F9D
      E1FF00000000000000000000000000000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFEFEFEFF000000006F6F6FFF9A9A9AFFFFFFFFFFFFFFFFFFFDFDFDFFFCFB
      F8FFFFFFFFFFFFFFFFFFB8B9BAFF636363FFAB6928FFFFFFFFFFBF8E5CFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA86322FF0000000000000000005000FF61CF
      61FF008200FF148419FF1DA538FF109C2BFF108C2EFF0F662BFF0C3E24FF1336
      56FF18342CFF418C50FF2D4A2FFF004A01FF0000000000000000000000000000
      0000000000006C6C6CFF0000000000000000000000002599E1FF2198E1FF2198
      E1FF269AE1FF60B0E1FF0000000000000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFCFCFCFF00000000595959FFD0D0D0FFFFFFFFFFFFFFFFFF9D5009FF9D50
      09FF9D5009FFD1BEABFFD1BEABFF4E4F52FFAA6828FFFCFBFAFFA35A15FFD6B9
      9CFFF2ECE3FFC19463FFC69A6EFFD8BCA0FFD3B593FFC3966AFFC4996AFFC499
      6BFFC4996BFFC4996BFFC79D71FFAC6B2CFF00000000005000FF4BC04CFF0082
      00FF49C14DFFA0F2AAFF76D182FF56C067FF38B04EFF21A439FF14A12FFF119C
      2CFF128B33FF11712DFF0F551FFF004A01FF0000000000000000000000000000
      0000000000006D6D6DFF000000002B9CE1FF2198E1FF2198E1FF2198E1FF2198
      E1FF2198E1FF2198E1FF2599E1FF00000000676767FFB0B0B0FF999999FF9999
      99FF9F9F9FFF000000005C5C5CFFCECECEFFFFFFFFFFFFFFFFFF9D5009FFE7D6
      C5FFF2E9E0FFF2E9E0FFE9EAEBFF4E4E4EFFAA6928FFFFFFFFFFDEC4ABFFA158
      12FFF1E9E0FFFFFFFFFFFFFFFFFFE4CFBBFFF4ECE6FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA86322FF005000FF3BB63BFF008200FF56C7
      58FFBAFFC0FFA6F8B1FF9AF4AAFF8FF0A3FF78E591FF65DA81FF50CF6EFF32B1
      4CFF1DA136FF0E8F24FF0A620DFF000000000000000000000000000000000000
      0000000000006C6C6CFF8C8C8CFF000000004BA8E1FF2198E1FF2198E1FF2198
      E1FF339FE1FF000000000000000000000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFF00000000727272FF909090FFFFFFFFFFFFFFFFFF9D5009FFF2E9
      E0FFFFFFFFFFFFFFFFFFADADADFF676767FFAA6928FFFFFFFFFFFFFFFFFFBF8F
      5CFFAC6D2FFFFFFFFFFFFAF7F4FFA6611EFFAB6A2CFFFCFBFAFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA86322FF005000FF008200FF69D06AFFC7FF
      CAFFB2FBB7FFA7F7B0FF9AF2A6FF8CED9DFF7BE692FF6BE088FF5CDD80FF4ED9
      74FF0A620DFF0A620DFF00000000000000000000000000000000000000000000
      0000000000006C6C6CFF6C6C6CFFD1D1D1FF000000002198E1FF2198E1FF2198
      E1FF2198E1FF2198E1FF9AC6E1FF00000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFC1C1C1FF000000004B4B4BFFD2D2D2FFFFFFFFFFD1BEABFFF2E9
      E0FFFFFFFFFFE9E9E9FF4D4D4DFF00000000AA6828FFFFFFFFFFFEFEFEFFFFFF
      FFFFAA6727FFC99F73FFBD8A57FFB77C46FFB47841FFB47941FFFFFFFFFFFDFB
      FBFFFCF9F7FFFCF9F7FFFFFFFFFFA96423FF005000FF30B831FFDAFFDDFFD0FF
      D1FFC7FFCBFFB1FCB8FF9EF3AAFF91EEA1FF81E796FF79ED96FF5DDA7BFF0A62
      0DFF000000000000000000000000000000000000000000000000000000000000
      00008C8C8CFF6C6C6CFF6C6C6CFFC6C6C6FFC0C0C0FF000000002198E1FF2198
      E1FF2198E1FF2198E1FF2198E1FF49A7E1FF676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFF9E9E9EFF00000000969696FF4B4B4BFF909091FFD4D4D4FFD4D4
      D4FF9D9D9DFF4D4D4DFF868686FF00000000AC6C2DFFC8A075FFC3986AFFE7D4
      C1FFEDE0D1FFA55E1AFFA6601DFFF5EEE7FFF9F5F1FFA7611FFFC29463FFFFFF
      FFFFE6D4C2FFEADBCDFFCCA580FFAC6B2BFF00000000242424FF008100FF0081
      00FF008100FF78DC7DFFA6F7B0FF91EE9FFF89EE9DFF0A620DFF0A620DFF0000
      0000000000000000000000000000000000000000000000000000000000009F9F
      9FFF6C6C6CFF6C6C6CFF6C6C6CFF858585FFE8E8E8FF00000000000000000000
      000000000000000000000000000000000000676767FFB0B0B0FF999999FF9999
      99FF999999FF999999FFA7A7A7FF0000000000000000717171FF575757FF5454
      54FF6C6C6CFF000000000000000000000000A96827FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFCBA37BFFD4B493FFFFFFFFFFFFFFFFFFEBDDCEFFA25A13FFD5B6
      95FFDBC0A5FFD6B798FFFFFFFFFFA86322FF555555FF3A3B3BFF383535FF3C37
      37FF00000000008100FF008100FF008100FF008100FF00000000000000000000
      0000000000000000000000000000000000000000000000000000B4B4B4FF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFFC9C9C9FFDFDFDFFF888888FFC0C0
      C0FF00000000000000000000000000000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFF999999FFFFFFFFFFFCFCFCFFEEEEEEFF00000000000000000000
      000000000000ECECECFF777777FF00000000A96827FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0C7ADFFA864
      23FFA96525FFC49568FFFFFFFFFFA86322FF555555FF242424FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006F6F6FFF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF808080FFFCFCFCFFCECECEFF7070
      70FF00000000000000000000000000000000676767FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFBFBFBFFFBFB
      FBFFFEFEFEFFFFFFFFFF676767FF00000000A96827FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EFEAFFB4773FFFAD6C
      2EFFAF6E31FFB2753CFFFFFFFFFFA86322FF00000000555555FF333333FF2626
      26FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000767676FF6C6C6CFF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFFC3C3C3FFFFFFFFFFB9B9
      B9FF787878FF000000000000000000000000676767FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B0FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF676767FF00000000AC6C2DFFC89F75FFC69B6EFFC69B
      6EFFC69B6EFFC69B6EFFC69B6EFFC69B6EFFC3986BFFF9F4F0FFD7BA9EFFB173
      39FFAA6726FFA7601DFFFFFFFFFFA96726FF0000000000000000000000004B4C
      4CFF242424FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000858585FF6C6C6CFF6C6C6CFF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF7A7A7AFFFAFAFAFFFEFE
      FEFF9F9F9FFF878787FF0000000000000000905F30FF905F30FF905F30FF905F
      30FF905F30FF905F30FF905F30FF905F30FF905F30FF905F30FF905F30FF905F
      30FF905F30FF905F30FF905F30FF00000000AA6727FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFF
      FFFFE7D4C2FFBA8753FFFBFAF8FFAA682AFF242424FF025202FF025202FF0252
      02FF242424FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6C6CFF6C6C6CFF6C6C6CFF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6E6E6EFF6E6E
      6EFF6C6C6CFF6C6C6CFFA8A8A8FF00000000905F30FFB7793DFFB7793DFFB779
      3DFFB7793DFF905F30FFB7793DFFB7793DFFB7793DFF905F30FFB7793DFFB779
      3DFFB7793DFFB7793DFF905F30FF00000000A96827FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA86322FF515151FF1CBC4AFF1CBC4AFF0081
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000905F30FF905F30FF905F30FF905F
      30FF905F30FF905F30FF905F30FF905F30FF905F30FF905F30FF905F30FF905F
      30FF905F30FF905F30FF905F30FF00000000C09162FFA96827FFA96827FFA968
      27FFA96827FFA96827FFA96827FFA96827FFA96827FFA96827FFA96827FFA968
      27FFA96827FFA96827FFA96827FFC59A6EFF000000007B7B7BFF808080FF8080
      80FF808080FF7B7B7BFF0000000000000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF0000000000000000000000000000
      000000000000000000000000000000000000000000006F6F6FFF6F6F6FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000959595FF767676FF767676FF767676FF767676FF767676FF939393FF0000
      00000000000000000000000000000000000000000000A0685DFFA0685DFFA068
      5DFFA0685DFFA0685DFFA0685DFFA0685DFFA0685DFFA0685DFFA0685DFFA068
      5DFFA0685DFF211C99FF1320B9FF0000000000000000808080FFFFFFFFFFFFFF
      FFFFFFFFFFFF808080FF666666FF666666FFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF0000000000000000000000000000
      00000000000000000000929292FF00000000000000006F6F6FFF6F6F6FFF0000
      000000000000828282FF00000000000000000000000000000000000000000000
      0000767676FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777777FF0000
      00000000000000000000000000000000000000000000B38A81FFFFECCDFFFFE3
      C1FFFFDFB9FFFFDBAEFFD5A27CFFEEB586FFFFD099FFFFD69FFFFFD59CFFFFD5
      9AFF4C3F9FFF1833CFFF3C6CFDFF0B23CCFF00000000808080FFFBFBFBFFFBFB
      FBFFFBFBFBFF808080FF0000000000000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF0000000000000000000000000000
      0000000000008D8D8DFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
      6FFF6F6F6FFF6F6F6FFF919191FF00000000868686FF767676FF767676FF7676
      76FF767676FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF777777FF7676
      76FF767676FF767676FF8C8C8CFF0000000000000000B38A81FFFFEBD3FFFFE4
      C7FFFFE0BEFFBC9D8CFF5F5D71FF708DA3FF9F8B80FFD5A479FFF4C896FFA785
      99FF263DCCFF3A6BFFFF134BFFFF001AD3FF000000007A7A7AFF808080FF8080
      80FF808080FF7A7A7AFF0000000000000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF0000000000000000000000000000
      000000000000000000006F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
      6FFF6F6F6FFF6F6F6FFF0000000000000000767676FF00000000000000007676
      76FF767676FF767676FF767676FF767676FF767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF0000000000000000B38A81FFFFF0DCFFA068
      5DFFA0685DFF8E9497FF6DA7BCFF73D1F0FF83EBF6FF4F66A1FF211790FF243A
      CBFF3764FAFF1635DCFF0015D2FF000000000000000000000000000000006565
      65FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006F6F6FFF6F6F6FFF737373FF00000000000000007575
      75FF6F6F6FFF6F6F6FFF0000000000000000767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF767676FF767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF0000000000000000B38A81FFFFF4E5FFFFED
      D9FFFFE5CBFFA39F9AFF70ACBDFF82ABADFF93FAFBFF234CC7FF1A31CFFF3868
      FEFF1F46DFFF453C77FF00000000000000000000000000000000000000006F6F
      6FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070FF6F6F6FFF6F6F6FFF6F6F6FFFBEBEBEFF0000000000000000C5C5
      C5FF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF767676FF767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF0000000000000000B38A81FFFFF9EDFFA068
      5DFFA0685DFFA98C86FF536A8AFF6795ACFF76989FFF4B5897FF2942D9FF0D37
      F9FF1C62EBFF42A6F5FF63444BFF00000000000000007B7B7BFF808080FF8080
      80FF808080FF7B7B7BFF0000000000000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF0000000000000000000000000000
      00006F7071FF6E6F6FFF6F6F6FFF6F6F6FFFB8B8B8FF0000000000000000BFBF
      BFFF6F6F6FFF6F6F6FFF6F6F6FFF757575FF767676FF767676FFD7D7D7FFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFD9D9D9FF767676FF767676FF0000000000000000B38A81FFFFFFF9FFFFFF
      EDFFFFFFE9FFDBB9A4FF8D787AFF73A2B3FF7CC5CDFF7DC4C9FF4D85C6FF3141
      A2FF4168B0FF3793EBFF53567AFF0000000000000000808080FFFFFFFFFFFFFF
      FFFFFFFFFFFF808080FF666666FF666666FFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF0000000000000000000000000000
      000000000000000000006E6F6FFF6F6F6FFF6F6F6FFFB4B4B4FFB6B6B6FF6F6F
      6FFF6F6F6FFF6F6F6FFF0000000000000000767676FF767676FFFCFCFCFFBC89
      54FFB3763CFFB3763CFFB3763CFFBC8D5DFF00000000BCCBA8FF91B161FF82A8
      4AFF8EAF5CFFB6C79EFF000000000000000000000000B38A81FFDADAF1FF7370
      C1FF7B75BEFFB6ACCDFFE2CEC9FFE7C5ACFFC8AA91FF9B9893FF6F9AAEFF4F98
      CAFF3D75B9FF456BA8FF594960FF0000000000000000808080FFFBFBFBFFFBFB
      FBFFFBFBFBFF808080FF0000000000000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF0000000000000000000000000000
      0000CDB195FF00000000727474FF6F6F6FFF6F6F6FFF6F6F6FFF6F6F6FFF6F6F
      6FFF6F6F6FFF6F6F6FFF0000000000000000767676FF767676FFFBFBFAFFB376
      3CFFB3763CFFB3763CFFB67D48FF000000008FB05FFF83A94BFF83A94BFF88AC
      53FF81A849FF83A94BFF85AA4FFF0000000000000000B38A81FF5052BFFFA4A6
      DEFFBBBFECFFB0AFDFFF9A96CEFF877DBFFFA798BDFFD8BBB4FFEFC6A2FFC8A6
      8FFF8F8995FF53628FFF5C343CFF00000000000000007A7A7AFF808080FF8080
      80FF808080FF7A7A7AFF0000000000000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFF000000000000000000000000B681
      4BFFB26F2EFF9C9185FF6C6F72FF6D6F70FF6E6F6FFF6F6F6FFF6F6F6FFF6F6F
      6FFF757575FF6F6F6FFF808080FF00000000848484FF767676FFFBFBFAFFB376
      3CFFB3763CFFB3763CFFCAAD90FFB1C397FF83A94BFF83A94BFFFFFFFFFF83A9
      4BFF89AC53FF81A849FF83A94BFFB5C79DFF0000000082638EFF7B7BCAFFA4BB
      FFFF0D34FFFF5577FFFFA1B5FFFFCBD0F6FFAAACDEFF7875C3FF786BB0FFFDE1
      C0FFFFD3AAFFA0685DFF00000000000000000000000000000000000000006F6F
      6FFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BF966BFFB47C46FFB6824DFFAF6F
      32FFB06F30FFCEC0B2FF95918BFF00000000000000006E6F6FFF6F6F6FFF0000
      0000000000009C9C9CFF0000000000000000000000000000000000000000B376
      3CFFB3763CFFB3763CFF00000000749F39FF83A94BFFFFFFFFFFFFFFFFFFFFFF
      FFFF83A94BFF89AE55FF81A848FF8CAE59FF00000000B092A0FF595AC0FFCBD5
      FBFF6786FFFF0F3CFFFF0025FFFF0938FFFF5171FFFFB3C5FFFF6D6FCCFF7D6E
      AEFFFFDDB7FFA0685DFF00000000000000000000000000000000000000006F6F
      6FFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA8B5AFFAF6F32FFB07237FF0000
      0000C0976DFFB06F30FFB36F2DFFC7A480FF00000000727475FF6F6F6FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000787878FFFFFFFFFF000000006C9A2CFF83A94BFFFFFFFFFF83A94BFFFFFF
      FFFFFFFFFFFF83A94BFF89AE57FF82A849FF00000000B38A81FFA0A2DDFF6A69
      C3FFB1B0DCFFC9CDF2FFA2B3FEFF5E80FFFF0C35FFFF456BFCFFA9A8DBFF594F
      AAFFF1D2BBFFA0685DFF0000000000000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFF0000
      00000000000000000000000000000000000000000000B88653FFC19A72FF0000
      000000000000AF6F32FFAF7034FFD1BBA5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000787878FFFFFFFFFF00000000759F3AFF83A94BFF83A94BFF83A94BFF83A9
      4BFFFFFFFFFFFFFFFFFF83A94BFF8BAE58FF00000000B38A81FFFFFFFFFFE4E4
      F5FFB6B6E1FF9797D3FF8F8DCDFF9F9ED6FFB9BEEDFFDE9D57FFDE9D57FFDE9D
      57FFDE9D57FFA0685DFF0000000000000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFF0000
      00000000000000000000000000000000000000000000BC8E5FFFAF6F32FFC5A3
      81FFB47C46FFB57D49FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000939393FF767676FFACACACFFB2C498FF83A94BFF83A94BFF83A94BFF83A9
      4BFF83A94BFFFFFFFFFF99B76CFFB4C59BFF00000000B38A81FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFECECF8FFB9BAE3FF8181CCFFDE9D57FFF3C484FFFABC
      5DFFDD9946FF000000000000000000000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFF0000
      00000000000000000000000000000000000000000000AF6F32FFB1753CFFB57D
      48FFAF6F32FFB7834EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000091B162FF83A94BFF83A94BFF83A9
      4BFF83A94BFF83A94BFF81A74CFF0000000000000000B38A81FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDE9D57FFE5B681FFDE9D
      57FF00000000000000000000000000000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFF0000
      00000000000000000000000000000000000000000000CAAF94FF000000000000
      0000B98755FFBB8C5CFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEC191FF83A94BFF83A9
      4BFF83A94BFFA5BC85FF000000000000000000000000B38A81FFEACAB6FFEACA
      B6FFE7C8B5FFE3C4B4FFDFC1B3FFDBBEB1FFD7BBB0FFDE9D57FFDE9D57FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008996D6FF5A6DD1FF445ACEFF445ACEFF5B6ED1FF8B97D6FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A4BE80FF86AC4CFF77A538FF79A63BFF8CB058FFB0C593FF0000
      0000000000000000000079A63BFF0000000093440DFF93440DFF93440DFF9344
      0DFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008895
      D6FF354DCCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF364E
      CCFF8E9AD7FF000000000000000000000000000000000000000000000000B2C6
      96FF79A63CFF77A538FF77A538FF77A538FF77A538FF77A538FF77A538FF83AB
      49FF00000000000000007AA73DFF79A63BFF93440DFFEEBF82FFE98E33FF9344
      0DFF00000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000000000000000
      0000000000000000000082AA48FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000697AD2FF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF6F81D3FF00000000000000000000000000000000ADC38EFF77A5
      38FF77A538FF98B76BFFC5D1B5FF0000000000000000BBCBA5FF8AAE53FF77A5
      38FF7AA63DFFBECDA9FF77A538FF7AA63DFF93440DFF5BD26EFFF7DAB7FF9344
      0DFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000082AA48FF82AA48FF82AA48FF0000000000000000000000000000
      000000000000000000000000000000000000000000008794D6FF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF334CCCFF314A
      CCFF314ACCFF314ACCFF8E9AD7FF0000000000000000C4D0B3FF77A539FF77A5
      39FFB6C89CFF0000000000000000000000000000000000000000000000009AB8
      6EFF77A538FF7CA841FF77A538FF77A538FF93440DFF93440DFF93440DFF9344
      0DFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000082AA48FF82AA48FF82AA48FF82AA48FF82AA48FF00000000000000000000
      00000000000000000000000000000000000000000000354DCCFF314ACCFF314A
      CCFF7386DCFFFFFFFFFF3B53CEFF314ACCFF314ACCFF3C54CEFFFFFFFFFF8594
      E0FF314ACCFF314ACCFF374FCCFF00000000000000008BAF56FF77A538FFA6BF
      82FF000000000000000000000000000000000000000000000000000000000000
      000088AE51FF77A538FF77A538FF77A538FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000082AA
      48FF82AA48FF82AA48FF82AA48FF82AA48FF82AA48FF82AA48FF000000000000
      0000000000000000000000000000000000008693D6FF314ACCFF314ACCFF324B
      CCFFFFFFFFFFFFFFFFFFFFFFFFFF3B53CEFF3C54CEFFFFFFFFFFFFFFFFFFFFFF
      FFFF344DCCFF314ACCFF314ACCFF8D99D6FF0000000077A538FF7DA841FF0000
      0000000000000000000000000000000000000000000079A63BFF7AA63DFF77A5
      38FF77A538FF77A538FF77A538FF77A538FF93440DFF93440DFF93440DFF9344
      0DFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000082AA48FF82AA
      48FF82AA48FF82AA48FF82AA48FF82AA48FF82AA48FF82AA48FF82AA48FF0000
      0000000000000000000000000000000000005569D0FF314ACCFF314ACCFF314A
      CCFF3F57CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E56
      CFFF314ACCFF314ACCFF314ACCFF5C6FD1FFAFC491FF77A538FF9DB972FF0000
      000000000000000000000000000000000000000000000000000079A63BFF78A5
      39FF77A538FF77A538FF77A538FF77A538FF93440DFFEEBF82FFE98E33FF9344
      0DFF00000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000082AA48FF82AA48FF82AA
      48FF82AA48FF82AA48FF0000000082AA48FF82AA48FF82AA48FF82AA48FF82AA
      48FF000000000000000000000000000000003F56CDFF314ACCFF314ACCFF314A
      CCFF314ACCFF3F57CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E56CFFF314A
      CCFF314ACCFF314ACCFF314ACCFF465CCEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093440DFF5BD26EFFF7DAB7FF9344
      0DFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000082AA48FF82AA
      48FF82AA48FF00000000000000000000000082AA48FF82AA48FF82AA48FF82AA
      48FF82AA48FF0000000000000000000000003E55CDFF314ACCFF314ACCFF314A
      CCFF314ACCFF3C54CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B53CEFF314A
      CCFF314ACCFF314ACCFF314ACCFF455BCEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093440DFF93440DFF93440DFF9344
      0DFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000082AA
      48FF000000000000000000000000000000000000000082AA48FF82AA48FF82AA
      48FF82AA48FF82AA48FF00000000000000005367D0FF314ACCFF314ACCFF314A
      CCFF3C54CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B53
      CEFF314ACCFF314ACCFF314ACCFF596DD0FF77A538FF77A538FF77A538FF77A5
      38FF7AA73DFF79A63BFF00000000000000000000000000000000000000000000
      00000000000094B564FF77A538FFB7C99EFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000082AA48FF82AA
      48FF82AA48FF82AA48FF82AA48FF00000000828FD5FF314ACCFF314ACCFF324B
      CCFFFFFFFFFFFFFFFFFFFFFFFFFF3F56CFFF3F56CFFFFFFFFFFFFFFFFFFFFFFF
      FFFF334BCCFF314ACCFF314ACCFF8895D6FF77A538FF77A538FF77A538FF77A5
      38FF77A538FF80A943FF79A63BFF000000000000000000000000000000000000
      00000000000079A63BFF77A538FF0000000093440DFF93440DFF93440DFF9344
      0DFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000082AA
      48FF82AA48FF82AA48FF000000000000000000000000334BCCFF314ACCFF314A
      CCFF788ADDFFFFFFFFFF3F56CFFF314ACCFF314ACCFF3F56CFFFFFFFFFFF8291
      DFFF314ACCFF314ACCFF354DCCFF0000000077A538FF77A538FF77A538FF8EB1
      5AFF000000000000000000000000000000000000000000000000000000000000
      00009EBA74FF77A538FF93B462FF0000000093440DFFEEBF82FFE98E33FF9344
      0DFF00000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000082AA48FF00000000000000000000000000000000808ED5FF314ACCFF314A
      CCFF314ACCFF334BCCFF314ACCFF314ACCFF314ACCFF314ACCFF344CCCFF314A
      CCFF314ACCFF314ACCFF8693D6FF0000000077A538FF77A538FF7BA73FFF77A5
      38FFA1BC78FF000000000000000000000000000000000000000000000000ACC2
      8CFF77A538FF79A63BFF000000000000000093440DFF5BD26EFFF7DAB7FF9344
      0DFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006072D1FF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF6677D2FF000000000000000078A539FF78A539FFBECDA9FF78A5
      39FF77A538FF8DB058FFBDCCA8FF0000000000000000C1CEAEFF93B461FF77A5
      38FF77A538FFB4C799FF000000000000000093440DFF93440DFF93440DFF9344
      0DFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007A8B
      D4FF324BCCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF334B
      CCFF818FD5FF00000000000000000000000078A53AFF79A63CFF00000000C2CF
      AFFF81A945FF77A538FF77A538FF77A538FF77A538FF77A538FF77A538FF7BA7
      3FFFB9CAA2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007B8BD4FF4D62CFFF3850CCFF3951CCFF4F63CFFF808ED5FF0000
      0000000000000000000000000000000000000000000079A63BFF000000000000
      000000000000AEC38FFF8CB057FF79A63CFF79A63BFF8AAE53FFA9C188FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000085AD
      4AFF85AD49FF0000000000000000000000000000000000000000000000000000
      000000000000A96829FFDEC7B0FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007B8BD3FF000000000000
      000000000000000000007A89D2FF000000000000000000000000000000000000
      000000000000000000000000000000000000767676FF767676FF767676FF7676
      76FF767676FF767676FF00000000000000000000000000000000C5A382FFBA8A
      59FFB37942FFB07237FFAF6F33FFB07237FFB37942FFBA8A58FF0000000085AD
      4AFF85AD49FF0000000000000000000000000000000000000000D1B08EFFBF8F
      5FFF00000000E1CCB8FFAB6929FFA96829FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C5A382FFBA8A
      59FFB37942FFB07237FFAF6F33FFD0BBA6FF7A89D4FF1531C5FF1531C5FF0000
      0000000000001531C5FF1531C5FF7B8AD2FF0000000000000000000000000000
      000000000000000000000000000000000000767676FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF767676FF0000000000000000CEB399FFAE6E32FFAF6F32FFAF6F
      32FFAF6F32FFAF6F32FFAF6F32FFD3C2B2FF00000000000000000000000085AD
      4AFF85AD49FF000000000000000000000000DEC3A9FFAE6E32FFAF6F32FFAF6F
      32FFAF6F32FF00000000A96829FF0000000000000000A96829FF000000000000
      000000000000000000000000000000000000CEB399FFAE6E32FFAF6F32FFAF6F
      32FFAF6F32FFAF6F32FFAF6F32FFC9AB8EFF000000001531C5FF1531C5FF253F
      C7FF2C45C8FF1531C5FF1531C5FF000000000000000000000000000000000000
      00000000000000000000878787FF767676FF767676FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF767676FF767676FF8A8A8AFFB27132FFAE6E32FFAF6F32FFAF6F
      32FFAF6F32FFAF6F32FFAF7135FF0000000085AD49FF85AD49FF85AD49FF85AD
      49FF85AD49FF85AD49FF85AD49FF85AD49FFB27132FFAE6E32FFAF6F32FFAF6F
      32FFAF6F32FF000000000000000000000000AB6929FFAC6C2FFFA96829FF0000
      000000000000000000000000000000000000B27132FFAE6E32FFAF6F32FFAF6F
      32FFAF6F32FFAF6F32FFAF6F32FFAF7034FFCEB7A1FF000000002E46C8FF1531
      C5FF1531C5FF2F47C8FF00000000000000000000000000000000C5E1F2FF8FCB
      F2FF67B8EAFF00000000767676FF767676FF767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF767676FFB47539FFAE6E32FFAF6F32FFAF6F
      32FFAF6F32FFAF6F32FFAF7135FF0000000085AD49FF85AD49FF85AD49FF85AD
      49FF85AD49FF85AD49FF85AD49FF85AD49FFB37539FFAE6E32FFAF6F32FFAF6F
      32FFAF6F32FFAF6F32FF00000000A96829FFAD6F32FFAB6929FFAC6C2FFFA968
      29FF00000000FCFBFAFF0000000000000000B47539FFAE6E32FFAF6F32FFAF6F
      32FFAF6F32FFAF6F32FFAF6F32FFAF7034FFCEB7A1FF000000002B44C8FF1531
      C5FF1531C5FF253FC7FF0000000000000000DDECF5FF56B0E8FF53AFE7FF4FAD
      E7FF4EADE6FF00000000767676FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7
      D7FFD7D7D7FFD7D7D7FFD7D7D7FF767676FFC8A480FFAE6E31FFAF6F32FFAF6F
      32FFAF6F32FFAF7034FF00000000D4C4B5FF00000000000000000000000085AD
      4AFF85AD49FF000000000000000000000000D3AF8BFFAE6E31FFAF6F32FFAF6F
      32FFAF6F32FFAE6F33FF0000000000000000A96829FFAD6F32FFAB6929FFAC6C
      2FFFA96829FF000000000000000000000000C8A480FFAE6E31FFAF6F32FFAF6F
      32FFAF6F32FFAF7034FF00000000CBAF95FF000000001531C5FF1531C5FF2E46
      C8FF2C45C8FF1531C5FF1531C5FF0000000054B1EAFF4FADE6FF90CBEFFFC4E3
      F6FFD3E9F8FF00000000767676FFD7D7D7FFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFD7D7D7FF767676FF00000000AE6E31FFAF6F32FFAF6F
      32FFAF6F32FF000000000000000000000000AF6F32FFAF6F32FF0000000085AD
      4AFF85AD49FF00000000000000000000000000000000AE6E31FFAF6F32FFAF6F
      32FFAF6F32FF00000000000000000000000000000000A96829FFAD6F32FFAB69
      29FFAC6C2FFFA96829FF000000000000000000000000AE6E31FFAF6F32FFAF6F
      32FFAF6F32FF0000000000000000000000007686D4FF1531C5FF1531C5FF0000
      0000000000001531C5FF1531C5FF7D8CD3FF87C7F0FFCAE5F6FF8AC8EEFF57B0
      E8FF4DADE6FF00000000878787FFA7A7A7FFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFA7A7A7FF8A8A8AFF0000000000000000AE6E32FFAF6F
      32FF0000000000000000000000000000000000000000AF6F32FF0000000085AD
      4AFF85AD49FF00000000000000000000000000000000F2E9E1FFAE6E32FFAF6F
      32FF00000000000000000000000000000000FDFDFDFF00000000A96829FFAD6F
      32FFAB6929FFAC6C2FFF00000000000000000000000000000000AE6E32FFAF6F
      32FF00000000000000000000000000000000000000007787D4FF000000000000
      000000000000000000007A89D4FF0000000087C7F0FF4CABE6FF53AFE7FF56B0
      E7FF57B1E8FF000000000000000000000000A7A7A7FFFFFFFFFFFFFFFFFFFFFF
      FFFFFDFDFDFFA7A7A7FF00000000000000000000000000000000000000000000
      000000000000C7A788FFC19160FFC5A382FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D4B596FFC89766FFD1B090FF000000000000000000000000A968
      29FFAD6F32FF0000000000000000A96829FF0000000000000000000000000000
      000000000000C7A788FFC19160FFC5A382FF0000000000000000000000000000
      000000000000000000000000000000000000CAE2F3FF56B1E8FF57B1E8FF57B1
      E8FF57B1E8FF59B1E6FFA4D3F1FF00000000767676FF767676FF767676FF7676
      76FF767676FF767676FF00000000000000000000000000000000000000000000
      0000AE6E32FFAF6F32FFAE6E31FFAF6F32FFAF6F32FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AE6E32FFAF6F32FFAE6E31FFAF6F32FFAF6F32FF00000000000000000000
      00000000000000000000A96829FFA96829FF0000000000000000000000000000
      0000AE6E32FFAF6F32FFAE6E31FFAF6F32FFAF6F32FF00000000000000000000
      0000000000000000000000000000000000000000000000000000ABD7F3FF94CC
      EEFF00000000C4E4F8FF8FCBF2FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AF70
      35FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAE6E31FF000000000000
      000000000000000000000000000000000000000000000000000000000000AE6F
      34FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAE6E31FF000000000000
      000000000000A96829FFA96829FFE8D7C7FF000000000000000000000000AF70
      35FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAE6E31FF000000000000
      000000000000000000000000000000000000000000000000000000000000DCEE
      FAFF56B0E8FF53AFE7FF4FADE7FF4DADE6FF4DADE6FF4DADE6FF4DABE6FF4EAD
      E7FF53AFE7FF56B0E8FFD8ECF8FF00000000000000000000000000000000AD6E
      31FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAE6E31FF000000000000
      000000000000000000000000000000000000000000000000000000000000AD6E
      31FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAE6E31FF000000000000
      000000000000DDC5AEFFE0C9B3FF00000000000000000000000000000000AD6E
      31FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAE6E31FF000000000000
      00000000000000000000000000000000000000000000000000000000000054B1
      EAFF4FADE6FF90CBEFFFC4E3F6FFD4EAF8FFD7EBF8FFD8EBFAFFDEF0FAFFC4E3
      F5FF8FCAEFFF4FABE6FF53AFE7FF00000000000000000000000000000000AD6E
      31FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAE6E31FF000000000000
      000000000000000000000000000000000000000000000000000000000000AD6E
      31FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAE6E31FF000000000000
      000000000000000000000000000000000000000000000000000000000000AD6E
      31FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAE6E31FF000000000000
      00000000000000000000000000000000000000000000000000000000000087C7
      F0FFCAE5F6FF8AC8EEFF57B0E8FF4DADE6FF4DADE6FF4DADE6FF4BABE6FF64B6
      E9FF9CCFF0FFDEEFFAFF82C3EDFF00000000000000000000000000000000AD6D
      31FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAE6E31FF000000000000
      000000000000000000000000000000000000000000000000000000000000AD6D
      31FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAE6E31FF000000000000
      000000000000000000000000000000000000000000000000000000000000AD6D
      31FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFAE6E31FF000000000000
      00000000000000000000000000000000000000000000000000000000000087C7
      F0FF4CABE6FF53AFE7FF56B0E7FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF55B0
      E7FF52AEE7FF49AAE6FF9DD1F1FF000000000000000000000000000000000000
      0000AE6E31FFAF6F32FFAF6F32FFAF6F32FFAF6F32FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4ED
      E5FFAE6E31FFAF6F32FFAF6F32FFAF6F32FFAF6F32FFEADCD0FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AE6E31FFAF6F32FFAF6F32FFAF6F32FFAF6F32FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000C9E4
      F6FF56B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1
      E8FF57B1E8FF56B0E8FFC3E1F4FF000000000000000000000000000000000000
      000000000000BF956AFFB6824CFFBE9266FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C79D72FFB9854FFFC59A6EFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BF956AFFB6824CFFBE9266FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AAD7F3FF75BEE9FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF73BD
      EAFFA8D6F2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824949FF4C1C1DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEE6F6FF8CC7EEFF67B7E9FF56AFE6FF53AEE6FF5EB3
      E7FF78C0EBFFACD7F2FF00000000000000000000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFF00000000B8B8B8FF767676FF0000
      000000000000767676FFB8B8B8FF000000000000000000000000A06D61FFA06D
      61FFA06D61FFA06D61FFA06D61FFA06D61FFA06D61FFA06D61FFA06D61FFA06D
      61FFA06D61FFA06D61FFA06D61FF000000000000000000000000000000000000
      0000824949FF824949FFA64949FFA94B4BFF4C1C1DFF00000000000000000000
      000000000000000000000000000000000000767676FF767676FF767676FF7676
      76FFDBDBDBFFB7DFF7FF9BD0F1FFC5E3F7FFC1E1F6FFC0E0F6FFBEDEF4FFBBDF
      F4FFB8DCF4FFB3DAF4FF66B6E8FF000000000000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFF00000000B8B8B8FF767676FF0000
      000000000000767676FFB8B8B8FF0000000000000000A06D61FFFFFFFFFFA06D
      61FFFFFFFFFFA06D61FFFFFFFFFFA06D61FFFFFFFFFFA06D61FFFFFFFFFFA06D
      61FFFFEFB7FFFFEFB7FFA06D61FF000000000000000000000000824949FF8249
      49FFB64D4EFFC24D4EFFC54B4CFFB24B4CFF4C1C1DFF824949FF824949FF8249
      49FF824949FF824949FF824949FF00000000767676FFFEFEFEFFFEFEFEFFFEFE
      FEFFFDFDFDFFD7EEFCFF79C1EDFF51AEE7FF54AFE8FF59B0E7FF70BCEAFF77BF
      EBFF6EBAE9FF55AFE7FF9DD1F0FF000000000000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFF00000000B8B8B8FF767676FFBABA
      BAFFBABABAFF767676FFB8B8B8FF00000000A06D61FFFFFFFFFFFEFBFBFFFCFB
      FBFFFCFAFAFFFCFAFAFFFCFBFBFFFBF8F8FFFEFCFCFFFBF8F8FFFEFCFCFFFEFC
      FCFFA06D61FFFFEFB7FFA06D61FF000000000000000000000000824949FFD456
      57FFCB5354FFC95253FFC95051FFB74D50FF4C1C1DFFFE8B8CFFFB9A9CFFF8AA
      ABFFF7B5B6FFF7B5B6FF824949FF00000000767676FF767676FF767676FF7676
      76FFC1C1C1FF000000007CC1EAFFC7E4F6FF00000000D6EAF7FFC0E0F5FFBADE
      F4FFC8E4F6FFE5F1FAFF00000000000000000000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFFBABABAFF979797FF767676FF7676
      76FF767676FF767676FF979797FFBABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFEFB7FFA06D61FF000000000000000000000000824949FFD75A
      5BFFD05859FFCF5758FFCF5556FFBD5154FF4C1C1DFF21B548FF11C146FF14BD
      46FF0ABC3FFFF7B5B6FF824949FF0000000000000000767676FFF2F2F2FFFFFF
      FFFFF2F2F2FFE2E2E2FF0000000069B8E8FF6EBBEAFF97CCEFFFABD6F2FFADD9
      F3FFA4D4F1FF89C6EEFF59B1E7FFB3DAF3FF0000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFFBDBDBDFF767676FF767676FF7676
      76FF767676FF767676FF767676FFB8B8B8FFA06D61FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA06D61FFFFEFB7FFA06D61FF000000000000000000000000824949FFDD61
      62FFD75D5EFFD55C5DFFD55A5BFFC25558FF4C1C1DFF28B44BFF1ABF4AFF1CBC
      4AFF11BC43FFF7B5B6FF824949FF0000000000000000767676FF767676FF7676
      76FF767676FFE7E7E7FFC3E5FAFFC8E5F7FFA9D6F2FF80C3EDFF69B9EAFF63B5
      E9FF6CB9EAFF86C6EEFFB0D9F4FFA0D2F0FF0000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFF00000000BBBBBBFF767676FF7676
      76FF767676FF767676FFB4B4B3FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFEFB7FFA06D61FF000000000000000000000000824949FFE366
      67FFDD6364FFDA6162FFDE6465FFC65759FF4C1C1DFF24B147FF14BC46FF19BB
      47FF0EBB41FFF7B5B6FF824949FF000000000000000000000000767676FFFDFD
      FDFF777777FFF3F3F3FFDDF0FCFF4EADE7FF55B0E8FF59B1E8FF5AB2E8FF5BB2
      E8FF5AB2E8FF59B1E8FF54B0E8FF6EBAE9FF0000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFF0000000000000000B8B8B8FF7676
      76FF767676FFB1B0AFFFCAA582FF00000000A06D61FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA06D61FFFFEFB7FFA06D61FF000000000000000000000000824949FFEB6B
      6CFFE26566FFE67C7DFFFAD3D4FFCC6C6EFF4C1C1DFFA5D897FF4ED16DFF40C9
      64FF2BC756FFF7B5B6FF824949FF000000000000000000000000767676FFFEFE
      FEFF777777FFE5E5E5FF00000000DFEFFAFF9CD0F1FF76BEEAFF63B5E8FF60B4
      E7FF6AB8E9FF87C6EEFFB8DDF5FF000000000000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFF000000000000000000000000B6B6
      B6FFB0B0B0FFDAC0A7FFB1753BFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFEFB7FFA06D61FF000000000000000000000000824949FFF271
      72FFE96A6BFFEB8182FFFCD1D3FFCF6C6EFF4C1C1DFFFFF2CCFFFFFFD7FFFFFF
      D4FFE6FCC7FFF7B5B6FF824949FF000000000000000000000000767676FFFEFE
      FEFF777777FFDFDFDFFFA0A0A0FFC2C4C7FFECECECFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000929292FF6C6C6CFF6C6C6CFFC6C6C6FF848484FF959595FF0000
      000000000000000000000000000000000000A06D61FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA06D61FFFFEFB7FFA06D61FF000000000000000000000000824949FFF876
      77FFF07374FFEE7071FFF07172FFD16364FF4C1C1DFFFCEFC7FFFFFFD5FFFFFF
      D3FFFFFFD7FFF7B5B6FF824949FF0000000000000000767676FF767676FF7676
      76FF767676FFA5A5A5FFE0E0E0FFE0E0E0FFE0E0E0FFA6A6A6FF878787FF8989
      89FF818181FF757575FF00000000000000000000000000000000000000000000
      0000AAAAAAFF6C6C6CFF6C6C6CFF6C6C6CFF858585FFE9E9E9FF787878FFAEAE
      AEFF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFEFB7FFA06D61FF000000000000000000000000824949FFFE7D
      80FFF77879FFF67778FFF77577FFD76969FF4C1C1DFFFCEFC7FFFFFFD5FFFFFF
      D3FFFFFFD5FFF7B5B6FF824949FF0000000000000000767676FFF2F2F2FFFFFF
      FFFFF4F4F4FF797979FFDCDCDCFFE0E0E0FFDCDCDCFF797979FFF4F4F4FFFFFF
      FFFFF2F2F2FF767676FF0000000000000000000000000000000000000000C5C5
      C5FF6B6B6BFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFFC9C9C9FFDFDFDFFF6F6F
      6FFFC9C9C9FF000000000000000000000000A06D61FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA06D61FFFFEFB7FFA06D61FF000000000000000000000000824949FFFF83
      84FFFC7D80FFFB7C7DFFFE7D80FFDA6C6DFF4C1C1DFFFCEFC7FFFFFFD5FFFFFF
      D3FFFFFFD5FFF7B5B6FF824949FF00000000838383FF767676FF767676FF7676
      76FF767676FF767676FF767676FF767676FF767676FF767676FF767676FF7676
      76FF767676FF767676FF838383FF000000000000000000000000DBDBDBFF6E6E
      6EFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF808080FFFCFCFCFFCECE
      CEFF6F6F6FFFDFDFDFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFEFB7FFA06D61FF000000000000000000000000824949FFFF88
      89FFFF8283FFFF8182FFFF8283FFE07172FF4C1C1DFFFCEFC7FFFFFFD5FFFFFF
      D3FFFFFFD5FFF7B5B6FF824949FF000000008A8A8AFF888888FF838383FFE0E0
      E0FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFE0E0
      E0FF838383FF888888FF8A8A8AFF000000000000000000000000777777FF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFFC3C3C3FFFFFF
      FFFFB9B9B9FF7A7A7AFF0000000000000000A06D61FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA06D61FFFFEFB7FFA06D61FF000000000000000000000000824949FF8249
      49FFE27374FFFE8182FFFF8687FFE57475FF4C1C1DFFFAEBC5FFFCFBD1FFFCFB
      CFFFFCFBD1FFF7B5B6FF824949FF0000000000000000CECECEFF909090FF7A7A
      7AFF898989FFEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAFF898989FF7A7A
      7AFF909090FFCECECEFF000000000000000000000000898989FF6C6C6CFF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF7A7A7AFFFAFA
      FAFFFEFEFEFF9F9F9FFF8C8C8CFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFEFB7FFA06D61FF000000000000000000000000000000000000
      0000824949FF9C5455FFCB6A6BFFCF6C6CFF4C1C1DFF824949FF824949FF8249
      49FF824949FF824949FF824949FF00000000000000000000000000000000E0E0
      E0FF9B9B9BFF767676FF939393FFE0E0E0FF939393FF767676FF9B9B9BFFE0E0
      E0FF00000000000000000000000000000000B1B1B1FF6C6C6CFF6C6C6CFF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6E6E
      6EFF6E6E6EFF6C6C6CFF6C6C6CFFB6B6B6FFA06D61FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA06D61FF9D695BFFA06D61FF000000000000000000000000000000000000
      00000000000000000000824949FF824949FF4C1C1DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009A9A9AFF787878FF9A9A9AFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A06D61FFFFFFFFFFA06D
      61FFFFFFFFFFA06D61FFFFFFFFFFA06D61FFFFFFFFFFA06D61FFFFFFFFFFA06D
      61FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008B99E1FF000000000000
      000000000000000000008996E0FF000000000000000000000000000000000000
      00000000000000000000939393FF767676FF767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF939393FF0000000000000000D2BEABFFBF90
      60FFB98249FFBE8E5DFFD0BAA3FF000000000000000000000000BF905FFFB880
      46FFBD8C59FFCFB69DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000939393FF767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF939393FF0000000000000000000000000000
      0000000000000000000000000000000000008A98E2FF1531C5FF1531C5FF0000
      0000000000001531C5FF1531C5FF8A98E0FF0000000000000000000000000000
      00000000000000000000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF787878FF00000000CDB297FFB26E2DFFB26E
      2DFFB47436FFB26E2DFFB26E2DFFCDB297FF00000000B37132FFB26E2DFFB26E
      2DFFB26E2DFFB26E2DFFC9A786FF000000000000000000000000000000000000
      0000000000000000000000000000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF787878FFCEA986FFB1753CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFD9BDA1FF000000001531C5FF1531C5FF2740
      C8FF2F47CAFF1531C5FF1531C5FF000000000000000000000000000000000000
      00000000000000000000787878FFFFFFFFFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFFFFFFFFF787878FF00000000B87C44FFB26E2DFFD1BB
      A6FF00000000CDB297FFB26E2DFFB87C44FFC39A70FFB26E2DFFC8A684FF0000
      0000D0BAA4FFB26E2DFFB47436FF000000008AC3E7FF64B7EAFF64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF00000000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF787878FFB1753BFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB2763DFFE1CBB6FF000000003149CAFF1531
      C5FF1531C5FF314ACBFF00000000000000000000000000000000000000000000
      00000000000000000000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF787878FF00000000B6793FFFB26E2DFF0000
      00000000000000000000B26F2FFFB26E2DFFB5763AFFB26E2DFF000000000000
      000000000000B26E2DFFB37133FF0000000065B7E9FF64B7EAFF64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF00000000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF787878FFB3763CFFB3763CFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFDFF000000002E47C9FF1531
      C5FF1531C5FF2740C8FF0000000000000000A9A9A9FF969696FF969696FF9696
      96FF969696FF00000000787878FFFFFFFFFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFFFFFFFFF787878FF00000000C49D74FFB26E2DFFBB85
      4FFFD0B9A2FFC59F77FFB26E2DFFB26E2DFFB26E2DFFB26E2DFFC19466FFD0B8
      A1FFBB8751FFB26E2DFFC19466FF0000000065B7E9FF64B7EAFF64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF00000000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFFEFEFEFFFEFEFEFF787878FFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF000000001531C5FF1531C5FF3149
      CAFF2F47CAFF1531C5FF1531C5FF00000000979797FFF6F6F6FFF6F6F6FFF6F6
      F6FFF6F6F6FF00000000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF787878FF0000000000000000B87C44FFB26E
      2DFFB26E2DFFB26E2DFFB26E2DFFB26E2DFFB26E2DFFB26E2DFFB26E2DFFB26E
      2DFFB26E2DFFB5763AFF000000000000000065B7E9FF64B7EAFF64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF00000000787878FFFFFFFFFFFFFFFFFFFFFFFFFF9E9E
      9EFF767676FF767676FF767676FF767676FFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF8593E1FF1531C5FF1531C5FF0000
      0000000000001531C5FF1531C5FF8E9BE1FF979797FFF6F6F6FFC0966BFFC096
      6BFFC0966BFF00000000787878FFFFFFFFFFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFEFEFEFFFEFEFEFFFEFEFEFF787878FF000000000000000000000000CCB0
      94FFC5A17AFFC8AD91FFB98F62FFAE6E2FFFAE6E2FFFB17943FFCAB39CFFC5A1
      7BFFCAAB8DFF00000000000000000000000065B7E9FF64B7EAFF64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF00000000787878FFFFFFFFFFFFFFFFFFFFFFFFFF7777
      77FFFDFDFDFFFFFFFFFFBBBBBBFF8D8D8DFFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFDFF8695E1FF00000000E1CB
      B6FFF9F7F4FF000000008A98E1FF00000000979797FFF6F6F6FFF6F6F6FFF6F6
      F6FFF6F6F6FF00000000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E
      9EFF767676FF767676FF767676FF767676FF0000000000000000000000000000
      00000000000000000000767573FF6E6E6EFF6E6E6EFF6F6F6FFFBDB9B4FF0000
      00000000000000000000000000000000000065B7E9FF64B7EAFF64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF00000000787878FFFFFFFFFFFFFFFFFFFFFFFFFF7777
      77FFFDFDFDFFBBBBBBFF888888FF00000000B3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFDFFFDFDFDFFB276
      3DFFB2763DFFD9BDA3FFE2CDB9FF00000000979797FFF6F6F6FFC0966BFFC096
      6BFFC0966BFF00000000787878FFFFFFFFFFB3763CFFB3763CFFFFFFFFFF7777
      77FFFDFDFDFFFFFFFFFFBBBBBBFF8D8D8DFF0000000000000000000000000000
      000000000000797979FF6E6E6EFF707070FF797979FF6E6E6EFF717171FF0000
      00000000000000000000000000000000000065B7E9FF64B7EAFF64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF00000000787878FFFFFFFFFFFFFFFFFFFFFFFFFF7878
      78FFBABABAFF878787FF0000000000000000B3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB376
      3CFFF5EEE7FFF5EEE7FFB3763CFF00000000979797FFF6F6F6FFF6F6F6FFF6F6
      F6FFF6F6F6FF00000000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7777
      77FFFDFDFDFFBBBBBBFF888888FF000000000000000000000000000000000000
      0000949494FF6E6E6EFF6E6E6EFFB0B0B0FF00000000717171FF6E6E6EFF8080
      80FF0000000000000000000000000000000065B7E9FF64B7EAFF64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF00000000767676FF767676FF767676FF767676FF7676
      76FF8B8B8BFF000000000000000000000000B3763CFFB3763CFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3CDB8FFB376
      3CFFB3763CFFB3763CFFB3763CFF00000000979797FFF6F6F6FFC0966BFFC096
      6BFFF6F6F6FF00000000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7878
      78FFBABABAFF878787FF0000000000000000000000000000000000000000C3C3
      C3FF6E6E6EFF6E6E6EFF929292FF0000000000000000B2B2B2FF6E6E6EFF6E6E
      6EFFA9A9A9FF00000000000000000000000065B7E9FF64B7EAFF64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1753BFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB1753CFF00000000979797FFF6F6F6FFF6F6F6FFF6F6
      F6FFF6F6F6FF00000000767676FF767676FF767676FF767676FF767676FF7676
      76FF8B8B8BFF0000000000000000000000000000000000000000000000008B8B
      8BFF6E6E6EFF767676FF000000000000000000000000000000008F8F8FFF6E6E
      6EFF747474FF00000000000000000000000065B7E9FF64B7EAFF64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF65B7
      E9FF00000000000000000000000000000000CBA580FFB1753BFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB1753BFFCDA984FF00000000979797FFF6F6F6FFC0966BFFC096
      6BFFF6F6F6FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006E6E
      6EFF6E6E6EFFB9B9B9FF00000000000000000000000000000000000000007474
      74FF6E6E6EFFB2B2B2FF000000000000000065B7E9FF64B7EAFF64B7EAFF64B7
      EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF64B7EAFF65B7
      E9FF000000000000000000000000000000000000000000000000000000000000
      0000666666FF666666FFC0C0C0FFD7D7D7FF666666FF676767FF000000000000
      000000000000000000000000000000000000979797FFF6F6F6FFF6F6F6FFF6F6
      F6FFF6F6F6FF979797FFF4F4F4FFC6C6C6FFA2A2A2FF00000000000000000000
      0000000000000000000000000000000000000000000000000000ACACACFF6E6E
      6EFF949494FF000000000000000000000000000000000000000000000000B5B5
      B5FF6E6E6EFF8D8D8DFF000000000000000065B7E9FF64B7EAFF000000000000
      000000000000000000000000000000000000000000000000000064B7EAFF65B7
      E9FF000000000000000000000000000000000000000000000000000000006666
      66FF666666FF9C9C9CFF0000000000000000D8D8D8FF666666FF666666FF0000
      000000000000000000000000000000000000979797FFF6F6F6FFF6F6F6FFF6F6
      F6FFF6F6F6FF979797FFC5C5C5FFA1A1A1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000959595FF7A7A
      7AFF000000000000000000000000000000000000000000000000000000000000
      0000949494FF737373FF00000000000000006DBAE9FF64B7EAFF000000007676
      76FF767676FF767676FF767676FF767676FF767676FF0000000064B7EAFF6DBA
      E9FF000000000000000000000000000000000000000000000000000000000000
      0000DCDCDCFF00000000000000000000000000000000B3B3B3FF666666FF6666
      66FF00000000000000000000000000000000A9A9A9FF969696FF969696FF9696
      96FF969696FF969696FFA4A4A4FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009A9A9AFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F8F8FFF00000000000000000000000000000000000000000000
      0000767676FF767676FF767676FF767676FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C39D75FFB88551FFB3773FFFB17237FFB17337FFB47941FFB98855FFC5A2
      7DFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000666666FF676767FF676767FF676767FF6767
      67FF676767FF676767FF676767FF666666FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084AB
      49FF85AD49FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CBAE91FFB070
      33FFB07033FFB07033FFB07033FFB07033FFB07033FFB07033FFB07033FFB070
      33FFB07033FFD4C2B1FF00000000000000000000000000000000000000000000
      0000000000000000000000000000676767FFFEFEFEFFFFFFFFFFFFFFFFFFB0B0
      B0FFFFFFFFFFFFFFFFFFFFFFFFFF676767FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084AB
      49FF85AD49FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B17133FFB070
      33FFB07033FFB07033FFB07033FFB07033FFB07033FFB07033FFB07033FFB070
      33FFB07033FFBA8753FF00000000000000000000000000000000000000000000
      0000000000000000000000000000676767FFFEFEFEFFFFFFFFFFFFFFFFFF9999
      99FFFFFFFFFFFFFFFFFFFFFFFFFF676767FFCEA986FFB1753CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFE8D8C9FF00000000000000000000000084AB
      49FF85AD49FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B27133FFB070
      33FFB07033FFB07033FFB07033FFB07033FFB07033FFB07033FFB07033FFB070
      33FFB07033FFBA8753FF00000000000000000000000000000000C5E1F2FF8FCB
      F2FF67B8EAFF58B2EAFF00000000676767FFB0B0B0FF999999FF999999FF9999
      99FF999999FF999999FFB0B0B0FF676767FFB1753BFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB2773EFF0000000085AD49FF85AD49FF85AD49FF85AD
      49FF85AD49FF85AD49FF85AD49FF85AD49FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B9844DFFB070
      33FFB07033FFB07033FFB07033FFB07033FFB07033FFB07033FFB07033FFB070
      33FFB07032FFC39B72FF0000000000000000DDECF5FF56B0E8FF53AFE7FF4FAD
      E7FF4EADE6FF4DADE6FF00000000676767FFFEFEFEFFFFFFFFFFFFFFFFFF9999
      99FFFFFFFFFFFFFFFFFFFFFFFFFF676767FFB3763CFFB3763CFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFF0000000085AD49FF85AD49FF85AD49FF85AD
      49FF85AD49FF85AD49FF85AD49FF85AD49FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C7B39EFFB170
      31FFB07033FFB07033FFB07033FF0000000000000000B07033FFB07033FFB070
      33FFB27030FFCABEB1FF000000000000000054B1EAFF4FADE6FF90CBEFFFC4E3
      F6FFD3E9F8FFD4EAF8FF00000000676767FFFEFEFEFFFFFFFFFFFFFFFFFFB0B0
      B0FFFFFFFFFFFFFFFFFFFFFFFFFF676767FFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF00000000000000000000000084AB
      49FF85AD49FF00000000000000000000000000000000364ECCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF000000008D8D8DFF77797AFF00000000B880
      45FFB07032FFB07033FF000000000000000000000000CEB69EFFB07033FFB170
      32FFBF9A71FF0000000078797AFF979797FF87C7F0FFCAE5F6FF8AC8EEFF57B0
      E8FF4DADE6FF4DADE6FF00000000946231FFBC7C3FFFBC7C3FFFBC7C3FFFBC7C
      3FFFBC7C3FFFBC7C3FFFBC7C3FFF946231FFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000084AB
      49FF85AD49FF00000000B2773EFF0000000000000000364ECCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF00000000848484FF838383FF7A7D7DFF0000
      0000B7834CFFCAB095FF00000000000000000000000000000000C29D74FFBD94
      67FF00000000797B7CFF828282FF8D8D8DFF87C7F0FF4CABE6FF53AFE7FF56B0
      E7FF57B1E8FF57B1E8FF00000000946231FFBC7C3FFFBC7C3FFFBC7C3FFFBC7C
      3FFFBC7C3FFFBC7C3FFFBC7C3FFF946231FFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000084AB
      49FF85AD49FF00000000B2773EFF0000000000000000364ECCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314A
      CCFF314ACCFF314ACCFF314ACCFF000000009A9A9AFF818181FF7B7B7BFFA3A5
      A5FF0000000000000000C0996FFFB07033FFB07033FFC4A17BFF000000000000
      00009C9D9EFF7D7D7DFF808080FFA4A4A4FFCAE2F3FF56B1E8FF57B1E8FF57B1
      E8FF57B1E8FF59B1E6FF00000000946231FF946231FF946231FF946231FF9462
      31FF946231FF946231FF946231FF946231FFB3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF0000
      000000000000E8D8C9FFB3763CFF00000000000000003A52CDFF354ECCFF354E
      CCFF354ECCFF354ECCFF354ECCFF354ECCFF354ECCFF354ECCFF354ECCFF354E
      CCFF354ECCFF354ECCFF354ECCFF0000000000000000787878FFA1A1A1FF0000
      000000000000B58048FFB07032FFB07033FFB07033FFB07032FFBA8D5EFF0000
      000000000000979898FF7C7C7CFF000000000000000000000000ABD7F3FF94CC
      EEFF00000000C4E4F8FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3763CFFB3763CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB376
      3CFFF5EEE7FFF5EEE7FFB3763CFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009EA1
      A2FF00000000B17031FFB07033FFB07033FFB07033FFB07033FFB27031FF0000
      0000A0A2A2FF000000000000000000000000000000000000000000000000DCEE
      FAFF56B0E8FF53AFE7FF4FADE7FF4DADE6FF4DADE6FF4DADE6FF4DABE6FF4EAD
      E7FF53AFE7FF56B0E8FFD8ECF8FF00000000B3763CFFB3763CFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3CDB8FFB376
      3CFFB3763CFFB3763CFFB3763CFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007A7A7AFF8386
      8AFFCDBCABFFB17032FFB07033FFB07033FFB07033FFB07033FFB17031FFD0C4
      B8FF787B80FF7D7D7DFF000000000000000000000000000000000000000054B1
      EAFF4FADE6FF90CBEFFFC4E3F6FFD4EAF8FFD7EBF8FFD8EBFAFFDEF0FAFFC4E3
      F5FF8FCAEFFF4FABE6FF53AFE7FF00000000B1753BFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB1753CFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B8B8B8FF7C7C7CFF8689
      8BFFCDBDADFFB17032FFB07033FFB07033FFB07033FFB07033FFB17031FF0000
      00007C8184FF7C7C7CFFBFBFBFFF0000000000000000000000000000000087C7
      F0FFCAE5F6FF8AC8EEFF57B0E8FF4DADE6FF4DADE6FF4DADE6FF4BABE6FF64B6
      E9FF9CCFF0FFDEEFFAFF82C3EDFF00000000CBA580FFB1753BFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB1753BFFCDA984FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBFFF7B7B7BFF7B7D
      81FF00000000B27030FFB07033FFB07033FFB07033FFB07033FFB27030FF0000
      00007B7D81FF7A7A7AFFC5C5C5FF0000000000000000000000000000000087C7
      F0FF4CABE6FF53AFE7FF56B0E7FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF55B0
      E7FF52AEE7FF49AAE6FF9DD1F1FF000000000000000000000000000000000000
      0000666666FF666666FFC0C0C0FFD7D7D7FF666666FF676767FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008B8B8BFF7677
      77FFADABA9FFB98956FFB07032FFB07033FFB07033FFB07032FFBE986EFFA6A4
      A2FF767777FF919191FF0000000000000000000000000000000000000000C9E4
      F6FF56B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF57B1
      E8FF57B1E8FF56B0E8FFC3E1F4FF000000000000000000000000000000006666
      66FF666666FF9C9C9CFF0000000000000000D8D8D8FF666666FF666666FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C7A584FFB57C45FFB67D48FFCAAD90FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AAD7F3FF75BEE9FF57B1E8FF57B1E8FF57B1E8FF57B1E8FF73BD
      EAFFA8D6F2FF0000000000000000000000000000000000000000000000000000
      0000DCDCDCFF00000000000000000000000000000000B3B3B3FF666666FF6666
      66FF000000000000000000000000000000000000000000000000000000000000
      000000000000A96829FFCDB59EFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000959595FF767676FF767676FF767676FF767676FF767676FF767676FF9393
      93FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD6B2EFFCEAE8FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008E8E8EFF585858FF5E5E
      5EFF00000000CFBAA5FFAB6929FFA96829FF0000000000000000ABABABFF5858
      58FF8B8B8BFF0000000000000000000000000000000000000000000000000000
      0000767676FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7777
      77FF000000000000000000000000000000000000000000000000006400FF0064
      00FF006400FF295C15FF295C15FF000000000000000000649AFF000000000000
      000000000000000000000000000000000000AD6C30FFAA6423FFAA6423FFD3AC
      87FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000585858FFFDFDFDFFFFFF
      FFFFEEEEEEFF00000000A96829FF0000000000000000A96829FF00000000EDED
      EDFF585858FF0000000000000000000000000000000000000000000000000000
      0000767676FFFFFFFFFFD9BB9EFFD9BB9EFFD9BB9EFFD9BB9EFFFFFFFFFF7777
      77FF0000000000000000000000000000000000000000006400FF03A60BFF03AD
      08FF006400FF009006FF00649AFF005600FF00649AFF36B9FAFF00649AFF0000
      000000649AFF000000000000000000000000D0B295FFAA6423FFAA6423FFAA64
      23FFD3AA82FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000585858FFFDFDFDFFFFFF
      FFFFFBFBFBFF000000000000000000000000AB6929FFAC6D2FFFA96829FF0000
      0000ABABABFF0000000000000000000000000000000000000000000000000000
      0000767676FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7777
      77FF0000000000000000000000000000000000000000006400FF0FB11FFF0DB1
      1DFF006400FF00649AFF35C5D5FF00649AFF00649AFF36B9FAFF00649AFF0064
      9AFF60C4DDFF00649AFF000000000000000000000000D5B393FFAA6423FFAA64
      23FFAA6423FFD2A87DFF0000000000000000CFAE90FFC99F75FFCBA580FFD5C1
      AEFF0000000000000000000000000000000000000000585858FFFDFDFDFFFFFF
      FFFFFFFFFFFFF8F8F8FF00000000A96829FFAD6F32FFAB6929FFAC6D2FFFA968
      29FF00000000000000000000000000000000868686FF767676FF767676FF7676
      76FF767676FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7777
      77FF767676FF767676FF767676FF8C8C8CFF00000000006400FF19BA33FF19BB
      33FF006400FF28A36BFF00649AFF36D2F7FF16C5F1FF1FBBF8FF2EB2E3FF47BE
      DEFF00649AFF0000000000000000000000000000000000000000D5B596FFAA64
      23FFAA6423FFAA6423FFBF8348FFAA6423FFAA6423FFAA6423FFAA6423FFAA64
      23FFAA6525FF00000000000000000000000000000000585858FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFF8F8F8FF00000000A96829FFAD6F32FFAB6929FFAC6D
      2FFFA96829FF000000000000000000000000767676FF00000000000000007676
      76FF767676FF767676FF767676FF767676FF767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF767676FF00000000006400FF22C246FF21C6
      46FF006400FF00649AFF00649AFF6BE5FFFF22C7DEFF00649AFF1FA8C2FF38BA
      ECFF00649AFF00649AFF0000000000000000000000000000000000000000D6B7
      9AFFAA6423FFAA6423FFAA6423FFAA6423FFC48A51FFD3AA82FFCFA070FFAA64
      23FFAA6423FFAA6423FFD8BDA4FF0000000000000000585858FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FF00000000A96829FFAD6F32FFAB69
      29FFAC6D2FFFA96829FF0000000000000000767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF767676FF767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF767676FF00000000006400FF2CCE5AFF1DBE
      43FF00649AFFBBE5F3FFB9EEF5FF86E0F8FF00649AFF16842EFF00649AFF20AB
      D0FF34B6E9FF4DC1E5FF00649AFF000000000000000000000000000000000000
      0000C38D58FFAA6423FFAA6423FFF6EBE1FFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFC49567FFAA6423FFAA6423FF0000000000000000585858FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FF00000000A96829FFAD6F
      32FFAB6929FFAC6D2FFF0000000000000000767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF767676FF767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF767676FF00000000006400FF35D76BFF2ED0
      61FF006400FF00649AFF00649AFFB2EDFDFFB2EDFDFF00649AFF19BCE5FF19BC
      E5FF00649AFF00649AFF00000000000000000000000000000000000000000000
      0000AA6423FFAA6423FFF5E9DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB77C45FFAA6423FFC19A72FF00000000585858FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FF00000000A968
      29FFAD6F32FF0000000000000000A96829FF767676FF767676FFD7D7D7FFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFD9D9D9FF767676FF767676FF00000000006400FF3FE17AFF40E3
      7DFF006400FF1BAF51FF00649AFFDFFCFFFFB0EAF5FF5EC9C9FF43D1EBFF21DC
      FFFF00649AFF000000000000000000000000000000000000000000000000D1B5
      9AFFAA6423FFC2864AFFFDFDFDFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFFDFDFDFFEBD6C2FFAA6423FFB07239FF00000000585858FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FF0000
      00000000000000000000A96829FFA96829FF767676FF767676FFFCFCFCFFBC89
      54FFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFBD8955FFFEFEFEFF767676FF767676FF00000000006400FF48EA86FF49EC
      8AFF006400FF00649AFFD2F3FFFF00649AFF00649AFFB5F4FFFF00649AFF0064
      9AFF1CD2FBFF00649AFF0000000000000000000000000000000000000000CBA5
      81FFAA6423FFD1A478FFFDFDFDFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFFDFDFDFFF9F2ECFFAA6423FFAA6423FF00000000585858FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFF6F6
      F6FF00000000A96829FFA96829FFD3C2B2FF767676FF767676FFFBFBFAFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFFDFDFCFF767676FF767676FF00000000006400FF53F48DFF54F7
      92FF006400FF47C280FF00649AFF3BD082FF00649AFFD7F1FFFF00649AFF0064
      00FF00649AFF000000000000000000000000000000000000000000000000CEAD
      8DFFAA6423FFCB9864FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF2E5D9FFAA6423FFAC692BFF00000000585858FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595FF585858FF585858FF5858
      58FF6E6E6EFF000000000000000000000000848484FF767676FFFBFBFAFFB376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFFDFDFCFF767676FF898989FF00000000006400FF60FF9EFF60FF
      A2FF006400FF46D472FF56FC93FF50F486FF56DE99FF00649AFF60E4ABFF0064
      00FF000000000000000000000000000000000000000000000000000000000000
      0000AA6423FFAA6423FFFDFDFDFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFFDFDFDFFD5A97DFFAA6423FFB98857FF00000000585858FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FFFEFEFEFFFFFFFFFFBBBB
      BBFF808080FF000000000000000000000000000000000000000000000000B376
      3CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFF00000000000000000000000000000000006400FF51E987FF3CB5
      55FF006400FF006400FF32C657FF44E377FF56F991FF5AFE98FF5AFE98FF0064
      00FF000000000000000000000000000000000000000000000000000000000000
      0000AE6F33FFAA6423FFBD8955FFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFF0DECCFFAA6423FFAA6423FFD5C1AEFF00000000585858FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FFFEFEFEFFBCBCBCFF7B7B
      7BFF000000000000000000000000000000000000000000000000000000000000
      0000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF7676
      76FF0000000000000000000000000000000000000000006400FF006400FF7C77
      5AFFD8C5C1FFD8DBCEFF006400FF006400FF006400FF5AFE98FF5BF893FF0064
      00FF000000000000000000000000000000000000000000000000000000000000
      000000000000AA6423FFAA6423FFB27238FFE6CDB5FFF4E9DFFFF0E0D1FFD3A5
      78FFAA6423FFAA6423FFC18952FF0000000000000000585858FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF585858FFBCBCBCFF7A7A7AFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000787878FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF7676
      76FF00000000000000000000000000000000000000000000000000000000155D
      09FF295C15FF295C15FF7C775AFFC6A4A1FFC6A4A1FF006400FF006400FF0064
      00FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AA6423FFAA6423FFAA6423FFAA6423FFAA6423FFAA64
      23FFAA6423FFC28A54FF0000000000000000000000008E8E8EFF585858FF5858
      58FF585858FF585858FF585858FF585858FF585858FF7D7D7DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000939393FF767676FF767676FF767676FF767676FF767676FF767676FF9595
      95FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000006400FF006400FF006400FF006400FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6A585FFB47B47FFAD6B2EFFAF7035FFBB8D
      5EFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFF707070FF6C6C6CFF000000000000
      000000000000000000000000000000000000959595FF676767FF676767FF6767
      67FF676767FF676767FF676767FF676767FF676767FF676767FF676767FF6767
      67FF676767FF676767FF676767FF949494FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFFC5C5C5FF6C6C6CFF000000000000
      000000000000000000000000000000000000676767FFFEFEFEFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF0000000000000000000000000000
      0000000000000000000089AD54FF89AD54FF89AD54FF89AD54FF000000000000
      0000000000000000000000000000000000000000000000000000000000008C98
      D6FF000000000000000000000000000000000000000000000000000000000000
      00008390D5FF0000000000000000000000000000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFFC5C5C5FF6C6C6CFF000000000000
      000000000000000000000000000000000000676767FFFEFEFEFFFFFFFFFF8383
      83FF676767FF676767FF676767FF959595FFC8C8C8FF6C6C6CFF565656FF7A7A
      7AFFE5E5E5FFFFFFFFFFFFFFFFFF676767FF0000000000000000000000000000
      0000000000000000000089AD54FF89AD54FF89AD54FF89AD54FF000000000000
      00000000000000000000000000000000000000000000000000008693D6FF314A
      CCFF3B52CDFF000000000000000000000000000000000000000000000000445A
      CEFF314ACCFF7384D3FF00000000000000000000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFFC5C5C5FF6C6C6CFF000000000000
      000000000000000000000000000000000000676767FFFEFEFEFFFFFFFFFF7878
      78FF353535FF828282FF9B9B9BFFBBBBBBFF858585FF888888FFA9A9A9FF5959
      59FF606060FFFFFFFFFFFFFFFFFF676767FF0000000000000000000000000000
      0000000000000000000089AD54FF89AD54FF89AD54FF89AD54FF000000000000
      00000000000000000000000000000000000000000000909CD7FF314ACCFF314A
      CCFF314ACCFF3B52CDFF00000000000000000000000000000000445ACEFF314A
      CCFF314ACCFF314ACCFF808ED5FF000000000000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFFC5C5C5FF6C6C6CFF000000000000
      000000000000000000000000000000000000676767FFFEFEFEFFFFFFFFFFF7F7
      F7FF6A6A6AFF515151FFEDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2
      A2FF3A3A3AFFFFFFFFFFFFFFFFFF676767FF0000000000000000000000000000
      0000000000000000000089AD54FF89AD54FF89AD54FF89AD54FF000000000000
      00000000000000000000000000000000000000000000000000004258CEFF314A
      CCFF314ACCFF314ACCFF3B52CDFF0000000000000000445ACEFF314ACCFF314A
      CCFF314ACCFF3E55CDFF00000000000000000000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFFC5C5C5FF6C6C6CFF000000000000
      000000000000000000000000000000000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFF5F5F5FF5D5D5DFF666666FFFEFEFEFFFDFDFDFF848484FF727272FF3C3C
      3CFF878787FFFFFFFFFFFFFFFFFF676767FF0000000000000000000000000000
      0000000000000000000089AD54FF89AD54FF89AD54FF89AD54FF000000000000
      0000000000000000000000000000000000000000000000000000000000004258
      CEFF314ACCFF314ACCFF314ACCFF3B52CDFF4359CEFF314ACCFF314ACCFF314A
      CCFF3E55CDFF0000000000000000000000000000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFFC5C5C5FF6C6C6CFF000000000000
      000000000000000000000000000000000000676767FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFDCDCDCFF363636FFC6C6C6FFFEFEFEFF979797FF797979FF3737
      37FFC1C1C1FFFFFFFFFFFFFFFFFF676767FF000000008BAE58FF89AD54FF89AD
      54FF89AD54FF89AD54FF89AD54FF89AD54FF89AD54FF89AD54FF89AD54FF89AD
      54FF89AD54FF89AD54FF89AD54FF000000000000000000000000000000000000
      00004258CEFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF3E55
      CDFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000006C6C6CFF6C6C6CFFC5C5C5FF6C6C6CFF000000000000
      000000000000000000000000000000000000676767FFFEFEFEFFFFFFFFFFE0E0
      E0FFFBFBFBFFFBFBFBFF3D3D3DFFA4A4A4FFEBEBEBFFF7F7F7FFFFFFFFFF5959
      59FF797979FFFFFFFFFFFFFFFFFF676767FF000000008BAE58FF89AD54FF89AD
      54FF89AD54FF89AD54FF89AD54FF89AD54FF89AD54FF89AD54FF89AD54FF89AD
      54FF89AD54FF89AD54FF89AD54FF000000000000000000000000000000000000
      0000000000004258CEFF314ACCFF314ACCFF314ACCFF314ACCFF3E55CDFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8CFF6C6C6CFF6C6C6CFFC6C6C6FF848484FF8E8E8EFF0000
      000000000000000000000000000000000000676767FFFEFEFEFFFFFFFFFF6A6A
      6AFF4F4F4FFF5C5C5CFF363636FFD1D1D1FF9E9E9EFF484848FF6C6C6CFF3636
      36FF9D9D9DFFFFFFFFFFFFFFFFFF676767FF000000008BAE58FF89AD54FF89AD
      54FF89AD54FF89AD54FF89AD54FF89AD54FF89AD54FF89AD54FF89AD54FF89AD
      54FF89AD54FF89AD54FF89AD54FF000000000000000000000000000000000000
      000000000000445ACEFF314ACCFF314ACCFF314ACCFF314ACCFF3B52CDFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00009F9F9FFF6C6C6CFF6C6C6CFF6C6C6CFF858585FFE9E9E9FF787878FFA2A2
      A2FF00000000000000000000000000000000676767FFFEFEFEFFFFFFFFFFF0F0
      F0FFA7A7A7FF939393FFCCCCCCFFFFFFFFFFFAFAFAFFB4B4B4FF909090FFB0B0
      B0FFFBFBFBFFFFFFFFFFFFFFFFFF676767FF000000008DAF5BFF8BAE57FF8BAE
      57FF8BAE57FF8BAE57FF89AD54FF89AD54FF89AD54FF89AD54FF8BAE57FF8BAE
      57FF8BAE57FF8BAE57FF8BAE57FF000000000000000000000000000000000000
      0000445ACEFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF3B52
      CDFF00000000000000000000000000000000000000000000000000000000B4B4
      B4FF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFFC9C9C9FFDFDFDFFF7070
      70FFB7B7B7FF000000000000000000000000676767FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF676767FF0000000000000000000000000000
      0000000000000000000089AD54FF89AD54FF89AD54FF89AD54FF000000000000
      000000000000000000000000000000000000000000000000000000000000445A
      CEFF314ACCFF314ACCFF314ACCFF3E55CDFF4258CEFF314ACCFF314ACCFF314A
      CCFF3B52CDFF0000000000000000000000000000000000000000000000006F6F
      6FFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF808080FFFCFCFCFFCECE
      CEFF707070FF0000000000000000000000003149CAFF3149CAFF3149CAFF3149
      CAFF3149CAFF3149CAFF3149CAFF3149CAFF3149CAFF3149CAFF3149CAFF3149
      CAFF3149CAFF3149CAFF3149CAFF3149CAFF0000000000000000000000000000
      0000000000000000000089AD54FF89AD54FF89AD54FF89AD54FF000000000000
      0000000000000000000000000000000000000000000000000000445ACEFF314A
      CCFF314ACCFF314ACCFF3E55CDFF00000000000000004258CEFF314ACCFF314A
      CCFF314ACCFF3B52CDFF00000000000000000000000000000000767676FF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFFC3C3C3FFFFFF
      FFFFB9B9B9FF787878FF00000000000000003149CAFF3149CAFF3149CAFF3149
      CAFF3149CAFF3049CBFF3049CBFF3049CBFF3049CBFF3049CBFF3049CBFF3149
      CAFF3149CAFF3149CAFF3149CAFF3149CAFF0000000000000000000000000000
      0000000000000000000089AD54FF89AD54FF89AD54FF89AD54FF000000000000
      00000000000000000000000000000000000000000000ABB2DAFF344CCCFF314A
      CCFF314ACCFF3E55CDFF000000000000000000000000000000004258CEFF314A
      CCFF314ACCFF334BCCFFA4ACD9FF0000000000000000858585FF6C6C6CFF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF7A7A7AFFFAFA
      FAFFFEFEFEFF9F9F9FFF878787FF000000003149CAFF3149CAFF000000006767
      67FF000000003149CAFF3149CAFF3149CAFF3149CAFF3149CAFF3149CAFF0000
      0000676767FF000000003149CAFF3149CAFF0000000000000000000000000000
      0000000000000000000089AD54FF89AD54FF89AD54FF89AD54FF000000000000
      0000000000000000000000000000000000000000000000000000A7AFDAFF344C
      CCFF3E55CDFF0000000000000000000000000000000000000000000000004258
      CEFF334BCCFFA2ABD9FF0000000000000000A4A4A4FF6C6C6CFF6C6C6CFF6C6C
      6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6C6C6CFF6E6E
      6EFF6E6E6EFF6C6C6CFF6C6C6CFFA8A8A8FF3149CAFF3149CAFF000000006767
      67FF000000003149CAFF3149CAFF3149CAFF3149CAFF3149CAFF3149CAFF0000
      0000676767FF000000003149CAFF3149CAFF0000000000000000000000000000
      000000000000000000008FB15EFF8FB15EFF8FB15EFF8FB15EFF000000000000
      000000000000000000000000000000000000000000000000000000000000A9B1
      DAFF000000000000000000000000000000000000000000000000000000000000
      0000A6AED9FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006767
      67FF000000000000000000000000000000000000000000000000000000000000
      0000676767FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000B00100000100010000000000800D00000000000000000000
      000000000000000000000000FFFFFF00FFFF000080030000FC00000080030000
      FC0000008003000080FC000080030000800000008003000080E0000080030000
      80010000800300008003000080030000800700008003000080070000CFE70000
      9FE70000CFE700009FE70000CFE700008B470000CFC70000FCFF0000E78F0000
      FFFF0000E01F0000FFFF0000F83F000000008001FFFFFFFF00008001F9FFFFFF
      000087E1F6CFFE000000E3F9F6B7FE000000E1F9F6B7FE7C0000F8FFF8B7FE00
      0000F87FFE8FC07C0000FE7FFEBFDE000000FE3FFFFFC0600000F83FFFFFDE01
      0000F87FFFFFC0030000E0FFFFFFDA070000E1FBFFFFC2FF0000C1F3FFFFC3FF
      000083E3FFFFFFFF00008003FFFFFFFFFFFFFFFF00000000FFFFFFFF00000000
      FE00FE0000000000FE00FE0000000000FE7CFE7C00000000FE00FE0000000000
      C07CC07C00000000DE00DE0000000000C060C06000000000DE01DE0100000000
      C003C00300000000DA07DA0700000000C2FFC2FF00000000C3FFC3FF00000000
      FFFFFFFF00000000FFFFFFFF000000009FF30000FFFFFFFF0FE10000FFFFFC00
      07C10000FE00FC0003810000FE0080FC81030000FE7C8000C0070000FE0080E0
      E00F0000C07C8001F81F0000DE00800380310000C060800700100000DE018007
      00000000C0039FE711000000DA079FE731810000C2FF8B4761830000C3FFFCFF
      C0070000FFFFFFFFC20F0000FFFFFFFFFFFFFFFF8001FF07C0039FFF80010001
      C003BFFF80010000C003E3FF80010000C003E1FF80010000C003E0FF80010000
      4003F07F80010000C003F83F80010001C003FC1F80010001C003FE0F80010001
      C003FF0780010001C003FF8380010001C003FFCF80010001C003FFE980032829
      C003FFF980072829FFFFFFFF800FEFEFFFBDFFFFFFFFFE63FF18C01FF803F823
      8081800FF001F8238043007FF800C00080430047C400000080810063E2000001
      871801F1F100800384A5000000808003FC7F00000080C00707C101F1F100C007
      00010063E200E00700010047C400E00F0001007FF800E00FEFEF0007E000F01F
      E7CF0007E000F83FE00FC01FF803FC3F0000C7FFFFE7F9FF000087FFFFE7F8FF
      000003FF80E785A3000003FF81008713000001FF8100820B000003FF80E78107
      000087FF87E78783000087FF846784430000C3FFFC7FFC660000C1FF07C107DC
      0000E0C7000100080000F001000100010000F800000100010000FC00EFEFEFEF
      0000FF01E7CFE7CF0000FF83E00FE00FFFFFFFFF0000FF24FFFFFC3F0000F924
      FC3FFE1F00000124F87FFF0F00000124F0FFFF8700000104E1FFFFC300000004
      C3FF000100000004800000000000C01F000000010000F87F8000FFC30000F07F
      C3FFFF870000F03FE1FFFF0F0000E03FF0FFFE1F0000E03FF87FFC3F0000E03F
      FC3FFFFF0000E03FFFFFFFFF0000F03FFF83FF83F000C000FF018001F0008000
      80000000F000800002000200F000800042000200F00080004200020080008000
      4200020000008000010101010000800020810081000080002079007900008000
      20010001800780001FFF0001C00F800000030001E01F800000030001E0FF8000
      00FF0001FFFF800001FF0001FFFFFFFFFC00FFFFF9FFFE00FC000000F8FFFE00
      0201000005A10200020100000711020001030000020902000103000001050200
      00870000008302000003000000430200004B00000026020000330000001C03FF
      000300000008000108430000000100010C730000000100010F7BF03FF03FF03F
      0FFFE31FE31FE31F0FFFF78FF78FF78FFF87FFBFFFFFFE00FE01FF1FFFFFFE00
      0201020B010002000400044701000200040004E300FF010104000311000300C7
      0400000800030083020100050003008302010003000300830187000300030083
      007B000300030047084308430843087B0C730C730C730C730F7B0F7B0F7B0F7B
      0FFF0FFF0FFF0FFF0FFF0FFF0FFF0FFFFE00FF03FFBDFF87FE00FE01FF18FE01
      0200000000810201020004000043040001010400004304000033040000810400
      00C7040000180400008302000025020100830201000302010083018300030187
      0047007B0003007B087B0843084308430C730C730C730C730F7B0F7B0F7B0F7B
      0FFF0FFF0FFF0FFF0FFF0FFF0FFF0FFFF00FFFFFFFE7FC03E0070000FFE7F801
      C003000000E70001800100000100048380000000010002000000000000E70000
      0000000000270000000000000027020100000000001B007F0000002000030003
      00000C300003000300010E3C0843084300010FBE0C730C7300030FFF0F7B0F7B
      20070FFF0FFF0FFFF81FFFFF0FFF0FFF0000E7FFFF80FF030000C1FFE100FE01
      000000FFE070FC000000003FFFF0C4000000000FFE1F040000000007021C0400
      000000010001040000000000000302000000800000C702010000E000003DC983
      0000F0000001E0790000FC000001E0010000FF000001E0010000FF830001E001
      0000FFEF0001E0010000FFFF0001F807FFFFF81F9FFF0000C387FC3F0FFF0000
      C387FE7F07FF0000C387F81F830F0000C387F18FC0070000C387E667E0010000
      C387E427F0010000C387E817F0000000C387E817E0000000C387E817E0000000
      C387F81FE0000000C387F81FF0000000C387F81FF0000000C387F81FF8010000
      C387F81FFC030000FFFFFC3FFE0F0000FFFFFFFFFFEFFFFFF9FFF9FFE1010000
      F9FFF9FF81010000F3C7F3C70311000073C773C70238000027FF27FF03110000
      07C707C70101000000C700C70101000001E301E300EF000003F103F1003F0000
      06380638000700000E380E381FC700001E381E38000700003F013F0100070000
      7F837F8300070000FFFFFFFF800FFFFFFCFFC7FFF81FFE7FFC7F837FE0078603
      F81F303FC0038301F907381F80018100F9833C0F00018300FA01160700008300
      F907830300008100F881C18100008181F040E0C8000080C3E03FF00C0000807F
      C00FF81E000080078007FC7C000180078007FE3C800180070003FF11C0038007
      0001FF83E0078007FFFFFFFFF00F80070000FF800000FFFF0000F88000000101
      0000E080000001010000C0490000010100008077000001010000004100000101
      00000041000001010000004100000101000000230000FFFF0000001D00000101
      0000000100000101000000010000010100008003000001010000C00700000101
      0000E00F000001010000F01F00000101FC3FFCFFFF83FFFFF807FC7F02010000
      F000F81F02000000E000F90F04000000C000FB83040000008000FA0104000000
      0001F907040000000003F88102010000000FF04002010000801FE07F01870000
      087FC00F007900003FFFC00F000100008FFF800700010000E7FF000300010000
      07FF0001000100000FFFFFFF000100008300FF9FF01F80018000FD9BF01F8000
      8300F801000180008300FC0360018001EFFFFC6300018003EFFFF06000018001
      8300F060000180018000FC03008380018300F403010180018300E00100008003
      EFFF019BE2008003EFFF109FF2008003001F98FFF2008003001F83FFF0008007
      001F83FFFF01800F001FB3FFFF83801FFFFFFFFFF81FF81D0FFFFFFFE007E00C
      0801FDFFC003C1800FFFF8FF800187E00FFFF07F80018FF0FFFFE03F00009F80
      0FFFC01F00001FC00801820F0000FFFF0FFFC7070000FFFF0FFFEF83000003F8
      FFFFFFC1000001F90FFFFFE380010FF10801FFF7800107E30FFFFFFFC0030183
      0FFFFFFFE0072007FFFFFFFFF81FB81FFFE7F9FFFFBDFF03C027C8FFC018FF03
      00E705BF0081FC000100071F0043C4000100020B0043040002E7030702810400
      8727878387180400CFA78F43CFBD0703F8FFF8E6F8FF0103F07FF07CF07FC9FF
      E03FE038E03FE001E03FE039E03FE001E03FE03FE03FE001E03FE03FE03FE001
      F07FE03FF07FE001F8FFF8FFF8FFF807FE7FFC03FC99C001F07F0001FC998001
      C0010001FC810001C0010483FC000001C0018200FC000001C0018000FC810001
      C001C000FCC10001C001C201FCE10001C001C07FF81F0001C0018003F00F0001
      C0018003E0070001C0010001C0030001C0010001C0030001C001800380010001
      F001E00F00000001FC7FFC7FFFFF800FFFBDFC00C1C3FE00FF18FC008081FE00
      0081FC00881102000043FC009C390200004304008001020000810400C0030200
      00180400E007020000250400FC1F020100010400F81F020300010401F08F0207
      00010403E18703FF00010407E3C7000F000107FFE3E3000FF03F007FC7E33FCF
      E31F00FFCFF3204FF78F01FFDFFBF0FFFFFFF00FFE00FFE7FFFFC003FE00FFE7
      FFFFC003FE0000E7FFFFC003C2000100FFFFC00302000100FFFFC183020000E7
      8001238402000025800113C80200002580010C300200001980019819CBFF0001
      FFFFE817E0010001FFFFC003E0010001FFFF8011E0010001FFFF8811E001F03F
      FFFFC003E001E31FFFFFFC3FF807F78FF9FFF00FFFFF9FFF88C7F00FC1BF0FFF
      85A7F00F801707FF8717F00F8003830F820F00008007C007810760008003E001
      808300008001F001804300008003F000802600008007E000801C00008003E000
      800800008007E00080070000800FF0008007E007800FF000800FF00F800FF801
      801FF00FE00FFC03803FF00FFC3FFE0FFC3F0000FFFFFFFFFC3F0000FC3FEFF7
      FC3F0000FC3FC7E3FC3F0000FC3F83C1FC3F0000FC3FC183FC3F0000FC3FE007
      FC3F00008001F00FFC3F00008001F81FF81F00008001F81FF00F00008001F00F
      E0070000FC3FE007E0070000FC3FC183C0030000FC3F83C180010000FC3FC7E3
      00000000FC3FEFF7FFFF0000FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.xls'
    FileName = 'file1'
    Filter = 
      #1058#1077#1082#1089#1090'(*.txt)|*.TXT|CSV '#1092#1072#1081#1083'(*.csv)|*.CSV|HTML '#1092#1072#1081#1083' (*.htm)|*.HTM' +
      '|Rich Text Format (*.rtf)|*.RTF|Microsoft Excel Workbook (*.xls)' +
      '|*.XLS|Microsoft Excel 2006+ (*.xlsx)|*.XLSX'
    Left = 77
    Top = 304
  end
  object ilWin: TImageList
    Left = 184
    Top = 160
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005367CF00334C
      CC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334C
      CC00334CCC005367CF0000000000000000000000000000000000000000000000
      0000A3856900A0743E0074624000575550007171710000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005367CF00334CCC00334C
      CC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334C
      CC00334CCC00334CCC005367CF00000000000000000000000000A6846600CF7B
      2F00FE861C00EC922600EFAC3900C48E32008B6B3400625743005D5D5D007171
      7100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000334CCC00334CCC00334C
      CC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334C
      CC00334CCC00334CCC00334CCC000000000000000000DD873900FF8B2100FF8C
      2400FF8C2700E8912A00E7A53400EDA63500F0A42C00D9982F003F78A600395D
      810053565A007A7A7A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000334CCC00334CCC00334C
      CC00334CCC007E8DDE003850CD00334CCC00334CCC003850CD007E8EDE00334C
      CC00334CCC00334CCC00334CCC0000000000FE922F00FF953400FF973800FF99
      3D00FF9C4400E4943300D9972A00DB983100B3905500BD8B46002F78B80022C3
      FF002B94DA003F60860071717100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000334CCC00334CCC00334C
      CC007A8BDD00FFFFFF00C2C9EF003850CD003850CD00C1C8EF00FFFFFF007C8C
      DE00334CCC00334CCC00334CCC0000000000FE912E00FFA35000FFA55300FFA7
      5900FFAC6100E1973C00CF8C2100D08C31002D79BC002B7CC3002C83CA0024C4
      FF0028C7FF002C75B80071717100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000334CCC00334CCC00334C
      CC00364FCC00BCC4EE00FFFFFF00C2C9EF00C1C8EF00FFFFFF00BDC5EE00374F
      CD00334CCC00334CCC00334CCC0000000000FE922F00FFB26C00FFB36E00FFB5
      7200FFBA7B00DD994400C1801900C3802C002B75B90015BBFF0021B2FF0022BB
      FF0022BEFF002C73B80071717100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000334CCC00334CCC00334C
      CC00334CCC00364FCC00BCC4EE00FFFFFF00FFFFFF00BDC5EE00374FCD00334C
      CC00334CCC00334CCC00334CCC0000000000FE922F00FFBF8600FFC08700FFC2
      8B00FFC99500DA9B4B00B2720F00B7751D002B77BD0016B6FF001BB5FF001BB4
      FF001CB7FF002C73B80071717100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000334CCC00334CCC00334C
      CC00334CCC003850CD00C1C8EF00FFFFFF00FFFFFF00C2C9EF003850CD00334C
      CC00334CCC00334CCC00334CCC0000000000FE923000FFCDA100FFCDA000FFD0
      A500FFD6B100D79E5600A4660800A36A1A002B78BC000BB2FF0013AFFF0015AD
      FF0014B0FF002C73B80071717100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000334CCC00334CCC00334C
      CC003850CD00C1C8EF00FFFFFF00BDC5EE00BCC4EE00FFFFFF00C2C9EF003850
      CD00334CCC00334CCC00334CCC0000000000FE933000FFDBBC00FFDAB800FFDC
      BF00FFEAD400D1A36400925700009C610B003376B0002A7DC500228CDB000DA9
      FF000DAAFF002C73B80071717100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000334CCC00334CCC00334C
      CC00798ADD00FFFFFF00BDC5EE00374FCD00364FCC00BCC4EE00FFFFFF007B8B
      DE00334CCC00334CCC00334CCC0000000000FE933100FFEAD700FFECDB00FFEE
      DF00FFDDBC00E09543009C5C05008A5403008F4E00006B614C002A75BA0004A6
      FF0008A4FF002C73B80071717100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000334CCC00334CCC00334C
      CC00334CCC007788DD00374FCD00334CCC00334CCC00364FCC007888DD00334C
      CC00334CCC00334CCC00334CCC0000000000FE943200FFF9F400FFD9B800FFAD
      6100FF8D2600FF902A00F8983900D68C3700AF711B008B5612002A74B900009E
      FF00029CFF002C72B80071717100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000334CCC00334CCC00334C
      CC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334C
      CC00334CCC00334CCC00334CCC0000000000FE983900FFB36E00FFA55200FFA5
      5200FFB26900FFBA7A00FFC78E00FFC48500F1A96500818C8B002384C800029F
      FF000098FF002C72B80071717100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005266CF00334CCC00334C
      CC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334C
      CC00334CCC00334CCC005266CF000000000000000000FD943200FD963700FEBB
      7E00FFE2C300FECA9300E8A56400918D86003779B5003A97CE0039CBF30026D1
      FF000EABFC00318ED80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005368CF00334C
      CC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334C
      CC00334CCC005368CF000000000000000000000000000000000000000000FD9E
      4600F9A5560088929500367AB80068A9D60098E4F70088E6FE0036B8FA00149B
      F300149BF3000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000149BF3001EA1F6002DA8F700159CF500149BF3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006868680069696900696969006969
      6900696969006969690069696900696969006969690069696900696969006969
      6900696969006969690069696900686868006868680069696900696969006969
      6900696969006969690069696900696969006969690069696900696969006868
      68000000000000000000000000000000000000000000000000009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000000000000000000009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C009C9C9C009C9C9C000000000069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006969690069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006969
      69000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009C9C9C009C9C9C0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF009C9C9C009C9C9C0069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006969690069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006969
      690000000000000000000000000000000000FFFFFF00844A31006B2108007329
      1000732910007329100073291000732910007329100073290800732908007329
      08006B21080073422900FFFFFF009C9C9C00FFFFFF00844A31006B2108007329
      1000732910007329100073291000732910007329100073290800732908007329
      08006B21080073422900FFFFFF009C9C9C0069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006969690069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006969
      690000000000000000000000000000000000FFFFFF009C290800B5422100B542
      2100B5422100B5422100B5422100B5422100BD422100BD391800BD391800C639
      1000B53108006B210800FFFFFF009C9C9C00FFFFFF009C290800B5422100B542
      2100B5422100B5422100B5422100B5422100BD422100BD391800BD391800C639
      1000B53108006B210800FFFFFF009C9C9C0069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006969690069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006969
      690000000000696969006969690068686800FFFFFF00BD391800BD422100C64A
      2900C64A2900C64A2900C64A2900C64A2900CE4A2100CE4A2100CE4A2100CE4A
      1000C639100073290800FFFFFF009C9C9C00FFFFFF00BD391800BD422100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C639100073290800FFFFFF009C9C9C0069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006969690069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006969
      690000000000FFFFFF00FFFFFF0069696900FFFFFF00B5391800BD4A2900C64A
      3100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE4A1000CE4A
      1000C639100073290800FFFFFF009C9C9C00FFFFFF00B5391800BD4A2900FFFF
      FF00C64A3100C64A3100C64A3100C64A3100CE4A3100C64A2100C64A2100FFFF
      FF00C639100073290800FFFFFF009C9C9C0069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006969690069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006969
      690000000000FFFFFF00FFFFFF0069696900FFFFFF00BD422100C6523100C652
      3100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CE4A1000CE4A
      1000BD39180073290800FFFFFF009C9C9C00FFFFFF00BD422100C6523100FFFF
      FF00CE4A3100CE4A3100C6522900C6522900CE4A3100C64A2100BD422100FFFF
      FF00BD39180073290800FFFFFF009C9C9C0069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006969690069696900FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006969
      690000000000FFFFFF00FFFFFF0069696900FFFFFF00BD422100CE4A3100CE4A
      3100CE4A3100CE4A3100CE4A3100C64A2900C64A2900C6422100C6422100CE42
      1800CE42180073311000FFFFFF009C9C9C00FFFFFF00BD422100CE4A3100FFFF
      FF00CE4A3100CE4A3100CE4A3100C64A2900CE4A3100C6422100C6422100FFFF
      FF00C642180073311000FFFFFF009C9C9C0069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006969690088AC550088AC550088AC550088AC
      550088AC550088AC550088AC550088AC550088AC550088AC550088AC550088AC
      550000000000FFFFFF00FFFFFF0069696900FFFFFF00BD4A2900CE4A3100CE4A
      3100CE4A3100CE4A3100C64A3100C64A3100BD422100BD422100C6421800C642
      1800C642180073311000FFFFFF009C9C9C00FFFFFF00BD4A2900CE4A3100FFFF
      FF00CE4A3100CE4A3100CE4A3100CE4A3100CE4A3100C6422100C6422100FFFF
      FF00C642210073311000FFFFFF009C9C9C0069696900FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006969690088AC550088AC550088AC550088AC
      550088AC550088AC550088AC550088AC550088AC550088AC550088AC550088AC
      550000000000FFFFFF00FFFFFF0069696900FFFFFF00C6523100D6523900D652
      3100D6523100C64A3100C64A3100BD4A2900BD422100BD422100BD422100C642
      1800BD42210073311000FFFFFF009C9C9C00FFFFFF00C6523100D6523900FFFF
      FF00CE4A3100CE4A3100CE4A3100CE4A3100CE4A3100BD422100BD422100FFFF
      FF00BD42210073311000FFFFFF009C9C9C0069696900FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF006969690088AC550088AC550088AC550088AC
      550088AC550088AC550088AC550088AC550088AC550088AC550088AC550088AC
      550000000000FFFFFF00FFFFFF0069696900FFFFFF00CE4A3100D65A3900D65A
      3900CE4A3100CE4A3100C64A3100BD4A2900BD422100C6422100C6422100C642
      2100B542210073311000FFFFFF009C9C9C00FFFFFF00CE4A3100D65A3900FFFF
      FF00CE4A3100CE4A3100C64A3100BD4A2900BD422100BD422100BD422100FFFF
      FF00B542210073311000FFFFFF009C9C9C0069696900FDFDFD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00696969000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF0069696900FFFFFF00D6523100D65A4200D652
      3900D6523100CE4A3100C64A3100BD4A2900BD4A2900BD422100BD422100BD42
      2100BD42210073311000FFFFFF009C9C9C00FFFFFF00D6523100D65A4200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00BD42210073311000FFFFFF009C9C9C0088AC550088AC550088AC550088AC
      550088AC550088AC550088AC550088AC550088AC550088AC550088AC550088AC
      550088AC550088AC550088AC550088AC55000000000000000000000000000000
      000069696900FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0069696900FFFFFF00D6523900D6634A00D65A
      4200D65A3900D65A3900CE4A3100CE4A3100C64A3100BD4A2900BD4A2900BD4A
      2900BD4A290073311000FFFFFF009C9C9C00FFFFFF00D6523900D6634A00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B542210073311000FFFFFF009C9C9C0088AC550088AC550088AC550088AC
      550088AC550088AC550088AC550088AC550088AC550088AC550088AC550088AC
      550088AC550088AC550088AC550088AC55000000000000000000000000000000
      000088AC550088AC550088AC550088AC550088AC550088AC550088AC550088AC
      550088AC550088AC550088AC550088AC5500FFFFFF00D65A3900DE735A00D663
      4A00D65A4200D65A4200D6523900D6523900D6523900D6523900CE4A3100CE4A
      3100BD4A290073291000FFFFFF009C9C9C00FFFFFF00D65A3900DE735A00D663
      4A00D65A4200D65A4200D6523900D6523900D6523900D6523900CE4A3100CE4A
      3100BD4A290073291000FFFFFF009C9C9C0088AC550088AC550088AC550088AC
      550088AC550088AC550088AC550088AC550088AC550088AC550088AC550088AC
      550088AC550088AC550088AC550088AC55000000000000000000000000000000
      000088AC550088AC550088AC550088AC550088AC550088AC550088AC550088AC
      550088AC550088AC550088AC550088AC5500FFFFFF00E76B5200D65A3900CE52
      3900CE4A3100C6523100C6523100C6523100C6523100C6523100BD4A2900BD42
      2100A5391000844A3100FFFFFF0000000000FFFFFF00E76B5200D65A3900CE52
      3900CE4A3100C6523100C6523100C6523100C6523100C6523100BD4A2900BD42
      2100A5391000844A3100FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000088AC550088AC550088AC550088AC550088AC550088AC550088AC550088AC
      550088AC550088AC550088AC550088AC550000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000C003F07F00000000
      8001C00F00000000800180030000000080010001000000008001000100000000
      8001000100000000800100010000000080010001000000008001000100000000
      8001000100000000800100010000000080010001000000008001800300000000
      C003E00700000000FFFFFC1F000000000000000FC001C0010000000F80008000
      0000000F000000000000000F0000000000000008000000000000000800000000
      0000000800000000000000080000000000000008000000000000000800000000
      00000008000000000000FFF8000000000000F000000000000000F00000000000
      0000F00000010001FFFFF0008003800300000000000000000000000000000000
      000000000000}
  end
  object ilFilter: TImageList
    Left = 184
    Top = 96
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A00626262005B5B5B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000373737003131310037373700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000626262005B5B5B005353530000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000373737003131310037373700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A00545454004C4C4C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000373737003131310037373700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000525252004D4D4D004545450000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000373737003131310037373700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005B5B5B00525252004D4D4D00464646003E3E3E0035353500323232000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3F00373737003131310037373700313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D4D4D00464646003E3E3E003737370031313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D4D4D00464646003E3E3E00373737003E3E3E00373737003131
      3100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3F00373737003131310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005B5B5B00525252004D4D4D00464646003E3E3E00464646003E3E3E003535
      3500323232000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000323232000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005B5B
      5B005B5B5B00525252004D4D4D00464646003E3E3E00464646003E3E3E003535
      3500323232003232320000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E6E6E006E6E6E00727272006E6E6E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000319EE1007CBAE1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E6E6E006E6E6E00C5C5C5006E6E6E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000093C3E1002398E1003BA1E10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E6E6E006E6E6E00C5C5C5006E6E6E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006E6E6E00B6B6B60077B8E1002398E1002598E10077B8E1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E6E6E006E6E6E00C5C5C5006E6E6E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006E6E6E007C7C7C0000000000369FE1002398E1002398E100319D
      E100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E6E6E006E6E6E00C5C5C5006E6E6E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006E6E6E000000000000000000000000002799E1002398E1002398
      E100289AE10062B0E10000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000323232000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E6E6E006E6E6E00C5C5C5006E6E6E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006F6F6F00000000002D9CE1002398E1002398E1002398E1002398
      E1002398E1002398E1002799E100000000000000000000000000000000000000
      000024242400A7A7A700000000000000000000000000A7A7A700242424000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000003F3F3F00373737003131310000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E6E6E006E6E6E00C5C5C5006E6E6E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006E6E6E008C8C8C00000000004DA8E1002398E1002398E1002398
      E100359FE1000000000000000000000000000000000000000000000000000000
      0000A7A7A70024242400A7A7A70000000000A7A7A70024242400A7A7A7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D4D4D00464646003E3E3E003737370031313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E6E6E006E6E6E00C5C5C5006E6E6E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006E6E6E006E6E6E00D1D1D100000000002398E1002398E1002398
      E1002398E1002398E1009AC6E100000000000000000000000000000000000000
      000000000000A7A7A700242424007373730024242400A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00005B5B5B00525252004D4D4D00464646003E3E3E0035353500323232000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8C006E6E6E006E6E6E00C6C6C600848484008E8E8E000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008C8C8C006E6E6E006E6E6E00C6C6C600C0C0C000000000002398E1002398
      E1002398E1002398E1002398E1004BA7E1000000000000000000000000000000
      0000000000000000000073737300242424007373730000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000525252004D4D4D004545450000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009F9F9F006E6E6E006E6E6E006E6E6E0085858500E9E9E9007A7A7A00A2A2
      A200000000000000000000000000000000000000000000000000000000009F9F
      9F006E6E6E006E6E6E006E6E6E0085858500E8E8E80000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A7A7A700242424007373730024242400A7A7A700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005A5A5A00545454004C4C4C0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B4B4
      B4006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E00C9C9C900DFDFDF007272
      7200B7B7B7000000000000000000000000000000000000000000B4B4B4006E6E
      6E006E6E6E006E6E6E006E6E6E006E6E6E00C9C9C900DFDFDF0088888800C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000A7A7A70024242400A7A7A70000000000A7A7A70024242400A7A7A7000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000626262005B5B5B005353530000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007171
      71006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E0080808000FCFCFC00CECE
      CE00727272000000000000000000000000000000000000000000717171006E6E
      6E006E6E6E006E6E6E006E6E6E006E6E6E0080808000FCFCFC00CECECE007272
      7200000000000000000000000000000000000000000000000000000000000000
      000024242400A7A7A700000000000000000000000000A7A7A700242424000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006A6A6A00626262005B5B5B0000000000000000000000
      0000000000000000000000000000000000000000000000000000787878006E6E
      6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E00C3C3C300FFFF
      FF00B9B9B9007A7A7A00000000000000000000000000787878006E6E6E006E6E
      6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E00C3C3C300FFFFFF00B9B9
      B9007A7A7A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000858585006E6E6E006E6E
      6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E007C7C7C00FAFA
      FA00FEFEFE009F9F9F008787870000000000858585006E6E6E006E6E6E006E6E
      6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E007C7C7C00FAFAFA00FEFE
      FE009F9F9F008787870000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4A4A4006E6E6E006E6E6E006E6E
      6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E007070
      7000707070006E6E6E006E6E6E00A8A8A8006E6E6E006E6E6E006E6E6E006E6E
      6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E006E6E6E00707070007070
      70006E6E6E006E6E6E00A8A8A800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF00000000FC7FFE3F00000000FC7FFE3F00000000
      FC7FFE3F00000000FC7FFE3F00000000F01FFC1F00000000F83FF80F00000000
      FC7FF00700000000FEFFE00300000000FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF00000000FC3FFCFFFFFFFFFFFC3FFC7FFFFFFFFF
      FC3FF81FFFFFFFFFFC3FF90FFFFFFFFFFC3FFB83FFFFFEFFFC3FFA01F39FFC7F
      FC3FF907F11FF83FFC3FF881F83FF01FF81FF040FC7FFC7FF00FE07FF83FFC7F
      E007C00FF11FFC7FE007C00FF39FFC7FC0038007FFFFFFFF80010003FFFFFFFF
      00000001FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object il12x12: TImageList
    Height = 12
    Width = 12
    Left = 184
    Top = 232
    Bitmap = {
      494C01010100050004000C000C00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000300000000C00000001002000000000000009
      0000000000000000000000000000000000000000000066B6E93766B7EA5166B7
      EA5066B7EA5166B7EA5166B7EA5166B7EA5166B7EA5066B7EA5166B7EA180000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000065B5E8AE65B6E9FF65B6
      E9FF65B6E9FF65B6E9FF65B6E9FF65B6E9FF65B6E9FF65B6E9FF65B6E9950000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B600001766B2E26E64B6E9FC65B6
      E9F765B6E9FB65B6E9FB65B6E9FB65B6E9FB65B6E9F865B6E9FC65B6E9CA0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000796B5E826AA4CA5164B7EBF865B5
      E8FE65B5E8FD65B6E9FE65B6E9FE65B6E9FE65B6E9FC65B6E9FF65B6E9F065B6
      E919000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000777675F27380884264B8EED665B6
      E8FE65B5E8FB65B6E9FD65B6E9FD65B6E9FD65B6E9FD65B6E9FA65B6E9FF64B5
      E85A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000076787AFF79706B5863BAF1AD65B4
      E6FF65B5E7FF65B5E7FF65B5E7FF65B5E7FF65B5E8FF65B5E7FF65B5E8FF65B5
      E8BF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000076797AFE786F6B9261C1FD5463BB
      F3D663BBF2D263BCF4D663BCF4D463BCF4D363BCF4D263BCF5D263BCF4D263B9
      F0E0000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000777777FE777776F276797B9C7779
      7B99767A7C9B767A7C98767A7C9F767A7CA377797B9F77797BA077797BA0767A
      7D2B000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000777777FB777777FC777676FF7777
      76FF777676FF777676FF777676FB777676E9777676E9777675EA777676D90000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000777777FF777777FF777777FF7777
      77FF777777FF777777CA78787817000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000757575487676764F7676764F7676
      764E767676507777771500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000300000000C0000000100010000000000600000000000000000000000
      000000000000000000000000FFFFFF0080100000000000008010000000000000
      0010000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000001000000000000001F0000000000000
      03F0000000000000FFF000000000000000000000000000000000000000000000
      000000000000}
  end
  object tmrTaskCheck: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = tmrTaskCheckTimer
    Left = 288
    Top = 96
  end
  object tmrIdleClose: TTimer
    Enabled = False
    Interval = 86400000
    OnTimer = tmrIdleCloseTimer
    Left = 288
    Top = 232
  end
  object ApplicationEvents: TApplicationEvents
    OnHint = ApplicationEventsHint
    Left = 288
    Top = 160
  end
  object AddictSpell: TAddictSpell
    ConfigStorage = csFile
    ConfigID = '%UserName%'
    ConfigFilename = '%AppDir%\Spell.cfg'
    ConfigRegistryKey = 'Software\Addictive Software\%AppName%'
    ConfigDictionaryDir.Strings = (
      '%AppDir%')
    ConfigAvailableOptions = [soLiveSpelling, soLiveCorrect, soUpcase, soNumbers, soHTML, soInternet, soQuoted, soAbbreviations, soPrimaryOnly, soRepeated, soDUalCaps]
    ConfigUseMSWordCustom = False
    ConfigDefaultMain.Strings = (
      'American.adm')
    ConfigDefaultCustom.Strings = (
      'Autocorrect.adu')
    ConfigDefaultActiveCustomPrevent.Strings = (
      'autocorrect.adu'
      'autocorrect-british.adu')
    ConfigDefaultActiveCustom = '%ConfigID%.adu'
    ConfigDefaultOptions = [soLiveSpelling, soLiveCorrect, soInternet, soAbbreviations, soRepeated, soDUalCaps]
    ConfigDefaultUseMSWordCustom = True
    SuggestionsAutoReplace = False
    SuggestionsLearning = True
    SuggestionsLearningDict = '%AppDir%\%UserName%_sp.adl'
    QuoteChars = '>'
    DialogInitialPos = ipLastUserPos
    DialogSelectionAvoid = saAvoid
    DialogShowImmediate = False
    DialogShowModal = False
    EndMessage = emExceptCancel
    EndCursorPosition = epOriginal
    EndMessageWordCount = False
    MaxUndo = -1
    MaxSuggestions = -1
    KeepDictionariesActive = True
    SynchronousCheck = True
    UseHourglassCursor = True
    CommandsVisible = [sdcIgnore, sdcIgnoreAll, sdcChange, sdcChangeAll, sdcAdd, sdcAutoCorrect, sdcUndo, sdcHelp, sdcCancel, sdcOptions, sdcCustomDictionary, sdcCustomDictionaries, sdcConfigOK, sdcAddedEdit, sdcAutoCorrectEdit, sdcExcludedEdit, sdcInternalEdit, sdcMainDictFolderBrowse, sdcResetDefaults, sdcConfigCancel]
    CommandsEnabled = [sdcIgnore, sdcIgnoreAll, sdcChange, sdcChangeAll, sdcAdd, sdcAutoCorrect, sdcUndo, sdcHelp, sdcCancel, sdcOptions, sdcCustomDictionary, sdcCustomDictionaries, sdcConfigOK, sdcAddedEdit, sdcAutoCorrectEdit, sdcExcludedEdit, sdcInternalEdit, sdcMainDictFolderBrowse, sdcResetDefaults, sdcConfigCancel, sdcConfigLearningLink, sdcConfigDownloadLink]
    PhoneticSuggestions = True
    PhoneticMaxDistance = 4
    PhoneticDivisor = 2
    PhoneticDepth = 1
    MappingAutoReplace = True
    UseExcludeWords = True
    UseAutoCorrectFirst = True
    RecheckReplacedWords = True
    ResumeFromLastPosition = True
    AllowedCases = cmInitialCapsOrUpcase
    UILanguage = ltRussian
    UIType = suiDialog
    UILanguageFontControls.Charset = DEFAULT_CHARSET
    UILanguageFontControls.Color = clWindowText
    UILanguageFontControls.Height = -13
    UILanguageFontControls.Name = 'Tahoma'
    UILanguageFontControls.Style = []
    UILanguageFontText.Charset = DEFAULT_CHARSET
    UILanguageFontText.Color = clWindowText
    UILanguageFontText.Height = -13
    UILanguageFontText.Name = 'Tahoma'
    UILanguageFontText.Style = []
    UILanguageUseFonts = False
    ParentFont = False
    DialogTypeSpelling = sdOffice
    DialogTypeConfiguration = sdOffice
    DialogMisspelledWordColor = clRed
    DialogMisspelledWordStyle = [fsBold]
    URLDownloadDictionaries = 'https://extensions.libreoffice.org/ru/?Tags%5B%5D=50'
    URLEditDictionaries = 
      'http://www.addictivesoftware.com/ed-dictionaries.htm?app=%AppNam' +
      'e%'
    DoubleBuffered = False
    TimingWindow = 800
    TimingBadTimeCount = 2
    TimingNoActivityRestart = 1600
    TimingCutoff = 300
    Left = 184
    Top = 304
  end
  object highDPIImageListContainer: TImageList
    Left = 416
    Top = 96
  end
  object printGridEh: TPrintDBGridEh
    Options = []
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'Tahoma'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'Tahoma'
    PageHeader.Font.Style = []
    Units = MM
    Left = 288
    Top = 304
  end
end
