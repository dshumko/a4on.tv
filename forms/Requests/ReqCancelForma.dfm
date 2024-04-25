object ReqCancelForm: TReqCancelForm
  Left = 0
  Top = 0
  Caption = #1054#1090#1084#1077#1085#1072' '#1079#1072#1103#1074#1082#1080
  ClientHeight = 180
  ClientWidth = 323
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  ShowHint = True
  object lbl: TLabel
    Left = 20
    Top = 22
    Width = 67
    Height = 13
    Caption = #1044#1072#1090#1072' '#1086#1090#1084#1077#1085#1099
  end
  object lbl1: TLabel
    Left = 20
    Top = 53
    Width = 43
    Height = 13
    Caption = #1055#1088#1080#1095#1080#1085#1072
  end
  inline frmBtns: TOkCancelFrame
    Left = 0
    Top = 145
    Width = 323
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
  end
  object edtDate: TDBDateTimeEditEh
    Left = 98
    Top = 19
    Width = 121
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 1
    Visible = True
  end
  object mmoResult: TDBMemoEh
    Left = 20
    Top = 73
    Width = 284
    Height = 62
    Lines.Strings = (
      'mmoResult')
    TabOrder = 2
  end
end
