object CountersIndicationForm: TCountersIndicationForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103' '#1089#1095#1077#1090#1095#1080#1082#1086#1074
  ClientHeight = 441
  ClientWidth = 831
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgCnt: TDBGridEh
    Left = 0
    Top = 37
    Width = 831
    Height = 368
    Hint = #1042#1099' '#1084#1086#1078#1077#1090#1077' '#1080#1079#1084#1077#1085#1103#1090#1100' '#1087#1086#1083#1103' '#1058#1077#1082#1091#1097#1077#1077' '#1087#1086#1082#1072#1079#1072#1085#1080#1103' '#1080' '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = srcCnt
    DynProps = <>
    Flat = True
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghExtendVertLines]
    SearchPanel.Enabled = True
    SearchPanel.FilterOnTyping = True
    SortLocal = True
    SumList.Active = True
    TabOrder = 0
    TitleParams.MultiTitle = True
    Columns = <
      item
        CellButtons = <>
        Color = clBtnFace
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1058#1059#1069
        Title.TitleButton = True
        Title.SortIndex = 1
        Title.SortMarker = smUpEh
        Width = 206
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        Color = clBtnFace
        DynProps = <>
        EditButtons = <>
        FieldName = 'CNT'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1057#1095#1077#1090#1095#1080#1082
        Title.TitleButton = True
        Width = 88
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        Color = clBtnFace
        DisplayFormat = '0.####'
        DynProps = <>
        EditButtons = <>
        FieldName = 'PCE'
        Footer.DisplayFormat = '0.####'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Caption = #1052#1086#1097#1085#1086#1089#1090#1100' '#13#10#1042#1090'/'#1095
        Title.Hint = #1057#1091#1084#1084#1072#1088#1085#1072#1103' '#1084#1086#1097#1085#1086#1089#1090#1100' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103' '#1085#1072' '#1091#1079#1083#1072#1093' '#1087#1088#1080#1074#1103#1079#1072#1085#1085#1099#1093' '#1082' '#1089#1095#1077#1090#1095#1080#1082#1091
        Title.TitleButton = True
        Width = 60
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        Color = clBtnFace
        DynProps = <>
        EditButtons = <>
        FieldName = 'PV'
        Footer.DisplayFormat = '0.##'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103', '#1082#1042#1090'|'#1055#1088#1077#1076#1099#1076#1091#1097#1080#1077
        Title.TitleButton = True
        Width = 80
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CV'
        Footer.DisplayFormat = '0.##'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103', '#1082#1042#1090'|'#1058#1077#1082#1091#1097#1080#1077
        Title.TitleButton = True
        Width = 80
      end
      item
        CellButtons = <>
        Color = clBtnFace
        DisplayFormat = '0.##'
        DynProps = <>
        EditButtons = <>
        FieldName = 'DIF'
        Footer.DisplayFormat = '0.##'
        Footer.ValueType = fvtSum
        Footers = <>
        ReadOnly = True
        Title.Caption = #1055#1086#1082#1072#1079#1072#1085#1080#1103', '#1082#1042#1090'|'#1056#1072#1079#1085#1086#1089#1090#1100
        Width = 60
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CDATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1089#1074#1077#1088#1082#1080
        Width = 62
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 236
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 831
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      831
      37)
    object edDate: TDBDateTimeEditEh
      Left = 8
      Top = 8
      Width = 117
      Height = 21
      Hint = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1077' '#1083#1102#1073#1091#1102' '#1076#1072#1090#1091' '#1084#1077#1089#1103#1094#1072', '#1074' '#1082#1086#1090#1086#1088#1086#1084' '#1085#1091#1078#1085#1086' '#1080#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1082#1072#1079#1072#1085#1080#1103
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = edDateChange
      OnExit = edDateExit
      EditFormat = 'DD/MM/YYYY'
    end
    object btnGet: TButton
      Left = 131
      Top = 6
      Width = 124
      Height = 25
      Hint = #1055#1088#1086#1095#1080#1090#1072#1090#1100' '#1087#1086#1082#1072#1079#1072#1085#1080#1103' '#1074#1099#1073#1088#1072#1085#1085#1086#1075#1086' '#1084#1077#1089#1103#1094#1072' '#1089' '#1073#1072#1079#1099
      Caption = #1055#1088#1086#1095#1080#1090#1072#1090#1100' '#1087#1086#1082#1072#1079#1072#1085#1080#1103
      TabOrder = 1
      OnClick = btnGetClick
    end
    object btnSet: TButton
      Left = 296
      Top = 6
      Width = 530
      Height = 25
      Hint = 
        #1042#1085#1080#1084#1072#1085#1080#1077', '#1077#1089#1083#1080' '#1088#1072#1085#1077#1077' '#1073#1099#1083#1086' '#1074#1085#1077#1089#1077#1085#1086' '#1079#1085#1072#1095#1077#1085#1080#1077', '#1086#1085#1086' '#1073#1091#1076#1077#1090' '#1087#1077#1088#1077#1079#1072#1087#1080#1089#1072 +
        #1085#1086
      Anchors = [akLeft, akTop, akRight]
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1058#1077#1082#1091#1097#1077#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' = '#1087#1088#1077#1076' + '#1084#1086#1097
      TabOrder = 2
      OnClick = btnSetClick
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 405
    Width = 831
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      831
      36)
    object btnOk: TButton
      Left = 8
      Top = 6
      Width = 716
      Height = 25
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1087#1086#1082#1072#1079#1072#1085#1080#1103' '#1074' '#1073#1072#1079#1077
      Anchors = [akLeft, akTop, akRight]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancel: TButton
      Left = 739
      Top = 6
      Width = 87
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object srcCnt: TDataSource
    DataSet = mtCnt
    Left = 392
    Top = 152
  end
  object mtCnt: TMemTableEh
    Params = <>
    OnCalcFields = mtCntCalcFields
    Left = 288
    Top = 296
    object mtCntNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object mtCntNOTICE: TStringField
      FieldName = 'NOTICE'
      Size = 255
    end
    object mtCntPID: TIntegerField
      FieldName = 'PID'
    end
    object mtCntCNT: TStringField
      FieldName = 'CNT'
    end
    object mtCntPV: TFloatField
      FieldName = 'PV'
    end
    object mtCntPCE: TFloatField
      FieldName = 'PCE'
    end
    object mtCntSCV: TFloatField
      FieldName = 'SCV'
    end
    object mtCntCV: TFloatField
      FieldName = 'CV'
    end
    object mtCntDIF: TFloatField
      FieldKind = fkCalculated
      FieldName = 'DIF'
      Calculated = True
    end
    object mtCntCDATE: TDateField
      FieldName = 'CDATE'
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object CDATE: TMTDateTimeDataFieldEh
          FieldName = 'CDATE'
          DateTimeDataType = fdtDateEh
          DisplayWidth = 20
        end
        object NOTICE: TMTStringDataFieldEh
          FieldName = 'NOTICE'
          StringDataType = fdtStringEh
          DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          DisplayWidth = 100
          Size = 255
        end
        object NAME: TMTStringDataFieldEh
          FieldName = 'NAME'
          StringDataType = fdtStringEh
          DisplayWidth = 100
          Size = 255
        end
        object PID: TMTNumericDataFieldEh
          FieldName = 'PID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object CNT: TMTStringDataFieldEh
          FieldName = 'CNT'
          StringDataType = fdtStringEh
          DisplayWidth = 20
        end
        object PV: TMTNumericDataFieldEh
          FieldName = 'PV'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object PCE: TMTNumericDataFieldEh
          FieldName = 'PCE'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object SCV: TMTNumericDataFieldEh
          FieldName = 'SCV'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object CV: TMTNumericDataFieldEh
          FieldName = 'CV'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object dsElectroPoint: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Objects_Iud(1, 76, :O_ID, :O_Name, :O_Descript' +
        'ion, :ECOUNTER, 0, null, :O_Numericfield)')
    DeleteSQL.Strings = (
      
        'execute procedure Objects_Iud(2, 76, :O_ID, :O_Name, :O_Descript' +
        'ion, :ECOUNTER, 1, null, :O_Numericfield)')
    InsertSQL.Strings = (
      
        'execute procedure Objects_Iud(0, 76, :O_ID, :O_Name, :O_Descript' +
        'ion, :ECOUNTER, 0, null, :O_Numericfield)')
    RefreshSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , o.O_TYPE'
      '  , o.O_NAME'
      '  , o.O_DESCRIPTION'
      
        '  , cast(coalesce(o.O_NUMERICFIELD, 0) as integer) O_NUMERICFIEL' +
        'D'
      '  , er.O_Name ERecipient'
      '  , iif(o.O_Dimension <> '#39#39', o.O_Dimension, null) ECOUNTER'
      
        '  , (select count(*) from NODES n where n.Epoint = o.O_ID) NCOUN' +
        'T'
      '  from OBJECTS o'
      
        '       left outer join OBJECTS er on (er.O_Id = o.O_Numericfield' +
        ' and er.O_Type = 77)'
      '  where o.O_TYPE = 76'
      '        and o.o_DELETED = 0'
      '        and o.O_ID = :OLD_O_ID')
    SelectSQL.Strings = (
      'select'
      '    o.O_ID'
      '  , o.O_NAME'
      '  , o.O_Dimension ECOUNTER'
      '  ,'
      '    (select'
      '         sum(n.Pce)'
      '       from NODES n'
      '       where n.Epoint = o.O_ID) PCE'
      '  ,'
      '    (select'
      '         sum(coalesce(e.Pce, eg.O_Numericfield, 0))'
      '       from NODES n'
      '            inner join Equipment e on (e.Node_Id = n.Node_Id)'
      
        '            left outer join objects eg on (e.Eq_Group = eg.O_Id ' +
        'and eg.O_Type = 7)'
      '       where n.Epoint = o.O_ID) PCE_FACT'
      '  , coalesce((select first 1'
      '                  oh.Nvalue'
      '                from Objects_History oh'
      '                where oh.O_Id = o.O_ID'
      '                      and oh.O_Type = o.O_TYPE'
      '                      and oh.Deleted = 0'
      '                      and oh.Hdate >= dateadd(month, -1, :DT)'
      '                      and oh.Hdate < :DT'
      '                order by oh.Hdate), 0) PV'
      '  ,'
      '    (select first 1'
      '         oh.Nvalue'
      '       from Objects_History oh'
      '       where oh.O_Id = o.O_ID'
      '             and oh.O_Type = o.O_TYPE'
      '             and oh.Deleted = 0'
      '             and oh.Hdate >= :DT'
      '             and oh.Hdate < dateadd(month, 1, :DT)'
      '       order by oh.Hdate) CV'
      '  ,'
      '    (select first 1'
      '         oh.NOTICE'
      '       from Objects_History oh'
      '       where oh.O_Id = o.O_ID'
      '             and oh.O_Type = o.O_TYPE'
      '             and oh.Deleted = 0'
      '             and oh.Hdate >= :DT'
      '             and oh.Hdate < dateadd(month, 1, :DT)'
      '       order by oh.Hdate) NOTICE'
      '  ,'
      '    (select first 1'
      '         oh.DVALUE '
      '       from Objects_History oh'
      '       where oh.O_Id = o.O_ID'
      '             and oh.O_Type = o.O_TYPE'
      '             and oh.Deleted = 0'
      '             and oh.Hdate >= :DT'
      '             and oh.Hdate < dateadd(month, 1, :DT)'
      '       order by oh.Hdate) CDATE'
      '  from OBJECTS o'
      '  where o.O_TYPE = 76'
      '        and o.o_DELETED = 0'
      '        and trim(coalesce(o.O_Dimension, '#39#39')) <> '#39#39
      '  order by o.O_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 80
    Top = 288
  end
  object qrySet: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'execute block ('
      '    O_Id   D_INTEGER = :O_Id,'
      '    Hdate  D_DATE = :Hdate,'
      '    Nvalue D_N15_3 = :Nvalue,'
      '    NOTICE D_Notice = :NOTICE,'
      '    CDATE  D_DATE = :CDATE)'
      'as'
      'begin'
      '  Hdate = Month_First_Day(Hdate);'
      ''
      
        '  update or insert into Objects_History (O_Id, O_Type, Hdate, Nv' +
        'alue, NOTICE, DVALUE)'
      '  values (:O_Id, 76, :Hdate, :Nvalue, :NOTICE, :CDATE)'
      '  matching (O_Id, O_Type, Hdate);'
      ''
      '  if (not CDATE is null) then'
      '    update OBJECTS o'
      '    set o.O_Datefield = :CDATE'
      '    where O_ID = :O_Id'
      '          and O_TYPE = 76;'
      'end')
    Left = 192
    Top = 296
    qoAutoCommit = True
    qoStartTransaction = True
  end
  object PropStorageEh: TPropStorageEh
    Section = 'CntInd'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.Top'
      '<P>.Width')
    Left = 106
    Top = 176
  end
end
