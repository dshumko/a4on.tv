object EditApplianceForm: TEditApplianceForm
  Left = 593
  Top = 259
  Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1091' '#1072#1073#1086#1085#1077#1085#1090#1072
  ClientHeight = 293
  ClientWidth = 432
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
  DesignSize = (
    432
    293)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 79
    Height = 13
    Caption = #1058#1080#1087' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 38
    Width = 77
    Height = 13
    Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100
  end
  object Label3: TLabel
    Left = 8
    Top = 65
    Width = 75
    Height = 13
    Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
  end
  object lbl1: TLabel
    Left = 8
    Top = 92
    Width = 48
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
  end
  object Label4: TLabel
    Left = 8
    Top = 119
    Width = 84
    Height = 13
    Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088
  end
  object Label5: TLabel
    Left = 279
    Top = 119
    Width = 22
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'MAC'
  end
  object Label6: TLabel
    Left = 8
    Top = 146
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object lbl2: TLabel
    Left = 279
    Top = 146
    Width = 15
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1055#1054
  end
  object pnlOkCancel: TPanel
    Left = 0
    Top = 263
    Width = 432
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 9
    DesignSize = (
      432
      30)
    object bbOk: TBitBtn
      Left = 8
      Top = 2
      Width = 293
      Height = 24
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      NumGlyphs = 2
      TabOrder = 0
      OnClick = bbOkClick
    end
    object bbCancel: TBitBtn
      Left = 312
      Top = 2
      Width = 112
      Height = 24
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object mmoNotice: TDBMemoEh
    Left = 8
    Top = 173
    Width = 417
    Height = 87
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 8
    Visible = True
    WantReturns = True
  end
  object edtName: TDBEditEh
    Left = 96
    Top = 89
    Width = 329
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103', '#1077#1089#1083#1080' '#1085#1077' '#1087#1088#1080#1074#1103#1079#1072#1085#1086' '#1082' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1091
    ShowHint = True
    TabOrder = 3
    Visible = True
  end
  object edtMAC: TDBEditEh
    Left = 312
    Top = 116
    Width = 113
    Height = 21
    Anchors = [akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = 'MAC '#1072#1076#1088#1077#1089' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
    ShowHint = True
    TabOrder = 5
    Visible = True
  end
  object cbApplProperty: TDBComboBoxEh
    Left = 96
    Top = 35
    Width = 329
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EmptyDataInfo.Text = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1086#1089#1090#1100
    EditButtons = <>
    Items.Strings = (
      'A'#1073#1086#1085#1077#1085#1090#1072' ('#1055#1088#1086#1076#1072#1085')'
      #1050#1086#1084#1087#1072#1085#1080#1080' ('#1042' '#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080')'
      'A'#1073#1086#1085#1077#1085#1090#1072' ('#1056#1072#1089#1089#1088#1086#1095#1082#1072')'
      #1050#1086#1084#1087#1072#1085#1080#1080' ('#1040#1088#1077#1085#1076#1072')'
      'A'#1073#1086#1085#1077#1085#1090#1072' ('#1050#1091#1087#1083#1077#1085#1086' '#1089#1072#1084#1086#1089#1090#1086#1103#1090#1077#1083#1100#1085#1086')')
    KeyItems.Strings = (
      '0'
      '1'
      '2'
      '3'
      '-1')
    ShowHint = True
    TabOrder = 1
    Visible = True
    OnChange = cbApplPropertyChange
  end
  object lcbApplType: TDBLookupComboboxEh
    Left = 96
    Top = 8
    Width = 329
    Height = 21
    ControlLabel.Layout = tlCenter
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    DropDownBox.ListSource = srcDevType
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterType = lsftContainsEh
    EmptyDataInfo.Text = #1058#1080#1087' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcDevType
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object edtSN: TDBEditEh
    Left = 96
    Top = 116
    Width = 169
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088
    ShowHint = True
    TabOrder = 4
    Visible = True
  end
  object ednCost: TDBNumberEditEh
    Left = 96
    Top = 143
    Width = 169
    Height = 21
    DynProps = <>
    EmptyDataInfo.Text = #1062#1077#1085#1072
    EditButton.DefaultAction = True
    EditButton.Visible = True
    EditButtons = <>
    ShowHint = True
    TabOrder = 6
    Visible = True
  end
  object lcbApplMID: TDBLookupComboboxEh
    Left = 96
    Top = 62
    Width = 329
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    DropDownBox.Columns = <
      item
        FieldName = 'NAME'
        Width = 40
      end
      item
        FieldName = 'M_NUMBER'
        Width = 20
      end
      item
        FieldName = 'MG_NAME'
        Width = 30
      end
      item
        FieldName = 'DESCRIPTION'
        Width = 60
      end>
    DropDownBox.ListSource = srcMat
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterType = lsftContainsEh
    DropDownBox.ListSourceAutoFilterAllColumns = True
    DropDownBox.AutoDrop = True
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
    EditButtons = <>
    KeyField = 'M_ID'
    ListField = 'NAME'
    ListSource = srcMat
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 2
    Visible = True
    OnExit = lcbApplMIDExit
  end
  object edtSOFT: TDBEditEh
    Left = 311
    Top = 143
    Width = 113
    Height = 21
    Anchors = [akTop, akRight]
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1042#1077#1088#1089#1080#1103' '#1055#1054
    ShowHint = True
    TabOrder = 7
    Visible = True
  end
  object dsAppl: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE APPLIANCE'
      'SET '
      '    A_TYPE = :A_TYPE,'
      '    OWN_ID = :OWN_ID,'
      '    OWN_TYPE = :OWN_TYPE,'
      '    NAME = :NAME,'
      '    NOTICE = :NOTICE,'
      '    M_ID = :M_ID,'
      '    MAC = :MAC,'
      '    SERIAL = :SERIAL,'
      '    COST = :COST,'
      '    PROPERTY = :PROPERTY,'
      '    SOFT = :SOFT'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    APPLIANCE'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO APPLIANCE('
      '    ID,'
      '    A_TYPE,'
      '    OWN_ID,'
      '    OWN_TYPE,'
      '    NAME,'
      '    NOTICE,'
      '    M_ID,'
      '    MAC,'
      '    SERIAL,'
      '    COST,'
      '    PROPERTY,'
      '    SOFT'
      ')'
      'VALUES('
      '    :ID,'
      '    :A_TYPE,'
      '    :OWN_ID,'
      '    :OWN_TYPE,'
      '    :NAME,'
      '    :NOTICE,'
      '    :M_ID,'
      '    :MAC,'
      '    :SERIAL,'
      '    :COST,'
      '    :PROPERTY,'
      '    :SOFT'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    *'
      '  from Appliance'
      'where(  Id = :Id'
      '     ) and (     APPLIANCE.ID = :OLD_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    *'
      '  from Appliance'
      'where Id = :Id')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DISCOUNT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 24
    Top = 192
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object cnError: TCnErrorProvider
    DoubleBuffer = False
    Left = 248
    Top = 184
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
    Left = 384
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
    Left = 336
    Top = 178
  end
  object dsDevType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_DIMENSION'
      '  from OBJECTS o'
      '  where O_TYPE = 48'
      '        and O_DELETED = 0'
      '  order by O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 130
    Top = 170
  end
  object srcDevType: TDataSource
    AutoEdit = False
    DataSet = dsDevType
    Left = 188
    Top = 172
  end
  object dsMat: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    m.M_ID'
      '  , m.NAME'
      '  , m.DIMENSION'
      '  , m.M_NUMBER'
      '  , mg.Mg_Name'
      '  , m.DESCRIPTION'
      '  , COST'
      '  from MATERIALS m'
      
        '       left outer join MATERIALS_GROUP mg on (mg.Mg_Id =  m.MG_I' +
        'D)'
      '  where m.Is_Unit = 1'
      '--  and ('
      '--    (not :O_ID is null and M_TYPE = :O_ID)'
      '--    or (:O_ID is null)'
      '--  )'
      'order by m.NAME, mg.Mg_Name')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcDevType
    Left = 130
    Top = 218
  end
  object srcMat: TDataSource
    AutoEdit = False
    DataSet = dsMat
    Left = 188
    Top = 220
  end
end
