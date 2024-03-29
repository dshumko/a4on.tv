object apgEQGAttributes: TapgEQGAttributes
  Left = 0
  Top = 0
  Caption = #1040#1090#1088#1080#1073#1091#1090#1099
  ClientHeight = 208
  ClientWidth = 567
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgCustAttr: TDBGridEh
    Left = 26
    Top = 0
    Width = 541
    Height = 208
    Align = alClient
    AllowedOperations = []
    DataSource = srcAttributes
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    TabOrder = 0
    TitleParams.MultiTitle = True
    OnDblClick = dbgCustAttrDblClick
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1040#1090#1088#1080#1073#1091#1090
        Width = 116
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'AVALUE'
        Footers = <>
        Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
        Width = 155
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 212
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 208
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      26
      208)
    object btnDel: TSpeedButton
      Left = 2
      Top = 185
      Width = 22
      Height = 22
      Action = actDel
      Anchors = [akLeft, akBottom]
      Flat = True
      Layout = blGlyphTop
    end
    object btnAdd: TSpeedButton
      Left = 2
      Top = 3
      Width = 22
      Height = 22
      Action = actAdd
      Flat = True
    end
    object btnEdit: TSpeedButton
      Left = 2
      Top = 31
      Width = 22
      Height = 22
      Action = actEdit
      Flat = True
    end
  end
  object dsAttributes: TpFIBDataSet
    DeleteSQL.Strings = (
      'update'
      '    ATTRIBUTE'
      'set ADELETED = 1    '
      'WHERE'
      '        TYPE_ID = :OLD_TYPE_ID'
      '    and OBJECT_ID = :OLD_OBJECT_ID'
      '    and AID = :OLD_AID'
      '    ')
    RefreshSQL.Strings = (
      'SELECT A.O_NAME, CA.*'
      'FROM attribute CA'
      
        '   INNER JOIN OBJECTS A ON (A.O_ID = CA.Aid and a.O_Type = ca.Ty' +
        'pe_Id)'
      'where CA.TYPE_ID = :OLD_TYPE_ID'
      '    and CA.OBJECT_ID = :OLD_O_ID'
      '    and CA.AID = :OLD_AID'
      ''
      '    ')
    SelectSQL.Strings = (
      'SELECT A.O_NAME, CA.Object_Id O_ID,  CA.*'
      'FROM attribute CA'
      
        '   INNER JOIN OBJECTS A ON (A.O_ID = CA.Aid and a.O_Type = ca.Ty' +
        'pe_Id)'
      'where CA.Object_Id = :O_Id and ca.Type_Id = 69 and ADELETED = 0')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 67
    Top = 157
  end
  object srcAttributes: TDataSource
    DataSet = dsAttributes
    OnDataChange = srcAttributesDataChange
    Left = 183
    Top = 155
  end
  object ActList: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 206
    Top = 37
    object actAdd: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 2
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = actDelExecute
    end
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
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 371
    Top = 42
  end
end
