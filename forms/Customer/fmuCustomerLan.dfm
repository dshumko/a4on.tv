object apgCustomerLan: TapgCustomerLan
  Left = 0
  Top = 0
  Caption = #1057#1077#1090#1100' | LAN'
  ClientHeight = 253
  ClientWidth = 868
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object splitter: TSplitter
    Left = 535
    Top = 0
    Height = 253
    Align = alRight
  end
  object dbgCustLAN: TDBGridEh
    Left = 26
    Top = 0
    Width = 509
    Height = 253
    Align = alClient
    AllowedOperations = []
    DataSource = srcLan
    DynProps = <>
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    ParentFont = False
    STFilter.InstantApply = True
    STFilter.Local = True
    STFilter.Location = stflInTitleFilterEh
    STFilter.Visible = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    OnCellMouseClick = dbgCustLANCellMouseClick
    OnDblClick = dbgCustLANDblClick
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IP'
        Footers = <>
        Title.TitleButton = True
        Width = 121
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        EditMask = 'AA:AA:AA:AA:AA:AA'
        FieldName = 'MAC'
        Footers = <>
        Title.TitleButton = True
        Width = 151
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'E_NAME'
        Footers = <>
        Title.Caption = #1082#1086#1084'-'#1088'/'#1084#1086#1076#1077#1084
        Title.TitleButton = True
        Width = 119
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EQ_IP'
        Footers = <>
        Title.Caption = 'IP '#1082#1086#1084'-'#1088#1072'/'#1084#1086#1076#1077#1084#1072
        Title.TitleButton = True
        Width = 123
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PORT'
        Footers = <>
        Title.Caption = #1055#1086#1088#1090
        Title.TitleButton = True
        Width = 34
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'V_NAME'
        Footers = <>
        Title.Caption = 'VLAN'
        Title.TitleButton = True
        Width = 74
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 93
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'VLAN_NUM'
        Footers = <>
        Title.Caption = 'VLAN N'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IPV6'
        Footers = <>
        Title.Caption = 'IPv6'
        Title.TitleButton = True
        Width = 148
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'TAG'
        Footers = <>
        Title.Caption = 'TAG_INT'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'TAG_STR'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EQ_MAC'
        Footers = <>
        Title.Caption = 'MAC '#1082#1086#1084'-'#1088#1072'/'#1084#1086#1076#1077#1084#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_NAME'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103'|'#1059#1083#1080#1094#1072
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_NO'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103'|'#1044#1086#1084
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PLACE'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103'|'#1052#1077#1089#1090#1086
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WNAME'
        Footers = <>
        Title.Caption = #1050#1072#1073#1077#1083#1100
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WLABEL'
        Footers = <>
        Title.Caption = #1052#1077#1090#1082#1072
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SPEED'
        Footers = <>
        Title.Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1087#1086#1088#1090#1072
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 253
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      26
      253)
    object btnDel1: TSpeedButton
      Left = 2
      Top = 230
      Width = 22
      Height = 22
      Action = actDel
      Anchors = [akLeft, akBottom]
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008C98D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008390D500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008693D600334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00465CCE00334CCC007584D300FF00FF00FF00FF00FF00FF00909C
        D700334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00
        FF00465CCE00334CCC00334CCC00334CCC00808ED500FF00FF00FF00FF00FF00
        FF00445ACE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00465C
        CE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00445ACE00334CCC00334CCC00334CCC003D54CD00455BCE00334C
        CC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334CCC00334C
        CC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334C
        CC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334C
        CC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334CCC00334C
        CC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00465CCE00334CCC00334CCC00334CCC004057CD00445ACE00334C
        CC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00465CCE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00445A
        CE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00ABB2
        DA00364ECC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
        FF00445ACE00334CCC00334CCC00354DCC00A4ACD900FF00FF00FF00FF00FF00
        FF00A7AFDA00364ECC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00445ACE00354DCC00A2ABD900FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A9B1DA00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00A6AED900FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Layout = blGlyphTop
    end
    object btnAdd1: TSpeedButton
      Left = 2
      Top = 3
      Width = 22
      Height = 22
      Action = actAdd
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008BAE
        5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
        560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008BAE
        5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
        560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008BAE
        5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
        560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008DAF
        5D008BAE59008BAE59008BAE59008BAE590089AD560089AD560089AD560089AD
        56008BAE59008BAE59008BAE59008BAE59008BAE5900FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF008FB160008FB160008FB160008FB1
        6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object btnEdit1: TSpeedButton
      Left = 2
      Top = 31
      Width = 22
      Height = 22
      Action = actEdit
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00A96A2B00CDB59E00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008E8E
        8E005A5A5A0060606000FF00FF00CFBAA500AB6B2B00A96A2B00FF00FF00FF00
        FF00ABABAB005A5A5A008B8B8B00FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00EEEEEE00FF00FF00A96A2B00FF00FF00FF00FF00A96A
        2B00FF00FF00EDEDED005A5A5A00FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FBFBFB00FF00FF00FF00FF00FF00FF00AB6B2B00AC6F
        3100A96A2B00FF00FF00ABABAB00FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00F8F8F800FF00FF00A96A2B00AD713400AB6B
        2B00AC6F3100A96A2B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00F8F8F800FF00FF00A96A2B00AD71
        3400AB6B2B00AC6F3100A96A2B00FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F800FF00FF00A96A
        2B00AD713400AB6B2B00AC6F3100A96A2B00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F800FF00
        FF00A96A2B00AD713400AB6B2B00AC6F3100FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8
        F800FF00FF00A96A2B00AD713400FF00FF00FF00FF00A96A2B00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00F8F8F800FF00FF00FF00FF00FF00FF00A96A2B00A96A2B00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
        FE00FEFEFE00F6F6F600FF00FF00A96A2B00A96A2B00D3C2B200FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00959595005A5A
        5A005A5A5A005A5A5A0070707000FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A5A5A00FEFE
        FE00FFFFFF00BBBBBB0080808000FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A5A5A00FEFE
        FE00BCBCBC007D7D7D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A5A5A00BCBC
        BC007C7C7C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008E8E
        8E005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A007F7F
        7F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object btnActLanPing: TSpeedButton
      Left = 2
      Top = 59
      Width = 22
      Height = 22
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00464747004647470046474700FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0043434400BAB8B9009595950072707300656363009B9192005150
        5100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0037393A0077787A007B7A7A009E919400847D7F00585657005150
        5100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D5C2AC00F1D6A900D2C0AA00B6ADA6008882890065636C004E50
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D4A45A00FFAD0F00FFC35200FFCF7000E6C79900CCB7A3007471
        740048484900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D3AC6B00FBB32A00FEC05100FFC35400FFBE4400FFB83400FEAF
        2C005E544500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D3B17400FABE4000FFCE6B00FFD16F00FFCD6700FEC65C00F7B0
        34005C534500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D1B98400F9D06600FEE19300FEE69A00FFE08E00FFDA8000ECBB
        5F0059544A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00D4BD8800FEDC7100FFEBA400FFF2B100FFE89E00FFDE8C00ECBE
        660059544C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A6A29B00B2A99900B3AD9800BCB99F00D3C39500E0C58600EDC1
        6E005B554E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF004F5153005355580073737600999799009E9A9A00A39D9F00A696
        8A0055525000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00904B0600B2A887006B240000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0002679B0002679B0002679B0002679B00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00F39B3F00F39B
        3F00F39B3F00F39B3F00F39B3F00C2FFFF008AEAFF004BE9FF0002679B00F39B
        3F00F39B3F00F39B3F00F39B3F00F39B3F00F39B3F00F39B3F00FFF0C200FFF0
        C200FFF0C200FFF0C200FFF0C200DEFFFF00A7EDFF006CEDFF0002679B00FFF0
        C200FFF0C200FFF0C200FFF0C200FFF0C200FFF0C200FFF0C200FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0002679B0002679B0002679B0002679B00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      PopupMenu = pmLanPopUp
      OnClick = btnActLanPingClick
    end
    object btnOpen: TSpeedButton
      Left = 2
      Top = 101
      Width = 22
      Height = 22
      Action = actOpenObject
      Flat = True
      Glyph.Data = {
        EE010000424DEE01000000000000EE0000002800000010000000100000000100
        08000000000000010000C40E0000C40E00002E0000002E000000F0F0F000BFCE
        AA00B2C59800B2BF9F00AEB5A500D7D9D500B4C39F00B5B8B1008DAC6400B4B7
        B100759648007DA14D00D7D9D300B9CAA300ABC1CC008DB2C200C3CBCF002B75
        96004887A3009AAFB800A5B1B600D2D5D7008DB1C200A1AFB600163E5000A3B0
        B70090BFDC0070BBE90063B6E9009EC5DD005CA9D80090C1DF005398C3008FBB
        D6004B89AE0092B6CD004279990094B3C7003969850096B0C0003059720099AF
        BB001F3A4A0062B4E70063B5E800A1AEB6002A2B1C1C1C1C1C1C1C1C1C1C1C2C
        2D00281C1C1C1C1C1C1C1C1C1C1C1C1C2900261C1C1C1C1C1C1C1C1C1C1C1C1C
        2700241C1C1C1C1C1C1C1C1C1C1C1C1C2500221C1C1C1C1C1C1C1C1C1C1C1C1C
        2300201C1C1C1C1C1C1C1C1C1C1C1C1C21001E1C1C1C1C1C1C1C1C1C1C1C1C1C
        1F001A1B1C1C1C1C1C1C1C1C1C1C1C1B1D000017181818181818181818181819
        0000000F1111111111111111111111160000000F111111111213141414141415
        0000000E0F0F0F0F100000000000000000000000000000000000000000000C0D
        020200000000000000000000000000090A0B0000000000000000000000000506
        070800000000000000000001020203000004}
      PopupMenu = pmLanPopUp
    end
  end
  object PanelIPTV: TPanel
    Left = 538
    Top = 0
    Width = 330
    Height = 253
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    object Label7: TLabel
      Left = 0
      Top = 0
      Width = 330
      Height = 13
      Hint = 
        #1059#1089#1083#1091#1075#1080' '#1076#1083#1103' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072', '#13#10#1077#1089#1083#1080' '#1085#1077' '#1091#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086' '#1074#1089#1077' '#1087#1072#1082#1077#1090#1099' '#1085#1072' '#1082#1086#1090#1086 +
        #1088#1099#1077' '#1087#1086#1076#1087#1080#1089#1072#1085' '#1072#1073#1086#1085#1077#1085#1090
      Align = alTop
      Caption = '.:: '#1059#1089#1083#1091#1075#1080' '#1076#1083#1103' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072' ::.'
      ExplicitWidth = 148
    end
    object DBGridEh1: TDBGridEh
      Left = 26
      Top = 13
      Width = 304
      Height = 240
      Align = alClient
      DataSource = srcIPPacket
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      TabOrder = 1
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1059#1089#1083#1091#1075#1072
          Width = 86
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 127
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object pnlPack: TPanel
      Left = 0
      Top = 13
      Width = 26
      Height = 240
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object btnAddPack: TSpeedButton
        Left = 0
        Top = 0
        Width = 26
        Height = 26
        Action = actAddPack
        Align = alTop
        Flat = True
      end
      object btnDelPacket: TSpeedButton
        Left = 0
        Top = 214
        Width = 26
        Height = 26
        Action = actDelPack
        Align = alBottom
        Flat = True
      end
    end
  end
  object dsLAN: TpFIBDataSet
    UpdateSQL.Strings = (
      ''
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TV_LAN'
      'WHERE'
      '    LAN_ID = :OLD_LAN_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    f.*'
      '  , e.name as E_NAME'
      '  , e.IP as EQ_IP'
      '  , e.MAC as EQ_MAC'
      '  , v.name as V_NAME'
      '  , v.VLAN_NUM'
      '  , s.Street_Name||'#39' '#39'||s.Street_Short Street_Name'
      '  , h.House_No'
      '  , p.Speed'
      '  , p.Wlabel'
      '  , w.Name WNAME'
      '  from tv_lan f'
      '       left outer join vlans v on (f.vlan_id = v.v_id)'
      '       left outer join equipment e on (f.eq_id = e.eid)'
      '       left outer join house h on (h.House_Id = f.House_Id)'
      '       left outer join street s on (s.Street_Id = h.Street_Id)'
      
        '       left outer join port p on (p.Eid = f.Eq_Id and p.Port = f' +
        '.Port)'
      '       left outer join wire w on (w.Wid = p.Wid)'
      'where(  f.CUSTOMER_ID = :CUSTOMER_ID'
      '     ) and (     F.LAN_ID = :OLD_LAN_ID'
      '     )'
      '    '
      ''
      '')
    SelectSQL.Strings = (
      'select'
      '    f.*'
      '  , e.name as E_NAME'
      '  , e.IP as EQ_IP'
      '  , e.MAC as EQ_MAC'
      '  , v.name as V_NAME'
      '  , v.VLAN_NUM'
      '  , s.Street_Name||'#39' '#39'||s.Street_Short Street_Name'
      '  , h.House_No'
      '  , p.Speed'
      '  , p.Wlabel'
      '  , w.Name WNAME'
      '  from tv_lan f'
      '       left outer join vlans v on (f.vlan_id = v.v_id)'
      '       left outer join equipment e on (f.eq_id = e.eid)'
      '       left outer join house h on (h.House_Id = f.House_Id)'
      '       left outer join street s on (s.Street_Id = h.Street_Id)'
      
        '       left outer join port p on (p.Eid = f.Eq_Id and p.Port = f' +
        '.Port)'
      '       left outer join wire w on (w.Wid = p.Wid)'
      '  where f.CUSTOMER_ID = :CUSTOMER_ID   '
      ''
      '')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DISCOUNT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 98
    Top = 38
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcLan: TDataSource
    AutoEdit = False
    DataSet = dsLAN
    OnDataChange = srcLanDataChange
    Left = 62
    Top = 24
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 194
    Top = 81
    object ActLanPing: TAction
      Hint = 'PING IP adress'
      ImageIndex = 11
      OnExecute = ActLanPingExecute
    end
    object actAdd: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 2
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = actDelExecute
    end
    object actAddPack: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1082#1077#1090
      ImageIndex = 2
      OnExecute = actAddPackExecute
    end
    object actDelPack: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1082#1077#1090
      ImageIndex = 3
      OnExecute = actDelPackExecute
    end
    object actLanTelnet: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' IP '#1074' '#1090#1077#1083#1085#1077#1090
      OnExecute = actLanTelnetExecute
    end
    object actLanHttp: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077' IP'
      OnExecute = actLanHttpExecute
    end
    object actOpenObject: TAction
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1086#1073#1098#1077#1082#1090#1091
      ImageIndex = 99
      OnExecute = actOpenObjectExecute
    end
    object actOpenEqpmnt: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      OnExecute = actOpenEqpmntExecute
    end
  end
  object pmLanPopUp: TPopupMenu
    Left = 277
    Top = 64
  end
  object dsIPPacket: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TV_LAN_PACKETS'
      'WHERE'
      '  LAN_ID = :OLD_LAN_ID'
      '  and service_id = :OLD_service_id'
      '        ')
    RefreshSQL.Strings = (
      'SELECT Cc.Ch_Id, Cc.Date_On, Cc.Date_Off, Cc.Notice, c.Ch_Name'
      'FROM Customer_Channels Cc, Channels c'
      'where(  c.Ch_Id = cc.Ch_Id'
      'and Cc.Decoder_Id = :Dec_Id'
      '     ) and (     CC.CH_ID = :OLD_CH_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT s.service_id, s.name, p.notice'
      
        'FROM tv_lan_packets p inner join services s on (p.service_id = s' +
        '.service_id)'
      'where p.lan_id = :lan_id'
      'order by s.name')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcLan
    Left = 364
    Top = 85
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcIPPacket: TDataSource
    DataSet = dsIPPacket
    Left = 427
    Top = 83
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
    Left = 380
    Top = 42
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
    Left = 424
    Top = 42
  end
  object pmOpen: TPopupMenu
    Left = 80
    Top = 136
    object miEqpmnt: TMenuItem
      Action = actOpenEqpmnt
    end
  end
end
