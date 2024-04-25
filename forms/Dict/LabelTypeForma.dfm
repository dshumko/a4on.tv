inherited LabelTypeForm: TLabelTypeForm
  Left = 381
  Top = 171
  Caption = #1058#1080#1087' '#1084#1072#1088#1082#1080#1088#1086#1074#1082#1080' '#1083#1080#1085#1080#1081' '#1089#1074#1103#1079#1080
  ClientHeight = 550
  ClientWidth = 939
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 193
    Width = 939
  end
  inherited dbGrid: TDBGridEh
    Top = 197
    Width = 939
    Height = 353
    AllowedOperations = [alopUpdateEh]
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 136
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_CHARFIELD'
        Footers = <>
        Title.Caption = #1052#1077#1090#1082#1080
        Title.TitleButton = True
        Width = 393
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 297
      end>
  end
  inherited tlbMain: TToolBar
    Width = 939
    inherited ToolButton5: TToolButton
      Visible = False
    end
    inherited ToolButton6: TToolButton
      Visible = False
    end
    inherited btnDelete: TToolButton
      Visible = False
    end
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
    Width = 939
    Height = 168
    ParentCtl3D = False
    inherited btnSaveLink: TBitBtn
      Left = 16
      Top = 139
      Width = 810
      TabOrder = 3
    end
    inherited btnCancelLink: TBitBtn
      Left = 832
      Top = 139
      Width = 98
      Cancel = True
      TabOrder = 4
    end
    object edtName: TDBEditEh
      Left = 16
      Top = 6
      Width = 914
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1080#1087#1072' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dbmmoO_DESCRIPTION: TDBMemoEh
      Left = 576
      Top = 33
      Width = 354
      Height = 102
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 2
      Visible = True
      WantReturns = True
    end
    object mmoLabels: TDBMemoEh
      Left = 16
      Top = 33
      Width = 554
      Height = 102
      ScrollBars = ssVertical
      Anchors = [akLeft, akTop, akBottom]
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1057#1087#1080#1089#1086#1082' '#1084#1077#1090#1086#1082'. '#1054#1076#1085#1072' '#1084#1077#1090#1082#1072' '#1074' '#1089#1090#1088#1086#1082#1077' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 1
      Visible = True
      WantReturns = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsData
    OnDataChange = srcDataSourceDataChange
    Left = 184
    Top = 376
  end
  inherited actions: TActionList
    Left = 86
    Top = 392
    inherited actNew: TAction
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 395
    Top = 407
  end
  inherited CnErrors: TCnErrorProvider
    Left = 304
    Top = 408
  end
  object dsData: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'EXECUTE PROCEDURE ATTRIBUTES_IUD(:O_ID, :O_NAME, :O_DESCRIPTION,' +
        ' :O_DIMENSION, :O_DELETED, :O_CHARFIELD, :O_CHECK, 1, 62, :O_Num' +
        'ericfield)')
    DeleteSQL.Strings = (
      
        'EXECUTE PROCEDURE ATTRIBUTES_IUD(:O_ID, null, null, null, :O_DEL' +
        'ETED, null, null, 2, 62, null)')
    InsertSQL.Strings = (
      
        'EXECUTE PROCEDURE ATTRIBUTES_IUD(:O_ID, :O_NAME, :O_DESCRIPTION,' +
        ' :O_DIMENSION, :O_DELETED, :O_CHARFIELD, :O_CHECK, 0, 62, :O_Num' +
        'ericfield)')
    RefreshSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , o.O_NAME'
      '  , o.O_DESCRIPTION'
      '  , o.O_DELETED'
      '  , o.O_DIMENSION'
      '  , o.O_CHARFIELD'
      '  , o.O_CHECK'
      '  , cast(o.O_Numericfield as INTEGER) O_Numericfield'
      '  , o.O_TYPE'
      '  from OBJECTS o'
      '  where (O.O_TYPE = 62)'
      '        and (O.O_ID = :OLD_O_ID)')
    SelectSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , o.O_TYPE'
      '  , o.O_NAME'
      '  , o.O_DESCRIPTION'
      '  , o.O_DELETED'
      '  , o.O_DIMENSION'
      '  , o.O_CHARFIELD'
      '  , o.O_CHECK'
      
        '  , cast(coalesce(o.O_Numericfield,0) as INTEGER) O_Numericfield' +
        '  -- '#1091#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
      '  , o.O_TYPE'
      '  from OBJECTS o'
      '  where O_TYPE = 62'
      '  order by O_NAME  ')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 144
    Top = 136
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
    Left = 200
    Top = 190
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
    Left = 312
    Top = 188
  end
end
