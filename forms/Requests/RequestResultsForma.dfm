object RequestResult: TRequestResult
  Left = 0
  Top = 0
  ActiveControl = edNAME
  Caption = 'RequestResult'
  ClientHeight = 181
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 16
    Width = 64
    Height = 13
    Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
  end
  object lbl2: TLabel
    Left = 8
    Top = 68
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  inline frmOk: TOkCancelFrame
    Left = 0
    Top = 146
    Width = 440
    Height = 35
    Align = alBottom
    TabOrder = 0
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 210
      Width = 140
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = frmOkbbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 356
    end
  end
  object edNAME: TDBEditEh
    Left = 78
    Top = 13
    Width = 353
    Height = 21
    DataField = 'NAME'
    DataSource = srcResult
    DynProps = <>
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object chkFINISHED: TDBCheckBoxEh
    Left = 8
    Top = 42
    Width = 84
    Height = 17
    Hint = #1057#1095#1080#1090#1072#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1074#1099#1087#1086#1083#1085#1077#1085#1086#1081' '#1080#1083#1080' '#1085#1077#1090
    Alignment = taLeftJustify
    Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1072
    DataField = 'FINISHED'
    DataSource = srcResult
    DynProps = <>
    TabOrder = 2
  end
  object mmoNOTICE: TDBMemoEh
    Left = 78
    Top = 68
    Width = 353
    Height = 65
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcResult
    DynProps = <>
    EditButtons = <>
    TabOrder = 3
    Visible = True
    WantReturns = True
  end
  object srcResult: TDataSource
    DataSet = dsResult
    Left = 177
    Top = 100
  end
  object dsResult: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE REQUEST_RESULTS'
      'SET '
      '    NAME = :NAME,'
      '    FINISHED = :FINISHED,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    RR_ID = :OLD_RR_ID'
      '    ')
    DeleteSQL.Strings = (
      'update REQUEST_RESULTS'
      'set deleted = 1'
      'WHERE'
      '        RR_ID = :OLD_RR_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO REQUEST_RESULTS('
      '    RT_ID,'
      '    NAME,'
      '    FINISHED,'
      '    NOTICE,'
      '    DELETED'
      ')'
      'VALUES('
      '    :RT_ID,'
      '    :NAME,'
      '    :FINISHED,'
      '    :NOTICE,'
      '    :DELETED'
      ')')
    RefreshSQL.Strings = (
      'select RR_ID, RT_ID, NAME, FINISHED, NOTICE, DELETED'
      'from REQUEST_RESULTS'
      'where(  RR_ID = :RR_ID'
      '     ) and (     REQUEST_RESULTS.RR_ID = :OLD_RR_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select RR_ID, RT_ID, NAME, FINISHED, NOTICE, DELETED'
      'from REQUEST_RESULTS'
      'where RR_ID = :RR_ID')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 244
    Top = 96
  end
end
