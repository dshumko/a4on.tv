object CustomerInfoFrm: TCustomerInfoFrm
  Left = 0
  Top = 0
  Width = 247
  Height = 149
  ParentShowHint = False
  ShowHint = True
  TabOrder = 0
  OnResize = FrameResize
  object gbInfo: TGroupBox
    Left = 0
    Top = 0
    Width = 247
    Height = 149
    Align = alClient
    Caption = ' .:: '#1040#1073#1086#1085#1077#1085#1090' ::. '
    TabOrder = 0
    object HtmlViewer: THtmlViewer
      Left = 2
      Top = 15
      Width = 243
      Height = 132
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      ParentCustomHint = False
      BorderStyle = htNone
      DefFontName = 'Tahoma'
      DefFontSize = 8
      DefHotSpotColor = clBtnText
      DefOverLinkColor = clBtnText
      HistoryMaxCount = 0
      HtOptions = [htOverLinksActive]
      NoSelect = False
      PrintMarginBottom = 2.000000000000000000
      PrintMarginLeft = 2.000000000000000000
      PrintMarginRight = 2.000000000000000000
      PrintMarginTop = 2.000000000000000000
      PrintScale = 1.000000000000000000
      ViewImages = False
      OnHotSpotClick = HtmlViewerHotSpotClick
      OnSectionClick = HtmlViewerSectionClick
      Align = alClient
      PopupMenu = pmHV
      TabOrder = 0
      OnKeyUp = HtmlViewerKeyUp
      Touch.InteractiveGestures = [igPan]
      Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia]
    end
  end
  object pmHV: TPopupMenu
    MenuAnimation = [maTopToBottom]
    Left = 154
    Top = 82
    object miCopy: TMenuItem
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = miCopyClick
    end
  end
end
