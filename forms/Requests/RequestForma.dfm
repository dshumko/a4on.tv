object RequestForm: TRequestForm
  Left = 256
  Top = 201
  Caption = #1047#1072#1103#1074#1082#1072
  ClientHeight = 562
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  Menu = mmRequest
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    784
    562)
  PixelsPerInch = 96
  TextHeight = 13
  inline OkCancelFrame: TOkCancelFrame
    Left = 0
    Top = 525
    Width = 784
    Height = 37
    Align = alBottom
    TabOrder = 2
    TabStop = True
    inherited bbOk: TBitBtn
      Left = 359
      Top = 6
      Width = 207
      Height = 27
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = OkCancelFramebbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 582
      Top = 6
      Width = 200
      Height = 27
      OnClick = OkCancelFrame1bbCancelClick
    end
  end
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 784
    Height = 188
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object pnlRequestHead: TPanel
      Left = 0
      Top = 0
      Width = 410
      Height = 188
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object pnlReqType: TPanel
        Left = 0
        Top = 148
        Width = 410
        Height = 40
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object Label9: TLabel
          Left = 8
          Top = 5
          Width = 63
          Height = 13
          Caption = #1058#1080#1087' '#1079#1072#1103#1074#1082#1080
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object luType: TDBLookupComboboxEh
          Left = 93
          Top = 2
          Width = 311
          Height = 21
          DynProps = <>
          DataField = 'RQ_TYPE'
          DataSource = srcRequest
          EditButtons = <>
          KeyField = 'RT_ID'
          ListField = 'RT_NAME'
          ListSource = srcRequestType
          TabOrder = 0
          Visible = True
          OnChange = luTypeChange
          OnDropDownBoxGetCellParams = luTypeDropDownBoxGetCellParams
          OnEnter = luTypeEnter
        end
      end
      object pnlCustSearch: TPanel
        Left = 0
        Top = 0
        Width = 410
        Height = 38
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Label4: TLabel
          Left = 8
          Top = 1
          Width = 90
          Height = 13
          Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1083#1080#1094#1077#1074#1086#1081
        end
        object Label18: TLabel
          Left = 206
          Top = 1
          Width = 47
          Height = 13
          Caption = #1080#1083#1080' '#1050#1086#1076#1091
        end
        object edLicevoy: TEdit
          Left = 8
          Top = 17
          Width = 192
          Height = 21
          TabStop = False
          TabOrder = 0
          OnExit = edLicevoyExit
        end
        object edCode: TEdit
          Left = 205
          Top = 16
          Width = 199
          Height = 21
          TabStop = False
          TabOrder = 1
          OnExit = edCodeExit
        end
      end
      object pnlAddress: TPanel
        Left = 0
        Top = 38
        Width = 410
        Height = 110
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label3: TLabel
          Left = 8
          Top = 2
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
        object Label14: TLabel
          Left = 205
          Top = 2
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
        object Label15: TLabel
          Left = 279
          Top = 2
          Width = 49
          Height = 13
          Caption = #1050#1074#1072#1088#1090#1080#1088#1072
        end
        object Label16: TLabel
          Left = 8
          Top = 68
          Width = 22
          Height = 13
          Caption = #1058#1077#1083'.'
        end
        object Label22: TLabel
          Left = 8
          Top = 46
          Width = 45
          Height = 13
          Caption = #1055#1086#1076#1098#1077#1079#1076
        end
        object Label24: TLabel
          Left = 106
          Top = 46
          Width = 27
          Height = 13
          Caption = #1069#1090#1072#1078
        end
        object lbl2: TLabel
          Left = 196
          Top = 46
          Width = 74
          Height = 13
          Caption = #1050#1086#1076' '#1076#1086#1084#1086#1092#1086#1085#1072
        end
        object LupStreets: TDBLookupComboboxEh
          Left = 8
          Top = 15
          Width = 192
          Height = 21
          DynProps = <>
          DataField = 'STREET_ID'
          DataSource = srcRequest
          DropDownBox.Columns = <
            item
              AutoFitColWidth = False
              FieldName = 'STREET_SHORT'
              Title.Caption = #1089#1086#1082#1088'.'
              Width = 20
            end
            item
              FieldName = 'STREET_NAME'
              Title.Caption = #1059#1083#1080#1094#1072
            end
            item
              FieldName = 'AREA_NAME'
              Title.Caption = #1056#1072#1081#1086#1085
            end>
          DropDownBox.AutoDrop = True
          DropDownBox.ShowTitles = True
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'STREET_ID'
          ListField = 'STREET_NAME'
          ListSource = srcStreet
          ReadOnly = True
          TabOrder = 0
          Visible = True
          OnChange = dbDateChange
        end
        object LupHOUSE: TDBLookupComboboxEh
          Left = 205
          Top = 15
          Width = 68
          Height = 21
          DynProps = <>
          DataField = 'HOUSE_ID'
          DataSource = srcRequest
          EditButtons = <>
          KeyField = 'HOUSE_ID'
          ListField = 'HOUSE_NO'
          ListSource = srcHouse
          ReadOnly = True
          TabOrder = 1
          Visible = True
          OnChange = LupHOUSEChange
        end
        object edFLAT_NO: TDBEditEh
          Tag = 7
          Left = 279
          Top = 15
          Width = 125
          Height = 21
          DataField = 'FLAT_NO'
          DataSource = srcRequest
          DynProps = <>
          EditButtons = <>
          ReadOnly = True
          TabOrder = 2
          Visible = True
        end
        object btnFind: TButton
          Left = 279
          Top = 73
          Width = 125
          Height = 33
          Action = actFindCustomer
          TabOrder = 6
        end
        object edPhone: TDBEditEh
          Left = 8
          Top = 84
          Width = 265
          Height = 21
          DynProps = <>
          EditButtons = <>
          ReadOnly = True
          TabOrder = 7
          Visible = True
          OnChange = edPhoneChange
          OnExit = edPhoneExit
        end
        object EdPorch: TDBEditEh
          Tag = 7
          Left = 59
          Top = 43
          Width = 34
          Height = 21
          Hint = #1055#1086#1076#1098#1077#1079#1076
          AutoSize = False
          DataField = 'PORCH_N'
          DataSource = srcRequest
          DynProps = <>
          EditButtons = <>
          ReadOnly = True
          TabOrder = 3
          Visible = True
        end
        object EdFloor: TDBEditEh
          Tag = 7
          Left = 145
          Top = 43
          Width = 33
          Height = 21
          Hint = #1069#1090#1072#1078
          AutoSize = False
          DataField = 'FLOOR_N'
          DataSource = srcRequest
          DynProps = <>
          EditButtons = <>
          ReadOnly = True
          TabOrder = 4
          Visible = True
          OnExit = EdFloorExit
        end
        object edDOOR: TDBEditEh
          Left = 279
          Top = 43
          Width = 125
          Height = 21
          DataField = 'DOOR_CODE'
          DataSource = srcRequest
          DynProps = <>
          EditButtons = <>
          ReadOnly = True
          TabOrder = 5
          Visible = True
        end
      end
    end
    object pnlCI: TPanel
      Left = 410
      Top = 0
      Width = 374
      Height = 188
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlCI'
      TabOrder = 1
      object dbtxtUchZv: TDBText
        Left = 0
        Top = 171
        Width = 374
        Height = 17
        Align = alBottom
        DataField = 'WAREA'
        DataSource = srcHouse
      end
      object dbtParent: TDBText
        Left = 0
        Top = 154
        Width = 374
        Height = 17
        Hint = #1044#1074#1086#1081#1085#1086#1081' '#1082#1083#1080#1082' '#1076#1083#1103' '#1086#1090#1082#1088#1099#1090#1080#1103' '#1079#1072#1103#1074#1082#1080
        Align = alBottom
        DataField = 'PARENT_INFO'
        DataSource = srcRequest
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnDblClick = dbtParentDblClick
      end
      object dbtxtCHILD_INFO: TDBText
        Left = 0
        Top = 137
        Width = 374
        Height = 17
        Hint = #1044#1074#1086#1081#1085#1086#1081' '#1082#1083#1080#1082' '#1076#1083#1103' '#1086#1090#1082#1088#1099#1090#1080#1103' '#1079#1072#1103#1074#1082#1080
        Align = alBottom
        DataField = 'CHILD_INFO'
        DataSource = srcRequest
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnDblClick = dbtxtCHILD_INFODblClick
      end
      inline CustomerInfoFrm: TCustomerInfoFrm
        Left = 0
        Top = 0
        Width = 374
        Height = 137
        Align = alClient
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        inherited gbInfo: TGroupBox
          Width = 374
          Height = 137
          inherited lblFIO: TLabel
            Width = 370
            OnDblClick = CustomerInfoFrmlblFIODblClick
          end
          inherited lblDebt: TLabel
            Width = 370
            OnDblClick = CustomerInfoFrmlblFIODblClick
          end
          inherited memAbonent: TMemo
            Width = 370
            Height = 94
            OnDblClick = CustomerInfoFrmlblFIODblClick
          end
        end
      end
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 188
    Width = 784
    Height = 337
    ActivePage = tabRequest
    Align = alClient
    TabOrder = 1
    OnChange = PageControlChange
    OnChanging = PageControlChanging
    object tabRequest: TTabSheet
      Caption = #1055#1088#1080#1077#1084
      object Panel2: TPanel
        Left = 0
        Top = 118
        Width = 776
        Height = 150
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        object Label5: TLabel
          Left = 0
          Top = 0
          Width = 776
          Height = 13
          Align = alTop
          Caption = '  '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        end
        object dbContent: TDBMemoEh
          Left = 0
          Top = 13
          Width = 776
          Height = 137
          ScrollBars = ssVertical
          Align = alClient
          AutoSize = False
          DataField = 'RQ_NOTICE'
          DataSource = srcRequest
          DynProps = <>
          EditButtons = <>
          TabOrder = 0
          Visible = True
          WantReturns = True
        end
      end
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 89
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          776
          89)
        object Label11: TLabel
          Left = 4
          Top = 6
          Width = 142
          Height = 13
          Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1072#1090#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
        end
        object Label12: TLabel
          Left = 356
          Top = 6
          Width = 42
          Height = 13
          Caption = #1074#1088#1077#1084#1103' '#1089':'
        end
        object Label13: TLabel
          Left = 465
          Top = 6
          Width = 16
          Height = 13
          Caption = #1087#1086':'
        end
        object lbl12: TLabel
          Left = 4
          Top = 33
          Width = 83
          Height = 13
          Caption = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1079#1086#1074#1072
        end
        object PLANDATE: TDBDateTimeEditEh
          Left = 156
          Top = 3
          Width = 113
          Height = 21
          DataField = 'rq_plan_date'
          DataSource = srcRequest
          DynProps = <>
          EditButtons = <>
          Kind = dtkDateEh
          TabOrder = 0
          Visible = True
        end
        object deTimeFrom: TDBDateTimeEditEh
          Left = 406
          Top = 3
          Width = 50
          Height = 21
          DataField = 'RQ_TIME_FROM'
          DataSource = srcRequest
          DynProps = <>
          EditButton.Visible = False
          EditButtons = <>
          TabOrder = 2
          Visible = True
          OnExit = deTimeFromExit
          EditFormat = 'HH:NN'
        end
        object deTimeTo: TDBDateTimeEditEh
          Left = 489
          Top = 3
          Width = 50
          Height = 21
          DataField = 'RQ_TIME_TO'
          DataSource = srcRequest
          DynProps = <>
          EditButton.Visible = False
          EditButtons = <>
          TabOrder = 3
          Visible = True
          OnExit = deTimeToExit
          EditFormat = 'HH:NN'
        end
        object btnReqForAdres: TButton
          Left = 669
          Top = 3
          Width = 100
          Height = 22
          Action = actReqForAdres
          Anchors = [akTop, akRight]
          TabOrder = 4
          TabStop = False
        end
        object btnSelectDate: TBitBtn
          Left = 275
          Top = 3
          Width = 75
          Height = 22
          Caption = #1042#1099#1073#1086#1088' '#1076#1072#1090#1099
          TabOrder = 1
          OnClick = btnSelectDateClick
        end
        object luTemplate: TDBLookupComboboxEh
          Left = 96
          Top = 30
          Width = 673
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          DataField = 'RQTL_ID'
          DataSource = srcRequest
          DropDownBox.AutoDrop = True
          EditButtons = <>
          KeyField = 'RQTL_ID'
          ListField = 'RQ_CONTENT'
          ListSource = srcErrors
          TabOrder = 5
          Visible = True
          OnChange = luTemplateChange
        end
        object mmoContetnt: TDBMemoEh
          Left = 96
          Top = 55
          Width = 673
          Height = 32
          ScrollBars = ssVertical
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          DataField = 'RQ_CONTENT'
          DataSource = srcRequest
          DynProps = <>
          EditButtons = <>
          TabOrder = 6
          Visible = True
          WantReturns = True
        end
      end
      object pnlActions: TPanel
        Left = 0
        Top = 268
        Width = 776
        Height = 41
        Align = alBottom
        TabOrder = 3
        object btnCancel: TButton
          Left = 4
          Top = 9
          Width = 192
          Height = 25
          Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1079#1072#1103#1074#1082#1091
          TabOrder = 0
          OnClick = btnCancelClick
        end
      end
      object pnlAddInfo: TPanel
        Left = 0
        Top = 89
        Width = 776
        Height = 29
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        DesignSize = (
          776
          29)
        object lbl14: TLabel
          Left = 4
          Top = 6
          Width = 53
          Height = 13
          Caption = #1044#1086#1087'. '#1080#1085#1092#1086
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object cbbAdd: TDBComboBoxEh
          Left = 96
          Top = 2
          Width = 673
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'ADD_INFO'
          DataSource = srcRequest
          DynProps = <>
          DropDownBox.Sizable = True
          EditButtons = <>
          TabOrder = 0
          Visible = True
        end
      end
    end
    object tabGiveReq: TTabSheet
      Caption = #1042#1099#1076#1072#1095#1072
      ImageIndex = 1
      object Panel12: TPanel
        Left = 0
        Top = 33
        Width = 776
        Height = 276
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          776
          276)
        object Label17: TLabel
          Left = 0
          Top = 0
          Width = 776
          Height = 21
          Align = alTop
          AutoSize = False
          Caption = ' '#1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080
        end
        object bbExecutors: TButton
          Left = 78
          Top = 2
          Width = 537
          Height = 19
          Action = actExecutors
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object Panel13: TPanel
          Left = 0
          Top = 21
          Width = 776
          Height = 255
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object dbgWorkers: TDBGridEh
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 770
            Height = 249
            TabStop = False
            Align = alClient
            DataSource = srcExecutor
            DynProps = <>
            Flat = True
            FooterParams.Color = clWindow
            TabOrder = 0
            OnDblClick = dbgWorkersDblClick
            Columns = <
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'FIO'
                Footers = <>
                Title.Caption = #1060#1048#1054
                Width = 135
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'Phone_NO'
                Footers = <>
                Title.Caption = #1058#1077#1083#1077#1092#1086#1085
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'NOTICE'
                Footers = <>
                Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                Width = 355
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
        object btnSMS: TButton
          Left = 636
          Top = 0
          Width = 137
          Height = 19
          Action = actSMS
          Anchors = [akTop, akRight]
          TabOrder = 0
        end
      end
      object pnlGiveTime: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 33
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          776
          33)
        object Label20: TLabel
          Left = 4
          Top = 9
          Width = 109
          Height = 13
          Hint = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1079#1072#1103#1074#1082#1080
          Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077' ('#1085#1072#1095#1072#1083#1086')'
        end
        object lbl3: TLabel
          Left = 275
          Top = 9
          Width = 126
          Height = 13
          Caption = #1057#1090#1086#1088#1086#1085#1085#1080#1077' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080' '
        end
        object deStartExecDateTime: TDBDateTimeEditEh
          Left = 121
          Top = 6
          Width = 148
          Height = 21
          Hint = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1079#1072#1103#1074#1082#1080
          DataField = 'RQ_COMPLETED'
          DataSource = srcRequest
          DynProps = <>
          EditButtons = <>
          TabOrder = 0
          Visible = True
          EditFormat = 'DD/MM/YY HH:NN'
        end
        object edExExecutors: TDBEditEh
          Left = 406
          Top = 6
          Width = 367
          Height = 21
          Hint = #1057#1090#1086#1088#1086#1085#1085#1080#1077' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080' '#1087#1088#1086#1074#1086#1076#1080#1074#1096#1080#1077' '#1088#1072#1073#1086#1090#1091
          Anchors = [akLeft, akTop, akRight]
          DataField = 'EXTEXECUTOR'
          DataSource = srcRequest
          DynProps = <>
          EditButtons = <>
          TabOrder = 1
          Visible = True
          OnExit = edExExecutorsExit
        end
      end
    end
    object tabExecute: TTabSheet
      Caption = ' '#1042#1099#1087#1086#1083#1085#1077#1085#1080#1077' '
      ImageIndex = 1
      object spl2: TSplitter
        Left = 0
        Top = 238
        Width = 776
        Height = 3
        Cursor = crVSplit
        Align = alBottom
      end
      object pnlExecTop: TPanel
        Left = 0
        Top = 0
        Width = 776
        Height = 238
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object pnlExecTime: TPanel
          Left = 0
          Top = 0
          Width = 776
          Height = 55
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            776
            55)
          object Label10: TLabel
            Left = 4
            Top = 8
            Width = 127
            Height = 13
            Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077' ('#1086#1082#1086#1085#1095#1072#1085#1080#1077')'
          end
          object Label21: TLabel
            Left = 6
            Top = 32
            Width = 118
            Height = 13
            Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
          end
          object lblRes: TLabel
            Left = 275
            Top = 32
            Width = 125
            Height = 13
            Caption = #1056#1072#1089#1096#1080#1088#1077#1085#1085#1099#1081' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
          end
          object lbl5: TLabel
            Left = 345
            Top = 8
            Width = 55
            Height = 13
            Caption = #1050#1074#1080#1090#1072#1085#1094#1080#1103
          end
          object deEndExecDateTime: TDBDateTimeEditEh
            Left = 137
            Top = 3
            Width = 132
            Height = 21
            Hint = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1079#1072#1103#1074#1082#1080
            DataField = 'RQ_EXEC_TIME'
            DataSource = srcRequest
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
            TabOrder = 0
            Visible = True
            OnEnter = deEndExecDateTimeEnter
            OnUpdateData = deEndExecDateTimeUpdateData
            EditFormat = 'DD/MM/YY HH:NN'
          end
          object cbResultExec: TDBComboBoxEh
            Left = 137
            Top = 29
            Width = 132
            Height = 21
            DataField = 'REQ_RESULT'
            DataSource = srcRequest
            DynProps = <>
            EmptyDataInfo.Text = #1089' '#1082#1072#1082#1080#1084' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1084
            EditButtons = <>
            Items.Strings = (
              #1042#1099#1087#1086#1083#1085#1077#1085#1072
              #1054#1090#1084#1077#1085#1077#1085#1072' '#1072#1073#1086#1085#1077#1085#1090#1086#1084
              #1053#1077#1074#1086#1079#1084#1086#1078#1085#1086' '#1074#1099#1087#1086#1083#1085#1080#1090#1100)
            KeyItems.Strings = (
              '2'
              '3'
              '4')
            TabOrder = 1
            Visible = True
            OnChange = cbResultExecChange
          end
          object luResult: TDBLookupComboboxEh
            Left = 408
            Top = 29
            Width = 364
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DynProps = <>
            DataField = 'RESULT_ID'
            DataSource = srcRequest
            DropDownBox.AutoDrop = True
            EmptyDataInfo.Text = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1084#1086#1078#1085#1086' '#1076#1086#1087#1086#1083#1085#1080#1090#1100' '#1074' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1077' '#1058#1080#1087#1099' '#1079#1072#1103#1074#1086#1082
            EditButtons = <>
            KeyField = 'RR_ID'
            ListField = 'NAME'
            ListSource = srcResult
            TabOrder = 2
            Visible = True
            OnChange = luResultChange
          end
          object edReceipt: TDBEditEh
            Left = 408
            Top = 3
            Width = 364
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            DataField = 'RECEIPT'
            DataSource = srcRequest
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1045#1089#1083#1080' '#1073#1099#1083#1072' '#1074#1099#1076#1072#1085#1072' '#1082#1074#1080#1090#1072#1085#1094#1080#1103', '#1090#1086' '#1077#1077' '#1085#1086#1084#1077#1088', '#1080#1083#1080' '#1083#1102#1073#1086#1081' '#1090#1077#1082#1089#1090
            TabOrder = 3
            Visible = True
          end
        end
        object pnlWM: TPanel
          Left = 0
          Top = 55
          Width = 776
          Height = 183
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object pnlWMbuttons: TPanel
            Left = 0
            Top = 0
            Width = 100
            Height = 183
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              100
              183)
            object lbl1: TLabel
              Left = 4
              Top = 37
              Width = 58
              Height = 13
              Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
            end
            object btnWorks: TButton
              Left = 4
              Top = 8
              Width = 90
              Height = 21
              Action = actWorks
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
            end
            object btnMaterials: TButton
              Left = 4
              Top = 58
              Width = 90
              Height = 21
              Action = actMaterials
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
            end
            object btnMatIn: TButton
              Left = 4
              Top = 88
              Width = 90
              Height = 21
              Action = actMatIn
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
            end
          end
          object pnlGrids: TPanel
            Left = 100
            Top = 0
            Width = 676
            Height = 183
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object splGrids: TSplitter
              Left = 0
              Top = 82
              Width = 676
              Height = 3
              Cursor = crVSplit
              Align = alTop
            end
            object dbgWorks: TDBGridEh
              Left = 0
              Top = 0
              Width = 676
              Height = 82
              Align = alTop
              Color = clWhite
              DataSource = srcWorks
              DynProps = <>
              Flat = True
              FooterRowCount = 1
              SumList.Active = True
              TabOrder = 0
              TitleParams.HorzLines = True
              Columns = <
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NAME'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #1056#1072#1073#1086#1090#1072
                  Width = 340
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DisplayFormat = '#,##0.#####'
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QNT'
                  Footers = <>
                  Title.Caption = #1050#1086#1083'-'#1074#1086
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DisplayFormat = '#.##'
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'TIME_TOTAL'
                  Footers = <>
                  Title.Caption = #1042#1088#1077#1084#1077#1085#1080
                  Width = 60
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DisplayFormat = '#,##'
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'COST'
                  Footer.DisplayFormat = '#,##'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
                  Width = 80
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NOTICE'
                  Footers = <>
                  Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                  Width = 80
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
            object dbgMaterials: TDBGridEh
              Left = 0
              Top = 85
              Width = 676
              Height = 98
              Align = alClient
              DataSource = srcMaterials
              DynProps = <>
              Flat = True
              FooterRowCount = 1
              PopupMenu = pmGridMat
              SumList.Active = True
              TabOrder = 1
              Columns = <
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NAME'
                  Footer.ValueType = fvtCount
                  Footers = <>
                  Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
                  Width = 261
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'DIMENSION'
                  Footers = <>
                  Title.Caption = #1045#1076'. '#1080#1079#1084'.'
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DisplayFormat = '#,##0.#####'
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'QNT'
                  Footers = <>
                  Title.Caption = #1050#1086#1083'-'#1074#1086
                  Width = 80
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  Checkboxes = True
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NOT_CALC'
                  Footers = <>
                  Title.Caption = #1053#1077' '#1085#1072#1095#1080#1089#1083#1103#1090#1100
                  Width = 38
                end
                item
                  AutoFitColWidth = False
                  CellButtons = <>
                  DisplayFormat = '#,##0.#####'
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'COST'
                  Footer.DisplayFormat = '#,##'
                  Footer.ValueType = fvtSum
                  Footers = <>
                  Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
                  Width = 88
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'NOTICE'
                  Footers = <>
                  Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                  Width = 78
                end
                item
                  CellButtons = <>
                  DynProps = <>
                  EditButtons = <>
                  FieldName = 'WH_NAME'
                  Footers = <>
                  Title.Caption = #1057#1082#1083#1072#1076
                  Width = 52
                end>
              object RowDetailData: TRowDetailPanelControlEh
              end
            end
          end
        end
      end
      object pnlNotice: TPanel
        Left = 0
        Top = 241
        Width = 776
        Height = 68
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object Label6: TLabel
          Left = 0
          Top = 0
          Width = 776
          Height = 13
          Align = alTop
          Caption = #1042#1099#1103#1074#1083'. '#1085#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100
        end
        object dbMemDefect: TDBMemoEh
          Left = 0
          Top = 13
          Width = 776
          Height = 55
          ScrollBars = ssVertical
          Align = alClient
          AutoSize = False
          DataField = 'RQ_DEFECT'
          DataSource = srcRequest
          DynProps = <>
          EditButtons = <>
          TabOrder = 0
          Visible = True
          WantReturns = True
          OnChange = dbMemDefectChange
        end
      end
    end
    object tabFiles: TTabSheet
      Caption = #1060#1086#1090#1086
      ImageIndex = 3
      object spl1: TSplitter
        Left = 371
        Top = 0
        Height = 309
      end
      object dbgPhotos: TDBGridEh
        Left = 26
        Top = 0
        Width = 345
        Height = 309
        Align = alLeft
        AllowedOperations = [alopUpdateEh]
        DataSource = srcPhotos
        DrawGraphicData = True
        DynProps = <>
        Flat = True
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        TabOrder = 1
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
            ReadOnly = True
            Visible = False
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Width = 251
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object imgJPG: TDBImageEh
        Left = 374
        Top = 0
        Width = 402
        Height = 309
        Align = alClient
        DataField = 'JPG'
        DataSource = srcPhotos
        DynProps = <>
        TabOrder = 2
        OnDblClick = imgJPGDblClick
      end
      object tlbFiles: TToolBar
        Left = 0
        Top = 0
        Width = 26
        Height = 309
        Align = alLeft
        ButtonHeight = 23
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object btnAdd: TToolButton
          Left = 0
          Top = 0
          Action = actFileAdd
          ParentShowHint = False
          Wrap = True
          ShowHint = True
        end
        object btnDel: TToolButton
          Left = 0
          Top = 23
          ParentShowHint = False
          ShowHint = True
        end
        object btnView: TToolButton
          Left = 23
          Top = 23
        end
        object btn1: TToolButton
          Left = 46
          Top = 23
          Width = 8
          Caption = 'btn1'
          ImageIndex = 0
          Style = tbsSeparator
        end
      end
    end
    object tabComments: TTabSheet
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1080
      ImageIndex = 4
      object pnlButtons: TPanel
        Left = 0
        Top = 0
        Width = 26
        Height = 309
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          26
          309)
        object btnDel1: TSpeedButton
          Left = 2
          Top = 285
          Width = 22
          Height = 22
          Action = actMSGDel
          Anchors = [akLeft, akBottom]
          Flat = True
          Layout = blGlyphTop
        end
        object btnAdd1: TSpeedButton
          Left = 2
          Top = 3
          Width = 22
          Height = 22
          Action = actMSGAdd
          Flat = True
        end
      end
      object pnlMSG: TPanel
        Left = 26
        Top = 0
        Width = 750
        Height = 309
        Align = alClient
        BevelOuter = bvNone
        Caption = 'pnlMSG'
        TabOrder = 1
        object spl3: TSplitter
          Left = 0
          Top = 104
          Width = 750
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object dbgMsg: TDBGridEh
          Left = 0
          Top = 107
          Width = 750
          Height = 202
          Align = alClient
          ColumnDefValues.ToolTips = True
          Ctl3D = True
          DataSource = srcMSG
          DrawMemoText = True
          DynProps = <>
          Flat = True
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
          ParentCtl3D = False
          RowHeight = 2
          RowLines = 1
          TabOrder = 0
          Columns = <
            item
              AlwaysShowEditButton = True
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'TEXT'
              Footers = <>
              Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
              Title.TitleButton = True
              Width = 499
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'ADDED_BY'
              Footers = <>
              Title.Caption = #1050#1090#1086
              Title.TitleButton = True
              Width = 92
            end
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'ADDED_ON'
              Footers = <>
              Title.Caption = #1050#1086#1075#1076#1072
              Title.TitleButton = True
              Title.SortIndex = 1
              Title.SortMarker = smDownEh
              Width = 108
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pnlMSGText: TPanel
          Left = 0
          Top = 0
          Width = 750
          Height = 104
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object dbmText: TDBMemoEh
            Left = 0
            Top = 0
            Width = 750
            Height = 75
            ScrollBars = ssVertical
            Align = alClient
            AutoSize = False
            DataField = 'TEXT'
            DataSource = srcMSG
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1052#1086#1078#1085#1086' '#1086#1089#1090#1072#1074#1080#1090#1100' '#1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1079#1072#1103#1074#1082#1077' ('#1073#1086#1083#1077#1077' 3 '#1089#1080#1084#1074#1086#1083#1086#1074')'
            TabOrder = 0
            Visible = True
            WantReturns = True
          end
          object pnlMSGButton: TPanel
            Left = 0
            Top = 75
            Width = 750
            Height = 29
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            Visible = False
            DesignSize = (
              750
              29)
            object btnMSGSave: TButton
              Left = 8
              Top = 3
              Width = 528
              Height = 23
              Anchors = [akLeft, akTop, akRight]
              Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
              TabOrder = 0
              OnClick = btnMSGSaveClick
            end
            object btnMSGCancel: TButton
              Left = 551
              Top = 3
              Width = 198
              Height = 23
              Anchors = [akTop, akRight]
              Caption = #1054#1090#1084#1077#1085#1072
              TabOrder = 1
              OnClick = btnMSGCancelClick
            end
          end
        end
      end
    end
  end
  object btnPrint: TButton
    Left = 218
    Top = 531
    Width = 124
    Height = 27
    Action = actPrint
    Anchors = [akLeft, akBottom]
    TabOrder = 3
  end
  object srcExecutor: TDataSource
    AutoEdit = False
    DataSet = dsExecutor
    Left = 520
    Top = 8
  end
  object dsExecutor: TpFIBDataSet
    SelectSQL.Strings = (
      'select re.rq_id,'
      
        'w.surname ||'#39' '#39'|| coalesce(w.firstname,'#39#39')||'#39' '#39'||coalesce(w.midl' +
        'ename,'#39#39') as FIO'
      ', w.Phone_NO'
      ', re.notice'
      'from request_executors re, worker w'
      'where re.exec_id = w.worker_id'
      'and re.rq_id = :RQ_ID'
      'order by 2')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcRequest
    Left = 520
    Top = 16
  end
  object srcRequest: TDataSource
    DataSet = dsRequest
    OnDataChange = srcRequestDataChange
    Left = 590
    Top = 80
  end
  object dsRequest: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE REQUEST'
      'SET '
      '    RQ_TYPE = :RQ_TYPE,'
      '    RQ_CUSTOMER = :RQ_CUSTOMER,'
      '    RQ_CONTENT = :RQ_CONTENT,'
      '    RQ_DEFECT = :RQ_DEFECT,'
      '    RQ_COMPLETED = :RQ_COMPLETED,'
      '    RQ_NOTICE = :RQ_NOTICE,'
      '    RQ_PLAN_DATE = :RQ_PLAN_DATE,'
      '    RQ_TIME_FROM = :RQ_TIME_FROM,'
      '    RQ_TIME_TO = :RQ_TIME_TO,'
      '    HOUSE_ID = :HOUSE_ID,'
      '    FLAT_NO = :FLAT_NO,'
      '    Porch_N = :Porch_N,'
      '    Floor_N = :Floor_N,        '
      '    PHONE = :PHONE,'
      '    RQ_EXEC_TIME = :RQ_EXEC_TIME,'
      '    REQ_RESULT   = :REQ_RESULT,'
      '    GIVE_METHOD  = :GIVE_METHOD,'
      '    DOOR_CODE    = :DOOR_CODE,'
      '    RQTL_ID      = :RQTL_ID,'
      '    Result_id    = :Result_id,'
      '    RECEIPT      = :RECEIPT,'
      '    EXTEXECUTOR  = :EXTEXECUTOR,'
      '    ADD_INFO = :ADD_INFO,'
      '    NODE_ID = :NODE_ID    '
      'WHERE'
      '    RQ_ID = :OLD_RQ_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    REQUEST'
      'WHERE'
      '        RQ_ID = :OLD_RQ_ID'
      '    '
      '')
    InsertSQL.Strings = (
      'INSERT INTO REQUEST('
      '    RQ_ID,'
      '    RQ_TYPE,'
      '    RQ_CUSTOMER,'
      '    RQ_CONTENT,'
      '    RQ_DEFECT,'
      '    RQ_COMPLETED,'
      '    RQ_NOTICE,'
      '    RQ_PLAN_DATE,'
      '    RQ_TIME_FROM,'
      '    RQ_TIME_TO,'
      '    HOUSE_ID,'
      '    FLAT_NO,'
      '    PHONE,'
      '    RQ_EXEC_TIME,'
      '    DOOR_CODE,'
      '    RQTL_ID,'
      '    Result_id,'
      '    RECEIPT,'
      '    EXTEXECUTOR,'
      '    ADD_INFO,'
      '    NODE_ID'
      ')'
      'VALUES('
      '    :RQ_ID,'
      '    :RQ_TYPE,'
      '    :RQ_CUSTOMER,'
      '    :RQ_CONTENT,'
      '    :RQ_DEFECT,'
      '    :RQ_COMPLETED,'
      '    :RQ_NOTICE,'
      '    :RQ_PLAN_DATE,'
      '    :RQ_TIME_FROM,'
      '    :RQ_TIME_TO,'
      '    :HOUSE_ID,'
      '    :FLAT_NO,'
      '    :PHONE,'
      '    :RQ_EXEC_TIME,'
      '    :DOOR_CODE,'
      '    :RQTL_ID,'
      '    :Result_id,'
      '    :RECEIPT,'
      '    :EXTEXECUTOR,'
      '    :ADD_INFO,'
      '    :NODE_ID'
      ')')
    RefreshSQL.Strings = (
      'SELECT r.*, h.street_id'
      
        'FROM REQUEST R left outer join house h on (R.HOUSE_ID = h.HOUSE_' +
        'ID)'
      'WHERE(  R.RQ_ID = :REQUEST'
      '     ) and (     R.RQ_ID = :OLD_RQ_ID'
      '     )'
      '    '
      ''
      '')
    SelectSQL.Strings = (
      'select'
      '    R.Rq_Id'
      '  , R.Rq_Type'
      '  , R.Rq_Customer'
      '  , R.Rq_Content'
      '  , R.Rq_Defect'
      '  , R.Rq_Completed'
      '  , R.Rq_Notice'
      '  , R.Rq_Plan_Date'
      '  , R.Rq_Time_From'
      '  , R.Rq_Time_To'
      '  , R.House_Id'
      '  , R.Flat_No'
      '  , coalesce(r.Porch_N, HF.porch_n) porch_n'
      '  , coalesce(R.Floor_N, hf.floor_n) floor_n'
      '  , R.Phone'
      '  , R.Rq_Exec_Time'
      '  , R.Give_By'
      '  , R.Give_Method'
      '  , R.Req_Result'
      '  , R.Rqtl_Id'
      '  , R.Door_Code'
      '  , R.Cause_Id'
      '  , R.Result_Id'
      '  , R.Receipt'
      '  , R.Extexecutor'
      '  , R.Add_Info'
      '  , R.Added_By'
      '  , R.Added_On'
      '  , R.Edit_By'
      '  , R.Edit_On'
      '  , H.STREET_ID'
      '  , r.NODE_ID'
      '  , coalesce(RT.RT_PRINTFORM, '#39#39') as REPORT'
      '  , R.Parent_Rq'
      '  , cp.Customer_Id PARENT_CUSTOMER'
      
        '  , '#39#1057#1074#1103#1079#1082#1072' '#1089' '#39' || R.Parent_Rq || '#39' '#39' || coalesce(('#39#1082#1074'.'#39' || Cp.F' +
        'lat_No || '#39' '#1083#1080#1094#1077#1074#1086#1081' '#39' || Cp.Account_No || '#39' '#1057#1072#1083#1100#1076#1086' '#39' || Cp.Debt_' +
        'Sum), '#39#39') || p.Rq_Notice PARENT_INFO'
      '  , ch.node_id CHILD_ID'
      '  , ch.rq_id CHILD_RQ_ID'
      '  , '#39'> '#1059#1079#1077#1083' '#39' || n.name CHILD_INFO'
      '  from REQUEST R'
      '       left outer join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)'
      
        '       left outer join HOUSEFLATS HF on (HF.HOUSE_ID = R.house_i' +
        'd and HF.FLAT_NO = R.flat_no)'
      
        '       left outer join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_ID' +
        ')'
      '       left outer join REQUEST P on (p.Rq_Id = r.Parent_Rq)'
      
        '       left outer join customer cp on (cp.Customer_Id = p.Rq_Cus' +
        'tomer)'
      '       left outer join REQUEST ch on (ch.parent_rq = r.rq_id)'
      '       left outer join nodes n on (ch.node_id = n.node_id)'
      ''
      '  where R.RQ_ID = :REQUEST'
      ''
      '    ')
    AutoUpdateOptions.UpdateTableName = 'REQUEST'
    AutoUpdateOptions.KeyFields = 'RQ_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_REQUEST'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoCalcFields = False
    AfterOpen = dsRequestAfterOpen
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 590
    Top = 89
  end
  object srcRequestType: TDataSource
    AutoEdit = False
    DataSet = dsRequestType
    Left = 720
    Top = 8
  end
  object dsRequestType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    W.*'
      '    , coalesce(w.Rt_Color,  '#39'clWindow'#39') as COLOR'
      '  from REQUEST_TYPES W'
      '  where ('
      '    (coalesce(w.RT_DELETED, 0) = 0)'
      '    and'
      '    ('
      '      (coalesce(w.Rt_Hc_Need, 0) = 0)'
      '      or'
      '      ('
      '        (w.Rt_Hc_Need = 1)'
      '        and'
      '        exists(select h.House_Id'
      '                     from house h'
      '                    where h.House_Id = :house_id'
      '                      and h.In_Date <= current_date)'
      '      )'
      '    )'
      '  )'
      '  or'
      '  (w.Rt_Id = coalesce(:RT_ID, -999))'
      ''
      '  order by coalesce(w.rt_default, 0) desc, W.RT_NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 720
    Top = 14
  end
  object ActionList1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 142
    Top = 474
    object actExecutors: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100'/'#1080#1079#1084#1077#1085#1080#1090#1100' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103' (F5)'
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100'/'#1080#1079#1084#1077#1085#1080#1090#1100' '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103' '#1079#1072#1103#1074#1082#1080
      OnExecute = actExecutorsExecute
    end
    object actMaterials: TAction
      Caption = #1057#1087#1080#1089#1072#1085#1080#1077' (F6)'
      Hint = #1057#1087#1080#1089#1072#1085#1080#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      OnExecute = actMaterialsExecute
    end
    object actFindCustomer: TAction
      Caption = #1053#1072#1081#1090#1080' '#1072#1073#1086#1085#1077#1085#1090#1072' (F7)'
      ShortCut = 118
      OnExecute = actFindCustomerExecute
    end
    object actReqForAdres: TAction
      Caption = #1047#1072#1103#1074#1082#1080' '#1087#1086' '#1072#1076#1088#1077#1089#1091
      Hint = #1053#1077#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1077' '#1079#1072#1103#1074#1082#1080' '#1087#1086' '#1101#1090#1086#1084#1091' '#1072#1076#1088#1077#1089#1091
      OnExecute = actReqForAdresExecute
    end
    object actWorks: TAction
      Caption = #1056#1072#1073#1086#1090#1099' (F5)'
      OnExecute = actWorksExecute
    end
    object actSave: TAction
      Caption = 'actSave'
      ShortCut = 16397
      OnExecute = actSaveExecute
    end
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      ShortCut = 16464
      OnExecute = actPrintExecute
    end
    object actMatIn: TAction
      Caption = #1042#1086#1079#1074#1088#1072#1090' (F8)'
      Hint = #1042#1086#1079#1074#1088#1072#1090' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074
      ShortCut = 119
      OnExecute = actMatInExecute
    end
    object actSMS: TAction
      Caption = #1042#1099#1089#1083#1072#1090#1100' SMS'
      Hint = #1042#1099#1089#1083#1072#1090#1100' SMS '#1080#1089#1087#1086#1083#1085#1080#1090#1077#1083#1103#1084
      OnExecute = actSMSExecute
    end
    object actExAddressEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1072#1076#1088#1077#1089' '#1079#1072#1103#1074#1082#1080
      ShortCut = 113
      OnExecute = actExAddressEditExecute
    end
    object actFileAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1092#1072#1081#1083
      ImageIndex = 2
      OnExecute = actFileAddExecute
    end
    object actMSGAdd: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      ImageIndex = 2
      OnExecute = actMSGAddExecute
    end
    object actMSGDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      ImageIndex = 3
      OnExecute = actMSGDelExecute
    end
    object actReqDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1103#1074#1082#1091
      OnExecute = actReqDelExecute
    end
  end
  object srcErrors: TDataSource
    DataSet = dsErrors
    Left = 661
    Top = 86
  end
  object dsErrors: TpFIBDataSet
    SelectSQL.Strings = (
      'select rt.RQTL_ID, rt.rq_content, rt.ADD_FIELD'
      'from request_templates rt'
      'where rt.rq_type = :rt_id'
      'order by rt.rq_content'
      '')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    DataSource = srcRequestType
    Left = 661
    Top = 95
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 586
    Top = 12
  end
  object dsStreets: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT s.street_id, s.street_short,s.street_name, a.area_name'
      'FROM STREET s left outer join area a on (a.area_id = s.area_id)'
      'ORDER BY STREET_NAME, a.area_name')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 586
    Top = 19
  end
  object srcHouse: TDataSource
    DataSet = dsHouses
    Left = 730
    Top = 84
  end
  object dsHouses: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    H.HOUSE_ID,'
      '    H.STREET_ID,'
      '    H.HOUSE_NO,'
      '    H.Q_FLAT,'
      '    wa.name||'#39' '#39'||wg.name||'#39' '#39'||'
      '    cast('
      
        '    coalesce('#39'('#39'||(select list(w.surname) from worker w where (w' +
        '.team = wg.name and w.working = 1))||'#39')'#39','#39#39')'
      '    ||coalesce('#39' '#39'||he.he_name,'#39#39')'
      '    as varchar(500)) as warea'
      'FROM'
      '    HOUSE H'
      '    left outer join workgroups wg on (wg.wg_id = h.wg_id)'
      '    left outer join workarea wa on (wa.wa_id = wg.wa_id)'
      '    left outer join headend he on ( h.headend_id = he.he_id )'
      'where h.street_id = :street_id'
      'order by h.HOUSE_NO')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcStreet
    Left = 730
    Top = 95
  end
  object dsRequests: TpFIBDataSet
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'select'
      '    R.*'
      '  , c.ACCOUNT_NO'
      '  , '#39'0'#39' as CUST_CODE'
      '  , c.SURNAME || '#39' '#39' || c.INITIALS as FIO'
      '  , RT.O_Description as REPORT'
      '  , rt.O_Name as Rt_Name'
      '  ,'
      '    (select'
      
        '         s.street_short || s.STREET_NAME || '#39' '#39' || h.HOUSE_NO ||' +
        ' '#39', '#39' ||(coalesce(r.flat_no, '#39#39'))'
      '       from STREET s, HOUSE h'
      '       where S.STREET_ID = h.STREET_ID'
      '             and h.house_id = r.house_id) as adres'
      '  ,'
      '    case R.Req_Result'
      '      when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      '      when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      '      when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      '      when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      '    end as Res_text,'
      '    rt.O_Numericfield as DAYS'
      '  , coalesce(r.Rq_Defect, r.Rq_Content) as trouble'
      ''
      '  from REQUEST R'
      '       inner join objects RT on (R.RQ_TYPE = RT.O_Id)'
      
        '       left outer join CUSTOMER C on (R.RQ_CUSTOMER = C.CUSTOMER' +
        '_ID)'
      '  where RQ_ID = :REQUEST_ID')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 520
    Top = 88
  end
  object frxDBrequests: TfrxDBDataset
    UserName = #1047#1040#1071#1042#1050#1048
    CloseDataSource = False
    FieldAliases.Strings = (
      'RQ_ID='#1053#1054#1052#1045#1056
      'RQ_TYPE=RQ_TYPE'
      'RQ_DATE='#1044#1040#1058#1040'_'#1055#1056#1048#1045#1052#1040
      'RQ_CUSTOMER=RQ_CUSTOMER'
      'RQ_CONTENT='#1047#1040#1071#1042#1051#1045#1053#1040#1071'_'#1053#1045#1048#1057#1055#1056
      'RQ_DEFECT='#1042#1067#1071#1042#1051#1045#1053#1040#1071'_'#1053#1045#1048#1057#1055#1056
      'RQ_COMPLETED=RQ_COMPLETED'
      'RQ_NOTICE='#1055#1056#1048#1052#1045#1063#1040#1053#1048#1045
      'RQ_PLAN_DATE='#1053#1040'_'#1044#1040#1058#1059
      'RQ_TIME_FROM='#1042#1056#1045#1052#1071'_'#1057
      'RQ_TIME_TO='#1042#1056#1045#1052#1071'_'#1055#1054
      'EDIT_BY=EDIT_BY'
      'EDIT_ON=EDIT_ON'
      'HOUSE_ID=HOUSE_ID'
      'FLAT_NO=FLAT_NO'
      'PHONE='#1058#1045#1051#1045#1060#1054#1053
      'ADDED_BY=ADDED_BY'
      'ADDED_ON=ADDED_ON'
      'RQ_EXEC_TIME='#1042#1056#1045#1052#1071'_'#1048#1057#1055#1054#1051#1053
      'GIVE_BY=GIVE_BY'
      'GIVE_METHOD=GIVE_METHOD'
      'REQ_RESULT=REQ_RESULT'
      'ACCOUNT_NO='#1051#1048#1062#1045#1042#1054#1049'_'#1040#1041#1054#1053#1045#1053#1058#1040
      'CUST_CODE='#1050#1054#1044'_'#1040#1041#1054#1053#1045#1053#1058#1040
      'FIO='#1060#1048#1054'_'#1040#1041#1054#1053#1045#1053#1058#1040
      'REPORT=REPORT'
      'RT_NAME=RT_NAME'
      'ADRES='#1040#1044#1056#1045#1057
      'RES_TEXT=RES_TEXT'
      'DAYS=DAYS'
      'TROUBLE=TROUBLE')
    OpenDataSource = False
    DataSet = dsRequests
    BCDToCurrency = False
    Left = 444
    Top = 98
  end
  object srcResult: TDataSource
    DataSet = dsResult
    Left = 651
    Top = 12
  end
  object dsResult: TpFIBDataSet
    DeleteSQL.Strings = (
      'update REQUEST_RESULTS'
      'set deleted = 1'
      'WHERE'
      '        RR_ID = :OLD_RR_ID'
      '    ')
    RefreshSQL.Strings = (
      'select RR_ID, NAME, FINISHED, NOTICE'
      'from REQUEST_RESULTS rr'
      'where(  RT_ID = :RT_ID'
      'and deleted = 0'
      '     ) and (     RR.RR_ID = :OLD_RR_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select RR_ID, NAME, FINISHED, NOTICE'
      'from REQUEST_RESULTS rr'
      'where RT_ID = :rt_id and deleted = 0'
      'order by NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    DataSource = srcRequestType
    Left = 651
    Top = 21
  end
  object frxReport: TfrxReport
    Version = '2021.2.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42090.768293935190000000
    ReportOptions.LastChange = 42090.768293935190000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnUserFunction = frxReportUserFunction
    Left = 444
    Top = 50
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object dsWorks: TpFIBDataSet
    DeleteSQL.Strings = (
      
        'execute procedure REQUEST_WORKS_IUD(:OLD_RQ_ID, :OLD_ID, null, n' +
        'ull, null, null, 2)')
    SelectSQL.Strings = (
      'select'
      '    m.W_ID ID'
      '  , w.name'
      '  , w.notice'
      '  , m.w_quant QNT'
      '  , round(m.w_time * m.w_quant, 2) time_total'
      '  , coalesce(coalesce(m.w_cost, w.w_cost) * m.w_quant, 0) COST'
      '  , m.rq_id'
      '  from WORKS w'
      '       inner join request_works m on (w.w_id = m.w_id)'
      '  where m.rq_id = :RQ_ID'
      '  order by w.name')
    AutoUpdateOptions.UpdateTableName = 'REQUEST'
    AutoUpdateOptions.KeyFields = 'RQ_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_REQUEST'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoCalcFields = False
    AfterOpen = dsWorksAfterOpen
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcRequest
    Left = 310
    Top = 297
  end
  object srcWorks: TDataSource
    AutoEdit = False
    DataSet = dsWorks
    Left = 374
    Top = 296
  end
  object srcMaterials: TDataSource
    AutoEdit = False
    DataSet = dsMaterials
    Left = 382
    Top = 384
  end
  object dsMaterials: TpFIBDataSet
    DeleteSQL.Strings = (
      
        'execute block (OLD_RM_ID UID = :OLD_RM_ID, OLD_MT D_Integer = :O' +
        'LD_MT)'
      'as begin'
      'if (OLD_MT = 1) then'
      
        '  execute procedure REQUEST_MATERIALS_RETURN_IUD(:OLD_RM_ID, nul' +
        'l, null, null, null, null, 2) ;'
      'else'
      
        '  execute procedure Request_Materials_Iud(:OLD_RM_ID, null, null' +
        ', null, null, null, null, null,  2);  '
      'end')
    SelectSQL.Strings = (
      'select'
      
        '    m.M_ID ID, m.NAME, rM.RM_NOTICE notice, m.DIMENSION, rM.RM_Q' +
        'UANT QNT'
      
        '    , rM.RM_QUANT * rm.rm_cost as COST, coalesce(rm.NOT_CALC, 0)' +
        ' NOT_CALC'
      '    , o.O_Name WH_NAME, 0 as MT, rm.Rm_Id'
      '    from MATERIALS m'
      '        inner join REQUEST_MATERIALS rM on (M.M_ID = rM.M_ID)'
      
        '        left outer join objects o on (o.O_Id = rm.Wh_Id and o.O_' +
        'Type = 10)'
      '    where rM.RQ_ID = :RQ_ID'
      'union all'
      'select'
      
        '    m.M_ID ID, m.NAME||'#39' ( '#1042#1086#1079#1074#1088#1072#1090' )'#39', rM.Notice notice, m.DEMEN' +
        'SION, rM.Quant*(-1) QNT'
      '    , rM.Quant*(-1) * m.Cost as COST, 0 as NOT_CALC '
      '    , o.O_Name WH_NAME, 1 as MT, rm.ID Rm_Id'
      '    from MATERIALS m'
      
        '        inner join Request_Materials_Return rM on (M.M_ID = rM.M' +
        '_ID)'
      
        '        left outer join objects o on (o.O_Id = rm.Wh_Id and o.O_' +
        'Type = 10)'
      '    where rM.RQ_ID = :RQ_ID'
      'order by 2'
      '    ')
    AutoUpdateOptions.UpdateTableName = 'REQUEST'
    AutoUpdateOptions.KeyFields = 'RQ_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_REQUEST'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoCalcFields = False
    AfterOpen = dsMaterialsAfterOpen
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcRequest
    Left = 302
    Top = 385
  end
  object mmRequest: TMainMenu
    Left = 432
    Top = 65534
    object N1: TMenuItem
      Caption = #1047#1072#1103#1074#1082#1072
      GroupIndex = 2
      object N2: TMenuItem
        Action = actExAddressEdit
      end
      object miN3: TMenuItem
        Caption = '-'
      end
      object miReqDel: TMenuItem
        Action = actReqDel
      end
    end
  end
  object cnError: TCnErrorProvider
    DoubleBuffer = False
    Left = 228
    Top = 468
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 85
    Top = 403
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 131
    Top = 407
  end
  object srcPhotos: TDataSource
    DataSet = dsPhotos
    Left = 558
    Top = 472
  end
  object dsPhotos: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE REQUEST_PHOTOS'
      'SET '
      '    NOTICE = :NOTICE'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    REQUEST_PHOTOS'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      'p.Id, p.Rq_Id, p.Jpg, p.Notice'
      'from Request_Photos p'
      'where p.Rq_Id = :RQ_ID'
      'order by 1')
    AutoUpdateOptions.UpdateTableName = 'REQUEST'
    AutoUpdateOptions.KeyFields = 'RQ_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_REQUEST'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoCalcFields = False
    AfterOpen = dsWorksAfterOpen
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcRequest
    Left = 494
    Top = 473
  end
  object pmGridMat: TPopupMenu
    Left = 480
    Top = 387
    object miDelMat: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      OnClick = miDelMatClick
    end
  end
  object pmGridWork: TPopupMenu
    Left = 480
    Top = 299
    object miDelWork: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      OnClick = miDelWorkClick
    end
  end
  object dsMSG: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE REQUEST_MSG'
      'SET '
      '    RQ_ID = :RQ_ID,'
      '    TEXT = :TEXT'
      'WHERE'
      '    ID = :OLD_ID'
      '    ')
    DeleteSQL.Strings = (
      'update REQUEST_MSG t'
      'set t.DELETED = 1'
      'where t.ID = :OLD_ID'
      '      and t.Added_By = current_user'
      ''
      '  ')
    InsertSQL.Strings = (
      'INSERT INTO REQUEST_MSG('
      '    ID,'
      '    RQ_ID,'
      '    TEXT'
      ')'
      'VALUES('
      '    :ID,'
      '    :RQ_ID,'
      '    :TEXT'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    m.Id'
      '  , m.Rq_Id'
      '  , m.Text'
      '  , coalesce(w.Surname, m.Added_By) FIO'
      '  , m.Added_By'
      '  , m.Added_On'
      '  from Request_Msg m'
      '       left outer join Worker w on (m.Added_By = w.Ibname)'
      '  where(  (deleted = 0)'
      '        and (m.Rq_Id = :Rq_Id)'
      '     ) and (     M.ID = :OLD_ID'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    m.Id'
      '  , m.Rq_Id'
      '  , m.Text'
      '  , coalesce(w.Surname, m.Added_By) FIO'
      '  , m.Added_By'
      '  , m.Added_On'
      '  from Request_Msg m'
      '       left outer join Worker w on (m.Added_By = w.Ibname)'
      '  where (deleted = 0)'
      '        and (m.Rq_Id = :RQ_ID)'
      '  order by m.Added_On desc')
    AutoUpdateOptions.UpdateTableName = 'REQUEST_MSG'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcRequest
    Left = 328
    Top = 472
    oFetchAll = True
  end
  object srcMSG: TDataSource
    DataSet = dsMSG
    Left = 384
    Top = 472
  end
  object PropStorageEh: TPropStorageEh
    Section = 'Request'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'PageControl.tabExecute.pnlNotice.<P>.Height')
    OnReadProp = PropStorageEhReadProp
    Left = 674
    Top = 152
  end
end