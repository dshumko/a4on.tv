object ReqMatReturnForm: TReqMatReturnForm
  Left = 519
  Top = 314
  ActiveControl = dbGrid
  Caption = #1042#1086#1079#1074#1088#1072#1090' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074' '#1089' '#1079#1072#1103#1074#1082#1080
  ClientHeight = 391
  ClientWidth = 887
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
    Top = 354
    Width = 887
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    inline OkCancelFrame1: TOkCancelFrame
      Left = 0
      Top = 0
      Width = 887
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
        Left = 185
        Width = 456
        Height = 30
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Visible = False
        OnClick = OkCancelFrame1bbOkClick
      end
      inherited bbCancel: TBitBtn
        Left = 647
        Width = 234
        Height = 30
        Caption = #1047#1072#1082#1088#1099#1090#1100
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 887
    Height = 354
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 185
      Top = 0
      Height = 354
    end
    object dbGrid: TDBGridEh
      Left = 188
      Top = 0
      Width = 699
      Height = 354
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataSource = srcDataSource
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghColumnResize, dghColumnMove]
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
          Color = clBtnFace
          DynProps = <>
          EditButtons = <>
          FieldName = 'M_ID'
          Footers = <>
          ReadOnly = True
          Visible = False
        end
        item
          CellButtons = <>
          Color = clBtnFace
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
          Title.TitleButton = True
          Title.SortIndex = 1
          Title.SortMarker = smDownEh
          Width = 151
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          Color = clBtnFace
          DynProps = <>
          EditButtons = <>
          FieldName = 'DIMENSION'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1045#1076'. '#1080#1079#1084'.'
          Width = 37
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#0.#####'
          DynProps = <>
          EditButtons = <>
          FieldName = 'QUANT'
          Footers = <>
          Title.Caption = #1050'-'#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
          Width = 77
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'COST'
          Footer.DisplayFormat = ',#0.##'
          Footer.FieldName = 'ITOG'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1062#1077#1085#1072
          Width = 63
        end
        item
          CellButtons = <>
          Color = clBtnFace
          DynProps = <>
          EditButtons = <>
          FieldName = 'WH_NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1053#1072' '#1089#1082#1083#1072#1076
          Title.TitleButton = True
          Width = 99
        end
        item
          CellButtons = <>
          Color = clBtnFace
          DynProps = <>
          EditButtons = <>
          FieldName = 'M_Number'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1053#1086#1084'. '#1085#1086#1084#1077#1088
          Width = 88
        end
        item
          CellButtons = <>
          Color = clBtnFace
          DynProps = <>
          EditButtons = <>
          FieldName = 'DESCRIPTION'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 212
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object dbGridGroups: TDBGridEh
      Left = 0
      Top = 0
      Width = 185
      Height = 354
      Align = alLeft
      AllowedOperations = []
      DataSource = srcMatGropups
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
          FieldName = 'MG_NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1043#1088#1091#1087#1087#1072
          Width = 84
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MG_NOTICE'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 85
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object srcDataSource: TDataSource
    DataSet = dsReqMaterials
    OnUpdateData = srcDataSourceUpdateData
    Left = 339
    Top = 157
  end
  object dsReqMaterials: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure REQUEST_MATERIALS_RETURN_IUD(:ID, :RQ_ID, :M_I' +
        'D, :QUANT, :WH_ID, :NOTICE, 1, :SERIAL, :COST)  ')
    DeleteSQL.Strings = (
      
        'execute procedure REQUEST_MATERIALS_RETURN_IUD(:ID, :RQ_ID, :M_I' +
        'D, :QUANT, :WH_ID, :NOTICE, 2)  ')
    InsertSQL.Strings = (
      
        'execute procedure REQUEST_MATERIALS_RETURN_IUD(:ID, :RQ_ID, :M_I' +
        'D, :QUANT, :WH_ID, :NOTICE, 0, :SERIAL, :COST)  ')
    RefreshSQL.Strings = (
      'select'
      '    M_Id'
      '  , Name'
      '  , Dimension'
      '  , Wh_Name'
      '  , Wh_Id'
      '  , Quant'
      '  , M_Number'
      '  , Rq_Id'
      '  , Id'
      '  , Description'
      '  , Serial'
      '  , Cost'
      '  , (Quant * Cost) Itog'
      '  from Get_Mat_Take_In(:OLD_Rq_Id, :OLD_Mg_Id, :OLD_Wh_Fltr)'
      '    where '
      '    ('
      '      (not :OLD_ID is null)'
      '      and (ID = :OLD_ID)'
      '    )'
      '    or '
      '    ('
      '          (:OLD_ID is null)'
      '      and (M_Id = :OLD_M_ID)'
      '      and (Wh_Id = :OLD_Wh_Id)'
      
        '      and ((:OLD_Serial is null) or (Serial = :OLD_Serial))     ' +
        '        '
      '    )')
    SelectSQL.Strings = (
      'select'
      '    M_Id'
      '  , Name'
      '  , Dimension'
      '  , Wh_Name'
      '  , Wh_Id'
      '  , Quant'
      '  , M_Number'
      '  , Rq_Id'
      '  , Id'
      '  , Description'
      '  , Serial'
      '  , Cost'
      '  , (Quant * Cost) Itog'
      '  from Get_Mat_Take_In(:Rq_Id, :Mg_Id, :Wh_Fltr)'
      'order by Name, wh_name   ')
    BeforePost = dsReqMaterialsBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcMatGropups
    Left = 234
    Top = 146
  end
  object dsMatGropups: TpFIBDataSet
    SelectSQL.Strings = (
      'select MG_ID, MG_NAME, PARENT_ID, MG_NOTICE'
      'from MATERIALS_GROUP'
      'union'
      
        'select null as MG_ID, '#39'<'#1041#1045#1047' '#1043#1056#1059#1055#1055#1067'>'#39' MG_NAME, null as PARENT_ID,' +
        ' '#39#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1073#1077#1079' '#1075#1088#1091#1087#1087#1099#39' as MG_NOTICE'
      'from RDB$DATABASE'
      'union'
      
        'select -1 as MG_ID, '#39'< '#1042#1057#1045' >'#39' MG_NAME, null as PARENT_ID, '#39#1042#1089#1077' '#1084 +
        #1072#1090#1077#1088#1080#1072#1083#1099#39' as MG_NOTICE'
      'from RDB$DATABASE'
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
  object srcMatGropups: TDataSource
    AutoEdit = False
    DataSet = dsMatGropups
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
    Left = 505
    Top = 97
  end
end
