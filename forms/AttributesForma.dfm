inherited AttributesForm: TAttributesForm
  Left = 381
  Top = 171
  Caption = #1040#1090#1088#1080#1073#1091#1090#1099
  ClientHeight = 550
  ClientWidth = 939
  ExplicitWidth = 955
  ExplicitHeight = 589
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 273
    Width = 939
    ExplicitTop = 273
    ExplicitWidth = 939
  end
  inherited dbGrid: TDBGridEh
    Top = 276
    Width = 939
    Height = 274
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
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'OT_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 66
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
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1040#1090#1088#1080#1073#1091#1090
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DIMENSION'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Title.TitleButton = True
        Width = 41
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
        FieldName = 'O_DELETED'
        Footers = <>
        Visible = False
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
        FieldName = 'O_CHARFIELD'
        Footers = <>
        Title.Caption = #1057#1087#1080#1089#1086#1082
        Title.TitleButton = True
        Width = 228
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_Numericfield'
        Footers = <>
        Title.Caption = #1059#1085#1080#1082#1072#1083#1100#1085#1086
        Title.TitleButton = True
        Width = 61
      end>
  end
  inherited tlbMain: TToolBar
    Width = 939
    ExplicitWidth = 939
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
    Height = 248
    ParentCtl3D = False
    ExplicitWidth = 939
    ExplicitHeight = 248
    object lbl2: TLabel [0]
      Left = 5
      Top = 43
      Width = 43
      Height = 13
      Caption = #1040#1090#1088#1080#1073#1091#1090
    end
    object lbl1: TLabel [1]
      Left = 5
      Top = 71
      Width = 20
      Height = 13
      Caption = #1050#1086#1076
    end
    object lbl3: TLabel [2]
      Left = 5
      Top = 161
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object lbl4: TLabel [3]
      Left = 395
      Top = 71
      Width = 99
      Height = 13
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1079#1085#1072#1095#1077#1085#1080#1103
    end
    object lbl5: TLabel [4]
      Left = 5
      Top = 15
      Width = 18
      Height = 13
      Caption = #1058#1080#1087
    end
    object lbl6: TLabel [5]
      Left = 5
      Top = 98
      Width = 36
      Height = 13
      Caption = #1057#1087#1080#1089#1086#1082
    end
    inherited btnSaveLink: TBitBtn
      Left = 72
      Top = 215
      Width = 754
      TabOrder = 7
      ExplicitLeft = 72
      ExplicitTop = 215
      ExplicitWidth = 754
    end
    inherited btnCancelLink: TBitBtn
      Left = 832
      Top = 215
      Width = 98
      Cancel = True
      TabOrder = 8
      ExplicitLeft = 832
      ExplicitTop = 215
      ExplicitWidth = 98
    end
    object edtName: TDBEditEh
      Left = 72
      Top = 40
      Width = 858
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1040#1090#1088#1080#1073#1091#1090' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object edtO_DIMENSION: TDBEditEh
      Left = 72
      Top = 68
      Width = 129
      Height = 21
      DataField = 'O_DIMENSION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1050#1086#1076' '#1072#1090#1088#1080#1073#1091#1090#1072
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object dbmmoO_DESCRIPTION: TDBMemoEh
      Left = 72
      Top = 160
      Width = 858
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072
      ShowHint = True
      TabOrder = 6
      Visible = True
      WantReturns = True
    end
    object cbRegular: TDBComboBoxEh
      Left = 500
      Top = 68
      Width = 430
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
        #1058#1086#1083#1100#1082#1086' '#1094#1080#1092#1088#1099
        #1063#1080#1089#1083#1072' '#1089' '#1087#1083#1072#1074#1072#1102#1097#1077#1081' '#1090#1086#1095#1082#1086#1081' ('#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1090#1086#1095#1082#1072')'
        #1053#1072#1073#1086#1088' '#1080#1079' '#1073#1091#1082#1074' '#1080' '#1094#1080#1092#1088
        #1044#1086#1084#1077#1085' ('#1085#1072#1087#1088#1080#1084#1077#1088' a4on.tv)'
        'IPv4'
        'IPv6'
        'Mac-'#1072#1076#1088#1077#1089
        
          #1048#1084#1103' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' ('#1089' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077#1084' 2-20 '#1089#1080#1084#1074#1086#1083#1086#1074', '#1082#1086#1090#1086#1088#1099#1084#1080' '#1084#1086#1075#1091#1090' '#1073 +
          #1099#1090#1100' '#1073#1091#1082#1074#1099' '#1080' '#1094#1080#1092#1088#1099', '#1087#1077#1088#1074#1099#1081' '#1089#1080#1084#1074#1086#1083' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086' '#1073#1091#1082#1074#1072')'
        #1055#1072#1088#1086#1083#1100' ('#1057#1090#1088#1086#1095#1085#1099#1077' '#1080' '#1087#1088#1086#1087#1080#1089#1085#1099#1077' '#1083#1072#1090#1080#1085#1089#1082#1080#1077' '#1073#1091#1082#1074#1099', '#1094#1080#1092#1088#1099')'
        #1044#1072#1090#1072' '#1074' '#1092#1086#1088#1084#1072#1090#1077' DD.MM.YYYY'
        #1042#1088#1077#1084#1103' '#1074' '#1092#1086#1088#1084#1072#1090#1077' HH:MM'
        #1053#1086#1084#1077#1088' '#1082#1088#1077#1076#1080#1090#1082#1080)
      KeyItems.Strings = (
        '[\-\+]?\d+'
        '[\-\+]?\d+(\.\d{0,})?'
        '['#1072'-'#1103#1040'-'#1071#1105#1025'a-zA-Z0-9]+'
        '([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6}'
        
          '((25[0-5]|2[0-4]\d|[01]?\d\d?)\.){3}(25[0-5]|2[0-4]\d|[01]?\d\d?' +
          ')'
        '((^|:)([0-9a-fA-F]{0,4})){1,8}'
        '([0-9a-fA-F]{2}([:-]|$)){6}$|([0-9a-fA-F]{4}([.]|$)){3}'
        '[a-zA-Z][a-zA-Z0-9-_\.]{1,20}'
        '(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*'
        
          '((0[1-9]|[12]\d)\.(0[1-9]|1[012])|30\.(0[13-9]|1[012])|31\.(0[13' +
          '578]|1[02]))\.(19|20)\d\d'
        '([0-1]\d|2[0-3])(:[0-5]\d)'
        '[0-9]{13,16}')
      LimitTextToListValues = False
      ShowHint = True
      TabOrder = 4
      Visible = True
      OnNotInList = cbRegularNotInList
    end
    object cbAtrType: TDBComboBoxEh
      Left = 72
      Top = 13
      Width = 858
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_TYPE'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = #1058#1080#1087' '#1072#1090#1088#1080#1073#1091#1090#1072
      EditButtons = <>
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object mmoList: TDBMemoEh
      Left = 72
      Top = 95
      Width = 858
      Height = 59
      ScrollBars = ssVertical
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DataField = 'O_CHARFIELD'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1057#1087#1080#1089#1086#1082' '#1079#1085#1072#1095#1077#1085#1080#1081'. '#1045#1089#1083#1080' '#1085#1091#1078#1085#1086' '#1089#1076#1077#1083#1072#1090#1100' '#1074#1099#1073#1086#1088'  '#1080#1079' '#1089#1087#1080#1089#1082#1072
      ShowHint = True
      TabOrder = 5
      Visible = True
      WantReturns = True
    end
    object chkUniq: TDBCheckBoxEh
      Left = 215
      Top = 70
      Width = 150
      Height = 17
      Hint = #1055#1088#1080' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1080' '#1086#1073#1098#1077#1082#1090#1091' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072' '#1076#1086#1083#1078#1085#1086' '#1073#1099#1090#1100' '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1084
      Alignment = taLeftJustify
      Caption = #1059#1085#1080#1082#1072#1083#1100#1085#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
      DataField = 'O_Numericfield'
      DataSource = srcDataSource
      DynProps = <>
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsAttributes
    OnDataChange = srcDataSourceDataChange
    Left = 184
    Top = 304
  end
  inherited actions: TActionList
    Left = 94
    Top = 296
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
    Left = 379
    Top = 303
  end
  inherited CnErrors: TCnErrorProvider
    Left = 280
    Top = 304
  end
  object dsAttributes: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'EXECUTE PROCEDURE ATTRIBUTES_IUD(:O_ID, :O_NAME, :O_DESCRIPTION,' +
        ' :O_DIMENSION, :O_DELETED, :O_CHARFIELD, :O_CHECK, 1, :O_TYPE, :' +
        'O_Numericfield)')
    DeleteSQL.Strings = (
      
        'EXECUTE PROCEDURE ATTRIBUTES_IUD(:O_ID, null, null, null, :O_DEL' +
        'ETED, null, null, 2, :O_TYPE, null)')
    InsertSQL.Strings = (
      
        'EXECUTE PROCEDURE ATTRIBUTES_IUD(:O_ID, :O_NAME, :O_DESCRIPTION,' +
        ' :O_DIMENSION, :O_DELETED, :O_CHARFIELD, :O_CHECK, 0, :O_TYPE, :' +
        'O_Numericfield)')
    RefreshSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , t.OT_NAME'
      '  , o.O_NAME'
      '  , o.O_DESCRIPTION'
      '  , o.O_DELETED'
      '  , o.O_DIMENSION'
      '  , o.O_CHARFIELD'
      '  , o.O_CHECK'
      '  , cast(o.O_Numericfield as INTEGER) O_Numericfield'
      '  , o.O_TYPE'
      '  from OBJECTS o'
      '       left outer join OBJECTS_TYPE T on (o.O_TYPE = t.OT_ID)'
      '  where (O.O_TYPE = :OLD_O_TYPE)'
      '        and (O.O_ID = :OLD_O_ID)')
    SelectSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , t.OT_NAME'
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
      'from OBJECTS o'
      '     left outer join OBJECTS_TYPE T on (o.O_TYPE = t.OT_ID)'
      'where O_TYPE in ('
      '                 4 -- '#1040#1090#1088#1080#1073#1091#1090#1099' '#1072#1073#1086#1085#1077#1085#1090#1072
      '               , 5 -- '#1040#1090#1088#1080#1073#1091#1090#1099' '#1089#1077#1090#1077#1074#1086#1075#1086' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
      '               , 6 -- '#1040#1090#1088#1080#1073#1091#1090#1099' '#1058#1042' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
      '               ,25 -- '#1040#1090#1088#1080#1073#1091#1090#1099' '#1091#1089#1083#1091#1075
      '               ,32 -- '#1040#1090#1088#1080#1073#1091#1090#1099' IPTV '#1075#1088#1091#1087#1087
      '               ,37 -- '#1040#1090#1088#1080#1073#1091#1090#1099' '#1076#1086#1084#1086#1074
      '               ,39 -- '#1040#1090#1088#1080#1073#1091#1090#1099' '#1091#1079#1083#1086#1074
      '               ,50 -- '#1040#1090#1088#1080#1073#1091#1090#1099' '#1076#1083#1103' '#1090#1080#1087#1072' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103#9#9#9'   '
      '               ,63 -- '#1040#1090#1088#1080#1073#1091#1090#1099' '#1089#1077#1090#1077#1081
      '               ,69 -- '#1040#1090#1088#1080#1073#1091#1090#1099' '#1075#1088#1091#1087#1087' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103'  '
      '               )'
      '        and O_DELETED = 0'
      'order by O_NAME  ')
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
