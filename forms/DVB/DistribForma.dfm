inherited DistribForm: TDistribForm
  Left = 381
  Top = 171
  Caption = #1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088#1099' '#1082#1072#1085#1072#1083#1086#1074
  ClientHeight = 580
  ClientWidth = 919
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter [0]
    Left = 0
    Top = 348
    Width = 919
    Height = 4
    Cursor = crVSplit
    Align = alBottom
  end
  inherited splPG: TSplitter
    Top = 217
    Width = 919
  end
  inherited dbGrid: TDBGridEh
    Top = 221
    Width = 919
    Height = 127
    AllowedOperations = [alopUpdateEh]
    DrawMemoText = True
    FooterRowCount = 1
    SumList.Active = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_ID'
        Footers = <>
        Title.Caption = 'ID'
        Title.TitleButton = True
        Visible = False
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088
        Title.TitleButton = True
        Width = 167
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FINTERMS'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1060#1080#1085#1072#1085#1089#1099
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_COUNT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1050#1072#1085#1072#1083#1086#1074
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EMAIL'
        Footers = <>
        Title.TitleButton = True
        Width = 83
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PHONES'
        Footers = <>
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085#1099
        Title.TitleButton = True
        Width = 84
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDRESS'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089
        Title.TitleButton = True
        Width = 145
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 163
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CHANNELS'
        Footers = <>
        Title.Caption = #1050#1072#1085#1072#1083#1099
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 919
    inherited ToolButton9: TToolButton
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
    object btn4: TToolButton
      Left = 178
      Top = 0
      Width = 8
      Caption = 'btn4'
      ImageIndex = 41
      Style = tbsSeparator
    end
    object btnSetPeriodAll: TToolButton
      Left = 186
      Top = 0
      Hint = 
        #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1087#1077#1088#1080#1086#1076#1072' '#1087#1086' '#1074#1089#1077#1084' '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1084' '#1076#1086#1075#1086#1074#1086#1088#1072#1084#13#10#1045#1089#1083 +
        #1080' '#1076#1072#1085#1085#1099#1077' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1091' '#1073#1099#1083#1080' '#1074#1074#1077#1076#1085#1099' '#1088#1072#1085#1077#1077', '#1090#1086' '#1101#1090#1080' '#1076#1072#1085#1085#1099#1077' '#1085#1077' '#1079#1072#1090#1088#1086#1085#1077 +
        #1090
      Action = actSetPeriodAll
    end
    object btn6: TToolButton
      Left = 209
      Top = 0
      Width = 8
      Caption = 'btn6'
      ImageIndex = 91
      Style = tbsSeparator
    end
    object btnSendPDF: TToolButton
      Left = 217
      Top = 0
      Hint = #1056#1072#1079#1086#1089#1083#1072#1090#1100' '#1072#1082#1090#1099' '#1079#1072' '#1087#1077#1088#1080#1086#1076
      Action = actSendPDF
    end
  end
  inherited pnlEdit: TPanel
    Width = 919
    Height = 192
    ParentCtl3D = False
    object lbl2: TLabel [0]
      Left = 5
      Top = 15
      Width = 53
      Height = 13
      Caption = #1044#1080#1089#1090#1088'-'#1090#1086#1088
    end
    object lbl3: TLabel [1]
      Left = 5
      Top = 107
      Width = 61
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    inherited btnSaveLink: TBitBtn
      Left = 72
      Top = 159
      Width = 734
      TabOrder = 5
    end
    inherited btnCancelLink: TBitBtn
      Left = 812
      Top = 159
      Width = 98
      Cancel = True
      TabOrder = 6
    end
    object edtName: TDBEditEh
      Left = 72
      Top = 12
      Width = 838
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dbmmoO_DESCRIPTION: TDBMemoEh
      Left = 72
      Top = 104
      Width = 838
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 4
      Visible = True
      WantReturns = True
    end
    object dbmO_DESCRIPTION: TDBMemoEh
      Left = 344
      Top = 39
      Width = 289
      Height = 59
      ScrollBars = ssVertical
      AutoSize = False
      DataField = 'ADDRESS'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1040#1076#1088#1077#1089
      ShowHint = True
      TabOrder = 3
      Visible = True
      WantReturns = True
    end
    object edtEMAIL: TDBEditEh
      Left = 72
      Top = 39
      Width = 266
      Height = 21
      DataField = 'EMAIL'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'email'
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object dbmPHONE: TDBMemoEh
      Left = 72
      Top = 64
      Width = 266
      Height = 34
      ScrollBars = ssVertical
      AutoSize = False
      DataField = 'PHONES'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1058#1077#1083#1077#1092#1086#1085#1099
      ShowHint = True
      TabOrder = 2
      Visible = True
      WantReturns = True
    end
    object dbmADDRESS: TDBMemoEh
      Left = 639
      Top = 39
      Width = 271
      Height = 59
      ScrollBars = ssVertical
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataField = 'JADDRESS'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1070#1088'. '#1072#1076#1088#1077#1089
      ShowHint = True
      TabOrder = 7
      Visible = True
      WantReturns = True
    end
  end
  object pgcDistr: TPageControl [5]
    Left = 0
    Top = 352
    Width = 919
    Height = 228
    ActivePage = tsContract
    Align = alBottom
    TabOrder = 3
    OnChange = pgcDistrChange
    object tsContract: TTabSheet
      Caption = #1044#1086#1075#1086#1074#1086#1088#1072
      object pnlBottom: TPanel
        Left = 0
        Top = 0
        Width = 911
        Height = 200
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object splRight: TSplitter
          Left = 447
          Top = 0
          Width = 4
          Height = 200
          Align = alRight
        end
        object pgcAddons: TPageControl
          Left = 451
          Top = 0
          Width = 460
          Height = 200
          ActivePage = tsChan
          Align = alRight
          TabOrder = 0
          OnChange = pgcAddonsChange
          object tsChan: TTabSheet
            Caption = #1050#1072#1085#1072#1083#1099
            object dbgReports: TDBGridEh
              Left = 0
              Top = 25
              Width = 452
              Height = 147
              Align = alClient
              DataSource = srcChan
              DynProps = <>
              Flat = True
              FooterRowCount = 1
              FooterParams.Color = clWindow
              GridLineParams.VertEmptySpaceStyle = dessNonEh
              OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
              SortLocal = True
              SumList.Active = True
              TabOrder = 0
              TitleParams.MultiTitle = True
              OnDblClick = dbgReportsDblClick
              Columns = <
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CH_NAME'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #1050#1072#1085#1072#1083
                  Title.TitleButton = True
                  Width = 143
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'COST'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = #1062#1077#1085#1072
                  Title.TitleButton = True
                  Width = 64
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CUST_COUNT'
                  Footers = <>
                  Title.Caption = #1040#1073#1086#1085#1077#1085#1090#1086#1074
                  Title.TitleButton = True
                  Width = 70
                end
                item
                  CellButtons = <>
                  Checkboxes = True
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'ATV'
                  Footers = <>
                  Title.Caption = #1055#1072#1082#1077#1090'|'#1040#1058#1042
                  Title.TitleButton = True
                  Width = 35
                end
                item
                  CellButtons = <>
                  Checkboxes = True
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DTV'
                  Footers = <>
                  Title.Caption = #1055#1072#1082#1077#1090'|'#1062#1058#1042
                  Title.TitleButton = True
                  Width = 35
                end
                item
                  CellButtons = <>
                  Checkboxes = True
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'IPTV'
                  Footers = <>
                  Title.Caption = #1055#1072#1082#1077#1090'|IPTV'
                  Title.TitleButton = True
                  Width = 35
                end
                item
                  CellButtons = <>
                  Checkboxes = True
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'OTT'
                  Footers = <>
                  Title.Caption = #1055#1072#1082#1077#1090'|OTT'
                  Title.TitleButton = True
                  Width = 35
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NOTICE'
                  Footers = <>
                  Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                  Title.TitleButton = True
                  Width = 127
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object ToolBar2: TToolBar
              Left = 0
              Top = 0
              Width = 452
              Height = 25
              Caption = 'tlb1'
              Images = A4MainForm.ICONS_ACTIVE
              TabOrder = 1
              object ToolButton8: TToolButton
                Left = 0
                Top = 0
                Width = 5
                Caption = 'ToolButton4'
                ImageIndex = 3
                Style = tbsSeparator
              end
              object btnChNew: TToolButton
                Left = 5
                Top = 0
                Action = actChAdd
              end
              object ToolButton14: TToolButton
                Left = 28
                Top = 0
                Width = 4
                Caption = 'ToolButton5'
                ImageIndex = 3
                Style = tbsSeparator
              end
              object btnChEdit1: TToolButton
                Left = 32
                Top = 0
                Action = actChEdit
              end
              object btn5: TToolButton
                Left = 55
                Top = 0
                Width = 10
                Caption = 'btn5'
                ImageIndex = 5
                Style = tbsSeparator
              end
              object btnChDel1: TToolButton
                Left = 65
                Top = 0
                Action = actChDel
              end
            end
          end
          object tsReports: TTabSheet
            Caption = #1054#1090#1095#1077#1090#1099
            object Splitter1: TSplitter
              Left = 0
              Top = 96
              Width = 452
              Height = 4
              Cursor = crVSplit
              Align = alBottom
            end
            object dbgReport: TDBGridEh
              Left = 0
              Top = 25
              Width = 452
              Height = 71
              Align = alClient
              AllowedOperations = [alopUpdateEh]
              DataSource = srcReport
              DynProps = <>
              Flat = True
              FooterParams.Color = clWindow
              GridLineParams.VertEmptySpaceStyle = dessNonEh
              OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
              SortLocal = True
              SumList.Active = True
              TabOrder = 0
              TitleParams.MultiTitle = True
              OnDblClick = dbgReportDblClick
              Columns = <
                item
                  CellButtons = <>
                  DisplayFormat = 'MM YYYY'
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'PERIOD'
                  Footers = <>
                  Title.Caption = #1055#1077#1088#1080#1086#1076
                  Title.TitleButton = True
                  Title.SortIndex = 1
                  Title.SortMarker = smDownEh
                  Width = 62
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'START_CNT'
                  Footers = <>
                  Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086'|'#1085#1072#1095#1072#1083#1086
                  Title.TitleButton = True
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'END_CNT'
                  Footers = <>
                  Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086'|'#1082#1086#1085#1077#1094
                  Title.TitleButton = True
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'START_SUM'
                  Footers = <>
                  Title.Caption = #1057#1091#1084#1084#1072'|'#1053#1072#1095#1072#1083#1086
                  Title.TitleButton = True
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'END_SUM'
                  Footers = <>
                  Title.Caption = #1057#1091#1084#1084#1072'|'#1050#1086#1085#1077#1094
                  Title.TitleButton = True
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'V_NUM'
                  Footers = <>
                  Title.Caption = #1055#1077#1088#1077#1084#1077#1085#1085#1099#1077'|'#1063#1080#1089#1083#1086
                  Title.TitleButton = True
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'V_DATE'
                  Footers = <>
                  Title.Caption = #1055#1077#1088#1077#1084#1077#1085#1085#1099#1077'|'#1044#1072#1090#1072
                  Title.TitleButton = True
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'V_TEXT'
                  Footers = <>
                  Title.Caption = #1055#1077#1088#1077#1084#1077#1085#1085#1099#1077'|'#1058#1077#1082#1089#1090
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
                  Width = 124
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object ToolBar1: TToolBar
              Left = 0
              Top = 0
              Width = 452
              Height = 25
              Caption = 'tlb1'
              Images = A4MainForm.ICONS_ACTIVE
              TabOrder = 1
              object ToolButton7: TToolButton
                Left = 0
                Top = 0
                Width = 5
                Caption = 'ToolButton4'
                ImageIndex = 3
                Style = tbsSeparator
              end
              object btnRepAdd: TToolButton
                Left = 5
                Top = 0
                Action = actRepAdd
              end
              object ToolButton11: TToolButton
                Left = 28
                Top = 0
                Width = 4
                Caption = 'ToolButton5'
                ImageIndex = 3
                Style = tbsSeparator
              end
              object btnRepEdit: TToolButton
                Left = 32
                Top = 0
                Action = actRepEdit
              end
              object ToolButton13: TToolButton
                Left = 55
                Top = 0
                Width = 10
                Caption = 'ToolButton6'
                ImageIndex = 4
                Style = tbsSeparator
              end
              object btnRepDel: TToolButton
                Left = 65
                Top = 0
                Action = actRepDel
              end
            end
            object dbgPC: TDBGridEh
              Left = 0
              Top = 100
              Width = 452
              Height = 72
              Align = alBottom
              AllowedOperations = [alopUpdateEh]
              DataSource = srcRC
              DynProps = <>
              Flat = True
              OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
              TabOrder = 2
              TitleParams.MultiTitle = True
              Columns = <
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CH_NAME'
                  Footers = <>
                  ReadOnly = True
                  Title.Caption = #1050#1072#1085#1072#1083
                  Title.TitleButton = True
                  Title.SortIndex = 1
                  Title.SortMarker = smUpEh
                  Width = 125
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'START_CNT'
                  Footers = <>
                  Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086'|'#1085#1072#1095#1072#1083#1086
                  Title.TitleButton = True
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'END_CNT'
                  Footers = <>
                  Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086'|'#1082#1086#1085#1077#1094
                  Title.TitleButton = True
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'START_SUM'
                  Footers = <>
                  Title.Caption = #1057#1091#1084#1084#1072'|'#1053#1072#1095#1072#1083#1086
                  Title.TitleButton = True
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'END_SUM'
                  Footers = <>
                  Title.Caption = #1057#1091#1084#1084#1072'|'#1050#1086#1085#1077#1094
                  Title.TitleButton = True
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
        object pnlButtom: TPanel
          Left = 0
          Top = 0
          Width = 447
          Height = 200
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object dbgContract: TDBGridEh
            Left = 0
            Top = 25
            Width = 447
            Height = 175
            Align = alClient
            AllowedOperations = [alopUpdateEh]
            AllowedSelections = [gstRecordBookmarks, gstAll]
            DataSource = srcContract
            DynProps = <>
            Flat = True
            FooterRowCount = 1
            FooterParams.Color = clWindow
            GridLineParams.VertEmptySpaceStyle = dessNonEh
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
            OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
            SortLocal = True
            SumList.Active = True
            TabOrder = 0
            TitleParams.MultiTitle = True
            OnDblClick = dbgContractDblClick
            Columns = <
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'C_NUMBER'
                Footer.ValueType = fvtCount
                Footers = <>
                Title.Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
                Title.TitleButton = True
                Width = 98
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'CH_COUNT'
                Footers = <>
                Title.Caption = #1050#1072#1085#1072#1083#1086#1074
                Title.TitleButton = True
                Width = 54
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'C_DATE'
                Footers = <>
                Title.Caption = #1057' '#1076#1072#1090#1099
                Title.TitleButton = True
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'C_DATE_BEFORE'
                Footers = <>
                Title.Caption = #1055#1086' '#1076#1072#1090#1091
                Title.TitleButton = True
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'FINTERMS'
                Footer.ValueType = fvtSum
                Footers = <>
                Title.Caption = #1059#1089#1083#1086#1074#1080#1103'|'#1060#1080#1085', '#1088#1091#1073'.'
                Title.TitleButton = True
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'MINTERMS'
                Footers = <>
                Title.Caption = #1059#1089#1083#1086#1074#1080#1103'|'#1052#1080#1085', '#1095#1077#1083'.'
                Title.TitleButton = True
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'CTYPE'
                Footers = <>
                Title.Caption = #1042#1080#1076' '#1076#1086#1075#1086#1074#1086#1088#1072
                Title.TitleButton = True
                Width = 56
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'REPORT_NAME'
                Footers = <>
                Title.Caption = #1054#1090#1095#1077#1090
                Title.TitleButton = True
                Width = 104
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'REPORT_FRMT'
                Footers = <>
                Title.Caption = #1060#1086#1088#1084#1072#1090
                Title.TitleButton = True
                Width = 45
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'NOTICE'
                Footers = <>
                Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                Title.TitleButton = True
                Width = 100
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object tlb1: TToolBar
            Left = 0
            Top = 0
            Width = 447
            Height = 25
            Caption = 'tlb1'
            Images = A4MainForm.ICONS_ACTIVE
            TabOrder = 1
            object btn7: TToolButton
              Left = 0
              Top = 0
              Width = 5
              Caption = 'ToolButton4'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object btnSu: TToolButton
              Left = 5
              Top = 0
              Action = actCNew
            end
            object btn1: TToolButton
              Left = 28
              Top = 0
              Width = 4
              Caption = 'ToolButton5'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object btnChEdit: TToolButton
              Left = 32
              Top = 0
              Action = actCEdit
            end
            object btn3: TToolButton
              Left = 55
              Top = 0
              Width = 4
              Caption = 'ToolButton6'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object btnChDel: TToolButton
              Left = 59
              Top = 0
              Action = actCDel
            end
            object btn2: TToolButton
              Left = 82
              Top = 0
              Width = 8
              Caption = 'btn2'
              ImageIndex = 4
              Style = tbsSeparator
            end
            object btnPrintContract: TToolButton
              Left = 90
              Top = 0
              Action = actPrintContract
            end
          end
        end
      end
    end
    object tsCards: TTabSheet
      Caption = #1050#1072#1088#1090#1086#1095#1082#1080
      ImageIndex = 1
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 911
        Height = 200
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object tlb2: TToolBar
          Left = 0
          Top = 0
          Width = 911
          Height = 25
          Caption = 'tlb1'
          Images = A4MainForm.ICONS_ACTIVE
          TabOrder = 0
          object btn8: TToolButton
            Left = 0
            Top = 0
            Width = 5
            Caption = 'ToolButton4'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object btnactCnPrefixWizard: TToolButton
            Left = 5
            Top = 0
            Hint = #1053#1086#1074#1099#1081' '#1076#1086#1075#1086#1074#1086#1088
            ImageIndex = 2
          end
          object btn9: TToolButton
            Left = 28
            Top = 0
            Width = 4
            Caption = 'ToolButton5'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object btnactCnPrefixWizard1: TToolButton
            Left = 32
            Top = 0
            Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1086#1075#1086#1074#1086#1088
            ImageIndex = 4
          end
          object btn10: TToolButton
            Left = 55
            Top = 0
            Width = 4
            Caption = 'ToolButton6'
            ImageIndex = 4
            Style = tbsSeparator
          end
          object btnactCnPrefixWizard2: TToolButton
            Left = 59
            Top = 0
            Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1075#1086#1074#1086#1088
            ImageIndex = 3
          end
        end
        object dbgCards: TDBGridEh
          Left = 0
          Top = 25
          Width = 911
          Height = 175
          Align = alClient
          AllowedOperations = [alopUpdateEh]
          DataSource = srcCards
          DynProps = <>
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterRowCount = 1
          FooterParams.Color = clWindow
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
          PopupMenu = pmPopUp
          SortLocal = True
          STFilter.Local = True
          SumList.Active = True
          TabOrder = 1
          TitleParams.MultiTitle = True
          OnDblClick = dbGridDblClick
          OnGetFooterParams = dbGridGetFooterParams
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'O_ID'
              Footers = <>
              Visible = False
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CARD'
              Footer.ValueType = fvtCount
              Footers = <>
              Title.Caption = #1053#1086#1084#1077#1088
              Title.TitleButton = True
              Width = 167
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CH_COUNT'
              Footer.ValueType = fvtSum
              Footers = <>
              Title.Caption = #1050#1086#1083'-'#1074#1086' '#1082#1072#1085#1072#1083#1086#1074
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'PLACE'
              Footers = <>
              Title.Caption = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
              Title.TitleButton = True
              Width = 78
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CHIP_ID'
              Footers = <>
              Title.Caption = 'Chip ID'
              Title.ShowImageAndText = False
              Title.TitleButton = True
              Width = 88
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CRYPT_NAME'
              Footers = <>
              Title.Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072
              Title.TitleButton = True
              Width = 75
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'O_DATEEND'
              Footers = <>
              Title.Caption = #1054#1087#1083#1072#1095#1077#1085#1086' '#1076#1086
              Title.TitleButton = True
              Width = 89
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 310
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsDistrib
    OnDataChange = srcDataSourceDataChange
    Left = 256
    Top = 288
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 150
    Top = 280
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actEditExecute
    end
    object actCNew: TAction
      Caption = #1053#1086#1074#1099#1081' '#1076#1086#1075#1086#1074#1086#1088
      Hint = #1053#1086#1074#1099#1081' '#1076#1086#1075#1086#1074#1086#1088
      ImageIndex = 2
      ShortCut = 16462
      OnExecute = actCNewExecute
    end
    object actCEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1086#1075#1086#1074#1086#1088
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1086#1075#1086#1074#1086#1088
      ImageIndex = 4
      OnExecute = actCEditExecute
    end
    object actCDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1075#1086#1074#1086#1088
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1075#1086#1074#1086#1088
      ImageIndex = 3
      OnExecute = actCDelExecute
    end
    object actRepAdd: TAction
      Caption = 'actRepAdd'
      ImageIndex = 2
      OnExecute = actRepAddExecute
    end
    object actRepEdit: TAction
      Caption = 'actRepEdit'
      ImageIndex = 4
      OnExecute = actRepEditExecute
    end
    object actRepDel: TAction
      Caption = 'actRepDel'
      ImageIndex = 3
      OnExecute = actRepDelExecute
    end
    object actPrintContract: TAction
      Caption = 'actPrintContract'
      ImageIndex = 5
      OnExecute = actPrintContractExecute
    end
    object actChAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1085#1072#1083
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1085#1072#1083
      ImageIndex = 2
      OnExecute = actChAddExecute
    end
    object actChDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1085#1072#1083
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1085#1072#1083
      ImageIndex = 3
      OnExecute = actChDelExecute
    end
    object actChEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 4
      OnExecute = actChEditExecute
    end
    object actSendPDF: TAction
      Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100'/'#1056#1072#1079#1086#1089#1083#1072#1090#1100' '#1072#1082#1090#1099
      Hint = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1080#1083#1080' '#1088#1072#1079#1086#1089#1083#1072#1090#1100' '#1072#1082#1090#1099' '#1087#1086' '#1072#1082#1090#1080#1074#1085#1099#1084' '#1076#1086#1075#1086#1074#1086#1088#1072#1084
      ImageIndex = 90
      ShortCut = 16467
      OnExecute = actSendPDFExecute
    end
    object actSetPeriodAll: TAction
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1087#1077#1088#1080#1086#1076#1072
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1087#1077#1088#1080#1086#1076#1072' '#1087#1086' '#1074#1089#1077#1084' '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1080#1084' '#1076#1086#1075#1086#1074#1086#1088#1072#1084
      ImageIndex = 91
      ShortCut = 16452
      OnExecute = actSetPeriodAllExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 443
    Top = 287
  end
  inherited CnErrors: TCnErrorProvider
    Left = 344
    Top = 288
  end
  object dsDistrib: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE DISTRIBUTOR'
      'SET '
      '    NAME = :NAME,'
      '    ADDRESS = :ADDRESS,'
      '    JADDRESS = :JADDRESS,'
      '    EMAIL = :EMAIL,'
      '    PHONES = :PHONES,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DISTRIBUTOR'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO DISTRIBUTOR('
      '    ID,'
      '    NAME,'
      '    ADDRESS,'
      '    JADDRESS,    '
      '    EMAIL,'
      '    PHONES,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :ID,'
      '    :NAME,'
      '    :ADDRESS,'
      '    :JADDRESS,'
      '    :EMAIL,'
      '    :PHONES,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    d.*'
      '  , (select'
      '         count(*)'
      '       from Distrib_Contract_Ch c'
      
        '            inner join Distrib_Contracts dc on (c.Contract_Id = ' +
        'dc.Id)'
      '       where dc.Distributor_Id = d.Id) as CH_COUNT'
      '  , (select'
      '         sum(coalesce(FINTERMS,0))'
      '       from Distrib_Contracts dc'
      '       where dc.Distributor_Id = d.Id) as FINTERMS   '
      '  , (select'
      '         list(distinct cc.Ch_Name)'
      '       from Distrib_Contract_Ch c'
      
        '            inner join Distrib_Contracts dc on (c.Contract_Id = ' +
        'dc.Id)'
      '            inner join Channels cc on (c.Ch_Id = cc.Ch_Id)'
      '       where dc.Distributor_Id = d.Id) as Channels           '
      '  from Distributor d'
      ' WHERE '
      '        D.ID = :OLD_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    d.*'
      '  , (select'
      '         count(*)'
      '       from Distrib_Contract_Ch c'
      
        '            inner join Distrib_Contracts dc on (c.Contract_Id = ' +
        'dc.Id)'
      '       where dc.Distributor_Id = d.Id) as CH_COUNT'
      '  , (select'
      '         sum(coalesce(FINTERMS,0))'
      '       from Distrib_Contracts dc'
      '       where dc.Distributor_Id = d.Id) as FINTERMS'
      '  , (select'
      '         list(distinct cc.Ch_Name)'
      '       from Distrib_Contract_Ch c'
      
        '            inner join Distrib_Contracts dc on (c.Contract_Id = ' +
        'dc.Id)'
      '            inner join Channels cc on (c.Ch_Id = cc.Ch_Id)'
      '       where dc.Distributor_Id = d.Id) as Channels              '
      '  from Distributor d'
      '  order by d.Name')
    AutoUpdateOptions.UpdateTableName = 'DISTRIBUTOR'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 48
    Top = 280
  end
  object srcChan: TDataSource
    AutoEdit = False
    DataSet = dsChan
    Left = 200
    Top = 496
  end
  object dsChan: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DISTRIB_CONTRACT_CH'
      'WHERE'
      '        CONTRACT_ID = :OLD_CONTRACT_ID'
      '    and CH_ID = :OLD_CH_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    cc.*'
      '    , c.CH_NAME    '
      '  from Distrib_Contract_Ch cc'
      '       inner join Channels C on (c.Ch_Id = cc.Ch_Id)'
      'where CC.CONTRACT_ID = :OLD_CONTRACT_ID'
      '    and CC.CH_ID = :OLD_CH_ID')
    SelectSQL.Strings = (
      'select'
      '    cc.*'
      '    , c.CH_NAME'
      '  from Distrib_Contract_Ch cc'
      '       inner join Channels C on (c.Ch_Id = cc.Ch_Id)'
      'where cc.CONTRACT_ID = :ID and not cc.CONTRACT_ID is null'
      'order by C.Ch_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcContract
    Left = 200
    Top = 448
  end
  object srcContract: TDataSource
    AutoEdit = False
    DataSet = dsContract
    OnDataChange = srcContractDataChange
    Left = 112
    Top = 496
  end
  object dsContract: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DISTRIB_CONTRACTS'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    dc.*'
      '    , r.Report_Name'
      '  , (select'
      '         count(*)'
      '       from Distrib_Contract_Ch d'
      '       where d.Contract_Id = dc.Id) as CH_COUNT   '
      '  from Distrib_Contracts dc'
      '    left outer join Reports r on (r.Id_Report = dc.Report_Id)'
      '  where(  dc.Distributor_Id = :Distributor_Id'
      '        and not dc.Distributor_Id is null'
      '     ) and (     DC.ID = :OLD_ID'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    dc.*'
      '  , r.Report_Name'
      '  , (select'
      '         count(*)'
      '       from Distrib_Contract_Ch d'
      '       where d.Contract_Id = dc.Id) as CH_COUNT'
      '  from Distrib_Contracts dc'
      '       left outer join Reports r on (r.Id_Report = dc.Report_Id)'
      '  where dc.Distributor_Id = :Id'
      '        and not dc.Distributor_Id is null'
      '  order by dc.C_Date desc')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcDataSource
    Left = 112
    Top = 448
  end
  object srcReport: TDataSource
    AutoEdit = False
    DataSet = dsReport
    Left = 272
    Top = 496
  end
  object dsReport: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE DISTRIB_CONTRACT_REPORTS'
      'SET '
      '    CONTRACT_ID = :CONTRACT_ID,'
      '    PERIOD = :PERIOD,'
      '    START_CNT = :START_CNT,'
      '    END_CNT = :END_CNT,'
      '    START_SUM = :START_SUM,'
      '    END_SUM = :END_SUM,'
      '    V_NUM = :V_NUM,'
      '    V_DATE = :V_DATE,'
      '    V_TEXT = :V_TEXT,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    CONTRACT_ID = :OLD_CONTRACT_ID'
      '    and PERIOD = :OLD_PERIOD'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DISTRIB_CONTRACT_REPORTS'
      'WHERE'
      '        CONTRACT_ID = :OLD_CONTRACT_ID'
      '    and PERIOD = :OLD_PERIOD'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO DISTRIB_CONTRACT_REPORTS('
      '    CONTRACT_ID,'
      '    PERIOD,'
      '    START_CNT,'
      '    END_CNT,'
      '    START_SUM,'
      '    END_SUM,'
      '    V_NUM,'
      '    V_DATE,'
      '    V_TEXT,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :CONTRACT_ID,'
      '    :PERIOD,'
      '    :START_CNT,'
      '    :END_CNT,'
      '    :START_SUM,'
      '    :END_SUM,'
      '    :V_NUM,'
      '    :V_DATE,'
      '    :V_TEXT,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    *'
      '  from Distrib_Contract_Reports r'
      'where (     R.CONTRACT_ID = :CONTRACT_ID'
      '    and R.PERIOD = :PERIOD'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    *'
      '  from Distrib_Contract_Reports r'
      'where r.Contract_Id = :Id'
      'order by r.Period desc')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcContract
    Left = 272
    Top = 448
  end
  object PropStorage: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'pgcDistr.<P>.Height'
      'pgcDistr.tsContract.pnlBottom.pgcAddons.<P>.Width'
      
        'pgcDistr.tsContract.pnlBottom.pgcAddons.tsReports.dbgReport.<P>.' +
        'Height')
    Left = 377
    Top = 145
  end
  object frxContract: TfrxDBDataset
    UserName = 'DistrContracts'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID=ID'
      'DISTRIBUTOR_ID=DISTRIBUTOR_ID'
      'C_NUMBER=C_NUMBER'
      'C_DATE=C_DATE'
      'C_DATE_BEFORE=C_DATE_BEFORE'
      'REPORT_FRMT=REPORT_FRMT'
      'DELIVERY=DELIVERY'
      'NOTICE=NOTICE'
      'REPORT_ID=REPORT_ID'
      'REPORT_NAME=REPORT_NAME')
    DataSource = srcContract
    BCDToCurrency = False
    DataSetOptions = []
    Left = 31
    Top = 447
  end
  object frxReport: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42610.955426643510000000
    ReportOptions.LastChange = 42610.955426643510000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnUserFunction = frxReportUserFunction
    Left = 576
    Top = 280
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object qryRead: TpFIBQuery
    Transaction = trReadQ
    Database = dmMain.dbTV
    Left = 638
    Top = 282
  end
  object trReadQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 696
    Top = 280
  end
  object dsRC: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'UPDATE OR INSERT INTO DISTRIB_CONTRACT_REPORTS_CH (CONTRACT_ID, ' +
        'PERIOD, CH_ID, START_CNT, END_CNT, START_SUM, END_SUM, NOTICE)'
      
        'VALUES (:CONTRACT_ID, :PERIOD, :CH_ID, :START_CNT, :END_CNT, :ST' +
        'ART_SUM, :END_SUM, :NOTICE)'
      'MATCHING (CONTRACT_ID, PERIOD, CH_ID);')
    RefreshSQL.Strings = (
      'select'
      '    r.Period'
      '  , r.Contract_Id'
      '  , cc.Ch_Id'
      '  , c.Ch_Name'
      '  , coalesce(rc.Start_Cnt, r.Start_Cnt) Start_Cnt'
      '  , coalesce(rc.End_Cnt, r.End_Cnt) End_Cnt'
      '  , coalesce(rc.Start_Sum, r.Start_Sum) Start_Sum'
      '  , coalesce(rc.End_Sum, r.End_Sum) End_Sum'
      '  from Distrib_Contract_Reports r'
      
        '       inner join Distrib_Contract_Ch cc on (r.Contract_Id = cc.' +
        'Contract_Id)'
      '       inner join Channels c on (c.Ch_Id = cc.Ch_Id)'
      
        '       left outer join Distrib_Contract_Reports_Ch rc on (rc.Per' +
        'iod = r.Period and rc.Contract_Id = r.Contract_Id and rc.Ch_Id =' +
        ' cc.Ch_Id)'
      'where r.Contract_Id = :OLD_Contract_Id '
      '  and r.Period = :OLD_Period '
      '  and cc.Ch_Id = :OLD_Ch_Id                 '
      'order by c.Ch_Name  ')
    SelectSQL.Strings = (
      'select'
      '    r.Period'
      '  , r.Contract_Id'
      '  , cc.Ch_Id'
      '  , c.Ch_Name'
      '  , coalesce(rc.Start_Cnt, r.Start_Cnt) Start_Cnt'
      '  , coalesce(rc.End_Cnt, r.End_Cnt) End_Cnt'
      '  , coalesce(rc.Start_Sum, r.Start_Sum) Start_Sum'
      '  , coalesce(rc.End_Sum, r.End_Sum) End_Sum'
      '  from Distrib_Contract_Reports r'
      
        '       inner join Distrib_Contract_Ch cc on (r.Contract_Id = cc.' +
        'Contract_Id)'
      '       inner join Channels c on (c.Ch_Id = cc.Ch_Id)'
      
        '       left outer join Distrib_Contract_Reports_Ch rc on (rc.Per' +
        'iod = r.Period and rc.Contract_Id = r.Contract_Id and rc.Ch_Id =' +
        ' cc.Ch_Id)'
      
        'where r.Contract_Id = :Contract_Id and r.Period = :Period       ' +
        '          '
      'order by c.Ch_Name  ')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcReport
    Left = 336
    Top = 448
    dcForceMasterRefresh = True
  end
  object srcRC: TDataSource
    DataSet = dsRC
    Left = 336
    Top = 496
  end
  object trWriteQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 753
    Top = 280
  end
  object dsCards: TpFIBDataSet
    DeleteSQL.Strings = (
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    dc.Distributor_Id'
      '  , dc.Card'
      '  , dc.NOTICE'
      '  , o.O_Dateend'
      '  , o.O_DESCRIPTION'
      '  , o.O_NUMERICFIELD as CRYPT'
      '  , o.O_CHECK PLACE'
      '  , c.O_Name CRYPT_NAME'
      '  , o.O_DIMENSION Chip_ID'
      '  , (select'
      '         count(distinct c.Ch_Name)'
      '       from Channel_Src_Param csp'
      '            inner join Channel_Src cs on (csp.Cs_Id = cs.Cs_Id)'
      '            inner join Channels C on (c.Ch_Id = csp.Ch_Id)'
      '       where csp.Card_Id = o.O_ID'
      '             and not csp.Card_Id is null) as CH_COUNT'
      '  from Distrib_Cards dc'
      
        '       inner join OBJECTS o on (o.O_Name = dc.Card and o.O_TYPE ' +
        '= 44 and o.O_DELETED = 0)'
      
        '       left outer join OBJECTS C on (c.O_Id = o.O_Numericfield a' +
        'nd c.O_TYPE = 43)'
      '  where dc.Distributor_Id = :Id'
      '  order by o.O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 416
    Top = 448
  end
  object srcCards: TDataSource
    AutoEdit = False
    DataSet = dsCards
    Left = 416
    Top = 496
  end
end
