object FlatsAddForm: TFlatsAddForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = #1057#1086#1079#1076#1072#1090#1100' '#1082#1074#1072#1088#1090#1080#1088#1099' '#1076#1086#1084#1072
  ClientHeight = 299
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object dbgStructure: TDBGridEh
    Left = 0
    Top = 0
    Width = 474
    Height = 167
    Align = alClient
    DataSource = srcStructure
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    HorzScrollBar.ExtraPanel.NavigatorButtons = [nbInsertEh, nbDeleteEh, nbEditEh]
    HorzScrollBar.ExtraPanel.Visible = True
    HorzScrollBar.ExtraPanel.VisibleItems = [gsbiRecordsInfoEh, gsbiNavigator]
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghExtendVertLines]
    SearchPanel.Location = splHorzScrollBarExtraPanelEh
    TabOrder = 0
    TitleParams.MultiTitle = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PorchCount'
        Footers = <>
        Title.Caption = #1055#1086#1076#1098#1077#1079#1076'|'#1050#1086#1083'-'#1074#1086
        Width = 66
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PorchFrom'
        Footers = <>
        Title.Caption = #1055#1086#1076#1098#1077#1079#1076'|'#1053#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1089
        Width = 82
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FloorCount'
        Footers = <>
        Title.Caption = #1069#1090#1072#1078#1080'|'#1050#1086#1083'-'#1074#1086
        Width = 68
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FloorFrom'
        Footers = <>
        Title.Caption = #1069#1090#1072#1078#1080'|'#1053#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1089
        Width = 84
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FlatsCount'
        Footers = <>
        Title.Caption = #1050#1074#1072#1088#1090#1080#1088#1099'|'#1085#1072' '#1101#1090#1072#1078#1077
        Width = 68
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FlatsFrom'
        Footers = <>
        Title.Caption = #1050#1074#1072#1088#1090#1080#1088#1099'|'#1053#1091#1084#1077#1088#1086#1074#1072#1090#1100' '#1089
        Width = 80
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlBtm: TPanel
    Left = 0
    Top = 258
    Width = 474
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      474
      41)
    object btn1: TButton
      Left = 152
      Top = 6
      Width = 221
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1079#1076#1072#1090#1100
      TabOrder = 0
      OnClick = btn1Click
    end
    object btn2: TButton
      Left = 388
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object mmo1: TDBMemoEh
    Left = 0
    Top = 167
    Width = 474
    Height = 91
    Lines.Strings = (
      'mmo1')
    ScrollBars = ssBoth
    Align = alBottom
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 1
    Visible = False
    WantReturns = True
  end
  object srcStructure: TDataSource
    DataSet = dsStructure
    Left = 266
    Top = 96
  end
  object qry: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    Left = 73
    Top = 182
  end
  object dsStructure: TMemTableEh
    Active = True
    Params = <>
    OnNewRecord = dsStructureNewRecord
    Left = 192
    Top = 96
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object PorchCount: TMTNumericDataFieldEh
          FieldName = 'PorchCount'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'PorchCount'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object PorchFrom: TMTNumericDataFieldEh
          FieldName = 'PorchFrom'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'PorchFrom'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object FloorCount: TMTNumericDataFieldEh
          FieldName = 'FloorCount'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'FloorCount'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object FloorFrom: TMTStringDataFieldEh
          FieldName = 'FloorFrom'
          StringDataType = fdtStringEh
          DisplayLabel = 'FloorFrom'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object FlatsCount: TMTNumericDataFieldEh
          FieldName = 'FlatsCount'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'FlatsCount'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object FlatsFrom: TMTStringDataFieldEh
          FieldName = 'FlatsFrom'
          StringDataType = fdtStringEh
          DisplayLabel = 'FlatsFrom'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
end
