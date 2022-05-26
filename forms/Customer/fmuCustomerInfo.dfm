object apgCustomerInfo: TapgCustomerInfo
  Left = 0
  Top = 0
  Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103
  ClientHeight = 229
  ClientWidth = 946
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAddInfo: TPanel
    Left = 446
    Top = 0
    Width = 500
    Height = 229
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object spltMemo: TdnSplitter
      Left = 257
      Top = 0
      AlignControl = pnlDP
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      ResizeStyle = rsLine
      Size = 5
      ButtonVisible = False
    end
    object pnlDP: TPanel
      Left = 0
      Top = 0
      Width = 257
      Height = 229
      Align = alLeft
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 0
      object sbRecalc: TSpeedButton
        Left = 0
        Top = 60
        Width = 257
        Height = 19
        Hint = #1057#1076#1077#1083#1072#1090#1100' '#1087#1086#1083#1085#1099#1081' '#1087#1077#1088#1077#1088#1072#1089#1095#1077#1090' '#1072#1073#1086#1085#1077#1085#1090#1072
        Align = alTop
        Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 10
        OnClick = sbRecalcClick
      end
      object btnAlign: TSpeedButton
        Left = 2
        Top = 2
        Width = 23
        Height = 13
        Caption = #1074'/'#1075
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        OnClick = btnAlignClick
      end
      object gbSaldo: TGroupBox
        Left = 0
        Top = 0
        Width = 257
        Height = 60
        Hint = #1057#1072#1083#1100#1076#1086' '#1088#1072#1089#1095#1077#1090#1086#1074
        Align = alTop
        Caption = '          '#1057#1072#1083#1100#1076#1086' '
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object dbtxtDEBT: TDBText
          Left = 2
          Top = 15
          Width = 253
          Height = 22
          Align = alClient
          Alignment = taCenter
          AutoSize = True
          DataField = 'DEBT_SUM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object pnlPrepay: TPanel
          Left = 2
          Top = 37
          Width = 253
          Height = 21
          Hint = #1054#1073#1077#1097#1072#1085#1085#1099#1081' '#1087#1083#1072#1090#1077#1078
          Align = alBottom
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = True
          ParentFont = False
          TabOrder = 0
          object dbtxtPrepay: TDBText
            Left = 0
            Top = 0
            Width = 253
            Height = 21
            Hint = #1054#1073#1077#1097#1072#1085#1085#1099#1081' '#1087#1083#1072#1090#1077#1078
            Align = alClient
            Alignment = taCenter
            AutoSize = True
            DataField = 'PREPAY'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      object pnlContacts: TPanel
        Left = 0
        Top = 79
        Width = 257
        Height = 150
        Align = alClient
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        object dbgrdhContacts: TDBGridEh
          Left = 0
          Top = 18
          Width = 257
          Height = 132
          Align = alClient
          DataSource = srcContacts
          DynProps = <>
          Flat = True
          FooterParams.Color = clWindow
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghExtendVertLines]
          TabOrder = 1
          OnDblClick = dbgrdhContactsDblClick
          OnExit = dbgrdhContactsExit
          OnKeyUp = dbgrdhContactsKeyUp
          Columns = <
            item
              AutoFitColWidth = False
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'O_NAME'
              Footers = <>
              Title.Caption = #1058#1080#1087
              Width = 30
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CC_VALUE'
              Footers = <>
              Title.Caption = #1050#1086#1085#1090#1072#1082#1090
              Width = 106
            end
            item
              CellButtons = <>
              Checkboxes = True
              DynProps = <>
              EditButtons = <>
              FieldName = 'Cc_Notify'
              Footers = <>
              Title.Caption = #1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103
              Title.Hint = #1056#1072#1089#1089#1099#1083#1072#1090#1100' '#1091#1074#1077#1076#1086#1084#1083#1077#1085#1080#1103' '#1085#1072' '#1101#1090#1086#1090' '#1082#1086#1085#1090#1072#1082#1090
              Width = 20
            end
            item
              CellButtons = <>
              DynProps = <>
              EditButtons = <>
              FieldName = 'CC_NOTICE'
              Footers = <>
              Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
              Width = 72
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
        object pnlBtns: TPanel
          Left = 0
          Top = 0
          Width = 257
          Height = 18
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lbl5: TLabel
            Left = 0
            Top = 0
            Width = 60
            Height = 18
            Align = alLeft
            AutoSize = False
            Caption = #1050#1086#1085#1090#1072#1082#1090#1099' '
          end
          object btnCall: TSpeedButton
            Left = 117
            Top = 0
            Width = 101
            Height = 18
            Action = actMakeCall
            Align = alClient
            Flat = True
          end
          object lbl1: TLabel
            Left = 96
            Top = 0
            Width = 21
            Height = 18
            Align = alLeft
            Caption = '       '
          end
          object btnCAdd: TSpeedButton
            Left = 60
            Top = 0
            Width = 18
            Height = 18
            Action = actCAdd
            Align = alLeft
            Flat = True
          end
          object btnCdel: TSpeedButton
            Left = 239
            Top = 0
            Width = 18
            Height = 18
            Action = actCDel
            Align = alRight
            Flat = True
          end
          object lbl2: TLabel
            Left = 218
            Top = 0
            Width = 21
            Height = 18
            Align = alRight
            Caption = '       '
          end
          object btnCEdit: TSpeedButton
            Left = 78
            Top = 0
            Width = 18
            Height = 18
            Action = actCEdit
            Align = alLeft
            Flat = True
          end
        end
      end
    end
    object gbMemo: TGroupBox
      Left = 262
      Top = 0
      Width = 238
      Height = 229
      Align = alClient
      Caption = ' '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '
      TabOrder = 1
      DesignSize = (
        238
        229)
      object memCustNotice: TDBMemoEh
        Left = 2
        Top = 15
        Width = 234
        Height = 212
        Align = alClient
        AutoSize = False
        BorderStyle = bsNone
        Color = clWhite
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1056#1077#1076#1072#1082#1090#1080#1088#1091#1077#1084#1086#1077' '#1087#1086#1083#1077'. '
        MaxLength = 999
        PopupMenu = pmMemo
        TabOrder = 0
        Visible = True
        WantReturns = True
        OnExit = memCustNoticeExit
        OnKeyPress = memCustNoticeKeyPress
      end
      object btnSaveNotice: TButton
        Left = 160
        Top = 200
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        TabOrder = 1
        Visible = False
        OnClick = btnSaveNoticeClick
      end
    end
  end
  object dnSplitterHTML: TdnSplitter
    Left = 441
    Top = 0
    AlignControl = pnlHTML
    ResizeStyle = rsLine
    Size = 5
    ButtonVisible = False
  end
  object dnSplitterPhone: TdnSplitter
    Left = 153
    Top = 8
    ResizeStyle = rsLine
    Size = 5
    ButtonVisible = False
  end
  object pnlHTML: TPanel
    Left = 0
    Top = 0
    Width = 441
    Height = 229
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 3
    object pnlACC: TPanel
      Left = 0
      Top = 0
      Width = 441
      Height = 37
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      DesignSize = (
        441
        37)
      object lblACCNT: TLabel
        Left = 12
        Top = 13
        Width = 52
        Height = 13
        Caption = #8470' '#1083'. '#1089#1095#1077#1090
      end
      object dbeACCOUNT_NO: TDBEditEh
        Tag = 1
        Left = 80
        Top = 5
        Width = 355
        Height = 32
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        BorderStyle = bsNone
        DataField = 'ACCOUNT_NO'
        DataSource = srcCustomer
        DynProps = <>
        EditButtons = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        Visible = True
      end
    end
    object HtmlViewer: THtmlViewer
      Left = 0
      Top = 37
      Width = 441
      Height = 192
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      ParentCustomHint = False
      BorderStyle = htNone
      DefFontName = 'Tahoma'
      HistoryMaxCount = 0
      HtOptions = []
      NoSelect = False
      PrintMarginBottom = 2.000000000000000000
      PrintMarginLeft = 2.000000000000000000
      PrintMarginRight = 2.000000000000000000
      PrintMarginTop = 2.000000000000000000
      PrintScale = 1.000000000000000000
      Align = alClient
      PopupMenu = pmHV
      TabOrder = 0
      OnKeyUp = HtmlViewerKeyUp
      Touch.InteractiveGestures = [igPan]
      Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia]
    end
  end
  object dsContacts: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure Customer_Contacts_Iu(:Customer_Id, :Cc_Value, ' +
        ':Cc_Type, :Cc_Notice, :Cc_Notify, :OLD_CC_VALUE) ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CUSTOMER_CONTACTS'
      'WHERE'
      '        CUSTOMER_ID = :OLD_CUSTOMER_ID'
      '    and CC_VALUE = :OLD_CC_VALUE'
      '    ')
    InsertSQL.Strings = (
      
        'execute procedure Customer_Contacts_Iu(:Customer_Id, :Cc_Value, ' +
        ':Cc_Type, :Cc_Notice, :Cc_Notify, null)')
    RefreshSQL.Strings = (
      'select'
      '    cc.CUSTOMER_ID'
      '  , cc.CC_VALUE'
      '  , cc.CC_TYPE'
      '  , coalesce(cc.Cc_Notify, 0) Cc_Notify'
      '  , cc.CC_NOTICE'
      '  , o.O_Name'
      '  from customer_contacts cc'
      '       inner join OBJECTS o on (o.O_Id = cc.Cc_Type and'
      '             o.O_TYPE = 45 and'
      '             o.O_DELETED = 0)'
      'where CC.CUSTOMER_ID = :OLD_CUSTOMER_ID'
      '    and CC.CC_VALUE = :OLD_CC_VALUE'
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    cc.CUSTOMER_ID'
      '  , cc.CC_VALUE'
      '  , cc.CC_TYPE'
      '  , coalesce(cc.Cc_Notify, 0) Cc_Notify'
      '  , cc.CC_NOTICE'
      '  , o.O_Name'
      '  from customer_contacts cc'
      '       inner join OBJECTS o on (o.O_Id = cc.Cc_Type and'
      '             o.O_TYPE = 45 and'
      '             o.O_DELETED = 0)'
      '  where customer_id = :CUSTOMER_ID'
      '  order by CC_TYPE, CC_VALUE')
    AutoCalcFields = False
    BeforePost = dsContactsBeforePost
    OnNewRecord = dsContactsNewRecord
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 590
    Top = 147
    WaitEndMasterScroll = True
  end
  object srcContacts: TDataSource
    AutoEdit = False
    DataSet = dsContacts
    OnUpdateData = srcContactsUpdateData
    Left = 519
    Top = 143
  end
  object pmRecalc: TPopupMenu
    Left = 352
    Top = 159
    object N2: TMenuItem
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1074#1089#1077#1084
      OnClick = N2Click
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
    Left = 796
    Top = 50
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
    Left = 840
    Top = 50
  end
  object actlst1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 296
    Top = 160
    object actMakeCall: TAction
      Hint = #1055#1086#1079#1074#1086#1085#1080#1090#1100' ('#1085#1072#1087#1080#1089#1072#1090#1100') '#1085#1072' '#1082#1086#1085#1090#1072#1082#1090
      ImageIndex = 81
      OnExecute = actMakeCallExecute
    end
    object actCAdd: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1085#1090#1072#1082#1090
      ImageIndex = 2
      OnExecute = actCAddExecute
    end
    object actCEdit: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1082#1086#1085#1090#1072#1082#1090
      ImageIndex = 89
      OnExecute = actCEditExecute
    end
    object actCDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1082#1086#1085#1090#1072#1082#1090
      ImageIndex = 3
      OnExecute = actCDelExecute
    end
  end
  object pmHV: TPopupMenu
    Left = 98
    Top = 34
    object miCopy: TMenuItem
      Caption = #1057#1082#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = miCopyClick
    end
  end
  object dsCustomer: TpFIBDataSet
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 88
    Top = 155
    WaitEndMasterScroll = True
  end
  object PropStorageEh: TPropStorageEh
    Section = 'INFO_PANEL'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      'pnlAddInfo.pnlDP.<P>.Width'
      'pnlHTML.<P>.Width')
    OnWriteCustomProps = PropStorageEhWriteCustomProps
    OnReadProp = PropStorageEhReadProp
    Left = 282
    Top = 41
  end
  object srcCustomer: TDataSource
    DataSet = dsCustomer
    OnDataChange = srcCustomerDataChange
    Left = 178
    Top = 162
  end
  object pmMemo: TPopupMenu
    Left = 780
    Top = 144
    object miN1: TMenuItem
      Caption = #1056#1072#1089#1087#1086#1083#1086#1078#1077#1085#1080#1077' '#1087#1088#1080#1084#1077#1095#1072#1085#1080#1103
      OnClick = miN1Click
    end
  end
end
