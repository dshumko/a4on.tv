object MatDocUnitForm: TMatDocUnitForm
  Left = 496
  Top = 494
  BorderIcons = [biSystemMenu]
  ClientHeight = 531
  ClientWidth = 566
  Color = clBtnFace
  Constraints.MinHeight = 320
  Constraints.MinWidth = 240
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object splPG: TSplitter
    Left = 0
    Top = 153
    Width = 566
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Visible = False
  end
  object dbGrid: TDBGridEh
    Left = 0
    Top = 156
    Width = 566
    Height = 342
    Hint = #1045#1089#1083#1080' '#1103#1095#1077#1081#1082#1072' '#1078#1077#1083#1090#1072#1103', '#1079#1085#1072#1095#1080#1090' '#1074' '#1085#1077#1081' '#1077#1089#1090#1100' '#1088#1091#1089#1089#1082#1080#1077' '#1073#1091#1082#1074#1099
    Align = alClient
    AutoFitColWidths = True
    DataSource = srcDataSource
    DynProps = <>
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
    PopupMenu = pmPopUp
    SearchPanel.Enabled = True
    SortLocal = True
    STFilter.Local = True
    SumList.Active = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    OnDblClick = dbGridDblClick
    OnGetCellParams = dbGridGetCellParams
    OnGetFooterParams = dbGridGetFooterParams
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SERIAL'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1057'/'#1053
        Title.Hint = #1045#1089#1083#1080' '#1103#1095#1077#1081#1082#1072' '#1078#1077#1083#1090#1072#1103', '#1079#1085#1072#1095#1080#1090' '#1074' '#1057'/'#1053' '#1077#1089#1090#1100' '#1088#1091#1089#1089#1082#1080#1077' '#1073#1091#1082#1074#1099
        Title.TitleButton = True
        Width = 150
        OnGetCellParams = dbGridColumns0GetCellParams
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MAC'
        Footers = <>
        Title.Hint = #1045#1089#1083#1080' '#1103#1095#1077#1081#1082#1072' '#1078#1077#1083#1090#1072#1103', '#1079#1085#1072#1095#1080#1090' '#1074' MAC '#1077#1089#1090#1100' '#1088#1091#1089#1089#1082#1080#1077' '#1073#1091#1082#1074#1099
        Title.TitleButton = True
        Width = 121
        OnGetCellParams = dbGridColumns1GetCellParams
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 245
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlEdit: TPanel
    Left = 0
    Top = 0
    Width = 566
    Height = 153
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      566
      153)
    object lbl4: TLabel
      Left = 8
      Top = 11
      Width = 18
      Height = 13
      Caption = #1057'/'#1053
    end
    object lbl41: TLabel
      Left = 8
      Top = 37
      Width = 22
      Height = 13
      Caption = 'MAC'
    end
    object btnClipPast: TSpeedButton
      Left = 175
      Top = 127
      Width = 23
      Height = 22
      Hint = #1059#1076#1072#1083#1103#1077#1090' '#1074#1089#1077' '#1080' '#1074#1089#1090#1072#1074#1083#1103#1077#1090' '#1079#1072#1087#1080#1089#1080' '#1080#1079' '#1073#1091#1092#1077#1088#1072' '#1086#1073#1084#1077#1085#1072
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00939393FF777777FF777777FF7777
        77FF777777FF777777FF777777FF777777FF777777FF939393FFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00797979FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF797979FFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00797979FFFFFFFFFFB3773DFFB377
        3DFFB3773DFFB3773DFFB3773DFFB3773DFFFFFFFFFF797979FFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00797979FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF797979FFA9A9A9FF9696
        96FF969696FF969696FF969696FFFF00FF00797979FFFFFFFFFFB3773DFFB377
        3DFFB3773DFFB3773DFFB3773DFFB3773DFFFFFFFFFF797979FF979797FFF6F6
        F6FFF6F6F6FFF6F6F6FFF6F6F6FFFF00FF00797979FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF797979FF979797FFF6F6
        F6FFC0966CFFC0966CFFC0966CFFFF00FF00797979FFFFFFFFFFB3773DFFB377
        3DFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFF797979FF979797FFF6F6
        F6FFF6F6F6FFF6F6F6FFF6F6F6FFFF00FF00797979FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF9E9E9EFF777777FF777777FF777777FF777777FF979797FFF6F6
        F6FFC0966CFFC0966CFFC0966CFFFF00FF00797979FFFFFFFFFFB3773DFFB377
        3DFFFFFFFFFF787878FFFDFDFDFFFFFFFFFFBBBBBBFF8D8D8DFF979797FFF6F6
        F6FFF6F6F6FFF6F6F6FFF6F6F6FFFF00FF00797979FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF787878FFFDFDFDFFBBBBBBFF888888FFFF00FF00979797FFF6F6
        F6FFC0966CFFC0966CFFF6F6F6FFFF00FF00797979FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF797979FFBABABAFF878787FFFF00FF00FF00FF00979797FFF6F6
        F6FFF6F6F6FFF6F6F6FFF6F6F6FFFF00FF00777777FF777777FF777777FF7777
        77FF777777FF777777FF8B8B8BFFFF00FF00FF00FF00FF00FF00979797FFF6F6
        F6FFC0966CFFC0966CFFF6F6F6FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00979797FFF6F6
        F6FFF6F6F6FFF6F6F6FFF6F6F6FF979797FFF4F4F4FFC6C6C6FFA2A2A2FFFF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00979797FFF6F6
        F6FFF6F6F6FFF6F6F6FFF6F6F6FF979797FFC5C5C5FFA1A1A1FFFF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00A9A9A9FF9696
        96FF969696FF969696FF969696FF969696FFA4A4A4FFFF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = actClipPastExecute
    end
    object btnSaveLink: TBitBtn
      Left = 204
      Top = 127
      Width = 261
      Height = 22
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 3
      OnClick = btnSaveLinkClick
    end
    object btnDelete: TBitBtn
      Left = 471
      Top = 127
      Width = 86
      Height = 22
      Anchors = [akRight, akBottom]
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 4
      OnClick = btnDeleteClick
    end
    object mmoNotice: TDBMemoEh
      Left = 8
      Top = 61
      Width = 549
      Height = 60
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 2
      Visible = True
      WantReturns = True
    end
    object edtSERIAL: TDBEditEh
      Left = 48
      Top = 8
      Width = 509
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088' ('#1089#1090#1072#1088#1090#1086#1074#1099#1081' '#1085#1086#1084#1077#1088' '#1076#1083#1103' '#1075#1077#1085#1077#1088#1072#1094#1080#1080')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object edtMAC: TDBEditEh
      Left = 48
      Top = 34
      Width = 509
      Height = 21
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'MAC ('#1089#1090#1072#1088#1090#1086#1074#1099#1081' '#1085#1086#1084#1077#1088' '#1076#1083#1103' '#1075#1077#1085#1077#1088#1072#1094#1080#1080')'
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object edCount: TDBNumberEditEh
      Left = 8
      Top = 127
      Width = 161
      Height = 21
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1082#1086#1083'-'#1074#1086' '#1087#1086#1079#1080#1094#1080#1081
      Alignment = taLeftJustify
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = #1057#1086#1079#1076#1072#1090#1100' '#1082#1086#1083'-'#1074#1086' '#1087#1086#1079#1080#1094#1080#1081
      EditButtons = <
        item
          Action = actGenerate
          DefaultAction = False
          Style = ebsPlusEh
        end>
      ShowHint = True
      TabOrder = 5
      Visible = True
    end
  end
  object pnlBtn: TPanel
    Left = 0
    Top = 498
    Width = 566
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      566
      33)
    object btnClose: TButton
      Left = 471
      Top = 5
      Width = 86
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 0
    end
    object btnSave: TButton
      Left = 8
      Top = 5
      Width = 457
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 1
      OnClick = btnSaveClick
    end
  end
  object srcDataSource: TDataSource
    DataSet = mtUnits
    OnStateChange = srcDataSourceStateChange
    Left = 448
    Top = 288
  end
  object actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 150
    Top = 272
    object actGenerate: TAction
      Caption = 'actGenerate'
      OnExecute = actGenerateExecute
    end
    object actClipPast: TAction
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1080#1079' '#1073#1091#1092#1077#1088#1072
      Hint = #1059#1076#1072#1083#1103#1077#1090' '#1074#1089#1077' '#1080' '#1074#1089#1090#1072#1074#1083#1103#1077#1090' '#1079#1072#1087#1080#1089#1080' '#1080#1079' '#1073#1091#1092#1077#1088#1072' '#1086#1073#1084#1077#1085#1072
      ImageIndex = 13
      OnExecute = actClipPastExecute
    end
  end
  object pmPopUp: TPopupMenu
    Left = 315
    Top = 231
    object miClipPast: TMenuItem
      Action = actClipPast
    end
    object mniN1: TMenuItem
      Caption = '-'
    end
    object pmgCopy: TMenuItem
      Caption = '&'#1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = pmgCopyClick
    end
    object pmgSelectAll: TMenuItem
      Caption = '&'#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnClick = pmgSelectAllClick
    end
    object pmgSep1: TMenuItem
      Caption = '-'
    end
    object pmgSaveSelection: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082' ...'
      OnClick = pmgSaveSelectionClick
    end
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 216
    Top = 272
  end
  object dsDMUnits: TpFIBDataSet
    UpdateSQL.Strings = (
      'update Materials_In_Doc_Unit'
      'set Mac = :Mac,'
      '    Notice = :Notice'
      'where (Doc_Id = :Doc_Id)'
      '      and (M_Id = :M_Id)'
      '      and (Id = :id)'
      '      and (Serial = :Serial)')
    DeleteSQL.Strings = (
      'delete from Materials_In_Doc_Unit'
      'where (Doc_Id = :OLD_Doc_Id)'
      '      and (M_Id = :OLD_M_Id)'
      '      and (Id = :OLD_id)'
      '      and (Serial = :OLD_Serial)'
      '      ')
    InsertSQL.Strings = (
      
        'insert into Materials_In_Doc_Unit (Doc_Id, M_Id, id, Serial, Mac' +
        ', Notice, S_Version)'
      'values (:Doc_Id, :M_Id, :id, :Serial, :Mac, :Notice, :S_Version)')
    RefreshSQL.Strings = (
      'select'
      '    u.*'
      '  from Materials_In_Doc_Unit u'
      '  where U.DOC_ID = :OLD_DOC_ID'
      '    and U.M_ID = :OLD_M_ID'
      '    and U.ID = :OLD_ID'
      '    and U.SERIAL = :OLD_SERIAL'
      ''
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    u.*'
      '  from Materials_In_Doc_Unit u'
      '  where u.Doc_Id = :doc_id'
      '    and u.M_Id = :mat_id'
      '    and u.Id = :id    '
      '  order by u.Serial')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_IN_DOC'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 80
    Top = 329
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 168
    Top = 334
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
    Left = 240
    Top = 332
  end
  object mtUnits: TMemTableEh
    Active = True
    Params = <>
    OnNewRecord = mtUnitsNewRecord
    Left = 376
    Top = 288
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object DOC_ID: TMTNumericDataFieldEh
          FieldName = 'DOC_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'DOC_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object M_ID: TMTNumericDataFieldEh
          FieldName = 'M_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'M_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object ID: TMTNumericDataFieldEh
          FieldName = 'ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object SERIAL: TMTStringDataFieldEh
          FieldName = 'SERIAL'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'SERIAL'
          DisplayWidth = 50
          Size = 50
          Transliterate = True
        end
        object MAC: TMTStringDataFieldEh
          FieldName = 'MAC'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'MAC'
          DisplayWidth = 18
          Size = 18
          Transliterate = True
        end
        object NOTICE: TMTStringDataFieldEh
          FieldName = 'NOTICE'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'NOTICE'
          DisplayWidth = 1000
          Size = 1000
          Transliterate = True
        end
        object S_VERSION: TMTStringDataFieldEh
          FieldName = 'S_VERSION'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'S_VERSION'
          DisplayWidth = 50
          Size = 50
          Transliterate = True
        end
        object ERROR: TMTStringDataFieldEh
          FieldName = 'ERROR'
          StringDataType = fdtStringEh
          DisplayWidth = 100
          Size = 255
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
end
