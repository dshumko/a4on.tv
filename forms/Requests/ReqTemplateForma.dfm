object ReqTemplateForm: TReqTemplateForm
  Left = 0
  Top = 0
  Caption = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1079#1086#1074#1072
  ClientHeight = 336
  ClientWidth = 454
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    454
    336)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 64
    Height = 13
    Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
  end
  object lbl1: TLabel
    Left = 8
    Top = 34
    Width = 55
    Height = 13
    Caption = #1040#1085#1072#1083#1080#1090#1080#1082#1072
  end
  object lbl2: TLabel
    Left = 8
    Top = 60
    Width = 36
    Height = 13
    Caption = #1056#1072#1073#1086#1090#1072
  end
  object lbl3: TLabel
    Left = 8
    Top = 176
    Width = 164
    Height = 13
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086' '#1076#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103
  end
  object lblRecreate: TLabel
    Left = 8
    Top = 146
    Width = 148
    Height = 13
    Caption = #1055#1077#1088#1077#1089#1086#1079#1076#1072#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1095#1077#1088#1077#1079
  end
  object edContent: TDBEditEh
    Left = 78
    Top = 5
    Width = 368
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'RQ_CONTENT'
    DataSource = srcRQTL
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1079#1086#1074#1072
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object luAnalysGrp: TDBLookupComboboxEh
    Left = 78
    Top = 31
    Width = 368
    Height = 21
    Hint = #1043#1088#1091#1087#1087#1072' '#1072#1085#1072#1083#1080#1090#1080#1082#1080' ('#1074#1086#1079#1084#1086#1078#1085#1086' '#1091#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1075#1088#1091#1087#1087#1077')'
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'ANALYSE_ID'
    DataSource = srcRQTL
    EmptyDataInfo.Text = #1043#1088#1091#1087#1087#1072' '#1072#1085#1072#1083#1080#1090#1080#1082#1080
    EditButtons = <>
    KeyField = 'O_ID'
    ListField = 'O_NAME'
    ListSource = srcANALYS
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object luWork: TDBLookupComboboxEh
    Left = 78
    Top = 57
    Width = 368
    Height = 21
    Hint = #1044#1086#1073#1072#1074#1083#1103#1090#1100' '#1074' '#1079#1072#1103#1074#1082#1091' '#1088#1072#1073#1086#1090#1091' '#1087#1088#1080' '#1074#1099#1073#1086#1088#1077' '
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'ADD_WORK'
    DataSource = srcRQTL
    EmptyDataInfo.Text = #1056#1072#1073#1086#1090#1072' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    EditButtons = <>
    KeyField = 'W_ID'
    ListField = 'NAME'
    ListSource = srcWorks
    ShowHint = True
    TabOrder = 2
    Visible = True
  end
  object mmo1: TDBMemoEh
    Left = 8
    Top = 192
    Width = 438
    Height = 105
    Hint = 
      #1057#1087#1080#1089#1086#1082' '#1079#1085#1072#1095#1077#1085#1080#1081' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1086#1075#1086' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086#1075#1086' '#1087#1086#1083#1103' '#1087#1088#1080' '#1086#1092#1086#1088#1084#1083#1077#1085#1080 +
      #1080' '#1079#1072#1103#1074#1082#1080#13#10#1054#1076#1085#1072' '#1089#1090#1088#1086#1082#1072' - '#1086#1076#1085#1086' '#1079#1085#1072#1095#1077#1085#1080#1077
    Lines.Strings = (
      'mmo1')
    ScrollBars = ssVertical
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1044#1086#1087'. '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1076#1083#1103' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1088#1080' '#1087#1088#1080#1077#1084#1077' '#1079#1072#1103#1074#1082#1080
    ShowHint = True
    TabOrder = 5
    Visible = True
    WantReturns = True
  end
  object btnCancel: TBitBtn
    Left = 371
    Top = 303
    Width = 75
    Height = 27
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 7
  end
  object btnOk: TBitBtn
    Left = 78
    Top = 303
    Width = 277
    Height = 27
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 6
    OnClick = btnOkClick
  end
  object chkNeedPhoto: TDBCheckBoxEh
    Left = 8
    Top = 86
    Width = 224
    Height = 17
    Alignment = taLeftJustify
    Caption = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1092#1086#1090#1086' '#1087#1088#1080' '#1079#1072#1082#1088#1099#1090#1080#1080' '#1079#1072#1103#1074#1082#1080
    DataField = 'NEED_PHOTO'
    DataSource = srcRQTL
    DynProps = <>
    Flat = True
    TabOrder = 3
  end
  object chkNEED_NODE_RQ: TDBCheckBoxEh
    Left = 8
    Top = 116
    Width = 224
    Height = 17
    Hint = 
      #1053#1091#1078#1085#1086' '#1083#1080' '#1089#1086#1079#1076#1072#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1085#1072' '#1091#1079#1077#1083' '#1087#1088#1080' '#1089#1086#1079#1076#1072#1085#1080#1080' '#1079#1072#1103#1074#1082#1080' '#1085#1072' '#1072#1073#1086#1085#1077#1085#1090 +
      #1072
    Alignment = taLeftJustify
    Caption = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1089#1086#1079#1076#1072#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1091' '#1085#1072' '#1091#1079#1077#1083
    DataField = 'NEED_NODE_RQ'
    DataSource = srcRQTL
    DynProps = <>
    Flat = True
    TabOrder = 4
  end
  object edtDaysRecreate: TDBNumberEditEh
    Left = 181
    Top = 142
    Width = 51
    Height = 21
    Hint = #1059#1082#1072#1078#1080#1090#1077' '#1082#1086#1083'-'#1074#1086' '#1076#1077#1085#1081', '#1077#1089#1083#1080' '#1087#1091#1089#1090#1086', '#1090#1086' '#1085#1077' '#1089#1086#1079#1076#1072#1074#1072#1090#1100
    DataField = 'RECREATE_DAYS'
    DataSource = srcRQTL
    DecimalPlaces = 0
    DynProps = <>
    EmptyDataInfo.Text = #1076#1085#1077#1081
    EditButtons = <>
    ShowHint = True
    TabOrder = 8
    Visible = True
  end
  object cbbRecreateType: TDBLookupComboboxEh
    Left = 240
    Top = 143
    Width = 206
    Height = 21
    Hint = #1058#1080#1087' '#1085#1086#1074#1086#1081' '#1079#1072#1103#1074#1082#1080' '#1080#1083#1080' '#1090#1072#1082#1086#1081' '#1078#1077' '#1077#1089#1083#1080' '#1086#1089#1090#1072#1074#1080#1090#1100' '#1087#1091#1089#1090#1099#1084
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'RECREATE_TYPE'
    DataSource = srcRQTL
    EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1100' '#1090#1080#1087' '#1079#1072#1103#1074#1082#1080' '#1080#1083#1080' '#1090#1072#1082#1086#1081' '#1078#1077
    EditButtons = <>
    KeyField = 'ID'
    ListField = 'NAME'
    ListSource = srcTypes
    ShowHint = True
    TabOrder = 9
    Visible = True
    OnDropDownBoxGetCellParams = cbbRecreateTypeDropDownBoxGetCellParams
  end
  object btnClear: TButton
    Left = 356
    Top = 84
    Width = 90
    Height = 25
    Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1094#1074#1077#1090' '#1092#1086#1085#1072' '#1090#1080#1087#1072' '#1079#1072#1103#1074#1082#1080
    Anchors = [akTop, akRight]
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1086#1085
    TabOrder = 10
    TabStop = False
    OnClick = btnClearClick
  end
  object btnColor: TBitBtn
    Left = 257
    Top = 84
    Width = 90
    Height = 25
    Hint = #1042#1099#1073#1088#1072#1090#1100' '#1094#1074#1077#1090' '#1092#1086#1085#1072' '#1076#1083#1103' '#1076#1072#1085#1085#1086#1075#1086' '#1090#1080#1087#1072' '#1079#1072#1103#1074#1086#1082
    Anchors = [akTop, akRight]
    Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1086#1085
    TabOrder = 11
    TabStop = False
    OnClick = btnColorClick
  end
  object srcRQTL: TDataSource
    DataSet = dsRQTL
    Left = 380
    Top = 253
  end
  object dsRQTL: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE REQUEST_TEMPLATES'
      'SET '
      '    RQ_TYPE = :RQ_TYPE'
      '    , RQ_CONTENT = :RQ_CONTENT'
      '    , RQ_MAXTIME = :RQ_MAXTIME'
      '    , RQ_COLOR = :RQ_COLOR'
      '    , ADD_WORK  = :ADD_WORK'
      '    , ANALYSE_ID = :ANALYSE_ID'
      '    , ADD_FIELD = :ADD_FIELD'
      '    , NEED_PHOTO = :NEED_PHOTO'
      '    , NEED_NODE_RQ = :NEED_NODE_RQ '
      '    , RECREATE_DAYS = :RECREATE_DAYS'
      '    , RECREATE_TYPE = :RECREATE_TYPE'
      'WHERE'
      '    RQTL_ID = :OLD_RQTL_ID'
      '    ')
    DeleteSQL.Strings = (
      'update REQUEST_TEMPLATES'
      'set deleted = 1'
      'WHERE'
      '        RQTL_ID = :OLD_RQTL_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO REQUEST_TEMPLATES('
      '    RQTL_ID'
      '    , RQ_TYPE'
      '    , RQ_CONTENT'
      '    , RQ_MAXTIME'
      '    , RQ_COLOR'
      '    , ANALYSE_ID'
      '    , ADD_WORK'
      '    , ADD_FIELD'
      '    , NEED_PHOTO'
      '    , NEED_NODE_RQ'
      '    , RECREATE_DAYS'
      '    , RECREATE_TYPE'
      ')'
      'VALUES('
      '    :RQTL_ID'
      '    , :RQ_TYPE'
      '    , :RQ_CONTENT'
      '    , :RQ_MAXTIME'
      '    , :RQ_COLOR'
      '    , :ANALYSE_ID'
      '    , :ADD_WORK'
      '    , :ADD_FIELD'
      '    , :NEED_PHOTO'
      '    , :NEED_NODE_RQ'
      '    , :RECREATE_DAYS'
      '    , :RECREATE_TYPE  '
      ')')
    RefreshSQL.Strings = (
      'select *'
      'from REQUEST_TEMPLATES RTL'
      'where(  rtl.rqtl_id = :RQTL_ID'
      '     ) and (     RTL.RQTL_ID = :OLD_RQTL_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select *'
      'from REQUEST_TEMPLATES RTL'
      'where rtl.rqtl_id = :RQTL_ID')
    AfterOpen = dsRQTLAfterOpen
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 306
    Top = 252
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
    Left = 104
    Top = 192
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
    Left = 171
    Top = 193
  end
  object dsANALYS: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE SUBAREA'
      'SET '
      '    AREA_ID = :AREA_ID,'
      '    SUBAREA_ID = :SUBAREA_ID,'
      '    SUBAREA_NAME = :SUBAREA_NAME'
      'WHERE'
      '    SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    SUBAREA'
      'WHERE'
      '        SUBAREA_ID = :OLD_SUBAREA_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO SUBAREA('
      '    AREA_ID,'
      '    SUBAREA_ID,'
      '    SUBAREA_NAME'
      ')'
      'VALUES('
      '    :AREA_ID,'
      '    :SUBAREA_ID,'
      '    :SUBAREA_NAME'
      ')')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM SUBAREA'
      'where(  area_ID = :AREA_ID'
      'and subarea_id <> 0'
      '     ) and (     SUBAREA.SUBAREA_ID = :OLD_SUBAREA_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select o.o_name, o.O_id'
      'from objects o'
      'where o.O_TYPE = 14 and o.o_deleted = 0'
      'order by o.o_name')
    AutoUpdateOptions.UpdateTableName = 'SUBAREA'
    AutoUpdateOptions.KeyFields = 'SUBAREA_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 113
    Top = 246
  end
  object srcANALYS: TDataSource
    DataSet = dsANALYS
    Left = 194
    Top = 247
  end
  object dsWorks: TpFIBDataSet
    SelectSQL.Strings = (
      'select w.* '
      'from works w '
      'where '
      '  w.rq_type = :rt_id '
      '  and w.Deleted = 0 '
      'order by w.name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 308
    Top = 193
  end
  object srcWorks: TDataSource
    DataSet = dsWorks
    Left = 361
    Top = 196
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 243
    Top = 208
  end
  object srcTypes: TDataSource
    AutoEdit = False
    DataSet = dsTypes
    Left = 344
    Top = 256
  end
  object dsTypes: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    tl.Rqtl_Id as ID'
      '  , tl.Rq_Content||'#39'. ('#39'||rt.Rt_Name||'#39')'#39' NAME'
      '  , coalesce(tl.Rq_Color, '#39'clWindow'#39') as COLOR'
      '  from REQUEST_TYPEs rt'
      '    inner join Request_Templates tl on (rt.Rt_Id = tl.Rq_Type)'
      
        '  where coalesce(rt.Rt_Deleted, 0) = 0 and coalesce(tl.Deleted, ' +
        '0) = 0'
      '  order by 2')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 256
    Top = 256
  end
  object dlgColor: TColorDialog
    Left = 240
    Top = 208
  end
end
