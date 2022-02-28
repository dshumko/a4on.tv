object apgCustomerNew: TapgCustomerNew
  Left = 0
  Top = 0
  Caption = #1053#1086#1074#1099#1081' '#1072#1073#1086#1085#1077#1085#1090
  ClientHeight = 706
  ClientWidth = 879
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlInfo: TPanel
    Left = 0
    Top = 0
    Width = 497
    Height = 665
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 497
      Height = 129
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object Label19: TLabel
        Left = 236
        Top = 85
        Width = 92
        Height = 13
        Caption = #1044#1086#1075#1086#1074#1086#1088' '#1089#1086#1089#1090#1072#1074#1080#1083
      end
      object lblAccount: TLabel
        Left = 138
        Top = 45
        Width = 78
        Height = 13
        Caption = #8470' '#1083#1080#1094'. '#1089#1095#1077#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 138
        Top = 85
        Width = 59
        Height = 13
        Caption = #1044#1086#1075#1086#1074#1086#1088' '#1076#1086
      end
      object Label10: TLabel
        Left = 8
        Top = 85
        Width = 77
        Height = 13
        Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
      end
      object Label6: TLabel
        Left = 8
        Top = 5
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
      object Label1: TLabel
        Left = 236
        Top = 5
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
      object Label8: TLabel
        Left = 331
        Top = 5
        Width = 29
        Height = 13
        Caption = #1050#1074'-'#1088#1072
      end
      object Label21: TLabel
        Left = 386
        Top = 5
        Width = 45
        Height = 13
        Caption = #1055#1086#1076#1098#1077#1079#1076
      end
      object Label23: TLabel
        Left = 439
        Top = 5
        Width = 27
        Height = 13
        Caption = #1069#1090#1072#1078
      end
      object lblContract: TLabel
        Left = 236
        Top = 45
        Width = 43
        Height = 13
        Caption = #1044#1086#1075#1086#1074#1086#1088
      end
      object chkJURIDICAL: TDBCheckBoxEh
        Left = 386
        Top = 103
        Width = 98
        Height = 17
        Hint = #1045#1089#1083#1080' '#1102#1088'. '#1083#1080#1094#1086' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1092#1083#1086#1078#1086#1082
        Alignment = taLeftJustify
        Caption = #1070#1088'. '#1083#1080#1094#1086
        DataField = 'JURIDICAL'
        DataSource = ds
        DynProps = <>
        TabOrder = 12
        OnClick = chkJURIDICALClick
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object luCreator: TDBLookupComboboxEh
        Left = 236
        Top = 101
        Width = 144
        Height = 21
        DynProps = <>
        DataField = 'MANAGER_ID'
        DataSource = ds
        EmptyDataInfo.Text = #1044#1086#1075#1086#1074#1086#1088' '#1089#1086#1089#1090#1072#1074#1080#1083
        EditButtons = <>
        KeyField = 'WORKER_ID'
        ListField = 'FIO'
        ListSource = srcExecutor
        ShowHint = True
        TabOrder = 11
        Visible = True
      end
      object deDogovor: TDBEditEh
        Tag = 4
        Left = 236
        Top = 59
        Width = 144
        Height = 21
        DataField = 'DOGOVOR_NO'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #8470' '#1076#1086#1075#1086#1074#1086#1088#1072
        ShowHint = True
        TabOrder = 7
        Visible = True
      end
      object eACCOUNT_NO: TDBEditEh
        Left = 138
        Top = 59
        Width = 92
        Height = 21
        DataField = 'ACCOUNT_NO'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1051#1080#1094#1077#1074#1086#1081
        ShowHint = True
        TabOrder = 6
        Visible = True
        OnChange = eACCOUNT_NOChange
        OnEnter = eACCOUNT_NOEnter
        OnExit = eACCOUNT_NOExit
      end
      object eValid_to: TDBDateTimeEditEh
        Left = 138
        Top = 101
        Width = 92
        Height = 21
        TabStop = False
        DataField = 'VALID_TO'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 10
        Visible = True
      end
      object eCONTRACT_DATE: TDBDateTimeEditEh
        Left = 8
        Top = 101
        Width = 124
        Height = 21
        DataField = 'CONTRACT_DATE'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 9
        Visible = True
        OnExit = eCONTRACT_DATEExit
      end
      object btnGetDogNumber: TButton
        Left = 8
        Top = 59
        Width = 124
        Height = 21
        Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1084#1077#1088
        TabOrder = 5
        TabStop = False
        OnClick = btnGetDogNumberClick
      end
      object LupStreets: TDBLookupComboboxEh
        Left = 8
        Top = 20
        Width = 222
        Height = 21
        DynProps = <>
        DataField = 'STREET_ID'
        DataSource = ds
        DropDownBox.Columns = <
          item
            FieldName = 'STREET_NAME'
            Title.Caption = #1059#1083#1080#1094#1072
          end
          item
            FieldName = 'AREA_NAME'
            Title.Caption = #1043#1086#1088#1086#1076
          end>
        DropDownBox.AutoDrop = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1059#1083#1080#1094#1072' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
        EditButtons = <
          item
            Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1091#1083#1080#1094#1091
            ShortCut = 16467
            Style = ebsPlusEh
            OnClick = LupStreetsEditButtons0Click
          end>
        KeyField = 'STREET_ID'
        ListField = 'STREET_NAME'
        ListSource = srcStreet
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnChange = LupStreetsChange
        OnEnter = eACCOUNT_NOEnter
      end
      object LupHOUSE_ID: TDBLookupComboboxEh
        Left = 236
        Top = 20
        Width = 89
        Height = 21
        DynProps = <>
        DataField = 'HOUSE_ID'
        DataSource = ds
        EmptyDataInfo.Text = #1044#1086#1084
        EditButtons = <
          item
            Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1076#1086#1084
            ShortCut = 16456
            Style = ebsPlusEh
            OnClick = LupHOUSE_IDEditButtons0Click
          end>
        KeyField = 'HOUSE_ID'
        ListField = 'HOUSE_NO'
        ListSource = srcHouse
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnChange = LupHOUSE_IDChange
        OnEnter = eACCOUNT_NOEnter
      end
      object eFLAT_NO: TDBEditEh
        Tag = 7
        Left = 329
        Top = 20
        Width = 51
        Height = 21
        Hint = #1050#1074#1072#1088#1090#1080#1088#1072
        DataField = 'FLAT_NO'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1050#1074#1072#1088#1090#1080#1088#1072
        ShowHint = True
        TabOrder = 2
        Visible = True
        OnExit = eFLAT_NOExit
      end
      object edPORCH: TDBEditEh
        Tag = 7
        Left = 386
        Top = 20
        Width = 47
        Height = 21
        Hint = #1055#1086#1076#1098#1077#1079#1076
        DataField = 'PORCH_N'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1087#1086#1076#1098#1077#1079#1076
        ShowHint = True
        TabOrder = 3
        Visible = True
      end
      object edFLOOR: TDBEditEh
        Tag = 7
        Left = 439
        Top = 20
        Width = 45
        Height = 21
        Hint = #1069#1090#1072#1078
        DataField = 'FLOOR_N'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1101#1090#1072#1078
        ShowHint = True
        TabOrder = 4
        Visible = True
      end
      object chkHAND: TDBCheckBoxEh
        Left = 386
        Top = 61
        Width = 98
        Height = 17
        Hint = 
          #1045#1089#1083#1080' '#1092#1083#1072#1078#1086#1082' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085', '#1090#1086' '#1072#1073#1086#1085#1077#1085#1090' '#1085#1077' '#1073#1091#1076#1077#1090' '#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100#1089#1103' '#1072#1074#1090#1086#1084#1072 +
          #1090#1080#1095#1077#1089#1082#1080
        Alignment = taLeftJustify
        Caption = #1056#1091#1095#1085#1086#1077' '#1091#1087#1088'.'
        DataField = 'HAND_CONTROL'
        DataSource = ds
        DynProps = <>
        TabOrder = 8
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object pnlFIZ: TPanel
      Left = 0
      Top = 129
      Width = 497
      Height = 191
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object Label3: TLabel
        Tag = 1
        Left = 8
        Top = 3
        Width = 44
        Height = 13
        Caption = #1060#1072#1084#1080#1083#1080#1103
      end
      object Label13: TLabel
        Tag = 1
        Left = 8
        Top = 40
        Width = 75
        Height = 13
        Caption = #1055#1072#1089#1087#1086#1088#1090' '#1085#1086#1084#1077#1088
      end
      object lbl2: TLabel
        Tag = 1
        Left = 8
        Top = 77
        Width = 80
        Height = 13
        Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      end
      object lbl3: TLabel
        Tag = 1
        Left = 8
        Top = 113
        Width = 81
        Height = 13
        Caption = #1040#1076#1088#1077#1089' '#1087#1088#1086#1087#1080#1089#1082#1080
      end
      object Label12: TLabel
        Tag = 1
        Left = 138
        Top = 40
        Width = 78
        Height = 13
        Caption = #1055#1072#1089#1087#1086#1088#1090' '#1074#1099#1076#1072#1085
      end
      object Label4: TLabel
        Tag = 1
        Left = 169
        Top = 3
        Width = 19
        Height = 13
        Caption = #1048#1084#1103
      end
      object Label9: TLabel
        Tag = 1
        Left = 329
        Top = 3
        Width = 49
        Height = 13
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      end
      object Label5: TLabel
        Tag = 1
        Left = 138
        Top = 77
        Width = 72
        Height = 13
        Caption = #1051#1080#1095#1085#1099#1081' '#1085#1086#1084#1077#1088
      end
      object lbl9: TLabel
        Tag = 1
        Left = 8
        Top = 150
        Width = 85
        Height = 13
        Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
      end
      object eSURNAME: TDBEditEh
        Left = 8
        Top = 17
        Width = 155
        Height = 21
        DataField = 'SURNAME'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1060#1072#1084#1080#1083#1080#1103
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnExit = eSURNAMEExit
      end
      object edtPASSPORT_NUMBER: TDBEditEh
        Tag = 1
        Left = 8
        Top = 55
        Width = 124
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PASSPORT_NUMBER'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1087#1072#1089#1087#1086#1088#1090#1072
        ShowHint = True
        TabOrder = 3
        Visible = True
        OnEnter = edtPASSPORT_NUMBEREnter
        OnExit = edtPASSPORT_NUMBERExit
      end
      object edtBIRTHDAY: TDBDateTimeEditEh
        Tag = 1
        Left = 8
        Top = 91
        Width = 124
        Height = 21
        DataField = 'BIRTHDAY'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 5
        Visible = True
      end
      object edtADRES_REGISTR: TDBEditEh
        Tag = 1
        Left = 8
        Top = 129
        Width = 476
        Height = 21
        DataField = 'ADRES_REGISTR'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1040#1076#1088#1077#1089' '#1087#1088#1086#1087#1080#1089#1082#1080' ('#1077#1089#1083#1080' '#1086#1090#1083#1080#1095#1072#1077#1090#1089#1103' '#1086#1090' '#1072#1076#1088#1077#1089#1072' '#1091#1089#1090#1072#1085#1086#1074#1082#1080')'
        ShowHint = True
        TabOrder = 7
        Visible = True
      end
      object edRegistration: TDBEditEh
        Tag = 1
        Left = 138
        Top = 55
        Width = 346
        Height = 21
        DataField = 'PASSPORT_REGISTRATION'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1050#1077#1084' '#1074#1099#1076#1072#1085' '#1080' '#1076#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
        ShowHint = True
        TabOrder = 4
        Visible = True
      end
      object eFIRSTNAME: TDBEditEh
        Tag = 1
        Left = 169
        Top = 17
        Width = 155
        Height = 21
        DataField = 'FIRSTNAME'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1048#1084#1103
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnExit = eSURNAMEExit
      end
      object eMIDLENAME: TDBEditEh
        Tag = 1
        Left = 329
        Top = 17
        Width = 155
        Height = 21
        DataField = 'MIDLENAME'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1054#1090#1095#1077#1089#1090#1074#1086
        ShowHint = True
        TabOrder = 2
        Visible = True
        OnExit = eSURNAMEExit
      end
      object edtPERSONAL_N: TDBEditEh
        Tag = 1
        Left = 138
        Top = 91
        Width = 346
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PERSONAL_N'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1051#1080#1095#1085#1099#1081' '#1085#1086#1084#1077#1088
        ShowHint = True
        TabOrder = 6
        Visible = True
        OnEnter = edtPERSONAL_NEnter
        OnExit = edtPERSONAL_NExit
      end
      object edtPlaceBirth: TDBEditEh
        Tag = 1
        Left = 8
        Top = 166
        Width = 476
        Height = 21
        DataField = 'CONTRACT_BASIS'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
        ShowHint = True
        TabOrder = 8
        Visible = True
      end
    end
    object pnlJUR: TPanel
      Left = 0
      Top = 320
      Width = 497
      Height = 216
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      Visible = False
      DesignSize = (
        497
        216)
      object Label18: TLabel
        Tag = 2
        Left = 8
        Top = 1
        Width = 73
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      object lblINN: TLabel
        Tag = 2
        Left = 263
        Top = 1
        Width = 21
        Height = 13
        Caption = #1059#1053#1053
      end
      object Label17: TLabel
        Tag = 2
        Left = 236
        Top = 38
        Width = 53
        Height = 13
        Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088
      end
      object lbl4: TLabel
        Tag = 1
        Left = 8
        Top = 74
        Width = 53
        Height = 13
        Caption = #1070#1088'. '#1072#1076#1088#1077#1089
      end
      object lblVAT: TLabel
        Left = 386
        Top = 1
        Width = 61
        Height = 13
        Caption = #1043#1088#1091#1087#1087#1072' '#1053#1044#1057
      end
      object Label16: TLabel
        Tag = 2
        Left = 8
        Top = 38
        Width = 50
        Height = 13
        Caption = #1044#1080#1088#1077#1082#1090#1086#1088
      end
      object lbl8: TLabel
        Tag = 2
        Left = 7
        Top = 173
        Width = 159
        Height = 13
        Caption = #1044#1086#1075#1086#1074#1086#1088' '#1074' '#1083#1080#1094#1077' '#1080' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1077
      end
      object Label14: TLabel
        Tag = 2
        Left = 204
        Top = 1
        Width = 32
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1060#1086#1088#1084#1072
      end
      object lbl1: TLabel
        Tag = 2
        Left = 8
        Top = 149
        Width = 33
        Height = 13
        Caption = #1056'/'#1089#1095#1077#1090
      end
      object Label15: TLabel
        Tag = 2
        Left = 8
        Top = 122
        Width = 24
        Height = 13
        Caption = #1041#1072#1085#1082
      end
      object edSURNAME: TDBEditEh
        Left = 8
        Top = 15
        Width = 191
        Height = 21
        DataField = 'SURNAME'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
      object eJURINN: TDBEditEh
        Tag = 2
        Left = 263
        Top = 15
        Width = 117
        Height = 21
        DataField = 'JUR_INN'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1056#1077#1082#1074#1080#1079#1080#1090#1099
        ShowHint = True
        TabOrder = 2
        Visible = True
      end
      object eBUH: TDBEditEh
        Tag = 2
        Left = 236
        Top = 52
        Width = 248
        Height = 21
        DataField = 'JUR_BUH'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1041#1091#1093#1075#1072#1083#1090#1077#1088
        ShowHint = True
        TabOrder = 5
        Visible = True
      end
      object ed1: TDBEditEh
        Tag = 1
        Left = 7
        Top = 90
        Width = 477
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ADRES_REGISTR'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1040#1076#1088#1077#1089
        ShowHint = True
        TabOrder = 6
        Visible = True
      end
      object cbbVATG: TDBLookupComboboxEh
        Left = 386
        Top = 15
        Width = 98
        Height = 21
        DynProps = <>
        DataField = 'VATG_ID'
        DataSource = ds
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'O_ID'
        ListField = 'O_NAME'
        ListSource = srcVATG
        ShowHint = True
        TabOrder = 3
        Visible = True
      end
      object eDIRECTOR: TDBEditEh
        Tag = 2
        Left = 8
        Top = 52
        Width = 222
        Height = 21
        DataField = 'JUR_DIRECTOR'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1044#1080#1088#1077#1082#1090#1086#1088
        ShowHint = True
        TabOrder = 4
        Visible = True
      end
      object edtCONTRACT_BASIS: TDBEditEh
        Tag = 2
        Left = 7
        Top = 189
        Width = 477
        Height = 21
        DataField = 'CONTRACT_BASIS'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1076#1080#1088#1077#1082#1090#1086#1088#1072' '#1060#1048#1054', '#1076#1077#1081#1089#1090#1074#1091#1102#1097#1077#1075#1086' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080' '#1059#1089#1090#1072#1074#1072
        ShowHint = True
        TabOrder = 9
        Visible = True
      end
      object edtTO: TDBEditEh
        Tag = 1
        Left = 205
        Top = 15
        Width = 53
        Height = 21
        Anchors = [akTop, akRight]
        DataField = 'FIRSTNAME'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1054#1054#1054', '#1048#1055
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object edtBANK_ACCOUNT: TDBEditEh
        Tag = 2
        Left = 47
        Top = 146
        Width = 437
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BANK_ACCOUNT'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1056#1072#1089#1095#1077#1090#1085#1099#1081' '#1089#1095#1077#1090
        ShowHint = True
        TabOrder = 8
        Visible = True
        OnExit = edtBANK_ACCOUNTExit
      end
      object lcbBANK: TDBLookupComboboxEh
        Left = 47
        Top = 119
        Width = 437
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'BANK_ID'
        DataSource = ds
        DropDownBox.AutoFitColWidths = False
        DropDownBox.ListSource = srcBanks
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterType = lsftContainsEh
        DropDownBox.AutoDrop = True
        EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1073#1072#1085#1082' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
        EditButtons = <>
        KeyField = 'O_ID'
        ListField = 'BANK'
        ListSource = srcBanks
        ShowHint = True
        Style = csDropDownEh
        TabOrder = 7
        Visible = True
        OnExit = lcbBANKExit
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 536
      Width = 497
      Height = 101
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 3
      DesignSize = (
        497
        101)
      object lblOrg: TLabel
        Left = 8
        Top = 7
        Width = 96
        Height = 13
        Caption = #1054#1073#1089#1083'. '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      end
      object Label7: TLabel
        Left = 8
        Top = 31
        Width = 63
        Height = 13
        Caption = #1055#1072#1088#1086#1083#1100' '#1082' '#1051#1050
      end
      object btn1: TSpeedButton
        Left = 79
        Top = 28
        Width = 21
        Height = 21
        Hint = #1057#1075#1077#1085#1077#1088#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
        Anchors = [akTop, akRight]
        Caption = '*'
        Flat = True
        OnClick = btn1Click
      end
      object Label11: TLabel
        Left = 7
        Top = 55
        Width = 58
        Height = 13
        Caption = #1042#1085#1077#1096#1085#1080#1081' ID'
      end
      object dbchkHiden: TDBCheckBox
        Left = 7
        Top = 82
        Width = 113
        Height = 12
        Alignment = taLeftJustify
        BiDiMode = bdLeftToRight
        Caption = #1101#1090#1086' '#1076#1088#1091#1075'!'
        DataField = 'INVISIBLE'
        DataSource = ds
        ParentBiDiMode = False
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object Button1: TButton
        Left = 236
        Top = 76
        Width = 120
        Height = 25
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1092#1086#1085' '#1076#1083#1103' '#1074#1099#1076#1077#1083#1077#1085#1080#1103' '#1072#1073#1086#1085#1077#1085#1090#1072
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1086#1085
        TabOrder = 1
        TabStop = False
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 364
        Top = 76
        Width = 120
        Height = 25
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1086#1085' '#1076#1083#1103' '#1074#1099#1076#1077#1083#1077#1085#1080#1103' '#1072#1073#1086#1085#1077#1085#1090#1072
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1086#1085
        TabOrder = 2
        TabStop = False
        OnClick = Button2Click
      end
      object cbbORG_ID: TDBLookupComboboxEh
        Left = 107
        Top = 4
        Width = 377
        Height = 21
        DynProps = <>
        DataField = 'ORG_ID'
        DataSource = ds
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1054#1073#1089#1083#1091#1097#1080#1074#1072#1102#1097#1072#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
        EditButtons = <>
        KeyField = 'ORG_ID'
        ListField = 'ORG_NAME'
        ListSource = srcOrg
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
      object edtSecret: TDBEditEh
        Left = 107
        Top = 28
        Width = 377
        Height = 21
        DataField = 'SECRET'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1087#1072#1088#1086#1083#1100' '#1082' '#1083#1080#1095#1085#1086#1084#1091' '#1082#1072#1073#1080#1085#1077#1090#1091
        ShowHint = True
        TabOrder = 3
        Visible = True
      end
      object DBEditEh1: TDBEditEh
        Left = 107
        Top = 52
        Width = 377
        Height = 21
        DataField = 'EXTERNAL_ID'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = 'ID '#1074#1085#1077#1096#1085#1077#1081' '#1089#1080#1089#1090#1077#1084#1099
        ShowHint = True
        TabOrder = 4
        Visible = True
      end
    end
  end
  object pnl1: TPanel
    Left = 497
    Top = 0
    Width = 382
    Height = 665
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlContacts: TPanel
      Left = 0
      Top = 186
      Width = 382
      Height = 479
      Align = alClient
      BevelOuter = bvNone
      Color = clWhite
      TabOrder = 1
      object lbl5: TLabel
        Left = 0
        Top = 0
        Width = 382
        Height = 18
        Align = alTop
        AutoSize = False
        Caption = #1050#1086#1085#1090#1072#1082#1090#1099' ('#1090#1077#1083#1077#1092#1086#1085#1099', email ...)'
        Color = clBtnFace
        ParentColor = False
      end
      object btnCAdd: TSpeedButton
        Left = 171
        Top = 0
        Width = 18
        Height = 18
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF89AD5689
          AD5689AD5689AD56FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF89AD5689AD5689AD5689AD56FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF89AD5689
          AD5689AD5689AD56FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF89AD5689AD5689AD5689AD56FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF89AD5689
          AD5689AD5689AD56FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8BAE5A
          89AD5689AD5689AD5689AD5689AD5689AD5689AD5689AD5689AD5689AD5689AD
          5689AD5689AD56FF00FFFF00FF8BAE5A89AD5689AD5689AD5689AD5689AD5689
          AD5689AD5689AD5689AD5689AD5689AD5689AD5689AD56FF00FFFF00FF8BAE5A
          89AD5689AD5689AD5689AD5689AD5689AD5689AD5689AD5689AD5689AD5689AD
          5689AD5689AD56FF00FFFF00FF8DAF5D8BAE598BAE598BAE598BAE5989AD5689
          AD5689AD5689AD568BAE598BAE598BAE598BAE598BAE59FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF89AD5689AD5689AD5689AD56FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF89AD5689
          AD5689AD5689AD56FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF89AD5689AD5689AD5689AD56FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF89AD5689
          AD5689AD5689AD56FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FF8FB1608FB1608FB1608FB160FF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OnClick = btnCAddClick
      end
      object btnCdel: TSpeedButton
        Left = 240
        Top = 0
        Width = 18
        Height = 18
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8C98D6FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FF8390D5FF00FFFF00FFFF00FFFF00FFFF00FF
          8693D6334CCC3D54CDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF465CCE334C
          CC7584D3FF00FFFF00FFFF00FF909CD7334CCC334CCC334CCC3D54CDFF00FFFF
          00FFFF00FFFF00FF465CCE334CCC334CCC334CCC808ED5FF00FFFF00FFFF00FF
          445ACE334CCC334CCC334CCC3D54CDFF00FFFF00FF465CCE334CCC334CCC334C
          CC4057CDFF00FFFF00FFFF00FFFF00FFFF00FF445ACE334CCC334CCC334CCC3D
          54CD455BCE334CCC334CCC334CCC4057CDFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF445ACE334CCC334CCC334CCC334CCC334CCC334CCC4057CDFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF445ACE334CCC33
          4CCC334CCC334CCC4057CDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FF465CCE334CCC334CCC334CCC334CCC3D54CDFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF465CCE334CCC334CCC33
          4CCC334CCC334CCC334CCC3D54CDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF465CCE334CCC334CCC334CCC4057CD445ACE334CCC334CCC334CCC3D54
          CDFF00FFFF00FFFF00FFFF00FFFF00FF465CCE334CCC334CCC334CCC4057CDFF
          00FFFF00FF445ACE334CCC334CCC334CCC3D54CDFF00FFFF00FFFF00FFABB2DA
          364ECC334CCC334CCC4057CDFF00FFFF00FFFF00FFFF00FF445ACE334CCC334C
          CC354DCCA4ACD9FF00FFFF00FFFF00FFA7AFDA364ECC4057CDFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF445ACE354DCCA2ABD9FF00FFFF00FFFF00FFFF00FF
          FF00FFA9B1DAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6AE
          D9FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        OnClick = btnCdelClick
      end
      object btnCEdit: TSpeedButton
        Left = 194
        Top = 0
        Width = 18
        Height = 18
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          04000000000080000000C30E0000C30E000010000000100000008E701E008080
          0000FF00FF000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000222222222222
          2222201222222222222221222222222222222221102222222222222111022222
          2222222011102222222222220111022222222222201110222222222222011102
          2222222222201110222222222222011102222222222220111022222222222201
          2222222222222220201222222222222221122222222222222222}
        OnClick = btnCEditClick
      end
      object dbgrdhContacts: TDBGridEh
        Left = 0
        Top = 18
        Width = 382
        Height = 461
        Align = alClient
        DataSource = srcContacts
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghExtendVertLines]
        TabOrder = 0
        OnExit = dbgrdhContactsExit
        OnKeyUp = dbgrdhContactsKeyUp
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'O_Name'
            Footers = <>
            Title.Caption = #1058#1080#1087
            Width = 62
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CC_VALUE'
            Footers = <>
            Title.Caption = #1050#1086#1085#1090#1072#1082#1090
            Width = 132
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Cc_Notify'
            Footers = <>
            Title.Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
            Width = 60
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CC_NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Width = 157
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object pnl2: TPanel
      Left = 0
      Top = 0
      Width = 382
      Height = 145
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 382
        Height = 145
        Align = alClient
        Caption = ' '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '
        Color = clWhite
        ParentColor = False
        TabOrder = 0
        object mmoNOTICE: TDBMemoEh
          Left = 2
          Top = 15
          Width = 378
          Height = 128
          Align = alClient
          AutoSize = False
          DataField = 'NOTICE'
          DataSource = ds
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1052#1086#1078#1085#1086' '#1086#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1084#1077#1090#1082#1091' '#1074' '#1101#1090#1086#1084' '#1087#1086#1083#1077
          ShowHint = True
          TabOrder = 0
          Visible = True
          WantReturns = True
        end
      end
    end
    object pnlPassport: TPanel
      Left = 0
      Top = 145
      Width = 382
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        382
        41)
      object btnPassport: TButton
        Left = 10
        Top = 8
        Width = 367
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Caption = #1050#1085#1086#1087#1082#1072' '#1076#1083#1103' '#1088#1072#1073#1086#1090#1099' '#1089' '#1087#1072#1089#1087#1086#1088#1090#1086#1084
        TabOrder = 0
        OnClick = actScanExecute
      end
    end
  end
  object pnlBUTTONS: TPanel
    Left = 0
    Top = 665
    Width = 879
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      879
      41)
    object btnCancel: TButton
      Left = 780
      Top = 8
      Width = 80
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 0
      OnClick = btnCancelClick
    end
    object btnSAVE: TButton
      Left = 499
      Top = 6
      Width = 275
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 1
      Visible = False
      OnClick = btnSAVEClick
    end
  end
  object srcContacts: TDataSource
    AutoEdit = False
    DataSet = dsContacts
    OnUpdateData = srcContactsUpdateData
    Left = 607
    Top = 271
  end
  object ds: TDataSource
    AutoEdit = False
    DataSet = dsCustomerMEM
    Left = 515
    Top = 156
  end
  object dsOrg: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SUBAREA'
      'SET '
      '    AREA_ID = :AREA_ID,'
      '    SUBAREA_ID = :SUBAREA_ID,'
      '    SUBAREA_NAME = :SUBAREA_NAME'
      'WHERE'
      '    SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SUBAREA'
      'WHERE'
      '        SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SUBAREA('
      '    AREA_ID,'
      '    SUBAREA_ID,'
      '    SUBAREA_NAME'
      ')'
      'VALUES('
      '    :AREA_ID,'
      '    :SUBAREA_ID,'
      '    :SUBAREA_NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM SUBAREA'
      'where(  area_ID = :AREA_ID'
      'and subarea_id <> 0'
      '     ) and (     SUBAREA.SUBAREA_ID = :OLD_SUBAREA_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      
        'coalesce((select h.house_id from house h where h.org_id = o.org_' +
        'id and h.house_id = :HOUSE_ID ),-1) as finded'
      ', o.ORG_NAME'
      ', o.ORG_ID'
      'from ORGANIZATION o'
      'order by 1 desc, 2')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcHouse
    Left = 591
    Top = 359
  end
  object srcOrg: TDataSource
    DataSet = dsOrg
    Left = 602
    Top = 387
  end
  object dsVATG: TpFIBDataSet
    SelectSQL.Strings = (
      'select o.o_name, o.O_id'
      'from objects o'
      'where o.O_TYPE = 13'
      'order by o.o_name')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 667
    Top = 373
  end
  object srcVATG: TDataSource
    AutoEdit = False
    DataSet = dsVATG
    Left = 700
    Top = 374
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 694
    Top = 324
  end
  object dsStreets: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT s.street_id, s.street_name||'#39' '#39'||s.street_short as street' +
        '_name, a.area_name'
      'FROM STREET s left outer join area a on (a.area_id = s.area_id)'
      'ORDER BY STREET_NAME, a.area_name')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 654
    Top = 324
  end
  object dsAttributes: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '    o.o_name,'
      '    ca.ca_value,'
      '    ca.notice,'
      '    case when ca.ca_id is null then 0'
      '    else 1 end as isSet'
      'from customer_attributes ca'
      
        '   right outer join objects o on (ca.o_id = o.o_id and CA.CUSTOM' +
        'ER_ID = :CUSTOMER_ID)'
      'where o.o_type = 4'
      'order by 1,2')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 661
    Top = 281
  end
  object srcAttributes: TDataSource
    DataSet = dsAttributes
    Left = 717
    Top = 281
  end
  object dsHouses: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    H.HOUSE_ID'
      '  , H.STREET_ID'
      
        '  , iif(coalesce(h.In_Date, dateadd(day, 1, current_date)) <= cu' +
        'rrent_date, H.HOUSE_NO, H.HOUSE_NO || '#39' ('#1085#1077' '#1089#1076#1072#1085')'#39') HOUSE_NO'
      '  , H.Q_FLAT'
      '  , H.ORG_ID'
      'from HOUSE H'
      'where h.street_id = :street_id'
      '  @@AREA_LOCK% @ -- '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1088#1072#1081#1086#1085#1072#1084
      'order by h.HOUSE_NO')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    DataSource = srcStreet
    Left = 794
    Top = 366
  end
  object srcHouse: TDataSource
    DataSet = dsHouses
    Left = 842
    Top = 366
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
    Left = 666
    Top = 206
  end
  object srcExecutor: TDataSource
    AutoEdit = False
    DataSet = dsExecutor
    Left = 768
    Top = 277
  end
  object dsExecutor: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      
        '    W.WORKER_ID, w.SURNAME || coalesce('#39' '#39' || w.FIRSTNAME || coa' +
        'lesce('#39' '#39' || w.MIDLENAME, '#39#39'), '#39#39') as FIO, w.IBNAME as LOGIN'
      '  from WORKER W'
      '  where w.working = 1'
      '        and w.in_dogovor = 1'
      '  order by 2')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 765
    Top = 246
  end
  object DataSource1: TDataSource
    Left = 832
    Top = 270
  end
  object dsCustomerMEM: TMemTableEh
    Active = True
    AutoCalcFields = False
    FieldDefs = <
      item
        Name = 'BANK_ID'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'BANK_ACCOUNT'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'BANK'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'CUSTOMER_ID'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'STREET_ID'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'HOUSE_ID'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'ACCOUNT_NO'
        DataType = ftWideString
        Size = 15
      end
      item
        Name = 'DOGOVOR_NO'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'SURNAME'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'FIRSTNAME'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'MIDLENAME'
        DataType = ftWideString
        Size = 30
      end
      item
        Name = 'CONTRACT_DATE'
        DataType = ftDate
      end
      item
        Name = 'ACTIVIZ_DATE'
        DataType = ftDate
      end
      item
        Name = 'NOTICE'
        DataType = ftWideString
        Size = 900
      end
      item
        Name = 'VALID_TO'
        DataType = ftDate
      end
      item
        Name = 'FLAT_NO'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'PORCH_N'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'FLOOR_N'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'PASSPORT_NUMBER'
        DataType = ftWideString
        Size = 20
      end
      item
        Name = 'PASSPORT_REGISTRATION'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'PERSONAL_N'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'MANAGER_ID'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'HAND_CONTROL'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'JURIDICAL'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'JUR_INN'
        DataType = ftWideString
        Size = 100
      end
      item
        Name = 'JUR_DIRECTOR'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'JUR_BUH'
        DataType = ftWideString
        Size = 50
      end
      item
        Name = 'HIS_COLOR'
        DataType = ftWideString
        Size = 10
      end
      item
        Name = 'INVISIBLE'
        DataType = ftSmallint
        Precision = 15
      end
      item
        Name = 'BIRTHDAY'
        DataType = ftDate
      end
      item
        Name = 'ADRES_REGISTR'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'ORG_ID'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'VATG_ID'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'TAP'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'SECRET'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'EXTERNAL_ID'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CONTRACT_BASIS'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'PASSPORT_VALID'
        DataType = ftSmallint
        Precision = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 512
    Top = 200
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object BANK_ID: TMTNumericDataFieldEh
          FieldName = 'BANK_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object BANK_ACCOUNT: TMTStringDataFieldEh
          FieldName = 'BANK_ACCOUNT'
          StringDataType = fdtStringEh
          DisplayWidth = 20
          Size = 30
        end
        object BANK: TMTStringDataFieldEh
          FieldName = 'BANK'
          StringDataType = fdtStringEh
          DisplayWidth = 100
          Size = 500
        end
        object CUSTOMER_ID: TMTNumericDataFieldEh
          FieldName = 'CUSTOMER_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CUSTOMER_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object STREET_ID: TMTNumericDataFieldEh
          FieldName = 'STREET_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
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
        object ACCOUNT_NO: TMTStringDataFieldEh
          FieldName = 'ACCOUNT_NO'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'ACCOUNT_NO'
          DisplayWidth = 15
          Size = 15
        end
        object DOGOVOR_NO: TMTStringDataFieldEh
          FieldName = 'DOGOVOR_NO'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'DOGOVOR_NO'
          DisplayWidth = 20
        end
        object SURNAME: TMTStringDataFieldEh
          FieldName = 'SURNAME'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'SURNAME'
          DisplayWidth = 100
          Size = 100
        end
        object FIRSTNAME: TMTStringDataFieldEh
          FieldName = 'FIRSTNAME'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'FIRSTNAME'
          DisplayWidth = 30
          Size = 30
        end
        object MIDLENAME: TMTStringDataFieldEh
          FieldName = 'MIDLENAME'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'MIDLENAME'
          DisplayWidth = 30
          Size = 30
        end
        object CONTRACT_DATE: TMTDateTimeDataFieldEh
          FieldName = 'CONTRACT_DATE'
          DateTimeDataType = fdtDateEh
          DisplayLabel = 'CONTRACT_DATE'
          DisplayWidth = 10
          DisplayFormat = 'dd.mm.yyyy'
        end
        object ACTIVIZ_DATE: TMTDateTimeDataFieldEh
          FieldName = 'ACTIVIZ_DATE'
          DateTimeDataType = fdtDateEh
          DisplayLabel = 'ACTIVIZ_DATE'
          DisplayWidth = 10
          DisplayFormat = 'dd.mm.yyyy'
        end
        object NOTICE: TMTStringDataFieldEh
          FieldName = 'NOTICE'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'NOTICE'
          DisplayWidth = 900
          Size = 900
        end
        object VALID_TO: TMTDateTimeDataFieldEh
          FieldName = 'VALID_TO'
          DateTimeDataType = fdtDateEh
          DisplayLabel = 'VALID_TO'
          DisplayWidth = 10
          DisplayFormat = 'dd.mm.yyyy'
        end
        object FLAT_NO: TMTStringDataFieldEh
          FieldName = 'FLAT_NO'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'FLAT_NO'
          DisplayWidth = 100
          Size = 100
        end
        object PORCH_N: TMTStringDataFieldEh
          FieldName = 'PORCH_N'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'PORCH_NO'
          DisplayWidth = 50
          Size = 50
        end
        object FLOOR_N: TMTStringDataFieldEh
          FieldName = 'FLOOR_N'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'FLOOR_NO'
          DisplayWidth = 50
          Size = 50
        end
        object PASSPORT_NUMBER: TMTStringDataFieldEh
          FieldName = 'PASSPORT_NUMBER'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'PASSPORT_NUMBER'
          DisplayWidth = 20
        end
        object PASSPORT_REGISTRATION: TMTStringDataFieldEh
          FieldName = 'PASSPORT_REGISTRATION'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'PASSPORT_REGISTRATION'
          DisplayWidth = 100
          Size = 100
        end
        object PERSONAL_N: TMTStringDataFieldEh
          FieldName = 'PERSONAL_N'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'PERSONAL_N'
          DisplayWidth = 50
          Size = 50
        end
        object MANAGER_ID: TMTNumericDataFieldEh
          FieldName = 'MANAGER_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'MANAGER_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object HAND_CONTROL: TMTNumericDataFieldEh
          FieldName = 'HAND_CONTROL'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DefaultExpression = '0'
          DisplayLabel = 'HAND_CONTROL'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object JURIDICAL: TMTNumericDataFieldEh
          FieldName = 'JURIDICAL'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DefaultExpression = '0'
          DisplayLabel = 'JURIDICAL'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object JUR_INN: TMTStringDataFieldEh
          FieldName = 'JUR_INN'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'JUR_INN'
          DisplayWidth = 100
          Size = 100
        end
        object JUR_DIRECTOR: TMTStringDataFieldEh
          FieldName = 'JUR_DIRECTOR'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'JUR_DIRECTOR'
          DisplayWidth = 50
          Size = 50
        end
        object JUR_BUH: TMTStringDataFieldEh
          FieldName = 'JUR_BUH'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'JUR_BUH'
          DisplayWidth = 50
          Size = 50
        end
        object HIS_COLOR: TMTStringDataFieldEh
          FieldName = 'HIS_COLOR'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'HIS_COLOR'
          DisplayWidth = 10
          Size = 10
        end
        object INVISIBLE: TMTNumericDataFieldEh
          FieldName = 'INVISIBLE'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DefaultExpression = '0'
          DisplayLabel = 'INVISIBLE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object BIRTHDAY: TMTDateTimeDataFieldEh
          FieldName = 'BIRTHDAY'
          DateTimeDataType = fdtDateEh
          DisplayLabel = 'BIRTHDAY'
          DisplayWidth = 10
          DisplayFormat = 'dd.mm.yyyy'
        end
        object ADRES_REGISTR: TMTStringDataFieldEh
          FieldName = 'ADRES_REGISTR'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'ADRES_REGISTR'
          DisplayWidth = 255
          Size = 255
        end
        object ORG_ID: TMTNumericDataFieldEh
          FieldName = 'ORG_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'ORG_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object VATG_ID: TMTNumericDataFieldEh
          FieldName = 'VATG_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'VATG_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object TAP: TMTNumericDataFieldEh
          FieldName = 'TAP'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'TAP'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SECRET: TMTStringDataFieldEh
          FieldName = 'SECRET'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'SECRET'
          DisplayWidth = 255
          Size = 255
        end
        object EXTERNAL_ID: TMTStringDataFieldEh
          FieldName = 'EXTERNAL_ID'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object CONTRACT_BASIS: TMTStringDataFieldEh
          FieldName = 'CONTRACT_BASIS'
          StringDataType = fdtStringEh
          DisplayWidth = 100
          Size = 255
        end
        object PASSPORT_VALID: TMTNumericDataFieldEh
          FieldName = 'PASSPORT_VALID'
          NumericDataType = fdtSmallintEh
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
  object dsContacts: TMemTableEh
    Active = True
    Params = <>
    BeforePost = dsContactsBeforePost
    OnNewRecord = dsContactsNewRecord
    Left = 608
    Top = 216
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object INSERTED: TMTBooleanDataFieldEh
          FieldName = 'INSERTED'
          DisplayWidth = 5
        end
        object EDITED: TMTBooleanDataFieldEh
          FieldName = 'EDITED'
          DisplayWidth = 5
        end
        object CUSTOMER_ID: TMTNumericDataFieldEh
          FieldName = 'CUSTOMER_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CUSTOMER_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CC_VALUE: TMTStringDataFieldEh
          FieldName = 'CC_VALUE'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'CC_VALUE'
          DisplayWidth = 255
          Size = 255
        end
        object CC_TYPE: TMTNumericDataFieldEh
          FieldName = 'CC_TYPE'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DefaultExpression = '0'
          DisplayLabel = 'CC_TYPE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object CC_NOTICE: TMTStringDataFieldEh
          FieldName = 'CC_NOTICE'
          StringDataType = fdtWideStringEh
          DisplayLabel = 'CC_NOTICE'
          DisplayWidth = 500
          Size = 500
        end
        object Cc_Notify: TMTBooleanDataFieldEh
          FieldName = 'Cc_Notify'
          DisplayWidth = 20
        end
        object O_Name: TMTStringDataFieldEh
          FieldName = 'O_Name'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object ColorDialog1: TColorDialog
    Left = 533
    Top = 362
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 352
    Top = 176
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 680
    Top = 58
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 636
    Top = 58
  end
  object trReadQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 636
    Top = 108
  end
  object trWriteQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 680
    Top = 108
  end
  object PropStorageEh: TPropStorageEh
    Section = 'CUSTOMER'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.Top'
      '<P>.Width')
    Left = 601
    Top = 513
  end
  object actlst: TActionList
    Left = 681
    Top = 466
    object actScan: TAction
      Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1080' '#1079#1072#1087#1086#1083#1085#1080#1090#1100
      ShortCut = 117
      OnExecute = actScanExecute
    end
  end
  object srcBanks: TDataSource
    AutoEdit = False
    DataSet = dsBANKS
    Left = 744
    Top = 470
  end
  object dsBANKS: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME ||coalesce('#39' '#1041#1048#1050' '#39'||O_DIMENSION, '#39#39') BANK'
      '  , O_NAME NAME'
      '  , O_DIMENSION BIK'
      '  from OBJECTS'
      '  where O_TYPE = 11'
      '        and O_DELETED = 0'
      '  order by O_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 753
    Top = 517
  end
end
