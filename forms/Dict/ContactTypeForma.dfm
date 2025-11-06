inherited ContactTypeForm: TContactTypeForm
  Left = 381
  Top = 171
  Caption = #1058#1080#1087' '#1082#1086#1085#1090#1072#1082#1090#1086#1074' '#1072#1073#1086#1085#1077#1085#1090#1072
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
        Title.Caption = #1050#1086#1085#1090#1072#1082#1090
        Title.TitleButton = True
        Width = 136
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
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_CHECK'
        Footers = <>
        Title.Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1079#1085#1072#1095#1077#1085#1080#1103
        Title.TitleButton = True
        Width = 144
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DIMENSION'
        Footers = <>
        Title.Caption = #1057#1083#1091#1078#1077#1073#1085#1099#1081' '#1090#1077#1082#1089#1090
        Title.TitleButton = True
        Width = 162
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DELETED'
        Footers = <>
        Title.Caption = #1057#1082#1088#1099#1090#1100
        Title.TitleButton = True
        Width = 84
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
    object lbl2: TLabel [0]
      Left = 5
      Top = 9
      Width = 43
      Height = 13
      Caption = #1050#1086#1085#1090#1072#1082#1090
    end
    object lbl3: TLabel [1]
      Left = 5
      Top = 64
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object lbl4: TLabel [2]
      Left = 3
      Top = 37
      Width = 49
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072
    end
    inherited btnSaveLink: TBitBtn
      Left = 72
      Top = 135
      Width = 754
      TabOrder = 4
    end
    inherited btnCancelLink: TBitBtn
      Left = 832
      Top = 135
      Width = 98
      Cancel = True
      TabOrder = 5
    end
    object edtName: TDBEditEh
      Left = 72
      Top = 6
      Width = 858
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1050#1086#1085#1090#1072#1082#1090' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dbmmoO_DESCRIPTION: TDBMemoEh
      Left = 72
      Top = 61
      Width = 858
      Height = 68
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1082#1086#1085#1090#1072#1082#1090#1072
      ShowHint = True
      TabOrder = 3
      Visible = True
      WantReturns = True
    end
    object cbRegular: TDBComboBoxEh
      Left = 72
      Top = 34
      Width = 689
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_CHECK'
      DataSource = srcDataSource
      DynProps = <>
      DropDownBox.Rows = 15
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1056#1077#1075#1091#1083#1103#1088#1085#1086#1077' '#1074#1099#1088#1072#1078#1077#1085#1080#1077' '#1076#1083#1103' '#1087#1088#1086#1074#1077#1088#1082#1080' '#1079#1085#1072#1095#1077#1085#1080#1103
      EditButtons = <>
      Items.Strings = (
        ''
        #1062#1080#1092#1088#1099
        #1058#1077#1083#1077#1092#1086#1085
        #1045'. '#1087#1086#1095#1090#1072' (email)'
        #1044#1086#1084#1077#1085' ('#1085#1072#1087#1088#1080#1084#1077#1088' a4on.tv)'
        #1053#1072#1073#1086#1088' '#1080#1079' '#1073#1091#1082#1074' '#1080' '#1094#1080#1092#1088)
      KeyItems.Strings = (
        ''
        '\d+'
        '(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){10,14}(\s*)'
        
          '[a-zA-Z'#1072'-'#1103#1040'-'#1071'0-9._%+-]+@[a-zA-Z'#1072'-'#1103#1040'-'#1071'0-9.-]+\.[a-zA-Z'#1072'-'#1103#1040'-'#1071'0-9]{' +
          '2,}'
        
          '((25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(25[0-5]|2[0-4]\d|[01]?\d\d?' +
          ')'
        '['#1072'-'#1103#1040'-'#1071#1105#1025'a-zA-Z0-9]+')
      LimitTextToListValues = False
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnKeyDown = cbRegularKeyDown
      OnNotInList = cbRegularNotInList
    end
    object chkUniq: TDBCheckBoxEh
      Left = 780
      Top = 36
      Width = 150
      Height = 17
      Hint = #1055#1088#1080' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1080' '#1086#1073#1098#1077#1082#1090#1091' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072' '#1076#1086#1083#1078#1085#1086' '#1073#1099#1090#1100' '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1084
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1057#1082#1088#1099#1090#1100' '#1086#1090' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      DataField = 'O_DELETED'
      DataSource = srcDataSource
      DynProps = <>
      TabOrder = 2
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsContactType
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
  object dsContactType: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'EXECUTE PROCEDURE ATTRIBUTES_IUD(:O_ID, :O_NAME, :O_DESCRIPTION,' +
        ' :O_DIMENSION, :O_DELETED, :O_CHARFIELD, :O_CHECK, 1, 45, :O_Num' +
        'ericfield)')
    DeleteSQL.Strings = (
      
        'EXECUTE PROCEDURE ATTRIBUTES_IUD(:O_ID, null, null, null, :O_DEL' +
        'ETED, null, null, 2, 45, null)')
    InsertSQL.Strings = (
      
        'EXECUTE PROCEDURE ATTRIBUTES_IUD(:O_ID, :O_NAME, :O_DESCRIPTION,' +
        ' :O_DIMENSION, :O_DELETED, :O_CHARFIELD, :O_CHECK, 0, 45, :O_Num' +
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
      '  where (O.O_TYPE = 45)'
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
      '  where O_TYPE = 45'
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
