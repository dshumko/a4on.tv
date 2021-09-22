inherited ChannelsForm: TChannelsForm
  Left = 576
  Top = 392
  Caption = #1058#1042' '#1082#1072#1085#1072#1083#1099
  ClientHeight = 515
  ClientWidth = 929
  PixelsPerInch = 96
  TextHeight = 13
  object splAddons: TSplitter [0]
    Left = 0
    Top = 357
    Width = 929
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Visible = False
  end
  inherited dbGrid: TDBGridEh
    Width = 929
    Height = 276
    IncludeImageModules = [iimJpegImageModuleEh, iimGIFImageModuleEh, iimPNGImageModuleEh]
    DrawGraphicData = True
    FooterRowCount = 1
    FrozenCols = 2
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove, dghAutoFitRowHeight]
    ReadOnly = True
    SearchPanel.FilterOnTyping = True
    SumList.Active = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_ID'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1050#1072#1085#1072#1083
        Title.TitleButton = True
        Width = 100
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DEFINITION'
        Footers = <>
        Title.Caption = #1063#1077#1090#1082#1086#1089#1090#1100
        Title.TitleButton = True
        Title.Orientation = tohVertical
        Width = 33
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_PAID_TO'
        Footers = <>
        Title.Caption = #1054#1087#1083#1072#1095#1077#1085' '#1076#1086
        Title.TitleButton = True
        Width = 61
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_NUMBER'
        Footer.FieldName = 'IS_ANALOG'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1040#1085#1072#1083#1086#1075'|'#1053#1086#1084#1077#1088' '#1082#1072#1085#1072#1083#1072
        Title.TitleButton = True
        Width = 47
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_FREQ'
        Footers = <>
        Title.Caption = #1040#1085#1072#1083#1086#1075'|'#1063#1072#1089#1090#1086#1090#1072
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_CODED'
        Footer.Alignment = taRightJustify
        Footer.FieldName = 'IS_CODED'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1050#1086#1076#1080'- '#1088#1086#1074#1072#1085
        Title.TitleButton = True
        Width = 36
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACCESS_ID'
        Footers = <>
        Title.Caption = #1050#1083#1102#1095' '#1076#1086#1089#1090#1091#1087#1072
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_TRUNK'
        Footer.FieldName = 'IS_DIGIT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'STV|'#1057#1090#1074#1086#1083
        Title.TitleButton = True
        Width = 42
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_TRUNK_NUMBER'
        Footers = <>
        Title.Caption = 'STV|'#1053#1086#1084#1077#1088' '#1074' '#1089#1090#1074#1086#1083#1077
        Title.TitleButton = True
        Width = 46
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_ICON'
        Footers = <>
        ShowImageAndText = True
        Title.Caption = #1051#1086#1075#1086
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACCESS_ID'
        Footers = <>
        Title.TitleButton = True
        Visible = False
        Width = 50
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 126
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SRC_NAME'
        Footers = <>
        Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082
        Title.TitleButton = True
        Width = 63
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CARD_NAME'
        Footers = <>
        Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1082#1072#1088#1090#1086#1095#1082#1072
        Title.TitleButton = True
        Width = 98
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'LCN'
        Footers = <>
        Title.Caption = 'DVB|LCN'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SID'
        Footer.FieldName = 'ON_DVB'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = 'DVB|SID'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'TSID'
        Footers = <>
        Title.Caption = 'DVB|TSID'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NID'
        Footers = <>
        Title.Caption = 'DVB|NID'
        Title.TitleButton = True
        Width = 98
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_THEME'
        Footers = <>
        Title.Caption = #1058#1077#1084#1072#1090#1080#1082#1072
        Title.TitleButton = True
        Width = 62
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_LIC'
        Footers = <>
        Title.Caption = #1051#1080#1094#1077#1085#1079#1080#1103
        Title.TitleButton = True
        Width = 59
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_CERT'
        Footers = <>
        Title.Caption = #1057#1074'-'#1074#1086' '#1057#1052#1048
        Title.TitleButton = True
        Width = 86
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DIS_NAME'
        Footers = <>
        Title.Caption = #1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088'|'#1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088
        Title.TitleButton = True
        Width = 81
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DIS_C_NUMBER'
        Footers = <>
        Title.Caption = #1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088'|'#1044#1086#1075#1086#1074#1086#1088
        Title.TitleButton = True
        Width = 78
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DIS_C_DATE'
        Footers = <>
        Title.Caption = #1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088'|'#1044#1072#1090#1072
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 929
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
    end
    object ToolButton7: TToolButton
      Left = 178
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 41
      Style = tbsSeparator
    end
    object btnChangeTo: TToolButton
      Left = 186
      Top = 0
      Action = actChangeTo
    end
    object btn1: TToolButton
      Left = 209
      Top = 0
      Width = 17
      Caption = 'btn1'
      ImageIndex = 73
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 226
      Top = 0
      Action = actImport
    end
    object btn2: TToolButton
      Left = 249
      Top = 0
      Width = 16
      Caption = 'btn2'
      ImageIndex = 73
      Style = tbsSeparator
    end
    object btnShowIssue: TToolButton
      Left = 265
      Top = 0
      Action = actShowIssue
    end
  end
  inherited pnlEdit: TPanel
    Width = 929
    inherited btnSaveLink: TBitBtn
      Width = 497
    end
    inherited btnCancelLink: TBitBtn
      Left = 588
    end
  end
  object pnlAddons: TPanel [4]
    Left = 0
    Top = 360
    Width = 929
    Height = 155
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object dbgAddons: TDBGridEh
      Left = 0
      Top = 0
      Width = 929
      Height = 155
      Align = alClient
      DataSource = srcIssues
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      SumList.Active = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'BI_ID'
          Footers = <>
          Title.TitleButton = True
          Visible = False
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'BI_TYPE'
          Footers = <>
          Title.TitleButton = True
          Visible = False
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ISSUE_TYPE'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1087#1088#1086#1073#1083#1077#1084#1099
          Title.TitleButton = True
          Width = 146
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ISSUE'
          Footers = <>
          Title.Caption = #1055#1088#1086#1073#1083#1077#1084#1072
          Title.TitleButton = True
          Width = 152
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ISSUE_SOLUTION'
          Footers = <>
          Title.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
          Title.TitleButton = True
          Width = 89
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RESULT_TEXT'
          Footers = <>
          Title.Caption = #1063#1090#1086' '#1089#1076#1077#1083#1072#1085#1086
          Title.TitleButton = True
          Width = 141
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RESULT_ON'
          Footers = <>
          Title.TitleButton = True
          Visible = False
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ALTER_CONFIG'
          Footers = <>
          Title.Caption = #1050#1086#1085#1092#1080#1075
          Title.TitleButton = True
          Width = 55
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_BY'
          Footers = <>
          Title.Caption = #1044#1086#1073#1072#1074#1080#1083'|'#1050#1090#1086
          Title.TitleButton = True
          Width = 123
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_ON'
          Footers = <>
          Title.Caption = #1044#1086#1073#1072#1074#1080#1083'|'#1050#1086#1075#1076#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EDIT_BY'
          Footers = <>
          Title.Caption = #1048#1089#1087#1088#1072#1074#1080#1083'|'#1050#1090#1086
          Title.TitleButton = True
          Width = 144
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EDIT_ON'
          Footers = <>
          Title.Caption = #1048#1089#1087#1088#1072#1074#1080#1083'|'#1050#1086#1075#1076#1072
          Title.TitleButton = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsChannels
    Top = 200
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 70
    Top = 264
    inherited actDelete: TAction [0]
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1085#1072#1083
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction [1]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1085#1072#1083
      OnExecute = actEditExecute
    end
    inherited actNew: TAction [2]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1085#1072#1083
      OnExecute = actNewExecute
    end
    object actImport: TAction
      Caption = #1048#1084#1087#1086#1088#1090
      Hint = #1048#1084#1087#1086#1088#1090' '#1089#1087#1080#1089#1082#1072' '#1082#1072#1085#1072#1083#1086#1074
      ImageIndex = 72
      OnExecute = actImportExecute
    end
    object actChangeTo: TAction
      Caption = #1047#1072#1084#1077#1085#1080#1090#1100' '#1082#1072#1085#1072#1083
      Hint = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1082#1072#1085#1072#1083#1072' '#1074' '#1076#1088#1091#1075#1086#1081' '#1082#1072#1085#1072#1083
      ImageIndex = 54
      OnExecute = actChangeToExecute
    end
    object actShowIssue: TAction
      Caption = #1055#1088#1086#1073#1083#1077#1084#1099' '#1074#1077#1097#1072#1085#1080#1103
      Hint = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1087#1088#1086#1073#1083#1077#1084#1099' '#1074#1077#1097#1072#1085#1080#1103
      ImageIndex = 92
      OnExecute = actShowIssueExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 227
    Top = 199
    object N1: TMenuItem [0]
      Action = actNew
    end
    object miEdit: TMenuItem [1]
      Action = actEdit
    end
    object miChangeTo: TMenuItem [2]
      Action = actChangeTo
    end
    object miN1: TMenuItem [3]
      Caption = '-'
    end
  end
  object dsChannels: TpFIBDataSet
    DeleteSQL.Strings = (
      'execute procedure Channels_Del(:OLD_CH_ID)'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    C.*'
      '  , CS.NAME SRC_NAME'
      '  , AC.O_NAME CARD_NAME'
      '  , coalesce(C.CH_CODED, 0) IS_CODED'
      '  , iif(C.CH_NUMBER is null, 0, 1) IS_ANALOG'
      '  , iif(C.CH_TRUNK is null, 0, 1) IS_DIGIT'
      '  , DC.LCN'
      '  , DC.SID'
      '  , coalesce(DC.TSID, DS.TSID) TSID'
      '  , DN.NID'
      '  , iif(DC.SID is null, 0, 1) ON_DVB'
      '  , DS.DVBS_ID'
      '  , CS.CS_ID'
      '  , DIC.C_NUMBER DIS_C_NUMBER'
      '  , DIC.C_DATE DIS_C_DATE'
      '  , DIS.NAME DIS_NAME'
      '  , DIS.ID DIS_ID  '
      '  , DIC.Id CNTR_ID'
      'from CHANNELS C'
      
        '    left outer join DVB_STREAM_CHANNELS DC on (DC.CH_ID = C.CH_I' +
        'D)'
      '    left outer join DVB_STREAMS DS on (DS.DVBS_ID = DC.DVBS_ID)'
      '    left outer join DVB_NETWORK DN on (DN.DVBN_ID = DS.DVBN_ID)'
      
        '    left outer join(select -- '#1087#1086#1087#1099#1090#1082#1072' '#1074#1099#1073#1088#1072#1090#1100' '#1074' '#1090#1072#1082#1086#1084' '#1087#1086#1088#1103#1076#1082#1077' '#1080#1089 +
        #1090#1086#1095#1085#1080#1082#1080'. '#1076#1083#1103' '#1085#1072#1083#1086#1075#1072'. '#1076#1083#1103' '#1094#1080#1092#1088#1099'. '#1087#1088#1086#1095#1080#1077
      '                        IC.CH_ID'
      '                      , coalesce((select first 1'
      '                                      S.CS_ID'
      '                                  from CHANNEL_SRC_PARAM S'
      '                                  where S.CH_ID = IC.CH_ID and'
      '                                        S.ON_ANALOG = 1),'
      '                        (select first 1'
      '                             S.CS_ID'
      '                         from CHANNEL_SRC_PARAM S'
      '                         where S.CH_ID = IC.CH_ID and'
      '                               S.ON_DVB = 1),'
      '                        (select first 1'
      '                             S.CS_ID'
      '                         from CHANNEL_SRC_PARAM S'
      '                         where S.CH_ID = IC.CH_ID)) CS_ID'
      '                    from CHANNELS IC) OC on (OC.CH_ID = C.CH_ID)'
      '    left outer join CHANNEL_SRC CS on (CS.CS_ID = OC.CS_ID)'
      
        '    left outer join CHANNEL_SRC_PARAM CSP on (CSP.CS_ID = OC.CS_' +
        'ID and'
      '          CSP.CH_ID = OC.CH_ID)'
      '    left outer join OBJECTS AC on (AC.O_ID = CSP.CARD_ID and'
      '          AC.O_TYPE = 44)'
      '    left outer join(select'
      '                        DTC.CH_ID'
      '                      ,'
      '                        (select first 1'
      '                             IDC.ID'
      '                         from DISTRIB_CONTRACTS IDC'
      
        '                             inner join DISTRIB_CONTRACT_CH DCC ' +
        'on (DCC.CONTRACT_ID = IDC.ID)'
      '                         where IDC.C_DATE < current_date and'
      
        '                               ((IDC.C_DATE_BEFORE is null) or (' +
        'IDC.C_DATE_BEFORE >= current_date)) and'
      '                               DCC.CH_ID = DTC.CH_ID) CNTR_ID'
      
        '                    from CHANNELS DTC) DTC on (DTC.CH_ID = C.CH_' +
        'ID)'
      
        '    left outer join DISTRIB_CONTRACTS DIC on (DIC.ID = DTC.CNTR_' +
        'ID)'
      
        '    left outer join DISTRIBUTOR DIS on (DIS.ID = DIC.DISTRIBUTOR' +
        '_ID)'
      'Where'
      '    C.CH_ID = :OLD_CH_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    C.*'
      '  , CS.NAME SRC_NAME'
      '  , AC.O_NAME CARD_NAME'
      '  , coalesce(C.CH_CODED, 0) IS_CODED'
      '  , iif(C.CH_NUMBER is null, 0, 1) IS_ANALOG'
      '  , iif(C.CH_TRUNK is null, 0, 1) IS_DIGIT'
      '  , DC.LCN'
      '  , DC.SID'
      '  , coalesce(DC.TSID, DS.TSID) TSID'
      '  , DN.NID'
      '  , iif(DC.SID is null, 0, 1) ON_DVB'
      '  , DS.DVBS_ID'
      '  , CS.CS_ID'
      '  , DIC.C_NUMBER DIS_C_NUMBER'
      '  , DIC.C_DATE DIS_C_DATE'
      '  , DIS.NAME DIS_NAME'
      '  , DIS.ID DIS_ID  '
      '  , DIC.Id CNTR_ID'
      'from CHANNELS C'
      
        '    left outer join DVB_STREAM_CHANNELS DC on (DC.CH_ID = C.CH_I' +
        'D)'
      '    left outer join DVB_STREAMS DS on (DS.DVBS_ID = DC.DVBS_ID)'
      '    left outer join DVB_NETWORK DN on (DN.DVBN_ID = DS.DVBN_ID)'
      
        '    left outer join(select -- '#1087#1086#1087#1099#1090#1082#1072' '#1074#1099#1073#1088#1072#1090#1100' '#1074' '#1090#1072#1082#1086#1084' '#1087#1086#1088#1103#1076#1082#1077' '#1080#1089 +
        #1090#1086#1095#1085#1080#1082#1080'. '#1076#1083#1103' '#1085#1072#1083#1086#1075#1072'. '#1076#1083#1103' '#1094#1080#1092#1088#1099'. '#1087#1088#1086#1095#1080#1077
      '                        IC.CH_ID'
      '                      , coalesce((select first 1'
      '                                      S.CS_ID'
      '                                  from CHANNEL_SRC_PARAM S'
      '                                  where S.CH_ID = IC.CH_ID and'
      '                                        S.ON_ANALOG = 1),'
      '                        (select first 1'
      '                             S.CS_ID'
      '                         from CHANNEL_SRC_PARAM S'
      '                         where S.CH_ID = IC.CH_ID and'
      '                               S.ON_DVB = 1),'
      '                        (select first 1'
      '                             S.CS_ID'
      '                         from CHANNEL_SRC_PARAM S'
      '                         where S.CH_ID = IC.CH_ID)) CS_ID'
      '                    from CHANNELS IC) OC on (OC.CH_ID = C.CH_ID)'
      '    left outer join CHANNEL_SRC CS on (CS.CS_ID = OC.CS_ID)'
      
        '    left outer join CHANNEL_SRC_PARAM CSP on (CSP.CS_ID = OC.CS_' +
        'ID and'
      '          CSP.CH_ID = OC.CH_ID)'
      '    left outer join OBJECTS AC on (AC.O_ID = CSP.CARD_ID and'
      '          AC.O_TYPE = 44)'
      '    left outer join(select'
      '                        DTC.CH_ID'
      '                      ,'
      '                        (select first 1'
      '                             IDC.ID'
      '                         from DISTRIB_CONTRACTS IDC'
      
        '                             inner join DISTRIB_CONTRACT_CH DCC ' +
        'on (DCC.CONTRACT_ID = IDC.ID)'
      '                         where IDC.C_DATE <= current_date and'
      
        '                               ((IDC.C_DATE_BEFORE is null) or (' +
        'IDC.C_DATE_BEFORE >= current_date)) and'
      '                               DCC.CH_ID = DTC.CH_ID) CNTR_ID'
      
        '                    from CHANNELS DTC) DTC on (DTC.CH_ID = C.CH_' +
        'ID)'
      
        '    left outer join DISTRIB_CONTRACTS DIC on (DIC.ID = DTC.CNTR_' +
        'ID)'
      
        '    left outer join DISTRIBUTOR DIS on (DIS.ID = DIC.DISTRIBUTOR' +
        '_ID)'
      'order by C.CH_NAME')
    AfterOpen = dsChannelsAfterOpen
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 152
    Top = 200
    oFetchAll = True
    object dsChannelsCH_ID: TFIBIntegerField
      FieldName = 'CH_ID'
    end
    object dsChannelsCH_NUMBER: TFIBIntegerField
      FieldName = 'CH_NUMBER'
    end
    object dsChannelsCH_NAME: TFIBWideStringField
      FieldName = 'CH_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object dsChannelsCH_NOTICE: TFIBWideStringField
      FieldName = 'CH_NOTICE'
      Size = 1000
      EmptyStrToNull = True
    end
    object dsChannelsCH_PAID_TO: TFIBDateField
      FieldName = 'CH_PAID_TO'
      DisplayFormat = 'dd.mm.yyyy'
    end
    object dsChannelsCH_FREQ: TFIBBCDField
      DefaultExpression = '0'
      FieldName = 'CH_FREQ'
      DisplayFormat = '#,##0.000'
      EditFormat = '0.000'
      Size = 3
    end
    object dsChannelsCH_CODED: TFIBBooleanField
      DefaultExpression = 'False'
      FieldName = 'CH_CODED'
    end
    object dsChannelsCH_TRUNK: TFIBIntegerField
      FieldName = 'CH_TRUNK'
    end
    object dsChannelsCH_TRUNK_NUMBER: TFIBIntegerField
      FieldName = 'CH_TRUNK_NUMBER'
    end
    object dsChannelsCH_ICON: TFIBBlobField
      FieldName = 'CH_ICON'
      BlobType = ftGraphic
      Size = 8
    end
    object dsChannelsDEFINITION: TFIBWideStringField
      FieldName = 'DEFINITION'
      Size = 5
      EmptyStrToNull = True
    end
    object dsChannelsLANG: TFIBWideStringField
      DefaultExpression = 'RUS'
      FieldName = 'LANG'
      Size = 5
      EmptyStrToNull = True
    end
    object dsChannelsDVBGENRES: TFIBWideStringField
      FieldName = 'DVBGENRES'
      Size = 255
      EmptyStrToNull = True
    end
    object dsChannelsMINAGE: TFIBIntegerField
      FieldName = 'MINAGE'
    end
    object dsChannelsACCESS_ID: TFIBIntegerField
      DisplayLabel = 'ACCESS ID'
      FieldName = 'ACCESS_ID'
    end
    object dsChannelsCH_CONTACT: TFIBWideStringField
      FieldName = 'CH_CONTACT'
      Size = 100
      EmptyStrToNull = True
    end
    object dsChannelsCONTRACT_ID: TFIBIntegerField
      FieldName = 'CONTRACT_ID'
    end
    object dsChannelsSRC_NAME: TFIBWideStringField
      FieldName = 'SRC_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object dsChannelsCARD_NAME: TFIBWideStringField
      FieldName = 'CARD_NAME'
      Size = 500
      EmptyStrToNull = True
    end
    object dsChannelsCH_LIC: TFIBWideStringField
      FieldName = 'CH_LIC'
      Size = 255
      EmptyStrToNull = True
    end
    object dsChannelsCH_CERT: TFIBWideStringField
      FieldName = 'CH_CERT'
      Size = 255
      EmptyStrToNull = True
    end
    object dsChannelsCH_THEME: TFIBWideStringField
      FieldName = 'CH_THEME'
      Size = 50
      EmptyStrToNull = True
    end
    object intfldChannelsIS_CODED: TFIBIntegerField
      FieldName = 'IS_CODED'
    end
    object intfldChannelsIS_ANALOG: TFIBIntegerField
      FieldName = 'IS_ANALOG'
    end
    object intfldChannelsIS_DIGIT: TFIBIntegerField
      FieldName = 'IS_DIGIT'
    end
    object intfldChannelsLCN: TFIBIntegerField
      FieldName = 'LCN'
    end
    object intfldChannelsSID: TFIBIntegerField
      FieldName = 'SID'
    end
    object intfldChannelsTSID: TFIBIntegerField
      FieldName = 'TSID'
    end
    object intfldChannelsNID: TFIBIntegerField
      FieldName = 'NID'
    end
    object intfldChannelsON_DVB: TFIBIntegerField
      FieldName = 'ON_DVB'
    end
    object intfldChannelsDvbs_Id: TFIBIntegerField
      FieldName = 'Dvbs_Id'
    end
    object intfldChannelsCS_ID: TFIBIntegerField
      FieldName = 'CS_ID'
    end
    object fbwdstrngfldChannelsDIS_C_NUMBER: TFIBWideStringField
      FieldName = 'DIS_C_NUMBER'
      Size = 50
      EmptyStrToNull = True
    end
    object fbdtfldChannelsDIS_C_DATE: TFIBDateField
      FieldName = 'DIS_C_DATE'
    end
    object fbwdstrngfldChannelsDIS_NAME: TFIBWideStringField
      FieldName = 'DIS_NAME'
      Size = 100
      EmptyStrToNull = True
    end
    object fbntgrfldChannelsDIS_ID: TFIBIntegerField
      FieldName = 'DIS_ID'
    end
    object fbntgrfldChannelsCNTR_ID: TFIBIntegerField
      FieldName = 'CNTR_ID'
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
    Left = 152
    Top = 264
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
    Left = 224
    Top = 268
  end
  object PropStorageEh: TPropStorageEh
    Section = 'CHANNELS'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'pnlAddons.<P>.Height')
    Left = 624
    Top = 240
  end
  object dsIssues: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    i.*'
      '  , o.O_Name ISSUE_TYPE'
      '  , r.O_Name ISSUE_SOLUTION'
      '  from Bcissue i'
      
        '    inner join objects o on (o.O_Id = i.Bi_Type and o.O_Type = 5' +
        '3)'
      
        '    left outer join objects r on (r.O_Id = i.SOLUTION and r.O_Ty' +
        'pe = 54)'
      
        'where exists(select ic.Bi_Id from Bci_Channels ic where ic.Ch_Id' +
        ' = :CH_ID and ic.Bi_Id = i.Bi_Id)'
      'order by I.Added_By desc')
    AutoCalcFields = False
    Transaction = trRA
    Database = dmMain.dbTV
    AutoCommit = True
    DataSource = srcDataSource
    Left = 213
    Top = 440
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    oFetchAll = True
  end
  object trRA: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 299
    Top = 436
  end
  object srcIssues: TDataSource
    AutoEdit = False
    DataSet = dsIssues
    Left = 400
    Top = 440
  end
end
