object GridForm: TGridForm
  Left = 496
  Top = 494
  ClientHeight = 298
  ClientWidth = 437
  Color = clBtnFace
  Constraints.MinHeight = 320
  Constraints.MinWidth = 240
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object splPG: TSplitter
    Left = 0
    Top = 81
    Width = 437
    Height = 4
    Cursor = crVSplit
    Align = alTop
    Visible = False
  end
  object dbGrid: TDBGridEh
    Left = 0
    Top = 85
    Width = 437
    Height = 213
    Align = alClient
    DataSource = srcDataSource
    DynProps = <>
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
    PopupMenu = pmPopUp
    SearchPanel.Enabled = True
    SortLocal = True
    STFilter.Local = True
    TabOrder = 2
    TitleParams.MultiTitle = True
    OnDblClick = dbGridDblClick
    OnGetFooterParams = dbGridGetFooterParams
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object tlbMain: TToolBar
    Left = 0
    Top = 0
    Width = 437
    Height = 25
    Caption = 'tlbMain'
    Images = A4MainForm.ICONS_ACTIVE
    TabOrder = 0
    object ToolButton4: TToolButton
      Left = 0
      Top = 0
      Width = 5
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnNew: TToolButton
      Left = 5
      Top = 0
      Action = actNew
    end
    object btnEdit: TToolButton
      Left = 28
      Top = 0
      Action = actEdit
    end
    object ToolButton5: TToolButton
      Left = 51
      Top = 0
      Width = 4
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 55
      Top = 0
      Width = 4
      Caption = 'ToolButton6'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object btnDelete: TToolButton
      Left = 59
      Top = 0
      Action = actDelete
    end
    object ToolButton9: TToolButton
      Left = 82
      Top = 0
      Width = 15
      Caption = 'ToolButton9'
      ImageIndex = 27
      Style = tbsSeparator
    end
    object tbOk: TToolButton
      Left = 97
      Top = 0
      Caption = 'tbOk'
      Enabled = False
      ImageIndex = 25
    end
    object ToolButton10: TToolButton
      Left = 120
      Top = 0
      Width = 4
      Caption = 'ToolButton10'
      ImageIndex = 28
      Style = tbsSeparator
    end
    object tbCancel: TToolButton
      Left = 124
      Top = 0
      Caption = 'tbCancel'
      Enabled = False
      ImageIndex = 26
    end
    object ToolButton20: TToolButton
      Left = 147
      Top = 0
      Width = 8
      Caption = 'ToolButton20'
      ImageIndex = 28
      Style = tbsSeparator
    end
    object btnQuickFilter: TToolButton
      Left = 155
      Top = 0
      Action = actQuickFilter
    end
  end
  object pnlEdit: TPanel
    Left = 0
    Top = 25
    Width = 437
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    DesignSize = (
      437
      56)
    object btnSaveLink: TBitBtn
      Left = 73
      Top = 23
      Width = 251
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = btnSaveLinkClick
    end
    object btnCancelLink: TBitBtn
      Left = 342
      Top = 23
      Width = 86
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCancelLinkClick
    end
  end
  object srcDataSource: TDataSource
    AutoEdit = False
    OnStateChange = srcDataSourceStateChange
    Left = 72
    Top = 128
  end
  object actions: TActionList
    Left = 78
    Top = 208
    object actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' (Ins)'
      ImageIndex = 2
      ShortCut = 45
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100' (Ctrl+Del)'
      ImageIndex = 3
      ShortCut = 16430
    end
    object actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' (F2)'
      ImageIndex = 4
      ShortCut = 113
    end
    object actQuickFilter: TAction
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088' (Ctrl+Q)'
      ImageIndex = 40
      ShortCut = 16465
      OnExecute = actQuickFilterExecute
    end
    object actFilterFLD: TAction
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1079#1085#1072#1095#1077#1085#1080#1102
      OnExecute = actFilterFLDExecute
    end
    object actPrintGrid: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1090#1072#1073#1083#1080#1094#1099
      OnExecute = actPrintGridExecute
    end
  end
  object pmPopUp: TPopupMenu
    Left = 195
    Top = 135
    object mniFilterFLD: TMenuItem
      Action = actFilterFLD
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
    object pmgSep2: TMenuItem
      Caption = '-'
    end
    object pmgSaveSelection: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082' ...'
      OnClick = pmgSaveSelectionClick
    end
    object miPrintGrid: TMenuItem
      Action = actPrintGrid
    end
    object pmgSep1: TMenuItem
      Caption = '-'
    end
    object miRefresh: TMenuItem
      Caption = '&'#1055#1077#1088#1077#1095#1080#1090#1072#1090#1100' '#1076#1072#1085#1085#1099#1077
      OnClick = miRefreshClick
    end
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 288
    Top = 200
  end
  object printGridEh: TPrintDBGridEh
    Options = []
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'Tahoma'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'Tahoma'
    PageHeader.Font.Style = []
    Units = MM
    Left = 232
    Top = 216
  end
end
