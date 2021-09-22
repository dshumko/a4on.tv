object ChangeOffForm: TChangeOffForm
  ShowHint = True
  Left = 304
  Top = 179
  BorderIcons = [biSystemMenu]
  Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1082#1072#1082' '
  ClientHeight = 125
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    344
    125)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 7
    Top = 17
    Width = 101
    Height = 13
    Caption = #1059#1089#1083#1091#1075#1072' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1103
  end
  object Panel1: TPanel
    Left = 0
    Top = 88
    Width = 344
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      344
      37)
    object bbOk: TBitBtn
      Left = 112
      Top = 7
      Width = 145
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1057#1084#1077#1085#1080#1090#1100
      Default = True
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = bbOkClick
    end
    object bbCancel: TBitBtn
      Left = 263
      Top = 7
      Width = 73
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ServiceOff: TDBLookupComboboxEh
    Left = 112
    Top = 16
    Width = 224
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    EditButtons = <>
    KeyField = 'SERVICE_ID'
    ListField = 'NAME'
    ListSource = srcServiceOff
    TabOrder = 0
    Visible = True
    OnChange = ServiceOffChange
  end
  object pnlQUANT: TPanel
    Left = 0
    Top = 41
    Width = 344
    Height = 47
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    DesignSize = (
      344
      47)
    object Label5: TLabel
      Left = 7
      Top = 11
      Width = 75
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' ('#1089#1091#1084#1084#1072')'
    end
    object lblDimension: TDBText
      Left = 263
      Top = 11
      Width = 73
      Height = 17
      Anchors = [akTop, akRight]
      DataField = 'DIMENSION'
      DataSource = srcServiceOff
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object eUNITS: TDBNumberEditEh
      Left = 112
      Top = 8
      Width = 145
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButton.Visible = True
      EditButtons = <>
      TabOrder = 0
      Value = 0.000000000000000000
      Visible = True
    end
  end
  object srcServiceOff: TDataSource
    DataSet = dsServiceOff
    Left = 16
    Top = 80
  end
  object dsServiceOff: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct'
      '    s.SERVICE_ID, s.Srv_Type_Id, s.Name || coalesce('#39' / '#39' ||'
      '    case s.Srv_Type_Id'
      '      when 2 then null'
      '      else (select'
      
        '                iif((coalesce(t.Tarif_Sum, 0) = coalesce(t.TARIF' +
        '_SUM_JUR, 0)), coalesce(t.Tarif_Sum, 0), coalesce(t.Tarif_Sum, 0' +
        ') || '#39'/'#39' || coalesce(t.TARIF_SUM_JUR, 0))'
      '              from tarif t'
      '              where t.Service_Id = s.Service_Id'
      
        '                    and current_date between t.Date_From and t.D' +
        'ate_To)'
      ''
      '    end, '#39#39') Name, s.DESCRIPTION, s.Dimension'
      '  from SERVICES s'
      '       inner join SERVICES_LINKS sl on (S.SERVICE_ID = SL.CHILD)'
      '  where sl.LINK_TYPE in (4,5) -- '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1077
      '        and sl.Parent = :SRV'
      '  order by s.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 64
    Top = 80
  end
end
