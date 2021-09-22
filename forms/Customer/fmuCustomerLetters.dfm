object apgCustomerLetters: TapgCustomerLetters
  Left = 0
  Top = 0
  Caption = #1055#1080#1089#1100#1084#1072' '#1080' '#1089#1086#1086#1073#1097#1077#1085#1080#1103
  ClientHeight = 180
  ClientWidth = 761
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
  object dbgLetters: TDBGridEh
    Left = 26
    Top = 0
    Width = 735
    Height = 180
    Align = alClient
    AllowedOperations = []
    ColumnDefValues.ToolTips = True
    DataSource = srcLetters
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    GridLineParams.VertEmptySpaceStyle = dessNonEh
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghRowHighlight, dghDialogFind, dghColumnResize, dghColumnMove]
    ReadOnly = True
    SearchPanel.Enabled = True
    STFilter.Local = True
    STFilter.Location = stflInTitleFilterEh
    STFilter.Visible = True
    TabOrder = 1
    TitleParams.MultiTitle = True
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SEND_DATE'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
        Title.TitleButton = True
        Width = 97
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MES_TYPE'
        Footers = <>
        Title.Caption = #1058#1080#1087
        Title.TitleButton = True
        Width = 115
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MES_TEXT'
        Footers = <>
        Title.Caption = #1058#1077#1082#1089#1090
        Title.TitleButton = True
        Width = 325
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'MES_HEAD'
        Footers = <>
        Title.Caption = #1047#1072#1075#1086#1083#1086#1074#1086#1082
        Title.TitleButton = True
        Width = 162
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 0
    Width = 26
    Height = 180
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      26
      180)
    object btnDel: TSpeedButton
      Left = 2
      Top = 157
      Width = 22
      Height = 22
      Action = actLetterDel
      Anchors = [akLeft, akBottom]
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF008C98D600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF008390D500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF008693D600334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00465CCE00334CCC007584D300FF00FF00FF00FF00FF00FF00909C
        D700334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00
        FF00465CCE00334CCC00334CCC00334CCC00808ED500FF00FF00FF00FF00FF00
        FF00445ACE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00465C
        CE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00445ACE00334CCC00334CCC00334CCC003D54CD00455BCE00334C
        CC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334CCC00334C
        CC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00445ACE00334CCC00334CCC00334CCC00334C
        CC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334C
        CC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00465CCE00334CCC00334CCC00334CCC00334CCC00334C
        CC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00465CCE00334CCC00334CCC00334CCC004057CD00445ACE00334C
        CC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00465CCE00334CCC00334CCC00334CCC004057CD00FF00FF00FF00FF00445A
        CE00334CCC00334CCC00334CCC003D54CD00FF00FF00FF00FF00FF00FF00ABB2
        DA00364ECC00334CCC00334CCC004057CD00FF00FF00FF00FF00FF00FF00FF00
        FF00445ACE00334CCC00334CCC00354DCC00A4ACD900FF00FF00FF00FF00FF00
        FF00A7AFDA00364ECC004057CD00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00445ACE00354DCC00A2ABD900FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00A9B1DA00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00A6AED900FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Layout = blGlyphTop
    end
  end
  object dsLetters: TpFIBDataSet
    DeleteSQL.Strings = (
      'delete from Custletter where Custletterid = :OLD_Mes_Id;')
    SelectSQL.Strings = (
      'select'
      '    Mes_Id'
      '    , ITS_LETTER'
      '    , Send_Date'
      '    , Mes_Type'
      '    , Mes_Text'
      '    , Mes_Head'
      'from ('
      'select'
      '    C.CUSTLETTERID Mes_Id,'
      '    1 ITS_LETTER,'
      '    cast(C.CUSTLETTERDATE as DATE) as Send_Date,'
      '    LT.lettertypedescr Mes_Type,'
      '    '#39#39' Mes_Text,'
      '    '#39#39' Mes_Head'
      '  from CustLetter C'
      
        '       left outer join LETTERTYPE LT on (lt.lettertypeid = c.let' +
        'tertypeid)'
      '  where CUSTOMER_ID = :CUSTOMER_ID'
      ''
      'union all'
      ''
      'select'
      '    m.Mes_Id,'
      '    0,'
      '    cast(m.Send_Date as DATE) Send_Date,'
      '    m.Mes_Type,'
      '    m.Mes_Text,'
      '    m.Mes_Head'
      '  from messages m'
      '  where m.Customer_Id = :CUSTOMER_ID'
      ')'
      'order by Send_Date desc, Mes_Id')
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 119
    Top = 80
    WaitEndMasterScroll = True
    dcForceMasterRefresh = True
  end
  object srcLetters: TDataSource
    AutoEdit = False
    DataSet = dsLetters
    OnDataChange = srcLettersDataChange
    Left = 61
    Top = 81
  end
  object ActListCustomers: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 250
    Top = 81
    object actLetterDel: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100'  '#1087#1080#1089#1100#1084#1086
      ImageIndex = 3
      OnExecute = actLetterDelExecute
    end
  end
end
