object fmCardPayGenerate: TfmCardPayGenerate
  ShowHint = True
  Left = 526
  Top = 248
  BorderStyle = bsDialog
  Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1082#1072#1088#1090' '#1086#1087#1083#1072#1090#1099
  ClientHeight = 239
  ClientWidth = 339
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 22
    Width = 31
    Height = 13
    Caption = #1057#1077#1088#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 8
    Top = 60
    Width = 43
    Height = 13
    Caption = #1053#1086#1084#1080#1085#1072#1083
  end
  object lbl3: TLabel
    Left = 8
    Top = 98
    Width = 95
    Height = 13
    Caption = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1072' '#1076#1086
  end
  object lbl4: TLabel
    Left = 8
    Top = 136
    Width = 62
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1082#1072#1088#1090
  end
  object lupSerials: TDBLookupComboboxEh
    Left = 107
    Top = 20
    Width = 209
    Height = 21
    DynProps = <>
    DataField = ''
    DropDownBox.Columns = <
      item
        FieldName = 'CS_SERIAL'
      end
      item
        FieldName = 'Paysource_Descr'
        Width = 30
      end
      item
        FieldName = 'CS_NOTICE'
      end>
    DropDownBox.ListSource = srcCardSerial
    DropDownBox.AutoDrop = True
    DropDownBox.Sizable = True
    EditButtons = <
      item
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1089#1077#1088#1080#1102' '#1082#1072#1088#1090#1086#1095#1077#1082
        ShortCut = 16467
        Style = ebsPlusEh
        OnClick = LupStreetsEditButtons0Click
      end>
    KeyField = 'CS_ID'
    ListField = 'CS_SERIAL'
    ListSource = srcCardSerial
    TabOrder = 0
    Visible = True
  end
  object edNominal: TDBNumberEditEh
    Left = 107
    Top = 58
    Width = 121
    Height = 21
    DecimalPlaces = 0
    DynProps = <>
    EditButtons = <>
    MaxValue = 1000000000.000000000000000000
    MinValue = 1.000000000000000000
    TabOrder = 1
    Visible = True
  end
  object edCount: TDBNumberEditEh
    Left = 107
    Top = 130
    Width = 121
    Height = 21
    DecimalPlaces = 0
    DynProps = <>
    EditButton.Visible = True
    EditButtons = <>
    MaxValue = 10000000.000000000000000000
    MinValue = 1.000000000000000000
    TabOrder = 3
    Value = 1.000000000000000000
    Visible = True
  end
  object dedExp: TDBDateTimeEditEh
    Left = 107
    Top = 94
    Width = 121
    Height = 21
    DynProps = <>
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 2
    Visible = True
  end
  inline okcnclfrm: TOkCancelFrame
    Left = 0
    Top = 204
    Width = 339
    Height = 35
    Align = alBottom
    TabOrder = 4
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 110
      Top = 6
      Width = 144
      Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1085#1086#1074#1099#1093' '#1082#1072#1088#1090
      OnClick = okcnclfrm1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 260
      Top = 6
    end
  end
  object srcCardSerial: TDataSource
    AutoEdit = False
    DataSet = dsCardSerial
    Left = 304
    Top = 48
  end
  object dsCardSerial: TpFIBDataSet
    DeleteSQL.Strings = (
      ''
      '    ')
    RefreshSQL.Strings = (
      ''
      '')
    SelectSQL.Strings = (
      'SELECT '
      '    Cs.Cs_Id,'
      '    Cs.Cs_Serial,'
      '    Cs.Cs_Notice,'
      '    Ps.Paysource_Descr'
      'FROM Cards_Serials Cs'
      
        '   LEFT OUTER JOIN Paysource Ps ON (Cs.Cs_Source_Id = Ps.Paysour' +
        'ce_Id)'
      'order by Cs.Cs_Serial'
      '')
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 264
    Top = 48
  end
end
