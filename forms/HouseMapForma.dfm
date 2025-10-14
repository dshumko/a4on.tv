object HouseMapForm: THouseMapForm
  Left = 0
  Top = 0
  Caption = #1050#1072#1088#1090#1072' '#1076#1086#1084#1072
  ClientHeight = 475
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSettings: TPanel
    Left = 0
    Top = 0
    Width = 622
    Height = 27
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object lbl1: TLabel
      Left = 14
      Top = 6
      Width = 74
      Height = 13
      Caption = #1050#1074#1072#1088#1090#1080#1088' '#1074' '#1088#1103#1076
    end
    object btnBuild: TButton
      Left = 127
      Top = 3
      Width = 75
      Height = 21
      Caption = #1055#1086#1089#1090#1086#1088#1080#1090#1100
      TabOrder = 1
      OnClick = btnBuildClick
    end
    object edtFC: TDBNumberEditEh
      Left = 94
      Top = 3
      Width = 27
      Height = 21
      DecimalPlaces = 0
      DynProps = <>
      EditButton.Visible = True
      EditButtons = <>
      ShowHint = True
      TabOrder = 0
      Value = 2.000000000000000000
      Visible = True
    end
  end
  object pnlMap: TScrollBox
    Left = 0
    Top = 27
    Width = 622
    Height = 448
    Align = alClient
    TabOrder = 1
  end
  object dsHouse: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '    h.house_no,'
      '    h.q_flat,'
      '    h.notice,'
      '    s.street_code,'
      '    s.street_short,'
      
        '    (select count(hp.porch_n) from  houseporch hp where (h.house' +
        '_id = hp.house_id)) as porch_count,'
      '    coalesce(h.map_flats,2) map_flats,'
      '    coalesce(h.map_width,640) map_width,'
      '    coalesce(h.map_height,480) map_height'
      'from house h'
      '   inner join street s on (h.street_id = s.street_id)'
      'where h.house_id = :house_id')
    AutoUpdateOptions.UpdateTableName = 'HOUSE'
    AutoUpdateOptions.KeyFields = 'HOUSE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 344
    Top = 16
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object dsPORCH: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '    p.porch_id,'
      '    p.porch_n,'
      '    f.flats,'
      '    f.notice,'
      '    p.garret,'
      '    p.cellar,'
      '    p.notice,'
      '    f.floor_id,'
      '    f.floor_n,'
      '    f.notice as floor_notice'
      'from houseporch p'
      '   inner join housefloor f on (p.porch_id = f.porch_id)'
      'where p.house_id = :house_id'
      'order by p.porch_n, f.floor_n')
    AutoUpdateOptions.UpdateTableName = 'HOUSE'
    AutoUpdateOptions.KeyFields = 'HOUSE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 344
    Top = 70
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object dsCustomers: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '    c.CUSTOMER_ID, '
      '    c.account_no,'
      '    c.dogovor_no,'
      '    c.surname,'
      '    c.initials,'
      '    c.flat_no,'
      '    c.debt_sum,'
      '    c.notice,'
      '    c.phone_no,'
      '    c.mobile_phone,'
      '    c.cust_state_descr,'
      '    c.cust_state'
      'from customer c'
      'where c.house_id = :house_id')
    AutoUpdateOptions.UpdateTableName = 'HOUSE'
    AutoUpdateOptions.KeyFields = 'HOUSE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 346
    Top = 129
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
end
