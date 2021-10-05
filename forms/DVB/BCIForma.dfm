object BCIForm: TBCIForm
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1073#1083#1077#1084#1072' '#1074#1077#1097#1072#1085#1080#1103
  ClientHeight = 541
  ClientWidth = 884
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 500
    Width = 884
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      884
      41)
    object btnCancel: TBitBtn
      Left = 737
      Top = 6
      Width = 139
      Height = 27
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOk: TBitBtn
      Left = 96
      Top = 6
      Width = 635
      Height = 27
      Action = actSave
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 500
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object spl2: TSplitter
      Left = 0
      Top = 205
      Width = 884
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object pnlIssue: TPanel
      Left = 0
      Top = 0
      Width = 884
      Height = 99
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        884
        99)
      object lblAttribute: TLabel
        Left = 7
        Top = 11
        Width = 71
        Height = 13
        Caption = #1058#1080#1087' '#1087#1088#1086#1073#1083#1077#1084#1099
      end
      object lcbBI_TYPE: TDBLookupComboboxEh
        Left = 96
        Top = 8
        Width = 492
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'BI_TYPE'
        DataSource = srcIssue
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1090#1080#1087' '#1087#1088#1086#1073#1083#1077#1084#1099' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086')'
        EditButtons = <>
        KeyField = 'O_ID'
        ListField = 'O_NAME'
        ListSource = srcIType
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
      object chkATV: TDBCheckBoxEh
        Left = 611
        Top = 10
        Width = 50
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Caption = #1040#1085#1072#1083#1086#1075
        DataField = 'ATV'
        DataSource = srcIssue
        DynProps = <>
        TabOrder = 1
        OnClick = chkATVClick
      end
      object chkDTV: TDBCheckBoxEh
        Left = 683
        Top = 10
        Width = 50
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Caption = #1062#1080#1092#1088#1072
        DataField = 'DTV'
        DataSource = srcIssue
        DynProps = <>
        TabOrder = 2
        OnClick = chkATVClick
      end
      object chkIPTV: TDBCheckBoxEh
        Left = 754
        Top = 10
        Width = 50
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Caption = 'IPTV'
        DataField = 'IPTV'
        DataSource = srcIssue
        DynProps = <>
        TabOrder = 3
        OnClick = chkATVClick
      end
      object chkOTT: TDBCheckBoxEh
        Left = 826
        Top = 10
        Width = 50
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Caption = 'OTT'
        DataField = 'OTT'
        DataSource = srcIssue
        DynProps = <>
        TabOrder = 4
        OnClick = chkATVClick
      end
      object mmoNotice: TDBMemoEh
        Left = 7
        Top = 37
        Width = 869
        Height = 57
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        DataField = 'ISSUE'
        DataSource = srcIssue
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1088#1086#1073#1083#1077#1084#1099
        TabOrder = 5
        Visible = True
        WantReturns = True
      end
    end
    object pnlResult: TPanel
      Left = 0
      Top = 99
      Width = 884
      Height = 106
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        884
        106)
      object Label1: TLabel
        Left = 7
        Top = 5
        Width = 44
        Height = 13
        Caption = #1056#1077#1096#1077#1085#1080#1077
      end
      object chkALTER_CONFIG: TDBCheckBoxEh
        Left = 659
        Top = 4
        Width = 217
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Caption = #1042#1085#1086#1089#1080#1083#1080#1089#1100' '#1080#1089#1087#1088#1072#1074#1083#1077#1085#1080#1103' '#1074' '#1043#1057'/'#1089#1080#1089#1090#1077#1084#1099
        DataField = 'ALTER_CONFIG'
        DataSource = srcIssue
        DynProps = <>
        TabOrder = 1
      end
      object mmoRESULT_TEXT: TDBMemoEh
        Left = 7
        Top = 30
        Width = 869
        Height = 72
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        DataField = 'RESULT_TEXT'
        DataSource = srcIssue
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1056#1077#1096#1077#1085#1080#1077' '#1087#1088#1086#1073#1083#1077#1084#1099
        TabOrder = 2
        Visible = True
        WantReturns = True
      end
      object lcbRESULT_CODE: TDBLookupComboboxEh
        Left = 96
        Top = 2
        Width = 492
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'SOLUTION'
        DataSource = srcIssue
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1090#1080#1087' '#1087#1088#1086#1073#1083#1077#1084#1099' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086')'
        EditButtons = <>
        KeyField = 'O_ID'
        ListField = 'O_NAME'
        ListSource = srcSolution
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
    end
    object pnlChls: TPanel
      Left = 0
      Top = 208
      Width = 884
      Height = 292
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object spl1: TSplitter
        Left = 433
        Top = 0
        Height = 292
        Align = alRight
      end
      object pnlChnlAll: TPanel
        Left = 436
        Top = 0
        Width = 448
        Height = 292
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object lbl1: TLabel
          Left = 0
          Top = 0
          Width = 448
          Height = 13
          Align = alTop
          Caption = '           '#1042#1089#1077' '#1082#1072#1085#1072#1083#1099' '#1089#1077#1090#1080
        end
        object pnlBtns: TPanel
          Left = 0
          Top = 13
          Width = 33
          Height = 279
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object btnAdd: TSpeedButton
            Left = 0
            Top = 0
            Width = 33
            Height = 81
            Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1085#1072#1083' '#1074' '#1087#1088#1086#1073#1083#1077#1084#1091
            Align = alTop
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3
              783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              B1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EB3783EB3783EB3
              783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FB1773EB3783E
              B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
              3EB3783EB3783EB3783EFF00FFB1773EB3783EB3783EB3783EB3783EB3783EB3
              783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FFF00FFFF00FF
              B1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3
              783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = btnAddClick
          end
          object btnDel: TSpeedButton
            Left = 0
            Top = 200
            Width = 33
            Height = 79
            Hint = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1085#1072#1083' '#1080#1079' '#1087#1088#1086#1073#1083#1077#1084#1091
            Align = alBottom
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3049CC30
              49CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF3049CC3049CC3049CC3049CCFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FF3049CC3049CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3049CC3049CC3049CC3049
              CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FF3049CC3049CC3049CC3049CCFF00FFFF00FF3049CC3049CC
              3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049
              CC3049CC3049CCFF00FF3049CC3049CC3049CC3049CC3049CC3049CC3049CC30
              49CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC
              3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049
              CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FF3049CC3049CC3049CC3049CCFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3049CC3049CC3049CC3049
              CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FF3049CC3049CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FF3049CC3049CC3049CC3049CCFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3049CC30
              49CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            OnClick = btnDelClick
          end
        end
        object dbgChannels: TDBGridEh
          Left = 33
          Top = 13
          Width = 415
          Height = 279
          Align = alClient
          AllowedOperations = []
          IncludeImageModules = [iimJpegImageModuleEh, iimGIFImageModuleEh, iimPNGImageModuleEh]
          DataSource = srcChnlsAll
          DrawGraphicData = True
          DynProps = <>
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterRowCount = 1
          FooterParams.Color = clWindow
          FrozenCols = 2
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
          SearchPanel.Enabled = True
          SearchPanel.FilterOnTyping = True
          SortLocal = True
          STFilter.Local = True
          STFilter.Visible = True
          SumList.Active = True
          TabOrder = 1
          TitleParams.MultiTitle = True
          OnDblClick = dbgChannelsDblClick
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_ID'
              Footers = <>
              Title.TitleButton = True
              Visible = False
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_NAME'
              Footer.ValueType = fvtCount
              Footers = <>
              Title.Caption = #1050#1072#1085#1072#1083
              Title.TitleButton = True
              Width = 100
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DEFINITION'
              Footers = <>
              Title.Caption = #1063#1077#1090#1082'-'#1090#1100
              Title.Hint = #1063#1077#1090#1082'-'#1090#1100
              Title.TitleButton = True
              Title.Orientation = tohVertical
              Width = 33
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_NUMBER'
              Footer.FieldName = 'IS_ANALOG'
              Footers = <>
              Title.Caption = #1040#1085#1072#1083#1086#1075'|'#1053#1086#1084#1077#1088
              Title.TitleButton = True
              Width = 47
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_FREQ'
              Footers = <>
              Title.Caption = #1040#1085#1072#1083#1086#1075'|'#1063#1072#1089#1090#1086#1090#1072
              Title.TitleButton = True
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_CODED'
              Footer.Alignment = taRightJustify
              Footer.FieldName = 'IS_CODED'
              Footers = <>
              Title.Caption = #1050#1086#1076#1080'- '#1088#1086#1074#1072#1085
              Title.TitleButton = True
              Width = 36
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_TRUNK'
              Footer.FieldName = 'IS_DIGIT'
              Footers = <>
              Title.Caption = 'STV|'#1057#1090#1074#1086#1083
              Title.TitleButton = True
              Width = 42
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_TRUNK_NUMBER'
              Footers = <>
              Title.Caption = 'STV|'#1053#1086#1084#1077#1088
              Title.TitleButton = True
              Width = 46
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'ACCESS_ID'
              Footers = <>
              Title.TitleButton = True
              Visible = False
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_PAID_TO'
              Footers = <>
              Title.Caption = #1054#1087#1083#1072#1095#1077#1085' '#1076#1086
              Title.TitleButton = True
              Width = 61
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 126
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'SRC_NAME'
              Footers = <>
              Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082
              Title.TitleButton = True
              Width = 63
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CARD_NAME'
              Footers = <>
              Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1082#1072#1088#1090#1086#1095#1082#1072
              Title.TitleButton = True
              Width = 98
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'LCN'
              Footers = <>
              Title.Caption = 'DVB|LCN'
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'SID'
              Footer.FieldName = 'ON_DVB'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'DVB|SID'
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'TSID'
              Footers = <>
              Title.Caption = 'DVB|TSID'
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NID'
              Footers = <>
              Title.Caption = 'DVB|NID'
              Title.TitleButton = True
              Width = 98
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object pnlChnlsSelected: TPanel
        Left = 0
        Top = 0
        Width = 433
        Height = 292
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object lbl2: TLabel
          Left = 0
          Top = 0
          Width = 433
          Height = 13
          Align = alTop
          Caption = ' '#1050#1072#1085#1072#1083#1099' '#1089' '#1087#1088#1086#1073#1083#1077#1084#1086#1081
        end
        object dbgChlsSelected: TDBGridEh
          Left = 0
          Top = 13
          Width = 433
          Height = 279
          Align = alClient
          AllowedOperations = []
          IncludeImageModules = [iimJpegImageModuleEh, iimGIFImageModuleEh, iimPNGImageModuleEh]
          DataSource = srcChnlsSel
          DrawGraphicData = True
          DynProps = <>
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterRowCount = 1
          FooterParams.Color = clWindow
          FrozenCols = 2
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
          SearchPanel.Enabled = True
          SearchPanel.FilterOnTyping = True
          SortLocal = True
          STFilter.Local = True
          STFilter.Visible = True
          SumList.Active = True
          TabOrder = 0
          TitleParams.MultiTitle = True
          OnDblClick = dbgChlsSelectedDblClick
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_ID'
              Footers = <>
              Title.TitleButton = True
              Visible = False
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_NAME'
              Footer.ValueType = fvtCount
              Footers = <>
              Title.Caption = #1050#1072#1085#1072#1083
              Title.TitleButton = True
              Width = 100
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DEFINITION'
              Footers = <>
              Title.Caption = #1063#1077#1090#1082'-'#1090#1100
              Title.Hint = #1063#1077#1090#1082'-'#1090#1100
              Title.TitleButton = True
              Title.Orientation = tohVertical
              Width = 33
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_NUMBER'
              Footer.FieldName = 'IS_ANALOG'
              Footers = <>
              Title.Caption = #1040#1085#1072#1083#1086#1075'|'#1053#1086#1084#1077#1088
              Title.TitleButton = True
              Width = 47
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_FREQ'
              Footers = <>
              Title.Caption = #1040#1085#1072#1083#1086#1075'|'#1063#1072#1089#1090#1086#1090#1072
              Title.TitleButton = True
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_CODED'
              Footer.Alignment = taRightJustify
              Footer.FieldName = 'IS_CODED'
              Footers = <>
              Title.Caption = #1050#1086#1076#1080'- '#1088#1086#1074#1072#1085
              Title.TitleButton = True
              Width = 36
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_TRUNK'
              Footer.FieldName = 'IS_DIGIT'
              Footers = <>
              Title.Caption = 'STV|'#1057#1090#1074#1086#1083
              Title.TitleButton = True
              Width = 42
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_TRUNK_NUMBER'
              Footers = <>
              Title.Caption = 'STV|'#1053#1086#1084#1077#1088
              Title.TitleButton = True
              Width = 46
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_PAID_TO'
              Footers = <>
              Title.Caption = #1054#1087#1083#1072#1095#1077#1085' '#1076#1086
              Title.TitleButton = True
              Width = 61
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'ACCESS_ID'
              Footers = <>
              Title.TitleButton = True
              Visible = False
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 126
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'SRC_NAME'
              Footers = <>
              Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082
              Title.TitleButton = True
              Width = 63
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CARD_NAME'
              Footers = <>
              Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1082#1072#1088#1090#1086#1095#1082#1072
              Title.TitleButton = True
              Width = 98
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'LCN'
              Footers = <>
              Title.Caption = 'DVB|LCN'
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'SID'
              Footer.FieldName = 'ON_DVB'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = 'DVB|SID'
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'TSID'
              Footers = <>
              Title.Caption = 'DVB|TSID'
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NID'
              Footers = <>
              Title.Caption = 'DVB|NID'
              Title.TitleButton = True
              Width = 98
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object PropStorageEh: TPropStorageEh
    Section = 'BCIssue'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'pnl2.pnlChls.<P>.Height'
      'pnl2.pnlChls.pnlChnlAll.<P>.Width')
    Left = 454
    Top = 48
  end
  object cnError: TCnErrorProvider
    DoubleBuffer = False
    Left = 372
    Top = 47
  end
  object ActionList1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 302
    Top = 47
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 16397
      OnExecute = actSaveExecute
    end
  end
  object dsChannels: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    C.Ch_Id'
      '    -- , iif(i.Ch_Id is null, 0, 1) inIssue'
      '  , i.BI_ID'
      '  , c.Ch_Number'
      '  , c.Ch_Name'
      '  , c.Ch_Notice'
      '  , c.Ch_Freq'
      '  , c.Ch_Coded'
      '  , c.Ch_Trunk'
      '  , c.Ch_Trunk_Number'
      '  , CS.NAME SRC_NAME'
      '  , AC.O_NAME CARD_NAME'
      '  , coalesce(C.CH_CODED, 0) IS_CODED'
      '  , iif(C.CH_NUMBER is null, 0, 1) IS_ANALOG'
      '  , iif(not C.CH_TRUNK is null, 1, iif(exists(select'
      '                                                  Dvbs_Id'
      
        '                                                from Dvb_Stream_' +
        'Channels dsc'
      
        '                                                where not dsc.Si' +
        'd is null'
      
        '                                                      and dsc.CH' +
        '_ID = c.ch_id), 1, 0)) IS_DIGIT'
      '  , iif(exists(select'
      '                   IG_ID'
      '                 from Iptv_Group_Channels gc'
      '                 where gc.CH_ID = c.ch_id), 1, 0) IS_IPTV'
      '  , DC.LCN'
      '  , DC.SID'
      '  , coalesce(DC.TSID, DS.TSID) TSID'
      '  , DN.NID'
      '  , iif(DC.SID is null, 0, 1) ON_DVB'
      '  , DS.DVBS_ID'
      '  , CS.CS_ID'
      '  from CHANNELS C'
      
        '       left outer join Bci_Channels i on (c.Ch_Id = i.Ch_Id and ' +
        'i.Bi_Id = :Bi_Id)'
      
        '       left outer join DVB_STREAM_CHANNELS DC on (DC.CH_ID = C.C' +
        'H_ID)'
      
        '       left outer join DVB_STREAMS DS on (DS.DVBS_ID = DC.DVBS_I' +
        'D)'
      
        '       left outer join DVB_NETWORK DN on (DN.DVBN_ID = DS.DVBN_I' +
        'D)'
      
        '       left outer join(select -- '#1087#1086#1087#1099#1090#1082#1072' '#1074#1099#1073#1088#1072#1090#1100' '#1074' '#1090#1072#1082#1086#1084' '#1087#1086#1088#1103#1076#1082#1077 +
        ' '#1080#1089#1090#1086#1095#1085#1080#1082#1080'. '#1076#1083#1103' '#1085#1072#1083#1086#1075#1072'. '#1076#1083#1103' '#1094#1080#1092#1088#1099'. '#1087#1088#1086#1095#1080#1077
      '                           IC.CH_ID'
      '                         , coalesce((select first 1'
      '                                         S.CS_ID'
      '                                       from CHANNEL_SRC_PARAM S'
      '                                       where S.CH_ID = IC.CH_ID'
      
        '                                             and S.ON_ANALOG = 1' +
        '),'
      '                           (select first 1'
      '                                S.CS_ID'
      '                              from CHANNEL_SRC_PARAM S'
      '                              where S.CH_ID = IC.CH_ID'
      '                                    and S.ON_DVB = 1),'
      '                           (select first 1'
      '                                S.CS_ID'
      '                              from CHANNEL_SRC_PARAM S'
      '                              where S.CH_ID = IC.CH_ID)) CS_ID'
      
        '                         from CHANNELS IC) OC on (OC.CH_ID = C.C' +
        'H_ID)'
      '       left outer join CHANNEL_SRC CS on (CS.CS_ID = OC.CS_ID)'
      
        '       left outer join CHANNEL_SRC_PARAM CSP on (CSP.CS_ID = OC.' +
        'CS_ID and CSP.CH_ID = OC.CH_ID)'
      
        '       left outer join OBJECTS AC on (AC.O_ID = CSP.CARD_ID and ' +
        'AC.O_TYPE = 44)'
      'where @@issue_only%1=1@             '
      'order by C.CH_NAME')
    BeforePost = dsChannelsBeforePost
    Transaction = trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 200
    Top = 336
    oFetchAll = True
  end
  object srcChnlsAll: TDataSource
    DataSet = mtChnlsAll
    Left = 808
    Top = 400
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 268
    Top = 389
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
    Left = 195
    Top = 396
  end
  object trIW: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 524
    Top = 333
  end
  object trIR: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 515
    Top = 388
  end
  object dsIssue: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE BCISSUE'
      'SET '
      '    BI_TYPE = :BI_TYPE,'
      '    ISSUE = :ISSUE,'
      '    DTV = :DTV,'
      '    ATV = :ATV,'
      '    IPTV = :IPTV,'
      '    OTT = :OTT,'
      '    SOLUTION = :SOLUTION,'
      '    RESULT_TEXT = :RESULT_TEXT,'
      '    RESULT_ON = :RESULT_ON,'
      '    ALTER_CONFIG = :ALTER_CONFIG'
      'WHERE'
      '    BI_ID = :OLD_BI_ID'
      '    ')
    DeleteSQL.Strings = (
      ''
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO BCISSUE('
      '    BI_Id,'
      '    BI_TYPE,'
      '    ISSUE,'
      '    DTV,'
      '    ATV,'
      '    IPTV,'
      '    OTT,'
      '    SOLUTION,'
      '    RESULT_TEXT,'
      '    RESULT_ON,'
      '    ALTER_CONFIG'
      ')'
      'VALUES('
      '    :BI_Id,'
      '    :BI_TYPE,'
      '    :ISSUE,'
      '    :DTV,'
      '    :ATV,'
      '    :IPTV,'
      '    :OTT,'
      '    :SOLUTION,'
      '    :RESULT_TEXT,'
      '    :RESULT_ON,'
      '    :ALTER_CONFIG'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    i.*'
      '  , o.O_Name ISSUE_TYPE'
      '  from Bcissue i'
      
        '    inner join objects o on (o.O_Id = i.Bi_Type and o.O_Type = 5' +
        '3)'
      'where(  i.BI_ID = :BI_ID'
      '     ) and (     I.BI_ID = :OLD_BI_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    i.*'
      '  , o.O_Name ISSUE_TYPE'
      '  from Bcissue i'
      
        '    inner join objects o on (o.O_Id = i.Bi_Type and o.O_Type = 5' +
        '3)'
      'where i.BI_ID = :BI_ID')
    AutoUpdateOptions.UpdateTableName = 'BCISSUE'
    AutoUpdateOptions.KeyFields = 'BI_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_ISSUE'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    OnNewRecord = dsIssueNewRecord
    Transaction = trIR
    Database = dmMain.dbTV
    UpdateTransaction = trIW
    AutoCommit = True
    Left = 400
    Top = 336
    oFetchAll = True
  end
  object srcIssue: TDataSource
    DataSet = dsIssue
    Left = 400
    Top = 384
  end
  object dsIType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    o.O_Id'
      '  , o.O_Name'
      '  from objects o'
      '  where o.O_Type = 53'
      '        and o.O_Deleted = 0'
      '  order by O_Name  ')
    OnNewRecord = dsIssueNewRecord
    Transaction = trRIT
    Database = dmMain.dbTV
    UpdateTransaction = trIW
    AutoCommit = True
    Left = 608
    Top = 336
    oFetchAll = True
  end
  object srcIType: TDataSource
    DataSet = dsIType
    Left = 608
    Top = 384
  end
  object trRIT: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 715
    Top = 332
  end
  object dsSolution: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    o.O_Id'
      '  , o.O_Name'
      '  from objects o'
      '  where o.O_Type = 54'
      '        and o.O_Deleted = 0'
      '  order by O_Name  ')
    OnNewRecord = dsIssueNewRecord
    Transaction = trRIT
    Database = dmMain.dbTV
    UpdateTransaction = trIW
    AutoCommit = True
    Left = 656
    Top = 336
    oFetchAll = True
  end
  object srcSolution: TDataSource
    DataSet = dsSolution
    Left = 656
    Top = 384
  end
  object mtChnlsAll: TMemTableEh
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 804
    Top = 344
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object CH_ID: TMTNumericDataFieldEh
          FieldName = 'CH_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CH_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object INISSUE: TMTNumericDataFieldEh
          FieldName = 'INISSUE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'INISSUE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object BI_ID: TMTNumericDataFieldEh
          FieldName = 'BI_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'BI_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CH_NUMBER: TMTNumericDataFieldEh
          FieldName = 'CH_NUMBER'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CH_NUMBER'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CH_NAME: TMTStringDataFieldEh
          FieldName = 'CH_NAME'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'CH_NAME'
          DisplayWidth = 50
          Size = 50
          Transliterate = True
        end
        object CH_NOTICE: TMTStringDataFieldEh
          FieldName = 'CH_NOTICE'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'CH_NOTICE'
          DisplayWidth = 1000
          Size = 1000
          Transliterate = True
        end
        object CH_FREQ: TMTNumericDataFieldEh
          FieldName = 'CH_FREQ'
          NumericDataType = fdtBCDEh
          AutoIncrement = False
          DefaultExpression = '0'
          DisplayLabel = 'CH_FREQ'
          DisplayWidth = 10
          DisplayFormat = '#,##0.000'
          EditFormat = '0.000'
          currency = False
          Precision = 0
          Scale = 3
        end
        object CH_CODED: TMTBooleanDataFieldEh
          FieldName = 'CH_CODED'
          DefaultExpression = 'False'
          DisplayLabel = 'CH_CODED'
          DisplayWidth = 5
        end
        object CH_TRUNK: TMTNumericDataFieldEh
          FieldName = 'CH_TRUNK'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CH_TRUNK'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CH_TRUNK_NUMBER: TMTNumericDataFieldEh
          FieldName = 'CH_TRUNK_NUMBER'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CH_TRUNK_NUMBER'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SRC_NAME: TMTStringDataFieldEh
          FieldName = 'SRC_NAME'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'SRC_NAME'
          DisplayWidth = 50
          Size = 50
          Transliterate = True
        end
        object CARD_NAME: TMTStringDataFieldEh
          FieldName = 'CARD_NAME'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'CARD_NAME'
          DisplayWidth = 500
          Size = 500
          Transliterate = True
        end
        object IS_CODED: TMTNumericDataFieldEh
          FieldName = 'IS_CODED'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'IS_CODED'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object IS_ANALOG: TMTNumericDataFieldEh
          FieldName = 'IS_ANALOG'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'IS_ANALOG'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object IS_DIGIT: TMTNumericDataFieldEh
          FieldName = 'IS_DIGIT'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'IS_DIGIT'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object LCN: TMTNumericDataFieldEh
          FieldName = 'LCN'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'LCN'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SID: TMTNumericDataFieldEh
          FieldName = 'SID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'SID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object TSID: TMTNumericDataFieldEh
          FieldName = 'TSID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'TSID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object NID: TMTNumericDataFieldEh
          FieldName = 'NID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'NID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object ON_DVB: TMTNumericDataFieldEh
          FieldName = 'ON_DVB'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'ON_DVB'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DVBS_ID: TMTNumericDataFieldEh
          FieldName = 'DVBS_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'DVBS_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CS_ID: TMTNumericDataFieldEh
          FieldName = 'CS_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CS_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
        Data = (
          (
            3904
            0
            nil
            nil
            '1TV'
            nil
            nil
            False
            nil
            nil
            'Amos'
            nil
            0
            0
            0
            nil
            4
            1001
            1
            1
            3751
            1935)
          (
            4326
            0
            nil
            86
            '2x2 !!!'
            nil
            0c
            False
            nil
            nil
            'Amos'
            '1111111'
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            1935)
          (
            4280
            0
            nil
            39
            '3 '#1040#1085#1075#1077#1083#1072
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4359
            0
            nil
            119
            '360'#176
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4319
            0
            nil
            79
            '5 '#1082#1072#1085#1072#1083
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4353
            0
            nil
            113
            '8 '#1082#1072#1085#1072#1083
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            3905
            0
            nil
            18
            'ATV'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4285
            0
            nil
            44
            'Bridge TV'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4364
            0
            nil
            124
            'Da Vinci Learning'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4282
            0
            nil
            41
            'Disney'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4348
            0
            nil
            108
            'Europa Plus TV'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4446
            0
            nil
            132
            'HD1'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4279
            0
            nil
            38
            'Infokanal'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4317
            0
            nil
            77
            'Music Box Ru'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4318
            0
            nil
            78
            'MusicBox TV'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4360
            0
            nil
            120
            'Nano TV'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4297
            0
            nil
            56
            'RT Doc HD'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4352
            0
            nil
            112
            'RTG'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4336
            0
            nil
            96
            'RU TV'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4443
            0
            nil
            129
            'SD1'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4444
            0
            nil
            130
            'SD2'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4445
            0
            nil
            131
            'SD3'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4442
            0
            nil
            128
            'SD4'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4361
            0
            nil
            121
            'Shop24'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4271
            0
            nil
            30
            'TNT4'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4304
            0
            nil
            63
            'TV 1000'
            nil
            0c
            False
            nil
            nil
            'Amos'
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            1935)
          (
            4290
            0
            nil
            49
            'TV 1000 Action'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4306
            0
            nil
            66
            'TV 1000Ru'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            3752
            0
            nil
            nil
            'TV1000'
            nil
            nil
            False
            nil
            nil
            nil
            nil
            0
            0
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            3753
            0
            nil
            2
            'TV1000 Action'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            2
            1001
            1
            1
            3751
            nil)
          (
            3754
            0
            nil
            3
            'TV1000 Comedy HD'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            6
            1003
            1
            1
            3762
            nil)
          (
            3755
            0
            nil
            4
            'TV1000 Megahit HD'
            nil
            0c
            False
            nil
            nil
            'Amos'
            '1111111'
            0
            1
            0
            nil
            7
            1003
            1
            1
            3762
            1935)
          (
            3756
            0
            nil
            5
            'TV1000 '#1056#1091#1089#1089#1082#1086#1077' '#1082#1080#1085#1086
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            3
            1001
            1
            1
            3751
            nil)
          (
            4294
            0
            nil
            1
            'U'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            1
            1001
            1
            1
            3751
            nil)
          (
            3757
            0
            nil
            6
            'Viasat Explore'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            4
            1002
            1
            1
            3761
            nil)
          (
            3758
            0
            nil
            7
            'Viasat Golf HD'
            nil
            0c
            False
            nil
            nil
            'Eutelsat-36B'
            nil
            0
            1
            0
            nil
            8
            1003
            1
            1
            3762
            1934)
          (
            4305
            0
            nil
            65
            'Viasat History'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4357
            0
            nil
            117
            'Viasat Nature'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            3788
            0
            nil
            16
            'Viasat Nature/History HD'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            3759
            0
            nil
            8
            'Viasat Sport'
            nil
            0c
            True
            nil
            nil
            nil
            nil
            1
            1
            0
            nil
            5
            1002
            1
            1
            3761
            nil)
          (
            4366
            0
            nil
            126
            #1040#1074#1090#1086' 24'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4292
            0
            nil
            51
            #1041#1057#1058
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4277
            0
            nil
            36
            #1041#1086#1073#1105#1088
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4367
            0
            nil
            127
            #1041#1086#1077#1094
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4288
            0
            nil
            47
            #1042#1088#1077#1084#1103
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4329
            0
            nil
            89
            #1044#1077#1090#1089#1082#1080#1081
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4337
            0
            nil
            97
            #1044#1086#1084' '#1050#1080#1085#1086
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4272
            0
            nil
            31
            #1044#1086#1084#1072#1096#1085#1080#1081
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4332
            0
            nil
            92
            #1044#1088#1072#1081#1074
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4316
            0
            nil
            76
            #1045#1074#1088#1086#1082#1080#1085#1086
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4356
            0
            nil
            116
            #1047#1072#1075#1086#1088#1086#1076#1085#1072#1103' '#1078#1080#1079#1085#1100
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4324
            0
            nil
            84
            #1047#1074#1077#1079#1076#1072
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4311
            0
            nil
            71
            #1047#1076#1086#1088#1086#1074#1086#1077' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4351
            0
            nil
            111
            #1047#1086#1086#1087#1072#1088#1082
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4330
            0
            nil
            90
            #1048#1083#1083#1102#1079#1080#1086#1085' +'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4327
            0
            nil
            87
            #1048#1085#1076#1080#1103' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4314
            0
            nil
            74
            #1048#1089#1090#1086#1088#1080#1103
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4338
            0
            nil
            98
            #1050#1061#1051
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4296
            0
            nil
            55
            #1050#1061#1051' HD'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4320
            0
            nil
            80
            #1050#1072#1088#1091#1089#1077#1083#1100
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4313
            0
            nil
            73
            #1050#1080#1085#1086' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4365
            0
            nil
            125
            #1050#1080#1085#1086#1084#1080#1082#1089
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4344
            0
            nil
            104
            #1050#1080#1085#1086#1087#1086#1082#1072#1079
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4312
            0
            nil
            72
            #1050#1086#1084#1077#1076#1080#1103' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4281
            0
            nil
            40
            #1050#1086#1085#1085#1099#1081' '#1084#1080#1088
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4276
            0
            nil
            35
            #1050#1088#1072#1089#1085#1072#1103' '#1083#1080#1085#1080#1103
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4340
            0
            nil
            100
            #1050#1091#1088#1072#1081
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4308
            0
            nil
            68
            #1052#1072#1090#1095' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4283
            0
            nil
            42
            #1052#1072#1090#1095' '#1058#1042' '#1053#1072#1096' '#1057#1087#1086#1088#1090
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4335
            0
            nil
            95
            #1052#1080#1088
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4345
            0
            nil
            105
            #1052#1085#1086#1075#1086' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4339
            0
            nil
            99
            #1052#1086#1081' '#1084#1080#1088
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4362
            0
            nil
            122
            #1052#1086#1089#1082#1074#1072' 24'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4358
            0
            nil
            118
            #1052#1086#1089#1082#1074#1072' '#1044#1086#1074#1077#1088#1080#1077
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4284
            0
            nil
            43
            #1052#1086#1103' '#1087#1083#1072#1085#1077#1090#1072
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4354
            0
            nil
            114
            #1052#1091#1078#1089#1082#1086#1081
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4302
            0
            nil
            61
            #1052#1091#1079' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4287
            0
            nil
            46
            #1052#1091#1079#1099#1082#1072' '#1087#1077#1088#1074#1086#1075#1086
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4298
            0
            nil
            57
            #1052#1091#1083#1100#1090
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4301
            0
            nil
            60
            #1053#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4347
            0
            nil
            107
            #1053#1072#1091#1082#1072' 2.0'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4346
            0
            nil
            106
            #1053#1072#1096#1077' '#1085#1086#1074#1086#1077' '#1082#1080#1085#1086
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4315
            0
            nil
            75
            #1054#1058#1056
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4309
            0
            nil
            69
            #1054#1093#1086#1090#1072' '#1080' '#1088#1099#1073#1072#1083#1082#1072
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4300
            0
            nil
            59
            #1055#1077#1088#1074#1099#1081
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4322
            0
            nil
            82
            #1055#1077#1088#1074#1099#1081' HD'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4331
            0
            nil
            91
            #1055#1103#1090#1085#1080#1094#1072'!'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4299
            0
            nil
            58
            #1056#1041#1050
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4343
            0
            nil
            103
            #1056#1077#1085' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4325
            0
            nil
            85
            #1056#1077#1090#1088#1086
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4293
            0
            nil
            52
            #1056#1086#1089#1089#1080#1103' 1'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4286
            0
            nil
            45
            #1056#1086#1089#1089#1080#1103' 24'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4321
            0
            nil
            81
            #1056#1086#1089#1089#1080#1103' HD'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4307
            0
            nil
            67
            #1056#1086#1089#1089#1080#1103' '#1050
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4323
            0
            nil
            83
            #1056#1091#1089#1089#1082#1080#1081' '#1041#1077#1089#1090#1089#1077#1083#1083#1077#1088
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4328
            0
            nil
            88
            #1056#1091#1089#1089#1082#1080#1081' '#1080#1083#1083#1102#1079#1080#1086#1085
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4363
            0
            nil
            123
            #1056#1091#1089#1089#1082#1080#1081' '#1088#1086#1084#1072#1085
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4275
            0
            nil
            34
            #1057#1058#1057
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4342
            0
            nil
            102
            #1057#1058#1057' love'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4278
            0
            nil
            37
            #1057#1080#1073#1072#1081' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4350
            0
            nil
            110
            #1057#1086#1102#1079
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4349
            0
            nil
            109
            #1057#1087#1072#1089
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4303
            0
            nil
            62
            #1058#1042' '#1094#1077#1085#1090#1088
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4273
            0
            nil
            32
            #1058#1042'3    2'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4334
            0
            nil
            94
            #1058#1053#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4274
            0
            nil
            33
            #1058#1053#1058'    2'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4289
            0
            nil
            48
            #1058#1077#1083#1077#1082#1072#1092#1077
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4295
            0
            nil
            54
            #1058#1091#1075#1072#1085' '#1058#1077#1083
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4310
            0
            nil
            70
            #1059#1089#1072#1076#1100#1073#1072
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4355
            0
            nil
            115
            #1059#1089#1087#1077#1093
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4341
            0
            nil
            101
            #1063#1077
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4291
            0
            nil
            50
            #1064#1072#1085#1089#1086#1085
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4333
            0
            nil
            93
            #1070#1084#1086#1088' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            3916
            0
            nil
            17
            #1351#1400#1394#1377#1391#1377#1385
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil))
      end
    end
  end
  object mtChnlsSel: TMemTableEh
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 36
    Top = 344
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object CH_ID: TMTNumericDataFieldEh
          FieldName = 'CH_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CH_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object INISSUE: TMTNumericDataFieldEh
          FieldName = 'INISSUE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'INISSUE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object BI_ID: TMTNumericDataFieldEh
          FieldName = 'BI_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'BI_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CH_NUMBER: TMTNumericDataFieldEh
          FieldName = 'CH_NUMBER'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CH_NUMBER'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CH_NAME: TMTStringDataFieldEh
          FieldName = 'CH_NAME'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'CH_NAME'
          DisplayWidth = 50
          Size = 50
          Transliterate = True
        end
        object CH_NOTICE: TMTStringDataFieldEh
          FieldName = 'CH_NOTICE'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'CH_NOTICE'
          DisplayWidth = 1000
          Size = 1000
          Transliterate = True
        end
        object CH_FREQ: TMTNumericDataFieldEh
          FieldName = 'CH_FREQ'
          NumericDataType = fdtBCDEh
          AutoIncrement = False
          DefaultExpression = '0'
          DisplayLabel = 'CH_FREQ'
          DisplayWidth = 10
          DisplayFormat = '#,##0.000'
          EditFormat = '0.000'
          currency = False
          Precision = 0
          Scale = 3
        end
        object CH_CODED: TMTBooleanDataFieldEh
          FieldName = 'CH_CODED'
          DefaultExpression = 'False'
          DisplayLabel = 'CH_CODED'
          DisplayWidth = 5
        end
        object CH_TRUNK: TMTNumericDataFieldEh
          FieldName = 'CH_TRUNK'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CH_TRUNK'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CH_TRUNK_NUMBER: TMTNumericDataFieldEh
          FieldName = 'CH_TRUNK_NUMBER'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CH_TRUNK_NUMBER'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SRC_NAME: TMTStringDataFieldEh
          FieldName = 'SRC_NAME'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'SRC_NAME'
          DisplayWidth = 50
          Size = 50
          Transliterate = True
        end
        object CARD_NAME: TMTStringDataFieldEh
          FieldName = 'CARD_NAME'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'CARD_NAME'
          DisplayWidth = 500
          Size = 500
          Transliterate = True
        end
        object IS_CODED: TMTNumericDataFieldEh
          FieldName = 'IS_CODED'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'IS_CODED'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object IS_ANALOG: TMTNumericDataFieldEh
          FieldName = 'IS_ANALOG'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'IS_ANALOG'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object IS_DIGIT: TMTNumericDataFieldEh
          FieldName = 'IS_DIGIT'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'IS_DIGIT'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object LCN: TMTNumericDataFieldEh
          FieldName = 'LCN'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'LCN'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SID: TMTNumericDataFieldEh
          FieldName = 'SID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'SID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object TSID: TMTNumericDataFieldEh
          FieldName = 'TSID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'TSID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object NID: TMTNumericDataFieldEh
          FieldName = 'NID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'NID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object ON_DVB: TMTNumericDataFieldEh
          FieldName = 'ON_DVB'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'ON_DVB'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DVBS_ID: TMTNumericDataFieldEh
          FieldName = 'DVBS_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'DVBS_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CS_ID: TMTNumericDataFieldEh
          FieldName = 'CS_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CS_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
        Data = (
          (
            3904
            0
            nil
            nil
            '1TV'
            nil
            nil
            False
            nil
            nil
            'Amos'
            nil
            0
            0
            0
            nil
            4
            1001
            1
            1
            3751
            1935)
          (
            4326
            0
            nil
            86
            '2x2 !!!'
            nil
            0c
            False
            nil
            nil
            'Amos'
            '1111111'
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            1935)
          (
            4280
            0
            nil
            39
            '3 '#1040#1085#1075#1077#1083#1072
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4359
            0
            nil
            119
            '360'#176
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4319
            0
            nil
            79
            '5 '#1082#1072#1085#1072#1083
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4353
            0
            nil
            113
            '8 '#1082#1072#1085#1072#1083
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            3905
            0
            nil
            18
            'ATV'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4285
            0
            nil
            44
            'Bridge TV'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4364
            0
            nil
            124
            'Da Vinci Learning'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4282
            0
            nil
            41
            'Disney'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4348
            0
            nil
            108
            'Europa Plus TV'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4446
            0
            nil
            132
            'HD1'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4279
            0
            nil
            38
            'Infokanal'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4317
            0
            nil
            77
            'Music Box Ru'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4318
            0
            nil
            78
            'MusicBox TV'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4360
            0
            nil
            120
            'Nano TV'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4297
            0
            nil
            56
            'RT Doc HD'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4352
            0
            nil
            112
            'RTG'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4336
            0
            nil
            96
            'RU TV'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4443
            0
            nil
            129
            'SD1'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4444
            0
            nil
            130
            'SD2'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4445
            0
            nil
            131
            'SD3'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4442
            0
            nil
            128
            'SD4'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4361
            0
            nil
            121
            'Shop24'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4271
            0
            nil
            30
            'TNT4'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4304
            0
            nil
            63
            'TV 1000'
            nil
            0c
            False
            nil
            nil
            'Amos'
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            1935)
          (
            4290
            0
            nil
            49
            'TV 1000 Action'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4306
            0
            nil
            66
            'TV 1000Ru'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            3752
            0
            nil
            nil
            'TV1000'
            nil
            nil
            False
            nil
            nil
            nil
            nil
            0
            0
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            3753
            0
            nil
            2
            'TV1000 Action'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            2
            1001
            1
            1
            3751
            nil)
          (
            3754
            0
            nil
            3
            'TV1000 Comedy HD'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            6
            1003
            1
            1
            3762
            nil)
          (
            3755
            0
            nil
            4
            'TV1000 Megahit HD'
            nil
            0c
            False
            nil
            nil
            'Amos'
            '1111111'
            0
            1
            0
            nil
            7
            1003
            1
            1
            3762
            1935)
          (
            3756
            0
            nil
            5
            'TV1000 '#1056#1091#1089#1089#1082#1086#1077' '#1082#1080#1085#1086
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            3
            1001
            1
            1
            3751
            nil)
          (
            4294
            0
            nil
            1
            'U'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            1
            1001
            1
            1
            3751
            nil)
          (
            3757
            0
            nil
            6
            'Viasat Explore'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            4
            1002
            1
            1
            3761
            nil)
          (
            3758
            0
            nil
            7
            'Viasat Golf HD'
            nil
            0c
            False
            nil
            nil
            'Eutelsat-36B'
            nil
            0
            1
            0
            nil
            8
            1003
            1
            1
            3762
            1934)
          (
            4305
            0
            nil
            65
            'Viasat History'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4357
            0
            nil
            117
            'Viasat Nature'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            3788
            0
            nil
            16
            'Viasat Nature/History HD'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            3759
            0
            nil
            8
            'Viasat Sport'
            nil
            0c
            True
            nil
            nil
            nil
            nil
            1
            1
            0
            nil
            5
            1002
            1
            1
            3761
            nil)
          (
            4366
            0
            nil
            126
            #1040#1074#1090#1086' 24'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4292
            0
            nil
            51
            #1041#1057#1058
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4277
            0
            nil
            36
            #1041#1086#1073#1105#1088
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4367
            0
            nil
            127
            #1041#1086#1077#1094
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4288
            0
            nil
            47
            #1042#1088#1077#1084#1103
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4329
            0
            nil
            89
            #1044#1077#1090#1089#1082#1080#1081
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4337
            0
            nil
            97
            #1044#1086#1084' '#1050#1080#1085#1086
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4272
            0
            nil
            31
            #1044#1086#1084#1072#1096#1085#1080#1081
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4332
            0
            nil
            92
            #1044#1088#1072#1081#1074
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4316
            0
            nil
            76
            #1045#1074#1088#1086#1082#1080#1085#1086
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4356
            0
            nil
            116
            #1047#1072#1075#1086#1088#1086#1076#1085#1072#1103' '#1078#1080#1079#1085#1100
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4324
            0
            nil
            84
            #1047#1074#1077#1079#1076#1072
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4311
            0
            nil
            71
            #1047#1076#1086#1088#1086#1074#1086#1077' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4351
            0
            nil
            111
            #1047#1086#1086#1087#1072#1088#1082
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4330
            0
            nil
            90
            #1048#1083#1083#1102#1079#1080#1086#1085' +'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4327
            0
            nil
            87
            #1048#1085#1076#1080#1103' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4314
            0
            nil
            74
            #1048#1089#1090#1086#1088#1080#1103
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4338
            0
            nil
            98
            #1050#1061#1051
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4296
            0
            nil
            55
            #1050#1061#1051' HD'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4320
            0
            nil
            80
            #1050#1072#1088#1091#1089#1077#1083#1100
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4313
            0
            nil
            73
            #1050#1080#1085#1086' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4365
            0
            nil
            125
            #1050#1080#1085#1086#1084#1080#1082#1089
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4344
            0
            nil
            104
            #1050#1080#1085#1086#1087#1086#1082#1072#1079
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4312
            0
            nil
            72
            #1050#1086#1084#1077#1076#1080#1103' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4281
            0
            nil
            40
            #1050#1086#1085#1085#1099#1081' '#1084#1080#1088
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4276
            0
            nil
            35
            #1050#1088#1072#1089#1085#1072#1103' '#1083#1080#1085#1080#1103
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4340
            0
            nil
            100
            #1050#1091#1088#1072#1081
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4308
            0
            nil
            68
            #1052#1072#1090#1095' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4283
            0
            nil
            42
            #1052#1072#1090#1095' '#1058#1042' '#1053#1072#1096' '#1057#1087#1086#1088#1090
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4335
            0
            nil
            95
            #1052#1080#1088
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4345
            0
            nil
            105
            #1052#1085#1086#1075#1086' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4339
            0
            nil
            99
            #1052#1086#1081' '#1084#1080#1088
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4362
            0
            nil
            122
            #1052#1086#1089#1082#1074#1072' 24'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4358
            0
            nil
            118
            #1052#1086#1089#1082#1074#1072' '#1044#1086#1074#1077#1088#1080#1077
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4284
            0
            nil
            43
            #1052#1086#1103' '#1087#1083#1072#1085#1077#1090#1072
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4354
            0
            nil
            114
            #1052#1091#1078#1089#1082#1086#1081
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4302
            0
            nil
            61
            #1052#1091#1079' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4287
            0
            nil
            46
            #1052#1091#1079#1099#1082#1072' '#1087#1077#1088#1074#1086#1075#1086
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4298
            0
            nil
            57
            #1052#1091#1083#1100#1090
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4301
            0
            nil
            60
            #1053#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4347
            0
            nil
            107
            #1053#1072#1091#1082#1072' 2.0'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4346
            0
            nil
            106
            #1053#1072#1096#1077' '#1085#1086#1074#1086#1077' '#1082#1080#1085#1086
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4315
            0
            nil
            75
            #1054#1058#1056
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4309
            0
            nil
            69
            #1054#1093#1086#1090#1072' '#1080' '#1088#1099#1073#1072#1083#1082#1072
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4300
            0
            nil
            59
            #1055#1077#1088#1074#1099#1081
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4322
            0
            nil
            82
            #1055#1077#1088#1074#1099#1081' HD'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4331
            0
            nil
            91
            #1055#1103#1090#1085#1080#1094#1072'!'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4299
            0
            nil
            58
            #1056#1041#1050
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4343
            0
            nil
            103
            #1056#1077#1085' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4325
            0
            nil
            85
            #1056#1077#1090#1088#1086
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4293
            0
            nil
            52
            #1056#1086#1089#1089#1080#1103' 1'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4286
            0
            nil
            45
            #1056#1086#1089#1089#1080#1103' 24'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4321
            0
            nil
            81
            #1056#1086#1089#1089#1080#1103' HD'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4307
            0
            nil
            67
            #1056#1086#1089#1089#1080#1103' '#1050
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4323
            0
            nil
            83
            #1056#1091#1089#1089#1082#1080#1081' '#1041#1077#1089#1090#1089#1077#1083#1083#1077#1088
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4328
            0
            nil
            88
            #1056#1091#1089#1089#1082#1080#1081' '#1080#1083#1083#1102#1079#1080#1086#1085
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4363
            0
            nil
            123
            #1056#1091#1089#1089#1082#1080#1081' '#1088#1086#1084#1072#1085
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4275
            0
            nil
            34
            #1057#1058#1057
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4342
            0
            nil
            102
            #1057#1058#1057' love'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4278
            0
            nil
            37
            #1057#1080#1073#1072#1081' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4350
            0
            nil
            110
            #1057#1086#1102#1079
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4349
            0
            nil
            109
            #1057#1087#1072#1089
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4303
            0
            nil
            62
            #1058#1042' '#1094#1077#1085#1090#1088
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4273
            0
            nil
            32
            #1058#1042'3    2'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4334
            0
            nil
            94
            #1058#1053#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4274
            0
            nil
            33
            #1058#1053#1058'    2'
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4289
            0
            nil
            48
            #1058#1077#1083#1077#1082#1072#1092#1077
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4295
            0
            nil
            54
            #1058#1091#1075#1072#1085' '#1058#1077#1083
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4310
            0
            nil
            70
            #1059#1089#1072#1076#1100#1073#1072
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4355
            0
            nil
            115
            #1059#1089#1087#1077#1093
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4341
            0
            nil
            101
            #1063#1077
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4291
            0
            nil
            50
            #1064#1072#1085#1089#1086#1085
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            4333
            0
            nil
            93
            #1070#1084#1086#1088' '#1058#1042
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil)
          (
            3916
            0
            nil
            17
            #1351#1400#1394#1377#1391#1377#1385
            nil
            0c
            False
            nil
            nil
            nil
            nil
            0
            1
            0
            nil
            nil
            nil
            nil
            0
            nil
            nil))
      end
    end
  end
  object srcChnlsSel: TDataSource
    DataSet = mtChnlsSel
    Left = 32
    Top = 400
  end
  object qrySave: TpFIBQuery
    Transaction = trWrite
    Database = dmMain.dbTV
    Left = 288
    Top = 147
    qoAutoCommit = True
    qoStartTransaction = True
  end
end
