inherited FreqPlanForm: TFreqPlanForm
  Left = 381
  Top = 171
  Caption = #1063#1072#1089#1090#1086#1090#1085#1099#1081' '#1087#1083#1072#1085
  ClientHeight = 503
  ClientWidth = 987
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 193
    Width = 987
  end
  inherited dbGrid: TDBGridEh
    Top = 197
    Width = 987
    Height = 306
    AllowedOperations = [alopUpdateEh]
    DrawMemoText = True
    FooterRowCount = 1
    SortLocal = False
    SumList.Active = True
    OnGetCellParams = dbGridGetCellParams
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'wave'
        Footer.ValueType = fvtCount
        Footers = <>
        HideDuplicates = True
        Title.Caption = #1044#1083#1080#1085#1072' '#1074#1086#1083#1085#1099
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        HideDuplicates = True
        Title.Caption = #1053#1086#1084#1077#1088' '#1058#1042' '#1082#1072#1085#1072#1083#1072
        Title.TitleButton = True
        Width = 66
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'low_fq'
        Footers = <>
        HideDuplicates = True
        Title.Caption = #1063#1072#1089#1090#1086#1090#1085#1099#1077' '#1075#1088#1072#1085#1080#1094#1099' '#1082#1072#1085#1072#1083#1072', '#1052#1043#1094'|'#1085#1080#1078#1085#1103#1103
        Title.TitleButton = True
        Width = 74
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'high_fq'
        Footers = <>
        HideDuplicates = True
        Title.Caption = #1063#1072#1089#1090#1086#1090#1085#1099#1077' '#1075#1088#1072#1085#1080#1094#1099' '#1082#1072#1085#1072#1083#1072', '#1052#1043#1094'|'#1074#1077#1088#1093#1085#1103#1103
        Title.TitleButton = True
        Width = 85
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'video'
        Footers = <>
        HideDuplicates = True
        Title.Caption = #1053#1077#1089#1091#1097#1072#1103' '#1095#1072#1089#1090#1086#1090#1072', '#1052#1043#1094'|'#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
        Title.TitleButton = True
        Width = 79
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'sound'
        Footers = <>
        HideDuplicates = True
        Title.Caption = #1053#1077#1089#1091#1097#1072#1103' '#1095#1072#1089#1090#1086#1090#1072', '#1052#1043#1094'|'#1079#1074#1091#1082#1072
        Title.TitleButton = True
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'dtv'
        Footers = <>
        HideDuplicates = True
        Title.Caption = #1063#1072#1089#1090#1086#1090#1072' '#1076#1083#1103' '#1062#1058#1042', '#1052#1043#1094
        Title.TitleButton = True
        Width = 78
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Notice'
        Footers = <>
        HideDuplicates = True
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' / '#1044#1080#1072#1087#1072#1079#1086#1085
        Title.TitleButton = True
        Width = 130
      end
      item
        Alignment = taCenter
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_TYPE'
        Footers = <>
        Title.Caption = #1063#1090#1086' '#1080#1076#1077#1090'|'#1058#1080#1087
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_NUMBER'
        Footers = <>
        Title.Caption = #1063#1090#1086' '#1080#1076#1077#1090'|'#1053#1086#1084#1077#1088
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CH_NAME'
        Footer.FieldName = 'IS_CHANNEL'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1063#1090#1086' '#1080#1076#1077#1090'|'#1050#1072#1085#1072#1083
        Title.TitleButton = True
        Width = 82
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SRC_NAME'
        Footers = <>
        Title.Caption = #1063#1090#1086' '#1080#1076#1077#1090'|'#1048#1089#1090#1086#1095#1085#1080#1082
        Title.TitleButton = True
        Width = 54
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CARD_NAME'
        Footers = <>
        Title.Caption = #1063#1090#1086' '#1080#1076#1077#1090'|'#1050#1072#1088#1090#1072
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 987
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
    object btn1: TToolButton
      Left = 178
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 41
      Style = tbsSeparator
    end
    object btnPrint: TToolButton
      Left = 186
      Top = 0
      Action = actPrint
    end
  end
  inherited pnlEdit: TPanel
    Width = 987
    Height = 168
    ParentCtl3D = False
    object lbl2: TLabel [0]
      Left = 5
      Top = 9
      Width = 67
      Height = 13
      Caption = #1044#1083#1080#1085#1072' '#1074#1086#1083#1085#1099
    end
    object lbl3: TLabel [1]
      Left = 5
      Top = 91
      Width = 61
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object lbl5: TLabel [2]
      Left = 155
      Top = 9
      Width = 70
      Height = 13
      Caption = #1053#1086#1084#1077#1088' '#1082#1072#1085#1072#1083#1072
    end
    object lbl1: TLabel [3]
      Left = 30
      Top = 36
      Width = 195
      Height = 13
      Caption = #1063#1072#1089#1090#1086#1090#1085#1099#1077' '#1075#1088#1072#1085#1080#1094#1099' '#1082#1072#1085#1072#1083#1072', '#1052#1043#1094
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl4: TLabel [4]
      Left = 109
      Top = 63
      Width = 116
      Height = 13
      Caption = #1053#1077#1089#1091#1097#1072#1103' '#1095#1072#1089#1090#1086#1090#1072', '#1052#1043#1094
    end
    object lbl6: TLabel [5]
      Left = 392
      Top = 63
      Width = 111
      Height = 13
      Caption = 'C'#1088#1077#1076#1080#1085#1072' '#1087#1086#1083#1086#1089#1099', '#1052#1043#1094
    end
    inherited btnSaveLink: TBitBtn
      Left = 72
      Top = 137
      Width = 802
      TabOrder = 8
    end
    inherited btnCancelLink: TBitBtn
      Left = 884
      Top = 137
      Width = 98
      Cancel = True
      TabOrder = 9
    end
    object edtName: TDBEditEh
      Left = 75
      Top = 6
      Width = 75
      Height = 21
      DataField = 'WAVE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1052#1042' '#1044#1052#1042' '#1059#1050#1042
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dbmmoO_DESCRIPTION: TDBMemoEh
      Left = 72
      Top = 88
      Width = 910
      Height = 45
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'Notice'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 
        #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' / '#1044#1080#1072#1087#1072#1079#1086#1085'. '#1045#1089#1083#1080' '#1074' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1080' '#1073#1091#1076#1077#1090' '#1074#1089#1090#1088#1077#1095#1072#1090#1100#1089#1103' '#1089#1083#1086#1074#1086 +
        ' '#1055#1054#1052#1045#1061' ('#1087#1086#1084#1077#1093#1072' '#1087#1086#1084#1077#1093#1080') '#1090#1086' '#1089#1090#1088#1086#1082#1072' '#1073#1091#1076#1077#1090' '#1082#1088#1072#1089#1085#1086#1081
      ShowHint = True
      TabOrder = 7
      Visible = True
      WantReturns = True
    end
    object edtURL: TDBEditEh
      Left = 231
      Top = 6
      Width = 751
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1058#1042' '#1082#1072#1085#1072#1083#1072
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object ednLow: TDBNumberEditEh
      Left = 231
      Top = 33
      Width = 75
      Height = 21
      DataField = 'LOW_FQ'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = #1085#1080#1078#1085#1103#1103
      EditButtons = <>
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object ednHigh: TDBNumberEditEh
      Left = 312
      Top = 33
      Width = 75
      Height = 21
      DataField = 'HIGH_FQ'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = #1074#1077#1088#1093#1085#1103#1103
      EditButtons = <>
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object ednFQSOUND: TDBNumberEditEh
      Left = 312
      Top = 60
      Width = 75
      Height = 21
      DataField = 'SOUND'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = #1079#1074#1091#1082#1072
      EditButtons = <>
      ShowHint = True
      TabOrder = 5
      Visible = True
    end
    object ednFQVIDEO: TDBNumberEditEh
      Left = 231
      Top = 60
      Width = 75
      Height = 21
      DataField = 'VIDEO'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = #1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103
      EditButtons = <>
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
    object ednFQWAVE: TDBNumberEditEh
      Left = 505
      Top = 60
      Width = 75
      Height = 21
      DataField = 'DTV'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = #1062#1058#1042
      EditButtons = <>
      ShowHint = True
      TabOrder = 6
      Visible = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsFreqPlan
    OnDataChange = srcDataSourceDataChange
    Left = 256
    Top = 288
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
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
    object actPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      ImageIndex = 5
      OnExecute = actPrintExecute
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
  object dsFreqPlan: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE FREQPLAN'
      'SET '
      '    WAVE = :WAVE,'
      '    NAME = :NAME,'
      '    LOW_FQ = :LOW_FQ,'
      '    HIGH_FQ = :HIGH_FQ,'
      '    VIDEO = :VIDEO,'
      '    SOUND = :SOUND,'
      '    DTV = :DTV,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    FQ_ID = :OLD_FQ_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    FREQPLAN'
      'WHERE'
      '        FQ_ID = :OLD_FQ_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO FREQPLAN('
      '    FQ_ID,'
      '    WAVE,'
      '    NAME,'
      '    LOW_FQ,'
      '    HIGH_FQ,'
      '    VIDEO,'
      '    SOUND,'
      '    DTV,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :FQ_ID,'
      '    :WAVE,'
      '    :NAME,'
      '    :LOW_FQ,'
      '    :HIGH_FQ,'
      '    :VIDEO,'
      '    :SOUND,'
      '    :DTV,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    f.*'
      '  , c.*'
      '  , iif(c.I_TYPE is null, 0, 1) IS_CHANNEL'
      '  from FREQPLAN f'
      '       left outer join(select'
      '                           f.Fq_Id'
      '                         , 0 I_TYPE                           '
      '                         , '#39#1062#39' CH_TYPE'
      '                         , sc.Ch_Id'
      '                         , c.Ch_Name'
      '                         , SC.LCN Ch_Number'
      '                         , cs.Name SRC_NAME'
      '                         , ac.O_Name CARD_NAME'
      '                         , cs.Cs_Id SRC_ID'
      '                         , s.Dvbs_Id Dvbs_Id'
      '                         from Dvb_Streams s'
      
        '                              inner join Dvb_Stream_Channels sc ' +
        'on (sc.Dvbs_Id = s.Dvbs_Id)'
      
        '                              inner join channels c on (c.Ch_Id ' +
        '= sc.Ch_Id)'
      
        '                              inner join FREQPLAN f on (s.Freq >' +
        '= f.Low_Fq and'
      '                                    s.Freq < f.High_Fq)'
      
        '                              left outer join Channel_Src_Param ' +
        'csp on (c.Ch_Id = csp.Ch_Id and'
      '                                    csp.On_Dvb = 1)'
      
        '                              left outer join Channel_Src cs on ' +
        '(csp.Cs_Id = cs.Cs_Id)'
      
        '                              left outer join OBJECTS ac on (ac.' +
        'O_Id = csp.Card_Id and'
      '                                    ac.O_Type = 44)'
      '                       union'
      '                       select'
      '                           f.Fq_Id'
      '                         , 1 I_TYPE                           '
      '                         , '#39#1040#39' CH_TYPE'
      '                         , c.Ch_Id'
      '                         , c.Ch_Name'
      '                         , c.Ch_Number'
      '                         , cs.Name SRC_NAME'
      '                         , ac.O_Name CARD_NAME'
      '                         , cs.Cs_Id SRC_ID'
      '                         , null Dvbs_Id'
      '                         from channels c'
      
        '                              inner join FREQPLAN f on (c.Ch_Fre' +
        'q >= f.Low_Fq and'
      '                                    c.Ch_Freq < f.High_Fq)'
      
        '                              left outer join Channel_Src_Param ' +
        'csp on (c.Ch_Id = csp.Ch_Id and'
      '                                    csp.On_Dvb = 1)'
      
        '                              left outer join Channel_Src cs on ' +
        '(csp.Cs_Id = cs.Cs_Id)'
      
        '                              left outer join OBJECTS ac on (ac.' +
        'O_Id = csp.Card_Id and'
      
        '                                    ac.O_Type = 44)) c on (c.Fq_' +
        'Id = f.Fq_Id)'
      ' WHERE f.FQ_ID = :OLD_FQ_ID')
    SelectSQL.Strings = (
      'select'
      '    f.*'
      '  , c.*'
      '  , iif(c.I_TYPE is null, 0, 1) IS_CHANNEL'
      '  from FREQPLAN f'
      '       left outer join(select'
      '                           f.Fq_Id'
      '                         , 0 I_TYPE                           '
      '                         , '#39#1062#39' CH_TYPE'
      '                         , sc.Ch_Id'
      '                         , c.Ch_Name'
      '                         , SC.LCN Ch_Number'
      '                         , cs.Name SRC_NAME'
      '                         , ac.O_Name CARD_NAME'
      '                         , cs.Cs_Id SRC_ID'
      '                         , s.Dvbs_Id Dvbs_Id'
      '                         from Dvb_Streams s'
      
        '                              inner join Dvb_Stream_Channels sc ' +
        'on (sc.Dvbs_Id = s.Dvbs_Id)'
      
        '                              inner join channels c on (c.Ch_Id ' +
        '= sc.Ch_Id)'
      
        '                              inner join FREQPLAN f on (s.Freq >' +
        '= f.Low_Fq and'
      '                                    s.Freq < f.High_Fq)'
      
        '                              left outer join Channel_Src_Param ' +
        'csp on (c.Ch_Id = csp.Ch_Id and'
      '                                    csp.On_Dvb = 1)'
      
        '                              left outer join Channel_Src cs on ' +
        '(csp.Cs_Id = cs.Cs_Id)'
      
        '                              left outer join OBJECTS ac on (ac.' +
        'O_Id = csp.Card_Id and'
      '                                    ac.O_Type = 44)'
      '                       union'
      '                       select'
      '                           f.Fq_Id'
      '                         , 1 I_TYPE                           '
      '                         , '#39#1040#39' CH_TYPE'
      '                         , c.Ch_Id'
      '                         , c.Ch_Name'
      '                         , c.Ch_Number'
      '                         , cs.Name SRC_NAME'
      '                         , ac.O_Name CARD_NAME'
      '                         , cs.Cs_Id SRC_ID'
      '                         , null Dvbs_Id'
      '                         from channels c'
      
        '                              inner join FREQPLAN f on (c.Ch_Fre' +
        'q >= f.Low_Fq and'
      '                                    c.Ch_Freq < f.High_Fq)'
      
        '                              left outer join Channel_Src_Param ' +
        'csp on (c.Ch_Id = csp.Ch_Id and'
      '                                    csp.On_Dvb = 1)'
      
        '                              left outer join Channel_Src cs on ' +
        '(csp.Cs_Id = cs.Cs_Id)'
      
        '                              left outer join OBJECTS ac on (ac.' +
        'O_Id = csp.Card_Id and'
      
        '                                    ac.O_Type = 44)) c on (c.Fq_' +
        'Id = f.Fq_Id)'
      ''
      'order by Low_FQ, High_FQ, CH_TYPE, Ch_Number, Ch_Name')
    AutoUpdateOptions.UpdateTableName = 'FREQPLAN'
    AutoUpdateOptions.KeyFields = 'FQ_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 48
    Top = 296
    oFetchAll = True
  end
  object qryOIRT: TpFIBQuery
    Transaction = trWrite
    Database = dmMain.dbTV
    SQL.Strings = (
      'execute block as'
      'declare variable wl D_Varchar5; -- '#1044#1083#1080#1085#1072' '#1074#1086#1083#1085#1099
      'declare variable wn D_Varchar60; -- '#1044#1080#1072#1087#1072#1079#1086#1085
      'declare variable tvk D_Varchar5; -- '#1053#1086#1084#1077#1088' '#1058#1042' '#1082#1072#1085#1072#1083#1072
      
        'declare variable lf D_N15_2; --  '#1085#1080#1078#1085#1103#1103'  '#1063#1072#1089#1090#1086#1090#1085#1099#1077' '#1075#1088#1072#1085#1080#1094#1099' '#1082#1072#1085#1072#1083 +
        #1072' ('#1087#1086#1083#1086#1089#1099'), '#1052#1043#1094
      
        'declare variable hf D_N15_2; --  '#1074#1077#1088#1093#1085#1103#1103' '#1063#1072#1089#1090#1086#1090#1085#1099#1077' '#1075#1088#1072#1085#1080#1094#1099' '#1082#1072#1085#1072#1083 +
        #1072' ('#1087#1086#1083#1086#1089#1099'), '#1052#1043#1094
      
        'declare variable cfv D_N15_2; -- '#1053#1077#1089#1091#1097#1072#1103' '#1095#1072#1089#1090#1086#1090#1072' '#1080#1079#1086#1073#1088#1072#1078#1077#1085#1080#1103', '#1052#1043 +
        #1094' '#1040#1085#1072#1083#1086#1075#1086#1074#1086#1077' '#1090#1077#1083#1077#1074#1080#1076#1077#1085#1080#1077
      
        'declare variable cfa D_N15_2; -- '#1053#1077#1089#1091#1097#1072#1103' '#1095#1072#1089#1090#1086#1090#1072' '#1079#1074#1091#1082#1072', '#1052#1043#1094' '#1040#1085#1072#1083 +
        #1086#1075#1086#1074#1086#1077' '#1090#1077#1083#1077#1074#1080#1076#1077#1085#1080#1077
      
        'declare variable mf D_N15_2; --  ('#1089#1077#1088#1077#1076#1080#1085#1072' '#1087#1086#1083#1086#1089#1099'), '#1052#1043#1094' '#1063#1072#1089#1090#1086#1090#1072' ' +
        #1076#1083#1103' '#1085#1072#1089#1090#1088#1086#1081#1082#1080' '#1094#1080#1092#1088#1086#1074#1086#1075#1086' '#1090#1077#1083#1077#1074#1080#1076#1077#1085#1080#1103
      'begin'
      
        'wl='#39#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' I'#39'; tvk='#39'1'#39'; lf=48.5; hf=56.5;cfv=49.75' +
        '; cfa=56.25; mf=null;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' I'#39'; tvk='#39'2'#39'; lf=58; hf=66;cfv=59.25; cf' +
        'a=65.75; mf=null;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39#1055#1086#1083#1086#1089#1072'. '#1074#1099#1076#1077#1083#1077#1085#1085#1072#1103' '#1076#1083#1103' '#1089#1090#1077#1088#1077#1086#1092#1086#1085#1080#1095#1077#1089#1082#1086#1075#1086' '#1088#1072#1076#1080#1086#1074#1077#1097#1072#1085 +
        #1080#1103#39'; tvk='#39#39'; lf=65.9; hf=74;cfv=null; cfa=null; mf=null;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' II'#39'; tvk='#39'3'#39'; lf=76; hf=84;cfv=77.25; c' +
        'fa=83.75; mf=null;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' II'#39'; tvk='#39'4'#39'; lf=84; hf=92;cfv=85.25; c' +
        'fa=91.75; mf=null;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' II'#39'; tvk='#39'5'#39'; lf=92; hf=100;cfv=93.25; ' +
        'cfa=99.75; mf=null;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39#1055#1086#1083#1086#1089#1072'. '#1074#1099#1076#1077#1083#1077#1085#1085#1072#1103' '#1076#1083#1103' '#1089#1090#1077#1088#1077#1086#1092#1086#1085#1080#1095#1077#1089#1082#1086#1075#1086' '#1088#1072#1076#1080#1086#1074#1077#1097#1072#1085 +
        #1080#1103#39'; tvk='#39#39'; lf=100; hf=108;cfv=null; cfa=null; mf=null;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'1-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 1'#39'; lf=110; hf=118;c' +
        'fv=111.25; cfa=117.75; mf=114;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'2-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 2'#39'; lf=118; hf=126;c' +
        'fv=119.25; cfa=125.75; mf=122;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'3-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 3'#39'; lf=126; hf=134;c' +
        'fv=127.25; cfa=133.75; mf=130;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'4-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 4'#39'; lf=134; hf=142;c' +
        'fv=135.25; cfa=141.75; mf=138;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'5-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 5'#39'; lf=142; hf=150;c' +
        'fv=143.25; cfa=149.75; mf=146;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'6-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 6'#39'; lf=150; hf=158;c' +
        'fv=151.25; cfa=157.75; mf=154;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'7-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 7'#39'; lf=158; hf=166;c' +
        'fv=159.25; cfa=165.75; mf=162;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'8-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 8'#39'; lf=166; hf=174;c' +
        'fv=167.25; cfa=173.75; mf=170;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' III'#39'; tvk='#39'6'#39'; lf=174; hf=182;cfv=175.2' +
        '5; cfa=181.75; mf=178;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' III'#39'; tvk='#39'7'#39'; lf=182; hf=190;cfv=183.2' +
        '5; cfa=189.75; mf=186;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' III'#39'; tvk='#39'8'#39'; lf=190; hf=198;cfv=191.2' +
        '5; cfa=197.75; mf=194;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' III'#39'; tvk='#39'9'#39'; lf=198; hf=206;cfv=199.2' +
        '5; cfa=205.75; mf=202;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' III'#39'; tvk='#39'10'#39'; lf=206; hf=214;cfv=207.' +
        '25; cfa=213.75; mf=210;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' III'#39'; tvk='#39'11'#39'; lf=214; hf=222;cfv=215.' +
        '25; cfa=221.75; mf=218;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' III'#39'; tvk='#39'12'#39'; lf=222; hf=230;cfv=223.' +
        '25; cfa=229.75; mf=226;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'2-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 11'#39'; lf=230; hf=238;' +
        'cfv=231.25; cfa=237.75; mf=234;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'3-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 12'#39'; lf=238; hf=246;' +
        'cfv=239.25; cfa=245.75; mf=242;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'4-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 13'#39'; lf=246; hf=254;' +
        'cfv=247.25; cfa=253.75; mf=250;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'5-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 14'#39'; lf=254; hf=262;' +
        'cfv=255.25; cfa=261.75; mf=258;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'6-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 15'#39'; lf=262; hf=270;' +
        'cfv=263.25; cfa=269.75; mf=266;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'7-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 16'#39'; lf=270; hf=278;' +
        'cfv=271.25; cfa=277.75; mf=274;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'8-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 17'#39'; lf=278; hf=286;' +
        'cfv=279.25; cfa=285.75; mf=282;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'9-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 18'#39'; lf=286; hf=294;' +
        'cfv=287.25; cfa=293.75; mf=290;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1052#1042#39'; wn='#39'10-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072#39'; tvk='#39#1057#1050' 19'#39'; lf=294; hf=302' +
        ';cfv=295.25; cfa=301.75; mf=298;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'3-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 20'#39'; lf=' +
        '302; hf=310;cfv=303.25; cfa=309.75; mf=306;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'4-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 21'#39'; lf=' +
        '310; hf=318;cfv=311.25; cfa=317.75; mf=314;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'5-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 22'#39'; lf=' +
        '318; hf=326;cfv=319.25; cfa=325.75; mf=322;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'6-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 23'#39'; lf=' +
        '326; hf=334;cfv=327.25; cfa=333.75; mf=330;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'7-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 24'#39'; lf=' +
        '334; hf=342;cfv=335.25; cfa=341.75; mf=338;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'8-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 25'#39'; lf=' +
        '342; hf=350;cfv=343.25; cfa=349.75; mf=346;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'9-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 26'#39'; lf=' +
        '350; hf=358;cfv=351.25; cfa=357.75; mf=354;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'10-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 27'#39'; lf' +
        '=358; hf=366;cfv=359.25; cfa=365.75; mf=362;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'11-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 28'#39'; lf' +
        '=366; hf=374;cfv=367.25; cfa=373.75; mf=370;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'12-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 29'#39'; lf' +
        '=374; hf=382;cfv=375.25; cfa=381.75; mf=378;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'13-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 30'#39'; lf' +
        '=382; hf=390;cfv=383.25; cfa=389.75; mf=386;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'14-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 31'#39'; lf' +
        '=390; hf=398;cfv=391.25; cfa=397.75; mf=394;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'15-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 32'#39'; lf' +
        '=398; hf=406;cfv=399.25; cfa=405.75; mf=402;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'16-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 33'#39'; lf' +
        '=406; hf=414;cfv=407.25; cfa=413.75; mf=410;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'17-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 34'#39'; lf' +
        '=414; hf=422;cfv=415.25; cfa=421.75; mf=418;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'18-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 35'#39'; lf' +
        '=422; hf=430;cfv=423.25; cfa=429.75; mf=426;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'19-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 36'#39'; lf' +
        '=430; hf=438;cfv=431.25; cfa=437.75; mf=434;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'20-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 37'#39'; lf' +
        '=438; hf=446;cfv=439.25; cfa=445.75; mf=442;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'21-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 38'#39'; lf' +
        '=446; hf=454;cfv=447.25; cfa=453.75; mf=450;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'22-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 39'#39'; lf' +
        '=454; hf=462;cfv=455.25; cfa=461.75; mf=458;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39'23-'#1103' '#1082#1072#1073#1077#1083#1100#1085#1072#1103' '#1087#1086#1083#1086#1089#1072'. Hyperband'#39'; tvk='#39#1057#1050' 40'#39'; lf' +
        '=462; hf=470;cfv=463.25; cfa=469.75; mf=466;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' IV'#39'; tvk='#39'21'#39'; lf=470; hf=478;cfv=471.' +
        '25; cfa=477.75; mf=474;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' IV'#39'; tvk='#39'22'#39'; lf=478; hf=486;cfv=479.' +
        '25; cfa=485.75; mf=482;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' IV'#39'; tvk='#39'23'#39'; lf=486; hf=494;cfv=487.' +
        '25; cfa=493.75; mf=490;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' IV'#39'; tvk='#39'24'#39'; lf=494; hf=502;cfv=495.' +
        '25; cfa=501.75; mf=498;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' IV'#39'; tvk='#39'25'#39'; lf=502; hf=510;cfv=503.' +
        '25; cfa=509.75; mf=506;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' IV'#39'; tvk='#39'26'#39'; lf=510; hf=518;cfv=511.' +
        '25; cfa=517.75; mf=514;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' IV'#39'; tvk='#39'27'#39'; lf=518; hf=526;cfv=519.' +
        '25; cfa=525.75; mf=522;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' IV'#39'; tvk='#39'28'#39'; lf=526; hf=534;cfv=527.' +
        '25; cfa=533.75; mf=530;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' IV'#39'; tvk='#39'29'#39'; lf=534; hf=542;cfv=535.' +
        '25; cfa=541.75; mf=538;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' IV'#39'; tvk='#39'30'#39'; lf=542; hf=550;cfv=543.' +
        '25; cfa=549.75; mf=546;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' IV'#39'; tvk='#39'31'#39'; lf=550; hf=558;cfv=551.' +
        '25; cfa=557.75; mf=554;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' IV'#39'; tvk='#39'32'#39'; lf=558; hf=566;cfv=559.' +
        '25; cfa=565.75; mf=562;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' IV'#39'; tvk='#39'33'#39'; lf=566; hf=574;cfv=567.' +
        '25; cfa=573.75; mf=570;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' IV'#39'; tvk='#39'34'#39'; lf=574; hf=582;cfv=575.' +
        '25; cfa=581.75; mf=578;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'35'#39'; lf=582; hf=590;cfv=583.2' +
        '5; cfa=589.75; mf=586;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'36'#39'; lf=590; hf=598;cfv=591.2' +
        '5; cfa=597.75; mf=594;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'37'#39'; lf=598; hf=606;cfv=599.2' +
        '5; cfa=605.75; mf=602;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'38'#39'; lf=606; hf=614;cfv=607.2' +
        '5; cfa=613.75; mf=610;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'39'#39'; lf=614; hf=622;cfv=615.2' +
        '5; cfa=621.75; mf=618;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'40'#39'; lf=622; hf=630;cfv=623.2' +
        '5; cfa=629.75; mf=626;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'41'#39'; lf=630; hf=638;cfv=631.2' +
        '5; cfa=637.75; mf=634;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'42'#39'; lf=638; hf=646;cfv=639.2' +
        '5; cfa=645.75; mf=642;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'43'#39'; lf=646; hf=654;cfv=647.2' +
        '5; cfa=653.75; mf=650;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'44'#39'; lf=654; hf=662;cfv=655.2' +
        '5; cfa=661.75; mf=658;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'45'#39'; lf=662; hf=670;cfv=663.2' +
        '5; cfa=669.75; mf=666;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'46'#39'; lf=670; hf=678;cfv=671.2' +
        '5; cfa=677.75; mf=674;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'47'#39'; lf=678; hf=686;cfv=679.2' +
        '5; cfa=685.75; mf=682;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'48'#39'; lf=686; hf=694;cfv=687.2' +
        '5; cfa=693.75; mf=690;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'49'#39'; lf=694; hf=702;cfv=695.2' +
        '5; cfa=701.75; mf=698;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'50'#39'; lf=702; hf=710;cfv=703.2' +
        '5; cfa=709.75; mf=706;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'51'#39'; lf=710; hf=718;cfv=711.2' +
        '5; cfa=717.75; mf=714;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'52'#39'; lf=718; hf=726;cfv=719.2' +
        '5; cfa=725.75; mf=722;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'53'#39'; lf=726; hf=734;cfv=727.2' +
        '5; cfa=733.75; mf=730;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'54'#39'; lf=734; hf=742;cfv=735.2' +
        '5; cfa=741.75; mf=738;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'55'#39'; lf=742; hf=750;cfv=743.2' +
        '5; cfa=749.75; mf=746;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'56'#39'; lf=750; hf=758;cfv=751.2' +
        '5; cfa=757.75; mf=754;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'57'#39'; lf=758; hf=766;cfv=759.2' +
        '5; cfa=765.75; mf=762;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'58'#39'; lf=766; hf=774;cfv=767.2' +
        '5; cfa=773.75; mf=770;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'59'#39'; lf=774; hf=782;cfv=775.2' +
        '5; cfa=781.75; mf=778;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1058#1042'-'#1076#1080#1072#1087#1072#1079#1086#1085' V'#39'; tvk='#39'60'#39'; lf=782; hf=790;cfv=783.2' +
        '5; cfa=789.75; mf=786;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1082#1072#1073#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1087#1072#1079#1086#1085#39'; tvk='#39'61'#39'; lf=7' +
        '90; hf=798;cfv=791.25; cfa=797.75; mf=794;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1082#1072#1073#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1087#1072#1079#1086#1085#39'; tvk='#39'62'#39'; lf=7' +
        '98; hf=806;cfv=799.25; cfa=805.75; mf=802;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1082#1072#1073#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1087#1072#1079#1086#1085#39'; tvk='#39'63'#39'; lf=8' +
        '06; hf=814;cfv=807.25; cfa=813.75; mf=810;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1082#1072#1073#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1087#1072#1079#1086#1085#39'; tvk='#39'64'#39'; lf=8' +
        '14; hf=822;cfv=815.25; cfa=821.75; mf=818;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1082#1072#1073#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1087#1072#1079#1086#1085#39'; tvk='#39'65'#39'; lf=8' +
        '22; hf=830;cfv=823.25; cfa=829.75; mf=826;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1082#1072#1073#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1087#1072#1079#1086#1085#39'; tvk='#39'66'#39'; lf=8' +
        '30; hf=838;cfv=831.25; cfa=837.75; mf=834;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1082#1072#1073#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1087#1072#1079#1086#1085#39'; tvk='#39'67'#39'; lf=8' +
        '38; hf=846;cfv=839.25; cfa=845.75; mf=842;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1082#1072#1073#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1087#1072#1079#1086#1085#39'; tvk='#39'68'#39'; lf=8' +
        '46; hf=854;cfv=847.25; cfa=853.75; mf=850;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      
        'wl='#39#1044#1052#1042#39'; wn='#39#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1082#1072#1073#1077#1083#1100#1085#1099#1081' '#1076#1080#1072#1087#1072#1079#1086#1085#39'; tvk='#39'69'#39'; lf=8' +
        '54; hf=862;cfv=855.25; cfa=861.75; mf=858;'
      
        'insert into Freqplan (wave, Name, low_fq, high_fq, video, SOUND,' +
        ' DTV, Notice) values (:wl, :tvk, :lf, :hf, :cfv, :cfa, :mf, :wn)' +
        ';'
      'end')
    Left = 48
    Top = 368
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
    Left = 152
    Top = 364
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 208
    Top = 366
  end
end
