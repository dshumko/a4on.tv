object MatIncomeDocForm: TMatIncomeDocForm
  Left = 0
  Top = 0
  Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099'. '#1044#1086#1082#1091#1084#1077#1085#1090' '#1087#1088#1080#1093#1086#1076#1072
  ClientHeight = 517
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 825
    Height = 156
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      825
      156)
    object lbl1: TLabel
      Left = 8
      Top = 18
      Width = 66
      Height = 13
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#8470
    end
    object Label1: TLabel
      Left = 612
      Top = 18
      Width = 84
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object lbl2: TLabel
      Left = 8
      Top = 45
      Width = 86
      Height = 13
      Caption = #1055#1088#1080#1093#1086#1076' '#1085#1072' '#1089#1082#1083#1072#1076
    end
    object Label2: TLabel
      Left = 8
      Top = 72
      Width = 61
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object lbl5: TLabel
      Left = 498
      Top = 45
      Width = 57
      Height = 13
      Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    end
    object edtD_N: TDBEditEh
      Left = 100
      Top = 15
      Width = 506
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DOC_N'
      DataSource = srcDoc
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object deD_DATE: TDBDateTimeEditEh
      Left = 702
      Top = 15
      Width = 118
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'DOC_DATE'
      DataSource = srcDoc
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object dbmhD_NOTICE: TDBMemoEh
      Left = 100
      Top = 69
      Width = 720
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcDoc
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 4
      Visible = True
      WantReturns = True
    end
    object lcbWH: TDBLookupComboboxEh
      Left = 100
      Top = 42
      Width = 395
      Height = 21
      DynProps = <>
      DataField = 'WH_ID'
      DataSource = srcDoc
      EmptyDataInfo.Text = #1055#1088#1080#1093#1086#1076' '#1085#1072' '#1089#1082#1083#1072#1076
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcWH
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object btnSave: TButton
      Left = 612
      Top = 125
      Width = 208
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 7
      OnClick = btnSaveClick
    end
    object btnClose: TButton
      Left = 5
      Top = 125
      Width = 125
      Height = 25
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      TabOrder = 6
      TabStop = False
      OnClick = btnCloseClick
    end
    object lcbShipper: TDBLookupComboboxEh
      Left = 559
      Top = 42
      Width = 261
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'SHIPPER'
      DataSource = srcDoc
      EmptyDataInfo.Text = #1055#1086#1089#1090#1072#1074#1097#1080#1082
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcShippers
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object btnOpen: TButton
      Left = 5
      Top = 125
      Width = 125
      Height = 25
      Hint = #1054#1090#1082#1072#1090#1080#1090#1100' '#1079#1072#1082#1088#1099#1090#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Caption = #1054#1090#1084#1077#1085#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      TabOrder = 5
      Visible = False
      OnClick = btnOpenClick
    end
    object pnlFile: TPanel
      Left = 136
      Top = 123
      Width = 393
      Height = 28
      Anchors = [akLeft, akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 8
      DesignSize = (
        393
        28)
      object edtFILE: TDBEditEh
        Left = 1
        Top = 4
        Width = 308
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EditButtons = <
          item
            Hint = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
            Style = ebsEllipsisEh
            OnClick = edtFILEEditButtons0Click
          end>
        EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1092#1072#1081#1083
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
      object btnScaner: TButton
        Left = 315
        Top = 4
        Width = 75
        Height = 21
        Hint = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1092#1072#1081#1083' '#1080' '#1089#1086#1093#1088#1072#1085#1080#1090#1100
        Anchors = [akTop, akRight]
        Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100
        TabOrder = 1
        OnClick = btnScanerClick
      end
    end
    object btnOpenFile: TButton
      Left = 531
      Top = 127
      Width = 75
      Height = 21
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1092#1072#1081#1083
      Anchors = [akTop, akRight]
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100
      TabOrder = 9
      OnClick = btnOpenFileClick
    end
  end
  object pnlMat: TPanel
    Left = 0
    Top = 156
    Width = 825
    Height = 361
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlMatAdd: TPanel
      Left = 0
      Top = 0
      Width = 825
      Height = 140
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        825
        140)
      object lbl3: TLabel
        Left = 8
        Top = 8
        Width = 50
        Height = 13
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083
      end
      object Label3: TLabel
        Left = 8
        Top = 58
        Width = 61
        Height = 13
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      end
      object lblDem: TLabel
        Left = 8
        Top = 33
        Width = 35
        Height = 13
        Caption = #1050#1086#1083'-'#1074#1086
      end
      object lbl6: TLabel
        Left = 170
        Top = 33
        Width = 56
        Height = 13
        Caption = #1062#1077#1085#1072' '#1087#1086#1089#1090'.'
      end
      object lbl4: TLabel
        Left = 556
        Top = 33
        Width = 82
        Height = 13
        Caption = 'N '#1087#1086#1079#1080#1094#1080#1080' '#1074' '#1058#1058#1053
      end
      object lbl7: TLabel
        Left = 365
        Top = 33
        Width = 51
        Height = 13
        Caption = #1080#1083#1080' '#1048#1090#1086#1075#1086
      end
      object edtMaterial: TDBEditEh
        Left = 75
        Top = 5
        Width = 745
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <
          item
            Name = 'ID'
          end
          item
            Name = 'NAME'
          end>
        EditButtons = <
          item
            DropDownFormParams.Align = daLeft
            DropDownFormParams.DropDownFormClassName = 'TMaterialsSelect'
            DropDownFormParams.PassParams = pspCustomValuesEh
          end>
        EmptyDataInfo.Text = #1052#1072#1090#1077#1088#1080#1072#1083
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnCloseDropDownForm = edtMaterialCloseDropDownForm
        OnEnter = edtMaterialEnter
        OnOpenDropDownForm = edtMaterialOpenDropDownForm
      end
      object edtQuant: TDBNumberEditEh
        Left = 75
        Top = 30
        Width = 85
        Height = 21
        DynProps = <>
        EmptyDataInfo.Text = #1050#1086#1083'-'#1074#1086
        EditButton.Visible = True
        EditButtons = <>
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object memNotice: TDBMemoEh
        Left = 75
        Top = 55
        Width = 745
        Height = 50
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        ShowHint = True
        TabOrder = 5
        Visible = True
        WantReturns = True
      end
      object btnAdd: TButton
        Left = 75
        Top = 110
        Width = 745
        Height = 25
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 6
        OnClick = btnAddClick
      end
      object edtShipper: TDBNumberEditEh
        Left = 236
        Top = 30
        Width = 121
        Height = 21
        Hint = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        DecimalPlaces = 3
        DynProps = <>
        EmptyDataInfo.Text = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        EditButton.Visible = True
        EditButtons = <>
        ShowHint = True
        TabOrder = 2
        Visible = True
      end
      object btnDel: TBitBtn
        Left = 5
        Top = 110
        Width = 25
        Height = 25
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091' '#1089' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1084
        Anchors = [akLeft, akBottom]
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000008C98D6FF00000000000000000000000000000000000000000000
          000000000000000000008390D5FF000000000000000000000000000000000000
          00008693D6FF324BCCFF3C53CDFF000000000000000000000000000000000000
          000000000000455BCEFF324BCCFF7484D3FF000000000000000000000000909C
          D7FF324BCCFF324BCCFF324BCCFF3C53CDFF0000000000000000000000000000
          0000455BCEFF324BCCFF324BCCFF324BCCFF808ED5FF00000000000000000000
          00004359CEFF324BCCFF324BCCFF324BCCFF3C53CDFF0000000000000000455B
          CEFF324BCCFF324BCCFF324BCCFF3F56CDFF0000000000000000000000000000
          0000000000004359CEFF324BCCFF324BCCFF324BCCFF3C53CDFF445ACEFF324B
          CCFF324BCCFF324BCCFF3F56CDFF000000000000000000000000000000000000
          000000000000000000004359CEFF324BCCFF324BCCFF324BCCFF324BCCFF324B
          CCFF324BCCFF3F56CDFF00000000000000000000000000000000000000000000
          00000000000000000000000000004359CEFF324BCCFF324BCCFF324BCCFF324B
          CCFF3F56CDFF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000455BCEFF324BCCFF324BCCFF324BCCFF324B
          CCFF3C53CDFF0000000000000000000000000000000000000000000000000000
          00000000000000000000455BCEFF324BCCFF324BCCFF324BCCFF324BCCFF324B
          CCFF324BCCFF3C53CDFF00000000000000000000000000000000000000000000
          000000000000455BCEFF324BCCFF324BCCFF324BCCFF3F56CDFF4359CEFF324B
          CCFF324BCCFF324BCCFF3C53CDFF000000000000000000000000000000000000
          0000455BCEFF324BCCFF324BCCFF324BCCFF3F56CDFF00000000000000004359
          CEFF324BCCFF324BCCFF324BCCFF3C53CDFF000000000000000000000000ABB2
          DAFF354DCCFF324BCCFF324BCCFF3F56CDFF0000000000000000000000000000
          00004359CEFF324BCCFF324BCCFF344CCCFFA4ACD9FF00000000000000000000
          0000A7AFDAFF354DCCFF3F56CDFF000000000000000000000000000000000000
          0000000000004359CEFF344CCCFFA2ABD9FF0000000000000000000000000000
          000000000000A9B1DAFF00000000000000000000000000000000000000000000
          00000000000000000000A6AED9FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        TabOrder = 7
        TabStop = False
        OnClick = btnDelClick
      end
      object ednTTN: TDBNumberEditEh
        Left = 644
        Top = 30
        Width = 93
        Height = 21
        Hint = #1053#1086#1084#1077#1088' '#1087#1086' '#1087#1086#1088#1103#1076#1082#1091' '#1074' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
        DecimalPlaces = 0
        DynProps = <>
        EmptyDataInfo.Text = #1085#1086#1084#1077#1088' '#1087#1087
        EditButton.DefaultAction = True
        EditButtons = <>
        ShowHint = True
        TabOrder = 4
        Visible = True
      end
      object ednItogo: TDBNumberEditEh
        Left = 429
        Top = 30
        Width = 121
        Height = 21
        Hint = #1044#1083#1103' '#1088#1072#1089#1095#1077#1090#1072' '#1094#1077#1085#1099' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        DecimalPlaces = 3
        DynProps = <>
        EmptyDataInfo.Text = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1080#1090#1086#1075#1086
        EditButton.Visible = True
        EditButtons = <>
        ShowHint = True
        TabOrder = 3
        Visible = True
      end
      object btnUNIT: TButton
        Left = 745
        Top = 30
        Width = 75
        Height = 21
        Action = actUNITS
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
      end
    end
    object pnlGrids: TPanel
      Left = 0
      Top = 140
      Width = 825
      Height = 221
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object dbgDocMat: TDBGridEh
        Left = 0
        Top = 0
        Width = 822
        Height = 221
        Align = alClient
        AllowedOperations = [alopUpdateEh, alopDeleteEh]
        DataSource = srcDocMat
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        PopupMenu = pmGrid
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnDblClick = dbgDocMatDblClick
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'TTN'
            Footers = <>
            Title.Caption = #8470#1087#1087
            Title.TitleButton = True
            Width = 35
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footer.ValueType = fvtCount
            Footers = <>
            ReadOnly = True
            Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
            Title.TitleButton = True
            Width = 193
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = '###,##0.#####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_QUANT'
            Footer.DisplayFormat = ',#0.###'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Title.TitleButton = True
            Width = 68
            OnGetCellParams = dbgDocMatColumns2GetCellParams
          end
          item
            CellButtons = <>
            DisplayFormat = ',#0.###'
            DynProps = <>
            EditButtons = <>
            FieldName = 'SHIPPER_COST'
            Footer.DisplayFormat = ',#0.###'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
            Width = 74
          end
          item
            CellButtons = <>
            DisplayFormat = ',#0.###'
            DynProps = <>
            EditButtons = <>
            FieldName = 'COST'
            Footer.DisplayFormat = ',#0.###'
            Footer.ValueType = fvtSum
            Footers = <>
            ReadOnly = True
            Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
            Width = 69
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'MG_NAME'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1043#1088#1091#1087#1087#1072
            Title.TitleButton = True
            Width = 83
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_NUMBER'
            Footers = <>
            Title.Caption = #1053#1086#1084'. '#1085#1086#1084#1077#1088
            Title.TitleButton = True
            Width = 71
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_NOTICE'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 137
          end
          item
            CellButtons = <>
            DisplayFormat = ',#0.###'
            DynProps = <>
            EditButtons = <>
            FieldName = 'WH_COST'
            Footer.DisplayFormat = ',#0.###'
            Footers = <>
            Title.Caption = #1062#1077#1085#1072' '#1085#1072' '#1089#1082#1083#1072#1076#1077
            Width = 57
          end
          item
            CellButtons = <>
            DisplayFormat = ',#0.###'
            DynProps = <>
            EditButtons = <>
            FieldName = 'WH_PRICE'
            Footer.DisplayFormat = ',#0.###'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1085#1072' '#1089#1082#1083#1072#1076#1077
            Width = 73
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Splitter: TRxSplitter
        Left = 822
        Top = 0
        Width = 3
        Height = 221
        Align = alRight
      end
    end
  end
  object dsDoc: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE MATERIAL_DOCS'
      'SET '
      '    DOC_N = :DOC_N,'
      '    DOC_DATE = :DOC_DATE,'
      '    DT_ID = :DT_ID,'
      '    NOTICE = :NOTICE,'
      '    WH_ID = :WH_ID,'
      '    SHIPPER = :SHIPPER'
      'WHERE'
      '    DOC_ID = :OLD_DOC_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    MATERIAL_DOCS'
      'WHERE'
      '        DOC_ID = :OLD_DOC_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO MATERIAL_DOCS('
      '    DOC_ID,'
      '    DOC_N,'
      '    DOC_DATE,'
      '    DT_ID,'
      '    NOTICE,'
      '    WH_ID,'
      '    SHIPPER'
      ')'
      'VALUES('
      '    :DOC_ID,'
      '    :DOC_N,'
      '    :DOC_DATE,'
      '    :DT_ID,'
      '    :NOTICE,'
      '    :WH_ID,'
      '    :SHIPPER'
      ')')
    RefreshSQL.Strings = (
      'select'
      
        '    Doc_Id, Doc_N, Doc_Date, Dt_Id, Notice, Wh_Id, SHIPPER, coal' +
        'esce(Doc_Closed, 0) Doc_Closed'
      '  from MATERIAL_DOCS d'
      '  where d.DOC_ID = :OLD_DOC_ID'
      ''
      '  ')
    SelectSQL.Strings = (
      'select'
      '    Doc_Id'
      '  , Doc_N'
      '  , Doc_Date'
      '  , Dt_Id'
      '  , d.Notice'
      '  , Wh_Id'
      '  , SHIPPER'
      '  , coalesce(Doc_Closed, 0) Doc_Closed'
      '  , b.Bl_Id'
      '  , b.Bl_Name'
      '  from MATERIAL_DOCS d'
      
        '       left outer join Blob_Tbl b on (b.Owner_Id = d.Doc_Id and ' +
        'b.Bl_Type = 3)'
      '  where d.Dt_Id = :DocumentType'
      '        and d.DOC_ID = :DOC_ID')
    AutoUpdateOptions.UpdateTableName = 'MATERIAL_DOCS'
    AutoUpdateOptions.KeyFields = 'DOC_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AfterOpen = dsDocAfterOpen
    OnNewRecord = dsDocNewRecord
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 32
    Top = 288
  end
  object dsDocMat: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE MATERIALS_IN_DOC'
      'SET '
      '    M_QUANT = :M_QUANT,'
      '    M_NOTICE = :M_NOTICE,'
      '    SHIPPER_COST = :SHIPPER_COST,'
      '    TTN = :TTN'
      'WHERE'
      '        ID = :OLD_ID'
      '    and M_ID = :OLD_M_ID'
      '    and DOC_ID = :OLD_DOC_ID   '
      '    ')
    DeleteSQL.Strings = (
      'execute block ('
      '    O_ID       integer = :OLD_ID,'
      '    O_M_ID     integer = :OLD_M_ID,'
      '    O_DOC_ID   integer = :OLD_DOC_ID,'
      '    OLD_Serial D_SERIAL = :OLD_Serial)'
      'as'
      'begin'
      '  -- '#1091#1076#1072#1083#1080#1084' '#1090#1086#1083#1100#1082#1086' '#1077#1089#1083#1080' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1077' '#1079#1072#1082#1088#1099#1090
      '  if (exists(select'
      '                 Doc_Closed'
      '               from Material_Docs'
      '               where Doc_Id = :O_DOC_ID'
      '                     and Doc_Closed = 0'
      ''
      '      )) then begin'
      ''
      '    OLD_Serial = coalesce(OLD_Serial, '#39#39');'
      ''
      '    delete from MATERIALS_IN_DOC'
      '        where ID = :O_ID'
      '              and M_ID = :O_M_ID'
      '              and DOC_ID = :O_DOC_ID;'
      '    if (not OLD_Serial is null) then begin'
      '      update MATERIAL_UNIT u'
      '      set u.State = 0'
      '      where M_Id = :O_M_ID'
      '            and SERIAL = :OLD_Serial'
      '            and u.State = -1 * :O_DOC_ID'
      '            and exists(select'
      '                           d.Wh_Id'
      '                         from Material_Docs d'
      '                         where d.Doc_Id = :O_DOC_ID'
      '                               and d.Wh_Id = u.Owner);'
      ''
      '      delete from Materials_In_Doc_Unit'
      '          where (Doc_Id = :O_DOC_ID)'
      '                and (M_Id = :O_M_ID)'
      '                and (SERIAL = :OLD_Serial);'
      ''
      '    end'
      '  end'
      'end')
    InsertSQL.Strings = (
      'INSERT INTO MATERIALS_IN_DOC('
      '    ID, '
      '    M_ID,'
      '    M_QUANT,'
      '    M_NOTICE,'
      '    DOC_ID,'
      '    SHIPPER_COST,'
      '    TTN'
      ')'
      'VALUES('
      '    :ID,'
      '    :M_ID,'
      '    :M_QUANT,    '
      '    :M_NOTICE,'
      '    :DOC_ID,'
      '    :SHIPPER_COST,'
      '    :TTN'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    md.ID'
      '  , md.M_Id'
      '  , m.Name'
      '  , md.M_Quant'
      '  , md.M_Notice'
      '  , g.Mg_Name'
      '  , md.Doc_Id'
      '  , md.SHIPPER_COST'
      '  , md.M_Quant * md.SHIPPER_COST as COST'
      '  , md.TTN  '
      '  , m.Cost WH_COST'
      '  , md.M_Quant * m.Cost as WH_PRICE  '
      '  from materials m'
      '       inner join Materials_In_Doc md on (m.M_Id = md.M_Id)'
      '       left outer join Materials_Group g on (m.Mg_Id = g.Mg_Id)'
      'WHERE'
      '        md.ID = :OLD_ID'
      '    and md.M_ID = :OLD_M_ID'
      '    and md.DOC_ID = :OLD_DOC_ID')
    SelectSQL.Strings = (
      'select'
      '    md.ID'
      '  , md.M_Id'
      '  , m.Name'
      '  , m.M_NUMBER  '
      '  , md.M_Quant'
      '  , md.M_Notice'
      '  , g.Mg_Name'
      '  , md.Doc_Id'
      '  , md.SHIPPER_COST'
      '  , md.M_Quant * md.SHIPPER_COST as COST'
      '  , md.TTN'
      '  , m.Cost WH_COST'
      '  , md.M_Quant * m.Cost as WH_PRICE'
      '  , m.IS_UNIT'
      '  from materials m'
      '       inner join Materials_In_Doc md on (m.M_Id = md.M_Id)'
      '       left outer join Materials_Group g on (m.Mg_Id = g.Mg_Id)'
      '  where md.Doc_Id = :doc_id'
      '  order by md.TTN, m.Name  ')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_IN_DOC'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcDoc
    Left = 112
    Top = 289
  end
  object srcDoc: TDataSource
    DataSet = dsDoc
    OnStateChange = srcDocStateChange
    Left = 24
    Top = 336
  end
  object srcDocMat: TDataSource
    DataSet = dsDocMat
    OnDataChange = srcDocMatDataChange
    Left = 168
    Top = 288
  end
  object dsFindMat: TpFIBDataSet
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 224
    Top = 265
  end
  object dsMaterials: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    m.*, g.Mg_Name'
      '  from materials m'
      '       left outer join Materials_Group g on (m.Mg_Id = g.Mg_Id)'
      '  where m.Deleted = 0'
      '  order by m.Name, g.Mg_Name  ')
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 336
    Top = 240
    oFetchAll = True
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
    Left = 216
    Top = 406
  end
  object errors: TCnErrorProvider
    DoubleBuffer = False
    Left = 272
    Top = 345
  end
  object dsWH: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID, O_NAME, O_DESCRIPTION'
      '  from OBJECTS o'
      '  where O_TYPE = 10'
      '        and ((exists(select'
      '                         w.wh_id'
      '                       from SYS$USER u'
      
        '                            inner join sys$user_wh w on (w.user_' +
        'id = u.id)'
      '                       where u.ibname = current_user'
      '                             and w.can_edit = 1'
      '                             and w.Wh_Id = o.O_Id))'
      '          or (current_user = '#39'SYSDBA'#39'))'
      ''
      '        and coalesce(o.O_Deleted, 0) = 0'
      '  order by O_NAME')
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 271
    Top = 217
  end
  object srcWH: TDataSource
    AutoEdit = False
    DataSet = dsWH
    Left = 336
    Top = 289
  end
  object qCloseDoc: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select Result from Close_Material_Doc(:Doc_Id) ')
    Left = 760
    Top = 220
  end
  object dsShippers: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID, O_NAME, O_DESCRIPTION'
      '  from OBJECTS o'
      '  where O_TYPE = 29'
      '  order by O_NAME')
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 511
    Top = 209
  end
  object srcShippers: TDataSource
    AutoEdit = False
    DataSet = dsShippers
    Left = 592
    Top = 209
  end
  object qOpenDoc: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select Result from Open_Material_Doc(:Doc_Id) ')
    Left = 696
    Top = 220
  end
  object actList: TActionList
    Left = 344
    Top = 70
    object actDelRecord: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnExecute = actDelRecordExecute
    end
    object actDocOpen: TAction
      Caption = #1054#1090#1084#1077#1085#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
    end
    object actDocClose: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
    end
    object actEditNote: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
      OnExecute = actEditNoteExecute
    end
    object actUNITS: TAction
      Caption = #1057'/'#1053#1086#1084#1077#1088#1072
      Hint = #1054#1090#1082#1091#1088#1099#1090#1100' '#1092#1086#1088#1084#1091' '#1089#1077#1088#1080#1081#1085#1099#1081#1093' '#1085#1086#1084#1077#1088#1086#1074
      Visible = False
      OnExecute = actUNITSExecute
    end
  end
  object pmGrid: TPopupMenu
    Left = 432
    Top = 332
    object miEditNote: TMenuItem
      Action = actEditNote
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object miDelete: TMenuItem
      Action = actDelRecord
    end
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '*.*'
    Left = 432
    Top = 72
  end
  object qReqFile: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select b.Bl_Body from Blob_Tbl b where b.Bl_Id = :Bl_Id')
    Left = 496
    Top = 72
  end
  object qSaveFile: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      
        'UPDATE OR INSERT INTO Blob_Tbl (Bl_Type, Owner_Id, Bl_Name, Bl_B' +
        'ody)'
      'VALUES (:Bl_Type, :Owner_Id, :Bl_Name, :Bl_Body)'
      'matching (Bl_Type, Owner_Id)')
    Left = 552
    Top = 72
  end
  object trReadDS: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 48
    Top = 422
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
    Left = 120
    Top = 428
  end
end
