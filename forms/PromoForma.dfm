inherited PromoForm: TPromoForm
  Left = 381
  Top = 171
  Caption = #1040#1082#1094#1080#1080' '
  ClientHeight = 435
  ClientWidth = 863
  ExplicitWidth = 879
  ExplicitHeight = 474
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 203
    Width = 863
    Height = 4
    ExplicitTop = 193
    ExplicitWidth = 926
    ExplicitHeight = 4
  end
  inherited dbGrid: TDBGridEh
    Top = 207
    Width = 863
    Height = 228
    AllowedOperations = [alopUpdateEh]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_ID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_TYPE'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DATEFIELD'
        Footers = <>
        Title.Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090'|'#1089
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DATEEND'
        Footers = <>
        Title.Caption = #1044#1077#1081#1089#1090#1074#1091#1077#1090'|'#1087#1086
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
        Width = 196
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Width = 131
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_CHARFIELD'
        Footers = <>
        Title.Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
        Width = 206
      end>
  end
  inherited tlbMain: TToolBar
    Width = 863
    ExplicitWidth = 863
    inherited ToolButton5: TToolButton
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
      OnClick = tbCancelClick
    end
  end
  inherited pnlEdit: TPanel
    Width = 863
    Height = 178
    ExplicitWidth = 863
    ExplicitHeight = 178
    object Label1: TLabel [0]
      Left = 5
      Top = 7
      Width = 53
      Height = 13
      Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
    end
    object lbl2: TLabel [1]
      Left = 5
      Top = 34
      Width = 65
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    end
    object lbl3: TLabel [2]
      Left = 215
      Top = 34
      Width = 83
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
    end
    object Label2: TLabel [3]
      Left = 5
      Top = 90
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object lblCF: TLabel [4]
      Left = 604
      Top = 7
      Width = 202
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1080' '#1087#1077#1088#1080#1086#1076' '#1076#1077#1081#1089#1090#1074#1080#1103' ('#1084#1077#1089'.)'
    end
    inherited btnSaveLink: TBitBtn
      Left = 82
      Top = 150
      Width = 668
      TabOrder = 8
      ExplicitLeft = 82
      ExplicitTop = 150
      ExplicitWidth = 668
    end
    inherited btnCancelLink: TBitBtn
      Left = 768
      Top = 150
      Cancel = True
      TabOrder = 9
      ExplicitLeft = 768
      ExplicitTop = 150
    end
    object dbeName: TDBEditEh
      Left = 82
      Top = 4
      Width = 512
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1047#1072#1075#1086#1083#1086#1074#1086#1082' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnEnter = dbeNameEnter
    end
    object edStart: TDBDateTimeEditEh
      Left = 82
      Top = 31
      Width = 121
      Height = 21
      Anchors = [akLeft, akBottom]
      DataField = 'O_DATEFIELD'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object edEND: TDBDateTimeEditEh
      Left = 307
      Top = 31
      Width = 121
      Height = 21
      Anchors = [akLeft, akBottom]
      DataField = 'O_DATEEND'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object chkAll: TCheckBox
      Left = 82
      Top = 63
      Width = 73
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = #1042#1089#1077' '#1091#1089#1083#1091#1075#1080
      TabOrder = 3
      OnClick = chkAllClick
    end
    object pnlService: TPanel
      Left = 161
      Top = 58
      Width = 433
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 4
      DesignSize = (
        433
        25)
      object lbl4: TLabel
        Left = 7
        Top = 6
        Width = 35
        Height = 13
        Caption = #1059#1089#1083#1091#1075#1072
      end
      object lcbService: TDBLookupComboboxEh
        Left = 56
        Top = 3
        Width = 377
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        DropDownBox.Columns = <
          item
            FieldName = 'NAME'
          end
          item
            FieldName = 'DESCRIPTION'
          end>
        DropDownBox.ListSource = srcService
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterType = lsftContainsEh
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.AutoDrop = True
        EmptyDataInfo.Text = #1057#1082#1080#1076#1082#1072' '#1076#1083#1103' '#1091#1089#1083#1091#1075#1080
        EditButtons = <>
        KeyField = 'SERVICE_ID'
        ListField = 'NAME'
        ListSource = srcService
        ShowHint = True
        Style = csDropDownEh
        TabOrder = 0
        Visible = True
        OnClick = lcbServiceClick
        OnEnter = lcbServiceEnter
      end
    end
    object pnlSrvType: TPanel
      Left = 159
      Top = 58
      Width = 435
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      BevelOuter = bvNone
      Caption = 'pnlSrvType'
      TabOrder = 5
      Visible = False
      DesignSize = (
        435
        25)
      object lbl11: TLabel
        Left = 1
        Top = 6
        Width = 50
        Height = 13
        Caption = #1042#1080#1076' '#1091#1089#1083#1091#1075
      end
      object lcbSrvType: TDBLookupComboboxEh
        Left = 56
        Top = 3
        Width = 376
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        DropDownBox.Columns = <
          item
            FieldName = 'NAME'
          end>
        DropDownBox.ListSource = srcSrvType
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.AutoDrop = True
        EmptyDataInfo.Text = #1057#1082#1080#1076#1082#1072' '#1076#1083#1103' '#1042#1080#1076#1072' '#1091#1089#1083#1091#1075
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = srcSrvType
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
    end
    object mmoText: TDBMemoEh
      Left = 82
      Top = 89
      Width = 512
      Height = 57
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1072#1085#1080#1077' '#1072#1082#1094#1080#1080
      ShowHint = True
      TabOrder = 7
      Visible = True
      WantReturns = True
    end
    object dbgCF: TDBGridEh
      Left = 600
      Top = 31
      Width = 254
      Height = 115
      Anchors = [akTop, akRight]
      DataSource = srcCF
      DynProps = <>
      SearchPanel.Location = splHorzScrollBarExtraPanelEh
      TabOrder = 6
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'dur'
          Footers = <>
          Title.Caption = #1055#1077#1088#1080#1086#1076' ('#1084#1077#1089')'
          Width = 82
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Cf'
          Footers = <>
          Title.Caption = #1050#1086#1077#1092#1092#1080#1094#1080#1077#1085#1090
          Width = 133
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object btnPlus: TButton
      Left = 812
      Top = 7
      Width = 18
      Height = 18
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' (Ins '#1080#1083#1080' '#1089#1090#1088#1077#1083#1082#1072' '#1074#1085#1080#1079' '#1074' '#1090#1072#1073#1083#1080#1094#1077')'
      Anchors = [akTop, akRight]
      Caption = '+'
      TabOrder = 10
      TabStop = False
      OnClick = btnPlusClick
    end
    object btnMinus: TButton
      Left = 836
      Top = 7
      Width = 18
      Height = 18
      Hint = #1059#1076#1072#1083#1080#1090#1100' (Ctrl+Del '#1074' '#1090#1072#1073#1083#1080#1094#1077')'
      Anchors = [akTop, akRight]
      Caption = '-'
      TabOrder = 11
      TabStop = False
      OnClick = btnMinusClick
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsPromo
    OnStateChange = srcDataSourceStateChange
    OnDataChange = srcDataSourceDataChange
    Left = 48
    Top = 320
  end
  inherited actions: TActionList
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actEditExecute
    end
    inherited actQuickFilter: TAction
      Hint = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 59
    Top = 383
  end
  inherited CnErrors: TCnErrorProvider
    Left = 16
    Top = 208
  end
  object dsPromo: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '  O_ID           =:O_ID,'
      '  O_NAME         =:O_NAME,'
      '  O_CHARFIELD    =:O_CHARFIELD,'
      '  O_DESCRIPTION  =:O_DESCRIPTION,'
      '  O_DATEFIELD    =:O_DATEFIELD,'
      '  O_DATEEND      =:O_DATEEND,'
      '  O_DELETED      =:O_DELETED'
      'WHERE'
      '    O_ID = :OLD_O_ID and O_TYPE = 70'
      '')
    DeleteSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_DELETED = 1'
      'WHERE'
      '    O_ID = :OLD_O_ID '
      '    and O_TYPE = 70'
      '    '
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS('
      '    O_ID'
      '  , O_NAME'
      '  , O_CHARFIELD'
      '  , O_DESCRIPTION'
      '  , O_DATEFIELD'
      '  , O_DATEEND'
      '  , O_DELETED'
      '  , O_TYPE'
      ')'
      'VALUES('
      '    :O_ID'
      '  , :O_NAME'
      '  , :O_CHARFIELD'
      '  , :O_DESCRIPTION'
      '  , :O_DATEFIELD'
      '  , :O_DATEEND'
      '  , 0'
      '  , 70'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_CHARFIELD'
      '  , O_DESCRIPTION'
      '  , O_DATEFIELD'
      '  , O_DATEEND'
      '  , O_DELETED'
      '  from OBJECTS'
      '  where O_TYPE = 70'
      '    and O_DELETED = 0 '
      '    and O_ID = :OLD_O_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_CHARFIELD'
      '  , O_DESCRIPTION'
      '  , O_DATEFIELD'
      '  , O_DATEEND'
      '  , O_DELETED'
      '  from OBJECTS'
      '  where O_TYPE = 70'
      '    and O_DELETED = 0  '
      ''
      'order by O_DATEFIELD')
    AutoUpdateOptions.UpdateTableName = 'OBJECTS'
    AutoUpdateOptions.KeyFields = 'O_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 160
    Top = 312
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
    Left = 136
    Top = 382
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
    Left = 196
    Top = 382
  end
  object dsSrvType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    *'
      '  from (select'
      '            -1 as Id'
      '          , '#39#1042#1089#1077#39' as Name'
      '          from rdb$database'
      '        union'
      '        select distinct'
      '            o.O_Id'
      '          , o.O_Name'
      '          from services s'
      
        '               inner join objects o on (o.O_Id = s.Business_Type' +
        ' and o.O_Type = 15))'
      '  order by id  ')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 472
    Top = 352
  end
  object dsService: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct'
      '    s.Name || coalesce('#39' / '#39' ||(select'
      
        '                                    iif((coalesce(t.Tarif_Sum, 0' +
        ') = coalesce(t.TARIF_SUM_JUR, 0)), coalesce(t.Tarif_Sum, 0), coa' +
        'lesce(t.Tarif_Sum, 0) || '#39'/'#39' || coalesce(t.TARIF_SUM_JUR, 0))'
      '                                  from tarif t'
      
        '                                  where t.Service_Id = s.Service' +
        '_Id'
      
        '                                        and current_date between' +
        ' t.Date_From and t.Date_To)'
      ''
      '    , '#39#39') Name'
      ''
      '  , s.SERVICE_ID'
      '  , s.DESCRIPTION'
      '  , SRV_TYPE_ID '
      '  from SERVICES s'
      
        '       left outer join SERVICES_LINKS sl on (S.SERVICE_ID = sl.C' +
        'HILD and sl.LINK_TYPE = 0)'
      
        '  where (SRV_TYPE_ID = 0 and sl.LINK_TYPE = 0) or (SRV_TYPE_ID =' +
        ' 1)'
      '  order by NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 504
    Top = 304
  end
  object srcSrvType: TDataSource
    DataSet = dsSrvType
    Left = 560
    Top = 352
  end
  object srcService: TDataSource
    DataSet = dsService
    Left = 560
    Top = 304
  end
  object mtCF: TMemTableEh
    Params = <>
    Left = 688
    Top = 105
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object dur: TMTNumericDataFieldEh
          FieldName = 'dur'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayLabel = #1055#1077#1088#1080#1086#1076
          DisplayWidth = 20
          Required = True
          currency = False
          MaxValue = 1000.000000000000000000
          MinValue = 1.000000000000000000
          Precision = 15
        end
        object cf: TMTNumericDataFieldEh
          FieldName = 'cf'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayLabel = #1050#1086#1077#1092#1092#1080#1094#1077#1085#1090
          DisplayWidth = 20
          Required = True
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object srcCF: TDataSource
    DataSet = mtCF
    Left = 744
    Top = 113
  end
end
