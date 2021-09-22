object EPGAdForm: TEPGAdForm
  ShowHint = True
  Left = 0
  Top = 0
  ActiveControl = dbgEPGAd
  Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1074' '#1090#1077#1083#1077#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 585
  ClientWidth = 946
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlEvents: TPanel
    Left = 0
    Top = 0
    Width = 664
    Height = 585
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 164
      Width = 152
      Height = 13
      Align = alTop
      Caption = #1054#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1074' '#1090#1077#1083#1077#1087#1088#1086#1075#1088#1072#1084#1084#1077
    end
    object dbgEPGAd: TDBGridEh
      Left = 0
      Top = 200
      Width = 664
      Height = 385
      Align = alClient
      AllowedOperations = []
      AutoFitColWidths = False
      DataSource = srcEPGAd
      DynProps = <>
      Flat = True
      IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
      EmptyDataInfo.Text = #1053#1077#1090' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1087#1077#1088#1077#1076#1072#1095' '#1085#1072' '#1101#1090#1086#1090' '#1082#1072#1085#1072#1083
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
      STFilter.Local = True
      STFilter.Visible = True
      TabOrder = 2
      TitleParams.MultiTitle = True
      OnDblClick = dbgEPGAdDblClick
      Columns = <
        item
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'START_TIME'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072'|'#1053#1072#1095#1072#1083#1072
          Title.TitleButton = True
          Width = 95
        end
        item
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'STOP_TIME'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072'|'#1054#1082#1086#1085#1095#1072#1085#1080#1103
          Title.TitleButton = True
          Width = 92
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'AD_TITLE'
          Footers = <>
          Title.Caption = #1042' '#1079#1072#1075#1086#1083#1086#1074#1082#1077
          Title.TitleButton = True
          Width = 175
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'AD_DESCRIPTION'
          Footers = <>
          Title.Caption = #1042' '#1086#1087#1080#1089#1072#1085#1080#1080
          Title.TitleButton = True
          Width = 221
        end
        item
          AutoFitColWidth = False
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'FOR_EMPTY'
          Footers = <>
          Title.Caption = #1050#1072#1085#1072#1083#1099' '#1073#1077#1079' EPG'
          Title.TitleButton = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object pnlButtons: TPanel
      Left = 0
      Top = 177
      Width = 664
      Height = 23
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 137
        Height = 23
        Align = alLeft
        Caption = 'ToolBar1'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = ActADDAd
        end
        object ToolButton2: TToolButton
          Left = 23
          Top = 0
          Action = ActEDITAd
        end
        object btnDelAd: TToolButton
          Left = 46
          Top = 0
          Action = actDelAd
        end
      end
    end
    object pnlEditEvent: TPanel
      Left = 0
      Top = 0
      Width = 664
      Height = 164
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      Visible = False
      DesignSize = (
        664
        164)
      object Label3: TLabel
        Left = 228
        Top = 9
        Width = 28
        Height = 13
        Caption = #1057#1090#1086#1087
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 6
        Top = 9
        Width = 35
        Height = 13
        Caption = #1057#1090#1072#1088#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 6
        Top = 36
        Width = 67
        Height = 13
        Caption = #1042' '#1079#1072#1075#1086#1083#1086#1074#1086#1082#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 6
        Top = 63
        Width = 56
        Height = 13
        Caption = #1042' '#1086#1087#1080#1089#1072#1085#1080#1080
      end
      object deSTOP_TIME1: TDBDateTimeEditEh
        Left = 356
        Top = 6
        Width = 45
        Height = 21
        DataField = 'STOP_TIME'
        DataSource = srcEPGAd
        DynProps = <>
        EditButton.Visible = False
        EditButtons = <>
        TabOrder = 3
        Visible = True
        EditFormat = 'HH:NN'
      end
      object deSTOP_TIME: TDBDateTimeEditEh
        Left = 261
        Top = 6
        Width = 90
        Height = 21
        DataField = 'STOP_TIME'
        DataSource = srcEPGAd
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 2
        Visible = True
      end
      object edtTITLE: TDBEditEh
        Left = 73
        Top = 33
        Width = 585
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'AD_TITLE'
        DataSource = srcEPGAd
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = 
          #1058#1077#1082#1089#1090' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1074'  '#1079#1072#1075#1086#1083#1086#1074#1086#1082#1077'. '#1047#1072#1084#1077#1085#1103#1077#1090' '#1079#1072#1075#1086#1083#1086#1074#1086#1082'. '#1057#1072#1084' '#1079#1072#1075#1086#1083#1086#1074#1082 +
          ' '#1073#1091#1076#1077#1090#1074' '#1076#1086#1087'. '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
        TabOrder = 6
        Visible = True
      end
      object deSTART_DATE: TDBDateTimeEditEh
        Left = 73
        Top = 6
        Width = 88
        Height = 21
        DataField = 'START_TIME'
        DataSource = srcEPGAd
        DynProps = <>
        EditButtons = <>
        TabOrder = 0
        Visible = True
        OnChange = deSTART_DATEChange
        EditFormat = 'DD/MM/YYYY'
      end
      object mmoDescription: TDBMemoEh
        Left = 73
        Top = 60
        Width = 585
        Height = 61
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        DataField = 'AD_DESCRIPTION'
        DataSource = srcEPGAd
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1058#1077#1082#1089#1090' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1103' '#1074' '#1086#1087#1080#1089#1072#1085#1080#1080
        TabOrder = 7
        Visible = True
        WantReturns = True
      end
      object btnCancel: TButton
        Left = 528
        Top = 127
        Width = 130
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = #1047#1072#1082#1088#1099#1090#1100' '#1085#1077' '#1089#1086#1093#1088#1072#1085#1103#1103
        TabOrder = 10
        OnClick = btnCancelClick
      end
      object btnSave: TButton
        Left = 295
        Top = 127
        Width = 227
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
        TabOrder = 9
        OnClick = btnSaveClick
      end
      object btnSaveAndNext: TButton
        Left = 6
        Top = 127
        Width = 283
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1087#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1081
        TabOrder = 8
        OnClick = btnSaveAndNextClick
      end
      object chkAll: TDBCheckBoxEh
        Left = 408
        Top = 8
        Width = 110
        Height = 17
        Caption = #1044#1083#1103' '#1074#1089#1077#1093' '#1082#1072#1085#1072#1083#1086#1074
        DataField = 'ALL_CHAN'
        DataSource = srcEPGAd
        DynProps = <>
        TabOrder = 4
        OnClick = chkAllClick
      end
      object deSTart_TIME1: TDBDateTimeEditEh
        Left = 169
        Top = 6
        Width = 45
        Height = 21
        DataField = 'START_TIME'
        DataSource = srcEPGAd
        DynProps = <>
        EditButton.Visible = False
        EditButtons = <>
        TabOrder = 1
        Visible = True
        EditFormat = 'HH:NN'
      end
      object chk4EMPTY: TDBCheckBoxEh
        Left = 528
        Top = 8
        Width = 130
        Height = 17
        Caption = #1042#1089#1077#1093' '#1082#1072#1085#1072#1083#1086#1074' '#1073#1077#1079' EPG'
        DataField = 'FOR_EMPTY'
        DataSource = srcEPGAd
        DynProps = <>
        TabOrder = 5
        OnClick = chkAllClick
      end
    end
  end
  object pnlChannels: TPanel
    Left = 664
    Top = 0
    Width = 282
    Height = 585
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object lbl1: TLabel
      Left = 0
      Top = 0
      Width = 213
      Height = 13
      Align = alTop
      Caption = #1059#1082#1072#1078#1080#1090#1077' '#1089#1087#1080#1089#1086#1082' '#1082#1072#1085#1072#1083#1086#1074' '#1076#1083#1103' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1103
    end
    object dbgChannels: TDBGridEh
      Left = 0
      Top = 13
      Width = 282
      Height = 572
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataSource = srcChennals
      DynProps = <>
      Flat = True
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      ReadOnly = True
      STFilter.InstantApply = False
      STFilter.Local = True
      STFilter.Visible = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      OnExit = dbgChannelsExit
      Columns = <
        item
          AutoFitColWidth = False
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'AD_IN_CHAN'
          Footers = <>
          Title.Caption = #1044#1083#1103' '#1082#1072#1085#1072#1083#1072
          Title.TitleButton = True
          Width = 44
        end
        item
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'CH_NAME'
          Footers = <>
          Title.Caption = #1050#1072#1085#1072#1083
          Title.TitleButton = True
          Width = 132
        end
        item
          AutoFitColWidth = False
          DynProps = <>
          EditButtons = <>
          FieldName = 'CH_NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 75
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object srcChennals: TDataSource
    DataSet = dsChennals
    Left = 82
    Top = 355
  end
  object srcEPGAd: TDataSource
    AutoEdit = False
    DataSet = dsEPGAd
    Left = 310
    Top = 418
  end
  object dsEPGAd: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE EPG_AD'
      'SET '
      '    START_TIME = :START_TIME,'
      '    STOP_TIME = :STOP_TIME,'
      '    AD_TITLE = :AD_TITLE,'
      '    AD_DESCRIPTION = :AD_DESCRIPTION,'
      '    ALL_CHAN = :ALL_CHAN,'
      '    FOR_EMPTY = :FOR_EMPTY'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EPG_AD'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO EPG_AD('
      '    ID,'
      '    START_TIME,'
      '    STOP_TIME,'
      '    AD_TITLE,'
      '    AD_DESCRIPTION,'
      '    ALL_CHAN,'
      '    FOR_EMPTY'
      ')'
      'VALUES('
      '    :ID,'
      '    :START_TIME,'
      '    :STOP_TIME,'
      '    :AD_TITLE,'
      '    :AD_DESCRIPTION,'
      '    :ALL_CHAN,'
      '    :FOR_EMPTY'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    e.*'
      '  from Epg_Ad e'
      '  '
      ' WHERE '
      '        E.ID = :OLD_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    e.*'
      '  from Epg_Ad e'
      '  order by e.Start_Time desc')
    AutoUpdateOptions.UpdateTableName = 'EPG_AD'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    OnNewRecord = dsEPGAdNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 310
    Top = 354
  end
  object dsChennals: TpFIBDataSet
    UpdateSQL.Strings = (
      'execute block ('
      '    CH_ID      UID = :CH_ID,'
      '    Ea_Id      UID = :OLD_EA_ID,'
      '    Ad_in_chan D_IBOOLEAN = :Ad_in_chan)'
      'as'
      'begin'
      '  if (Ad_in_chan = 1) then'
      '    insert into Epg_Ad_Channels (Ea_Id, Ch_Id)'
      '    values (:Ea_Id, :Ch_Id);'
      '  else'
      '    delete from Epg_Ad_Channels where Ea_Id = :Ea_Id'
      '          and Ch_Id = :Ch_Id;'
      'end')
    RefreshSQL.Strings = (
      'select'
      '    c.CH_ID,'
      '    c.CH_NAME,'
      '    c.CH_NOTICE,'
      '    coalesce(a.EA_ID, :Id) as EA_ID,'
      '    iif((coalesce(a.Ch_Id, 0) > 0) ,1,0) as Ad_in_chan'
      'from CHANNELS c'
      
        '  left outer join EPG_AD_CHANNELS a on (c.Ch_Id = a.Ch_Id and a.' +
        'Ea_Id = :Id)'
      'where c.CH_ID = :OLD_CH_ID')
    SelectSQL.Strings = (
      'select'
      '    c.CH_ID,'
      '    c.CH_NAME,'
      '    c.CH_NOTICE,'
      '    coalesce(a.EA_ID, :Id) as EA_ID,'
      '    iif((coalesce(a.Ch_Id, 0) > 0) ,1,0) as Ad_in_chan'
      'from CHANNELS c'
      
        '  left outer join EPG_AD_CHANNELS a on (c.Ch_Id = a.Ch_Id and a.' +
        'Ea_Id = :Id)'
      'order by c.CH_NAME')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcEPGAd
    Left = 76
    Top = 442
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 378
    Top = 392
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 482
    Top = 392
  end
  object Query: TpFIBQuery
    Transaction = trReadQ
    Database = dmMain.dbTV
    Left = 427
    Top = 389
  end
  object trReadQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 520
    Top = 396
  end
  object ActionList1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 227
    Top = 347
    object ActADDAd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1077
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1077
      ImageIndex = 2
      OnExecute = ActADDAdExecute
    end
    object ActEDITAd: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1077
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1086#1073#1098#1103#1074#1083#1077#1085#1080#1077
      ImageIndex = 4
      OnExecute = ActEDITAdExecute
    end
    object actDelAd: TAction
      Caption = 'actDelAd'
      ImageIndex = 3
      OnExecute = actDelAdExecute
    end
  end
  object pFIBTransaction1: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 669
    Top = 379
  end
  object pFIBTransaction2: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 688
    Top = 451
  end
end
