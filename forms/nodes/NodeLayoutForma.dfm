object NodeLayoutForm: TNodeLayoutForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1050#1086#1084#1087#1086#1085#1086#1074#1082#1072' '#1091#1079#1083#1072
  ClientHeight = 331
  ClientWidth = 484
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
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  DesignSize = (
    484
    331)
  PixelsPerInch = 96
  TextHeight = 13
  object lblAttribute: TLabel
    Left = 5
    Top = 12
    Width = 49
    Height = 13
    Caption = #1058#1080#1087' '#1091#1089#1083#1091#1075
  end
  object lbl1: TLabel
    Left = 5
    Top = 65
    Width = 92
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
  end
  object lbl11: TLabel
    Left = 5
    Top = 39
    Width = 92
    Height = 13
    Caption = #1050#1086#1083'-'#1074#1086' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
  end
  object lcbSrvType: TDBLookupComboboxEh
    Left = 112
    Top = 9
    Width = 367
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    EmptyDataInfo.Text = #1058#1080#1087' '#1091#1089#1083#1091#1075
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcDevType
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object memNotice: TDBMemoEh
    Left = 5
    Top = 226
    Width = 474
    Height = 73
    Anchors = [akLeft, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1082' '#1082#1086#1084#1087#1072#1085#1086#1074#1082#1077
    ShowHint = True
    TabOrder = 9
    Visible = True
    WantReturns = True
  end
  object ednCount: TDBNumberEditEh
    Left = 112
    Top = 62
    Width = 121
    Height = 21
    Hint = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1085#1072' '#1091#1079#1077#1083'. '#1077#1089#1083#1080' =-1, '#1090#1086' '#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072
    DynProps = <>
    EmptyDataInfo.Text = #1082#1086#1083'-'#1074#1086' '#1086#1073#1086#1088#1091#1076'/'#1084#1072#1090'-'#1083#1072
    EditButtons = <>
    ShowHint = True
    TabOrder = 3
    Visible = True
  end
  object ednСustCnt: TDBNumberEditEh
    Left = 112
    Top = 36
    Width = 121
    Height = 21
    Hint = 
      #1072#1082#1090'. '#1072#1073#1086#1085#1077#1085#1090#1086#1074' '#1085#1072' '#1090#1080#1087'. '#1091#1089#1083#1091#1075#1080', '#1077#1089#1083#1080' =-1, '#1090#1086' '#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1072 +
      ' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
    DecimalPlaces = 0
    DynProps = <>
    EmptyDataInfo.Text = #1072#1082#1090'. '#1072#1073#1086#1085#1077#1085#1090#1086#1074
    EditButtons = <>
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object dbgMat: TDBGridEh
    Left = 5
    Top = 115
    Width = 474
    Height = 106
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = srcMat
    DynProps = <>
    TabOrder = 8
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'M_NAME'
        Footers = <>
        Title.Caption = #1054#1076#1080#1085' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1084#1072#1090#1077#1088#1080#1072#1083'/'#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 443
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object chkReq: TDBCheckBoxEh
    Left = 5
    Top = 93
    Width = 228
    Height = 17
    Caption = #1052#1072#1090#1077#1088#1080#1072#1083' '#1080#1079' '#1089#1087#1080#1089#1082#1072' '#1086#1073#1103#1079#1072#1090#1077#1083#1077#1085
    Checked = True
    DynProps = <>
    State = cbChecked
    TabOrder = 5
  end
  object btnAdd: TBitBtn
    Left = 285
    Top = 89
    Width = 94
    Height = 25
    Action = actAdd
    Anchors = [akTop, akRight]
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 6
  end
  object btnDel: TBitBtn
    Left = 385
    Top = 89
    Width = 94
    Height = 25
    Action = actDel
    Anchors = [akTop, akRight]
    Caption = #1059#1076#1072#1083#1080#1090#1100
    TabOrder = 7
  end
  object btnOk: TBitBtn
    Left = 5
    Top = 305
    Width = 374
    Height = 23
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    NumGlyphs = 2
    TabOrder = 10
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 385
    Top = 305
    Width = 94
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 11
  end
  object chkCustUnlum: TDBCheckBoxEh
    Left = 241
    Top = 38
    Width = 228
    Height = 17
    Caption = #1085#1077' '#1089#1084#1086#1090#1088#1077#1090#1100' '#1085#1072' '#1082#1086#1083'-'#1074#1086' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
    DynProps = <>
    TabOrder = 2
    OnClick = chkCustUnlumClick
  end
  object chkMatUnlum: TDBCheckBoxEh
    Left = 241
    Top = 64
    Width = 228
    Height = 17
    Caption = #1085#1077' '#1089#1084#1086#1090#1088#1077#1090#1100' '#1085#1072' '#1082#1086#1083'-'#1074#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
    DynProps = <>
    TabOrder = 4
    OnClick = chkMatUnlumClick
  end
  object srcDevType: TDataSource
    AutoEdit = False
    DataSet = dsSrvType
    Left = 180
    Top = 228
  end
  object dsSrvType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    *'
      '  from (select'
      '            O_ID'
      '          , O_NAME'
      '          from OBJECTS o'
      '          where O_TYPE = 15'
      '                and O_DELETED = 0'
      '        union all'
      '        select'
      '            -1 O_ID'
      '          , '#39' '#1073#1077#1079' '#1091#1095#1077#1090#1072' '#1090#1080#1087#1072' '#39' O_NAME'
      '          from rdb$database)'
      '  order by O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    Left = 114
    Top = 226
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 51
    Top = 224
  end
  object mtMat: TMemTableEh
    Params = <>
    Left = 96
    Top = 128
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object M_NAME: TMTStringDataFieldEh
          FieldName = 'M_NAME'
          StringDataType = fdtStringEh
          DisplayWidth = 100
          Size = 255
        end
        object M_ID: TMTNumericDataFieldEh
          FieldName = 'M_ID'
          NumericDataType = fdtIntegerEh
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
  object srcMat: TDataSource
    AutoEdit = False
    DataSet = mtMat
    Left = 160
    Top = 144
  end
  object actlst1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 240
    Top = 176
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 2
      ShortCut = 45
      OnExecute = actAddExecute
    end
    object actDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      ShortCut = 16430
      OnExecute = actDelExecute
    end
  end
end
