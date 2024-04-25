object HtmlForm: THtmlForm
  Left = 0
  Top = 0
  Caption = 'HTML'
  ClientHeight = 301
  ClientWidth = 584
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlControl: TPanel
    Left = 0
    Top = 0
    Width = 584
    Height = 61
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      584
      61)
    object HostLabel: TLabel
      Left = 8
      Top = 11
      Width = 13
      Height = 13
      Caption = 'Url'
    end
    object Label1: TLabel
      Left = 8
      Top = 36
      Width = 23
      Height = 13
      Caption = 'Data'
    end
    object HostEdit: TEdit
      Left = 40
      Top = 8
      Width = 227
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = '172.16.2.135'
    end
    object DataEdit: TEdit
      Left = 40
      Top = 32
      Width = 403
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      Text = '9kpNQzsad11S'
    end
    object SendButton: TButton
      Left = 449
      Top = 32
      Width = 65
      Height = 21
      Caption = '&Send'
      Enabled = False
      TabOrder = 4
      OnClick = SendButtonClick
    end
    object btnClose: TButton
      Left = 520
      Top = 8
      Width = 58
      Height = 45
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 1
      TabOrder = 5
    end
    object edtPSWD: TDBEditEh
      Left = 394
      Top = 7
      Width = 120
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'Aut_Pswd'
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1087#1072#1088#1086#1083#1100' (BASIC AUTH)'
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object edtUSR: TDBEditEh
      Left = 272
      Top = 7
      Width = 120
      Height = 21
      Anchors = [akTop, akRight]
      DataField = 'Aut_User'
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' (BASIC AUTH)'
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
  end
  object pgcHB: TPageControl
    Left = 0
    Top = 61
    Width = 584
    Height = 240
    ActivePage = tsViewer
    Align = alClient
    TabOrder = 1
    object tsViewer: TTabSheet
      Caption = 'tsViewer'
      object htmlviewer: THtmlViewer
        Left = 0
        Top = 0
        Width = 576
        Height = 212
        BorderStyle = htFocused
        HistoryMaxCount = 0
        NoSelect = False
        PrintMarginBottom = 2.000000000000000000
        PrintMarginLeft = 2.000000000000000000
        PrintMarginRight = 2.000000000000000000
        PrintMarginTop = 2.000000000000000000
        PrintScale = 1.000000000000000000
        OnImageRequest = htmlviewerImageRequest
        Align = alClient
        PopupMenu = pmHTML
        TabOrder = 0
        OnKeyDown = htmlviewerKeyDown
        Touch.InteractiveGestures = [igPan]
        Touch.InteractiveGestureOptions = [igoPanSingleFingerHorizontal, igoPanSingleFingerVertical, igoPanInertia]
      end
    end
    object tsBrowser: TTabSheet
      Caption = 'tsBrowser'
      ImageIndex = 1
    end
  end
  object actlst1: TActionList
    Left = 73
    Top = 92
    object actShowControl: TAction
      Caption = 'actShowControl'
      ShortCut = 49235
      OnExecute = actShowControlExecute
    end
  end
  object pmHTML: TPopupMenu
    Left = 304
    Top = 189
    object N1: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1042#1099#1076#1077#1083#1080#1090#1100' '#1074#1089#1077
      OnClick = N2Click
    end
  end
  object PropStorageEh: TPropStorageEh
    Section = 'HTML'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 426
    Top = 128
  end
end
