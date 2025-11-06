inherited TimeSeriesForm: TTimeSeriesForm
  Caption = #1061#1088#1086#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1077' '#1076#1072#1085#1085#1099#1077
  ClientHeight = 513
  ClientWidth = 777
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 129
    Width = 777
  end
  object spl1: TSplitter [1]
    Left = 476
    Top = 133
    Width = 4
    Height = 380
  end
  inherited dbGrid: TDBGridEh
    Top = 133
    Width = 476
    Height = 380
    Align = alLeft
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1061#1088#1086#1085#1086#1083#1086#1075#1080#1103
        Width = 169
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Width = 288
      end>
  end
  inherited tlbMain: TToolBar
    Width = 777
  end
  inherited pnlEdit: TPanel
    Width = 777
    Height = 104
    object lbl2: TLabel [0]
      Left = 5
      Top = 9
      Width = 85
      Height = 13
      Caption = #1061#1088#1086#1085#1086#1083#1086#1075#1080#1103' '#1095#1077#1075#1086
    end
    inherited btnSaveLink: TBitBtn
      Top = 76
      Width = 591
    end
    inherited btnCancelLink: TBitBtn
      Left = 682
      Top = 76
    end
    object edtName: TDBEditEh
      Left = 97
      Top = 4
      Width = 671
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object mmoO_DESCRIPTION: TDBMemoEh
      Left = 5
      Top = 31
      Width = 763
      Height = 39
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1093#1088#1086#1085#1086#1083#1086#1075#1080#1095#1077#1089#1082#1080#1093' '#1076#1072#1085#1085#1099#1093
      ShowHint = True
      TabOrder = 3
      Visible = True
      WantReturns = True
    end
  end
  object pnlValues: TPanel [5]
    Left = 480
    Top = 133
    Width = 297
    Height = 380
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object pnlVTop: TPanel
      Left = 0
      Top = 0
      Width = 297
      Height = 33
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        297
        33)
      object btnAdd1: TSpeedButton
        Left = 6
        Top = 6
        Width = 22
        Height = 22
        Action = actVAdd
        Flat = True
      end
      object btnEdit1: TSpeedButton
        Left = 42
        Top = 5
        Width = 22
        Height = 22
        Action = actVEdit
        Flat = True
      end
      object btnDel1: TSpeedButton
        Left = 272
        Top = 6
        Width = 22
        Height = 22
        Action = actVdel
        Anchors = [akTop, akRight, akBottom]
        Flat = True
        Layout = blGlyphTop
      end
    end
    object dbgValues: TDBGridEh
      Left = 0
      Top = 33
      Width = 297
      Height = 347
      Align = alClient
      DataSource = srcValues
      DynProps = <>
      Flat = True
      TabOrder = 1
      TitleParams.MultiTitle = True
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'HDATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Width = 54
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NVALUE'
          Footers = <>
          Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
          Width = 68
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 110
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsSeries
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    inherited actNew: TAction
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    object actVAdd: TAction
      ImageIndex = 2
      OnExecute = actVAddExecute
    end
    object actVEdit: TAction
      ImageIndex = 4
      OnExecute = actVEditExecute
    end
    object actVdel: TAction
      ImageIndex = 3
      OnExecute = actVdelExecute
    end
  end
  inherited CnErrors: TCnErrorProvider
    Left = 104
    Top = 272
  end
  object dsSeries: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'EXECUTE PROCEDURE ATTRIBUTES_IUD(:O_ID, :O_NAME, :O_DESCRIPTION,' +
        ' :O_DIMENSION, :O_DELETED, :O_CHARFIELD, :O_CHECK, 1, 78, :O_Num' +
        'ericfield)')
    DeleteSQL.Strings = (
      
        'EXECUTE PROCEDURE ATTRIBUTES_IUD(:O_ID, null, null, null, :O_DEL' +
        'ETED, null, null, 2, 78, null)')
    InsertSQL.Strings = (
      
        'EXECUTE PROCEDURE ATTRIBUTES_IUD(:O_ID, :O_NAME, :O_DESCRIPTION,' +
        ' :O_DIMENSION, :O_DELETED, :O_CHARFIELD, :O_CHECK, 0, 78, :O_Num' +
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
      '  , o.O_Numericfield'
      '  , o.O_TYPE'
      '  from OBJECTS o'
      '  where O.O_TYPE = 78'
      '        and (O.O_ID = :OLD_O_ID)')
    SelectSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , o.O_NAME'
      '  , o.O_DESCRIPTION'
      '  , o.O_DELETED'
      '  , o.O_DIMENSION'
      '  , o.O_CHARFIELD'
      '  , o.O_CHECK'
      '  , o.O_Numericfield'
      '  , o.O_TYPE'
      '  from OBJECTS o'
      '  where O.O_TYPE = 78'
      '        and O.O_DELETED = 0'
      '  order by O_NAME  ')
    AutoUpdateOptions.UpdateTableName = 'OBJECTS'
    AutoUpdateOptions.KeyFields = 'O_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
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
  object dsValues: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OBJECTS_HISTORY'
      'SET '
      '    O_ID = :O_ID,'
      '    O_TYPE = 78,'
      '    HDATE = :HDATE,'
      '    CVALUE = :CVALUE,'
      '    DVALUE = :DVALUE,'
      '    NOTICE = :NOTICE,'
      '    DELETED = :DELETED,'
      '    NVALUE = :NVALUE'
      'WHERE'
      '    HID = :OLD_HID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    OBJECTS_HISTORY'
      'WHERE'
      '        HID = :OLD_HID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS_HISTORY('
      '    O_ID,'
      '    O_TYPE,'
      '    HDATE,'
      '    CVALUE,'
      '    DVALUE,'
      '    NOTICE,'
      '    DELETED,'
      '    NVALUE'
      ')'
      'VALUES('
      '    :O_ID,'
      '    78,'
      '    :HDATE,'
      '    :CVALUE,'
      '    :DVALUE,'
      '    :NOTICE,'
      '    :DELETED,'
      '    :NVALUE'
      ')'
      'RETURNING HID')
    RefreshSQL.Strings = (
      'select'
      '  qh.*'
      '  from Objects_History qh'
      '  where(  qh.O_Type = 78'
      '        and qh.O_Id = :O_Id'
      '     ) and (     QH.HID = :OLD_HID'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '  qh.*'
      '  from Objects_History qh'
      '  where qh.O_Type = 78'
      '        and qh.O_Id = :O_Id'
      '  order by qh.Hdate desc  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 370
    Top = 260
    WaitEndMasterScroll = True
    oFetchAll = True
  end
  object srcValues: TDataSource
    AutoEdit = False
    DataSet = dsValues
    Left = 378
    Top = 316
  end
end
