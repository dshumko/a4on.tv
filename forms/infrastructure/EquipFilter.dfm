object EquipFilterForm: TEquipFilterForm
  Left = 394
  Top = 207
  ActiveControl = dblStreet
  BorderStyle = bsSizeToolWin
  Caption = #1060#1080#1083#1100#1090#1088' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
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
        object lbl4: TLabel
          Left = 11
          Top = 187
          Width = 18
          Height = 13
          Caption = #1058#1080#1087
        end
        object lbl5: TLabel
          Left = 11
          Top = 215
          Width = 73
          Height = 13
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        end
        object lbl41: TLabel
          Left = 11
          Top = 241
          Width = 24
          Height = 13
          Caption = #1059#1079#1077#1083
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
          object lbl2: TLabel
            Left = 6
            Top = 135
            Width = 30
            Height = 13
            Caption = #1056#1072#1081#1086#1085
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
            OnChange = dblStreetChange
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
            DropDownBox.Columns = <
              item
                FieldName = 'HOUSE_NO'
              end
              item
                FieldName = 'Subarea_Name'
                Width = 40
              end>
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
          object edtPLACE: TDBEditEh
            Left = 336
            Top = 74
            Width = 207
            Height = 21
            Hint = #1101#1090#1072#1078
            Anchors = [akLeft, akTop, akRight]
            DataField = 'PLACE'
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
          Width = 176
          Height = 17
          Caption = #1042#1082#1083#1102#1095#1072#1090#1100' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1072#1076#1088#1077#1089#1091
          DataField = 'CHECK_ADRESS'
          DataSource = srcFilter
          DynProps = <>
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object cbEQ_TYPE: TDBComboBoxEh
          Left = 80
          Top = 184
          Width = 468
          Height = 21
          DataField = 'EQ_TYPE'
          DataSource = srcFilter
          DynProps = <>
          EmptyDataInfo.Text = #1058#1080#1087' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
          EditButtons = <>
          Items.Strings = (
            #1057#1077#1090#1077#1074#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
            #1050#1072#1073#1077#1083#1100#1085#1086#1077' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
            #1055#1088#1086#1095#1077#1077)
          KeyItems.Strings = (
            '1'
            '2'
            '3')
          ShowHint = True
          TabOrder = 2
          Visible = True
        end
        object edtNAME: TDBEditEh
          Left = 127
          Top = 211
          Width = 421
          Height = 21
          DataField = 'NAME'
          DataSource = srcFilter
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1056#1072#1074#1085#1086' '#1080#1083#1080' '#1089#1086#1076#1077#1088#1078#1080#1090' ('#1077#1089#1083#1080' '#1077#1089#1090#1100' '#1089#1080#1084#1074#1086#1083#1099' % _)'
          ShowHint = True
          TabOrder = 4
          Visible = True
        end
        object chkCHECK_ADRESS: TDBCheckBoxEh
          Left = 90
          Top = 213
          Width = 31
          Height = 17
          Hint = #1053#1077' '#1088#1072#1074#1085#1086' '#1080#1083#1080' '#1085#1077' '#1089#1086#1076#1077#1088#1078#1080#1090
          Alignment = taLeftJustify
          Caption = #1085#1077
          DataField = 'NOT_NAME'
          DataSource = srcFilter
          DynProps = <>
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object lcbNode: TDBLookupComboboxEh
          Left = 80
          Top = 238
          Width = 468
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          DataField = 'NODE_ID'
          DataSource = srcFilter
          DropDownBox.Columns = <
            item
              FieldName = 'NAME'
              Title.Caption = #1059#1095#1072#1089#1090#1086#1082
              Width = 60
            end
            item
              FieldName = 'ADDRESS'
              Title.Caption = #1056#1072#1081#1086#1085
              Width = 40
            end>
          DropDownBox.ListSource = srcNodes
          DropDownBox.ListSourceAutoFilter = True
          DropDownBox.ListSourceAutoFilterAllColumns = True
          DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
          DropDownBox.AutoDrop = True
          DropDownBox.ShowTitles = True
          DropDownBox.Sizable = True
          EmptyDataInfo.Text = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1091#1079#1083#1091
          EditButtons = <>
          KeyField = 'NODE_ID'
          ListField = 'NAME'
          ListSource = srcNodes
          ShowHint = True
          Style = csDropDownEh
          TabOrder = 5
          Visible = True
          OnExit = checkAdressSign
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
    DataSet = EquipmentForm.dsFilter
    OnDataChange = srcFilterDataChange
    Left = 134
    Top = 269
  end
  object srcStreets: TDataSource
    DataSet = dsStreets
    Left = 221
    Top = 296
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
    Left = 176
    Top = 296
    oFetchAll = True
  end
  object srcHomes: TDataSource
    DataSet = dsHomes
    Left = 369
    Top = 302
  end
  object dsHomes: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    h.HOUSE_ID'
      '  , h.STREET_ID'
      '  , h.HOUSE_NO'
      '  , h.Q_FLAT'
      '  , sa.Subarea_Name'
      '  from HOUSE h'
      
        '       left outer join Subarea sa on (sa.Subarea_Id = h.Subarea_' +
        'Id)'
      '  where h.street_id = :street_id'
      '  order by h.HOUSE_NO')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcStreets
    Left = 308
    Top = 308
    oFetchAll = True
  end
  object srcSubArea: TDataSource
    DataSet = dsSubArea
    Left = 350
    Top = 232
  end
  object dsSubArea: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT s.subarea_id, s.subarea_name, a.area_name'
      'FROM subarea s left outer join area a on (a.area_id = s.area_id)'
      'ORDER BY subarea_name, a.area_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 289
    Top = 224
    oFetchAll = True
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'FTR'
    Filter = #1060#1080#1083#1100#1090#1088#1099'|*.JNF'
    InitialDir = 'filters'
    Options = [ofHideReadOnly, ofNoChangeDir, ofNoNetworkButton, ofEnableSizing]
    OptionsEx = [ofExNoPlacesBar]
    Left = 51
    Top = 282
  end
  object actlst1: TActionList
    Left = 82
    Top = 288
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
    Left = 457
    Top = 237
    oFetchAll = True
  end
  object srcArea: TDataSource
    DataSet = dsArea
    Left = 494
    Top = 245
  end
  object dsNodes: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    n.Node_Id'
      '  , n.Name ||'#39' ('#39'|| o.O_Name ||'#39')'#39' name'
      '  , o.O_DIMENSION as COLOR'
      
        '  , s.street_short ||'#39' '#39'||S.Street_Name||'#39' '#1076'. '#39'|| H.House_No Add' +
        'ress'
      '  from NODES n'
      '       inner join HOUSE H on (n.HOUSE_ID = H.HOUSE_ID)'
      '       inner join STREET S on (H.STREET_ID = S.STREET_ID)'
      
        '       inner join objects o on (o.O_Id = n.Type_Id and o.O_Type ' +
        '= 38)'
      'order by 2')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 457
    Top = 293
    oFetchAll = True
  end
  object srcNodes: TDataSource
    DataSet = dsNodes
    Left = 494
    Top = 301
  end
end
