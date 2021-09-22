object UF: TUF
  Left = 469
  Top = 224
  BorderStyle = bsSizeToolWin
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
  ClientHeight = 374
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 333
    Width = 325
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      325
      41)
    object Button1: TButton
      Left = 8
      Top = 9
      Width = 227
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 241
      Top = 9
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      ModalResult = 2
      TabOrder = 1
    end
  end
  object pnlNewUser: TPanel
    Left = 0
    Top = 0
    Width = 325
    Height = 54
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      325
      54)
    object Label4: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = 'LOGIN'
    end
    object Label7: TLabel
      Left = 8
      Top = 33
      Width = 57
      Height = 13
      Caption = 'PASSWORD'
    end
    object edU: TDBEditEh
      Left = 97
      Top = 5
      Width = 219
      Height = 21
      Hint = 
        #1044#1086#1087#1091#1089#1090#1080#1084#1099#1077' '#1089#1080#1084#1086#1074#1083#1099' ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_ '#1073#1077#1079' '#1091#1095#1077 +
        #1090#1072' '#1088#1077#1075#1080#1089#1090#1088#1072
      Anchors = [akLeft, akTop, akRight]
      CharCase = ecUpperCase
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1051#1086#1075#1080#1085'. '#1058#1086#1083#1100#1082#1086' '#1083#1072#1090#1080#1085#1080#1094#1072' '#1080' '#1094#1080#1092#1088#1099
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnEnter = edUEnter
      OnExit = edUExit
      OnKeyPress = edUKeyPress
    end
    object edPWD: TDBEditEh
      Left = 97
      Top = 31
      Width = 219
      Height = 21
      Hint = #1055#1072#1088#1086#1083#1100' '#1076#1086#1083#1078#1077#1085' '#1089#1086#1089#1090#1103#1090#1100' '#1093#1086#1090#1103' '#1073#1099' '#1080#1079' '#1086#1076#1085#1086#1075#1086' '#1089#1080#1084#1074#1086#1083#1072
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1072#1088#1086#1083#1100'. '#1058#1086#1083#1100#1082#1086' '#1083#1072#1090#1080#1085#1080#1094#1072' '#1080' '#1094#1080#1092#1088#1099
      ShowHint = True
      TabOrder = 1
      Visible = True
      OnEnter = edUEnter
      OnExit = edUExit
      OnKeyPress = edPWDKeyPress
    end
  end
  object pnlExistUser: TPanel
    Left = 0
    Top = 54
    Width = 325
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    DesignSize = (
      325
      30)
    object Label8: TLabel
      Left = 8
      Top = 7
      Width = 72
      Height = 13
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
    end
    object cbUsers: TDBComboBoxEh
      Left = 97
      Top = 4
      Width = 219
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
  end
  object pgcWorker: TPageControl
    Left = 0
    Top = 84
    Width = 325
    Height = 220
    ActivePage = tsNew
    Align = alClient
    TabOrder = 2
    object tsNew: TTabSheet
      Caption = #1053#1086#1074#1099#1081' '#1089#1086#1090#1088#1091#1076#1085#1080#1082
      object pnlFIO: TPanel
        Left = 0
        Top = 0
        Width = 317
        Height = 192
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          317
          192)
        object Label1: TLabel
          Left = 4
          Top = 0
          Width = 44
          Height = 13
          Caption = #1060#1072#1084#1080#1083#1080#1103
        end
        object Label6: TLabel
          Left = 4
          Top = 112
          Width = 44
          Height = 13
          Caption = #1058#1077#1083#1077#1092#1086#1085
        end
        object Label2: TLabel
          Left = 4
          Top = 37
          Width = 19
          Height = 13
          Caption = #1048#1084#1103
        end
        object Label3: TLabel
          Left = 4
          Top = 75
          Width = 49
          Height = 13
          Caption = #1054#1090#1095#1077#1089#1090#1074#1086
        end
        object edF: TDBEditEh
          Left = 4
          Top = 16
          Width = 308
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1060#1072#1084#1080#1083#1080#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
          MaxLength = 30
          ShowHint = True
          TabOrder = 0
          Visible = True
        end
        object etPhone: TDBEditEh
          Left = 4
          Top = 127
          Width = 308
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1058#1077#1083#1077#1092#1086#1085
          MaxLength = 30
          ShowHint = True
          TabOrder = 3
          Visible = True
        end
        object edI: TDBEditEh
          Left = 4
          Top = 53
          Width = 308
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1048#1084#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
          MaxLength = 30
          ShowHint = True
          TabOrder = 1
          Visible = True
        end
        object edO: TDBEditEh
          Left = 4
          Top = 90
          Width = 308
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1054#1090#1095#1077#1089#1090#1074#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
          MaxLength = 30
          ShowHint = True
          TabOrder = 2
          Visible = True
        end
        object dmN: TDBMemoEh
          Left = 4
          Top = 154
          Width = 308
          Height = 35
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = False
          DynProps = <>
          EditButtons = <>
          EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          ShowHint = True
          TabOrder = 4
          Visible = True
          WantReturns = True
        end
      end
    end
    object tsExists: TTabSheet
      Caption = #1057#1091#1097#1077#1089#1090#1074#1091#1102#1097#1080#1081' '#1089#1086#1090#1088#1091#1076#1085#1080#1082
      ImageIndex = 1
      DesignSize = (
        317
        192)
      object lbl1: TLabel
        Left = 4
        Top = 10
        Width = 83
        Height = 13
        Caption = #1044#1083#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
      end
      object cbWorker: TDBComboBoxEh
        Left = 3
        Top = 34
        Width = 313
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1076#1083#1103' '#1082#1072#1082#1086#1075#1086' '#1089#1086#1090#1088#1076#1091#1085#1080#1082#1072' '#1089#1086#1079#1076#1072#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        EditButtons = <>
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 304
    Width = 325
    Height = 29
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      325
      29)
    object chkWork: TDBCheckBoxEh
      Left = 8
      Top = 8
      Width = 97
      Height = 17
      Caption = #1056#1072#1073#1086#1090#1072#1077#1090
      DynProps = <>
      TabOrder = 0
    end
    object chkLock: TDBCheckBoxEh
      Left = 219
      Top = 7
      Width = 97
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akTop, akRight]
      Caption = #1041#1083#1086#1082#1080#1088#1086#1074#1072#1085
      DynProps = <>
      TabOrder = 1
    end
  end
  object cnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 116
    Top = 172
  end
end
