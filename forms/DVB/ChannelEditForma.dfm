object ChannelEditForm: TChannelEditForm
  Left = 410
  Top = 243
  ActiveControl = edtCH_NAME
  Caption = #1050#1072#1085#1072#1083
  ClientHeight = 422
  ClientWidth = 399
  Color = clBtnFace
  DoubleBuffered = True
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  DesignSize = (
    399
    422)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 31
    Height = 13
    Caption = #1050#1072#1085#1072#1083
  end
  object Label2: TLabel
    Left = 8
    Top = 330
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object Label3: TLabel
    Left = 8
    Top = 118
    Width = 60
    Height = 13
    Caption = #1054#1087#1083#1072#1095#1077#1085' '#1076#1086
  end
  object Label4: TLabel
    Left = 8
    Top = 145
    Width = 42
    Height = 13
    Caption = #1063#1072#1089#1090#1086#1090#1072
  end
  object Label5: TLabel
    Left = 8
    Top = 226
    Width = 31
    Height = 13
    Caption = #1057#1090#1074#1086#1083
  end
  object Label8: TLabel
    Left = 8
    Top = 38
    Width = 31
    Height = 13
    Caption = #1053#1086#1084#1077#1088
  end
  object Label9: TLabel
    Left = 167
    Top = 226
    Width = 60
    Height = 13
    Anchors = [akTop]
    Caption = #8470' '#1074' '#1089#1090#1074#1086#1083#1077
  end
  object Label6: TLabel
    Left = 8
    Top = 65
    Width = 48
    Height = 13
    Caption = #1063#1077#1090#1082#1086#1089#1090#1100
  end
  object lbl1: TLabel
    Left = 8
    Top = 91
    Width = 26
    Height = 13
    Caption = #1071#1079#1099#1082
  end
  object Label10: TLabel
    Left = 8
    Top = 199
    Width = 58
    Height = 13
    Caption = #1046#1072#1085#1088#1099' DVB'
  end
  object lbl2: TLabel
    Left = 231
    Top = 199
    Width = 69
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1042#1086#1079#1088'. '#1086#1075#1088'-'#1085#1080#1077
  end
  object lbl3: TLabel
    Left = 8
    Top = 172
    Width = 47
    Height = 13
    Caption = 'Access ID'
  end
  object lbl4: TLabel
    Left = 8
    Top = 252
    Width = 48
    Height = 13
    Caption = #1051#1080#1094#1077#1085#1079#1080#1103
  end
  object lbl5: TLabel
    Left = 8
    Top = 279
    Width = 54
    Height = 13
    Caption = #1057#1074'-'#1074#1086' '#1057#1052#1048
  end
  object lbl6: TLabel
    Left = 9
    Top = 306
    Width = 48
    Height = 13
    Caption = #1058#1077#1084#1072#1090#1080#1082#1072
  end
  object DBCheckBox1: TDBCheckBox
    Left = 312
    Top = 225
    Width = 79
    Height = 17
    Alignment = taLeftJustify
    Anchors = [akTop, akRight]
    Caption = #1050#1086#1076#1080#1088#1086#1074#1072#1085
    DataField = 'CH_CODED'
    DataSource = srcChannel
    TabOrder = 12
  end
  object DBDateTimeEditEh1: TDBDateTimeEditEh
    Left = 74
    Top = 115
    Width = 148
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'CH_PAID_TO'
    DataSource = srcChannel
    DynProps = <>
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 5
    Visible = True
  end
  object DBNumberEditEh1: TDBNumberEditEh
    Left = 74
    Top = 142
    Width = 148
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'CH_FREQ'
    DataSource = srcChannel
    DecimalPlaces = 3
    DynProps = <>
    EmptyDataInfo.Text = #1063#1072#1089#1090#1086#1090#1072
    EditButtons = <>
    ShowHint = True
    TabOrder = 6
    Visible = True
  end
  object DBMemo2: TDBMemoEh
    Left = 74
    Top = 328
    Width = 317
    Height = 56
    ScrollBars = ssVertical
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'CH_NOTICE'
    DataSource = srcChannel
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 16
    Visible = True
    WantReturns = True
  end
  object DBNumberEditEh2: TDBNumberEditEh
    Left = 74
    Top = 223
    Width = 70
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'CH_TRUNK'
    DataSource = srcChannel
    DecimalPlaces = 0
    DynProps = <>
    EmptyDataInfo.Text = #1057#1090#1074#1086#1083
    EditButtons = <>
    ShowHint = True
    TabOrder = 10
    Visible = True
  end
  object DBNumberEditEh3: TDBNumberEditEh
    Left = 234
    Top = 223
    Width = 76
    Height = 21
    Anchors = [akTop]
    DataField = 'CH_TRUNK_NUMBER'
    DataSource = srcChannel
    DecimalPlaces = 0
    DynProps = <>
    EmptyDataInfo.Text = 'N '#1074' '#1089#1090#1074#1086#1083#1077
    EditButtons = <>
    ShowHint = True
    TabOrder = 11
    Visible = True
  end
  object edtCH_NAME: TDBEditEh
    Left = 74
    Top = 8
    Width = 317
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'CH_NAME'
    DataSource = srcChannel
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1072#1085#1072#1083#1072
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object DBEditEh2: TDBEditEh
    Left = 74
    Top = 35
    Width = 148
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'CH_NUMBER'
    DataSource = srcChannel
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1053#1086#1084#1077#1088' '#1074' '#1072#1085#1072#1083#1086#1075#1077
    ShowHint = True
    TabOrder = 1
    Visible = True
  end
  object DBComboBoxEh1: TDBComboBoxEh
    Left = 74
    Top = 62
    Width = 148
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'DEFINITION'
    DataSource = srcChannel
    DynProps = <>
    EmptyDataInfo.Text = #1063#1077#1090#1082#1086#1089#1090#1100
    EditButtons = <>
    Items.Strings = (
      'SD'
      'HD'
      '4k'
      '3D')
    KeyItems.Strings = (
      'SD'
      'HD'
      '4k'
      '3D')
    ShowHint = True
    TabOrder = 3
    Visible = True
  end
  object cbLANG: TDBComboBoxEh
    Left = 74
    Top = 88
    Width = 148
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'LANG'
    DataSource = srcChannel
    DynProps = <>
    EmptyDataInfo.Text = #1054#1089#1085#1086#1074#1085#1086#1081' '#1103#1079#1099#1082' '#1090#1088#1072#1085#1089#1083#1103#1094#1080#1080
    EditButtons = <>
    Items.Strings = (
      'Russian - '#1056#1091#1089#1089#1082#1080#1081
      'Belarusian - '#1041#1077#1083#1072#1088#1091#1089#1082#1110
      'Ukrainian - '#1059#1082#1088#1072#1111#1085#1089#1100#1082#1072
      'English'
      'Latvian - Latviesu'
      'Lithuanian - Lietuviu'
      'Estonian - Eesti'
      'Polish - j'#281'zyk Polski'
      'French - Francais'
      'German - Deutsch'
      'Serbian - '#1089#1088#1087#1089#1082#1080
      'Bulgarian - '#1073#1098#1083#1075#1072#1088#1089#1082#1080' '#1077#1079#1080#1082
      #1040#1088#1084#1103#769#1085#1089#1082#1080#1081' '#1103#1079#1099#769#1082' - '#1392#1377#1397#1381#1408#1383#1398', '#1392#1377#1397#1381#1408#1381#1398
      #1050#1072#1079#1072#769#1093#1089#1082#1080#1081' '#1103#1079#1099#769#1082' - '#1179#1072#1079#1072#1179' '#1090#1110#1083#1110)
    KeyItems.Strings = (
      'RUS'
      'BEL'
      'UKR'
      'ENG'
      'LAV'
      'LIT'
      'EST'
      'POL'
      'FRA'
      'DEU'
      'SRP'
      'BUL'
      'ARM'
      'KAZ')
    ShowHint = True
    TabOrder = 4
    Visible = True
  end
  object edtDVBGENRES: TDBEditEh
    Left = 74
    Top = 196
    Width = 151
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'DVBGENRES'
    DataSource = srcChannel
    DynProps = <>
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edtDVBGENRESEditButtons0Click
      end>
    EmptyDataInfo.Text = #1050#1086#1076#1099' '#1078#1072#1085#1088#1086#1074' DVB, '#1095#1077#1088#1077#1079' '#1079#1072#1087#1103#1090#1091#1102
    ShowHint = True
    TabOrder = 8
    Visible = True
  end
  object edt1: TDBNumberEditEh
    Left = 312
    Top = 196
    Width = 79
    Height = 21
    Anchors = [akTop, akRight]
    DataField = 'MINAGE'
    DataSource = srcChannel
    DynProps = <>
    EmptyDataInfo.Text = #1084#1080#1085' '#1074#1086#1079#1088#1072#1089#1090
    EditButtons = <>
    ShowHint = True
    TabOrder = 9
    Visible = True
  end
  object imgGraphic: TDBImageEh
    Left = 231
    Top = 35
    Width = 160
    Height = 155
    Anchors = [akTop, akRight]
    Color = clWhite
    DataField = 'CH_ICON'
    DataSource = srcChannel
    DynProps = <>
    EditButton.DefaultAction = False
    EditButton.DropdownMenu = pmLogo
    EditButton.Style = ebsEllipsisEh
    EditButton.Visible = True
    PopupMenu = pmLogo
    TabOrder = 2
    TabStop = False
    OnButtonClick = imgGraphicButtonClick
    OnDblClick = imgGraphicDblClick
  end
  object edtACCESS_ID: TDBNumberEditEh
    Left = 74
    Top = 169
    Width = 148
    Height = 21
    Hint = #1050#1083#1102#1095' '#1076#1086#1089#1090#1091#1087#1072' '#1076#1083#1103' '#1089#1080#1089#1090#1077#1084' '#1082#1086#1076#1080#1088#1086#1074#1072#1085#1080#1103' CONAX '#1080' '#1087#1086#1076#1086#1086#1073#1085#1099#1093
    Anchors = [akLeft, akTop, akRight]
    DataField = 'ACCESS_ID'
    DataSource = srcChannel
    DecimalPlaces = 3
    DynProps = <>
    EmptyDataInfo.Text = #1050#1083#1102#1095' '#1076#1086#1089#1090#1091#1087#1072
    EditButtons = <>
    ShowHint = True
    TabOrder = 7
    Visible = True
  end
  object btnCancel: TBitBtn
    Left = 314
    Top = 390
    Width = 77
    Height = 26
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 18
  end
  object btnOk: TBitBtn
    Left = 74
    Top = 390
    Width = 234
    Height = 26
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    ModalResult = 1
    NumGlyphs = 2
    TabOrder = 17
    OnClick = OkCancelFrame1bbOkClick
  end
  object edtCH_LIC: TDBEditEh
    Left = 74
    Top = 249
    Width = 317
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'CH_LIC'
    DataSource = srcChannel
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1051#1080#1094#1077#1085#1079#1080#1103
    ShowHint = True
    TabOrder = 13
    Visible = True
  end
  object edtCH_CERT: TDBEditEh
    Left = 74
    Top = 276
    Width = 317
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'CH_CERT'
    DataSource = srcChannel
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086' '#1057#1052#1048
    ShowHint = True
    TabOrder = 14
    Visible = True
  end
  object lcbCH_THEME: TDBLookupComboboxEh
    Left = 74
    Top = 301
    Width = 317
    Height = 21
    DynProps = <>
    DataField = 'CH_THEME'
    DataSource = srcChannel
    EmptyDataInfo.Text = #1058#1077#1084#1090#1080#1082#1072' '#1082#1072#1085#1072#1083#1072
    EditButtons = <>
    KeyField = 'O_NAME'
    ListField = 'O_NAME'
    ListSource = srcTheme
    ShowHint = True
    TabOrder = 15
    Visible = True
  end
  object dsChannel: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE CHANNELS'
      'SET '
      '    CH_ID = :CH_ID,'
      '    CH_NUMBER = :CH_NUMBER,'
      '    CH_NAME = :CH_NAME,'
      '    CH_NOTICE = :CH_NOTICE,'
      '    CH_PAID_TO = :CH_PAID_TO,'
      '    CH_FREQ = :CH_FREQ,'
      '    CH_CODED = :CH_CODED,'
      '    CH_TRUNK = :CH_TRUNK,'
      '    CH_TRUNK_NUMBER = :CH_TRUNK_NUMBER,'
      '    CH_ICON = :CH_ICON,'
      '    DEFINITION = :DEFINITION,'
      '    LANG = :LANG,'
      '    DVBGENRES = :DVBGENRES,'
      '    MINAGE = :MINAGE,'
      '    ACCESS_ID = :ACCESS_ID,'
      '    Ch_Lic = :Ch_Lic,'
      '    Ch_Cert = :Ch_Cert,'
      '    Ch_Theme = :Ch_Theme    '
      'WHERE'
      '    CH_ID = :OLD_CH_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    CHANNELS'
      'WHERE'
      '        CH_ID = :OLD_CH_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO CHANNELS('
      '    CH_ID,'
      '    CH_NUMBER,'
      '    CH_NAME,'
      '    CH_NOTICE,'
      '    CH_PAID_TO,'
      '    CH_FREQ,'
      '    CH_CODED,'
      '    CH_TRUNK,'
      '    CH_TRUNK_NUMBER,'
      '    CH_ICON,'
      '    DEFINITION,'
      '    LANG,'
      '    DVBGENRES,'
      '    MINAGE,'
      '    ACCESS_ID, '
      '    Ch_Lic, '
      '    Ch_Cert, '
      '    Ch_Theme'
      ')'
      'VALUES('
      '    :CH_ID,'
      '    :CH_NUMBER,'
      '    :CH_NAME,'
      '    :CH_NOTICE,'
      '    :CH_PAID_TO,'
      '    :CH_FREQ,'
      '    :CH_CODED,'
      '    :CH_TRUNK,'
      '    :CH_TRUNK_NUMBER,'
      '    :CH_ICON,'
      '    :DEFINITION,'
      '    :LANG,'
      '    :DVBGENRES,'
      '    :MINAGE,'
      '    :ACCESS_ID, '
      '    :Ch_Lic, '
      '    :Ch_Cert, '
      '    :Ch_Theme'
      ')')
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM Channels C'
      'where(  c.Ch_Id = :Ch_ID'
      '     ) and (     C.CH_ID = :OLD_CH_ID'
      '     )'
      '    ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM Channels C'
      'where c.Ch_Id = :Ch_ID')
    Transaction = trSRead
    Database = dmMain.dbTV
    UpdateTransaction = trSWrite
    Left = 257
    Top = 54
    oFetchAll = True
  end
  object trSRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 256
    Top = 108
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
    Left = 306
    Top = 102
  end
  object srcChannel: TDataSource
    DataSet = dsChannel
    Left = 303
    Top = 50
  end
  object OpenDialog1: TOpenDialog
    Filter = #1083#1086#1075#1086'|*.bmp; *.jpg; *.jpeg; *.png; *.ico'
    Left = 346
    Top = 118
  end
  object pmLogo: TPopupMenu
    Left = 256
    Top = 280
    object N1: TMenuItem
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
      OnClick = N3Click
    end
  end
  object SaveDialog: TSavePictureDialog
    Filter = #1083#1086#1075#1086'|*.bmp; *.jpg; *.jpeg; *.png; *.ico'
    Options = [ofOverwritePrompt, ofEnableSizing]
    Left = 140
    Top = 92
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 35
    Top = 104
  end
  object trReadQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 256
    Top = 332
  end
  object dsTheme: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    c.O_Name'
      '  from OBJECTS C'
      '  where c.O_Type = 47'
      '  order by c.O_Name')
    Transaction = trReadQ
    Database = dmMain.dbTV
    Left = 193
    Top = 334
    oFetchAll = True
  end
  object srcTheme: TDataSource
    AutoEdit = False
    DataSet = dsTheme
    Left = 135
    Top = 330
  end
end
