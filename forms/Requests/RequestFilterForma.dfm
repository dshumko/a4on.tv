object RequestFilterForm: TRequestFilterForm
  Left = 367
  Top = 186
  BorderIcons = [biSystemMenu]
  Caption = #1060#1080#1083#1100#1090#1088' '#1079#1072#1103#1074#1086#1082
  ClientHeight = 394
  ClientWidth = 570
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlOKCancel: TPanel
    Left = 0
    Top = 357
    Width = 570
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      570
      37)
    object SpeedButton3: TSpeedButton
      Left = 174
      Top = 2
      Width = 94
      Height = 30
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      Flat = True
      OnClick = SpeedButton3Click
    end
    object btnLoad: TSpeedButton
      Left = 90
      Top = 2
      Width = 80
      Height = 30
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Flat = True
      OnClick = btnLoadClick
    end
    object btnSave: TSpeedButton
      Left = 6
      Top = 2
      Width = 80
      Height = 30
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Flat = True
      OnClick = btnSaveClick
    end
    object chkDefaultFilter: TCheckBox
      Left = 273
      Top = 11
      Width = 113
      Height = 17
      Hint = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1101#1090#1086#1090' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      Anchors = [akTop, akRight]
      Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1092#1080#1083#1100#1090#1088
      TabOrder = 2
    end
    object bbOk: TBitBtn
      Left = 389
      Top = 3
      Width = 93
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = actOkExecute
    end
    object bbCancel: TBitBtn
      Left = 491
      Top = 3
      Width = 75
      Height = 30
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object pnlBtns: TPanel
    Left = 0
    Top = 322
    Width = 570
    Height = 35
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      570
      35)
    object lbl4: TLabel
      Left = 185
      Top = 11
      Width = 94
      Height = 13
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' '#1091#1089#1083#1086#1074#1080#1077' '#1082' '#1092#1080#1083#1100#1090#1088#1091' '#1082#1072#1082
      Alignment = taRightJustify
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1077
    end
    object lbl5: TLabel
      Left = 330
      Top = 11
      Width = 4
      Height = 13
      Caption = '/'
    end
    object lblOrAND: TLabel
      Left = 129
      Top = 8
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbnvgr1: TDBNavigator
      Left = 405
      Top = 5
      Width = 155
      Height = 25
      DataSource = srcFilter
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object chk1: TDBCheckBoxEh
      Left = 8
      Top = 9
      Width = 117
      Height = 17
      Hint = 
        #1090'.'#1077'. '#1076#1086#1073#1072#1074#1080#1084' '#1086#1090#1088#1080#1094#1072#1085#1080#1077' '#1074' '#1091#1089#1083#1086#1074#1080#1077'.'#13#10#1085#1072#1087#1088#1080#1084#1077#1088' '#1085#1077' '#1078#1080#1074#1077#1090' '#1085#1072' '#1091#1083#1080#1094#1077' '#1051#1077 +
        #1085#1080#1085#1072' '#1074' '#1076#1086#1084#1077' 6'
      TabStop = False
      Caption = #1048#1085#1074#1077#1088#1089#1080#1103' '#1092#1080#1083#1100#1090#1088#1072
      DataField = 'inversion'
      DataSource = srcFilter
      DynProps = <>
      TabOrder = 3
    end
    object btnAnd: TButton
      Left = 285
      Top = 5
      Width = 38
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' '#1091#1089#1083#1086#1074#1080#1077' '#1082' '#1092#1080#1083#1100#1090#1088#1091' '#1082#1072#1082' '#1048
      Caption = #1048
      TabOrder = 0
      TabStop = False
      OnClick = btnAndClick
    end
    object btnOR: TButton
      Left = 341
      Top = 5
      Width = 39
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' '#1091#1089#1083#1086#1074#1080#1077' '#1082' '#1092#1080#1083#1100#1090#1088#1091' '#1082#1072#1082' '#1048#1051#1048
      Caption = #1048#1051#1048
      TabOrder = 1
      TabStop = False
      OnClick = btnORClick
    end
  end
  object pgcFilter: TPageControl
    Left = 0
    Top = 0
    Width = 570
    Height = 322
    ActivePage = tsMain
    Align = alClient
    TabOrder = 0
    object tsMain: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1086#1081
      DesignSize = (
        562
        294)
      object Label9: TLabel
        Left = 8
        Top = 141
        Width = 56
        Height = 13
        Caption = #1058#1080#1087' '#1079#1072#1103#1074#1082#1080
      end
      object Label10: TLabel
        Left = 8
        Top = 168
        Width = 66
        Height = 13
        Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      end
      object lbl3: TLabel
        Left = 8
        Top = 195
        Width = 55
        Height = 13
        Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072
      end
      object lbl6: TLabel
        Left = 445
        Top = 35
        Width = 17
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1050#1074'.'
      end
      object lbl7: TLabel
        Left = 298
        Top = 35
        Width = 41
        Height = 13
        Caption = #8470' '#1076#1086#1084#1072
      end
      object lbl8: TLabel
        Left = 8
        Top = 35
        Width = 31
        Height = 13
        Caption = #1059#1083#1080#1094#1072
      end
      object lbl2: TLabel
        Left = 298
        Top = 8
        Width = 30
        Height = 13
        Caption = #1047#1074#1077#1085#1086
      end
      object lbl1: TLabel
        Left = 3
        Top = 8
        Width = 42
        Height = 13
        Caption = #1059#1095#1072#1089#1090#1086#1082
      end
      object lbl9: TLabel
        Left = 298
        Top = 248
        Width = 30
        Height = 13
        Caption = #1056#1072#1081#1086#1085
      end
      object lbl10: TLabel
        Left = 8
        Top = 248
        Width = 52
        Height = 13
        Caption = #1053#1072#1089'.'#1087#1091#1085#1082#1090
      end
      object lbl11: TLabel
        Left = 61
        Top = 88
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object lbl12: TLabel
        Left = 8
        Top = 61
        Width = 65
        Height = 13
        Caption = #1053#1072' '#1087#1077#1088#1080#1086#1076' '#1089':'
      end
      object lbl13: TLabel
        Left = 298
        Top = 61
        Width = 14
        Height = 13
        Hint = #1047#1072' '#1091#1082#1072#1079#1074#1085#1085#1086#1077' '#1082#1086#1083'-'#1074#1086' '#1076#1085#1077#1081' '#1076#1086' '#1089#1077#1075#1086#1076#1085#1103#1096#1085#1077#1081' '#1076#1072#1090#1099
        Caption = #1044#1086
        ParentShowHint = False
        ShowHint = True
      end
      object lblWork: TLabel
        Left = 298
        Top = 168
        Width = 36
        Height = 13
        Caption = #1056#1072#1073#1086#1090#1072
      end
      object lbl14: TLabel
        Left = 440
        Top = 61
        Width = 30
        Height = 13
        Hint = #1059#1082#1072#1079#1074#1085#1085#1086#1077' '#1082#1086#1083'-'#1074#1086' '#1076#1085#1077#1081' '#1087#1086#1089#1083#1077' '#1089#1077#1075#1086#1076#1085#1103#1096#1085#1077#1081' '#1076#1072#1090#1099
        Anchors = [akTop, akRight]
        Caption = #1055#1086#1089#1083#1077
        ParentShowHint = False
        ShowHint = True
      end
      object lblOgz: TLabel
        Left = 298
        Top = 195
        Width = 41
        Height = 13
        Caption = #1054#1088#1075'-'#1094#1080#1103
      end
      object lblHE: TLabel
        Left = 298
        Top = 222
        Width = 13
        Height = 13
        Caption = #1043#1057
      end
      object lblResult: TLabel
        Left = 8
        Top = 222
        Width = 53
        Height = 13
        Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
      end
      object Label1: TLabel
        Left = 298
        Top = 141
        Width = 43
        Height = 13
        Caption = #1055#1088#1080#1095#1080#1085#1072
      end
      object Label2: TLabel
        Left = 79
        Top = 115
        Width = 96
        Height = 13
        Caption = #1055#1088#1086#1089#1088#1086#1095#1077#1085#1086', '#1095#1072#1089#1086#1074
      end
      object lbl15: TLabel
        Left = 445
        Top = 115
        Width = 16
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1087#1086':'
      end
      object lbl16: TLabel
        Left = 298
        Top = 115
        Width = 42
        Height = 13
        Hint = #1055#1083#1072#1085#1086#1074#1086#1077' '#1074#1088#1077#1084#1103' '#1089
        Caption = #1042#1088#1077#1084#1103' '#1089':'
      end
      object lbl17: TLabel
        Left = 8
        Top = 275
        Width = 58
        Height = 13
        Caption = #1047#1072#1103#1074#1082#1080' '#1076#1083#1103
      end
      object luType: TDBLookupComboboxEh
        Left = 79
        Top = 138
        Width = 207
        Height = 21
        DynProps = <>
        DataField = 'REQUEST_TYPE'
        DataSource = srcFilter
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'RT_ID'
        ListField = 'RT_NAME'
        ListSource = srcRequestType
        ShowHint = True
        TabOrder = 13
        Visible = True
        OnEnter = luWorkEnter
      end
      object DBLookupComboboxEh2: TDBLookupComboboxEh
        Left = 79
        Top = 165
        Width = 207
        Height = 21
        Hint = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100' '#1079#1072#1103#1074#1082#1080
        DynProps = <>
        DataField = 'EXECUTOR_ID'
        DataSource = srcFilter
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'WORKER_ID'
        ListField = 'FIO'
        ListSource = srcExecutor
        ShowHint = True
        TabOrder = 15
        Visible = True
        OnEnter = luWorkEnter
      end
      object luAnalysGrp: TDBLookupComboboxEh
        Left = 79
        Top = 192
        Width = 207
        Height = 21
        Hint = #1043#1088#1091#1087#1087#1072' '#1072#1085#1072#1083#1080#1090#1080#1082#1080' ('#1074#1086#1079#1084#1086#1078#1085#1086' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1075#1088#1091#1087#1087#1077')'
        DynProps = <>
        DataField = 'Analyse'
        DataSource = srcFilter
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'O_ID'
        ListField = 'O_NAME'
        ListSource = srcANALYS
        ShowHint = True
        TabOrder = 17
        Visible = True
        OnEnter = luWorkEnter
      end
      object ed1: TDBEditEh
        Left = 471
        Top = 32
        Width = 85
        Height = 21
        Hint = #1050#1074#1072#1088#1090#1080#1088#1072
        Anchors = [akTop, akRight]
        DataField = 'FLAT_NO'
        DataSource = srcFilter
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 4
        Visible = True
      end
      object luHouseNo: TDBLookupComboboxEh
        Left = 348
        Top = 32
        Width = 90
        Height = 21
        Hint = #1044#1086#1084
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'HOUSE_ID'
        DataSource = srcFilter
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'HOUSE_ID'
        ListField = 'HOUSE_NO'
        ListSource = srcHomes
        ShowHint = True
        TabOrder = 3
        Visible = True
        OnEnter = luWorkEnter
      end
      object luUpCuststreetFilter: TDBLookupComboboxEh
        Left = 79
        Top = 32
        Width = 207
        Height = 21
        Hint = #1059#1083#1080#1094#1072
        DynProps = <>
        DataField = 'STREET_ID'
        DataSource = srcFilter
        DropDownBox.Columns = <
          item
            FieldName = 'STREET_NAME'
            Width = 40
          end
          item
            FieldName = 'AREA_NAME'
            Width = 30
          end>
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'STREET_ID'
        ListField = 'STREET_NAME'
        ListSource = srcStreets
        ShowHint = True
        TabOrder = 2
        Visible = True
        OnEnter = luWorkEnter
      end
      object lucbb2: TDBLookupComboboxEh
        Left = 346
        Top = 5
        Width = 210
        Height = 21
        Hint = #1047#1074#1077#1085#1086
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'WORKGROUP'
        DataSource = srcFilter
        DropDownBox.Columns = <
          item
            FieldName = 'WG_NAME'
          end
          item
            FieldName = 'WA_NAME'
          end>
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'WG_ID'
        ListField = 'WG_NAME'
        ListSource = srcWORKGROUP
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object lucbb1: TDBLookupComboboxEh
        Left = 79
        Top = 5
        Width = 207
        Height = 21
        Hint = #1059#1095#1072#1089#1090#1086#1082
        DynProps = <>
        DataField = 'WORKAREA'
        DataSource = srcFilter
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'WA_ID'
        ListField = 'NAME'
        ListSource = srcWORKAREA
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
      object luDBLookupComboBox1: TDBLookupComboboxEh
        Left = 79
        Top = 245
        Width = 207
        Height = 21
        Hint = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
        DynProps = <>
        DataField = 'AREA_ID'
        DataSource = srcFilter
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'AREA_ID'
        ListField = 'AREA_NAME'
        ListSource = srcArea
        ShowHint = True
        TabOrder = 21
        Visible = True
        OnEnter = luWorkEnter
      end
      object dePLANTO: TDBDateTimeEditEh
        Left = 79
        Top = 85
        Width = 205
        Height = 21
        Alignment = taLeftJustify
        DataField = 'DATE_TO'
        DataSource = srcFilter
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 6
        Visible = True
        EditFormat = 'DD/MM/YYYY HH:NN'
      end
      object dePLANFROM: TDBDateTimeEditEh
        Left = 79
        Top = 58
        Width = 205
        Height = 21
        Alignment = taLeftJustify
        DataField = 'DATE_FROM'
        DataSource = srcFilter
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 5
        Visible = True
        EditFormat = 'DD/MM/YYYY HH:NN'
      end
      object edTo: TDBNumberEditEh
        Left = 348
        Top = 58
        Width = 90
        Height = 21
        Hint = #1047#1072' '#1091#1082#1072#1079#1074#1085#1085#1086#1077' '#1082#1086#1083'-'#1074#1086' '#1076#1085#1077#1081' '#1076#1086' '#1089#1077#1075#1086#1076#1085#1103#1096#1085#1077#1081' '#1076#1072#1090#1099
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DaysBefore'
        DataSource = srcFilter
        DecimalPlaces = 0
        DynProps = <>
        EditButton.Style = ebsUpDownEh
        EditButton.Visible = True
        EditButtons = <>
        MaxValue = 99.000000000000000000
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        Visible = True
      end
      object edAfter: TDBNumberEditEh
        Left = 471
        Top = 58
        Width = 85
        Height = 21
        Hint = #1059#1082#1072#1079#1074#1085#1085#1086#1077' '#1082#1086#1083'-'#1074#1086' '#1076#1085#1077#1081' '#1087#1086#1089#1083#1077' '#1089#1077#1075#1086#1076#1085#1103#1096#1085#1077#1081' '#1076#1072#1090#1099
        Anchors = [akTop, akRight]
        DataField = 'DaysAfter'
        DataSource = srcFilter
        DecimalPlaces = 0
        DynProps = <>
        EditButton.Style = ebsUpDownEh
        EditButton.Visible = True
        EditButtons = <>
        MaxValue = 99.000000000000000000
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
        Visible = True
      end
      object luWork: TDBLookupComboboxEh
        Left = 346
        Top = 165
        Width = 210
        Height = 21
        Hint = #1042' '#1079#1072#1103#1074#1082#1077' '#1091#1082#1072#1079#1072#1085#1072' '#1088#1072#1073#1086#1090#1072
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'WORK_ID'
        DataSource = srcFilter
        DropDownBox.Columns = <
          item
            FieldName = 'NAME'
          end
          item
            FieldName = 'RT_NAME'
          end>
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'W_ID'
        ListField = 'NAME'
        ListSource = srcWorks
        ShowHint = True
        TabOrder = 16
        Visible = True
        OnEnter = luWorkEnter
      end
      object luOgz: TDBLookupComboboxEh
        Left = 346
        Top = 192
        Width = 210
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'ORGZ_ID'
        DataSource = srcFilter
        DropDownBox.AutoFitColWidths = False
        DropDownBox.Columns = <
          item
            FieldName = 'ORG_NAME'
            Title.Caption = #1054#1073#1089#1083#1091#1078#1080#1074#1072#1102#1097#1072#1103' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end>
        DropDownBox.Options = []
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'ORG_ID'
        ListField = 'ORG_NAME'
        ListSource = srcOrg
        ShowHint = True
        TabOrder = 18
        Visible = True
        OnEnter = luWorkEnter
      end
      object luHE: TDBLookupComboboxEh
        Left = 346
        Top = 219
        Width = 210
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'HE_ID'
        DataSource = srcFilter
        DropDownBox.AutoFitColWidths = False
        DropDownBox.Options = []
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'HE_ID'
        ListField = 'HE_NAME'
        ListSource = srcMH
        ShowHint = True
        TabOrder = 20
        Visible = True
        OnEnter = luWorkEnter
      end
      object luResult: TDBLookupComboboxEh
        Left = 79
        Top = 219
        Width = 207
        Height = 21
        DynProps = <>
        DataField = 'RESULT_ID'
        DataSource = srcFilter
        DropDownBox.AutoFitColWidths = False
        DropDownBox.Columns = <
          item
            FieldName = 'NAME'
          end
          item
            FieldName = 'RT_NAME'
          end>
        DropDownBox.Options = []
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'RR_ID'
        ListField = 'NAME'
        ListSource = srcResult
        ShowHint = True
        TabOrder = 19
        Visible = True
        OnEnter = luWorkEnter
      end
      object luTemplate: TDBLookupComboboxEh
        Left = 346
        Top = 138
        Width = 210
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'RQTPL_ID'
        DataSource = srcFilter
        DropDownBox.Columns = <
          item
            FieldName = 'RQ_CONTENT'
            Width = 40
          end
          item
            FieldName = 'RT_NAME'
            Width = 24
          end>
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'RQTL_ID'
        ListField = 'RQ_CONTENT'
        ListSource = srcErrors
        ShowHint = True
        TabOrder = 14
        Visible = True
        OnEnter = luWorkEnter
      end
      object cbbSUBAREA: TDBLookupComboboxEh
        Left = 346
        Top = 245
        Width = 210
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'SUBAREA_ID'
        DataSource = srcFilter
        DropDownBox.Columns = <
          item
            FieldName = 'SUBAREA_NAME'
            Title.Caption = #1059#1095#1072#1089#1090#1086#1082
          end
          item
            FieldName = 'AREA_NAME'
            Title.Caption = #1056#1072#1081#1086#1085
          end>
        DropDownBox.AutoDrop = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'SUBAREA_ID'
        ListField = 'SUBAREA_NAME'
        ListSource = srcSubArea
        ParentShowHint = False
        ShowHint = True
        TabOrder = 22
        Visible = True
      end
      object DBCheckBoxEh1: TDBCheckBoxEh
        Left = 298
        Top = 87
        Width = 258
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        Caption = #1055#1086#1074#1090#1086#1088#1085#1099#1077' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        DataField = 'repeated'
        DataSource = srcFilter
        DynProps = <>
        TabOrder = 9
      end
      object edExpired: TDBNumberEditEh
        Left = 196
        Top = 112
        Width = 90
        Height = 21
        Hint = #1047#1072#1103#1074#1082#1072' '#1087#1088#1086#1089#1088#1086#1095#1077#1085#1072' '#1085#1072' '#1061' '#1095#1072#1089#1086#1074
        DataField = 'Expired'
        DataSource = srcFilter
        DecimalPlaces = 0
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 10
        Visible = True
      end
      object deTimeTo: TDBDateTimeEditEh
        Left = 471
        Top = 112
        Width = 85
        Height = 21
        Anchors = [akTop, akRight]
        DataField = 'TimeTo'
        DataSource = srcFilter
        DynProps = <>
        EditButton.Visible = False
        EditButtons = <>
        ShowHint = True
        TabOrder = 12
        Visible = True
        EditFormat = 'HH:NN'
      end
      object deTimeFrom: TDBDateTimeEditEh
        Left = 348
        Top = 112
        Width = 90
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'TimeFrom'
        DataSource = srcFilter
        DynProps = <>
        EditButton.Visible = False
        EditButtons = <>
        ShowHint = True
        TabOrder = 11
        Visible = True
        EditFormat = 'HH:NN'
      end
      object cbbWhose: TDBComboBoxEh
        Left = 79
        Top = 272
        Width = 207
        Height = 21
        DataField = 'Whose'
        DataSource = srcFilter
        DynProps = <>
        EmptyDataInfo.Text = #1042#1089#1077#1093' / '#1040#1073#1086#1085#1077#1085#1090#1086#1074' / '#1059#1079#1083#1086#1074
        EditButtons = <>
        Items.Strings = (
          #1042#1089#1077#1093
          #1040#1073#1086#1085#1077#1085#1090#1086#1074
          #1059#1079#1083#1086#1074
          #1041#1077#1079' '#1087#1088#1080#1074#1103#1079#1082#1080' '#1082' '#1040#1073#1086#1085#1077#1085#1090#1091' '#1080#1083#1080' '#1059#1079#1083#1091)
        KeyItems.Strings = (
          '0'
          '1'
          '2'
          '3')
        ShowHint = True
        TabOrder = 23
        Visible = True
      end
    end
    object tsList: TTabSheet
      Caption = #1055#1086' '#1089#1087#1080#1089#1082#1091
      ImageIndex = 1
      object mmoListBids: TDBMemoEh
        Left = 0
        Top = 0
        Width = 562
        Height = 294
        ScrollBars = ssVertical
        Align = alClient
        AutoSize = False
        DataField = 'ListBids'
        DataSource = srcFilter
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = 
          #1042#1085#1077#1089#1080#1090#1077' '#1089#1087#1080#1089#1086#1082' '#1079#1072#1103#1074#1086#1082' ('#1095#1077#1088#1077#1079' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1080'  '#39','#39' '#1080' '#39';'#39' '#1080#1083#1080' '#1085#1086#1074#1072#1103' '#1089#1090 +
          #1088#1086#1082#1072' )'
        ShowHint = True
        TabOrder = 0
        Visible = True
        WantReturns = True
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
      'order by STREET_NAME, a.area_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 592
    Top = 75
    oFetchAll = True
  end
  object srcStreets: TDataSource
    DataSet = dsStreets
    Left = 600
    Top = 93
  end
  object dsHomes: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT HOUSE_ID, STREET_ID, HOUSE_NO, Q_FLAT'
      'FROM HOUSE H'
      'where h.street_id = :street_id'
      'order by h.HOUSE_NO')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcStreets
    Left = 588
    Top = 11
    oFetchAll = True
  end
  object srcHomes: TDataSource
    DataSet = dsHomes
    Left = 595
    Top = 25
  end
  object dsArea: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from AREA'
      'where AREA_ID <> 0'
      'order by AREA_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 674
    Top = 16
    oFetchAll = True
  end
  object srcArea: TDataSource
    DataSet = dsArea
    Left = 681
    Top = 24
  end
  object dsSubArea: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT s.subarea_id, s.subarea_name, s.notice, a.area_name'
      'FROM SUBAREA s inner join area a on (s.area_id = a.area_id)'
      'where s.subarea_id <> 0'
      'order by SUBAREA_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 606
    Top = 151
    oFetchAll = True
  end
  object srcSubArea: TDataSource
    DataSet = dsSubArea
    Left = 615
    Top = 165
  end
  object dsRequestType: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' W.*'
      'FROM REQUEST_TYPES W'
      'order BY W.RT_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 701
    Top = 232
  end
  object srcRequestType: TDataSource
    AutoEdit = False
    DataSet = dsRequestType
    Left = 687
    Top = 229
  end
  object dsExecutor: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      
        ' W.WORKER_ID, w.SURNAME||'#39' '#39'||w.FIRSTNAME||'#39' '#39'||w.MIDLENAME as F' +
        'IO'
      'FROM WORKER W'
      'WHERE w.working = 1'
      'order BY 2')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 662
    Top = 148
  end
  object srcExecutor: TDataSource
    AutoEdit = False
    DataSet = dsExecutor
    Left = 677
    Top = 158
  end
  object srcWORKAREA: TDataSource
    DataSet = dsWORKAREA
    Left = 651
    Top = 88
  end
  object dsWORKAREA: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from WORKAREA'
      'order by NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 640
    Top = 76
    oFetchAll = True
  end
  object dsWORKGROUP: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '    s.WG_ID,'
      '    s.name as wg_name,'
      '    a.name as wa_name'
      'from workgroups s'
      '   inner join workarea a on (s.wa_id = a.wa_id)'
      'order by 2,3')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 736
    Top = 131
    oFetchAll = True
  end
  object srcWORKGROUP: TDataSource
    DataSet = dsWORKGROUP
    Left = 740
    Top = 152
  end
  object srcANALYS: TDataSource
    DataSet = dsANALYS
    Left = 625
    Top = 241
  end
  object dsANALYS: TpFIBDataSet
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
      'select o.o_name, o.O_id'
      'from objects o'
      'where o.O_TYPE = 14 and o.o_deleted = 0'
      'order by o.o_name')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 611
    Top = 231
  end
  object dlgOpen: TOpenDialog
    DefaultExt = 'JRF'
    Filter = #1060#1080#1083#1100#1090#1088#1099' '#1079#1072#1103#1074#1086#1082'|*.JRF'
    InitialDir = 'filters'
    Options = [ofHideReadOnly, ofNoChangeDir, ofNoNetworkButton, ofEnableSizing]
    OptionsEx = [ofExNoPlacesBar]
    Left = 614
    Top = 310
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
      'select ORG_ID, ORG_NAME from ORGANIZATION order by ORG_NAME')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 633
    Top = 19
  end
  object srcOrg: TDataSource
    DataSet = dsOrg
    Left = 645
    Top = 30
  end
  object srcMH: TDataSource
    DataSet = dsMH
    Left = 610
    Top = 158
  end
  object dsMH: TpFIBDataSet
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
      
        'select HE_ID, HE_NAME, NOTICE from HEADEND he order by he.he_nam' +
        'e')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 598
    Top = 147
  end
  object dsWorks: TpFIBDataSet
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
      'select '
      '    w.w_id,'
      '    w.name,'
      '    rt.rt_name'
      'from works w'
      '   inner join request_types rt on (w.rq_type = rt.rt_id)'
      'where w.deleted = 0'
      'order by w.name')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 726
    Top = 20
  end
  object srcWorks: TDataSource
    DataSet = dsWorks
    Left = 739
    Top = 30
  end
  object dsResult: TpFIBDataSet
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
      'select '
      '    rt.rt_name,'
      '    rr.name,'
      '    rr.rr_id'
      'from request_results rr'
      '   inner join request_types rt on (rr.rt_id = rt.rt_id)'
      'where deleted = 0'
      'order by rr.name')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 711
    Top = 80
  end
  object srcResult: TDataSource
    DataSet = dsResult
    Left = 724
    Top = 90
  end
  object dsErrors: TpFIBDataSet
    SelectSQL.Strings = (
      'select rt.RQTL_ID, rt.rq_content, t.rt_name'
      'from request_templates rt'
      '  inner join request_types t on (t.rt_id = rt.rq_type)'
      'where (rt.DELETED = 0 or rt.DELETED is null)'
      'order by rt.rq_content')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 774
    Top = 225
  end
  object srcErrors: TDataSource
    DataSet = dsErrors
    Left = 736
    Top = 212
  end
  object srcFilter: TDataSource
    DataSet = RequestsForm.dsFilter
    OnDataChange = srcFilterDataChange
    Left = 223
    Top = 247
  end
  object actlst: TActionList
    Left = 149
    Top = 249
    object actOk: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ShortCut = 16397
      OnExecute = actOkExecute
    end
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'ReqFilter'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Width')
    Left = 28
    Top = 120
  end
end
