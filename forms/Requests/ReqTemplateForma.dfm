object ReqTemplateForm: TReqTemplateForm
  Left = 0
  Top = 0
  Caption = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1079#1086#1074#1072
  ClientHeight = 393
  ClientWidth = 782
  Color = clBtnFace
  DoubleBuffered = True
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 404
    Top = 0
    Height = 352
  end
  object pnlB: TPanel
    Left = 0
    Top = 352
    Width = 782
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      782
      41)
    object btnOk: TBitBtn
      Left = 8
      Top = 8
      Width = 694
      Height = 27
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TBitBtn
      Left = 718
      Top = 8
      Width = 56
      Height = 27
      Anchors = [akLeft, akTop, akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object pnlRW: TPanel
    Left = 407
    Top = 0
    Width = 375
    Height = 352
    Align = alClient
    TabOrder = 1
    object pgc: TPageControl
      Left = 1
      Top = 1
      Width = 373
      Height = 350
      ActivePage = tsWorks
      Align = alClient
      TabOrder = 0
      object tsWorks: TTabSheet
        Caption = #1056#1072#1073#1086#1090#1099
        ImageIndex = 1
        object pnlRWorks: TPanel
          Left = 0
          Top = 0
          Width = 365
          Height = 322
          Align = alClient
          BevelOuter = bvNone
          Caption = 'pnlRWorks'
          TabOrder = 0
          object dbgWorks: TDBGridEh
            Left = 0
            Top = 30
            Width = 365
            Height = 292
            TabStop = False
            Align = alClient
            DataSource = srcWorks
            DynProps = <>
            EditActions = [geaCopyEh, geaSelectAllEh]
            Flat = True
            FooterParams.Color = clWindow
            GridLineParams.VertEmptySpaceStyle = dessNonEh
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
            OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
            SearchPanel.Enabled = True
            SortLocal = True
            STFilter.Local = True
            TabOrder = 1
            Columns = <
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'NAME'
                Footers = <>
                ReadOnly = True
                Title.Caption = #1056#1072#1073#1086#1090#1072
                Title.TitleButton = True
                Width = 142
              end
              item
                AutoFitColWidth = False
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'QUANT'
                Footers = <>
                Title.Alignment = taCenter
                Title.Caption = #1050#1086#1083'-'#1074#1086
                Title.TitleButton = True
                Width = 42
              end
              item
                AutoFitColWidth = False
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'W_TIME'
                Footers = <>
                ReadOnly = True
                Title.Alignment = taCenter
                Title.Caption = #1053'/'#1063
                Title.TitleButton = True
                Width = 32
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'W_COST'
                Footers = <>
                ReadOnly = True
                Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
                Title.TitleButton = True
                Width = 63
              end
              item
                CellButtons = <>
                DynProps = <>
                EditButtons = <>
                FieldName = 'NOTICE'
                Footers = <>
                ReadOnly = True
                Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                Title.TitleButton = True
                Width = 149
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object pnlBW: TPanel
            Left = 0
            Top = 0
            Width = 365
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              365
              30)
            object btnAddWork: TButton
              Left = 11
              Top = 5
              Width = 121
              Height = 21
              Action = actAddWork
              TabOrder = 0
              TabStop = False
            end
            object btnDelWork: TButton
              Left = 236
              Top = 3
              Width = 123
              Height = 21
              Action = actDelWork
              Anchors = [akTop, akRight]
              TabOrder = 1
              TabStop = False
            end
          end
        end
      end
      object tsAdd: TTabSheet
        Caption = #1055#1088#1086#1095#1077#1077
        DesignSize = (
          365
          322)
        object chkFlatsResult: TDBCheckBoxEh
          Left = 3
          Top = 5
          Width = 224
          Height = 17
          Hint = 
            #1042#1086#1079#1084#1086#1078#1085#1086#1089#1090#1100' '#1091#1082#1072#1079#1072#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1076#1083#1103' '#1082#1074#1072#1088#1090#1080#1088#1099' '#1087#1088#1080' '#1079#1072#1082#1088#1099#1090#1080#1080' '#1079#1072#1103#1074#1082#1080' '#1085 +
            #1072' '#1091#1079#1077#1083
          Caption = #1044#1083#1103' '#1091#1079#1083#1072' '#1087#1086#1082#1074#1072#1088#1090#1080#1088#1085#1099#1081' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
          DataField = 'FLATS_NEED'
          DynProps = <>
          Flat = True
          TabOrder = 0
        end
        object mmoFlatsResult: TDBMemoEh
          Left = 3
          Top = 28
          Width = 359
          Height = 291
          ScrollBars = ssVertical
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = False
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1042#1072#1088#1080#1085#1090#1099' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074' '#1076#1083#1103' '#1082#1074#1072#1088#1090#1080#1088
          ShowHint = True
          TabOrder = 1
          Visible = True
          WantReturns = True
        end
      end
      object tsSMS: TTabSheet
        Caption = 'SMS'
        ImageIndex = 2
        DesignSize = (
          365
          322)
        object lbl5: TLabel
          Left = 3
          Top = 3
          Width = 223
          Height = 13
          Caption = #1058#1077#1082#1089#1090' SMS '#1072#1073#1086#1085#1077#1085#1090#1091' '#1087#1086#1089#1083#1077' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1103#1074#1082#1080
        end
        object lbl4: TLabel
          Left = 1
          Top = 142
          Width = 225
          Height = 13
          Caption = #1058#1077#1082#1089#1090' SMS '#1072#1073#1086#1085#1077#1085#1090#1091' '#1087#1086#1089#1083#1077' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1079#1072#1103#1074#1082#1080
        end
        object mmoCreate: TDBMemoEh
          Left = 1
          Top = 19
          Width = 361
          Height = 117
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          DataField = 'SMS_CREATE'
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1058#1077#1082#1089#1090' SMS '#1072#1073#1086#1085#1077#1085#1090#1091' '#1087#1086#1089#1083#1077' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1079#1072#1103#1074#1082#1080
          ShowHint = True
          TabOrder = 0
          Visible = True
          WantReturns = True
        end
        object mmoClose: TDBMemoEh
          Left = 1
          Top = 162
          Width = 361
          Height = 157
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = False
          DataField = 'SMS_CLOSE'
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1058#1077#1082#1089#1090' SMS '#1072#1073#1086#1085#1077#1085#1090#1091' '#1087#1086#1089#1083#1077' '#1079#1072#1082#1088#1099#1090#1080#1103' '#1079#1072#1103#1074#1082#1080
          ShowHint = True
          TabOrder = 1
          Visible = True
          WantReturns = True
        end
      end
    end
  end
  object pnlL: TPanel
    Left = 0
    Top = 0
    Width = 404
    Height = 352
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      404
      352)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 64
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
    end
    object lbl1: TLabel
      Left = 8
      Top = 34
      Width = 55
      Height = 13
      Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072
    end
    object lblRecreate: TLabel
      Left = 8
      Top = 118
      Width = 148
      Height = 13
      Caption = #1055#1077#1088#1077#1089#1086#1079#1076#1072#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1095#1077#1088#1077#1079
    end
    object edContent: TDBEditEh
      Left = 78
      Top = 5
      Width = 323
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'RQ_CONTENT'
      DataSource = srcRQTL
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1079#1086#1074#1072
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object luAnalysGrp: TDBLookupComboboxEh
      Left = 78
      Top = 31
      Width = 323
      Height = 21
      Hint = #1043#1088#1091#1087#1087#1072' '#1072#1085#1072#1083#1080#1090#1080#1082#1080' ('#1074#1086#1079#1084#1086#1078#1085#1086' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1075#1088#1091#1087#1087#1077')'
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'ANALYSE_ID'
      DataSource = srcRQTL
      EmptyDataInfo.Text = #1043#1088#1091#1087#1087#1072' '#1072#1085#1072#1083#1080#1090#1080#1082#1080
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcANALYS
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object mmoAddons: TDBMemoEh
      Left = 4
      Top = 142
      Width = 397
      Height = 210
      Hint = 
        #1057#1087#1080#1089#1086#1082' '#1079#1085#1072#1095#1077#1085#1080#1081' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1075#1086' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1075#1086' '#1087#1086#1083#1103' '#1087#1088#1080' '#1086#1092#1086#1088#1084#1083#1077#1085#1080 +
        #1080' '#1079#1072#1103#1074#1082#1080#13#10#1054#1076#1085#1072' '#1089#1090#1088#1086#1082#1072' - '#1086#1076#1085#1086' '#1079#1085#1072#1095#1077#1085#1080#1077
      ScrollBars = ssBoth
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1044#1086#1087'. '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1076#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1088#1080' '#1087#1088#1080#1077#1084#1077' '#1079#1072#1103#1074#1082#1080
      ShowHint = True
      TabOrder = 2
      Visible = True
      WantReturns = True
    end
    object chkNeedPhoto: TDBCheckBoxEh
      Left = 8
      Top = 61
      Width = 224
      Height = 17
      Alignment = taLeftJustify
      Caption = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1092#1086#1090#1086' '#1087#1088#1080' '#1079#1072#1082#1088#1099#1090#1080#1080' '#1079#1072#1103#1074#1082#1080
      DataField = 'NEED_PHOTO'
      DataSource = srcRQTL
      DynProps = <>
      Flat = True
      TabOrder = 3
    end
    object chkNEED_NODE_RQ: TDBCheckBoxEh
      Left = 8
      Top = 89
      Width = 224
      Height = 17
      Hint = 
        #1053#1091#1078#1085#1086' '#1083#1080' '#1089#1086#1079#1076#1072#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1085#1072' '#1091#1079#1077#1083' '#1087#1088#1080' '#1089#1086#1079#1076#1072#1085#1080#1080' '#1079#1072#1103#1074#1082#1080' '#1085#1072' '#1072#1073#1086#1085#1077#1085#1090 +
        #1072
      Alignment = taLeftJustify
      Caption = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1089#1086#1079#1076#1072#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1085#1072' '#1091#1079#1077#1083
      DataField = 'NEED_NODE_RQ'
      DataSource = srcRQTL
      DynProps = <>
      Flat = True
      TabOrder = 4
    end
    object edtDaysRecreate: TDBNumberEditEh
      Left = 181
      Top = 115
      Width = 51
      Height = 21
      Hint = #1059#1082#1072#1078#1080#1090#1077' '#1082#1086#1083'-'#1074#1086' '#1076#1077#1085#1081', '#1077#1089#1083#1080' '#1087#1091#1089#1090#1086', '#1090#1086' '#1085#1077' '#1089#1086#1079#1076#1072#1074#1072#1090#1100
      DataField = 'RECREATE_DAYS'
      DataSource = srcRQTL
      DecimalPlaces = 0
      DynProps = <>
      EmptyDataInfo.Text = #1076#1085#1077#1081
      EditButtons = <>
      ShowHint = True
      TabOrder = 5
      Visible = True
    end
    object cbbRecreateType: TDBLookupComboboxEh
      Left = 238
      Top = 115
      Width = 163
      Height = 21
      Hint = #1058#1080#1087' '#1085#1086#1074#1086#1081' '#1079#1072#1103#1074#1082#1080' '#1080#1083#1080' '#1090#1072#1082#1086#1081' '#1078#1077' '#1077#1089#1083#1080' '#1086#1089#1090#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1099#1084
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'RECREATE_TYPE'
      DataSource = srcRQTL
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1100' '#1090#1080#1087' '#1079#1072#1103#1074#1082#1080' '#1080#1083#1080' '#1090#1072#1082#1086#1081' '#1078#1077
      EditButtons = <>
      KeyField = 'ID'
      ListField = 'NAME'
      ListSource = srcTypes
      ShowHint = True
      TabOrder = 6
      Visible = True
      OnDropDownBoxGetCellParams = cbbRecreateTypeDropDownBoxGetCellParams
    end
    object btnClear: TButton
      Left = 311
      Top = 85
      Width = 90
      Height = 25
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1094#1074#1077#1090' '#1092#1086#1085#1072' '#1090#1080#1087#1072' '#1079#1072#1103#1074#1082#1080
      Anchors = [akTop, akRight]
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1086#1085
      TabOrder = 7
      TabStop = False
      OnClick = btnClearClick
    end
    object btnColor: TBitBtn
      Left = 311
      Top = 57
      Width = 90
      Height = 25
      Hint = #1042#1099#1073#1088#1072#1090#1100' '#1094#1074#1077#1090' '#1092#1086#1085#1072' '#1076#1083#1103' '#1076#1072#1085#1085#1086#1075#1086' '#1090#1080#1087#1072' '#1079#1072#1103#1074#1086#1082
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1086#1085
      TabOrder = 8
      TabStop = False
      OnClick = btnColorClick
    end
  end
  object mtWorks: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'W_ID'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'NAME'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'W_TIME'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'NOTICE'
        DataType = ftWideString
        Size = 500
      end
      item
        Name = 'QUANT'
        DataType = ftFloat
        Precision = 2
      end
      item
        Name = 'W_COST'
        DataType = ftFloat
        Precision = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 608
    Top = 247
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object W_ID: TMTNumericDataFieldEh
          FieldName = 'W_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object NAME: TMTStringDataFieldEh
          FieldName = 'NAME'
          StringDataType = fdtWideStringEh
          DisplayWidth = 100
          Size = 255
        end
        object W_TIME: TMTNumericDataFieldEh
          FieldName = 'W_TIME'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayWidth = 16
          currency = False
          Precision = 15
        end
        object NOTICE: TMTStringDataFieldEh
          FieldName = 'NOTICE'
          StringDataType = fdtWideStringEh
          DisplayWidth = 100
          Size = 500
        end
        object QUANT: TMTNumericDataFieldEh
          FieldName = 'QUANT'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayWidth = 10
          currency = False
          Precision = 2
        end
        object W_COST: TMTNumericDataFieldEh
          FieldName = 'W_COST'
          NumericDataType = fdtFloatEh
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
  object srcWorks: TDataSource
    DataSet = mtWorks
    Left = 607
    Top = 204
  end
  object actlst: TActionList
    Left = 503
    Top = 125
    object actAddWork: TAction
      Caption = '&'#1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1073#1086#1090#1091' '#1074' '#1079#1072#1103#1074#1082#1091
      SecondaryShortCuts.Strings = (
        'Alt+'#1044
        'Alt+'#1076
        'Alt+L'
        'Alt+l')
      ShortCut = 45
      OnExecute = actAddWorkExecute
    end
    object actDelWork: TAction
      Caption = '&'#1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1073#1086#1090#1091' '#1080#1079' '#1079#1072#1103#1074#1082#1080
      SecondaryShortCuts.Strings = (
        'Alt+'#1059
        'Alt+'#1091
        'Alt+e'
        'Alt+E')
      ShortCut = 16430
      OnExecute = actDelWorkExecute
    end
  end
  object srcRQTL: TDataSource
    DataSet = dsRQTL
    Left = 76
    Top = 173
  end
  object dsRQTL: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE REQUEST_TEMPLATES'
      'SET '
      '    RQ_TYPE = :RQ_TYPE'
      '    , RQ_CONTENT = :RQ_CONTENT'
      '    , RQ_MAXTIME = :RQ_MAXTIME'
      '    , RQ_COLOR = :RQ_COLOR'
      '    , ADD_WORK  = :ADD_WORK'
      '    , ANALYSE_ID = :ANALYSE_ID'
      '    , ADD_FIELD = :ADD_FIELD'
      '    , NEED_PHOTO = :NEED_PHOTO'
      '    , NEED_NODE_RQ = :NEED_NODE_RQ '
      '    , RECREATE_DAYS = :RECREATE_DAYS'
      '    , RECREATE_TYPE = :RECREATE_TYPE'
      '    , SMS_CREATE = :SMS_CREATE'
      '    , SMS_CLOSE = :SMS_CLOSE '
      '    , FLATS_NEED = :FLATS_NEED'
      '    , FLATS_RESULT = :FLATS_RESULT'
      '    , WORKS = :WORKS'
      'WHERE'
      '    RQTL_ID = :OLD_RQTL_ID'
      '    ')
    DeleteSQL.Strings = (
      'update REQUEST_TEMPLATES'
      'set deleted = 1'
      'WHERE'
      '        RQTL_ID = :OLD_RQTL_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO REQUEST_TEMPLATES('
      '    RQTL_ID'
      '    , RQ_TYPE'
      '    , RQ_CONTENT'
      '    , RQ_MAXTIME'
      '    , RQ_COLOR'
      '    , ANALYSE_ID'
      '    , ADD_WORK'
      '    , ADD_FIELD'
      '    , NEED_PHOTO'
      '    , NEED_NODE_RQ'
      '    , RECREATE_DAYS'
      '    , RECREATE_TYPE'
      '    , SMS_CREATE'
      '    , SMS_CLOSE'
      '    , FLATS_NEED'
      '    , FLATS_RESULT'
      '    , WORKS'
      ')'
      'VALUES('
      '    :RQTL_ID'
      '    , :RQ_TYPE'
      '    , :RQ_CONTENT'
      '    , :RQ_MAXTIME'
      '    , :RQ_COLOR'
      '    , :ANALYSE_ID'
      '    , :ADD_WORK'
      '    , :ADD_FIELD'
      '    , :NEED_PHOTO'
      '    , :NEED_NODE_RQ'
      '    , :RECREATE_DAYS'
      '    , :RECREATE_TYPE '
      '    , :SMS_CREATE'
      '    , :SMS_CLOSE'
      '    , :FLATS_NEED'
      '    , :FLATS_RESULT'
      '    , :WORKS             '
      ')')
    RefreshSQL.Strings = (
      'select *'
      'from REQUEST_TEMPLATES RTL'
      'where(  rtl.rqtl_id = :RQTL_ID'
      '     ) and (     RTL.RQTL_ID = :OLD_RQTL_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select *'
      'from REQUEST_TEMPLATES RTL'
      'where rtl.rqtl_id = :RQTL_ID')
    AfterOpen = dsRQTLAfterOpen
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 26
    Top = 172
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
    Left = 32
    Top = 256
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
    Left = 123
    Top = 201
  end
  object dsANALYS: TpFIBDataSet
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
    Left = 81
    Top = 254
  end
  object srcANALYS: TDataSource
    DataSet = dsANALYS
    Left = 146
    Top = 255
  end
  object dsAllWorks: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    w.W_Id'
      '  , w.Name'
      '  , w.W_Time'
      
        '  , coalesce(iif(w.As_Service is null, w.W_Cost, iif(coalesce(s.' +
        'Srv_Type_Id, 2) = 2, 0,'
      '    (select'
      '         t.tarif_sum'
      '       from tarif t'
      '       where t.service_id = s.service_id'
      
        '             and current_date between t.date_from and t.date_to)' +
        ')), 0) W_COST'
      '  from works w'
      
        '       left outer join services s on (s.service_id = w.as_servic' +
        'e)'
      '  where w.Deleted = 0'
      '  order by w.name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 260
    Top = 201
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 27
    Top = 320
  end
  object srcTypes: TDataSource
    AutoEdit = False
    DataSet = dsTypes
    Left = 264
    Top = 264
  end
  object dsTypes: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    tl.Rqtl_Id as ID'
      '  , tl.Rq_Content||'#39'. ('#39'||rt.Rt_Name||'#39')'#39' NAME'
      '  , coalesce(tl.Rq_Color, '#39'clWindow'#39') as COLOR'
      '  from REQUEST_TYPEs rt'
      '    inner join Request_Templates tl on (rt.Rt_Id = tl.Rq_Type)'
      
        '  where coalesce(rt.Rt_Deleted, 0) = 0 and coalesce(tl.Deleted, ' +
        '0) = 0'
      '  order by 2')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 208
    Top = 264
  end
  object dlgColor: TColorDialog
    Left = 192
    Top = 216
  end
  object pmSMS: TPopupMenu
    Left = 336
    Top = 160
    object miNN1: TMenuItem
      Caption = #1053#1086#1084#1077#1088' '#1079#1072#1103#1074#1082#1080' [NN]'
      Hint = '[NN]'
      OnClick = miTEXTClick
    end
    object miPD1: TMenuItem
      Caption = #1055#1083#1072#1085#1086#1074#1072#1103' '#1076#1072#1090#1072' [PD]'
      Hint = '[PD]'
      OnClick = miTEXTClick
    end
    object miTEXT: TMenuItem
      Caption = #1058#1077#1082#1089#1090' '#1079#1072#1103#1074#1082#1080' [TEXT]'
      Hint = '[TEXT]'
      OnClick = miTEXTClick
    end
  end
  object PropStorageEh: TPropStorageEh
    Section = 'BID_TMPLT'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.Top'
      '<P>.Width'
      'pnlL.<P>.Width')
    Left = 346
    Top = 224
  end
end
