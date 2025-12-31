object ReqPlanerForm: TReqPlanerForm
  Left = 0
  Top = 0
  Caption = #1055#1083#1072#1085#1080#1088#1086#1074#1097#1080#1082' '#1079#1072#1103#1074#1086#1082
  ClientHeight = 556
  ClientWidth = 722
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCalPickerPanel: TPanel
    Left = 0
    Top = 0
    Width = 209
    Height = 556
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object spl1: TSplitter
      Left = 0
      Top = 429
      Width = 209
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object gridResouce: TDBGridEh
      Left = 0
      Top = 329
      Width = 209
      Height = 100
      Align = alClient
      DataSource = srcFilter
      DynProps = <>
      Flat = True
      GridLineParams.ColorScheme = glcsThemedEh
      IndicatorOptions = [gioShowRowIndicatorEh, gioShowRowselCheckboxesEh]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      TabOrder = 2
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 148
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object plnrclndrpckrhCalendarPickerEh1: TPlannerCalendarPickerEh
      Left = 0
      Top = 0
      Width = 209
      Height = 185
      PlannerControl = PlannerControl
      Align = alTop
      BorderStyle = bsNone
      ParentCtl3D = False
      ParentColor = False
      TabOrder = 0
    end
    object pnl1: TPanel
      Left = 0
      Top = 185
      Width = 209
      Height = 144
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object cbbPlanerViewMode: TDBComboBoxEh
        Left = 8
        Top = 6
        Width = 195
        Height = 21
        DynProps = <>
        DropDownBox.Rows = 11
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1042#1080#1076' '#1087#1083#1072#1085#1080#1088#1086#1074#1097#1080#1082#1072
        EditButtons = <>
        Items.Strings = (
          #1056#1077#1078#1080#1084' '#1087#1088#1086#1089#1084#1086#1090#1088#1072' - '#1076#1077#1085#1100
          #1056#1077#1078#1080#1084' '#1087#1088#1086#1089#1084#1086#1090#1088#1072' - '#1085#1077#1076#1077#1083#1103
          #1056#1077#1078#1080#1084' '#1087#1088#1086#1089#1084#1086#1090#1088#1072' - '#1084#1077#1089#1103#1094
          #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' - '#1076#1077#1085#1100' '#1087#1086' '#1095#1072#1089#1072#1084
          #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' - '#1085#1077#1076#1077#1083#1103' '#1087#1086' '#1095#1072#1089#1072#1084
          #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' - '#1085#1077#1076#1077#1083#1103' '#1087#1086' '#1076#1085#1103#1084
          #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' - '#1084#1077#1089#1103#1094' '#1087#1086' '#1076#1085#1103#1084
          #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' - '#1076#1077#1085#1100' '#1087#1086' '#1095#1072#1089#1072#1084
          #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' - '#1085#1077#1076#1077#1083#1103' '#1087#1086' '#1095#1072#1089#1072#1084
          #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' - '#1085#1077#1076#1077#1083#1103' '#1087#1086' '#1076#1085#1103#1084
          #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' - '#1084#1077#1089#1103#1094' '#1087#1086' '#1076#1085#1103#1084)
        KeyItems.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11')
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnChange = cbbPlanerViewModeChange
      end
      object edtEndWorkTime: TDBDateTimeEditEh
        Left = 143
        Top = 55
        Width = 60
        Height = 21
        ControlLabel.Width = 12
        ControlLabel.Height = 13
        ControlLabel.Caption = #1087#1086
        ControlLabel.Visible = True
        ControlLabelLocation.Position = lpLeftTextBaselineEh
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 3
        Visible = True
        EditFormat = 'HH:NN'
      end
      object edtStartWorkTime: TDBDateTimeEditEh
        Left = 53
        Top = 55
        Width = 60
        Height = 21
        ControlLabel.Width = 38
        ControlLabel.Height = 13
        ControlLabel.Caption = #1042#1088#1077#1084#1103' '#1089
        ControlLabel.Visible = True
        ControlLabelLocation.Position = lpLeftTextBaselineEh
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 2
        Visible = True
        EditFormat = 'HH:NN'
      end
      object chkWorkOnly: TCheckBox
        Left = 8
        Top = 32
        Width = 195
        Height = 17
        Caption = #1058#1086#1083#1100#1082#1086' '#1088#1072#1073#1086#1095#1077#1077' '#1074#1088#1077#1084#1103
        TabOrder = 1
      end
      object bFillPlanner: TButton
        Left = 8
        Top = 113
        Width = 105
        Height = 25
        Caption = #1055#1088#1086#1095#1080#1090#1072#1090#1100' '#1079#1072#1103#1074#1082#1080
        TabOrder = 5
        OnClick = bFillPlannerClick
      end
      object NewPlanItem: TButton
        Left = 128
        Top = 113
        Width = 75
        Height = 25
        Caption = #1053#1086#1074#1072#1103' '#1079#1072#1103#1074#1082#1072
        TabOrder = 6
        Visible = False
      end
      object cbbGroupBy: TDBComboBoxEh
        Left = 8
        Top = 82
        Width = 195
        Height = 21
        DynProps = <>
        DropDownBox.Rows = 11
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1043#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086'...'
        EditButtons = <>
        Items.Strings = (
          ''
          #1058#1080#1087#1091' '#1079#1072#1103#1074#1082#1080)
        KeyItems.Strings = (
          '0'
          '1')
        ShowHint = True
        TabOrder = 4
        Visible = True
        OnChange = cbbGroupByChange
      end
    end
    object mmoItem: TDBMemoEh
      Left = 0
      Top = 432
      Width = 209
      Height = 124
      ScrollBars = ssVertical
      Align = alBottom
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 3
      Visible = True
      WantReturns = True
    end
  end
  object PlannerControl: TPlannerControlEh
    Left = 209
    Top = 0
    Width = 513
    Height = 556
    ActivePlannerView = PlannerDayViewEh1
    AllowedOperations = [paoAppendPlanItemEh, paoChangePlanItemEh]
    PlannerDataSource = pldsPlanner
    Align = alClient
    PrintService.ColorSchema = pcsFullColorEh
    TabOrder = 1
    OnPlannerItemInteractiveChanged = PlannerControlPlannerItemInteractiveChanged
    OnShowPlanItemDialog = PlannerControlShowPlanItemDialog
    object PlannerDayViewEh1: TPlannerDayViewEh
      Left = 0
      Top = 41
      Width = 509
      Height = 511
    end
    object PlannerWeekViewEh1: TPlannerWeekViewEh
      Left = 0
      Top = 41
      Width = 509
      Height = 511
    end
    object PlannerMonthViewEh1: TPlannerMonthViewEh
      Left = 0
      Top = 41
      Width = 509
      Height = 511
    end
    object PlannerVertDayslineViewEh1: TPlannerVertDayslineViewEh
      Left = 0
      Top = 41
      Width = 509
      Height = 511
    end
    object PlannerVertHourslineViewEh1: TPlannerVertHourslineViewEh
      Left = 0
      Top = 41
      Width = 509
      Height = 511
    end
    object PlannerHorzHourslineViewEh1: TPlannerHorzHourslineViewEh
      Left = 0
      Top = 41
      Width = 509
      Height = 511
    end
    object PlannerHorzDayslineViewEh1: TPlannerHorzDayslineViewEh
      Left = 0
      Top = 41
      Width = 509
      Height = 511
    end
  end
  object pldsPlanner: TPlannerDataSourceEh
    ItemSourceParams.FieldsMap = <>
    OnPrepareItemsReader = pldsPlannerPrepareItemsReader
    Left = 365
    Top = 111
  end
  object mtPlannerData: TMemTableEh
    Active = True
    Params = <>
    Left = 360
    Top = 168
    object MemTableData: TMemTableDataEh
      AutoIncCurValue = -19
      object DataStruct: TMTDataStructEh
        object Id: TMTNumericDataFieldEh
          FieldName = 'Id'
          NumericDataType = fdtAutoIncEh
          AutoIncrement = True
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object StartTime: TMTDateTimeDataFieldEh
          FieldName = 'StartTime'
          DateTimeDataType = fdtDateTimeEh
          DisplayWidth = 20
        end
        object EndTime: TMTDateTimeDataFieldEh
          FieldName = 'EndTime'
          DateTimeDataType = fdtDateTimeEh
          DisplayWidth = 20
        end
        object Title: TMTStringDataFieldEh
          FieldName = 'Title'
          StringDataType = fdtStringEh
          DisplayWidth = 20
          Size = 2000
        end
        object Body: TMTStringDataFieldEh
          FieldName = 'Body'
          StringDataType = fdtStringEh
          DisplayWidth = 10
          Size = 2000
        end
        object AllDay: TMTBooleanDataFieldEh
          FieldName = 'AllDay'
          DisplayWidth = 5
        end
        object FillColor: TMTStringDataFieldEh
          FieldName = 'FillColor'
          StringDataType = fdtStringEh
          DisplayWidth = 8
        end
        object ResourceID: TMTNumericDataFieldEh
          FieldName = 'ResourceID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 5
          currency = False
          Precision = 15
        end
        object InPlanner: TMTBooleanDataFieldEh
          FieldName = 'InPlanner'
          DisplayWidth = 5
        end
        object Category: TMTNumericDataFieldEh
          FieldName = 'Category'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 5
          currency = False
          Precision = 15
        end
        object ReadOnly: TMTBooleanDataFieldEh
          FieldName = 'ReadOnly'
          DisplayWidth = 5
        end
      end
      object RecordsList: TRecordsListEh
        Data = (
          (
            -2
            42018.0208333333d
            42018.5104166667d
            'Long event'
            
              'Detail info'#13#10'Planner have a field to store detial information ab' +
              'out the event'
            False
            nil
            0
            True
            1
            False)
          (
            -3
            42018.0625d
            42018.2395833333d
            'Busy time'
            ''
            False
            nil
            0
            True
            2
            False)
          (
            -4
            42018.4375d
            42018.6458333334d
            'Travel to office'
            ''
            False
            nil
            0
            True
            3
            False)
          (
            -5
            42002.0208333333d
            42002.0833333333d
            'Lunch time 1234'
            ''
            False
            nil
            0
            True
            1
            False)
          (
            -6
            42029.9166666667d
            42042.3333333333d
            'Long event 8d'
            ''
            False
            nil
            0
            True
            2
            False)
          (
            -7
            42017.5833333333d
            42019.5833333333d
            'Long event 3d'
            ''
            False
            nil
            0
            True
            2
            False)
          (
            -8
            42018.0208333333d
            42018.3541666666d
            'Event for Resource 1'
            ''
            False
            nil
            1
            True
            1
            False)
          (
            -9
            42018d
            42024.6666666667d
            'New Item 7d'
            ''
            False
            nil
            0
            True
            1
            False)
          (
            -11
            42009.125d
            42019.5d
            'New Item 1111'
            ''
            False
            nil
            0
            True
            2
            False)
          (
            -12
            42020d
            42022.7083333333d
            'New Item'
            ''
            False
            nil
            0
            True
            3
            False)
          (
            -13
            42018.0208333333d
            42018.5833333333d
            'New Item RES2'
            ''
            False
            nil
            2
            True
            3
            False)
          (
            -14
            42018.0208333333d
            42018.3958333333d
            'New Item res3'
            ''
            False
            nil
            3
            True
            3
            False)
          (
            -15
            42018.0833333333d
            42018.7291666667d
            'New Item'
            ''
            False
            nil
            0
            True
            3
            False)
          (
            -16
            42018.1875d
            42018.4166666667d
            'New Item. Read Only'
            ''
            False
            nil
            0
            True
            1
            True)
          (
            -17
            42018.7916666667d
            42018.9791666667d
            'New Item'
            ''
            False
            nil
            0
            True
            1
            False)
          (
            -18
            42018.2708333333d
            42018.3958333333d
            'New Item'
            ''
            False
            nil
            0
            True
            1
            False))
      end
    end
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 325
    Top = 307
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 387
    Top = 303
  end
  object drvPlan: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <
      item
        DataType = ftInteger
        Name = 'RQ_ID'
        ParamType = ptInput
      end>
    DeleteCommand.CommandText.Strings = (
      'DELETE FROM   REQUEST WHERE   RQ_ID = :RQ_ID')
    GetrecCommand.Params = <
      item
        DataType = ftInteger
        Name = 'RQ_ID'
        ParamType = ptInput
      end>
    GetrecCommand.CommandText.Strings = (
      'SELECT r.RQ_ID, '
      'r.RQ_TYPE, '
      'R.added_on RQ_DATE, '
      'r.RQ_CUSTOMER, '
      'r.RQ_COMPLETED,'
      'r.RQ_PLAN_DATE,'
      'coalesce(r.Rq_Defect, r.Rq_Content) as trouble,'
      'r.RQ_NOTICE,'
      'r.EDIT_BY,'
      'r.EDIT_ON, '
      'r.HOUSE_ID, '
      'r.FLAT_NO, '
      'r.PORCH_N, '
      'r.FLOOR_N, '
      'r.PHONE, '
      'r.ADDED_BY, '
      'r.ADDED_ON, '
      'r.RQ_TIME_FROM,'
      'r.RQ_TIME_TO,'
      
        'coalesce(cast(r.RQ_EXEC_TIME as date), cast(r.RQ_COMPLETED as da' +
        'te)) as GIV_EXEC_DATE,'
      'r.RQ_EXEC_TIME,'
      'r.GIVE_BY, '
      'r.GIVE_METHOD, '
      'r.REQ_RESULT,'
      'c.ACCOUNT_NO, c.CUST_CODE, c.SURNAME ||'#39' '#39' ||c.INITIALS as FIO, '
      
        'coalesce(RT.RT_PRINTFORM,'#39#39') as REPORT, coalesce(rt.RT_Name,'#39#39') ' +
        'as Rt_Name,'
      's.STREET_NAME||'#39' '#39'||s.street_short as STREET_NAME,'
      'h.HOUSE_NO,'
      'coalesce(r.flat_no,'#39#39') as FLAT_NO,'
      'CASE R.Req_Result'
      ' when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      ' when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      ' when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      ' when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      'end as Res_text,'
      '--rt.O_Numericfield as DAYS,'
      '1 as DAYS,'
      
        'coalesce(cast((select list(DISTINCT w.team) from Request_Executo' +
        'rs re inner join Worker w on (re.Exec_Id = w.Worker_Id) where re' +
        '.Rq_Id = r.Rq_Id) as VARCHAR(200)),'
      'wg.name) as TEAM'
      ''
      'FROM REQUEST R'
      '   inner join house h on (r.house_id = h.house_id)'
      '   inner join street s on (s.street_id = h.street_id)'
      '   left outer join workgroups wg on (wg.wg_id = h.wg_id)'
      '   LEFT OUTER JOIN REQUEST_TYPES RT ON (R.RQ_TYPE = RT.RT_Id)'
      '   LEFT OUTER JOIN CUSTOMER C ON (R.RQ_CUSTOMER = C.CUSTOMER_ID)'
      ' WHERE '
      '        R.RQ_ID = :RQ_ID'
      '    ')
    ProviderDataSet = dsRequest
    KeyFields = 'RQ_ID'
    Left = 518
    Top = 110
  end
  object srcPlan: TDataSource
    DataSet = dsRequest
    Left = 574
    Top = 110
  end
  object dsRequest: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    R.RQ_ID,'
      '    R.RQ_PLAN_DATE,'
      
        '    coalesce(TPL.RQ_CONTENT, '#39#39') || coalesce('#39'.'#39' || R.ADD_INFO, ' +
        #39#39') || iif(coalesce(R.RQ_CONTENT, '#39#39') <> '#39#39', coalesce('#39' ('#39' || R.' +
        'RQ_CONTENT || '#39')'#39', '#39#39'), '#39#39') as CONTETNT,'
      '    R.RQ_TIME_FROM,'
      '    R.RQ_TIME_TO,'
      '    R.REQ_RESULT,'
      '    C.ACCOUNT_NO,'
      '    C.SURNAME || '#39' '#39' || C.INITIALS as FIO,'
      '    coalesce(RT.RT_NAME, '#39#39') as RT_NAME,'
      '    S.STREET_NAME || '#39' '#39' || S.STREET_SHORT as STREET_NAME,'
      '    H.HOUSE_NO,'
      '    coalesce(R.FLAT_NO, '#39#39') as FLAT_NO,'
      '    R.RQ_TYPE,'
      '    coalesce(tpl.RQ_COLOR, RT.RT_COLOR) RT_COLOR,'
      '    RE.TEAM,'
      '    RE.WORKERS,'
      '    sa.Subarea_Name'
      '    from REQUEST R'
      '        inner join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)'
      '        inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      
        '        left outer join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_I' +
        'D)'
      
        '        left outer join CUSTOMER C on (R.RQ_CUSTOMER = C.CUSTOME' +
        'R_ID)'
      
        '        left outer join Subarea sa on (h.Subarea_Id = sa.Subarea' +
        '_Id)'
      
        '        left outer join REQUEST_TEMPLATES TPL on (TPL.RQTL_ID = ' +
        'R.RQTL_ID)'
      '        left outer join(select'
      '                            RE.RQ_ID,'
      '                            list(distinct W.TEAM) TEAM,'
      
        '                            list(W.SURNAME || coalesce('#39' '#39' || W.' +
        'FIRSTNAME, '#39#39'), '#39', '#39') as WORKERS'
      '                            from REQUEST_EXECUTORS RE'
      
        '                                inner join WORKER W on (RE.EXEC_' +
        'ID = W.WORKER_ID)'
      
        '                            group by RE.RQ_ID) RE on (RE.RQ_ID =' +
        ' R.RQ_ID)'
      '    where r.Rq_Plan_Date between :BDATE and :EDATE'
      '    ORDER BY R.RQ_ID  ')
    Transaction = trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 639
    Top = 110
  end
  object dsFilter: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select RT.RT_ID as ID, RT.RT_NAME as NAME from REQUEST_TYPES RT ' +
        'ORDER BY 2')
    Transaction = trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 543
    Top = 214
  end
  object srcFilter: TDataSource
    DataSet = dsFilter
    Left = 478
    Top = 214
  end
end
