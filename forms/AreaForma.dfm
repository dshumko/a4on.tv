inherited AreaForm: TAreaForm
  Left = 259
  Top = 198
  Caption = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1077' '#1087#1091#1085#1082#1090#1099' '#1080' '#1088#1072#1081#1086#1085#1099
  ClientHeight = 420
  ClientWidth = 746
  Constraints.MinHeight = 244
  Menu = MainMenu1
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter [0]
    Left = 0
    Top = 237
    Width = 746
    Height = 8
    Cursor = crVSplit
    Align = alTop
  end
  inherited splPG: TSplitter
    Top = 233
    Width = 746
  end
  inherited dbGrid: TDBGridEh
    Top = 57
    Width = 746
    Height = 176
    Align = alTop
    AllowedOperations = []
    FooterRowCount = 1
    SumList.Active = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'AREA_ID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'AREA_NAME'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1085#1072#1089'. '#1087#1091#1085#1082#1090#1072
        Width = 145
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'AREA_CODE'
        Footers = <>
        Title.Caption = #1050#1086#1076
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'H_COUNT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1044#1086#1084#1086#1074
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Q_FLAT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1050#1074#1072#1088#1090#1080#1088
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Q_PORCH'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1055#1086#1076#1098#1077#1079#1076#1086#1074
        Title.TitleButton = True
        Width = 69
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 152
      end>
  end
  object pnlBottom: TPanel [3]
    Left = 0
    Top = 245
    Width = 746
    Height = 175
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object dbSubArea: TDBGridEh
      Left = 0
      Top = 25
      Width = 746
      Height = 154
      Align = alClient
      AllowedOperations = [alopUpdateEh]
      DataSource = srcSubAreas
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
      SortLocal = True
      SumList.Active = True
      TabOrder = 1
      TitleParams.MultiTitle = True
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'SUBAREA_NAME'
          Footers = <>
          Title.Caption = #1056#1072#1081#1086#1085
          Width = 144
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'H_COUNT'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1044#1086#1084#1086#1074
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Q_FLAT'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1050#1074#1072#1088#1090#1080#1088
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'Q_PORCH'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1055#1086#1076#1098#1077#1079#1076#1086#1074
          Title.TitleButton = True
          Width = 64
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Width = 223
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object ToolBar2: TToolBar
      Left = 0
      Top = 0
      Width = 746
      Height = 25
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
      object ToolButton13: TToolButton
        Left = 55
        Top = 0
        Width = 4
        Caption = 'ToolButton6'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton14: TToolButton
        Left = 59
        Top = 0
        Action = actSubDelete
      end
      object ToolButton15: TToolButton
        Left = 82
        Top = 0
        Width = 15
        Caption = 'ToolButton9'
        ImageIndex = 27
        Style = tbsSeparator
        Visible = False
      end
      object tbOkSub: TToolButton
        Left = 97
        Top = 0
        Caption = 'tbOk'
        Enabled = False
        ImageIndex = 25
        Visible = False
        OnClick = tbOkSubClick
      end
      object ToolButton17: TToolButton
        Left = 120
        Top = 0
        Width = 4
        Caption = 'ToolButton10'
        ImageIndex = 28
        Style = tbsSeparator
        Visible = False
      end
      object tbCancelSub: TToolButton
        Left = 124
        Top = 0
        Caption = 'tbCancel'
        Enabled = False
        ImageIndex = 26
        Visible = False
        OnClick = tbCancelSubClick
      end
    end
  end
  inherited tlbMain: TToolBar
    Width = 746
    inherited tbOk: TToolButton
      Visible = False
      OnClick = tbOkClick
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
      OnClick = tbCancelClick
    end
    inherited ToolButton20: TToolButton
      Visible = False
    end
  end
  inherited pnlEdit: TPanel
    Width = 746
    Height = 32
    inherited btnSaveLink: TBitBtn
      Left = 99
      Top = 1
      Width = 547
    end
    inherited btnCancelLink: TBitBtn
      Left = 652
      Top = 1
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsAreas
    OnDataChange = srcDataSourceDataChange
    Left = 104
    Top = 104
  end
  inherited actions: TActionList
    Left = 254
    Top = 113
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1085#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1089#1077#1083#1077#1085#1085#1099#1077' '#1087#1091#1085#1082#1090
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1085#1072#1089#1077#1083#1077#1085#1085#1099#1077' '#1087#1091#1085#1082#1090
      OnExecute = actEditExecute
    end
    object actSubNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1095#1072#1089#1090#1086#1082
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1095#1072#1089#1090#1086#1082
      ImageIndex = 2
      OnExecute = actSubNewExecute
    end
    object actSubDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1091#1095#1072#1089#1090#1086#1082
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1091#1095#1072#1089#1090#1086#1082
      ImageIndex = 3
      OnExecute = actSubDeleteExecute
    end
    object actSubEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1091#1095#1072#1089#1090#1086#1082
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1091#1095#1072#1089#1090#1086#1082
      ImageIndex = 4
      OnExecute = actSubEditExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 353
    Top = 197
  end
  inherited CnErrors: TCnErrorProvider
    Left = 440
    Top = 152
  end
  object dsAreas: TpFIBDataSet
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    AREA a'
      'WHERE'
      '  a.AREA_ID = :OLD_AREA_ID'
      
        '  and not exists (select Area_Id from Subarea where Area_Id = a.' +
        'AREA_ID)'
      
        '  and not exists (select Area_Id from STREET where Area_Id = a.A' +
        'REA_ID)         '
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    a.*'
      '  , q.H_COUNT'
      '  , q.Q_Flat'
      '  , p.q_porch'
      '  from AREA a'
      '       left outer join(select'
      '                           s.Area_Id'
      '                         , count(h.House_Id) H_COUNT'
      '                         , sum(h.Q_Flat) Q_Flat'
      '                         from house h'
      
        '                              inner join subarea s on (s.Subarea' +
        '_Id = h.Subarea_Id)'
      
        '                         group by 1) q on (q.Area_Id = a.Area_Id' +
        ')'
      '       left outer join(select'
      '                           s.Area_Id'
      '                         , count(hp.Porch_N) q_porch'
      '                         from house h'
      
        '                              inner join subarea s on (s.Subarea' +
        '_Id = h.Subarea_Id)'
      
        '                              inner join Houseporch hp on (hp.Ho' +
        'use_Id = h.House_Id)'
      
        '                         group by 1) p on (p.Area_Id = a.Area_Id' +
        ')'
      ''
      '  where A.AREA_ID = :OLD_AREA_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    a.*'
      '  , q.H_COUNT'
      '  , q.Q_Flat'
      '  , p.q_porch'
      '  from AREA a'
      '       left outer join(select'
      '                           s.Area_Id'
      '                         , count(h.House_Id) H_COUNT'
      '                         , sum(h.Q_Flat) Q_Flat'
      '                         from house h'
      
        '                              inner join subarea s on (s.Subarea' +
        '_Id = h.Subarea_Id)'
      
        '                         group by 1) q on (q.Area_Id = a.Area_Id' +
        ')'
      '       left outer join(select'
      '                           s.Area_Id'
      '                         , count(hp.Porch_N) q_porch'
      '                         from house h'
      
        '                              inner join subarea s on (s.Subarea' +
        '_Id = h.Subarea_Id)'
      
        '                              inner join Houseporch hp on (hp.Ho' +
        'use_Id = h.House_Id)'
      
        '                         group by 1) p on (p.Area_Id = a.Area_Id' +
        ')'
      ''
      '  where a.area_id <> 0'
      '  order by AREA_NAME')
    AutoUpdateOptions.UpdateTableName = 'AREA'
    AutoUpdateOptions.KeyFields = 'AREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 184
    Top = 120
  end
  object srcSubAreas: TDataSource
    AutoEdit = False
    DataSet = dsSubAreas
    OnStateChange = srcSubAreasStateChange
    OnDataChange = srcSubAreasDataChange
    Left = 104
    Top = 152
  end
  object dsSubAreas: TpFIBDataSet
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
      '    s.*'
      '  , q.H_COUNT'
      '  , q.Q_Flat'
      '  , p.q_porch'
      '  from SUBAREA s'
      '       left outer join(select'
      '                           h.subarea_id'
      '                         , count(h.House_Id) H_COUNT'
      '                         , sum(h.Q_Flat) Q_Flat'
      '                         from house h'
      
        '                         group by 1) q on (q.subarea_id = s.suba' +
        'rea_id)'
      '       left outer join(select'
      '                           h.subarea_id'
      '                         , count(hp.Porch_N) q_porch'
      '                         from house h'
      
        '                              inner join Houseporch hp on (hp.Ho' +
        'use_Id = h.House_Id)'
      
        '                         group by 1) p on (p.subarea_id = s.suba' +
        'rea_id)'
      ''
      '  where s.SUBAREA_ID = :OLD_SUBAREA_ID')
    SelectSQL.Strings = (
      'select'
      '    s.*'
      '  , q.H_COUNT'
      '  , q.Q_Flat'
      '  , p.q_porch'
      '  from SUBAREA s'
      '       left outer join(select'
      '                           h.subarea_id'
      '                         , count(h.House_Id) H_COUNT'
      '                         , sum(h.Q_Flat) Q_Flat'
      '                         from house h'
      
        '                         group by 1) q on (q.subarea_id = s.suba' +
        'rea_id)'
      '       left outer join(select'
      '                           h.subarea_id'
      '                         , count(hp.Porch_N) q_porch'
      '                         from house h'
      
        '                              inner join Houseporch hp on (hp.Ho' +
        'use_Id = h.House_Id)'
      
        '                         group by 1) p on (p.subarea_id = s.suba' +
        'rea_id)'
      '  where s.area_ID = :AREA_ID'
      '        and s.subarea_id <> 0'
      '  order by SUBAREA_NAME'
      ''
      '')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    DataSource = srcDataSource
    Left = 176
    Top = 192
  end
  object MainMenu1: TMainMenu
    Left = 263
    Top = 198
    object N1: TMenuItem
      Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090#1099' '#1080' '#1091#1095#1072#1089#1090#1082#1080
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
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 288
    Top = 142
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
    Top = 140
  end
end
