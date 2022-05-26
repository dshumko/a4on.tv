object FeedbackForm: TFeedbackForm
  Left = 0
  Top = 0
  Caption = 'Feedback'
  ClientHeight = 300
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object memMessage: TDBMemoEh
    Left = 0
    Top = 34
    Width = 635
    Height = 222
    Lines.Strings = (
      
        #1045#1089#1083#1080' '#1042#1099' '#1093#1086#1090#1080#1090#1077' '#1087#1086#1083#1091#1095#1080#1090#1100' '#1073#1099#1089#1090#1088#1099#1081' '#1086#1090#1074#1077#1090', '#1090#1086' '#1085#1072#1087#1080#1096#1080#1090#1077' '#1083#1091#1095#1096#1077' '#1074' '#1090#1077#1083#1077#1075 +
        #1088#1072#1084' https://t.me/a4on_tv')
    ScrollBars = ssVertical
    Align = alClient
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = 
      #1054#1087#1080#1096#1080#1090#1077' '#1087#1088#1086#1073#1083#1077#1084#1091' '#1080#1083#1080' '#1087#1088#1077#1076#1083#1086#1078#1077#1085#1080#1077' '#1087#1086' '#1088#1072#1073#1086#1090#1077' '#1055#1054'. '#1045#1089#1083#1080' '#1074#1072#1084' '#1085#1077#1086#1073#1093#1086#1076#1080 +
      #1084#1086' '#1087#1086#1083#1091#1095#1080#1090#1100' '#1086#1090#1074#1077#1090', '#1090#1086' '#1086#1089#1090#1072#1074#1100#1090#1077' email '#1080#1083#1080' '#1076#1088#1091#1075#1086#1081' '#1089#1087#1086#1089#1086#1073' '#1089#1074#1103#1079#1080'. '#13#10 +
      #1057#1087#1072#1089#1080#1073#1086
    ShowHint = True
    TabOrder = 1
    Visible = True
    WantReturns = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      635
      34)
    object Label1: TLabel
      Left = 12
      Top = 11
      Width = 24
      Height = 13
      Caption = #1058#1077#1084#1072
    end
    object edSubject: TDBEditEh
      Left = 42
      Top = 8
      Width = 585
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1090#1077#1084#1091' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 256
    Width = 635
    Height = 44
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      635
      44)
    object Label2: TLabel
      Left = 12
      Top = 18
      Width = 26
      Height = 13
      Caption = #1060#1072#1081#1083
    end
    object btnSend: TButton
      Left = 529
      Top = 2
      Width = 104
      Height = 41
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100
      TabOrder = 1
      OnClick = btnSendClick
    end
    object Button1: TButton
      Left = 418
      Top = 13
      Width = 98
      Height = 25
      Anchors = [akRight]
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1092#1072#1081#1083
      TabOrder = 0
      OnClick = Button1Click
    end
    object edFile: TDBEditEh
      Left = 42
      Top = 15
      Width = 367
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1052#1086#1078#1077#1090#1077' '#1087#1088#1080#1083#1086#1078#1080#1090#1100' '#1092#1072#1081#1083' '#1082' '#1089#1086#1086#1073#1097#1077#1085#1080#1102
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
  end
  object FileOpenDialog: TOpenDialog
    Left = 328
    Top = 104
  end
end
