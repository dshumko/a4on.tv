object IPTVGroupForm: TIPTVGroupForm
  Left = 0
  Top = 0
  ActiveControl = edtNAME
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'IPTV '#1075#1088#1091#1087#1087#1072
  ClientHeight = 487
  ClientWidth = 811
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
    Top = 446
    Width = 811
    Height = 41
    Align = alBottom
    TabOrder = 2
    TabStop = True
    ExplicitTop = 446
    ExplicitWidth = 811
    ExplicitHeight = 41
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 100
      Top = 5
      Width = 623
      Height = 29
      Anchors = [akLeft, akRight, akBottom]
      OnClick = OkCancelFrame1bbOkClick
      ExplicitLeft = 100
      ExplicitTop = 5
      ExplicitWidth = 623
      ExplicitHeight = 29
    end
    inherited bbCancel: TBitBtn
      Left = 729
      Top = 5
      Height = 29
      ExplicitLeft = 729
      ExplicitTop = 5
      ExplicitHeight = 29
    end
  end
  object pnlChannels: TPanel
    Left = 0
    Top = 128
    Width = 811
    Height = 318
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object spl1: TSplitter
      Left = 497
      Top = 0
      Height = 318
      Align = alRight
    end
    object pnlSelected: TPanel
      Left = 0
      Top = 0
      Width = 497
      Height = 318
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object lbl1: TLabel
        Left = 0
        Top = 0
        Width = 116
        Height = 13
        Align = alTop
        Caption = '.:: '#1050#1072#1085#1072#1083#1099' '#1074' '#1075#1088#1091#1087#1087#1077' ::.'
      end
      object dbgrdGridSC: TDBGridEh
        Left = 0
        Top = 13
        Width = 460
        Height = 305
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = srcIGC
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
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'LCN'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088
            Title.TitleButton = True
            Width = 46
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CH_NAME'
            Footer.ValueType = fvtCount
            Footers = <>
            ReadOnly = True
            Title.Caption = #1050#1072#1085#1072#1083
            Title.TitleButton = True
            Width = 129
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CODE'
            Footers = <>
            Title.Caption = #1050#1086#1076
            Title.TitleButton = True
            Width = 88
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'URL'
            Footers = <>
            Title.TitleButton = True
            Width = 83
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DEFINITION'
            Footers = <>
            ReadOnly = True
            Title.Caption = 'Def'
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 97
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnlProgrBtn: TPanel
        Left = 460
        Top = 13
        Width = 37
        Height = 305
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
          Top = 245
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
    object pnlExists: TPanel
      Left = 500
      Top = 0
      Width = 311
      Height = 318
      Align = alRight
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
        Width = 311
        Height = 305
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
            Width = 85
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 811
    Height = 128
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      811
      128)
    object Label2: TLabel
      Left = 8
      Top = 10
      Width = 84
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FocusControl = edtNAME
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
    object Label8: TLabel
      Left = 8
      Top = 36
      Width = 19
      Height = 13
      Caption = 'URL'
    end
    object Label3: TLabel
      Left = 8
      Top = 63
      Width = 61
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object lblCode: TLabel
      Left = 534
      Top = 10
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1050#1086#1076
      FocusControl = edtCODE
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtNAME: TDBEditEh
      Left = 100
      Top = 7
      Width = 421
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NAME'
      DataSource = srcIPTVGroup
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object edtURL: TDBEditEh
      Left = 100
      Top = 33
      Width = 421
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'URL'
      DataSource = srcIPTVGroup
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1072#1076#1088#1077#1089
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object dbmNotice: TDBMemoEh
      Left = 100
      Top = 60
      Width = 704
      Height = 62
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcIPTVGroup
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 4
      Visible = True
      WantReturns = True
    end
    object edtCODE: TDBEditEh
      Left = 568
      Top = 7
      Width = 236
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'CODE'
      DataSource = srcIPTVGroup
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1050#1086#1076' '#1075#1088#1091#1087#1087#1099
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object chkDISABLED: TDBCheckBoxEh
      Left = 568
      Top = 35
      Width = 129
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1075#1088#1091#1087#1087#1091
      DataField = 'DISABLED'
      DataSource = srcIPTVGroup
      DynProps = <>
      TabOrder = 3
    end
  end
  object dsIGC: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE IPTV_GROUP_CHANNELS'
      'SET '
      '    IG_ID = :IG_ID,'
      '    CH_ID = :CH_ID,'
      '    LCN = :LCN,'
      '    CODE = :CODE,'
      '    URL = :URL,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    IG_ID = :OLD_IG_ID'
      '    and CH_ID = :OLD_CH_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    IPTV_GROUP_CHANNELS'
      'WHERE'
      '        IG_ID = :OLD_IG_ID'
      '    and CH_ID = :OLD_CH_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO IPTV_GROUP_CHANNELS('
      '    IG_ID,'
      '    CH_ID,'
      '    LCN,'
      '    CODE,'
      '    URL,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :IG_ID,'
      '    :CH_ID,'
      '    :LCN,'
      '    :CODE,'
      '    :URL,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    gc.*, c.Ch_Name,'
      '    c.Definition'
      '  from Iptv_Group_Channels gc'
      '       inner join Channels c on (gc.Ch_Id = c.Ch_Id)'
      '  where(  gc.Ig_Id = :IG_ID'
      '     ) and (     GC.IG_ID = :OLD_IG_ID'
      '    and GC.CH_ID = :OLD_CH_ID'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      
        '    gc.IG_ID, gc.CH_ID, gc.CODE, gc.URL, gc.LCN, gc.NOTICE, c.Ch' +
        '_Name,'
      '    c.Definition'
      '  from Iptv_Group_Channels gc'
      '       inner join Channels c on (gc.Ch_Id = c.Ch_Id)'
      '  where gc.Ig_Id = :IG_ID'
      '  order by gc.Lcn, c.Ch_Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcIPTVGroup
    Left = 246
    Top = 359
    dcForceOpen = True
  end
  object srcIGC: TDataSource
    DataSet = dsIGC
    Left = 250
    Top = 309
  end
  object dsC: TpFIBDataSet
    SelectSQL.Strings = (
      'select c.Ch_Id, c.Ch_Name, c.Definition, c.CH_NOTICE'
      'FROM Channels c'
      
        'where not exists(select hc.ch_id FROM Iptv_Group_Channels hc whe' +
        're hc.ch_id = c.Ch_Id and hc.Ig_Id = :IG_ID)'
      'order by c.Ch_Number, c.Ch_Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcIPTVGroup
    Left = 640
    Top = 244
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object srcC: TDataSource
    AutoEdit = False
    DataSet = dsC
    Left = 642
    Top = 338
  end
  object dsIPTVGroup: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE IPTV_GROUP'
      'SET '
      '    IG_ID = :IG_ID,'
      '    NAME = :NAME,'
      '    CODE = :CODE,'
      '    URL = :URL,'
      '    Disabled = :Disabled,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    IG_ID = :OLD_IG_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    IPTV_GROUP'
      'WHERE'
      '        IG_ID = :OLD_IG_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO IPTV_GROUP('
      '    IG_ID,'
      '    NAME,'
      '    CODE,'
      '    URL,'
      '    Disabled,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :IG_ID,'
      '    :NAME,'
      '    :CODE,'
      '    :URL,'
      '    :Disabled,    '
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select *'
      'from Iptv_Group g'
      'where(  g.Ig_Id = :Ig_Id'
      '     ) and (     G.IG_ID = :OLD_IG_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select *'
      'from Iptv_Group g'
      'where g.Ig_Id = :Ig_Id')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 87
    Top = 210
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
    Left = 78
    Top = 339
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
    Left = 153
    Top = 350
  end
  object srcIPTVGroup: TDataSource
    DataSet = dsIPTVGroup
    Left = 183
    Top = 216
  end
  object PropStorageEh: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'pnlChannels.pnlExists.<P>.Width')
    Left = 314
    Top = 75
  end
end
