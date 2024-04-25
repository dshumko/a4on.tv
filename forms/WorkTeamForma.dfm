inherited WorkTeamForm: TWorkTeamForm
  Left = 259
  Top = 198
  Caption = #1059#1095#1072#1089#1090#1082#1080' '#1080' '#1079#1074#1077#1085#1100#1103
  ClientHeight = 459
  ClientWidth = 697
  Constraints.MinHeight = 244
  Menu = MainMenu1
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 274
    Width = 697
    Height = 5
    Cursor = crVSplit
    Align = alTop
  end
  inherited splPG: TSplitter
    Width = 697
  end
  inherited dbGrid: TDBGridEh
    Width = 697
    Height = 189
    Align = alTop
    AllowedOperations = [alopUpdateEh]
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WA_ID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1091#1095#1072#1089#1090#1082#1072
        Width = 158
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WA_CODE'
        Footers = <>
        Title.Caption = #1050#1086#1076
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WH'
        Footers = <>
        Title.Caption = #1057#1082#1083#1072#1076
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'REQ_LIMIT'
        Footers = <>
        Title.Caption = #1047#1072#1103#1074#1086#1082' '#1074' '#1076#1077#1085#1100
        Width = 45
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 190
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PHONE'
        Footers = <>
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADRES'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'BOSS'
        Footers = <>
        Title.Caption = #1053#1072#1095#1072#1083#1100#1085#1080#1082
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FOREMAN'
        Footers = <>
        Title.Caption = #1052#1072#1089#1090#1077#1088
      end>
  end
  object pgcADD: TPageControl [3]
    Left = 0
    Top = 279
    Width = 697
    Height = 180
    ActivePage = tsTeams
    Align = alClient
    TabOrder = 3
    OnChange = pgcADDChange
    object tsTeams: TTabSheet
      Caption = #1047#1074#1077#1085#1100#1103
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 689
        Height = 153
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbSubArea: TDBGridEh
          Left = 0
          Top = 23
          Width = 689
          Height = 130
          Align = alClient
          AllowedOperations = [alopInsertEh, alopUpdateEh, alopDeleteEh]
          DataSource = srcWORKGROUPS
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          GridLineParams.VertEmptySpaceStyle = dessNonEh
          OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
          SortLocal = True
          TabOrder = 1
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NAME'
              Footers = <>
              Title.Caption = #1047#1074#1077#1085#1086
              Width = 164
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Width = 430
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ToolBar2: TToolBar
          Left = 0
          Top = 0
          Width = 689
          Height = 23
          Caption = 'ToolBar1'
          Images = A4MainForm.ICONS_ACTIVE
          TabOrder = 0
          object ToolButton7: TToolButton
            Left = 0
            Top = 0
            Width = 5
            Caption = 'ToolButton4'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object actSu: TToolButton
            Left = 5
            Top = 0
            Action = actSubNew
          end
          object ToolButton11: TToolButton
            Left = 28
            Top = 0
            Width = 4
            Caption = 'ToolButton5'
            ImageIndex = 3
            Style = tbsSeparator
          end
          object ToolButton12: TToolButton
            Left = 32
            Top = 0
            Action = actSubEdit
          end
          object ToolButton14: TToolButton
            Left = 55
            Top = 0
            Action = actSubDelete
          end
          object ToolButton17: TToolButton
            Left = 78
            Top = 0
            Width = 11
            Caption = 'ToolButton10'
            ImageIndex = 28
            Style = tbsSeparator
          end
          object tbOkSub: TToolButton
            Left = 89
            Top = 0
            Enabled = False
            ImageIndex = 25
            OnClick = tbOkSubClick
          end
          object btn1: TToolButton
            Left = 112
            Top = 0
            Width = 8
            Caption = 'btn1'
            ImageIndex = 26
            Style = tbsSeparator
          end
          object tbCancelSub: TToolButton
            Left = 120
            Top = 0
            Caption = 'tbCancelSub'
            Enabled = False
            ImageIndex = 26
            OnClick = tbCancelSubClick
          end
        end
      end
    end
    object tsHouses: TTabSheet
      Caption = #1047#1086#1085#1072' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
      ImageIndex = 1
      object dbgrdHouses: TDBGridEh
        Left = 0
        Top = 25
        Width = 689
        Height = 128
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = srcHouses
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        SortLocal = True
        STFilter.Local = True
        STFilter.Visible = True
        SumList.Active = True
        TabOrder = 1
        TitleParams.MultiTitle = True
        OnDblClick = dbgrdHousesDblClick
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'STRT'
            Footers = <>
            Title.Caption = #1059#1083#1080#1094#1072
            Title.TitleButton = True
            Width = 151
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOUSE_NO'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088
            Title.TitleButton = True
            Width = 53
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'Q_FLAT'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1050#1074#1072#1088#1090#1080#1088
            Title.Hint = #1050#1074#1072#1088#1090#1080#1088
            Title.Orientation = tohVertical
            Width = 33
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CONNECTED'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1055#1086#1076#1082#1083'.'
            Title.Hint = #1055#1086#1076#1082#1083'.'
            Title.Orientation = tohVertical
            Width = 32
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DISCONNECTED'
            Footers = <>
            Title.Caption = #1054#1090#1082#1083'.'
            Title.Hint = #1054#1090#1082#1083'.'
            Title.Orientation = tohVertical
            Width = 27
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOUSE_CODE'
            Footers = <>
            Title.Caption = #1050#1086#1076
          end
          item
            CellButtons = <>
            DropDownBox.Columns = <
              item
                FieldName = 'SUBAREA_NAME'
              end>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SUBAREA_NAME'
            Footers = <>
            Title.Caption = #1056#1072#1081#1086#1085
            Title.TitleButton = True
            Width = 75
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1047#1074#1077#1085#1086
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EXIST_TV'
            Footers = <>
            Title.Caption = #1045#1089#1090#1100'|TB'
            Title.Hint = 'TB'
            Title.Orientation = tohVertical
            Width = 20
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EXIST_LAN'
            Footers = <>
            Title.Caption = #1045#1089#1090#1100'|'#1057#1055#1044
            Title.Hint = #1057#1055#1044
            Title.Orientation = tohVertical
            Width = 23
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EXIST_DTV'
            Footers = <>
            Title.Caption = #1045#1089#1090#1100'|'#1062'TB'
            Title.Hint = #1062'TB'
            Title.Orientation = tohVertical
            Width = 24
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object ToolBar3: TToolBar
        Left = 0
        Top = 0
        Width = 689
        Height = 25
        Caption = 'ToolBar1'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object ToolButton8: TToolButton
          Left = 0
          Top = 0
          Width = 5
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object tbHAdd: TToolButton
          Left = 5
          Top = 0
          Action = actHouseNew
        end
        object ToolButton16: TToolButton
          Left = 28
          Top = 0
          Width = 4
          Caption = 'ToolButton5'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object tbHEdit: TToolButton
          Left = 32
          Top = 0
          Action = actHouseEdit
        end
        object Label2: TLabel
          Left = 55
          Top = 0
          Width = 222
          Height = 22
          Align = alClient
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1044#1086#1084#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
      end
    end
    object tsLimit: TTabSheet
      Caption = #1054#1075#1088#1072#1085#1080#1095#1077#1085#1080#1103
      ImageIndex = 2
      object dbg1: TDBGridEh
        Left = 0
        Top = 23
        Width = 689
        Height = 130
        Align = alClient
        DataSource = srcLimit
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        TabOrder = 1
        TitleParams.MultiTitle = True
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RQ_CONTENT'
            Footers = <>
            Title.Caption = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1079#1086#1074#1072
            Title.TitleButton = True
            Width = 187
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'RT_NAME'
            Footers = <>
            Title.Caption = #1058#1080#1087' '#1079#1072#1103#1074#1082#1080
            Width = 133
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'QUANT'
            Footers = <>
            Title.Caption = #1082#1086#1083'-'#1074#1086
            Width = 44
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Width = 232
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object tlb2: TToolBar
        Left = 0
        Top = 0
        Width = 689
        Height = 23
        Caption = 'ToolBar1'
        Images = A4MainForm.ICONS_ACTIVE
        TabOrder = 0
        object btn14: TToolButton
          Left = 0
          Top = 0
          Width = 5
          Caption = 'ToolButton4'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object btn11: TToolButton
          Left = 5
          Top = 0
          Action = ActLimitNew
        end
        object btn15: TToolButton
          Left = 28
          Top = 0
          Width = 4
          Caption = 'ToolButton5'
          ImageIndex = 3
          Style = tbsSeparator
        end
        object btn12: TToolButton
          Left = 32
          Top = 0
          Action = actLimitEdit
        end
        object btn16: TToolButton
          Left = 55
          Top = 0
          Width = 4
          Caption = 'ToolButton6'
          ImageIndex = 4
          Style = tbsSeparator
        end
        object btn13: TToolButton
          Left = 59
          Top = 0
          Action = actLimitDEl
        end
      end
    end
  end
  inherited tlbMain: TToolBar
    Width = 697
    inherited tbOk: TToolButton
      OnClick = tbOkClick
    end
    inherited tbCancel: TToolButton
      OnClick = tbCancelClick
    end
  end
  inherited pnlEdit: TPanel
    Width = 697
    inherited btnSaveLink: TBitBtn
      Width = 292
    end
    inherited btnCancelLink: TBitBtn
      Left = 383
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsAreas
    OnDataChange = srcDataSourceDataChange
    Top = 56
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 270
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1095#1072#1089#1090#1086#1082
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1095#1072#1089#1090#1086#1082
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1095#1072#1089#1090#1086#1082
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1091#1095#1072#1089#1090#1086#1082
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1091#1095#1072#1089#1090#1086#1082
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1091#1095#1072#1089#1090#1086#1082
      OnExecute = actEditExecute
    end
    object actSubNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1074#1077#1085#1086
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1074#1077#1085#1086
      ImageIndex = 2
      OnExecute = actSubNewExecute
    end
    object actSubDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1074#1077#1085#1086
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1079#1074#1077#1085#1086
      ImageIndex = 3
      OnExecute = actSubDeleteExecute
    end
    object actSubEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1074#1077#1085#1086
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1074#1077#1085#1086
      ImageIndex = 4
      OnExecute = actSubEditExecute
    end
    object ActLimitNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1100' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077
      ImageIndex = 2
      OnExecute = ActLimitNewExecute
    end
    object actLimitEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077
      ImageIndex = 4
      OnExecute = actLimitEditExecute
    end
    object actLimitDEl: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1075#1088#1072#1085#1080#1095#1077#1085#1080#1077
      ImageIndex = 3
      OnExecute = actLimitDElExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 493
    Top = 121
  end
  object dsAreas: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE WORKAREA'
      'SET '
      '    NAME = :NAME,'
      '    WA_CODE = :WA_CODE,'
      '    REQ_LIMIT = :REQ_LIMIT,'
      '    WH_ID = :WH_ID,'
      '    NOTICE = :NOTICE,'
      '    BOSS = :BOSS,'
      '    FOREMAN = :FOREMAN,'
      '    PHONE = :PHONE,'
      '    ADRES = :ADRES'
      'WHERE'
      '    WA_ID = :OLD_WA_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    WORKAREA'
      'WHERE'
      '        WA_ID = :OLD_WA_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO WORKAREA('
      '    WA_ID,'
      '    NAME,'
      '    WA_CODE,'
      '    REQ_LIMIT,'
      '    WH_ID,'
      '    NOTICE,'
      '    BOSS,'
      '    FOREMAN,'
      '    PHONE,'
      '    ADRES'
      ')'
      'VALUES('
      '    :WA_ID,'
      '    :NAME,'
      '    :WA_CODE,'
      '    :REQ_LIMIT,'
      '    :WH_ID,'
      '    :NOTICE,'
      '    :BOSS,'
      '    :FOREMAN,'
      '    :PHONE,'
      '    :ADRES'
      ')')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM WORKAREA'
      ''
      ' WHERE '
      '        WORKAREA.WA_ID = :OLD_WA_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM WORKAREA'
      'order by NAME')
    AutoUpdateOptions.UpdateTableName = 'WORKAREA'
    AutoUpdateOptions.KeyFields = 'WA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 185
    Top = 54
  end
  object srcWORKGROUPS: TDataSource
    AutoEdit = False
    DataSet = dsWORKGROUPS
    OnStateChange = srcWORKGROUPSStateChange
    OnDataChange = srcWORKGROUPSDataChange
    Left = 183
    Top = 367
  end
  object dsWORKGROUPS: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE WORKGROUPS'
      'SET'
      '    NAME = :NAME,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    WG_ID = :OLD_WG_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    WORKGROUPS'
      'WHERE'
      '        WG_ID = :OLD_WG_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO WORKGROUPS('
      '    WG_ID,'
      '    WA_ID,'
      '    NAME,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :WG_ID,'
      '    :WA_ID,'
      '    :NAME,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM WORKGROUPS'
      'where WG_ID = :OLD_WG_ID')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM WORKGROUPS'
      'where WA_ID = :WA_ID'
      'order by NAME')
    AutoUpdateOptions.UpdateTableName = 'WORKGROUPS'
    AutoUpdateOptions.KeyFields = 'WG_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    BeforePost = dsWORKGROUPSBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 180
    Top = 312
  end
  object MainMenu1: TMainMenu
    Left = 438
    Top = 113
    object N1: TMenuItem
      Caption = #1059#1095#1072#1089#1090#1082#1080' '#1080' '#1079#1074#1077#1085#1100#1103
      GroupIndex = 2
      object N2: TMenuItem
        Action = actNew
      end
      object actPaymentEdit1: TMenuItem
        Action = actEdit
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object N4: TMenuItem
        Action = actSubNew
      end
      object N5: TMenuItem
        Action = actSubEdit
      end
    end
  end
  object dsHouses: TpFIBDataSet
    DeleteSQL.Strings = (
      
        'execute procedure HOUSE_IUD('#39'D'#39', :HOUSE_ID, null, null, null, nu' +
        'll, null, '
      
        '    null, null, null, null, null, null, null, null, null, null, ' +
        'null)')
    RefreshSQL.Strings = (
      'select'
      'u.street_name||'#39' '#39'|| u.street_short as strt,'
      ' H.*'
      
        ', (select cast(count(*) as Integer) from CUSTOMER A where A.CUST' +
        '_STATE>0 and a.HOUSE_ID = h.HOUSE_ID) as CONNECTED'
      
        ', (select cast(count(*) as Integer) from CUSTOMER A where A.CUST' +
        '_STATE=0 and a.HOUSE_ID = h.HOUSE_ID) as DISCONNECTED'
      ', case'
      ' when (h.q_flat is null) then 0'
      ' when (h.q_flat = 0) then 0'
      
        ' ELSE (select count(*)from CUSTOMER A where A.CUST_STATE>0 and a' +
        '.HOUSE_ID = h.HOUSE_ID)*100/h.q_flat'
      'end as PERCENT'
      ', o.ORG_NAME'
      ', s.SUBAREA_NAME'
      ', w.name'
      'from'
      ' HOUSE H '
      '   inner join street u on (u.street_id = h.street_id)'
      '   left outer join ORGANIZATION o on (o.ORG_ID = h.ORG_ID)'
      '   left outer join SUBAREA s on (s.SUBAREA_ID = h.SUBAREA_ID) '
      '   left outer join WORKGROUPS w on (w.WG_ID = h.WG_ID)'
      ''
      
        'where(   exists(select  from workgroups wg where wg.wg_id = h.wg' +
        '_id and wg.wa_id = :WA_ID )'
      '     ) and (     H.HOUSE_ID = :OLD_HOUSE_ID'
      '     )'
      '    '
      ''
      ' ')
    SelectSQL.Strings = (
      'select'
      'u.street_name||'#39' '#39'|| u.street_short as strt,'
      ' H.*'
      
        ', (select cast(count(*) as Integer) from CUSTOMER A where A.CUST' +
        '_STATE>0 and a.HOUSE_ID = h.HOUSE_ID) as CONNECTED'
      
        ', (select cast(count(*) as Integer) from CUSTOMER A where A.CUST' +
        '_STATE=0 and a.HOUSE_ID = h.HOUSE_ID) as DISCONNECTED'
      ', case'
      ' when (h.q_flat is null) then 0'
      ' when (h.q_flat = 0) then 0'
      
        ' ELSE (select count(*)from CUSTOMER A where A.CUST_STATE>0 and a' +
        '.HOUSE_ID = h.HOUSE_ID)*100/h.q_flat'
      'end as PERCENT'
      ', o.ORG_NAME'
      ', s.SUBAREA_NAME'
      ', w.name'
      'from'
      ' HOUSE H '
      '   inner join street u on (u.street_id = h.street_id)'
      '   left outer join ORGANIZATION o on (o.ORG_ID = h.ORG_ID)'
      '   left outer join SUBAREA s on (s.SUBAREA_ID = h.SUBAREA_ID) '
      '   left outer join WORKGROUPS w on (w.WG_ID = h.WG_ID)'
      ''
      
        'where  exists(select wg.wg_id from workgroups wg where wg.wg_id ' +
        '= h.wg_id and wg.wa_id = :WA_ID )'
      ''
      ' order by 1, h.house_no')
    AutoUpdateOptions.UpdateTableName = 'HOUSE'
    AutoUpdateOptions.KeyFields = 'HOUSE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcDataSource
    Left = 297
    Top = 307
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object srcHouses: TDataSource
    AutoEdit = False
    DataSet = dsHouses
    OnDataChange = srcHousesDataChange
    Left = 386
    Top = 302
  end
  object dsWH: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select O_ID, O_TYPE, O_NAME, O_DESCRIPTION from OBJECTS WHERE O_' +
        'TYPE = 10 ORDER BY O_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 375
    Top = 116
  end
  object dsLimit: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    WORKAREALIMIT'
      'WHERE'
      '        WA_ID = :OLD_WA_ID'
      '    and W_ID = :OLD_W_ID')
    RefreshSQL.Strings = (
      
        'select wl.WA_ID, wl.w_id, wl.QUANT, wl.NOTICE, w.rq_content, rt.' +
        'rt_name'
      'from WORKAREALIMIT wl'
      '  inner join request_templates w on (wl.w_id = w.rqtl_id)'
      '  inner join REQUEST_TYPES rt on (w.rq_type = rt.rt_id)'
      'where(  wl.WA_ID = :WA_ID'
      '     ) and (     WL.WA_ID = :OLD_WA_ID'
      '    and WL.W_ID = :OLD_W_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      
        'select wl.WA_ID, wl.w_id, wl.QUANT, wl.NOTICE, w.rq_content, rt.' +
        'rt_name'
      'from WORKAREALIMIT wl'
      '  inner join request_templates w on (wl.w_id = w.rqtl_id)'
      '  inner join REQUEST_TYPES rt on (w.rq_type = rt.rt_id)'
      'where wl.WA_ID = :WA_ID'
      'order by w.rq_content, rt.rt_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDataSource
    Left = 462
    Top = 204
  end
  object srcLimit: TDataSource
    DataSet = dsLimit
    OnDataChange = srcLimitDataChange
    Left = 462
    Top = 267
  end
  object actlst1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 82
    Top = 312
    object actHouseNew: TAction
      Caption = #1053#1086#1074#1099#1081' '#1076#1086#1084
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1084
      ImageIndex = 2
      ShortCut = 16429
      OnExecute = actHouseNewExecute
    end
    object actHouseEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1076#1086#1084
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1087#1086' '#1076#1086#1084#1091
      ImageIndex = 4
      ShortCut = 16497
      OnExecute = actHouseEditExecute
    end
  end
end
