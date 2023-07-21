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
  object dbgrd1: TDBGrid
    Left = 26
    Top = 0
    Width = 753
    Height = 211
    Align = alClient
    DataSource = srcMat
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NAME'
        Title.Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SERIAL'
        Title.Caption = #1057'/'#1053
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTICE'
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 334
        Visible = True
      end>
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
  object srcMat: TDataSource
    DataSet = dsMat
    Left = 119
    Top = 83
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
  object dsMat: TpFIBDataSet
    RefreshSQL.Strings = (
      'select'
      '  o.o_name'
      '  ,  E.Name'
      '  , e.Mac Serial'
      '  , '#39#39' Dimension'
      '  , e.Eid M_Id'
      '  ,  1 Quant'
      '  , e.Notice'
      '  , '#39'e'#39' ROW_TYPE'
      '  from EQUIPMENT E'
      
        '       left outer join objects o on (e.eq_group = o.o_id and o.O' +
        '_TYPE = 7)'
      '  where'
      '    e.Node_Id = :OLD_node_id'
      '    and e.EID= :OLD_M_ID'
      ''
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '  e.EID'
      '  , o.o_name'
      '  , E.Name'
      '  , e.Mac Serial'
      '  , e.Eid M_Id'
      '  , e.Notice'
      '  , '#39'e'#39' ROW_TYPE'
      '  from EQUIPMENT E'
      
        '       left outer join objects o on (e.eq_group = o.o_id and o.O' +
        '_TYPE = 7)'
      '  where e.Node_Id = :Node_Id'
      ''
      'order by e.Name, e.Mac')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 64
    Top = 88
  end
end
