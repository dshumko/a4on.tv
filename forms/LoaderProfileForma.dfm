object LoaderProfileForm: TLoaderProfileForm
  Left = 397
  Top = 122
  ActiveControl = edtProfile
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1086#1092#1080#1083#1103' '#1076#1083#1103' '#1080#1084#1087#1086#1088#1090#1072' '#1090#1077#1082#1089#1090#1086#1074#1099#1093' '#1092#1072#1081#1083#1086#1074
  ClientHeight = 706
  ClientWidth = 776
  Color = clBtnFace
  Constraints.MinHeight = 650
  Constraints.MinWidth = 700
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
  DesignSize = (
    776
    706)
  PixelsPerInch = 96
  TextHeight = 13
  object lbl4: TLabel
    Left = 0
    Top = 105
    Width = 776
    Height = 39
    Align = alTop
    AutoSize = False
    Caption = ' '#1055#1088#1080#1084#1077#1088
  end
  object grpProfHead: TGroupBox
    Left = 0
    Top = 0
    Width = 776
    Height = 105
    Align = alTop
    Caption = ' '#1055#1088#1086#1092#1080#1083#1100' '
    TabOrder = 0
    object Panel1: TPanel
      Left = 2
      Top = 15
      Width = 772
      Height = 82
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        772
        82)
      object lbl1: TLabel
        Left = 4
        Top = 4
        Width = 48
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      end
      object lbl3: TLabel
        Left = 2
        Top = 32
        Width = 72
        Height = 13
        Caption = #1052#1072#1089#1082#1072' '#1092#1072#1081#1083#1086#1074
      end
      object lbl2: TLabel
        Left = 406
        Top = 4
        Width = 97
        Height = 13
        Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072' '#1092#1072#1081#1083#1086#1074
      end
      object Label1: TLabel
        Left = 2
        Top = 62
        Width = 103
        Height = 13
        Caption = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1081' '#1092#1072#1081#1083#1086#1074
      end
      object Label13: TLabel
        Left = 199
        Top = 32
        Width = 48
        Height = 13
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082
      end
      object lbl5: TLabel
        Left = 594
        Top = 32
        Width = 144
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1076#1088#1086#1073#1085#1086#1081' '#1095#1072#1089#1090#1080
      end
      object lbl8: TLabel
        Left = 199
        Top = 4
        Width = 73
        Height = 13
        Caption = #1060#1086#1088#1084#1072#1090' '#1092#1072#1081#1083#1072
      end
      object Label2: TLabel
        Left = 406
        Top = 62
        Width = 115
        Height = 13
        Caption = #1040#1088#1093#1080#1074#1085#1099#1081' '#1076#1080#1088#1077#1082#1090#1086#1088#1080#1081
      end
      object DirFiles: TDirectoryEdit
        Left = 108
        Top = 59
        Width = 291
        Height = 21
        Hint = #1044#1080#1088#1077#1082#1090#1086#1088#1080#1081' '#1074' '#1082#1086#1090#1086#1088#1086#1084' '#1083#1077#1078#1072#1090' '#1085#1077#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077' '#1088#1077#1077#1089#1090#1088#1099' '
        GlyphKind = gkCustom
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000001FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D5
          4848482323232121212121212121212121212121212121212121212121214242
          42DCDCDCFFFFFFFFFFFFFFFFFF484848515151FEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF9999996C6C6CFFFFFFFFFFFFFFFFFF232323
          2D2D2DF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEF
          EF2E2E2EF7F7F7FFFFFFFFFFFF2121215E5E5EB4B4B4FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E5E5EB6B6B6FFFFFFFFFFFF212121
          A8A8A86C6C6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFA8A8A86C6C6CFFFFFFFFFFFF212121EEEEEE2F2F2FE8E8E8FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED2C2C2CFFFFFFFFFFFF212121
          FFFFFF9C9C9C2929292121212121212121212121212121212121212121212121
          21222222616161FFFFFFFFFFFF212121FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFEFEABABAB494949FFFFFFFFFFFFFFFFFFFFFFFF222222
          FEFEFEFFFFFFFFFFFFFFFFFFF5F5F5616161222222212121232323484848D5D5
          D5FFFFFFFFFFFFFFFFFFFFFFFF494949AEAEAEFEFEFEFFFFFFF6F6F65C5C5C77
          7777FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D5
          4848482323232121212424247A7A7AFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 1
        TabOrder = 7
        Text = ''
        OnChange = DirFilesChange
      end
      object edtProfile: TDBEditEh
        Left = 60
        Top = 1
        Width = 125
        Height = 21
        Hint = #1053#1072#1079#1074#1072#1085#1080#1103' '#1087#1088#1086#1092#1080#1083#1103
        DataField = 'Profile'
        DataSource = srcmdsFileFormat
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086')'
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
      object edtFileExt: TDBEditEh
        Left = 81
        Top = 29
        Width = 104
        Height = 21
        DataField = 'FileExt'
        DataSource = srcmdsFileFormat
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 3
        Visible = True
      end
      object cbdbCodePage: TDBComboBoxEh
        Left = 527
        Top = 1
        Width = 241
        Height = 21
        Hint = #1042' '#1082#1072#1082#1086#1081' '#1082#1086#1076#1080#1088#1086#1074#1082#1077' '#1092#1072#1081#1083' (Windows, DOS)'
        Anchors = [akLeft, akTop, akRight]
        DataField = 'CodePage'
        DataSource = srcmdsFileFormat
        DynProps = <>
        EditButtons = <>
        Items.Strings = (
          #1050#1080#1088#1080#1083#1080#1094#1072' (DOS 866)'
          #1050#1080#1088#1080#1083#1080#1094#1072' (Windows 1251)')
        KeyItems.Strings = (
          '0'
          '1')
        ShowHint = True
        TabOrder = 2
        Visible = True
      end
      object cbbPaymentSrc: TDBLookupComboboxEh
        Left = 277
        Top = 29
        Width = 122
        Height = 21
        DynProps = <>
        DataField = 'PaymentSrc'
        DataSource = srcmdsFileFormat
        EditButtons = <>
        KeyField = 'PAYSOURCE_ID'
        ListField = 'PAYSOURCE_DESCR'
        ListSource = LoaderReestrForm.srcPaymentSrc
        ShowHint = True
        TabOrder = 4
        Visible = True
      end
      object dbchckbxhDataRemZero1: TDBCheckBoxEh
        Left = 406
        Top = 31
        Width = 118
        Height = 17
        Hint = #1045#1089#1083#1080' '#1091#1082#1072#1079#1072#1085#1086', '#1090#1086' '#1089#1091#1084#1084#1099' '#1087#1083#1072#1090#1077#1078#1077#1081' '#1073#1091#1076#1077#1084' '#1076#1077#1083#1080#1090#1100' '#1085#1072' 100'
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        Caption = #1057#1091#1084#1084#1099' '#1074' '#1082#1086#1087#1077#1081#1082#1072#1093
        DataField = 'kopeyki'
        DataSource = srcmdsFileFormat
        DynProps = <>
        TabOrder = 6
      end
      object dbedtHeadRemCh1: TDBEditEh
        Left = 748
        Top = 29
        Width = 20
        Height = 21
        Hint = 
          #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1076#1088#1086#1073#1085#1086#1081' '#1095#1072#1089#1090#1080' '#1074' '#1089#1091#1084#1084#1072#1093' '#1088#1077#1077#1089#1090#1088#1072'.'#13#10#1077#1089#1083#1080' '#1089#1091#1084#1084#1072' '#1091#1082#1072#1079#1072#1085#1072' ' +
          #1082#1072#1082' 300,0 - '#1090#1086' '#1087#1086#1089#1090#1072#1074#1100#1090#1077' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' ,'#13#10#1077#1089#1083#1080' '#1089#1091#1084#1084#1072' '#1091#1082#1072#1079#1072#1085#1072' '#1082#1072#1082' 3' +
          '00.0 - '#1090#1086' '#1087#1086#1089#1090#1072#1074#1100#1090#1077' '#1088#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' .'#13#10#1080' '#1090'.'#1076'.'
        Anchors = [akTop, akRight]
        DataField = 'DecimalSprt'
        DataSource = srcmdsFileFormat
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 5
        Visible = True
      end
      object cbFileFormat: TDBComboBoxEh
        Left = 277
        Top = 1
        Width = 122
        Height = 21
        DataField = 'FileType'
        DataSource = srcmdsFileFormat
        DynProps = <>
        EditButtons = <>
        Items.Strings = (
          #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1092#1072#1081#1083
          'DBF '#1092#1072#1081#1083)
        KeyItems.Strings = (
          '0'
          '1')
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnChange = cbFileFormatChange
      end
      object DirArch: TDirectoryEdit
        Left = 527
        Top = 59
        Width = 241
        Height = 21
        Hint = 
          #1044#1080#1088#1077#1082#1090#1086#1088#1080#1081' '#1074' '#1082#1086#1090#1086#1088#1099#1081' '#1087#1077#1088#1077#1085#1086#1089#1080#1090#1100' '#1086#1073#1088#1072#1073#1086#1090#1072#1085#1085#1099#1077' '#1088#1077#1077#1089#1090#1088#1099' '#13#10#1055#1072#1088#1072#1084#1077#1090#1088#1099 +
          ' '#1079#1072#1084#1077#1085#1099' [Y] - '#1087#1086#1076#1089#1090#1072#1074#1083#1103#1077#1090' '#1075#1086#1076', [M] - '#1087#1086#1076#1089#1090#1072#1074#1083#1103#1077#1090' '#1084#1077#1089#1103#1094' '
        GlyphKind = gkCustom
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000C40E0000C40E00000000000000000001FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D5
          4848482323232121212121212121212121212121212121212121212121214242
          42DCDCDCFFFFFFFFFFFFFFFFFF484848515151FEFEFEFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF9999996C6C6CFFFFFFFFFFFFFFFFFF232323
          2D2D2DF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEF
          EF2E2E2EF7F7F7FFFFFFFFFFFF2121215E5E5EB4B4B4FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E5E5EB6B6B6FFFFFFFFFFFF212121
          A8A8A86C6C6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFA8A8A86C6C6CFFFFFFFFFFFF212121EEEEEE2F2F2FE8E8E8FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED2C2C2CFFFFFFFFFFFF212121
          FFFFFF9C9C9C2929292121212121212121212121212121212121212121212121
          21222222616161FFFFFFFFFFFF212121FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFEFEFEABABAB494949FFFFFFFFFFFFFFFFFFFFFFFF222222
          FEFEFEFFFFFFFFFFFFFFFFFFF5F5F5616161222222212121232323484848D5D5
          D5FFFFFFFFFFFFFFFFFFFFFFFF494949AEAEAEFEFEFEFFFFFFF6F6F65C5C5C77
          7777FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D5
          4848482323232121212424247A7A7AFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
        NumGlyphs = 1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 8
        Text = ''
      end
    end
  end
  object pnlBtns: TPanel
    Left = 0
    Top = 676
    Width = 776
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      776
      30)
    object btnOk: TButton
      Left = 188
      Top = 2
      Width = 437
      Height = 25
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 650
      Top = 2
      Width = 121
      Height = 25
      Anchors = [akTop, akRight, akBottom]
      Caption = #1053#1077' '#1089#1086#1093#1088#1072#1085#1103#1090#1100
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnDel: TButton
      Left = 7
      Top = 2
      Width = 126
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1092#1080#1083#1100
      TabOrder = 2
      OnClick = btnDelClick
    end
  end
  object pgcFileFormats: TPageControl
    Left = 0
    Top = 144
    Width = 776
    Height = 532
    ActivePage = ts1
    Align = alClient
    TabOrder = 2
    object ts1: TTabSheet
      Caption = 'TXT'
      object spl1: TSplitter
        Left = 0
        Top = 137
        Width = 768
        Height = 5
        Cursor = crVSplit
        Align = alTop
      end
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 768
        Height = 137
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object sgFile: TStringGrid
          Left = 2
          Top = 2
          Width = 764
          Height = 133
          Hint = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1088#1077#1077#1089#1090#1088#1072
          TabStop = False
          Align = alClient
          ColCount = 2
          Ctl3D = False
          RowCount = 2
          FixedRows = 0
          Options = [goFixedVertLine, goRowSelect]
          ParentCtl3D = False
          TabOrder = 0
          RowHeights = (
            24
            24)
        end
      end
      object grpFileHead: TGroupBox
        Left = 0
        Top = 142
        Width = 768
        Height = 157
        Align = alTop
        TabOrder = 1
        object stgHead: TStringGrid
          Left = 297
          Top = 15
          Width = 469
          Height = 140
          Hint = #1041#1083#1086#1082' '#1079#1072#1075#1086#1083#1086#1074#1082#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          TabStop = False
          Align = alClient
          ColCount = 2
          Ctl3D = False
          DefaultColWidth = 30
          DefaultRowHeight = 20
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing]
          ParentCtl3D = False
          TabOrder = 2
        end
        object pnlHeadHead: TPanel
          Left = 2
          Top = 15
          Width = 295
          Height = 140
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object lbl9: TLabel
            Left = 6
            Top = 8
            Width = 49
            Height = 13
            Caption = #1057#1090#1088#1086#1082#1080': '#1089
          end
          object lbl10: TLabel
            Left = 102
            Top = 8
            Width = 12
            Height = 13
            Caption = #1087#1086
          end
          object lbl11: TLabel
            Left = 164
            Top = 8
            Width = 66
            Height = 13
            Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100
          end
          object lbl12: TLabel
            Left = 6
            Top = 35
            Width = 90
            Height = 13
            Caption = #1059#1076#1072#1083#1103#1090#1100' '#1089#1080#1084#1074#1086#1083#1099
          end
          object lbl13: TLabel
            Left = 6
            Top = 70
            Width = 31
            Height = 13
            Caption = #1053#1086#1084#1077#1088
          end
          object lbl14: TLabel
            Left = 6
            Top = 94
            Width = 31
            Height = 13
            Caption = #1057#1091#1084#1084#1072
          end
          object lbl15: TLabel
            Left = 6
            Top = 118
            Width = 26
            Height = 13
            Caption = #1044#1072#1090#1072
          end
          object lbl16: TLabel
            Left = 134
            Top = 118
            Width = 68
            Height = 13
            Caption = #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099
          end
          object lbl6: TLabel
            Left = 44
            Top = 52
            Width = 37
            Height = 13
            Caption = #1057#1090#1088#1086#1082#1072
          end
          object lbl7: TLabel
            Left = 84
            Top = 52
            Width = 43
            Height = 13
            Caption = #1050#1086#1083#1086#1085#1082#1072
          end
          object Label17: TLabel
            Left = 134
            Top = 70
            Width = 63
            Height = 13
            Hint = 
              #1050#1086#1076' '#1080#1089#1090#1086#1095#1085#1080#1082#1072' '#1087#1083#1072#1090#1077#1078#1072', '#1077#1089#1083#1080' '#1091#1082#1072#1079#1072#1085' '#1073#1077#1088#1077#1084' '#1101#1090#1086#1090' '#1080#1089#1090#1086#1095#1085#1080#1082' '#1072' '#1085#1077' '#1080#1079' '#1096 +
              #1072#1087#1082#1080
            Caption = #1050#1086#1076' '#1080#1089#1090'. '#1087#1083'.'
          end
          object edtHeaderFrom: TDBNumberEditEh
            Left = 63
            Top = 5
            Width = 33
            Height = 21
            Hint = 
              #1057' '#1082#1072#1082#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1074' '#1092#1072#1081#1083#1077' '#1085#1072#1095#1080#1085#1072#1077#1090#1089#1103' '#1073#1083#1086#1082' '#1089#1091#1084#1084#1072#1088#1085#1086#1081' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080#13#10'('#1087#1077 +
              #1088#1074#1099#1081' '#1089#1090#1086#1083#1073#1077#1094' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1099')'
            DataField = 'HeaderFrom'
            DataSource = srcmdsFileFormat
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnExit = HeaderInfoChange
          end
          object edtHeaderTo: TDBNumberEditEh
            Left = 118
            Top = 5
            Width = 33
            Height = 21
            Hint = 
              #1055#1086' '#1082#1072#1082#1091#1102' '#1089#1090#1088#1086#1082#1091' '#1074' '#1092#1072#1081#1083#1077' '#1073#1083#1086#1082' '#1089#1091#1084#1084#1072#1088#1085#1086#1081' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1080#13#10'('#1074#1090#1086#1088#1086#1081' '#1089#1090#1086#1083#1073 +
              #1077#1094' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1099')'
            DataField = 'HeaderTo'
            DataSource = srcmdsFileFormat
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            ShowHint = True
            TabOrder = 1
            Visible = True
            OnExit = HeaderInfoChange
          end
          object edtHNc: TDBNumberEditEh
            Left = 84
            Top = 67
            Width = 33
            Height = 21
            Hint = #1042' '#1082#1072#1082#1086#1081' '#1082#1086#1083#1086#1085#1082#1077' '#1085#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataField = 'headNumCol'
            DataSource = srcmdsFileFormat
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            ShowHint = True
            TabOrder = 5
            Visible = True
          end
          object edtheadSumCol: TDBNumberEditEh
            Left = 84
            Top = 91
            Width = 33
            Height = 21
            Hint = #1042' '#1082#1072#1082#1086#1081' '#1082#1086#1083#1086#1085#1082#1077' '#1086#1073#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataField = 'headSumCol'
            DataSource = srcmdsFileFormat
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            ShowHint = True
            TabOrder = 7
            Visible = True
          end
          object edtheadDateCol: TDBNumberEditEh
            Left = 84
            Top = 115
            Width = 33
            Height = 21
            Hint = #1042' '#1082#1072#1082#1086#1081' '#1082#1086#1083#1086#1085#1082#1077' '#1076#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataField = 'headDateCol'
            DataSource = srcmdsFileFormat
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            ShowHint = True
            TabOrder = 9
            Visible = True
          end
          object edtheadNumLine: TDBNumberEditEh
            Left = 44
            Top = 67
            Width = 33
            Height = 21
            Hint = #1042' '#1082#1072#1082#1086#1081' '#1089#1090#1088#1086#1082#1077' '#1085#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataField = 'headNumLine'
            DataSource = srcmdsFileFormat
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            ShowHint = True
            TabOrder = 4
            Visible = True
          end
          object edtheadSumLine: TDBNumberEditEh
            Left = 44
            Top = 91
            Width = 33
            Height = 21
            Hint = #1042' '#1082#1072#1082#1086#1081' '#1089#1090#1088#1086#1082#1077' '#1086#1073#1097#1072#1103' '#1089#1091#1084#1084#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataField = 'headSumLine'
            DataSource = srcmdsFileFormat
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            ShowHint = True
            TabOrder = 6
            Visible = True
          end
          object edtheadDateLine: TDBNumberEditEh
            Left = 44
            Top = 115
            Width = 33
            Height = 21
            Hint = #1042' '#1082#1072#1082#1086#1081' '#1089#1090#1088#1086#1082#1077' '#1076#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            DataField = 'headDateLine'
            DataSource = srcmdsFileFormat
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            ShowHint = True
            TabOrder = 8
            Visible = True
          end
          object dbedtHeadSprt: TDBEditEh
            Left = 245
            Top = 5
            Width = 36
            Height = 21
            Hint = 
              #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1076#1072#1085#1085#1099#1093' '#1074' '#1089#1090#1088#1086#1082#1077#13#10' \t - '#1089#1080#1084#1074#1086#1083' '#1090#1072#1073#1091#1083#1103#1094#1080#1080#13#10' \_ - '#1087#1088#1086#1073#1077 +
              #1083
            DataField = 'HeadSprt'
            DataSource = srcmdsFileFormat
            DynProps = <>
            EditButtons = <>
            ShowHint = True
            TabOrder = 2
            Visible = True
            OnExit = HeaderInfoChange
          end
          object dbedtHeadRemCh: TDBEditEh
            Left = 100
            Top = 32
            Width = 96
            Height = 21
            Hint = #1059#1076#1072#1083#1103#1090#1100' '#1089#1080#1084#1074#1086#1083#1099' '#1080#1079' '#1089#1090#1088#1086#1082#1080' '#1079#1072#1075#1086#1083#1086#1074#1082#1072' \_ - '#1087#1088#1086#1073#1077#1083
            DataField = 'HeadRemCh'
            DataSource = srcmdsFileFormat
            DynProps = <>
            EditButtons = <>
            ShowHint = True
            TabOrder = 3
            Visible = True
            OnExit = HeaderInfoChange
          end
          object dbedtheadDateFmt: TDBEditEh
            Left = 206
            Top = 115
            Width = 75
            Height = 21
            Hint = 
              #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099' '#13#10#1044#1077#1085#1100':'#13#10'  DD - 01, 02, 22 '#1080' '#1090'.'#1076'.'#13#10'  DDD - '#1087#1086#1085', '#1074#1090' '#1080 +
              ' '#1090'.'#1076'.'#13#10'  DDDD - '#1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082', '#1074#1090#1086#1088#1085#1080#1082', '#1089#1088#1077#1076#1072'...'#13#10#1052#1077#1089#1103#1094':'#13#10'  MM   0' +
              '1..12'#13#10'  MMM  '#1071#1053#1042', '#1060#1045#1042' '#1080' '#1090'.'#1076'.'#13#10'  MMMM '#1071#1053#1042#1040#1056#1068', '#1060#1045#1042#1056#1040#1051#1068' '#1080' '#1090'.'#1076'.'#13#10#1043#1086 +
              #1076':'#13#10'  YY    '#1076#1074#1077' '#1094#1080#1092#1088#1099' 09'#13#10'  YYYY  '#1095#1077#1090#1099#1088#1077' '#1094#1080#1092#1088#1099' 2009'#13#10#1063#1072#1089#1099': '#13#10'  H' +
              'H 01..24'#13#10#1052#1080#1085#1091#1090#1099':'#13#10'  NN 00..59'#13#10#1057#1077#1082#1091#1085#1076#1099': '#13#10'  SS 00..59'#13#10#13#10' AP AM'
            DataField = 'headDateFmt'
            DataSource = srcmdsFileFormat
            DynProps = <>
            EditButtons = <>
            ShowHint = True
            TabOrder = 10
            Visible = True
          end
          object edtheadSrcLine: TDBNumberEditEh
            Left = 206
            Top = 67
            Width = 33
            Height = 21
            Hint = #1042' '#1082#1072#1082#1086#1081' '#1089#1090#1088#1086#1082#1077' '#1082#1086#1076' '#1080#1089#1090#1086#1095#1085#1080#1082#1072' '#1087#1083#1072#1090#1077#1078#1072
            TabStop = False
            DataField = 'headSrcLine'
            DataSource = srcmdsFileFormat
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            ShowHint = True
            TabOrder = 11
            Visible = True
          end
          object edtheadSrcCol: TDBNumberEditEh
            Left = 245
            Top = 67
            Width = 36
            Height = 21
            Hint = #1042' '#1082#1072#1082#1086#1081' '#1082#1086#1083#1086#1085#1082#1077' '#1082#1086#1076' '#1080#1089#1090#1086#1095#1085#1080#1082#1072' '#1087#1083#1072#1090#1077#1078#1072
            TabStop = False
            DataField = 'headSrcCol'
            DataSource = srcmdsFileFormat
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            ShowHint = True
            TabOrder = 12
            Visible = True
          end
        end
        object dbchkHeaderExist: TDBCheckBox
          Left = 8
          Top = 0
          Width = 145
          Height = 17
          Hint = 
            #1045#1089#1090#1100' '#1083#1080' '#1074' '#1092#1072#1081#1083#1077' '#1089#1091#1084#1072#1088#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' ('#1086#1073#1097#1072#1103' '#1089#1091#1084#1084#1072', '#1082#1086#1083'-'#1074#1086' '#1079#1072#1087#1080#1089#1077#1081 +
            ')'
          Caption = ' '#1057#1091#1084#1084#1072#1088#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
          DataField = 'HeaderExist'
          DataSource = srcmdsFileFormat
          TabOrder = 0
          OnClick = dbchkHeaderExistClick
        end
      end
      object grpFileData: TGroupBox
        Left = 0
        Top = 299
        Width = 768
        Height = 205
        Align = alClient
        Caption = ' '#1055#1083#1072#1090#1077#1078#1080' '
        TabOrder = 2
        object stgData: TStringGrid
          Left = 305
          Top = 15
          Width = 461
          Height = 188
          Hint = #1041#1083#1086#1082' '#1076#1072#1085#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          TabStop = False
          Align = alClient
          ColCount = 2
          Ctl3D = False
          DefaultColWidth = 30
          DefaultRowHeight = 20
          RowCount = 2
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goRowSizing, goColSizing]
          ParentCtl3D = False
          PopupMenu = pm1
          TabOrder = 1
          RowHeights = (
            20
            20)
        end
        object pnlHeadData: TScrollBox
          Left = 2
          Top = 15
          Width = 303
          Height = 188
          VertScrollBar.Position = 2
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object lbl17: TLabel
            Left = 2
            Top = 5
            Width = 49
            Height = 13
            Caption = #1057#1090#1088#1086#1082#1080': '#1089
          end
          object lbl18: TLabel
            Left = 100
            Top = 5
            Width = 12
            Height = 13
            Caption = #1087#1086
          end
          object lbl19: TLabel
            Left = 162
            Top = 5
            Width = 66
            Height = 13
            Caption = #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100
          end
          object lbl20: TLabel
            Left = 2
            Top = 37
            Width = 90
            Height = 13
            Caption = #1059#1076#1072#1083#1103#1090#1100' '#1089#1080#1084#1074#1086#1083#1099
          end
          object edtDataTo: TDBNumberEditEh
            Left = 116
            Top = 2
            Width = 33
            Height = 21
            Hint = #1055#1086' '#1082#1072#1082#1091#1102' '#1089#1090#1088#1086#1082#1091' '#1074' '#1092#1072#1081#1083#1077' '#1076#1072#1085#1085#1099#1077#13#10'('#1074#1090#1086#1088#1086#1081' '#1089#1090#1086#1083#1073#1077#1094' '#1074#1077#1088#1093#1085#1077#1081' '#1090#1072#1073#1083#1080#1094#1099')'
            DataField = 'DataTo'
            DataSource = srcmdsFileFormat
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            ShowHint = True
            TabOrder = 1
            Visible = True
            OnExit = dataInfoChange
          end
          object edtDataFrom: TDBNumberEditEh
            Left = 62
            Top = 2
            Width = 33
            Height = 21
            Hint = 
              #1057' '#1082#1072#1082#1086#1081' '#1089#1090#1088#1086#1082#1080' '#1074' '#1092#1072#1081#1083#1077' '#1085#1072#1095#1080#1085#1072#1102#1090#1089#1103' '#1076#1072#1085#1085#1099#1077#13#10'('#1087#1077#1088#1074#1099#1081' '#1089#1090#1086#1083#1073#1077#1094' '#1074#1077#1088#1093#1085#1077 +
              #1081' '#1090#1072#1073#1083#1080#1094#1099')'
            DataField = 'DataFrom'
            DataSource = srcmdsFileFormat
            DecimalPlaces = 0
            DynProps = <>
            EditButton.Enabled = False
            EditButtons = <>
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnExit = dataInfoChange
          end
          object edtDataRemCh: TEdit
            Left = 108
            Top = 92
            Width = 85
            Height = 21
            TabOrder = 6
          end
          object grp1: TGroupBox
            Left = 0
            Top = 62
            Width = 281
            Height = 210
            Caption = ' '#1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1086#1083#1077#1081' '
            TabOrder = 5
            object lbl21: TLabel
              Left = 4
              Top = 24
              Width = 43
              Height = 13
              Caption = #1051#1080#1094#1077#1074#1086#1081
            end
            object lbl22: TLabel
              Left = 4
              Top = 48
              Width = 23
              Height = 13
              Caption = #1060#1048#1054
            end
            object lbl23: TLabel
              Left = 4
              Top = 72
              Width = 70
              Height = 13
              Caption = #1040#1076#1088#1077#1089'('#1059#1083#1080#1094#1072')'
            end
            object lbl24: TLabel
              Left = 4
              Top = 96
              Width = 31
              Height = 13
              Caption = #1057#1091#1084#1084#1072
            end
            object lbl25: TLabel
              Left = 4
              Top = 119
              Width = 73
              Height = 13
              Caption = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
            end
            object lbl26: TLabel
              Left = 118
              Top = 119
              Width = 68
              Height = 13
              Caption = #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099
            end
            object Label3: TLabel
              Left = 139
              Top = 24
              Width = 129
              Height = 39
              Caption = #1059#1082#1072#1078#1080#1090#1077' '#1085#1086#1084#1077#1088#1072' '#1082#1086#1083#1086#1085#1086#1082#13#10#1076#1083#1103' '#1089#1086#1086#1090#1074#1077#1090#1089#1090#1074#1080#1103' '#13#10#1076#1072#1085#1085#1099#1093' '#1089' '#1041#1044
            end
            object Label5: TLabel
              Left = 4
              Top = 143
              Width = 60
              Height = 13
              Caption = #8470' '#1087#1083#1072#1090#1077#1078#1072
            end
            object Label6: TLabel
              Left = 4
              Top = 167
              Width = 61
              Height = 13
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1102
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            end
            object Label7: TLabel
              Left = 118
              Top = 167
              Width = 87
              Height = 13
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1102
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1076#1086#1087'.'
            end
            object Label8: TLabel
              Left = 118
              Top = 72
              Width = 20
              Height = 13
              Caption = #1044#1086#1084
            end
            object Label9: TLabel
              Left = 229
              Top = 72
              Width = 12
              Height = 13
              Caption = #1082#1074
            end
            object Label15: TLabel
              Left = 170
              Top = 72
              Width = 28
              Height = 13
              Caption = #1082#1086#1088#1087'.'
            end
            object lbl27: TLabel
              Left = 4
              Top = 190
              Width = 58
              Height = 13
              Hint = 'ID '#1074#1085#1077#1096#1085#1077#1081' '#1089#1080#1089#1090#1077#1084#1099
              Caption = #1042#1085#1077#1096#1085#1080#1081' ID'
            end
            object edtACCOUNT: TDBNumberEditEh
              Left = 82
              Top = 21
              Width = 33
              Height = 21
              DataField = 'ACCOUNT'
              DataSource = srcmdsFileFormat
              DecimalPlaces = 0
              DynProps = <>
              EditButton.Enabled = False
              EditButtons = <>
              ShowHint = True
              TabOrder = 0
              Visible = True
              OnEnter = edtACCOUNTEnter
            end
            object edtFIO: TDBNumberEditEh
              Left = 82
              Top = 45
              Width = 33
              Height = 21
              DataField = 'FIO'
              DataSource = srcmdsFileFormat
              DecimalPlaces = 0
              DynProps = <>
              EditButtons = <>
              ShowHint = True
              TabOrder = 1
              Visible = True
              OnEnter = edtACCOUNTEnter
            end
            object edtADRESS: TDBNumberEditEh
              Left = 82
              Top = 69
              Width = 33
              Height = 21
              DataField = 'ADRESS'
              DataSource = srcmdsFileFormat
              DecimalPlaces = 0
              DynProps = <>
              EditButton.Enabled = False
              EditButtons = <>
              ShowHint = True
              TabOrder = 2
              Visible = True
              OnEnter = edtACCOUNTEnter
            end
            object edtSUMMA: TDBNumberEditEh
              Left = 82
              Top = 93
              Width = 33
              Height = 21
              DataField = 'SUMMA'
              DataSource = srcmdsFileFormat
              DecimalPlaces = 0
              DynProps = <>
              EditButton.Enabled = False
              EditButtons = <>
              ShowHint = True
              TabOrder = 6
              Visible = True
              OnEnter = edtACCOUNTEnter
            end
            object edtDATE: TDBNumberEditEh
              Left = 82
              Top = 116
              Width = 33
              Height = 21
              DataField = 'PayDate'
              DataSource = srcmdsFileFormat
              DecimalPlaces = 0
              DynProps = <>
              EditButton.Enabled = False
              EditButtons = <>
              ShowHint = True
              TabOrder = 7
              Visible = True
              OnEnter = edtACCOUNTEnter
            end
            object dbedtheadDateFmt1: TDBEditEh
              Left = 197
              Top = 116
              Width = 79
              Height = 21
              Hint = 
                #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099' '#13#10#1044#1077#1085#1100':'#13#10'  DD - 01, 02, 22 '#1080' '#1090'.'#1076'.'#13#10'  DDD - '#1087#1086#1085', '#1074#1090' '#1080 +
                ' '#1090'.'#1076'.'#13#10'  DDDD - '#1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082', '#1074#1090#1086#1088#1085#1080#1082', '#1089#1088#1077#1076#1072'...'#13#10#1052#1077#1089#1103#1094':'#13#10'  MM   0' +
                '1..12'#13#10'  MMM  '#1071#1053#1042', '#1060#1045#1042' '#1080' '#1090'.'#1076'.'#13#10'  MMMM '#1071#1053#1042#1040#1056#1068', '#1060#1045#1042#1056#1040#1051#1068' '#1080' '#1090'.'#1076'.'#13#10#1043#1086 +
                #1076':'#13#10'  YY    '#1076#1074#1077' '#1094#1080#1092#1088#1099' 09'#13#10'  YYYY  '#1095#1077#1090#1099#1088#1077' '#1094#1080#1092#1088#1099' 2009'#13#10#1063#1072#1089#1099': '#13#10'  H' +
                'H 01..24'#13#10#1052#1080#1085#1091#1090#1099':'#13#10'  NN 00..59'#13#10#1057#1077#1082#1091#1085#1076#1099': '#13#10'  SS 00..59'#13#10#13#10' AP AM'
              DataField = 'DATEfmt'
              DataSource = srcmdsFileFormat
              DynProps = <>
              EditButtons = <>
              ShowHint = True
              TabOrder = 8
              Visible = True
            end
            object DBNumberEditEh1: TDBNumberEditEh
              Left = 82
              Top = 140
              Width = 33
              Height = 21
              DataField = 'PAYMENT_NO'
              DataSource = srcmdsFileFormat
              DecimalPlaces = 0
              DynProps = <>
              EditButton.Enabled = False
              EditButtons = <>
              ShowHint = True
              TabOrder = 9
              Visible = True
              OnEnter = edtACCOUNTEnter
            end
            object DBNumberEditEh2: TDBNumberEditEh
              Left = 82
              Top = 164
              Width = 33
              Height = 21
              DataField = 'NOTICE1'
              DataSource = srcmdsFileFormat
              DecimalPlaces = 0
              DynProps = <>
              EditButton.Enabled = False
              EditButtons = <>
              ShowHint = True
              TabOrder = 10
              Visible = True
              OnEnter = edtACCOUNTEnter
            end
            object DBNumberEditEh3: TDBNumberEditEh
              Left = 224
              Top = 164
              Width = 52
              Height = 21
              DataField = 'NOTICE2'
              DataSource = srcmdsFileFormat
              DecimalPlaces = 0
              DynProps = <>
              EditButton.Enabled = False
              EditButtons = <>
              ShowHint = True
              TabOrder = 11
              Visible = True
              OnEnter = edtACCOUNTEnter
            end
            object DBNumberEditEh4: TDBNumberEditEh
              Left = 139
              Top = 69
              Width = 30
              Height = 21
              DataField = 'HOUSE'
              DataSource = srcmdsFileFormat
              DecimalPlaces = 0
              DynProps = <>
              EditButton.Enabled = False
              EditButtons = <>
              ShowHint = True
              TabOrder = 3
              Visible = True
              OnEnter = edtACCOUNTEnter
            end
            object DBNumberEditEh5: TDBNumberEditEh
              Left = 243
              Top = 69
              Width = 33
              Height = 21
              DataField = 'FLAT'
              DataSource = srcmdsFileFormat
              DecimalPlaces = 0
              DynProps = <>
              EditButton.Enabled = False
              EditButtons = <>
              ShowHint = True
              TabOrder = 4
              Visible = True
              OnEnter = edtACCOUNTEnter
            end
            object DBNumberEditEh6: TDBNumberEditEh
              Left = 197
              Top = 69
              Width = 28
              Height = 21
              DataField = 'KORP'
              DataSource = srcmdsFileFormat
              DecimalPlaces = 0
              DynProps = <>
              EditButton.Enabled = False
              EditButtons = <>
              ShowHint = True
              TabOrder = 5
              Visible = True
              OnEnter = edtACCOUNTEnter
            end
            object edtNOTICE1: TDBNumberEditEh
              Left = 82
              Top = 187
              Width = 33
              Height = 21
              DataField = 'EXT_ID'
              DataSource = srcmdsFileFormat
              DecimalPlaces = 0
              DynProps = <>
              EditButton.Enabled = False
              EditButtons = <>
              ShowHint = True
              TabOrder = 12
              Visible = True
              OnEnter = edtACCOUNTEnter
            end
          end
          object dbchckbxhDataRemZero: TDBCheckBoxEh
            Left = 203
            Top = 36
            Width = 78
            Height = 17
            Hint = #1059#1076#1072#1083#1103#1090#1100' '#1083#1080#1076#1080#1088#1091#1102#1097#1080#1077' 0 '#1074' '#1083#1080#1094#1077#1074#1086#1084' '#1089#1095#1077#1090#1077
            Alignment = taLeftJustify
            Caption = #1059#1076#1072#1083#1103#1090#1100' 0'
            DataField = 'DataRemZero'
            DataSource = srcmdsFileFormat
            DynProps = <>
            TabOrder = 4
          end
          object dbedtHeadRemCh2: TDBEditEh
            Left = 98
            Top = 34
            Width = 96
            Height = 21
            Hint = #1059#1076#1072#1083#1103#1090#1100' '#1089#1080#1084#1074#1086#1083#1099' '#1080#1079' '#1089#1090#1088#1086#1082#1080' '#1076#1072#1085#1085#1099#1093' \_ - '#1087#1088#1086#1073#1077#1083
            DataField = 'DataRemCh'
            DataSource = srcmdsFileFormat
            DynProps = <>
            EditButtons = <>
            ShowHint = True
            TabOrder = 3
            Visible = True
            OnExit = dataInfoChange
          end
          object dbedtHeadSprt1: TDBEditEh
            Left = 243
            Top = 2
            Width = 36
            Height = 21
            Hint = 
              #1056#1072#1079#1076#1077#1083#1080#1090#1077#1083#1100' '#1076#1072#1085#1085#1099#1093' '#1074' '#1089#1090#1088#1086#1082#1077' '#13#10' \t - '#1089#1080#1084#1074#1086#1083' '#1090#1072#1073#1091#1083#1103#1094#1080#1080#13#10' \_ - '#1087#1088#1086#1073 +
              #1077#1083
            DataField = 'DataSprt'
            DataSource = srcmdsFileFormat
            DynProps = <>
            EditButtons = <>
            ShowHint = True
            TabOrder = 2
            Visible = True
            OnExit = dataInfoChange
          end
        end
      end
    end
    object ts2: TTabSheet
      Caption = 'DBF'
      ImageIndex = 1
      object Splitter1: TSplitter
        Left = 0
        Top = 137
        Width = 768
        Height = 5
        Cursor = crVSplit
        Align = alTop
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 768
        Height = 137
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 2
          Top = 2
          Width = 764
          Height = 133
          Hint = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1088#1077#1077#1089#1090#1088#1072
          Align = alClient
          DataSource = src
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 142
        Width = 768
        Height = 362
        Align = alClient
        Caption = ' '#1055#1083#1072#1090#1077#1078#1080' '
        TabOrder = 1
        object Panel4: TPanel
          Left = 2
          Top = 15
          Width = 764
          Height = 345
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Edit1: TEdit
            Left = 108
            Top = 94
            Width = 85
            Height = 21
            TabOrder = 2
          end
          object GroupBox3: TGroupBox
            Left = 14
            Top = 16
            Width = 289
            Height = 281
            Caption = ' '#1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1086#1083#1077#1081' '
            TabOrder = 1
            object Label18: TLabel
              Left = 8
              Top = 24
              Width = 43
              Height = 13
              Caption = #1051#1080#1094#1077#1074#1086#1081
            end
            object Label19: TLabel
              Left = 8
              Top = 48
              Width = 23
              Height = 13
              Caption = #1060#1048#1054
            end
            object Label20: TLabel
              Left = 8
              Top = 72
              Width = 73
              Height = 13
              Caption = #1040#1076#1088#1077#1089' ('#1059#1083#1080#1094#1072')'
            end
            object Label21: TLabel
              Left = 8
              Top = 119
              Width = 31
              Height = 13
              Caption = #1057#1091#1084#1084#1072
            end
            object Label22: TLabel
              Left = 8
              Top = 142
              Width = 73
              Height = 13
              Caption = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
            end
            object Label23: TLabel
              Left = 8
              Top = 165
              Width = 68
              Height = 13
              Caption = #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099
            end
            object Label4: TLabel
              Left = 8
              Top = 190
              Width = 60
              Height = 13
              Caption = #8470' '#1087#1083#1072#1090#1077#1078#1072
            end
            object Label10: TLabel
              Left = 11
              Top = 95
              Width = 20
              Height = 13
              Caption = #1044#1086#1084
            end
            object Label11: TLabel
              Left = 201
              Top = 95
              Width = 12
              Height = 13
              Caption = #1082#1074
            end
            object Label12: TLabel
              Left = 8
              Top = 215
              Width = 61
              Height = 13
              Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            end
            object Label14: TLabel
              Left = 105
              Top = 95
              Width = 28
              Height = 13
              Caption = #1082#1086#1088#1087'.'
            end
            object Label16: TLabel
              Left = 8
              Top = 241
              Width = 58
              Height = 13
              Caption = #1042#1085#1077#1096#1085#1080#1081' ID'
            end
            object DBEdit4: TDBEditEh
              Left = 88
              Top = 162
              Width = 196
              Height = 21
              Hint = 
                #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099' '#13#10#1044#1077#1085#1100':'#13#10'  DD - 01, 02, 22 '#1080' '#1090'.'#1076'.'#13#10'  DDD - '#1087#1086#1085', '#1074#1090' '#1080 +
                ' '#1090'.'#1076'.'#13#10'  DDDD - '#1087#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082', '#1074#1090#1086#1088#1085#1080#1082', '#1089#1088#1077#1076#1072'...'#13#10#1052#1077#1089#1103#1094':'#13#10'  MM   0' +
                '1..12'#13#10'  MMM  '#1071#1053#1042', '#1060#1045#1042' '#1080' '#1090'.'#1076'.'#13#10'  MMMM '#1071#1053#1042#1040#1056#1068', '#1060#1045#1042#1056#1040#1051#1068' '#1080' '#1090'.'#1076'.'#13#10#1043#1086 +
                #1076':'#13#10'  YY    '#1076#1074#1077' '#1094#1080#1092#1088#1099' 09'#13#10'  YYYY  '#1095#1077#1090#1099#1088#1077' '#1094#1080#1092#1088#1099' 2009'#13#10#1063#1072#1089#1099': '#13#10'  H' +
                'H 01..24'#13#10#1052#1080#1085#1091#1090#1099':'#13#10'  NN 00..59'#13#10#1057#1077#1082#1091#1085#1076#1099': '#13#10'  SS 00..59'#13#10#13#10' AP AM'
              DataField = 'DATEfmt'
              DataSource = srcmdsFileFormat
              DynProps = <>
              EditButtons = <>
              EmptyDataInfo.Text = #1060#1086#1088#1084#1072#1090' '#1076#1072#1090#1099'. '#1055#1088#1080#1084#1077#1088' YYYY/MM/DD'
              ShowHint = True
              TabOrder = 8
              Visible = True
            end
            object lcbDBF_FIO: TDBLookupComboboxEh
              Left = 88
              Top = 45
              Width = 196
              Height = 21
              DynProps = <>
              DataField = 'DBF_FIO'
              DataSource = srcmdsFileFormat
              EmptyDataInfo.Text = #1060#1048#1054
              EditButtons = <>
              KeyField = 'NAME'
              ListField = 'NAME'
              ListSource = srcFieldName
              ShowHint = True
              TabOrder = 1
              Visible = True
            end
            object lcbDBF_ADRES: TDBLookupComboboxEh
              Left = 88
              Top = 69
              Width = 196
              Height = 21
              DynProps = <>
              DataField = 'DBF_ADRES'
              DataSource = srcmdsFileFormat
              EmptyDataInfo.Text = #1040#1076#1088#1077#1089
              EditButtons = <>
              KeyField = 'NAME'
              ListField = 'NAME'
              ListSource = srcFieldName
              ShowHint = True
              TabOrder = 2
              Visible = True
            end
            object lcbDBF_SUM: TDBLookupComboboxEh
              Left = 88
              Top = 116
              Width = 196
              Height = 21
              DynProps = <>
              DataField = 'DBF_SUM'
              DataSource = srcmdsFileFormat
              EmptyDataInfo.Text = #1057#1091#1084#1084#1072' '#1087#1083#1072#1090#1077#1078#1072
              EditButtons = <>
              KeyField = 'NAME'
              ListField = 'NAME'
              ListSource = srcFieldName
              ShowHint = True
              TabOrder = 6
              Visible = True
            end
            object lcbDBF_date: TDBLookupComboboxEh
              Left = 88
              Top = 138
              Width = 196
              Height = 21
              DynProps = <>
              DataField = 'DBF_date'
              DataSource = srcmdsFileFormat
              EmptyDataInfo.Text = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
              EditButtons = <>
              KeyField = 'NAME'
              ListField = 'NAME'
              ListSource = srcFieldName
              ShowHint = True
              TabOrder = 7
              Visible = True
            end
            object lcbDBF_account: TDBLookupComboboxEh
              Left = 88
              Top = 21
              Width = 196
              Height = 21
              DynProps = <>
              DataField = 'DBF_account'
              DataSource = srcmdsFileFormat
              EmptyDataInfo.Text = #1051#1080#1094#1077#1074#1086#1081
              EditButtons = <>
              KeyField = 'NAME'
              ListField = 'NAME'
              ListSource = srcFieldName
              ShowHint = True
              TabOrder = 0
              Visible = True
            end
            object lcbDBFPAYMENT_NO: TDBLookupComboboxEh
              Left = 88
              Top = 187
              Width = 196
              Height = 21
              DynProps = <>
              DataField = 'DBFPAYMENT_NO'
              DataSource = srcmdsFileFormat
              EmptyDataInfo.Text = #8470' '#1087#1083#1072#1090#1077#1078#1072
              EditButtons = <>
              KeyField = 'NAME'
              ListField = 'NAME'
              ListSource = srcFieldName
              ShowHint = True
              TabOrder = 9
              Visible = True
            end
            object lcbDBF_HOUSE: TDBLookupComboboxEh
              Left = 34
              Top = 92
              Width = 71
              Height = 21
              DynProps = <>
              DataField = 'DBF_HOUSE'
              DataSource = srcmdsFileFormat
              EditButtons = <>
              KeyField = 'NAME'
              ListField = 'NAME'
              ListSource = srcFieldName
              ShowHint = True
              TabOrder = 3
              Visible = True
            end
            object lcbDBF_FLAT: TDBLookupComboboxEh
              Left = 213
              Top = 92
              Width = 71
              Height = 21
              DynProps = <>
              DataField = 'DBF_FLAT'
              DataSource = srcmdsFileFormat
              EditButtons = <>
              KeyField = 'NAME'
              ListField = 'NAME'
              ListSource = srcFieldName
              ShowHint = True
              TabOrder = 5
              Visible = True
            end
            object lcbDBF_NOTICE: TDBLookupComboboxEh
              Left = 88
              Top = 212
              Width = 196
              Height = 21
              DynProps = <>
              DataField = 'DBF_NOTICE'
              DataSource = srcmdsFileFormat
              EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              EditButtons = <>
              KeyField = 'NAME'
              ListField = 'NAME'
              ListSource = srcFieldName
              ShowHint = True
              TabOrder = 10
              Visible = True
            end
            object lcbDBF_KORP: TDBLookupComboboxEh
              Left = 132
              Top = 92
              Width = 66
              Height = 21
              DynProps = <>
              DataField = 'DBF_KORP'
              DataSource = srcmdsFileFormat
              EditButtons = <>
              KeyField = 'NAME'
              ListField = 'NAME'
              ListSource = srcFieldName
              ShowHint = True
              TabOrder = 4
              Visible = True
            end
            object lcbEXT_ID: TDBLookupComboboxEh
              Left = 88
              Top = 238
              Width = 196
              Height = 21
              DynProps = <>
              DataField = 'DBF_EXTERNAL'
              DataSource = srcmdsFileFormat
              EmptyDataInfo.Text = #1042#1085#1077#1096#1085#1080#1081' ID'
              EditButtons = <>
              KeyField = 'NAME'
              ListField = 'NAME'
              ListSource = srcFieldName
              ShowHint = True
              TabOrder = 11
              Visible = True
            end
          end
          object DBCheckBoxEh1: TDBCheckBoxEh
            Left = 318
            Top = 39
            Width = 211
            Height = 17
            Hint = #1059#1076#1072#1083#1103#1090#1100' '#1083#1080#1076#1080#1088#1091#1102#1097#1080#1077' 0 '#1074' '#1083#1080#1094#1077#1074#1086#1084' '#1089#1095#1077#1090#1077
            Alignment = taLeftJustify
            Caption = #1059#1076#1072#1083#1103#1090#1100' 0'
            DataField = 'DataRemZero'
            DataSource = srcmdsFileFormat
            DynProps = <>
            TabOrder = 0
          end
          object chkNotLoadLast: TDBCheckBoxEh
            Left = 318
            Top = 63
            Width = 211
            Height = 17
            Hint = #1053#1077' '#1079#1072#1075#1088#1091#1078#1072#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1089#1090#1088#1086#1082#1091
            Alignment = taLeftJustify
            Caption = #1053#1077' '#1079#1072#1075#1088#1091#1078#1072#1090#1100' '#1087#1086#1089#1083#1077#1076#1085#1102#1102' '#1089#1090#1088#1086#1082#1091
            DataField = 'DBF_NotLast'
            DataSource = srcmdsFileFormat
            DynProps = <>
            TabOrder = 3
          end
          object chkSkipEmpDate: TDBCheckBoxEh
            Left = 318
            Top = 87
            Width = 211
            Height = 17
            Hint = #1053#1077' '#1079#1072#1075#1088#1091#1078#1072#1090#1100' '#1089#1090#1088#1086#1082#1091' '#1077#1089#1083#1080' '#1085#1077' '#1091#1082#1072#1079#1072#1085#1072' '#1074' '#1089#1090#1088#1086#1082#1077' '#1076#1072#1090#1072
            Alignment = taLeftJustify
            Caption = #1055#1088#1086#1087#1091#1089#1082#1072#1090#1100', '#1077#1089#1083#1080' '#1085#1077#1090' '#1076#1072#1090#1099' '#1087#1083#1072#1090#1077#1078#1072
            DataField = 'SkipEmpDate'
            DataSource = srcmdsFileFormat
            DynProps = <>
            TabOrder = 4
          end
        end
      end
    end
    object tsXLS: TTabSheet
      Caption = 'XLS'
      ImageIndex = 2
    end
  end
  object feExample: TFilenameEdit
    Left = 4
    Top = 121
    Width = 767
    Height = 21
    Hint = #1056#1077#1077#1089#1090#1088' - '#1087#1088#1080#1084#1077#1088'. '#1085#1072' '#1082#1086#1090#1086#1088#1086#1084' '#1085#1072#1089#1090#1088#1072#1080#1074#1072#1077#1090#1089#1103' '#1087#1088#1086#1092#1080#1083#1100
    GlyphKind = gkCustom
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000C40E0000C40E00000000000000000001FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D5
      4848482323232121212121212121212121212121212121212121212121214242
      42DCDCDCFFFFFFFFFFFFFFFFFF484848515151FEFEFEFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF9999996C6C6CFFFFFFFFFFFFFFFFFF232323
      2D2D2DF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEF
      EF2E2E2EF7F7F7FFFFFFFFFFFF2121215E5E5EB4B4B4FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5E5E5EB6B6B6FFFFFFFFFFFF212121
      A8A8A86C6C6CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFA8A8A86C6C6CFFFFFFFFFFFF212121EEEEEE2F2F2FE8E8E8FFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDEDED2C2C2CFFFFFFFFFFFF212121
      FFFFFF9C9C9C2929292121212121212121212121212121212121212121212121
      21222222616161FFFFFFFFFFFF212121FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFEFEFEABABAB494949FFFFFFFFFFFFFFFFFFFFFFFF222222
      FEFEFEFFFFFFFFFFFFFFFFFFF5F5F5616161222222212121232323484848D5D5
      D5FFFFFFFFFFFFFFFFFFFFFFFF494949AEAEAEFEFEFEFFFFFFF6F6F65C5C5C77
      7777FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5D5D5
      4848482323232121212424247A7A7AFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    Anchors = [akLeft, akTop, akRight]
    NumGlyphs = 1
    TabOrder = 1
    Text = ''
    OnChange = feExampleChange
  end
  object pm1: TPopupMenu
    Left = 328
    Top = 490
    object N1: TMenuItem
      Caption = #1051#1080#1094#1077#1074#1086#1081
    end
    object N2: TMenuItem
      Caption = #1060#1048#1054
    end
    object N3: TMenuItem
      Caption = #1040#1076#1088#1077#1089
    end
    object N4: TMenuItem
      Caption = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
    end
    object N5: TMenuItem
      Caption = #1089#1091#1084#1084#1072
    end
  end
  object srcmdsFileFormat: TDataSource
    AutoEdit = False
    DataSet = LoaderReestrForm.mdsFileFormats
    Left = 466
    Top = 499
  end
  object src: TDataSource
    Left = 324
    Top = 536
  end
  object srcFieldName: TDataSource
    DataSet = memDBFFields
    Left = 406
    Top = 488
  end
  object memDBFFields: TMemTableEh
    Active = True
    Params = <>
    Left = 408
    Top = 536
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
end
