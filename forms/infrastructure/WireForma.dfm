inherited WireForm: TWireForm
  Caption = #1050#1072#1073#1077#1083#1100#1085#1072#1103' '#1080#1085#1092#1088#1072#1089#1090#1088#1091#1082#1090#1091#1088#1072
  ClientHeight = 463
  ClientWidth = 914
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 57
    Width = 914
  end
  inherited dbGrid: TDBGridEh
    Top = 60
    Width = 914
    Height = 403
    AllowedOperations = [alopDeleteEh]
    FooterRowCount = 1
    SumList.Active = True
    OnGetCellParams = dbGridGetCellParams
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CT_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1082#1072#1073#1077#1083#1103
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 91
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MAT_NAME'
        Footers = <>
        Title.Caption = #1050#1072#1073#1077#1083#1100
        Title.TitleButton = True
        Width = 84
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'METERS'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1044#1083#1080#1085#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'STOCK'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1047#1072#1087#1072#1089
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
        Width = 120
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NODE_S'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1085#1072#1095#1072#1083#1100#1085#1099#1081'|'#1059#1079#1077#1083
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'S_STREET'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1085#1072#1095#1072#1083#1100#1085#1099#1081'|'#1059#1083#1080#1094#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'S_HOUSE'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1085#1072#1095#1072#1083#1100#1085#1099#1081'|'#1044#1086#1084
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'S_TYPE'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1085#1072#1095#1072#1083#1100#1085#1099#1081'|'#1058#1080#1087
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NODE_E'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1082#1086#1085#1077#1095#1085#1099#1081'|'#1059#1079#1077#1083
        Title.TitleButton = True
        Width = 72
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'E_STREET'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1082#1086#1085#1077#1095#1085#1099#1081'|'#1059#1083#1080#1094#1072
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'E_HOUSE'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1082#1086#1085#1077#1095#1085#1099#1081'|'#1044#1086#1084
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'E_TYPE'
        Footers = <>
        Title.Caption = #1059#1079#1077#1083' '#1082#1086#1085#1077#1095#1085#1099#1081'|'#1058#1080#1087
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 914
    inherited ToolButton6: TToolButton
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
    inherited ToolButton20: TToolButton
      Visible = False
    end
    object btnFilterNew: TToolButton
      Left = 178
      Top = 0
      Action = actFilterSet
      DropdownMenu = pmFilter
    end
    object btn1: TToolButton
      Left = 201
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 41
      Style = tbsSeparator
    end
    object btnPrint: TToolButton
      Left = 209
      Top = 0
      Action = actPrint
    end
  end
  inherited pnlEdit: TPanel
    Width = 914
    Height = 32
    inherited btnSaveLink: TBitBtn
      Top = -1
      Width = 728
    end
    inherited btnCancelLink: TBitBtn
      Left = 819
      Top = -1
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsWire
    Left = 200
    Top = 256
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    inherited actNew: TAction
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1074#1103#1079#1100
      OnExecute = actNewExecute
    end
    inherited actEdit: TAction [1]
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1089#1074#1103#1079#1100
      OnExecute = actEditExecute
    end
    inherited actDelete: TAction [2]
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1074#1103#1079#1100
    end
    object actPrint: TAction [3]
      Caption = 'actPrint'
      ImageIndex = 5
    end
    inherited actFilterFLD: TAction [4]
    end
    object actFilterSet: TAction [5]
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ImageIndex = 0
      ShortCut = 114
    end
    object actSetFilterNew: TAction [6]
      Caption = #1053#1086#1074#1099#1081' '#1092#1080#1083#1100#1090#1088
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1085#1086#1074#1099#1081' '#1092#1080#1083#1100#1090#1088' '#1089' '#1086#1095#1080#1089#1090#1082#1086#1081' '#1089#1090#1072#1088#1086#1075#1086
      ImageIndex = 0
      ShortCut = 8306
    end
    inherited actQuickFilter: TAction [7]
    end
    object actEnableFilter: TAction
      Caption = #1042#1082#1083'/'#1042#1099#1082#1083'. '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100'/'#1074#1099#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ShortCut = 16498
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 507
    Top = 199
  end
  inherited CnErrors: TCnErrorProvider
    Top = 24
  end
  object dsWire: TpFIBDataSet
    RefreshSQL.Strings = (
      'select'
      '    T.O_NAME CT_NAME'
      '  , t.O_Dimension COLOR'
      '  , C.*'
      '  , m.NAME MAT_NAME'
      '  , s.Node_Id NODE_S_ID'
      '  , s.Name NODE_S'
      '  , e.Node_Id NODE_E_ID'
      '  , e.Name NODE_E'
      '  , ST.O_Name S_TYPE'
      '  , SS.Street_Name || '#39' '#39' || SS.street_short S_STREET'
      '  , SH.House_No S_HOUSE'
      '  , ET.O_Name E_TYPE'
      '  , ES.Street_Name || '#39' '#39' || ES.street_short E_STREET'
      '  , EH.House_No E_HOUSE'
      '  from Wire C'
      
        '       inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O_TYPE = ' +
        '56)'
      ''
      '       inner join NODEs s on (s.Node_Id = c.Point_S)'
      '       inner join HOUSE SH on (SH.HOUSE_ID = S.HOUSE_ID)'
      '       inner join STREET SS on (SS.STREET_ID = SH.STREET_ID)'
      
        '       inner join objects ST on (ST.O_Id = s.Type_Id and ST.O_Ty' +
        'pe = 38)'
      ''
      '       left outer join MATERIALS m on (m.M_Id =  c.M_ID)'
      ''
      '       left outer join NODEs e on (e.Node_Id = c.Point_E)'
      '       left outer join HOUSE EH on (EH.HOUSE_ID = E.HOUSE_ID)'
      
        '       left outer join STREET ES on (ES.STREET_ID = EH.STREET_ID' +
        ')'
      
        '       left outer join objects ET on (ET.O_Id = e.Type_Id and ET' +
        '.O_Type = 38)'
      ''
      ' WHERE '
      '        C.WID = :OLD_WID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    T.O_NAME CT_NAME'
      '  , t.O_Dimension COLOR'
      '  , C.*'
      '  , m.NAME MAT_NAME'
      '  , s.Node_Id NODE_S_ID'
      '  , s.Name NODE_S'
      '  , e.Node_Id NODE_E_ID'
      '  , e.Name NODE_E'
      '  , ST.O_Name S_TYPE'
      '  , SS.Street_Name || '#39' '#39' || SS.street_short S_STREET'
      '  , SH.House_No S_HOUSE'
      '  , ET.O_Name E_TYPE'
      '  , ES.Street_Name || '#39' '#39' || ES.street_short E_STREET'
      '  , EH.House_No E_HOUSE'
      '  from Wire C'
      
        '       inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O_TYPE = ' +
        '56)'
      ''
      '       inner join NODEs s on (s.Node_Id = c.Point_S)'
      '       inner join HOUSE SH on (SH.HOUSE_ID = S.HOUSE_ID)'
      '       inner join STREET SS on (SS.STREET_ID = SH.STREET_ID)'
      
        '       inner join objects ST on (ST.O_Id = s.Type_Id and ST.O_Ty' +
        'pe = 38)'
      ''
      '       left outer join MATERIALS m on (m.M_Id =  c.M_ID)'
      ''
      '       left outer join NODEs e on (e.Node_Id = c.Point_E)'
      '       left outer join HOUSE EH on (EH.HOUSE_ID = E.HOUSE_ID)'
      
        '       left outer join STREET ES on (ES.STREET_ID = EH.STREET_ID' +
        ')'
      
        '       left outer join objects ET on (ET.O_Id = e.Type_Id and ET' +
        '.O_Type = 38)')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 200
    Top = 192
  end
  object frxReport: TfrxReport
    Version = '2021.2.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.MDIChild = True
    PreviewOptions.Modal = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38761.722679213000000000
    ReportOptions.LastChange = 41847.539245937500000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnUserFunction = frxReportUserFunction
    Left = 488
    Top = 136
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
    Left = 272
    Top = 190
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
    Left = 272
    Top = 252
  end
  object pmFilter: TPopupMenu
    Left = 655
    Top = 186
    object N31: TMenuItem
      Caption = #1042#1082#1083'/'#1042#1099#1082#1083'. '#1092#1080#1083#1100#1090#1088
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100'/'#1074#1099#1082#1083#1102#1095#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      ShortCut = 16498
    end
    object N53: TMenuItem
      Action = actSetFilterNew
    end
    object N42: TMenuItem
      Caption = '-'
    end
    object N36: TMenuItem
      Action = actQuickFilter
    end
  end
end
