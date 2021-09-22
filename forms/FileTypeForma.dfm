inherited FileTypeForm: TFileTypeForm
  Left = 381
  Top = 171
  Caption = #1058#1080#1087#1099' '#1072#1073#1086#1085#1077#1085#1090#1089#1082#1080#1093' '#1092#1072#1081#1083#1086#1074
  ClientHeight = 394
  ClientWidth = 585
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 225
    Width = 585
  end
  inherited dbGrid: TDBGridEh
    Top = 228
    Width = 585
    Height = 166
    AllowedOperations = [alopUpdateEh]
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
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 167
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
    Width = 585
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
  inherited pnlEdit: TPanel
    Width = 585
    Height = 200
    ParentCtl3D = False
    object lbl2: TLabel [0]
      Left = 5
      Top = 10
      Width = 18
      Height = 13
      Caption = #1058#1080#1087
    end
    object lbl1: TLabel [1]
      Left = 5
      Top = 43
      Width = 64
      Height = 52
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103#13#10#1087#1086#1089#1083#1077' '#13#10#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#13#10#1092#1072#1081#1083#1072
      ShowAccelChar = False
      WordWrap = True
    end
    inherited btnSaveLink: TBitBtn
      Left = 72
      Top = 168
      Width = 400
      TabOrder = 2
    end
    inherited btnCancelLink: TBitBtn
      Left = 480
      Top = 168
      Width = 98
      Cancel = True
      TabOrder = 3
    end
    object edtName: TDBEditEh
      Left = 72
      Top = 7
      Width = 506
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
      Left = 5
      Top = 113
      Width = 573
      Height = 51
      ScrollBars = ssVertical
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'O_DESCRIPTION'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1080#1087#1072
      PopupMenu = pmMemo
      ShowHint = True
      TabOrder = 1
      Visible = True
      WantReturns = True
    end
    object lcbSrvType: TDBLookupComboboxEh
      Left = 208
      Top = 35
      Width = 121
      Height = 21
      Hint = #1058#1080#1087' '#1091#1089#1083#1091#1075
      DynProps = <>
      DataField = ''
      EmptyDataInfo.Text = #1058#1080#1087' '#1091#1089#1083#1091#1075
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcSrvType
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
    object lcbOnOffSrv: TDBLookupComboboxEh
      Left = 344
      Top = 35
      Width = 234
      Height = 21
      Hint = #1063#1077#1084' '#1074#1082#1083'/'#1086#1090#1082#1083#1102#1095#1072#1077#1084' '#1091#1089#1083#1091#1075#1091
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      EmptyDataInfo.Text = #1063#1077#1084' '#1074#1082#1083'/'#1086#1090#1082#1083#1102#1095#1072#1077#1084' '#1091#1089#1083#1091#1075#1091
      EditButtons = <>
      KeyField = 'SERVICE_ID'
      ListField = 'NAME'
      ListSource = srcOnOffSrv
      ShowHint = True
      TabOrder = 5
      Visible = True
    end
    object cbOnOff: TDBComboBoxEh
      Left = 72
      Top = 35
      Width = 121
      Height = 21
      Hint = #1042#1082#1083#1102#1095#1080#1090#1100' '#1080#1083#1080' '#1086#1090#1082#1083#1102#1095#1080#1090#1100' '#1091#1089#1083#1091#1075#1091
      DynProps = <>
      EmptyDataInfo.Text = #1042#1082#1083'/'#1086#1090#1082#1083'. '#1091#1089#1083#1091#1075#1091
      EditButtons = <>
      Items.Strings = (
        ''
        #1042#1082#1083#1102#1095#1080#1090#1100
        #1054#1090#1082#1083#1102#1095#1080#1090#1100)
      KeyItems.Strings = (
        '-1'
        '1'
        '0')
      ShowHint = True
      TabOrder = 6
      Visible = True
    end
    object lcbRequest: TDBLookupComboboxEh
      Left = 72
      Top = 64
      Width = 257
      Height = 21
      DynProps = <>
      DataField = ''
      EmptyDataInfo.Text = #1058#1080#1087' '#1079#1072#1103#1074#1082#1080
      EditButtons = <>
      KeyField = 'RT_ID'
      ListField = 'RT_NAME'
      ListSource = srcReqType
      ShowHint = True
      TabOrder = 7
      Visible = True
    end
    object chkOpenInet: TDBCheckBoxEh
      Left = 72
      Top = 91
      Width = 153
      Height = 17
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1048#1085#1090#1077#1088#1085#1077#1090
      DynProps = <>
      TabOrder = 8
    end
    object lcbTempl: TDBLookupComboboxEh
      Left = 344
      Top = 64
      Width = 234
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      EmptyDataInfo.Text = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1079#1086#1074#1072
      EditButtons = <>
      KeyField = 'RQTL_ID'
      ListField = 'NAME'
      ListSource = srcReqTempl
      ShowHint = True
      TabOrder = 9
      Visible = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsFileType
    OnDataChange = srcDataSourceDataChange
    Left = 40
    Top = 328
  end
  inherited actions: TActionList
    Left = 126
    Top = 272
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
    Left = 123
    Top = 335
  end
  inherited CnErrors: TCnErrorProvider
    Left = 184
    Top = 280
  end
  object dsFileType: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Objects_Iud(1, 33, :O_ID, :O_Name, :O_Descript' +
        'ion, null, 0, :O_CHARFIELD)')
    DeleteSQL.Strings = (
      'execute procedure Objects_Iud(2, 33, :OLD_O_ID)')
    InsertSQL.Strings = (
      
        'execute procedure Objects_Iud(0, 33, :O_ID, :O_Name, :O_Descript' +
        'ion, null, 0, :O_CHARFIELD)')
    RefreshSQL.Strings = (
      'select'
      '    o.O_ID, o.O_NAME, o.O_DESCRIPTION, O_CHARFIELD'
      '  from OBJECTS o'
      '  where  O_TYPE = 33'
      '     and O_DELETED = 0'
      '     and O.O_ID = :OLD_O_ID'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    o.O_ID, o.O_NAME, o.O_DESCRIPTION, O_CHARFIELD'
      '  from OBJECTS o'
      '  where O_TYPE = 33'
      '        and O_DELETED = 0'
      '  order by O_NAME  ')
    AutoUpdateOptions.UpdateTableName = 'OBJECTS'
    AutoUpdateOptions.KeyFields = 'O_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 40
    Top = 272
  end
  object pmMemo: TPopupMenu
    Left = 189
    Top = 336
  end
  object dsSrvType: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '  o.O_Id, '
      '  o.O_Name '
      'from objects o '
      'where o.O_Type = 15'
      'order by 1')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 280
    Top = 280
  end
  object srcSrvType: TDataSource
    AutoEdit = False
    DataSet = dsSrvType
    OnDataChange = srcDataSourceDataChange
    Left = 280
    Top = 296
  end
  object dsReqType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    t.Rt_Id'
      '    , t.Rt_Name'
      '  from request_types t'
      '  where RT_DELETED = 0'
      '  order by t.rt_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 368
    Top = 280
  end
  object srcReqType: TDataSource
    AutoEdit = False
    DataSet = dsReqType
    OnDataChange = srcDataSourceDataChange
    Left = 368
    Top = 296
  end
  object dsOnOffSrv: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct'
      '    s.Service_Id'
      '  , s.Name'
      '  from Services_Links sl'
      '       inner join services s on (s.Service_Id = sl.Child)'
      '       inner join services p on (p.Service_Id = sl.Parent)'
      '  where p.Business_Type = :O_Id'
      '        and sl.Link_Type in (2, -- '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
      '                         3, -- '#1087#1086#1074#1090'. '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077
      '                         4, -- '#1086#1090#1082#1083'. '#1087#1086' '#1079#1072#1103#1074#1082#1077
      '                         5 -- '#1086#1090#1082#1083'. '#1079#1072' '#1085#1077#1091#1087#1083#1072#1090#1091
      '                         )'
      'order by s.Name'
      '    ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcSrvType
    Left = 464
    Top = 280
  end
  object srcOnOffSrv: TDataSource
    AutoEdit = False
    DataSet = dsOnOffSrv
    OnDataChange = srcDataSourceDataChange
    Left = 464
    Top = 296
  end
  object dsReqTempl: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    rt.Rqtl_Id'
      '    , rt.Rq_Content NAME'
      '  from request_templates rt'
      '  where rt.rq_type = :Rt_Id'
      '        and coalesce(rt.deleted, 0) = 0'
      '  order by rt.rq_content')
    AutoUpdateOptions.UpdateTableName = 'REQUEST_TEMPLATES'
    AutoUpdateOptions.KeyFields = 'RT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcReqType
    Left = 328
    Top = 336
    WaitEndMasterScroll = True
    dcForceOpen = True
  end
  object srcReqTempl: TDataSource
    AutoEdit = False
    DataSet = dsReqTempl
    Left = 328
    Top = 352
  end
end
