object CancelContractForm: TCancelContractForm
  Left = 304
  Top = 179
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1072#1079#1086#1088#1074#1072#1090#1100' '#1076#1086#1075#1086#1074#1086#1088' '#1089' '#1072#1073#1086#1085#1077#1085#1090#1086#1084
  ClientHeight = 151
  ClientWidth = 354
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 43
    Width = 72
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1072#1079#1088#1099#1074#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 75
    Width = 101
    Height = 13
    Caption = #1059#1089#1083#1091#1075#1072' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1103
  end
  object label3: TLabel
    Left = 8
    Top = 11
    Width = 50
    Height = 13
    Caption = #1040#1073#1086#1085#1077#1085#1090': '
  end
  object ABONENT: TLabel
    Left = 114
    Top = 11
    Width = 47
    Height = 13
    Caption = 'ABONENT'
  end
  object Panel1: TPanel
    Left = 0
    Top = 114
    Width = 354
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object bbOk: TBitBtn
      Left = 114
      Top = 1
      Width = 155
      Height = 25
      Caption = #1056#1072#1079#1086#1088#1074#1072#1090#1100
      Default = True
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = bbOkClick
    end
    object bbCancel: TBitBtn
      Left = 273
      Top = 1
      Width = 75
      Height = 25
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ServiceOff: TDBLookupComboboxEh
    Left = 114
    Top = 72
    Width = 234
    Height = 21
    DynProps = <>
    DataField = ''
    EditButtons = <>
    KeyField = 'SERVICE_ID'
    ListField = 'NAME'
    ListSource = srcServiceOff
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object CancelDate: TDBDateTimeEditEh
    Left = 114
    Top = 40
    Width = 234
    Height = 21
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnExit = CancelDateExit
    EditFormat = 'DD/MM/YY'
  end
  object srcServiceOff: TDataSource
    DataSet = dsServiceOff
    Left = 40
    Top = 88
  end
  object dsServiceOff: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT distinct s.SERVICE_ID, s.NAME, s.DESCRIPTION'
      
        'FROM SERVICES s INNER JOIN SERVICES_LINKS sl ON (S.SERVICE_ID = ' +
        'SL.CHILD)'
      'where ((sl.LINK_TYPE = 4) or (sl.LINK_TYPE = 5))'
      'order by s.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 48
    Top = 96
  end
end
