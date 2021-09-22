object EditNFileForm: TEditNFileForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1060#1072#1081#1083' '#1091#1079#1083#1072
  ClientHeight = 236
  ClientWidth = 397
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
  OnKeyDown = FormKeyDown
  DesignSize = (
    397
    236)
  PixelsPerInch = 96
  TextHeight = 13
  ShowHint = True
  object Label1: TLabel
    Left = 8
    Top = 88
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object lblFile: TLabel
    Left = 8
    Top = 12
    Width = 53
    Height = 13
    Caption = #1058#1080#1087' '#1092#1072#1081#1083#1072
  end
  object Label2: TLabel
    Left = 8
    Top = 40
    Width = 73
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object lblFileCh: TLabel
    Left = 8
    Top = 67
    Width = 26
    Height = 13
    Caption = #1060#1072#1081#1083
  end
  object dbluFileType: TDBLookupComboboxEh
    Left = 87
    Top = 9
    Width = 302
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'NF_TYPE'
    DataSource = srcCustFile
    EmptyDataInfo.Text = #1058#1080#1087' '#1092#1072#1081#1083#1072
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcFiles
    TabOrder = 0
    Visible = True
  end
  object memNotice: TDBMemoEh
    Left = 8
    Top = 104
    Width = 381
    Height = 95
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcCustFile
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077
    TabOrder = 3
    Visible = True
    WantReturns = True
  end
  object edtNAME: TDBEditEh
    Left = 87
    Top = 37
    Width = 302
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'NAME'
    DataSource = srcCustFile
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' / '#1085#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    TabOrder = 1
    Visible = True
  end
  object btnOk: TBitBtn
    Left = 67
    Top = 205
    Width = 241
    Height = 26
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 314
    Top = 205
    Width = 75
    Height = 26
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
  object edtFILE: TDBEditEh
    Left = 87
    Top = 64
    Width = 302
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'FILENAME'
    DataSource = srcCustFile
    DynProps = <>
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edtFILEEditButtons0Click
      end>
    EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1092#1072#1081#1083
    ReadOnly = True
    TabOrder = 2
    Visible = True
  end
  object srcFiles: TDataSource
    AutoEdit = False
    DataSet = dsFiles
    Left = 316
    Top = 140
  end
  object dsFiles: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED'
      'FROM OBJECTS'
      'WHERE O_TYPE = 40 AND O_DELETED = 0'
      'order BY O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 226
    Top = 138
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 163
    Top = 136
  end
  object dsFile: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE NODE_FILES'
      'SET '
      '    NF_ID = :NF_ID,'
      '    NAME = :NAME,'
      '    NF_TYPE = :NF_TYPE,'
      '    NOTICE = :NOTICE,'
      '    NODE_ID = :NODE_ID,'
      '    FILENAME = :FILENAME'
      'WHERE'
      '    NF_ID = :OLD_NF_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    NODE_FILES'
      'WHERE'
      '        NF_ID = :OLD_NF_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO NODE_FILES('
      '    NF_ID,'
      '    NAME,'
      '    NF_TYPE,'
      '    NOTICE,'
      '    NODE_ID,'
      '    FILENAME'
      ')'
      'VALUES('
      '    :NF_ID,'
      '    :NAME,'
      '    :NF_TYPE,'
      '    :NOTICE,'
      '    :NODE_ID,'
      '    :FILENAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT '
      '  T.O_NAME'
      '  , CF.NF_Id'
      '  , cf.Name'
      '  , cf.NF_Type'
      '  , cf.Notice'
      '  , cf.NODE_ID'
      '  , cf.FILENAME'
      'FROM NODE_FILES CF'
      
        '   INNER JOIN OBJECTS T ON (CF.NF_Type = T.O_ID and T.O_TYPE = 4' +
        '0)'
      'where(  CF.NODE_Id = :NODE_ID'
      '     ) and (     CF.NF_ID = :OLD_NF_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT '
      '  T.O_NAME'
      '  , CF.NF_Id'
      '  , cf.Name'
      '  , cf.NF_Type'
      '  , cf.Notice'
      '  , cf.NODE_ID'
      '  , cf.FILENAME'
      'FROM NODE_FILES CF'
      
        '   INNER JOIN OBJECTS T ON (CF.NF_Type = T.O_ID and T.O_TYPE = 4' +
        '0)'
      'where CF.NF_Id = :NF_ID')
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 28
    Top = 113
  end
  object srcCustFile: TDataSource
    AutoEdit = False
    DataSet = dsFile
    Left = 88
    Top = 121
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '*.*'
    Left = 208
    Top = 88
  end
  object qUpdate: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'update NODE_FILES set Content = :Content where NF_Id = :NF_Id')
    Left = 296
    Top = 120
  end
end
