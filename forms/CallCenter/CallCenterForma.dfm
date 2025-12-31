object CallCenterForm: TCallCenterForm
  Left = 0
  Top = 0
  Caption = #1054#1090#1076#1077#1083' '#1086#1073#1079#1074#1086#1085#1072
  ClientHeight = 462
  ClientWidth = 829
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 0
    Top = 274
    Width = 829
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object lbl5: TLabel
    Left = 24
    Top = 94
    Width = 44
    Height = 13
    Caption = #1058#1077#1083#1077#1092#1086#1085
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 829
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object pnlSearchAdres: TPanel
      Left = 0
      Top = 0
      Width = 829
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        829
        28)
      object lbl1: TLabel
        Left = 4
        Top = 7
        Width = 92
        Height = 13
        Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1072#1076#1088#1077#1089#1091
      end
      object cbbStreets: TDBLookupComboboxEh
        Left = 266
        Top = 4
        Width = 266
        Height = 21
        Hint = #1059#1083#1080#1094#1072
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        DropDownBox.ColumnDefValues.AutoDropDown = True
        DropDownBox.Columns = <
          item
            FieldName = 'PERCENT'
            Title.Caption = #1059#1083#1080#1094#1072' '#1080' % '#1087#1086#1076#1082#1083'.'
          end
          item
            AutoFitColWidth = False
            FieldName = 'STREET_CODE'
            Title.Caption = #1082#1086#1076
            Width = 25
          end
          item
            FieldName = 'AREA_NAME'
            Title.Caption = #1043#1086#1088#1086#1076
          end>
        DropDownBox.AutoDrop = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1059#1083#1080#1094#1072
        EditButtons = <>
        KeyField = 'STREET_ID'
        ListField = 'PERCENT'
        ListSource = srcStreet
        TabOrder = 1
        Visible = True
        OnChange = cbbStreetsChange
      end
      object cbbHOUSE: TDBLookupComboboxEh
        Left = 538
        Top = 4
        Width = 175
        Height = 21
        Hint = #1044#1086#1084
        Anchors = [akTop, akRight]
        DynProps = <>
        DataField = ''
        DropDownBox.ColumnDefValues.AutoDropDown = True
        DropDownBox.ColumnDefValues.DropDownSizing = True
        DropDownBox.Columns = <
          item
            FieldName = 'PERCENT'
            Title.Caption = #1053#1086#1084#1077#1088' '#1080' % '#1087#1086#1076#1082#1083'.'
          end>
        DropDownBox.AutoDrop = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1044#1086#1084
        EditButtons = <>
        KeyField = 'HOUSE_ID'
        ListField = 'PERCENT'
        ListSource = srcHouse
        TabOrder = 2
        Visible = True
      end
      object cbbAREA: TDBLookupComboboxEh
        Left = 107
        Top = 4
        Width = 153
        Height = 21
        DynProps = <>
        DataField = ''
        DropDownBox.ColumnDefValues.AutoDropDown = True
        DropDownBox.ColumnDefValues.DropDownSizing = True
        DropDownBox.Columns = <
          item
            FieldName = 'AREA_NAME'
            Title.Caption = #1053#1072#1089'. '#1087#1091#1085#1082#1090
          end>
        DropDownBox.AutoDrop = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1053#1072#1089#1077#1083#1077#1085#1085#1099#1081' '#1087#1091#1085#1082#1090
        EditButtons = <>
        KeyField = 'AREA_ID'
        ListField = 'AREA_NAME'
        ListSource = srcArea
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnChange = cbbAREAChange
      end
      object btnFilter: TButton
        Left = 717
        Top = 2
        Width = 107
        Height = 25
        Action = actAdresFilter
        Anchors = [akTop, akRight]
        TabOrder = 3
      end
    end
    object tlbFlats: TToolBar
      Left = 0
      Top = 28
      Width = 829
      Height = 28
      Caption = 'tlbFlats'
      Images = A4MainForm.ICONS_ACTIVE
      TabOrder = 1
      object btnQuickFilter: TToolButton
        Left = 0
        Top = 0
        Action = actQuickFilter
        OnClick = btnQuickFilterClick
      end
      object btn1: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'btn1'
        ImageIndex = 34
        Style = tbsSeparator
      end
      object btnRecourse: TToolButton
        Left = 31
        Top = 0
        Action = actRecourse
      end
    end
  end
  object pnlButtom: TPanel
    Left = 0
    Top = 277
    Width = 829
    Height = 185
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object spl2: TSplitter
      Left = 532
      Top = 0
      Height = 185
    end
    object pnlContacts: TPanel
      Left = 0
      Top = 0
      Width = 532
      Height = 185
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        532
        185)
      object SpeedButton1: TSpeedButton
        Left = 253
        Top = 99
        Width = 64
        Height = 21
        Caption = #1052#1086#1073'. '#1090'.'
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00CAAD90FFA96625FFC29C77FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B886
          52FFF9F7F5FFA25C15FFAB6828FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C7A88AFFA660
          1DFFDCC1A8FFCCA67EFFA86321FFB98A5BFFFF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B0743AFFAA68
          28FFA6611EFFFDFEFDFFA6611EFFAA6828FFFF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AF7338FFAB69
          29FFA86321FFCBA17AFFDEC3ABFFA6601DFFC59F79FFFF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00C09971FFAB69
          29FFAB6928FFA25B16FFF9F5F0FFC5A382FFFF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AB69
          29FFAB6929FFAA6827FFC19D78FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B98A
          5BFFAB6929FFAB6929FFAF743AFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00AB6929FFAB6929FFAB6929FFC6A788FFFF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00CAAD92FFAB6929FFAB6929FFAB6929FFCFBAA6FFFF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00B98A5AFFAB6929FFAB6929FFAB6929FFCAAE93FFFF00FF00FF00
          FF00C7A889FFA96523FFB17840FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00B88756FFAB6929FFAB6929FFAB6929FFB37C46FFCAAB
          8BFFFDFBF9FFB67E48FFA6601CFFAA6828FFC29E7AFFFF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00B88857FFAB6929FFAB6929FFAB6929FFA965
          22FFAC6B2CFFF3EBE1FFDBBEA4FFA35C16FFA96726FFB07339FFFF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00C4A281FFAB6929FFAB6929FFAB69
          29FFAA6727FFA35B16FFD0AB88FFF9F5F1FFB3753BFFB0763EFFFF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00AE7034FFAB69
          29FFAB6929FFAB6928FFA7611FFFB17338FFF0E7DEFFFF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CDB5
          9EFFB1773FFFAB6929FFAD6E30FFC09A73FFFF00FF00FF00FF00}
        OnClick = SpeedButton1Click
      end
      object btnCallP: TSpeedButton
        Left = 253
        Top = 62
        Width = 64
        Height = 21
        Action = actCall
        Flat = True
      end
      object Label1: TLabel
        Left = 4
        Top = 83
        Width = 105
        Height = 13
        Caption = #1052#1086#1073#1080#1083#1100#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
      end
      object lbl2: TLabel
        Left = 4
        Top = 4
        Width = 45
        Height = 13
        Caption = #1055#1086#1076#1098#1077#1079#1076
      end
      object lbl3: TLabel
        Left = 59
        Top = 4
        Width = 27
        Height = 13
        Caption = #1069#1090#1072#1078
      end
      object lbl6: TLabel
        Left = 110
        Top = 4
        Width = 64
        Height = 13
        Caption = #1060#1048#1054' '#1078#1080#1083#1100#1094#1072
      end
      object lbl4: TLabel
        Left = 4
        Top = 45
        Width = 44
        Height = 13
        Caption = #1058#1077#1083#1077#1092#1086#1085
      end
      object Panel1: TPanel
        Left = 323
        Top = 4
        Width = 206
        Height = 117
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object dbgrdhContacts: TDBGridEh
          Left = 0
          Top = 18
          Width = 206
          Height = 99
          Align = alClient
          DataSource = srcContacts
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghExtendVertLines]
          ReadOnly = True
          TabOrder = 1
          OnDblClick = dbgrdhContactsDblClick
          Columns = <
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CC_TYPE'
              Footers = <>
              KeyList.Strings = (
                '0'
                '1'
                '2'
                '3'
                '4'
                '5'
                '6')
              PickList.Strings = (
                #1090#1077#1083'.'
                #1084#1086#1073'.'
                'email'
                'skype'
                'icq'
                'Android'
                'iOS')
              Title.Caption = #1058#1080#1087
              Title.TitleButton = True
              Width = 30
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CC_VALUE'
              Footers = <>
              Title.Caption = #1050#1086#1085#1090#1072#1082#1090
              Title.TitleButton = True
              Width = 106
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'FIO'
              Footers = <>
              Title.Caption = #1060#1048#1054
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'ACCOUNT_NO'
              Footers = <>
              Title.Caption = #1051#1080#1094#1077#1074#1086#1081
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'DEBT_SUM'
              Footers = <>
              Title.Caption = #1057#1072#1083#1100#1076#1086
              Title.TitleButton = True
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CUST_STATE_DESCR'
              Footers = <>
              Title.Caption = #1057#1090#1072#1090#1091#1089
              Title.TitleButton = True
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pnlBtns: TPanel
          Left = 0
          Top = 0
          Width = 206
          Height = 18
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Label2: TLabel
            Left = 0
            Top = 0
            Width = 113
            Height = 18
            Align = alLeft
            AutoSize = False
            Caption = #1050#1086#1085#1090#1072#1082#1090#1099' '#1072#1073#1086#1085#1077#1085#1090#1072
          end
          object btnCall: TSpeedButton
            Left = 113
            Top = 0
            Width = 93
            Height = 18
            Action = actCallCustomer
            Align = alClient
            Anchors = [akLeft, akTop, akRight]
            Flat = True
          end
        end
      end
      object edtPHONE: TDBEditEh
        Left = 4
        Top = 63
        Width = 246
        Height = 21
        DataField = 'PHONE'
        DataSource = srcFlats
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1058#1077#1083#1077#1092#1086#1085
        TabOrder = 4
        Visible = True
      end
      object edtMOBILE: TDBEditEh
        Left = 4
        Top = 100
        Width = 246
        Height = 21
        DataField = 'MOBILE'
        DataSource = srcFlats
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1052#1086#1073#1080#1083#1100#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
        TabOrder = 5
        Visible = True
      end
      object edtPORCH_N: TDBEditEh
        Left = 4
        Top = 19
        Width = 50
        Height = 21
        DataField = 'PORCH_N'
        DataSource = srcFlats
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1055#1086#1076#1098#1077#1079#1076
        TabOrder = 1
        Visible = True
      end
      object edtFLOOR_N: TDBEditEh
        Left = 57
        Top = 19
        Width = 50
        Height = 21
        DataField = 'FLOOR_N'
        DataSource = srcFlats
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1069#1090#1072#1078
        TabOrder = 2
        Visible = True
      end
      object edtPHONE2: TDBEditEh
        Left = 110
        Top = 19
        Width = 207
        Height = 21
        DataField = 'NAME'
        DataSource = srcFlats
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1048#1084#1103
        TabOrder = 3
        Visible = True
      end
      object pnlNotice: TPanel
        Left = 0
        Top = 123
        Width = 532
        Height = 62
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        TabOrder = 6
        object lbl7: TLabel
          Left = 0
          Top = 0
          Width = 67
          Height = 13
          Align = alTop
          Caption = '  '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        end
        object dbmNOTICE: TDBMemoEh
          Left = 0
          Top = 13
          Width = 532
          Height = 49
          Align = alClient
          AutoSize = False
          DataField = 'NOTICE'
          DataSource = srcFlats
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          TabOrder = 0
          Visible = True
          WantReturns = True
        end
      end
    end
    object pnlAdd: TPanel
      Left = 535
      Top = 0
      Width = 294
      Height = 185
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object dbtxtSTATE: TDBText
        Left = 0
        Top = 0
        Width = 294
        Height = 117
        Align = alTop
        DataField = 'STATE'
        DataSource = srcFlats
      end
      object spl3: TSplitter
        Left = 0
        Top = 117
        Width = 294
        Height = 3
        Cursor = crVSplit
        Align = alTop
      end
      object dbgRec: TDBGridEh
        Left = 0
        Top = 120
        Width = 294
        Height = 65
        Align = alClient
        DataSource = srcRecourses
        DynProps = <>
        Flat = True
        TabOrder = 0
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'O_NAME'
            Footers = <>
            Title.Caption = #1058#1080#1087
            Title.TitleButton = True
            Width = 58
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 126
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 63
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_BY'
            Footers = <>
            Title.Caption = #1057#1086#1079#1076#1072#1083
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1050#1086#1075#1076#1072
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_BY'
            Footers = <>
            Title.Caption = #1048#1079#1084#1077#1085#1080#1083
            Title.TitleButton = True
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'EDIT_ON'
            Footers = <>
            Title.Caption = #1050#1086#1075#1076#1072
            Title.TitleButton = True
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object pnlClient: TPanel
    Left = 0
    Top = 51
    Width = 829
    Height = 223
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dbgFlats: TDBGridEh
      Left = 0
      Top = 0
      Width = 829
      Height = 223
      Align = alClient
      DataSource = srcFlats
      DrawMemoText = True
      DynProps = <>
      Flat = True
      EmptyDataInfo.Text = #1053#1077#1090' '#1076#1072#1085#1085#1099#1093'. '#1042#1086#1079#1084#1086#1078#1085#1072' '#1085#1077' '#1079#1072#1087#1086#1083#1085#1077#1085#1072' '#1082#1072#1088#1090#1072' '#1076#1086#1084#1072' '#1076#1083#1103' '#1101#1090#1086#1075#1086' '#1072#1076#1088#1077#1089#1072
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      SearchPanel.Enabled = True
      STFilter.InstantApply = False
      STFilter.Local = True
      TabOrder = 0
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FLAT_NO'
          Footers = <>
          Title.Caption = #1050#1074'.'
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PORCH_N'
          Footers = <>
          Title.Caption = #1055#1086#1076#1098#1077#1079#1076
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FLOOR_N'
          Footers = <>
          Title.Caption = #1069#1090#1072#1078
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1060#1048#1054' '#1078#1080#1083#1100#1094#1072
          Title.TitleButton = True
          Width = 262
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'PHONE'
          Footers = <>
          Title.Caption = #1058#1077#1083#1077#1092#1086#1085
          Title.TitleButton = True
          Width = 85
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'MOBILE'
          Footers = <>
          Title.Caption = #1052#1086#1073'. '#1090#1077#1083'.'
          Title.TitleButton = True
          Width = 78
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STATE'
          Footers = <>
          Title.Caption = #1057#1090#1072#1090#1091#1089
          Title.TitleButton = True
          Width = 74
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object actlstFlats: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 112
    Top = 120
    object actAdresFilter: TAction
      Caption = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1072#1076#1088#1077#1089#1091
      ImageIndex = 88
      OnExecute = actAdresFilterExecute
    end
    object actCall: TAction
      Caption = #1047#1074#1086#1085#1086#1082
      ImageIndex = 81
      ShortCut = 116
      OnExecute = actCallExecute
    end
    object actQuickFilter: TAction
      Caption = 'actQuickFilter'
      ImageIndex = 33
    end
    object actCallCustomer: TAction
      Hint = #1055#1086#1079#1074#1086#1085#1080#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1091
      ImageIndex = 81
      ShortCut = 117
      OnExecute = actCallCustomerExecute
    end
    object actRecourse: TAction
      Caption = #1054#1073#1088#1072#1097#1077#1085#1080#1077
      ImageIndex = 49
      ShortCut = 119
      OnExecute = actRecourseExecute
    end
  end
  object dsArea: TpFIBDataSet
    SelectSQL.Strings = (
      'select *'
      'from AREA'
      'where AREA_ID <> 0'
      'order by AREA_NAME')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 448
    Top = 120
    oFetchAll = True
  end
  object srcArea: TDataSource
    DataSet = dsArea
    Left = 448
    Top = 176
  end
  object dsStreets: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    si.*'
      
        '  , si.street_name || '#39' ('#39' || iif((coalesce(Q_Flat, 0) <> 0), ro' +
        'und(CONNECTED * 100 / Q_Flat, 1), 0.0) || '#39'% '#1087#1086#1076#1082#1083')'#39' PERCENT'
      '  from (select'
      '            s.street_id'
      
        '          , s.street_name || '#39' '#39' || s.street_short as street_nam' +
        'e'
      '          , a.area_name'
      '          , s.STREET_CODE'
      '          , a.Area_Id'
      '          ,'
      '            (select'
      '                 count(distinct a.Flat_No)'
      '               from CUSTOMER A'
      
        '                    inner join house h on (a.HOUSE_ID = h.HOUSE_' +
        'ID)'
      '               where h.Street_Id = s.Street_Id'
      '                     and exists(select'
      '                                    ash.Customer_Id'
      '                                  from Subscr_Hist ash'
      
        '                                  where (a.Customer_Id = ash.Cus' +
        'tomer_Id)'
      
        '                                        and (current_date betwee' +
        'n ash.Date_From and ash.Date_To))) as CONNECTED'
      '          ,'
      '            (select'
      '                 sum(H.Q_FLAT)'
      '               from HOUSE H'
      '               where h.street_id = s.Street_Id) Q_Flat'
      '          from STREET s'
      '               left outer join area a on (a.area_id = s.area_id)'
      ''
      '          where ((s.area_id = :area_id)'
      '                  or (:area_id is null))) si'
      '  order by si.STREET_NAME, si.area_name')
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 392
    Top = 120
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 392
    Top = 176
  end
  object dsHomes: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    aH.*'
      
        '  , aH.HOUSE_NO ||'#39' ('#39'||iif((coalesce(ah.Q_Flat, 0) <> 0), round' +
        '(ah.CONNECTED * 100 / ah.Q_Flat, 1), 0.0)||'#39'% '#1087#1086#1076#1082#1083')'#39' PERCENT'
      ''
      '  from (select'
      '            H.HOUSE_ID'
      '          , H.STREET_ID'
      '          , H.HOUSE_NO'
      '          , H.Q_FLAT'
      '          ,'
      '            (select'
      '                 count(distinct a.Flat_No)'
      '               from CUSTOMER A'
      '               where a.HOUSE_ID = h.HOUSE_ID'
      '                     and exists(select'
      '                                    ash.Customer_Id'
      '                                  from Subscr_Hist ash'
      
        '                                  where (a.Customer_Id = ash.Cus' +
        'tomer_Id)'
      
        '                                        and (current_date betwee' +
        'n ash.Date_From and ash.Date_To))) as CONNECTED'
      '          ,'
      '            (select'
      '                 count(distinct a.Flat_No)'
      '               from CUSTOMER A'
      '               where a.HOUSE_ID = h.HOUSE_ID'
      '                     and not exists(select'
      '                                        ash.Customer_Id'
      '                                      from Subscr_Hist ash'
      
        '                                      where (a.Customer_Id = ash' +
        '.Customer_Id)'
      
        '                                            and (current_date be' +
        'tween ash.Date_From and ash.Date_To))) as DISCONNECTED'
      ''
      '          from HOUSE H'
      '          where h.street_id = :street_id) ah'
      '  order by ah.HOUSE_NO')
    Transaction = trRead
    Database = dmMain.dbTV
    DataSource = srcStreet
    Left = 272
    Top = 120
  end
  object srcHouse: TDataSource
    DataSet = dsHomes
    Left = 272
    Top = 184
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 672
    Top = 120
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 672
    Top = 176
  end
  object dsFlats: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE HOUSEFLATS'
      'SET '
      '    PORCH_N = :PORCH_N,'
      '    FLOOR_N = :FLOOR_N,'
      '    NOTICE = :NOTICE,'
      '    NAME = :NAME,'
      '    PHONE = :PHONE,'
      '    MOBILE = :MOBILE'
      'WHERE'
      '    HOUSE_ID = :OLD_HOUSE_ID'
      '    and FLAT_NO = :OLD_FLAT_NO'
      '    ')
    DeleteSQL.Strings = (
      ''
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    h.Street_Id'
      '  , h.House_Id'
      '  , f.Flat_No'
      '  , f.Porch_N'
      '  , f.Floor_N'
      '  , f.Name  '
      '  , f.Notice'
      '  , f.Phone'
      '  , f.MOBILE'
      '  , cast((select'
      
        '         list(c.Account_No || '#39' '#39' || c.Debt_Sum || '#39' '#39' || c.Cust' +
        '_State_Descr, ascii_char(13))'
      '       from customer c'
      '       where c.House_Id = f.House_Id'
      
        '             and c.Flat_No = f.Flat_No) || coalesce(f.State, '#39#39')' +
        ' as varchar(1000)) STATE'
      '  from Houseflats f'
      '       inner join house h on (f.House_Id = h.House_Id)'
      'where  F.HOUSE_ID = :OLD_HOUSE_ID'
      '    and F.FLAT_NO = :OLD_FLAT_NO'
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    h.Street_Id'
      '  , h.House_Id'
      '  , f.Flat_No'
      '  , f.Porch_N'
      '  , f.Floor_N'
      '  , f.Name  '
      '  , f.Notice'
      '  , f.Phone'
      '  , f.MOBILE'
      '  , cast((select'
      
        '         list(c.Account_No || '#39' '#39' || c.Debt_Sum || '#39' '#39' || c.Cust' +
        '_State_Descr, ascii_char(13))'
      '       from customer c'
      '       where c.House_Id = f.House_Id'
      
        '             and c.Flat_No = f.Flat_No) || coalesce(f.State, '#39#39')' +
        ' as varchar(1000)) STATE'
      '  from Houseflats f'
      '       inner join house h on (f.House_Id = h.House_Id)'
      '  where @@where_clause%1=0@'
      '  order by f.Flat_No')
    AutoUpdateOptions.UpdateTableName = 'CUSTOMER'
    AutoUpdateOptions.KeyFields = 'CUSTOMER_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_CUSTOMER_UID'
    AutoUpdateOptions.WhenGetGenID = wgOnNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 336
    Top = 120
    poUseBooleanField = False
    poImportDefaultValues = False
    poSupportUnicodeBlobs = True
    poSetRequiredFields = True
    oVisibleRecno = True
    oFetchAll = True
  end
  object srcFlats: TDataSource
    DataSet = dsFlats
    Left = 336
    Top = 176
  end
  object mdsFilter: TMemTableEh
    Params = <>
    Left = 608
    Top = 128
  end
  object PropStorage: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'pnlButtom.<P>.Height'
      'pnlButtom.pnlAdd.dbtxtSTATE.<P>.Height'
      'pnlButtom.pnlContacts.<P>.Width')
    Left = 104
    Top = 176
  end
  object srcContacts: TDataSource
    DataSet = dsContacts
    Left = 208
    Top = 176
  end
  object dsContacts: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct'
      '    cc.CC_VALUE'
      '  , cc.CC_TYPE'
      
        '  , c.Surname || '#39' '#39' || coalesce(c.Firstname || '#39' '#39' || coalesce(' +
        'c.Midlename, '#39#39'), '#39#39') FIO'
      '  , c.Account_No'
      '  , c.Debt_Sum'
      '  , c.Cust_State_Descr'
      '  , cc.CC_NOTICE'
      '  from customer_contacts cc'
      '       inner join Customer c on (c.Customer_Id = cc.Customer_Id)'
      '  where cc.Cc_Type < 2'
      '        and c.House_Id = :HOUSE_ID'
      '        and c.Flat_No = :FLAT_NO'
      '  order by CC_TYPE, CC_VALUE')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    AutoCommit = True
    DataSource = srcFlats
    Left = 208
    Top = 120
  end
  object srcRecourses: TDataSource
    AutoEdit = False
    DataSet = dsRecourses
    Left = 512
    Top = 176
  end
  object dsRecourses: TpFIBDataSet
    RefreshSQL.Strings = (
      'select'
      '  rt.name'
      '  , o.o_name'
      '  , r.*'
      'from recourse r'
      '  inner join recourse_templates rt on (r.rc_type = rt.rt_id)'
      '  inner join objects o on (rt.type_id = o.o_id and o.O_TYPE = 8)'
      'where r.House_Id = :house_id and r.Flat_No = :flat_no'
      'and R.RC_ID = :OLD_RC_ID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '  rt.name'
      '  , o.o_name'
      '  , r.*'
      'from recourse r'
      '  inner join recourse_templates rt on (r.rc_type = rt.rt_id)'
      '  inner join objects o on (rt.type_id = o.o_id and o.O_TYPE = 8)'
      'where r.House_Id = :house_id and r.Flat_No = :flat_no'
      'order by r.Added_on desc')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    AutoCommit = True
    DataSource = srcFlats
    Left = 517
    Top = 120
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    oFetchAll = True
  end
end
