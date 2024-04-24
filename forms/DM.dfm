object dmMain: TdmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 580
  Width = 932
  object trRead: TpFIBTransaction
    DefaultDatabase = dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 24
    Top = 78
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 128
    Top = 28
  end
  object dbTV: TpFIBDatabase
    DBName = '127.0.0.1:A4ON'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'lc_ctype=UTF8'
      'password=masterkey'
      'sql_role_name=')
    DefaultTransaction = trRead
    DefaultUpdateTransaction = trWrite
    SQLDialect = 3
    Timeout = 0
    AfterDisconnect = dbTVAfterDisconnect
    DesignDBOptions = [ddoIsDefaultDatabase]
    UseRepositories = []
    LibraryName = 'fbclient.dll'
    WaitForRestoreConnect = 0
    AfterConnect = dbTVAfterConnect
    Left = 22
    Top = 25
  end
  object dsSettings: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SETTINGS'
      'SET '
      '    VAR_VALUE = :VAR_VALUE,'
      '    VAR_TYPE = :VAR_TYPE'
      'WHERE'
      '    VAR_NAME = :OLD_VAR_NAME'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SETTINGS'
      'WHERE'
      '        VAR_NAME = :OLD_VAR_NAME'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SETTINGS('
      '    VAR_NAME,'
      '    VAR_VALUE,'
      '    VAR_TYPE'
      ')'
      'VALUES('
      '    :VAR_NAME,'
      '    :VAR_VALUE,'
      '    :VAR_TYPE'
      ')')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM SETTINGS'
      ' WHERE '
      '        SETTINGS.VAR_NAME = :OLD_VAR_NAME'
      '    ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SETTINGS'
      'order by VAR_NAME'
      '')
    AutoUpdateOptions.UpdateTableName = 'PAYSOURCE'
    AutoUpdateOptions.KeyFields = 'PAYSOURCE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = trRead
    Database = dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 230
    Top = 80
  end
  object Query: TpFIBQuery
    Transaction = trWrite
    Database = dbTV
    Left = 127
    Top = 184
  end
  object trReadQ: TpFIBTransaction
    DefaultDatabase = dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 24
    Top = 136
  end
  object trWriteQ: TpFIBTransaction
    DefaultDatabase = dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 129
    Top = 80
  end
  object dsCompany: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE COMPANY'
      'SET '
      '    C_CODE = :C_CODE,'
      '    C_ORDER = :C_ORDER,'
      '    C_NAME = :C_NAME,'
      '    C_VALUE = :C_VALUE,'
      '    C_TYPE = :C_TYPE,'
      '    C_DESCRIPTION = :C_DESCRIPTION'
      'WHERE'
      '    C_CODE = :OLD_C_CODE'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    COMPANY'
      'WHERE'
      '        C_CODE = :OLD_C_CODE'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO COMPANY('
      '    C_CODE,'
      '    C_ORDER,'
      '    C_NAME,'
      '    C_VALUE,'
      '    C_TYPE,'
      '    C_DESCRIPTION'
      ')'
      'VALUES('
      '    :C_CODE,'
      '    :C_ORDER,'
      '    :C_NAME,'
      '    :C_VALUE,'
      '    '#39'ftString'#39','
      '    :C_DESCRIPTION'
      ')')
    RefreshSQL.Strings = (
      'select * from CoMPANY'
      ' WHERE '
      '        COMPANY.C_CODE = :OLD_C_CODE'
      '    ')
    SelectSQL.Strings = (
      'select * from CoMPANY'
      'order by C_ORDER')
    AutoCalcFields = False
    Transaction = trRead
    Database = dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 230
    Top = 25
  end
  object FibErrorHandler: TpFibErrorHandler
    OnFIBErrorEvent = FibErrorHandlerFIBErrorEvent
    Left = 128
    Top = 135
  end
  object trReadCustomer: TpFIBTransaction
    DefaultDatabase = dbTV
    Timeout = 36000000
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 230
    Top = 135
  end
  object srcSrvTypes: TDataSource
    AutoEdit = False
    DataSet = dsmSrvTypes
    Left = 132
    Top = 361
  end
  object qRead: TpFIBQuery
    Transaction = trReadQ
    Database = dbTV
    Left = 131
    Top = 240
  end
  object fddReport: TpFIBDataDriverEh
    Database = dbTV
    SelectCommand.Params = <>
    SelectCommand.CommandText.Strings = (
      'select'
      '    r.id_report,'
      '    r.report_body,'
      '    r.id_parent,'
      '    r.report_name,'
      '    r.no_visible'
      '  from reports r'
      '  order by case'
      '             when r.report_body is null then 0'
      '             else 1'
      '           end, r.report_name')
    UpdateCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'REPORT_BODY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PARENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REPORT_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NO_VISIBLE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_ID_REPORT'
        ParamType = ptUnknown
      end>
    UpdateCommand.CommandText.Strings = (
      'UPDATE REPORTS'
      'SET '
      '    REPORT_BODY = :REPORT_BODY,'
      '    ID_PARENT = :ID_PARENT,'
      '    REPORT_NAME = :REPORT_NAME,'
      '    NO_VISIBLE = :NO_VISIBLE'
      'WHERE'
      '    ID_REPORT = :OLD_ID_REPORT'
      '    ')
    InsertCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'ID_REPORT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REPORT_BODY'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ID_PARENT'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'REPORT_NAME'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NO_VISIBLE'
        ParamType = ptUnknown
      end>
    InsertCommand.CommandText.Strings = (
      'INSERT INTO REPORTs('
      '    ID_REPORT,'
      '    REPORT_BODY,'
      '    ID_PARENT,'
      '    REPORT_NAME,'
      '    NO_VISIBLE'
      ')'
      'VALUES('
      '    :ID_REPORT,'
      '    :REPORT_BODY,'
      '    :ID_PARENT,'
      '    :REPORT_NAME,'
      '    :NO_VISIBLE'
      ')')
    DeleteCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'OLD_ID_REPORT'
        ParamType = ptUnknown
      end>
    DeleteCommand.CommandText.Strings = (
      'DELETE FROM'
      '    REPORTs'
      'WHERE'
      '        ID_REPORT = :OLD_ID_REPORT'
      '    ')
    GetrecCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'OLD_ID_REPORT'
        ParamType = ptUnknown
      end>
    GetrecCommand.CommandText.Strings = (
      'SELECT'
      '  r.ID_REPORT,'
      '  r.REPORT_BODY,'
      '  r.ID_PARENT,'
      '  r.REPORT_NAME,'
      '  r.NO_VISIBLE'
      'FROM REPORTs r'
      'where (     R.ID_REPORT = :OLD_ID_REPORT'
      '     )'
      '    ')
    KeyFields = 'ID_REPORT'
    Left = 401
    Top = 279
  end
  object mtReportsTree: TMemTableEh
    AutoIncrement.InitValue = 99
    AutoIncrement.Step = 1
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    DataDriver = fddReport
    StoreDefs = True
    TreeList.Active = True
    TreeList.KeyFieldName = 'id_report'
    TreeList.RefParentFieldName = 'id_parent'
    TreeList.DefaultNodeExpanded = True
    Left = 398
    Top = 345
  end
  object fdsLoadReport: TpFIBDataSet
    UniDirectional = True
    SelectSQL.Strings = (
      'select r.report_name, r.report_body'
      'from reports r'
      'where r.id_report = :id_report')
    AllowedUpdateKinds = []
    Transaction = trRepRead
    Database = dbTV
    UpdateTransaction = trRepWrite
    Left = 406
    Top = 34
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object qCommon: TpFIBQuery
    Transaction = trRepRead
    Database = dbTV
    Left = 402
    Top = 133
    qoStartTransaction = True
  end
  object fdsReport: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE REPORTS'
      'SET '
      '    REPORT_BODY = :REPORT_BODY,'
      '    ID_PARENT = :ID_PARENT,'
      '    REPORT_NAME = :REPORT_NAME,'
      '    NO_VISIBLE = :NO_VISIBLE'
      'WHERE'
      '    ID_REPORT = :OLD_ID_REPORT'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    REPORTS'
      'WHERE'
      '        ID_REPORT = :OLD_ID_REPORT'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO REPORTS('
      '    ID_REPORT,'
      '    REPORT_BODY,'
      '    ID_PARENT,'
      '    REPORT_NAME,'
      '    NO_VISIBLE'
      ')'
      'VALUES('
      '    :ID_REPORT,'
      '    :REPORT_BODY,'
      '    :ID_PARENT,'
      '    :REPORT_NAME,'
      '    :NO_VISIBLE'
      ')')
    RefreshSQL.Strings = (
      'select'
      '  r.id_report,'
      '  r.report_body,'
      '  r.id_parent,'
      '  r.report_name,'
      '  r.no_visible'
      'from reports r'
      ' WHERE '
      '        R.ID_REPORT = :OLD_ID_REPORT'
      '    ')
    SelectSQL.Strings = (
      'select'
      '  r.id_report,'
      '  r.report_body,'
      '  r.id_parent,'
      '  r.report_name,'
      '  r.no_visible'
      'from reports r'
      'where r.id_report=:id_report')
    AutoUpdateOptions.UpdateTableName = 'REPORTS'
    AutoUpdateOptions.KeyFields = 'ID_REPORT'
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.CanChangeSQLs = True
    AutoUpdateOptions.GeneratorName = 'GEN_REPORT_ID'
    AutoUpdateOptions.UpdateOnlyModifiedFields = True
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoUpdateOptions.AutoParamsToFields = True
    AutoUpdateOptions.SeparateBlobUpdate = True
    Transaction = trRepRead
    Database = dbTV
    UpdateTransaction = trRepWrite
    AutoCommit = True
    Left = 406
    Top = 83
    oFetchAll = True
  end
  object trRepRead: TpFIBTransaction
    DefaultDatabase = dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 403
    Top = 180
  end
  object trRepWrite: TpFIBTransaction
    DefaultDatabase = dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 404
    Top = 229
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 552
    Top = 35
  end
  object frxDialogControls1: TfrxDialogControls
    Left = 553
    Top = 82
  end
  object frxCheckBoxObject1: TfrxCheckBoxObject
    Left = 556
    Top = 130
  end
  object frxRichObject1: TfrxRichObject
    Left = 559
    Top = 176
  end
  object frxOLEObject1: TfrxOLEObject
    Left = 558
    Top = 230
  end
  object frxGradientObject1: TfrxGradientObject
    Left = 561
    Top = 276
  end
  object frxDotMatrixExport1: TfrxDotMatrixExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EscModel = 0
    GraphicFrames = False
    SaveToFile = False
    UseIniSettings = True
    Left = 566
    Top = 321
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 563
    Top = 368
  end
  object frxADOComponents1: TfrxADOComponents
    Left = 691
    Top = 84
  end
  object frxmdsCompany: TfrxDBDataset
    UserName = #1060#1048#1056#1052#1040
    CloseDataSource = False
    OpenDataSource = False
    BCDToCurrency = False
    DataSetOptions = []
    Left = 694
    Top = 135
  end
  object frxModalReport: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41493.731636597220000000
    ReportOptions.LastChange = 41493.731636597220000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnPreview = frxModalReportPreview
    OnUserFunction = frxReportUserFunction
    Left = 693
    Top = 189
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object mdsCompany: TMemTableEh
    Params = <>
    Left = 23
    Top = 354
  end
  object dsmSrvTypes: TMemTableEh
    Params = <>
    Left = 134
    Top = 304
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object ID: TMTNumericDataFieldEh
          FieldName = 'ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object NAME: TMTStringDataFieldEh
          FieldName = 'NAME'
          StringDataType = fdtStringEh
          DisplayLabel = 'NAME'
          DisplayWidth = 50
          Size = 50
          Transliterate = True
        end
        object DESCRIPTION: TMTStringDataFieldEh
          FieldName = 'DESCRIPTION'
          StringDataType = fdtStringEh
          DisplayLabel = 'DESCRIPTION'
          DisplayWidth = 500
          Size = 500
          Transliterate = True
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object iniPropStorage: TIniPropStorageManEh
    Left = 230
    Top = 261
  end
  object dsFindCN: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '      '#39#1040#39' as O_TYPE'
      '    , c.CUSTOMER_ID'
      '    , c.cust_code'
      '    , c.Account_No'
      '    , c.CUST_STATE_DESCR'
      '    , c.Debt_sum'
      '    , c.HOUSE_ID'
      '    , c.FLAT_No'
      '    , c.phone_no'
      '    , c.notice'
      '    , c.HIS_COLOR'
      
        '    , c.surname ||'#39' '#39'|| coalesce(c.firstname,'#39#39') ||'#39' '#39'|| coalesc' +
        'e(c.midlename,'#39#39') as FIO'
      '    , s.street_short || '#39' '#39' || S.Street_Name as street'
      '    , H.House_No'
      '    , h.Street_ID'
      '    , hf.porch_n'
      '    , hf.floor_n'
      '    , c.Juridical'
      '    , c.Jur_Inn'
      '    , coalesce((select'
      '                    list(cc.Cc_Value)'
      '                  from Customer_Contacts cc'
      '                  where cc.Customer_Id = c.Customer_Id'
      '                        and cc.Cc_Type = 1'
      '                        @@ONLY_NOTYFY% @'
      '               ), c.MOBILE_PHONE, '#39#39') as MOBILE'
      
        '    , coalesce(a.Area_Name||coalesce('#39'. '#39'||sa.Subarea_Name, '#39#39'),' +
        ' '#39#39') as City'
      '    , coalesce((select'
      
        '                    list(cc.Cc_Value||iif(coalesce(cc.Cc_Notice,' +
        #39#39') <> '#39#39', '#39' ('#39'||cc.Cc_Notice||'#39')'#39', '#39#39'))'
      '                  from Customer_Contacts cc'
      '                  where cc.Customer_Id = c.Customer_Id'
      '                        and cc.Cc_Type = 1 @@ONLY_NOTYFY% @'
      '               ), '#39#39') as MOBILE_WN'
      '    , coalesce((select first 1'
      '                    cc.Cc_Value'
      '                  from Customer_Contacts cc'
      '                  where cc.Customer_Id = c.Customer_Id'
      '                        and cc.Cc_Type = 2'
      
        '                  order by cc.Cc_Notify desc), c.EMAIL, '#39#39') as E' +
        'MAIL                   '
      'FROM CUSTOMER C'
      '   INNER JOIN HOUSE H ON (C.HOUSE_ID = H.HOUSE_ID)'
      '   INNER JOIN STREET S ON (H.STREET_ID = S.STREET_ID)'
      
        '   left outer join houseflats hf on (hf.house_id = c.house_id an' +
        'd hf.flat_no = c.flat_no)'
      '   left outer join AREA a on (a.Area_Id = s.Area_Id)'
      '   left outer join SUBAREA sa on (sa.Subarea_Id = h.Subarea_Id)'
      'where'
      '  @@filter%1=2@'
      'union all'
      'select'
      '      '#39#1059#39' as O_TYPE'
      '    , c.Node_Id as CUSTOMER_ID'
      '    , '#39#39' as cust_code'
      '    , o.O_Name as Account_No'
      '    , '#39#39' as CUST_STATE_DESCR'
      '    , 0 as Debt_sum'
      '    , c.HOUSE_ID'
      '    , c.Place as FLAT_No'
      '    , '#39#39' as phone_no'
      '    , c.notice'
      '    , '#39#39' as HIS_COLOR'
      '    , c.Name FIO'
      '    , s.street_short || '#39' '#39' || S.Street_Name as street'
      '    , H.House_No'
      '    , h.Street_ID'
      '    , c.porch_n'
      '    , c.floor_n'
      '    , 0 Juridical'
      '    , '#39#39' Jur_Inn'
      '    , '#39#39' as MOBILE'
      
        '    , coalesce(a.Area_Name||coalesce('#39'. '#39'||sa.Subarea_Name, '#39#39'),' +
        ' '#39#39') as City'
      '    , '#39#39' as MOBILE_WN'
      '    , '#39#39' as EMAIL    '
      'FROM NODES C'
      '   INNER JOIN HOUSE H ON (C.HOUSE_ID = H.HOUSE_ID)'
      '   INNER JOIN STREET S ON (H.STREET_ID = S.STREET_ID)'
      
        '   inner join objects o on (o.O_Id = c.Type_Id and o.O_Type = 38' +
        ')'
      '   left outer join AREA a on (a.Area_Id = s.Area_Id)'
      '   left outer join SUBAREA sa on (sa.Subarea_Id = h.Subarea_Id)'
      'where'
      '  @@filter_node%1=2@')
    AutoCalcFields = False
    Transaction = trReadFind
    Database = dbTV
    AutoCommit = True
    Left = 232
    Top = 344
    oFetchAll = True
  end
  object trReadFind: TpFIBTransaction
    DefaultDatabase = dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 288
    Top = 344
  end
  object frxGaugeObject1: TfrxGaugeObject
    Left = 704
    Top = 272
  end
  object frxMapObject1: TfrxMapObject
    Left = 704
    Top = 368
  end
  object frxReportCellularTextObject1: TfrxReportCellularTextObject
    Left = 560
    Top = 480
  end
  object frxZipCodeObject1: TfrxZipCodeObject
    Left = 560
    Top = 424
  end
  object frxReportTableObject1: TfrxReportTableObject
    Left = 704
    Top = 320
  end
  object frxGZipCompressor1: TfrxGZipCompressor
    Left = 704
    Top = 424
  end
  object frxPDFObject1: TfrxPDFObject
    Left = 704
    Top = 480
  end
  object frxFIBComponents1: TfrxFIBComponents
    DefaultDatabase = dbTV
    Left = 696
    Top = 32
  end
end
