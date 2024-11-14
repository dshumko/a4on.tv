inherited WorkersForm: TWorkersForm
  Left = 217
  Top = 222
  Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
  ClientHeight = 537
  ClientWidth = 823
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 273
    Width = 823
  end
  inherited dbGrid: TDBGridEh
    Top = 277
    Width = 823
    Height = 260
    AllowedOperations = []
    OddRowColor = clInfoBk
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WORKER_ID'
        Footers = <>
        Visible = False
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SURNAME'
        Footers = <>
        Title.Caption = #1060#1072#1084#1080#1083#1080#1103
        Title.TitleButton = True
        Width = 144
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FIRSTNAME'
        Footers = <>
        Title.Caption = #1048#1084#1103
        Title.TitleButton = True
        Width = 75
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MIDLENAME'
        Footers = <>
        Title.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        Title.TitleButton = True
        Width = 94
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'PHONE_NO'
        Footers = <>
        Title.Caption = #1058#1077#1083#1077#1092#1086#1085
        Title.TitleButton = True
        Width = 137
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'IN_DOGOVOR'
        Footers = <>
        Title.Caption = #1042' '#1089#1087#1080#1089#1086#1082'|'#1044#1086#1075'. '#1089#1086#1089#1090'.'
        Title.TitleButton = True
        Width = 36
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'IN_REQUEST'
        Footers = <>
        Title.Caption = #1042' '#1089#1087#1080#1089#1086#1082'|'#1052#1086#1085'- '#1090#1072#1078'.'
        Title.TitleButton = True
        Width = 37
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'WORKING'
        Footers = <>
        Title.Caption = #1056#1072#1073#1086'- '#1090#1072#1077#1090
        Title.TitleButton = True
        Width = 41
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'IBNAME'
        Footers = <>
        Title.Caption = 'LOGIN'
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NOTICE'
        Footers = <>
        Title.Caption = #1047#1072#1084#1077#1090#1082#1080
        Title.TitleButton = True
        Width = 168
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'DEPARTMENT'
        Footers = <>
        Title.Caption = #1054#1090#1076#1077#1083
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'POST'
        Footers = <>
        Title.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'WORKAREA'
        Footers = <>
        Title.Caption = #1059#1095#1072#1089#1090#1086#1082
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'TEAM'
        Footers = <>
        Title.Caption = #1047#1074#1077#1085#1086
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
        Width = 59
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'EMAIL'
        Footers = <>
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MESSENGER'
        Footers = <>
        Title.Caption = #1052#1077#1089#1089#1077#1085#1076#1078#1077#1088
        Title.TitleButton = True
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'LAST_LOGGED'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1087#1086#1089#1083'. '#1074#1093#1086#1076#1072
        Title.TitleButton = True
        Width = 60
      end>
  end
  inherited tlbMain: TToolBar
    Width = 823
    inherited ToolButton9: TToolButton
      Visible = False
    end
    inherited tbOk: TToolButton
      Visible = False
    end
    inherited ToolButton10: TToolButton
      Visible = False
    end
    inherited tbCancel: TToolButton
      Visible = False
      OnClick = tbCancelClick
    end
    inherited ToolButton20: TToolButton
      Visible = False
    end
    object ToolButton7: TToolButton
      Left = 178
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 41
      Style = tbsSeparator
    end
    object btnSendSMS: TToolButton
      Left = 186
      Top = 0
      Action = actSendSMS
      ImageIndex = 74
    end
  end
  inherited pnlEdit: TPanel
    Width = 823
    Height = 248
    object lbl3: TLabel [0]
      Left = 8
      Top = 9
      Width = 44
      Height = 13
      Caption = #1060#1072#1084#1080#1083#1080#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl4: TLabel [1]
      Left = 326
      Top = 9
      Width = 19
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1048#1084#1103
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl5: TLabel [2]
      Left = 581
      Top = 9
      Width = 49
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl1: TLabel [3]
      Left = 8
      Top = 36
      Width = 44
      Height = 13
      Caption = #1058#1077#1083#1077#1092#1086#1085
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl2: TLabel [4]
      Left = 326
      Top = 36
      Width = 24
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Email'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl9: TLabel [5]
      Left = 326
      Top = 90
      Width = 30
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1047#1074#1077#1085#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl10: TLabel [6]
      Left = 326
      Top = 63
      Width = 57
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl11: TLabel [7]
      Left = 8
      Top = 63
      Width = 33
      Height = 13
      Caption = #1054#1090#1076#1077#1083
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl7: TLabel [8]
      Left = 581
      Top = 63
      Width = 72
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085'.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl8: TLabel [9]
      Left = 8
      Top = 90
      Width = 42
      Height = 13
      Caption = #1059#1095#1072#1089#1090#1086#1082
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl6: TLabel [10]
      Left = 8
      Top = 171
      Width = 61
      Height = 13
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object Label1: TLabel [11]
      Left = 8
      Top = 117
      Width = 48
      Height = 13
      Caption = #1060#1048#1054' '#1074' '#1056#1055
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel [12]
      Left = 8
      Top = 144
      Width = 51
      Height = 13
      Caption = #1044#1086#1087'. '#1087#1086#1083#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbl12: TLabel [13]
      Left = 581
      Top = 144
      Width = 60
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1063#1072#1089'. '#1089#1090#1072#1074#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel [14]
      Left = 581
      Top = 36
      Width = 63
      Height = 13
      Anchors = [akTop, akRight]
      Caption = #1052#1077#1089#1089#1077#1085#1076#1078#1077#1088
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited btnSaveLink: TBitBtn
      Left = 287
      Top = 218
      Width = 438
      TabOrder = 17
    end
    inherited btnCancelLink: TBitBtn
      Left = 731
      Top = 218
      Cancel = True
      TabOrder = 18
    end
    object edtSurname: TDBEditEh
      Left = 80
      Top = 6
      Width = 240
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'SURNAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1060#1072#1084#1080#1083#1080#1103
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object edt2: TDBEditEh
      Left = 387
      Top = 6
      Width = 184
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'FIRSTNAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1048#1084#1103
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object edt3: TDBEditEh
      Left = 659
      Top = 6
      Width = 158
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'MIDLENAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1090#1095#1077#1089#1090#1074#1086
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object edtPhone: TDBEditEh
      Left = 80
      Top = 33
      Width = 240
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PHONE_NO'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
      ShowHint = True
      TabOrder = 3
      Visible = True
    end
    object edtEMAIL: TDBEditEh
      Left = 387
      Top = 33
      Width = 184
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'EMAIL'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'email'
      ShowHint = True
      TabOrder = 4
      Visible = True
    end
    object dbchckbxh1: TDBCheckBoxEh
      Left = 581
      Top = 89
      Width = 236
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1047#1072#1082#1083#1102#1095#1072#1077#1090' '#1076#1086#1075#1086#1074#1086#1088#1072
      DataField = 'IN_DOGOVOR'
      DataSource = srcDataSource
      DynProps = <>
      TabOrder = 11
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object cbIN_DOGOVOR: TDBCheckBoxEh
      Left = 581
      Top = 116
      Width = 236
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1052#1086#1085#1090#1072#1078#1085#1080#1082
      DataField = 'IN_REQUEST'
      DataSource = srcDataSource
      DynProps = <>
      TabOrder = 13
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object chkWORKING: TDBCheckBoxEh
      Left = 8
      Top = 219
      Width = 72
      Height = 23
      TabStop = False
      Alignment = taLeftJustify
      Anchors = [akLeft, akBottom]
      Caption = #1056#1072#1073#1086#1090#1072#1077#1090
      DataField = 'WORKING'
      DataSource = srcDataSource
      DynProps = <>
      TabOrder = 19
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object edtPOST: TDBEditEh
      Left = 387
      Top = 60
      Width = 184
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'POST'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      ShowHint = True
      TabOrder = 7
      Visible = True
    end
    object lcbTEAM: TDBLookupComboboxEh
      Left = 387
      Top = 87
      Width = 184
      Height = 21
      Anchors = [akTop, akRight]
      DynProps = <>
      DataField = 'TEAM'
      DataSource = srcDataSource
      DropDownBox.Columns = <
        item
          FieldName = 'SUBAREA_NAME'
        end
        item
          FieldName = 'AREA_NAME'
        end>
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1047#1074#1077#1085#1086
      EditButtons = <>
      KeyField = 'SUBAREA_NAME'
      ListField = 'SUBAREA_NAME'
      ListSource = srcTEAM
      ShowHint = True
      TabOrder = 10
      Visible = True
    end
    object edDepart: TDBEditEh
      Left = 80
      Top = 60
      Width = 240
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DEPARTMENT'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1054#1090#1076#1077#1083
      MRUList.Active = True
      MRUList.AutoAdd = False
      ShowHint = True
      TabOrder = 6
      Visible = True
    end
    object lcbWorkArea: TDBLookupComboboxEh
      Left = 80
      Top = 87
      Width = 240
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = 'WA_ID'
      DataSource = srcDataSource
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1059#1095#1072#1089#1090#1086#1082
      EditButtons = <>
      KeyField = 'WA_ID'
      ListField = 'NAME'
      ListSource = srcWA
      ShowHint = True
      TabOrder = 9
      Visible = True
    end
    object deBIRTHDAY: TDBDateTimeEditEh
      Left = 659
      Top = 60
      Width = 158
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'BIRTHDAY'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1044#1077#1085#1100' '#1088#1086#1078#1076#1077#1085#1080#1103
      Kind = dtkDateEh
      ShowHint = True
      TabOrder = 8
      Visible = True
    end
    object dbmmoNOTICE: TDBMemoEh
      Left = 80
      Top = 168
      Width = 737
      Height = 45
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      DataField = 'NOTICE'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 16
      Visible = True
      WantReturns = True
    end
    object edtPRINT_FIO: TDBEditEh
      Left = 80
      Top = 114
      Width = 491
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PRINT_FIO'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1060#1048#1054' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080' '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1093
      MRUList.Active = True
      MRUList.AutoAdd = False
      ShowHint = True
      TabOrder = 12
      Visible = True
    end
    object edtPRINT_TEXT: TDBEditEh
      Left = 80
      Top = 141
      Width = 491
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'PRINT_TEXT'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1090#1077#1082#1089#1090#1086#1074#1086#1077' '#1087#1086#1083#1077' '#1076#1083#1103' '#1087#1077#1095#1072#1090#1080' '#1074' '#1076#1086#1082#1091#1084#1077#1085#1090#1072#1093
      MRUList.Active = True
      MRUList.AutoAdd = False
      ShowHint = True
      TabOrder = 14
      Visible = True
    end
    object ednHRATE: TDBNumberEditEh
      Left = 659
      Top = 141
      Width = 158
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'H_RATE'
      DataSource = srcDataSource
      DynProps = <>
      EmptyDataInfo.Text = #1063#1072#1089#1086#1074#1072#1103' '#1089#1090#1072#1074#1082#1072', '#1088#1091#1073'.'
      EditButtons = <>
      ShowHint = True
      TabOrder = 15
      Visible = True
    end
    object edtMESSENGER: TDBEditEh
      Left = 659
      Top = 33
      Width = 158
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'MESSENGER'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 'Telega/Viber/WhatsApp/Skype'
      ShowHint = True
      TabOrder = 5
      Visible = True
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsWorkers
    Left = 47
    Top = 449
  end
  inherited actions: TActionList
    Left = 234
    Top = 327
    inherited actNew: TAction
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      OnExecute = actEditExecute
    end
    object actSendSMS: TAction
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
      OnExecute = actSendSMSExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 163
    Top = 327
  end
  inherited CnErrors: TCnErrorProvider
    Left = 328
    Top = 320
  end
  object dsWorkers: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE WORKER'
      'SET '
      '    SURNAME = :SURNAME,'
      '    FIRSTNAME = :FIRSTNAME,'
      '    MIDLENAME = :MIDLENAME,'
      '    PHONE_NO = :PHONE_NO,'
      '    NOTICE = :NOTICE,'
      '    WORKING = :WORKING,'
      '    IBNAME = :IBNAME,'
      '    IN_DOGOVOR = :IN_DOGOVOR,'
      '    IN_REQUEST = :IN_REQUEST,'
      '    EMAIL = :EMAIL,'
      '    DEPARTMENT = :DEPARTMENT,'
      '    POST = :POST,'
      '    BIRTHDAY = :BIRTHDAY,'
      '    TEAM = :TEAM,'
      '    WA_ID = :WA_ID,'
      '    PRINT_FIO = :PRINT_FIO,'
      '    PRINT_TEXT = :PRINT_TEXT,'
      '    H_RATE = :H_RATE,'
      '    MESSENGER = :MESSENGER    '
      'WHERE'
      '    WORKER_ID = :OLD_WORKER_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    WORKER'
      'WHERE'
      '        WORKER_ID = :OLD_WORKER_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO WORKER('
      '    WORKER_ID,'
      '    SURNAME,'
      '    FIRSTNAME,'
      '    MIDLENAME,'
      '    PHONE_NO,'
      '    NOTICE,'
      '    WORKING,'
      '    IBNAME,'
      '    IN_DOGOVOR,'
      '    IN_REQUEST,'
      '    EMAIL,'
      '    DEPARTMENT,'
      '    POST,'
      '    BIRTHDAY,'
      '    TEAM,'
      '    WA_ID,'
      '    PRINT_FIO,'
      '    PRINT_TEXT,'
      '    H_RATE,'
      '    MESSENGER'
      ')'
      'VALUES('
      '    :WORKER_ID,'
      '    :SURNAME,'
      '    :FIRSTNAME,'
      '    :MIDLENAME,'
      '    :PHONE_NO,'
      '    :NOTICE,'
      '    :WORKING,'
      '    :IBNAME,'
      '    :IN_DOGOVOR,'
      '    :IN_REQUEST,'
      '    :EMAIL,'
      '    :DEPARTMENT,'
      '    :POST,'
      '    :BIRTHDAY,'
      '    :TEAM,'
      '    :WA_ID,'
      '    :PRINT_FIO,'
      '    :PRINT_TEXT,'
      '    :H_RATE,'
      '    :MESSENGER'
      ')')
    RefreshSQL.Strings = (
      'select'
      '    W.Worker_Id'
      '  , W.Surname'
      '  , W.Firstname'
      '  , W.Midlename'
      '  , W.Phone_No'
      '  , W.Notice'
      '  , cast(coalesce(W.Working, 0) as D_Iboolean) Working'
      '  , W.Ibname'
      '  , cast(coalesce(W.In_Dogovor, 0) as D_Iboolean) In_Dogovor'
      '  , cast(coalesce(W.In_Request, 0) as D_Iboolean) In_Request'
      '  , W.Email'
      '  , W.Department'
      '  , W.Post'
      '  , W.Birthday'
      '  , W.Team'
      '  , W.Wa_Id'
      '  , W.Print_Fio'
      '  , W.Print_Text'
      '  , W.Push_Token'
      '  , W.Platform'
      '  , W.Device_Id'
      '  , W.H_Rate'
      '  , W.Messenger'
      '  from Worker W'
      '       left outer join workarea wa on (wa.wa_id = w.wa_id)'
      '       left outer join sys$user u on (u.Ibname = w.Ibname)'
      '  where W.WORKER_ID = :OLD_WORKER_ID'
      ''
      '    ')
    SelectSQL.Strings = (
      'select'
      '    W.Worker_Id'
      '  , W.Surname'
      '  , W.Firstname'
      '  , W.Midlename'
      '  , W.Phone_No'
      '  , W.Notice'
      '  , cast(coalesce(W.Working, 0) as D_Iboolean) Working'
      '  , W.Ibname'
      '  , cast(coalesce(W.In_Dogovor, 0) as D_Iboolean) In_Dogovor'
      '  , cast(coalesce(W.In_Request, 0) as D_Iboolean) In_Request'
      '  , W.Email'
      '  , W.Department'
      '  , W.Post'
      '  , W.Birthday'
      '  , W.Team'
      '  , W.Wa_Id'
      '  , W.Print_Fio'
      '  , W.Print_Text'
      '  , W.Push_Token'
      '  , W.Platform'
      '  , W.Device_Id'
      '  , W.H_Rate'
      '  , W.Messenger'
      '  from Worker W'
      '       left outer join workarea wa on (wa.wa_id = w.wa_id)'
      '       left outer join sys$user u on (u.Ibname = w.Ibname)'
      '  order by W.SURNAME, W.FIRSTNAME')
    AutoUpdateOptions.UpdateTableName = 'WORKER'
    AutoUpdateOptions.KeyFields = 'WORKER_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    OnNewRecord = dsWorkersNewRecord
    Transaction = trSRead
    Database = dmMain.dbTV
    UpdateTransaction = trSWrite
    AutoCommit = True
    Left = 40
    Top = 393
  end
  object trSWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 206
    Top = 457
  end
  object dsTEAM: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '    s.name as subarea_name,'
      '    a.name as area_name'
      'from workgroups s'
      '   inner join workarea a on (s.wa_id = a.wa_id)'
      'order by 1')
    Transaction = trSRead
    Database = dmMain.dbTV
    Left = 139
    Top = 400
  end
  object srcTEAM: TDataSource
    DataSet = dsTEAM
    Left = 140
    Top = 446
  end
  object dsWA: TpFIBDataSet
    SelectSQL.Strings = (
      'select '
      '    a.wa_id,'
      '    a.name'
      'from workarea a'
      'order by name')
    Transaction = trSRead
    Database = dmMain.dbTV
    Left = 262
    Top = 397
  end
  object srcWA: TDataSource
    DataSet = dsWA
    Left = 263
    Top = 459
  end
  object dsDEPART: TpFIBDataSet
    SelectSQL.Strings = (
      'select distinct DEPARTMENT'
      'from WORKER'
      'order by 1')
    Transaction = trSRead
    Database = dmMain.dbTV
    Left = 364
    Top = 391
  end
  object srcDepart: TDataSource
    DataSet = dsDEPART
    Left = 423
    Top = 393
  end
  object trSRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 527
    Top = 402
  end
  object qrySaveMessages: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      
        'insert into Messages (Mes_Type, Reciver, Mes_Head, Mes_Text, Mes' +
        '_Prior) '
      'values ('#39'SMS'#39', :Reciver, '#39#39', :Mes_Text, 0);')
    Left = 630
    Top = 402
  end
end
