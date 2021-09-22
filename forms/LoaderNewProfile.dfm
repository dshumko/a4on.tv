object LoaderProfileNew: TLoaderProfileNew
  Left = 0
  Top = 0
  BorderWidth = 5
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1086#1092#1080#1083#1103' '#1076#1083#1103' '#1080#1084#1087#1086#1088#1090#1072
  ClientHeight = 708
  ClientWidth = 804
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBtns: TPanel
    Left = 0
    Top = 678
    Width = 804
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object btnDel: TButton
      Left = 0
      Top = 0
      Width = 138
      Height = 30
      Cursor = crHandPoint
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1087#1088#1086#1092#1080#1083#1100
      Align = alLeft
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1092#1080#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnDelClick
    end
    object btnOK: TButton
      Left = 581
      Top = 0
      Width = 148
      Height = 30
      Cursor = crHandPoint
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074#1085#1077#1089#1077#1085#1085#1099#1077' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Align = alRight
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1088#1086#1092#1080#1083#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 729
      Top = 0
      Width = 75
      Height = 30
      Cursor = crHandPoint
      Hint = #1042#1077#1088#1085#1091#1090#1100#1089#1103' '#1073#1077#1079' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
      Align = alRight
      Cancel = True
      Caption = #1053#1072#1079#1072#1076
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnCancelClick
    end
  end
  object pgcFileFormats: TPageControl
    Left = 0
    Top = 198
    Width = 804
    Height = 480
    ActivePage = ts1
    Align = alClient
    TabOrder = 3
    object ts1: TTabSheet
      Caption = 'ts1'
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 796
        Height = 109
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object sgFile: TStringGrid
          Left = 2
          Top = 2
          Width = 792
          Height = 105
          Hint = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1088#1077#1077#1089#1090#1088#1072
          TabStop = False
          Align = alClient
          ColCount = 2
          RowCount = 2
          FixedRows = 0
          Options = [goFixedVertLine, goRowSelect]
          TabOrder = 0
          RowHeights = (
            24
            24)
        end
      end
      object grpFileHead: TGroupBox
        Left = 0
        Top = 109
        Width = 796
        Height = 166
        Align = alTop
        Caption = '                                                   '
        TabOrder = 1
        object stgHead: TStringGrid
          Left = 413
          Top = 15
          Width = 381
          Height = 149
          Hint = #1041#1083#1086#1082' '#1079#1072#1075#1086#1083#1086#1074#1082#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          TabStop = False
          Align = alClient
          ColCount = 2
          DefaultColWidth = 30
          DefaultRowHeight = 20
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing]
          TabOrder = 2
        end
        object pnlHeadHead: TPanel
          Left = 2
          Top = 15
          Width = 411
          Height = 149
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object lbl9: TLabel
            Left = 4
            Top = 8
            Width = 49
            Height = 13
            Caption = #1057#1090#1088#1086#1082#1080': '#1089
          end
          object lbl10: TLabel
            Left = 126
            Top = 8
            Width = 12
            Height = 13
            Caption = #1087#1086
          end
          object lbl11: TLabel
            Left = 4
            Top = 36
            Width = 66
            Height = 13
            Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100
          end
          object lbl12: TLabel
            Left = 193
            Top = 35
            Width = 90
            Height = 13
            Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1080#1084#1074#1086#1083#1099
          end
          object lbl13: TLabel
            Left = 4
            Top = 67
            Width = 31
            Height = 13
            Caption = #1053#1086#1084#1077#1088
          end
          object lbl14: TLabel
            Left = 4
            Top = 92
            Width = 31
            Height = 13
            Caption = #1057#1091#1084#1084#1072
          end
          object lbl15: TLabel
            Left = 4
            Top = 118
            Width = 26
            Height = 13
            Caption = #1044#1072#1090#1072
          end
          object lbl16: TLabel
            Left = 193
            Top = 118
            Width = 68
            Height = 13
            Caption = #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099
          end
          object edtHeaderFrom: TDBNumberEditEh
            Left = 77
            Top = 5
            Width = 45
            Height = 21
            Hint = 
              #1057' '#1082#1072#1082#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1074' '#1092#1072#1081#1083#1077' '#1085#1072#1095#1080#1085#1072#1077#1090#1089#1103' '#1073#1083#1086#1082' '#1089#1091#1084#1084#1072#1088#1085#1086#1081' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080#13#10'('#1087#1077 +
              #1088#1074#1099#1081' '#1089#1090#1086#1083#1073#1077#1094' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1099')'
            DataField = 'HEADERFROM'
            DataSource = srcFileFormats
            DecimalPlaces = 0
            DynProps = <>
            EmptyDataInfo.Text = #1085#1072#1095#1072#1083#1086
            EditButton.Enabled = False
            EditButtons = <>
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Visible = True
            OnExit = HeaderInfoChange
          end
          object edtHeaderTo: TDBNumberEditEh
            Left = 118
            Top = -19
            Width = 33
            Height = 21
            Hint = 
              #1055#1086' '#1082#1072#1082#1091#1102' '#1089#1090#1088#1086#1082#1091' '#1074' '#1092#1072#1081#1083#1077' '#1073#1083#1086#1082' '#1089#1091#1084#1084#1072#1088#1085#1086#1081' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080#13#10'('#1074#1090#1086#1088#1086#1081' '#1089#1090#1086#1083#1073 +
              #1077#1094' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1099')'
            DataField = 'HeaderTo'
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Visible = True
          end
          object edtHNc: TDBNumberEditEh
            Left = 142
            Top = 64
            Width = 45
            Height = 21
            Hint = #1042' '#1082#1072#1082#1086#1081' '#1082#1086#1083#1086#1085#1082#1077' '#1085#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataField = 'HEADNUMCOL'
            DataSource = srcFileFormats
            DecimalPlaces = 0
            DynProps = <>
            EmptyDataInfo.Text = #1082#1086#1083#1086#1085#1082#1072
            EditButton.Enabled = False
            EditButtons = <>
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            Visible = True
            OnExit = HeaderInfoChange
          end
          object edtheadSumCol: TDBNumberEditEh
            Left = 142
            Top = 89
            Width = 45
            Height = 21
            Hint = #1042' '#1082#1072#1082#1086#1081' '#1082#1086#1083#1086#1085#1082#1077' '#1086#1073#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataField = 'HEADSUMCOL'
            DataSource = srcFileFormats
            DecimalPlaces = 0
            DynProps = <>
            EmptyDataInfo.Text = #1082#1086#1083#1086#1085#1082#1072
            EditButton.Enabled = False
            EditButtons = <>
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
            Visible = True
            OnExit = HeaderInfoChange
          end
          object edtheadDateCol: TDBNumberEditEh
            Left = 142
            Top = 115
            Width = 45
            Height = 21
            Hint = #1042' '#1082#1072#1082#1086#1081' '#1082#1086#1083#1086#1085#1082#1077' '#1076#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataField = 'HEADDATECOL'
            DataSource = srcFileFormats
            DecimalPlaces = 0
            DynProps = <>
            EmptyDataInfo.Text = #1082#1086#1083#1086#1085#1082#1072
            EditButton.Enabled = False
            EditButtons = <>
            ParentShowHint = False
            ShowHint = True
            TabOrder = 10
            Visible = True
            OnExit = HeaderInfoChange
          end
          object edtheadNumLine: TDBNumberEditEh
            Left = 77
            Top = 64
            Width = 45
            Height = 21
            Hint = #1042' '#1082#1072#1082#1086#1081' '#1089#1090#1088#1086#1082#1077' '#1085#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataField = 'HEADNUMLINE'
            DataSource = srcFileFormats
            DecimalPlaces = 0
            DynProps = <>
            EmptyDataInfo.Text = #1089#1090#1088#1086#1082#1072
            EditButton.Enabled = False
            EditButtons = <>
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            Visible = True
            OnExit = HeaderInfoChange
          end
          object edtheadSumLine: TDBNumberEditEh
            Left = 77
            Top = 89
            Width = 45
            Height = 21
            Hint = #1042' '#1082#1072#1082#1086#1081' '#1089#1090#1088#1086#1082#1077' '#1086#1073#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataField = 'HEADSUMLINE'
            DataSource = srcFileFormats
            DecimalPlaces = 0
            DynProps = <>
            EmptyDataInfo.Text = #1089#1090#1088#1086#1082#1072
            EditButton.Enabled = False
            EditButtons = <>
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            Visible = True
            OnExit = HeaderInfoChange
          end
          object edtheadDateLine: TDBNumberEditEh
            Left = 77
            Top = 115
            Width = 45
            Height = 21
            Hint = #1042' '#1082#1072#1082#1086#1081' '#1089#1090#1088#1086#1082#1077' '#1076#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataField = 'HEADDATELINE'
            DataSource = srcFileFormats
            DecimalPlaces = 0
            DynProps = <>
            EmptyDataInfo.Text = #1089#1090#1088#1086#1082#1072
            EditButton.Enabled = False
            EditButtons = <>
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            Visible = True
            OnExit = HeaderInfoChange
          end
          object edName1HeadSprt: TDBEditEh
            Left = 77
            Top = 33
            Width = 110
            Height = 21
            Hint = #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1076#1072#1085#1085#1099#1093' '#1074' '#1089#1090#1088#1086#1082#1077#13#10'\t - '#1089#1080#1084#1074#1086#1083' '#1090#1072#1073#1091#1083#1103#1094#1080#1080
            DataField = 'HEADSPRT'
            DataSource = srcFileFormats
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            Visible = True
            OnExit = HeaderInfoChange
          end
          object edName1HeadRemCh: TDBEditEh
            Left = 287
            Top = 33
            Width = 112
            Height = 21
            Hint = #1059#1076#1072#1083#1103#1090#1100' '#1089#1080#1084#1074#1086#1083#1099' '#1080#1079' '#1089#1090#1088#1086#1082#1080' '#1079#1072#1075#1086#1083#1086#1074#1082#1072
            DataField = 'HEADREMCH'
            DataSource = srcFileFormats
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1059#1076#1072#1083#1103#1090#1100' '#1089#1080#1084#1074#1086#1083#1099
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            Visible = True
            OnExit = HeaderInfoChange
          end
          object edName1headDateFmt: TDBEditEh
            Left = 287
            Top = 115
            Width = 112
            Height = 21
            Hint = 
              #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099' '#13#10#1044#1077#1085#1100':'#13#10'  DD - 01, 02, 22 '#1080' '#1090'.'#1076'.'#13#10'  DDD - '#1087#1086#1085', '#1074#1090' '#1080 +
              ' '#1090'.'#1076'.'#13#10'  DDDD - '#1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082', '#1074#1090#1086#1088#1085#1080#1082', '#1089#1088#1077#1076#1072'...'#13#10#1052#1077#1089#1103#1094':'#13#10'  MM   0' +
              '1..12'#13#10'  MMM  '#1071#1053#1042', '#1060#1045#1042' '#1080' '#1090'.'#1076'.'#13#10'  MMMM '#1071#1053#1042#1040#1056#1068', '#1060#1045#1042#1056#1040#1051#1068' '#1080' '#1090'.'#1076'.'#13#10#1043#1086 +
              #1076':'#13#10'  YY    '#1076#1074#1077' '#1094#1080#1092#1088#1099' 09'#13#10'  YYYY  '#1095#1077#1090#1099#1088#1077' '#1094#1080#1092#1088#1099' 2009'#13#10#1063#1072#1089#1099': '#13#10'  H' +
              'H 01..24'#13#10#1052#1080#1085#1091#1090#1099':'#13#10'  NN 00..59'#13#10#1057#1077#1082#1091#1085#1076#1099': '#13#10'  SS 00..59'#13#10#13#10' AP AM'
            DataField = 'HEADDATEFMT'
            DataSource = srcFileFormats
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099
            ParentShowHint = False
            ShowHint = True
            TabOrder = 11
            Visible = True
            OnExit = HeaderInfoChange
          end
          object DBNumberEditEh7: TDBNumberEditEh
            Left = 142
            Top = 5
            Width = 45
            Height = 21
            Hint = 
              #1055#1086' '#1082#1072#1082#1091#1102' '#1089#1090#1088#1086#1082#1091' '#1074' '#1092#1072#1081#1083#1077' '#1073#1083#1086#1082' '#1089#1091#1084#1084#1072#1088#1085#1086#1081' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080#13#10'('#1074#1090#1086#1088#1086#1081' '#1089#1090#1086#1083#1073 +
              #1077#1094' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1099')'
            DataField = 'HEADERTO'
            DataSource = srcFileFormats
            DecimalPlaces = 0
            DynProps = <>
            EmptyDataInfo.Text = #1082#1086#1085#1077#1094
            EditButton.Enabled = False
            EditButtons = <>
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            Visible = True
            OnExit = HeaderInfoChange
          end
        end
        object dbchkHeaderExist: TDBCheckBox
          Left = 11
          Top = 0
          Width = 167
          Height = 17
          Hint = 
            #1045#1089#1090#1100' '#1083#1080' '#1074' '#1092#1072#1081#1083#1077' '#1089#1091#1084#1072#1088#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' ('#1086#1073#1097#1072#1103' '#1089#1091#1084#1084#1072', '#1082#1086#1083'-'#1074#1086' '#1079#1072#1087#1080#1089#1077#1081 +
            ')'
          Caption = ' '#1057#1091#1084#1084#1072#1088#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
          DataField = 'HEADEREXIST'
          DataSource = srcFileFormats
          TabOrder = 0
          OnClick = dbchkHeaderExistClick
        end
      end
      object grpFileData: TGroupBox
        Left = 0
        Top = 275
        Width = 796
        Height = 177
        Align = alClient
        Caption = ' '#1055#1083#1072#1090#1077#1078#1080' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object stgData: TStringGrid
          Left = 413
          Top = 15
          Width = 381
          Height = 160
          Hint = #1041#1083#1086#1082' '#1076#1072#1085#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          TabStop = False
          Align = alClient
          BorderStyle = bsNone
          ColCount = 2
          DefaultColWidth = 30
          DefaultRowHeight = 20
          RowCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSizing, goColSizing]
          ParentFont = False
          TabOrder = 1
          RowHeights = (
            20
            20)
        end
        object pnlHeadData: TScrollBox
          Left = 2
          Top = 15
          Width = 411
          Height = 160
          Align = alLeft
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object lbl17: TLabel
            Left = 8
            Top = 7
            Width = 49
            Height = 13
            Caption = #1057#1090#1088#1086#1082#1080': '#1089
          end
          object lbl18: TLabel
            Left = 102
            Top = 7
            Width = 12
            Height = 13
            Caption = #1087#1086
          end
          object lbl19: TLabel
            Left = 162
            Top = 7
            Width = 66
            Height = 13
            Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100
          end
          object lbl20: TLabel
            Left = 4
            Top = 39
            Width = 90
            Height = 13
            Caption = #1059#1076#1072#1083#1103#1090#1100' '#1089#1080#1084#1074#1086#1083#1099
          end
          object edtDataTo: TDBNumberEditEh
            Left = 118
            Top = 4
            Width = 33
            Height = 21
            Hint = #1055#1086' '#1082#1072#1082#1091#1102' '#1089#1090#1088#1086#1082#1091' '#1074' '#1092#1072#1081#1083#1077' '#1076#1072#1085#1085#1099#1077#13#10'('#1074#1090#1086#1088#1086#1081' '#1089#1090#1086#1083#1073#1077#1094' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1099')'
            DataField = 'DATATO'
            DataSource = srcFileFormats
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Visible = True
            OnExit = DataInfoChange
          end
          object edtDataFrom: TDBNumberEditEh
            Left = 64
            Top = 4
            Width = 33
            Height = 21
            Hint = 
              #1057' '#1082#1072#1082#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1074' '#1092#1072#1081#1083#1077' '#1085#1072#1095#1080#1085#1072#1102#1090#1089#1103' '#1076#1072#1085#1085#1099#1077#13#10'('#1087#1077#1088#1074#1099#1081' '#1089#1090#1086#1083#1073#1077#1094' '#1074#1077#1088#1093#1085#1077 +
              #1081' '#1090#1072#1073#1083#1080#1094#1099')'
            DataField = 'DATAFROM'
            DataSource = srcFileFormats
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnExit = DataInfoChange
          end
          object grp1: TGroupBox
            Left = 0
            Top = 57
            Width = 394
            Height = 193
            Align = alBottom
            Caption = ' '#1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1086#1083#1077#1081' '
            TabOrder = 5
            object lbl21: TLabel
              Left = 46
              Top = 24
              Width = 43
              Height = 13
              Caption = #1051#1080#1094#1077#1074#1086#1081
            end
            object lbl22: TLabel
              Left = 70
              Top = 48
              Width = 23
              Height = 13
              Caption = #1060#1048#1054
            end
            object lbl23: TLabel
              Left = 12
              Top = 72
              Width = 70
              Height = 13
              Caption = #1040#1076#1088#1077#1089'('#1059#1083#1080#1094#1072')'
            end
            object lbl24: TLabel
              Left = 58
              Top = 96
              Width = 31
              Height = 13
              Caption = #1057#1091#1084#1084#1072
            end
            object lbl25: TLabel
              Left = 8
              Top = 119
              Width = 73
              Height = 13
              Caption = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
            end
            object lbl26: TLabel
              Left = 143
              Top = 119
              Width = 68
              Height = 13
              Caption = #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099
            end
            object lbl29: TLabel
              Left = 153
              Top = 16
              Width = 129
              Height = 39
              Caption = #1059#1082#1072#1078#1080#1090#1077' '#1085#1086#1084#1077#1088#1072' '#1082#1086#1083#1086#1085#1086#1082#13#10#1076#1083#1103' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' '#13#10#1076#1072#1085#1085#1099#1093' '#1089' '#1041#1044
            end
            object lbl30: TLabel
              Left = 25
              Top = 143
              Width = 60
              Height = 13
              Caption = #8470' '#1087#1083#1072#1090#1077#1078#1072
            end
            object lbl31: TLabel
              Left = 25
              Top = 167
              Width = 61
              Height = 13
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1102
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            end
            object lbl32: TLabel
              Left = 166
              Top = 167
              Width = 87
              Height = 13
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1102
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1076#1086#1087'.'
            end
            object lbl33: TLabel
              Left = 135
              Top = 72
              Width = 20
              Height = 13
              Caption = #1044#1086#1084
            end
            object lbl34: TLabel
              Left = 259
              Top = 72
              Width = 12
              Height = 13
              Caption = #1082#1074
            end
            object lbl35: TLabel
              Left = 196
              Top = 73
              Width = 28
              Height = 13
              Caption = #1082#1086#1088#1087'.'
            end
            object edtDATEFMT: TDBEditEh
              Left = 229
              Top = 116
              Width = 75
              Height = 21
              Hint = 
                #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099' '#13#10#1044#1077#1085#1100':'#13#10'  DD - 01, 02, 22 '#1080' '#1090'.'#1076'.'#13#10'  DDD - '#1087#1086#1085', '#1074#1090' '#1080 +
                ' '#1090'.'#1076'.'#13#10'  DDDD - '#1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082', '#1074#1090#1086#1088#1085#1080#1082', '#1089#1088#1077#1076#1072'...'#13#10#1052#1077#1089#1103#1094':'#13#10'  MM   0' +
                '1..12'#13#10'  MMM  '#1071#1053#1042', '#1060#1045#1042' '#1080' '#1090'.'#1076'.'#13#10'  MMMM '#1071#1053#1042#1040#1056#1068', '#1060#1045#1042#1056#1040#1051#1068' '#1080' '#1090'.'#1076'.'#13#10#1043#1086 +
                #1076':'#13#10'  YY    '#1076#1074#1077' '#1094#1080#1092#1088#1099' 09'#13#10'  YYYY  '#1095#1077#1090#1099#1088#1077' '#1094#1080#1092#1088#1099' 2009'#13#10#1063#1072#1089#1099': '#13#10'  H' +
                'H 01..24'#13#10#1052#1080#1085#1091#1090#1099':'#13#10'  NN 00..59'#13#10#1057#1077#1082#1091#1085#1076#1099': '#13#10'  SS 00..59'#13#10#13#10' AP AM'
              DataField = 'DATEFMT'
              DataSource = srcFileFormats
              DynProps = <>
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 8
              Visible = True
            end
            object edtACCOUNT: TDBEditEh
              Left = 98
              Top = 21
              Width = 33
              Height = 21
              DataField = 'ACCOUNT'
              DataSource = srcFileFormats
              DynProps = <>
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Visible = True
              OnChange = edtACCOUNTEnter
              OnEnter = edtACCOUNTEnter
            end
            object edtFIO: TDBEditEh
              Left = 98
              Top = 45
              Width = 33
              Height = 21
              DataField = 'FIO'
              DataSource = srcFileFormats
              DynProps = <>
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              Visible = True
              OnChange = edtACCOUNTEnter
              OnEnter = edtACCOUNTEnter
            end
            object edtADRESS: TDBEditEh
              Left = 98
              Top = 69
              Width = 33
              Height = 21
              DataField = 'ADRES'
              DataSource = srcFileFormats
              DynProps = <>
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              Visible = True
              OnChange = edtACCOUNTEnter
              OnEnter = edtACCOUNTEnter
            end
            object edtSUMMA: TDBEditEh
              Left = 98
              Top = 93
              Width = 33
              Height = 21
              DataField = 'DATASUM'
              DataSource = srcFileFormats
              DynProps = <>
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              Visible = True
              OnChange = edtACCOUNTEnter
              OnEnter = edtACCOUNTEnter
            end
            object edtDATE: TDBEditEh
              Left = 98
              Top = 116
              Width = 33
              Height = 21
              DataField = 'DATADATE'
              DataSource = srcFileFormats
              DynProps = <>
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              Visible = True
              OnChange = edtACCOUNTEnter
              OnEnter = edtACCOUNTEnter
            end
            object edtEXTID: TDBEditEh
              Left = 98
              Top = 140
              Width = 33
              Height = 21
              DataField = 'EXTID'
              DataSource = srcFileFormats
              DynProps = <>
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              Visible = True
              OnChange = edtACCOUNTEnter
              OnEnter = edtACCOUNTEnter
            end
            object edtNOTICE: TDBEditEh
              Left = 98
              Top = 164
              Width = 33
              Height = 21
              DataField = 'NOTICE'
              DataSource = srcFileFormats
              DynProps = <>
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
              Visible = True
              OnChange = edtACCOUNTEnter
              OnEnter = edtACCOUNTEnter
            end
            object edtNOTICE1: TDBEditEh
              Left = 271
              Top = 164
              Width = 33
              Height = 21
              DataField = 'NOTICE1'
              DataSource = srcFileFormats
              DynProps = <>
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 11
              Visible = True
              OnChange = edtACCOUNTEnter
              OnEnter = edtACCOUNTEnter
            end
            object edtHOUSE: TDBEditEh
              Left = 162
              Top = 69
              Width = 28
              Height = 21
              DataField = 'HOUSE'
              DataSource = srcFileFormats
              DynProps = <>
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              Visible = True
              OnChange = edtACCOUNTEnter
              OnEnter = edtACCOUNTEnter
            end
            object edtKORP: TDBEditEh
              Left = 227
              Top = 69
              Width = 28
              Height = 21
              DataField = 'KORP'
              DataSource = srcFileFormats
              DynProps = <>
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              Visible = True
              OnChange = edtACCOUNTEnter
              OnEnter = edtACCOUNTEnter
            end
            object edtFLAT: TDBEditEh
              Left = 276
              Top = 70
              Width = 28
              Height = 21
              DataField = 'FLAT'
              DataSource = srcFileFormats
              DynProps = <>
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              Visible = True
              OnChange = edtACCOUNTEnter
              OnEnter = edtACCOUNTEnter
            end
          end
          object dbchckbxhDataRemZero: TDBCheckBoxEh
            Left = 221
            Top = 38
            Width = 78
            Height = 17
            Hint = #1059#1076#1072#1083#1103#1090#1100' '#1083#1080#1076#1080#1088#1091#1102#1097#1080#1077' 0 '#1074' '#1083#1080#1094#1077#1074#1086#1084' '#1089#1095#1077#1090#1077
            Alignment = taLeftJustify
            Caption = #1059#1076#1072#1083#1103#1090#1100' 0'
            DataField = 'DataRemZero'
            DataSource = srcFileFormats
            DynProps = <>
            Flat = True
            TabOrder = 4
          end
          object edtDataRemCh: TDBEditEh
            Left = 115
            Top = 36
            Width = 96
            Height = 21
            Hint = #1059#1076#1072#1083#1103#1090#1100' '#1089#1080#1084#1074#1086#1083#1099' '#1080#1079' '#1089#1090#1088#1086#1082#1080' '#1076#1072#1085#1085#1099#1093
            DataField = 'DATAREMCH'
            DataSource = srcFileFormats
            DynProps = <>
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            Visible = True
            OnExit = DataInfoChange
          end
          object edName1DataSprt: TDBEditEh
            Left = 242
            Top = 4
            Width = 24
            Height = 21
            Hint = #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1076#1072#1085#1085#1099#1093' '#1074' '#1089#1090#1088#1086#1082#1077#13#10'\t - '#1089#1080#1084#1074#1086#1083' '#1090#1072#1073#1091#1083#1103#1094#1080#1080
            DataField = 'DATASPRT'
            DataSource = srcFileFormats
            DynProps = <>
            EditButtons = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            Visible = True
            OnExit = DataInfoChange
          end
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'ts2'
      ImageIndex = 1
      object pnl3: TPanel
        Left = 0
        Top = 0
        Width = 796
        Height = 137
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object dbgrd1: TDBGrid
          Left = 2
          Top = 2
          Width = 792
          Height = 133
          Hint = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1088#1077#1077#1089#1090#1088#1072
          Align = alClient
          DataSource = src
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object grp2: TGroupBox
        Left = 0
        Top = 137
        Width = 796
        Height = 315
        Align = alClient
        Caption = ' '#1055#1083#1072#1090#1077#1078#1080' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object pnl4: TPanel
          Left = 2
          Top = 15
          Width = 792
          Height = 298
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object edt1: TEdit
            Left = 108
            Top = 94
            Width = 85
            Height = 21
            TabOrder = 2
          end
          object grp3: TGroupBox
            Left = 8
            Top = 24
            Width = 409
            Height = 251
            Caption = ' '#1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1086#1083#1077#1081' '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            object lbl36: TLabel
              Left = 61
              Top = 24
              Width = 43
              Height = 13
              Caption = #1051#1080#1094#1077#1074#1086#1081
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl37: TLabel
              Left = 85
              Top = 48
              Width = 23
              Height = 13
              Caption = #1060#1048#1054
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl38: TLabel
              Left = 24
              Top = 72
              Width = 73
              Height = 13
              Caption = #1040#1076#1088#1077#1089' ('#1059#1083#1080#1094#1072')'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl39: TLabel
              Left = 73
              Top = 123
              Width = 31
              Height = 13
              Caption = #1057#1091#1084#1084#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl40: TLabel
              Left = 23
              Top = 146
              Width = 73
              Height = 13
              Caption = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl41: TLabel
              Left = 29
              Top = 171
              Width = 68
              Height = 13
              Caption = #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl42: TLabel
              Left = 40
              Top = 196
              Width = 60
              Height = 13
              Caption = #8470' '#1087#1083#1072#1090#1077#1078#1072
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl43: TLabel
              Left = 11
              Top = 98
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
            object lbl44: TLabel
              Left = 280
              Top = 98
              Width = 12
              Height = 13
              Caption = #1082#1074
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl45: TLabel
              Left = 40
              Top = 221
              Width = 61
              Height = 13
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lbl46: TLabel
              Left = 142
              Top = 98
              Width = 28
              Height = 13
              Caption = #1082#1086#1088#1087'.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object edName1DATEfmt1: TDBEditEh
              Left = 116
              Top = 169
              Width = 75
              Height = 21
              Hint = 
                #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099' '#13#10#1044#1077#1085#1100':'#13#10'  DD - 01, 02, 22 '#1080' '#1090'.'#1076'.'#13#10'  DDD - '#1087#1086#1085', '#1074#1090' '#1080 +
                ' '#1090'.'#1076'.'#13#10'  DDDD - '#1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082', '#1074#1090#1086#1088#1085#1080#1082', '#1089#1088#1077#1076#1072'...'#13#10#1052#1077#1089#1103#1094':'#13#10'  MM   0' +
                '1..12'#13#10'  MMM  '#1071#1053#1042', '#1060#1045#1042' '#1080' '#1090'.'#1076'.'#13#10'  MMMM '#1071#1053#1042#1040#1056#1068', '#1060#1045#1042#1056#1040#1051#1068' '#1080' '#1090'.'#1076'.'#13#10#1043#1086 +
                #1076':'#13#10'  YY    '#1076#1074#1077' '#1094#1080#1092#1088#1099' 09'#13#10'  YYYY  '#1095#1077#1090#1099#1088#1077' '#1094#1080#1092#1088#1099' 2009'#13#10#1063#1072#1089#1099': '#13#10'  H' +
                'H 01..24'#13#10#1052#1080#1085#1091#1090#1099':'#13#10'  NN 00..59'#13#10#1057#1077#1082#1091#1085#1076#1099': '#13#10'  SS 00..59'#13#10#13#10' AP AM'
              DataField = 'DATEFMT'
              DataSource = srcFileFormats
              DynProps = <>
              EditButtons = <>
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 8
              Visible = True
            end
            object RxDBLookupCombo1: TRxDBLookupCombo
              Left = 116
              Top = 19
              Width = 281
              Height = 21
              DropDownCount = 8
              DataField = 'ACCOUNT'
              DataSource = srcFileFormats
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              LookupField = 'NAME'
              LookupSource = srcFieldName
              ParentFont = False
              TabOrder = 0
            end
            object RxDBLookupCombo2: TRxDBLookupCombo
              Left = 116
              Top = 44
              Width = 281
              Height = 21
              DropDownCount = 8
              DataField = 'FIO'
              DataSource = srcFileFormats
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              LookupField = 'NAME'
              LookupSource = srcFieldName
              ParentFont = False
              TabOrder = 1
            end
            object RxDBLookupCombo3: TRxDBLookupCombo
              Left = 116
              Top = 69
              Width = 281
              Height = 21
              DropDownCount = 8
              DataField = 'ADRES'
              DataSource = srcFileFormats
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              LookupField = 'NAME'
              LookupSource = srcFieldName
              ParentFont = False
              TabOrder = 2
            end
            object RxDBLookupCombo4: TRxDBLookupCombo
              Left = 38
              Top = 94
              Width = 100
              Height = 21
              DropDownCount = 8
              DataField = 'HOUSE'
              DataSource = srcFileFormats
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              LookupField = 'NAME'
              LookupSource = srcFieldName
              ParentFont = False
              TabOrder = 3
            end
            object RxDBLookupCombo5: TRxDBLookupCombo
              Left = 175
              Top = 94
              Width = 100
              Height = 21
              DropDownCount = 8
              DataField = 'KORP'
              DataSource = srcFileFormats
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              LookupField = 'NAME'
              LookupSource = srcFieldName
              ParentFont = False
              TabOrder = 4
            end
            object RxDBLookupCombo6: TRxDBLookupCombo
              Left = 297
              Top = 94
              Width = 100
              Height = 21
              DropDownCount = 8
              DataField = 'FLAT'
              DataSource = srcFileFormats
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              LookupField = 'NAME'
              LookupSource = srcFieldName
              ParentFont = False
              TabOrder = 5
            end
            object RxDBLookupCombo7: TRxDBLookupCombo
              Left = 116
              Top = 119
              Width = 281
              Height = 21
              DropDownCount = 8
              DataField = 'DATASUM'
              DataSource = srcFileFormats
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              LookupField = 'NAME'
              LookupSource = srcFieldName
              ParentFont = False
              TabOrder = 6
            end
            object RxDBLookupCombo8: TRxDBLookupCombo
              Left = 116
              Top = 144
              Width = 281
              Height = 21
              DropDownCount = 8
              DataField = 'DATADATE'
              DataSource = srcFileFormats
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              LookupField = 'NAME'
              LookupSource = srcFieldName
              ParentFont = False
              TabOrder = 7
            end
            object RxDBLookupCombo9: TRxDBLookupCombo
              Left = 116
              Top = 192
              Width = 281
              Height = 21
              DropDownCount = 8
              DataField = 'EXTID'
              DataSource = srcFileFormats
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              LookupField = 'NAME'
              LookupSource = srcFieldName
              ParentFont = False
              TabOrder = 9
            end
            object RxDBLookupCombo10: TRxDBLookupCombo
              Left = 116
              Top = 217
              Width = 281
              Height = 21
              DropDownCount = 8
              DataField = 'NOTICE'
              DataSource = srcFileFormats
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              LookupField = 'NAME'
              LookupSource = srcFieldName
              ParentFont = False
              TabOrder = 10
            end
          end
          object DBCheckBoxEh1: TDBCheckBoxEh
            Left = 11
            Top = 5
            Width = 86
            Height = 17
            Hint = #1059#1076#1072#1083#1103#1090#1100' '#1083#1080#1076#1080#1088#1091#1102#1097#1080#1077' 0 '#1074' '#1083#1080#1094#1077#1074#1086#1084' '#1089#1095#1077#1090#1077
            Alignment = taLeftJustify
            Caption = #1059#1076#1072#1083#1103#1090#1100' 0  '
            DataField = 'DataRemZero'
            DynProps = <>
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
      end
    end
    object ts3: TTabSheet
      Caption = 'ts3'
      ImageIndex = 2
      object lbl47: TLabel
        Left = 38
        Top = 48
        Width = 280
        Height = 23
        Caption = #1048#1084#1087#1086#1088#1090' '#1080#1079' Excel '#1074' '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1077'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object ts4: TTabSheet
      Caption = 'ts4'
      ImageIndex = 3
      object lbl48: TLabel
        Left = 46
        Top = 56
        Width = 272
        Height = 23
        Caption = #1048#1084#1087#1086#1088#1090' '#1080#1079' XML '#1074' '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1077'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 804
    Height = 125
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      804
      125)
    object lbl1: TLabel
      Left = 10
      Top = 4
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
    object lbl8: TLabel
      Left = 10
      Top = 33
      Width = 73
      Height = 13
      Caption = #1060#1086#1088#1084#1072#1090' '#1092#1072#1081#1083#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 548
      Top = 33
      Width = 97
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072' '#1092#1072#1081#1083#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl3: TLabel
      Left = 375
      Top = 33
      Width = 72
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1052#1072#1089#1082#1072' '#1092#1072#1081#1083#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 10
      Top = 67
      Width = 103
      Height = 13
      Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1081' '#1092#1072#1081#1083#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl7: TLabel
      Left = 10
      Top = 98
      Width = 115
      Height = 13
      Caption = #1040#1088#1093#1080#1074#1085#1099#1081' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1081
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtProfile: TDBEditEh
      Left = 130
      Top = 1
      Width = 662
      Height = 21
      Hint = #1053#1072#1079#1074#1072#1085#1080#1103' '#1087#1088#1086#1092#1080#1083#1103
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Profile'
      DataSource = srcFileFormats
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1103' '#1087#1088#1086#1092#1080#1083#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object cbFileFormat: TDBComboBoxEh
      Left = 130
      Top = 30
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'FILETYPE'
      DataSource = srcFileFormats
      DynProps = <>
      EmptyDataInfo.Text = #1060#1086#1088#1084#1072#1090
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
        'DBF '#1092#1072#1081#1083
        'Excel '#1092#1072#1081#1083
        'XML '#1092#1072#1081#1083)
      KeyItems.Strings = (
        '0'
        '1'
        '2'
        '3')
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnChange = cbFileFormatChange
    end
    object cbdbCodePage: TDBComboBoxEh
      Left = 652
      Top = 30
      Width = 140
      Height = 21
      Hint = #1042' '#1082#1072#1082#1086#1081' '#1082#1086#1076#1080#1088#1086#1074#1082#1077' '#1092#1072#1081#1083' (Windows, DOS)'
      Anchors = [akTop, akRight]
      DataField = 'CODEPAGE'
      DataSource = srcFileFormats
      DynProps = <>
      EmptyDataInfo.Text = #1050#1086#1076#1080#1088#1086#1074#1082#1072
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        #1050#1080#1088#1080#1083#1080#1094#1072' (DOS 866)'
        #1050#1080#1088#1080#1083#1080#1094#1072' (Windows 1251)')
      KeyItems.Strings = (
        '0'
        '1')
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object edtFileExt: TDBEditEh
      Left = 457
      Top = 30
      Width = 79
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'FILEEXT'
      DataSource = srcFileFormats
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1084#1072#1089#1082#1072' '#1092#1072#1081#1083#1086#1074
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object edtFilesDir: TDBEditEh
      Left = 130
      Top = 64
      Width = 662
      Height = 21
      DynProps = <>
      EditButtons = <
        item
          Images.NormalImages = MainForm.il12x12
          Style = ebsGlyphEh
          Width = 21
        end>
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1086#1073#1088#1072#1073#1072#1090#1099#1074#1072#1077#1084#1099#1081' '#1092#1072#1081#1083
      TabOrder = 4
      Visible = True
    end
    object edtArhDir: TDBEditEh
      Left = 130
      Top = 95
      Width = 662
      Height = 21
      DynProps = <>
      EditButtons = <
        item
          Images.NormalImages = MainForm.il12x12
          Style = ebsGlyphEh
          Width = 21
        end>
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1086#1073#1088#1072#1073#1072#1090#1099#1074#1072#1077#1084#1099#1081' '#1092#1072#1081#1083
      TabOrder = 5
      Visible = True
    end
  end
  object pnlProfilePay: TPanel
    Left = 0
    Top = 125
    Width = 804
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      804
      32)
    object lbl6: TLabel
      Left = 10
      Top = 9
      Width = 48
      Height = 13
      Caption = #1048#1089#1090#1086#1095#1085#1080#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 593
      Top = 9
      Width = 144
      Height = 13
      Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1076#1088#1086#1073#1085#1086#1081' '#1095#1072#1089#1090#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lcbPaymentSrc: TDBLookupComboboxEh
      Left = 130
      Top = 6
      Width = 225
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'PAYMENTSRC'
      DataSource = srcFileFormats
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      KeyField = 'PAYSOURCE_ID'
      ListField = 'PAYSOURCE_DESCR'
      ListSource = srcFileFormats
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object chkDataRemZero1: TDBCheckBoxEh
      Left = 417
      Top = 6
      Width = 119
      Height = 17
      Hint = #1045#1089#1083#1080' '#1091#1082#1072#1079#1072#1085#1086', '#1090#1086' '#1089#1091#1084#1084#1099' '#1087#1083#1072#1090#1077#1078#1077#1081' '#1073#1091#1076#1077#1084' '#1076#1077#1083#1080#1090#1100' '#1085#1072' 100'
      Alignment = taLeftJustify
      Caption = #1057#1091#1084#1084#1099' '#1074' '#1082#1086#1087#1077#1081#1082#1072#1093
      DataField = 'kopeyki'
      DataSource = srcFileFormats
      DynProps = <>
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtName1DecimalSprt: TDBEditEh
      Left = 748
      Top = 6
      Width = 44
      Height = 21
      Hint = 
        #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1076#1088#1086#1073#1085#1086#1081' '#1095#1072#1089#1090#1080' '#1074' '#1089#1091#1084#1084#1072#1093' '#1088#1077#1077#1089#1090#1088#1072'.'#13#10#1077#1089#1083#1080' '#1089#1091#1084#1084#1072' '#1091#1082#1072#1079#1072#1085#1072' ' +
        #1082#1072#1082' 300,0 - '#1090#1086' '#1087#1086#1089#1090#1072#1074#1100#1090#1077' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' ,'#13#10#1077#1089#1083#1080' '#1089#1091#1084#1084#1072' '#1091#1082#1072#1079#1072#1085#1072' '#1082#1072#1082' 3' +
        '00.0 - '#1090#1086' '#1087#1086#1089#1090#1072#1074#1100#1090#1077' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' .'#13#10#1080' '#1090'.'#1076'.'
      DataField = 'DecimalSprt'
      DataSource = srcFileFormats
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
  end
  object pnlExample: TPanel
    Left = 0
    Top = 157
    Width = 804
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'pnlExample'
    TabOrder = 2
    object lbl27: TLabel
      Left = 10
      Top = 9
      Width = 72
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1088' '#1092#1072#1081#1083#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edtExample: TDBEditEh
      Left = 130
      Top = 6
      Width = 662
      Height = 21
      DynProps = <>
      EditButtons = <
        item
          Images.NormalImages = MainForm.il12x12
          Style = ebsGlyphEh
          Width = 21
          OnClick = edtExampleEditButtons0Click
        end>
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1092#1072#1081#1083' '#1087#1088#1080#1084#1077#1088#1072' '#1076#1083#1103' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1092#1080#1083#1103
      TabOrder = 0
      Visible = True
      OnChange = edtExampleChange
    end
  end
  object memDBFFields: TMemTableEh
    Active = True
    Params = <>
    Left = 440
    Top = 400
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object NAME: TMTStringDataFieldEh
          FieldName = 'NAME'
          StringDataType = fdtStringEh
          DisplayLabel = 'NAME'
          DisplayWidth = 31
          Size = 31
          Transliterate = True
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object srcFieldName: TDataSource
    DataSet = memDBFFields
    Left = 526
    Top = 336
  end
  object src: TDataSource
    Left = 500
    Top = 352
  end
  object dsFileFormats: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PROFILES'
      'SET '
      '    PROFTYPE = :PROFTYPE,'
      '    FILETYPE = :FILETYPE,'
      '    FILEEXT = :FILEEXT,'
      '    FILEDIR = :FILEDIR,'
      '    PAYMENTSRC = :PAYMENTSRC,'
      '    CODEPAGE = :CODEPAGE,'
      '    ARCHDIR = :ARCHDIR,'
      '    KOPEYKI = :KOPEYKI,'
      '    DECIMALSPRT = :DECIMALSPRT,'
      '    HEADSUMLINE = :HEADSUMLINE,'
      '    HEADSUMCOL = :HEADSUMCOL,'
      '    HEADSPRT = :HEADSPRT,'
      '    HEADREMCH = :HEADREMCH,'
      '    HEADNUMLINE = :HEADNUMLINE,'
      '    HEADNUMCOL = :HEADNUMCOL,'
      '    HEADERTO = :HEADERTO,'
      '    HEADERFROM = :HEADERFROM,'
      '    HEADEREXIST = :HEADEREXIST,'
      '    HEADDATELINE = :HEADDATELINE,'
      '    HEADDATEFMT = :HEADDATEFMT,'
      '    HEADDATECOL = :HEADDATECOL,'
      '    DATAFROM = :DATAFROM,'
      '    DATATO = :DATATO,'
      '    DATASPRT = :DATASPRT,'
      '    DATAREMZERO = :DATAREMZERO,'
      '    DATAREMCH = :DATAREMCH,'
      '    ACCOUNT = :ACCOUNT,'
      '    FIO = :FIO,'
      '    ADRES = :ADRES,'
      '    HOUSE = :HOUSE,'
      '    KORP = :KORP,'
      '    FLAT = :FLAT,'
      '    DATADATE = :DATADATE,'
      '    DATEFMT = :DATEFMT,'
      '    DATASUM = :DATASUM,'
      '    EXTID = :EXTID,'
      '    NOTICE = :NOTICE,'
      '    NOTICE1 = :NOTICE1'
      'WHERE'
      '    PROFILE = :OLD_PROFILE'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PROFILES'
      'WHERE'
      '        PROFILE = :OLD_PROFILE'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PROFILES('
      '    PROFILE,'
      '    PROFTYPE,'
      '    FILETYPE,'
      '    FILEEXT,'
      '    FILEDIR,'
      '    PAYMENTSRC,'
      '    CODEPAGE,'
      '    ARCHDIR,'
      '    KOPEYKI,'
      '    DECIMALSPRT,'
      '    HEADSUMLINE,'
      '    HEADSUMCOL,'
      '    HEADSPRT,'
      '    HEADREMCH,'
      '    HEADNUMLINE,'
      '    HEADNUMCOL,'
      '    HEADERTO,'
      '    HEADERFROM,'
      '    HEADEREXIST,'
      '    HEADDATELINE,'
      '    HEADDATEFMT,'
      '    HEADDATECOL,'
      '    DATAFROM,'
      '    DATATO,'
      '    DATASPRT,'
      '    DATAREMZERO,'
      '    DATAREMCH,'
      '    ACCOUNT,'
      '    FIO,'
      '    ADRES,'
      '    HOUSE,'
      '    KORP,'
      '    FLAT,'
      '    DATADATE,'
      '    DATEFMT,'
      '    DATASUM,'
      '    EXTID,'
      '    NOTICE,'
      '    NOTICE1'
      ')'
      'VALUES('
      '    :PROFILE,'
      '    :PROFTYPE,'
      '    :FILETYPE,'
      '    :FILEEXT,'
      '    :FILEDIR,'
      '    :PAYMENTSRC,'
      '    :CODEPAGE,'
      '    :ARCHDIR,'
      '    :KOPEYKI,'
      '    :DECIMALSPRT,'
      '    :HEADSUMLINE,'
      '    :HEADSUMCOL,'
      '    :HEADSPRT,'
      '    :HEADREMCH,'
      '    :HEADNUMLINE,'
      '    :HEADNUMCOL,'
      '    :HEADERTO,'
      '    :HEADERFROM,'
      '    :HEADEREXIST,'
      '    :HEADDATELINE,'
      '    :HEADDATEFMT,'
      '    :HEADDATECOL,'
      '    :DATAFROM,'
      '    :DATATO,'
      '    :DATASPRT,'
      '    :DATAREMZERO,'
      '    :DATAREMCH,'
      '    :ACCOUNT,'
      '    :FIO,'
      '    :ADRES,'
      '    :HOUSE,'
      '    :KORP,'
      '    :FLAT,'
      '    :DATADATE,'
      '    :DATEFMT,'
      '    :DATASUM,'
      '    :EXTID,'
      '    :NOTICE,'
      '    :NOTICE1'
      ')')
    RefreshSQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    PROFILES '
      'WHERE(  '
      '    PROFILE=:PROFILE'
      '     ) and (     PROFILES.PROFILE = :OLD_PROFILE'
      '     )'
      '    '
      '')
    SelectSQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '    PROFILES '
      'WHERE '
      '    PROFILE=:PROFILE'
      '')
    OnNewRecord = dsFileFormatsNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 380
    Top = 260
  end
  object srcFileFormats: TDataSource
    DataSet = dsFileFormats
    Left = 460
    Top = 260
  end
  object dlgOpen: TOpenDialog
    Left = 600
    Top = 250
  end
end
