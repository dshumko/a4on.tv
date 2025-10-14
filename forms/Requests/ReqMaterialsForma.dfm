object ReqMaterialsForm: TReqMaterialsForm
  Left = 519
  Top = 314
  ActiveControl = dbGrid
  Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1076#1083#1103' '#1079#1072#1103#1074#1082#1080
  ClientHeight = 391
  ClientWidth = 884
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 354
    Width = 884
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    inline OkCancelFrame1: TOkCancelFrame
      Left = 0
      Top = 0
      Width = 884
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
        Width = 453
        Height = 30
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Visible = False
        OnClick = OkCancelFrame1bbOkClick
      end
      inherited bbCancel: TBitBtn
        Left = 644
        Width = 234
        Height = 30
        Caption = #1047#1072#1082#1088#1099#1090#1100
        OnClick = OkCancelFrame1bbCancelClick
      end
    end
  end
  object pnlGrids: TPanel
    Left = 0
    Top = 0
    Width = 884
    Height = 354
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 233
      Top = 0
      Height = 329
    end
    object dbGrid: TDBGridEh
      Left = 236
      Top = 0
      Width = 648
      Height = 329
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataSource = srcDataSource
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghColumnResize, dghColumnMove]
      SearchPanel.Enabled = True
      STFilter.Local = True
      STFilter.Visible = True
      SumList.Active = True
      TabOrder = 0
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
          Footer.FieldName = 'RM_QUANT'
          Footer.ValueType = fvtCount
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
          ButtonStyle = cbsDropDown
          CellButtons = <>
          DisplayFormat = ',#0.#####'
          DynProps = <>
          EditButton.Visible = True
          EditButtons = <>
          FieldName = 'RM_QUANT'
          Footer.DisplayFormat = ',#0.###'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1050'-'#1074#1086
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
          Width = 44
        end
        item
          Alignment = taLeftJustify
          AutoFitColWidth = False
          CellButtons = <>
          Checkboxes = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'PROP'
          Footers = <>
          KeyList.Strings = (
            '0'
            '1'
            '2'
            '3')
          NotInKeyListIndex = 0
          PickList.Strings = (
            #1055#1088#1086#1076#1072#1078#1072
            #1042' '#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1080
            #1056#1072#1089#1089#1088#1086#1095#1082#1072
            #1040#1088#1077#1085#1076#1072)
          Title.Caption = #1053#1072#1095#1080#1089#1083'.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Title.Hint = #1053#1077' '#1085#1072#1095#1080#1089#1083#1103#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1091' '#1101#1090#1086#1090' '#1084#1072#1090#1077#1088#1080#1072#1083
        end
        item
          CellButtons = <>
          DisplayFormat = ',#0.###'
          DynProps = <>
          EditButtons = <>
          FieldName = 'RM_COST'
          Footer.DisplayFormat = ',#0.##'
          Footer.FieldName = 'ITOG'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1062#1077#1085#1072
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Title.TitleButton = True
          Width = 76
        end
        item
          CellButtons = <>
          Color = clBtnFace
          DisplayFormat = ',#0.###'
          DynProps = <>
          EditButtons = <>
          FieldName = 'QUANT_TOTAL'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1054#1089#1090'-'#1082' '#1089' '#1091#1095#1077#1090#1086#1084' '#1079#1072#1074#1082#1080
          Title.TitleButton = True
          Width = 80
        end
        item
          CellButtons = <>
          Color = clBtnFace
          DynProps = <>
          EditButtons = <>
          FieldName = 'O_NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1057#1082#1083#1072#1076
          Title.TitleButton = True
          Width = 77
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
          Width = 56
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RM_NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077'|'#1082' '#1089#1087#1080#1089#1072#1085#1080#1102
          Title.TitleButton = True
          Width = 118
        end
        item
          CellButtons = <>
          Color = clBtnFace
          DynProps = <>
          EditButtons = <>
          FieldName = 'Description'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077'|'#1084#1072#1090#1077#1088#1080#1072#1083#1072
          Width = 104
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object tsGroup: TTabSet
      Left = 0
      Top = 329
      Width = 884
      Height = 25
      Align = alBottom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      SoftTop = True
      Style = tsSoftTabs
      Tabs.Strings = (
        #1055#1086' '#1075#1088#1091#1087#1087#1072#1084
        #1055#1086' '#1089#1082#1083#1072#1076#1072#1084)
      TabIndex = 0
      OnChange = tsGroupChange
    end
    object dbGridGroups: TDBGridEh
      Left = 0
      Top = 0
      Width = 233
      Height = 329
      Align = alLeft
      AllowedOperations = [alopUpdateEh]
      DataSource = srcMatGropups
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
      PopupMenu = pmTreeView
      SearchPanel.Enabled = True
      SortLocal = True
      STFilter.Local = True
      TabOrder = 2
      TitleParams.MultiTitle = True
      OnGetCellParams = dbGridGroupsGetCellParams
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MG_NAME'
          Footers = <>
          Title.Caption = #1043#1088#1091#1087#1087#1072
          Title.TitleButton = True
          Width = 93
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MG_NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 170
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
      'select'
      'RET_RM_ID Rm_Id'
      
        'from Request_Materials_Iud(:Rm_Id, :Rq_Id, :M_Id, :Rm_Quant, :Wh' +
        '_Id, :RM_COST, :Rm_Notice, :PROP, 1, :SERIAL)')
    DeleteSQL.Strings = (
      'select'
      'RET_RM_ID Rm_Id'
      
        'from Request_Materials_Iud(:Rm_Id, :Rq_Id, :M_Id, :Rm_Quant, :Wh' +
        '_Id, :RM_COST, :Rm_Notice, :PROP, 2, :SERIAL)')
    InsertSQL.Strings = (
      'select'
      'RET_RM_ID Rm_Id'
      
        'from Request_Materials_Iud(:Rm_Id, :Rq_Id, :M_Id, :Rm_Quant, :Wh' +
        '_Id, :RM_COST, :Rm_Notice, :PROP, 0, :SERIAL)'
      ' ')
    RefreshSQL.Strings = (
      'select'
      '    Rm_Id'
      '  , M_Id'
      '  , Name'
      '  , Dimension'
      '  , O_Name'
      '  , Wh_Id'
      '  , Rm_Quant'
      '  , prop'
      '  , Mr_Quant'
      '  , Rm_Cost'
      '  , M_Number'
      '  , Quant_Total'
      '  , Quant_In_Request'
      '  , Rq_Id'
      '  , Rm_Notice'
      '  , Description'
      '  , Serial'
      '  , iif(prop = 0, Mr_Quant * Rm_Cost, null) Itog '
      'FROM get_mat_give_out(:RQ_ID, -2, :Rq_Owner)'
      'where RM_ID = :OLD_RM_ID')
    SelectSQL.Strings = (
      'select'
      '    Rm_Id'
      '  , M_Id'
      '  , Name'
      '  , Dimension'
      '  , O_Name'
      '  , Wh_Id'
      '  , Rm_Quant'
      '  , PROP'
      '  , Mr_Quant'
      '  , Rm_Cost'
      '  , M_Number'
      '  , Quant_Total'
      '  , Quant_In_Request'
      '  , Rq_Id'
      '  , Rm_Notice'
      '  , Description'
      '  , Serial'
      '  , iif(prop = 0, Mr_Quant * Rm_Cost, null) Itog '
      '  FROM get_mat_give_out(:RQ_ID, :Mg_Id, :Rq_Owner, :FOR_WH_ID)'
      'order by NAME')
    BeforePost = dsReqMaterialsBeforePost
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcMatGropups
    Left = 250
    Top = 194
  end
  object srcMatGropups: TDataSource
    AutoEdit = False
    DataSet = mtGroups
    Left = 48
    Top = 192
  end
  object PropStorage: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'pnlGrids.dbGridGroups.<P>.Width')
    Left = 505
    Top = 97
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
    Left = 424
    Top = 262
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
    Left = 424
    Top = 196
  end
  object mtGroups: TMemTableEh
    Params = <>
    DataDriver = drvFibGroups
    TreeList.Active = True
    TreeList.KeyFieldName = 'MG_ID'
    TreeList.RefParentFieldName = 'Parent_ID'
    TreeList.FilterNodeIfParentVisible = False
    Left = 120
    Top = 128
  end
  object drvFibGroups: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    SelectCommand.CommandText.Strings = (
      'select'
      '    MG_ID'
      '  , MG_NAME'
      '  , PARENT_ID'
      '  , MG_NOTICE'
      '  , SOLD'
      '  , RENT'
      '  , LOAN'
      '  , iif(coalesce(PATH, '#39#39') = '#39#39', MG_NAME, PATH) PATH'
      '  from MATERIALS_GROUP g'
      '  where coalesce(g.Deleted, 0) = 0'
      'union'
      'select'
      '    -999 as MG_ID'
      '  , '#39' '#1041#1045#1047' '#1043#1056#1059#1055#1055#1067#39' MG_NAME'
      '  , null as PARENT_ID'
      '  , '#39#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1073#1077#1079' '#1075#1088#1091#1087#1087#1099#39' as MG_NOTICE'
      '  , null SOLD'
      '  , null RENT'
      '  , null LOAN'
      '  , null PATH'
      '  from RDB$DATABASE'
      '  where (exists(select'
      '                    m.M_Id'
      '                  from materials m'
      '                  where m.Mg_Id is null'
      '                        and m.DELETED = 0))'
      'union'
      'select'
      '    -1 as MG_ID'
      '  , '#39'  '#1042#1057#1045' '#1052#1040#1058#1045#1056#1048#1040#1051#1067#39' MG_NAME'
      '  , null as PARENT_ID'
      '  , '#39#1042#1089#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1099#39' as MG_NOTICE'
      '  , null SOLD'
      '  , null RENT'
      '  , null LOAN'
      '  , null PATH'
      '  from RDB$DATABASE'
      '  order by 2, 1')
    UpdateCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'MG_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARENT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MG_NOTICE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SOLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOAN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_MG_ID'
        ParamType = ptUnknown
      end>
    UpdateCommand.CommandText.Strings = (
      'UPDATE MATERIALS_GROUP'
      'SET '
      '    MG_NAME = :MG_NAME,'
      '    PARENT_ID = :PARENT_ID,'
      '    MG_NOTICE = :MG_NOTICE,'
      '    SOLD = :SOLD,'
      '    RENT = :RENT,'
      '    LOAN = :LOAN'
      'WHERE'
      '    MG_ID = :OLD_MG_ID')
    InsertCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'MG_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MG_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PARENT_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MG_NOTICE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'SOLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'RENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LOAN'
        ParamType = ptUnknown
      end>
    InsertCommand.CommandText.Strings = (
      'INSERT INTO MATERIALS_GROUP('
      '    MG_ID,'
      '    MG_NAME,'
      '    PARENT_ID,'
      '    MG_NOTICE,'
      '    SOLD,'
      '    RENT,'
      '    LOAN'
      ')'
      'VALUES('
      '    :MG_ID,'
      '    :MG_NAME,'
      '    :PARENT_ID,'
      '    :MG_NOTICE,'
      '    :SOLD,'
      '    :RENT,'
      '    :LOAN'
      ')')
    DeleteCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'OLD_MG_ID'
        ParamType = ptUnknown
      end>
    DeleteCommand.CommandText.Strings = (
      'UPDATE MATERIALS_GROUP'
      'SET '
      '    DELETED = 1'
      'WHERE'
      '    MG_ID = :OLD_MG_ID')
    GetrecCommand.Params = <>
    Left = 116
    Top = 67
  end
  object pmTreeView: TPopupMenu
    Left = 96
    Top = 192
    object miFE: TMenuItem
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = miFEClick
    end
    object miN1: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = miN1Click
    end
  end
end
