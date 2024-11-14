object AreaViewForm: TAreaViewForm
  Left = 378
  Top = 361
  ActiveControl = dbeName
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
  ClientHeight = 216
  ClientWidth = 395
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 20
    Height = 13
    Caption = #1050#1086#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 84
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 99
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  inline OkCancelFrame: TOkCancelFrame
    Left = 0
    Top = 179
    Width = 395
    Height = 37
    Align = alBottom
    TabOrder = 3
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 136
      Top = 7
      Width = 159
      Enabled = False
      OnClick = OkCancelFramebbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 312
      Top = 7
    end
  end
  object dbEditCode: TDBEditEh
    Left = 8
    Top = 72
    Width = 379
    Height = 21
    DataField = 'AREA_CODE'
    DataSource = srcArea
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 1
    Visible = True
    OnChange = dbEditCodeChange
  end
  object dbeName: TDBEditEh
    Left = 8
    Top = 24
    Width = 379
    Height = 21
    DataField = 'AREA_NAME'
    DataSource = srcArea
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnChange = dbeNameChange
    OnEnter = dbeNameEnter
  end
  object DBMemo1: TDBMemoEh
    Left = 8
    Top = 115
    Width = 379
    Height = 58
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcArea
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = True
    WantReturns = True
  end
  object trSRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 320
    Top = 56
  end
  object trSWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 320
    Top = 104
  end
  object dsArea: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE AREA'
      'SET '
      '    AREA_NAME = :AREA_NAME,'
      '    NOTICE = :NOTICE,'
      '    AREA_CODE = :AREA_CODE'
      'WHERE'
      '    AREA_ID = :OLD_AREA_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    AREA'
      'WHERE'
      '        AREA_ID = :OLD_AREA_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO AREA('
      '    AREA_ID,'
      '    AREA_NAME,'
      '    NOTICE,'
      '    AREA_CODE'
      ')'
      'VALUES('
      '    :AREA_ID,'
      '    :AREA_NAME,'
      '    :NOTICE,'
      '    :AREA_CODE'
      ')')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM AREA'
      'where(  area_id <> 0'
      '     ) and (     AREA.AREA_ID = :OLD_AREA_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM AREA'
      'where area_id = :AREA_ID'
      'order by AREA_NAME')
    Transaction = trSRead
    Database = dmMain.dbTV
    UpdateTransaction = trSWrite
    AutoCommit = True
    Left = 176
    Top = 48
  end
  object srcArea: TDataSource
    AutoEdit = False
    DataSet = dsArea
    Left = 176
    Top = 112
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 248
    Top = 48
  end
end
