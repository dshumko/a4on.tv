object TarifForm: TTarifForm
  Left = 476
  Top = 214
  BorderStyle = bsDialog
  Caption = #1058#1072#1088#1080#1092' '#1076#1083#1103' '#1091#1089#1083#1091#1075#1080
  ClientHeight = 190
  ClientWidth = 256
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
  DesignSize = (
    256
    190)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 7
    Top = 16
    Width = 69
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072':'
  end
  object Label2: TLabel
    Left = 7
    Top = 44
    Width = 70
    Height = 13
    Caption = #1058#1072#1088#1080#1092' '#1089' '#1076#1072#1090#1099
  end
  object lbl1: TLabel
    Left = 7
    Top = 72
    Width = 97
    Height = 13
    Caption = #1058#1072#1088#1080#1092' '#1076#1083#1103' '#1102#1088'. '#1083#1080#1094
  end
  object lblVAT: TLabel
    Left = 94
    Top = 129
    Width = 22
    Height = 13
    Caption = #1053#1044#1057
  end
  object lblPARTNER: TLabel
    Left = 7
    Top = 101
    Width = 111
    Height = 13
    Caption = #1058#1072#1088#1080#1092' '#1076#1083#1103' '#1087#1072#1088#1090#1085#1077#1088#1086#1074
  end
  object deTarif: TDBNumberEditEh
    Left = 122
    Top = 41
    Width = 121
    Height = 21
    DynProps = <>
    EditButton.Visible = True
    EditButtons = <>
    ShowHint = True
    TabOrder = 1
    Value = 0.000000000000000000
    Visible = True
    OnChange = deTarifChange
  end
  object deDate_from: TDBDateTimeEditEh
    Left = 122
    Top = 13
    Width = 121
    Height = 21
    DynProps = <>
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object deTarifJur: TDBNumberEditEh
    Left = 122
    Top = 69
    Width = 121
    Height = 21
    DynProps = <>
    EditButton.Visible = True
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Value = 0.000000000000000000
    Visible = True
    OnChange = deTarifChange
  end
  object btnCancel: TBitBtn
    Left = 165
    Top = 159
    Width = 79
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 6
  end
  object btnOk: TBitBtn
    Left = 7
    Top = 159
    Width = 152
    Height = 23
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 5
    OnClick = btnOkClick
  end
  object ednVAT: TDBNumberEditEh
    Left = 122
    Top = 125
    Width = 121
    Height = 21
    DynProps = <>
    EditButton.Visible = True
    EditButtons = <>
    ShowHint = True
    TabOrder = 4
    Value = 0.000000000000000000
    Visible = True
    OnChange = deTarifChange
  end
  object ednPARTNER: TDBNumberEditEh
    Left = 122
    Top = 98
    Width = 121
    Height = 21
    DynProps = <>
    EditButton.Visible = True
    EditButtons = <>
    ShowHint = True
    TabOrder = 3
    Value = 0.000000000000000000
    Visible = True
    OnChange = deTarifChange
  end
  object Query: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      
        'execute procedure tarif_iud (:tarif_id, :service_id, :date_from,' +
        ' :date_to, :tarif_sum, :tarif_sum_jur, :action, :VAT, :PARTNER_T' +
        'ARIF)')
    Left = 29
    Top = 91
  end
  object qryChannel: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      
        'execute procedure TARIF_CHANNEL_IUD(:CHT_ID, :CHANNEL_ID, :DATE_' +
        'FROM, :TARIF_SUM, :ACTION)')
    Left = 30
    Top = 30
  end
end
