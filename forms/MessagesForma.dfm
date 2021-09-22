object MessagesForm: TMessagesForm
  Left = 256
  Top = 314
  Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1103' '#1079#1072' '#1087#1077#1088#1080#1086#1076
  ClientHeight = 450
  ClientWidth = 917
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
  ShowHint = True
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
    Width = 917
    Height = 450
    Align = alClient
    TabOrder = 0
    object dbgMessages: TDBGridEh
      Left = 1
      Top = 257
      Width = 915
      Height = 192
      Align = alClient
      AllowedOperations = []
      AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
      DataSource = srcMessages
      DynProps = <>
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
      PopupMenu = gridPopUp
      ReadOnly = True
      SearchPanel.Enabled = True
      SortLocal = True
      STFilter.Local = True
      SumList.Active = True
      TabOrder = 2
      TitleParams.MultiTitle = True
      OnDblClick = dbgMessagesDblClick
      OnDataGroupGetRowText = dbgMessagesDataGroupGetRowText
      OnGetFooterParams = dbgMessagesGetFooterParams
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MES_TYPE'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077'|'#1058#1080#1087
          Title.TitleButton = True
          Width = 36
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RECIVER'
          Footers = <>
          Title.Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077'|'#1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
          Title.TitleButton = True
          Width = 90
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MES_TEXT'
          Footers = <>
          Title.Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077'|'#1058#1077#1082#1089#1090
          Title.TitleButton = True
          Width = 160
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RES_TEXT'
          Footers = <>
          Title.Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077'|'#1057#1090#1072#1090#1091#1089
          Title.TitleButton = True
          Width = 67
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'SEND_DATE'
          Footers = <>
          Title.Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077'|'#1042#1088#1077#1084#1103' '#1086#1090#1087'-'#1082#1080
          Title.TitleButton = True
          Width = 80
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MES_PRIOR'
          Footers = <>
          Title.Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077'|'#1055#1088'-'#1090
          Title.Hint = #1055#1088#1080#1086#1088#1080#1090#1077#1090
          Title.TitleButton = True
          Width = 44
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ACCOUNT_NO'
          Footers = <>
          Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1051#1080#1094#1077#1074#1086#1081
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'SURNAME'
          Footers = <>
          Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1060#1072#1084#1080#1083#1080#1103
          Title.TitleButton = True
          Width = 105
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'INITIALS'
          Footers = <>
          Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1048'.'#1054'.'
          Title.TitleButton = True
          Width = 32
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DEBT_SUM'
          Footers = <>
          Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1057#1072#1083#1100#1076#1086
          Title.TitleButton = True
          Width = 52
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CUST_STATE_DESCR'
          Footers = <>
          Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1057#1090#1072#1090#1091#1089
          Title.TitleButton = True
          Width = 141
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STREET_SHORT'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089'| '
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STREET_NAME'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089'|'#1059#1083#1080#1094#1072
          Title.TitleButton = True
          Width = 135
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'HOUSE_NO'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089'|'#1044#1086#1084
          Title.TitleButton = True
          Width = 54
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FLAT_NO'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089'|'#1050#1074
          Title.TitleButton = True
          Width = 56
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'SODATE'
          Footers = <>
          Title.Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077'|'#1044#1072#1090#1072' '#1086#1090#1087'-'#1082#1080
          Width = 78
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MES_HEAD'
          Footers = <>
          Title.Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077'|'#1047#1072#1075#1086#1083#1086#1074#1086#1082
          Title.TitleButton = True
          Width = 152
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_ON'
          Footers = <>
          Title.Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077'|'#1044#1086#1073#1072#1074#1083#1077#1085#1086
          Title.TitleButton = True
          Width = 99
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_BY'
          Footers = <>
          Title.Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1077'|'#1050#1077#1084
          Title.TitleButton = True
          Width = 62
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object tlbMain: TToolBar
      Left = 1
      Top = 1
      Width = 915
      Height = 29
      Caption = 'ToolBar2'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Images = A4MainForm.ICONS_ACTIVE
      TabOrder = 0
      object ToolButton14: TToolButton
        Left = 0
        Top = 0
        Action = actNew
        Caption = 'W4w4'
      end
      object btnEdit: TToolButton
        Left = 23
        Top = 0
        Action = actEdit
      end
      object btnDel: TToolButton
        Left = 46
        Top = 0
        Action = actDel
      end
      object ToolButton16: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'W4w4'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton4: TToolButton
        Left = 77
        Top = 0
        Action = actMessSetPeriod
        Caption = 'W4w4'
        DropdownMenu = pmPeriod
        Style = tbsDropDown
      end
      object ToolButton3: TToolButton
        Left = 115
        Top = 0
        Width = 8
        Caption = 'W4w4'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton5: TToolButton
        Left = 123
        Top = 0
        Action = actPrintDoc
      end
      object ToolButton1: TToolButton
        Left = 146
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object ToolButton27: TToolButton
        Left = 154
        Top = 0
        Action = actQuickFilter
      end
      object ToolButton2: TToolButton
        Left = 177
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 75
        Style = tbsSeparator
      end
      object btnFilterCustomer: TToolButton
        Left = 185
        Top = 0
        Action = actFilterCustomer
      end
      object chkGroup: TCheckBox
        Left = 208
        Top = 0
        Width = 144
        Height = 22
        Action = actGroup
        Alignment = taLeftJustify
        Caption = '   '#1042#1082#1083#1102#1095#1080#1090#1100' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1091
        TabOrder = 0
      end
      object btn2: TToolButton
        Left = 352
        Top = 0
        Width = 8
        Caption = 'btn2'
        ImageIndex = 42
        Style = tbsSeparator
      end
      object btnSendSMS: TToolButton
        Left = 360
        Top = 0
        Action = actSendSMS
      end
    end
    object pnlEdit: TPanel
      Left = 1
      Top = 30
      Width = 915
      Height = 227
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 915
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          915
          32)
        object lbl3: TLabel
          Left = 7
          Top = 8
          Width = 77
          Height = 13
          Caption = #1058#1080#1087' '#1089#1086#1086#1073#1097#1077#1085#1080#1081
        end
        object lbl4: TLabel
          Left = 336
          Top = 8
          Width = 25
          Height = 13
          Caption = #1050#1086#1084#1091
        end
        object edtReciver: TDBEditEh
          Left = 384
          Top = 5
          Width = 521
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1050#1086#1084#1091' '#1096#1083#1077#1084'. '#1058#1077#1083#1077#1092#1086#1085' '#1080#1083#1080' '#1082#1072#1088#1090#1072
          ShowHint = True
          TabOrder = 1
          Visible = True
        end
        object cbbTYPE: TDBLookupComboboxEh
          Left = 90
          Top = 5
          Width = 226
          Height = 21
          DynProps = <>
          DataField = ''
          EmptyDataInfo.Text = #1058#1080#1087' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
          EditButtons = <>
          KeyField = 'O_NAME'
          ListField = 'NAME'
          ListSource = srcMessType
          ShowHint = True
          TabOrder = 0
          Visible = True
          OnChange = cbbTYPEChange
        end
      end
      object pnlOkCancel: TPanel
        Left = 0
        Top = 191
        Width = 915
        Height = 36
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          915
          36)
        object btnCancelLink: TBitBtn
          Left = 819
          Top = 6
          Width = 86
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = #1054#1090#1084#1077#1085#1072
          TabOrder = 1
          OnClick = btnCancelLinkClick
        end
        object btnSaveLink: TBitBtn
          Left = 30
          Top = 6
          Width = 771
          Height = 25
          Anchors = [akLeft, akRight, akBottom]
          Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
          TabOrder = 0
          OnClick = btnSaveLinkClick
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 32
        Width = 915
        Height = 159
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object lblSMScount: TLabel
          Left = 0
          Top = 25
          Width = 915
          Height = 13
          Align = alTop
        end
        object pnlHead: TPanel
          Left = 0
          Top = 0
          Width = 915
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          Visible = False
          DesignSize = (
            915
            25)
          object lbl2: TLabel
            Left = 7
            Top = 4
            Width = 62
            Height = 13
            Caption = #1058#1077#1084#1072' '#1087#1080#1089#1100#1084#1072
          end
          object edtHEAD: TDBEditEh
            Left = 90
            Top = 1
            Width = 815
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
            ShowHint = True
            TabOrder = 0
            Visible = True
          end
        end
        object mmoMessage: TDBMemoEh
          Left = 0
          Top = 38
          Width = 915
          Height = 121
          Align = alClient
          AutoSize = False
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1058#1077#1082#1089#1090' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
          ShowHint = True
          TabOrder = 1
          Visible = True
          WantReturns = True
          OnChange = mmoMessageChange
        end
      end
    end
  end
  object alGuide: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 240
    Top = 128
    object actNew: TAction
      Caption = #1053#1086#1074#1086#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      ImageIndex = 2
      ShortCut = 45
      Visible = False
      OnExecute = actNewExecute
    end
    object actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1086#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1077' '#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1086#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      ImageIndex = 3
      OnExecute = actDelExecute
    end
    object actPayDocSearch: TAction
      Caption = #1055#1086#1080#1089#1082
      Hint = #1055#1086#1080#1089#1082'|'#1041#1099#1089#1090#1088#1099#1081' '#1087#1086#1080#1089#1082' '#1087#1086' '#1086#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1085#1085#1086#1084#1091' '#1089#1090#1086#1083#1073#1094#1091
      ImageIndex = 7
      ShortCut = 16454
    end
    object actMessSetPeriod: TAction
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1077#1088#1080#1086#1076
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1087#1077#1088#1080#1086#1076' '#1086#1090#1073#1086#1088#1072' '#1076#1072#1085#1085#1099#1093
      ImageIndex = 1
      ShortCut = 16452
      OnExecute = actMessSetPeriodExecute
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
    object actSendSMS: TAction
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' SMS'
      Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' SMS '#1095#1077#1088#1077#1079' '#1096#1083#1102#1079' A4ON.TV'
      ImageIndex = 74
      OnExecute = actSendSMSExecute
    end
    object actFilterCustomer: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1089#1087#1080#1089#1082#1077
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      ImageIndex = 9
      OnExecute = actFilterCustomerExecute
    end
  end
  object gridPopUp: TPopupMenu
    Left = 132
    Top = 142
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
  object dsMessages: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE MESSAGES'
      'SET '
      '    RECIVER = :RECIVER,'
      '    MES_HEAD = :MES_HEAD,'
      '    MES_TEXT = :MES_TEXT'
      'WHERE'
      '    MES_ID = :OLD_MES_ID'
      '    and MES_RESULT = 0'
      '    ')
    DeleteSQL.Strings = (
      
        'delete from MESSAGES where MES_ID = :OLD_MES_ID and MES_RESULT <' +
        '= 0')
    InsertSQL.Strings = (
      'INSERT INTO MESSAGES('
      '    MES_ID,'
      '    MES_TYPE,'
      '    RECIVER,'
      '    MES_HEAD,'
      '    MES_TEXT,'
      '    MES_RESULT'
      ')'
      'VALUES('
      '    :MES_ID,'
      '    :MES_TYPE,'
      '    :RECIVER,'
      '    :MES_HEAD,'
      '    :MES_TEXT,'
      '    :MES_RESULT'
      ')')
    RefreshSQL.Strings = (
      'select'
      
        '    M.*, C.ACCOUNT_NO, C.SURNAME, C.INITIALS, C.DEBT_SUM, C.CUST' +
        '_STATE_DESCR, S.STREET_SHORT, S.STREET_NAME, H.HOUSE_NO, C.FLAT_' +
        'NO, coalesce(o.O_Name, m.Mes_Result) as Res_TEXT'
      '  from MESSAGES M'
      
        '       left outer join CUSTOMER C on (M.CUSTOMER_ID = C.CUSTOMER' +
        '_ID)'
      '       left outer join HOUSE H on (H.HOUSE_ID = C.HOUSE_ID)'
      '       left outer join STREET S on (S.STREET_ID = H.STREET_ID)'
      
        '       left outer join OBJECTS o on (o.O_Type = 24 and o.O_Id = ' +
        'm.Mes_Result)'
      '  where   M.MES_ID = :OLD_MES_ID'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    M.*'
      '    , cast(m.SEND_DATE as DATE) SODATE '
      '    , C.ACCOUNT_NO'
      '    , C.SURNAME'
      '    , C.INITIALS'
      '    , C.DEBT_SUM'
      
        '    , C.CUST_STATE_DESCR, S.STREET_SHORT, S.STREET_NAME, H.HOUSE' +
        '_NO, C.FLAT_NO, coalesce(o.O_Name, m.Mes_Result) as Res_TEXT'
      '  from MESSAGES M'
      
        '       left outer join CUSTOMER C on (M.CUSTOMER_ID = C.CUSTOMER' +
        '_ID)'
      '       left outer join HOUSE H on (H.HOUSE_ID = C.HOUSE_ID)'
      '       left outer join STREET S on (S.STREET_ID = H.STREET_ID)'
      
        '       left outer join OBJECTS o on (o.O_Type = 24 and o.O_Id = ' +
        'm.Mes_Result)'
      
        '  where M.ADDED_ON between :StartDate and dateadd(1 day to :EndD' +
        'ate)'
      '    and (not m.MES_RESULT in (1,2) or 0 = :ShowNotSended)'
      '  order by M.MES_ID')
    AutoUpdateOptions.UpdateTableName = 'MESSAGES'
    AutoUpdateOptions.KeyFields = 'MES_ID'
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoUpdateOptions.GeneratorName = 'GEN_QUEUE'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
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
  object srcMessages: TDataSource
    AutoEdit = False
    DataSet = dsMessages
    Left = 55
    Top = 349
  end
  object frxDBMessages: TfrxDBDataset
    UserName = 'Messages'
    OnCheckEOF = frxDBMessagesCheckEOF
    OnFirst = frxDBMessagesFirst
    OnNext = frxDBMessagesNext
    CloseDataSource = False
    DataSet = dsMessages
    BCDToCurrency = False
    Left = 315
    Top = 211
  end
  object pmPeriod: TPopupMenu
    Left = 201
    Top = 169
    object N1: TMenuItem
      Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #1047#1072' '#1087#1088#1086#1096#1083#1099#1081' '#1076#1077#1085#1100
      OnClick = N4Click
    end
    object N2: TMenuItem
      Caption = #1047#1072' '#1085#1077#1076#1077#1083#1102
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1047#1072' '#1084#1077#1089#1103#1094
      OnClick = N3Click
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N16: TMenuItem
      Caption = #1053#1077#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077
      Checked = True
      Hint = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1085#1077#1086#1090#1087#1088#1072#1074#1083#1077#1085#1085#1099#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
      OnClick = N16Click
    end
  end
  object MainMenu1: TMainMenu
    Left = 520
    Top = 184
    object N5: TMenuItem
      Caption = #1057#1086#1086#1073#1097#1077#1085#1080#1103
      GroupIndex = 4
      object N10: TMenuItem
        Action = actMessSetPeriod
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
        Action = actNew
        Caption = #1053#1086#1074#1086#1074#1077' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Action = actPrintDoc
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object N11: TMenuItem
        Action = actDel
      end
    end
  end
  object mtMessages: TMemTableEh
    Params = <>
    DataDriver = drvMessages
    Left = 378
    Top = 135
  end
  object drvMessages: TpFIBDataDriverEh
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
    ProviderDataSet = dsMessages
    KeyFields = 'payment_id'
    Left = 457
    Top = 135
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 168
    Top = 296
  end
  object dsMessType: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT O_ID, O_NAME, O_NAME||coalesce('#39' '#39'||O_Description,'#39#39') NAM' +
        'E, O_NUMERICFIELD'
      'FROM OBJECTS'
      'WHERE O_TYPE = 23 AND O_DELETED = 0'
      'order BY O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 586
    Top = 114
  end
  object srcMessType: TDataSource
    AutoEdit = False
    DataSet = dsMessType
    Left = 724
    Top = 100
  end
end
