object MaterialForm: TMaterialForm
  Left = 0
  Top = 0
  Caption = #1052#1072#1090#1077#1088#1080#1072#1083
  ClientHeight = 422
  ClientWidth = 481
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    481
    422)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 10
    Width = 73
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label2: TLabel
    Left = 6
    Top = 37
    Width = 77
    Height = 13
    Caption = #1045#1076'. '#1080#1079#1084#1077#1088#1077#1085#1080#1103'.'
  end
  object Label3: TLabel
    Left = 6
    Top = 117
    Width = 36
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072
  end
  object Label4: TLabel
    Left = 6
    Top = 332
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object lbl1: TLabel
    Left = 229
    Top = 64
    Width = 31
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object lblCoslt: TLabel
    Left = 6
    Top = 64
    Width = 26
    Height = 13
    Caption = #1062#1077#1085#1072
  end
  object lbl2: TLabel
    Left = 210
    Top = 91
    Width = 71
    Height = 13
    Caption = #1091' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
  end
  object lbl3: TLabel
    Left = 6
    Top = 91
    Width = 66
    Height = 13
    Caption = #1051#1091#1095#1096#1072#1103' '#1094#1077#1085#1072
  end
  object lbl4: TLabel
    Left = 6
    Top = 144
    Width = 75
    Height = 13
    Caption = #1058#1080#1087' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
  end
  object lbl5: TLabel
    Left = 6
    Top = 280
    Width = 63
    Height = 13
    Caption = #1060#1072#1081#1083' ('#1092#1086#1090#1086')'
  end
  object lbl41: TLabel
    Left = 6
    Top = 226
    Width = 77
    Height = 13
    Caption = #1059#1089#1083#1091#1075#1072' '#1072#1088#1077#1085#1076#1099
  end
  object lbl42: TLabel
    Left = 6
    Top = 253
    Width = 90
    Height = 13
    Caption = #1059#1089#1083#1091#1075#1072' '#1088#1072#1089#1089#1088#1086#1095#1082#1080
  end
  object lblSold: TLabel
    Left = 6
    Top = 199
    Width = 83
    Height = 13
    Caption = #1059#1089#1083#1091#1075#1072' '#1087#1088#1086#1076#1072#1078#1080
  end
  object lblPCE: TLabel
    Left = 7
    Top = 306
    Width = 71
    Height = 13
    Caption = #1052#1086#1097#1085#1086#1089#1090#1100', '#1042#1090
  end
  object lblPCE1: TLabel
    Left = 210
    Top = 306
    Width = 60
    Height = 13
    Caption = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103
  end
  object dblMatGroup: TDBLookupComboboxEh
    Left = 97
    Top = 115
    Width = 376
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'GR_ID'
    DataSource = MaterialsForm.srcDataSource
    DropDownBox.ListSource = srcMGropups
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterType = lsftContainsEh
    DropDownBox.ListSourceAutoFilterAllColumns = True
    DropDownBox.AutoDrop = True
    EmptyDataInfo.Text = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
    EditButtons = <
      item
        Style = ebsPlusEh
        OnClick = dblMatGroupEditButtons0Click
      end>
    KeyField = 'MG_ID'
    ListField = 'MG_NAME'
    ListSource = srcMGropups
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 6
    Visible = True
  end
  object DBMemo1: TDBMemoEh
    Left = 96
    Top = 329
    Width = 376
    Height = 56
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'DESCRIPTION'
    DataSource = MaterialsForm.srcDataSource
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 19
    Visible = True
    WantReturns = True
  end
  object DBEdit1: TDBEditEh
    Left = 96
    Top = 7
    Width = 376
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'NAME'
    DataSource = MaterialsForm.srcDataSource
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object DBEdit2: TDBEditEh
    Left = 96
    Top = 34
    Width = 376
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'DIMENSION'
    DataSource = MaterialsForm.srcDataSource
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1077#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103' ('#1084' '#1096#1090'. '#1082#1075')'
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object edtM_NUMBER: TDBEditEh
    Left = 288
    Top = 61
    Width = 185
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'M_NUMBER'
    DataSource = MaterialsForm.srcDataSource
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1085#1099#1081' '#1085#1086#1084#1077#1088
    ShowHint = True
    TabOrder = 3
    Visible = True
    OnChange = edtM_NUMBERChange
    OnExit = edtM_NUMBERExit
  end
  object btnOk: TBitBtn
    Left = 6
    Top = 389
    Width = 384
    Height = 28
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    NumGlyphs = 2
    TabOrder = 20
    OnClick = OkCancelFrame1bbOkClick
  end
  object btnCancel: TBitBtn
    Left = 397
    Top = 389
    Width = 75
    Height = 28
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 21
  end
  object edtCost: TDBNumberEditEh
    Left = 96
    Top = 61
    Width = 105
    Height = 21
    DataField = 'COST'
    DataSource = MaterialsForm.srcDataSource
    DynProps = <>
    EmptyDataInfo.Text = #1062#1077#1085#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
    EditButton.Visible = True
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = True
  end
  object lcbShippers: TDBLookupComboboxEh
    Left = 287
    Top = 88
    Width = 186
    Height = 21
    Hint = #1055#1086#1089#1090#1072#1074#1097#1080#1082' '#1089' '#1083#1091#1095#1096#1077#1081' '#1094#1077#1085#1086#1081' ('#1089#1087#1088#1072#1074#1086#1095#1085#1086')'
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'BEST_SHIPPER_ID'
    DataSource = MaterialsForm.srcDataSource
    EmptyDataInfo.Text = #1055#1086#1089#1090#1072#1074#1097#1080#1082' '#1089' '#1083#1091#1095#1096#1077#1081' '#1094#1077#1085#1086#1081' ('#1089#1087#1088#1072#1074#1086#1095#1085#1086')'
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcShippers
    ShowHint = True
    TabOrder = 5
    Visible = True
  end
  object edtCOST1: TDBNumberEditEh
    Left = 96
    Top = 88
    Width = 105
    Height = 21
    Hint = #1051#1091#1095#1096#1072#1103' '#1094#1077#1085#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1072' ('#1089#1087#1088#1072#1074#1086#1095#1085#1086')'
    DataField = 'BEST_COST'
    DataSource = MaterialsForm.srcDataSource
    DynProps = <>
    EmptyDataInfo.Text = #1051#1091#1095#1096#1072#1103' '#1094#1077#1085#1072' ('#1089#1087#1088#1072#1074#1086#1095#1085#1086') '
    EditButton.Visible = True
    EditButtons = <>
    ShowHint = True
    TabOrder = 4
    Visible = True
  end
  object chkItsEquipment: TDBCheckBoxEh
    Left = 96
    Top = 170
    Width = 97
    Height = 17
    Hint = #1048#1084#1077#1077#1090' '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1081' '#1089#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088
    Caption = #1064#1090#1091#1095#1085#1099#1081' '#1091#1095#1077#1090
    DataField = 'IS_UNIT'
    DataSource = MaterialsForm.srcDataSource
    DynProps = <>
    TabOrder = 8
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object chkIsDigit: TDBCheckBoxEh
    Left = 235
    Top = 170
    Width = 97
    Height = 17
    Hint = #1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1094#1080#1092#1088#1086#1074#1086#1075#1086' '#1058#1042
    Caption = #1062#1080#1092#1088#1086#1074#1086#1077
    DataField = 'IS_DIGIT'
    DataSource = MaterialsForm.srcDataSource
    DynProps = <>
    TabOrder = 9
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object chkIsNet: TDBCheckBoxEh
    Left = 368
    Top = 170
    Width = 97
    Height = 17
    Hint = #1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1076#1083#1103' '#1057#1055#1044
    Caption = #1057#1077#1090#1077#1074#1086#1077
    DataField = 'IS_NET'
    DataSource = MaterialsForm.srcDataSource
    DynProps = <>
    TabOrder = 10
    ValueChecked = '1'
    ValueUnchecked = '0'
  end
  object lcbGR_ID: TDBLookupComboboxEh
    Left = 97
    Top = 141
    Width = 376
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'M_TYPE'
    DataSource = MaterialsForm.srcDataSource
    DropDownBox.Columns = <
      item
        FieldName = 'O_NAME'
      end
      item
        FieldName = 'O_DIMENSION'
      end
      item
        FieldName = 'O_DESCRIPTION'
      end>
    DropDownBox.ListSource = srcDevType
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterType = lsftContainsEh
    DropDownBox.ListSourceAutoFilterAllColumns = True
    DropDownBox.AutoDrop = True
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1058#1080#1087' '#1084#1072#1090#1077#1088#1080#1072#1083#1072' / '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcDevType
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 7
    Visible = True
  end
  object edtFILE: TDBEditEh
    Left = 96
    Top = 277
    Width = 215
    Height = 21
    Anchors = [akLeft, akTop, akRight]
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
    TabOrder = 14
    Visible = True
  end
  object btnScaner: TButton
    Left = 317
    Top = 277
    Width = 75
    Height = 21
    Hint = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1092#1072#1081#1083' '#1080' '#1089#1086#1093#1088#1072#1085#1080#1090#1100
    Anchors = [akTop, akRight]
    Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 15
    OnClick = btnScanerClick
  end
  object btnOpenFile: TButton
    Left = 398
    Top = 277
    Width = 75
    Height = 21
    Hint = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1092#1072#1081#1083
    Anchors = [akTop, akRight]
    Caption = #1055#1088#1086#1089#1084#1086#1090#1088#1077#1090#1100
    TabOrder = 16
    OnClick = btnOpenFileClick
  end
  object lcbRENT: TDBLookupComboboxEh
    Left = 97
    Top = 223
    Width = 376
    Height = 21
    Hint = #1050#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100' '#1087#1088#1080' '#1072#1088#1077#1085#1076#1077' '#1095#1077#1088#1077#1079' '#1079#1072#1103#1074#1082#1091
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'RENT'
    DataSource = MaterialsForm.srcDataSource
    DropDownBox.ListSource = srcServices
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterType = lsftContainsEh
    DropDownBox.ListSourceAutoFilterAllColumns = True
    DropDownBox.AutoDrop = True
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1050#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100' '#1087#1088#1080' '#1072#1088#1077#1085#1076#1077' '#1095#1077#1088#1077#1079' '#1079#1072#1103#1074#1082#1091
    EditButtons = <>
    KeyField = 'SERVICE_ID'
    ListField = 'NAME'
    ListSource = srcServices
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 12
    Visible = True
  end
  object lcbLAON: TDBLookupComboboxEh
    Left = 97
    Top = 250
    Width = 376
    Height = 21
    Hint = #1050#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100' '#1087#1088#1080' '#1088#1072#1089#1089#1088#1086#1095#1082#1077' '#1095#1077#1088#1077#1079' '#1079#1072#1103#1074#1082#1091
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'LOAN'
    DataSource = MaterialsForm.srcDataSource
    DropDownBox.ListSource = srcServices
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterType = lsftContainsEh
    DropDownBox.ListSourceAutoFilterAllColumns = True
    DropDownBox.AutoDrop = True
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1050#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100' '#1087#1088#1080' '#1088#1072#1089#1089#1088#1086#1095#1082#1077' '#1095#1077#1088#1077#1079' '#1079#1072#1103#1074#1082#1091
    EditButtons = <>
    KeyField = 'SERVICE_ID'
    ListField = 'NAME'
    ListSource = srcServices
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 13
    Visible = True
  end
  object lcbSOLD: TDBLookupComboboxEh
    Left = 97
    Top = 196
    Width = 376
    Height = 21
    Hint = #1050#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100' '#1087#1088#1080' '#1072#1088#1077#1085#1076#1077' '#1095#1077#1088#1077#1079' '#1079#1072#1103#1074#1082#1091
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'SOLD'
    DataSource = MaterialsForm.srcDataSource
    DropDownBox.ListSource = srcSoldSRV
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterType = lsftContainsEh
    DropDownBox.ListSourceAutoFilterAllColumns = True
    DropDownBox.AutoDrop = True
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1050#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100' '#1087#1088#1080' '#1087#1088#1086#1076#1072#1078#1077' '#1095#1077#1088#1077#1079' '#1079#1072#1103#1074#1082#1091
    EditButtons = <>
    KeyField = 'SERVICE_ID'
    ListField = 'NAME'
    ListSource = srcSoldSRV
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 11
    Visible = True
  end
  object ednPCE: TDBNumberEditEh
    Left = 97
    Top = 303
    Width = 105
    Height = 21
    DataField = 'PCE'
    DataSource = MaterialsForm.srcDataSource
    DecimalPlaces = 3
    DynProps = <>
    EmptyDataInfo.Text = #1042#1090
    EditButton.Visible = True
    EditButtons = <>
    ShowHint = True
    TabOrder = 17
    Visible = True
  end
  object cbProp: TDBComboBoxEh
    Left = 288
    Top = 303
    Width = 185
    Height = 21
    Hint = #1079#1085#1072#1095#1077#1085#1080#1077' '#1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1087#1088#1080' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1080' '#1074' '#1079#1072#1103#1074#1082#1091' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    Anchors = [akLeft, akTop, akRight]
    DataField = 'PROP'
    DataSource = MaterialsForm.srcDataSource
    DynProps = <>
    EmptyDataInfo.Text = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1087#1088#1080' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1080' '#1074' '#1079#1072#1103#1074#1082#1091
    EditButtons = <>
    Items.Strings = (
      #1055#1088#1086#1076#1072#1078#1072
      #1042' '#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1080
      #1056#1072#1089#1089#1088#1086#1095#1082#1072
      #1040#1088#1077#1085#1076#1072)
    KeyItems.Strings = (
      '0'
      '1'
      '2'
      '3')
    ShowHint = True
    TabOrder = 18
    Visible = True
  end
  object dsMGropups: TpFIBDataSet
    SelectSQL.Strings = (
      'select * from ('
      'with recursive GroupsTree'
      'as (select'
      '        mp.Mg_Id'
      '      , cast(coalesce(mp.Mg_Name, '#39#39') as varchar(1000)) as path'
      '      from MATERIALS_GROUP mp'
      
        '      where mp.Parent_Id is null and coalesce(mp. Deleted, 0) = ' +
        '0'
      '    union all'
      '    select'
      '        mc.Mg_Id'
      
        '      , cast(gt.path || '#39' > '#39' || coalesce(mc.Mg_Name, '#39#39') as var' +
        'char(1000)) as path'
      '      from MATERIALS_GROUP mc'
      '           inner join GroupsTree gt on mc.Parent_Id = gt.Mg_Id'
      '      where coalesce(mc. Deleted, 0) = 0     '
      '           )'
      'select'
      '    Mg_Id, path as Mg_Name'
      '  from GroupsTree'
      ')'
      'order by Mg_Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 128
    Top = 208
  end
  object srcMGropups: TDataSource
    DataSet = dsMGropups
    Left = 208
    Top = 208
  end
  object dsShippers: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID, O_NAME, O_DESCRIPTION'
      '  from OBJECTS o'
      '  where O_TYPE = 29'
      '  order by O_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 327
    Top = 209
  end
  object srcShippers: TDataSource
    AutoEdit = False
    DataSet = dsShippers
    Left = 384
    Top = 209
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 416
    Top = 136
  end
  object Query: TpFIBQuery
    Transaction = trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select'
      '    C.ACCOUNT_NO, C.SURNAME, C.FIRSTNAME, '
      '    C.MIDLENAME, C.CUST_CODE, '
      '    C.CUST_STATE_DESCR, C.DEBT_SUM, '
      '    C.DOGOVOR_NO, f.Porch_N, f.Floor_N'
      '  from house h'
      
        '       left outer join customer c on (c.House_Id = h.House_Id an' +
        'd c.Flat_No = :flat_no)'
      
        '       left outer join HOUSEFLATS f on (f.House_Id = h.House_Id ' +
        'and f.Flat_No = :flat_no)'
      '  where h.House_Id=:house_id   ')
    Left = 37
    Top = 182
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
    Left = 53
    Top = 220
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
    Left = 162
    Top = 106
  end
  object srcDevType: TDataSource
    AutoEdit = False
    DataSet = dsDevType
    Left = 204
    Top = 108
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '*.*'
    Left = 128
    Top = 256
  end
  object qReqFile: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select b.Bl_Body from Blob_Tbl b where b.Bl_Id = :Bl_Id')
    Left = 205
    Top = 256
  end
  object qSaveFile: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'INSERT INTO Blob_Tbl (Bl_Type, Owner_Id, Bl_Name, Bl_Body)'
      'VALUES (:Bl_Type, :Owner_Id, :Bl_Name, :Bl_Body)'
      '')
    Left = 269
    Top = 256
  end
  object dsDoc: TpFIBDataSet
    SelectSQL.Strings = (
      'select first 1'
      '    b.Bl_Id'
      '  , b.Bl_Name'
      '  , b.OWNER_ID'
      '  from Blob_Tbl b where'
      '  b.Owner_Id = :MAT_Id and b.Bl_Type = 4')
    AutoUpdateOptions.UpdateTableName = 'MATERIAL_DOCS'
    AutoUpdateOptions.KeyFields = 'DOC_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AfterOpen = dsDocAfterOpen
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 16
    Top = 157
  end
  object dsServices: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    c.Service_Id'
      
        '  , c.Name || coalesce('#39' ('#39' || c.Shortname || '#39')'#39', '#39#39') || coales' +
        'ce('#39' ='#39' || t.Tarif_Sum, '#39#39') NAME'
      '  from SERVices C'
      
        '       left outer join tarif t on (t.Service_Id = c.Service_Id a' +
        'nd'
      '             current_date between t.Date_From and t.Date_To)'
      '  where C.SRV_TYPE_ID = 0'
      '        and exists(select'
      '                       l.Link_Id'
      '                     from Services_Links l'
      '                     where l.Link_Type = 0'
      '                           and l.Child = c.Service_Id)'
      '  order by c.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 341
    Top = 253
    oFetchAll = True
  end
  object srcServices: TDataSource
    DataSet = dsServices
    Left = 389
    Top = 261
  end
  object dsSoldSRV: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    c.Service_Id'
      
        '  , c.Name || coalesce('#39' ('#39' || c.Shortname || '#39')'#39', '#39#39') || coales' +
        'ce('#39' ='#39' || t.Tarif_Sum, '#39#39') NAME'
      '  from SERVices C'
      
        '       left outer join tarif t on (t.Service_Id = c.Service_Id a' +
        'nd'
      '             current_date between t.Date_From and t.Date_To)'
      '  where C.SRV_TYPE_ID <> 0'
      '  order by c.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 181
    Top = 333
    oFetchAll = True
  end
  object srcSoldSRV: TDataSource
    DataSet = dsSoldSRV
    Left = 117
    Top = 333
  end
end
