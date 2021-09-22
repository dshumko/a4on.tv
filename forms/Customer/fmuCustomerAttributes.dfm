object apgCustomerAttributes: TapgCustomerAttributes
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
    DataSource = srcCustAttributes
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    STFilter.InstantApply = True
    STFilter.Local = True
    STFilter.Location = stflInTitleFilterEh
    STFilter.Visible = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    OnDblClick = dbgCustAttrDblClick
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1040#1090#1088#1080#1073#1091#1090
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CA_VALUE'
        Footers = <>
        Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
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
  object dsCustAttributes: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CUSTOMER_ATTRIBUTES'
      'SET '
      '    CA_ID = :CA_ID,'
      '    CA_VALUE = :CA_VALUE,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    CUSTOMER_ID = :OLD_CUSTOMER_ID'
      '    and O_ID = :OLD_O_ID'
      '    and CA_VALUE = :OLD_CA_VALUE'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CUSTOMER_ATTRIBUTES'
      'WHERE'
      '        CUSTOMER_ID = :OLD_CUSTOMER_ID'
      '    and O_ID = :OLD_O_ID'
      '    and CA_VALUE = :OLD_CA_VALUE'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CUSTOMER_ATTRIBUTES('
      '    CA_ID,'
      '    CUSTOMER_ID,'
      '    O_ID,'
      '    CA_VALUE,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :CA_ID,'
      '    :CUSTOMER_ID,'
      '    :O_ID,'
      '    :CA_VALUE,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'SELECT A.O_NAME, CA.*'
      'FROM CUSTOMER_ATTRIBUTES CA'
      '   INNER JOIN OBJECTS A ON (CA.O_ID = A.O_ID  and A.O_TYPE = 4)'
      'where CA.CUSTOMER_ID = :CUSTOMER_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT A.O_NAME, CA.*'
      'FROM CUSTOMER_ATTRIBUTES CA'
      '   INNER JOIN OBJECTS A ON (CA.O_ID = A.O_ID and A.O_TYPE = 4)'
      'where CA.CUSTOMER_ID = :CUSTOMER_ID')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 131
    Top = 69
  end
  object srcCustAttributes: TDataSource
    DataSet = dsCustAttributes
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
