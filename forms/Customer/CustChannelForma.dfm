object CustChannelForm: TCustChannelForm
  Left = 927
  Top = 257
  BorderIcons = [biSystemMenu]
  Caption = #1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1081' '#1082#1072#1085#1072#1083
  ClientHeight = 195
  ClientWidth = 301
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  DesignSize = (
    301
    195)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 14
    Width = 31
    Height = 13
    Caption = #1050#1072#1085#1072#1083
  end
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 7
    Top = 51
    Width = 34
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089
  end
  object Label4: TLabel
    Left = 162
    Top = 51
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  inline okf: TOkCancelFrame
    Left = 0
    Top = 160
    Width = 301
    Height = 35
    Align = alBottom
    TabOrder = 4
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 17
      Top = 9
      Width = 176
      Anchors = [akLeft, akRight, akBottom]
    end
    inherited bbCancel: TBitBtn
      Left = 219
      Top = 9
    end
  end
  object DBLChannels: TDBLookupComboboxEh
    Left = 48
    Top = 11
    Width = 246
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'CH_ID'
    DataSource = srcChannels
    DropDownBox.Columns = <
      item
        FieldName = 'CH_NAME'
        Title.Caption = #1050#1072#1085#1072#1083
      end
      item
        FieldName = 'CH_NOTICE'
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 100
      end>
    EditButtons = <>
    KeyField = 'CH_ID'
    ListField = 'CH_NAME'
    ListSource = srcChannList
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object deStart: TDBDateTimeEditEh
    Left = 48
    Top = 48
    Width = 101
    Height = 21
    DataField = 'DATE_ON'
    DataSource = srcChannels
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 1
    Visible = True
    EditFormat = 'DD/MM/YYYY'
  end
  object DBDateTimeEditEh2: TDBDateTimeEditEh
    Left = 184
    Top = 48
    Width = 110
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'DATE_OFF'
    DataSource = srcChannels
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = True
    EditFormat = 'DD/MM/YYYY'
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 96
    Width = 286
    Height = 53
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataField = 'NOTICE'
    DataSource = srcChannels
    TabOrder = 3
  end
  object srcChannels: TDataSource
    DataSet = dsChannels
    Left = 60
    Top = 122
  end
  object dsChannels: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CUSTOMER_CHANNELS'
      'SET '
      '    DATE_ON = :DATE_ON,'
      '    DATE_OFF = :DATE_OFF,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    DECODER_ID = :DECODER_ID'
      '    and CH_ID = :CH_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CUSTOMER_CHANNELS'
      'WHERE'
      '    DECODER_ID = :DECODER_ID'
      '    and CH_ID = :CH_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CUSTOMER_CHANNELS('
      '    Decoder_ID,'
      '    CH_ID,'
      '    DATE_ON,'
      '    DATE_OFF,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :DECODER_ID,'
      '    :CH_ID,'
      '    :DATE_ON,'
      '    :DATE_OFF,'
      '    :NOTICE'
      ')')
    SelectSQL.Strings = (
      'SELECT Cc.Ch_Id, Cc.Date_On, Cc.Date_Off, Cc.Notice, c.Ch_Name'
      'FROM Customer_Channels Cc, Channels c'
      'where c.Ch_Id = cc.Ch_Id'
      'and Cc.Decoder_Id = :Decoder_Id'
      'and cc.Ch_Id = :Ch_id'
      ''
      '')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DISCOUNT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 72
    Top = 128
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcChannList: TDataSource
    DataSet = dsChannList
    Left = 144
    Top = 128
  end
  object dsChannList: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT c.Ch_Id, c.Ch_Name, c.Ch_Notice'
      'FROM Channels c'
      
        'where  not exists(SELECT Cc.Ch_Id FROM Customer_Channels Cc ' +
        'where Cc.Ch_Id = c.Ch_Id and Cc.Decoder_Id = :Decoder_Id)'
      'order by c.Ch_Name')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 152
    Top = 136
  end
end
