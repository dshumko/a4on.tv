object ReqWorkForm: TReqWorkForm
  Left = 0
  Top = 0
  ActiveControl = dbeName
  Caption = #1064#1072#1073#1083#1086#1085' '#1088#1072#1073#1086#1090
  ClientHeight = 370
  ClientWidth = 380
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
    380
    370)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 12
    Width = 52
    Height = 13
    Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
  end
  object Label3: TLabel
    Left = 8
    Top = 233
    Width = 64
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '
  end
  object lbl1: TLabel
    Left = 8
    Top = 41
    Width = 72
    Height = 13
    Caption = #1058#1088#1091#1076#1086#1077#1084#1082#1086#1089#1090#1100
  end
  object lbl5: TLabel
    Left = 8
    Top = 70
    Width = 54
    Height = 13
    Caption = #1057#1090#1086#1080#1084#1089#1086#1090#1100
  end
  inline okcnclfrm1: TOkCancelFrame
    Left = 0
    Top = 335
    Width = 380
    Height = 35
    Align = alBottom
    TabOrder = 6
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 147
      Width = 143
      OnClick = okcnclfrm1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 296
    end
  end
  object dbmmoSolution: TDBMemoEh
    Left = 8
    Top = 249
    Width = 363
    Height = 80
    ScrollBars = ssVertical
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcWork
    DynProps = <>
    EditButtons = <>
    TabOrder = 5
    Visible = True
    WantReturns = True
  end
  object dbeName: TDBEditEh
    Left = 86
    Top = 9
    Width = 285
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'NAME'
    DataSource = srcWork
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
    TabOrder = 0
    Visible = True
  end
  object edtHours: TDBNumberEditEh
    Left = 86
    Top = 38
    Width = 285
    Height = 21
    Hint = #1058#1088#1091#1076#1086#1077#1084#1082#1086#1089#1090#1100' '#1088#1072#1073#1086#1090
    Anchors = [akLeft, akTop, akRight]
    DataField = 'W_TIME'
    DataSource = srcWork
    DecimalPlaces = 3
    DynProps = <>
    EmptyDataInfo.Text = #1058#1088#1091#1076#1086#1077#1084#1082#1086#1089#1090#1100' '#1074' '#1095#1072#1089#1072#1093
    EditButton.Visible = True
    EditButtons = <>
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object grpAfterAdd: TGroupBox
    Left = 8
    Top = 123
    Width = 363
    Height = 105
    Hint = #1063#1090#1086' '#1089#1076#1077#1083#1072#1090#1100' '#1077#1089#1083#1080' '#1088#1072#1073#1086#1090#1072' '#1076#1086#1073#1072#1074#1083#1077#1085#1072' '#1074' '#1079#1072#1103#1074#1082#1091' '#1080' '#1079#1072#1103#1074#1082#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1072
    Anchors = [akLeft, akTop, akRight]
    Caption = ' '#1044#1077#1081#1089#1090#1074#1080#1103' '#1087#1086#1089#1083#1077' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '
    TabOrder = 4
    DesignSize = (
      363
      105)
    object lbl3: TLabel
      Left = 12
      Top = 25
      Width = 43
      Height = 13
      Caption = #1040#1090#1088#1080#1073#1091#1090
    end
    object lbl4: TLabel
      Left = 12
      Top = 54
      Width = 140
      Height = 13
      Caption = #1044#1086#1073#1072#1074#1083#1103#1090#1100' '#1088#1072#1079#1086#1074#1091#1102' '#1091#1089#1083#1091#1075#1091
    end
    object cbATRAction: TDBComboBoxEh
      Left = 63
      Top = 22
      Width = 98
      Height = 21
      DataField = 'W_ATR_AD'
      DataSource = srcWork
      DynProps = <>
      EditButtons = <>
      Items.Strings = (
        #1076#1086#1073#1072#1074#1080#1090#1100
        #1091#1076#1072#1083#1080#1090#1100)
      KeyItems.Strings = (
        '1'
        '2')
      TabOrder = 0
      Visible = True
    end
    object cbbAttribute: TDBLookupComboboxEh
      Left = 165
      Top = 22
      Width = 191
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'W_ATR_ID'
      DataSource = srcWork
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcAttributes
      TabOrder = 1
      Visible = True
    end
    object cbService: TDBLookupComboboxEh
      Left = 165
      Top = 50
      Width = 191
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'AS_SERVICE'
      DataSource = srcWork
      EditButtons = <>
      KeyField = 'SERVICE_ID'
      ListField = 'NAME'
      ListSource = srcService
      TabOrder = 2
      Visible = True
    end
  end
  object dbckDefault: TDBCheckBoxEh
    Left = 8
    Top = 96
    Width = 363
    Height = 17
    Hint = #1057#1088#1072#1079#1091' '#1076#1086#1073#1072#1074#1083#1103#1090#1100' '#1074' '#1085#1086#1074#1091#1102' '#1079#1072#1103#1074#1082#1091' '#1076#1083#1103' '#1074#1099#1073#1088#1072#1085#1085#1075#1086' '#1090#1080#1087#1072
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    Caption = #1044#1086#1073#1072#1074#1083#1103#1090#1100' '#1074' '#1085#1086#1074#1091#1102' '#1079#1072#1103#1074#1082#1091
    DataField = 'ON_DEFAULT'
    DataSource = srcWork
    DynProps = <>
    TabOrder = 3
  end
  object ed1: TDBNumberEditEh
    Left = 87
    Top = 67
    Width = 285
    Height = 21
    Hint = #1057#1090#1086#1080#1084#1089#1086#1090#1100' '#1088#1072#1073#1086#1090#1072
    Anchors = [akLeft, akTop, akRight]
    DataField = 'W_COST'
    DataSource = srcWork
    DynProps = <>
    EmptyDataInfo.Text = #1057#1090#1086#1080#1084#1089#1086#1090#1100' '#1088#1072#1073#1086#1090
    EditButton.Visible = True
    EditButtons = <>
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Visible = True
  end
  object srcWork: TDataSource
    DataSet = dsWork
    Left = 152
    Top = 190
  end
  object dsWork: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE WORKS'
      'SET '
      '    RQ_TYPE = :RQ_TYPE,'
      '    WG_ID = :WG_ID,'
      '    NAME = :NAME,'
      '    NOTICE = :NOTICE,'
      '    W_TIME = :W_TIME,'
      '    W_ONOFF = :W_ONOFF,'
      '    W_SRV = :W_SRV,'
      '    W_SRVONOFF = :W_SRVONOFF,'
      '    W_ATR_AD = :W_ATR_AD,'
      '    W_ATR_ID = :W_ATR_ID,'
      '    AS_SERVICE = :AS_SERVICE,'
      '    ON_DEFAULT = :ON_DEFAULT,'
      '    w_COST  = :w_COST '
      'WHERE'
      '    W_ID = :OLD_W_ID'
      '    ')
    DeleteSQL.Strings = (
      'update'
      '    WORKS'
      'set Deleted = 1'
      'WHERE'
      '        W_ID = :OLD_W_ID')
    InsertSQL.Strings = (
      'INSERT INTO WORKS('
      '    W_ID,'
      '    RQ_TYPE,'
      '    WG_ID,'
      '    NAME,'
      '    NOTICE,'
      '    W_TIME,'
      '    W_ONOFF,'
      '    W_SRV,'
      '    W_SRVONOFF,'
      '    W_ATR_AD,'
      '    W_ATR_ID,'
      '    AS_SERVICE,'
      '    ON_DEFAULT,'
      '    w_COST'
      ')'
      'VALUES('
      '    :W_ID,'
      '    :RQ_TYPE,'
      '    :WG_ID,'
      '    :NAME,'
      '    :NOTICE,'
      '    :W_TIME,'
      '    :W_ONOFF,'
      '    :W_SRV,'
      '    :W_SRVONOFF,'
      '    :W_ATR_AD,'
      '    :W_ATR_ID,'
      '    :AS_SERVICE,'
      '    :ON_DEFAULT,'
      '    :W_COST'
      ')')
    RefreshSQL.Strings = (
      'select w.* '
      'from works w '
      'where(  '
      '  w.w_id = :W_ID'
      '     ) and (     W.W_ID = :OLD_W_ID'
      '     )'
      '    '
      '')
    SelectSQL.Strings = (
      'select w.* '
      'from works w '
      'where '
      '  w.w_id = :W_ID'
      '')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 45
    Top = 185
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
    Left = 204
    Top = 272
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
    Left = 141
    Top = 276
  end
  object dsAttributes: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_DELETED'
      '  , O_DIMENSION'
      '  from OBJECTS o'
      '  where O_TYPE = 4'
      '        and O_DELETED = 0'
      
        '--        and not exists(select ca.o_id from customer_attributes' +
        ' ca where ca.o_id = o.O_ID and ca.customer_id = :CID)'
      '  order by O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 143
    Top = 145
  end
  object srcAttributes: TDataSource
    AutoEdit = False
    DataSet = dsAttributes
    Left = 98
    Top = 148
  end
  object dsService: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT s.SERVICE_ID, s.NAME, s.SHORTNAME, s.DESCRIPTION, s.DIMEN' +
        'SION'
      'FROM SERVICES S, SERVICES_LINKS sl'
      
        'WHERE sl.LINK_TYPE = 1 and S.SERVICE_ID = sl.CHILD and s.srv_typ' +
        'e_id = 1'
      'order by s.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 233
    Top = 149
  end
  object srcService: TDataSource
    DataSet = dsService
    Left = 292
    Top = 150
  end
end
