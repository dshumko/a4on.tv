object apgCustomerEdit: TapgCustomerEdit
  Left = 0
  Top = 0
  ActiveControl = LupStreets
  Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072
  ClientHeight = 521
  ClientWidth = 928
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 505
    Top = 0
    Height = 521
    ExplicitHeight = 713
  end
  object pnlRight: TPanel
    Left = 508
    Top = 0
    Width = 420
    Height = 521
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object pnlContacts: TPanel
      Left = 0
      Top = 286
      Width = 420
      Height = 235
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      object dbgrdhContacts: TDBGridEh
        Left = 0
        Top = 18
        Width = 420
        Height = 217
        Align = alClient
        DataSource = srcContacts
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghExtendVertLines]
        TabOrder = 1
        OnDblClick = dbgrdhContactsDblClick
        OnExit = dbgrdhContactsExit
        OnKeyUp = dbgrdhContactsKeyUp
        Columns = <
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'O_NAME'
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
            Checkboxes = True
            DynProps = <>
            EditButtons = <>
            FieldName = 'Cc_Notify'
            Footers = <>
            Title.Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
            Title.Hint = #1056#1072#1089#1089#1099#1083#1072#1090#1100' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1085#1072' '#1101#1090#1086#1090' '#1082#1086#1085#1090#1072#1082#1090
            Width = 43
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
      object pnlBtns: TPanel
        Left = 0
        Top = 0
        Width = 420
        Height = 18
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label11: TLabel
          Left = 0
          Top = 0
          Width = 66
          Height = 18
          Align = alLeft
          AutoSize = False
          Caption = #1050#1086#1085#1090#1072#1082#1090#1099' '
        end
        object btnCall: TSpeedButton
          Left = 123
          Top = 0
          Width = 258
          Height = 18
          Action = actMakeCall
          Align = alClient
          Flat = True
        end
        object Label14: TLabel
          Left = 102
          Top = 0
          Width = 21
          Height = 18
          Align = alLeft
          Caption = '       '
          ExplicitHeight = 13
        end
        object btnCAdd: TSpeedButton
          Left = 66
          Top = 0
          Width = 18
          Height = 18
          Align = alLeft
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
        object btnCDel: TSpeedButton
          Left = 402
          Top = 0
          Width = 18
          Height = 18
          Align = alRight
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
        object Label20: TLabel
          Left = 381
          Top = 0
          Width = 21
          Height = 18
          Align = alRight
          Caption = '       '
          ExplicitHeight = 13
        end
        object btnCEdit: TSpeedButton
          Left = 84
          Top = 0
          Width = 18
          Height = 18
          Align = alLeft
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
      end
    end
    object pnl2: TPanel
      Left = 0
      Top = 100
      Width = 420
      Height = 145
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 420
        Height = 145
        Align = alClient
        Caption = ' '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '
        Color = clWhite
        ParentColor = False
        TabOrder = 0
        object dbmmoNOTICE: TDBMemoEh
          Left = 2
          Top = 15
          Width = 416
          Height = 128
          Align = alClient
          AutoSize = False
          BorderStyle = bsNone
          DataField = 'NOTICE'
          DataSource = ds
          DynProps = <>
          EditButtons = <>
          ShowHint = True
          TabOrder = 0
          Visible = True
          WantReturns = True
        end
      end
    end
    object pnlScan: TPanel
      Left = 0
      Top = 245
      Width = 420
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        420
        41)
      object btnScan: TButton
        Left = 10
        Top = 7
        Width = 399
        Height = 25
        Action = actScan
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
      end
    end
    object pnlWarningInfo: TPanel
      Left = 0
      Top = 0
      Width = 420
      Height = 100
      Align = alTop
      Color = 13619199
      ParentBackground = False
      TabOrder = 3
      Visible = False
      DesignSize = (
        420
        100)
      object mmoWarning: TDBMemoEh
        Left = 1
        Top = 1
        Width = 418
        Height = 98
        Lines.Strings = (
          'mmoWarning')
        Align = alClient
        Alignment = taCenter
        AutoSize = False
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Ctl3D = True
        DynProps = <>
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 1
        Visible = True
        WantReturns = True
      end
      object btnCloseWarningInfo: TButton
        Left = 394
        Top = 5
        Width = 19
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'X'
        TabOrder = 0
        OnClick = btnCloseWarningInfoClick
      end
    end
  end
  object scrlbx1: TScrollBox
    Left = 0
    Top = 0
    Width = 505
    Height = 521
    Align = alLeft
    TabOrder = 0
    object pnlAddress: TPanel
      Left = 0
      Top = 0
      Width = 484
      Height = 129
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      DesignSize = (
        484
        129)
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
        Top = 3
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
        Left = 219
        Top = 3
        Width = 25
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1044#1086#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 236
      end
      object Label8: TLabel
        Left = 314
        Top = 3
        Width = 29
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1050#1074'-'#1088#1072
        ExplicitLeft = 331
      end
      object Label21: TLabel
        Left = 369
        Top = 3
        Width = 45
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1055#1086#1076#1098#1077#1079#1076
        ExplicitLeft = 386
      end
      object Label23: TLabel
        Left = 420
        Top = 3
        Width = 27
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1069#1090#1072#1078
        ExplicitLeft = 437
      end
      object lblContract: TLabel
        Left = 236
        Top = 45
        Width = 43
        Height = 13
        Caption = #1044#1086#1075#1086#1074#1086#1088
      end
      object chkJURIDICAL: TDBCheckBoxEh
        Left = 369
        Top = 103
        Width = 98
        Height = 17
        Hint = #1045#1089#1083#1080' '#1102#1088'. '#1083#1080#1094#1086' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1092#1083#1086#1078#1086#1082
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
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
        Width = 127
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'MANAGER_ID'
        DataSource = ds
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
        Top = 61
        Width = 127
        Height = 21
        Anchors = [akLeft, akTop, akRight]
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
        Top = 61
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
        Top = 61
        Width = 124
        Height = 21
        Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' '#1085#1086#1084#1077#1088
        TabOrder = 5
        TabStop = False
        OnClick = btnGetDogNumberClick
      end
      object LupStreets: TDBLookupComboboxEh
        Left = 8
        Top = 18
        Width = 205
        Height = 21
        Anchors = [akLeft, akTop, akRight]
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
          end>
        KeyField = 'STREET_ID'
        ListField = 'STREET_NAME'
        ListSource = srcStreet
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnExit = LupStreetsExit
      end
      object LupHOUSE_ID: TDBLookupComboboxEh
        Left = 219
        Top = 20
        Width = 89
        Height = 21
        Anchors = [akTop, akRight]
        DynProps = <>
        DataField = 'HOUSE_ID'
        DataSource = ds
        DropDownBox.Columns = <
          item
            FieldName = 'HOUSE_NO'
          end
          item
            FieldName = 'Subarea_Name'
            Width = 40
          end>
        DropDownBox.Sizable = True
        DropDownBox.Width = 200
        EmptyDataInfo.Text = #1044#1086#1084
        EditButtons = <
          item
            Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1076#1086#1084
            ShortCut = 45
            Style = ebsPlusEh
          end>
        KeyField = 'HOUSE_ID'
        ListField = 'HOUSE_NO'
        ListSource = srcHouse
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnExit = LupHOUSE_IDExit
      end
      object eFLAT_NO: TDBEditEh
        Tag = 7
        Left = 312
        Top = 20
        Width = 51
        Height = 21
        Hint = #1050#1074#1072#1088#1090#1080#1088#1072
        Anchors = [akTop, akRight]
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
        Left = 369
        Top = 20
        Width = 47
        Height = 21
        Hint = #1055#1086#1076#1098#1077#1079#1076
        Anchors = [akTop, akRight]
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
        Left = 420
        Top = 20
        Width = 47
        Height = 21
        Hint = #1069#1090#1072#1078
        Anchors = [akTop, akRight]
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
        Left = 369
        Top = 63
        Width = 98
        Height = 17
        Hint = 
          #1045#1089#1083#1080' '#1092#1083#1072#1078#1086#1082' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085', '#1090#1086' '#1072#1073#1086#1085#1077#1085#1090' '#1085#1077' '#1073#1091#1076#1077#1090' '#1073#1083#1086#1082#1080#1088#1086#1074#1072#1090#1100#1089#1103' '#1072#1074#1090#1086#1084#1072 +
          #1090#1080#1095#1077#1089#1082#1080
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
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
      Width = 484
      Height = 191
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      DesignSize = (
        484
        191)
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
        Top = 38
        Width = 75
        Height = 13
        Caption = #1055#1072#1089#1087#1086#1088#1090' '#1085#1086#1084#1077#1088
      end
      object lbl2: TLabel
        Tag = 1
        Left = 8
        Top = 75
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
        Top = 38
        Width = 78
        Height = 13
        Caption = #1055#1072#1089#1087#1086#1088#1090' '#1074#1099#1076#1072#1085
      end
      object Label4: TLabel
        Tag = 1
        Left = 152
        Top = 3
        Width = 19
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1048#1084#1103
        ExplicitLeft = 169
      end
      object Label9: TLabel
        Tag = 1
        Left = 312
        Top = 3
        Width = 49
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        ExplicitLeft = 329
      end
      object Label5: TLabel
        Tag = 1
        Left = 138
        Top = 75
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
        Width = 138
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SURNAME'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1060#1072#1084#1080#1083#1080#1103
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnEnter = eSURNAMEEnter
        OnExit = eSURNAMEExit
      end
      object edtPASSPORT_NUMBER: TDBEditEh
        Tag = 1
        Left = 8
        Top = 54
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
        OnEnter = edtBIRTHDAYEnter
        OnExit = edtBIRTHDAYExit
      end
      object edtADRES_REGISTR: TDBEditEh
        Tag = 1
        Left = 8
        Top = 129
        Width = 459
        Height = 21
        Anchors = [akLeft, akTop, akRight]
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
        Top = 54
        Width = 329
        Height = 21
        Anchors = [akLeft, akTop, akRight]
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
        Left = 152
        Top = 17
        Width = 155
        Height = 21
        Anchors = [akTop, akRight]
        DataField = 'FIRSTNAME'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1048#1084#1103
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnEnter = eFIRSTNAMEEnter
        OnExit = eSURNAMEExit
      end
      object eMIDLENAME: TDBEditEh
        Tag = 1
        Left = 312
        Top = 17
        Width = 155
        Height = 21
        Anchors = [akTop, akRight]
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
        Width = 329
        Height = 21
        Anchors = [akLeft, akTop, akRight]
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
        Width = 459
        Height = 21
        Anchors = [akLeft, akTop, akRight]
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
      Width = 484
      Height = 211
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      Visible = False
      DesignSize = (
        484
        211)
      object Label18: TLabel
        Tag = 2
        Left = 8
        Top = 3
        Width = 73
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      object lblINN: TLabel
        Tag = 2
        Left = 259
        Top = 3
        Width = 21
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1059#1053#1055
        ExplicitLeft = 276
      end
      object Label17: TLabel
        Tag = 2
        Left = 219
        Top = 39
        Width = 53
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088
        ExplicitLeft = 236
      end
      object lbl4: TLabel
        Tag = 1
        Left = 8
        Top = 76
        Width = 53
        Height = 13
        Caption = #1070#1088'. '#1072#1076#1088#1077#1089
      end
      object lblVAT: TLabel
        Left = 369
        Top = 3
        Width = 61
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1043#1088#1091#1087#1087#1072' '#1053#1044#1057
        ExplicitLeft = 386
      end
      object Label16: TLabel
        Tag = 2
        Left = 8
        Top = 39
        Width = 50
        Height = 13
        Caption = #1044#1080#1088#1077#1082#1090#1086#1088
      end
      object lbl1: TLabel
        Tag = 2
        Left = 8
        Top = 149
        Width = 33
        Height = 13
        Caption = #1056'/'#1089#1095#1077#1090
      end
      object lbl8: TLabel
        Tag = 2
        Left = 8
        Top = 171
        Width = 159
        Height = 13
        Caption = #1044#1086#1075#1086#1074#1086#1088' '#1074' '#1083#1080#1094#1077' '#1080' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080
      end
      object lbl5: TLabel
        Tag = 2
        Left = 199
        Top = 2
        Width = 32
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1060#1086#1088#1084#1072
        ExplicitLeft = 216
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
        Top = 17
        Width = 185
        Height = 21
        Anchors = [akLeft, akTop, akRight]
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
        Left = 259
        Top = 17
        Width = 106
        Height = 21
        Anchors = [akTop, akRight]
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
        Left = 219
        Top = 54
        Width = 248
        Height = 21
        Anchors = [akTop, akRight]
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
        Left = 8
        Top = 92
        Width = 459
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'ADRES_REGISTR'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089' ('#1077#1089#1083#1080' '#1086#1090#1083#1080#1095#1072#1077#1090#1089#1103' '#1086#1090' '#1086#1089#1085#1086#1074#1085#1086#1075#1086')'
        ShowHint = True
        TabOrder = 6
        Visible = True
      end
      object cbbVATG: TDBLookupComboboxEh
        Left = 369
        Top = 17
        Width = 98
        Height = 21
        Anchors = [akTop, akRight]
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
        Top = 54
        Width = 205
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'JUR_DIRECTOR'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1044#1080#1088#1077#1082#1090#1086#1088
        ShowHint = True
        TabOrder = 4
        Visible = True
      end
      object edtBANK_ACCOUNT: TDBEditEh
        Tag = 2
        Left = 47
        Top = 146
        Width = 420
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
        OnEnter = edtBANK_ACCOUNTEnter
        OnExit = edtBANK_ACCOUNTExit
      end
      object edtBASIS: TDBEditEh
        Tag = 2
        Left = 8
        Top = 185
        Width = 459
        Height = 21
        Anchors = [akLeft, akTop, akRight]
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
        Left = 199
        Top = 17
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
      object lcbBANK: TDBLookupComboboxEh
        Left = 47
        Top = 119
        Width = 420
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
        DropDownBox.Sizable = True
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
      Top = 531
      Width = 484
      Height = 109
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 3
      DesignSize = (
        484
        109)
      object lblOrg: TLabel
        Left = 8
        Top = 7
        Width = 96
        Height = 13
        Caption = #1054#1073#1089#1083'. '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
      end
      object Label7: TLabel
        Left = 8
        Top = 32
        Width = 63
        Height = 13
        Caption = #1055#1072#1088#1086#1083#1100' '#1082' '#1051#1050
      end
      object btn1: TSpeedButton
        Left = 78
        Top = 29
        Width = 21
        Height = 21
        Hint = #1057#1086#1079#1076#1072#1090#1100' '#1089#1083#1091#1095#1072#1081#1085#1099#1081' '#1087#1072#1088#1086#1083#1100
        Caption = '*'
        Flat = True
        OnClick = btn1Click
      end
      object lbl7: TLabel
        Left = 8
        Top = 56
        Width = 58
        Height = 13
        Caption = #1042#1085#1077#1096#1085#1080#1081' ID'
      end
      object dbchkHiden: TDBCheckBox
        Left = 8
        Top = 84
        Width = 112
        Height = 14
        Alignment = taLeftJustify
        Caption = #1101#1090#1086' '#1076#1088#1091#1075'!'
        DataField = 'INVISIBLE'
        DataSource = ds
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object btnSelectColor: TButton
        Left = 219
        Top = 78
        Width = 120
        Height = 25
        Hint = #1042#1099#1073#1088#1072#1090#1100' '#1092#1086#1085' '#1076#1083#1103' '#1074#1099#1076#1077#1083#1077#1085#1080#1103' '#1072#1073#1086#1085#1077#1085#1090#1072
        Anchors = [akTop, akRight]
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1086#1085
        TabOrder = 4
        TabStop = False
        OnClick = btnSelectColorClick
      end
      object btnClearColor: TButton
        Left = 347
        Top = 78
        Width = 120
        Height = 25
        Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1086#1085' '#1076#1083#1103' '#1074#1099#1076#1077#1083#1077#1085#1080#1103' '#1072#1073#1086#1085#1077#1085#1090#1072
        Anchors = [akTop, akRight]
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1086#1085
        TabOrder = 5
        TabStop = False
        OnClick = btnClearColorClick
      end
      object cbbORG_ID: TDBLookupComboboxEh
        Left = 107
        Top = 4
        Width = 360
        Height = 21
        Anchors = [akLeft, akTop, akRight]
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
      object edtSECRET: TDBEditEh
        Left = 107
        Top = 29
        Width = 360
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'SECRET'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1087#1072#1088#1086#1083#1100' '#1082' '#1083#1080#1095#1085#1086#1084#1091' '#1082#1072#1073#1080#1085#1077#1090#1091
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object edtExtID: TDBEditEh
        Left = 107
        Top = 53
        Width = 360
        Height = 21
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        DataField = 'EXTERNAL_ID'
        DataSource = ds
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = 'ID '#1074#1085#1077#1096#1085#1077#1081' '#1089#1080#1089#1090#1077#1084#1099
        ShowHint = True
        TabOrder = 2
        Visible = True
        OnExit = edtExtIDExit
      end
    end
  end
  object srcContacts: TDataSource
    AutoEdit = False
    DataSet = dsContacts
    OnUpdateData = srcContactsUpdateData
    Left = 775
    Top = 327
  end
  object ds: TDataSource
    Left = 515
    Top = 164
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
    Left = 511
    Top = 231
  end
  object srcOrg: TDataSource
    DataSet = dsOrg
    Left = 506
    Top = 275
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
    Left = 507
    Top = 381
  end
  object srcVATG: TDataSource
    AutoEdit = False
    DataSet = dsVATG
    Left = 508
    Top = 422
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 566
    Top = 348
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
    Left = 566
    Top = 292
  end
  object dsHouses: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    H.HOUSE_ID'
      '  , H.STREET_ID'
      '  , H.HOUSE_NO'
      '  , H.Q_FLAT'
      '  , H.ORG_ID'
      '  , sa.Subarea_Name '
      'FROM HOUSE H'
      
        '  left outer join Subarea sa on (sa.Subarea_Id = h.Subarea_Id)  ' +
        '  '
      'where h.street_id = :street_id'
      'order by h.HOUSE_NO')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    DataSource = srcStreet
    Left = 626
    Top = 294
  end
  object srcHouse: TDataSource
    DataSet = dsHouses
    Left = 626
    Top = 342
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
    Left = 554
    Top = 78
  end
  object srcExecutor: TDataSource
    AutoEdit = False
    DataSet = dsExecutor
    Left = 568
    Top = 237
  end
  object dsExecutor: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      
        ' W.WORKER_ID, w.SURNAME||'#39' '#39'||w.FIRSTNAME||'#39' '#39'||w.MIDLENAME as F' +
        'IO'
      'FROM WORKER W'
      'WHERE w.working = 1'
      'and w.in_dogovor = 1'
      'order BY 2')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 565
    Top = 222
  end
  object dsContacts: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Customer_Contacts_Iu(:Customer_Id, :Cc_Value, ' +
        ':Cc_Type, :Cc_Notice, :Cc_Notify, :OLD_CC_VALUE) ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CUSTOMER_CONTACTS'
      'WHERE'
      '        CUSTOMER_ID = :OLD_CUSTOMER_ID'
      '    and CC_VALUE = :OLD_CC_VALUE'
      '    ')
    InsertSQL.Strings = (
      
        'execute procedure Customer_Contacts_Iu(:Customer_Id, :Cc_Value, ' +
        ':Cc_Type, :Cc_Notice, :Cc_Notify, null)')
    RefreshSQL.Strings = (
      'select'
      '    cc.CUSTOMER_ID'
      '  , cc.CC_VALUE'
      '  , cc.CC_TYPE'
      '  , coalesce(cc.Cc_Notify, 0) Cc_Notify'
      '  , cc.CC_NOTICE'
      '  , o.O_Name'
      '  from customer_contacts cc'
      '       inner join OBJECTS o on (o.O_Id = cc.Cc_Type and'
      '             o.O_TYPE = 45 and'
      '             o.O_DELETED = 0)'
      'where   CC.CUSTOMER_ID = :OLD_CUSTOMER_ID'
      '    and CC.CC_VALUE = :OLD_CC_VALUE'
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    cc.CUSTOMER_ID'
      '  , cc.CC_VALUE'
      '  , cc.CC_TYPE'
      '  , coalesce(cc.Cc_Notify, 0) Cc_Notify'
      '  , cc.CC_NOTICE'
      '  , o.O_Name'
      '  from customer_contacts cc'
      '       inner join OBJECTS o on (o.O_Id = cc.Cc_Type and'
      '             o.O_TYPE = 45 and'
      '             o.O_DELETED = 0)'
      '  where customer_id = :CUSTOMER_ID'
      '  order by CC_TYPE, CC_VALUE')
    AutoCalcFields = False
    OnNewRecord = dsContactsNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = ds
    Left = 769
    Top = 257
  end
  object ColorDialog1: TColorDialog
    Left = 565
    Top = 386
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 360
    Top = 152
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
    Left = 700
    Top = 58
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
    Left = 744
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
    Top = 60
  end
  object actlst1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 808
    Top = 64
    object actMakeCall: TAction
      Hint = #1055#1086#1079#1074#1086#1085#1080#1090#1100' ('#1085#1072#1087#1080#1089#1072#1090#1100') '#1085#1072' '#1082#1086#1085#1090#1072#1082#1090
      ImageIndex = 81
      OnExecute = actMakeCallExecute
    end
    object actScan: TAction
      Caption = #1057#1082#1072#1085#1080#1088#1086#1074#1072#1090#1100' '#1080' '#1079#1072#1087#1086#1083#1085#1080#1090#1100
      ShortCut = 117
      OnExecute = actScanExecute
    end
    object actExAddressEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1072#1076#1088#1077#1089
      ShortCut = 113
      OnExecute = actExAddressEditExecute
    end
  end
  object PropStorageEh1: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'scrlbx1.<P>.Width')
    Left = 780
    Top = 425
  end
  object srcBanks: TDataSource
    AutoEdit = False
    DataSet = dsBANKS
    Left = 656
    Top = 478
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
    Left = 657
    Top = 525
  end
end
