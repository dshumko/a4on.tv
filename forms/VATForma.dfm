inherited VATForm: TVATForm
  Caption = #1043#1088#1091#1087#1087#1099' '#1053#1044#1057
  ClientHeight = 490
  ClientWidth = 629
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 145
    Width = 629
  end
  inherited dbGrid: TDBGridEh
    Top = 148
    Width = 629
    Height = 112
    Align = alTop
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_ID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_TYPE'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1043#1088#1091#1087#1087#1072' '#1053#1044#1057
        Width = 174
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 389
      end>
  end
  object pnlTarif: TPanel [2]
    Left = 0
    Top = 260
    Width = 629
    Height = 230
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object lbl1: TLabel
      Left = 0
      Top = 0
      Width = 629
      Height = 13
      Align = alTop
      Caption = ' '#1058#1072#1088#1080#1092
    end
    object dbgTarif: TDBGridEh
      Left = 27
      Top = 13
      Width = 602
      Height = 217
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataSource = srcTarif
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
      SortLocal = True
      TabOrder = 1
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATE_FROM'
          Footers = <>
          Title.Caption = #1057' '#1076#1072#1090#1099
          Width = 107
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATE_TO'
          Footers = <>
          Title.Caption = #1055#1086' '#1076#1072#1090#1091
          Width = 93
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'TARIF_SUM'
          Footers = <>
          Title.Caption = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057' %'
          Width = 149
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EDIT_BY'
          Footers = <>
          Title.Caption = #1050#1090#1086
          Width = 81
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EDIT_ON'
          Footers = <>
          Title.Caption = #1050#1086#1075#1076#1072
          Width = 88
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object tlbTarif: TToolBar
      Left = 0
      Top = 13
      Width = 27
      Height = 217
      Align = alLeft
      Caption = 'ToolBar1'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Images = A4MainForm.ICONS_ACTIVE
      TabOrder = 0
      object btnTarifAdd: TToolButton
        Left = 0
        Top = 0
        Action = actTarifADD
        Wrap = True
      end
      object btnTarifDel: TToolButton
        Left = 0
        Top = 22
        Action = actTarifDEL
      end
    end
  end
  inherited tlbMain: TToolBar
    Width = 629
    inherited ToolButton9: TToolButton
      Visible = False
    end
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
    end
  end
  inherited pnlEdit: TPanel
    Width = 629
    Height = 120
    object lbl2: TLabel [0]
      Left = 5
      Top = 9
      Width = 61
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072' '#1053#1044#1057
    end
    object lbl3: TLabel [1]
      Left = 5
      Top = 35
      Width = 61
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    inherited btnSaveLink: TBitBtn
      Left = 90
      Top = 89
      Width = 438
      TabOrder = 2
    end
    inherited btnCancelLink: TBitBtn
      Left = 534
      Top = 89
      Cancel = True
      TabOrder = 3
    end
    object edtName: TDBEditEh
      Left = 90
      Top = 6
      Width = 530
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1043#1088#1091#1087#1087#1072' '#1053#1044#1057' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dbmmo1: TDBMemoEh
      Left = 90
      Top = 32
      Width = 530
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 1
      Visible = True
      WantReturns = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsVATs
    OnDataChange = srcDataSourceDataChange
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 166
    Top = 136
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actEditExecute
    end
    object actTarifADD: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1072#1088#1080#1092
      ImageIndex = 2
      OnExecute = actTarifADDExecute
    end
    object actTarifDEL: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1072#1088#1080#1092
      ImageIndex = 3
      OnExecute = actTarifDELExecute
    end
  end
  inherited CnErrors: TCnErrorProvider
    Left = 24
    Top = 96
  end
  object dsVATs: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_NAME = :O_NAME,'
      '    O_DESCRIPTION = :O_DESCRIPTION'
      'WHERE'
      '    O_ID = :OLD_O_ID'
      '    and O_TYPE = 13'
      '    ')
    DeleteSQL.Strings = (
      'update'
      '    OBJECTS'
      'SET'
      '  O_DELETED = 1'
      'WHERE'
      '        O_ID = :OLD_O_ID'
      '    and O_TYPE = 13'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS('
      '    O_ID,'
      '    O_TYPE,'
      '    O_NAME,'
      '    O_DESCRIPTION'
      ')'
      'VALUES('
      '    :O_ID,'
      '    13,'
      '    :O_NAME,'
      '    :O_DESCRIPTION'
      ')')
    RefreshSQL.Strings = (
      'select O_ID, O_TYPE, O_NAME, O_DESCRIPTION '
      'from OBJECTS WHERE(  O_TYPE = 13 and O_DELETED = 0'
      '     ) and (     OBJECTS.O_ID = :OLD_O_ID'
      '    and OBJECTS.O_TYPE = 13'
      '     )'
      '     ')
    SelectSQL.Strings = (
      'select O_ID, O_TYPE, O_NAME, O_DESCRIPTION '
      'from OBJECTS WHERE O_TYPE = 13 and O_DELETED = 0 ORDER BY O_NAME')
    AutoUpdateOptions.UpdateTableName = 'OBJECTS'
    AutoUpdateOptions.KeyFields = 'O_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 293
    Top = 41
  end
  object dsTarif: TpFIBDataSet
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE TARIF_IUD('
      '  :TARIF_ID, '
      '  :SERVICE_ID, '
      '  :DATE_FROM, '
      '  :DATE_TO, '
      '  :TARIF_SUM, 0, '
      '  2)'
      '    ')
    RefreshSQL.Strings = (
      'SELECT t.*'
      'FROM TARIF t'
      'where  T.TARIF_ID = :OLD_TARIF_ID    '
      'order by t.DATE_FROM, t.DATE_TO')
    SelectSQL.Strings = (
      'SELECT t.*'
      'FROM TARIF t'
      'where t.SERVICE_ID = :O_ID'
      'order by t.DATE_FROM, t.DATE_TO')
    AutoUpdateOptions.UpdateTableName = 'TARIF'
    AutoUpdateOptions.KeyFields = 'TARIF_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 83
    Top = 217
    oFetchAll = True
  end
  object srcTarif: TDataSource
    AutoEdit = False
    DataSet = dsTarif
    OnDataChange = srcTarifDataChange
    Left = 99
    Top = 225
  end
end
