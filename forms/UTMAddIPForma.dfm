object UTMAddIPForm: TUTMAddIPForm
  ShowHint = True
  Left = 0
  Top = 0
  ActiveControl = edtInetIP
  BorderStyle = bsDialog
  Caption = #1053#1086#1074#1099#1081' IP '#1072#1076#1088#1077#1089
  ClientHeight = 182
  ClientWidth = 262
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
  object lbl1: TLabel
    Left = 19
    Top = 11
    Width = 43
    Height = 13
    Caption = 'IP '#1072#1076#1088#1077#1089
  end
  object Label3: TLabel
    Left = 19
    Top = 87
    Width = 30
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = #1051#1086#1075#1080#1085
    ParentBiDiMode = False
  end
  object Label5: TLabel
    Left = 19
    Top = 111
    Width = 37
    Height = 13
    BiDiMode = bdLeftToRight
    Caption = #1055#1072#1088#1086#1083#1100
    ParentBiDiMode = False
  end
  object lbl2: TLabel
    Left = 19
    Top = 36
    Width = 31
    Height = 13
    Caption = #1052#1072#1089#1082#1072
  end
  object btnnEXTip: TSpeedButton
    Left = 226
    Top = 8
    Width = 21
    Height = 21
    Hint = #1044#1086#1087#1086#1083#1085#1080#1090#1100' IP '#1072#1076#1088#1077#1089#1089' '#1089#1086#1075#1083#1072#1089#1085#1086' '#1084#1072#1089#1082#1080
    Flat = True
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000120B0000120B00001000000000000000040204000489
      BE0007C9FA0009A6DD0037E8FC000490D00084D6F4000FD8FC00046DA2000EBC
      EC002C86AC005CFAFC00047BB10036D9FA004C96C4000799CF00000000000000
      00000CCCC0000000000001771100000000000F479C0005C100000FDFC8C0539C
      10000F1881C0F472C00008C322C8FB2F10000C37223A5FC88C0000F4722E688F
      9C80005DD7710F72238000334D710F72228000039D3505DD7710000035F00334
      D7100000000000FD47C0000000000051FCC00000000000000000}
  end
  object edtInetIP: TDBEditEh
    Left = 75
    Top = 8
    Width = 132
    Height = 21
    DataField = 'IP'
    DataSource = CustBillingUTMForm.srcIPS
    EditButtons = <>
    TabOrder = 0
    Visible = True
    OnEnter = edtInetIPEnter
    OnExit = edtInetIPExit
  end
  inline okcnclfrm1: TOkCancelFrame
    Left = 0
    Top = 147
    Width = 262
    Height = 35
    Align = alBottom
    TabOrder = 5
    TabStop = True
  end
  object edLogin: TDBEditEh
    Left = 78
    Top = 84
    Width = 129
    Height = 21
    DataField = 'LOGIN'
    DataSource = CustBillingUTMForm.srcIPS
    EditButtons = <>
    Enabled = False
    TabOrder = 3
    Visible = True
    OnEnter = edtInetIPEnter
    OnExit = edtSecretExit
    EditMask = ''
  end
  object edtSecret: TDBEditEh
    Left = 78
    Top = 111
    Width = 129
    Height = 21
    DataField = 'SECRET'
    DataSource = CustBillingUTMForm.srcIPS
    EditButtons = <>
    Enabled = False
    TabOrder = 4
    Visible = True
    OnEnter = edtInetIPEnter
    OnExit = edtSecretExit
    EditMask = ''
  end
  object edt1: TDBEditEh
    Left = 75
    Top = 31
    Width = 132
    Height = 21
    DataField = 'MASK'
    DataSource = CustBillingUTMForm.srcIPS
    EditButtons = <>
    TabOrder = 1
    Visible = True
    OnEnter = edtInetIPEnter
    OnExit = edtInetIPExit
  end
  object chkNotVPN: TDBCheckBoxEh
    Left = 19
    Top = 58
    Width = 188
    Height = 17
    Alignment = taLeftJustify
    Caption = #1053#1077' VPN'
    DataField = 'NotVPN'
    DataSource = CustBillingUTMForm.srcIPS
    TabOrder = 2
    ValueChecked = 'True'
    ValueUnchecked = 'False'
    OnClick = chkNotVPNClick
  end
end
