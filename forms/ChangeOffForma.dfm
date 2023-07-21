object ChangeOffForm: TChangeOffForm
  Left = 304
  Top = 179
  BorderIcons = [biSystemMenu]
  Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1082#1072#1082' '
  ClientHeight = 174
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 137
    Width = 336
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 88
    ExplicitWidth = 344
    DesignSize = (
      336
      37)
    object bbOk: TBitBtn
      Left = 112
      Top = 7
      Width = 137
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1057#1084#1077#1085#1080#1090#1100
      Default = True
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = bbOkClick
      ExplicitWidth = 145
    end
    object bbCancel: TBitBtn
      Left = 255
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object pnlQUANT: TPanel
    Left = 0
    Top = 41
    Width = 336
    Height = 36
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    ExplicitWidth = 356
    DesignSize = (
      336
      36)
    object Label5: TLabel
      Left = 7
      Top = 11
      Width = 75
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' ('#1089#1091#1084#1084#1072')'
    end
    object lblDimension: TDBText
      Left = 255
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
      ExplicitLeft = 263
    end
    object eUNITS: TDBNumberEditEh
      Left = 112
      Top = 8
      Width = 137
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButton.Visible = True
      EditButtons = <>
      ShowHint = True
      TabOrder = 0
      Value = 0.000000000000000000
      Visible = True
      ExplicitWidth = 145
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 336
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 6
    DesignSize = (
      336
      41)
    object Label1: TLabel
      Left = 5
      Top = 19
      Width = 101
      Height = 13
      Caption = #1059#1089#1083#1091#1075#1072' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1103
    end
    object ServiceOff: TDBLookupComboboxEh
      Left = 112
      Top = 16
      Width = 218
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      EditButtons = <>
      KeyField = 'SERVICE_ID'
      ListField = 'NAME'
      ListSource = srcServiceOff
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = ServiceOffChange
    end
  end
  object pnlMmo: TPanel
    Left = 0
    Top = 77
    Width = 336
    Height = 60
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitLeft = 40
    ExplicitTop = 88
    ExplicitWidth = 185
    ExplicitHeight = 41
    DesignSize = (
      336
      60)
    object mmoNotice: TDBMemoEh
      Left = 5
      Top = 0
      Width = 325
      Height = 60
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1082' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1102
      ShowHint = True
      TabOrder = 0
      Visible = True
      WantReturns = True
    end
  end
  object srcServiceOff: TDataSource
    DataSet = dsServiceOff
    Left = 16
    Top = 8
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
    Top = 8
  end
end
