object RequestMaterialReturn: TRequestMaterialReturn
  Left = 0
  Top = 0
  Caption = #1042#1086#1079#1074#1088#1072#1090' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
  ClientHeight = 269
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    444
    269)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 8
    Top = 38
    Width = 90
    Height = 13
    Caption = #1042#1077#1088#1085#1091#1090#1100' '#1085#1072' '#1089#1082#1083#1072#1076
  end
  object lbl1: TLabel
    Left = 8
    Top = 11
    Width = 89
    Height = 13
    Caption = #1052#1072#1090'-'#1083'/'#1054#1073#1086#1088#1091#1076'-'#1080#1077
  end
  object lbl3: TLabel
    Left = 8
    Top = 65
    Width = 60
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  object lbl4: TLabel
    Left = 240
    Top = 65
    Width = 54
    Height = 13
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
  end
  object lbl5: TLabel
    Left = 8
    Top = 92
    Width = 60
    Height = 13
    Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
  end
  object btnOk: TButton
    Left = 104
    Top = 236
    Width = 211
    Height = 25
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    ModalResult = 1
    TabOrder = 6
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 321
    Top = 236
    Width = 115
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 7
  end
  object ednCOST: TDBNumberEditEh
    Left = 312
    Top = 62
    Width = 121
    Height = 21
    DynProps = <>
    EmptyDataInfo.Text = #1062#1077#1085#1072
    EditButtons = <>
    TabOrder = 3
    Visible = True
  end
  object cbProp: TDBComboBoxEh
    Left = 104
    Top = 89
    Width = 332
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EmptyDataInfo.Text = #1053#1072#1095#1080#1089#1083#1103#1090#1100
    EditButtons = <>
    Items.Strings = (
      #1042#1086#1079#1074#1088#1072#1090' '#1073#1077#1089#1087#1083#1072#1090#1085#1086
      #1042#1086#1079#1074#1088#1072#1090' '#1079#1072' '#1076#1077#1085#1100#1075#1080' ('#1042#1099#1082#1091#1087')')
    KeyItems.Strings = (
      '4'
      '5')
    TabOrder = 4
    Visible = True
  end
  object lcb1: TDBLookupComboboxEh
    Left = 104
    Top = 8
    Width = 332
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    EmptyDataInfo.Text = #1052#1072#1090#1077#1088#1080#1072#1083
    EditButtons = <>
    TabOrder = 0
    Visible = True
  end
  object mmoNotice: TDBMemoEh
    Left = 8
    Top = 116
    Width = 428
    Height = 114
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    TabOrder = 5
    Visible = True
    WantReturns = True
  end
  object lcbWH: TDBLookupComboboxEh
    Left = 104
    Top = 35
    Width = 332
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    EmptyDataInfo.Text = #1042#1077#1088#1085#1091#1090#1100' '#1085#1072' '#1089#1082#1083#1072#1076
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcWH
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object ednQUANT: TDBNumberEditEh
    Left = 104
    Top = 62
    Width = 121
    Height = 21
    DynProps = <>
    EmptyDataInfo.Text = #1050#1086#1083'-'#1074#1086
    EditButtons = <>
    TabOrder = 2
    Visible = True
  end
  object dsAppliance: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    APPLIANCE'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    a.*'
      '  , o.O_Name'
      '  , case a.Property'
      '      when -1 then '#39'A'#1073#1086#1085#1077#1085#1090#1072' ('#1050#1091#1087#1083#1077#1085#1086' '#1089#1072#1084#1086#1089#1090#1086#1103#1090#1077#1083#1100#1085#1086')'#39'  '
      '      when 0 then '#39#1040#1073#1086#1085#1077#1085#1090#1072' ('#1055#1088#1086#1076#1072#1085')'#39
      '      when 1 then '#39#1050#1086#1084#1087#1072#1085#1080#1080' ('#1042' '#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1080')'#39
      '      when 2 then '#39#1040#1073#1086#1085#1077#1085#1090#1072' ('#1056#1072#1089#1089#1088#1086#1095#1082#1072')'#39
      '      when 3 then '#39#1050#1086#1084#1087#1072#1085#1080#1080' ('#1040#1088#1077#1085#1076#1072')'#39
      '      else a.Property'
      '    end Prop_TEXT,'
      '    coalesce(W.SURNAME, a.ADDED_BY) as WHO_ADD'
      '  from Appliance a'
      
        '       left outer join objects o on (o.O_Id = a.A_Type and o.O_T' +
        'ype = 48)'
      '       left outer join worker w on (w.Ibname = a.ADDED_BY)'
      '  where a.OWN_ID = :CUSTOMER_ID'
      '        and a.OWN_TYPE = 1'
      '  order by a.Name')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DISCOUNT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 18
    Top = 182
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcAppliance: TDataSource
    AutoEdit = False
    DataSet = dsAppliance
    Left = 70
    Top = 160
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
    Left = 116
    Top = 178
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
    Left = 160
    Top = 178
  end
  object dsWH: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID, O_NAME, O_DESCRIPTION'
      '  from OBJECTS o'
      '  where O_TYPE = 10'
      '        and ((exists(select'
      '                         w.wh_id'
      '                       from SYS$USER u'
      
        '                            inner join sys$user_wh w on (w.user_' +
        'id = u.id)'
      '                       where u.ibname = current_user'
      '                             and w.can_edit = 1'
      '                             and w.Wh_Id = o.O_Id))'
      '          or (current_user = '#39'SYSDBA'#39'))'
      ''
      '        and coalesce(o.O_Deleted, 0) = 0'
      '  order by O_NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 319
    Top = 153
  end
  object srcWH: TDataSource
    AutoEdit = False
    DataSet = dsWH
    Left = 384
    Top = 179
  end
end
