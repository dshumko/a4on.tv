object frmSelectFilter: TfrmSelectFilter
  Left = 299
  Top = 226
  ActiveControl = cbFilter
  Caption = #1042#1099#1073#1086#1088' '#1092#1080#1083#1100#1090#1088#1072
  ClientHeight = 85
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poOwnerFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 85
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      392
      85)
    object Label1: TLabel
      Left = 7
      Top = 19
      Width = 48
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object Panel2: TPanel
      Left = 0
      Top = 48
      Width = 392
      Height = 37
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        392
        37)
      object bbOk: TBitBtn
        Left = 61
        Top = 8
        Width = 241
        Height = 25
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1042#1099#1073#1088#1072#1090#1100
        Default = True
        ModalResult = 1
        NumGlyphs = 2
        TabOrder = 0
      end
      object bbCancel: TBitBtn
        Left = 308
        Top = 8
        Width = 78
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = #1054#1090#1084#1077#1085#1072
        ModalResult = 2
        TabOrder = 1
      end
      object btnDel: TBitBtn
        Left = 7
        Top = 8
        Width = 18
        Height = 25
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1099#1073#1088#1072#1085#1085#1099#1081' '#1092#1080#1083#1100#1090#1088
        Anchors = [akRight, akBottom]
        Caption = 'D'
        TabOrder = 2
        OnClick = btnDelClick
      end
    end
    object cbFilter: TDBLookupComboboxEh
      Left = 61
      Top = 16
      Width = 325
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.ListFieldNames = 'LETTERTYPEDESCR'
      DropDownBox.ListSource = srcFilter
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1092#1080#1083#1100#1090#1088' '#1072#1073#1086#1085#1077#1085#1090#1086#1074
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcFilter
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnClick = cbFilterClick
      OnEnter = cbFilterEnter
    end
  end
  object dsFilter: TpFIBDataSet
    DeleteSQL.Strings = (
      'execute block ('
      '    filter_type_id D_Integer = :filter_type_id,'
      '    OLD_O_ID       D_integer = :OLD_O_ID,'
      '    OLD_Bl_Type    D_integer = :OLD_Bl_Type)'
      'as'
      'declare variable OTID integer;'
      'begin'
      '  delete from Blob_Tbl'
      '      where Bl_Type = :OLD_Bl_Type'
      '            and Owner_Id = :OLD_O_ID;'
      '  delete from OBJECTS'
      '      where O_ID = :OLD_O_ID'
      '            and O_Type = :filter_type_id;'
      'end'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    o.O_Id'
      '  , o.O_Name'
      '  , b.Bl_Type'
      '  , b.Bl_Body as jsFilter'
      '  from objects o'
      
        '    inner join Blob_Tbl b on ( b.Owner_Id = o.O_Id and b.Bl_Type' +
        ' = :BT )'
      '  where o.O_Type = :filter_type_id'
      '  order by o.O_Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 144
    Top = 16
  end
  object srcFilter: TDataSource
    AutoEdit = False
    DataSet = dsFilter
    Left = 240
    Top = 16
  end
end
