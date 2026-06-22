inherited RecoursesTPLForm: TRecoursesTPLForm
  Caption = #1058#1080#1087#1099' '#1086#1073#1088#1072#1097#1077#1085#1080#1081' / '#1079#1074#1086#1085#1082#1086#1074
  ClientHeight = 699
  ClientWidth = 764
  StyleElements = [seFont, seClient, seBorder]
  ExplicitWidth = 780
  ExplicitHeight = 738
  TextHeight = 13
  object spl1: TSplitter [0]
    Left = 0
    Top = 460
    Width = 764
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitTop = 328
    ExplicitWidth = 758
  end
  inherited splPG: TSplitter
    Top = 277
    Width = 764
    ExplicitTop = 145
    ExplicitWidth = 758
  end
  inherited dbGrid: TDBGridEh
    Top = 281
    Width = 764
    Height = 179
    Align = alTop
    AllowedOperations = []
    OnGetCellParams = dbGridGetCellParams
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 116
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_CHARFIELD'
        Footers = <>
        Title.Caption = #1044#1086#1087'. '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
        Title.TitleButton = True
        Width = 110
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 390
      end
      item
        Alignment = taLeftJustify
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DIRECT'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1'
          '-1')
        PickList.Strings = (
          #1042#1093'.'
          #1048#1089#1093'.'
          #1042#1089#1077)
        Title.Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
        Title.TitleButton = True
        Width = 74
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
    Width = 764
    ExplicitWidth = 764
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
  inherited pnlEdit: TPanel
    Width = 764
    Height = 252
    StyleElements = [seFont, seClient, seBorder]
    ExplicitWidth = 764
    ExplicitHeight = 252
    object spl2: TSplitter [0]
      Left = 0
      Top = 114
      Width = 764
      Height = 3
      Cursor = crVSplit
      Align = alTop
      ExplicitTop = 145
    end
    inherited btnSaveLink: TBitBtn
      Left = 92
      Top = 221
      Width = 568
      ExplicitLeft = 92
      ExplicitTop = 221
      ExplicitWidth = 568
    end
    inherited btnCancelLink: TBitBtn
      Left = 671
      Top = 221
      TabOrder = 2
      ExplicitLeft = 671
      ExplicitTop = 221
    end
    object chkDel: TDBCheckBoxEh
      Left = 5
      Top = 225
      Width = 80
      Height = 17
      Anchors = [akLeft, akBottom]
      Caption = #1059#1076#1072#1083#1077#1085#1086
      DataField = 'O_DELETED'
      DataSource = srcDataSource
      DynProps = <>
      TabOrder = 1
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 764
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      DesignSize = (
        764
        29)
      object lbl2: TLabel
        Left = 5
        Top = 9
        Width = 78
        Height = 13
        Caption = #1058#1080#1087' '#1086#1073#1088#1072#1097#1077#1085#1080#1103
      end
      object cbDirect: TDBComboBoxEh
        Left = 630
        Top = 6
        Width = 131
        Height = 21
        Anchors = [akTop, akRight]
        DataField = 'DIRECT'
        DataSource = srcDataSource
        DynProps = <>
        EmptyDataInfo.Text = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
        EditButtons = <>
        Items.Strings = (
          #1042#1093#1086#1076#1103#1097#1077#1077
          #1048#1089#1093#1086#1076#1103#1097#1077#1077
          #1042#1089#1077)
        KeyItems.Strings = (
          '0'
          '1'
          '-1'
          '')
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object edtName: TDBEditEh
        Left = 92
        Top = 6
        Width = 532
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'O_NAME'
        DataSource = srcDataSource
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1058#1080#1087' '#1086#1073#1088#1072#1097#1077#1085#1080#1103'/'#1079#1074#1086#1085#1082#1072' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
    end
    object pnlTags: TPanel
      Left = 0
      Top = 29
      Width = 764
      Height = 85
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object spl3: TSplitter
        Left = 490
        Top = 0
        Height = 85
        Align = alRight
        ExplicitLeft = 488
        ExplicitTop = 64
        ExplicitHeight = 100
      end
      object mmoData: TDBMemoEh
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 484
        Height = 79
        Hint = 
          #1044#1086#1087'. '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1077'. '#1054#1076#1085#1072' '#1089#1090#1088#1086#1082#1072' - '#1086#1076#1080#1085' '#1101#1083#1077#1084#1077#1085#1090'. '#13#10#1053#1072#1079#1074#1072#1085 +
          #1080#1077' '#1089#1087#1080#1089#1082#1072'='#1069#1083#1077#1084#1077#1085'1;...'#1069'X; '#13#10#1080#1083#1080' '#13#10#1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1077#1082#1089#1090#1086#1074#1086#1074#1086#1075#1086' '#1087#1086#1083#1103'= '
        ScrollBars = ssBoth
        Align = alClient
        AutoSize = False
        DataField = 'O_CHARFIELD'
        DataSource = srcDataSource
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = 
          #1044#1086#1087'. '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1077'. '#1054#1076#1085#1072' '#1089#1090#1088#1086#1082#1072' - '#1086#1076#1080#1085' '#1101#1083#1077#1084#1077#1085#1090'. '#1053#1072#1079#1074#1072#1085#1080#1077 +
          ' '#1089#1087#1080#1089#1082#1072'='#1069#1083#1077#1084#1077#1085'1;...'#1069'X; '#1080#1083#1080' '#1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1086#1083#1103'='
        ShowHint = True
        TabOrder = 0
        Visible = True
        WantReturns = True
      end
      object mmoTags: TDBMemoEh
        AlignWithMargins = True
        Left = 496
        Top = 3
        Width = 265
        Height = 79
        Hint = 
          #1057#1087#1080#1089#1086#1082' '#1084#1077#1090#1086#1082', '#1082#1086#1090#1086#1088#1099#1084#1080' '#1084#1086#1078#1085#1086' '#1087#1086#1084#1077#1095#1072#1090#1100' '#1079#1074#1086#1085#1086#1082'.  '#1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' - '#1085#1086#1074 +
          #1072#1103' '#1090#1088#1086#1082#1072
        ScrollBars = ssVertical
        Align = alRight
        AutoSize = False
        DataField = 'O_CHECK'
        DataSource = srcDataSource
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = 
          #1057#1087#1080#1089#1086#1082' '#1084#1077#1090#1086#1082', '#1082#1086#1090#1086#1088#1099#1084#1080' '#1084#1086#1078#1085#1086' '#1087#1086#1084#1077#1095#1072#1090#1100' '#1079#1074#1086#1085#1086#1082'.  '#1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' - '#1085#1086#1074 +
          #1072#1103' '#1089#1090#1088#1086#1082#1072
        ShowHint = True
        TabOrder = 1
        Visible = True
        WantReturns = True
      end
    end
    object pnlNotice: TPanel
      Left = 0
      Top = 117
      Width = 764
      Height = 98
      Align = alTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 5
      object mmoNotice: TDBMemoEh
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 758
        Height = 92
        Align = alClient
        AutoSize = False
        DataField = 'O_DESCRIPTION'
        DataSource = srcDataSource
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        ShowHint = True
        TabOrder = 0
        Visible = True
        WantReturns = True
      end
    end
  end
  object pgc: TPageControl [5]
    Left = 0
    Top = 463
    Width = 764
    Height = 236
    ActivePage = tsContetnt
    Align = alClient
    TabOrder = 3
    OnChange = pgcChange
    object tsContetnt: TTabSheet
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
      object pnlContent: TPanel
        Left = 0
        Top = 0
        Width = 756
        Height = 208
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbgrdTPL: TDBGridEh
          Left = 0
          Top = 25
          Width = 756
          Height = 183
          Align = alClient
          DataSource = srcTPL
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          SearchPanel.Enabled = True
          TabOrder = 1
          TitleParams.MultiTitle = True
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              Title.Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 194
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NEED_REQUEST'
              Footers = <>
              Title.Caption = #1047#1072#1103#1074#1082#1072
              Title.TitleButton = True
              Width = 76
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 432
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object tlbBtns: TToolBar
          Left = 0
          Top = 0
          Width = 756
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
    end
    object tsResult: TTabSheet
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      ImageIndex = 1
      object pnlResult: TPanel
        Left = 0
        Top = 0
        Width = 756
        Height = 208
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbgResult: TDBGridEh
          Left = 26
          Top = 0
          Width = 730
          Height = 208
          Align = alClient
          DataSource = srcResult
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
          SearchPanel.Enabled = True
          TabOrder = 0
          TitleParams.MultiTitle = True
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'O_NAME'
              Footers = <>
              Title.Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
              Title.TitleButton = True
              Width = 90
            end
            item
              CellButtons = <>
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'SET_BID'
              Footers = <>
              Title.Caption = #1047#1072#1103#1074#1082#1072
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'SET_TASK'
              Footers = <>
              Title.Caption = #1047#1072#1076#1072#1095#1072
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'O_DESCRIPTION'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 326
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pnlButtons: TPanel
          Left = 0
          Top = 0
          Width = 26
          Height = 208
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            26
            208)
          object btnDel1: TSpeedButton
            Left = 2
            Top = 188
            Width = 22
            Height = 22
            Action = actDelRes
            Anchors = [akLeft, akBottom]
            Flat = True
            Layout = blGlyphTop
          end
          object btnAdd1: TSpeedButton
            Left = 2
            Top = 3
            Width = 22
            Height = 22
            Action = actAddRes
            Flat = True
          end
          object btnEdit1: TSpeedButton
            Left = 2
            Top = 31
            Width = 22
            Height = 22
            Action = actEditRes
            Flat = True
          end
        end
      end
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
    object actAddRes: TAction
      Hint = #1076#1086#1073#1072#1074#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
      ImageIndex = 2
      OnExecute = actAddResExecute
    end
    object actEditRes: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
      ImageIndex = 4
      OnExecute = actEditResExecute
    end
    object actDelRes: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
      ImageIndex = 3
      OnExecute = actDelResExecute
    end
  end
  object dsType: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_NAME = :O_NAME,'
      '    O_DESCRIPTION = :O_DESCRIPTION,'
      '    O_DELETED = coalesce(:O_DELETED, 0),'
      '    O_CHARFIELD = :O_CHARFIELD,'
      '    O_Check = :O_Check,'
      '    O_Numericfield = coalesce(:DIRECT, -1)'
      'WHERE'
      '    O_ID = :OLD_O_ID and O_TYPE = 8')
    DeleteSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_DELETED = iif(O_DELETED = 0, 1, 0)'
      'WHERE'
      '    O_ID = :OLD_O_ID and O_TYPE = 8'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS('
      '    O_DELETED,'
      '    O_TYPE,'
      '    O_ID,'
      '    O_NAME,'
      '    O_DESCRIPTION,'
      '    O_CHARFIELD,'
      '    O_Check,'
      '    O_Numericfield'
      ')'
      'VALUES('
      '    0,'
      '    8,'
      '    :O_ID,'
      '    :O_NAME,'
      '    :O_DESCRIPTION,'
      '    :O_CHARFIELD,'
      '    :O_Check,'
      '    coalesce(:DIRECT, -1)'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_DELETED'
      '  , O_DIMENSION'
      '  , O_CHARFIELD'
      '  , O_Check'
      '  , cast(coalesce(O_Numericfield,-1) as INTEGER) DIRECT'
      '  from OBJECTS'
      '  where O_TYPE = 8'
      '      and O_ID = :OLD_O_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_DELETED'
      '  , O_DIMENSION'
      '  , O_CHARFIELD'
      '  , O_Check'
      '  , cast(coalesce(O_Numericfield,-1) as INTEGER) DIRECT'
      '  from OBJECTS'
      '  where O_TYPE = 8'
      '        and ((current_user = '#39'SYSDBA'#39')'
      '          or (O_DELETED = 0))'
      '  order by O_NAME')
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
    Left = 80
    Top = 356
    dcForceOpen = True
  end
  object srcTPL: TDataSource
    DataSet = dsTPL
    OnStateChange = srcTPLStateChange
    OnDataChange = srcTPLDataChange
    Left = 117
    Top = 355
  end
  object dsResult: TpFIBDataSet
    DeleteSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_DELETED = iif(O_DELETED = 0, 1, 0)'
      'WHERE'
      '    O_ID = :OLD_O_ID and O_TYPE = 81'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_Check'
      '  , O_Numericfield'
      '  , iif(position('#39'bid'#39', o_check) > 0, 1, 0) SET_BID'
      '  , iif(position('#39'task'#39', o_check) > 0, 1, 0) SET_TASK'
      '  from OBJECTS'
      '  where O_TYPE = 81'
      '        and O_ID = :OLD_O_ID')
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_Check'
      '  , O_Numericfield'
      '  , iif(position('#39'bid'#39', o_check) > 0, 1, 0) SET_BID'
      '  , iif(position('#39'task'#39', o_check) > 0, 1, 0) SET_TASK'
      '  from OBJECTS'
      '  where O_TYPE = 81'
      '        and O_Numericfield = :O_ID'
      '        and O_DELETED = 0'
      '  order by O_NAME')
    BeforePost = dsTPLBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 424
    Top = 380
    dcForceOpen = True
  end
  object srcResult: TDataSource
    DataSet = dsResult
    Left = 493
    Top = 379
  end
end
