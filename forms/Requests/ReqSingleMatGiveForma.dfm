object ReqSingleMatGiveForm: TReqSingleMatGiveForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1042#1086#1079#1074#1088#1072#1090' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
  ClientHeight = 244
  ClientWidth = 419
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlB: TPanel
    Left = 0
    Top = 211
    Width = 419
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      419
      33)
    object btnCancel: TBitBtn
      Left = 290
      Top = 3
      Width = 121
      Height = 26
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TBitBtn
      Left = 8
      Top = 3
      Width = 276
      Height = 26
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      NumGlyphs = 2
      TabOrder = 0
      Visible = False
      OnClick = btnOkClick
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 419
    Height = 94
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      419
      94)
    object lbl3: TLabel
      Left = 8
      Top = 73
      Width = 35
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086
    end
    object lbl2: TLabel
      Left = 8
      Top = 46
      Width = 32
      Height = 13
      Caption = #1057#1082#1083#1072#1076
    end
    object lbl1: TLabel
      Left = 8
      Top = 19
      Width = 50
      Height = 13
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083
    end
    object lblDim: TLabel
      Left = 207
      Top = 73
      Width = 3
      Height = 13
    end
    object ednQ: TDBNumberEditEh
      Left = 80
      Top = 70
      Width = 121
      Height = 21
      DynProps = <>
      EmptyDataInfo.Text = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object lcbWH: TDBLookupComboboxEh
      Left = 80
      Top = 43
      Width = 331
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.Columns = <
        item
          FieldName = 'O_Name'
        end>
      DropDownBox.ListSource = srcWH
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      EmptyDataInfo.Text = #1042#1086#1079#1074#1088#1072#1090' '#1085#1072' '#1089#1082#1083#1072#1076
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_Name'
      ListSource = srcWH
      Style = csDropDownEh
      TabOrder = 1
      Visible = True
      OnChange = lcbEquipmentChange
    end
    object lcbEquipment: TDBLookupComboboxEh
      Left = 80
      Top = 16
      Width = 331
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.Columns = <
        item
          FieldName = 'EQ_NAME'
        end>
      DropDownBox.ListSource = srcMaterial
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      EmptyDataInfo.Text = #1052#1072#1090#1077#1088#1080#1072#1083'/'#1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'EQ_NAME'
      ListSource = srcMaterial
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnChange = lcbEquipmentChange
    end
  end
  object pnlClient: TPanel
    Left = 0
    Top = 121
    Width = 419
    Height = 90
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      419
      90)
    object mmoN: TDBMemoEh
      Left = 8
      Top = 3
      Width = 403
      Height = 85
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      TabOrder = 0
      Visible = True
      WantReturns = True
    end
  end
  object pnlByBack: TPanel
    Left = 0
    Top = 94
    Width = 419
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lblCost: TLabel
      Left = 8
      Top = 6
      Width = 26
      Height = 13
      Caption = #1062#1077#1085#1072
    end
    object ednCost: TDBNumberEditEh
      Left = 80
      Top = 3
      Width = 121
      Height = 21
      DynProps = <>
      EmptyDataInfo.Text = #1062#1077#1085#1072' '#1074#1099#1082#1091#1087#1072
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
  end
  object PropStorage: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 137
    Top = 153
  end
  object dsMaterial: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    APPLIANCE'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    NM.M_ID'
      '  , M.NAME || iif(NM.serial <> '#39#39', '#39'/'#39' || NM.serial, '#39#39') EQ_NAME'
      '  , M.COST'
      '  , M.DIMENSION'
      '  , NM.serial'
      '  , NM.QNT Quant'
      '  , NM.M_ID||'#39'.'#39'||NM.serial ID'
      '  from (select'
      '            M_ID'
      '          , serial'
      '          , sum(MT * coalesce(QUANT, 0)) QNT'
      ''
      '          from (select'
      '                    RM.M_ID'
      '                  , RM.RM_QUANT QUANT'
      '                  , 1 as MT'
      '                  , coalesce(RM.Serial, '#39#39') SERIAL'
      '                  from REQUEST R'
      
        '                       inner join REQUEST_MATERIALS RM on (R.RQ_' +
        'ID = RM.RQ_ID)'
      '                  where ((:OWNER_TYPE = 2)'
      '                        and (R.NODE_ID = :OWNER_ID))'
      '                          or ((:OWNER_TYPE = 1)'
      '                        and (R.Rq_Customer = :OWNER_ID))'
      '                union all'
      '                select'
      '                    RM.M_ID'
      '                  , RM.QUANT QUANT'
      '                  , -1 as MT'
      '                  , coalesce(RM.Serial, '#39#39') SERIAL'
      '                  from REQUEST R'
      
        '                       inner join REQUEST_MATERIALS_RETURN RM on' +
        ' (R.RQ_ID = RM.RQ_ID)'
      '                  where ((:OWNER_TYPE = 2)'
      '                        and (R.NODE_ID = :OWNER_ID))'
      '                          or ((:OWNER_TYPE = 1)'
      '                        and (R.Rq_Customer = :OWNER_ID))'
      '                        --'
      '          )'
      '          group by 1, 2) NM'
      '       inner join MATERIALS M on (M.M_ID = NM.M_ID)'
      '  where QNT > 0'
      '        -- '#1091#1073#1077#1088#1077#1084' '#1090#1086' '#1095#1090#1086' '#1072#1073#1086#1085#1077#1085#1090#1091' '#1087#1088#1086#1076#1072#1085#1086
      '        and ('
      '          ('
      '            (:ByBack = 1)'
      '            and '
      '            (exists(select'
      '                           a.Id'
      ''
      '                         from Appliance a'
      '                         where a.OWN_ID = :OWNER_ID'
      '                               and a.OWN_TYPE = :OWNER_TYPE'
      '                               and a.Property in ('
      '                                                      -1, 0, 2'
      '                                                     )'
      '                               and a.Serial = nm.Serial'
      '                               and a.M_Id = nm.M_ID'
      ''
      '           ))'
      '         )'
      '         or'
      '          ('
      '            (:ByBack = 0)'
      '            and '
      '            (not exists(select'
      '                           a.Id'
      ''
      '                         from Appliance a'
      '                         where a.OWN_ID = :OWNER_ID'
      '                               and a.OWN_TYPE = :OWNER_TYPE'
      '                               and a.Property in ('
      '                                                      -1, 0, 2'
      '                                                     )'
      '                               and a.Serial = nm.Serial'
      '                               and a.M_Id = nm.M_ID'
      ''
      '           ))'
      '         )'
      '         '
      '        )'
      '        -- '#1091#1073#1077#1088#1077#1084' '#1090#1086' '#1095#1090#1086' '#1091#1078#1077' '#1074' '#1074#1086#1079#1074#1088#1072#1090#1077
      '        and not exists(select'
      '                           rr.Id'
      '                         from Request_Materials_Return rr'
      '                         where rr.Rq_Id = :Rq_Id'
      '                               and rr.M_Id = nm.M_Id'
      
        '                               and coalesce(rr.Serial, '#39#39') = coa' +
        'lesce(nm.Serial, '#39#39'))  '
      '  order by 2')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DISCOUNT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 322
    Top = 150
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcMaterial: TDataSource
    AutoEdit = False
    DataSet = dsMaterial
    Left = 358
    Top = 160
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 64
    Top = 157
  end
  object dsWH: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    APPLIANCE'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    w.O_Id'
      '  , w.O_Name'
      '  from OBJECTS W'
      '  where W.O_TYPE = 10'
      '        and w.O_Deleted = 0'
      '        and (exists(select'
      '                        wh.wh_id'
      '                      from SYS$USER u'
      
        '                           inner join sys$user_wh wh on (wh.user' +
        '_id = u.id)'
      '                      where u.ibname = current_user'
      '                            and wh.can_view = 1'
      '                            and wh.wh_id = w.O_Id)'
      '          or current_user = '#39'SYSDBA'#39')'
      '  order by w.O_Name')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DISCOUNT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    BeforeOpen = dsWHBeforeOpen
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 218
    Top = 158
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcWH: TDataSource
    AutoEdit = False
    DataSet = dsWH
    Left = 262
    Top = 160
  end
end
