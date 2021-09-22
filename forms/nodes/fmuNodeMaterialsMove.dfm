object apgNodeMaterialsMove: TapgNodeMaterialsMove
  Left = 0
  Top = 0
  Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099' '#1091#1079#1083#1072
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
    FooterParams.Color = clBtnFace
    GridLineParams.GridBoundaries = True
    IndicatorTitle.ShowDropDownSign = True
    IndicatorTitle.TitleButton = True
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghHotTrack, dghExtendVertLines]
    ParentCtl3D = False
    ParentShowHint = False
    RowDetailPanel.Height = 200
    RowSizingAllowed = True
    ShowHint = True
    SortLocal = True
    STFilter.FilterButtonDrawTime = fbdtWhenRowHotEh
    STFilter.InstantApply = True
    STFilter.Local = True
    STFilter.Location = stflInTitleFilterEh
    STFilter.Visible = True
    SumList.Active = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    TitleParams.VTitleMargin = 5
    VertScrollBar.SmoothStep = True
    OnDblClick = dbgMatDblClick
    Columns = <
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
        FieldName = 'DIMENSION'
        Footers = <>
        Title.Caption = #1045#1076'.'#1080#1079#1084'.'
        Width = 56
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WH_NAME'
        Footers = <>
        Title.Caption = #1057#1082#1083#1072#1076
        Width = 112
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RQ_ID'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1047#1072#1103#1074#1082#1072
        Width = 76
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RQ_EXEC_TIME'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
        Width = 87
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'OPER'
        Footers = <>
        Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
        Width = 133
      end
      item
        CellButtons = <>
        DisplayFormat = ',#.##'
        DynProps = <>
        EditButtons = <>
        FieldName = 'QNT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 65
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 211
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object btnDetail: TSpeedButton
      Left = 2
      Top = 3
      Width = 22
      Height = 22
      Action = actDetail
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
    Left = 331
    Top = 42
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
    Left = 371
    Top = 42
  end
  object srcMat: TDataSource
    DataSet = dsMat
    Left = 63
    Top = 35
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 195
    Top = 54
    object actAdd: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1079#1072#1103#1074#1082#1091
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1079#1072#1103#1074#1082#1091
      ImageIndex = 37
      ShortCut = 116
    end
    object actDetail: TAction
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1089#1090#1086#1088#1080#1102' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      ImageIndex = 24
      OnExecute = actDetailExecute
    end
  end
  object dsMat: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    NM.M_ID'
      '  , M.NAME'
      '  , M.COST'
      '  , M.DIMENSION'
      '  , NM.MT * NM.QUANT QNT'
      '  , iif(NM.MT = 1, '#39#1059#1089#1090#1072#1085#1086#1074#1082#1072#39', '#39#1042#1086#1079#1074#1088#1072#1090#39') OPER'
      '  , NM.RQ_ID'
      '  , NM.RQ_EXEC_TIME'
      '  , O.O_NAME WH_NAME'
      'from (select'
      '          RM.M_ID'
      '        , RM.RM_NOTICE NOTICE'
      '        , RM.RM_QUANT QUANT'
      '        , RM.WH_ID'
      '        , 1 as MT'
      '        , RM.RM_ID'
      '        , R.RQ_ID'
      '        , R.RQ_EXEC_TIME'
      '      from REQUEST R'
      
        '          inner join REQUEST_MATERIALS RM on (R.RQ_ID = RM.RQ_ID' +
        ')'
      ''
      '      where R.NODE_ID = :NODE_ID'
      '      union all'
      '      select'
      '          RM.M_ID'
      '        , RM.NOTICE NOTICE'
      '        , RM.QUANT QUANT'
      '        , RM.WH_ID'
      '        , -1 as MT'
      '        , RM.ID RM_ID'
      '        , R.RQ_ID'
      '        , R.RQ_EXEC_TIME'
      '      from REQUEST R'
      
        '          inner join REQUEST_MATERIALS_RETURN RM on (R.RQ_ID = R' +
        'M.RQ_ID)'
      '      where R.NODE_ID = :NODE_ID) NM'
      '    inner join MATERIALS M on (M.M_ID = NM.M_ID)'
      
        '    left outer join OBJECTS O on (O.O_ID = NM.WH_ID and O.O_TYPE' +
        ' = 10)')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 336
    Top = 96
  end
end
