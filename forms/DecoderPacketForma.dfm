object DecoderPacketForm: TDecoderPacketForm
  ShowHint = True
  Left = 0
  Top = 0
  ActiveControl = cbbPaket
  Caption = #1059#1089#1083#1091#1075#1080' '#1076#1083#1103' '#1082#1072#1088#1090#1086#1095#1082#1080
  ClientHeight = 172
  ClientWidth = 467
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
    467
    172)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 8
    Top = 11
    Width = 79
    Height = 13
    Caption = #1055#1077#1088#1080#1086#1076'. '#1091#1089#1083#1091#1075#1072
  end
  object lbl2: TLabel
    Left = 8
    Top = 37
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object cbbPaket: TDBLookupComboboxEh
    Left = 93
    Top = 8
    Width = 366
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'service_id'
    DataSource = srcDecPacket
    DropDownBox.Columns = <
      item
        FieldName = 'name'
        Width = 60
      end
      item
        FieldName = 'description'
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
    Width = 450
    Height = 79
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'notice'
    DataSource = srcDecPacket
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1052#1086#1078#1077#1090#1077' '#1086#1089#1090#1072#1074#1080#1090#1100' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
    TabOrder = 1
    Visible = True
    WantReturns = True
  end
  object btnCancel: TBitBtn
    Left = 384
    Top = 141
    Width = 75
    Height = 26
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 141
    Width = 365
    Height = 26
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnOkClick
  end
  object srcDecPacket: TDataSource
    DataSet = dsDecPacket
    Left = 348
    Top = 68
  end
  object srcPacket: TDataSource
    DataSet = dsPacket
    Left = 67
    Top = 73
  end
  object dsPacket: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    s.service_id, s.name, s.description'
      '  from SUBSCR_SERV SS'
      '       inner join SERVICES S on (SS.SERV_ID = S.SERVICE_ID)'
      '       inner join CUSTOMER C on (SS.CUSTOMER_ID = C.CUSTOMER_ID)'
      
        '       inner join CUSTOMER_DECODERS D on (D.CUSTOMER_ID = C.CUST' +
        'OMER_ID)'
      '  where S.BUSINESS_TYPE = 2'
      '        and d.decoder_n = :decoder_n'
      '        and ('
      '             ('
      '              (coalesce(s.Only_One, 0) = 0)'
      '              and'
      
        '              (not exists(select p.service_id from decoder_packe' +
        'ts p where p.decoder_n = d.decoder_n and p.service_id = s.servic' +
        'e_id))'
      '              )'
      '            or'
      '             ('
      '              (coalesce(s.Only_One, 0) = 1)'
      '              and'
      '              (not exists(select p.service_id'
      
        '                          from decoder_packets p inner join CUST' +
        'OMER_DECODERS D1 on (D1.Decoder_N = p.Decoder_N)'
      
        '                          where p.service_id = s.service_id and ' +
        'd1.Customer_Id = c.Customer_Id))'
      '              )'
      '          )'
      '  order by s.name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 145
    Top = 71
  end
  object dsDecPacket: TpFIBDataSet
    UpdateSQL.Strings = (
      'update DECODER_PACKETS'
      'set SERVICE_ID = :SERVICE_ID, NOTICE = :NOTICE'
      'where (DECODER_N = :OLD_DECODER_N)'
      '      and (SERVICE_ID = :OLD_SERVICE_ID)   ')
    DeleteSQL.Strings = (
      'delete from DECODER_PACKETS'
      'where (DECODER_N = :OLD_DECODER_N)'
      '      and (SERVICE_ID = :OLD_SERVICE_ID) ')
    InsertSQL.Strings = (
      'insert into DECODER_PACKETS (DECODER_N, SERVICE_ID, NOTICE)'
      'values (:DECODER_N, :SERVICE_ID, :NOTICE)')
    SelectSQL.Strings = (
      'select * from decoder_packets d'
      'where d.decoder_n = :decoder_n')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 258
    Top = 67
  end
end
