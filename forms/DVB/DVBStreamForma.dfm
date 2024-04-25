object DVBStreamForm: TDVBStreamForm
  Left = 0
  Top = 0
  ActiveControl = dbgrdGridSC
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'DVB '#1055#1086#1090#1086#1082#1080
  ClientHeight = 487
  ClientWidth = 860
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 452
    Width = 860
    Height = 35
    Align = alBottom
    TabOrder = 2
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 100
      Top = 6
      Width = 672
      Anchors = [akLeft, akRight, akBottom]
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 778
      Top = 6
    end
  end
  object pnlChannels: TPanel
    Left = 0
    Top = 142
    Width = 860
    Height = 310
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object spl1: TSplitter
      Left = 497
      Top = 0
      Height = 310
    end
    object pnlSelected: TPanel
      Left = 0
      Top = 0
      Width = 497
      Height = 310
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object lbl1: TLabel
        Left = 0
        Top = 0
        Width = 117
        Height = 13
        Align = alTop
        Caption = '.:: '#1050#1072#1085#1072#1083#1099' '#1074' '#1087#1086#1090#1086#1082#1077' ::.'
      end
      object dbgrdGridSC: TDBGridEh
        Left = 0
        Top = 13
        Width = 460
        Height = 297
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = srcESC
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        SearchPanel.Enabled = True
        STFilter.Local = True
        SumList.Active = True
        TabOrder = 0
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
            Width = 160
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SID'
            Footers = <>
            Title.TitleButton = True
            Width = 45
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'LCN'
            Footers = <>
            Title.TitleButton = True
            Width = 46
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'TSID'
            Footers = <>
            Title.Hint = 'TSID '#1082#1072#1085#1072#1083#1072', '#1077#1089#1083#1080' '#1086#1090#1083#1080#1095#1072#1077#1090#1089#1103' '#1086#1090' '#1087#1086#1090#1086#1082#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'VPID'
            Footers = <>
            Title.Hint = #1042#1080#1076#1077#1086' '#1087#1080#1076
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BITRATE'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = 'Bitrate'
            Title.Hint = #1057#1082#1086#1088#1086#1089#1090#1100' '#1087#1086#1090#1086#1082#1072
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'APID'
            Footers = <>
            Title.Hint = #1040#1091#1076#1080#1086' '#1087#1080#1076' '#1086#1089#1085#1086#1074#1085#1086#1081' '#1076#1086#1088#1086#1078#1082#1080
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'A2PID'
            Footers = <>
            Title.Hint = #1040#1091#1076#1080#1086' '#1087#1080#1076' '#1074#1090#1086#1088#1086#1081' '#1076#1086#1088#1086#1078#1082#1080', '#1077#1089#1083#1080' '#1077#1089#1090#1100
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DEFINITION'
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Def'
            Title.Hint = #1056#1072#1079#1088#1077#1096#1077#1085#1080#1077' SD HD 4K'
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CNID'
            Footers = <>
            Title.Caption = 'NID'
            Title.Hint = #1045#1089#1083#1080' '#1086#1090#1083#1080#1095#1072#1077#1090#1089#1103' '#1086#1090' '#1089#1077#1090#1077#1074#1086#1075#1086
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CONID'
            Footers = <>
            Title.Caption = 'ONID'
            Title.Hint = #1045#1089#1083#1080' '#1086#1090#1083#1080#1095#1072#1077#1090#1089#1103' '#1086#1090' '#1089#1077#1090#1077#1074#1086#1075#1086
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 86
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnlProgrBtn: TPanel
        Left = 460
        Top = 13
        Width = 37
        Height = 297
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object btnChanAdd: TSpeedButton
          Left = 0
          Top = 0
          Width = 37
          Height = 60
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1082' '#1087#1086#1090#1086#1082#1091
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
          OnClick = btnChanAddClick
        end
        object btnChanRemove: TSpeedButton
          Left = 0
          Top = 237
          Width = 37
          Height = 60
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1080#1079' '#1087#1086#1090#1086#1082#1072
          Align = alBottom
          Flat = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3
            783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB177
            3EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00FFB3783FB3783E
            B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
            3EB3783EB1773EFF00FFB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3
            783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB1773EB3783FB3783E
            B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
            3EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB177
            3EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFB3783EB3783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3783EB3783EB1773EFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3783EB3
            783EB3783EB1773EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          OnClick = btnChanRemoveClick
        end
      end
    end
    object pnl3: TPanel
      Left = 500
      Top = 0
      Width = 360
      Height = 310
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object lbl2: TLabel
        Left = 0
        Top = 0
        Width = 150
        Height = 13
        Align = alTop
        Caption = '.:: '#1055#1077#1088#1077#1095#1077#1085#1100' '#1074#1089#1077#1093' '#1082#1072#1085#1072#1083#1086#1074' ::.'
      end
      object dbgrdGridC: TDBGridEh
        Left = 0
        Top = 13
        Width = 360
        Height = 297
        Align = alClient
        AllowedOperations = []
        DataSource = srcC
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ReadOnly = True
        SearchPanel.Enabled = True
        STFilter.Local = True
        TabOrder = 0
        OnDblClick = dbgrdGridCDblClick
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CH_NUMBER'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088
            Title.TitleButton = True
            Width = 43
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CH_NAME'
            Footers = <>
            Title.Caption = #1050#1072#1085#1072#1083
            Title.TitleButton = True
            Width = 147
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DEFINITION'
            Footers = <>
            Title.Caption = 'DEF'
            Title.TitleButton = True
            Width = 37
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CH_NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 57
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 142
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      860
      142)
    object Label2: TLabel
      Left = 10
      Top = 11
      Width = 84
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FocusControl = DBEdit2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 39
      Top = 255
      Width = 55
      Height = 13
      Caption = 'HOUSE_NO'
    end
    object DBEdit2: TDBEditEh
      Left = 100
      Top = 8
      Width = 753
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NAME'
      DataSource = srcES
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1090#1086#1082#1072
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dbmNotice: TDBMemoEh
      Left = 425
      Top = 41
      Width = 428
      Height = 95
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcES
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 3
      Visible = True
      WantReturns = True
    end
    object grpEPG: TGroupBox
      Left = 227
      Top = 35
      Width = 193
      Height = 105
      Caption = ' EPG '
      TabOrder = 2
      object Label4: TLabel
        Left = 11
        Top = 63
        Width = 32
        Height = 13
        Caption = 'Bitrate'
      end
      object Label5: TLabel
        Left = 11
        Top = 39
        Width = 20
        Height = 13
        Caption = 'Port'
      end
      object Label6: TLabel
        Left = 11
        Top = 15
        Width = 10
        Height = 13
        Caption = 'IP'
      end
      object chkAOSTRM: TDBCheckBoxEh
        Left = 11
        Top = 84
        Width = 181
        Height = 17
        Hint = #1055#1077#1088#1077#1076#1072#1074#1072#1090#1100' '#1090#1077#1083#1077#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1076#1083#1103' '#1074#1089#1077#1093' '#1087#1086#1090#1086#1082#1086#1074' (EIT other)'
        Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' EIT other'
        DataField = 'AOSTRM'
        DataSource = srcES
        DynProps = <>
        TabOrder = 3
      end
      object DBNumberEditEh1: TDBNumberEditEh
        Left = 56
        Top = 60
        Width = 129
        Height = 21
        DataField = 'BITRATE'
        DataSource = srcES
        DynProps = <>
        EmptyDataInfo.Text = 'EPG Bitrate, '#1050#1041
        EditButton.Visible = True
        EditButtons = <>
        ShowHint = True
        TabOrder = 2
        Visible = True
      end
      object DBNumberEditEh2: TDBNumberEditEh
        Left = 56
        Top = 36
        Width = 129
        Height = 21
        DataField = 'ES_PORT'
        DataSource = srcES
        DecimalPlaces = 0
        DynProps = <>
        EmptyDataInfo.Text = 'EPG mulicast port'
        EditButtons = <>
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object DBEditEh1: TDBEditEh
        Left = 56
        Top = 12
        Width = 129
        Height = 21
        DataField = 'ES_IP'
        DataSource = srcES
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = 'EPG mulicast IP'
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
    end
    object grpDVB: TGroupBox
      Left = 10
      Top = 35
      Width = 211
      Height = 105
      Caption = ' DVB '
      TabOrder = 1
      object Label3: TLabel
        Left = 7
        Top = 63
        Width = 27
        Height = 13
        Caption = 'FREQ'
      end
      object lbl3: TLabel
        Left = 7
        Top = 39
        Width = 23
        Height = 13
        Caption = 'QAM'
      end
      object Label1: TLabel
        Left = 7
        Top = 15
        Width = 23
        Height = 13
        Caption = 'TSID'
      end
      object edTSID: TDBNumberEditEh
        Left = 87
        Top = 12
        Width = 116
        Height = 21
        DataField = 'TSID'
        DataSource = srcES
        DynProps = <>
        EmptyDataInfo.Text = 'TSID'
        EditButtons = <>
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
      object edtQAM: TDBNumberEditEh
        Left = 87
        Top = 36
        Width = 116
        Height = 21
        DataField = 'QAM'
        DataSource = srcES
        DecimalPlaces = 0
        DynProps = <>
        EmptyDataInfo.Text = 'QAM'
        EditButtons = <>
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object edtFREQ: TDBNumberEditEh
        Left = 87
        Top = 60
        Width = 116
        Height = 21
        DataField = 'FREQ'
        DataSource = srcES
        DecimalPlaces = 0
        DynProps = <>
        EmptyDataInfo.Text = 'FREQ'
        EditButtons = <>
        ShowHint = True
        TabOrder = 2
        Visible = True
      end
    end
  end
  object dsESC: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE DVB_STREAM_CHANNELS'
      'SET '
      '    SID = :SID,'
      '    LCN = :LCN,'
      '    TSID = :TSID,'
      '    NOTICE = :NOTICE,'
      '    VPID = :VPID,'
      '    APID = :APID,'
      '    A2PID = :A2PID,'
      '    BITRATE = :BITRATE,'
      '    CNID = :CNID,'
      '    CONID = :CONID        '
      'WHERE'
      '    DVBS_ID = :OLD_DVBS_ID'
      '    and CH_ID = :OLD_CH_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DVB_STREAM_CHANNELS'
      'WHERE'
      '        DVBS_ID = :OLD_DVBS_ID'
      '    and CH_ID = :OLD_CH_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO DVB_STREAM_CHANNELS('
      '    DVBS_ID,'
      '    CH_ID,'
      '    SID,'
      '    LCN,'
      '    TSID,'
      '    NOTICE,'
      '    VPID,'
      '    APID,'
      '    A2PID,'
      '    BITRATE,'
      '    CNID,'
      '    CONID'
      ')'
      'VALUES('
      '    :DVBS_ID,'
      '    :CH_ID,'
      '    :SID,'
      '    :LCN,'
      '    :TSID,'
      '    :NOTICE,'
      '    :VPID,'
      '    :APID,'
      '    :A2PID,'
      '    :BITRATE,'
      '    :CNID,'
      '    :CONID        '
      ')')
    RefreshSQL.Strings = (
      'select'
      '    dc.*'
      '  , c.CH_NAME'
      '  , c.Definition'
      '  from Dvb_Stream_Channels dc'
      '       inner join Channels c on (dc.Ch_Id = c.Ch_Id)'
      '  where DC.DVBS_ID = :OLD_DVBS_ID'
      '    and DC.CH_ID = :OLD_CH_ID')
    SelectSQL.Strings = (
      'select'
      '    dc.*'
      '  , c.CH_NAME'
      '  , c.Definition'
      '  from Dvb_Stream_Channels dc'
      '       inner join Channels c on (dc.Ch_Id = c.Ch_Id)'
      '  where dc.DVBS_Id = :DVBS_id'
      '  order by dc.Sid')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcES
    Left = 246
    Top = 359
    dcForceOpen = True
  end
  object srcESC: TDataSource
    DataSet = dsESC
    Left = 250
    Top = 309
  end
  object dsC: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select c.Ch_Id, c.Ch_Number, c.Ch_Name, c.Definition, c.CH_NOTIC' +
        'E'
      'FROM Channels c'
      
        'where not exists(select hc.ch_id FROM DVB_Stream_Channels hc whe' +
        're hc.ch_id = c.Ch_Id and hc.DVBS_id = :DVBS_ID)'
      'order by c.Ch_Number, c.Ch_Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcES
    Left = 464
    Top = 316
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object srcC: TDataSource
    AutoEdit = False
    DataSet = dsC
    Left = 474
    Top = 370
  end
  object dsES: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE DVB_STREAMS'
      'SET '
      '    NAME = :NAME,'
      '    ES_IP = :ES_IP,'
      '    ES_PORT = :ES_PORT,'
      '    BITRATE = :BITRATE,'
      '    NOTICE = :NOTICE,'
      '    TSID = :TSID,'
      '    QAM = :QAM,'
      '    FREQ = :FREQ,'
      '    AOSTRM = :AOSTRM'
      'WHERE'
      '    DVBS_ID = :OLD_DVBS_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DVB_STREAMS'
      'WHERE'
      '        DVBS_ID = :OLD_DVBS_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO DVB_STREAMS('
      '    DVBN_ID,'
      '    DVBS_ID,'
      '    NAME,'
      '    ES_IP,'
      '    ES_PORT,'
      '    BITRATE,'
      '    NOTICE,'
      '    TSID,'
      '    QAM,'
      '    FREQ,'
      '    AOSTRM'
      ')'
      'VALUES('
      '    :DVBN_ID,'
      '    :DVBS_ID,'
      '    :NAME,'
      '    :ES_IP,'
      '    :ES_PORT,'
      '    :BITRATE,'
      '    :NOTICE,'
      '    :TSID,'
      '    :QAM,'
      '    :FREQ,'
      '    :AOSTRM'
      ')')
    RefreshSQL.Strings = (
      'select s.*'
      'from DVB_Streams s'
      'where S.DVBS_ID = :OLD_DVBS_ID'
      '    ')
    SelectSQL.Strings = (
      'select s.*'
      'from DVB_Streams s'
      'where s.DVBS_Id = :DVBS_ID')
    OnNewRecord = dsESNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 79
    Top = 346
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
    Left = 142
    Top = 259
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
    Left = 201
    Top = 238
  end
  object srcES: TDataSource
    DataSet = dsES
    Left = 127
    Top = 344
  end
  object PropStorageEh: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Width'
      'pnlChannels.pnlSelected.<P>.Width')
    Left = 588
    Top = 296
  end
end
