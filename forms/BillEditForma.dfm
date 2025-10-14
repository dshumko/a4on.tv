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
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  OnShow = FormShow
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
  object lbl2: TLabel
    Left = 9
    Top = 138
    Width = 61
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ParentBiDiMode = False
  end
  object lblACCOUNT: TLabel
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
    Width = 306
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'IP_INET'
    DataSource = srcBill
    DynProps = <>
    EditButtons = <
      item
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000001FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888825
          2525252525888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3B3B3B
          212121212121212121212121212121E5E5E5E5E5E52121212121212121212121
          212121213B3B3BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888825
          2525252525888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8F8F8F8FFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABABA57575728
          2828282828575757BABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFF888888434343505050828282828282505050434343888888FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBABABA434343F0F0F0373737E4
          E4E4E4E4E4373737F0F0F0434343BABABAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF5757572121212121212121212121212121212121212121212121215757
          57FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF292929F7F7F7D1D1D1565656FF
          FFFFFFFFFF565656D1D1D1F6F6F6292929FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFF2A2A2AF6F6F6D1D1D1565656FFFFFFFFFFFF565656D1D1D1F6F6F62A2A
          2AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF57575721212121212121212121
          2121212121212121212121212121575757FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFBABABA434343F0F0F0373737E4E4E4E4E4E4373737F0F0F0434343BABA
          BAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF88888843434351515182
          8282828282515151434343888888FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFBABABA575757292929292929575757BABABAFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        Hint = #1085#1072#1081#1090#1080' IP '#1072#1076#1088#1077#1089' '#1087#1086' '#1084#1072#1089#1082#1077' (F3)'
        ShortCut = 114
        Style = ebsGlyphEh
        OnClick = edtInetIPEditButtons0Click
      end>
    EmptyDataInfo.Text = 'IP '#1072#1076#1088#1077#1089'. '#1082#1085#1086#1087#1082#1072' '#1076#1083#1103' '#1087#1086#1076#1073#1086#1088#1072' '#1087#1086' '#1084#1072#1089#1082#1077
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnEnter = edtInetIPEnter
    OnExit = edtInetIPExit
  end
  object edtLOGIN: TDBEditEh
    Left = 75
    Top = 59
    Width = 306
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'LOGIN'
    DataSource = srcBill
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1051#1086#1075#1080#1085
    ShowHint = True
    TabOrder = 3
    Visible = True
    OnEnter = edtInetIPEnter
    EditMask = ''
  end
  object edtSecret: TDBEditEh
    Left = 75
    Top = 84
    Width = 306
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <
      item
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF545454545454FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD3D3D3717171FF00FF54
          5454545454FF00FF717171D3D3D3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFB3B3B30E0E0E2A2A2A3232323232322A2A2A0E0E0EB3B3B3FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3F3F3F00
          0000000000383838DBDBDBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF3F3F3F000000000000383838DBDBDBFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB3B3B30E0E0E2A2A2A32
          32323232322A2A2A0E0E0EB3B3B3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFD3D3D3717171FF00FF545454545454FF00FF717171D3D3D3FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF54
          5454545454FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        Hint = #1089#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1089#1083#1091#1095#1072#1081#1085#1099#1081' '#1087#1072#1088#1086#1083#1100' (F3)'
        ShortCut = 114
        Style = ebsGlyphEh
        OnClick = edtSecretEditButtons0Click
      end>
    EmptyDataInfo.Text = #1055#1072#1088#1086#1083#1100'. '#1082#1085#1086#1087#1082#1072' '#1076#1083#1103' '#1075#1077#1085#1077#1088#1072#1094#1080#1080
    ShowHint = True
    TabOrder = 4
    Visible = True
    OnEnter = edtInetIPEnter
    EditMask = ''
  end
  object chkVPN: TDBCheckBoxEh
    Left = 75
    Top = 35
    Width = 110
    Height = 17
    Caption = 'VPN'
    DataField = 'VPN'
    DataSource = srcBill
    DynProps = <>
    TabOrder = 1
    OnClick = chkVPNClick
  end
  object mmoNOTICE: TDBMemoEh
    Left = 75
    Top = 137
    Width = 306
    Height = 73
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcBill
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 6
    Visible = True
    WantReturns = True
  end
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 216
    Width = 389
    Height = 35
    Align = alBottom
    TabOrder = 7
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 75
      Width = 214
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 295
      Width = 86
    end
  end
  object edtACCOUNT: TDBEditEh
    Left = 75
    Top = 110
    Width = 306
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'ACCOUNT_ID'
    DataSource = srcBill
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = 'Account_id '#1076#1083#1103' UTM'
    ShowHint = True
    TabOrder = 5
    Visible = True
    OnEnter = edtInetIPEnter
    EditMask = ''
  end
  object chkBLOCKED: TDBCheckBoxEh
    Left = 271
    Top = 35
    Width = 110
    Height = 17
    Anchors = [akTop, akRight]
    Caption = #1042' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1077
    DataField = 'BLOCKED'
    DataSource = srcBill
    DynProps = <>
    TabOrder = 2
    OnClick = chkVPNClick
    ValueChecked = '1'
    ValueUnchecked = '0'
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
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 312
    Top = 152
  end
end
