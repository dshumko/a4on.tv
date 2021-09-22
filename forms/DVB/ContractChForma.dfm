object ContractChForm: TContractChForm
  Left = 927
  Top = 257
  BorderStyle = bsDialog
  Caption = #1050#1072#1085#1072#1083' '#1076#1086#1075#1086#1074#1086#1088#1072
  ClientHeight = 239
  ClientWidth = 392
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
    392
    239)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 14
    Width = 31
    Height = 13
    Caption = #1050#1072#1085#1072#1083
  end
  object Label3: TLabel
    Left = 8
    Top = 43
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object lbl1: TLabel
    Left = 159
    Top = 43
    Width = 92
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
  end
  inline okf: TOkCancelFrame
    Left = 0
    Top = 204
    Width = 392
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
      Left = 8
      Width = 294
      ModalResult = 0
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 311
      OnClick = okfbbCancelClick
    end
  end
  object DBLChannels: TDBLookupComboboxEh
    Left = 48
    Top = 11
    Width = 337
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'CH_ID'
    DataSource = srcChannel
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
  object DBMemo1: TDBMemoEh
    Left = 8
    Top = 99
    Width = 377
    Height = 102
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcChannel
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 3
    Visible = True
    WantReturns = True
  end
  object edtCOST: TDBNumberEditEh
    Left = 48
    Top = 40
    Width = 105
    Height = 21
    DataField = 'COST'
    DataSource = srcChannel
    DynProps = <>
    EmptyDataInfo.Text = #1062#1077#1085#1072
    EditButtons = <>
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object ednCOST: TDBNumberEditEh
    Left = 257
    Top = 40
    Width = 128
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'CUST_COUNT'
    DataSource = srcChannel
    DecimalPlaces = 0
    DynProps = <>
    EmptyDataInfo.Text = #1050#1086#1083'-'#1074#1086' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = True
  end
  object chkATV: TDBCheckBoxEh
    Left = 48
    Top = 72
    Width = 73
    Height = 17
    Hint = #1042' '#1072#1085#1072#1083#1086#1075#1086#1074#1084' '#1058#1042
    Caption = #1040#1058#1042
    DataField = 'ATV'
    DataSource = srcChannel
    DynProps = <>
    TabOrder = 5
  end
  object chkDTV: TDBCheckBoxEh
    Left = 136
    Top = 72
    Width = 73
    Height = 17
    Hint = #1042' '#1094#1080#1092#1088#1086#1074#1086#1084' '#1058#1042
    Caption = #1062#1058#1042
    DataField = 'DTV'
    DataSource = srcChannel
    DynProps = <>
    TabOrder = 6
  end
  object chkIPTV: TDBCheckBoxEh
    Left = 223
    Top = 72
    Width = 73
    Height = 17
    Hint = #1042' IPTV'
    Caption = 'IPTV'
    DataField = 'IPTV'
    DataSource = srcChannel
    DynProps = <>
    TabOrder = 7
  end
  object chkOTT: TDBCheckBoxEh
    Left = 311
    Top = 72
    Width = 73
    Height = 17
    Hint = #1042' OTT'
    Caption = 'OTT'
    DataField = 'OTT'
    DataSource = srcChannel
    DynProps = <>
    TabOrder = 8
  end
  object srcChannel: TDataSource
    DataSet = dsChannel
    Left = 84
    Top = 98
  end
  object dsChannel: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE DISTRIB_CONTRACT_CH'
      'SET '
      '    CONTRACT_ID = :CONTRACT_ID,'
      '    CH_ID = :CH_ID,'
      '    COST = :COST,'
      '    CUST_COUNT = :CUST_COUNT,'
      '    DTV = :DTV,'
      '    ATV = :ATV,'
      '    IPTV = :IPTV,'
      '    OTT = :OTT,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    CONTRACT_ID = :OLD_CONTRACT_ID'
      '    and CH_ID = :OLD_CH_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DISTRIB_CONTRACT_CH'
      'WHERE'
      '        CONTRACT_ID = :OLD_CONTRACT_ID'
      '    and CH_ID = :OLD_CH_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO DISTRIB_CONTRACT_CH('
      '    CONTRACT_ID,'
      '    CH_ID,'
      '    COST,'
      '    CUST_COUNT,'
      '    DTV,'
      '    ATV,'
      '    IPTV,'
      '    OTT,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :CONTRACT_ID,'
      '    :CH_ID,'
      '    :COST,'
      '    :CUST_COUNT,'
      '    :DTV,'
      '    :ATV,'
      '    :IPTV,'
      '    :OTT,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    d.*'
      '  from Distrib_Contract_Ch d'
      ' where ( D.CONTRACT_ID = :OLD_CONTRACT_ID'
      '    and D.CH_ID = :OLD_CH_ID )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    d.*'
      '  from Distrib_Contract_Ch d'
      ' where d.Contract_Id = :Contract_Id'
      '  and d.CH_ID = :CH_ID')
    AutoCalcFields = False
    Transaction = trSRead
    Database = dmMain.dbTV
    UpdateTransaction = trSWrite
    AutoCommit = True
    Left = 24
    Top = 96
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcChannList: TDataSource
    DataSet = dsChannList
    Left = 272
    Top = 80
  end
  object dsChannList: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT c.Ch_Id, c.Ch_Name, c.Ch_Notice'
      'FROM Channels c'
      
        'where not exists(SELECT Cc.Ch_Id FROM Customer_Channels Cc where' +
        ' Cc.Ch_Id = c.Ch_Id and Cc.Decoder_Id = :Decoder_Id)'
      'order by c.Ch_Name')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 200
    Top = 80
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 155
    Top = 128
  end
  object trSWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 240
    Top = 136
  end
  object trSRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 304
    Top = 128
  end
end
