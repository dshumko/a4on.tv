object CustomerForm: TCustomerForm
  Left = 0
  Top = 0
  Caption = #1040#1073#1086#1085#1077#1085#1090
  ClientHeight = 500
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  Menu = mmCustomer
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 333
    Width = 759
    Height = 4
    Cursor = crVSplit
    Align = alTop
  end
  object pnlForms: TPanel
    Left = 0
    Top = 337
    Width = 759
    Height = 163
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object spl1: TSplitter
      Left = 145
      Top = 0
      Height = 163
    end
    object pnlDATA: TPanel
      Left = 148
      Top = 0
      Width = 611
      Height = 163
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
    end
    object dbgForms: TDBGridEh
      Left = 0
      Top = 0
      Width = 145
      Height = 163
      Align = alLeft
      AllowedOperations = []
      AllowedSelections = []
      AutoFitColWidths = True
      DataSource = srcPages
      DynProps = <>
      GridLineParams.DataHorzLines = False
      GridLineParams.DataVertLines = False
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      IndicatorOptions = []
      Options = [dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus]
      ReadOnly = True
      SelectionDrawParams.SelectionStyle = gsdsClassicEh
      SelectionDrawParams.DrawFocusFrame = True
      SelectionDrawParams.DrawFocusFrameStored = True
      TabOrder = 0
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 759
    Height = 25
    Caption = 'ToolBar1'
    Images = A4MainForm.ICONS_ACTIVE
    TabOrder = 0
    object ToolButton4: TToolButton
      Left = 0
      Top = 0
      Width = 5
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 5
      Top = 0
      Action = actEdit
    end
    object ToolButton8: TToolButton
      Left = 28
      Top = 0
      Width = 9
      Caption = 'ToolButton8'
      ImageIndex = 27
      Style = tbsSeparator
    end
    object btnFilterCustomer: TToolButton
      Left = 37
      Top = 0
      Action = actFilterCustomer
    end
    object sprtr1: TToolButton
      Left = 60
      Top = 0
      Width = 31
      Caption = 'sprtr1'
      ImageIndex = 27
      Style = tbsSeparator
      Visible = False
    end
    object ToolButton1: TToolButton
      Left = 91
      Top = 0
      Action = actSave
    end
    object sprtr2: TToolButton
      Left = 114
      Top = 0
      Width = 31
      Caption = 'sprtr2'
      ImageIndex = 27
      Style = tbsSeparator
      Visible = False
    end
    object ToolButton2: TToolButton
      Left = 145
      Top = 0
      Action = ActCancel
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 25
    Width = 759
    Height = 308
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object pnlMain: TPanel
      Left = 0
      Top = 0
      Width = 759
      Height = 308
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 296
    Top = 32
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 381
    Top = 41
  end
  object dsCustomer: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CUSTOMER'
      'SET '
      '    HOUSE_ID = :HOUSE_ID,'
      '    ACCOUNT_NO = :ACCOUNT_NO,'
      '    DOGOVOR_NO = :DOGOVOR_NO,'
      '    SURNAME = :SURNAME,'
      '    FIRSTNAME = :FIRSTNAME,'
      '    MIDLENAME = :MIDLENAME,'
      '    CONTRACT_DATE = :CONTRACT_DATE,'
      '    ACTIVIZ_DATE = :ACTIVIZ_DATE,'
      '    NOTICE = :NOTICE,'
      '    VALID_TO = :VALID_TO,'
      '    FLAT_NO = :FLAT_NO,'
      '    PASSPORT_NUMBER = :PASSPORT_NUMBER,'
      '    PASSPORT_REGISTRATION = :PASSPORT_REGISTRATION,'
      '    MANAGER_ID = :MANAGER_ID,'
      '    JURIDICAL = :JURIDICAL,'
      '    JUR_INN = :JUR_INN,'
      '    JUR_DIRECTOR = :JUR_DIRECTOR,'
      '    JUR_BUH = :JUR_BUH,'
      '    CGIS = :CGIS,'
      '    HIS_COLOR = :HIS_COLOR,'
      '    INVISIBLE = :INVISIBLE,'
      '    BIRTHDAY = :BIRTHDAY,'
      '    ADRES_REGISTR = :ADRES_REGISTR,'
      '    ORG_ID = :ORG_ID,'
      '    TAP    = :TAP,'
      '    vatg_id = :vatg_id,'
      '    SECRET = :SECRET,'
      '    PERSONAL_N = :PERSONAL_N,'
      '    HAND_CONTROL = :HAND_CONTROL,'
      '    BANK_ID = :BANK_ID,'
      '    BANK_ACCOUNT = :BANK_ACCOUNT,'
      '    External_id = :External_id,'
      '    CONTRACT_BASIS = :CONTRACT_BASIS      '
      'WHERE'
      '    CUSTOMER_ID = :OLD_CUSTOMER_ID')
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE DELETE_CUSTOMER(:CUSTOMER_ID)')
    InsertSQL.Strings = (
      'INSERT INTO CUSTOMER('
      '    CUSTOMER_ID,'
      '    HOUSE_ID,'
      '    ACCOUNT_NO,'
      '    DOGOVOR_NO,'
      '    SURNAME,'
      '    FIRSTNAME,'
      '    MIDLENAME,'
      '    CONTRACT_DATE,'
      '    ACTIVIZ_DATE,'
      '    NOTICE,'
      '    VALID_TO,'
      '    FLAT_NO,'
      '    PASSPORT_NUMBER,'
      '    PASSPORT_REGISTRATION,'
      '    MANAGER_ID,'
      '    JURIDICAL,'
      '    JUR_INN,'
      '    JUR_DIRECTOR,'
      '    JUR_BUH,'
      '    CGIS,'
      '    HIS_COLOR,'
      '    INVISIBLE,'
      '    BIRTHDAY,'
      '    ADRES_REGISTR,'
      '    ORG_ID,'
      '    TAP,'
      '    vatg_id,'
      '    SECRET,'
      '    PERSONAL_N,'
      '    HAND_CONTROL,'
      '    BANK_ID,'
      '    BANK_ACCOUNT,'
      '    External_id,'
      '    CONTRACT_BASIS'
      ')'
      'VALUES('
      '    :CUSTOMER_ID,'
      '    :HOUSE_ID,'
      '    :ACCOUNT_NO,'
      '    :DOGOVOR_NO,'
      '    :SURNAME,'
      '    :FIRSTNAME,'
      '    :MIDLENAME,'
      '    :CONTRACT_DATE,'
      '    :ACTIVIZ_DATE,'
      '    :NOTICE,'
      '    :VALID_TO,'
      '    :FLAT_NO,'
      '    :PASSPORT_NUMBER,'
      '    :PASSPORT_REGISTRATION,'
      '    :MANAGER_ID,'
      '    :JURIDICAL,'
      '    :JUR_INN,'
      '    :JUR_DIRECTOR,'
      '    :JUR_BUH,'
      '    :CGIS,'
      '    :HIS_COLOR,'
      '    :INVISIBLE,'
      '    :BIRTHDAY,'
      '    :ADRES_REGISTR,'
      '    :ORG_ID,'
      '    :TAP,'
      '    :vatg_id,'
      '    :SECRET,'
      '    :PERSONAL_N,'
      '    :HAND_CONTROL,'
      '    :BANK_ID,'
      '    :BANK_ACCOUNT,'
      '    :External_id,'
      '    :CONTRACT_BASIS'
      ')')
    RefreshSQL.Strings = (
      'select'
      'C.*'
      ',s.street_short'
      ',S.Street_Name'
      ',H.House_No'
      ',h.Street_ID'
      ',-1*c.debt_sum as BALANCE'
      
        ', (select count(*) from SUBSCR_SERV ss where ss.CUSTOMER_ID = c.' +
        'CUSTOMER_ID and ss.STATE_SGN = 1) as connected'
      'FROM CUSTOMER C'
      '   INNER JOIN HOUSE H ON (C.HOUSE_ID = H.HOUSE_ID)'
      '   INNER JOIN STREET S ON (H.STREET_ID = S.STREET_ID)'
      '   LEFT OUTER JOIN WORKGROUPS wg ON (WG.WG_ID = H.WG_ID)'
      'where(     C.CUSTOMER_ID = :OLD_CUSTOMER_ID     )')
    SelectSQL.Strings = (
      'select'
      'C.*'
      ',s.street_short'
      ',S.Street_Name'
      ',H.House_No'
      ',h.Street_ID'
      ',-1*c.debt_sum as BALANCE'
      ', hf.porch_n, hf.floor_n'
      'FROM CUSTOMER C'
      '   INNER JOIN HOUSE H ON (C.HOUSE_ID = H.HOUSE_ID)'
      '   INNER JOIN STREET S ON (H.STREET_ID = S.STREET_ID)'
      
        '   left outer join houseflats hf on (hf.house_id = c.house_id an' +
        'd hf.flat_no = c.flat_no)'
      'WHERE'
      'c.customer_id = :CUSTOMER_ID')
    AutoUpdateOptions.UpdateTableName = 'CUSTOMER'
    AutoUpdateOptions.KeyFields = 'CUSTOMER_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_CUSTOMER_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 110
    Top = 98
    poUseBooleanField = False
    poSetRequiredFields = True
    oVisibleRecno = True
    oFetchAll = True
  end
  object mmCustomer: TMainMenu
    Left = 121
    Top = 38
    object mmiCustomer: TMenuItem
      Caption = #1040#1073#1086#1085#1077#1085#1090
      GroupIndex = 2
      object N5: TMenuItem
        Action = actEdit
      end
      object N6: TMenuItem
        Action = actSave
      end
      object N7: TMenuItem
        Action = ActCancel
      end
      object N2: TMenuItem
        Action = actFilterCustomer
      end
      object miN1: TMenuItem
        Caption = '-'
      end
      object miActAddPayment: TMenuItem
        Action = ActAddPayment
      end
      object miRequest: TMenuItem
        Action = actRequest
      end
      object miRecAdd: TMenuItem
        Action = actRecAdd
      end
      object miNPS: TMenuItem
        Action = actNPS
      end
      object miPrepay: TMenuItem
        Action = actPrepay
      end
      object miCustNode: TMenuItem
        Action = actCustNode
      end
      object miTask: TMenuItem
        Action = actTask
      end
      object miOrderTP: TMenuItem
        Action = actOrderTP
      end
      object miN2: TMenuItem
        Caption = '-'
      end
      object miResetpassword: TMenuItem
        Action = actResetpassword
      end
      object miCheckPassport: TMenuItem
        Action = actCheckPassport
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object miDelete: TMenuItem
        Action = actDelete
      end
    end
  end
  object srcCustomer: TDataSource
    DataSet = dsCustomer
    Left = 196
    Top = 106
  end
  object Query: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select'
      'C.Account_No, C.Surname, C.Firstname, C.Midlename, '
      'c.Cust_Code, c.CUST_STATE_DESCR, c.DEBT_SUM'
      'FROM CUSTOMER C'
      '@filter'
      '')
    Left = 218
    Top = 37
  end
  object actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 267
    Top = 112
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1077#1095#1072#1090#1100
      ImageIndex = 5
      ShortCut = 16464
    end
    object actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      ImageIndex = 4
      ShortCut = 113
      OnExecute = actEditExecute
    end
    object actFilterCustomer: TAction
      Caption = #1053#1072#1081#1090#1080' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      ImageIndex = 9
      OnExecute = actFilterCustomerExecute
    end
    object actDouble: TAction
      Caption = #1044#1091#1073#1083#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1091
      Hint = #1044#1091#1073#1083#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1091
      ImageIndex = 13
    end
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 25
      ShortCut = 8305
      Visible = False
      OnExecute = actSaveExecute
    end
    object ActCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 26
      ShortCut = 27
      Visible = False
      OnExecute = ActCancelExecute
    end
    object actCustNode: TAction
      Caption = #1059#1079#1077#1083' '#1072#1073#1086#1085#1077#1085#1090#1072
      OnExecute = actCustNodeExecute
    end
    object actPrepay: TAction
      Caption = #1054#1073#1077#1097#1072#1085#1085#1099#1081' '#1087#1083#1072#1090#1077#1078
      OnExecute = actPrepayExecute
    end
    object actTask: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1076#1072#1095#1091'/'#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1076#1072#1095#1091'/'#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      ShortCut = 121
      OnExecute = actTaskExecute
    end
    object ActAddPayment: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1090#1077#1078' '#1072#1073#1086#1085#1077#1085#1090#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1090#1077#1078' '#1072#1073#1086#1085#1077#1085#1090#1091' '#1074' '#1086#1090#1082#1088#1099#1090#1099#1081' '#1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ShortCut = 117
      OnExecute = ActAddPaymentExecute
    end
    object actRequest: TAction
      Caption = #1047#1072#1103#1074#1082#1072
      Hint = #1055#1088#1080#1085#1103#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1086#1090' '#1072#1073#1086#1085#1077#1085#1090#1072
      ShortCut = 116
      OnExecute = actRequestExecute
    end
    object actRecAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      ShortCut = 119
      OnExecute = actRecAddExecute
    end
    object actNPS: TAction
      Caption = #1051#1086#1103#1083#1100#1085#1086#1089#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      ShortCut = 120
      OnExecute = actNPSExecute
    end
    object actResetpassword: TAction
      Caption = #1057#1073#1088#1086#1089' '#1087#1072#1088#1086#1083#1103
      Hint = #1057#1073#1088#1086#1089#1080#1090#1100' '#1089#1090#1072#1088#1099#1081' '#1087#1072#1088#1086#1083#1100' '#1080' '#1089#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081
      OnExecute = actResetpasswordExecute
    end
    object actCheckPassport: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1087#1072#1089#1087#1086#1088#1090
      Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' '#1087#1088#1086#1074#1077#1088#1082#1091' '#1076#1072#1085#1085#1099#1077' '#1087#1072#1089#1087#1086#1088#1090#1072
      OnExecute = actCheckPassportExecute
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
    end
    object actOrderTP: TAction
      Caption = #1057#1090#1086#1088#1086#1085#1085#1080#1081' '#1079#1072#1082#1072#1079
      OnExecute = actOrderTPExecute
    end
  end
  object prpstrgh1: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'pnlForms.dbgForms.<P>.Width'
      'pnlTop.<P>.Height')
    Left = 272
    Top = 201
  end
  object srcPages: TDataSource
    DataSet = mtbPages
    OnDataChange = srcPagesDataChange
    Left = 32
    Top = 432
  end
  object mtbPages: TMemTableEh
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 92
    Top = 435
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object ID: TMTNumericDataFieldEh
          FieldName = 'ID'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object NAME: TMTStringDataFieldEh
          FieldName = 'NAME'
          StringDataType = fdtStringEh
          DisplayWidth = 100
          Size = 255
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
end
