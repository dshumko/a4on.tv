object OnOffServiceForm: TOnOffServiceForm
  Left = 513
  Top = 538
  BorderIcons = [biSystemMenu]
  Caption = #1042#1082#1083#1102#1095#1077#1085#1080#1077' / '#1074#1099#1082#1083#1102#1095#1077#1085#1080#1077' '#1091#1089#1083#1091#1075
  ClientHeight = 378
  ClientWidth = 424
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline OkCancelFrame: TOkCancelFrame
    Left = 0
    Top = 341
    Width = 424
    Height = 37
    Align = alBottom
    TabOrder = 9
    TabStop = True
    ExplicitTop = 341
    ExplicitWidth = 410
    ExplicitHeight = 37
    inherited bbOk: TBitBtn
      Left = 135
      Top = 6
      Width = 181
      Height = 25
      ModalResult = 0
      OnClick = OkCancelFramebbOkClick
      ExplicitLeft = 121
      ExplicitTop = 6
      ExplicitWidth = 181
      ExplicitHeight = 25
    end
    inherited bbCancel: TBitBtn
      Left = 325
      Top = 6
      Width = 95
      Height = 25
      ExplicitLeft = 325
      ExplicitTop = 6
      ExplicitWidth = 95
      ExplicitHeight = 25
    end
  end
  object servPanel: TPanel
    Left = 0
    Top = 0
    Width = 424
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
    DesignSize = (
      424
      29)
    object Label3: TLabel
      Left = 5
      Top = 10
      Width = 35
      Height = 13
      Caption = #1059#1089#1083#1091#1075#1072
    end
    object luService: TDBLookupComboboxEh
      Left = 136
      Top = 7
      Width = 284
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.ListFieldNames = 'NAME'
      DropDownBox.ListSource = srcService
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 20
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'SERVICE_ID'
      ListField = 'NAME'
      ListSource = srcService
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnChange = luServiceChange
      OnClick = luServiceClick
      OnEnter = luServiceEnter
    end
  end
  object pnlDate: TPanel
    Left = 0
    Top = 59
    Width = 424
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitTop = 55
    ExplicitWidth = 410
    DesignSize = (
      424
      28)
    object Label2: TLabel
      Left = 5
      Top = 7
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object eDate: TDBDateTimeEditEh
      Left = 136
      Top = 4
      Width = 141
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnExit = eDateExit
    end
    object eDateTo: TDBDateTimeEditEh
      Left = 302
      Top = 4
      Width = 118
      Height = 21
      Anchors = [akTop, akRight]
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 1
      Visible = False
      OnEnter = eDateToEnter
    end
  end
  object pnlONOFF: TPanel
    Left = 0
    Top = 87
    Width = 424
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitTop = 83
    ExplicitWidth = 410
    DesignSize = (
      424
      25)
    object Label1: TLabel
      Left = 5
      Top = 7
      Width = 90
      Height = 13
      Caption = #1059#1089#1083#1091#1075#1072' '#1074#1082#1083' / '#1086#1090#1082#1083
    end
    object luOnOffService: TDBLookupComboboxEh
      Left = 136
      Top = 4
      Width = 284
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.ListFieldNames = 'NAME'
      DropDownBox.ListSource = srcOnOffService
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = srcOnOffService
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnChange = luOnOffServiceChange
      OnClick = luServiceClick
      OnEnter = luServiceEnter
    end
  end
  object pnlQUANT: TPanel
    Left = 0
    Top = 112
    Width = 424
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitTop = 108
    ExplicitWidth = 410
    DesignSize = (
      424
      29)
    object Label5: TLabel
      Left = 5
      Top = 10
      Width = 75
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' ('#1089#1091#1084#1084#1072')'
    end
    object lblDimension: TDBText
      Left = 284
      Top = 10
      Width = 65
      Height = 17
      Anchors = [akTop, akRight]
      DataField = 'DIMENSION'
      DataSource = srcService
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 285
    end
    object eUNITS: TDBNumberEditEh
      Left = 136
      Top = 7
      Width = 141
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButton.Visible = True
      EditButtons = <>
      ShowHint = True
      TabOrder = 0
      Value = 0.000000000000000000
      Visible = True
      ExplicitWidth = 127
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 227
    Width = 424
    Height = 114
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 8
    ExplicitTop = 223
    ExplicitWidth = 410
    ExplicitHeight = 118
    object Label4: TLabel
      Left = 0
      Top = 0
      Width = 67
      Height = 13
      Align = alTop
      Caption = '  '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object memNotice: TDBMemoEh
      AlignWithMargins = True
      Left = 3
      Top = 16
      Width = 418
      Height = 95
      Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      Align = alClient
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 0
      Visible = True
      WantReturns = True
      ExplicitLeft = 5
      ExplicitTop = 13
      ExplicitWidth = 415
      ExplicitHeight = 105
    end
  end
  object pnlSRV2: TPanel
    Left = 0
    Top = 29
    Width = 424
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 25
    ExplicitWidth = 410
    DesignSize = (
      424
      30)
    object Label6: TLabel
      Left = 5
      Top = 9
      Width = 121
      Height = 13
      Caption = #1087#1077#1088#1077#1082#1083#1102#1095#1080#1090#1100' '#1085#1072' '#1091#1089#1083#1091#1075#1091
    end
    object dblSwitchTo: TDBLookupComboboxEh
      Left = 136
      Top = 6
      Width = 284
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'SERVICE_ID'
      ListField = 'NAME'
      ListSource = srcSwitchTo
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = dblSwitchToChange
    end
  end
  object pnlContract: TPanel
    Left = 0
    Top = 141
    Width = 424
    Height = 27
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    Visible = False
    ExplicitTop = 137
    ExplicitWidth = 410
    DesignSize = (
      424
      27)
    object lblContr: TLabel
      Left = 304
      Top = 8
      Width = 12
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1086#1090
      Visible = False
      ExplicitLeft = 290
    end
    object edtDogDate: TDBDateTimeEditEh
      Left = 322
      Top = 5
      Width = 98
      Height = 21
      Anchors = [akTop, akRight]
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 3
      Visible = False
    end
    object chkContract: TCheckBox
      Left = 5
      Top = 7
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Caption = #1053#1086#1074#1099#1081' '#1076#1086#1075#1086#1074#1086#1088
      TabOrder = 0
      OnClick = chkContractClick
    end
    object chkFOwner: TDBCheckBoxEh
      Left = 112
      Top = 7
      Width = 74
      Height = 17
      Hint = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '#1082#1074#1072#1088#1090#1080#1088#1099
      Alignment = taLeftJustify
      Caption = #1057#1086#1073#1089'-'#1082'. '#1082#1074'.'
      DynProps = <>
      TabOrder = 1
      Visible = False
      OnClick = chkFOwnerClick
    end
    object edtDogovor: TDBEditEh
      Left = 192
      Top = 5
      Width = 106
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 2
      Visible = False
      ExplicitWidth = 92
    end
  end
  object pnlVAT: TPanel
    Left = 0
    Top = 168
    Width = 424
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    Visible = False
    ExplicitTop = 164
    ExplicitWidth = 410
    DesignSize = (
      424
      29)
    object lblVAT: TLabel
      Left = 5
      Top = 8
      Width = 61
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1053#1044#1057
    end
    object cbbVATG: TDBLookupComboboxEh
      Left = 136
      Top = 5
      Width = 284
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcVATG
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
  end
  object pnlWorker: TPanel
    Left = 0
    Top = 197
    Width = 424
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 7
    Visible = False
    ExplicitTop = 193
    ExplicitWidth = 410
    DesignSize = (
      424
      30)
    object lblWorker: TLabel
      Left = 8
      Top = 7
      Width = 56
      Height = 13
      Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
    end
    object lcbWorker: TDBLookupComboboxEh
      Left = 136
      Top = 5
      Width = 284
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'FIO'
      ListField = 'FIO'
      ListSource = srcWorker
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = dblSwitchToChange
    end
  end
  object srcOnOffService: TDataSource
    DataSet = dsOnOffService
    Left = 136
    Top = 218
  end
  object srcService: TDataSource
    DataSet = dsService
    Left = 222
    Top = 213
  end
  object Query: TpFIBQuery
    Transaction = dmMain.trWrite
    Database = dmMain.dbTV
    Left = 84
    Top = 216
  end
  object dsVATG: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SUBAREA'
      'SET '
      '    AREA_ID = :AREA_ID,'
      '    SUBAREA_ID = :SUBAREA_ID,'
      '    SUBAREA_NAME = :SUBAREA_NAME'
      'WHERE'
      '    SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SUBAREA'
      'WHERE'
      '        SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SUBAREA('
      '    AREA_ID,'
      '    SUBAREA_ID,'
      '    SUBAREA_NAME'
      ')'
      'VALUES('
      '    :AREA_ID,'
      '    :SUBAREA_ID,'
      '    :SUBAREA_NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM SUBAREA'
      'where(  area_ID = :AREA_ID'
      'and subarea_id <> 0'
      '     ) and (     SUBAREA.SUBAREA_ID = :OLD_SUBAREA_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select o.o_name, o.O_id'
      'from objects o'
      'where o.O_TYPE = 13'
      'order by o.o_name')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 58
    Top = 264
  end
  object srcVATG: TDataSource
    DataSet = dsVATG
    Left = 69
    Top = 276
  end
  object dsCustomer: TpFIBDataSet
    SelectSQL.Strings = (
      'select c.juridical, c.vatg_id '
      'from Customer c where c.customer_id = :Customer_id')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 202
    Top = 265
  end
  object srcSwitchTo: TDataSource
    DataSet = dsSwitchTo
    Left = 362
    Top = 227
  end
  object dsSwitchTo: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      
        '    s.SERVICE_ID, s.SRV_TYPE_ID, s.NAME, s.SHORTNAME, s.DESCRIPT' +
        'ION, s.DIMENSION'
      
        '    --, (select count(*) from subscr_serv h where h.serv_id = s.' +
        'service_id and h.state_sgn = 1)'
      '  from SERVICES S'
      '       inner join SERVICES_LINKS sl on (S.SERVICE_ID = sl.CHILD)'
      '  where sl.LINK_TYPE = 6'
      '        and sl.Parent = :SERVICE_ID'
      '  order by s.NAME  ')
    AfterOpen = dsSwitchToAfterOpen
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 363
    Top = 237
  end
  object dsService: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    S.Service_Id'
      '    , S.Srv_Type_Id'
      '    , S.Shift_Months'
      '    , S.Shortname'
      '    , S.Description'
      '    , S.Dimension'
      '    , s.Name || coalesce('#39' / '#39' ||'
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
      'from GETSERVICES(:CUSTOMER_ID, :type) s'
      'order by s.NAME')
    AfterOpen = dsServiceAfterOpen
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 246
    Top = 219
  end
  object dsOnOffService: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    ID, DESCRIPTION, SERVICE_TYPE, s.Name || coalesce('#39' / '#39' ||'
      '    case s.SERVICE_TYPE'
      '      when 2 then null'
      '      else (select first 1 '
      
        '                iif((coalesce(t.Tarif_Sum, 0) = coalesce(t.TARIF' +
        '_SUM_JUR, 0)), coalesce(t.Tarif_Sum, 0), coalesce(t.Tarif_Sum, 0' +
        ') || '#39'/'#39' || coalesce(t.TARIF_SUM_JUR, 0))'
      '              from tarif t'
      '              where t.Service_Id = s.ID'
      
        '                    and current_date between t.Date_From and t.D' +
        'ate_To)'
      ''
      '    end, '#39#39') Name'
      
        '  from selectonoffservice(:acustomer_id, :aservice_id, :asubscr_' +
        'serv_id, :aoff) s')
    AfterOpen = dsOnOffServiceAfterOpen
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 145
    Top = 241
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 16
    Top = 296
  end
  object dsWorker: TpFIBDataSet
    SelectSQL.Strings = (
      'Select'
      
        'w.Surname||coalesce('#39' '#39'||w.Firstname||coalesce('#39' '#39'||w.Midlename,' +
        #39#39'),'#39#39') FIO'
      'from worker w'
      'where IN_REQUEST = 1'
      'order by 1')
    AfterOpen = dsServiceAfterOpen
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 294
    Top = 283
  end
  object srcWorker: TDataSource
    AutoEdit = False
    DataSet = dsWorker
    Left = 270
    Top = 269
  end
end
