object NodeLinkForm: TNodeLinkForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1051#1080#1085#1080#1103' '#1089#1074#1103#1079#1080
  ClientHeight = 337
  ClientWidth = 534
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
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  OnShow = FormShow
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
      Left = 67
      Width = 378
      Anchors = [akLeft, akRight, akBottom]
      ModalResult = 0
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 451
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 534
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      534
      29)
    object Label3: TLabel
      Left = 8
      Top = 11
      Width = 40
      Height = 13
      Caption = #1054#1090' '#1091#1079#1083#1072
    end
    object lcbPOINT_S: TDBLookupComboboxEh
      Left = 76
      Top = 8
      Width = 450
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.Columns = <
        item
          FieldName = 'NAME'
          Title.Caption = #1059#1079#1077#1083
        end
        item
          FieldName = 'O_NAME'
          Title.Caption = #1058#1080#1087
        end
        item
          FieldName = 'STREET_NAME'
          Title.Caption = #1059#1083#1080#1094#1072
        end
        item
          FieldName = 'HOUSE_NO'
          Title.Caption = #1044#1086#1084
        end
        item
          FieldName = 'PORCH_N'
          Title.Caption = #1055'-'#1076
        end
        item
          FieldName = 'FLOOR_N'
          Title.Caption = #1069#1090#1072#1078
        end
        item
          FieldName = 'PLACE'
          Title.Caption = #1052#1077#1089#1090#1086
        end>
      DropDownBox.ListSource = srcMain
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
      DropDownBox.AutoDrop = True
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1053#1072#1095#1072#1083#1100#1085#1099#1081' '#1091#1079#1077#1083
      EditButtons = <>
      KeyField = 'NODE_ID'
      ListField = 'NODE_NAME'
      ListSource = srcMain
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnChange = lcbPOINT_SChange
      OnDropDownBoxGetCellParams = lcbNodeDropDownBoxGetCellParams
    end
  end
  object pnlSecond: TPanel
    Left = 0
    Top = 29
    Width = 534
    Height = 273
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      534
      273)
    object lbl3: TLabel
      Left = 8
      Top = 107
      Width = 45
      Height = 13
      Caption = #1044#1083#1080#1085#1072', '#1084
    end
    object lbl4: TLabel
      Left = 200
      Top = 107
      Width = 42
      Height = 13
      Caption = #1047#1072#1087#1072#1089', '#1084
    end
    object Label1: TLabel
      Left = 8
      Top = 82
      Width = 48
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object lbl2: TLabel
      Left = 8
      Top = 57
      Width = 50
      Height = 13
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083
    end
    object lbl1: TLabel
      Left = 8
      Top = 32
      Width = 57
      Height = 13
      Caption = #1058#1080#1087' '#1082#1072#1073#1077#1083#1103
    end
    object Label2: TLabel
      Left = 8
      Top = 7
      Width = 33
      Height = 13
      Caption = #1050' '#1091#1079#1083#1091
    end
    object lbl5: TLabel
      Left = 347
      Top = 107
      Width = 41
      Height = 13
      Caption = #1045#1084#1082#1086#1089#1090#1100
    end
    object lbl6: TLabel
      Left = 8
      Top = 132
      Width = 62
      Height = 13
      Caption = #1052#1072#1088#1082#1080#1088#1086#1074#1082#1072
    end
    object mmoNOTICE: TDBMemoEh
      Left = 8
      Top = 156
      Width = 518
      Height = 112
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcLink
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 8
      Visible = True
      WantReturns = True
    end
    object ednLength: TDBNumberEditEh
      Left = 76
      Top = 104
      Width = 107
      Height = 21
      DataField = 'METERS'
      DataSource = srcLink
      DynProps = <>
      EmptyDataInfo.Text = #1044#1083#1080#1085#1072
      EditButtons = <>
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
    object ednStock: TDBNumberEditEh
      Left = 255
      Top = 104
      Width = 75
      Height = 21
      DataField = 'STOCK'
      DataSource = srcLink
      DynProps = <>
      EmptyDataInfo.Text = #1047#1072#1087#1072#1089#1072
      EditButtons = <>
      ShowHint = True
      TabOrder = 5
      Visible = True
    end
    object edtNAME: TDBEditEh
      Left = 76
      Top = 79
      Width = 450
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NAME'
      DataSource = srcLink
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 
        #1053#1072#1079#1072#1074#1085#1080#1077' '#1089#1074#1103#1079#1080'. '#1077#1089#1083#1080' '#1087#1091#1089#1090#1086#1077', '#1090#1086' '#1089#1092#1086#1088#1084#1080#1088#1091#1077#1090' '#1072#1074#1090#1086#1084#1072#1090#1086#1084' ('#1058#1080#1087':'#1059#1079#1077#1083'>'#1059 +
        #1079#1077#1083')'
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object lcbLinkType: TDBLookupComboboxEh
      Left = 76
      Top = 29
      Width = 450
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'WTYPE'
      DataSource = srcLink
      DropDownBox.Columns = <
        item
          FieldName = 'O_NAME'
        end
        item
          FieldName = 'O_DESCRIPTION'
        end>
      DropDownBox.ListSource = srcType
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1058#1080#1087' '#1082#1072#1073#1077#1083#1103
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'LINKNAME'
      ListSource = srcType
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 1
      Visible = True
      OnDropDownBoxGetCellParams = lcbLinkTypeDropDownBoxGetCellParams
      OnExit = lcbLinkTypeExit
    end
    object lcbNode: TDBLookupComboboxEh
      Left = 76
      Top = 4
      Width = 450
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'POINT_E'
      DataSource = srcLink
      DropDownBox.Columns = <
        item
          FieldName = 'NAME'
          Title.Caption = #1059#1079#1077#1083
        end
        item
          FieldName = 'O_NAME'
          Title.Caption = #1058#1080#1087
        end
        item
          FieldName = 'STREET_NAME'
          Title.Caption = #1059#1083#1080#1094#1072
        end
        item
          FieldName = 'HOUSE_NO'
          Title.Caption = #1044#1086#1084
          Width = 30
        end
        item
          FieldName = 'PORCH_N'
          Title.Caption = #1055'-'#1076
          Width = 20
        end
        item
          FieldName = 'FLOOR_N'
          Title.Caption = #1069#1090#1072#1078
          Width = 20
        end
        item
          FieldName = 'PLACE'
          Title.Caption = #1052#1077#1089#1090#1086
          Width = 30
        end>
      DropDownBox.ListSource = srcNodes
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
      DropDownBox.AutoDrop = True
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1091#1079#1083#1091
      EditButtons = <>
      KeyField = 'NODE_ID'
      ListField = 'NODE_NAME'
      ListSource = srcNodes
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnChange = lcbNodeChange
      OnDropDownBoxGetCellParams = lcbNodeDropDownBoxGetCellParams
      OnExit = lcbNodeExit
    end
    object ednSTOCK1: TDBNumberEditEh
      Left = 405
      Top = 104
      Width = 121
      Height = 21
      Hint = #1050#1086#1083'-'#1074#1086' '#1074#1086#1079#1084#1086#1078#1085#1099#1093' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1081' '#1082#1072#1073#1077#1083#1077#1084
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CAPACITY'
      DataSource = srcLink
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = #1082#1086#1083'-'#1074#1086' '#1087#1086#1076#1082#1083'.'
      EditButtons = <>
      ShowHint = True
      TabOrder = 6
      Visible = True
    end
    object lcbApplMID: TDBLookupComboboxEh
      Left = 76
      Top = 54
      Width = 450
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'M_ID'
      DataSource = srcLink
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
          FieldName = 'COST'
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
      EmptyDataInfo.Text = #1050#1072#1073#1077#1083#1100' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
      EditButtons = <>
      KeyField = 'M_ID'
      ListField = 'NAME'
      ListSource = srcMat
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 2
      Visible = True
    end
    object lcbLabel: TDBLookupComboboxEh
      Left = 76
      Top = 129
      Width = 450
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'LABELS'
      DataSource = srcLink
      DropDownBox.Columns = <
        item
          FieldName = 'NAME'
        end
        item
          FieldName = 'LABELS'
        end>
      DropDownBox.ListSource = srcLabel
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1052#1072#1088#1082#1080#1088#1086#1074#1082#1072' '#1082#1072#1073#1077#1083#1103
      EditButtons = <>
      KeyField = 'LABELS'
      ListField = 'NAME'
      ListSource = srcLabel
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 7
      Visible = True
    end
  end
  object srcLink: TDataSource
    AutoEdit = False
    DataSet = dsLink
    Left = 214
    Top = 70
  end
  object dsLink: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'update or insert into Wire (WID, WTYPE, Name, Meters, Stock, Poi' +
        'nt_S, Point_E, Notice, CAPACITY, M_ID, LABELS)'
      
        'values (:WID, :WTYPE, :Name, :Meters, :Stock, :Point_S, :Point_E' +
        ', :Notice, :CAPACITY, :M_ID, :LABELS)'
      'matching (WID)')
    InsertSQL.Strings = (
      
        'update or insert into Wire (WID, WTYPE, Name, Meters, Stock, Poi' +
        'nt_S, Point_E, Notice, CAPACITY, M_ID, LABELS)'
      
        'values (:WID, :WTYPE, :Name, :Meters, :Stock, :Point_S, :Point_E' +
        ', :Notice, :CAPACITY, :M_ID, :LABELS)'
      'matching (WID)')
    SelectSQL.Strings = (
      'select'
      '   c.*'
      
        '   , (select count(*) from wire w where (not w.Point_S is null) ' +
        'and (w.Point_S = c.Point_S)) WIRE_CNT'
      '  from Wire c'
      'where c.WID = :WID')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 274
    Top = 70
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 256
    Top = 22
  end
  object dsType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '    , O_NAME||coalesce('#39' ('#39'||O_DESCRIPTION||'#39')'#39','#39#39') LinkName'
      '    , O_DIMENSION COLOR'
      '    , O_NAME'
      '    , O_DESCRIPTION'
      '  from OBJECTS o'
      '  where O_TYPE = 56'
      '        and O_DELETED = 0'
      '  order by 2  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = trRead
    AutoCommit = True
    Left = 184
    Top = 206
  end
  object srcType: TDataSource
    AutoEdit = False
    DataSet = dsType
    Left = 188
    Top = 254
  end
  object dsNodes: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    N.Node_Id'
      '  , N.Name'
      
        '  , N.Name||coalesce('#39' ('#39'||o.O_Name||'#39')'#39', '#39#39')||coalesce('#39' '#39'||S.S' +
        'treet_Name||'#39' '#39'||h.House_No, '#39#39') NODE_NAME'
      '  , N.Notice'
      '  , N.Floor_N'
      '  , N.Porch_N'
      '  , N.Place'
      '  , o.O_Name'
      '  , o.O_DIMENSION as COLOR'
      '  , S.Street_Name||'#39' '#39'||s.street_short Street_Name '
      '  , H.House_No'
      '  from NODES n'
      '       inner join HOUSE H on (n.HOUSE_ID = H.HOUSE_ID)'
      '       inner join STREET S on (H.STREET_ID = S.STREET_ID)'
      
        '       inner join objects o on (o.O_Id = n.Type_Id and o.O_Type ' +
        '= 38)'
      '  where n.NODE_ID <> :NODE_ID'
      'order by NODE_NAME')
    AutoUpdateOptions.UpdateTableName = 'NODES'
    AutoUpdateOptions.KeyFields = 'NODE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = trRead
    AutoCommit = True
    Left = 301
    Top = 210
    poUseBooleanField = False
    poSetRequiredFields = True
    oVisibleRecno = True
    oFetchAll = True
  end
  object srcNodes: TDataSource
    AutoEdit = False
    DataSet = dsNodes
    Left = 300
    Top = 254
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
    Left = 107
    Top = 210
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
    Left = 107
    Top = 258
  end
  object srcMain: TDataSource
    AutoEdit = False
    DataSet = dsNodes
    Left = 356
    Top = 54
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
      '  where (m.Is_Unit = 0) or (m.Is_Unit is null)'
      'order by m.NAME, mg.Mg_Name')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 242
    Top = 210
  end
  object srcMat: TDataSource
    AutoEdit = False
    DataSet = dsMat
    Left = 244
    Top = 252
  end
  object srcLabel: TDataSource
    AutoEdit = False
    DataSet = dsLabel
    Left = 356
    Top = 254
  end
  object dsLabel: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      'o.O_Name NAME, coalesce(o.O_Charfield, '#39#39') LABELS'
      'from objects o'
      'where o.O_Type = 62'
      'order by o.O_Name')
    AutoUpdateOptions.UpdateTableName = 'NODES'
    AutoUpdateOptions.KeyFields = 'NODE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = trRead
    AutoCommit = True
    Left = 357
    Top = 210
    poUseBooleanField = False
    poSetRequiredFields = True
    oVisibleRecno = True
    oFetchAll = True
  end
end
