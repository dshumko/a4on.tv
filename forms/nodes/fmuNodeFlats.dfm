object apgNodeFlats: TapgNodeFlats
  Left = 0
  Top = 0
  Caption = #1044#1086#1084#1072' '#1080' '#1050#1074#1072#1088#1090#1080#1088#1099' '#1091#1079#1083#1072
  ClientHeight = 211
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgNodeFiles: TDBGridEh
    Left = 26
    Top = 0
    Width = 753
    Height = 211
    Align = alClient
    AllowedOperations = []
    DataSource = srcFlats
    DrawMemoText = True
    DynProps = <>
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    SumList.Active = True
    TabOrder = 0
    TitleParams.MultiTitle = True
    OnDblClick = dbgNodeFilesDblClick
    OnSortMarkingChanged = dbgNodeFilesSortMarkingChanged
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'LVL'
        Footers = <>
        Title.Caption = #1059#1088#1086#1074#1077#1085#1100
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLAT_NO'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1050#1074#1072#1088#1090#1080#1088#1072
        Title.TitleButton = True
        Width = 95
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SRV_LIST'
        Footers = <>
        ShowImageAndText = True
        Title.Caption = #1059#1089#1083#1091#1075#1080' '#1082#1074#1072#1088#1090#1080#1088#1099
        Title.TitleButton = True
        Width = 139
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PORCH_N'
        Footers = <>
        Title.Caption = #1055#1086#1076'-'#1076
        Title.TitleButton = True
        Width = 44
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLOOR_N'
        Footers = <>
        Title.Caption = #1069#1090#1072#1078
        Title.TitleButton = True
        Width = 46
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_NO'
        Footers = <>
        Title.Caption = #1044#1086#1084
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_NAME'
        Footers = <>
        Title.Caption = #1059#1083#1080#1094#1072
        Title.TitleButton = True
        Width = 136
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 156
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 211
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object btnAdd1: TSpeedButton
      Left = 2
      Top = 4
      Width = 22
      Height = 22
      Action = actEdit
      Flat = True
    end
    object btnFind: TSpeedButton
      Left = 2
      Top = 40
      Width = 22
      Height = 22
      Action = actCustomers
      Flat = True
    end
  end
  object dsFlats: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CUSTOMER_FILES'
      'WHERE'
      '        CF_ID = :OLD_CF_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    House_Id'
      '  , Lvl'
      '  , Flat_No'
      '  , Porch_N'
      '  , Floor_N'
      '  , Srv_List'
      '  , Cst_List'
      '  , Street_Name'
      '  , House_No'
      '  , Notice'
      '  from Get_Node_Flat_Lvl(:Node_Id)'
      '  ')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 131
    Top = 85
    oFetchAll = True
  end
  object srcFlats: TDataSource
    DataSet = dsFlats
    Left = 63
    Top = 35
  end
  object ActList: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 206
    Top = 37
    object actAdd: TAction
      Caption = 'actAdd'
      ImageIndex = 2
    end
    object actEdit: TAction
      Hint = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1082#1074#1072#1088#1090#1080#1088#1099' '#1082' '#1091#1079#1083#1091
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actDel: TAction
      Caption = 'actDel'
      ImageIndex = 3
    end
    object actView: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1072#1081#1083#1072
      ImageIndex = 38
    end
    object actCustomers: TAction
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1086#1074' '#1076#1086#1084#1072
      ImageIndex = 9
      OnExecute = actCustomersExecute
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
  object qRead: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select Content from node_Files where NF_Id = :NF_Id')
    Left = 296
    Top = 120
  end
end
