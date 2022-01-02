object CustomersFilterForm: TCustomersFilterForm
  Left = 394
  Top = 207
  BorderIcons = [biSystemMenu]
  Caption = #1060#1080#1083#1100#1090#1088
  ClientHeight = 504
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 468
    Width = 607
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      607
      36)
    object SpeedButton1: TSpeedButton
      Left = 6
      Top = 2
      Width = 80
      Height = 30
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 89
      Top = 2
      Width = 80
      Height = 30
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Flat = True
      OnClick = SpeedButton2Click
    end
    object btnClear: TSpeedButton
      Left = 172
      Top = 2
      Width = 80
      Height = 30
      Action = actClear
      Flat = True
    end
    object chkDefaultFilter: TCheckBox
      Left = 255
      Top = 10
      Width = 133
      Height = 17
      Hint = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1101#1090#1086#1090' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      TabOrder = 2
    end
    object bbCancel: TBitBtn
      Left = 523
      Top = 2
      Width = 75
      Height = 30
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object bbOk: TBitBtn
      Left = 386
      Top = 2
      Width = 131
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = bbOkClick
    end
  end
  object pgcFilter: TPageControl
    Left = 0
    Top = 0
    Width = 607
    Height = 428
    ActivePage = tsFilter
    Align = alClient
    TabOrder = 0
    OnChange = pgcFilterChange
    object tsFilter: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1092#1080#1083#1100#1090#1088
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 599
        Height = 400
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          599
          400)
        object Label19: TLabel
          Left = 8
          Top = 15
          Width = 53
          Height = 13
          Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086
        end
        object lbl3: TLabel
          Left = 192
          Top = 15
          Width = 91
          Height = 13
          Caption = #1088#1072#1074#1085#1086' ('#1089#1086#1076#1077#1088#1078#1080#1090')'
        end
        object grpSrvState: TGroupBox
          Left = 2
          Top = 283
          Width = 592
          Height = 111
          Anchors = [akLeft, akTop, akRight]
          Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1091#1089#1083#1091#1075' '#1080#1083#1080' '#1075#1088#1091#1087#1087' '#1091#1089#1083#1091#1075
          TabOrder = 6
          DesignSize = (
            592
            111)
          object Label8: TLabel
            Left = 425
            Top = 14
            Width = 3
            Height = 13
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object Label9: TLabel
            Left = 6
            Top = 22
            Width = 54
            Height = 13
            Caption = #1057#1086#1089#1090#1086#1103#1085#1080#1077
          end
          object Label10: TLabel
            Left = 19
            Top = 52
            Width = 35
            Height = 13
            Caption = #1059#1089#1083#1091#1075#1072
          end
          object lbl7: TLabel
            Left = 19
            Top = 83
            Width = 50
            Height = 13
            Caption = #1042#1080#1076' '#1091#1089#1083#1091#1075
          end
          object lbl9: TLabel
            Left = 19
            Top = 68
            Width = 24
            Height = 13
            Caption = ' '#1080#1083#1080' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object DBLookupComboboxEh1: TDBLookupComboboxEh
            Left = 75
            Top = 49
            Width = 507
            Height = 21
            Hint = '- '#1077#1089#1083#1080' '#1085#1077' '#1091#1082#1072#1079#1072#1090#1100', '#1090#1086' '#1091#1095#1080#1090#1099#1074#1072#1102#1090#1089#1103' '#1074#1089#1077' '#1072#1073#1086#1085#1077#1085#1090#1089#1082#1080#1077' '#1091#1089#1083#1091#1075#1080
            Anchors = [akLeft, akTop, akRight]
            DynProps = <>
            DataField = 'SERV_ID'
            DataSource = srcFilter
            DropDownBox.AutoDrop = True
            DropDownBox.Sizable = True
            EmptyDataInfo.Text = #1059#1089#1083#1091#1075#1072', '#1077#1089#1083#1080' '#1085#1077' '#1091#1082#1072#1079#1072' '#1089#1084#1086#1090#1088#1080#1084' '#1085#1072' '#1042#1080#1076' '#1091#1089#1083#1091#1075
            EditButtons = <>
            KeyField = 'SERVICE_ID'
            ListField = 'NAME'
            ListSource = srcServices
            ShowHint = True
            TabOrder = 1
            Visible = True
          end
          object DBComboBoxEh1: TDBComboBoxEh
            Left = 75
            Top = 19
            Width = 507
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'STATE_1'
            DataSource = srcFilter
            DynProps = <>
            DropDownBox.Rows = 8
            DropDownBox.Sizable = True
            EmptyDataInfo.Text = #1057#1086#1089#1090#1086#1103#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
            EditButtons = <>
            Items.Strings = (
              ''
              '1. '#1055#1088#1077#1076#1086#1089#1090#1072#1074#1083#1103#1083#1072#1089#1100
              '2. '#1055#1086#1076#1082#1083#1102#1095#1077#1085
              '3. '#1054#1090#1082#1083#1102#1095#1077#1085' ( '#1079#1072' '#1085#1077#1091#1087#1083#1072#1090#1091' '#1080' '#1087#1086' '#1079#1072#1103#1074#1083#1077#1085#1080#1102' )'
              '4. '#1054#1090#1082#1083#1102#1095#1077#1085' '#1079#1072' '#1085#1077#1091#1087#1083#1072#1090#1091
              '5. '#1054#1090#1082#1083#1102#1095#1077#1085' '#1087#1086' '#1079#1072#1103#1074#1083#1077#1085#1080#1102
              '6. '#1053#1077' '#1087#1088#1077#1076#1086#1089#1090#1072#1074#1083#1103#1083#1072#1089#1100
              '7. '#1040#1074#1090#1086#1073#1083#1086#1082#1080#1088#1086#1074#1082#1072
              '8. '#1057#1085#1103#1090#1080#1077' '#1073#1083#1086#1082#1080#1088#1086#1074#1082#1080
              '9. '#1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1090#1086#1083#1100#1082#1086' '#1082' '#1074#1099#1073#1088#1072#1085#1085#1086#1081' '#1091#1089#1083#1091#1075#1077)
            KeyItems.Strings = (
              '0'
              '1'
              '2'
              '8'
              '3'
              '4'
              '5'
              '6'
              '7'
              '9')
            ShowHint = True
            TabOrder = 0
            Visible = True
          end
          object cbbSrvTypes: TDBLookupComboboxEh
            Left = 75
            Top = 80
            Width = 507
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DynProps = <>
            DataField = 'srvTypes'
            DataSource = srcFilter
            EmptyDataInfo.Text = #1042#1080#1076' '#1091#1089#1083#1091#1075#1080
            EditButtons = <>
            KeyField = 'ID'
            ListField = 'NAME'
            ListSource = dmMain.srcSrvTypes
            ShowHint = True
            TabOrder = 2
            Visible = True
          end
        end
        object grpDolg: TGroupBox
          Left = 2
          Top = 191
          Width = 592
          Height = 86
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 5
          object lblBalance: TLabel
            Left = 31
            Top = 25
            Width = 28
            Height = 13
            Caption = #1044#1086#1083#1075' '
          end
          object lblFrom: TLabel
            Left = 133
            Top = 25
            Width = 5
            Height = 13
            Caption = 'c'
          end
          object lblto: TLabel
            Left = 221
            Top = 25
            Width = 12
            Height = 13
            Caption = #1087#1086
          end
          object Label3: TLabel
            Left = 303
            Top = 37
            Width = 24
            Height = 13
            Caption = ' '#1080#1083#1080' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object lbl10: TLabel
            Left = 338
            Top = 25
            Width = 116
            Height = 13
            Caption = #1047#1072#1076#1086#1083#1078#1077#1085#1085#1086#1089#1090#1100' '#1073#1086#1083#1077#1077' '
          end
          object lbl11: TLabel
            Left = 536
            Top = 25
            Width = 41
            Height = 13
            Caption = #1084#1077#1089#1103#1094#1077#1074
          end
          object edtSumTo: TDBEditEh
            Left = 235
            Top = 22
            Width = 57
            Height = 21
            DataField = 'DebtTo'
            DataSource = srcFilter
            DynProps = <>
            EditButtons = <>
            ShowHint = True
            TabOrder = 2
            Visible = True
          end
          object DBNumberEditEh1: TDBNumberEditEh
            Left = 142
            Top = 22
            Width = 75
            Height = 21
            DataField = 'DEBT_SUM'
            DataSource = srcFilter
            DynProps = <>
            EditButton.Visible = True
            EditButtons = <>
            ShowHint = True
            TabOrder = 1
            Visible = True
            OnExit = DBNumberEditEh1Exit
          end
          object cbDolgType: TDBComboBoxEh
            Left = 72
            Top = 22
            Width = 55
            Height = 21
            DataField = 'DEBT_SIGN'
            DataSource = srcFilter
            DynProps = <>
            EditButtons = <>
            Items.Strings = (
              '<'
              '<='
              '='
              '>='
              '>'
              '<>'
              #1048#1085#1090#1077#1088#1074#1072#1083)
            KeyItems.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5'
              '6')
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnChange = cbDolgTypeChange
          end
          object chkNoCurrent: TDBCheckBoxEh
            Left = 72
            Top = 47
            Width = 185
            Height = 24
            Caption = #1053#1077' '#1091#1095#1080#1090#1099#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1080#1081' '#1087#1077#1088#1080#1086#1076
            DataField = 'DebtMode'
            DataSource = srcFilter
            DynProps = <>
            TabOrder = 4
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object edtMonth: TDBNumberEditEh
            Left = 459
            Top = 22
            Width = 70
            Height = 21
            DataField = 'MONTH'
            DataSource = srcFilter
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Visible = True
            EditButtons = <>
            ShowHint = True
            TabOrder = 3
            Visible = True
            OnExit = DBNumberEditEh1Exit
          end
          object chkPrepay: TDBCheckBoxEh
            Left = 338
            Top = 47
            Width = 239
            Height = 23
            Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1086#1073#1077#1097#1072#1085#1085#1099#1081' '#1087#1083#1072#1090#1077#1078
            DataField = 'PREPAY'
            DataSource = srcFilter
            DynProps = <>
            TabOrder = 5
          end
        end
        object grpAddress: TGroupBox
          Left = 2
          Top = 47
          Width = 592
          Height = 133
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          DesignSize = (
            592
            133)
          object Label1: TLabel
            Left = 6
            Top = 25
            Width = 31
            Height = 13
            Caption = #1059#1083#1080#1094#1072
          end
          object Label2: TLabel
            Left = 293
            Top = 25
            Width = 41
            Height = 13
            Caption = #8470' '#1076#1086#1084#1072
          end
          object Label13: TLabel
            Left = 444
            Top = 25
            Width = 49
            Height = 13
            Caption = #1050#1074#1072#1088#1090#1080#1088#1072
          end
          object Label6: TLabel
            Left = 6
            Top = 52
            Width = 55
            Height = 13
            Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090
          end
          object Label7: TLabel
            Left = 293
            Top = 52
            Width = 30
            Height = 13
            Caption = #1056#1072#1081#1086#1085
          end
          object lblOgz: TLabel
            Left = 6
            Top = 79
            Width = 66
            Height = 13
            Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
          end
          object lbl4: TLabel
            Left = 6
            Top = 106
            Width = 42
            Height = 13
            Caption = #1059#1095#1072#1089#1090#1086#1082
          end
          object lbl5: TLabel
            Left = 293
            Top = 106
            Width = 30
            Height = 13
            Caption = #1047#1074#1077#1085#1086
          end
          object lbl8: TLabel
            Left = 293
            Top = 79
            Width = 13
            Height = 13
            Caption = #1043#1057
          end
          object cbbSTREET: TDBLookupComboboxEh
            Left = 75
            Top = 22
            Width = 209
            Height = 21
            DynProps = <>
            DataField = 'STREET_ID'
            DataSource = srcFilter
            DropDownBox.Columns = <
              item
                FieldName = 'STREET_NAME'
                Title.Caption = #1059#1083#1080#1094#1072
                Width = 85
              end
              item
                FieldName = 'STREET_CODE'
                Title.Caption = #1082#1086#1076
                Width = 20
              end
              item
                FieldName = 'AREA_NAME'
                Title.Caption = #1056#1072#1081#1086#1085
                Width = 55
              end>
            DropDownBox.ListSourceAutoFilter = True
            DropDownBox.ListSourceAutoFilterAllColumns = True
            DropDownBox.AutoDrop = True
            DropDownBox.ShowTitles = True
            DropDownBox.Sizable = True
            EmptyDataInfo.Text = #1059#1083#1080#1094#1072
            EditButtons = <>
            KeyField = 'STREET_ID'
            ListField = 'STREET_NAME'
            ListSource = srcStreets
            ShowHint = True
            Style = csDropDownEh
            TabOrder = 0
            Visible = True
            OnEnter = cbbSTREETEnter
            OnExit = checkAdressSign
          end
          object cbxHouseNo: TDBLookupComboboxEh
            Left = 338
            Top = 22
            Width = 101
            Height = 21
            DynProps = <>
            DataField = 'HOUSE_ID'
            DataSource = srcFilter
            DropDownBox.AutoDrop = True
            DropDownBox.Sizable = True
            EmptyDataInfo.Text = #1044#1086#1084
            EditButtons = <>
            KeyField = 'HOUSE_ID'
            ListField = 'HOUSE_NO'
            ListSource = srcHomes
            ShowHint = True
            TabOrder = 1
            Visible = True
            OnExit = checkAdressSign
          end
          object cbbAREA: TDBLookupComboboxEh
            Left = 75
            Top = 49
            Width = 209
            Height = 21
            DynProps = <>
            DataField = 'AREA_ID'
            DataSource = srcFilter
            DropDownBox.AutoDrop = True
            DropDownBox.Sizable = True
            EmptyDataInfo.Text = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
            EditButtons = <>
            KeyField = 'AREA_ID'
            ListField = 'AREA_NAME'
            ListSource = srcArea
            ShowHint = True
            TabOrder = 3
            Visible = True
            OnChange = cbbAREAChange
            OnExit = checkAdressSign
          end
          object DBLookupComboBox2: TDBLookupComboboxEh
            Left = 338
            Top = 49
            Width = 244
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
            EmptyDataInfo.Text = #1056#1072#1081#1086#1085
            EditButtons = <>
            KeyField = 'SUBAREA_ID'
            ListField = 'SUBAREA_NAME'
            ListSource = srcSubArea
            ShowHint = True
            TabOrder = 4
            Visible = True
            OnExit = checkAdressSign
          end
          object DBEditEh1: TDBEditEh
            Left = 499
            Top = 22
            Width = 83
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'FLAT_NO'
            DataSource = srcFilter
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1050#1074#1072#1088#1090#1080#1088#1072
            ShowHint = True
            TabOrder = 2
            Visible = True
          end
          object cbbOgz: TDBLookupComboboxEh
            Left = 75
            Top = 76
            Width = 209
            Height = 21
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
            DropDownBox.ShowTitles = True
            DropDownBox.Sizable = True
            EmptyDataInfo.Text = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
            EditButtons = <>
            KeyField = 'ORG_ID'
            ListField = 'ORG_NAME'
            ListSource = srcOrg
            ShowHint = True
            TabOrder = 5
            Visible = True
            OnExit = checkAdressSign
          end
          object cbb1: TDBLookupComboboxEh
            Left = 75
            Top = 103
            Width = 209
            Height = 21
            DynProps = <>
            DataField = 'WORKAREA'
            DataSource = srcFilter
            DropDownBox.AutoDrop = True
            EmptyDataInfo.Text = #1059#1095#1072#1089#1090#1086#1082
            EditButtons = <>
            KeyField = 'WA_ID'
            ListField = 'NAME'
            ListSource = srcWORKAREA
            ShowHint = True
            TabOrder = 7
            Visible = True
            OnExit = checkAdressSign
          end
          object cbb2: TDBLookupComboboxEh
            Left = 338
            Top = 103
            Width = 244
            Height = 21
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
            EmptyDataInfo.Text = #1047#1074#1077#1085#1086
            EditButtons = <>
            KeyField = 'WG_ID'
            ListField = 'WG_NAME'
            ListSource = srcWORKGROUP
            ShowHint = True
            TabOrder = 8
            Visible = True
            OnExit = checkAdressSign
          end
          object cbbMH: TDBLookupComboboxEh
            Left = 338
            Top = 76
            Width = 244
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DynProps = <>
            DataField = 'MAINHEAD'
            DataSource = srcFilter
            DropDownBox.AutoFitColWidths = False
            DropDownBox.Columns = <
              item
                FieldName = 'HE_NAME'
              end
              item
                FieldName = 'NOTICE'
                Width = 20
              end>
            DropDownBox.Options = []
            DropDownBox.AutoDrop = True
            DropDownBox.Sizable = True
            EmptyDataInfo.Text = #1043#1086#1083#1086#1074#1085#1072#1103' '#1089#1090#1072#1085#1094#1080#1103
            EditButtons = <>
            KeyField = 'HE_ID'
            ListField = 'HE_NAME'
            ListSource = srcMH
            ShowHint = True
            TabOrder = 6
            Visible = True
            OnExit = checkAdressSign
          end
        end
        object dbACCOUNT: TDBEditEh
          Left = 288
          Top = 12
          Width = 306
          Height = 21
          Hint = 
            #1074#1086#1079#1084#1086#1078#1085#1086' '#1079#1072#1076#1072#1074#1072#1090#1100' '#1096#1072#1073#1083#1086#1085' '#1087#1086#1080#1089#1082#1072' '#1095#1077#1088#1077#1079' '#1089#1080#1084#1074#1086#1083' %'#13#10#1085#1072#1087#1088#1080#1084#1077#1088' 2% - '#1074#1099 +
            #1076#1072#1089#1090' '#1074#1089#1077' '#1083#1080#1094#1077#1074#1099#1077' '#1085#1072#1095#1080#1085#1072#1102#1097#1080#1077#1089#1103' '#1089' 2'#13#10#1077#1089#1083#1080' '#1089#1087#1080#1089#1086#1082', '#1090#1086' '#1088#1072#1079#1076#1077#1083#1103#1077#1090#1089#1103' '#1079 +
            #1072#1087#1103#1090#1086#1081' '#1073#1077#1079' '#1087#1088#1086#1073#1077#1083#1086#1074' 1,2,3,4  ...'
          Anchors = [akLeft, akTop, akRight]
          DataField = 'SFLTR_TEXT'
          DataSource = srcFilter
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1047#1085#1072#1095#1077#1085#1080#1077'. % - '#1083#1102#1073#1086#1081' '#1089#1080#1084#1074#1086#1083
          ShowHint = True
          TabOrder = 1
          Visible = True
        end
        object cbSF_TYPE: TDBComboBoxEh
          Left = 77
          Top = 12
          Width = 111
          Height = 19
          DataField = 'SFLTR_TYPE'
          DataSource = srcFilter
          DynProps = <>
          DropDownBox.Rows = 12
          EmptyDataInfo.Text = #1043#1076#1077' '#1080#1097#1077#1084' '#1079#1085#1072#1095#1077#1085#1080#1077
          EditButtons = <>
          Flat = True
          Items.Strings = (
            ''
            #1044#1086#1075#1086#1074#1086#1088
            #1051#1080#1094#1077#1074#1086#1081
            #1050#1086#1076' '#1080#1083#1080' '#1089#1087#1080#1089#1086#1082' '#1050#1086#1076#1086#1074
            #1060#1072#1084#1080#1083#1080#1103
            #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            #1058#1077#1083#1077#1092#1086#1085
            #1044#1077#1082#1086#1076#1077#1088
            'IP'
            'MAC'
            #1048#1053#1053'/'#1059#1053#1055' '#1070#1088'. '#1083#1080#1094#1072
            'CUSTOMER_ID '#1080#1083#1080' '#1089#1087#1080#1089#1086#1082' ID')
          KeyItems.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '9'
            '10'
            '11'
            '15'
            '7')
          ShowHint = True
          TabOrder = 0
          Visible = True
        end
        object cbAdress: TDBCheckBoxEh
          Left = 10
          Top = 39
          Width = 176
          Height = 17
          Caption = #1042#1082#1083#1102#1095#1072#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1072#1076#1088#1077#1089#1091
          DataField = 'CHECK_ADRESS'
          DataSource = srcFilter
          DynProps = <>
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object cbDolg: TDBCheckBoxEh
          Left = 10
          Top = 185
          Width = 176
          Height = 17
          Caption = #1042#1082#1083#1102#1095#1072#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1073#1072#1083#1072#1085#1089#1091
          DataField = 'CHECK_DEBT'
          DataSource = srcFilter
          DynProps = <>
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
    object tsExtend: TTabSheet
      Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 3
      DesignSize = (
        599
        400)
      object Label11: TLabel
        Left = 12
        Top = 134
        Width = 69
        Height = 13
        Caption = #1058#1080#1087' '#1072#1090#1088#1080#1073#1091#1090#1072
      end
      object lbl12: TLabel
        Left = 248
        Top = 15
        Width = 40
        Height = 13
        Caption = #1085#1072' '#1076#1072#1090#1091
      end
      object Label12: TLabel
        Left = 248
        Top = 37
        Width = 40
        Height = 13
        Caption = #1085#1072' '#1076#1072#1090#1091
      end
      object lbl1: TLabel
        Left = 248
        Top = 85
        Width = 131
        Height = 13
        Caption = #1054#1090#1082#1083#1102#1095#1077#1085#1099' '#1073#1086#1083#1077#1077' '#1061' '#1076#1085#1077#1081
      end
      object lbl14: TLabel
        Left = 12
        Top = 206
        Width = 59
        Height = 13
        Caption = #1058#1080#1087' '#1092#1072#1081#1083#1086#1074
      end
      object lbl15: TLabel
        Left = 248
        Top = 110
        Width = 128
        Height = 13
        Caption = #1053#1077' '#1087#1083#1072#1090#1080#1083#1080' '#1073#1086#1083#1077#1077' '#1061' '#1076#1085#1077#1081
      end
      object EDTAttrValue: TDBEditEh
        Left = 12
        Top = 180
        Width = 362
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ATTRIB_VALUE'
        DataSource = srcFilter
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1047#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072
        ShowHint = True
        TabOrder = 13
        Visible = True
      end
      object cbAttribute: TDBLookupComboboxEh
        Left = 126
        Top = 153
        Width = 248
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'CUST_ATTRIBUTE'
        DataSource = srcFilter
        DropDownBox.AutoDrop = True
        EmptyDataInfo.Text = #1040#1090#1088#1080#1073#1091#1090
        EditButtons = <>
        KeyField = 'O_ID'
        ListField = 'O_NAME'
        ListSource = srcAttributes
        ShowHint = True
        TabOrder = 12
        Visible = True
        OnChange = cbAttributeChange
      end
      object DBCheckBoxEh1: TDBCheckBoxEh
        Left = 126
        Top = 134
        Width = 97
        Height = 16
        Caption = #1053#1077' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085
        DataField = 'CUST_NOT_ATTRIBUTE'
        DataSource = srcFilter
        DynProps = <>
        TabOrder = 11
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object JURCHEK: TDBCheckBoxEh
        Left = 12
        Top = 110
        Width = 215
        Height = 16
        Hint = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1077' '#1083#1080#1094#1072
        AllowGrayed = True
        Caption = #1070#1088'. '#1083#1080#1094#1072
        DataField = 'JURIDICAL'
        DataSource = srcFilter
        DynProps = <>
        TabOrder = 8
        OnExit = JURCHEKExit
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox21: TDBCheckBoxEh
        Left = 12
        Top = 86
        Width = 215
        Height = 13
        Caption = #1055#1086#1074#1090#1086#1088#1103#1102#1090#1089#1103' '#1072#1076#1088#1077#1089#1072
        DataField = 'DoubleAddress'
        DataSource = srcFilter
        DynProps = <>
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox17: TDBCheckBoxEh
        Left = 12
        Top = 61
        Width = 215
        Height = 13
        Caption = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072' > '#1076#1072#1090#1099' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
        DataField = 'INVALID_CONTRACT_DATE'
        DataSource = srcFilter
        DynProps = <>
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCheckBox7: TDBCheckBoxEh
        Left = 12
        Top = 12
        Width = 236
        Height = 16
        Caption = #1058#1086#1083#1100#1082#1086' '#1082#1083#1080#1077#1085#1090#1099', '#1080#1084#1077#1102#1097#1080#1077' '#1089#1082#1080#1076#1082#1091
        DataField = 'DISCOUNT_FACTOR_SGN'
        DataSource = srcFilter
        DynProps = <>
        TabOrder = 0
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object grpDogovor: TGroupBox
        Left = 390
        Top = 144
        Width = 204
        Height = 67
        Anchors = [akTop, akRight]
        TabOrder = 15
        object DBCheckBox15: TDBCheckBoxEh
          Left = 34
          Top = 15
          Width = 151
          Height = 17
          Caption = #1055#1088#1077#1088#1074#1072#1074#1096#1080#1077' '#1076#1086#1075#1086#1074#1086#1088
          DataField = 'VALID_TO_OFF'
          DataSource = srcFilter
          DynProps = <>
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox16: TDBCheckBoxEh
          Left = 34
          Top = 40
          Width = 151
          Height = 17
          Caption = #1053#1077' '#1087#1088#1077#1088#1074#1072#1074#1096#1080#1077' '#1076#1086#1075#1086#1074#1086#1088
          DataField = 'VALID_TO_ON'
          DataSource = srcFilter
          DynProps = <>
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object grpAddon: TGroupBox
        Left = 2
        Top = 253
        Width = 592
        Height = 147
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 19
        DesignSize = (
          592
          147)
        object Label4: TLabel
          Left = 10
          Top = 22
          Width = 64
          Height = 13
          Caption = #1047#1072' '#1087#1077#1088#1080#1086#1076' '#1089':'
        end
        object Label5: TLabel
          Left = 211
          Top = 22
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object Label15: TLabel
          Left = 10
          Top = 46
          Width = 62
          Height = 13
          Caption = #1055#1086#1076#1082#1083'/'#1054#1090#1082#1083
        end
        object Label16: TLabel
          Left = 10
          Top = 95
          Width = 45
          Height = 13
          Caption = #1055#1083#1072#1090#1077#1078#1080
        end
        object lbl6: TLabel
          Left = 10
          Top = 70
          Width = 78
          Height = 13
          Caption = #1056#1072#1079#1086#1074#1072#1103' '#1091#1089#1083#1091#1075#1072
        end
        object DBCheckBox19: TDBCheckBoxEh
          Left = 388
          Top = 19
          Width = 33
          Height = 21
          Anchors = [akTop, akRight]
          Caption = #1053#1077
          DataField = 'LETTERS_NOT_SEND'
          DataSource = srcFilter
          DynProps = <>
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox25: TDBCheckBoxEh
          Left = 422
          Top = 19
          Width = 153
          Height = 21
          Anchors = [akTop, akRight]
          Caption = #1054#1090#1089#1099#1083#1072#1083#1080#1089#1100' '#1087#1080#1089#1100#1084#1072' '#1090#1080#1087#1072
          DataField = 'LETTERS_SEND'
          DataSource = srcFilter
          DynProps = <>
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBLookupComboboxEh2: TDBLookupComboboxEh
          Left = 388
          Top = 43
          Width = 195
          Height = 21
          Anchors = [akTop, akRight]
          DynProps = <>
          DataField = 'LETTERS_TYPE'
          DataSource = srcFilter
          DropDownBox.AutoDrop = True
          DropDownBox.Sizable = True
          EmptyDataInfo.Text = #1050#1072#1082#1080#1077' '#1087#1080#1089#1100#1084#1072
          EditButtons = <>
          KeyField = 'LETTERTYPEID'
          ListField = 'LETTERTYPEDESCR'
          ListSource = srcLetterType
          ShowHint = True
          TabOrder = 5
          Visible = True
        end
        object DBCheckBox6: TDBCheckBoxEh
          Left = 388
          Top = 68
          Width = 129
          Height = 20
          Anchors = [akTop, akRight]
          Caption = #1047#1072#1082#1083#1102#1095#1072#1083#1080' '#1076#1086#1075#1086#1074#1086#1088
          DataField = 'CONTRACT_DATE_SGN'
          DataSource = srcFilter
          DynProps = <>
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBDateTimeEditEh1: TDBDateTimeEditEh
          Left = 93
          Top = 19
          Width = 110
          Height = 21
          DataField = 'DATE_FROM'
          DataSource = srcFilter
          DynProps = <>
          EditButtons = <>
          Kind = dtkDateEh
          ShowHint = True
          TabOrder = 0
          Visible = True
        end
        object DBDateTimeEditEh2: TDBDateTimeEditEh
          Left = 235
          Top = 19
          Width = 137
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'DATE_TO'
          DataSource = srcFilter
          DynProps = <>
          EditButtons = <>
          Kind = dtkDateEh
          ShowHint = True
          TabOrder = 1
          Visible = True
        end
        object DBComboBoxEh2: TDBComboBoxEh
          Left = 93
          Top = 43
          Width = 279
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'ACT_SGN'
          DataSource = srcFilter
          DynProps = <>
          EmptyDataInfo.Text = #1055#1086#1076#1082#1083#1102#1095#1072#1083#1080#1089#1100' / '#1086#1090#1082#1083#1102#1095#1072#1083#1080#1089#1100
          EditButtons = <>
          Items.Strings = (
            ''
            #1055#1086#1076#1082#1083#1102#1095#1080#1083#1080#1089#1100
            #1055#1086#1074#1090#1086#1088#1085#1086' '#1087#1086#1076#1082#1083#1102#1095#1080#1083#1080#1089#1100
            #1054#1090#1082#1083#1102#1095#1080#1083#1080#1089#1100' '#1087#1086' '#1079#1072#1103#1074#1083#1077#1085#1080#1102
            #1054#1090#1082#1083#1102#1095#1080#1083#1080#1089#1100' '#1079#1072' '#1085#1077#1091#1087#1083#1072#1090#1091
            #1055#1086#1087#1072#1083#1080' '#1074' '#1072#1074#1090#1086#1073#1083#1086#1082#1080#1088#1086#1074#1082#1091)
          KeyItems.Strings = (
            ''
            '1'
            '2'
            '3'
            '4'
            '5')
          ShowHint = True
          TabOrder = 4
          Visible = True
        end
        object DBComboBoxEh4: TDBComboBoxEh
          Left = 93
          Top = 94
          Width = 279
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'PAY_SGN'
          DataSource = srcFilter
          DynProps = <>
          EmptyDataInfo.Text = #1041#1099#1083#1080' / '#1085#1077' '#1073#1099#1083#1080' '#1087#1083#1072#1090#1077#1078#1080
          EditButtons = <>
          Items.Strings = (
            ''
            '1. '#1041#1099#1083#1080
            '2. '#1053#1077' '#1073#1099#1083#1080)
          KeyItems.Strings = (
            '0'
            '1'
            '2')
          ShowHint = True
          TabOrder = 8
          Visible = True
        end
        object cbb3: TDBLookupComboboxEh
          Left = 93
          Top = 67
          Width = 279
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          DataField = 'single_id'
          DataSource = srcFilter
          DropDownBox.AutoDrop = True
          DropDownBox.Sizable = True
          EmptyDataInfo.Text = #1050#1072#1082#1072#1103' '#1088#1072#1079#1086#1074#1072#1103' '#1091#1089#1083#1091#1075#1072' '#1073#1099#1083#1072' '#1079#1072' '#1087#1077#1088#1080#1086#1076
          EditButtons = <>
          KeyField = 'SERVICE_ID'
          ListField = 'NAME'
          ListSource = srcSingleServ
          ShowHint = True
          TabOrder = 6
          Visible = True
        end
        object chkMESSGS_NOT_SEND: TDBCheckBoxEh
          Left = 388
          Top = 92
          Width = 33
          Height = 21
          Anchors = [akTop, akRight]
          Caption = #1053#1077
          DataField = 'MSG_NOT'
          DataSource = srcFilter
          DynProps = <>
          TabOrder = 9
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object chkMESSGS_SEND: TDBCheckBoxEh
          Left = 422
          Top = 92
          Width = 153
          Height = 21
          Anchors = [akTop, akRight]
          Caption = #1054#1090#1089#1099#1083#1072#1083#1080#1089#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
          DataField = 'MSG_SEND'
          DataSource = srcFilter
          DynProps = <>
          TabOrder = 10
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object chkBirthday: TDBCheckBoxEh
          Left = 93
          Top = 120
          Width = 172
          Height = 21
          Caption = #1087#1088#1072#1079#1076#1085#1091#1102#1090' '#1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103
          DataField = 'BIRTHDAY'
          DataSource = srcFilter
          DynProps = <>
          TabOrder = 11
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object chkBIRTHDAY10: TDBCheckBoxEh
          Left = 271
          Top = 120
          Width = 106
          Height = 21
          Hint = #1091' '#1082#1086#1075#1086' '#1102#1073#1080#1083#1077#1081' '#1074' '#1101#1090#1086#1090' '#1087#1077#1088#1080#1086#1076
          Caption = #1070#1073#1080#1083#1077#1081' ('#1093'5, '#1093'0)'
          DataField = 'BIRTHDAY'
          DataSource = srcFilter
          DynProps = <>
          TabOrder = 12
          ValueChecked = '2'
          ValueUnchecked = '0'
        end
        object cbFEE: TDBComboBoxEh
          Left = 388
          Top = 120
          Width = 195
          Height = 21
          Anchors = [akTop, akRight]
          DataField = 'beFee'
          DataSource = srcFilter
          DynProps = <>
          EmptyDataInfo.Text = #1053#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1079#1072' '#1087#1077#1088#1080#1086#1076
          EditButtons = <>
          Items.Strings = (
            #1041#1099#1083#1080' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
            #1053#1077' '#1073#1099#1083#1086' '#1085#1072#1095#1089#1080#1083#1077#1085#1080#1081)
          KeyItems.Strings = (
            '1'
            '2')
          ShowHint = True
          TabOrder = 13
          Visible = True
        end
      end
      object chkbDogovor: TDBCheckBoxEh
        Left = 390
        Top = 136
        Width = 186
        Height = 17
        Anchors = [akTop, akRight]
        Caption = #1042#1082#1083#1102#1095#1072#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1076#1086#1075#1086#1074#1086#1088#1072#1084
        DataField = 'VALID_TO_SGN'
        DataSource = srcFilter
        DynProps = <>
        TabOrder = 14
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object chkPERS_TARIF: TDBCheckBoxEh
        Left = 12
        Top = 34
        Width = 236
        Height = 16
        Caption = #1050#1083#1080#1077#1085#1090#1099' '#1080#1084#1077#1102#1097#1080#1077' '#1087#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1081' '#1090#1072#1088#1080#1092
        DataField = 'PERS_TARIF'
        DataSource = srcFilter
        DynProps = <>
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object edtDiscDate: TDBDateTimeEditEh
        Left = 300
        Top = 12
        Width = 285
        Height = 21
        Hint = #1045#1089#1083#1080' '#1091#1082#1072#1079#1072#1090#1100' '#1076#1072#1090#1091', '#1090#1086' '#1074#1099#1073#1086#1088#1082#1072' '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1101#1090#1086#1081' '#1076#1072#1090#1099', '#1080#1085#1072#1095#1077' '#1074#1089#1077
        Anchors = [akLeft, akTop, akRight]
        DataField = 'DISCOUNT_DATE'
        DataSource = srcFilter
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object edtPersDate: TDBDateTimeEditEh
        Left = 300
        Top = 34
        Width = 285
        Height = 21
        Hint = #1045#1089#1083#1080' '#1091#1082#1072#1079#1072#1090#1100' '#1076#1072#1090#1091', '#1090#1086' '#1074#1099#1073#1086#1088#1082#1072' '#1090#1086#1083#1100#1082#1086' '#1076#1083#1103' '#1101#1090#1086#1081' '#1076#1072#1090#1099', '#1080#1085#1072#1095#1077' '#1074#1089#1077
        Anchors = [akLeft, akTop, akRight]
        DataField = 'PERS_TARIF_DATE'
        DataSource = srcFilter
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 3
        Visible = True
      end
      object dbchkHiden: TDBCheckBox
        Left = 390
        Top = 59
        Width = 97
        Height = 17
        Hint = #1058#1086#1083#1100#1082#1086' '#1089#1082#1088#1099#1090#1099#1077' '#1072#1073#1086#1085#1077#1085#1090#1099
        Caption = #1058#1086#1083#1100#1082#1086' '#1076#1088#1091#1079#1100#1103
        DataField = 'SUPERMODE'
        DataSource = srcFilter
        TabOrder = 6
      end
      object edtOFFDAYS: TDBNumberEditEh
        Left = 390
        Top = 82
        Width = 97
        Height = 21
        Hint = #1054#1090#1082#1083#1102#1095#1077#1085' '#1086#1090' '#1074#1089#1077#1093' '#1091#1089#1083#1091#1075' '#1073#1086#1083#1077#1077' '#1091#1082#1072#1079#1072#1085#1085#1086#1075#1086' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1076#1085#1077#1081
        DataField = 'OFFDAYS'
        DataSource = srcFilter
        DecimalPlaces = 0
        DynProps = <>
        EmptyDataInfo.Text = #1050#1086#1083'-'#1074#1086' '#1076#1085#1077#1081
        EditButtons = <>
        ShowHint = True
        TabOrder = 9
        Visible = True
      end
      object chkAddon: TDBCheckBoxEh
        Left = 12
        Top = 249
        Width = 176
        Height = 17
        Caption = #1042#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1087#1077#1088#1080#1086#1076#1091
        DataField = 'PERIOD_SGN'
        DataSource = srcFilter
        DynProps = <>
        TabOrder = 18
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object chkCUST_NOT_ATTRIBUTE: TDBCheckBoxEh
        Left = 126
        Top = 205
        Width = 97
        Height = 16
        Hint = #1045#1089#1083#1080' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090' '#1091' '#1072#1073#1086#1085#1077#1085#1090#1072' '#1090#1080#1087' '#1092#1072#1081#1083#1086#1074' '#1091#1082#1072#1079#1072#1085#1085#1099#1081' '#1085#1080#1078#1077
        Caption = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
        DataField = 'FILE_TYPE_EXCLUDE'
        DataSource = srcFilter
        DynProps = <>
        TabOrder = 16
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object cbbFileType: TDBLookupComboboxEh
        Left = 12
        Top = 222
        Width = 362
        Height = 21
        Hint = #1045#1089#1083#1080' '#1076#1072#1085#1085#1099#1081' '#1090#1080#1087' '#1092#1072#1081#1083#1086#1074' '#1077#1089#1090#1100' '#1091' '#1072#1073#1086#1085#1077#1085#1090#1072
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'FILE_TYPE'
        DataSource = srcFilter
        DropDownBox.AutoDrop = True
        EmptyDataInfo.Text = #1040#1090#1088#1080#1073#1091#1090
        EditButtons = <>
        KeyField = 'O_ID'
        ListField = 'O_NAME'
        ListSource = srcFileType
        ShowHint = True
        TabOrder = 17
        Visible = True
      end
      object edtNOTPAY: TDBNumberEditEh
        Left = 390
        Top = 107
        Width = 97
        Height = 21
        Hint = #1054#1090#1082#1083#1102#1095#1077#1085' '#1086#1090' '#1074#1089#1077#1093' '#1091#1089#1083#1091#1075' '#1073#1086#1083#1077#1077' '#1091#1082#1072#1079#1072#1085#1085#1086#1075#1086' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072' '#1076#1085#1077#1081
        DataField = 'NOTPAYDAYS'
        DataSource = srcFilter
        DecimalPlaces = 0
        DynProps = <>
        EmptyDataInfo.Text = #1050#1086#1083'-'#1074#1086' '#1076#1085#1077#1081
        EditButtons = <>
        ShowHint = True
        TabOrder = 10
        Visible = True
      end
      object cbbATTRTYPE: TDBComboBoxEh
        Left = 12
        Top = 153
        Width = 108
        Height = 21
        DataField = 'ATTRTYPE'
        DataSource = srcFilter
        DynProps = <>
        EmptyDataInfo.Text = #1058#1080#1087' '#1072#1090#1088#1080#1073#1091#1090#1072
        EditButtons = <>
        Items.Strings = (
          #1040#1073#1086#1085#1077#1085#1090#1072' '#1072#1090#1088#1080#1073#1091#1090#1099
          #1044#1086#1084#1086#1074' '#1072#1090#1088#1080#1073#1091#1090#1099
          #1057#1077#1090#1077#1074#1086#1075#1086' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103' '#1072#1090#1088#1080#1073#1091#1090#1099
          #1058#1042' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103' '#1072#1090#1088#1080#1073#1091#1090#1099
          #1059#1079#1083#1086#1074' '#1072#1090#1088#1080#1073#1091#1090#1099
          #1059#1089#1083#1091#1075' '#1072#1090#1088#1080#1073#1091#1090#1099)
        KeyItems.Strings = (
          '4'
          '37'
          '5'
          '6'
          '39'
          '25')
        ShowHint = True
        TabOrder = 20
        Visible = True
        OnChange = cbbATTRTYPEChange
      end
      object chkHandControl: TDBCheckBoxEh
        Left = 248
        Top = 61
        Width = 138
        Height = 13
        Caption = #1056#1091#1095#1085#1086#1077' '#1091#1087#1088#1072#1074#1083#1077#1085#1080#1077
        DataField = 'HANDCONTROL'
        DataSource = srcFilter
        DynProps = <>
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object chkDebtLow: TDBCheckBoxEh
        Left = 390
        Top = 224
        Width = 204
        Height = 18
        Anchors = [akTop, akRight]
        Caption = #1053#1077' '#1093#1074#1072#1090#1072#1077#1090' '#1076#1077#1085#1077#1075' '#1085#1072' '#1089#1083#1077#1076'. '#1087#1077#1088#1080#1086#1076
        DataField = 'debtLow'
        DataSource = srcFilter
        DynProps = <>
        TabOrder = 21
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object tsList: TTabSheet
      Caption = ' '#1060#1080#1083#1100#1090#1088' '#1087#1086' '#1089#1087#1080#1089#1082#1091' '#1079#1085#1072#1095#1077#1085#1080#1081
      ImageIndex = 1
      object dbmAcounts: TDBMemoEh
        Left = 0
        Top = 34
        Width = 599
        Height = 366
        ScrollBars = ssVertical
        Align = alClient
        AutoSize = False
        DataField = 'ListValues'
        DataSource = srcFilter
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = 
          #1042#1085#1077#1089#1080#1090#1077' '#1089#1087#1080#1089#1086#1082' '#1079#1085#1072#1095#1077#1085#1080#1081' ('#1095#1077#1088#1077#1079' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1080'  '#39','#39' '#1080' '#39';'#39' '#1080#1083#1080' '#1085#1086#1074#1072#1103' ' +
          #1089#1090#1088#1086#1082#1072' ) '#1042#1085#1080#1084#1072#1085#1080#1077', '#1092#1080#1083#1100#1090#1088' '#1084#1086#1078#1077#1090' '#1086#1090#1088#1072#1073#1072#1090#1099#1074#1072#1090#1100' '#1076#1086#1083#1075#1086'!'#13#10
        ShowHint = True
        TabOrder = 0
        Visible = True
        WantReturns = True
      end
      object pnlTopList: TPanel
        Left = 0
        Top = 0
        Width = 599
        Height = 34
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          599
          34)
        object lbl13: TLabel
          Left = 7
          Top = 10
          Width = 73
          Height = 13
          Caption = #1063#1090#1086' '#1074' '#1089#1087#1080#1089#1082#1077' ?'
        end
        object cbbListType: TDBComboBoxEh
          Left = 85
          Top = 7
          Width = 506
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'ListType'
          DataSource = srcFilter
          DynProps = <>
          EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1087#1086' '#1089#1087#1080#1089#1082#1091' '#1095#1077#1075#1086' '#1092#1080#1083#1100#1090#1088#1086#1074#1072#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
          EditButtons = <>
          Items.Strings = (
            #1051#1080#1094#1077#1074#1099#1077' '#1089#1095#1077#1090#1072
            #1050#1086#1076' '#1072#1073#1086#1085#1077#1085#1090#1072
            #1050#1072#1088#1090#1072' '#1076#1086#1089#1090#1091#1087#1072
            #1058#1077#1083#1077#1092#1086#1085
            'IP '#1072#1076#1088#1077#1089
            'MAC '#1072#1076#1088#1077#1089
            #1048#1053#1053'/'#1059#1053#1055' '#1070#1088'. '#1083#1080#1094#1072
            'Customer_id')
          KeyItems.Strings = (
            '0'
            '1'
            '3'
            '6'
            '2'
            '5'
            '7'
            '4')
          ShowHint = True
          TabOrder = 0
          Visible = True
        end
      end
    end
    object tsSQL: TTabSheet
      Caption = 'SQL '#1092#1080#1083#1100#1090#1088
      ImageIndex = 2
      object lbl2: TLabel
        Left = 0
        Top = 0
        Width = 599
        Height = 13
        Align = alTop
        Caption = #1055#1086#1079#1074#1086#1083#1103#1077#1090' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1079#1072#1087#1088#1086#1089' SQL '#1076#1083#1103' '#1091#1089#1090#1072#1085#1086#1074#1082#1080' '#1089#1083#1086#1078#1085#1099#1093' '#1092#1080#1083#1100#1090#1088#1086#1074
      end
      object memSQL: TDBSynEdit
        Left = 0
        Top = 13
        Width = 599
        Height = 387
        DataField = 'SQL_FLTR'
        DataSource = srcFilter
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        Gutter.AutoSize = True
        Gutter.DigitCount = 3
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.ShowLineNumbers = True
        Highlighter = synsqlsyn2
      end
    end
  end
  object pnlFilter: TPanel
    Left = 0
    Top = 428
    Width = 607
    Height = 40
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      607
      40)
    object lblFnew: TLabel
      Left = 237
      Top = 7
      Width = 86
      Height = 26
      Alignment = taRightJustify
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' '#13#10#1091#1089#1083#1086#1074#1080#1077' '#1082#1072#1082
    end
    object lblDelim: TLabel
      Left = 375
      Top = 14
      Width = 4
      Height = 13
      Caption = '/'
    end
    object lblOrAND: TLabel
      Left = 6
      Top = 10
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbnvgr: TDBNavigator
      Left = 443
      Top = 8
      Width = 155
      Height = 25
      DataSource = srcFilter
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
      Anchors = [akTop, akRight]
      TabOrder = 1
      OnClick = dbnvgrClick
    end
    object chkinversion: TDBCheckBoxEh
      Left = 69
      Top = 12
      Width = 117
      Height = 17
      Hint = 
        #1090'.'#1077'. '#1076#1086#1073#1072#1074#1080#1084' '#1086#1090#1088#1080#1094#1072#1085#1080#1077' '#1074' '#1091#1089#1083#1086#1074#1080#1077'.'#13#10#1085#1072#1087#1088#1080#1084#1077#1088' '#1085#1077' '#1078#1080#1074#1077#1090' '#1085#1072' '#1091#1083#1080#1094#1077' '#1051#1077 +
        #1085#1080#1085#1072' '#1074' '#1076#1086#1084#1077' 6'
      Caption = #1048#1085#1074#1077#1088#1089#1080#1103' '#1092#1080#1083#1100#1090#1088#1072
      DataField = 'inversion'
      DataSource = srcFilter
      DynProps = <>
      TabOrder = 3
    end
    object btnAND: TButton
      Left = 330
      Top = 8
      Width = 38
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1077' '#1048' ( '#1076#1086#1087#1086#1083#1085#1103#1102#1097#1077#1077' '#1090#1077#1082#1091#1097#1077#1077' )'
      Caption = #1048
      TabOrder = 2
      OnClick = btnANDClick
    end
    object btnOR: TButton
      Left = 386
      Top = 8
      Width = 39
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1077' '#1048#1051#1048' ('#1090#1077#1082#1091#1097#1077#1077' '#1048#1051#1048' '#1085#1086#1074#1086#1077' '#1091#1089#1083#1086#1074#1080#1077')'
      Caption = #1048#1051#1048
      TabOrder = 0
      OnClick = btnORClick
    end
  end
  object srcFilter: TDataSource
    DataSet = CustomersForm.dsFilter
    OnDataChange = srcFilterDataChange
    Left = 166
    Top = 333
  end
  object srcStreets: TDataSource
    DataSet = dsStreets
    Left = 317
    Top = 304
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
      'where ((s.area_id = :area_id) or (:area_id is null))        '
      '  order by STREET_NAME, a.area_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 504
    Top = 40
    oFetchAll = True
  end
  object srcHomes: TDataSource
    DataSet = dsHomes
    Left = 737
    Top = 70
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
    Left = 724
    Top = 60
    oFetchAll = True
  end
  object srcServices: TDataSource
    DataSet = dsServices
    Left = 694
    Top = 181
  end
  object dsServices: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    c.Service_Id'
      
        '  , c.Name || coalesce('#39' ('#39' || c.Shortname || '#39')'#39', '#39#39') || coales' +
        'ce('#39' ='#39' || t.Tarif_Sum, '#39#39') NAME'
      '  from SERVices C'
      
        '       left outer join tarif t on (t.Service_Id = c.Service_Id a' +
        'nd'
      '             current_date between t.Date_From and t.Date_To)'
      '  where C.SRV_TYPE_ID = 0'
      '  order by c.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 681
    Top = 173
    oFetchAll = True
  end
  object srcArea: TDataSource
    DataSet = dsArea
    Left = 694
    Top = 229
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
    Left = 681
    Top = 221
    oFetchAll = True
  end
  object srcSubArea: TDataSource
    DataSet = dsSubArea
    Left = 694
    Top = 256
  end
  object dsSubArea: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT s.subarea_id, s.subarea_name, a.area_name'
      'FROM subarea s left outer join area a on (a.area_id = s.area_id)'
      'ORDER BY subarea_name, a.area_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 681
    Top = 248
    oFetchAll = True
  end
  object srcLetterType: TDataSource
    DataSet = dsLetterType
    Left = 694
    Top = 304
  end
  object dsLetterType: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT LETTERTYPEID, LETTERTYPEDESCR'
      'FROM LETTERTYPE l'
      'where l.RECORDINDB>0'
      'order by l.LETTERTYPEDESCR')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 681
    Top = 296
    oFetchAll = True
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'JCF'
    Filter = #1060#1080#1083#1100#1090#1088#1099' '#1087#1086' '#1072#1073#1086#1085#1077#1085#1090#1072#1084'|*.JCF'
    InitialDir = 'filters'
    Options = [ofHideReadOnly, ofNoChangeDir, ofNoNetworkButton, ofEnableSizing]
    OptionsEx = [ofExNoPlacesBar]
    Left = 315
    Top = 314
  end
  object srcSingleServ: TDataSource
    DataSet = dsSingleServ
    Left = 638
    Top = 256
  end
  object dsSingleServ: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    c.Service_Id'
      
        '  , c.Name || coalesce('#39' ('#39' || c.Shortname || '#39')'#39', '#39#39') || coales' +
        'ce('#39' ='#39' || t.Tarif_Sum, '#39#39') NAME'
      '  from SERVices C'
      
        '       left outer join tarif t on (t.Service_Id = c.Service_Id a' +
        'nd'
      '             current_date between t.Date_From and t.Date_To)'
      '  where C.SRV_TYPE_ID <> 0'
      '  order by c.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 625
    Top = 248
    oFetchAll = True
  end
  object srcAttributes: TDataSource
    AutoEdit = False
    DataSet = dsAttributes
    Left = 506
    Top = 322
  end
  object dsAttributes: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION'
      'FROM OBJECTS'
      'WHERE O_TYPE = :ATTRTYPE AND O_DELETED = 0'
      'order BY O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 450
    Top = 307
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
    Left = 671
    Top = 400
  end
  object srcOrg: TDataSource
    DataSet = dsOrg
    Left = 683
    Top = 411
  end
  object synsqlsyn2: TSynSQLSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    Left = 277
    Top = 294
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
    Left = 666
    Top = 107
    oFetchAll = True
  end
  object srcWORKGROUP: TDataSource
    DataSet = dsWORKGROUP
    Left = 679
    Top = 115
  end
  object dsWORKAREA: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from WORKAREA'
      'order by NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 667
    Top = 27
    oFetchAll = True
  end
  object srcWORKAREA: TDataSource
    DataSet = dsWORKAREA
    Left = 686
    Top = 42
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
    Left = 542
    Top = 323
  end
  object srcMH: TDataSource
    DataSet = dsMH
    Left = 610
    Top = 158
  end
  object actlst1: TActionList
    Left = 378
    Top = 320
    object actOk: TAction
      Caption = '&'#1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      SecondaryShortCuts.Strings = (
        'Alt+'#1091
        'Alt+'#1059
        'Alt+E'
        'Alt+e')
      ShortCut = 16397
    end
    object actClear: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      SecondaryShortCuts.Strings = (
        'Ctrl+'#1054
        'Ctrl+O'
        'Ctrl+'#1065)
      ShortCut = 16458
      OnExecute = actClearExecute
    end
  end
  object dsFileType: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '  o.O_ID, o.O_NAME'
      '  from OBJECTS o'
      '  where O_TYPE = 33 and O_DELETED = 0'
      '  order by O_NAME ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 641
    Top = 352
    oFetchAll = True
  end
  object srcFileType: TDataSource
    DataSet = dsFileType
    Left = 686
    Top = 352
  end
  object PropStorageEh1: TPropStorageEh
    Section = 'CustFilter'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Width')
    Left = 524
    Top = 96
  end
end
