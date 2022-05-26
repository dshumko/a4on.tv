object ServiceForm: TServiceForm
  Left = 525
  Top = 243
  ActiveControl = edName
  BorderIcons = [biSystemMenu]
  Caption = #1059#1089#1083#1091#1075#1072
  ClientHeight = 451
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlSrv: TPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 78
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      405
      78)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 73
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object Label2: TLabel
      Left = 8
      Top = 33
      Width = 20
      Height = 13
      Caption = #1050#1086#1076
    end
    object Label6: TLabel
      Left = 165
      Top = 33
      Width = 41
      Height = 13
      Caption = #1045#1076'. '#1080#1079#1084'.'
    end
    object lbl1: TLabel
      Left = 8
      Top = 57
      Width = 56
      Height = 13
      Caption = #1042#1080#1076' '#1091#1089#1083#1091#1075#1080
    end
    object cbShowService: TDBCheckBoxEh
      Left = 294
      Top = 31
      Width = 103
      Height = 17
      Hint = 
        #1045#1089#1083#1080' '#1072#1082#1090#1080#1074#1085#1072', '#1090#1086' '#1077#1089#1090#1100' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1091', '#1077#1089#1083#1080' '#1085#1077#1090' - ' +
        #1085#1077#1090' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1080' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1077#1077' '#1072#1073#1086#1085#1077#1085#1090#1091
      Alignment = taLeftJustify
      Anchors = [akLeft, akRight]
      Caption = #1059#1089#1083#1091#1075#1072' '#1072#1082#1090#1080#1074#1085#1072' '
      DataField = 'SHOW_SERVICE'
      DataSource = srcService
      DynProps = <>
      TabOrder = 3
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object edName: TDBEditEh
      Left = 94
      Top = 5
      Width = 303
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NAME'
      DataSource = srcService
      DynProps = <>
      EditButtons = <>
      MaxLength = 60
      TabOrder = 0
      Visible = True
    end
    object edShortName: TDBEditEh
      Left = 94
      Top = 30
      Width = 60
      Height = 21
      DataField = 'SHORTNAME'
      DataSource = srcService
      DynProps = <>
      EditButtons = <>
      MaxLength = 10
      TabOrder = 1
      Visible = True
    end
    object edDim: TDBEditEh
      Left = 215
      Top = 30
      Width = 48
      Height = 21
      DataField = 'DIMENSION'
      DataSource = srcService
      DynProps = <>
      EditButtons = <>
      MaxLength = 5
      TabOrder = 2
      Visible = True
    end
    object cbBusinessType: TDBLookupComboboxEh
      Left = 94
      Top = 54
      Width = 303
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'BUSINESS_TYPE'
      DataSource = srcService
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = dmMain.srcSrvTypes
      TabOrder = 4
      Visible = True
      OnChange = cbBusinessTypeChange
    end
  end
  object pnlNotice: TPanel
    Left = 0
    Top = 374
    Width = 405
    Height = 36
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 10
    object pgc1: TPageControl
      Left = 0
      Top = 0
      Width = 405
      Height = 36
      ActivePage = tsNotice
      Align = alClient
      TabOrder = 0
      object tsNotice: TTabSheet
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        object mmoDESCRIPTION: TDBMemoEh
          Left = 0
          Top = 0
          Width = 397
          Height = 8
          ScrollBars = ssVertical
          Align = alClient
          AutoSize = False
          DataField = 'NOTE'
          DataSource = srcService
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
          TabOrder = 0
          Visible = True
          WantReturns = True
        end
      end
      object tsWeb: TTabSheet
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086
        ImageIndex = 1
        object pnlNote: TPanel
          Left = 0
          Top = 67
          Width = 397
          Height = 5
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Label4: TLabel
            Left = 0
            Top = 0
            Width = 397
            Height = 13
            Align = alTop
            Caption = ' '#1054#1087#1080#1089#1072#1085#1080#1077' '#1076#1083#1103' '#1072#1073#1086#1085#1077#1085#1090#1072
          end
          object Notice: TDBMemoEh
            Left = 0
            Top = 13
            Width = 397
            Height = 6
            ScrollBars = ssVertical
            Align = alClient
            AutoSize = False
            DataField = 'DESCRIPTION'
            DataSource = srcService
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080' '#1076#1083#1103' '#1072#1073#1086#1085#1077#1085#1090#1072
            TabOrder = 0
            Visible = True
            WantReturns = True
          end
        end
        object pnlTop: TPanel
          Left = 0
          Top = 0
          Width = 397
          Height = 67
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            397
            67)
          object lbl6: TLabel
            Left = 4
            Top = 40
            Width = 20
            Height = 13
            Caption = 'TAG'
          end
          object edtTAGSTR: TDBEditEh
            Left = 30
            Top = 37
            Width = 260
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'TAG_STR'
            DataSource = srcService
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1058#1077#1082#1089#1090#1086#1074#1086#1077' '#1087#1086#1083#1077' '#1076#1083#1103' '#1089#1074#1086#1080#1093' '#1085#1091#1078#1076
            MaxLength = 60
            TabOrder = 1
            Visible = True
          end
          object edtTAGINT: TDBNumberEditEh
            Left = 296
            Top = 37
            Width = 97
            Height = 21
            Anchors = [akTop, akRight]
            DataField = 'TAG'
            DataSource = srcService
            DecimalPlaces = 0
            DynProps = <>
            EmptyDataInfo.Text = #1062#1080#1092#1088#1086#1074#1086#1077' '#1087#1086#1083#1077
            EditButtons = <>
            TabOrder = 2
            Visible = True
          end
          object chkONLY_ONE: TDBCheckBoxEh
            Left = 4
            Top = 10
            Width = 255
            Height = 17
            Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1091#1089#1083#1091#1075#1091' '#1074' '#1051#1050' '#1080' '#1084#1086#1073#1080#1083#1100#1085#1086#1084' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1080
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1091#1089#1083#1091#1075#1091' '#1072#1073#1086#1085#1077#1085#1090#1091
            DataField = 'OPENLY'
            DataSource = srcService
            DynProps = <>
            TabOrder = 0
          end
        end
      end
    end
  end
  object gbInet: TGroupBox
    Left = 0
    Top = 229
    Width = 405
    Height = 75
    Align = alTop
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 6
    DesignSize = (
      405
      75)
    object Label3: TLabel
      Left = 8
      Top = 51
      Width = 72
      Height = 13
      Caption = #1042#1099#1076#1072#1074#1072#1090#1100' IP '#1089
    end
    object Label5: TLabel
      Left = 220
      Top = 51
      Width = 12
      Height = 13
      Caption = #1087#1086
    end
    object Label8: TLabel
      Left = 8
      Top = 24
      Width = 58
      Height = 13
      Hint = 'ID '#1074#1085#1077#1096#1085#1077#1081' '#1089#1080#1089#1090#1077#1084#1099
      Caption = #1042#1085#1077#1096#1085#1080#1081' ID'
    end
    object btn1: TSpeedButton
      Left = 362
      Top = 48
      Width = 35
      Height = 21
      Hint = #1053#1072#1081#1090#1080' '#1087#1077#1088#1074#1099#1081' '#1089#1074#1086#1073#1086#1076#1085#1099#1081' IP'
      Anchors = [akTop, akRight]
      Caption = 'IP'
      OnClick = btn1Click
    end
    object cbItsInet: TDBCheckBoxEh
      Left = 8
      Top = 0
      Width = 190
      Height = 17
      Caption = #1044#1083#1103' '#1089#1074#1103#1079#1080' '#1089' '#1048#1085#1090#1077#1088#1085#1077#1090' '#1073#1080#1083#1083#1080#1085#1075#1086#1084
      DataField = 'INET_SRV'
      DataSource = srcService
      DynProps = <>
      Flat = True
      TabOrder = 0
      OnClick = cbItsInetClick
      ValueChecked = '1;True'
      ValueUnchecked = '0;False'
    end
    object eIPBegin: TDBEditEh
      Left = 94
      Top = 48
      Width = 120
      Height = 21
      DataField = 'IP_BEGIN'
      DataSource = srcService
      DynProps = <>
      EditButtons = <>
      TabOrder = 2
      Visible = True
      OnEnter = eIPEndEnter
      OnExit = eIPEndExit
    end
    object eIPEnd: TDBEditEh
      Left = 237
      Top = 48
      Width = 120
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'IP_END'
      DataSource = srcService
      DynProps = <>
      EditButtons = <>
      TabOrder = 3
      Visible = True
      OnEnter = eIPEndEnter
      OnExit = eIPEndExit
    end
    object edtEXTID: TDBEditEh
      Left = 94
      Top = 21
      Width = 303
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'EXTERNAL_ID'
      DataSource = srcService
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'ID '#1089#1090#1086#1088#1086#1085#1085#1077#1075#1086' '#1073#1080#1083#1083#1080#1085#1075#1072
      MaxLength = 60
      TabOrder = 1
      Visible = True
    end
  end
  object pnlPayType: TGroupBox
    Left = 0
    Top = 359
    Width = 405
    Height = 15
    Align = alTop
    Caption = ' '#1042#1080#1076' '#1091#1095#1077#1090#1072' '
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 9
  end
  object pnlPeriodSrv: TPanel
    Left = 0
    Top = 78
    Width = 405
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      405
      25)
    object lbl4: TLabel
      Left = 8
      Top = 4
      Width = 80
      Height = 13
      Caption = #1057#1087#1086#1089#1086#1073' '#1088#1072#1089#1095#1077#1090#1072
    end
    object cbCalcType: TDBComboBoxEh
      Left = 94
      Top = 0
      Width = 303
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'CALC_TYPE'
      DataSource = srcService
      DynProps = <>
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EditButtons = <>
      Items.Strings = (
        #1056#1072#1079' '#1074' '#1084#1077#1089#1103#1094' ('#1087#1088#1086#1087#1086#1088#1094#1080#1086#1085#1072#1083#1100#1085#1086' '#1082#1086#1083'-'#1074#1072' '#1087#1086#1076#1082#1083'. '#1076#1085#1077#1081')'
        
          #1055#1086#1083#1085#1099#1081'/0 ('#1087#1086#1083#1085#1099#1081' '#1090#1072#1088#1080#1092' '#1077#1089#1083#1080' '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1073#1086#1083#1077#1077' '#1061' '#1076#1085#1077#1081' '#1080#1083#1080' 0 '#1077#1089#1083#1080' '#1084#1077 +
          #1085#1077#1077')'
        
          #1045#1078#1077#1076#1085#1077#1074#1085#1099#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' ('#1089#1095#1080#1090#1072#1077#1084' '#1077#1089#1083#1080' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1077' '#1074' '#1076#1077#1085#1100' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080 +
          #1103')'
        #1045#1078#1077#1076#1085#1077#1074#1085#1099#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103
        #1044#1086#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1076#1086' '#1090#1072#1088#1080#1092#1072
        '1-'#1099#1081' '#1084#1077#1089#1103#1094' '#1092#1080#1082#1089#1072', '#1076#1072#1083#1077#1077' '#1087#1088#1086#1087#1086#1088#1094#1080#1086#1085#1072#1083#1100#1085#1086' '#1076#1085#1103#1084)
      KeyItems.Strings = (
        '0'
        '1'
        '5'
        '2'
        '4'
        '3')
      TabOrder = 0
      Visible = True
      OnChange = cbCalcTypeChange
    end
  end
  object gbDIGIT: TGroupBox
    Left = 0
    Top = 304
    Width = 405
    Height = 45
    Align = alTop
    Caption = ' '#1062#1080#1092#1088#1072' '
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 7
    DesignSize = (
      405
      45)
    object lbl2: TLabel
      Left = 8
      Top = 18
      Width = 58
      Height = 13
      Hint = 'ID '#1074#1085#1077#1096#1085#1077#1081' '#1089#1080#1089#1090#1077#1084#1099
      Caption = #1042#1085#1077#1096#1085#1080#1081' ID'
    end
    object edtDigExtID: TDBEditEh
      Left = 94
      Top = 15
      Width = 169
      Height = 21
      Hint = #1045#1089#1083#1080' ID '#1085#1077#1089#1082#1086#1083#1100#1082#1086', '#1090#1086' '#1091#1082#1072#1079#1072#1090#1100' '#1095#1077#1088#1077#1079' , ('#1079#1072#1087#1103#1090#1091#1102')'
      Anchors = [akLeft, akTop, akRight]
      DataField = 'EXTERNAL_ID'
      DataSource = srcService
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'ID '#1087#1072#1082#1077#1090#1072' '#1094#1080#1092#1088#1086#1074#1086#1081' '#1089#1090#1072#1085#1094#1080#1080
      MaxLength = 60
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnKeyPress = edtDigExtIDKeyPress
    end
    object chkOnlyOne: TDBCheckBoxEh
      Left = 276
      Top = 17
      Width = 121
      Height = 17
      Hint = #1047#1072#1087#1088#1077#1090#1080#1090#1100' '#1076#1086#1073#1072#1074#1083#1103#1090#1100' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1084' '#1076#1077#1082#1086#1076#1077#1088#1072#1084'. '
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1087#1088#1077#1090' '#1084#1085#1086#1075#1080#1093' '#1082#1072#1088#1090
      DataField = 'ONLY_ONE'
      DataSource = srcService
      DynProps = <>
      TabOrder = 1
    end
  end
  object pnlFull: TPanel
    Left = 0
    Top = 128
    Width = 405
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object lblFullMonthDays1: TLabel
      Left = 8
      Top = 6
      Width = 201
      Height = 13
      Caption = #1055#1086#1083#1085#1099#1081' '#1090#1072#1088#1080#1092', '#1077#1089#1083#1080' '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1073#1086#1083#1077#1077' '
    end
    object lblFullMonthDays2: TLabel
      Left = 269
      Top = 6
      Width = 25
      Height = 13
      Caption = #1076#1085#1077#1081
    end
    object edtFullMonthDays: TDBNumberEditEh
      Left = 215
      Top = 3
      Width = 48
      Height = 21
      Hint = #1050#1086#1083#1080#1095#1077#1089#1074#1090#1086' '#1076#1085#1077#1081' '#1076#1086#1083#1078#1085#1086' '#1073#1099#1090#1100' '#1073#1086#1083#1100#1096#1077' 0'
      DataField = 'EXTRA'
      DataSource = srcService
      DecimalPlaces = 0
      DynProps = <>
      EditButton.Visible = True
      EditButtons = <>
      MaxValue = 31.000000000000000000
      TabOrder = 0
      Visible = True
    end
  end
  object pnlAllDays: TPanel
    Left = 0
    Top = 153
    Width = 405
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    DesignSize = (
      405
      28)
    object chkAUTOOFF: TDBCheckBoxEh
      Left = 8
      Top = 5
      Width = 255
      Height = 17
      Alignment = taLeftJustify
      Caption = #1054#1090#1082#1083#1102#1095#1072#1090#1100' '#1091#1089#1083#1091#1075#1091' '#1087#1088#1080' '#1085#1077#1076#1086#1089#1090#1072#1090#1082#1077' '#1089#1088#1077#1076#1089#1090#1074
      DataField = 'AUTOOFF'
      DataSource = srcService
      DynProps = <>
      Flat = True
      TabOrder = 0
      OnClick = chkAUTOOFFClick
    end
    object cbUnblMeth: TDBComboBoxEh
      Left = 269
      Top = 3
      Width = 128
      Height = 21
      Hint = #1088#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080' '#1091#1089#1083#1086#1074#1080#1080', '#1095#1090#1086' '#1073#1072#1083#1072#1085#1089
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Unbl_Meth'
      DataSource = srcService
      DynProps = <>
      EmptyDataInfo.Text = #1088#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080' '#1091#1089#1083#1086#1074#1080#1080', '#1095#1090#1086' '#1073#1072#1083#1072#1085#1089
      EditButtons = <>
      Items.Strings = (
        #1055#1083#1102#1089'. '#1087#1088#1080' '#1074#1099#1093#1086#1076#1077' '#1074' '#1087#1083#1102#1089
        #1044#1077#1085#1100'. '#1093#1074#1072#1090#1072#1077#1090' '#1085#1072' '#1076#1077#1085#1100
        #1052#1077#1089#1103#1094'. '#1093#1074#1072#1090#1072#1077#1090' '#1085#1072' '#1084#1077#1089#1103#1094)
      KeyItems.Strings = (
        '0'
        '1'
        '2')
      TabOrder = 1
      Visible = False
    end
  end
  object pnlAddToMin: TPanel
    Left = 0
    Top = 349
    Width = 405
    Height = 10
    Align = alTop
    BevelOuter = bvNone
    Caption = #1045#1097#1077' '#1085#1077' '#1088#1077#1072#1083#1080#1079#1086#1074#1072#1085#1086
    TabOrder = 8
    Visible = False
  end
  object pnlShift: TPanel
    Left = 0
    Top = 103
    Width = 405
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object lblshift: TLabel
      Left = 8
      Top = 5
      Width = 117
      Height = 13
      Hint = 
        #1057#1084#1077#1097#1077#1085#1080#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1077#1086' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084#1077#1089#1103#1094#1072#13#10'0  - '#1085#1072#1095#1080#1089#1083#1077#1085 +
        #1080#1103' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094#13#10'1  - '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1079#1072' '#1089#1083'. '#1084#1077#1089#1103#1094#13#10'-1 - '#1085#1072#1095#1080#1089#1083#1077#1085 +
        #1080#1103' '#1079#1072' '#1087#1088#1077#1076'. '#1084#1077#1089#1103#1094
      Caption = #1057#1084#1077#1097#1077#1085#1080#1077' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081' '
    end
    object lbl3: TLabel
      Left = 269
      Top = 5
      Width = 117
      Height = 13
      Caption = #1084#1077#1089#1103#1094#1077#1074' '#1086#1090' '#1088#1072#1089#1095#1077#1090#1085#1086#1075#1086
    end
    object edtShift: TDBNumberEditEh
      Left = 215
      Top = 2
      Width = 48
      Height = 21
      Hint = 
        #1044#1077#1083#1072#1090#1100' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1085#1072' '#1084#1077#1089#1103#1094#1077' '#1074#1087#1077#1088#1077#1076'/'#1085#1072#1079#1072#1076' '#1086#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1086' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1084 +
        #1077#1089#1103#1094#1072' '#1089#1080#1089#1090#1077#1084#1099'.'#13#10'0 - '#1085#1072#1095#1080#1089#1083#1103#1090#1100' '#1079#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1077#1089#1103#1094#13#10'1 - '#1085#1072' '#1084#1077#1089#1103#1094' '#1074#1087#1077 +
        #1088#1077#1076' ('#1087#1088#1077#1076#1086#1087#1083#1072#1090#1072')'#13#10'-1 - '#1084#1077#1089#1103#1094' '#1085#1072#1079#1072' ('#1087#1086#1089#1090#1087#1083#1072#1090#1072')'
      DataField = 'SHIFT_MONTHS'
      DataSource = srcService
      DynProps = <>
      EditButton.Visible = True
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
  end
  object pnlAUTO: TPanel
    Left = 0
    Top = 181
    Width = 405
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    Visible = False
    object lbl5: TLabel
      Left = 8
      Top = 26
      Width = 202
      Height = 13
      Caption = #1055#1088#1080#1086#1088#1080#1090#1077#1090' '#1091#1089#1083#1091#1075#1080' (0 - '#1074#1099#1096#1077', 99 - '#1085#1080#1078#1077')'
    end
    object edtPRIORITY: TDBNumberEditEh
      Left = 216
      Top = 21
      Width = 48
      Height = 21
      Hint = #1055#1088#1080#1086#1088#1080#1090#1077#1090' '#1091#1089#1083#1091#1075#1080' (0 - '#1074#1099#1096#1077', 99 - '#1085#1080#1078#1077')'
      DataField = 'PRIORITY'
      DataSource = srcService
      DecimalPlaces = 0
      DynProps = <>
      EditButton.Visible = True
      EditButtons = <>
      MaxValue = 31.000000000000000000
      TabOrder = 1
      Visible = True
    end
    object chkPOSITIVE: TDBCheckBoxEh
      Left = 8
      Top = 0
      Width = 255
      Height = 17
      Hint = #1054#1090#1082#1083#1102#1095#1072#1090#1100' '#1091#1089#1083#1091#1075#1091' '#1077#1089#1083#1080' '#1085#1077' '#1093#1074#1072#1090#1072#1077#1090' '#1076#1077#1085#1077#1075' '#1085#1072' '#1088#1072#1089#1095#1077#1090#1085#1099#1081' '#1087#1077#1088#1080#1086#1076
      Alignment = taLeftJustify
      Caption = #1053#1077' '#1076#1086#1087#1091#1089#1082#1072#1090#1100' '#1084#1080#1085#1091#1089
      DataField = 'POSITIVE_ONLY'
      DataSource = srcService
      DynProps = <>
      Flat = True
      TabOrder = 0
      ValueChecked = '1;True'
      ValueUnchecked = '0;False'
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 410
    Width = 405
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 11
    DesignSize = (
      405
      41)
    object btnOk: TBitBtn
      Left = 94
      Top = 6
      Width = 225
      Height = 30
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TBitBtn
      Left = 325
      Top = 6
      Width = 75
      Height = 30
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object dsPaymentType: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT o.O_ID, o.O_NAME, o.O_DESCRIPTION'
      'FROM V_PAYMENTTYPE o'
      'order BY O.O_NAME')
    Transaction = trSRead
    Database = dmMain.dbTV
    Left = 198
    Top = 231
    oStartTransaction = False
    oFetchAll = True
  end
  object srcPaymentType: TDataSource
    AutoEdit = False
    DataSet = dsPaymentType
    Left = 258
    Top = 237
  end
  object dsService: TpFIBDataSet
    UpdateSQL.Strings = (
      'execute procedure SERVICES_IU('
      '    :SERVICE_ID,'
      '    :SRV_TYPE_ID,'
      '    :SHIFT_MONTHS,'
      '    :NAME,'
      '    :SHORTNAME,'
      '    :CALC_TYPE,'
      '    :DESCRIPTION,'
      '    :DIMENSION,'
      '    :SHOW_SERVICE,'
      '    :EXPENSE_TYPE,'
      '    :EXTRA,'
      '    :EXTERNAL_ID,'
      '    :INET_SRV,'
      '    :IP_BEGIN,'
      '    :IP_END,'
      '    :BUSINESS_TYPE,'
      '    :AUTOOFF,'
      '    :Positive_Only,'
      '    :PRIORITY,'
      '    :ONLY_ONE,'
      '    :Note,'
      '    :Tag,'
      '    :Tag_Str,'
      '    :Openly,'
      '    :Unbl_Meth'
      ')'
      '')
    InsertSQL.Strings = (
      'execute procedure SERVICES_IU('
      '    :SERVICE_ID,'
      '    :SRV_TYPE_ID,'
      '    :SHIFT_MONTHS,'
      '    :NAME,'
      '    :SHORTNAME,'
      '    :CALC_TYPE,'
      '    :DESCRIPTION,'
      '    :DIMENSION,'
      '    :SHOW_SERVICE,'
      '    :EXPENSE_TYPE,'
      '    :EXTRA,'
      '    :EXTERNAL_ID,'
      '    :INET_SRV,'
      '    :IP_BEGIN,'
      '    :IP_END,'
      '    :BUSINESS_TYPE,'
      '    :AUTOOFF,'
      '    :Positive_Only,'
      '    :PRIORITY,'
      '    :ONLY_ONE,'
      '    :Note,'
      '    :Tag,'
      '    :Tag_Str,'
      '    :Openly,'
      '    :Unbl_Meth'
      ')')
    SelectSQL.Strings = (
      'SELECT '
      ' s.*,  '
      
        ' CASE (select 1 from SERVICES_LINKS sl where sl.PARENT is null a' +
        'nd sl.CHILD = s.SERVICE_ID)'
      '   when 1 then 1'
      '   else 0 END as SHOW_SERVICE'
      'FROM SERVICES s '
      'where s.Service_Id = :Service_Id')
    AutoUpdateOptions.UpdateTableName = 'SERVICES'
    AutoUpdateOptions.KeyFields = 'SERVICE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    AfterOpen = dsServiceAfterOpen
    OnNewRecord = dsServiceNewRecord
    Transaction = trSRead
    Database = dmMain.dbTV
    UpdateTransaction = trSWrite
    AutoCommit = True
    Left = 318
    Top = 327
    oFetchAll = True
  end
  object srcService: TDataSource
    DataSet = dsService
    Left = 208
    Top = 320
  end
  object trSWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 318
    Top = 185
  end
  object trSRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 365
    Top = 183
  end
  object cnError: TCnErrorProvider
    DoubleBuffer = False
    Left = 320
    Top = 224
  end
end
