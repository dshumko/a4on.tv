inherited FileTypeForm: TFileTypeForm
  Left = 381
  Top = 171
  Caption = #1058#1080#1087#1099' '#1072#1073#1086#1085#1077#1085#1090#1089#1082#1080#1093' '#1092#1072#1081#1083#1086#1074
  ClientHeight = 481
  ClientWidth = 744
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 315
    Width = 744
  end
  inherited dbGrid: TDBGridEh
    Top = 319
    Width = 744
    Height = 162
    AllowedOperations = [alopUpdateEh]
    OnGetCellParams = dbGridGetCellParams
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
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'O_CHARFIELD'
        Footers = <>
        Title.Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1074' JSON'
        Width = 71
      end>
  end
  inherited tlbMain: TToolBar
    Width = 744
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
    Width = 744
    Height = 290
    ParentCtl3D = False
    DesignSize = (
      744
      290)
    object lbl3: TLabel [0]
      Left = 365
      Top = 197
      Width = 61
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1074#1086#1076' '#1076#1072#1090#1099
    end
    inherited btnSaveLink: TBitBtn
      Left = 232
      Top = 263
      Width = 399
      TabOrder = 16
    end
    inherited btnCancelLink: TBitBtn
      Left = 639
      Top = 263
      Width = 98
      Cancel = True
      TabOrder = 17
    end
    object gb1: TGroupBox
      Left = 0
      Top = 29
      Width = 744
      Height = 96
      Align = alTop
      Caption = #1044#1077#1081#1089#1090#1074#1080#1103' '#1087#1086#1089#1083#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1092#1072#1081#1083#1072
      TabOrder = 1
      DesignSize = (
        744
        96)
      object lbl1: TLabel
        Left = 5
        Top = 72
        Width = 134
        Height = 13
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1079#1086#1074#1091#1102' '#1091#1089#1083#1091#1075#1091
      end
      object Заявка: TLabel
        Left = 5
        Top = 46
        Width = 36
        Height = 13
        Caption = #1047#1072#1103#1074#1082#1072
      end
      object lbl4: TLabel
        Left = 5
        Top = 19
        Width = 35
        Height = 13
        Caption = #1059#1089#1083#1091#1075#1072
      end
      object lcbRequest: TDBLookupComboboxEh
        Left = 47
        Top = 43
        Width = 259
        Height = 21
        Hint = #1058#1080#1087' '#1079#1072#1103#1074#1082#1080
        DynProps = <>
        DataField = ''
        EmptyDataInfo.Text = #1058#1080#1087' '#1079#1072#1103#1074#1082#1080
        EditButtons = <>
        KeyField = 'RT_ID'
        ListField = 'RT_NAME'
        ListSource = srcReqType
        ShowHint = True
        TabOrder = 3
        Visible = True
      end
      object lcbTempl: TDBLookupComboboxEh
        Left = 312
        Top = 42
        Width = 266
        Height = 21
        Hint = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1079#1086#1074#1072
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        DropDownBox.ListFieldNames = 'NAME'
        DropDownBox.ListSource = srcReqTempl
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterType = lsftContainsEh
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1055#1088#1080#1095#1080#1085#1072' '#1074#1099#1079#1086#1074#1072
        EditButtons = <>
        KeyField = 'RQTL_ID'
        ListField = 'NAME'
        ListSource = srcReqTempl
        ShowHint = True
        TabOrder = 4
        Visible = True
      end
      object chkOpenInet: TDBCheckBoxEh
        Left = 584
        Top = 45
        Width = 153
        Height = 17
        Hint = #1054#1090#1082#1088#1099#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1080#1085#1090#1077#1088#1085#1077#1090' '#1087#1086#1089#1083#1077' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103' '#1092#1072#1081#1083#1072
        Anchors = [akTop, akRight]
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1086#1082#1085#1086' '#1048#1085#1090#1077#1088#1085#1077#1090
        DynProps = <>
        TabOrder = 5
      end
      object lcbOnOffSrv: TDBLookupComboboxEh
        Left = 584
        Top = 16
        Width = 153
        Height = 21
        Hint = #1063#1077#1084' '#1074#1082#1083'/'#1086#1090#1082#1083#1102#1095#1072#1077#1084' '#1091#1089#1083#1091#1075#1091
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        DropDownBox.ListFieldNames = 'NAME'
        DropDownBox.ListSource = srcOnOffSrv
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterType = lsftContainsEh
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1063#1077#1084' '#1074#1082#1083'/'#1086#1090#1082#1083#1102#1095#1072#1077#1084' '#1091#1089#1083#1091#1075#1091
        EditButtons = <>
        KeyField = 'SERVICE_ID'
        ListField = 'NAME'
        ListSource = srcOnOffSrv
        ShowHint = True
        Style = csDropDownEh
        TabOrder = 2
        Visible = True
      end
      object lcbSrvType: TDBLookupComboboxEh
        Left = 175
        Top = 16
        Width = 131
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
        TabOrder = 1
        Visible = True
      end
      object cbOnOff: TDBComboBoxEh
        Left = 47
        Top = 16
        Width = 122
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
        TabOrder = 0
        Visible = True
      end
      object lcbSingleSrv: TDBLookupComboboxEh
        Left = 155
        Top = 69
        Width = 582
        Height = 21
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1079#1086#1074#1091#1102' '#1091#1089#1083#1091#1075#1091
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        DropDownBox.Columns = <
          item
            FieldName = 'NAME'
            Width = 60
          end
          item
            FieldName = 'DESCRIPTION'
            Width = 40
          end>
        DropDownBox.ListFieldNames = 'NAME'
        DropDownBox.ListSource = srcSingleSrv
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterType = lsftContainsEh
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1044#1086#1073#1072#1074#1080#1090#1100' '#1088#1072#1079#1086#1074#1091#1102' '#1091#1089#1083#1091#1075#1091
        EditButtons = <>
        KeyField = 'SERVICE_ID'
        ListField = 'NAME'
        ListSource = srcSingleSrv
        ShowHint = True
        TabOrder = 6
        Visible = True
      end
      object lcbService: TDBLookupComboboxEh
        Left = 312
        Top = 16
        Width = 266
        Height = 21
        Hint = #1059#1089#1083#1091#1075#1072
        DynProps = <>
        DataField = ''
        DropDownBox.ListFieldNames = 'NAME'
        DropDownBox.ListSource = srcService
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterType = lsftContainsEh
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1050#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100
        EditButtons = <>
        KeyField = 'Service_Id'
        ListField = 'NAME'
        ListSource = srcService
        ShowHint = True
        Style = csDropDownEh
        TabOrder = 7
        Visible = True
      end
    end
    object pnlTop: TPanel
      Left = 0
      Top = 0
      Width = 744
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        744
        29)
      object lbl2: TLabel
        Left = 5
        Top = 8
        Width = 18
        Height = 13
        Caption = #1058#1080#1087
      end
      object edtName: TDBEditEh
        Left = 28
        Top = 5
        Width = 709
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
    end
    object edtNameFmt: TDBEditEh
      Left = 5
      Top = 236
      Width = 354
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1064#1072#1073#1083#1086#1085' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103' '#1092#1072#1081#1083#1072'. '#1055#1072#1088#1072#1084#1077#1090#1088#1099' '#1082#1072#1082' '#1074' '#1086#1087#1080#1089#1072#1085#1080#1080' '#1090#1080#1087#1072
      ShowHint = True
      TabOrder = 15
      Visible = True
    end
    object mmoNOTICE: TDBMemoEh
      Left = 5
      Top = 128
      Width = 354
      Height = 102
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
      TabOrder = 2
      Visible = True
      WantReturns = True
    end
    object chkMemoRO: TDBCheckBoxEh
      Left = 365
      Top = 213
      Width = 204
      Height = 17
      Hint = #1047#1072#1087#1088#1077#1090' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1077
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1087#1088#1077#1090' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1103
      DynProps = <>
      TabOrder = 13
    end
    object chkText: TDBCheckBoxEh
      Left = 365
      Top = 179
      Width = 204
      Height = 17
      Hint = '['#1058#1045#1050#1057#1058'] ['#1058#1045#1050#1057#1058'1]'
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1086#1076' '#1089#1090#1088#1086#1082#1080' '#1076#1086#1087'. '#1090#1077#1082#1089#1090#1072
      DynProps = <>
      TabOrder = 9
      OnClick = chkPassportClick
    end
    object chkMobilePhone: TDBCheckBoxEh
      Left = 365
      Top = 162
      Width = 204
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1086#1076' '#1084#1086#1073#1080#1083#1100#1085#1086#1075#1086
      DynProps = <>
      TabOrder = 7
    end
    object chkCustomerCard: TDBCheckBoxEh
      Left = 365
      Top = 145
      Width = 204
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1086#1076' '#1076#1072#1085#1085#1099#1093' '#1087#1072#1089#1087#1086#1088#1090#1072
      DynProps = <>
      TabOrder = 5
      OnClick = chkCustomerCardClick
    end
    object chkPassport: TDBCheckBoxEh
      Left = 365
      Top = 129
      Width = 204
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1086#1076' '#8470' '#1087#1072#1089#1087#1086#1088#1090#1072
      DynProps = <>
      TabOrder = 3
      OnClick = chkPassportClick
    end
    object chkAddress: TDBCheckBoxEh
      Left = 575
      Top = 162
      Width = 160
      Height = 17
      Hint = #1042#1099#1073#1086#1088' '#1072#1076#1088#1077#1089#1072
      Anchors = [akTop, akRight]
      Caption = #1042#1099#1073#1086#1088' '#1072#1076#1088#1077#1089#1072
      DynProps = <>
      TabOrder = 8
      OnClick = chkCustomerCardClick
    end
    object chkPaySum: TDBCheckBoxEh
      Left = 575
      Top = 145
      Width = 160
      Height = 17
      Hint = #1042#1074#1086#1076' '#1089#1091#1084#1084' '#1087#1086' '#1079#1072#1103#1074#1082#1077' '#1080#1083#1080' '#1091#1089#1083#1091#1075#1077
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1086#1076' '#1089#1091#1084#1084
      DynProps = <>
      TabOrder = 6
      OnClick = chkCustomerCardClick
    end
    object chkBid: TDBCheckBoxEh
      Left = 575
      Top = 129
      Width = 160
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1042#1074#1086#1076' '#8470' '#1079#1072#1074#1082#1080
      DynProps = <>
      TabOrder = 4
      OnClick = chkPassportClick
    end
    object edtHint: TDBEditEh
      Left = 365
      Top = 236
      Width = 204
      Height = 21
      Hint = 
        '['#1058#1045#1050#1057#1058'] '#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1077#1082#1089#1090'. '#1063#1077#1088#1077#1079' | '#1091#1082#1072#1079#1099#1074#1077#1090#1089#1103' '#1055#1086#1076#1089#1082#1072#1079#1082#1072' '#1074' '#1089#1090#1088 +
        #1086#1082#1077
      Anchors = [akRight, akBottom]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1077#1082#1089#1090'. '#1063#1077#1088#1077#1079' | '#1091#1082#1072#1079#1099#1074#1077#1090#1089#1103' '#1055#1086#1076#1089#1082#1072#1079#1082#1072' '#1074' '#1089#1090#1088#1086#1082#1077
      ShowHint = True
      TabOrder = 18
      Visible = True
    end
    object chkTask: TDBCheckBoxEh
      Left = 575
      Top = 179
      Width = 160
      Height = 17
      Hint = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077' '#1085#1072' '#1076#1072#1090#1091
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1087#1086#1084#1080#1085#1072#1085#1080#1077
      DynProps = <>
      TabOrder = 10
      OnClick = chkCustomerCardClick
    end
    object btnColorSet: TButtonColor
      Left = 5
      Top = 262
      Width = 92
      Anchors = [akLeft, akBottom]
      Caption = #1060#1086#1085' '#1090#1080#1087#1072
      TabOrder = 20
      OnClick = btnColorSetClick
    end
    object btnColorClear: TButton
      Left = 103
      Top = 262
      Width = 82
      Height = 25
      Hint = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1086#1085' '#1076#1083#1103' '#1074#1099#1076#1077#1083#1077#1085#1080#1103' '#1072#1073#1086#1085#1077#1085#1090#1072
      Anchors = [akLeft, akBottom]
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1092#1086#1085
      TabOrder = 21
      TabStop = False
      OnClick = btnColorClearClick
    end
    object chkNameRO: TDBCheckBoxEh
      Left = 575
      Top = 213
      Width = 169
      Height = 17
      Hint = #1047#1072#1087#1088#1077#1090' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1087#1088#1077#1090' '#1088#1077#1076'-'#1090#1100' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103
      DynProps = <>
      TabOrder = 14
      OnClick = chkCustomerCardClick
    end
    object chkOwner: TDBCheckBoxEh
      Left = 575
      Top = 196
      Width = 160
      Height = 17
      Hint = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1075#1072#1083#1086#1095#1082#1091' '#1089#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
      Anchors = [akTop, akRight]
      Caption = #1057#1086#1073#1089#1090#1074#1077#1085#1085#1080#1082
      Checked = True
      DynProps = <>
      State = cbChecked
      TabOrder = 12
      OnClick = chkCustomerCardClick
    end
    object cbPeriod: TDBComboBoxEh
      Left = 431
      Top = 194
      Width = 120
      Height = 21
      Hint = '['#1044#1040#1058#1040'_'#1053'] ['#1044#1040#1058#1040'_'#1054']'
      Anchors = [akTop, akRight]
      DynProps = <>
      EditButtons = <>
      Items.Strings = (
        #1053#1077' '#1086#1090#1086#1073#1088#1072#1078#1072#1090#1100
        #1055#1077#1088#1080#1086#1076' '#1076#1072#1090
        #1044#1072#1090#1072)
      KeyItems.Strings = (
        '0'
        '1'
        '2')
      ShowHint = True
      TabOrder = 11
      Visible = True
    end
    object edtText1: TDBEditEh
      Left = 575
      Top = 236
      Width = 162
      Height = 21
      Hint = 
        '['#1058#1045#1050#1057#1058'1] '#1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1077#1082#1089#1090'. '#1063#1077#1088#1077#1079' | '#1091#1082#1072#1079#1099#1074#1077#1090#1089#1103' '#1055#1086#1076#1089#1082#1072#1079#1082#1072' '#1074' '#1089#1090 +
        #1088#1086#1082#1077
      Anchors = [akRight, akBottom]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1081' '#1090#1077#1082#1089#1090'. '#1063#1077#1088#1077#1079' | '#1091#1082#1072#1079#1099#1074#1077#1090#1089#1103' '#1055#1086#1076#1089#1082#1072#1079#1082#1072' '#1074' '#1089#1090#1088#1086#1082#1077
      ShowHint = True
      TabOrder = 19
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
    Left = 150
    Top = 384
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
    Left = 192
    Top = 400
  end
  object dsFileType: TpFIBDataSet [8]
    UpdateSQL.Strings = (
      
        'execute procedure Objects_Iud(1, 33, :O_ID, :O_Name, :O_Descript' +
        'ion, :O_DIMENSION, 0, :O_CHARFIELD)')
    DeleteSQL.Strings = (
      'execute procedure Objects_Iud(2, 33, :OLD_O_ID)')
    InsertSQL.Strings = (
      
        'execute procedure Objects_Iud(0, 33, :O_ID, :O_Name, :O_Descript' +
        'ion, :O_DIMENSION, 0, :O_CHARFIELD)')
    RefreshSQL.Strings = (
      'select'
      '    o.O_ID, o.O_NAME, o.O_DESCRIPTION, O_CHARFIELD, O_DIMENSION'
      '  from OBJECTS o'
      '  where  O_TYPE = 33'
      '     and O_DELETED = 0'
      '     and O.O_ID = :OLD_O_ID'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    o.O_ID, o.O_NAME, o.O_DESCRIPTION, O_CHARFIELD, O_DIMENSION'
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
    Left = 72
    Top = 376
  end
  object pmMemo: TPopupMenu [9]
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 189
    Top = 336
  end
  object dsSrvType: TpFIBDataSet [10]
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
    Left = 304
    Top = 408
  end
  object srcSrvType: TDataSource [11]
    AutoEdit = False
    DataSet = dsSrvType
    OnDataChange = srcDataSourceDataChange
    Left = 248
    Top = 392
  end
  object dsReqType: TpFIBDataSet [12]
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
    Left = 376
    Top = 352
  end
  object srcReqType: TDataSource [13]
    AutoEdit = False
    DataSet = dsReqType
    OnDataChange = srcDataSourceDataChange
    Left = 392
    Top = 376
  end
  object dsOnOffSrv: TpFIBDataSet [14]
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
  object srcOnOffSrv: TDataSource [15]
    AutoEdit = False
    DataSet = dsOnOffSrv
    OnDataChange = srcDataSourceDataChange
    Left = 464
    Top = 296
  end
  object dsReqTempl: TpFIBDataSet [16]
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
  object srcReqTempl: TDataSource [17]
    AutoEdit = False
    DataSet = dsReqTempl
    Left = 320
    Top = 352
  end
  object srcSingleSrv: TDataSource [18]
    AutoEdit = False
    DataSet = dsSingleSrv
    OnDataChange = srcDataSourceDataChange
    Left = 568
    Top = 352
  end
  object dsSingleSrv: TpFIBDataSet [19]
    SelectSQL.Strings = (
      'select'
      '    s.Service_Id'
      '  , s.Name'
      '  , s.Description'
      '  from services s'
      '  where s.Srv_Type_Id in (1,2)'
      'order by s.Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcSrvType
    Left = 568
    Top = 336
  end
  object dsService: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    S.Service_Id'
      '    , s.Name || coalesce('#39' / '#39' ||'
      '    case s.Srv_Type_Id'
      '      when 2 then null'
      '      else (select'
      
        '                iif((coalesce(t.Tarif_Sum, 0) = coalesce(t.TARIF' +
        '_SUM_JUR, 0)), coalesce(t.Tarif_Sum, 0), coalesce(t.Tarif_Sum, 0' +
        ') || '#39'/'#39' || coalesce(t.TARIF_SUM_JUR, 0))'
      '              from tarif t'
      '              where t.Service_Id = s.Service_Id'
      
        '                    and current_date between t.Date_From and t.D' +
        'ate_To)'
      ''
      '    end, '#39#39') Name'
      '          from SERVICES S'
      '          where s.Business_Type = :O_Id'
      'order by s.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcSrvType
    Left = 520
    Top = 432
  end
  object srcService: TDataSource
    AutoEdit = False
    DataSet = dsService
    OnDataChange = srcDataSourceDataChange
    Left = 456
    Top = 432
  end
end
