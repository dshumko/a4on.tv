object CustomerInfoFrm: TCustomerInfoFrm
  Left = 0
  Top = 0
  Width = 260
  Height = 171
  ParentShowHint = False
  ShowHint = True
  TabOrder = 0
  object gbInfo: TGroupBox
    Left = 0
    Top = 0
    Width = 260
    Height = 171
    Align = alClient
    Caption = ' .:: '#1040#1073#1086#1085#1077#1085#1090' ::. '
    TabOrder = 0
    object lblFIO: TLabel
      Left = 2
      Top = 15
      Width = 256
      Height = 13
      Hint = #1060#1048#1054' '#1072#1073#1086#1085#1077#1085#1090#1072
      Align = alTop
      Caption = #1060#1048#1054
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblDebt: TLabel
      Left = 2
      Top = 28
      Width = 256
      Height = 13
      Hint = #1044#1086#1083#1075' '#1072#1073#1086#1085#1077#1085#1090#1072
      Align = alTop
      Caption = #1044#1054#1051#1043
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object memAbonent: TMemo
      Left = 2
      Top = 41
      Width = 256
      Height = 128
      TabStop = False
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = clBtnFace
      Ctl3D = True
      Lines.Strings = (
        #1048#1053#1060#1054)
      ParentCtl3D = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
end
