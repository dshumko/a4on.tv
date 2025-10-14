object apgCustomerDigit: TapgCustomerDigit
  Left = 0
  Top = 0
  Caption = #1062#1080#1092#1088#1072
  ClientHeight = 259
  ClientWidth = 955
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
  object splPers: TSplitter
    Left = 485
    Top = 0
    Height = 259
    Align = alRight
  end
  object pnlPers: TPanel
    Left = 488
    Top = 0
    Width = 467
    Height = 259
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object splSC: TSplitter
      Left = 240
      Top = 0
      Height = 259
      Align = alRight
    end
    object pnlDecPackets: TPanel
      Left = 0
      Top = 0
      Width = 240
      Height = 259
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlDecPackets'
      TabOrder = 0
      object lbl1: TLabel
        Left = 0
        Top = 0
        Width = 240
        Height = 13
        Hint = 
          #1055#1072#1082#1077#1090#1099' '#1076#1083#1103' '#1082#1072#1088#1090#1086#1095#1082#1080', '#13#10#1077#1089#1083#1080' '#1085#1077' '#1091#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086' '#1074#1089#1077' '#1087#1072#1082#1077#1090#1099' '#1085#1072' '#1082#1086#1090#1086#1088#1099 +
          #1077' '#1087#1086#1076#1087#1080#1089#1072#1085' '#1072#1073#1086#1085#1077#1085#1090
        Align = alTop
        Caption = '.: '#1055#1077#1088#1080#1086#1076#1080#1095#1077#1089#1082#1080#1077' '#1091#1089#1083#1091#1075#1080' '#1076#1083#1103' '#1076#1077#1082#1086#1076#1077#1088#1072' :.'
      end
      object dbgrdhDecoderPacket: TDBGridEh
        Left = 26
        Top = 13
        Width = 214
        Height = 246
        Align = alClient
        AllowedOperations = []
        DataSource = srcDecoderPacket
        DynProps = <>
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        ParentFont = False
        TabOrder = 1
        OnGetCellParams = dbgrdhDecoderPacketGetCellParams
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NAME'
            Footers = <>
            Title.Caption = #1059#1089#1083#1091#1075#1072
            Width = 136
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
            Width = 185
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnl2: TPanel
        Left = 0
        Top = 13
        Width = 26
        Height = 246
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          26
          246)
        object btnDigitPacketDel: TSpeedButton
          Left = 3
          Top = 225
          Width = 22
          Height = 22
          Action = actDigitPacketDel
          Anchors = [akLeft, akBottom]
          Flat = True
          Layout = blGlyphTop
        end
        object btnDigitPacketAdd: TSpeedButton
          Left = 2
          Top = 3
          Width = 22
          Height = 22
          Action = actDigitPacketAdd
          Flat = True
        end
      end
    end
    object pnlPersChannels: TPanel
      Left = 243
      Top = 0
      Width = 224
      Height = 259
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object lbl2: TLabel
        Left = 0
        Top = 0
        Width = 224
        Height = 13
        Align = alTop
        Caption = '.:: '#1055#1077#1088#1089#1086#1085#1072#1083#1100#1085#1099#1077' '#1082#1072#1085#1072#1083#1099' '#1072#1073#1086#1085#1077#1085#1090#1072' ::.'
      end
      object dbgCustChan: TDBGridEh
        Left = 26
        Top = 13
        Width = 198
        Height = 246
        Align = alClient
        AllowedOperations = [alopUpdateEh]
        DataSource = srcChannels
        DynProps = <>
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        FooterParams.Color = clWindow
        GridLineParams.VertEmptySpaceStyle = dessNonEh
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
        ParentFont = False
        TabOrder = 1
        Columns = <
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'CH_NAME'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1050#1072#1085#1072#1083
            Width = 169
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DATE_ON'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1074#1082#1083'.'
            Width = 73
          end
          item
            AutoFitColWidth = False
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'DATE_OFF'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072' '#1074#1099#1082#1083'.'
            Width = 77
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'NOTICE'
            Footers = <>
            Title.Caption = #1055#1080#1084#1077#1095#1072#1085#1080#1077
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_BY'
            Footers = <>
            Title.Caption = #1044#1086#1073#1072#1074#1080#1083
          end
          item
            CellButtons = <>
            DynProps = <>
            EditButtons = <>
            FieldName = 'ADDED_ON'
            Footers = <>
            Title.Caption = #1050#1086#1075#1076#1072
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object pnl3: TPanel
        Left = 0
        Top = 13
        Width = 26
        Height = 246
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          26
          246)
        object btnChanDel: TSpeedButton
          Left = 3
          Top = 225
          Width = 22
          Height = 22
          Action = actChanDel
          Anchors = [akLeft, akBottom]
          Flat = True
          Layout = blGlyphTop
        end
        object btnChanAdd: TSpeedButton
          Left = 3
          Top = 3
          Width = 22
          Height = 22
          Action = actChanAdd
          Flat = True
        end
      end
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 485
    Height = 259
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dbgCustDec: TDBGridEh
      Left = 26
      Top = 0
      Width = 459
      Height = 259
      Align = alClient
      AllowedOperations = []
      DataSource = srcDecoders
      DrawMemoText = True
      DynProps = <>
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterParams.Color = clWindow
      GridLineParams.VertEmptySpaceStyle = dessNonEh
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
      ParentFont = False
      PopupMenu = pmDigit
      STFilter.InstantApply = True
      STFilter.Local = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      OnDblClick = dbgCustDecDblClick
      Columns = <
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DECODER_N'
          Footers = <>
          Title.Caption = #1053#1086#1084#1077#1088
          Title.TitleButton = True
          Width = 65
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STB_N'
          Footers = <>
          Title.Caption = #8470' STB'
          Title.TitleButton = True
          Width = 87
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'TV_MODEL'
          Footers = <>
          Title.Caption = #1052#1086#1076#1077#1083#1100' TV'
          Title.TitleButton = True
          Width = 79
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'TV_SOFT'
          Footers = <>
          Title.Caption = #1055#1088#1086#1096#1080#1074#1082#1072' TV'
          Title.TitleButton = True
          Width = 71
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 110
        end
        item
          CellButtons = <>
          Checkboxes = True
          DynProps = <>
          EditButtons = <>
          FieldName = 'PAIRING'
          Footers = <>
          Title.Caption = #1055#1088#1080#1074#1103#1079#1082#1072
          Title.Hint = #1042#1082#1083#1102#1095#1077#1085' '#1083#1080' PAIRING'
          Title.TitleButton = True
          Width = 63
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'SRV_LIST'
          Footers = <>
          Title.Caption = #1055#1088#1080#1074#1103#1079'. '#1091#1089#1083#1091#1075#1080
          Title.TitleButton = True
          Width = 92
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_BY'
          Footers = <>
          Title.Caption = #1044#1086#1073#1072#1074#1080#1083
          Title.TitleButton = True
        end
        item
          AutoFitColWidth = False
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
          FieldName = 'eq_type_name'
          Footers = <>
          Title.Caption = #1058#1080#1087
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'man_name'
          Footers = <>
          Title.Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100
          Width = 85
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'dvb_notice'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1080#1079' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082#1072
          Width = 74
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object pnlButtons: TPanel
      Left = 0
      Top = 0
      Width = 26
      Height = 259
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        26
        259)
      object btnDel1: TSpeedButton
        Left = 2
        Top = 236
        Width = 22
        Height = 22
        Action = actDigitDecoderDel
        Anchors = [akLeft, akBottom]
        Flat = True
        Layout = blGlyphTop
      end
      object btnAdd1: TSpeedButton
        Left = 2
        Top = 3
        Width = 22
        Height = 22
        Action = actDigitDecoderAdd
        Flat = True
      end
      object btnEdit1: TSpeedButton
        Left = 2
        Top = 30
        Width = 22
        Height = 22
        Action = actDigitDecoderEdit
        Flat = True
      end
      object btnMenu: TSpeedButton
        Left = 2
        Top = 60
        Width = 22
        Height = 22
        Action = actMenu
        Flat = True
      end
    end
  end
  object dsDecoders: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CUSTOMER_DECODERS'
      'SET '
      '    CUSTOMER_ID = :Customer_Id,'
      '    DECODER_N = :DECODER_N,'
      '    NOTICE = :NOTICE,'
      '    STB_N = :STB_N,'
      '    PAIRING = :PAIRING'
      'WHERE'
      '    DEC_ID = :OLD_DEC_ID'
      '    ')
    DeleteSQL.Strings = (
      
        'execute procedure Delete_Customer_Decoder(:OLD_DEC_ID, :Decoder_' +
        'State)')
    InsertSQL.Strings = (
      'INSERT INTO CUSTOMER_DECODERS('
      '    DEC_ID,'
      '    CUSTOMER_ID,'
      '    DECODER_N,'
      '    NOTICE,'
      '   STB_N,'
      '   PAIRING'
      ')'
      'VALUES('
      '    :DEC_ID,'
      '    :Customer_Id,'
      '    :DECODER_N,'
      '    :NOTICE,'
      '    :STB_N,'
      '    :PAIRING'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    Cd.Dec_Id'
      '  , Cd.Customer_Id'
      '  , Cd.Decoder_N'
      '  , Cd.Stb_N'
      '  , Cd.Tv_Model'
      '  , Cd.Tv_Soft'
      '  , Cd.Last_Update'
      '  , Cd.Notice'
      '  , Cd.Added_By'
      '  , Cd.Added_On'
      '  , Cd.Edit_By'
      '  , Cd.Edit_On'
      '  , coalesce(Cd.Pairing, 0) Pairing'
      '  , (select'
      '         list(s.name)'
      '       from decoder_packets p'
      
        '            inner join Customer_Decoders d on (d.Decoder_N = p.D' +
        'ecoder_N)'
      
        '            inner join customer c on (c.Customer_Id = d.Customer' +
        '_Id)'
      
        '            inner join services s on (p.service_id = s.service_i' +
        'd)'
      
        '            inner join Subscr_Serv ss on (ss.Serv_Id = s.Service' +
        '_Id and'
      '                  ss.Customer_Id = c.Customer_Id)'
      '       where p.decoder_n = cd.Decoder_N) srv_list'
      '   , t.o_name eq_type_name'
      '   , m.o_name man_name'
      '   , d.Notice dvb_notice'
      '  from Customer_Decoders Cd'
      
        '   left outer join EQUIPMENT_DVB  d on ((d.eq_n = cd.decoder_n)o' +
        'r (d.eq_n = cd.stb_n))'
      
        '   left outer join objects t on (t.o_id = d.eq_type and t.o_type' +
        ' = 19)'
      
        '   left outer join objects m on (m.o_id = d.eq_man and m.o_type ' +
        '= 18)'
      'where (cd.Customer_Id = :Customer_Id)'
      '  and (CD.DEC_ID = :OLD_DEC_ID)')
    SelectSQL.Strings = (
      'select'
      '    Cd.Dec_Id'
      '  , Cd.Customer_Id'
      '  , Cd.Decoder_N'
      '  , Cd.Stb_N'
      '  , Cd.Tv_Model'
      '  , Cd.Tv_Soft'
      '  , Cd.Last_Update'
      '  , Cd.Notice'
      '  , Cd.Added_By'
      '  , Cd.Added_On'
      '  , Cd.Edit_By'
      '  , Cd.Edit_On'
      '  , coalesce(Cd.Pairing, 0) Pairing'
      '  , (select'
      '         list(s.name)'
      '       from decoder_packets p'
      
        '            inner join Customer_Decoders d on (d.Decoder_N = p.D' +
        'ecoder_N)'
      
        '            inner join customer c on (c.Customer_Id = d.Customer' +
        '_Id)'
      
        '            inner join services s on (p.service_id = s.service_i' +
        'd)'
      
        '            inner join Subscr_Serv ss on (ss.Serv_Id = s.Service' +
        '_Id and'
      '                  ss.Customer_Id = c.Customer_Id)'
      '       where p.decoder_n = cd.Decoder_N) srv_list'
      '   , t.o_name eq_type_name'
      '   , m.o_name man_name'
      '   , d.Notice dvb_notice'
      '  from Customer_Decoders Cd'
      
        '   left outer join EQUIPMENT_DVB  d on ((d.eq_n = cd.decoder_n)o' +
        'r (d.eq_n = cd.stb_n))'
      
        '   left outer join objects t on (t.o_id = d.eq_type and t.o_type' +
        ' = 19)'
      
        '   left outer join objects m on (m.o_id = d.eq_man and m.o_type ' +
        '= 18)'
      '  where cd.Customer_Id = :Customer_Id'
      '  order by cd.Decoder_N  ')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DEC_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 143
    Top = 63
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcDecoders: TDataSource
    AutoEdit = False
    DataSet = dsDecoders
    OnDataChange = srcDecodersDataChange
    Left = 75
    Top = 57
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 146
    Top = 113
    object actDigitDecoderAdd: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1077#1082#1086#1076#1077#1088
      ImageIndex = 2
      OnExecute = actDigitDecoderAddExecute
    end
    object actDigitDecoderEdit: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1077#1082#1086#1076#1077#1088
      ImageIndex = 4
      OnExecute = actDigitDecoderEditExecute
    end
    object actDigitDecoderDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1077#1082#1086#1076#1077#1088
      ImageIndex = 3
      OnExecute = actDigitDecoderDelExecute
    end
    object actDigitPacketAdd: TAction
      Hint = #1055#1088#1080#1074#1103#1079#1072#1090#1100' '#1087#1072#1082#1077#1090' '#1082' '#1076#1077#1082#1086#1076#1077#1088#1091' ('#1082#1072#1088#1090#1086#1095#1082#1077')'
      ImageIndex = 2
      OnExecute = actDigitPacketAddExecute
    end
    object actDigitPacketDel: TAction
      Hint = #1048#1089#1082#1083#1102#1095#1080#1090#1100' '#1087#1072#1082#1077#1090' '#1080#1079' '#1076#1086#1089#1090#1091#1087#1085#1099#1093' '#1076#1083#1103' '#1076#1077#1082#1086#1076#1077#1088#1072' ('#1082#1072#1088#1090#1086#1095#1082#1080')'
      ImageIndex = 3
      OnExecute = actDigitPacketDelExecute
    end
    object actPairing: TAction
      Caption = 'Pairing'
      OnExecute = actPairingExecute
    end
    object actResetPIN: TAction
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100' PIN'
      OnExecute = actResetPINExecute
    end
    object actMenu: TAction
      ImageIndex = 78
      OnExecute = actMenuExecute
    end
    object actChanAdd: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1072#1085#1072#1083
      ImageIndex = 2
      OnExecute = actChanAddExecute
    end
    object actChanEdit: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1072#1085#1072#1083
      ImageIndex = 4
    end
    object actChanDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1082#1072#1085#1072#1083
      ImageIndex = 3
      OnExecute = actChanDelExecute
    end
  end
  object dsDecoderPacket: TpFIBDataSet
    DeleteSQL.Strings = (
      'delete from DECODER_PACKETS'
      'where (DECODER_N = :OLD_DECODER_N)'
      '      and (SERVICE_ID = :OLD_SERVICE_ID) ')
    RefreshSQL.Strings = (
      'SELECT Cc.Ch_Id, Cc.Date_On, Cc.Date_Off, Cc.Notice, c.Ch_Name'
      'FROM Customer_Channels Cc, Channels c'
      'where(  c.Ch_Id = cc.Ch_Id'
      'and Cc.Decoder_Id = :Dec_Id'
      '     ) and (     CC.CH_ID = :OLD_CH_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      '    s.service_id, s.name, p.notice, ss.State_Sgn'
      '  from decoder_packets p'
      
        '       inner join Customer_Decoders d on (d.Decoder_N = p.Decode' +
        'r_N)'
      '       inner join customer c on (c.Customer_Id = d.Customer_Id)'
      '       inner join services s on (p.service_id = s.service_id)'
      
        '       inner join Subscr_Serv ss on (ss.Serv_Id = s.Service_Id a' +
        'nd ss.Customer_Id = c.Customer_Id)'
      '  where p.decoder_n = :decoder_n'
      '  order by s.name')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcDecoders
    Left = 333
    Top = 118
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcDecoderPacket: TDataSource
    DataSet = dsDecoderPacket
    Left = 462
    Top = 125
  end
  object pmDigit: TPopupMenu
    Left = 224
    Top = 88
    object actResetPIN1: TMenuItem
      Action = actResetPIN
    end
    object actParing1: TMenuItem
      Action = actPairing
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
    Left = 380
    Top = 66
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
    Left = 453
    Top = 74
  end
  object srcChannels: TDataSource
    DataSet = dsChannels
    Left = 736
    Top = 119
  end
  object dsChannels: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CUSTOMER_CHANNELS'
      'SET '
      '    DATE_ON = :DATE_ON,'
      '    DATE_OFF = :DATE_OFF,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    CH_ID = :OLD_CH_ID'
      '    and DECODER_ID = :OLD_DECODER_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CUSTOMER_CHANNELS'
      'WHERE'
      '        CH_ID = :OLD_CH_ID'
      '    and DECODER_ID = :OLD_DECODER_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CUSTOMER_CHANNELS('
      '    CH_ID,'
      '    DATE_ON,'
      '    DATE_OFF,'
      '    NOTICE,'
      '    DECODER_ID'
      ')'
      'VALUES('
      '    :CH_ID,'
      '    :DATE_ON,'
      '    :DATE_OFF,'
      '    :NOTICE,'
      '    :DECODER_ID'
      ')')
    RefreshSQL.Strings = (
      'SELECT Cc.*, c.Ch_Name'
      'FROM Customer_Channels Cc, Channels c'
      'where(  c.Ch_Id = cc.Ch_Id'
      'and Cc.Decoder_Id = :Dec_Id'
      '     ) and (     CC.CH_ID = :OLD_CH_ID'
      '    and CC.DECODER_ID = :OLD_DECODER_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'select'
      
        '    Cc.*, c.Ch_Name, coalesce(w.Ibname, cc.Added_By) added_by, c' +
        'c.Added_On'
      '  from Customer_Channels Cc'
      '       inner join Channels c on (c.Ch_Id = cc.Ch_Id)'
      '       left outer join worker w on (cc.Added_By = w.Ibname)'
      '  where Cc.Decoder_Id = :Dec_Id'
      '  order by c.Ch_Name')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    DataSource = srcDecoders
    Left = 736
    Top = 71
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object PropStorage: TPropStorageEh
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'pnlPers.<P>.Width'
      'pnlPers.pnlPersChannels.<P>.Width')
    Left = 217
    Top = 33
  end
end
