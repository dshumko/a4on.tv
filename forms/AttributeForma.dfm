object AttributeForm: TAttributeForm
  ShowHint = True
  Left = 587
  Top = 275
  Caption = #1040#1090#1088#1080#1073#1091#1090
  ClientHeight = 309
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 274
    Width = 384
    Height = 35
    Align = alBottom
    TabOrder = 0
    TabStop = True
    inherited bbOk: TBitBtn
      Left = 222
      Top = 6
    end
    inherited bbCancel: TBitBtn
      Left = 303
      Top = 6
    end
  end
end
