inherited DocListForm: TDocListForm
  Left = 411
  Top = 154
  Caption = #1056#1077#1077#1089#1090#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 564
  ClientWidth = 698
  Menu = mmDoc
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object splitter: TSplitter [0]
    Left = 0
    Top = 397
    Width = 698
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    Visible = False
  end
  inherited splPG: TSplitter
    Top = 297
    Width = 698
  end
  inherited dbGrid: TDBGridEh
    Top = 301
    Width = 698
    Height = 96
    AllowedOperations = []
    FooterRowCount = 1
    SumList.Active = True
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DT_NAME'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DOC_TYPE'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DOC_NUMBER'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SURNAME'
        Footers = <>
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FIRSTNAME'
        Footers = <>
        Title.Caption = #1048#1084#1103
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MIDLENAME'
        Footers = <>
        Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DOC_REG'
        Footers = <>
        Title.Caption = #1052#1077#1089#1090#1086' '#1074#1099#1076#1072#1095#1080
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DOC_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PERSONAL_N'
        Footers = <>
        Title.Caption = #1052#1086#1073'. '#1085#1086#1084#1077#1088
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'BIRTHDAY'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDR_BIRTH'
        Footers = <>
        Title.Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDR_REGISTR'
        Footers = <>
        Title.Caption = #1040#1076#1088#1077#1089' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_BY'
        Footers = <>
        Title.Caption = #1050#1090#1086' '#1074#1085#1077#1089
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'ADDED_ON'
        Footers = <>
        Title.Caption = #1050#1086#1075#1076#1072' '#1074#1085#1077#1089
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_BY'
        Footers = <>
        Title.Caption = #1050#1090#1086' '#1080#1089#1087#1088#1072#1074#1080#1083
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EDIT_ON'
        Footers = <>
        Title.Caption = #1050#1086#1075#1076#1072' '#1080#1089#1087#1088#1072#1074#1080#1083
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CF_ID'
        Footers = <>
        Title.TitleButton = True
        Visible = False
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'IN_BLACK_LIST'
        Footers = <>
        Title.Caption = #1042' "'#1095#1077#1088#1085#1086#1084'" '#1089#1087#1080#1089#1082#1077
        Title.TitleButton = True
      end>
  end
  inherited tlbMain: TToolBar
    Width = 698
    inherited ToolButton5: TToolButton
      Width = 8
      Visible = False
    end
    inherited ToolButton6: TToolButton
      Left = 59
      Visible = False
    end
    inherited btnDelete: TToolButton
      Left = 63
      Hint = #1059#1076#1072#1083#1080#1090#1100
      Action = nil
      Caption = ''
      Enabled = False
      Visible = False
      OnClick = actDeleteExecute
    end
    inherited ToolButton9: TToolButton
      Left = 86
      Visible = False
    end
    inherited tbOk: TToolButton
      Left = 101
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Left = 124
      Visible = False
    end
    inherited tbCancel: TToolButton
      Left = 128
      Visible = False
    end
    inherited ToolButton20: TToolButton
      Left = 151
    end
    inherited btnQuickFilter: TToolButton
      Left = 159
      Hint = #1041#1099#1089#1090#1088#1099#1081' '#1092#1080#1083#1100#1090#1088
    end
    object btn2: TToolButton
      Left = 182
      Top = 0
      Width = 8
      Caption = 'btn2'
      ImageIndex = 42
      Style = tbsSeparator
    end
    object btnHistory: TToolButton
      Left = 190
      Top = 0
      Action = actHistory
    end
    object btn1: TToolButton
      Left = 213
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 10
      Style = tbsSeparator
      Visible = False
    end
    object btnFindCustomer: TToolButton
      Left = 221
      Top = 0
      Action = actFindCustomer
      Visible = False
    end
  end
  object pnlHistory: TPanel [4]
    Left = 0
    Top = 400
    Width = 698
    Height = 164
    Align = alBottom
    Caption = 'pnlHistory'
    TabOrder = 3
    Visible = False
    object dbgHistory: TDBGridEh
      Left = 28
      Top = 1
      Width = 669
      Height = 162
      Align = alClient
      AllowedOperations = []
      DataSource = srcHistory
      DynProps = <>
      Flat = True
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      SearchPanel.Enabled = True
      SearchPanel.FilterOnTyping = False
      TabOrder = 1
      OnDblClick = dbgHistoryDblClick
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'O_NAME'
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1092#1072#1081#1083#1072
          Title.TitleButton = True
          Width = 78
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CF_ID'
          Footers = <>
          Title.TitleButton = True
          Visible = False
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 134
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CF_TYPE'
          Footers = <>
          Title.TitleButton = True
          Visible = False
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 244
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CUSTOMER_ID'
          Footers = <>
          Title.TitleButton = True
          Visible = False
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FILENAME'
          Footers = <>
          Title.TitleButton = True
          Visible = False
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ACCOUNT_NO'
          Footers = <>
          Title.Caption = #1051'/'#1057
          Title.TitleButton = True
          Width = 72
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'CUST_CODE'
          Footers = <>
          Title.Caption = #1050#1086#1076
          Title.TitleButton = True
          Width = 73
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FIO'
          Footers = <>
          Title.Caption = #1060#1048#1054
          Title.TitleButton = True
          Width = 225
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DEBT_SUM'
          Footers = <>
          Title.Caption = #1057#1072#1083#1100#1076#1086
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STREET_NAME'
          Footers = <>
          Title.Caption = #1059#1083#1080#1094#1072
          Title.TitleButton = True
          Width = 158
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'HOUSE_NO'
          Footers = <>
          Title.Caption = #1044#1086#1084
          Title.TitleButton = True
          Width = 51
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FLAT_NO'
          Footers = <>
          Title.Caption = #1050#1074'-'#1088#1072
          Title.TitleButton = True
          Width = 58
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ACT'
          Footers = <>
          Title.Caption = #1054#1073#1088'.'
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ANOTICE'
          Footers = <>
          Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077' '#1086#1073#1088'.'
          Title.TitleButton = True
          Width = 288
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_ON'
          Footers = <>
          Title.Caption = #1050#1086#1075#1076#1072' '#1074#1085#1077#1089
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ADDED_BY'
          Footers = <>
          Title.Caption = #1050#1090#1086' '#1074#1085#1077#1089
          Title.TitleButton = True
          Width = 88
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EDIT_ON'
          Footers = <>
          Title.Caption = #1050#1086#1075#1076#1072' '#1080#1079#1084#1077#1085#1080#1083
          Title.TitleButton = True
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'EDIT_BY'
          Footers = <>
          Title.Caption = #1050#1090#1086' '#1080#1079#1084#1077#1085#1080#1083
          Title.TitleButton = True
          Width = 96
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object pnl1: TPanel
      Left = 1
      Top = 1
      Width = 27
      Height = 162
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object btnCustHist: TSpeedButton
        Left = 2
        Top = 2
        Width = 23
        Height = 22
        Action = actCustHist
        Flat = True
      end
      object btnOpen: TSpeedButton
        Left = 2
        Top = 32
        Width = 23
        Height = 22
        Action = actViewDoc
        Flat = True
      end
    end
  end
  inherited pnlEdit: TPanel
    Width = 698
    Height = 272
    object lbl9: TLabel [0]
      Tag = 1
      Left = 221
      Top = 161
      Width = 71
      Height = 13
      Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076'-'#1103
    end
    object lbl3: TLabel [1]
      Tag = 1
      Left = 221
      Top = 135
      Width = 48
      Height = 13
      Caption = #1055#1088#1086#1087#1080#1089#1082#1072
    end
    object lbl21: TLabel [2]
      Tag = 1
      Left = 4
      Top = 110
      Width = 68
      Height = 13
      Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
    end
    object Label2: TLabel [3]
      Tag = 1
      Left = 221
      Top = 110
      Width = 55
      Height = 13
      Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085
    end
    object Label4: TLabel [4]
      Tag = 1
      Left = 4
      Top = 34
      Width = 44
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
    end
    object Label5: TLabel [5]
      Tag = 1
      Left = -76
      Top = 59
      Width = 19
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1048#1084#1103
    end
    object Label6: TLabel [6]
      Tag = 1
      Left = -76
      Top = 84
      Width = 49
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
    end
    object lbl2: TLabel [7]
      Tag = 1
      Left = 4
      Top = 161
      Width = 80
      Height = 13
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
    end
    object lbl31: TLabel [8]
      Tag = 1
      Left = 5
      Top = 135
      Width = 71
      Height = 13
      Caption = #1052#1086#1073'. '#1090#1077#1083#1077#1092#1086#1085
    end
    inherited btnSaveLink: TBitBtn
      Left = 99
      Top = 241
      Width = 480
      TabOrder = 12
    end
    inherited btnCancelLink: TBitBtn
      Left = 584
      Top = 241
      Width = 108
      TabOrder = 13
    end
    object edtPlaceBirth: TDBEditEh
      Tag = 1
      Left = 295
      Top = 158
      Width = 397
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ADDR_BIRTH'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
      ShowHint = True
      TabOrder = 10
      Visible = True
      OnChange = mmoNoticeChange
    end
    object edtADRES_REGISTR: TDBEditEh
      Tag = 1
      Left = 295
      Top = 132
      Width = 397
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'ADDR_REGISTR'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1040#1076#1088#1077#1089' '#1087#1088#1086#1087#1080#1089#1082#1080' ('#1077#1089#1083#1080' '#1086#1090#1083#1080#1095#1072#1077#1090#1089#1103' '#1086#1090' '#1072#1076#1088#1077#1089#1072' '#1091#1089#1090#1072#1085#1086#1074#1082#1080')'
      ShowHint = True
      TabOrder = 8
      Visible = True
      OnChange = mmoNoticeChange
    end
    object edtDOCDATE: TDBDateTimeEditEh
      Tag = 1
      Left = 99
      Top = 107
      Width = 116
      Height = 21
      DataField = 'DOC_DATE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 5
      Visible = True
      OnChange = mmoNoticeChange
    end
    object edtRegistration: TDBEditEh
      Tag = 1
      Left = 295
      Top = 107
      Width = 397
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DOC_REG'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1050#1077#1084' '#1074#1099#1076#1072#1085
      ShowHint = True
      TabOrder = 6
      Visible = True
      OnChange = mmoNoticeChange
    end
    object edtNUMBER: TDBEditEh
      Tag = 1
      Left = 99
      Top = 6
      Width = 593
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      DataField = 'DOC_NUMBER'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnChange = mmoNoticeChange
      OnExit = edtNUMBERExit
    end
    object edtSURNAME: TDBEditEh
      Left = 99
      Top = 31
      Width = 593
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'SURNAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1060#1072#1084#1080#1083#1080#1103
      ShowHint = True
      TabOrder = 2
      Visible = True
      OnChange = mmoNoticeChange
      OnExit = edtSURNAMEExit
    end
    object edtFIRSTNAME: TDBEditEh
      Tag = 1
      Left = 99
      Top = 56
      Width = 593
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'FIRSTNAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1048#1084#1103
      ShowHint = True
      TabOrder = 3
      Visible = True
      OnChange = mmoNoticeChange
      OnExit = edtSURNAMEExit
    end
    object edtMIDLENAME: TDBEditEh
      Tag = 1
      Left = 99
      Top = 81
      Width = 593
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'MIDLENAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1090#1095#1077#1089#1090#1074#1086
      ShowHint = True
      TabOrder = 4
      Visible = True
      OnChange = mmoNoticeChange
      OnExit = edtSURNAMEExit
    end
    object mmoNotice: TDBMemoEh
      Left = 4
      Top = 185
      Width = 688
      Height = 50
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 11
      Visible = True
      WantReturns = True
      OnChange = mmoNoticeChange
    end
    object cbType: TDBComboBoxEh
      Left = 4
      Top = 6
      Width = 91
      Height = 21
      DataField = 'DOC_TYPE'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      EditButtons = <>
      Items.Strings = (
        #1055#1072#1089#1087#1086#1088#1090)
      KeyItems.Strings = (
        '1')
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = mmoNoticeChange
    end
    object edtBIRTHDAY: TDBDateTimeEditEh
      Tag = 1
      Left = 99
      Top = 158
      Width = 116
      Height = 21
      DataField = 'BIRTHDAY'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 9
      Visible = True
      OnChange = mmoNoticeChange
    end
    object edtMOBILE: TDBEditEh
      Tag = 1
      Left = 99
      Top = 132
      Width = 116
      Height = 21
      DataField = 'PERSONAL_N'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1084#1086#1073'. '#1090#1077#1083#1077#1092#1086#1085
      ShowHint = True
      TabOrder = 7
      Visible = True
      OnChange = mmoNoticeChange
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsDOCS
    Left = 48
    Top = 224
  end
  inherited actions: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 118
    Top = 216
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = actEditExecute
    end
    object actHistory: TAction
      Caption = #1048#1089#1090#1086#1088#1080#1103' '#1082#1072#1088#1090#1086#1095#1082#1080
      Hint = #1055#1086#1082#1072#1079#1072#1090#1100' '#1080#1089#1090#1086#1088#1080#1102' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      ImageIndex = 34
      ShortCut = 16456
      OnExecute = actHistoryExecute
    end
    object actFindCustomer: TAction
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072'/'#1086#1074' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1082#1072#1088#1090
      ImageIndex = 9
      OnExecute = actFindCustomerExecute
    end
    object actCustHist: TAction
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072'/'#1086#1074' '#1080#1079' '#1080#1089#1090#1086#1088#1080#1080' '#1082#1072#1088#1090#1099
      ImageIndex = 9
      OnExecute = actCustHistExecute
    end
    object actViewDoc: TAction
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1072#1081#1083#1072
      ImageIndex = 41
      OnExecute = actViewDocExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 179
    Top = 231
    object miNew: TMenuItem [0]
      Action = actNew
    end
    object miEdit: TMenuItem [1]
      Action = actEdit
    end
    object miN2: TMenuItem [2]
      Caption = '-'
    end
    object miHistory: TMenuItem [3]
      Action = actHistory
    end
    inherited mniN1: TMenuItem [4]
    end
    inherited mniFilterFLD: TMenuItem [5]
    end
    object miN1: TMenuItem [6]
      Caption = '-'
    end
  end
  inherited CnErrors: TCnErrorProvider
    Left = 264
    Top = 224
  end
  object dsDOCS: TpFIBDataSet
    UpdateSQL.Strings = (
      'update Doc_List'
      'set Doc_Type = :Doc_Type,'
      '    Doc_Number = :Doc_Number,'
      '    Surname = :Surname,'
      '    Firstname = :Firstname,'
      '    Midlename = :Midlename,'
      '    Doc_Reg = :Doc_Reg,'
      '    Doc_Date = :Doc_Date,'
      '    Personal_N = :Personal_N,'
      '    Birthday = :Birthday,'
      '    Addr_Registr = :Addr_Registr,'
      '    Addr_Birth = :Addr_Birth,'
      '    Notice = :Notice'
      'where (Doc_Type = :OLD_Doc_Type)'
      '      and (Doc_Number = :OLD_Doc_Number)')
    DeleteSQL.Strings = (
      'delete from Doc_List'
      '    where (Doc_Type = :Doc_Type)'
      '          and (Doc_Number = :Doc_Number)'
      ''
      '  ')
    InsertSQL.Strings = (
      
        'insert into Doc_List (Doc_Type, Doc_Number, Surname, Firstname, ' +
        'Midlename, Doc_Reg, Doc_Date, Personal_N, Birthday, Addr_Registr' +
        ', Addr_Birth, Notice)'
      
        'values (:Doc_Type, :Doc_Number, :Surname, :Firstname, :Midlename' +
        ', :Doc_Reg, :Doc_Date, :Personal_N, :Birthday, :Addr_Registr, :A' +
        'ddr_Birth, :Notice)')
    RefreshSQL.Strings = (
      'select'
      '    d.*'
      '  , o.O_Name DT_NAME'
      '  , iif(exists(select'
      '                   O_ID'
      '                 from OBJECTS o'
      '                 where O_TYPE = 31'
      
        '                       and o.O_NAME = d.Doc_Number), 1, 0) IN_BL' +
        'ACK_LIST  '
      '  from Doc_LIST d'
      
        '       left outer join objects o on (o.O_Type = 66 and o.O_id = ' +
        'd.Doc_Type)'
      'where (Doc_Type = :OLD_Doc_Type)'
      '      and (Doc_Number = :OLD_Doc_Number)       ')
    SelectSQL.Strings = (
      'select'
      '    d.*'
      '  , o.O_Name DT_NAME'
      '  , iif(exists(select'
      '                   O_ID'
      '                 from OBJECTS o'
      '                 where O_TYPE = 31'
      
        '                       and o.O_NAME = d.Doc_Number), 1, 0) IN_BL' +
        'ACK_LIST'
      '  from Doc_LIST d'
      
        '       left outer join objects o on (o.O_Type = 66 and o.O_id = ' +
        'd.Doc_Type)')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 583
    Top = 212
  end
  object dsHistory: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    T.O_NAME'
      '  , CF.Cf_Id'
      '  , cf.Name'
      '  , cf.Cf_Type'
      '  , cf.Notice'
      '  , cf.Customer_Id'
      '  , cf.FILENAME'
      '  , cf.Act'
      '  , cf.ANotice'
      '  , cf.Added_On'
      '  , coalesce((select first 1'
      '                  W.SURNAME'
      '                from WORKER W'
      
        '                where W.IBNAME = cf.Added_By), cf.Added_By) as A' +
        'dded_By'
      '  , cf.Edit_On'
      '  , coalesce((select first 1'
      '                  W.SURNAME'
      '                from WORKER W'
      
        '                where W.IBNAME = cf.Edit_By), cf.Edit_By) as Edi' +
        't_By'
      '  , c.account_no'
      '  , c.cust_code'
      '  , c.surname || coalesce('#39' '#39' || c.initials, '#39#39') fio'
      '  , c.debt_sum'
      '  , s.street_name'
      '  , h.house_no'
      '  , c.flat_no'
      '  from CUSTOMER_FILES CF'
      '       inner join OBJECTS T on (CF.Cf_Type = T.O_ID and'
      '             T.O_TYPE = 33)'
      '       inner join customer c on (cf.customer_id = c.customer_id)'
      '       inner join house h on (c.house_id = h.house_id)'
      '       inner join street s on (h.street_id = s.street_id)'
      '  where (cf.Name like '#39'%'#39' || :DOC_NUMBER || '#39'%'#39')'
      '          or (cf.Addons like '#39'%"pn":"'#39' || :DOC_NUMBER || '#39'"%'#39')')
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    DataSource = srcDataSource
    Left = 272
    Top = 352
    WaitEndMasterScroll = True
  end
  object srcHistory: TDataSource
    AutoEdit = False
    DataSet = dsHistory
    Left = 344
    Top = 352
  end
  object Query: TpFIBQuery
    Transaction = trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select'
      '    C.ACCOUNT_NO, C.SURNAME, C.FIRSTNAME, '
      '    C.MIDLENAME, C.CUST_CODE, '
      '    C.CUST_STATE_DESCR, C.DEBT_SUM, '
      '    C.DOGOVOR_NO, f.Porch_N, f.Floor_N'
      '  from house h'
      
        '       left outer join customer c on (c.House_Id = h.House_Id an' +
        'd c.Flat_No = :flat_no)'
      
        '       left outer join HOUSEFLATS f on (f.House_Id = h.House_Id ' +
        'and f.Flat_No = :flat_no)'
      '  where h.House_Id=:house_id   ')
    Left = 130
    Top = 446
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
    Left = 212
    Top = 444
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
    Left = 302
    Top = 442
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
    Left = 374
    Top = 450
  end
  object qRead: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select Content from Customer_Files where Cf_Id = :Cf_Id')
    Left = 456
    Top = 480
  end
  object mmDoc: TMainMenu
    Left = 160
    Top = 81
    object miDL: TMenuItem
      Caption = #1056#1077#1077#1089#1090#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      GroupIndex = 2
      object miFindCustomer: TMenuItem
        Action = actFindCustomer
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072'/'#1086#1074' '#1074#1099#1076#1077#1083#1077#1085#1085#1099#1093' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      end
      object miCustHist: TMenuItem
        Action = actCustHist
        Caption = #1054#1090#1082#1088#1099#1090#1100' '#1072#1073#1086#1085#1077#1085#1090#1072'/'#1086#1074' '#1080#1079' '#1080#1089#1090#1086#1088#1080#1080' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      end
      object miViewDoc: TMenuItem
        Action = actViewDoc
        Caption = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1072#1081#1083#1072
      end
      object miN3: TMenuItem
        Caption = '-'
      end
      object miDelete: TMenuItem
        Action = actDelete
      end
    end
  end
end
