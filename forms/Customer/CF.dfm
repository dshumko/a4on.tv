object CustomersForm: TCustomersForm
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
  ClientHeight = 526
  ClientWidth = 970
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  Menu = mmMenu
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object splMain: TdnSplitter
    Left = 0
    Top = 270
    AlignControl = pnlForms
    ResizeStyle = rsLine
    Size = 5
    ButtonVisible = False
    ButtonAlign = baRightBottom
    ButtonWidth = 40
  end
  object pnlForms: TPanel
    Left = 0
    Top = 275
    Width = 970
    Height = 251
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object spl1: TdnSplitter
      Left = 201
      Top = 0
      AlignControl = pnlGrdForms
      ResizeStyle = rsLine
      Size = 5
      ButtonVisible = False
      ButtonAlign = baRightBottom
      ButtonWidth = 40
    end
    object pnlDATA: TPanel
      Left = 206
      Top = 0
      Width = 764
      Height = 251
      Align = alClient
      BevelOuter = bvNone
      Caption = '````'
      TabOrder = 1
    end
    object pnlGrdForms: TPanel
      Left = 0
      Top = 0
      Width = 201
      Height = 251
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object dbgForms: TDBGridEh
        Left = 0
        Top = 0
        Width = 201
        Height = 251
        Align = alClient
        AllowedOperations = []
        AllowedSelections = []
        AutoFitColWidths = True
        ColumnDefValues.Layout = tlCenter
        DataSource = srcPages
        DynProps = <>
        GridLineParams.DataHorzLines = False
        GridLineParams.DataVertLines = False
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        IndicatorOptions = []
        Options = [dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghFitRowHeightToText]
        ReadOnly = True
        RowHeight = 4
        RowLines = 1
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
            TextEditing = False
            WordWrap = False
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object dbgCustomers: TDBGridEh
    Left = 0
    Top = 57
    Width = 970
    Height = 213
    Align = alClient
    AllowedOperations = []
    ColumnDefValues.ToolTips = True
    DataSource = srcCustomer
    DrawMemoText = True
    DynProps = <>
    EditActions = [geaCopyEh, geaSelectAllEh]
    EvenRowColor = clWindow
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    IndicatorParams.RecNoShowStep = 5
    IndicatorTitle.DropdownMenu = pmGridTitle
    IndicatorTitle.ShowDropDownSign = True
    IndicatorTitle.TitleButton = True
    IndicatorTitle.UseGlobalMenu = False
    EmptyDataInfo.Text = #1053#1077#1090' '#1079#1072#1087#1080#1089#1077#1081
    OddRowColor = clWindow
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    ParentShowHint = False
    PopupMenu = gridPopUp
    ReadOnly = True
    SearchPanel.Enabled = True
    SearchPanel.FilterEnabled = False
    SearchPanel.Location = splExternal
    ShowHint = True
    SortLocal = True
    STFilter.InstantApply = False
    STFilter.Local = True
    SumList.VirtualRecords = True
    TabOrder = 2
    TitleParams.MultiTitle = True
    TitleParams.VTitleMargin = 8
    OnDblClick = dbgCustomersDblClick
    OnGetCellParams = dbgCustomersGetCellParams
    OnGetFooterParams = dbgCustomersGetFooterParams
    OnSortMarkingChanged = dbgCustomersSortMarkingChanged
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACCOUNT_NO'
        Footer.Value = #1048#1090#1086#1075#1086
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Caption = #1051#1080#1094' '#1089#1095#1077#1090
        Title.TitleButton = True
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
        Width = 46
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUST_CODE'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SURNAME'
        Footer.FieldName = 'ACCOUNT_NO'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1050#1083#1080#1077#1085#1090'|'#1060#1072#1084#1080#1083#1080#1103
        Title.TitleButton = True
        Width = 99
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'INITIALS'
        Footers = <>
        Title.Caption = #1050#1083#1080#1077#1085#1090'|'#1048'.'#1054'.'
        Title.TitleButton = True
        Width = 30
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PHONE_NO'
        Footers = <>
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085
        Title.TitleButton = True
        Width = 52
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_SHORT'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1087#1088'.'
        Title.TitleButton = True
        Width = 20
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_NAME'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1059#1083#1080#1094#1072
        Title.TitleButton = True
        Width = 105
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_NO'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1044#1086#1084
        Title.TitleButton = True
        Width = 44
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLAT_NO'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1050#1074
        Title.TitleButton = True
        Width = 41
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PORCH_N'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1055
        Title.TitleButton = True
        Width = 21
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLOOR_N'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1069
        Title.TitleButton = True
        Width = 18
      end
      item
        CellButtons = <>
        DisplayFormat = '#,##0.##'
        DynProps = <>
        EditButtons = <>
        FieldName = 'DEBT_SUM'
        Footer.DisplayFormat = '#,###'
        Footer.FieldName = 'DEBT_SUM'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1057#1072#1083#1100#1076#1086' '#1088#1072#1089#1095#1077#1090#1086#1074
        Title.TitleButton = True
        Width = 69
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CUST_STATE_DESCR'
        Footers = <>
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Title.TitleButton = True
        Width = 165
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 200
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'VALID_TO'
        Footers = <>
        Title.Caption = #1044#1086#1075#1086#1074#1086#1088' '#1076#1086
        Title.TitleButton = True
        Width = 97
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlBtns: TPanel
    Left = 0
    Top = 0
    Width = 970
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 309
      Height = 24
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object SpeedButton2: TSpeedButton
        Left = 0
        Top = 0
        Width = 46
        Height = 24
        Hint = #1055#1086#1080#1089#1082'|'#1055#1086#1080#1089#1082
        Align = alLeft
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
      object tlbSearch: TToolBar
        Left = 236
        Top = 0
        Width = 73
        Height = 24
        Align = alRight
        Images = A4MainForm.ilFilter
        TabOrder = 2
        object btnFilterSearchText: TToolButton
          Left = 0
          Top = 0
          Action = actFilterSearchText
        end
        object btnSearchNext: TToolButton
          Left = 23
          Top = 0
          Action = actSearchNext
        end
        object btnSearchPrev: TToolButton
          Left = 46
          Top = 0
          Action = actSearchPrev
        end
      end
      object edtSearch: TDBEditEh
        Left = 63
        Top = 0
        Width = 173
        Height = 24
        Align = alClient
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1042#1074#1077#1076#1080#1090#1077' '#1090#1077#1082#1089#1090' '#1076#1083#1103' '#1087#1086#1080#1089#1082#1072
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnChange = edtSearchChange
        OnEnter = edtSearchEnter
        OnExit = edtSearchExit
        OnKeyUp = edtSearchKeyUp
      end
      object chkFldOnly: TCheckBox
        Left = 46
        Top = 0
        Width = 17
        Height = 24
        Hint = #1055#1086#1080#1089#1082' '#1090#1086#1083#1100#1082#1086' '#1074' '#1072#1082#1090#1080#1074#1085#1086#1081' '#1082#1086#1083#1086#1085#1082#1077
        Align = alLeft
        TabOrder = 0
        OnClick = chkFldOnlyClick
      end
    end
    object pnlToolBars: TPanel
      Left = 309
      Top = 0
      Width = 661
      Height = 24
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object ToolBar1: TToolBar
        Left = 92
        Top = 0
        Width = 569
        Height = 24
        Align = alClient
        Caption = 'ToolBar1'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 1
        object btnItogo: TToolButton
          Left = 0
          Top = 0
          Action = actItogo
        end
        object ToolButton5: TToolButton
          Left = 23
          Top = 0
          Width = 8
          Caption = 'ToolButton5'
          ImageIndex = 50
          Style = tbsSeparator
        end
        object ToolButton6: TToolButton
          Left = 31
          Top = 0
          Action = ActBalance
          DropdownMenu = pmSelectPrintDoc
          PopupMenu = pmSelectPrintDoc
          Style = tbsDropDown
        end
        object ToolButton7: TToolButton
          Left = 69
          Top = 0
          Width = 8
          Caption = 'ToolButton7'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object ToolButton1: TToolButton
          Left = 77
          Top = 0
          Action = actCustomerAdd
        end
        object ToolButton2: TToolButton
          Left = 100
          Top = 0
          Action = actCustomerEdit
        end
        object ToolButton16: TToolButton
          Left = 123
          Top = 0
          Width = 8
          Caption = 'ToolButton16'
          ImageIndex = 31
          Style = tbsSeparator
        end
        object ToolButton13: TToolButton
          Left = 131
          Top = 0
          Action = ActionRefresh
        end
        object ToolButton12: TToolButton
          Left = 154
          Top = 0
          Width = 8
          Caption = 'ToolButton12'
          ImageIndex = 24
          Style = tbsSeparator
        end
        object ToolButton17: TToolButton
          Left = 162
          Top = 0
          Action = actRequest
        end
        object btn3: TToolButton
          Left = 185
          Top = 0
          Width = 8
          Caption = 'btn3'
          ImageIndex = 38
          Style = tbsSeparator
        end
        object btnAddRec1: TToolButton
          Left = 193
          Top = 0
          Action = actRecAdd
          DropdownMenu = pmRecourse
          PopupMenu = pmRecourse
          Style = tbsDropDown
        end
        object btn1: TToolButton
          Left = 231
          Top = 0
          Width = 8
          Caption = 'btn1'
          ImageIndex = 51
          Style = tbsSeparator
        end
        object btnNPS: TToolButton
          Left = 239
          Top = 0
          Action = actNPS
        end
        object btnTask: TToolButton
          Left = 262
          Top = 0
          Action = actTask
        end
      end
      object ToolBar2: TToolBar
        Left = 0
        Top = 0
        Width = 92
        Height = 24
        Align = alLeft
        Caption = 'ToolBar1'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object ToolButton3: TToolButton
          Left = 0
          Top = 0
          Action = ActSetFilter
          DropdownMenu = pmFilter
          Style = tbsDropDown
        end
        object ToolButton4: TToolButton
          Left = 38
          Top = 0
          Action = actQuickFilter
        end
        object ToolButton8: TToolButton
          Left = 61
          Top = 0
          Action = actAddressSearch
        end
      end
    end
  end
  object pnlSearchAdres: TPanel
    Left = 0
    Top = 24
    Width = 970
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object Label1: TLabel
      Left = 4
      Top = 9
      Width = 92
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1072#1076#1088#1077#1089#1091
    end
    object lcbStreets: TDBLookupComboboxEh
      Left = 242
      Top = 6
      Width = 207
      Height = 21
      Hint = #1059#1083#1080#1094#1072
      DynProps = <>
      DataField = ''
      DropDownBox.Columns = <
        item
          FieldName = 'STREET_NAME'
          Title.Caption = #1059#1083#1080#1094#1072
        end
        item
          AutoFitColWidth = False
          FieldName = 'STREET_CODE'
          Title.Caption = #1082#1086#1076
          Width = 25
        end
        item
          FieldName = 'AREA_NAME'
          Title.Caption = #1043#1086#1088#1086#1076
        end>
      DropDownBox.AutoDrop = True
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1059#1083#1080#1094#1072
      EditButtons = <>
      KeyField = 'STREET_ID'
      ListField = 'STREET_NAME'
      ListSource = srcStreet
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnChange = lcbStreetsChange
    end
    object lcbHOUSE: TDBLookupComboboxEh
      Left = 457
      Top = 6
      Width = 123
      Height = 21
      Hint = #1044#1086#1084
      DynProps = <>
      DataField = ''
      DropDownBox.AutoDrop = True
      EmptyDataInfo.Text = #1044#1086#1084
      EditButtons = <>
      KeyField = 'HOUSE_ID'
      ListField = 'HOUSE_NO'
      ListSource = srcHouse
      ShowHint = True
      TabOrder = 2
      Visible = True
      OnChange = lcbHOUSEChange
    end
    object lcbFLAT: TDBLookupComboboxEh
      Left = 588
      Top = 6
      Width = 85
      Height = 21
      Hint = #1053#1086#1084#1077#1088' '#1082#1074#1072#1088#1090#1080#1088#1099' '#1080#1083#1080' - , '#1077#1089#1083#1080' '#1085#1077#1090' '#1082#1074#1072#1088#1090#1080#1088#1099
      DynProps = <>
      DataField = ''
      DropDownBox.AutoDrop = True
      EmptyDataInfo.Text = #1050#1074#1072#1088#1090#1080#1088#1072
      EditButtons = <>
      KeyField = 'FLAT_NO'
      ListField = 'FLAT_NO'
      ListSource = srcFLAT
      ShowHint = True
      TabOrder = 3
      Visible = True
      OnChange = lcbFLATChange
    end
    object cbbAREA: TDBLookupComboboxEh
      Left = 107
      Top = 6
      Width = 129
      Height = 21
      DynProps = <>
      DataField = ''
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
      EditButtons = <>
      KeyField = 'AREA_ID'
      ListField = 'AREA_NAME'
      ListSource = srcArea
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = cbbAREAChange
    end
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
    Left = 205
    Top = 411
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 259
    Top = 415
  end
  object dsCustomers: TpFIBDataSet
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE DELETE_CUSTOMER(:CUSTOMER_ID)')
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
      
        ', iif(exists(select ss.Customer_Id from SUBSCR_SERV ss where ss.' +
        'CUSTOMER_ID = c.CUSTOMER_ID and ss.STATE_SGN = 1) ,1, 0) as conn' +
        'ected,'
      'SECRET'
      'FROM CUSTOMER C'
      '   INNER JOIN HOUSE H ON (C.HOUSE_ID = H.HOUSE_ID)'
      '   INNER JOIN STREET S ON (H.STREET_ID = S.STREET_ID)'
      '   LEFT OUTER JOIN WORKGROUPS wg ON (WG.WG_ID = H.WG_ID)'
      '')
    AutoUpdateOptions.UpdateTableName = 'CUSTOMER'
    AutoUpdateOptions.KeyFields = 'CUSTOMER_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_CUSTOMER_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AfterOpen = dsCustomersAfterOpen
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 149
    Top = 288
    poUseBooleanField = False
    poSetRequiredFields = True
    oVisibleRecno = True
    oFetchAll = True
  end
  object srcCustomer: TDataSource
    DataSet = dsCustomers
    Left = 147
    Top = 340
  end
  object ActListCustomers: TActionList
    Left = 46
    Top = 153
    object actCustomerAdd: TAction
      Caption = #1053#1086#1074#1099#1081' '#1072#1073#1086#1085#1077#1085#1090
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1072#1073#1086#1085#1077#1085#1090#1072'|'#1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1072#1073#1086#1085#1077#1085#1090#1072
      ImageIndex = 20
      ShortCut = 45
      OnExecute = actCustomerAddExecute
    end
    object actCustomerEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      ImageIndex = 21
      ShortCut = 113
      OnExecute = actCustomerEditExecute
    end
    object actCustomerDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      ImageIndex = 22
      OnExecute = actCustomerDeleteExecute
    end
    object ActSetFilter: TAction
      Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1092#1080#1083#1100#1090#1088#1072
      Hint = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1092#1080#1083#1100#1090#1088#1072
      ImageIndex = 0
      ShortCut = 114
      OnExecute = ActSetFilterExecute
    end
    object ActBalance: TAction
      Caption = #1041#1072#1083#1072#1085#1089' '#1072#1073#1086#1085#1077#1085#1090#1072
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1073#1072#1083#1072#1085#1089' '#1072#1073#1086#1085#1077#1085#1090#1072
      ImageIndex = 5
      ShortCut = 16450
      OnExecute = ActBalanceExecute
    end
    object actReCalc: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100
      Hint = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1089#1072#1083#1100#1076#1086' '#1072#1073#1086#1085#1077#1085#1090#1072
    end
    object ActPrintGrid: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1074#1099#1073#1086#1088#1082#1080
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088'/'#1087#1077#1095#1072#1090#1100' '#1074#1099#1073#1086#1088#1082#1080' '#1087#1086' '#1072#1073#1086#1085#1077#1085#1090#1072#1084
      ImageIndex = 5
      ShortCut = 115
      OnExecute = ActPrintGridExecute
    end
    object ActLetters: TAction
      Caption = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      Hint = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ImageIndex = 30
      SecondaryShortCuts.Strings = (
        'Ctrl+'#1047)
      ShortCut = 16464
      OnExecute = ActLettersExecute
    end
    object ActCancelContract: TAction
      Caption = #1056#1072#1079#1086#1088#1074#1072#1090#1100' '#1082#1086#1085#1090#1088#1072#1082#1090
      Hint = #1056#1072#1079#1086#1088#1074#1072#1090#1100' '#1082#1086#1085#1090#1088#1072#1082#1090#1098
      ImageIndex = 31
      ShortCut = 16497
      OnExecute = ActCancelContractExecute
    end
    object actEnableFilter: TAction
      Caption = #1042#1082#1083'/'#1042#1099#1082#1083'. '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100'/'#1074#1099#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ShortCut = 16498
      OnExecute = actEnableFilterExecute
    end
    object actRequest: TAction
      Caption = #1047#1072#1103#1074#1082#1072
      Hint = #1055#1088#1080#1085#1103#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1086#1090' '#1072#1073#1086#1085#1077#1085#1090#1072
      ImageIndex = 37
      ShortCut = 116
      OnExecute = actRequestExecute
    end
    object actItogo: TAction
      Caption = #1057#1091#1084#1084#1072#1088#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      Hint = #1057#1091#1084#1084#1072#1088#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ImageIndex = 39
      ShortCut = 8309
      OnExecute = actItogoExecute
    end
    object actQuickFilter: TAction
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083'/'#1042#1099#1082#1083' '#1073#1099#1089#1090#1088#1086#1075#1086' '#1092#1080#1083#1100#1090#1088#1072
      ImageIndex = 33
      ShortCut = 16465
      OnExecute = actQuickFilterExecute
    end
    object ActAddPayment: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1090#1077#1078' '#1072#1073#1086#1085#1077#1085#1090#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1090#1077#1078' '#1072#1073#1086#1085#1077#1085#1090#1091' '#1074' '#1086#1090#1082#1088#1099#1090#1099#1081' '#1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ShortCut = 117
      OnExecute = ActAddPaymentExecute
    end
    object actAddressSearch: TAction
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1072#1076#1088#1077#1089#1091
      Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1072#1076#1088#1077#1089#1091
      ImageIndex = 18
      ShortCut = 16454
      OnExecute = actAddressSearchExecute
    end
    object ActionRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077
      ImageIndex = 27
      ShortCut = 16466
      OnExecute = ActionRefreshExecute
    end
    object actSelectColumns: TAction
      Category = 'GridTitle'
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1080#1076#1080#1084#1086#1089#1090#1100' '#1082#1086#1083#1086#1085#1086#1082
      OnExecute = actSelectColumnsExecute
    end
    object actSelectAll: TAction
      Category = 'GridTitle'
      Caption = '&'#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnExecute = actSelectAllExecute
    end
    object actCopy: TAction
      Category = 'GridTitle'
      Caption = '&'#1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actCopyExecute
    end
    object actSaveAs: TAction
      Category = 'GridTitle'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082' ...'
      OnExecute = actSaveAsExecute
    end
    object actFltrManyAccounts: TAction
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1089#1087#1080#1089#1082#1091' '#1083#1080#1094#1077#1074#1099#1093
      Hint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1089#1087#1080#1089#1082#1091' '#1083#1080#1094#1077#1074#1099' '#1089#1095#1077#1090#1086#1074
      OnExecute = actFltrManyAccountsExecute
    end
    object actSendMessages: TAction
      Caption = #1056#1072#1079#1086#1089#1083#1072#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
      Hint = #1056#1072#1089#1089#1099#1083#1082#1072' '#1089#1086#1086#1073#1097#1077#1085#1080#1081' '#1074#1089#1077#1084' '#1080#1083#1080' '#1074#1099#1073#1088#1072#1085#1085#1099#1084' '#1072#1073#1086#1085#1077#1085#1090#1072#1084
      OnExecute = actSendMessagesExecute
    end
    object actRecAddWAdres: TAction
      Caption = #1054#1073#1088#1072#1097#1077#1085#1080#1077' '#1073#1077#1079' '#1072#1076#1088#1077#1089#1072
      ShortCut = 8311
      OnExecute = actRecAddWAdresExecute
    end
    object actSetFilterNew: TAction
      Caption = #1053#1086#1074#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1092#1080#1083#1100#1090#1088' '#1089' '#1086#1095#1080#1089#1090#1082#1086#1081' '#1089#1090#1072#1088#1086#1075#1086
      ImageIndex = 0
      ShortCut = 8306
      OnExecute = actSetFilterNewExecute
    end
    object actPrepay: TAction
      Caption = #1054#1073#1077#1097#1072#1085#1085#1099#1081' '#1087#1083#1072#1090#1077#1078
      OnExecute = actPrepayExecute
    end
    object actRecAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      ImageIndex = 49
      ShortCut = 119
      OnExecute = actRecAddExecute
    end
    object actFilterFLD: TAction
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1079#1085#1072#1095#1077#1085#1080#1102
      OnExecute = actFilterFLDExecute
    end
    object actAddBlackList: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074' "'#1095#1077#1088#1085#1099#1081'" '#1089#1087#1080#1089#1086#1082
      OnExecute = actAddBlackListExecute
    end
    object actNPS: TAction
      Hint = #1051#1086#1103#1083#1100#1085#1086#1089#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      ImageIndex = 79
      ShortCut = 120
      OnExecute = actNPSExecute
    end
    object actResetpassword: TAction
      Caption = #1057#1073#1088#1086#1089' '#1087#1072#1088#1086#1083#1103
      Hint = #1057#1073#1088#1086#1089#1080#1090#1100' '#1089#1090#1072#1088#1099#1081' '#1087#1072#1088#1086#1083#1100' '#1080' '#1089#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081
      ImageIndex = 53
      OnExecute = actResetpasswordExecute
    end
    object actTask: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1076#1072#1095#1091'/'#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1076#1072#1095#1091'/'#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      ImageIndex = 87
      ShortCut = 121
      OnExecute = actTaskExecute
    end
    object actCustNode: TAction
      Caption = #1059#1079#1077#1083' '#1072#1073#1086#1085#1077#1085#1090#1072
      OnExecute = actCustNodeExecute
    end
    object actCheckPassport: TAction
      Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1087#1072#1089#1087#1086#1088#1090
      Hint = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1085#1072' '#1087#1088#1086#1074#1077#1088#1082#1091' '#1076#1072#1085#1085#1099#1077' '#1087#1072#1089#1087#1086#1088#1090#1072
      OnExecute = actCheckPassportExecute
    end
    object actOrderTP: TAction
      Caption = #1057#1090#1086#1088#1086#1085#1085#1080#1081' '#1079#1072#1082#1072#1079
      OnExecute = actOrderTPExecute
    end
  end
  object mmMenu: TMainMenu
    Left = 120
    Top = 81
    object N18: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082
      GroupIndex = 2
      object N19: TMenuItem
        Action = ActSetFilter
      end
      object N21: TMenuItem
        Action = actEnableFilter
      end
      object N20: TMenuItem
        Action = actQuickFilter
      end
      object N32: TMenuItem
        Action = actAddressSearch
      end
      object N33: TMenuItem
        Caption = #1055#1086#1080#1089#1082
        ImageIndex = 7
      end
      object N48: TMenuItem
        Caption = '-'
      end
      object actSendMessages1: TMenuItem
        Action = actSendMessages
      end
      object N28: TMenuItem
        Caption = '-'
      end
      object N40: TMenuItem
        Action = actAddBlackList
      end
      object N22: TMenuItem
        Caption = '-'
      end
      object miExport: TMenuItem
        Caption = #1069#1082#1089#1087#1086#1088#1090' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080
      end
      object N17: TMenuItem
        Action = actSelectAll
      end
      object N39: TMenuItem
        Action = actSaveAs
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object N49: TMenuItem
        Action = actSelectColumns
      end
      object N26: TMenuItem
        Action = actItogo
      end
    end
    object miAbonent: TMenuItem
      Caption = #1040#1073#1086#1085#1077#1085#1090
      GroupIndex = 2
      object N34: TMenuItem
        Action = ActAddPayment
      end
      object N35: TMenuItem
        Action = actRequest
      end
      object miRecAdd: TMenuItem
        Action = actRecAdd
      end
      object miNPS: TMenuItem
        Action = actNPS
        Caption = #1051#1086#1103#1083#1100#1085#1086#1089#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      end
      object mmiPrepay: TMenuItem
        Action = actPrepay
      end
      object N56: TMenuItem
        Action = actCustNode
      end
      object mmiTask: TMenuItem
        Action = actTask
      end
      object miOrderTP: TMenuItem
        Action = actOrderTP
      end
      object N30: TMenuItem
        Caption = '-'
      end
      object N23: TMenuItem
        Action = actCustomerAdd
      end
      object N24: TMenuItem
        Action = actCustomerEdit
      end
      object N41: TMenuItem
        Action = actResetpassword
      end
      object N57: TMenuItem
        Action = actCheckPassport
      end
      object N38: TMenuItem
        Caption = '-'
      end
      object mimap: TMenuItem
        Caption = #1050#1072#1088#1090#1072' '#1076#1086#1084#1072
      end
      object N2: TMenuItem
        Action = ActCancelContract
      end
      object N25: TMenuItem
        Caption = '-'
      end
      object N27: TMenuItem
        Action = actReCalc
      end
      object N50: TMenuItem
        Caption = '-'
      end
      object N52: TMenuItem
        Action = actCustomerDelete
      end
    end
    object miPrint: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      GroupIndex = 2
      Hint = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      ImageIndex = 30
      ShortCut = 16464
      object ActLetters1: TMenuItem
        Action = ActLetters
      end
      object N37: TMenuItem
        Action = ActPrintGrid
      end
      object N29: TMenuItem
        Action = ActBalance
      end
      object N43: TMenuItem
        Caption = '-'
      end
    end
  end
  object actlstSearch: TActionList
    Left = 41
    Top = 93
    object actFilterSearchText: TAction
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086'  '#1074#1074#1077#1076#1077#1085#1085#1086#1084#1091' '#1090#1077#1082#1089#1090#1091
      ImageIndex = 2
      OnExecute = actFilterSearchTextExecute
    end
    object actSearchNext: TAction
      Hint = #1053#1072#1081#1090#1080' '#1089#1083#1077#1076#1091#1102#1097#1091#1102' '#1087#1086#1079#1080#1094#1080#1102
      ImageIndex = 3
      OnExecute = actSearchNextExecute
    end
    object actSearchPrev: TAction
      Hint = #1053#1072#1081#1090#1080' '#1087#1088#1077#1076#1080#1076#1091#1097#1091#1102' '#1087#1086#1079#1080#1094#1080#1102
      ImageIndex = 4
      OnExecute = actSearchPrevExecute
    end
  end
  object gridPopUp: TPopupMenu
    Left = 215
    Top = 150
    object N11: TMenuItem
      Action = actCustomerAdd
    end
    object N13: TMenuItem
      Action = actCustomerEdit
    end
    object N12: TMenuItem
      Caption = '-'
      Hint = #1056#1072#1079#1086#1088#1074#1072#1090#1100' '#1082#1086#1085#1090#1088#1072#1082#1090#1098
      ImageIndex = 31
    end
    object N5: TMenuItem
      Action = ActBalance
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N6: TMenuItem
      Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1091#1089#1083#1091#1075#1080
      OnClick = N6Click
    end
    object N9: TMenuItem
      Caption = #1056#1072#1079#1086#1074#1099#1077' '#1091#1089#1083#1091#1075#1080
      OnClick = N9Click
    end
    object N10: TMenuItem
      Caption = #1055#1083#1072#1090#1077#1078#1080
      OnClick = N10Click
    end
    object mniN28: TMenuItem
      Caption = '-'
    end
    object mniFilterFLD: TMenuItem
      Action = actFilterFLD
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object ppmCopy: TMenuItem
      Action = actCopy
    end
    object ppmSelectAll: TMenuItem
      Action = actSelectAll
    end
    object ppmSaveSelection: TMenuItem
      Action = actSaveAs
    end
    object N14: TMenuItem
      Caption = '-'
    end
    object N15: TMenuItem
      Action = ActAddPayment
    end
    object N55: TMenuItem
      Action = actPrepay
    end
    object N54: TMenuItem
      Caption = '-'
    end
    object N51: TMenuItem
      Action = actTask
    end
  end
  object pmFilters: TPopupMenu
    Left = 272
    Top = 80
    object N1: TMenuItem
      Action = actCustomerDelete
    end
    object N3: TMenuItem
      Action = actCustomerEdit
    end
    object N4: TMenuItem
      Action = ActSetFilter
    end
  end
  object pmFilter: TPopupMenu
    Left = 340
    Top = 82
    object N31: TMenuItem
      Action = actEnableFilter
    end
    object N53: TMenuItem
      Action = actSetFilterNew
    end
    object N42: TMenuItem
      Caption = '-'
    end
    object N36: TMenuItem
      Action = actQuickFilter
    end
  end
  object PropStorage: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'pnlBtns.Panel2.chkFldOnly.<P>.Checked'
      'pnlForms.<P>.Height'
      'pnlForms.pnlGrdForms.<P>.Width')
    Left = 593
    Top = 145
  end
  object pmGridTitle: TPopupMenu
    Left = 124
    Top = 155
    object N45: TMenuItem
      Action = actSelectAll
    end
    object N46: TMenuItem
      Action = actCopy
    end
    object N44: TMenuItem
      Action = actSaveAs
    end
    object N47: TMenuItem
      Caption = '-'
    end
    object actGTSelectColumns1: TMenuItem
      Action = actSelectColumns
    end
  end
  object pmExport: TPopupMenu
    Left = 104
    Top = 214
  end
  object qBalance: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select *'
      'from customer_balance(:CUSTOMER_ID)'
      'order by rmonth')
    Left = 480
    Top = 172
  end
  object UpdateTimer: TTimer
    Enabled = False
    OnTimer = UpdateTimerTimer
    Left = 592
    Top = 200
  end
  object frxFIBCustomers: TfrxDBDataset
    UserName = #1040#1041#1054#1053#1045#1053#1058#1067
    OnCheckEOF = frxFIBCustomersCheckEOF
    OnFirst = frxFIBCustomersFirst
    OnNext = frxFIBCustomersNext
    OnPrior = frxFIBCustomersPrior
    CloseDataSource = False
    FieldAliases.Strings = (
      'CUSTOMER_ID='#1059#1053#1048#1050#1040#1051#1068#1053#1067#1049'_'#1053#1054#1052#1045#1056'_'#1040#1041#1054#1053#1045#1053#1058#1040
      'CUST_CODE='#1050#1054#1044'_'#1040#1041#1054#1053#1045#1053#1058#1040
      'HOUSE_ID='#1050#1054#1044'_'#1044#1054#1052#1040
      'ACCOUNT_NO='#1051#1048#1062#1045#1042#1054#1049
      'DOGOVOR_NO='#1044#1054#1043#1054#1042#1054#1056
      'SURNAME='#1060#1040#1052#1048#1051#1048#1071
      'FIRSTNAME='#1048#1052#1071
      'MIDLENAME='#1054#1058#1063#1045#1057#1058#1042#1054
      'INITIALS='#1048#1054
      'CONTRACT_DATE='#1044#1040#1058#1040'_'#1044#1054#1043#1054#1042#1054#1056#1040
      'ACTIVIZ_DATE='#1044#1040#1058#1040'_'#1055#1045#1056#1042'_'#1055#1054#1044#1050#1051#1070#1063#1045#1053#1048#1071
      'PHONE_NO='#1058#1045#1051#1045#1060#1054#1053
      'NOTICE='#1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
      'VALID_TO='#1044#1054#1043#1054#1042#1054#1056'_'#1044#1054
      'CUST_STATE='#1057#1058#1040#1058#1059#1057
      'CUST_STATE_DESCR='#1055#1054#1051#1053#1067#1049'_'#1057#1058#1040#1058#1059#1057
      'CUST_PROP='#1040#1058#1056#1048#1041#1059#1058#1067
      'CUST_PROP_DESCR=CUST_PROP_DESCR'
      'FLAT_NO='#1050#1042#1040#1056#1058#1048#1056#1040
      'DEBT_SUM='#1057#1040#1051#1068#1044#1054
      'PASSPORT_NUMBER=N_'#1055#1040#1057#1055#1054#1056#1058#1040
      'PASSPORT_REGISTRATION=PASSPORT_REGISTRATION'
      'PERSONAL_N=PERSONAL_N'
      'MANAGER_ID=MANAGER_ID'
      'JURIDICAL='#1070#1056'_'#1051#1048#1062#1054
      'JUR_INN='#1070#1056'_'#1048#1053#1053
      'JUR_DIRECTOR='#1070#1056'_'#1044#1048#1056#1045#1050#1058#1054#1056
      'JUR_BUH='#1070#1056'_'#1041#1059#1061#1043#1040#1051#1058#1045#1056
      'CGIS='#1055#1056#1048#1047#1053#1040#1050
      'MOBILE_PHONE=MOBILE_PHONE'
      'HIS_COLOR=HIS_COLOR'
      'INVISIBLE=INVISIBLE'
      'EMAIL=EMAIL'
      'TIME_ON_MINUS=TIME_ON_MINUS'
      'BIRTHDAY=BIRTHDAY'
      'ADRES_REGISTR=ADRES_REGISTR'
      'ORG_ID=ORG_ID'
      'VATG_ID=VATG_ID'
      'FLAT_DIGIT=FLAT_DIGIT'
      'TAP=TAP'
      'PREPAY=PREPAY'
      'PREPAY_TIME=PREPAY_TIME'
      'SECRET=SECRET'
      'ADDED_BY=ADDED_BY'
      'ADDED_ON=ADDED_ON'
      'EDIT_BY=EDIT_BY'
      'EDIT_ON=EDIT_ON'
      'HAND_CONTROL=HAND_CONTROL'
      'BANK=BANK'
      'BANK_ACCOUNT=BANK_ACCOUNT'
      'EXTERNAL_ID=EXTERNAL_ID'
      'PASSPORT_VALID=PASSPORT_VALID'
      'CONTRACT_BASIS=PLACE_FACE'
      'STREET_SHORT='#1057#1054#1050#1056'_'#1059#1051#1048#1062#1067
      'STREET_NAME='#1059#1051#1048#1062#1040
      'HOUSE_NO=N_'#1044#1054#1052#1040
      'STREET_ID='#1050#1054#1044'_'#1059#1051#1048#1062#1067
      'BALANCE=BALANCE'
      'CONNECTED=CONNECTED'
      '-SECRET1=SECRET1')
    OpenDataSource = False
    DataSet = dsCustomers
    BCDToCurrency = False
    Left = 275
    Top = 320
  end
  object frxReport: TfrxReport
    Version = '2021.2.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 37871.997208472200000000
    ReportOptions.Description.Strings = (
      
        'This example shows how to create nested reports using subreport ' +
        'component.')
    ReportOptions.LastChange = 38077.610186261600000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnUserFunction = frxReportUserFunction
    Left = 280
    Top = 136
  end
  object frxCustomer: TfrxDBDataset
    RangeBegin = rbCurrent
    RangeEnd = reCurrent
    UserName = #1040#1041#1054#1053#1045#1053#1058
    CloseDataSource = False
    FieldAliases.Strings = (
      'CUSTOMER_ID='#1059#1053#1048#1050#1040#1051#1068#1053#1067#1049'_'#1053#1054#1052#1045#1056'_'#1040#1041#1054#1053#1045#1053#1058#1040
      'CUST_CODE='#1050#1054#1044'_'#1040#1041#1054#1053#1045#1053#1058#1040
      'HOUSE_ID='#1050#1054#1044'_'#1044#1054#1052#1040
      'ACCOUNT_NO='#1051#1048#1062#1045#1042#1054#1049
      'DOGOVOR_NO=DOGOVOR_NO'
      'SURNAME='#1060#1040#1052#1048#1051#1048#1071
      'FIRSTNAME='#1048#1052#1071
      'MIDLENAME='#1054#1058#1063#1045#1057#1058#1042#1054
      'INITIALS='#1048#1054
      'CONTRACT_DATE='#1044#1040#1058#1040'_'#1044#1054#1043#1054#1042#1054#1056#1040
      'ACTIVIZ_DATE='#1044#1040#1058#1040'_'#1055#1045#1056#1042'_'#1055#1054#1044#1050#1051#1070#1063#1045#1053#1048#1071
      'PHONE_NO='#1058#1045#1051#1045#1060#1054#1053
      'NOTICE='#1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
      'VALID_TO='#1044#1054#1043#1054#1042#1054#1056'_'#1044#1054
      'CUST_STATE='#1057#1058#1040#1058#1059#1057
      'CUST_STATE_DESCR='#1055#1054#1051#1053#1067#1049'_'#1057#1058#1040#1058#1059#1057
      'CUST_PROP='#1040#1058#1056#1048#1041#1059#1058#1067
      'CUST_PROP_DESCR=CUST_PROP_DESCR'
      'FLAT_NO='#1050#1042#1040#1056#1058#1048#1056#1040
      'DEBT_SUM='#1057#1040#1051#1068#1044#1054
      'PASSPORT_NUMBER=N_'#1055#1040#1057#1055#1054#1056#1058#1040
      'PASSPORT_REGISTRATION='#1055#1040#1057#1055#1054#1056#1058'_'#1042#1067#1044#1040#1053
      '-EXPENSE_1=EXPENSE_1'
      '-MANAGER_ID='#1044#1054#1043#1054#1042#1054#1056'_'#1057#1054#1057#1058#1040#1042#1048#1051
      'JURIDICAL='#1070#1056'_'#1051#1048#1062#1054
      'JUR_INN='#1070#1056'_'#1048#1053#1053
      'JUR_DIRECTOR='#1070#1056'_'#1044#1048#1056#1045#1050#1058#1054#1056
      'JUR_BUH='#1070#1056'_'#1041#1059#1061#1043#1040#1051#1058#1045#1056
      'CGIS='#1055#1056#1048#1047#1053#1040#1050
      '-ADDED_BY=ADDED_BY'
      '-ADDED_ON=ADDED_ON'
      '-EDIT_BY=EDIT_BY'
      '-EDIT_ON=EDIT_ON'
      'MOBILE_PHONE='#1052#1054#1041#1048#1051#1068#1053#1067#1049
      'HIS_COLOR='#1062#1042#1045#1058
      'PORCH_N='#1055#1054#1044#1066#1045#1047#1044
      'FLOOR_N='#1069#1058#1040#1046
      '-INVISIBLE=INVISIBLE'
      'EMAIL=EMAIL'
      'BIRTHDAY='#1044#1056#1054#1046#1044#1045#1053#1048#1071
      'ADRES_REGISTR='#1040#1044#1056#1045#1057'_'#1056#1045#1043#1048#1057#1058#1056#1040#1062#1048#1048
      'TIME_ON_MINUS='#1044#1040#1058#1040'_'#1042'_'#1052#1048#1053#1059#1057
      '-ORG_ID='#1050#1054#1044'_'#1054#1056#1043#1040#1053#1048#1047#1040#1062#1048#1048
      '-VATG_ID=VATG_ID'
      '-FLAT_DIGIT=FLAT_DIGIT'
      'STREET_SHORT='#1057#1054#1050#1056'_'#1059#1051#1048#1062#1067
      'STREET_NAME='#1059#1051#1048#1062#1040
      'HOUSE_NO=N_'#1044#1054#1052#1040
      'STREET_ID='#1050#1054#1044'_'#1059#1051#1048#1062#1067
      '-BALANCE=BALANCE'
      '-CONNECTED=CONNECTED'
      'SECRET=SECRET'
      'PERSONAL_N=PERSONAL_N'
      'CONTRACT_BASIS=PLACE_FACE')
    DataSet = dsCustomers
    BCDToCurrency = False
    Left = 363
    Top = 320
  end
  object frxmdsBalance: TfrxDBDataset
    UserName = 'mdsBalance'
    CloseDataSource = True
    DataSet = mdsBalance
    BCDToCurrency = False
    Left = 390
    Top = 193
  end
  object pmSelectPrintDoc: TPopupMenu
    Left = 210
    Top = 211
  end
  object dsFilter: TMemTableEh
    Params = <>
    OnNewRecord = dsFilterNewRecord
    Left = 35
    Top = 331
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object FLAT_NO: TMTStringDataFieldEh
          FieldName = 'FLAT_NO'
          StringDataType = fdtStringEh
          DisplayLabel = 'FLAT_NO'
          DisplayWidth = 20
          Transliterate = True
        end
        object CHECK_ADRESS: TMTNumericDataFieldEh
          FieldName = 'CHECK_ADRESS'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CHECK_ADRESS'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CHECK_DEBT: TMTNumericDataFieldEh
          FieldName = 'CHECK_DEBT'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CHECK_DEBT'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DebtMode: TMTNumericDataFieldEh
          FieldName = 'DebtMode'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayLabel = 'DebtMode'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DEBT_SUM: TMTNumericDataFieldEh
          FieldName = 'DEBT_SUM'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayLabel = 'DEBT_SUM'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DEBT_SIGN: TMTNumericDataFieldEh
          FieldName = 'DEBT_SIGN'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'DEBT_SIGN'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DebtTo: TMTNumericDataFieldEh
          FieldName = 'DebtTo'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayLabel = 'DebtTo'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object STATE_1: TMTNumericDataFieldEh
          FieldName = 'STATE_1'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'STATE_1'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object STREET_ID: TMTNumericDataFieldEh
          FieldName = 'STREET_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'STREET_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object HOUSE_ID: TMTNumericDataFieldEh
          FieldName = 'HOUSE_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'HOUSE_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object PAYSOURCE_ID: TMTNumericDataFieldEh
          FieldName = 'PAYSOURCE_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'PAYSOURCE_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object NOTICE_SGN: TMTNumericDataFieldEh
          FieldName = 'NOTICE_SGN'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'NOTICE_SGN'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DISCOUNT_FACTOR_SGN: TMTNumericDataFieldEh
          FieldName = 'DISCOUNT_FACTOR_SGN'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'DISCOUNT_FACTOR_SGN'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SUBSCR_HIST_SGN: TMTNumericDataFieldEh
          FieldName = 'SUBSCR_HIST_SGN'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'SUBSCR_HIST_SGN'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object ACT_SGN: TMTNumericDataFieldEh
          FieldName = 'ACT_SGN'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'ACT_SGN'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object PAY_SGN: TMTNumericDataFieldEh
          FieldName = 'PAY_SGN'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'PAY_SGN'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object VALID_TO_SGN: TMTNumericDataFieldEh
          FieldName = 'VALID_TO_SGN'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'VALID_TO_SGN'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object VALID_TO_ON: TMTNumericDataFieldEh
          FieldName = 'VALID_TO_ON'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'VALID_TO_ON'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object VALID_TO_OFF: TMTNumericDataFieldEh
          FieldName = 'VALID_TO_OFF'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'VALID_TO_OFF'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object INVALID_CONTRACT_DATE: TMTNumericDataFieldEh
          FieldName = 'INVALID_CONTRACT_DATE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'INVALID_CONTRACT_DATE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object AREA_ID: TMTNumericDataFieldEh
          FieldName = 'AREA_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'AREA_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SUBAREA_ID: TMTNumericDataFieldEh
          FieldName = 'SUBAREA_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'SUBAREA_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DATE_FROM: TMTDateTimeDataFieldEh
          FieldName = 'DATE_FROM'
          DateTimeDataType = fdtDateEh
          DisplayLabel = 'DATE_FROM'
          DisplayWidth = 10
        end
        object DATE_TO: TMTDateTimeDataFieldEh
          FieldName = 'DATE_TO'
          DateTimeDataType = fdtDateEh
          DisplayLabel = 'DATE_TO'
          DisplayWidth = 10
        end
        object WORK_DATE: TMTDateTimeDataFieldEh
          FieldName = 'WORK_DATE'
          DateTimeDataType = fdtDateTimeEh
          DisplayLabel = 'WORK_DATE'
          DisplayWidth = 18
        end
        object SERV_ID: TMTNumericDataFieldEh
          FieldName = 'SERV_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'SERV_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object ACT_SERV_ID: TMTNumericDataFieldEh
          FieldName = 'ACT_SERV_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'ACT_SERV_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CUST_PROP_DESCR: TMTStringDataFieldEh
          FieldName = 'CUST_PROP_DESCR'
          StringDataType = fdtStringEh
          DisplayLabel = 'CUST_PROP_DESCR'
          DisplayWidth = 6
          Size = 6
          Transliterate = True
        end
        object CONTRACT_DATE_SGN: TMTNumericDataFieldEh
          FieldName = 'CONTRACT_DATE_SGN'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CONTRACT_DATE_SGN'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object DoubleAddress: TMTNumericDataFieldEh
          FieldName = 'DoubleAddress'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayLabel = 'DoubleAddress'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object LETTERS_SEND: TMTNumericDataFieldEh
          FieldName = 'LETTERS_SEND'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'LETTERS_SEND'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object LETTERS_NOT_SEND: TMTNumericDataFieldEh
          FieldName = 'LETTERS_NOT_SEND'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'LETTERS_NOT_SEND'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object LETTERS_TYPE: TMTNumericDataFieldEh
          FieldName = 'LETTERS_TYPE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'LETTERS_TYPE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object PERIOD_SGN: TMTNumericDataFieldEh
          FieldName = 'PERIOD_SGN'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'PERIOD_SGN'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object single_id: TMTNumericDataFieldEh
          FieldName = 'single_id'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'single_id'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CUST_ATTRIBUTE: TMTNumericDataFieldEh
          FieldName = 'CUST_ATTRIBUTE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CUST_ATTRIBUTE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CUST_NOT_ATTRIBUTE: TMTNumericDataFieldEh
          FieldName = 'CUST_NOT_ATTRIBUTE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CUST_NOT_ATTRIBUTE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object JURIDICAL: TMTNumericDataFieldEh
          FieldName = 'JURIDICAL'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayLabel = 'JURIDICAL'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object next_condition: TMTNumericDataFieldEh
          FieldName = 'next_condition'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'next_condition'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object INVERSION: TMTBooleanDataFieldEh
          FieldName = 'INVERSION'
          DisplayLabel = 'INVERSION'
          DisplayWidth = 5
        end
        object ORGZ_ID: TMTNumericDataFieldEh
          FieldName = 'ORGZ_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'ORGZ_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SUPERMODE: TMTBooleanDataFieldEh
          FieldName = 'SUPERMODE'
          DisplayLabel = 'SUPERMODE'
          DisplayWidth = 5
        end
        object Accounts: TMTStringDataFieldEh
          FieldName = 'Accounts'
          StringDataType = fdtStringEh
          DisplayLabel = 'Accounts'
          DisplayWidth = 2000
          Size = 2000
          Transliterate = True
        end
        object EXTENDED_FLTR: TMTNumericDataFieldEh
          FieldName = 'EXTENDED_FLTR'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayLabel = 'EXTENDED_FLTR'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SQL_FLTR: TMTStringDataFieldEh
          FieldName = 'SQL_FLTR'
          StringDataType = fdtStringEh
          DisplayLabel = 'SQL_FLTR'
          DisplayWidth = 2000
          Size = 2000
          Transliterate = True
        end
        object WORKAREA: TMTNumericDataFieldEh
          FieldName = 'WORKAREA'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'WORKAREA'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object WORKGROUP: TMTNumericDataFieldEh
          FieldName = 'WORKGROUP'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'WORKGROUP'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SFLTR_TYPE: TMTNumericDataFieldEh
          FieldName = 'SFLTR_TYPE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'SFLTR_TYPE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SFLTR_TEXT: TMTStringDataFieldEh
          FieldName = 'SFLTR_TEXT'
          StringDataType = fdtStringEh
          DisplayLabel = 'SFLTR_TEXT'
          DisplayWidth = 5000
          Size = 5000
          Transliterate = True
        end
        object SRVTYPES: TMTNumericDataFieldEh
          FieldName = 'SRVTYPES'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'SRVTYPES'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object MAINHEAD: TMTNumericDataFieldEh
          FieldName = 'MAINHEAD'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'MAINHEAD'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object ATTRIB_VALUE: TMTStringDataFieldEh
          FieldName = 'ATTRIB_VALUE'
          StringDataType = fdtStringEh
          DisplayLabel = 'ATTRIB_VALUE'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object MONTH: TMTNumericDataFieldEh
          FieldName = 'MONTH'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object PREPAY: TMTBooleanDataFieldEh
          FieldName = 'PREPAY'
          DisplayWidth = 20
        end
        object MSG_NOT: TMTNumericDataFieldEh
          FieldName = 'MSG_NOT'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object MSG_SEND: TMTNumericDataFieldEh
          FieldName = 'MSG_SEND'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object PERS_TARIF: TMTNumericDataFieldEh
          FieldName = 'PERS_TARIF'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 0
        end
        object PERS_TARIF_DATE: TMTDateTimeDataFieldEh
          FieldName = 'PERS_TARIF_DATE'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object DISCOUNT_DATE: TMTDateTimeDataFieldEh
          FieldName = 'DISCOUNT_DATE'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object CODES: TMTStringDataFieldEh
          FieldName = 'CODES'
          StringDataType = fdtStringEh
          DisplayLabel = 'CODES'
          DisplayWidth = 2000
          Size = 2000
        end
        object OFFDAYS: TMTNumericDataFieldEh
          FieldName = 'OFFDAYS'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object ListType: TMTNumericDataFieldEh
          FieldName = 'ListType'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object ListValues: TMTStringDataFieldEh
          FieldName = 'ListValues'
          StringDataType = fdtStringEh
          DisplayWidth = 3000
          Size = 3000
        end
        object BIRTHDAY: TMTNumericDataFieldEh
          FieldName = 'BIRTHDAY'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DefaultExpression = '0'
          DisplayWidth = 20
          currency = False
          MaxValue = 2.000000000000000000
          Precision = 15
        end
        object FILE_TYPE: TMTNumericDataFieldEh
          FieldName = 'FILE_TYPE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object FILE_TYPE_EXCLUDE: TMTNumericDataFieldEh
          FieldName = 'FILE_TYPE_EXCLUDE'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object NOTPAYDAYS: TMTNumericDataFieldEh
          FieldName = 'NOTPAYDAYS'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object ATTRTYPE: TMTNumericDataFieldEh
          FieldName = 'ATTRTYPE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object HANDCONTROL: TMTNumericDataFieldEh
          FieldName = 'HANDCONTROL'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object beFee: TMTNumericDataFieldEh
          FieldName = 'beFee'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object debtLow: TMTBooleanDataFieldEh
          FieldName = 'debtLow'
          DisplayWidth = 20
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object mdsBalance: TMemTableEh
    Params = <>
    Left = 423
    Top = 123
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object CUSTOMER_ID: TMTNumericDataFieldEh
          FieldName = 'CUSTOMER_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CUSTOMER_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object RMONTH: TMTDateTimeDataFieldEh
          FieldName = 'RMONTH'
          DateTimeDataType = fdtDateEh
          DisplayLabel = 'RMONTH'
          DisplayWidth = 10
        end
        object FDESCRIPTION: TMTStringDataFieldEh
          FieldName = 'FDESCRIPTION'
          StringDataType = fdtStringEh
          DisplayLabel = 'FDESCRIPTION'
          DisplayWidth = 500
          Size = 500
          Transliterate = True
        end
        object PDESCRIPTION: TMTStringDataFieldEh
          FieldName = 'PDESCRIPTION'
          StringDataType = fdtStringEh
          DisplayLabel = 'PDESCRIPTION'
          DisplayWidth = 500
          Size = 500
          Transliterate = True
        end
        object FSUMMA: TMTNumericDataFieldEh
          FieldName = 'FSUMMA'
          NumericDataType = fdtCurrencyEh
          AutoIncrement = False
          DisplayLabel = 'FSUMMA'
          DisplayWidth = 10
          currency = True
          Precision = 15
        end
        object PSUMMA: TMTNumericDataFieldEh
          FieldName = 'PSUMMA'
          NumericDataType = fdtCurrencyEh
          AutoIncrement = False
          DisplayLabel = 'PSUMMA'
          DisplayWidth = 10
          currency = True
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object dsStreets: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    s.street_id'
      '  , s.street_name || '#39' '#39' || s.street_short as street_name'
      '  , a.area_name'
      '  , s.STREET_CODE'
      '  , a.Area_Id'
      '  from STREET s'
      '       left outer join area a on (a.area_id = s.area_id)'
      'where ((s.area_id = :area_id) or (:area_id is null))           '
      'order by STREET_NAME, a.area_name')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 521
    Top = 330
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 596
    Top = 331
  end
  object dsHomes: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    H.HOUSE_ID,'
      '    H.STREET_ID,'
      '    H.HOUSE_NO,'
      '    H.Q_FLAT'
      'FROM'
      '    HOUSE H'
      'where h.street_id = :street_id'
      'order by h.HOUSE_NO'
      '')
    Transaction = trRead
    Database = dmMain.dbTV
    DataSource = srcStreet
    Left = 517
    Top = 383
  end
  object srcHouse: TDataSource
    DataSet = dsHomes
    Left = 594
    Top = 373
  end
  object dsFLAT: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT '
      '  distinct iif(FLAT_NO<>'#39#39', FLAT_NO, '#39'-'#39') FLAT_NO, FLAT_DIGIT'
      'FROM'
      '  CUSTOMER C'
      'where '
      '  c.HOUSE_ID = :HOUSE_id'
      'order by FLAT_NO')
    Transaction = trRead
    Database = dmMain.dbTV
    DataSource = srcHouse
    Left = 526
    Top = 437
  end
  object srcFLAT: TDataSource
    DataSet = dsFLAT
    Left = 597
    Top = 436
  end
  object dsArea: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from AREA'
      'where AREA_ID <> 0'
      'order by AREA_NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 521
    Top = 277
    oFetchAll = True
  end
  object srcArea: TDataSource
    DataSet = dsArea
    Left = 590
    Top = 277
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
  object srcPages: TDataSource
    DataSet = mtbPages
    OnDataChange = srcPagesDataChange
    Left = 32
    Top = 432
  end
  object pmRecourse: TPopupMenu
    Left = 704
    Top = 176
    object miRecAdd1: TMenuItem
      Action = actRecAdd
    end
    object miRecAddWAdres: TMenuItem
      Action = actRecAddWAdres
    end
  end
end
