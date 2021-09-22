object ScanImageForm: TScanImageForm
  Left = 0
  Top = 0
  Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
  ClientHeight = 505
  ClientWidth = 644
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
  object ImgHolder: TImage
    Left = 0
    Top = 106
    Width = 644
    Height = 399
    Align = alClient
    Proportional = True
    Stretch = True
  end
  object PnlTop: TPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 106
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      644
      106)
    object lbl1: TLabel
      Left = 3
      Top = 10
      Width = 37
      Height = 13
      Caption = #1057#1082#1072#1085#1077#1088
    end
    object lbl2: TLabel
      Left = 3
      Top = 42
      Width = 47
      Height = 13
      Caption = #1080#1083#1080' '#1060#1072#1081#1083
    end
    object BtnScanWithDialog: TButton
      Left = 486
      Top = 5
      Width = 153
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1089' '#1085#1072#1089#1090#1088#1086#1081#1082#1072#1084#1080
      TabOrder = 2
      OnClick = BtnScanWithDialogClick
    end
    object BtnScanWithoutDialog: TButton
      Left = 350
      Top = 5
      Width = 130
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1041#1099#1089#1090#1088#1086#1077' '#1089#1082#1072#1085#1080#1088#1086#1074#1072#1085#1080#1077
      TabOrder = 1
      OnClick = BtnScanWithoutDialogClick
    end
    object btnSave: TButton
      Left = 53
      Top = 69
      Width = 427
      Height = 30
      Anchors = [akLeft, akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      ModalResult = 1
      TabOrder = 6
      OnClick = btnSaveClick
    end
    object cbbDevice: TDBComboBoxEh
      Left = 53
      Top = 7
      Width = 291
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1089#1082#1072#1085#1077#1088
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = cbbDeviceEditButtons0Click
        end>
      TabOrder = 0
      Text = 'cbbDevice'
      Visible = True
      OnChange = cbbDeviceChange
    end
    object btnCancel: TButton
      Left = 486
      Top = 69
      Width = 153
      Height = 30
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 5
      OnClick = btnSaveClick
    end
    object edtFile: TDBEditEh
      Left = 53
      Top = 39
      Width = 427
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <
        item
          Style = ebsEllipsisEh
          OnClick = edtFileEditButtons0Click
        end>
      EmptyDataInfo.Text = #1080#1083#1080' '#1086#1090#1082#1088#1099#1090#1100' '#1075#1088#1072#1092#1080#1095#1077#1089#1082#1080#1081' '#1092#1072#1081#1083' '
      TabOrder = 3
      Visible = True
    end
    object chkSave: TDBCheckBoxEh
      Left = 486
      Top = 41
      Width = 153
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1072#1081#1083' '#1074' '#1073#1072#1079#1077
      Checked = True
      DynProps = <>
      State = cbChecked
      TabOrder = 4
    end
  end
  object dlgOpenPic: TOpenPictureDialog
    Left = 376
    Top = 232
  end
  object PropStorageEh: TPropStorageEh
    Section = 'SCAN'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'PnlTop.chkSave.<P>.Checked')
    Left = 105
    Top = 125
  end
end
