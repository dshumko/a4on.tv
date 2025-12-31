object MatCorrectionDocForm: TMatCorrectionDocForm
  Left = 0
  Top = 0
  ClientHeight = 397
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 683
    Height = 156
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      683
      156)
    object lbl1: TLabel
      Left = 8
      Top = 18
      Width = 66
      Height = 13
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#8470
    end
    object Label1: TLabel
      Left = 470
      Top = 18
      Width = 84
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object lbl2: TLabel
      Left = 8
      Top = 45
      Width = 86
      Height = 13
      Caption = #1055#1088#1080#1093#1086#1076' '#1085#1072' '#1089#1082#1083#1072#1076
    end
    object Label2: TLabel
      Left = 8
      Top = 72
      Width = 61
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object lbl5: TLabel
      Left = 138
      Top = 130
      Width = 286
      Height = 13
      Caption = #1050#1086#1083'-'#1074#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1072' '#1084#1077#1085#1103#1077#1090#1100#1089#1103' '#1085#1072' +/- '#1082#1086#1083'-'#1074#1072' '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1077
    end
    object edtD_N: TDBEditEh
      Left = 100
      Top = 15
      Width = 364
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DOC_N'
      DataSource = srcDoc
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object deD_DATE: TDBDateTimeEditEh
      Left = 560
      Top = 15
      Width = 118
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'DOC_DATE'
      DataSource = srcDoc
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object dbmhD_NOTICE: TDBMemoEh
      Left = 100
      Top = 69
      Width = 578
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcDoc
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 3
      Visible = True
      WantReturns = True
    end
    object lcbWH: TDBLookupComboboxEh
      Left = 100
      Top = 42
      Width = 578
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'WH_ID'
      DataSource = srcDoc
      EmptyDataInfo.Text = #1055#1088#1080#1093#1086#1076' '#1085#1072' '#1089#1082#1083#1072#1076
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcWH
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object btnSave: TButton
      Left = 462
      Top = 125
      Width = 216
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 5
      OnClick = btnSaveClick
    end
    object btnClose: TButton
      Left = 5
      Top = 125
      Width = 124
      Height = 25
      Action = actDocClose
      TabOrder = 4
      TabStop = False
    end
    object btnOpen: TButton
      Left = 4
      Top = 125
      Width = 125
      Height = 25
      Action = actDocOpen
      TabOrder = 6
    end
  end
  object pnlMat: TPanel
    Left = 0
    Top = 156
    Width = 683
    Height = 241
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dbgDocMat: TDBGridEh
      Left = 0
      Top = 89
      Width = 683
      Height = 152
      Align = alClient
      AllowedOperations = [alopUpdateEh, alopDeleteEh]
      DataSource = srcDocMat
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      PopupMenu = pmGrid
      SumList.Active = True
      TabOrder = 1
      TitleParams.MultiTitle = True
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
          Title.TitleButton = True
          Width = 193
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#0.###'
          DynProps = <>
          EditButtons = <>
          FieldName = 'M_QUANT'
          Footer.DisplayFormat = ',#0.###'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.TitleButton = True
          Width = 68
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#0.###'
          DynProps = <>
          EditButtons = <>
          FieldName = 'M_COST'
          Footer.DisplayFormat = ',#0.###'
          Footers = <>
          Title.Caption = #1062#1077#1085#1072
          Title.TitleButton = True
          Width = 86
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#0.###'
          DynProps = <>
          EditButtons = <>
          FieldName = 'ITOGO'
          Footer.DisplayFormat = ',#0.###'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
          Title.TitleButton = True
          Width = 88
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MG_NAME'
          Footers = <>
          Title.Caption = #1043#1088#1091#1087#1087#1072
          Title.TitleButton = True
          Width = 83
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'M_NUMBER'
          Footers = <>
          Title.Caption = #1053#1086#1084'. '#1085#1086#1084#1077#1088
          Title.TitleButton = True
          Width = 69
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'M_NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 137
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object pnlMatAdd: TPanel
      Left = 0
      Top = 0
      Width = 683
      Height = 89
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      DesignSize = (
        683
        89)
      object lbl3: TLabel
        Left = 8
        Top = 9
        Width = 50
        Height = 13
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083
      end
      object Label3: TLabel
        Left = 8
        Top = 36
        Width = 61
        Height = 13
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      end
      object lblDem: TLabel
        Left = 359
        Top = 9
        Width = 35
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1050#1086#1083'-'#1074#1086
      end
      object lbl4: TLabel
        Left = 485
        Top = 9
        Width = 26
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1062#1077#1085#1072
      end
      object edtMaterial: TDBEditEh
        Left = 100
        Top = 6
        Width = 245
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <
          item
            Name = 'ID'
          end
          item
            Name = 'NAME'
          end>
        EditButtons = <
          item
            DropDownFormParams.Align = daLeft
            DropDownFormParams.DropDownFormClassName = 'TMaterialsSelect'
            DropDownFormParams.PassParams = pspCustomValuesEh
          end>
        EmptyDataInfo.Text = #1052#1072#1090#1077#1088#1080#1072#1083
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnCloseDropDownForm = edtMaterialCloseDropDownForm
        OnEnter = edtMaterialEnter
        OnOpenDropDownForm = edtMaterialOpenDropDownForm
      end
      object edtQuant: TDBNumberEditEh
        Left = 416
        Top = 6
        Width = 57
        Height = 21
        Anchors = [akTop, akRight]
        DynProps = <>
        EmptyDataInfo.Text = #1050#1086#1083'-'#1074#1086
        EditButtons = <>
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object memNotice: TDBMemoEh
        Left = 100
        Top = 33
        Width = 501
        Height = 40
        TabStop = False
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        ShowHint = True
        TabOrder = 4
        Visible = True
        WantReturns = True
      end
      object btnAdd: TButton
        Left = 607
        Top = 6
        Width = 71
        Height = 67
        Anchors = [akTop, akRight, akBottom]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 3
        OnClick = btnAddClick
      end
      object edtCost: TDBNumberEditEh
        Left = 517
        Top = 6
        Width = 84
        Height = 21
        Anchors = [akTop, akRight]
        DynProps = <>
        EmptyDataInfo.Text = #1062#1077#1085#1072
        EditButtons = <>
        ShowHint = True
        TabOrder = 2
        Visible = True
      end
    end
  end
  object dsDoc: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE MATERIAL_DOCS'
      'SET '
      '    DOC_N = :DOC_N,'
      '    DOC_DATE = :DOC_DATE,'
      '    DT_ID = :DT_ID,'
      '    NOTICE = :NOTICE,'
      '    WH_ID = :WH_ID'
      'WHERE'
      '    DOC_ID = :OLD_DOC_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    MATERIAL_DOCS'
      'WHERE'
      '        DOC_ID = :OLD_DOC_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO MATERIAL_DOCS('
      '    DOC_ID,'
      '    DOC_N,'
      '    DOC_DATE,'
      '    DT_ID,'
      '    NOTICE,'
      '    WH_ID'
      ')'
      'VALUES('
      '    :DOC_ID,'
      '    :DOC_N,'
      '    :DOC_DATE,'
      '    :DT_ID,'
      '    :NOTICE,'
      '    :WH_ID'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    d.*'
      '  from MATERIAL_DOCS d'
      '  where(  d.DOC_ID = :DOC_ID'
      '     ) '
      '  ')
    SelectSQL.Strings = (
      'select'
      
        '    Doc_Id, Doc_N, Doc_Date, Dt_Id, Notice, Wh_Id, coalesce(Doc_' +
        'Closed, 0) Doc_Closed'
      '  from MATERIAL_DOCS d'
      '  where d.Dt_Id = :DocumentType and d.DOC_ID = :DOC_ID'
      '  ')
    AutoUpdateOptions.UpdateTableName = 'MATERIAL_DOCS'
    AutoUpdateOptions.KeyFields = 'DOC_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    OnNewRecord = dsDocNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 24
    Top = 288
  end
  object dsDocMat: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE MATERIALS_IN_DOC'
      'SET '
      '    M_QUANT = :M_QUANT,'
      '    M_COST = :M_COST,'
      '    M_NOTICE = :M_NOTICE'
      'WHERE'
      '    M_ID = :OLD_M_ID'
      '    and DOC_ID = :OLD_DOC_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    MATERIALS_IN_DOC'
      'WHERE'
      '    ID = :OLD_ID')
    InsertSQL.Strings = (
      'INSERT INTO MATERIALS_IN_DOC('
      '    M_ID,'
      '    M_COST,'
      '    M_QUANT,'
      '    M_NOTICE,'
      '    DOC_ID'
      ')'
      'VALUES('
      '    :M_ID,'
      '    :M_COST,'
      '    :M_QUANT,    '
      '    :M_NOTICE,'
      '    :DOC_ID'
      ')')
    RefreshSQL.Strings = (
      'select'
      
        '    md.Id, md.M_Id, m.Name, md.M_Quant, md.M_Cost, md.M_Notice, ' +
        'g.Mg_Name, md.Doc_Id, (coalesce(md.M_Quant,0) * coalesce(md.M_Co' +
        'st, 0)) as Itogo'
      '  from materials m'
      '       inner join Materials_In_Doc md on (m.M_Id = md.M_Id)'
      '       left outer join Materials_Group g on (m.Mg_Id = g.Mg_Id)'
      '  where(  md.Doc_Id = :doc_id'
      '     ) and (     MD.M_ID = :OLD_M_ID'
      '    and MD.DOC_ID = :OLD_DOC_ID'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    md.ID'
      '  , md.M_Id'
      '  , m.Name'
      '  , m.M_NUMBER'
      '  , md.M_Quant'
      '  , md.M_Cost'
      '  , md.M_Notice'
      '  , g.Mg_Name'
      '  , md.Doc_Id'
      '  , (coalesce(md.M_Quant, 0) * coalesce(md.M_Cost, 0)) as Itogo'
      '  from materials m'
      '       inner join Materials_In_Doc md on (m.M_Id = md.M_Id)'
      '       left outer join Materials_Group g on (m.Mg_Id = g.Mg_Id)'
      '  where md.Doc_Id = :doc_id'
      '  order by m.Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcDoc
    Left = 112
    Top = 289
  end
  object srcDoc: TDataSource
    DataSet = dsDoc
    OnStateChange = srcDocStateChange
    Left = 24
    Top = 336
  end
  object srcDocMat: TDataSource
    DataSet = dsDocMat
    Left = 168
    Top = 288
  end
  object dsFindMat: TpFIBDataSet
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 256
    Top = 289
  end
  object dsMaterials: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    m.M_Id, m.Name, m.Dimension, g.Mg_Name, m.DESCRIPTION'
      '  from materials m'
      '       left outer join Materials_Group g on (m.Mg_Id = g.Mg_Id)'
      '  where m.Deleted = 0'
      '  order by m.Name, g.Mg_Name  ')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 360
    Top = 288
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
    Left = 440
    Top = 286
  end
  object errors: TCnErrorProvider
    DoubleBuffer = False
    Left = 208
    Top = 297
  end
  object dsWH: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID, O_NAME, O_DESCRIPTION'
      '  from OBJECTS o'
      '  where O_TYPE = 10 and o.O_DELETED = 0'
      '        and (exists(select'
      '                          w.wh_id'
      '                        from SYS$USER u'
      
        '                             inner join sys$user_wh w on (w.user' +
        '_id = u.id)'
      
        '                        where w.wh_id = o.O_ID and u.ibname = cu' +
        'rrent_user'
      '                              and w.can_edit = 1)'
      '          or (current_user = '#39'SYSDBA'#39'))'
      ''
      '    ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    Left = 79
    Top = 169
  end
  object srcWH: TDataSource
    AutoEdit = False
    DataSet = dsWH
    Left = 136
    Top = 169
  end
  object qCloseDoc: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select Result from Close_Material_Doc(:Doc_Id) ')
    Left = 248
    Top = 172
  end
  object qOpenDoc: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select Result from Open_Material_Doc(:Doc_Id) ')
    Left = 592
    Top = 300
  end
  object pmGrid: TPopupMenu
    Left = 504
    Top = 300
    object miEditNote: TMenuItem
      Action = actEditNote
    end
    object miN1: TMenuItem
      Caption = '-'
    end
    object miDelete: TMenuItem
      Action = actDelRecord
    end
  end
  object actList: TActionList
    Left = 312
    Top = 300
    object actDelRecord: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnExecute = actDelRecordExecute
    end
    object actDocOpen: TAction
      Caption = #1054#1090#1084#1077#1085#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      OnExecute = actDocOpenExecute
    end
    object actDocClose: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      OnExecute = actDocCloseExecute
    end
    object actEditNote: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
      OnExecute = actEditNoteExecute
    end
  end
end
