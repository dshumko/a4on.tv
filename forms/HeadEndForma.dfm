object HeadEndForm: THeadEndForm
  ShowHint = True
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #1057#1090#1072#1085#1094#1080#1103' ('#1059#1079#1077#1083')'
  ClientHeight = 524
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHead: TPanel
    Left = 0
    Top = 0
    Width = 618
    Height = 144
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 1
      Width = 84
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FocusControl = edtHE_NAME
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 327
      Top = 38
      Width = 31
      Height = 13
      Caption = #1052#1077#1089#1090#1086
      FocusControl = DBEdit4
    end
    object Label7: TLabel
      Left = 39
      Top = 255
      Width = 55
      Height = 13
      Caption = 'HOUSE_NO'
      FocusControl = DBEdit7
    end
    object lbl3: TLabel
      Left = 16
      Top = 40
      Width = 36
      Height = 13
      Caption = #1059#1083#1080#1094#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl4: TLabel
      Left = 215
      Top = 40
      Width = 25
      Height = 13
      Caption = #1044#1086#1084
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl5: TLabel
      Left = 16
      Top = 77
      Width = 61
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FocusControl = DBEdit4
    end
    object lblAttribute: TLabel
      Left = 215
      Top = 1
      Width = 18
      Height = 13
      Caption = #1058#1080#1087
    end
    object lbl6: TLabel
      Left = 327
      Top = 1
      Width = 68
      Height = 13
      Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082
    end
    object edtHE_NAME: TDBEditEh
      Left = 16
      Top = 17
      Width = 193
      Height = 21
      DataField = 'HE_NAME'
      DataSource = srcHE
      DynProps = <>
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object DBEdit4: TDBEditEh
      Left = 327
      Top = 54
      Width = 215
      Height = 21
      DataField = 'HE_PLACE'
      DataSource = srcHE
      DynProps = <>
      EditButtons = <>
      TabOrder = 5
      Visible = True
    end
    object DBEdit7: TDBEditEh
      Left = 39
      Top = 269
      Width = 134
      Height = 21
      DataField = 'HOUSE_NO'
      DataSource = srcHE
      DynProps = <>
      EditButtons = <>
      TabOrder = 7
      Visible = True
    end
    object cbbLupStreets: TDBLookupComboboxEh
      Left = 16
      Top = 54
      Width = 193
      Height = 21
      DynProps = <>
      DataField = 'STREET_ID'
      DataSource = srcHE
      DropDownBox.Columns = <
        item
          AutoFitColWidth = False
          FieldName = 'STREET_SHORT'
          Title.Caption = #1089#1086#1082#1088'.'
          Width = 20
        end
        item
          FieldName = 'STREET_NAME'
          Title.Caption = #1059#1083#1080#1094#1072
        end
        item
          FieldName = 'AREA_NAME'
          Title.Caption = #1056#1072#1081#1086#1085
        end>
      DropDownBox.AutoDrop = True
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'STREET_ID'
      ListField = 'STREET_NAME'
      ListSource = srcStreet
      TabOrder = 3
      Visible = True
    end
    object cbbLupHOUSE: TDBLookupComboboxEh
      Left = 215
      Top = 54
      Width = 108
      Height = 21
      DynProps = <>
      DataField = 'HOUSE_ID'
      DataSource = srcHE
      EditButtons = <>
      KeyField = 'HOUSE_ID'
      ListField = 'HOUSE_NO'
      ListSource = srcHouse
      TabOrder = 4
      Visible = True
    end
    object dbmmoNotice: TDBMemoEh
      Left = 16
      Top = 92
      Width = 526
      Height = 41
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcHE
      DynProps = <>
      EditButtons = <>
      TabOrder = 6
      Visible = True
      WantReturns = True
    end
    object cbbType: TDBLookupComboboxEh
      Left = 215
      Top = 17
      Width = 108
      Height = 21
      DynProps = <>
      DataField = 'HE_TYPE'
      DataSource = srcHE
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'O_NAME'
      ListSource = srcType
      TabOrder = 1
      Visible = True
    end
    object luParent: TDBLookupComboboxEh
      Left = 327
      Top = 17
      Width = 215
      Height = 21
      DynProps = <>
      DataField = 'PARENT_ID'
      DataSource = srcHE
      DropDownBox.Columns = <
        item
          FieldName = 'HE_NAME'
        end
        item
          FieldName = 'ADRES'
        end
        item
        end>
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'HE_ID'
      ListField = 'HE_NAME'
      ListSource = srcParent
      TabOrder = 2
      Visible = True
    end
  end
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 489
    Width = 618
    Height = 35
    Align = alBottom
    TabOrder = 2
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 327
      Top = 2
      Width = 203
      Height = 30
      ModalResult = 0
      OnClick = bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 536
      Top = 2
      Height = 30
    end
  end
  object pgcInfo: TPageControl
    Left = 0
    Top = 144
    Width = 618
    Height = 345
    ActivePage = tsChanals
    Align = alClient
    TabOrder = 1
    OnChange = pgcInfoChange
    object tsChanals: TTabSheet
      Caption = #1050#1072#1085#1072#1083#1099
      object pnlChannels: TPanel
        Left = 0
        Top = 0
        Width = 610
        Height = 317
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object spl1: TSplitter
          Left = 321
          Top = 0
          Height = 317
        end
        object pnl2: TPanel
          Left = 0
          Top = 0
          Width = 321
          Height = 317
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object lbl1: TLabel
            Left = 0
            Top = 0
            Width = 321
            Height = 13
            Align = alTop
            Caption = '.:: '#1044#1086#1089#1090#1091#1087#1085#1099' '#1076#1083#1103' '#1089#1090#1072#1085#1094#1080#1080' ::.'
          end
          object dbgrdGridSC: TDBGridEh
            Left = 0
            Top = 13
            Width = 284
            Height = 304
            Align = alClient
            AllowedOperations = [alopUpdateEh]
            AutoFitColWidths = False
            DataSource = srcHC
            DynProps = <>
            Flat = True
            FooterRowCount = 1
            FooterParams.Color = clWindow
            GridLineParams.VertEmptySpaceStyle = dessNonEh
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
            STFilter.Local = True
            STFilter.Visible = True
            SumList.Active = True
            TabOrder = 0
            OnDblClick = dbgrdGridSCDblClick
            Columns = <
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'CH_NUMBER'
                Footer.ValueType = fvtCount
                Footers = <>
                Title.Caption = #1053#1086#1084#1077#1088
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CH_NAME'
                Footers = <>
                Title.Caption = #1050#1072#1085#1072#1083
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CH_FREQ'
                Footers = <>
                Title.Caption = #1063#1072#1089#1090#1086#1090#1072
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
          object pnlProgrBtn: TPanel
            Left = 284
            Top = 13
            Width = 37
            Height = 304
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object btnChanAdd: TSpeedButton
              Left = 0
              Top = 0
              Width = 37
              Height = 60
              Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1082' '#1087#1072#1082#1077#1090#1091
              Align = alTop
              Flat = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3
                783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                B1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EB3783EB3783EB3
                783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FB1773EB3783E
                B3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB378
                3EB3783EB3783EB3783EFF00FFB1773EB3783EB3783EB3783EB3783EB3783EB3
                783EB3783EB3783EB3783EB3783EB3783EB3783EB3783EB3783FFF00FFFF00FF
                B1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB1773EB3783EB3
                783EB3783EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFB1773EB3783EB3783EB3783EFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              OnClick = btnChanAddClick
            end
            object btnChanRemove: TSpeedButton
              Left = 0
              Top = 244
              Width = 37
              Height = 60
              Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091' '#1080#1079' '#1087#1072#1082#1077#1090#1072
              Align = alBottom
              Flat = True
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                18000000000000030000C30E0000C30E00000000000000000000FF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3049CC30
                49CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF3049CC3049CC3049CC3049CCFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FF3049CC3049CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3049CC3049CC3049CC3049
                CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF3049CC3049CC3049CC3049CCFF00FFFF00FF3049CC3049CC
                3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049
                CC3049CC3049CCFF00FF3049CC3049CC3049CC3049CC3049CC3049CC3049CC30
                49CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC
                3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049CC3049
                CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FF3049CC3049CC3049CC3049CCFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3049CC3049CC3049CC3049
                CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FF3049CC3049CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FF3049CC3049CC3049CC3049CCFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3049CC30
                49CC3049CC3049CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
              OnClick = btnChanRemoveClick
            end
          end
        end
        object pnl3: TPanel
          Left = 324
          Top = 0
          Width = 286
          Height = 317
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object lbl2: TLabel
            Left = 0
            Top = 0
            Width = 286
            Height = 13
            Align = alTop
            Caption = '.:: '#1055#1077#1088#1077#1095#1077#1085#1100' '#1074#1089#1077#1093' '#1082#1072#1085#1072#1083#1086#1074' ::.'
          end
          object dbgrdGridC: TDBGridEh
            Left = 0
            Top = 13
            Width = 286
            Height = 304
            Align = alClient
            AllowedOperations = []
            AutoFitColWidths = False
            DataSource = srcC
            DynProps = <>
            Flat = True
            FooterParams.Color = clWindow
            GridLineParams.VertEmptySpaceStyle = dessNonEh
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
            ReadOnly = True
            STFilter.Local = True
            STFilter.Visible = True
            TabOrder = 0
            OnDblClick = dbgrdGridCDblClick
            Columns = <
              item
                AutoFitColWidth = False
                DynProps = <>
                EditButtons = <>
                FieldName = 'CH_NUMBER'
                Footers = <>
                Title.Caption = #1053#1086#1084#1077#1088
              end
              item
                DynProps = <>
                EditButtons = <>
                FieldName = 'CH_NAME'
                Footers = <>
                Title.Caption = #1050#1072#1085#1072#1083
              end>
            object RowDetailData: TRowDetailPanelControlEh
            end
          end
        end
      end
    end
    object tsHouses: TTabSheet
      Caption = #1047#1086#1085#1072' '#1086#1073#1089#1083#1091#1078#1080#1074#1072#1085#1080#1103
      ImageIndex = 1
      object dbgrdHouses: TDBGridEh
        Left = 0
        Top = 0
        Width = 610
        Height = 317
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        AutoFitColWidths = False
        DataSource = srcHouses
        DynProps = <>
        Flat = True
        FooterRowCount = 1
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        OptionsEh = [dghFixed3D, dghResizeWholeRightPart, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghRowHighlight, dghColumnResize, dghColumnMove]
        SortLocal = True
        STFilter.Local = True
        STFilter.Visible = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'STRT'
            Footers = <>
            Title.Caption = #1059#1083#1080#1094#1072
            Title.TitleButton = True
            Width = 151
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOUSE_NO'
            Footer.ValueType = fvtCount
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088
            Title.TitleButton = True
            Width = 53
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'Q_FLAT'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1050#1074#1072#1088#1090#1080#1088
            Title.Orientation = tohVertical
            Width = 33
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'CONNECTED'
            Footer.ValueType = fvtSum
            Footers = <>
            Title.Caption = #1055#1086#1076#1082#1083'.'
            Title.Orientation = tohVertical
            Width = 32
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'DISCONNECTED'
            Footers = <>
            Title.Caption = #1054#1090#1082#1083'.'
            Title.Orientation = tohVertical
            Width = 27
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'HOUSE_CODE'
            Footers = <>
            Title.Caption = #1050#1086#1076
          end
          item
            DropDownBox.Columns = <
              item
                FieldName = 'SUBAREA_NAME'
              end>
            DynProps = <>
            EditButtons = <>
            FieldName = 'SUBAREA_NAME'
            Footers = <>
            Title.Caption = #1056#1072#1081#1086#1085
            Title.TitleButton = True
            Width = 75
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1047#1074#1077#1085#1086
            Title.TitleButton = True
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'EXIST_TV'
            Footers = <>
            Title.Caption = #1045#1089#1090#1100'|TB'
            Title.Orientation = tohVertical
            Width = 20
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'EXIST_LAN'
            Footers = <>
            Title.Caption = #1045#1089#1090#1100'|'#1057#1055#1044
            Title.Orientation = tohVertical
            Width = 23
          end
          item
            AutoFitColWidth = False
            DynProps = <>
            EditButtons = <>
            FieldName = 'EXIST_DTV'
            Footers = <>
            Title.Caption = #1045#1089#1090#1100'|'#1062'TB'
            Title.Orientation = tohVertical
            Width = 24
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object dsHC: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE HEADEND_CHANNELS'
      'SET '
      '    CH_FREQ = :CH_FREQ,'
      '    CH_NUMBER = :CH_NUMBER'
      'WHERE'
      '    CH_ID = :OLD_CH_ID'
      '    and HE_ID = :OLD_HE_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    HEADEND_CHANNELS'
      'WHERE'
      '        CH_ID = :OLD_CH_ID'
      '    and HE_ID = :OLD_HE_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO HEADEND_CHANNELS('
      '    CH_ID,'
      '    HE_ID,'
      '    CH_FREQ,'
      '    CH_NUMBER'
      ')'
      'VALUES('
      '    :CH_ID,'
      '    :HE_ID,'
      '    :CH_FREQ,'
      '    :CH_NUMBER'
      ')')
    RefreshSQL.Strings = (
      'select c.Ch_Name, hc.*'
      
        'FROM Channels c inner join headend_channels hc on (c.Ch_Id = hc.' +
        'Ch_Id)'
      'where(  hc.he_id = :HE_ID'
      '     ) and (     HC.CH_ID = :OLD_CH_ID'
      '    and HC.HE_ID = :OLD_HE_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select c.Ch_Name, hc.*'
      
        'FROM Channels c inner join headend_channels hc on (c.Ch_Id = hc.' +
        'Ch_Id)'
      'where hc.he_id = :HE_ID'
      'order by c.Ch_Number, c.Ch_Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    DataSource = srcHE
    Left = 440
    Top = 372
    dcForceOpen = True
  end
  object srcHC: TDataSource
    DataSet = dsHC
    Left = 472
    Top = 372
  end
  object dsC: TpFIBDataSet
    SelectSQL.Strings = (
      'select c.Ch_Id, c.Ch_Number, c.Ch_Name'
      'FROM Channels c'
      
        'where not exists(select hc.ch_id FROM headend_channels hc w' +
        'here hc.ch_id = c.Ch_Id and hc.he_id = :HE_ID)'
      'order by c.Ch_Number, c.Ch_Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcHE
    Left = 544
    Top = 372
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object srcC: TDataSource
    AutoEdit = False
    DataSet = dsC
    Left = 576
    Top = 372
  end
  object dsHE: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE HEADEND'
      'SET '
      '    HE_NAME = :HE_NAME,'
      '    HOUSE_ID = :HOUSE_ID,'
      '    HE_PLACE = :HE_PLACE,'
      '    HE_TYPE = :HE_TYPE,'
      '    NOTICE = :NOTICE,'
      '    PARENT_ID = :PARENT_ID'
      'WHERE'
      '    HE_ID = :OLD_HE_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    HEADEND'
      'WHERE'
      '        HE_ID = :OLD_HE_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO HEADEND('
      '    HE_ID,'
      '    HE_NAME,'
      '    HOUSE_ID,'
      '    HE_PLACE,'
      '    HE_TYPE,'
      '    NOTICE,'
      '    PARENT_ID'
      ')'
      'VALUES('
      '    :HE_ID,'
      '    :HE_NAME,'
      '    :HOUSE_ID,'
      '    :HE_PLACE,'
      '    :HE_TYPE,'
      '    :NOTICE,'
      '    :PARENT_ID'
      ')')
    RefreshSQL.Strings = (
      
        'select he.*, s.street_name|| '#39' '#39'||s.street_short as street_name,' +
        ' h.house_no, s.street_id'
      'from HEADEND he'
      '  inner join house h on (he.house_id = h.house_id)'
      '  inner join street s on (h.street_id = s.street_id)'
      'where(  he.HE_ID = :HE_ID'
      '     ) and (     HE.HE_ID = :OLD_HE_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      
        'select he.*, s.street_name|| '#39' '#39'||s.street_short as street_name,' +
        ' h.house_no, s.street_id'
      'from HEADEND he'
      '  inner join house h on (he.house_id = h.house_id)'
      '  inner join street s on (h.street_id = s.street_id)'
      'where he.HE_ID = :HE_ID')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 103
    Top = 322
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
    Left = 142
    Top = 259
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
    Left = 201
    Top = 238
  end
  object srcHE: TDataSource
    DataSet = dsHE
    Left = 103
    Top = 376
  end
  object dsStreets: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT s.street_id, s.street_short,s.street_name, a.area_name'
      'FROM STREET s left outer join area a on (a.area_id = s.area_id)'
      'ORDER BY STREET_NAME, a.area_name')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 440
    Top = 258
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 430
    Top = 299
  end
  object dsHomes: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    H.HOUSE_ID,'
      '    H.STREET_ID,'
      '    H.HOUSE_NO,'
      '    H.Q_FLAT'
      'FROM'
      '    HOUSE H'
      'where h.street_id = :street_id'
      'order by h.HOUSE_NO'
      '')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcStreet
    Left = 493
    Top = 271
  end
  object srcHouse: TDataSource
    DataSet = dsHomes
    Left = 515
    Top = 242
  end
  object dsType: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT O_ID, O_NAME'
      'FROM OBJECTS'
      'WHERE O_TYPE = 9 AND O_DELETED = 0'
      'order BY O_NAME')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 272
    Top = 95
  end
  object srcType: TDataSource
    AutoEdit = False
    DataSet = dsType
    Left = 372
    Top = 98
  end
  object dsHouses: TpFIBDataSet
    DeleteSQL.Strings = (
      
        'execute procedure HOUSE_IUD('#39'D'#39', :HOUSE_ID, null, null, null, nu' +
        'll, null, '
      
        '    null, null, null, null, null, null, null, null, null, null, ' +
        'null)')
    RefreshSQL.Strings = (
      'select'
      ' H.*'
      
        ', (select cast(count(*) as Integer) from CUSTOMER A where A.CUST' +
        '_STATE>0 and a.HOUSE_ID = h.HOUSE_ID) as CONNECTED'
      
        ', (select cast(count(*) as Integer) from CUSTOMER A where A.CUST' +
        '_STATE=0 and a.HOUSE_ID = h.HOUSE_ID) as DISCONNECTED'
      ', case'
      ' when (h.q_flat is null) then 0'
      ' when (h.q_flat = 0) then 0'
      
        ' ELSE (select count(*)from CUSTOMER A where A.CUST_STATE>0 and a' +
        '.HOUSE_ID = h.HOUSE_ID)*100/h.q_flat'
      'end as PERCENT'
      ', o.ORG_NAME'
      ', s.SUBAREA_NAME'
      ', w.name'
      'from'
      ' HOUSE H '
      '   left outer join ORGANIZATION o on (o.ORG_ID = h.ORG_ID)'
      '   left outer join SUBAREA s on (s.SUBAREA_ID = h.SUBAREA_ID) '
      '   left outer join WORKGROUPS w on (w.WG_ID = h.WG_ID)'
      ''
      'where(  h.street_id = :STREET_ID'
      '     ) and (     H.HOUSE_ID = :OLD_HOUSE_ID'
      '     )'
      '    '
      ''
      ' ')
    SelectSQL.Strings = (
      'select'
      'u.street_name||'#39' '#39'|| u.street_short as strt,'
      ' H.*'
      
        ', (select cast(count(*) as Integer) from CUSTOMER A where A.CUST' +
        '_STATE>0 and a.HOUSE_ID = h.HOUSE_ID) as CONNECTED'
      
        ', (select cast(count(*) as Integer) from CUSTOMER A where A.CUST' +
        '_STATE=0 and a.HOUSE_ID = h.HOUSE_ID) as DISCONNECTED'
      ', case'
      ' when (h.q_flat is null) then 0'
      ' when (h.q_flat = 0) then 0'
      
        ' ELSE (select count(*)from CUSTOMER A where A.CUST_STATE>0 and a' +
        '.HOUSE_ID = h.HOUSE_ID)*100/h.q_flat'
      'end as PERCENT'
      ', o.ORG_NAME'
      ', s.SUBAREA_NAME'
      ', w.name'
      'from'
      ' HOUSE H '
      '   inner join street u on (u.street_id = h.street_id)'
      '   left outer join ORGANIZATION o on (o.ORG_ID = h.ORG_ID)'
      '   left outer join SUBAREA s on (s.SUBAREA_ID = h.SUBAREA_ID) '
      '   left outer join WORKGROUPS w on (w.WG_ID = h.WG_ID)'
      ''
      'where h.headend_id = :HE_ID'
      ''
      ' order by 1, h.house_no'
      '')
    AutoUpdateOptions.UpdateTableName = 'HOUSE'
    AutoUpdateOptions.KeyFields = 'HOUSE_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcHE
    Left = 217
    Top = 328
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
    dcForceOpen = True
  end
  object srcHouses: TDataSource
    AutoEdit = False
    DataSet = dsHouses
    Left = 299
    Top = 322
  end
  object dsParent: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE HEADEND'
      'SET '
      '    HE_ID = :HE_ID,'
      '    HE_NAME = :HE_NAME,'
      '    HOUSE_ID = :HOUSE_ID,'
      '    HE_PLACE = :HE_PLACE,'
      '    HE_TYPE = :HE_TYPE,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    HE_ID = :OLD_HE_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    HEADEND'
      'WHERE'
      '        HE_ID = :OLD_HE_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO HEADEND('
      '    HE_ID,'
      '    HE_NAME,'
      '    HOUSE_ID,'
      '    HE_PLACE,'
      '    HE_TYPE,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :HE_ID,'
      '    :HE_NAME,'
      '    :HOUSE_ID,'
      '    :HE_PLACE,'
      '    :HE_TYPE,'
      '    :NOTICE'
      ')')
    RefreshSQL.Strings = (
      
        'select he.*, s.street_name|| '#39' '#39'||s.street_short as street_name,' +
        ' h.house_no'
      'from HEADEND he'
      '  inner join house h on (he.house_id = h.house_id)'
      '  inner join street s on (h.street_id = s.street_id)'
      'where(  he.HE_ID = :HE_ID'
      '     ) and (     HE.HE_ID = :OLD_HE_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      
        'select he.HE_ID, he.HE_NAME, s.street_name|| '#39' '#39'||s.street_short' +
        '||'#39' '#39'||h.house_no as adres'
      'from HEADEND he'
      '  inner join house h on (he.house_id = h.house_id)'
      '  inner join street s on (h.street_id = s.street_id)'
      'where he.HE_ID <> :HE_ID'
      'order by he.HE_NAME ')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 449
    Top = 94
  end
  object srcParent: TDataSource
    DataSet = dsParent
    Left = 447
    Top = 146
  end
  object cnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 84
    Top = 248
  end
end
