object frmSelectLetterType: TfrmSelectLetterType
  Left = 299
  Top = 226
  ActiveControl = cbLetterType
  Caption = #1042#1099#1073#1086#1088' '#1087#1077#1095#1072#1090#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 109
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poOwnerFormCenter
  ShowHint = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 109
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      392
      109)
    object Label1: TLabel
      Left = 7
      Top = 19
      Width = 76
      Height = 13
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    end
    object Panel2: TPanel
      Left = 0
      Top = 72
      Width = 392
      Height = 37
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        392
        37)
      object bbOk: TBitBtn
        Left = 80
        Top = 8
        Width = 222
        Height = 25
        Anchors = [akLeft, akRight, akBottom]
        Caption = #1042#1099#1073#1088#1072#1090#1100
        Default = True
        ModalResult = 1
        NumGlyphs = 2
        TabOrder = 0
      end
      object bbCancel: TBitBtn
        Left = 308
        Top = 8
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = #1054#1090#1084#1077#1085#1072
        ModalResult = 2
        TabOrder = 1
      end
    end
    object cbLetterType: TDBLookupComboboxEh
      Left = 90
      Top = 16
      Width = 293
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.ListFieldNames = 'LETTERTYPEDESCR'
      DropDownBox.ListSource = srcLetterTypes
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterType = lsftContainsEh
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.AutoDrop = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1092#1086#1088#1084#1091' '#1087#1077#1095#1072#1090#1080
      EditButtons = <>
      KeyField = 'LETTERTYPEID'
      ListField = 'LETTERTYPEDESCR'
      ListSource = srcLetterTypes
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
      OnClick = cbLetterTypeClick
    end
  end
  object dsLetterTypes: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    -2 LETTERTYPEID'
      '  , '#39#1041#1072#1083#1072#1085#1089' '#1072#1073#1086#1085#1077#1085#1090#1072#39' Lettertypedescr'
      '  , '#39#39' Filename'
      '  , 0 Recordindb'
      '  , 0 Save_PDF'
      'from rdb$database  '
      'union all  '
      'select'
      '    LETTERTYPEID'
      '  , Lettertypedescr'
      '  , Filename'
      '  , coalesce(Recordindb, 0) Recordindb'
      '  , coalesce(Save_PDF, 0) Save_PDF'
      '  from LETTERTYPE l'
      '       inner join(select'
      
        '                      replace(upper(FULL_PATH), '#39'.FR3'#39', '#39#39') FULL' +
        '_PATH'
      
        '                    from Get_All_Reports) r on (r.FULL_PATH = re' +
        'place(upper(l.Filename), '#39'.FR3'#39', '#39#39'))'
      '  where coalesce(FOR_FORM, 0) = 0 and l.LETTERTYPEID >= 0'
      '  order by 2')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 232
    Top = 8
  end
  object srcLetterTypes: TDataSource
    AutoEdit = False
    DataSet = dsLetterTypes
    Left = 320
    Top = 8
  end
end
