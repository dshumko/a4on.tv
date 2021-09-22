object TextEditForm: TTextEditForm
  Left = 0
  Top = 0
  ActiveControl = Text
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1090#1077#1082#1089#1090#1072
  ClientHeight = 301
  ClientWidth = 562
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblHint: TLabel
    Left = 0
    Top = 0
    Width = 562
    Height = 13
    Align = alTop
  end
  object Text: TSynEdit
    Left = 0
    Top = 13
    Width = 562
    Height = 247
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    TabOrder = 0
    Gutter.AutoSize = True
    Gutter.DigitCount = 3
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Courier New'
    Gutter.Font.Style = []
    Gutter.ShowLineNumbers = True
    Highlighter = syngnrlsyn1
    RightEdge = 255
    RightEdgeColor = clWindow
    ScrollBars = ssVertical
    WordWrap = True
    WordWrapGlyph.Visible = False
    OnChange = TextChange
    FontSmoothing = fsmNone
  end
  object pnl1: TPanel
    Left = 0
    Top = 260
    Width = 562
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      562
      41)
    object btnOk: TBitBtn
      Left = 17
      Top = 6
      Width = 457
      Height = 31
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
    end
    object btnCancel: TBitBtn
      Left = 480
      Top = 6
      Width = 75
      Height = 31
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object syngnrlsyn1: TSynGeneralSyn
    Options.AutoDetectEnabled = False
    Options.AutoDetectLineLimit = 0
    Options.Visible = False
    DetectPreprocessor = False
    IdentifierChars = 
      '!"#$%&'#39'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`' +
      'abcdefghijklmnopqrstuvwxyz{|}~'#1026#1027#8218#1107#8222#8230#8224#8225#8364#8240#1033#8249#1034#1036#1035#1039#1106#8216#8217#8220#8221#8226#8211#8212#152#8482#1113#8250#1114#1116#1115#1119#160 +
      #1038#1118#1032#164#1168#166#167#1025#169#1028#171#172#173#174#1031#176#177#1030#1110#1169#181#182#183#1105#8470#1108#187#1112#1029#1109#1111#1040#1041#1042#1043#1044#1045#1046#1047#1048#1049#1050#1051#1052#1053#1054#1055#1056#1057#1058#1059#1060#1061#1062#1063#1064#1065#1066#1067#1068#1069#1070#1071#1072 +
      #1073#1074#1075#1076#1077#1078#1079#1080#1081#1082#1083#1084#1085#1086#1087#1088#1089#1090#1091#1092#1093#1094#1095#1096#1097#1098#1099#1100#1101#1102#1103
    Left = 324
    Top = 111
  end
  object FormStorage: TPropStorageEh
    Section = 'TEXTEDIT'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.ActiveControl'
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 424
    Top = 112
  end
end
