object ReqMatBaybackForm: TReqMatBaybackForm
  Left = 519
  Top = 314
  Caption = #1042#1099#1082#1091#1087' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
  ClientHeight = 198
  ClientWidth = 356
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 167
    Width = 356
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      356
      31)
    object bbOk: TBitBtn
      Left = 64
      Top = 1
      Width = 167
      Height = 27
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akRight, akBottom]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      NumGlyphs = 2
      TabOrder = 0
      OnClick = bbOkClick
    end
    object bbCancel: TBitBtn
      Left = 237
      Top = 1
      Width = 115
      Height = 27
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 356
    Height = 167
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      356
      167)
    object lbl1: TLabel
      Left = 4
      Top = 35
      Width = 60
      Height = 13
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    end
    object lbl2: TLabel
      Left = 156
      Top = 35
      Width = 67
      Height = 13
      Caption = #1062#1077#1085#1072' '#1074#1099#1082#1091#1087#1072
    end
    object ednCost: TDBNumberEditEh
      Left = 237
      Top = 32
      Width = 115
      Height = 21
      DynProps = <>
      EmptyDataInfo.Text = #1062#1077#1085#1072' '#1074#1099#1082#1091#1087#1072
      EditButtons = <>
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object ednQuant: TDBNumberEditEh
      Left = 80
      Top = 32
      Width = 59
      Height = 21
      DynProps = <>
      EmptyDataInfo.Text = #1050#1086#1083'-'#1074#1086
      Enabled = False
      EditButtons = <>
      ShowHint = True
      TabOrder = 1
      Value = 1.000000000000000000
      Visible = True
    end
    object mmoNotice: TDBMemoEh
      Left = 4
      Top = 59
      Width = 348
      Height = 105
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 3
      Visible = True
      WantReturns = True
    end
    object lcbEQ: TDBLookupComboboxEh
      Left = 4
      Top = 5
      Width = 348
      Height = 21
      DynProps = <>
      DataField = ''
      EmptyDataInfo.Text = #1063#1090#1086' '#1074#1099
      EditButtons = <>
      ListSource = srcDataSource
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
  end
  object srcDataSource: TDataSource
    DataSet = dsReqMaterials
    Left = 267
    Top = 93
  end
  object dsReqMaterials: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    InsertSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'select'
      '    M_Id'
      '  , Name'
      '  , Dimension'
      '  , Wh_Name'
      '  , Wh_Id'
      '  , Quant'
      '  , M_Number'
      '  , Rq_Id'
      '  , Id'
      '  , Description'
      '  , Serial'
      '  , Cost'
      '  , (Quant * Cost) Itog'
      '  from Get_Mat_Take_In(:Rq_Id, -1, :WH_FLTR)'
      'order by Name, wh_name   ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 178
    Top = 82
  end
  object PropStorage: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 113
    Top = 97
  end
  object cnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 48
    Top = 104
  end
end
