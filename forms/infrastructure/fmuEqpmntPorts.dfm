object apgEqpmntPort: TapgEqpmntPort
  Left = 0
  Top = 0
  Caption = #1055#1086#1088#1090#1099' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
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
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
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
    object btnDel: TSpeedButton
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
      Top = 2
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
    object btnEdit: TSpeedButton
      Left = 2
      Top = 28
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
    object btnFind: TSpeedButton
      Left = 2
      Top = 71
      Width = 22
      Height = 22
      Action = actFindCustomer
      Flat = True
    end
    object btnCmd: TSpeedButton
      Left = 2
      Top = 109
      Width = 22
      Height = 22
      Action = actCmd
      Flat = True
    end
  end
  object dbgCustomer: TDBGridEh
    Left = 26
    Top = 0
    Width = 842
    Height = 253
    Align = alClient
    AllowedOperations = []
    DataSource = srcData
    DynProps = <>
    EditActions = [geaCopyEh, geaSelectAllEh]
    EvenRowColor = clInfoBk
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    OddRowColor = clWindow
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    ReadOnly = True
    SearchPanel.Enabled = True
    SearchPanel.FilterOnTyping = True
    STFilter.Local = True
    SumList.Active = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    TitleParams.VTitleMargin = 8
    OnDblClick = dbgCustomerDblClick
    OnGetCellParams = dbgCustomerGetCellParams
    OnMouseDown = dbgCustomerMouseDown
    OnSortMarkingChanged = dbgCustomerSortMarkingChanged
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PORT'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1055#1086#1088#1090
        Title.TitleButton = True
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 54
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PS_NAME'
        Footers = <>
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PT_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1087#1086#1088#1090#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SPEED'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1052#1041'/'#1089
        Title.TitleButton = True
        Width = 65
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'V_NAME'
        Footers = <>
        Title.Caption = 'VLAN'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PORT_NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1087#1086#1088#1090#1072
        Title.TitleButton = True
        Width = 117
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACCOUNT_NO'
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Caption = #1051#1080#1094' '#1089#1095#1077#1090
        Title.TitleButton = True
        Width = 75
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SURNAME'
        Footers = <>
        Title.Caption = #1050#1083#1080#1077#1085#1090'|'#1060#1072#1084#1080#1083#1080#1103
        Title.TitleButton = True
        Width = 99
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'INITIALS'
        Footers = <>
        Title.Caption = #1050#1083#1080#1077#1085#1090'|'#1048'.'#1054'.'
        Title.TitleButton = True
        Width = 30
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IP'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MAC'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PHONE_NO'
        Footers = <>
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085
        Title.TitleButton = True
        Width = 52
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_SHORT'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1087#1088'.'
        Title.TitleButton = True
        Width = 20
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_NAME'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1059#1083#1080#1094#1072
        Title.TitleButton = True
        Width = 105
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_NO'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1044#1086#1084
        Title.TitleButton = True
        Width = 44
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLAT_NO'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1050#1074
        Title.TitleButton = True
        Width = 41
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PORCH_N'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1055'-'#1076
        Width = 32
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLOOR_N'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1069'-'#1078
        Width = 31
      end
      item
        CellButtons = <>
        DisplayFormat = '#,##0.##'
        DynProps = <>
        EditButtons = <>
        FieldName = 'DEBT_SUM'
        Footer.DisplayFormat = '#,###'
        Footer.FieldName = 'DEBT_SUM'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1057#1072#1083#1100#1076#1086' '#1088#1072#1089#1095#1077#1090#1086#1074
        Title.TitleButton = True
        Width = 69
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUST_STATE_DESCR'
        Footers = <>
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Title.TitleButton = True
        Width = 165
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 200
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'W_NAME'
        Footers = <>
        Title.Caption = #1051#1080#1085#1080#1103' '#1089#1074#1103#1079#1080'|'#1053#1072#1079#1074#1072#1085#1080#1077
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WT_NAME'
        Footers = <>
        Title.Caption = #1051#1080#1085#1080#1103' '#1089#1074#1103#1079#1080'|'#1058#1080#1087
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WS_NODE'
        Footers = <>
        Title.Caption = #1051#1080#1085#1080#1103' '#1089#1074#1103#1079#1080'|'#1059#1079#1077#1083' '#1089
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WE_NODE'
        Footers = <>
        Title.Caption = #1051#1080#1085#1080#1103' '#1089#1074#1103#1079#1080'|'#1059#1079#1077#1083' '#1074
        Title.TitleButton = True
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object ActListFrame: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 274
    Top = 153
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
    object actFindCustomer: TAction
      Hint = #1054#1090#1082#1088#1099#1090' '#1072#1073#1086#1085#1077#1085#1090#1072'('#1086#1074') '#1074' '#1089#1087#1080#1089#1082#1077' '#1040#1073#1086#1085#1077#1085#1090#1086#1074
      ImageIndex = 9
      OnExecute = actFindCustomerExecute
    end
    object actCmd: TAction
      Hint = #1044#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076' '#1072#1073#1086#1085#1077#1085#1090#1086#1084
      ImageIndex = 29
      OnExecute = actCmdExecute
    end
    object actEditCustLan: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1077#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      ImageIndex = 4
      OnExecute = actEditCustLanExecute
    end
    object actPEdit: TAction
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1088#1090
      ImageIndex = 4
      OnExecute = actPEditExecute
    end
    object actCustPing: TAction
      Caption = 'Ping '#1072#1073#1086#1085#1077#1085#1090#1072
      OnExecute = actCustPingExecute
    end
    object actCustTelnet: TAction
      Caption = 'Telnet '#1072#1073#1086#1085#1077#1085#1090#1072
      OnExecute = actCustTelnetExecute
    end
    object actCustHttp: TAction
      Caption = 'HTTP '#1072#1073#1086#1085#1077#1085#1090#1072
      OnExecute = actCustHttpExecute
    end
    object Action1: TAction
      Caption = 'Action1'
    end
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
    Left = 276
    Top = 98
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
    Left = 456
    Top = 98
  end
  object srcData: TDataSource
    AutoEdit = False
    DataSet = dsData
    Left = 74
    Top = 153
  end
  object dsData: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PORT'
      'WHERE'
      '    PORT = :OLD_PORT')
    RefreshSQL.Strings = (
      'select'
      '    a.port'
      '  , a.EID'
      '  , c.CUSTOMER_ID'
      '  , c.CUST_CODE'
      
        '  , coalesce(c.ACCOUNT_NO, iif( p.Con = 0, '#39#1086#1073#1086#1088#39', null)) ACCOUN' +
        'T_NO'
      '  , coalesce(c.SURNAME, e.Name) surname'
      '  , c.MIDLENAME'
      '  , c.INITIALS'
      '  , c.PHONE_NO'
      '  , c.NOTICE'
      '  , c.CUST_STATE_DESCR'
      '  , c.FLAT_NO'
      '  , c.DEBT_SUM'
      '  , c.HIS_COLOR'
      '  , s.street_short'
      '  , S.Street_Name'
      '  , H.House_No'
      '  , h.Street_ID'
      '  , c.HOUSE_ID'
      '  , -1 * c.debt_sum as BALANCE'
      '  , (select'
      '         count(*)'
      '       from SUBSCR_SERV ss'
      '       where ss.CUSTOMER_ID = c.CUSTOMER_ID'
      '             and ss.STATE_SGN = 1) as connected'
      '  , f.FLOOR_N'
      '  , f.PORCH_N'
      '  , t.LAN_ID'
      '  , t.ip'
      '  , t.mac'
      '  , pt.O_Name PT_NAME'
      '  , ps.O_Name PS_NAME'
      '  , v.Name V_NAME'
      '  , p.Notice PORT_NOTICE '
      '  , p.SPEED '
      '  , case p.Con'
      '      when 0 then '#39#1054#39
      '      when 1 then '#39#1040#39
      '      else '#39#39
      '    end whose'
      '  , p.Con'
      '  , p.Con_Id'
      '  , p.P_State'
      '  , coalesce(c.HIS_COLOR, o.O_DIMENSION) as COLOR'
      '  , w.Name W_NAME'
      '  , wt.O_Type WT_NAME'
      '  , sn.Name WS_NODE'
      '  , en.Name WE_NODE'
      '  , w.Wid'
      '  , w.Point_S'
      '  , w.Point_E'
      '  from (select distinct Eid, port'
      '          from (select Eid, port from port where Eid = :EID'
      '                union'
      
        '                select EQ_ID EID , Port from tv_lan where EQ_ID ' +
        '= :EID and coalesce(Port,'#39#39')<> '#39#39')) a'
      
        '       left outer join port p on (p.Eid = a.EID and p.Port = a.p' +
        'ort)'
      
        '       left outer join tv_lan t on (t.Eq_Id = a.Eid and t.Port =' +
        ' a.Port)'
      
        '       left outer join CUSTOMER C on (t.customer_id = c.customer' +
        '_id)'
      
        '       left outer join equipment e on (e.Eid = p.Con_Id and p.Co' +
        'n = 0)'
      
        '       left outer join objects o on (e.eq_group = o.o_id and o.O' +
        '_TYPE = 7)'
      
        '       left outer join HOUSE H on (((not C.HOUSE_ID is null) and' +
        ' C.HOUSE_ID = H.HOUSE_ID) or (not(e.House_Id is null) and e.HOUS' +
        'E_ID = H.HOUSE_ID))'
      '       left outer join STREET S on (H.STREET_ID = S.STREET_ID)'
      
        '       left outer join Houseflats f on (f.House_Id = c.House_Id ' +
        'and f.Flat_No = c.Flat_No)'
      
        '       left outer join objects pt on (p.P_Type = pt.O_Id and pt.' +
        'O_Type = 57)'
      
        '       left outer join objects ps on (p.P_State = ps.O_Id and ps' +
        '.O_Type = 60)'
      '       left outer join vlans v on (v.V_Id = p.Vlan_Id)'
      '       left outer join Wire w on (w.Wid = p.Wid)'
      
        '       left outer join OBJECTS wt on (w.WTYPE = wt.O_ID and wt.O' +
        '_TYPE = 56)'
      '       left outer join NODEs sn on (sn.Node_Id = w.Point_S)'
      '       left outer join NODEs en on (en.Node_Id = w.Point_E)'
      '       '
      'where a.EID = :OLD_EID'
      '  and a.PORT = :OLD_PORT'
      '')
    SelectSQL.Strings = (
      'select'
      '    a.port'
      '  , a.EID'
      '  , c.CUSTOMER_ID'
      '  , c.CUST_CODE'
      
        '  , coalesce(c.ACCOUNT_NO, iif( p.Con = 0, '#39#1086#1073#1086#1088#39', null)) ACCOUN' +
        'T_NO'
      '  , coalesce(c.SURNAME, e.Name) surname'
      '  , c.MIDLENAME'
      '  , c.INITIALS'
      '  , c.PHONE_NO'
      '  , c.NOTICE'
      '  , c.CUST_STATE_DESCR'
      '  , c.FLAT_NO'
      '  , c.DEBT_SUM'
      '  , c.HIS_COLOR'
      '  , s.street_short'
      '  , S.Street_Name'
      '  , H.House_No'
      '  , h.Street_ID'
      '  , c.HOUSE_ID'
      '  , -1 * c.debt_sum as BALANCE'
      '  , (select'
      '         count(*)'
      '       from SUBSCR_SERV ss'
      '       where ss.CUSTOMER_ID = c.CUSTOMER_ID'
      '             and ss.STATE_SGN = 1) as connected'
      '  , f.FLOOR_N'
      '  , f.PORCH_N'
      '  , t.LAN_ID'
      '  , t.ip'
      '  , t.mac'
      '  , pt.O_Name PT_NAME'
      '  , ps.O_Name PS_NAME'
      '  , v.Name V_NAME'
      '  , p.Notice PORT_NOTICE '
      '  , p.SPEED '
      '  , case p.Con'
      '      when 0 then '#39#1054#39
      '      when 1 then '#39#1040#39
      '      else '#39#39
      '    end whose'
      '  , p.Con'
      '  , p.Con_Id'
      '  , p.P_State'
      '  , coalesce(c.HIS_COLOR, o.O_DIMENSION) as COLOR'
      '  , w.Name W_NAME'
      '  , wt.O_Type WT_NAME'
      '  , sn.Name WS_NODE'
      '  , en.Name WE_NODE'
      '  , w.Wid'
      '  , w.Point_S'
      '  , w.Point_E'
      '  from (select distinct Eid, port'
      '          from (select Eid, port from port where Eid = :EID'
      '                union'
      
        '                select EQ_ID EID , Port from tv_lan where EQ_ID ' +
        '= :EID and coalesce(Port,'#39#39')<> '#39#39')) a'
      
        '       left outer join port p on (p.Eid = a.EID and p.Port = a.p' +
        'ort)'
      
        '       left outer join tv_lan t on (t.Eq_Id = a.Eid and t.Port =' +
        ' a.Port)'
      
        '       left outer join CUSTOMER C on (t.customer_id = c.customer' +
        '_id)'
      
        '       left outer join equipment e on (e.Eid = p.Con_Id and p.Co' +
        'n = 0)'
      
        '       left outer join objects o on (e.eq_group = o.o_id and o.O' +
        '_TYPE = 7)'
      
        '       left outer join HOUSE H on (((not C.HOUSE_ID is null) and' +
        ' C.HOUSE_ID = H.HOUSE_ID) or (not(e.House_Id is null) and e.HOUS' +
        'E_ID = H.HOUSE_ID))'
      '       left outer join STREET S on (H.STREET_ID = S.STREET_ID)'
      
        '       left outer join Houseflats f on (f.House_Id = c.House_Id ' +
        'and f.Flat_No = c.Flat_No)'
      
        '       left outer join objects pt on (p.P_Type = pt.O_Id and pt.' +
        'O_Type = 57)'
      
        '       left outer join objects ps on (p.P_State = ps.O_Id and ps' +
        '.O_Type = 60)'
      '       left outer join vlans v on (v.V_Id = p.Vlan_Id)'
      '       left outer join Wire w on (w.Wid = p.Wid)'
      
        '       left outer join OBJECTS wt on (w.WTYPE = wt.O_ID and wt.O' +
        '_TYPE = 56)'
      '       left outer join NODEs sn on (sn.Node_Id = w.Point_S)'
      '       left outer join NODEs en on (en.Node_Id = w.Point_E)'
      '       '
      '  where a.EID = :EID'
      'order by a.PORT  ')
    AutoUpdateOptions.UpdateTableName = 'CUSTOMER'
    AutoUpdateOptions.KeyFields = 'CUSTOMER_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_CUSTOMER_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 72
    Top = 97
    poUseBooleanField = False
    poSetRequiredFields = True
    WaitEndMasterScroll = True
    oVisibleRecno = True
    oFetchAll = True
  end
  object pmCustomerLanPopUp: TPopupMenu
    Left = 456
    Top = 153
  end
end
