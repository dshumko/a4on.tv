inherited ConnectTypeForm: TConnectTypeForm
  Left = 381
  Top = 171
  Caption = #1042#1080#1076' '#1082#1086#1085#1085#1077#1082#1090#1086#1088#1072
  ClientHeight = 486
  ClientWidth = 713
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter [0]
    Left = 0
    Top = 483
    Width = 713
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  inherited splPG: TSplitter
    Top = 169
    Width = 713
  end
  inherited dbGrid: TDBGridEh
    Top = 173
    Width = 713
    Height = 310
    AllowedOperations = [alopUpdateEh]
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
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 185
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_CHARFIELD'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 310
      end>
  end
  inherited tlbMain: TToolBar
    Width = 713
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
    Width = 713
    Height = 144
    ParentCtl3D = False
    object lbl2: TLabel [0]
      Left = 5
      Top = 15
      Width = 18
      Height = 13
      Caption = #1058#1080#1087
    end
    object lbl3: TLabel [1]
      Left = 5
      Top = 42
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    inherited btnSaveLink: TBitBtn
      Left = 72
      Top = 116
      Width = 528
      TabOrder = 2
    end
    inherited btnCancelLink: TBitBtn
      Left = 606
      Top = 116
      Width = 98
      Cancel = True
      TabOrder = 3
    end
    object edtName: TDBEditEh
      Left = 72
      Top = 12
      Width = 632
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1058#1080#1087' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dbmmoO_DESCRIPTION: TDBMemoEh
      Left = 72
      Top = 39
      Width = 632
      Height = 73
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1080#1087#1072
      ShowHint = True
      TabOrder = 1
      Visible = True
      WantReturns = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsType
    OnDataChange = srcDataSourceDataChange
    Left = 264
    Top = 280
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 158
    Top = 280
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
    object actAddL: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1080#1087' '#1091#1089#1090#1088#1086#1081#1089#1090#1074
      ImageIndex = 2
    end
    object actEditL: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1080#1087' '#1091#1089#1090#1088#1086#1081#1089#1090#1074
      ImageIndex = 4
    end
    object actDelL: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1080#1087' '#1091#1089#1090#1088#1086#1081#1089#1090#1074
      ImageIndex = 3
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 451
    Top = 279
  end
  inherited CnErrors: TCnErrorProvider
    Left = 352
    Top = 280
  end
  object dsType: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Objects_Iud(1, 59, :O_ID, :O_Name, :O_Descript' +
        'ion, :O_DIMENSION, 0, :O_CHARFIELD)')
    DeleteSQL.Strings = (
      'execute procedure Objects_Iud(2, 59, :OLD_O_ID)')
    InsertSQL.Strings = (
      
        'execute procedure Objects_Iud(0, 59, :O_ID, :O_Name, :O_Descript' +
        'ion, :O_DIMENSION, 0, :O_CHARFIELD)')
    RefreshSQL.Strings = (
      'select'
      '    o.O_ID'
      '    , o.O_NAME'
      '    , o.O_DESCRIPTION'
      '    , o.O_DIMENSION'
      '    , o.O_CHARFIELD '
      '  from OBJECTS o'
      '  where  O_TYPE = 59'
      '     and O_DELETED = 0'
      '     and O.O_ID = :OLD_O_ID'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    o.O_ID'
      '    , o.O_NAME'
      '    , o.O_DESCRIPTION'
      '    , o.O_DIMENSION'
      '    , o.O_CHARFIELD  '
      '  from OBJECTS o'
      '  where O_TYPE = 59'
      '        and O_DELETED = 0'
      '  order by O_NAME  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 136
    Top = 352
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
    Left = 459
    Top = 394
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
    Left = 411
    Top = 386
  end
end
