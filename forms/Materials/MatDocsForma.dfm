inherited MatDocsForm: TMatDocsForm
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
  ClientHeight = 524
  ClientWidth = 814
  Menu = mmMaterialDoc
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter [0]
    Left = 0
    Top = 309
    Width = 814
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  inherited splPG: TSplitter
    Top = 305
    Width = 814
  end
  inherited dbGrid: TDBGridEh
    Top = 57
    Width = 814
    Height = 248
    Align = alTop
    AllowedOperations = [alopDeleteEh]
    FooterRowCount = 1
    SumList.Active = True
    OnGetCellParams = dbGridGetCellParams
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DOC_ID'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DOC_N'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Title.TitleButton = True
        Title.SortIndex = 2
        Title.SortMarker = smDownEh
        Width = 82
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DOC_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Title.TitleButton = True
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Width = 88
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DT_ID'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DT_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Width = 69
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1053#1072' '#1089#1082#1083#1072#1076
        Title.TitleButton = True
        Width = 112
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FROM_WH_NAME'
        Footers = <>
        Title.Caption = #1057#1086' '#1089#1082#1083#1072#1076#1072
        Width = 99
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 171
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WH_ID'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'HAS_SCAN'
        Footers = <>
        Title.Caption = #1060#1072#1081#1083
        Title.TitleButton = True
        Width = 30
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_BY'
        Footers = <>
        Title.Caption = #1057#1086#1079#1076#1072#1085'|'#1050#1077#1084
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_ON'
        Footers = <>
        Title.Caption = #1057#1086#1079#1076#1072#1085'|'#1050#1086#1075#1076#1072
        Title.TitleButton = True
        Width = 64
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_BY'
        Footers = <>
        Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1077#1084
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_ON'
        Footers = <>
        Title.Caption = #1048#1079#1084#1077#1085#1077#1085'|'#1050#1086#1075#1076#1072
        Title.TitleButton = True
        Width = 62
      end>
  end
  inherited tlbMain: TToolBar
    Width = 814
    inherited btnNew: TToolButton
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      Action = nil
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      DropdownMenu = pmBTN
      PopupMenu = pmBTN
      Style = tbsDropDown
      OnClick = ToolButton1Click
    end
    inherited btnEdit: TToolButton
      Left = 43
    end
    inherited ToolButton5: TToolButton
      Left = 66
    end
    inherited ToolButton6: TToolButton
      Left = 70
    end
    inherited btnDelete: TToolButton
      Left = 74
    end
    inherited ToolButton9: TToolButton
      Left = 97
    end
    inherited tbOk: TToolButton
      Left = 112
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Left = 135
      Visible = False
    end
    inherited tbCancel: TToolButton
      Left = 139
      Visible = False
    end
    inherited ToolButton20: TToolButton
      Left = 162
      Visible = False
    end
    inherited btnQuickFilter: TToolButton
      Left = 170
    end
    object ToolButton19: TToolButton
      Left = 193
      Top = 0
    end
    object btnFilterNew: TToolButton
      Left = 216
      Top = 0
      Action = actFilterSet
      DropdownMenu = pmFilter
      Style = tbsDropDown
    end
    object btnFilterDate: TToolButton
      Left = 254
      Top = 0
      Action = actFilterDate
      DropdownMenu = pmPeriod
      Style = tbsDropDown
    end
    object btn1: TToolButton
      Left = 292
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 41
      Style = tbsSeparator
    end
    object btnPrint: TToolButton
      Left = 300
      Top = 0
      Action = actPrint
    end
  end
  object pnlDetail: TPanel [4]
    Left = 0
    Top = 312
    Width = 814
    Height = 212
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlDetail'
    TabOrder = 3
    object dbgDetail: TDBGridEh
      Left = 0
      Top = 0
      Width = 814
      Height = 213
      Align = alClient
      AllowedOperations = []
      DataSource = srcMaterials
      DynProps = <>
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
      PopupMenu = pmPopUp
      SearchPanel.Enabled = True
      SortLocal = True
      STFilter.Local = True
      SumList.Active = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'M_ID'
          Footers = <>
          Title.TitleButton = True
          Visible = False
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footer.FieldName = 'NAME'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
          Title.TitleButton = True
          Width = 127
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#0.#####'
          DynProps = <>
          EditButtons = <>
          FieldName = 'M_QUANT'
          Footer.DisplayFormat = ',#0.#####'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.TitleButton = True
          Width = 69
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#0.###'
          DynProps = <>
          EditButtons = <>
          FieldName = 'SHIPPER_COST'
          Footer.DisplayFormat = ',#0.#####'
          Footers = <>
          Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082'|'#1062#1077#1085#1072
          Title.TitleButton = True
          Width = 69
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#0.###'
          DynProps = <>
          EditButtons = <>
          FieldName = 'SHIPPER_ITOGO'
          Footer.DisplayFormat = ',#0.#####'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082'|'#1057#1090#1086#1080#1084#1089#1086#1090#1100
          Title.TitleButton = True
          Width = 88
        end
        item
          CellButtons = <>
          DisplayFormat = ',#0.###'
          DynProps = <>
          EditButtons = <>
          FieldName = 'COST'
          Footer.DisplayFormat = ',#0.#####'
          Footers = <>
          Title.Caption = #1057#1082#1083#1072#1076'|'#1062#1077#1085#1072
          Width = 69
        end
        item
          CellButtons = <>
          DisplayFormat = ',#0.###'
          DynProps = <>
          EditButtons = <>
          FieldName = 'ITOGO'
          Footer.DisplayFormat = ',#0.#####'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1082#1083#1072#1076'|'#1057#1090#1086#1080#1084#1086#1089#1090#1100
          Width = 88
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MG_NAME'
          Footers = <>
          Title.Caption = #1043#1088#1091#1087#1087#1072
          Title.TitleButton = True
          Width = 74
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'M_NUMBER'
          Footers = <>
          Title.Caption = #1053#1086#1084'. '#1085#1086#1084#1077#1088
          Width = 71
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'M_NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 131
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DOC_ID'
          Footers = <>
          Title.TitleButton = True
          Visible = False
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  inherited pnlEdit: TPanel
    Width = 814
    Height = 32
    inherited btnSaveLink: TBitBtn
      Top = -1
      Width = 628
    end
    inherited btnCancelLink: TBitBtn
      Left = 719
      Top = -1
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsDocs
    Left = 56
    Top = 152
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    inherited actNew: TAction
      Caption = #1055#1088#1080#1093#1086#1076' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      SecondaryShortCuts.Strings = (
        'F4')
      OnExecute = actNewExecute
    end
    object actDocMove: TAction [1]
      Caption = #1055#1077#1088#1077#1084#1077#1097#1077#1085#1080#1077' '#1087#1086' '#1089#1082#1083#1072#1076#1072#1084
      ShortCut = 116
      OnExecute = actDocMoveExecute
    end
    object actDocOUT: TAction [2]
      Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      ShortCut = 117
      OnExecute = actDocOUTExecute
    end
    object actDocInventory: TAction [3]
      Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103
      Enabled = False
      Visible = False
      OnExecute = actDocInventoryExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      OnExecute = actEditExecute
    end
    object actPrint: TAction [6]
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 5
      ShortCut = 16464
      OnExecute = actPrintExecute
    end
    object actDocInvent: TAction [7]
      Caption = #1048#1085#1074#1077#1085#1090#1072#1088#1080#1079#1072#1094#1080#1103
      ShortCut = 118
      OnExecute = actDocInventExecute
    end
    inherited actFilterFLD: TAction [8]
    end
    object actFilterSet: TAction [9]
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 0
      ShortCut = 114
      OnExecute = actFilterSetExecute
    end
    object actSetFilterNew: TAction [10]
      Caption = #1053#1086#1074#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1092#1080#1083#1100#1090#1088' '#1089' '#1086#1095#1080#1089#1090#1082#1086#1081' '#1089#1090#1072#1088#1086#1075#1086
      ImageIndex = 0
      ShortCut = 8306
      OnExecute = actSetFilterNewExecute
    end
    inherited actQuickFilter: TAction [11]
    end
    object actFilterDate: TAction [12]
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1072#1090#1077
      ImageIndex = 1
      ShortCut = 16452
      OnExecute = actFilterDateExecute
    end
    object actEnableFilter: TAction [13]
      Caption = #1042#1082#1083'/'#1042#1099#1082#1083'. '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100'/'#1074#1099#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ShortCut = 16498
      OnExecute = actEnableFilterExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 243
    Top = 143
  end
  inherited CnErrors: TCnErrorProvider
    Top = 24
  end
  object dsDocs: TpFIBDataSet [10]
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      'execute procedure Material_Docs_Delete(:Doc_Id)  '
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    D.Doc_Id'
      '  , D.Doc_N'
      '  , D.Doc_Date'
      '  , D.Dt_Id'
      '  , D.Notice'
      '  , D.Wh_Id'
      '  , D.Doc_Closed'
      '  , D.Ext_Id'
      '  , D.From_Wh'
      '  , D.Added_On'
      '  , D.Edit_On'
      '  , dt.O_NAME Dt_Name'
      '  , w.O_Name'
      '  , fw.O_Name as FROM_WH_NAME'
      '  , Dt.O_CHARFIELD DT_REPORT'
      '  , coalesce(a.Surname, d.Added_By) as Added_By'
      '  , coalesce(e.Surname, d.Edit_By) as Edit_By'
      '  , iif(b.Bl_Id is null, 0, 1) HAS_SCAN  '
      '  from material_docs d'
      
        '       left outer join objects dt on (dt.O_Id = d.Dt_Id and dt.O' +
        '_TYPE = 28)'
      
        '       left outer join objects w on (w.O_Id = d.Wh_Id and w.O_TY' +
        'PE = 10)'
      
        '       left outer join objects fw on (fw.O_Id = d.From_Wh and fw' +
        '.O_TYPE = 10)'
      '       left outer join worker a on (a.Ibname = d.Added_By)'
      '       left outer join worker e on (e.Ibname = d.Edit_By)'
      
        '       left outer join Blob_Tbl b on (b.Owner_Id = d.Doc_Id and ' +
        'b.Bl_Type = 3)       '
      '  where (     D.DOC_ID = :OLD_DOC_ID      )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    D.Doc_Id'
      '  , D.Doc_N'
      '  , D.Doc_Date'
      '  , D.Dt_Id'
      '  , D.Notice'
      '  , D.Wh_Id'
      '  , D.Doc_Closed'
      '  , D.Ext_Id'
      '  , D.From_Wh'
      '  , D.Added_On'
      '  , D.Edit_On'
      '  , dt.O_NAME Dt_Name'
      '  , w.O_Name'
      '  , fw.O_Name as FROM_WH_NAME'
      '  , Dt.O_CHARFIELD DT_REPORT'
      '  , coalesce(a.Surname, d.Added_By) as Added_By'
      '  , coalesce(e.Surname, d.Edit_By) as Edit_By'
      '  , iif(b.Bl_Id is null, 0, 1) HAS_SCAN'
      '  from material_docs d'
      
        '       left outer join objects dt on (dt.O_Id = d.Dt_Id and dt.O' +
        '_TYPE = 28)'
      
        '       left outer join objects w on (w.O_Id = d.Wh_Id and w.O_TY' +
        'PE = 10)'
      
        '       left outer join objects fw on (fw.O_Id = d.From_Wh and fw' +
        '.O_TYPE = 10)'
      '       left outer join worker a on (a.Ibname = d.Added_By)'
      '       left outer join worker e on (e.Ibname = d.Edit_By)'
      
        '       left outer join Blob_Tbl b on (b.Owner_Id = d.Doc_Id and ' +
        'b.Bl_Type = 3)       '
      '  where '
      '  (@@filter%1=1@) '
      '       '
      '')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 192
    Top = 208
  end
  object dsMaterials: TpFIBDataSet [11]
    SelectSQL.Strings = (
      '  select'
      '    md.M_Id'
      
        '  , m.Name || coalesce('#39'/'#39' || u.Serial || coalesce('#39'/'#39' || u.MAC,' +
        ' '#39#39'), '#39#39') NAME'
      '  , m.M_NUMBER'
      '  , iif(u.Serial is null, coalesce(md.M_Quant, 0), 1) M_Quant'
      '  , md.Shipper_Cost'
      '  , md.M_Notice'
      '  , g.Mg_Name'
      '  , md.Doc_Id'
      
        '  , (iif(u.Serial is null, coalesce(md.M_Quant, 0), 1) * md.Ship' +
        'per_Cost) as Shipper_Itogo'
      
        '  , (iif(u.Serial is null, coalesce(md.M_Quant, 0), 1) * m.Cost)' +
        ' as Itogo'
      '  , m.Cost'
      '  from materials m'
      '       inner join Materials_In_Doc md on (m.M_Id = md.M_Id)'
      '       left outer join Materials_Group g on (m.Mg_Id = g.Mg_Id)'
      
        '       left outer join Materials_In_Doc_Unit u on (u.M_Id = m.M_' +
        'Id and'
      '             u.Id = md.Id and'
      '             u.Doc_Id = md.Doc_Id)'
      '  where md.Doc_Id = :DOC_id'
      '  order by md.TTN, m.Name, coalesce(u.Serial, '#39#39') ')
    Transaction = trRead
    Database = dmMain.dbTV
    DataSource = srcDataSource
    Left = 457
    Top = 425
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcIgnoreMasterClose = True
  end
  object srcMaterials: TDataSource [12]
    DataSet = dsMaterials
    Left = 353
    Top = 417
  end
  object pmBTN: TPopupMenu [13]
    Left = 312
    Top = 144
    object N1: TMenuItem
      Action = actNew
    end
    object N2: TMenuItem
      Action = actDocMove
    end
    object actDocOUT1: TMenuItem
      Action = actDocOUT
    end
    object N5: TMenuItem
      Action = actDocInvent
    end
    object N3: TMenuItem
      Action = actDocInventory
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
    end
  end
  object frxReport: TfrxReport [14]
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38761.722679213000000000
    ReportOptions.LastChange = 41847.539245937500000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnUserFunction = frxReportUserFunction
    Left = 312
    Top = 208
  end
  object trRead: TpFIBTransaction [15]
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 136
    Top = 190
  end
  object trWrite: TpFIBTransaction [16]
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 136
    Top = 236
  end
  object pmPeriod: TPopupMenu [17]
    Left = 393
    Top = 144
    object MenuItem1: TMenuItem
      Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
      OnClick = MenuItem1Click
    end
    object N4: TMenuItem
      Caption = #1047#1072' '#1087#1088#1086#1096#1083#1099#1081' '#1076#1077#1085#1100
      OnClick = N4Click
    end
    object MenuItem2: TMenuItem
      Caption = #1047#1072' '#1085#1077#1076#1077#1083#1102
      OnClick = MenuItem2Click
    end
    object miMonth: TMenuItem
      Caption = #1047#1072' '#1084#1077#1089#1103#1094
      OnClick = miMonthClick
    end
  end
  object dsFilter: TMemTableEh [18]
    Params = <>
    Left = 27
    Top = 355
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object inversion: TMTBooleanDataFieldEh
          FieldName = 'inversion'
          DefaultExpression = 'False'
          DisplayWidth = 20
        end
        object next_condition: TMTNumericDataFieldEh
          FieldName = 'next_condition'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DefaultExpression = '0'
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object MD_TYPE: TMTNumericDataFieldEh
          FieldName = 'MD_TYPE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'LETTERS_TYPE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object dStart: TMTDateTimeDataFieldEh
          FieldName = 'dStart'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object dEnd: TMTDateTimeDataFieldEh
          FieldName = 'dEnd'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object MD_STATE: TMTNumericDataFieldEh
          FieldName = 'MD_STATE'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object M_ID: TMTNumericDataFieldEh
          FieldName = 'M_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object WH_IN: TMTNumericDataFieldEh
          FieldName = 'WH_IN'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object WH_OUT: TMTNumericDataFieldEh
          FieldName = 'WH_OUT'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object pmFilter: TPopupMenu [19]
    Left = 655
    Top = 186
    object N31: TMenuItem
      Caption = #1042#1082#1083'/'#1042#1099#1082#1083'. '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100'/'#1074#1099#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ShortCut = 16498
      OnClick = actEnableFilterExecute
    end
    object N53: TMenuItem
      Action = actSetFilterNew
    end
    object N42: TMenuItem
      Caption = '-'
    end
    object N36: TMenuItem
      Action = actQuickFilter
    end
  end
  object mmMaterialDoc: TMainMenu [20]
    Left = 504
    Top = 160
    object L1: TMenuItem
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
      GroupIndex = 2
      object miNew: TMenuItem
        Action = actNew
      end
      object miDocMove: TMenuItem
        Action = actDocMove
      end
      object N7: TMenuItem
        Action = actDocOUT
      end
      object miDocInvent: TMenuItem
        Action = actDocInvent
      end
      object miDocInventory: TMenuItem
        Action = actDocInventory
      end
      object miN8: TMenuItem
        Caption = '-'
      end
      object miEdit: TMenuItem
        Action = actEdit
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object actPaymentDelete1: TMenuItem
        Action = actDelete
      end
      object miN10: TMenuItem
        Caption = '-'
      end
      object miPrint: TMenuItem
        Action = actPrint
      end
    end
    object N9: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088
      GroupIndex = 2
      object miFilterSet: TMenuItem
        Action = actFilterSet
        GroupIndex = 2
      end
      object miFilterDate: TMenuItem
        Action = actFilterDate
        GroupIndex = 2
      end
      object miQuickFilter: TMenuItem
        Action = actQuickFilter
        GroupIndex = 2
      end
    end
  end
end
