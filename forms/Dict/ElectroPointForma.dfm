inherited ElectroPointForm: TElectroPointForm
  Left = 381
  Top = 171
  Caption = #1058#1086#1095#1082#1080' '#1091#1095#1077#1090#1072' '#1101#1083#1077#1082#1090#1088#1086#1101#1085#1077#1088#1075#1080#1080
  ClientHeight = 530
  ClientWidth = 939
  Menu = mmMenu
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 193
    Width = 939
  end
  object spl1: TSplitter [1]
    Left = 0
    Top = 301
    Width = 939
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  inherited dbGrid: TDBGridEh
    Top = 197
    Width = 939
    Height = 104
    AllowedOperations = [alopUpdateEh]
    FooterRowCount = 1
    SumList.Active = True
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footer.FieldName = 'O_NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1095#1082#1080
        Title.TitleButton = True
        Width = 326
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NCOUNT'
        Footer.FieldName = 'NCOUNT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1059#1079#1083#1086#1074
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ECOUNTER'
        Footers = <>
        Title.Caption = #8470' '#1089#1095#1077#1090#1095#1080#1082#1072
        Title.TitleButton = True
        Width = 125
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ERECIPIENT'
        Footers = <>
        Title.Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' '#1086#1087#1083#1072#1090#1099
        Title.TitleButton = True
        Width = 177
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_NAME'
        Footers = <>
        Title.Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1072#1088#1080#1092#1072
        Title.TitleButton = True
        Width = 68
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 275
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DELETED'
        Footers = <>
        Title.Caption = #1057#1082#1088#1099#1090#1100
        Title.TitleButton = True
        Visible = False
        Width = 84
      end
      item
        CellButtons = <>
        DisplayFormat = '#0.####'
        DynProps = <>
        EditButtons = <>
        FieldName = 'PCE'
        Footer.DisplayFormat = '#0.####'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1082#1042#1090'/'#1095'|'#1059#1079#1083#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DisplayFormat = '#0.####'
        DynProps = <>
        EditButtons = <>
        FieldName = 'PCE_FACT'
        Footer.DisplayFormat = '#0.####'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1082#1042#1090'/'#1095'|'#1054#1073#1086#1088'-'#1103
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DATEFIELD'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1089#1074#1077#1088#1082#1080
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 939
    inherited ToolButton5: TToolButton
      Width = 8
    end
    inherited ToolButton6: TToolButton
      Left = 59
      Width = 8
      Visible = False
    end
    inherited btnDelete: TToolButton
      Left = 67
    end
    inherited ToolButton9: TToolButton
      Left = 90
      Visible = False
    end
    inherited tbOk: TToolButton
      Left = 105
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Left = 128
      Visible = False
    end
    inherited tbCancel: TToolButton
      Left = 132
      Visible = False
    end
    inherited ToolButton20: TToolButton
      Left = 155
    end
    inherited btnQuickFilter: TToolButton
      Left = 163
    end
    inherited sep444: TToolButton
      Left = 186
    end
    object btnSetCountersValue: TToolButton
      Left = 194
      Top = 0
      Action = actSetCountersValue
    end
    object btn1: TToolButton
      Left = 217
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 36
      Style = tbsSeparator
    end
    object btnPCEFixing: TToolButton
      Left = 225
      Top = 0
      Action = actPCEFixing
    end
  end
  inherited pnlEdit: TPanel
    Width = 939
    Height = 168
    ParentCtl3D = False
    object lbl2: TLabel [0]
      Left = 5
      Top = 9
      Width = 73
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object lbl3: TLabel [1]
      Left = 5
      Top = 83
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object lbl21: TLabel [2]
      Left = 5
      Top = 33
      Width = 61
      Height = 13
      Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
    end
    object lbl22: TLabel [3]
      Left = 5
      Top = 58
      Width = 63
      Height = 13
      Caption = #8470' '#1089#1095#1077#1090#1095#1080#1082#1072
    end
    object lbl1: TLabel [4]
      Left = 736
      Top = 58
      Width = 64
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072' '#1089#1074#1077#1088#1082#1080
    end
    object lbl211: TLabel [5]
      Left = 286
      Top = 58
      Width = 102
      Height = 13
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1090#1072#1088#1080#1092#1072
    end
    inherited btnSaveLink: TBitBtn
      Left = 82
      Top = 135
      Width = 744
      TabOrder = 6
    end
    inherited btnCancelLink: TBitBtn
      Left = 832
      Top = 135
      Width = 98
      Cancel = True
      TabOrder = 7
    end
    object edtName: TDBEditEh
      Left = 82
      Top = 6
      Width = 848
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dbmmoO_DESCRIPTION: TDBMemoEh
      Left = 82
      Top = 80
      Width = 848
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1086#1095#1082#1080
      ShowHint = True
      TabOrder = 5
      Visible = True
      WantReturns = True
    end
    object lcbEpoint: TDBLookupComboboxEh
      Left = 82
      Top = 30
      Width = 848
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'O_NUMERICFIELD'
      DataSource = srcDataSource
      DropDownBox.Columns = <
        item
          FieldName = 'O_NAME'
          Width = 80
        end
        item
          FieldName = 'O_DESCRIPTION'
          Width = 20
        end>
      DropDownBox.ListSource = srcERecipient
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' '#1086#1087#1083#1072#1090#1099' '#1101#1083#1077#1082#1090#1088#1086#1101#1085#1077#1088#1075#1080#1080
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcERecipient
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 1
      Visible = True
    end
    object edtO_NAME: TDBEditEh
      Left = 82
      Top = 55
      Width = 191
      Height = 21
      DataField = 'ECOUNTER'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #8470' '#1089#1095#1077#1090#1095#1080#1082#1072' ('#1077#1089#1083#1080' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085')'
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object edCDate: TDBDateTimeEditEh
      Left = 809
      Top = 55
      Width = 121
      Height = 21
      Hint = #1044#1072#1090#1072' '#1087#1086#1089#1083#1077#1076#1085#1077#1081' '#1089#1074#1077#1088#1082#1080' '#1089' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1077#1084' '#1086#1087#1083#1072#1090#1099
      Anchors = [akTop, akRight]
      DataField = 'O_DATEFIELD'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
    object lcbTarif: TDBLookupComboboxEh
      Left = 394
      Top = 55
      Width = 319
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'O_CHARFIELD'
      DataSource = srcDataSource
      DropDownBox.Columns = <
        item
          FieldName = 'O_NAME'
          Width = 80
        end
        item
          FieldName = 'O_DESCRIPTION'
          Width = 20
        end>
      DropDownBox.ListSource = srcTarif
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1058#1072#1088#1080#1092' ('#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080' - '#1093#1088#1086#1085'. '#1076#1072#1085#1085#1099#1077')'
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcTarif
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 3
      Visible = True
    end
  end
  object pgcInfo: TPageControl [5]
    Left = 0
    Top = 304
    Width = 939
    Height = 226
    ActivePage = tsCoverage
    Align = alBottom
    TabOrder = 3
    OnChange = pgcInfoChange
    object tsCoverage: TTabSheet
      Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103
      object pnlButtons: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 198
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          26
          198)
        object btnDel1: TSpeedButton
          Left = 0
          Top = 172
          Width = 22
          Height = 22
          Action = actHDel
          Anchors = [akLeft, akBottom]
          Flat = True
          Layout = blGlyphTop
        end
        object btnAdd1: TSpeedButton
          Left = 2
          Top = 3
          Width = 22
          Height = 22
          Action = actHAdd
          Flat = True
        end
        object btnEdit1: TSpeedButton
          Left = 2
          Top = 31
          Width = 22
          Height = 22
          Action = actHEdit
          Flat = True
        end
      end
      object dbgHistory: TDBGridEh
        Left = 26
        Top = 0
        Width = 905
        Height = 198
        Align = alClient
        DataSource = srcHistory
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        SearchPanel.Enabled = True
        SearchPanel.FilterOnTyping = True
        SumList.Active = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HDATE'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 79
          end
          item
            CellButtons = <>
            DisplayFormat = '#0.####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'NVALUE'
            Footer.DisplayFormat = '#0.####'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077', '#13#10#1082#1042#1090' '#1080#1083#1080' '#1082#1042#1090'/'#1095
            Title.TitleButton = True
            Width = 84
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DVALUE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1089#1074#1077#1088#1082#1080
            Title.TitleButton = True
            Width = 77
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 337
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsNodes: TTabSheet
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1099' '#1091#1079#1083#1099
      ImageIndex = 1
      object spl2: TSplitter
        Left = 743
        Top = 0
        Height = 198
        Align = alRight
      end
      object dbgUsed: TDBGridEh
        Left = 26
        Top = 0
        Width = 717
        Height = 198
        Align = alClient
        DataSource = srcNodes
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        SearchPanel.Enabled = True
        STFilter.Local = True
        STFilter.Visible = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnGetCellParams = dbgUsedGetCellParams
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1079#1083#1072
            Title.TitleButton = True
            Width = 164
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'O_NAME'
            Footers = <>
            Title.Caption = #1058#1080#1087' '#1091#1079#1083#1072
            Title.TitleButton = True
            Width = 88
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EP_TAG'
            Footers = <>
            Title.Caption = #1044#1086#1087'. '#1059#1069
            Title.TitleButton = True
            Width = 30
          end
          item
            CellButtons = <>
            DisplayFormat = '#0.###'
            DynProps = <>
            EditButtons = <>
            FieldName = 'PCE'
            Footer.DisplayFormat = '#0.###'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1042#1090'|'#1059#1079#1083#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DisplayFormat = '#0.###'
            DynProps = <>
            EditButtons = <>
            FieldName = 'PCE_FACT'
            Footer.DisplayFormat = '#0.###'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1042#1090'|'#1054#1073#1086#1088'-'#1103
            Title.Hint = #1057#1091#1084#1084#1072#1088#1085#1072#1103' '#1084#1086#1097#1085#1086#1089#1090#1100' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1086#1075#1086' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DisplayFormat = '#0.###'
            DynProps = <>
            EditButtons = <>
            FieldName = 'PCE_DIF'
            Footer.DisplayFormat = '#0.###'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1042#1090'|'#1056#1072#1079#1085#1080#1094#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STREET_SHORT'
            Footers = <>
            Title.Caption = #1089#1086#1082#1088
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STREET_NAME'
            Footers = <>
            Title.Caption = #1059#1083#1080#1094#1072
            Title.TitleButton = True
            Width = 167
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOUSE_NO'
            Footers = <>
            Title.Caption = #1044#1086#1084
            Title.TitleButton = True
            Width = 55
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'PORCH_N'
            Footers = <>
            Title.Caption = #1055'-'#1076
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLOOR_N'
            Footers = <>
            Title.Caption = #1069#1090#1072#1078
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
            Width = 267
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 198
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          26
          198)
        object SpeedButton1: TSpeedButton
          Left = 2
          Top = 216
          Width = 22
          Height = 22
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
        object btnEditNodePCE: TSpeedButton
          Left = 2
          Top = 3
          Width = 22
          Height = 22
          Action = actEditNodePCE
          Flat = True
        end
      end
      object pnlNodePCE: TPanel
        Left = 746
        Top = 0
        Width = 185
        Height = 198
        Align = alRight
        BevelOuter = bvNone
        Caption = 'pnlNodePCE'
        TabOrder = 2
        object lbl4: TLabel
          Left = 0
          Top = 0
          Width = 124
          Height = 13
          Align = alTop
          Caption = #1048#1089#1090#1086#1088#1080#1103' '#1087#1086#1082#1072#1079#1072#1085#1080#1081' '#1091#1079#1083#1072
        end
        object dbgNPce: TDBGridEh
          Left = 0
          Top = 13
          Width = 185
          Height = 185
          Align = alClient
          DataSource = srcNodePce
          DynProps = <>
          Flat = True
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          TabOrder = 0
          Columns = <
            item
              CellButtons = <>
              DisplayFormat = 'mmm yy'
              DynProps = <>
              EditButtons = <>
              FieldName = 'HDATE'
              Footers = <>
              Title.Caption = #1052#1077#1089#1103#1094
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NVALUE'
              Footers = <>
              Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077', '#1042#1090
              Title.TitleButton = True
              Width = 85
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsElectroPoint
    OnDataChange = srcDataSourceDataChange
    Left = 144
    Top = 280
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 230
    Top = 112
    inherited actNew: TAction
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    object actHAdd: TAction
      ImageIndex = 2
      OnExecute = actHAddExecute
    end
    object actHEdit: TAction
      ImageIndex = 4
      OnExecute = actHEditExecute
    end
    object actHDel: TAction
      ImageIndex = 3
      OnExecute = actHDelExecute
    end
    object actSetCountersValue: TAction
      Caption = #1042#1085#1077#1089#1090#1080' '#1087#1086#1082#1072#1079#1072#1085#1080#1103' '#1089#1095#1077#1090#1095#1080#1082#1086#1074
      Hint = #1042#1085#1077#1089#1090#1080' '#1087#1086#1082#1072#1079#1072#1085#1080#1103' '#1089#1095#1077#1090#1095#1080#1082#1086#1074
      ImageIndex = 35
      OnExecute = actSetCountersValueExecute
    end
    object actEditNodePCE: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1090#1088#1077#1073#1083#1077#1085#1080#1077' '#1091#1079#1083#1072
      ImageIndex = 61
      OnExecute = actEditNodePCEExecute
    end
    object actPCEFixing: TAction
      Caption = #1047#1072#1092#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1082#1072#1079#1072#1085#1080#1103' '#1058#1059' '#1073#1077#1079' '#1089#1095#1077#1090#1095#1080#1082#1086#1074
      Hint = #1047#1072#1092#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1082#1072#1079#1072#1085#1080#1103' '#1058#1059' '#1073#1077#1079' '#1089#1095#1077#1090#1095#1080#1082#1086#1074
      ImageIndex = 101
      OnExecute = actPCEFixingExecute
    end
    object actPCEFixingNode: TAction
      Hint = #1047#1072#1092#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1082#1072#1079#1072#1085#1080#1103' '#1058#1059
      ImageIndex = 101
    end
    object actLockPeriod: TAction
      Caption = #1047#1072#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1084#1077#1089#1103#1094
      ImageIndex = 106
      OnExecute = actLockPeriodExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 395
    Top = 407
  end
  inherited CnErrors: TCnErrorProvider
    Left = 304
    Top = 408
  end
  object dsElectroPoint: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Objects_Iud(1, 76, :O_ID, :O_Name, :O_Descript' +
        'ion, :ECOUNTER, 0, :O_CHARFIELD, :O_Numericfield, :O_DATEFIELD)')
    DeleteSQL.Strings = (
      
        'execute procedure Objects_Iud(2, 76, :O_ID, :O_Name, :O_Descript' +
        'ion, :ECOUNTER, 1, null, :O_Numericfield)')
    InsertSQL.Strings = (
      
        'execute procedure Objects_Iud(0, 76, :O_ID, :O_Name, :O_Descript' +
        'ion, :ECOUNTER, 0, :O_CHARFIELD, :O_Numericfield, :O_DATEFIELD)')
    RefreshSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , o.O_TYPE'
      '  , o.O_NAME'
      '  , o.O_DESCRIPTION'
      '  , o.O_DATEFIELD'
      '  , o.O_CHARFIELD   '
      '  , et.O_NAME|| coalesce('#39' / '#39' ||(select'
      '                                    avg(oh.Nvalue)'
      '                                  from Objects_History oh'
      '                                  where oh.O_Type = 78'
      '                                        and oh.O_Id = et.O_Id'
      
        '                                        and oh.Hdate between Mon' +
        'th_First_Day(current_date) and Month_Last_Day(current_date)), '#39#39 +
        ')   '
      '    T_NAME'
      
        '  , cast(coalesce(o.O_NUMERICFIELD, 0) as integer) O_NUMERICFIEL' +
        'D'
      '  , er.O_Name ERecipient'
      '  , iif(o.O_Dimension <> '#39#39', o.O_Dimension, null) ECOUNTER'
      '  , (select'
      '         count(*)'
      '       from NODES n'
      '       where n.Epoint = o.O_ID) NCOUNT'
      '  , cast((select'
      '         sum(n.Pce)'
      '       from NODES n'
      '       where n.Epoint = o.O_ID) as D_N15_4) /1000 PCE'
      ''
      '  , cast((select'
      '         sum(coalesce(e.Pce, eg.O_Numericfield, 0))'
      '       from NODES n'
      '            inner join Equipment e on (e.Node_Id = n.Node_Id)'
      
        '            left outer join objects eg on (e.Eq_Group = eg.O_Id ' +
        'and eg.O_Type = 7)'
      '       where n.Epoint = o.O_ID) as D_N15_4)/1000 PCE_FACT'
      '  from OBJECTS o'
      
        '       left outer join OBJECTS er on (er.O_Id = o.O_Numericfield' +
        ' and er.O_Type = 77)'
      
        '       left outer join OBJECTS et on (et.O_Id = o.O_CHARFIELD an' +
        'd et.O_Type = 78)'
      '  where o.O_TYPE = 76'
      '        and o.o_DELETED = 0'
      '        and o.O_ID = :OLD_O_ID')
    SelectSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , o.O_TYPE'
      '  , o.O_NAME'
      '  , o.O_DESCRIPTION'
      '  , o.O_DATEFIELD'
      '  , o.O_CHARFIELD   '
      '  , et.O_NAME || coalesce('#39' / '#39' ||(select'
      '                                    avg(oh.Nvalue)'
      '                                  from Objects_History oh'
      '                                  where oh.O_Type = 78'
      '                                        and oh.O_Id = et.O_Id'
      
        '                                        and oh.Hdate between Mon' +
        'th_First_Day(current_date) and Month_Last_Day(current_date)), '#39#39 +
        ')   '
      '    T_NAME'
      
        '  , cast(coalesce(o.O_NUMERICFIELD, 0) as integer) O_NUMERICFIEL' +
        'D'
      '  , er.O_Name ERecipient'
      '  , iif(o.O_Dimension <> '#39#39', o.O_Dimension, null) ECOUNTER'
      '  , (select'
      '         count(*)'
      '       from NODES n'
      '       where n.Epoint = o.O_ID) NCOUNT'
      '  , cast((select'
      '         sum(n.Pce)'
      '       from NODES n'
      '       where n.Epoint = o.O_ID) as D_N15_4) /1000 PCE'
      ''
      '  , cast((select'
      '         sum(coalesce(e.Pce, eg.O_Numericfield, 0))'
      '       from NODES n'
      '            inner join Equipment e on (e.Node_Id = n.Node_Id)'
      
        '            left outer join objects eg on (e.Eq_Group = eg.O_Id ' +
        'and eg.O_Type = 7)'
      '       where n.Epoint = o.O_ID) as D_N15_4)/1000 PCE_FACT'
      '  from OBJECTS o'
      
        '       left outer join OBJECTS er on (er.O_Id = o.O_Numericfield' +
        ' and er.O_Type = 77)'
      
        '       left outer join OBJECTS et on (et.O_Id = o.O_CHARFIELD an' +
        'd et.O_Type = 78)'
      '  where o.O_TYPE = 76'
      '        and o.o_DELETED = 0'
      '  order by o.O_NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 144
    Top = 136
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 200
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
    Left = 312
    Top = 188
  end
  object dsERecipient: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    o.O_Id'
      '    , o.O_Name'
      '    , o.O_DESCRIPTION'
      '  from objects o'
      '  where o.O_Type = 77'
      '        and coalesce(o.O_Deleted,0) <> 1'
      '  order by o.O_Name  ')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 497
    Top = 320
    oFetchAll = True
  end
  object srcERecipient: TDataSource
    DataSet = dsERecipient
    Left = 518
    Top = 384
  end
  object srcHistory: TDataSource
    DataSet = dsHistory
    Left = 265
    Top = 302
  end
  object dsHistory: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OBJECTS_HISTORY'
      'SET '
      '    NVALUE = :NVALUE,'
      '    DVALUE = :DVALUE,'
      '    NOTICE = :NOTICE,'
      '    HDATE = :HDATE'
      'WHERE'
      '    HID = :OLD_HID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    OBJECTS_HISTORY'
      'WHERE'
      '    O_ID = :OLD_O_ID'
      '    and O_TYPE = :OLD_O_TYPE'
      '    and HDATE = :OLD_HDATE  '
      '        ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS_HISTORY('
      '    O_ID,'
      '    O_TYPE,'
      '    HDATE,'
      '    NVALUE,'
      '    NOTICE,'
      '    DELETED'
      ')'
      'VALUES('
      '    :O_ID,'
      '    :O_TYPE,'
      '    :HDATE,'
      '    :NVALUE,'
      '    :NOTICE,'
      '    0'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    *'
      '  from Objects_History oh'
      '  where '
      '    O_ID = :OLD_O_ID'
      '    and O_TYPE = :OLD_O_TYPE'
      '    and HDATE = :OLD_HDATE  '
      '    and oh.Deleted = 0'
      '  ')
    SelectSQL.Strings = (
      'select'
      '    *'
      '  from Objects_History oh'
      '  where oh.O_Id = :O_ID'
      '        and oh.O_Type = :O_Type'
      '        and oh.Deleted = 0'
      '  order by oh.Hdate desc  ')
    OnNewRecord = dsHistoryNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 213
    Top = 299
    WaitEndMasterScroll = True
    oFetchAll = True
  end
  object srcNodes: TDataSource
    AutoEdit = False
    DataSet = dsNodes
    Left = 457
    Top = 302
  end
  object dsNodes: TpFIBDataSet
    UpdateSQL.Strings = (
      'update Nodes'
      'set Pce = :Pce'
      'where (Node_Id = :Node_Id)')
    RefreshSQL.Strings = (
      'select'
      '    nl.*'
      '  , (coalesce(NL.Pce, 0) - coalesce(NL.PCE_FACT, 0)) PCE_DIF'
      '  from (select'
      '            n.Node_Id'
      '          , n.House_Id'
      '          , n.Porch_N'
      '          , n.Floor_N'
      '          , n.Place'
      '          , n.Pce'
      '          , n.name'
      '          , n.Ep_Tag          '
      '          , n.NOTICE'
      '          , o.O_Name'
      '          , o.O_DIMENSION as COLOR'
      '          , s.street_short'
      '          , S.Street_Name'
      '          , H.House_No'
      '          , h.Street_ID'
      '          , (select'
      '                 sum(coalesce(e.Pce, eg.O_Numericfield, 0))'
      '               from Equipment e'
      
        '                    left outer join objects eg on (e.Eq_Group = ' +
        'eg.O_Id and eg.O_Type = 7)'
      '               where e.Node_Id = n.Node_Id) PCE_FACT'
      '          from NODES n'
      '               inner join HOUSE H on (n.HOUSE_ID = H.HOUSE_ID)'
      
        '               inner join STREET S on (H.STREET_ID = S.STREET_ID' +
        ')'
      
        '               inner join objects o on (o.O_Id = n.Type_Id and o' +
        '.O_Type = 38)'
      '          where n.Epoint = :O_ID) nl'
      'where Node_Id = :OLD_Node_Id          '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    nl.*'
      '  , (coalesce(NL.Pce, 0) - coalesce(NL.PCE_FACT, 0)) PCE_DIF'
      '  from (select'
      '            n.Node_Id'
      '          , n.House_Id'
      '          , n.Porch_N'
      '          , n.Floor_N'
      '          , n.Place'
      '          , n.Pce'
      '          , n.name'
      '          , n.Ep_Tag'
      '          , n.NOTICE'
      '          , o.O_Name'
      '          , o.O_DIMENSION as COLOR'
      '          , s.street_short'
      '          , S.Street_Name'
      '          , H.House_No'
      '          , h.Street_ID'
      '          , (select'
      '                 sum(coalesce(e.Pce, eg.O_Numericfield, 0))'
      '               from Equipment e'
      
        '                    left outer join objects eg on (e.Eq_Group = ' +
        'eg.O_Id and eg.O_Type = 7)'
      '               where e.Node_Id = n.Node_Id) PCE_FACT'
      '          from NODES n'
      '               inner join HOUSE H on (n.HOUSE_ID = H.HOUSE_ID)'
      
        '               inner join STREET S on (H.STREET_ID = S.STREET_ID' +
        ')'
      
        '               inner join objects o on (o.O_Id = n.Type_Id and o' +
        '.O_Type = 38)'
      '          where n.Epoint = :O_ID) nl'
      '  order by street_short, Street_Name, House_No, Place')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 405
    Top = 299
    WaitEndMasterScroll = True
    oFetchAll = True
  end
  object mmMenu: TMainMenu
    Left = 288
    Top = 145
    object N18: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082' '#1058#1059#1069
      GroupIndex = 5
      object N20: TMenuItem
        Action = actQuickFilter
      end
      object N33: TMenuItem
        Caption = #1055#1086#1080#1089#1082
        ImageIndex = 7
      end
      object miN2: TMenuItem
        Caption = '-'
      end
      object miLinkNodes: TMenuItem
        Action = actNew
      end
      object miEdit: TMenuItem
        Action = actEdit
      end
      object N48: TMenuItem
        Caption = '-'
      end
      object miDelete: TMenuItem
        Action = actDelete
      end
      object miN1: TMenuItem
        Caption = '-'
      end
      object miExport: TMenuItem
        Caption = #1069#1082#1089#1087#1086#1088#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
      end
      object miPrintGrid1: TMenuItem
        Action = actPrintGrid
      end
      object miN3: TMenuItem
        Caption = '-'
      end
      object miSetCountersValue: TMenuItem
        Action = actSetCountersValue
      end
      object miPCEFixing: TMenuItem
        Action = actPCEFixing
      end
      object miLockPeriod: TMenuItem
        Action = actLockPeriod
      end
    end
  end
  object PropStorage: TPropStorageEh
    Section = 'EPF'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'pgcInfo.<P>.ActivePage'
      'pgcInfo.<P>.Height'
      'pgcInfo.tsNodes.pnlNodePCE.<P>.Width')
    Left = 97
    Top = 417
  end
  object dsNodePce: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'update or insert into Objects_History (O_Id, O_Type, Hdate, Nval' +
        'ue)'
      'values (:NODE_ID, 38, :Hdate, :Nvalue)'
      'matching (O_Id, O_Type, Hdate);')
    InsertSQL.Strings = (
      
        'update or insert into Objects_History (O_Id, O_Type, Hdate, Nval' +
        'ue)'
      'values (:NODE_ID, 38, :Hdate, :Nvalue)'
      'matching (O_Id, O_Type, Hdate);')
    RefreshSQL.Strings = (
      'select'
      '  qh.O_Id  NODE_ID'
      '  , qh.Hdate'
      '  , qh.Nvalue'
      '  from Objects_History qh'
      '  where qh.O_Type = 38'
      '        and qh.O_Id = :OLD_Node_Id'
      '        and qh.Hdate = :OLD_Hdate')
    SelectSQL.Strings = (
      'select'
      '  qh.O_Id  NODE_ID'
      '  , qh.Hdate'
      '  , qh.Nvalue'
      '  from Objects_History qh'
      '  where qh.O_Type = 38'
      '        and qh.O_Id = :Node_Id'
      '  order by qh.Hdate desc  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcNodes
    Left = 797
    Top = 411
    WaitEndMasterScroll = True
    oFetchAll = True
  end
  object srcNodePce: TDataSource
    AutoEdit = False
    DataSet = dsNodePce
    Left = 849
    Top = 414
  end
  object dsTarif: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    o.O_Id'
      '  , o.O_Name || coalesce('#39' / '#39' ||(select'
      '                                    avg(oh.Nvalue)'
      '                                  from Objects_History oh'
      '                                  where oh.O_Type = 78'
      '                                        and oh.O_Id = o.O_Id'
      
        '                                        and oh.Hdate between Mon' +
        'th_First_Day(current_date) and Month_Last_Day(current_date)), '#39#39 +
        ') O_Name'
      '  , o.O_DESCRIPTION'
      '  from objects o'
      '  where o.O_Type = 78'
      '        and coalesce(o.O_Deleted, 0) <> 1'
      '  order by o.O_Name')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 633
    Top = 424
    oFetchAll = True
  end
  object srcTarif: TDataSource
    AutoEdit = False
    DataSet = dsTarif
    Left = 630
    Top = 376
  end
end
