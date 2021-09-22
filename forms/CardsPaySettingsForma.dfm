object CardsPaySettingsForm: TCardsPaySettingsForm
  Left = 660
  Top = 308
  BorderStyle = bsDialog
  Caption = #1059#1089#1090#1072#1085#1086#1074#1082#1080
  ClientHeight = 222
  ClientWidth = 268
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
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 185
    Width = 268
    Height = 37
    Align = alBottom
    TabOrder = 1
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 106
      Top = 6
      Height = 25
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 187
      Top = 6
      Height = 25
    end
  end
  object GlobalGB: TGroupBox
    Left = 0
    Top = 0
    Width = 268
    Height = 185
    Align = alClient
    Caption = '.: '#1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1050#1072#1088#1090' '#1086#1087#1083#1072#1090' :.'
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 45
      Width = 130
      Height = 13
      Hint = #1062#1080#1092#1088' '#1074' '#1087#1080#1085'-'#1082#1086#1076#1077'. 0-'#1085#1077' '#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1087#1080#1085'-'#1082#1086#1076
      Caption = #1050#1086#1083'-'#1074#1086' '#1094#1080#1092#1088' '#1074' '#1087#1080#1085'-'#1082#1086#1076#1077'. '
      ParentShowHint = False
      ShowHint = True
    end
    object Label2: TLabel
      Left = 8
      Top = 21
      Width = 163
      Height = 13
      Hint = #1050#1086#1083'-'#1074#1086' '#1094#1080#1092#1088' '#1074' '#1085#1086#1084#1077#1088#1077' '#1082#1072#1088#1090#1086#1095#1082#1080
      Caption = #1050#1086#1083'-'#1074#1086' '#1094#1080#1092#1088' '#1074' '#1085#1086#1084#1077#1088#1077' '#1082#1072#1088#1090#1086#1095#1082#1080
      ParentShowHint = False
      ShowHint = True
    end
    object PIN_LEN: TDBNumberEditEh
      Left = 176
      Top = 42
      Width = 41
      Height = 21
      Hint = #1050#1086#1083'-'#1074#1086' '#1094#1080#1092#1088' '#1074' '#1087#1080#1085'-'#1082#1086#1076#1077'. 0-'#1085#1077' '#1075#1077#1085#1077#1088#1080#1088#1086#1074#1072#1090#1100' '#1087#1080#1085'-'#1082#1086#1076
      DecimalPlaces = 0
      DynProps = <>
      EditButton.Visible = True
      EditButtons = <>
      MaxValue = 20.000000000000000000
      ShowHint = True
      TabOrder = 1
      Value = 4.000000000000000000
      Visible = True
    end
    object NUM_LEN: TDBNumberEditEh
      Left = 176
      Top = 18
      Width = 41
      Height = 21
      Hint = #1050#1086#1083'-'#1074#1086' '#1094#1080#1092#1088' '#1074' '#1085#1086#1084#1077#1088#1077' '#1082#1072#1088#1090#1086#1095#1082#1080
      DynProps = <>
      EditButton.Visible = True
      EditButtons = <>
      MaxValue = 20.000000000000000000
      ShowHint = True
      TabOrder = 0
      Value = 10.000000000000000000
      Visible = True
    end
  end
  object Query: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    Left = 72
    Top = 120
  end
  object select: TpFIBDataSet
    SelectSQL.Strings = (
      'select VAR_NAME, VAR_VALUE'
      'from SETTINGS')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 24
    Top = 128
  end
end
