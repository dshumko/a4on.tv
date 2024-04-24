object CustSubscrHistoryForma: TCustSubscrHistoryForma
  Left = 518
  Top = 190
  Caption = #1048#1089#1090#1086#1088#1080#1103' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1081
  ClientHeight = 383
  ClientWidth = 894
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 0
    Top = 150
    Width = 894
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 894
    Height = 150
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel3'
    TabOrder = 0
    object dbgCustSubscrServ: TDBGridEh
      Left = 0
      Top = 0
      Width = 868
      Height = 150
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataSource = srcServices
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
      PopupMenu = pmServices
      SearchPanel.Enabled = True
      SearchPanel.FilterOnTyping = True
      TabOrder = 0
      OnExit = dbgCustSubscrServExit
      OnGetCellParams = dbgCustSubscrServGetCellParams
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1058#1080#1087' '#1072#1073#1086#1085#1077#1085#1090#1089#1082#1086#1081' '#1091#1089#1083#1091#1075#1080
          Title.SortIndex = 2
          Title.SortMarker = smUpEh
          Width = 307
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STATE_SGN'
          Footers = <>
          KeyList.Strings = (
            '0'
            '1')
          PickList.Strings = (
            #1054#1090#1082#1083'.'
            #1055#1086#1076#1082#1083'.')
          Title.Caption = #1057#1090#1072#1090#1091#1089
          Title.SortIndex = 1
          Title.SortMarker = smUpEh
          Width = 92
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STATE_DATE'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1072#1090#1072' '#1089#1090#1072#1090#1091#1089#1072
          Width = 78
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STATE_SRV_NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1059#1089#1083#1091#1075#1072' '#1080#1079#1084'. '#1089#1090#1072#1090#1091#1089#1072
          Width = 134
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'WHO_LAST'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1048#1079#1084#1077#1085#1080#1083
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CONTRACT'
          Footers = <>
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088
          Width = 76
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CONTRACT_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1076#1086#1075'.'
          Width = 87
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object pnlBtns: TPanel
      Left = 868
      Top = 0
      Width = 26
      Height = 150
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object btnOk: TSpeedButton
        Left = 2
        Top = 2
        Width = 23
        Height = 22
        Action = actOk
        Flat = True
      end
      object btnCancel: TSpeedButton
        Left = 2
        Top = 30
        Width = 23
        Height = 22
        Action = actCancel
        Flat = True
      end
      object btnBack: TSpeedButton
        Left = 2
        Top = 58
        Width = 23
        Height = 22
        Action = actBack
        Flat = True
      end
      object btnDisconnect: TSpeedButton
        Left = 2
        Top = 86
        Width = 23
        Height = 22
        Action = actDisconnect
        Flat = True
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 153
    Width = 894
    Height = 230
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    object dbgCustSubscrServHist: TDBGridEh
      Left = 0
      Top = 0
      Width = 868
      Height = 230
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataSource = srcServicesHistory
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      OddRowColor = clCream
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
      PopupMenu = pmHistory
      SearchPanel.Enabled = True
      SearchPanel.FilterOnTyping = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      OnExit = dbgCustSubscrServHistExit
      Columns = <
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATE_FROM'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1072#1090#1072' '#1087#1086#1076#1082#1083
          Width = 80
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ON_NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1059#1089#1083'. '#1087#1086#1076#1082#1083'.'
          Width = 130
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATE_TO'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1072#1090#1072' '#1086#1090#1082#1083
          Width = 78
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'OFF_NAME'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1059#1089#1083'. '#1086#1090#1082#1083'.'
          Width = 126
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'WHO_ADD'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1083
          Width = 81
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_ON'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1050#1086#1075#1076#1072' '#1087#1086#1076#1082#1083'.'
          Width = 84
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'WHO_CHANGE'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1054#1090#1082#1083#1102#1095#1080#1083
          Width = 74
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CLOSED_ON'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1050#1086#1075#1076#1072' '#1086#1090#1082#1083'.'
          Visible = False
          Width = 101
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'WORKER_ON'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1057#1086#1090#1088'-'#1082' '#1087#1086#1076#1082#1083'.'
          Width = 87
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'WORKER_OFF'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1057#1086#1090#1088'-'#1082' '#1086#1090#1082#1083'.'
          Width = 55
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'REQ_ON'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1047#1072#1103#1074#1082#1072' '#1087#1086#1076#1082#1083'.'
          Width = 66
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'REQ_OFF'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1047#1072#1103#1074#1082#1072' '#1086#1090#1082#1083'.'
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CONTRACT'
          Footers = <>
          Title.Caption = #1044#1086#1075#1086#1074#1086#1088
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CONTRACT_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
          Width = 58
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DAYS_ON'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1055#1086#1076#1082#1083'. '#1076#1085#1077#1081
          Title.TitleButton = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object pnlBtnsHst: TPanel
      Left = 868
      Top = 0
      Width = 26
      Height = 230
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object btnOkHst: TSpeedButton
        Left = 2
        Top = 2
        Width = 23
        Height = 22
        Action = actOkHst
        Flat = True
      end
      object btnCancelHst: TSpeedButton
        Left = 2
        Top = 42
        Width = 23
        Height = 22
        Action = actCancelHst
        Flat = True
      end
    end
  end
  object ActionList1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 282
    Top = 66
    object actDeleteService: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1089#1083#1091#1075#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1087#1086' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103#1084' '#1082' '#1076#1072#1085#1085#1086#1081' '#1091#1089#1083#1091#1075#1077
      ImageIndex = 119
      OnExecute = actDeleteServiceExecute
    end
    object actDeleteSubscrHist: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' '#1080#1089#1090#1086#1088#1080#1080' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1081
      ImageIndex = 119
      OnExecute = actDeleteSubscrHistExecute
    end
    object actSubscribe: TAction
      Caption = 'Subscribe'
      ImageIndex = 2
    end
    object actOk: TAction
      Enabled = False
      Hint = #1055#1086#1076#1074#1077#1088#1076#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1077
      ImageIndex = 25
      OnExecute = actOkExecute
    end
    object actCancel: TAction
      Enabled = False
      Hint = #1054#1084#1077#1085#1080#1090#1100' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077
      ImageIndex = 26
      OnExecute = actCancelExecute
    end
    object actBack: TAction
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1076#1077#1081#1089#1090#1074#1080#1077
      ImageIndex = 56
      OnExecute = actBackExecute
    end
    object actDisconnect: TAction
      Hint = #1057#1084#1077#1085#1080#1090#1100' '#1072#1074#1090#1086#1073#1083#1086#1082#1080#1088#1086#1074#1082#1091' '#1085#1072' '#1087#1086#1089#1090#1086#1103#1085#1085#1086#1077' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1077
      ImageIndex = 12
      OnExecute = actDisconnectExecute
    end
    object actDel: TAction
      Caption = 'actDel'
      ShortCut = 16430
      OnExecute = actDelExecute
    end
    object actOkHst: TAction
      Hint = #1055#1086#1076#1074#1077#1088#1076#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1077
      ImageIndex = 25
      OnExecute = actOkHstExecute
    end
    object actCancelHst: TAction
      Hint = #1054#1084#1077#1085#1080#1090#1100' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1077
      ImageIndex = 26
      OnExecute = actCancelHstExecute
    end
  end
  object srcServices: TDataSource
    DataSet = dsServices
    OnStateChange = srcServicesStateChange
    OnDataChange = srcServicesDataChange
    Left = 50
    Top = 58
  end
  object srcServicesHistory: TDataSource
    DataSet = dsServicesHistory
    OnStateChange = srcServicesHistoryStateChange
    Left = 178
    Top = 237
  end
  object dsServicesHistory: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SUBSCR_HIST'
      'SET '
      '    CONTRACT = :CONTRACT,'
      '    CONTRACT_DATE = :CONTRACT_DATE'
      'WHERE'
      '    SUBSCR_HIST_ID = :OLD_SUBSCR_HIST_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SUBSCR_HIST'
      'WHERE'
      '        SUBSCR_HIST_ID = :OLD_SUBSCR_HIST_ID'
      '    ')
    RefreshSQL.Strings = (
      'select '
      ' h.*, s_on.NAME as ON_NAME, s_off.NAME as OFF_NAME,'
      
        ' (select first 1 w.Surname FROM worker w where w.Ibname = h.Adde' +
        'd_By)  as WHO_ADD,'
      
        ' (select first 1 w.Surname FROM worker w where w.Ibname = h.Clos' +
        'ed_By) as WHO_CHANGE'
      'from SUBSCR_HIST h'
      
        '  left outer join services s_on on (s_on.SERVICE_ID = h.ACT_SERV' +
        '_ID)'
      
        '  left outer join SERVICES s_off on (s_off.SERVICE_ID = h.DISACT' +
        '_SERV_ID)'
      'where(  h.CUSTOMER_ID=:CUSTOMER_ID'
      '  and h.SUBSCR_SERV_ID=:SUBSCR_SERV_ID'
      '     ) and (     H.SUBSCR_HIST_ID = :OLD_SUBSCR_HIST_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select '
      ' h.*, s_on.NAME as ON_NAME, s_off.NAME as OFF_NAME,'
      
        ' datediff(day, iif(h.Date_From = '#39'2100-1-1'#39', current_date,  h.Da' +
        'te_From), h.Date_To) DAYS_ON,'
      
        ' coalesce((select first 1 w.Surname FROM worker w where w.Ibname' +
        ' = h.Added_By), h.Added_By)  as WHO_ADD,'
      
        ' coalesce((select first 1 w.Surname FROM worker w where w.Ibname' +
        ' = h.Closed_By),h.Closed_By) as WHO_CHANGE'
      'from SUBSCR_HIST h'
      
        '  left outer join services s_on on (s_on.SERVICE_ID = h.ACT_SERV' +
        '_ID)'
      
        '  left outer join SERVICES s_off on (s_off.SERVICE_ID = h.DISACT' +
        '_SERV_ID)'
      'where h.CUSTOMER_ID=:CUSTOMER_ID'
      '  and h.SUBSCR_SERV_ID=:SUBSCR_SERV_ID'
      'order by h.SUBSCR_SERV_ID, h.DATE_FROM desc, h.DATE_TO desc')
    AutoUpdateOptions.UpdateTableName = 'SUBSCR_HIST'
    AutoUpdateOptions.KeyFields = 'SUBSCR_HIST_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcServices
    Left = 64
    Top = 240
    oFetchAll = True
  end
  object dsServices: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SUBSCR_SERV'
      'SET '
      '    STATE_SGN = :STATE_SGN,'
      '    CONTRACT = :CONTRACT,'
      '    CONTRACT_DATE = :CONTRACT_DATE'
      'WHERE'
      '    SUBSCR_SERV_ID = :OLD_SUBSCR_SERV_ID'
      '    ')
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE DELETE_SUBSCR_SERVICE(:OLD_SUBSCR_SERV_ID)'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    SS.*'
      '  , s.NAME'
      '  , st.Service_Id STATE_ID'
      '  , st.Name STATE_SRV_NAME'
      '  , coalesce((select first 1'
      '                  w.Surname'
      '                from worker w'
      
        '                where w.Ibname = ss.State_Change_By), ss.State_C' +
        'hange_By) as WHO_LAST'
      '  from SUBSCR_SERV SS'
      '       inner join SERVICES s on (s.SERVICE_ID = ss.SERV_ID)'
      
        '       left outer join SERVICES st on (st.SERVICE_ID = ss.State_' +
        'Srv)'
      '  where SS.SUBSCR_SERV_ID = :OLD_SUBSCR_SERV_ID')
    SelectSQL.Strings = (
      'select'
      '    SS.*'
      '  , s.NAME'
      '  , st.Service_Id STATE_ID'
      '  , st.Name STATE_SRV_NAME'
      '  , coalesce((select first 1'
      '                  w.Surname'
      '                from worker w'
      
        '                where w.Ibname = ss.State_Change_By), ss.State_C' +
        'hange_By) as WHO_LAST'
      '  from SUBSCR_SERV SS'
      '       inner join SERVICES s on (s.SERVICE_ID = ss.SERV_ID)'
      
        '       left outer join SERVICES st on (st.SERVICE_ID = ss.State_' +
        'Srv)'
      '  where SS.CUSTOMER_ID = :CUSTOMER_ID'
      '  order by ss.state_sgn desc, s.name ')
    AutoCalcFields = False
    BeforePost = dsServicesBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 124
    Top = 60
  end
  object pmHistory: TPopupMenu
    Left = 336
    Top = 232
    object miN2: TMenuItem
      Caption = '-'
    end
    object miDeleteHistory: TMenuItem
      Action = actDeleteSubscrHist
    end
  end
  object pmServices: TPopupMenu
    Images = A4MainForm.ICONS_ACTIVE
    Left = 196
    Top = 60
    object miBack: TMenuItem
      Action = actBack
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1080#1077' '#1076#1077#1081#1089#1090#1074#1080#1077
    end
    object miDisconnect: TMenuItem
      Action = actDisconnect
      Caption = #1057#1084#1077#1085#1080#1090#1100' '#1072#1074#1090#1086#1073#1083#1086#1082#1080#1088#1086#1074#1082#1091
    end
    object miN1: TMenuItem
      Caption = '-'
    end
    object miDeleteServices: TMenuItem
      Action = actDeleteService
    end
  end
end
