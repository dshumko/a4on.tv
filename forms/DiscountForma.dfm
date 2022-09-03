object DiscountForm: TDiscountForm
  Left = 410
  Top = 289
  BorderIcons = [biSystemMenu]
  Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
  ClientHeight = 271
  ClientWidth = 515
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    515
    271)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 65
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
  end
  object Label3: TLabel
    Left = 8
    Top = 36
    Width = 83
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
  end
  object Label4: TLabel
    Left = 8
    Top = 93
    Width = 112
    Height = 13
    Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090' '#1089#1082#1080#1076#1086#1082' '
  end
  object Label5: TLabel
    Left = 8
    Top = 117
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object pnlSrvType: TPanel
    Left = 87
    Top = 59
    Width = 426
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    Caption = 'pnlSrvType'
    TabOrder = 3
    Visible = False
    DesignSize = (
      426
      25)
    object lbl1: TLabel
      Left = 1
      Top = 6
      Width = 50
      Height = 13
      Caption = #1042#1080#1076' '#1091#1089#1083#1091#1075
    end
    object lcbSrvType: TDBLookupComboboxEh
      Left = 56
      Top = 3
      Width = 366
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      EmptyDataInfo.Text = #1057#1082#1080#1076#1082#1072' '#1076#1083#1103' '#1042#1080#1076#1072' '#1091#1089#1083#1091#1075
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = srcSrvType
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
  end
  object mmoNotice: TDBMemoEh
    Left = 8
    Top = 135
    Width = 502
    Height = 100
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 6
    Visible = True
    WantReturns = True
  end
  object pnlService: TPanel
    Left = 96
    Top = 59
    Width = 414
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      414
      25)
    object Label1: TLabel
      Left = 5
      Top = 6
      Width = 35
      Height = 13
      Caption = #1059#1089#1083#1091#1075#1072
    end
    object luOnOffService: TDBLookupComboboxEh
      Left = 47
      Top = 3
      Width = 367
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.ListSource = srcService
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      EmptyDataInfo.Text = #1057#1082#1080#1076#1082#1072' '#1076#1083#1103' '#1091#1089#1083#1091#1075#1080
      EditButtons = <>
      KeyField = 'SERVICE_ID'
      ListField = 'NAME'
      ListSource = srcService
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
    end
  end
  object cbAll: TCheckBox
    Left = 8
    Top = 64
    Width = 73
    Height = 17
    Caption = #1042#1089#1077' '#1091#1089#1083#1091#1075#1080
    TabOrder = 2
    OnClick = cbAllClick
  end
  object deStart: TDBDateTimeEditEh
    Left = 144
    Top = 5
    Width = 366
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object deStop: TDBDateTimeEditEh
    Left = 144
    Top = 33
    Width = 366
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object ednDiscountValue: TDBNumberEditEh
    Left = 144
    Top = 90
    Width = 366
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DecimalPlaces = 4
    DynProps = <>
    EmptyDataInfo.Text = #1050#1086#1101#1092#1092#1080#1094#1077#1085#1090
    EditButton.Visible = True
    EditButtons = <>
    ShowHint = True
    TabOrder = 5
    Visible = True
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 241
    Width = 420
    Height = 24
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    NumGlyphs = 2
    TabOrder = 7
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 435
    Top = 241
    Width = 75
    Height = 24
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 8
  end
  object srcService: TDataSource
    DataSet = dsluService
    Left = 264
    Top = 144
  end
  object dsluService: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    s.Name || coalesce('#39' / '#39' ||(select'
      
        '                                    iif((coalesce(t.Tarif_Sum, 0' +
        ') = coalesce(t.TARIF_SUM_JUR, 0)), coalesce(t.Tarif_Sum, 0), coa' +
        'lesce(t.Tarif_Sum, 0) || '#39'/'#39' || coalesce(t.TARIF_SUM_JUR, 0))'
      '                                  from tarif t'
      
        '                                  where t.Service_Id = s.Service' +
        '_Id'
      
        '                                        and current_date between' +
        ' t.Date_From and t.Date_To)'
      ''
      '    , '#39#39') Name'
      ''
      '  , s.SERVICE_ID'
      '  , s.DESCRIPTION'
      '  from SERVICES s'
      '  where SRV_TYPE_ID in (0, 1)'
      '  order by NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 208
    Top = 144
  end
  object cnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 96
    Top = 8
  end
  object dsSrvType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    *'
      '  from (select -1 as Id, '#39#1042#1089#1077#39' as Name from rdb$database'
      '        union'
      
        '        select o.O_Id, o.O_Name from objects o where o.O_Type = ' +
        '15)'
      '  order by id')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 200
    Top = 200
  end
  object srcSrvType: TDataSource
    DataSet = dsSrvType
    Left = 264
    Top = 192
  end
  object qDiscount: TpFIBQuery
    Transaction = trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'SELECT f.*'
      'FROM DISCOUNT_FACTOR f'
      'where f.DISCOUNT_ID = :DISCOUNT_ID'
      '')
    Left = 32
    Top = 152
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 96
    Top = 150
  end
  object trReadQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 32
    Top = 200
  end
  object trWriteQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 140
    Top = 150
  end
  object PropStorageEh: TPropStorageEh
    Section = 'SETTINGS'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 112
    Top = 96
  end
end
