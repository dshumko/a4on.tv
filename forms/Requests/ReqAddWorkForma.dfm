object ReqAddWork: TReqAddWork
  Left = 0
  Top = 0
  ActiveControl = luWork
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1073#1086#1090#1091' '#1074' '#1079#1072#1103#1074#1082#1091
  ClientHeight = 149
  ClientWidth = 407
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
  object lbl1: TLabel
    Left = 13
    Top = 17
    Width = 36
    Height = 13
    Caption = #1056#1072#1073#1086#1090#1072
  end
  object lbl2: TLabel
    Left = 13
    Top = 44
    Width = 65
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1089#1090#1074#1086
  end
  object lbl4: TLabel
    Left = 13
    Top = 68
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  inline frmOk: TOkCancelFrame
    Left = 0
    Top = 114
    Width = 407
    Height = 35
    Align = alBottom
    TabOrder = 0
    TabStop = True
    inherited bbOk: TBitBtn
      Left = 189
      Width = 125
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    end
    inherited bbCancel: TBitBtn
      Left = 320
      Width = 74
    end
  end
  object luWork: TDBLookupComboboxEh
    Left = 100
    Top = 14
    Width = 294
    Height = 21
    DynProps = <>
    DataField = ''
    EditButtons = <>
    KeyField = 'W_ID'
    ListField = 'NAME'
    ListSource = srcRTWorks
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object edQuant: TDBNumberEditEh
    Left = 100
    Top = 41
    Width = 52
    Height = 21
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = True
  end
  object mmoNotice: TDBMemoEh
    Left = 100
    Top = 68
    Width = 294
    Height = 45
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 3
    Visible = True
    WantReturns = True
  end
  object dsRTWorks: TpFIBDataSet
    SelectSQL.Strings = (
      'select w.* '
      'from works w '
      'where '
      '  w.rq_type = :rt_id and w.Deleted = 0'
      'order by w.name'
      '')
    AutoUpdateOptions.UpdateTableName = 'REQUEST_TEMPLATES'
    AutoUpdateOptions.KeyFields = 'RT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 261
    Top = 36
  end
  object srcRTWorks: TDataSource
    AutoEdit = False
    DataSet = dsRTWorks
    Left = 192
    Top = 35
  end
end
