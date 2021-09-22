object IPPacketForm: TIPPacketForm
  ShowHint = True
  Left = 0
  Top = 0
  ActiveControl = cbbPaket
  Caption = #1059#1089#1083#1091#1075#1072' '#1076#1083#1103' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
  ClientHeight = 202
  ClientWidth = 360
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
  DesignSize = (
    360
    202)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 11
    Width = 35
    Height = 13
    Caption = #1059#1089#1083#1091#1075#1072
  end
  object lbl2: TLabel
    Left = 8
    Top = 37
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object cbbPaket: TDBLookupComboboxEh
    Left = 45
    Top = 8
    Width = 307
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'service_id'
    DataSource = srcIPPacket
    DropDownBox.Columns = <
      item
        FieldName = 'NAME'
        Width = 60
      end
      item
        FieldName = 'DESCRIPTION'
        Width = 70
      end>
    DropDownBox.ListSource = srcPacket
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'SERVICE_ID'
    ListField = 'NAME'
    ListSource = srcPacket
    TabOrder = 0
    Visible = True
  end
  object dbmmoNotice: TDBMemoEh
    Left = 8
    Top = 56
    Width = 343
    Height = 99
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'notice'
    DataSource = srcIPPacket
    DynProps = <>
    EditButtons = <>
    TabOrder = 1
    Visible = True
    WantReturns = True
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 161
    Width = 261
    Height = 33
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 2
  end
  object btnCancel: TBitBtn
    Left = 276
    Top = 161
    Width = 75
    Height = 33
    Anchors = [akLeft, akTop, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
  object srcIPPacket: TDataSource
    DataSet = dsIPPacket
    Left = 268
    Top = 116
  end
  object srcPacket: TDataSource
    DataSet = dsPacket
    Left = 51
    Top = 81
  end
  object dsPacket: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    s.service_id,'
      '    s.name,'
      '    s.description'
      '  from SUBSCR_SERV SS'
      '       inner join SERVICES S on (SS.SERV_ID = S.SERVICE_ID)'
      '       inner join CUSTOMER C on (SS.CUSTOMER_ID = C.CUSTOMER_ID)'
      '       inner join TV_LAN D on (D.CUSTOMER_ID = C.CUSTOMER_ID)'
      '  where d.lan_id = :LAN_ID'
      '        and not exists(select'
      '                           p.service_id'
      '                         from tv_lan_packets p'
      '                         where p.lan_id = d.lan_id'
      '                               and p.service_id = s.service_id)'
      '  order by s.name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 113
    Top = 79
  end
  object dsIPPacket: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TV_LAN_PACKETS'
      'SET '
      '    LAN_ID = :LAN_ID,'
      '    SERVICE_ID = :SERVICE_ID,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    LAN_ID = :OLD_LAN_ID'
      '    and SERVICE_ID = :OLD_SERVICE_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TV_LAN_PACKETS'
      'WHERE'
      '        LAN_ID = :OLD_LAN_ID'
      '    and SERVICE_ID = :OLD_SERVICE_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TV_LAN_PACKETS('
      '    LAN_ID,'
      '    SERVICE_ID,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :LAN_ID,'
      '    :SERVICE_ID,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select * from tv_lan_packets d'
      'where(  d.lan_id = :lan_id'
      '     ) and (     D.LAN_ID = :OLD_LAN_ID'
      '    and D.SERVICE_ID = :OLD_SERVICE_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select * from tv_lan_packets d'
      'where d.lan_id = :lan_id')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 223
    Top = 78
  end
end
