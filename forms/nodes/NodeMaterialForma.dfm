object NodeMaterialForm: TNodeMaterialForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1085#1080#1077'/'#1084#1072#1090#1077#1088#1080#1072#1083' '#1091#1079#1083#1072
  ClientHeight = 234
  ClientWidth = 401
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
  OnKeyUp = FormKeyUp
  DesignSize = (
    401
    234)
  PixelsPerInch = 96
  TextHeight = 13
  object lblAttribute: TLabel
    Left = 8
    Top = 12
    Width = 96
    Height = 13
    Caption = #1054#1073#1086#1088'-'#1080#1077'/'#1052#1072#1090#1077#1088#1080#1072#1083
  end
  object Label1: TLabel
    Left = 8
    Top = 39
    Width = 84
    Height = 13
    Caption = #1057#1077#1088#1080#1081#1085#1099#1081' '#1085#1086#1084#1077#1088
  end
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 199
    Width = 401
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
      Left = 67
      Width = 245
      Anchors = [akLeft, akRight, akBottom]
      ModalResult = 0
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 318
    end
  end
  object dbluMat: TDBLookupComboboxEh
    Left = 112
    Top = 8
    Width = 281
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    EmptyDataInfo.Text = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' / '#1084#1072#1090#1077#1088#1080#1072#1083' '#1091#1079#1083#1072
    EditButtons = <>
    KeyField = 'M_ID'
    ListField = 'NAME'
    ListSource = srcMaterials
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object memNotice: TDBMemoEh
    Left = 8
    Top = 62
    Width = 385
    Height = 131
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 2
    Visible = True
    WantReturns = True
  end
  object edtSN: TDBEditEh
    Left = 112
    Top = 35
    Width = 281
    Height = 21
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1057#1077#1088#1080#1081#1085#1099#1081' / '#1091#1085#1080#1082#1072#1083#1100#1085#1099#1081' '#1085#1086#1084#1077#1088
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 75
    Top = 80
  end
  object dsMaterials: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '*'
      'from GET_MAT_FOR_NODE(:NODE_ID)'
      'order by NAME')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 154
    Top = 90
  end
  object srcMaterials: TDataSource
    AutoEdit = False
    DataSet = dsMaterials
    Left = 244
    Top = 92
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
    Left = 331
    Top = 42
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait')
    TPBMode = tpbDefault
    Left = 331
    Top = 98
  end
end
