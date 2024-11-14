object SubAreaViewForm: TSubAreaViewForm
  Left = 378
  Top = 361
  ActiveControl = dbeName
  BorderStyle = bsDialog
  Caption = #1056#1072#1081#1086#1085
  ClientHeight = 215
  ClientWidth = 398
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 84
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 94
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object Label1: TLabel
    Left = 8
    Top = 51
    Width = 110
    Height = 13
    Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inline OkCancelFrame: TOkCancelFrame
    Left = 0
    Top = 178
    Width = 398
    Height = 37
    Align = alBottom
    TabOrder = 3
    TabStop = True
    inherited bbOk: TBitBtn
      Left = 139
      Top = 7
      Width = 159
      Enabled = False
      OnClick = OkCancelFramebbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 315
      Top = 7
    end
  end
  object dbeName: TDBEditEh
    Left = 8
    Top = 24
    Width = 379
    Height = 21
    DataField = 'SUBAREA_NAME'
    DataSource = srcSubArea
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnChange = dbeNameChange
  end
  object DBMemo1: TDBMemoEh
    Left = 8
    Top = 110
    Width = 379
    Height = 58
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcSubArea
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Visible = True
    WantReturns = True
  end
  object dblArea: TDBLookupComboboxEh
    Left = 8
    Top = 67
    Width = 379
    Height = 21
    DynProps = <>
    DataField = 'AREA_ID'
    DataSource = srcSubArea
    DropDownBox.AutoDrop = True
    EditButtons = <
      item
        ShortCut = 45
        Style = ebsPlusEh
        OnClick = dblAreaEditButtons0Click
      end>
    KeyField = 'AREA_ID'
    ListField = 'AREA_NAME'
    ListSource = srcAreas
    ShowHint = True
    TabOrder = 1
    Visible = True
    OnChange = dblAreaChange
  end
  object trSRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 320
    Top = 56
  end
  object trSWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 320
    Top = 104
  end
  object dsSubArea: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SUBAREA'
      'SET '
      '    AREA_ID = :AREA_ID,'
      '    SUBAREA_NAME = :SUBAREA_NAME,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SUBAREA'
      'WHERE'
      '        SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SUBAREA('
      '    SUBAREA_ID,'
      '    AREA_ID,'
      '    SUBAREA_NAME,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :SUBAREA_ID,'
      '    :AREA_ID,'
      '    :SUBAREA_NAME,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM SUBAREA '
      'where( '
      ' SUBAREA_ID = :SUBAREA_ID'
      '     ) and (     SUBAREA.SUBAREA_ID = :OLD_SUBAREA_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM SUBAREA '
      'where'
      ' SUBAREA_ID = :SUBAREA_ID')
    Transaction = trSRead
    Database = dmMain.dbTV
    UpdateTransaction = trSWrite
    AutoCommit = True
    Left = 56
    Top = 128
  end
  object srcSubArea: TDataSource
    AutoEdit = False
    DataSet = dsSubArea
    Left = 88
    Top = 112
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 248
    Top = 48
  end
  object dsAreas: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SUBAREA'
      'SET '
      '    AREA_ID = :AREA_ID,'
      '    SUBAREA_ID = :SUBAREA_ID,'
      '    SUBAREA_NAME = :SUBAREA_NAME'
      'WHERE'
      '    SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SUBAREA'
      'WHERE'
      '        SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SUBAREA('
      '    AREA_ID,'
      '    SUBAREA_ID,'
      '    SUBAREA_NAME'
      ')'
      'VALUES('
      '    :AREA_ID,'
      '    :SUBAREA_ID,'
      '    :SUBAREA_NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM SUBAREA'
      'where(  area_ID = :AREA_ID'
      'and subarea_id <> 0'
      '     ) and (     SUBAREA.SUBAREA_ID = :OLD_SUBAREA_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM AREA'
      'order by AREA_NAME')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 240
    Top = 120
  end
  object srcAreas: TDataSource
    AutoEdit = False
    DataSet = dsAreas
    Left = 192
    Top = 120
  end
end
