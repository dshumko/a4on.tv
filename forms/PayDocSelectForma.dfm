object PayDocSelectForm: TPayDocSelectForm
  Left = 0
  Top = 0
  ActiveControl = dbluPayDoc
  BorderStyle = bsSizeToolWin
  Caption = #1042#1099#1073#1086#1088' '#1087#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
  ClientHeight = 93
  ClientWidth = 462
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBTNS: TPanel
    Left = 0
    Top = 52
    Width = 462
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Panel1: TPanel
      Left = 297
      Top = 0
      Width = 165
      Height = 41
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        165
        41)
      object bbOk: TBitBtn
        Left = 4
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = #1042#1099#1073#1088#1072#1090#1100
        Default = True
        ModalResult = 1
        NumGlyphs = 2
        TabOrder = 0
      end
      object bbCancel: TBitBtn
        Left = 85
        Top = 6
        Width = 75
        Height = 25
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = #1054#1090#1084#1077#1085#1072
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
  object pnlPayDoc: TPanel
    Left = 0
    Top = 0
    Width = 462
    Height = 52
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      462
      52)
    object dbluPayDoc: TDBLookupComboboxEh
      Left = 5
      Top = 16
      Width = 452
      Height = 21
      Hint = 
        #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090'.'#13#10#1045#1089#1083#1080' '#1087#1086#1083#1077' '#1085#1077' '#1079#1072#1087#1086#1083#1085#1080#1090#1100', '#1090#1086' '#1089#1086#1079#1076#1072#1089#1090 +
        #1089#1103' '#1085#1086#1074#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090' '#1089#1077#1075#1086#1076#1085#1103#1096#1085#1080#1084' '#1095#1080#1089#1083#1086#1084'.'
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      DropDownBox.Columns = <
        item
          FieldName = 'PAY_DOC_NO'
          Title.Caption = #1053#1086#1084#1077#1088
        end
        item
          AutoFitColWidth = False
          FieldName = 'PAY_DOC_DATE'
          Title.Caption = #1044#1072#1090#1072
          Width = 60
        end
        item
          FieldName = 'PAYSOURCE_DESCR'
          Title.Caption = #1048#1089#1090#1086#1095#1085#1080#1082
          Width = 45
        end
        item
          AutoFitColWidth = False
          FieldName = 'ADDED_BY'
          Title.Caption = #1050#1090#1086' '#1076#1086#1073#1072#1074#1080#1083
          Width = 45
        end>
      DropDownBox.ListSource = srcPaymentDocs
      DropDownBox.ListSourceAutoFilter = True
      DropDownBox.ListSourceAutoFilterAllColumns = True
      DropDownBox.Options = [dlgColumnResizeEh, dlgColLinesEh]
      DropDownBox.AutoDrop = True
      DropDownBox.ShowTitles = True
      DropDownBox.Sizable = True
      EmptyDataInfo.Text = #1055#1083#1072#1090#1077#1078#1085#1099#1081' '#1076#1086#1082#1091#1084#1077#1085#1090
      EditButtons = <>
      KeyField = 'PAY_DOC_ID'
      ListField = 'PAY_DOC_NO'
      ListSource = srcPaymentDocs
      ShowHint = True
      Style = csDropDownEh
      TabOrder = 0
      Visible = True
    end
  end
  object srcPaymentDocs: TDataSource
    AutoEdit = False
    DataSet = dsPaymentDocs
    Left = 154
    Top = 42
  end
  object dsPaymentDocs: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    *'
      '  from (select'
      
        '            D.PAY_DOC_ID, D.PAYSOURCE_ID, D.PAY_DOC_NO, D.PAY_DO' +
        'C_DATE, D.PAY_DOC_SUM, D.NOTICE, ps.paysource_descr, d.Added_By'
      '          from PAY_DOC D'
      
        '               left outer join PAYSOURCE PS on (D.PAYSOURCE_ID =' +
        ' PS.PAYSOURCE_ID)'
      
        '          where d.PAY_DOC_DATE between dateadd(DAY, -4, CURRENT_' +
        'DATE) and dateadd(DAY, 1, CURRENT_DATE)'
      '        union'
      '        select'
      
        '            D.PAY_DOC_ID, D.PAYSOURCE_ID, D.PAY_DOC_NO, D.PAY_DO' +
        'C_DATE, D.PAY_DOC_SUM, D.NOTICE, ps.paysource_descr, d.Added_By'
      '          from PAY_DOC D'
      
        '               left outer join PAYSOURCE PS on (D.PAYSOURCE_ID =' +
        ' PS.PAYSOURCE_ID)'
      '         where @filter%1=0'
      '        )'
      '  order by PAY_DOC_DATE desc, PAY_DOC_NO')
    AutoUpdateOptions.UpdateTableName = 'PAY_DOC'
    AutoUpdateOptions.KeyFields = 'PAY_DOC_ID'
    AutoUpdateOptions.GeneratorName = 'GEN_OPERATIONS_UID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AllowedUpdateKinds = [ukInsert]
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DefaultFormats.NumericDisplayFormat = '#'
    Left = 58
    Top = 41
    poImportDefaultValues = False
    oRefreshAfterPost = False
    oRefreshDeletedRecord = True
  end
end
