inherited DeviceTypesForm: TDeviceTypesForm
  Left = 381
  Top = 171
  Caption = #1058#1080#1087' '#1084#1072#1090#1077#1088#1080#1072#1083#1072' / '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
  ClientHeight = 459
  ClientWidth = 684
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter [0]
    Left = 0
    Top = 244
    Width = 684
    Height = 4
    Cursor = crVSplit
    Align = alBottom
  end
  inherited splPG: TSplitter
    Top = 153
    Width = 684
  end
  inherited dbGrid: TDBGridEh
    Top = 156
    Width = 684
    Height = 88
    AllowedOperations = [alopUpdateEh]
    FooterRowCount = 1
    SumList.Active = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_ID'
        Footers = <>
        Visible = False
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 167
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DIMENSION'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'T_CNT'
        Footers = <>
        Title.Caption = #1050#1086#1083'-'#1074#1086' '#1101#1083#1077#1084#1077#1085#1090#1086#1074
        Title.Hint = #1050#1086#1083'-'#1074#1086' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103'/'#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074' '#1076#1072#1085#1085#1086#1075#1086' '#1090#1080#1087#1072
        Width = 74
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 310
      end>
  end
  inherited tlbMain: TToolBar
    Width = 684
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
  end
  object pnlBottom: TPanel [4]
    Left = 0
    Top = 248
    Width = 684
    Height = 211
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object dbgLayout: TDBGridEh
      Left = 0
      Top = 0
      Width = 684
      Height = 211
      Align = alClient
      DataSource = srcDevices
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      SearchPanel.Enabled = True
      SearchPanel.FilterOnTyping = True
      TabOrder = 0
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
          Title.TitleButton = True
          Width = 167
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DIMENSION'
          Footers = <>
          Title.Caption = #1045#1076'. '#1080#1079#1084'.'
          Title.TitleButton = True
          Width = 57
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'COST'
          Footers = <>
          Title.Caption = #1062#1077#1085#1072
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MG_NAME'
          Footers = <>
          Title.Caption = #1043#1088#1091#1087#1087#1072
          Title.TitleButton = True
          Width = 118
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DESCRIPTION'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 171
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  inherited pnlEdit: TPanel
    Width = 684
    Height = 128
    ParentCtl3D = False
    object lbl2: TLabel [0]
      Left = 5
      Top = 15
      Width = 18
      Height = 13
      Caption = #1058#1080#1087
    end
    object lbl3: TLabel [1]
      Left = 5
      Top = 42
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object lbl1: TLabel [2]
      Left = 495
      Top = 15
      Width = 19
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1082#1086#1076
    end
    inherited btnSaveLink: TBitBtn
      Left = 72
      Top = 95
      Width = 499
      TabOrder = 2
    end
    inherited btnCancelLink: TBitBtn
      Left = 577
      Top = 95
      Width = 98
      Cancel = True
      TabOrder = 3
    end
    object edtName: TDBEditEh
      Left = 72
      Top = 12
      Width = 412
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'O_NAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1058#1080#1087' ('#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1077' '#1087#1086#1083#1077')'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object dbmmoO_DESCRIPTION: TDBMemoEh
      Left = 72
      Top = 39
      Width = 603
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1080#1087#1072
      ShowHint = True
      TabOrder = 1
      Visible = True
      WantReturns = True
    end
    object edtO_NAME: TDBEditEh
      Left = 523
      Top = 12
      Width = 152
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'O_DIMENSION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1050#1086#1076' '#1090#1080#1087#1072
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsTypes
    OnDataChange = srcDataSourceDataChange
    Left = 240
    Top = 208
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 150
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
  end
  inherited pmPopUp: TPopupMenu
    Left = 419
    Top = 215
  end
  inherited CnErrors: TCnErrorProvider
    Left = 320
    Top = 208
  end
  object dsTypes: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Objects_Iud(1, 48, :O_ID, :O_Name, :O_Descript' +
        'ion, :O_DIMENSION)')
    DeleteSQL.Strings = (
      'execute procedure Objects_Iud(2, 48, :OLD_O_ID)')
    InsertSQL.Strings = (
      
        'execute procedure Objects_Iud(0, 48, :O_ID, :O_Name, :O_Descript' +
        'ion, :O_DIMENSION)')
    RefreshSQL.Strings = (
      'select'
      '    o.O_ID, o.O_NAME, o.O_DESCRIPTION, o.O_DIMENSION'
      '  , nullif((select'
      '         count(*)'
      '       from materials m'
      '       where m.M_Type = o.O_Id), 0) T_CNT'
      '  from OBJECTS o'
      '  where  O_TYPE = 48'
      '     and O_DELETED = 0'
      '     and O.O_ID = :OLD_O_ID'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , o.O_NAME'
      '  , o.O_DESCRIPTION'
      '  , o.O_DIMENSION'
      '  , nullif((select'
      '         count(*)'
      '       from materials m'
      '       where m.M_Type = o.O_Id), 0) T_CNT'
      '  from OBJECTS o'
      '  where O_TYPE = 48'
      '        and O_DELETED = 0'
      '  order by O_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 80
    Top = 208
  end
  object dsDevices: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    m.M_ID'
      '  , m.NAME'
      '  , m.DIMENSION'
      '  , m.M_NUMBER'
      '  , m.DESCRIPTION'
      '  , m.COST'
      '  , m.Mg_Id'
      '  , m.IS_DIGIT'
      '  , m.IS_NET'
      '  , t.O_NAME MT_NAME'
      '  from MATERIALS m'
      
        '       inner join OBJECTS t on (t.O_ID = m.M_Type and t.O_TYPE =' +
        ' 48)'
      
        '       left outer join MATERIALS_GROUP mg on (mg.Mg_Id = m.Mg_Id' +
        ')'
      '  where m.deleted = 0'
      '        and m.M_Type = :O_ID'
      '  order by NAME  ')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    AutoCommit = True
    DataSource = srcDataSource
    Left = 291
    Top = 342
  end
  object srcDevices: TDataSource
    AutoEdit = False
    DataSet = dsDevices
    Left = 376
    Top = 342
  end
end
