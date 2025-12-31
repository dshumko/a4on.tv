object EPGViewForm: TEPGViewForm
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072' '#1087#1077#1088#1077#1076#1072#1095' (EPG)'
  ClientHeight = 585
  ClientWidth = 901
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  Menu = mmEPG
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 185
    Top = 213
    Height = 372
  end
  object pnlChannels: TPanel
    Left = 0
    Top = 213
    Width = 185
    Height = 372
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 0
      Top = 0
      Width = 84
      Height = 13
      Align = alTop
      Caption = ' '#1057#1087#1080#1089#1086#1082' '#1082#1072#1085#1072#1083#1086#1074
    end
    object dbgChannels: TDBGridEh
      Left = 0
      Top = 13
      Width = 185
      Height = 359
      Align = alClient
      AllowedOperations = []
      DataSource = srcChennals
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      SearchPanel.Enabled = True
      SearchPanel.FilterOnTyping = False
      STFilter.InstantApply = False
      STFilter.Local = True
      STFilter.Location = stflUnderTitleFilterEh
      STFilter.Visible = True
      SumList.Active = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CH_NAME'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1050#1072#1085#1072#1083
          Title.TitleButton = True
          Width = 141
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CH_NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CH_NUMBER'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
          Title.TitleButton = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pnlEvents: TPanel
    Left = 188
    Top = 213
    Width = 713
    Height = 372
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 108
      Height = 13
      Align = alTop
      Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084
    end
    object dbgEPG: TDBGridEh
      Left = 0
      Top = 36
      Width = 713
      Height = 336
      Align = alClient
      AllowedOperations = []
      DataSource = srcEPG
      DynProps = <>
      Flat = True
      EmptyDataInfo.Text = #1053#1077#1090' '#1087#1088#1086#1075#1088#1072#1084#1084#1099' '#1087#1077#1088#1077#1076#1072#1095' '#1085#1072' '#1101#1090#1086#1090' '#1082#1072#1085#1072#1083
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      STFilter.Local = True
      STFilter.Visible = True
      TabOrder = 1
      TitleParams.MultiTitle = True
      OnDblClick = dbgEPGDblClick
      OnGetCellParams = dbgEPGGetCellParams
      Columns = <
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = 'ddd dd'
          DynProps = <>
          EditButtons = <>
          FieldName = 'EPG_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Title.TitleButton = True
          Width = 63
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = 'HH:MM'
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATE_START'
          Footers = <>
          Title.Caption = #1042#1088#1077#1084#1103'|'#1057#1090#1072#1088#1090
          Title.TitleButton = True
          Width = 45
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = 'HH:MM'
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATE_STOP'
          Footers = <>
          Title.Caption = #1042#1088#1077#1084#1103'|'#1057#1090#1086#1087
          Title.TitleButton = True
          Width = 45
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'TITLE'
          Footers = <>
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 134
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DESCRIPTION'
          Footers = <>
          Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 98
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'GENRES'
          Footers = <>
          Title.Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1080
          Title.TitleButton = True
          Width = 128
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MINAGE'
          Footers = <>
          Title.Caption = #1042#1086#1079#1088'. '#1086#1075#1088'-'#1085#1080#1077
          Title.TitleButton = True
          Width = 49
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CREATE_YEAR'
          Footers = <>
          Title.Caption = #1043#1086#1076' '#1089#1086#1079#1076#1072#1085#1080#1103
          Title.TitleButton = True
          Width = 51
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ACTORS'
          Footers = <>
          Title.Caption = #1040#1082#1090#1077#1088#1099
          Title.TitleButton = True
          Width = 81
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DIRECTED'
          Footers = <>
          Title.Caption = #1056#1077#1078#1080#1089#1089#1105#1088
          Title.TitleButton = True
          Width = 119
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'COUNTRY'
          Footers = <>
          Title.Caption = #1057#1090#1088#1072#1085#1072
          Title.TitleButton = True
          Width = 130
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'GENRES'
          Footers = <>
          Title.Caption = #1046#1072#1085#1088
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'UTC_START'
          Footers = <>
          Title.Caption = 'UTC|'#1057#1090#1072#1088#1090
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'UTC_STOP'
          Footers = <>
          Title.Caption = 'UTC|'#1057#1090#1086#1087
          Title.TitleButton = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object pnl1: TPanel
      Left = 0
      Top = 13
      Width = 713
      Height = 23
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object tlbActions: TToolBar
        Left = 0
        Top = 0
        Width = 202
        Height = 23
        Align = alLeft
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = ActADDProgramm
        end
        object ToolButton2: TToolButton
          Left = 23
          Top = 0
          Action = ActEDITProgramm
        end
        object btnDeleteProgramm: TToolButton
          Left = 46
          Top = 0
          Action = actDeleteProgramm
        end
        object ToolButton3: TToolButton
          Left = 69
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 5
          Style = tbsSeparator
        end
        object ToolButton4: TToolButton
          Left = 77
          Top = 0
          Action = actImport
        end
        object ToolButton5: TToolButton
          Left = 100
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 6
          Style = tbsSeparator
        end
        object ToolButton6: TToolButton
          Left = 108
          Top = 0
          Action = actSaveEPG
        end
        object btn2: TToolButton
          Left = 131
          Top = 0
          Width = 8
          Caption = 'btn2'
          ImageIndex = 75
          Style = tbsSeparator
        end
        object btnReloadEPG: TToolButton
          Left = 139
          Top = 0
          Hint = 
            #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1083#1072#1075' '#1087#1077#1088#1077#1079#1072#1075#1088#1091#1079#1082#1080' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103' '#1089#1077#1088#1074#1077#1088#1086#1084' EPG|'#1043#1086#1074#1086#1088#1080#1090' '#1089#1077#1088 +
            #1074#1077#1088#1091' '#1095#1090#1086' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1077' '#1087#1086#1084#1077#1085#1103#1083#1086#1089#1100' '#1080' '#1077#1075#1086' '#1085#1091#1078#1085#1086' '#1087#1077#1088#1077#1095#1080#1090#1072#1090#1100
          Action = actReloadEPG
        end
        object btn1: TToolButton
          Left = 162
          Top = 0
          Width = 8
          Caption = 'btn1'
          ImageIndex = 55
          Style = tbsSeparator
        end
        object btnGetEmptyEPG: TToolButton
          Left = 170
          Top = 0
          Action = actGetEmptyEPG
        end
      end
      object chk1: TCheckBox
        Tag = 1
        Left = 202
        Top = 0
        Width = 40
        Height = 23
        Align = alLeft
        Caption = #1055#1053
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = chk1Click
      end
      object chk2: TCheckBox
        Tag = 2
        Left = 242
        Top = 0
        Width = 40
        Height = 23
        Align = alLeft
        Caption = #1042#1058
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = chk1Click
      end
      object chk3: TCheckBox
        Tag = 3
        Left = 282
        Top = 0
        Width = 40
        Height = 23
        Align = alLeft
        Caption = #1057#1056
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = chk1Click
      end
      object chk4: TCheckBox
        Tag = 4
        Left = 322
        Top = 0
        Width = 40
        Height = 23
        Align = alLeft
        Caption = #1063#1058
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = chk1Click
      end
      object chk5: TCheckBox
        Tag = 5
        Left = 362
        Top = 0
        Width = 40
        Height = 23
        Align = alLeft
        Caption = #1055#1058
        Checked = True
        State = cbChecked
        TabOrder = 5
        OnClick = chk1Click
      end
      object chk6: TCheckBox
        Tag = 6
        Left = 402
        Top = 0
        Width = 40
        Height = 23
        Align = alLeft
        Caption = #1057#1041
        Checked = True
        State = cbChecked
        TabOrder = 6
        OnClick = chk1Click
      end
      object chk0: TCheckBox
        Left = 442
        Top = 0
        Width = 40
        Height = 23
        Align = alLeft
        Caption = #1042#1057
        Checked = True
        State = cbChecked
        TabOrder = 7
        OnClick = chk1Click
      end
    end
  end
  object pnlEditEvent: TPanel
    Left = 0
    Top = 0
    Width = 901
    Height = 213
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
    DesignSize = (
      901
      213)
    object Label3: TLabel
      Left = 269
      Top = 36
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
      Top = 36
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
      Top = 9
      Width = 62
      Height = 13
      Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 6
      Top = 63
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object Label7: TLabel
      Left = 518
      Top = 9
      Width = 36
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1046#1072#1085#1088#1099
    end
    object Label8: TLabel
      Left = 518
      Top = 36
      Width = 58
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1046#1072#1085#1088#1099' DVB'
    end
    object Label9: TLabel
      Left = 517
      Top = 63
      Width = 69
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1042#1086#1079#1088'. '#1086#1075#1088'-'#1085#1080#1077
    end
    object Label10: TLabel
      Left = 654
      Top = 63
      Width = 69
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1043#1086#1076' '#1089#1086#1079#1076#1072#1085#1080#1103
    end
    object Label11: TLabel
      Left = 518
      Top = 145
      Width = 39
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1040#1082#1090#1077#1088#1099
    end
    object Label12: TLabel
      Left = 518
      Top = 118
      Width = 48
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1056#1077#1078#1080#1089#1089#1105#1088
    end
    object Label13: TLabel
      Left = 518
      Top = 93
      Width = 37
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1057#1090#1088#1072#1085#1072
    end
    object edStopTime: TDBDateTimeEditEh
      Left = 410
      Top = 33
      Width = 50
      Height = 21
      DataField = 'DATE_STOP'
      DataSource = srcEPG
      DynProps = <>
      EditButton.Visible = False
      EditButtons = <>
      ShowHint = True
      TabOrder = 6
      Visible = True
      EditFormat = 'HH:NN'
    end
    object edStopDate: TDBDateTimeEditEh
      Left = 308
      Top = 33
      Width = 100
      Height = 21
      DataField = 'DATE_STOP'
      DataSource = srcEPG
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 5
      Visible = True
    end
    object edtTITLE: TDBEditEh
      Left = 73
      Top = 6
      Width = 434
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'TITLE'
      DataSource = srcEPG
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1047#1072#1075#1086#1083#1086#1074#1086#1082
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object edStartDate: TDBDateTimeEditEh
      Left = 73
      Top = 33
      Width = 100
      Height = 21
      DataField = 'DATE_START'
      DataSource = srcEPG
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 2
      Visible = True
      OnChange = edStartDateChange
      EditFormat = 'DD/MM/YYYY'
    end
    object edStartTime: TDBDateTimeEditEh
      Left = 179
      Top = 33
      Width = 50
      Height = 21
      DataField = 'DATE_START'
      DataSource = srcEPG
      DynProps = <>
      EditButton.Visible = False
      EditButtons = <>
      ShowHint = True
      TabOrder = 4
      Visible = True
      EditFormat = 'HH:NN'
    end
    object dbmmoDesc: TDBMemoEh
      Left = 73
      Top = 60
      Width = 434
      Height = 103
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'DESCRIPTION'
      DataSource = srcEPG
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1056#1072#1089#1096#1080#1088#1077#1085#1086#1077' '#1086#1087#1080#1089#1072#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      ShowHint = True
      TabOrder = 7
      Visible = True
      WantReturns = True
    end
    object DBEditEh2: TDBEditEh
      Left = 595
      Top = 6
      Width = 289
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'GENRES'
      DataSource = srcEPG
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1046#1072#1085#1088#1099' '#1095#1077#1088#1077#1079' '#1079#1072#1087#1103#1090#1091#1102
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object edtDVBGENRES: TDBEditEh
      Left = 595
      Top = 33
      Width = 289
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'DVBGENRES'
      DataSource = srcEPG
      DynProps = <>
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = edtDVBGENRESEditButtons0Click
        end>
      EmptyDataInfo.Text = #1050#1086#1076#1099' '#1078#1072#1085#1088#1086#1074' DVB, '#1095#1077#1088#1077#1079' '#1079#1072#1087#1103#1090#1091#1102
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object DBNumberEditEh1: TDBNumberEditEh
      Left = 595
      Top = 60
      Width = 33
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'MINAGE'
      DataSource = srcEPG
      DynProps = <>
      EmptyDataInfo.Text = #1042#1086#1079#1088
      EditButtons = <>
      ShowHint = True
      TabOrder = 8
      Visible = True
    end
    object DBEditEh6: TDBEditEh
      Left = 747
      Top = 60
      Width = 137
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'CREATE_YEAR'
      DataSource = srcEPG
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1043#1086#1076' '#1089#1086#1079#1076#1072#1085#1080#1103
      ShowHint = True
      TabOrder = 9
      Visible = True
    end
    object DBEditEh3: TDBEditEh
      Left = 595
      Top = 142
      Width = 289
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'ACTORS'
      DataSource = srcEPG
      DynProps = <>
      EditButtons = <
        item
          Style = ebsEllipsisEh
        end>
      EmptyDataInfo.Text = #1040#1082#1090#1077#1088#1099
      ShowHint = True
      TabOrder = 12
      Visible = True
    end
    object DBEditEh4: TDBEditEh
      Left = 595
      Top = 115
      Width = 289
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'DIRECTED'
      DataSource = srcEPG
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1056#1077#1078#1080#1089#1077#1088
      ShowHint = True
      TabOrder = 11
      Visible = True
    end
    object DBEditEh5: TDBEditEh
      Left = 595
      Top = 88
      Width = 289
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'COUNTRY'
      DataSource = srcEPG
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1057#1090#1088#1072#1085#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
      ShowHint = True
      TabOrder = 10
      Visible = True
    end
    object btnCancel: TButton
      Left = 747
      Top = 176
      Width = 137
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1085#1077' '#1089#1086#1093#1088#1072#1085#1103#1103
      TabOrder = 15
      OnClick = btnCancelClick
    end
    object btnSave: TButton
      Left = 344
      Top = 176
      Width = 297
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1079#1072#1082#1088#1099#1090#1100
      TabOrder = 14
      OnClick = btnSaveClick
    end
    object btnSaveAndNext: TButton
      Left = 6
      Top = 176
      Width = 227
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1087#1077#1088#1077#1081#1090#1080' '#1082' '#1089#1083#1077#1076#1091#1102#1097#1077#1081
      TabOrder = 13
      OnClick = btnSaveAndNextClick
    end
  end
  object srcChennals: TDataSource
    DataSet = dsChennals
    Left = 82
    Top = 355
  end
  object srcEPG: TDataSource
    AutoEdit = False
    DataSet = dsEPG
    Left = 310
    Top = 418
  end
  object dsEPG: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE EPG'
      'SET '
      '    EPG_DATE = :EPG_DATE,'
      '    TITLE = :TITLE,'
      '    DURATION = :DURATION,'
      '    DATE_START = :DATE_START,    '
      '    DATE_STOP = :DATE_STOP,'
      '    DESCRIPTION = :DESCRIPTION,'
      '    GENRES = :GENRES,'
      '    DVBGENRES = :DVBGENRES,'
      '    MINAGE = :MINAGE,'
      '    CREATE_YEAR = :CREATE_YEAR,'
      '    ACTORS = :ACTORS,'
      '    DIRECTED = :DIRECTED,'
      '    COUNTRY = :COUNTRY'
      'WHERE'
      '    EPG_ID = :OLD_EPG_ID ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EPG'
      'WHERE'
      '    EPG_ID = :OLD_EPG_ID '
      '    ')
    InsertSQL.Strings = (
      
        'execute procedure Epg_Add(:Ch_Id, :Title, :Utc_Start, :Utc_Stop,' +
        ' :Date_Start, :Date_Stop, :Description, :Genres, :Dvbgenres, :Mi' +
        'nage, :Create_Year, :Actors, :Directed, :Country);')
    RefreshSQL.Strings = (
      'select'
      '    e.*'
      'from EPG e'
      'where   E.EPG_ID = :OLD_EPG_ID')
    SelectSQL.Strings = (
      'select'
      '    e.*'
      '  from EPG e'
      '  where e.CH_ID = :CH_ID'
      '        and e.date_start >= dateadd(day, -1, current_date)'
      '        and @@param_weekday%1=1@ '
      '  order by e.DATE_START')
    AutoUpdateOptions.UpdateTableName = 'EPG'
    AutoUpdateOptions.KeyFields = 'EPG_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_EPG'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    OnNewRecord = dsEPGNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcChennals
    Left = 310
    Top = 354
    WaitEndMasterScroll = True
  end
  object dsChennals: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    CH_ID,'
      '    CH_NAME,'
      '    CH_NOTICE,'
      '    Ch_Number,'
      '    LANG'
      'from CHANNELS'
      'order by CH_NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 76
    Top = 442
    oFetchAll = True
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
    Left = 435
    Top = 461
  end
  object SaveDialog: TSaveDialog
    DefaultExt = '*.xml'
    FileName = 'xmltv.xml'
    Filter = 'XML|*.xml'
    Left = 577
    Top = 401
  end
  object trReadQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 520
    Top = 436
  end
  object ActionList1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 227
    Top = 347
    object ActADDProgramm: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      ImageIndex = 2
      OnExecute = ActADDProgrammExecute
    end
    object ActEDITProgramm: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      ImageIndex = 4
      OnExecute = ActEDITProgrammExecute
    end
    object actImport: TAction
      Caption = #1048#1084#1087#1086#1088#1090' EPG'
      Hint = #1048#1084#1087#1086#1088#1090' EPG'
      ImageIndex = 72
      OnExecute = actImportExecute
    end
    object actSaveEPG: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' XMLTV'
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' XMLTV'
      ImageIndex = 73
      OnExecute = actSaveEPGExecute
    end
    object actDeleteProgramm: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091
      ImageIndex = 3
      OnExecute = actDeleteProgrammExecute
    end
    object actUTCCurrent: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1088#1077#1084#1103' '#1082#1072#1085#1072#1083#1072
      Hint = #1057#1076#1074#1080#1085#1091#1090#1100' '#1074#1088#1077#1084#1103' '#1087#1088#1086#1075#1088#1072#1084#1084' '#1085#1072' '#1090#1077#1082#1091#1097#1077#1084' '#1082#1072#1085#1072#1083#1077
      OnExecute = actUTCCurrentExecute
    end
    object actUTCAll: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1088#1077#1084#1103' '#1074#1089#1077#1093' '#1082#1072#1085#1072#1083#1086#1074
      Hint = #1057#1076#1074#1080#1085#1091#1090#1100' '#1074#1088#1077#1084#1103' '#1087#1088#1086#1075#1088#1072#1084#1084' '#1085#1072' '#1074#1089#1077#1093' '#1082#1072#1085#1072#1083#1072#1093
      ImageIndex = 56
      OnExecute = actUTCAllExecute
    end
    object actReloadEPG: TAction
      Caption = #1055#1077#1088#1077#1075#1088#1091#1079#1082#1072' '#1089#1077#1088#1074#1077#1088#1086#1084' EPG'
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1083#1072#1075' '#1087#1077#1088#1077#1079#1072#1075#1088#1091#1079#1082#1080' '#1088#1072#1089#1087#1080#1089#1072#1085#1080#1103' '#1089#1077#1088#1074#1077#1088#1086#1084' EPG'
      ImageIndex = 54
      OnExecute = actReloadEPGExecute
    end
    object actGetEmptyEPG: TAction
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1082#1072#1085#1072#1083#1099' '#1073#1077#1079' EPG'
      ImageIndex = 19
      OnExecute = actGetEmptyEPGExecute
    end
  end
  object dsTV: TMemTableEh
    Params = <>
    Left = 232
    Top = 416
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
  object mmEPG: TMainMenu
    Left = 476
    Top = 325
    object EPG1: TMenuItem
      Caption = 'EPG'
      GroupIndex = 3
      object N1: TMenuItem
        Action = ActADDProgramm
      end
      object N3: TMenuItem
        Action = ActEDITProgramm
      end
      object N2: TMenuItem
        Action = actDeleteProgramm
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object EPG2: TMenuItem
        Action = actImport
      end
      object XMLTV1: TMenuItem
        Action = actSaveEPG
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object UTC1: TMenuItem
        Action = actUTCAll
      end
      object UTC2: TMenuItem
        Action = actUTCCurrent
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object EPG3: TMenuItem
        Action = actReloadEPG
      end
    end
  end
  object trWriteQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 522
    Top = 488
  end
  object PropStorageEh: TPropStorageEh
    Section = 'EPG'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'pnlChannels.<P>.Width')
    Left = 290
    Top = 89
  end
end
