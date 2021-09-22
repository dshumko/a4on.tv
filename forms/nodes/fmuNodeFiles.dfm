object apgNodeFiles: TapgNodeFiles
  Left = 0
  Top = 0
  Caption = #1060#1072#1081#1083#1099' '#1091#1079#1083#1072
  ClientHeight = 211
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgNodeFiles: TDBGridEh
    Left = 28
    Top = 0
    Width = 751
    Height = 211
    Align = alClient
    AllowedOperations = []
    AutoFitColWidths = False
    DataSource = srcFiles
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    TabOrder = 1
    TitleParams.MultiTitle = True
    OnDblClick = dbgNodeFilesDblClick
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1092#1072#1081#1083#1072
        Width = 129
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' / '#1053#1072#1079#1074#1072#1085#1080#1077
        Width = 193
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 213
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FILENAME'
        Footers = <>
        Title.Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
        Width = 138
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object tbAttributes: TToolBar
    Left = 0
    Top = 0
    Width = 28
    Height = 211
    Align = alLeft
    ButtonHeight = 23
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Images = A4MainForm.ICONS_ACTIVE
    TabOrder = 0
    object btnAdd: TToolButton
      Left = 0
      Top = 0
      Action = actAdd
      ParentShowHint = False
      Wrap = True
      ShowHint = True
    end
    object btnEdit: TToolButton
      Left = 0
      Top = 23
      Action = actEdit
      ParentShowHint = False
      Wrap = True
      ShowHint = True
    end
    object btnDel: TToolButton
      Left = 0
      Top = 46
      Action = actDel
      ParentShowHint = False
      ShowHint = True
    end
    object btn1: TToolButton
      Left = 0
      Top = 46
      Width = 31
      Caption = 'btn1'
      ImageIndex = 5
      Wrap = True
      Style = tbsSeparator
    end
    object btnView: TToolButton
      Left = 0
      Top = 100
      Action = actView
    end
  end
  object dsFiles: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CUSTOMER_FILES'
      'WHERE'
      '        CF_ID = :OLD_CF_ID'
      '    ')
    RefreshSQL.Strings = (
      
        'SELECT T.O_NAME, CF.Cf_Id, cf.Name, cf.Cf_Type, cf.Notice, cf.Cu' +
        'stomer_Id, cf.FILENAME'
      'FROM CUSTOMER_FILES CF'
      
        '   INNER JOIN OBJECTS T ON (CF.Cf_Type = T.O_ID and T.O_TYPE = 3' +
        '3)'
      'where(  CF.Customer_Id = :Customer_ID'
      '     ) and (     CF.CF_ID = :OLD_CF_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT '
      '  T.O_NAME'
      '  , CF.NF_Id'
      '  , cf.Name'
      '  , cf.NF_Type'
      '  , cf.Notice'
      '  , cf.NODE_ID'
      '  , cf.FILENAME'
      'FROM NODE_FILES CF'
      
        '   INNER JOIN OBJECTS T ON (CF.NF_Type = T.O_ID and T.O_TYPE = 4' +
        '0)'
      'where CF.NODE_Id = :NODE_ID'
      'order by T.O_NAME, cf.Name')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 131
    Top = 85
  end
  object srcFiles: TDataSource
    DataSet = dsFiles
    Left = 63
    Top = 35
  end
  object ActList: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 206
    Top = 37
    object actAdd: TAction
      Caption = 'actAdd'
      ImageIndex = 2
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Caption = 'actEdit'
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actDel: TAction
      Caption = 'actDel'
      ImageIndex = 3
      OnExecute = actDelExecute
    end
    object actView: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1072#1081#1083#1072
      ImageIndex = 38
      OnExecute = actViewExecute
    end
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
    Left = 331
    Top = 42
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
    Left = 371
    Top = 42
  end
  object qRead: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select Content from node_Files where NF_Id = :NF_Id')
    Left = 296
    Top = 120
  end
end
