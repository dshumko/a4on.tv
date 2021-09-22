inherited SatCardsForm: TSatCardsForm
  Left = 381
  Top = 171
  Caption = #1050#1072#1088#1090#1086#1095#1082#1080' / '#1044#1077#1082#1086#1076#1077#1088#1099' '#1082#1072#1085#1072#1083#1086#1074' '#1086#1087#1077#1088#1072#1090#1086#1088#1072
  ClientHeight = 503
  ClientWidth = 790
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter [0]
    Left = 0
    Top = 320
    Width = 790
    Height = 8
    Cursor = crVSplit
    Align = alBottom
  end
  inherited dbGrid: TDBGridEh
    Top = 193
    Width = 790
    Height = 127
    AllowedOperations = [alopUpdateEh]
    FooterRowCount = 1
    SumList.Active = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_ID'
        Footers = <>
        Visible = False
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
        Title.TitleButton = True
        Width = 167
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_COUNT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1050#1086#1083'-'#1074#1086' '#1082#1072#1085#1072#1083#1086#1074
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PLACE'
        Footers = <>
        Title.Caption = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
        Title.TitleButton = True
        Width = 78
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CHIP_ID'
        Footers = <>
        Title.Caption = 'Chip ID'
        Title.ShowImageAndText = False
        Width = 88
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CRYPT_NAME'
        Footers = <>
        Title.Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072
        Width = 75
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DATEEND'
        Footers = <>
        Title.Caption = #1054#1087#1083#1072#1095#1077#1085#1086' '#1076#1086
        Title.TitleButton = True
        Width = 89
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Distrib'
        Footers = <>
        Title.Caption = #1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088
        Width = 90
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 310
      end>
  end
  inherited tlbMain: TToolBar
    Width = 790
    inherited ToolButton9: TToolButton
      Visible = False
    end
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
    end
  end
  inherited pnlEdit: TPanel
    Width = 790
    Height = 168
    ParentCtl3D = False
    object lbl2: TLabel [0]
      Left = 5
      Top = 10
      Width = 31
      Height = 13
      Caption = #1053#1086#1084#1077#1088
    end
    object lbl3: TLabel [1]
      Left = 5
      Top = 79
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object lbl1: TLabel [2]
      Left = 590
      Top = 10
      Width = 66
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1054#1087#1083#1072#1095#1077#1085#1086' '#1076#1086
    end
    object lbl4: TLabel [3]
      Left = 590
      Top = 33
      Width = 56
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl5: TLabel [4]
      Left = 5
      Top = 33
      Width = 35
      Height = 13
      Caption = 'Chip ID'
    end
    object lblPlace: TLabel [5]
      Left = 5
      Top = 56
      Width = 31
      Height = 13
      Caption = #1052#1077#1089#1090#1086
    end
    inherited btnSaveLink: TBitBtn
      Left = 72
      Top = 137
      Width = 605
      TabOrder = 6
    end
    inherited btnCancelLink: TBitBtn
      Left = 683
      Top = 137
      Width = 98
      Cancel = True
      TabOrder = 7
    end
    object edtName: TDBEditEh
      Left = 72
      Top = 7
      Width = 512
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1086#1084#1077#1088' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dbmmoO_DESCRIPTION: TDBMemoEh
      Left = 72
      Top = 76
      Width = 709
      Height = 55
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1080#1087#1072
      ShowHint = True
      TabOrder = 5
      Visible = True
      WantReturns = True
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Left = 660
      Top = 7
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'O_DATEEND'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1083#1072#1095#1077#1085#1086' '#1076#1086
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object cbbS_Crypt: TDBLookupComboboxEh
      Left = 660
      Top = 30
      Width = 121
      Height = 21
      Anchors = [akTop, akRight]
      DynProps = <>
      DataField = 'CRYPT'
      DataSource = srcDataSource
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1050#1086#1076#1080#1088#1086#1074#1082#1072
      EditButtons = <>
      KeyField = 'O_Id'
      ListField = 'O_Name'
      ListSource = srcCrypt
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object edtURL: TDBEditEh
      Left = 72
      Top = 30
      Width = 512
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Chip_ID'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'Chip ID'
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object edtPlace: TDBEditEh
      Left = 72
      Top = 53
      Width = 709
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PLACE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1052#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
  end
  object pnlBottom: TPanel [4]
    Left = 0
    Top = 328
    Width = 790
    Height = 175
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object dbgSubArea: TDBGridEh
      Left = 0
      Top = 0
      Width = 790
      Height = 175
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataSource = srcChan
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
      SortLocal = True
      SumList.Active = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      OnDblClick = dbgSubAreaDblClick
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CH_NAME'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1050#1072#1085#1072#1083
          Title.TitleButton = True
          Width = 211
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'SRC_NAME'
          Footers = <>
          Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082
          Title.TitleButton = True
          Width = 176
        end
        item
          CellButtons = <>
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'ON_ANALOG'
          Footers = <>
          Title.Caption = #1076#1083#1103' '#1072#1085#1072#1083#1086#1075#1072
          Title.TitleButton = True
          Width = 59
        end
        item
          CellButtons = <>
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'ON_DVB'
          Footers = <>
          Title.Caption = #1076#1083#1103' DVB'
          Title.TitleButton = True
          Width = 59
        end
        item
          CellButtons = <>
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'ON_IPTV'
          Footers = <>
          Title.Caption = #1076#1083#1103' IPTV'
          Title.TitleButton = True
          Width = 56
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'COST'
          Footers = <>
          Title.Caption = #1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088'|'#1062#1077#1085#1072
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'C_NUMBER'
          Footers = <>
          Title.Caption = #1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088'|'#1044#1086#1075#1086#1074#1086#1088
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'C_DATE'
          Footers = <>
          Title.Caption = #1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088'|'#1044#1072#1090#1072
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088'|'#1044#1080#1089#1090#1088#1080#1073#1100#1102#1090#1086#1088
          Width = 96
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsSatCards
    OnDataChange = srcDataSourceDataChange
    Left = 256
    Top = 288
  end
  inherited actions: TActionList
    Left = 150
    Top = 288
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = actEditExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 443
    Top = 287
  end
  inherited CnErrors: TCnErrorProvider
    Left = 344
    Top = 288
  end
  object dsSatCards: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Objects_Iud(1, 44, :O_ID, :O_Name, :O_Descript' +
        'ion, :Chip_ID, 0, null, :CRYPT, null, :O_DATEEND, :Place)')
    DeleteSQL.Strings = (
      'execute procedure Objects_Iud(2, 44, :O_ID)')
    InsertSQL.Strings = (
      
        'execute procedure Objects_Iud(0, 44, :O_ID, :O_Name, :O_Descript' +
        'ion, :Chip_ID, 0, null, :CRYPT, null, :O_DATEEND, :Place)')
    RefreshSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , o.O_NAME'
      '  , o.O_Dateend'
      '  , o.O_DESCRIPTION'
      '  , o.O_NUMERICFIELD as CRYPT'
      '  , o.O_CHECK PLACE'
      '  , c.O_Name CRYPT_NAME'
      '  , o.O_DIMENSION Chip_ID'
      '  , d.Name Distrib'
      '  , (select'
      '         count(distinct c.Ch_Name)'
      '       from Channel_Src_Param csp'
      '            inner join Channel_Src cs on (csp.Cs_Id = cs.Cs_Id)'
      '            inner join Channels C on (c.Ch_Id = csp.Ch_Id)'
      '       where csp.Card_Id = o.O_ID'
      '             and not csp.Card_Id is null) as CH_COUNT'
      '  from OBJECTS o'
      
        '       left outer join OBJECTS C on (c.O_Id = o.O_Numericfield a' +
        'nd c.O_TYPE = 43)'
      '       left outer join Distrib_Cards dc on (dc.Card = o.O_Name)'
      
        '       left outer join Distributor d on (d.Id = dc.Distributor_I' +
        'd)'
      '  where o.O_TYPE = 44'
      '        and o.O_DELETED = 0'
      '     and O.O_ID = :OLD_O_ID'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , o.O_NAME'
      '  , o.O_Dateend'
      '  , o.O_DESCRIPTION'
      '  , o.O_NUMERICFIELD as CRYPT'
      '  , o.O_CHECK PLACE'
      '  , c.O_Name CRYPT_NAME'
      '  , o.O_DIMENSION Chip_ID'
      '  , (select'
      '         count(distinct c.Ch_Name)'
      '       from Channel_Src_Param csp'
      '            inner join Channel_Src cs on (csp.Cs_Id = cs.Cs_Id)'
      '            inner join Channels C on (c.Ch_Id = csp.Ch_Id)'
      '       where csp.Card_Id = o.O_ID'
      '             and not csp.Card_Id is null) as CH_COUNT'
      '  from OBJECTS o'
      
        '       left outer join OBJECTS C on (c.O_Id = o.O_Numericfield a' +
        'nd c.O_TYPE = 43)'
      '       left outer join Distrib_Cards dc on (dc.Card = o.O_Name)'
      '  where o.O_TYPE = 44'
      '        and o.O_DELETED = 0'
      '  order by o.O_NAME')
    AutoUpdateOptions.UpdateTableName = 'OBJECTS'
    AutoUpdateOptions.KeyFields = 'O_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 48
    Top = 296
  end
  object dsChan: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SUBAREA'
      'SET '
      '    SUBAREA_NAME = :SUBAREA_NAME,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SUBAREA S'
      'WHERE'
      '  S.SUBAREA_ID = :OLD_SUBAREA_ID'
      
        '  and not exists (select h.Subarea_Id from HOUSE h where h.Subar' +
        'ea_Id = s.Subarea_Id)'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    c.Ch_Name'
      '  , cs.Name SRC_NAME'
      '  , csp.On_Analog'
      '  , csp.On_Dvb'
      '  , csp.On_Iptv'
      '  , csp.Cs_Id'
      '  , csp.Ch_Id'
      '  , cd.Cost'
      '  , cd.C_Number'
      '  , cd.C_Date'
      '  , cd.Name'
      '  from Channel_Src_Param csp'
      '       inner join Channel_Src cs on (csp.Cs_Id = cs.Cs_Id)'
      '       inner join Channels C on (c.Ch_Id = csp.Ch_Id)'
      '       left outer join(select'
      '                           dch.Ch_Id'
      '                         , dch.Cost'
      '                         , dc.C_Number'
      '                         , dc.C_Date'
      '                         , d.Name'
      '                         from Distrib_Contract_Ch dch'
      
        '                              inner join Distrib_Contracts dc on' +
        ' (dch.Contract_Id = dc.Id)'
      
        '                              inner join Distributor d on (d.Id ' +
        '= dc.Distributor_Id)'
      '                         where current_date >= dc.C_Date'
      
        '                               and current_date <= coalesce(dc.C' +
        '_Date_Before, current_date)'
      ''
      '             ) cd on (cd.Ch_Id = c.Ch_Id)'
      'where csp.Card_Id = :O_Id and not csp.Card_Id is null'
      '  and CSP.CH_ID = :OLD_CH_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    c.Ch_Name'
      '  , cs.Name SRC_NAME'
      '  , csp.On_Analog'
      '  , csp.On_Dvb'
      '  , csp.On_Iptv'
      '  , csp.Cs_Id'
      '  , csp.Ch_Id'
      '  , cd.Cost'
      '  , cd.C_Number'
      '  , cd.C_Date'
      '  , cd.Name'
      '  from Channel_Src_Param csp'
      '       inner join Channel_Src cs on (csp.Cs_Id = cs.Cs_Id)'
      '       inner join Channels C on (c.Ch_Id = csp.Ch_Id)'
      '       left outer join(select'
      '                           dch.Ch_Id'
      '                         , dch.Cost'
      '                         , dc.C_Number'
      '                         , dc.C_Date'
      '                         , d.Name'
      '                         from Distrib_Contract_Ch dch'
      
        '                              inner join Distrib_Contracts dc on' +
        ' (dch.Contract_Id = dc.Id)'
      
        '                              inner join Distributor d on (d.Id ' +
        '= dc.Distributor_Id)'
      '                         where current_date >= dc.C_Date'
      
        '                               and current_date <= coalesce(dc.C' +
        '_Date_Before, current_date)'
      ''
      '             ) cd on (cd.Ch_Id = c.Ch_Id)'
      '  where csp.Card_Id = :O_Id'
      '        and not csp.Card_Id is null'
      '  order by C.Ch_NAME ')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    DataSource = srcDataSource
    Left = 240
    Top = 432
  end
  object srcChan: TDataSource
    AutoEdit = False
    DataSet = dsChan
    Left = 160
    Top = 432
  end
  object srcCrypt: TDataSource
    DataSet = dsCrypt
    Left = 432
    Top = 368
  end
  object dsCrypt: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      ' o.O_Id'
      ' , o.O_Name'
      'from objects o'
      'where o.O_Type = 43'
      'and o.O_Deleted = 0'
      'order by o.O_Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 367
    Top = 369
  end
end
