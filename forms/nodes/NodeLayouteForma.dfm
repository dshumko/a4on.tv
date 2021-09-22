object NodeLayouteForm: TNodeLayouteForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1050#1086#1084#1087#1086#1085#1086#1074#1082#1072' '#1091#1079#1083#1072
  ClientHeight = 194
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
    194)
  PixelsPerInch = 96
  TextHeight = 13
  object lblAttribute: TLabel
    Left = 8
    Top = 12
    Width = 79
    Height = 13
    Caption = #1058#1080#1087' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1072
  end
  object lbl1: TLabel
    Left = 8
    Top = 39
    Width = 60
    Height = 13
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
  end
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 159
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
  object dbluDevType: TDBLookupComboboxEh
    Left = 112
    Top = 9
    Width = 281
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = ''
    EmptyDataInfo.Text = #1050#1072#1082#1086#1081' '#1090#1080#1087' '#1091#1089#1090#1088#1086#1081#1089#1090#1074
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcDevType
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object memNotice: TDBMemoEh
    Left = 8
    Top = 63
    Width = 385
    Height = 90
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
  object ednCount: TDBNumberEditEh
    Left = 112
    Top = 36
    Width = 121
    Height = 21
    DynProps = <>
    EmptyDataInfo.Text = #1082#1086#1083'-'#1074#1086' '#1091#1089#1090#1088#1086#1081#1089#1090#1074
    EditButtons = <>
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object srcDevType: TDataSource
    AutoEdit = False
    DataSet = dsDevType
    Left = 244
    Top = 92
  end
  object dsDevType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , O_DIMENSION'
      '  from OBJECTS o'
      '  where O_TYPE = 48'
      '        and O_DELETED = 0'
      '        and ((o.O_ID = :M_TYPE)'
      '          or (not exists(select'
      '                            l.M_Type'
      '                          from Node_Layout l'
      '                          where l.M_Type = o.O_Id'
      '                                and l.Node_Id = :NODE_ID)))'
      '  order by O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    Left = 154
    Top = 90
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 75
    Top = 88
  end
end
