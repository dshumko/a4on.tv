inherited BCIssuesTypeForm: TBCIssuesTypeForm
  Caption = #1058#1080#1087#1099' '#1087#1088#1086#1073#1083#1077#1084' '#1074#1077#1097#1072#1085#1080#1103
  ClientHeight = 306
  ClientWidth = 739
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbGrid: TDBGridEh
    Top = 145
    Width = 739
    Height = 161
    FooterRowCount = 1
    STFilter.InstantApply = False
    SumList.Active = True
    SumList.VirtualRecords = True
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
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1087#1088#1086#1073#1083#1077#1084#1099
        Title.TitleButton = True
        Width = 255
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 300
      end>
  end
  inherited tlbMain: TToolBar
    Width = 739
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
  end
  inherited pnlEdit: TPanel
    Width = 739
    Height = 120
    object lbl3: TLabel [0]
      Left = 5
      Top = 42
      Width = 49
      Height = 13
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    end
    object lbl2: TLabel [1]
      Left = 5
      Top = 15
      Width = 18
      Height = 13
      Caption = #1058#1080#1087
    end
    inherited btnSaveLink: TBitBtn
      Left = 59
      Top = 90
      Width = 572
      TabOrder = 2
    end
    inherited btnCancelLink: TBitBtn
      Left = 643
      Top = 90
      Width = 87
      TabOrder = 3
    end
    object mmoO_DESCRIPTION: TDBMemoEh
      Left = 59
      Top = 39
      Width = 671
      Height = 46
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
    object edtName: TDBEditEh
      Left = 59
      Top = 12
      Width = 671
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
  end
  inherited srcDataSource: TDataSource
    DataSet = dsData
    OnDataChange = srcDataSourceDataChange
    Left = 136
    Top = 232
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 381
    Top = 213
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1086#1073#1088#1072#1097#1077#1085#1080#1077
      OnExecute = actEditExecute
    end
  end
  object dsData: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Objects_Iud(1, 53, :O_ID, :O_Name, :O_Descript' +
        'ion, '#39#39', 0, '#39#39')')
    DeleteSQL.Strings = (
      'execute procedure Objects_Iud(2, 53, :OLD_O_ID)')
    InsertSQL.Strings = (
      
        'execute procedure Objects_Iud(0, 53, :O_ID, :O_Name, :O_Descript' +
        'ion, '#39#39', 0, '#39#39')')
    RefreshSQL.Strings = (
      'select'
      '    o.O_ID'
      '    , o.O_NAME'
      '    , o.O_DESCRIPTION'
      '  from OBJECTS o'
      '  where  O_TYPE = 53'
      '     and O.O_ID = :OLD_O_ID')
    SelectSQL.Strings = (
      'select'
      '    o.O_ID'
      '    , o.O_NAME'
      '    , o.O_DESCRIPTION'
      '  from OBJECTS o'
      '  where O_TYPE = 53'
      '        and O_DELETED = 0'
      '  order by O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 85
    Top = 200
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    oFetchAll = True
  end
  object pmPeriod: TPopupMenu
    Left = 225
    Top = 201
    object N1: TMenuItem
      Caption = #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
    end
    object N4: TMenuItem
      Caption = #1047#1072' '#1087#1088#1086#1096#1083#1099#1081' '#1076#1077#1085#1100
    end
    object N2: TMenuItem
      Caption = #1047#1072' '#1085#1077#1076#1077#1083#1102
    end
    object N3: TMenuItem
      Caption = #1047#1072' '#1084#1077#1089#1103#1094
    end
  end
end
