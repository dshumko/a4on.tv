object CustomerAddons: TCustomerAddons
  Left = 0
  Top = 0
  Width = 762
  Height = 308
  TabOrder = 0
  OnResize = FrameResize
  object pcAddInfo: TPageControl
    Left = 0
    Top = 0
    Width = 762
    Height = 308
    ActivePage = tsRequests
    Align = alClient
    TabOrder = 0
    OnChange = pcAddInfoChange
    object tsAddInfo: TTabSheet
      Caption = #1057#1074#1077#1076#1077#1085#1080#1103
      object Panel6: TPanel
        Left = 561
        Top = 0
        Width = 193
        Height = 280
        Align = alClient
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 1
          Top = 1
          Width = 191
          Height = 278
          Align = alClient
          Caption = ' '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '
          Color = clWhite
          ParentColor = False
          TabOrder = 0
          object memCustNotice: TMemo
            Left = 2
            Top = 15
            Width = 187
            Height = 261
            Align = alClient
            BorderStyle = bsNone
            Lines.Strings = (
              'memCustNotice')
            TabOrder = 0
            OnChange = memCustNoticeChange
            OnExit = memCustNoticeExit
          end
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 561
        Height = 280
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        TabOrder = 1
        object Label11: TLabel
          Left = 5
          Top = 128
          Width = 36
          Height = 13
          Caption = #1057#1090#1072#1090#1091#1089
        end
        object Label9: TLabel
          Left = 5
          Top = 103
          Width = 42
          Height = 13
          Caption = #1055#1072#1089#1087#1086#1088#1090
        end
        object Label6: TLabel
          Left = 5
          Top = 56
          Width = 31
          Height = 13
          Caption = #1040#1076#1088#1077#1089
        end
        object Label5: TLabel
          Left = 5
          Top = 6
          Width = 52
          Height = 13
          Caption = #8470' '#1083'. '#1089#1095#1077#1090
        end
        object Label3: TLabel
          Left = 5
          Top = 32
          Width = 23
          Height = 13
          Caption = #1060#1048#1054
        end
        object Label12: TLabel
          Left = 161
          Top = 103
          Width = 33
          Height = 13
          Caption = #1074#1099#1076#1072#1085
        end
        object Label10: TLabel
          Left = 172
          Top = 6
          Width = 43
          Height = 13
          Caption = #1044#1086#1075#1086#1074#1086#1088
        end
        object Label2: TLabel
          Left = 409
          Top = 6
          Width = 64
          Height = 13
          Caption = #1044#1072#1090#1072' '#1087#1086#1076#1082#1083'.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 5
          Top = 79
          Width = 44
          Height = 13
          Caption = #1058#1077#1083#1077#1092#1086#1085
        end
        object Label15: TLabel
          Left = 223
          Top = 79
          Width = 58
          Height = 13
          Caption = #1052#1086#1073#1080#1083#1100#1085#1099#1081
        end
        object Label1: TLabel
          Left = 302
          Top = 6
          Width = 12
          Height = 13
          Caption = #1086#1090
        end
        object sbRecalc: TSpeedButton
          Left = 434
          Top = 88
          Width = 121
          Height = 22
          Align = alCustom
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Spacing = 10
        end
        object gbSaldo: TGroupBox
          Left = 432
          Top = 30
          Width = 123
          Height = 59
          Hint = #1057#1072#1083#1100#1076#1086' '#1088#1072#1089#1095#1077#1090#1086#1074
          Caption = ' '#1057#1072#1083#1100#1076#1086' '
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          object DBTextDebt: TDBText
            Left = 2
            Top = 15
            Width = 119
            Height = 25
            Align = alClient
            Alignment = taRightJustify
            AutoSize = True
            DataField = 'DEBT_SUM'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object pnlPrepay: TPanel
            Left = 2
            Top = 40
            Width = 119
            Height = 17
            Hint = #1054#1073#1077#1097#1072#1085#1085#1099#1081' '#1087#1083#1072#1090#1077#1078
            Align = alBottom
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object dbtxtPrepay: TDBText
              Left = 0
              Top = 0
              Width = 119
              Height = 17
              Hint = #1054#1073#1077#1097#1072#1085#1085#1099#1081' '#1087#1083#1072#1090#1077#1078
              Align = alClient
              Alignment = taRightJustify
              AutoSize = True
              DataField = 'PREPAY_SUM'
              DataSource = srcPrepay
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
          end
        end
        object DBEdit6: TDBEdit
          Tag = 1
          Left = 62
          Top = 103
          Width = 95
          Height = 18
          BorderStyle = bsNone
          Color = clWhite
          DataField = 'PASSPORT_NUMBER'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbeACCOUNT_NO: TDBEdit
          Tag = 1
          Left = 62
          Top = 6
          Width = 110
          Height = 18
          BorderStyle = bsNone
          Color = clWhite
          DataField = 'ACCOUNT_NO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Tag = 1
          Left = 210
          Top = 103
          Width = 209
          Height = 18
          BorderStyle = bsNone
          Color = clWhite
          DataField = 'PASSPORT_REGISTRATION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBDateTimeEditCONTRACT_DATE: TDBDateTimeEditEh
          Tag = 8
          Left = 317
          Top = 6
          Width = 89
          Height = 18
          AutoSize = False
          BorderStyle = bsNone
          Color = clWhite
          DataField = 'CONTRACT_DATE'
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Kind = dtkDateEh
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
          Visible = True
        end
        object DBDateTimeEditEh1: TDBDateTimeEditEh
          Tag = 8
          Left = 475
          Top = 6
          Width = 81
          Height = 18
          Hint = #1044#1072#1090#1072' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
          BorderStyle = bsNone
          Color = clWhite
          DataField = 'ACTIVIZ_DATE'
          EditButton.Visible = False
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Kind = dtkDateEh
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 2
          Visible = True
        end
        object DBEdit2: TDBEdit
          Tag = 4
          Left = 62
          Top = 79
          Width = 159
          Height = 18
          BorderStyle = bsNone
          Color = clWhite
          DataField = 'PHONE_NO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object EdMobile: TDBEdit
          Tag = 4
          Left = 290
          Top = 79
          Width = 110
          Height = 18
          BorderStyle = bsNone
          Color = clWhite
          DataField = 'MOBILE_PHONE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBEdit9: TDBEdit
          Tag = 1
          Left = 217
          Top = 6
          Width = 79
          Height = 18
          BorderStyle = bsNone
          Color = clWhite
          DataField = 'DOGOVOR_NO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
        object edFIO: TEdit
          Left = 62
          Top = 30
          Width = 333
          Height = 18
          BorderStyle = bsNone
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
          Text = 'FIO'
        end
        object edAdres: TEdit
          Left = 62
          Top = 54
          Width = 346
          Height = 18
          BorderStyle = bsNone
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 10
          Text = 'Adres'
        end
        object memState: TDBMemo
          Left = 62
          Top = 125
          Width = 493
          Height = 66
          Align = alCustom
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clWhite
          DataField = 'CUST_STATE_DESCR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
        end
      end
    end
    object tsSubscrServ: TTabSheet
      Caption = #1055#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1091#1089#1083#1091#1075#1080
      ImageIndex = 2
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 754
        Height = 280
        Align = alClient
        Caption = 'Panel7'
        TabOrder = 0
        object pnlSubscrServ: TPanel
          Left = 1
          Top = 1
          Width = 642
          Height = 278
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Splitter3: TSplitter
            Left = 0
            Top = 192
            Width = 642
            Height = 3
            Cursor = crVSplit
            Align = alBottom
          end
          object dbgCustSubscrServ: TDBGridEh
            Left = 0
            Top = 0
            Width = 642
            Height = 192
            Align = alClient
            AllowedOperations = []
            AutoFitColWidths = False
            DataGrouping.GroupLevels = <>
            DataSource = srcServices
            EvenRowColor = clWindow
            Flat = True
            FooterColor = clWindow
            FooterFont.Charset = DEFAULT_CHARSET
            FooterFont.Color = clWindowText
            FooterFont.Height = -11
            FooterFont.Name = 'Tahoma'
            FooterFont.Style = []
            OddRowColor = clInfoBk
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
            PopupMenu = pmServices
            ReadOnly = True
            RowDetailPanel.Color = clBtnFace
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            VTitleMargin = 4
            Columns = <
              item
                EditButtons = <>
                FieldName = 'NAME'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
                Title.TitleButton = True
                Width = 122
              end
              item
                AutoFitColWidth = False
                EditButtons = <>
                FieldName = 'STATE'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1057#1090#1072#1090#1091#1089
                Title.TitleButton = True
                Width = 100
              end
              item
                AutoFitColWidth = False
                EditButtons = <>
                FieldName = 'STATE_DATE'
                Footers = <>
                Title.Caption = #1044#1072#1090#1072' '#1089#1090'.'
                Title.Hint = #1044#1072#1090#1072' '#1089#1090#1072#1090#1091#1089#1072
                Title.TitleButton = True
                Width = 59
              end
              item
                AutoFitColWidth = False
                EditButtons = <>
                FieldName = 'STATE_SRV_NAME'
                Footers = <>
                Title.Caption = #1059#1089#1083#1091#1075#1072' '#1087#1086#1076#1082#1083'./'#1086#1090#1082#1083'.'
                Title.TitleButton = True
                Title.Hint = #1059#1089#1083#1091#1075#1072' '#1089#1090#1072#1090#1091#1089#1072
                Width = 245
              end
              item
                EditButtons = <>
                FieldName = 'NOTICE'
                Footers = <>
                Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                Title.TitleButton = True
                Width = 115
              end
              item
                AutoFitColWidth = False
                EditButtons = <>
                FieldName = 'WHO_LAST'
                Footers = <>
                Title.Caption = #1048#1079#1084#1077#1085#1080#1083
                Title.TitleButton = True
                Width = 83
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object pnlPersonelTarif: TPanel
            Left = 0
            Top = 195
            Width = 642
            Height = 83
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object Label14: TLabel
              Left = 0
              Top = 0
              Width = 642
              Height = 13
              Align = alTop
              Caption = '.:: '#1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1081' '#1090#1072#1088#1080#1092' ::.'
            end
            object dbgPersTarif: TDBGridEh
              Left = 27
              Top = 13
              Width = 588
              Height = 70
              Align = alClient
              DataGrouping.GroupLevels = <>
              DataSource = srcPersonelTarif
              Flat = True
              FooterColor = clWindow
              FooterFont.Charset = DEFAULT_CHARSET
              FooterFont.Color = clWindowText
              FooterFont.Height = -11
              FooterFont.Name = 'Tahoma'
              FooterFont.Style = []
              RowDetailPanel.Color = clBtnFace
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  EditButtons = <>
                  FieldName = 'TARIF_ID'
                  Footers = <>
                  Visible = False
                end
                item
                  EditButtons = <>
                  FieldName = 'DATE_FROM'
                  Footers = <>
                  Title.Caption = #1044#1072#1090#1072' '#1089
                  Title.TitleButton = True
                  Width = 95
                end
                item
                  EditButtons = <>
                  FieldName = 'DATE_TO'
                  Footers = <>
                  Title.Caption = #1044#1072#1090#1072' '#1087#1086
                  Title.TitleButton = True
                  Width = 87
                end
                item
                  EditButtons = <>
                  FieldName = 'TARIF_SUM'
                  Footers = <>
                  Title.Caption = #1058#1072#1088#1080#1092
                  Title.TitleButton = True
                  Width = 111
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object ToolBar5: TToolBar
              Left = 0
              Top = 13
              Width = 27
              Height = 70
              Align = alLeft
              Caption = 'ToolBar1'
              EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
              Images = A4MainForm.ICONS_ACTIVE
              TabOrder = 0
              object bbAddTarif: TToolButton
                Left = 0
                Top = 0
                Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1072#1088#1080#1092
                ImageIndex = 2
                ParentShowHint = False
                Wrap = True
                ShowHint = True
                OnClick = bbAddTarifClick
              end
              object bbEditTarif: TToolButton
                Left = 0
                Top = 22
                Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1090#1072#1088#1080#1092' '
                ImageIndex = 4
                ParentShowHint = False
                Wrap = True
                ShowHint = True
                OnClick = bbEditTarifClick
              end
              object bbDelTarif: TToolButton
                Left = 0
                Top = 44
                Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1072#1088#1080#1092
                ImageIndex = 3
                ParentShowHint = False
                ShowHint = True
                OnClick = bbDelTarifClick
              end
            end
            object ToolBar7: TToolBar
              Left = 615
              Top = 13
              Width = 27
              Height = 70
              Align = alRight
              Caption = 'ToolBar1'
              EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
              Images = A4MainForm.ICONS_ACTIVE
              TabOrder = 2
              OnClick = ToolBar7Click
              object tbCancelPT: TToolButton
                Left = 0
                Top = 0
                Caption = 'tbCancel'
                Enabled = False
                ImageIndex = 26
                ParentShowHint = False
                ShowHint = True
              end
              object tbOkPT: TToolButton
                Left = 23
                Top = 0
                Caption = 'tbOk'
                Enabled = False
                ImageIndex = 25
                ParentShowHint = False
                Wrap = True
                ShowHint = True
                OnClick = tbOkPTClick
              end
            end
          end
        end
        object Panel8: TPanel
          Left = 643
          Top = 1
          Width = 110
          Height = 278
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object bbHistory: TBitBtn
            Left = 8
            Top = 159
            Width = 97
            Height = 25
            Caption = #1048#1089#1090#1086#1088#1080#1103
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FF7A78787A78787A78787A78787A78787A7878FF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A77777A7878C7C7C8B5B4B3A6
              A39CA8A198B0A7A5C0B4B57A78787A7878FF00FFFF00FFFF00FFFF00FFFF00FF
              7A7878DAD9DBB3B3B1A7A598CBCAB9B5BACD9BA6D0CFCBBCA8A092A69692D0BB
              BC7A7878FF00FFFF00FFFF00FF7A7878DFDDDE5B915C5D9556FBF1DDFDE5C8AA
              B5F15774F5FFEDD9FFFFFBC0BFB49E8D86D5BBBC7A7878FF00FFFF00FF7A7878
              7DA87D0C85180C851893B46FF5D6A4F7CC94F6BF82F1C48FFCEDCAFFFFFDBEBC
              B0AA918D7A7878FF00FF7A787899C09C0C851852DE7F5EE9910C8518ABCE90FE
              F5CCF9E0B3F2C897F2CC99F7DBB1FDFCF19F9385D5B5B57A78785F8A620C8518
              3DCC6144D16A4DD9784DD4770C8518A9CF95FDFAD5FFF1C4FDD09AF3BB80FFEA
              CDC8C2B6BFA29D7A78780C85180C8518158D213ACA5C3CC65F0C85180C85180C
              851885867DB2B59CB09E7FCEA172AAB5F1A6AFCCB1968F7A78787A7878DFDAD6
              0C85182FBD4C32BC4F0C8518FDFDD8A5A5962E30323839372E3032B9976D5774
              F58092CBB89D937A78787A7878E6E5E50C851828B6412ABA4574B277FFFFECF7
              F7D7C5C5AF2E3032BBB59BFFDFA9FFE7BECDCBB3C4A5A57A78787A7878E8E7E9
              B1B79E0C851828BC410C8518BED9BFFFFFF3FFFFEADADAC32E30329E8C74FDFA
              DCAAA395D5B5B77A7878FF00FF7A7878DCD9D787A9760C851828BA410C85187B
              B77EB3D4B1C2DDC1B8CAA6A4A497CDCEB8B5A09E7A7878FF00FFFF00FF7A7877
              DDDEDFCCC8C491B17F0C85180C85180C85180C85180C851898C595DEDFC5B0A3
              9ED6BCBC7A7878FF00FFFF00FFFF00FF7A7878D7D7D9D1CDCBCFC6B8E7DDCEDF
              E3E0CEDEE4E7E4D7C5C2B5BFB0AECFBABA7A7878FF00FFFF00FFFF00FFFF00FF
              FF00FF7A78787A7878C8C9CAC6C4C2C5C0BAC6BFB7C2BAB7C3B8B97A78787A78
              78FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7B79797A78787A
              78787A78787A78787B7979FF00FFFF00FFFF00FFFF00FFFF00FF}
          end
          object bbOnService: TBitBtn
            Left = 8
            Top = 38
            Width = 97
            Height = 25
            Caption = #1042#1082#1083#1102#1095#1080#1090#1100
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
          object bbOfService: TBitBtn
            Left = 8
            Top = 64
            Width = 97
            Height = 25
            Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
          end
          object bbAddService: TBitBtn
            Left = 8
            Top = 4
            Width = 97
            Height = 25
            Caption = #1044#1086#1073#1072#1074#1080#1090#1100
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object bbSwitchServices: TBitBtn
            Left = 8
            Top = 90
            Width = 97
            Height = 25
            Caption = #1055#1077#1088#1077#1082#1083#1102#1095#1080#1090#1100
            TabOrder = 3
          end
          object bbPauseService: TBitBtn
            Left = 8
            Top = 115
            Width = 97
            Height = 25
            Caption = #1042#1088#1077#1084'. '#1086#1090#1082#1083#1102#1095'.'
            TabOrder = 5
          end
        end
      end
    end
    object tsSingleServ: TTabSheet
      Caption = #1056#1072#1079#1086#1074#1099#1077' '#1091#1089#1083#1091#1075#1080
      ImageIndex = 1
      object dbgSingleServ: TDBGridEh
        Left = 0
        Top = 0
        Width = 662
        Height = 280
        Align = alClient
        AllowedOperations = []
        AutoFitColWidths = False
        DataGrouping.GroupLevels = <>
        DataSource = srcSingleSerivce
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        ReadOnly = True
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        VTitleMargin = 4
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'SERV_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 200
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'UNITS'
            Footers = <>
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'DIMENSION'
            Footers = <>
            Title.Caption = #1048#1079#1084'.'
            Title.TitleButton = True
            Width = 31
          end
          item
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 192
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'WHO_LAST'
            Footers = <>
            Title.Caption = #1044#1086#1073#1072#1074#1080#1083
            Title.TitleButton = True
            Width = 76
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1050#1086#1075#1076#1072
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object Panel3: TPanel
        Left = 662
        Top = 0
        Width = 92
        Height = 280
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object bbSingleServiceAdd: TBitBtn
          Left = 6
          Top = 4
          Width = 83
          Height = 25
          Action = actSingleSrvAdd
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object bbDelSingleService: TBitBtn
          Left = 6
          Top = 36
          Width = 83
          Height = 25
          Hint = #1059#1076#1072#1083#1080#1090#1100' '#1091#1089#1083#1091#1075#1091' '#1072#1073#1086#1085#1077#1085#1090#1072
          Caption = #1059#1076#1072#1083#1080#1090#1100
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = bbDelSingleServiceClick
          Glyph.Data = {
            36050000424D3605000000000000360400002800000010000000100000000100
            0800000000000001000000000000000000000001000000010000FF00FF000000
            9A00012AF200002CF600002CF8000733F6000031FE000431FE000134FF000C3C
            FF00123BF100103BF400143EF400103DFB001743F6001B46F6001C47F6001D48
            F6001342FF001A47F8001847FF00174AFD001A48F9001D4BFF001A4CFF001D50
            FF00224DF100224CF400204BF800214CF800214EFC002550F4002D59F4002655
            FA002355FF002659FF002E5BF9002C5FFF00325DF1003B66F3003664FA00386B
            FF004071FA004274FF00497AFC00000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000010100
            00000000000101000000000001150B010000000001040601000000000113180B
            010000010306030100000000000110180B010104060301000000000000000111
            190D060603010000000000000000000118120D05010000000000000000000001
            1D181312010000000000000000000124241D1D19110100000000000000012829
            2401011F191F010000000000012A2A26010000011F231D0100000000012C2701
            00000000011F1901000000000001010000000000000101000000000000000000
            0000000000000000000000000000000000000000000000000000}
        end
      end
    end
    object tsDiscFactor: TTabSheet
      Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090#1099
      ImageIndex = 4
      object dbgCustDiscFactor: TDBGridEh
        Left = 27
        Top = 0
        Width = 727
        Height = 280
        Align = alClient
        AutoFitColWidths = False
        DataGrouping.GroupLevels = <>
        DataSource = srcDiscount
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        VTitleMargin = 4
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'DATE_FROM'
            Footers = <>
            Title.Caption = #1057
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'DATE_TO'
            Footers = <>
            Title.Caption = #1055#1086
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'FACTOR_VALUE'
            Footers = <>
            Title.Caption = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
            Title.TitleButton = True
            Width = 90
          end
          item
            EditButtons = <>
            FieldName = 'S_NAME'
            Footers = <>
            Title.Caption = #1059#1089#1083#1091#1075#1072
            Title.TitleButton = True
            Width = 183
          end
          item
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 302
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object tbKoeff: TToolBar
        Left = 0
        Top = 0
        Width = 27
        Height = 280
        Align = alLeft
        Caption = 'ToolBar1'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 1
        object tbtarAdd: TToolButton
          Left = 0
          Top = 0
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
          ImageIndex = 2
          ParentShowHint = False
          Wrap = True
          ShowHint = True
        end
        object tbtarEdit: TToolButton
          Left = 0
          Top = 22
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100'  '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
          ImageIndex = 4
          ParentShowHint = False
          Wrap = True
          ShowHint = True
        end
        object tbtarDel: TToolButton
          Left = 0
          Top = 44
          Caption = #1059#1076#1072#1083#1080#1090#1100'  '#1082#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
        end
      end
    end
    object tsPayments: TTabSheet
      Caption = #1055#1083#1072#1090#1077#1078#1080
      ImageIndex = 3
      object dbgCustPayment: TDBGridEh
        Left = 27
        Top = 0
        Width = 727
        Height = 280
        Align = alClient
        AllowedOperations = []
        AutoFitColWidths = False
        DataGrouping.GroupLevels = <>
        DataSource = srcPayment
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        FooterRowCount = 1
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        ReadOnly = True
        RowDetailPanel.Color = clBtnFace
        SumList.Active = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        VTitleMargin = 4
        OnDblClick = dbgCustPaymentDblClick
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'PAY_DATE'
            Footer.FieldName = 'PAY_SUM'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
            Title.TitleButton = True
            Width = 90
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'PAY_SUM'
            Footer.FieldName = 'PAY_SUM'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1057#1091#1084#1084#1072
            Title.TitleButton = True
            Width = 90
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'FINE_SUM'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1055#1077#1085#1103
            Title.TitleButton = True
            Width = 90
          end
          item
            Alignment = taRightJustify
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'PAY_DOC_NO'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1055#1083#1072#1090'. '#1076#1086#1082#1091#1084#1077#1085#1090
            Title.TitleButton = True
            Width = 120
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'PAY_DOC_DATE'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Title.TitleButton = True
            Width = 88
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'PAYSOURCE_DESCR'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1052#1077#1089#1090#1086' '#1087#1083#1072#1090#1077#1078#1072
            Title.TitleButton = True
            Width = 89
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'O_NAME'
            Footers = <>
            Title.Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
            Title.TitleButton = True
            Width = 168
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1059#1089#1083#1091#1075#1072
            Title.TitleButton = True
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 100
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'PAYMENT_ID'
            Footers = <>
            Title.Caption = #8470' '#1087#1083#1072#1090#1077#1078#1072
            Title.TitleButton = True
            Width = 72
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'WHO_ADD'
            Footers = <>
            Title.Caption = #1055#1083#1072#1090#1077#1078' '#1087#1088#1080#1085#1103#1083
            Title.TitleButton = True
            Width = 82
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object ToolBar6: TToolBar
        Left = 0
        Top = 0
        Width = 27
        Height = 280
        Align = alLeft
        Caption = 'ToolBar1'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object ToolButton22: TToolButton
          Left = 0
          Top = 0
          ImageIndex = 2
          ParentShowHint = False
          Wrap = True
          ShowHint = True
        end
      end
    end
    object tsCustLetter: TTabSheet
      Caption = #1055#1080#1089#1100#1084#1072
      ImageIndex = 6
      object dbgLetters: TDBGridEh
        Left = 26
        Top = 0
        Width = 728
        Height = 280
        Align = alClient
        AllowedOperations = []
        AutoFitColWidths = False
        DataGrouping.GroupLevels = <>
        DataSource = srcLetters
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        ReadOnly = True
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'CUSTLETTERDATE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1044#1072#1090#1072
            Title.TitleButton = True
            Width = 101
          end
          item
            EditButtons = <>
            FieldName = 'LETTERTYPEDESCR'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1058#1080#1087
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object ToolBar4: TToolBar
        Left = 0
        Top = 0
        Width = 26
        Height = 280
        Align = alLeft
        Caption = 'ToolBar1'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 1
        object tbDelLetter: TToolButton
          Left = 0
          Top = 0
          ParentShowHint = False
          ShowHint = True
        end
      end
    end
    object tsRequests: TTabSheet
      Caption = #1047#1072#1103#1074#1082#1080
      ImageIndex = 7
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 754
        Height = 280
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbGridCustReq: TDBGridEh
          Left = 25
          Top = 0
          Width = 729
          Height = 280
          Align = alClient
          AllowedOperations = []
          AutoFitColWidths = False
          DataGrouping.GroupLevels = <>
          DataSource = srcRequests
          Flat = True
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          OddRowColor = clInfoBk
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
          RowDetailPanel.Color = clBtnFace
          SortLocal = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          UseMultiTitle = True
          OnDblClick = dbGridCustReqDblClick
          Columns = <
            item
              AutoFitColWidth = False
              EditButtons = <>
              FieldName = 'RQ_ID'
              Footers = <>
              Title.Caption = #1053#1086#1084#1077#1088
              Title.TitleButton = True
              Width = 40
            end
            item
              AutoFitColWidth = False
              EditButtons = <>
              FieldName = 'RQ_DATE'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072'|'#1087#1086#1089#1090'.'
              Title.TitleButton = True
              Width = 60
            end
            item
              AutoFitColWidth = False
              EditButtons = <>
              FieldName = 'RQ_PLAN_DATE'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072'|'#1087#1083#1072#1085#1086#1074#1072#1103
              Title.TitleButton = True
            end
            item
              AutoFitColWidth = False
              EditButtons = <>
              FieldName = 'RQ_TIME_FROM'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072'|'#1089
              Title.TitleButton = True
              Width = 28
            end
            item
              AutoFitColWidth = False
              EditButtons = <>
              FieldName = 'RQ_TIME_TO'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072'|'#1076#1086
              Title.TitleButton = True
              Width = 29
            end
            item
              AutoFitColWidth = False
              EditButtons = <>
              FieldName = 'RQ_COMPLETED'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072'|'#1074#1099#1087'.'
              Title.TitleButton = True
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'TROUBLE'
              Footers = <>
              Title.Caption = #1053#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100#13#10#1047#1072#1103#1074#1083#1077#1085#1085#1072#1103'/'#1042#1099#1103#1074#1083#1077#1085#1085#1072#1103
              Title.TitleButton = True
              Width = 202
            end
            item
              AutoFitColWidth = False
              EditButtons = <>
              FieldName = 'RT_NAME'
              Footers = <>
              Title.Caption = #1058#1080#1087
              Title.TitleButton = True
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'RES_TEXT'
              Footers = <>
              Title.Caption = #1057#1090#1072#1090#1091#1089
              Title.TitleButton = True
              Width = 49
            end
            item
              AutoFitColWidth = False
              EditButtons = <>
              FieldName = 'EXECUTOR'
              Footers = <>
              Title.Caption = #1042#1099#1087#1086#1083#1085#1080#1083
              Title.TitleButton = True
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'RQ_NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 100
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ToolBar8: TToolBar
          Left = 0
          Top = 0
          Width = 25
          Height = 280
          Align = alLeft
          Caption = 'ToolBar1'
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = A4MainForm.ICONS_ACTIVE
          TabOrder = 1
          object ToolButton23: TToolButton
            Left = 0
            Top = 0
          end
        end
      end
    end
    object tsAttributes: TTabSheet
      Caption = #1040#1090#1088#1080#1073#1091#1090#1099
      ImageIndex = 8
      object tbAttributes: TToolBar
        Left = 0
        Top = 0
        Width = 27
        Height = 280
        Align = alLeft
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object bbAddAtr: TToolButton
          Left = 0
          Top = 0
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1090#1088#1080#1073#1091#1090
          ImageIndex = 2
          ParentShowHint = False
          Wrap = True
          ShowHint = True
        end
        object bbEditAtr: TToolButton
          Left = 0
          Top = 22
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1072#1090#1088#1080#1073#1091#1090#1072
          ImageIndex = 4
          ParentShowHint = False
          Wrap = True
          ShowHint = True
        end
        object bbDelAtr: TToolButton
          Left = 0
          Top = 44
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1072#1090#1088#1080#1073#1091#1090
          ImageIndex = 3
          ParentShowHint = False
          ShowHint = True
        end
      end
      object dbgCustAttr: TDBGridEh
        Left = 27
        Top = 0
        Width = 727
        Height = 280
        Align = alClient
        AllowedOperations = []
        AutoFitColWidths = False
        DataGrouping.GroupLevels = <>
        DataSource = srcCustAttributes
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        RowDetailPanel.Color = clBtnFace
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'O_NAME'
            Footers = <>
            Title.Caption = #1040#1090#1088#1080#1073#1091#1090
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'CA_VALUE'
            Footers = <>
            Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
            Title.TitleButton = True
          end
          item
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 189
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsLANInfo: TTabSheet
      Caption = #1057#1055#1044
      ImageIndex = 8
      object tbLAN: TToolBar
        Left = 0
        Top = 0
        Width = 25
        Height = 280
        Align = alLeft
        Caption = 'ToolBar1'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object btnLanAdd: TToolButton
          Left = 0
          Top = 0
          Action = actLanAdd
          ParentShowHint = False
          Wrap = True
          ShowHint = True
        end
        object ciEdit: TToolButton
          Left = 0
          Top = 22
          Hint = #1048#1079#1084#1077#1085#1080#1090#1100' IP'
          Caption = #1048#1079#1084#1077#1085#1080#1090#1100' IP'
          ImageIndex = 4
          ParentShowHint = False
          Wrap = True
          ShowHint = True
        end
        object ciDel: TToolButton
          Left = 0
          Top = 44
          Hint = #1059#1076#1072#1083#1080#1090#1100' IP'
          Caption = #1059#1076#1072#1083#1080#1090#1100' IP'
          ImageIndex = 3
          ParentShowHint = False
          Wrap = True
          ShowHint = True
        end
        object ToolButton27: TToolButton
          Left = 0
          Top = 66
          Caption = 'ToolButton27'
          Enabled = False
          Wrap = True
        end
        object ToolButton28: TToolButton
          Left = 0
          Top = 88
        end
      end
      object dbgCustLAN: TDBGridEh
        Left = 25
        Top = 0
        Width = 729
        Height = 280
        Align = alClient
        AllowedOperations = []
        AutoFitColWidths = False
        DataGrouping.GroupLevels = <>
        DataSource = srcLan
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        ParentFont = False
        RowDetailPanel.Color = clBtnFace
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'IP'
            Footers = <>
            Width = 121
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            EditMask = 'AA:AA:AA:AA:AA:AA'
            FieldName = 'MAC'
            Footers = <>
            Width = 151
          end
          item
            EditButtons = <>
            FieldName = 'E_NAME'
            Footers = <>
            Title.Caption = #1082#1086#1084'-'#1088'/'#1084#1086#1076#1077#1084
            Title.TitleButton = True
            Width = 119
          end
          item
            EditButtons = <>
            FieldName = 'EQ_IP'
            Footers = <>
            Title.Caption = 'IP '#1082#1086#1084'-'#1088#1072'/'#1084#1086#1076#1077#1084#1072
            Title.TitleButton = True
            Width = 123
          end
          item
            AutoFitColWidth = False
            EditButtons = <>
            FieldName = 'PORT'
            Footers = <>
            Title.Caption = #1055#1086#1088#1090
            Title.TitleButton = True
            Width = 34
          end
          item
            EditButtons = <>
            FieldName = 'V_NAME'
            Footers = <>
            Title.Caption = 'VLAN'
            Title.TitleButton = True
            Width = 74
          end
          item
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 93
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object tsDigitTV: TTabSheet
      Caption = #1062#1080#1092#1088#1072
      ImageIndex = 9
      object Splitter4: TSplitter
        Left = 323
        Top = 0
        Height = 280
        Align = alRight
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 323
        Height = 280
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object Label18: TLabel
          Left = 0
          Top = 0
          Width = 323
          Height = 13
          Align = alTop
          Caption = '.:: '#1044#1077#1082#1086#1076#1077#1088#1099' '#1072#1073#1086#1085#1077#1085#1090#1072' ::.'
        end
        object ToolBar3: TToolBar
          Left = 0
          Top = 13
          Width = 27
          Height = 267
          Align = alLeft
          Caption = 'ToolBar1'
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = A4MainForm.ICONS_ACTIVE
          TabOrder = 0
          object btnDigitDecoderAdd: TToolButton
            Left = 0
            Top = 0
            Action = actDigitDecoderAdd
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object btnDigitDecoderEdit: TToolButton
            Left = 0
            Top = 22
            Action = actDigitDecoderEdit
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object btnDigitDecoderDel: TToolButton
            Left = 0
            Top = 44
            Action = actDigitDecoderDel
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbDecOk: TToolButton
            Left = 0
            Top = 66
            Caption = 'tbDecOk'
            ImageIndex = 25
            Wrap = True
            OnClick = tbDecOkClick
          end
          object tbDecCancel: TToolButton
            Left = 0
            Top = 88
            Caption = 'tbDecCancel'
            ImageIndex = 26
            OnClick = tbDecCancelClick
          end
        end
        object dbgCustDec: TDBGridEh
          Left = 27
          Top = 13
          Width = 296
          Height = 267
          Align = alClient
          AllowedOperations = [alopUpdateEh]
          DataGrouping.GroupLevels = <>
          DataSource = srcDecoders
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentFont = False
          RowDetailPanel.Color = clBtnFace
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              AutoFitColWidth = False
              EditButtons = <>
              FieldName = 'DECODER_N'
              Footers = <>
              Title.Caption = #1053#1086#1084#1077#1088
              Title.TitleButton = True
              Width = 65
            end
            item
              AutoFitColWidth = False
              EditButtons = <>
              FieldName = 'NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
              Width = 110
            end
            item
              EditButtons = <>
              FieldName = 'STB_N'
              Footers = <>
              Title.Caption = #8470' STB'
              Title.TitleButton = True
              Width = 87
            end
            item
              AutoFitColWidth = False
              EditButtons = <>
              FieldName = 'ADDED_BY'
              Footers = <>
              Title.Caption = #1044#1086#1073#1072#1074#1080#1083
              Title.TitleButton = True
            end
            item
              AutoFitColWidth = False
              EditButtons = <>
              FieldName = 'ADDED_ON'
              Footers = <>
              Title.Caption = #1050#1086#1075#1076#1072
              Title.TitleButton = True
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object Panel9: TPanel
        Left = 326
        Top = 0
        Width = 428
        Height = 280
        Align = alRight
        BevelOuter = bvNone
        Caption = 'Panel9'
        TabOrder = 1
        object Label17: TLabel
          Left = 0
          Top = 0
          Width = 428
          Height = 13
          Align = alTop
          Caption = '.:: '#1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1077' '#1082#1072#1085#1072#1083#1099' '#1072#1073#1086#1085#1077#1085#1090#1072' ::.'
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 13
          Width = 25
          Height = 267
          Align = alLeft
          Caption = 'ToolBar1'
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Images = A4MainForm.ICONS_ACTIVE
          TabOrder = 0
          object tbAddChan: TToolButton
            Left = 0
            Top = 0
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object tbEditChan: TToolButton
            Left = 0
            Top = 22
            Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1085#1072#1083
            Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1085#1072#1083
            ImageIndex = 4
            ParentShowHint = False
            Wrap = True
            ShowHint = True
          end
          object btnDigitChanelDel: TToolButton
            Left = 0
            Top = 44
            ParentShowHint = False
            ShowHint = True
          end
        end
        object dbgCustChan: TDBGridEh
          Left = 25
          Top = 13
          Width = 403
          Height = 267
          Align = alClient
          AllowedOperations = []
          AutoFitColWidths = False
          DataGrouping.GroupLevels = <>
          DataSource = srcChannels
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'Tahoma'
          FooterFont.Style = []
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
          ParentFont = False
          RowDetailPanel.Color = clBtnFace
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'CH_NAME'
              Footers = <>
              Title.Caption = #1050#1072#1085#1072#1083
              Title.TitleButton = True
              Width = 169
            end
            item
              AutoFitColWidth = False
              EditButtons = <>
              FieldName = 'DATE_ON'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1074#1082#1083'.'
              Title.TitleButton = True
              Width = 73
            end
            item
              AutoFitColWidth = False
              EditButtons = <>
              FieldName = 'DATE_OFF'
              Footers = <>
              Title.Caption = #1044#1072#1090#1072' '#1074#1099#1082#1083'.'
              Title.TitleButton = True
              Width = 77
            end
            item
              EditButtons = <>
              FieldName = 'NOTICE'
              Footers = <>
              Title.Caption = #1055#1080#1084#1077#1095#1072#1085#1080#1077
              Title.TitleButton = True
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
    object tsBilling: TTabSheet
      Caption = #1041#1080#1083#1083#1080#1085#1075
      ImageIndex = 10
      object ToolBar9: TToolBar
        Left = 0
        Top = 0
        Width = 25
        Height = 280
        Align = alLeft
        Caption = 'ToolBar1'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object ToolButton24: TToolButton
          Left = 0
          Top = 0
          ParentShowHint = False
          Wrap = True
          ShowHint = True
        end
      end
      object pnlLogin: TPanel
        Left = 25
        Top = 0
        Width = 309
        Height = 280
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object DBMemo1: TDBMemo
          Left = 0
          Top = 108
          Width = 309
          Height = 172
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          Ctl3D = False
          DataField = 'NOTICE'
          DataSource = srcBilling
          ParentCtl3D = False
          TabOrder = 0
        end
        object pnl: TPanel
          Left = 0
          Top = 0
          Width = 309
          Height = 61
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object lblInet: TLabel
            Left = 6
            Top = 35
            Width = 53
            Height = 13
            Caption = 'Internet IP'
          end
          object Label13: TLabel
            Left = 6
            Top = 13
            Width = 30
            Height = 13
            Caption = #1051#1086#1075#1080#1085
          end
          object edInet: TDBEditEh
            Left = 64
            Top = 33
            Width = 134
            Height = 19
            Ctl3D = False
            DataField = 'IP_INET'
            DataSource = srcBilling
            EditButtons = <>
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Visible = True
          end
          object DBEditEh1: TDBEditEh
            Left = 65
            Top = 11
            Width = 133
            Height = 19
            Ctl3D = False
            DataField = 'LOGIN'
            DataSource = srcBilling
            EditButtons = <>
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Visible = True
            EditMask = ''
          end
        end
        object pnlUTM: TPanel
          Left = 0
          Top = 61
          Width = 309
          Height = 47
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          Visible = False
          object Label4: TLabel
            Left = 5
            Top = 25
            Width = 53
            Height = 13
            Caption = 'Account ID'
          end
          object Label21: TLabel
            Left = 6
            Top = 2
            Width = 36
            Height = 13
            Caption = 'User ID'
          end
          object DBEditEh8: TDBEditEh
            Left = 64
            Top = 0
            Width = 49
            Height = 19
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'UNIT_ID'
            DataSource = srcBilling
            EditButtons = <>
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Visible = True
            EditMask = ''
          end
          object DBEditEh9: TDBEditEh
            Left = 64
            Top = 23
            Width = 49
            Height = 19
            CharCase = ecUpperCase
            Ctl3D = False
            DataField = 'ACCOUNT_ID'
            DataSource = srcBilling
            EditButtons = <>
            ParentCtl3D = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Visible = True
            EditMask = ''
          end
          object btnUTMInfo: TButton
            Left = 134
            Top = 6
            Width = 106
            Height = 25
            Caption = #1057#1090#1072#1090#1091#1089' '#1074' UTM'
            TabOrder = 2
            OnClick = btnUTMInfoClick
          end
        end
      end
      object pnlNetams: TPanel
        Left = 334
        Top = 0
        Width = 420
        Height = 280
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        Visible = False
        object Label8: TLabel
          Left = 5
          Top = 58
          Width = 32
          Height = 13
          Caption = #1058#1072#1088#1080#1092
        end
        object Label16: TLabel
          Left = 5
          Top = 79
          Width = 40
          Height = 13
          Caption = #1041#1083#1086#1082'-'#1082#1072
        end
        object Label19: TLabel
          Left = 6
          Top = 13
          Width = 39
          Height = 13
          Caption = 'Account'
        end
        object lblbill: TLabel
          Left = 6
          Top = 35
          Width = 19
          Height = 13
          Caption = 'Unit'
        end
        object DBEditEh2: TDBEditEh
          Left = 53
          Top = 56
          Width = 144
          Height = 19
          Ctl3D = False
          DataField = 'PLAN_NAME'
          DataSource = srcBilling
          EditButtons = <>
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Visible = True
          EditMask = ''
        end
        object cbBillBlock: TDBComboBoxEh
          Left = 53
          Top = 77
          Width = 144
          Height = 19
          Ctl3D = False
          DataField = 'BLOCKED'
          DataSource = srcBilling
          EditButton.Enabled = False
          EditButton.Visible = False
          EditButtons = <>
          Items.Strings = (
            #1056#1072#1079#1073#1083#1086#1082#1080#1088#1086#1074#1072#1085
            #1041#1083#1086#1082#1080#1088#1086#1074#1072#1085' '#1089#1080#1089#1090#1077#1084#1086#1081
            #1057#1072#1084#1086#1073#1083#1086#1082#1080#1088#1086#1074#1082#1072)
          KeyItems.Strings = (
            '0'
            '1'
            '2')
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Visible = True
        end
        object DBEditEh3: TDBEditEh
          Left = 54
          Top = 11
          Width = 89
          Height = 19
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'ACCOUNT_NAME'
          DataSource = srcBilling
          EditButtons = <>
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          Visible = True
          EditMask = ''
        end
        object DBEditEh4: TDBEditEh
          Left = 149
          Top = 11
          Width = 49
          Height = 19
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'ACCOUNT_HEX'
          DataSource = srcBilling
          EditButtons = <>
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Visible = True
          EditMask = ''
        end
        object DBEditEh5: TDBEditEh
          Left = 54
          Top = 33
          Width = 89
          Height = 19
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'UNIT_NAME'
          DataSource = srcBilling
          EditButtons = <>
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Visible = True
          EditMask = ''
        end
        object DBEditEh6: TDBEditEh
          Left = 149
          Top = 33
          Width = 49
          Height = 19
          CharCase = ecUpperCase
          Ctl3D = False
          DataField = 'UNIT_HEX'
          DataSource = srcBilling
          EditButtons = <>
          ParentCtl3D = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          Visible = True
          EditMask = ''
        end
      end
    end
  end
  object dsChannels: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CUSTOMER_CHANNELS'
      'SET '
      '    DATE_ON = :DATE_ON,'
      '    DATE_OFF = :DATE_OFF,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    CH_ID = :OLD_CH_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CUSTOMER_CHANNELS'
      'WHERE'
      '        CH_ID = :OLD_CH_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CUSTOMER_CHANNELS('
      '    CH_ID,'
      '    DATE_ON,'
      '    DATE_OFF,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :CH_ID,'
      '    :DATE_ON,'
      '    :DATE_OFF,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'SELECT Cc.Ch_Id, Cc.Date_On, Cc.Date_Off, Cc.Notice, c.Ch_Name'
      'FROM Customer_Channels Cc, Channels c'
      'where(  c.Ch_Id = cc.Ch_Id'
      'and Cc.Decoder_Id = :Dec_Id'
      '     ) and (     CC.CH_ID = :OLD_CH_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT Cc.Ch_Id, Cc.Date_On, Cc.Date_Off, Cc.Notice, c.Ch_Name'
      'FROM Customer_Channels Cc, Channels c'
      'where c.Ch_Id = cc.Ch_Id'
      'and Cc.Decoder_Id = :Dec_Id'
      'order by c.Ch_Name'
      '')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDecoders
    Left = 184
    Top = 42
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcChannels: TDataSource
    DataSet = dsChannels
    Left = 181
    Top = 91
  end
  object dsBilling: TpFIBDataSet
    UpdateSQL.Strings = (
      ''
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TV_LAN'
      'WHERE'
      '    LAN_ID = :OLD_LAN_ID'
      '    ')
    RefreshSQL.Strings = (
      ''
      '    '
      ''
      '')
    SelectSQL.Strings = (
      'SELECT f.*'
      'FROM BILLING f'
      'where f.CUSTOMER_ID = :CUSTOMER_ID'
      ''
      '')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DISCOUNT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    AfterOpen = dsBillingAfterOpen
    OnCalcFields = dsBillingCalcFields
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 390
    Top = 39
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    object dsBillingCUSTOMER_ID: TFIBIntegerField
      FieldName = 'CUSTOMER_ID'
    end
    object dsBillingLOGIN: TFIBStringField
      FieldName = 'LOGIN'
      Size = 50
      EmptyStrToNull = True
    end
    object dsBillingSECRET: TFIBStringField
      FieldName = 'SECRET'
      Size = 50
      EmptyStrToNull = True
    end
    object dsBillingIP_INET: TFIBStringField
      FieldName = 'IP_INET'
      Size = 15
      EmptyStrToNull = True
    end
    object dsBillingIP_INET_BIN: TFIBBCDField
      FieldName = 'IP_INET_BIN'
      Size = 0
      RoundByScale = True
    end
    object dsBillingACCOUNT_ID: TFIBIntegerField
      FieldName = 'ACCOUNT_ID'
    end
    object dsBillingACCOUNT_NAME: TFIBStringField
      FieldName = 'ACCOUNT_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object dsBillingUNIT_ID: TFIBIntegerField
      FieldName = 'UNIT_ID'
    end
    object dsBillingPLAN_ID: TFIBIntegerField
      FieldName = 'PLAN_ID'
    end
    object dsBillingPLAN_NAME: TFIBStringField
      FieldName = 'PLAN_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object dsBillingNOTICE: TFIBStringField
      FieldName = 'NOTICE'
      Size = 255
      EmptyStrToNull = True
    end
    object dsBillingACCOUNT_HEX: TStringField
      FieldKind = fkCalculated
      FieldName = 'ACCOUNT_HEX'
      Calculated = True
    end
    object dsBillingUNIT_HEX: TStringField
      FieldKind = fkCalculated
      FieldName = 'UNIT_HEX'
      Calculated = True
    end
    object dsBillingUNIT_NAME: TFIBStringField
      FieldName = 'UNIT_NAME'
      Size = 50
      EmptyStrToNull = True
    end
    object dsBillingBLOCKED: TFIBSmallIntField
      FieldName = 'BLOCKED'
    end
  end
  object srcPrepay: TDataSource
    DataSet = dsPrepay
    Left = 460
    Top = 84
  end
  object srcBilling: TDataSource
    AutoEdit = False
    DataSet = dsBilling
    Left = 392
    Top = 83
  end
  object dsPrepay: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT sum(pp.Prepay_Sum) as Prepay_sum FROM Prepay pp where pp.' +
        'CUSTOMER_ID = :CUSTOMER_ID')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 463
    Top = 41
  end
  object dsPayment: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT P.PAY_DOC_ID, P.PAYMENT_ID, P.PAY_DATE, P.PAY_SUM, D.PAY_' +
        'DOC_NO, D.PAY_DOC_DATE, PS.PAYSOURCE_DESCR, P.CUSTOMER_ID, P.NOT' +
        'ICE, p.FINE_SUM, V.O_NAME,'
      
        '(select first 1 w.Surname FROM worker w where w.Ibname = p.ADDED' +
        '_BY) as WHO_ADD,'
      'r.NAME'
      
        'FROM PAYMENT P LEFT OUTER join V_PAYMENTTYPE v ON (P.PAYMENT_TYP' +
        'E = v.O_ID)'
      '   INNER JOIN PAY_DOC D ON (P.PAY_DOC_ID = D.PAY_DOC_ID)'
      
        '   LEFT OUTER JOIN PAYSOURCE PS ON (D.PAYSOURCE_ID = PS.PAYSOURC' +
        'E_ID)'
      '   LEFT OUTER JOIN SERVICES R ON (P.payment_srv = R.service_id)'
      'WHERE '
      '  p.customer_id = :customer_id'
      'order by P.PAY_DATE desc')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 526
    Top = 40
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcPayment: TDataSource
    AutoEdit = False
    DataSet = dsPayment
    Left = 533
    Top = 95
  end
  object dsDecoders: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CUSTOMER_DECODERS'
      'SET '
      '    CUSTOMER_ID = :Customer_Id,'
      '    DECODER_N = :DECODER_N,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    DEC_ID = :OLD_DEC_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CUSTOMER_DECODERS'
      'WHERE'
      '        DEC_ID = :OLD_DEC_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CUSTOMER_DECODERS('
      '    DEC_ID,'
      '    CUSTOMER_ID,'
      '    DECODER_N,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :DEC_ID,'
      '    :Customer_Id,'
      '    :DECODER_N,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'SELECT Dec_Id, Customer_Id, Decoder_N, Notice'
      'FROM Customer_Decoders cd'
      'where(  cd.Customer_Id = :Customer_Id'
      '     ) and (     CD.DEC_ID = :OLD_DEC_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Customer_Decoders cd'
      'where cd.Customer_Id = :Customer_Id'
      'order by cd.Decoder_N'
      '')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DEC_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 387
    Top = 147
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcDecoders: TDataSource
    AutoEdit = False
    DataSet = dsDecoders
    OnStateChange = srcDecodersStateChange
    Left = 389
    Top = 192
  end
  object dsSingleService: TpFIBDataSet
    UpdateSQL.Strings = (
      ''
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM SINGLE_SERV'
      'WHERE'
      '        SINGLE_SERVICE_ID = :OLD_SINGLE_SERVICE_ID'
      '    ')
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT ss.*,s.NAME,'
      
        ' (select first 1 w.Surname FROM worker w where w.Ibname = ss.Add' +
        'ed_By) as WHO_LAST'
      'FROM SINGLE_SERV ss, services s'
      'where ss.CUSTOMER_ID = :CUSTOMER_ID'
      'and s.SERVICE_ID = ss.SERVICE_ID'
      'order by ss.SERV_DATE desc'
      ''
      ''
      '')
    AutoUpdateOptions.UpdateTableName = 'SUBSCR_SERV'
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 460
    Top = 197
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcSingleSerivce: TDataSource
    AutoEdit = False
    DataSet = dsSingleService
    OnDataChange = srcSingleSerivceDataChange
    Left = 464
    Top = 144
  end
  object dsDiscount: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE DISCOUNT_FACTOR'
      'SET '
      '    DISCOUNT_ID = :DISCOUNT_ID,'
      '    CUSTOMER_ID = :CUSTOMER_ID,'
      '    DATE_FROM = :DATE_FROM,'
      '    DATE_TO = :DATE_TO,'
      '    FACTOR_VALUE = :FACTOR_VALUE'
      'WHERE'
      '    DISCOUNT_ID = :OLD_DISCOUNT_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    DISCOUNT_FACTOR'
      'WHERE'
      '        DISCOUNT_ID = :OLD_DISCOUNT_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO DISCOUNT_FACTOR('
      '    DISCOUNT_ID,'
      '    CUSTOMER_ID,'
      '    DATE_FROM,'
      '    DATE_TO,'
      '    FACTOR_VALUE'
      ')'
      'VALUES('
      '    :DISCOUNT_ID,'
      '    :CUSTOMER_ID,'
      '    :DATE_FROM,'
      '    :DATE_TO,'
      '    :FACTOR_VALUE'
      ')')
    RefreshSQL.Strings = (
      'SELECT f.*'
      'FROM DISCOUNT_FACTOR f'
      'where(  f.CUSTOMER_ID = :CUSTOMER_ID'
      '     ) and (     F.DISCOUNT_ID = :OLD_DISCOUNT_ID'
      '     )'
      '    '
      'order by f.DATE_FROM'
      '')
    SelectSQL.Strings = (
      
        'SELECT DF.DISCOUNT_ID, DF.CUSTOMER_ID, DF.DATE_FROM, DF.DATE_TO,' +
        ' DF.FACTOR_VALUE,'
      
        '  DF.SERV_ID, DF.NOTICE, CASE WHEN (S.SERVICE_ID = -1) THEN '#39#1042#1089#1077 +
        #39' ELSE S.NAME END S_NAME'
      'FROM DISCOUNT_FACTOR DF'
      '   LEFT OUTER JOIN SERVICES S ON (S.SERVICE_ID = DF.SERV_ID)'
      'where DF.CUSTOMER_ID = :CUSTOMER_ID'
      'order by DF.DATE_FROM'
      ''
      '')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DISCOUNT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 604
    Top = 42
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcDiscount: TDataSource
    AutoEdit = False
    DataSet = dsDiscount
    OnDataChange = srcDiscountDataChange
    Left = 606
    Top = 95
  end
  object dsLetters: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM Custletter'
      'WHERE (Custletterid = :OLD_Custletterid)')
    SelectSQL.Strings = (
      'select'
      ' C.CUSTLETTERID'
      ', C.LETTERTYPEID'
      ', C.CUSTLETTERDATE'
      ', LT.lettertypedescr'
      'from CustLetter C, LETTERTYPE LT'
      'where CUSTOMER_ID=:CUSTOMER_ID'
      'and lt.lettertypeid = c.lettertypeid'
      'order by C.custletterdate desc, C.LETTERTYPEID')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 253
    Top = 42
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcLetters: TDataSource
    AutoEdit = False
    DataSet = dsLetters
    Left = 250
    Top = 90
  end
  object dsLAN: TpFIBDataSet
    UpdateSQL.Strings = (
      ''
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    TV_LAN'
      'WHERE'
      '    LAN_ID = :OLD_LAN_ID'
      '    ')
    RefreshSQL.Strings = (
      ''
      '    '
      ''
      '')
    SelectSQL.Strings = (
      'select '
      '    f.* ,'
      '    e.name as E_NAME,'
      '    e.IP as EQ_IP,'
      '    v.name as V_NAME'
      'from tv_lan f'
      '   left outer join vlans v on (f.vlan_id = v.v_id)'
      '   left outer join equipment e on (f.eq_id = e.eid)'
      'where f.CUSTOMER_ID = :CUSTOMER_ID'
      ''
      ''
      '')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DISCOUNT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 305
    Top = 146
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcLan: TDataSource
    AutoEdit = False
    DataSet = dsLAN
    Left = 306
    Top = 194
  end
  object dsServicesHistory: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      ' h.*, s_on.NAME as ON_NAME, s_off.NAME as OFF_NAME'
      'from SUBSCR_HIST h, services s_on, SERVICES s_off'
      'where h.CUSTOMER_ID=:CUSTOMER_ID'
      '  and h.SUBSCR_SERV_ID=:SUBSCR_SERV_ID'
      '  and s_on.SERVICE_ID = h.ACT_SERV_ID'
      '  and s_off.SERVICE_ID = h.DISACT_SERV_ID'
      'order by h.SUBSCR_SERV_ID, h.DATE_FROM')
    AutoUpdateOptions.UpdateTableName = 'SUBSCR_HIST'
    AutoUpdateOptions.KeyFields = 'SUBSCR_HIST_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcServices
    Left = 203
    Top = 147
  end
  object dsServices: TpFIBDataSet
    RefreshSQL.Strings = (
      'select'
      ' SS.CUSTOMER_ID,'
      ' s.name,'
      ' SS.SERV_ID,'
      ' SS.SUBSCR_SERV_ID,'
      ' SS.NOTICE,'
      'ss.state_sgn,'
      ' CASE ss.state_sgn'
      '   WHEN 0 THEN '#39#1054#1090#1082#1083#1102#1095#1077#1085#39
      '   WHEN 1 THEN '#39#1055#1086#1076#1082#1083#1102#1095#1077#1085#39
      '   ELSE '#39#1085#1077#1087#1086#1085#1103#1090#1082#1080' '#39#39#39' || ss.state_sgn || '#39#39#39#39
      ' END as State'
      'from'
      ' SUBSCR_SERV SS, services s'
      'where SS.SUBSCR_SERV_ID = :OLD_SUBSCR_SERV_ID'
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      ' SS.CUSTOMER_ID,'
      ' s.name,'
      ' SS.SERV_ID,'
      ' SS.SUBSCR_SERV_ID,'
      ' SS.NOTICE,'
      ' ss.state_sgn,'
      ' CASE ss.state_sgn'
      '   WHEN 0 THEN '#39#1054#1090#1082#1083#1102#1095#1077#1085#39
      '   WHEN 1 THEN '#39#1055#1086#1076#1082#1083#1102#1095#1077#1085#39
      '   ELSE '#39#1085#1077#1087#1086#1085#1103#1090#1082#1080' '#39#39#39' || ss.state_sgn || '#39#39#39#39
      ' END as State,'
      
        ' (select first 1 w.Surname FROM worker w where w.Ibname = ss.Sta' +
        'te_Change_By) as WHO_LAST ,'
      ' ss.State_Date,'
      
        ' (select sd.Name from services sd where ss.State_Srv = sd.Servic' +
        'e_Id) as STATE_SRV_NAME'
      ''
      'from'
      ' SUBSCR_SERV SS, services s'
      'where SS.CUSTOMER_ID=:CUSTOMER_ID'
      'and s.service_id = ss.serv_id'
      'order by s.name'
      '')
    AutoUpdateOptions.UpdateTableName = 'SUBSCR_SERV'
    AutoCalcFields = False
    AfterOpen = dsServicesAfterOpen
    BeforeClose = dsServicesBeforeClose
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 110
    Top = 46
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcServices: TDataSource
    AutoEdit = False
    DataSet = dsServices
    OnDataChange = srcServicesDataChange
    Left = 108
    Top = 97
  end
  object dsPersonelTarif: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PERSONAL_TARIF'
      'SET '
      '    CUSTOMER_ID = :CUSTOMER_ID,'
      '    SERVICE_ID = :SERVICE_ID,'
      '    TARIF_ID = :TARIF_ID,'
      '    DATE_FROM = :DATE_FROM,'
      '    DATE_TO = :DATE_TO,'
      '    TARIF_SUM = :TARIF_SUM'
      'WHERE'
      '    TARIF_ID = :OLD_TARIF_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PERSONAL_TARIF'
      'WHERE'
      '        TARIF_ID = :OLD_TARIF_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PERSONAL_TARIF('
      '    CUSTOMER_ID,'
      '    SERVICE_ID,'
      '    TARIF_ID,'
      '    DATE_FROM,'
      '    DATE_TO,'
      '    TARIF_SUM'
      ')'
      'VALUES('
      '    :CUSTOMER_ID,'
      '    :SERVICE_ID,'
      '    :TARIF_ID,'
      '    :DATE_FROM,'
      '    :DATE_TO,'
      '    :TARIF_SUM'
      ')')
    RefreshSQL.Strings = (
      
        'select pt.customer_id, pt.service_id, pt.tarif_id, pt.date_from,' +
        ' pt.date_to, pt.tarif_sum'
      'from personal_tarif pt'
      'where TARIF_ID = :OLD_TARIF_ID'
      '    '
      ''
      '')
    SelectSQL.Strings = (
      
        'select pt.customer_id, pt.service_id, pt.tarif_id, pt.date_from,' +
        ' pt.date_to, pt.tarif_sum'
      'from personal_tarif pt'
      'where pt.service_id = :serv_id'
      '  and pt.customer_id = :customer_id'
      ''
      '')
    AutoUpdateOptions.UpdateTableName = 'SUBSCR_SERV'
    AutoUpdateOptions.KeyFields = 'TARIF_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    OnNewRecord = dsPersonelTarifNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcServices
    Left = 106
    Top = 152
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcPersonelTarif: TDataSource
    AutoEdit = False
    DataSet = dsPersonelTarif
    OnStateChange = srcPersonelTarifStateChange
    OnDataChange = srcPersonelTarifDataChange
    Left = 102
    Top = 199
  end
  object srcCustAttributes: TDataSource
    DataSet = dsCustAttributes
    OnDataChange = srcCustAttributesDataChange
    Left = 325
    Top = 91
  end
  object dsCustAttributes: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CUSTOMER_ATTRIBUTES'
      'SET '
      '    CA_ID = :CA_ID,'
      '    CA_VALUE = :CA_VALUE,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    CUSTOMER_ID = :OLD_CUSTOMER_ID'
      '    and O_ID = :OLD_O_ID'
      '    and CA_VALUE = :OLD_CA_VALUE'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CUSTOMER_ATTRIBUTES'
      'WHERE'
      '        CUSTOMER_ID = :OLD_CUSTOMER_ID'
      '    and O_ID = :OLD_O_ID'
      '    and CA_VALUE = :OLD_CA_VALUE'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CUSTOMER_ATTRIBUTES('
      '    CA_ID,'
      '    CUSTOMER_ID,'
      '    O_ID,'
      '    CA_VALUE,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :CA_ID,'
      '    :CUSTOMER_ID,'
      '    :O_ID,'
      '    :CA_VALUE,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'SELECT A.O_NAME, CA.*'
      'FROM CUSTOMER_ATTRIBUTES CA'
      '   INNER JOIN OBJECTS A ON (CA.O_ID = A.O_ID)'
      'where CA.CUSTOMER_ID = :CUSTOMER_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT A.O_NAME, CA.*'
      'FROM CUSTOMER_ATTRIBUTES CA'
      '   INNER JOIN OBJECTS A ON (CA.O_ID = A.O_ID)'
      'where CA.CUSTOMER_ID = :CUSTOMER_ID')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 323
    Top = 43
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 610
    Top = 198
    object actSubscrHistory: TAction
      Category = 'Services'
      Caption = #1048#1089#1090#1086#1088#1080#1103
      Hint = #1048#1089#1090#1086#1088#1080#1103' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1081
      OnExecute = actSubscrHistoryExecute
    end
    object actReCalc: TAction
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100
      Hint = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1089#1072#1083#1100#1076#1086' '#1072#1073#1086#1085#1077#1085#1090#1072
      OnExecute = actReCalcExecute
    end
    object actRequest: TAction
      Caption = #1047#1072#1103#1074#1082#1072
      Hint = #1055#1088#1080#1085#1103#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1086#1090' '#1072#1073#1086#1085#1077#1085#1090#1072
      ImageIndex = 37
      ShortCut = 116
      OnExecute = actRequestExecute
    end
    object ActAddPayment: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1090#1077#1078' '#1072#1073#1086#1085#1077#1085#1090#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1090#1077#1078' '#1072#1073#1086#1085#1077#1085#1090#1091' '#1074' '#1086#1090#1082#1088#1099#1090#1099#1081' '#1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 2
      ShortCut = 117
      OnExecute = ActAddPaymentExecute
    end
    object actSrvAdd: TAction
      Category = 'Services'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1091#1075#1091' '#1072#1073#1086#1085#1077#1085#1090#1091
      ImageIndex = 2
      OnExecute = actSrvAddExecute
    end
    object ActSrvOn: TAction
      Category = 'Services'
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1091#1089#1083#1091#1075#1091
      ImageIndex = 11
      OnExecute = ActSrvOnExecute
    end
    object ActSrvOff: TAction
      Category = 'Services'
      Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100
      Hint = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1091#1089#1083#1091#1075#1091
      ImageIndex = 12
      OnExecute = ActSrvOffExecute
    end
    object actSrvSwitch: TAction
      Category = 'Services'
      Caption = #1055#1077#1088#1077#1082#1083#1102#1095#1080#1090#1100
      Hint = #1055#1077#1088#1077#1082#1083#1102#1095#1080#1090#1100' '#1089' '#1091#1089#1083#1091#1075#1080' '#1085#1072' '#1091#1089#1083#1091#1075#1091
      Visible = False
      OnExecute = actSrvSwitchExecute
    end
    object actSrvPause: TAction
      Category = 'Services'
      Caption = #1042#1088#1077#1084'. '#1086#1090#1082#1083#1102#1095'.'
      Hint = #1042#1088#1077#1084#1077#1085#1085#1085#1086#1077' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1077' '#1091#1089#1083#1091#1075#1080' ('#1087#1072#1091#1079#1072').'
      ImageIndex = 48
      OnExecute = actSrvPauseExecute
    end
    object actBilling: TAction
      Category = 'LAN'
      Caption = 'actBilling'
      Hint = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1080#1083#1083#1080#1085#1075#1077
      ImageIndex = 17
      OnExecute = actBillingExecute
    end
    object actLetterDel: TAction
      Category = 'LETTERS'
      Caption = #1059#1076#1072#1083#1080#1090#1100'  '#1087#1080#1089#1100#1084#1086
      Hint = #1059#1076#1072#1083#1080#1090#1100'  '#1087#1080#1089#1100#1084#1086
      ImageIndex = 3
      OnExecute = actLetterDelExecute
    end
    object ActLanPing: TAction
      Category = 'LAN'
      Caption = 'PING'
      Hint = 'PING IP adress'
      ImageIndex = 11
      OnExecute = ActLanPingExecute
    end
    object actDigitChanelAdd: TAction
      Category = 'DIGIT'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1085#1072#1083
      ImageIndex = 2
      OnExecute = actDigitChanelAddExecute
    end
    object actDigitChanelEdit: TAction
      Category = 'DIGIT'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1085#1072#1083
      ImageIndex = 4
      OnExecute = actDigitChanelEditExecute
    end
    object actDigitChanelDel: TAction
      Category = 'DIGIT'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1085#1072#1083
      ImageIndex = 3
      OnExecute = actDigitChanelDelExecute
    end
    object actDigitDecoderAdd: TAction
      Category = 'DIGIT'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1077#1082#1086#1076#1077#1088
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1077#1082#1086#1076#1077#1088
      ImageIndex = 2
      OnExecute = actDigitDecoderAddExecute
    end
    object actDigitDecoderEdit: TAction
      Category = 'DIGIT'
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1077#1082#1086#1076#1077#1088
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1077#1082#1086#1076#1077#1088
      ImageIndex = 4
      OnExecute = actDigitDecoderEditExecute
    end
    object actDigitDecoderDel: TAction
      Category = 'DIGIT'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1077#1082#1086#1076#1077#1088
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1077#1082#1086#1076#1077#1088
      ImageIndex = 3
      OnExecute = actDigitDecoderDelExecute
    end
    object actSingleSrvAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 2
      OnExecute = actSingleSrvAddExecute
    end
    object actDiscountAdd: TAction
      Caption = 'actDiscountAdd'
      ImageIndex = 2
      OnExecute = actDiscountAddExecute
    end
    object actDiscountDel: TAction
      Caption = 'actDiscountDel'
      ImageIndex = 3
      OnExecute = actDiscountDelExecute
    end
    object actDiscountEdit: TAction
      Caption = 'actDiscountEdit'
      ImageIndex = 4
      OnExecute = actDiscountEditExecute
    end
    object actAtributeAdd: TAction
      Caption = 'actAtributeAdd'
      ImageIndex = 2
      OnExecute = actAtributeAddExecute
    end
    object actAtributeEdit: TAction
      Caption = 'actAtributeEdit'
      ImageIndex = 4
      OnExecute = actAtributeEditExecute
    end
    object actAtributeDel: TAction
      Caption = 'actAtributeDel'
      ImageIndex = 3
      OnExecute = actAtributeDelExecute
    end
    object actLanAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1077#1090#1080
      ImageIndex = 2
      OnExecute = actLanAddExecute
    end
    object actLanEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1089#1077#1090#1080
      ImageIndex = 4
      OnExecute = actLanEditExecute
    end
    object actLanDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = actLanDeleteExecute
    end
  end
  object pmRecalc: TPopupMenu
    Left = 26
    Top = 115
    object N2: TMenuItem
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1074#1089#1077#1084
    end
  end
  object pmServices: TPopupMenu
    Left = 29
    Top = 167
    object N16: TMenuItem
      Caption = #1042#1082#1083#1102#1095#1080#1090#1100
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1091#1089#1083#1091#1075#1091
      ImageIndex = 11
    end
    object N17: TMenuItem
      Caption = #1054#1090#1082#1083#1102#1095#1080#1090#1100
      Hint = #1054#1090#1082#1083#1102#1095#1080#1090#1100' '#1091#1089#1083#1091#1075#1091
      ImageIndex = 12
    end
    object N43: TMenuItem
      Caption = #1042#1088#1077#1084'. '#1086#1090#1082#1083#1102#1095'.'
      Hint = #1042#1088#1077#1084#1077#1085#1085#1085#1086#1077' '#1086#1090#1082#1083#1102#1095#1077#1085#1080#1077' '#1091#1089#1083#1091#1075#1080' ('#1087#1072#1091#1079#1072').'
      ImageIndex = 48
      OnClick = actSrvPauseExecute
    end
    object N39: TMenuItem
      Caption = '-'
    end
    object N40: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1091#1075#1091' '#1072#1073#1086#1085#1077#1085#1090#1091
      ImageIndex = 2
    end
    object N41: TMenuItem
      Caption = '-'
    end
    object N42: TMenuItem
      Caption = #1048#1089#1090#1086#1088#1080#1103
      Hint = #1048#1089#1090#1086#1088#1080#1103' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1081
    end
  end
  object dsRequests: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT R.RQ_ID, R.added_on RQ_DATE, R.rq_plan_date, r.rq_time_from, r.rq_' +
        'time_to, R.RQ_CONTENT, R.RQ_DEFECT, R.RQ_COMPLETED, R.RQ_NOTICE,'
      'rt.RT_NAME, rt.RT_NOTICE as REPORT,'
      
        '(select first 1 W.SURNAME ||'#39' '#39'||substring(W.FIRSTNAME FROM 1 fo' +
        'r 1)||'#39' '#39'||substring(W.MIDLENAME from 1 for 1) '
      
        'FROM request_executors re left outer join WORKER w ON (w.WORKER_' +
        'ID = re.exec_id)'
      'where re.rq_id = R.RQ_ID) AS EXECUTOR,'
      'CASE R.Req_Result'
      ' when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      ' when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      ' when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      ' when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      'end as Res_text,'
      'coalesce(r.Rq_Defect, r.Rq_Content) as trouble'
      'FROM REQUEST R , REQUEST_TYPE RT'
      'WHERE'
      'r.RQ_CUSTOMER = :CUSTOMER_ID'
      'and rt.RT_ID = r.RQ_TYPE'
      'order by R.added_on desc')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 676
    Top = 128
  end
  object srcRequests: TDataSource
    AutoEdit = False
    DataSet = dsRequests
    Left = 672
    Top = 168
  end
end
