object ReqExecutorsForm: TReqExecutorsForm
  Left = 557
  Top = 212
  ActiveControl = dbGrid
  Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080' '#1079#1072#1103#1074#1082#1080
  ClientHeight = 451
  ClientWidth = 716
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 0
    Top = 228
    Width = 716
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Panel2: TPanel
    Left = 0
    Top = 414
    Width = 716
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    inline OkCancelFrame1: TOkCancelFrame
      Left = 0
      Top = 0
      Width = 716
      Height = 37
      Align = alClient
      TabOrder = 0
      TabStop = True
      ExplicitWidth = 716
      ExplicitHeight = 37
      inherited Label2: TLabel
        Margins.Bottom = 0
      end
      inherited Label1: TLabel
        Margins.Bottom = 0
      end
      inherited bbOk: TBitBtn
        Left = 436
        Top = 6
        Width = 196
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Visible = False
        OnClick = OkCancelFrame1bbOkClick
        ExplicitLeft = 436
        ExplicitTop = 6
        ExplicitWidth = 196
        ExplicitHeight = 25
      end
      inherited bbCancel: TBitBtn
        Left = 638
        Top = 6
        Height = 25
        Caption = #1047#1072#1082#1088#1099#1090#1100
        ExplicitLeft = 638
        ExplicitTop = 6
        ExplicitHeight = 25
      end
    end
  end
  object pnlWork: TPanel
    Left = 0
    Top = 0
    Width = 716
    Height = 228
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlWork'
    TabOrder = 0
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 716
      Height = 228
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object spl2: TSplitter
        Left = 229
        Top = 0
        Height = 228
      end
      object dbGrid: TDBGridEh
        Left = 232
        Top = 0
        Width = 484
        Height = 228
        Align = alClient
        AllowedOperations = [alopUpdateEh]
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
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnEnter = dbGridEnter
        OnExit = dbGridExit
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FIO'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1060#1048#1054
            Width = 150
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'SELECTED'
            Footers = <>
            Title.Caption = #1048#1057#1055
            Width = 30
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1079#1072#1103#1074#1082#1080
            Width = 105
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'W_NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
            Width = 159
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dbgrdTeam: TDBGridEh
        Left = 0
        Top = 0
        Width = 229
        Height = 228
        Align = alLeft
        AllowedOperations = []
        DataSource = srcTeams
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
            FieldName = 'TEAM'
            Footers = <>
            Title.Caption = #1047#1074#1077#1085#1086
            Width = 118
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'AREA_NAME'
            Footers = <>
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object pnlTime: TPanel
    Left = 0
    Top = 231
    Width = 716
    Height = 183
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'pnlTime'
    TabOrder = 1
    object lbl1: TLabel
      Left = 0
      Top = 0
      Width = 161
      Height = 13
      Align = alTop
      Caption = #1047#1072#1103#1074#1082#1080' '#1085#1072' '#1101#1090#1086' '#1074#1088#1077#1084#1103' '#1080' '#1085#1072' '#1072#1076#1088#1077#1089
    end
    object dbgSame: TDBGridEh
      Left = 0
      Top = 13
      Width = 716
      Height = 170
      Align = alClient
      DataSource = srcSame
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      STFilter.Local = True
      STFilter.Visible = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STREET_SHORT'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089'| '
          Title.TitleButton = True
          Width = 19
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STREET_NAME'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089'|'#1091#1083#1080#1094#1072
          Title.TitleButton = True
          Width = 100
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'HOUSE_NO'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089'|'#1076#1086#1084
          Title.TitleButton = True
          Width = 44
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'SURNAME'
          Footers = <>
          Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
          Title.TitleButton = True
          Width = 73
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RQ_PLAN_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Title.TitleButton = True
          Width = 59
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RQ_TIME_FROM'
          Footers = <>
          Title.Caption = #1042#1088#1077#1084#1103'|c'
          Title.TitleButton = True
          Width = 33
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RQ_TIME_TO'
          Footers = <>
          Title.Caption = #1042#1088#1077#1084#1103'|'#1087#1086
          Title.TitleButton = True
          Width = 36
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RQ_CONTENT'
          Footers = <>
          Title.Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 88
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RT_NAME'
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1079#1072#1103#1074#1082#1080
          Title.TitleButton = True
          Width = 45
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RQ_ID'
          Footers = <>
          Title.Caption = #8470' '#1079#1072#1103#1074#1082#1080
          Title.TitleButton = True
          Width = 51
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object srcDataSource: TDataSource
    DataSet = dsReqExecutors
    Left = 271
    Top = 140
  end
  object dsReqExecutors: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure request_add_executors (:rq_id, :worker_id,:SEL' +
        'ECTED, :notice, 1);')
    DeleteSQL.Strings = (
      '')
    InsertSQL.Strings = (
      
        'execute procedure request_add_executors (:rq_id, :worker_id,:SEL' +
        'ECTED, :notice, 0);')
    SelectSQL.Strings = (
      'select'
      '    w.worker_id,'
      
        '    w.surname || '#39' '#39' || coalesce(w.firstname, '#39#39') || '#39' '#39' || coal' +
        'esce(w.midlename, '#39#39') as FIO,'
      '    w.phone_no,'
      '    re.notice,'
      '    w.NOTICE W_NOTICE, '
      '    case'
      '      when re.rq_id is null then 0'
      '      else 1'
      '    end as selected'
      '  from worker w'
      
        '       left outer join request_executors re on (re.exec_id = w.w' +
        'orker_id and'
      '             re.rq_id = :RQ_ID)'
      '  where w.working = 1'
      '        and w.in_request = 1'
      '        and (w.TEAM = :TEAM'
      '          or cast(:TEAM as varchar(100)) = '#39'<'#1042#1089#1077' '#1084#1086#1085#1090#1072#1078#1085#1080#1082#1080'>'#39')'
      '  order by 2')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcTeams
    Left = 267
    Top = 76
    WaitEndMasterScroll = True
    dcForceOpen = True
  end
  object srcSame: TDataSource
    DataSet = dsSame
    Left = 414
    Top = 162
  end
  object dsSame: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure request_add_executors (:rq_id, :worker_id,:SEL' +
        'ECTED, :notice, 1);')
    DeleteSQL.Strings = (
      '')
    InsertSQL.Strings = (
      
        'execute procedure request_add_executors (:rq_id, :worker_id,:SEL' +
        'ECTED, :notice, 0);')
    SelectSQL.Strings = (
      'select '
      
        '    s.street_name, s.street_short, h.house_no, r.rq_id, rt.Rt_Na' +
        'me, r.RQ_PLAN_DATE, r.rq_time_from, r.rq_time_to, w.surname, coa' +
        'lesce(tpl.Rq_Content||'#39'.'#39','#39#39')||coalesce(r.rq_content,'#39#39') as rq_c' +
        'ontent'
      'from request r'
      '   inner join house h on (r.house_id = h.house_id)'
      '   inner join street s on (h.street_id = s.street_id)'
      
        '       left outer join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_ID' +
        ')'
      
        '       left outer join CUSTOMER C on (R.RQ_CUSTOMER = C.CUSTOMER' +
        '_ID)'
      
        '       left outer join REQUEST_TEMPLATES TPL on (TPL.RQTL_ID = R' +
        '.RQTL_ID)'
      
        '       left outer join request_executors re on (r.rq_id = re.rq_' +
        'id)'
      '   left outer join worker w on (re.exec_id = w.worker_id)'
      '  where ((exists(select'
      '                             h1.house_id'
      '                           from house h1'
      
        '                           where h1.house_id = r.house_id and ex' +
        'ists(select'
      
        '                                                      h2.street_' +
        'id'
      
        '                                                    from house h' +
        '2'
      
        '                                                    where h2.str' +
        'eet_id = h1.street_id and house_id = :house_id))))'
      'and r.RQ_PLAN_DATE = :RQ_PLAN_DATE'
      'and r.REQ_RESULT < 2'
      'and r.rq_id <> :rq_id'
      'order by 1,2')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcRqst
    Left = 410
    Top = 89
    poUseBooleanField = False
    poImportDefaultValues = False
    poGetOrderInfo = False
    poEmptyStrToNull = False
    dcForceOpen = True
  end
  object dsRqst: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select r.rq_id, r.house_id, r.RQ_PLAN_DATE, r.rq_time_from, r.rq' +
        '_time_to from request r where r.rq_id = :rq_id')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    Left = 258
    Top = 217
    poUseBooleanField = False
    poImportDefaultValues = False
    poGetOrderInfo = False
    poEmptyStrToNull = False
    dcForceOpen = True
  end
  object srcRqst: TDataSource
    DataSet = dsRqst
    Left = 309
    Top = 216
  end
  object srcTeams: TDataSource
    AutoEdit = False
    DataSet = dsTeams
    Left = 68
    Top = 149
  end
  object dsTeams: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select wg.name as TEAM, A.name as area_name, coalesce((select 1 ' +
        'from request r inner join house h on (r.house_id = h.house_id) w' +
        'here h.wg_id = wg.wg_id and r.rq_id = :RQ_ID),0)'
      'from workgroups wg'
      'inner join WORKAREA a on (wg.wa_id =  a.WA_ID)'
      'union'
      
        'select '#39'<'#1042#1089#1077' '#1084#1086#1085#1090#1072#1078#1085#1080#1082#1080'>'#39' as TEAM, '#39'<'#1042#1089#1077' '#1084#1086#1085#1090#1072#1078#1085#1080#1082#1080'>'#39' area_name,' +
        ' 0'
      'from RDB$DATABASE'
      'order by 3 desc ,2,1')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_GROUP'
    AutoUpdateOptions.KeyFields = 'MG_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 68
    Top = 96
  end
  object frmStore: TFormStorage
    StoredProps.Strings = (
      'dbgrdTeam.Width'
      'pnlTime.Height')
    StoredValues = <>
    Left = 330
    Top = 41
  end
end
