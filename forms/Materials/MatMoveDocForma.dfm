object MatMoveDocForm: TMatMoveDocForm
  Left = 0
  Top = 0
  Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099'. '#1044#1086#1082#1091#1084#1077#1085#1090' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
  ClientHeight = 506
  ClientWidth = 713
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
    Width = 713
    Height = 156
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      713
      156)
    object lbl1: TLabel
      Left = 8
      Top = 18
      Width = 66
      Height = 13
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#8470
    end
    object Label1: TLabel
      Left = 500
      Top = 18
      Width = 64
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072' '#1076#1086#1082'-'#1090#1072
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
    object Label4: TLabel
      Left = 514
      Top = 46
      Width = 50
      Height = 13
      Caption = #1089#1086' '#1089#1082#1083#1072#1076#1072
    end
    object edtD_N: TDBEditEh
      Left = 100
      Top = 15
      Width = 394
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
      Left = 570
      Top = 15
      Width = 138
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
      Width = 608
      Height = 49
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcDoc
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 4
      Visible = True
      WantReturns = True
    end
    object lcbWH: TDBLookupComboboxEh
      Left = 100
      Top = 42
      Width = 394
      Height = 21
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
      Left = 492
      Top = 125
      Width = 216
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 7
      OnClick = btnSaveClick
    end
    object btnClose: TButton
      Left = 5
      Top = 125
      Width = 125
      Height = 25
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      TabOrder = 6
      TabStop = False
      OnClick = btnCloseClick
    end
    object lcbFROM_WH: TDBLookupComboboxEh
      Left = 570
      Top = 42
      Width = 137
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'FROM_WH'
      DataSource = srcDoc
      EmptyDataInfo.Text = #1055#1088#1080#1093#1086#1076' '#1089#1086' '#1089#1082#1083#1072#1076#1072
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcFromWH
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object btnOpen: TButton
      Left = 5
      Top = 125
      Width = 125
      Height = 25
      Hint = #1054#1090#1082#1072#1090#1080#1090#1100' '#1079#1072#1082#1088#1099#1090#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      Caption = #1054#1090#1084#1077#1085#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
      TabOrder = 5
      Visible = False
      OnClick = btnOpenClick
    end
  end
  object pnlMat: TPanel
    Left = 0
    Top = 156
    Width = 713
    Height = 350
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dbgDocMat: TDBGridEh
      Left = 0
      Top = 140
      Width = 713
      Height = 210
      Align = alClient
      AllowedOperations = [alopDeleteEh]
      DataSource = srcDocMat
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      PopupMenu = pmGrid
      SearchPanel.Enabled = True
      SearchPanel.FilterOnTyping = True
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
          Width = 65
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
      Width = 713
      Height = 140
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        713
        140)
      object lbl3: TLabel
        Left = 8
        Top = 9
        Width = 50
        Height = 13
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083
      end
      object Label3: TLabel
        Left = 5
        Top = 63
        Width = 61
        Height = 13
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      end
      object lblDem: TLabel
        Left = 5
        Top = 36
        Width = 35
        Height = 13
        Caption = #1050#1086#1083'-'#1074#1086
      end
      object lbl4: TLabel
        Left = 177
        Top = 36
        Width = 26
        Height = 13
        Caption = #1062#1077#1085#1072
      end
      object edtMaterial: TDBEditEh
        Left = 75
        Top = 6
        Width = 632
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
            DropDownFormParams.DropDownFormClassName = 'TMaterialsMoveSelect'
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
        Left = 75
        Top = 33
        Width = 85
        Height = 21
        DynProps = <>
        EmptyDataInfo.Text = #1050#1086#1083'-'#1074#1086
        EditButtons = <>
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object memNotice: TDBMemoEh
        Left = 75
        Top = 60
        Width = 632
        Height = 50
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
        Left = 75
        Top = 114
        Width = 632
        Height = 24
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 3
        OnClick = btnAddClick
      end
      object edtCost: TDBNumberEditEh
        Left = 215
        Top = 33
        Width = 85
        Height = 21
        DynProps = <>
        EmptyDataInfo.Text = #1062#1077#1085#1072
        Enabled = False
        EditButtons = <>
        ShowHint = True
        TabOrder = 2
        Visible = True
      end
      object btnDel: TBitBtn
        Left = 5
        Top = 110
        Width = 25
        Height = 25
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091' '#1089' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1084
        Anchors = [akLeft, akBottom]
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000008C98D6FF00000000000000000000000000000000000000000000
          000000000000000000008390D5FF000000000000000000000000000000000000
          00008693D6FF324BCCFF3C53CDFF000000000000000000000000000000000000
          000000000000455BCEFF324BCCFF7484D3FF000000000000000000000000909C
          D7FF324BCCFF324BCCFF324BCCFF3C53CDFF0000000000000000000000000000
          0000455BCEFF324BCCFF324BCCFF324BCCFF808ED5FF00000000000000000000
          00004359CEFF324BCCFF324BCCFF324BCCFF3C53CDFF0000000000000000455B
          CEFF324BCCFF324BCCFF324BCCFF3F56CDFF0000000000000000000000000000
          0000000000004359CEFF324BCCFF324BCCFF324BCCFF3C53CDFF445ACEFF324B
          CCFF324BCCFF324BCCFF3F56CDFF000000000000000000000000000000000000
          000000000000000000004359CEFF324BCCFF324BCCFF324BCCFF324BCCFF324B
          CCFF324BCCFF3F56CDFF00000000000000000000000000000000000000000000
          00000000000000000000000000004359CEFF324BCCFF324BCCFF324BCCFF324B
          CCFF3F56CDFF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000455BCEFF324BCCFF324BCCFF324BCCFF324B
          CCFF3C53CDFF0000000000000000000000000000000000000000000000000000
          00000000000000000000455BCEFF324BCCFF324BCCFF324BCCFF324BCCFF324B
          CCFF324BCCFF3C53CDFF00000000000000000000000000000000000000000000
          000000000000455BCEFF324BCCFF324BCCFF324BCCFF3F56CDFF4359CEFF324B
          CCFF324BCCFF324BCCFF3C53CDFF000000000000000000000000000000000000
          0000455BCEFF324BCCFF324BCCFF324BCCFF3F56CDFF00000000000000004359
          CEFF324BCCFF324BCCFF324BCCFF3C53CDFF000000000000000000000000ABB2
          DAFF354DCCFF324BCCFF324BCCFF3F56CDFF0000000000000000000000000000
          00004359CEFF324BCCFF324BCCFF344CCCFFA4ACD9FF00000000000000000000
          0000A7AFDAFF354DCCFF3F56CDFF000000000000000000000000000000000000
          0000000000004359CEFF344CCCFFA2ABD9FF0000000000000000000000000000
          000000000000A9B1DAFF00000000000000000000000000000000000000000000
          00000000000000000000A6AED9FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        TabOrder = 5
        TabStop = False
        OnClick = btnDelClick
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
      '    WH_ID = :WH_ID,'
      '    FROM_WH = :FROM_WH'
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
      '    WH_ID,'
      '    FROM_WH'
      ')'
      'VALUES('
      '    :DOC_ID,'
      '    :DOC_N,'
      '    :DOC_DATE,'
      '    :DT_ID,'
      '    :NOTICE,'
      '    :WH_ID,'
      '    :FROM_WH'
      ')')
    RefreshSQL.Strings = (
      'select'
      
        '    Doc_Id, Doc_N, Doc_Date, Dt_Id, Notice, Wh_Id, coalesce(Doc_' +
        'Closed, 0) Doc_Closed, d.From_Wh'
      '  from MATERIAL_DOCS d'
      '  where (     D.DOC_ID = :OLD_DOC_ID'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      
        '    Doc_Id, Doc_N, Doc_Date, Dt_Id, Notice, Wh_Id, coalesce(Doc_' +
        'Closed, 0) Doc_Closed, d.From_Wh'
      '  from MATERIAL_DOCS d'
      '  where d.Dt_Id = :DocumentType and d.DOC_ID = :DOC_ID'
      '  ')
    AutoUpdateOptions.UpdateTableName = 'MATERIAL_DOCS'
    AutoUpdateOptions.KeyFields = 'DOC_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    OnNewRecord = dsDocNewRecord
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
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
      '        ID = :OLD_ID'
      '    and M_ID = :OLD_M_ID'
      '    and DOC_ID = :OLD_DOC_ID   ')
    DeleteSQL.Strings = (
      'execute block ('
      '    OLD_ID     integer = :OLD_ID,'
      '    OLD_M_ID   integer = :OLD_M_ID,'
      '    OLD_DOC_ID integer = :OLD_DOC_ID,'
      '    OLD_Serial   D_SERIAL = :OLD_Serial)'
      'as'
      'declare variable FROM_WH D_UID_NULL;'
      'begin'
      '  -- '#1091#1076#1072#1083#1080#1084' '#1090#1086#1083#1100#1082#1086' '#1077#1089#1083#1080' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1085#1077' '#1079#1072#1082#1088#1099#1090
      '  if (exists(select'
      '                 Doc_Closed'
      '               from Material_Docs'
      '               where Doc_Id = :OLD_DOC_ID'
      '                     and Doc_Closed = 0'
      ''
      '      )) then begin'
      ''
      '    OLD_Serial = coalesce(OLD_Serial, '#39#39');'
      ''
      '    delete from MATERIALS_IN_DOC'
      '        where ID = :OLD_ID'
      '              and M_ID = :OLD_M_ID'
      '              and DOC_ID = :OLD_DOC_ID;'
      ''
      '    delete from Materials_In_Doc_Unit'
      '        where (Doc_Id = :OLD_DOC_ID)'
      '              and (M_Id = :OLD_M_ID)'
      '              and (SERIAL = :OLD_Serial);'
      ''
      '    if (OLD_Serial <> '#39#39') then begin'
      '      select'
      '          d.From_Wh'
      '        from Material_Docs d'
      '        where d.Doc_Id = :OLD_Doc_Id'
      '      into :From_Wh;'
      ''
      '      update Material_Unit u'
      '      set State = 0'
      '      where M_Id = :OLD_M_id'
      '            and u.Serial = :OLD_SERIAL'
      '            and u.Owner = :FROM_WH'
      '            and u.Owner_Type = 0'
      '            and u.State = (-1*:OLD_Doc_Id);'
      '    end'
      '  end'
      'end')
    InsertSQL.Strings = (
      'execute block ('
      '    Id       D_Uid_Null = :Id,'
      '    M_Id     UID = :M_Id,'
      '    M_Cost   D_N15_2 = :M_Cost,'
      '    M_Quant  D_N15_5 = :M_Quant,'
      '    M_Notice D_NOTICE = :M_Notice,'
      '    Doc_Id   UID = :Doc_Id,'
      '    Serial   D_SERIAL = :Serial)'
      'as'
      'declare variable WH_ID   D_UID_NULL;'
      'declare variable FROM_WH D_UID_NULL;'
      'begin'
      '  Serial = coalesce(Serial, '#39#39');'
      '  ID = coalesce(ID, gen_id(GEN_UID, 1));'
      ''
      
        '  insert into MATERIALS_IN_DOC (ID, M_ID, M_COST, M_QUANT, M_NOT' +
        'ICE, DOC_ID)'
      '  values (:ID, :M_ID, :M_COST, :M_QUANT, :M_NOTICE, :DOC_ID);'
      ''
      '  if (Serial <> '#39#39') then begin'
      '    select'
      '        d.Wh_Id'
      '      , d.From_Wh'
      '      from Material_Docs d'
      '      where d.Doc_Id = :Doc_Id'
      '    into :Wh_Id, :From_Wh;'
      ''
      
        '    insert into Materials_In_Doc_Unit (Doc_Id, M_Id, Id, Serial,' +
        ' Mac, Notice, S_Version)'
      '    select'
      '        :DOC_ID'
      '      , m.M_Id'
      '      , :ID'
      '      , u.Serial'
      '      , u.Mac'
      '      , u.Notice'
      '      , u.S_Version'
      '      from materials m'
      '           inner join Material_Unit u on (u.M_Id = m.M_Id)'
      '      where u.Serial = :SERIAL'
      '            and u.Owner = :FROM_WH'
      '            and u.Owner_Type = 0'
      '            and u.State = 0;'
      ''
      '    update Material_Unit u'
      '    set State = -1*:Doc_Id'
      '    where M_Id = :M_id'
      '          and u.Serial = :SERIAL'
      '          and u.Owner = :FROM_WH'
      '          and u.Owner_Type = 0'
      '          and u.State = 0;'
      '  end'
      'end')
    RefreshSQL.Strings = (
      'select'
      '    md.Id'
      '  , md.M_Id'
      
        '  , m.Name || coalesce('#39'/'#39' || u.Serial || coalesce('#39'/'#39' || u.MAC,' +
        ' '#39#39'), '#39#39') NAME'
      '  , m.M_NUMBER'
      '  , md.M_Quant'
      '  , md.M_Cost'
      '  , md.M_Notice'
      '  , g.Mg_Name'
      '  , md.Doc_Id'
      '  , (coalesce(md.M_Quant, 0) * md.M_Cost) as Itogo'
      '  , u.Serial'
      '  from materials m'
      '       inner join Materials_In_Doc md on (m.M_Id = md.M_Id)'
      '       left outer join Materials_Group g on (m.Mg_Id = g.Mg_Id)'
      
        '       left outer join Materials_In_Doc_Unit u on (u.M_Id = m.M_' +
        'Id and'
      '             u.Id = md.Id and'
      '             u.Doc_Id = md.Doc_Id)'
      '  where md.ID = :OLD_ID'
      '    and md.M_ID = :OLD_M_ID'
      '    and md.DOC_ID = :OLD_DOC_ID')
    SelectSQL.Strings = (
      'select'
      '    md.Id'
      '  , md.M_Id'
      
        '  , m.Name || coalesce('#39'/'#39' || u.Serial || coalesce('#39'/'#39' || u.MAC,' +
        ' '#39#39'), '#39#39') NAME'
      '  , m.M_NUMBER'
      '  , md.M_Quant'
      '  , md.M_Cost'
      '  , md.M_Notice'
      '  , g.Mg_Name'
      '  , md.Doc_Id'
      '  , (coalesce(md.M_Quant, 0) * md.M_Cost) as Itogo'
      '  , u.Serial'
      '  from materials m'
      '       inner join Materials_In_Doc md on (m.M_Id = md.M_Id)'
      '       left outer join Materials_Group g on (m.Mg_Id = g.Mg_Id)'
      
        '       left outer join Materials_In_Doc_Unit u on (u.M_Id = m.M_' +
        'Id and'
      '             u.Id = md.Id and'
      '             u.Doc_Id = md.Doc_Id)'
      '  where md.Doc_Id = :doc_id'
      '  order by m.Name ')
    AutoUpdateOptions.UpdateTableName = 'MATERIALS_IN_DOC'
    AutoUpdateOptions.KeyFields = 'ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
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
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 256
    Top = 289
  end
  object dsMaterials: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    m.M_Id'
      
        '  , m.Name || coalesce('#39'/'#39' || u.Serial || coalesce('#39'/'#39' || u.MAC,' +
        ' '#39#39'), '#39#39')  NAME'
      '  , m.Dimension'
      '  , iif(m.Is_Unit = 1, 1, r.Mr_Quant) Mr_Quant'
      '  , r.Mr_Cost'
      '  , g.Mg_Name'
      '  , m.DESCRIPTION'
      '  , u.Serial'
      '  from materials m'
      '       inner join Materials_Remain r on (m.M_Id = r.M_Id)'
      '       left outer join Materials_Group g on (m.Mg_Id = g.Mg_Id)'
      '       left outer join Material_Unit u on (u.M_Id = m.M_Id and'
      '             u.Owner = :FROM_WH and'
      '             u.Owner_Type = 0 and'
      '             u.State = 0)'
      '  where r.Wh_Id = :FROM_WH'
      '        and coalesce(m.deleted, 0) = 0'
      
        '        and ((coalesce(m.Is_Unit, 0) = 0) or (not u.Serial is nu' +
        'll))'
      '  order by m.Name, g.Mg_Name')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 312
    Top = 368
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
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 312
    Top = 289
  end
  object dsWH: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID, O_NAME, O_DESCRIPTION'
      '  from OBJECTS o'
      '  where O_TYPE = 10'
      '        and ((exists(select'
      '                         w.wh_id'
      '                       from SYS$USER u'
      
        '                            inner join sys$user_wh w on (w.user_' +
        'id = u.id)'
      '                       where u.ibname = current_user'
      '                             and w.can_edit = 1'
      '                             and w.Wh_Id = o.O_Id))'
      '          or (current_user = '#39'SYSDBA'#39'))'
      ''
      '        and coalesce(o.O_Deleted, 0) = 0'
      '  order by O_NAME')
    Transaction = trReadDS
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 239
    Top = 225
  end
  object srcWH: TDataSource
    AutoEdit = False
    DataSet = dsWH
    Left = 376
    Top = 233
  end
  object qCloseDoc: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select Result from Close_Material_Doc(:Doc_Id) ')
    Left = 504
    Top = 316
  end
  object srcFromWH: TDataSource
    DataSet = dsWH
    Left = 320
    Top = 225
  end
  object qOpenDoc: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select Result from Open_Material_Doc(:Doc_Id) ')
    Left = 576
    Top = 324
  end
  object qCheckCount: TpFIBQuery
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    SQL.Strings = (
      'select'
      '    list(m.Name||'#39' ('#39'||coalesce(mr.Mr_Quant, 0)||'#39')'#39') MAT_LIST'
      '  from Materials m'
      '       inner join (select'
      
        '                      md.M_Id, iif(d.Dt_Id = 3, d.Wh_Id, d.From_' +
        'Wh) WH_ID, sum(md.M_Quant) MD_QUANT'
      '                    from Material_Docs d'
      
        '                         inner join Materials_In_Doc md on (d.Do' +
        'c_Id = md.Doc_Id)'
      '                    where d.Doc_Id = :doc '
      '                    group by 1, 2) mdo on (mdo.M_ID = m.M_Id)'
      
        '       left outer join Materials_Remain mr on (mdo.M_ID = mr.M_I' +
        'd and mr.Wh_Id = mdo.Wh_Id)'
      '  where (mdo.MD_QUANT < 0)'
      '          or (mdo.MD_QUANT > coalesce(mr.Mr_Quant, 0))')
    Left = 408
    Top = 340
  end
  object actList: TActionList
    Left = 344
    Top = 70
    object actDelRecord: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnExecute = actDelRecordExecute
    end
    object actDocOpen: TAction
      Caption = #1054#1090#1084#1077#1085#1072' '#1087#1088#1086#1074#1086#1076#1082#1080
    end
    object actDocClose: TAction
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
    end
    object actEditNote: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
      OnExecute = actEditNoteExecute
    end
  end
  object pmGrid: TPopupMenu
    Left = 432
    Top = 332
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
  object trReadDS: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 72
    Top = 398
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
    Left = 152
    Top = 404
  end
end
