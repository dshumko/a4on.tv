object EquipmentCommandForm: TEquipmentCommandForm
  Left = 0
  Top = 0
  Caption = #1050#1086#1084#1084#1072#1085#1076#1072' '#1076#1083#1103' '#1075#1088#1091#1087#1087#1099' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
  ClientHeight = 406
  ClientWidth = 561
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
  PixelsPerInch = 96
  TextHeight = 13
  object lbl2: TLabel
    Left = 0
    Top = 294
    Width = 561
    Height = 13
    Align = alBottom
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  inline okcnclfrm1: TOkCancelFrame
    Left = 0
    Top = 371
    Width = 561
    Height = 35
    Align = alBottom
    TabOrder = 4
    TabStop = True
    inherited bbOk: TBitBtn
      Left = 62
      Top = 2
      Width = 373
      Height = 27
      Anchors = [akLeft, akRight, akBottom]
      OnClick = okcnclfrm1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 453
      Top = 2
      Width = 95
      Height = 27
    end
  end
  object dbm1: TDBMemoEh
    Left = 0
    Top = 307
    Width = 561
    Height = 64
    ScrollBars = ssBoth
    Align = alBottom
    AutoSize = False
    DataField = 'NOTICE'
    DataSource = srcGC
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 3
    Visible = True
    WantReturns = True
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 561
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      561
      51)
    object lbl4: TLabel
      Left = 8
      Top = 8
      Width = 48
      Height = 13
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object lbl5: TLabel
      Left = 8
      Top = 34
      Width = 36
      Height = 13
      Caption = #1043#1088#1091#1087#1087#1072
    end
    object lbl3: TLabel
      Left = 215
      Top = 34
      Width = 66
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1058#1080#1087' '#1082#1086#1084#1072#1085#1076#1099
    end
    object lbl6: TLabel
      Left = 482
      Top = 34
      Width = 19
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'EOL'
    end
    object edtName: TDBEditEh
      Left = 62
      Top = 5
      Width = 494
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'NAME'
      DataSource = srcGC
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object lcbGroup: TDBLookupComboboxEh
      Left = 62
      Top = 31
      Width = 147
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'EG_ID'
      DataSource = srcGC
      EditButtons = <>
      KeyField = 'O_ID'
      ListField = 'NAME'
      ListSource = srcGroup
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object cbType: TDBComboBoxEh
      Left = 286
      Top = 31
      Width = 73
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'CMD_TYPE'
      DataSource = srcGC
      DynProps = <>
      EditButtons = <>
      Items.Strings = (
        'Telnet'
        'SNMP'
        'HTTP')
      KeyItems.Strings = (
        '0'
        '1'
        '2')
      ShowHint = True
      TabOrder = 2
      Visible = True
      OnChange = cbTypeChange
    end
    object dbchGUI: TDBCheckBoxEh
      Left = 366
      Top = 33
      Width = 107
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      BiDiMode = bdLeftToRight
      Caption = #1042#1099#1087#1086#1083#1085#1103#1090#1100' '#1080#1079' '#1055#1054
      DataField = 'IN_GUI'
      DataSource = srcGC
      DynProps = <>
      ParentBiDiMode = False
      TabOrder = 3
    end
    object cbEOL: TDBComboBoxEh
      Left = 507
      Top = 31
      Width = 49
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'EOL_CHRS'
      DataSource = srcGC
      DynProps = <>
      EditButtons = <>
      Items.Strings = (
        '\r\n'
        '\n\r'
        '\n'
        '\r')
      KeyItems.Strings = (
        '\r\n'
        '\n\r'
        '\n'
        '\r')
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
  end
  object pnlURL: TPanel
    Left = 0
    Top = 51
    Width = 561
    Height = 52
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    DesignSize = (
      561
      52)
    object lblURL: TLabel
      Left = 8
      Top = 8
      Width = 19
      Height = 13
      Caption = 'URL'
    end
    object edtURL: TDBEditEh
      Left = 62
      Top = 5
      Width = 494
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'URL'
      DataSource = srcGC
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'URL '#1084#1086#1078#1077#1090' '#1080#1084#1077#1090#1100' '#1072#1076#1088#1077#1089' <e_ip> '#1080#1083#1080' <c_ip>'
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object edtUSR: TDBEditEh
      Left = 62
      Top = 28
      Width = 219
      Height = 21
      DataField = 'Aut_User'
      DataSource = srcGC
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' (BASIC AUTH)'
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object edtPSWD: TDBEditEh
      Left = 286
      Top = 28
      Width = 270
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'Aut_Pswd'
      DataSource = srcGC
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1087#1072#1088#1086#1083#1100' (BASIC AUTH)'
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
  end
  object pnlCMD: TPanel
    Left = 0
    Top = 103
    Width = 561
    Height = 191
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object lbl1: TLabel
      Left = 0
      Top = 0
      Width = 44
      Height = 13
      Align = alTop
      Caption = #1050#1086#1084#1072#1085#1076#1072
    end
    object dbmNotice: TDBMemoEh
      Left = 0
      Top = 13
      Width = 561
      Height = 178
      Hint = 
        #1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1076#1086#1073#1072#1074#1083#1103#1090#1100' '#1074' '#1082#1086#1085#1094#1077' '#1089#1090#1088#1086#1082#1080' '#1089#1080#1084#1074#1086#1083#1099' '#1087#1077#1088#1077#1074#1086#1076#1072' '#1082#1086#1088#1077#1090#1082#1080#13#10'\n' +
        ' - ASCII -10'#13#10'\r - ASCII - 13'#13#10'\t - ASCII - 09'#13#10'\p - '#1082#1083#1072#1074#1080#1096#1072' '#1087#1088#1086 +
        #1073#1077#1083#13#10'wait - '#1087#1072#1091#1079#1072' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1085#1072' 1 '#1089#1077#1082#1091#1085#1076#1091
      ScrollBars = ssBoth
      Align = alClient
      AutoSize = False
      DataField = 'COMMAND'
      DataSource = srcGC
      DynProps = <>
      EditButtons = <>
      PopupMenu = pmMemo
      ShowHint = True
      TabOrder = 0
      Visible = True
      WantReturns = True
    end
  end
  object srcGC: TDataSource
    DataSet = dsGC
    Left = 213
    Top = 189
  end
  object srcGroup: TDataSource
    DataSet = dsGroup
    Left = 275
    Top = 188
  end
  object dsGroup: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      ' -1 O_ID, '#39#1042#1089#1077#39' as name, '#39' _'#39' SORT_NAME'
      'from Rdb$Database'
      'union all'
      'select'
      '    O_ID'
      '  , O_NAME || coalesce('#39' '#39' || O_DESCRIPTION, '#39#39') as name'
      '  , O_NAME SORT_NAME'
      '  from OBJECTS'
      '  where o_TYPE = 7'
      '        and O_DELETED = 0'
      'order by 3')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 146
    Top = 128
  end
  object dsGC: TpFIBDataSet
    UpdateSQL.Strings = (
      'update Equipment_Cmd_Grp'
      'set Eg_Id = :Eg_Id,'
      '    Name = :Name,'
      '    Command = :Command,'
      '    Notice = :Notice,'
      '    Cmd_Type = :Cmd_Type,'
      '    In_Gui = :In_Gui,'
      '    Eol_Chrs = :Eol_Chrs,'
      '    Url = :Url,'
      '    Aut_User = :Aut_User,'
      '    Aut_Pswd = :Aut_Pswd'
      'where EC_ID = :OLD_EC_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    EQUIPMENT_CMD_GRP'
      'WHERE'
      '        EC_ID = :OLD_EC_ID')
    InsertSQL.Strings = (
      
        'insert into Equipment_Cmd_Grp (Eg_Id, Name, Command, Notice, Cmd' +
        '_Type, In_Gui, Eol_Chrs, Url, Aut_User, Aut_Pswd)'
      
        'values (:Eg_Id, :Name, :Command, :Notice, :Cmd_Type, :In_Gui, :E' +
        'ol_Chrs, :Url, :Aut_User, :Aut_Pswd)')
    SelectSQL.Strings = (
      'select *'
      'from EQUIPMENT_CMD_GRP'
      'where EC_ID = :CID')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 83
    Top = 129
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
    Left = 212
    Top = 128
  end
  object pmMemo: TPopupMenu
    Left = 277
    Top = 128
  end
end
