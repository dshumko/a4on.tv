object ReportChild: TReportChild
  Left = 197
  Top = 117
  ActiveControl = frxPreview
  Caption = ' '#1055#1088#1077#1076#1074#1072#1088#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1088#1086#1089#1084#1086#1090#1088' '
  ClientHeight = 505
  ClientWidth = 882
  Color = clBtnFace
  ParentFont = True
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
  OnMouseWheel = FormMouseWheel
  PixelsPerInch = 96
  TextHeight = 13
  object frxPreview: TfrxPreview
    Left = 0
    Top = 31
    Width = 882
    Height = 474
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    OutlineVisible = False
    OutlineWidth = 120
    ThumbnailVisible = False
    FindFmVisible = False
    OnPageChanged = frxPreviewPageChanged
    UseReportHints = False
    OutlineTreeSortType = dtsUnsorted
    HideScrolls = False
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 882
    Height = 31
    AutoSize = True
    BorderWidth = 2
    ButtonHeight = 23
    TabOrder = 0
    Wrapable = False
    OnResize = ToolBarResize
    object btnFastview: TToolButton
      Left = 0
      Top = 0
      Caption = 'btnFastview'
      ImageIndex = 22
      OnClick = btnFastviewClick
    end
    object PrintB: TToolButton
      Left = 23
      Top = 0
      Caption = 'Print'
      ImageIndex = 2
      OnClick = PrintBClick
    end
    object OpenB: TToolButton
      Left = 46
      Top = 0
      Caption = 'Open'
      ImageIndex = 0
      OnClick = OpenBClick
    end
    object SaveB: TToolButton
      Left = 69
      Top = 0
      Caption = 'Save'
      ImageIndex = 1
      OnClick = SaveBClick
    end
    object ExportB: TToolButton
      Left = 92
      Top = 0
      Caption = 'Export'
      DropdownMenu = ExportPopup
      ImageIndex = 3
    end
    object PdfB: TToolButton
      Left = 115
      Top = 0
      Caption = 'PdfB'
      ImageIndex = 24
      Visible = False
      OnClick = PdfBClick
    end
    object EmailB: TToolButton
      Left = 138
      Top = 0
      Caption = 'EmailB'
      ImageIndex = 23
      Visible = False
      OnClick = EmailBClick
    end
    object FindB: TToolButton
      Left = 161
      Top = 0
      Caption = 'Find'
      ImageIndex = 4
      OnClick = FindBClick
    end
    object Sep1: TToolButton
      Left = 184
      Top = 0
      Width = 8
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ZoomPlusB: TToolButton
      Left = 192
      Top = 0
      Caption = 'Zoom'
      ImageIndex = 15
      OnClick = ZoomPlusBClick
    end
    object Sep3: TfrxTBPanel
      Left = 215
      Top = 0
      Width = 56
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object ZoomCB: TfrxComboBox
        Left = 4
        Top = 2
        Width = 49
        Height = 19
        ListWidth = 100
        TabOrder = 0
        Text = '100%'
        ItemIndex = -1
        OnClick = ZoomCBClick
      end
    end
    object ZoomMinusB: TToolButton
      Left = 271
      Top = 0
      Caption = 'Whole Page'
      ImageIndex = 16
      OnClick = ZoomMinusBClick
    end
    object Sep2: TToolButton
      Left = 294
      Top = 0
      Width = 8
      ImageIndex = 6
      Style = tbsSeparator
    end
    object OutlineB: TToolButton
      Left = 302
      Top = 0
      AllowAllUp = True
      Grouped = True
      ImageIndex = 12
      Style = tbsCheck
      OnClick = OutlineBClick
    end
    object ThumbB: TToolButton
      Left = 325
      Top = 0
      AllowAllUp = True
      Caption = 'ThumbB'
      Grouped = True
      ImageIndex = 5
      Style = tbsCheck
      OnClick = ThumbBClick
    end
    object PageSettingsB: TToolButton
      Left = 348
      Top = 0
      Caption = 'Margins'
      ImageIndex = 7
      OnClick = PageSettingsBClick
    end
    object DesignerB: TToolButton
      Left = 371
      Top = 0
      Caption = 'Edit'
      ImageIndex = 21
      OnClick = DesignerBClick
    end
    object Sep5: TToolButton
      Left = 394
      Top = 0
      Width = 8
      ImageIndex = 11
      Style = tbsSeparator
    end
    object FirstB: TToolButton
      Left = 402
      Top = 0
      Caption = 'First'
      ImageIndex = 8
      OnClick = FirstBClick
    end
    object PriorB: TToolButton
      Left = 425
      Top = 0
      Caption = 'Prior'
      ImageIndex = 9
      OnClick = PriorBClick
    end
    object Sep4: TfrxTBPanel
      Left = 448
      Top = 0
      Width = 73
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object OfNL: TLabel
        Left = 45
        Top = 4
        Width = 20
        Height = 13
        Caption = 'of N'
      end
      object PageE: TEdit
        Left = 4
        Top = 4
        Width = 37
        Height = 15
        BorderStyle = bsNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        Text = '1'
        OnClick = PageEClick
      end
    end
    object NextB: TToolButton
      Left = 521
      Top = 0
      Caption = 'Next'
      ImageIndex = 10
      OnClick = NextBClick
    end
    object LastB: TToolButton
      Left = 544
      Top = 0
      Caption = 'Last'
      ImageIndex = 11
      OnClick = LastBClick
    end
    object frTBPanel1: TfrxTBPanel
      Left = 567
      Top = 0
      Width = 32
      Height = 23
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
    end
    object CancelB: TSpeedButton
      Left = 599
      Top = 0
      Width = 68
      Height = 23
      Action = actClose
      Spacing = 2
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 155
    Top = 209
    object PDF1: TMenuItem
      Caption = 'PDF'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' PDF'
      ImageIndex = 14
    end
    object XLS1: TMenuItem
      Caption = 'XLS'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' XLS'
      ImageIndex = 12
    end
    object GIF1: TMenuItem
      Caption = 'GIF'
      Hint = #1069#1082#1089#1087#1086#1088#1090' '#1074' GIF'
      ImageIndex = 13
    end
  end
  object frxReport: TfrxReport
    Version = '2021.2.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    Preview = frxPreview
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.OutlineExpand = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41262.390860671290000000
    ReportOptions.LastChange = 41262.390860671290000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnProgressStart = frxReportProgressStart
    OnProgressStop = frxReportProgressStop
    OnUserFunction = frxReportUserFunction
    Left = 255
    Top = 42
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object ExportPopup: TPopupMenu
    Left = 253
    Top = 109
  end
  object HiddenMenu: TPopupMenu
    Left = 238
    Top = 237
    object Showtemplate1: TMenuItem
      Caption = 'Show template'
    end
  end
  object RightMenu: TPopupMenu
    Left = 315
    Top = 233
    object CollapseMI: TMenuItem
      Caption = 'Collapse all'
      ImageIndex = 13
    end
    object ExpandMI: TMenuItem
      Caption = 'Expand all'
      ImageIndex = 14
    end
    object N1: TMenuItem
      Caption = '-'
    end
  end
  object actlst: TActionList
    Left = 488
    Top = 152
    object actClose: TAction
      Caption = 'Close'
      ShortCut = 27
      Visible = False
      OnExecute = actCloseExecute
    end
    object actFind: TAction
      Caption = 'actFind'
      OnExecute = actFindExecute
    end
  end
end
