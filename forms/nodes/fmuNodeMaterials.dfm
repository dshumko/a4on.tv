object apgNodeMaterials: TapgNodeMaterials
  Left = 0
  Top = 0
  Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1074' '#1089#1077#1090#1080' '#1085#1072' '#1091#1079#1083#1077
  ClientHeight = 211
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 211
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      26
      211)
    object btnDel1: TSpeedButton
      Left = 2
      Top = 188
      Width = 22
      Height = 22
      Action = actDel
      Anchors = [akLeft, akBottom]
      Flat = True
      Layout = blGlyphTop
      Visible = False
    end
    object btnAdd1: TSpeedButton
      Left = 2
      Top = 4
      Width = 22
      Height = 22
      Action = actAdd
      Flat = True
      Visible = False
    end
    object btnFind: TSpeedButton
      Left = 2
      Top = 40
      Width = 22
      Height = 22
      Action = actFind
      Flat = True
    end
  end
  object dbgEquip: TDBGridEh
    Left = 26
    Top = 0
    Width = 753
    Height = 211
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = srcEquipment
    DynProps = <>
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghColumnResize, dghColumnMove]
    SearchPanel.Enabled = True
    SortLocal = True
    SumList.Active = True
    TabOrder = 1
    Columns = <
      item
        Alignment = taLeftJustify
        ButtonStyle = cbsNone
        CellButtons = <>
        DynProps = <>
        EditButton.Visible = False
        EditButtons = <>
        FieldName = 'EQ_TYPE'
        Footers = <>
        KeyList.Strings = (
          '1'
          '2'
          '3')
        PickList.Strings = (
          #1057#1077#1090#1077#1074#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
          #1050#1072#1073#1077#1083#1100#1085#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
          #1055#1088#1086#1095#1077#1077)
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'eqgroup'
        Footers = <>
        Title.Caption = #1043#1088#1091#1087#1087#1072
        Title.TitleButton = True
        Width = 63
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 95
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MAC'
        Footers = <>
        Title.TitleButton = True
        Width = 89
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IP'
        Footers = <>
        Title.TitleButton = True
        Width = 109
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1047#1072#1084#1077#1090#1082#1080
        Title.TitleButton = True
        Width = 129
      end>
    object RowDetailData: TRowDetailPanelControlEh
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
    Left = 347
    Top = 90
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
    Left = 411
    Top = 98
  end
  object ActList: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 211
    Top = 78
    object actAdd: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077'/'#1084#1072#1090#1077#1088#1080#1072#1083#1072
      ImageIndex = 2
      OnExecute = actAddExecute
    end
    object actDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      ImageIndex = 3
      OnExecute = actDelExecute
    end
    object actFind: TAction
      Hint = #1053#1072#1081#1090#1080' '#1074' '#1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1080' '#1074' '#1089#1077#1090#1080
      ImageIndex = 7
      OnExecute = actFindExecute
    end
  end
  object dsEquipment: TpFIBDataSet
    UpdateSQL.Strings = (
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    E.*'
      '  , o.o_name as eqgroup'
      '  , o.O_DIMENSION as COLOR'
      '  from EQUIPMENT E'
      
        '       left outer join objects o on (e.eq_group = o.o_id and o.O' +
        '_TYPE = 7)'
      '  where e.Node_Id = :Node_Id'
      ''
      'order by o.O_Name, e.Name')
    AutoUpdateOptions.UpdateTableName = 'HOUSE'
    AutoUpdateOptions.KeyFields = 'HOUSE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 55
    Top = 140
  end
  object srcEquipment: TDataSource
    AutoEdit = False
    DataSet = dsEquipment
    Left = 56
    Top = 80
  end
end
