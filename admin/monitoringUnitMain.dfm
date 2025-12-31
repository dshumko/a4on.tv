object MonDBForm: TMonDBForm
  Left = 213
  Top = 113
  Caption = #1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1081
  ClientHeight = 519
  ClientWidth = 895
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 157
    Width = 895
    Height = 4
    Cursor = crVSplit
    Align = alBottom
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 895
    Height = 157
    Align = alClient
    DataSource = dsAttachments
    DynProps = <>
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    FooterParams.Color = clWindow
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    PopupMenu = pmAttach
    TabOrder = 0
    TitleParams.MultiTitle = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MON$ATTACHMENT_ID'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077'|'#1050#1086#1076
        Title.TitleButton = True
        Width = 39
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MON$REMOTE_ADDRESS'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077'|'#1040#1076#1088#1077#1089
        Title.TitleButton = True
        Width = 74
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MON$REMOTE_PROTOCOL'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077'|'#1055#1088#1086#1090#1086#1082#1086#1083
        Title.TitleButton = True
        Width = 54
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MON$REMOTE_PID'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077'|'#1050#1086#1076' '#1087#1088#1086#1094#1077#1089#1089#1072' '#1082#1083#1080#1077#1085#1090#1072
        Title.TitleButton = True
        Width = 60
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MON$TIMESTAMP'
        Footers = <>
        Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'|'#1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MON$SERVER_PID'
        Footers = <>
        Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'|'#1050#1086#1076' '#1087#1088#1086#1094#1077#1089#1089#1072' '#1089#1077#1088#1074#1077#1088#1072
        Title.TitleButton = True
        Width = 63
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MON$ATTACHMENT_NAME'
        Footers = <>
        Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'|'#1048#1084#1103' '#1092#1072#1081#1083#1072' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
        Title.TitleButton = True
        Width = 134
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MON$USER'
        Footers = <>
        Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'|'#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        Title.TitleButton = True
        Width = 86
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MON$ROLE'
        Footers = <>
        Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'|'#1056#1086#1083#1100
        Title.TitleButton = True
        Width = 45
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CHARACTER_SET_NAME'
        Footers = <>
        Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'|'#1050#1086#1076#1080#1088#1086#1074#1082#1072
        Title.TitleButton = True
        Width = 60
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MON$STATE_TYPE_NAME'
        Footers = <>
        Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'|'#1057#1086#1089#1090#1086#1103#1085#1080#1077
        Title.TitleButton = True
        Width = 66
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MON$GARBAGE_COLLECTION'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1')
        PickList.Strings = (
          #1053#1077#1090
          #1044#1072)
        Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'|'#1057#1073#1086#1088#1082#1072' '#1084#1091#1089#1086#1088#1072
        Title.TitleButton = True
        Width = 55
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 161
    Width = 895
    Height = 358
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 1
      Top = 176
      Width = 893
      Height = 4
      Cursor = crVSplit
      Align = alBottom
    end
    object DBGridEh2: TDBGridEh
      Left = 1
      Top = 1
      Width = 893
      Height = 175
      Align = alClient
      DataSource = dsTransactions
      DynProps = <>
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      FooterParams.Color = clWindow
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleParams.MultiTitle = True
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MON$TRANSACTION_ID'
          Footers = <>
          Title.Caption = #1058#1088#1072#1085#1079#1072#1082#1094#1080#1103'|'#1050#1086#1076
          Title.TitleButton = True
          Width = 45
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MON$STATE_TYPE_NAME'
          Footers = <>
          Title.Caption = #1058#1088#1072#1085#1079#1072#1082#1094#1080#1103'|'#1057#1086#1089#1090#1086#1103#1085#1080#1077
          Title.TitleButton = True
          Width = 59
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MON$READ_ONLY'
          Footers = <>
          KeyList.Strings = (
            '1'
            '0')
          PickList.Strings = (
            #1090#1086#1083#1100#1082#1086' '#1095#1090#1077#1085#1080#1077
            #1095#1090#1077#1085#1080#1077'/'#1079#1072#1087#1080#1089#1100)
          Title.Caption = #1058#1088#1072#1085#1079#1072#1082#1094#1080#1103'|'#1058#1086#1083#1100#1082#1086' '#1095#1090#1077#1085#1080#1077
          Title.TitleButton = True
          Width = 82
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MON$TIMESTAMP'
          Footers = <>
          Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'|'#1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
          Title.TitleButton = True
          Width = 106
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MON$ISOLATION_MODE_NAME'
          Footers = <>
          Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'|'#1059#1088#1086#1074#1077#1085#1080' '#1080#1079#1086#1083#1103#1094#1080#1080
          Title.TitleButton = True
          Width = 150
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MON$LOCK_TIMEOUT'
          Footers = <>
          Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'|'#1058#1072#1081#1084#1072#1091#1090' '#1073#1083#1086#1082#1080' '#1088#1086#1074#1082#1080
          Title.TitleButton = True
          Width = 125
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MON$AUTO_COMMIT'
          Footers = <>
          KeyList.Strings = (
            '0'
            '1')
          PickList.Strings = (
            '  '
            #1040#1074#1090#1086#1087#1086#1076#1090#1074#1077#1088#1078#1076#1077#1085#1080#1077)
          Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'|'#1040#1074#1090#1086' '#1087#1086#1076#1090#1074#1077#1088' '#1078#1076#1077#1085#1080#1077
          Title.TitleButton = True
          Width = 110
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MON$AUTO_UNDO'
          Footers = <>
          KeyList.Strings = (
            '0'
            '1')
          PickList.Strings = (
            '  '
            #1040#1074#1090#1086#1086#1090#1082#1072#1090)
          Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099'|'#1040#1074#1090#1086' '#1086#1090#1082#1072#1090
          Title.TitleButton = True
          Width = 122
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 180
      Width = 893
      Height = 177
      Align = alBottom
      Caption = 'Panel4'
      TabOrder = 1
      object DBGridEh3: TDBGridEh
        Left = 1
        Top = 1
        Width = 345
        Height = 175
        Align = alLeft
        DataSource = dsTransactionsStatments
        DynProps = <>
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        FooterParams.Color = clWindow
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        PopupMenu = pmStatment
        TabOrder = 0
        TitleParams.MultiTitle = True
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'MON$STATEMENT_ID'
            Footers = <>
            Title.Caption = #1047#1072#1087#1088#1086#1089'|'#1050#1086#1076
            Title.TitleButton = True
            Width = 67
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'MON$STATE_TYPE_NAME'
            Footers = <>
            Title.Caption = #1047#1072#1087#1088#1086#1089'|'#1057#1086#1089#1090#1086#1103#1085#1080#1077
            Title.TitleButton = True
            Width = 95
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'MON$TIMESTAMP'
            Footers = <>
            Title.Caption = #1047#1072#1087#1088#1086#1089'|'#1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072
            Title.TitleButton = True
            Width = 150
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dbsyndt1: TDBSynEdit
        Left = 346
        Top = 1
        Width = 546
        Height = 175
        DataField = 'MON$SQL_TEXT'
        DataSource = dsTransactionsStatments
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.ShowLineNumbers = True
        Highlighter = synsqlsyn2
        ReadOnly = True
      end
    end
  end
  object dsAttachments: TDataSource
    DataSet = qrAttachments
    Left = 273
    Top = 133
  end
  object dsTransactions: TDataSource
    DataSet = qrTransactions
    Left = 221
    Top = 286
  end
  object dsTransactionsStatments: TDataSource
    DataSet = qrTransactionsStatments
    Left = 717
    Top = 430
  end
  object qrAttachments: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    MON$ATTACHMENTS'
      'WHERE'
      '        MON$ATTACHMENT_ID = :OLD_MON$ATTACHMENT_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT MA.MON$ATTACHMENT_ID, MA.MON$SERVER_PID, MA.MON$STATE,'
      '       (SELECT FIRST 1 T.RDB$TYPE_NAME FROM RDB$TYPES T'
      '        WHERE (T.RDB$FIELD_NAME = '#39'MON$STATE'#39')'
      
        '          AND (T.RDB$TYPE       = MA.MON$STATE)) AS MON$STATE_TY' +
        'PE_NAME,'
      
        '       MA.MON$ATTACHMENT_NAME, MA.MON$USER, MA.MON$ROLE, MA.MON$' +
        'REMOTE_PROTOCOL,'
      
        '       MA.MON$REMOTE_ADDRESS, MA.MON$REMOTE_PID, MA.MON$CHARACTE' +
        'R_SET_ID,'
      
        '       (SELECT FIRST 1 CH.RDB$CHARACTER_SET_NAME FROM RDB$CHARAC' +
        'TER_SETS CH'
      
        '        WHERE (CH.RDB$CHARACTER_SET_ID = MA.MON$CHARACTER_SET_ID' +
        ')) AS CHARACTER_SET_NAME,'
      '       MA.MON$TIMESTAMP, MA.MON$GARBAGE_COLLECTION'
      'FROM MON$ATTACHMENTS MA')
    Transaction = trAttachments
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWriteQ
    AutoCommit = True
    Left = 195
    Top = 141
  end
  object trAttachments: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 117
    Top = 140
  end
  object trR: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 71
    Top = 418
  end
  object trR2: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 479
    Top = 416
  end
  object qrTransactions: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT TR.MON$TRANSACTION_ID, TR.MON$ATTACHMENT_ID, TR.MON$STATE' +
        ','
      '       (SELECT FIRST 1 T.RDB$TYPE_NAME FROM RDB$TYPES T'
      '        WHERE (T.RDB$FIELD_NAME = '#39'MON$STATE'#39')'
      
        '          AND (T.RDB$TYPE       = tr.MON$STATE)) AS MON$STATE_TY' +
        'PE_NAME,'
      
        '       TR.MON$TIMESTAMP, TR.MON$TOP_TRANSACTION, TR.MON$OLDEST_T' +
        'RANSACTION,'
      '       TR.MON$OLDEST_ACTIVE, TR.MON$ISOLATION_MODE,'
      '       (SELECT FIRST 1 T.RDB$TYPE_NAME FROM RDB$TYPES T'
      '        WHERE (T.RDB$FIELD_NAME = '#39'MON$ISOLATION_MODE'#39')'
      
        '          AND (T.RDB$TYPE       = tr.MON$ISOLATION_MODE)) AS MON' +
        '$ISOLATION_MODE_NAME,'
      
        '       TR.MON$LOCK_TIMEOUT, TR.MON$READ_ONLY, TR.MON$AUTO_COMMIT' +
        ', TR.MON$AUTO_UNDO'
      'FROM   MON$TRANSACTIONS TR'
      'WHERE  (TR.MON$ATTACHMENT_ID = :MON$ATTACHMENT_ID) ')
    Transaction = trR
    Database = dmMain.dbTV
    DataSource = dsAttachments
    Left = 144
    Top = 288
  end
  object qrTransactionsStatments: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    MON$STATEMENTS'
      'WHERE'
      '        MON$STATEMENT_ID = :OLD_MON$STATEMENT_ID'
      '    ')
    SelectSQL.Strings = (
      
        'SELECT ST.MON$STATEMENT_ID, ST.MON$ATTACHMENT_ID, ST.MON$TRANSAC' +
        'TION_ID, ST.MON$STATE,'
      '       (SELECT FIRST 1 T.RDB$TYPE_NAME FROM RDB$TYPES T'
      '        WHERE (T.RDB$FIELD_NAME = '#39'MON$STATE'#39')'
      
        '          AND (T.RDB$TYPE       = ST.MON$STATE)) AS MON$STATE_TY' +
        'PE_NAME,'
      '       ST.MON$TIMESTAMP, ST.MON$SQL_TEXT'
      'FROM   MON$STATEMENTS ST'
      'WHERE ST.MON$TRANSACTION_ID = :MON$TRANSACTION_ID'
      'and ST.MON$ATTACHMENT_ID = :MON$ATTACHMENT_ID')
    Transaction = trR2
    Database = dmMain.dbTV
    UpdateTransaction = trWriteQ
    DataSource = dsTransactions
    Left = 161
    Top = 457
  end
  object trWriteQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 518
    Top = 367
  end
  object pmStatment: TPopupMenu
    Left = 268
    Top = 416
    object N1: TMenuItem
      Caption = #1059#1073#1080#1090#1100' '#1079#1072#1087#1088#1086#1089
      OnClick = N1Click
    end
  end
  object pmAttach: TPopupMenu
    Left = 360
    Top = 150
    object N2: TMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      OnClick = N4Click
    end
  end
  object synsqlsyn2: TSynSQLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 595
    Top = 58
  end
end
