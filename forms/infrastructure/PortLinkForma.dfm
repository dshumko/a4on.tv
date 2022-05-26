object PortLinkForm: TPortLinkForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1087#1086#1088#1090#1091
  ClientHeight = 361
  ClientWidth = 584
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
    Top = 326
    Width = 584
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
      Width = 428
      Anchors = [akLeft, akRight, akBottom]
      Enabled = False
      ModalResult = 0
      OnClick = OkCancelFrame1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 501
    end
  end
  object pnlSecond: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 326
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dbVertGrid: TDBVertGridEh
      Left = 0
      Top = 0
      Width = 249
      Height = 326
      TabStop = False
      Align = alLeft
      AllowedOperations = []
      AllowedSelections = []
      RowCategories.Active = True
      RowCategories.CategoryProps = <
        item
          Name = 'port'
          DisplayText = #1055#1086#1088#1090' '#1080#1085#1092#1086
          DefaultExpanded = True
        end
        item
          Name = 'eqpmnt'
          DisplayText = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
          DefaultExpanded = True
        end
        item
          Name = 'lines'
          DisplayText = #1051#1080#1085#1080#1103' '#1089#1074#1103#1079#1080
        end
        item
        end>
      PrintService.ColorSchema = pcsFullColorEh
      DataSource = srcPort
      DrawGraphicData = True
      DrawMemoText = True
      EditActions = [geaCopyEh]
      Flat = True
      TabOrder = 0
      LabelColWidth = 81
      Rows = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PORT'
          RowLabel.Caption = #1055#1086#1088#1090
          WordWrap = True
          CategoryName = 'port'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PT_NAME'
          RowLabel.Caption = #1058#1080#1087' '#1087#1086#1088#1090#1072
          WordWrap = True
          CategoryName = 'port'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PS_NAME'
          RowLabel.Caption = #1057#1090#1072#1090#1091#1089
          WordWrap = True
          CategoryName = 'port'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'SPEED'
          RowLabel.Caption = #1057#1082#1086#1088#1086#1089#1090#1100' '#1052#1041'/'#1089
          WordWrap = True
          CategoryName = 'port'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'V_NAME'
          RowLabel.Caption = 'VLAN'
          WordWrap = True
          CategoryName = 'port'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PORT_NOTICE'
          RowLabel.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1087#1086#1088#1090#1072
          WordWrap = True
          CategoryName = 'port'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'EQ_NAME'
          RowLabel.Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
          CategoryName = 'eqpmnt'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'IP'
          WordWrap = True
          CategoryName = 'eqpmnt'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'MAC'
          WordWrap = True
          CategoryName = 'eqpmnt'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'STREET_SHORT'
          RowLabel.Caption = #1087#1088'.'
          WordWrap = True
          CategoryName = 'eqpmnt'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'STREET_NAME'
          RowLabel.Caption = #1059#1083#1080#1094#1072
          WordWrap = True
          CategoryName = 'eqpmnt'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'HOUSE_NO'
          RowLabel.Caption = #1044#1086#1084
          WordWrap = True
          CategoryName = 'eqpmnt'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PLACE'
          RowLabel.Caption = #1052#1077#1089#1090#1086
          WordWrap = True
          CategoryName = 'eqpmnt'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'PORCH_N'
          RowLabel.Caption = #1055'-'#1076
          WordWrap = True
          CategoryName = 'eqpmnt'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'FLOOR_N'
          RowLabel.Caption = #1069'-'#1078
          WordWrap = True
          CategoryName = 'eqpmnt'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'W_NAME'
          RowLabel.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          WordWrap = True
          CategoryName = 'lines'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'WT_NAME'
          RowLabel.Caption = #1058#1080#1087
          WordWrap = True
          CategoryName = 'lines'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'WS_NODE'
          RowLabel.Caption = #1059#1079#1077#1083' '#1080#1079
          WordWrap = True
          CategoryName = 'lines'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'WE_NODE'
          RowLabel.Caption = #1059#1079#1077#1083' '#1074
          WordWrap = True
          CategoryName = 'lines'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'WLABEL'
          RowLabel.Caption = #1084#1077#1090#1082#1072
          WordWrap = True
          CategoryName = 'lines'
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'EQ_NODE'
          RowLabel.Caption = #1059#1079#1077#1083
          CategoryName = 'eqpmnt'
        end>
    end
    object pnlFind: TPanel
      Left = 249
      Top = 0
      Width = 335
      Height = 326
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object pgcFind: TPageControl
        Left = 0
        Top = 0
        Width = 335
        Height = 256
        ActivePage = tsEq
        Align = alClient
        TabOrder = 0
        OnChange = pgcFindChange
        object tsEq: TTabSheet
          Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
          object gbInfo: TGroupBox
            Left = 0
            Top = 70
            Width = 327
            Height = 158
            Align = alClient
            Caption = ' .:: '#1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' ::. '
            TabOrder = 1
            DesignSize = (
              327
              158)
            object Label3: TLabel
              Left = 9
              Top = 74
              Width = 25
              Height = 13
              Hint = #1055#1086#1088#1090' '#1089' '#1076#1088'. '#1089#1090#1086#1088#1086#1085#1099
              Caption = #1055#1086#1088#1090
            end
            object mmoEqpmnt: TMemo
              Left = 2
              Top = 15
              Width = 323
              Height = 50
              TabStop = False
              Align = alTop
              BorderStyle = bsNone
              TabOrder = 0
            end
            object lcbPort: TDBLookupComboboxEh
              Left = 40
              Top = 71
              Width = 283
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
                  Width = 25
                end
                item
                  AutoFitColWidth = False
                  FieldName = 'SPEED'
                  Title.Caption = #1057#1082#1086#1088#1086#1089#1090#1100
                  Width = 25
                end
                item
                  FieldName = 'O_NAME'
                  Title.Caption = #1058#1080#1087
                  Width = 20
                end
                item
                  FieldName = 'NOTICE'
                  Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
                  Width = 40
                end
                item
                  FieldName = 'V_NAME'
                  Title.Caption = #1057#1077#1090#1100
                  Width = 30
                end
                item
                  Alignment = taLeftJustify
                  AutoFitColWidth = False
                  FieldName = 'WHOSE'
                  Title.Caption = #1063#1090#1086
                  Width = 10
                end
                item
                  AutoFitColWidth = False
                  FieldName = 'WHOSE_NAME'
                  Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
                  Width = 40
                end>
              DropDownBox.ListSource = srcEndPort
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
              ListSource = srcEndPort
              ShowHint = True
              Style = csDropDownEh
              TabOrder = 1
              Visible = True
            end
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 327
            Height = 70
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              327
              70)
            object Label2: TLabel
              Left = 0
              Top = 0
              Width = 327
              Height = 13
              Align = alTop
              Caption = '  '#1055#1086#1080#1089#1082' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103' '#1087#1086':'
            end
            object edtEqIP: TDBEditEh
              Left = 9
              Top = 41
              Width = 237
              Height = 21
              Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1076#1091' '#1072#1073#1086#1085#1077#1085#1090#1072
              Anchors = [akLeft, akTop, akRight]
              DynProps = <>
              EditButtons = <>
              EmptyDataInfo.Text = #1080#1083#1080' IP'
              ShowHint = True
              TabOrder = 1
              Visible = True
            end
            object edtEqName: TDBEditEh
              Left = 9
              Top = 17
              Width = 237
              Height = 21
              Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1083#1080#1094#1077#1074#1086#1084#1091
              Anchors = [akLeft, akTop, akRight]
              DynProps = <>
              EditButtons = <>
              EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1102
              ShowHint = True
              TabOrder = 0
              Visible = True
            end
            object btnFndEqpmnt: TButton
              Left = 252
              Top = 16
              Width = 71
              Height = 49
              Hint = #1053#1072#1081#1090#1080' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' (F2)'
              Anchors = [akTop, akRight]
              Caption = #1053#1072#1081#1090#1080
              TabOrder = 2
              OnClick = btnFndEqpmntClick
            end
          end
        end
        object tsCust: TTabSheet
          Caption = #1040#1073#1086#1085#1077#1085#1090
          ImageIndex = 1
          object pnlSearchAbonent: TPanel
            Left = 0
            Top = 0
            Width = 327
            Height = 70
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            DesignSize = (
              327
              70)
            object Label1: TLabel
              Left = 0
              Top = 0
              Width = 327
              Height = 13
              Align = alTop
              Caption = '  '#1055#1086#1080#1089#1082' '#1072#1073#1086#1085#1077#1085#1090#1072' '#1087#1086':'
            end
            object edCode: TDBEditEh
              Left = 9
              Top = 41
              Width = 237
              Height = 21
              Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1076#1091' '#1072#1073#1086#1085#1077#1085#1090#1072
              Anchors = [akLeft, akTop, akRight]
              DynProps = <>
              EditButtons = <>
              EmptyDataInfo.Text = #1080#1083#1080' '#1082#1086#1076#1091' '#1072#1073#1086#1085#1077#1085#1090#1072
              ShowHint = True
              TabOrder = 1
              Visible = True
            end
            object edAccount: TDBEditEh
              Left = 9
              Top = 17
              Width = 237
              Height = 21
              Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1083#1080#1094#1077#1074#1086#1084#1091
              Anchors = [akLeft, akTop, akRight]
              DynProps = <>
              EditButtons = <>
              EmptyDataInfo.Text = #1051#1080#1094#1077#1074#1086#1084#1091
              ShowHint = True
              TabOrder = 0
              Visible = True
            end
            object btnFndCustomer: TButton
              Left = 252
              Top = 17
              Width = 71
              Height = 49
              Hint = #1053#1072#1081#1090#1080' '#1072#1073#1086#1085#1077#1085#1090#1072' (F2)'
              Anchors = [akTop, akRight]
              Caption = #1053#1072#1081#1090#1080
              TabOrder = 2
              OnClick = btnFndCustomerClick
            end
          end
          inline CustomerInfofrm: TCustomerInfoFrm
            Left = 0
            Top = 70
            Width = 327
            Height = 158
            Align = alClient
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            inherited gbInfo: TGroupBox
              Width = 327
              Height = 158
              inherited lblFIO: TLabel
                Width = 323
                Height = 14
                Margins.Bottom = 0
                Font.Height = -12
              end
              inherited lblDebt: TLabel
                Top = 29
                Width = 323
                Height = 14
                Margins.Bottom = 0
                Font.Height = -12
              end
              inherited memAbonent: TMemo
                Top = 43
                Width = 323
                Height = 113
              end
            end
          end
        end
      end
      object pnlLink: TPanel
        Left = 0
        Top = 256
        Width = 335
        Height = 70
        Align = alBottom
        TabOrder = 1
        DesignSize = (
          335
          70)
        object lblWire: TLabel
          Left = 6
          Top = 9
          Width = 31
          Height = 13
          Caption = #1051#1080#1085#1080#1103
        end
        object lblLabel: TLabel
          Left = 6
          Top = 41
          Width = 32
          Height = 13
          Caption = #1052#1077#1090#1082#1072
        end
        object lcbWIRE: TDBLookupComboboxEh
          Left = 44
          Top = 7
          Width = 283
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          DataField = 'WID'
          DataSource = srcPort
          DropDownBox.Columns = <
            item
              FieldName = 'name'
              Title.Caption = #1051#1080#1085#1080#1103' '#1089#1074#1103#1079#1080
              Width = 70
            end
            item
              FieldName = 'NODE_S'
              Title.Caption = #1059#1079#1077#1083' '#1089
              Width = 35
            end
            item
              FieldName = 'NODE_E'
              Title.Caption = #1059#1079#1077#1083' '#1076#1086
              Width = 35
            end
            item
              AutoFitColWidth = False
              FieldName = 'Capacity'
              Title.Caption = #1045#1084#1082#1086#1089#1090#1100
              Width = 20
            end
            item
              AutoFitColWidth = False
              FieldName = 'FREE'
              Title.Caption = #1057#1074#1086#1073#1086#1076#1085#1086
              Width = 20
            end>
          DropDownBox.ListSource = srcWire
          DropDownBox.ListSourceAutoFilter = True
          DropDownBox.ListSourceAutoFilterAllColumns = True
          DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
          DropDownBox.SortLocal = True
          DropDownBox.AutoDrop = True
          DropDownBox.ShowTitles = True
          DropDownBox.Sizable = True
          EmptyDataInfo.Text = #1051#1080#1085#1080#1103' '#1089#1074#1103#1079#1080'/'#1082#1072#1073#1077#1083#1100' '#1085#1072' '#1087#1086#1088#1090#1091' '
          EditButtons = <
            item
              Action = actEditWire
              DefaultAction = False
              Style = ebsEllipsisEh
            end>
          KeyField = 'Wid'
          ListField = 'NAME'
          ListSource = srcWire
          ParentShowHint = False
          ShowHint = True
          Style = csDropDownEh
          TabOrder = 0
          Visible = True
          OnChange = lcbWIREChange
        end
        object cbLABELS: TDBComboBoxEh
          Left = 44
          Top = 38
          Width = 283
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'WLABEL'
          DataSource = srcPort
          DynProps = <>
          EmptyDataInfo.Text = #1052#1077#1090#1082#1072' '#1085#1072' '#1082#1072#1073#1077#1083#1077' ('#1094#1074#1077#1090' '#1087#1091#1095#1082#1072'/'#1078#1080#1083#1099')'
          EditButtons = <>
          ShowHint = True
          TabOrder = 1
          Visible = True
        end
      end
    end
  end
  object dsPort: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE PORT'
      'SET '
      '    CON    = :CON,'
      '    CON_ID = :CON_ID,'
      '    WID    = :WID,'
      '    WLABEL = :WLABEL'
      'WHERE'
      '    PORT = :OLD_PORT'
      '    and EID = :OLD_EID'
      '    ')
    RefreshSQL.Strings = (
      'select'
      '    p.port'
      '  , p.EID'
      '  , p.CON'
      '  , p.CON_ID'
      '  , p.CON_PORT'
      '  , p.Notice PORT_NOTICE '
      '  , p.SPEED '
      '  , p.P_State  '
      '  , e.Name EQ_NAME'
      '  , s.street_short'
      '  , S.Street_Name'
      '  , H.House_No'
      '  , h.Street_ID'
      '  , e.HOUSE_ID'
      '  , e.Floor_N'
      '  , e.Porch_N'
      '  , e.Place'
      '  , e.Ip'
      '  , e.Mac'
      '  , pt.O_Name PT_NAME'
      '  , ps.O_Name PS_NAME'
      '  , v.Name V_NAME'
      '  , w.Name W_NAME'
      '  , wt.O_Type WT_NAME'
      '  , sn.Name WS_NODE'
      '  , en.Name WE_NODE'
      '  , w.Wid'
      '  , w.Point_S'
      '  , w.Point_E'
      '  , p.WLABEL'
      '  , e.Node_Id EQ_NODE_ID'
      '  , eqn.Name EQ_NODE'
      '  , po.EID EID_OUT'
      '  , po.Port PORT_OUT'
      '  from  port p'
      '       inner join equipment e on (p.Eid = e.EID)'
      '       left outer join HOUSE H on (e.House_Id = H.HOUSE_ID)'
      '       left outer join STREET S on (H.STREET_ID = S.STREET_ID)'
      
        '       left outer join objects pt on (p.P_Type = pt.O_Id and pt.' +
        'O_Type = 57)'
      
        '       left outer join objects ps on (p.P_State = ps.O_Id and ps' +
        '.O_Type = 60)'
      '       left outer join vlans v on (v.V_Id = p.Vlan_Id)'
      '       left outer join Wire w on (w.Wid = p.Wid)'
      
        '       left outer join OBJECTS wt on (w.WTYPE = wt.O_ID and wt.O' +
        '_TYPE = 56)'
      '       left outer join NODEs sn on (sn.Node_Id = w.Point_S)'
      '       left outer join NODEs en on (en.Node_Id = w.Point_E)'
      '       left outer join NODEs eqn on (eqn.Node_Id = e.Node_Id)'
      
        '       left outer join port po on (po.Wid = p.Wid and po.Eid <> ' +
        'e.Eid)'
      '  where(  p.Eid = :EID and p.Port = :port'
      '     ) and (     P.PORT = :OLD_PORT'
      '    and P.EID = :OLD_EID'
      '     )'
      '    '
      '')
    SelectSQL.Strings = (
      'select'
      '    p.port'
      '  , p.EID'
      '  , p.CON'
      '  , p.CON_ID'
      '  , p.CON_PORT'
      '  , p.Notice PORT_NOTICE '
      '  , p.SPEED '
      '  , p.P_State  '
      '  , e.Name EQ_NAME'
      '  , s.street_short'
      '  , S.Street_Name'
      '  , H.House_No'
      '  , h.Street_ID'
      '  , e.HOUSE_ID'
      '  , e.Floor_N'
      '  , e.Porch_N'
      '  , e.Place'
      '  , e.Ip'
      '  , e.Mac'
      '  , pt.O_Name PT_NAME'
      '  , ps.O_Name PS_NAME'
      '  , v.Name V_NAME'
      '  , w.Name W_NAME'
      '  , wt.O_Type WT_NAME'
      '  , sn.Name WS_NODE'
      '  , en.Name WE_NODE'
      '  , w.Wid'
      '  , w.Point_S'
      '  , w.Point_E'
      '  , p.WLABEL'
      '  , e.Node_Id EQ_NODE_ID'
      '  , eqn.Name EQ_NODE'
      '  , po.EID EID_OUT'
      '  , po.Port PORT_OUT'
      '  from  port p'
      '       inner join equipment e on (p.Eid = e.EID)'
      '       left outer join HOUSE H on (e.House_Id = H.HOUSE_ID)'
      '       left outer join STREET S on (H.STREET_ID = S.STREET_ID)'
      
        '       left outer join objects pt on (p.P_Type = pt.O_Id and pt.' +
        'O_Type = 57)'
      
        '       left outer join objects ps on (p.P_State = ps.O_Id and ps' +
        '.O_Type = 60)'
      '       left outer join vlans v on (v.V_Id = p.Vlan_Id)'
      '       left outer join Wire w on (w.Wid = p.Wid)'
      
        '       left outer join OBJECTS wt on (w.WTYPE = wt.O_ID and wt.O' +
        '_TYPE = 56)'
      '       left outer join NODEs sn on (sn.Node_Id = w.Point_S)'
      '       left outer join NODEs en on (en.Node_Id = w.Point_E)'
      '       left outer join NODEs eqn on (eqn.Node_Id = e.Node_Id)'
      
        '       left outer join port po on (po.Wid = p.Wid and po.Eid <> ' +
        'e.Eid)'
      '  where p.Eid = :EID and p.Port = :port'
      '')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 138
    Top = 198
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 120
    Top = 134
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
    Left = 179
    Top = 26
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
    Left = 179
    Top = 114
  end
  object srcPort: TDataSource
    DataSet = dsPort
    Left = 88
    Top = 200
  end
  object actlst1: TActionList
    Left = 261
    Top = 190
    object actFind: TAction
      Caption = 'actFind'
      ShortCut = 113
      OnExecute = actFindExecute
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
      OnExecute = actEditWireExecute
    end
  end
  object dsEndPort: TpFIBDataSet
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
      '  , w.Eid'
      '  , w.Name EQ_NAME'
      '  , w.Ip'
      '  , w.Mac'
      '  , w.NODE_ID'
      '  from port p'
      '       inner join equipment w on (w.Eid = p.Eid)'
      
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
    Left = 400
    Top = 184
    oFetchAll = True
  end
  object srcEndPort: TDataSource
    AutoEdit = False
    DataSet = dsEndPort
    Left = 336
    Top = 192
  end
  object dsWire: TpFIBDataSet
    RefreshSQL.Strings = (
      'select'
      '    T.O_NAME CT_NAME'
      '  , t.O_Dimension COLOR'
      '  , C.*'
      '  , m.NAME MAT_NAME'
      '  , s.Node_Id NODE_S_ID'
      '  , s.Name NODE_S'
      '  , e.Node_Id NODE_E_ID'
      '  , e.Name NODE_E'
      '  , ST.O_Name S_TYPE'
      '  , SS.Street_Name || '#39' '#39' || SS.street_short S_STREET'
      '  , SH.House_No S_HOUSE'
      '  , ET.O_Name E_TYPE'
      '  , ES.Street_Name || '#39' '#39' || ES.street_short E_STREET'
      '  , EH.House_No E_HOUSE'
      '  from Wire C'
      
        '       inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O_TYPE = ' +
        '56)'
      ''
      '       inner join NODEs s on (s.Node_Id = c.Point_S)'
      '       inner join HOUSE SH on (SH.HOUSE_ID = S.HOUSE_ID)'
      '       inner join STREET SS on (SS.STREET_ID = SH.STREET_ID)'
      
        '       inner join objects ST on (ST.O_Id = s.Type_Id and ST.O_Ty' +
        'pe = 38)'
      ''
      '       left outer join MATERIALS m on (m.M_Id =  c.M_ID)'
      ''
      '       left outer join NODEs e on (e.Node_Id = c.Point_E)'
      '       left outer join HOUSE EH on (EH.HOUSE_ID = E.HOUSE_ID)'
      
        '       left outer join STREET ES on (ES.STREET_ID = EH.STREET_ID' +
        ')'
      
        '       left outer join objects ET on (ET.O_Id = e.Type_Id and ET' +
        '.O_Type = 38)'
      ''
      ' WHERE '
      '        C.WID = :OLD_WID'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    c.Wid'
      '  , C.Name||'#39' ('#39'||T.O_NAME||'#39')'#39' name'
      '  , s.Name NODE_S'
      '  , e.Name NODE_E'
      '  , t.O_Dimension COLOR'
      '  , c.Capacity  '
      
        '  , (coalesce(c.Capacity, 0) - (select count(*) from port p wher' +
        'e p.Wid = c.Wid)) FREE -- '#1090#1091#1090' '#1085#1091#1078#1085#1086' '#1089#1095#1080#1090#1072#1090#1100
      '  , c.LABELS'
      '  , s.Node_Id NODE_S_ID'
      '  , e.Node_Id NODE_E_ID'
      
        '  , (select list(p.Port||'#39'('#39'||p.Wlabel||'#39')'#39','#39';'#39') from port p whe' +
        're p.Wid = c.Wid and not p.Wlabel is null) WlabelS'
      '  from Wire C'
      
        '       inner join OBJECTS T on (C.WTYPE = T.O_ID and T.O_TYPE = ' +
        '56)'
      '       inner join NODEs s on (s.Node_Id = c.Point_S)'
      '       left outer join NODEs e on (e.Node_Id = c.Point_E)'
      '  where (c.Point_S = :node)'
      '          or (c.Point_E = :node)'
      '  order by c.Name '
      '')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 480
    Top = 200
  end
  object srcWire: TDataSource
    AutoEdit = False
    DataSet = dsWire
    Left = 526
    Top = 218
  end
end
