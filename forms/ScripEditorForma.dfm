object ScripEditorForm: TScripEditorForm
  Left = 251
  Top = 239
  ActiveControl = Memo
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1089#1082#1088#1080#1087#1090#1086#1074
  ClientHeight = 508
  ClientWidth = 815
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 459
    Width = 815
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object Splitter2: TSplitter
    Left = 675
    Top = 204
    Height = 255
    Align = alRight
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 815
    Height = 37
    ButtonHeight = 36
    ButtonWidth = 63
    Images = ImageList
    Indent = 2
    ShowCaptions = True
    TabOrder = 0
    object btnNew: TToolButton
      Left = 2
      Top = 0
      Action = actNew
    end
    object btnOpen: TToolButton
      Left = 65
      Top = 0
      Action = actOpen
      DropdownMenu = pmModules
    end
    object btnSave: TToolButton
      Left = 128
      Top = 0
      Action = actSave
    end
    object btn1: TToolButton
      Left = 191
      Top = 0
      Width = 8
      Caption = 'btn1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object Panel2: TPanel
      Left = 199
      Top = 0
      Width = 139
      Height = 36
      BevelOuter = bvNone
      TabOrder = 0
      object lbl1: TLabel
        Left = 0
        Top = 0
        Width = 139
        Height = 13
        Align = alTop
        Caption = #1059#1082#1072#1078#1080#1090#1077' '#1090#1080#1087' '#1092#1072#1081#1083#1072
        Transparent = False
      end
      object cbLanguage: TDBComboBoxEh
        Left = 0
        Top = 13
        Width = 139
        Height = 23
        Align = alClient
        DynProps = <>
        EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1090#1080#1087' '#1092#1072#1081#1083#1072
        EditButtons = <>
        Items.Strings = (
          'Pascal'
          'C'
          'Java'
          'Basic')
        KeyItems.Strings = (
          '0'
          '1'
          '2'
          '3')
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnChange = cbLanguageChange
      end
    end
    object ToolButton3: TToolButton
      Left = 338
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object btnRun: TToolButton
      Left = 346
      Top = 0
      Action = actRun
    end
    object btnRunTO: TToolButton
      Left = 409
      Top = 0
      Action = actRunTO
    end
    object btnDebug: TToolButton
      Left = 472
      Top = 0
      Action = actDebug
    end
    object btnEval: TToolButton
      Left = 535
      Top = 0
      Action = actEval
    end
    object btn2: TToolButton
      Left = 598
      Top = 0
      Width = 8
      Caption = 'btn2'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object btnDelete: TToolButton
      Left = 606
      Top = 0
      Action = actDelete
    end
  end
  object Status: TDBMemoEh
    Left = 0
    Top = 462
    Width = 815
    Height = 46
    Align = alBottom
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 5
    Visible = True
    WantReturns = True
  end
  object fsTree1: TfsTree
    Left = 678
    Top = 204
    Width = 137
    Height = 255
    Align = alRight
    BevelOuter = bvNone
    Caption = 'fsTree1'
    TabOrder = 4
    ShowClasses = True
    ShowFunctions = True
    ShowTypes = True
    ShowVariables = True
    Expanded = True
    ExpandLevel = 2
  end
  object Memo: TfsSyntaxMemo
    Left = 0
    Top = 204
    Width = 675
    Height = 255
    Cursor = crIBeam
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    TabOrder = 3
    TabStop = True
    BlockColor = clHighlight
    BlockFontColor = clHighlightText
    CommentAttr.Charset = DEFAULT_CHARSET
    CommentAttr.Color = clNavy
    CommentAttr.Height = -13
    CommentAttr.Name = 'Courier New'
    CommentAttr.Style = [fsItalic]
    KeywordAttr.Charset = DEFAULT_CHARSET
    KeywordAttr.Color = clWindowText
    KeywordAttr.Height = -13
    KeywordAttr.Name = 'Courier New'
    KeywordAttr.Style = [fsBold]
    StringAttr.Charset = DEFAULT_CHARSET
    StringAttr.Color = clNavy
    StringAttr.Height = -13
    StringAttr.Name = 'Courier New'
    StringAttr.Style = []
    TextAttr.Charset = DEFAULT_CHARSET
    TextAttr.Color = clWindowText
    TextAttr.Height = -13
    TextAttr.Name = 'Courier New'
    TextAttr.Style = []
    Lines.Strings = (
      '')
    ReadOnly = False
    SyntaxType = stPascal
    ShowFooter = True
    ShowGutter = True
  end
  object pnlEval: TPanel
    Left = 0
    Top = 129
    Width = 815
    Height = 75
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    Visible = False
    DesignSize = (
      815
      75)
    object lbl2: TLabel
      Left = 2
      Top = 3
      Width = 58
      Height = 13
      Caption = #1042#1099#1088#1072#1078#1077#1085#1080#1077
    end
    object lbl3: TLabel
      Left = 2
      Top = 26
      Width = 53
      Height = 13
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090
    end
    object edtExpr: TEdit
      Left = 67
      Top = 0
      Width = 726
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      Text = 'edtExpr'
      OnKeyPress = edtExprKeyPress
    end
    object mmoEvalRes: TDBMemoEh
      Left = 67
      Top = 23
      Width = 726
      Height = 50
      TabStop = False
      Lines.Strings = (
        'mmoEvalRes')
      ScrollBars = ssBoth
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 1
      Visible = True
      WantReturns = True
    end
  end
  object pnlSave: TPanel
    Left = 0
    Top = 37
    Width = 815
    Height = 92
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    Visible = False
    DesignSize = (
      815
      92)
    object btnSaveLink: TBitBtn
      Left = 16
      Top = 61
      Width = 685
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 3
      OnClick = btnSaveLinkClick
    end
    object btnCancelLink: TBitBtn
      Left = 707
      Top = 61
      Width = 86
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 4
      OnClick = btnCancelLinkClick
    end
    object edtName: TDBEditEh
      Left = 16
      Top = 7
      Width = 617
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object edtNotice: TDBEditEh
      Left = 16
      Top = 34
      Width = 777
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object chkInMenu: TDBCheckBoxEh
      Left = 648
      Top = 8
      Width = 145
      Height = 17
      Anchors = [akTop, akRight]
      Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1074' '#1084#1077#1085#1102
      DynProps = <>
      TabOrder = 1
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 
      'PascalScript files (*.pas)|*.pas|PHP files (*.php)|*.php|CScript' +
      ' files (*.cpp)|*.cpp|JavaScript files (*.js)|*.js|BasicScript fi' +
      'les (*.vb)|*.vb|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Left = 204
    Top = 100
  end
  object ImageList: TImageList
    ColorDepth = cd32Bit
    Left = 131
    Top = 178
    Bitmap = {
      494C010108000D00040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5689DFFAB4C
      8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C
      8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4649BFFAB4C8DFFAC4E
      8EFFFFFFFFFFFFFFFFFFAB4D8DFFAE5392FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFAB4C8DFFAB4C8DFFAB4C8DFF959595FF656565FF656565FF6565
      65FF656565FF656565FF656565FF656565FF656565FF656565FF656565FF6565
      65FF656565FF656565FF656565FF949494FF0000000000000000000000000000
      0000464646FF464646FF464646FF464646FF464646FF464646FF464646FF4646
      46FF464646FF464646FF464646FF000000000000000000000000000000008C98
      D6FF000000000000000000000000000000000000000000000000000000000000
      00008390D5FF00000000000000000000000000000000AB4D8DFFAB4C8DFFAC4E
      8EFFFFFFFFFFFFFFFFFFAB4D8DFFAE5392FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFAB4C8DFFAB4C8DFFAB4C8DFF656565FFF3F3F3FFF3F3F3FFF3F3
      F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3
      F3FFF3F3F3FFF3F3F3FFF3F3F3FF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008693D6FF314A
      CCFF3B52CDFF000000000000000000000000000000000000000000000000445A
      CEFF314ACCFF7384D3FF000000000000000000000000AB4D8DFFAB4C8DFFAC4E
      8EFFFFFFFFFFFFFFFFFFAB4D8DFFAE5392FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFAB4C8DFFAB4C8DFFAB4C8DFF656565FFF3F3F3FFF3F3F3FFF3F3
      F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3F3FFF3F3
      F3FFF3F3F3FFF3F3F3FFF3F3F3FF656565FF0000000000000000000000000000
      0000000000000000000000000000464646FF464646FF464646FF464646FF4646
      46FF464646FF464646FF464646FF0000000000000000909CD7FF314ACCFF314A
      CCFF314ACCFF3B52CDFF00000000000000000000000000000000445ACEFF314A
      CCFF314ACCFF314ACCFF808ED5FF0000000000000000AB4D8DFFAB4C8DFFAC4E
      8EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFAB4C8DFFAB4C8DFFAB4C8DFF656565FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004258CEFF314A
      CCFF314ACCFF314ACCFF3B52CDFF0000000000000000445ACEFF314ACCFF314A
      CCFF314ACCFF3E55CDFF000000000000000000000000AB4D8DFFAB4C8DFFAB4C
      8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C
      8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFF656565FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF656565FF0000000000000000B07337FF0000
      0000000000000000000000000000464646FF464646FF464646FF464646FF4646
      46FF464646FF464646FF464646FF000000000000000000000000000000004258
      CEFF314ACCFF314ACCFF314ACCFF3B52CDFF4359CEFF314ACCFF314ACCFF314A
      CCFF3E55CDFF00000000000000000000000000000000AB4D8DFFAB4C8DFFAB4C
      8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C
      8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFF656565FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF656565FF0000000000000000B07337FFB073
      37FF000000000000000500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004258CEFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF3E55
      CDFF0000000000000000000000000000000000000000AB4D8DFFAB4C8DFFE5CA
      DCFFFEFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFDFEFFE7CDDEFFAB4C8DFFAB4C8DFF656565FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF656565FF614121FF614121FFB07337FFB073
      37FFB07337FF0000000500000000464646FF464646FF464646FF464646FF4646
      46FF464646FF464646FF464646FF000000000000000000000000000000000000
      0000000000004258CEFF314ACCFF314ACCFF314ACCFF314ACCFF3E55CDFF0000
      00000000000000000000000000000000000000000000AB4D8DFFAB4C8DFFFDFB
      FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFAB4C8DFFAB4C8DFF656565FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF656565FF0000000500000000B07337FFB073
      37FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000445ACEFF314ACCFF314ACCFF314ACCFF314ACCFF3B52CDFF0000
      00000000000000000000000000000000000000000000AB4D8DFFAB4C8DFFFDFC
      FDFFFFFFFFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
      B8FFFFFFFFFFFFFFFFFFAB4D8DFFAB4C8DFF656565FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF656565FF0000000000000000B07337FF0000
      0000000000000000000000000000464646FF464646FF464646FF464646FF4646
      46FF464646FF464646FF464646FF000000000000000000000000000000000000
      0000445ACEFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF314ACCFF3B52
      CDFF0000000000000000000000000000000000000000AB4D8DFFAB4C8DFFFDFC
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFAB4D8DFFAB4C8DFF656565FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF656565FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000445A
      CEFF314ACCFF314ACCFF314ACCFF3E55CDFF4258CEFF314ACCFF314ACCFF314A
      CCFF3B52CDFF00000000000000000000000000000000AB4D8DFFAB4C8DFFFDFC
      FDFFFFFFFFFFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8B8FFB8B8
      B8FFFFFFFFFFFFFFFFFFAB4D8DFFAB4C8DFF656565FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF656565FF0000000000000000000000000000
      0000000000000000000000000000464646FF464646FF464646FF464646FF4646
      46FF464646FF464646FF464646FF000000000000000000000000445ACEFF314A
      CCFF314ACCFF314ACCFF3E55CDFF00000000000000004258CEFF314ACCFF314A
      CCFF314ACCFF3B52CDFF000000000000000000000000AB4D8DFFAB4C8DFFFDFB
      FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFAB4C8DFFAB4C8DFFB2743AFFB3743AFFB3743AFFB374
      3AFFB3743AFFB3743AFFB3743AFFB3743AFFB3743AFFB3743AFFB3743AFFB374
      3AFFB3743AFFB3743AFFB3743AFFB3743AFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000ABB2DAFF344CCCFF314A
      CCFF314ACCFF3E55CDFF000000000000000000000000000000004258CEFF314A
      CCFF314ACCFF334BCCFFA4ACD9FF0000000000000000AB4D8DFFAB4C8DFFE5CA
      DCFFFEFDFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFEFEFEFFE7CEDEFFAB4C8DFFAB4C8DFFB3743AFFB3743AFFB3743AFFB374
      3AFFB3743AFFB3743AFFB3743AFFB3743AFFB3743AFFFFFFFFFFFFFFFFFFB374
      3AFFFFFFFFFFFFFFFFFFB3743AFFB3743AFF0000000000000000000000000000
      0000464646FF464646FF464646FF464646FF464646FF464646FF464646FF4646
      46FF464646FF464646FF464646FF000000000000000000000000A7AFDAFF344C
      CCFF3E55CDFF0000000000000000000000000000000000000000000000004258
      CEFF334BCCFFA2ABD9FF000000000000000000000000AB4D8DFFAB4C8DFFAB4C
      8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C
      8DFFAB4C8DFFAB4C8DFFAB4C8DFFAB4C8DFFB57942FFB3743AFFB3743AFFB374
      3AFFB3743AFFB3743AFFB3743AFFB3743AFFB3743AFFB3743AFFB3743AFFB374
      3AFFB3743AFFB3743AFFB3743AFFB47841FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A9B1
      DAFF000000000000000000000000000000000000000000000000000000000000
      0000A6AED9FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A7AAADFF0000000069B8E9FF65B7
      EAFF64B6E8FF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7
      EAFF65B7EAFF65B7EAFF8BC3E7FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000454545FF454545FF454545FF454545FF454545FF4545
      45FF454545FF454545FF454545FF454545FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000087898AFF0000000066B6E8FF64B6
      E8FF64B6E8FF64B6E9FF64B6E9FF64B6E9FF64B6E9FF64B6E9FF64B6E8FF64B6
      E8FF64B6E8FF64B6E9FF67B7E8FF000000000000000084AD4BFFB2C797FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B57B44FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB67D48FF00000000B57C46FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB57C46FF00000000787979FF0000000079BDE7FF64B6
      E8FF64B6E8FF64B6E9FF64B6E9FF64B6E9FF64B6E9FF64B6E9FF64B6E8FF64B6
      E8FF64B6E8FF64B6E9FF64B6E8FF000000000000000082AA47FF82AA47FF82AA
      48FFACC48EFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000454545FF454545FF4545
      45FF454545FF454545FF454545FF454545FFB3763CFFB4783FFFC08F5DFFB376
      3CFFC19261FFB4783FFFB3763DFF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFF00000000767676FFC5C8C9FF96C5E2FF64B6
      E8FF64B6E8FF64B6E9FF64B6E9FF64B6E9FF64B6E9FF64B6E9FF64B6E8FF64B6
      E8FF64B6E8FF64B6E9FF64B6E8FFA5CCE4FF0000000082AA47FF82AA47FF82AA
      47FF82AA47FF81AA46FFA6C184FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B07236FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3763CFFC19261FFF8F3EEFFD6B6
      97FFF8F3EEFFC08F5DFFB3763DFF00000000B3763CFFECDED0FFFFFFFFFFFFFF
      FFFFFFFFFFFFECDED0FFB3763CFF00000000767676FFB4B6B7FFB3CEDEFF64B6
      E8FF64B6E8FF64B6E8FF64B6E9FF64B6E9FF64B6E9FF64B6E9FF64B6E8FF64B6
      E8FF64B6E8FF64B6E9FF64B6E9FF88C2E6FF0000000082AA47FF82AA47FF82AA
      47FF82AA47FF82AA47FF82AA47FF81AA46FF9FBD79FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B07236FFB07236FF0000000000000000454545FF454545FF4545
      45FF454545FF454545FF454545FF454545FFB3763CFFB3763CFFD7B89AFFFFFF
      FFFFD4B292FFB3763CFFB3763DFF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFF00000000777777FFA3A4A4FF0000000064B6
      E8FF64B6E8FF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF64B6E9FF64B6
      E9FF64B6E9FF64B6E9FF64B6E9FF6CB9E8FF0000000082AA47FF82AA47FF82AA
      47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA47FF81AA47FF95B768FF0000
      00000000000000000000000000000000000000000000876F58FF604020FF6040
      20FF604020FFB07236FFB07236FFB07236FF0000000000000000000000000000
      000000000000000000000000000000000000B3763CFFC19261FFF8F3EEFFD5B5
      96FFF8F3EEFFBF8D5BFFB3763DFF00000000B3763CFFECDED0FFFFFFFFFFFFFF
      FFFFFFFFFFFFECDED0FFB3763CFF00000000777777FF919292FF0000000071BA
      E8FF64B6E8FF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF64B6E9FF64B6
      E9FF64B6E9FF64B6E9FF64B6E9FF64B6E9FF0000000082AA47FF82AA47FF82AA
      47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA47FF81AA
      47FF8BB157FFC2D0B0FF000000000000000000000000604020FF000000000000
      000000000000B07236FFB07236FF0000000000000000454545FF454545FF4545
      45FF454545FF454545FF454545FF454545FFB3763CFFB4783FFFC08F5DFFB376
      3CFFC0905EFFB3773DFFB3763DFF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFF00000000777777FF87898AFF000000008DC3
      E4FF64B6E8FF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF64B6E9FF64B6
      E9FF64B6E9FF64B6E9FF64B6E9FF64B6E9FF0000000082AA47FF82AA47FF82AA
      47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA
      47FF82AA47FF81AA47FF87AF50FFBDCDA9FF00000000604020FF000000000000
      000000000000B07236FF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000B57C45FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB68049FF00000000B67D46FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB67D46FF00000000777777FF838688FF00000000AFCF
      E3FF64B6E8FF65B7EAFF65B7EAFF65B7EAFF65B7EAFF65B7EAFF64B6E9FF64B6
      E9FF64B6E9FF64B6E9FF64B6E9FF64B6E9FF0000000082AA47FF82AA47FF82AA
      47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA
      47FF82AA47FF81AA47FF84AB4AFFB7CA9FFF00000000604020FF000000000000
      00000000000000000000000000000000000000000000454545FF454545FF4545
      45FF454545FF454545FF454545FF454545FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000777777FF797979FFB4B6B7FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000082AA47FF82AA47FF82AA
      47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA47FF81AA
      47FF86AE4FFFBBCCA6FF000000000000000000000000604020FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B57C46FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB7814AFF00000000B67D48FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB67D48FF00000000777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF000000000000000082AA47FF82AA47FF82AA
      47FF82AA47FF82AA47FF82AA47FF82AA47FF82AA47FF81AA47FF91B460FFC2D0
      B1FF0000000000000000000000000000000000000000604020FF000000000000
      00000000000000000000454545FF454545FF454545FF454545FF454545FF4545
      45FF454545FF454545FF454545FF454545FFB3763CFFB3763CFFB4783FFFEADB
      CBFFB3763CFFB3763CFFB3763DFF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFF00000000777777FF777777FF777777FF7777
      77FF777777FF777777FF777777FF777777FF777777FF777777FF777777FF7777
      77FF777777FF777777FFA6A6A6FF000000000000000082AA47FF82AA47FF82AA
      47FF82AA47FF82AA47FF82AA47FF81AA47FF9BBB72FF00000000000000000000
      00000000000000000000000000000000000000000000604020FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3763CFFB3763CFFB47940FFFDFC
      FAFFB3763CFFB3763CFFB3763DFF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFF00000000787878FF777777FF777777FF7777
      77FF777777FF777777FF777777FFA4AAAEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000082AA47FF82AA47FF82AA
      47FF82AA47FF81AA46FFA1BE7CFF000000000000000000000000000000000000
      00000000000000000000000000000000000000000000604020FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3763CFFECDED0FFFDFBFAFFFEFE
      FEFFFDFBFAFFE9D7C6FFB3763DFF00000000B3763CFFEBDBCCFFFDFBFAFFFDFB
      FAFFFDFBFAFFEBDBCCFFB3763CFF00000000B8BCBFFF777777FF777777FF7777
      77FF777777FF777777FFAEB4B8FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000082AA47FF82AA47FF81AB
      47FFA8C288FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000604020FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B3763CFFB4783FFFB67C45FFFDFC
      FAFFB47940FFB4783FFFB3763DFF00000000B3763CFFB4783FFFB47940FFB479
      40FFB47940FFB4783FFFB3763CFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083AC4AFFAFC692FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000876F58FF604020FF6040
      20FF604020FF604020FF604020FF604020FF604020FF604020FF604020FF0000
      000000000000000000000000000000000000B3763CFFB3763CFFB4783FFFECDE
      D0FFB3763CFFB3763CFFB3763DFF00000000B3763CFFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB3763CFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000B57A43FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB67D47FF00000000B57C45FFB3763CFFB3763CFFB376
      3CFFB3763CFFB3763CFFB57B44FF00000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FFFFFFFF00000000F001EFF7
      00000000FFFFC7E300000000FE0183C100000000FFFFC18300000000DE01E007
      00000000CBFFF00F000000000201F81F000000004FFFF81F00000000DE01F00F
      00000000FFFFE00700000000FE01C18300000000FFFF83C100000000F001C7E3
      00000000FFFFEFF700000000FFFFFFFF00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object actlst: TActionList
    Images = ImageList
    Left = 278
    Top = 177
    object actNew: TAction
      Caption = #1053#1086#1074#1099#1081
      ImageIndex = 5
      OnExecute = actNewExecute
    end
    object actSave: TAction
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 4
      OnExecute = actSaveExecute
    end
    object actOpen: TAction
      Caption = #1054#1090#1082#1088#1099#1090#1100
      ImageIndex = 0
      OnExecute = actOpenExecute
    end
    object actRun: TAction
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      ImageIndex = 1
      OnExecute = actRunExecute
    end
    object actDebug: TAction
      Caption = #1054#1090#1083#1072#1076#1082#1072
      ImageIndex = 2
      OnExecute = actDebugExecute
    end
    object actEval: TAction
      Caption = #1042#1099#1095#1080#1089#1083#1080#1090#1100
      ImageIndex = 3
      OnExecute = actEvalExecute
    end
    object actRunTO: TAction
      Caption = #1044#1086' '#1089#1090#1088#1086#1082#1080
      Hint = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1076#1086' '#1090#1077#1082#1091#1097#1077#1081' '#1089#1090#1088#1086#1082#1080
      ImageIndex = 6
      OnExecute = actRunTOExecute
    end
    object actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1084#1086#1076#1091#1083#1100
      ImageIndex = 7
      OnExecute = actDeleteExecute
    end
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 112
    Top = 48
  end
  object pmModules: TPopupMenu
    Left = 184
    Top = 248
  end
end
