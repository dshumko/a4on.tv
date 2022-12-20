object MatGroupForm: TMatGroupForm
  Left = 0
  Top = 0
  Caption = #1043#1088#1091#1087#1087#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
  ClientHeight = 247
  ClientWidth = 448
  Color = clBtnFace
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    448
    247)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 10
    Width = 73
    Height = 13
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
  end
  object Label4: TLabel
    Left = 6
    Top = 119
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object lbl41: TLabel
    Left = 6
    Top = 65
    Width = 77
    Height = 13
    Caption = #1059#1089#1083#1091#1075#1072' '#1072#1088#1077#1085#1076#1099
  end
  object lbl42: TLabel
    Left = 6
    Top = 92
    Width = 90
    Height = 13
    Caption = #1059#1089#1083#1091#1075#1072' '#1088#1072#1089#1089#1088#1086#1095#1082#1080
  end
  object lblSold: TLabel
    Left = 6
    Top = 37
    Width = 83
    Height = 13
    Caption = #1059#1089#1083#1091#1075#1072' '#1087#1088#1086#1076#1072#1078#1080
  end
  object mmoMG_NOTICE: TDBMemoEh
    Left = 96
    Top = 116
    Width = 344
    Height = 93
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'MG_NOTICE'
    DataSource = MaterialsForm.srcMatGropups
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 4
    Visible = True
    WantReturns = True
  end
  object edtNAME: TDBEditEh
    Left = 96
    Top = 7
    Width = 344
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'MG_NAME'
    DataSource = MaterialsForm.srcMatGropups
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099' '#1084#1072#1090#1077#1088#1080#1072#1083#1072
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object btnOk: TBitBtn
    Left = 6
    Top = 214
    Width = 351
    Height = 28
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    NumGlyphs = 2
    TabOrder = 5
    OnClick = OkCancelFrame1bbOkClick
  end
  object btnCancel: TBitBtn
    Left = 364
    Top = 214
    Width = 76
    Height = 28
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 6
  end
  object lcbRENT: TDBLookupComboboxEh
    Left = 97
    Top = 62
    Width = 343
    Height = 21
    Hint = #1050#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100' '#1087#1088#1080' '#1072#1088#1077#1085#1076#1077' '#1095#1077#1088#1077#1079' '#1079#1072#1103#1074#1082#1091
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'RENT'
    DataSource = MaterialsForm.srcMatGropups
    DropDownBox.ListSource = srcServices
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterType = lsftContainsEh
    DropDownBox.ListSourceAutoFilterAllColumns = True
    DropDownBox.AutoDrop = True
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1050#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100' '#1087#1088#1080' '#1072#1088#1077#1085#1076#1077' '#1095#1077#1088#1077#1079' '#1079#1072#1103#1074#1082#1091
    EditButtons = <>
    KeyField = 'SERVICE_ID'
    ListField = 'NAME'
    ListSource = srcServices
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 2
    Visible = True
  end
  object lcbLAON: TDBLookupComboboxEh
    Left = 97
    Top = 89
    Width = 343
    Height = 21
    Hint = #1050#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100' '#1087#1088#1080' '#1088#1072#1089#1089#1088#1086#1095#1082#1077' '#1095#1077#1088#1077#1079' '#1079#1072#1103#1074#1082#1091
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'LOAN'
    DataSource = MaterialsForm.srcMatGropups
    DropDownBox.ListSource = srcServices
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterType = lsftContainsEh
    DropDownBox.ListSourceAutoFilterAllColumns = True
    DropDownBox.AutoDrop = True
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1050#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100' '#1087#1088#1080' '#1088#1072#1089#1089#1088#1086#1095#1082#1077' '#1095#1077#1088#1077#1079' '#1079#1072#1103#1074#1082#1091
    EditButtons = <>
    KeyField = 'SERVICE_ID'
    ListField = 'NAME'
    ListSource = srcServices
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 3
    Visible = True
  end
  object lcbSOLD: TDBLookupComboboxEh
    Left = 96
    Top = 34
    Width = 344
    Height = 21
    Hint = #1050#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100' '#1087#1088#1080' '#1072#1088#1077#1085#1076#1077' '#1095#1077#1088#1077#1079' '#1079#1072#1103#1074#1082#1091
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    DataField = 'SOLD'
    DataSource = MaterialsForm.srcDataSource
    DropDownBox.ListSource = srcSoldSRV
    DropDownBox.ListSourceAutoFilter = True
    DropDownBox.ListSourceAutoFilterType = lsftContainsEh
    DropDownBox.ListSourceAutoFilterAllColumns = True
    DropDownBox.AutoDrop = True
    DropDownBox.Sizable = True
    EmptyDataInfo.Text = #1050#1072#1082#1091#1102' '#1091#1089#1083#1091#1075#1091' '#1087#1086#1076#1082#1083#1102#1095#1072#1090#1100' '#1087#1088#1080' '#1087#1088#1086#1076#1072#1078#1077' '#1095#1077#1088#1077#1079' '#1079#1072#1103#1074#1082#1091
    EditButtons = <>
    KeyField = 'SERVICE_ID'
    ListField = 'NAME'
    ListSource = srcSoldSRV
    ShowHint = True
    Style = csDropDownEh
    TabOrder = 1
    Visible = True
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 16
    Top = 128
  end
  object trReadQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 164
    Top = 79
  end
  object dsServices: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    c.Service_Id'
      
        '  , c.Name || coalesce('#39' ('#39' || c.Shortname || '#39')'#39', '#39#39') || coales' +
        'ce('#39' ='#39' || t.Tarif_Sum, '#39#39') NAME'
      '  from SERVices C'
      
        '       left outer join tarif t on (t.Service_Id = c.Service_Id a' +
        'nd'
      '             current_date between t.Date_From and t.Date_To)'
      '  where C.SRV_TYPE_ID = 0'
      '        and exists(select'
      '                       l.Link_Id'
      '                     from Services_Links l'
      '                     where l.Link_Type = 0'
      '                           and l.Child = c.Service_Id)'
      '  order by c.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 237
    Top = 69
    oFetchAll = True
  end
  object srcServices: TDataSource
    DataSet = dsServices
    Left = 309
    Top = 77
  end
  object dsSoldSRV: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    c.Service_Id'
      
        '  , c.Name || coalesce('#39' ('#39' || c.Shortname || '#39')'#39', '#39#39') || coales' +
        'ce('#39' ='#39' || t.Tarif_Sum, '#39#39') NAME'
      '  from SERVices C'
      
        '       left outer join tarif t on (t.Service_Id = c.Service_Id a' +
        'nd'
      '             current_date between t.Date_From and t.Date_To)'
      '  where C.SRV_TYPE_ID <> 0'
      '  order by c.NAME')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 181
    Top = 147
    oFetchAll = True
  end
  object srcSoldSRV: TDataSource
    DataSet = dsSoldSRV
    Left = 237
    Top = 147
  end
end
