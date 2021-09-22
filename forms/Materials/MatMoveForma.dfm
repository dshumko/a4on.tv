object MatMoveForm: TMatMoveForm
  ShowHint = True
  Left = 0
  Top = 0
  ActiveControl = edQuant
  BorderStyle = bsDialog
  Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
  ClientHeight = 262
  ClientWidth = 450
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 7
    Top = 11
    Width = 46
    Height = 13
    Caption = #1053#1072' '#1089#1082#1083#1072#1076
  end
  object lbl2: TLabel
    Left = 7
    Top = 39
    Width = 60
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object lbl3: TLabel
    Left = 225
    Top = 39
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object lbl4: TLabel
    Left = 7
    Top = 96
    Width = 89
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
  end
  object lbl5: TLabel
    Left = 225
    Top = 96
    Width = 84
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
  end
  object lbl6: TLabel
    Left = 7
    Top = 124
    Width = 52
    Height = 13
    Caption = #1057#1086' '#1089#1082#1083#1072#1076#1072
  end
  object lbl7: TLabel
    Left = 7
    Top = 152
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object Label1: TLabel
    Left = 7
    Top = 67
    Width = 80
    Height = 13
    Caption = #1053#1086#1084#1077#1085#1082#1083'. '#1085#1086#1084#1077#1088
  end
  inline frmOK: TOkCancelFrame
    Left = 0
    Top = 227
    Width = 450
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
      Left = 230
      Top = 6
      Width = 124
      Enabled = False
    end
    inherited bbCancel: TBitBtn
      Left = 361
      Top = 6
    end
  end
  object cbWH: TDBLookupComboboxEh
    Left = 98
    Top = 8
    Width = 338
    Height = 21
    DynProps = <>
    DataField = 'WH_ID'
    DataSource = srcMW
    DropDownBox.Columns = <
      item
        FieldName = 'O_NAME'
      end
      item
        FieldName = 'O_DESCRIPTION'
        Width = 74
      end>
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcWH
    TabOrder = 0
    Visible = True
    OnExit = cbWHExit
  end
  object cbbFROM_WH: TDBLookupComboboxEh
    Left = 98
    Top = 121
    Width = 338
    Height = 21
    DynProps = <>
    DataField = 'FROM_WH'
    DataSource = srcMW
    DropDownBox.Columns = <
      item
        FieldName = 'O_NAME'
      end
      item
        FieldName = 'O_DESCRIPTION'
        Width = 74
      end>
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcFROMWH
    TabOrder = 6
    Visible = True
  end
  object edDate: TDBDateTimeEditEh
    Left = 315
    Top = 93
    Width = 121
    Height = 21
    DataField = 'DOC_DATE'
    DataSource = srcMW
    DynProps = <>
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 5
    Visible = True
  end
  object edQuant: TDBNumberEditEh
    Left = 98
    Top = 37
    Width = 121
    Height = 21
    DataField = 'MI_QUANT'
    DataSource = srcMW
    DecimalPlaces = 5
    DynProps = <>
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 2
    Visible = True
    OnExit = cbWHExit
  end
  object edCost: TDBNumberEditEh
    Left = 315
    Top = 36
    Width = 121
    Height = 21
    DataField = 'MI_COST'
    DataSource = srcMW
    DynProps = <>
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object edNumber: TDBEditEh
    Left = 98
    Top = 93
    Width = 121
    Height = 21
    DataField = 'DOC_N'
    DataSource = srcMW
    DynProps = <>
    EditButtons = <>
    TabOrder = 4
    Visible = True
  end
  object dbmNotice: TDBMemoEh
    Left = 98
    Top = 149
    Width = 338
    Height = 70
    DataField = 'MI_NOTICE'
    DataSource = srcMW
    TabOrder = 7
  end
  object DBEditEh1: TDBEditEh
    Left = 98
    Top = 64
    Width = 121
    Height = 21
    DataField = 'MI_NUMBER'
    DataSource = srcMW
    DynProps = <>
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object trReadQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 137
    Top = 173
  end
  object trWriteQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 356
    Top = 152
  end
  object dsWH: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID, O_NAME, O_DESCRIPTION'
      '  from OBJECTS o'
      '  where O_TYPE = 10'
      '        and (exists(select'
      '                          w.wh_id'
      '                        from SYS$USER u'
      
        '                             inner join sys$user_wh w on (w.user' +
        '_id = u.id)'
      '                        where w.wh_id = o.O_ID and u.ibname = current_user'
      '                              and w.can_edit = 1)'
      '          or (current_user = '#39'SYSDBA'#39'))'
      ''
      '    ')
    AfterOpen = dsWHAfterOpen
    Transaction = trReadQ
    Database = dmMain.dbTV
    UpdateTransaction = trWriteQ
    Left = 79
    Top = 169
  end
  object dsFROMWH: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select O_ID, O_NAME, O_DESCRIPTION from OBJECTS o where O_TYPE = 1' +
        '0'
      
        'and ( exists(select w.wh_id from SYS$USER u inner join sys$user' +
        '_wh w on (w.user_id = u.id)'
      
        'where w.wh_id = o.O_ID and u.ibname = current_user and w.can_edit = 1) or (current_us' +
        'er = '#39'SYSDBA'#39'))'
      '')
    Transaction = trReadQ
    Database = dmMain.dbTV
    UpdateTransaction = trWriteQ
    Left = 217
    Top = 164
  end
  object dsMW: TpFIBDataSet
    InsertSQL.Strings = (
      'execute procedure MATERIALSMOVMENT('
      ' :M_ID, '
      ' :WH_ID, '
      ' :MI_QUANT, '
      ' :MI_DATE, '
      ' :MI_COST, '
      ' :DOC_N, '
      ' :DOC_DATE, '
      ' :MI_NOTICE, '
      ' :FROM_WH, '
      ' :MI_NUMBER '
      ')')
    SelectSQL.Strings = (
      'select'
      '  M_ID,'
      '  WH_ID,'
      '  MI_QUANT,'
      '  MI_DATE,'
      '  MI_COST,'
      '  DOC_N,'
      '  DOC_DATE,'
      '  MI_NOTICE,'
      '  MI_NUMBER,'
      '  cast(null as Integer) as FROM_WH'
      'from MATERIALS_INCOME'
      'where M_ID = :M_ID')
    Transaction = trReadQ
    Database = dmMain.dbTV
    UpdateTransaction = trWriteQ
    AutoCommit = True
    Left = 23
    Top = 172
  end
  object srcMW: TDataSource
    DataSet = dsMW
    Left = 276
    Top = 146
  end
  object srcWH: TDataSource
    DataSet = dsWH
    Left = 235
    Top = 48
  end
  object srcFROMWH: TDataSource
    DataSet = dsFROMWH
    Left = 238
    Top = 93
  end
end
