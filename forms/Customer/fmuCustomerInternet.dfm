object apgCustomerInternet: TapgCustomerInternet
  Left = 0
  Top = 0
  Caption = #1048#1085#1090#1077#1088#1085#1077#1090
  ClientHeight = 261
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdBill: TDBGridEh
    Left = 26
    Top = 0
    Width = 725
    Height = 261
    Align = alClient
    AllowedOperations = []
    DataSource = srcInternet
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    TabOrder = 0
    TitleParams.MultiTitle = True
    OnDblClick = dbgrdBillDblClick
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'LOGIN'
        Footers = <>
        Width = 87
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IP_INET'
        Footers = <>
        Title.Caption = 'IP'
        Width = 95
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'UNIT_ID'
        Footers = <>
        Title.Caption = 'USER ID'
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACCOUNT_ID'
        Footers = <>
        Title.Caption = 'ACCOUNT N'
        Width = 74
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'BLOCKED'
        Footers = <>
        Title.Caption = #1041#1083#1086#1082
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'VPN'
        Footers = <>
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 261
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      26
      261)
    object btnDel1: TSpeedButton
      Left = 2
      Top = 238
      Width = 22
      Height = 22
      Action = actDelete
      Anchors = [akLeft, akBottom]
      Flat = True
      Layout = blGlyphTop
    end
    object btnAdd1: TSpeedButton
      Left = 2
      Top = 3
      Width = 22
      Height = 22
      Action = actAdd
      Flat = True
    end
    object btnEdit1: TSpeedButton
      Left = 2
      Top = 31
      Width = 22
      Height = 22
      Action = actEdit
      Flat = True
    end
    object btnOpen: TSpeedButton
      Left = 2
      Top = 67
      Width = 22
      Height = 22
      Action = actUnblock
      Flat = True
    end
  end
  object srcInternet: TDataSource
    AutoEdit = False
    DataSet = dsInternet
    OnStateChange = srcInternetStateChange
    Left = 66
    Top = 35
  end
  object dsInternet: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE BILLING'
      'SET '
      '    ACCOUNT_ID = :ACCOUNT_ID,'
      '    UNIT_ID = :UNIT_ID,'
      '    NOTICE = :NOTICE,'
      '    BLOCKED = :BLOCKED'
      'WHERE'
      '    BLNG_ID = :OLD_BLNG_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    BILLING'
      'WHERE'
      '        BLNG_ID = :OLD_BLNG_ID'
      '    ')
    RefreshSQL.Strings = (
      'SELECT f.*'
      'FROM BILLING f'
      'where(  f.CUSTOMER_ID = :CUSTOMER_ID'
      '     ) and (     F.BLNG_ID = :OLD_BLNG_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT f.*'
      'FROM BILLING f'
      'where f.CUSTOMER_ID = :CUSTOMER_ID')
    AutoUpdateOptions.UpdateTableName = 'DISCOUNT_FACTOR'
    AutoUpdateOptions.KeyFields = 'DISCOUNT_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 63
    Top = 85
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 194
    Top = 81
    object actAdd: TAction
      Category = 'Billing'
      Hint = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100' '#1074' '#1073#1080#1083#1083#1080#1085#1075#1077
      ImageIndex = 17
      OnExecute = actAddExecute
    end
    object actEdit: TAction
      Category = 'Billing'
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100'/'#1076#1086#1073#1072#1074#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1076#1083#1103' '#1048#1085#1090#1077#1088#1085#1077#1090' '#1074#1088#1091#1095#1085#1091#1102' '
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actDelete: TAction
      Category = 'Billing'
      ImageIndex = 3
      OnExecute = actDeleteExecute
    end
    object actUnblock: TAction
      Category = 'Billing'
      ImageIndex = 16
      OnExecute = actUnblockExecute
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
    Left = 548
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
    Left = 592
    Top = 26
  end
end
