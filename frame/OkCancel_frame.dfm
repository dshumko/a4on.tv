object OkCancelFrame: TOkCancelFrame
  Left = 0
  Top = 0
  Width = 382
  Height = 35
  TabOrder = 0
  TabStop = True
  DesignSize = (
    382
    35)
  object Label2: TLabel
    Left = 8
    Top = 16
    Width = 3
    Height = 13
  end
  object Label1: TLabel
    Left = 8
    Top = 1
    Width = 3
    Height = 13
  end
  object bbOk: TBitBtn
    Left = 220
    Top = 4
    Width = 75
    Height = 23
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 0
    OnClick = actExitExecute
  end
  object bbCancel: TBitBtn
    Left = 301
    Top = 4
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
end
