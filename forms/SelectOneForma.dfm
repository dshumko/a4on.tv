object SelectOneForm: TSelectOneForm
  Left = 0
  Top = 0
  ActiveControl = dbgSelect
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1057#1076#1077#1083#1072#1081#1090#1077' '#1074#1099#1073#1086#1088
  ClientHeight = 225
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBottom: TPanel
    Left = 0
    Top = 184
    Width = 488
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      488
      41)
    object btnOk: TButton
      Left = 16
      Top = 8
      Width = 375
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1042#1099#1073#1088#1072#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TButton
      Left = 403
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
  object dbgSelect: TDBGridEh
    Left = 0
    Top = 0
    Width = 488
    Height = 184
    Align = alClient
    AllowedOperations = []
    AllowedSelections = []
    DataSource = srcSelect
    DynProps = <>
    Flat = True
    SearchPanel.Enabled = True
    SearchPanel.FilterOnTyping = True
    STFilter.Local = True
    STFilter.Visible = True
    TabOrder = 0
    OnDblClick = dbgSelectDblClick
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_TYPE'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 25
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Account_No'
        Footers = <>
        Title.Caption = #1051#1080#1094#1077#1074#1086#1081' / '#1053#1086#1084#1077#1088
        Title.TitleButton = True
        Width = 90
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FIO'
        Footers = <>
        Title.Caption = #1060#1048#1054' / '#1053#1072#1079#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 128
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLAT_NO'
        Footers = <>
        Title.Caption = #1050#1074'.'
        Title.TitleButton = True
        Width = 39
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUST_STATE_DESCR'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 195
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object srcSelect: TDataSource
    Left = 280
    Top = 112
  end
end
