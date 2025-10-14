object RequestNewForm: TRequestNewForm
  Left = 0
  Top = 0
  Caption = #1053#1086#1074#1072#1103' '#1079#1072#1103#1074#1082#1072
  ClientHeight = 522
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    832
    522)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAdresInfo: TPanel
    Left = 0
    Top = 0
    Width = 832
    Height = 129
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object pnlAdres: TPanel
      Left = 0
      Top = 0
      Width = 363
      Height = 129
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object lbl1: TLabel
        Left = 4
        Top = 1
        Width = 36
        Height = 13
        Caption = #1059#1083#1080#1094#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 205
        Top = 1
        Width = 25
        Height = 13
        Caption = #1044#1086#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 279
        Top = 1
        Width = 13
        Height = 13
        Caption = #1050#1074
      end
      object lbl6: TLabel
        Left = 4
        Top = 47
        Width = 45
        Height = 13
        Caption = #1055#1086#1076#1098#1077#1079#1076
      end
      object lbl7: TLabel
        Left = 106
        Top = 47
        Width = 27
        Height = 13
        Caption = #1069#1090#1072#1078
      end
      object lbl2: TLabel
        Left = 199
        Top = 47
        Width = 74
        Height = 13
        Caption = #1050#1086#1076' '#1076#1086#1084#1086#1092#1086#1085#1072
      end
      object dbtxtUchZv: TDBText
        Left = 0
        Top = 98
        Width = 363
        Height = 31
        Align = alBottom
        DataField = 'WAREA'
        DataSource = srcHouse
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LupStreets: TDBLookupComboboxEh
        Left = 4
        Top = 17
        Width = 196
        Height = 21
        DynProps = <>
        DataField = ''
        DropDownBox.Columns = <
          item
            FieldName = 'STREET_NAME'
            Title.Caption = #1059#1083#1080#1094#1072
          end
          item
            FieldName = 'AREA_NAME'
            Title.Caption = #1056#1072#1081#1086#1085
          end>
        DropDownBox.ListFieldNames = 'STREET_NAME'
        DropDownBox.ListSource = srcStreet
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterType = lsftContainsEh
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <
          item
            Hint = #1053#1086#1074#1072#1103' '#1091#1083#1080#1094#1072
            ShortCut = 0
            Style = ebsPlusEh
            OnClick = LupStreetsEditButtons0Click
          end>
        KeyField = 'STREET_ID'
        ListField = 'STREET_NAME'
        ListSource = srcStreet
        ShowHint = True
        Style = csDropDownEh
        TabOrder = 0
        Visible = True
        OnChange = LupStreetsChange
        OnClick = DBLookupComboboxClick
      end
      object LupHOUSE: TDBLookupComboboxEh
        Left = 205
        Top = 17
        Width = 68
        Height = 21
        DynProps = <>
        DataField = ''
        DropDownBox.Columns = <
          item
            FieldName = 'HOUSE_NO'
          end
          item
            FieldName = 'SUBAREA_NAME'
            Width = 40
          end>
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        DropDownBox.Width = 200
        EditButtons = <
          item
            Hint = #1053#1086#1074#1099#1081' '#1076#1086#1084
            ShortCut = 0
            Style = ebsPlusEh
            OnClick = LupHOUSEEditButtons0Click
          end>
        KeyField = 'HOUSE_ID'
        ListField = 'HOUSE_NO'
        ListSource = srcHouse
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnChange = LupHOUSEChange
        OnDropDownBoxGetCellParams = LupHOUSEDropDownBoxGetCellParams
        OnExit = LupHOUSEExit
      end
      object edFLAT_NO: TDBEditEh
        Tag = 7
        Left = 279
        Top = 17
        Width = 76
        Height = 21
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 2
        Visible = True
        OnExit = edFLAT_NOExit
      end
      object btnFind: TButton
        Left = 4
        Top = 71
        Width = 269
        Height = 21
        Action = actFindCustomer
        TabOrder = 6
        TabStop = False
      end
      object EdPorch: TDBEditEh
        Tag = 7
        Left = 59
        Top = 44
        Width = 34
        Height = 21
        Hint = #1055#1086#1076#1098#1077#1079#1076
        AutoSize = False
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 3
        Visible = True
      end
      object EdFloor: TDBEditEh
        Tag = 7
        Left = 145
        Top = 44
        Width = 33
        Height = 21
        Hint = #1069#1090#1072#1078
        AutoSize = False
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 4
        Visible = True
        OnExit = EdFloorExit
      end
      object edDOOR: TDBEditEh
        Left = 279
        Top = 44
        Width = 76
        Height = 21
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 5
        Visible = True
      end
      object btnClear: TButton
        Left = 299
        Top = 71
        Width = 56
        Height = 21
        Hint = #1054#1090#1074#1103#1079#1072#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1086#1090' '#1072#1073#1086#1085#1077#1085#1090#1072' ('#1079#1072#1103#1074#1082#1072' '#1073#1077#1079' '#1072#1073#1086#1085#1077#1085#1090#1072')'
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100
        TabOrder = 7
        TabStop = False
        OnClick = btnClearClick
      end
    end
    object pnlCI: TPanel
      Left = 363
      Top = 0
      Width = 469
      Height = 129
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlCI'
      TabOrder = 1
      inline CustomerInfoFrm: TCustomerInfoFrm
        Left = 0
        Top = 0
        Width = 469
        Height = 129
        Align = alClient
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        inherited gbInfo: TGroupBox
          Width = 469
          Height = 129
          inherited HtmlViewer: THtmlViewer
            Width = 465
            Height = 112
          end
        end
      end
    end
  end
  inline frmOkCancel: TOkCancelFrame
    Left = 0
    Top = 487
    Width = 832
    Height = 35
    Align = alBottom
    TabOrder = 2
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 358
      Top = 6
      Width = 334
      Hint = 
        #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' (Ctrl+Enter) '#1080#1083#1080' '#1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1086#1090#1082#1088#1099#1090#1100' (Ctrl+S' +
        'hift+Enter)'
      Caption = '&'#1057#1086#1093#1088#1072#1085#1080#1090#1100
      ModalResult = 0
      OnClick = bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 704
      Top = 6
      Width = 123
      OnClick = frmOkCancelbbCancelClick
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 129
    Width = 832
    Height = 358
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlRType: TPanel
      Left = 0
      Top = 0
      Width = 832
      Height = 257
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object pnlRWorks: TPanel
        Left = 481
        Top = 0
        Width = 351
        Height = 257
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlRWorks'
        TabOrder = 1
        object dbgWorks: TDBGridEh
          Left = 0
          Top = 30
          Width = 351
          Height = 227
          TabStop = False
          Align = alClient
          DataSource = srcWorks
          DynProps = <>
          EditActions = [geaCopyEh, geaSelectAllEh]
          Flat = True
          FooterParams.Color = clWindow
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
          SortLocal = True
          STFilter.Local = True
          TabOrder = 1
          OnExit = dbgWorksExit
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              Title.Caption = #1056#1072#1073#1086#1090#1072
              Width = 178
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'QUANT'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1050#1086#1083'-'#1074#1086
              Width = 42
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'W_TIME'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1053'/'#1063
              Width = 32
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'W_COST'
              Footers = <>
              Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
              Width = 63
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Width = 149
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pnlBW: TPanel
          Left = 0
          Top = 0
          Width = 351
          Height = 30
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object btnAddWork: TButton
            Left = 11
            Top = 5
            Width = 121
            Height = 21
            Action = actAddWork
            TabOrder = 0
            TabStop = False
          end
          object btnDelWork: TButton
            Left = 144
            Top = 5
            Width = 123
            Height = 21
            Action = actDelWork
            TabOrder = 1
            TabStop = False
          end
        end
      end
      object pnlInfo: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 257
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          481
          257)
        object rgShowAs: TRadioGroup
          Left = 0
          Top = 239
          Width = 481
          Height = 18
          Align = alBottom
          Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1087#1086#1093#1086#1078#1080#1077' '#1079#1072#1103#1074#1082#1080' '#1087#1086
          TabOrder = 3
        end
        object rbZV: TRadioButton
          Left = 205
          Top = 239
          Width = 67
          Height = 17
          Anchors = [akTop, akBottom]
          Caption = #1047#1074#1077#1085#1091
          TabOrder = 4
          TabStop = True
          OnClick = rbZVClick
        end
        object rbADRS: TRadioButton
          Left = 279
          Top = 239
          Width = 68
          Height = 17
          Anchors = [akTop, akBottom]
          Caption = #1040#1076#1088#1077#1089#1091
          Checked = True
          TabOrder = 5
          TabStop = True
          OnClick = rbADRSClick
        end
        object pnlRTOP: TPanel
          Left = 0
          Top = 0
          Width = 481
          Height = 137
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            481
            137)
          object lbl8: TLabel
            Left = 4
            Top = 8
            Width = 63
            Height = 13
            Caption = #1058#1080#1087' '#1079#1072#1103#1074#1082#1080
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblCAUSE: TLabel
            Left = 4
            Top = 35
            Width = 83
            Height = 13
            Caption = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1079#1086#1074#1072
          end
          object lbl5: TLabel
            Left = 4
            Top = 57
            Width = 44
            Height = 13
            Caption = #1058#1077#1083#1077#1092#1086#1085
          end
          object lupType: TDBLookupComboboxEh
            Left = 100
            Top = 5
            Width = 376
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DynProps = <>
            DataField = ''
            DropDownBox.ListSource = srcRequestType
            DropDownBox.ListSourceAutoFilter = True
            DropDownBox.ListSourceAutoFilterAllColumns = True
            DropDownBox.AutoDrop = True
            DropDownBox.Sizable = True
            EditButtons = <
              item
                Hint = #1044#1086#1073#1072#1074#1080#1090#1100
                ShortCut = 45
                Style = ebsPlusEh
                OnClick = lupTypeEditButtons0Click
              end>
            KeyField = 'RT_ID'
            ListField = 'RT_NAME'
            ListSource = srcRequestType
            ShowHint = True
            Style = csDropDownEh
            TabOrder = 0
            Visible = True
            OnButtonClick = lupTypeButtonClick
            OnChange = lupTypeChange
            OnClick = DBLookupComboboxClick
            OnDropDownBoxGetCellParams = lupTypeDropDownBoxGetCellParams
            OnEnter = DBLookupComboboxEnter
          end
          object luTemplate: TDBLookupComboboxEh
            Left = 100
            Top = 30
            Width = 376
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DynProps = <>
            DataField = ''
            DropDownBox.ListSource = srcErrors
            DropDownBox.ListSourceAutoFilter = True
            DropDownBox.ListSourceAutoFilterAllColumns = True
            DropDownBox.AutoDrop = True
            DropDownBox.Sizable = True
            EditButtons = <
              item
                Hint = #1044#1086#1073#1072#1074#1080#1090#1100
                ShortCut = 45
                Style = ebsPlusEh
                OnClick = luTemplateEditButtons0Click
              end>
            KeyField = 'RQTL_ID'
            ListField = 'RQ_CONTENT'
            ListSource = srcErrors
            ShowHint = True
            Style = csDropDownEh
            TabOrder = 1
            Visible = True
            OnButtonClick = lupTypeButtonClick
            OnChange = luTemplateChange
            OnClick = DBLookupComboboxClick
            OnEnter = DBLookupComboboxEnter
          end
          object mmoContent: TDBMemoEh
            Left = 4
            Top = 79
            Width = 472
            Height = 57
            Hint = #1047#1072#1103#1074#1083#1077#1085#1085#1072#1103' '#1085#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100
            ScrollBars = ssVertical
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoSize = False
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1047#1072#1103#1074#1083#1077#1085#1085#1072#1103' '#1085#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100
            ShowHint = True
            TabOrder = 4
            Visible = True
            WantReturns = True
          end
          object edPhone: TDBEditEh
            Left = 54
            Top = 54
            Width = 40
            Height = 21
            DynProps = <>
            EditButtons = <>
            ShowHint = True
            TabOrder = 3
            Visible = False
            OnChange = edPhoneChange
            OnExit = edPhoneExit
          end
          object cbContact: TDBComboBoxEh
            Left = 100
            Top = 54
            Width = 375
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DynProps = <>
            DropDownBox.AutoDrop = True
            DropDownBox.AutoFilter = True
            DropDownBox.AutoFilterType = lsftContainsEh
            DropDownBox.Sizable = True
            EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072' '#1080' '#1076#1088#1091#1075#1086#1081' '#1082#1086#1085#1090#1072#1082#1090
            EditButtons = <>
            MRUList.AutoAdd = False
            ShowHint = True
            TabOrder = 2
            Visible = True
            OnButtonClick = cbContactButtonClick
            OnClick = cbContactClick
            OnEnter = cbContactEnter
            OnNotInList = cbContactNotInList
          end
        end
        object pnlAddInfo: TPanel
          Left = 0
          Top = 137
          Width = 481
          Height = 26
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          Visible = False
          object lbl14: TLabel
            Left = 4
            Top = 8
            Width = 59
            Height = 13
            Caption = #1044#1086#1087'. '#1080#1085#1092#1086
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object cbbAdd: TDBComboBoxEh
            Left = 100
            Top = 5
            Width = 375
            Height = 21
            DynProps = <>
            DropDownBox.Sizable = True
            EditButtons = <>
            ShowHint = True
            TabOrder = 0
            Text = 'cbbAdd'
            Visible = True
          end
        end
        object pnlRClient: TPanel
          Left = 0
          Top = 163
          Width = 481
          Height = 76
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          OnResize = pnlRClientResize
          DesignSize = (
            481
            76)
          object lbl9: TLabel
            Left = 4
            Top = 7
            Width = 90
            Height = 13
            Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1072#1090#1072
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbl10: TLabel
            Left = 312
            Top = 7
            Width = 42
            Height = 13
            Caption = #1074#1088#1077#1084#1103' '#1089':'
          end
          object lbl11: TLabel
            Left = 412
            Top = 7
            Width = 16
            Height = 13
            Caption = #1087#1086':'
          end
          object lbl13: TLabel
            Left = 4
            Top = 31
            Width = 3
            Height = 13
          end
          object btnSelectDate: TBitBtn
            Left = 211
            Top = 4
            Width = 95
            Height = 21
            Action = actDateSelect
            Caption = 'F3 &'#1042#1099#1073#1086#1088' '#1076#1072#1090#1099
            TabOrder = 1
            TabStop = False
          end
          object edtTimeFrom: TDBDateTimeEditEh
            Left = 364
            Top = 4
            Width = 43
            Height = 21
            DynProps = <>
            EditButton.Visible = False
            EditButtons = <>
            ShowHint = True
            TabOrder = 2
            Visible = True
            OnEnter = edtTimeFromEnter
            EditFormat = 'HH:NN'
          end
          object edtTimeTo: TDBDateTimeEditEh
            Left = 428
            Top = 4
            Width = 47
            Height = 21
            DynProps = <>
            EditButton.Visible = False
            EditButtons = <>
            ShowHint = True
            TabOrder = 3
            Visible = True
            OnEnter = edtTimeFromEnter
            EditFormat = 'HH:NN'
          end
          object mmoNotice: TDBMemoEh
            Left = 4
            Top = 28
            Width = 472
            Height = 46
            Hint = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            ScrollBars = ssVertical
            Anchors = [akLeft, akTop, akRight, akBottom]
            AutoSize = False
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            ShowHint = True
            TabOrder = 4
            Visible = True
            WantReturns = True
          end
          object edtPLANDATE: TDBDateTimeEditEh
            Left = 100
            Top = 4
            Width = 99
            Height = 21
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1085#1072' '#1082#1072#1082#1091#1102' '#1076#1072#1090#1091
            Kind = dtkDateEh
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnChange = edtPLANDATEChange
          end
        end
      end
    end
    object pnlTime: TPanel
      Left = 0
      Top = 257
      Width = 832
      Height = 101
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlTime'
      TabOrder = 1
      object dbgSame: TDBGridEh
        Left = 0
        Top = 0
        Width = 832
        Height = 101
        TabStop = False
        Align = alClient
        DataSource = srcSame
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
        STFilter.Local = True
        STFilter.Visible = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STREET_NAME'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1091#1083#1080#1094#1072
            Title.TitleButton = True
            Width = 100
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOUSE_NO'
            Footers = <>
            Title.Caption = #1076#1086#1084' '#8470
            Title.TitleButton = True
            Width = 48
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'FLAT_NO'
            Footers = <>
            Title.Caption = #1050#1074'.'
            Width = 41
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'HH:MM'
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_TIME_FROM'
            Footers = <>
            Title.Caption = #1042#1088'. c'
            Title.TitleButton = True
            Width = 38
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DisplayFormat = 'HH:MM'
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_TIME_TO'
            Footers = <>
            Title.Caption = #1042#1088'. '#1087#1086
            Title.TitleButton = True
            Width = 38
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_CONTENT'
            Footers = <>
            Title.Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 119
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'O_NAME'
            Footers = <>
            Title.Caption = #1058#1080#1087' '#1079#1072#1103#1074#1082#1080
            Title.TitleButton = True
            Width = 72
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ZVENO'
            Footers = <>
            Title.Caption = #1047#1074#1077#1085#1086
            Width = 72
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_ID'
            Footers = <>
            Title.Caption = #8470' '#1079#1072#1103#1074#1082#1080
            Title.TitleButton = True
            Width = 70
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_PLAN_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 65
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object chkOpenBid: TDBCheckBoxEh
    Left = 4
    Top = 496
    Width = 85
    Height = 17
    Hint = #1054#1090#1082#1088#1099#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1087#1086#1089#1083#1077' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
    Anchors = [akLeft, akBottom]
    Caption = #1054#1090#1082#1088#1099#1090#1100' '
    DynProps = <>
    TabOrder = 3
  end
  object chkRecreate: TDBCheckBoxEh
    Left = 91
    Top = 496
    Width = 169
    Height = 17
    Hint = #1055#1077#1088#1077#1089#1086#1079#1076#1072#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1095#1077#1088#1077#1079
    Anchors = [akLeft, akBottom]
    Caption = #1055#1077#1088#1077#1089#1086#1079#1076#1072#1090#1100' '#1095#1077#1088#1077#1079' '
    Checked = True
    DynProps = <>
    State = cbChecked
    TabOrder = 4
    Visible = False
  end
  object dsWorks: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'W_ID'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'NAME'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'W_TIME'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'NOTICE'
        DataType = ftWideString
        Size = 500
      end
      item
        Name = 'QUANT'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'W_COST'
        DataType = ftFloat
        Precision = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 608
    Top = 247
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object W_ID: TMTNumericDataFieldEh
          FieldName = 'W_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object NAME: TMTStringDataFieldEh
          FieldName = 'NAME'
          StringDataType = fdtWideStringEh
          DisplayWidth = 100
          Size = 255
        end
        object W_TIME: TMTNumericDataFieldEh
          FieldName = 'W_TIME'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayWidth = 16
          currency = False
          Precision = 15
        end
        object NOTICE: TMTStringDataFieldEh
          FieldName = 'NOTICE'
          StringDataType = fdtWideStringEh
          DisplayWidth = 100
          Size = 500
        end
        object QUANT: TMTNumericDataFieldEh
          FieldName = 'QUANT'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object W_COST: TMTNumericDataFieldEh
          FieldName = 'W_COST'
          NumericDataType = fdtFloatEh
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
  object srcWorks: TDataSource
    DataSet = dsWorks
    Left = 607
    Top = 204
  end
  object dsStreets: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT s.street_id, s.street_name||'#39' '#39'||s.street_short as street' +
        '_name, a.area_name'
      'FROM STREET s left outer join area a on (a.area_id = s.area_id)'
      'ORDER BY STREET_NAME, a.area_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 180
    Top = 164
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 159
    Top = 180
  end
  object dsHouse: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    H.HOUSE_ID'
      '  , H.STREET_ID'
      '  , h.HOUSE_NO'
      '  , sa.Subarea_Name'
      '  , H.Q_FLAT'
      
        '  , iif(coalesce(h.In_Date, dateadd(day, 1, current_date)) <= cu' +
        'rrent_date, '#39#39', '#39#1085#1077' '#1089#1076#1072#1085#39') inService  '
      
        '  , wa.name || '#39' '#39' || wg.name || '#39' '#39' || cast(coalesce('#39'('#39' ||(sel' +
        'ect'
      
        '                                                                ' +
        ' list(w.surname)'
      
        '                                                               f' +
        'rom worker w'
      
        '                                                               w' +
        'here (w.team = wg.name'
      
        '                                                                ' +
        '     and w.working = 1)) || '#39')'#39', '#39#39') || coalesce('#39' '#39' || he.he_na' +
        'me, '#39#39') as varchar(500)) as warea'
      
        '  , iif(coalesce(h.In_Date, dateadd(day, 1, current_date)) <= cu' +
        'rrent_date, '#39#39', '#39#1085#1077' '#1089#1076#1072#1085#39') InService  '
      '  from HOUSE H'
      '       left outer join workgroups wg on (wg.wg_id = h.wg_id)'
      '       left outer join workarea wa on (wa.wa_id = wg.wa_id)'
      '       left outer join headend he on (h.headend_id = he.he_id)'
      
        '       left outer join Subarea sa on (sa.Subarea_Id = h.Subarea_' +
        'Id)'
      '  where h.street_id = :street_id'
      '@@AREA_LOCK% @ -- '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1088#1072#1081#1086#1085#1072#1084
      'order by h.HOUSE_NO')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcStreet
    Left = 264
    Top = 223
  end
  object srcHouse: TDataSource
    DataSet = dsHouse
    Left = 231
    Top = 222
  end
  object srcRequestType: TDataSource
    AutoEdit = False
    DataSet = dsRequestType
    Left = 345
    Top = 164
  end
  object dsRequestType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    W.*'
      '    , coalesce(w.Rt_Color,  '#39'clWindow'#39') as COLOR'
      '  from REQUEST_TYPES W'
      '  where coalesce(w.RT_DELETED, 0) = 0'
      '        and ((coalesce(w.Rt_Hc_Need, 0) = 0)'
      '           or ('
      '             (w.Rt_Hc_Need = 1) '
      '             and '
      '             exists(select h.House_Id from house h '
      '                    where h.House_Id = :house_id '
      '                      and h.In_Date <= current_date))'
      '           )'
      '         @@RT_RESTRICT%@  '
      '  order by coalesce(w.rt_default, 0) desc, W.RT_NAME')
    AfterOpen = dsRequestTypeAfterOpen
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcHouse
    Left = 370
    Top = 191
  end
  object actlst: TActionList
    Left = 431
    Top = 53
    object actFindCustomer: TAction
      Caption = 'F7 &'#1053#1072#1081#1090#1080' '#1072#1073#1086#1085#1077#1085#1090#1072
      Hint = #1053#1072#1081#1090#1080' '#1072#1073#1086#1085#1077#1085#1090#1072' '#1087#1086' '#1072#1076#1088#1077#1089#1091
      SecondaryShortCuts.Strings = (
        'Alt+'#1053
        'Alt+'#1085
        'Alt+Y'
        'Alt+y')
      ShortCut = 118
      OnExecute = actFindCustomerExecute
    end
    object actReqForAdres: TAction
      Caption = 'F4 &'#1047#1072#1103#1074#1082#1080' '#1087#1086' '#1072#1076#1088#1077#1089#1091
      Enabled = False
      Hint = #1053#1077#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1077' '#1079#1072#1103#1074#1082#1080' '#1087#1086' '#1101#1090#1086#1084#1091' '#1072#1076#1088#1077#1089#1091
      SecondaryShortCuts.Strings = (
        'Alt+'#1047
        'Alt+'#1079
        'Alt+p'
        'Alt+P')
      ShortCut = 115
    end
    object actSave: TAction
      Caption = 'actSave'
      OnExecute = actSaveExecute
    end
    object actAddWork: TAction
      Caption = '&'#1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1073#1086#1090#1091' '#1074' '#1079#1072#1103#1074#1082#1091
      SecondaryShortCuts.Strings = (
        'Alt+'#1044
        'Alt+'#1076
        'Alt+L'
        'Alt+l')
      ShortCut = 45
      OnExecute = actAddWorkExecute
    end
    object actDelWork: TAction
      Caption = '&'#1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1073#1086#1090#1091' '#1080#1079' '#1079#1072#1103#1074#1082#1080
      SecondaryShortCuts.Strings = (
        'Alt+'#1059
        'Alt+'#1091
        'Alt+e'
        'Alt+E')
      OnExecute = actDelWorkExecute
    end
    object actDateSelect: TAction
      Caption = 'F3 &'#1042#1099#1073#1086#1088' '#1076#1072#1090#1099
      Enabled = False
      SecondaryShortCuts.Strings = (
        'Alt+'#1042
        'Alt+'#1074
        'Alt+D'
        'Alt+d')
      ShortCut = 114
      OnExecute = actDateSelectExecute
    end
  end
  object dsErrors: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    RT.RQTL_ID'
      '  , RT.RQ_CONTENT'
      '  , RT.ADD_FIELD'
      '  , coalesce(RT.NEED_NODE_RQ, 0) NEED_NODE_RQ'
      '  , RT.RECREATE_DAYS'
      '  , RT.WORKS         '
      '  from REQUEST_TEMPLATES RT'
      '  where RT.Rq_Type = :RT_ID'
      '        and (RT.DELETED = 0 or RT.DELETED is null)'
      '      @@RT_RESTRICT%@'
      '  order by RT.RQ_CONTENT')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcRequestType
    Left = 52
    Top = 401
  end
  object srcErrors: TDataSource
    DataSet = dsErrors
    Left = 112
    Top = 400
  end
  object dsDefaultWorks: TpFIBDataSet
    UpdateSQL.Strings = (
      ''
      '    ')
    DeleteSQL.Strings = (
      'Update'
      '    WORKS'
      'set Deleted = 1'
      'WHERE'
      'W_ID = :OLD_W_ID'
      '    ')
    RefreshSQL.Strings = (
      'select w.* from works w where(  w.rq_type = :rt_id'
      '     ) and (     W.W_ID = :OLD_W_ID'
      '     )'
      'and w.Deleted = 0'
      '     ')
    SelectSQL.Strings = (
      'select'
      '    w.W_Id'
      '  , w.Name'
      '  , w.W_Time'
      
        '  , coalesce(iif(w.As_Service is null, w.W_Cost, iif(coalesce(s.' +
        'Srv_Type_Id, 2) = 2, 0,'
      '    (select'
      '         t.tarif_sum'
      '       from tarif t'
      '       where t.service_id = s.service_id'
      
        '             and current_date between t.date_from and t.date_to)' +
        ')), 0) W_COST'
      '  from works w'
      
        '       left outer join services s on (s.service_id = w.as_servic' +
        'e)'
      '  where w.rq_type = :rt_id'
      '        and w.Deleted = 0'
      '        and w.on_default = 1'
      '  order by w.name')
    AutoUpdateOptions.UpdateTableName = 'REQUEST_TEMPLATES'
    AutoUpdateOptions.KeyFields = 'RT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcRequestType
    Left = 100
    Top = 202
  end
  object trQuery: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 382
    Top = 80
  end
  object srcSame: TDataSource
    DataSet = dsSame
    Left = 428
    Top = 404
  end
  object dsSame: TpFIBDataSet
    DeleteSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'select '
      '    s.street_name||'#39' '#39'||s.street_short street_name,'
      '    h.house_no,'
      '    r.rq_id,'
      '    o.rt_name o_name,'
      '    r.RQ_PLAN_DATE,'
      '    r.rq_time_from,'
      '    r.rq_time_to,'
      '    t.rq_content,'
      '    r.flat_no,'
      '    w.name ZVENO'
      'from REQUEST R'
      'inner join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)'
      'inner join STREET S on (H.STREET_ID = S.STREET_ID)'
      'inner join REQUEST_TYPES O on (R.RQ_TYPE = O.RT_ID)'
      'left outer join request_templates t on (t.rqtl_id = r.rqtl_id)'
      'left outer join WORKGROUPS W on (W.WG_ID = H.WG_ID)'
      
        'where @@filter%(( exists(select H1.HOUSE_ID from HOUSE H1 where ' +
        'H1.HOUSE_ID = R.HOUSE_ID and exists(select h2.STREET_ID from HOU' +
        'SE h2 where H2.STREET_ID = H1.STREET_ID and HOUSE_ID = :HOUSE_ID' +
        '))))@'
      
        '      and ((R.RQ_PLAN_DATE = :RQ_PLAN_DATE) or (:RQ_PLAN_DATE is' +
        ' null)) '
      '      and R.REQ_RESULT < 2 '
      '      and R.RQ_ID <> :RQ_ID'
      'order by 1, 2, RQ_PLAN_DATE  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 489
    Top = 405
    poUseBooleanField = False
    poImportDefaultValues = False
    poGetOrderInfo = False
    poEmptyStrToNull = False
    dcForceOpen = True
  end
  object PropStorage: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 499
    Top = 43
  end
  object cnError: TCnErrorProvider
    DoubleBuffer = False
    Left = 184
    Top = 96
  end
  object dsAllWorks: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    w.W_Id'
      '  , w.Name'
      '  , w.W_Time'
      
        '  , coalesce(iif(w.As_Service is null, w.W_Cost, iif(coalesce(s.' +
        'Srv_Type_Id, 2) = 2, 0,'
      '    (select'
      '         t.tarif_sum'
      '       from tarif t'
      '       where t.service_id = s.service_id'
      
        '             and current_date between t.date_from and t.date_to)' +
        ')), 0) W_COST'
      '  from works w'
      
        '       left outer join services s on (s.service_id = w.as_servic' +
        'e)'
      '  where w.Deleted = 0'
      '  order by w.name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 604
    Top = 297
  end
end
