object EditCFileForm: TEditCFileForm
  Left = 540
  Top = 390
  ActiveControl = dbluFileType
  BorderIcons = [biSystemMenu]
  Caption = #1060#1072#1081#1083' '#1072#1073#1086#1085#1077#1085#1090#1072
  ClientHeight = 556
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
      DropDownBox.ListSource = srcFiles
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      EmptyDataInfo.Text = #1058#1080#1087' '#1092#1072#1081#1083#1072
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcFiles
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnChange = dbluFileTypeChange
      OnExit = dbluFileTypeExit
    end
  end
  object pnlBtm: TPanel
    Left = 0
    Top = 522
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
    Height = 461
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object pnlNotice: TPanel
      Left = 0
      Top = 394
      Width = 526
      Height = 67
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 9
      object memNotice: TDBMemoEh
        AlignWithMargins = True
        Left = 5
        Top = 0
        Width = 516
        Height = 67
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
        TabOrder = 0
        Visible = True
        WantReturns = True
      end
    end
    object pnlText: TPanel
      Left = 0
      Top = 368
      Width = 526
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 8
      Visible = False
      DesignSize = (
        526
        26)
      object lblText: TLabel
        Tag = 1
        Left = 5
        Top = 4
        Width = 56
        Height = 13
        Caption = #1044#1086#1087'. '#1090#1077#1082#1089#1090
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
    end
    object pnlMobile: TPanel
      Left = 0
      Top = 342
      Width = 526
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 7
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
        Width = 180
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
        Left = 328
        Top = 2
        Width = 193
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
        Left = 271
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
      Top = 203
      Width = 526
      Height = 114
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 5
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
        EmptyDataInfo.Text = #1040#1076#1088#1077#1089' '#1087#1088#1086#1087#1080#1089#1082#1080' ('#1077#1089#1083#1080' '#1086#1090#1083#1080#1095#1072#1077#1090#1089#1103' '#1086#1090' '#1072#1076#1088#1077#1089#1072' '#1091#1089#1090#1072#1085#1086#1074#1082#1080')'
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
        OnClick = btnOcrClick
      end
    end
    object pnlSrv: TPanel
      Left = 0
      Top = 148
      Width = 526
      Height = 55
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
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
        Width = 121
        Height = 21
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnChange = edDateChange
      end
      object lcbService: TDBLookupComboboxEh
        Left = 85
        Top = 4
        Width = 436
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        EditButtons = <>
        KeyField = 'SERVICE_ID'
        ListField = 'NAME'
        ListSource = srcService
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnChange = lcbServiceChange
      end
      object lcbOnOffSrv: TDBLookupComboboxEh
        Left = 212
        Top = 31
        Width = 309
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'NAME'
        ListSource = srcOnOffService
        ShowHint = True
        TabOrder = 2
        Visible = True
        OnChange = lcbOnOffSrvChange
      end
    end
    object pnlContract: TPanel
      Left = 0
      Top = 95
      Width = 526
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      DesignSize = (
        526
        27)
      object lblContr: TLabel
        Left = 386
        Top = 6
        Width = 12
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1086#1090
        Visible = False
        ExplicitLeft = 332
      end
      object edtContractDate: TDBDateTimeEditEh
        Left = 404
        Top = 3
        Width = 117
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
        Width = 168
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
      Top = 122
      Width = 526
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
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
      Top = 317
      Width = 526
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 6
      Visible = False
      object lblBP: TLabel
        Tag = 1
        Left = 6
        Top = 5
        Width = 36
        Height = 13
        Caption = #1047#1072#1103#1074#1082#1072
      end
      object ednBid: TDBNumberEditEh
        Left = 51
        Top = 1
        Width = 94
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
        Left = 194
        Top = 1
        Width = 94
        Height = 21
        DynProps = <>
        EmptyDataInfo.Text = #1057#1091#1084#1084#1072' '#1087#1086' '#1079#1072#1103#1074#1082#1077
        EditButtons = <>
        ShowHint = True
        TabOrder = 1
        Visible = False
        OnExit = ednBidExit
      end
      object ednSrvSum: TDBNumberEditEh
        Left = 309
        Top = 1
        Width = 94
        Height = 21
        DynProps = <>
        EmptyDataInfo.Text = #1057#1091#1084#1084#1072' '#1087#1086' '#1091#1089#1083#1091#1075#1077
        EditButtons = <>
        ShowHint = True
        TabOrder = 2
        Visible = False
        OnExit = ednBidExit
      end
      object ednFineSum: TDBNumberEditEh
        Left = 427
        Top = 1
        Width = 94
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
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      Visible = True
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
  object srcFiles: TDataSource
    AutoEdit = False
    DataSet = dsFiles
    Left = 108
    Top = 132
  end
  object dsFiles: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED, O_CHARFIELD'
      'FROM OBJECTS'
      'WHERE O_TYPE = 33 AND O_DELETED = 0'
      'order BY O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 42
    Top = 130
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 83
    Top = 304
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
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 180
    Top = 73
  end
  object srcCustFile: TDataSource
    AutoEdit = False
    DataSet = dsCustFile
    Left = 32
    Top = 289
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
    Left = 97
    Top = 184
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
      '       inner join SERVICES_LINKS sl on (S.SERVICE_ID = sl.CHILD)'
      
        '       left outer join Subscr_Serv ss on (ss.Serv_Id = s.Service' +
        '_Id and'
      '             ss.Customer_Id = :customer_id)'
      '  where sl.LINK_TYPE = 0'
      '        and s.Srv_Type_Id = 0'
      '        and s.Business_Type = :srv_type'
      '        and ('
      '          ((:STATE = 0) and (ss.State_Sgn = 1))'
      '          or'
      '          ((:STATE = 1) and (coalesce(ss.State_Sgn, 0) = 0))'
      '        )'
      '  order by s.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 46
    Top = 27
  end
  object srcService: TDataSource
    DataSet = dsService
    Left = 110
    Top = 29
  end
  object dsOnOffService: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    ID, DESCRIPTION, SERVICE_TYPE, s.Name || coalesce('#39' / '#39' ||'
      '    case s.SERVICE_TYPE'
      '      when 2 then null'
      '      else (select'
      
        '                iif((coalesce(t.Tarif_Sum, 0) = coalesce(t.TARIF' +
        '_SUM_JUR, 0)), coalesce(t.Tarif_Sum, 0), coalesce(t.Tarif_Sum, 0' +
        ') || '#39'/'#39' || coalesce(t.TARIF_SUM_JUR, 0))'
      '              from tarif t'
      '              where t.Service_Id = s.ID'
      
        '                    and current_date between t.Date_From and t.D' +
        'ate_To)'
      ''
      '    end, '#39#39') Name'
      
        '  from selectonoffservice(:customer_id, :service_id, :subscr_ser' +
        'v_id, :off) s')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcService
    Left = 41
    Top = 81
  end
  object srcOnOffService: TDataSource
    DataSet = dsOnOffService
    Left = 112
    Top = 82
  end
  object Query: TpFIBQuery
    Transaction = dmMain.trReadQ
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
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 258
    Top = 18
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 282
    Top = 19
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
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcStreet
    Left = 258
    Top = 71
  end
  object srcHouse: TDataSource
    DataSet = dsHomes
    Left = 290
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
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcHouse
    Left = 258
    Top = 125
  end
  object srcFLAT: TDataSource
    DataSet = dsFLAT
    Left = 290
    Top = 124
  end
end
