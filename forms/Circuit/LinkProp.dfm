object LinkProperties: TLinkProperties
  Left = 632
  Top = 116
  BorderStyle = bsDialog
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1089#1074#1103#1079#1080
  ClientHeight = 497
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 13
    Top = 10
    Width = 340
    Height = 439
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 24
    Top = 21
    Width = 33
    Height = 13
    Caption = #1058#1077#1082#1089#1090':'
    FocusControl = LinkLabel
  end
  object Label4: TLabel
    Left = 24
    Top = 367
    Width = 38
    Height = 13
    Caption = #1054#1087#1094#1080#1080#1103
    FocusControl = AllOptions
  end
  object LinkLabel: TEdit
    Left = 24
    Top = 37
    Width = 316
    Height = 21
    TabOrder = 3
  end
  object Style: TGroupBox
    Left = 24
    Top = 180
    Width = 153
    Height = 88
    Caption = ' '#1057#1090#1080#1083#1100' '#1083#1080#1085#1080#1080' '
    TabOrder = 7
    object Shape1: TShape
      Left = 70
      Top = 32
      Width = 67
      Height = 1
      Brush.Style = bsClear
    end
    object Shape2: TShape
      Left = 68
      Top = 51
      Width = 69
      Height = 1
      Brush.Style = bsClear
      Pen.Style = psDash
    end
    object Shape3: TShape
      Left = 69
      Top = 70
      Width = 68
      Height = 1
      Brush.Style = bsClear
      Pen.Style = psDot
    end
    object StyleSolid: TRadioButton
      Left = 16
      Top = 24
      Width = 49
      Height = 17
      Caption = #1057#1087#1083#1086#1096#1085#1072#1103
      TabOrder = 0
    end
    object StyleDash: TRadioButton
      Left = 16
      Top = 43
      Width = 49
      Height = 17
      Caption = #1064#1090#1088#1080#1093
      TabOrder = 1
    end
    object StyleDot: TRadioButton
      Left = 16
      Top = 62
      Width = 65
      Height = 17
      Caption = #1055#1091#1085#1082#1090#1080#1088
      TabOrder = 2
    end
  end
  object Colors: TGroupBox
    Left = 188
    Top = 180
    Width = 153
    Height = 88
    Caption = ' '#1062#1074#1077#1090#1072' '
    TabOrder = 8
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 35
      Height = 13
      Caption = #1051#1080#1085#1080#1080':'
      FocusControl = LinkLineColor
    end
    object Label3: TLabel
      Left = 16
      Top = 55
      Width = 60
      Height = 13
      Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1081':'
      FocusControl = LinkStyleColor
    end
    object LinkLineColor: TPanel
      Left = 88
      Top = 19
      Width = 49
      Height = 25
      ParentColor = True
      TabOrder = 0
      OnClick = LinkLineColorClick
      object LineColor: TShape
        Left = 1
        Top = 1
        Width = 47
        Height = 23
        Align = alClient
        Enabled = False
      end
    end
    object LinkStyleColor: TPanel
      Left = 88
      Top = 50
      Width = 49
      Height = 25
      ParentColor = True
      TabOrder = 1
      OnClick = LinkStyleColorClick
      object StyleColor: TShape
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
    Left = 36
    Top = 79
    Width = 129
    Height = 25
    Caption = #1064#1088#1080#1092#1090'...'
    TabOrder = 5
    OnClick = btnChangeFontClick
  end
  object btnOK: TButton
    Left = 188
    Top = 461
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 282
    Top = 461
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object btnApply: TButton
    Left = 13
    Top = 461
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btnApplyClick
  end
  object AllOptions: TCheckListBox
    Left = 24
    Top = 382
    Width = 317
    Height = 57
    Columns = 2
    ItemHeight = 13
    Items.Strings = (
      #1057#1074#1103#1079#1099#1074#1072#1077#1084#1099#1081
      #1052#1086#1078#1085#1086' '#1074#1099#1076#1077#1083#1103#1090#1100
      #1047#1072#1075#1086#1083#1086#1074#1086#1082
      #1060#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100' - '#1053#1072#1095#1072#1083#1086
      #1060#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100' - '#1050#1086#1085#1077#1094
      #1060#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100' - '#1059#1079#1083#1099
      #1055#1088#1080#1074#1103#1079#1072#1090#1100' - '#1053#1072#1095#1072#1083#1086
      #1055#1088#1080#1074#1103#1079#1072#1090#1100' - '#1050#1086#1085#1077#1094)
    TabOrder = 11
  end
  object LabelPlacement: TGroupBox
    Left = 188
    Top = 70
    Width = 153
    Height = 102
    Caption = ' '#1056#1072#1079#1084#1077#1097#1077#1085#1080#1077' '#1079#1072#1075#1086#1083#1086#1074#1082#1072' '
    TabOrder = 4
    object Label9: TLabel
      Left = 13
      Top = 32
      Width = 46
      Height = 13
      Caption = #1055#1086#1079#1080#1094#1080#1103':'
      FocusControl = Edit4
    end
    object Label10: TLabel
      Left = 13
      Top = 64
      Width = 53
      Height = 13
      Caption = #1048#1085#1090#1077#1088#1074#1072#1083':'
      FocusControl = Edit5
    end
    object Edit4: TEdit
      Left = 64
      Top = 29
      Width = 60
      Height = 21
      TabOrder = 0
      Text = '-1'
    end
    object LabelPosition: TUpDown
      Left = 124
      Top = 29
      Width = 16
      Height = 21
      Associate = Edit4
      Min = -1
      Position = -1
      TabOrder = 1
    end
    object Edit5: TEdit
      Left = 64
      Top = 61
      Width = 60
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object LabelSpacing: TUpDown
      Left = 124
      Top = 61
      Width = 16
      Height = 21
      Associate = Edit5
      Min = -100
      TabOrder = 3
    end
  end
  object Size: TGroupBox
    Left = 24
    Top = 122
    Width = 153
    Height = 50
    Caption = ' '#1056#1072#1079#1084#1077#1088' '#1083#1080#1085#1080#1080' '
    TabOrder = 6
    object Edit1: TEdit
      Left = 12
      Top = 18
      Width = 112
      Height = 21
      TabOrder = 0
      Text = '1'
    end
    object PenWidth: TUpDown
      Left = 124
      Top = 18
      Width = 16
      Height = 21
      Associate = Edit1
      Min = 1
      Max = 10
      Position = 1
      TabOrder = 1
    end
  end
  object LineBegin: TGroupBox
    Left = 24
    Top = 276
    Width = 153
    Height = 86
    Caption = ' '#1053#1072#1095#1072#1083#1086' '
    TabOrder = 9
    object Label5: TLabel
      Left = 16
      Top = 24
      Width = 35
      Height = 13
      Caption = #1057#1090#1080#1083#1100':'
      FocusControl = LineBeginStyle
    end
    object Label6: TLabel
      Left = 16
      Top = 54
      Width = 39
      Height = 13
      Caption = #1056#1072#1079#1084#1077#1088':'
    end
    object LineBeginStyle: TComboBox
      Left = 64
      Top = 21
      Width = 74
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        #1053#1077#1090
        #1057#1090#1088#1077#1083#1082#1072
        #1055#1088#1086#1089#1090#1072#1103' '#1089#1090#1088#1077#1083#1082#1072
        #1050#1088#1091#1078#1086#1082
        #1056#1086#1084#1073)
    end
    object Edit2: TEdit
      Left = 64
      Top = 51
      Width = 57
      Height = 21
      TabOrder = 1
      Text = '1'
    end
    object LineBeginSize: TUpDown
      Left = 121
      Top = 51
      Width = 16
      Height = 21
      Associate = Edit2
      Min = 1
      Max = 10
      Position = 1
      TabOrder = 2
    end
  end
  object LineEnd: TGroupBox
    Left = 188
    Top = 276
    Width = 153
    Height = 86
    Caption = ' '#1050#1086#1085#1077#1094' '
    TabOrder = 10
    object Label7: TLabel
      Left = 16
      Top = 24
      Width = 35
      Height = 13
      Caption = #1057#1090#1080#1083#1100':'
      FocusControl = LineEndStyle
    end
    object Label8: TLabel
      Left = 16
      Top = 54
      Width = 39
      Height = 13
      Caption = #1056#1072#1079#1084#1077#1088':'
    end
    object LineEndStyle: TComboBox
      Left = 64
      Top = 21
      Width = 74
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        #1053#1077#1090
        #1057#1090#1088#1077#1083#1082#1072
        #1055#1088#1086#1089#1090#1072#1103' '#1089#1090#1088#1077#1083#1082#1072
        #1050#1088#1091#1078#1086#1082
        #1056#1086#1084#1073)
    end
    object Edit3: TEdit
      Left = 64
      Top = 51
      Width = 57
      Height = 21
      TabOrder = 1
      Text = '1'
    end
    object LineEndSize: TUpDown
      Left = 121
      Top = 51
      Width = 16
      Height = 21
      Associate = Edit3
      Min = 1
      Max = 10
      Position = 1
      TabOrder = 2
    end
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 304
    Top = 354
  end
  object ColorDialog: TColorDialog
    Left = 264
    Top = 370
  end
end
