object ExportSettingsForm: TExportSettingsForm
  Left = 0
  Top = 0
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1096#1072#1073#1083#1086#1085#1086#1074' '#1101#1082#1089#1087#1086#1088#1090#1072
  ClientHeight = 534
  ClientWidth = 735
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlGrid: TPanel
    Left = 0
    Top = 0
    Width = 239
    Height = 499
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 0
      Top = 23
      Width = 239
      Height = 476
      Align = alClient
      AllowedOperations = []
      DataSource = srcTypes
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      TabOrder = 1
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Width = 103
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 102
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object tlb1: TToolBar
      Left = 0
      Top = 0
      Width = 239
      Height = 23
      Caption = 'tlb1'
      Images = A4MainForm.ICONS_ACTIVE
      TabOrder = 0
      object btn1: TToolButton
        Left = 0
        Top = 0
        Width = 5
        Caption = 'btn1'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object btnNew: TToolButton
        Left = 5
        Top = 0
        Action = actAdd
      end
      object btn3: TToolButton
        Left = 28
        Top = 0
        Width = 4
        Caption = 'btn3'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object btnEdit: TToolButton
        Left = 32
        Top = 0
        Action = actEdit
      end
      object btn5: TToolButton
        Left = 55
        Top = 0
        Width = 4
        Caption = 'btn5'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object btnDEl: TToolButton
        Left = 59
        Top = 0
        Action = actDel
      end
      object btn7: TToolButton
        Left = 82
        Top = 0
        Width = 15
        Caption = 'btn7'
        ImageIndex = 27
        Style = tbsSeparator
        Visible = False
      end
      object btnOk: TToolButton
        Left = 97
        Top = 0
        Caption = 'btnOk'
        Enabled = False
        ImageIndex = 25
        OnClick = btnOkClick
      end
      object btnCancel: TToolButton
        Left = 120
        Top = 0
        Caption = 'btnCancel'
        Enabled = False
        ImageIndex = 26
        OnClick = btnCancelClick
      end
      object btn8: TToolButton
        Left = 143
        Top = 0
        Width = 4
        Caption = 'btn8'
        ImageIndex = 28
        Style = tbsSeparator
      end
    end
  end
  object pnlData: TPanel
    Left = 239
    Top = 0
    Width = 496
    Height = 499
    Align = alClient
    BevelKind = bkFlat
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 1
    object pnl1: TPanel
      Left = 0
      Top = 0
      Width = 492
      Height = 142
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        492
        142)
      object lbl4: TLabel
        Left = 4
        Top = 4
        Width = 48
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      end
      object lbl7: TLabel
        Left = 210
        Top = 29
        Width = 91
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072' '#1092#1072#1081#1083#1072
      end
      object lbl9: TLabel
        Left = 4
        Top = 77
        Width = 97
        Height = 13
        Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1081' '#1092#1072#1081#1083#1072
      end
      object lbl8: TLabel
        Left = 4
        Top = 29
        Width = 73
        Height = 13
        Caption = #1060#1086#1088#1084#1072#1090' '#1092#1072#1081#1083#1072
      end
      object lbl5: TLabel
        Left = 0
        Top = 99
        Width = 492
        Height = 13
        Align = alBottom
        Caption = '  '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        ExplicitWidth = 67
      end
      object lbl6: TLabel
        Left = 4
        Top = 53
        Width = 54
        Height = 13
        Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
      end
      object edtDirFiles: TDirectoryEdit
        Left = 104
        Top = 74
        Width = 385
        Height = 21
        Hint = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1081' '#1074' '#1082#1086#1090#1086#1088#1086#1084' '#1083#1077#1078#1072#1090' '#1085#1077#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077' '#1088#1077#1077#1089#1090#1088#1099' '
        NumGlyphs = 1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 4
        Text = ''
      end
      object edtProfile: TDBEditEh
        Left = 104
        Top = 1
        Width = 385
        Height = 21
        Hint = #1053#1072#1079#1074#1072#1085#1080#1103' '#1087#1088#1086#1092#1080#1083#1103
        Anchors = [akLeft, akTop, akRight]
        DataField = 'NAME'
        DataSource = srcTypes
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1088#1086#1092#1080#1083#1103
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
      object cbbCodePage: TDBComboBoxEh
        Left = 308
        Top = 26
        Width = 181
        Height = 21
        Hint = #1042' '#1082#1072#1082#1086#1081' '#1082#1086#1076#1080#1088#1086#1074#1082#1077' '#1092#1072#1081#1083' (Windows, DOS)'
        Anchors = [akTop, akRight]
        DataField = 'FILE_CODEPAGE'
        DataSource = srcTypes
        DynProps = <>
        EditButtons = <>
        Items.Strings = (
          'DOS 866'
          'Windows 1251'
          'UTF8')
        KeyItems.Strings = (
          '0'
          '1'
          '2')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Visible = True
      end
      object cbbFileFormat: TDBComboBoxEh
        Left = 104
        Top = 26
        Width = 98
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'FILE_FORMAT'
        DataSource = srcTypes
        DynProps = <>
        EditButtons = <>
        Items.Strings = (
          #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
          'DBF '#1092#1072#1081#1083)
        KeyItems.Strings = (
          '0'
          '1')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnChange = cbbFileFormatChange
      end
      object edt1: TDBEditEh
        Left = 104
        Top = 50
        Width = 385
        Height = 21
        Hint = 
          #1048#1052#1071' '#1060#1040#1049#1051#1040#13#10#1074#1086#1079#1084#1086#1078#1085#1086' '#1074#1089#1090#1072#1074#1080#1090#1100' '#1087#1077#1088#1077#1084#1077#1085#1085#1099#1077' '#13#10'['#1042#1056#1045#1052#1071']  - '#1074#1088#1077#1084#1103#13#10'['#1044#1045#1053 +
          #1068']  - '#1076#1077#1085#1100#13#10'['#1052#1045#1057#1071#1062']  - '#1084#1077#1089#1103#1094#13#10'['#1043#1054#1044'] - '#1075#1086#1076
        Anchors = [akLeft, akTop, akRight]
        DataField = 'FILENAME'
        DataSource = srcTypes
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1048#1084#1103' '#1092#1072#1081#1083#1072' '#1074' '#1082#1086#1090#1086#1088#1099#1081' '#1073#1091#1076#1091#1090' '#1089#1086#1093#1088#1072#1085#1077#1085#1099' '#1076#1072#1085#1085#1099#1077
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Visible = True
      end
      object dbmmoNotice: TDBMemoEh
        Left = 0
        Top = 112
        Width = 492
        Height = 30
        Align = alBottom
        AutoSize = False
        DataField = 'NOTICE'
        DataSource = srcTypes
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1096#1072#1073#1083#1086#1085#1072
        TabOrder = 5
        Visible = True
        WantReturns = True
      end
    end
    object pgcFileBody: TPageControl
      Left = 0
      Top = 142
      Width = 492
      Height = 353
      ActivePage = tsTXT
      Align = alClient
      TabOrder = 1
      object tsTXT: TTabSheet
        Caption = 'TXT'
        object lbl1: TLabel
          Left = 0
          Top = 120
          Width = 484
          Height = 13
          Align = alTop
          Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1095#1072#1089#1090#1100
          ExplicitWidth = 81
        end
        object lbl3: TLabel
          Left = 0
          Top = 222
          Width = 484
          Height = 13
          Align = alBottom
          Caption = #1055#1086#1076#1074#1072#1083' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          ExplicitWidth = 96
        end
        object dbmmoBody: TDBMemoEh
          Left = 0
          Top = 133
          Width = 484
          Height = 89
          ScrollBars = ssBoth
          Align = alClient
          AutoSize = False
          DataField = 'FILE_BODY'
          DataSource = srcTypes
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1092#1072#1081#1083#1072'. '#1055#1088#1072#1074#1099#1081' '#1082#1083#1080#1082' '#1084#1099#1096#1080' - '#1074#1089#1090#1072#1074#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
          PopupMenu = pmMemo
          TabOrder = 2
          Visible = True
          WantReturns = True
        end
        object dbmmoHead: TDBMemoEh
          Left = 0
          Top = 25
          Width = 484
          Height = 95
          ScrollBars = ssBoth
          Align = alTop
          AutoSize = False
          DataField = 'FILE_HEAD'
          DataSource = srcTypes
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1092#1072#1081#1083#1072'. '#1055#1088#1072#1074#1099#1081' '#1082#1083#1080#1082' '#1084#1099#1096#1080' - '#1074#1089#1090#1072#1074#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
          PopupMenu = pmTotal
          TabOrder = 1
          Visible = True
          WantReturns = True
        end
        object dbmmofooter: TDBMemoEh
          Left = 0
          Top = 235
          Width = 484
          Height = 90
          ScrollBars = ssBoth
          Align = alBottom
          AutoSize = False
          DataField = 'FILE_FOOTER'
          DataSource = srcTypes
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1054#1091#1086#1085#1095#1072#1085#1080#1077' '#1092#1072#1081#1083#1072'. '#1055#1088#1072#1074#1099#1081' '#1082#1083#1080#1082' '#1084#1099#1096#1080' - '#1074#1089#1090#1072#1074#1082#1072' '#1087#1072#1088#1072#1084#1077#1090#1088#1086#1074
          PopupMenu = pmTotal
          TabOrder = 3
          Visible = True
          WantReturns = True
        end
        object pnl2: TPanel
          Left = 0
          Top = 0
          Width = 484
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            484
            25)
          object lbl2: TLabel
            Left = 0
            Top = 3
            Width = 105
            Height = 13
            Align = alCustom
            Caption = #1047#1072#1075#1086#1083#1086#1074#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          end
          object lbl10: TLabel
            Left = 304
            Top = 3
            Width = 144
            Height = 13
            Anchors = [akTop, akRight]
            Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1076#1088#1086#1073#1085#1086#1081' '#1095#1072#1089#1090#1080
          end
          object edtSEP: TDBEditEh
            Left = 456
            Top = 0
            Width = 26
            Height = 21
            Anchors = [akTop, akRight]
            DataField = 'SEPARATOR'
            DataSource = srcTypes
            DynProps = <>
            EditButtons = <>
            TabOrder = 0
            Visible = True
          end
        end
      end
      object tsDBF: TTabSheet
        Caption = 'DBF'
        ImageIndex = 1
        object dbgDBF: TDBGridEh
          Left = 0
          Top = 25
          Width = 484
          Height = 300
          Align = alClient
          DataSource = srcDBF
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          TabOrder = 1
          TitleParams.MultiTitle = True
          OnExit = dbgDBFExit
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'FLDDATA'
              Footers = <>
              PickList.Strings = (
                '['#1051#1048#1062#1045#1042#1054#1049']'
                '['#1057#1040#1051#1051#1068#1044#1054']'
                '['#1044#1054#1051#1043']'
                '['#1060#1040#1052#1048#1051#1048#1071']'
                '['#1048#1052#1071']'
                '['#1054#1058#1063#1045#1057#1058#1042#1054']'
                '['#1048#1053#1048#1062#1048#1040#1051#1067']'
                '['#1059#1051#1048#1062#1040']'
                '['#1044#1054#1052']'
                '['#1050#1042#1040#1056#1058#1048#1056#1040']'
                '['#1056#1040#1049#1054#1053']'
                '['#1058#1045#1051#1045#1060#1054#1053']'
                '['#1052#1054#1041'_'#1058#1045#1051#1045#1060#1054#1053']'
                '[EMAIL]'
                '['#1044#1045#1053#1068']'
                '['#1052#1045#1057#1071#1062']'
                '['#1043#1054#1044']')
              Title.Caption = #1044#1072#1085#1085#1099#1077
              Width = 188
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'FLDNAME'
              Footers = <>
              Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' DBF '#1087#1086#1083#1103
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'FLDTYPE'
              Footers = <>
              KeyList.Strings = (
                'N'
                'C'
                'D')
              PickList.Strings = (
                #1063#1080#1089#1083#1086
                #1057#1090#1088#1086#1082#1072
                #1044#1072#1090#1072)
              Title.Caption = #1058#1080#1087' '#1076#1072#1085#1085#1099#1093
              Width = 60
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'FLDSIZE'
              Footers = <>
              Title.Caption = #1056#1072#1079#1084#1077#1088
              Width = 53
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'FLDPERC'
              Footers = <>
              Title.Caption = #1047#1085#1072#1082#1086#1074' '#1087#1086#1089#1083#1077' '#1079#1072#1087#1103#1090#1086#1081
              Width = 57
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object dbnvgrDBF: TDBNavigator
          Left = 0
          Top = 0
          Width = 484
          Height = 25
          DataSource = srcDBF
          VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
          Align = alTop
          Flat = True
          Hints.Strings = (
            'First record'
            'Prior record'
            'Next record'
            'Last record'
            #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
            #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
            #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
            #1057#1086#1093#1088#1072#1085#1080#1090#1100
            #1054#1090#1084#1077#1085#1072
            'Refresh data')
          TabOrder = 0
        end
      end
    end
  end
  inline okcnclfrm1: TOkCancelFrame
    Left = 0
    Top = 499
    Width = 735
    Height = 35
    Align = alBottom
    TabOrder = 2
    TabStop = True
    ExplicitTop = 499
    ExplicitWidth = 735
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 530
      Top = 6
      Width = 121
      OnClick = okcnclfrm1bbOkClick
      ExplicitLeft = 530
      ExplicitTop = 6
      ExplicitWidth = 121
    end
    inherited bbCancel: TBitBtn
      Left = 657
      Top = 6
      ExplicitLeft = 657
      ExplicitTop = 6
    end
  end
  object srcTypes: TDataSource
    DataSet = dsTypes
    OnStateChange = srcTypesStateChange
    OnDataChange = srcTypesDataChange
    Left = 36
    Top = 232
  end
  object srcDBF: TDataSource
    DataSet = memDBF
    Left = 276
    Top = 236
  end
  object dsTypes: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE EXPORTTYPES'
      'SET '
      '    FILE_FORMAT = :FILE_FORMAT,'
      '    FILE_CODEPAGE = :FILE_CODEPAGE,'
      '    FILE_DIR = :FILE_DIR,'
      '    NOTICE = :NOTICE,'
      '    FILENAME = :FILENAME,'
      '    FILE_HEAD = :FILE_HEAD,'
      '    FILE_BODY = :FILE_BODY,'
      '    FILE_FOOTER = :FILE_FOOTER,'
      '    SEPARATOR = :SEPARATOR'
      'WHERE'
      '    NAME = :OLD_NAME'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EXPORTTYPES'
      'WHERE'
      '        NAME = :OLD_NAME'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO EXPORTTYPES('
      '    NAME,'
      '    FILE_FORMAT,'
      '    FILE_CODEPAGE,'
      '    FILE_DIR,'
      '    NOTICE,'
      '    FILENAME,'
      '    FILE_HEAD,'
      '    FILE_BODY,'
      '    FILE_FOOTER,'
      '    SEPARATOR'
      ')'
      'VALUES('
      '    :NAME,'
      '    :FILE_FORMAT,'
      '    :FILE_CODEPAGE,'
      '    :FILE_DIR,'
      '    :NOTICE,'
      '    :FILENAME,'
      '    :FILE_HEAD,'
      '    :FILE_BODY,'
      '    :FILE_FOOTER,'
      '    :SEPARATOR'
      ')')
    RefreshSQL.Strings = (
      'select '
      'NAME, '
      'FILE_FORMAT, '
      'FILE_CODEPAGE, '
      'FILE_DIR, '
      'NOTICE, '
      'FILENAME, '
      'FILE_HEAD, '
      'FILE_BODY, '
      'FILE_FOOTER,'
      'SEPARATOR'
      'from EXPORTTYPES'
      ''
      ' WHERE '
      '        EXPORTTYPES.NAME = :OLD_NAME'
      '    ')
    SelectSQL.Strings = (
      'select '
      'NAME, '
      'FILE_FORMAT, '
      'FILE_CODEPAGE, '
      'FILE_DIR, '
      'NOTICE, '
      'FILENAME, '
      'FILE_HEAD, '
      'FILE_BODY, '
      'FILE_FOOTER,'
      'SEPARATOR'
      'from EXPORTTYPES'
      'order by NAME')
    BeforePost = dsTypesBeforePost
    OnNewRecord = dsTypesNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 36
    Top = 176
  end
  object pmMemo: TPopupMenu
    Left = 451
    Top = 264
  end
  object pmTotal: TPopupMenu
    Left = 444
    Top = 190
  end
  object memDBF: TMemTableEh
    Active = True
    Params = <>
    Left = 360
    Top = 176
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object FLDDATA: TMTStringDataFieldEh
          FieldName = 'FLDDATA'
          StringDataType = fdtStringEh
          DisplayLabel = 'FLDDATA'
          DisplayWidth = 50
          Size = 50
          Transliterate = True
        end
        object FLDNAME: TMTStringDataFieldEh
          FieldName = 'FLDNAME'
          StringDataType = fdtStringEh
          DisplayLabel = 'FLDNAME'
          DisplayWidth = 10
          Size = 10
          Transliterate = True
        end
        object FLDTYPE: TMTStringDataFieldEh
          FieldName = 'FLDTYPE'
          StringDataType = fdtStringEh
          DisplayLabel = 'FLDTYPE'
          DisplayWidth = 1
          Size = 1
          Transliterate = True
        end
        object FLDSIZE: TMTNumericDataFieldEh
          FieldName = 'FLDSIZE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'FLDSIZE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object FLDPERC: TMTNumericDataFieldEh
          FieldName = 'FLDPERC'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'FLDPERC'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object actList: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 56
    Top = 112
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 2
      ShortCut = 45
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 4
      ShortCut = 113
      OnExecute = actEditExecute
    end
    object actDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      ShortCut = 16430
      OnExecute = actDelExecute
    end
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
    Left = 120
    Top = 164
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
    Left = 120
    Top = 222
  end
end
