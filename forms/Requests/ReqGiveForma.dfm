object ReqGiveForm: TReqGiveForm
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1042#1099#1076#1072#1090#1100' '#1079#1072#1103#1074#1082#1091'('#1080')'
  ClientHeight = 297
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    265
    297)
  PixelsPerInch = 96
  TextHeight = 13
  ShowHint = True
  object lbl1: TLabel
    Left = 8
    Top = 4
    Width = 41
    Height = 13
    Caption = #1053#1072' '#1076#1072#1090#1091
  end
  object lbl2: TLabel
    Left = 8
    Top = 48
    Width = 46
    Height = 13
    Caption = #1053#1072' '#1047#1074#1077#1085#1086
  end
  object Label1: TLabel
    Left = 8
    Top = 93
    Width = 218
    Height = 13
    Caption = #1080#1083#1080' '#1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080' ('#1077#1089#1083#1080' '#1085#1077' '#1091#1082#1072#1079#1072#1085#1086' '#1079#1074#1074#1077#1085#1086')'
  end
  inline frmOk: TOkCancelFrame
    Left = 0
    Top = 262
    Width = 265
    Height = 35
    Align = alBottom
    TabOrder = 3
    TabStop = True
    inherited bbOk: TBitBtn
      Left = 3
      Top = 7
      Width = 259
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1042#1099#1076#1072#1090#1100
      TabOrder = 1
      OnClick = frmOkbbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 271
      Top = 6
      TabOrder = 0
    end
  end
  object luWorkGroup: TDBLookupComboboxEh
    Left = 3
    Top = 66
    Width = 259
    Height = 21
    Hint = 
      #1045#1089#1083#1080' '#1085#1077' '#1091#1082#1072#1079#1099#1074#1072#1090#1100' '#1079#1074#1077#1085#1086', '#13#10#1090#1086' '#1073#1091#1076#1077#1090' '#1074#1099#1076#1072#1085#1086' '#1090#1086#1084#1091' '#1079#1074#1077#1085#1091', '#1082#1086#1090#1086#1088#1086#1077' '#1087 +
      #1088#1080#1082#1088#1077#1087#1083#1077#1085#1086' '#1082' '#1076#1086#1084#1091
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    DropDownBox.Columns = <
      item
        FieldName = 'WG_NAME'
      end
      item
        FieldName = 'WA_NAME'
      end>
    EditButtons = <>
    KeyField = 'WG_ID'
    ListField = 'WG_NAME'
    ListSource = srcWORKGROUP
    TabOrder = 1
    Visible = True
  end
  object deDate: TDBDateTimeEditEh
    Left = 3
    Top = 21
    Width = 259
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <>
    TabOrder = 0
    Visible = True
    EditFormat = 'DD/MM/YYYY HH:NN'
  end
  object dbGrid: TDBGridEh
    Left = 0
    Top = 109
    Width = 265
    Height = 153
    AllowedOperations = [alopUpdateEh]
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoFitColWidths = False
    DataSource = srcWorkers
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghColumnResize, dghColumnMove]
    SortLocal = True
    TabOrder = 2
    TitleParams.MultiTitle = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FIO'
        Footers = <>
        Title.Caption = #1060#1048#1054
        Width = 150
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'SELECTED'
        Footers = <>
        Title.Caption = #1048#1057#1055
        Width = 30
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object dsWORKGROUP: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '    s.WG_ID,'
      '    s.name as wg_name,'
      '    a.name as wa_name'
      'from workgroups s'
      '   inner join workarea a on (s.wa_id = a.wa_id)'
      'order by 2,3')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 144
    Top = 43
    oFetchAll = True
  end
  object srcWORKGROUP: TDataSource
    DataSet = dsWORKGROUP
    Left = 83
    Top = 48
  end
  object dsW: TpFIBDataSet
    DeleteSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'select'
      
        '    w.worker_id, w.surname || '#39' '#39' || coalesce(w.firstname, '#39#39') |' +
        '| '#39' '#39' || coalesce(w.midlename, '#39#39') as FIO'
      '  from worker w'
      '  where w.working = 1'
      '        and w.in_request = 1'
      '  order by 2  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 71
    Top = 152
  end
  object srcWorkers: TDataSource
    DataSet = memWorkers
    Left = 67
    Top = 205
  end
  object memWorkers: TMemTableEh
    FieldDefs = <
      item
        Name = 'WORKER_ID'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'FIO'
        DataType = ftString
        Size = 92
      end
      item
        Name = 'SELECTED'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 168
    Top = 158
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object WORKER_ID: TMTNumericDataFieldEh
          FieldName = 'WORKER_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'WORKER_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object FIO: TMTStringDataFieldEh
          FieldName = 'FIO'
          StringDataType = fdtStringEh
          DisplayLabel = 'FIO'
          DisplayWidth = 92
          Size = 92
          Transliterate = True
        end
        object SELECTED: TMTBooleanDataFieldEh
          FieldName = 'SELECTED'
          DisplayLabel = 'SELECTED'
          DisplayWidth = 92
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
end
