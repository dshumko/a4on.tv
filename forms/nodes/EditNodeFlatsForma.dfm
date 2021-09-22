object edtNodeFlats: TedtNodeFlats
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1050#1074#1072#1088#1090#1080#1088#1099' '#1091#1079#1083#1072
  ClientHeight = 349
  ClientWidth = 776
  Color = clBtnFace
  DoubleBuffered = True
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
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 29
    Width = 776
    Height = 279
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object spl1: TSplitter
      Left = 481
      Top = 0
      Height = 279
    end
    object pnl2: TPanel
      Left = 0
      Top = 0
      Width = 481
      Height = 279
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object lblOn: TLabel
        Left = 0
        Top = 0
        Width = 481
        Height = 13
        Align = alTop
        Caption = #1050#1074#1072#1088#1090#1080#1088#1099' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1085#1099#1077' '#1082' '#1091#1079#1083#1091
      end
      object dbgOn: TDBGridEh
        Left = 0
        Top = 13
        Width = 444
        Height = 266
        Align = alClient
        AllowedOperations = [alopUpdateEh, alopDeleteEh]
        DataSource = srcOn
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        SearchPanel.Enabled = True
        STFilter.Local = True
        STFilter.Visible = True
        TabOrder = 0
        OnDblClick = dbgOnDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STREET_NAME'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1059#1083#1080#1094#1072
            Title.TitleButton = True
            Width = 102
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOUSE_NO'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1086#1084
            Title.TitleButton = True
            Width = 41
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLAT_NO'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1050#1074#1072#1088#1090#1080#1088#1072
            Title.TitleButton = True
            Width = 38
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'PORCH_N'
            Footers = <>
            Title.Caption = #1055#1086#1076#1098#1077#1079#1076
            Title.Hint = #1052#1086#1078#1085#1086' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
            Title.TitleButton = True
            Width = 33
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLOOR_N'
            Footers = <>
            Title.Caption = #1069#1090#1072#1078
            Title.Hint = #1052#1086#1078#1085#1086' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
            Title.TitleButton = True
            Width = 30
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.Hint = #1052#1086#1078#1085#1086' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
            Width = 159
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnl3: TPanel
        Left = 444
        Top = 13
        Width = 37
        Height = 266
        Align = alRight
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object btnUGAdd: TSpeedButton
          Left = 2
          Top = 2
          Width = 33
          Height = 60
          Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1074' '#1075#1088#1091#1087#1087#1091
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
          OnClick = btnUGAddClick
        end
        object btnUGremove: TSpeedButton
          Left = 2
          Top = 204
          Width = 33
          Height = 60
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1080#1079' '#1075#1088#1091#1087#1087#1099
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
          OnClick = btnUGremoveClick
        end
      end
    end
    object pnl4: TPanel
      Left = 484
      Top = 0
      Width = 292
      Height = 279
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object lblOff: TLabel
        Left = 0
        Top = 0
        Width = 292
        Height = 13
        Align = alTop
        Caption = #1057#1074#1086#1073#1086#1076#1085#1099#1077' '#1082#1074#1072#1088#1090#1080#1088#1099
      end
      object dbgOff: TDBGridEh
        Left = 0
        Top = 13
        Width = 292
        Height = 266
        Align = alClient
        AllowedOperations = []
        DataSource = srcOff
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        ReadOnly = True
        SearchPanel.Enabled = True
        STFilter.Local = True
        STFilter.Visible = True
        TabOrder = 0
        OnDblClick = dbgOffDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STREET_NAME'
            Footers = <>
            Title.Caption = #1059#1083#1080#1094#1072
            Title.TitleButton = True
            Width = 120
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOUSE_NO'
            Footers = <>
            Title.Caption = #1044#1086#1084
            Title.TitleButton = True
            Width = 41
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLAT_NO'
            Footers = <>
            Title.Caption = #1050#1074#1072#1088#1090#1080#1088#1072
            Title.TitleButton = True
            Width = 36
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'PORCH_N'
            Footers = <>
            Title.Caption = #1055#1086#1076#1098#1077#1079#1076
            Title.TitleButton = True
            Width = 30
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLOOR_N'
            Footers = <>
            Title.Caption = #1069#1090#1072#1078
            Title.TitleButton = True
            Width = 32
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object pnl5: TPanel
    Left = 0
    Top = 308
    Width = 776
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      776
      41)
    object btnOk: TBitBtn
      Left = 416
      Top = 6
      Width = 354
      Height = 29
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object pnl6: TPanel
    Left = 0
    Top = 0
    Width = 776
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object chkHouse: TDBCheckBoxEh
      Left = 20
      Top = 7
      Width = 121
      Height = 17
      Hint = #1050#1074#1072#1088#1090#1080#1088#1099' '#1080#1079' '#1082#1072#1088#1090#1099' '#1076#1086#1084#1072
      Caption = #1044#1086#1084' '#1080#1079' '#1082#1072#1088#1090#1099
      Checked = True
      DynProps = <>
      State = cbChecked
      TabOrder = 0
      OnClick = chkPorchClick
    end
    object chkPorch: TDBCheckBoxEh
      Left = 168
      Top = 7
      Width = 181
      Height = 17
      Hint = #1058#1086#1083#1100#1082#1086' '#1087#1086#1076#1098#1077#1079#1076' / '#1101#1090#1072#1078' '#1091#1079#1083#1072' '#1080#1079' '#1082#1072#1088#1090#1099' '#1076#1086#1084#1072
      Caption = #1055#1086#1076#1098#1077#1079#1076' / '#1101#1090#1072#1078' '#1091#1079#1083#1072' '#1080#1079' '#1082#1072#1088#1090#1099
      Checked = True
      DynProps = <>
      State = cbChecked
      TabOrder = 1
      OnClick = chkPorchClick
    end
    object chkAllHouse: TDBCheckBoxEh
      Left = 361
      Top = 7
      Width = 203
      Height = 17
      Hint = #1042#1089#1077' '#1082#1074#1072#1088#1090#1080#1088#1099' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1072#1073#1086#1085#1077#1085#1090#1086#1074', '#1072' '#1085#1077' '#1080#1079' '#1082#1072#1088#1090#1099' '#1076#1086#1084#1072
      Caption = #1044#1086#1084' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      DynProps = <>
      TabOrder = 2
      OnClick = chkPorchClick
    end
  end
  object dsOn: TpFIBDataSet
    UpdateSQL.Strings = (
      'execute block ('
      '    Node_Id  UID = :Node_Id,'
      '    House_Id UID = :House_Id,'
      '    Flat_No  D_Flat_Ns = :Flat_No,'
      '    Notice   D_Notice = :Notice,'
      '    Porch_N  D_Varch10_Ns = :Porch_N,'
      '    Floor_N  D_Varch10_Ns = :Floor_N)'
      'as'
      'begin'
      '  update Node_Flats nf'
      '  set Notice = :Notice'
      '  where Node_Id = :node_id'
      '        and House_Id = :House_ID'
      '        and Flat_No = :Flat_No;'
      ''
      
        '  execute procedure Set_Flat_Pf(:House_Id, :Flat_No, :Porch_N, :' +
        'Floor_N);'
      'end')
    DeleteSQL.Strings = (
      'delete from Node_Flats'
      'where House_Id = :OLD_HOUSE_ID'
      '    and Flat_No = :OLD_FLAT_NO'
      '    '
      '')
    InsertSQL.Strings = (
      'update or insert into Node_Flats (Node_Id, House_Id, Flat_No)'
      'values (:Node_Id, :House_Id, :Flat_No)'
      'matching (Node_Id, House_Id, Flat_No)')
    RefreshSQL.Strings = (
      'select'
      '    nF.House_Id'
      '    , nf.Flat_No'
      '    , f.Porch_N'
      '    , f.Floor_N'
      '    , nf.NODE_ID'
      '    , s.Street_Name||'#39' '#39'||s.Street_Short as Street_Name'
      '    , h.House_No'
      '    , nf.Notice'
      '  from node_flats NF'
      '       inner join house h on (nf.House_Id = h.House_Id)'
      '       inner join street s on (s.Street_Id = h.Street_Id)'
      
        '       left outer join houseflats f on (f.House_Id  = nf.House_I' +
        'd and f.Flat_No = nf.Flat_No)'
      '  where NF.HOUSE_ID = :OLD_HOUSE_ID'
      '    and NF.FLAT_NO = :OLD_FLAT_NO'
      '    and NF.NODE_ID = :OLD_NODE_ID'
      '  '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    nF.House_Id'
      '    , nf.Flat_No'
      '    , f.Porch_N'
      '    , f.Floor_N'
      '    , nf.NODE_ID'
      '    , s.Street_Name||'#39' '#39'||s.Street_Short as Street_Name'
      '    , h.House_No'
      '    , nf.Notice'
      '  from node_flats NF'
      '       inner join house h on (nf.House_Id = h.House_Id)'
      '       inner join street s on (s.Street_Id = h.Street_Id)'
      
        '       left outer join houseflats f on (f.House_Id  = nf.House_I' +
        'd and f.Flat_No = nf.Flat_No)'
      '  where nf.NODE_ID = :NODE_ID'
      '  order by f.porch_n, f.Floor_N, nf.Flat_No')
    AutoCalcFields = False
    BeforePost = dsOnBeforePost
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 67
    Top = 149
  end
  object srcOn: TDataSource
    DataSet = dsOn
    Left = 71
    Top = 83
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
    Left = 139
    Top = 90
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
    Left = 139
    Top = 146
  end
  object srcOff: TDataSource
    DataSet = dsOff
    Left = 519
    Top = 179
  end
  object dsOff: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CUSTOMER_FILES'
      'WHERE'
      '        CF_ID = :OLD_CF_ID'
      '    ')
    RefreshSQL.Strings = (
      
        'SELECT T.O_NAME, CF.Cf_Id, cf.Name, cf.Cf_Type, cf.Notice, cf.Cu' +
        'stomer_Id, cf.FILENAME'
      'FROM CUSTOMER_FILES CF'
      
        '   INNER JOIN OBJECTS T ON (CF.Cf_Type = T.O_ID and T.O_TYPE = 3' +
        '3)'
      'where(  CF.Customer_Id = :Customer_ID'
      '     ) and (     CF.CF_ID = :OLD_CF_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      '')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 603
    Top = 181
  end
end
