object apgNodeAttributes: TapgNodeAttributes
  Left = 0
  Top = 0
  Caption = #1040#1090#1088#1080#1073#1091#1090#1099
  ClientHeight = 138
  ClientWidth = 447
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
    Left = 27
    Top = 0
    Width = 420
    Height = 138
    Align = alClient
    AllowedOperations = []
    AutoFitColWidths = False
    DataSource = srcAttributes
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    TabOrder = 1
    OnDblClick = dbgCustAttrDblClick
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1040#1090#1088#1080#1073#1091#1090
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NA_VALUE'
        Footers = <>
        Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 189
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object tbAttributes: TToolBar
    Left = 0
    Top = 0
    Width = 27
    Height = 138
    Align = alLeft
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Images = A4MainForm.ICONS_ACTIVE
    TabOrder = 0
    object btnAdd: TToolButton
      Left = 0
      Top = 0
      Action = actAdd
      ParentShowHint = False
      Wrap = True
      ShowHint = True
    end
    object btnEdit: TToolButton
      Left = 0
      Top = 22
      Action = actEdit
      ParentShowHint = False
      Wrap = True
      ShowHint = True
    end
    object btnDel: TToolButton
      Left = 0
      Top = 44
      Action = actDel
      ParentShowHint = False
      ShowHint = True
    end
  end
  object dsAttributes: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    NODES_ATTRIBUTES'
      'WHERE'
      '    NODE_ID = :OLD_NODE_ID')
    RefreshSQL.Strings = (
      'SELECT A.O_NAME, CA.*'
      'FROM NODES_ATTRIBUTES CA'
      '   INNER JOIN OBJECTS A ON (CA.O_ID = A.O_ID and A.O_TYPE = 39)'
      'where CA.NODE_ID = :NODE_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT A.O_NAME, CA.*'
      'FROM NODES_ATTRIBUTES CA'
      '   INNER JOIN OBJECTS A ON (CA.O_ID = A.O_ID and A.O_TYPE = 39)'
      'where CA.NODE_ID = :NODE_ID')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 131
    Top = 69
  end
  object srcAttributes: TDataSource
    DataSet = dsAttributes
    Left = 63
    Top = 35
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 206
    Top = 37
    object actAdd: TAction
      Caption = 'actAdd'
      ImageIndex = 2
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Caption = 'actEdit'
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actDel: TAction
      Caption = 'actDel'
      ImageIndex = 3
      OnExecute = actDelExecute
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
