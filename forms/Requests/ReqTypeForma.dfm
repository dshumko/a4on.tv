object ReqTypeForm: TReqTypeForm
  Left = 0
  Top = 0
  Anchors = [akLeft, akTop, akRight]
  BorderStyle = bsSizeToolWin
  Caption = #1058#1080#1087' '#1088#1072#1073#1086#1090
  ClientHeight = 296
  ClientWidth = 416
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
  DesignSize = (
    416
    296)
  PixelsPerInch = 96
  TextHeight = 13
  object lblName: TLabel
    Left = 8
    Top = 9
    Width = 73
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object lblPrint: TLabel
    Left = 8
    Top = 60
    Width = 84
    Height = 13
    Caption = #1055#1077#1095#1072#1090#1085#1072#1103' '#1092#1086#1088#1084#1072
  end
  object lblNotice: TLabel
    Left = 8
    Top = 144
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object lblPPR: TLabel
    Left = 8
    Top = 34
    Width = 52
    Height = 13
    Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
  end
  inline okcnclfrm1: TOkCancelFrame
    Left = 0
    Top = 261
    Width = 416
    Height = 35
    Align = alBottom
    TabOrder = 8
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 108
      Width = 207
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 1
      OnClick = okcnclfrm1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 319
      Top = 3
      Width = 90
      TabOrder = 0
    end
  end
  object dbedt1: TDBEditEh
    Left = 108
    Top = 6
    Width = 301
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'RT_NAME'
    DataSource = srcRT
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object dbedt2: TDBEditEh
    Left = 108
    Top = 57
    Width = 301
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'RT_PRINTFORM'
    DataSource = srcRT
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 4
    Visible = True
  end
  object dbmmo1: TDBMemoEh
    Left = 8
    Top = 160
    Width = 401
    Height = 95
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'RT_NOTICE'
    DataSource = srcRT
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 7
    Visible = True
    WantReturns = True
  end
  object cbb1: TDBComboBoxEh
    Left = 108
    Top = 31
    Width = 110
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'RT_TYPE'
    DataSource = srcRT
    DynProps = <>
    EditButtons = <>
    Items.Strings = (
      ''
      #1057#1050#1058#1042
      #1057#1055#1044
      #1062#1080#1092#1088#1086#1074#1086#1077' '#1058#1042)
    KeyItems.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4')
    ShowHint = True
    TabOrder = 3
    Visible = True
  end
  object btnColor: TBitBtn
    Left = 225
    Top = 29
    Width = 90
    Height = 25
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1094#1074#1077#1090' '#1092#1086#1085#1072' '#1076#1083#1103' '#1076#1072#1085#1085#1086#1075#1086' '#1090#1080#1087#1072' '#1079#1072#1103#1074#1086#1082
    Anchors = [akTop, akRight]
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1086#1085
    TabOrder = 1
    TabStop = False
    OnClick = btnColorClick
  end
  object btnClear: TButton
    Left = 319
    Top = 29
    Width = 90
    Height = 25
    Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1094#1074#1077#1090' '#1092#1086#1085#1072' '#1090#1080#1087#1072' '#1079#1072#1103#1074#1082#1080
    Anchors = [akTop, akRight]
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1086#1085
    TabOrder = 2
    TabStop = False
    OnClick = btnClearClick
  end
  object dbckDefault: TDBCheckBoxEh
    Left = 8
    Top = 85
    Width = 113
    Height = 17
    Alignment = taLeftJustify
    Caption = #1044#1083#1103' '#1085#1086#1074#1086#1081' '#1079#1072#1103#1074#1082#1080
    DataField = 'RT_DEFAULT'
    DataSource = srcRT
    DynProps = <>
    TabOrder = 5
  end
  object chkCAUSE_NEED: TDBCheckBoxEh
    Left = 234
    Top = 88
    Width = 175
    Height = 17
    Alignment = taLeftJustify
    Anchors = [akTop, akRight]
    Caption = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1079#1086#1074#1072' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1072
    DataField = 'CAUSE_NEED'
    DataSource = srcRT
    DynProps = <>
    TabOrder = 6
  end
  object chkCommissing: TDBCheckBoxEh
    Left = 8
    Top = 115
    Width = 401
    Height = 17
    Alignment = taLeftJustify
    Anchors = [akLeft, akTop, akRight]
    Caption = #1058#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1076#1086#1084#1086#1074' '#1074#1074#1077#1076#1077#1085#1085#1099#1093' '#1074' '#1101#1082#1089#1087#1083#1091#1072#1090#1072#1094#1080#1102
    DataField = 'RT_HC_NEED'
    DataSource = srcRT
    DynProps = <>
    TabOrder = 9
  end
  object srcRT: TDataSource
    DataSet = dsRT
    Left = 32
    Top = 208
  end
  object dsRT: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE REQUEST_TYPES'
      'SET '
      '    RT_NAME = :RT_NAME,'
      '    RT_TYPE = :RT_TYPE,'
      '    RT_NOTICE = :RT_NOTICE,'
      '    RT_PRINTFORM = :RT_PRINTFORM,'
      '    RT_COLOR = :RT_COLOR,'
      '    RT_DEFAULT = :RT_DEFAULT,'
      '    CAUSE_NEED = :CAUSE_NEED,'
      '    RT_HC_NEED = :RT_HC_NEED '
      'WHERE'
      '    RT_ID = :OLD_RT_ID'
      '    ')
    DeleteSQL.Strings = (
      'update'
      '    REQUEST_TYPES'
      'set RT_DELETED = 1'
      'WHERE'
      '        RT_ID = :OLD_RT_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO REQUEST_TYPES('
      '    RT_ID,'
      '    RT_NAME,'
      '    RT_TYPE,'
      '    RT_NOTICE,'
      '    RT_PRINTFORM,'
      '    RT_COLOR,'
      '    RT_DEFAULT,'
      '    CAUSE_NEED,'
      '    RT_HC_NEED    '
      ')'
      'VALUES('
      '    :RT_ID,'
      '    :RT_NAME,'
      '    :RT_TYPE,'
      '    :RT_NOTICE,'
      '    :RT_PRINTFORM,'
      '    :RT_COLOR,'
      '    :RT_DEFAULT,'
      '    :CAUSE_NEED,'
      '    :RT_HC_NEED'
      ')')
    RefreshSQL.Strings = (
      'select *'
      'from REQUEST_TYPEs rt'
      'where(  rt.rt_id = :RT_ID'
      '     ) and (     RT.RT_ID = :OLD_RT_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    *'
      '  from REQUEST_TYPES rt'
      '  where rt.rt_id = :RT_ID   ')
    AfterOpen = dsRTAfterOpen
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 80
    Top = 208
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
    Left = 184
    Top = 208
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
    Left = 128
    Top = 208
  end
  object dlgColor: TColorDialog
    Left = 240
    Top = 208
  end
end
