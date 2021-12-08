object OrderTPForm: TOrderTPForm
  Left = 545
  Top = 395
  Caption = #1057#1090#1086#1088#1086#1085#1085#1080#1081' '#1079#1072#1082#1072#1079
  ClientHeight = 428
  ClientWidth = 783
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object splitter: TSplitter
    Left = 429
    Top = 0
    Height = 387
    Align = alRight
    Visible = False
  end
  object pnl3: TPanel
    Left = 0
    Top = 387
    Width = 783
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      783
      41)
    object btnCancel: TBitBtn
      Left = 704
      Top = 9
      Width = 75
      Height = 26
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TBitBtn
      Left = 7
      Top = 9
      Width = 682
      Height = 26
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 429
    Height = 387
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlText: TPanel
      Left = 0
      Top = 168
      Width = 429
      Height = 219
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      DesignSize = (
        429
        219)
      object lbl4: TLabel
        Left = 7
        Top = 8
        Width = 37
        Height = 13
        Caption = #1057#1091#1084#1084#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 230
        Top = 8
        Width = 67
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
      end
      object mmoText: TDBMemoEh
        Left = 7
        Top = 32
        Width = 419
        Height = 187
        ScrollBars = ssVertical
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        DataField = 'NOTICE'
        DataSource = srcOrderTP
        DynProps = <>
        EditButtons = <>
        PopupMenu = pmSpell
        TabOrder = 2
        Visible = True
        WantReturns = True
        OnChange = mmoTextChange
        OnExit = mmoTextExit
      end
      object ednAMOUNT: TDBNumberEditEh
        Left = 64
        Top = 5
        Width = 129
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        currency = True
        DynProps = <>
        EditButton.Visible = True
        EditButtons = <>
        TabOrder = 0
        Visible = True
      end
      object edPAY_DATE: TDBDateTimeEditEh
        Left = 304
        Top = 5
        Width = 121
        Height = 21
        Anchors = [akTop, akRight]
        DataField = 'PAY_DATE'
        DataSource = srcOrderTP
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 1
        Visible = True
      end
    end
    object pnl2: TPanel
      Left = 0
      Top = 59
      Width = 429
      Height = 109
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        429
        109)
      object Label1: TLabel
        Left = 7
        Top = 4
        Width = 25
        Height = 13
        Caption = #1060#1048#1054
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 7
        Top = 32
        Width = 31
        Height = 13
        Caption = #1040#1076#1088#1077#1089
      end
      object Label3: TLabel
        Left = 7
        Top = 60
        Width = 42
        Height = 13
        Caption = #1055#1072#1089#1087#1086#1088#1090
      end
      object lbl3: TLabel
        Left = 7
        Top = 87
        Width = 44
        Height = 13
        Caption = #1058#1077#1083#1077#1092#1086#1085
      end
      object edtAdress: TDBEditEh
        Left = 64
        Top = 29
        Width = 361
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ADRESS'
        DataSource = srcOrderTP
        DynProps = <>
        EditButtons = <>
        MaxLength = 500
        TabOrder = 1
        Visible = True
      end
      object edtPassport: TDBEditEh
        Left = 64
        Top = 57
        Width = 361
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'PASSPORT'
        DataSource = srcOrderTP
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1055#1072#1089#1087#1086#1088#1090' '#1080#1083#1080' '#1080#1085#1099#1077' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077'  '#1076#1072#1085#1085#1099#1077
        MaxLength = 500
        TabOrder = 2
        Visible = True
      end
      object edtFIO: TDBEditEh
        Left = 64
        Top = 1
        Width = 361
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'FIO'
        DataSource = srcOrderTP
        DynProps = <>
        EditButtons = <>
        MaxLength = 255
        TabOrder = 0
        Visible = True
      end
      object edtPhone: TDBEditEh
        Left = 64
        Top = 84
        Width = 361
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'PHONE'
        DataSource = srcOrderTP
        DynProps = <>
        EditButtons = <>
        MaxLength = 50
        TabOrder = 3
        Visible = True
      end
    end
    object pnlNumber: TPanel
      Left = 0
      Top = 30
      Width = 429
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        429
        29)
      object lbl2: TLabel
        Left = 7
        Top = 7
        Width = 31
        Height = 13
        Caption = #1053#1086#1084#1077#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl6: TLabel
        Left = 266
        Top = 7
        Width = 31
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1044#1072#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtNumber: TDBEditEh
        Left = 64
        Top = 3
        Width = 129
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OTP_NUMBER'
        DataSource = srcOrderTP
        DynProps = <>
        EditButtons = <>
        MaxLength = 50
        TabOrder = 0
        Visible = True
      end
      object edOTP_DATE: TDBDateTimeEditEh
        Left = 304
        Top = 4
        Width = 121
        Height = 21
        Anchors = [akTop, akRight]
        DataField = 'OTP_DATE'
        DataSource = srcOrderTP
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        TabOrder = 1
        Visible = True
      end
    end
    object pnl1: TPanel
      Left = 0
      Top = 0
      Width = 429
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        429
        30)
      object lbl1: TLabel
        Left = 7
        Top = 9
        Width = 20
        Height = 13
        Caption = #1058#1080#1087
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lcbOTTP_TYPE: TDBLookupComboboxEh
        Left = 64
        Top = 6
        Width = 361
        Height = 22
        AutoSize = False
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'OTTP_TYPE'
        DataSource = srcOrderTP
        DropDownBox.Columns = <
          item
            FieldName = 'O_NAME'
          end
          item
            FieldName = 'O_DESCRIPTION'
          end>
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
        DropDownBox.UseMultiTitle = True
        DropDownBox.Sizable = True
        DropDownBox.Width = 150
        EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1090#1080#1087' '#1079#1072#1082#1072#1079#1072
        EditButtons = <>
        KeyField = 'O_ID'
        ListField = 'O_NAME'
        ListSource = srcOTPTypes
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnChange = lcbOTTP_TYPEChange
      end
    end
  end
  object pnlAddons: TPanel
    Left = 432
    Top = 0
    Width = 351
    Height = 387
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    OnResize = pnlAddonsResize
    DesignSize = (
      351
      387)
    object lblCharCNT: TLabel
      Left = 8
      Top = 33
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object pnlPeriod: TPanel
      Left = 0
      Top = 0
      Width = 351
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object lbl7: TLabel
        Left = 7
        Top = 9
        Width = 74
        Height = 13
        Caption = #1044#1072#1090#1099' '#1087#1077#1088#1080#1086#1076#1072
      end
      object edFROM: TDBDateTimeEditEh
        Left = 96
        Top = 6
        Width = 113
        Height = 21
        DataField = 'DATE_FROM'
        DataSource = srcOrderTP
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1053#1072#1095#1072#1083#1086' '#1087#1077#1088#1080#1086#1076#1072
        Kind = dtkDateEh
        TabOrder = 0
        Visible = True
        OnChange = edFROMChange
      end
      object edTO: TDBDateTimeEditEh
        Left = 224
        Top = 6
        Width = 121
        Height = 21
        DataField = 'DATE_TO'
        DataSource = srcOrderTP
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1087#1077#1088#1080#1086#1076#1072
        Kind = dtkDateEh
        TabOrder = 1
        Visible = True
        OnChange = edTOChange
      end
    end
    object dbgAddons: TDBGridEh
      Left = 6
      Top = 60
      Width = 339
      Height = 321
      AllowedOperations = [alopUpdateEh]
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = srcAddons
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      EmptyDataInfo.Text = #1057#1087#1080#1089#1086#1082' '#1076#1086#1087'. '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghExtendVertLines]
      SumList.Active = True
      TabOrder = 1
      OnExit = dbgAddonsExit
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'name'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1044#1086#1087'. '#1091#1089#1083#1091#1075#1072
          Width = 127
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'cost'
          Footers = <>
          ReadOnly = True
          Title.Alignment = taCenter
          Title.Caption = #1062#1077#1085#1072
          Width = 60
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'qnt'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Width = 49
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'rc'
          Footers = <>
          Title.Caption = #1050#1086#1101#1092#1092'.'
        end
        item
          CellButtons = <>
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'dc'
          Footers = <>
          ReadOnly = True
          Title.Caption = '* '#1076#1085#1077#1081
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'itog'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1048#1090#1086#1075#1086
          Width = 48
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object dsOrderTP: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE ORDERS_TP'
      'SET '
      '    OTTP_TYPE = :OTTP_TYPE,'
      '    OTP_NUMBER = :OTP_NUMBER,'
      '    OTP_DATE = :OTP_DATE,'
      '    FIO = :FIO,'
      '    ADRESS = :ADRESS,'
      '    PASSPORT = :PASSPORT,'
      '    PHONE = :PHONE,'
      '    NOTICE = :NOTICE,'
      '    QUANT = :QUANT,'
      '    PRICE = :PRICE,'
      '    AMOUNT = :AMOUNT,'
      '    PAY_DATE = :PAY_DATE,'
      '    CUSTOMER_ID = :CUSTOMER_ID,'
      '    DATE_FROM = :DATE_FROM,'
      '    DATE_TO = :DATE_TO,'
      '    Addons = :Addons'
      'WHERE'
      '  OTP_ID = :OTP_ID  ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    ORDERS_TP'
      'WHERE'
      '        ')
    InsertSQL.Strings = (
      'INSERT INTO ORDERS_TP('
      '    OTP_ID,'
      '    OTTP_TYPE,'
      '    OTP_NUMBER,'
      '    OTP_DATE,'
      '    FIO,'
      '    ADRESS,'
      '    PASSPORT,'
      '    PHONE,'
      '    NOTICE,'
      '    QUANT,'
      '    PRICE,'
      '    AMOUNT,'
      '    PAY_DATE,'
      '    CUSTOMER_ID,'
      '    DATE_FROM,'
      '    DATE_TO,'
      '    Addons'
      ')'
      'VALUES('
      '    :OTP_ID,'
      '    :OTTP_TYPE,'
      '    :OTP_NUMBER,'
      '    :OTP_DATE,'
      '    :FIO,'
      '    :ADRESS,'
      '    :PASSPORT,'
      '    :PHONE,'
      '    :NOTICE,'
      '    :QUANT,'
      '    :PRICE,'
      '    :AMOUNT,'
      '    :PAY_DATE,'
      '    :CUSTOMER_ID,'
      '    :DATE_FROM,'
      '    :DATE_TO,'
      '    :Addons'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    o.*'
      '  from Orders_Tp o'
      'where'
      ' o.Otp_Id = :OTPID')
    SelectSQL.Strings = (
      'select'
      '    o.*'
      '  from Orders_Tp o'
      'where'
      ' o.Otp_Id = :OTPID')
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    BeforePost = dsOrderTPBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 38
    Top = 320
  end
  object srcOrderTP: TDataSource
    AutoEdit = False
    DataSet = dsOrderTP
    Left = 36
    Top = 272
  end
  object dsOTPTypes: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_Id'
      '  , O_Name'
      '  , O_Description'
      '  , O_CHARFIELD'
      '  from objects'
      '  where O_Type = 22'
      '        and O_DELETED = 0'
      '  order by O_Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 170
    Top = 299
    oStartTransaction = False
    oFetchAll = True
  end
  object srcOTPTypes: TDataSource
    AutoEdit = False
    DataSet = dsOTPTypes
    Left = 171
    Top = 248
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 344
    Top = 328
  end
  object pmSpell: TPopupMenu
    Left = 256
    Top = 324
    object miactCnPrefixWizard: TMenuItem
      Action = A4MainForm.edtcpy1
    end
    object miactCnPrefixWizard1: TMenuItem
      Action = A4MainForm.edtpst1
    end
    object miN1: TMenuItem
      Caption = '-'
    end
    object miN2: TMenuItem
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1086#1088#1092#1086#1075#1088#1072#1092#1080#1102
      OnClick = miN2Click
    end
    object miN3: TMenuItem
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1086#1088#1092#1086#1075#1088#1072#1092#1080#1080
      OnClick = miN3Click
    end
  end
  object srcAddons: TDataSource
    DataSet = mtAddons
    Left = 616
    Top = 257
  end
  object mtAddons: TMemTableEh
    Params = <>
    AfterPost = mtAddonsAfterPost
    OnCalcFields = mtAddonsCalcFields
    Left = 539
    Top = 257
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object name: TMTStringDataFieldEh
          FieldName = 'name'
          StringDataType = fdtStringEh
          DisplayLabel = #1055#1072#1088#1072#1084#1077#1090#1088
          DisplayWidth = 50
          Size = 50
        end
        object cost: TMTNumericDataFieldEh
          FieldName = 'cost'
          NumericDataType = fdtCurrencyEh
          AutoIncrement = False
          DisplayLabel = #1062#1077#1085#1072' '#1092#1080#1079'.'
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object qnt: TMTNumericDataFieldEh
          FieldName = 'qnt'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object dc: TMTNumericDataFieldEh
          FieldName = 'dc'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object rc: TMTNumericDataFieldEh
          FieldName = 'rc'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object itog: TMTNumericDataFieldEh
          FieldName = 'itog'
          Calculated = True
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object NeedK: TMTBooleanDataFieldEh
          FieldName = 'NeedK'
          DisplayWidth = 20
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object PropStorageEh: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.Top'
      '<P>.Width'
      'pnlAddons.<P>.Width')
    Left = 474
    Top = 256
  end
end
