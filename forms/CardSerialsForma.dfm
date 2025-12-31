object fmCardPaySerials: TfmCardPaySerials
  ShowHint = True
  Left = 479
  Top = 349
  Caption = #1057#1077#1088#1080#1080' '#1082#1072#1088#1090' '#1086#1087#1083#1072#1090
  ClientHeight = 329
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = mm1
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdhGrid: TDBGridEh
    Left = 0
    Top = 25
    Width = 452
    Height = 304
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    AutoFitColWidths = False
    DataSource = srcSerials
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
    SortLocal = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CS_SERIAL'
        Footers = <>
        Title.Caption = #1057#1045#1056#1048#1071
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PAYSOURCE_DESCR'
        Footers = <>
        Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082' '#1087#1083#1072#1090#1077#1078#1072
        Title.TitleButton = True
        Width = 108
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CS_NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 250
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object tlb1: TToolBar
    Left = 0
    Top = 0
    Width = 452
    Height = 25
    Caption = 'tlb1'
    Images = A4MainForm.ICONS_ACTIVE
    TabOrder = 0
    object btn1: TToolButton
      Left = 0
      Top = 0
      Width = 5
      Caption = 'btn1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnNew: TToolButton
      Left = 5
      Top = 0
      Action = actNew
    end
    object btn3: TToolButton
      Left = 28
      Top = 0
      Width = 4
      Caption = 'btn3'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnEdit: TToolButton
      Left = 32
      Top = 0
      Action = actEdit
    end
    object btn5: TToolButton
      Left = 55
      Top = 0
      Width = 4
      Caption = 'btn5'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object btnDelete: TToolButton
      Left = 59
      Top = 0
      Action = actDelete
    end
  end
  object mm1: TMainMenu
    Left = 128
    Top = 205
    object N1: TMenuItem
      Caption = #1057#1077#1088#1080#1080' '#1082#1072#1088#1090
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
        Action = actDelete
      end
    end
  end
  object srcSerials: TDataSource
    AutoEdit = False
    DataSet = dsserials
    Left = 72
    Top = 56
  end
  object dsserials: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CARDS_SERIALS'
      'WHERE'
      '        CS_ID = :OLD_CS_ID'
      '    ')
    RefreshSQL.Strings = (
      'SELECT '
      '    Cs.Cs_Serial,'
      '    Cs.Cs_Id,'
      '    Cs.Cs_Source_Id,'
      '    Cs.Cs_Notice,'
      '    Ps.Paysource_Descr'
      'FROM Cards_Serials Cs'
      
        '   LEFT OUTER JOIN Paysource Ps ON (Cs.Cs_Source_Id = Ps.Paysour' +
        'ce_Id)'
      ''
      ' WHERE '
      '        CS.CS_ID = :OLD_CS_ID'
      '    ')
    SelectSQL.Strings = (
      'SELECT '
      '    Cs.Cs_Serial,'
      '    Cs.Cs_Id,'
      '    Cs.Cs_Source_Id,'
      '    Cs.Cs_Notice,'
      '    Ps.Paysource_Descr'
      'FROM Cards_Serials Cs'
      
        '   LEFT OUTER JOIN Paysource Ps ON (Cs.Cs_Source_Id = Ps.Paysour' +
        'ce_Id)')
    AutoUpdateOptions.UpdateTableName = 'AREA'
    AutoUpdateOptions.KeyFields = 'AREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 184
    Top = 56
  end
  object actlstactions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 270
    Top = 56
    object actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1077#1088#1080#1102
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1077#1088#1080#1102
      ImageIndex = 2
      ShortCut = 45
      OnExecute = actNewExecute
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1077#1088#1080#1102
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1077#1088#1080#1102
      ImageIndex = 3
      ShortCut = 16430
      OnExecute = actDeleteExecute
    end
    object actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1077#1088#1080#1102
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1089#1077#1088#1080#1102
      ImageIndex = 4
      ShortCut = 113
      OnExecute = actEditExecute
    end
  end
end
