inherited EquipmentForm: TEquipmentForm
  Left = 344
  Top = 228
  Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1074' '#1089#1077#1090#1080
  ClientHeight = 608
  ClientWidth = 930
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 629
    Top = 84
    Height = 524
    Align = alRight
  end
  inherited splPG: TSplitter
    Width = 930
  end
  inherited dbGrid: TDBGridEh
    Width = 629
    Height = 524
    AllowedOperations = []
    FooterRowCount = 1
    IndicatorTitle.ShowDropDownSign = True
    IndicatorTitle.TitleButton = True
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    SumList.Active = True
    OnGetCellParams = dbGridGetCellParams
    OnSortMarkingChanged = dbGridSortMarkingChanged
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EID'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EQ_TYPE'
        Footers = <>
        KeyList.Strings = (
          '1'
          '2'
          '3')
        PickList.Strings = (
          #1057
          #1050
          #1055)
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 24
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 167
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET'
        Footers = <>
        Title.Caption = #1059#1083#1080#1094#1072
        Title.TitleButton = True
        Width = 129
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_NO'
        Footers = <>
        Title.Caption = #1044#1086#1084
        Title.TitleButton = True
        Width = 28
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PORCH_N'
        Footers = <>
        Title.Caption = #1055'-'#1076
        Title.TitleButton = True
        Width = 27
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLOOR_N'
        Footers = <>
        Title.Caption = #1069'-'#1078
        Title.TitleButton = True
        Width = 29
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PLACE'
        Footers = <>
        Title.Caption = #1052#1077#1089#1090#1086
        Title.TitleButton = True
        Width = 63
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MAC'
        Footers = <>
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IP'
        Footers = <>
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
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EQGROUP'
        Footers = <>
        Title.Caption = #1043#1088#1091#1087#1087#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SERIAL_N'
        Footers = <>
        Title.Caption = #1057#1077#1088#1080#1081#1085#1099#1081
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'EQ_ACTIVE'
        Footers = <>
        Title.Caption = #1040#1082#1090'/'#1055#1072#1089
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EQ_LINE'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1')
        PickList.Strings = (
          #1052#1072#1075#1080#1089#1090#1088'.'
          #1044#1086#1084#1086#1074#1072#1103)
        Title.Caption = #1057#1077#1090#1100
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SIGNAL_IN'
        Footers = <>
        Title.Caption = #1059#1088#1086#1074#1077#1085#1100'|'#1042#1093
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SIGNAL_OUT'
        Footers = <>
        Title.Caption = #1059#1088#1086#1074#1077#1085#1100'|'#1042#1099#1093
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PARENT_NAME'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082'|'#1059#1089#1090#1088#1086#1081#1089#1090#1074#1086
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PARENT_PORT'
        Footers = <>
        Title.Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082'|'#1055#1086#1088#1090
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IPV6'
        Footers = <>
        Title.Caption = 'IPv6'
        Title.TitleButton = True
      end>
  end
  object pnlInfo: TPanel [3]
    Left = 632
    Top = 84
    Width = 298
    Height = 524
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    object Splitter2: TSplitter
      Left = 0
      Top = 175
      Width = 298
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 298
      Height = 90
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      OnResize = Panel2Resize
      object Label1: TLabel
        Left = 6
        Top = 25
        Width = 31
        Height = 13
        Caption = #1059#1083#1080#1094#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 6
        Top = 47
        Width = 20
        Height = 13
        Caption = #1044#1086#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 6
        Top = 3
        Width = 48
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 121
        Top = 47
        Width = 45
        Height = 13
        Caption = #1055#1086#1076#1098#1077#1079#1076
      end
      object Label6: TLabel
        Left = 197
        Top = 47
        Width = 19
        Height = 13
        Caption = #1069'-'#1078
      end
      object lbl4: TLabel
        Left = 121
        Top = 69
        Width = 18
        Height = 13
        Caption = #1058#1080#1087
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 6
        Top = 69
        Width = 31
        Height = 13
        Caption = #1052#1077#1089#1090#1086
      end
      object dbtxtNAME: TDBText
        Left = 58
        Top = 1
        Width = 71
        Height = 16
        AutoSize = True
        Color = clBtnFace
        DataField = 'NAME'
        DataSource = srcDataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbtxtdbedt1: TDBText
        Left = 169
        Top = 45
        Width = 81
        Height = 16
        AutoSize = True
        Color = clBtnFace
        DataField = 'PORCH_N'
        DataSource = srcDataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbtxtDBEdit1: TDBText
        Left = 219
        Top = 45
        Width = 84
        Height = 16
        AutoSize = True
        Color = clBtnFace
        DataField = 'FLOOR_N'
        DataSource = srcDataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbtxtDBEdit2: TDBText
        Left = 58
        Top = 67
        Width = 84
        Height = 16
        Hint = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' / '#1071#1097#1080#1082
        AutoSize = True
        Color = clBtnFace
        DataField = 'PLACE'
        DataSource = srcDataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbtxtHOUSE: TDBText
        Left = 58
        Top = 45
        Width = 76
        Height = 16
        Hint = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' / '#1071#1097#1080#1082
        AutoSize = True
        Color = clBtnFace
        DataField = 'HOUSE_NO'
        DataSource = srcDataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbtxtSTREET: TDBText
        Left = 58
        Top = 23
        Width = 80
        Height = 16
        AutoSize = True
        Color = clBtnFace
        DataField = 'STREET'
        DataSource = srcDataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object cbTypeEQ: TDBComboBoxEh
        Left = 143
        Top = 67
        Width = 159
        Height = 16
        AutoSelect = False
        BorderStyle = bsNone
        Color = clBtnFace
        Ctl3D = False
        DataField = 'EQ_TYPE'
        DataSource = srcDataSource
        DynProps = <>
        EditButton.Visible = False
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Items.Strings = (
          #1057#1077#1090#1077#1074#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
          #1050#1072#1073#1077#1083#1100#1085#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
          #1055#1088#1086#1095#1077#1077)
        KeyItems.Strings = (
          '1'
          '2'
          '3')
        ParentCtl3D = False
        ParentFont = False
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
    end
    object pnlMemo: TPanel
      Left = 0
      Top = 90
      Width = 298
      Height = 85
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Label11: TLabel
        Left = 0
        Top = 0
        Width = 298
        Height = 13
        Align = alTop
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      end
      object memNotice: TDBMemoEh
        Tag = 9
        Left = 0
        Top = 13
        Width = 298
        Height = 72
        ScrollBars = ssVertical
        Align = alClient
        AutoSize = False
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1056#1077#1076#1072#1082#1090#1080#1088#1091#1077#1084#1086#1077' '#1087#1086#1083#1077
        ShowHint = True
        TabOrder = 0
        Visible = True
        WantReturns = True
        OnChange = memNoticeChange
        OnExit = memNoticeExit
      end
    end
    object pnlI2: TPanel
      Left = 0
      Top = 178
      Width = 298
      Height = 346
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object pnlGrids: TPanel
        Left = 0
        Top = 171
        Width = 298
        Height = 175
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object pgcEquipment: TPageControl
          Left = 0
          Top = 0
          Width = 298
          Height = 175
          ActivePage = tsInfo
          Align = alClient
          TabOrder = 0
          OnChange = pgcEquipmentChange
          object tsInfo: TTabSheet
            Caption = #1040#1090#1088#1080#1073#1091#1090#1099
            object dbgAtr: TDBGridEh
              Left = 0
              Top = 23
              Width = 290
              Height = 124
              Align = alClient
              AllowedOperations = []
              DataSource = srcAttributes
              DynProps = <>
              Flat = True
              FooterParams.Color = clWindow
              TabOrder = 1
              Columns = <
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'O_NAME'
                  Footers = <>
                  Title.Caption = #1040#1090#1088#1080#1073#1091#1090
                  Width = 71
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'CA_VALUE'
                  Footers = <>
                  Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
                  Width = 63
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NOTICE'
                  Footers = <>
                  Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object tbAttributes: TToolBar
              Left = 0
              Top = 0
              Width = 290
              Height = 23
              Images = A4MainForm.ICONS_ACTIVE
              TabOrder = 0
              object bbAddAtr: TToolButton
                Left = 0
                Top = 0
                Action = actAtrADD
                ParentShowHint = False
                ShowHint = True
              end
              object bbEditAtr: TToolButton
                Left = 23
                Top = 0
                Action = actAtrEdit
                ParentShowHint = False
                ShowHint = True
              end
              object bbDelAtr: TToolButton
                Left = 46
                Top = 0
                Action = actAtrDel
                ParentShowHint = False
                ShowHint = True
              end
            end
          end
          object tsHouses: TTabSheet
            Hint = #1047#1086#1085#1072' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
            Caption = #1047#1086#1085#1072' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
            ImageIndex = 1
            object dbgHouses: TDBGridEh
              Left = 0
              Top = 22
              Width = 290
              Height = 125
              Align = alClient
              DataSource = srcEC
              DynProps = <>
              Flat = True
              FooterParams.Color = clWindow
              TabOrder = 1
              Columns = <
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'STREET_NAME'
                  Footers = <>
                  Title.Caption = #1059#1083#1080#1094#1072
                  Width = 102
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'HOUSE_NO'
                  Footers = <>
                  Title.Caption = #1044#1086#1084
                  Width = 44
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NOTICE'
                  Footers = <>
                  Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'AREA_NAME'
                  Footers = <>
                  Title.Caption = #1053'.'#1055'.'
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object tlbZO: TToolBar
              Left = 0
              Top = 0
              Width = 290
              Height = 22
              Images = A4MainForm.ICONS_ACTIVE
              TabOrder = 0
              object btnCoverAdd: TToolButton
                Left = 0
                Top = 0
                Action = actCoverAdd
                ParentShowHint = False
                ShowHint = True
              end
              object btnCoverEdit: TToolButton
                Left = 23
                Top = 0
                Action = actCoverEdit
                ParentShowHint = False
                ShowHint = True
              end
              object btnCoverDelete: TToolButton
                Left = 46
                Top = 0
                Action = actCoverDelete
              end
            end
          end
          object tsAbonents: TTabSheet
            Caption = #1040#1073#1086#1085#1077#1085#1090#1099
            ImageIndex = 2
            object dbgCustomer: TDBGridEh
              Left = 0
              Top = 23
              Width = 290
              Height = 124
              Align = alClient
              AllowedOperations = []
              DataSource = srcCustomer
              DynProps = <>
              EditActions = [geaCopyEh, geaSelectAllEh]
              EvenRowColor = clInfoBk
              Flat = True
              FooterRowCount = 1
              FooterParams.Color = clWindow
              GridLineParams.VertEmptySpaceStyle = dessNonEh
              OddRowColor = clWindow
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgCancelOnExit, dgMultiSelect]
              OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
              ReadOnly = True
              SortLocal = True
              STFilter.Local = True
              SumList.Active = True
              TabOrder = 1
              TitleParams.MultiTitle = True
              TitleParams.VTitleMargin = 8
              OnDblClick = dbgCustomerDblClick
              OnGetCellParams = dbgCustomerGetCellParams
              OnMouseDown = dbgCustomerMouseDown
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
                  FieldName = 'PORT'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #1055#1086#1088#1090
                  Title.TitleButton = True
                  Width = 32
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'IP'
                  Footers = <>
                  Title.TitleButton = True
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'MAC'
                  Footers = <>
                  Title.TitleButton = True
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
                  Title.Caption = #1040#1076#1088#1077#1089'|'#1055'-'#1076
                  Width = 32
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'FLOOR_N'
                  Footers = <>
                  Title.Caption = #1040#1076#1088#1077#1089'|'#1069'-'#1078
                  Width = 31
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
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object tlbCustomers: TToolBar
              Left = 0
              Top = 0
              Width = 290
              Height = 23
              Caption = 'tlbCustomers'
              Images = A4MainForm.ICONS_ACTIVE
              TabOrder = 0
              object btnCustomer: TToolButton
                Left = 0
                Top = 0
                Action = actFindCustomer
              end
              object btn3: TToolButton
                Left = 23
                Top = 0
                Width = 8
                Caption = 'btn3'
                ImageIndex = 10
                Style = tbsSeparator
              end
              object btn5: TToolButton
                Left = 31
                Top = 0
                Width = 8
                Caption = 'btn5'
                ImageIndex = 6
                Style = tbsSeparator
              end
              object btn4: TToolButton
                Left = 39
                Top = 0
                Hint = #1044#1077#1081#1089#1090#1074#1080#1103' '#1085#1072#1076' '#1072#1073#1086#1085#1077#1085#1090#1086#1084
                Caption = 'btn4'
                ImageIndex = 29
                OnClick = btn4Click
              end
            end
          end
          object tsRequests: TTabSheet
            Caption = #1047#1072#1103#1074#1082#1080
            ImageIndex = 3
            object Panel5: TPanel
              Left = 0
              Top = 0
              Width = 290
              Height = 147
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object dbGridCustReq: TDBGridEh
                Left = 0
                Top = 0
                Width = 290
                Height = 147
                Align = alClient
                AllowedOperations = []
                AutoFitColWidths = True
                DataSource = srcRequests
                DynProps = <>
                Flat = True
                FooterParams.Color = clWindow
                GridLineParams.VertEmptySpaceStyle = dessNonEh
                OddRowColor = clInfoBk
                OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
                SortLocal = True
                TabOrder = 0
                TitleParams.MultiTitle = True
                OnDblClick = dbGridCustReqDblClick
                Columns = <
                  item
                    AutoFitColWidth = False
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'RQ_ID'
                    Footers = <>
                    Title.Caption = #1053#1086#1084#1077#1088
                    Title.TitleButton = True
                    Width = 40
                  end
                  item
                    AutoFitColWidth = False
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'RQ_DATE'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072'|'#1087#1086#1089#1090'.'
                    Title.TitleButton = True
                    Width = 60
                  end
                  item
                    AutoFitColWidth = False
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'RQ_PLAN_DATE'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072'|'#1087#1083#1072#1085#1086#1074#1072#1103
                  end
                  item
                    AutoFitColWidth = False
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'RQ_TIME_FROM'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072'|'#1089
                    Width = 28
                  end
                  item
                    AutoFitColWidth = False
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'RQ_TIME_TO'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072'|'#1076#1086
                    Width = 29
                  end
                  item
                    AutoFitColWidth = False
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'RQ_COMPLETED'
                    Footers = <>
                    Title.Caption = #1044#1072#1090#1072'|'#1074#1099#1087'.'
                    Title.TitleButton = True
                    Width = 60
                  end
                  item
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'TROUBLE'
                    Footers = <>
                    Title.Caption = #1053#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100#13#10#1047#1072#1103#1074#1083#1077#1085#1085#1072#1103'/'#1042#1099#1103#1074#1083#1077#1085#1085#1072#1103
                    Title.TitleButton = True
                    Width = 202
                  end
                  item
                    AutoFitColWidth = False
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'RT_NAME'
                    Footers = <>
                    Title.Caption = #1058#1080#1087
                    Title.TitleButton = True
                    Width = 80
                  end
                  item
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'RES_TEXT'
                    Footers = <>
                    Title.Caption = #1057#1090#1072#1090#1091#1089
                    Width = 49
                  end
                  item
                    AutoFitColWidth = False
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'EXECUTOR'
                    Footers = <>
                    Title.Caption = #1042#1099#1087#1086#1083#1085#1080#1083
                    Title.TitleButton = True
                    Width = 120
                  end
                  item
                    CellButtons = <>
                    DynProps = <>
                    EditButtons = <>
                    FieldName = 'RQ_NOTICE'
                    Footers = <>
                    Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                    Title.TitleButton = True
                    Width = 100
                  end>
                object RowDetailData: TRowDetailPanelControlEh
                end
              end
            end
          end
        end
      end
      object pnlTabs: TPanel
        Left = 0
        Top = 0
        Width = 298
        Height = 171
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object pgcTypeInfo: TPageControl
          Left = 0
          Top = 0
          Width = 298
          Height = 188
          ActivePage = tsLan
          Align = alTop
          TabOrder = 0
          TabPosition = tpBottom
          object tsLan: TTabSheet
            Caption = #1057#1077#1090#1100
            DesignSize = (
              290
              162)
            object Label4: TLabel
              Left = 0
              Top = 3
              Width = 22
              Height = 13
              Caption = #1052#1040#1057
            end
            object Label5: TLabel
              Left = 0
              Top = 26
              Width = 10
              Height = 13
              Caption = 'IP'
            end
            object Label7: TLabel
              Left = 0
              Top = 49
              Width = 27
              Height = 13
              Caption = 'MASK'
            end
            object lbl3: TLabel
              Left = 0
              Top = 93
              Width = 25
              Height = 13
              Caption = 'VLAN'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Label9: TLabel
              Left = 0
              Top = 117
              Width = 36
              Height = 13
              Caption = #1043#1088#1091#1087#1087#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl2: TLabel
              Left = 0
              Top = 71
              Width = 22
              Height = 13
              Caption = 'IPv6'
            end
            object eMAC: TDBEditEh
              Left = 37
              Top = 0
              Width = 253
              Height = 21
              Hint = #1052#1040#1057' '#1072#1076#1088#1077#1089
              Anchors = [akLeft, akTop, akRight]
              DataField = 'MAC'
              DataSource = srcDataSource
              DynProps = <>
              EditButtons = <>
              EmptyDataInfo.Text = 'MAC'
              MaxLength = 17
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
              Visible = True
              EditMask = 'AA:AA:AA:AA:AA:AA'
            end
            object eIP: TDBEditEh
              Left = 37
              Top = 23
              Width = 253
              Height = 21
              Hint = 'IP '#1072#1076#1088#1077#1089
              Anchors = [akLeft, akTop, akRight]
              DataField = 'IP'
              DataSource = srcDataSource
              DynProps = <>
              EditButtons = <>
              EmptyDataInfo.Text = 'IP '#1072#1076#1088#1077#1089
              ReadOnly = True
              ShowHint = True
              TabOrder = 1
              Visible = True
              EditMask = ''
            end
            object DBEditEh4: TDBEditEh
              Left = 37
              Top = 46
              Width = 253
              Height = 21
              Hint = #1052#1072#1089#1082#1072' '#1089#1077#1090#1080
              Anchors = [akLeft, akTop, akRight]
              DataField = 'MASK'
              DataSource = srcDataSource
              DynProps = <>
              EditButtons = <>
              ReadOnly = True
              ShowHint = True
              TabOrder = 2
              Visible = True
              EditMask = ''
            end
            object clb1: TDBLookupComboboxEh
              Left = 37
              Top = 90
              Width = 253
              Height = 21
              AutoSelect = False
              Anchors = [akLeft, akTop, akRight]
              DynProps = <>
              DataField = 'VLAN_ID'
              DataSource = srcDataSource
              DropDownBox.Columns = <
                item
                  FieldName = 'NAME'
                  Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                  Width = 57
                end
                item
                  FieldName = 'IP_BEGIN'
                  Title.Caption = 'IP c'
                end
                item
                  FieldName = 'IP_END'
                  Title.Caption = 'IP '#1076#1086
                end>
              EditButton.Visible = False
              EditButtons = <>
              KeyField = 'V_ID'
              ListField = 'NAME'
              ListSource = srcVLANS
              ReadOnly = True
              ShowHint = True
              TabOrder = 4
              Visible = True
            end
            object edtGroup: TDBEditEh
              Left = 37
              Top = 112
              Width = 253
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'EQGROUP'
              DataSource = srcDataSource
              DynProps = <>
              EditButtons = <>
              ReadOnly = True
              ShowHint = True
              TabOrder = 5
              Visible = True
            end
            object edtIP: TDBEditEh
              Left = 37
              Top = 68
              Width = 253
              Height = 21
              Hint = 'IP '#1072#1076#1088#1077#1089
              Anchors = [akLeft, akTop, akRight]
              DataField = 'IPV6'
              DataSource = srcDataSource
              DynProps = <>
              EditButtons = <>
              ReadOnly = True
              ShowHint = True
              TabOrder = 3
              Visible = True
              EditMask = ''
            end
            object btnCMD: TButton
              Left = 37
              Top = 139
              Width = 253
              Height = 19
              Anchors = [akLeft, akTop, akRight]
              Caption = 'CMD'
              TabOrder = 6
              OnClick = btnCMDClick
            end
          end
          object tsTV: TTabSheet
            Caption = #1058#1042
            ImageIndex = 1
            object lbl7: TLabel
              Left = 3
              Top = 29
              Width = 25
              Height = 13
              Caption = #1057#1077#1090#1100
            end
            object lbl9: TLabel
              Left = 3
              Top = 79
              Width = 97
              Height = 13
              Caption = #1059#1088#1086#1074#1077#1085#1100' '#1074#1099#1093#1086#1076#1085#1086#1081
            end
            object lbl8: TLabel
              Left = 3
              Top = 54
              Width = 89
              Height = 13
              Caption = #1059#1088#1086#1074#1077#1085#1100' '#1074#1093#1086#1076#1085#1086#1081
            end
            object dbckActive: TDBCheckBoxEh
              Left = 3
              Top = 3
              Width = 116
              Height = 18
              Alignment = taLeftJustify
              Caption = #1040#1082#1090#1080#1074#1085#1086#1077
              DataField = 'EQ_ACTIVE'
              DataSource = srcDataSource
              DynProps = <>
              ReadOnly = True
              TabOrder = 0
            end
            object cbbLine: TDBComboBoxEh
              Left = 106
              Top = 26
              Width = 121
              Height = 21
              DataField = 'EQ_LINE'
              DataSource = srcDataSource
              DynProps = <>
              EditButtons = <>
              Items.Strings = (
                #1052#1072#1075#1080#1089#1090#1088'.'
                #1044#1086#1084#1086#1074#1072#1103)
              KeyItems.Strings = (
                '0'
                '1')
              ReadOnly = True
              ShowHint = True
              TabOrder = 1
              Visible = True
            end
            object edSIN: TDBNumberEditEh
              Left = 106
              Top = 51
              Width = 121
              Height = 21
              DataField = 'SIGNAL_IN'
              DataSource = srcDataSource
              DynProps = <>
              EditButtons = <>
              ReadOnly = True
              ShowHint = True
              TabOrder = 2
              Visible = True
            end
            object edSOUT: TDBNumberEditEh
              Left = 106
              Top = 76
              Width = 121
              Height = 21
              DataField = 'SIGNAL_OUT'
              DataSource = srcDataSource
              DynProps = <>
              EditButtons = <>
              ReadOnly = True
              ShowHint = True
              TabOrder = 3
              Visible = True
            end
          end
          object tsOther: TTabSheet
            Caption = #1055#1088#1086#1095#1077#1077
            ImageIndex = 2
          end
        end
      end
    end
  end
  inherited tlbMain: TToolBar
    Width = 930
    inherited ToolButton9: TToolButton
      Visible = False
    end
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
      OnClick = tbCancelClick
    end
    inherited ToolButton20: TToolButton
      Visible = False
    end
    object btn2: TToolButton
      Left = 178
      Top = 0
      Width = 8
      Caption = 'btn2'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object btnRefresh: TToolButton
      Left = 186
      Top = 0
      Caption = 'btnRefresh'
      ImageIndex = 27
      OnClick = btnRefreshClick
    end
    object pnlChkTree: TPanel
      Left = 209
      Top = 0
      Width = 166
      Height = 22
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object chkTREE: TCheckBox
        Left = 3
        Top = 0
        Width = 165
        Height = 22
        Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1074' '#1074#1080#1076#1077' '#1076#1077#1088#1077#1074#1072
        TabOrder = 0
        OnClick = chkTREEClick
      end
    end
    object chkGroup: TCheckBox
      Left = 375
      Top = 0
      Width = 224
      Height = 22
      Alignment = taLeftJustify
      Caption = '('#1053#1077' '#1075#1086#1090#1086#1074#1086')   '#1042#1082#1083#1102#1095#1080#1090#1100' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1082#1091
      TabOrder = 1
      Visible = False
      OnClick = chkGroupClick
    end
    object btn1: TToolButton
      Left = 599
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 41
      Style = tbsSeparator
      Visible = False
    end
  end
  inherited pnlEdit: TPanel
    Width = 930
    inherited btnSaveLink: TBitBtn
      Left = 108
      Top = 127
      TabOrder = 1
    end
    inherited btnCancelLink: TBitBtn
      TabOrder = 0
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsEquipments
    OnDataChange = srcDataSourceDataChange
    Left = 128
    Top = 224
  end
  inherited actions: TActionList
    Left = 38
    Top = 160
    inherited actNew: TAction
      Caption = #1053#1086#1074#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actEditExecute
    end
    object actCoverAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1086#1085#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1086#1085#1091
      ImageIndex = 2
      OnExecute = actCoverAddExecute
    end
    object actCoverEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1086#1085#1091
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1086#1085#1091
      ImageIndex = 4
      OnExecute = actCoverEditExecute
    end
    object actCoverDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1086#1085#1091
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1086#1085#1091
      ImageIndex = 3
      OnExecute = actCoverDeleteExecute
    end
    object actAtrADD: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1090#1088#1080#1073#1091#1090
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1090#1088#1080#1073#1091#1090
      ImageIndex = 2
      OnExecute = actAtrADDExecute
    end
    object actAtrEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072
      ImageIndex = 4
      OnExecute = actAtrEditExecute
    end
    object actAtrDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1072#1090#1088#1080#1073#1091#1090
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1072#1090#1088#1080#1073#1091#1090
      ImageIndex = 3
      OnExecute = actAtrDelExecute
    end
    object actNewChild: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1082' '#1076#1086#1095#1077#1088#1085#1080#1081' '#1091#1079#1077#1083
      ImageIndex = 28
      ShortCut = 16429
      OnExecute = actNewChildExecute
    end
    object actFindCustomer: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      Hint = #1054#1090#1082#1088#1099#1090' '#1072#1073#1086#1085#1077#1085#1090#1072'('#1086#1074') '#1074' '#1089#1087#1080#1089#1082#1077' '#1040#1073#1086#1085#1077#1085#1090#1086#1074
      ImageIndex = 9
      OnExecute = actFindCustomerExecute
    end
    object actEditCustLan: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1077#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
      ImageIndex = 4
      OnExecute = actEditCustLanExecute
    end
    object actClone: TAction
      Caption = #1050#1083#1086#1085#1080#1088#1086#1074#1072#1090#1100
      ShortCut = 8237
      OnExecute = actCloneExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Top = 140
    object N1: TMenuItem [0]
      Action = actNew
    end
    object N2: TMenuItem [1]
      Action = actEdit
    end
    object miNewChild: TMenuItem [2]
      Action = actNewChild
    end
    object N5: TMenuItem [3]
      Action = actClone
    end
    object N3: TMenuItem [4]
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object telnet1: TMenuItem
      Caption = 'telnet'
      OnClick = telnet1Click
    end
    object miTreeBreak: TMenuItem
      Caption = '-'
    end
    object miTreeCollapse: TMenuItem
      Caption = #1057#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      Visible = False
      OnClick = miTreeCollapseClick
    end
    object miTreeExpand: TMenuItem
      Caption = #1056#1072#1079#1074#1077#1088#1085#1091#1090#1100' '#1074#1089#1077
      Visible = False
      OnClick = miTreeExpandClick
    end
  end
  object dsEquipments: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE EQUIPMENT SET NOTICE = :NOTICE WHERE EID = :OLD_EID')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EQUIPMENT'
      'WHERE'
      '        EID = :OLD_EID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    E.*'
      '  , h.house_no'
      '  , s.street_name || '#39' '#39' || s.street_short as street'
      '  , o.o_name as eqgroup'
      '  , p.name as parent_name'
      '  , o.O_DIMENSION as COLOR'
      '  from EQUIPMENT E'
      '       left outer join house h on (e.house_id = h.house_id)'
      '       left outer join street s on (s.street_id = h.street_id)'
      
        '       left outer join objects o on (e.eq_group = o.o_id and o.O' +
        '_TYPE = 7)'
      '       left outer join equipment p on (e.parent_id = p.eid)'
      ' WHERE '
      '        E.EID = :OLD_EID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    E.*'
      '  , h.house_no'
      '  , s.street_name || '#39' '#39' || s.street_short as street'
      '  , o.o_name as eqgroup'
      '  , p.name as parent_name'
      '  , o.O_DIMENSION as COLOR'
      '  from EQUIPMENT E'
      '       left outer join house h on (e.house_id = h.house_id)'
      '       left outer join street s on (s.street_id = h.street_id)'
      
        '       left outer join objects o on (e.eq_group = o.o_id and o.O' +
        '_TYPE = 7)'
      '       left outer join equipment p on (e.parent_id = p.eid)'
      '  order by NAME')
    AutoUpdateOptions.UpdateTableName = 'EQUIPMENT'
    AutoUpdateOptions.KeyFields = 'EID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AfterOpen = dsEquipmentsAfterOpen
    BeforeClose = dsEquipmentsBeforeClose
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 128
    Top = 176
  end
  object srcAttributes: TDataSource
    DataSet = dsAttributes
    OnDataChange = srcAttributesDataChange
    Left = 128
    Top = 360
  end
  object dsAttributes: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EQUIPMENT_ATTRIBUTES'
      'WHERE'
      '        EA_ID = :OLD_EA_ID'
      '    ')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      ''
      '    ')
    SelectSQL.Strings = (
      'SELECT A.O_NAME, CA.*'
      'FROM equipment_attributes CA'
      
        '   INNER JOIN OBJECTS A ON (CA.O_ID = A.O_ID and A.O_TYPE in (5,' +
        '6))'
      'where CA.eid = :eid')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 129
    Top = 301
  end
  object srcEC: TDataSource
    DataSet = dsEC
    OnDataChange = srcECDataChange
    Left = 400
    Top = 152
  end
  object dsEC: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EQUIPMENT_COVERAGE'
      'WHERE'
      '        EID = :OLD_EID'
      '    and HOUSE_ID = :OLD_HOUSE_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    ec.eid'
      '  , ec.house_id'
      '  , ec.notice'
      '  , h.house_no'
      '  , s.street_short'
      '  , s.street_name'
      '  , a.Area_Name'
      '  from equipment_coverage ec'
      '       inner join house h on (ec.house_id = h.house_id)'
      '       inner join street s on (h.street_id = s.street_id)'
      '       left outer join area a on (a.area_id = s.area_id)'
      '  where ec.eid = :eid'
      '  order by a.Area_Name, s.street_name, h.HOUSE_NO')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 456
    Top = 160
  end
  object srcVLANS: TDataSource
    DataSet = dsVlans
    Left = 344
    Top = 304
  end
  object dsVlans: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      ''
      '    ')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      ''
      '    ')
    SelectSQL.Strings = (
      'select v_id, name, ip_begin, ip_end'
      'from vlans'
      'order by 2')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcDataSource
    Left = 345
    Top = 357
  end
  object dsCustomers: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CUSTOMER'
      'SET '
      '    CUST_CODE = :CUST_CODE,'
      '    HOUSE_ID = :HOUSE_ID,'
      '    ACCOUNT_NO = :ACCOUNT_NO,'
      '    DOGOVOR_NO = :DOGOVOR_NO,'
      '    SURNAME = :SURNAME,'
      '    FIRSTNAME = :FIRSTNAME,'
      '    MIDLENAME = :MIDLENAME,'
      '    INITIALS = :INITIALS,'
      '    CONTRACT_DATE = :CONTRACT_DATE,'
      '    ACTIVIZ_DATE = :ACTIVIZ_DATE,'
      '    PHONE_NO = :PHONE_NO,'
      '    NOTICE = :NOTICE,'
      '    VALID_TO = :VALID_TO,'
      '    CUST_STATE = :CUST_STATE,'
      '    CUST_STATE_DESCR = :CUST_STATE_DESCR,'
      '    CUST_PROP = :CUST_PROP,'
      '    CUST_PROP_DESCR = :CUST_PROP_DESCR,'
      '    FLAT_NO = :FLAT_NO,'
      '    PASSPORT_NUMBER = :PASSPORT_NUMBER,'
      '    PASSPORT_REGISTRATION = :PASSPORT_REGISTRATION,'
      '    MANAGER_ID = :MANAGER_ID,'
      '    JURIDICAL = :JURIDICAL,'
      '    JUR_INN = :JUR_INN,'
      '    JUR_DIRECTOR = :JUR_DIRECTOR,'
      '    JUR_BUH = :JUR_BUH,'
      '    CGIS = :CGIS,'
      '    MOBILE_PHONE = :MOBILE_PHONE, '
      '    HIS_COLOR = :HIS_COLOR'
      'WHERE'
      '    CUSTOMER_ID = :OLD_CUSTOMER_ID'
      '    ')
    DeleteSQL.Strings = (
      'EXECUTE PROCEDURE DELETE_CUSTOMER(:CUSTOMER_ID)'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CUSTOMER('
      '    CUSTOMER_ID,'
      '    CUST_CODE,'
      '    HOUSE_ID,'
      '    ACCOUNT_NO,'
      '    DOGOVOR_NO,'
      '    SURNAME,'
      '    FIRSTNAME,'
      '    MIDLENAME,'
      '    INITIALS,'
      '    CONTRACT_DATE,'
      '    ACTIVIZ_DATE,'
      '    PHONE_NO,'
      '    NOTICE,'
      '    VALID_TO,'
      '    CUST_STATE,'
      '    CUST_STATE_DESCR,'
      '    CUST_PROP,'
      '    CUST_PROP_DESCR,'
      '    FLAT_NO,'
      '    DEBT_SUM,'
      '    PASSPORT_NUMBER,'
      '    PASSPORT_REGISTRATION,'
      '    MANAGER_ID,'
      '    JURIDICAL,'
      '    JUR_INN,'
      '    JUR_DIRECTOR,'
      '    JUR_BUH,'
      '    CGIS,'
      '    MOBILE_PHONE,'
      '    HIS_COLOR'
      ')'
      'VALUES('
      '    :CUSTOMER_ID,'
      '    :CUST_CODE,'
      '    :HOUSE_ID,'
      '    :ACCOUNT_NO,'
      '    :DOGOVOR_NO,'
      '    :SURNAME,'
      '    :FIRSTNAME,'
      '    :MIDLENAME,'
      '    :INITIALS,'
      '    :CONTRACT_DATE,'
      '    :ACTIVIZ_DATE,'
      '    :PHONE_NO,'
      '    :NOTICE,'
      '    :VALID_TO,'
      '    :CUST_STATE,'
      '    :CUST_STATE_DESCR,'
      '    :CUST_PROP,'
      '    :CUST_PROP_DESCR,'
      '    :FLAT_NO,'
      '    0,'
      '    :PASSPORT_NUMBER,'
      '    :PASSPORT_REGISTRATION,'
      '    :MANAGER_ID,'
      '    :JURIDICAL,'
      '    :JUR_INN,'
      '    :JUR_DIRECTOR,'
      '    :JUR_BUH,'
      '    :CGIS,'
      '    :MOBILE_PHONE,'
      '    :HIS_COLOR'
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
      'where(     C.CUSTOMER_ID = :OLD_CUSTOMER_ID     )'
      '')
    SelectSQL.Strings = (
      'select'
      '    c.CUSTOMER_ID'
      '  , c.CUST_CODE'
      '  , c.ACCOUNT_NO'
      '  , c.SURNAME'
      '  , c.MIDLENAME'
      '  , c.INITIALS'
      '  , c.PHONE_NO'
      '  , c.NOTICE'
      '  , c.CUST_STATE_DESCR'
      '  , c.FLAT_NO'
      '  , c.DEBT_SUM'
      '  , c.HIS_COLOR'
      '  , s.street_short'
      '  , S.Street_Name'
      '  , H.House_No'
      '  , h.Street_ID'
      '  , c.HOUSE_ID'
      '  , -1 * c.debt_sum as BALANCE'
      '  , (select'
      '         count(*)'
      '       from SUBSCR_SERV ss'
      '       where ss.CUSTOMER_ID = c.CUSTOMER_ID'
      '             and ss.STATE_SGN = 1) as connected'
      '  , f.FLOOR_N'
      '  , f.PORCH_N'
      '  , t.LAN_ID'
      '  , t.ip'
      '  , t.mac'
      '  , t.port'
      '  from CUSTOMER C'
      '       inner join HOUSE H on (C.HOUSE_ID = H.HOUSE_ID)'
      '       inner join STREET S on (H.STREET_ID = S.STREET_ID)'
      
        '       left outer join tv_lan t on (t.customer_id = c.customer_i' +
        'd) left outer join Houseflats f on (f.House_Id = c.House_Id and'
      '             f.Flat_No = c.Flat_No)'
      '  where (1 = :EQ_TYPE      -- '#1057#1055#1044
      '        and t.EQ_ID = :EID)'
      '          or (2 = :EQ_TYPE -- '#1058#1042
      '        and exists(select'
      '                       house_id'
      '                     from equipment_coverage ec'
      '                     where ec.eid = :eid'
      '                           and ec.House_Id = c.House_Id))'
      '  order by t.port, C.account_no')
    AutoUpdateOptions.UpdateTableName = 'CUSTOMER'
    AutoUpdateOptions.KeyFields = 'CUSTOMER_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_CUSTOMER_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 496
    Top = 352
    poUseBooleanField = False
    poSetRequiredFields = True
    oVisibleRecno = True
    oFetchAll = True
  end
  object srcCustomer: TDataSource
    AutoEdit = False
    DataSet = dsCustomers
    Left = 498
    Top = 304
  end
  object dsRequests: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT R.RQ_ID, R.added_on RQ_DATE, R.rq_plan_date, r.rq_time_fr' +
        'om, r.rq_time_to, R.RQ_CONTENT, R.RQ_DEFECT, R.RQ_COMPLETED, R.R' +
        'Q_NOTICE,'
      'rt.RT_NAME, rt.RT_PRINTFORM as REPORT,'
      
        '(select first 1 W.SURNAME ||'#39' '#39'||substring(W.FIRSTNAME FROM 1 fo' +
        'r 1)||'#39' '#39'||substring(W.MIDLENAME from 1 for 1) '
      
        'FROM request_executors re left outer join WORKER w ON (w.WORKER_' +
        'ID = re.exec_id)'
      'where re.rq_id = R.RQ_ID) AS EXECUTOR,'
      'CASE R.Req_Result'
      ' when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      ' when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      ' when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      ' when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      'end as Res_text,'
      'coalesce(r.Rq_Defect, r.Rq_Content) as trouble'
      
        'FROM REQUEST R inner join REQUEST_TYPES RT on (rt.RT_ID = r.RQ_T' +
        'YPE)'
      'WHERE'
      'r.HOUSE_ID = :HOUSE_ID'
      'order by R.added_on desc')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcDataSource
    Left = 262
    Top = 362
  end
  object srcRequests: TDataSource
    AutoEdit = False
    DataSet = dsRequests
    Left = 262
    Top = 412
  end
  object frmStore: TFormStorage
    Options = []
    StoredProps.Strings = (
      'pnlInfo.Width'
      'pnlMemo.Height')
    StoredValues = <>
    Left = 25
    Top = 218
  end
  object mtEQ: TMemTableEh
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'mtEQIndexEID'
        Fields = 'EID'
      end
      item
        Name = 'mtEQIndexPARENT'
        Fields = 'PARENT_ID'
      end>
    Params = <>
    DataDriver = drvEQ
    StoreDefs = True
    TreeList.KeyFieldName = 'EID'
    TreeList.RefParentFieldName = 'PARENT_ID'
    TreeList.DefaultNodeExpanded = True
    Left = 351
    Top = 228
  end
  object drvEQ: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    UpdateCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'NOTICE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'EID'
        ParamType = ptUnknown
      end>
    UpdateCommand.CommandText.Strings = (
      'UPDATE EQUIPMENT SET NOTICE = :NOTICE WHERE EID = :EID')
    InsertCommand.Params = <>
    DeleteCommand.Params = <
      item
        DataType = ftUnknown
        Name = 'EID'
        ParamType = ptUnknown
      end>
    DeleteCommand.CommandText.Strings = (
      'DELETE FROM'
      '    EQUIPMENT'
      'WHERE'
      '        EID = :EID')
    GetrecCommand.Params = <
      item
        DataType = ftInteger
        Name = 'OLD_EID'
        ParamType = ptInput
      end>
    GetrecCommand.CommandText.Strings = (
      
        'SELECT E.*, h.house_no, s.street_name || '#39' '#39'|| s.street_short as' +
        ' street, o.o_name as eqgroup'
      ', p.name as parent_name, o.O_DIMENSION as COLOR'
      'FROM EQUIPMENT E'
      '  left outer join house h on (e.house_id = h.house_id)'
      '  left outer join street s on (s.street_id = h.street_id)'
      '  left outer join objects o on (e.eq_group = o.o_id)'
      '  left outer join equipment p on (e.parent_id = p.eid)'
      ''
      ' WHERE '
      '        E.EID = :OLD_EID'
      '    ')
    ProviderDataSet = dsEquipments
    Left = 258
    Top = 258
  end
  object pmLanPopUp: TPopupMenu
    Left = 533
    Top = 424
  end
  object actlstLAN: TActionList
    Left = 386
    Top = 447
    object ActLanPing: TAction
      Caption = 'PING IP adress'
      Hint = 'PING IP adress'
      OnExecute = ActLanPingExecute
    end
    object actLanTelnet: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' IP '#1074' '#1090#1077#1083#1085#1077#1090
      Hint = #1054#1090#1082#1088#1099#1090#1100' IP '#1074' '#1090#1077#1083#1085#1077#1090
      OnExecute = actLanTelnetExecute
    end
    object actLanHttp: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077' IP'
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1073#1088#1072#1091#1079#1077#1088#1077' IP'
      OnExecute = actLanHttpExecute
    end
    object actParentPing: TAction
      Caption = 'PING '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1082
      OnExecute = actParentPingExecute
    end
    object actParentTelnet: TAction
      Caption = 'Telnet '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1082
      OnExecute = actParentTelnetExecute
    end
    object actParentWeb: TAction
      Caption = 'Web '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1082
      OnExecute = actParentWebExecute
    end
    object actCustPing: TAction
      Caption = 'Ping '#1072#1073#1086#1085#1077#1085#1090#1072
      OnExecute = actCustPingExecute
    end
    object actCustTelnet: TAction
      Caption = 'Telnet '#1072#1073#1086#1085#1077#1085#1090#1072
      OnExecute = actCustTelnetExecute
    end
    object actCustHttp: TAction
      Caption = 'HTTP '#1072#1073#1086#1085#1077#1085#1090#1072
      OnExecute = actCustHttpExecute
    end
  end
  object pmCustomerLanPopUp: TPopupMenu
    Left = 528
    Top = 488
  end
end
