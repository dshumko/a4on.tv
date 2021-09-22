object DesignerProperties: TDesignerProperties
  ShowHint = True
  Left = 638
  Top = 116
  BorderStyle = bsDialog
  Caption = #1057#1074#1086#1081#1089#1090#1074#1072' '#1076#1080#1079#1072#1081#1085#1077#1088#1072
  ClientHeight = 197
  ClientWidth = 367
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
    Left = 15
    Top = 13
    Width = 337
    Height = 139
    Style = bsRaised
  end
  object Grid: TGroupBox
    Left = 23
    Top = 21
    Width = 153
    Height = 121
    Caption = ' '#1057#1077#1090#1082#1072' '
    TabOrder = 3
    object Label1: TLabel
      Left = 16
      Top = 88
      Width = 74
      Height = 13
      Caption = #1056#1072#1079#1084#1077#1088' '#1089#1077#1090#1082#1080':'
    end
    object ShowGrid: TCheckBox
      Left = 16
      Top = 55
      Width = 121
      Height = 17
      Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1089#1077#1090#1082#1091
      TabOrder = 1
    end
    object SnapToGrid: TCheckBox
      Left = 16
      Top = 24
      Width = 121
      Height = 17
      Caption = #1055#1088#1080#1074#1103#1079#1099#1074#1072#1090#1100' '#1082' '#1089#1077#1090#1082#1072
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 94
      Top = 85
      Width = 37
      Height = 21
      TabOrder = 2
      Text = '8'
    end
    object GridSize: TUpDown
      Left = 130
      Top = 85
      Width = 17
      Height = 21
      Associate = Edit1
      Position = 8
      TabOrder = 3
    end
  end
  object Colors: TGroupBox
    Left = 191
    Top = 21
    Width = 153
    Height = 121
    Caption = ' '#1062#1074#1077#1090#1072' '
    TabOrder = 4
    object Label2: TLabel
      Left = 16
      Top = 24
      Width = 26
      Height = 13
      Caption = #1060#1086#1085':'
      FocusControl = DesignerBackgroundColor
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 42
      Height = 13
      Caption = #1052#1072#1088#1082#1077#1088':'
      FocusControl = DesignerMarkerColor
    end
    object Label4: TLabel
      Left = 16
      Top = 88
      Width = 33
      Height = 13
      Caption = #1057#1077#1090#1082#1072':'
      FocusControl = DesignerGridColor
    end
    object DesignerBackgroundColor: TPanel
      Left = 88
      Top = 19
      Width = 49
      Height = 25
      ParentColor = True
      TabOrder = 0
      OnClick = DesignerBackgroundColorClick
      object BackgroundColor: TShape
        Left = 1
        Top = 1
        Width = 47
        Height = 23
        Align = alClient
        Enabled = False
      end
    end
    object DesignerMarkerColor: TPanel
      Left = 88
      Top = 51
      Width = 49
      Height = 25
      ParentColor = True
      TabOrder = 1
      OnClick = DesignerMarkerColorClick
      object MarkerColor: TShape
        Left = 1
        Top = 1
        Width = 47
        Height = 23
        Align = alClient
        Enabled = False
      end
    end
    object DesignerGridColor: TPanel
      Left = 88
      Top = 83
      Width = 49
      Height = 25
      ParentColor = True
      TabOrder = 2
      OnClick = DesignerGridColorClick
      object GridColor: TShape
        Left = 1
        Top = 1
        Width = 47
        Height = 23
        Align = alClient
        Enabled = False
      end
    end
  end
  object btnOK: TButton
    Left = 157
    Top = 159
    Width = 90
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancel: TButton
    Left = 262
    Top = 159
    Width = 90
    Height = 25
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object btnApply: TButton
    Left = 15
    Top = 159
    Width = 90
    Height = 25
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btnApplyClick
  end
  object ColorDialog: TColorDialog
    Left = 232
  end
end
