object StreetHouseViewForm: TStreetHouseViewForm
  Left = 0
  Top = 0
  Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1091#1083#1080#1094' '#1080' '#1076#1086#1084#1086#1074
  ClientHeight = 417
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgView: TDBGridEh
    Left = 0
    Top = 0
    Width = 798
    Height = 417
    Align = alClient
    AllowedOperations = []
    DataGrouping.Active = True
    DataGrouping.Footers = <
      item
        Color = clBtnFace
        ColumnItems = <
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end
          item
            ValueType = gfvCountEh
          end
          item
            ValueType = gfvSumEh
          end
          item
            ValueType = gfvSumEh
          end
          item
            ValueType = gfvSumEh
          end
          item
            DisplayFormat = ',#.##'
            ValueType = gfvAvgEh
          end
          item
            DisplayFormat = ',#.##'
            ValueType = gfvSumEh
          end
          item
            DisplayFormat = ',#.##'
            ValueType = gfvSumEh
          end
          item
            DisplayFormat = ',#.##'
            ValueType = gfvSumEh
          end
          item
            ValueType = gfvCountEh
          end
          item
            ValueType = gfvCountEh
          end
          item
            ValueType = gfvCountEh
          end
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end
          item
          end>
        ParentColor = False
        ShowFunctionName = False
        Visible = True
      end>
    DataGrouping.FootersDefValues.ShowFunctionName = True
    DataGrouping.FootersDefValues.RunTimeCustomizable = True
    DataGrouping.GroupPanelVisible = True
    DataGrouping.GroupRowDefValues.FooterInGroupRow = True
    DataSource = srcView
    DynProps = <>
    Flat = True
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    PopupMenu = pmPopUp
    SearchPanel.Enabled = True
    SearchPanel.FilterOnTyping = True
    SortLocal = True
    STFilter.Local = True
    STFilter.Visible = True
    SumList.Active = True
    TabOrder = 0
    TitleParams.MultiTitle = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_ID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_ID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SUBAREA_ID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CITY'
        Footers = <>
        Title.Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_NAME'
        Footers = <>
        Title.Caption = #1059#1083#1080#1094#1072
        Title.TitleButton = True
        Width = 142
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_NO'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1044#1086#1084
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Q_FLAT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1050#1074#1072#1088#1090#1080#1088
        Title.TitleButton = True
        Width = 58
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CONNECTED'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090#1086#1074'|'#1055#1086#1076#1082#1083'-'#1085#1086
        Title.TitleButton = True
        Width = 66
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DISCONNECTED'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090#1086#1074'|'#1054#1090#1082#1083#1102#1095#1077#1085#1086
        Title.TitleButton = True
        Width = 66
      end
      item
        CellButtons = <>
        DisplayFormat = ',#.##'
        DynProps = <>
        EditButtons = <>
        FieldName = 'PERCENT'
        Footer.DisplayFormat = ',#.##'
        Footer.ValueType = fvtAvg
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090#1086#1074'|% '#1087#1086#1076#1082#1083'.'
        Title.TitleButton = True
        Width = 66
      end
      item
        CellButtons = <>
        DisplayFormat = ',#.##'
        DynProps = <>
        EditButtons = <>
        FieldName = 'FEE_TOTAL'
        Footer.DisplayFormat = ',#.##'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1048#1090#1086#1075#1086' '#1090#1077#1082'. '#1084#1077#1089#1103#1094'|'#1053#1072#1095#1080#1089#1083#1077#1085#1086
        Title.TitleButton = True
        Width = 66
      end
      item
        CellButtons = <>
        DisplayFormat = ',#.##'
        DynProps = <>
        EditButtons = <>
        FieldName = 'PAY_TOTAL'
        Footer.DisplayFormat = ',#.##'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1048#1090#1086#1075#1086' '#1090#1077#1082'. '#1084#1077#1089#1103#1094'|'#1054#1087#1083#1072#1095#1077#1085#1086
        Title.TitleButton = True
        Width = 73
      end
      item
        CellButtons = <>
        DisplayFormat = ',#.##'
        DynProps = <>
        EditButtons = <>
        FieldName = 'TARIF_TOTAL'
        Footer.DisplayFormat = ',#.##'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1048#1090#1086#1075#1086' '#1090#1077#1082'. '#1084#1077#1089#1103#1094'|'#1057'. '#1090#1072#1088#1080#1092#1086#1074
        Title.Hint = #1057#1091#1084#1084#1072' '#1090#1072#1088#1080#1092#1086#1074
        Title.TitleButton = True
        Width = 75
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'EXIST_TV'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1059#1089#1083#1091#1075#1080'|'#1058#1042
        Title.TitleButton = True
        Width = 28
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'EXIST_LAN'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1059#1089#1083#1091#1075#1080'|'#1057#1055#1044
        Title.TitleButton = True
        Width = 28
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'EXIST_DTV'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1059#1089#1083#1091#1075#1080'|'#1062#1058#1042
        Title.TitleButton = True
        Width = 28
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SUBAREA_NAME'
        Footers = <>
        Title.Caption = #1056#1072#1081#1086#1085
        Title.TitleButton = True
        Width = 72
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1059#1095#1072#1089#1090#1086#1082
        Title.TitleButton = True
        Width = 71
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HE_NAME'
        Footers = <>
        Title.Caption = #1043#1057
        Title.TitleButton = True
        Width = 61
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ORG_NAME'
        Footers = <>
        Title.Caption = #1054#1073#1089#1083'. '#1086#1088#1075'.'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 99
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CHAIRMAN'
        Footers = <>
        Title.Caption = #1055#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1100'|'#1060#1048#1054
        Title.TitleButton = True
        Width = 65
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CHAIRMAN_PHONE'
        Footers = <>
        Title.Caption = #1055#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1100'|'#1058#1077#1083#1077#1092#1086#1085
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'POST_INDEX'
        Footers = <>
        Title.Caption = #1048#1085#1076#1077#1082#1089
        Title.TitleButton = True
        Width = 56
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_CODE'
        Footers = <>
        Title.Caption = #1050#1086#1076'|'#1059#1083#1080#1094#1099
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_CODE'
        Footers = <>
        Title.Caption = #1050#1086#1076'|'#1044#1086#1084#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IN_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072'|'#1074#1074#1086#1076#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'REPAIR_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072'|'#1086#1073#1089#1083'.'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'H_ATTR'
        Footers = <>
        Title.Caption = #1040#1090#1088'-'#1090#1099' '#1076#1086#1084#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'TAG'
        Footers = <>
        Title.TitleButton = True
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object srcView: TDataSource
    DataSet = mtView
    Left = 128
    Top = 208
  end
  object drvFIBView: TpFIBDataDriverEh
    Database = dmMain.dbTV
    SelectCommand.Params = <>
    SelectCommand.CommandText.Strings = (
      'select'
      '    ah.*'
      
        '  , iif((coalesce(ah.Q_Flat, 0) <> 0), round(ah.CONNECTED * 100 ' +
        '/ ah.Q_Flat, 1), 0.0) PERCENT'
      '  from (select'
      '            H.House_Id'
      '          , H.Street_Id'
      '          , H.House_No'
      '          , H.Q_Flat'
      '          , H.Subarea_Id'
      '          , H.Chairman'
      '          , H.Chairman_Phone'
      '          , H.Notice'
      '          , H.Post_Index'
      '          , H.House_Code'
      '          , H.Exist_Tv'
      '          , H.Exist_Lan'
      '          , H.Exist_Dtv'
      '          , H.In_Date'
      '          , H.Repair_Date'
      '          , H.Tag'
      '          ,'
      '            (select'
      '                 count(distinct a.Flat_No)'
      '               from CUSTOMER A'
      '               where a.HOUSE_ID = h.HOUSE_ID'
      '                     and exists(select'
      '                                    ash.Customer_Id'
      '                                  from Subscr_Hist ash'
      
        '                                  where (a.Customer_Id = ash.Cus' +
        'tomer_Id)'
      
        '                                        and (current_date betwee' +
        'n ash.Date_From and ash.Date_To))) as CONNECTED'
      '          ,'
      '            (select'
      '                 count(distinct a.Flat_No)'
      '               from CUSTOMER A'
      '               where a.HOUSE_ID = h.HOUSE_ID'
      '                     and not exists(select'
      '                                        ash.Customer_Id'
      '                                      from Subscr_Hist ash'
      
        '                                      where (a.Customer_Id = ash' +
        '.Customer_Id)'
      
        '                                            and (current_date be' +
        'tween ash.Date_From and ash.Date_To))) as DISCONNECTED'
      '          , o.ORG_NAME'
      '          , s.SUBAREA_NAME'
      '          , w.name'
      '          , he.he_name'
      '          , st.Street_Code'
      '          , st.Street_Name || '#39' '#39' || st.Street_Short Street_Name'
      '          , coalesce(a.AREA_NAME, '#39#39') CITY'
      '          , cast((select'
      
        '                      list(o.O_DIMENSION||coalesce('#39':'#39'||sa.HA_VA' +
        'LUE, '#39#39'))'
      '                    from Houses_Attributes sa'
      
        '                         inner join objects o on (o.O_Id = sa.O_' +
        'Id and'
      '                               o.O_Type = 37)'
      
        '                    where sa.HOUSE_Id = h.House_Id) as varchar(5' +
        '00)) H_ATTR'
      ''
      '          , (select'
      '                 sum(f.Fee)'
      
        '               from CUSTOMER A inner join Monthly_Fee f on (f.Cu' +
        'stomer_Id = A.Customer_Id)'
      
        '               where a.HOUSE_ID = h.HOUSE_ID and f.Month_Id >= M' +
        'onth_First_Day(CURRENT_DATE) and f.Month_Id <= Month_Last_Day(CU' +
        'RRENT_DATE)'
      '                     ) as FEE_TOTAL'
      '          , (select'
      '                 sum(p.Pay_Sum)'
      
        '               from CUSTOMER A inner join payment p on (p.Custom' +
        'er_Id = A.Customer_Id)'
      
        '               where a.HOUSE_ID = h.HOUSE_ID and p.Pay_Date >= M' +
        'onth_First_Day(CURRENT_DATE) and p.Pay_Date <= Month_Last_Day(CU' +
        'RRENT_DATE)'
      '                     ) as PAY_TOTAL'
      '          , (select'
      
        '                 sum(coalesce((select M_Tarif from Get_Tarif_Sum' +
        '_Customer_Srv(a.Customer_Id, null, CURRENT_DATE)), 0))'
      '               from CUSTOMER A'
      '               where a.HOUSE_ID = h.HOUSE_ID'
      '                     ) as TARIF_TOTAL'
      '          from HOUSE H'
      
        '               inner join STREET st on (st.STREET_ID = h.street_' +
        'id)'
      
        '               left outer join ORGANIZATION o on (o.ORG_ID = h.O' +
        'RG_ID)'
      
        '               left outer join SUBAREA s on (s.SUBAREA_ID = h.SU' +
        'BAREA_ID)'
      
        '               left outer join area a on (a.area_id = st.Area_Id' +
        ')'
      
        '               left outer join WORKGROUPS w on (w.WG_ID = h.WG_I' +
        'D)'
      
        '               left outer join headend he on (he.he_id = h.heade' +
        'nd_id)) ah'
      ''
      'order by CITY, Street_Name, House_No')
    UpdateCommand.Params = <>
    InsertCommand.Params = <>
    DeleteCommand.Params = <>
    GetrecCommand.Params = <>
    Left = 321
    Top = 208
  end
  object mtView: TMemTableEh
    AutoCalcFields = False
    FetchAllOnOpen = True
    Params = <>
    DataDriver = drvFIBView
    Options = [mtoTextFieldsCaseInsensitive]
    ReadOnly = True
    Left = 217
    Top = 208
  end
  object pmPopUp: TPopupMenu
    Left = 195
    Top = 135
    object mniFilterFLD: TMenuItem
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1079#1085#1072#1095#1077#1085#1080#1102
      OnClick = mniFilterFLDClick
    end
    object mniN1: TMenuItem
      Caption = '-'
    end
    object pmgCopy: TMenuItem
      Caption = '&'#1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = pmgCopyClick
    end
    object pmgSelectAll: TMenuItem
      Caption = '&'#1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnClick = pmgSelectAllClick
    end
    object pmgSep2: TMenuItem
      Caption = '-'
    end
    object pmgSaveSelection: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' &'#1082#1072#1082' ...'
      OnClick = pmgSaveSelectionClick
    end
    object miN1: TMenuItem
      Caption = '-'
    end
    object miN2: TMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = miN2Click
    end
  end
  object prntdbgrdh: TPrintDBGridEh
    DBGridEh = dbgView
    Options = []
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'Tahoma'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'Tahoma'
    PageHeader.Font.Style = []
    Units = MM
    Left = 448
    Top = 216
  end
end
