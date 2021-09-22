inherited EquipmentCommandsForm: TEquipmentCommandsForm
  Caption = #1050#1086#1084#1072#1085#1076#1099' '#1076#1083#1103' '#1075#1088#1091#1087#1087
  ClientHeight = 389
  ClientWidth = 605
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbGrid: TDBGridEh
    Width = 605
    Height = 178
    AllowedOperations = [alopInsertEh, alopDeleteEh, alopAppendEh]
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
        Footers = <>
        Title.Caption = #1043#1088#1091#1087#1087#1072
        Width = 105
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1050#1086#1084#1072#1085#1076#1072
        Width = 101
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CMD_TYPE'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1'
          '2')
        NotInKeyListIndex = 0
        PickList.Strings = (
          'TELNET'
          'SNMP'
          'HTTP')
        Title.Caption = #1058#1080#1087
        Width = 38
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'IN_GUI'
        Footers = <>
        Title.Caption = #1042#1099#1087#1086#1083#1085#1103#1090#1100' '#1080#1079' '#1055#1054
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'Url'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 90
      end>
  end
  inherited tlbMain: TToolBar
    Width = 605
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
  object dbmCMD: TDBMemoEh [2]
    Left = 0
    Top = 259
    Width = 605
    Height = 130
    ScrollBars = ssBoth
    Align = alBottom
    AutoSize = False
    DataField = 'COMMAND'
    DataSource = srcDataSource
    DynProps = <>
    EditButtons = <>
    ReadOnly = True
    ShowHint = True
    TabOrder = 3
    Visible = True
    WantReturns = True
  end
  inherited pnlEdit: TPanel
    Width = 605
  end
  inherited srcDataSource: TDataSource
    DataSet = dsCGR
    OnStateChange = srcDataSourceStateChange
    OnDataChange = srcDataSourceDataChange
    Top = 152
  end
  object trWrite: TpFIBTransaction [5]
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 149
    Top = 186
  end
  object trRead: TpFIBTransaction [6]
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 217
    Top = 201
  end
  object dsCGR: TpFIBDataSet [7]
    UpdateSQL.Strings = (
      ''
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EQUIPMENT_CMD_GRP'
      'WHERE'
      '        EC_ID = :OLD_EC_ID'
      '    and EG_ID = :OLD_EG_ID'
      '    ')
    RefreshSQL.Strings = (
      'select '
      '    ecg.*,'
      '    g.o_name'
      'from equipment_cmd_grp ecg'
      
        '   inner join objects g  on (g.o_id = ecg.eg_id and g.o_type = 7' +
        ')'
      ' WHERE ECG.EC_ID = :OLD_EC_ID')
    SelectSQL.Strings = (
      'select '
      '    ecg.name,'
      '    ecg.ec_id,'
      '    ecg.eg_id,'
      '    ecg.command,'
      '    ecg.notice,'
      '    ecg.cmd_type,'
      '    ecg.in_gui,'
      '    iif(ecg.eg_id = -1, '#39#1042#1057#1045#39', g.o_name) o_name,'
      '    ecg.Url'
      'from equipment_cmd_grp ecg '
      
        '   left outer join objects g on (g.o_id = ecg.eg_id and g.o_type' +
        ' = 7) '
      ' '
      'order by g.o_name, ecg.name')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 69
    Top = 105
    oFetchAll = True
  end
  inherited actions: TActionList
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1080#1087
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1090#1080#1087
      OnExecute = actEditExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 291
    Top = 191
    inherited pmgCopy: TMenuItem
      OnClick = nil
    end
    inherited pmgSelectAll: TMenuItem
      OnClick = nil
    end
    inherited pmgSaveSelection: TMenuItem
      OnClick = nil
    end
  end
  inherited CnErrors: TCnErrorProvider
    Left = 376
    Top = 176
  end
end
