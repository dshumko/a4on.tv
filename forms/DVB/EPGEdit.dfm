object EPGEditEvent: TEPGEditEvent
  ShowHint = True
  Left = 0
  Top = 0
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' EPG'
  ClientHeight = 446
  ClientWidth = 497
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyUp = FormKeyUp
  DesignSize = (
    497
    446)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 11
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
  object Label2: TLabel
    Left = 20
    Top = 41
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
  object Label3: TLabel
    Left = 20
    Top = 70
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
    Left = 20
    Top = 312
    Width = 49
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
  end
  object Label5: TLabel
    Left = 19
    Top = 100
    Width = 36
    Height = 13
    Caption = #1046#1072#1085#1088#1099
  end
  object Label6: TLabel
    Left = 19
    Top = 130
    Width = 58
    Height = 13
    Caption = #1046#1072#1085#1088#1099' DVB'
  end
  object Label7: TLabel
    Left = 18
    Top = 159
    Width = 69
    Height = 13
    Caption = #1042#1086#1079#1088'. '#1086#1075#1088'-'#1085#1080#1077
  end
  object Label8: TLabel
    Left = 19
    Top = 189
    Width = 69
    Height = 13
    Caption = #1043#1086#1076' '#1089#1086#1079#1076#1072#1085#1080#1103
  end
  object Label9: TLabel
    Left = 19
    Top = 219
    Width = 39
    Height = 13
    Caption = #1040#1082#1090#1077#1088#1099
  end
  object Label10: TLabel
    Left = 17
    Top = 248
    Width = 43
    Height = 13
    Caption = #1056#1077#1078#1080#1089#1077#1088
  end
  object Label11: TLabel
    Left = 19
    Top = 278
    Width = 37
    Height = 13
    Caption = #1057#1090#1088#1072#1085#1072
  end
  object SpeedButton1: TSpeedButton
    Left = 468
    Top = 127
    Width = 21
    Height = 21
    Caption = '...'
    Flat = True
    OnClick = SpeedButton1Click
  end
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 411
    Width = 497
    Height = 35
    Align = alBottom
    TabOrder = 13
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 269
      Top = 6
      Width = 128
    end
    inherited bbCancel: TBitBtn
      Left = 415
      Top = 6
      Width = 74
    end
  end
  object DBEditEh1: TDBEditEh
    Left = 120
    Top = 8
    Width = 369
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'TITLE'
    DataSource = srcProgramma
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1047#1072#1075#1086#1083#1086#1074#1086#1082
    TabOrder = 0
    Visible = True
  end
  object edStartDate: TDBDateTimeEditEh
    Left = 120
    Top = 38
    Width = 121
    Height = 21
    DataField = 'DATE_START'
    DataSource = srcProgramma
    DynProps = <>
    EditButtons = <>
    TabOrder = 1
    Visible = True
    EditFormat = 'DD/MM/YYYY'
  end
  object edStopDate: TDBDateTimeEditEh
    Left = 120
    Top = 67
    Width = 121
    Height = 21
    DataField = 'DATE_STOP'
    DataSource = srcProgramma
    DynProps = <>
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 3
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 120
    Top = 97
    Width = 369
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'GENRES'
    DataSource = srcProgramma
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1046#1072#1085#1088#1099' '#1095#1077#1088#1077#1079' '#1079#1072#1087#1103#1090#1091#1102
    TabOrder = 5
    Visible = True
  end
  object DBNumberEditEh1: TDBNumberEditEh
    Left = 120
    Top = 156
    Width = 121
    Height = 21
    DataField = 'MINAGE'
    DataSource = srcProgramma
    DynProps = <>
    EmptyDataInfo.Text = #1042#1086#1079#1088#1072#1089#1090'. '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077
    EditButtons = <>
    TabOrder = 7
    Visible = True
  end
  object DBEditEh3: TDBEditEh
    Left = 120
    Top = 216
    Width = 369
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'ACTORS'
    DataSource = srcProgramma
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1040#1082#1090#1077#1088#1099
    TabOrder = 9
    Visible = True
  end
  object DBEditEh4: TDBEditEh
    Left = 120
    Top = 245
    Width = 369
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'DIRECTED'
    DataSource = srcProgramma
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1056#1077#1078#1080#1089#1077#1088
    TabOrder = 10
    Visible = True
  end
  object DBEditEh5: TDBEditEh
    Left = 120
    Top = 275
    Width = 369
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'COUNTRY'
    DataSource = srcProgramma
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1057#1090#1088#1072#1085#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
    TabOrder = 11
    Visible = True
  end
  object DBMemo1: TDBMemoEh
    Left = 120
    Top = 309
    Width = 369
    Height = 95
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataField = 'DESCRIPTION'
    DataSource = srcProgramma
    ScrollBars = ssBoth
    TabOrder = 12
  end
  object edStopTime: TDBDateTimeEditEh
    Left = 248
    Top = 67
    Width = 58
    Height = 21
    DataField = 'DATE_STOP'
    DataSource = srcProgramma
    DynProps = <>
    EditButton.Visible = False
    EditButtons = <>
    TabOrder = 4
    Visible = True
    EditFormat = 'HH:NN'
  end
  object edStartTime: TDBDateTimeEditEh
    Left = 248
    Top = 38
    Width = 58
    Height = 21
    DataField = 'DATE_START'
    DataSource = srcProgramma
    DynProps = <>
    EditButton.Visible = False
    EditButtons = <>
    TabOrder = 2
    Visible = True
    EditFormat = 'HH:NN'
  end
  object DBEditEh6: TDBEditEh
    Left = 120
    Top = 186
    Width = 369
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'CREATE_YEAR'
    DataSource = srcProgramma
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1043#1086#1076' '#1089#1086#1079#1076#1072#1085#1080#1103
    TabOrder = 8
    Visible = True
  end
  object edtDVBGENRES: TDBEditEh
    Left = 120
    Top = 127
    Width = 345
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'DVBGENRES'
    DataSource = srcProgramma
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1050#1086#1076#1099' '#1078#1072#1085#1088#1086#1074' DVB, '#1095#1077#1088#1077#1079' '#1079#1072#1087#1103#1090#1091#1102
    TabOrder = 6
    Visible = True
  end
  object dsProgramma: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE EPG'
      'SET '
      '    EPG_DATE = :EPG_DATE,'
      '    TITLE = :TITLE,'
      '    DURATION = :DURATION,'
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
      '    CH_ID = :OLD_CH_ID'
      '    and DATE_START = :OLD_DATE_START'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EPG'
      'WHERE'
      '        CH_ID = :OLD_CH_ID'
      '    and DATE_START = :OLD_DATE_START'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO EPG('
      '    CH_ID,'
      '    DATE_START,'
      '    EPG_DATE,'
      '    TITLE,'
      '    DURATION,'
      '    DATE_STOP,'
      '    DESCRIPTION,'
      '    GENRES,'
      '    DVBGENRES,'
      '    MINAGE,'
      '    CREATE_YEAR,'
      '    ACTORS,'
      '    DIRECTED,'
      '    COUNTRY'
      ')'
      'VALUES('
      '    :CH_ID,'
      '    :DATE_START,'
      '    :EPG_DATE,'
      '    :TITLE,'
      '    :DURATION,'
      '    :DATE_STOP,'
      '    :DESCRIPTION,'
      '    :GENRES,'
      '    :DVBGENRES,'
      '    :MINAGE,'
      '    :CREATE_YEAR,'
      '    :ACTORS,'
      '    :DIRECTED,'
      '    :COUNTRY'
      ')')
    RefreshSQL.Strings = (
      'select * from epg e'
      'where(  ch_id = :ch_id'
      'and DATE_START = :Start_time'
      '     ) and (     E.CH_ID = :OLD_CH_ID'
      '    and E.DATE_START = :OLD_DATE_START'
      '     )'
      '    '
      ' ')
    SelectSQL.Strings = (
      'select * from epg e'
      'where ch_id = :ch_id'
      'and DATE_START = :Start_time'
      ' ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 169
    Top = 327
  end
  object srcProgramma: TDataSource
    DataSet = dsProgramma
    Left = 409
    Top = 324
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 245
    Top = 323
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 336
    Top = 323
  end
end
