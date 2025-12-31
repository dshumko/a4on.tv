object JournalForm: TJournalForm
  Left = 0
  Top = 0
  Caption = #1046#1091#1088#1085#1072#1083' '#1080#1079#1084#1077#1085#1077#1085#1080#1081
  ClientHeight = 301
  ClientWidth = 894
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
    Width = 894
    Height = 301
    Align = alClient
    AllowedOperations = []
    DataSource = srcJournal
    DrawMemoText = True
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgMultiSelect]
    OptionsEh = [dghFixed3D, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
    SearchPanel.Enabled = True
    STFilter.Local = True
    STFilter.Visible = True
    TabOrder = 0
    TitleParams.MultiTitle = True
    OnSortMarkingChanged = dbgrdJournalSortMarkingChanged
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'LOG_GROUP'
        Footers = <>
        Title.Caption = #1054#1073#1098#1077#1082#1090
        Title.TitleButton = True
        Width = 96
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACT'
        Footers = <>
        Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
        Title.TitleButton = True
        Width = 74
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'OBJECT_ID'
        Footers = <>
        Title.Caption = #1048#1044' '#1086#1073#1098#1077#1082#1090#1072
        Title.TitleButton = True
        Width = 97
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PARAM'
        Footers = <>
        Title.Caption = #1055#1072#1088#1072#1084#1077#1090#1088
        Title.TitleButton = True
        Width = 114
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'VALUE_BEFORE'
        Footers = <>
        Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077'|'#1044#1086
        Title.TitleButton = True
        Width = 157
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'VALUE_AFTER'
        Footers = <>
        Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077'|'#1055#1086#1089#1083#1077
        Title.TitleButton = True
        Width = 140
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WHO_CHANGE'
        Footers = <>
        Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1090#1086
        Title.TitleButton = True
        Width = 78
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WHEN_CHANGE'
        Footers = <>
        Title.Caption = #1048#1079#1084#1077#1085#1080#1083'|'#1050#1086#1075#1076#1072
        Title.TitleButton = True
        Width = 71
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object srcJournal: TDataSource
    DataSet = dsJournal
    Left = 104
    Top = 152
  end
  object dsJournal: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    Log_Id'
      '  , Log_Group'
      '  , Act'
      '  , Object_Id'
      '  , Param'
      '  , Value_Before'
      '  , Value_After'
      '  , Who_Change'
      '  , When_Change'
      '  , Object_Type'
      '  from Changelog'
      'order by log_id desc')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 199
    Top = 146
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
    Left = 280
    Top = 150
  end
end
