object RequestWorksForm: TRequestWorksForm
  Left = 519
  Top = 314
  ActiveControl = cbAllMaterials
  Caption = #1056#1072#1073#1086#1090#1099' '#1074' '#1079#1072#1103#1074#1082#1077
  ClientHeight = 368
  ClientWidth = 663
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 663
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object cbAllMaterials: TCheckBox
      Left = 5
      Top = 0
      Width = 212
      Height = 22
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1089#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1099'. '#1041#1077#1079' '#1091#1095#1077#1090#1072' '#1075#1088#1091#1087#1087'.'
      Caption = #1042#1089#1077' '#1088#1072#1073#1086#1090#1099
      TabOrder = 0
      OnClick = cbAllMaterialsClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 331
    Width = 663
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    inline OkCancelFrame1: TOkCancelFrame
      Left = 0
      Top = 0
      Width = 663
      Height = 37
      Align = alClient
      TabOrder = 0
      TabStop = True
      ExplicitWidth = 663
      ExplicitHeight = 37
      inherited Label2: TLabel
        Margins.Bottom = 0
      end
      inherited Label1: TLabel
        Margins.Bottom = 0
      end
      inherited bbOk: TBitBtn
        Left = 498
        Top = 6
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Visible = False
        OnClick = OkCancelFrame1bbOkClick
        ExplicitLeft = 498
        ExplicitTop = 6
      end
      inherited bbCancel: TBitBtn
        Left = 579
        Top = 6
        Caption = #1047#1072#1082#1088#1099#1090#1100
        ExplicitLeft = 579
        ExplicitTop = 6
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 25
    Width = 663
    Height = 306
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 185
      Top = 0
      Height = 306
      ExplicitHeight = 372
    end
    object dbGrid: TDBGridEh
      Left = 188
      Top = 0
      Width = 475
      Height = 306
      Align = alClient
      DataSource = srcDataSource
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghColumnResize, dghColumnMove]
      SearchPanel.Enabled = True
      SearchPanel.FilterOnTyping = True
      SortLocal = True
      STFilter.Local = True
      STFilter.Visible = True
      TabOrder = 1
      TitleParams.MultiTitle = True
      OnExit = dbGridExit
      OnGetCellParams = dbGridGetCellParams
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'M_ID'
          Footers = <>
          ReadOnly = True
          Visible = False
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
          Width = 150
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#0.#####'
          DynProps = <>
          EditButtons = <>
          FieldName = 'W_QUANT'
          Footers = <>
          Title.Caption = #1050'-'#1074#1086' '#1096#1090'./'#1095
          Width = 44
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'W_COST'
          Footers = <>
          Title.Caption = #1062#1077#1085#1072' '#1096#1090'./'#1095#1072#1089#1072
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'R_TIME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1042#1088#1077#1084#1103'| '#1085#1086#1088#1084'.'
          Width = 51
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 131
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object dbGridGroups: TDBGridEh
      Left = 0
      Top = 0
      Width = 185
      Height = 306
      Align = alLeft
      AllowedOperations = []
      DataSource = srcWorkGrps
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleParams.MultiTitle = True
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RT_NAME'
          Footers = <>
          Title.Caption = #1043#1088#1091#1087#1087#1072
          Width = 73
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RT_NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 85
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object srcDataSource: TDataSource
    DataSet = dsWorks
    Left = 257
    Top = 164
  end
  object dsWorks: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure REQUEST_WORKS_IUD(:RQ_ID, :W_ID, :W_QUANT, :W_' +
        'TIME, :W_COST, :NOTICE, 1)')
    DeleteSQL.Strings = (
      
        'execute procedure REQUEST_WORKS_IUD(:RQ_ID, :W_ID, :W_QUANT, :W_' +
        'TIME, :W_COST, :NOTICE, 2)')
    InsertSQL.Strings = (
      
        'execute procedure REQUEST_WORKS_IUD(:RQ_ID, :W_ID, :W_QUANT, :W_' +
        'TIME, :W_COST, :NOTICE, 0)')
    SelectSQL.Strings = (
      'select'
      '    W.W_ID'
      '  , W.NAME'
      '  , R.W_QUANT'
      '  , R.W_TIME'
      '  , W.W_TIME as R_TIME'
      '  , R.NOTICE'
      
        '  , coalesce(r.w_cost, iif(coalesce(s.Srv_Type_Id, 2) = 2, w.W_C' +
        'ost,'
      '    (select'
      '         t.tarif_sum'
      '       from tarif t'
      '       where t.service_id = s.service_id'
      
        '             and coalesce(rq.rq_exec_time, localtimestamp) betwe' +
        'en t.date_from and t.date_to)), 0) W_COST'
      '  from WORKS W'
      '       left outer join REQUEST_WORKS R on (R.W_ID = W.W_ID and'
      '             R.RQ_ID = :RQ_ID)'
      
        '       left outer join services s on (w.as_service = s.service_i' +
        'd)'
      '       left outer join request rq on (r.rq_id = rq.rq_id)'
      '  where W.DELETED = 0'
      '        and W.RQ_TYPE = :RT_ID'
      '  order by W.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcWorkGrps
    Left = 296
    Top = 115
  end
  object dsWorkGrps: TpFIBDataSet
    SelectSQL.Strings = (
      'select t.rt_id, t.rt_name, t.rt_notice'
      'from request_types t'
      'where RT_DELETED = 0'
      'order by 2')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_GROUP'
    AutoUpdateOptions.KeyFields = 'MG_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 48
    Top = 128
  end
  object srcWorkGrps: TDataSource
    AutoEdit = False
    DataSet = dsWorkGrps
    Left = 48
    Top = 184
  end
  object PropStorage: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 403
    Top = 127
  end
end
