inherited WireForm: TWireForm
  Caption = #1050#1072#1073#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1088#1072#1089#1090#1088#1091#1082#1090#1091#1088#1072
  ClientHeight = 490
  ClientWidth = 914
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 57
    Width = 914
  end
  object spl1: TSplitter [1]
    Left = 0
    Top = 294
    Width = 914
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  inherited dbGrid: TDBGridEh
    Top = 60
    Width = 914
    Height = 234
    AllowedOperations = [alopDeleteEh]
    FooterRowCount = 1
    SumList.Active = True
    OnGetCellParams = dbGridGetCellParams
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CT_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1082#1072#1073#1077#1083#1103
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 91
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MAT_NAME'
        Footers = <>
        Title.Caption = #1050#1072#1073#1077#1083#1100
        Title.TitleButton = True
        Width = 84
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'METERS'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1044#1083#1080#1085#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STOCK'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1047#1072#1087#1072#1089
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'LABELS'
        Footers = <>
        Title.Caption = #1052#1077#1090#1082#1080
        Title.TitleButton = True
        Width = 41
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CAPACITY'
        Footers = <>
        Title.Caption = #1045#1084#1082#1086#1089#1090#1100
        Title.TitleButton = True
        Width = 56
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 120
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NODE_S'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1085#1072#1095#1072#1083#1100#1085#1099#1081'|'#1059#1079#1077#1083
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'S_STREET'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1085#1072#1095#1072#1083#1100#1085#1099#1081'|'#1059#1083#1080#1094#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'S_HOUSE'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1085#1072#1095#1072#1083#1100#1085#1099#1081'|'#1044#1086#1084
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'S_TYPE'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1085#1072#1095#1072#1083#1100#1085#1099#1081'|'#1058#1080#1087
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NODE_E'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1082#1086#1085#1077#1095#1085#1099#1081'|'#1059#1079#1077#1083
        Title.TitleButton = True
        Width = 72
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'E_STREET'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1082#1086#1085#1077#1095#1085#1099#1081'|'#1059#1083#1080#1094#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'E_HOUSE'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1082#1086#1085#1077#1095#1085#1099#1081'|'#1044#1086#1084
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'E_TYPE'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1082#1086#1085#1077#1095#1085#1099#1081'|'#1058#1080#1087
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 914
    inherited ToolButton6: TToolButton
      Visible = False
    end
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
    end
    inherited ToolButton20: TToolButton
      Visible = False
    end
    object btnFilterNew: TToolButton
      Left = 178
      Top = 0
      Action = actFilterSet
      DropdownMenu = pmFilter
      Style = tbsDropDown
    end
    object btn1: TToolButton
      Left = 216
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 41
      Style = tbsSeparator
    end
    object btnPrint: TToolButton
      Left = 224
      Top = 0
      Action = actPrint
    end
    object btn2: TToolButton
      Left = 247
      Top = 0
      Width = 8
      Caption = 'btn2'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object btn3: TToolButton
      Left = 255
      Top = 0
      Caption = 'btn3'
      ImageIndex = 6
    end
  end
  inherited pnlEdit: TPanel
    Width = 914
    Height = 32
    inherited btnSaveLink: TBitBtn
      Top = -1
      Width = 728
    end
    inherited btnCancelLink: TBitBtn
      Left = 819
      Top = -1
    end
  end
  object pgcWire: TPageControl [5]
    Left = 0
    Top = 297
    Width = 914
    Height = 193
    ActivePage = tsPort
    Align = alBottom
    TabOrder = 3
    OnChange = pgcWireChange
    object tsPort: TTabSheet
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
      object pnlPorts: TPanel
        Left = 0
        Top = 0
        Width = 906
        Height = 165
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbgWireLink: TDBGridEh
          Left = 26
          Top = 0
          Width = 880
          Height = 165
          Align = alClient
          DataSource = srcPorts
          DynProps = <>
          Flat = True
          PopupMenu = pmOpen
          TabOrder = 0
          TitleParams.MultiTitle = True
          OnGetCellParams = dbgWireLinkGetCellParams
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'WLABEL'
              Footers = <>
              HideDuplicates = True
              Title.Caption = #1052#1077#1090#1082#1072
              Width = 67
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'PORT'
              Footers = <>
              Title.Caption = #1055#1086#1088#1090
              Width = 70
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'ENAME'
              Footers = <>
              Title.Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
              Width = 185
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'IP'
              Footers = <>
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'MAC'
              Footers = <>
              Width = 241
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NNAME'
              Footers = <>
              Title.Caption = #1059#1079#1077#1083
              Width = 95
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NTNAME'
              Footers = <>
              Title.Caption = #1058#1080#1087' '#1091#1079#1083#1072
              Width = 109
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pnlButtons: TPanel
          Left = 0
          Top = 0
          Width = 26
          Height = 165
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            26
            165)
          object btnDel: TSpeedButton
            Left = 2
            Top = 141
            Width = 22
            Height = 22
            Hint = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1082#1072#1073#1077#1083#1100'/'#1078#1080#1083#1091' '#1086#1090' '#1087#1086#1088#1090#1086#1074
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
          object btnAdd1: TSpeedButton
            Left = 2
            Top = 2
            Width = 22
            Height = 22
            Action = actPortLinkAdd
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
          object btnPortLinkEdit: TSpeedButton
            Left = 2
            Top = 29
            Width = 22
            Height = 22
            Action = actPortLinkEdit
            Flat = True
            Visible = False
          end
          object btnOpen: TSpeedButton
            Left = 2
            Top = 59
            Width = 22
            Height = 22
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
            PopupMenu = pmOpen
            OnClick = btnOpenClick
          end
        end
      end
    end
    object tsPoint: TTabSheet
      Caption = #1055#1088#1086#1093#1086#1076#1085#1099#1077' '#1090#1086#1095#1082#1080
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 165
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          26
          165)
        object btnPointDel: TSpeedButton
          Left = 2
          Top = 141
          Width = 22
          Height = 22
          Action = actPointDel
          Anchors = [akLeft, akBottom]
          Flat = True
          Layout = blGlyphTop
        end
        object btnPointAdd: TSpeedButton
          Left = 2
          Top = 2
          Width = 22
          Height = 22
          Action = actPointAdd
          Flat = True
        end
        object btnPointEdit: TSpeedButton
          Left = 2
          Top = 29
          Width = 22
          Height = 22
          Action = actPointEdit
          Flat = True
        end
      end
      object dbgPoint: TDBGridEh
        Left = 26
        Top = 0
        Width = 880
        Height = 165
        Align = alClient
        DataSource = srcPoint
        DynProps = <>
        Flat = True
        PopupMenu = pmOpen
        TabOrder = 1
        TitleParams.MultiTitle = True
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NODE_NAME'
            Footers = <>
            Title.Caption = #1059#1079#1077#1083
            Title.TitleButton = True
            Width = 257
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'METERS'
            Footers = <>
            Title.Caption = #1052#1077#1090#1088#1072#1078
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 251
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'S_TYPE'
            Footers = <>
            Title.Caption = #1058#1080#1087' '#1091#1079#1083#1072
            Title.TitleButton = True
            Width = 95
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'S_STREET'
            Footers = <>
            Title.Caption = #1059#1083#1080#1094#1072
            Title.TitleButton = True
            Width = 155
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'S_HOUSE'
            Footers = <>
            Title.Caption = #1044#1086#1084
            Title.TitleButton = True
            Width = 81
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsWire
    Left = 200
    Top = 256
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    inherited actNew: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1074#1103#1079#1100
      OnExecute = actNewExecute
    end
    inherited actEdit: TAction [1]
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1074#1103#1079#1100
      OnExecute = actEditExecute
    end
    inherited actDelete: TAction [2]
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1074#1103#1079#1100
      OnExecute = actDeleteExecute
    end
    object actPrint: TAction [3]
      Caption = 'actPrint'
      ImageIndex = 5
    end
    inherited actFilterFLD: TAction [4]
    end
    object actFilterSet: TAction [5]
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 0
      ShortCut = 114
      OnExecute = actFilterSetExecute
    end
    object actSetFilterNew: TAction [6]
      Caption = #1053#1086#1074#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1092#1080#1083#1100#1090#1088' '#1089' '#1086#1095#1080#1089#1090#1082#1086#1081' '#1089#1090#1072#1088#1086#1075#1086
      ImageIndex = 0
      ShortCut = 8306
    end
    inherited actQuickFilter: TAction [7]
    end
    object actEnableFilter: TAction
      Caption = #1042#1082#1083'/'#1042#1099#1082#1083'. '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100'/'#1074#1099#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ShortCut = 16498
      OnExecute = actEnableFilterExecute
    end
    object actOpenObject: TAction
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1086#1073#1098#1077#1082#1090
      ImageIndex = 99
    end
    object actOpenNodeFrom: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1059#1079#1077#1083' '#1048#1047
      OnExecute = actOpenNodeFromExecute
    end
    object actOpenNodeTo: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1059#1079#1077#1083' '#1042
      OnExecute = actOpenNodeToExecute
    end
    object actPortLinkAdd: TAction
      Hint = #1055#1088#1086#1087#1080#1089#1072#1090#1100' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1087#1086#1088#1090#1072#1084
      ImageIndex = 100
      OnExecute = actPortLinkAddExecute
    end
    object actPortLinkEdit: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1087#1086#1088#1090#1072#1084
      ImageIndex = 4
    end
    object actPointAdd: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1086#1095#1082#1091
      ImageIndex = 2
      OnExecute = actPointAddExecute
    end
    object actPointEdit: TAction
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1086#1095#1082#1091
      ImageIndex = 4
    end
    object actPointDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1086#1095#1082#1091
      ImageIndex = 3
      OnExecute = actPointDelExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 483
    Top = 199
    object miOpenNodeFrom: TMenuItem [2]
      Action = actOpenNodeFrom
    end
    object miOpenNodeTo: TMenuItem [3]
      Action = actOpenNodeTo
    end
    object miN1: TMenuItem [4]
      Caption = '-'
    end
  end
  inherited CnErrors: TCnErrorProvider
    Left = 344
    Top = 176
  end
  object dsWire: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    WIRE'
      'WHERE'
      '        WID = :OLD_WID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    T.O_NAME CT_NAME'
      '  , t.O_Dimension COLOR'
      '  , C.*'
      '  , m.NAME MAT_NAME'
      '  , s.Node_Id NODE_S_ID'
      '  , s.Name NODE_S'
      '  , e.Node_Id NODE_E_ID'
      '  , e.Name NODE_E'
      '  , ST.O_Name S_TYPE'
      '  , SS.Street_Name || '#39' '#39' || SS.street_short S_STREET'
      '  , SH.House_No S_HOUSE'
      '  , ET.O_Name E_TYPE'
      '  , ES.Street_Name || '#39' '#39' || ES.street_short E_STREET'
      '  , EH.House_No E_HOUSE'
      '  from Wire C'
      
        '       inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O_TYPE = ' +
        '56)'
      ''
      '       inner join NODEs s on (s.Node_Id = c.Point_S)'
      '       inner join HOUSE SH on (SH.HOUSE_ID = S.HOUSE_ID)'
      '       inner join STREET SS on (SS.STREET_ID = SH.STREET_ID)'
      
        '       inner join objects ST on (ST.O_Id = s.Type_Id and ST.O_Ty' +
        'pe = 38)'
      ''
      '       left outer join MATERIALS m on (m.M_Id =  c.M_ID)'
      ''
      '       left outer join NODEs e on (e.Node_Id = c.Point_E)'
      '       left outer join HOUSE EH on (EH.HOUSE_ID = E.HOUSE_ID)'
      
        '       left outer join STREET ES on (ES.STREET_ID = EH.STREET_ID' +
        ')'
      
        '       left outer join objects ET on (ET.O_Id = e.Type_Id and ET' +
        '.O_Type = 38)'
      ''
      ' WHERE '
      '        C.WID = :OLD_WID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    T.O_NAME CT_NAME'
      '  , t.O_Dimension COLOR'
      '  , C.*'
      '  , m.NAME MAT_NAME'
      '  , s.Node_Id NODE_S_ID'
      '  , s.Name NODE_S'
      '  , e.Node_Id NODE_E_ID'
      '  , e.Name NODE_E'
      '  , ST.O_Name S_TYPE'
      '  , SS.Street_Name || '#39' '#39' || SS.street_short S_STREET'
      '  , SH.House_No S_HOUSE'
      '  , ET.O_Name E_TYPE'
      '  , ES.Street_Name || '#39' '#39' || ES.street_short E_STREET'
      '  , EH.House_No E_HOUSE'
      '  from Wire C'
      
        '       inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O_TYPE = ' +
        '56)'
      ''
      '       inner join NODEs s on (s.Node_Id = c.Point_S)'
      '       inner join HOUSE SH on (SH.HOUSE_ID = S.HOUSE_ID)'
      '       inner join STREET SS on (SS.STREET_ID = SH.STREET_ID)'
      
        '       inner join objects ST on (ST.O_Id = s.Type_Id and ST.O_Ty' +
        'pe = 38)'
      ''
      '       left outer join MATERIALS m on (m.M_Id =  c.M_ID)'
      ''
      '       left outer join NODEs e on (e.Node_Id = c.Point_E)'
      '       left outer join HOUSE EH on (EH.HOUSE_ID = E.HOUSE_ID)'
      
        '       left outer join STREET ES on (ES.STREET_ID = EH.STREET_ID' +
        ')'
      
        '       left outer join objects ET on (ET.O_Id = e.Type_Id and ET' +
        '.O_Type = 38)'
      'WHERE @@filter%1=1@ ')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 200
    Top = 192
  end
  object frxReport: TfrxReport
    Version = '2021.2.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38761.722679213000000000
    ReportOptions.LastChange = 41847.539245937500000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnUserFunction = frxReportUserFunction
    Left = 488
    Top = 136
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
    Left = 272
    Top = 190
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
    Left = 272
    Top = 252
  end
  object pmFilter: TPopupMenu
    Left = 79
    Top = 154
    object N31: TMenuItem
      Caption = #1042#1082#1083'/'#1042#1099#1082#1083'. '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100'/'#1074#1099#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ShortCut = 16498
    end
    object N53: TMenuItem
      Action = actSetFilterNew
    end
    object N42: TMenuItem
      Caption = '-'
    end
    object N36: TMenuItem
      Action = actQuickFilter
    end
  end
  object dsPorts: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    WIRE'
      'WHERE'
      '        WID = :OLD_WID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    p.Port'
      '  , p.Wlabel'
      '  , p.Wid'
      '  , w.Name WNAME'
      '  , w.Wtype'
      '  , e.Eid'
      '  , e.Name ENAME'
      '  , e.Ip'
      '  , e.Mac'
      '  , e.Node_Id'
      '  , w.Point_S'
      '  , w.Point_E'
      '  , n.Name NNAME'
      '  , nt.O_Name NTNAME'
      '  from port p'
      '       inner join wire w on (p.Wid = w.Wid)'
      
        '       left outer join equipment e on (e.Eid = p.Eid) --  and   ' +
        '           e.Node_Id = w.Point_S)'
      '       left outer join nodes n on (n.NODE_ID = e.NODE_ID)'
      
        '       left outer join objects nt on (nt.O_Id = n.Type_Id and nt' +
        '.O_Type = 38)'
      '  where '
      '        P.WLABEL = :OLD_WLABEL  '
      '    and P.WID = :OLD_WID'
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    p.Port'
      '  , p.Wlabel'
      '  , p.Wid'
      '  , w.Name WNAME'
      '  , w.Wtype'
      '  , e.Eid'
      '  , e.Name ENAME'
      '  , e.Ip'
      '  , e.Mac'
      '  , e.Node_Id'
      '  , w.Point_S'
      '  , w.Point_E'
      '  , n.Name NNAME'
      '  , nt.O_Name NTNAME'
      '  , iif(coalesce(p.con,1) = 1, (iif(exists(select'
      '                           sh.Customer_Id'
      '                         from Subscr_hist sh'
      
        '                              inner join services s on (sh.Serv_' +
        'Id = s.Service_Id)'
      
        '                              inner join TV_LAN l on (l.Customer' +
        '_Id = sh.Customer_Id)'
      '                         where s.Business_Type in (1, 3)'
      '                               and sh.Customer_Id = p.Con_Id'
      
        '                               and current_date between sh.Date_' +
        'From and sh.Date_To), 1,0)), 2) CUST_CONNECTED'
      '  from port p'
      '       inner join wire w on (p.Wid = w.Wid)'
      
        '       left outer join equipment e on (e.Eid = p.Eid) --  and   ' +
        '           e.Node_Id = w.Point_S)'
      '       left outer join nodes n on (n.NODE_ID = e.NODE_ID)'
      
        '       left outer join objects nt on (nt.O_Id = n.Type_Id and nt' +
        '.O_Type = 38)'
      '  where p.Wid = :WID'
      'order by w.Name, p.Wlabel, e.Name, p.PORT')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    DataSource = srcDataSource
    Left = 248
    Top = 360
    WaitEndMasterScroll = True
  end
  object srcPorts: TDataSource
    AutoEdit = False
    DataSet = dsPorts
    Left = 344
    Top = 360
  end
  object pmOpen: TPopupMenu
    Left = 112
    Top = 408
    object miOpenEq: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      OnClick = miOpenEqClick
    end
    object miOpenNode: TMenuItem
      Caption = #1054#1090#1082#1091#1088#1099#1090#1100' '#1091#1079#1077#1083
      OnClick = miOpenNodeClick
    end
  end
  object dsFilter: TMemTableEh
    Params = <>
    Left = 571
    Top = 163
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object inversion: TMTBooleanDataFieldEh
          FieldName = 'inversion'
          DefaultExpression = 'False'
          DisplayWidth = 20
        end
        object next_condition: TMTNumericDataFieldEh
          FieldName = 'next_condition'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DefaultExpression = '0'
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object FLOOR: TMTStringDataFieldEh
          FieldName = 'FLOOR'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object PORCH: TMTStringDataFieldEh
          FieldName = 'PORCH'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object CHECK_ADRESS: TMTNumericDataFieldEh
          FieldName = 'CHECK_ADRESS'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DefaultExpression = '0'
          DisplayLabel = 'CHECK_ADRESS'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object STREET_ID: TMTNumericDataFieldEh
          FieldName = 'STREET_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'STREET_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object HOUSE_ID: TMTNumericDataFieldEh
          FieldName = 'HOUSE_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'HOUSE_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object AREA_ID: TMTNumericDataFieldEh
          FieldName = 'AREA_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'AREA_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SUBAREA_ID: TMTNumericDataFieldEh
          FieldName = 'SUBAREA_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'SUBAREA_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object EQ_TYPE: TMTNumericDataFieldEh
          FieldName = 'EQ_TYPE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'LETTERS_TYPE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object FLAT: TMTStringDataFieldEh
          FieldName = 'FLAT'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object PLACE: TMTStringDataFieldEh
          FieldName = 'PLACE'
          StringDataType = fdtStringEh
          DisplayWidth = 100
        end
        object PROBLEM: TMTNumericDataFieldEh
          FieldName = 'PROBLEM'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object WTYPE: TMTNumericDataFieldEh
          FieldName = 'WTYPE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object MatID: TMTNumericDataFieldEh
          FieldName = 'MatID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object WLABEL: TMTStringDataFieldEh
          FieldName = 'WLABEL'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object dsPoint: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    WIRE'
      'WHERE'
      '        WID = :OLD_WID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    p.Port'
      '  , p.Wlabel'
      '  , p.Wid'
      '  , w.Name WNAME'
      '  , w.Wtype'
      '  , e.Eid'
      '  , e.Name ENAME'
      '  , e.Ip'
      '  , e.Mac'
      '  , e.Node_Id'
      '  , w.Point_S'
      '  , w.Point_E'
      '  , n.Name NNAME'
      '  , nt.O_Name NTNAME'
      '  from port p'
      '       inner join wire w on (p.Wid = w.Wid)'
      
        '       left outer join equipment e on (e.Eid = p.Eid) --  and   ' +
        '           e.Node_Id = w.Point_S)'
      '       left outer join nodes n on (n.NODE_ID = e.NODE_ID)'
      
        '       left outer join objects nt on (nt.O_Id = n.Type_Id and nt' +
        '.O_Type = 38)'
      '  where '
      '        P.WLABEL = :OLD_WLABEL  '
      '    and P.WID = :OLD_WID'
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '  p.*'
      '  , s.Name NODE_NAME'
      '  , ST.O_Name S_TYPE'
      '  , SS.Street_Name || '#39' '#39' || SS.street_short S_STREET'
      '  , SH.House_No S_HOUSE'
      '  from Wire_Point p'
      '       inner join NODEs s on (s.Node_Id = p.Node_Id)'
      '       inner join HOUSE SH on (SH.HOUSE_ID = S.HOUSE_ID)'
      '       inner join STREET SS on (SS.STREET_ID = SH.STREET_ID)'
      
        '       inner join objects ST on (ST.O_Id = s.Type_Id and ST.O_Ty' +
        'pe = 38)'
      'WHERE p.Wid = :WID'
      'order by s.Name')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    DataSource = srcDataSource
    Left = 472
    Top = 376
    WaitEndMasterScroll = True
  end
  object srcPoint: TDataSource
    AutoEdit = False
    DataSet = dsPoint
    Left = 528
    Top = 376
  end
end
