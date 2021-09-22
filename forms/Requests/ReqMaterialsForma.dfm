object ReqMaterialsForm: TReqMaterialsForm
  Left = 519
  Top = 314
  ActiveControl = dbGrid
  Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1076#1083#1103' '#1079#1072#1103#1074#1082#1080
  ClientHeight = 391
  ClientWidth = 928
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
  object Panel2: TPanel
    Left = 0
    Top = 354
    Width = 928
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    inline OkCancelFrame1: TOkCancelFrame
      Left = 0
      Top = 0
      Width = 928
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
        Width = 497
        Height = 30
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Visible = False
        OnClick = OkCancelFrame1bbOkClick
      end
      inherited bbCancel: TBitBtn
        Left = 688
        Width = 234
        Height = 30
        Caption = #1047#1072#1082#1088#1099#1090#1100
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 928
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
      Width = 740
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
          ButtonStyle = cbsDropDown
          CellButtons = <>
          DisplayFormat = ',#0.#####'
          DynProps = <>
          EditButton.Visible = True
          EditButtons = <>
          FieldName = 'RM_QUANT'
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
          AutoFitColWidth = False
          CellButtons = <>
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOT_CALC'
          Footers = <>
          Title.Alignment = taLeftJustify
          Title.Caption = #1053#1077' '#1085#1072#1095#1080#1089#1083#1103#1090#1100
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Title.Hint = #1053#1077' '#1085#1072#1095#1080#1089#1083#1103#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1091' '#1101#1090#1086#1090' '#1084#1072#1090#1077#1088#1080#1072#1083
          Width = 28
        end
        item
          CellButtons = <>
          DisplayFormat = ',#0.###'
          DynProps = <>
          EditButtons = <>
          FieldName = 'RM_COST'
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
      
        'execute procedure Request_Materials_Iud(:Rm_Id, :Rq_Id, :M_Id, :' +
        'Rm_Quant, :Wh_Id, :RM_COST, :Rm_Notice, :NOT_CALC, 1)')
    DeleteSQL.Strings = (
      
        'execute procedure Request_Materials_Iud(:Rm_Id, :Rq_Id, :M_Id, :' +
        'Rm_Quant, :Wh_Id, :RM_COST, :Rm_Notice, :NOT_CALC,  2)')
    InsertSQL.Strings = (
      
        'execute procedure Request_Materials_Iud(:Rm_Id, :Rq_Id, :M_Id, :' +
        'Rm_Quant, :Wh_Id, :RM_COST, :Rm_Notice, :NOT_CALC, 0)')
    RefreshSQL.Strings = (
      'select'
      
        '   rm.Rm_Id, m.M_ID, m.Name, m.Dimension, w.O_Name, w.O_ID as WH' +
        '_ID, w.O_NAME'
      '    , rm.Rm_Quant, rm.NOT_CALC'
      
        '    , mr.Mr_Quant, iif(coalesce(rm.Rm_Quant,0) <> 0, rm.Rm_Cost,' +
        ' m.Cost)  Rm_Cost'
      '    , m.M_Number'
      
        '    ,     (coalesce(rm.Rm_Quant,0) + coalesce(mr.Mr_Quant,0)) QU' +
        'ANT_TOTAL, coalesce(rm.Rm_Quant,0) quant_in_request'
      '    , coalesce(:RQ_ID, 0) RQ_ID'
      '    , rm.RM_NOTICE'
      '    , m.Description    '
      '  from MATERIALS M'
      '       inner join Materials_Remain mr on (mr.M_Id = m.M_Id '
      
        '                                               and (exists(selec' +
        't wh.wh_id from SYS$USER u'
      
        '                                                           inner' +
        ' join sys$user_wh wh on (wh.user_id = u.id)'
      
        '                                                           where' +
        ' u.ibname = current_user'
      
        '                                                              an' +
        'd wh.can_view = 1'
      
        '                                                              an' +
        'd wh.wh_id = mr.Wh_Id)'
      
        '                                                     or current_' +
        'user = '#39'SYSDBA'#39
      '                                               ))  '
      
        '       left outer join Request_Materials rm on (rm.M_Id = m.M_Id' +
        ' and rm.Rq_Id = :RQ_ID and rm.WH_ID = mr.WH_ID)'
      
        '       left outer join OBJECTS W on (W.O_ID = mr.Wh_Id and W.O_T' +
        'YPE = 10)'
      ''
      
        '    where RM.RQ_ID = :OLD_RQ_ID and rm.Wh_Id = :OLD_WH_ID and rm' +
        '.M_Id = :OLD_M_ID')
    SelectSQL.Strings = (
      'SELECT * FROM get_mat_give_out(:RQ_ID, :Mg_Id, :Rq_Owner)'
      'order by NAME')
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
      
        'select -2 as MG_ID, '#39'< '#1042' '#1047#1040#1071#1042#1050#1045' >'#39' MG_NAME, null as PARENT_ID, '#39 +
        #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1074#1099#1076#1072#1085#1099' '#1076#1083#1103' '#1079#1072#1103#1074#1082#1080#39' as MG_NOTICE'
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
