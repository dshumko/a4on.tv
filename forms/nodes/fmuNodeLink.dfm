object apgNodeLink: TapgNodeLink
  Left = 0
  Top = 0
  Caption = #1051#1080#1085#1080#1080' '#1089#1074#1103#1079#1080
  ClientHeight = 229
  ClientWidth = 890
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
  object dbgNodeLink: TDBGridEh
    Left = 26
    Top = 0
    Width = 864
    Height = 229
    Align = alClient
    AllowedOperations = []
    DataSource = srcLink
    DynProps = <>
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    PopupMenu = pmGrid
    RowDetailPanel.Active = True
    RowDetailPanel.Height = 106
    RowDetailPanel.BevelInner = bvNone
    RowDetailPanel.BevelOuter = bvNone
    RowDetailPanel.BorderStyle = bsNone
    RowDetailPanel.VertSizing = True
    STFilter.InstantApply = True
    STFilter.Local = True
    SumList.Active = True
    TabOrder = 0
    TitleParams.MultiTitle = True
    OnCellClick = dbgNodeLinkCellClick
    OnDblClick = dbgNodeLinkDblClick
    OnGetCellParams = dbgNodeLinkGetCellParams
    OnRowDetailPanelHide = dbgNodeLinkRowDetailPanelHide
    OnRowDetailPanelShow = dbgNodeLinkRowDetailPanelShow
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLOW'
        Footers = <>
        Title.Caption = #1050#1091#1076#1072
        Title.TitleButton = True
        Width = 35
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CONN_NODE'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083'. '#1091#1079#1077#1083
        Title.TitleButton = True
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 155
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1050#1072#1073#1077#1083#1100
        Title.TitleButton = True
        Title.SortIndex = 2
        Title.SortMarker = smUpEh
        Width = 158
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1082#1072#1073#1077#1083#1103
        Title.TitleButton = True
        Width = 103
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MAT_NAME'
        Footers = <>
        Title.Caption = #1050#1072#1073#1077#1083#1100
        Title.TitleButton = True
        Width = 88
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'METERS'
        Footers = <>
        Title.Caption = #1044#1083#1080#1085#1072', '#1084
        Title.TitleButton = True
        Width = 58
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STOCK'
        Footers = <>
        Title.Caption = #1047#1072#1087#1072#1089', '#1084
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        EditMask = 'CAPACITY'
        FieldName = 'CAPACITY'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1045#1084#1082#1086#1089#1090#1100'|'#1042#1089#1077#1075#1086
        Title.TitleButton = True
        OnGetCellParams = dbgNodeLinkColumns7GetCellParams
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'USED'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1045#1084#1082#1086#1089#1090#1100'|'#1047#1072#1085#1103#1090#1086
        Title.TitleButton = True
        OnGetCellParams = dbgNodeLinkColumns8GetCellParams
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 157
      end>
    object RowDetailData: TRowDetailPanelControlEh
      object pnlRow: TPanel
        Left = 0
        Top = 0
        Width = 831
        Height = 98
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbgDetail: TDBGridEh
          Left = 25
          Top = 0
          Width = 806
          Height = 98
          Align = alClient
          DataSource = srcEQ
          DynProps = <>
          Flat = True
          FooterRowCount = 1
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          PopupMenu = pmOpen
          SumList.Active = True
          TabOrder = 0
          OnCellClick = dbgDetailCellClick
          OnDblClick = dbgDetailDblClick
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'WLABEL'
              Footers = <>
              HideDuplicates = True
              Title.Caption = #1052#1077#1090#1082#1072' '#1082#1072#1073#1077#1083#1103
              Title.TitleButton = True
              Width = 76
              OnGetCellParams = dbgDetailColumns0GetCellParams
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'WLBL_FLOW'
              Footers = <>
              Title.Caption = #1050#1091#1076#1072
              Title.TitleButton = True
              Width = 34
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'WLBL_NAME'
              Footer.ValueType = fvtCount
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077'/'#1040#1073#1086#1085#1077#1085#1090
              Title.TitleButton = True
              Width = 174
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'WLBL_PORT'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1055#1086#1088#1090
              Title.TitleButton = True
              Width = 46
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'WLBL_IP'
              Footers = <>
              Title.Caption = 'IP'
              Title.TitleButton = True
              Width = 106
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'WLBL_MAC'
              Footers = <>
              Title.Caption = 'MAC'
              Title.TitleButton = True
              Width = 128
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NODE_NAME'
              Footers = <>
              Title.Caption = #1059#1079#1077#1083
              Title.TitleButton = True
              Width = 182
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pnlDBtns: TPanel
          Left = 0
          Top = 0
          Width = 25
          Height = 98
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            25
            98)
          object btnFindCustomer: TSpeedButton
            Left = 2
            Top = 6
            Width = 22
            Height = 22
            Action = actOpenObject
            Flat = True
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00A924
              C46A982CB97F982CB97F982CB97F982CB97F982CB97F982CB97F982CB97F982C
              B97F982CB97F982CB97F982CB97F992CB97ED807DD2BFF00FF00F902FA0762B2
              E7FD63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FEAA5CEF86FF00FF00E909F01A63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FEA06BF099FF00FF00DB0FE62C63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE9578EEABFF00FF00CC15DC3F63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE8985ECBEFF00FF00BC1CD15263B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE7E92EAD1FF00FF00AE22C76463B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE729FE8E3FF00FF009E29BD7763B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE63B3
              E7FE63B3E7FE63B3E7FE63B3E7FE63B3E7FE67ACE6F6FF00FF00D807DD2B992C
              B97E982CB97F982CB97F982CB97F982CB97F982CB97F982CB97F982CB97F982C
              B97F982CB97F982CB97F982CB97F982CB97FA924C46AFF00FF00FF00FF008A1C
              A47F2B7494FE2B7494FE2B7494FE2B7494FE2B7494FE2B7494FE2B7494FE2B74
              94FE2B7494FE2B7494FE2B7494FE2B7494FEFF00FF00FF00FF00FF00FF008A1C
              A47F2B7494FE2B7494FE2B7494FE2B7494FE2B7494FE2B7494FE2B7494FE2B74
              94FE2B7494FE2B7494FE2B7494FE3C699CE9FF00FF00FF00FF00FF00FF008B1C
              A57E2B7494FE2B7494FE2B7494FE2B7494FE2B7494FE8E2BB680FC00FC03FF00
              FF00FF00FF00FF00FF00F401F30CA225977A9E27927F9E27927FFF00FF00D504
              DA2B8B1CA57E8A1CA47F8A1CA47F8A1CA47FAE13C058FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00C915C346A93E9687809852F67D9E4DFEFF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00F701F708A0727DB8A26F81B37D9E4DFEFF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E304
              E21F9E27927F9E27927F9A7876C2A56B85ADF900F9069D7679BEFF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00E404
              E31E9E27927F9E27927FB31EAA63FB00FB04FF00FF00F501F40B}
          end
          object btnDel: TSpeedButton
            Left = 2
            Top = 76
            Width = 22
            Height = 22
            Hint = #1054#1090#1074#1103#1079#1072#1090#1100' '#1082#1072#1073#1077#1083#1100' '#1086#1090' '#1087#1086#1088#1090#1086#1074
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
            OnClick = btnDelClick
          end
        end
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 229
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      26
      229)
    object btnDel1: TSpeedButton
      Left = 2
      Top = 206
      Width = 22
      Height = 22
      Action = actDel
      Anchors = [akLeft, akBottom]
      Flat = True
      Layout = blGlyphTop
    end
    object btnAdd1: TSpeedButton
      Left = 2
      Top = 3
      Width = 22
      Height = 22
      Action = actAdd
      Flat = True
    end
    object btnAdd: TSpeedButton
      Left = 2
      Top = 32
      Width = 22
      Height = 22
      Action = actEdit
      Flat = True
    end
    object btnLink: TSpeedButton
      Left = 2
      Top = 72
      Width = 22
      Height = 22
      Action = actWireLink
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        20000000000000040000000000000000000000000000000000007D9E4DFF7D9E
        4DFF7D9E4DFF7D9E4DFFBB49A8FF706C6CFF706C6CFF706C6CFF706C6CFF706C
        6CFF706C6CFFBB48A9FF7D9E4DFF7D9E4DFF7D9E4DFF7D9E4DFF7D9E4DFF7D9E
        4DFF7D9E4DFF7D9E4DFFBB49A8FF706C6CFF706C6CFF706C6CFF706C6CFF706C
        6CFF706C6CFFBB48A9FF7D9E4DFF7D9E4DFF7D9E4DFF7D9E4DFFF0F0F0FFF0F0
        F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF706C6CFF706C6CFFF0F0
        F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
        F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFB83CB0FFB83CB0FFF0F0
        F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
        F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF7D9E4DFF7D9E4DFFF0F0
        F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
        F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF7D9E4DFF7D9E4DFFF0F0
        F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
        F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFBB47AAFFBB47A9FFF0F0
        F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF786474FF706C
        6CFF706C6CFF706C6CFF706C6CFF706C6CFF706C6CFF706C6CFF706C6CFF706C
        6CFF706C6CFF706C6CFF706C6CFF706C6CFF706C6CFF786474FF706C6CFFFDFC
        FDFFFDFCFDFFFDFCFDFFFDFCFDFFFDFCFDFFFDFCFDFFFDFCFDFFFDFCFDFFFDFC
        FDFFFDFCFDFFFDFCFDFFFDFCFDFFFDFCFDFFFDFCFDFF6F6A6BFF706C6CFFD4D1
        D3FFAEABACFFA6A3A4FFD4D1D3FF5A5757FFD4D1D3FFAEABACFFA6A3A4FFD4D1
        D3FF5A5757FFD4D1D3FFAEABACFFA6A3A4FFD4D1D3FF6F6A6BFF706C6CFFFDFC
        FDFF8F8C8DFF8A8788FFFCFAFCFFFDFBFDFFFDFBFDFF8F8C8DFF8A8788FFFCFA
        FCFFFDFBFDFFFDFBFDFF8F8C8DFF8A8788FFFCFAFCFF6F6A6BFF706C6CFFFDFC
        FDFF908D8EFF979395FFFDFBFDFFFDFBFDFFFDFBFDFF908D8EFF979395FFFDFB
        FDFFFDFBFDFFFDFBFDFF908D8EFF979395FFFDFCFDFF6F6A6BFF706C6CFFDAD8
        DAFF9F9B9DFFA7A4A6FFDBD9DBFFFDFBFDFFDAD8DAFF9F9B9DFFA7A4A6FFDBD9
        DBFFFDFBFDFFDAD8DAFF9F9B9DFFA7A4A6FFDBD9DBFF6F6A6BFF706C6CFFFDFC
        FDFFFDFCFDFFFDFCFDFFFDFCFDFFFDFCFDFFFDFCFDFFFDFCFDFFFDFCFDFFFDFC
        FDFFFDFCFDFFFDFCFDFFFDFCFDFFFDFCFDFFFDFCFDFF6F6A6BFF786375FF706C
        6CFF706C6CFF706C6CFF706C6CFF706C6CFF706C6CFF706C6CFF706C6CFF706C
        6CFF706C6CFF706C6CFF706C6CFF706C6CFF706C6CFF786375FFF0F0F0FFF0F0
        F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0
        F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF}
    end
  end
  object dsLink: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    WIRE'
      'WHERE'
      '    WID = :OLD_WID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    l.*'
      '    , m.NAME MAT_NAME'
      '    , coalesce((select sum(iif(cnt = 2, 1, iif(cnt > 2, 2, 0 )))'
      
        '            from (select WLABEL , sum(iif(coalesce(WLBL_TYPE, 0)' +
        ' = 1, 2, iif(coalesce(WLBL_TYPE, 0) = 2, 1, 0))) cnt'
      '                  from Get_Wire_Info(l.Wid)'
      '                  where not WLBL_ID is null group by 1))'
      '            , 0) USED                '
      '    , coalesce((select'
      '                 count(distinct WLABEL) cnt'
      '               from Get_Wire_Info(l.Wid)'
      '               ), l.Capacity) LBL_COUNT'
      '  from (select'
      '            '#39'>'#39' FLOW'
      '          , T.O_NAME'
      '          , t.O_Dimension COLOR'
      '          , n.Node_Id'
      '          , n.Name CONN_NODE   '
      '          , C.*'
      '          from Wire C'
      
        '               inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O' +
        '_TYPE = 56)'
      
        '               left outer join NODEs n on (n.Node_Id = c.Point_E' +
        ')'
      '          where (C.Point_S = :NODE_ID)'
      '        union'
      '        select'
      '            '#39'<'#39' FLOW'
      '          , T.O_NAME'
      '          , t.O_Dimension COLOR'
      '          , n.Node_Id'
      '          , n.Name CONN_NODE         '
      '          , C.*'
      '          from Wire C'
      
        '               inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O' +
        '_TYPE = 56)'
      
        '               left outer join NODEs n on (n.Node_Id = c.Point_S' +
        ')'
      '          where (C.Point_E = :NODE_ID)) l'
      '       left outer join MATERIALS m on (m.M_Id =  l.M_ID)'
      'where l.WID = :OLD_WID '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    l.*'
      '    , m.NAME MAT_NAME'
      '    , coalesce((select sum(iif(cnt = 2, 1, iif(cnt > 2, 2, 0 )))'
      
        '            from (select WLABEL , sum(iif(coalesce(WLBL_TYPE, 0)' +
        ' = 1, 2, iif(coalesce(WLBL_TYPE, 0) = 2, 1, 0))) cnt'
      '                  from Get_Wire_Info(l.Wid)'
      '                  where not WLBL_ID is null group by 1))'
      '            , 0) USED                '
      '    , coalesce((select'
      '                 count(distinct WLABEL) cnt'
      '               from Get_Wire_Info(l.Wid)'
      '               ), l.Capacity) LBL_COUNT'
      '  from (select'
      '            '#39'>'#39' FLOW'
      '          , T.O_NAME'
      '          , t.O_Dimension COLOR'
      '          , n.Node_Id'
      '          , n.Name CONN_NODE   '
      '          , C.*'
      '          from Wire C'
      
        '               inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O' +
        '_TYPE = 56)'
      
        '               left outer join NODEs n on (n.Node_Id = c.Point_E' +
        ')'
      '          where (C.Point_S = :NODE_ID)'
      '        union'
      '        select'
      '            '#39'<'#39' FLOW'
      '          , T.O_NAME'
      '          , t.O_Dimension COLOR'
      '          , n.Node_Id'
      '          , n.Name CONN_NODE         '
      '          , C.*'
      '          from Wire C'
      
        '               inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O' +
        '_TYPE = 56)'
      
        '               left outer join NODEs n on (n.Node_Id = c.Point_S' +
        ')'
      '          where (C.Point_E = :NODE_ID)) l'
      '       left outer join MATERIALS m on (m.M_Id =  l.M_ID)'
      '  order by CONN_NODE, NAME, FLOW, O_NAME')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 155
    Top = 77
  end
  object srcLink: TDataSource
    DataSet = dsLink
    Left = 183
    Top = 123
  end
  object ActList: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 230
    Top = 101
    object actAdd: TAction
      Hint = #1053#1086#1074#1072#1103' '#1083#1080#1085#1080#1103' '#1089#1074#1103#1079#1080' '#1086#1090' '#1091#1079#1083#1072
      ImageIndex = 2
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1083#1080#1085#1080#1102' '#1089#1074#1103#1079#1080
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actDel: TAction
      ImageIndex = 3
      OnExecute = actDelExecute
    end
    object actPEdit: TAction
      Hint = #1057#1086#1079#1076#1072#1090#1100'/'#1080#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1088#1090
      OnExecute = actPEditExecute
    end
    object actOpenObject: TAction
      Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1086#1073#1098#1077#1082#1090#1091
      ImageIndex = 99
      OnExecute = actOpenObjectExecute
    end
    object actOpenEqpmnt: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1054#1073#1086#1088#1091#1076'-'#1080#1077'/'#1040#1073#1086#1085#1077#1085#1090#1072
      OnExecute = actOpenEqpmntExecute
    end
    object actOpenEqpmntTo: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1091#1079#1077#1083
      OnExecute = actOpenEqpmntToExecute
    end
    object actOpenCustomer: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      OnExecute = actOpenCustomerExecute
    end
    object actWireLink: TAction
      Hint = #1055#1088#1086#1087#1080#1089#1072#1090#1100' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1087#1086#1088#1090#1072#1084
      ImageIndex = 100
      OnExecute = actWireLinkExecute
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
    Left = 339
    Top = 170
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
    Left = 419
    Top = 154
  end
  object qRead: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select Content from node_Files where NF_Id = :NF_Id')
    Left = 296
    Top = 120
  end
  object dsEQ: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    *'
      '  from Get_Wire_Info(:Wid)'
      '  order by WIRE_ID, Wlabel, WLBL_FLOW desc, WLBL_NAME')
    AutoUpdateOptions.UpdateTableName = 'REQUEST'
    AutoUpdateOptions.KeyFields = 'RQ_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_REQUEST'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcLink
    Left = 454
    Top = 95
  end
  object srcEQ: TDataSource
    DataSet = dsEQ
    Left = 518
    Top = 95
  end
  object pmOpen: TPopupMenu
    Left = 600
    Top = 96
    object miEqpmnt: TMenuItem
      Action = actOpenEqpmnt
    end
    object miOpenEqpmntTo: TMenuItem
      Action = actOpenEqpmntTo
    end
  end
  object pmGrid: TPopupMenu
    Left = 728
    Top = 94
    object miAdd: TMenuItem
      Action = actAdd
      Caption = #1053#1086#1074#1072#1103' '#1083#1080#1085#1080#1103' '#1089#1074#1103#1079#1080
    end
    object miEdit: TMenuItem
      Action = actEdit
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1083#1080#1085#1080#1102' '#1089#1074#1103#1079#1080
    end
    object miN1: TMenuItem
      Caption = '-'
    end
    object miWireLink: TMenuItem
      Action = actWireLink
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100' '#1083#1080#1085#1080#1102
    end
  end
end
