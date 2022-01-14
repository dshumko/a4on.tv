object apgNodeMaterials: TapgNodeMaterials
  Left = 0
  Top = 0
  Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077'/'#1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1091#1079#1083#1072
  ClientHeight = 211
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgMat: TDBGridEh
    Left = 26
    Top = 0
    Width = 753
    Height = 211
    Align = alClient
    AllowedOperations = []
    AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
    ColumnDefValues.AlwaysShowEditButton = True
    ColumnDefValues.Title.TitleButton = True
    ColumnDefValues.Title.ToolTips = True
    ColumnDefValues.ToolTips = True
    Ctl3D = True
    DataGrouping.Color = clGradientInactiveCaption
    DataGrouping.GroupRowDefValues.FooterInGroupRow = True
    DataGrouping.GroupRowDefValues.RowHeight = 4
    DataGrouping.GroupRowDefValues.RowLines = 1
    DataGrouping.ParentColor = False
    DataSource = srcMat
    DynProps = <>
    EditActions = [geaCopyEh, geaSelectAllEh]
    EvenRowColor = clWindow
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.GridBoundaries = True
    IndicatorTitle.ShowDropDownSign = True
    IndicatorTitle.TitleButton = True
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghHotTrack, dghExtendVertLines]
    ParentCtl3D = False
    ParentShowHint = False
    RowDetailPanel.Height = 200
    RowSizingAllowed = True
    SearchPanel.Enabled = True
    ShowHint = True
    SortLocal = True
    STFilter.FilterButtonDrawTime = fbdtWhenRowHotEh
    STFilter.InstantApply = True
    STFilter.Local = True
    STFilter.Location = stflInTitleFilterEh
    SumList.Active = True
    TabOrder = 0
    TitleParams.MultiTitle = True
    TitleParams.VTitleMargin = 8
    VertScrollBar.SmoothStep = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1086'/'#1084
        Title.Hint = #1058#1080#1087' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103'/'#1084#1072#1090#1077#1088#1080#1072#1083#1072
        Width = 99
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
        Width = 203
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SERIAL'
        Footers = <>
        Title.Caption = #1057'/'#1053
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DIMENSION'
        Footers = <>
        Title.Caption = #1045#1076'.'#1080#1079#1084'.'
        Width = 56
      end
      item
        CellButtons = <>
        DisplayFormat = ',#.##'
        DynProps = <>
        EditButtons = <>
        FieldName = 'QUANT'
        Footer.Alignment = taRightJustify
        Footer.DisplayFormat = ',#.##'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 65
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 216
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 211
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      26
      211)
    object btnDel1: TSpeedButton
      Left = 2
      Top = 188
      Width = 22
      Height = 22
      Action = actDel
      Anchors = [akLeft, akBottom]
      Flat = True
      Layout = blGlyphTop
    end
    object btnAdd1: TSpeedButton
      Left = 2
      Top = 4
      Width = 22
      Height = 22
      Action = actAdd
      Flat = True
    end
    object btnFind: TSpeedButton
      Left = 2
      Top = 40
      Width = 22
      Height = 22
      Action = actFind
      Flat = True
    end
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
    Left = 347
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
    Left = 411
    Top = 98
  end
  object srcMat: TDataSource
    DataSet = dsMat
    Left = 119
    Top = 83
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 211
    Top = 78
    object actAdd: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077'/'#1084#1072#1090#1077#1088#1080#1072#1083#1072
      ImageIndex = 2
      OnExecute = actAddExecute
    end
    object actDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 3
      OnExecute = actDelExecute
    end
    object actFind: TAction
      Hint = #1053#1072#1081#1090#1080' '#1074' '#1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1080' '#1074' '#1089#1077#1090#1080
      ImageIndex = 7
      OnExecute = actFindExecute
    end
  end
  object dsMat: TpFIBDataSet
    DeleteSQL.Strings = (
      'delete from Inventory i'
      '    where i.Owner = :OLD_NODE_ID'
      '          and i.Owner_Type = 2'
      '          and i.M_Id = :OLD_M_ID'
      '          and i.Serial = :OLD_SERIAL   ')
    RefreshSQL.Strings = (
      'select'
      '    m.Name'
      '  , i.Serial'
      '  , m.Dimension'
      '  , i.M_Id'
      '--  , i.State'
      '  , i.Quant'
      '  , i.Notice'
      '  from Inventory i'
      '       inner join materials m on (m.M_Id = i.M_Id)'
      '  where(  i.Owner = :node_id'
      '        and i.OWNER_TYPE = 2'
      '     ) and (     I.SERIAL = :OLD_SERIAL'
      '    and I.M_ID = :OLD_M_ID'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    o.O_Name'
      '  , m.Name'
      '  , i.Serial'
      '  , m.Dimension'
      '  , i.M_Id'
      '  , i.Quant'
      '  , i.Notice'
      '  , '#39'm'#39' ROW_TYPE'
      '  from Inventory i'
      '       inner join materials m on (m.M_Id = i.M_Id)'
      
        '       left outer join objects o on (o.O_Id = m.M_Type and o.O_T' +
        'ype = 48)'
      '  where i.Owner = :node_id'
      '        and i.OWNER_TYPE = 2'
      'union'
      'select'
      '  o.o_name'
      '  ,  E.Name'
      '  , e.Mac Serial'
      '  , '#39#39' Dimension'
      '  , e.Eid M_Id'
      '  ,  1 Quant'
      '  , e.Notice'
      '  , '#39'e'#39' ROW_TYPE'
      '  from EQUIPMENT E'
      
        '       left outer join objects o on (e.eq_group = o.o_id and o.O' +
        '_TYPE = 7)'
      '  where e.Node_Id = :node_id'
      ''
      'order by 1,2,3')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 64
    Top = 88
  end
end
