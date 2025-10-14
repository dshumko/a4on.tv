inherited ObjectsRAWForm: TObjectsRAWForm
  Left = 381
  Top = 171
  Caption = #1058#1072#1073#1083#1080#1094#1072' Objects '
  ClientHeight = 394
  ClientWidth = 585
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 233
    Width = 585
  end
  inherited dbGrid: TDBGridEh
    Top = 237
    Width = 585
    Height = 157
    AllowedOperations = [alopUpdateEh]
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'OT_NAME'
        Footers = <>
        Title.TitleButton = True
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.TitleButton = True
        Title.SortIndex = 2
        Title.SortMarker = smUpEh
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DELETED'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DIMENSION'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_CHARFIELD'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NUMERICFIELD'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DATEFIELD'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DATEEND'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_CHECK'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_BY'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_ON'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_BY'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_ON'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_ID'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_TYPE'
        Footers = <>
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 585
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
    Width = 585
    Height = 208
    ParentCtl3D = False
    inherited btnSaveLink: TBitBtn
      Left = 5
      Top = 175
      Width = 467
      TabOrder = 10
    end
    inherited btnCancelLink: TBitBtn
      Left = 478
      Top = 175
      Width = 98
      Cancel = True
      TabOrder = 11
    end
    object edtName: TDBEditEh
      Left = 216
      Top = 7
      Width = 360
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object dbmmoO_DESCRIPTION: TDBMemoEh
      Left = 5
      Top = 105
      Width = 571
      Height = 66
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 9
      Visible = True
      WantReturns = True
    end
    object lcbObjType: TDBLookupComboboxEh
      Left = 5
      Top = 7
      Width = 205
      Height = 21
      DynProps = <>
      DataField = 'O_TYPE'
      DataSource = srcDataSource
      DropDownBox.Columns = <
        item
          FieldName = 'OT_NAME'
          Width = 60
        end
        item
          FieldName = 'OT_DESCRIPTION'
          Width = 70
        end>
      DropDownBox.ListSource = srcObjType
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1058#1080#1087' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      EditButtons = <>
      KeyField = 'OT_ID'
      ListField = 'OT_NAME'
      ListSource = srcObjType
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
    end
    object edtO_Check: TDBEditEh
      Left = 5
      Top = 31
      Width = 571
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_Check'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'O_Check'
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object edtO_Charfield: TDBEditEh
      Left = 5
      Top = 56
      Width = 571
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_Charfield'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'O_Charfield'
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object ednO_Numericfield: TDBNumberEditEh
      Left = 233
      Top = 80
      Width = 105
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'O_Numericfield'
      DataSource = srcDataSource
      DecimalPlaces = 3
      DynProps = <>
      EmptyDataInfo.Text = 'O_Numericfield'
      EditButtons = <>
      ShowHint = True
      TabOrder = 6
      Visible = True
    end
    object chkO_Deleted: TDBCheckBoxEh
      Left = 152
      Top = 82
      Width = 75
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'O_Deleted'
      DataField = 'O_Deleted'
      DataSource = srcDataSource
      DynProps = <>
      TabOrder = 5
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object edO_Datefield: TDBDateTimeEditEh
      Left = 344
      Top = 80
      Width = 114
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'O_Datefield'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'O_Datefield'
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 7
      Visible = True
    end
    object edtO_Charfield1: TDBEditEh
      Left = 5
      Top = 80
      Width = 141
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_Dimension'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'O_Dimension'
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
    object edO_Dateend: TDBDateTimeEditEh
      Left = 464
      Top = 80
      Width = 112
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'O_DATEEND'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'O_Dateend'
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 8
      Visible = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsObjects
    OnDataChange = srcDataSourceDataChange
    Left = 160
    Top = 256
  end
  inherited actions: TActionList
    Left = 150
    Top = 288
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
  end
  inherited pmPopUp: TPopupMenu
    Left = 443
    Top = 287
  end
  inherited CnErrors: TCnErrorProvider
    Left = 344
    Top = 288
  end
  object dsObjects: TpFIBDataSet
    UpdateSQL.Strings = (
      'update Objects'
      'set O_Name = :O_Name,'
      '    O_Description = :O_Description,'
      '    O_Deleted = :O_Deleted,'
      '    O_Dimension = :O_Dimension,'
      '    O_Charfield = :O_Charfield,'
      '    O_Numericfield = :O_Numericfield,'
      '    O_Datefield = :O_Datefield,'
      '    O_Dateend = :O_Dateend,'
      '    O_Check = :O_Check'
      'where (O_Id = :OLD_O_Id)'
      '      and (O_Type = :OLD_O_Type)')
    DeleteSQL.Strings = (
      'update Objects'
      'set O_Deleted = 1'
      'where (O_Id = :O_Id)'
      '      and (O_Type = :O_Type)')
    InsertSQL.Strings = (
      
        'insert into Objects (O_Id, O_Type, O_Name, O_Description, O_Dele' +
        'ted, O_Dimension, O_Charfield, O_Numericfield, O_Datefield, O_Da' +
        'teend, O_Check)'
      
        'values (:O_Id, :O_Type, :O_Name, :O_Description, :O_Deleted, :O_' +
        'Dimension, :O_Charfield, :O_Numericfield, :O_Datefield, :O_Datee' +
        'nd, :O_Check)')
    RefreshSQL.Strings = (
      'select'
      '    ot.Ot_Name'
      '  , O.O_Type'
      '  , O.O_Name'
      '  , O.O_Description'
      '  , O.O_Deleted'
      '  , O.O_Dimension'
      '  , O.O_Charfield'
      '  , O.O_Numericfield'
      '  , O.O_Datefield'
      '  , O.O_Dateend'
      '  , O.O_Check'
      '  , O.Added_By'
      '  , O.Added_On'
      '  , O.Edit_By'
      '  , O.Edit_On'
      '  , O.O_Id'
      '  from OBJECTS o'
      '       inner join Objects_Type ot on (ot.Ot_Id = o.O_Type)'
      'where (O_Id = :OLD_O_Id)'
      '      and (O_Type = :OLD_O_Type)'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    ot.Ot_Name'
      '  , O.O_Type'
      '  , O.O_Name'
      '  , O.O_Description'
      '  , O.O_Deleted'
      '  , O.O_Dimension'
      '  , O.O_Charfield'
      '  , O.O_Numericfield'
      '  , O.O_Datefield'
      '  , O.O_Dateend'
      '  , O.O_Check'
      '  , O.Added_By'
      '  , O.Added_On'
      '  , O.Edit_By'
      '  , O.Edit_On'
      '  , O.O_Id  '
      '  from OBJECTS o'
      '       inner join Objects_Type ot on (ot.Ot_Id = o.O_Type)'
      '  order by ot.Ot_Name, o.O_NAME')
    AutoUpdateOptions.UpdateTableName = 'OBJECTS'
    AutoUpdateOptions.KeyFields = 'O_Id'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 48
    Top = 296
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 40
    Top = 310
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write')
    TPBMode = tpbDefault
    Left = 97
    Top = 304
  end
  object dsObjType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    Ot_Id'
      '  , Ot_Name'
      '  , Ot_Description'
      '  from Objects_Type'
      '  order by Ot_name')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 261
    Top = 270
  end
  object srcObjType: TDataSource
    AutoEdit = False
    DataSet = dsObjType
    Left = 261
    Top = 326
  end
end
