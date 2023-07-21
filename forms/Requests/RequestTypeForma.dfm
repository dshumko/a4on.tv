inherited RequestTypeForm: TRequestTypeForm
  Left = 346
  Top = 218
  Caption = #1058#1080#1087#1099' '#1079#1072#1103#1074#1086#1082
  ClientHeight = 543
  ClientWidth = 975
  ExplicitWidth = 991
  ExplicitHeight = 582
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Width = 975
    Height = 4
    ExplicitWidth = 975
    ExplicitHeight = 4
  end
  inherited dbGrid: TDBGridEh
    Top = 85
    Width = 975
    Height = 201
    Align = alTop
    AllowedOperations = [alopUpdateEh]
    OnGetCellParams = dbGridGetCellParams
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RT_ID'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RT_NAME'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 153
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DisplayFormat = '###'
        DynProps = <>
        EditButtons = <>
        EditMask = '###'
        FieldName = 'RT_TYPE'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1')
        PickList.Strings = (
          ''
          #1057#1050#1058#1042
          #1057#1055#1044
          #1062#1080#1092#1088#1086#1074#1086#1077' '#1058#1042)
        Title.Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
        Title.Hint = #1050#1086#1083'-'#1074#1086' '#1076#1085#1077#1081' '#1085#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1077
        Title.TitleButton = True
        Width = 133
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RT_PRINTFORM'
        Footers = <>
        Title.Caption = #1048#1084#1103' '#1087#1077#1095#1072#1090#1085#1086#1081' '#1092#1086#1088#1084#1099
        Title.TitleButton = True
        Width = 146
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'RT_DEFAULT'
        Footers = <>
        Title.Caption = #1044#1083#1103' '#1085#1086#1074#1086#1081
        Title.TitleButton = True
        Width = 49
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'RT_HC_NEED'
        Footers = <>
        Title.Caption = #1044#1083#1103' '#1076#1086#1084' '#1074' '#1101#1082#1089'. '
        Title.TitleButton = True
        Width = 68
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RT_NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 160
      end>
  end
  object pgcAddons: TPageControl [2]
    Left = 0
    Top = 294
    Width = 975
    Height = 249
    ActivePage = tsTemplates
    Align = alClient
    TabOrder = 3
    OnChange = pgcAddonsChange
    object tsTemplates: TTabSheet
      Caption = #1055#1088#1080#1095#1080#1085#1099' '#1074#1099#1079#1086#1074#1072
      ImageIndex = 1
      object tlbTplt: TToolBar
        Left = 0
        Top = 0
        Width = 967
        Height = 25
        Caption = 'ToolBar1'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object btnTplt: TToolButton
          Left = 0
          Top = 0
          Action = actTpltsAdd
        end
        object btnTplt11: TToolButton
          Left = 23
          Top = 0
          Width = 4
          Caption = 'ToolButton5'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object btnTplt12: TToolButton
          Left = 27
          Top = 0
          Action = actTpltsEdit
        end
        object btnTplt13: TToolButton
          Left = 50
          Top = 0
          Width = 15
          Caption = 'ToolButton6'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object btnTplt14: TToolButton
          Left = 65
          Top = 0
          Action = actTpltsDel
        end
        object btnTplt21: TToolButton
          Left = 88
          Top = 0
          Width = 28
          Caption = 'ToolButton20'
          ImageIndex = 28
          Style = tbsSeparator
          Visible = False
        end
        object btnTplt22: TToolButton
          Left = 116
          Top = 0
          Action = actTpltsQfltr
        end
      end
      object dbgTplt: TDBGridEh
        Left = 0
        Top = 25
        Width = 967
        Height = 196
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = srcReqTemplates
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        PopupMenu = pmPopUp
        SearchPanel.Enabled = True
        SortLocal = True
        STFilter.Local = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnDblClick = dbgTpltDblClick
        OnGetCellParams = dbgTpltGetCellParams
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RT_ID'
            Footers = <>
            Visible = False
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_TYPE'
            Footers = <>
            Visible = False
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_CONTENT'
            Footers = <>
            Title.Caption = #1053#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100
            Width = 376
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_SOLUTION'
            Footers = <>
            Title.Caption = #1042#1072#1088#1080#1072#1085#1090' '#1088#1077#1096#1077#1085#1080#1103
            Visible = False
            Width = 104
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'O_NAME'
            Footers = <>
            Title.Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072
            Width = 100
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'w_name'
            Footers = <>
            Title.Caption = #1056#1072#1073#1086#1090#1072
            Width = 93
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RECREATE_DAYS'
            Footers = <>
            Title.Caption = #1055#1077#1088#1077#1089#1086#1079#1076#1072#1090#1100' '#1095#1077#1088#1077#1079', '#1076#1085'.'
            Width = 83
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Add_Field'
            Footers = <>
            Title.Caption = #1044#1086#1087'. '#1076#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103
            Width = 283
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsWorks: TTabSheet
      Caption = #1056#1072#1073#1086#1090#1099
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object dbgWorks: TDBGridEh
        Left = 0
        Top = 25
        Width = 967
        Height = 196
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = srcWorks
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        PopupMenu = pmPopUp
        SearchPanel.Enabled = True
        SortLocal = True
        STFilter.Local = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnDblClick = dbgWorksDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'W_ID'
            Footers = <>
            Visible = False
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_TYPE'
            Footers = <>
            Visible = False
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
            Width = 269
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'W_TIME'
            Footers = <>
            Title.Caption = #1053#1086#1088#1084#1072' '#1074#1088#1077#1084#1077#1085#1080', '#1095
            Width = 109
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'W_COST'
            Footers = <>
            Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
            Width = 103
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'ON_DEFAULT'
            Footers = <>
            Title.Caption = #1042' '#1079#1072#1103#1074#1082#1091
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SRV_NAME'
            Footers = <>
            Title.Caption = #1059#1089#1083#1091#1075#1072
            Width = 67
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ATR_NAME'
            Footers = <>
            Title.Caption = #1040#1090#1088#1080#1073#1091#1090' (+/-)'
            Width = 82
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Width = 170
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object tlbWorks: TToolBar
        Left = 0
        Top = 0
        Width = 967
        Height = 25
        Caption = 'ToolBar1'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object btnAddW: TToolButton
          Left = 0
          Top = 0
          Action = actAddW
        end
        object btn6W: TToolButton
          Left = 23
          Top = 0
          Width = 4
          Caption = 'ToolButton5'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object btnEditW: TToolButton
          Left = 27
          Top = 0
          Action = actEditW
        end
        object btn7W: TToolButton
          Left = 50
          Top = 0
          Width = 15
          Caption = 'ToolButton6'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object btnDeleteW: TToolButton
          Left = 65
          Top = 0
          Action = actDelW
        end
        object btn8W: TToolButton
          Left = 88
          Top = 0
          Width = 28
          Caption = 'ToolButton9'
          ImageIndex = 27
          Style = tbsSeparator
        end
        object btnQuickFltrW: TToolButton
          Left = 116
          Top = 0
          Action = actQuickFltrW
        end
      end
    end
    object tsResult: TTabSheet
      Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1099#1081' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object tlb1: TToolBar
        Left = 0
        Top = 0
        Width = 967
        Height = 25
        Caption = 'ToolBar1'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object btnAddRes: TToolButton
          Left = 0
          Top = 0
          Action = actAddRes
        end
        object btn5: TToolButton
          Left = 23
          Top = 0
          Width = 4
          Caption = 'ToolButton5'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object btnEditRes: TToolButton
          Left = 27
          Top = 0
          Action = actEditRes
        end
        object btn6: TToolButton
          Left = 50
          Top = 0
          Width = 15
          Caption = 'ToolButton6'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object btnDelRes: TToolButton
          Left = 65
          Top = 0
          Action = actDelRes
        end
        object btn7: TToolButton
          Left = 88
          Top = 0
          Width = 28
          Caption = 'ToolButton20'
          ImageIndex = 28
          Style = tbsSeparator
          Visible = False
        end
        object btnQuikRes: TToolButton
          Left = 116
          Top = 0
          Action = actQuickRes
        end
      end
      object dbgResult: TDBGridEh
        Left = 0
        Top = 25
        Width = 967
        Height = 196
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = srcResult
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        PopupMenu = pmPopUp
        SearchPanel.Enabled = True
        SortLocal = True
        STFilter.Local = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnDblClick = dbgResultDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1099#1081' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
            Title.TitleButton = True
            Width = 229
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'FINISHED'
            Footers = <>
            Title.Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1072
            Title.TitleButton = True
            Width = 119
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 378
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  inherited tlbMain: TToolBar
    Width = 975
    ExplicitWidth = 975
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
    end
    inherited ToolButton20: TToolButton
      Visible = False
    end
  end
  inherited pnlEdit: TPanel
    Width = 975
    ExplicitWidth = 975
    inherited btnSaveLink: TBitBtn
      Width = 522
      ExplicitWidth = 522
    end
    inherited btnCancelLink: TBitBtn
      Left = 613
      ExplicitLeft = 613
    end
  end
  object dnspltr1: TdnSplitter [5]
    Left = 0
    Top = 286
    AlignControl = dbGrid
    MinSize = 100
    ResizeStyle = rsPattern
  end
  inherited srcDataSource: TDataSource
    DataSet = dsRequestType
    OnDataChange = srcDataSourceDataChange
    Left = 344
    Top = 224
  end
  inherited actions: TActionList
    Left = 104
    Top = 168
    inherited actNew: TAction
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 104
    Top = 224
  end
  inherited CnErrors: TCnErrorProvider
    Left = 16
    Top = 224
  end
  object dsRequestType: TpFIBDataSet
    DeleteSQL.Strings = (
      'UPDATE'
      '    REQUEST_TYPES'
      'SET RT_DELETED = 1'
      'WHERE RT_ID = :OLD_RT_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    *'
      '  from request_types t'
      '  where T.RT_ID = :OLD_RT_ID')
    SelectSQL.Strings = (
      'select'
      '    *'
      '  from request_types t'
      '  where RT_DELETED = 0'
      '  order by t.rt_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 344
    Top = 176
  end
  object dsTemplates: TpFIBDataSet
    UpdateSQL.Strings = (
      ''
      '    ')
    DeleteSQL.Strings = (
      'update REQUEST_TEMPLATES'
      'set deleted = 1'
      'WHERE'
      '        RQTL_ID = :OLD_RQTL_ID'
      '    ')
    RefreshSQL.Strings = (
      'select rt.*, o.o_name, w.name as w_name'
      'from request_templates rt'
      
        '  left outer join objects o on (o.o_id = rt.ANALYSE_ID and o.o_t' +
        'ype = 14)'
      '  left outer join works w on (rt.add_work = w.w_id)'
      'where(  rt.rq_type = :rt_id'
      'and coalesce(rt.deleted,0) = 0'
      '     ) and (     RT.RQTL_ID = :OLD_RQTL_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select rt.*, o.o_name, w.name as w_name'
      'from request_templates rt'
      
        '  left outer join objects o on (o.o_id = rt.ANALYSE_ID and o.o_t' +
        'ype = 14)'
      '  left outer join works w on (rt.add_work = w.w_id)'
      'where rt.rq_type = :rt_id'
      'and coalesce(rt.deleted,0) = 0'
      'order by rt.rq_content'
      ''
      '')
    AutoUpdateOptions.UpdateTableName = 'REQUEST_TEMPLATES'
    AutoUpdateOptions.KeyFields = 'RT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 544
    Top = 176
  end
  object srcReqTemplates: TDataSource
    AutoEdit = False
    DataSet = dsTemplates
    OnDataChange = srcReqTemplatesDataChange
    Left = 544
    Top = 224
  end
  object actlstTplts: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 24
    Top = 168
    object actTpltsAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      ImageIndex = 2
      OnExecute = actTpltsAddExecute
    end
    object actTpltsDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      ImageIndex = 3
      OnExecute = actTpltsDelExecute
    end
    object actTpltsEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1096#1072#1073#1083#1086#1085
      ImageIndex = 4
      OnExecute = actTpltsEditExecute
    end
    object actTpltsQfltr: TAction
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 40
      OnExecute = actTpltsQfltrExecute
    end
    object actAddW: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
      ImageIndex = 2
      OnExecute = actAddWExecute
    end
    object actEditW: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
      ImageIndex = 4
      OnExecute = actEditWExecute
    end
    object actDelW: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
      ImageIndex = 3
      OnExecute = actDelWExecute
    end
    object actQuickFltrW: TAction
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 40
      OnExecute = actQuickFltrWExecute
    end
    object actAddRes: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
      ImageIndex = 2
      OnExecute = actAddResExecute
    end
    object actEditRes: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
      ImageIndex = 4
      OnExecute = actEditResExecute
    end
    object actDelRes: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
      ImageIndex = 3
      OnExecute = actDelResExecute
    end
    object actQuickRes: TAction
      Caption = #1060#1080#1083#1100#1090#1088
      ImageIndex = 40
      OnExecute = actQuickResExecute
    end
  end
  object dsWorks: TpFIBDataSet
    UpdateSQL.Strings = (
      ''
      '    ')
    DeleteSQL.Strings = (
      'Update'
      '    WORKS'
      'set Deleted = 1'
      'WHERE'
      'W_ID = :OLD_W_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    W.W_Id'
      '  , W.Rq_Type'
      '  , W.Wg_Id'
      '  , W.Name'
      '  , W.Notice'
      '  , W.W_Time'
      '  , W.W_Onoff'
      '  , W.W_Srv'
      '  , W.W_Srvonoff'
      '  , W.Deleted'
      '  , W.W_Atr_Ad'
      '  , W.W_Atr_Id'
      '  , W.As_Service'
      '  , W.On_Default'
      '  , s.Name srv_name'
      '  , iif(w.W_Atr_Ad = 1, '#39'+'#39', '#39'-'#39') || '#39' '#39' || o.O_Name atr_name'
      '  , coalesce(w.W_Cost,'
      '    (select'
      '         t.tarif_sum'
      '       from tarif t'
      '       where t.service_id = w.W_Srv'
      
        '             and current_date between t.date_from and t.date_to)' +
        ') W_COST'
      '  from works w'
      
        '       left outer join services s on (w.As_Service = s.Service_I' +
        'd)'
      
        '       left outer join objects o on (w.W_Atr_Id = o.O_Id and o.O' +
        '_Type = 4)'
      '  where w.rq_type = :rt_id  '
      '    and W.W_ID = :OLD_W_ID'
      '    and w.Deleted = 0'
      '     ')
    SelectSQL.Strings = (
      'select'
      '    W.W_Id'
      '  , W.Rq_Type'
      '  , W.Wg_Id'
      '  , W.Name'
      '  , W.Notice'
      '  , W.W_Time'
      '  , W.W_Onoff'
      '  , W.W_Srv'
      '  , W.W_Srvonoff'
      '  , W.Deleted'
      '  , W.W_Atr_Ad'
      '  , W.W_Atr_Id'
      '  , W.As_Service'
      '  , W.On_Default'
      '  , s.Name srv_name'
      '  , iif(w.W_Atr_Ad = 1, '#39'+'#39', '#39'-'#39') || '#39' '#39' || o.O_Name atr_name'
      '  , coalesce(w.W_Cost,'
      '    (select'
      '         t.tarif_sum'
      '       from tarif t'
      '       where t.service_id = w.W_Srv'
      
        '             and current_date between t.date_from and t.date_to)' +
        ') W_COST'
      '  from works w'
      
        '       left outer join services s on (w.As_Service = s.Service_I' +
        'd)'
      
        '       left outer join objects o on (w.W_Atr_Id = o.O_Id and o.O' +
        '_Type = 4)'
      '  where w.rq_type = :rt_id'
      '        and w.Deleted = 0'
      '  order by w.name')
    AutoUpdateOptions.UpdateTableName = 'REQUEST_TEMPLATES'
    AutoUpdateOptions.KeyFields = 'RT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 456
    Top = 176
  end
  object srcWorks: TDataSource
    AutoEdit = False
    DataSet = dsWorks
    OnDataChange = srcWorksDataChange
    Left = 456
    Top = 224
  end
  object dsResult: TpFIBDataSet
    DeleteSQL.Strings = (
      'update REQUEST_RESULTS'
      'set deleted = 1'
      'WHERE'
      '        RR_ID = :OLD_RR_ID'
      '    ')
    RefreshSQL.Strings = (
      'select RR_ID, NAME, FINISHED, NOTICE'
      'from REQUEST_RESULTS rr'
      'where(  RT_ID = :RT_ID'
      'and deleted = 0'
      '     ) and (     RR.RR_ID = :OLD_RR_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select RR_ID, NAME, FINISHED, NOTICE'
      'from REQUEST_RESULTS rr'
      'where RT_ID = :RT_ID'
      'and deleted = 0'
      'order by NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 640
    Top = 176
  end
  object srcResult: TDataSource
    DataSet = dsResult
    OnDataChange = srcResultDataChange
    Left = 640
    Top = 224
  end
end
