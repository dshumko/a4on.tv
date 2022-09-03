object ChanForSrcForm: TChanForSrcForm
  Left = 410
  Top = 243
  Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1082#1072#1085#1072#1083#1072
  ClientHeight = 401
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  DesignSize = (
    491
    401)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 37
    Width = 50
    Height = 13
    Caption = #1057#1090#1072#1085#1076#1072#1088#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 232
    Top = 116
    Width = 48
    Height = 13
    Caption = #1057#1082#1086#1088#1086#1089#1090#1100
  end
  object Label3: TLabel
    Left = 8
    Top = 116
    Width = 42
    Height = 13
    Caption = #1063#1072#1089#1090#1086#1090#1072
  end
  object lblChan: TLabel
    Left = 8
    Top = 11
    Width = 31
    Height = 13
    Caption = #1050#1072#1085#1072#1083
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 8
    Top = 63
    Width = 56
    Height = 13
    Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblVideo: TLabel
    Left = 8
    Top = 89
    Width = 32
    Height = 13
    Caption = #1050#1086#1076#1077#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 8
    Top = 142
    Width = 49
    Height = 13
    Caption = 'IP '#1087#1086#1090#1086#1082#1072
  end
  object lbl4: TLabel
    Left = 8
    Top = 168
    Width = 49
    Height = 13
    Caption = #1050#1072#1088#1090#1086#1095#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 366
    Width = 491
    Height = 35
    Align = alBottom
    TabOrder = 13
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 272
      Top = 7
      Width = 128
      Height = 24
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 409
      Top = 7
      Width = 74
      Height = 24
    end
  end
  object cbbSYSTEM: TDBLookupComboboxEh
    Left = 70
    Top = 34
    Width = 413
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'Cs_System'
    DataSource = srcChForSrc
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1057#1090#1072#1085#1076#1072#1088#1090#1099' '#1074#1077#1097#1072#1085#1080#1103
    EditButtons = <>
    KeyField = 'O_Id'
    ListField = 'O_Name'
    ListSource = srcSYSTEM
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object edSYMRATE: TDBEditEh
    Left = 288
    Top = 113
    Width = 195
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'SYMRATE'
    DataSource = srcChForSrc
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1057#1082#1086#1088#1086#1089#1090#1100
    ShowHint = True
    TabOrder = 5
    Visible = True
  end
  object edtURL: TDBEditEh
    Left = 70
    Top = 113
    Width = 147
    Height = 21
    DataField = 'FREQ'
    DataSource = srcChForSrc
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1063#1072#1089#1090#1086#1090#1072' '#1087#1086#1083#1103#1088#1080#1079#1072#1094#1080#1103
    ShowHint = True
    TabOrder = 4
    Visible = True
  end
  object dbmNOTICE: TDBMemoEh
    Left = 8
    Top = 296
    Width = 475
    Height = 65
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcChForSrc
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 12
    Visible = True
    WantReturns = True
  end
  object cbbChan: TDBLookupComboboxEh
    Left = 70
    Top = 8
    Width = 413
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'Ch_Id'
    DataSource = srcChForSrc
    DropDownBox.Columns = <
      item
        FieldName = 'Ch_Name'
        Width = 70
      end
      item
        FieldName = 'CH_NOTICE'
        Width = 40
      end>
    DropDownBox.ListSource = srcChan
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterType = lsftContainsEh
    DropDownBox.AutoDrop = True
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1050#1072#1085#1072#1083
    EditButtons = <>
    KeyField = 'Ch_Id'
    ListField = 'Ch_Name'
    ListSource = srcChan
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 0
    Visible = True
  end
  object cbbS_Crypt: TDBLookupComboboxEh
    Left = 70
    Top = 60
    Width = 413
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'S_Crypt'
    DataSource = srcChForSrc
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1050#1086#1076#1080#1088#1086#1074#1082#1072' '#1089#1080#1075#1085#1072#1083#1072
    EditButtons = <>
    KeyField = 'O_Id'
    ListField = 'O_Name'
    ListSource = srcCrypt
    ShowHint = True
    TabOrder = 2
    Visible = True
  end
  object cbbVideo: TDBLookupComboboxEh
    Left = 70
    Top = 86
    Width = 413
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'V_CODEC'
    DataSource = srcChForSrc
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1042#1080#1076#1077#1086' '#1082#1086#1076#1077#1082
    EditButtons = <>
    KeyField = 'O_Id'
    ListField = 'O_Name'
    ListSource = srcCODEC
    ShowHint = True
    TabOrder = 3
    Visible = True
  end
  object edtSYMRATE: TDBEditEh
    Left = 70
    Top = 139
    Width = 413
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'IP'
    DataSource = srcChForSrc
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = 'IP '#1087#1086#1090#1086#1082#1072
    ShowHint = True
    TabOrder = 6
    Visible = True
  end
  object cbbCARD: TDBLookupComboboxEh
    Left = 70
    Top = 165
    Width = 413
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'CARD_ID'
    DataSource = srcChForSrc
    DropDownBox.Columns = <
      item
        FieldName = 'O_NAME'
      end>
    DropDownBox.ListSource = srcCard
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterType = lsftContainsEh
    DropDownBox.AutoDrop = True
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1082#1072#1088#1090#1086#1095#1082#1080
    EditButtons = <>
    KeyField = 'O_Id'
    ListField = 'O_Name'
    ListSource = srcCard
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 7
    Visible = True
  end
  object chkAnalog: TDBCheckBoxEh
    Left = 80
    Top = 192
    Width = 113
    Height = 17
    Caption = #1042#1077#1097#1072#1077#1090' '#1074' '#1072#1085#1072#1083#1086#1075
    DataField = 'ON_ANALOG'
    DataSource = srcChForSrc
    DynProps = <>
    TabOrder = 8
  end
  object chkDVB: TDBCheckBoxEh
    Left = 208
    Top = 192
    Width = 113
    Height = 17
    Caption = #1042#1077#1097#1072#1077#1090' '#1074' DVB'
    DataField = 'ON_DVB'
    DataSource = srcChForSrc
    DynProps = <>
    TabOrder = 9
  end
  object chkIPTV: TDBCheckBoxEh
    Left = 344
    Top = 192
    Width = 113
    Height = 17
    Caption = #1042#1077#1097#1072#1077#1090' '#1074' IPTV'
    DataField = 'ON_IPTV'
    DataSource = srcChForSrc
    DynProps = <>
    TabOrder = 10
  end
  object grpSrc: TGroupBox
    Left = 8
    Top = 215
    Width = 475
    Height = 77
    Anchors = [akLeft, akTop, akRight]
    Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1072#1085#1072#1083#1072' '#1080#1089#1090#1086#1095#1085#1080#1082#1072
    TabOrder = 11
    object lbl5: TLabel
      Left = 55
      Top = 24
      Width = 18
      Height = 13
      Caption = 'NID'
    end
    object lbl6: TLabel
      Left = 159
      Top = 24
      Width = 26
      Height = 13
      Caption = 'ONID'
    end
    object lbl7: TLabel
      Left = 264
      Top = 24
      Width = 23
      Height = 13
      Caption = 'TSID'
    end
    object lbl8: TLabel
      Left = 376
      Top = 24
      Width = 17
      Height = 13
      Caption = 'SID'
    end
    object lbl9: TLabel
      Left = 55
      Top = 51
      Width = 23
      Height = 13
      Caption = 'VPID'
    end
    object lbl10: TLabel
      Left = 159
      Top = 51
      Width = 24
      Height = 13
      Caption = 'APID'
    end
    object lbl11: TLabel
      Left = 264
      Top = 51
      Width = 30
      Height = 13
      Caption = 'A2PID'
    end
    object ednNID: TDBNumberEditEh
      Left = 85
      Top = 21
      Width = 57
      Height = 21
      DataField = 'NID'
      DataSource = srcChForSrc
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = 'NID'
      EditButtons = <>
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object ednONID: TDBNumberEditEh
      Left = 192
      Top = 21
      Width = 57
      Height = 21
      DataField = 'ONID'
      DataSource = srcChForSrc
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = 'ONID'
      EditButtons = <>
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object ednTSID: TDBNumberEditEh
      Left = 300
      Top = 21
      Width = 57
      Height = 21
      DataField = 'TSID'
      DataSource = srcChForSrc
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = 'TSID'
      EditButtons = <>
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object ednSID: TDBNumberEditEh
      Left = 407
      Top = 21
      Width = 57
      Height = 21
      DataField = 'SID'
      DataSource = srcChForSrc
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = 'SID'
      EditButtons = <>
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object ednONID1: TDBNumberEditEh
      Left = 192
      Top = 48
      Width = 57
      Height = 21
      DataField = 'APID'
      DataSource = srcChForSrc
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = 'APID'
      EditButtons = <>
      ShowHint = True
      TabOrder = 5
      Visible = True
    end
    object ednNID1: TDBNumberEditEh
      Left = 85
      Top = 48
      Width = 57
      Height = 21
      DataField = 'VPID'
      DataSource = srcChForSrc
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = 'VPID'
      EditButtons = <>
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
    object ednTSID1: TDBNumberEditEh
      Left = 300
      Top = 48
      Width = 57
      Height = 21
      DataField = 'A2PID'
      DataSource = srcChForSrc
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = 'A2PID'
      EditButtons = <>
      ShowHint = True
      TabOrder = 6
      Visible = True
    end
  end
  object dsChForSrc: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Channel_Src_Param_Iu(:Csp_Id, :Cs_Id, :Ch_Id, ' +
        ':Notice, :Freq, :Symrate, :Ip, :V_Codec, :S_Crypt, :Cs_System, :' +
        'Card_Id, :On_Analog, :On_Dvb, :On_Iptv, :Nid, :Onid, :Tsid, :Sid' +
        ', :Vpid, :Apid, :A2pid)  ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CHANNEL_SRC_PARAM'
      'WHERE'
      '        CS_ID = :OLD_CS_ID'
      '    and CH_ID = :OLD_CH_ID'
      '    and CSP_ID = :OLD_CSP_ID'
      '    ')
    InsertSQL.Strings = (
      
        'execute procedure Channel_Src_Param_Iu(:Csp_Id, :Cs_Id, :Ch_Id, ' +
        ':Notice, :Freq, :Symrate, :Ip, :V_Codec, :S_Crypt, :Cs_System, :' +
        'Card_Id, :On_Analog, :On_Dvb, :On_Iptv, :Nid, :Onid, :Tsid, :Sid' +
        ', :Vpid, :Apid, :A2pid)  ')
    RefreshSQL.Strings = (
      'select'
      '  p.*'
      '  from Channel_Src_Param p'
      'where P.CS_ID = :OLD_CS_ID'
      '    and P.CH_ID = :OLD_CH_ID'
      '    and RDB$DB_KEY = :OLD_RDB$DB_KEY     '
      '    ')
    SelectSQL.Strings = (
      'select'
      '  p.*'
      '  , p.RDB$DB_KEY'
      '  from Channel_Src_Param p'
      'where p.Cs_Id = :Cs_Id'
      '  and p.Ch_Id = :Ch_Id'
      '  and p.CSP_ID = :CSP_ID ')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 160
    Top = 18
  end
  object srcChForSrc: TDataSource
    DataSet = dsChForSrc
    Left = 216
    Top = 18
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 160
    Top = 242
  end
  object cnError: TCnErrorProvider
    DoubleBuffer = False
    Left = 224
    Top = 120
  end
  object dsSYSTEM: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      ' o.O_Id'
      ' , o.O_Name'
      'from objects o'
      'where o.O_Type = 41'
      'and o.O_Deleted = 0'
      'order by o.O_Name')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 311
    Top = 193
  end
  object srcSYSTEM: TDataSource
    DataSet = dsSYSTEM
    Left = 376
    Top = 200
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 246
    Top = 243
  end
  object dsChan: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    c.Ch_Id'
      '  , c.Ch_Name'
      '  , c.CH_NOTICE'
      '  from Channels C'
      '  order by 2  ')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 311
    Top = 89
  end
  object srcChan: TDataSource
    DataSet = dsChan
    Left = 376
    Top = 88
  end
  object srcCODEC: TDataSource
    DataSet = dsCODEC
    Left = 376
    Top = 144
  end
  object dsCODEC: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      ' o.O_Id'
      ' , o.O_Name'
      'from objects o'
      'where o.O_Type = 42'
      'and o.O_Deleted = 0'
      'order by o.O_Name')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 311
    Top = 145
  end
  object srcCrypt: TDataSource
    DataSet = dsCrypt
    Left = 376
    Top = 256
  end
  object dsCrypt: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      ' o.O_Id'
      ' , o.O_Name'
      'from objects o'
      'where o.O_Type = 43'
      'and o.O_Deleted = 0'
      'order by o.O_Name')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 311
    Top = 257
  end
  object dsCard: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    o.O_Id'
      
        '  , o.O_Name || coalesce('#39' - '#1054#1087#1083'. '#1076#1086' '#39' || o.O_DATEEND, '#39#39') || co' +
        'alesce('#39' '#39' || o.O_Description, '#39#39') O_NAME'
      '  from objects o'
      '  where o.O_Type = 44'
      '        and o.O_Deleted = 0'
      '  order by o.O_Name')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 111
    Top = 121
  end
  object srcCard: TDataSource
    DataSet = dsCard
    Left = 168
    Top = 120
  end
end
