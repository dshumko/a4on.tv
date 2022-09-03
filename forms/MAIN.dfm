object A4MainForm: TA4MainForm
  Left = 320
  Top = 200
  Caption = 'A4ON.TV'
  ClientHeight = 421
  ClientWidth = 1013
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
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = True
  WindowState = wsMaximized
  WindowMenu = Window1
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object mdchldbr1: TMDIChildBar
    Left = 0
    Top = 376
    Width = 1013
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
    Width = 1013
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
      Left = 872
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
      Width = 135
      Height = 25
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      OnResize = pnlSearchResize
      DesignSize = (
        135
        25)
      object btnSearchCustomer: TSpeedButton
        Left = 106
        Top = 2
        Width = 23
        Height = 23
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
        Top = 3
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
          #1048#1053#1053'/'#1059#1053#1053' ('#1070')')
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
          '15')
        ParentCtl3D = False
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnChange = cbSearchTypeChange
      end
      object edtSearch: TDBEditEh
        Left = 53
        Top = 3
        Width = 51
        Height = 19
        Hint = 
          '(F11) '#1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072'. '#1089#1090#1088#1086#1082#1072' '#1083' 1234  '#1073#1091#1076#1077#1090' '#1085#1072#1081#1076#1077#1085' '#1072#1073#1086#1085 +
          #1077#1085#1090' '#1089' '#1083#1080#1094#1077#1074#1099#1084' 1234'#13#10#1090' 223344 - '#1073#1091#1076#1077#1090' '#1085#1072#1081#1076#1077#1085' '#1072#1073#1086#1085#1077#1085#1090' '#1089' '#1090#1077#1083#1077#1092#1086#1085#1086#1084' ' +
          '223344. '#1042#1057#1045' - '#1089#1073#1088#1086#1089' '#1092#1080#1083#1100#1090#1088#1072
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
    Top = 402
    Width = 1013
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
      Caption = #1055#1077#1095#1072#1090#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
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
      Caption = #1054#1073#1088#1072#1097#1077#1085#1080#1103
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
  end
  object ICONS_ACTIVE: TImageList
    ColorDepth = cd32Bit
    Left = 77
    Top = 96
    Bitmap = {
      494C010165006900040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000A0010000010020000000000000A0
      0100000000000000000000000000000000007C9E4CFE7C9E4CFE7C9E4CFE7C9E
      4CFE3B49287F6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE3B48
      297F7C9E4CFE7C9E4CFE7C9E4CFE7C9E4CFE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007C9E4CFE7C9E4CFE7C9E4CFE7C9E
      4CFE3B49287F6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE3B48
      297F7C9E4CFE7C9E4CFE7C9E4CFE7C9E4CFE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006F6C6BFE6F6C6BFE00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000383C307F383C307F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007C9E4CFE7C9E4CFE00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007C9E4CFE7C9E4CFE00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003B472A7F3B47297F00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000676463EE6F6C6BFE6F6C6BFE6F6C
      6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C
      6BFE6F6C6BFE6F6C6BFE6F6C6BFE676463EE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6C6BFEFCFCFCFEFCFCFCFEFCFC
      FCFEFCFCFCFEFCFCFCFEFCFCFCFEFCFCFCFEFCFCFCFEFCFCFCFEFCFCFCFEFCFC
      FCFEFCFCFCFEFCFCFCFEFCFCFCFE6D6A69FD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6C6BFED2D1D1FDACABAAFDA4A3
      A2FDD2D1D1FD595756FED2D1D1FDACABAAFDA4A3A2FDD2D1D1FD595756FED2D1
      D1FDACABAAFDA4A3A2FDD2D1D1FD6D6A69FD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6C6BFEFCFCFCFE8D8C8BFD8887
      86FDFAFAFAFDFBFBFBFDFBFBFBFD8D8C8BFD888786FDFAFAFAFDFBFBFBFDFBFB
      FBFD8D8C8BFD888786FDFAFAFAFD6D6A69FD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6C6BFEFCFCFCFE8E8D8CFD9593
      93FDFBFBFBFDFBFBFBFDFBFBFBFD8E8D8CFD959393FDFBFBFBFDFBFBFBFDFBFB
      FBFD8E8D8CFD959393FDFCFCFCFE6D6A69FD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6C6BFED8D8D8FD9D9B9BFDA5A4
      A4FDD9D9D9FDFBFBFBFDD8D8D8FD9D9B9BFDA5A4A4FDD9D9D9FDFBFBFBFDD8D8
      D8FD9D9B9BFDA5A4A4FDD9D9D9FD6D6A69FD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6C6BFEFCFCFCFEFCFCFCFEFCFC
      FCFEFCFCFCFEFCFCFCFEFCFCFCFEFCFCFCFEFCFCFCFEFCFCFCFEFCFCFCFEFCFC
      FCFEFCFCFCFEFCFCFCFEFCFCFCFE6D6A69FD0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000666363ED6F6C6BFE6F6C6BFE6F6C
      6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C
      6BFE6F6C6BFE6F6C6BFE6F6C6BFE666363ED0000000000000000000000000000
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
      000000000000000000000000000000000000B4783DFF6C48249A010000010000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001F3A4A5162B4E7FD63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B5E8FE26475B64000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000067452393B4783DFF6C48249A0100
      0001000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003059727D63B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF3665808D000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      0000800000008000000080000000800000000100000167452393B4783DFF6C48
      249A010000010000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000003969859363B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF3E7292A0000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000000000000100000167452393B478
      3DFF6C48249A0100000100000000000000000000000000000000000000000000
      000000000000000000000000000000000000427999A963B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF457FA4B3000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000000000010000016947
      2495B4783DFF6947249501000001050201070302010400000000000000000000
      0000000000000000000000000000000000004B89AEC063B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF4D8DB4C6000000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000100
      000169472495B4783DFF936233D0B2773DFCAD743BF6714B26A00A07030E0000
      0000000000000000000000000000000000005398C3D763B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF549BC6D9000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000000000000000000000
      000001000001936233D0B4783DFFB4783DFFB4783DFFB4783DFF714B26A00000
      0000000000000000000000000000000000005CA9D8ED63B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF5BA7D6EB000000000000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      000005020107B2773DFCB4783DFFB4783DFFB4783DFFB4783DFFAD743BF60401
      00050000000000000000000000000000000059A3D1E563B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6E9FF63B6
      E9FF63B6E9FF63B6E9FF57A0CDE1000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF000000000000000000FFFF
      FF00800000008000000080000000800000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF000000000000000000FFFF
      FF00800000008000000080000000800000000000000000000000000000000000
      000005020107B2773DFCB4783DFFB4783DFFB4783DFFB4783DFFB1763CFB0502
      01070000000000000000000000000000000000000000163E5088163E5088163E
      5088163E5088163E5088163E5088163E5088163E5088163E5088163E5088163E
      5088163E5088163D4F8700000000000000000000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000000000000000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000000000000000000000000000000000000000
      000001000001936233D0B4783DFFB4783DFFB4783DFFB4783DFF936233D00100
      000100000000000000000000000000000000000000002B7596FF2B7596FF2B75
      96FF2B7596FF2B7596FF2B7596FF2B7596FF2B7596FF2B7596FF2B7596FF2B75
      96FF2B7596FF2B7495FD00000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000000000000000000000000000000000000000000000100
      000169472495B4783DFF936233D0B2773DFCB2773DFC936233D0B4783DFF6947
      249501000001000000000000000000000000000000002B7596FF2B7596FF2B75
      96FF2B7596FF2B7596FF2B7596FF1E5269B31436467714364677143646771436
      467714364677102B386000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000010000016947
      2495B4783DFF694724950100000105020107050201070100000169472495B478
      3DFF6947249501000001000000000000000000000000286987E52B7596FF2B75
      96FF2B7596FF2B7494FC18425590000001010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000100000167452393B478
      3DFF6C48249A0101000200000000000000000000000000000000010000016745
      2393B4783DFF6C48249A01000001000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003A4B23777DA14DFF7DA14DFF7DA14DFF0000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000100000167452393B4783DFF6C48
      249A010100020000000000000000000000000000000000000000000000000100
      000167452393B4783DFF6C48249A010000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000212C1545759648EE7DA14DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000067452393B4783DFF6C48249A0101
      0002000000000000000000000000000000000000000000000000000000000000
      00000100000167452393B4783DFF6C48249A0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000027331851729146E8212A13427DA14DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B4783DFF6C48249A010100020000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000100000167452393B4783DFF0000000000000000000000000000
      0000000000000000000000000000000000000A0F07177DA14DFF7DA14DFF7DA1
      4DFF688640D4141B0C2B000000003F51278000000000040301073A2613540000
      0000000000000000000000000000000000000000000000000000000000000000
      00001D1D1D3F212121470000000000000000B1763BFFB1763BFFB1763BFFB176
      3BFFB1763BFFB1763BFFB1763BFFB1763BFFB1763BFFB1763BFFB1763BFFB176
      3BFFB1763BFFB1763BFFB1763BFFB1763BFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000503010882562BBBB0763CFD3423
      114C000000000000000000000000000000000000000000000000000000002323
      234D606060D0666666DD2626265300000000B0743AFFEBE0D4FFEBE0D4FFEBE0
      D4FFEBE0D4FFB0743AFFEBE0D4FFEBE0D4FFEBE0D4FFEBE0D4FFEBE0D4FFB074
      3AFFECE1D5FFE8DFD6FFDADAE6FF2F49CAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000006C48249CB1773CFEB1773CFEA770
      38F12F1F104500000000000000000000000000000000000000001F1F1F457272
      72F636363676434343914242428E00000000B0743AFFEBE0D4FFEBE0D4FFEBE0
      D4FFEBE0D4FFB0743AFFEBE0D4FFEBE0D4FFEBE0D4FFEBE0D4FFEBE0D4FFB074
      3AFFE2DDDDFFD4D7EDFFD2D7F0FF2F49CAFF0000000000000000000000000000
      0000000000000000000000000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000432C1661AB7239F6B1773CFEB177
      3CFEAC733AF8302010460000000000000000000000001C1C1C3E717171F47777
      77FE777777FE555555B90303030800000000B1763BFFB1763BFFB1763BFFB176
      3BFFB1763BFFB1763BFFB1763BFFB1763BFFB1763BFFB1763BFFB1763BFFB074
      3AFF2F49CAFF2F49CAFF2F49CAFF2F49CAFF0000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000086868600008080008686
      8600008080008686860080000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF0080000000000000002B1D0E3FAB7239F6B177
      3CFEB1773CFEA46E37ED0705020B0000000019191937707070F1777777FE7777
      77FE565656BB040404090000000000000000767676FFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFF2F49
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2F49CAFF0000000000000000000000000000
      000000000000000000000000000080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000808000868686000080
      8000868686000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000442E1763AF75
      3BFCB1773CFE957453FA18171532161616316E6E6EED777777FE777777FE5858
      58BE0404040A000000000000000000000000767676FFFCFCFCFFFCFCFCFFE9E9
      E9FF939190FFEAEAEAFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFF2F49
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2F49CAFF0000000000000000000000000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000086868600008080008686
      8600008080008686860080000000FFFFFF00000000000000000000000000FFFF
      FF00800000008000000080000000800000000000000000000000000000003926
      1352725537B7535352B3161616306C6C6CEA777777FE777777FE595959C00505
      050B00000000000000000000000000000000767676FFFCFCFCFFEDEDEDFF817E
      7CFF6E6B6AFF827E7CFFEEEEEEFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFF2F49
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2F49CAFF0000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00800000000000000000808000868686000080
      8000868686000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000000000000000000000000000000000000000
      000000000000131212296A6A6AE6777777FE777777FE5A5A5AC30505050C0000
      000000000000000000000000000000000000767676FFFCFCFCFFD7D6D5FFBEBD
      BCFF6F6C6BFFBDBCBCFFD8D7D7FFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFF2F49
      CAFF2F49CAFF2F49CAFF2F49CAFF2F49CAFF0000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000086868600008080008686
      8600008080008686860080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008000000080000000000000000000000000000000000000021E1E1E412A2A
      2A5C20202046686868E1777777FE777777FE5B5B5BC50606060E000000000000
      0000000000013C3C3C831111112700000000767676FFFCFCFCFFF8F8F8FFF9F9
      F9FF6F6C6BFFFBFBFBFFF8F8F8FFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFF2F49
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2F49CAFF0000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF000000000000000000FFFF
      FF00800000008000000080000000800000000000000000808000868686000080
      8000868686000080800080000000800000008000000080000000800000008000
      00008000000000000000000000000000000003030307595959C0777777FE7777
      77FE777777FE777777FE777777FE5C5C5CC71313132A5D5D5DC91414142C0000
      00003838387A777777FE696969E30F0F0F22767676FFFCFCFCFFFCFCFCFFF9F9
      F9FF6F6C6BFFFBFBFBFFFAFAFAFFDCDBDBFFEEEEEEFFFCFCFCFFFBFBFBFF2F49
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2F49CAFF0000000000000000FFFFFF000000
      000000000000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000000000000000000086868600008080008686
      8600008080008686860000808000868686000080800086868600008080008686
      86000080800000000000000000000000000036363676777777FE777777FE6868
      68E1777777FE777777FE606060CF0606060F3A3A3A7E777777FE6A6A6AE64B4B
      4BA25D5D5DC9777777FE777777FE646464D9767676FFFCFCFCFFFCFCFCFFFAFA
      FAFF777474FFE0DFDFFFFBFBFBFFC2C1C0FF807B7AFFE8E7E7FFFBFBFBFF2F49
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2F49CAFF0000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0080000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000000000000000000000000000000808000868686000000
      0000000000000000000000000000000000000000000000000000000000008686
      8600868686000000000000000000000000005F5F5FCD777777FE3C3C3C820000
      00004848489C777777FE555555B700000000000000014A4A4AA1757575FD7777
      77FE767676FE767676FE717171F528282858767676FFFCFCFCFFFCFCFCFFFCFC
      FCFFCAC9C9FF767372FF73706FFF73706FFF6E6B6AFF8A8887FFFAFAFAFF2F49
      CAFF2F49CAFF2F49CAFF2F49CAFF2F49CAFF0000000000000000FFFFFF000000
      000000000000FFFFFF0000000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000086868600868686000000
      0000000000000000000000000000000000000000000000000000000000008686
      860000808000000000000000000000000000696969E43F3F3F8A000000000000
      00003333336F777777FE616161D1000000000000000018181836737373F87777
      77FE777777FE707070F20505050C00000000767676FFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFF9F9F9FFF5F5F5FFC6C5C5FF797776FFE1E1E0FFFBFBFBFF2F49
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2F49CAFF0000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000868686000080
      80000000000000FFFF00000000000000000000FFFF0000000000868686000080
      8000868686000000000000000000000000002A2A2A5C00000000000000001F1F
      1F45727272F6777777FE4A4A4AA000000000000000001F1F1F45727272F67777
      77FE767676FD373737770000000000000000767676FFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFAFAFAFFD3D2D1FFE8E7E7FFFCFCFCFFFBFBFBFF2F49
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2F49CAFF0000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001D1D1D3F7171
      71F4777777FE616161D10B0B0B1A212121484040408A737373F8777777FE7575
      75FD3A3A3A7E000000000000000000000000767676FFFCFCFCFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFBFBFBFF2F49
      CAFFD2D7F0FFD2D7F0FFD2D7F0FF2F49CAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000343434723F3F
      3F89272727560202020500000000101010232E2E2E653C3C3C833A3A3A7D1C1C
      1C3E00000000000000000000000000000000767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF767676FF767676FF767676FF747474FF2F49
      CAFF2F49CAFF2F49CAFF2F49CAFF2F49CAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000504E4DB96D6A69FD6F6C
      6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C
      6BFE6F6C6BFE6D6A69FD504E4DB9000000000000000000000000000000000000
      0000000000000000000000000000000000000E11071C465A2B914E6330A2313F
      1E670607030C0000000000000000000000000000000000000000B2773DFEB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFF000000000000000000000000808000FF808000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006D6A69FDFAFAFAFDFBFB
      FBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDF9F9F9FCF7F6F9FCFBFB
      FBFDFBFBFBFDFAFAFAFD6E6B6AFD000000004F4F4FAC757575FC767676FD7676
      76FD767676FD767676FD121212283646217143562A8C40532786475C2B943849
      2376363E2C743A3B387F13180C29000000000000000000000000B1763DFDB377
      3DFFB3773DFFB3773DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3773DFFB377
      3DFFB3773DFFB3773DFF000000000000000000000000808000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006F6C6BFEFBFBFBFDC3BE
      BBFDDAD8D6FDEAE9E8FDFBFBFBFDFBFBFBFDDEDCF6FCD8D5F5FCDDDBF6FCD7D4
      F5FCF4F3F9FCFBFBFBFD6F6C6BFE00000000767676FCF8F8F8FCFAFAFAFCFAFA
      FAFCFAFAFAFCFAFAFAFC0B0B0B0B36472172495F2E993545206F394A2277384A
      2277434D3790575954BD364323714B612D9D0000000000000000B3773DFFB377
      3DFFB3773DFFB3773DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3773DFFB377
      3DFFB3773DFFB3773DFF00000000000000000000000000000000000000008080
      00FF808000FF808000FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006F6C6BFEFBFBFBFDF2F1
      F1FD9F9792FD98908AFDB3ADA9FDA7A0A9FDB4AEC8FCD6D3E0FCD2CEEBFCF5F4
      F9FCD9D7F5FCFBFBFBFD6F6C6BFE00000000767676FDFAFAFAFCA5805AFDA580
      5AFDA5805AFDA5805AFD0706030B34441F6D475C2B9437482274313F1D66465B
      2B93434D3790585A56BF3F502A85465A2B920000000000000000B3773DFFB276
      3CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB276
      3CFFB2763CFFB3773DFF00000000000000000000000000000000000000008080
      00FF808000FF808000FF808000FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000006F6C6BFEFBFBFBFDE5E3
      E2FDCDC9C7FCE5E3E2FCEFEEEDFCC0BCD9FCC1BCC4FBB5AFD1FB9C94B5FCE6E4
      F5FCDDDAF6FCFBFBFBFD6F6C6BFE00000000767676FDFAFAFAFCA5805AFDF6E6
      C9FDF6E6C9FDA47F59FC080706083C4D247D3D4F257F749548F07A9E4BFD4A5F
      2F9C373A33795A5A57C044582D90364621730000000000000000B2763CFFB276
      3CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB276
      3CFFB2763CFFB3773DFF00000000000000000000000000000000000000008080
      00FF808000FF808000FF808000FF808000FF0000000000000000000000000000
      000000000000000000000000000000000000000000006F6C6BFEFBFBFBFDFBFB
      FBFDE8E6E5FDCCC8C5FDD1CECCFDE4E2F7FCE5E3F7FCD5D2F5FCD5D2F5FCDFDD
      F6FCDAD7F5FCFBFBFBFD6F6C6BFE00000000767676FDFAFAFAFCA5805AFDF6E6
      C9FDF6E6C9FDA47F59FC12100D124358298E7A9D4AFC749548F1455232925154
      4DB15F605BCD4856379A495E2D98303E1E640301000500000000B2763CFFB276
      3CFFFFFFFFFFFFFFFFFFB2763CFFFFFFFFFFFFFFFFFFB2763CFFFFFFFFFFFFFF
      FFFFB2763CFFB3773DFF00000000000000000000000000000000000000000000
      0000808000FF808000FF808000FF808000FF808000FF00000000000000000000
      000000000000000000000000000000000000000000006F6C6BFEFBFBFBFDFBFB
      FBFDFBFBFBFDFBFBFBFDFBFBFBFDF9F9F9FCD4D0F5FCE3E1F7FCE8E6F7FCD8D5
      F5FCECEBF8FCFBFBFBFD6F6C6BFE00000000767676FDFAFAFAFCA5805AFDA580
      5AFDA5805AFDA5805AFD72593EAF1D170F2D11170A2521271B49646464D9464E
      3C9660783DC77C9E4CFE709045E92D3B1C600000000000000000B2763CFFB276
      3CFFFFFFFFFFFFFFFFFFB2763CFFFFFFFFFFFFFFFFFFB2763CFFFFFFFFFFFFFF
      FFFFB2763CFFB2763CFF00000000000000000000000000000000000000000000
      000000000000808000FF808000FF808000FF808000FF808000FF000000000000
      000000000000000000000000000000000000000000006F6C6BFEFBFBFBFDFBFB
      FBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDECEBF8FCE5E4F7FCF6F6
      F9FCFBFBFBFDFBFBFBFD6F6C6BFE00000000767676FDFAFAFAFCFAFAFAFCFAFA
      FAFCFAFAFAFCA5805AFDF6E6C9FDF5E5C8FC7D6145C0443F3846030302032C3A
      1B5E607B3BC7475C2B940A0C0614000000000000000000000000B2763CFFB276
      3CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB276
      3CFFB2763CFFB2763CFF00000000000000000000000000000000000000000000
      00000000000000000000808000FF808000FF808000FF808000FF808000FF0000
      000000000000000000000000000000000000000000006F6C6BFEF9F9F9FCB8B7
      B7FDB2B1B1FEB2B1B1FEB2B1B1FEB2B1B1FEB2B1B1FEB2B1B1FEB2B1B1FEB2B1
      B1FEB9B8B8FDFBFBFBFD6F6C6BFE00000000767676FDFAFAFAFCFAFAFAFCFAFA
      FAFCFAFAFAFCA5805AFDF6E6C9FDF6E6C9FDA47F59FCF6E6C9FDDFD1B7E68079
      698518140E2741414143616161D1000000000000000000000000B2763CFFB276
      3CFFFFFFFFFFFFFFFFFFB2763CFFFFFFFFFFFFFFFFFFB2763CFFFFFFFFFFFFFF
      FFFFB2763CFFB2763CFF00000000000000000000000000000000000000000000
      0000000000000000000000000000808000FF808000FF808000FF808000FF8080
      00FF00000000000000000000000000000000000000006F6C6BFEFBFBFBFDFBFB
      FBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFB
      FBFDFBFBFBFDFBFBFBFD6F6C6BFE00000000767676FDFAFAFAFCFAFAFAFCFAFA
      FAFCFAFAFAFCA5805AFDA5805AFDA5805AFDA5805AFDA5805AFDA5805AFDA580
      5AFDA5805AFDF9F9F9FB767676FD000000000000000000000000B2763CFFB276
      3CFFFFFFFFFFFFFFFFFFB2763CFFFFFFFFFFFFFFFFFFB2763CFFFFFFFFFFFFFF
      FFFFB2763CFFB2763CFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000808000FF808000FF808000FF8080
      00FF808000FF000000000000000000000000000000006F6C6BFEF9F9F9FCB8B7
      B7FDB2B1B1FEB2B1B1FEB2B1B1FEB2B1B1FEB9B8B8FDFBFBFBFDFBFBFBFDFBFB
      FBFDFBFBFBFDFBFBFBFD6F6C6BFE00000000767676FDFAFAFAFCFAFAFAFCFAFA
      FAFCFAFAFAFCFAFAFAFCFAFAFAFCFAFAFAFCFAFAFAFCFAFAFAFCFAFAFAFCFAFA
      FAFCFAFAFAFCFAFAFAFC767676FD000000000000000000000000B2763CFFB276
      3CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB276
      3CFFB2763CFFB2763CFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000808000FF808000FF8080
      00FF808000FF808000FF0000000000000000000000006F6C6BFEFBFBFBFDFBFB
      FBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFD928F8FFD6F6C
      6BFE6F6C6BFE6F6C6BFE676463EE00000000B0763CFDB0763CFDB0763CFDB076
      3CFDB0763CFDB0763CFDB0763CFDB0763CFDB0763CFDB0763CFDB0763CFDB076
      3CFDB0763CFDB0763CFDB0763CFD000000000000000000000000B2763CFFB276
      3CFFFFFFFFFFFFFFFFFFB2763CFFFFFFFFFFFFFFFFFFB2763CFFFFFFFFFFFFFF
      FFFFB2763CFFB2763CFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808000FF8080
      00FF00000000000000000000000000000000000000006F6C6BFEF9F9F9FC8484
      84FD777777FE777777FE777777FE777777FE868686FDFBFBFBFD6F6C6BFEF9F9
      F9FCE8E7E7FD7E7B7AFC2A28286100000000B0763CFDB0763CFDB0763CFDB076
      3CFDB0763CFDB0763CFDB0763CFDB0763CFDB0763CFDB0763CFDB0763CFDB076
      3CFDB0763CFDB0763CFDB0763CFD000000000000000000000000B2763CFFB276
      3CFFFFFFFFFFFFFFFFFFB2763CFFFFFFFFFFFFFFFFFFB2763CFFFFFFFFFFFFFF
      FFFFB2763CFFB2763CFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      00FF00000000808000FF808000FF00000000000000006F6C6BFEFBFBFBFDFBFB
      FBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFD6F6C6BFEE8E8
      E8FD7E7C7BFC2C2B2A660000000000000000AF743AFBB0763CFD000000007676
      76FD00000000B0763CFDB0763CFDB0763CFDB0763CFDB0763CFD000000007676
      76FD00000000B0763CFDAF743AFB000000000000000000000000B2763CFFB276
      3CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB2763CFFB276
      3CFFB2763CFFB2763CFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000808000FF808000FF00000000000000006E6B6AFDFAFAFAFDFBFB
      FBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFDFBFBFBFD6F6C6BFE7E7C
      7BFC2C2B2B670000000000000000000000006F4B26A0AF743AFB000000007676
      76FD00000000B0763CFDB0763CFDB0763CFDB0763CFDB0763CFD000000007676
      76FD00000000AF743AFB6F4B26A0000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000504E4DB96D6A69FD6F6C
      6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE6F6C6BFE676463EF2B2A
      2964000000000000000000000000000000000000000000000000000000007676
      76FD000000000000000000000000000000000000000000000000000000007676
      76FD000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007A8BD3FF000000000000
      000000000000000000007989D2FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000707071100000001000000000000000084AB
      4AFD85AD4AFF0303000500000000000000000000000000000000000000000000
      0000000000000000000000000000000000007989D4FF1430C5FF1430C5FF0000
      0000000000001430C5FF1430C5FF7A8AD2FF0000000000000000BDD4E3FF8FC4
      E5FF6DB8E7FF5EB3E8FF5DB3E9FF5DB3E8FF6CB8E8FF8CC3E6FFB8D2E3FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BDD4E3FF8FC4E5FF6DB8E7FF5EB3E8FF5DB3E9FF5DB3E8FF6CB8
      E8FF8CC3E6FFB8D2E3FF00000000000000000000000000000000000000000000
      00000000000012121228656565D8777777FF696969E21A1A1A390000000084AB
      4AFD85AD4AFF03030005000000000000000000000000808080FF747474FF7474
      74FF747474FF747474FF747474FFAEAEAEFF000000001430C5FF1430C5FF243E
      C7FF2B44C8FF1430C5FF1430C5FF00000000000000005DB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3
      E9FF000000000000000000000000000000000000000000000000000000000000
      00005DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF5DB3E9FF000000000000000000000000000000000000
      00000000000046484899666769DC1A1A1A3901010102010101020000000084AB
      4AFD85AD4AFF03030005000000000000000000000000747474FF747474FF7474
      74FF747474FF747474FF747474FF757575FFB9B9B9FF000000002D45C8FF1430
      C5FF1430C5FF2E46C8FF000000000000000061B7EDFF5DB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF79BDE7FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000078BCE7FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF5DB3E9FF5EB3E8FF000000000000000004090B0C1221
      2A2F1C334049253C4A5C2A4352670303000585AD4AFF85AD4AFF85AD4AFF85AD
      4AFF85AD4AFF85AD4AFF85AD4AFF85AD4AFF00000000747474FF747474FF7474
      74FF747474FF747474FF747474FF757575FFB9B9B9FF000000002A43C8FF1430
      C5FF1430C5FF243EC7FF00000000000000005FB7EEFF5DB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF9CC9E5FF00000000AB518DFFAB51
      8DFFAB518DFF000000000000000000000000000000000000000085AD4AFF85AD
      4AFF85AD4AFF000000007DBEE6FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF2E546A75569BC8DA65B6E9FE65B7
      EAFF65B7EAFF65B7EAFF63B3E5FA0303000585AD4AFF85AD4AFF85AD4AFF85AD
      4AFF85AD4AFF85AD4AFF85AD4AFF85AD4AFF00000000747474FF747474FF7474
      74FF747474FF747474FF747474FFAFAFAFFF000000001430C5FF1430C5FF2D45
      C8FF2B44C8FF1430C5FF1430C5FF000000005FB7EEFF5DB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF5DB3E9FF75BBE7FF86C1E6FF0000000000000000AB51
      8DFFAB518DFFAB518DFF000000000000000000000000000000000000000085AD
      4AFF85AD4AFF85AD4AFF0000000082BFE6FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF1F3A4A5164B5E8FD65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF65B7EAFF1B323F4500020303000203030001010184AB
      4AFD85AD4AFF03030005000101010000000000000000747474FF747474FF7474
      74FF747474FF0000000000000000000000007586D4FF1430C5FF1430C5FF0000
      0000000000001430C5FF1430C5FF7C8CD3FF5FB7EEFF5DB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF9AC8E5FF000000000000000000000000000000000000
      0000AB518DFFAB518DFFAB518DFF000000000000000000000000000000000000
      000085AD4AFF85AD4AFF85AD4AFF0000000085C0E6FF5DB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF000000003159717C65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF0104050584AB
      4AFD85AD4AFF03030005000000000000000000000000747474FF747474FF7474
      74FF747474FF00000000B47234FFB77B42FF000000007687D4FF00000000B9B9
      B9FFB9B9B9FF000000007989D4FF000000005FB7EEFF5DB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FFB7D2E3FFAE5290FFAE5290FFAC528EFFAB518DFFAB51
      8DFFAB518DFFAB518DFFAB518DFFAB518DFF87B04BFF87B04BFF85AD4AFF85AD
      4AFF85AD4AFF85AD4AFF85AD4AFF85AD4AFF000000006EB9E7FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF00000000010102024F90B7C965B7
      EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF0104050584AB
      4AFD85AD4AFF0303000500000000000000000000000000000000000000000000
      00000000000000000000B47234FFB47234FFB77B42FF00000000000000000000
      0000000000000000000000000000000000005FB7EEFF5DB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FFB6D2E3FFAB518DFFAB518DFFAB518DFFAB518DFFAB51
      8DFFAB518DFFAB518DFFAB518DFFAB518DFF85AD4AFF85AD4AFF85AD4AFF85AD
      4AFF85AD4AFF85AD4AFF85AD4AFF85AD4AFF0000000070B9E7FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF00000000000000001F39474F65B7
      EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF1D35434A0002
      030300010101000000000000000000000000747474FF747474FF747474FF7474
      74FF747474FF0000000000000000000000000000000000000000747474FF7474
      74FF747474FF747474FF747474FF000000005FB7EEFF5DB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF97C6E5FF000000000000000000000000000000000000
      0000AB518DFFAB518DFFAB518DFF000000000000000000000000000000000000
      000085AD4AFF85AD4AFF85AD4AFF0000000089C2E6FF5CB2E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF00000000000000000307090A64B5
      E7FC65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7
      EAFF111F282D000000000000000000000000747474FF747474FF747474FF7474
      74FF747474FF747474FF747474FF747474FF747474FF747474FF747474FF7474
      74FF747474FF747474FF747474FF000000005FB7EEFF56B0E8FF4EACE7FF48A9
      E6FF44A7E5FF41A6E5FF49A8E5FF5AAFE4FF6BB5E3FF0000000000000000AB51
      8DFFAB518DFFAB518DFF000000000000000000000000000000000000000085AD
      4AFF85AD4AFF85AD4AFF0000000070B7E3FF41A6E5FF49A8E5FF41A6E5FF44A7
      E5FF48A9E6FF4DABE6FF56AFE8FF5DB3E9FF0000000000000000000000005EAB
      DAEE65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B6
      E9FE02050607000000000000000000000000747474FF747474FF747474FF7474
      74FF747474FF747474FF747474FF747474FF747474FF747474FF747474FF7474
      74FF747474FF747474FF747474FF0000000045AAEAFF7DC0ECFFCDE7F8FFFEFE
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2FF00000000AB518DFFAB51
      8DFFAB518DFF000000000000000000000000000000000000000085AD4AFF85AD
      4AFF85AD4AFF00000000F6F6F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFD1E8F9FF81C2ECFF41A6E5FF0000000000000000000000004E8E
      B5C665B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF589E
      CADD00000000000000000000000000000000828282FF767676FF747474FF7676
      76FF767676FF767676FF767676FF767676FF767676FF767676FF767676FF7676
      76FF767676FF747474FF848484FF00000000F3FBFFFFFEFFFFFFA7D5F1FF73BD
      EBFF53AEE6FF40A5E5FF42A6E5FF40A5E5FF6AB6E5FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B2D7EDFF73BDEBFF53AEE6FF40A5E5FF42A6E5FF40A5E5FF52AE
      E6FF73BDEBFFA6D5F0FFFBFDFFFFF5FAFDFF000000000000000000000000213D
      4E5565B6E9FE65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF2A4D
      626B00000000000000000000000000000000000000000000000000000000B4B4
      B4FF00000000000000000000000000000000000000000000000000000000BBBB
      BBFF000000000000000000000000000000009DD4F5FF40A5E5FF51ADE7FF57B0
      E8FF5BB2E8FF5DB3E9FF5DB3E9FF5DB3E9FF5BB2E8FF57B0E8FF51ADE7FF41A5
      E5FF91CCEFFF0000000000000000000000000000000000000000000000009DD4
      F5FF40A5E5FF51ADE7FF57B0E8FF5BB2E8FF5DB3E9FF5DB3E9FF5DB3E9FF5BB2
      E8FF57B0E8FF51ADE7FF41A5E5FF91CCEFFF0000000000000000000000000000
      00002E546A7563B3E5FA65B7EAFF65B7EAFF65B7EAFF64B5E8FD35627C880000
      0000000000000000000000000000000000000000000000000000000000007474
      74FFABABABFF0000000000000000000000000000000000000000ABABABFF7474
      74FF0000000000000000000000000000000067B7EAFF5CB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3
      E9FF5EB2E6FF00000000000000000000000000000000000000000000000067B7
      EAFF5CB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3E9FF5DB3
      E9FF5DB3E9FF5DB3E9FF5DB3E9FF5EB2E6FF0000000000000000000000000000
      0000000000000C171E215AA3D1E465B7EAFF65B7EAFF172C373D000000000000
      000000000000000000000000000000000000000000000000000000000000B0B0
      B0FF747474FF747474FF747474FF747474FF747474FF747474FF747474FFB0B0
      B0FF0000000000000000000000000000000000000000000000009EC9E5FF82BF
      E6FF70B9E7FF65B6E8FF63B5E8FF65B6E8FF70B9E7FF82BFE6FF9DC9E5FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009EC9E5FF82BFE6FF70B9E7FF65B6E8FF63B5E8FF65B6E8FF70B9
      E7FF82BFE6FF9DC9E5FF00000000000000000000000000000000000000000000
      000000000000000000002F566F7964B5E8FD4A86ACBB00010101000000000000
      000000000000000000000000000000000000959595FF686868FF686868FF6868
      68FF686868FF686868FF686868FF686868FF686868FF686868FF686868FF6868
      68FF686868FF686868FF686868FF949494FF0000000000000000CAAD90FFA966
      25FFC29C77FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000085AD
      4BFF85AD4AFF0000000000000000000000000000000000000000000000000000
      000000000000A96728FFCDB59EFF000000000000000000000000000000000000
      000000000000000000000000000000000000686868FFFEFEFEFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FF00000000B88652FFF9F7F5FFA25C
      15FFAB6828FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000085AD
      4BFF85AD4AFF0000000000000000000000000000000000000000000000000000
      000000000000CFBAA5FFAB6828FFA96728FF0000000000000000000000000000
      000000000000000000000000000000000000686868FFFEFEFEFFFEFEFEFF9D9D
      9DFF999999FF999999FF999999FF999999FF999999FF999999FF999999FF9999
      99FF9D9D9DFFFFFFFFFFFFFFFFFF686868FFC7A88AFFA6601DFFDCC1A8FFCCA6
      7EFFA86321FFB98A5BFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000808080FF767676FF7676
      76FF767676FF767676FF767676FFC4C4C4FF00000000000000000000000085AD
      4BFF85AD4AFF00000000000000000000000000000000808080FF747474FF7474
      74FFB2B2B2FF00000000A96728FF0000000000000000A96728FF00000000B6B6
      B6FF747474FF808080FF0000000000000000686868FFFEFEFEFFFEFEFEFF9999
      99FFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFF
      FFFF999999FFFFFFFFFFFFFFFFFF686868FFB0743AFFAA6828FFA6611EFFFDFE
      FDFFA6611EFFAA6828FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000767676FF767676FF7676
      76FF767676FF767676FF787878FF0000000085AD4AFF85AD4AFF85AD4AFF85AD
      4AFF85AD4AFF85AD4AFF85AD4AFF85AD4AFF00000000747474FF747474FF7474
      74FF838383FF000000000000000000000000AB6828FFAC6C2EFFA96728FF0000
      0000B6B6B6FF747474FF0000000000000000686868FFFEFEFEFFFEFEFEFF9999
      99FFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFF
      FFFF999999FFFFFFFFFFFFFFFFFF686868FFAF7338FFAB6929FFA86321FFCBA1
      7AFFDEC3ABFFA6601DFFC59F79FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000767676FF767676FF7676
      76FF767676FF767676FF787878FF0000000085AD4AFF85AD4AFF85AD4AFF85AD
      4AFF85AD4AFF85AD4AFF85AD4AFF85AD4AFF00000000747474FF747474FF7474
      74FF747474FF8C8C8CFF00000000A96728FFAD6E31FFAB6828FFAC6C2EFFA967
      28FF00000000B6B6B6FF0000000000000000686868FFFEFEFEFFFEFEFEFF9D9D
      9DFF999999FF999999FF999999FF999999FF999999FF999999FF999999FF9999
      99FF999999FFFFFFFFFFFFFFFFFF686868FFC09971FFAB6929FFAB6928FFA25B
      16FFF9F5F0FFC5A382FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000767676FF767676FF7676
      76FF767676FF767676FF767676FFC4C4C4FF00000000000000000000000085AD
      4BFF85AD4AFF00000000000000000000000000000000747474FF747474FF7474
      74FF747474FF747474FF8D8D8DFF00000000A96728FFAD6E31FFAB6828FFAC6C
      2EFFA96728FF000000000000000000000000686868FFFEFEFEFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFF
      FFFF999999FFFFFFFFFFFFFFFFFF686868FF00000000AB6929FFAB6929FFAA68
      27FFC19D78FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000767676FF767676FF7676
      76FF767676FF00000000000000000000000000000000000000000000000085AD
      4BFF85AD4AFF00000000000000000000000000000000747474FF747474FF7474
      74FF747474FF00000000000000000000000000000000A96728FFAD6E31FFAB68
      28FFAC6C2EFFA96728FF0000000000000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFF999999FFFFFFFFFFFFFF
      FFFF999999FFFFFFFFFFFFFFFFFF686868FF00000000B98A5BFFAB6929FFAB69
      29FFAF743AFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000767676FF767676FF7676
      76FF767676FF00000000B47436FFB47436FFB47436FF000000000000000085AD
      4BFF85AD4AFF00000000000000000000000000000000747474FF747474FF7474
      74FF747474FF00000000B47234FFB47234FFBD8B58FF00000000A96728FFAD6E
      31FFAB6828FFAC6C2EFF0000000000000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF9D9D9DFF999999FF999999FF9D9D9DFF999999FF9999
      99FF9D9D9DFFFFFFFFFFFFFFFFFF686868FF0000000000000000AB6929FFAB69
      29FFAB6929FFC6A788FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B47436FFB47436FFB47436FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B47234FFB47234FFB47234FF0000000000000000A967
      28FFAD6E31FF0000000000000000A96728FF686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FF0000000000000000CAAD92FFAB69
      29FFAB6929FFAB6929FFCFBAA6FF000000000000000000000000000000000000
      000000000000000000000000000000000000767676FF767676FF767676FF7676
      76FF767676FF0000000000000000000000000000000000000000767676FF7676
      76FF767676FF767676FF767676FF00000000747474FF747474FF747474FF7474
      74FF747474FF00000000000000000000000000000000000000008D8D8DFF0000
      00000000000000000000A96728FFA96728FF686868FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FF000000000000000000000000B98A
      5AFFAB6929FFAB6929FFAB6929FFCAAE93FF0000000000000000C7A889FFA965
      23FFB17840FF000000000000000000000000767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF767676FF767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF00000000747474FF747474FF747474FF7474
      74FF747474FF747474FF747474FF747474FF747474FF747474FF747474FF8E8E
      8EFF00000000A96728FFA96728FFD3C2B2FFB2773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF0000000000000000000000000000
      0000B88756FFAB6929FFAB6929FFAB6929FFB37C46FFCAAB8BFFFDFBF9FFB67E
      48FFA6601CFFAA6828FFC29E7AFF00000000767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF767676FF767676FF767676FF767676FF7676
      76FF767676FF767676FF767676FF00000000747474FF747474FF747474FF7474
      74FF747474FF747474FF747474FF747474FF747474FF747474FF747474FF7474
      74FF888888FFB4B4B4FFB7B7B7FF00000000B2773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF0000000000000000000000000000
      000000000000B88857FFAB6929FFAB6929FFAB6929FFA96522FFAC6B2CFFF3EB
      E1FFDBBEA4FFA35C16FFA96726FFB07339FF828282FF787878FF767676FF7878
      78FF787878FF787878FF787878FF787878FF787878FF787878FF787878FF7878
      78FF787878FF767676FF848484FF00000000828282FF767676FF747474FF7676
      76FF767676FF767676FF767676FF767676FF767676FF767676FF767676FF7676
      76FF767676FF747474FF848484FF00000000B3773DFFB3773DFF000000006868
      68FF00000000B3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFF0000
      0000686868FF00000000B3773DFFB3773DFF0000000000000000000000000000
      00000000000000000000C4A281FFAB6929FFAB6929FFAB6929FFAA6727FFA35B
      16FFD0AB88FFF9F5F1FFB3753BFFB0763EFF000000000000000000000000B4B4
      B4FF00000000000000000000000000000000000000000000000000000000BBBB
      BBFF00000000000000000000000000000000000000000000000000000000B4B4
      B4FF00000000000000000000000000000000000000000000000000000000BBBB
      BBFF00000000000000000000000000000000B57C45FFB3773DFF000000006868
      68FF00000000B3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFF0000
      0000686868FF00000000B3773DFFB47B44FF0000000000000000000000000000
      000000000000000000000000000000000000AE7034FFAB6929FFAB6929FFAB69
      28FFA7611FFFB17338FFF0E7DEFF000000000000000000000000000000007676
      76FFABABABFF0000000000000000000000000000000000000000ABABABFF7676
      76FF000000000000000000000000000000000000000000000000000000007474
      74FFABABABFF0000000000000000000000000000000000000000ABABABFF7474
      74FF000000000000000000000000000000000000000000000000000000006868
      68FF000000000000000000000000000000000000000000000000000000000000
      0000686868FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CDB59EFFB1773FFFAB69
      29FFAD6E30FFC09A73FF0000000000000000000000000000000000000000B0B0
      B0FF767676FF767676FF767676FF767676FF767676FF767676FF767676FFB0B0
      B0FF00000000000000000000000000000000000000000000000000000000B0B0
      B0FF747474FF747474FF747474FF747474FF747474FF747474FF747474FFB0B0
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
      00000000000000000000B3773DFFB3773DFFB3773DFFB1763DFF000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000202020702020207000000000000FFFF0000FFFF0000000000CC
      FFFF00CCFFFF00000000008000FF008000FF0000000000000000000000000000
      00000000000000000000B1763DFFB3773DFFB3773DFFB3773DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B3773DFFB3773DFFB3773DFFB1763DFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E
      4EFF4E4E4EFF4E4E4EFF4E4E4EFF000000000000FFFF0000FFFF0000000000CC
      FFFF00CCFFFF00000000008000FF008000FF0000000000000000000000000000
      000000000000B1763DFFB3773DFFB3773DFFB3773DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3773DFFB3773DFFB3773DFFB176
      3DFF00000000000000000000000000000000FFFFFFFF3A3A3AFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF3C3C3CFFFFFFFFFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E
      4EFF4E4E4EFF4E4E4EFF4E4E4EFF000000000000FFFF0000FFFF0000000000CC
      FFFF00CCFFFF00000000008000FF008000FF0000000000000000000000000000
      0000B1763DFFB3773DFFB3773DFFB3773DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3773DFFB3773DFFB377
      3DFFB1763DFF000000000000000000000000FFFFFFFF3E3E3EFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF404040FFFFFFFFFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E
      4EFF4E4E4EFF4E4E4EFF4E4E4EFF000000000000FFFF0000FFFF4E4E4EFF4E4E
      4EFF4E4E4EFF00000000008000FF008000FF000000000000000000000000B176
      3DFFB3773DFFB3773DFFB3773DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3773DFFB377
      3DFFB3773DFFB1763DFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E
      4EFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E
      4EFF4E4E4EFF00000000008000FF008000FF0000000000000000B1763DFFB377
      3DFFB3773DFFB3773DFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3773EFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB1763DFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0A0A0A224E4E4EFF4E4E4EFF4E4E
      4EFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E
      4EFF4E4E4EFF00000000008000FF008000FF00000000B1763DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773EFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB1763DFFFFFFFFFF3A3A3AFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF3C3C3CFFFFFFFFFF00000000000000000808081A4747
      47E94E4E4EFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E4EFF4E4E4EFF2F2F2F9B0000
      000000000000000000000000000000000000B1763DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773EFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB1763DFF00000000FFFFFFFF3E3E3EFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF404040FFFFFFFFFF0000000000000000000000000000
      0000000000004C4C4CFFEFEFEFFF4D4D4DFF4E4E4EFF00000000000000000000
      00000000000000000000000000000000000000000000B1763DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773EFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B3773DFFB377
      3DFFB3773DFFB1763DFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000444444DD4E4E4EFF929292FF464646FF4E4E4EFF00000000000000000000
      0000000000000000000000000000000000000000000000000000B1763DFFB377
      3DFFB3773DFFB3773DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B3773DFFB3773DFFB377
      3DFFB1763DFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      00004E4E4EFF4B4B4BFFFFFFFFFF444444FF4E4E4EFF4E4E4EFF000000000000
      000000000000000000000000000000000000000000000000000000000000B176
      3DFFB3773DFFB3773DFFB3773DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3773DFFB3773DFFB3773DFFB176
      3DFF00000000000000000000000000000000FFFFFFFF3A3A3AFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF3C3C3CFFFFFFFFFF0000000000000000000000002323
      23704E4E4EFF4D4D4DFFF9F9F9FF5F5F5FFF4E4E4EFF4E4E4EFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B1763DFFB3773DFFB3773DFFB3773DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B3773DFFB3773DFFB3773DFFB1763DFF0000
      000000000000000000000000000000000000FFFFFFFF3E3E3EFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF404040FFFFFFFFFF0000000000000000000000004545
      45DD4E4E4EFF4E4E4EFF484848FFFFFFFFFF515151FF4E4E4EFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B1763DFFB3773DFFB3773DFFB3773DFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B3773DFFB3773DFFB3773DFFB1763DFF000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000004747
      47E54E4E4EFF5A5A5AFF4A4A4AFF808080FFD9D9D9FF4E4E4EFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B1763DFFB3773DFFB3773DFFB3773DFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000002828
      287F4E4E4EFFEEEEEEFFFFFFFFFFFFFFFFFF4F4F4FFF4E4E4EFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      00004E4E4EFF4D4D4DFF474747FF484848FF4E4E4EFF2222226F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2B1A6FF995E25FF9454
      17FF975B21FFBEA99AFF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C2B1A6FF995E25FF9454
      17FF975B21FFBEA99AFF00000000000000000000000000000000000000000000
      0000EAEAEAFFA29F9EFF706E6EFF706E6EFF706E6EFF706E6EFF706E6EFF706E
      6EFF706E6EFF706E6EFF706E6EFF939090FF0000000000000000B56D9DFFAB51
      8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB51
      8DFFAB518DFFAB518DFFAB518DFFAB518DFF0000000000000000000000000000
      000000000000000000000000000000000000A87A5CFFA46D38FFD2B79DFFC8A8
      88FFCEB296FFA46D38FFA06B47FF0000000000000000AC568FFFAB518DFFAB51
      8DFFAB518DFFAB518DFFAB518DFFC9A1BBFFA87A5CFFA46D38FFD2B79DFFC8A8
      88FFCEB296FFA46D38FFA06B47FF000000000000000000000000000000000000
      0000F6F6F6FF7A7878FFB2B2B2FFE2E2E2FFEEEEEEFFECECECFFE9E9E9FFEBEB
      EBFFEEEEEEFFE9E9E9FFB0B0B0FF706E6EFF00000000B4699BFFAB518DFFAC53
      8EFFFFFFFFFFFFFFFFFFAB528DFFAE5892FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFAB518DFFAB518DFFAB518DFF00000000A2C8E0FF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF96C7E6FFC1ADA0FFA46D38FFFFFFFFFFA46D38FFFCFA
      F9FFA46D38FFFFFFFFFFA46D38FFC1AE9CFFB4699BFFAB518DFFAC538EFFFFFF
      FFFFFFFFFFFFAB528DFFC28EB0FFC1ADA0FFA46D38FFFFFFFFFFA46D38FFFCFA
      F9FFA46D38FFFFFFFFFFA46D38FFC1AE9CFF0000000000000000000000000000
      0000F6F6F6FF7A7878FFD6D4D3FF9E9C9CFFEBE7E6FFE5E1E0FFDEDBDAFFE4E0
      DFFFEBE8E7FFA3A1A1FFD1CFCEFF706E6EFF00000000AB528DFFAB518DFFAC53
      8EFFFFFFFFFFFFFFFFFFAB528DFFAE5892FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFAB518DFFAB518DFFAB518DFFAFB4B7FFB2CCDCFF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF00000000A46D38FFA46D38FFA46D38FFA46D38FFA46D
      38FFA46D38FFA46D38FFA46D38FFA46D38FFAB528DFFAB518DFFAC538EFFFFFF
      FFFFFFFFFFFFAB528DFF00000000A46D38FFA46D38FFA46D38FFA46D38FFA46D
      38FFA46D38FFA46D38FFA46D38FFA46D38FF0000000000000000000000000000
      0000F6F6F6FF7A7878FFEFECEBFFCDCAC8FF9D9A99FFB4B0AFFF8F8D8DFFB0AD
      ACFFA6A3A2FFC3BFBEFFF0EEECFF706E6EFF00000000AB528DFFAB518DFFAC53
      8EFFFFFFFFFFFFFFFFFFAB528DFFAE5892FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFAB518DFFAB518DFFAB518DFF999A9CFF0000000065B7EAFF65B7
      EAFF65B7EAFF65B7EAFF00000000A46D38FFFFFFFFFFFFFFFFFF945417FFFFFF
      FFFF945417FFFFFFFFFFFFFFFFFFA46D38FFAB528DFFAB518DFFAC538EFFFFFF
      FFFFFFFFFFFFAB528DFF00000000A46D38FFFFFFFFFFFFFFFFFF945417FFFFFF
      FFFF945417FFFFFFFFFFFFFFFFFFA46D38FF0000000000000000000000000000
      0000F3F3F3FF7A7878FFEBE9E7FFE7E3E0FF8C8A8AFFACAAAAFFEDEAEAFFB5B3
      B3FF838282FFE4E0DEFFECE9E8FF706E6EFF00000000AB528DFFAB518DFFAC53
      8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFAB518DFFAB518DFFAB518DFF828383FF000000006FB9E8FF65B7
      EAFF65B7EAFF65B7EAFF00000000A46D38FFA46D38FFA46D38FFA46D38FFA46D
      38FFA46D38FFA46D38FFA46D38FFA46D38FFAB528DFFAB518DFFAC538EFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000A46D38FFA46D38FFA46D38FFA46D38FFA46D
      38FFA46D38FFA46D38FFA46D38FFA46D38FF00000000C6A48BFFBE916FFFC097
      77FFEEE2DAFF7A7878FFE8E6E4FFAAA8A7FFBBBABAFFFDF9F9FFFDF5F5FFFDF8
      F8FFC7C6C6FF9E9D9CFFE7E4E3FF706E6EFF00000000AB528DFFAB518DFFAB51
      8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB51
      8DFFAB518DFFAB518DFFAB518DFFAB518DFF777777FF000000008CC1E3FF65B7
      EAFF65B7EAFF65B7EAFF00000000C3B0A2FFA46D38FFFFFFFFFFA46D38FFFCFA
      F9FFA46D38FFFFFFFFFFA46D38FFC3B09EFFAB528DFFAB518DFFAB518DFFAB51
      8DFFAB518DFFAB518DFF00000000C3B0A2FFA46D38FFFFFFFFFFA46D38FFFCFA
      F9FFA46D38FFFFFFFFFFA46D38FFC3B09EFFC09B81FFEBD1BAFFFFFCE9FFFFFF
      E9FFFFFFF7FF7A7878FFB3B2B1FFC2C1C1FFFDFBFBFFFEF9F9FFFEF9F9FFFEF9
      F9FFFDFBFBFFC9C8C8FFABAAA9FF706E6EFF00000000AB528DFFAB518DFFAB51
      8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB51
      8DFFAB518DFFAB518DFFAB518DFFAB518DFF777777FFBDC0C2FFA9CADEFF65B7
      EAFF65B7EAFF65B7EAFF96C7E6FF00000000A6795BFFA46D38FFD2B79DFFC8A8
      88FFCEB296FFA46D38FF9F6A46FF00000000AB528DFFAB518DFFAB518DFFAB51
      8DFFAB518DFFAB518DFFC08AADFF00000000A6795BFFA46D38FFD2B79DFFC8A8
      88FFCEB296FFA46D38FF9F6A46FF00000000B78864FFFFFFF0FFFFFFEDFFFFFD
      DFFFFFFDF3FF7A7878FFBEBEBEFFF8F7F7FFF8F7F7FFF8F7F7FFF8F7F7FFF8F7
      F7FFF8F7F7FFF8F7F7FFC5C5C5FF706E6EFF00000000AB528DFFAB518DFFE5CA
      DCFFFEFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFE7CDDEFFAB518DFFAB518DFF777777FFA5A7A8FF0000000065B7
      EAFF65B7EAFF65B7EAFF65B7EAFFAACEE4FF00000000C7B6AAFF995C24FF9454
      17FF975A21FFC1AC9EFFBBD4E3FF00000000AB528DFFAB518DFFE5CADCFFFEFD
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEFF00000000C7B6AAFF995C24FF9454
      17FF975A21FFC1AC9EFFC9A1BBFF00000000B68865FFFEF7E8FFFEFEECFFFEFC
      DEFFFFFDF0FFB4B2ACFF7A7878FF7A7878FF7A7878FF7A7878FF7A7878FF7A78
      78FF7A7878FF7A7878FF7A7878FFA8A7A6FF00000000AB528DFFAB518DFFFDFB
      FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFAB518DFFAB518DFF777777FF8E8F8FFF0000000069B8
      E9FF65B7EAFF65B7EAFF65B7EAFF65B7EAFF96C7E6FF00000000000000000000
      00000000000096C7E6FF6CB9E9FF00000000AB528DFFAB518DFFFDFBFCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3FF00000000000000000000
      000000000000C08AADFFAB518DFF00000000D1BDAEFFCDA88AFFFDEAD8FFFFFB
      E0FFFAF9DFFFFFFEF1FFFFFDF3FFFFFDF3FFFFFEF4FFFFFEF6FFFFFFF8FFFFFC
      F7FFF2E8E1FFF2EBE7FFF6F6F6FFEDEDEDFF00000000AB528DFFAB518DFFFDFC
      FDFFFFFFFFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
      B8FFFFFFFFFFFFFFFFFFAB528DFFAB518DFF777777FF797979FF000000008CC2
      E4FF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF65B7E9FF00000000AB528DFFAB518DFFFDFCFDFFFFFF
      FFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFFFFF
      FFFFFFFFFFFFAB528DFFAB518DFF0000000000000000D3C1B3FFBD9474FFEED5
      BDFFFFFFEBFFFFFFE5FFFDFDE1FFFEFEE2FFFEFEE8FFFEFEEEFFFEEEDBFFCAA4
      87FFD2BDADFF00000000000000000000000000000000AB528DFFAB518DFFFDFC
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFAB528DFFAB518DFF777777FF777777FFBDBFC0FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AB528DFFAB518DFFFDFCFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFAB528DFFAB518DFF000000000000000000000000CCB4A0FFE8CF
      BAFFFFFFF8FFFFFFF4FFFEFEF1FFFFFFEEFFFDEBD6FFFFF8E9FFEAD4C0FFCBAD
      97FF0000000000000000000000000000000000000000AB528DFFAB518DFFFDFC
      FDFFFFFFFFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
      B8FFFFFFFFFFFFFFFFFFAB528DFFAB518DFF777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
      77FF777777FF777777FF0000000000000000AB528DFFAB518DFFFDFCFDFFFFFF
      FFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFFFFF
      FFFFFFFFFFFFAB528DFFAB518DFF00000000000000000000000000000000CEAD
      93FFFFF2E5FFFFFFFFFFFEFEFDFFEFDBC8FFC7A183FFD1B299FFC9AA92FF0000
      00000000000000000000000000000000000000000000AB528DFFAB518DFFFDFB
      FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFAB518DFFAB518DFF777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
      77FF777777FF7E7E7EFF0000000000000000AB528DFFAB518DFFFDFBFCFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFAB518DFFAB518DFF00000000000000000000000000000000CEB7
      A7FFC9A58AFFD6B69EFFD3B299FFC5A38AFF0000000000000000000000000000
      00000000000000000000000000000000000000000000AB528DFFAB518DFFE5CA
      DCFFFEFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFE7CEDEFFAB518DFFAB518DFF777777FF777777FF777777FF7777
      77FF777777FF777777FF7B7B7BFFB4B4B4FF0000000000000000000000000000
      000000000000000000000000000000000000AB528DFFAB518DFFE5CADCFFFEFD
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFE7CEDEFFAB518DFFAB518DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AB528DFFAB518DFFAB51
      8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB51
      8DFFAB518DFFAB518DFFAB518DFFAB518DFF828282FF777777FF777777FF7777
      77FF777777FF777777FFB4B4B4FF000000000000000000000000000000000000
      000000000000000000000000000000000000AB528DFFAB518DFFAB518DFFAB51
      8DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB518DFFAB51
      8DFFAB518DFFAB518DFFAB518DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000043A7E5FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1
      E8FF58B1E8FF58B1E8FF58B1E8FF5BB1E6FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A9692AFFDEC7B0FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000666666FF666666FF666666FF666666FF6666
      66FF666666FF666666FF666666FF666666FF0000000000000000000000000000
      000000000000000000003DA3E2FF58B1E8FF58B1E8FF58B1E8FF000000FF0000
      00FF58B1E8FF58B1E8FF58B1E8FF8EC9EEFFCEA986FFB1763DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB1763DFFD0AD8AFF0000000000000000000000000000
      000000000000E1CCB8FFAB6A2AFFA9692AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000666666FFFFFFFFFF666666FFFEECCDFFFEEC
      CDFFFEECCDFF666666FFFFFFFFFF666666FFB47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFDDC4ACFF0000000043A7E5FF58B1E8FF58B1E8FF58B1E8FF58B1
      E8FF58B1E8FF58B1E8FF43A7E5FF00000000B1763CFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB1763DFFCEA986FFB1763DFFB3773DFFB377
      3DFFDCC2A9FF00000000A9692AFF0000000000000000A9692AFF00000000DFC7
      B1FFB1763CFFB1763DFFD0AD8AFF00000000CEA986FFB1763DFFB3773DFFB377
      3DFFB3773DFFB3773DFF00000000666666FF666666FF666666FFFEECCDFFFEEC
      CDFFFEECCDFF666666FF666666FF666666FFB47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFB7814BFF000000006EBAE9FF58B1E8FF58B1E8FF000000FF0000
      00FF58B1E8FF58B1E8FF70BBE9FF00000000B3773DFFB3773DFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3CD
      B8FFB3773DFFF5EEE7FFF5EEE7FFB3773DFFB1763CFFB3773DFFB3773DFFB377
      3DFFBA8551FF000000000000000000000000AB6A2AFFAC6D30FFA9692AFF0000
      0000DFC7B1FFB1763CFFB1763DFF00000000B1763CFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFF00000000666666FFFFFFFFFF666666FFFEECCDFFFEEC
      CDFFFEECCDFF666666FFFFFFFFFF666666FFB8824DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFD4B596FF0000000043A7E5FF58B1E8FF000000FF0000
      00FF58B1E8FF43A7E5FF0000000000000000B3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB3773DFFF5EEE7FFF5EEE7FFB3773DFFB3773DFFB3773DFFE3CDB8FFFFFF
      FFFFFFFFFFFFFDFDFDFF00000000A9692AFFAD7033FFAB6A2AFFAC6D30FFA969
      2AFF00000000F9F6F3FFB1763CFF00000000B3773DFFB3773DFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000666666FF666666FF666666FF6A6A6AFF6C6C
      6CFF6A6A6AFF666666FF666666FF666666FFBB8855FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB37941FF0000000097CDEFFF58B1E8FF000000FF0000
      00FF58B1E8FF9ACEEFFF0000000000000000B3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFF00000000A9692AFFAD7033FFAB6A2AFFAC6D
      30FFA9692AFF00000000DFC7B1FF00000000B3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000666666FFFFFFFFFF666666FFFEECCDFFFEEC
      CDFFFEECCDFF666666FFFFFFFFFF666666FFBE8E5DFFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFEFCFBFFFEFCFBFFCCA57EFF0000000058B1E8FF58B1E8FF58B1
      E8FF58B1E8FF000000000000000000000000B3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF00000000A9692AFFAD7033FFAB6A
      2AFFAC6D30FFA9692AFF0000000000000000B3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000666666FF666666FF666666FFFEECCDFFFEEC
      CDFFFEECCDFF666666FF666666FF666666FFC29466FFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFEFCFBFFFEFCFBFFB1763CFFFDFCFCFFC4E3F7FF58B1E8FF58B1
      E8FFC4E3F7FFEDE0D4FF0000000000000000B3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB3773DFFF5EEE7FFF5EEE7FFB3773DFFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF00000000A9692AFFAD70
      33FFAB6A2AFFAC6D30FF0000000000000000B3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000666666FFFFFFFFFF666666FFFEECCDFFFEEC
      CDFFFEECCDFF666666FFFFFFFFFF666666FFC59A6EFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFC39669FF0000000043A7E5FF43A7
      E5FF00000000C39568FF0000000000000000B3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF00000000A969
      2AFFAD7033FF0000000000000000A9692AFFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000666666FF666666FF666666FF666666FF6666
      66FF656565FF656565FF666666FF666666FFC9A077FFB3773DFFB3773DFFB379
      41FFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFE5D3C1FF000000000000
      0000E4D0BDFFB3773DFF0000000000000000B3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFB3773DFFF5EEE7FFF5EEE7FFB3773DFFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF0000
      00000000000000000000A9692AFFA9692AFFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000CCA680FFB3773DFFB3773DFFC9A0
      77FFBE8E5DFFB3773DFFB3773DFFB3773DFFB3773DFFE2CCB7FFDDC4ABFFDBC0
      A6FFB67E48FFB3773DFF0000000000000000B3773DFFB3773DFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3CD
      B8FFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3CDB8FFC294
      66FF00000000A9692AFFA9692AFFE8D7C7FFB3773DFFB3773DFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3CDB8FFB377
      3DFFB3773DFFB3773DFFB3773DFF00000000CFAB88FFB3773DFFB3773DFFCBA4
      7DFF00000000D4B394FFB1763CFFB3773DFFB3773DFF00000000EEE3D7FFBA87
      52FFB3773DFFB3773DFF0000000000000000B1763CFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB1763DFFB1763CFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFBE8C5BFFDDC5AEFFE0C9B3FF00000000B1763CFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB1763DFF00000000D2B191FFB3773DFFB3773DFFCEA9
      86FF0000000000000000EADBCCFFB98550FFB2773EFF00000000000000000000
      0000C79D73FFB3773DFF0000000000000000CBA580FFB1763CFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB1763CFFCDA984FFCBA580FFB1763CFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB1763CFFCDA984FF00000000CBA580FFB1763CFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB1763CFFCDA984FF00000000D6B799FFB3773DFFB3773DFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF00000000000000000000000000000000000000000000
      0000676767FF676767FFC0C0C0FFD7D7D7FF676767FF676767FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000676767FF676767FFC0C0C0FFD7D7D7FF676767FF686868FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000676767FF676767FFC0C0C0FFD7D7D7FF676767FF686868FF000000000000
      000000000000000000000000000000000000D9BDA1FFB3773DFFB3773DFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006767
      67FF676767FF9C9C9CFF0000000000000000D8D8D8FF676767FF676767FF0000
      0000000000000000000000000000000000000000000000000000000000006767
      67FF676767FF9C9C9CFF0000000000000000D8D8D8FF676767FF676767FF0000
      0000000000000000000000000000000000000000000000000000000000006767
      67FF676767FF9C9C9CFF0000000000000000D8D8D8FF676767FF676767FF0000
      000000000000000000000000000000000000DCC3ABFFB3773DFFB3773DFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DCDCDCFF00000000000000000000000000000000B3B3B3FF676767FF6767
      67FF000000000000000000000000000000000000000000000000000000000000
      0000DCDCDCFF00000000000000000000000000000000B3B3B3FF676767FF6767
      67FF000000000000000000000000000000000000000000000000000000000000
      0000DCDCDCFF00000000000000000000000000000000B3B3B3FF676767FF6767
      67FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D0AD8DFFBE8D5DFFBE8D
      5DFFD0AD8DFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000679921FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000CECECEFF929292FF838383FFABAAA6FFA3AC
      DAFF9D9D9BFF7E7E7EFF888888FFCDCDCDFF0000000000000000000000000000
      0000000000000000000000000000E2CDB9FFB3773DFFB47A41FFB2753BFFB275
      3BFFB3773EFFB3773DFFE2CDB9FF000000000000000000000000000000000000
      00000000000000000000000000000000000066991EFF66991EFF66991EFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000777777FF777777FF747474FFB9B9B3FF566C
      E2FFB3B1ABFF747474FF777777FF787878FFB47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFEBDCCFFF00000000B57C47FFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFB2753BFFB2763CFFB57C47FF00000000B47B44FFB3773DFFB3773DFFB377
      3DFFB2773EFFE1CBB6FF0000000066991EFF66991EFF66991EFF66991EFF6699
      1EFF00000000ECDED2FF0000000000000000B47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB2783FFF000000003049CCFF3049CCFF3049CCFF3049
      CCFF3049CCFF3049CCFF3049CCFF3049CCFFB47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFC5996DFF00000000777777FF777777FF737373FFC3C2BBFF354F
      D8FFBFBEB6FF737373FF777777FF848484FFB47B44FFB3773DFFB3773DFFB377
      3DFFBD8B5AFF00000000D0AD8DFFAE6E31FFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFB47940FFB2763BFFAE6E31FFD0AD8DFFB47B44FFB3773DFFB3773DFFB377
      3DFFD2B090FF0000000066991EFF66991EFF66991EFF0000000072A031FF6699
      1EFF66991EFF000000000000000000000000B47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB2783FFF000000003049CCFF3049CCFF3049CCFF3049
      CCFF3049CCFF3049CCFF3049CCFF3049CCFFB47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFB67E48FF00000000929292FF777777FF717171FFD3D1CBFF3A53
      D6FFCECDC6FF727272FF777777FFAEAEAEFFB8824DFFB3773DFFB3773DFFB377
      3DFFBD8B5AFF00000000BE8D5DFFAE6E31FFB2763BFFB3773DFFFFFFFFFFFFFF
      FFFFB3773DFFB67E47FFAE6E31FFBE8D5DFFB8824DFFB3773DFFB3773DFFB377
      3DFFCEA985FF0000000066991EFF66991EFF0000000000000000000000006B9C
      27FF66991EFF66991EFF0000000000000000B8824DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFE8D8C9FF0000000000000000000000000000
      000000000000000000000000000000000000B8824DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFDBC1A7FF00000000A4A4A4FF6E6E6EFFE4E4E5FF8C9C
      EDFFE0E1DDFF6E6E6EFFB1B1B1FF00000000BB8855FFB3773DFFB3773DFFB377
      3DFFBD8B5AFF00000000BE8D5DFFAE6E31FFB3773DFFB3773DFFD2AF8EFFD2AF
      8EFFB3773DFFB3773DFFAE6E31FFBE8D5DFFBB8855FFB3773DFFB3773DFFB377
      3DFFB1763CFFDEC6AFFF0000000000000000E8D7C8FFB37941FFDFC7B1FF0000
      0000689922FF66991EFF66991EFF00000000BB8855FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFF0000000000000000BB8855FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB1763DFFD4B596FF0000000000000000D6D6D6FFD3D3
      D4FFE2E2E3FF000000000000000000000000BE8E5DFFB3773DFFB3773DFFB377
      3DFFFCF9F9FF00000000D0AD8DFFAE6E31FFB3773DFFB3773DFFD2AF8EFFD2AF
      8EFFB3773DFFB3773DFFAE6E31FFD0AD8DFFBE8E5DFFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFCFAF9FFFCFBFBFFD7BA9FFFFCFAF9FFFEFCFBFFFCFAF9FFE0C9
      B3FF0000000065981EFF66991EFF679921FFBE8E5DFFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFEFCFBFFFEFCFBFFB3773DFFFEFCFBFFFEFCFBFFFEFCFBFFB377
      3DFFB3773DFFB3773DFF0000000000000000BE8E5DFFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFEFCFBFFFEFCFBFFB37840FF00000000BFBFBFFF727272FF7474
      73FF727271FFDFDFDFFF0000000000000000C29466FFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFDFCFCFF00000000B57C47FFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFB3773DFFBA8652FFB57C47FF00000000C29466FFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFEFCFBFFFEFCFBFFB3773DFFFEFCFBFFFEFCFBFFFEFCFBFFB176
      3DFFE0CBB4FF0000000066991EFF00000000C29466FFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFEFCFBFFFEFCFBFFB3773DFFFEFCFBFFFEFCFBFFFEFCFBFFB377
      3DFFB3773DFFB3773DFF0000000000000000C29466FFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFEFCFBFFFEFCFBFFC39669FF00000000767676FF777777FF7777
      77FF777777FF848484FF0000000000000000C59A6EFFB3773DFFB3773DFFB377
      3DFFB3773DFFBB8955FF00000000E2CDB9FFB57C47FFAE6E31FFAE6E31FFAE6E
      31FFAE6E31FFB57C47FFE2CDB9FF00000000C59A6EFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB2773EFFE1CBB6FF0000000000000000C59A6EFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFF0000000000000000C59A6EFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFC9A179FF00000000777777FF777777FF7777
      77FF777777FF777777FF0000000000000000C9A077FFB3773DFFB3773DFFB379
      41FFB3773DFFB3773DFFCCA783FF0000000000000000D0AD8DFFBE8D5DFFBE8D
      5DFFD0AD8DFF000000000000000000000000C9A077FFB3773DFFB3773DFFB379
      41FFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB1763CFF0000000000000000C9A077FFB3773DFFB3773DFFB379
      41FFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFF0000000000000000C9A077FFB3773DFFB3773DFFB379
      41FFB3773DFFB3773DFFB3773DFFBB8754FF00000000838383FF777777FF7777
      77FF777777FFA2A2A2FF0000000000000000CCA680FFB3773DFFB3773DFFC9A0
      77FFBE8E5DFFB3773DFFB3773DFFBD8B5AFFECDFD4FF00000000000000000000
      000000000000EFE4DAFF0000000000000000CCA680FFB3773DFFB3773DFFC9A0
      77FFBE8E5DFFB3773DFFB3773DFFB3773DFFB3773DFFDFC9B2FFB37941FFB377
      3DFFB3773DFFB3773DFF0000000000000000CCA680FFB3773DFFB3773DFFC9A0
      77FFBE8E5DFFB3773DFFB3773DFFB3773DFFB3773DFFDFC9B2FFB37941FFB377
      3DFFB3773DFFB3773DFF0000000000000000CCA680FFB3773DFFB3773DFFC9A0
      77FFBE8E5DFFB3773DFFB3773DFFB3773DFFE4D0BDFF00000000858585FF7777
      77FF989898FF000000000000000000000000CFAB88FFB3773DFFB3773DFFCBA4
      7DFF00000000D4B394FFB1763CFFB3773DFFB3773DFF00000000F0E7DEFFC599
      6EFFBD8B5AFFB3773DFF0000000000000000CFAB88FFB3773DFFB3773DFFCBA4
      7DFF00000000D4B394FFB1763CFFB3773DFFB3773DFF00000000EEE3D7FFBA87
      52FFB3773DFFB3773DFF0000000000000000CFAB88FFB3773DFFB3773DFFCBA4
      7DFF00000000D4B394FFB1763CFFB3773DFFB3773DFF00000000EEE3D7FFBA87
      52FFB3773DFFB3773DFF0000000000000000CFAB88FFB3773DFFB3773DFFCBA4
      7DFF00000000D4B394FFB1763CFFB3773DFFB47B44FF00000000000000000000
      000000000000D9BCA2FF0000000000000000D2B191FFB3773DFFB3773DFFCEA9
      86FF0000000000000000EADBCCFFB98550FFB2773EFF00000000000000000000
      0000C79D73FFB3773DFF0000000000000000D2B191FFB3773DFFB3773DFFCEA9
      86FF0000000000000000EADBCCFFB98550FFB2773EFF00000000000000000000
      0000C79D73FFB3773DFF0000000000000000D2B191FFB3773DFFB3773DFFCEA9
      86FF0000000000000000EADBCCFFB98550FFB2773EFF00000000000000000000
      0000C79D73FFB3773DFF0000000000000000D2B191FFB3773DFFB3773DFFCEA9
      86FF0000000000000000EADBCCFFB98550FFB2773EFF00000000000000000000
      0000CAA37CFFB3773DFF0000000000000000D6B799FFB3773DFFB3773DFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D6B799FFB3773DFFB3773DFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D6B799FFB3773DFFB3773DFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D6B799FFB3773DFFB3773DFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D9BDA1FFB3773DFFB3773DFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3773DFFB3773DFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3773DFFB3773DFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3773DFFB3773DFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3773DFFB3773DFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3773DFFB3773DFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3773DFFB3773DFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3773DFFB3773DFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000EADBCCFFC29365FFB78049FFB47B43FFB378
      3FFFB47B44FFB6814BFFC4986CFFF1E8DFFF0000000000000000000000000000
      000000000000000000000000000000000000DDDDDDFF707070FF525252FF4F4F
      4FFF686868FFCDCDCDFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008B99E1FF000000000000
      000000000000000000008996E0FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000919EE2FF5F71D5FF5F71
      D5FF919EE2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000AE6E30FFAE6E30FFAE6E30FFAE6E30FFAE6E
      30FFAE6E30FFAE6E30FFAE6E30FFB37941FF0000000000000000000000000000
      0000000000000000000000000000969696FF4D4D4DFFA5A5A5FFE2E2E2FFE6E6
      E6FFB1B1B1FF515151FF7E7E7EFF000000000000000000000000000000000000
      0000000000000000000000000000000000008A98E2FF1632C5FF1632C5FF0000
      0000000000001632C5FF1632C5FF8A98E0FF0000000000000000000000000000
      0000000000000000000000000000B7C1EBFF2C46CAFF3048CAFF3048CAFF3048
      CAFF3048CAFF2C46CAFFB7C1EBFF00000000B47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFC09263FF00000000AE6E30FFAE6E30FFAE6E30FFAE6E30FFAE6E
      30FFAE6E30FFAE6E30FFAE6E30FFB8834FFFB47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFDFC8B1FFE2E2E2FF4C4C4CFFE1E1E1FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF5F5F5FF515151FFCCCCCCFFB47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFD9BDA1FF000000001632C5FF1632C5FF2841
      C8FF3048CAFF1632C5FF1632C5FF00000000B47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFEBDCCFFF000000002943C8FF3049CBFF3049CBFFFFFFFFFFFFFF
      FFFF3049CBFF3049CBFF2943C8FF00000000B47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFB37941FF00000000C19264FFAE6E30FFAE6E30FFAE6E30FFAE6E
      30FFAE6E30FFAE6E30FFAE6E30FFD0AD8BFFB47B44FFB3773DFFB3773DFFB377
      3DFFB1763CFF00000000757575FF9A9A9AFFFFFFFFFFFFFFFFFFFDFDFDFFFCFB
      F8FFFFFFFFFFFFFFFFFFB8B9BAFF676767FFB47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB2773EFFE1CBB6FF00000000324ACAFF1632
      C5FF1632C5FF324BCBFF0000000000000000B47B44FFB3773DFFB3773DFFB377
      3DFFBD8B5AFF00000000919EE2FF2943CAFF314ACCFF314ACCFF213BC6FF213B
      C6FF314ACCFF314ACCFF2943CAFF919EE2FFB8824DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFDEC6AEFF00000000AE6E30FFAE6E30FFAE6E30FFAE6E
      30FFAE6E30FFAE6E30FFAE6E30FF00000000B8824DFFB3773DFFB3773DFFB377
      3DFFB8834EFF000000005A5A5AFFD0D0D0FFFFFFFFFFFFFFFFFF9D510AFF9D51
      0AFF9D510AFFD1BEABFFD1BEABFF4E4F52FFB8824DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB2773EFFE1CBB6FF000000002F48C9FF1632
      C5FF1632C5FF2841C8FF0000000000000000B8824DFFB3773DFFB3773DFFB377
      3DFFBD8B5AFF000000005F71D5FF324BCCFF2F48CBFF2F48CBFFFFFFFFFFFFFF
      FFFF2F48CBFF2F48CBFF324BCCFF5F71D5FFBB8855FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB67E48FFF2E9E0FFF2E9E1FFCEAA87FF000000000000
      0000F1E8DEFFCDA783FF0000000000000000BB8855FFB3773DFFB3773DFFB377
      3DFFB7824CFF000000005E5E5EFFCECECEFFFFFFFFFFFFFFFFFF9D510AFFE7D6
      C5FFF2E9E0FFF2E9E0FFE9EAEBFF4E4E4EFFBB8855FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFD9BDA3FF000000001632C5FF1632C5FF324A
      CAFF3048CAFF1632C5FF1632C5FF00000000BB8855FFB3773DFFB3773DFFB377
      3DFFBD8B5AFF000000005F71D5FF324BCCFF2F48CBFF2F48CBFFFFFFFFFFFFFF
      FFFF2F48CBFF2F48CBFF324BCCFF5F71D5FFBE8E5DFFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFEFCFBFFFEFCFBFFB7804AFF0000000000000000B37941FFAE6E
      30FFB68049FF000000000000000000000000BE8E5DFFB3773DFFB3773DFFB377
      3DFFFEFCFBFF00000000797979FF909090FFFFFFFFFFFFFFFFFF9D510AFFF2E9
      E0FFFFFFFFFFFFFFFFFFADADADFF6B6B6BFFBE8E5DFFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFEFCFBFFFEFCFBFFE3CFBCFF8593E1FF1632C5FF1632C5FF0000
      0000000000001632C5FF1632C5FF8E9BE1FFBE8E5DFFB3773DFFB3773DFFB377
      3DFFFCF9F9FF00000000919EE2FF2943CAFF2E47CBFF2E47CBFFFFFFFFFFFFFF
      FFFF2E47CBFF2E47CBFF2943CAFF919EE2FFC29466FFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFEFCFBFFFEFCFBFFBC8A58FF00000000B0743AFFAE6E30FFAE6E
      30FFAE6E30FFB8824DFF0000000000000000C29466FFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFDFCFBFF000000004C4C4CFFD2D2D2FFFFFFFFFFD1BEABFFF2E9
      E0FFFFFFFFFFE9E9E9FF4E4E4EFFD8D8D8FFC29466FFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFEFCFBFFFEFCFBFFB7824CFFFDFCFCFF8695E1FF00000000E1CB
      B6FFE1CBB6FF000000008A98E1FF00000000C29466FFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFDFCFCFF000000002943C8FF2C46CAFF2C46CAFFFFFFFFFFFFFF
      FFFF2C46CAFF2C46CAFF2943C8FF00000000C59A6EFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFC89F76FF00000000AE6E30FFAE6E30FFAE6E
      30FFAE6E30FFAE6E30FF0000000000000000C59A6EFFB3773DFFB3773DFFB377
      3DFFB3773DFFB7814BFF00000000A3A3A3FF4C4C4CFF909091FFD4D4D4FFD4D4
      D4FF9D9D9DFF4E4E4EFF909090FF00000000C59A6EFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB7824CFFE3CEBAFFD9BDA1FFB277
      3EFFB2773EFFD9BDA3FF0000000000000000C59A6EFFB3773DFFB3773DFFB377
      3DFFB3773DFFBB8955FF00000000B7C1EBFF2943C8FF2640C9FF2640C9FF2640
      C9FF2640C9FF2943CAFFB7C1EBFF00000000C9A077FFB3773DFFB3773DFFB379
      41FFB3773DFFB3773DFFB3773DFFBD8B5AFF00000000AE7237FFAE6E30FFAE6E
      30FFAE6E30FFB6814BFF0000000000000000C9A077FFB3773DFFB3773DFFB379
      41FFB3773DFFB3773DFFC09061FF0000000000000000787878FF595959FF5555
      55FF717171FFDDDDDDFF0000000000000000C9A077FFB3773DFFB3773DFFB379
      41FFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFF0000000000000000C9A077FFB3773DFFB3773DFFB379
      41FFB3773DFFB3773DFFCCA783FF0000000000000000919EE2FF5F71D5FF5F71
      D5FF919EE2FF000000000000000000000000CCA680FFB3773DFFB3773DFFC9A0
      77FFBE8E5DFFB3773DFFB3773DFFB3773DFFE8D8C7FF00000000B0733AFFAE6E
      30FFB37941FF000000000000000000000000CCA680FFB3773DFFB3773DFFC9A0
      77FFBE8E5DFFB3773DFFB3773DFFB7824CFFDCC2A9FF00000000000000000000
      000000000000E1CBB6FF0000000000000000CCA680FFB3773DFFB3773DFFC9A0
      77FFBE8E5DFFB3773DFFB3773DFFB3773DFFB3773DFFDFC9B2FFB37941FFB377
      3DFFB3773DFFB3773DFF0000000000000000CCA680FFB3773DFFB3773DFFC9A0
      77FFBE8E5DFFB3773DFFB3773DFFBD8B5AFFECDFD4FF00000000000000000000
      000000000000EFE4DAFF0000000000000000CFAB88FFB3773DFFB3773DFFCBA4
      7DFF00000000D4B394FFB1763CFFB3773DFFB68149FF00000000000000000000
      000000000000E4D1BEFF0000000000000000CFAB88FFB3773DFFB3773DFFCBA4
      7DFF00000000D4B394FFB1763CFFB3773DFFB3773DFF00000000F0E6DDFFC295
      67FFB1763DFFB3773DFF0000000000000000CFAB88FFB3773DFFB3773DFFCBA4
      7DFF00000000D4B394FFB1763CFFB3773DFFB3773DFF00000000EEE3D7FFBA87
      52FFB3773DFFB3773DFF0000000000000000CFAB88FFB3773DFFB3773DFFCBA4
      7DFF00000000D4B394FFB1763CFFB3773DFFB3773DFF00000000F0E7DEFFC599
      6EFFBD8B5AFFB3773DFF0000000000000000D2B191FFB3773DFFB3773DFFCEA9
      86FF0000000000000000EADBCCFFB98550FFB2773EFF00000000000000000000
      0000CEAA87FFB3773DFF0000000000000000D2B191FFB3773DFFB3773DFFCEA9
      86FF0000000000000000EADBCCFFB98550FFB2773EFF00000000000000000000
      0000C79D73FFB3773DFF0000000000000000D2B191FFB3773DFFB3773DFFCEA9
      86FF0000000000000000EADBCCFFB98550FFB2773EFF00000000000000000000
      0000C79D73FFB3773DFF0000000000000000D2B191FFB3773DFFB3773DFFCEA9
      86FF0000000000000000EADBCCFFB98550FFB2773EFF00000000000000000000
      0000C79D73FFB3773DFF0000000000000000D6B799FFB3773DFFB3773DFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D6B799FFB3773DFFB3773DFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D6B799FFB3773DFFB3773DFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D6B799FFB3773DFFB3773DFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D9BDA1FFB3773DFFB3773DFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3773DFFB3773DFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3773DFFB3773DFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3773DFFB3773DFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3773DFFB3773DFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3773DFFB3773DFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3773DFFB3773DFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3773DFFB3773DFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EDF1E5FFACC785FF84AB4AFF73A230FF73A230FF82AA46FFAAC583FFE9EF
      E0FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084AB
      4AFF85AD4AFF0000000000000000000000000000000000000000000000000000
      00000000000000000000CEE6F6FF8CC7EEFF68B7E9FF57AFE6FF54AEE6FF5FB3
      E7FF79C0EBFFACD7F2FF0000000000000000000000000000000000000000A3C1
      78FF73A232FF6D9D29FF6C9D26FF83AC48FF85AC49FF6C9D27FF6D9D27FF73A2
      30FF9EBE72FF000000000000000000000000B1763DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084AB
      4AFF85AD4AFF0000000000000000000000000000000000000000000000000000
      000000000000B7DFF7FF9BD0F1FFC5E3F7FFC1E1F6FFC0E0F6FFBEDEF4FFBBDF
      F4FFB8DCF4FFB3DAF4FF67B6E8FF0000000000000000000000008AB052FF70A0
      2DFF79A539FFD1E1BCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3E2C0FF7CA6
      3EFF6FA02CFF85AD4CFF0000000000000000B47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFE8D8C9FF00000000000000000000000084AB
      4AFF85AD4AFF000000000000000000000000B47B44FFB3773DFFB3773DFFB377
      3DFFECDFD4FFD7EEFCFF7AC1EDFF52AEE7FF55AFE8FF5AB0E7FF71BCEAFF78BF
      EBFF6FBAE9FF56AFE7FF9DD1F0FF0000000000000000A8C480FF70A02DFF8BB0
      54FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF91B55BFF6FA02DFF9FBE71FF00000000B8824DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB47B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB2783FFF0000000085AD4AFF85AD4AFF85AD4AFF85AD
      4AFF85AD4AFF85AD4AFF85AD4AFF85AD4AFFB47B44FFB3773DFFB3773DFFB377
      3DFFDBC1A7FF000000007DC1EAFFC7E4F6FF00000000D6EAF7FFC0E0F5FFBADE
      F4FFC8E4F6FFE5F1FAFF00000000000000000000000073A232FF76A336FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E7FFB8B8
      B9FFFFFFFFFF7BA63DFF73A232FFEAF0E1FFBB8855FFB3773DFFB3773DFFB377
      3DFFB3773DFFFEFCFBFFFEFCFBFFFEFCFBFFB3773DFFB3773DFFFEFCFBFFFEFC
      FBFFFEFCFBFFB3773DFFB3773DFFB3773DFFB8824DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB2783FFF0000000085AD4AFF85AD4AFF85AD4AFF85AD
      4AFF85AD4AFF85AD4AFF85AD4AFF85AD4AFFB8824DFFB3773DFFB3773DFFB377
      3DFFB37941FFEDE1D6FF000000006AB8E8FF6FBBEAFF97CCEFFFABD6F2FFADD9
      F3FFA4D4F1FF89C6EEFF5AB1E7FFB3DAF3FFB1CA8DFF6D9D29FFCBDCB4FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCCCCCFF444444FFFCFC
      FCFFFFFFFFFFD2E1BEFF6D9D29FFABC684FFBE8E5DFFB3773DFFB3773DFFB377
      3DFFB3773DFFFEFCFBFFFEFCFBFFFEFCFBFFB3773DFFB3773DFFFEFCFBFFFEFC
      FBFFFEFCFBFFB3773DFFB3773DFFB3773DFFBB8855FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFE8D8C9FF00000000000000000000000084AB
      4AFF85AD4AFF000000000000000000000000BB8855FFB3773DFFB3773DFFB377
      3DFFB3773DFFEBDCCFFFC3E5FAFFC8E5F7FFA9D6F2FF80C3EDFF6AB9EAFF64B5
      E9FF6DB9EAFF86C6EEFFB0D9F4FFA0D2F0FF8BB055FF699A23FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6B6B6FF353535FFDEDEDEFFFFFF
      FFFFFFFFFFFFFFFFFFFF6B9B25FF85AC4CFFC29466FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFBE8E5DFFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFEFCFBFFFEFCFBFFB3773DFFFEFCFBFFFEFCFBFF0000000084AB
      4AFF85AD4AFF000000000000000000000000BE8E5DFFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFDFCFCFFDDF0FCFF4FADE7FF56B0E8FF5AB1E8FF5BB2E8FF5CB2
      E8FF5BB2E8FF5AB1E8FF55B0E8FF6FBAE9FF6F9E2DFF73A130FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B3B3FF373737FFBCBCBCFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF80AA46FF72A02FFFC59A6EFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFC29466FFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFEFCFBFFFEFCFBFFB3773DFFFEFCFBFFFEFCFBFF0000000084AB
      4AFF85AD4AFF000000000000000000000000C29466FFB3773DFFB3773DFFB377
      3DFFFEFCFBFFFCFBFAFF00000000DFEFFAFF9CD0F1FF77BEEAFF64B5E8FF61B4
      E7FF6BB8E9FF87C6EEFFB8DDF5FF00000000FDFDFDFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF767676FF828282FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF80A942FF73A133FFC9A077FFB3773DFFB3773DFFC69B
      70FFB37941FFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFCEAA87FFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFC59A6EFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFE7D6C5FF0000
      000000000000E8D8C9FF0000000000000000C59A6EFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFBB8955FFDCC3ABFFF1E7DEFF00000000000000000000
      000000000000000000000000000000000000F1F5EAFFF9FBF9FFF9FBF8FFF8FB
      F7FFFFFFFFFFFFFFFFFFFFFFFFFF888888FF919191FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF6A9C24FF89AE50FFCCA680FFB3773DFFB3773DFFC9A0
      77FFF0E5DBFFBE8E5DFFB3773DFFB3773DFFB3773DFFB3773DFF00000000DFC9
      B2FFB37941FFB3773DFFB3773DFFB3773DFFC9A077FFB3773DFFB3773DFFB379
      41FFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFF0000000000000000C9A077FFB3773DFFB3773DFFB379
      41FFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB47A42FFBA8752FFBC89
      57FFB7814BFFB1763CFF00000000000000006B9B26FF6A9B24FF6A9B24FF6498
      1CFF59900AFFFBFCF9FFFFFFFFFF999999FF9B9B9BFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFCBDCB4FF6D9D29FFB0C98BFFCFAB88FFB3773DFFB3773DFFCBA4
      7DFF0000000000000000D4B394FFB1763CFFB3773DFFB3773DFF000000000000
      0000EEE3D7FFBA8752FFB3773DFFB3773DFFCCA680FFB3773DFFB3773DFFC9A0
      77FFBE8E5DFFB3773DFFB3773DFFB3773DFFB3773DFFDFC9B2FFB37941FFB377
      3DFFB3773DFFB3773DFF0000000000000000CCA680FFB3773DFFB3773DFFC9A0
      77FFBE8E5DFFB3773DFFB3773DFFB3773DFFB3773DFFDFC9B2FFB37941FFB377
      3DFFB3773DFFB3773DFF000000000000000078A439FF75A334FF6F9E2BFFC7D9
      ACFFCADBB1FFDCE7CBFFFFFFFFFFAFAFAFFFAEAEAEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF75A333FF74A232FF00000000D2B191FFB3773DFFB3773DFFCEA9
      86FF000000000000000000000000EADBCCFFB98550FFB2773EFF000000000000
      00000000000000000000C79D73FFB3773DFFCFAB88FFB3773DFFB3773DFFCBA4
      7DFF00000000D4B394FFB1763CFFB3773DFFB3773DFF00000000EEE3D7FFBA87
      52FFB3773DFFB3773DFF0000000000000000CFAB88FFB3773DFFB3773DFFCBA4
      7DFF00000000D4B394FFB1763CFFB3773DFFB3773DFF00000000EEE3D7FFBA87
      52FFB3773DFFB3773DFF000000000000000078A439FF77A338FF73A130FF87AE
      4EFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4D4FFCCCCCCFFFFFFFFFFFFFFFFFFFFFF
      FFFF86AE4BFF70A02EFFAAC583FF00000000D6B799FFB3773DFFB3773DFFD0AD
      8BFF0000000000000000000000000000000000000000CEAA87FF000000000000
      0000000000000000000000000000D8BB9EFFD2B191FFB3773DFFB3773DFFCEA9
      86FF0000000000000000EADBCCFFB98550FFB2773EFF00000000000000000000
      0000C79D73FFB3773DFF0000000000000000D2B191FFB3773DFFB3773DFFCEA9
      86FF0000000000000000EADBCCFFB98550FFB2773EFF00000000000000000000
      0000C79D73FFB3773DFF000000000000000075A334FFB7CE96FF9DBC6FFF72A1
      2FFF70A12EFFC2D5A4FFFCFDFBFFFFFFFFFFFFFFFFFFFDFEFEFFC5D8AAFF73A2
      30FF72A12EFF91B45DFF0000000000000000D9BDA1FFB3773DFFB3773DFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D6B799FFB3773DFFB3773DFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF0000000000000000D6B799FFB3773DFFB3773DFFD0AD
      8BFF00000000000000000000000000000000CEAA87FF00000000000000000000
      000000000000D8BB9EFF000000000000000075A334FFAAC583FF00000000B4CC
      92FF74A232FF6E9E2AFF6A9B23FF73A232FF75A234FF6A9B23FF6E9E2AFF74A2
      32FFAFC98BFF000000000000000000000000DCC3ABFFB3773DFFB3773DFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3773DFFB3773DFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D9BDA1FFB3773DFFB3773DFFD3B2
      92FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BAD09AFF93B65FFF7EA844FF7DA741FF92B55FFFB7CE96FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3773DFFB3773DFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCC3ABFFB3773DFFB3773DFFD5B7
      98FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000676767FF676767FF676767FF6767
      67FF676767FF676767FF676767FF676767FF676767FF676767FF676767FF6767
      67FF676767FF676767FF676767FF00000000000000000000000000000000C394
      B4FFCCAAC0FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000009BBB6CFF689A23FF6699
      1EFF6B9B26FFA5C27AFFDAE5C7FF66991EFF0000000000000000000000000000
      000000000000000000000000000000000000DDDDDDFF707070FF525252FF4F4F
      4FFF686868FFCDCDCDFF0000000000000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF686868FF000000000000000000000000AE5B92FFAA51
      8DFFBF82ACFFA94E8BFFCAA4BEFF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C091
      63FFB3773DFFB3773DFFC19263FF000000007CA740FF65981EFFCCDCB5FFE5ED
      D9FFC7D8ACFF76A338FF75A235FF66991EFF0000000000000000000000000000
      0000000000000000000000000000969696FF4D4D4DFFA5A5A5FFE2E2E2FFE6E6
      E6FFB1B1B1FF515151FF7E7E7EFF00000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF686868FF00000000C8A1BBFFAB518DFFAA508CFFAC54
      8FFFC78DB4FFA94C8AFFAB518DFFB05F95FF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C091
      63FFB3773DFFB3773DFFEEE2D6FFB3CB91FF65971DFF00000000000000000000
      0000C9DAB1FF8DB257FF66991EFF66991EFF0000000000000000000000000000
      00000000000000000000E2E2E2FF4C4C4CFFE1E1E1FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF5F5F5FF515151FFCCCCCCFF686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF686868FF00000000AB518DFFAB518DFFAA508CFFAC53
      8FFFC68AB1FFA94C8AFFAB518DFFAB518DFFAB518DFFBF87ACFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000066991EFF66991EFF66991EFF66991EFF0000000000000000C5E1F2FF8FCB
      F2FF69B7EAFF00000000757575FF9A9A9AFFFFFFFFFFFFFFFFFFFDFDFDFFFCFB
      F8FFFFFFFFFFFFFFFFFFB8B9BAFF676767FF686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF686868FF00000000AB518DFFAB518DFFA94E8BFFA94F
      8BFFC68BB2FFA74887FFAB518DFFAB518DFFAA508CFFAD5890FFB875A1FFD1B6
      C8FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000066991EFF66991EFF66991EFF66991EFF0000
      000000000000000000000000000000000000DDECF5FF57B0E8FF54AFE7FF50AD
      E7FF5EB3E6FF000000005A5A5AFFD0D0D0FFFFFFFFFFFFFFFFFF9D510AFF9D51
      0AFF9D510AFFD1BEABFFD1BEABFF4E4F52FF686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF686868FF00000000AA508CFFA74987FFB96D9FFFD5AB
      C7FFC992B7FFC88EB4FFA64786FFA94E8BFFAA4F8CFFB26097FFBD76A5FFA94E
      8BFFB56D9DFF000000000000000000000000C5996DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFF0000000066991EFF66991EFF8DB257FFC9DAB1FF0000
      0000000000000000000065971DFFB3CB91FF55B1EAFF50ADE6FF90CBEFFFC4E3
      F6FFD5E9F6FF000000005E5E5EFFCECECEFFFFFFFFFFFFFFFFFF9D510AFFE7D6
      C5FFF2E9E0FFF2E9E0FFE9EAEBFF4E4E4EFF686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF686868FF00000000A84C89FFD3A5C4FFC384AEFFA647
      86FFA84A88FFAF5B94FFD3A6C3FFBC74A3FFA64786FFB26197FFBA72A3FFA94E
      8BFFAB518DFFAB518DFFC18EB0FF00000000B47A41FFBD9061FFB98856FFB988
      56FFB98856FFB98856FFEFE5DBFF66991EFF75A235FF76A338FFC7D8ACFFE5ED
      D9FFCCDCB5FF65981EFF7CA740FF0000000087C7F0FFCAE5F6FF8AC8EEFF58B0
      E8FF4EADE6FF00000000797979FF909090FFFFFFFFFFFFFFFFFF9D510AFFF2E9
      E0FFFFFFFFFFFFFFFFFFADADADFF6B6B6BFF686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF686868FF00000000D3A5C3FFA84D8AFFA94C8AFFAB51
      8DFFAB518DFFAA4F8CFFA74887FFBC75A6FFD4A6C5FFB86D9FFFB86DA0FFA94E
      8BFFAB518DFFAB518DFFAB518DFFAC568FFFB47A41FFB98856FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFF66991EFFDAE5C7FFA5C27AFF6B9B26FF6699
      1EFF689A23FF9BBB6CFF000000000000000087C7F0FF4DABE6FF54AFE7FF57B0
      E7FF58B1E8FFB3DAF3FF000000004C4C4CFFD2D2D2FFFFFFFFFFD1BEABFFF2E9
      E0FFFFFFFFFFE9E9E9FF4E4E4EFFD8D8D8FF686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF686868FF0000000000000000BE87ACFFAA508CFFAA50
      8CFFAB518DFFAB518DFFAB518DFFA94D8AFFA24081FFDEBDD2FFD5A9C7FFA84A
      89FFA84C8AFFAB518DFFAB518DFFAB518DFFB47A41FFB98856FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF0000000000000000C7D8ACFF9DBD
      70FFC9DAB1FF000000000000000000000000CAE2F3FF57B1E8FF58B1E8FF58B1
      E8FF58B1E8FF68B7E8FF00000000A3A3A3FF4C4C4CFF909091FFD4D4D4FFD4D4
      D4FF9D9D9DFF4E4E4EFF909090FF00000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF686868FF00000000000000000000000000000000B469
      9AFFAA508CFFAB508CFFA84C8AFFAB528DFFD09EBEFFB76A9DFFA84D8AFFD3A5
      C3FFC68AB2FFA64786FFA94E8BFFAB518DFFB47A41FFB98856FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFDFF000000000000
      00000000000000000000C29669FF000000000000000000000000ABD7F3FF94CC
      EEFF00000000C4E4F8FFA5D5F4FF0000000000000000787878FF595959FF5555
      55FF717171FFDDDDDDFF0000000000000000686868FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF686868FF000000000000000000000000000000000000
      0000D0B3C6FFA74B89FFC387AFFFCB95B8FFA64888FFA94E8BFFAA508CFFA749
      88FFB36499FFD6ACC7FFB96FA0FFA74887FFB47A41FFB98856FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB98856FFB57C44FF00000000000000000000000000000000DCEE
      FAFF57B0E8FF54AFE7FF50ADE7FF5BB2E6FFB0D9F2FF00000000000000000000
      000000000000BFE0F5FFDDEEF9FF00000000686868FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF686868FF000000000000000000000000000000000000
      00000000000000000000C99DBAFFA74A88FFAB508CFFAB518DFFAB518DFFAB51
      8DFFAA4F8BFFA64786FFC180ABFFD2A3C2FFB47A41FFB98856FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB98856FFB57C44FF0000000000000000000000000000000055B1
      EAFF50ADE6FF90CBEFFFC4E3F6FFD4EAF8FFD7EBF8FFD8EBFAFFDEEFF9FFC9E4
      F4FF8EC8EDFF50ABE6FF54AFE7FF00000000B2773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFF000000000000000000000000000000000000
      000000000000000000000000000000000000B56D9DFFAB508DFFAB508DFFAB51
      8DFFAB518DFFAB518DFFA84C8AFFD4BFCDFFB47A41FFB98856FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB98856FFB57C44FF0000000000000000000000000000000087C7
      F0FFCAE5F6FF8AC8EEFF58B0E8FF4EADE6FF4EADE6FF4EADE6FF4CABE6FF65B6
      E9FF9CCFF0FFDEEFFAFF82C3EDFF00000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D2BACAFFAC578FFFAA50
      8CFFAB518DFFBF89ADFF0000000000000000B47A41FFB98856FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB98856FFB57C44FF0000000000000000000000000000000087C7
      F0FF4DABE6FF54AFE7FF57B0E7FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF56B0
      E7FF53AEE7FF4AAAE6FF9DD1F1FF00000000B57C45FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB47B44FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C79A
      B8FF00000000000000000000000000000000B47A41FFBD9061FFB98856FFB988
      56FFB98856FFB98856FFB98856FFB98856FFB98856FFB98856FFB98856FFB988
      56FFB98856FFBD9061FFB57C44FF00000000000000000000000000000000C9E4
      F6FF57B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1
      E8FF58B1E8FF57B0E8FFC3E1F4FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C09263FFB47A41FFB47A41FFB47A
      41FFB47A41FFB47A41FFB47A41FFB47A41FFB47A41FFB47A41FFB47A41FFB47A
      41FFB47A41FFB47A41FFC09163FF000000000000000000000000000000000000
      000000000000AAD7F3FF76BEE9FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF74BD
      EAFFA8D6F2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000828282FF545454FF545454FF6D6D6DFF6D6D6DFF818181FF0000
      00000000000000000000000000000000000000000000AD6C2FFFCEAE8FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000676767FF676767FF676767FF6767
      67FF676767FF676767FF676767FF676767FF676767FF676767FF676767FF6767
      67FF676767FF676767FF676767FF676767FF0000000000000000B47B44FFB377
      3DFFB3773DFFB3773DFF000000000000000000000000B3773DFFB3773DFFB377
      3DFFB67E47FF0000000000000000000000000000000000000000000000000000
      00000000000000000000E8E8E8FF545454FF6D6D6DFFE6E6E6FF000000000000
      000000000000000000000000000000000000AD6D31FFAA6524FFAA6524FFD3AC
      87FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FF0000000000000000B3773DFFB377
      3DFFB3773DFFB3773DFF000000000000000000000000B3773DFFB3773DFFB377
      3DFFB3773DFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000545454FF6D6D6DFF00000000000000000000
      000000000000000000000000000000000000D0B295FFAA6524FFAA6524FFAA65
      24FFD3AA82FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FF0000000000000000B3773DFFB377
      3DFFB3773DFFB3773DFF000000000000000000000000B3773DFFB3773DFFB377
      3DFFB3773DFF0000000000000000000000000000000000000000000000000000
      000000000000ADADADFF545454FF545454FF545454FF545454FFADADADFF0000
      00000000000000000000000000000000000000000000D5B393FFAA6524FFAA65
      24FFAA6524FFD2A87EFF0000000000000000CFAE90FFC99F76FFCBA580FFD5C1
      AEFF00000000000000000000000000000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FF0000000000000000B3773DFFB377
      3DFFB3773DFFB3773DFF000000000000000000000000B3773DFFB3773DFFB377
      3DFFB3773DFF0000000000000000000000000000000000000000000000000000
      0000545454FF545454FFDEDBD9FF0000000000000000DEDBD8FF545454FF5454
      54FF000000000000000000000000000000000000000000000000D5B596FFAA65
      24FFAA6524FFAA6524FFBF8349FFAA6524FFAA6524FFAA6524FFAA6524FFAA65
      24FFAA6626FF000000000000000000000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FF0000000000000000B3773DFFB377
      3DFFB3773DFFB3773DFF000000000000000000000000B3773DFFB3773DFFB377
      3DFFB3773DFF000000000000000000000000000000000000000000000000C2C2
      C2FF545454FF0000000000000000CAA27BFFCAA27BFF00000000000000005454
      54FFC4C4C4FF000000000000000000000000000000000000000000000000D6B7
      9AFFAA6524FFAA6524FFAA6524FFAA6524FFC48A52FFD3AA82FFCFA071FFAA65
      24FFAA6524FFAA6524FFD8BDA4FF00000000B2773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF0000000000000000B3773DFFB377
      3DFFB3773DFFB3773DFF000000000000000000000000B3773DFFB3773DFFB377
      3DFFB3773DFF0000000000000000000000000000000000000000000000005454
      54FFD8D5D3FF00000000AE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFF00000000DAD6
      D1FF545454FF0000000000000000000000000000000000000000000000000000
      0000C38D59FFAA6524FFAA6524FFF6EBE1FFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFC49568FFAA6524FFAA6524FF00000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF0000000000000000B3773DFFB377
      3DFFB3773DFFB3773DFF000000000000000000000000B3773DFFB3773DFFB377
      3DFFB3773DFF0000000000000000000000000000000000000000000000005454
      54FF00000000CAA27BFFAE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFFCAA27BFF0000
      0000545454FF0000000000000000000000000000000000000000000000000000
      0000AA6524FFAA6524FFF5E9DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB77D46FFAA6524FFC19A73FFAF763FFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB0763FFF0000000000000000B3773DFFB377
      3DFFB3773DFFB3773DFF000000000000000000000000B3773DFFB3773DFFB377
      3DFFB3773DFF0000000000000000000000000000000000000000000000005454
      54FF00000000AC6C2EFFAE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFF0000
      0000545454FF000000000000000000000000000000000000000000000000D1B5
      9AFFAA6524FFC2864BFFFDFDFDFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFFDFDFDFFEBD6C2FFAA6524FFB0733AFF686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FF0000000000000000B3773DFFB377
      3DFFB3773DFFB3773DFF000000000000000000000000B3773DFFB3773DFFB377
      3DFFB3773DFF0000000000000000000000000000000000000000000000005454
      54FF00000000AE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFF0000
      0000545454FF000000000000000000000000000000000000000000000000CBA5
      81FFAA6524FFD1A479FFFDFDFDFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFFDFDFDFFF9F2ECFFAA6524FFAA6524FF686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FF0000000000000000B3773DFFB377
      3DFFB3773DFFB3773DFF000000000000000000000000B3773DFFB3773DFFB377
      3DFFB3773DFF0000000000000000000000000000000000000000000000000000
      000000000000AE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFF0000
      000000000000000000000000000000000000000000000000000000000000CEAD
      8DFFAA6524FFCB9865FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF2E5D9FFAA6524FFAC6A2CFF686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FF0000000000000000B3773DFFB377
      3DFFB3773DFFB3773DFF000000000000000000000000B3773DFFB3773DFFB377
      3DFFB3773DFF0000000000000000000000000000000000000000000000000000
      000000000000AE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AA6524FFAA6524FFFDFDFDFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFFDFDFDFFD5A97EFFAA6524FFB98858FF686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FF0000000000000000B3773DFFB377
      3DFFB3773DFFB3773DFF000000000000000000000000B3773DFFB3773DFFB377
      3DFFB3773DFF0000000000000000000000000000000000000000000000000000
      000000000000AE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AE7034FFAA6524FFBD8956FFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFF0DECCFFAA6524FFAA6524FFD5C1AEFFB2773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF0000000000000000B3773DFFB377
      3DFFB3773DFFB3773DFF000000000000000000000000B3773DFFB3773DFFB377
      3DFFB3773DFF0000000000000000000000000000000000000000000000000000
      000000000000B07339FFAE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFFAE7136FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AA6524FFAA6524FFB27339FFE6CDB5FFF4E9DFFFF0E0D1FFD3A5
      79FFAA6524FFAA6524FFC18953FF00000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF0000000000000000B67E49FFB377
      3DFFB3773DFFB3773DFF000000000000000000000000B3773DFFB3773DFFB377
      3DFFB67E49FF0000000000000000000000000000000000000000000000000000
      000000000000CBA57DFFAE6D2FFFAE6D2FFFAE6D2FFFAE6D2FFFCAA37BFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AA6524FFAA6524FFAA6524FFAA6524FFAA6524FFAA65
      24FFAA6524FFC28A55FF0000000000000000B57C45FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB47B44FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CAA37BFFAF7135FFAF7035FFCAA27BFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6A585FFB47C48FFAD6C2FFFAF7136FFBB8D
      5FFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005C5C
      5CFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000095C6
      E4FF77BCE6FF68B6E7FF87C1E5FF000000005C5C5CFF919191FF777777FF5C5C
      5CFF7A7A7AFF7D7D7DFF5C5C5CFF00000000D2D2D2FF818181FF7A7A7AFF7A7A
      7AFF7A7A7AFF7A7A7AFF7A7A7AFF7A7A7AFF7A7A7AFF7A7A7AFF7A7A7AFF7A7A
      7AFF7A7A7AFF7A7A7AFF818181FFD2D2D2FF0000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000007BBDE6FF58B1E8FF58B1
      E8FF58B1E8FF58B1E8FF88C1E5FF00000000828282FF5C5C5CFF5C5C5CFF5C5C
      5CFF5C5C5CFF5C5C5CFF949494FF00000000818181FFE3E3E3FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFE3E3E3FF818181FF0000000000000000000000000000
      0000000000FF000000FF00000000000000000000000000000000840000FF8400
      00FF840000FF0000000000000000000000000000000000000000000000000000
      0000000000FF000000FF00000000000000000000000000000000840000FF8400
      00FF840000FF00000000000000000000000085C0E5FF58B1E8FF58B1E8FF58B1
      E8FF58B1E8FF68B6E7FF00000000000000007E7E7EFF5C5C5CFF838383FF0000
      0000858585FF5C5C5CFF787878FF00000000777777FFFEFEFEFFFBFBFBFFFDFD
      FDFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
      FBFFFBFBFBFFFBFBFBFFFDFDFDFF777777FF000000FF00000000000000000000
      0000000000FF000000FF00000000000000000000000000000000840000FF8400
      00FF840000FF000000000000000000000000000000FF00000000000000000000
      0000000000FF000000FF00000000000000000000000000000000840000FF8400
      00FF840000FF00000000000000000000000058B1E8FF58B1E8FF58B1E8FF58B1
      E8FF58B1E8FF77BCE6FF000000005E5E5EFF5C5C5CFF5C5C5CFF000000000000
      0000000000005C5C5CFF5C5C5CFF5C5C5CFF777777FFFEFEFEFF4B4B4BFFFDFD
      FDFFAAAAAAFFC6C6C6FF676767FFE5E5E5FFA5A5A5FF8C8C8CFFDCDCDCFF7272
      72FFFBFBFBFF4C4C4CFFFDFDFDFF777777FF000000FF000000FF000000000000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000000000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000058B1E8FF58B1E8FF58B1E8FF58B1
      E8FF58B1E8FF68B6E7FF00000000000000007E7E7EFF5C5C5CFF787878FF0000
      00007A7A7AFF5C5C5CFF828282FF00000000777777FFFEFEFEFF4B4B4BFFFDFD
      FDFF9C9C9CFFFEFEFEFF7A7A7AFFECECECFF9E9E9EFF7C7C7CFFDBDBDBFF4C4C
      4CFFFBFBFBFF4C4C4CFFFDFDFDFF777777FF000000FF000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000840000FF8400
      00FF840000FF000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000840000FF8400
      00FF840000FF00000000000000000000000058B1E8FF58B1E8FF58B1E8FF58B1
      E8FF58B1E8FF58B1E8FF83BFE5FF000000009A9A9AFF5C5C5CFF5C5C5CFF5C5C
      5CFF5C5C5CFF5C5C5CFF767676FF00000000777777FFFEFEFEFF4B4B4BFFFDFD
      FDFFFEFEFEFFE9E9E9FFFEFEFEFFE9E9E9FFFDFDFDFFE8E8E8FFEBEBEBFFFDFD
      FDFFFBFBFBFF4C4C4CFFFDFDFDFF777777FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000840000FF8400
      00FF840000FF000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000840000FF8400
      00FF840000FF00000000000000000000000058B1E8FF58B1E8FF58B1E8FF58B1
      E8FF58B1E8FF58B1E8FF74BBE6FF000000005C5C5CFF7B7B7BFF898989FF5C5C
      5CFF7D7D7DFF9D9D9DFF5C5C5CFF00000000777777FFFEFEFEFF4C4C4CFFFDFD
      FDFF525252FFF8F8F8FF505050FF505050FFF8F8F8FF505050FFF5F5F5FF4A4A
      4AFFFBFBFBFF4C4C4CFFFDFDFDFF777777FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000000000008400
      00FF840000FF840000FF0000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000000000008400
      00FF840000FF840000FF000000000000000058B1E8FF58B1E8FF58B1E8FF58B1
      E8FF58B1E8FF58B1E8FF58B1E8FFA9CDE3FF0000000000000000000000005C5C
      5CFF00000000000000000000000000000000777777FFFEFEFEFF4C4C4CFFFDFD
      FDFF525252FFF8F8F8FF505050FF505050FFF8F8F8FF505050FFF5F5F5FF4A4A
      4AFFFBFBFBFF4A4A4AFFFDFDFDFF777777FF000000FF000000FF000000FF0000
      00FF000000FF000000FF00000000000000000000000000000000000000000000
      0000840000FF840000FF840000FF00000000000000FF000000FF000000FF0000
      00FF000000FF000000FF00000000000000000000000000000000000000000000
      0000840000FF840000FF840000FF0000000058B1E8FF58B1E8FF58B1E8FF58B1
      E8FF58B1E8FF58B1E8FF58B1E8FF58B1E7FF80BEE5FF87C1E5FF000000000000
      000000000000000000000000000000000000777777FFFEFEFEFF4C4C4CFFFDFD
      FDFF525252FFF8F8F8FF505050FF505050FFF8F8F8FF505050FFF5F5F5FF4A4A
      4AFFFBFBFBFF4A4A4AFFFDFDFDFF777777FF000000FF000000FF000000FF0000
      00FF000000FF0000000000000000840000FF840000FF840000FF000000000000
      000000000000840000FF840000FF840000FF000000FF000000FF000000FF0000
      00FF000000FF0000000000000000840000FF840000FF840000FF000000000000
      000000000000840000FF840000FF840000FF58B1E8FF58B1E8FF58B1E8FF58B1
      E8FF58B1E7FF60B4E7FF65B5E7FF61B4E7FF59B1E7FF58B1E8FF66B6E7FF78BC
      E6FF6AB7E7FF000000000000000000000000767676FFFEFEFEFF4C4C4CFFFDFD
      FDFF525252FFF8F8F8FF505050FF505050FFF8F8F8FF505050FFF5F5F5FF4A4A
      4AFFFBFBFBFF4A4A4AFFFDFDFDFF777777FF000000FF000000FF000000FF0000
      00FF000000000000000000000000840000FF840000FF840000FF000000000000
      000000000000840000FF840000FF840000FF000000FF000000FF000000FF0000
      00FF000000000000000000000000840000FF840000FF840000FF000000000000
      000000000000840000FF840000FF840000FF58B1E8FF78BCE6FFA8CDE3FF0000
      0000000000000000000000000000000000000000000000000000ACCEE3FF7DBE
      E6FF58B1E8FF000000000000000000000000767676FFFEFEFEFF4C4C4CFFFDFD
      FDFF525252FFF8F8F8FF505050FF505050FFF8F8F8FF505050FFF5F5F5FF4A4A
      4AFFFBFBFBFF4A4A4AFFFDFDFDFF777777FF000000FF000000FF000000FF0000
      0000000000000000000000000000840000FF840000FF840000FF000000000000
      000000000000840000FF840000FF840000FF000000FF000000FF000000FF0000
      0000000000000000000000000000840000FF840000FF840000FF000000000000
      000000000000840000FF840000FF840000FFBDD4E2FFBBD3E2FF8FC4E5FF73BA
      E6FF61B4E7FF58B1E7FF58B1E8FF58B1E7FF61B4E7FF72BAE6FF8DC3E5FFB7D2
      E3FFBCD4E2FF000000000000000000000000767676FFFDFDFDFFFBFBFBFFFBFB
      FBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
      FBFFFBFBFBFFFBFBFBFFFDFDFDFF777777FF000000FF000000FF000000000000
      000000000000000000000000000000000000840000FF840000FF840000FF8400
      00FF840000FF840000FF840000FF00000000000000FF000000FF000000000000
      000000000000000000000000000000000000840000FF840000FF840000FF8400
      00FF840000FF840000FF840000FF0000000091C4E5FF58B1E8FF58B1E8FF58B1
      E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1
      E8FF86C1E5FF000000000000000000000000878787FFDBDBDBFFFBFBFBFFFBFB
      FBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFBFBFFFBFB
      FBFFFBFBFBFFFBFBFBFFDBDBDBFF878787FF000000FF00000000000000000000
      00000000000000000000000000000000000000000000840000FF840000FF8400
      00FF840000FF840000FF0000000000000000000000FF00000000000000000000
      00000000000000000000000000000000000000000000840000FF840000FF8400
      00FF840000FF840000FF000000000000000085C0E5FF58B1E8FF58B1E8FF58B1
      E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1
      E8FF7ABDE6FF000000000000000000000000D9D9D9FF898989FF797979FF7979
      79FF797979FF797979FF797979FF797979FF797979FF797979FF797979FF7979
      79FF797979FF797979FF898989FFDADADAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AECFE3FF85C0E5FF6AB7
      E7FF5BB2E7FF58B1E8FF58B1E8FF58B1E8FF5AB1E7FF69B7E7FF83C0E5FFABCD
      E3FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000329FE2FF89C6EDFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C4A587FFBA90
      67FFCAB19AFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D4B595FFBF8E5DFFB47A42FFB47B43FFBF8F5FFFD5B597FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C09162FFBB8854FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A3D3F1FF2298E1FF3CA3E3FF00000000000000000000
      00000000000000000000000000000000000000000000A86A30FF954300FF9543
      00FF954300FFB98F65FF0000000000000000CAB199FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000D4B3
      93FFAD6E30FFAD6C2DFFAD6C2DFFAD6C2DFFAD6C2DFFAD6C2DFFAD6C2DFFAD6F
      32FFD6B89AFF00000000000000000000000000000000909090FF525252FF5252
      52FF525252FF0000000000000000BF8F5EFFAC6A2BFFB9844FFFF1E6DDFFC895
      64FFC58E58FFE0C3A7FF00000000000000000000000000000000000000000000
      0000000000006D6D6DFFC7C7C7FF82C4ECFF2298E1FF2397DFFF83C4ECFF0000
      000000000000000000000000000000000000BA8F66FF954300FF000000000000
      0000C4A688FF954300FFB98F65FFCEBBA8FF954300FFC7AB90FF000000000000
      0000000000000000000000000000000000000000000000000000C69B6FFFAD6C
      2DFFAD6C2DFFAD6C2DFFAD6C2DFFBB8751FFB8824CFFAD6C2DFFAD6C2DFFAD6C
      2DFFAD6C2DFFC9A176FF000000000000000000000000525252FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000BD8B5AFFAC6A2BFFAC6A2BFFAC6A
      2BFFAB6A2EFFAC6A2BFFAC6A2BFF000000000000000000000000000000000000
      0000000000006D6D6DFF7D7D7DFF0000000037A1E2FF2298E1FF2298E1FF319E
      E1FFCDE6F6FF000000000000000000000000954300FFBE9873FF000000000000
      000000000000C6A98EFF954300FFB98F65FFC9B097FF954300FFC7AA8FFF0000
      00000000000000000000000000000000000000000000D3B293FFAD6C2DFFAD6C
      2DFFAD6C2DFFAD6C2DFFB3793FFFFFFFFFFFFCFAF7FFAD6C2DFFAD6C2DFFAD6C
      2DFFAD6C2DFFAD6C2DFFD6B89AFF0000000000000000525252FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFF00000000F0E5DBFFAC6A2BFFCFAE8EFFFCFC
      FCFFFFFFFFFFEDE5DCFFAC6A2BFFCBA176FF0000000000000000000000000000
      0000000000006C6C6CFFE9E9E9FF00000000000000002698DFFF2298E1FF2298
      E1FF2799E0FF6AB8E9FF0000000000000000954300FFC09C79FF000000000000
      00000000000000000000C7AC92FF954300FFB98F65FFC9B098FF954300FFC7AA
      8FFF00000000000000000000000000000000F2EAE2FFAD6E30FFAD6C2DFFAD6C
      2DFFAD6C2DFFAD6C2DFFB07237FFEFE2D6FFEADACBFFAD6C2DFFAD6C2DFFAD6C
      2DFFAD6C2DFFAD6C2DFFAE6F33FF0000000000000000525252FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000C59461FFAC6A2BFFFCFCFCFFFCFC
      FCFFFCFCFCFFFCFCFCFFB98E63FFAF6C2CFF0000000000000000000000000000
      0000000000006D6D6DFF000000002C9BE0FF2298E1FF2298E1FF2298E1FF2298
      E1FF2298E1FF2298E1FF2598DFFF00000000C9AF96FF954300FFCDB8A4FF0000
      0000C09D7AFF0000000000000000C9AF96FF954300FFB98F65FFC9B098FF9543
      00FFC6AA8EFF000000000000000000000000D2B190FFAD6C2DFFAD6C2DFFAD6C
      2DFFAD6C2DFFAD6C2DFFAE6E30FFAD6C2DFFAD6C2DFFAD6C2DFFAD6C2DFFAD6C
      2DFFAD6C2DFFAD6C2DFFAD6C2DFFD5B799FF00000000525252FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000C18D56FFAC6A2BFFFFFFFFFFFCFC
      FCFFFFFFFFFFFFFFFFFFBE9973FFAF6C2CFF0000000000000000000000000000
      0000000000006D6D6DFF939393FF0000000052ADE6FF2298E1FF2298E1FF2298
      E1FF36A0E2FF00000000000000000000000000000000C7AC92FF954300FFCDB8
      A4FFBB9269FF954300FF0000000000000000CAB29BFF954300FFB98F65FFCAB1
      99FF954300FFC6A98EFF0000000000000000BC8A58FFAD6C2DFFAD6C2DFFAD6C
      2DFFAD6C2DFFAD6C2DFFAE6F31FFFCFBF8FFFCFAF7FFB3773DFFAD6C2DFFAD6C
      2DFFAD6C2DFFAD6C2DFFAD6C2DFFC0905FFF00000000525252FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFF00000000DEC2A7FFAC6A2BFFE8DBCFFFFCFC
      FCFFFFFFFFFFF6F6F6FFAC6A2BFFBE8955FF0000000000000000000000000000
      0000000000006D6D6DFF6D6D6DFFDDDDDDFF000000002298E1FF2298E1FF2298
      E1FF2298E1FF2298E1FFACD7F2FF000000000000000000000000C7AC92FF9543
      00FFCDB8A4FFBA9168FF954300FF0000000000000000CBB49EFF954300FFBC95
      6EFFCAB19AFF954300FFC6A98DFF00000000B2763DFFAD6C2DFFAD6C2DFFAD6C
      2DFFAD6C2DFFAD6C2DFFAD6C2DFFDEC5AEFFFFFFFFFFF3E9E1FFB8814BFFAD6C
      2DFFAD6C2DFFAD6C2DFFAD6C2DFFB57C45FF00000000525252FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFF0000000000000000AB6A2CFFAC6A2BFFB889
      5AFFBD976EFFAC6A2BFFAC6A2BFF000000000000000000000000000000000000
      0000929292FF6D6D6DFF6D6D6DFFC6C6C6FFD2D2D2FF000000002298E1FF2298
      E1FF2298E1FF2298E1FF2298E1FF50ACE5FF000000000000000000000000C7AC
      92FF954300FFCDB8A4FFBB936BFF954300FF0000000000000000C6AA8EFF9543
      00FF00000000CAB19AFF954300FFC7AC91FFB1763CFFAD6C2DFFAD6C2DFFAD6C
      2DFFAD6C2DFFAD6C2DFFAD6C2DFFAF6F32FFE4D0BCFFFFFFFFFFF7F2EEFFB57C
      44FFAD6C2DFFAD6C2DFFAD6C2DFFB57B44FF00000000525252FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF0000000000000000CCA47CFFAC6A
      2BFFAC6A2BFFBC8A55FF0000000000000000000000000000000000000000AAAA
      AAFF6D6D6DFF6D6D6DFF6D6D6DFF858585FFE7E7E7FFE2E2E2FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C7AC92FF954300FFCDB8A4FFBC956EFF954300FFC9AF96FFB6885BFF9543
      00FF0000000000000000C19F7DFF954300FFBB8855FFAD6C2DFFAD6C2DFFAD6C
      2DFFC08F5EFFCFAA87FFB67E47FFAD6C2DFFAD6D2EFFE5D1BEFFFFFFFFFFD6B6
      98FFAD6C2DFFAD6C2DFFAD6C2DFFBE8E5DFF00000000525252FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFDFF00000000000000000000
      0000000000000000000000000000000000000000000000000000C5C5C5FF6C6C
      6CFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFFC9C9C9FFDEDEDEFF8D8D8DFFD4D4
      D4FF000000000000000000000000000000000000000000000000000000000000
      000000000000C7AC92FF954300FFCDB8A4FFBE9974FF954300FF954300FF0000
      0000000000000000000000000000954300FFD0AD8BFFAD6C2DFFAD6C2DFFAD6C
      2DFFDCC2A8FFFFFFFFFFDEC5ADFFAD6C2DFFAD6C2DFFE0C8B1FFFFFFFFFFD9BC
      A0FFAD6C2DFFAD6C2DFFAD6C2DFFD3B392FF00000000525252FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFF525252FF00000000000000000000000000000000DBDBDBFF6F6F6FFF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF808080FFFCFCFCFFCECECEFF7070
      70FFDFDFDFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000C7AC92FF954300FFCDB8A4FF00000000000000000000
      00000000000000000000BA9168FF954300FFF0E7DEFFAC6C2EFFAD6C2DFFAD6C
      2DFFBB8753FFFCFAF8FFFFFFFFFFF0E4D8FFF1E6DBFFFFFFFFFFFDFCFBFFBC88
      54FFAD6C2DFFAD6C2DFFAD6E30FF0000000000000000525252FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFF525252FF00000000000000000000000000000000787878FF6D6D6DFF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFFC3C3C3FFFFFFFFFFB9B9
      B9FF7B7B7BFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C7AC92FF954300FFCDB8A4FF000000000000
      00000000000000000000954300FFC4A688FF00000000CFAD8AFFAD6C2DFFAD6C
      2DFFAD6C2DFFBF8E5DFFEADACBFFFDFBFAFFFDFBFAFFEADACBFFC19162FFAD6C
      2DFFAD6C2DFFAD6C2DFFD3B191FF0000000000000000525252FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFF525252FF000000000000000000000000898989FF6D6D6DFF6D6D6DFF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF7B7B7BFFFAFAFAFFFEFE
      FEFF9F9F9FFF8C8C8CFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000C7AC92FF954300FFC3A486FF0000
      0000BC946DFF954300FFB17C4AFF000000000000000000000000C19365FFAD6C
      2DFFAD6C2DFFAD6C2DFFAD6C2DFFAD6C2EFFAD6C2DFFAD6C2DFFAD6C2DFFAD6C
      2DFFAD6C2DFFC4986BFF000000000000000000000000525252FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFF525252FF0000000000000000000000006D6D6DFF6D6D6DFF6D6D6DFF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6F6F6FFF6F6F
      6FFF6D6D6DFF6D6D6DFFB6B6B6FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C9AF96FF954300FF9543
      00FF954300FFC3A486FF0000000000000000000000000000000000000000CEA9
      85FFAB6B2DFFAD6C2DFFAD6C2DFFAD6C2DFFAD6C2DFFAD6C2DFFAD6C2DFFAC6C
      2EFFD0AD8BFF00000000000000000000000000000000525252FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFD
      FDFF525252FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFE4D9FFCEA985FFB9834DFFAE7034FFAF7135FFB9844FFFCFAD8AFFF0E6
      DDFF0000000000000000000000000000000000000000909090FF525252FF5252
      52FF525252FF525252FF525252FF525252FF525252FF525252FF525252FF5252
      52FF909090FF0000000000000000000000004157CDFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF4157CDFF0000000000000000000000000000
      00000000000000000000000000000000000000000000D2BEABFFB6814CFFB174
      39FFB07135FFB17339FFB6804BFFD3C1B0FF8BC2DDFF50ABD7FF50ABD7FF50AB
      D7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50AB
      D7FFFFFFFFFFB9E9FCFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF0000000000000000000000000000
      000000000000939393FF797979FF888888FF00000000B37436FFB07135FFB071
      35FFB07135FFB07135FFB07135FFB07135FF50ABD7FF50ABD7FF50ABD7FF50AB
      D7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50AB
      D7FFFFFFFFFF50ABD7FF90C4DEFFFFFFFFFFB57C45FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB67E49FF00000000B57D47FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB57D47FF00000000324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFFF9FAFDFFFAFBFDFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF0000000000000000000000008686
      86FF606060FF616161FF7D7D7DFF919191FF00000000B67C42FFB07135FFB071
      35FFB07135FFB07135FFB07135FFB7824EFF50ABD7FF50ABD7FF50ABD7FF50AB
      D7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50AB
      D7FFFFFFFFFF50ABD7FF50ABD7FFFFFFFFFFB3773DFFB47940FFC08F5EFFB377
      3DFFC19262FFB47940FFB3773EFF00000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFF00000000324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFFF9FAFDFFFAFBFDFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF0000000000000000727272FF6060
      60FFA3A3A3FFEFEFEFFFFFFFFFFFFFFFFFFFEBEBEBFF00000000B07135FFB378
      41FF00000000B6814CFFB07135FF0000000050ABD7FF50ABD7FF50ABD7FF50AB
      D7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50AB
      D7FFFFFFFFFF50ABD7FF50ABD7FF71B9DCFFB3773DFFC19262FFF8F3EEFFD6B6
      97FFF8F3EEFFC08F5EFFB3773EFF00000000B3773DFFECDED0FFFFFFFFFFFFFF
      FFFFFFFFFFFFECDED0FFB3773DFF00000000324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFFF9FAFDFFFAFBFDFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF00000000828282FF606060FFC2C2
      C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCFF00000000000000000000
      0000C5A280FF00000000000000000000000050ABD7FF50ABD7FF50ABD7FF50AB
      D7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50AB
      D7FFFFFFFFFF50ABD7FF50ABD7FF50ABD7FFB3773DFFB3773DFFD7B89AFFFFFF
      FFFFD4B292FFB3773DFFB3773EFF00000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFF00000000324BCCFF324BCCFF324BCCFF324B
      CCFFF9FAFDFFF9FAFDFFF9FAFDFFF9FAFDFFF9FAFDFFF9FAFDFFF9FAFDFFFAFB
      FDFF324BCCFF324BCCFF324BCCFF324BCCFFBBBBBBFF606060FF9D9D9DFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000D3BCA6FFB071
      35FFB07135FFB07135FFCCAE91FF0000000050ABD7FF50ABD7FF50ABD7FF50AB
      D7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50ABD7FF50AB
      D7FFFFFFFFFF50ABD7FF50ABD7FF50ABD7FFB3773DFFC19262FFF8F3EEFFD5B5
      96FFF8F3EEFFBF8D5CFFB3773EFF00000000B3773DFFECDED0FFFFFFFFFFFFFF
      FFFFFFFFFFFFECDED0FFB3773DFF00000000324BCCFF324BCCFF324BCCFF324B
      CCFFF9FAFDFFFAFBFDFFFAFBFDFFFAFBFDFFFAFBFDFFF9FAFDFFFAFBFDFFFAFB
      FDFF324BCCFF324BCCFF324BCCFF324BCCFF8B8B8BFF606060FFEAEAEAFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF00000000BA7E43FFB071
      35FFB07135FFB07135FFB37436FF0000000050ABD7FF50ABD7FF50ABD7FF50AB
      D7FF50ABD7FFFFFFFFFFFFFFFFFFFFFFFFFF50ABD7FF50ABD7FF50ABD7FF50AB
      D7FFFFFFFFFF50ABD7FF50ABD7FF50ABD7FFB3773DFFB47940FFC08F5EFFB377
      3DFFC0905FFFB3783EFFB3773EFF00000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFF00000000324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFFF9FAFDFFFAFBFDFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF6E6E6EFF787878FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFEFFF1E7DDFFF3EAE2FF00000000C29464FFB071
      35FFB07135FFB07135FFBA8550FF0000000050ABD7FF50ABD7FF50ABD7FF50AB
      D7FF50ABD7FFFFFFFFFFFFFFFFFFFFFFFFFF50ABD7FF50ABD7FF50ABD7FF50AB
      D7FFFFFFFFFF50ABD7FF50ABD7FF50ABD7FFB57D46FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB6804AFF00000000B67E47FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB67E47FF00000000324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFFF9FAFDFFFAFBFDFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF646464FF888888FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF5ECE5FFAF7033FFAF7033FFC8A98CFF00000000B680
      4BFFB07135FFB37841FF000000000000000050ABD7FF50ABD7FF50ABD7FF50AB
      D7FF50ABD7FFFFFFFFFFFFFFFFFFFFFFFFFF50ABD7FF50ABD7FF50ABD7FF50AB
      D7FFFFFFFFFF50ABD7FF50ABD7FF50ABD7FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFFF9FAFDFFFAFBFDFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF6C6C6CFF7C7C7CFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFF7F0EAFFAF7033FFF3EBE2FFFCFBFAFFEDEDEDFF0000
      00000000000000000000B7B7B7FF0000000050ABD7FF50ABD7FF50ABD7FF50AB
      D7FF50ABD7FFFFFFFFFFFFFFFFFFFFFFFFFF50ABD7FF50ABD7FF50ABD7FF50AB
      D7FFFFFFFFFF50ABD7FF50ABD7FF50ABD7FFB57D47FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB7814BFF00000000B67E49FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB67E49FF00000000324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF858585FF626262FFF1F1F1FFFFFF
      FFFFFFFFFFFFFFFFFFFFFCFBF9FFAF7135FFFDFDFCFFFFFFFFFFFFFFFFFFFCFC
      FCFFEBEBEBFF6B6B6BFF888888FF0000000050ABD7FF50ABD7FF50ABD7FF50AB
      D7FF50ABD7FFFFFFFFFFFFFFFFFFFFFFFFFF50ABD7FF50ABD7FF50ABD7FF50AB
      D7FFFFFFFFFF50ABD7FF50ABD7FF50ABD7FFB3773DFFB3773DFFB47940FFEADB
      CBFFB3773DFFB3773DFFB3773EFF00000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFF000000003D54CDFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF3D54CDFFB1B1B1FF606060FFADADADFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8753FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFAAAAAAFF606060FFB4B4B4FF00000000FEFEFEFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB2E7FFFF50ABD7FF50ABD7FFB3773DFFB3773DFFB47A41FFFDFC
      FAFFB3773DFFB3773DFFB3773EFF00000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFF00000000000000000000000000000000B0B0
      B0FFB0B0B0FF000000000000000000000000000000000000000000000000B0B0
      B0FFB0B0B0FF00000000000000000000000000000000767676FF636363FFD6D6
      D6FFFFFFFFFFFFFFFFFFFFFFFFFFD2B08EFFFFFFFFFFFFFFFFFFFFFFFFFFD4D4
      D4FF626262FF787878FF0000000000000000C2E9F8FF69BBE2FF52AEDBFF52AE
      DBFF69BBE2FFC1F0FFFFFFFFFFFFFFFFFFFFD7FFFFFF50ABD7FF50ABD7FF50AB
      D7FF50ABD7FFE2FFFFFF50ABD7FF50ABD7FFB3773DFFECDED0FFFDFBFAFFFEFE
      FEFFFDFBFAFFE9D7C6FFB3773EFF00000000B3773DFFEBDBCCFFFDFBFAFFFDFB
      FAFFFDFBFAFFEBDBCCFFB3773DFF000000000000000000000000000000006767
      67FF676767FF0000000000000000000000000000000000000000000000006767
      67FF676767FF0000000000000000000000000000000000000000686868FF6565
      65FFBCBCBCFFFCFCFCFFFFFFFFFFFAF6F1FFFFFFFFFFFBFBFBFFBABABAFF6464
      64FF6A6A6AFF000000000000000000000000FFFFFFFFA6CCDEFF5AB1DBFF52AE
      DBFF52AEDBFF52AEDBFF55B0DBFFBCEEFFFFFFFFFFFF90D3F4FF50ABD7FF50AB
      D7FF50ABD7FF50ABD7FFDCFFFFFF50ABD7FFB3773DFFB47940FFB67D46FFFDFC
      FAFFB47A41FFB47940FFB3773EFF00000000B3773DFFB47940FFB47A41FFB47A
      41FFB47A41FFB47940FFB3773DFF000000000000000000000000000000007979
      79FF676767FF676767FF676767FF676767FF676767FF676767FF676767FF6767
      67FF797979FF0000000000000000000000000000000000000000000000007373
      73FF606060FF6E6E6EFF989898FFA6A6A6FF979797FF6D6D6DFF606060FF7575
      75FF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF87C1
      DDFF55AFDBFF55AFDBFF55AFDBFF55AFDBFF7BC5EAFFFEFEFEFFA3DEFCFF50AB
      D7FF50ABD7FF50ABD7FF50ABD7FFD9FEFEFFB3773DFFB3773DFFB47940FFECDE
      D0FFB3773DFFB3773DFFB3773EFF00000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFF000000000000000000000000000000000000
      0000797979FF676767FF676767FF676767FF676767FF676767FF676767FF7979
      79FF000000000000000000000000000000000000000000000000000000000000
      0000ADADADFF7E7E7EFF656565FF606060FF656565FF808080FFAEAEAEFF0000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB57B44FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB67E48FF00000000B57D46FFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB57C45FF000000000000000000000000000000000000
      00000000000000000000005100FF005100FF005100FF005100FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000309EE1FF7BBAE1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006C6C6CFF525252FF5050
      50FF656565FFBABABAFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000005100FF5C976CFF5B9F80FF449E57FF23AF40FF005100FF0051
      00FF005100FF0000000000000000000000000000000000000000000000000000
      0000000000000000000093C3E1FF2298E1FF3AA1E1FF00000000000000000000
      000000000000000000000000000000000000656565FF686868FF686868FF6868
      68FF686868FF757575FF000000008B8B8BFF4D4D4DFFA5A5A5FFE2E2E2FFE6E6
      E6FFB1B1B1FF515151FF777777FF00000000C19161FFAA6624FFAA6624FFAA66
      24FFAA6624FFAA6624FFAA6624FFAA6624FFAA6624FFAA6624FFAA6624FFAA66
      24FFAA6624FFAA6624FFAA6624FFC39465FF0000000000000000000000000000
      0000005100FF62C45DFF2A4E4EFF393FDCFF404491FF5F71B6FF718B9CFF54A1
      83FF4BC172FF005100FF005100FF005100FF0000000000000000000000000000
      0000000000006D6D6DFFB6B6B6FF76B8E1FF2298E1FF2498E1FF76B8E1FF0000
      000000000000000000000000000000000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFCDCDCDFF000000004C4C4CFFE1E1E1FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF5F5F5FF515151FFB9B9B9FFAB6A29FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA86423FF0000000000000000000000000051
      00FF63C063FF008200FF08671DFF142E5DFF0B1039FF283ABDFF26246FFF5052
      DEFF5D6384FF69C076FF5FBB7DFF014B02FF0000000000000000000000000000
      0000000000006D6D6DFF7B7B7BFF00000000359FE1FF2298E1FF2298E1FF309D
      E1FF00000000000000000000000000000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFEFEFEFF00000000707070FF9A9A9AFFFFFFFFFFFFFFFFFFFDFDFDFFFCFB
      F8FFFFFFFFFFFFFFFFFFB8B9BAFF646464FFAB6A29FFFFFFFFFFBF8E5DFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA86423FF0000000000000000005100FF62CF
      62FF008200FF15841AFF1EA539FF119C2CFF118C2FFF10672CFF0D3F25FF1437
      57FF19352DFF428C51FF2E4B30FF014B02FF0000000000000000000000000000
      0000000000006D6D6DFF0000000000000000000000002699E1FF2298E1FF2298
      E1FF279AE1FF61B0E1FF0000000000000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFCFCFCFF000000005A5A5AFFD0D0D0FFFFFFFFFFFFFFFFFF9D510AFF9D51
      0AFF9D510AFFD1BEABFFD1BEABFF4F5053FFAA6929FFFCFBFAFFA35B16FFD6B9
      9CFFF2ECE3FFC19464FFC69A6FFFD8BCA0FFD3B593FFC3966BFFC4996BFFC499
      6CFFC4996CFFC4996CFFC79D72FFAC6C2DFF00000000005100FF4CC04DFF0082
      00FF4AC14EFFA0F2AAFF77D182FF57C068FF39B04FFF22A43AFF15A130FF129C
      2DFF138B34FF12722EFF105620FF014B02FF0000000000000000000000000000
      0000000000006E6E6EFF000000002C9CE1FF2298E1FF2298E1FF2298E1FF2298
      E1FF2298E1FF2298E1FF2699E1FF00000000686868FFB0B0B0FF999999FF9999
      99FF9F9F9FFF000000005D5D5DFFCECECEFFFFFFFFFFFFFFFFFF9D510AFFE7D6
      C5FFF2E9E0FFF2E9E0FFE9EAEBFF4F4F4FFFAA6A29FFFFFFFFFFDEC4ABFFA159
      13FFF1E9E0FFFFFFFFFFFFFFFFFFE4CFBBFFF4ECE6FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA86423FF005100FF3CB63CFF008200FF57C7
      59FFBAFFC0FFA6F8B1FF9AF4AAFF8FF0A3FF79E591FF66DA81FF51CF6FFF33B1
      4DFF1EA137FF0F8F25FF0B630EFF000000000000000000000000000000000000
      0000000000006D6D6DFF8C8C8CFF000000004CA8E1FF2298E1FF2298E1FF2298
      E1FF349FE1FF000000000000000000000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFF00000000737373FF909090FFFFFFFFFFFFFFFFFF9D510AFFF2E9
      E0FFFFFFFFFFFFFFFFFFADADADFF686868FFAA6A29FFFFFFFFFFFFFFFFFFBF8F
      5DFFAC6E30FFFFFFFFFFFAF7F4FFA6621FFFAB6B2DFFFCFBFAFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA86423FF005100FF008200FF6AD06BFFC7FF
      CAFFB2FBB7FFA7F7B0FF9AF2A6FF8CED9DFF7CE692FF6CE088FF5DDD80FF4FD9
      75FF0B630EFF0B630EFF00000000000000000000000000000000000000000000
      0000000000006D6D6DFF6D6D6DFFD1D1D1FF000000002298E1FF2298E1FF2298
      E1FF2298E1FF2298E1FF9AC6E1FF00000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFC1C1C1FF000000004C4C4CFFD2D2D2FFFFFFFFFFD1BEABFFF2E9
      E0FFFFFFFFFFE9E9E9FF4E4E4EFF00000000AA6929FFFFFFFFFFFEFEFEFFFFFF
      FFFFAA6828FFC99F74FFBD8A58FFB77D47FFB47942FFB47A42FFFFFFFFFFFDFB
      FBFFFCF9F7FFFCF9F7FFFFFFFFFFA96524FF005100FF31B832FFDAFFDDFFD0FF
      D1FFC7FFCBFFB1FCB8FF9EF3AAFF91EEA1FF81E796FF7AED96FF5EDA7CFF0B63
      0EFF000000000000000000000000000000000000000000000000000000000000
      00008C8C8CFF6D6D6DFF6D6D6DFFC6C6C6FFC0C0C0FF000000002298E1FF2298
      E1FF2298E1FF2298E1FF2298E1FF4AA7E1FF686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFF9E9E9EFF00000000969696FF4C4C4CFF909091FFD4D4D4FFD4D4
      D4FF9D9D9DFF4E4E4EFF868686FF00000000AC6D2EFFC8A076FFC3986BFFE7D4
      C1FFEDE0D1FFA55F1BFFA6611EFFF5EEE7FFF9F5F1FFA76220FFC29464FFFFFF
      FFFFE6D4C2FFEADBCDFFCCA580FFAC6C2CFF00000000252525FF008100FF0081
      00FF008100FF79DC7EFFA6F7B0FF91EE9FFF89EE9DFF0B630EFF0B630EFF0000
      0000000000000000000000000000000000000000000000000000000000009F9F
      9FFF6D6D6DFF6D6D6DFF6D6D6DFF858585FFE8E8E8FF00000000000000000000
      000000000000000000000000000000000000686868FFB0B0B0FF999999FF9999
      99FF999999FF999999FFA7A7A7FF0000000000000000727272FF585858FF5555
      55FF6D6D6DFF000000000000000000000000A96928FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFCBA37CFFD4B493FFFFFFFFFFFFFFFFFFEBDDCEFFA25B14FFD5B6
      95FFDBC0A5FFD6B798FFFFFFFFFFA86423FF565656FF3B3C3CFF393636FF3D38
      38FF00000000008100FF008100FF008100FF008100FF00000000000000000000
      0000000000000000000000000000000000000000000000000000B4B4B4FF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFFC9C9C9FFDFDFDFFF888888FFC0C0
      C0FF00000000000000000000000000000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFF999999FFFFFFFFFFFCFCFCFFEEEEEEFF00000000000000000000
      000000000000ECECECFF787878FF00000000A96928FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0C7ADFFA865
      24FFA96626FFC49569FFFFFFFFFFA86423FF565656FF252525FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000707070FF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF808080FFFCFCFCFFCECECEFF7171
      71FF00000000000000000000000000000000686868FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFF999999FFFFFFFFFFFFFFFFFFFFFFFFFF999999FFFBFBFBFFFBFB
      FBFFFEFEFEFFFFFFFFFF686868FF00000000A96928FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EFEAFFB47840FFAD6D
      2FFFAF6F32FFB2763DFFFFFFFFFFA86423FF00000000565656FF343434FF2727
      27FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000777777FF6D6D6DFF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFFC3C3C3FFFFFFFFFFB9B9
      B9FF797979FF000000000000000000000000686868FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFB0B0B0FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF686868FF00000000AC6D2EFFC89F76FFC69B6FFFC69B
      6FFFC69B6FFFC69B6FFFC69B6FFFC69B6FFFC3986CFFF9F4F0FFD7BA9EFFB174
      3AFFAA6827FFA7611EFFFFFFFFFFA96827FF0000000000000000000000004C4D
      4DFF252525FF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000858585FF6D6D6DFF6D6D6DFF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF7B7B7BFFFAFAFAFFFEFE
      FEFF9F9F9FFF878787FF0000000000000000906031FF906031FF906031FF9060
      31FF906031FF906031FF906031FF906031FF906031FF906031FF906031FF9060
      31FF906031FF906031FF906031FF00000000AA6828FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFF
      FFFFE7D4C2FFBA8754FFFBFAF8FFAA692BFF252525FF035303FF035303FF0353
      03FF252525FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D6D6DFF6D6D6DFF6D6D6DFF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6F6F6FFF6F6F
      6FFF6D6D6DFF6D6D6DFFA8A8A8FF00000000906031FFB77A3EFFB77A3EFFB77A
      3EFFB77A3EFF906031FFB77A3EFFB77A3EFFB77A3EFF906031FFB77A3EFFB77A
      3EFFB77A3EFFB77A3EFF906031FF00000000A96928FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFA86423FF525252FF1DBC4BFF1DBC4BFF0081
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000906031FF906031FF906031FF9060
      31FF906031FF906031FF906031FF906031FF906031FF906031FF906031FF9060
      31FF906031FF906031FF906031FF00000000C09163FFA96928FFA96928FFA969
      28FFA96928FFA96928FFA96928FFA96928FFA96928FFA96928FFA96928FFA969
      28FFA96928FFA96928FFA96928FFC59A6FFF000000007C7C7CFF808080FF8080
      80FF808080FF7C7C7CFF0000000000000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF0000000000000000000000000000
      00000000000000000000000000000000000000000000707070FF707070FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000959595FF777777FF777777FF777777FF777777FF777777FF939393FF0000
      00000000000000000000000000000000000000000000A0695EFFA0695EFFA069
      5EFFA0695EFFA0695EFFA0695EFFA0695EFFA0695EFFA0695EFFA0695EFFA069
      5EFFA0695EFF221D99FF1421B9FF0000000000000000808080FFFFFFFFFFFFFF
      FFFFFFFFFFFF808080FF676767FF676767FFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF0000000000000000000000000000
      00000000000000000000929292FF0000000000000000707070FF707070FF0000
      000000000000828282FF00000000000000000000000000000000000000000000
      0000777777FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF787878FF0000
      00000000000000000000000000000000000000000000B38A81FFFFECCDFFFFE3
      C1FFFFDFB9FFFFDBAEFFD5A27DFFEEB586FFFFD099FFFFD69FFFFFD59CFFFFD5
      9AFF4D409FFF1934CFFF3D6DFDFF0C24CCFF00000000808080FFFBFBFBFFFBFB
      FBFFFBFBFBFF808080FF0000000000000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF0000000000000000000000000000
      0000000000008D8D8DFF707070FF707070FF707070FF707070FF707070FF7070
      70FF707070FF707070FF919191FF00000000868686FF777777FF777777FF7777
      77FF777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF787878FF7777
      77FF777777FF777777FF8C8C8CFF0000000000000000B38A81FFFFEBD3FFFFE4
      C7FFFFE0BEFFBC9D8CFF605E72FF718DA3FF9F8B80FFD5A47AFFF4C896FFA785
      99FF273ECCFF3B6CFFFF144CFFFF001BD3FF000000007B7B7BFF808080FF8080
      80FF808080FF7B7B7BFF0000000000000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF0000000000000000000000000000
      00000000000000000000707070FF707070FF707070FF707070FF707070FF7070
      70FF707070FF707070FF0000000000000000777777FF00000000000000007777
      77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF0000000000000000B38A81FFFFF0DCFFA069
      5EFFA0695EFF8E9497FF6EA7BCFF74D1F0FF83EBF6FF5067A1FF221890FF253B
      CBFF3865FAFF1736DCFF0016D2FF000000000000000000000000000000006666
      66FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000707070FF707070FF747474FF00000000000000007676
      76FF707070FF707070FF0000000000000000777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF0000000000000000B38A81FFFFF4E5FFFFED
      D9FFFFE5CBFFA39F9AFF71ACBDFF82ABADFF93FAFBFF244DC7FF1B32CFFF3969
      FEFF2047DFFF463D78FF00000000000000000000000000000000000000007070
      70FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000717171FF707070FF707070FF707070FFBEBEBEFF0000000000000000C5C5
      C5FF707070FF707070FF707070FF707070FF777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF0000000000000000B38A81FFFFF9EDFFA069
      5EFFA0695EFFA98C86FF546B8AFF6895ACFF77989FFF4C5997FF2A43D9FF0E38
      F9FF1D63EBFF43A6F5FF64454CFF00000000000000007C7C7CFF808080FF8080
      80FF808080FF7C7C7CFF0000000000000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF0000000000000000000000000000
      0000707172FF6F7070FF707070FF707070FFB8B8B8FF0000000000000000BFBF
      BFFF707070FF707070FF707070FF767676FF777777FF777777FFD7D7D7FFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
      FEFFD9D9D9FF777777FF777777FF0000000000000000B38A81FFFFFFF9FFFFFF
      EDFFFFFFE9FFDBB9A4FF8D797BFF74A2B3FF7DC5CDFF7EC4C9FF4E85C6FF3242
      A2FF4269B0FF3893EBFF54577BFF0000000000000000808080FFFFFFFFFFFFFF
      FFFFFFFFFFFF808080FF676767FF676767FFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF0000000000000000000000000000
      000000000000000000006F7070FF707070FF707070FFB4B4B4FFB6B6B6FF7070
      70FF707070FF707070FF0000000000000000777777FF777777FFFCFCFCFFBC89
      55FFB3773DFFB3773DFFB3773DFFBC8D5EFF00000000BCCBA8FF91B162FF82A8
      4BFF8EAF5DFFB6C79EFF000000000000000000000000B38A81FFDADAF1FF7471
      C1FF7C76BEFFB6ACCDFFE2CEC9FFE7C5ACFFC8AA91FF9B9893FF709AAEFF5098
      CAFF3E76B9FF466CA8FF5A4A61FF0000000000000000808080FFFBFBFBFFFBFB
      FBFFFBFBFBFF808080FF0000000000000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF0000000000000000000000000000
      0000CDB195FF00000000737575FF707070FF707070FF707070FF707070FF7070
      70FF707070FF707070FF0000000000000000777777FF777777FFFBFBFAFFB377
      3DFFB3773DFFB3773DFFB67E49FF000000008FB060FF83A94CFF83A94CFF88AC
      54FF81A84AFF83A94CFF85AA50FF0000000000000000B38A81FF5153BFFFA4A6
      DEFFBBBFECFFB0AFDFFF9A96CEFF877EBFFFA798BDFFD8BBB4FFEFC6A2FFC8A6
      8FFF8F8995FF54638FFF5D353DFF00000000000000007B7B7BFF808080FF8080
      80FF808080FF7B7B7BFF0000000000000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFF000000000000000000000000B681
      4CFFB2702FFF9C9185FF6D7073FF6E7071FF6F7070FF707070FF707070FF7070
      70FF767676FF707070FF808080FF00000000848484FF777777FFFBFBFAFFB377
      3DFFB3773DFFB3773DFFCAAD90FFB1C397FF83A94CFF83A94CFFFFFFFFFF83A9
      4CFF89AC54FF81A84AFF83A94CFFB5C79DFF0000000082648EFF7C7CCAFFA4BB
      FFFF0E35FFFF5678FFFFA1B5FFFFCBD0F6FFAAACDEFF7976C3FF796CB0FFFDE1
      C0FFFFD3AAFFA0695EFF00000000000000000000000000000000000000007070
      70FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BF966CFFB47D47FFB6824EFFAF70
      33FFB07031FFCEC0B2FF95918BFF00000000000000006F7070FF707070FF0000
      0000000000009C9C9CFF0000000000000000000000000000000000000000B377
      3DFFB3773DFFB3773DFF00000000759F3AFF83A94CFFFFFFFFFFFFFFFFFFFFFF
      FFFF83A94CFF89AE56FF81A849FF8CAE5AFF00000000B092A0FF5A5BC0FFCBD5
      FBFF6886FFFF103DFFFF0026FFFF0A39FFFF5272FFFFB3C5FFFF6E70CCFF7E6F
      AEFFFFDDB7FFA0695EFF00000000000000000000000000000000000000007070
      70FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BA8B5BFFAF7033FFB07338FF0000
      0000C0976EFFB07031FFB3702EFFC7A480FF00000000737576FF707070FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000797979FFFFFFFFFF000000006D9A2DFF83A94CFFFFFFFFFF83A94CFFFFFF
      FFFFFFFFFFFF83A94CFF89AE58FF82A84AFF00000000B38A81FFA0A2DDFF6B6A
      C3FFB1B0DCFFC9CDF2FFA2B3FEFF5F80FFFF0D36FFFF466CFCFFA9A8DBFF5A50
      AAFFF1D2BBFFA0695EFF0000000000000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFF0000
      00000000000000000000000000000000000000000000B88654FFC19A73FF0000
      000000000000AF7033FFAF7135FFD1BBA5FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000797979FFFFFFFFFF00000000769F3BFF83A94CFF83A94CFF83A94CFF83A9
      4CFFFFFFFFFFFFFFFFFF83A94CFF8BAE59FF00000000B38A81FFFFFFFFFFE4E4
      F5FFB6B6E1FF9797D3FF8F8DCDFF9F9ED6FFB9BEEDFFDE9D58FFDE9D58FFDE9D
      58FFDE9D58FFA0695EFF0000000000000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFF0000
      00000000000000000000000000000000000000000000BC8E60FFAF7033FFC5A3
      81FFB47D47FFB57E4AFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000939393FF777777FFACACACFFB2C498FF83A94CFF83A94CFF83A94CFF83A9
      4CFF83A94CFFFFFFFFFF99B76DFFB4C59BFF00000000B38A81FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFECECF8FFB9BAE3FF8181CCFFDE9D58FFF3C484FFFABC
      5EFFDD9947FF000000000000000000000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFF0000
      00000000000000000000000000000000000000000000AF7033FFB1763DFFB57E
      49FFAF7033FFB7834FFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000091B163FF83A94CFF83A94CFF83A9
      4CFF83A94CFF83A94CFF81A74DFF0000000000000000B38A81FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDE9D58FFE5B681FFDE9D
      58FF00000000000000000000000000000000B3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFF0000
      00000000000000000000000000000000000000000000CAAF94FF000000000000
      0000B98756FFBB8C5DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AEC191FF83A94CFF83A9
      4CFF83A94CFFA5BC85FF000000000000000000000000B38A81FFEACAB6FFEACA
      B6FFE7C8B5FFE3C4B4FFDFC1B3FFDBBEB1FFD7BBB0FFDE9D58FFDE9D58FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008996D6FF5B6ED1FF455BCEFF455BCEFF5C6FD1FF8B97D6FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000A4BE80FF86AC4DFF78A539FF7AA63CFF8CB059FFB0C593FF0000
      000000000000000000007AA63CFF0000000093450EFF93450EFF93450EFF9345
      0EFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008895
      D6FF364ECCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF374F
      CCFF8E9AD7FF000000000000000000000000000000000000000000000000B2C6
      96FF7AA63DFF78A539FF78A539FF78A539FF78A539FF78A539FF78A539FF83AB
      4AFF00000000000000007BA73EFF7AA63CFF93450EFFEEBF82FFE98E34FF9345
      0EFF00000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000000000000000
      0000000000000000000082AA49FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006A7BD2FF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF7081D3FF00000000000000000000000000000000ADC38EFF78A5
      39FF78A539FF98B76CFFC5D1B5FF0000000000000000BBCBA5FF8AAE54FF78A5
      39FF7BA63EFFBECDA9FF78A539FF7BA63EFF93450EFF5CD26FFFF7DAB7FF9345
      0EFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000082AA49FF82AA49FF82AA49FF0000000000000000000000000000
      000000000000000000000000000000000000000000008794D6FF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF344DCCFF324B
      CCFF324BCCFF324BCCFF8E9AD7FF0000000000000000C4D0B3FF78A53AFF78A5
      3AFFB6C89CFF0000000000000000000000000000000000000000000000009AB8
      6FFF78A539FF7DA842FF78A539FF78A539FF93450EFF93450EFF93450EFF9345
      0EFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000082AA49FF82AA49FF82AA49FF82AA49FF82AA49FF00000000000000000000
      00000000000000000000000000000000000000000000364ECCFF324BCCFF324B
      CCFF7486DCFFFFFFFFFF3C54CEFF324BCCFF324BCCFF3D55CEFFFFFFFFFF8594
      E0FF324BCCFF324BCCFF3850CCFF00000000000000008BAF57FF78A539FFA6BF
      82FF000000000000000000000000000000000000000000000000000000000000
      000088AE52FF78A539FF78A539FF78A539FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000082AA
      49FF82AA49FF82AA49FF82AA49FF82AA49FF82AA49FF82AA49FF000000000000
      0000000000000000000000000000000000008693D6FF324BCCFF324BCCFF334C
      CCFFFFFFFFFFFFFFFFFFFFFFFFFF3C54CEFF3D55CEFFFFFFFFFFFFFFFFFFFFFF
      FFFF354ECCFF324BCCFF324BCCFF8D99D6FF0000000078A539FF7EA842FF0000
      000000000000000000000000000000000000000000007AA63CFF7BA63EFF78A5
      39FF78A539FF78A539FF78A539FF78A539FF93450EFF93450EFF93450EFF9345
      0EFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000082AA49FF82AA
      49FF82AA49FF82AA49FF82AA49FF82AA49FF82AA49FF82AA49FF82AA49FF0000
      000000000000000000000000000000000000566AD0FF324BCCFF324BCCFF324B
      CCFF4058CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F57
      CFFF324BCCFF324BCCFF324BCCFF5D70D1FFAFC491FF78A539FF9DB973FF0000
      00000000000000000000000000000000000000000000000000007AA63CFF79A5
      3AFF78A539FF78A539FF78A539FF78A539FF93450EFFEEBF82FFE98E34FF9345
      0EFF00000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000082AA49FF82AA49FF82AA
      49FF82AA49FF82AA49FF0000000082AA49FF82AA49FF82AA49FF82AA49FF82AA
      49FF000000000000000000000000000000004057CDFF324BCCFF324BCCFF324B
      CCFF324BCCFF4058CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F57CFFF324B
      CCFF324BCCFF324BCCFF324BCCFF475DCEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093450EFF5CD26FFFF7DAB7FF9345
      0EFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000082AA49FF82AA
      49FF82AA49FF00000000000000000000000082AA49FF82AA49FF82AA49FF82AA
      49FF82AA49FF0000000000000000000000003F56CDFF324BCCFF324BCCFF324B
      CCFF324BCCFF3D55CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3C54CEFF324B
      CCFF324BCCFF324BCCFF324BCCFF465CCEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093450EFF93450EFF93450EFF9345
      0EFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000082AA
      49FF000000000000000000000000000000000000000082AA49FF82AA49FF82AA
      49FF82AA49FF82AA49FF00000000000000005468D0FF324BCCFF324BCCFF324B
      CCFF3D55CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3C54
      CEFF324BCCFF324BCCFF324BCCFF5A6ED0FF78A539FF78A539FF78A539FF78A5
      39FF7BA73EFF7AA63CFF00000000000000000000000000000000000000000000
      00000000000094B565FF78A539FFB7C99EFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000082AA49FF82AA
      49FF82AA49FF82AA49FF82AA49FF00000000828FD5FF324BCCFF324BCCFF334C
      CCFFFFFFFFFFFFFFFFFFFFFFFFFF4057CFFF4057CFFFFFFFFFFFFFFFFFFFFFFF
      FFFF344CCCFF324BCCFF324BCCFF8895D6FF78A539FF78A539FF78A539FF78A5
      39FF78A539FF80A944FF7AA63CFF000000000000000000000000000000000000
      0000000000007AA63CFF78A539FF0000000093450EFF93450EFF93450EFF9345
      0EFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000082AA
      49FF82AA49FF82AA49FF000000000000000000000000344CCCFF324BCCFF324B
      CCFF798ADDFFFFFFFFFF4057CFFF324BCCFF324BCCFF4057CFFFFFFFFFFF8291
      DFFF324BCCFF324BCCFF364ECCFF0000000078A539FF78A539FF78A539FF8EB1
      5BFF000000000000000000000000000000000000000000000000000000000000
      00009EBA75FF78A539FF93B463FF0000000093450EFFEEBF82FFE98E34FF9345
      0EFF00000000000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000082AA49FF00000000000000000000000000000000808ED5FF324BCCFF324B
      CCFF324BCCFF344CCCFF324BCCFF324BCCFF324BCCFF324BCCFF354DCCFF324B
      CCFF324BCCFF324BCCFF8693D6FF0000000078A539FF78A539FF7CA740FF78A5
      39FFA1BC79FF000000000000000000000000000000000000000000000000ACC2
      8CFF78A539FF7AA63CFF000000000000000093450EFF5CD26FFFF7DAB7FF9345
      0EFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006173D1FF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF6778D2FF000000000000000079A53AFF79A53AFFBECDA9FF79A5
      3AFF78A539FF8DB059FFBDCCA8FF0000000000000000C1CEAEFF93B462FF78A5
      39FF78A539FFB4C799FF000000000000000093450EFF93450EFF93450EFF9345
      0EFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007B8B
      D4FF334CCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF344C
      CCFF818FD5FF00000000000000000000000079A53BFF7AA63DFF00000000C2CF
      AFFF81A946FF78A539FF78A539FF78A539FF78A539FF78A539FF78A539FF7CA7
      40FFB9CAA2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007C8BD4FF4E63CFFF3951CCFF3A52CCFF5064CFFF808ED5FF0000
      000000000000000000000000000000000000000000007AA63CFF000000000000
      000000000000AEC38FFF8CB058FF7AA63DFF7AA63CFF8AAE54FFA9C188FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000085AD
      4BFF85AD4AFF0000000000000000000000000000000000000000000000000000
      000000000000A9692AFFDEC7B0FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007C8BD3FF000000000000
      000000000000000000007B89D2FF000000000000000000000000000000000000
      000000000000000000000000000000000000777777FF777777FF777777FF7777
      77FF777777FF777777FF00000000000000000000000000000000C5A382FFBA8A
      5AFFB37A43FFB07338FFAF7034FFB07338FFB37A43FFBA8A59FF0000000085AD
      4BFF85AD4AFF0000000000000000000000000000000000000000D1B08EFFBF8F
      60FF00000000E1CCB8FFAB6A2AFFA9692AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C5A382FFBA8A
      5AFFB37A43FFB07338FFAF7034FFD0BBA6FF7B89D4FF1632C5FF1632C5FF0000
      0000000000001632C5FF1632C5FF7C8AD2FF0000000000000000000000000000
      000000000000000000000000000000000000777777FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF777777FF0000000000000000CEB399FFAE6F33FFAF7033FFAF70
      33FFAF7033FFAF7033FFAF7033FFD3C2B2FF00000000000000000000000085AD
      4BFF85AD4AFF000000000000000000000000DEC3A9FFAE6F33FFAF7033FFAF70
      33FFAF7033FF00000000A9692AFF0000000000000000A9692AFF000000000000
      000000000000000000000000000000000000CEB399FFAE6F33FFAF7033FFAF70
      33FFAF7033FFAF7033FFAF7033FFC9AB8EFF000000001632C5FF1632C5FF2640
      C7FF2D46C8FF1632C5FF1632C5FF000000000000000000000000000000000000
      00000000000000000000878787FF777777FF777777FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF777777FF777777FF8A8A8AFFB27233FFAE6F33FFAF7033FFAF70
      33FFAF7033FFAF7033FFAF7236FF0000000085AD4AFF85AD4AFF85AD4AFF85AD
      4AFF85AD4AFF85AD4AFF85AD4AFF85AD4AFFB27233FFAE6F33FFAF7033FFAF70
      33FFAF7033FF000000000000000000000000AB6A2AFFAC6D30FFA9692AFF0000
      000000000000000000000000000000000000B27233FFAE6F33FFAF7033FFAF70
      33FFAF7033FFAF7033FFAF7033FFAF7135FFCEB7A1FF000000002F47C8FF1632
      C5FF1632C5FF3048C8FF00000000000000000000000000000000C5E1F2FF8FCB
      F2FF68B8EAFF00000000777777FF777777FF777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF777777FFB4763AFFAE6F33FFAF7033FFAF70
      33FFAF7033FFAF7033FFAF7236FF0000000085AD4AFF85AD4AFF85AD4AFF85AD
      4AFF85AD4AFF85AD4AFF85AD4AFF85AD4AFFB3763AFFAE6F33FFAF7033FFAF70
      33FFAF7033FFAF7033FF00000000A9692AFFAD7033FFAB6A2AFFAC6D30FFA969
      2AFF00000000FCFBFAFF0000000000000000B4763AFFAE6F33FFAF7033FFAF70
      33FFAF7033FFAF7033FFAF7033FFAF7135FFCEB7A1FF000000002C45C8FF1632
      C5FF1632C5FF2640C7FF0000000000000000DDECF5FF57B0E8FF54AFE7FF50AD
      E7FF4FADE6FF00000000777777FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7D7FFD7D7
      D7FFD7D7D7FFD7D7D7FFD7D7D7FF777777FFC8A480FFAE6F32FFAF7033FFAF70
      33FFAF7033FFAF7135FF00000000D4C4B5FF00000000000000000000000085AD
      4BFF85AD4AFF000000000000000000000000D3AF8BFFAE6F32FFAF7033FFAF70
      33FFAF7033FFAE7034FF0000000000000000A9692AFFAD7033FFAB6A2AFFAC6D
      30FFA9692AFF000000000000000000000000C8A480FFAE6F32FFAF7033FFAF70
      33FFAF7033FFAF7135FF00000000CBAF95FF000000001632C5FF1632C5FF2F47
      C8FF2D46C8FF1632C5FF1632C5FF0000000055B1EAFF50ADE6FF90CBEFFFC4E3
      F6FFD3E9F8FF00000000777777FFD7D7D7FFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFD7D7D7FF777777FF00000000AE6F32FFAF7033FFAF70
      33FFAF7033FF000000000000000000000000AF7033FFAF7033FF0000000085AD
      4BFF85AD4AFF00000000000000000000000000000000AE6F32FFAF7033FFAF70
      33FFAF7033FF00000000000000000000000000000000A9692AFFAD7033FFAB6A
      2AFFAC6D30FFA9692AFF000000000000000000000000AE6F32FFAF7033FFAF70
      33FFAF7033FF0000000000000000000000007786D4FF1632C5FF1632C5FF0000
      0000000000001632C5FF1632C5FF7E8CD3FF87C7F0FFCAE5F6FF8AC8EEFF58B0
      E8FF4EADE6FF00000000878787FFA7A7A7FFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFA7A7A7FF8A8A8AFF0000000000000000AE6F33FFAF70
      33FF0000000000000000000000000000000000000000AF7033FF0000000085AD
      4BFF85AD4AFF00000000000000000000000000000000F2E9E1FFAE6F33FFAF70
      33FF00000000000000000000000000000000FDFDFDFF00000000A9692AFFAD70
      33FFAB6A2AFFAC6D30FF00000000000000000000000000000000AE6F33FFAF70
      33FF00000000000000000000000000000000000000007887D4FF000000000000
      000000000000000000007B89D4FF0000000087C7F0FF4DABE6FF54AFE7FF57B0
      E7FF58B1E8FF000000000000000000000000A7A7A7FFFFFFFFFFFFFFFFFFFFFF
      FFFFFDFDFDFFA7A7A7FF00000000000000000000000000000000000000000000
      000000000000C7A788FFC19161FFC5A382FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D4B596FFC89767FFD1B090FF000000000000000000000000A969
      2AFFAD7033FF0000000000000000A9692AFF0000000000000000000000000000
      000000000000C7A788FFC19161FFC5A382FF0000000000000000000000000000
      000000000000000000000000000000000000CAE2F3FF57B1E8FF58B1E8FF58B1
      E8FF58B1E8FF5AB1E6FFA4D3F1FF00000000777777FF777777FF777777FF7777
      77FF777777FF777777FF00000000000000000000000000000000000000000000
      0000AE6F33FFAF7033FFAE6F32FFAF7033FFAF7033FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AE6F33FFAF7033FFAE6F32FFAF7033FFAF7033FF00000000000000000000
      00000000000000000000A9692AFFA9692AFF0000000000000000000000000000
      0000AE6F33FFAF7033FFAE6F32FFAF7033FFAF7033FF00000000000000000000
      0000000000000000000000000000000000000000000000000000ABD7F3FF94CC
      EEFF00000000C4E4F8FF8FCBF2FF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AF71
      36FFAF7033FFAF7033FFAF7033FFAF7033FFAF7033FFAE6F32FF000000000000
      000000000000000000000000000000000000000000000000000000000000AE70
      35FFAF7033FFAF7033FFAF7033FFAF7033FFAF7033FFAE6F32FF000000000000
      000000000000A9692AFFA9692AFFE8D7C7FF000000000000000000000000AF71
      36FFAF7033FFAF7033FFAF7033FFAF7033FFAF7033FFAE6F32FF000000000000
      000000000000000000000000000000000000000000000000000000000000DCEE
      FAFF57B0E8FF54AFE7FF50ADE7FF4EADE6FF4EADE6FF4EADE6FF4EABE6FF4FAD
      E7FF54AFE7FF57B0E8FFD8ECF8FF00000000000000000000000000000000AD6F
      32FFAF7033FFAF7033FFAF7033FFAF7033FFAF7033FFAE6F32FF000000000000
      000000000000000000000000000000000000000000000000000000000000AD6F
      32FFAF7033FFAF7033FFAF7033FFAF7033FFAF7033FFAE6F32FF000000000000
      000000000000DDC5AEFFE0C9B3FF00000000000000000000000000000000AD6F
      32FFAF7033FFAF7033FFAF7033FFAF7033FFAF7033FFAE6F32FF000000000000
      00000000000000000000000000000000000000000000000000000000000055B1
      EAFF50ADE6FF90CBEFFFC4E3F6FFD4EAF8FFD7EBF8FFD8EBFAFFDEF0FAFFC4E3
      F5FF8FCAEFFF50ABE6FF54AFE7FF00000000000000000000000000000000AD6F
      32FFAF7033FFAF7033FFAF7033FFAF7033FFAF7033FFAE6F32FF000000000000
      000000000000000000000000000000000000000000000000000000000000AD6F
      32FFAF7033FFAF7033FFAF7033FFAF7033FFAF7033FFAE6F32FF000000000000
      000000000000000000000000000000000000000000000000000000000000AD6F
      32FFAF7033FFAF7033FFAF7033FFAF7033FFAF7033FFAE6F32FF000000000000
      00000000000000000000000000000000000000000000000000000000000087C7
      F0FFCAE5F6FF8AC8EEFF58B0E8FF4EADE6FF4EADE6FF4EADE6FF4CABE6FF65B6
      E9FF9CCFF0FFDEEFFAFF82C3EDFF00000000000000000000000000000000AD6E
      32FFAF7033FFAF7033FFAF7033FFAF7033FFAF7033FFAE6F32FF000000000000
      000000000000000000000000000000000000000000000000000000000000AD6E
      32FFAF7033FFAF7033FFAF7033FFAF7033FFAF7033FFAE6F32FF000000000000
      000000000000000000000000000000000000000000000000000000000000AD6E
      32FFAF7033FFAF7033FFAF7033FFAF7033FFAF7033FFAE6F32FF000000000000
      00000000000000000000000000000000000000000000000000000000000087C7
      F0FF4DABE6FF54AFE7FF57B0E7FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF56B0
      E7FF53AEE7FF4AAAE6FF9DD1F1FF000000000000000000000000000000000000
      0000AE6F32FFAF7033FFAF7033FFAF7033FFAF7033FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000F4ED
      E5FFAE6F32FFAF7033FFAF7033FFAF7033FFAF7033FFEADCD0FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AE6F32FFAF7033FFAF7033FFAF7033FFAF7033FF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000C9E4
      F6FF57B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1
      E8FF58B1E8FF57B0E8FFC3E1F4FF000000000000000000000000000000000000
      000000000000BF956BFFB6824DFFBE9267FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C79D73FFB98550FFC59A6FFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BF956BFFB6824DFFBE9267FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AAD7F3FF76BEE9FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF74BD
      EAFFA8D6F2FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000824A4AFF4D1D1EFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000CEE6F6FF8CC7EEFF68B7E9FF57AFE6FF54AEE6FF5FB3
      E7FF79C0EBFFACD7F2FF00000000000000000000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFF00000000B8B8B8FF777777FF0000
      000000000000777777FFB8B8B8FF000000000000000000000000A06E62FFA06E
      62FFA06E62FFA06E62FFA06E62FFA06E62FFA06E62FFA06E62FFA06E62FFA06E
      62FFA06E62FFA06E62FFA06E62FF000000000000000000000000000000000000
      0000824A4AFF824A4AFFA64A4AFFA94C4CFF4D1D1EFF00000000000000000000
      000000000000000000000000000000000000777777FF777777FF777777FF7777
      77FFDBDBDBFFB7DFF7FF9BD0F1FFC5E3F7FFC1E1F6FFC0E0F6FFBEDEF4FFBBDF
      F4FFB8DCF4FFB3DAF4FF67B6E8FF000000000000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFF00000000B8B8B8FF777777FF0000
      000000000000777777FFB8B8B8FF0000000000000000A06E62FFFFFFFFFFA06E
      62FFFFFFFFFFA06E62FFFFFFFFFFA06E62FFFFFFFFFFA06E62FFFFFFFFFFA06E
      62FFFFEFB7FFFFEFB7FFA06E62FF000000000000000000000000824A4AFF824A
      4AFFB64E4FFFC24E4FFFC54C4DFFB24C4DFF4D1D1EFF824A4AFF824A4AFF824A
      4AFF824A4AFF824A4AFF824A4AFF00000000777777FFFEFEFEFFFEFEFEFFFEFE
      FEFFFDFDFDFFD7EEFCFF7AC1EDFF52AEE7FF55AFE8FF5AB0E7FF71BCEAFF78BF
      EBFF6FBAE9FF56AFE7FF9DD1F0FF000000000000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFF00000000B8B8B8FF777777FFBABA
      BAFFBABABAFF777777FFB8B8B8FF00000000A06E62FFFFFFFFFFFEFBFBFFFCFB
      FBFFFCFAFAFFFCFAFAFFFCFBFBFFFBF8F8FFFEFCFCFFFBF8F8FFFEFCFCFFFEFC
      FCFFA06E62FFFFEFB7FFA06E62FF000000000000000000000000824A4AFFD457
      58FFCB5455FFC95354FFC95152FFB74E51FF4D1D1EFFFE8B8CFFFB9A9CFFF8AA
      ABFFF7B5B6FFF7B5B6FF824A4AFF00000000777777FF777777FF777777FF7777
      77FFC1C1C1FF000000007DC1EAFFC7E4F6FF00000000D6EAF7FFC0E0F5FFBADE
      F4FFC8E4F6FFE5F1FAFF00000000000000000000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFFBABABAFF979797FF777777FF7777
      77FF777777FF777777FF979797FFBABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFEFB7FFA06E62FF000000000000000000000000824A4AFFD75B
      5CFFD0595AFFCF5859FFCF5657FFBD5255FF4D1D1EFF22B549FF12C147FF15BD
      47FF0BBC40FFF7B5B6FF824A4AFF0000000000000000777777FFF2F2F2FFFFFF
      FFFFF2F2F2FFE2E2E2FF000000006AB8E8FF6FBBEAFF97CCEFFFABD6F2FFADD9
      F3FFA4D4F1FF89C6EEFF5AB1E7FFB3DAF3FF0000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFFBDBDBDFF777777FF777777FF7777
      77FF777777FF777777FF777777FFB8B8B8FFA06E62FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA06E62FFFFEFB7FFA06E62FF000000000000000000000000824A4AFFDD62
      63FFD75E5FFFD55D5EFFD55B5CFFC25659FF4D1D1EFF29B44CFF1BBF4BFF1DBC
      4BFF12BC44FFF7B5B6FF824A4AFF0000000000000000777777FF777777FF7777
      77FF777777FFE7E7E7FFC3E5FAFFC8E5F7FFA9D6F2FF80C3EDFF6AB9EAFF64B5
      E9FF6DB9EAFF86C6EEFFB0D9F4FFA0D2F0FF0000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFF00000000BBBBBBFF777777FF7777
      77FF777777FF777777FFB4B4B3FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFEFB7FFA06E62FF000000000000000000000000824A4AFFE367
      68FFDD6465FFDA6263FFDE6566FFC6585AFF4D1D1EFF25B148FF15BC47FF1ABB
      48FF0FBB42FFF7B5B6FF824A4AFF000000000000000000000000777777FFFDFD
      FDFF787878FFF3F3F3FFDDF0FCFF4FADE7FF56B0E8FF5AB1E8FF5BB2E8FF5CB2
      E8FF5BB2E8FF5AB1E8FF55B0E8FF6FBAE9FF0000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFF0000000000000000B8B8B8FF7777
      77FF777777FFB1B0AFFFCAA582FF00000000A06E62FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA06E62FFFFEFB7FFA06E62FF000000000000000000000000824A4AFFEB6C
      6DFFE26667FFE67D7EFFFAD3D4FFCC6D6FFF4D1D1EFFA5D897FF4FD16EFF41C9
      65FF2CC757FFF7B5B6FF824A4AFF000000000000000000000000777777FFFEFE
      FEFF787878FFE5E5E5FF00000000DFEFFAFF9CD0F1FF77BEEAFF64B5E8FF61B4
      E7FF6BB8E9FF87C6EEFFB8DDF5FF000000000000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFF000000000000000000000000B6B6
      B6FFB0B0B0FFDAC0A7FFB1763CFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFEFB7FFA06E62FF000000000000000000000000824A4AFFF272
      73FFE96B6CFFEB8182FFFCD1D3FFCF6D6FFF4D1D1EFFFFF2CCFFFFFFD7FFFFFF
      D4FFE6FCC7FFF7B5B6FF824A4AFF000000000000000000000000777777FFFEFE
      FEFF787878FFDFDFDFFFA0A0A0FFC2C4C7FFECECECFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000929292FF6D6D6DFF6D6D6DFFC6C6C6FF848484FF959595FF0000
      000000000000000000000000000000000000A06E62FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA06E62FFFFEFB7FFA06E62FF000000000000000000000000824A4AFFF877
      78FFF07475FFEE7172FFF07273FFD16465FF4D1D1EFFFCEFC7FFFFFFD5FFFFFF
      D3FFFFFFD7FFF7B5B6FF824A4AFF0000000000000000777777FF777777FF7777
      77FF777777FFA5A5A5FFE0E0E0FFE0E0E0FFE0E0E0FFA6A6A6FF878787FF8989
      89FF818181FF767676FF00000000000000000000000000000000000000000000
      0000AAAAAAFF6D6D6DFF6D6D6DFF6D6D6DFF858585FFE9E9E9FF797979FFAEAE
      AEFF00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFEFB7FFA06E62FF000000000000000000000000824A4AFFFE7E
      80FFF7797AFFF67879FFF77678FFD76A6AFF4D1D1EFFFCEFC7FFFFFFD5FFFFFF
      D3FFFFFFD5FFF7B5B6FF824A4AFF0000000000000000777777FFF2F2F2FFFFFF
      FFFFF4F4F4FF7A7A7AFFDCDCDCFFE0E0E0FFDCDCDCFF7A7A7AFFF4F4F4FFFFFF
      FFFFF2F2F2FF777777FF0000000000000000000000000000000000000000C5C5
      C5FF6C6C6CFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFFC9C9C9FFDFDFDFFF7070
      70FFC9C9C9FF000000000000000000000000A06E62FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA06E62FFFFEFB7FFA06E62FF000000000000000000000000824A4AFFFF83
      84FFFC7E80FFFB7D7EFFFE7E80FFDA6D6EFF4D1D1EFFFCEFC7FFFFFFD5FFFFFF
      D3FFFFFFD5FFF7B5B6FF824A4AFF00000000838383FF777777FF777777FF7777
      77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
      77FF777777FF777777FF838383FF000000000000000000000000DBDBDBFF6F6F
      6FFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF808080FFFCFCFCFFCECE
      CEFF707070FFDFDFDFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFEFB7FFA06E62FF000000000000000000000000824A4AFFFF88
      89FFFF8283FFFF8182FFFF8283FFE07273FF4D1D1EFFFCEFC7FFFFFFD5FFFFFF
      D3FFFFFFD5FFF7B5B6FF824A4AFF000000008A8A8AFF888888FF838383FFE0E0
      E0FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFE0E0
      E0FF838383FF888888FF8A8A8AFF000000000000000000000000787878FF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFFC3C3C3FFFFFF
      FFFFB9B9B9FF7B7B7BFF0000000000000000A06E62FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA06E62FFFFEFB7FFA06E62FF000000000000000000000000824A4AFF824A
      4AFFE27475FFFE8182FFFF8687FFE57576FF4D1D1EFFFAEBC5FFFCFBD1FFFCFB
      CFFFFCFBD1FFF7B5B6FF824A4AFF0000000000000000CECECEFF909090FF7B7B
      7BFF898989FFEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFEAEAEAFF898989FF7B7B
      7BFF909090FFCECECEFF000000000000000000000000898989FF6D6D6DFF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF7B7B7BFFFAFA
      FAFFFEFEFEFF9F9F9FFF8C8C8CFF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFEFB7FFA06E62FF000000000000000000000000000000000000
      0000824A4AFF9C5556FFCB6B6CFFCF6D6DFF4D1D1EFF824A4AFF824A4AFF824A
      4AFF824A4AFF824A4AFF824A4AFF00000000000000000000000000000000E0E0
      E0FF9B9B9BFF777777FF939393FFE0E0E0FF939393FF777777FF9B9B9BFFE0E0
      E0FF00000000000000000000000000000000B1B1B1FF6D6D6DFF6D6D6DFF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6F6F
      6FFF6F6F6FFF6D6D6DFF6D6D6DFFB6B6B6FFA06E62FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFA06E62FF9D6A5CFFA06E62FF000000000000000000000000000000000000
      00000000000000000000824A4AFF824A4AFF4D1D1EFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000009A9A9AFF797979FF9A9A9AFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A06E62FFFFFFFFFFA06E
      62FFFFFFFFFFA06E62FFFFFFFFFFA06E62FFFFFFFFFFA06E62FFFFFFFFFFA06E
      62FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008B99E1FF000000000000
      000000000000000000008996E0FF000000000000000000000000000000000000
      00000000000000000000939393FF777777FF777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF939393FF0000000000000000D2BEABFFBF90
      61FFB9824AFFBE8E5EFFD0BAA3FF000000000000000000000000BF9060FFB880
      47FFBD8C5AFFCFB69DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000939393FF777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF939393FF0000000000000000000000000000
      0000000000000000000000000000000000008A98E2FF1632C5FF1632C5FF0000
      0000000000001632C5FF1632C5FF8A98E0FF0000000000000000000000000000
      00000000000000000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF797979FF00000000CDB297FFB26F2EFFB26F
      2EFFB47537FFB26F2EFFB26F2EFFCDB297FF00000000B37233FFB26F2EFFB26F
      2EFFB26F2EFFB26F2EFFC9A786FF000000000000000000000000000000000000
      0000000000000000000000000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF797979FFCEA986FFB1763DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFD9BDA1FF000000001632C5FF1632C5FF2841
      C8FF3048CAFF1632C5FF1632C5FF000000000000000000000000000000000000
      00000000000000000000797979FFFFFFFFFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFFFFFFFFF797979FF00000000B87D45FFB26F2EFFD1BB
      A6FF00000000CDB297FFB26F2EFFB87D45FFC39A71FFB26F2EFFC8A684FF0000
      0000D0BAA4FFB26F2EFFB47537FF000000008AC3E7FF65B7EAFF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF00000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF797979FFB1763CFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB2773EFFE1CBB6FF00000000324ACAFF1632
      C5FF1632C5FF324BCBFF00000000000000000000000000000000000000000000
      00000000000000000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF797979FF00000000B67A40FFB26F2EFF0000
      00000000000000000000B27030FFB26F2EFFB5773BFFB26F2EFF000000000000
      000000000000B26F2EFFB37234FF0000000066B7E9FF65B7EAFF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF00000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF797979FFB3773DFFB3773DFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFDFF000000002F48C9FF1632
      C5FF1632C5FF2841C8FF0000000000000000A9A9A9FF969696FF969696FF9696
      96FF969696FF00000000797979FFFFFFFFFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFFFFFFFFF797979FF00000000C49D75FFB26F2EFFBB85
      50FFD0B9A2FFC59F78FFB26F2EFFB26F2EFFB26F2EFFB26F2EFFC19467FFD0B8
      A1FFBB8752FFB26F2EFFC19467FF0000000066B7E9FF65B7EAFF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF00000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFFEFEFEFFFEFEFEFF797979FFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF000000001632C5FF1632C5FF324A
      CAFF3048CAFF1632C5FF1632C5FF00000000979797FFF6F6F6FFF6F6F6FFF6F6
      F6FFF6F6F6FF00000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF797979FF0000000000000000B87D45FFB26F
      2EFFB26F2EFFB26F2EFFB26F2EFFB26F2EFFB26F2EFFB26F2EFFB26F2EFFB26F
      2EFFB26F2EFFB5773BFF000000000000000066B7E9FF65B7EAFF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF00000000797979FFFFFFFFFFFFFFFFFFFFFFFFFF9E9E
      9EFF777777FF777777FF777777FF777777FFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF8593E1FF1632C5FF1632C5FF0000
      0000000000001632C5FF1632C5FF8E9BE1FF979797FFF6F6F6FFC0966CFFC096
      6CFFC0966CFF00000000797979FFFFFFFFFFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFEFEFEFFFEFEFEFFFEFEFEFF797979FF000000000000000000000000CCB0
      94FFC5A17BFFC8AD91FFB98F63FFAE6F30FFAE6F30FFB17A44FFCAB39CFFC5A1
      7CFFCAAB8DFF00000000000000000000000066B7E9FF65B7EAFF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF00000000797979FFFFFFFFFFFFFFFFFFFFFFFFFF7878
      78FFFDFDFDFFFFFFFFFFBBBBBBFF8D8D8DFFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFDFF8695E1FF00000000E1CB
      B6FFF9F7F4FF000000008A98E1FF00000000979797FFF6F6F6FFF6F6F6FFF6F6
      F6FFF6F6F6FF00000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9E9E
      9EFF777777FF777777FF777777FF777777FF0000000000000000000000000000
      00000000000000000000777674FF6F6F6FFF6F6F6FFF707070FFBDB9B4FF0000
      00000000000000000000000000000000000066B7E9FF65B7EAFF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF00000000797979FFFFFFFFFFFFFFFFFFFFFFFFFF7878
      78FFFDFDFDFFBBBBBBFF888888FF00000000B3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFDFFFDFDFDFFB277
      3EFFB2773EFFD9BDA3FFE2CDB9FF00000000979797FFF6F6F6FFC0966CFFC096
      6CFFC0966CFF00000000797979FFFFFFFFFFB3773DFFB3773DFFFFFFFFFF7878
      78FFFDFDFDFFFFFFFFFFBBBBBBFF8D8D8DFF0000000000000000000000000000
      0000000000007A7A7AFF6F6F6FFF717171FF7A7A7AFF6F6F6FFF727272FF0000
      00000000000000000000000000000000000066B7E9FF65B7EAFF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF00000000797979FFFFFFFFFFFFFFFFFFFFFFFFFF7979
      79FFBABABAFF878787FF0000000000000000B3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB377
      3DFFF5EEE7FFF5EEE7FFB3773DFF00000000979797FFF6F6F6FFF6F6F6FFF6F6
      F6FFF6F6F6FF00000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7878
      78FFFDFDFDFFBBBBBBFF888888FF000000000000000000000000000000000000
      0000949494FF6F6F6FFF6F6F6FFFB0B0B0FF00000000727272FF6F6F6FFF8080
      80FF0000000000000000000000000000000066B7E9FF65B7EAFF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF00000000777777FF777777FF777777FF777777FF7777
      77FF8B8B8BFF000000000000000000000000B3773DFFB3773DFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3CDB8FFB377
      3DFFB3773DFFB3773DFFB3773DFF00000000979797FFF6F6F6FFC0966CFFC096
      6CFFF6F6F6FF00000000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7979
      79FFBABABAFF878787FF0000000000000000000000000000000000000000C3C3
      C3FF6F6F6FFF6F6F6FFF929292FF0000000000000000B2B2B2FF6F6F6FFF6F6F
      6FFFA9A9A9FF00000000000000000000000066B7E9FF65B7EAFF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000B1763CFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB1763DFF00000000979797FFF6F6F6FFF6F6F6FFF6F6
      F6FFF6F6F6FF00000000777777FF777777FF777777FF777777FF777777FF7777
      77FF8B8B8BFF0000000000000000000000000000000000000000000000008B8B
      8BFF6F6F6FFF777777FF000000000000000000000000000000008F8F8FFF6F6F
      6FFF757575FF00000000000000000000000066B7E9FF65B7EAFF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF66B7
      E9FF00000000000000000000000000000000CBA580FFB1763CFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB1763CFFCDA984FF00000000979797FFF6F6F6FFC0966CFFC096
      6CFFF6F6F6FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006F6F
      6FFF6F6F6FFFB9B9B9FF00000000000000000000000000000000000000007575
      75FF6F6F6FFFB2B2B2FF000000000000000066B7E9FF65B7EAFF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF66B7
      E9FF000000000000000000000000000000000000000000000000000000000000
      0000676767FF676767FFC0C0C0FFD7D7D7FF676767FF686868FF000000000000
      000000000000000000000000000000000000979797FFF6F6F6FFF6F6F6FFF6F6
      F6FFF6F6F6FF979797FFF4F4F4FFC6C6C6FFA2A2A2FF00000000000000000000
      0000000000000000000000000000000000000000000000000000ACACACFF6F6F
      6FFF949494FF000000000000000000000000000000000000000000000000B5B5
      B5FF6F6F6FFF8D8D8DFF000000000000000066B7E9FF65B7EAFF000000000000
      000000000000000000000000000000000000000000000000000065B7EAFF66B7
      E9FF000000000000000000000000000000000000000000000000000000006767
      67FF676767FF9C9C9CFF0000000000000000D8D8D8FF676767FF676767FF0000
      000000000000000000000000000000000000979797FFF6F6F6FFF6F6F6FFF6F6
      F6FFF6F6F6FF979797FFC5C5C5FFA1A1A1FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000959595FF7B7B
      7BFF000000000000000000000000000000000000000000000000000000000000
      0000949494FF747474FF00000000000000006EBAE9FF65B7EAFF000000007777
      77FF777777FF777777FF777777FF777777FF777777FF0000000065B7EAFF6EBA
      E9FF000000000000000000000000000000000000000000000000000000000000
      0000DCDCDCFF00000000000000000000000000000000B3B3B3FF676767FF6767
      67FF00000000000000000000000000000000A9A9A9FF969696FF969696FF9696
      96FF969696FF969696FFA4A4A4FF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009A9A9AFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008F8F8FFF00000000000000000000000000000000000000000000
      0000777777FF777777FF777777FF777777FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C39D76FFB88552FFB37840FFB17338FFB17438FFB47A42FFB98856FFC5A2
      7EFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000676767FF686868FF686868FF686868FF6868
      68FF686868FF686868FF686868FF676767FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084AB
      4AFF85AD4AFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000CBAE91FFB071
      34FFB07134FFB07134FFB07134FFB07134FFB07134FFB07134FFB07134FFB071
      34FFB07134FFD4C2B1FF00000000000000000000000000000000000000000000
      0000000000000000000000000000686868FFFEFEFEFFFFFFFFFFFFFFFFFFB0B0
      B0FFFFFFFFFFFFFFFFFFFFFFFFFF686868FF0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000084AB
      4AFF85AD4AFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B17234FFB071
      34FFB07134FFB07134FFB07134FFB07134FFB07134FFB07134FFB07134FFB071
      34FFB07134FFBA8754FF00000000000000000000000000000000000000000000
      0000000000000000000000000000686868FFFEFEFEFFFFFFFFFFFFFFFFFF9999
      99FFFFFFFFFFFFFFFFFFFFFFFFFF686868FFCEA986FFB1763DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFE8D8C9FF00000000000000000000000084AB
      4AFF85AD4AFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B27234FFB071
      34FFB07134FFB07134FFB07134FFB07134FFB07134FFB07134FFB07134FFB071
      34FFB07134FFBA8754FF00000000000000000000000000000000C5E1F2FF8FCB
      F2FF68B8EAFF59B2EAFF00000000686868FFB0B0B0FF999999FF999999FF9999
      99FF999999FF999999FFB0B0B0FF686868FFB1763CFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB2783FFF0000000085AD4AFF85AD4AFF85AD4AFF85AD
      4AFF85AD4AFF85AD4AFF85AD4AFF85AD4AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B9844EFFB071
      34FFB07134FFB07134FFB07134FFB07134FFB07134FFB07134FFB07134FFB071
      34FFB07133FFC39B73FF0000000000000000DDECF5FF57B0E8FF54AFE7FF50AD
      E7FF4FADE6FF4EADE6FF00000000686868FFFEFEFEFFFFFFFFFFFFFFFFFF9999
      99FFFFFFFFFFFFFFFFFFFFFFFFFF686868FFB3773DFFB3773DFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFF0000000085AD4AFF85AD4AFF85AD4AFF85AD
      4AFF85AD4AFF85AD4AFF85AD4AFF85AD4AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C7B39EFFB171
      32FFB07134FFB07134FFB07134FF0000000000000000B07134FFB07134FFB071
      34FFB27131FFCABEB1FF000000000000000055B1EAFF50ADE6FF90CBEFFFC4E3
      F6FFD3E9F8FFD4EAF8FF00000000686868FFFEFEFEFFFFFFFFFFFFFFFFFFB0B0
      B0FFFFFFFFFFFFFFFFFFFFFFFFFF686868FFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF00000000000000000000000084AB
      4AFF85AD4AFF00000000000000000000000000000000374FCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF000000008D8D8DFF787A7BFF00000000B880
      46FFB07133FFB07134FF000000000000000000000000CEB69EFFB07134FFB171
      33FFBF9A72FF00000000797A7BFF979797FF87C7F0FFCAE5F6FF8AC8EEFF58B0
      E8FF4EADE6FF4EADE6FF00000000946332FFBC7D40FFBC7D40FFBC7D40FFBC7D
      40FFBC7D40FFBC7D40FFBC7D40FF946332FFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000084AB
      4AFF85AD4AFF00000000B2783FFF0000000000000000374FCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF00000000848484FF838383FF7B7E7EFF0000
      0000B7834DFFCAB095FF00000000000000000000000000000000C29D75FFBD94
      68FF000000007A7C7DFF828282FF8D8D8DFF87C7F0FF4DABE6FF54AFE7FF57B0
      E7FF58B1E8FF58B1E8FF00000000946332FFBC7D40FFBC7D40FFBC7D40FFBC7D
      40FFBC7D40FFBC7D40FFBC7D40FF946332FFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000084AB
      4AFF85AD4AFF00000000B2783FFF0000000000000000374FCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324B
      CCFF324BCCFF324BCCFF324BCCFF000000009A9A9AFF818181FF7C7C7CFFA3A5
      A5FF0000000000000000C09970FFB07134FFB07134FFC4A17CFF000000000000
      00009C9D9EFF7E7E7EFF808080FFA4A4A4FFCAE2F3FF57B1E8FF58B1E8FF58B1
      E8FF58B1E8FF5AB1E6FF00000000946332FF946332FF946332FF946332FF9463
      32FF946332FF946332FF946332FF946332FFB3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFF0000
      000000000000E8D8C9FFB3773DFF00000000000000003B53CDFF364FCCFF364F
      CCFF364FCCFF364FCCFF364FCCFF364FCCFF364FCCFF364FCCFF364FCCFF364F
      CCFF364FCCFF364FCCFF364FCCFF0000000000000000797979FFA1A1A1FF0000
      000000000000B58049FFB07133FFB07134FFB07134FFB07133FFBA8D5FFF0000
      000000000000979898FF7D7D7DFF000000000000000000000000ABD7F3FF94CC
      EEFF00000000C4E4F8FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3773DFFB3773DFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB377
      3DFFF5EEE7FFF5EEE7FFB3773DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009EA1
      A2FF00000000B17132FFB07134FFB07134FFB07134FFB07134FFB27132FF0000
      0000A0A2A2FF000000000000000000000000000000000000000000000000DCEE
      FAFF57B0E8FF54AFE7FF50ADE7FF4EADE6FF4EADE6FF4EADE6FF4EABE6FF4FAD
      E7FF54AFE7FF57B0E8FFD8ECF8FF00000000B3773DFFB3773DFFE3CDB8FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE3CDB8FFB377
      3DFFB3773DFFB3773DFFB3773DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7BFF8386
      8AFFCDBCABFFB17133FFB07134FFB07134FFB07134FFB07134FFB17132FFD0C4
      B8FF797C80FF7E7E7EFF000000000000000000000000000000000000000055B1
      EAFF50ADE6FF90CBEFFFC4E3F6FFD4EAF8FFD7EBF8FFD8EBFAFFDEF0FAFFC4E3
      F5FF8FCAEFFF50ABE6FF54AFE7FF00000000B1763CFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB3773DFFB1763DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B8B8B8FF7D7D7DFF8689
      8BFFCDBDADFFB17133FFB07134FFB07134FFB07134FFB07134FFB17132FF0000
      00007D8184FF7D7D7DFFBFBFBFFF0000000000000000000000000000000087C7
      F0FFCAE5F6FF8AC8EEFF58B0E8FF4EADE6FF4EADE6FF4EADE6FF4CABE6FF65B6
      E9FF9CCFF0FFDEEFFAFF82C3EDFF00000000CBA580FFB1763CFFB3773DFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFB1763CFFCDA984FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBFFF7C7C7CFF7C7E
      81FF00000000B27131FFB07134FFB07134FFB07134FFB07134FFB27131FF0000
      00007C7E81FF7B7B7BFFC5C5C5FF0000000000000000000000000000000087C7
      F0FF4DABE6FF54AFE7FF57B0E7FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF56B0
      E7FF53AEE7FF4AAAE6FF9DD1F1FF000000000000000000000000000000000000
      0000676767FF676767FFC0C0C0FFD7D7D7FF676767FF686868FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008B8B8BFF7778
      78FFADABA9FFB98957FFB07133FFB07134FFB07134FFB07133FFBE986FFFA6A4
      A2FF777878FF919191FF0000000000000000000000000000000000000000C9E4
      F6FF57B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF58B1
      E8FF58B1E8FF57B0E8FFC3E1F4FF000000000000000000000000000000006767
      67FF676767FF9C9C9CFF0000000000000000D8D8D8FF676767FF676767FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C7A584FFB57D46FFB67E49FFCAAD90FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000AAD7F3FF76BEE9FF58B1E8FF58B1E8FF58B1E8FF58B1E8FF74BD
      EAFFA8D6F2FF0000000000000000000000000000000000000000000000000000
      0000DCDCDCFF00000000000000000000000000000000B3B3B3FF676767FF6767
      67FF000000000000000000000000000000000000000000000000000000000000
      000000000000A9692AFFCDB59EFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000959595FF777777FF777777FF777777FF777777FF777777FF777777FF9393
      93FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000AD6C2FFFCEAE8FFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008E8E8EFF595959FF5F5F
      5FFF00000000CFBAA5FFAB6A2AFFA9692AFF0000000000000000ABABABFF5959
      59FF8B8B8BFF0000000000000000000000000000000000000000000000000000
      0000777777FFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7878
      78FF000000000000000000000000000000000000000000000000006500FF0065
      00FF006500FF2A5D16FF2A5D16FF000000000000000000659AFF000000000000
      000000000000000000000000000000000000AD6D31FFAA6524FFAA6524FFD3AC
      87FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000595959FFFDFDFDFFFFFF
      FFFFEEEEEEFF00000000A9692AFF0000000000000000A9692AFF00000000EDED
      EDFF595959FF0000000000000000000000000000000000000000000000000000
      0000777777FFFFFFFFFFD9BB9EFFD9BB9EFFD9BB9EFFD9BB9EFFFFFFFFFF7878
      78FF0000000000000000000000000000000000000000006500FF04A60CFF04AD
      09FF006500FF009007FF00659AFF005700FF00659AFF37B9FAFF00659AFF0000
      000000659AFF000000000000000000000000D0B295FFAA6524FFAA6524FFAA65
      24FFD3AA82FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000595959FFFDFDFDFFFFFF
      FFFFFBFBFBFF000000000000000000000000AB6A2AFFAC6E30FFA9692AFF0000
      0000ABABABFF0000000000000000000000000000000000000000000000000000
      0000777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7878
      78FF0000000000000000000000000000000000000000006500FF10B120FF0EB1
      1EFF006500FF00659AFF36C5D5FF00659AFF00659AFF37B9FAFF00659AFF0065
      9AFF61C4DDFF00659AFF000000000000000000000000D5B393FFAA6524FFAA65
      24FFAA6524FFD2A87EFF0000000000000000CFAE90FFC99F76FFCBA580FFD5C1
      AEFF0000000000000000000000000000000000000000595959FFFDFDFDFFFFFF
      FFFFFFFFFFFFF8F8F8FF00000000A9692AFFAD7033FFAB6A2AFFAC6E30FFA969
      2AFF00000000000000000000000000000000868686FF777777FF777777FF7777
      77FF777777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7878
      78FF777777FF777777FF777777FF8C8C8CFF00000000006500FF1ABA34FF1ABB
      34FF006500FF29A36CFF00659AFF37D2F7FF17C5F1FF20BBF8FF2FB2E3FF48BE
      DEFF00659AFF0000000000000000000000000000000000000000D5B596FFAA65
      24FFAA6524FFAA6524FFBF8349FFAA6524FFAA6524FFAA6524FFAA6524FFAA65
      24FFAA6626FF00000000000000000000000000000000595959FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFF8F8F8FF00000000A9692AFFAD7033FFAB6A2AFFAC6E
      30FFA9692AFF000000000000000000000000777777FF00000000000000007777
      77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF777777FF00000000006500FF23C247FF22C6
      47FF006500FF00659AFF00659AFF6CE5FFFF23C7DEFF00659AFF20A8C2FF39BA
      ECFF00659AFF00659AFF0000000000000000000000000000000000000000D6B7
      9AFFAA6524FFAA6524FFAA6524FFAA6524FFC48A52FFD3AA82FFCFA071FFAA65
      24FFAA6524FFAA6524FFD8BDA4FF0000000000000000595959FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FF00000000A9692AFFAD7033FFAB6A
      2AFFAC6E30FFA9692AFF0000000000000000777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF777777FF00000000006500FF2DCE5BFF1EBE
      44FF00659AFFBBE5F3FFB9EEF5FF86E0F8FF00659AFF17842FFF00659AFF21AB
      D0FF35B6E9FF4EC1E5FF00659AFF000000000000000000000000000000000000
      0000C38D59FFAA6524FFAA6524FFF6EBE1FFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFC49568FFAA6524FFAA6524FF0000000000000000595959FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FF00000000A9692AFFAD70
      33FFAB6A2AFFAC6E30FF0000000000000000777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF777777FF00000000006500FF36D76CFF2FD0
      62FF006500FF00659AFF00659AFFB2EDFDFFB2EDFDFF00659AFF1ABCE5FF1ABC
      E5FF00659AFF00659AFF00000000000000000000000000000000000000000000
      0000AA6524FFAA6524FFF5E9DEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB77D46FFAA6524FFC19A73FF00000000595959FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FF00000000A969
      2AFFAD7033FF0000000000000000A9692AFF777777FF777777FFD7D7D7FFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFD9D9D9FF777777FF777777FF00000000006500FF40E17BFF41E3
      7EFF006500FF1CAF52FF00659AFFDFFCFFFFB0EAF5FF5FC9C9FF44D1EBFF22DC
      FFFF00659AFF000000000000000000000000000000000000000000000000D1B5
      9AFFAA6524FFC2864BFFFDFDFDFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFFDFDFDFFEBD6C2FFAA6524FFB0733AFF00000000595959FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8FF0000
      00000000000000000000A9692AFFA9692AFF777777FF777777FFFCFCFCFFBC89
      55FFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFBD8956FFFEFEFEFF777777FF777777FF00000000006500FF49EA86FF4AEC
      8AFF006500FF00659AFFD2F3FFFF00659AFF00659AFFB5F4FFFF00659AFF0065
      9AFF1DD2FBFF00659AFF0000000000000000000000000000000000000000CBA5
      81FFAA6524FFD1A479FFFDFDFDFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFFDFDFDFFF9F2ECFFAA6524FFAA6524FF00000000595959FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFF6F6
      F6FF00000000A9692AFFA9692AFFD3C2B2FF777777FF777777FFFBFBFAFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFFDFDFCFF777777FF777777FF00000000006500FF54F48DFF55F7
      92FF006500FF48C280FF00659AFF3CD082FF00659AFFD7F1FFFF00659AFF0065
      00FF00659AFF000000000000000000000000000000000000000000000000CEAD
      8DFFAA6524FFCB9865FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF2E5D9FFAA6524FFAC6A2CFF00000000595959FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF959595FF595959FF595959FF5959
      59FF6F6F6FFF000000000000000000000000848484FF777777FFFBFBFAFFB377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFFFDFDFCFF777777FF898989FF00000000006500FF61FF9EFF61FF
      A2FF006500FF47D473FF57FC93FF51F486FF57DE99FF00659AFF61E4ABFF0065
      00FF000000000000000000000000000000000000000000000000000000000000
      0000AA6524FFAA6524FFFDFDFDFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFFDFDFDFFD5A97EFFAA6524FFB98858FF00000000595959FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF595959FFFEFEFEFFFFFFFFFFBBBB
      BBFF808080FF000000000000000000000000000000000000000000000000B377
      3DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB3773DFFB377
      3DFFB3773DFF00000000000000000000000000000000006500FF52E987FF3DB5
      56FF006500FF006500FF33C658FF45E378FF57F991FF5BFE98FF5BFE98FF0065
      00FF000000000000000000000000000000000000000000000000000000000000
      0000AE7034FFAA6524FFBD8956FFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFDFD
      FDFFF0DECCFFAA6524FFAA6524FFD5C1AEFF00000000595959FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF595959FFFEFEFEFFBCBCBCFF7C7C
      7CFF000000000000000000000000000000000000000000000000000000000000
      0000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF7777
      77FF0000000000000000000000000000000000000000006500FF006500FF7D78
      5BFFD8C5C1FFD8DBCEFF006500FF006500FF006500FF5BFE98FF5CF893FF0065
      00FF000000000000000000000000000000000000000000000000000000000000
      000000000000AA6524FFAA6524FFB27339FFE6CDB5FFF4E9DFFFF0E0D1FFD3A5
      79FFAA6524FFAA6524FFC18953FF0000000000000000595959FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF595959FFBCBCBCFF7B7B7BFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000797979FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFF7777
      77FF00000000000000000000000000000000000000000000000000000000165E
      0AFF2A5D16FF2A5D16FF7D785BFFC6A4A1FFC6A4A1FF006500FF006500FF0065
      00FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AA6524FFAA6524FFAA6524FFAA6524FFAA6524FFAA65
      24FFAA6524FFC28A55FF0000000000000000000000008E8E8EFF595959FF5959
      59FF595959FF595959FF595959FF595959FF595959FF7E7E7EFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000939393FF777777FF777777FF777777FF777777FF777777FF777777FF9595
      95FF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000006500FF006500FF006500FF006500FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6A585FFB47C48FFAD6C2FFFAF7136FFBB8D
      5FFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFF717171FF6D6D6DFF000000000000
      000000000000000000000000000000000000959595FF686868FF686868FF6868
      68FF686868FF686868FF686868FF686868FF686868FF686868FF686868FF6868
      68FF686868FF686868FF686868FF949494FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFFC5C5C5FF6D6D6DFF000000000000
      000000000000000000000000000000000000686868FFFEFEFEFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FF0000000000000000000000000000
      0000000000000000000089AD55FF89AD55FF89AD55FF89AD55FF000000000000
      0000000000000000000000000000000000000000000000000000000000008C98
      D6FF000000000000000000000000000000000000000000000000000000000000
      00008390D5FF0000000000000000000000000000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFFC5C5C5FF6D6D6DFF000000000000
      000000000000000000000000000000000000686868FFFEFEFEFFFFFFFFFF8383
      83FF686868FF686868FF686868FF959595FFC8C8C8FF6D6D6DFF575757FF7B7B
      7BFFE5E5E5FFFFFFFFFFFFFFFFFF686868FF0000000000000000000000000000
      0000000000000000000089AD55FF89AD55FF89AD55FF89AD55FF000000000000
      00000000000000000000000000000000000000000000000000008693D6FF324B
      CCFF3C53CDFF000000000000000000000000000000000000000000000000455B
      CEFF324BCCFF7484D3FF00000000000000000000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFFC5C5C5FF6D6D6DFF000000000000
      000000000000000000000000000000000000686868FFFEFEFEFFFFFFFFFF7979
      79FF363636FF828282FF9B9B9BFFBBBBBBFF858585FF888888FFA9A9A9FF5A5A
      5AFF616161FFFFFFFFFFFFFFFFFF686868FF0000000000000000000000000000
      0000000000000000000089AD55FF89AD55FF89AD55FF89AD55FF000000000000
      00000000000000000000000000000000000000000000909CD7FF324BCCFF324B
      CCFF324BCCFF3C53CDFF00000000000000000000000000000000455BCEFF324B
      CCFF324BCCFF324BCCFF808ED5FF000000000000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFFC5C5C5FF6D6D6DFF000000000000
      000000000000000000000000000000000000686868FFFEFEFEFFFFFFFFFFF7F7
      F7FF6B6B6BFF525252FFEDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA2A2
      A2FF3B3B3BFFFFFFFFFFFFFFFFFF686868FF0000000000000000000000000000
      0000000000000000000089AD55FF89AD55FF89AD55FF89AD55FF000000000000
      00000000000000000000000000000000000000000000000000004359CEFF324B
      CCFF324BCCFF324BCCFF3C53CDFF0000000000000000455BCEFF324BCCFF324B
      CCFF324BCCFF3F56CDFF00000000000000000000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFFC5C5C5FF6D6D6DFF000000000000
      000000000000000000000000000000000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFF5F5F5FF5E5E5EFF676767FFFEFEFEFFFDFDFDFF848484FF737373FF3D3D
      3DFF878787FFFFFFFFFFFFFFFFFF686868FF0000000000000000000000000000
      0000000000000000000089AD55FF89AD55FF89AD55FF89AD55FF000000000000
      0000000000000000000000000000000000000000000000000000000000004359
      CEFF324BCCFF324BCCFF324BCCFF3C53CDFF445ACEFF324BCCFF324BCCFF324B
      CCFF3F56CDFF0000000000000000000000000000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFFC5C5C5FF6D6D6DFF000000000000
      000000000000000000000000000000000000686868FFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFDCDCDCFF373737FFC6C6C6FFFEFEFEFF979797FF7A7A7AFF3838
      38FFC1C1C1FFFFFFFFFFFFFFFFFF686868FF000000008BAE59FF89AD55FF89AD
      55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD
      55FF89AD55FF89AD55FF89AD55FF000000000000000000000000000000000000
      00004359CEFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF3F56
      CDFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000006D6D6DFF6D6D6DFFC5C5C5FF6D6D6DFF000000000000
      000000000000000000000000000000000000686868FFFEFEFEFFFFFFFFFFE0E0
      E0FFFBFBFBFFFBFBFBFF3E3E3EFFA4A4A4FFEBEBEBFFF7F7F7FFFFFFFFFF5A5A
      5AFF7A7A7AFFFFFFFFFFFFFFFFFF686868FF000000008BAE59FF89AD55FF89AD
      55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD
      55FF89AD55FF89AD55FF89AD55FF000000000000000000000000000000000000
      0000000000004359CEFF324BCCFF324BCCFF324BCCFF324BCCFF3F56CDFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008C8C8CFF6D6D6DFF6D6D6DFFC6C6C6FF848484FF8E8E8EFF0000
      000000000000000000000000000000000000686868FFFEFEFEFFFFFFFFFF6B6B
      6BFF505050FF5D5D5DFF373737FFD1D1D1FF9E9E9EFF494949FF6D6D6DFF3737
      37FF9D9D9DFFFFFFFFFFFFFFFFFF686868FF000000008BAE59FF89AD55FF89AD
      55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD
      55FF89AD55FF89AD55FF89AD55FF000000000000000000000000000000000000
      000000000000455BCEFF324BCCFF324BCCFF324BCCFF324BCCFF3C53CDFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00009F9F9FFF6D6D6DFF6D6D6DFF6D6D6DFF858585FFE9E9E9FF797979FFA2A2
      A2FF00000000000000000000000000000000686868FFFEFEFEFFFFFFFFFFF0F0
      F0FFA7A7A7FF939393FFCCCCCCFFFFFFFFFFFAFAFAFFB4B4B4FF909090FFB0B0
      B0FFFBFBFBFFFFFFFFFFFFFFFFFF686868FF000000008DAF5CFF8BAE58FF8BAE
      58FF8BAE58FF8BAE58FF89AD55FF89AD55FF89AD55FF89AD55FF8BAE58FF8BAE
      58FF8BAE58FF8BAE58FF8BAE58FF000000000000000000000000000000000000
      0000455BCEFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF3C53
      CDFF00000000000000000000000000000000000000000000000000000000B4B4
      B4FF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFFC9C9C9FFDFDFDFFF7171
      71FFB7B7B7FF000000000000000000000000686868FFFDFDFDFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF686868FF0000000000000000000000000000
      0000000000000000000089AD55FF89AD55FF89AD55FF89AD55FF000000000000
      000000000000000000000000000000000000000000000000000000000000455B
      CEFF324BCCFF324BCCFF324BCCFF3F56CDFF4359CEFF324BCCFF324BCCFF324B
      CCFF3C53CDFF0000000000000000000000000000000000000000000000007070
      70FF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF808080FFFCFCFCFFCECE
      CEFF717171FF000000000000000000000000324ACAFF324ACAFF324ACAFF324A
      CAFF324ACAFF324ACAFF324ACAFF324ACAFF324ACAFF324ACAFF324ACAFF324A
      CAFF324ACAFF324ACAFF324ACAFF324ACAFF0000000000000000000000000000
      0000000000000000000089AD55FF89AD55FF89AD55FF89AD55FF000000000000
      0000000000000000000000000000000000000000000000000000455BCEFF324B
      CCFF324BCCFF324BCCFF3F56CDFF00000000000000004359CEFF324BCCFF324B
      CCFF324BCCFF3C53CDFF00000000000000000000000000000000777777FF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFFC3C3C3FFFFFF
      FFFFB9B9B9FF797979FF0000000000000000324ACAFF324ACAFF324ACAFF324A
      CAFF324ACAFF314ACBFF314ACBFF314ACBFF314ACBFF314ACBFF314ACBFF324A
      CAFF324ACAFF324ACAFF324ACAFF324ACAFF0000000000000000000000000000
      0000000000000000000089AD55FF89AD55FF89AD55FF89AD55FF000000000000
      00000000000000000000000000000000000000000000ABB2DAFF354DCCFF324B
      CCFF324BCCFF3F56CDFF000000000000000000000000000000004359CEFF324B
      CCFF324BCCFF344CCCFFA4ACD9FF0000000000000000858585FF6D6D6DFF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF7B7B7BFFFAFA
      FAFFFEFEFEFF9F9F9FFF878787FF00000000324ACAFF324ACAFF000000006868
      68FF00000000324ACAFF324ACAFF324ACAFF324ACAFF324ACAFF324ACAFF0000
      0000686868FF00000000324ACAFF324ACAFF0000000000000000000000000000
      0000000000000000000089AD55FF89AD55FF89AD55FF89AD55FF000000000000
      0000000000000000000000000000000000000000000000000000A7AFDAFF354D
      CCFF3F56CDFF0000000000000000000000000000000000000000000000004359
      CEFF344CCCFFA2ABD9FF0000000000000000A4A4A4FF6D6D6DFF6D6D6DFF6D6D
      6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6D6D6DFF6F6F
      6FFF6F6F6FFF6D6D6DFF6D6D6DFFA8A8A8FF324ACAFF324ACAFF000000006868
      68FF00000000324ACAFF324ACAFF324ACAFF324ACAFF324ACAFF324ACAFF0000
      0000686868FF00000000324ACAFF324ACAFF0000000000000000000000000000
      000000000000000000008FB15FFF8FB15FFF8FB15FFF8FB15FFF000000000000
      000000000000000000000000000000000000000000000000000000000000A9B1
      DAFF000000000000000000000000000000000000000000000000000000000000
      0000A6AED9FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006868
      68FF000000000000000000000000000000000000000000000000000000000000
      0000686868FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000A00100000100010000000000000D00000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF00000000FFFFFFFF00000000
      FE00FE0000000000FE00FE0000000000FE00FE00000000008000800000000000
      8000800000000000800080000000000080008000000000008001800100000000
      80038003000000008007800700000000807F807F0000000080FF80FF00000000
      81FF81FF00000000FFFFFFFF000000009FF30000FFFFFFFF0FE10000FFFFFC00
      07C10000FE00800003810000FE00000081030000FE000000C007000080000000
      E00F000080000001F81F00008000000380310000800000030010000080010003
      00000000800300031100000080070FC331810000807F00036183000080FF8007
      C007000081FFF87FC20F0000FFFFFFFFFFFF00008001FF07C003000080010001
      C003000080010000C003000080010000C003000080010000C003000080010000
      4003000080010000C003000080010001C003000080010001C003000080010001
      C003000080010001C003000080010001C003000080010001C003000080032829
      C003000080072829FFFF0000800FEFEF000000000000FE63000000000000F823
      000000000000F823000000000000C00000000000000000000000000000000001
      00000000000080030000000000008003000000000000C007000000000000C007
      000000000000E007000000000000E00F000000000000E00F000000000000F01F
      000000000000F83F000000000000FC3F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF240000000000000024
      0000000000000024000000000000002400000000000000000000000000000000
      0000000000000000000000000000C00F000000000000F03F000000000000F03F
      000000000000E01F000000000000E01F000000000000E01F000000000000E01F
      000000000000E01F000000000000F03F00000000000000000000000000000000
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.xls'
    FileName = 'file1'
    Filter = 
      #1058#1077#1082#1089#1090'(*.txt)|*.TXT|CSV '#1092#1072#1081#1083'(*.csv)|*.CSV|HTML '#1092#1072#1081#1083' (*.htm)|*.HTM' +
      '|Rich Text Format (*.rtf)|*.RTF|Microsoft Excel Workbook (*.xls)' +
      '|*.XLS'
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
end
