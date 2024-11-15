object MatDocFilterForm: TMatDocFilterForm
  Left = 394
  Top = 207
  BorderStyle = bsSizeToolWin
  Caption = #1060#1080#1083#1100#1090#1088
  ClientHeight = 437
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 401
    Width = 575
    Height = 36
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      575
      36)
    object SpeedButton1: TSpeedButton
      Left = 6
      Top = 2
      Width = 80
      Height = 30
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Flat = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 89
      Top = 2
      Width = 80
      Height = 30
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Flat = True
      OnClick = SpeedButton2Click
    end
    object btnClear: TSpeedButton
      Left = 172
      Top = 2
      Width = 80
      Height = 30
      Action = actClear
      Flat = True
    end
    object chkDefaultFilter: TCheckBox
      Left = 257
      Top = 10
      Width = 133
      Height = 17
      Hint = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1101#1090#1086#1090' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      TabOrder = 2
    end
    object bbCancel: TBitBtn
      Left = 496
      Top = 2
      Width = 75
      Height = 30
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
    object bbOk: TBitBtn
      Left = 404
      Top = 2
      Width = 88
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = bbOkClick
    end
  end
  object pgcFilter: TPageControl
    Left = 0
    Top = 0
    Width = 575
    Height = 361
    ActivePage = tsFilter
    Align = alClient
    TabOrder = 0
    object tsFilter: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1092#1080#1083#1100#1090#1088
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 567
        Height = 333
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          567
          333)
        object lbl5: TLabel
          Left = 11
          Top = 19
          Width = 76
          Height = 13
          Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        end
        object lblState: TLabel
          Left = 11
          Top = 49
          Width = 94
          Height = 13
          Caption = #1057#1090#1072#1090#1091#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        end
        object lbl1: TLabel
          Left = 11
          Top = 78
          Width = 76
          Height = 13
          Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103
        end
        object lbl2: TLabel
          Left = 241
          Top = 78
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object lblMat: TLabel
          Left = 11
          Top = 105
          Width = 70
          Height = 13
          Caption = #1057' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1084
        end
        object lbl3: TLabel
          Left = 11
          Top = 132
          Width = 46
          Height = 13
          Caption = #1053#1072' '#1089#1082#1083#1072#1076
        end
        object lbl4: TLabel
          Left = 11
          Top = 159
          Width = 85
          Height = 13
          Caption = #1057#1086' '#1089#1082#1083#1072#1076#1072' '#1089#1082#1083#1072#1076
        end
        object cbbNODE_TYPE: TDBLookupComboboxEh
          Left = 111
          Top = 16
          Width = 448
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          DataField = 'MD_TYPE'
          DataSource = srcFilter
          DropDownBox.AutoDrop = True
          DropDownBox.Sizable = True
          EmptyDataInfo.Text = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072', '#1077#1089#1083#1080' '#1087#1091#1089#1090#1086' '#1090#1086' '#1074#1089#1077' '#1090#1080#1087#1099
          EditButtons = <>
          KeyField = 'O_ID'
          ListField = 'O_NAME'
          ListSource = srcType
          ShowHint = True
          TabOrder = 0
          Visible = True
        end
        object edStart: TDBDateTimeEditEh
          Left = 111
          Top = 75
          Width = 121
          Height = 21
          DataField = 'dStart'
          DataSource = srcFilter
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1089
          Kind = dtkDateEh
          ShowHint = True
          TabOrder = 2
          Visible = True
        end
        object edEnd: TDBDateTimeEditEh
          Left = 260
          Top = 75
          Width = 121
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'dEnd'
          DataSource = srcFilter
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1076#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1087#1086
          Kind = dtkDateEh
          ShowHint = True
          TabOrder = 3
          Visible = True
        end
        object cbSate: TDBComboBoxEh
          Left = 111
          Top = 46
          Width = 448
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'MD_STATE'
          DataSource = srcFilter
          DynProps = <>
          EmptyDataInfo.Text = #1055#1088#1086#1074#1077#1076#1077#1085' '#1080#1083#1080' '#1085#1077#1090', '#1077#1089#1083#1080' '#1087#1091#1089#1090#1086' '#1090#1086' '#1083#1102#1073#1086#1081' '#1089#1090#1072#1090#1091#1089
          EditButtons = <>
          Items.Strings = (
            #1055#1088#1086#1074#1077#1076#1077#1085
            #1053#1077' '#1087#1088#1086#1074#1077#1076#1077#1085
            #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1077' '#1087#1088#1086#1074#1077#1076#1077#1085#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1087#1088#1080' '#1083#1102#1073#1086#1084' '#1091#1089#1083#1086#1074#1080#1080)
          KeyItems.Strings = (
            '0'
            '1'
            '-1')
          ShowHint = True
          TabOrder = 1
          Visible = True
        end
        object lcbMat: TDBLookupComboboxEh
          Left = 111
          Top = 102
          Width = 448
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          DataField = 'M_ID'
          DataSource = srcFilter
          DropDownBox.AutoDrop = True
          DropDownBox.Sizable = True
          EmptyDataInfo.Text = #1052#1072#1090#1077#1088#1080#1072#1083', '#1077#1089#1083#1080' '#1087#1091#1089#1090#1086' '#1090#1086' '#1074#1089#1077' '#1084#1072#1090#1077#1088#1080#1072#1083#1099
          EditButtons = <>
          KeyField = 'M_Id'
          ListField = 'NAME'
          ListSource = srcMat
          ShowHint = True
          TabOrder = 4
          Visible = True
        end
        object lcbM_ID: TDBLookupComboboxEh
          Left = 111
          Top = 129
          Width = 448
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          DataField = 'WH_IN'
          DataSource = srcFilter
          DropDownBox.AutoDrop = True
          DropDownBox.Sizable = True
          EmptyDataInfo.Text = #1053#1072' '#1082#1072#1082#1086#1081' '#1089#1082#1083#1072#1076' '#1087#1088#1080#1093#1086#1076', '#1077#1089#1083#1080' '#1087#1091#1089#1090#1086' '#1090#1086' - '#1083#1102#1073#1086#1081
          EditButtons = <>
          KeyField = 'O_ID'
          ListField = 'O_NAME'
          ListSource = srcWHIN
          ShowHint = True
          TabOrder = 5
          Visible = True
        end
        object lcbWH_IN: TDBLookupComboboxEh
          Left = 111
          Top = 156
          Width = 448
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          DataField = 'WH_OUT'
          DataSource = srcFilter
          DropDownBox.AutoDrop = True
          DropDownBox.Sizable = True
          EmptyDataInfo.Text = #1057' '#1082#1072#1082#1086#1075#1086' '#1089#1082#1083#1072#1076#1072' '#1089#1087#1080#1089#1072#1083#1080', '#1077#1089#1083#1080' '#1087#1091#1089#1090#1086' '#1090#1086' - '#1083#1102#1073#1086#1081
          EditButtons = <>
          KeyField = 'O_ID'
          ListField = 'O_NAME'
          ListSource = srcWHIN
          ShowHint = True
          TabOrder = 6
          Visible = True
        end
      end
    end
  end
  object pnlFilter: TPanel
    Left = 0
    Top = 361
    Width = 575
    Height = 40
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    DesignSize = (
      575
      40)
    object lblFnew: TLabel
      Left = 201
      Top = 8
      Width = 86
      Height = 26
      Alignment = taRightJustify
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' '#13#10#1091#1089#1083#1086#1074#1080#1077'  '#1082#1072#1082
    end
    object lblDelim: TLabel
      Left = 335
      Top = 14
      Width = 4
      Height = 13
      Caption = '/'
    end
    object lblOrAND: TLabel
      Left = 6
      Top = 10
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbnvgr: TDBNavigator
      Left = 408
      Top = 8
      Width = 155
      Height = 25
      DataSource = srcFilter
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
      Anchors = [akTop, akRight]
      TabOrder = 1
    end
    object chkinversion: TDBCheckBoxEh
      Left = 50
      Top = 12
      Width = 117
      Height = 17
      Hint = 
        #1090'.'#1077'. '#1076#1086#1073#1072#1074#1080#1084' '#1086#1090#1088#1080#1094#1072#1085#1080#1077' '#1074' '#1091#1089#1083#1086#1074#1080#1077'.'#13#10#1085#1072#1087#1088#1080#1084#1077#1088' '#1085#1077' '#1078#1080#1074#1077#1090' '#1085#1072' '#1091#1083#1080#1094#1077' '#1051#1077 +
        #1085#1080#1085#1072' '#1074' '#1076#1086#1084#1077' 6'
      Caption = #1048#1085#1074#1077#1088#1089#1080#1103' '#1092#1080#1083#1100#1090#1088#1072
      DataField = 'inversion'
      DataSource = srcFilter
      DynProps = <>
      TabOrder = 3
    end
    object btnAND: TButton
      Left = 290
      Top = 8
      Width = 38
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1077' '#1048' ( '#1076#1086#1087#1086#1083#1085#1103#1102#1097#1077#1077' '#1090#1077#1082#1091#1097#1077#1077' )'
      Caption = #1048
      TabOrder = 2
      OnClick = btnANDClick
    end
    object btnOR: TButton
      Left = 346
      Top = 8
      Width = 39
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1077' '#1048#1051#1048' ('#1090#1077#1082#1091#1097#1077#1077' '#1048#1051#1048' '#1085#1086#1074#1086#1077' '#1091#1089#1083#1086#1074#1080#1077')'
      Caption = #1048#1051#1048
      TabOrder = 0
      OnClick = btnORClick
    end
  end
  object srcFilter: TDataSource
    DataSet = MatDocsForm.dsFilter
    OnDataChange = srcFilterDataChange
    Left = 134
    Top = 269
  end
  object srcType: TDataSource
    DataSet = dsType
    Left = 374
    Top = 240
  end
  object dsType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    o.O_Id, o.O_Name'
      '  from objects o'
      '  where o.O_Type = 28'
      '        and coalesce(o.O_Deleted,0) <> 1'
      '  order by o.O_Name  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 369
    Top = 288
    oFetchAll = True
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'FTR'
    Filter = #1060#1080#1083#1100#1090#1088#1099'|*.FTR'
    InitialDir = 'filters'
    Options = [ofHideReadOnly, ofNoChangeDir, ofNoNetworkButton, ofEnableSizing]
    OptionsEx = [ofExNoPlacesBar]
    Left = 51
    Top = 282
  end
  object actlst1: TActionList
    Left = 58
    Top = 232
    object actOk: TAction
      Caption = '&'#1059#1089#1090#1072#1085#1086#1074#1080#1090#1100
      SecondaryShortCuts.Strings = (
        'Alt+'#1091
        'Alt+'#1059
        'Alt+E'
        'Alt+e')
      ShortCut = 16397
    end
    object actClear: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      SecondaryShortCuts.Strings = (
        'Ctrl+'#1054
        'Ctrl+O'
        'Ctrl+'#1065)
      ShortCut = 16458
      OnExecute = actClearExecute
    end
  end
  object dsMaterials: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      
        '    m.M_Id, m.Name || coalesce('#39' / '#39'||g.Mg_Name,'#39#39') || coalesce(' +
        #39' - '#39'||m.DESCRIPTION,'#39#39') NAME'
      '  from materials m'
      '       left outer join Materials_Group g on (m.Mg_Id = g.Mg_Id)'
      '  order by m.Name, g.Mg_Name')
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 432
    Top = 296
  end
  object srcMat: TDataSource
    AutoEdit = False
    DataSet = dsMaterials
    Left = 420
    Top = 248
  end
  object dsWHIN: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    o.O_Id, o.O_Name'
      '  from objects o'
      '  where o.O_Type = 10 and o.O_DELETED = 0'
      '  order by o.O_Deleted desc, o.O_Name  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 496
    Top = 296
  end
  object srcWHIN: TDataSource
    AutoEdit = False
    DataSet = dsWHIN
    Left = 500
    Top = 240
  end
end
