object apgCustomerSrv: TapgCustomerSrv
  Left = 0
  Top = 0
  Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1091#1089#1083#1091#1075#1080
  ClientHeight = 254
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel7: TPanel
    Left = 31
    Top = 0
    Width = 699
    Height = 254
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlSubscrServ: TPanel
      Left = 0
      Top = 0
      Width = 699
      Height = 254
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Splitter3: TSplitter
        Left = 0
        Top = 168
        Width = 699
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object dbgCustSubscrServ: TDBGridEh
        Left = 0
        Top = 0
        Width = 699
        Height = 168
        Align = alClient
        AllowedOperations = []
        DataSource = srcServices
        DynProps = <>
        EvenRowColor = clWindow
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        FooterParams.HorzLines = False
        FooterParams.VertLines = False
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        OddRowColor = clInfoBk
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        PopupMenu = pmGrid
        ReadOnly = True
        STFilter.InstantApply = True
        STFilter.Local = True
        STFilter.Visible = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        TitleParams.VTitleMargin = 4
        OnDblClick = dbgCustSubscrServDblClick
        OnGetCellParams = dbgCustSubscrServGetCellParams
        OnSumListAfterRecalcAll = dbgCustSubscrServSumListAfterRecalcAll
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footer.Alignment = taRightJustify
            Footer.Value = #1047#1072' '#1084#1077#1089#1103#1094
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 122
          end
          item
            CellButtons = <>
            DisplayFormat = '#.##'
            DynProps = <>
            EditButtons = <>
            FieldName = 'tarif_sum'
            Footer.DisplayFormat = '#.##'
            Footer.FieldName = 'TARIF_SUM'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1058#1072#1088#1080#1092
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STATE'
            Footer.Alignment = taRightJustify
            Footer.Value = #1042' '#1076#1077#1085#1100
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Caption = #1057#1090#1072#1090#1091#1089
            Title.TitleButton = True
            Width = 100
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STATE_DATE'
            Footer.DisplayFormat = '#.##'
            Footer.FieldName = 'TARIF_DAY'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1089#1090'.'
            Title.Hint = #1044#1072#1090#1072' '#1089#1090#1072#1090#1091#1089#1072
            Title.TitleButton = True
            Width = 73
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STATE_SRV_NAME'
            Footer.ValueType = fvtStaticText
            Footers = <>
            Title.Caption = #1059#1089#1083#1091#1075#1072' '#1087#1086#1076#1082#1083'./'#1086#1090#1082#1083'.'
            Title.Hint = #1059#1089#1083#1091#1075#1072' '#1089#1090#1072#1090#1091#1089#1072
            Title.TitleButton = True
            Width = 202
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CONTRACT'
            Footers = <>
            Title.Caption = #1044#1086#1075#1086#1074#1086#1088
            Title.TitleButton = True
            Width = 84
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CONTRACT_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1076#1086#1075'.'
            Title.TitleButton = True
            Width = 93
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'VAT_GROUP'
            Footers = <>
            Title.Caption = #1053#1044#1057
            Title.TitleButton = True
            Width = 40
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 115
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WHO_LAST'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1080#1083
            Title.TitleButton = True
            Width = 83
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'BUSINESS'
            Footers = <>
            Title.Caption = #1042#1080#1076' '#1091#1089#1083#1091#1075#1080
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'WORKER'
            Footers = <>
            Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
            Title.TitleButton = True
            Visible = False
            Width = 67
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnlPersonelTarif: TPanel
        Left = 0
        Top = 171
        Width = 699
        Height = 83
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Label14: TLabel
          Left = 0
          Top = 0
          Width = 699
          Height = 13
          Align = alTop
          Caption = '.:: '#1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1081' '#1090#1072#1088#1080#1092' ::.'
        end
        object dbgPersTarif: TDBGridEh
          Left = 27
          Top = 13
          Width = 672
          Height = 70
          Align = alClient
          DataSource = srcPersonelTarif
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          Columns = <
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'TARIF_ID'
              Footers = <>
              Title.TitleButton = True
              Visible = False
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DATE_FROM'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1089
              Title.TitleButton = True
              Title.SortIndex = 1
              Title.SortMarker = smDownEh
              Width = 95
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DATE_TO'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1087#1086
              Title.TitleButton = True
              Width = 87
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'TARIF_SUM'
              Footers = <>
              Title.Caption = #1058#1072#1088#1080#1092
              Title.TitleButton = True
              Width = 111
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 118
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object tbPersTar: TToolBar
          Left = 0
          Top = 13
          Width = 27
          Height = 70
          Align = alLeft
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = A4MainForm.ICONS_ACTIVE
          TabOrder = 0
          object btnPersAdd: TToolButton
            Left = 0
            Top = 0
            Action = actPersAdd
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object btnPersEdit: TToolButton
            Left = 0
            Top = 22
            Action = actPersEdit
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object btnPersDel: TToolButton
            Left = 0
            Top = 44
            Action = actPersDel
            ParentShowHint = False
            ShowHint = True
          end
        end
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 31
    Height = 254
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 31
      Height = 151
      ButtonHeight = 30
      ButtonWidth = 30
      Caption = 'ToolBar1'
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = A4MainForm.ICONS_ACTIVE
      TabOrder = 0
      Transparent = False
      object ToolButton2: TToolButton
        Left = 0
        Top = 0
        Action = actSrvAdd
        Wrap = True
      end
      object ToolButton1: TToolButton
        Left = 0
        Top = 30
        Action = ActSrvOn
        Wrap = True
      end
      object ToolButton3: TToolButton
        Left = 0
        Top = 60
        Action = ActSrvOff
        Wrap = True
      end
      object ToolButton4: TToolButton
        Left = 0
        Top = 90
        Action = actSrvSwitch
        Wrap = True
      end
      object ToolButton5: TToolButton
        Left = 0
        Top = 120
        Action = actSrvPause
      end
    end
    object ToolBar2: TToolBar
      Left = 0
      Top = 223
      Width = 31
      Height = 31
      Align = alBottom
      ButtonHeight = 30
      ButtonWidth = 30
      Caption = 'ToolBar2'
      Images = A4MainForm.ICONS_ACTIVE
      TabOrder = 1
      object ToolButton6: TToolButton
        Left = 0
        Top = 0
        Action = actSubscrHistory
      end
    end
  end
  object dsServices: TpFIBDataSet
    RefreshSQL.Strings = (
      'select'
      '    sl.*'
      
        '  , coalesce(sl.tarif_sum / extract(day from dateadd(-1 day to(d' +
        'ateadd(1 month to current_date - extract(day from current_date) ' +
        '+ 1)))), 0) as tarif_day'
      
        '  , iif(exists(select l.Link_Id from SERVICES_LINKS l where l.PA' +
        'RENT is null and l.CHILD = sl.SERV_ID), 1, 0) as SRV_ACTIVE  '
      '  from (select'
      '            SS.*'
      '          , s.name'
      '          ,'
      '            case ss.state_sgn'
      '              when 0 then '#39#1054#1090#1082#1083#1102#1095#1077#1085#39
      '              when 1 then '#39#1055#1086#1076#1082#1083#1102#1095#1077#1085#39
      '              else '#39#1085#1077#1087#1086#1085#1103#1090#1082#1080' '#39#39#39' || ss.state_sgn || '#39#39#39#39
      '            end as State,'
      '            coalesce(w.Surname, ss.State_Change_By) as WHO_LAST'
      '          , sd.Name as STATE_SRV_NAME'
      '          , o.o_name as VAT_GROUP'
      '          ,'
      '            (select'
      '                 M_TARIF'
      
        '               from Get_Tarif_Sum_Customer_Srv(ss.Customer_Id, s' +
        's.Serv_Id, current_date)'
      ''
      '            ) tarif_sum'
      '          , b.O_NAME BUSINESS'
      '          from SUBSCR_SERV SS'
      
        '               inner join services s on (s.service_id = ss.Serv_' +
        'Id)'
      
        '               inner join objects b on (b.O_Id = s.BUSINESS_TYPE' +
        ' and'
      '                     b.O_TYPE = 15)'
      
        '               left outer join services sd on (ss.State_Srv = sd' +
        '.Service_Id)'
      
        '               left outer join worker w on (w.Ibname = ss.State_' +
        'Change_By)'
      
        '               left outer join objects o on (o.o_id = ss.vatg_id' +
        ' and'
      '                     o.o_type = 13)'
      'where ss.CUSTOMER_ID=:OLD_CUSTOMER_ID'
      'and SS.SUBSCR_SERV_ID = :OLD_SUBSCR_SERV_ID'
      ') sl'
      '  order by state_sgn desc, name'
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    sl.*'
      
        '  , coalesce(sl.tarif_sum / extract(day from dateadd(-1 day to(d' +
        'ateadd(1 month to current_date - extract(day from current_date) ' +
        '+ 1)))), 0) as tarif_day'
      
        '  , iif(exists(select l.Link_Id from SERVICES_LINKS l where l.PA' +
        'RENT is null and l.CHILD = sl.SERV_ID), 1, 0) as SRV_ACTIVE'
      '  from (select'
      '            SS.*'
      '          , s.name'
      '          , case ss.state_sgn'
      '              when 0 then '#39#1054#1090#1082#1083#1102#1095#1077#1085#39
      '              when 1 then '#39#1055#1086#1076#1082#1083#1102#1095#1077#1085#39
      '              else '#39#1085#1077#1087#1086#1085#1103#1090#1082#1080' '#39#39#39' || ss.state_sgn || '#39#39#39#39
      '            end as State,'
      '            coalesce(w.Surname, ss.State_Change_By) as WHO_LAST'
      '          , sd.Name as STATE_SRV_NAME'
      '          , o.o_name as VAT_GROUP'
      '          , (select'
      '                 M_TARIF'
      
        '               from Get_Tarif_Sum_Customer_Srv(ss.Customer_Id, s' +
        's.Serv_Id, current_date)'
      ''
      '            ) tarif_sum'
      '          , b.O_NAME BUSINESS'
      '          from SUBSCR_SERV SS'
      
        '               inner join services s on (s.service_id = ss.Serv_' +
        'Id)'
      
        '               inner join objects b on (b.O_Id = s.BUSINESS_TYPE' +
        ' and b.O_TYPE = 15)'
      
        '               left outer join services sd on (ss.State_Srv = sd' +
        '.Service_Id)'
      
        '               left outer join worker w on (w.Ibname = ss.State_' +
        'Change_By)'
      
        '               left outer join objects o on (o.o_id = ss.vatg_id' +
        ' and o.o_type = 13)'
      '          where ss.CUSTOMER_ID = :CUSTOMER_ID) sl'
      '  order by state_sgn desc, name')
    AutoUpdateOptions.UpdateTableName = 'SUBSCR_SERV'
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 385
    Top = 43
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcServices: TDataSource
    AutoEdit = False
    DataSet = dsServices
    OnDataChange = srcServicesDataChange
    Left = 385
    Top = 94
  end
  object dsPersonelTarif: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PERSONAL_TARIF'
      'WHERE'
      '        TARIF_ID = :OLD_TARIF_ID'
      '    ')
    RefreshSQL.Strings = (
      
        'select pt.customer_id, pt.service_id, pt.tarif_id, pt.date_from,' +
        ' pt.date_to, pt.tarif_sum, pt.Notice'
      'from personal_tarif pt'
      'where TARIF_ID = :OLD_TARIF_ID'
      '    '
      ''
      '')
    SelectSQL.Strings = (
      
        'select pt.customer_id, pt.service_id, pt.tarif_id, pt.date_from,' +
        ' pt.date_to, pt.tarif_sum, pt.Notice'
      'from personal_tarif pt'
      'where pt.service_id = :serv_id'
      '  and pt.customer_id = :customer_id'
      'order by pt.date_from desc')
    AutoUpdateOptions.UpdateTableName = 'SUBSCR_SERV'
    AutoUpdateOptions.KeyFields = 'TARIF_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcServices
    Left = 477
    Top = 53
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcPersonelTarif: TDataSource
    AutoEdit = False
    DataSet = dsPersonelTarif
    OnDataChange = srcPersonelTarifDataChange
    Left = 481
    Top = 103
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 285
    Top = 48
    object actSubscrHistory: TAction
      Category = 'Services'
      Caption = #1048#1089#1090#1086#1088#1080#1103
      Hint = #1048#1089#1090#1086#1088#1080#1103' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1081
      ImageIndex = 56
      OnExecute = actSubscrHistoryExecute
    end
    object actSrvAdd: TAction
      Category = 'Services'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1091#1075#1091' '#1072#1073#1086#1085#1077#1085#1090#1091
      ImageIndex = 2
      OnExecute = actSrvAddExecute
    end
    object ActSrvOn: TAction
      Category = 'Services'
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1091#1089#1083#1091#1075#1091
      ImageIndex = 11
      OnExecute = ActSrvOnExecute
    end
    object ActSrvOff: TAction
      Category = 'Services'
      Caption = #1042#1099#1082#1083#1102#1095#1080#1090#1100
      Hint = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1091#1089#1083#1091#1075#1091
      ImageIndex = 12
      OnExecute = ActSrvOffExecute
    end
    object actSrvSwitch: TAction
      Category = 'Services'
      Caption = #1055#1077#1088#1077#1082#1083#1102#1095#1080#1090#1100
      Hint = #1055#1077#1088#1077#1082#1083#1102#1095#1080#1090#1100' '#1089' '#1091#1089#1083#1091#1075#1080' '#1085#1072' '#1091#1089#1083#1091#1075#1091
      ImageIndex = 54
      Visible = False
      OnExecute = actSrvSwitchExecute
    end
    object actSrvPause: TAction
      Category = 'Services'
      Caption = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1085#1072' '#1087#1072#1091#1079#1091
      Hint = #1042#1088#1077#1084#1077#1085#1085#1086#1077' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1077' '#1091#1089#1083#1091#1075#1080' ('#1087#1072#1091#1079#1072').'
      ImageIndex = 48
      OnExecute = actSrvPauseExecute
    end
    object actPersAdd: TAction
      Category = 'Services'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1081' '#1090#1072#1088#1080#1092
      ImageIndex = 2
      OnExecute = actPersAddExecute
    end
    object actPersEdit: TAction
      Category = 'Services'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1081' '#1090#1072#1088#1080#1092
      ImageIndex = 4
      OnExecute = actPersEditExecute
    end
    object actPersDel: TAction
      Category = 'Services'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1081' '#1090#1072#1088#1080#1092
      ImageIndex = 3
      OnExecute = actPersDelExecute
    end
    object actChangeNotice: TAction
      Category = 'Services'
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
      OnExecute = actChangeNoticeExecute
    end
    object actServiceSummary: TAction
      Category = 'Services'
      Caption = #1057#1091#1084#1084#1072#1088#1085#1086' '#1087#1086' '#1091#1089#1083#1091#1075#1077
      ImageIndex = 101
      OnExecute = actServiceSummaryExecute
    end
  end
  object pmGrid: TPopupMenu
    Images = A4MainForm.ICONS_ACTIVE
    Left = 100
    Top = 48
    object N1: TMenuItem
      Action = ActSrvOn
    end
    object TMenuItem
      Action = ActSrvOff
    end
    object N2: TMenuItem
      Action = actSrvPause
    end
    object N3: TMenuItem
      Action = actSrvSwitch
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object miAdSrv: TMenuItem
      Action = actPersAdd
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Action = actSubscrHistory
      Default = True
    end
    object miServiceSummary: TMenuItem
      Action = actServiceSummary
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N8: TMenuItem
      Action = actChangeNotice
    end
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 172
    Top = 58
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
    Left = 216
    Top = 58
  end
end
