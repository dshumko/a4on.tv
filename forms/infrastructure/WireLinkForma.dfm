object WireLinkForm: TWireLinkForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1087#1086#1088#1090#1072#1084
  ClientHeight = 202
  ClientWidth = 495
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  OnClose = FormClose
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inline OkCancelFrame: TOkCancelFrame
    Left = 0
    Top = 167
    Width = 495
    Height = 35
    Align = alBottom
    TabOrder = 0
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 67
      Width = 339
      Anchors = [akLeft, akRight, akBottom]
      ModalResult = 0
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 412
    end
  end
  object pnlSecond: TPanel
    Left = 0
    Top = 0
    Width = 495
    Height = 167
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlFind: TPanel
      Left = 0
      Top = 0
      Width = 495
      Height = 167
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        495
        167)
      object Label1: TLabel
        Left = 6
        Top = 78
        Width = 25
        Height = 13
        Hint = #1055#1086#1088#1090' '#1089' '#1076#1088'. '#1089#1090#1086#1088#1086#1085#1099
        Caption = #1055#1086#1088#1090
      end
      object Label2: TLabel
        Left = 6
        Top = 53
        Width = 37
        Height = 13
        Hint = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1102
        Caption = #1053#1072#1095#1072#1083#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 6
        Top = 115
        Width = 56
        Height = 13
        Hint = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1102
        Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 6
        Top = 139
        Width = 25
        Height = 13
        Hint = #1055#1086#1088#1090' '#1089' '#1076#1088'. '#1089#1090#1086#1088#1086#1085#1099
        Caption = #1055#1086#1088#1090
      end
      object lblLabel: TLabel
        Left = 6
        Top = 17
        Width = 32
        Height = 13
        Caption = #1052#1077#1090#1082#1072
      end
      object lcbPortS: TDBLookupComboboxEh
        Left = 67
        Top = 75
        Width = 420
        Height = 21
        Hint = 
          #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1087#1086#1088#1090#1091#13#10#1089#1077#1088#1099#1081' '#1094#1074#1077#1090' - '#1087#1086#1088#1090' '#1079#1072#1085#1103#1090', '#1082#1091#1088#1089#1080#1074' - '#1089#1083#1091#1078#1077#1073#1085#1099#1081' '#1087 +
          #1086#1088#1090', '#1079#1072#1095#1077#1088#1082#1085#1091#1090' - '#1085#1077#1080#1089#1087#1088#1072#1074#1077#1085
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        DropDownBox.Columns = <
          item
            AutoFitColWidth = False
            FieldName = 'PORT'
            Title.Caption = #1055#1086#1088#1090
            Title.Hint = 
              #1089#1077#1088#1099#1081' '#1094#1074#1077#1090' - '#1087#1086#1088#1090' '#1079#1072#1085#1103#1090', '#1082#1091#1088#1089#1080#1074' - '#1089#1083#1091#1078#1077#1073#1085#1099#1081' '#1087#1086#1088#1090', '#1079#1072#1095#1077#1088#1082#1085#1091#1090' - '#1085#1077 +
              #1080#1089#1087#1088#1072#1074#1077#1085
            Title.TitleButton = True
            Width = 25
          end
          item
            AutoFitColWidth = False
            FieldName = 'SPEED'
            Title.Caption = #1057#1082#1086#1088#1086#1089#1090#1100
            Title.TitleButton = True
            Width = 25
          end
          item
            FieldName = 'O_NAME'
            Title.Caption = #1058#1080#1087
            Title.TitleButton = True
            Width = 20
          end
          item
            FieldName = 'NOTICE'
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 40
          end
          item
            FieldName = 'V_NAME'
            Title.Caption = #1057#1077#1090#1100
            Title.TitleButton = True
            Width = 30
          end
          item
            Alignment = taLeftJustify
            AutoFitColWidth = False
            FieldName = 'WHOSE'
            Title.Caption = #1063#1090#1086
            Title.TitleButton = True
            Width = 10
          end
          item
            AutoFitColWidth = False
            FieldName = 'WHOSE_NAME'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 40
          end>
        DropDownBox.ListSource = srcPortS
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterType = lsftContainsEh
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
        DropDownBox.SortLocal = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1055#1086#1088#1090' '#1089' '#1076#1088#1091#1075#1086#1081' '#1089#1090#1086#1088#1086#1085#1099
        EditButtons = <
          item
            Action = actAddPort
            DefaultAction = False
            Style = ebsEllipsisEh
          end>
        KeyField = 'PORT'
        ListField = 'NAME'
        ListSource = srcPortS
        ShowHint = True
        Style = csDropDownEh
        TabOrder = 0
        Visible = True
      end
      object dbleEqpmntS: TDBLookupComboboxEh
        Left = 67
        Top = 50
        Width = 420
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        DropDownBox.Columns = <
          item
            FieldName = 'NAME'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 90
          end
          item
            FieldName = 'STREET_NAME'
            Title.Caption = #1059#1083#1080#1094#1072
            Title.TitleButton = True
            Width = 60
          end
          item
            AutoFitColWidth = False
            FieldName = 'HOUSE_NO'
            Title.Caption = #1044#1086#1084
            Title.TitleButton = True
            Width = 35
          end
          item
            AutoFitColWidth = False
            FieldName = 'PORCH_N'
            Title.Caption = #1055'-'#1076
            Title.TitleButton = True
            Width = 20
          end
          item
            AutoFitColWidth = False
            FieldName = 'FLOOR_N'
            Title.Caption = #1069#1058'.'
            Title.TitleButton = True
            Width = 20
          end
          item
            AutoFitColWidth = False
            FieldName = 'PLACE'
            Title.Caption = #1052#1077#1089#1090#1086
            Title.TitleButton = True
            Width = 20
          end
          item
            AutoFitColWidth = False
            FieldName = 'IP'
            Width = 80
          end
          item
            AutoFitColWidth = False
            FieldName = 'MAC'
            Width = 100
          end>
        DropDownBox.ListSource = srcEqS
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterType = lsftContainsEh
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
        DropDownBox.SortLocal = True
        DropDownBox.AutoDrop = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1091
        EditButtons = <
          item
            ShortCut = 45
            Style = ebsPlusEh
          end
          item
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000232E0000232E00000000000000000001ECECECFAFAFA
              FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFDBDBDB5D5D5DA2A2A2F4F4F4FEFEFEFEFEFEFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8
              3636364C4C4CE7E7E7FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFEFEFEF8F8F85151519898988A8A8AACACACFFFFFFFD
              FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              EDEDED8B8B8B3E3E3E343434B1B1B1FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFB9B9B9393939404040343434B0
              B0B0FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FEFEFEFFFFFFBFBFBF373737404040343434B2B2B2FFFFFFFDFDFDFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFBEBEBE36363640
              4040343434B1B1B1FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFDFDFDFFFFFFC1C1C1373737404040343434AFAFAFFFFFFFFDFD
              FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFC1
              C1C1363636404040343434AFAFAFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFBEBEBE353535404040353535B1B1
              B1FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
              FEFEFFFFFFBFBFBF363636424242343434B2B2B2FFFFFFFDFDFDFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFC1C1C13333334A4A
              4AA7A7A7C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFDFDFDFFFFFFBFBFBFA9A9A9797979323232EEEEEEFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFD7D7
              D73A3A3A848484FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFC9C9C9FAFAFAFFFFFF}
            ShortCut = 113
            Style = ebsGlyphEh
            Visible = False
          end>
        KeyField = 'EID'
        ListField = 'NAME_IP'
        ListSource = srcEqS
        ShowHint = True
        Style = csDropDownEh
        TabOrder = 1
        Visible = True
      end
      object dbleEqpmntE: TDBLookupComboboxEh
        Left = 67
        Top = 112
        Width = 420
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        DropDownBox.Columns = <
          item
            FieldName = 'NAME'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 90
          end
          item
            FieldName = 'STREET_NAME'
            Title.Caption = #1059#1083#1080#1094#1072
            Title.TitleButton = True
            Width = 60
          end
          item
            AutoFitColWidth = False
            FieldName = 'HOUSE_NO'
            Title.Caption = #1044#1086#1084
            Title.TitleButton = True
            Width = 35
          end
          item
            AutoFitColWidth = False
            FieldName = 'PORCH_N'
            Title.Caption = #1055'-'#1076
            Title.TitleButton = True
            Width = 20
          end
          item
            AutoFitColWidth = False
            FieldName = 'FLOOR_N'
            Title.Caption = #1069#1058'.'
            Title.TitleButton = True
            Width = 20
          end
          item
            AutoFitColWidth = False
            FieldName = 'PLACE'
            Title.Caption = #1052#1077#1089#1090#1086
            Title.TitleButton = True
            Width = 20
          end
          item
            AutoFitColWidth = False
            FieldName = 'IP'
            Width = 80
          end
          item
            AutoFitColWidth = False
            FieldName = 'MAC'
            Width = 100
          end>
        DropDownBox.ListSource = srcEqE
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterType = lsftContainsEh
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
        DropDownBox.SortLocal = True
        DropDownBox.AutoDrop = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1091#1089#1090#1088#1086#1081#1089#1090#1074#1091
        EditButtons = <
          item
            ShortCut = 45
            Style = ebsPlusEh
          end
          item
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000232E0000232E00000000000000000001ECECECFAFAFA
              FFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFDBDBDB5D5D5DA2A2A2F4F4F4FEFEFEFEFEFEFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8A8
              3636364C4C4CE7E7E7FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFEFEFEF8F8F85151519898988A8A8AACACACFFFFFFFD
              FDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              EDEDED8B8B8B3E3E3E343434B1B1B1FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFB9B9B9393939404040343434B0
              B0B0FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FEFEFEFFFFFFBFBFBF373737404040343434B2B2B2FFFFFFFDFDFDFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFBEBEBE36363640
              4040343434B1B1B1FFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFDFDFDFFFFFFC1C1C1373737404040343434AFAFAFFFFFFFFDFD
              FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFC1
              C1C1363636404040343434AFAFAFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFBEBEBE353535404040353535B1B1
              B1FFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
              FEFEFFFFFFBFBFBF363636424242343434B2B2B2FFFFFFFDFDFDFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFC1C1C13333334A4A
              4AA7A7A7C6C6C6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFDFDFDFFFFFFBFBFBFA9A9A9797979323232EEEEEEFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFD7D7
              D73A3A3A848484FAFAFAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFC9C9C9FAFAFAFFFFFF}
            ShortCut = 113
            Style = ebsGlyphEh
            Visible = False
          end>
        KeyField = 'EID'
        ListField = 'NAME_IP'
        ListSource = srcEqE
        ShowHint = True
        Style = csDropDownEh
        TabOrder = 2
        Visible = True
      end
      object lcbPortE: TDBLookupComboboxEh
        Left = 67
        Top = 136
        Width = 420
        Height = 21
        Hint = 
          #1055#1086#1076#1082#1083#1102#1095#1077#1085' '#1082' '#1087#1086#1088#1090#1091#13#10#1089#1077#1088#1099#1081' '#1094#1074#1077#1090' - '#1087#1086#1088#1090' '#1079#1072#1085#1103#1090', '#1082#1091#1088#1089#1080#1074' - '#1089#1083#1091#1078#1077#1073#1085#1099#1081' '#1087 +
          #1086#1088#1090', '#1079#1072#1095#1077#1088#1082#1085#1091#1090' - '#1085#1077#1080#1089#1087#1088#1072#1074#1077#1085
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = ''
        DropDownBox.Columns = <
          item
            AutoFitColWidth = False
            FieldName = 'PORT'
            Title.Caption = #1055#1086#1088#1090
            Title.Hint = 
              #1089#1077#1088#1099#1081' '#1094#1074#1077#1090' - '#1087#1086#1088#1090' '#1079#1072#1085#1103#1090', '#1082#1091#1088#1089#1080#1074' - '#1089#1083#1091#1078#1077#1073#1085#1099#1081' '#1087#1086#1088#1090', '#1079#1072#1095#1077#1088#1082#1085#1091#1090' - '#1085#1077 +
              #1080#1089#1087#1088#1072#1074#1077#1085
            Title.TitleButton = True
            Width = 25
          end
          item
            AutoFitColWidth = False
            FieldName = 'SPEED'
            Title.Caption = #1057#1082#1086#1088#1086#1089#1090#1100
            Title.TitleButton = True
            Width = 25
          end
          item
            FieldName = 'O_NAME'
            Title.Caption = #1058#1080#1087
            Title.TitleButton = True
            Width = 20
          end
          item
            FieldName = 'NOTICE'
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 40
          end
          item
            FieldName = 'V_NAME'
            Title.Caption = #1057#1077#1090#1100
            Title.TitleButton = True
            Width = 30
          end
          item
            Alignment = taLeftJustify
            AutoFitColWidth = False
            FieldName = 'WHOSE'
            Title.Caption = #1063#1090#1086
            Title.TitleButton = True
            Width = 10
          end
          item
            AutoFitColWidth = False
            FieldName = 'WHOSE_NAME'
            Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
            Title.TitleButton = True
            Width = 40
          end>
        DropDownBox.ListSource = srcPortE
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterType = lsftContainsEh
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
        DropDownBox.SortLocal = True
        DropDownBox.ShowTitles = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1055#1086#1088#1090' '#1089' '#1076#1088#1091#1075#1086#1081' '#1089#1090#1086#1088#1086#1085#1099
        EditButtons = <
          item
            Action = actAddPort
            DefaultAction = False
            Style = ebsEllipsisEh
          end>
        KeyField = 'PORT'
        ListField = 'NAME'
        ListSource = srcPortE
        ShowHint = True
        Style = csDropDownEh
        TabOrder = 3
        Visible = True
      end
      object cbLABELS: TDBComboBoxEh
        Left = 67
        Top = 14
        Width = 420
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EmptyDataInfo.Text = #1052#1077#1090#1082#1072' '#1085#1072' '#1082#1072#1073#1077#1083#1077' ('#1094#1074#1077#1090' '#1087#1091#1095#1082#1072'/'#1078#1080#1083#1099')'
        EditButtons = <>
        ShowHint = True
        TabOrder = 4
        Visible = True
      end
    end
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 32
    Top = 46
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
    Left = 123
    Top = 74
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
    Left = 131
    Top = 130
  end
  object actlst1: TActionList
    Left = 197
    Top = 62
    object actFind: TAction
      Caption = 'actFind'
      ShortCut = 113
    end
    object actAddPort: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100'/'#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1088#1090'/'#1099
      OnExecute = actAddPortExecute
    end
    object actEditPort: TAction
      Hint = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1087#1086#1088#1090
      OnExecute = actEditPortExecute
    end
    object actEditWire: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100'.'#1080#1079#1084#1077#1085#1080#1090#1100' '#1083#1080#1085#1080#1102' '#1089#1074#1103#1079#1080
    end
  end
  object dsEqS: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      ''
      '    ')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    1 as FINDED'
      '  , E.EID'
      '  , E.NAME'
      '  , E.IP'
      '  , E.VLAN_ID'
      '  , S.STREET_NAME'
      '  , H.HOUSE_NO'
      '  , E.PLACE'
      '  , E.MAC'
      '  , E.PORCH_N'
      '  , E.FLOOR_N'
      '  , E.NAME || coalesce('#39' / '#39' || E.IP, '#39#39') NAME_IP'
      '  , e.Node_Id'
      '  , 0 LVL'
      '  from EQUIPMENT E'
      '       inner join HOUSE H on (H.HOUSE_ID = E.HOUSE_ID)'
      '       inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      '  where E.EQ_TYPE = 1'
      '        and E.Node_Id = :Node_Id'
      'order by 1 desc, 3')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 352
    Top = 56
    oFetchAll = True
  end
  object srcEqS: TDataSource
    DataSet = dsEqS
    Left = 200
    Top = 120
  end
  object dsPortS: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      ''
      '    ')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      'select'
      '    p.Port'
      '  , p.Notice'
      '  , o.O_Name'
      '  , p.Speed'
      '  , p.CON'
      '  , p.P_STATE'
      
        '  , p.Port ||coalesce('#39' / '#39'||p.Speed,  '#39#39')||coalesce('#39' / '#39'||o.O_' +
        'Name,  '#39#39') NAME'
      '  , p.VLAN_ID'
      '  , v.Name V_NAME'
      '  , case p.Con'
      '      when 0 then '#39#1054#39
      '      when 1 then '#39#1040#39
      '      else '#39#39
      '    end whose'
      
        '  , coalesce(c.ACCOUNT_NO, iif( p.Con = 0, e.Name, null)) WHOSE_' +
        'NAME'
      '  , coalesce(c.HIS_COLOR, et.O_DIMENSION) as COLOR'
      '  , p.Con_Id  '
      '  , p.Wid'
      '  , coalesce(p.Wlabel, '#39#39') Wlabel'
      '  from port p'
      
        '       inner join objects o on (p.P_Type = o.O_Id and o.O_Type =' +
        ' 57)'
      '       left outer join VLANS v on (v.V_ID = p.Vlan_Id)'
      
        '       left outer join tv_lan t on (t.Eq_Id = p.Eid and t.Port =' +
        ' p.Port and p.Con = 1)'
      
        '       left outer join CUSTOMER C on (t.customer_id = c.customer' +
        '_id)'
      
        '       left outer join equipment e on (e.Eid = p.Con_Id and p.Co' +
        'n = 0)'
      
        '       left outer join objects et on (e.eq_group = et.o_id and o' +
        '.O_TYPE = 7)'
      '  where(  p.Eid = :EID'
      '     ) and (     P.PORT = :OLD_PORT'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    p.Port'
      '  , p.Notice'
      '  , o.O_Name'
      '  , p.Speed'
      '  , p.CON'
      '  , p.P_STATE'
      
        '  , p.Port ||coalesce('#39' / '#39'||p.Speed,  '#39#39')||coalesce('#39' / '#39'||o.O_' +
        'Name,  '#39#39') NAME'
      '  , p.VLAN_ID'
      '  , v.Name V_NAME'
      '  , case p.Con'
      '      when 0 then '#39#1054#39
      '      when 1 then '#39#1040#39
      '      else '#39#39
      '    end whose'
      
        '  , coalesce(c.ACCOUNT_NO, iif( p.Con = 0, e.Name, null)) WHOSE_' +
        'NAME'
      '  , coalesce(c.HIS_COLOR, et.O_DIMENSION) as COLOR'
      '  , p.Con_Id  '
      '  , p.Wid'
      '  , coalesce(p.Wlabel, '#39#39') Wlabel'
      '  from port p'
      
        '       inner join objects o on (p.P_Type = o.O_Id and o.O_Type =' +
        ' 57)'
      '       left outer join VLANS v on (v.V_ID = p.Vlan_Id)'
      
        '       left outer join tv_lan t on (t.Eq_Id = p.Eid and t.Port =' +
        ' p.Port and p.Con = 1)'
      
        '       left outer join CUSTOMER C on (t.customer_id = c.customer' +
        '_id)'
      
        '       left outer join equipment e on (e.Eid = p.Con_Id and p.Co' +
        'n = 0)'
      
        '       left outer join objects et on (e.eq_group = et.o_id and o' +
        '.O_TYPE = 7)'
      '  where p.Eid = :EID'
      '  order by p.Port  ')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    DataSource = srcEqS
    Left = 408
    Top = 56
    oFetchAll = True
  end
  object srcPortS: TDataSource
    DataSet = dsPortS
    Left = 208
    Top = 104
  end
  object srcPortE: TDataSource
    DataSet = dsPortE
    Left = 248
    Top = 72
  end
  object srcEqE: TDataSource
    DataSet = dsEqE
    Left = 256
    Top = 112
  end
  object dsEqE: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      ''
      '    ')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    1 as FINDED'
      '  , E.EID'
      '  , E.NAME'
      '  , E.IP'
      '  , E.VLAN_ID'
      '  , S.STREET_NAME'
      '  , H.HOUSE_NO'
      '  , E.PLACE'
      '  , E.MAC'
      '  , E.PORCH_N'
      '  , E.FLOOR_N'
      '  , E.NAME || coalesce('#39' / '#39' || E.IP, '#39#39') NAME_IP'
      '  , e.Node_Id'
      '  , 0 LVL'
      '  from EQUIPMENT E'
      '       inner join HOUSE H on (H.HOUSE_ID = E.HOUSE_ID)'
      '       inner join STREET S on (S.STREET_ID = H.STREET_ID)'
      '  where E.EQ_TYPE = 1'
      '        and E.Node_Id = :Node_Id'
      'order by 1 desc, 3')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    Left = 352
    Top = 112
    oFetchAll = True
  end
  object dsPortE: TpFIBDataSet
    UpdateSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      ''
      '    ')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      'select'
      '    p.Port'
      '  , p.Notice'
      '  , o.O_Name'
      '  , p.Speed'
      '  , p.CON'
      '  , p.P_STATE'
      
        '  , p.Port ||coalesce('#39' / '#39'||p.Speed,  '#39#39')||coalesce('#39' / '#39'||o.O_' +
        'Name,  '#39#39') NAME'
      '  , p.VLAN_ID'
      '  , v.Name V_NAME'
      '  , case p.Con'
      '      when 0 then '#39#1054#39
      '      when 1 then '#39#1040#39
      '      else '#39#39
      '    end whose'
      
        '  , coalesce(c.ACCOUNT_NO, iif( p.Con = 0, e.Name, null)) WHOSE_' +
        'NAME'
      '  , coalesce(c.HIS_COLOR, et.O_DIMENSION) as COLOR'
      '  , p.Con_Id  '
      '  , p.Wid'
      '  , coalesce(p.Wlabel, '#39#39') Wlabel'
      '  from port p'
      
        '       inner join objects o on (p.P_Type = o.O_Id and o.O_Type =' +
        ' 57)'
      '       left outer join VLANS v on (v.V_ID = p.Vlan_Id)'
      
        '       left outer join tv_lan t on (t.Eq_Id = p.Eid and t.Port =' +
        ' p.Port and p.Con = 1)'
      
        '       left outer join CUSTOMER C on (t.customer_id = c.customer' +
        '_id)'
      
        '       left outer join equipment e on (e.Eid = p.Con_Id and p.Co' +
        'n = 0)'
      
        '       left outer join objects et on (e.eq_group = et.o_id and o' +
        '.O_TYPE = 7)'
      '  where(  p.Eid = :EID'
      '     ) and (     P.PORT = :OLD_PORT'
      '     )'
      '    '
      '  ')
    SelectSQL.Strings = (
      'select'
      '    p.Port'
      '  , p.Notice'
      '  , o.O_Name'
      '  , p.Speed'
      '  , p.CON'
      '  , p.P_STATE'
      
        '  , p.Port ||coalesce('#39' / '#39'||p.Speed,  '#39#39')||coalesce('#39' / '#39'||o.O_' +
        'Name,  '#39#39') NAME'
      '  , p.VLAN_ID'
      '  , v.Name V_NAME'
      '  , case p.Con'
      '      when 0 then '#39#1054#39
      '      when 1 then '#39#1040#39
      '      else '#39#39
      '    end whose'
      
        '  , coalesce(c.ACCOUNT_NO, iif( p.Con = 0, e.Name, null)) WHOSE_' +
        'NAME'
      '  , coalesce(c.HIS_COLOR, et.O_DIMENSION) as COLOR'
      '  , p.Con_Id  '
      '  , p.Wid'
      '  , coalesce(p.Wlabel, '#39#39') Wlabel'
      '  from port p'
      
        '       inner join objects o on (p.P_Type = o.O_Id and o.O_Type =' +
        ' 57)'
      '       left outer join VLANS v on (v.V_ID = p.Vlan_Id)'
      
        '       left outer join tv_lan t on (t.Eq_Id = p.Eid and t.Port =' +
        ' p.Port and p.Con = 1)'
      
        '       left outer join CUSTOMER C on (t.customer_id = c.customer' +
        '_id)'
      
        '       left outer join equipment e on (e.Eid = p.Con_Id and p.Co' +
        'n = 0)'
      
        '       left outer join objects et on (e.eq_group = et.o_id and o' +
        '.O_TYPE = 7)'
      '  where p.Eid = :EID'
      '  order by p.Port  ')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    DataSource = srcEqE
    Left = 408
    Top = 112
    oFetchAll = True
  end
end
