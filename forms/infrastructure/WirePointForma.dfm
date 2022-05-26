object WirePointForm: TWirePointForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1087#1086#1088#1090#1072#1084
  ClientHeight = 254
  ClientWidth = 538
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
    Top = 219
    Width = 538
    Height = 35
    Align = alBottom
    TabOrder = 1
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 64
      Width = 385
      Anchors = [akLeft, akRight, akBottom]
      ModalResult = 0
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 455
    end
  end
  object pnlSecond: TPanel
    Left = 0
    Top = 0
    Width = 538
    Height = 219
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlFind: TPanel
      Left = 0
      Top = 0
      Width = 538
      Height = 219
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        538
        219)
      object Label2: TLabel
        Left = 6
        Top = 48
        Width = 41
        Height = 13
        Caption = #8470' '#1076#1086#1084#1072
      end
      object Label1: TLabel
        Left = 6
        Top = 20
        Width = 31
        Height = 13
        Caption = #1059#1083#1080#1094#1072
      end
      object lbl1: TLabel
        Left = 6
        Top = 76
        Width = 24
        Height = 13
        Caption = #1059#1079#1077#1083
      end
      object lbl2: TLabel
        Left = 6
        Top = 103
        Width = 40
        Height = 13
        Caption = #1052#1077#1090#1088#1072#1078
      end
      object dblHouseNo: TDBLookupComboboxEh
        Left = 64
        Top = 45
        Width = 466
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1044#1086#1084
        EditButtons = <>
        KeyField = 'HOUSE_ID'
        ListField = 'HOUSE_NO'
        ListSource = srcHomes
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object dblStreet: TDBLookupComboboxEh
        Left = 64
        Top = 17
        Width = 466
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        DropDownBox.Columns = <
          item
            FieldName = 'STREET_NAME'
            Title.Caption = #1059#1083#1080#1094#1072
          end
          item
            FieldName = 'STREET_CODE'
            Title.Caption = #1082#1086#1076
          end
          item
            FieldName = 'AREA_NAME'
            Title.Caption = #1056#1072#1081#1086#1085
            Width = 60
          end>
        DropDownBox.AutoDrop = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1059#1083#1080#1094#1072
        EditButtons = <>
        KeyField = 'STREET_ID'
        ListField = 'STREET_NAME'
        ListSource = srcStreets
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
      object lcbNode: TDBLookupComboboxEh
        Left = 64
        Top = 73
        Width = 466
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
        TabOrder = 2
        Visible = True
        OnDropDownBoxGetCellParams = lcbNodeDropDownBoxGetCellParams
      end
      object mmoNotice: TDBMemoEh
        Left = 64
        Top = 128
        Width = 466
        Height = 89
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        ShowHint = True
        TabOrder = 4
        Visible = True
        WantReturns = True
      end
      object ednMeters: TDBNumberEditEh
        Left = 64
        Top = 100
        Width = 145
        Height = 21
        DynProps = <>
        EmptyDataInfo.Text = #1084#1077#1090#1088#1072#1078
        EditButtons = <>
        ShowHint = True
        TabOrder = 3
        Visible = True
      end
    end
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 360
    Top = 30
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
    Left = 291
    Top = 90
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
    Left = 291
    Top = 26
  end
  object dsStreets: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT s.street_id, s.street_name||'#39' '#39'||s.street_short as street' +
        '_name, a.area_name, s.STREET_CODE'
      'FROM STREET s left outer join area a on (a.area_id = s.area_id)'
      'ORDER BY STREET_NAME, a.area_name')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 144
    Top = 32
    oFetchAll = True
  end
  object srcStreets: TDataSource
    DataSet = dsStreets
    Left = 141
    Top = 88
  end
  object dsHomes: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT HOUSE_ID, STREET_ID, HOUSE_NO, Q_FLAT'
      'FROM HOUSE H'
      'where h.street_id = :street_id'
      'order by h.HOUSE_NO')
    Transaction = trRead
    Database = dmMain.dbTV
    DataSource = srcStreets
    Left = 228
    Top = 28
    oFetchAll = True
  end
  object srcHomes: TDataSource
    DataSet = dsHomes
    Left = 225
    Top = 86
  end
  object srcNodes: TDataSource
    AutoEdit = False
    DataSet = dsNodes
    Left = 420
    Top = 86
  end
  object dsNodes: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    N.Node_Id'
      '  , N.Name'
      '  , N.Name || coalesce('#39' ('#39' || o.O_Name || '#39')'#39', '#39#39') NODE_NAME'
      '  , N.Notice'
      '  , N.Floor_N'
      '  , N.Porch_N'
      '  , N.Place'
      '  , o.O_Name'
      '  , o.O_DIMENSION as COLOR'
      '  from NODES n'
      
        '       inner join objects o on (o.O_Id = n.Type_Id and o.O_Type ' +
        '= 38)'
      '  where n.HOUSE_ID = :HOUSE_ID'
      '  order by NODE_NAME')
    AutoUpdateOptions.UpdateTableName = 'NODES'
    AutoUpdateOptions.KeyFields = 'NODE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trRead
    Database = dmMain.dbTV
    AutoCommit = True
    DataSource = srcHomes
    Left = 421
    Top = 34
    poUseBooleanField = False
    poSetRequiredFields = True
    oVisibleRecno = True
    oFetchAll = True
  end
end
