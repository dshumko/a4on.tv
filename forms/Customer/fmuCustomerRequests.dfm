object apgCustomerRequests: TapgCustomerRequests
  Left = 0
  Top = 0
  Caption = #1047#1072#1103#1074#1082#1080
  ClientHeight = 239
  ClientWidth = 1068
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object dbGridCustReq: TDBGridEh
    Left = 26
    Top = 0
    Width = 1042
    Height = 239
    Align = alClient
    AllowedOperations = []
    DataGrouping.DefaultStateExpanded = True
    DataSource = srcRequests
    DynProps = <>
    EditActions = [geaCopyEh, geaSelectAllEh]
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    OddRowColor = clWindow
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
    ReadOnly = True
    SortLocal = True
    STFilter.Local = True
    STFilter.Location = stflInTitleFilterEh
    STFilter.Visible = True
    SumList.Active = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    OnDblClick = dbGridCustReqDblClick
    OnGetCellParams = dbGridCustReqGetCellParams
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RQ_ID'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #8470#13#10#1079#1072#1103#1074#1082#1080
        Title.TitleButton = True
        Width = 57
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DisplayFormat = 'DD.MM.YY'
        DynProps = <>
        EditButtons = <>
        FieldName = 'RQ_PLAN_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072'|'#1055#1083#1072#1085
        Title.TitleButton = True
        Width = 65
      end
      item
        CellButtons = <>
        DisplayFormat = 'HH:MM'
        DynProps = <>
        EditButtons = <>
        EditMask = 'HH:MM'
        FieldName = 'RQ_TIME_FROM'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072'|'#1089
        Title.TitleButton = True
        Width = 29
      end
      item
        CellButtons = <>
        DisplayFormat = 'HH:MM'
        DynProps = <>
        EditButtons = <>
        EditMask = 'HH:MM'
        FieldName = 'RQ_TIME_TO'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072'|'#1087#1086
        Title.TitleButton = True
        Width = 26
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DisplayFormat = 'DD.MM.YY'
        DynProps = <>
        EditButtons = <>
        FieldName = 'GIV_EXEC_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072'|'#1042#1099#1076'/'#1042#1099#1087
        Title.TitleButton = True
        Width = 60
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CONTETNT'
        Footers = <>
        Title.Caption = #1053#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100'|'#1047#1072#1103#1074#1083#1077#1085#1085#1072#1103
        Width = 151
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'TROUBLE'
        Footers = <>
        Title.Caption = #1053#1077#1080#1089#1087#1088#1072#1074#1085#1086#1089#1090#1100'|'#1042#1099#1103#1074#1083#1077#1085#1085#1072#1103
        Title.TitleButton = True
        Width = 161
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RT_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 80
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RES_TEXT'
        Footers = <>
        Title.Caption = #1057#1090#1072#1090#1091#1089
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'TEAM'
        Footers = <>
        Title.Caption = #1047#1074#1077#1085#1086
        Title.TitleButton = True
        Width = 77
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WORKMANS'
        Footers = <>
        Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080
        Title.TitleButton = True
        Width = 78
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RQ_NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 100
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_BY'
        Footers = <>
        Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1072'|'#1050#1077#1084
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DisplayFormat = 'dd.mm.yy hh:nn'
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_ON'
        Footers = <>
        Title.Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1072'|'#1050#1086#1075#1076#1072
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_BY'
        Footers = <>
        Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1090#1086
        Title.TitleButton = True
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DisplayFormat = 'dd.mm.yy hh:nn'
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_ON'
        Footers = <>
        Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1086#1075#1076#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACCOUNT_NO'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1051#1080#1094#1077#1074#1086#1081
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FIO'
        Footers = <>
        Title.Caption = #1040#1073#1086#1085#1077#1085#1090'|'#1060#1048#1054
        OnGetCellParams = dbGridCustReqColumns17GetCellParams
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STREET_NAME'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1059#1083#1080#1094#1072
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'HOUSE_NO'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1044#1086#1084
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FLAT_NO'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089'|'#1050#1074'.'
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 239
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      26
      239)
    object btnDel1: TSpeedButton
      Left = 2
      Top = 216
      Width = 22
      Height = 22
      Action = actDel
      Anchors = [akLeft, akBottom]
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008C98D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008390D500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008693D600334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00465CCE00334CCC007584D300FF00FF00FF00FF00FF00FF00909C
        D700334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00
        FF00465CCE00334CCC00334CCC00334CCC00808ED500FF00FF00FF00FF00FF00
        FF00445ACE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00465C
        CE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00445ACE00334CCC00334CCC00334CCC003D54CD00455BCE00334C
        CC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334CCC00334C
        CC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334C
        CC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334C
        CC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334CCC00334C
        CC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00465CCE00334CCC00334CCC00334CCC004057CD00445ACE00334C
        CC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00465CCE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00445A
        CE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00ABB2
        DA00364ECC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
        FF00445ACE00334CCC00334CCC00354DCC00A4ACD900FF00FF00FF00FF00FF00
        FF00A7AFDA00364ECC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00445ACE00354DCC00A2ABD900FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A9B1DA00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00A6AED900FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Layout = blGlyphTop
    end
    object btnAdd1: TSpeedButton
      Left = 2
      Top = 3
      Width = 22
      Height = 22
      Action = actAdd
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00D2BE
        AB00B6814D00B1753A00B0723600B1743A00B6804C00D3C1B000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00939393007A7A7A0088888800FF00FF00B375
        3700B0723600B0723600B0723600B0723600B0723600B0723600FF00FF00FF00
        FF00FF00FF008686860061616100626262007E7E7E0091919100FF00FF00B67D
        4300B0723600B0723600B0723600B0723600B0723600B7824F00FF00FF00FF00
        FF007373730061616100A3A3A300EFEFEF00FFFFFF00FFFFFF00EBEBEB00FF00
        FF00B0723600B3794200FF00FF00B6814D00B0723600FF00FF00FF00FF008282
        820061616100C2C2C200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFCFC00FF00
        FF00FF00FF00FF00FF00C5A28000FF00FF00FF00FF00FF00FF00BBBBBB006161
        61009D9D9D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
        FF00D3BCA600B0723600B0723600B0723600CCAE9100FF00FF008B8B8B006161
        6100EAEAEA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FF00
        FF00BA7F4400B0723600B0723600B0723600B3753700FF00FF006F6F6F007979
        7900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00F1E7DD00F3EAE200FF00
        FF00C2946500B0723600B0723600B0723600BA855100FF00FF00656565008888
        8800FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5ECE500AF713400AF713400C8A9
        8C00FF00FF00B6804C00B0723600B3794200FF00FF00FF00FF006D6D6D007D7D
        7D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7F0EA00AF713400F3EBE200FCFB
        FA00EDEDED00FF00FF00FF00FF00FF00FF00B7B7B700FF00FF00858585006363
        6300F1F1F100FFFFFF00FFFFFF00FFFFFF00FCFBF900AF723600FDFDFC00FFFF
        FF00FFFFFF00FCFCFC00EBEBEB006C6C6C0088888800FF00FF00B1B1B1006161
        6100ADADAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BC875400FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00AAAAAA0061616100B4B4B400FF00FF00FF00FF007777
        770064646400D6D6D600FFFFFF00FFFFFF00FFFFFF00D2B08E00FFFFFF00FFFF
        FF00FFFFFF00D4D4D4006363630079797900FF00FF00FF00FF00FF00FF00FF00
        FF006969690066666600BCBCBC00FCFCFC00FFFFFF00FAF6F100FFFFFF00FBFB
        FB00BABABA00656565006B6B6B00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0074747400616161006F6F6F0098989800A6A6A600979797006E6E
        6E006161610076767600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00ADADAD007F7F7F006666660061616100666666008080
        8000AEAEAE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object btnEdit1: TSpeedButton
      Left = 2
      Top = 31
      Width = 22
      Height = 22
      Action = actEdit
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00A96A2B00CDB59E00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008E8E
        8E005A5A5A0060606000FF00FF00CFBAA500AB6B2B00A96A2B00FF00FF00FF00
        FF00ABABAB005A5A5A008B8B8B00FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00EEEEEE00FF00FF00A96A2B00FF00FF00FF00FF00A96A
        2B00FF00FF00EDEDED005A5A5A00FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FBFBFB00FF00FF00FF00FF00FF00FF00AB6B2B00AC6F
        3100A96A2B00FF00FF00ABABAB00FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00F8F8F800FF00FF00A96A2B00AD713400AB6B
        2B00AC6F3100A96A2B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00F8F8F800FF00FF00A96A2B00AD71
        3400AB6B2B00AC6F3100A96A2B00FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F800FF00FF00A96A
        2B00AD713400AB6B2B00AC6F3100A96A2B00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8F800FF00
        FF00A96A2B00AD713400AB6B2B00AC6F3100FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8F8
        F800FF00FF00A96A2B00AD713400FF00FF00FF00FF00A96A2B00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00F8F8F800FF00FF00FF00FF00FF00FF00A96A2B00A96A2B00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFE
        FE00FEFEFE00F6F6F600FF00FF00A96A2B00A96A2B00D3C2B200FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00959595005A5A
        5A005A5A5A005A5A5A0070707000FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A5A5A00FEFE
        FE00FFFFFF00BBBBBB0080808000FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A5A5A00FEFE
        FE00BCBCBC007D7D7D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF005A5A
        5A00FDFDFD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005A5A5A00BCBC
        BC007C7C7C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008E8E
        8E005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A005A5A5A007F7F
        7F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object dsRequests: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE REQUEST'
      'SET '
      '    RQ_EXEC_TIME = LOCALTIMESTAMP,'
      '    REQ_RESULT = :REQ_RESULT'
      'WHERE'
      '    RQ_ID = :OLD_RQ_ID'
      '    ')
    RefreshSQL.Strings = (
      'SELECT r.RQ_ID, '
      'r.RQ_TYPE, '
      'R.added_on RQ_DATE, '
      'r.RQ_CUSTOMER, '
      'r.RQ_COMPLETED,'
      'r.RQ_PLAN_DATE,'
      'coalesce(tpl.rq_content,'#39#39')||Coalesce('#39'.'#39'||r.add_info,'#39#39')||'
      
        '  iif(coalesce(r.Rq_Content,'#39#39') <> '#39#39', coalesce('#39' ('#39'||r.Rq_Conte' +
        'nt||'#39')'#39','#39#39'),'#39#39') '
      '  as contetnt,'
      
        'coalesce(rr.name,'#39#39')||'#39' '#39'||coalesce(r.Rq_Defect, '#39#39')  as trouble' +
        ','
      'r.Rq_Content,'
      'r.Rq_Defect,'
      'r.RQ_NOTICE,'
      'r.EDIT_BY,'
      'r.EDIT_ON, '
      'r.HOUSE_ID, '
      'r.PHONE, '
      'r.ADDED_BY, '
      'r.ADDED_ON, '
      'r.RQ_TIME_FROM,'
      'r.RQ_TIME_TO,'
      
        'coalesce(cast(r.RQ_EXEC_TIME as date), cast(r.RQ_COMPLETED as da' +
        'te)) as GIV_EXEC_DATE,'
      
        'iif(cast(r.RQ_COMPLETED as date) is null,r.RQ_TIME_FROM, lpad(ex' +
        'tract(HOUR from r.RQ_COMPLETED),2,'#39'0'#39')||'#39':'#39'||extract(minute from' +
        ' r.RQ_COMPLETED)) as G_E_FROM,'
      
        'iif(cast(r.RQ_EXEC_TIME as date) is null,r.RQ_TIME_TO, extract(H' +
        'OUR from r.RQ_EXEC_TIME)||'#39':'#39'||extract(minute from r.RQ_EXEC_TIM' +
        'E)) as G_E_TO,'
      'r.RQ_EXEC_TIME,'
      'r.GIVE_BY, '
      'r.GIVE_METHOD, '
      'r.REQ_RESULT,'
      'c.ACCOUNT_NO, c.CUST_CODE, c.SURNAME ||'#39' '#39' ||c.INITIALS as FIO, '
      
        'coalesce(RT.RT_PRINTFORM,'#39#39') as REPORT, coalesce(rt.RT_Name,'#39#39') ' +
        'as Rt_Name,'
      's.STREET_NAME||'#39' '#39'||s.street_short as STREET_NAME,'
      'h.HOUSE_NO,'
      'coalesce(r.flat_no,'#39#39') as FLAT_NO,'
      'CASE R.Req_Result'
      ' when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      ' when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      ' when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      ' when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      'end as Res_text,'
      '--rt.O_Numericfield as DAYS,'
      '1 as DAYS,'
      
        'coalesce(cast((select list(DISTINCT w.team) from Request_Executo' +
        'rs re inner join Worker w on (re.Exec_Id = w.Worker_Id) where re' +
        '.Rq_Id = r.Rq_Id) as VARCHAR(200)),'
      'wg.name) as TEAM,'
      
        'cast((select list(DISTINCT w.surname) from Request_Executors re ' +
        'inner join Worker w on (re.Exec_Id = w.Worker_Id) where re.Rq_Id' +
        ' = r.Rq_Id) as VARCHAR(200)) as workmans,'
      'coalesce(tpl.RQ_COLOR, RT.RT_COLOR) RT_COLOR,'
      'hf.PORCH_N,'
      'hf.FLOOR_N'
      ''
      'FROM REQUEST R'
      '   inner join house h on (r.house_id = h.house_id)'
      '   inner join street s on (s.street_id = h.street_id)'
      '   left outer join workgroups wg on (wg.wg_id = h.wg_id)'
      '   LEFT OUTER JOIN REQUEST_TYPES RT ON (R.RQ_TYPE = RT.RT_Id)'
      '   LEFT OUTER JOIN CUSTOMER C ON (R.RQ_CUSTOMER = C.CUSTOMER_ID)'
      
        '   left outer join request_templates tpl on (tpl.rqtl_id = r.rqt' +
        'l_id)'
      
        '   left outer join request_results rr on (rr.rr_id = r.result_id' +
        ')'
      
        '   left outer join HOUSEFLATS hf on (hf.house_id = r.house_id an' +
        'd hf.flat_no = r.flat_no)'
      ' WHERE '
      '        R.RQ_ID = :OLD_RQ_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    r.RQ_ID'
      '  , r.RQ_TYPE'
      '  , R.added_on RQ_DATE'
      '  , r.RQ_CUSTOMER'
      '  , r.RQ_COMPLETED'
      '  , r.RQ_PLAN_DATE'
      
        '  , coalesce(tpl.rq_content, '#39#39') || coalesce('#39'.'#39' || r.add_info, ' +
        #39#39') || iif(coalesce(r.Rq_Content, '#39#39') <> '#39#39', coalesce('#39' ('#39' || r.' +
        'Rq_Content || '#39')'#39', '#39#39'), '#39#39') as contetnt'
      
        '  , coalesce(rr.name, '#39#39') || '#39' '#39' || coalesce(r.Rq_Defect, '#39#39') as' +
        ' trouble'
      '  , r.Rq_Content'
      '  , r.Rq_Defect'
      '  , r.RQ_NOTICE'
      '  , r.EDIT_BY'
      '  , r.EDIT_ON'
      '  , r.HOUSE_ID'
      '  , r.PHONE'
      '  , r.ADDED_BY'
      '  , r.ADDED_ON'
      '  , r.RQ_TIME_FROM'
      '  , r.RQ_TIME_TO'
      
        '  , coalesce(cast(r.RQ_EXEC_TIME as date), cast(r.RQ_COMPLETED a' +
        's date)) as GIV_EXEC_DATE'
      '  , r.RQ_EXEC_TIME'
      '  , r.GIVE_BY'
      '  , r.GIVE_METHOD'
      '  , r.REQ_RESULT'
      '  , c.ACCOUNT_NO'
      '  , c.CUST_CODE'
      '  , c.SURNAME || '#39' '#39' || c.INITIALS as FIO'
      '  , coalesce(RT.RT_PRINTFORM, '#39#39') as REPORT'
      '  , coalesce(rt.RT_Name, '#39#39') as Rt_Name'
      '  , s.STREET_NAME || '#39' '#39' || s.street_short as STREET_NAME'
      '  , h.HOUSE_NO'
      '  , coalesce(r.flat_no, '#39#39') as FLAT_NO'
      '  ,'
      '    case R.Req_Result'
      '      when 1 then '#39#1042#1099#1076#1072#1085#1072#39
      '      when 2 then '#39#1042#1099#1087#1086#1083#1085#1077#1085#1072#39
      '      when 3 then '#39#1054#1090#1084#1077#1085#1077#1085#1072#39
      '      when 4 then '#39#1053#1077#1074#1086#1079#1084#1086#1078#1085#1086#39
      '    end as Res_text,'
      '    --rt.O_Numericfield as DAYS,'
      '    1 as DAYS'
      '  , coalesce(cast((select'
      '                       list(distinct w.team)'
      '                     from Request_Executors re'
      
        '                          inner join Worker w on (re.Exec_Id = w' +
        '.Worker_Id)'
      
        '                     where re.Rq_Id = r.Rq_Id) as varchar(200)),' +
        ' wg.name) as TEAM'
      '  , cast((select'
      '              list(distinct w.surname)'
      '            from Request_Executors re'
      
        '                 inner join Worker w on (re.Exec_Id = w.Worker_I' +
        'd)'
      
        '            where re.Rq_Id = r.Rq_Id) as varchar(200)) as workma' +
        'ns'
      '  , coalesce(tpl.RQ_COLOR, RT.RT_COLOR) RT_COLOR'
      '  , hf.PORCH_N'
      '  , hf.FLOOR_N'
      '  , r.Node_Id'
      '  from REQUEST R'
      '       inner join house h on (r.house_id = h.house_id)'
      '       inner join street s on (s.street_id = h.street_id)'
      '       left outer join workgroups wg on (wg.wg_id = h.wg_id)'
      
        '       left outer join REQUEST_TYPES RT on (R.RQ_TYPE = RT.RT_Id' +
        ')'
      
        '       left outer join CUSTOMER C on (R.RQ_CUSTOMER = C.CUSTOMER' +
        '_ID)'
      
        '       left outer join request_templates tpl on (tpl.rqtl_id = r' +
        '.rqtl_id)'
      
        '       left outer join request_results rr on (rr.rr_id = r.resul' +
        't_id)'
      
        '       left outer join HOUSEFLATS hf on (hf.house_id = r.house_i' +
        'd and hf.flat_no = r.flat_no)'
      ''
      '         ')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 86
    Top = 38
  end
  object srcRequests: TDataSource
    AutoEdit = False
    DataSet = dsRequests
    Left = 88
    Top = 91
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 195
    Top = 54
    object actAdd: TAction
      Hint = #1055#1088#1080#1085#1103#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1086#1090' '#1072#1073#1086#1085#1077#1085#1090#1072
      ImageIndex = 37
      ShortCut = 116
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actDel: TAction
      Hint = 
        #1054#1090#1084#1077#1085#1080#1090#1100' '#1079#1072#1103#1074#1082#1091' ('#1087#1086#1089#1090#1072#1074#1080#1090#1100' '#1089#1090#1072#1090#1091#1089' '#1086#1090#1084#1077#1085#1077#1085#1072', '#1085#1086' '#1085#1077' '#1091#1076#1072#1083#1103#1090#1100' '#1079#1072#1103#1074#1082#1091 +
        ')'
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
    Left = 172
    Top = 130
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
    Left = 216
    Top = 130
  end
end
