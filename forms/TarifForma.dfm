object TarifForm: TTarifForm
  Left = 476
  Top = 214
  BorderStyle = bsDialog
  Caption = #1058#1072#1088#1080#1092' '#1076#1083#1103' '#1091#1089#1083#1091#1075#1080
  ClientHeight = 153
  ClientWidth = 261
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
    261
    153)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 19
    Width = 41
    Height = 13
    Caption = #1057' '#1076#1072#1090#1099':'
  end
  object Label2: TLabel
    Left = 16
    Top = 56
    Width = 32
    Height = 13
    Caption = #1058#1072#1088#1080#1092
  end
  object lbl1: TLabel
    Left = 16
    Top = 92
    Width = 97
    Height = 13
    Caption = #1058#1072#1088#1080#1092' '#1076#1083#1103' '#1102#1088'. '#1083#1080#1094
  end
  object deTarif: TDBNumberEditEh
    Left = 124
    Top = 53
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
    Left = 124
    Top = 16
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
    Left = 124
    Top = 89
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
    Left = 170
    Top = 122
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
  end
  object btnOk: TBitBtn
    Left = 16
    Top = 122
    Width = 148
    Height = 23
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 3
    OnClick = btnOkClick
  end
  object Query: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      
        'execute procedure tarif_iud (:tarif_id, :service_id, :date_from,' +
        ' :date_to, :tarif_sum, :tarif_sum_jur, :action)')
    Left = 69
    Top = 70
  end
  object qryChannel: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      
        'execute procedure TARIF_CHANNEL_IUD(:CHT_ID, :CHANNEL_ID, :DATE_' +
        'FROM, :TARIF_SUM, :ACTION)')
    Left = 62
    Top = 14
  end
end
