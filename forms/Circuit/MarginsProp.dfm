object MarginDialog: TMarginDialog
  ShowHint = True
  Left = 192
  Top = 114
  BorderStyle = bsDialog
  Caption = #1043#1088#1072#1085#1080#1094#1099' '#1092#1086#1085#1072
  ClientHeight = 182
  ClientWidth = 245
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
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 217
    Height = 129
    Caption = ' '#1059#1082#1072#1078#1080#1090#1077' '#1087#1086#1083#1103' '#1074' %  '
    TabOrder = 2
    object Edit1: TEdit
      Left = 16
      Top = 61
      Width = 41
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object mLeft: TUpDown
      Left = 57
      Top = 61
      Width = 16
      Height = 21
      Associate = Edit1
      Min = -100
      TabOrder = 1
    end
    object Edit2: TEdit
      Left = 80
      Top = 29
      Width = 41
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object mTop: TUpDown
      Left = 121
      Top = 29
      Width = 16
      Height = 21
      Associate = Edit2
      Min = -100
      TabOrder = 3
    end
    object Edit3: TEdit
      Left = 144
      Top = 61
      Width = 41
      Height = 21
      TabOrder = 4
      Text = '0'
    end
    object mRight: TUpDown
      Left = 185
      Top = 61
      Width = 16
      Height = 21
      Associate = Edit3
      Min = -100
      TabOrder = 5
    end
    object Edit4: TEdit
      Left = 80
      Top = 93
      Width = 41
      Height = 21
      TabOrder = 6
      Text = '0'
    end
    object mBottom: TUpDown
      Left = 121
      Top = 93
      Width = 16
      Height = 21
      Associate = Edit4
      Min = -100
      TabOrder = 7
    end
  end
  object btnOK: TButton
    Left = 16
    Top = 147
    Width = 121
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 158
    Top = 147
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
end
