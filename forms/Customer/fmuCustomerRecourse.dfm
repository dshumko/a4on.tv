object apgCustomerRecourse: TapgCustomerRecourse
  Left = 0
  Top = 0
  Caption = #1054#1073#1088#1072#1097#1077#1085#1080#1103
  ClientHeight = 211
  ClientWidth = 687
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
  object dbgRecourses: TDBGridEh
    Left = 26
    Top = 0
    Width = 661
    Height = 211
    Align = alClient
    AllowedOperations = []
    BorderStyle = bsNone
    ColumnDefValues.ToolTips = True
    Ctl3D = False
    DataSource = srcRecourses
    DrawMemoText = True
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    OddRowColor = clWindow
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ParentCtl3D = False
    RowDetailPanel.Active = True
    RowDetailPanel.Height = 100
    RowDetailPanel.BevelEdges = []
    RowDetailPanel.BevelInner = bvNone
    RowDetailPanel.BevelOuter = bvNone
    RowDetailPanel.BorderStyle = bsNone
    RowDetailPanel.VertSizing = True
    RowHeight = 2
    RowLines = 1
    RowSizingAllowed = True
    SearchPanel.Enabled = True
    SearchPanel.FilterOnTyping = True
    STFilter.InstantApply = True
    STFilter.Local = True
    STFilter.Location = stflInTitleFilterEh
    STFilter.Visible = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    OnDblClick = dbgRecoursesDblClick
    OnGetCellParams = dbgRecoursesGetCellParams
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 53
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1054#1073#1088#1072#1097#1077#1085#1080#1077
        Title.TitleButton = True
        Width = 208
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        ShowImageAndText = True
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 214
        WordWrap = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CONTACT'
        Footers = <>
        Title.Caption = #1050#1086#1085#1090#1072#1082#1090
        Title.TitleButton = True
        Width = 119
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_BY'
        Footers = <>
        Title.Caption = #1055#1088#1080#1085#1103#1083
        Title.TitleButton = True
        Width = 92
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_ON'
        Footers = <>
        Title.Caption = #1082#1086#1075#1076#1072
        Title.TitleButton = True
        Width = 61
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_ON'
        Footers = <>
        Title.Caption = #1050#1086#1075#1076#1072' '#1080#1079#1084#1077#1085#1080#1083
        Title.TitleButton = True
        Width = 104
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_BY'
        Footers = <>
        Title.Caption = #1050#1090#1086' '#1080#1079#1084#1077#1085#1080#1083
        Title.TitleButton = True
        Width = 100
      end>
    object RowDetailData: TRowDetailPanelControlEh
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 626
        Height = 92
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbmNOTICE: TDBMemoEh
          Left = 0
          Top = 0
          Width = 626
          Height = 92
          TabStop = False
          Align = alClient
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Ctl3D = False
          DataField = 'NOTICE'
          DataSource = srcRecourses
          DynProps = <>
          EditButtons = <>
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          Visible = True
          WantReturns = True
        end
      end
    end
  end
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
      Action = actDelRec
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
      Action = actAddRec
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF008282820055555500555555006E6E6E006E6E
        6E0081818100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00E8E8E800555555006E6E6E00E6E6
        E600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00555555006E6E6E00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00ADADAD005555550055555500555555005555
        5500ADADAD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF005555550055555500DEDBD900FF00FF00FF00FF00DEDB
        D8005555550055555500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C2C2C20055555500FF00FF00FF00FF00CAA27C00CAA27C00FF00
        FF00FF00FF0055555500C4C4C400FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0055555500D8D5D300FF00FF00AE6E3000AE6E3000AE6E3000AE6E
        3000FF00FF00DAD6D10055555500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0055555500FF00FF00CAA27C00AE6E3000AE6E3000AE6E3000AE6E
        3000CAA27C00FF00FF0055555500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0055555500FF00FF00AC6D2F00AE6E3000AE6E3000AE6E3000AE6E
        3000AE6E3000FF00FF0055555500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0055555500FF00FF00AE6E3000AE6E3000AE6E3000AE6E3000AE6E
        3000AE6E3000FF00FF0055555500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00AE6E3000AE6E3000AE6E3000AE6E3000AE6E
        3000AE6E3000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00AE6E3000AE6E3000AE6E3000AE6E3000AE6E
        3000AE6E3000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00AE6E3000AE6E3000AE6E3000AE6E3000AE6E
        3000AE6E3000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00B0743A00AE6E3000AE6E3000AE6E3000AE6E
        3000AE723700FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00CBA57E00AE6E3000AE6E3000AE6E3000AE6E
        3000CAA37C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00CAA37C00AF723600AF713600CAA2
        7C00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object btnEdit1: TSpeedButton
      Left = 2
      Top = 31
      Width = 22
      Height = 22
      Action = actEditRec
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
  object dsRecourses: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    RECOURSE'
      'WHERE'
      '        RC_ID = :OLD_RC_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    *'
      '  from (select'
      '            0 REC_TYPE'
      '          , R.Rc_Id'
      '          , R.Rc_Type'
      '          , R.Customer_Id'
      '          , R.House_Id'
      '          , R.Flat_No'
      '          , R.Notice'
      '          , R.Added_By'
      '          , R.Added_On'
      '          , R.Edit_By'
      '          , R.Edit_On'
      '          , R.Rq_Id'
      '          , R.Contact'
      '          , rt.name'
      '          , o.o_name'
      '          from recourse r'
      
        '               inner join recourse_templates rt on (r.rc_type = ' +
        'rt.rt_id)'
      '               inner join objects o on (rt.type_id = o.o_id and'
      '                     o.o_type = 8)'
      
        '          where @@FILTER_BY%r.house_id = :house_id and r.flat_no' +
        ' = :flat_no@'
      '        union'
      '        select'
      '            1 REC_TYPE'
      '          , t.Id REC_ID'
      '          , null RC_TYPE'
      '          , null CUSTOMER_ID'
      '          , null HOUSE_ID'
      '          , null FLAT_NO'
      '          , l.Text NOTICE'
      '          , t.Added_By'
      '          , t.Plan_Date ADDED_ON'
      '          , l.Added_BY EDIT_BY'
      '          , l.Added_On EDIT_ON'
      '          , null RQ_ID'
      '          , null CONTRACT'
      '          , t.Notice NAME'
      
        '          , iif(t.Exec_Date is null, '#39#1047#1072#1076#1072#1095#1072'. '#39', '#39#1048#1089#1087'. '#39') || t.T' +
        'itle O_NAME'
      '          from Tasklist t'
      '               left outer join(select'
      '                                   m.Task_Id'
      '                                 , m.Text'
      '                                 , m.Added_On'
      '                                 , m.Added_By'
      '                                 from Taskmsg m'
      '                                 where m.Deleted = 0'
      
        '                                       and m.Id = (select first ' +
        '1'
      '                                                       l.Id'
      
        '                                                     from Taskms' +
        'g l'
      
        '                                                     where l.Tas' +
        'k_Id = m.Task_Id'
      
        '                                                     order by l.' +
        'Added_On desc)) l on (l.Task_Id = t.Id)'
      '          where t.Deleted = 0 -- and t.Exec_Date is null'
      '                and exists(select'
      '                               a.Task_Id'
      '                             from Taskmsg a'
      '                             where a.Task_Id = t.Id'
      '                                   and a.Obj_Id = :ACCOUNT_NO'
      '                                   and a.Obj_Type = '#39'A'#39'))'
      '  order by Added_on desc')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 170
    Top = 137
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcRecourses: TDataSource
    AutoEdit = False
    DataSet = dsRecourses
    Left = 56
    Top = 139
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 275
    Top = 134
    object actAddRec: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      ImageIndex = 49
      ShortCut = 119
      OnExecute = actAddRecExecute
    end
    object actEditRec: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      ImageIndex = 4
    end
    object actDelRec: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      ImageIndex = 3
      OnExecute = actDelRecExecute
    end
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
    Left = 376
    Top = 50
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
    Left = 332
    Top = 50
  end
end
