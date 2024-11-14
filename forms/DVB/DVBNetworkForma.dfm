object DVBNetworkForm: TDVBNetworkForm
  Left = 410
  Top = 243
  Caption = #1057#1077#1090#1100' DVB'
  ClientHeight = 422
  ClientWidth = 409
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
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 48
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 8
    Top = 203
    Width = 119
    Height = 13
    Caption = #1063#1072#1089#1086#1074#1086#1081' '#1087#1086#1103#1089' '#1089#1077#1090#1080', '#1084#1080#1085
  end
  object Label4: TLabel
    Left = 8
    Top = 40
    Width = 44
    Height = 13
    Caption = 'NID '#1089#1077#1090#1080
  end
  object Label5: TLabel
    Left = 8
    Top = 288
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object lbl1: TLabel
    Left = 8
    Top = 233
    Width = 37
    Height = 13
    Caption = #1057#1090#1088#1072#1085#1072
  end
  object lbl2: TLabel
    Left = 8
    Top = 262
    Width = 103
    Height = 13
    Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1103#1079#1099#1082' '#1089#1077#1090#1080
  end
  object lbl3: TLabel
    Left = 216
    Top = 40
    Width = 26
    Height = 13
    Caption = 'ONID'
  end
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 387
    Width = 409
    Height = 35
    Align = alBottom
    TabOrder = 9
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 190
      Top = 7
      Width = 128
      Height = 24
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 327
      Top = 7
      Width = 74
      Height = 24
    end
  end
  object edtNAME: TDBEditEh
    Left = 70
    Top = 13
    Width = 331
    Height = 21
    DataField = 'NAME'
    DataSource = srcNetwork
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1077#1090#1080
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object edtTIMEOFFSET: TDBNumberEditEh
    Left = 139
    Top = 203
    Width = 262
    Height = 21
    DataField = 'TIMEOFFSET'
    DataSource = srcNetwork
    DecimalPlaces = 0
    DynProps = <>
    EmptyDataInfo.Text = #1063#1072#1089#1086#1074#1086#1081' '#1087#1086#1103#1089' '#1089#1077#1090#1080', '#1084#1080#1085'      .'
    EditButton.Visible = True
    EditButtons = <>
    ShowHint = True
    TabOrder = 5
    Visible = True
  end
  object edtNID: TDBNumberEditEh
    Left = 70
    Top = 38
    Width = 123
    Height = 21
    DataField = 'NID'
    DataSource = srcNetwork
    DecimalPlaces = 0
    DynProps = <>
    EmptyDataInfo.Text = 'NID'
    EditButtons = <>
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object GroupBoxPID: TGroupBox
    Left = 8
    Top = 65
    Width = 185
    Height = 126
    Caption = '  '#1055#1077#1088#1077#1076#1072#1074#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1099'  (PID) '
    TabOrder = 3
    object chkNIT: TDBCheckBoxEh
      Left = 24
      Top = 24
      Width = 127
      Height = 17
      Caption = 'NIT'
      DynProps = <>
      Enabled = False
      TabOrder = 0
    end
    object chkSDT: TDBCheckBoxEh
      Left = 24
      Top = 59
      Width = 127
      Height = 17
      Caption = 'SDT'
      DynProps = <>
      Enabled = False
      TabOrder = 1
    end
    object chkTDT: TDBCheckBoxEh
      Left = 24
      Top = 93
      Width = 127
      Height = 17
      Caption = 'TDT && TOT'
      DynProps = <>
      TabOrder = 2
    end
  end
  object GroupBoxEIT: TGroupBox
    Left = 216
    Top = 65
    Width = 185
    Height = 126
    Caption = '  '#1044#1072#1085#1085#1099#1077' '#1074' EIT '
    TabOrder = 4
    object chkDescParental: TDBCheckBoxEh
      Left = 24
      Top = 93
      Width = 137
      Height = 17
      Caption = #1042#1086#1079#1088#1072#1089#1090'. '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077
      DynProps = <>
      TabOrder = 2
    end
    object chkDescContent: TDBCheckBoxEh
      Left = 24
      Top = 59
      Width = 137
      Height = 17
      Caption = #1046#1072#1085#1088' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      DynProps = <>
      TabOrder = 1
    end
    object chkDescExtended: TDBCheckBoxEh
      Left = 24
      Top = 24
      Width = 137
      Height = 17
      Caption = #1056#1072#1089#1096#1080#1088'. '#1086#1087#1080#1089#1072#1085#1080#1077
      DynProps = <>
      TabOrder = 0
    end
  end
  object DBMemo1: TDBMemoEh
    Left = 8
    Top = 307
    Width = 393
    Height = 71
    ScrollBars = ssBoth
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcNetwork
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 8
    Visible = True
    WantReturns = True
  end
  object cbLang: TDBComboBoxEh
    Left = 139
    Top = 257
    Width = 262
    Height = 21
    DataField = 'LANG'
    DataSource = srcNetwork
    DynProps = <>
    EditButtons = <>
    Items.Strings = (
      'Russian - '#1056#1091#1089#1089#1082#1080#1081
      'Belarusian - '#1041#1077#1083#1072#1088#1091#1089#1082#1110
      'Ukrainian - '#1059#1082#1088#1072#1111#1085#1089#1100#1082#1072
      'English'
      'Latvian - Latviesu'
      'Lithuanian - Lietuviu'
      'Estonian - Eesti'
      'Polish - j'#281'zyk Polski'
      'French - Francais'
      'German - Deutsch'
      'Serbian - '#1089#1088#1087#1089#1082#1080
      'Bulgarian - '#1073#1098#1083#1075#1072#1088#1089#1082#1080' '#1077#1079#1080#1082
      #1040#1088#1084#1103#769#1085#1089#1082#1080#1081' '#1103#1079#1099#769#1082' - '#1392#1377#1397#1381#1408#1383#1398', '#1392#1377#1397#1381#1408#1381#1398
      #1050#1072#1079#1072#769#1093#1089#1082#1080#1081' '#1103#1079#1099#769#1082' - '#1179#1072#1079#1072#1179' '#1090#1110#1083#1110
      'Turkish - T'#252'rk'#231'e'
      'Greek - '#917#955#955#951#957#953#954#940)
    KeyItems.Strings = (
      'RUS'
      'BEL'
      'UKR'
      'ENG'
      'LAV'
      'LIT'
      'EST'
      'POL'
      'FRA'
      'DEU'
      'SRP'
      'BUL'
      'ARM'
      'KAZ'
      'TUR'
      'GRE')
    ShowHint = True
    TabOrder = 7
    Visible = True
  end
  object cbCOUNTRY: TDBComboBoxEh
    Left = 139
    Top = 230
    Width = 262
    Height = 21
    DataField = 'COUNTRY'
    DataSource = srcNetwork
    DynProps = <>
    EditButtons = <>
    Items.Strings = (
      'Russia - '#1056#1086#1089#1089#1080#1103
      'Belarus - '#1041#1077#1083#1072#1088#1091#1089#1100
      'Ukraine - '#1059#1082#1088#1072#1111#1085#1072
      'England / USA'
      'Latvia - Latvijas'
      'Lithuania - Lietuvos'
      'Estonia - Eesti'
      'Poland - Polska'
      'France - Fran'#231'aise '
      'Germany - Deutschland'
      'Serbia - '#1057#1088#1073#1080#1112#1072
      'Bulgaria - '#1041#1098#1083#1075#1072#1088#1080#1103
      'Armenia - '#1344#1377#1397#1377#1405#1407#1377#1398
      #1050#1072#1079#1072#1093#1089#1090#1072#769#1085' - '#1178#1072#1079#1072#1179#1089#1090#1072#1085)
    KeyItems.Strings = (
      'RUS'
      'BEL'
      'UKR'
      'ENG'
      'LAV'
      'LIT'
      'EST'
      'POL'
      'FRA'
      'DEU'
      'SRP'
      'BUL'
      'ARM')
    ShowHint = True
    TabOrder = 6
    Visible = True
  end
  object edtONID: TDBNumberEditEh
    Left = 278
    Top = 38
    Width = 123
    Height = 21
    DataField = 'ONID'
    DataSource = srcNetwork
    DynProps = <>
    EmptyDataInfo.Text = 'ONID'
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = True
  end
  object dsNetwork: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE DVB_NETWORK'
      'SET '
      '    NAME = :NAME,'
      '    NOTICE = :NOTICE,'
      '    NID = :NID,'
      '    ONID = :ONID,'
      '    PIDS = :PIDS,'
      '    DESCRIPTORS = :DESCRIPTORS,'
      '    Timeoffset = :Timeoffset,'
      '    LANG = :LANG,'
      '    COUNTRY = :COUNTRY'
      'WHERE'
      '    DVBN_ID = :OLD_DVBN_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DVB_NETWORK'
      'WHERE'
      '        DVBN_ID = :OLD_DVBN_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO DVB_NETWORK('
      '    DVBN_ID,'
      '    NAME,'
      '    NOTICE,'
      '    NID,'
      '    ONID,'
      '    PIDS,'
      '    DESCRIPTORS,'
      '    Timeoffset,'
      '    LANG,'
      '    COUNTRY,'
      '    EPG_UPDATED'
      ')'
      'VALUES('
      '    :DVBN_ID,'
      '    :NAME,'
      '    :NOTICE,'
      '    :NID,'
      '    :ONID,'
      '    :PIDS,'
      '    :DESCRIPTORS,'
      '    :Timeoffset,'
      '    :LANG,'
      '    :COUNTRY,'
      '    LOCALTIMESTAMP'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    n.*'
      '  from DVB_Network n'
      '  where N.DVBN_ID = :OLD_DVBN_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    n.*'
      '  from DVB_Network n'
      '  where n.DVBN_ID = :DVBN_ID')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 72
    Top = 346
  end
  object srcNetwork: TDataSource
    DataSet = dsNetwork
    Left = 16
    Top = 346
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
    Top = 346
  end
end
