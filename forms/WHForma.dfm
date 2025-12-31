inherited WHform: TWHform
  Caption = #1057#1082#1083#1072#1076#1099
  ClientHeight = 516
  ClientWidth = 692
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 161
    Width = 692
  end
  object Splitter1: TSplitter [1]
    Left = 0
    Top = 380
    Width = 692
    Height = 4
    Cursor = crVSplit
    Align = alTop
  end
  inherited dbGrid: TDBGridEh
    AlignWithMargins = True
    Left = 3
    Top = 168
    Width = 686
    Height = 209
    Align = alTop
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 120
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'W_OWNER'
        Footers = <>
        Title.Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081
        Title.TitleButton = True
        Width = 141
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 264
      end
      item
        CellButtons = <>
        DisplayFormat = '#.#####'
        DynProps = <>
        EditButtons = <>
        FieldName = 'REM'
        Footers = <>
        Title.Caption = #1054#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1089#1082#1083#1072#1076#1077
        Title.TitleButton = True
        Width = 64
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DELETED'
        Footers = <>
        Title.Caption = #1057#1082#1088#1099#1090
        Title.Hint = #1053#1077#1076#1086#1089#1090#1091#1087#1077#1085' '#1076#1083#1103' '#1086#1087#1077#1088#1072#1094#1080#1081' '#1089#1086' '#1089#1082#1083#1072#1076#1086#1084
        Title.TitleButton = True
        Width = 77
      end>
  end
  inherited tlbMain: TToolBar
    Width = 692
    inherited btnDelete: TToolButton
      Hint = #1059#1076#1072#1083#1080#1090#1100', '#1077#1089#1083#1080' '#1085#1077' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1083#1089#1103' (Ctrl+Del)'
    end
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
    end
    inherited ToolButton20: TToolButton
      Visible = False
    end
  end
  inherited pnlEdit: TPanel
    Width = 692
    Height = 136
    object lbl2: TLabel [0]
      Left = 5
      Top = 9
      Width = 32
      Height = 13
      Caption = #1057#1082#1083#1072#1076
    end
    object lbl3: TLabel [1]
      Left = 5
      Top = 62
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object lbl4: TLabel [2]
      Left = 5
      Top = 36
      Width = 81
      Height = 13
      Caption = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081
    end
    inherited btnSaveLink: TBitBtn
      Left = 97
      Top = 108
      Width = 482
      TabOrder = 4
    end
    inherited btnCancelLink: TBitBtn
      Left = 597
      Top = 108
      TabOrder = 5
    end
    object edtName: TDBEditEh
      Left = 97
      Top = 6
      Width = 586
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1082#1083#1072#1076#1072
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dbmmoO_DESCRIPTION: TDBMemoEh
      Left = 97
      Top = 59
      Width = 586
      Height = 41
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 2
      Visible = True
      WantReturns = True
    end
    object cbbOwner: TDBLookupComboboxEh
      Left = 97
      Top = 33
      Width = 586
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'OWNER_ID'
      DataSource = srcDataSource
      EmptyDataInfo.Text = #1054#1090#1074#1077#1090#1089#1090#1074#1077#1085#1085#1099#1081
      EditButtons = <>
      KeyField = 'WORKER_ID'
      ListField = 'W_OWNER'
      ListSource = srcOwner
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object chkDel: TDBCheckBoxEh
      Left = 5
      Top = 85
      Width = 77
      Height = 17
      Hint = #1053#1077#1076#1086#1089#1090#1091#1087#1077#1085' '#1076#1083#1103' '#1086#1087#1077#1088#1072#1094#1080#1081' '#1089#1086' '#1089#1082#1083#1072#1076#1086#1084
      Alignment = taLeftJustify
      Anchors = [akLeft, akBottom]
      Caption = #1057#1082#1088#1099#1090
      DataField = 'O_DELETED'
      DataSource = srcDataSource
      DynProps = <>
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  object pnlBtm: TPanel [5]
    Left = 0
    Top = 384
    Width = 692
    Height = 132
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object lbl1: TLabel
      Left = 0
      Top = 0
      Width = 692
      Height = 13
      Align = alTop
      Caption = #1055#1088#1072#1074#1072' '#1076#1086#1089#1090#1091#1087#1082#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081' '#1082' '#1089#1082#1083#1072#1076#1091
    end
    object dbgRights: TDBGridEh
      AlignWithMargins = True
      Left = 3
      Top = 16
      Width = 686
      Height = 113
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataSource = srcRights
      DynProps = <>
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = True
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
      SearchPanel.Enabled = True
      SortLocal = True
      STFilter.Local = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      OnExit = dbgRightsExit
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FIO'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100'|'#1060#1048#1054
          Title.SortIndex = 1
          Title.SortMarker = smDownEh
          Title.TitleButton = True
          Width = 178
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'LOCKEDOUT'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100'|'#1041#1083#1086#1082'-'#1085
          Title.Hint = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085
          Title.TitleButton = True
          Width = 86
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'CAN_VIEW'
          Footers = <>
          Title.Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1086'|'#1055#1088#1086#1089#1084#1072#1090#1088#1080#1074#1072#1090#1100
          Title.TitleButton = True
          Width = 100
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'CAN_EDIT'
          Footers = <>
          Title.Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1086'|'#1048#1079#1084#1077#1085#1103#1090#1100
          Title.TitleButton = True
          Width = 100
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 264
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsWH
    Left = 256
    Top = 240
  end
  inherited actions: TActionList
    Left = 62
    Top = 240
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1082#1083#1072#1076
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1082#1083#1072#1076
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = actEditExecute
    end
    object actCopyID: TAction
      Caption = 'actCopyID'
      ShortCut = 24649
      OnExecute = actCopyIDExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 331
    Top = 239
  end
  inherited CnErrors: TCnErrorProvider
    Left = 160
    Top = 240
  end
  object dsWH: TpFIBDataSet
    UpdateSQL.Strings = (
      'DELETE FROM OBJECTS'
      'WHERE'
      '    O_ID = :OLD_O_ID and O_TYPE = 10'
      '    ')
    DeleteSQL.Strings = (
      'UPDATE'
      '    OBJECTS SET O_DELETED = 1'
      'WHERE'
      '        O_ID = :OLD_O_ID and O_TYPE = 10'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS('
      '    O_TYPE,'
      '    O_NAME,'
      '    O_DESCRIPTION,'
      '    O_NUMERICFIELD,'
      '    O_DELETED'
      ')'
      'VALUES('
      '    10,'
      '    :O_NAME,'
      '    :O_DESCRIPTION,'
      '    :OWNER_ID,'
      '    :O_DELETED'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_TYPE'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_NUMERICFIELD OWNER_ID'
      
        '  , w.Surname||'#39' '#39'||coalesce(w.Firstname||'#39' '#39'||coalesce(w.Midlen' +
        'ame, '#39#39'), '#39#39') W_OWNER'
      '  , o.O_DELETED'
      
        '  , (select sum(r.Mr_Quant) from Materials_Remain r where r.Wh_I' +
        'd = o.O_ID) REM '
      '  from OBJECTS o'
      
        '       left outer join WORKER w on (o.O_NUMERICFIELD = w.Worker_' +
        'Id)'
      '  where o.O_TYPE = 10'
      '    and o.O_ID = :OLD_O_ID'
      ''
      '     ')
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_TYPE'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_NUMERICFIELD OWNER_ID'
      
        '  , w.Surname||'#39' '#39'||coalesce(w.Firstname||'#39' '#39'||coalesce(w.Midlen' +
        'ame, '#39#39'), '#39#39') W_OWNER'
      '  , coalesce(o.O_DELETED, 0) O_DELETED'
      
        '  , (select sum(r.Mr_Quant) from Materials_Remain r where r.Wh_I' +
        'd = o.O_ID) REM '
      '  from OBJECTS o'
      
        '       left outer join WORKER w on (o.O_NUMERICFIELD = w.Worker_' +
        'Id)'
      '  where o.O_TYPE = 10'
      '  order by o.O_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 112
    Top = 241
  end
  object dsRights: TpFIBDataSet
    UpdateSQL.Strings = (
      'execute block ('
      '    USER_ID  type of UID = :USER_ID,'
      '    WH_ID    type of UID = :WH_ID,'
      '    CAN_VIEW type of d_iboolean = :CAN_VIEW,'
      '    CAN_EDIT type of d_iboolean = :CAN_EDIT,'
      '    NOTICE   type of d_notice = :NOTICE)'
      'as'
      'begin'
      '  if (CAN_EDIT is null) then'
      '    CAN_EDIT = 0;'
      '  if (CAN_VIEW is null) then'
      '    CAN_VIEW = 0;'
      '  if (CAN_EDIT = 1) then'
      '    CAN_VIEW = 1;'
      ''
      
        '  if ((not Wh_Id is null) and ((not USER_ID is null))) then begi' +
        'n'
      
        '    update or insert into Sys$User_Wh (User_Id, Wh_Id, Can_View,' +
        ' Can_Edit, Notice)'
      '    values (:USER_ID, :WH_ID, :Can_View, :Can_Edit, :Notice)'
      '    matching (User_Id, Wh_Id);'
      '  end'
      'end')
    RefreshSQL.Strings = (
      'select'
      '    u.id as USER_ID,'
      '    wh.Wh_Id,'
      
        '    w.Surname || coalesce('#39' '#39' || w.Firstname || coalesce('#39' '#39' || ' +
        'w.Midlename, '#39#39'), '#39#39') || '#39' ('#39' || u.ibname || '#39')'#39' as FIO,'
      '    coalesce(wh.Can_View, 0) Can_View,'
      '    coalesce(wh.Can_Edit, 0) Can_Edit,'
      '    wh.Notice'
      ''
      '  from sys$USER u'
      '       inner join worker w on (w.ibname = u.ibname)'
      '       left outer join sys$user_wh wh on (wh.User_Id = u.Id)'
      '  where(  wh.Wh_Id = :O_ID'
      '     ) and (     U.ID = :OLD_USER_ID'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    u.id as USER_ID,'
      '    coalesce(u.Lockedout,0) Lockedout,'
      '    wh.Wh_Id,'
      
        '    w.Surname || coalesce('#39' '#39' || w.Firstname || coalesce('#39' '#39' || ' +
        'w.Midlename, '#39#39'), '#39#39') || '#39' ('#39' || u.ibname || '#39')'#39' as FIO,'
      '    coalesce(wh.Can_View, 0) Can_View,'
      '    coalesce(wh.Can_Edit, 0) Can_Edit,'
      '    wh.Notice'
      ''
      '  from sys$USER u'
      '       inner join worker w on (w.ibname = u.ibname)'
      
        '       left outer join sys$user_wh wh on (wh.User_Id = u.Id and ' +
        'wh.Wh_Id = :O_ID)'
      '  order by 2')
    BeforePost = dsRightsBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 479
    Top = 309
  end
  object srcRights: TDataSource
    DataSet = dsRights
    Left = 560
    Top = 315
  end
  object srcOwner: TDataSource
    AutoEdit = False
    DataSet = dsOwner
    OnStateChange = srcDataSourceStateChange
    Left = 560
    Top = 248
  end
  object dsOwner: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    w.Worker_Id'
      
        '  , w.Surname || coalesce('#39' '#39' ||w.Firstname || coalesce('#39' '#39' || w' +
        '.Midlename, '#39#39'), '#39#39') W_OWNER'
      '  from WORKER w'
      '  where w.Working = 1'
      '  order by 2')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 480
    Top = 249
  end
end
