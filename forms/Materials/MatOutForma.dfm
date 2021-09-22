object MatOutForm: TMatOutForm
  ShowHint = True
  Left = 0
  Top = 0
  ActiveControl = edQuant
  Caption = #1057#1087#1080#1089#1072#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
  ClientHeight = 211
  ClientWidth = 444
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
  DesignSize = (
    444
    211)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 7
    Top = 39
    Width = 60
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object lbl4: TLabel
    Left = 7
    Top = 68
    Width = 89
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
  end
  object lbl5: TLabel
    Left = 225
    Top = 68
    Width = 84
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083#1072#1076#1085#1086#1081
  end
  object lbl7: TLabel
    Left = 7
    Top = 102
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object lbl1: TLabel
    Left = 8
    Top = 11
    Width = 50
    Height = 13
    Caption = #1052#1072#1090#1077#1088#1080#1072#1083
  end
  inline frmOK: TOkCancelFrame
    Left = 0
    Top = 176
    Width = 444
    Height = 35
    Align = alBottom
    TabOrder = 5
    TabStop = True
    inherited bbOk: TBitBtn
      Left = 281
      Top = 6
      Enabled = False
    end
    inherited bbCancel: TBitBtn
      Left = 362
      Top = 6
    end
  end
  object cbWH: TDBLookupComboboxEh
    Left = 98
    Top = 8
    Width = 338
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'MI_ID'
    DataSource = srcMO
    DropDownBox.Columns = <
      item
        FieldName = 'NAME'
      end
      item
        FieldName = 'MI_COST'
      end
      item
        FieldName = 'WH'
      end>
    DropDownBox.Sizable = True
    EditButtons = <>
    KeyField = 'MI_ID'
    ListField = 'NAME'
    ListSource = srcMW
    TabOrder = 0
    Visible = True
    OnExit = cbWHExit
  end
  object edDate: TDBDateTimeEditEh
    Left = 315
    Top = 65
    Width = 121
    Height = 21
    DataField = 'DOC_DATE'
    DataSource = srcMO
    DynProps = <>
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 3
    Visible = True
  end
  object edQuant: TDBNumberEditEh
    Left = 98
    Top = 37
    Width = 121
    Height = 21
    DataField = 'MO_QUANT'
    DataSource = srcMO
    DecimalPlaces = 5
    DynProps = <>
    EditButton.Visible = True
    EditButtons = <>
    TabOrder = 1
    Visible = True
    OnExit = cbWHExit
  end
  object edNumber: TDBEditEh
    Left = 98
    Top = 65
    Width = 121
    Height = 21
    DataField = 'DOC_N'
    DataSource = srcMO
    DynProps = <>
    EditButtons = <>
    TabOrder = 2
    Visible = True
  end
  object dbmNotice: TDBMemoEh
    Left = 100
    Top = 102
    Width = 338
    Height = 70
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataField = 'MO_NOTICE'
    DataSource = srcMO
    TabOrder = 4
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
    Left = 151
    Top = 121
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
    Left = 340
    Top = 130
  end
  object dsMO: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE MATERIALS_OUTLAY'
      'SET '
      '    M_ID = :M_ID,'
      '    MI_ID = :MI_ID,'
      '    MO_QUANT = :MO_QUANT,'
      '    MO_DATE = :MO_DATE,'
      '    DOC_N = :DOC_N,'
      '    DOC_DATE = :DOC_DATE,'
      '    MO_NOTICE = :MO_NOTICE,'
      '    DOC_ID = :DOC_ID'
      'WHERE'
      '    MO_ID = :OLD_MO_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    MATERIALS_OUTLAY'
      'WHERE'
      '        MO_ID = :OLD_MO_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO MATERIALS_OUTLAY('
      '    M_ID,'
      '    MI_ID,'
      '    MO_QUANT,'
      '    MO_DATE,'
      '    DOC_N,'
      '    DOC_DATE,'
      '    MO_NOTICE,'
      '    DOC_ID'
      ')'
      'VALUES('
      '    :M_ID,'
      '    :MI_ID,'
      '    :MO_QUANT,'
      '    :MO_DATE,'
      '    :DOC_N,'
      '    :DOC_DATE,'
      '    :MO_NOTICE,'
      '    :DOC_ID'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    MO_ID,'
      '    M_ID,'
      '    MI_ID,'
      '    MO_QUANT,'
      '    MO_DATE,'
      '    DOC_N,'
      '    DOC_DATE,'
      '    MO_NOTICE,'
      '    DOC_ID'
      '    from MATERIALS_OUTLAY'
      'where(  MO_ID = :MO_ID'
      '     ) and (     MATERIALS_OUTLAY.MO_ID = :OLD_MO_ID'
      '     )'
      '        ')
    SelectSQL.Strings = (
      'select'
      '    MO_ID,'
      '    M_ID,'
      '    MI_ID,'
      '    MO_QUANT,'
      '    MO_DATE,'
      '    DOC_N,'
      '    DOC_DATE,'
      '    MO_NOTICE,'
      '    DOC_ID'
      '    from MATERIALS_OUTLAY'
      'where MO_ID = :MO_ID    ')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_OUTLAY'
    AutoUpdateOptions.KeyFields = 'MO_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trReadQ
    Database = dmMain.dbTV
    UpdateTransaction = trWriteQ
    AutoCommit = True
    Left = 55
    Top = 129
  end
  object dsMW: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT '
      
        '  m.name || '#39' ('#1086#1089#1090'-'#1082' '#39'||cast(mi.remains as varchar(20))||'#39')'#39' as ' +
        'name,'
      '  mi.*,'
      '  o.o_name as WH'
      'from materials_income mi'
      '  inner join objects o on ( o.o_id = mi.WH_ID and o.o_type = 10)'
      '  inner join materials m on (m.m_id = mi.m_id)'
      'where mi.m_id = :M_ID and mi.remains > 0'
      
        ' and ( exists(select w.wh_id from SYS$USER u inner join sys' +
        '$user_wh w on (w.user_id = u.id)'
      
        ' where w.wh_id = mi.WH_ID and u.ibname = current_user and w.can_view = 1) or current_us' +
        'er = '#39'SYSDBA'#39')'
      'order by mi.mi_date desc')
    Transaction = trReadQ
    Database = dmMain.dbTV
    UpdateTransaction = trWriteQ
    AutoCommit = True
    Left = 237
    Top = 120
  end
  object srcMW: TDataSource
    DataSet = dsMW
    Left = 276
    Top = 116
  end
  object srcMO: TDataSource
    DataSet = dsMO
    Left = 21
    Top = 130
  end
end
