object GF: TGF
  Left = 398
  Top = 266
  BorderStyle = bsDialog
  Caption = #1043#1088#1091#1087#1087#1072' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
  ClientHeight = 234
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 36
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1072
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 8
    Top = 72
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object DBEdit1: TDBEditEh
    Left = 54
    Top = 13
    Width = 264
    Height = 21
    DataField = 'GROUP_NAME'
    DataSource = UsersForm.srcGroups
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object DBCheckBox1: TDBCheckBox
    Left = 8
    Top = 48
    Width = 105
    Height = 17
    Alignment = taLeftJustify
    Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1085#1072' '
    DataField = 'LOCKEDOUT'
    DataSource = UsersForm.srcGroups
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 88
    Width = 353
    Height = 97
    DataField = 'NOTICE'
    DataSource = UsersForm.srcGroups
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object Button1: TButton
    Left = 184
    Top = 200
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object Button2: TButton
    Left = 280
    Top = 200
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1080#1090#1100
    ModalResult = 2
    TabOrder = 4
  end
end
