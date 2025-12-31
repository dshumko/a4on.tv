object BillingForm: TBillingForm
  ShowHint = True
  Left = 0
  Top = 0
  Caption = 'Internet '#1073#1080#1083#1083#1080#1085#1075
  ClientHeight = 427
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tlb1: TToolBar
    Left = 0
    Top = 0
    Width = 720
    Height = 29
    Caption = 'tlb1'
    TabOrder = 0
    object btnBillingEdit: TToolButton
      Left = 0
      Top = 0
      Action = actBillingEdit
    end
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 29
    Width = 720
    Height = 398
    Align = alClient
    DataSource = srcBilling
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 1
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACCOUNT_NO'
        Footers = <>
        Title.Caption = #1051#1080#1094'. '#1089#1095#1077#1090
        Title.TitleButton = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'FIO'
        Footers = <>
        Title.Caption = #1060#1048#1054
        Title.TitleButton = True
        Width = 120
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'DEBT_SUM'
        Footers = <>
        Title.Caption = #1057#1072#1083#1100#1076#1086
        Title.TitleButton = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'LOGIN'
        Footers = <>
        Width = 107
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'IP_INET'
        Footers = <>
        Title.Caption = 'IP Internet'
        Title.TitleButton = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACCOUNT_HEX'
        Footers = <>
        Title.Caption = 'ACCOUNT ID'
        Title.TitleButton = True
        Width = 68
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACCOUNT_NAME'
        Footers = <>
        Title.Caption = 'ACCOUNT'
        Title.TitleButton = True
        Width = 147
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'UNIT_HEX'
        Footers = <>
        Title.Caption = 'UNIT ID'
        Title.TitleButton = True
        Width = 60
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'UNIT_NAME'
        Footers = <>
        Title.Caption = 'UNIT NAME'
        Title.TitleButton = True
        Width = 130
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'PLAN_NAME'
        Footers = <>
        Title.Caption = #1058#1072#1088#1080#1092
        Title.TitleButton = True
        Width = 139
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'BLOCKED'
        Footers = <>
        Title.Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1082#1072
        Title.TitleButton = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 288
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET'
        Footers = <>
        Title.Caption = #1059#1083#1080#1094#1072
        Title.TitleButton = True
        Width = 151
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_NO'
        Footers = <>
        Title.Caption = #1044#1086#1084
        Title.TitleButton = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLAT_NO'
        Footers = <>
        Title.Caption = #1050#1074'.'
        Title.TitleButton = True
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUST_STATE_DESCR'
        Footers = <>
        Title.Caption = #1057#1090#1072#1091#1089
        Title.TitleButton = True
        Width = 401
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object srcBilling: TDataSource
    AutoEdit = False
    DataSet = dsBilling
    Left = 56
    Top = 96
  end
  object dsBilling: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '    s.street_short||s.street_name as street,'
      '    h.house_no,'
      '    b.login,'
      '    b.ip_inet,'
      '    b.account_id,'
      '    b.account_name,'
      '    b.unit_id,'
      '    b.unit_name,'
      '    b.plan_id,'
      '    b.plan_name,'
      '    b.notice,'
      '    b.blocked,'
      '    c.account_no,'
      '    c.surname ||'#39' '#39' ||c.initials as FIO,'
      '    c.cust_state_descr,'
      '    c.flat_no,'
      '    c.debt_sum,'
      '    c.customer_id'
      'from billing b'
      '   inner join customer c on (b.customer_id = c.customer_id)'
      '   inner join house h on (c.house_id = h.house_id)'
      '   inner join street s on (h.street_id = s.street_id)')
    OnCalcFields = dsBillingCalcFields
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 112
    Top = 96
    object dsBillingHOUSE_NO: TFIBStringField
      FieldName = 'HOUSE_NO'
      Size = 10
      Transliterate = False
      EmptyStrToNull = True
    end
    object dsBillingLOGIN: TFIBStringField
      FieldName = 'LOGIN'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object dsBillingIP_INET: TFIBStringField
      FieldName = 'IP_INET'
      Size = 15
      Transliterate = False
      EmptyStrToNull = True
    end
    object dsBillingACCOUNT_ID: TFIBIntegerField
      FieldName = 'ACCOUNT_ID'
    end
    object dsBillingACCOUNT_NAME: TFIBStringField
      FieldName = 'ACCOUNT_NAME'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object dsBillingUNIT_ID: TFIBIntegerField
      FieldName = 'UNIT_ID'
    end
    object dsBillingUNIT_NAME: TFIBStringField
      FieldName = 'UNIT_NAME'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object dsBillingPLAN_ID: TFIBIntegerField
      FieldName = 'PLAN_ID'
    end
    object dsBillingPLAN_NAME: TFIBStringField
      FieldName = 'PLAN_NAME'
      Size = 50
      Transliterate = False
      EmptyStrToNull = True
    end
    object dsBillingNOTICE: TFIBStringField
      FieldName = 'NOTICE'
      Size = 255
      Transliterate = False
      EmptyStrToNull = True
    end
    object dsBillingBLOCKED: TFIBSmallIntField
      FieldName = 'BLOCKED'
    end
    object dsBillingACCOUNT_NO: TFIBStringField
      FieldName = 'ACCOUNT_NO'
      Size = 15
      Transliterate = False
      EmptyStrToNull = True
    end
    object dsBillingCUST_STATE_DESCR: TFIBStringField
      FieldName = 'CUST_STATE_DESCR'
      Size = 500
      Transliterate = False
      EmptyStrToNull = True
    end
    object dsBillingFLAT_NO: TFIBStringField
      FieldName = 'FLAT_NO'
      Size = 6
      Transliterate = False
      EmptyStrToNull = True
    end
    object dsBillingDEBT_SUM: TFIBBCDField
      FieldName = 'DEBT_SUM'
      Size = 2
    end
    object dsBillingACCOUNT_HEX: TStringField
      FieldKind = fkCalculated
      FieldName = 'ACCOUNT_HEX'
      Calculated = True
    end
    object dsBillingUNIT_HEX: TStringField
      FieldKind = fkCalculated
      FieldName = 'UNIT_HEX'
      Calculated = True
    end
    object dsBillingSTREET: TFIBStringField
      FieldName = 'STREET'
      Size = 55
      Transliterate = False
      EmptyStrToNull = True
    end
    object dsBillingFIO: TFIBStringField
      FieldName = 'FIO'
      Size = 35
      Transliterate = False
      EmptyStrToNull = True
    end
    object dsBillingCUSTOMER_ID: TFIBIntegerField
      FieldName = 'CUSTOMER_ID'
    end
  end
  object actlst1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 80
    Top = 176
    object actBillingEdit: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'/'#1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 17
      OnExecute = actBillingEditExecute
    end
  end
  object mdBilling: TRxMemoryData
    FieldDefs = <>
    Left = 96
    Top = 240
  end
end
