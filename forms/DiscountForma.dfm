object DiscountForm: TDiscountForm
  Left = 410
  Top = 289
  BorderIcons = [biSystemMenu]
  Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
  ClientHeight = 277
  ClientWidth = 406
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    406
    277)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 6
    Top = 11
    Width = 65
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
  end
  object Label3: TLabel
    Left = 6
    Top = 38
    Width = 83
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
  end
  object Label4: TLabel
    Left = 6
    Top = 120
    Width = 70
    Height = 13
    Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
  end
  object pnlSrvType: TPanel
    Left = 48
    Top = 88
    Width = 356
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    Caption = 'pnlSrvType'
    TabOrder = 4
    Visible = False
    DesignSize = (
      356
      25)
    object lbl1: TLabel
      Left = 1
      Top = 6
      Width = 50
      Height = 13
      Caption = #1042#1080#1076' '#1091#1089#1083#1091#1075
    end
    object lcbSrvType: TDBLookupComboboxEh
      Left = 55
      Top = 2
      Width = 298
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.Sizable = True
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
    Left = 6
    Top = 144
    Width = 395
    Height = 97
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 7
    Visible = True
    WantReturns = True
  end
  object cbAll: TCheckBox
    Left = 103
    Top = 66
    Width = 73
    Height = 17
    Caption = #1042#1089#1077' '#1091#1089#1083#1091#1075#1080
    TabOrder = 3
    OnClick = cbAllClick
  end
  object deStart: TDBDateTimeEditEh
    Left = 103
    Top = 8
    Width = 122
    Height = 21
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnChange = deStartChange
  end
  object deStop: TDBDateTimeEditEh
    Left = 103
    Top = 35
    Width = 122
    Height = 21
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1044#1072#1090#1072' '#1086#1082#1086#1085#1095#1072#1085#1080#1103
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 2
    Visible = True
  end
  object ednDiscountValue: TDBNumberEditEh
    Left = 103
    Top = 117
    Width = 298
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DecimalPlaces = 4
    DynProps = <>
    EmptyDataInfo.Text = #1050#1086#1101#1092#1092#1080#1094#1077#1085#1090
    EditButton.Visible = True
    EditButtons = <>
    ShowHint = True
    TabOrder = 6
    Visible = True
  end
  object btnOk: TBitBtn
    Left = 6
    Top = 247
    Width = 313
    Height = 27
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    NumGlyphs = 2
    TabOrder = 8
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 326
    Top = 247
    Width = 75
    Height = 27
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 9
  end
  object pnlPromo: TPanel
    Left = 231
    Top = 5
    Width = 171
    Height = 60
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    DesignSize = (
      171
      60)
    object lcbPromo: TDBLookupComboboxEh
      Left = 2
      Top = 3
      Width = 168
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.Columns = <
        item
          FieldName = 'O_NAME'
        end
        item
          FieldName = 'O_DESCRIPTION'
        end>
      DropDownBox.ListSource = srcPromo
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1040#1082#1094#1080#1103
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcPromo
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = lcbPromoChange
    end
    object btnPromo: TButton
      Left = 2
      Top = 30
      Width = 168
      Height = 21
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1076#1072#1090#1100' '#1072#1082#1094#1080#1102
      TabOrder = 1
      OnClick = btnPromoClick
    end
  end
  object pnlService: TPanel
    Left = 56
    Top = 88
    Width = 345
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      345
      25)
    object Label1: TLabel
      Left = 7
      Top = 6
      Width = 35
      Height = 13
      Caption = #1059#1089#1083#1091#1075#1072
    end
    object luOnOffService: TDBLookupComboboxEh
      Left = 47
      Top = 3
      Width = 298
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.ListSource = srcService
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1057#1082#1080#1076#1082#1072' '#1076#1083#1103' '#1091#1089#1083#1091#1075#1080
      EditButtons = <>
      KeyField = 'SERVICE_ID'
      ListField = 'NAME'
      ListSource = srcService
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnDropDownBoxGetCellParams = luOnOffServiceDropDownBoxGetCellParams
    end
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
      '  , s.SERVICE_ID'
      '  , s.DESCRIPTION'
      '  , iif(exists(select'
      '                   ss.Subscr_Serv_Id'
      '                 from Subscr_Serv ss'
      '                 where ss.Serv_Id = s.Service_Id'
      
        '                       and ss.Customer_Id = :CUSTOMER_ID), 1, 0)' +
        ' SRV_EXISTS'
      '  from SERVICES s'
      '  where s.SRV_TYPE_ID in ('
      '                          0, 1'
      '                         )'
      '  order by NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 208
    Top = 144
  end
  object cnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 344
    Top = 192
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
    Left = 176
    Top = 192
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
    Left = 328
    Top = 144
  end
  object dsPromo: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_CHARFIELD'
      '  , O_DESCRIPTION'
      '  from OBJECTS'
      '  where O_TYPE = 70'
      '    and O_DELETED = 0  '
      '    and :pdate between O_DATEFIELD and O_DATEEND'
      'order by O_DATEFIELD')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 264
    Top = 48
  end
  object srcPromo: TDataSource
    DataSet = dsPromo
    Left = 320
    Top = 48
  end
end
