inherited TaskForm: TTaskForm
  Caption = #1047#1072#1076#1072#1095#1080' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
  ClientHeight = 593
  ClientWidth = 1017
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 193
    Width = 1017
  end
  inherited dbGrid: TDBGridEh
    Top = 197
    Width = 1017
    Height = 396
    AllowedOperations = [alopUpdateEh, alopDeleteEh]
    ColumnDefValues.ToolTips = True
    DrawMemoText = True
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentShowHint = False
    RowDetailPanel.Active = True
    RowDetailPanel.Height = 184
    RowDetailPanel.ActiveControl = dbgMsg
    RowDetailPanel.VertSizing = True
    RowHeight = 2
    RowLines = 1
    SumList.Active = True
    OnGetCellParams = dbGridGetCellParams
    OnRowDetailPanelHide = dbGridRowDetailPanelHide
    OnRowDetailPanelShow = dbGridRowDetailPanelShow
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'TITLE'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
        Title.TitleButton = True
        Width = 213
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 351
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PLAN_DATE'
        Footers = <>
        Title.Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1072#1090#1072
        Title.TitleButton = True
        Width = 68
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EXEC_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1080#1089#1087#1086#1083#1085#1077#1085#1080#1103
        Title.TitleButton = True
        Width = 72
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'LAST_MSG'
        Footers = <>
        Title.Caption = #1055#1086#1089#1083'. '#1082#1086#1084#1084'.'
        Title.TitleButton = True
        Width = 92
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'USERS'
        Footers = <>
        Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080
        Title.TitleButton = True
        Width = 109
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'COLOR'
        Footers = <>
        Title.Caption = #1062#1074#1077#1090
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'OWNER'
        Footers = <>
        Title.Caption = #1057#1086#1079#1076#1072#1083
        Title.TitleButton = True
        Width = 132
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_ON'
        Footers = <>
        Title.Caption = #1050#1086#1075#1076#1072
        Title.TitleButton = True
        Width = 93
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ID'
        Footers = <>
        Title.Caption = #1048#1044' '#1079#1072#1076#1072#1095#1080
        Width = 65
      end>
    inherited RowDetailData: TRowDetailPanelControlEh
      object pgcMSG: TPageControl
        Left = 0
        Top = 0
        Width = 982
        Height = 174
        ActivePage = tsGrid
        Align = alClient
        TabOrder = 0
        object tsGrid: TTabSheet
          Caption = 'tsGrid'
          object dbgMsg: TDBGridEh
            Left = 26
            Top = 0
            Width = 948
            Height = 146
            Align = alClient
            AllowedOperations = [alopDeleteEh]
            ColumnDefValues.ToolTips = True
            DataSource = srcMSG
            DrawMemoText = True
            DynProps = <>
            Flat = True
            FooterRowCount = 1
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
            RowHeight = 2
            RowLines = 1
            SumList.Active = True
            TabOrder = 1
            OnDblClick = dbgMsgDblClick
            Columns = <
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'TEXT'
                Footer.ValueType = fvtCount
                Footers = <>
                Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
                Title.TitleButton = True
                Width = 362
              end
              item
                CellButtons = <>
                CellDataIsLink = True
                DynProps = <>
                EditButtons = <>
                FieldName = 'OBJ_LINK'
                Footers = <>
                Title.Caption = #1054#1073#1098#1077#1082#1090
                Title.TitleButton = True
                Width = 145
                OnCellDataLinkClick = dbgMsgColumns1CellDataLinkClick
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'ADDED_BY'
                Footers = <>
                Title.Caption = #1050#1090#1086
                Title.TitleButton = True
                Width = 92
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'ADDED_ON'
                Footers = <>
                Title.Caption = #1050#1086#1075#1076#1072
                Title.TitleButton = True
                Title.SortIndex = 1
                Title.SortMarker = smDownEh
                Width = 108
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'OBJ_INFO'
                Footers = <>
                Title.Caption = #1048#1085#1092#1086' '#1087#1086' '#1086#1073#1098#1077#1082#1090#1091
                Width = 168
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object pnlButtons: TPanel
            Left = 0
            Top = 0
            Width = 26
            Height = 146
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              26
              146)
            object btnDel1: TSpeedButton
              Left = 2
              Top = 121
              Width = 22
              Height = 22
              Action = actDelMessage
              Anchors = [akLeft, akBottom]
              Flat = True
              Layout = blGlyphTop
            end
            object btnAdd1: TSpeedButton
              Left = 2
              Top = 3
              Width = 22
              Height = 22
              Flat = True
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
                55FF000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
                55FF000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
                55FF000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
                55FF000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
                55FF000000000000000000000000000000000000000000000000000000008BAE
                59FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD
                55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF00000000000000008BAE
                59FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD
                55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF00000000000000008BAE
                59FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD
                55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF00000000000000008DAF
                5CFF8BAE58FF8BAE58FF8BAE58FF8BAE58FF89AD55FF89AD55FF89AD55FF89AD
                55FF8BAE58FF8BAE58FF8BAE58FF8BAE58FF8BAE58FF00000000000000000000
                00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
                55FF000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
                55FF000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
                55FF000000000000000000000000000000000000000000000000000000000000
                00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
                55FF000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000008FB15FFF8FB15FFF8FB15FFF8FB1
                5FFF000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000000000000000
                0000000000000000000000000000000000000000000000000000}
              OnClick = btnAdd1Click
            end
            object btnEdit1: TSpeedButton
              Left = 2
              Top = 30
              Width = 22
              Height = 22
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
              OnClick = btnEdit1Click
            end
            object btnGoObject: TSpeedButton
              Left = 2
              Top = 58
              Width = 22
              Height = 22
              Hint = #1055#1077#1088#1077#1081#1090#1080' '#1082' '#1086#1073#1098#1077#1082#1090#1091
              Flat = True
              Glyph.Data = {
                36040000424D3604000000000000360000002800000010000000100000000100
                2000000000000004000000000000000000000000000000000000000000000000
                00000000000000000000C39D76FFB88552FFB37840FFB17338FFB17438FFB47A
                42FFB98856FFC5A27EFF00000000000000000000000000000000000000000000
                0000CBAE91FFB07134FFB07134FFB07134FFB07134FFB07134FFB07134FFB071
                34FFB07134FFB07134FFB07134FFD4C2B1FF0000000000000000000000000000
                0000B17234FFB07134FFB07134FFB07134FFB07134FFB07134FFB07134FFB071
                34FFB07134FFB07134FFB07134FFBA8754FF0000000000000000000000000000
                0000B27234FFB07134FFB07134FFB07134FFB07134FFB07134FFB07134FFB071
                34FFB07134FFB07134FFB07134FFBA8754FF0000000000000000000000000000
                0000B9844EFFB07134FFB07134FFB07134FFB07134FFB07134FFB07134FFB071
                34FFB07134FFB07134FFB07133FFC39B73FF0000000000000000000000000000
                0000C7B39EFFB17132FFB07134FFB07134FFB07134FF0000000000000000B071
                34FFB07134FFB07134FFB27131FFCABEB1FF00000000000000008D8D8DFF787A
                7BFF00000000B88046FFB07133FFB07134FF000000000000000000000000CEB6
                9EFFB07134FFB17133FFBF9A72FF00000000797A7BFF979797FF848484FF8383
                83FF7B7E7EFF00000000B7834DFFCAB095FF0000000000000000000000000000
                0000C29D75FFBD9468FF000000007A7C7DFF828282FF8D8D8DFF9A9A9AFF8181
                81FF7C7C7CFFA3A5A5FF0000000000000000C09970FFB07134FFB07134FFC4A1
                7CFF00000000000000009C9D9EFF7E7E7EFF808080FFA4A4A4FF000000007979
                79FFA1A1A1FF0000000000000000B58049FFB07133FFB07134FFB07134FFB071
                33FFBA8D5FFF0000000000000000979898FF7D7D7DFF00000000000000000000
                0000000000009EA1A2FF00000000B17132FFB07134FFB07134FFB07134FFB071
                34FFB27132FF00000000A0A2A2FF000000000000000000000000000000000000
                00007B7B7BFF83868AFFCDBCABFFB17133FFB07134FFB07134FFB07134FFB071
                34FFB17132FFD0C4B8FF797C80FF7E7E7EFF000000000000000000000000B8B8
                B8FF7D7D7DFF86898BFFCDBDADFFB17133FFB07134FFB07134FFB07134FFB071
                34FFB17132FF000000007D8184FF7D7D7DFFBFBFBFFF0000000000000000BFBF
                BFFF7C7C7CFF7C7E81FF00000000B27131FFB07134FFB07134FFB07134FFB071
                34FFB27131FF000000007C7E81FF7B7B7BFFC5C5C5FF00000000000000000000
                00008B8B8BFF777878FFADABA9FFB98957FFB07133FFB07134FFB07134FFB071
                33FFBE986FFFA6A4A2FF777878FF919191FF0000000000000000000000000000
                000000000000000000000000000000000000C7A584FFB57D46FFB67E49FFCAAD
                90FF000000000000000000000000000000000000000000000000}
              Layout = blGlyphTop
              OnClick = btnGoObjectClick
            end
            object btnOpenAll: TSpeedButton
              Left = 2
              Top = 86
              Width = 22
              Height = 22
              Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074#1089#1077#1093' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
              Flat = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6D3BFBA8551B2753BB072
                36B1753ABA8450E8D7C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFB37537B07236B07236B07236B07236B07236B07236ECEEF0B1D7EF
                66B7EA66B7EA66B7EA66B7EA66B7EA70BBEBFDFEFEB87F45B07236B07236B072
                36B07236B07236BB8753C0C4C7C5DFEF66B7EA66B7EA66B7EA66B7EA66B7EA66
                B7EACCE7F8FBF8F5B07236B57B44EDE0D3BA8551B07236FAF7F4A3A4A5E8F0F5
                66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA71BCEBE4F2FBFFFFFFF6EFE8D2AF
                8DF2E8DEFFFFFFFFFFFF858686FFFFFF72BCEA66B7EA66B7EA66B7EA66B7EA66
                B7EA66B7EADCEEFAE6D0B9B07236B07236B07236DCBEA1FFFFFF787878EEF1F3
                95CBED66B7EA66B7EA66B7EA66B7EA66B7EA68B8EAFCFDFEBC8246B07236B072
                36B07236B37537FFFFFF787878D1D4D6B9DAEE66B7EA66B7EA66B7EA66B7EA66
                B7EA66B7EAF0F8FDCA9C6DB07236B07236B07236BE8A56FFFFFF787878B3B4B6
                DDEBF366B7EA66B7EA66B7EA66B7EA66B7EA66B7EAB3DBF4FFFFFFBA8450B072
                36B57B44FFFFFFFFFFFF787878949595FBFCFD6BB9EA66B7EA66B7EA66B7EA66
                B7EA66B7EA67B7EABDDFF5FCFDFEFFFFFFFDFEFEC9E5F7FFFFFF7878787B7B7B
                F9FAFB96CCED66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA66B7EA70BCEB88C7
                EE72BCEB67B7EAFFFFFF787878787878D1D3D4FBFCFCFBFCFDFBFCFDFBFCFDFB
                FCFDFBFCFDFCFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF787878787878
                7878787878787878787878787878787878787878787878787878787878787878
                78787878FCFCFCFFFFFF78787878787878787878787878787878787878787878
                7878787878787878787878787878787878828282FDFDFDFFFFFF787878787878
                7878787878787878787878787E7E7EC6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
                FFFFFFFFFFFFFFFFFFFF858585787878787878787878787878787878C6C6C6FF
                FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
              Layout = blGlyphTop
              PopupMenu = pmOpenObjects
              OnClick = btnOpenAllClick
            end
          end
        end
        object tsEdit: TTabSheet
          Caption = 'tsEdit'
          ImageIndex = 1
          DesignSize = (
            974
            146)
          object mmoTEXT: TDBMemoEh
            Left = 37
            Top = 0
            Width = 934
            Height = 116
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoSize = False
            DataField = 'TEXT'
            DataSource = srcMSG
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ShowHint = True
            TabOrder = 0
            Visible = True
            WantReturns = True
          end
          object cbbOBJ_TYPE: TDBComboBoxEh
            Left = 37
            Top = 122
            Width = 151
            Height = 21
            Anchors = [akLeft, akBottom]
            DataField = 'OBJ_TYPE'
            DataSource = srcMSG
            DynProps = <>
            EmptyDataInfo.Text = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072
            EditButtons = <>
            Items.Strings = (
              #1040#1073#1086#1085#1077#1085#1090
              #1047#1072#1103#1074#1082#1072
              #1055#1083#1072#1090#1077#1078
              #1059#1079#1077#1083)
            KeyItems.Strings = (
              'A'
              'R'
              'P'
              'N')
            ShowHint = True
            TabOrder = 1
            Visible = True
          end
          object edtOBJ_ID: TDBEditEh
            Left = 191
            Top = 122
            Width = 780
            Height = 21
            Anchors = [akLeft, akRight, akBottom]
            DataField = 'OBJ_ID'
            DataSource = srcMSG
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1048#1044' '#1086#1073#1098#1077#1082#1090#1072
            ShowHint = True
            TabOrder = 2
            Visible = True
          end
          object btnOk: TBitBtn
            Left = 0
            Top = 0
            Width = 34
            Height = 75
            Action = actMsgSave
            Anchors = [akLeft, akTop, akBottom]
            TabOrder = 3
          end
          object btnMsgCncl: TBitBtn
            Left = 0
            Top = 109
            Width = 34
            Height = 34
            Action = actMsgCancel
            Anchors = [akLeft, akBottom]
            TabOrder = 4
          end
        end
      end
    end
  end
  inherited tlbMain: TToolBar
    Width = 1017
    inherited ToolButton5: TToolButton
      Width = 10
    end
    inherited ToolButton6: TToolButton
      Left = 61
      Visible = False
    end
    inherited btnDelete: TToolButton
      Left = 65
    end
    inherited ToolButton9: TToolButton
      Left = 88
      Width = 10
    end
    inherited tbOk: TToolButton
      Left = 98
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Left = 121
      Visible = False
    end
    inherited tbCancel: TToolButton
      Left = 125
      Visible = False
    end
    inherited ToolButton20: TToolButton
      Left = 148
      Width = 10
      Visible = False
    end
    inherited btnQuickFilter: TToolButton
      Left = 158
    end
    object ToolButton19: TToolButton
      Left = 181
      Top = 0
      Visible = False
    end
    object btnFilter: TToolButton
      Left = 204
      Top = 0
      Action = actFilter
    end
    object btnClose: TToolButton
      Left = 227
      Top = 0
      Action = actClose
    end
    object btnSPclose: TToolButton
      Left = 250
      Top = 0
      Width = 10
      Caption = 'btnSPclose'
      ImageIndex = 54
      Style = tbsSeparator
    end
    object btnRefresh: TToolButton
      Left = 260
      Top = 0
      Action = actRefresh
    end
    object btn2: TToolButton
      Left = 283
      Top = 0
      Width = 10
      Caption = 'btn2'
      ImageIndex = 29
      Style = tbsSeparator
    end
    object btn1: TToolButton
      Left = 293
      Top = 0
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1074#1089#1077' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
      Caption = 'btn1'
      ImageIndex = 53
      OnClick = btn1Click
    end
  end
  inherited pnlEdit: TPanel
    Width = 1017
    Height = 168
    ParentBackground = False
    object lbl1: TLabel [0]
      Left = 5
      Top = 9
      Width = 53
      Height = 13
      Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
    end
    object lbl2: TLabel [1]
      Left = 5
      Top = 36
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object lbl3: TLabel [2]
      Left = 562
      Top = 9
      Width = 77
      Height = 13
      Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1072#1090#1072
    end
    object Label1: TLabel [3]
      Left = 562
      Top = 36
      Width = 71
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1099#1087#1086#1083#1085'.'
    end
    object lbl4: TLabel [4]
      Left = 562
      Top = 68
      Width = 63
      Height = 13
      Caption = #1050#1090#1086' '#1079#1072#1082#1088#1086#1077#1090
    end
    inherited btnSaveLink: TBitBtn
      Tag = 7
      Left = 62
      Top = 140
      Width = 842
      TabOrder = 8
    end
    inherited btnCancelLink: TBitBtn
      Left = 912
      Top = 140
      Width = 98
      TabOrder = 9
    end
    object edtTITLE: TDBEditEh
      Left = 62
      Top = 6
      Width = 491
      Height = 21
      DataField = 'TITLE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1079#1072#1076#1072#1095#1080
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object mmoNOTICE: TDBMemoEh
      Left = 62
      Top = 33
      Width = 491
      Height = 103
      Anchors = [akLeft, akTop, akBottom]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1079#1072#1076#1072#1095#1080
      ShowHint = True
      TabOrder = 1
      Visible = True
      WantReturns = True
    end
    object edtPLAN_DATE: TDBDateTimeEditEh
      Left = 645
      Top = 6
      Width = 132
      Height = 21
      DataField = 'PLAN_DATE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateTimeEh
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object edtEXEC_DATE: TDBDateTimeEditEh
      Left = 645
      Top = 33
      Width = 132
      Height = 21
      DataField = 'EXEC_DATE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateTimeEh
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object btnColor: TButton
      Left = 559
      Top = 111
      Width = 123
      Height = 25
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1094#1074#1077#1090
      TabOrder = 5
      OnClick = btnColorClick
    end
    object btnClearColor: TButton
      Left = 688
      Top = 111
      Width = 89
      Height = 25
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1086#1085' '#1076#1083#1103' '#1074#1099#1076#1077#1083#1077#1085#1080#1103' '#1072#1073#1086#1085#1077#1085#1090#1072
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1094#1074#1077#1090
      TabOrder = 6
      OnClick = btnClearColorClick
    end
    object dbgUsers: TDBGridEh
      Left = 783
      Top = 6
      Width = 227
      Height = 130
      Hint = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080' '#1079#1072#1076#1072#1095#1080
      AllowedOperations = [alopUpdateEh]
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = srcUsers
      DynProps = <>
      IndicatorOptions = []
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      SortLocal = True
      STFilter.Local = True
      STFilter.Visible = True
      TabOrder = 7
      OnKeyPress = dbgUsersKeyPress
      Columns = <
        item
          CellButtons = <>
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'IN_TASK'
          Footers = <>
          Title.Caption = #1042' '#1079#1072#1076#1072#1095#1077
          Title.TitleButton = True
          Width = 39
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FIO'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
          Title.TitleButton = True
          Width = 116
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object cbClose: TDBComboBoxEh
      Left = 645
      Top = 65
      Width = 132
      Height = 21
      Hint = 
        #1050#1086#1084#1091' '#1084#1086#1078#1085#1086' '#1079#1072#1082#1088#1099#1074#1072#1090#1100' '#1079#1072#1076#1072#1095#1091'. '#1045#1089#1083#1080' '#1086#1089#1090#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1099#1084', '#1090#1086' '#1079#1072#1082#1088#1099#1090#1100' '#1084#1086 +
        #1078#1077#1090' '#1090#1086#1090' '#1082#1090#1086' '#1087#1086#1089#1090#1072#1074#1080#1083
      DataField = 'WHO_CAN'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = #1050#1090#1086' '#1084#1086#1078#1077#1090' '#1079#1072#1082#1088#1099#1090#1100
      EditButtons = <>
      Items.Strings = (
        #1082#1090#1086' '#1087#1086#1089#1090#1072#1074#1080#1083
        #1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
        #1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100', '#1073#1077#1079' '#1076#1086#1083#1078#1085#1080#1082#1086#1074' '#1074' '#1079#1072#1076#1072#1095#1077)
      KeyItems.Strings = (
        '0'
        '1'
        '2')
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsTask
    OnDataChange = srcDataSourceDataChange
    Left = 104
    Top = 104
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 230
    Top = 480
    inherited actNew: TAction
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 27
      OnExecute = actRefreshExecute
    end
    object actFilter: TAction
      Caption = 'actFilter'
      ImageIndex = 0
      OnExecute = actFilterExecute
    end
    object actDelMessage: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1074#1086#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      ImageIndex = 3
      OnExecute = actDelMessageExecute
    end
    object actMsgSave: TAction
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      ImageIndex = 25
      OnExecute = actMsgSaveExecute
    end
    object actMsgCancel: TAction
      Hint = #1054#1090#1084#1077#1085#1072' ('#1053#1077' '#1089#1086#1093#1088#1072#1085#1103#1090#1100')'
      ImageIndex = 26
      OnExecute = actMsgCancelExecute
    end
    object actClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Hint = #1047#1072#1082#1088#1099#1090#1100' '#1079#1072#1076#1072#1095#1091
      ImageIndex = 25
      OnExecute = actCloseExecute
    end
    object actOpenCustAddr: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1072#1076#1088#1077#1089#1072' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      OnExecute = actOpenCustAddrExecute
    end
    object actCopyID: TAction
      Caption = 'actCopyID'
      ShortCut = 24649
      OnExecute = actCopyIDExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 187
    Top = 95
  end
  inherited CnErrors: TCnErrorProvider
    Left = 136
    Top = 480
  end
  object dsTask: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TASKLIST'
      'SET '
      '    TITLE = :TITLE,'
      '    NOTICE = :NOTICE,'
      '    PLAN_DATE = :PLAN_DATE,'
      '    EXEC_DATE = :EXEC_DATE,'
      '    COLOR = :COLOR,'
      '    WHO_CAN = :WHO_CAN'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'UPDATE TASKLIST'
      'SET '
      '    DELETED = 1'
      'WHERE'
      '    ID = :OLD_ID')
    InsertSQL.Strings = (
      'INSERT INTO TASKLIST('
      '    TITLE,'
      '    NOTICE,'
      '    PLAN_DATE,'
      '    EXEC_DATE,'
      '    COLOR,'
      '    WHO_CAN,'
      '    DELETED'
      ')'
      'VALUES('
      '    :TITLE,'
      '    :NOTICE,'
      '    :PLAN_DATE,'
      '    :EXEC_DATE,'
      '    :COLOR,'
      '    :WHO_CAN,'
      '    0'
      ')'
      'RETURNING ID')
    RefreshSQL.Strings = (
      'select'
      '    t.Id'
      '  , t.Title'
      '  , t.Notice'
      '  , t.Plan_Date'
      '  , t.Exec_Date'
      '  , t.Color'
      
        '  , coalesce(w.Surname || coalesce('#39' '#39' || w.Firstname, '#39#39'), t.Ad' +
        'ded_By) OWNER'
      '  , t.Added_By'
      '  , t.Added_On'
      '  , t.Deleted'
      '  , t.WHO_CAN'
      '  ,'
      '    (select first 1'
      '         m.Text'
      '       from Taskmsg m'
      '       where m.Task_Id = t.ID'
      '       order by m.Added_On desc) LAST_MSG'
      '  ,'
      '    (select'
      '         list(coalesce(wu.Surname, tu.Foruser))'
      '       from Taskuser tu'
      
        '            left outer join Worker wu on (tu.Foruser = wu.Ibname' +
        ')'
      '       where tu.Task_Id = t.Id) as USERS'
      '  , iif((t.Added_By = current_user), 1,'
      '    ('
      '    case coalesce(t.WHO_CAN, 0)'
      '      when 1 then -- '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      '      iif(exists(select'
      '                     current_user'
      '                   from Taskuser tu'
      '                   where tu.Task_Id = t.Id'
      '                         and tu.Foruser = current_user), 1, 0)'
      '      when 2 then -- '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100' '#1085#1086' '#1085#1077#1090' '#1076#1086#1083#1078#1085#1080#1082#1086#1074
      '      iif(exists(select'
      '                     current_user'
      '                   from Taskuser tu'
      '                   where tu.Task_Id = t.Id'
      
        '                         and tu.Foruser = current_user), iif(exi' +
        'sts(select'
      
        '                                                                ' +
        '        Id'
      
        '                                                                ' +
        '      from Taskmsg m'
      
        '                                                                ' +
        '           inner join Customer c on (c.Account_No = m.Obj_Id and'
      
        '                                                                ' +
        '                 c.Debt_Sum > 0)'
      
        '                                                                ' +
        '      where m.Obj_Type = '#39'A'#39' and m.task_id = t.id), 0, 1),'
      ''
      '      0)'
      '      else -- '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100' '#1080' '#1077#1089#1090#1100' '#1087#1088#1072#1074#1086' '#1079#1072#1082#1088#1099#1090#1100
      '    iif(exists(select'
      '                   tu.Task_Id'
      '                 from Taskuser tu'
      
        '                      inner join Sys$User u on (u.Ibname = tu.Fo' +
        'ruser)'
      
        '                      inner join Sys$User_Groups ug on (ug.User_' +
        'Id = u.Id)'
      
        '                      inner join Sys$Group_Rights gr on (gr.Grou' +
        'p_Id = ug.Group_Id)'
      '                 where tu.Task_Id = t.Id'
      '                       and tu.Foruser = current_user'
      '                       and gr.Right_Id = 187 -- '#1079#1072#1082#1088#1099#1090#1080#1077' '#1079#1072#1076#1072#1095#1080
      '    ), 1, 0)'
      '    end)'
      ''
      '    ) as CANCLOSE'
      '  from Tasklist t'
      '       left outer join Worker w on (t.Added_By = w.Ibname)'
      '  where (     T.ID = :OLD_ID'
      '     )'
      '    '
      '                       ')
    SelectSQL.Strings = (
      'select'
      '    t.Id'
      '  , t.Title'
      '  , t.Notice'
      '  , t.Plan_Date'
      '  , t.Exec_Date'
      '  , t.Color'
      
        '  , coalesce(w.Surname || coalesce('#39' '#39' || w.Firstname, '#39#39'), t.Ad' +
        'ded_By) OWNER'
      '  , t.Added_By'
      '  , t.Added_On'
      '  , t.Deleted'
      '  , t.WHO_CAN'
      '  ,'
      '    (select first 1'
      '         m.Text'
      '       from Taskmsg m'
      '       where m.Task_Id = t.ID'
      '       order by m.Added_On desc) LAST_MSG'
      '  ,'
      '    (select'
      '         list(coalesce(wu.Surname, tu.Foruser))'
      '       from Taskuser tu'
      
        '            left outer join Worker wu on (tu.Foruser = wu.Ibname' +
        ')'
      '       where tu.Task_Id = t.Id) as USERS'
      '  , iif((t.Added_By = current_user), 1,'
      '    ('
      '    case coalesce(t.WHO_CAN, 0)'
      '      when 1 then -- '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      '      iif(exists(select'
      '                     current_user'
      '                   from Taskuser tu'
      '                   where tu.Task_Id = t.Id'
      '                         and tu.Foruser = current_user), 1, 0)'
      '      when 2 then -- '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100' '#1085#1086' '#1085#1077#1090' '#1076#1086#1083#1078#1085#1080#1082#1086#1074
      '      iif(exists(select'
      '                     current_user'
      '                   from Taskuser tu'
      '                   where tu.Task_Id = t.Id'
      
        '                         and tu.Foruser = current_user), iif(exi' +
        'sts(select'
      
        '                                                                ' +
        '        Id'
      
        '                                                                ' +
        '      from Taskmsg m'
      
        '                                                                ' +
        '           inner join Customer c on (c.Account_No = m.Obj_Id and'
      
        '                                                                ' +
        '                 c.Debt_Sum > 0)'
      
        '                                                                ' +
        '      where m.Obj_Type = '#39'A'#39' and m.task_id = t.id), 0, 1),'
      ''
      '      0)'
      '      else -- '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100' '#1080' '#1077#1089#1090#1100' '#1087#1088#1072#1074#1086' '#1079#1072#1082#1088#1099#1090#1100
      '    iif(exists(select'
      '                   tu.Task_Id'
      '                 from Taskuser tu'
      
        '                      inner join Sys$User u on (u.Ibname = tu.Fo' +
        'ruser)'
      
        '                      inner join Sys$User_Groups ug on (ug.User_' +
        'Id = u.Id)'
      
        '                      inner join Sys$Group_Rights gr on (gr.Grou' +
        'p_Id = ug.Group_Id)'
      '                 where tu.Task_Id = t.Id'
      '                       and tu.Foruser = current_user'
      '                       and gr.Right_Id = 187 -- '#1079#1072#1082#1088#1099#1090#1080#1077' '#1079#1072#1076#1072#1095#1080
      '    ), 1, 0)'
      '    end)'
      ''
      '    ) as CANCLOSE'
      '  from Tasklist t'
      '       left outer join Worker w on (t.Added_By = w.Ibname)'
      '  where t.deleted = 0 '
      '  @@FILTER@'
      '            '
      '                       ')
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoUpdateOptions.UseReturningFields = [rfKeyFields]
    OnNewRecord = dsTaskNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 432
    Top = 480
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 352
    Top = 472
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 288
    Top = 472
  end
  object dsMSG: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TASKMSG'
      'SET '
      '    TASK_ID = :TASK_ID,'
      '    TEXT = :TEXT,'
      '    OBJ_TYPE = :OBJ_TYPE,'
      '    OBJ_ID = :OBJ_ID'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'update TASKMSG t'
      'set t.DELETED = 1'
      'where t.ID = :OLD_ID'
      '      and (t.Added_By = current_user'
      '        or (exists(select'
      '                       l.Id'
      '                     from Tasklist l'
      '                     where l.Id = t.Task_Id'
      '                           and l.Added_By = current_user)))')
    InsertSQL.Strings = (
      'INSERT INTO TASKMSG('
      '    ID,'
      '    TASK_ID,'
      '    TEXT,'
      '    OBJ_TYPE,'
      '    OBJ_ID'
      ')'
      'VALUES('
      '    :ID,'
      '    :TASK_ID,'
      '    :TEXT,'
      '    :OBJ_TYPE,'
      '    :OBJ_ID'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    m.Id, m.Task_Id, m.Text, m.Obj_Type, m.Obj_Id, '
      '    coalesce(w.Surname, m.Added_By) FIO, m.Added_By'
      '    , m.Added_On'
      '    , case upper(m.Obj_Type)'
      '           when '#39'A'#39' then '#39#1040'.'#39'||m.Obj_Id'
      '           when '#39'R'#39' then '#39#1047'.'#39'||m.Obj_Id'
      '           when '#39'P'#39' then '#39#1055'.'#39'||m.Obj_Id'
      '           when '#39'N'#39' then '#39#1059'.'#39'||m.Obj_Id'
      '           else '#39#39
      '        end OBJ_LINK'
      '    , case upper(m.Obj_Type)'
      
        '           when '#39'A'#39' then (select '#39#1082#1086#1076':'#39'||c.Cust_Code||iif(:sab =' +
        ' 1, '#39' '#1073#1072#1083':'#39'||(-1*c.Debt_Sum), '#39' '#1089#1072#1083':'#39'||c.Debt_Sum)||'#39' '#1060#1048#1054':'#39'||c.F' +
        'irstname||'#39' '#39'||c.Initials||'#39' '#1089#1086#1089#1090':'#39'||c.Cust_State_Descr from cus' +
        'tomer c where c.Account_No = m.Obj_Id)'
      '           when '#39'R'#39' then (select'
      
        '    '#39#1082#1086#1076':'#39'||S.Street_Code || '#39'-'#39' || h.House_No || '#39' '#1079#1072#1103#1074#1082#1072':'#39' || ' +
        'coalesce(TPL.RQ_CONTENT, '#39#39') || coalesce('#39'.'#39' || R.ADD_INFO, '#39#39') ' +
        '|| iif(coalesce(R.RQ_CONTENT, '#39#39') <> '#39#39', coalesce('#39' ('#39' || R.RQ_C' +
        'ONTENT || '#39')'#39', '#39#39'), '#39#39')'
      '  from REQUEST R'
      '       inner join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)'
      '       inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      
        '       left outer join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_ID' +
        ')'
      
        '       left outer join REQUEST_TEMPLATES TPL on (TPL.RQTL_ID = R' +
        '.RQTL_ID)'
      '  where R.RQ_ID = m.Obj_Id)'
      '           when '#39'P'#39' then (select'
      
        '    '#39#1089#1091#1084#1084#1072':'#39'||P.Pay_Sum || '#39' '#1076#1072#1090#1072':'#39' || p.Pay_Date || '#39' '#1083#1080#1094':'#39' || ' +
        'cs.Account_No || '#39' '#1073#1072#1083':'#39' || (-1*cs.Debt_Sum)'
      '  from PAYMENT P'
      
        '       inner join Customer CS on (CS.Customer_Id = P.Customer_Id' +
        ')'
      '  where P.Payment_Id = m.Obj_Id)'
      '           when '#39'N'#39' then '#39#39
      '           else '#39#39
      '        end OBJ_INFO'
      '  from Taskmsg m'
      '    left outer join Worker w on (m.Added_By = w.Ibname)'
      ''
      '  where (     M.ID = :OLD_ID     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    m.Id'
      '  , m.Task_Id'
      '  , m.Text'
      '  , m.Obj_Type'
      '  , m.Obj_Id'
      '  , coalesce(w.Surname, m.Added_By) FIO'
      '  , m.Added_By'
      '  , m.Added_On'
      '  , case upper(m.Obj_Type)'
      '      when '#39'A'#39' then '#39#1040'.'#39' || m.Obj_Id'
      '      when '#39'R'#39' then '#39#1047'.'#39' || m.Obj_Id'
      '      when '#39'P'#39' then '#39#1055'.'#39' || m.Obj_Id'
      '      when '#39'N'#39' then '#39#1059'.'#39' || m.Obj_Id'
      '      else '#39#39
      '    end OBJ_LINK,'
      '    case upper(m.Obj_Type)'
      '      when '#39'A'#39' then (select'
      
        '                         '#39#1082#1086#1076':'#39' || c.Cust_Code || iif(:sab = 1, ' +
        #39' '#1073#1072#1083':'#39' ||(-1 * c.Debt_Sum), '#39' '#1089#1072#1083':'#39' || c.Debt_Sum) || '#39' '#1060#1048#1054':'#39' |' +
        '| c.Firstname || '#39' '#39' || c.Initials || '#39' '#1089#1086#1089#1090':'#39' || c.Cust_State_D' +
        'escr'
      '                       from customer c'
      '                       where c.Account_No = m.Obj_Id)'
      '      when '#39'R'#39' then (select'
      
        '                         '#39#1082#1086#1076':'#39' || S.Street_Code || '#39'-'#39' || h.Hou' +
        'se_No || '#39' '#1079#1072#1103#1074#1082#1072':'#39' || coalesce(TPL.RQ_CONTENT, '#39#39') || coalesce(' +
        #39'.'#39' || R.ADD_INFO, '#39#39') || iif(coalesce(R.RQ_CONTENT, '#39#39') <> '#39#39', ' +
        'coalesce('#39' ('#39' || R.RQ_CONTENT || '#39')'#39', '#39#39'), '#39#39')'
      '                       from REQUEST R'
      
        '                            inner join HOUSE H on (R.HOUSE_ID = ' +
        'H.HOUSE_ID)'
      
        '                            inner join STREET S on (S.STREET_ID ' +
        '= H.STREET_ID)'
      
        '                            left outer join REQUEST_TYPES RT on ' +
        '(R.RQ_TYPE = RT.RT_ID)'
      
        '                            left outer join REQUEST_TEMPLATES TP' +
        'L on (TPL.RQTL_ID = R.RQTL_ID)'
      '                       where R.RQ_ID = m.Obj_Id)'
      '      when '#39'P'#39' then (select'
      
        '                         '#39#1089#1091#1084#1084#1072':'#39' || P.Pay_Sum || '#39' '#1076#1072#1090#1072':'#39' || p.' +
        'Pay_Date || '#39' '#1083#1080#1094':'#39' || cs.Account_No || '#39' '#1073#1072#1083':'#39' ||(-1 * cs.Debt_' +
        'Sum)'
      '                       from PAYMENT P'
      
        '                            inner join Customer CS on (CS.Custom' +
        'er_Id = P.Customer_Id)'
      '                       where P.Payment_Id = m.Obj_Id)'
      '      when '#39'N'#39' then '#39#39
      '      else '#39#39
      '    end OBJ_INFO'
      '  from Taskmsg m'
      '       left outer join Worker w on (m.Added_By = w.Ibname)'
      '  where (deleted = 0)'
      '        and (m.Task_Id = :ID)'
      '  order by m.Added_On desc')
    AutoUpdateOptions.UpdateTableName = 'TASKMSG'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_TASK'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 504
    Top = 472
    oFetchAll = True
  end
  object srcMSG: TDataSource
    AutoEdit = False
    DataSet = dsMSG
    Left = 592
    Top = 440
  end
  object dlgColor: TColorDialog
    Left = 594
    Top = 496
  end
  object dsUsers: TpFIBDataSet
    UpdateSQL.Strings = (
      'execute block ('
      '    Task_Id integer = :Task_Id,'
      '    Ibname  varchar(50) = :Ibname,'
      '    in_task integer = :in_task)'
      'as'
      'begin'
      '--  if (in_task = 0) then'
      '--    delete from Taskuser where Task_Id = :task_id'
      '--          and foruser = :Ibname;'
      '--  else'
      '--    update or insert into Taskuser (Task_Id, Foruser)'
      '--    values (:Task_Id, :Ibname)'
      '--    matching (Task_Id, Foruser);'
      'end')
    SelectSQL.Strings = (
      'select'
      '    w.Surname || coalesce('#39' '#39'||w.Firstname, '#39#39') FIO'
      '    , w.Ibname'
      '    , iif( t.Foruser is null, 0, 1 ) in_task'
      '  from worker w'
      
        '    left join Taskuser t on (t.Foruser = w.Ibname and t.Task_Id ' +
        '= :id )'
      'where not w.Ibname is null'
      '  and (coalesce(w.Surname, '#39#39') <> '#39#39')    '
      'order by 1')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 744
    Top = 440
  end
  object srcUsers: TDataSource
    DataSet = mtbUsers
    Left = 744
    Top = 488
  end
  object mtbUsers: TMemTableEh
    Params = <>
    Left = 680
    Top = 432
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object IN_TASK: TMTBooleanDataFieldEh
          FieldName = 'IN_TASK'
          DisplayWidth = 20
        end
        object FIO: TMTStringDataFieldEh
          FieldName = 'FIO'
          StringDataType = fdtStringEh
          DisplayWidth = 50
        end
        object IBNAME: TMTStringDataFieldEh
          FieldName = 'IBNAME'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object dsFilter: TMemTableEh
    Params = <>
    OnNewRecord = dsFilterNewRecord
    Left = 47
    Top = 474
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object obj_id: TMTStringDataFieldEh
          FieldName = 'obj_id'
          StringDataType = fdtStringEh
          DisplayWidth = 100
          Size = 100
        end
        object obj_type: TMTStringDataFieldEh
          FieldName = 'obj_type'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object INVERSION: TMTBooleanDataFieldEh
          FieldName = 'INVERSION'
          DisplayLabel = 'INVERSION'
          DisplayWidth = 5
        end
        object NEXT_CONDITION: TMTNumericDataFieldEh
          FieldName = 'NEXT_CONDITION'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'NEXT_CONDITION'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object EXEC_FROM: TMTDateTimeDataFieldEh
          FieldName = 'EXEC_FROM'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object EXEC_TO: TMTDateTimeDataFieldEh
          FieldName = 'EXEC_TO'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object PLAN_FROM: TMTDateTimeDataFieldEh
          FieldName = 'PLAN_FROM'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object PLAN_TO: TMTDateTimeDataFieldEh
          FieldName = 'PLAN_TO'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object NotClosed: TMTBooleanDataFieldEh
          FieldName = 'NotClosed'
          DisplayWidth = 20
        end
        object WORKER: TMTStringDataFieldEh
          FieldName = 'WORKER'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object AllUsers: TMTBooleanDataFieldEh
          FieldName = 'AllUsers'
          DisplayWidth = 20
        end
        object TASK_ID: TMTNumericDataFieldEh
          FieldName = 'TASK_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object pmOpenObjects: TPopupMenu
    Left = 146
    Top = 357
    object miOpenCustAddr: TMenuItem
      Action = actOpenCustAddr
    end
  end
end
