object TimeShiftForm: TTimeShiftForm
  Left = 0
  Top = 0
  ActiveControl = ednMinutes
  BorderStyle = bsDialog
  Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1088#1077#1084#1103
  ClientHeight = 182
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  DesignSize = (
    306
    182)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 19
    Width = 178
    Height = 13
    Caption = #1059#1082#1072#1078#1080#1090#1077' '#1085#1072' '#1089#1082#1086#1083#1100#1082#1086' '#1089#1084#1077#1089#1090#1080#1090#1100', '#1084#1080#1085
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 141
    Width = 306
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      306
      41)
    object btnOk: TButton
      Left = 22
      Top = 8
      Width = 193
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 221
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object ednMinutes: TDBNumberEditEh
    Left = 208
    Top = 16
    Width = 88
    Height = 21
    Hint = #1059#1082#1072#1078#1080#1090#1077' '#1085#1072' '#1089#1082#1086#1083#1100#1082#1086' +/- '#1084#1080#1085#1091#1090' '#1089#1084#1077#1089#1090#1080#1090#1100
    Anchors = [akLeft, akTop, akRight]
    DecimalPlaces = 0
    DynProps = <>
    EmptyDataInfo.Text = '+/- '#1084#1080#1085#1091#1090
    EditButtons = <>
    TabOrder = 0
    Visible = True
  end
  object chkUTC: TDBCheckBoxEh
    Left = 16
    Top = 57
    Width = 185
    Height = 17
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1074#1088#1077#1084#1103' UTC'
    Checked = True
    DynProps = <>
    State = cbChecked
    TabOrder = 1
  end
  object chkLocal: TDBCheckBoxEh
    Left = 16
    Top = 83
    Width = 185
    Height = 17
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1083#1086#1082#1072#1083#1100#1085#1086#1077' '#1074#1088#1077#1084#1103' '
    Checked = True
    DynProps = <>
    State = cbChecked
    TabOrder = 2
  end
  object chkUpdateDVB: TDBCheckBoxEh
    Left = 16
    Top = 108
    Width = 185
    Height = 17
    Caption = #1055#1077#1088#1077#1079#1072#1087#1091#1089#1090#1080#1090#1100' EPG '#1089#1077#1088#1074#1077#1088
    Checked = True
    DynProps = <>
    State = cbChecked
    TabOrder = 3
  end
end
