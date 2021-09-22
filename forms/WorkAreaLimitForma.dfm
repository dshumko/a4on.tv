object WorkAreaLimitForm: TWorkAreaLimitForm
  ShowHint = True
  Left = 0
  Top = 0
  Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077' '#1079#1072#1103#1074#1086#1082' '#1074' '#1076#1077#1085#1100
  ClientHeight = 182
  ClientWidth = 408
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 6
    Top = 18
    Width = 95
    Height = 13
    Caption = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1079#1086#1074#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 6
    Top = 45
    Width = 101
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086', '#1074' '#1076#1077#1085#1100
  end
  object lbl2: TLabel
    Left = 6
    Top = 71
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  inline frm1: TOkCancelFrame
    Left = 0
    Top = 147
    Width = 408
    Height = 35
    Align = alBottom
    TabOrder = 3
    TabStop = True
    inherited bbOk: TBitBtn
      Left = 186
      Top = 6
      Width = 133
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = frm1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 325
      Top = 6
    end
  end
  object cbbType: TDBLookupComboboxEh
    Left = 117
    Top = 15
    Width = 283
    Height = 21
    DynProps = <>
    DataField = 'W_ID'
    DataSource = srcLimit
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'RQTL_ID'
    ListField = 'NAME'
    ListSource = srcRequestType
    TabOrder = 0
    Visible = True
  end
  object edLimit: TDBNumberEditEh
    Left = 117
    Top = 42
    Width = 62
    Height = 21
    DataField = 'QUANT'
    DataSource = srcLimit
    DecimalPlaces = 0
    DynProps = <>
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object dbmNotice: TDBMemoEh
    Left = 117
    Top = 71
    Width = 283
    Height = 70
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcLimit
    DynProps = <>
    EditButtons = <>
    TabOrder = 2
    Visible = True
    WantReturns = True
  end
  object srcRequestType: TDataSource
    AutoEdit = False
    DataSet = dsRequestType
    Left = 178
    Top = 112
  end
  object dsRequestType: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' W.rqtl_id, w.rq_content || '#39' ('#39' || r.rt_name || '#39')'#39' as name'
      'FROM REQUEST_TYPES r'
      ' inner join request_templates w on (r.rt_id = w.rq_type)'
      'order BY W.rq_content')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 80
    Top = 96
  end
  object srcLimit: TDataSource
    DataSet = dsLimit
    Left = 239
    Top = 75
  end
  object dsLimit: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE WORKAREALIMIT'
      'SET '
      '    QUANT = :QUANT,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    WA_ID = :OLD_WA_ID'
      '    and W_ID = :OLD_W_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    WORKAREALIMIT'
      'WHERE'
      '        WA_ID = :OLD_WA_ID'
      '    and W_ID = :OLD_W_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO WORKAREALIMIT('
      '    WA_ID,'
      '    W_ID,'
      '    QUANT,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :WA_ID,'
      '    :W_ID,'
      '    :QUANT,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select wl.WA_ID, wl.W_ID, wl.QUANT, wl.NOTICE'
      'from WORKAREALIMIT wl'
      'where(  wl.wa_id = :WA_ID and wl.W_ID = :W_ID'
      '     ) and (     WL.WA_ID = :OLD_WA_ID'
      '    and WL.W_ID = :OLD_W_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select wl.WA_ID, wl.W_ID, wl.QUANT, wl.NOTICE'
      'from WORKAREALIMIT wl'
      'where wl.wa_id = :WA_ID and wl.W_ID = :W_ID')
    AfterInsert = dsLimitAfterInsert
    BeforePost = dsLimitBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 279
    Top = 76
  end
end
