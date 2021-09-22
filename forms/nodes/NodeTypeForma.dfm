inherited NodeTypeForm: TNodeTypeForm
  Left = 381
  Top = 171
  Caption = #1058#1080#1087#1099' '#1091#1079#1083#1086#1074
  ClientHeight = 486
  ClientWidth = 713
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter [0]
    Left = 0
    Top = 261
    Width = 713
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  inherited dbGrid: TDBGridEh
    Top = 169
    Width = 713
    Height = 92
    AllowedOperations = [alopUpdateEh]
    OnGetCellParams = dbGridGetCellParams
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
        Width = 167
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_CHARFIELD'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Title.TitleButton = True
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
      Top = 70
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object lbl1: TLabel [2]
      Left = 580
      Top = 14
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1050#1086#1076
    end
    inherited btnSaveLink: TBitBtn
      Left = 72
      Top = 116
      Width = 528
      TabOrder = 4
    end
    inherited btnCancelLink: TBitBtn
      Left = 606
      Top = 116
      Width = 98
      Cancel = True
      TabOrder = 5
    end
    object edtName: TDBEditEh
      Left = 72
      Top = 12
      Width = 502
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
      Top = 67
      Width = 632
      Height = 45
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1080#1087#1072
      ShowHint = True
      TabOrder = 3
      Visible = True
      WantReturns = True
    end
    object edtO_DIMENSION: TDBEditEh
      Left = 606
      Top = 11
      Width = 92
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'O_CHARFIELD'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1050#1086#1076
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object btnColorSet: TButtonColor
      Left = 72
      Top = 38
      Width = 502
      Anchors = [akLeft, akTop, akRight]
      Caption = #1062#1074#1077#1090' '#1075#1088#1091#1087#1087#1099
      TabOrder = 2
      OnClick = btnColorSetClick
    end
    object btnColorClear: TButton
      Left = 606
      Top = 38
      Width = 98
      Height = 25
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1086#1085' '#1076#1083#1103' '#1074#1099#1076#1077#1083#1077#1085#1080#1103' '#1072#1073#1086#1085#1077#1085#1090#1072
      Anchors = [akTop, akRight]
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1086#1085
      TabOrder = 6
      TabStop = False
      OnClick = btnColorClearClick
    end
  end
  object pnlBottom: TPanel [4]
    Left = 0
    Top = 264
    Width = 713
    Height = 222
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object lbl4: TLabel
      Left = 0
      Top = 0
      Width = 713
      Height = 13
      Align = alTop
      Caption = ' '#1050#1086#1084#1087#1086#1085#1086#1074#1082#1072' '#1091#1079#1083#1086#1074' '#1076#1072#1085#1085#1086#1075#1086' '#1090#1080#1087#1072
    end
    object dbgLayout: TDBGridEh
      Left = 28
      Top = 13
      Width = 685
      Height = 209
      Align = alClient
      DataSource = srcLayout
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      SearchPanel.Enabled = True
      SearchPanel.FilterOnTyping = True
      SumList.Active = True
      TabOrder = 0
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'O_NAME'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1084#1072#1090#1077#1088#1080#1072#1083#1072' / '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
          Title.TitleButton = True
          Width = 188
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DEV_CNT'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.TitleButton = True
          Width = 66
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 175
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object pnlBottLeft: TPanel
      Left = 0
      Top = 13
      Width = 28
      Height = 209
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        28
        209)
      object btnAddL: TSpeedButton
        Left = 2
        Top = 6
        Width = 23
        Height = 22
        Action = actAddL
        Flat = True
      end
      object btnEditL: TSpeedButton
        Left = 2
        Top = 34
        Width = 23
        Height = 22
        Action = actEditL
        Flat = True
      end
      object btnDelL: TSpeedButton
        Left = 2
        Top = 185
        Width = 23
        Height = 22
        Action = actDelL
        Anchors = [akLeft, akBottom]
        Flat = True
      end
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsFileType
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
      OnExecute = actAddLExecute
    end
    object actEditL: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1080#1087' '#1091#1089#1090#1088#1086#1081#1089#1090#1074
      ImageIndex = 4
      OnExecute = actEditLExecute
    end
    object actDelL: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1090#1080#1087' '#1091#1089#1090#1088#1086#1081#1089#1090#1074
      ImageIndex = 3
      OnExecute = actDelLExecute
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
  object dsFileType: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Objects_Iud(1, 38, :O_ID, :O_Name, :O_Descript' +
        'ion, :O_DIMENSION, 0, :O_CHARFIELD)')
    DeleteSQL.Strings = (
      'execute procedure Objects_Iud(2, 38, :OLD_O_ID)')
    InsertSQL.Strings = (
      
        'execute procedure Objects_Iud(0, 38, :O_ID, :O_Name, :O_Descript' +
        'ion, :O_DIMENSION, 0, :O_CHARFIELD)')
    RefreshSQL.Strings = (
      'select'
      '    o.O_ID'
      '    , o.O_NAME'
      '    , o.O_DESCRIPTION'
      '    , o.O_DIMENSION'
      '    , o.O_CHARFIELD      '
      '  from OBJECTS o'
      '  where  O_TYPE = 38'
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
      
        '    , (-1*o.O_ID) NODE_ID -- '#1093#1080#1090#1088#1086' '#1093#1088#1072#1085#1080#1084' '#1089#1093#1077#1084#1099' '#1076#1083#1103' '#1090#1080#1087#1086#1074' '#1089' '#1084#1080#1085#1091 +
        #1089#1086#1084'  '
      '  from OBJECTS o'
      '  where O_TYPE = 38'
      '        and O_DELETED = 0'
      '  order by O_NAME  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 56
    Top = 272
  end
  object srcLayout: TDataSource
    AutoEdit = False
    DataSet = dsLayout
    OnStateChange = srcLayoutStateChange
    OnDataChange = srcLayoutDataChange
    Left = 304
    Top = 400
  end
  object dsLayout: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE NODE_LAYOUT'
      'SET '
      '    NODE_ID = :NODE_ID,'
      '    M_TYPE = :M_TYPE,'
      '    DEV_CNT = :DEV_CNT,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    NODE_ID = :OLD_NODE_ID'
      '    and M_TYPE = :OLD_M_TYPE'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    NODE_LAYOUT'
      'WHERE'
      '        NODE_ID = :OLD_NODE_ID'
      '    and M_TYPE = :OLD_M_TYPE'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO NODE_LAYOUT('
      '    NODE_ID,'
      '    M_TYPE,'
      '    DEV_CNT,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :NODE_ID,'
      '    :M_TYPE,'
      '    :DEV_CNT,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    A.O_NAME'
      '  , CA.*'
      '  from Node_Layout CA'
      '       inner join OBJECTS A on (CA.M_TYPE = A.O_ID and'
      '             A.O_TYPE = 48)'
      '  where (     CA.NODE_ID = :NODE_ID'
      '    and CA.M_TYPE = :OLD_M_TYPE'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    A.O_NAME'
      '  , CA.*'
      '  from Node_Layout CA'
      '       inner join OBJECTS A on (CA.M_TYPE = A.O_ID and'
      '             A.O_TYPE = 48)'
      '  where CA.Node_Id = :NODE_ID')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 107
    Top = 413
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
