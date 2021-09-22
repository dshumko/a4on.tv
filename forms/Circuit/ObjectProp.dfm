object ObjectProperties: TObjectProperties
  ShowHint = True
  Left = 625
  Top = 116
  BorderStyle = bsDialog
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072
  ClientHeight = 317
  ClientWidth = 368
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 13
    Top = 15
    Width = 340
    Height = 258
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 30
    Height = 13
    Caption = #1058#1077#1082#1089#1090
  end
  object Label4: TLabel
    Left = 192
    Top = 203
    Width = 32
    Height = 13
    Caption = #1054#1087#1094#1080#1080
    FocusControl = PublicOptions
  end
  object Colors: TGroupBox
    Left = 24
    Top = 163
    Width = 153
    Height = 97
    Caption = ' '#1062#1074#1077#1090' '
    TabOrder = 4
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 61
      Height = 13
      Caption = #1047#1072#1087#1086#1083#1085#1077#1085#1080#1103
      FocusControl = ObjectFillColor
    end
    object Label3: TLabel
      Left = 16
      Top = 64
      Width = 32
      Height = 13
      Caption = #1051#1080#1085#1080#1080
      FocusControl = ObjectLineColor
    end
    object ObjectFillColor: TPanel
      Left = 88
      Top = 19
      Width = 49
      Height = 25
      ParentColor = True
      TabOrder = 0
      OnClick = ObjectFillColorClick
      object FillColor: TShape
        Left = 1
        Top = 1
        Width = 47
        Height = 23
        Align = alClient
        Enabled = False
      end
    end
    object ObjectLineColor: TPanel
      Left = 88
      Top = 59
      Width = 49
      Height = 25
      ParentColor = True
      TabOrder = 1
      OnClick = ObjectLineColorClick
      object LineColor: TShape
        Left = 1
        Top = 1
        Width = 47
        Height = 23
        Align = alClient
        Enabled = False
      end
    end
  end
  object btnChangeFont: TButton
    Left = 203
    Top = 168
    Width = 129
    Height = 25
    Caption = #1064#1088#1080#1092#1090'...'
    TabOrder = 5
    OnClick = btnChangeFontClick
  end
  object btnOK: TButton
    Left = 195
    Top = 282
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 278
    Top = 282
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object ObjectText: TMemo
    Left = 24
    Top = 36
    Width = 319
    Height = 109
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object btnApply: TButton
    Left = 13
    Top = 282
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btnApplyClick
  end
  object PublicOptions: TCheckListBox
    Left = 192
    Top = 217
    Width = 151
    Height = 43
    ItemHeight = 13
    Items.Strings = (
      #1057#1074#1103#1079#1099#1074#1072#1077#1084#1099#1081
      #1042#1099#1076#1077#1083#1103#1077#1084#1099#1081
      #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1090#1077#1082#1089#1090)
    TabOrder = 6
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 166
    Top = 59
  end
  object ColorDialog: TColorDialog
    Left = 238
    Top = 59
  end
end
