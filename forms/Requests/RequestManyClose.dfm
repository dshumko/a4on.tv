object RequestManyCloseForm: TRequestManyCloseForm
  Left = 0
  Top = 0
  Caption = #1047#1072#1082#1088#1099#1090#1080#1077' '#1079#1072#1103#1074#1086#1082
  ClientHeight = 376
  ClientWidth = 849
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  inline frm1: TOkCancelFrame
    Left = 0
    Top = 341
    Width = 849
    Height = 35
    Align = alBottom
    TabOrder = 3
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Width = 100
      Caption = #1047#1072#1082#1088#1099#1090#1100' '#1079#1072#1103#1074#1082#1080
    end
  end
  object pnlExecTime: TPanel
    Left = 0
    Top = 0
    Width = 849
    Height = 131
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbl1: TLabel
      Left = 8
      Top = 34
      Width = 127
      Height = 13
      Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077' ('#1086#1082#1086#1085#1095#1072#1085#1080#1077')'
    end
    object lbl2: TLabel
      Left = 8
      Top = 80
      Width = 118
      Height = 13
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
    end
    object lblRes: TLabel
      Left = 8
      Top = 57
      Width = 118
      Height = 13
      Caption = #1054#1090#1084#1077#1090#1082#1072' '#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1080
    end
    object lbl4: TLabel
      Left = 8
      Top = 11
      Width = 58
      Height = 13
      Caption = #1058#1080#1087' '#1079#1072#1103#1074#1082#1080
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 8
      Top = 103
      Width = 55
      Height = 13
      Caption = #1050#1074#1080#1090#1072#1085#1094#1080#1103
    end
    object deEndExecDateTime: TDBDateTimeEditEh
      Left = 137
      Top = 31
      Width = 186
      Height = 21
      Hint = #1042#1088#1077#1084#1103' '#1085#1072#1095#1072#1083#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1079#1072#1103#1074#1082#1080
      EditButtons = <>
      TabOrder = 1
      Visible = True
      EditFormat = 'DD/MM/YY HH:NN'
    end
    object cbbResultExec: TDBComboBoxEh
      Left = 137
      Top = 77
      Width = 186
      Height = 21
      EditButtons = <>
      Items.Strings = (
        #1042#1099#1087#1086#1083#1085#1077#1085#1072
        #1054#1090#1084#1077#1085#1077#1085#1072' '#1072#1073#1086#1085#1077#1085#1090#1086#1084
        #1053#1077#1074#1086#1079#1084#1086#1078#1085#1086' '#1074#1099#1087#1086#1083#1085#1080#1090#1100)
      KeyItems.Strings = (
        '2'
        '3'
        '4')
      TabOrder = 3
      Visible = True
    end
    object luResult: TDBLookupComboboxEh
      Left = 137
      Top = 54
      Width = 451
      Height = 21
      DropDownBox.AutoDrop = True
      EditButtons = <>
      KeyField = 'RR_ID'
      ListField = 'NAME'
      ListSource = srcResult
      TabOrder = 2
      Visible = True
    end
    object luType: TDBLookupComboboxEh
      Left = 137
      Top = 8
      Width = 451
      Height = 21
      EditButtons = <>
      KeyField = 'RT_ID'
      ListField = 'RT_NAME'
      ListSource = srcRequestType
      TabOrder = 0
      Visible = True
    end
    object edReceipt: TDBEditEh
      Left = 137
      Top = 100
      Width = 186
      Height = 21
      EditButtons = <>
      TabOrder = 4
      Visible = True
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 273
    Width = 849
    Height = 68
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object lbl3: TLabel
      Left = 0
      Top = 0
      Width = 849
      Height = 13
      Align = alTop
      Caption = #1042#1099#1103#1074#1083'. '#1085#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100
    end
    object mmoMemDefect: TDBMemoEh
      Left = 0
      Top = 13
      Width = 849
      Height = 55
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 131
    Width = 849
    Height = 142
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlRWorks: TPanel
      Left = 0
      Top = 0
      Width = 323
      Height = 142
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'pnlRWorks'
      TabOrder = 0
      object dbgWorks: TDBGridEh
        Left = 0
        Top = 36
        Width = 323
        Height = 106
        TabStop = False
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = srcWorks
        EditActions = [geaCopyEh, geaSelectAllEh]
        Flat = True
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        IndicatorOptions = [gioShowRowIndicatorEh]
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete]
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        RowDetailPanel.Color = clBtnFace
        SortLocal = True
        STFilter.Local = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1056#1072#1073#1086#1090#1072
            Title.TitleButton = True
            Width = 212
          end
          item
            AutoFitColWidth = False
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
            EditButtons = <>
            FieldName = 'W_TIME'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #1053'/'#1063
            Title.TitleButton = True
            Width = 32
          end
          item
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
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
        Width = 323
        Height = 36
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object btnAddWork: TButton
          Left = 1
          Top = 6
          Width = 121
          Height = 25
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
          TabOrder = 0
          TabStop = False
          OnClick = btnAddWorkClick
        end
        object btnDelWork: TButton
          Left = 128
          Top = 6
          Width = 123
          Height = 25
          Caption = #1059#1076#1072#1083#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
          TabOrder = 1
          TabStop = False
          OnClick = btnDelWorkClick
        end
      end
    end
  end
  object dsWorks: TMemTableEh
    FieldDefs = <
      item
        Name = 'W_ID'
        DataType = ftInteger
        Precision = 15
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'W_TIME'
        DataType = ftBCD
        Precision = 15
        Size = 4
      end
      item
        Name = 'NOTICE'
        DataType = ftString
        Size = 500
      end
      item
        Name = 'QUANT'
        DataType = ftFloat
        Precision = 15
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 753
    Top = 122
    object intgrfldWorksW_ID: TIntegerField
      FieldName = 'W_ID'
    end
    object sfWorksNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object bcdfldWorksW_TIME: TBCDField
      FieldName = 'W_TIME'
      Size = 0
    end
    object sfWorksNOTICE: TStringField
      FieldName = 'NOTICE'
      Size = 500
    end
    object fltfldWorksQUANT: TFloatField
      FieldName = 'QUANT'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object W_ID: TMTNumericDataFieldEh
          FieldName = 'W_ID'
          NumericDataType = fdtIntegerEh
          currency = False
          Precision = 15
        end
        object NAME: TMTStringDataFieldEh
          FieldName = 'NAME'
          StringDataType = fdtStringEh
          Size = 255
        end
        object W_TIME: TMTNumericDataFieldEh
          FieldName = 'W_TIME'
          NumericDataType = fdtBCDEh
          currency = False
          Precision = 15
        end
        object NOTICE: TMTStringDataFieldEh
          FieldName = 'NOTICE'
          StringDataType = fdtStringEh
          Size = 500
        end
        object QUANT: TMTNumericDataFieldEh
          FieldName = 'QUANT'
          NumericDataType = fdtFloatEh
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object srcWorks: TDataSource
    DataSet = dsWorks
    Left = 639
    Top = 128
  end
  object dsRequestType: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      ' W.*'
      'FROM REQUEST_TYPES W'
      'order BY coalesce(w.rt_default,0) desc, W.RT_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 747
    Top = 8
  end
  object srcRequestType: TDataSource
    AutoEdit = False
    DataSet = dsRequestType
    Left = 643
    Top = 4
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
      'where RT_ID = :RQ_TYPE'
      'and deleted = 0'
      'order by NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcRequestType
    Left = 752
    Top = 61
  end
  object srcResult: TDataSource
    DataSet = dsResult
    Left = 640
    Top = 62
  end
end
