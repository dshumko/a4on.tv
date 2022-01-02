object CustSubscrHistoryForma: TCustSubscrHistoryForma
  Left = 518
  Top = 190
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1081
  ClientHeight = 371
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 863
    Height = 371
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 150
      Width = 859
      Height = 217
      Align = alClient
      BevelInner = bvLowered
      Caption = 'Panel1'
      TabOrder = 1
      object dbgCustSubscrServHist: TDBGridEh
        Left = 2
        Top = 2
        Width = 855
        Height = 213
        Align = alClient
        AllowedOperations = []
        DataSource = srcServicesHistory
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        OddRowColor = clCream
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        PopupMenu = pmHistory
        TabOrder = 0
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DATE_FROM'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1082#1083
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ON_NAME'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #1059#1089#1083'. '#1087#1086#1076#1082#1083'.'
            Width = 167
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DATE_TO'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072' '#1086#1090#1082#1083
            Width = 80
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'OFF_NAME'
            Footers = <>
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #1059#1089#1083'. '#1086#1090#1082#1083'.'
            Width = 189
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WHO_ADD'
            Footers = <>
            Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1083
            Width = 65
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WHO_CHANGE'
            Footers = <>
            Title.Caption = #1054#1090#1082#1083#1102#1095#1080#1083
            Width = 65
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1050#1086#1075#1076#1072' '#1087#1086#1076#1082#1083'.'
            Width = 76
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CLOSED_ON'
            Footers = <>
            Title.Caption = #1050#1086#1075#1076#1072' '#1086#1090#1082#1083'.'
            Width = 82
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 859
      Height = 150
      Align = alTop
      Caption = 'Panel3'
      TabOrder = 0
      object dbgCustSubscrServ: TDBGridEh
        Left = 1
        Top = 1
        Width = 831
        Height = 148
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = srcServices
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        TabOrder = 0
        OnExit = dbgCustSubscrServExit
        OnGetCellParams = dbgCustSubscrServGetCellParams
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            PopupMenu = pmServices
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = #1058#1080#1087' '#1072#1073#1086#1085#1077#1085#1090#1089#1082#1086#1081' '#1091#1089#1083#1091#1075#1080
            Width = 307
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CONTRACT'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1086#1075#1086#1074#1086#1088
            Width = 76
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CONTRACT_DATE'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1076#1086#1075'.'
            Width = 87
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WHO_LAST'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1048#1079#1084#1077#1085#1080#1083
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STATE_SGN'
            Footers = <>
            KeyList.Strings = (
              '0'
              '1')
            PickList.Strings = (
              #1054#1090#1082#1083#1102#1095#1077#1085
              #1055#1086#1076#1082#1083#1102#1095#1077#1085)
            Title.Caption = #1057#1090#1072#1090#1091#1089
            Width = 109
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnlBtns: TPanel
        Left = 832
        Top = 1
        Width = 26
        Height = 148
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object btnOk: TSpeedButton
          Left = 2
          Top = 2
          Width = 23
          Height = 22
          Action = actOk
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0082AA4A00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF0082AA4A0082AA4A0082AA4A00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0082AA4A0082AA4A0082AA4A0082AA4A0082AA4A00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0082AA4A0082AA4A0082AA4A0082AA4A0082AA4A0082AA4A0082AA
            4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0082AA4A0082AA4A0082AA4A0082AA4A0082AA4A0082AA4A0082AA4A0082AA
            4A0082AA4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0082AA
            4A0082AA4A0082AA4A0082AA4A0082AA4A00FF00FF0082AA4A0082AA4A0082AA
            4A0082AA4A0082AA4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0082AA4A0082AA4A0082AA4A00FF00FF00FF00FF00FF00FF0082AA4A0082AA
            4A0082AA4A0082AA4A0082AA4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0082AA4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0082AA
            4A0082AA4A0082AA4A0082AA4A0082AA4A00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF0082AA4A0082AA4A0082AA4A0082AA4A0082AA4A00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0082AA4A0082AA4A0082AA4A00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF0082AA4A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btnCancel: TSpeedButton
          Left = 2
          Top = 30
          Width = 23
          Height = 22
          Action = actCancel
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF008996D6005C6FD100465CCE00465CCE005D70
            D1008B97D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008895D600374FCC00334CCC00334CCC00334CCC00334CCC00334C
            CC00334CCC003850CC008E9AD700FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF006B7CD200334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334C
            CC00334CCC00334CCC00334CCC007181D300FF00FF00FF00FF00FF00FF008794
            D600334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334C
            CC00354ECC00334CCC00334CCC00334CCC008E9AD700FF00FF00FF00FF00374F
            CC00334CCC00334CCC007586DC00FFFFFF003D55CE00334CCC00334CCC003E56
            CE00FFFFFF008594E000334CCC00334CCC003951CC00FF00FF008693D600334C
            CC00334CCC00344DCC00FFFFFF00FFFFFF00FFFFFF003D55CE003E56CE00FFFF
            FF00FFFFFF00FFFFFF00364FCC00334CCC00334CCC008D99D600576BD000334C
            CC00334CCC00334CCC004159CF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF004058CF00334CCC00334CCC00334CCC005E71D1004158CD00334C
            CC00334CCC00334CCC00334CCC004159CF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF004058CF00334CCC00334CCC00334CCC00334CCC00485ECE004057CD00334C
            CC00334CCC00334CCC00334CCC003E56CE00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF003D55CE00334CCC00334CCC00334CCC00334CCC00475DCE005569D000334C
            CC00334CCC00334CCC003E56CE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF003D55CE00334CCC00334CCC00334CCC005B6FD000828FD500334C
            CC00334CCC00344DCC00FFFFFF00FFFFFF00FFFFFF004158CF004158CF00FFFF
            FF00FFFFFF00FFFFFF00354DCC00334CCC00334CCC008895D600FF00FF00354D
            CC00334CCC00334CCC007A8ADD00FFFFFF004158CF00334CCC00334CCC004158
            CF00FFFFFF008291DF00334CCC00334CCC00374FCC00FF00FF00FF00FF00808E
            D500334CCC00334CCC00334CCC00354DCC00334CCC00334CCC00334CCC00334C
            CC00364ECC00334CCC00334CCC00334CCC008693D600FF00FF00FF00FF00FF00
            FF006274D100334CCC00334CCC00334CCC00334CCC00334CCC00334CCC00334C
            CC00334CCC00334CCC00334CCC006879D200FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF007C8BD400344DCC00334CCC00334CCC00334CCC00334CCC00334C
            CC00334CCC00354DCC00818FD500FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF007D8BD4004F64CF003A52CC003B53CC005165
            CF00808ED500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btnBack: TSpeedButton
          Left = 2
          Top = 58
          Width = 23
          Height = 22
          Action = actBack
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00EDF1E500ACC7850084AB4B0074A2310074A2310082AA
            4700AAC58300E9EFE000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00A3C1790074A233006E9D2A006D9D270083AC490085AC4A006D9D
            28006E9D280074A231009EBE7300FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF008AB0530071A02E007AA53A00D1E1BC00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00D3E2C0007DA63F0070A02D0085AD4D00FF00FF00FF00FF00FF00FF00A8C4
            800071A02E008BB05500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00FFFFFF0091B55C0070A02E009FBE7200FF00FF00FF00FF0074A2
            330077A33700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00E7E7E700B8B8B900FFFFFF007CA63E0074A23300EAF0E100B1CA8D006E9D
            2A00CBDCB400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCCC
            CC0045454500FCFCFC00FFFFFF00D2E1BE006E9D2A00ABC684008BB056006A9A
            2400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6B6003636
            3600DEDEDE00FFFFFF00FFFFFF00FFFFFF006C9B260085AC4D00709E2E0074A1
            3100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B3B3B30038383800BCBC
            BC00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080AA470073A03000FDFDFD00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007777770082828200FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0080A9430074A13400F1F5EA00F9FB
            F900F9FBF800F8FBF700FFFFFF00FFFFFF00FFFFFF008888880091919100FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006B9C250089AE51006C9B27006B9B
            25006B9B250065981D005A900B00FBFCF900FFFFFF00999999009B9B9B00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF00CBDCB4006E9D2A00B0C98B0079A43A0076A3
            3500709E2C00C7D9AC00CADBB100DCE7CB00FFFFFF00AFAFAF00AEAEAE00FFFF
            FF00FFFFFF00FFFFFF00FFFFFF0076A3340075A23300FF00FF0079A43A0078A3
            390074A1310087AE4F00FFFFFF00FFFFFF00FFFFFF00D4D4D400CCCCCC00FFFF
            FF00FFFFFF00FFFFFF0086AE4C0071A02F00AAC58300FF00FF0076A33500B7CE
            96009DBC700073A1300071A12F00C2D5A400FCFDFB00FFFFFF00FFFFFF00FDFE
            FE00C5D8AA0074A2310073A12F0091B45E00FF00FF00FF00FF0076A33500AAC5
            8300FF00FF00B4CC920075A233006F9E2B006B9B240074A2330076A235006B9B
            24006F9E2B0075A23300AFC98B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00BAD09A0093B660007FA845007EA7420092B5
            6000B7CE9600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        end
        object btnDisconnect: TSpeedButton
          Left = 2
          Top = 86
          Width = 23
          Height = 22
          Action = actDisconnect
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008B99
            E100FF00FF00FF00FF00FF00FF00FF00FF008996E000FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008A98E2001733
            C5001733C500FF00FF00FF00FF001733C5001733C5008A98E000CEA98600B177
            3E00B3783E00B3783E00B3783E00B3783E00B3783E00D9BDA100FF00FF001733
            C5001733C5002942C8003149CA001733C5001733C500FF00FF00B1773D00B378
            3E00B3783E00B3783E00B3783E00B3783E00B3783E00B2783F00E1CBB600FF00
            FF00334BCA001733C5001733C500334CCB00FF00FF00FF00FF00B3783E00B378
            3E00E3CDB800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FDFDFD00FF00
            FF003049C9001733C5001733C5002942C800FF00FF00FF00FF00B3783E00B378
            3E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FF00FF001733
            C5001733C500334BCA003149CA001733C5001733C500FF00FF00B3783E00B378
            3E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD008593E1001733
            C5001733C500FF00FF00FF00FF001733C5001733C5008E9BE100B3783E00B378
            3E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FDFDFD008695
            E100FF00FF00E1CBB600F9F7F400FF00FF008A98E100FF00FF00B3783E00B378
            3E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFD00FDFD
            FD00FDFDFD00B2783F00B2783F00D9BDA300E2CDB900FF00FF00B3783E00B378
            3E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00FFFFFF00B3783E00F5EEE700F5EEE700B3783E00FF00FF00B3783E00B378
            3E00E3CDB800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
            FF00E3CDB800B3783E00B3783E00B3783E00B3783E00FF00FF00B1773D00B378
            3E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B378
            3E00B3783E00B3783E00B3783E00B3783E00B1773E00FF00FF00CBA58000B177
            3D00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B3783E00B378
            3E00B3783E00B3783E00B3783E00B1773D00CDA98400FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF006868680068686800C0C0C000D7D7D700686868006969
            6900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF0068686800686868009C9C9C00FF00FF00FF00FF00D8D8D8006868
            680068686800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00DCDCDC00FF00FF00FF00FF00FF00FF00FF00FF00B3B3
            B3006868680068686800FF00FF00FF00FF00FF00FF00FF00FF00}
        end
      end
    end
  end
  object ActionList1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 282
    Top = 66
    object actDeleteService: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1089#1083#1091#1075#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1087#1086' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103#1084' '#1082' '#1076#1072#1085#1085#1086#1081' '#1091#1089#1083#1091#1075#1077
      ImageIndex = 119
      OnExecute = actDeleteServiceExecute
    end
    object actDeleteSubscrHist: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1080#1089#1090#1086#1088#1080#1080' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1081
      ImageIndex = 119
      OnExecute = actDeleteSubscrHistExecute
    end
    object actSubscribe: TAction
      Caption = 'Subscribe'
      ImageIndex = 2
    end
    object actOk: TAction
      Enabled = False
      Hint = #1055#1086#1076#1074#1077#1088#1076#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1077
      ImageIndex = 25
      OnExecute = actOkExecute
    end
    object actCancel: TAction
      Enabled = False
      Hint = #1054#1084#1077#1085#1080#1090#1100' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077
      ImageIndex = 26
      OnExecute = actCancelExecute
    end
    object actBack: TAction
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1076#1077#1081#1089#1090#1074#1080#1077
      ImageIndex = 56
      OnExecute = actBackExecute
    end
    object actDisconnect: TAction
      Hint = #1057#1084#1077#1085#1080#1090#1100' '#1072#1074#1090#1086#1073#1083#1086#1082#1080#1088#1086#1074#1082#1091' '#1085#1072' '#1087#1086#1089#1090#1086#1103#1085#1085#1086#1077' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1077
      ImageIndex = 12
      OnExecute = actDisconnectExecute
    end
  end
  object srcServices: TDataSource
    DataSet = dsServices
    OnStateChange = srcServicesStateChange
    OnDataChange = srcServicesDataChange
    Left = 50
    Top = 58
  end
  object srcServicesHistory: TDataSource
    AutoEdit = False
    DataSet = dsServicesHistory
    OnStateChange = srcServicesHistoryStateChange
    Left = 130
    Top = 229
  end
  object dsServicesHistory: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SUBSCR_HIST'
      'WHERE'
      '        SUBSCR_HIST_ID = :OLD_SUBSCR_HIST_ID'
      '    ')
    RefreshSQL.Strings = (
      'select '
      ' h.*, s_on.NAME as ON_NAME, s_off.NAME as OFF_NAME,'
      
        ' (select first 1 w.Surname FROM worker w where w.Ibname = h.Adde' +
        'd_By)  as WHO_ADD,'
      
        ' (select first 1 w.Surname FROM worker w where w.Ibname = h.Clos' +
        'ed_By) as WHO_CHANGE'
      'from SUBSCR_HIST h'
      
        '  left outer join services s_on on (s_on.SERVICE_ID = h.ACT_SERV' +
        '_ID)'
      
        '  left outer join SERVICES s_off on (s_off.SERVICE_ID = h.DISACT' +
        '_SERV_ID)'
      'where(  h.CUSTOMER_ID=:CUSTOMER_ID'
      '  and h.SUBSCR_SERV_ID=:SUBSCR_SERV_ID'
      '     ) and (     H.SUBSCR_HIST_ID = :OLD_SUBSCR_HIST_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select '
      ' h.*, s_on.NAME as ON_NAME, s_off.NAME as OFF_NAME,'
      
        ' coalesce((select first 1 w.Surname FROM worker w where w.Ibname' +
        ' = h.Added_By), h.Added_By)  as WHO_ADD,'
      
        ' coalesce((select first 1 w.Surname FROM worker w where w.Ibname' +
        ' = h.Closed_By),h.Closed_By) as WHO_CHANGE'
      'from SUBSCR_HIST h'
      
        '  left outer join services s_on on (s_on.SERVICE_ID = h.ACT_SERV' +
        '_ID)'
      
        '  left outer join SERVICES s_off on (s_off.SERVICE_ID = h.DISACT' +
        '_SERV_ID)'
      'where h.CUSTOMER_ID=:CUSTOMER_ID'
      '  and h.SUBSCR_SERV_ID=:SUBSCR_SERV_ID'
      'order by h.SUBSCR_SERV_ID, h.DATE_FROM desc, h.DATE_TO desc')
    AutoUpdateOptions.UpdateTableName = 'SUBSCR_HIST'
    AutoUpdateOptions.KeyFields = 'SUBSCR_HIST_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcServices
    Left = 120
    Top = 224
    oFetchAll = True
  end
  object dsServices: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SUBSCR_SERV'
      'SET '
      '    STATE_SGN = :STATE_SGN'
      'WHERE'
      '    SUBSCR_SERV_ID = :OLD_SUBSCR_SERV_ID'
      '    ')
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE DELETE_SUBSCR_SERVICE(:OLD_SUBSCR_SERV_ID)'
      '    ')
    RefreshSQL.Strings = (
      'select'
      ' SS.CUSTOMER_ID,'
      ' SS.SERV_ID,'
      ' SS.SUBSCR_SERV_ID,'
      ' SS.STATE_SGN,'
      ' ss.Contract,'
      ' ss.Contract_date,'
      ' s.NAME,'
      
        ' (select first 1 w.Surname FROM worker w where w.Ibname = ss.Sta' +
        'te_Change_By) as WHO_LAST '
      'from'
      ' SUBSCR_SERV SS,'
      ' SERVICES s'
      ''
      'where(  SS.CUSTOMER_ID=:CUSTOMER_ID'
      'and s.SERVICE_ID = ss.SERV_ID'
      '     ) and (     SS.SUBSCR_SERV_ID = :OLD_SUBSCR_SERV_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      
        '    SS.CUSTOMER_ID, SS.SERV_ID, SS.SUBSCR_SERV_ID, SS.STATE_SGN,' +
        ' ss.Contract, ss.Contract_date, s.NAME, ss.State_Srv,'
      '    st.Service_Id STATE_ID, st.Name STATE_SRV,'
      '    coalesce((select first 1'
      '                    w.Surname'
      '                  from worker w'
      
        '                  where w.Ibname = ss.State_Change_By), ss.State' +
        '_Change_By) as WHO_LAST'
      '  from SUBSCR_SERV SS'
      '       inner join SERVICES s on (s.SERVICE_ID = ss.SERV_ID)'
      
        '       left outer join SERVICES st on (st.SERVICE_ID = ss.State_' +
        'Srv)'
      '  where SS.CUSTOMER_ID = :CUSTOMER_ID'
      '  order by s.NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = CustomersForm.srcCustomer
    Left = 124
    Top = 60
  end
  object pmHistory: TPopupMenu
    Left = 216
    Top = 208
    object miDeleteHistory: TMenuItem
      Action = actDeleteSubscrHist
    end
  end
  object pmServices: TPopupMenu
    Left = 196
    Top = 60
    object miDeleteServices: TMenuItem
      Action = actDeleteService
    end
  end
end
