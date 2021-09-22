object DistrContractForm: TDistrContractForm
  Left = 378
  Top = 361
  ActiveControl = edtC_NUMBER
  Caption = #1044#1086#1075#1086#1074#1086#1088
  ClientHeight = 271
  ClientWidth = 468
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    468
    271)
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 11
    Width = 37
    Height = 13
    Caption = #1053#1086#1084#1077#1088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 263
    Top = 38
    Width = 59
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1044#1086#1075#1086#1074#1086#1088' '#1076#1086
  end
  object lbl2: TLabel
    Left = 8
    Top = 38
    Width = 68
    Height = 13
    Caption = #1044#1086#1075#1086#1074#1086#1088' '#1086#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 8
    Top = 65
    Width = 71
    Height = 13
    Caption = #1060#1086#1088#1084#1072' '#1086#1090#1095#1077#1090#1072
  end
  object lbl4: TLabel
    Left = 339
    Top = 65
    Width = 38
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1060#1086#1088#1084#1072#1090
  end
  object lbl5: TLabel
    Left = 8
    Top = 92
    Width = 71
    Height = 13
    Caption = #1059#1089#1083#1086#1074#1080#1103', '#1088#1091#1073'.'
  end
  object lbl6: TLabel
    Left = 263
    Top = 92
    Width = 71
    Height = 13
    Caption = #1059#1089#1083#1086#1074#1080#1103', '#1095#1077#1083'.'
  end
  object lbl7: TLabel
    Left = 339
    Top = 11
    Width = 19
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1042#1080#1076
  end
  inline OkCancelFrame: TOkCancelFrame
    Left = 0
    Top = 234
    Width = 468
    Height = 37
    Align = alBottom
    TabOrder = 9
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 209
      Top = 7
      Width = 159
      Enabled = False
      OnClick = OkCancelFramebbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 385
      Top = 7
    end
  end
  object edtC_NUMBER: TDBEditEh
    Left = 91
    Top = 8
    Width = 242
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'C_NUMBER'
    DataSource = srcContract
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnChange = edtC_NUMBERChange
  end
  object DBMemo1: TDBMemoEh
    Left = 8
    Top = 116
    Width = 452
    Height = 120
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcContract
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 8
    Visible = True
    WantReturns = True
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 339
    Top = 35
    Width = 121
    Height = 21
    Anchors = [akTop, akRight]
    DataField = 'C_DATE_BEFORE'
    DataSource = srcContract
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1044#1086#1075#1086#1074#1086#1088' '#1076#1086
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 3
    Visible = True
  end
  object edtC_DATE: TDBDateTimeEditEh
    Left = 91
    Top = 35
    Width = 121
    Height = 21
    DataField = 'C_DATE'
    DataSource = srcContract
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 2
    Visible = True
  end
  object cbbREPORT_FORM: TDBComboBoxEh
    Left = 91
    Top = 62
    Width = 242
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'REPORT_ID'
    DataSource = srcContract
    DynProps = <>
    EmptyDataInfo.Text = #1060#1086#1088#1084#1072' '#1086#1090#1095#1077#1090#1072
    EditButtons = <>
    ShowHint = True
    TabOrder = 4
    Visible = True
  end
  object cbbREPORT_FRMT: TDBComboBoxEh
    Left = 379
    Top = 62
    Width = 81
    Height = 21
    Anchors = [akTop, akRight]
    DataField = 'REPORT_FRMT'
    DataSource = srcContract
    DynProps = <>
    EmptyDataInfo.Text = #1060#1086#1088#1084#1072#1090' '#1086#1090#1095#1077#1090#1072
    EditButtons = <>
    Items.Strings = (
      'PDF'
      'DOCX'
      'ODT')
    KeyItems.Strings = (
      'PDF'
      'DOCX'
      'ODT')
    ShowHint = True
    TabOrder = 5
    Visible = True
  end
  object edtFINTERMS: TDBNumberEditEh
    Left = 91
    Top = 89
    Width = 121
    Height = 21
    DataField = 'FINTERMS'
    DataSource = srcContract
    DynProps = <>
    EmptyDataInfo.Text = #1092#1080#1085#1072#1085#1089#1099
    EditButtons = <>
    ShowHint = True
    TabOrder = 6
    Visible = True
  end
  object edtMINTERMS: TDBNumberEditEh
    Left = 339
    Top = 89
    Width = 121
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'MINTERMS'
    DataSource = srcContract
    DecimalPlaces = 0
    DynProps = <>
    EmptyDataInfo.Text = #1084#1080#1085#1075#1072#1088#1072#1085#1090#1080#1103
    EditButtons = <>
    ShowHint = True
    TabOrder = 7
    Visible = True
  end
  object cbbREPORT_FRMT1: TDBComboBoxEh
    Left = 379
    Top = 8
    Width = 81
    Height = 21
    Anchors = [akTop, akRight]
    DataField = 'CTYPE'
    DataSource = srcContract
    DynProps = <>
    EmptyDataInfo.Text = #1042#1080#1076' '#1076#1086#1075#1086#1074#1086#1088#1072
    EditButtons = <>
    Items.Strings = (
      #1051#1080#1094#1077#1085#1079#1080#1086#1085#1085#1099#1081
      #1057#1074#1103#1079#1085#1086#1081)
    KeyItems.Strings = (
      #1051#1080#1094#1077#1085#1079#1080#1086#1085#1085#1099#1081
      #1057#1074#1103#1079#1085#1086#1081)
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object trSRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 360
    Top = 168
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
    Left = 24
    Top = 184
  end
  object dsContract: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE DISTRIB_CONTRACTS'
      'SET '
      '    DISTRIBUTOR_ID = :DISTRIBUTOR_ID,'
      '    C_NUMBER = :C_NUMBER,'
      '    C_DATE = :C_DATE,'
      '    C_DATE_BEFORE = :C_DATE_BEFORE,'
      '    REPORT_FRMT = :REPORT_FRMT,'
      '    DELIVERY = :DELIVERY,'
      '    FINTERMS = :FINTERMS,'
      '    MINTERMS = :MINTERMS,'
      '    REPORT_ID = :REPORT_ID,'
      '    NOTICE = :NOTICE,'
      '    CTYPE = :CTYPE'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DISTRIB_CONTRACTS'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO DISTRIB_CONTRACTS('
      '    ID,'
      '    DISTRIBUTOR_ID,'
      '    C_NUMBER,'
      '    C_DATE,'
      '    C_DATE_BEFORE,'
      '    REPORT_FRMT,'
      '    DELIVERY,'
      '    FINTERMS,'
      '    MINTERMS,'
      '    REPORT_ID,'
      '    NOTICE,'
      '    CTYPE'
      ')'
      'VALUES('
      '    :ID,'
      '    :DISTRIBUTOR_ID,'
      '    :C_NUMBER,'
      '    :C_DATE,'
      '    :C_DATE_BEFORE,'
      '    :REPORT_FRMT,'
      '    :DELIVERY,'
      '    :FINTERMS,'
      '    :MINTERMS,'
      '    :REPORT_ID,'
      '    :NOTICE,'
      '    :CTYPE'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    dc.*'
      '  from Distrib_Contracts dc'
      '  where(  dc.Id = :Id'
      '     ) and (     DC.ID = :OLD_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    dc.*'
      '  from Distrib_Contracts dc'
      '  where dc.Id = :Id')
    AutoUpdateOptions.UpdateTableName = 'DISTRIB_CONTRACTS'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    Transaction = trSRead
    Database = dmMain.dbTV
    UpdateTransaction = trSWrite
    AutoCommit = True
    Left = 80
    Top = 184
  end
  object srcContract: TDataSource
    AutoEdit = False
    DataSet = dsContract
    Left = 152
    Top = 176
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 216
    Top = 144
  end
  object dsReports: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      'r.report_name,'
      
        'coalesce((select FULL_NAME from get_fullname_report(r.id_parent,' +
        ' '#39'/'#39')),'#39#39') FULL_NAME,'
      'r.id_report'
      'from REPORTS r'
      'where not r.report_body is null'
      'order by 2,1')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 288
    Top = 168
  end
end
