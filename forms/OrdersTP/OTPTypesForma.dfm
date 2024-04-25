inherited OTPTypesForm: TOTPTypesForm
  Left = 381
  Top = 171
  Caption = #1058#1080#1087#1099' '#1089#1090#1086#1088#1086#1085#1085#1080#1093' '#1079#1072#1082#1072#1079#1086#1074
  ClientHeight = 463
  ClientWidth = 698
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 353
    Width = 698
  end
  inherited dbGrid: TDBGridEh
    Top = 357
    Width = 698
    Height = 106
    AllowedOperations = []
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
        FieldName = 'O_TYPE'
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
        Width = 147
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DIMENSION'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Title.TitleButton = True
        Visible = False
        Width = 41
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DESCRIPTION'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 364
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_DELETED'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_CHARFIELD'
        Footers = <>
        Title.Caption = #1044#1086#1087'. '#1085#1072#1089#1090#1088#1086#1081#1082#1080
        Title.TitleButton = True
        Width = 200
      end>
  end
  inherited tlbMain: TToolBar
    Width = 698
  end
  inherited pnlEdit: TPanel
    Width = 698
    Height = 328
    inherited btnSaveLink: TBitBtn
      Top = 298
      Width = 512
      TabOrder = 1
    end
    inherited btnCancelLink: TBitBtn
      Left = 603
      Top = 298
      Width = 90
      TabOrder = 2
    end
    object pnlMain: TPanel
      Left = 0
      Top = 0
      Width = 698
      Height = 294
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 0
      object spl1: TSplitter
        Left = 375
        Top = 0
        Height = 294
        Align = alRight
      end
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 375
        Height = 294
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          375
          294)
        object lbl2: TLabel
          Left = 5
          Top = 9
          Width = 18
          Height = 13
          Caption = #1058#1080#1087
        end
        object mmoO_DESCRIPTION: TDBMemoEh
          Left = 5
          Top = 60
          Width = 370
          Height = 234
          ScrollBars = ssVertical
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = False
          DataField = 'O_DESCRIPTION'
          DataSource = srcDataSource
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077' '#1090#1080#1087#1072
          ShowHint = True
          TabOrder = 2
          Visible = True
          WantReturns = True
        end
        object edtName: TDBEditEh
          Left = 32
          Top = 6
          Width = 343
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
        object cbReport: TDBComboBoxEh
          Left = 5
          Top = 33
          Width = 370
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          EmptyDataInfo.Text = #1060#1086#1088#1084#1072' '#1087#1077#1095#1072#1090#1080' '#1076#1083#1103' '#1076#1072#1085#1085#1086#1075#1086' '#1090#1080#1087#1072' '#1079#1072#1082#1072#1079#1086#1074' '
          EditButtons = <>
          ShowHint = True
          TabOrder = 1
          Visible = True
        end
      end
      object pnl2: TPanel
        Left = 378
        Top = 0
        Width = 320
        Height = 294
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          320
          294)
        object lbl1: TLabel
          Left = 16
          Top = 9
          Width = 193
          Height = 13
          Caption = #1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1088#1072#1089#1095#1077#1090#1072' '#1089#1090#1086#1080#1084#1086#1089#1090#1080' '#1079#1072#1082#1072#1079#1072
        end
        object lbl5: TLabel
          Left = 6
          Top = 108
          Width = 42
          Height = 13
          Caption = #1062#1077#1085#1072' '#1076#1086
        end
        object lbl6: TLabel
          Left = 102
          Top = 108
          Width = 47
          Height = 13
          Caption = #1089#1080#1084#1074#1086#1083#1086#1074
        end
        object lbl7: TLabel
          Left = 6
          Top = 135
          Width = 174
          Height = 13
          Caption = #1062#1077#1085#1072' '#1073#1086#1083#1077#1077' '#1061' '#1089#1080#1084#1074#1086#1083#1086#1074', '#1079#1072' '#1089#1080#1084#1074#1086#1083
        end
        object Label1: TLabel
          Left = 6
          Top = 160
          Width = 160
          Height = 13
          Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086#1077' '#1082#1086#1083'-'#1074#1086' '#1089#1080#1084#1074#1086#1083#1086#1074
        end
        object lcbSinglSrv: TDBLookupComboboxEh
          Left = 6
          Top = 33
          Width = 309
          Height = 21
          Hint = #1050#1072#1082#1086#1081' '#1091#1089#1083#1091#1075#1086#1081' '#1076#1086#1073#1072#1074#1083#1103#1077#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1072#1073#1086#1085#1077#1085#1090#1091
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          DataField = ''
          DropDownBox.Columns = <
            item
              FieldName = 'NAME'
              Width = 20
            end
            item
              FieldName = 'DESCRIPTION'
              Width = 60
            end>
          DropDownBox.ListSource = srcSnglSrv
          EmptyDataInfo.Text = #1050#1072#1082#1086#1081' '#1091#1089#1083#1091#1075#1086#1081' '#1076#1086#1073#1072#1074#1083#1103#1077#1084' '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1103' '#1072#1073#1086#1085#1077#1085#1090#1091
          EditButtons = <>
          KeyField = 'SERVICE_ID'
          ListField = 'NAME'
          ListSource = srcSnglSrv
          ShowHint = True
          TabOrder = 0
          Visible = True
        end
        object chkPeriod: TDBCheckBoxEh
          Left = 6
          Top = 60
          Width = 309
          Height = 17
          Anchors = [akLeft, akTop, akRight]
          Caption = #1042#1099#1073#1086#1088' '#1087#1077#1088#1080#1086#1076#1072' / '#1082#1086#1083'-'#1074#1086' '#1076#1085#1077#1081
          DynProps = <>
          TabOrder = 1
        end
        object dbgAddons: TDBGridEh
          Left = 6
          Top = 185
          Width = 309
          Height = 107
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = srcAddons
          DynProps = <>
          Flat = True
          EmptyDataInfo.Text = #1057#1087#1080#1089#1086#1082' '#1076#1086#1087'. '#1085#1072#1095#1080#1089#1083#1077#1085#1080#1081
          PopupMenu = pmAddons
          TabOrder = 6
          Columns = <
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'name'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1044#1086#1087'. '#1091#1089#1083#1091#1075#1072
              Width = 141
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'cost'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #1062#1077#1085#1072
              Width = 60
            end
            item
              CellButtons = <>
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'dc'
              Footers = <>
              Title.Caption = '* '#1085#1072' '#1076#1085#1077#1081
              Title.Hint = #1059#1084#1085#1086#1078#1072#1090#1100' '#1085#1072' '#1082#1086#1083'-'#1074#1086' '#1076#1085#1077#1081
              Width = 59
            end
            item
              CellButtons = <>
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'rc'
              Footers = <>
              Title.Caption = #1050#1086#1101#1092#1092'.'
              Title.Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1076#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1072#1088#1072#1084#1077#1090#1088' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object ednCharCnt: TDBNumberEditEh
          Left = 54
          Top = 105
          Width = 41
          Height = 21
          DecimalPlaces = 0
          DynProps = <>
          EmptyDataInfo.Text = #1050'-'#1074#1086' '#1089#1080#1084#1074'.'
          EditButtons = <>
          ShowHint = True
          TabOrder = 3
          Visible = True
        end
        object chkCharCalc: TDBCheckBoxEh
          Left = 6
          Top = 81
          Width = 309
          Height = 17
          Hint = #1062#1077#1085#1072' '#1079#1072' '#1082#1086#1083'-'#1074#1086' '#1089#1080#1084#1074#1086#1083#1086#1074
          Anchors = [akLeft, akTop, akRight]
          Caption = #1062#1077#1085#1072' '#1079#1072' '#1082#1086#1083'-'#1074#1086' '#1089#1080#1084#1074#1086#1083#1086#1074' '#1074' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1080
          DynProps = <>
          TabOrder = 2
        end
        object ednBasicCost: TDBNumberEditEh
          Left = 193
          Top = 105
          Width = 80
          Height = 21
          DynProps = <>
          EmptyDataInfo.Text = #1044#1086
          EditButtons = <>
          ShowHint = True
          TabOrder = 4
          Visible = True
        end
        object ednMoreCost: TDBNumberEditEh
          Left = 193
          Top = 131
          Width = 80
          Height = 21
          DynProps = <>
          EmptyDataInfo.Text = #1041#1086#1083#1077#1077
          EditButtons = <>
          ShowHint = True
          TabOrder = 5
          Visible = True
        end
        object ednMax: TDBNumberEditEh
          Left = 193
          Top = 157
          Width = 80
          Height = 21
          Hint = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1086' '#1095#1080#1089#1083#1086' '#1089#1080#1084#1074#1086#1083#1086#1074' '#1074' '#1090#1077#1089#1090#1082#1077' '#1079#1072#1082#1072#1079#1072
          DecimalPlaces = 0
          DynProps = <>
          EmptyDataInfo.Text = 'Max '#1057#1080#1084'-'#1074
          EditButtons = <>
          ShowHint = True
          TabOrder = 7
          Visible = True
        end
      end
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsOTPTypes
    OnDataChange = srcDataSourceDataChange
    Left = 56
    Top = 176
  end
  inherited actions: TActionList
    Left = 54
    Top = 232
    inherited actNew: TAction
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 171
    Top = 231
  end
  inherited CnErrors: TCnErrorProvider
    Left = 240
    Top = 392
  end
  object dsOTPTypes: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_NAME = :O_NAME,'
      '    O_DESCRIPTION = :O_DESCRIPTION,'
      '    O_DELETED = :O_DELETED,'
      '    O_DIMENSION = :O_DIMENSION,'
      '    O_CHARFIELD = :O_CHARFIELD'
      'WHERE'
      '    O_ID = :OLD_O_ID  and O_TYPE = 22'
      '    ')
    DeleteSQL.Strings = (
      'update'
      '    OBJECTS'
      'set O_DELETED = 1'
      'WHERE'
      '        O_ID = :OLD_O_ID and O_TYPE = 22'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS('
      '    O_ID,'
      '    O_NAME,'
      '    O_DESCRIPTION,'
      '    O_DELETED,'
      '    O_DIMENSION,'
      '    O_TYPE,'
      '    O_CHARFIELD'
      ')'
      'VALUES('
      '    :O_ID,'
      '    :O_NAME,'
      '    :O_DESCRIPTION,'
      '    0,'
      '    :O_DIMENSION,'
      '    22,'
      '    :O_CHARFIELD'
      ')')
    RefreshSQL.Strings = (
      
        'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CH' +
        'ARFIELD'
      'FROM OBJECTS'
      'WHERE(  O_TYPE = 22 AND O_DELETED = 0'
      '     ) and (     OBJECTS.O_ID = :OLD_O_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      
        'SELECT O_ID, O_NAME, O_DESCRIPTION, O_DELETED, O_DIMENSION, O_CH' +
        'ARFIELD'
      'FROM OBJECTS'
      'WHERE O_TYPE = 22 AND O_DELETED = 0'
      'order BY O_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 57
    Top = 120
  end
  object srcSnglSrv: TDataSource
    AutoEdit = False
    DataSet = dsSnglSrv
    OnDataChange = srcDataSourceDataChange
    Left = 176
    Top = 176
  end
  object dsSnglSrv: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    s.Service_Id'
      '  , s.Name'
      '  , s.Description'
      '  from services s'
      '  where S.Srv_Type_Id > 0'
      '  order by s.Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 176
    Top = 120
  end
  object srcAddons: TDataSource
    DataSet = mtAddons
    Left = 464
    Top = 225
  end
  object mtAddons: TMemTableEh
    Params = <>
    Left = 387
    Top = 225
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object id: TMTNumericDataFieldEh
          FieldName = 'id'
          NumericDataType = fdtSmallintEh
          AutoIncrement = True
          DisplayWidth = 20
          Visible = False
          currency = False
          Precision = 15
        end
        object name: TMTStringDataFieldEh
          FieldName = 'name'
          StringDataType = fdtStringEh
          DisplayLabel = #1055#1072#1088#1072#1084#1077#1090#1088
          DisplayWidth = 50
          Size = 50
        end
        object cost: TMTNumericDataFieldEh
          FieldName = 'cost'
          NumericDataType = fdtFloatEh
          AutoIncrement = False
          DisplayLabel = #1062#1077#1085#1072
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object dc: TMTNumericDataFieldEh
          FieldName = 'dc'
          NumericDataType = fdtSmallintEh
          AutoIncrement = False
          DisplayWidth = 20
          currency = False
          Precision = 15
        end
        object rc: TMTNumericDataFieldEh
          FieldName = 'rc'
          NumericDataType = fdtSmallintEh
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
  object pmAddons: TPopupMenu
    Left = 336
    Top = 225
    object miDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      OnClick = miDelClick
    end
  end
end
