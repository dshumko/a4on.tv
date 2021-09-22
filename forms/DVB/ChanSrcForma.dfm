object ChanSrcForm: TChanSrcForm
  Left = 410
  Top = 243
  Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1082#1072#1085#1072#1083#1086#1074
  ClientHeight = 293
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
  DesignSize = (
    409
    293)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 48
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object lbl1: TLabel
    Left = 8
    Top = 70
    Width = 36
    Height = 13
    Caption = #1043#1088#1072#1076#1091#1089
  end
  object Label3: TLabel
    Left = 8
    Top = 43
    Width = 19
    Height = 13
    Caption = 'URL'
  end
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 258
    Width = 409
    Height = 35
    Align = alBottom
    TabOrder = 4
    TabStop = True
    inherited bbOk: TBitBtn
      Left = 193
      Top = 7
      Width = 128
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 327
      Top = 7
      Width = 74
      Height = 25
    end
  end
  object edtNAME: TDBEditEh
    Left = 70
    Top = 13
    Width = 331
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'NAME'
    DataSource = srcSource
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object edtNAME1: TDBEditEh
    Left = 70
    Top = 67
    Width = 331
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'DEG'
    DataSource = srcSource
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1054#1088#1073#1080#1090#1072#1083#1100#1085#1086#1077' '#1087#1086#1083#1086#1078#1077#1085#1080#1077
    ShowHint = True
    TabOrder = 2
    Visible = True
  end
  object edtURL: TDBEditEh
    Left = 70
    Top = 40
    Width = 331
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'URL'
    DataSource = srcSource
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = 'WEB '#1089#1072#1081#1090' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object dbmNOTICE: TDBMemoEh
    Left = 8
    Top = 94
    Width = 393
    Height = 165
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcSource
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 3
    Visible = True
    WantReturns = True
  end
  object dsSource: TpFIBDataSet
    UpdateSQL.Strings = (
      'update Channel_Src'
      'set Name = :Name,'
      '    Notice = :Notice,'
      '    Deg = :Deg,'
      '    Url = :Url'
      'where Cs_Id = :OLD_Cs_Id')
    DeleteSQL.Strings = (
      'delete from Channel_Src cs'
      'where cs.Cs_Id = :OLD_Cs_Id'
      ''
      '    ')
    InsertSQL.Strings = (
      'insert into Channel_Src (Cs_Id, Name, Notice, Deg, Url)'
      'values (:Cs_Id, :Name, :Notice, :Deg, :url)')
    SelectSQL.Strings = (
      'select'
      '    cs.*'
      '  from Channel_Src cs'
      '  where cs.Cs_Id = :Cs_Id')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 112
    Top = 194
  end
  object srcSource: TDataSource
    DataSet = dsSource
    Left = 56
    Top = 194
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
    Left = 160
    Top = 194
  end
  object cnError: TCnErrorProvider
    DoubleBuffer = False
    Left = 112
    Top = 144
  end
end
