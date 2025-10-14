object apgEqpmntRegion: TapgEqpmntRegion
  Left = 0
  Top = 0
  Caption = #1047#1086#1085#1072' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
  ClientHeight = 208
  ClientWidth = 698
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 208
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
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
  object dbgHouses: TDBGridEh
    Left = 26
    Top = 0
    Width = 672
    Height = 208
    Align = alClient
    DataSource = srcData
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    TabOrder = 1
    TitleParams.MultiTitle = True
    OnDblClick = dbgHousesDblClick
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_NAME'
        Footers = <>
        Title.Caption = #1059#1083#1080#1094#1072
        Width = 102
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_NO'
        Footers = <>
        Title.Caption = #1044#1086#1084
        Width = 44
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 125
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'AREA_NAME'
        Footers = <>
        Title.Caption = #1053'.'#1055'.'
        Width = 231
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SUBAREA_NAME'
        Footers = <>
        Title.Caption = #1056#1072#1081#1086#1085
        Width = 85
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object dsData: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EQUIPMENT_COVERAGE'
      'WHERE'
      '        EID = :OLD_EID'
      '    and HOUSE_ID = :OLD_HOUSE_ID'
      '    ')
    RefreshSQL.Strings = (
      'SELECT A.O_NAME, CA.*'
      'FROM equipment_attributes CA'
      
        '   INNER JOIN OBJECTS A ON (CA.O_ID = A.O_ID and A.O_TYPE in (5,' +
        '6))'
      'where  '
      '  CA.eid = :eid'
      '  and'
      '  CA.EA_ID = :OLD_EA_ID')
    SelectSQL.Strings = (
      'select'
      '    ec.eid'
      '  , ec.house_id'
      '  , ec.notice'
      '  , h.house_no'
      '  , s.street_short'
      '  , s.street_name'
      '  , a.Area_Name'
      '  , sa.Subarea_Name'
      '  from equipment_coverage ec'
      '       inner join house h on (ec.house_id = h.house_id)'
      '       inner join street s on (h.street_id = s.street_id)'
      '       left outer join area a on (a.area_id = s.area_id)'
      
        '       left outer join Subarea sa on (sa.Subarea_Id = h.Subarea_' +
        'Id)       '
      '  where ec.eid = :eid'
      '  order by a.Area_Name, s.street_name, h.HOUSE_NO')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 67
    Top = 157
  end
  object srcData: TDataSource
    AutoEdit = False
    DataSet = dsData
    OnDataChange = srcDataDataChange
    Left = 183
    Top = 155
  end
  object ActListCustomers: TActionList
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
