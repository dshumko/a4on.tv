object JournalForm: TJournalForm
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
  ClientHeight = 301
  ClientWidth = 642
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdJournal: TDBGridEh
    Left = 0
    Top = 0
    Width = 642
    Height = 301
    Align = alClient
    AllowedOperations = []
    AutoFitColWidths = False
    DataSource = srcJournal
    DrawMemoText = True
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
    STFilter.Local = True
    STFilter.Visible = True
    TabOrder = 0
    TitleParams.MultiTitle = True
    OnSortMarkingChanged = dbgrdJournalSortMarkingChanged
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'OPER_TIME'
        Footers = <>
        Title.Caption = #1042#1088#1077#1084#1103
        Title.TitleButton = True
        Width = 87
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'OPERATION'
        Footers = <>
        Title.Caption = #1044#1077#1081#1089#1090#1074#1080#1077
        Title.TitleButton = True
        Width = 82
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'OPER_WHAT'
        Footers = <>
        Title.Caption = #1050#1090#1086
        Title.TitleButton = True
        Width = 85
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'OPER_WHO'
        Footers = <>
        Title.Caption = #1063#1090#1086
        Title.TitleButton = True
        Width = 85
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'OPER_NOTE'
        Footers = <>
        Title.Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077
        Title.Hint = 
          #1079#1085#1072#1095#1077#1085#1080#1077' '#1076#1083#1103' '#1088#1072#1079#1085#1099#1093' '#1090#1080#1087#1086#1074#13#10#1055#1051#1040#1058#1045#1046'  - '#1083#1080#1094#1077#1074#1086#1081', '#1076#1072#1090#1072', '#1089#1091#1084#1084#1072', '#1087#1077#1085#1103#13 +
          #10#1040#1041#1054#1053#1045#1053#1058' - '#1083#1080#1094#1077#1074#1086#1081', '#1082#1086#1076', '#1076#1086#1083#1075#13#10#1080' '#1090'.'#1076'.'
        Title.TitleButton = True
        Width = 274
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object srcJournal: TDataSource
    DataSet = dsJournal
    Left = 200
    Top = 88
  end
  object dsJournal: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT Oper_Time,'
      'CASE Operation'
      ' when 0 then '#39#1091#1076#1072#1083#1077#1085#1080#1077#39
      ' when 1 then '#39#1076#1086#1073#1072#1074#1083#1077#1085#1080#1077#39
      ' when 2 then '#39#1080#1079#1084#1077#1085#1077#1085#1080#1077#39
      ' else '#39#1053#1077' '#1086#1087#1088#1077#1076#1077#1085#1072' -'#39'|| Operation'
      'end as OPERATION,'
      'Oper_What, Oper_Who, Oper_Note'
      'FROM Operation_Log'
      'order by Oper_time')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 199
    Top = 146
  end
end
