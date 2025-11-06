inherited ElectroRecipientForm: TElectroRecipientForm
  Left = 381
  Top = 171
  Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1080' '#1086#1087#1083#1072#1090#1099' '#1101#1083#1077#1082#1090#1088#1086#1101#1085#1077#1088#1075#1080#1080
  ClientHeight = 550
  ClientWidth = 939
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 193
    Width = 939
  end
  object spl1: TSplitter [1]
    Left = 0
    Top = 321
    Width = 939
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  inherited dbGrid: TDBGridEh
    Top = 197
    Width = 939
    Height = 124
    AllowedOperations = [alopUpdateEh]
    FooterRowCount = 1
    SumList.Active = True
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 136
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EPC'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1058#1086#1095#1077#1082' '#1091#1095#1077#1090#1072
        Width = 83
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 497
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_CHECK'
        Footers = <>
        Title.Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1079#1085#1072#1095#1077#1085#1080#1103
        Title.TitleButton = True
        Visible = False
        Width = 144
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DIMENSION'
        Footers = <>
        Title.Caption = #1057#1083#1091#1078#1077#1073#1085#1099#1081' '#1090#1077#1082#1089#1090
        Title.TitleButton = True
        Visible = False
        Width = 162
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DELETED'
        Footers = <>
        Title.Caption = #1057#1082#1088#1099#1090#1100
        Title.TitleButton = True
        Visible = False
        Width = 84
      end>
  end
  inherited tlbMain: TToolBar
    Width = 939
    inherited ToolButton5: TToolButton
      Visible = False
    end
    inherited ToolButton6: TToolButton
      Visible = False
    end
    inherited ToolButton9: TToolButton
      Visible = False
    end
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
    end
  end
  inherited pnlEdit: TPanel
    Width = 939
    Height = 168
    ParentCtl3D = False
    object lbl2: TLabel [0]
      Left = 5
      Top = 9
      Width = 73
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object lbl3: TLabel [1]
      Left = 5
      Top = 36
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    inherited btnSaveLink: TBitBtn
      Left = 82
      Top = 135
      Width = 744
      TabOrder = 2
    end
    inherited btnCancelLink: TBitBtn
      Left = 832
      Top = 135
      Width = 98
      Cancel = True
      TabOrder = 3
    end
    object edtName: TDBEditEh
      Left = 82
      Top = 6
      Width = 854
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dbmmoO_DESCRIPTION: TDBMemoEh
      Left = 82
      Top = 33
      Width = 848
      Height = 96
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1086#1095#1082#1080
      ShowHint = True
      TabOrder = 1
      Visible = True
      WantReturns = True
    end
  end
  object pgcInfo: TPageControl [5]
    Left = 0
    Top = 324
    Width = 939
    Height = 226
    ActivePage = tsCoverage
    Align = alBottom
    TabOrder = 3
    OnChange = pgcInfoChange
    object tsCoverage: TTabSheet
      Caption = #1054#1087#1083#1072#1090#1099
      object pnlButtons: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 198
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          26
          198)
        object btnDel1: TSpeedButton
          Left = 0
          Top = 172
          Width = 22
          Height = 22
          Action = actDelP
          Anchors = [akLeft, akBottom]
          Flat = True
          Layout = blGlyphTop
        end
        object btnAdd1: TSpeedButton
          Left = 2
          Top = 3
          Width = 22
          Height = 22
          Action = actAddP
          Flat = True
        end
        object btnEdit1: TSpeedButton
          Left = 2
          Top = 31
          Width = 22
          Height = 22
          Action = actEditP
          Flat = True
        end
      end
      object dbgHistory: TDBGridEh
        Left = 26
        Top = 0
        Width = 905
        Height = 198
        Align = alClient
        DataSource = srcHistory
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        SearchPanel.Enabled = True
        SearchPanel.FilterOnTyping = True
        SumList.Active = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HDATE'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Title.SortIndex = 1
            Title.SortMarker = smDownEh
            Width = 79
          end
          item
            Alignment = taRightJustify
            CellButtons = <>
            DisplayFormat = '0.#########'
            DynProps = <>
            EditButtons = <>
            FieldName = 'RATE'
            Footers = <>
            Title.Caption = #1058#1072#1088#1080#1092
            Title.TitleButton = True
            Width = 98
          end
          item
            CellButtons = <>
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'PAY_PCE'
            Footer.DisplayFormat = '###,###,##0'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1054#1087#1083#1072#1095#1077#1085#1086'|'#1052#1086#1097#1085#1086#1089#1090#1100', '#1082#1042#1090
            Title.TitleButton = True
            Width = 90
          end
          item
            CellButtons = <>
            DisplayFormat = '###,###,##0.##'
            DynProps = <>
            EditButtons = <>
            FieldName = 'PAY_SUM'
            Footer.DisplayFormat = '###,###,##0.##'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1054#1087#1083#1072#1095#1077#1085#1086'|'#1057#1090#1086#1080#1084#1086#1089#1090#1100', '#1088#1091#1073'.'
            Title.TitleButton = True
            Width = 88
          end
          item
            CellButtons = <>
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'F_CNTR'
            Footer.DisplayFormat = '###,###,##0'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1056#1072#1089#1095#1105#1090#1085#1072#1103'|'#1087#1086' '#1089#1095#1077#1090#1095#1080#1082#1072#1084', '#1082#1042#1090' '
            Title.TitleButton = True
            Width = 104
          end
          item
            CellButtons = <>
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'F_PCE'
            Footer.DisplayFormat = '###,###,##0'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1056#1072#1089#1095#1105#1090#1085#1072#1103'|'#1087#1086' '#1084#1086#1097#1085#1086#1089#1090#1080', '#1082#1042#1090' '
            Title.TitleButton = True
            Width = 113
          end
          item
            CellButtons = <>
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'F_CNTR_PCE'
            Footer.DisplayFormat = '###,###,##0.##'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1056#1072#1089#1095#1105#1090#1085#1072#1103'|'#1057#1091#1084#1084#1072#1088#1085#1086', '#1082#1042#1090' '
            Title.TitleButton = True
            Width = 90
          end
          item
            CellButtons = <>
            DisplayFormat = '###,###,##0.##'
            DynProps = <>
            EditButtons = <>
            FieldName = 'F_PCE_S'
            Footer.DisplayFormat = '###,###,##0.##'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1056#1072#1089#1095#1105#1090#1085#1072#1103'|'#1057#1090#1086#1080#1084#1086#1089#1090#1100', '#1088#1091#1073
            Title.TitleButton = True
            Width = 93
          end
          item
            CellButtons = <>
            DisplayFormat = '###,###,##0'
            DynProps = <>
            EditButtons = <>
            FieldName = 'DIF_PCE'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1056#1072#1079#1085#1080#1094#1072'|'#1082#1042#1090
            Title.TitleButton = True
            Width = 64
          end
          item
            CellButtons = <>
            DisplayFormat = '###,###,##0.##'
            DynProps = <>
            EditButtons = <>
            FieldName = 'DIF_PCE_S'
            Footer.DisplayFormat = '###,###,##0.##'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1056#1072#1079#1085#1080#1094#1072'|'#1088#1091#1073'.'
            Title.TitleButton = True
            Width = 78
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 199
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsEP: TTabSheet
      Caption = #1058#1086#1095#1082#1080' '#1091#1095#1077#1090#1072
      ImageIndex = 1
      object dbgEP: TDBGridEh
        Left = 0
        Top = 0
        Width = 931
        Height = 198
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = srcElectroPoint
        DynProps = <>
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        PopupMenu = pmPopUp
        SearchPanel.Enabled = True
        SortLocal = True
        STFilter.Local = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnDblClick = dbGridDblClick
        OnGetFooterParams = dbGridGetFooterParams
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'O_NAME'
            Footer.FieldName = 'O_NAME'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1095#1082#1080
            Title.TitleButton = True
            Width = 326
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NCOUNT'
            Footer.FieldName = 'NCOUNT'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1059#1079#1083#1086#1074
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ECOUNTER'
            Footers = <>
            Title.Caption = #8470' '#1089#1095#1077#1090#1095#1080#1082#1072
            Title.TitleButton = True
            Width = 125
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'O_DESCRIPTION'
            Footers = <>
            Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 275
          end
          item
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'O_DELETED'
            Footers = <>
            Title.Caption = #1057#1082#1088#1099#1090#1100
            Title.TitleButton = True
            Visible = False
            Width = 84
          end
          item
            CellButtons = <>
            DisplayFormat = '#0.####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'PCE'
            Footer.DisplayFormat = '#0.####'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1082#1042#1090'|'#1059#1079#1083#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DisplayFormat = '#0.####'
            DynProps = <>
            EditButtons = <>
            FieldName = 'PCE_FACT'
            Footer.DisplayFormat = '#0.####'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1082#1042#1090'|'#1054#1073#1086#1088'-'#1103
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'O_DATEFIELD'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1089#1074#1077#1088#1082#1080
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsElectroRecipient
    OnDataChange = srcDataSourceDataChange
    Left = 496
    Top = 280
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 454
    inherited actNew: TAction
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    object actAddP: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 55
      OnExecute = actAddPExecute
    end
    object actEditP: TAction
      Hint = #1048#1084#1079#1077#1085#1080#1090#1100
      ImageIndex = 4
      OnExecute = actEditPExecute
    end
    object actDelP: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = actDelPExecute
    end
    object actLockPeriod: TAction
      Caption = 'actLockPeriod'
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 395
    Top = 407
  end
  inherited CnErrors: TCnErrorProvider
    Left = 304
    Top = 408
  end
  object dsElectroRecipient: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Objects_Iud(1, 77, :O_ID, :O_Name, :O_Descript' +
        'ion, null, 0)')
    DeleteSQL.Strings = (
      
        'execute procedure Objects_Iud(2, 77, :O_ID, :O_Name, :O_Descript' +
        'ion, null, 1)')
    InsertSQL.Strings = (
      
        'execute procedure Objects_Iud(0, 77, :O_ID, :O_Name, :O_Descript' +
        'ion, null, 0)'
      '')
    RefreshSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , o.O_TYPE'
      '  , o.O_NAME'
      '  , o.O_DESCRIPTION'
      '  , o.O_DELETED'
      '  , o.O_TYPE'
      
        '  , (select count(e.O_Name) from objects e where e.O_Type = 76 a' +
        'nd e.o_deleted = 0 and e.O_Numericfield = o.O_ID) EPC'
      'from OBJECTS o'
      'where O_TYPE = 77'
      '  and O_DELETED = 0'
      '  and O.O_ID = :OLD_O_ID')
    SelectSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , o.O_TYPE'
      '  , o.O_NAME'
      '  , o.O_DESCRIPTION'
      '  , o.O_DELETED'
      '  , o.O_TYPE'
      
        '  , (select count(e.O_Name) from objects e where e.O_Type = 76 a' +
        'nd e.o_deleted = 0 and e.O_Numericfield = o.O_ID) EPC'
      'from OBJECTS o'
      'where O_TYPE = 77'
      '  and O_DELETED = 0'
      'order by O_NAME  ')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 144
    Top = 136
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
    Left = 200
    Top = 190
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
    Left = 312
    Top = 188
  end
  object dsHistory: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OBJECTS_HISTORY'
      'SET '
      '    CVALUE = :CVALUE,'
      '    NVALUE = :NVALUE,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    O_ID = :O_ID'
      '    and O_TYPE = :O_TYPE'
      '    and HDATE = :HDATE'
      '    and HId = :HId'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    OBJECTS_HISTORY'
      'WHERE'
      '        O_ID = :OLD_O_ID'
      '    and O_TYPE = :OLD_O_TYPE'
      '    and HDATE = :OLD_HDATE'
      '    and HId = :HId'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS_HISTORY('
      '    O_ID,'
      '    O_TYPE,'
      '    HDATE,'
      '    CVALUE,'
      '    NVALUE,'
      '    NOTICE,'
      '    HId'
      ')'
      'VALUES('
      '    :O_ID,'
      '    :O_TYPE,'
      '    :HDATE,'
      '    :CVALUE,'
      '    :NVALUE,'
      '    :NOTICE,'
      '    :HId'
      ')')
    RefreshSQL.Strings = (
      'select * from GET_ER_PAY_STATISTIC(:O_ID)'
      'where HDATE = :OLD_HDATE and HID = :OLD_HID')
    SelectSQL.Strings = (
      'select * from GET_ER_PAY_STATISTIC(:O_ID)'
      'order by HDATE desc, HID'
      '')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 197
    Top = 443
    WaitEndMasterScroll = True
    oFetchAll = True
  end
  object srcHistory: TDataSource
    DataSet = dsHistory
    Left = 265
    Top = 302
  end
  object PropStorage: TPropStorageEh
    Section = 'ERF'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'pgcInfo.<P>.ActivePage'
      'pgcInfo.<P>.Height')
    Left = 97
    Top = 417
  end
  object dsElectroPoint: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , o.O_TYPE'
      '  , o.O_NAME'
      '  , o.O_DESCRIPTION'
      '  , o.O_DATEFIELD '
      
        '  , cast(coalesce(o.O_NUMERICFIELD, 0) as integer) O_NUMERICFIEL' +
        'D'
      '  , iif(o.O_Dimension <> '#39#39', o.O_Dimension, null) ECOUNTER'
      '  , (select'
      '         count(*)'
      '       from NODES n'
      '       where n.Epoint = o.O_ID) NCOUNT'
      '  , cast((select'
      '         sum(n.Pce)'
      '       from NODES n'
      '       where n.Epoint = o.O_ID) as D_N15_4) /1000 PCE'
      ''
      '  , cast((select'
      '         sum(coalesce(e.Pce, eg.O_Numericfield, 0))'
      '       from NODES n'
      '            inner join Equipment e on (e.Node_Id = n.Node_Id)'
      
        '            left outer join objects eg on (e.Eq_Group = eg.O_Id ' +
        'and eg.O_Type = 7)'
      '       where n.Epoint = o.O_ID) as D_N15_4)/1000 PCE_FACT'
      '  from OBJECTS o'
      '  where o.O_TYPE = 76'
      '        and o.o_DELETED = 0'
      '        and o.O_NUMERICFIELD = :O_ID '
      '  order by o.O_NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 552
    Top = 424
  end
  object srcElectroPoint: TDataSource
    AutoEdit = False
    DataSet = dsElectroPoint
    OnDataChange = srcDataSourceDataChange
    Left = 656
    Top = 440
  end
end
