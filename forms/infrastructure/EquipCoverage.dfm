object EquipCoverageForm: TEquipCoverageForm
  Left = 512
  Top = 356
  Caption = #1047#1086#1085#1072' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
  ClientHeight = 212
  ClientWidth = 350
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
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  DesignSize = (
    350
    212)
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 8
    Top = 11
    Width = 36
    Height = 13
    Caption = #1059#1083#1080#1094#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 38
    Width = 25
    Height = 13
    Caption = #1044#1086#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LupStreets: TDBLookupComboboxEh
    Left = 50
    Top = 8
    Width = 292
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'STREET_ID'
    DataSource = srcCoverage
    DropDownBox.Columns = <
      item
        FieldName = 'STREET_NAME'
        Title.Caption = #1059#1083#1080#1094#1072
      end
      item
        AutoFitColWidth = False
        FieldName = 'STREET_SHORT'
        Title.Caption = #1089#1086#1082#1088'.'
        Width = 25
      end
      item
        FieldName = 'AREA_NAME'
        Title.Caption = #1056#1072#1081#1086#1085
      end>
    DropDownBox.ListSource = srcStreet
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterType = lsftContainsEh
    DropDownBox.ListSourceAutoFilterAllColumns = True
    DropDownBox.AutoDrop = True
    DropDownBox.ShowTitles = True
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1059#1083#1080#1094#1072
    EditButtons = <
      item
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1091#1102' '#1091#1083#1080#1094#1091
        ShortCut = 16467
        Style = ebsPlusEh
        OnClick = LupStreetsEditButtons0Click
      end>
    KeyField = 'STREET_ID'
    ListField = 'STREET_NAME'
    ListSource = srcStreet
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 0
    Visible = True
    OnNotInList = LupStreetsNotInList
  end
  object LupHOUSE_ID: TDBLookupComboboxEh
    Left = 50
    Top = 35
    Width = 292
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'HOUSE_ID'
    DataSource = srcCoverage
    DropDownBox.Columns = <
      item
        FieldName = 'HOUSE_NO'
        Width = 60
      end
      item
        FieldName = 'SUBAREA_NAME'
        Width = 40
      end>
    DropDownBox.ListSource = srcHouse
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterType = lsftContainsEh
    DropDownBox.ListSourceAutoFilterAllColumns = True
    DropDownBox.AutoDrop = True
    EmptyDataInfo.Text = #1044#1086#1084
    EditButtons = <
      item
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1076#1086#1084
        ShortCut = 16456
        Style = ebsPlusEh
        OnClick = LupHOUSE_IDEditButtons0Click
      end>
    KeyField = 'HOUSE_ID'
    ListField = 'HOUSE_NO'
    ListSource = srcHouse
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 1
    Visible = True
    OnChange = LupHOUSE_IDChange
  end
  object eNotice: TDBMemoEh
    Tag = 9
    Left = 8
    Top = 62
    Width = 334
    Height = 111
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcCoverage
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 2
    Visible = True
    WantReturns = True
  end
  inline OkCancelFrame: TOkCancelFrame
    Left = 0
    Top = 177
    Width = 350
    Height = 35
    Align = alBottom
    TabOrder = 3
    TabStop = True
    inherited bbOk: TBitBtn
      Left = 104
      Top = 6
      Width = 157
      OnClick = OkCancelFramebbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 267
      Top = 6
    end
  end
  object dsStreets: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    s.street_id'
      '  , s.street_short'
      '  , s.street_name'
      '  , a.area_name'
      '  from STREET s'
      '       left outer join area a on (a.area_id = s.area_id)'
      '  order by STREET_NAME, a.area_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 164
    Top = 74
  end
  object dsHouses: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    H.HOUSE_ID'
      '  , H.STREET_ID'
      '  , H.HOUSE_NO'
      '  , H.Q_FLAT'
      '  , H.ORG_ID'
      '  , sa.Subarea_Name'
      'from HOUSE H'
      '  left outer join Subarea sa on (sa.Subarea_Id = h.Subarea_Id)'
      'where h.street_id = :street_id'
      'order by h.HOUSE_NO'
      ''
      '')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcStreet
    Left = 202
    Top = 117
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 222
    Top = 71
  end
  object srcHouse: TDataSource
    DataSet = dsHouses
    Left = 226
    Top = 125
  end
  object Query: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select'
      'C.Account_No, C.Surname, C.Firstname, C.Midlename, c.Cust_Code'
      'FROM CUSTOMER C'
      '@filter'
      '')
    Left = 122
    Top = 93
  end
  object srcCoverage: TDataSource
    DataSet = dsCoverage
    Left = 48
    Top = 104
  end
  object dsCoverage: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE EQUIPMENT_COVERAGE'
      'SET '
      '    NOTICE = :NOTICE'
      'WHERE'
      '    EID = :OLD_EID'
      '    and HOUSE_ID = :OLD_HOUSE_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EQUIPMENT_COVERAGE'
      'WHERE'
      '        EID = :OLD_EID'
      '    and HOUSE_ID = :OLD_HOUSE_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO EQUIPMENT_COVERAGE('
      '    EID,'
      '    HOUSE_ID,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :EID,'
      '    :HOUSE_ID,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select '
      '    ec.eid,'
      '    ec.house_id,'
      '    ec.notice,'
      '    h.house_no,'
      '    s.street_short,'
      '    s.street_name,'
      '    s.street_id'
      'from equipment_coverage ec'
      '   inner join house h on (ec.house_id = h.house_id)'
      '   inner join street s on (h.street_id = s.street_id)'
      'where(  ec.eid = :eid and ec.house_id = :hoise'
      '     ) and (     EC.EID = :OLD_EID'
      '    and EC.HOUSE_ID = :OLD_HOUSE_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select '
      '    ec.eid,'
      '    ec.house_id,'
      '    ec.notice,'
      '    h.house_no,'
      '    s.street_short,'
      '    s.street_name,'
      '    s.street_id'
      'from equipment_coverage ec'
      '   inner join house h on (ec.house_id = h.house_id)'
      '   inner join street s on (h.street_id = s.street_id)'
      'where ec.eid = :eid and ec.house_id = :house_id'
      'order by s.street_name, h.HOUSE_NO'
      '')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 56
    Top = 112
  end
end
