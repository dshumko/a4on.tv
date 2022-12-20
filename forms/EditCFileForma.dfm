object EditCFileForm: TEditCFileForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1060#1072#1081#1083' '#1072#1073#1086#1085#1077#1085#1090#1072
  ClientHeight = 310
  ClientWidth = 472
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 472
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      472
      89)
    object lblFileCh: TLabel
      Left = 8
      Top = 67
      Width = 26
      Height = 13
      Caption = #1060#1072#1081#1083
    end
    object lblFile: TLabel
      Left = 8
      Top = 12
      Width = 53
      Height = 13
      Caption = #1058#1080#1087' '#1092#1072#1081#1083#1072
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 73
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object edtFILE: TDBEditEh
      Left = 87
      Top = 64
      Width = 296
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'FILENAME'
      DataSource = srcCustFile
      DynProps = <>
      EditButtons = <
        item
          Hint = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083
          Style = ebsEllipsisEh
          OnClick = edtFILEEditButtons0Click
        end>
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1092#1072#1081#1083
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object btnScaner: TButton
      Left = 389
      Top = 64
      Width = 75
      Height = 21
      Hint = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1092#1072#1081#1083' '#1080' '#1089#1086#1093#1088#1072#1085#1080#1090#1100
      Anchors = [akTop, akRight]
      Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 3
      OnClick = btnScanerClick
    end
    object edtNAME: TDBEditEh
      Left = 87
      Top = 37
      Width = 377
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NAME'
      DataSource = srcCustFile
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' / '#1085#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object dbluFileType: TDBLookupComboboxEh
      Left = 87
      Top = 9
      Width = 377
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'CF_TYPE'
      DataSource = srcCustFile
      DropDownBox.ListSource = srcFiles
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      EmptyDataInfo.Text = #1058#1080#1087' '#1092#1072#1081#1083#1072
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcFiles
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnChange = dbluFileTypeChange
    end
  end
  object pnlClient: TPanel
    Left = 0
    Top = 171
    Width = 472
    Height = 139
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      472
      139)
    object btnCancel: TBitBtn
      Left = 389
      Top = 109
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 2
    end
    object btnOk: TBitBtn
      Left = 8
      Top = 109
      Width = 375
      Height = 26
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnOkClick
    end
    object memNotice: TDBMemoEh
      Left = 8
      Top = 2
      Width = 456
      Height = 101
      ScrollBars = ssVertical
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcCustFile
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 0
      Visible = True
      WantReturns = True
    end
  end
  object pnlAddons: TPanel
    Left = 0
    Top = 89
    Width = 472
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      472
      55)
    object lblOnOff: TLabel
      Left = 6
      Top = 7
      Width = 52
      Height = 13
      Caption = #1042#1082#1083'/'#1054#1090#1082#1083'.'
    end
    object edDate: TDBDateTimeEditEh
      Left = 85
      Top = 31
      Width = 121
      Height = 21
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnChange = edDateChange
    end
    object lcbService: TDBLookupComboboxEh
      Left = 85
      Top = 4
      Width = 379
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      EditButtons = <>
      KeyField = 'SERVICE_ID'
      ListField = 'NAME'
      ListSource = srcService
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = lcbServiceChange
    end
    object lcbOnOffSrv: TDBLookupComboboxEh
      Left = 212
      Top = 31
      Width = 252
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = srcOnOffService
      ShowHint = True
      TabOrder = 2
      Visible = True
      OnChange = lcbOnOffSrvChange
    end
  end
  object pnlContract: TPanel
    Left = 0
    Top = 144
    Width = 472
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    DesignSize = (
      472
      27)
    object lblContr: TLabel
      Left = 332
      Top = 8
      Width = 12
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1086#1090
      Visible = False
      ExplicitLeft = 285
    end
    object edtDogDate: TDBDateTimeEditEh
      Left = 350
      Top = 5
      Width = 115
      Height = 21
      Anchors = [akTop, akRight]
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 3
      Visible = False
    end
    object edtDogovor: TDBEditEh
      Left = 212
      Top = 5
      Width = 114
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 2
      Visible = False
    end
    object chkContract: TCheckBox
      Left = 8
      Top = 7
      Width = 105
      Height = 17
      Alignment = taLeftJustify
      Caption = #1053#1086#1074#1099#1081' '#1076#1086#1075#1086#1074#1086#1088
      TabOrder = 0
      OnClick = chkContractClick
    end
    object chkFOwner: TDBCheckBoxEh
      Left = 125
      Top = 7
      Width = 75
      Height = 17
      Hint = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '#1082#1074#1072#1088#1090#1080#1088#1099
      Alignment = taLeftJustify
      Caption = #1057#1086#1073#1089'-'#1082'. '#1082#1074'.'
      DynProps = <>
      TabOrder = 1
      Visible = False
      OnClick = chkFOwnerClick
    end
  end
  object srcFiles: TDataSource
    AutoEdit = False
    DataSet = dsFiles
    Left = 140
    Top = 12
  end
  object dsFiles: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED, O_CHARFIELD'
      'FROM OBJECTS'
      'WHERE O_TYPE = 33 AND O_DELETED = 0'
      'order BY O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 90
    Top = 10
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 83
    Top = 216
  end
  object dsCustFile: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CUSTOMER_FILES'
      'SET '
      '    CF_ID = :CF_ID,'
      '    NAME = :NAME,'
      '    CF_TYPE = :CF_TYPE,'
      '    NOTICE = :NOTICE,'
      '    CUSTOMER_ID = :CUSTOMER_ID,'
      '    Filename = :Filename,'
      '    Content = :Content    '
      'WHERE'
      '    CF_ID = :OLD_CF_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CUSTOMER_FILES('
      '    CF_ID,'
      '    NAME,'
      '    CF_TYPE,'
      '    NOTICE,'
      '    CUSTOMER_ID,'
      '    Filename,'
      '    Content'
      ')'
      'VALUES('
      '    :CF_ID,'
      '    :NAME,'
      '    :CF_TYPE,'
      '    :NOTICE,'
      '    :CUSTOMER_ID,'
      '    :Filename,'
      '    :Content'
      ')')
    SelectSQL.Strings = (
      'select'
      '    T.O_NAME'
      '  , CF.Cf_Id'
      '  , cf.Name'
      '  , cf.Cf_Type'
      '  , cf.Notice'
      '  , cf.Customer_Id'
      '  , cf.Filename'
      '  , cf.CONTENT'
      '  from CUSTOMER_FILES CF'
      
        '       inner join OBJECTS T on (CF.Cf_Type = T.O_ID and T.O_TYPE' +
        ' = 33)'
      '  where CF.CF_ID = :CF_ID'
      '  order by T.O_NAME, cf.Name')
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 28
    Top = 169
  end
  object srcCustFile: TDataSource
    AutoEdit = False
    DataSet = dsCustFile
    Left = 24
    Top = 217
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '*.*'
    Left = 288
    Top = 40
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write')
    TPBMode = tpbDefault
    Left = 377
    Top = 224
  end
  object PropStorageEh: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 378
    Top = 167
  end
  object dsService: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    s.Service_Id'
      '  , s.Name'
      '  , ss.State_Sgn'
      '  from services s'
      '       inner join SERVICES_LINKS sl on (S.SERVICE_ID = sl.CHILD)'
      
        '       left outer join Subscr_Serv ss on (ss.Serv_Id = s.Service' +
        '_Id and'
      '             ss.Customer_Id = :customer_id)'
      '  where sl.LINK_TYPE = 0'
      '        and s.Srv_Type_Id = 0'
      '        and s.Business_Type = :srv_type'
      '        and ('
      '          ((:STATE = 0) and (ss.State_Sgn = 1))'
      '          or'
      '          ((:STATE = 1) and (coalesce(ss.State_Sgn, 0) = 0))'
      '        )'
      '  order by s.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 142
    Top = 187
  end
  object srcService: TDataSource
    DataSet = dsService
    Left = 174
    Top = 213
  end
  object dsOnOffService: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    ID, DESCRIPTION, SERVICE_TYPE, s.Name || coalesce('#39' / '#39' ||'
      '    case s.SERVICE_TYPE'
      '      when 2 then null'
      '      else (select'
      
        '                iif((coalesce(t.Tarif_Sum, 0) = coalesce(t.TARIF' +
        '_SUM_JUR, 0)), coalesce(t.Tarif_Sum, 0), coalesce(t.Tarif_Sum, 0' +
        ') || '#39'/'#39' || coalesce(t.TARIF_SUM_JUR, 0))'
      '              from tarif t'
      '              where t.Service_Id = s.ID'
      
        '                    and current_date between t.Date_From and t.D' +
        'ate_To)'
      ''
      '    end, '#39#39') Name'
      
        '  from selectonoffservice(:customer_id, :service_id, :subscr_ser' +
        'v_id, :off) s')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcService
    Left = 257
    Top = 161
  end
  object srcOnOffService: TDataSource
    DataSet = dsOnOffService
    Left = 256
    Top = 218
  end
end
