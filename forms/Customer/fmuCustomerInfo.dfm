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
  KeyPreview = True
  OldCreateOrder = False
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlInfo: TPanel
    Left = 0
    Top = 0
    Width = 428
    Height = 229
    Align = alLeft
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    DesignSize = (
      428
      229)
    object Label11: TLabel
      Left = 5
      Top = 168
      Width = 36
      Height = 13
      Caption = #1057#1090#1072#1090#1091#1089
    end
    object lblPN: TLabel
      Left = 5
      Top = 102
      Width = 42
      Height = 13
      Caption = #1055#1072#1089#1087#1086#1088#1090
    end
    object Label6: TLabel
      Left = 5
      Top = 80
      Width = 31
      Height = 13
      Caption = #1040#1076#1088#1077#1089
    end
    object Label5: TLabel
      Left = 5
      Top = 13
      Width = 52
      Height = 13
      Caption = #8470' '#1083'. '#1089#1095#1077#1090
    end
    object Label3: TLabel
      Left = 5
      Top = 58
      Width = 23
      Height = 13
      Caption = #1060#1048#1054
    end
    object lblPREG: TLabel
      Left = 215
      Top = 102
      Width = 33
      Height = 13
      Caption = #1074#1099#1076#1072#1085
    end
    object Label10: TLabel
      Left = 5
      Top = 36
      Width = 43
      Height = 13
      Caption = #1044#1086#1075#1086#1074#1086#1088
    end
    object Label2: TLabel
      Left = 258
      Top = 36
      Width = 64
      Height = 13
      Caption = #1044#1072#1090#1072' '#1087#1086#1076#1082#1083'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 150
      Top = 36
      Width = 12
      Height = 13
      Caption = #1086#1090
    end
    object lblBD: TLabel
      Left = 5
      Top = 146
      Width = 14
      Height = 13
      Caption = #1044#1056
    end
    object lblPR: TLabel
      Left = 5
      Top = 124
      Width = 48
      Height = 13
      Caption = #1055#1088#1086#1087#1080#1089#1082#1072
    end
    object edtPASSPORT_NUMBER: TDBEditEh
      Tag = 1
      Left = 62
      Top = 101
      Width = 147
      Height = 18
      Hint = #1055#1072#1089#1087#1086#1088#1090' '#1053#1086#1084#1077#1088' '#1057#1077#1088#1080#1103
      BorderStyle = bsNone
      DataField = 'PASSPORT_NUMBER'
      DataSource = ds
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      Visible = True
    end
    object dbeACCOUNT_NO: TDBEditEh
      Tag = 1
      Left = 62
      Top = 5
      Width = 366
      Height = 32
      AutoSize = False
      BorderStyle = bsNone
      DataField = 'ACCOUNT_NO'
      DataSource = ds
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
    object edtPASP_REG: TDBEditEh
      Tag = 1
      Left = 254
      Top = 101
      Width = 174
      Height = 18
      Hint = #1055#1072#1089#1087#1086#1088#1090' '#1082#1077#1084' '#1080' '#1082#1086#1075#1076#1072' '#1074#1099#1076#1072#1085
      BorderStyle = bsNone
      DataField = 'PASSPORT_REGISTRATION'
      DataSource = ds
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Visible = True
    end
    object DBDateTimeEditCONTRACT_DATE: TDBDateTimeEditEh
      Tag = 8
      Left = 166
      Top = 36
      Width = 86
      Height = 18
      Hint = #1044#1072#1090#1072' '#1076#1086#1075#1086#1074#1086#1088#1072
      AutoSize = False
      BorderStyle = bsNone
      DataField = 'CONTRACT_DATE'
      DataSource = ds
      DynProps = <>
      EditButton.Visible = False
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Kind = dtkDateEh
      ParentColor = True
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object DBDateTimeEditEh1: TDBDateTimeEditEh
      Tag = 8
      Left = 327
      Top = 36
      Width = 101
      Height = 18
      Hint = #1044#1072#1090#1072' '#1087#1077#1088#1074#1086#1075#1086' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
      BorderStyle = bsNone
      DataField = 'ACTIVIZ_DATE'
      DataSource = ds
      DynProps = <>
      EditButton.Visible = False
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Kind = dtkDateEh
      ParentColor = True
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object DBEdit9: TDBEditEh
      Tag = 1
      Left = 62
      Top = 36
      Width = 79
      Height = 18
      Hint = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
      BorderStyle = bsNone
      DataField = 'DOGOVOR_NO'
      DataSource = ds
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Visible = True
    end
    object edFIO: TEdit
      Left = 62
      Top = 58
      Width = 366
      Height = 18
      Hint = #1060#1072#1084#1080#1083#1080#1103' '#1048#1084#1103' '#1054#1090#1095#1077#1095#1090#1074#1086
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      Text = 'FIO'
    end
    object edtAddress: TEdit
      Left = 62
      Top = 79
      Width = 366
      Height = 18
      Hint = #1040#1076#1088#1077#1089' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      Text = #1040#1076#1088#1077#1089' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
    end
    object memState: TDBMemoEh
      Left = 62
      Top = 168
      Width = 366
      Height = 59
      Hint = #1057#1090#1072#1090#1091#1089' '#1091#1089#1083#1091#1075'. '#1082#1086#1075#1076#1072' '#1080' '#1082#1072#1082' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1086
      Align = alCustom
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'CUST_STATE_DESCR'
      DataSource = ds
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
      Visible = True
      WantReturns = True
    end
    object edBIRTHDAY: TDBDateTimeEditEh
      Tag = 8
      Left = 62
      Top = 144
      Width = 79
      Height = 18
      Hint = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
      AutoSize = False
      BorderStyle = bsNone
      DataField = 'BIRTHDAY'
      DataSource = ds
      DynProps = <>
      EditButton.Visible = False
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      Kind = dtkDateEh
      ParentColor = True
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 9
      Visible = True
    end
    object edtBP: TDBEditEh
      Tag = 1
      Left = 136
      Top = 144
      Width = 292
      Height = 18
      Hint = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
      Anchors = [akLeft, akTop, akRight]
      BorderStyle = bsNone
      DataField = 'CONTRACT_BASIS'
      DataSource = ds
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
      Visible = True
    end
    object edtPASSPORT_REGISTRATION: TDBEditEh
      Tag = 1
      Left = 62
      Top = 122
      Width = 366
      Height = 18
      Hint = #1040#1076#1088#1077#1089' '#1087#1088#1086#1087#1080#1089#1082#1080
      BorderStyle = bsNone
      DataField = 'ADRES_REGISTR'
      DataSource = ds
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      Visible = True
    end
  end
  object pnlAddInfo: TPanel
    Left = 433
    Top = 0
    Width = 513
    Height = 229
    Align = alClient
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object Splitter1: TdnSplitter
      Left = 257
      Top = 0
      AlignControl = pnlDP
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
        Top = 58
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
      object gbSaldo: TGroupBox
        Left = 0
        Top = 0
        Width = 257
        Height = 58
        Hint = #1057#1072#1083#1100#1076#1086' '#1088#1072#1089#1095#1077#1090#1086#1074
        Align = alTop
        Caption = ' '#1057#1072#1083#1100#1076#1086' '
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object DBTextDebt: TDBText
          Left = 2
          Top = 15
          Width = 111
          Height = 25
          Align = alClient
          Alignment = taCenter
          AutoSize = True
          DataField = 'DEBT_SUM'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object pnlPrepay: TPanel
          Left = 2
          Top = 39
          Width = 253
          Height = 17
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
            Width = 84
            Height = 19
            Hint = #1054#1073#1077#1097#1072#1085#1085#1099#1081' '#1087#1083#1072#1090#1077#1078
            Align = alClient
            Alignment = taCenter
            AutoSize = True
            DataField = 'PREPAY'
            DataSource = ds
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
        Top = 77
        Width = 257
        Height = 152
        Align = alClient
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        object dbgrdhContacts: TDBGridEh
          Left = 0
          Top = 18
          Width = 257
          Height = 134
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
            Height = 13
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
            Height = 13
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
    object GroupBox2: TGroupBox
      Left = 262
      Top = 0
      Width = 251
      Height = 229
      Align = alClient
      Caption = ' '#1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '
      TabOrder = 1
      DesignSize = (
        251
        229)
      object memCustNotice: TDBMemoEh
        Left = 2
        Top = 15
        Width = 247
        Height = 212
        Align = alClient
        AutoSize = False
        BorderStyle = bsNone
        Color = clWhite
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1056#1077#1076#1072#1082#1090#1080#1088#1091#1077#1084#1086#1077' '#1087#1086#1083#1077'. '
        MaxLength = 999
        TabOrder = 0
        Visible = True
        WantReturns = True
        OnExit = memCustNoticeExit
        OnKeyPress = memCustNoticeKeyPress
      end
      object btnSaveNotice: TButton
        Left = 173
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
  object dnSplitter1: TdnSplitter
    Left = 428
    Top = 0
    AlignControl = pnlInfo
    ResizeStyle = rsLine
    Size = 5
    ButtonVisible = False
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
  object ds: TDataSource
    AutoEdit = False
    OnDataChange = srcCustomerDataChange
    Left = 259
    Top = 164
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
    Left = 304
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
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 208
    Top = 160
  end
end
