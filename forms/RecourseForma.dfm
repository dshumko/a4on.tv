object RecourseForm: TRecourseForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = #1054#1073#1088#1072#1097#1077#1085#1080#1077' '#1072#1073#1086#1085#1077#1085#1090#1072
  ClientHeight = 307
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlNotice: TPanel
    Left = 0
    Top = 170
    Width = 467
    Height = 102
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      467
      102)
    object mmoNotice: TDBMemoEh
      Left = 5
      Top = 0
      Width = 457
      Height = 102
      Anchors = [akLeft, akTop, akRight, akBottom]
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
    Top = 114
    Width = 467
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    OnEnter = pnlRecourseEnter
    DesignSize = (
      467
      25)
    object lblAttribute: TLabel
      Left = 5
      Top = 6
      Width = 64
      Height = 13
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
    end
    object cbRecourse: TDBLookupComboboxEh
      Left = 74
      Top = 3
      Width = 388
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
      OnClick = cbRecourseClick
    end
  end
  object pnlInfo: TPanel
    Left = 0
    Top = 0
    Width = 467
    Height = 71
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    inline CustomerInfoFrm: TCustomerInfoFrm
      Left = 0
      Top = 0
      Width = 467
      Height = 71
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      inherited gbInfo: TGroupBox
        Width = 467
        Height = 71
        inherited lblDebt: TLabel
          Width = 463
          Margins.Bottom = 0
        end
        inherited memAbonent: TMemo
          Width = 463
          Height = 20
        end
        inherited lblFIO: TDBEditEh
          Width = 463
          Margins.Bottom = 0
        end
      end
    end
  end
  object pnlAdres: TPanel
    Left = 0
    Top = 71
    Width = 467
    Height = 43
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      467
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
      Left = 212
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
    end
    object lbl5: TLabel
      Left = 284
      Top = 2
      Width = 13
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1050#1074
    end
    object btnFind: TButton
      Left = 339
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
      Width = 203
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
      Left = 212
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
      Left = 284
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
      Left = 436
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
    Top = 139
    Width = 467
    Height = 31
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      467
      31)
    object lbl2: TLabel
      Left = 5
      Top = 8
      Width = 43
      Height = 13
      Caption = #1050#1086#1085#1090#1072#1082#1090
    end
    object edtContact: TDBComboBoxEh
      Left = 74
      Top = 5
      Width = 388
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072' '#1080' '#1076#1088#1091#1075#1086#1081' '#1082#1086#1085#1090#1072#1082#1090
      EditButtons = <>
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
  end
  object pnlBtm: TPanel
    Left = 0
    Top = 272
    Width = 467
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      467
      35)
    object btnOkandRequest: TBitBtn
      Left = 5
      Top = 4
      Width = 142
      Height = 27
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1089#1086#1079#1076#1072#1090#1100' '#1079#1072#1103#1074#1082#1091
      Anchors = [akLeft, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089' '#1079#1072#1103#1074#1082#1086#1081
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOkandRequestClick
    end
    object btnOk: TBitBtn
      Left = 159
      Top = 4
      Width = 171
      Height = 27
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnOkClick
    end
    object btnCancel: TBitBtn
      Left = 339
      Top = 4
      Width = 123
      Height = 27
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 2
      OnClick = btnCancelClick
    end
  end
  object srcRecourse: TDataSource
    AutoEdit = False
    DataSet = dsRecourses
    Left = 155
    Top = 198
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
      '  from RECOURSE_TEMPLATES rt'
      '       inner join Objects r on (rt.type_id = r.o_id and'
      '             r.o_type = 8 and r.o_deleted = 0)'
      '  where coalesce(rt.Deleted,0) = 0'
      '  order by rt.NAME, r.o_name')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 91
    Top = 179
  end
  object dsTypes: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT O_ID, O_NAME, O_DESCRIPTION'
      'FROM OBJECTS'
      'WHERE O_TYPE = 8 AND O_DELETED = 0'
      'order BY O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 215
    Top = 204
  end
  object srcTypes: TDataSource
    DataSet = dsTypes
    Left = 262
    Top = 201
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
    Left = 53
    Top = 215
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 352
    Top = 227
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
    Left = 290
    Top = 153
  end
  object srcHouse: TDataSource
    DataSet = dsHomes
    Left = 331
    Top = 169
  end
  object actlst1: TActionList
    Left = 18
    Top = 175
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
    Left = 128
    Top = 32
  end
  object PropStorageEh: TPropStorageEh
    Section = 'RECOURSE'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 338
    Top = 16
  end
end
