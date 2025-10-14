object apgNodeLayout: TapgNodeLayout
  Left = 0
  Top = 0
  Caption = #1050#1086#1084#1087#1086#1085#1086#1074#1082#1072
  ClientHeight = 166
  ClientWidth = 848
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgCustAttr: TDBGridEh
    Left = 32
    Top = 0
    Width = 816
    Height = 166
    Align = alClient
    AllowedOperations = []
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
    TabOrder = 0
    TitleParams.MultiTitle = True
    OnDblClick = dbgCustAttrDblClick
    OnGetCellParams = dbgCustAttrGetCellParams
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ST_NAME'
        Footers = <>
        HideDuplicates = True
        Title.Caption = #1058#1080#1087' '#1091#1089#1083#1091#1075
        Title.TitleButton = True
        Width = 92
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUST_QNT'
        Footers = <>
        HideDuplicates = True
        Title.Caption = #1055#1083#1072#1085#1086#1074#1086#1077' '#1082#1086#1083'-'#1074#1086'|'#1040#1073#1086#1085#1077#1085#1090#1086#1074
        Title.TitleButton = True
        Width = 82
        OnGetCellParams = dbgCustAttrColumns1GetCellParams
      end
      item
        CellButtons = <>
        DisplayFormat = ',#.###'
        DynProps = <>
        EditButtons = <>
        FieldName = 'MAT_QNT'
        Footers = <>
        Title.Caption = #1055#1083#1072#1085#1086#1074#1086#1077' '#1082#1086#1083'-'#1074#1086'|'#1052#1072#1090#1077#1088#1080#1072#1083#1086#1074
        Title.TitleButton = True
        Width = 73
        OnGetCellParams = dbgCustAttrColumns1GetCellParams
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MAT_LIST'
        Footers = <>
        ShowImageAndText = True
        Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083' '#1080#1079' '#1089#1087#1080#1089#1082#1072
        Title.TitleButton = True
        Width = 178
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUST_QNT_FACT'
        Footers = <>
        HideDuplicates = True
        Title.Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080' '#1082#1086#1083'-'#1074#1086'|'#1040#1073#1086#1085#1077#1085#1090#1086#1074
        Title.TitleButton = True
        Width = 70
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
        Title.Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080' '#1082#1086#1083'-'#1074#1086'|'#1052#1072#1090#1077#1088#1080#1072#1083#1086#1074
        Title.TitleButton = True
        Width = 81
        OnGetCellParams = dbgCustAttrColumns5GetCellParams
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1082' '#1082#1086#1084#1087#1072#1085#1086#1074#1082#1077
        Title.TitleButton = True
        Width = 189
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlBottLeft: TPanel
    Left = 0
    Top = 0
    Width = 32
    Height = 166
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      32
      166)
    object btnAddL: TSpeedButton
      Left = 5
      Top = 6
      Width = 23
      Height = 22
      Action = actAdd
      Flat = True
    end
    object btnEditL: TSpeedButton
      Left = 5
      Top = 34
      Width = 23
      Height = 22
      Action = actEdit
      Flat = True
    end
    object btnDelL: TSpeedButton
      Left = 5
      Top = 142
      Width = 23
      Height = 22
      Action = actDel
      Anchors = [akLeft, akBottom]
      Flat = True
    end
    object btnRepair: TSpeedButton
      Left = 3
      Top = 86
      Width = 23
      Height = 22
      Action = actRepair
      Flat = True
    end
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
      '    *'
      '  from Get_Node_Layout_FACT(:NODE_ID)'
      '  order by Srv_Type, Cust_Qnt  ')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 131
    Top = 69
  end
  object srcLayout: TDataSource
    AutoEdit = False
    DataSet = dsLayout
    OnDataChange = srcLayoutDataChange
    Left = 63
    Top = 35
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 206
    Top = 37
    object actAdd: TAction
      ImageIndex = 2
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actDel: TAction
      ImageIndex = 3
      OnExecute = actDelExecute
    end
    object actRepair: TAction
      ImageIndex = 92
      OnExecute = actRepairExecute
    end
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 331
    Top = 42
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 371
    Top = 42
  end
end
