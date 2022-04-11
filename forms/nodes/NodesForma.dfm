object NodesForm: TNodesForm
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1091#1079#1083#1086#1074
  ClientHeight = 554
  ClientWidth = 894
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
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object splMain: TSplitter
    Left = 0
    Top = 337
    Width = 894
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object pnlForms: TPanel
    Left = 0
    Top = 340
    Width = 894
    Height = 214
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object spl1: TSplitter
      Left = 128
      Top = 0
      Height = 214
    end
    object pnlDATA: TPanel
      Left = 131
      Top = 0
      Width = 763
      Height = 214
      Align = alClient
      BevelOuter = bvNone
      Caption = '````'
      TabOrder = 1
    end
    object pnl1: TPanel
      Left = 0
      Top = 0
      Width = 128
      Height = 214
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'pnl1'
      TabOrder = 0
      object lstForms: TListBox
        Left = 0
        Top = 0
        Width = 128
        Height = 214
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clBtnHighlight
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnClick = lstFormsClick
      end
    end
  end
  object dbgNodes: TDBGridEh
    Left = 0
    Top = 225
    Width = 894
    Height = 112
    Align = alClient
    AllowedOperations = []
    ColumnDefValues.ToolTips = True
    DataSource = srcNodes
    DrawMemoText = True
    DynProps = <>
    EditActions = [geaCopyEh, geaSelectAllEh]
    EvenRowColor = clInfoBk
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    IndicatorParams.RecNoShowStep = 5
    IndicatorTitle.ShowDropDownSign = True
    IndicatorTitle.TitleButton = True
    IndicatorTitle.UseGlobalMenu = False
    EmptyDataInfo.Text = #1053#1077#1090' '#1079#1072#1087#1080#1089#1077#1081
    OddRowColor = clWindow
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgMultiSelect]
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
    SumList.Active = True
    TabOrder = 3
    TitleParams.MultiTitle = True
    TitleParams.VTitleMargin = 8
    OnDblClick = dbgNodesDblClick
    OnGetCellParams = dbgNodesGetCellParams
    OnGetFooterParams = dbgNodesGetFooterParams
    OnSortMarkingChanged = dbgNodesSortMarkingChanged
    OnSelectedRowsItemChanged = dbgNodesSelectedRowsItemChanged
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1079#1083#1072
        Title.TitleButton = True
        Width = 106
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1091#1079#1083#1072
        Title.TitleButton = True
        Width = 142
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
        DynProps = <>
        EditButtons = <>
        FieldName = 'LAT'
        Footers = <>
        Title.Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099'|'#1064#1080#1088#1086#1090#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'LON'
        Footers = <>
        Title.Caption = #1050#1086#1086#1088#1076#1080#1085#1072#1090#1099'|'#1044#1086#1083#1075#1086#1090#1072
        Title.TitleButton = True
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
        FieldName = 'P_NAME'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082'|'#1059#1079#1077#1083
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'P_TYPE'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082'|'#1058#1080#1087
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'P_STREET'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082'|'#1059#1083#1080#1094#1072
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'P_HOUSE'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082'|'#1044#1086#1084
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlBtns: TPanel
    Left = 0
    Top = 0
    Width = 894
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
      Width = 585
      Height = 24
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object ToolBar1: TToolBar
        Left = 92
        Top = 0
        Width = 493
        Height = 24
        Align = alClient
        Caption = 'ToolBar1'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 1
        object ToolButton1: TToolButton
          Left = 0
          Top = 0
          Action = actNodeAdd
        end
        object ToolButton2: TToolButton
          Left = 23
          Top = 0
          Action = actNodeEdit
        end
        object ToolButton16: TToolButton
          Left = 46
          Top = 0
          Width = 8
          Caption = 'ToolButton16'
          ImageIndex = 31
          Style = tbsSeparator
        end
        object ToolButton13: TToolButton
          Left = 54
          Top = 0
          Action = ActionRefresh
        end
        object ToolButton12: TToolButton
          Left = 77
          Top = 0
          Width = 8
          Caption = 'ToolButton12'
          ImageIndex = 24
          Style = tbsSeparator
        end
        object ToolButton17: TToolButton
          Left = 85
          Top = 0
          Action = actRequest
        end
        object btn1: TToolButton
          Left = 108
          Top = 0
          Width = 8
          Caption = 'btn1'
          ImageIndex = 38
          Style = tbsSeparator
        end
        object chkTREE: TCheckBox
          Left = 116
          Top = 0
          Width = 165
          Height = 22
          BiDiMode = bdRightToLeft
          Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1074' '#1074#1080#1076#1077' '#1076#1077#1088#1077#1074#1072
          ParentBiDiMode = False
          TabOrder = 0
          OnClick = chkTREEClick
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
          Action = actAdresSearch
        end
      end
    end
  end
  object pnlSearchAdres: TPanel
    Left = 0
    Top = 24
    Width = 894
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object Label1: TLabel
      Left = 5
      Top = 11
      Width = 92
      Height = 13
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1072#1076#1088#1077#1089#1091
    end
    object Label2: TLabel
      Left = 370
      Top = 11
      Width = 19
      Height = 13
      Caption = #1076#1086#1084
    end
    object lcbStreets: TDBLookupComboboxEh
      Left = 103
      Top = 8
      Width = 240
      Height = 19
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
          FieldName = 'STREET_SHORT'
          Title.Caption = #1089#1086#1082#1088'.'
          Width = 25
        end
        item
          FieldName = 'AREA_NAME'
          Title.Caption = #1056#1072#1081#1086#1085
        end>
      DropDownBox.AutoDrop = True
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1059#1083#1080#1094#1072
      EditButtons = <>
      Flat = True
      KeyField = 'STREET_ID'
      ListField = 'STREET_NAME'
      ListSource = srcStreet
      TabOrder = 0
      Visible = True
      OnChange = lcbStreetsChange
    end
    object lcbHOUSE: TDBLookupComboboxEh
      Left = 397
      Top = 8
      Width = 73
      Height = 19
      Hint = #1044#1086#1084
      DynProps = <>
      DataField = ''
      EmptyDataInfo.Text = #1044#1086#1084
      EditButtons = <>
      Flat = True
      KeyField = 'HOUSE_ID'
      ListField = 'HOUSE_NO'
      ListSource = srcHouse
      TabOrder = 1
      Visible = True
      OnChange = lcbHOUSEChange
    end
  end
  object pnlEdit: TPanel
    Left = 0
    Top = 53
    Width = 894
    Height = 172
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    DesignSize = (
      894
      172)
    object lbl2: TLabel
      Left = 5
      Top = 38
      Width = 44
      Height = 13
      Caption = #1058#1080#1087' '#1091#1079#1083#1072
    end
    object lbl3: TLabel
      Left = 5
      Top = 95
      Width = 61
      Height = 13
      Anchors = [akLeft, akTop, akRight]
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object lbl4: TLabel
      Left = 5
      Top = 9
      Width = 31
      Height = 13
      Caption = #1059#1083#1080#1094#1072
    end
    object lbl5: TLabel
      Left = 347
      Top = 9
      Width = 41
      Height = 13
      Caption = #8470' '#1076#1086#1084#1072
    end
    object lbl6: TLabel
      Left = 784
      Top = 9
      Width = 31
      Height = 13
      Caption = #1052#1077#1089#1090#1086
    end
    object lbl7: TLabel
      Left = 603
      Top = 9
      Width = 45
      Height = 13
      Caption = #1055#1086#1076#1098#1077#1079#1076
    end
    object lbl8: TLabel
      Left = 701
      Top = 9
      Width = 27
      Height = 13
      Caption = #1069#1090#1072#1078
    end
    object btnMap: TSpeedButton
      Left = 320
      Top = 64
      Width = 23
      Height = 22
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1085#1072' '#1082#1072#1088#1090#1077
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDE
        DEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB5B5B5CECECEFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC1C1C16E
        6E6E6E6E6EEDEDEDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFDADADA6E6E6E555555555555A9A9A9FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F86E6E6E55555555
        55555555556E6E6EC9C9C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFA9A9A95555555555555555555555555555556E6E6EEAEAEAFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1E16E6E6E55555557575780
        80806E6E6E525252555555A9A9A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA9A9A9555555727272F3F3F3FFFFFFFFFFFFC0C0C05151516E6E6EE8E8
        E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9515151DEDEDEFFFFFFFF
        FFFFFFFFFFFFFFFF858585555555AEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFA9A9A94E4E4EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A3A3555555A9A9
        A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9A9A9515151D4D4D4FFFFFFFF
        FFFFFFFFFFFFFFFF7C7C7C6E6E6ED6D6D6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFC8C8C86E6E6E686868E6E6E6FFFFFFFFFFFFA8A8A8525252A9A9A9FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBEBEBE6E6E6E5050506A
        6A6A5A5A5A5353536E6E6ED9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFC7C7C7A9A9A9A9A9A9A9A9A9A9A9A9E7E7E7FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object lbl10: TLabel
      Left = 176
      Top = 68
      Width = 46
      Height = 13
      Caption = #1044#1086#1083#1075#1086#1090#1072' '
    end
    object lbl9: TLabel
      Left = 5
      Top = 68
      Width = 40
      Height = 13
      Caption = #1064#1080#1088#1086#1090#1072
    end
    object lbl11: TLabel
      Left = 347
      Top = 38
      Width = 48
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object lbl12: TLabel
      Left = 347
      Top = 68
      Width = 45
      Height = 13
      Caption = #1055#1086#1076#1082#1083'. '#1082
    end
    object btnSaveLink: TBitBtn
      Left = 72
      Top = 139
      Width = 709
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 11
      OnClick = btnSaveLinkClick
    end
    object btnCancelLink: TBitBtn
      Left = 787
      Top = 139
      Width = 98
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 12
      OnClick = btnCancelLinkClick
    end
    object cbbTYPE_ID: TDBLookupComboboxEh
      Left = 72
      Top = 35
      Width = 271
      Height = 21
      DynProps = <>
      DataField = 'TYPE_ID'
      DataSource = srcNodes
      DropDownBox.Columns = <
        item
          FieldName = 'O_NAME'
          Width = 80
        end
        item
          FieldName = 'O_DIMENSION'
          Width = 20
        end>
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1058#1080#1087' '#1091#1079#1083#1072
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcNodeType
      TabOrder = 5
      Visible = True
    end
    object mmoNOTICE: TDBMemoEh
      Left = 72
      Top = 92
      Width = 813
      Height = 41
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcNodes
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      TabOrder = 10
      Visible = True
      WantReturns = True
    end
    object cbbSTREET_ID: TDBLookupComboboxEh
      Left = 72
      Top = 6
      Width = 271
      Height = 21
      Hint = #1059#1082#1072#1078#1080#1090#1077' '#1076#1086#1084' ('#1080#1083#1080' '#1073#1083#1080#1078#1072#1081#1096#1080#1081' '#1076#1086#1084') '#1091#1079#1083#1072
      DynProps = <>
      DataField = 'STREET_ID'
      DataSource = srcNodes
      DropDownBox.Columns = <
        item
          FieldName = 'STREET_NAME'
          Title.Caption = #1059#1083#1080#1094#1072
        end
        item
          FieldName = 'STREET_CODE'
          Title.Caption = #1082#1086#1076
        end
        item
          FieldName = 'AREA_NAME'
          Title.Caption = #1056#1072#1081#1086#1085
          Width = 60
        end>
      DropDownBox.AutoDrop = True
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1059#1083#1080#1094#1072
      EditButtons = <>
      KeyField = 'STREET_ID'
      ListField = 'STREET_NAME'
      ListSource = srcStreet
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object cbbHOUSE_ID: TDBLookupComboboxEh
      Left = 397
      Top = 6
      Width = 196
      Height = 21
      Hint = #1059#1082#1072#1078#1080#1090#1077' '#1076#1086#1084' ('#1080#1083#1080' '#1073#1083#1080#1078#1072#1081#1096#1080#1081' '#1076#1086#1084') '#1091#1079#1083#1072
      DynProps = <>
      DataField = 'HOUSE_ID'
      DataSource = srcNodes
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1044#1086#1084
      EditButtons = <>
      KeyField = 'HOUSE_ID'
      ListField = 'HOUSE_NO'
      ListSource = srcHouse
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnChange = OnAdressChange
    end
    object edtPlace: TDBEditEh
      Left = 821
      Top = 6
      Width = 64
      Height = 21
      Hint = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' / '#1071#1097#1080#1082
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PLACE'
      DataSource = srcNodes
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1052#1077#1089#1090#1086
      TabOrder = 4
      Visible = True
      OnChange = OnAdressChange
    end
    object edtPORCH_N: TDBEditEh
      Left = 654
      Top = 6
      Width = 35
      Height = 21
      DataField = 'PORCH_N'
      DataSource = srcNodes
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1086#1076#1098#1077#1079#1076
      TabOrder = 2
      Visible = True
      OnChange = OnAdressChange
    end
    object edtFLOOR_N: TDBEditEh
      Left = 734
      Top = 6
      Width = 39
      Height = 21
      DataField = 'FLOOR_N'
      DataSource = srcNodes
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1069#1090#1072#1078
      TabOrder = 3
      Visible = True
      OnChange = OnAdressChange
    end
    object edtLon: TDBNumberEditEh
      Left = 226
      Top = 65
      Width = 88
      Height = 21
      DataField = 'LON'
      DataSource = srcNodes
      DecimalPlaces = 8
      DynProps = <>
      EmptyDataInfo.Text = 'Longitude'
      EditButtons = <>
      TabOrder = 8
      Visible = True
    end
    object edtLat: TDBNumberEditEh
      Left = 72
      Top = 65
      Width = 90
      Height = 21
      DataField = 'LAT'
      DataSource = srcNodes
      DecimalPlaces = 8
      DynProps = <>
      EmptyDataInfo.Text = 'Latitude'
      EditButtons = <>
      TabOrder = 7
      Visible = True
    end
    object edtNAME: TDBEditEh
      Left = 397
      Top = 35
      Width = 488
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NAME'
      DataSource = srcNodes
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077
      TabOrder = 6
      Visible = True
      OnKeyDown = edtNAMEKeyDown
      OnKeyUp = edtNAMEKeyUp
    end
    object cbbPARENT: TDBLookupComboboxEh
      Left = 397
      Top = 65
      Width = 488
      Height = 21
      Hint = #1059#1082#1072#1078#1080#1090#1077' '#1082' '#1082#1072#1082#1086#1084#1091' '#1091#1079#1083#1091' '#1087#1086#1076#1082#1083#1102#1095#1077#1085
      AutoSize = False
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'PARENT_ID'
      DataSource = srcNodes
      DropDownBox.AutoFitColWidths = False
      DropDownBox.Columns = <
        item
          AutoFitColWidth = False
          FieldName = 'NAME'
          Title.Caption = #1059#1079#1077#1083
          Title.TitleButton = True
        end
        item
          AutoFitColWidth = False
          FieldName = 'O_Name'
          Title.Caption = #1058#1080#1087
          Title.TitleButton = True
          Width = 45
        end
        item
          AutoFitColWidth = False
          FieldName = 'Street_Name'
          Title.Caption = #1059#1083#1080#1094#1072
          Title.TitleButton = True
        end
        item
          AutoFitColWidth = False
          FieldName = 'House_No'
          Title.Caption = #1044#1086#1084
          Title.TitleButton = True
          Width = 40
        end>
      DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh, dlgAutoSortMarkingEh]
      DropDownBox.SortLocal = True
      DropDownBox.AutoDrop = True
      DropDownBox.Rows = 10
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1091#1079#1083#1091
      EditButtons = <>
      KeyField = 'Node_Id'
      ListField = 'Name'
      ListSource = srcParent
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      Visible = True
      OnChange = OnAdressChange
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
    Left = 165
    Top = 371
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 163
    Top = 423
  end
  object dsNodes: TpFIBDataSet
    UpdateSQL.Strings = (
      'update Nodes'
      'set House_Id = :House_Id,'
      '    Type_Id = :Type_Id,'
      '    Name = :Name,'
      '    Notice = :Notice,'
      '    Lat = :Lat,'
      '    Lon = :Lon,'
      '    Floor_N = :Floor_N,'
      '    Porch_N = :Porch_N,'
      '    PLACE = :PLACE,'
      '    Parent_Id = :Parent_Id'
      'where Node_Id = :Node_Id')
    DeleteSQL.Strings = (
      'execute procedure Delete_Node(:OLD_NODE_ID)'
      ''
      '    ')
    InsertSQL.Strings = (
      
        'insert into Nodes (Node_Id, House_Id, Type_Id, Name, Notice, Lat' +
        ', Lon, Floor_N, Porch_N, PLACE, Parent_Id)'
      
        'values (:Node_Id, :House_Id, :Type_Id, :Name, :Notice, :Lat, :Lo' +
        'n, :Floor_N, :Porch_N, :PLACE, :Parent_Id)')
    RefreshSQL.Strings = (
      'select'
      '  n.*'
      ', o.O_Name'
      ', o.O_DIMENSION as COLOR'
      ', s.street_short'
      ', S.Street_Name'
      ', H.House_No'
      ', h.Street_ID'
      ', p.Name P_NAME'
      ', po.O_Name P_TYPE'
      ', pS.Street_Name||'#39' '#39'||ps.street_short P_STREET'
      ', pH.House_No P_HOUSE'
      'FROM NODES n'
      '   INNER JOIN HOUSE H ON (n.HOUSE_ID = H.HOUSE_ID)'
      '   INNER JOIN STREET S ON (H.STREET_ID = S.STREET_ID)'
      
        '   INNER join objects o on (o.O_Id = n.Type_Id and o.O_Type = 38' +
        ')'
      '   left outer join NODES p on (p.Node_Id = n.Parent_Id)'
      '   left outer JOIN HOUSE pH ON (pH.HOUSE_ID = p.HOUSE_ID)'
      '   left outer JOIN STREET pS ON (pS.STREET_ID = pH.STREET_ID)'
      
        '   left outer join objects po on (po.O_Id = p.Type_Id and po.O_T' +
        'ype = 38)'
      'where(     N.NODE_ID = :OLD_NODE_ID     )')
    SelectSQL.Strings = (
      'select'
      '  n.*'
      ', o.O_Name'
      ', o.O_DIMENSION as COLOR'
      ', s.street_short'
      ', S.Street_Name'
      ', H.House_No'
      ', h.Street_ID'
      ', p.Name P_NAME'
      ', po.O_Name P_TYPE'
      ', pS.Street_Name||'#39' '#39'||ps.street_short P_STREET'
      ', pH.House_No P_HOUSE'
      'FROM NODES n'
      '   INNER JOIN HOUSE H ON (n.HOUSE_ID = H.HOUSE_ID)'
      '   INNER JOIN STREET S ON (H.STREET_ID = S.STREET_ID)'
      
        '   INNER join objects o on (o.O_Id = n.Type_Id and o.O_Type = 38' +
        ')'
      '   left outer join NODES p on (p.Node_Id = n.Parent_Id)'
      '   left outer JOIN HOUSE pH ON (pH.HOUSE_ID = p.HOUSE_ID)'
      '   left outer JOIN STREET pS ON (pS.STREET_ID = pH.STREET_ID)'
      
        '   left outer join objects po on (po.O_Id = p.Type_Id and po.O_T' +
        'ype = 38)'
      'WHERE @@filter%1=1@ ')
    AutoUpdateOptions.UpdateTableName = 'NODES'
    AutoUpdateOptions.KeyFields = 'NODE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AfterOpen = dsNodesAfterOpen
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 213
    Top = 360
    poUseBooleanField = False
    poSetRequiredFields = True
    oVisibleRecno = True
    oFetchAll = True
  end
  object srcNodes: TDataSource
    DataSet = dsNodes
    Left = 411
    Top = 428
  end
  object ActListNodes: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 518
    Top = 449
    object actNodeAdd: TAction
      Caption = #1053#1086#1074#1099#1081' '#1091#1079#1077#1083
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1091#1079#1077#1083
      ImageIndex = 82
      ShortCut = 45
      OnExecute = actNodeAddExecute
    end
    object actNodeEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1091#1079#1077#1083
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1091#1079#1077#1083
      ImageIndex = 83
      ShortCut = 113
      OnExecute = actNodeEditExecute
    end
    object actNodeDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1079#1077#1083
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1091#1079#1077#1083
      ImageIndex = 84
      OnExecute = actNodeDeleteExecute
    end
    object ActSetFilter: TAction
      Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1092#1080#1083#1100#1090#1088#1072
      Hint = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1092#1080#1083#1100#1090#1088#1072
      ImageIndex = 0
      ShortCut = 114
      OnExecute = ActSetFilterExecute
    end
    object actEnableFilter: TAction
      Caption = #1042#1082#1083'/'#1042#1099#1082#1083'. '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100'/'#1074#1099#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ShortCut = 16498
      OnExecute = actEnableFilterExecute
    end
    object actRequest: TAction
      Caption = #1047#1072#1103#1074#1082#1072
      Hint = #1055#1088#1080#1085#1103#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1076#1083#1103' '#1091#1079#1083#1072
      ImageIndex = 37
      ShortCut = 116
      OnExecute = actRequestExecute
    end
    object actQuickFilter: TAction
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083'/'#1042#1099#1082#1083' '#1073#1099#1089#1090#1088#1086#1075#1086' '#1092#1080#1083#1100#1090#1088#1072
      ImageIndex = 33
      ShortCut = 16465
      OnExecute = actQuickFilterExecute
    end
    object actAdresSearch: TAction
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1072#1076#1088#1077#1089#1091
      Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1072#1076#1088#1077#1089#1091
      ImageIndex = 18
      ShortCut = 16454
      OnExecute = actAdresSearchExecute
    end
    object ActionRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077
      ImageIndex = 27
      ShortCut = 16466
      OnExecute = ActionRefreshExecute
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
    object actSetFilterNew: TAction
      Caption = #1053#1086#1074#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1092#1080#1083#1100#1090#1088' '#1089' '#1086#1095#1080#1089#1090#1082#1086#1081' '#1089#1090#1072#1088#1086#1075#1086
      ImageIndex = 0
      ShortCut = 8306
      OnExecute = actSetFilterNewExecute
    end
    object actTask: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      ImageIndex = 87
      ShortCut = 121
      OnExecute = actTaskExecute
    end
    object actLinkNodes: TAction
      Caption = #1051#1080#1085#1080#1103' '#1089#1074#1103#1079#1080
      OnExecute = actLinkNodesExecute
    end
  end
  object mmMenu: TMainMenu
    Left = 840
    Top = 449
    object N18: TMenuItem
      Caption = #1057#1087#1080#1089#1086#1082
      GroupIndex = 5
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
        Action = actAdresSearch
      end
      object N33: TMenuItem
        Caption = #1055#1086#1080#1089#1082
        ImageIndex = 7
      end
      object miN2: TMenuItem
        Caption = '-'
      end
      object miLinkNodes: TMenuItem
        Action = actLinkNodes
      end
      object N48: TMenuItem
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
    end
    object miAbonent: TMenuItem
      Caption = #1059#1079#1077#1083
      GroupIndex = 5
      object N35: TMenuItem
        Action = actRequest
      end
      object N30: TMenuItem
        Caption = '-'
      end
      object N23: TMenuItem
        Action = actNodeAdd
      end
      object N24: TMenuItem
        Action = actNodeEdit
      end
      object N38: TMenuItem
        Caption = '-'
      end
      object mimap: TMenuItem
        Caption = #1050#1072#1088#1090#1072' '#1076#1086#1084#1072
      end
      object N50: TMenuItem
        Caption = '-'
      end
      object N52: TMenuItem
        Action = actNodeDelete
      end
    end
  end
  object actlstSearch: TActionList
    Images = A4MainForm.ilFilter
    Left = 593
    Top = 445
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
    Left = 735
    Top = 430
    object N11: TMenuItem
      Action = actNodeAdd
    end
    object N13: TMenuItem
      Action = actNodeEdit
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Caption = #1047#1072#1103#1074#1082#1080
      OnClick = N10Click
    end
    object miLinkNodes1: TMenuItem
      Action = actLinkNodes
    end
    object mniN28: TMenuItem
      Caption = '-'
    end
    object mniFilterFLD: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1079#1085#1072#1095#1077#1085#1080#1102
      OnClick = actFilterFLDExecute
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
    object miTreeBreak: TMenuItem
      Caption = '-'
    end
    object miTreeCollapse: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = miTreeCollapseClick
    end
    object miTreeExpand: TMenuItem
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      OnClick = miTreeExpandClick
    end
  end
  object pmFilters: TPopupMenu
    Left = 712
    Top = 352
    object N1: TMenuItem
      Action = actNodeDelete
    end
    object N3: TMenuItem
      Action = actNodeEdit
    end
    object N4: TMenuItem
      Action = ActSetFilter
    end
  end
  object pmFilter: TPopupMenu
    Left = 828
    Top = 370
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
      'pnlForms.pnl1.<P>.Width')
    Left = 25
    Top = 457
  end
  object dsFilter: TMemTableEh
    Params = <>
    OnNewRecord = dsFilterNewRecord
    Left = 27
    Top = 355
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
        object FLOOR: TMTStringDataFieldEh
          FieldName = 'FLOOR'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object PORCH: TMTStringDataFieldEh
          FieldName = 'PORCH'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object CHECK_ADRESS: TMTNumericDataFieldEh
          FieldName = 'CHECK_ADRESS'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DefaultExpression = '0'
          DisplayLabel = 'CHECK_ADRESS'
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
        object NODE_TYPE: TMTNumericDataFieldEh
          FieldName = 'NODE_TYPE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'LETTERS_TYPE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object FLAT: TMTStringDataFieldEh
          FieldName = 'FLAT'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object NODE_ID: TMTNumericDataFieldEh
          FieldName = 'NODE_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
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
      
        '    s.street_id, s.street_name || '#39' '#39' || s.street_short street_n' +
        'ame, a.area_name, s.Street_Code'
      '  from STREET s'
      '       left outer join area a on (a.area_id = s.area_id)'
      '  order by STREET_NAME, a.area_name  ')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 161
    Top = 474
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 396
    Top = 475
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
    Left = 221
    Top = 471
  end
  object srcHouse: TDataSource
    DataSet = dsHomes
    Left = 466
    Top = 421
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 152
    Top = 88
  end
  object srcNodeType: TDataSource
    DataSet = dsNodeType
    Left = 454
    Top = 472
  end
  object dsNodeType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    o.O_Id'
      '    , o.O_Name'
      '    , coalesce(o.O_DIMENSION, '#39#39') O_DIMENSION'
      '  from objects o'
      '  where o.O_Type = 38'
      '        and coalesce(o.O_Deleted,0) <> 1'
      '  order by o.O_Name  ')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 345
    Top = 448
    oFetchAll = True
  end
  object trReadQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 557
    Top = 363
  end
  object qCheck: TpFIBQuery
    Transaction = trReadQ
    Database = dmMain.dbTV
    Left = 507
    Top = 364
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object dsParentNode: TpFIBDataSet
    RefreshSQL.Strings = (
      'select'
      '  n.*'
      ', o.O_Name'
      ', s.street_short'
      ', S.Street_Name'
      ', H.House_No'
      ', h.Street_ID'
      'FROM NODES n'
      '   INNER JOIN HOUSE H ON (n.HOUSE_ID = H.HOUSE_ID)'
      '   INNER JOIN STREET S ON (H.STREET_ID = S.STREET_ID)'
      
        '   INNER join objects o on (o.O_Id = n.Type_Id and o.O_Type = 38' +
        ')'
      'where(     N.NODE_ID = :OLD_NODE_ID     )')
    SelectSQL.Strings = (
      'select'
      '    n.Name'
      '  , o.O_Name'
      '  , S.Street_Name || '#39' '#39' || s.street_short Street_Name'
      '  , H.House_No'
      '  , n.NODE_ID'
      '  from NODES n'
      '       inner join HOUSE H on (n.HOUSE_ID = H.HOUSE_ID)'
      '       inner join STREET S on (H.STREET_ID = S.STREET_ID)'
      
        '       inner join objects o on (o.O_Id = n.Type_Id and o.O_Type ' +
        '= 38)'
      'where n.NODE_ID <> :NODE_ID       '
      '  order by 1, 2, 3, 4  ')
    AutoUpdateOptions.UpdateTableName = 'NODES'
    AutoUpdateOptions.KeyFields = 'NODE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AfterOpen = dsNodesAfterOpen
    Transaction = trReadParent
    Database = dmMain.dbTV
    AutoCommit = True
    DataSource = srcNodes
    Left = 341
    Top = 352
    poUseBooleanField = False
    poSetRequiredFields = True
    oVisibleRecno = True
    oFetchAll = True
  end
  object trReadParent: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 397
    Top = 363
  end
  object srcParent: TDataSource
    DataSet = dsParentNode
    Left = 342
    Top = 400
  end
  object mtNodes: TMemTableEh
    FieldDefs = <>
    FetchAllOnOpen = True
    IndexDefs = <
      item
        Name = 'mtNodesIndexNODE_ID'
        Fields = 'NODE_ID'
      end
      item
        Name = 'mtNodesIndexPARENT_ID'
        Fields = 'PARENT_ID'
      end>
    Params = <>
    DataDriver = drvNodes
    StoreDefs = True
    TreeList.KeyFieldName = 'NODE_ID'
    TreeList.RefParentFieldName = 'PARENT_ID'
    TreeList.DefaultNodeExpanded = True
    Left = 215
    Top = 412
  end
  object drvNodes: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <>
    GetrecCommand.Params = <>
    ProviderDataSet = dsNodes
    Left = 266
    Top = 410
  end
  object drv1: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    UpdateCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'House_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Type_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'NOTICE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Lat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Lon'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Floor_N'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Porch_N'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLACE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Parent_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Node_Id'
        ParamType = ptUnknown
      end>
    UpdateCommand.CommandText.Strings = (
      'update Nodes'
      'set House_Id = :House_Id,'
      '    Type_Id = :Type_Id,'
      '    Name = :Name,'
      '    Notice = :Notice,'
      '    Lat = :Lat,'
      '    Lon = :Lon,'
      '    Floor_N = :Floor_N,'
      '    Porch_N = :Porch_N,'
      '    PLACE = :PLACE,'
      '    Parent_Id = :Parent_Id'
      'where Node_Id = :Node_Id')
    InsertCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'Node_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'House_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Type_Id'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Name'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Notice'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Lat'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Lon'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Floor_N'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Porch_N'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PLACE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Parent_Id'
        ParamType = ptUnknown
      end>
    InsertCommand.CommandText.Strings = (
      
        'insert into Nodes (Node_Id, House_Id, Type_Id, Name, Notice, Lat' +
        ', Lon, Floor_N, Porch_N, PLACE, Parent_Id)'
      
        'values (:Node_Id, :House_Id, :Type_Id, :Name, :Notice, :Lat, :Lo' +
        'n, :Floor_N, :Porch_N, :PLACE, :Parent_Id)')
    DeleteCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'NODE_ID'
        ParamType = ptUnknown
      end>
    DeleteCommand.CommandText.Strings = (
      'execute procedure Delete_Node(:NODE_ID)')
    GetrecCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'NODE_ID'
        ParamType = ptUnknown
      end>
    GetrecCommand.CommandText.Strings = (
      'select'
      '  n.*'
      ', o.O_Name'
      ', s.street_short'
      ', S.Street_Name'
      ', H.House_No'
      ', h.Street_ID'
      ', p.Name P_NAME'
      ', po.O_Name P_TYPE'
      ', pS.Street_Name||'#39' '#39'||ps.street_short P_STREET'
      ', pH.House_No P_HOUSE'
      'FROM NODES n'
      '   INNER JOIN HOUSE H ON (n.HOUSE_ID = H.HOUSE_ID)'
      '   INNER JOIN STREET S ON (H.STREET_ID = S.STREET_ID)'
      
        '   INNER join objects o on (o.O_Id = n.Type_Id and o.O_Type = 38' +
        ')'
      '   left outer join NODES p on (p.Node_Id = n.Parent_Id)'
      '   left outer JOIN HOUSE pH ON (pH.HOUSE_ID = p.HOUSE_ID)'
      '   left outer JOIN STREET pS ON (pS.STREET_ID = pH.STREET_ID)'
      
        '   left outer join objects po on (po.O_Id = p.Type_Id and o.O_Ty' +
        'pe = 38)'
      'where(     N.NODE_ID = :NODE_ID     )')
    ProviderDataSet = dsNodes
    Left = 266
    Top = 354
  end
end
