object NodeLayoutFactForm: TNodeLayoutFactForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1050#1086#1084#1087#1086#1085#1086#1074#1082#1072' '#1091#1079#1083#1072' ('#1092#1072#1082#1090')'
  ClientHeight = 406
  ClientWidth = 856
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  DesignSize = (
    856
    406)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TBitBtn
    Left = 5
    Top = 380
    Width = 746
    Height = 23
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1042#1085#1077#1089#1090#1080' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    NumGlyphs = 2
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 757
    Top = 380
    Width = 94
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 1
  end
  object dbgCustAttr: TDBGridEh
    Left = 0
    Top = 0
    Width = 855
    Height = 376
    AllowedOperations = [alopUpdateEh]
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = srcLayout
    DrawMemoText = True
    DynProps = <>
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    SumList.Active = True
    TabOrder = 2
    TitleParams.MultiTitle = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ST_NAME'
        Footers = <>
        HideDuplicates = True
        ReadOnly = True
        Title.Caption = #1058#1080#1087' '#1091#1089#1083#1091#1075
        Title.TitleButton = True
        Width = 92
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'LT_POSITION'
        Footers = <>
        HideDuplicates = True
        ReadOnly = True
        Title.Caption = #1055#1086#1079#1080#1094#1080#1103
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUST_QNT'
        Footers = <>
        HideDuplicates = True
        ReadOnly = True
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090#1086#1074'|'#1055#1083#1072#1085#1086#1074#1086#1077
        Title.TitleButton = True
        Width = 82
        OnGetCellParams = dbgCustAttrColumns2GetCellParams
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUST_QNT_FACT'
        Footers = <>
        HideDuplicates = True
        ReadOnly = True
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090#1086#1074'|'#1060#1072#1082#1090#1080#1095#1077#1089#1082#1080
        Title.TitleButton = True
        Width = 70
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MAT_NAME'
        Footers = <>
        ReadOnly = True
        ShowImageAndText = True
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
        Title.TitleButton = True
        Width = 178
      end
      item
        CellButtons = <>
        DisplayFormat = ',#.###'
        DynProps = <>
        EditButtons = <>
        FieldName = 'MAT_QNT'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1086#1074'|'#1055#1083#1072#1085#1086#1074#1086#1077
        Title.TitleButton = True
        Width = 73
        OnGetCellParams = dbgCustAttrColumns2GetCellParams
      end
      item
        CellButtons = <>
        DisplayFormat = ',#.###'
        DynProps = <>
        EditButtons = <>
        FieldName = 'MAT_QNT_FACT'
        Footer.DisplayFormat = '0.###'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1086#1074'|'#1060#1072#1082#1090#1080#1095#1077#1089#1082#1080
        Title.TitleButton = True
        Width = 81
        OnGetCellParams = dbgCustAttrColumns6GetCellParams
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1082' '#1082#1086#1084#1087#1072#1085#1086#1074#1082#1077
        Title.TitleButton = True
        Width = 189
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 51
    Top = 224
  end
  object mtLayout: TMemTableEh
    Active = True
    Params = <>
    Left = 96
    Top = 128
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object LT_ID: TMTNumericDataFieldEh
          FieldName = 'LT_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'LT_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object LT_POSITION: TMTNumericDataFieldEh
          FieldName = 'LT_POSITION'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'LT_POSITION'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object NODE_ID: TMTNumericDataFieldEh
          FieldName = 'NODE_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'NODE_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object NODE_TYPE: TMTNumericDataFieldEh
          FieldName = 'NODE_TYPE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'NODE_TYPE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object ITSOWN: TMTNumericDataFieldEh
          FieldName = 'ITSOWN'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'ITSOWN'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SRV_TYPE: TMTNumericDataFieldEh
          FieldName = 'SRV_TYPE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'SRV_TYPE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object ST_NAME: TMTStringDataFieldEh
          FieldName = 'ST_NAME'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'ST_NAME'
          DisplayWidth = 100
          Size = 100
          Transliterate = True
        end
        object CUST_QNT: TMTNumericDataFieldEh
          FieldName = 'CUST_QNT'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CUST_QNT'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object MAT_QNT: TMTNumericDataFieldEh
          FieldName = 'MAT_QNT'
          NumericDataType = fdtBCDEh
          AutoIncrement = False
          DisplayLabel = 'MAT_QNT'
          DisplayWidth = 10
          DisplayFormat = '#,##0.000'
          EditFormat = '0.000'
          currency = False
          Precision = 0
          Scale = 3
        end
        object MAT_REQ: TMTBooleanDataFieldEh
          FieldName = 'MAT_REQ'
          DisplayLabel = 'MAT_REQ'
          DisplayWidth = 5
        end
        object NOTICE: TMTStringDataFieldEh
          FieldName = 'NOTICE'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'NOTICE'
          DisplayWidth = 1000
          Size = 1000
          Transliterate = True
        end
        object MAT_ID: TMTNumericDataFieldEh
          FieldName = 'MAT_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'MAT_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object MAT_NAME: TMTStringDataFieldEh
          FieldName = 'MAT_NAME'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'MAT_NAME'
          DisplayWidth = 100
          Size = 100
          Transliterate = True
        end
        object CUST_QNT_FACT: TMTNumericDataFieldEh
          FieldName = 'CUST_QNT_FACT'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CUST_QNT_FACT'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object MAT_QNT_FACT: TMTNumericDataFieldEh
          FieldName = 'MAT_QNT_FACT'
          NumericDataType = fdtBCDEh
          AutoIncrement = False
          DisplayLabel = 'MAT_QNT_FACT'
          DisplayWidth = 10
          DisplayFormat = '#,##0.000'
          EditFormat = '0.000'
          currency = False
          Precision = 0
          Scale = 3
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object srcLayout: TDataSource
    DataSet = mtLayout
    Left = 160
    Top = 144
  end
  object dsLayout: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    NODE_LAYOUT'
      'WHERE'
      '        LT_ID = :OLD_LT_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    Lt_Id'
      '  , Node_Id'
      '  , Srv_Type'
      '  , Mat_Qnt'
      '  , Cust_Qnt'
      '  , Mat_Id_List'
      '  , Mat_Req'
      '  , Notice'
      '  , St_Name'
      '  , Itsown'
      '  , Mat_List'
      '  from Get_Node_Layout(:OLD_NODE_ID)'
      '  order by Srv_Type, Cust_Qnt')
    SelectSQL.Strings = (
      'select'
      '    Lt_Id'
      '  , Lt_Position'
      '  , Node_Id'
      '  , Node_Type'
      '  , Itsown'
      '  , Srv_Type'
      '  , St_Name'
      '  , Cust_Qnt'
      '  , Mat_Qnt'
      '  , Mat_Req'
      '  , Notice'
      '  , Mat_Id'
      '  , Mat_Name'
      '  , Cust_Qnt_Fact'
      '  , Mat_Qnt_Fact'
      '  , Mat_Qnt_Fact Mat_Qnt_Save  '
      '  from Get_Node_Layout_Fact_Detail(:NODE_ID)'
      '  order by Srv_Type, Cust_Qnt  ')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 131
    Top = 69
  end
  object PropStorage: TPropStorageEh
    Section = 'LT_DETAIL'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 153
    Top = 217
  end
end
