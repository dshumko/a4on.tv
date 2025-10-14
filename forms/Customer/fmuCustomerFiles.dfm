object apgCustomerFiles: TapgCustomerFiles
  Left = 0
  Top = 0
  Caption = #1060#1072#1081#1083#1099' '#1072#1073#1086#1085#1077#1085#1090#1072
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
  object dbgCustFiles: TDBGridEh
    Left = 26
    Top = 0
    Width = 753
    Height = 211
    Align = alClient
    AllowedOperations = []
    DataSource = srcCustFiles
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    STFilter.InstantApply = True
    STFilter.Local = True
    STFilter.Visible = False
    TabOrder = 0
    TitleParams.MultiTitle = True
    OnCellClick = dbgCustFilesCellClick
    OnDblClick = dbgCustFilesDblClick
    OnGetCellParams = dbgCustFilesGetCellParams
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1092#1072#1081#1083#1072
        Title.TitleButton = True
        Width = 129
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' / '#1053#1072#1079#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 193
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 204
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FILENAME'
        Footers = <>
        Title.Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072
        Title.TitleButton = True
        Width = 138
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_ON'
        Footers = <>
        Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085' '#1082#1086#1075#1076#1072
        Title.TitleButton = True
        Width = 69
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_BY'
        Footers = <>
        Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085' '#1082#1077#1084
        Title.TitleButton = True
        Width = 91
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_ON'
        Footers = <>
        Title.Caption = #1048#1079#1084#1077#1085#1077#1085' '#1082#1086#1075#1076#1072
        Title.TitleButton = True
        Width = 70
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_BY'
        Footers = <>
        Title.Caption = #1048#1079#1084#1077#1085#1077#1085' '#1082#1077#1084
        Title.TitleButton = True
        Width = 75
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACT'
        Footers = <>
        Title.Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085'|'#1044#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Anotice'
        Footers = <>
        Title.Caption = #1054#1073#1088#1072#1073#1086#1090#1072#1085'|'#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 211
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      26
      211)
    object btnDel1: TSpeedButton
      Left = 2
      Top = 187
      Width = 22
      Height = 22
      Action = actDel
      Anchors = [akLeft, akBottom]
      Flat = True
      Layout = blGlyphTop
    end
    object btnAdd1: TSpeedButton
      Left = 2
      Top = 3
      Width = 22
      Height = 22
      Action = actAdd
      Flat = True
    end
    object btnEdit1: TSpeedButton
      Left = 2
      Top = 32
      Width = 22
      Height = 22
      Action = actEdit
      Flat = True
    end
    object btnOpen: TSpeedButton
      Left = 2
      Top = 101
      Width = 22
      Height = 22
      Action = actView
      Flat = True
    end
  end
  object dsCustFiles: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CUSTOMER_FILES'
      'SET '
      '    ACT = :ACT,'
      '    ANOTICE = :ANOTICE'
      'WHERE'
      '    CF_ID = :OLD_CF_ID')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CUSTOMER_FILES'
      'WHERE'
      '        CF_ID = :OLD_CF_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    T.O_NAME'
      '  , CF.Cf_Id'
      '  , cf.Name'
      '  , cf.Cf_Type'
      '  , cf.Notice'
      '  , cf.Customer_Id'
      '  , cf.FILENAME'
      '  , coalesce((select first 1'
      '                  W.SURNAME'
      '                from WORKER W'
      
        '                where W.IBNAME = cf.Added_By), cf.Added_By) as A' +
        'dded_By  '
      '  , cf.Added_On'
      '  , coalesce((select first 1'
      '                  W.SURNAME'
      '                from WORKER W'
      
        '                where W.IBNAME = cf.Edit_By), cf.Edit_By) as Edi' +
        't_By  '
      '  , cf.Edit_On'
      '  , cf.Act'
      '  , cf.ANotice'
      '  from CUSTOMER_FILES CF'
      
        '       inner join OBJECTS T on (CF.Cf_Type = T.O_ID and T.O_TYPE' +
        ' = 33)'
      '  where(  CF.Customer_Id = :Customer_ID'
      '     ) and (     CF.CF_ID = :OLD_CF_ID'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select * from'
      '('
      'select'
      '    T.O_NAME'
      '  , CF.Cf_Id'
      '  , cf.Name'
      '  , cf.Cf_Type'
      '  , cf.Notice'
      '  , cf.Customer_Id'
      '  , cf.FILENAME'
      '  , cf.Act'
      '  , cf.ANotice'
      '  , 0 isReq'
      '  , null NODE_ID'
      '  , null RQ_ID'
      '  , cf.Added_On'
      '  , coalesce((select first 1'
      '                  W.SURNAME'
      '                from WORKER W'
      
        '                where W.IBNAME = cf.Added_By), cf.Added_By) as A' +
        'dded_By'
      ''
      '  , cf.Edit_On'
      '  , coalesce((select first 1'
      '                  W.SURNAME'
      '                from WORKER W'
      
        '                where W.IBNAME = cf.Edit_By), cf.Edit_By) as Edi' +
        't_By'
      '  , T.O_DIMENSION              '
      '  from CUSTOMER_FILES CF'
      '       inner join OBJECTS T on (CF.Cf_Type = T.O_ID and'
      '             T.O_TYPE = 33)'
      '  where CF.Customer_Id = :Customer_ID'
      ''
      'union all'
      ''
      'select'
      '    '#39#1047#1072#1103#1074#1082#1072' '#39' || r.Rq_Id O_NAME'
      '  , p.Id Cf_Id'
      '  , r.Rq_Id||'#39'_'#39'||p.Id Name'
      '  , null Cf_Type'
      '  , p.Notice'
      '  , r.Rq_Customer Customer_Id'
      '  , r.Rq_Id ||'#39'_'#39'||p.Id || '#39'.jpg'#39' FILENAME'
      '  , null Act'
      '  , null ANotice'
      '  , 1 isReq  '
      '  , r.NODE_ID'
      '  , r.RQ_ID'
      '  , r.Added_On'
      '  , coalesce((select first 1'
      '                  W.SURNAME'
      '                from WORKER W'
      
        '                where W.IBNAME = r.Added_By), r.Added_By) as Add' +
        'ed_By'
      ''
      '  , r.Edit_On'
      '  , coalesce((select first 1'
      '                  W.SURNAME'
      '                from WORKER W'
      
        '                where W.IBNAME = r.Edit_By), r.Edit_By) as Edit_' +
        'By'
      '  , null O_DIMENSION              '
      ''
      '  from Request_Photos p'
      '       inner join request r on (p.Rq_Id = r.RQ_ID)'
      '  where r.Rq_Customer = :customer_id'
      ')'
      'order by O_NAME, Name, Added_On'
      ''
      '  ')
    AutoCalcFields = False
    AfterOpen = dsCustFilesAfterOpen
    AfterRefresh = dsCustFilesAfterRefresh
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 131
    Top = 69
    WaitEndMasterScroll = True
  end
  object srcCustFiles: TDataSource
    DataSet = dsCustFiles
    OnStateChange = srcCustFilesStateChange
    Left = 63
    Top = 99
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 206
    Top = 37
    object actAdd: TAction
      ImageIndex = 2
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actDel: TAction
      ImageIndex = 3
      OnExecute = actDelExecute
    end
    object actView: TAction
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1072#1081#1083#1072
      ImageIndex = 41
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
      'select Content from Customer_Files where Cf_Id = :Cf_Id')
    Left = 296
    Top = 120
  end
  object qReqFile: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select jpg from Request_Photos where Id = :Cf_Id')
    Left = 360
    Top = 120
  end
end
