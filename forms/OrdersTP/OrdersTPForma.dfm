object OrdersTPForm: TOrdersTPForm
  Left = 256
  Top = 314
  Caption = #1057#1090#1086#1088#1086#1085#1085#1080#1077' '#1079#1072#1082#1072#1079#1099
  ClientHeight = 461
  ClientWidth = 901
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAll: TPanel
    Left = 0
    Top = 0
    Width = 901
    Height = 461
    Align = alClient
    TabOrder = 0
    object dbgOrdersTP: TDBGridEh
      Left = 1
      Top = 30
      Width = 899
      Height = 430
      Align = alClient
      AllowedOperations = []
      AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
      ColumnDefValues.ToolTips = True
      DataSource = srcOrdersTP
      DynProps = <>
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
      ParentShowHint = False
      PopupMenu = gridPopUp
      ReadOnly = True
      SearchPanel.Enabled = True
      ShowHint = True
      SortLocal = True
      STFilter.Local = True
      SumList.Active = True
      TabOrder = 1
      TitleParams.MultiTitle = True
      OnDblClick = dbgOrdersTPDblClick
      OnDataGroupGetRowText = dbgOrdersTPDataGroupGetRowText
      OnKeyPress = dbgOrdersTPKeyPress
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'OTP_NUMBER'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
          Title.TitleButton = True
          Width = 73
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'OTP_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'O_NAME'
          Footers = <>
          Title.Caption = #1058#1080#1087
          Title.TitleButton = True
          Width = 107
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FIO'
          Footers = <>
          Title.Caption = #1047#1072#1082#1072#1079#1095#1080#1082'|'#1060#1048#1054
          Title.TitleButton = True
          Width = 101
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADRESS'
          Footers = <>
          Title.Caption = #1047#1072#1082#1072#1079#1095#1080#1082'|'#1040#1076#1088#1077#1089
          Title.TitleButton = True
          Width = 90
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PASSPORT'
          Footers = <>
          Title.Caption = #1047#1072#1082#1072#1079#1095#1080#1082'|'#1055#1072#1089#1087#1086#1088#1090
          Title.TitleButton = True
          Width = 88
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PHONE'
          Footers = <>
          Title.Caption = #1047#1072#1082#1072#1079#1095#1080#1082'|'#1058#1077#1083#1077#1092#1086#1085
          Title.TitleButton = True
          Width = 82
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'AMOUNT'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DisplayFormat = 'dd.mm.yyyy'
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1086#1087#1083#1072#1090#1099
          Title.TitleButton = True
          Width = 69
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 133
          OnGetCellParams = dbgOrdersTPColumns9GetCellParams
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_NAME'
          Footers = <>
          Title.Caption = #1044#1086#1073#1072#1074#1080#1083'|'#1050#1090#1086
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_ON'
          Footers = <>
          Title.Caption = #1044#1086#1073#1072#1074#1080#1083'|'#1050#1086#1075#1076#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EDIT_NAME'
          Footers = <>
          Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1090#1086
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EDIT_ON'
          Footers = <>
          Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1086#1075#1076#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATE_FROM'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072'|'#1089
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATE_TO'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072'|'#1087#1086
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CANCEL_TIME'
          Footers = <>
          Title.Caption = #1054#1090#1084#1077#1085#1077#1085'|'#1050#1086#1075#1076#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CANCEL_RESON'
          Footers = <>
          Title.Caption = #1054#1090#1084#1077#1085#1077#1085'|'#1055#1088#1080#1095#1080#1085#1072
          Title.TitleButton = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object ToolBar3: TToolBar
      Left = 1
      Top = 1
      Width = 899
      Height = 29
      Caption = 'ToolBar2'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Images = A4MainForm.ICONS_ACTIVE
      TabOrder = 0
      object ToolButton14: TToolButton
        Left = 0
        Top = 0
        Action = actOTPNew
        Caption = 'W4w4'
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Action = actOTPEdit
      end
      object ToolButton6: TToolButton
        Left = 46
        Top = 0
        Action = actOTPDel
        Caption = 'W4w4'
      end
      object ToolButton16: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'W4w4'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 77
        Top = 0
        Action = actPrintDoc
        DropdownMenu = pmPrint
        Style = tbsDropDown
      end
      object ToolButton1: TToolButton
        Left = 115
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton20: TToolButton
        Left = 123
        Top = 0
        Width = 3
        Caption = 'ToolButton20'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object btnSetFilter: TToolButton
        Left = 126
        Top = 0
        Action = actSetFilter
        DropdownMenu = pmFilter
        Style = tbsDropDown
      end
      object ToolButton27: TToolButton
        Left = 164
        Top = 0
        Action = actQuickFilter
      end
      object btn1: TToolButton
        Left = 187
        Top = 0
        Width = 18
        Caption = 'btn1'
        ImageIndex = 41
        Style = tbsSeparator
      end
      object btnCustomers: TToolButton
        Left = 205
        Top = 0
        Action = actCustomers
      end
      object ToolButton9: TToolButton
        Left = 228
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 42
        Style = tbsSeparator
      end
      object btnAddPayment: TToolButton
        Left = 236
        Top = 0
        Action = actAddPayment
      end
      object ToolButton3: TToolButton
        Left = 259
        Top = 0
        Width = 8
        Caption = 'ToolButton3'
        ImageIndex = 56
        Style = tbsSeparator
      end
      object chkTREE: TCheckBox
        Left = 267
        Top = 0
        Width = 165
        Height = 22
        Action = actGroup
        BiDiMode = bdRightToLeft
        ParentBiDiMode = False
        TabOrder = 0
      end
    end
  end
  object alGuide: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 272
    Top = 112
    object actOTPNew: TAction
      Caption = #1053#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 2
      ShortCut = 45
      OnExecute = actOTPNewExecute
    end
    object actOTPEdit: TAction
      Caption = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072
      Hint = #1050#1086#1088#1088#1077#1082#1090#1080#1088#1086#1074#1082#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      ImageIndex = 4
      ShortCut = 113
      OnExecute = actOTPEditExecute
    end
    object actOTPDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 3
      ShortCut = 16430
      OnExecute = actOTPDelExecute
    end
    object actOTPSearch: TAction
      Caption = #1055#1086#1080#1089#1082
      Hint = #1055#1086#1080#1089#1082'|'#1041#1099#1089#1090#1088#1099#1081' '#1087#1086#1080#1089#1082' '#1087#1086' '#1086#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1085#1085#1086#1084#1091' '#1089#1090#1086#1083#1073#1094#1091
      ImageIndex = 7
      ShortCut = 16454
    end
    object actOTPSetPeriod: TAction
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1077#1088#1080#1086#1076
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1077#1088#1080#1086#1076' '#1086#1090#1073#1086#1088#1072' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 1
      ShortCut = 16452
      OnExecute = actOTPSetPeriodExecute
    end
    object actOTPFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1090#1080#1087#1091
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1090#1080#1087#1091' '#1079#1072#1082#1072#1079#1072
      ImageIndex = 0
    end
    object actPrintDoc: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' / '#1087#1077#1095#1072#1090#1100' '#1087#1072#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1084
      ImageIndex = 5
      ShortCut = 16464
      OnExecute = actPrintDocExecute
    end
    object actQuickFilter: TAction
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083'/'#1042#1099#1082#1083' '#1073#1099#1089#1090#1088#1086#1075#1086' '#1092#1080#1083#1100#1090#1088#1072
      ImageIndex = 40
      ShortCut = 16465
      OnExecute = actQuickFilterExecute
    end
    object actGroup: TAction
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1091
      OnExecute = actGroupExecute
    end
    object actCustomers: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1072#1073#1086#1085#1077#1085#1090#1072#1093
      ImageIndex = 9
      OnExecute = actCustomersExecute
    end
    object actAddPayment: TAction
      Caption = #1055#1083#1072#1090#1077#1078' '#1072#1073#1086#1085#1077#1085#1090#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1090#1077#1078' '#1072#1073#1086#1085#1077#1085#1090#1091' '#1074' '#1086#1090#1082#1088#1099#1090#1099#1081' '#1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 55
      ShortCut = 117
      OnExecute = actAddPaymentExecute
    end
    object actMakeCopy: TAction
      Caption = #1057#1076#1077#1083#1072#1090#1100' '#1082#1086#1087#1080#1102' '#1079#1072#1082#1072#1079#1072
      OnExecute = actMakeCopyExecute
    end
    object actCancel: TAction
      Caption = #1057#1085#1103#1090#1100' '#1079#1072#1082#1072#1079
      Hint = #1057#1085#1103#1090#1100'/'#1054#1090#1084#1077#1085#1080#1090#1100' '#1079#1072#1082#1072#1079
      OnExecute = actCancelExecute
    end
    object actPrintOrder: TAction
      Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1079#1072#1082#1072#1079
      OnExecute = actPrintOrderExecute
    end
    object actSetFilter: TAction
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 0
      ShortCut = 114
      OnExecute = actSetFilterExecute
    end
    object actEnableFilter: TAction
      Caption = #1042#1082#1083'/'#1042#1099#1082#1083'. '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100'/'#1074#1099#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ShortCut = 16498
      OnExecute = actEnableFilterExecute
    end
    object actSetNewFilterNew: TAction
      Caption = #1053#1086#1074#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1092#1080#1083#1100#1090#1088' '#1089' '#1086#1095#1080#1089#1090#1082#1086#1081' '#1089#1090#1072#1088#1086#1075#1086
      ImageIndex = 0
      ShortCut = 8306
    end
  end
  object gridPopUp: TPopupMenu
    Left = 164
    Top = 150
    object miN15: TMenuItem
      Action = actPrintOrder
    end
    object miMakeCopy: TMenuItem
      Action = actMakeCopy
    end
    object miSC: TMenuItem
      Caption = '-'
    end
    object miCancel: TMenuItem
      Action = actCancel
    end
    object miN14: TMenuItem
      Caption = '-'
    end
    object ppmCopy: TMenuItem
      Caption = '&'#1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = ppmCopyClick
    end
    object ppmSelectAll: TMenuItem
      Caption = '&'#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnClick = ppmSelectAllClick
    end
    object MenuItem1: TMenuItem
      Caption = '-'
    end
    object ppmSaveSelection: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082' ...'
      OnClick = ppmSaveSelectionClick
    end
  end
  object dsOrdersTP: TpFIBDataSet
    DeleteSQL.Strings = (
      'execute block(OID D_Integer = :OLD_OTP_ID) as'
      'declare variable c D_Uid_Null;'
      'declare variable a D_N15_2;'
      'declare variable n D_VARCHAR50;'
      'begin'
      
        'select Customer_Id, Amount, Otp_Number from ORDERS_TP WHERE OTP_' +
        'ID = :OID into :c, :a, :n;'
      'DELETE FROM ORDERS_TP WHERE OTP_ID = :OID;'
      
        'DELETE FROM SINGLE_SERV WHERE Customer_Id = :c and Units = :a an' +
        'd History_Id = :oid and Notice like '#39'%:'#39'||(:n)||'#39'%'#39';'
      'end')
    RefreshSQL.Strings = (
      'select'
      '    O.*'
      '  , t.O_Name'
      '  , t.O_Charfield'
      '  , coalesce((select first 1'
      '                  w.Surname'
      '                from worker w'
      
        '                where w.Ibname = o.ADDED_BY), o.ADDED_BY) as ADD' +
        'ED_NAME'
      '  , coalesce((select first 1'
      '                  w.Surname'
      '                from worker w'
      
        '                where w.Ibname = o.Edit_By), o.Edit_By) as Edit_' +
        'NAME'
      '  from Orders_Tp O'
      
        '       left outer join Objects t on (o.Ottp_Type = t.O_Id and t.' +
        'O_Type = 22)'
      '  where O.OTP_ID = :OLD_OTP_ID')
    SelectSQL.Strings = (
      'select'
      '    O.*'
      '  , t.O_Name'
      '  , t.O_Charfield'
      '  , coalesce((select first 1'
      '                  w.Surname'
      '                from worker w'
      
        '                where w.Ibname = o.ADDED_BY), o.ADDED_BY) as ADD' +
        'ED_NAME'
      '  , coalesce((select first 1'
      '                  w.Surname'
      '                from worker w'
      
        '                where w.Ibname = o.Edit_By), o.Edit_By) as Edit_' +
        'NAME'
      '  from Orders_Tp O'
      
        '       left outer join Objects t on (o.Ottp_Type = t.O_Id and t.' +
        'O_Type = 22)'
      '  where @@filter%1=1@ '
      '         ')
    AutoUpdateOptions.UpdateTableName = 'PAY_DOC'
    AutoUpdateOptions.KeyFields = 'PAY_DOC_ID'
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DefaultFormats.NumericDisplayFormat = '#'
    Left = 124
    Top = 353
    poImportDefaultValues = False
    oRefreshAfterPost = False
    oRefreshDeletedRecord = True
  end
  object srcOrdersTP: TDataSource
    AutoEdit = False
    DataSet = dsOrdersTP
    Left = 55
    Top = 357
  end
  object frxDBOrdersTP: TfrxDBDataset
    UserName = #1057#1058#1054#1056#1054#1053#1053#1048#1045'_'#1047#1040#1050#1040#1047#1067
    OnCheckEOF = frxDBOrdersTPCheckEOF
    OnFirst = frxDBOrdersTPFirst
    OnNext = frxDBOrdersTPNext
    CloseDataSource = False
    FieldAliases.Strings = (
      'OTP_ID='#1050#1054#1044'_'#1047#1040#1050#1040#1047#1040
      'OTP_NUMBER='#1053#1054#1052#1045#1056'_'#1047#1040#1050#1040#1047#1040
      'OTP_DATE='#1044#1040#1058#1040'_'#1047#1040#1050#1040#1047#1040
      'FIO='#1060#1048#1054
      'ADRESS='#1040#1044#1056#1045#1057
      'PASSPORT='#1055#1040#1057#1055#1054#1056#1058
      'PHONE='#1058#1045#1051#1045#1060#1054#1053
      'AMOUNT='#1057#1059#1052#1052#1040
      'PAY_DATE='#1044#1040#1058#1040'_'#1055#1051#1040#1058#1045#1046#1040
      'NOTICE='#1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
      'O_NAME='#1058#1048#1055)
    DataSet = dsOrdersTP
    BCDToCurrency = False
    DataSetOptions = []
    Left = 315
    Top = 211
  end
  object qDetailCount: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select count(*) from payment p where p.pay_doc_id = :pay_doc_id')
    Left = 128
    Top = 216
    qoStartTransaction = True
  end
  object MainMenu1: TMainMenu
    Left = 520
    Top = 184
    object N5: TMenuItem
      Caption = #1057#1090#1086#1088#1086#1085#1085#1080#1077' '#1079#1072#1082#1072#1079#1099
      GroupIndex = 4
      object N10: TMenuItem
        Action = actOTPSetPeriod
      end
      object N11: TMenuItem
        Action = actOTPFilter
      end
      object N15: TMenuItem
        Action = actQuickFilter
      end
      object N13: TMenuItem
        Action = actGroup
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object N6: TMenuItem
        Action = actOTPNew
      end
      object N7: TMenuItem
        Action = actOTPEdit
      end
      object miMakeCopyMM: TMenuItem
        Action = actMakeCopy
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object mmiCancel: TMenuItem
        Action = actCancel
      end
      object miN19: TMenuItem
        Caption = '-'
      end
      object miPrintOrder: TMenuItem
        Action = actPrintOrder
      end
      object N12: TMenuItem
        Action = actPrintDoc
      end
      object miN16: TMenuItem
        Caption = '-'
      end
      object miCustomers: TMenuItem
        Action = actCustomers
      end
      object miAddPayment: TMenuItem
        Action = actAddPayment
      end
    end
  end
  object mtOrdersTP: TMemTableEh
    Params = <>
    DataDriver = drvOrdersTP
    Left = 378
    Top = 135
  end
  object drvOrdersTP: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <
      item
        DataType = ftInteger
        Name = 'RQ_ID'
        ParamType = ptInput
      end>
    DeleteCommand.CommandText.Strings = (
      'DELETE FROM   REQUEST WHERE   RQ_ID = :RQ_ID')
    GetrecCommand.Params = <
      item
        DataType = ftInteger
        Name = 'RQ_ID'
        ParamType = ptInput
      end>
    GetrecCommand.CommandText.Strings = (
      'SELECT r.RQ_ID, '
      'r.RQ_TYPE, '
      'R.added_on RQ_DATE, '
      'r.RQ_CUSTOMER, '
      'r.RQ_COMPLETED,'
      'r.RQ_PLAN_DATE,'
      'coalesce(r.Rq_Defect, r.Rq_Content) as trouble,'
      'r.RQ_NOTICE,'
      'r.EDIT_BY,'
      'r.EDIT_ON, '
      'r.HOUSE_ID, '
      'r.FLAT_NO, '
      'r.PORCH_N, '
      'r.FLOOR_N, '
      'r.PHONE, '
      'r.ADDED_BY, '
      'r.ADDED_ON, '
      'r.RQ_TIME_FROM,'
      'r.RQ_TIME_TO,'
      
        'coalesce(cast(r.RQ_EXEC_TIME as date), cast(r.RQ_COMPLETED as da' +
        'te)) as GIV_EXEC_DATE,'
      
        'iif(cast(r.RQ_COMPLETED as date) is null,r.RQ_TIME_FROM, lpad(ex' +
        'tract(HOUR from r.RQ_COMPLETED),2,'#39'0'#39')||'#39':'#39'||extract(minute from' +
        ' r.RQ_COMPLETED)) as G_E_FROM,'
      
        'iif(cast(r.RQ_EXEC_TIME as date) is null,r.RQ_TIME_TO, extract(H' +
        'OUR from r.RQ_EXEC_TIME)||'#39':'#39'||extract(minute from r.RQ_EXEC_TIM' +
        'E)) as G_E_TO,'
      'r.RQ_EXEC_TIME,'
      'r.GIVE_BY, '
      'r.GIVE_METHOD, '
      'r.REQ_RESULT,'
      'c.ACCOUNT_NO, c.CUST_CODE, c.SURNAME ||'#39' '#39' ||c.INITIALS as FIO, '
      
        'coalesce(RT.RT_PRINTFORM,'#39#39') as REPORT, coalesce(rt.RT_Name,'#39#39') ' +
        'as Rt_Name,'
      's.STREET_NAME||'#39' '#39'||s.street_short as STREET_NAME,'
      'h.HOUSE_NO,'
      'coalesce(r.flat_no,'#39#39') as FLAT_NO,'
      'CASE R.Req_Result'
      ' when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      ' when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      ' when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      ' when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      'end as Res_text,'
      '--rt.O_Numericfield as DAYS,'
      '1 as DAYS,'
      
        'coalesce(cast((select list(DISTINCT w.team) from Request_Executo' +
        'rs re inner join Worker w on (re.Exec_Id = w.Worker_Id) where re' +
        '.Rq_Id = r.Rq_Id) as VARCHAR(200)),'
      'wg.name) as TEAM'
      ''
      'FROM REQUEST R'
      '   inner join house h on (r.house_id = h.house_id)'
      '   inner join street s on (s.street_id = h.street_id)'
      '   left outer join workgroups wg on (wg.wg_id = h.wg_id)'
      '   LEFT OUTER JOIN REQUEST_TYPES RT ON (R.RQ_TYPE = RT.RT_Id)'
      '   LEFT OUTER JOIN CUSTOMER C ON (R.RQ_CUSTOMER = C.CUSTOMER_ID)'
      ' WHERE '
      '        R.RQ_ID = :RQ_ID'
      '    ')
    ProviderDataSet = dsOrdersTP
    KeyFields = 'payment_id'
    Left = 457
    Top = 135
  end
  object pmFilter: TPopupMenu
    Left = 52
    Top = 202
    object N1: TMenuItem
      Caption = #1055#1088#1080#1085#1103#1090#1099' '#1089#1077#1075#1086#1076#1085#1103
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #1055#1088#1080#1085#1103#1090#1099' '#1074#1095#1077#1088#1072
      OnClick = N4Click
    end
    object miN18: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1053#1072' '#1089#1077#1075#1086#1076#1085#1103
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1053#1072' '#1074#1095#1077#1088#1072
      OnClick = N3Click
    end
    object miN17: TMenuItem
      Caption = '-'
    end
    object miEnableFilter: TMenuItem
      Action = actEnableFilter
    end
    object miSetNewFilterNew: TMenuItem
      Action = actSetNewFilterNew
      OnClick = miSetNewFilterNewClick
    end
    object N42: TMenuItem
      Caption = '-'
    end
    object N36: TMenuItem
      Action = actQuickFilter
    end
  end
  object dsFilter: TMemTableEh
    Params = <>
    OnNewRecord = dsFilterNewRecord
    Left = 515
    Top = 283
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object inversion: TMTBooleanDataFieldEh
          FieldName = 'inversion'
          DefaultExpression = 'False'
          DisplayWidth = 20
        end
        object next_condition: TMTNumericDataFieldEh
          FieldName = 'next_condition'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DefaultExpression = '0'
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object DT: TMTNumericDataFieldEh
          FieldName = 'DT'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object DS: TMTDateTimeDataFieldEh
          FieldName = 'DS'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object DE: TMTDateTimeDataFieldEh
          FieldName = 'DE'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object ORDER_TYPE: TMTNumericDataFieldEh
          FieldName = 'ORDER_TYPE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'LETTERS_TYPE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object INCL: TMTStringDataFieldEh
          FieldName = 'INCL'
          StringDataType = fdtStringEh
          DisplayWidth = 100
          Size = 100
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object pmPrint: TPopupMenu
    Left = 712
    Top = 184
    object miPrintOrder1: TMenuItem
      Action = actPrintOrder
    end
  end
end
