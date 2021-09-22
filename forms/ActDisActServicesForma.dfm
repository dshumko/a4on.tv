object OnOffServiceForm: TOnOffServiceForm
  ShowHint = True
  Left = 362
  Top = 176
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = #1042#1082#1083#1102#1095#1077#1085#1080#1077' / '#1074#1099#1082#1083#1102#1095#1077#1085#1080#1077' '#1091#1089#1083#1091#1075
  ClientHeight = 112
  ClientWidth = 320
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 12
    Width = 73
    Height = 13
    Caption = #1058#1080#1087' '#1074#1082#1083' / '#1086#1090#1082#1083
  end
  object Label2: TLabel
    Left = 8
    Top = 44
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 75
    Width = 320
    Height = 37
    Align = alBottom
    TabOrder = 0
    TabStop = True
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 104
    Top = 8
    Width = 209
    Height = 21
    EditButtons = <>
    TabOrder = 1
    Visible = True
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 104
    Top = 40
    Width = 105
    Height = 21
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 2
    Visible = True
  end
end
