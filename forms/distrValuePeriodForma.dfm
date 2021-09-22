object distrValuePeriodForm: TdistrValuePeriodForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1076#1083#1103' '#1087#1077#1088#1080#1086#1076#1072
  ClientHeight = 328
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlEdit: TPanel
    Left = 0
    Top = 89
    Width = 377
    Height = 112
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      377
      112)
    object lbl2: TLabel
      Left = 11
      Top = 92
      Width = 29
      Height = 13
      Caption = #1058#1077#1082#1089#1090
    end
    object lbl3: TLabel
      Left = 11
      Top = 65
      Width = 30
      Height = 13
      Caption = #1063#1080#1089#1083#1086
    end
    object lbl4: TLabel
      Left = 199
      Top = 65
      Width = 26
      Height = 13
      Caption = #1044#1072#1090#1072
    end
    object lbl5: TLabel
      Left = 11
      Top = 11
      Width = 35
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086
    end
    object lbl7: TLabel
      Left = 11
      Top = 38
      Width = 31
      Height = 13
      Caption = #1057#1091#1084#1084#1072
    end
    object edCNTB: TDBNumberEditEh
      Left = 64
      Top = 8
      Width = 129
      Height = 21
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = #1050#1086#1083'-'#1074#1086' '#1085#1072#1095#1072#1083#1086
      EditButton.Visible = True
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object edVT: TDBEditEh
      Left = 64
      Top = 89
      Width = 305
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1077#1088#1077#1084#1077#1085#1085#1072#1103' '#1090#1077#1082#1089#1090
      TabOrder = 6
      Visible = True
    end
    object edVD: TDBDateTimeEditEh
      Left = 232
      Top = 62
      Width = 137
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1077#1088#1077#1084#1077#1085#1085#1072#1103' '#1076#1072#1090#1072
      Kind = dtkDateEh
      TabOrder = 5
      Visible = True
    end
    object edCNTE: TDBNumberEditEh
      Left = 232
      Top = 8
      Width = 137
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = #1050#1086#1083'-'#1074#1086' '#1082#1086#1085#1077#1094
      EditButton.Visible = True
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object edSUMB: TDBNumberEditEh
      Left = 64
      Top = 35
      Width = 129
      Height = 21
      DynProps = <>
      EmptyDataInfo.Text = #1057#1091#1084#1084#1072' '#1085#1072#1095#1072#1083#1086
      EditButton.Visible = True
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
    object edSUME: TDBNumberEditEh
      Left = 232
      Top = 35
      Width = 137
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EmptyDataInfo.Text = #1057#1091#1084#1084#1072' '#1082#1086#1085#1077#1094
      EditButton.Visible = True
      EditButtons = <>
      TabOrder = 3
      Visible = True
    end
    object edVN: TDBNumberEditEh
      Left = 64
      Top = 62
      Width = 129
      Height = 21
      DynProps = <>
      EmptyDataInfo.Text = #1055#1077#1088#1077#1084#1077#1085#1085#1072#1103' '#1095#1080#1089#1083#1086
      EditButton.Visible = True
      EditButtons = <>
      TabOrder = 4
      Visible = True
    end
  end
  object pnlPeriod: TPanel
    Left = 0
    Top = 0
    Width = 377
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      377
      65)
    object Label1: TLabel
      Left = 8
      Top = 10
      Width = 38
      Height = 13
      Caption = #1055#1077#1088#1080#1086#1076
    end
    object cbMonth: TDBComboBoxEh
      Left = 64
      Top = 7
      Width = 162
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EmptyDataInfo.Text = #1052#1077#1089#1103#1094
      EditButtons = <>
      Items.Strings = (
        '1. '#1071#1085#1074#1072#1088#1100
        '2. '#1060#1077#1074#1088#1072#1083#1100
        '3. '#1052#1072#1088#1090
        '4. '#1040#1087#1088#1077#1083#1100
        '5. '#1052#1072#1081
        '6. '#1048#1102#1085#1100
        '7. '#1048#1102#1083#1100
        '8. '#1040#1074#1075#1091#1089#1090
        '9. '#1057#1077#1085#1090#1103#1073#1088#1100
        '10. '#1054#1082#1090#1103#1073#1088#1100
        '11. '#1053#1086#1103#1073#1088#1100
        '12. '#1044#1077#1082#1072#1073#1088#1100
        '')
      KeyItems.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12')
      TabOrder = 0
      Visible = True
    end
    object edtYear: TDBNumberEditEh
      Left = 232
      Top = 7
      Width = 137
      Height = 21
      Anchors = [akTop, akRight]
      DynProps = <>
      EmptyDataInfo.Text = #1043#1086#1076
      EditButtons = <>
      MaxValue = 2100.000000000000000000
      MinValue = 2010.000000000000000000
      TabOrder = 1
      Visible = True
    end
    object btnNextMonth: TButton
      Left = 232
      Top = 34
      Width = 137
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1085#1072' '#1084#1077#1089#1103#1094' '#1087#1086#1079#1078#1077' >'
      TabOrder = 2
      OnClick = btnNextMonthClick
    end
    object btnPrevMon: TButton
      Left = 64
      Top = 34
      Width = 129
      Height = 25
      Caption = '< '#1085#1072' '#1084#1077#1089#1103#1094' '#1088#1072#1085#1077#1077
      TabOrder = 3
      OnClick = btnPrevMonClick
    end
  end
  object pnlAll: TPanel
    Left = 0
    Top = 65
    Width = 377
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object chkPrevios: TCheckBox
      Left = 64
      Top = 4
      Width = 291
      Height = 17
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1087#1088#1086#1096#1083#1086#1075#1086' '#1082#1072#1082' '#1085#1072#1095#1072#1083#1086' '#1085#1086#1074#1086#1075#1086' '#1087#1077#1088#1080#1086#1076#1072
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1076#1072#1085#1085#1099#1077' '#1089' '#1087#1088#1086#1096#1083#1086#1075#1086' '#1087#1077#1088#1080#1086#1076#1072
      TabOrder = 0
      OnClick = chkPreviosClick
    end
  end
  object pnlClnt: TPanel
    Left = 0
    Top = 201
    Width = 377
    Height = 127
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      377
      127)
    object mmoBody: TDBMemoEh
      Left = 11
      Top = 6
      Width = 358
      Height = 81
      ScrollBars = ssBoth
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      TabOrder = 0
      Visible = True
      WantReturns = True
    end
    object btnCancel: TButton
      Left = 297
      Top = 94
      Width = 72
      Height = 26
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 2
    end
    object btnOk: TButton
      Left = 11
      Top = 94
      Width = 280
      Height = 26
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      Default = True
      TabOrder = 1
      OnClick = btnOkClick
    end
  end
  object cnError: TCnErrorProvider
    DoubleBuffer = False
    Left = 116
    Top = 202
  end
end
