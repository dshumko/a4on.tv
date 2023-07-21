object PaymentDocForm: TPaymentDocForm
  Left = 591
  Top = 207
  Caption = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
  ClientHeight = 607
  ClientWidth = 1067
  Color = clBtnFace
  Constraints.MinHeight = 440
  Constraints.MinWidth = 630
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spliter: TSplitter
    Left = 0
    Top = 396
    Width = 1067
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object pnlPayments: TPanel
    Left = 0
    Top = 89
    Width = 1067
    Height = 307
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    object pnlCustomer: TPanel
      Left = 0
      Top = 0
      Width = 1067
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object ToolBar4: TToolBar
        Left = 0
        Top = 0
        Width = 1067
        Height = 27
        Caption = 'ToolBar2'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Images = A4MainForm.ICONS_ACTIVE
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        object bbtnNewPayment: TBitBtn
          Left = 0
          Top = 0
          Width = 161
          Height = 22
          Action = actPaymentNew
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1090#1077#1078' (F6)'
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008BAE
            5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
            560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008DAF
            5D008BAE59008BAE59008BAE59008BAE590089AD560089AD560089AD560089AD
            56008BAE59008BAE59008BAE59008BAE59008BAE5900FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
            5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF008FB160008FB160008FB160008FB1
            6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          TabOrder = 0
        end
        object ToolButton3: TToolButton
          Left = 161
          Top = 0
          Width = 8
          Caption = 'ToolButton3'
          ImageIndex = 49
          Style = tbsSeparator
        end
        object bbDelete: TBitBtn
          Left = 169
          Top = 0
          Width = 134
          Height = 22
          Action = actPaymentDelete
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1083#1072#1090#1077#1078
          Glyph.Data = {
            36040000424D3604000000000000360000002800000010000000100000000100
            2000000000000004000000000000000000000000000000000000FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF008C98D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF008390D500FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF008693D600334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00465CCE00334CCC007584D300FF00FF00FF00FF00FF00FF00909C
            D700334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00
            FF00465CCE00334CCC00334CCC00334CCC00808ED500FF00FF00FF00FF00FF00
            FF00445ACE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00465C
            CE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00445ACE00334CCC00334CCC00334CCC003D54CD00455BCE00334C
            CC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334CCC00334C
            CC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334C
            CC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334C
            CC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334CCC00334C
            CC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00465CCE00334CCC00334CCC00334CCC004057CD00445ACE00334C
            CC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00465CCE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00445A
            CE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00ABB2
            DA00364ECC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
            FF00445ACE00334CCC00334CCC00354DCC00A4ACD900FF00FF00FF00FF00FF00
            FF00A7AFDA00364ECC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00445ACE00354DCC00A2ABD900FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00A9B1DA00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00A6AED900FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
            FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
          TabOrder = 1
        end
        object ToolButton18: TToolButton
          Left = 303
          Top = 0
          Width = 8
          Caption = 'ToolButton18'
          ImageIndex = 2
          Style = tbsSeparator
        end
        object ToolButton6: TToolButton
          Left = 311
          Top = 0
          Action = actEditPayment
        end
        object ToolButton7: TToolButton
          Left = 334
          Top = 0
          Width = 8
          Caption = 'ToolButton7'
          ImageIndex = 41
          Style = tbsSeparator
        end
        object btnPrintCheck: TToolButton
          Left = 342
          Top = 0
          Action = actPrintCheck
        end
        object btn1: TToolButton
          Left = 365
          Top = 0
          Width = 8
          Caption = 'btn1'
          ImageIndex = 41
          Style = tbsSeparator
        end
        object btnMovePayment: TToolButton
          Left = 373
          Top = 0
          Action = actMovePayment
        end
        object btn2: TToolButton
          Left = 396
          Top = 0
          Width = 8
          Caption = 'btn2'
          ImageIndex = 11
          Style = tbsSeparator
        end
        object btnFilterCustomer: TToolButton
          Left = 404
          Top = 0
          Action = actFilterCustomer
        end
        object btnTask: TToolButton
          Left = 427
          Top = 0
          Action = actTask
        end
        object btn3: TToolButton
          Left = 450
          Top = 0
          Width = 8
          Caption = 'btn3'
          ImageIndex = 88
          Style = tbsSeparator
        end
        object btnQuickFilter: TToolButton
          Left = 458
          Top = 0
          Action = actQuickFilter
        end
      end
    end
    object dbgPayDocPayment: TDBGridEh
      Left = 0
      Top = 27
      Width = 1067
      Height = 280
      Align = alClient
      AllowedOperations = []
      AllowedSelections = [gstRecordBookmarks]
      DataSource = srcsPayDocDetail
      DynProps = <>
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
      PopupMenu = gridPopUp
      SearchPanel.Enabled = True
      STFilter.Local = True
      SumList.Active = True
      TabOrder = 1
      TitleParams.MultiTitle = True
      OnDblClick = dbgPayDocPaymentDblClick
      OnGetCellParams = dbgPayDocPaymentGetCellParams
      OnGetFooterParams = dbgPayDocPaymentGetFooterParams
      Columns = <
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ACCOUNT_NO'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1051#1080#1094'. '#1089#1095#1077#1090
          Title.TitleButton = True
          Width = 74
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Title.TitleButton = True
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_SUM'
          Footer.DisplayFormat = ',#.##'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072' '#1085#1072' '#1089#1095#1077#1090
          Title.TitleButton = True
          Width = 58
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#.00'
          DynProps = <>
          EditButtons = <>
          FieldName = 'FINE_SUM'
          Footer.DisplayFormat = ',#.##'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1055#1077#1085#1103
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAID'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1042#1085#1077#1089#1077#1085#1086
          Title.TitleButton = True
          Width = 59
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CUST_DESCR'
          Footers = <>
          Title.Caption = #1060#1048#1054
          Title.TitleButton = True
          Width = 136
          OnGetCellParams = dbgPayDocPaymentColumns5GetCellParams
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 203
          OnGetCellParams = dbgPayDocPaymentColumns6GetCellParams
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_ON'
          Footers = <>
          Title.Caption = #1042#1085#1077#1089#1077#1085
          Title.TitleButton = True
          Width = 102
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'WHO_ADD'
          Footers = <>
          Title.Caption = #1055#1083#1072#1090#1077#1078' '#1087#1088#1080#1085#1103#1083
          Title.TitleButton = True
          Width = 85
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAYMENT_ID'
          Footers = <>
          Title.Caption = #8470' '#1087#1083#1072#1090#1077#1078#1072
          Title.TitleButton = True
          Width = 70
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EXT_PAY_ID'
          Footers = <>
          Title.Caption = #8470' '#1087#1083'. '#1089#1080#1089'.'
          Title.Hint = #1085#1086#1084#1077#1088' '#1095#1077#1082#1072' '#1080#1083#1080' '#1080#1076#1077#1085#1090#1080#1092#1080#1082#1072#1090#1086#1088' '#1074#1086' '#1074#1085#1077#1096#1085#1077#1081' '#1089#1080#1089#1090#1077#1084#1077' '#1087#1088#1080#1077#1084#1072' '#1087#1083#1072#1090#1077#1078#1077#1081
          Title.TitleButton = True
          Width = 73
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DEBT_SUM'
          Footers = <>
          Title.Caption = #1057#1072#1083#1100#1076#1086
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'HOUSE_INFO'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089
          Title.TitleButton = True
          Width = 108
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CUST_CODE'
          Footers = <>
          Title.Caption = #1050#1086#1076
          Title.TitleButton = True
          Width = 80
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CUST_STATE_DESCR'
          Footers = <>
          Title.Caption = #1057#1090#1072#1090#1091#1089
          Title.TitleButton = True
          Width = 181
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'O_NAME'
          Footers = <>
          Title.Caption = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
          Title.TitleButton = True
          Visible = False
          Width = 83
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'SRV_NAME'
          Footers = <>
          Title.Caption = #1059#1089#1083#1091#1075#1072
          Title.TitleButton = True
          Width = 119
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_TYPE_STR'
          Footers = <>
          Title.Caption = #1057#1087#1086#1089#1086#1073' '#1086#1087#1083#1072#1090#1099
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DisplayFormat = ',#.##'
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_CMSN'
          Footer.DisplayFormat = ',#.##'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1050#1086#1084#1080#1089#1089#1080#1103
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PHONE'
          Footers = <>
          Title.Caption = #1058#1077#1083#1077#1092#1086#1085#1099
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EMAIL'
          Footers = <>
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1067
    Height = 89
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object pnlPayDocHeader: TPanel
      Left = 0
      Top = 0
      Width = 553
      Height = 89
      Align = alLeft
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        553
        89)
      object Label1: TLabel
        Left = 8
        Top = 3
        Width = 51
        Height = 13
        Caption = #8470' '#1076#1086#1082#1091#1084'.'
        FocusControl = dbedtPAY_DOC_NO
      end
      object Label7: TLabel
        Left = 103
        Top = 3
        Width = 26
        Height = 13
        Caption = #1044#1072#1090#1072
      end
      object Label8: TLabel
        Left = 209
        Top = 3
        Width = 95
        Height = 13
        Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1087#1083#1072#1090#1077#1078#1072
      end
      object Label9: TLabel
        Left = 8
        Top = 45
        Width = 31
        Height = 13
        Caption = #1057#1091#1084#1084#1072
      end
      object dbedtPAY_DOC_NO: TDBEditEh
        Tag = 1
        Left = 8
        Top = 19
        Width = 91
        Height = 21
        DataField = 'PAY_DOC_NO'
        DataSource = srcPayDoc
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1055#1044
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object DocDate: TDBDateTimeEditEh
        Tag = 2
        Left = 103
        Top = 19
        Width = 103
        Height = 21
        DataField = 'PAY_DOC_DATE'
        DataSource = srcPayDoc
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1044#1072#1090#1072' '#1055#1044
        Kind = dtkDateEh
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Visible = True
      end
      object Panel3: TPanel
        Left = 128
        Top = 43
        Width = 420
        Height = 43
        BevelInner = bvLowered
        Enabled = False
        TabOrder = 4
        object Label10: TLabel
          Left = 5
          Top = 2
          Width = 71
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1082#1086#1084'.'#1089#1073'.'
        end
        object Label11: TLabel
          Left = 183
          Top = 2
          Width = 102
          Height = 13
          Caption = #1041#1077#1079' '#1082#1086#1084'. '#1089#1073#1086#1088' '#1080' '#1053#1044#1057
        end
        object Label12: TLabel
          Left = 81
          Top = 2
          Width = 56
          Height = 13
          Caption = #1057#1091#1084#1084#1072' '#1053#1044#1057
          FocusControl = DBEditC_SUM_LEAK
        end
        object LabelSUM_DIFFERENCE: TLabel
          Left = 291
          Top = 2
          Width = 67
          Height = 13
          Caption = #1056#1072#1079#1085#1080#1094#1072' '#1089#1091#1084#1084
        end
        object DBEditL_LEAK_PRC: TDBNumberEditEh
          Left = 5
          Top = 18
          Width = 73
          Height = 21
          TabStop = False
          Color = 16776176
          DataField = 'C_SUM_LEAK'
          DataSource = srcPayDoc
          DynProps = <>
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          Visible = True
        end
        object DBEditC_SUM_LEAK: TDBNumberEditEh
          Left = 81
          Top = 18
          Width = 99
          Height = 21
          TabStop = False
          Color = 16776176
          DataField = 'C_SUM_TAX'
          DataSource = srcPayDoc
          DynProps = <>
          EditButtons = <>
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
          Visible = True
        end
        object DBEditSUM_DIFFERENCE: TDBNumberEditEh
          Tag = 13
          Left = 291
          Top = 18
          Width = 111
          Height = 21
          TabStop = False
          Color = 16776176
          DataField = 'SUM_DIFFERENCE'
          DataSource = srcPayDoc
          DisplayFormat = ',0.00'
          DynProps = <>
          EditButtons = <>
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Visible = True
        end
        object ednC_SUM_LEAK_TAX: TDBNumberEditEh
          Left = 183
          Top = 18
          Width = 105
          Height = 21
          DataField = 'C_SUM_LEAK_TAX'
          DataSource = srcPayDoc
          DynProps = <>
          EditButtons = <>
          ShowHint = True
          TabOrder = 2
          Visible = True
        end
      end
      object tbButtons: TToolBar
        Left = 430
        Top = 11
        Width = 120
        Height = 29
        Align = alNone
        Anchors = [akTop, akRight]
        ButtonHeight = 25
        ButtonWidth = 25
        Caption = 'tbButtons'
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object tbEditDoc: TToolButton
          Left = 0
          Top = 0
          Action = actPayDocEdit
        end
        object ToolButton22: TToolButton
          Left = 25
          Top = 0
          Width = 8
          Caption = 'ToolButton22'
          ImageIndex = 11
          Style = tbsSeparator
        end
        object ToolButton4: TToolButton
          Left = 33
          Top = 0
          Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103' (Ctrl+Enter)'
          Action = ActPayDocPost
        end
        object ToolButton5: TToolButton
          Left = 58
          Top = 0
          Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1079#1084#1077#1085#1077#1085#1080#1103' (Esc)'
          Action = ActPayDocCancel
        end
        object ToolButton25: TToolButton
          Left = 83
          Top = 0
          Width = 8
          Caption = 'ToolButton25'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object ToolButton21: TToolButton
          Left = 91
          Top = 0
          Action = ActPayDocPrint
        end
      end
      object DocType: TDBLookupComboboxEh
        Left = 209
        Top = 19
        Width = 215
        Height = 21
        DynProps = <>
        DataField = 'PAYSOURCE_ID'
        DataSource = srcPayDoc
        DropDownBox.Columns = <
          item
            FieldName = 'PAYSOURCE_DESCR'
            Width = 110
          end
          item
            FieldName = 'LEAK_PRC'
            Width = 35
          end
          item
            FieldName = 'TAX_PRC'
            Width = 35
          end>
        DropDownBox.ListSource = srcPaymentSource
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1043#1076#1077' '#1073#1099#1083#1072' '#1086#1087#1083#1072#1090#1072
        EditButtons = <>
        KeyField = 'PAYSOURCE_ID'
        ListField = 'PAYSOURCE_DESCR'
        ListSource = srcPaymentSource
        ParentShowHint = False
        ShowHint = True
        Style = csDropDownEh
        TabOrder = 3
        Visible = True
      end
      object dbePAY_DOC_SUM: TDBNumberEditEh
        Left = 8
        Top = 61
        Width = 114
        Height = 21
        DataField = 'PAY_DOC_SUM'
        DataSource = srcPayDoc
        DisplayFormat = '#.00'
        DynProps = <>
        EmptyDataInfo.Text = #1057#1091#1084#1084#1072
        EditButtons = <>
        ShowHint = True
        TabOrder = 5
        Visible = True
      end
    end
    object pnlNotice: TPanel
      Left = 553
      Top = 0
      Width = 514
      Height = 89
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlNotice'
      TabOrder = 1
      object Label14: TLabel
        Left = 0
        Top = 0
        Width = 514
        Height = 13
        Align = alTop
        Caption = '  '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
        ExplicitWidth = 71
      end
      object mmoNotice: TDBMemoEh
        Left = 0
        Top = 13
        Width = 514
        Height = 76
        Align = alClient
        AutoSize = False
        DataField = 'NOTICE'
        DataSource = srcPayDoc
        DynProps = <>
        EditButtons = <>
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        Visible = True
        WantReturns = True
        OnEnter = mmoNoticeEnter
      end
    end
  end
  object pnlErrors: TPanel
    Left = 0
    Top = 399
    Width = 1067
    Height = 208
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object lbl1: TLabel
      Left = 0
      Top = 0
      Width = 1067
      Height = 13
      Align = alTop
      Caption = #1054#1096#1080#1073#1082#1080' '#1079#1072#1075#1088#1091#1079#1082#1080' '#1087#1083#1072#1090#1077#1078#1077#1081
      ExplicitWidth = 141
    end
    object dbgErrors: TDBGridEh
      Left = 0
      Top = 13
      Width = 1067
      Height = 195
      Align = alClient
      AllowedOperations = [alopDeleteEh]
      AllowedSelections = [gstRecordBookmarks, gstRectangle, gstAll]
      DataSource = srcErrors
      DynProps = <>
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
      PopupMenu = pmErrorGrid
      SortLocal = True
      STFilter.Local = True
      SumList.Active = True
      TabOrder = 0
      Columns = <
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ERROR_TEXT'
          Footer.Value = #1048#1090#1086#1075#1086
          Footer.ValueType = fvtStaticText
          Footers = <>
          Title.Caption = #1054#1096#1080#1073#1082#1072
          Width = 193
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'LINE'
          Footers = <>
          Title.Caption = #1057#1090#1088#1086#1082#1072' '#1089' '#1086#1096#1080#1073#1082#1086#1081
          Width = 231
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
          Width = 110
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAY_SUM'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1091#1084#1084#1072
          Width = 107
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object dsPayDocDetail: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PAYMENT'
      'WHERE'
      '        PAYMENT_ID = :OLD_PAYMENT_ID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    P.*'
      
        '  , coalesce(p.Cmsn, round(((p.Pay_Sum + p.Fine_Sum) * ps.Leak_P' +
        'rc) / 100, 2), 0) as PAY_CMSN'
      '  , (coalesce(p.Pay_Sum, 0) + coalesce(p.Fine_Sum, 0)) PAID'
      '  , o.O_NAME'
      '  , CS.Cust_Code'
      '  , CS.Account_No'
      '  , CS.Surname || '#39' '#39' || CS.Initials as Cust_Descr'
      '  , CS.DEBT_SUM'
      '  , cs.HIS_COLOR'
      '  , -1 * cs.debt_sum as BALANCE'
      '  , CS.Cust_State_Descr'
      '  , S.Street_Name'
      
        '  , S.Street_Name || '#39'  '#1076'.'#39' || H.House_No || '#39' '#1082#1074'.'#39' || CS.Flat_N' +
        'o as House_Info'
      '  , R.NAME as SRV_NAME'
      '  , p.PAY_TYPE_STR'
      '  , coalesce(w.Surname, p.ADDED_BY) as WHO_ADD'
      '  , cast(left(cc.phone,1000) as varchar(1000)) PHONE'
      '  , cs.Email'
      '  from PAYMENT P'
      '       inner join pay_doc D on (p.Pay_Doc_Id = d.Pay_Doc_Id)'
      
        '       inner join Paysource ps on (ps.Paysource_Id = d.Paysource' +
        '_Id)'
      
        '       inner join Customer CS on (CS.Customer_Id = P.Customer_Id' +
        ')'
      '       inner join HOUSE H on (H.HOUSE_ID = CS.HOUSE_ID)'
      '       inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      '       left outer join OBJECTS O on (P.PAYMENT_TYPE = O.O_ID and'
      '             o.o_type = 2)'
      
        '       left outer join SERVICES R on (P.payment_srv = R.service_' +
        'id)'
      '       left outer join worker w on (w.Ibname = p.ADDED_BY)'
      '       left outer join(select'
      '                           cc.Customer_Id'
      '                         , list(cc.Cc_Value) phone'
      '                         from Customer_Contacts cc'
      '                         where cc.Cc_Type < 2'
      
        '                         group by cc.Customer_Id) cc on (Cc.Cust' +
        'omer_Id = P.Customer_Id)'
      ''
      '  where P.Pay_Doc_Id = :Pay_Doc_Id'
      '        and P.PAYMENT_ID = :OLD_PAYMENT_ID'
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    P.*'
      
        '  , coalesce(p.Cmsn, round(((p.Pay_Sum + p.Fine_Sum) * ps.Leak_P' +
        'rc) / 100, 2), 0) as PAY_CMSN'
      '  , (coalesce(p.Pay_Sum, 0) + coalesce(p.Fine_Sum, 0)) PAID'
      '  , o.O_NAME'
      '  , CS.Cust_Code'
      '  , CS.Account_No'
      '  , CS.Surname || '#39' '#39' || CS.Initials as Cust_Descr'
      '  , CS.DEBT_SUM'
      '  , cs.HIS_COLOR'
      '  , -1 * cs.debt_sum as BALANCE'
      '  , CS.Cust_State_Descr'
      '  , S.Street_Name'
      
        '  , S.Street_Name || '#39'  '#1076'.'#39' || H.House_No || '#39' '#1082#1074'.'#39' || CS.Flat_N' +
        'o as House_Info'
      '  , R.NAME as SRV_NAME'
      '  , p.PAY_TYPE_STR'
      '  , coalesce(w.Surname, p.ADDED_BY) as WHO_ADD'
      '  , cast( left(cc.phone, 1000) as varchar(1000)) PHONE'
      '  , cs.Email'
      '  from PAYMENT P'
      '       inner join pay_doc D on (p.Pay_Doc_Id = d.Pay_Doc_Id)'
      
        '       inner join Customer CS on (CS.Customer_Id = P.Customer_Id' +
        ')'
      '       inner join HOUSE H on (H.HOUSE_ID = CS.HOUSE_ID)'
      '       inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      
        '       left outer join Paysource ps on (ps.Paysource_Id = d.Pays' +
        'ource_Id)        '
      '       left outer join OBJECTS O on (P.PAYMENT_TYPE = O.O_ID and'
      '             o.o_type = 2)'
      
        '       left outer join SERVICES R on (P.payment_srv = R.service_' +
        'id)'
      '       left outer join worker w on (w.Ibname = p.ADDED_BY)'
      '       left outer join(select'
      '                           cc.Customer_Id'
      '                         , list(cc.Cc_Value) phone'
      '                         from Customer_Contacts cc'
      '                         where cc.Cc_Type < 2'
      
        '                         group by cc.Customer_Id) cc on (Cc.Cust' +
        'omer_Id = P.Customer_Id)'
      '  where P.PAY_DOC_ID = :PAY_DOC_ID      ')
    AutoUpdateOptions.UpdateTableName = 'PAYMENT'
    AutoUpdateOptions.KeyFields = 'PAYMENT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcPayDoc
    Left = 137
    Top = 208
    oVisibleRecno = True
    oFetchAll = True
  end
  object srcsPayDocDetail: TDataSource
    AutoEdit = False
    DataSet = dsPayDocDetail
    OnDataChange = srcsPayDocDetailDataChange
    Left = 138
    Top = 274
  end
  object alPayment: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 234
    Top = 210
    object actPaymentNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1090#1077#1078
      ImageIndex = 2
      ShortCut = 117
      OnExecute = actPaymentNewExecute
    end
    object actPaymentDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1083#1072#1090#1077#1078
      ImageIndex = 3
      OnExecute = actPaymentDeleteExecute
    end
    object actPayDocEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1075#1086#1083#1086#1074#1086#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      ImageIndex = 4
      ShortCut = 113
      OnExecute = actPayDocEditExecute
    end
    object actPaymentDetail: TAction
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1083#1072#1090#1077#1078
      ImageIndex = 24
    end
    object act_CalcFine: TAction
      Caption = #1056#1072#1089#1095#1077#1090' '#1087#1077#1085#1080
    end
    object actQuickFilter: TAction
      Caption = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083'/'#1042#1099#1082#1083' '#1073#1099#1089#1090#1088#1086#1075#1086' '#1092#1080#1083#1100#1090#1088#1072
      ImageIndex = 40
      ShortCut = 16465
      OnExecute = actQuickFilterExecute
    end
    object ActPayDocPost: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 25
      OnExecute = ActPayDocPostExecute
    end
    object ActPayDocCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1079#1084#1077#1085#1077#1085#1080#1103
      Hint = #1054#1090#1084#1077#1085#1080#1090#1100' '#1079#1084#1077#1085#1077#1085#1080#1103
      ImageIndex = 26
      OnExecute = ActPayDocCancelExecute
    end
    object ActPayDocPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      Hint = #1055#1077#1095#1072#1090#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 5
      OnExecute = ActPayDocPrintExecute
    end
    object actEditPayment: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1083#1080#1094#1077#1074#1086#1081' '#1080#1083#1080' '#1089#1091#1084#1084#1091' '#1087#1083#1072#1090#1077#1078#1072
      ImageIndex = 4
      OnExecute = actEditPaymentExecute
    end
    object actMovePayment: TAction
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080
      Hint = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1074' '#1076#1088#1091#1075#1086#1081' '#1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 10
      OnExecute = actMovePaymentExecute
    end
    object actFilterCustomer: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1089#1087#1080#1089#1082#1077
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074' '#1089#1087#1080#1089#1082#1077' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      ImageIndex = 9
      OnExecute = actFilterCustomerExecute
    end
    object actPrintCheck: TAction
      Caption = 'actPrintCheck'
      Hint = #1055#1077#1095#1072#1090#1100' '#1082#1074#1080#1090#1072#1085#1094#1080#1081
      ImageIndex = 5
      OnExecute = actPrintCheckExecute
    end
    object actErrorProceed: TAction
      Caption = #1042#1085#1077#1089#1090#1080' '#1082#1072#1082' '#1087#1083#1072#1090#1077#1078
      OnExecute = actErrorProceedExecute
    end
    object actErrorsDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1096#1080#1073#1082#1091
      OnExecute = actErrorsDelExecute
    end
    object actTask: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      ImageIndex = 87
      ShortCut = 121
      OnExecute = actTaskExecute
    end
  end
  object dsPayDoc: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PAY_DOC'
      'SET '
      '    PAYSOURCE_ID = :PAYSOURCE_ID,'
      '    PAY_DOC_NO = :PAY_DOC_NO,'
      '    PAY_DOC_DATE = :PAY_DOC_DATE,'
      '    PAY_DOC_SUM = :PAY_DOC_SUM,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    PAY_DOC_ID = :OLD_PAY_DOC_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PAY_DOC'
      'WHERE'
      '        PAY_DOC_ID = :OLD_PAY_DOC_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PAY_DOC('
      '    PAY_DOC_ID,'
      '    PAYSOURCE_ID,'
      '    PAY_DOC_NO,'
      '    PAY_DOC_DATE,'
      '    PAY_DOC_SUM,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :PAY_DOC_ID,'
      '    :PAYSOURCE_ID,'
      '    :PAY_DOC_NO,'
      '    :PAY_DOC_DATE,'
      '    :PAY_DOC_SUM,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    D.PAY_DOC_ID'
      '  , D.PAYSOURCE_ID'
      '  , D.PAY_DOC_NO'
      '  , D.PAY_DOC_DATE'
      '  , D.PAY_DOC_SUM'
      '  , D.NOTICE'
      '  , ps.paysource_descr'
      '  , ps.leak_prc'
      '  , p.c_SUM_leak'
      '  , round(ps.tax_prc * p.c_SUM_leak / 100, 2) as c_SUM_TAX'
      
        '  , ((SUM_INTERED + FINE_SUM) - round(((ps.tax_prc * p.c_SUM_lea' +
        'k / 100) + p.c_SUM_leak), 2)) as c_SUM_LEAK_TAX'
      '  , p.SUM_INTERED'
      
        '  , (coalesce(D.PAY_DOC_SUM, 0) - coalesce(p.SUM_INTERED, 0) - c' +
        'oalesce(p.FINE_SUM, 0)) SUM_DIFFERENCE'
      '  , (select'
      '         count(*)'
      '       from pay_errors pe'
      '       where pe.pay_doc_id = d.Pay_Doc_Id) pay_errors'
      '  , ps.FOR_FORM     '
      '  from PAY_DOC D'
      
        '       left outer join PAYSOURCE PS on (D.PAYSOURCE_ID = PS.PAYS' +
        'OURCE_ID)'
      '       left outer join(select'
      '                           p.PAY_DOC_ID'
      '                         , sum(p.PAY_SUM) as SUM_INTERED'
      
        '                         , sum(coalesce(p.Fine_Sum, 0)) as FINE_' +
        'SUM'
      '                         , sum(coalesce(p.Cmsn,'
      
        '                           ((p.Pay_Sum + coalesce(p.Fine_Sum, 0)' +
        ') * ss.Leak_Prc) / 100, 0)) as c_SUM_leak'
      '                         from PAYMENT p'
      
        '                              inner join PAY_DOC ds on (p.Pay_Do' +
        'c_Id = ds.Pay_Doc_Id)'
      
        '                              inner join PAYSOURCE ss on (ds.PAY' +
        'SOURCE_ID = ss.PAYSOURCE_ID)'
      
        '                         group by PAY_DOC_ID) P on (P.PAY_DOC_ID' +
        ' = D.PAY_DOC_ID)'
      'where d.PAY_DOC_ID = :OLD_PAY_DOC_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    D.PAY_DOC_ID'
      '  , D.PAYSOURCE_ID'
      '  , D.PAY_DOC_NO'
      '  , D.PAY_DOC_DATE'
      '  , D.PAY_DOC_SUM'
      '  , D.NOTICE'
      '  , ps.paysource_descr'
      '  , ps.leak_prc'
      '  , p.c_SUM_leak'
      '  , round(ps.tax_prc * p.c_SUM_leak / 100, 2) as c_SUM_TAX'
      
        '  , ((SUM_INTERED + FINE_SUM) - round(((ps.tax_prc * p.c_SUM_lea' +
        'k / 100) + p.c_SUM_leak), 2)) as c_SUM_LEAK_TAX'
      '  , p.SUM_INTERED'
      
        '  , (coalesce(D.PAY_DOC_SUM, 0) - coalesce(p.SUM_INTERED, 0) - c' +
        'oalesce(p.FINE_SUM, 0)) SUM_DIFFERENCE'
      '  , (select'
      '         count(*)'
      '       from pay_errors pe'
      '       where pe.pay_doc_id = d.Pay_Doc_Id) pay_errors'
      '  , ps.FOR_FORM     '
      '  from PAY_DOC D'
      
        '       left outer join PAYSOURCE PS on (D.PAYSOURCE_ID = PS.PAYS' +
        'OURCE_ID)'
      '       left outer join(select'
      '                           p.PAY_DOC_ID'
      '                         , sum(p.PAY_SUM) as SUM_INTERED'
      
        '                         , sum(coalesce(p.Fine_Sum, 0)) as FINE_' +
        'SUM'
      '                         , sum(coalesce(p.Cmsn,'
      
        '                           ((p.Pay_Sum + coalesce(p.Fine_Sum, 0)' +
        ') * ss.Leak_Prc) / 100, 0)) as c_SUM_leak'
      '                         from PAYMENT p'
      
        '                              inner join PAY_DOC ds on (p.Pay_Do' +
        'c_Id = ds.Pay_Doc_Id)'
      
        '                              inner join PAYSOURCE ss on (ds.PAY' +
        'SOURCE_ID = ss.PAYSOURCE_ID)'
      
        '                         group by PAY_DOC_ID) P on (P.PAY_DOC_ID' +
        ' = D.PAY_DOC_ID)'
      '  where D.PAY_DOC_ID = :PAY_DOC_ID')
    AutoUpdateOptions.AutoReWriteSqls = True
    AutoCalcFields = False
    AfterCancel = dsPayDocAfterCancel
    AfterOpen = dsPayDocAfterOpen
    AfterPost = dsPayDocAfterPost
    OnNewRecord = dsPayDocNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DefaultFormats.NumericDisplayFormat = '#'
    Left = 40
    Top = 208
    poImportDefaultValues = False
    oRefreshAfterPost = False
    oRefreshDeletedRecord = True
  end
  object srcPayDoc: TDataSource
    AutoEdit = False
    DataSet = dsPayDoc
    OnStateChange = srcPayDocStateChange
    Left = 40
    Top = 272
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
    Left = 456
    Top = 236
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
    Left = 412
    Top = 236
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
    Left = 456
    Top = 284
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
    Left = 412
    Top = 284
  end
  object dsPaymentSource: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT PAYSOURCE_ID, PAYSOURCE_DESCR, LEAK_PRC, TAX_PRC'
      'FROM PAYSOURCE'
      'where coalesce(DELETED,0) = 0'
      'order by paysource_descr')
    Transaction = trRead1
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 560
    Top = 248
    oFetchAll = True
  end
  object srcPaymentSource: TDataSource
    AutoEdit = False
    DataSet = dsPaymentSource
    Left = 544
    Top = 320
  end
  object gridPopUp: TPopupMenu
    Left = 236
    Top = 270
    object ppmCopy: TMenuItem
      Caption = '&'#1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = ppmCopyClick
    end
    object ppmSelectAll: TMenuItem
      Caption = '&'#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnClick = ppmSelectAllClick
    end
    object MenuItem1: TMenuItem
      Caption = '-'
    end
    object ppmSaveSelection: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082' ...'
      OnClick = ppmSaveSelectionClick
    end
  end
  object srcErrors: TDataSource
    DataSet = dsErrors
    Left = 263
    Top = 526
  end
  object dsErrors: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PAY_ERRORS'
      'SET '
      '    PAY_DOC_ID = :PAY_DOC_ID,'
      '    PAY_DATE = :PAY_DATE,'
      '    PAY_SUM = :PAY_SUM,'
      '    LINE = :LINE,'
      '    ERROR_TEXT = :ERROR_TEXT'
      'WHERE'
      '    PE_ID = :OLD_PE_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    PAY_ERRORS'
      'WHERE'
      '        PE_ID = :OLD_PE_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO PAY_ERRORS('
      '    PE_ID,'
      '    PAY_DOC_ID,'
      '    PAY_DATE,'
      '    PAY_SUM,'
      '    LINE,'
      '    ERROR_TEXT'
      ')'
      'VALUES('
      '    :PE_ID,'
      '    :PAY_DOC_ID,'
      '    :PAY_DATE,'
      '    :PAY_SUM,'
      '    :LINE,'
      '    :ERROR_TEXT'
      ')')
    RefreshSQL.Strings = (
      'select PE_ID, PAY_DOC_ID, PAY_DATE, PAY_SUM, LINE, ERROR_TEXT'
      'from PAY_ERRORS'
      'where(  pay_doc_id = :PAY_DOC_ID'
      '     ) and (     PAY_ERRORS.PE_ID = :OLD_PE_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select PE_ID, PAY_DOC_ID, PAY_DATE, PAY_SUM, LINE, ERROR_TEXT'
      'from PAY_ERRORS'
      'where pay_doc_id = :PAY_DOC_ID'
      'order by 1')
    AfterOpen = dsErrorsAfterOpen
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcPayDoc
    Left = 332
    Top = 525
  end
  object pmErrorGrid: TPopupMenu
    Left = 156
    Top = 478
    object N1: TMenuItem
      Action = actErrorProceed
      Default = True
    end
    object N3: TMenuItem
      Action = actErrorsDel
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MenuItem2: TMenuItem
      Caption = '&'#1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = ppmCopyClick
    end
    object MenuItem3: TMenuItem
      Caption = '&'#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnClick = ppmSelectAllClick
    end
    object MenuItem4: TMenuItem
      Caption = '-'
    end
    object MenuItem5: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082' ...'
      OnClick = ppmSaveSelectionClick
    end
  end
  object trRead1: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 628
    Top = 244
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 360
    Top = 176
  end
end
