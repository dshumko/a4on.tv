object RequestWorksForm: TRequestWorksForm
  Left = 519
  Top = 314
  Caption = #1056#1072#1073#1086#1090#1099' '#1074' '#1079#1072#1103#1074#1082#1077
  ClientHeight = 368
  ClientWidth = 749
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
  object Panel2: TPanel
    Left = 0
    Top = 331
    Width = 749
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    inline OkCancelFrame1: TOkCancelFrame
      Left = 0
      Top = 0
      Width = 749
      Height = 37
      Align = alClient
      TabOrder = 0
      TabStop = True
      inherited Label2: TLabel
        Margins.Bottom = 0
      end
      inherited Label1: TLabel
        Margins.Bottom = 0
      end
      inherited bbOk: TBitBtn
        Left = 584
        Top = 6
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Visible = False
        OnClick = OkCancelFrame1bbOkClick
      end
      inherited bbCancel: TBitBtn
        Left = 665
        Top = 6
        Caption = #1047#1072#1082#1088#1099#1090#1100
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 331
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 185
      Top = 0
      Height = 331
    end
    object dbGrid: TDBGridEh
      Left = 188
      Top = 0
      Width = 561
      Height = 331
      Align = alClient
      DataSource = srcDataSource
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghColumnResize, dghColumnMove]
      SearchPanel.Enabled = True
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
          Title.TitleButton = True
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
          Title.TitleButton = True
          Width = 44
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'W_COST'
          Footers = <>
          Title.Caption = #1062#1077#1085#1072' '#1096#1090'./'#1095#1072#1089#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOT_CALC'
          Footers = <>
          Title.Caption = #1053#1077' '#1085#1072#1095#1080#1089#1083'.'
          Title.TitleButton = True
          Visible = False
          Width = 49
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
          Title.TitleButton = True
          Width = 51
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 146
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object dbGridGroups: TDBGridEh
      Left = 0
      Top = 0
      Width = 185
      Height = 331
      Align = alLeft
      AllowedOperations = []
      DataSource = srcWorkGrps
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleParams.MultiTitle = True
      OnGetCellParams = dbGridGroupsGetCellParams
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RT_NAME'
          Footers = <>
          Title.Caption = #1043#1088#1091#1087#1087#1072
          Title.TitleButton = True
          Width = 73
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RT_NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
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
        'TIME, :W_COST, :NOTICE, 1, :NOT_CALC)')
    DeleteSQL.Strings = (
      
        'execute procedure REQUEST_WORKS_IUD(:RQ_ID, :W_ID, :W_QUANT, :W_' +
        'TIME, :W_COST, :NOTICE, 2)')
    InsertSQL.Strings = (
      
        'execute procedure REQUEST_WORKS_IUD(:RQ_ID, :W_ID, :W_QUANT, :W_' +
        'TIME, :W_COST, :NOTICE, 0, :NOT_CALC)')
    SelectSQL.Strings = (
      'select'
      '    W.W_ID'
      '  , W.NAME'
      '  , R.W_QUANT'
      '  , R.W_TIME'
      '  , W.W_TIME as R_TIME'
      '  , R.NOTICE'
      '  , coalesce(r.NOT_CALC, 0) NOT_CALC'
      
        '  , coalesce(iif(w.As_Service is null, w.W_Cost, iif(coalesce(s.' +
        'Srv_Type_Id, 2) = 2, 0,'
      '    (select'
      '         t.tarif_sum'
      '       from tarif t'
      '       where t.service_id = s.service_id'
      
        '             and coalesce(rq.rq_exec_time, localtimestamp) betwe' +
        'en t.date_from and t.date_to))), 0) W_COST'
      '  from WORKS W'
      '       left outer join REQUEST_WORKS R on (R.W_ID = W.W_ID and'
      '             R.RQ_ID = :RQ_ID)'
      
        '       left outer join services s on (w.as_service = s.service_i' +
        'd)'
      '       left outer join request rq on (r.rq_id = rq.rq_id)'
      '  where W.DELETED = 0'
      
        '        and ((W.RQ_TYPE = :RT_ID) or (cast(:RT_ID as INTEGER) = ' +
        '-1))'
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
      'union all'
      'select -1 rt_id, '#39'  _'#1042#1089#1077' '#1088#1072#1073#1086#1090#1099'_  '#39' rt_name, '#39#39' rt_notice'
      'from rdb$database t'
      'order by 2'
      '')
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
