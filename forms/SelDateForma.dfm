object SelDateForm: TSelDateForm
  Left = 0
  Top = 0
  Caption = #1042#1099#1073#1086#1088' '#1076#1072#1090#1099
  ClientHeight = 99
  ClientWidth = 271
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblText: TLabel
    Left = 12
    Top = 25
    Width = 73
    Height = 13
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1076#1072#1090#1091
  end
  inline frm1: TOkCancelFrame
    Left = 0
    Top = 64
    Width = 271
    Height = 35
    Align = alBottom
    TabOrder = 0
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 12
      Top = 3
      Width = 164
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Default = True
      OnClick = frm1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 183
      Top = 3
      Width = 82
    end
  end
  object edtDate: TDBDateTimeEditEh
    Left = 144
    Top = 22
    Width = 121
    Height = 21
    DynProps = <>
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
end
