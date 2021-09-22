object TaskFilterForm: TTaskFilterForm
  Left = 367
  Top = 186
  BorderStyle = bsDialog
  Caption = #1060#1080#1083#1100#1090#1088' '#1079#1072#1076#1072#1095
  ClientHeight = 313
  ClientWidth = 552
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlOKCancel: TPanel
    Left = 0
    Top = 276
    Width = 552
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      552
      37)
    object SpeedButton3: TSpeedButton
      Left = 166
      Top = 3
      Width = 70
      Height = 30
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      Flat = True
      OnClick = SpeedButton3Click
    end
    object btnLoad: TSpeedButton
      Left = 85
      Top = 3
      Width = 70
      Height = 30
      Hint = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      Flat = True
      OnClick = btnLoadClick
    end
    object btnSave: TSpeedButton
      Left = 4
      Top = 3
      Width = 70
      Height = 30
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1092#1080#1083#1100#1090#1088
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Flat = True
      OnClick = btnSaveClick
    end
    object chkDefaultFilter: TCheckBox
      Left = 249
      Top = 9
      Width = 109
      Height = 17
      Hint = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1101#1090#1086#1090' '#1092#1080#1083#1100#1090#1088' '#1087#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
      Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1092#1080#1083#1100#1090#1088
      TabOrder = 2
    end
    object bbOk: TBitBtn
      Left = 378
      Top = 3
      Width = 87
      Height = 30
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = actOkExecute
    end
    object bbCancel: TBitBtn
      Left = 473
      Top = 3
      Width = 75
      Height = 30
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object pnlBtns: TPanel
    Left = 0
    Top = 241
    Width = 552
    Height = 35
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    DesignSize = (
      552
      35)
    object lbl4: TLabel
      Left = 153
      Top = 11
      Width = 94
      Height = 13
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' '#1091#1089#1083#1086#1074#1080#1077' '#1082' '#1092#1080#1083#1100#1090#1088#1091' '#1082#1072#1082
      Alignment = taRightJustify
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1086#1074#1080#1077
    end
    object lbl5: TLabel
      Left = 298
      Top = 11
      Width = 4
      Height = 13
      Caption = '/'
    end
    object lblOrAND: TLabel
      Left = 129
      Top = 6
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dbnvgr1: TDBNavigator
      Left = 387
      Top = 5
      Width = 155
      Height = 25
      DataSource = srcFilter
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete]
      Anchors = [akTop, akRight]
      TabOrder = 2
    end
    object chk1: TDBCheckBoxEh
      Left = 8
      Top = 9
      Width = 117
      Height = 17
      Hint = 
        #1090'.'#1077'. '#1076#1086#1073#1072#1074#1080#1084' '#1086#1090#1088#1080#1094#1072#1085#1080#1077' '#1074' '#1091#1089#1083#1086#1074#1080#1077'.'#13#10#1085#1072#1087#1088#1080#1084#1077#1088' '#1085#1077' '#1078#1080#1074#1077#1090' '#1085#1072' '#1091#1083#1080#1094#1077' '#1051#1077 +
        #1085#1080#1085#1072' '#1074' '#1076#1086#1084#1077' 6'
      TabStop = False
      Caption = #1048#1085#1074#1077#1088#1089#1080#1103' '#1092#1080#1083#1100#1090#1088#1072
      DataField = 'inversion'
      DataSource = srcFilter
      DynProps = <>
      TabOrder = 3
    end
    object btnAnd: TButton
      Left = 253
      Top = 5
      Width = 38
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' '#1091#1089#1083#1086#1074#1080#1077' '#1082' '#1092#1080#1083#1100#1090#1088#1091' '#1082#1072#1082' '#1048
      Caption = #1048
      TabOrder = 0
      TabStop = False
      OnClick = btnAndClick
    end
    object btnOR: TButton
      Left = 309
      Top = 5
      Width = 39
      Height = 25
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1077' '#1091#1089#1083#1086#1074#1080#1077' '#1082' '#1092#1080#1083#1100#1090#1088#1091' '#1082#1072#1082' '#1048#1051#1048
      Caption = #1048#1051#1048
      TabOrder = 1
      TabStop = False
      OnClick = btnORClick
    end
  end
  object pgcFilter: TPageControl
    Left = 0
    Top = 0
    Width = 552
    Height = 241
    ActivePage = tsMain
    Align = alClient
    TabOrder = 0
    object tsMain: TTabSheet
      Caption = #1054#1089#1085#1086#1074#1085#1086#1081
      DesignSize = (
        544
        213)
      object Label10: TLabel
        Left = 8
        Top = 143
        Width = 66
        Height = 13
        Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
      end
      object lbl11: TLabel
        Left = 211
        Top = 62
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object lbl12: TLabel
        Left = 8
        Top = 62
        Width = 37
        Height = 13
        Caption = #1055#1083#1072#1085' '#1089':'
      end
      object lbl1: TLabel
        Left = 211
        Top = 89
        Width = 12
        Height = 13
        Caption = #1087#1086
      end
      object lbl2: TLabel
        Left = 8
        Top = 89
        Width = 68
        Height = 13
        Caption = #1042#1099#1087#1086#1083#1085#1077#1085#1086' '#1089':'
      end
      object lbl3: TLabel
        Left = 8
        Top = 170
        Width = 39
        Height = 13
        Caption = #1054#1073#1098#1077#1082#1090
      end
      object cbbWORKER: TDBLookupComboboxEh
        Left = 80
        Top = 140
        Width = 282
        Height = 21
        Hint = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        DataField = 'WORKER'
        DataSource = srcFilter
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'IBNAME'
        ListField = 'FIO'
        ListSource = srcExecutor
        ShowHint = True
        TabOrder = 5
        Visible = True
        OnEnter = luWorkEnter
      end
      object edtPLAN_TO: TDBDateTimeEditEh
        Left = 234
        Top = 59
        Width = 129
        Height = 21
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        DataField = 'PLAN_TO'
        DataSource = srcFilter
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 2
        Visible = True
        EditFormat = 'DD/MM/YYYY'
      end
      object edtPLAN_FROM: TDBDateTimeEditEh
        Left = 81
        Top = 59
        Width = 118
        Height = 21
        Alignment = taLeftJustify
        DataField = 'PLAN_FROM'
        DataSource = srcFilter
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 1
        Visible = True
        EditFormat = 'DD/MM/YYYY'
      end
      object chkNotClosed: TDBCheckBoxEh
        Left = 8
        Top = 22
        Width = 191
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        Caption = #1058#1086#1083#1100#1082#1086' '#1085#1077' '#1079#1072#1082#1088#1099#1090#1099#1077' '#1079#1072#1076#1072#1095#1080
        DataField = 'NotClosed'
        DataSource = srcFilter
        DynProps = <>
        TabOrder = 0
      end
      object edtEXEC_TO: TDBDateTimeEditEh
        Left = 234
        Top = 86
        Width = 129
        Height = 21
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        DataField = 'EXEC_TO'
        DataSource = srcFilter
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 4
        Visible = True
        EditFormat = 'DD/MM/YYYY'
      end
      object edtEXEC_FROM: TDBDateTimeEditEh
        Left = 81
        Top = 86
        Width = 118
        Height = 21
        Alignment = taLeftJustify
        DataField = 'EXEC_FROM'
        DataSource = srcFilter
        DynProps = <>
        EditButtons = <>
        ShowHint = True
        TabOrder = 3
        Visible = True
        EditFormat = 'DD/MM/YYYY'
      end
      object edtOBJ_ID: TDBEditEh
        Left = 205
        Top = 167
        Width = 158
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'OBJ_ID'
        DataSource = srcFilter
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1048#1044' '#1086#1073#1098#1077#1082#1090#1072
        ShowHint = True
        TabOrder = 6
        Visible = True
      end
      object cbbOBJ_TYPE: TDBComboBoxEh
        Left = 81
        Top = 167
        Width = 118
        Height = 21
        DataField = 'OBJ_TYPE'
        DataSource = srcFilter
        DynProps = <>
        EmptyDataInfo.Text = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072
        EditButtons = <>
        Items.Strings = (
          #1040#1073#1086#1085#1077#1085#1090
          #1047#1072#1103#1074#1082#1072
          #1055#1083#1072#1090#1077#1078
          #1059#1079#1077#1083)
        KeyItems.Strings = (
          'A'
          'R'
          'P'
          'N')
        ShowHint = True
        TabOrder = 7
        Visible = True
      end
      object chkAllUsers: TDBCheckBoxEh
        Left = 8
        Top = 115
        Width = 191
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        Caption = #1047#1072#1076#1072#1095#1080' '#1074#1089#1077#1093' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
        DataField = 'AllUsers'
        DataSource = srcFilter
        DynProps = <>
        TabOrder = 8
      end
    end
  end
  object dsExecutor: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    w.Surname || coalesce('#39' '#39'||w.Firstname, '#39#39') FIO'
      '    , w.Ibname'
      '  from worker w'
      'where not w.Ibname is null     '
      'order by 1')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 430
    Top = 180
  end
  object srcExecutor: TDataSource
    AutoEdit = False
    DataSet = dsExecutor
    Left = 493
    Top = 182
  end
  object dlgOpen: TOpenDialog
    DefaultExt = 'FTR'
    Filter = #1060#1080#1083#1100#1090#1088#1099'|*.RF'
    InitialDir = 'filters'
    Options = [ofHideReadOnly, ofNoChangeDir, ofNoNetworkButton, ofEnableSizing]
    OptionsEx = [ofExNoPlacesBar]
    Left = 430
    Top = 118
  end
  object srcFilter: TDataSource
    DataSet = TaskForm.dsFilter
    OnDataChange = srcFilterDataChange
    Left = 503
    Top = 111
  end
  object actlst: TActionList
    Left = 493
    Top = 41
    object actOk: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ShortCut = 16397
      OnExecute = actOkExecute
    end
  end
end
