object ReqWorkForm: TReqWorkForm
  Left = 0
  Top = 0
  ActiveControl = dbeName
  Caption = #1064#1072#1073#1083#1086#1085' '#1088#1072#1073#1086#1090
  ClientHeight = 382
  ClientWidth = 455
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
    455
    382)
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
    Top = 256
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
    Top = 347
    Width = 455
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
      Left = 222
      Width = 143
      OnClick = okcnclfrm1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 371
    end
  end
  object dbmmoSolution: TDBMemoEh
    Left = 8
    Top = 272
    Width = 438
    Height = 69
    ScrollBars = ssVertical
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcWork
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 5
    Visible = True
    WantReturns = True
  end
  object dbeName: TDBEditEh
    Left = 86
    Top = 9
    Width = 360
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'NAME'
    DataSource = srcWork
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object edtHours: TDBNumberEditEh
    Left = 86
    Top = 38
    Width = 360
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
    Top = 120
    Width = 438
    Height = 132
    Hint = #1063#1090#1086' '#1089#1076#1077#1083#1072#1090#1100' '#1077#1089#1083#1080' '#1088#1072#1073#1086#1090#1072' '#1076#1086#1073#1072#1074#1083#1077#1085#1072' '#1074' '#1079#1072#1103#1074#1082#1091' '#1080' '#1079#1072#1103#1074#1082#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1072
    Anchors = [akLeft, akTop, akRight]
    Caption = ' '#1044#1077#1081#1089#1090#1074#1080#1103' '#1087#1086#1089#1083#1077' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '
    TabOrder = 4
    TabStop = True
    DesignSize = (
      438
      132)
    object lbl3: TLabel
      Left = 12
      Top = 25
      Width = 43
      Height = 13
      Caption = #1040#1090#1088#1080#1073#1091#1090
    end
    object lbl4: TLabel
      Left = 12
      Top = 53
      Width = 140
      Height = 13
      Caption = #1044#1086#1073#1072#1074#1083#1103#1090#1100' '#1088#1072#1079#1086#1074#1091#1102' '#1091#1089#1083#1091#1075#1091
    end
    object Label1: TLabel
      Left = 13
      Top = 80
      Width = 79
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076'. '#1091#1089#1083#1091#1075#1091
    end
    object lbl2: TLabel
      Left = 14
      Top = 106
      Width = 144
      Height = 13
      Caption = #1050#1072#1082#1086#1081' '#1091#1089#1083#1091#1075#1086#1081' '#1087#1086#1076#1082#1083'./'#1086#1090#1082#1083'.'
    end
    object cbATRAction: TDBComboBoxEh
      Left = 63
      Top = 22
      Width = 99
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
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object cbbAttribute: TDBLookupComboboxEh
      Left = 165
      Top = 22
      Width = 266
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'W_ATR_ID'
      DataSource = srcWork
      EmptyDataInfo.Text = #1044#1086#1073#1072#1074#1083#1103#1090#1100' '#1072#1090#1088#1080#1073#1091#1090
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcAttributes
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object cbService: TDBLookupComboboxEh
      Left = 165
      Top = 50
      Width = 266
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'AS_SERVICE'
      DataSource = srcWork
      DropDownBox.ListFieldNames = 'NAME'
      DropDownBox.ListSource = srcService
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1044#1086#1073#1072#1074#1083#1103#1090#1100' '#1088#1072#1079#1086#1074#1091#1102' '#1091#1089#1083#1091#1075#1091
      EditButtons = <>
      KeyField = 'SERVICE_ID'
      ListField = 'NAME'
      ListSource = srcService
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 2
      Visible = True
      OnChange = cbServiceChange
      OnEnter = cbServiceEnter
    end
    object lcbW_SRV: TDBLookupComboboxEh
      Left = 165
      Top = 77
      Width = 266
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'W_SRV'
      DataSource = srcWork
      DropDownBox.ListSource = srcServiceOn
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 20
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1050#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1086#1076#1082#1083#1102#1095#1080#1090#1100
      EditButtons = <>
      KeyField = 'SERVICE_ID'
      ListField = 'NAME'
      ListSource = srcServiceOn
      ParentShowHint = False
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 4
      Visible = True
      OnChange = lcbW_SRVChange
    end
    object lcbOnOffService: TDBLookupComboboxEh
      Left = 164
      Top = 103
      Width = 267
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'W_SRVONOFF'
      DataSource = srcWork
      DropDownBox.ListSource = srcOnOffService
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1050#1072#1082#1086#1081' '#1091#1089#1083#1091#1075#1086#1081' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100'/'#1086#1090#1082#1083#1102#1095#1072#1090#1100
      EditButtons = <>
      KeyField = 'SERVICE_ID'
      ListField = 'NAME'
      ListSource = srcOnOffService
      ParentShowHint = False
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 5
      Visible = True
    end
    object chkW_ONOFF: TDBCheckBoxEh
      Left = 98
      Top = 79
      Width = 64
      Height = 17
      Hint = 
        #1045#1089#1083#1080' '#1075#1072#1083#1086#1095#1082#1072' - '#1090#1086' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100', '#1077#1089#1083#1080' '#1085#1077#1090' - '#1086#1090#1082#1083#1102#1095#1072#1090#1100' '#1087#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1091#1102 +
        ' '#1091#1089#1083#1091#1075#1091'.'
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akRight]
      Caption = #1087#1086#1076#1082'/'#1086#1090#1082
      DataField = 'W_ONOFF'
      DataSource = srcWork
      DynProps = <>
      TabOrder = 3
      OnClick = chkW_ONOFFClick
    end
  end
  object dbckDefault: TDBCheckBoxEh
    Left = 8
    Top = 96
    Width = 438
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
  object ednW_COST: TDBNumberEditEh
    Left = 87
    Top = 69
    Width = 360
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
    Left = 32
    Top = 286
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
    OnNewRecord = dsWorkNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 29
    Top = 265
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
    Left = 364
    Top = 256
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
    Left = 405
    Top = 260
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
      '        and (O_DELETED = 0'
      '          or exists(select'
      '                        w.W_ATR_ID'
      '                      from works w'
      '                      where w.w_id = :W_ID'
      '                            and w.W_ATR_ID = o.O_ID))'
      '  order by O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 223
    Top = 17
  end
  object srcAttributes: TDataSource
    AutoEdit = False
    DataSet = dsAttributes
    Left = 218
    Top = 68
  end
  object dsService: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    s.SERVICE_ID'
      '  , s.NAME||coalesce('#39' / '#39'||(select'
      '         t.tarif_sum'
      '       from tarif t'
      '       where t.service_id = s.service_id'
      
        '             and localtimestamp between t.date_from and t.date_t' +
        'o), '#39#39') as NAME'
      '  , s.SHORTNAME'
      '  , s.DESCRIPTION'
      '  , s.DIMENSION'
      '  , s.srv_type_id'
      '  from SERVICES S'
      '  where s.srv_type_id = 1'
      '        and (exists(select'
      '                        sl.Link_Id'
      '                      from SERVICES_LINKS sl'
      '                      where S.SERVICE_ID = sl.CHILD'
      '                            and sl.LINK_TYPE = 1)'
      '          or exists(select'
      '                        w.AS_SERVICE'
      '                      from works w'
      '                      where w.w_id = :W_ID'
      '                            and w.AS_SERVICE = s.Service_Id))'
      '  order by s.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 105
    Top = 261
  end
  object srcService: TDataSource
    DataSet = dsService
    Left = 108
    Top = 286
  end
  object srcOnOffService: TDataSource
    DataSet = dsOnOffService
    Left = 192
    Top = 266
  end
  object dsOnOffService: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct'
      '    s.SERVICE_ID'
      '  , s.Name || coalesce('#39' / '#39' ||'
      '    case s.Srv_Type_Id'
      '      when 2 then null'
      '      else (select first 1'
      
        '                iif((coalesce(t.Tarif_Sum, 0) = coalesce(t.TARIF' +
        '_SUM_JUR, 0)), coalesce(t.Tarif_Sum, 0), coalesce(t.Tarif_Sum, 0' +
        ') || '#39'/'#39' || coalesce(t.TARIF_SUM_JUR, 0))'
      '              from tarif t'
      '              where t.Service_Id = s.SERVICE_ID'
      
        '                    and current_date between t.Date_From and t.D' +
        'ate_To)'
      ''
      '    end, '#39#39') Name'
      '  from services s'
      '       inner join services_links l on (s.SERVICE_ID = l.CHILD)'
      '  where ('
      '          (:onoff = 1 and l.LINK_TYPE in (2, 3)) -- '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
      '          or'
      '          (:onoff = 0 and l.LINK_TYPE in (4, 5)) -- '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1077
      '        )'
      '        and l.PARENT = :FOR_SRV'
      '  order by s.NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 193
    Top = 289
  end
  object dsServiceON: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    S.Service_Id'
      '  , s.Name || coalesce('#39' / '#39' ||'
      '    case s.Srv_Type_Id'
      '      when 2 then null'
      '      else (select'
      
        '                iif((coalesce(t.Tarif_Sum, 0) = coalesce(t.TARIF' +
        '_SUM_JUR, 0)), coalesce(t.Tarif_Sum, 0), coalesce(t.Tarif_Sum, 0' +
        ') || '#39'/'#39' || coalesce(t.TARIF_SUM_JUR, 0))'
      '              from tarif t'
      '              where t.Service_Id = s.Service_Id'
      
        '                    and current_date between t.Date_From and t.D' +
        'ate_To)'
      ''
      '    end, '#39#39') Name'
      '  from SERVICES S'
      '  where exists(select'
      '                   sl.Link_Id'
      '                 from SERVICES_LINKS sl'
      '                 where S.SERVICE_ID = sl.CHILD'
      '                       and sl.LINK_TYPE = 0)'
      '          or exists(select'
      '                        w.W_SRV'
      '                      from works w'
      '                      where w.w_id = :W_ID'
      '                            and w.W_SRV = s.Service_Id)'
      '  order by s.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 286
    Top = 251
  end
  object srcServiceOn: TDataSource
    DataSet = dsServiceON
    Left = 286
    Top = 293
  end
end
