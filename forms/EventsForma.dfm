object EventsForm: TEventsForm
  ShowHint = True
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083' '#1089#1086#1073#1099#1090#1080#1081
  ClientHeight = 301
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdJournal: TDBGridEh
    Left = 0
    Top = 145
    Width = 562
    Height = 156
    Align = alClient
    AutoFitColWidths = False
    Ctl3D = True
    DataSource = srcJournal
    DrawMemoText = True
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    IndicatorOptions = [gioShowRowIndicatorEh]
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghDialogFind, dghColumnResize, dghColumnMove]
    ParentCtl3D = False
    STFilter.Local = True
    STFilter.Visible = True
    TabOrder = 2
    TitleParams.MultiTitle = True
    OnSortMarkingChanged = dbgrdJournalSortMarkingChanged
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'J_DATE'
        Footers = <>
        Title.Caption = #1053#1072' '#1076#1072#1090#1091
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'SURNAME'
        Footers = <>
        Title.Caption = #1050#1054#1052#1059
        Width = 127
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'J_NOTICE'
        Footers = <>
        Title.Caption = #1058#1045#1050#1057#1058
        Width = 164
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object tbEvents: TToolBar
    Left = 0
    Top = 0
    Width = 562
    Height = 25
    Caption = 'tbEvents'
    Images = A4MainForm.ICONS_ACTIVE
    TabOrder = 0
    object ToolButton4: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnAdd: TToolButton
      Left = 8
      Top = 0
      Action = actAdd
    end
    object ToolButton5: TToolButton
      Left = 31
      Top = 0
      Width = 4
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnEdit: TToolButton
      Left = 35
      Top = 0
      Action = actEdit
    end
    object ToolButton6: TToolButton
      Left = 58
      Top = 0
      Width = 4
      Caption = 'ToolButton6'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 62
      Top = 0
      Action = actDelete
    end
    object ToolButton9: TToolButton
      Left = 85
      Top = 0
      Width = 15
      Caption = 'ToolButton9'
      ImageIndex = 27
      Style = tbsSeparator
      Visible = False
    end
    object tbOk: TToolButton
      Left = 100
      Top = 0
      Caption = 'tbOk'
      Enabled = False
      ImageIndex = 25
      Visible = False
      OnClick = tbOkClick
    end
    object ToolButton10: TToolButton
      Left = 123
      Top = 0
      Width = 4
      Caption = 'ToolButton10'
      ImageIndex = 28
      Style = tbsSeparator
      Visible = False
    end
    object tbCancel: TToolButton
      Left = 127
      Top = 0
      Caption = 'tbCancel'
      Enabled = False
      ImageIndex = 26
      Visible = False
      OnClick = tbCancelClick
    end
  end
  object pnlEdit: TPanel
    Left = 0
    Top = 25
    Width = 562
    Height = 120
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    DesignSize = (
      562
      120)
    object Label8: TLabel
      Left = 6
      Top = 38
      Width = 29
      Height = 13
      Caption = #1058#1077#1082#1089#1090
    end
    object Label1: TLabel
      Left = 6
      Top = 9
      Width = 41
      Height = 13
      Caption = #1053#1072' '#1076#1072#1090#1091
    end
    object Label2: TLabel
      Left = 213
      Top = 9
      Width = 25
      Height = 13
      Caption = #1050#1086#1084#1091
    end
    object DBLookupComboboxEh1: TDBLookupComboboxEh
      Left = 256
      Top = 6
      Width = 297
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'J_WHOM'
      DataSource = srcJournal
      EditButtons = <>
      KeyField = 'IBNAME'
      ListField = 'SURNAME'
      ListSource = srcWorker
      TabOrder = 1
      Visible = True
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 73
      Top = 6
      Width = 121
      Height = 21
      DataField = 'J_DATE'
      DataSource = srcJournal
      DynProps = <>
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 0
      Visible = True
    end
    object DBMemo1: TDBMemoEh
      Left = 73
      Top = 35
      Width = 480
      Height = 41
      Anchors = [akLeft, akTop, akRight]
      DataField = 'J_NOTICE'
      DataSource = srcJournal
      ScrollBars = ssVertical
      TabOrder = 2
    end
    object btnSaveLink: TBitBtn
      Left = 73
      Top = 87
      Width = 376
      Height = 25
      Anchors = [akLeft, akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 3
      OnClick = btnSaveLinkClick
    end
    object btnCancelLink: TBitBtn
      Left = 467
      Top = 87
      Width = 86
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 4
      OnClick = btnCancelLinkClick
    end
  end
  object srcJournal: TDataSource
    DataSet = dsJournal
    OnStateChange = srcJournalStateChange
    Left = 232
    Top = 176
  end
  object dsJournal: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE JOURNAL'
      'SET '
      '    J_ID = :J_ID,'
      '    J_DATE = :J_DATE,'
      '    J_NOTICE = :J_NOTICE,'
      '    J_WHOM = :J_WHOM'
      'WHERE'
      '    J_ID = :OLD_J_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    JOURNAL'
      'WHERE'
      '        J_ID = :OLD_J_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO JOURNAL('
      '    J_ID,'
      '    J_DATE,'
      '    J_NOTICE,'
      '    J_WHOM'
      ')'
      'VALUES('
      '    :J_ID,'
      '    :J_DATE,'
      '    :J_NOTICE,'
      '    :J_WHOM'
      ')')
    RefreshSQL.Strings = (
      
        'select J_ID, J_DATE, J_NOTICE, J_WHOM, iif(J_WHOM = '#39'ALL'#39','#39#1042#1089#1077#1084#39 +
        ', w.Surname) Surname'
      'from JOURNAL j left outer join Worker w on (j.J_Whom = w.Ibname)'
      'where(  (j.j_whom = current_user) or (j.j_whom = '#39'ALL'#39')'
      '     ) and (     J.J_ID = :OLD_J_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      
        'select J_ID, J_DATE, J_NOTICE, J_WHOM, iif(J_WHOM = '#39'ALL'#39','#39#1042#1089#1077#1084#39 +
        ', w.Surname) Surname'
      'from JOURNAL j left outer join Worker w on (j.J_Whom = w.Ibname)'
      'where (j.j_whom = current_user) or (j.j_whom = '#39'ALL'#39')'
      'order by J_DATE')
    AutoUpdateOptions.GeneratorName = 'GEN_JOURNAL'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 185
    Top = 168
    oFetchAll = True
  end
  object actlst1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 20
    Top = 167
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 2
      OnExecute = actAddExecute
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = actDeleteExecute
    end
    object actEdit: TAction
      Caption = 'actEdit'
      ImageIndex = 4
      OnExecute = actEditExecute
    end
  end
  object dsWorker: TpFIBDataSet
    SelectSQL.Strings = (
      'select '#39#1042#1089#1077#1084#39' as SURNAME, '#39'ALL'#39' as IBNAME from rdb$database'
      'union all'
      
        'select W.SURNAME, W.IBNAME from WORKER W where w.working = 1 and' +
        ' w.ibname is not null')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    Left = 79
    Top = 191
  end
  object srcWorker: TDataSource
    DataSet = dsWorker
    Left = 78
    Top = 243
  end
  object pmGrid: TPopupMenu
    Left = 301
    Top = 142
    object N1: TMenuItem
      Action = actDelete
    end
  end
end
