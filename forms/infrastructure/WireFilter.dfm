object WireFilterForm: TWireFilterForm
  Left = 394
  Top = 207
  ActiveControl = dblStreet
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
    TabOrder = 2
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
        object Label5: TLabel
          Left = 11
          Top = 184
          Width = 57
          Height = 13
          Caption = #1058#1080#1087' '#1082#1072#1073#1077#1083#1103
        end
        object Label8: TLabel
          Left = 11
          Top = 209
          Width = 50
          Height = 13
          Caption = #1052#1072#1090#1077#1088#1080#1072#1083
        end
        object Label9: TLabel
          Left = 11
          Top = 265
          Width = 40
          Height = 13
          Caption = #1054#1096#1080#1073#1082#1080
        end
        object lbl4: TLabel
          Left = 11
          Top = 238
          Width = 32
          Height = 13
          Caption = #1052#1077#1090#1082#1072
        end
        object grpAddress: TGroupBox
          Left = 5
          Top = 12
          Width = 553
          Height = 165
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          DesignSize = (
            553
            165)
          object Label1: TLabel
            Left = 6
            Top = 20
            Width = 31
            Height = 13
            Caption = #1059#1083#1080#1094#1072
          end
          object Label2: TLabel
            Left = 6
            Top = 49
            Width = 41
            Height = 13
            Caption = #8470' '#1076#1086#1084#1072
          end
          object Label6: TLabel
            Left = 6
            Top = 105
            Width = 55
            Height = 13
            Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090
          end
          object Label7: TLabel
            Left = 6
            Top = 135
            Width = 30
            Height = 13
            Caption = #1056#1072#1081#1086#1085
          end
          object lbl3: TLabel
            Left = 6
            Top = 77
            Width = 44
            Height = 13
            Caption = #1087#1086#1076#1098#1077#1079#1076
          end
          object lbl1: TLabel
            Left = 167
            Top = 77
            Width = 25
            Height = 13
            Caption = #1101#1090#1072#1078
          end
          object Label3: TLabel
            Left = 301
            Top = 77
            Width = 29
            Height = 13
            Caption = #1084#1077#1089#1090#1086
          end
          object dblStreet: TDBLookupComboboxEh
            Left = 75
            Top = 17
            Width = 468
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DynProps = <>
            DataField = 'STREET_ID'
            DataSource = srcFilter
            DropDownBox.Columns = <
              item
                FieldName = 'STREET_NAME'
                Title.Caption = #1059#1083#1080#1094#1072
              end
              item
                FieldName = 'STREET_CODE'
                Title.Caption = #1082#1086#1076
              end
              item
                FieldName = 'AREA_NAME'
                Title.Caption = #1056#1072#1081#1086#1085
                Width = 60
              end>
            DropDownBox.AutoDrop = True
            DropDownBox.ShowTitles = True
            DropDownBox.Sizable = True
            EmptyDataInfo.Text = #1059#1083#1080#1094#1072
            EditButtons = <>
            KeyField = 'STREET_ID'
            ListField = 'STREET_NAME'
            ListSource = srcStreets
            ShowHint = True
            TabOrder = 0
            Visible = True
            OnExit = checkAdressSign
          end
          object dblHouseNo: TDBLookupComboboxEh
            Left = 75
            Top = 46
            Width = 468
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DynProps = <>
            DataField = 'HOUSE_ID'
            DataSource = srcFilter
            DropDownBox.AutoDrop = True
            DropDownBox.Sizable = True
            EmptyDataInfo.Text = #1044#1086#1084
            EditButtons = <>
            KeyField = 'HOUSE_ID'
            ListField = 'HOUSE_NO'
            ListSource = srcHomes
            ShowHint = True
            TabOrder = 1
            Visible = True
            OnExit = checkAdressSign
          end
          object dblArea: TDBLookupComboboxEh
            Left = 75
            Top = 103
            Width = 468
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DynProps = <>
            DataField = 'AREA_ID'
            DataSource = srcFilter
            DropDownBox.AutoDrop = True
            DropDownBox.Sizable = True
            EmptyDataInfo.Text = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
            EditButtons = <>
            KeyField = 'AREA_ID'
            ListField = 'AREA_NAME'
            ListSource = srcArea
            ShowHint = True
            TabOrder = 5
            Visible = True
            OnExit = checkAdressSign
          end
          object dblSubArea: TDBLookupComboboxEh
            Left = 75
            Top = 132
            Width = 468
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DynProps = <>
            DataField = 'SUBAREA_ID'
            DataSource = srcFilter
            DropDownBox.Columns = <
              item
                FieldName = 'SUBAREA_NAME'
                Title.Caption = #1059#1095#1072#1089#1090#1086#1082
              end
              item
                FieldName = 'AREA_NAME'
                Title.Caption = #1056#1072#1081#1086#1085
              end>
            DropDownBox.AutoDrop = True
            DropDownBox.ShowTitles = True
            DropDownBox.Sizable = True
            EmptyDataInfo.Text = #1056#1072#1081#1086#1085
            EditButtons = <>
            KeyField = 'SUBAREA_ID'
            ListField = 'SUBAREA_NAME'
            ListSource = srcSubArea
            ShowHint = True
            TabOrder = 6
            Visible = True
            OnExit = checkAdressSign
          end
          object edtPORCH: TDBEditEh
            Left = 75
            Top = 74
            Width = 85
            Height = 21
            Hint = #1087#1086#1076#1098#1077#1079#1076
            DataField = 'PORCH'
            DataSource = srcFilter
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1087#1086#1076#1098#1077#1079#1076
            ShowHint = True
            TabOrder = 2
            Visible = True
          end
          object edtFloor: TDBEditEh
            Left = 209
            Top = 74
            Width = 85
            Height = 21
            Hint = #1101#1090#1072#1078
            DataField = 'FLOOR'
            DataSource = srcFilter
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1101#1090#1072#1078
            ShowHint = True
            TabOrder = 3
            Visible = True
          end
          object DBEditEh1: TDBEditEh
            Left = 336
            Top = 74
            Width = 207
            Height = 21
            Hint = #1101#1090#1072#1078
            Anchors = [akLeft, akTop, akRight]
            DataField = 'FLOOR'
            DataSource = srcFilter
            DynProps = <>
            EditButtons = <>
            EmptyDataInfo.Text = #1084#1077#1089#1090#1086' '#1091#1089#1090#1072#1085#1086#1074#1082#1080
            ShowHint = True
            TabOrder = 4
            Visible = True
          end
        end
        object chkAddress: TDBCheckBoxEh
          Left = 11
          Top = 8
          Width = 230
          Height = 17
          Caption = #1042#1082#1083#1102#1095#1072#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1072#1076#1088#1077#1089#1091
          DataField = 'CHECK_ADRESS'
          DataSource = srcFilter
          DynProps = <>
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object cbProblem: TDBComboBoxEh
          Left = 80
          Top = 262
          Width = 468
          Height = 21
          DataField = 'PROBLEM'
          DataSource = srcFilter
          DynProps = <>
          EmptyDataInfo.Text = #1054#1096#1080#1073#1082#1080' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103' '#1083#1080#1085#1080#1080' '#1089#1074#1103#1079#1080
          EditButtons = <>
          Items.Strings = (
            #1051#1080#1085#1080#1080' '#1089#1074#1086#1073#1086#1076#1085#1099
            #1055#1086#1076#1082#1083#1102#1095#1077#1085#1072' '#1086#1076#1085#1072' '#1090#1086#1095#1082#1072
            #1051#1080#1085#1080#1103' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1072' '#1082' '#1086#1090#1082#1083'. '#1072#1073#1086#1085#1077#1085#1090#1091)
          KeyItems.Strings = (
            '1'
            '2'
            '3'
            '4')
          ShowHint = True
          TabOrder = 5
          Visible = True
        end
        object lcbMaterial: TDBLookupComboboxEh
          Left = 80
          Top = 208
          Width = 468
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          DataField = 'MatID'
          DataSource = srcFilter
          DropDownBox.Columns = <
            item
              FieldName = 'NAME'
              Width = 40
            end
            item
              FieldName = 'M_NUMBER'
              Width = 20
            end
            item
              FieldName = 'MG_NAME'
              Width = 30
            end
            item
              FieldName = 'COST'
            end
            item
              FieldName = 'DESCRIPTION'
              Width = 60
            end>
          DropDownBox.ListSource = srcMat
          DropDownBox.ListSourceAutoFilter = True
          DropDownBox.ListSourceAutoFilterType = lsftContainsEh
          DropDownBox.ListSourceAutoFilterAllColumns = True
          DropDownBox.AutoDrop = True
          DropDownBox.Sizable = True
          EmptyDataInfo.Text = #1084#1072#1090#1077#1088#1080#1072#1083' '#1082#1072#1073#1077#1083#1103
          EditButtons = <>
          KeyField = 'M_ID'
          ListField = 'NAME'
          ListSource = srcMat
          ShowHint = True
          Style = csDropDownEh
          TabOrder = 3
          Visible = True
        end
        object lcbWTYPE: TDBLookupComboboxEh
          Left = 80
          Top = 181
          Width = 468
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          DataField = 'WTYPE'
          DataSource = srcFilter
          DropDownBox.Columns = <
            item
              FieldName = 'O_NAME'
            end
            item
              FieldName = 'O_DESCRIPTION'
            end>
          DropDownBox.ListSource = srcType
          DropDownBox.ListSourceAutoFilter = True
          DropDownBox.ListSourceAutoFilterAllColumns = True
          DropDownBox.AutoDrop = True
          DropDownBox.Sizable = True
          EmptyDataInfo.Text = #1058#1080#1087' '#1082#1072#1073#1077#1083#1103
          EditButtons = <>
          KeyField = 'O_ID'
          ListField = 'LINKNAME'
          ListSource = srcType
          ShowHint = True
          Style = csDropDownEh
          TabOrder = 2
          Visible = True
        end
        object edtLABEL: TDBEditEh
          Left = 80
          Top = 235
          Width = 468
          Height = 21
          Hint = #1084#1077#1090#1082#1072' '#1082#1072#1073#1077#1083#1103
          DataField = 'WLABEL'
          DataSource = srcFilter
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = 
            #1084#1077#1090#1082#1072'. '#1052#1086#1078#1085#1086' '#1080#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1089#1080#1084#1074#1086#1083#1099' _ ('#1083#1102#1073#1086#1081' '#1089#1080#1084#1074#1086#1083') '#1080#1083#1080' % ('#1087#1086#1089#1083#1077#1076 +
            #1086#1074#1072#1090#1077#1083#1100#1085#1086#1089#1090#1100' '#1089#1080#1084#1074#1086#1083#1086#1074')'
          ShowHint = True
          TabOrder = 4
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
    TabOrder = 1
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
      TabOrder = 3
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
      TabOrder = 0
    end
    object btnAND: TButton
      Left = 290
      Top = 8
      Width = 38
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1077' '#1048' ( '#1076#1086#1087#1086#1083#1085#1103#1102#1097#1077#1077' '#1090#1077#1082#1091#1097#1077#1077' )'
      Caption = #1048
      TabOrder = 1
      OnClick = btnANDClick
    end
    object btnOR: TButton
      Left = 346
      Top = 8
      Width = 39
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1077' '#1048#1051#1048' ('#1090#1077#1082#1091#1097#1077#1077' '#1048#1051#1048' '#1085#1086#1074#1086#1077' '#1091#1089#1083#1086#1074#1080#1077')'
      Caption = #1048#1051#1048
      TabOrder = 2
      OnClick = btnORClick
    end
  end
  object srcFilter: TDataSource
    DataSet = WireForm.dsFilter
    OnDataChange = srcFilterDataChange
    Left = 366
    Top = 5
  end
  object srcStreets: TDataSource
    DataSet = dsStreets
    Left = 405
    Top = 64
  end
  object dsStreets: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT s.street_id, s.street_name||'#39' '#39'||s.street_short as street' +
        '_name, a.area_name, s.STREET_CODE'
      'FROM STREET s left outer join area a on (a.area_id = s.area_id)'
      'ORDER BY STREET_NAME, a.area_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 408
    Top = 112
    oFetchAll = True
  end
  object srcHomes: TDataSource
    DataSet = dsHomes
    Left = 465
    Top = 70
  end
  object dsHomes: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT HOUSE_ID, STREET_ID, HOUSE_NO, Q_FLAT'
      'FROM HOUSE H'
      'where h.street_id = :street_id'
      'order by h.HOUSE_NO')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcStreets
    Left = 460
    Top = 116
    oFetchAll = True
  end
  object srcSubArea: TDataSource
    DataSet = dsSubArea
    Left = 238
    Top = 72
  end
  object dsSubArea: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT s.subarea_id, s.subarea_name, a.area_name'
      'FROM subarea s left outer join area a on (a.area_id = s.area_id)'
      'ORDER BY subarea_name, a.area_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 241
    Top = 120
    oFetchAll = True
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'FTR'
    Filter = #1060#1080#1083#1100#1090#1088#1099'|*.jwf'
    InitialDir = 'filters'
    Options = [ofHideReadOnly, ofNoChangeDir, ofNoNetworkButton, ofEnableSizing]
    OptionsEx = [ofExNoPlacesBar]
    Left = 163
    Top = 346
  end
  object actlst1: TActionList
    Left = 378
    Top = 328
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
  object dsArea: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from AREA'
      'where AREA_ID <> 0'
      'order by AREA_NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 313
    Top = 117
    oFetchAll = True
  end
  object srcArea: TDataSource
    DataSet = dsArea
    Left = 318
    Top = 69
  end
  object dsType: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    O_ID'
      '    , O_NAME||coalesce('#39' ('#39'||O_DESCRIPTION||'#39')'#39','#39#39') LinkName'
      '    , O_DIMENSION COLOR'
      '    , O_NAME'
      '    , O_DESCRIPTION'
      '  from OBJECTS o'
      '  where O_TYPE = 56'
      '        and O_DELETED = 0'
      '  order by 2  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 344
    Top = 190
  end
  object dsMat: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    m.M_ID'
      '  , m.NAME'
      '  , m.DIMENSION'
      '  , m.M_NUMBER'
      '  , mg.Mg_Name'
      '  , m.DESCRIPTION'
      '  , COST'
      '  from MATERIALS m'
      
        '       left outer join MATERIALS_GROUP mg on (mg.Mg_Id =  m.MG_I' +
        'D)'
      '  where (m.Is_Unit = 0) or (m.Is_Unit is null)'
      'order by m.NAME, mg.Mg_Name')
    AutoCalcFields = False
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 442
    Top = 186
  end
  object srcMat: TDataSource
    AutoEdit = False
    DataSet = dsMat
    Left = 492
    Top = 188
  end
  object srcType: TDataSource
    AutoEdit = False
    DataSet = dsType
    Left = 260
    Top = 190
  end
end
