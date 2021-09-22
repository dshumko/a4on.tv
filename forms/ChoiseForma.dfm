object ChoiseForm: TChoiseForm
  ShowHint = True
  Left = 481
  Top = 457
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1057#1076#1077#1083#1072#1081#1090#1077' '#1074#1099#1073#1086#1088
  ClientHeight = 100
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 63
    Width = 290
    Height = 37
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
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 24
    Top = 24
    Width = 241
    Height = 21
    DynProps = <>
    DataField = ''
    EditButtons = <>
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = srcChoise
    TabOrder = 1
    Visible = True
  end
  object dsChoise: TpFIBDataSet
    SelectSQL.Strings = (
      '')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 16
    Top = 56
  end
  object srcChoise: TDataSource
    DataSet = dsChoise
    Left = 56
    Top = 56
  end
end
