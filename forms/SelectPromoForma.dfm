object fmSelectPromo: TfmSelectPromo
  Left = 299
  Top = 226
  ActiveControl = cbPromo
  Caption = #1042#1099#1073#1086#1088' '#1072#1082#1094#1080#1080
  ClientHeight = 86
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
    Height = 86
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      392
      86)
    object Panel2: TPanel
      Left = 0
      Top = 49
      Width = 392
      Height = 37
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        392
        37)
      object bbOk: TBitBtn
        Left = 8
        Top = 8
        Width = 294
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
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = #1054#1090#1084#1077#1085#1072
        ModalResult = 2
        TabOrder = 1
      end
    end
    object cbPromo: TDBLookupComboboxEh
      Left = 8
      Top = 16
      Width = 375
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.ListFieldNames = 'LETTERTYPEDESCR'
      DropDownBox.ListSource = srcPromo
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1082#1072#1082#1091#1102' '#1072#1082#1094#1080#1102' '#1087#1088#1080#1084#1077#1085#1080#1090#1100
      EditButtons = <>
      KeyField = 'PROMO_ID'
      ListField = 'PROMO_NAME'
      ListSource = srcPromo
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnClick = cbPromoClick
      OnEnter = cbPromoEnter
    end
  end
  object dsPromo: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT PROMO_ID, PROMO_NAME FROM PROMO_CHECK(:DS, :SID)')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 200
    Top = 8
  end
  object srcPromo: TDataSource
    AutoEdit = False
    DataSet = dsPromo
    Left = 320
    Top = 8
  end
end
