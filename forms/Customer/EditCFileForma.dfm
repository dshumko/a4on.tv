object EditCFileForm: TEditCFileForm
  Left = 540
  Top = 390
  ActiveControl = dbluFileType
  BorderIcons = [biSystemMenu]
  Caption = #1060#1072#1081#1083' '#1072#1073#1086#1085#1077#1085#1090#1072
  ClientHeight = 712
  ClientWidth = 526
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 526
    Height = 33
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      526
      33)
    object lblFile: TLabel
      Left = 6
      Top = 12
      Width = 53
      Height = 13
      Caption = #1058#1080#1087' '#1092#1072#1081#1083#1072
    end
    object dbluFileType: TDBLookupComboboxEh
      Left = 85
      Top = 9
      Width = 436
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'CF_TYPE'
      DataSource = srcCustFile
      DropDownBox.ListSource = srcFileTypes
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1058#1080#1087' '#1092#1072#1081#1083#1072
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcFileTypes
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnClick = dbluFileTypeClick
      OnDropDownBoxGetCellParams = dbluFileTypeDropDownBoxGetCellParams
      OnEnter = dbluFileTypeEnter
      OnExit = dbluFileTypeExit
    end
  end
  object pnlBtm: TPanel
    Left = 0
    Top = 678
    Width = 526
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      526
      34)
    object btnOk: TBitBtn
      Left = 6
      Top = 4
      Width = 431
      Height = 26
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TBitBtn
      Left = 443
      Top = 4
      Width = 78
      Height = 26
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object pnlClient: TPanel
    Left = 0
    Top = 61
    Width = 526
    Height = 617
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object pnlNotice: TPanel
      Left = 0
      Top = 569
      Width = 526
      Height = 48
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 12
      object splMemo: TSplitter
        Left = 0
        Top = 14
        Width = 526
        Height = 3
        Cursor = crVSplit
        Align = alTop
        Visible = False
      end
      object memNotice: TDBMemoEh
        AlignWithMargins = True
        Left = 5
        Top = 17
        Width = 516
        Height = 31
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        ScrollBars = ssVertical
        Align = alClient
        AutoSize = False
        DataField = 'NOTICE'
        DataSource = srcCustFile
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077
        ShowHint = True
        TabOrder = 1
        Visible = True
        WantReturns = True
      end
      object mmoMemo: TDBMemoEh
        AlignWithMargins = True
        Left = 5
        Top = 0
        Width = 516
        Height = 14
        Margins.Left = 5
        Margins.Top = 0
        Margins.Right = 5
        Margins.Bottom = 0
        ScrollBars = ssVertical
        Align = alTop
        AutoSize = False
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        ShowHint = True
        TabOrder = 0
        Visible = False
        WantReturns = True
        OnChange = mmoMemoChange
        OnExit = mmoMemoExit
      end
    end
    object pnlText: TPanel
      Left = 0
      Top = 469
      Width = 526
      Height = 100
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 11
      Visible = False
      DesignSize = (
        526
        100)
      object lblText: TLabel
        Tag = 1
        Left = 5
        Top = 4
        Width = 56
        Height = 13
        Caption = #1044#1086#1087'. '#1090#1077#1082#1089#1090
      end
      object lblText1: TLabel
        Tag = 1
        Left = 5
        Top = 29
        Width = 62
        Height = 13
        Caption = #1044#1086#1087'. '#1090#1077#1082#1089#1090'1'
      end
      object lblText2: TLabel
        Tag = 1
        Left = 6
        Top = 54
        Width = 62
        Height = 13
        Caption = #1044#1086#1087'. '#1090#1077#1082#1089#1090'2'
      end
      object lblText3: TLabel
        Tag = 1
        Left = 6
        Top = 79
        Width = 62
        Height = 13
        Caption = #1044#1086#1087'. '#1090#1077#1082#1089#1090'3'
      end
      object edtText: TDBEditEh
        Tag = 1
        Left = 85
        Top = 1
        Width = 436
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnExit = edtMobileExit
      end
      object edtText1: TDBEditEh
        Tag = 1
        Left = 85
        Top = 26
        Width = 436
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnExit = edtMobileExit
      end
      object edtText2: TDBEditEh
        Tag = 1
        Left = 85
        Top = 51
        Width = 436
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 2
        Visible = True
        OnExit = edtMobileExit
      end
      object edtText3: TDBEditEh
        Tag = 1
        Left = 85
        Top = 76
        Width = 436
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 3
        Visible = True
        OnExit = edtMobileExit
      end
    end
    object pnlMobile: TPanel
      Left = 0
      Top = 443
      Width = 526
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 10
      Visible = False
      DesignSize = (
        526
        26)
      object lblMobile: TLabel
        Tag = 1
        Left = 6
        Top = 5
        Width = 58
        Height = 13
        Caption = #1052#1086#1073#1080#1083#1100#1085#1099#1081
      end
      object edtMobile: TDBEditEh
        Tag = 1
        Left = 85
        Top = 2
        Width = 172
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1090#1077#1083#1077#1092#1086#1085
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnExit = edtMobileExit
      end
      object edtEMAIL: TDBEditEh
        Tag = 1
        Left = 303
        Top = 2
        Width = 218
        Height = 21
        Anchors = [akTop, akRight]
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = 'email'
        ShowHint = True
        TabOrder = 2
        Visible = True
        OnExit = edtMobileExit
      end
      object chkWA: TCheckBox
        Left = 260
        Top = 4
        Width = 39
        Height = 17
        Hint = #1077#1089#1083#1080' '#1085#1072' '#1090#1077#1083#1077#1092#1086#1085#1077' '#1077#1089#1090#1100' WA'
        Anchors = [akTop, akRight]
        Caption = 'WA'
        TabOrder = 1
      end
    end
    object pnlDoc: TPanel
      Left = 0
      Top = 95
      Width = 526
      Height = 114
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      Visible = False
      DesignSize = (
        526
        114)
      object lbl2: TLabel
        Tag = 1
        Left = 6
        Top = 35
        Width = 80
        Height = 13
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      end
      object lbl3: TLabel
        Tag = 1
        Left = 6
        Top = 73
        Width = 81
        Height = 13
        Caption = #1040#1076#1088#1077#1089' '#1087#1088#1086#1087#1080#1089#1082#1080
      end
      object Label6: TLabel
        Tag = 1
        Left = 117
        Top = -2
        Width = 55
        Height = 13
        Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085
      end
      object lbl9: TLabel
        Tag = 1
        Left = 117
        Top = 35
        Width = 85
        Height = 13
        Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
      end
      object lbl21: TLabel
        Tag = 1
        Left = 6
        Top = -2
        Width = 68
        Height = 13
        Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      end
      object edtBIRTHDAY: TDBDateTimeEditEh
        Tag = 1
        Left = 6
        Top = 51
        Width = 105
        Height = 21
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 2
        Visible = True
      end
      object edtADRES_REGISTR: TDBEditEh
        Tag = 1
        Left = 6
        Top = 89
        Width = 515
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1040#1076#1088#1077#1089' '#1087#1088#1086#1087#1080#1089#1082#1080
        ShowHint = True
        TabOrder = 4
        Visible = True
      end
      object edtRegistration: TDBEditEh
        Tag = 1
        Left = 117
        Top = 14
        Width = 404
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1050#1077#1084' '#1074#1099#1076#1072#1085
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object edtPlaceBirth: TDBEditEh
        Tag = 1
        Left = 117
        Top = 51
        Width = 404
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
        ShowHint = True
        TabOrder = 3
        Visible = True
      end
      object edtDOCDATE: TDBDateTimeEditEh
        Tag = 1
        Left = 6
        Top = 14
        Width = 105
        Height = 21
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
    end
    object pnlPassport: TPanel
      Left = 0
      Top = 29
      Width = 526
      Height = 66
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      Visible = False
      DesignSize = (
        526
        66)
      object Label1: TLabel
        Tag = 1
        Left = 6
        Top = 6
        Width = 52
        Height = 13
        Caption = #1055#1072#1089#1087#1086#1088#1090' N'
      end
      object Label3: TLabel
        Tag = 1
        Left = 6
        Top = 27
        Width = 100
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103' '#1079#1072#1103#1074#1080#1090#1077#1083#1103
      end
      object Label4: TLabel
        Tag = 1
        Left = 194
        Top = 27
        Width = 19
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1048#1084#1103
      end
      object Label7: TLabel
        Tag = 1
        Left = 354
        Top = 27
        Width = 49
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      end
      object edtPASSPORT: TDBEditEh
        Tag = 1
        Left = 85
        Top = 3
        Width = 352
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1072
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnEnter = edtPASSPORTEnter
        OnExit = edtPASSPORTExit
      end
      object edtSURNAME: TDBEditEh
        Left = 6
        Top = 41
        Width = 182
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1060#1072#1084#1080#1083#1080#1103
        ShowHint = True
        TabOrder = 2
        Visible = True
        OnChange = edtSURNAMEChange
      end
      object edtFIRSTNAME: TDBEditEh
        Tag = 1
        Left = 194
        Top = 41
        Width = 155
        Height = 21
        Anchors = [akTop, akRight]
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1048#1084#1103
        ShowHint = True
        TabOrder = 3
        Visible = True
        OnChange = edtSURNAMEChange
      end
      object edtMIDLENAME: TDBEditEh
        Tag = 1
        Left = 354
        Top = 41
        Width = 167
        Height = 21
        Anchors = [akTop, akRight]
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1054#1090#1095#1077#1089#1090#1074#1086
        ShowHint = True
        TabOrder = 4
        Visible = True
        OnChange = edtSURNAMEChange
      end
      object btnOcr: TButton
        Left = 443
        Top = 3
        Width = 78
        Height = 21
        Hint = #1056#1072#1089#1087#1086#1079#1085#1072#1090#1100' '#1087#1072#1089#1087#1086#1088#1090' '#1080#1079' '#1092#1072#1081#1083#1072
        Anchors = [akTop, akRight]
        Caption = #1056#1072#1089#1087#1086#1079#1085#1072#1090#1100
        TabOrder = 1
        TabStop = False
        Visible = False
        OnClick = btnOcrClick
      end
    end
    object pnlSrv: TPanel
      Left = 0
      Top = 262
      Width = 526
      Height = 55
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      DesignSize = (
        526
        55)
      object lblOnOff: TLabel
        Left = 6
        Top = 7
        Width = 52
        Height = 13
        Caption = #1042#1082#1083'/'#1054#1090#1082#1083'.'
      end
      object edDate: TDBDateTimeEditEh
        Left = 85
        Top = 31
        Width = 103
        Height = 21
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 2
        Visible = True
        OnChange = edDateChange
      end
      object lcbService: TDBLookupComboboxEh
        Left = 309
        Top = 4
        Width = 212
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        DropDownBox.ListFieldNames = 'NAME'
        DropDownBox.ListSource = srcService
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterType = lsftContainsEh
        DropDownBox.AutoDrop = True
        EditButtons = <>
        KeyField = 'SERVICE_ID'
        ListField = 'NAME'
        ListSource = srcService
        ShowHint = True
        Style = csDropDownEh
        TabOrder = 1
        Visible = True
        OnChange = lcbServiceChange
        OnClick = lcbServiceClick
        OnEnter = lcbServiceEnter
      end
      object lcbOnOffSrv: TDBLookupComboboxEh
        Left = 194
        Top = 31
        Width = 327
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = srcOnOffService
        ShowHint = True
        TabOrder = 3
        Visible = True
        OnChange = lcbOnOffSrvChange
      end
      object lcbServiceFrom: TDBLookupComboboxEh
        Left = 85
        Top = 4
        Width = 218
        Height = 21
        DynProps = <>
        DataField = ''
        DropDownBox.ListFieldNames = 'NAME'
        DropDownBox.ListSource = srcService
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterType = lsftContainsEh
        DropDownBox.AutoDrop = True
        EditButtons = <>
        KeyField = 'SERVICE_ID'
        ListField = 'NAME'
        ListSource = srcServiceFrom
        ShowHint = True
        Style = csDropDownEh
        TabOrder = 0
        Visible = True
        OnChange = lcbServiceChange
        OnClick = lcbServiceClick
        OnEnter = lcbServiceEnter
      end
    end
    object pnlContract: TPanel
      Left = 0
      Top = 209
      Width = 526
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      Visible = False
      DesignSize = (
        526
        27)
      object lblContr: TLabel
        Left = 399
        Top = 7
        Width = 12
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1086#1090
        Visible = False
      end
      object edtContractDate: TDBDateTimeEditEh
        Left = 418
        Top = 3
        Width = 103
        Height = 21
        Anchors = [akTop, akRight]
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 1
        Visible = False
        OnExit = edtContractDateExit
      end
      object edtContract: TDBEditEh
        Left = 212
        Top = 3
        Width = 180
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 0
        Visible = False
        OnExit = edtContractExit
      end
      object chkContract: TCheckBox
        Left = 101
        Top = 5
        Width = 105
        Height = 17
        Alignment = taLeftJustify
        Caption = #1053#1086#1074#1099#1081' '#1076#1086#1075#1086#1074#1086#1088
        TabOrder = 3
        OnClick = chkContractClick
      end
      object chkFOwner: TDBCheckBoxEh
        Left = 12
        Top = 5
        Width = 75
        Height = 17
        Hint = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '#1082#1074#1072#1088#1090#1080#1088#1099
        Alignment = taLeftJustify
        Caption = #1057#1086#1073#1089'-'#1082'. '#1082#1074'.'
        DynProps = <>
        State = cbGrayed
        TabOrder = 2
        Visible = False
        OnClick = chkFOwnerClick
      end
    end
    object pnlAdr: TPanel
      Left = 0
      Top = 236
      Width = 526
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      Visible = False
      DesignSize = (
        526
        26)
      object lbl: TLabel
        Tag = 1
        Left = 6
        Top = 5
        Width = 72
        Height = 13
        Caption = #1057#1090#1072#1088#1099#1081' '#1072#1076#1088#1077#1089
      end
      object lcbStreets: TDBLookupComboboxEh
        Left = 85
        Top = 2
        Width = 180
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
        TabOrder = 0
        Visible = True
      end
      object lcbHOUSE: TDBLookupComboboxEh
        Left = 271
        Top = 2
        Width = 78
        Height = 21
        Hint = #1044#1086#1084
        DynProps = <>
        DataField = ''
        DropDownBox.Columns = <
          item
            FieldName = 'HOUSE_NO'
            Width = 60
          end
          item
            FieldName = 'SUBAREA_NAME'
            Width = 40
          end>
        DropDownBox.AutoDrop = True
        EmptyDataInfo.Text = #1044#1086#1084
        EditButtons = <>
        KeyField = 'HOUSE_ID'
        ListField = 'HOUSE_NO'
        ListSource = srcHouse
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object lcbFLAT: TDBLookupComboboxEh
        Left = 355
        Top = 2
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
        TabOrder = 2
        Visible = True
        OnExit = lcbFLATExit
      end
      object chkNewOwner: TDBCheckBoxEh
        Left = 446
        Top = 4
        Width = 75
        Height = 17
        Hint = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082' '#1082#1074#1072#1088#1090#1080#1088#1099' '#1087#1086' '#1085#1086#1074#1086#1084#1091' '#1072#1076#1088#1077#1089#1091
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        Caption = #1057#1086#1073#1089'-'#1082'. '#1082#1074'.'
        DynProps = <>
        State = cbGrayed
        TabOrder = 3
        Visible = False
        OnClick = chkFOwnerClick
      end
    end
    object pnlBidPay: TPanel
      Left = 0
      Top = 368
      Width = 526
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 7
      Visible = False
      object lblBP: TLabel
        Tag = 1
        Left = 6
        Top = 4
        Width = 36
        Height = 13
        Caption = #1047#1072#1103#1074#1082#1072
      end
      object ednBid: TDBNumberEditEh
        Left = 85
        Top = 1
        Width = 103
        Height = 21
        DecimalPlaces = 0
        DynProps = <>
        EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080
        EditButtons = <>
        ShowHint = True
        TabOrder = 0
        Visible = False
        OnExit = ednBidExit
      end
      object ednBidSum: TDBNumberEditEh
        Left = 303
        Top = 1
        Width = 109
        Height = 21
        AutoSelect = False
        DynProps = <>
        EmptyDataInfo.Text = #1057#1091#1084#1084#1072' '#1087#1086' '#1079#1072#1103#1074#1082#1077
        EditButtons = <>
        ShowHint = True
        TabOrder = 2
        Visible = False
        OnExit = ednBidExit
      end
      object ednCheckSum: TDBNumberEditEh
        Left = 194
        Top = 1
        Width = 103
        Height = 21
        DynProps = <>
        EmptyDataInfo.Text = #1057#1091#1084#1084#1072' '#1055#1050#1054
        EditButtons = <>
        ShowHint = True
        TabOrder = 1
        Visible = False
        OnExit = ednBidExit
      end
      object ednFineSum: TDBNumberEditEh
        Left = 418
        Top = 1
        Width = 103
        Height = 21
        DynProps = <>
        EmptyDataInfo.Text = #1057#1091#1084#1084#1072' '#1087#1077#1085#1080
        EditButtons = <>
        ShowHint = True
        TabOrder = 3
        Visible = False
        OnExit = ednBidExit
      end
    end
    object pnlName: TPanel
      Left = 0
      Top = 0
      Width = 526
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        526
        29)
      object lbl1: TLabel
        Left = 6
        Top = 7
        Width = 73
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      object edtNAME: TDBEditEh
        Left = 85
        Top = 4
        Width = 436
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'NAME'
        DataSource = srcCustFile
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' / '#1085#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnChange = edtNAMEChange
      end
    end
    object pnlTask: TPanel
      Left = 0
      Top = 418
      Width = 526
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 9
      Visible = False
      DesignSize = (
        526
        25)
      object lblBP1: TLabel
        Tag = 1
        Left = 6
        Top = 4
        Width = 37
        Height = 13
        Caption = #1047#1072#1076#1072#1095#1072
      end
      object edTskDate: TDBDateTimeEditEh
        Left = 85
        Top = 1
        Width = 103
        Height = 21
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1044#1072#1090#1072' '#1079#1072#1076#1072#1095#1080
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
      object edtTskName: TDBEditEh
        Left = 194
        Top = 1
        Width = 327
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1079#1072#1076#1072#1095#1080
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
    end
    object pnlPeriod: TPanel
      Left = 0
      Top = 393
      Width = 526
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 8
      Visible = False
      object lblPeriod: TLabel
        Tag = 1
        Left = 6
        Top = 4
        Width = 38
        Height = 13
        Caption = #1055#1077#1088#1080#1086#1076
      end
      object edPBegin: TDBDateTimeEditEh
        Left = 85
        Top = 1
        Width = 103
        Height = 21
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1053#1072#1095#1072#1083#1086
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnExit = edPBeginExit
      end
      object edPEnd: TDBDateTimeEditEh
        Left = 194
        Top = 1
        Width = 103
        Height = 21
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1054#1082#1086#1085#1095#1072#1085#1080#1077
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnExit = edPEndExit
      end
    end
    object pnlPayment: TPanel
      Left = 0
      Top = 317
      Width = 526
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 6
      Visible = False
      DesignSize = (
        526
        25)
      object lblBP2: TLabel
        Tag = 1
        Left = 6
        Top = 4
        Width = 39
        Height = 13
        Caption = #1055#1083#1072#1090#1077#1078
      end
      object lcbPayment: TDBLookupComboboxEh
        Left = 85
        Top = 1
        Width = 436
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        EditButtons = <>
        KeyField = 'PAYMENT_ID'
        ListField = 'INFO'
        ListSource = srcPayment
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnChange = lcbPaymentChange
        OnExit = lcbPaymentExit
      end
    end
    object pnlMaterials: TPanel
      Left = 0
      Top = 342
      Width = 526
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 13
      Visible = False
      DesignSize = (
        526
        26)
      object lblMat: TLabel
        Tag = 1
        Left = 6
        Top = 5
        Width = 50
        Height = 13
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083
      end
      object lcbMaterial: TDBLookupComboboxEh
        Left = 85
        Top = 2
        Width = 436
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        EditButtons = <>
        KeyField = 'COST'
        ListField = 'NAME'
        ListSource = srcMaterials
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnChange = lcbMaterialChange
        OnExit = lcbPaymentExit
      end
    end
  end
  object pnlTopFile: TPanel
    Left = 0
    Top = 33
    Width = 526
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      526
      28)
    object lblFileCh: TLabel
      Left = 6
      Top = 6
      Width = 26
      Height = 13
      Caption = #1060#1072#1081#1083
    end
    object edtFILE: TDBEditEh
      Left = 85
      Top = 3
      Width = 352
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'FILENAME'
      DataSource = srcCustFile
      DynProps = <>
      EditButtons = <
        item
          Hint = #1054#1090#1082#1088#1099#1090#1100' '#1092#1072#1081#1083' (Alt+Down)'
          Style = ebsEllipsisEh
          OnClick = edtFILEEditButtons0Click
        end
        item
          Glyph.Data = {
            E6010000424DE60100000000000036000000280000000C0000000C0000000100
            180000000000B0010000C30E0000C30E00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB88857D0BCA8FF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB6834EB1773DB9
            8A59FF00FFFF00FFFF00FFC8AB8DBF966DC09870CBB197FF00FFB6834EB2783D
            B78450FF00FFFF00FFD2C0AEB37C44B27A41BB8E60B98A59B2783DB1773DB177
            3DB88451FF00FFFF00FFFF00FFB27B42BE946AFF00FFFF00FFFF00FFFF00FFB7
            8552B1773DFF00FFFF00FFFF00FFC39F7BB6834EFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FFB1783DCCB399FF00FFFF00FFB88654C5A483FF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFB98A5AC19A73FF00FFFF00FFB78450C7A889FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFBB8E60C0986FFF00FFFF00FFBF976FBA8C5D
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB27A41C9AC8EFF00FFFF00FFD3C3
            B4B1773DC8AB8DFF00FFFF00FFFF00FFFF00FFBE946AB37B43FF00FFFF00FFFF
            00FFFF00FFC8AA8DB1773DBA8C5DC7A889C5A483B6834EB27A41D1BEAAFF00FF
            FF00FFFF00FFFF00FFFF00FFD2C1B0BD9368B47F48B5814CC19B74FF00FFFF00
            FFFF00FFFF00FFFF00FF}
          Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1072#1081#1083#1072' (F3)'
          ShortCut = 114
          Style = ebsGlyphEh
          OnClick = edtFILEEditButtons1Click
        end>
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1092#1072#1081#1083
      PopupMenu = pmFile
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnExit = edtFILEExit
    end
    object btnScaner: TButton
      Left = 443
      Top = 3
      Width = 78
      Height = 21
      Hint = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1092#1072#1081#1083' '#1080' '#1089#1086#1093#1088#1072#1085#1080#1090#1100
      Anchors = [akTop, akRight]
      Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 1
      OnClick = btnScanerClick
    end
  end
  object srcFileTypes: TDataSource
    AutoEdit = False
    DataSet = dsFileTypes
    Left = 108
    Top = 133
  end
  object dsFileTypes: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED, O_CHARFIELD, O_DI' +
        'MENSION'
      'FROM OBJECTS'
      'WHERE O_TYPE = 33 AND (:IsEdit = 1 or O_DELETED = 0)'
      'order BY O_NAME')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 42
    Top = 133
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 59
    Top = 344
  end
  object dsCustFile: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CUSTOMER_FILES'
      'SET '
      '    CF_ID = :CF_ID,'
      '    NAME = :NAME,'
      '    CF_TYPE = :CF_TYPE,'
      '    NOTICE = :NOTICE,'
      '    CUSTOMER_ID = :CUSTOMER_ID,'
      '    Filename = :Filename,'
      '    addons = :addons,'
      '    Content = :Content    '
      'WHERE'
      '    CF_ID = :OLD_CF_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CUSTOMER_FILES('
      '    CF_ID,'
      '    NAME,'
      '    CF_TYPE,'
      '    NOTICE,'
      '    CUSTOMER_ID,'
      '    Filename,'
      '    addons,'
      '    Content'
      ')'
      'VALUES('
      '    :CF_ID,'
      '    :NAME,'
      '    :CF_TYPE,'
      '    :NOTICE,'
      '    :CUSTOMER_ID,'
      '    :Filename,'
      '    :addons,    '
      '    :Content'
      ')')
    SelectSQL.Strings = (
      'select'
      '    T.O_NAME'
      '  , CF.Cf_Id'
      '  , cf.Name'
      '  , cf.Cf_Type'
      '  , cf.Notice'
      '  , cf.Customer_Id'
      '  , cf.Filename'
      '  , cf.CONTENT'
      '  , cf.addons'
      '  from CUSTOMER_FILES CF'
      
        '       inner join OBJECTS T on (CF.Cf_Type = T.O_ID and T.O_TYPE' +
        ' = 33)'
      '  where CF.CF_ID = :CF_ID'
      '  order by T.O_NAME, cf.Name')
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 252
    Top = 257
  end
  object srcCustFile: TDataSource
    AutoEdit = False
    DataSet = dsCustFile
    Left = 320
    Top = 257
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '*.*'
    Left = 440
    Top = 64
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write')
    TPBMode = tpbDefault
    Left = 473
    Top = 192
  end
  object PropStorageEh: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.Top'
      '<P>.Width')
    Left = 178
    Top = 15
  end
  object dsService: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    s.Service_Id'
      '  , s.Name'
      '  , ss.State_Sgn'
      '  from services s'
      
        '       left outer join Subscr_Serv ss on (ss.Serv_Id = s.Service' +
        '_Id and ss.Customer_Id = :customer_id)'
      '  where s.Srv_Type_Id = 0'
      '        and s.Business_Type = :srv_type'
      '        and ((s.Service_Id = :Srv) or (:Srv = -999) )'
      '        and ('
      '          ('
      '            (:STATE = 0)'
      '            and (ss.State_Sgn = 1)'
      '          )'
      '          or'
      '          ('
      '            (:STATE = 1)'
      '            and (coalesce(ss.State_Sgn, 0) = 0)'
      '            and ('
      '              (:Srv <> -999)'
      '              or exists(select'
      '                       sl.Link_Id'
      '                     from SERVICES_LINKS sl'
      '                     where sl.LINK_TYPE = 0'
      '                           and S.SERVICE_ID = sl.CHILD)'
      '                 '
      '            )          '
      '          )'
      '        )'
      '  order by s.NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 46
    Top = 19
  end
  object srcService: TDataSource
    DataSet = dsService
    Left = 110
    Top = 19
  end
  object dsOnOffService: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct'
      '    ID'
      '  , DESCRIPTION'
      '  , SERVICE_TYPE'
      '  , o.Name || coalesce('#39' / '#39' ||'
      '    case o.SERVICE_TYPE'
      '      when 2 then null'
      '      else (select'
      
        '                iif((coalesce(t.Tarif_Sum, 0) = coalesce(t.TARIF' +
        '_SUM_JUR, 0)), coalesce(t.Tarif_Sum, 0), coalesce(t.Tarif_Sum, 0' +
        ') || '#39'/'#39' || coalesce(t.TARIF_SUM_JUR, 0))'
      '              from tarif t'
      '              where t.Service_Id = o.ID'
      
        '                    and current_date between t.Date_From and t.D' +
        'ate_To)'
      ''
      '    end, '#39#39') Name'
      '  from (select'
      '            ID'
      '          , SERVICE_TYPE'
      '          , Name'
      '          , DESCRIPTION'
      
        '          from selectonoffservice(:customer_id, :service_id, :su' +
        'bscr_serv_id, :off) s'
      '        union all'
      '        select'
      '            r.Service_Id ID'
      '          , r.Srv_Type_Id SERVICE_TYPE'
      '          , r.Name NAME'
      '          , r.Description'
      '          from services r'
      '          where r.Service_Id = :onoffsrv) o'
      'where @@add_filter%1=1@'
      ''
      '    ')
    Transaction = trRead
    Database = dmMain.dbTV
    DataSource = srcService
    Left = 41
    Top = 81
  end
  object srcOnOffService: TDataSource
    DataSet = dsOnOffService
    Left = 112
    Top = 81
  end
  object Query: TpFIBQuery
    Transaction = trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select'
      '    C.ACCOUNT_NO, C.SURNAME, C.FIRSTNAME, '
      '    C.MIDLENAME, C.CUST_CODE, '
      '    C.CUST_STATE_DESCR, C.DEBT_SUM, '
      '    C.DOGOVOR_NO, f.Porch_N, f.Floor_N'
      '  from house h'
      
        '       left outer join customer c on (c.House_Id = h.House_Id an' +
        'd c.Flat_No = :flat_no)'
      
        '       left outer join HOUSEFLATS f on (f.House_Id = h.House_Id ' +
        'and f.Flat_No = :flat_no)'
      '  where h.House_Id=:house_id   ')
    Left = 36
    Top = 190
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
    Left = 258
    Top = 18
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 306
    Top = 18
  end
  object dsHomes: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    H.HOUSE_ID'
      '  , H.STREET_ID'
      '  , H.HOUSE_NO'
      '  , sa.Subarea_Name'
      'from HOUSE H'
      '  left outer join Subarea sa on (sa.Subarea_Id = h.Subarea_Id)'
      'where h.street_id = :street_id'
      'order by h.HOUSE_NO')
    Transaction = trRead
    Database = dmMain.dbTV
    DataSource = srcStreet
    Left = 258
    Top = 61
  end
  object srcHouse: TDataSource
    DataSet = dsHomes
    Left = 306
    Top = 61
  end
  object dsFLAT: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct'
      '    iif(FLAT_NO <> '#39#39', FLAT_NO, '#39'-'#39') FLAT_NO'
      '  , FLAT_DIGIT'
      'from CUSTOMER C'
      'where c.HOUSE_ID = :HOUSE_id'
      'order by 1 ')
    Transaction = trRead
    Database = dmMain.dbTV
    DataSource = srcHouse
    Left = 258
    Top = 124
  end
  object srcFLAT: TDataSource
    DataSet = dsFLAT
    Left = 306
    Top = 124
  end
  object pmFile: TPopupMenu
    Left = 392
    Top = 304
    object miFileClear: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1086#1083#1077' '#1092#1072#1081#1083
      OnClick = miFileClearClick
    end
  end
  object trWriteQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      '')
    TPBMode = tpbDefault
    Left = 401
    Top = 128
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
    Left = 400
    Top = 184
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
    Left = 472
    Top = 134
  end
  object dsPayment: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    p.Payment_Id'
      '  , p.Pay_Sum'
      '  , p.Fine_Sum'
      
        '  , '#39#1057#1091#1084#1084#1072' - '#39' || FORMAT_CURRENCY(p.Pay_Sum, '#39'.'#39', '#39','#39') || '#39#1088#1091#1073'.'#39 +
        ' || iif(coalesce(p.Fine_Sum, 0) <> 0, '#39' '#1055#1077#1085#1103' - '#39' || FORMAT_CURRE' +
        'NCY(p.Fine_Sum, '#39'.'#39', '#39','#39') || '#39#1088#1091#1073'.'#39', '#39#39') Info'
      '  from payment p'
      '       inner join customer c on (p.Customer_Id = c.Customer_Id)'
      
        '       left outer join services s on (s.Service_Id = p.Payment_S' +
        'rv)'
      '  where p.Pay_Date = current_date'
      
        '        and (((p.Added_By = current_user) and (p.CUSTOMER_ID = :' +
        'CID)) '
      '          or (current_user = '#39'SYSDBA'#39'))'
      '  order by info')
    Transaction = trRead
    Database = dmMain.dbTV
    DataSource = srcHouse
    Left = 354
    Top = 428
  end
  object srcPayment: TDataSource
    DataSet = dsPayment
    Left = 354
    Top = 476
  end
  object dsServiceFrom: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    s.Service_Id'
      '  , s.Name'
      '  , ss.State_Sgn'
      '  from services s'
      
        '       left outer join Subscr_Serv ss on (ss.Serv_Id = s.Service' +
        '_Id and ss.Customer_Id = :customer_id)'
      '  where s.Srv_Type_Id = 0'
      '        and s.Business_Type = :srv_type'
      '        and ((s.Service_Id = :Srv) or (:Srv = -999) )'
      '        and ('
      '          ('
      '            (:STATE = 0)'
      '            and (ss.State_Sgn = 1)'
      '          )'
      '          or'
      '          ('
      '            (:STATE = 1)'
      '            and (coalesce(ss.State_Sgn, 0) = 0)'
      '            and ('
      '              (:Srv <> -999)'
      '              or exists(select'
      '                       sl.Link_Id'
      '                     from SERVICES_LINKS sl'
      '                     where sl.LINK_TYPE = 0'
      '                           and S.SERVICE_ID = sl.CHILD)'
      '                 '
      '            )          '
      '          )'
      '        )'
      '  order by s.NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 30
    Top = 403
  end
  object srcServiceFrom: TDataSource
    DataSet = dsServiceFrom
    Left = 22
    Top = 355
  end
  object dsMaterials: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    a.Name'
      '    , a.Cost'
      '  from Appliance a'
      '  where a.OWN_ID = :CID'
      '        and a.OWN_TYPE = 1 -- '#1040#1073#1086#1085#1077#1085#1090
      '        and a.Property = 2 -- '#1040#1073#1086#1085#1077#1085#1090#1072' ('#1056#1072#1089#1089#1088#1086#1095#1082#1072')'
      '  order by a.Name')
    Transaction = trRead
    Database = dmMain.dbTV
    DataSource = srcHouse
    Left = 450
    Top = 428
  end
  object srcMaterials: TDataSource
    DataSet = dsMaterials
    Left = 450
    Top = 476
  end
end
