object CustomerLanForm: TCustomerLanForm
  Left = 593
  Top = 259
  ActiveControl = dbleEquipment
  Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1057#1055#1044
  ClientHeight = 337
  ClientWidth = 534
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    534
    337)
  PixelsPerInch = 96
  TextHeight = 13
  inline OkCancelFrame: TOkCancelFrame
    Left = 0
    Top = 302
    Width = 534
    Height = 35
    Align = alBottom
    TabOrder = 2
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 75
      Top = 6
      Width = 363
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ModalResult = 0
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 444
      Top = 6
      Width = 85
      OnClick = OkCancelFrame1bbCancelClick
    end
  end
  object GroupBox2: TPanel
    Left = 0
    Top = 35
    Width = 534
    Height = 181
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      534
      181)
    object Label4: TLabel
      Left = 8
      Top = 33
      Width = 25
      Height = 13
      Caption = #1055#1086#1088#1090
    end
    object Label2: TLabel
      Left = 8
      Top = 107
      Width = 22
      Height = 13
      Caption = 'MAC'
    end
    object Label1: TLabel
      Left = 8
      Top = 83
      Width = 10
      Height = 13
      Caption = 'IP'
    end
    object lbl3: TLabel
      Left = 8
      Top = 58
      Width = 25
      Height = 13
      Caption = #1057#1077#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 8
      Width = 45
      Height = 13
      Hint = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1102
      Caption = #1055#1086#1076#1082#1083'. '#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel
      Left = 8
      Top = 132
      Width = 22
      Height = 13
      Caption = 'IPv6'
    end
    object lbl2: TLabel
      Left = 8
      Top = 157
      Width = 20
      Height = 13
      Hint = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1076#1083#1103' '#1074#1085#1091#1090#1088#1077#1085#1085#1086#1075#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1103
      Caption = 'TAG'
    end
    object ePort: TDBNumberEditEh
      Left = 75
      Top = 30
      Width = 454
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PORT'
      DataSource = srcLan
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1087#1086#1088#1090#1091
      EditButton.Visible = True
      EditButtons = <>
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnExit = ePortExit
    end
    object eMAC: TDBEditEh
      Left = 75
      Top = 104
      Width = 454
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      DataField = 'MAC'
      DataSource = srcLan
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'MAC '#1072#1076#1088#1077#1089
      ShowHint = True
      TabOrder = 4
      Visible = True
      OnEnter = eMACEnter
      OnExit = eMACExit
      EditMask = ''
    end
    object eIP: TDBEditEh
      Left = 75
      Top = 80
      Width = 454
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'IP'
      DataSource = srcLan
      DynProps = <>
      EditButtons = <
        item
          Hint = #1053#1072#1081#1090#1080' IP'
          Style = ebsEllipsisEh
          OnClick = eIPEditButtons0Click
        end>
      EmptyDataInfo.Text = 'IP '#1072#1076#1088#1077#1089
      ShowHint = True
      TabOrder = 3
      Visible = True
      OnEnter = eIPEnter
      OnExit = eIPExit
    end
    object dbleVLAN: TDBLookupComboboxEh
      Left = 75
      Top = 55
      Width = 454
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'VLAN_ID'
      DataSource = srcLan
      DropDownBox.Columns = <
        item
          FieldName = 'NAME'
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Width = 57
        end
        item
          FieldName = 'IP_BEGIN'
          Title.Caption = 'IP c'
        end
        item
          FieldName = 'IP_END'
          Title.Caption = 'IP '#1076#1086
        end
        item
          FieldName = 'C_CNT'
          Title.Caption = #1055#1086#1076#1082'. '#1072#1073#1086#1085'.'
          Width = 30
        end
        item
          FieldName = 'E_CNT'
          Title.Caption = #1055#1086#1076#1082'. '#1086#1073#1086#1088'.'
          Width = 30
        end>
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1042' '#1082#1072#1082#1086#1081' '#1089#1077#1090#1080' '#1088#1072#1073#1086#1090#1072#1077#1090
      EditButtons = <>
      KeyField = 'V_ID'
      ListField = 'NAME'
      ListSource = srcVLANS
      ShowHint = True
      TabOrder = 2
      Visible = True
      OnDropDownBoxGetCellParams = dbleVLANDropDownBoxGetCellParams
    end
    object dbleEquipment: TDBLookupComboboxEh
      Left = 75
      Top = 5
      Width = 454
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'EQ_ID'
      DataSource = srcLan
      DropDownBox.Columns = <
        item
          FieldName = 'NAME'
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Width = 90
        end
        item
          FieldName = 'STREET_NAME'
          Title.Caption = #1059#1083#1080#1094#1072
          Width = 60
        end
        item
          AutoFitColWidth = False
          FieldName = 'HOUSE_NO'
          Title.Caption = #1044#1086#1084
          Width = 35
        end
        item
          AutoFitColWidth = False
          FieldName = 'PORCH_N'
          Title.Caption = #1055'-'#1076
          Width = 20
        end
        item
          AutoFitColWidth = False
          FieldName = 'FLOOR_N'
          Title.Caption = #1069#1058'.'
          Width = 20
        end
        item
          AutoFitColWidth = False
          FieldName = 'PLACE'
          Title.Caption = #1052#1077#1089#1090#1086
          Width = 20
        end
        item
          AutoFitColWidth = False
          FieldName = 'IP'
          Width = 80
        end
        item
          AutoFitColWidth = False
          FieldName = 'MAC'
          Width = 100
        end>
      DropDownBox.ListSource = srcEQ
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
      DropDownBox.SortLocal = True
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1091
      EditButtons = <
        item
          ShortCut = 45
          Style = ebsPlusEh
          OnClick = dbleEquipmentEditButtons0Click
        end
        item
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000232E0000232E00000000000000000001ECECECFAFAFA
            FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFDBDBDB5D5D5DA2A2A2F4F4F4FEFEFEFEFEFEFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8
            3636364C4C4CE7E7E7FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFEFEFEF8F8F85151519898988A8A8AACACACFFFFFFFD
            FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            EDEDED8B8B8B3E3E3E343434B1B1B1FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFB9B9B9393939404040343434B0
            B0B0FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FEFEFEFFFFFFBFBFBF373737404040343434B2B2B2FFFFFFFDFDFDFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFBEBEBE36363640
            4040343434B1B1B1FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFDFDFDFFFFFFC1C1C1373737404040343434AFAFAFFFFFFFFDFD
            FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFC1
            C1C1363636404040343434AFAFAFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFBEBEBE353535404040353535B1B1
            B1FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
            FEFEFFFFFFBFBFBF363636424242343434B2B2B2FFFFFFFDFDFDFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFC1C1C13333334A4A
            4AA7A7A7C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFDFDFDFFFFFFBFBFBFA9A9A9797979323232EEEEEEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFD7D7
            D73A3A3A848484FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFC9C9C9FAFAFAFFFFFF}
          ShortCut = 113
          Style = ebsGlyphEh
          Visible = False
          OnClick = dbleEquipmentEditButtons1Click
        end>
      KeyField = 'EID'
      ListField = 'NAME'
      ListSource = srcEQ
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnChange = dbleEquipmentChange
      OnDropDownBoxGetCellParams = dbleEquipmentDropDownBoxGetCellParams
      OnExit = dbleEquipmentExit
    end
    object eIPv6: TDBEditEh
      Left = 75
      Top = 129
      Width = 454
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecLowerCase
      DataField = 'IPV6'
      DataSource = srcLan
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'IPv6 '#1072#1076#1088#1077#1089
      ShowHint = True
      TabOrder = 5
      Visible = True
      OnEnter = eIPv6Enter
      OnExit = eIPv6Exit
      EditMask = ''
    end
    object edtTAGSTR: TDBEditEh
      Left = 200
      Top = 154
      Width = 329
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecLowerCase
      DataField = 'TAG_STR'
      DataSource = srcLan
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1086#1080#1079#1074#1086#1083#1100#1085#1072#1103' '#1090#1077#1082#1089#1090#1086#1074#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '
      ShowHint = True
      TabOrder = 7
      Visible = True
      EditMask = ''
    end
    object edtTAG: TDBNumberEditEh
      Left = 75
      Top = 154
      Width = 120
      Height = 21
      DataField = 'TAG'
      DataSource = srcLan
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = #1062#1080#1092#1088#1086#1074#1072#1103' '#1080#1085#1092'.'
      EditButtons = <>
      ShowHint = True
      TabOrder = 6
      Visible = True
    end
  end
  object btn1: TButton
    Left = 8
    Top = 308
    Width = 55
    Height = 23
    Anchors = [akLeft, akBottom]
    Caption = 'CMD'
    DropDownMenu = pmLanPopUp
    TabOrder = 3
    OnClick = btn1Click
  end
  object pnlAddres: TPanel
    Left = 0
    Top = 0
    Width = 534
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      534
      35)
    object Label3: TLabel
      Left = 7
      Top = 10
      Width = 31
      Height = 13
      Caption = #1059#1083#1080#1094#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 316
      Top = 10
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1044#1086#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 413
      Top = 10
      Width = 31
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1052#1077#1089#1090#1086
    end
    object LupStreets: TDBLookupComboboxEh
      Left = 74
      Top = 7
      Width = 238
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'STREET_ID'
      DataSource = srcLan
      DropDownBox.Columns = <
        item
          FieldName = 'STREET_NAME'
          Title.Caption = #1059#1083#1080#1094#1072
        end
        item
          FieldName = 'AREA_NAME'
          Title.Caption = #1056#1072#1081#1086#1085
        end>
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1059#1083#1080#1094#1072', '#1077#1089#1083#1080' '#1086#1090#1083#1080#1095#1072#1077#1090#1089#1103' '#1086#1090' '#1072#1076#1088#1077#1089#1072' '#1072#1073#1086#1085#1077#1085#1090#1072
      EditButtons = <>
      KeyField = 'STREET_ID'
      ListField = 'STREET_NAME'
      ListSource = srcStreet
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object lcbHOUSE_ID: TDBLookupComboboxEh
      Left = 341
      Top = 7
      Width = 68
      Height = 21
      Anchors = [akTop, akRight]
      DynProps = <>
      DataField = 'HOUSE_ID'
      DataSource = srcLan
      EmptyDataInfo.Text = #1044#1086#1084
      EditButtons = <>
      KeyField = 'HOUSE_ID'
      ListField = 'HOUSE_NO'
      ListSource = srcHouse
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnChange = lcbHOUSE_IDChange
    end
    object edtPLACE: TDBEditEh
      Tag = 7
      Left = 447
      Top = 7
      Width = 84
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'PLACE'
      DataSource = srcLan
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1052#1077#1089#1090#1086'/'#1050#1074#1072#1088#1090#1080#1088#1072
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
  end
  object pnlMemo: TPanel
    Left = 0
    Top = 216
    Width = 534
    Height = 86
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object mmoNOTICE: TDBMemoEh
      Left = 0
      Top = 0
      Width = 534
      Height = 86
      Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      Align = alClient
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcLan
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 0
      Visible = True
      WantReturns = True
    end
  end
  object srcLan: TDataSource
    DataSet = dsLAN
    Left = 28
    Top = 242
  end
  object dsLAN: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE TV_LAN'
      'SET '
      '    CUSTOMER_ID = :CUSTOMER_ID,'
      '    IP = :IP,'
      '    MAC = :MAC,'
      '    IP_ADD = :IP_ADD,'
      '    PORT = :PORT,'
      '    NOTICE = :NOTICE,'
      '    EQ_ID = :EQ_ID,'
      '    VLAN_ID = :VLAN_ID,'
      '    TAG = :TAG,'
      '    TAG_STR = :TAG_STR,'
      '    IPV6 = :IPV6,'
      '    HOUSE_ID = :HOUSE_ID,'
      '    PLACE = :PLACE'
      'WHERE'
      '    LAN_ID = :OLD_LAN_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TV_LAN'
      'WHERE'
      '        LAN_ID = :OLD_LAN_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO TV_LAN('
      '    LAN_ID,'
      '    CUSTOMER_ID,'
      '    IP,'
      '    MAC,'
      '    IP_ADD,'
      '    PORT,'
      '    NOTICE,'
      '    EQ_ID,'
      '    VLAN_ID,'
      '    TAG,'
      '    TAG_STR ,'
      '    IPV6,'
      '    HOUSE_ID,'
      '    PLACE'
      ')'
      'VALUES('
      '    :LAN_ID,'
      '    :CUSTOMER_ID,'
      '    :IP,'
      '    :MAC,'
      '    :IP_ADD,'
      '    :PORT,'
      '    :NOTICE,'
      '    :EQ_ID,'
      '    :VLAN_ID,'
      '    :TAG,'
      '    :TAG_STR,'
      '    :IPV6,'
      '    :HOUSE_ID,'
      '    :PLACE    '
      ')')
    RefreshSQL.Strings = (
      'select'
      '    f.*'
      '  , h.Street_Id'
      '  from TV_LAN f'
      '       left outer join house h on (h.House_Id = f.House_Id)'
      'where    F.LAN_ID = :OLD_LAN_ID')
    SelectSQL.Strings = (
      'select'
      '    f.*'
      '  , h.Street_Id'
      '  from TV_LAN f'
      '       left outer join house h on (h.House_Id = f.House_Id)'
      '  where f.LAN_ID = :LAN_ID   ')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DISCOUNT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 40
    Top = 248
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcVLANS: TDataSource
    DataSet = dsVlans
    Left = 94
    Top = 234
  end
  object dsVlans: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      ''
      '    ')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    coalesce((select'
      '                  1'
      '                from objects_coverage oc'
      
        '                     inner join customer c on (c.house_id = oc.h' +
        'ouse_id)'
      '                where oc.oc_type = 2'
      '                      and c.customer_id = :CUSTOMER_ID'
      '                      and (v.v_id = oc.o_id)), 2) as finded'
      '  , v.v_id'
      
        '  , v.name || coalesce('#39' / '#39'||v.ip_begin||'#39'-'#39'||v.ip_end, '#39#39') nam' +
        'e'
      '  , v.ip_begin'
      '  , v.ip_end'
      '  , l.C_CNT'
      '  , e.E_CNT'
      '  from vlans v'
      '       left outer join(select'
      '                           Vlan_Id'
      '                         , count(*) C_CNT'
      '                         from Tv_Lan'
      '                         group by 1) l on (l.Vlan_Id = v.V_Id)'
      '       left outer join(select'
      '                           Vlan_Id'
      '                         , count(*) E_CNT'
      '                         from Equipment'
      '                         group by 1) e on (e.Vlan_Id = v.V_Id)'
      '  where (coalesce(v.for_objects, 0) = 0'
      '          or (coalesce(v.for_objects, 0) = 1))'
      '  order by 1, 2')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 102
    Top = 247
  end
  object srcEQ: TDataSource
    DataSet = dsEQ
    Left = 151
    Top = 244
  end
  object dsEQ: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      ''
      '    ')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    1 as FINDED'
      '  , E.EID'
      '  , E.NAME'
      '  , E.IP'
      '  , E.VLAN_ID'
      '  , S.STREET_NAME'
      '  , H.HOUSE_NO'
      '  , E.PLACE'
      '  , E.MAC'
      '  , E.PORCH_N'
      '  , E.FLOOR_N'
      '  from EQUIPMENT E'
      '       inner join HOUSE H on (H.HOUSE_ID = E.HOUSE_ID)'
      '       inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      '  where E.EQ_TYPE = 1'
      '        and ('
      '            (exists(select'
      '                         EC.HOUSE_ID'
      '                       from EQUIPMENT_COVERAGE ec'
      '                       where EC.EID = E.EID'
      '                             and ec.House_Id = :House_Id))'
      ''
      '             or (exists(select'
      '                         L.EQ_ID'
      '                       from TV_LAN L'
      '                       where L.CUSTOMER_ID = :CUSTOMER_ID'
      '                             and L.EQ_ID = E.EID))'
      '           )'
      ''
      '  order by 1 desc, 3')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 202
    Top = 247
    oFetchAll = True
  end
  object actlst1: TActionList
    Left = 298
    Top = 247
    object actFindIP: TAction
      Caption = #1053#1072#1081#1090#1080' IP'
      Hint = #1053#1072#1081#1090#1080' '#1089#1074#1086#1073#1086#1076#1085#1099#1081' IP (F7)'
      ImageIndex = 7
      ShortCut = 118
    end
  end
  object cnError: TCnErrorProvider
    DoubleBuffer = False
    Left = 360
    Top = 240
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
    Left = 248
    Top = 106
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
    Left = 288
    Top = 122
  end
  object pmLanPopUp: TPopupMenu
    Left = 101
    Top = 96
  end
  object ActListEQ: TActionList
    Left = 194
    Top = 81
    object ActLanPing: TAction
      Caption = 'ActLanPing'
      Hint = 'PING IP adress'
      OnExecute = ActLanPingExecute
    end
    object actLanTelnet: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' IP '#1074' '#1090#1077#1083#1085#1077#1090
      OnExecute = actLanTelnetExecute
    end
    object actLanHttp: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077' IP'
      OnExecute = actLanHttpExecute
    end
  end
  object dsStreets: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT s.street_id, s.street_name||'#39' '#39'||s.street_short street_na' +
        'me, a.area_name'
      'FROM STREET s left outer join area a on (a.area_id = s.area_id)'
      'ORDER BY STREET_NAME, a.area_name')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 373
    Top = 119
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 432
    Top = 115
  end
  object srcHouse: TDataSource
    DataSet = dsHomes
    Left = 427
    Top = 81
  end
  object dsHomes: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    H.HOUSE_ID,'
      '    H.STREET_ID,'
      '    H.HOUSE_NO,'
      '    H.Q_FLAT'
      'FROM'
      '    HOUSE H'
      'where h.street_id = :street_id'
      'order by h.HOUSE_NO'
      '')
    Transaction = trRead
    Database = dmMain.dbTV
    DataSource = srcStreet
    Left = 370
    Top = 81
  end
end
