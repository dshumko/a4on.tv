object MatOutDocForm: TMatOutDocForm
  Left = 0
  Top = 0
  Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099'. '#1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1087#1080#1089#1072#1085#1080#1103
  ClientHeight = 460
  ClientWidth = 694
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
    Width = 694
    Height = 156
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitWidth = 683
    DesignSize = (
      694
      156)
    object lbl1: TLabel
      Left = 8
      Top = 18
      Width = 66
      Height = 13
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#8470
    end
    object Label1: TLabel
      Left = 481
      Top = 18
      Width = 84
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      ExplicitLeft = 470
    end
    object lbl2: TLabel
      Left = 8
      Top = 45
      Width = 95
      Height = 13
      Caption = #1057#1087#1080#1089#1072#1090#1100' '#1089#1086' '#1089#1082#1083#1072#1076#1072
    end
    object Label2: TLabel
      Left = 8
      Top = 72
      Width = 61
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object edtD_N: TDBEditEh
      Left = 112
      Top = 15
      Width = 363
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
      ExplicitWidth = 352
    end
    object deD_DATE: TDBDateTimeEditEh
      Left = 571
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
      ExplicitLeft = 560
    end
    object lcbWH: TDBLookupComboboxEh
      Left = 112
      Top = 42
      Width = 577
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'WH_ID'
      DataSource = srcDoc
      EmptyDataInfo.Text = #1057#1087#1080#1089#1072#1085#1080#1077' '#1089#1086' '#1089#1082#1083#1072#1076#1072
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcWH
      ShowHint = True
      TabOrder = 2
      Visible = True
      ExplicitWidth = 566
    end
    object btnSave: TButton
      Left = 473
      Top = 124
      Width = 216
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 6
      OnClick = btnSaveClick
      ExplicitLeft = 462
    end
    object btnClose: TButton
      Left = 5
      Top = 125
      Width = 125
      Height = 25
      Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
      TabOrder = 4
      TabStop = False
      OnClick = btnCloseClick
    end
    object dbmhD_NOTICE: TDBMemoEh
      Left = 112
      Top = 69
      Width = 577
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
      ExplicitWidth = 566
    end
    object btnOpen: TButton
      Left = 5
      Top = 124
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
    Width = 694
    Height = 304
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 683
    ExplicitHeight = 241
    object dbgDocMat: TDBGridEh
      Left = 0
      Top = 140
      Width = 694
      Height = 164
      Align = alClient
      AllowedOperations = [alopUpdateEh, alopDeleteEh]
      DataSource = srcDocMat
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
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
          ReadOnly = True
          Title.Caption = #1052#1072#1090#1077#1088#1080#1072#1083
          Title.TitleButton = True
          Width = 193
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = ',#.##'
          DynProps = <>
          EditButtons = <>
          FieldName = 'M_QUANT'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1050#1086#1083'-'#1074#1086
          Title.TitleButton = True
          Width = 68
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'M_COST'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1062#1077#1085#1072
          Title.TitleButton = True
          Width = 86
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ITOGO'
          Footer.ValueType = fvtSum
          Footers = <>
          ReadOnly = True
          Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
          Title.TitleButton = True
          Width = 88
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'SHIPPER_COST'
          Footers = <>
          Title.Caption = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
          Width = 71
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'COST'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
          Width = 68
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MG_NAME'
          Footers = <>
          ReadOnly = True
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
          Width = 73
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'M_NOTICE'
          Footers = <>
          ReadOnly = True
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
      Width = 694
      Height = 140
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 683
      DesignSize = (
        694
        140)
      object lbl3: TLabel
        Left = 8
        Top = 9
        Width = 50
        Height = 13
        Caption = #1052#1072#1090#1077#1088#1080#1072#1083
      end
      object Label3: TLabel
        Left = 8
        Top = 59
        Width = 61
        Height = 13
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      end
      object lblDem: TLabel
        Left = 8
        Top = 36
        Width = 35
        Height = 13
        Caption = #1050#1086#1083'-'#1074#1086
      end
      object lbl4: TLabel
        Left = 195
        Top = 36
        Width = 26
        Height = 13
        Caption = #1062#1077#1085#1072
      end
      object lbl41: TLabel
        Left = 334
        Top = 36
        Width = 91
        Height = 13
        Caption = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
      end
      object edtMaterial: TDBEditEh
        Left = 100
        Top = 6
        Width = 589
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
        ExplicitWidth = 578
      end
      object edtQuant: TDBNumberEditEh
        Left = 100
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
        Left = 100
        Top = 60
        Width = 589
        Height = 45
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        ShowHint = True
        TabOrder = 4
        Visible = True
        WantReturns = True
        ExplicitWidth = 578
      end
      object btnAdd: TButton
        Left = 100
        Top = 110
        Width = 589
        Height = 25
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 5
        OnClick = btnAddClick
        ExplicitWidth = 578
      end
      object edtCost: TDBNumberEditEh
        Left = 240
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
        TabOrder = 6
        TabStop = False
        OnClick = btnDelClick
      end
      object ednShipCost: TDBNumberEditEh
        Left = 431
        Top = 33
        Width = 85
        Height = 21
        DynProps = <>
        EmptyDataInfo.Text = #1062#1077#1085#1072' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072
        Enabled = False
        EditButtons = <>
        ShowHint = True
        TabOrder = 3
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
      
        '    Doc_Id, Doc_N, Doc_Date, Dt_Id, Notice, Wh_Id, coalesce(Doc_' +
        'Closed, 0) Doc_Closed'
      '  from MATERIAL_DOCS d'
      '  where d.Dt_Id = :DocumentType and d.DOC_ID = :OLD_DOC_ID'
      ''
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
    Transaction = trRead
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
      '    M_NOTICE = :M_NOTICE,'
      '    SHIPPER_COST = :SHIPPER_COST'
      'WHERE'
      '        ID = :OLD_ID'
      '    and M_ID = :OLD_M_ID'
      '    and DOC_ID = :OLD_DOC_ID')
    DeleteSQL.Strings = (
      'execute block ('
      '    OLD_ID     integer = :OLD_ID,'
      '    OLD_M_ID   integer = :OLD_M_ID,'
      '    OLD_DOC_ID integer = :OLD_DOC_ID,'
      '    OLD_Serial   D_SERIAL = :OLD_Serial)'
      'as'
      'declare variable Wh_Id D_UID_NULL;'
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
      '          d.Wh_Id'
      '        from Material_Docs d'
      '        where d.Doc_Id = :OLD_Doc_Id'
      '      into :Wh_Id;'
      ''
      '      update Material_Unit u'
      '      set State = 0'
      '      where M_Id = :OLD_M_id'
      '            and u.Serial = :OLD_SERIAL'
      '            and u.Owner = :Wh_Id'
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
      '    SHIPPER_COST D_N15_2 = :SHIPPER_COST,'
      '    M_Quant  D_N15_5 = :M_Quant,'
      '    M_Notice D_NOTICE = :M_Notice,'
      '    Doc_Id   UID = :Doc_Id,'
      '    Serial   D_SERIAL = :Serial)'
      'as'
      'declare variable WH_ID   D_UID_NULL;'
      'begin'
      '  Serial = coalesce(Serial, '#39#39');'
      '  ID = coalesce(ID, gen_id(GEN_UID, 1));'
      ''
      
        '  insert into MATERIALS_IN_DOC (ID, M_ID, M_COST, M_QUANT, M_NOT' +
        'ICE, DOC_ID, SHIPPER_COST)'
      
        '  values (:ID, :M_ID, :M_COST, :M_QUANT, :M_NOTICE, :DOC_ID, :SH' +
        'IPPER_COST);'
      ''
      '  if (Serial <> '#39#39') then begin'
      '    select'
      '        d.Wh_Id'
      '      from Material_Docs d'
      '      where d.Doc_Id = :Doc_Id'
      '    into :Wh_Id;'
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
      '            and u.Owner = :Wh_Id'
      '            and u.Owner_Type = 0'
      '            and u.State = 0;'
      ''
      '    update Material_Unit u'
      '    set State = -1*:Doc_Id'
      '    where M_Id = :M_id'
      '          and u.Serial = :SERIAL'
      '          and u.Owner = :Wh_Id'
      '          and u.Owner_Type = 0'
      '          and u.State = 0;'
      '  end'
      'end')
    RefreshSQL.Strings = (
      '  select'
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
      '        and md.M_ID = :OLD_M_ID'
      '        and md.DOC_ID = :OLD_DOC_ID')
    SelectSQL.Strings = (
      '  select'
      '    md.Id'
      '  , md.M_Id'
      
        '  , m.Name || coalesce('#39'/'#39' || u.Serial || coalesce('#39'/'#39' || u.MAC,' +
        ' '#39#39'), '#39#39') NAME'
      '  , m.M_NUMBER'
      '  , md.M_Quant'
      '  , md.M_Cost'
      '  , md.M_Notice'
      '  , md.SHIPPER_COST '
      '  , md.M_Quant * md.SHIPPER_COST as COST   '
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
    Transaction = trRead
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
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 256
    Top = 289
  end
  object dsMaterials: TpFIBDataSet
    SelectSQL.Strings = (
      '  select'
      '    m.M_Id'
      
        '  , m.Name || coalesce('#39'/'#39' || u.Serial || coalesce('#39'/'#39' || u.MAC,' +
        ' '#39#39'), '#39#39')  NAME'
      '  , m.Dimension'
      '  , iif(m.Is_Unit = 1, 1, r.Mr_Quant) Mr_Quant'
      '  , r.Mr_Cost'
      '  , iif(m.Is_Unit is distinct from 1, r.Mr_Cost,'
      '       (select first 1'
      '        coalesce(imd.Shipper_Cost, r.Mr_Cost)'
      '      from Materials_In_Doc_Unit imu'
      '           inner join Materials_In_Doc imd on (imd.Id = imu.Id)'
      
        '           inner join Material_Docs id on (id.Doc_Id = imd.Doc_I' +
        'd)'
      '      where imu.Serial = u.Serial'
      '            and imu.M_Id = m.M_Id'
      '            and id.Doc_Closed = 1'
      '            and id.Dt_Id = 1'
      '      order by id.Doc_Date)'
      '  ) Ship_Cost'
      '  , g.Mg_Name'
      '  , m.DESCRIPTION'
      '  , u.Serial'
      '  from materials m'
      '       inner join Materials_Remain r on (m.M_Id = r.M_Id)'
      '       left outer join Materials_Group g on (m.Mg_Id = g.Mg_Id)'
      '       left outer join Material_Unit u on (u.M_Id = m.M_Id and'
      '             u.Owner = :WH and'
      '             u.Owner_Type = 0 and'
      '             u.State = 0)'
      '  where r.Wh_Id = :WH'
      '        and coalesce(m.deleted, 0) = 0'
      
        '        and ((coalesce(m.Is_Unit, 0) = 0) or (not u.Serial is nu' +
        'll))'
      '  order by m.Name, g.Mg_Name')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 360
    Top = 288
    oFetchAll = True
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
    Left = 272
    Top = 345
  end
  object dsWH: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID, O_NAME, O_DESCRIPTION'
      '  from OBJECTS o'
      '  where O_TYPE = 10'
      '        and ( exists(select'
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
    Left = 151
    Top = 217
  end
  object srcWH: TDataSource
    AutoEdit = False
    DataSet = dsWH
    Left = 224
    Top = 217
  end
  object qCloseDoc: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select Result from Close_Material_Doc(:Doc_Id) ')
    Left = 520
    Top = 300
  end
  object qOpenDoc: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select Result from Open_Material_Doc(:Doc_Id) ')
    Left = 592
    Top = 300
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
    Left = 112
    Top = 340
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
end
