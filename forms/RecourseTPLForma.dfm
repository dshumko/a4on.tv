inherited RecoursesTPLForm: TRecoursesTPLForm
  Caption = #1058#1080#1087#1099' '#1086#1073#1088#1072#1097#1077#1085#1080#1081
  ClientHeight = 508
  ClientWidth = 758
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter [0]
    Left = 0
    Top = 328
    Width = 758
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  inherited splPG: TSplitter
    Top = 145
    Width = 758
  end
  inherited dbGrid: TDBGridEh
    Top = 149
    Width = 758
    Height = 179
    Align = alTop
    AllowedOperations = []
    TitleParams.MultiTitle = False
    OnGetCellParams = dbGridGetCellParams
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Width = 116
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 572
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DELETED'
        Footers = <>
        Title.Caption = #1059#1076#1072#1083#1077#1085#1086
        Title.TitleButton = True
        Width = 49
      end>
  end
  inherited tlbMain: TToolBar
    Width = 758
    inherited tbOk: TToolButton
      Visible = False
      OnClick = tbOkClick
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
      OnClick = tbCancelClick
    end
    inherited ToolButton20: TToolButton
      Visible = False
    end
  end
  object pnlGrid: TPanel [4]
    Left = 0
    Top = 331
    Width = 758
    Height = 177
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object dbgrdTPL: TDBGridEh
      Left = 0
      Top = 25
      Width = 758
      Height = 152
      Align = alClient
      DataSource = srcTPL
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      SearchPanel.Enabled = True
      TabOrder = 1
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
          Width = 194
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NEED_REQUEST'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1047#1072#1103#1074#1082#1072
          Width = 53
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 432
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object tlbBtns: TToolBar
      Left = 0
      Top = 0
      Width = 758
      Height = 25
      Caption = 'ToolBar1'
      Images = A4MainForm.ICONS_ACTIVE
      TabOrder = 0
      object btn5: TToolButton
        Left = 0
        Top = 0
        Width = 5
        Caption = 'ToolButton4'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object btnContentAdd: TToolButton
        Left = 5
        Top = 0
        Action = ActCONTAdd
      end
      object btn6: TToolButton
        Left = 28
        Top = 0
        Width = 4
        Caption = 'ToolButton5'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object btn2: TToolButton
        Left = 32
        Top = 0
        Action = actCONTEDIT
      end
      object btn7: TToolButton
        Left = 55
        Top = 0
        Width = 4
        Caption = 'ToolButton6'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object btn3: TToolButton
        Left = 59
        Top = 0
        Action = actCONTDEL
      end
      object btn8: TToolButton
        Left = 82
        Top = 0
        Width = 15
        Caption = 'ToolButton9'
        ImageIndex = 27
        Style = tbsSeparator
      end
      object btnOkTPL: TToolButton
        Left = 97
        Top = 0
        Caption = 'tbOk'
        Enabled = False
        ImageIndex = 25
        OnClick = btnOkTPLClick
      end
      object btn10: TToolButton
        Left = 120
        Top = 0
        Width = 4
        Caption = 'ToolButton10'
        ImageIndex = 28
        Style = tbsSeparator
      end
      object btnCancelTPL: TToolButton
        Left = 124
        Top = 0
        Caption = 'tbCancel'
        Enabled = False
        ImageIndex = 26
        OnClick = btnCancelTPLClick
      end
    end
  end
  inherited pnlEdit: TPanel
    Width = 758
    Height = 120
    object lbl2: TLabel [0]
      Left = 5
      Top = 9
      Width = 78
      Height = 13
      Caption = #1058#1080#1087' '#1086#1073#1088#1072#1097#1077#1085#1080#1103
    end
    object lbl3: TLabel [1]
      Left = 5
      Top = 37
      Width = 61
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    inherited btnSaveLink: TBitBtn
      Left = 92
      Top = 89
      Width = 562
      TabOrder = 2
    end
    inherited btnCancelLink: TBitBtn
      Left = 665
      Top = 89
      TabOrder = 4
    end
    object edtName: TDBEditEh
      Left = 92
      Top = 6
      Width = 659
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
    object mmoNotice: TDBMemoEh
      Left = 92
      Top = 34
      Width = 659
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 1
      Visible = True
      WantReturns = True
    end
    object chkDel: TDBCheckBoxEh
      Left = 5
      Top = 93
      Width = 80
      Height = 17
      Caption = #1059#1076#1072#1083#1077#1085#1086
      DataField = 'O_DELETED'
      DataSource = srcDataSource
      DynProps = <>
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsType
    OnDataChange = srcDataSourceDataChange
    Left = 509
    Top = 203
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 413
    Top = 215
    inherited actNew: TAction
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    object actTPLFilter: TAction
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 40
    end
    object ActCONTAdd: TAction
      Caption = #1076#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1076#1088#1078#1072#1085#1080#1077
      Hint = #1076#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1076#1088#1078#1072#1085#1080#1077
      ImageIndex = 2
      OnExecute = ActCONTAddExecute
    end
    object actCONTEDIT: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1086#1076#1077#1088#1078#1072#1085#1080#1077
      ImageIndex = 4
      OnExecute = actCONTEDITExecute
    end
    object actCONTDEL: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = actCONTDELExecute
    end
  end
  object dsType: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_NAME = :O_NAME,'
      '    O_DESCRIPTION = :O_DESCRIPTION,'
      '    O_DELETED = coalesce(:O_DELETED, 0)'
      'WHERE'
      '    O_ID = :OLD_O_ID and O_TYPE = 8'
      '    ')
    DeleteSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_DELETED = iif(O_DELETED = 0, 1, 0)'
      'WHERE'
      '    O_ID = :OLD_O_ID and O_TYPE = 8'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS('
      '    O_ID,'
      '    O_NAME,'
      '    O_DESCRIPTION,'
      '    O_DELETED,'
      '    O_TYPE'
      ')'
      'VALUES('
      '    :O_ID,'
      '    :O_NAME,'
      '    :O_DESCRIPTION,'
      '    0,'
      '    8'
      ')')
    RefreshSQL.Strings = (
      'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION'
      'FROM OBJECTS'
      'WHERE(  O_TYPE = 8 AND O_DELETED = 0'
      '     ) and (     OBJECTS.O_ID = :OLD_O_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION'
      'FROM OBJECTS'
      
        'WHERE O_TYPE = 8 AND ( (CURRENT_USER = '#39'SYSDBA'#39') or (O_DELETED =' +
        ' 0))'
      'order BY O_NAME')
    AutoUpdateOptions.UpdateTableName = 'OBJECTS'
    AutoUpdateOptions.KeyFields = 'O_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 69
    Top = 157
    dcForceOpen = True
  end
  object dsTPL: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE RECOURSE_TEMPLATES'
      'SET '
      '    TYPE_ID = :TYPE_ID,'
      '    NAME = :NAME,'
      '    NOTICE = :NOTICE,'
      '    NEED_REQUEST = :NEED_REQUEST'
      'WHERE'
      '    RT_ID = :OLD_RT_ID'
      '    ')
    DeleteSQL.Strings = (
      'update RECOURSE_TEMPLATES'
      'set DELETED = 1'
      'where RT_ID = :OLD_RT_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO RECOURSE_TEMPLATES('
      '    RT_ID,'
      '    TYPE_ID,'
      '    NAME,'
      '    NOTICE,'
      '    NEED_REQUEST'
      ')'
      'VALUES('
      '    :RT_ID,'
      '    :TYPE_ID,'
      '    :NAME,'
      '    :NOTICE,'
      '    :NEED_REQUEST'
      ')')
    RefreshSQL.Strings = (
      'select RT_ID, TYPE_ID, NAME, NOTICE, NEED_REQUEST'
      'from RECOURSE_TEMPLATES'
      'where RT_ID = :OLD_RT_ID'
      '        and coalesce(DELETED, 0) = 0     '
      '    ')
    SelectSQL.Strings = (
      'select'
      '    RT_ID'
      '  , TYPE_ID'
      '  , NAME'
      '  , NOTICE'
      '  , NEED_REQUEST'
      '  from RECOURSE_TEMPLATES'
      '  where TYPE_ID = :O_ID'
      '        and coalesce(DELETED, 0) = 0'
      '  order by NAME')
    BeforePost = dsTPLBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 176
    Top = 228
    dcForceOpen = True
  end
  object srcTPL: TDataSource
    DataSet = dsTPL
    OnStateChange = srcTPLStateChange
    OnDataChange = srcTPLDataChange
    Left = 341
    Top = 131
  end
end
