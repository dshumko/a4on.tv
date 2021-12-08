object NodeLinkForm: TNodeLinkForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1051#1080#1085#1080#1103' '#1089#1074#1103#1079#1080
  ClientHeight = 300
  ClientWidth = 488
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
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 265
    Width = 488
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
      Width = 332
      Anchors = [akLeft, akRight, akBottom]
      ModalResult = 0
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 405
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 488
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      488
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
      Width = 404
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
    Width = 488
    Height = 236
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      488
      236)
    object lbl3: TLabel
      Left = 8
      Top = 119
      Width = 45
      Height = 13
      Caption = #1044#1083#1080#1085#1072', '#1084
    end
    object lbl4: TLabel
      Left = 200
      Top = 119
      Width = 42
      Height = 13
      Caption = #1047#1072#1087#1072#1089', '#1084
    end
    object Label1: TLabel
      Left = 8
      Top = 92
      Width = 48
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object lbl2: TLabel
      Left = 8
      Top = 65
      Width = 50
      Height = 13
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083
    end
    object lbl1: TLabel
      Left = 8
      Top = 38
      Width = 57
      Height = 13
      Caption = #1058#1080#1087' '#1082#1072#1073#1077#1083#1103
    end
    object Label2: TLabel
      Left = 8
      Top = 11
      Width = 33
      Height = 13
      Caption = #1050' '#1091#1079#1083#1091
    end
    object lbl5: TLabel
      Left = 347
      Top = 119
      Width = 41
      Height = 13
      Caption = #1045#1084#1082#1086#1089#1090#1100
    end
    object mmoNOTICE: TDBMemoEh
      Left = 8
      Top = 144
      Width = 472
      Height = 87
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcLink
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 7
      Visible = True
      WantReturns = True
    end
    object ednLength: TDBNumberEditEh
      Left = 76
      Top = 116
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
      Left = 258
      Top = 116
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
      Top = 89
      Width = 404
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
      Top = 35
      Width = 404
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
      OnChange = lcbLinkTypeChange
      OnDropDownBoxGetCellParams = lcbLinkTypeDropDownBoxGetCellParams
    end
    object lcbNode: TDBLookupComboboxEh
      Left = 76
      Top = 8
      Width = 404
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
    end
    object ednSTOCK1: TDBNumberEditEh
      Left = 405
      Top = 116
      Width = 75
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CAPACITY'
      DataSource = srcLink
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = #1046#1080#1083
      EditButtons = <>
      ShowHint = True
      TabOrder = 6
      Visible = True
    end
    object lcbApplMID: TDBLookupComboboxEh
      Left = 76
      Top = 62
      Width = 404
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
  end
  object srcLink: TDataSource
    AutoEdit = False
    DataSet = dsLink
    Left = 70
    Top = 166
  end
  object dsLink: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'update or insert into Wire (WID, WTYPE, Name, Meters, Stock, Poi' +
        'nt_S, Point_E, Notice, CAPACITY, M_ID)'
      
        'values (:WID, :WTYPE, :Name, :Meters, :Stock, :Point_S, :Point_E' +
        ', :Notice, :CAPACITY, :M_ID)'
      'matching (WID)')
    InsertSQL.Strings = (
      
        'update or insert into Wire (WID, WTYPE, Name, Meters, Stock, Poi' +
        'nt_S, Point_E, Notice, CAPACITY, M_ID)'
      
        'values (:WID, :WTYPE, :Name, :Meters, :Stock, :Point_S, :Point_E' +
        ', :Notice, :CAPACITY, :M_ID)'
      'matching (WID)')
    SelectSQL.Strings = (
      'select'
      '   c.*'
      '  from Wire c'
      'where c.WID = :WID')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 26
    Top = 166
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 144
    Top = 166
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
    Left = 296
    Top = 166
  end
  object srcType: TDataSource
    AutoEdit = False
    DataSet = dsType
    Left = 220
    Top = 166
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
      '       inner join objects o on (o.O_Id = n.Type_Id and'
      '             o.O_Type = 38)'
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
    Left = 365
    Top = 170
    poUseBooleanField = False
    poSetRequiredFields = True
    oVisibleRecno = True
    oFetchAll = True
  end
  object srcNodes: TDataSource
    AutoEdit = False
    DataSet = dsNodes
    Left = 420
    Top = 174
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
    Left = 43
    Top = 226
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
    Left = 99
    Top = 226
  end
  object srcMain: TDataSource
    AutoEdit = False
    DataSet = dsNodes
    Left = 364
    Top = 222
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
    Left = 202
    Top = 226
  end
  object srcMat: TDataSource
    AutoEdit = False
    DataSet = dsMat
    Left = 260
    Top = 228
  end
end
