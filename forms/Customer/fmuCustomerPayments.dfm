object apgCustomerPayments: TapgCustomerPayments
  Left = 0
  Top = 0
  Caption = #1055#1083#1072#1090#1077#1078#1080
  ClientHeight = 168
  ClientWidth = 795
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object dbgCustPayment: TDBGridEh
    Left = 26
    Top = 0
    Width = 769
    Height = 168
    Align = alClient
    AllowedOperations = []
    DataSource = srcPayment
    DynProps = <>
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    PopupMenu = pmPayment
    ReadOnly = True
    SearchPanel.Enabled = True
    STFilter.Local = True
    STFilter.Visible = True
    SumList.Active = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    TitleParams.VTitleMargin = 4
    OnDblClick = dbgCustPaymentDblClick
    OnGetCellParams = dbgCustPaymentGetCellParams
    OnSortMarkingChanged = dbgCustPaymentSortMarkingChanged
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PAY_DATE'
        Footer.FieldName = 'PT'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1087#1083#1072#1090#1077#1078#1072
        Title.TitleButton = True
        Width = 96
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'VIEW_SUM'
        Footer.FieldName = 'PAY_SUM'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1057#1091#1084#1084#1072' '#1085#1072' '#1089#1095#1077#1090
        Title.TitleButton = True
        Width = 90
      end
      item
        Alignment = taRightJustify
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FINE_SUM'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1055#1077#1085#1103
        Title.TitleButton = True
        Width = 80
      end
      item
        CellButtons = <>
        DisplayFormat = ',0.00'
        DynProps = <>
        EditButtons = <>
        FieldName = 'PAID'
        Footer.DisplayFormat = ',0.00'
        Footer.ValueType = fvtSum
        Footers = <>
        Title.Caption = #1042#1085#1077#1089#1077#1085#1086
        Title.TitleButton = True
        Width = 71
      end
      item
        Alignment = taRightJustify
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PAY_DOC_NO'
        Footers = <>
        Title.Caption = #1055#1083#1072#1090'. '#1076#1086#1082#1091#1084#1077#1085#1090
        Title.TitleButton = True
        Width = 120
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PAY_DOC_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Title.TitleButton = True
        Width = 88
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PAYSOURCE_DESCR'
        Footers = <>
        Title.Caption = #1052#1077#1089#1090#1086' '#1087#1083#1072#1090#1077#1078#1072
        Title.TitleButton = True
        Width = 99
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1059#1089#1083#1091#1075#1072
        Title.TitleButton = True
        Width = 80
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 100
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EXT_PAY_ID'
        Footers = <>
        Title.Caption = #8470' '#1087#1083'. '#1089#1080#1089'.'
        Title.TitleButton = True
        Width = 72
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PAYMENT_ID'
        Footers = <>
        Title.Caption = #8470' '#1087#1083#1072#1090#1077#1078#1072
        Title.TitleButton = True
        Width = 72
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WHO_ADD'
        Footers = <>
        Title.Caption = #1055#1083#1072#1090#1077#1078' '#1087#1088#1080#1085#1103#1083
        Title.TitleButton = True
        Width = 82
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DEBT_SAVE'
        Footers = <>
        Title.Caption = #1057#1072#1083#1100#1076#1086' '#1076#1086
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'BAL_SAVE'
        Footers = <>
        Title.Caption = #1041#1072#1083#1072#1085#1089' '#1076#1086
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RQ_ID'
        Footers = <>
        ReadOnly = False
        Title.Caption = #1047#1072#1103#1074#1082#1072
        Title.TitleButton = True
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 168
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      26
      168)
    object btnDel: TSpeedButton
      Left = 2
      Top = 145
      Width = 22
      Height = 22
      Anchors = [akLeft, akBottom]
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A00174AFD00103BF40000009A00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A00002CF8000031FE0000009A00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A001A47F8001A4CFF00103BF40000009A00FF00FF00FF00FF000000
        9A00002CF6000031FE00002CF60000009A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A001C47F6001A4CFF00103BF40000009A0000009A00002C
        F8000031FE00002CF60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000009A001D48F6001D50FF00103DFB000031FE000031
        FE00002CF60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000009A001A4CFF001342FF00103DFB000733
        F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000009A00214CF8001A4CFF001A47F8001342
        FF0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000009A002E5BF9002E5BF900214CF800214CF8001D50
        FF001D48F60000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A003664FA00386BFF002E5BF90000009A0000009A002550
        F4001D50FF002550F40000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A004071FA004071FA00325DF10000009A00FF00FF00FF00FF000000
        9A002550F4002659FF00214CF80000009A00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A00497AFC003B66F30000009A00FF00FF00FF00FF00FF00FF00FF00
        FF0000009A002550F4001D50FF0000009A00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000009A0000009A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Layout = blGlyphTop
      Visible = False
      OnClick = btnDelClick
    end
    object btnAdd1: TSpeedButton
      Left = 2
      Top = 3
      Width = 22
      Height = 22
      Action = ActAddPayment
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008BAE
        5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
        560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008BAE
        5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
        560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008BAE
        5A0089AD560089AD560089AD560089AD560089AD560089AD560089AD560089AD
        560089AD560089AD560089AD560089AD560089AD5600FF00FF00FF00FF008DAF
        5D008BAE59008BAE59008BAE59008BAE590089AD560089AD560089AD560089AD
        56008BAE59008BAE59008BAE59008BAE59008BAE5900FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0089AD560089AD560089AD560089AD
        5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF008FB160008FB160008FB160008FB1
        6000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object btnEdit1: TSpeedButton
      Left = 2
      Top = 31
      Width = 22
      Height = 22
      Action = actPrepay
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00DDDDDD007171
        7100535353005050500069696900CDCDCD00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00969696004E4E4E00A5A5
        A500E2E2E200E6E6E600B1B1B100525252007F7F7F00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00E2E2E2004D4D4D00E1E1E100FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00F5F5F50052525200CCCCCC00FF00FF00FF00
        FF00C5E1F2008FCBF2006AB7EA00FF00FF00767676009A9A9A00FFFFFF00FFFF
        FF00FDFDFD00FCFBF800FFFFFF00FFFFFF00B8B9BA0068686800DDECF50058B0
        E80055AFE70051ADE7005FB3E600FF00FF005B5B5B00D0D0D000FFFFFF00FFFF
        FF009D520B009D520B009D520B00D1BEAB00D1BEAB004F50530056B1EA0051AD
        E60090CBEF00C4E3F600D5E9F600FF00FF005F5F5F00CECECE00FFFFFF00FFFF
        FF009D520B00E7D6C500F2E9E000F2E9E000E9EAEB004F4F4F0087C7F000CAE5
        F6008AC8EE0059B0E8004FADE600FF00FF007A7A7A0090909000FFFFFF00FFFF
        FF009D520B00F2E9E000FFFFFF00FFFFFF00ADADAD006C6C6C0087C7F0004EAB
        E60055AFE70058B0E70059B1E800B3DAF300FF00FF004D4D4D00D2D2D200FFFF
        FF00D1BEAB00F2E9E000FFFFFF00E9E9E9004F4F4F00D8D8D800CAE2F30058B1
        E80059B1E80059B1E80059B1E80069B7E800FF00FF00A3A3A3004D4D4D009090
        9100D4D4D400D4D4D4009D9D9D004F4F4F0090909000FF00FF00FF00FF00FF00
        FF00ABD7F30094CCEE00FF00FF00C4E4F800A5D5F400FF00FF00FF00FF007979
        79005A5A5A005656560072727200DDDDDD00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00DCEEFA0058B0E80055AFE70051ADE7005CB2E600B0D9F200FF00
        FF00FF00FF00FF00FF00FF00FF00BFE0F500DDEEF900FF00FF00FF00FF00FF00
        FF00FF00FF0056B1EA0051ADE60090CBEF00C4E3F600D4EAF800D7EBF800D8EB
        FA00DEEFF900C9E4F4008EC8ED0051ABE60055AFE700FF00FF00FF00FF00FF00
        FF00FF00FF0087C7F000CAE5F6008AC8EE0059B0E8004FADE6004FADE6004FAD
        E6004DABE60066B6E9009CCFF000DEEFFA0082C3ED00FF00FF00FF00FF00FF00
        FF00FF00FF0087C7F0004EABE60055AFE70058B0E70059B1E80059B1E80059B1
        E80059B1E80057B0E70054AEE7004BAAE6009DD1F100FF00FF00FF00FF00FF00
        FF00FF00FF00C9E4F60058B1E80059B1E80059B1E80059B1E80059B1E80059B1
        E80059B1E80059B1E80059B1E80058B0E800C3E1F400FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00AAD7F30077BEE90059B1E80059B1E80059B1
        E80059B1E80075BDEA00A8D6F200FF00FF00FF00FF00FF00FF00}
    end
    object btnCheck: TSpeedButton
      Left = 2
      Top = 70
      Width = 22
      Height = 22
      Action = actCheckUrl
      Flat = True
    end
  end
  object dsPayment: TpFIBDataSet
    UpdateSQL.Strings = (
      'update payment set Rq_Id = :Rq_Id where Payment_Id = :PAYMENT_ID')
    SelectSQL.Strings = (
      'select'
      '*'
      'from ('
      'select'
      '    P.PAY_DOC_ID'
      '  , P.PAYMENT_ID'
      '  , P.PAY_DATE'
      '  , P.PAY_SUM'
      '  , P.PAY_SUM VIEW_SUM  '
      '  , D.PAY_DOC_NO'
      '  , P.EXT_PAY_ID'
      '  , D.PAY_DOC_DATE'
      '  , PS.PAYSOURCE_DESCR'
      '  , P.CUSTOMER_ID'
      '  , P.NOTICE'
      '  , P.FINE_SUM'
      '  , (coalesce(p.Pay_Sum, 0) + coalesce(p.Fine_Sum, 0)) PAID'
      '  , coalesce(W.SURNAME, p.ADDED_BY) as WHO_ADD'
      '  , R.NAME'
      '  , 1 PT'
      '  , p.DEBT_SAVE'
      '  , p.DEBT_SAVE*-1 BAL_SAVE'
      '  , p.RQ_ID'
      '  , P.Added_On'
      '  from PAYMENT P'
      '       inner join PAY_DOC D on (P.PAY_DOC_ID = D.PAY_DOC_ID)'
      
        '       left outer join PAYSOURCE PS on (D.PAYSOURCE_ID = PS.PAYS' +
        'OURCE_ID)'
      
        '       left outer join SERVICES R on (P.PAYMENT_SRV = R.SERVICE_' +
        'ID)'
      
        '       left outer join worker w on (w.Ibname = p.ADDED_BY)      ' +
        ' '
      '  where P.CUSTOMER_ID = :CUSTOMER_ID'
      'union'
      'select'
      '    0 PAY_DOC_ID'
      '  , o.Ppd_Id PAYMENT_ID'
      '  , cast(o.Ppd_Date as DATE) PAY_DATE'
      '  , null PAY_SUM'
      '  , o.Ppd_Sum VIEW_SUM  '
      '  , '#39#39' PAY_DOC_NO'
      '  , '#39#39' EXT_PAY_ID'
      '  , cast(o.Ppd_Date as DATE) PAY_DOC_DATE'
      '  , '#39#39' PAYSOURCE_DESCR'
      '  , o.CUSTOMER_ID'
      '  , '#39#1054#1073#1077#1097#1072#1085#1085#1099#1081' '#1087#1083#1072#1090#1077#1078#39' NOTICE'
      '  , 0 FINE_SUM'
      '  , 0 PAID'
      '  , coalesce(W.SURNAME, o.Who_Add) WHO_ADD'
      '  , '#39#39' NAME'
      '  , 0 PT'
      '  , o.DEBT_SAVE'
      '  , o.DEBT_SAVE*-1 BAL_SAVE'
      '  , null RQ_ID   '
      '  , O.Ppd_Date Added_On'
      '  from Prepay_Detail o'
      '       left outer join worker w on (w.Ibname = o.Who_Add)'
      '  where o.CUSTOMER_ID = :CUSTOMER_ID'
      ')')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 184
    Top = 59
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcPayment: TDataSource
    AutoEdit = False
    DataSet = dsPayment
    OnDataChange = srcPaymentDataChange
    Left = 258
    Top = 42
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 112
    Top = 43
    object ActAddPayment: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1083#1072#1090#1077#1078' '#1072#1073#1086#1085#1077#1085#1090#1091' '#1074' '#1086#1090#1082#1088#1099#1090#1099#1081' '#1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      ImageIndex = 2
      ShortCut = 117
      OnExecute = ActAddPaymentExecute
    end
    object actPrepay: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1077#1097#1072#1085#1085#1099#1081' '#1087#1083#1072#1090#1077#1078
      ImageIndex = 55
      OnExecute = actPrepayExecute
    end
    object actCheckUrl: TAction
      Hint = #1055#1088#1086#1074#1077#1088#1080#1090#1100' '#1087#1083#1072#1090#1077#1078
      ImageIndex = 17
      OnExecute = actCheckUrlExecute
    end
    object actMarkReq: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1086#1083#1077' '#1079#1072#1103#1074#1082#1072
      Hint = #1055#1086#1084#1077#1090#1080#1090#1100' '#1101#1090#1086#1090' '#1087#1083#1072#1090#1077#1078' '#1082#1072#1082' '#1086#1087#1083#1072#1090#1091' '#1079#1072#1103#1074#1082#1080
      OnExecute = actMarkReqExecute
    end
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
    Left = 492
    Top = 42
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
    Left = 536
    Top = 42
  end
  object pmDblClick: TPopupMenu
    Left = 392
    Top = 88
    object miPayDoc: TMenuItem
      Caption = #1086#1090#1082#1088#1099#1090#1100' '#1055#1083'. '#1076#1086#1082#1091#1084#1077#1085#1090
      OnClick = miPayDocClick
    end
    object miRequest: TMenuItem
      Caption = #1086#1090#1082#1088#1099#1090#1100' '#1047#1072#1103#1074#1082#1091
      OnClick = miRequestClick
    end
  end
  object pmPayment: TPopupMenu
    Left = 312
    Top = 88
    object miMarkReq: TMenuItem
      Action = actMarkReq
    end
  end
end
