object PaymentForm: TPaymentForm
  Left = 270
  Top = 220
  ActiveControl = dePaySum
  BorderIcons = [biSystemMenu]
  Caption = #1042#1085#1077#1089#1090#1080' '#1087#1083#1072#1090#1077#1078
  ClientHeight = 490
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
  Scaled = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 369
    Top = 0
    Height = 449
    Align = alRight
  end
  object pnlFine: TPanel
    Left = 372
    Top = 0
    Width = 337
    Height = 449
    Align = alRight
    TabOrder = 1
    TabStop = True
    object dbgFine: TDBGridEh
      Left = 1
      Top = 29
      Width = 335
      Height = 419
      TabStop = False
      Align = alClient
      DataSource = srcFine
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      ReadOnly = True
      SumList.Active = True
      TabOrder = 1
      TitleParams.MultiTitle = True
      OnDblClick = dbgFineDblClick
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1059#1089#1083#1091#1075#1072
          Width = 76
        end
        item
          Alignment = taRightJustify
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DOLG_SUM'
          Footers = <>
          Title.Caption = #1053#1072#1095#1080#1089'.'
          Width = 64
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = 'DD/MM/YY'
          DynProps = <>
          EditButtons = <>
          FieldName = 'DOLG_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Width = 52
        end
        item
          Alignment = taRightJustify
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FINE_DAYS'
          Footers = <>
          Title.Caption = #1055#1077#1085#1103'|'#1044#1085#1077#1081
          Width = 39
        end
        item
          Alignment = taRightJustify
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FINE_SUM'
          Footer.ValueType = fvtSum
          Footers = <>
          Title.Caption = #1055#1077#1085#1103'|'#1057#1091#1084#1084#1072
          Width = 68
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Panel6: TPanel
      Left = 1
      Top = 1
      Width = 335
      Height = 28
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
    end
  end
  object pnlAll: TPanel
    Left = 0
    Top = 0
    Width = 369
    Height = 449
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlCustInfo: TPanel
      Left = 0
      Top = 265
      Width = 369
      Height = 64
      Align = alTop
      TabOrder = 4
      DesignSize = (
        369
        64)
      object Label3: TLabel
        Left = 10
        Top = 14
        Width = 26
        Height = 14
        Caption = #1044#1072#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblPaySum: TLabel
        Left = 170
        Top = 14
        Width = 57
        Height = 14
        Alignment = taRightJustify
        Caption = #1054#1087#1083#1072#1095#1077#1085#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 10
        Top = 41
        Width = 40
        Height = 13
        Caption = #8470' '#1095#1077#1082#1072
      end
      object dePaySum: TDBNumberEditEh
        Tag = 13
        Left = 228
        Top = 8
        Width = 135
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        DataField = 'PAY_SUM'
        DataSource = srcMemPayment
        DisplayFormat = ',0.00'
        DynProps = <>
        EditButton.Visible = True
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Visible = True
      end
      object deDate: TDBDateTimeEditEh
        Tag = 12
        Left = 57
        Top = 8
        Width = 110
        Height = 26
        TabStop = False
        DataField = 'PAY_DATE'
        DataSource = srcMemPayment
        DynProps = <>
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = dtkDateEh
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnExit = deDateExit
      end
      object edtExtNumber: TDBEditEh
        Left = 57
        Top = 38
        Width = 306
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'EXT_PAY_ID'
        DataSource = srcMemPayment
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1074#1086' '#1074#1085#1077#1096#1085#1077#1081' '#1089#1080#1089#1090#1077#1084#1077' ('#1085#1086#1084#1077#1088' '#1095#1077#1082#1072')'
        TabOrder = 2
        Visible = True
      end
    end
    object pnlSRV: TPanel
      Left = 0
      Top = 329
      Width = 369
      Height = 31
      Align = alTop
      TabOrder = 5
      DesignSize = (
        369
        31)
      object lPaymentSrv: TLabel
        Left = 10
        Top = 8
        Width = 35
        Height = 13
        Caption = #1059#1089#1083#1091#1075#1072
      end
      object luPaymentSrv: TDBLookupComboboxEh
        Left = 57
        Top = 6
        Width = 306
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'PAYMENT_SRV'
        DataSource = srcMemPayment
        EditButtons = <>
        KeyField = 'SERVICE_ID'
        ListField = 'NAME'
        ListSource = srcPaymentSRV
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
    end
    object pnlPayDoc: TPanel
      Left = 0
      Top = 135
      Width = 369
      Height = 31
      Align = alTop
      TabOrder = 2
      DesignSize = (
        369
        31)
      object Label6: TLabel
        Left = 10
        Top = 8
        Width = 43
        Height = 13
        Caption = #1055#1083'. '#1076#1086#1082'.'
      end
      object dbluPayDoc: TDBLookupComboboxEh
        Left = 57
        Top = 6
        Width = 306
        Height = 21
        Hint = 
          #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090'.'#13#10#1045#1089#1083#1080' '#1087#1086#1083#1077' '#1085#1077' '#1079#1072#1087#1086#1083#1085#1080#1090#1100', '#1090#1086' '#1089#1086#1079#1076#1072#1089#1090 +
          #1089#1103' '#1085#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1089#1077#1075#1086#1076#1085#1103#1096#1085#1080#1084' '#1095#1080#1089#1083#1086#1084'.'
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'PAY_DOC_ID'
        DataSource = srcMemPayment
        DropDownBox.Columns = <
          item
            FieldName = 'PAY_DOC_NO'
            Width = 40
          end
          item
            FieldName = 'PAYSOURCE_DESCR'
            Width = 60
          end
          item
            AutoFitColWidth = False
            FieldName = 'PAY_DOC_DATE'
            Width = 60
          end>
        DropDownBox.ListSource = srcPaymentDocs
        DropDownBox.ListSourceAutoFilter = True
        DropDownBox.ListSourceAutoFilterAllColumns = True
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EmptyDataInfo.Text = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
        EditButtons = <>
        KeyField = 'PAY_DOC_ID'
        ListField = 'PD_NAME'
        ListSource = srcPaymentDocs
        Style = csDropDownEh
        TabOrder = 0
        Visible = True
      end
    end
    object Panel5: TPanel
      Left = 0
      Top = 391
      Width = 369
      Height = 58
      Align = alClient
      Caption = 'Panel5'
      TabOrder = 7
      object Label9: TLabel
        Left = 1
        Top = 1
        Width = 367
        Height = 13
        Align = alTop
        Caption = ' '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        ExplicitWidth = 64
      end
      object mmoNOTICE: TDBMemoEh
        Left = 1
        Top = 14
        Width = 367
        Height = 43
        Align = alClient
        AutoSize = False
        DataField = 'NOTICE'
        DataSource = srcMemPayment
        DynProps = <>
        EditButtons = <>
        TabOrder = 0
        Visible = True
        WantReturns = True
      end
    end
    object pnlPayType: TPanel
      Left = 0
      Top = 360
      Width = 369
      Height = 31
      Align = alTop
      TabOrder = 6
      DesignSize = (
        369
        31)
      object lPaymentType: TLabel
        Left = 10
        Top = 8
        Width = 38
        Height = 13
        Caption = #1042#1080#1076' '#1087#1083'.'
      end
      object luPaymentType: TDBLookupComboboxEh
        Left = 57
        Top = 5
        Width = 306
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'PAYMENT_TYPE'
        DataSource = srcMemPayment
        EmptyDataInfo.Text = #1042#1080#1076' '#1087#1083#1072#1090#1077#1078#1072
        EditButtons = <>
        KeyField = 'O_ID'
        ListField = 'O_NAME'
        ListSource = srcPaymentType
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
    end
    object pnlFineSum: TPanel
      Left = 0
      Top = 166
      Width = 369
      Height = 99
      Align = alTop
      TabOrder = 3
      DesignSize = (
        369
        99)
      object Label19: TLabel
        Left = 10
        Top = 70
        Width = 182
        Height = 18
        Caption = #1050' '#1086#1087#1083#1072#1090#1077' ('#1044#1086#1083#1075' + '#1087#1077#1085#1103')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 10
        Top = 13
        Width = 29
        Height = 14
        Alignment = taRightJustify
        Caption = #1055#1077#1085#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 10
        Top = 44
        Width = 82
        Height = 14
        Caption = #1057#1091#1084#1084#1072' '#1085#1072' '#1089#1095#1077#1090
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbtxtOnDebt: TDBText
        Left = 228
        Top = 43
        Width = 116
        Height = 17
        Alignment = taRightJustify
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OnDebt'
        DataSource = srcMemPayment
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edTOTALPAY: TDBNumberEditEh
        Tag = 13
        Left = 228
        Top = 67
        Width = 135
        Height = 26
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        Color = clBtnFace
        DataField = 'dsItogo'
        DataSource = srcMemPayment
        DisplayFormat = ',0.00'
        DynProps = <>
        EditButton.Visible = True
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
        Visible = True
      end
      object edFine: TDBNumberEditEh
        Tag = 13
        Left = 228
        Top = 7
        Width = 135
        Height = 26
        TabStop = False
        Anchors = [akLeft, akTop, akRight]
        DataField = 'FINE_SUM'
        DataSource = srcMemPayment
        DisplayFormat = ',0.00'
        DynProps = <>
        EditButton.Visible = True
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Visible = True
        OnChange = edFineChange
      end
      object btnCalcFine: TButton
        Left = 57
        Top = 7
        Width = 163
        Height = 26
        Hint = 
          #1055#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1087#1077#1085#1080#13#10#1045#1089#1083#1080' '#1042#1099' '#1080#1079#1084#1077#1085#1080#1083#1080' '#1076#1072#1090#1091' '#1087#1083#1090#1072#1090#1077#1078#1072', '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1074#1099#1087#1086 +
          #1083#1085#1080#1090#1100' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1087#1077#1085#1080
        Caption = #1056#1072#1089#1095#1077#1090' '#1087#1077#1085#1080
        TabOrder = 0
        TabStop = False
        OnClick = btnCalcFineClick
      end
    end
    object pnlSettings: TPanel
      Left = 0
      Top = 0
      Width = 369
      Height = 41
      Align = alTop
      TabOrder = 0
      object cbScanerInput: TCheckBox
        Left = 10
        Top = 3
        Width = 180
        Height = 17
        TabStop = False
        Action = actShtrih
        TabOrder = 0
      end
      object cbManyPayments: TCheckBox
        Left = 10
        Top = 21
        Width = 171
        Height = 17
        TabStop = False
        Action = actManyPayment
        TabOrder = 1
      end
      object cbRefreshPD: TCheckBox
        Left = 191
        Top = 21
        Width = 172
        Height = 17
        TabStop = False
        Action = actShowPD
        TabOrder = 2
      end
    end
    object pnlAbonent: TPanel
      Left = 0
      Top = 41
      Width = 369
      Height = 94
      Align = alTop
      TabOrder = 1
      object pnlSearchAbonent: TPanel
        Left = 1
        Top = 1
        Width = 167
        Height = 92
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 0
          Top = 0
          Width = 167
          Height = 13
          Align = alTop
          Caption = '  '#1055#1086#1080#1089#1082' '#1072#1073#1086#1085#1077#1085#1090#1072' '#1087#1086':'
          ExplicitWidth = 106
        end
        object edCode: TDBEditEh
          Left = 9
          Top = 41
          Width = 157
          Height = 21
          Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1082#1086#1076#1091' '#1072#1073#1086#1085#1077#1085#1090#1072
          TabStop = False
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1080#1083#1080' '#1082#1086#1076#1091' '#1072#1073#1086#1085#1077#1085#1090#1072
          TabOrder = 1
          Visible = True
          OnChange = edCodeChange
          OnEnter = edCodeEnter
        end
        object edLicevoy: TDBEditEh
          Left = 9
          Top = 17
          Width = 157
          Height = 21
          Hint = #1055#1086#1080#1089#1082' '#1087#1086' '#1083#1080#1094#1077#1074#1086#1084#1091
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1051#1080#1094#1077#1074#1086#1084#1091
          TabOrder = 0
          Visible = True
          OnChange = edLicevoyChange
          OnEnter = edLicevoyEnter
        end
        object edScaner: TDBEditEh
          Left = 9
          Top = 66
          Width = 157
          Height = 21
          Hint = #1064#1090#1088#1080#1093#1082#1086#1076
          TabStop = False
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1064#1090#1088#1080#1093#1082#1086#1076
          TabOrder = 2
          Visible = True
          OnChange = edScanerChange
          OnKeyUp = edScanerKeyUp
        end
      end
      inline CustomerInfofrm: TCustomerInfoFrm
        Left = 168
        Top = 1
        Width = 200
        Height = 92
        Align = alClient
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ExplicitLeft = 168
        ExplicitTop = 1
        ExplicitWidth = 200
        ExplicitHeight = 92
        inherited gbInfo: TGroupBox
          Width = 200
          Height = 92
          ExplicitWidth = 200
          ExplicitHeight = 92
          inherited memAbonent: TMemo
            Top = 43
            Width = 196
            Height = 47
            ExplicitTop = 43
            ExplicitWidth = 196
            ExplicitHeight = 47
          end
          inherited lblFIO: TDBEditEh
            Width = 196
            Height = 14
            ExplicitWidth = 196
            ExplicitHeight = 14
          end
          inherited lblDebt: TDBEditEh
            Top = 29
            Width = 196
            Height = 14
            Margins.Bottom = 0
            ControlLabel.ExplicitTop = 13
            Font.Height = -12
            ExplicitTop = 29
            ExplicitWidth = 196
            ExplicitHeight = 14
          end
        end
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 449
    Width = 709
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object pnl1: TPanel
      Left = 0
      Top = 0
      Width = 709
      Height = 41
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        709
        41)
      object bbCancel: TBitBtn
        Left = 607
        Top = 4
        Width = 99
        Height = 35
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = #1054#1090#1084#1077#1085#1072
        ModalResult = 2
        TabOrder = 2
      end
      object bbOk: TBitBtn
        Left = 160
        Top = 4
        Width = 443
        Height = 35
        Action = actAdd
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        ModalResult = 1
        NumGlyphs = 2
        TabOrder = 0
      end
      object bbPrint: TBitBtn
        Left = 1
        Top = 4
        Width = 155
        Height = 35
        Action = actPrint
        Anchors = [akLeft, akBottom]
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080' '#1088#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100
        ModalResult = 1
        NumGlyphs = 2
        PopupMenu = PopupMenu1
        TabOrder = 1
      end
    end
  end
  object dsPaymentSRV: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    s.service_id'
      '  , s.name'
      '  , s.description'
      '  from services s'
      '  where exists(select'
      '                   sl.Child'
      '                 from Services_Links sl'
      '                 where sl.Child = s.Service_Id'
      '                       and sl.Parent is null)'
      '          or exists(select'
      '                        w.As_Service'
      '                      from WORKS w'
      '                      where w.As_Service = s.Service_Id)'
      '          or exists(select'
      '                        s.Service_Id'
      '                      from objects o'
      '                      where o.o_type = 22'
      '                            and not o.O_Charfield is null'
      
        '                            and Get_Json_Value(o.O_Charfield, '#39'S' +
        'nglSrv'#39') = s.Service_Id)'
      '  order by name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 480
    Top = 192
    oStartTransaction = False
    oFetchAll = True
  end
  object srcPaymentSRV: TDataSource
    AutoEdit = False
    DataSet = dsPaymentSRV
    Left = 480
    Top = 248
  end
  object dsPaymentType: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT O_ID, O_NAME, O_DESCRIPTION'
      'FROM OBJECTS o'
      'where o.O_DELETED = 0'
      'and o.O_TYPE = 2')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 624
    Top = 88
    oStartTransaction = False
    oFetchAll = True
  end
  object srcPaymentType: TDataSource
    AutoEdit = False
    DataSet = dsPaymentType
    Left = 624
    Top = 136
  end
  object dsPaymentDocs: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    a.*'
      
        '    , PAY_DOC_NO||'#39' ('#39'||paysource_descr||'#39') '#39'||'#39' '#39'||extract(day ' +
        'from PAY_DOC_DATE)||'#39'.'#39'||extract(month from PAY_DOC_DATE)||'#39'.'#39'||' +
        'extract(year from PAY_DOC_DATE) as PD_NAME'
      '  from (select'
      '            D.PAY_DOC_ID'
      '          , D.PAYSOURCE_ID'
      '          , D.PAY_DOC_NO'
      '          , D.PAY_DOC_DATE'
      '          , D.PAY_DOC_SUM'
      '          , D.NOTICE'
      '          , ps.paysource_descr'
      '          , CURRENT_DATE CD'
      '          , d.Added_By'
      '          from PAY_DOC D'
      
        '               left outer join PAYSOURCE PS on (D.PAYSOURCE_ID =' +
        ' PS.PAYSOURCE_ID)'
      
        '          where d.PAY_DOC_DATE between CURRENT_DATE and dateadd(' +
        'DAY,1, CURRENT_DATE)'
      '            and @OWN_PD%1=1'
      '        union'
      '        select'
      '            D.PAY_DOC_ID'
      '          , D.PAYSOURCE_ID'
      '          , D.PAY_DOC_NO'
      '          , D.PAY_DOC_DATE'
      '          , D.PAY_DOC_SUM'
      '          , D.NOTICE'
      '          , ps.paysource_descr'
      '          , CURRENT_DATE CD '
      '          , d.Added_By         '
      '          from PAY_DOC D'
      
        '               left outer join PAYSOURCE PS on (D.PAYSOURCE_ID =' +
        ' PS.PAYSOURCE_ID)'
      '          where @filter%1=0 and @OWN_PD%1=1'
      '            and d.Pay_Doc_Date = current_DATE'
      '            ) a'
      '  order by iif(Added_By = current_user, 0, 1), -- '#1089#1085#1072#1095#1072#1083#1072' '#1089#1074#1086#1080' '
      '           PAY_DOC_DATE, PAY_DOC_NO'
      '')
    AutoUpdateOptions.UpdateTableName = 'PAY_DOC'
    AutoUpdateOptions.KeyFields = 'PAY_DOC_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AllowedUpdateKinds = [ukInsert]
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DefaultFormats.NumericDisplayFormat = '#'
    Left = 624
    Top = 184
    poImportDefaultValues = False
    oRefreshAfterPost = False
    oRefreshDeletedRecord = True
  end
  object srcPaymentDocs: TDataSource
    AutoEdit = False
    DataSet = dsPaymentDocs
    Left = 624
    Top = 232
  end
  object dsFine: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    s.name'
      '  , c.dolg_sum'
      '  , c.dolg_date'
      '  , c.fine_days'
      '  , c.fine_sum'
      '  from calculate_fine(:pCustomer, :pDate) c'
      '       inner join services s on (c.service_id = s.service_id)'
      '  order by c.dolg_date  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 481
    Top = 94
  end
  object srcFine: TDataSource
    DataSet = dsFine
    Left = 480
    Top = 144
  end
  object srcMemPayment: TDataSource
    DataSet = dsMemPayment
    Left = 625
    Top = 337
  end
  object qInsertPayment: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      
        'insert into payment (payment_id, pay_doc_id, customer_id, pay_da' +
        'te, pay_sum, fine_sum, payment_type, notice, payment_srv, ext_pa' +
        'y_id, PAY_TYPE_STR, FISCAL)'
      
        'values (:payment_id, :pay_doc_id, :customer_id, :pay_date, :pay_' +
        'sum, :fine_sum, :payment_type, :notice, :payment_srv, :EXT_PAY_I' +
        'D, :PAY_TYPE_STR, :FISCAL)'
      'returning payment_id')
    Left = 481
    Top = 300
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    Top = 80
    object N1: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1074#1080#1090#1072#1085#1094#1080#1102
      OnClick = N1Click
    end
  end
  object ActionList1: TActionList
    Left = 304
    Top = 72
    object actManyPayment: TAction
      Caption = #1042#1074#1086#1076' '#1085#1077#1089#1082#1086#1083#1100#1082#1080#1093' '#1087#1083#1072#1090#1077#1078#1077#1081
      Hint = 
        #1055#1086#1079#1074#1086#1083#1103#1077#1090' '#1074#1074#1077#1089#1090#1080' '#1085#1077#1089#1082#1086#1083#1100#1082#1086' '#1087#1083#1072#1090#1077#1078#1077#1081' '#1085#1077' '#1079#1072#1082#1088#1099#1074#1072#1103' '#1086#1082#1085#1086' '#1087#1088#1080#1077#1084#1072' '#1087#1083#1072#1090 +
        #1077#1078#1072' (F6)'
      ShortCut = 117
      OnExecute = actManyPaymentExecute
    end
    object actShowPD: TAction
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1083#1072#1090#1077#1078#1080' '#1074' '#1055#1044
      Hint = 
        #1055#1088#1080' '#1091#1089#1090#1072#1085#1086#1074#1083#1077#1085#1085#1086#1084' '#1092#1083#1072#1075#1077'. '#1086#1090#1086#1073#1088#1072#1078#1072#1077#1090' '#1087#1083#1072#1090#1077#1078#1080' '#1089#1088#1072#1079#1091' '#1074' '#1087#1083#1072#1090'. '#1076#1086#1082#1091#1084#1077 +
        #1085#1090#1077', '#1072' '#1085#1077' '#1087#1086' '#1079#1072#1082#1088#1099#1090#1080#1102' '#1092#1086#1088#1084#1099'.'#13#10#1042#1085#1080#1084#1072#1085#1080#1077'. '#1052#1086#1078#1077#1090' '#1079#1072#1084#1077#1076#1083#1080#1090#1100' '#1074#1074#1086#1076' '#1087#1083#1072 +
        #1090#1077#1078#1077#1081'!'
      OnExecute = actShowPDExecute
    end
    object actShtrih: TAction
      Caption = #1042#1074#1086#1076' '#1089#1086' '#1089#1082#1072#1085#1077#1088#1072' '#1096#1090#1088#1080#1093#1082#1086#1076#1072
      Hint = #1040#1082#1090#1080#1074#1080#1088#1091#1077#1090' '#1087#1086#1083#1077' '#1074#1074#1086#1076#1072' '#1096#1090#1088#1080#1093#1082#1086#1076#1072' (F5)'
      ShortCut = 116
      OnExecute = actShtrihExecute
    end
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1090#1077#1078' (Ctrl+Enter)'
      OnExecute = actAddExecute
    end
    object actPrint: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080' '#1088#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1080' '#1088#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' (Alt+Enter)'
      ShortCut = 32781
      OnExecute = actPrintExecute
    end
  end
  object dsMemPayment: TMemTableEh
    Params = <>
    OnCalcFields = dsMemPaymentCalcFields
    OnNewRecord = dsMemPaymentNewRecord
    Left = 626
    Top = 288
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object CUSTOMER_ID: TMTNumericDataFieldEh
          FieldName = 'CUSTOMER_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'CUSTOMER_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object PAYMENT_ID: TMTNumericDataFieldEh
          FieldName = 'PAYMENT_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'PAYMENT_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object PAY_DOC_ID: TMTNumericDataFieldEh
          FieldName = 'PAY_DOC_ID'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'PAY_DOC_ID'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object PAY_DATE: TMTDateTimeDataFieldEh
          FieldName = 'PAY_DATE'
          DateTimeDataType = fdtDateEh
          DisplayLabel = 'PAY_DATE'
          DisplayWidth = 10
        end
        object PAY_SUM: TMTNumericDataFieldEh
          FieldName = 'PAY_SUM'
          NumericDataType = fdtBCDEh
          AutoIncrement = False
          DisplayLabel = 'PAY_SUM'
          DisplayWidth = 10
          currency = False
          Precision = 0
          Scale = 2
        end
        object FINE_SUM: TMTNumericDataFieldEh
          FieldName = 'FINE_SUM'
          NumericDataType = fdtBCDEh
          AutoIncrement = False
          DisplayLabel = 'FINE_SUM'
          DisplayWidth = 10
          currency = False
          Precision = 0
          Scale = 2
        end
        object NOTICE: TMTStringDataFieldEh
          FieldName = 'NOTICE'
          StringDataType = fdtStringEh
          DisplayLabel = 'NOTICE'
          DisplayWidth = 255
          Size = 255
          Transliterate = True
        end
        object O_NAME: TMTStringDataFieldEh
          FieldName = 'O_NAME'
          StringDataType = fdtStringEh
          DisplayLabel = 'O_NAME'
          DisplayWidth = 50
          Size = 50
          Transliterate = True
        end
        object CUST_CODE: TMTStringDataFieldEh
          FieldName = 'CUST_CODE'
          StringDataType = fdtStringEh
          DisplayLabel = 'CUST_CODE'
          DisplayWidth = 20
          Transliterate = True
        end
        object ACCOUNT_NO: TMTStringDataFieldEh
          FieldName = 'ACCOUNT_NO'
          StringDataType = fdtStringEh
          DisplayLabel = 'ACCOUNT_NO'
          DisplayWidth = 15
          Size = 15
          Transliterate = True
        end
        object FIO: TMTStringDataFieldEh
          FieldName = 'FIO'
          StringDataType = fdtStringEh
          DisplayLabel = 'FIO'
          DisplayWidth = 100
          Size = 100
          Transliterate = True
        end
        object DEBT_SUM: TMTNumericDataFieldEh
          FieldName = 'DEBT_SUM'
          NumericDataType = fdtBCDEh
          AutoIncrement = False
          DisplayLabel = 'DEBT_SUM'
          DisplayWidth = 10
          currency = False
          Precision = 0
          Scale = 2
        end
        object CUST_STATE_DESCR: TMTStringDataFieldEh
          FieldName = 'CUST_STATE_DESCR'
          StringDataType = fdtStringEh
          DisplayLabel = 'CUST_STATE_DESCR'
          DisplayWidth = 500
          Size = 500
          Transliterate = True
        end
        object adres: TMTStringDataFieldEh
          FieldName = 'adres'
          StringDataType = fdtStringEh
          DisplayLabel = 'adres'
          DisplayWidth = 250
          Size = 250
          Transliterate = True
        end
        object PAYMENT_TYPE: TMTNumericDataFieldEh
          FieldName = 'PAYMENT_TYPE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'PAYMENT_TYPE'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object PAYMENT_SRV: TMTNumericDataFieldEh
          FieldName = 'PAYMENT_SRV'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          DisplayLabel = 'PAYMENT_SRV'
          DisplayWidth = 10
          currency = False
          Precision = 15
        end
        object SRV_NAME: TMTStringDataFieldEh
          FieldName = 'SRV_NAME'
          StringDataType = fdtStringEh
          DisplayLabel = 'SRV_NAME'
          DisplayWidth = 60
          Size = 60
          Transliterate = True
        end
        object dsItogo: TMTNumericDataFieldEh
          FieldName = 'dsItogo'
          NumericDataType = fdtCurrencyEh
          AutoIncrement = False
          DisplayLabel = 'dsItogo'
          DisplayWidth = 10
          currency = True
          Precision = 15
        end
        object EXT_PAY_ID: TMTStringDataFieldEh
          FieldName = 'EXT_PAY_ID'
          StringDataType = fdtStringEh
          DisplayWidth = 50
          Size = 50
        end
        object PAY_TYPE_STR: TMTStringDataFieldEh
          FieldName = 'PAY_TYPE_STR'
          StringDataType = fdtStringEh
          DisplayWidth = 30
          Size = 30
        end
        object OnDebt: TMTNumericDataFieldEh
          FieldName = 'OnDebt'
          Calculated = True
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
  object PropStorageEh: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.Top'
      '<P>.Width'
      'pnlFine.<P>.Width')
    Left = 482
    Top = 352
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 400
    Top = 104
  end
end
