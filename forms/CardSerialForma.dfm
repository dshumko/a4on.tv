object fmCardSerial: TfmCardSerial
  Left = 545
  Top = 395
  BorderIcons = [biSystemMenu]
  Caption = #1057#1077#1088#1080#1103' '#1082#1072#1088#1090#1086#1095#1082#1080
  ClientHeight = 254
  ClientWidth = 288
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
    288
    254)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 44
    Width = 111
    Height = 13
    Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1087#1083#1072#1090#1077#1078#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 8
    Top = 1
    Width = 34
    Height = 13
    Caption = #1057#1077#1088#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblNotice: TLabel
    Left = 8
    Top = 88
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  inline okcnclfrm1: TOkCancelFrame
    Left = 0
    Top = 219
    Width = 288
    Height = 35
    Align = alBottom
    TabOrder = 3
    TabStop = True
    ExplicitTop = 229
    ExplicitWidth = 298
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 97
      Top = 9
      Width = 103
      ExplicitLeft = 107
      ExplicitTop = 9
      ExplicitWidth = 103
    end
    inherited bbCancel: TBitBtn
      Left = 205
      Top = 9
      ExplicitLeft = 215
      ExplicitTop = 9
    end
  end
  object LupPaySrc: TDBLookupComboboxEh
    Left = 8
    Top = 58
    Width = 272
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'CS_SOURCE_ID'
    DataSource = srcCardSerial
    DropDownBox.AutoDrop = True
    DropDownBox.ShowTitles = True
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'PAYSOURCE_ID'
    ListField = 'PAYSOURCE_DESCR'
    ListSource = srcPaySource
    ShowHint = True
    TabOrder = 1
    Visible = True
    ExplicitWidth = 282
  end
  object edtSerial: TDBEditEh
    Left = 8
    Top = 17
    Width = 272
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'CS_SERIAL'
    DataSource = srcCardSerial
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 0
    Visible = True
    ExplicitWidth = 282
  end
  object dbmmoNotice: TDBMemoEh
    Left = 8
    Top = 104
    Width = 272
    Height = 103
    ScrollBars = ssVertical
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'CS_NOTICE'
    DataSource = srcCardSerial
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = True
    WantReturns = True
    ExplicitWidth = 282
    ExplicitHeight = 113
  end
  object dsCardSerial: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CARDS_SERIALS'
      'SET '
      '    CS_SERIAL = :CS_SERIAL,'
      '    CS_SOURCE_ID = :CS_SOURCE_ID,'
      '    CS_NOTICE = :CS_NOTICE'
      'WHERE'
      '    CS_ID = :OLD_CS_ID'
      '    ')
    DeleteSQL.Strings = (
      ''
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CARDS_SERIALS('
      '    CS_ID,'
      '    CS_SERIAL,'
      '    CS_SOURCE_ID,'
      '    CS_NOTICE'
      ')'
      'VALUES('
      '    :CS_ID,'
      '    :CS_SERIAL,'
      '    :CS_SOURCE_ID,'
      '    :CS_NOTICE'
      ')')
    RefreshSQL.Strings = (
      ''
      '')
    SelectSQL.Strings = (
      'SELECT Cs.Cs_Id, Cs.Cs_Serial, Cs.Cs_Source_Id, Cs.Cs_Notice'
      'FROM Cards_Serials Cs'
      'where cs.cs_id = :cs_id'
      '')
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 24
    Top = 128
  end
  object srcCardSerial: TDataSource
    AutoEdit = False
    DataSet = dsCardSerial
    Left = 24
    Top = 176
  end
  object dsPaySource: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT Paysource_Id, Paysource_Descr'
      'FROM Paysource'
      'order by 2')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    Left = 106
    Top = 125
  end
  object srcPaySource: TDataSource
    DataSet = dsPaySource
    Left = 106
    Top = 165
  end
end
