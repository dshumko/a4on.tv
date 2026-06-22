object RecourseForm: TRecourseForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = #1054#1073#1088#1072#1097#1077#1085#1080#1077' / '#1079#1074#1086#1085#1086#1082
  ClientHeight = 390
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  Position = poDesigned
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 13
  object spl1: TSplitter
    Left = 0
    Top = 71
    Width = 451
    Height = 4
    Cursor = crVSplit
    Align = alTop
    ExplicitWidth = 467
  end
  object splTags: TSplitter
    Left = 0
    Top = 283
    Width = 451
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Visible = False
    ExplicitLeft = -8
    ExplicitTop = 308
  end
  object pnlNotice: TPanel
    Left = 0
    Top = 201
    Width = 451
    Height = 51
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 5
    object mmoNotice: TDBMemoEh
      AlignWithMargins = True
      Left = 4
      Top = 3
      Width = 443
      Height = 45
      Margins.Left = 4
      Margins.Right = 4
      Align = alClient
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077' '#1086#1073#1088#1072#1097#1077#1085#1080#1103
      ShowHint = True
      TabOrder = 0
      Visible = True
      WantReturns = True
    end
  end
  object pnlRecourse: TPanel
    Left = 0
    Top = 148
    Width = 451
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      451
      28)
    object lblAttribute: TLabel
      Left = 6
      Top = 5
      Width = 64
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
    end
    object cbRecourse: TDBLookupComboboxEh
      Left = 74
      Top = 2
      Width = 373
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.Columns = <
        item
          FieldName = 'NAME'
          Width = 30
        end
        item
          FieldName = 'O_NAME'
          Width = 25
        end
        item
          FieldName = 'NOTICE'
          Width = 20
        end
        item
          AutoFitColWidth = False
          Checkboxes = True
          FieldName = 'NEED_REQUEST'
          Width = 10
        end>
      DropDownBox.ListSource = srcRecourse
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'RT_ID'
      ListField = 'NAME'
      ListSource = srcRecourse
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnChange = cbRecourseChange
      OnClick = DBLookupComboboxClick
      OnDropDownBoxGetCellParams = cbRecourseDropDownBoxGetCellParams
      OnEnter = cbRecourseEnter
    end
  end
  object pnlInfo: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 71
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    inline CustomerInfoFrm: TCustomerInfoFrm
      Left = 0
      Top = 0
      Width = 451
      Height = 71
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      ExplicitWidth = 451
      ExplicitHeight = 71
      inherited gbInfo: TGroupBox
        Width = 451
        Height = 71
        ExplicitWidth = 451
        ExplicitHeight = 71
      end
    end
  end
  object pnlAdres: TPanel
    Left = 0
    Top = 75
    Width = 451
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      451
      43)
    object lbl3: TLabel
      Left = 2
      Top = 2
      Width = 31
      Height = 13
      Caption = #1059#1083#1080#1094#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 196
      Top = 2
      Width = 20
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1044#1086#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 212
    end
    object lbl5: TLabel
      Left = 268
      Top = 2
      Width = 13
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1050#1074
      ExplicitLeft = 284
    end
    object btnFind: TButton
      Left = 323
      Top = 9
      Width = 95
      Height = 33
      Action = ActFind
      Anchors = [akTop, akRight]
      TabOrder = 3
    end
    object LupStreets: TDBLookupComboboxEh
      Left = 5
      Top = 15
      Width = 187
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.Columns = <
        item
          FieldName = 'STREET_NAME'
          Title.Caption = #1059#1083#1080#1094#1072
        end
        item
          FieldName = 'AREA_NAME'
          Title.Caption = #1056#1072#1081#1086#1085
        end>
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1091#1083#1080#1094#1091
      EditButtons = <>
      KeyField = 'STREET_ID'
      ListField = 'STREET_NAME'
      ListSource = srcStreet
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object LupHOUSE: TDBLookupComboboxEh
      Left = 196
      Top = 15
      Width = 68
      Height = 21
      Anchors = [akTop, akRight]
      DynProps = <>
      DataField = ''
      EmptyDataInfo.Text = #1044#1086#1084
      EditButtons = <>
      KeyField = 'HOUSE_ID'
      ListField = 'HOUSE_NO'
      ListSource = srcHouse
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnChange = LupHOUSEChange
    end
    object eFLAT_NO: TDBEditEh
      Tag = 7
      Left = 268
      Top = 15
      Width = 52
      Height = 21
      Anchors = [akTop, akRight]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1050#1074#1072#1088#1090#1080#1088#1072
      ShowHint = True
      TabOrder = 2
      Visible = True
      OnExit = eFLAT_NOExit
    end
    object btnClear: TButton
      Left = 421
      Top = 13
      Width = 26
      Height = 25
      Action = actClear
      Anchors = [akTop, akRight]
      TabOrder = 4
      TabStop = False
    end
  end
  object pnlContact: TPanel
    Left = 0
    Top = 176
    Width = 451
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      451
      25)
    object lbl2: TLabel
      Left = 5
      Top = 5
      Width = 43
      Height = 13
      Caption = #1050#1086#1085#1090#1072#1082#1090
    end
    object edtContact: TDBComboBoxEh
      Left = 74
      Top = 2
      Width = 373
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DropDownBox.AutoDrop = True
      EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072' '#1080' '#1076#1088#1091#1075#1086#1081' '#1082#1086#1085#1090#1072#1082#1090
      EditButtons = <>
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnClick = edtContactClick
      OnEnter = edtContactEnter
    end
  end
  object pnlBtm: TPanel
    Left = 0
    Top = 355
    Width = 451
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 9
    DesignSize = (
      451
      35)
    object btnOkandRequest: TBitBtn
      Left = 123
      Top = 4
      Width = 116
      Height = 27
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1089#1086#1079#1076#1072#1090#1100' '#1079#1072#1103#1074#1082#1091
      Anchors = [akLeft, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089' '#1079#1072#1103#1074#1082#1086#1081
      NumGlyphs = 2
      TabOrder = 3
      TabStop = False
      OnClick = btnOkandRequestClick
    end
    object btnCancel: TBitBtn
      Left = 360
      Top = 4
      Width = 87
      Height = 27
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnOk: TButton
      Left = 245
      Top = 4
      Width = 109
      Height = 27
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akLeft, akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnOkandTask: TBitBtn
      Left = 5
      Top = 4
      Width = 116
      Height = 27
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1089#1086#1079#1076#1072#1090#1100' '#1079#1072#1076#1072#1095#1091
      Anchors = [akLeft, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089' '#1079#1072#1076#1072#1095#1077#1081
      NumGlyphs = 2
      TabOrder = 2
      TabStop = False
      OnClick = btnOkandTaskClick
    end
  end
  object pnlAddData: TPanel
    Left = 0
    Top = 252
    Width = 451
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    Visible = False
  end
  object pnlDirect: TPanel
    Left = 0
    Top = 118
    Width = 451
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      451
      30)
    object lblDirect: TLabel
      Left = 5
      Top = 8
      Width = 67
      Height = 13
      Caption = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
    end
    object cbDirect: TDBComboBoxEh
      Left = 74
      Top = 6
      Width = 373
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DropDownBox.AutoDrop = True
      EmptyDataInfo.Text = #1053#1072#1087#1088#1072#1074#1083#1077#1085#1080#1077
      EditButtons = <>
      Items.Strings = (
        #1042#1093#1086#1076#1103#1097#1077#1077
        #1048#1089#1093#1086#1076#1103#1097#1077#1077)
      KeyItems.Strings = (
        '0'
        '1')
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = cbDirectChange
    end
  end
  object pnlResult: TPanel
    Left = 0
    Top = 327
    Width = 451
    Height = 28
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 8
    Visible = False
    DesignSize = (
      451
      28)
    object lblResult: TLabel
      Left = 5
      Top = 5
      Width = 53
      Height = 13
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
    end
    object lcbResult: TDBLookupComboboxEh
      Left = 75
      Top = 2
      Width = 372
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.Columns = <
        item
          FieldName = 'O_NAME'
          Width = 25
        end
        item
          FieldName = 'NOTICE'
          Width = 20
        end
        item
          AutoFitColWidth = False
          Checkboxes = True
          FieldName = 'SET_BID'
          Title.Caption = 'BID'
          Width = 10
        end
        item
          AutoFitColWidth = False
          Checkboxes = True
          FieldName = 'SET_TASK'
          Title.Caption = 'TASK'
          Width = 10
        end>
      DropDownBox.ListSource = srcResult
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1079#1074#1086#1085#1082#1072
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcResult
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnClick = DBLookupComboboxClick
    end
  end
  object pnlTags: TPanel
    Left = 0
    Top = 286
    Width = 451
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    Visible = False
  end
  object srcRecourse: TDataSource
    AutoEdit = False
    DataSet = dsRecourses
    Left = 371
    Top = 190
  end
  object dsRecourses: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    rt.RT_ID'
      '  , rt.TYPE_ID'
      '  , rt.NAME'
      '  , NOTICE'
      '  , rt.NEED_REQUEST'
      '  , r.o_name'
      '  , coalesce(r.O_CHARFIELD, '#39#39') AddData'
      '  , coalesce(r.O_Check, '#39#39') TagsList'
      '  , cast(coalesce(r.O_Numericfield, -1) as integer) DIRECT'
      '  from RECOURSE_TEMPLATES rt'
      
        '       inner join Objects r on (rt.type_id = r.o_id and r.o_type' +
        ' = 8 and r.o_deleted = 0)'
      '  where coalesce(rt.Deleted, 0) = 0'
      '        and ((:direct is null)'
      
        '          or (cast(coalesce(r.O_Numericfield, -1) as integer) = ' +
        '-1)'
      
        '          or (cast(coalesce(r.O_Numericfield, -1) as integer) = ' +
        ':direct))'
      '        and (:current_user = '#39'SYSDBA'#39
      '          or (not exists(select'
      '                             gr.Group_Id'
      '                           from Sys$Group_Rights gr'
      '                           where gr.Rights_Type = 4))'
      '          or (exists(select'
      '                         gr.Right_Id'
      '                       from sys$user u'
      
        '                            inner join sys$user_groups ug on (u.' +
        'id = ug.user_id)'
      
        '                            inner join sys$group_rights gr on (u' +
        'g.group_id = gr.group_id)'
      
        '                            inner join sys$group g on (ug.group_' +
        'id = g.id)'
      '                       where g.lockedout = 0'
      '                             and u.Lockedout = 0'
      '                             and gr.rights_type = 4'
      '                             and u.ibname = current_user'
      '                             and gr.Right_Id = rt.Type_Id)))'
      '  order by rt.NAME, r.o_name')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 371
    Top = 251
  end
  object dsTypes: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT O_ID, O_NAME, O_DESCRIPTION, coalesce(O_CHARFIELD, '#39#39') O_' +
        'CHARFIELD'
      'FROM OBJECTS'
      'WHERE O_TYPE = 8 AND O_DELETED = 0'
      'order BY O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 95
    Top = 244
  end
  object srcTypes: TDataSource
    DataSet = dsTypes
    Left = 142
    Top = 249
  end
  object dsStreets: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT s.street_id, s.street_name||'#39' '#39'||s.street_short street_na' +
        'me, a.area_name'
      'FROM STREET s left outer join area a on (a.area_id = s.area_id)'
      'ORDER BY STREET_NAME, a.area_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 93
    Top = 15
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 48
    Top = 19
  end
  object dsHomes: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    H.HOUSE_ID,'
      '    H.STREET_ID,'
      '    H.HOUSE_NO,'
      '    H.Q_FLAT'
      'FROM'
      '    HOUSE H'
      'where h.street_id = :street_id'
      '@@AREA_LOCK% @ -- '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1088#1072#1081#1086#1085#1072#1084
      'order by h.HOUSE_NO'
      '')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcStreet
    Left = 202
    Top = 17
  end
  object srcHouse: TDataSource
    DataSet = dsHomes
    Left = 155
    Top = 17
  end
  object actlst1: TActionList
    Left = 234
    Top = 231
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ShortCut = 16397
      OnExecute = actSaveExecute
    end
    object ActFind: TAction
      Caption = #1053#1072#1081#1090#1080' '#1072#1073#1086#1085#1077#1085#1090#1072
      Hint = #1053#1072#1081#1090#1080' '#1072#1073#1086#1085#1077#1085#1090#1072' '#1087#1086' '#1072#1076#1088#1077#1089#1091
      OnExecute = ActFindExecute
    end
    object actClear: TAction
      Caption = 'X'
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1088#1077#1079#1091#1083#1100#1090#1072#1090' '#1087#1086#1080#1089#1082#1072' '#1072#1073#1086#1085#1077#1085#1090#1072
      OnExecute = actClearExecute
    end
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 272
    Top = 16
  end
  object PropStorageEh: TPropStorageEh
    Section = 'RECOURSE'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'pnlInfo.<P>.Height')
    Left = 378
    Top = 16
  end
  object dsResult: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '  , O_NAME'
      '  , O_DESCRIPTION'
      '  , iif(position('#39'bid'#39', o_check) > 0, 1, 0) SET_BID'
      '  , iif(position('#39'task'#39', o_check) > 0, 1, 0) SET_TASK'
      '  from OBJECTS o'
      '  where O_TYPE = 81'
      '        and O_DELETED = 0'
      '        and O_Numericfield = :RT_ID'
      '  order by O_NAME  ')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 239
    Top = 308
  end
  object srcResult: TDataSource
    AutoEdit = False
    DataSet = dsResult
    Left = 294
    Top = 305
  end
end
