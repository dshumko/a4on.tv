object BillEditForm: TBillEditForm
  Left = 0
  Top = 0
  ActiveControl = edtInetIP
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1076#1086#1089#1090#1091#1087#1072' '#1082' '#1089#1077#1090#1080' '#1048#1085#1090#1077#1088#1085#1077#1090
  ClientHeight = 251
  ClientWidth = 389
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
    389
    251)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 9
    Top = 11
    Width = 43
    Height = 13
    Caption = 'IP '#1072#1076#1088#1077#1089
  end
  object Label3: TLabel
    Left = 9
    Top = 62
    Width = 30
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = #1051#1086#1075#1080#1085
    ParentBiDiMode = False
  end
  object Label5: TLabel
    Left = 9
    Top = 87
    Width = 37
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = #1055#1072#1088#1086#1083#1100
    ParentBiDiMode = False
  end
  object btnnEXTip: TSpeedButton
    Left = 360
    Top = 8
    Width = 21
    Height = 21
    Hint = #1044#1086#1087#1086#1083#1085#1080#1090#1100' IP '#1072#1076#1088#1077#1089#1089' '#1089#1086#1075#1083#1072#1089#1085#1086' '#1084#1072#1089#1082#1080
    Anchors = [akTop, akRight]
    Flat = True
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000000000000040204000489
      BE0007C9FA0009A6DD0037E8FC000490D00084D6F4000FD8FC00046DA2000EBC
      EC002C86AC005CFAFC00047BB10036D9FA004C96C4000799CF00000000000000
      00000CCCC0000000000001771100000000000F479C0005C100000FDFC8C0539C
      10000F1881C0F472C00008C322C8FB2F10000C37223A5FC88C0000F4722E688F
      9C80005DD7710F72238000334D710F72228000039D3505DD7710000035F00334
      D7100000000000FD47C0000000000051FCC00000000000000000}
    OnClick = btnnEXTipClick
  end
  object lbl2: TLabel
    Left = 9
    Top = 138
    Width = 61
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ParentBiDiMode = False
  end
  object btn1: TSpeedButton
    Left = 360
    Top = 84
    Width = 21
    Height = 21
    Hint = #1057#1075#1077#1085#1077#1088#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
    Anchors = [akTop, akRight]
    Caption = '*'
    Flat = True
    OnClick = btn1Click
  end
  object lbl3: TLabel
    Left = 9
    Top = 113
    Width = 66
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = 'ACCOUNT_ID'
    ParentBiDiMode = False
  end
  object edtInetIP: TDBEditEh
    Left = 75
    Top = 8
    Width = 279
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'IP_INET'
    DataSource = srcBill
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnEnter = edtInetIPEnter
    OnExit = edtInetIPExit
  end
  object edtLOGIN: TDBEditEh
    Left = 75
    Top = 59
    Width = 279
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'LOGIN'
    DataSource = srcBill
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = True
    OnEnter = edtInetIPEnter
    EditMask = ''
  end
  object edtSecret: TDBEditEh
    Left = 75
    Top = 84
    Width = 279
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 3
    Visible = True
    OnEnter = edtInetIPEnter
    EditMask = ''
  end
  object chkVPN: TDBCheckBoxEh
    Left = 75
    Top = 35
    Width = 279
    Height = 17
    Anchors = [akLeft, akTop, akRight]
    Caption = 'VPN'
    DataField = 'VPN'
    DataSource = srcBill
    DynProps = <>
    TabOrder = 1
    OnClick = chkVPNClick
  end
  object mmoNOTICE: TDBMemoEh
    Left = 75
    Top = 135
    Width = 279
    Height = 70
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcBill
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 5
    Visible = True
    WantReturns = True
  end
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 216
    Width = 389
    Height = 35
    Align = alBottom
    TabOrder = 6
    TabStop = True
    inherited bbOk: TBitBtn
      Left = 174
      Width = 128
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 308
      Width = 74
    end
  end
  object edtLOGIN1: TDBEditEh
    Left = 75
    Top = 110
    Width = 279
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'ACCOUNT_ID'
    DataSource = srcBill
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = 'Account_id '#1076#1083#1103' UTM'
    ShowHint = True
    TabOrder = 4
    Visible = True
    OnEnter = edtInetIPEnter
    EditMask = ''
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
    Left = 257
    Top = 139
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 148
    Top = 144
  end
  object srcBill: TDataSource
    DataSet = dsBill
    Left = 118
    Top = 131
  end
  object dsBill: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE BILLING'
      'SET '
      '    CUSTOMER_ID = :CUSTOMER_ID,'
      '    LOGIN = :LOGIN,'
      '    SECRET = :SECRET,'
      '    IP_INET = :IP_INET,'
      '    NOTICE = :NOTICE,'
      '    BLOCKED = :BLOCKED,'
      '    SECRET_WEB = :SECRET_WEB,'
      '    ACCOUNT_ID = :ACCOUNT_ID, '
      '    VPN = :VPN'
      'WHERE'
      '    BLNG_ID = :OLD_BLNG_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    BILLING'
      'WHERE'
      '        BLNG_ID = :OLD_BLNG_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO BILLING('
      '    CUSTOMER_ID,'
      '    LOGIN,'
      '    SECRET,'
      '    IP_INET,'
      '    NOTICE,'
      '    BLOCKED,'
      '    SECRET_WEB,'
      '    ACCOUNT_ID,'
      '    VPN'
      ')'
      'VALUES('
      '    :CUSTOMER_ID,'
      '    :LOGIN,'
      '    :SECRET,'
      '    :IP_INET,'
      '    :NOTICE,'
      '    :BLOCKED,'
      '    :SECRET_WEB,'
      '    :ACCOUNT_ID,'
      '    :VPN'
      ')')
    RefreshSQL.Strings = (
      'select *'
      'from BILLING'
      'WHERE(  BLNG_ID = :BLNG_ID'
      '     ) and (     BILLING.BLNG_ID = :OLD_BLNG_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select *'
      'from BILLING'
      'WHERE BLNG_ID = :BLNG_ID')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 194
    Top = 142
  end
end
