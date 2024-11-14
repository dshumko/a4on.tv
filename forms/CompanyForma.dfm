object CompanyForm: TCompanyForm
  Left = 451
  Top = 359
  Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103
  ClientHeight = 458
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tlbMain: TToolBar
    Left = 0
    Top = 0
    Width = 603
    Height = 25
    Caption = 'tlbMain'
    Images = A4MainForm.ICONS_ACTIVE
    TabOrder = 0
    object ToolButton4: TToolButton
      Left = 0
      Top = 0
      Width = 5
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 5
      Top = 0
      Action = actNew
    end
    object ToolButton3: TToolButton
      Left = 28
      Top = 0
      Action = actEdit
    end
    object ToolButton2: TToolButton
      Left = 51
      Top = 0
      Action = actDelete
    end
    object ToolButton9: TToolButton
      Left = 74
      Top = 0
      Width = 15
      Caption = 'ToolButton9'
      ImageIndex = 27
      Style = tbsSeparator
      Visible = False
    end
    object tbOk: TToolButton
      Left = 89
      Top = 0
      Caption = 'actPaymentDelete'
      Enabled = False
      ImageIndex = 25
      Visible = False
      OnClick = tbOkClick
    end
    object ToolButton10: TToolButton
      Left = 112
      Top = 0
      Width = 4
      Caption = 'ToolButton10'
      ImageIndex = 28
      Style = tbsSeparator
      Visible = False
    end
    object tbCancel: TToolButton
      Left = 116
      Top = 0
      Caption = 'tbCancel'
      Enabled = False
      ImageIndex = 26
      Visible = False
      OnClick = tbCancelClick
    end
  end
  object dbGrid: TDBGridEh
    Left = 0
    Top = 193
    Width = 603
    Height = 265
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = srcCompany
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    SearchPanel.Enabled = True
    TabOrder = 2
    TitleParams.MultiTitle = True
    OnDblClick = dbGridDblClick
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'C_ORDER'
        Footers = <>
        Title.Caption = #8470' '#1087#1087
        Width = 32
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'C_CODE'
        Footers = <>
        Title.Caption = #1050#1054#1044
        Width = 107
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'C_NAME'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 177
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'C_VALUE'
        Footers = <>
        Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'C_DESCRIPTION'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Width = 154
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlEdit: TPanel
    Left = 0
    Top = 25
    Width = 603
    Height = 168
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    DesignSize = (
      603
      168)
    object lbl3: TLabel
      Left = 5
      Top = 83
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object lbl1: TLabel
      Left = 5
      Top = 59
      Width = 48
      Height = 13
      Caption = #1047#1085#1072#1095#1077#1085#1080#1077
    end
    object lbl2: TLabel
      Left = 5
      Top = 36
      Width = 73
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object lbl4: TLabel
      Left = 5
      Top = 12
      Width = 50
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1087'/'#1087
    end
    object lbl5: TLabel
      Left = 205
      Top = 12
      Width = 23
      Height = 13
      Caption = #1050#1054#1044
    end
    object btnSaveLink: TBitBtn
      Left = 84
      Top = 135
      Width = 406
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 5
      OnClick = btnSaveLinkClick
    end
    object btnCancelLink: TBitBtn
      Left = 508
      Top = 135
      Width = 86
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 6
      OnClick = btnCancelLinkClick
    end
    object edtO_DIMENSION: TDBEditEh
      Left = 84
      Top = 56
      Width = 510
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'C_VALUE'
      DataSource = srcCompany
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1047#1085#1072#1095#1077#1085#1080#1077' '#1087#1086#1083#1103
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object edtName: TDBEditEh
      Left = 84
      Top = 33
      Width = 510
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'C_NAME'
      DataSource = srcCompany
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object mmoDesc: TDBMemoEh
      Left = 84
      Top = 80
      Width = 510
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'C_DESCRIPTION'
      DataSource = srcCompany
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1086#1083#1103
      ShowHint = True
      TabOrder = 4
      Visible = True
      WantReturns = True
    end
    object edtPP: TDBEditEh
      Left = 84
      Top = 9
      Width = 109
      Height = 21
      DataField = 'C_ORDER'
      DataSource = srcCompany
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1087'/'#1087' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object edtC_KODE: TDBEditEh
      Left = 234
      Top = 9
      Width = 360
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'C_CODE'
      DataSource = srcCompany
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1050#1086#1076' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077') '#1085#1072' '#1083#1072#1090#1080#1085#1080#1094#1077
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
  end
  object srcCompany: TDataSource
    AutoEdit = False
    DataSet = dmMain.dsCompany
    OnStateChange = srcCompanyStateChange
    OnDataChange = srcCompanyDataChange
    Left = 120
    Top = 264
  end
  object ActionList1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 216
    Top = 264
    object actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      ImageIndex = 4
      ShortCut = 113
      OnExecute = actEditExecute
    end
    object actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 2
      ShortCut = 113
      OnExecute = actNewExecute
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = actDeleteExecute
    end
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 216
    Top = 72
  end
end
