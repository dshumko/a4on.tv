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
