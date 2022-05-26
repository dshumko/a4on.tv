object apgCustomerCard: TapgCustomerCard
  Left = 0
  Top = 0
  Caption = #1050#1072#1088#1090#1086#1095#1082#1072' '#1072#1073#1086#1085#1077#1085#1090#1072
  ClientHeight = 179
  ClientWidth = 686
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object frxPreview: TfrxPreview
    Left = 0
    Top = 0
    Width = 686
    Height = 179
    Align = alClient
    ActiveFrameColor = clWhite
    BackColor = clWhite
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    FrameColor = clWhite
    OutlineVisible = False
    OutlineWidth = 120
    ThumbnailVisible = False
    FindFmVisible = False
    UseReportHints = False
    OutlineTreeSortType = dtsUnsorted
    HideScrolls = False
  end
  object frxReport: TfrxReport
    Version = '2021.2.8'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    Preview = frxPreview
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Modal = False
    PreviewOptions.OutlineExpand = False
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #1055#1086' '#1091#1084#1086#1083#1095#1072#1085#1080#1102
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40661.489828368100000000
    ReportOptions.LastChange = 40661.534106076390000000
    ScriptLanguage = 'PascalScript'
    ShowProgress = False
    StoreInDFM = False
    OnUserFunction = frxReportUserFunction
    Left = 144
    Top = 48
  end
  object dsForScroolWait: TpFIBDataSet
    SelectSQL.Strings = (
      
        'select cast(:Customer_id as INTEGER) as Customer_id from RDB$DAT' +
        'ABASE ')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 264
    Top = 48
    poUseBooleanField = False
    poImportDefaultValues = False
    poGetOrderInfo = False
    WaitEndMasterScroll = True
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
    Left = 360
    Top = 46
  end
  object srcForScroolWait: TDataSource
    AutoEdit = False
    DataSet = dsForScroolWait
    OnDataChange = srcForScroolWaitDataChange
    Left = 264
    Top = 104
  end
end
