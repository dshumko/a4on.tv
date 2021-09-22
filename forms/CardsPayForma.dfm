object fmCardsPay: TfmCardsPay
  ShowHint = True
  Left = 450
  Top = 293
  Caption = #1050#1072#1088#1090#1099' '#1086#1087#1083#1072#1090#1099
  ClientHeight = 476
  ClientWidth = 879
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = mm1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdhCardPay: TDBGridEh
    Left = 0
    Top = 25
    Width = 879
    Height = 451
    Align = alClient
    AllowedOperations = []
    AutoFitColWidths = False
    DataSource = srcCardPay
    DynProps = <>
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
    PopupMenu = pmGrid
    SortLocal = True
    STFilter.Local = True
    SumList.Active = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    OnSortMarkingChanged = dbgrdhCardPaySortMarkingChanged
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CS_SERIAL'
        Footer.FieldName = 'CARD_ID'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1057#1077#1088#1080#1103
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CARD_NUMBER'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
        Title.TitleButton = True
        Width = 116
      end
      item
        CellButtons = <>
        DisplayFormat = '# ### ###'
        DynProps = <>
        EditButtons = <>
        FieldName = 'CARD_NOMINAL'
        Footer.DisplayFormat = '# ### ### ###'
        Footer.FieldName = 'CARD_NOMINAL'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1053#1086#1084#1080#1085#1072#1083
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_ON'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072'|'#1089#1086#1079#1076#1072#1085#1080#1103
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EXPIRATION_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072'|'#1076#1086'..'
        Title.Hint = #1044#1077#1081#1089#1090#1074#1080#1090#1077#1083#1100#1085#1072' '#1076#1086' '#1076#1072#1090#1099
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PAY_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072'|'#1072#1082#1090#1080#1074#1072#1094#1080#1080
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACCOUNT_NO'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1051#1080#1094#1077#1074#1086#1081
        Title.TitleButton = True
        Width = 71
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1050#1086#1076
        Title.TitleButton = True
        Width = 63
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FIO'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1060#1048#1054
        Title.TitleButton = True
        Width = 136
      end
      item
        CellButtons = <>
        DisplayFormat = '# ### ### ###'
        DynProps = <>
        EditButtons = <>
        FieldName = 'DEBT_SUM'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1057#1072#1083#1100#1076#1086
        Title.TitleButton = True
        Width = 65
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object tlb1: TToolBar
    Left = 0
    Top = 0
    Width = 879
    Height = 25
    Caption = 'tlb1'
    Images = A4MainForm.ICONS_ACTIVE
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 94
      Height = 22
      BevelOuter = bvNone
      TabOrder = 0
      object SpeedButton2: TSpeedButton
        Left = 4
        Top = 0
        Width = 90
        Height = 22
        Hint = #1055#1086#1080#1089#1082'|'#1055#1086#1080#1089#1082
        Caption = #1055#1086#1080#1089#1082
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Layout = blGlyphRight
        ParentFont = False
        Spacing = 10
        OnClick = SpeedButton2Click
      end
    end
    object edSearch: TEdit
      Left = 94
      Top = 0
      Width = 121
      Height = 22
      TabOrder = 1
      OnChange = edSearchChange
      OnKeyDown = edSearchKeyDown
    end
    object ToolButton14: TToolButton
      Left = 215
      Top = 0
      Hint = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1099#1081' '#1087#1086#1080#1089#1082' '
      Caption = 'ToolButton14'
      ImageIndex = 7
      OnClick = ToolButton14Click
    end
    object btn1: TToolButton
      Left = 238
      Top = 0
      Width = 5
      Caption = 'btn1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnNew: TToolButton
      Left = 243
      Top = 0
      Action = actNew
    end
    object btn3: TToolButton
      Left = 266
      Top = 0
      Width = 4
      Caption = 'btn3'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnEdit: TToolButton
      Left = 270
      Top = 0
      Action = actActivateCard
    end
    object btn5: TToolButton
      Left = 293
      Top = 0
      Width = 4
      Caption = 'btn5'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object btnDelete: TToolButton
      Left = 297
      Top = 0
      Action = actDelete
    end
    object btn2: TToolButton
      Left = 320
      Top = 0
      Width = 8
      Caption = 'btn2'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object btnQuickFiltr: TToolButton
      Left = 328
      Top = 0
      Action = actQuickFiltr
    end
    object btn4: TToolButton
      Left = 351
      Top = 0
      Width = 8
      Caption = 'btn4'
      ImageIndex = 41
      Style = tbsSeparator
    end
    object btnPrintCARDS: TToolButton
      Left = 359
      Top = 0
      Action = actPrintCARDS
    end
  end
  object mm1: TMainMenu
    Left = 128
    Top = 205
    object N1: TMenuItem
      Caption = #1050#1072#1088#1090#1099' '#1086#1087#1083#1072#1090#1099
      GroupIndex = 1
      object N2: TMenuItem
        Action = actNew
      end
      object actPaymentEdit1: TMenuItem
        Action = actActivateCard
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Action = actDelete
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N9: TMenuItem
        Action = actCardPaySettings
      end
    end
  end
  object srcCardPay: TDataSource
    AutoEdit = False
    DataSet = dsCardPay
    Left = 72
    Top = 56
  end
  object dsCardPay: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CARDS_PREPAY'
      'WHERE'
      '        CARD_ID = :OLD_CARD_ID'
      '    ')
    RefreshSQL.Strings = (
      'SELECT '
      '    Cs.Cs_Serial,'
      '    Cp.Card_Number,'
      '    Cp.Card_Nominal,'
      '    Cp.Card_Pin,'
      '    Cp.Expiration_Date,'
      '    P.Pay_Date,'
      '    C.Account_No,'
      '    C.Cust_Code,'
      '    C.Surname||'#39' '#39'||C.Initials as FIO,'
      '    C.Debt_Sum,'
      '    cp.CARD_ID,'
      '    C.Customer_Id, '
      '    cp.Added_on'
      ''
      'FROM Cards_Prepay Cp'
      '   INNER JOIN Cards_Serials Cs ON (Cp.Card_Serial = Cs.Cs_Id)'
      '   LEFT OUTER JOIN Payment P ON (Cp.Payment_Id = P.Payment_Id)'
      '   LEFT OUTER JOIN Customer C ON (P.Customer_Id = C.Customer_Id)'
      ''
      ' WHERE '
      '        CP.CARD_ID = :OLD_CARD_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT '
      '    Cs.Cs_Serial,'
      '    Cp.Card_Number,'
      '    Cp.Card_Nominal,'
      '    Cp.Card_Pin,'
      '    Cp.Expiration_Date,'
      '    P.Pay_Date,'
      '    C.Account_No,'
      '    C.Cust_Code,'
      '    C.Surname||'#39' '#39'||C.Initials as FIO,'
      '    C.Debt_Sum,'
      '    cp.CARD_ID,'
      '    C.Customer_Id, '
      '    cp.Added_on'
      ''
      'FROM Cards_Prepay Cp'
      '   INNER JOIN Cards_Serials Cs ON (Cp.Card_Serial = Cs.Cs_Id)'
      '   LEFT OUTER JOIN Payment P ON (Cp.Payment_Id = P.Payment_Id)'
      '   LEFT OUTER JOIN Customer C ON (P.Customer_Id = C.Customer_Id)')
    AutoUpdateOptions.UpdateTableName = 'AREA'
    AutoUpdateOptions.KeyFields = 'AREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 184
    Top = 56
  end
  object actlstactions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 270
    Top = 136
    object actNew: TAction
      Caption = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1082#1072#1088#1090
      Hint = #1043#1077#1085#1077#1088#1072#1094#1080#1103' '#1085#1086#1074#1099#1093' '#1082#1072#1088#1090
      ImageIndex = 2
      ShortCut = 45
      OnExecute = actNewExecute
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1077#1085#1080#1077' '#1082#1072#1088#1090
      Hint = #1059#1076#1072#1083#1077#1085#1077#1080' '#1082#1072#1088#1090
      ImageIndex = 3
      ShortCut = 16430
      OnExecute = actDeleteExecute
    end
    object actActivateCard: TAction
      Caption = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100' '#1082#1072#1088#1090#1091
      Hint = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100' '#1082#1072#1088#1090#1091' '#1086#1087#1083#1072#1090#1099
      ImageIndex = 4
      ShortCut = 113
      OnExecute = actActivateCardExecute
    end
    object actQuickFiltr: TAction
      Caption = #1041#1099#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 40
      OnExecute = actQuickFiltrExecute
    end
    object actPrintCARDS: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1082#1072#1088#1090' '#1086#1087#1083#1072#1090#1099
      ImageIndex = 5
      OnExecute = actPrintCARDSExecute
    end
    object actCardPaySettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 29
      OnExecute = actCardPaySettingsExecute
    end
  end
  object pmGrid: TPopupMenu
    Left = 448
    Top = 248
    object N5: TMenuItem
      Caption = #1057#1082#1086#1087#1080#1088#1074#1072#1090#1100
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1082'...'
      OnClick = N7Click
    end
  end
  object frxCards: TfrxDBDataset
    UserName = #1050#1040#1056#1058#1054#1063#1050#1048
    OnCheckEOF = frxCardsCheckEOF
    OnFirst = frxCardsFirst
    OnNext = frxCardsNext
    OnPrior = frxCardsPrior
    CloseDataSource = False
    FieldAliases.Strings = (
      'CS_SERIAL='#1057#1045#1056#1048#1071
      'CARD_NUMBER='#1053#1054#1052#1045#1056
      'CARD_NOMINAL='#1053#1054#1052#1048#1053#1040#1051
      'CARD_PIN='#1055#1048#1053
      'EXPIRATION_DATE='#1044#1040#1058#1040'_'#1044#1054
      'PAY_DATE='#1044#1040#1058#1040'_'#1040#1050#1058#1048#1042#1040#1062#1048#1048
      'ACCOUNT_NO='#1051#1048#1062#1045#1042#1054#1049' '#1040#1041#1054#1053#1045#1053#1058#1040
      'CUST_CODE='#1050#1054#1044' '#1040#1041#1054#1053#1045#1053#1058#1040
      'FIO='#1060#1048#1054
      'DEBT_SUM='#1057#1040#1051#1068#1044#1054
      'CARD_ID=CARD_ID'
      'CUSTOMER_ID=CUSTOMER_ID'
      'ADDED_ON='#1050#1040#1056#1058#1040' '#1057#1054#1047#1044#1040#1053#1040)
    OpenDataSource = False
    DataSet = dsCardPay
    BCDToCurrency = False
    Left = 144
    Top = 264
  end
end
