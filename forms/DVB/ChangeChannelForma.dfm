object frmChangeChannelForm: TfrmChangeChannelForm
  Left = 299
  Top = 226
  ActiveControl = lcbSlave
  Caption = #1047#1072#1084#1077#1085#1072' '#1082#1072#1085#1072#1083#1072' '#1085#1072' '#1082#1072#1085#1072#1083' '#1074' '#1089#1077#1090#1080
  ClientHeight = 166
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poOwnerFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 166
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 137
    DesignSize = (
      392
      166)
    object Label1: TLabel
      Left = 6
      Top = 39
      Width = 46
      Height = 13
      Caption = #1053#1072' '#1082#1072#1085#1072#1083
    end
    object lbl1: TLabel
      Left = 6
      Top = 9
      Width = 75
      Height = 13
      Caption = #1047#1072#1084#1077#1085#1080#1084' '#1082#1072#1085#1072#1083
    end
    object lblMaster: TLabel
      Left = 88
      Top = 6
      Width = 76
      Height = 19
      Caption = 'lblMaster'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 6
      Top = 73
      Width = 57
      Height = 13
      Caption = #1047#1072#1084#1077#1085#1080#1090#1100' '#1074
    end
    object Panel2: TPanel
      Left = 0
      Top = 129
      Width = 392
      Height = 37
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      ExplicitTop = 100
      DesignSize = (
        392
        37)
      object bbOk: TBitBtn
        Left = 88
        Top = 8
        Width = 214
        Height = 25
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1047#1072#1084#1077#1085#1080#1090#1100
        ModalResult = 1
        NumGlyphs = 2
        TabOrder = 0
      end
      object bbCancel: TBitBtn
        Left = 308
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = #1054#1090#1084#1077#1085#1072
        ModalResult = 2
        TabOrder = 1
      end
    end
    object lcbSlave: TDBLookupComboboxEh
      Left = 88
      Top = 36
      Width = 295
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.ListFieldNames = 'NAME'
      DropDownBox.ListSource = srcChannels
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.Sizable = True
      EditButtons = <>
      KeyField = 'CH_ID'
      ListField = 'NAME'
      ListSource = srcChannels
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnClick = lcbSlaveClick
      OnEnter = lcbSlaveClick
    end
    object chkAnalog: TDBCheckBoxEh
      Left = 88
      Top = 72
      Width = 75
      Height = 17
      Caption = #1040#1085#1072#1083#1086#1075#1077
      DynProps = <>
      TabOrder = 1
    end
    object chkDVB: TDBCheckBoxEh
      Left = 192
      Top = 72
      Width = 97
      Height = 17
      Caption = 'DVB'
      DynProps = <>
      TabOrder = 2
    end
    object chkReplace: TDBCheckBoxEh
      Left = 88
      Top = 105
      Width = 295
      Height = 17
      Caption = #1055#1086#1084#1077#1085#1103#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1084#1077#1078#1076#1091' '#1082#1072#1085#1072#1083#1072#1084#1080
      Checked = True
      DynProps = <>
      State = cbChecked
      TabOrder = 4
    end
  end
  object dsChannels: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    Ch_Id'
      
        '  , Ch_Name || iif(ANALOG || DVB <> '#39#39', '#39' ( '#39'||iif((ANALOG <> '#39#39 +
        ' and DVB <> '#39#39'), ANALOG || '#39' / '#39' || DVB, ANALOG || DVB)||'#39' )'#39', '#39 +
        #39') NAME'
      '  from (select'
      '            c.Ch_Id'
      '          , c.Ch_Name'
      
        '          , coalesce(iif(c.Ch_Number = 0, null, '#39'A '#39'||c.Ch_Numbe' +
        'r), '#39#39') ANALOG'
      '          , coalesce((select first 1'
      '                          '#39'TSID '#39' || s.Tsid || '#39' SID '#39' || sc.Sid'
      '                        from Dvb_Stream_Channels sc'
      
        '                             inner join Dvb_Streams s on (s.Dvbs' +
        '_Id = sc.Dvbs_Id)'
      '                        where sc.Ch_Id = c.Ch_Id), '#39#39') DVB'
      '          from Channels c'
      '          where c.Ch_Id <> :from_id)'
      '  order by Ch_Name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 280
    Top = 64
  end
  object srcChannels: TDataSource
    AutoEdit = False
    DataSet = dsChannels
    Left = 344
    Top = 64
  end
  object qryChange: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      
        'execute procedure Change_Ch_To_Ch(:From_Ch, :To_Ch, :Analog, :Dv' +
        'b, null, :REPL)')
    Left = 304
    Top = 16
    qoAutoCommit = True
    qoStartTransaction = True
  end
end
