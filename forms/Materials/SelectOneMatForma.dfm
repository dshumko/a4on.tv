object SelectMaterialForm: TSelectMaterialForm
  Left = 0
  Top = 0
  ActiveControl = lcbEquipment
  BorderIcons = [biSystemMenu]
  Caption = #1042#1099#1073#1086#1088' '#1084#1072#1090#1077#1088#1080#1072#1083#1072'/'#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
  ClientHeight = 96
  ClientWidth = 443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object pnlB: TPanel
    Left = 0
    Top = 63
    Width = 443
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      443
      33)
    object btnCancel: TBitBtn
      Left = 314
      Top = 1
      Width = 122
      Height = 26
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TBitBtn
      Left = 8
      Top = 1
      Width = 300
      Height = 26
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOkClick
    end
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 443
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      443
      57)
    object lbl1: TLabel
      Left = 8
      Top = 19
      Width = 50
      Height = 13
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083
    end
    object lblDim: TLabel
      Left = 207
      Top = 73
      Width = 3
      Height = 13
    end
    object lcbEquipment: TDBLookupComboboxEh
      Left = 80
      Top = 16
      Width = 356
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.Columns = <
        item
          FieldName = 'NAME'
        end>
      DropDownBox.ListSource = srcMaterial
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      EmptyDataInfo.Text = #1052#1072#1090#1077#1088#1080#1072#1083'/'#1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      EditButtons = <>
      KeyField = 'M_ID'
      ListField = 'NAME'
      ListSource = srcMaterial
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
    end
  end
  object PropStorage: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 137
    Top = 9
  end
  object dsMaterial: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    APPLIANCE'
      'WHERE'
      '        ID = :OLD_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    m.M_Id'
      '  , m.Name'
      '  from MATERIALS M'
      '  where m.Deleted = 0'
      '  order by m.Name  ')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DISCOUNT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 234
    Top = 6
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcMaterial: TDataSource
    AutoEdit = False
    DataSet = dsMaterial
    Left = 318
    Top = 8
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 48
    Top = 5
  end
end
