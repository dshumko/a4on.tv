object NodeProperties: TNodeProperties
  ShowHint = True
  Left = 627
  Top = 57
  BorderStyle = bsDialog
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1092#1080#1075#1091#1088#1099
  ClientHeight = 534
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
    Left = 14
    Top = 13
    Width = 340
    Height = 476
    Style = bsRaised
  end
  object Label1: TLabel
    Left = 25
    Top = 19
    Width = 33
    Height = 13
    Caption = #1058#1077#1082#1089#1090':'
  end
  object Label4: TLabel
    Left = 25
    Top = 91
    Width = 32
    Height = 13
    Caption = #1054#1087#1094#1080#1080
    FocusControl = AllOptions
  end
  object NodeShape: TRadioGroup
    Left = 191
    Top = 156
    Width = 153
    Height = 190
    Caption = ' '#1060#1086#1088#1084#1072' '
    TabOrder = 6
  end
  object Colors: TGroupBox
    Left = 23
    Top = 384
    Width = 153
    Height = 91
    Caption = ' '#1062#1074#1077#1090'  '
    TabOrder = 8
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 44
      Height = 13
      Caption = #1060#1080#1075#1091#1088#1099':'
      FocusControl = NodeBodyColor
    end
    object Label3: TLabel
      Left = 16
      Top = 58
      Width = 47
      Height = 13
      Caption = #1043#1088#1072#1085#1080#1094#1099':'
      FocusControl = NodeBorderColor
    end
    object NodeBodyColor: TPanel
      Left = 88
      Top = 19
      Width = 49
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = True
      ParentFont = False
      TabOrder = 0
      OnClick = NodeBodyColorClick
      object BodyColor: TShape
        Left = 1
        Top = 1
        Width = 47
        Height = 23
        Align = alClient
        Enabled = False
      end
    end
    object NodeBorderColor: TPanel
      Left = 88
      Top = 53
      Width = 49
      Height = 25
      ParentColor = True
      TabOrder = 1
      OnClick = NodeBorderColorClick
      object BorderColor: TShape
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
    Top = 448
    Width = 129
    Height = 25
    Caption = #1064#1088#1080#1092#1090'...'
    TabOrder = 10
    OnClick = btnChangeFontClick
  end
  object btnOK: TButton
    Left = 202
    Top = 501
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 285
    Top = 501
    Width = 75
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object NodeText: TMemo
    Left = 25
    Top = 33
    Width = 318
    Height = 53
    ScrollBars = ssBoth
    TabOrder = 3
  end
  object btnApply: TButton
    Left = 14
    Top = 501
    Width = 75
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btnApplyClick
  end
  object GroupBox1: TGroupBox
    Left = 25
    Top = 156
    Width = 151
    Height = 123
    Caption = ' '#1055#1086#1079#1080#1094#1080#1103' '#1090#1077#1082#1089#1090#1072' '
    TabOrder = 5
    object Label5: TLabel
      Left = 16
      Top = 27
      Width = 39
      Height = 13
      Caption = #1043#1086#1088#1080#1079'..:'
    end
    object Label6: TLabel
      Left = 16
      Top = 59
      Width = 30
      Height = 13
      Caption = #1042#1077#1088#1090'.:'
    end
    object Label7: TLabel
      Left = 16
      Top = 92
      Width = 38
      Height = 13
      Caption = #1054#1090#1089#1090#1091#1087':'
    end
    object cbAlignment: TComboBox
      Left = 64
      Top = 24
      Width = 74
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        #1057#1083#1077#1074#1072
        #1055#1086' '#1094#1077#1085#1090#1088#1091
        #1057#1087#1088#1072#1074#1072)
    end
    object cbLayout: TComboBox
      Left = 64
      Top = 56
      Width = 74
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      Items.Strings = (
        #1057#1074#1077#1088#1093#1091
        #1055#1086' '#1094#1077#1085#1090#1088#1091
        #1057#1085#1080#1079#1091)
    end
    object edtMargin: TEdit
      Left = 64
      Top = 88
      Width = 57
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object UpDownMargin: TUpDown
      Left = 121
      Top = 88
      Width = 16
      Height = 21
      Associate = edtMargin
      TabOrder = 3
    end
  end
  object AllOptions: TCheckListBox
    Left = 25
    Top = 105
    Width = 318
    Height = 43
    Columns = 2
    ItemHeight = 13
    Items.Strings = (
      #1057#1074#1103#1079#1099#1074#1072#1077#1084#1099#1081
      #1042#1099#1076#1077#1083#1103#1077#1084#1099#1081
      #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1090#1077#1082#1089#1090
      #1055#1077#1088#1077#1084#1077#1097#1072#1077#1084#1099#1081
      #1048#1079#1084#1077#1085#1103#1077#1084#1099#1081
      #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1092#1086#1085)
    TabOrder = 4
  end
  object Styles: TGroupBox
    Left = 24
    Top = 286
    Width = 153
    Height = 89
    Caption = ' '#1057#1090#1080#1083#1100' '
    TabOrder = 7
    object Label8: TLabel
      Left = 16
      Top = 24
      Width = 43
      Height = 13
      Caption = #1047#1072#1087#1086#1083#1085'.:'
      FocusControl = FillStyle
    end
    object Label9: TLabel
      Left = 16
      Top = 56
      Width = 47
      Height = 13
      Caption = #1043#1088#1072#1085#1080#1094#1099':'
      FocusControl = BorderStyle
    end
    object FillStyle: TComboBox
      Left = 64
      Top = 20
      Width = 73
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        #1057#1087#1083#1086#1096#1085#1099#1084
        #1041#1077#1079' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103
        #1043#1086#1088#1080#1079#1086#1085#1090#1072#1083#1100#1085#1086
        #1042#1077#1088#1090#1080#1082#1072#1083#1100#1085#1086
        #1064#1090#1088#1080#1093' '#1074#1083#1077#1074#1086
        #1064#1090#1088#1080#1093' '#1074#1087#1088#1072#1074#1086
        #1057#1077#1090#1082#1072
        #1044#1080#1072#1075#1086#1085#1072#1083#1100#1085#1072#1103' '#1089#1077#1090#1082#1072)
    end
    object BorderStyle: TComboBox
      Left = 64
      Top = 54
      Width = 73
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      Items.Strings = (
        #1057#1087#1083#1086#1096#1085#1099#1077
        #1064#1090#1088#1080#1093
        #1055#1091#1085#1082#1090#1080#1088
        #1058#1080#1088#1077' '#1090#1086#1095#1082#1072
        #1058#1080#1088#1077' '#1090#1086#1095#1082#1072' '#1090#1086#1095#1082#1072
        #1041#1077#1079' '#1075#1072#1088#1085#1080#1094
        #1042#1085#1091#1090#1088#1077#1085#1085#1080#1077' ')
    end
  end
  object GroupBox3: TGroupBox
    Left = 192
    Top = 352
    Width = 153
    Height = 89
    Caption = ' '#1060#1086#1085' '
    TabOrder = 9
    object btnChangBkgnd: TButton
      Left = 16
      Top = 24
      Width = 57
      Height = 25
      Caption = #1060#1072#1081#1083'...'
      TabOrder = 0
      OnClick = btnChangBkgndClick
    end
    object btnClearBackground: TButton
      Left = 80
      Top = 24
      Width = 57
      Height = 25
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      TabOrder = 1
      OnClick = btnClearBackgroundClick
    end
    object btnBackgroundMargins: TButton
      Left = 36
      Top = 54
      Width = 81
      Height = 25
      Caption = #1043#1088#1072#1085#1080#1094#1099'...'
      TabOrder = 2
      OnClick = btnBackgroundMarginsClick
    end
  end
  object FontDialog: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 308
    Top = 396
  end
  object ColorDialog: TColorDialog
    Left = 308
    Top = 340
  end
  object OpenPictureDialog: TOpenPictureDialog
    Title = 'Select Background'
    Left = 306
    Top = 284
  end
end
