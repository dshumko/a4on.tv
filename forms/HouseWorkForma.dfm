object HouseWorkForm: THouseWorkForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1054#1090#1095#1077#1090' '#1086' '#1055#1055#1056
  ClientHeight = 208
  ClientWidth = 384
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
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 11
    Top = 48
    Width = 99
    Height = 13
    Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1099' '#1088#1072#1073#1086#1090#1099
  end
  object lbl2: TLabel
    Left = 11
    Top = 3
    Width = 59
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1072#1073#1086#1090
  end
  object lbl3: TLabel
    Left = 152
    Top = 3
    Width = 66
    Height = 13
    Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
  end
  object edtDateWork: TDBDateTimeEditEh
    Left = 8
    Top = 21
    Width = 121
    Height = 21
    DataField = 'DATE_PPR'
    DataSource = srcWork
    DynProps = <>
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object dbcbWorker: TDBLookupComboboxEh
    Left = 152
    Top = 22
    Width = 222
    Height = 21
    DynProps = <>
    DataField = 'WORKER_PPR'
    DataSource = srcWork
    EditButtons = <>
    KeyField = 'WORKER_ID'
    ListField = 'FIO'
    ListSource = srcWorker
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object dbmmo1: TDBMemoEh
    Left = 11
    Top = 65
    Width = 363
    Height = 93
    Align = alCustom
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcWork
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = True
    WantReturns = True
  end
  inline okcnl: TOkCancelFrame
    Left = 0
    Top = 173
    Width = 384
    Height = 35
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
      Left = 143
      Top = 6
      Width = 142
      OnClick = okcnlbbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 299
      Top = 6
    end
  end
  object srcWork: TDataSource
    DataSet = dsWork
    Left = 96
    Top = 128
  end
  object dsWork: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE HOUSEWORKS'
      'SET '
      '    HOUSE_ID = :HOUSE_ID,'
      '    DATE_PPR = :DATE_PPR,'
      '    WORKER_PPR = :WORKER_PPR,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    HW_ID = :OLD_HW_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    HOUSEWORKS'
      'WHERE'
      '        HW_ID = :OLD_HW_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO HOUSEWORKS('
      '    HW_ID,'
      '    HOUSE_ID,'
      '    DATE_PPR,'
      '    WORKER_PPR,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :HW_ID,'
      '    :HOUSE_ID,'
      '    :DATE_PPR,'
      '    :WORKER_PPR,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'SELECT w.*'
      'FROM Houseworks W'
      ''
      'WHERE(  w.HW_Id = :HW_Id'
      '     ) and (     W.HW_ID = :OLD_HW_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT w.*'
      'FROM Houseworks W'
      ''
      'WHERE w.HW_Id = :HW_Id')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 32
    Top = 128
  end
  object dsWorker: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' W.*'
      'FROM V_ORDER_CREATOR W'
      'order BY W.FIO')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 336
    Top = 80
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 84
    Top = 76
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
    Left = 128
    Top = 76
  end
  object srcWorker: TDataSource
    DataSet = dsWorker
    Left = 272
    Top = 96
  end
end
