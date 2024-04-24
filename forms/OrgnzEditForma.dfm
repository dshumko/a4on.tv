object OrgnzEditForm: TOrgnzEditForm
  Left = 0
  Top = 0
  Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
  ClientHeight = 426
  ClientWidth = 581
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    581
    426)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 58
    Width = 50
    Height = 13
    Anchors = [akLeft]
    Caption = #1044#1080#1088#1077#1082#1090#1086#1088
  end
  object lbl2: TLabel
    Left = 8
    Top = 82
    Width = 53
    Height = 13
    Anchors = [akLeft]
    Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088
  end
  object lbl3: TLabel
    Left = 8
    Top = 106
    Width = 53
    Height = 13
    Anchors = [akLeft]
    Caption = #1070#1088'. '#1072#1076#1088#1077#1089
  end
  object lbl4: TLabel
    Left = 8
    Top = 178
    Width = 24
    Height = 13
    Anchors = [akLeft]
    Caption = #1041#1072#1085#1082
  end
  object lbl5: TLabel
    Left = 8
    Top = 250
    Width = 52
    Height = 13
    Anchors = [akLeft]
    Caption = #1048#1053#1053' / '#1059#1053#1053
  end
  object lbl6: TLabel
    Left = 8
    Top = 202
    Width = 35
    Height = 13
    Anchors = [akLeft]
    Caption = #1056'/'#1057#1095#1077#1090
  end
  object lbl7: TLabel
    Left = 8
    Top = 226
    Width = 78
    Height = 13
    Anchors = [akLeft]
    Caption = #1050#1086#1076' '#1073#1072#1085#1082' ('#1041#1048#1050')'
  end
  object lbl8: TLabel
    Left = 8
    Top = 34
    Width = 43
    Height = 13
    Anchors = [akLeft]
    Caption = #1044#1086#1075#1086#1074#1086#1088
  end
  object lbl9: TLabel
    Left = 255
    Top = 34
    Width = 26
    Height = 13
    Anchors = [akRight]
    Caption = #1044#1072#1090#1072
  end
  object lbl10: TLabel
    Left = 384
    Top = 34
    Width = 59
    Height = 13
    Anchors = [akRight]
    Caption = #1044#1086#1075#1086#1074#1086#1088' '#1076#1086
  end
  object lbl11: TLabel
    Left = 8
    Top = 10
    Width = 73
    Height = 13
    Anchors = [akLeft]
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object lbl12: TLabel
    Left = 8
    Top = 154
    Width = 84
    Height = 13
    Anchors = [akLeft]
    Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1072#1076#1088#1077#1089
  end
  object lbl13: TLabel
    Left = 423
    Top = 11
    Width = 20
    Height = 13
    Anchors = [akRight]
    Caption = #1050#1086#1076
  end
  object lbl14: TLabel
    Left = 8
    Top = 130
    Width = 44
    Height = 13
    Anchors = [akLeft]
    Caption = #1058#1077#1083#1077#1092#1086#1085
  end
  object lbl15: TLabel
    Left = 336
    Top = 131
    Width = 24
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Email'
  end
  object lbl16: TLabel
    Left = 423
    Top = 250
    Width = 22
    Height = 13
    Anchors = [akRight]
    Caption = #1053#1044#1057
  end
  inline frmOk: TOkCancelFrame
    Left = 0
    Top = 391
    Width = 581
    Height = 35
    Align = alBottom
    TabOrder = 17
    TabStop = True
    ExplicitTop = 391
    ExplicitWidth = 581
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 94
      Top = 6
      Width = 394
      Anchors = [akLeft, akRight]
      Enabled = False
      ExplicitLeft = 94
      ExplicitTop = 6
      ExplicitWidth = 394
    end
    inherited bbCancel: TBitBtn
      Left = 496
      Top = 6
      Anchors = [akRight]
      ExplicitLeft = 496
      ExplicitTop = 6
    end
  end
  object cbbVATG: TDBLookupComboboxEh
    Left = 448
    Top = 247
    Width = 123
    Height = 21
    Anchors = [akRight]
    DynProps = <>
    DataField = 'VATG_ID'
    DataSource = srcDataSource
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcVATG
    ShowHint = True
    TabOrder = 15
    Visible = True
    OnExit = cbbVATGExit
  end
  object edContr: TDBEditEh
    Left = 94
    Top = 31
    Width = 150
    Height = 21
    Anchors = [akLeft, akRight]
    DataField = 'ORG_CONTRACT'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = True
  end
  object edName: TDBEditEh
    Left = 94
    Top = 7
    Width = 324
    Height = 21
    Anchors = [akLeft, akRight]
    DataField = 'ORG_NAME'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnExit = cbbVATGExit
  end
  object edDir: TDBEditEh
    Left = 94
    Top = 55
    Width = 477
    Height = 21
    Anchors = [akLeft, akRight]
    DataField = 'DIRECTOR'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 5
    Visible = True
  end
  object edBuh: TDBEditEh
    Left = 94
    Top = 79
    Width = 477
    Height = 21
    Anchors = [akLeft, akRight]
    DataField = 'BUHGALTER'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 6
    Visible = True
  end
  object edAdres: TDBEditEh
    Left = 94
    Top = 103
    Width = 477
    Height = 21
    Anchors = [akLeft, akRight]
    DataField = 'ADRES'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 7
    Visible = True
  end
  object edPAdres: TDBEditEh
    Left = 94
    Top = 151
    Width = 477
    Height = 21
    Anchors = [akLeft, akRight]
    DataField = 'POST_ADRES'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 10
    Visible = True
  end
  object edPhone: TDBEditEh
    Left = 94
    Top = 127
    Width = 236
    Height = 21
    Anchors = [akLeft, akRight]
    DataField = 'PHONE'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 8
    Visible = True
  end
  object edRS: TDBEditEh
    Left = 94
    Top = 199
    Width = 477
    Height = 21
    Anchors = [akLeft, akRight]
    DataField = 'ORG_ACCOUNT'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 12
    Visible = True
  end
  object edUNN: TDBEditEh
    Left = 94
    Top = 247
    Width = 324
    Height = 21
    Anchors = [akLeft, akRight]
    DataField = 'ORG_UNN'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 14
    Visible = True
  end
  object edCode: TDBEditEh
    Left = 450
    Top = 7
    Width = 121
    Height = 21
    Anchors = [akRight]
    DataField = 'ORG_CODE'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object edtCD: TDBDateTimeEditEh
    Left = 294
    Top = 31
    Width = 84
    Height = 21
    Anchors = [akRight]
    DataField = 'CONTRACT_DATE'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 3
    Visible = True
  end
  object edtCDD: TDBDateTimeEditEh
    Left = 450
    Top = 31
    Width = 121
    Height = 21
    Anchors = [akRight]
    DataField = 'CONTRACT_DATE_TO'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 4
    Visible = True
  end
  object cbbBank: TDBLookupComboboxEh
    Left = 94
    Top = 175
    Width = 477
    Height = 21
    Anchors = [akLeft, akRight]
    DynProps = <>
    DataField = 'ORG_BANK'
    DataSource = srcDataSource
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcBanks
    ShowHint = True
    TabOrder = 11
    Visible = True
  end
  object edEmail: TDBEditEh
    Left = 366
    Top = 127
    Width = 205
    Height = 21
    Anchors = [akTop, akRight]
    DataField = 'EMAIL'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 9
    Visible = True
  end
  object edBcode: TDBEditEh
    Left = 94
    Top = 223
    Width = 477
    Height = 21
    Anchors = [akLeft, akRight]
    DataField = 'CODE'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 13
    Visible = True
  end
  object dbmNotice: TDBMemoEh
    Left = 8
    Top = 272
    Width = 563
    Height = 114
    ScrollBars = ssHorizontal
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 16
    Visible = True
    WantReturns = True
  end
  object dsOrgan: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE ORGANIZATION'
      'SET '
      '    ORG_NAME = :ORG_NAME,'
      '    DIRECTOR = :DIRECTOR,'
      '    BUHGALTER = :BUHGALTER,'
      '    ADRES = :ADRES,'
      '    PHONE = :PHONE,'
      '    EMAIL = :EMAIL,'
      '    NOTICE = :NOTICE,'
      '    ORG_BANK = :ORG_BANK,'
      '    ORG_ACCOUNT = :ORG_ACCOUNT,'
      '    ORG_UNN = :ORG_UNN,'
      '    ORG_CODE = :ORG_CODE,'
      '    ORG_CONTRACT = :ORG_CONTRACT,'
      '    VATG_ID = :VATG_ID,'
      '    CONTRACT_DATE = :CONTRACT_DATE,'
      '    POST_ADRES = :POST_ADRES,'
      '    CONTRACT_DATE_TO = :CONTRACT_DATE_TO,'
      '    CODE = :CODE'
      'WHERE'
      '    ORG_ID = :OLD_ORG_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    ORGANIZATION'
      'WHERE'
      '        ORG_ID = :OLD_ORG_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO ORGANIZATION('
      '    ORG_NAME,'
      '    DIRECTOR,'
      '    BUHGALTER,'
      '    ADRES,'
      '    PHONE,'
      '    EMAIL,'
      '    NOTICE,'
      '    ORG_BANK,'
      '    ORG_ACCOUNT,'
      '    ORG_UNN,'
      '    ORG_CODE,'
      '    ORG_CONTRACT,'
      '    VATG_ID,'
      '    CONTRACT_DATE,'
      '    POST_ADRES,'
      '    CONTRACT_DATE_TO,'
      '    CODE'
      ')'
      'VALUES('
      '    :ORG_NAME,'
      '    :DIRECTOR,'
      '    :BUHGALTER,'
      '    :ADRES,'
      '    :PHONE,'
      '    :EMAIL,'
      '    :NOTICE,'
      '    :ORG_BANK,'
      '    :ORG_ACCOUNT,'
      '    :ORG_UNN,'
      '    :ORG_CODE,'
      '    :ORG_CONTRACT,'
      '    :VATG_ID,'
      '    :CONTRACT_DATE,'
      '    :POST_ADRES,'
      '    :CONTRACT_DATE_TO,'
      '    :CODE'
      ')')
    RefreshSQL.Strings = (
      'select *'
      'from ORGANIZATION'
      'where(  org_id = :ORG_ID'
      '     ) and (     ORGANIZATION.ORG_ID = :OLD_ORG_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select *'
      'from ORGANIZATION'
      'where org_id = :ORG_ID')
    AutoUpdateOptions.UpdateTableName = 'ORGANIZATION'
    AutoUpdateOptions.KeyFields = 'ORG_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 142
    Top = 104
  end
  object srcDataSource: TDataSource
    AutoEdit = False
    DataSet = dsOrgan
    Left = 222
    Top = 77
  end
  object dsVATG: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SUBAREA'
      'SET '
      '    AREA_ID = :AREA_ID,'
      '    SUBAREA_ID = :SUBAREA_ID,'
      '    SUBAREA_NAME = :SUBAREA_NAME'
      'WHERE'
      '    SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SUBAREA'
      'WHERE'
      '        SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SUBAREA('
      '    AREA_ID,'
      '    SUBAREA_ID,'
      '    SUBAREA_NAME'
      ')'
      'VALUES('
      '    :AREA_ID,'
      '    :SUBAREA_ID,'
      '    :SUBAREA_NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM SUBAREA'
      'where(  area_ID = :AREA_ID'
      'and subarea_id <> 0'
      '     ) and (     SUBAREA.SUBAREA_ID = :OLD_SUBAREA_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select o.o_name, o.O_id'
      'from objects o'
      
        'where o.O_TYPE = 13 and ((o.O_Deleted = 0) or (o.O_Id = :VATG_ID' +
        '))'
      'order by o.o_name')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 78
    Top = 272
  end
  object srcVATG: TDataSource
    DataSet = dsVATG
    Left = 89
    Top = 284
  end
  object dsBANKS: TpFIBDataSet
    SelectSQL.Strings = (
      'select o.o_id, o.o_name'
      'from objects o'
      'where o.o_type = 11'
      'order by o.o_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 441
    Top = 178
  end
  object srcBanks: TDataSource
    AutoEdit = False
    DataSet = dsBANKS
    Left = 440
    Top = 131
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 24
    Top = 312
  end
end
