object SendMessagesForm: TSendMessagesForm
  Left = 0
  Top = 0
  Caption = #1056#1072#1089#1089#1099#1083#1082#1072' '#1089#1086#1086#1073#1097#1077#1085#1080#1081
  ClientHeight = 442
  ClientWidth = 711
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
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 391
    Top = 150
    Height = 146
    Align = alRight
  end
  object pnl2: TPanel
    Left = 0
    Top = 150
    Width = 391
    Height = 146
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    object pnlHead: TPanel
      Left = 0
      Top = 0
      Width = 391
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      Visible = False
      DesignSize = (
        391
        26)
      object lbl2: TLabel
        Left = 3
        Top = 5
        Width = 83
        Height = 13
        Caption = #1058#1077#1084#1072' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
      end
      object edtHEAD: TDBEditEh
        Left = 90
        Top = 2
        Width = 298
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DynProps = <>
        EditButtons = <>
        EmptyDataInfo.Text = #1047#1072#1075#1086#1083#1086#1074#1086#1082' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
    end
    object mmoMessage: TDBMemoEh
      Left = 0
      Top = 26
      Width = 391
      Height = 120
      ScrollBars = ssBoth
      Align = alClient
      AutoSize = False
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 
        #1058#1077#1082#1089#1090' '#1089#1086#1086#1073#1097#1077#1085#1080#1103'. '#13#10#1055#1088#1072#1074#1099#1081' '#1082#1083#1080#1082' '#1084#1099#1096#1080' - '#1074#1099#1073#1086#1088' '#1087#1077#1088#1077#1084#1077#1085#1085#1099#1093' '#1076#1083#1103' '#1087#1086#1076#1089#1090 +
        #1072#1085#1086#1074#1082#1080
      EmptyDataInfo.Alignment = taLeftJustify
      PopupMenu = pmMemo
      ShowHint = True
      TabOrder = 1
      Visible = True
      WantReturns = True
      OnChange = mmoMessageChange
    end
  end
  object progress: TProgressBar
    Left = 0
    Top = 385
    Width = 711
    Height = 16
    Align = alBottom
    Step = 1
    TabOrder = 6
  end
  object pnl1: TPanel
    Left = 0
    Top = 32
    Width = 711
    Height = 39
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      711
      39)
    object lbl1: TLabel
      Left = 320
      Top = 15
      Width = 3
      Height = 13
    end
    object lbl3: TLabel
      Left = 3
      Top = 15
      Width = 77
      Height = 13
      Caption = #1058#1080#1087' '#1089#1086#1086#1073#1097#1077#1085#1080#1081
    end
    object cbMessType: TDBLookupComboboxEh
      Left = 90
      Top = 12
      Width = 609
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      EditButtons = <>
      KeyField = 'O_NAME'
      ListField = 'NAME'
      ListSource = srcMessType
      ShowHint = True
      TabOrder = 0
      Visible = True
      OnChange = cbMessTypeChange
    end
  end
  object pnlTmplts: TPanel
    Left = 394
    Top = 150
    Width = 317
    Height = 146
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 4
    object dbgTemplate: TDBGridEh
      Left = 0
      Top = 26
      Width = 317
      Height = 120
      Align = alClient
      DataSource = srcTemplate
      DrawMemoText = True
      DynProps = <>
      Flat = True
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghFitRowHeightToText, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
      RowHeight = 2
      RowLines = 1
      SearchPanel.Enabled = True
      TabOrder = 1
      OnDblClick = dbgTemplateDblClick
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'O_DESCRIPTION'
          Footers = <>
          Title.Caption = #1064#1072#1073#1083#1086#1085
          Title.TitleButton = True
          Width = 115
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'O_CHARFIELD'
          Footers = <>
          Title.Caption = #1058#1077#1082#1089#1090
          Title.TitleButton = True
          Width = 161
          WordWrap = True
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Panel10: TPanel
      Left = 0
      Top = 0
      Width = 317
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object btnSaveTemplate: TSpeedButton
        Left = 228
        Top = 0
        Width = 60
        Height = 26
        Action = actSaveTemplate
        Align = alRight
        Flat = True
      end
      object btnSave: TSpeedButton
        Left = 0
        Top = 0
        Width = 60
        Height = 26
        Action = actInsertTmplate
        Align = alLeft
        Flat = True
      end
      object btnDeleteTemplate: TSpeedButton
        Left = 288
        Top = 0
        Width = 29
        Height = 26
        Action = actDeleteTemplate
        Align = alRight
        Flat = True
      end
    end
  end
  object mmoLog: TDBMemoEh
    Left = 0
    Top = 296
    Width = 711
    Height = 89
    Lines.Strings = (
      'mmoLog')
    ScrollBars = ssVertical
    Align = alBottom
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    ShowHint = True
    TabOrder = 5
    Visible = False
    WantReturns = True
  end
  object pnlReport: TPanel
    Left = 0
    Top = 71
    Width = 711
    Height = 79
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      711
      79)
    object lbl4: TLabel
      Left = 3
      Top = 3
      Width = 75
      Height = 13
      Caption = #1054#1090#1095#1077#1090' '#1082#1072#1082' PDF'
    end
    object btnDeleteFile: TSpeedButton
      Left = 55
      Top = 46
      Width = 29
      Height = 27
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1074#1083#1086#1078#1077#1085#1080#1077
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008C98D6FFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008390D5FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008693D6FF324BCCFF3C53CDFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00455BCEFF324BCCFF7484D3FFFF00FF00FF00FF00FF00FF00909C
        D7FF324BCCFF324BCCFF324BCCFF3C53CDFFFF00FF00FF00FF00FF00FF00FF00
        FF00455BCEFF324BCCFF324BCCFF324BCCFF808ED5FFFF00FF00FF00FF00FF00
        FF004359CEFF324BCCFF324BCCFF324BCCFF3C53CDFFFF00FF00FF00FF00455B
        CEFF324BCCFF324BCCFF324BCCFF3F56CDFFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF004359CEFF324BCCFF324BCCFF324BCCFF3C53CDFF445ACEFF324B
        CCFF324BCCFF324BCCFF3F56CDFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF004359CEFF324BCCFF324BCCFF324BCCFF324BCCFF324B
        CCFF324BCCFF3F56CDFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF004359CEFF324BCCFF324BCCFF324BCCFF324B
        CCFF3F56CDFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00455BCEFF324BCCFF324BCCFF324BCCFF324B
        CCFF3C53CDFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00455BCEFF324BCCFF324BCCFF324BCCFF324BCCFF324B
        CCFF324BCCFF3C53CDFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00455BCEFF324BCCFF324BCCFF324BCCFF3F56CDFF4359CEFF324B
        CCFF324BCCFF324BCCFF3C53CDFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00455BCEFF324BCCFF324BCCFF324BCCFF3F56CDFFFF00FF00FF00FF004359
        CEFF324BCCFF324BCCFF324BCCFF3C53CDFFFF00FF00FF00FF00FF00FF00ABB2
        DAFF354DCCFF324BCCFF324BCCFF3F56CDFFFF00FF00FF00FF00FF00FF00FF00
        FF004359CEFF324BCCFF324BCCFF344CCCFFA4ACD9FFFF00FF00FF00FF00FF00
        FF00A7AFDAFF354DCCFF3F56CDFFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF004359CEFF344CCCFFA2ABD9FFFF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A9B1DAFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00A6AED9FFFF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      OnClick = btnDeleteFileClick
    end
    object btnAddFile: TSpeedButton
      Left = 7
      Top = 46
      Width = 42
      Height = 27
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1074#1083#1086#1078#1077#1085#1080#1077
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
        55FF000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
        55FF000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
        55FF000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
        55FF000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
        55FF000000000000000000000000000000000000000000000000000000008BAE
        59FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD
        55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF00000000000000008BAE
        59FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD
        55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF00000000000000008BAE
        59FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD
        55FF89AD55FF89AD55FF89AD55FF89AD55FF89AD55FF00000000000000008DAF
        5CFF8BAE58FF8BAE58FF8BAE58FF8BAE58FF89AD55FF89AD55FF89AD55FF89AD
        55FF8BAE58FF8BAE58FF8BAE58FF8BAE58FF8BAE58FF00000000000000000000
        00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
        55FF000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
        55FF000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
        55FF000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000089AD55FF89AD55FF89AD55FF89AD
        55FF000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000008FB15FFF8FB15FFF8FB15FFF8FB1
        5FFF000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      OnClick = btnAddFileClick
    end
    object lbl5: TLabel
      Left = 3
      Top = 30
      Width = 81
      Height = 13
      Caption = #1042#1083#1086#1078#1080#1090#1100' '#1092#1072#1081#1083#1099
    end
    object lcbReportAsPDF: TDBLookupComboboxEh
      Left = 90
      Top = 0
      Width = 609
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      EmptyDataInfo.Text = #1042#1083#1086#1078#1080#1090#1100' '#1086#1090#1095#1077#1090' '#1082#1072#1082' PDF '#1092#1072#1081#1083
      EditButtons = <>
      KeyField = 'ID_REPORT'
      ListField = 'LETTERTYPEDESCR'
      ListSource = srcLetterTypes
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object lvFiles: TListView
      Left = 90
      Top = 24
      Width = 609
      Height = 49
      Anchors = [akLeft, akTop, akRight]
      Columns = <
        item
          Caption = #1060#1072#1081#1083
          Width = 500
        end>
      ShowColumnHeaders = False
      TabOrder = 1
      ViewStyle = vsReport
      OnDblClick = lvFilesDblClick
    end
  end
  object pnlOkCancel: TPanel
    Left = 0
    Top = 401
    Width = 711
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 7
    DesignSize = (
      711
      41)
    object btnCancel: TBitBtn
      Left = 632
      Top = 6
      Width = 75
      Height = 27
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1047#1072#1082#1088#1099#1090#1100
      ModalResult = 2
      TabOrder = 1
    end
    object btnOk: TBitBtn
      Left = 11
      Top = 6
      Width = 615
      Height = 28
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1056#1072#1079#1086#1089#1083#1072#1090#1100
      NumGlyphs = 2
      TabOrder = 0
      OnClick = actSendExecute
    end
  end
  object pnlContact: TPanel
    Left = 0
    Top = 0
    Width = 711
    Height = 32
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    Visible = False
    DesignSize = (
      711
      32)
    object Label1: TLabel
      Left = 3
      Top = 10
      Width = 25
      Height = 13
      Caption = #1050#1086#1084#1091
    end
    object edtReciver: TDBEditEh
      Left = 90
      Top = 7
      Width = 609
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = #1050#1086#1084#1091' '#1096#1083#1077#1084'. '#1058#1077#1083#1077#1092#1086#1085' '#1080#1083#1080' '#1082#1072#1088#1090#1072
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
  end
  object pmMemo: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 117
    Top = 152
  end
  object actlst1: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 55
    Top = 144
    object actSend: TAction
      Caption = #1056#1072#1079#1086#1089#1083#1072#1090#1100
      Hint = #1056#1072#1079#1086#1089#1083#1072#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
      ShortCut = 16397
      OnExecute = actSendExecute
    end
    object actInsertTmplate: TAction
      Hint = #1042#1089#1090#1072#1074#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      ImageIndex = 76
      OnExecute = actInsertTmplateExecute
    end
    object actSaveTemplate: TAction
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1090#1077#1082#1089#1090' '#1082#1072#1082' '#1096#1072#1073#1083#1086#1085
      ImageIndex = 75
      OnExecute = actSaveTemplateExecute
    end
    object actDeleteTemplate: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1096#1072#1073#1083#1086#1085
      ImageIndex = 3
      OnExecute = actDeleteTemplateExecute
    end
  end
  object qrySaveMessages: TpFIBQuery
    Transaction = trWriteQ
    Database = dmMain.dbTV
    Left = 302
    Top = 154
  end
  object srcMessType: TDataSource
    AutoEdit = False
    DataSet = dsMessType
    Left = 204
    Top = 156
  end
  object dsMessType: TpFIBDataSet
    SelectSQL.Strings = (
      
        'SELECT O_ID, O_NAME, O_NAME||coalesce('#39' '#39'||O_Description,'#39#39') NAM' +
        'E, O_NUMERICFIELD'
      'FROM OBJECTS'
      'WHERE O_TYPE = 23 AND O_DELETED = 0'
      'order BY O_NAME')
    AutoCalcFields = False
    AfterOpen = dsMessTypeAfterOpen
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 82
    Top = 210
  end
  object dsTemplate: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE OBJECTS'
      'SET '
      '    O_NAME = :O_NAME,'
      '    O_CHARFIELD = :O_CHARFIELD,'
      '    O_DESCRIPTION = :O_DESCRIPTION'
      'WHERE'
      '    O_ID = :OLD_O_ID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    OBJECTS'
      'WHERE'
      '        O_ID = :OLD_O_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO OBJECTS('
      '    O_TYPE,'
      '    O_DELETED,'
      '    O_NAME,'
      '    O_CHARFIELD,'
      '    O_DESCRIPTION'
      ')'
      'VALUES('
      '    27,'
      '    0,'
      '    :O_NAME,'
      '    :O_CHARFIELD,'
      '    :O_DESCRIPTION'
      ')')
    RefreshSQL.Strings = (
      'SELECT O_ID, O_NAME, O_CHARFIELD, O_DESCRIPTION'
      'FROM OBJECTS'
      'WHERE O_TYPE = 27 '
      '      and OBJECTS.O_ID = :OLD_O_ID')
    SelectSQL.Strings = (
      'SELECT O_ID, O_NAME, O_CHARFIELD, O_DESCRIPTION'
      'FROM OBJECTS'
      'WHERE O_TYPE = 27 AND O_DELETED = 0'
      'order BY O_DESCRIPTION, O_CHARFIELD')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWriteQ
    AutoCommit = True
    Left = 434
    Top = 242
  end
  object srcTemplate: TDataSource
    AutoEdit = False
    DataSet = dsTemplate
    Left = 524
    Top = 244
  end
  object trWriteQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 202
    Top = 215
  end
  object dsLetterTypes: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      
        '    LETTERTYPEID, Lettertypedescr, Filename, coalesce(Recordindb' +
        ', 0) Recordindb, ID_REPORT'
      '  from LETTERTYPE l'
      '       inner join(select'
      
        '                      replace(upper(FULL_PATH), '#39'.FR3'#39', '#39#39') FULL' +
        '_PATH, ID_REPORT'
      
        '                    from Get_All_Reports) r on (r.FULL_PATH = re' +
        'place(upper(l.Filename), '#39'.FR3'#39', '#39#39'))'
      '  where coalesce(FOR_FORM, 0) = 0'
      '  order by 2  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 240
    Top = 320
  end
  object srcLetterTypes: TDataSource
    AutoEdit = False
    DataSet = dsLetterTypes
    Left = 336
    Top = 320
  end
  object qryRead: TpFIBQuery
    Transaction = trReadQ
    Database = dmMain.dbTV
    Left = 518
    Top = 322
  end
  object trReadQ: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 576
    Top = 320
  end
  object DlgFileOpen: TOpenDialog
    Left = 488
    Top = 95
  end
  object frxReport: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 37871.997208472200000000
    ReportOptions.Description.Strings = (
      
        'This example shows how to create nested reports using subreport ' +
        'component.')
    ReportOptions.LastChange = 38077.610186261600000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnUserFunction = frxReportUserFunction
    Left = 144
    Top = 312
  end
  object frxPDFExport: TfrxPDFExport
    ShowDialog = False
    UseFileCache = True
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = True
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 56
    Top = 320
  end
  object PropStorageEh: TPropStorageEh
    Section = 'SENDMSG'
    StorageManager = dmMain.iniPropStorage
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'pnlTmplts.<P>.Width')
    Left = 426
    Top = 304
  end
end
