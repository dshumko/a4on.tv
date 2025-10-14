object NewTaskForm: TNewTaskForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1053#1086#1074#1072#1103' '#1079#1072#1076#1072#1095#1072
  ClientHeight = 231
  ClientWidth = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRecourse: TPanel
    Left = 0
    Top = 0
    Width = 507
    Height = 190
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      507
      190)
    object edtTitle: TDBEditEh
      Left = 16
      Top = 8
      Width = 313
      Height = 21
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1079#1072#1076#1072#1095#1080
      EmptyDataInfo.Font.Charset = DEFAULT_CHARSET
      EmptyDataInfo.Font.Color = clSilver
      EmptyDataInfo.Font.Height = -13
      EmptyDataInfo.Font.Name = 'Tahoma'
      EmptyDataInfo.Font.Style = [fsItalic]
      EmptyDataInfo.ParentFont = False
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object edtDate: TDBDateTimeEditEh
      Left = 16
      Top = 33
      Width = 313
      Height = 21
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1050#1086#1075#1076#1072' '#1074#1099#1087#1086#1083#1085#1080#1090#1100
      EmptyDataInfo.Font.Charset = DEFAULT_CHARSET
      EmptyDataInfo.Font.Color = clSilver
      EmptyDataInfo.Font.Height = -13
      EmptyDataInfo.Font.Name = 'Tahoma'
      EmptyDataInfo.Font.Style = [fsItalic]
      EmptyDataInfo.ParentFont = False
      ShowHint = True
      TabOrder = 1
      Visible = True
      EditFormat = 'DD/MM/YYYY HH:NN'
    end
    object mmoNotice: TDBMemoEh
      Left = 16
      Top = 57
      Width = 313
      Height = 132
      Anchors = [akLeft, akTop, akBottom]
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1079#1072#1076#1072#1095#1080
      EmptyDataInfo.Font.Charset = DEFAULT_CHARSET
      EmptyDataInfo.Font.Color = clSilver
      EmptyDataInfo.Font.Height = -13
      EmptyDataInfo.Font.Name = 'Tahoma'
      EmptyDataInfo.Font.Style = [fsItalic]
      EmptyDataInfo.ParentFont = False
      ShowHint = True
      TabOrder = 2
      Visible = True
      WantReturns = True
    end
    object dbgUsers: TDBGridEh
      Left = 335
      Top = 6
      Width = 172
      Height = 155
      Hint = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080' '#1079#1072#1076#1072#1095#1080
      AllowedOperations = [alopUpdateEh]
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = srcUsers
      DynProps = <>
      IndicatorOptions = [gioShowRowIndicatorEh, gioShowRowselCheckboxesEh]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      SortLocal = True
      STFilter.Local = True
      STFilter.Visible = True
      TabOrder = 3
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FIO'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
          Title.TitleButton = True
          Width = 126
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object cbClose: TDBComboBoxEh
      Left = 335
      Top = 167
      Width = 167
      Height = 21
      Hint = 
        #1050#1086#1084#1091' '#1084#1086#1078#1085#1086' '#1079#1072#1082#1088#1099#1074#1072#1090#1100' '#1079#1072#1076#1072#1095#1091'. '#1045#1089#1083#1080' '#1086#1089#1090#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1099#1084', '#1090#1086' '#1079#1072#1082#1088#1099#1090#1100' '#1084#1086 +
        #1078#1077#1090' '#1090#1086#1090' '#1082#1090#1086' '#1087#1086#1089#1090#1072#1074#1080#1083
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EmptyDataInfo.Text = #1050#1090#1086' '#1084#1086#1078#1077#1090' '#1079#1072#1082#1088#1099#1090#1100
      EditButtons = <>
      Items.Strings = (
        #1082#1090#1086' '#1087#1086#1089#1090#1072#1074#1080#1083
        #1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
        #1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100', '#1073#1077#1079' '#1076#1086#1083#1078#1085#1080#1082#1086#1074' '#1074' '#1079#1072#1076#1072#1095#1077)
      KeyItems.Strings = (
        '0'
        '1'
        '2')
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 190
    Width = 507
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      507
      41)
    object btnOk: TBitBtn
      Left = 16
      Top = 5
      Width = 400
      Height = 30
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TBitBtn
      Left = 427
      Top = 5
      Width = 75
      Height = 30
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 240
    Top = 80
  end
  object mtbUsers: TMemTableEh
    Params = <>
    Left = 383
    Top = 99
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object IN_TASK: TMTBooleanDataFieldEh
          FieldName = 'IN_TASK'
          DisplayWidth = 20
        end
        object FIO: TMTStringDataFieldEh
          FieldName = 'FIO'
          StringDataType = fdtStringEh
          DisplayWidth = 50
        end
        object IBNAME: TMTStringDataFieldEh
          FieldName = 'IBNAME'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object srcUsers: TDataSource
    DataSet = mtbUsers
    Left = 367
    Top = 83
  end
  object PropStorageEh: TPropStorageEh
    Section = 'TASK'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 87
    Top = 72
  end
end
