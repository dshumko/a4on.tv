object fmCardPayActivate: TfmCardPayActivate
  Left = 505
  Top = 208
  ActiveControl = edtLicevoy
  Caption = #1040#1082#1090#1080#1074#1080#1088#1086#1074#1072#1090#1100' '#1082#1072#1088#1090#1086#1095#1082#1091
  ClientHeight = 495
  ClientWidth = 399
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
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 121
    Width = 399
    Height = 339
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object grpCustomer: TGroupBox
      Left = 0
      Top = 0
      Width = 399
      Height = 185
      Align = alTop
      Caption = ' '#1055#1086#1080#1089#1082' '#1072#1073#1086#1085#1077#1085#1090#1072' '
      TabOrder = 0
      object lbl1: TLabel
        Left = 16
        Top = 21
        Width = 64
        Height = 13
        Caption = #1055#1086' '#1083#1080#1094#1077#1074#1086#1084#1091
      end
      object lbl2: TLabel
        Left = 16
        Top = 61
        Width = 26
        Height = 13
        Caption = #1050#1086#1076#1091
      end
      object lbl6: TLabel
        Left = 8
        Top = 44
        Width = 18
        Height = 13
        Caption = #1080#1083#1080
      end
      object lbl7: TLabel
        Left = 8
        Top = 80
        Width = 18
        Height = 13
        Caption = #1080#1083#1080
      end
      object edtLicevoy: TEdit
        Left = 88
        Top = 18
        Width = 301
        Height = 21
        TabOrder = 0
        OnExit = edtLicevoyExit
      end
      object edtCode: TEdit
        Left = 88
        Top = 58
        Width = 301
        Height = 21
        TabStop = False
        TabOrder = 1
        OnExit = edtCodeExit
      end
      object grp3: TGroupBox
        Left = 8
        Top = 96
        Width = 388
        Height = 81
        Caption = ' '#1040#1076#1088#1077#1089#1091' '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object lbl3: TLabel
          Left = 8
          Top = 24
          Width = 31
          Height = 13
          Caption = #1059#1083#1080#1094#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 237
          Top = 24
          Width = 20
          Height = 13
          Caption = #1044#1086#1084
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbl5: TLabel
          Left = 320
          Top = 24
          Width = 13
          Height = 13
          Caption = #1050#1074
        end
        object LupStreets: TDBLookupComboboxEh
          Left = 48
          Top = 21
          Width = 184
          Height = 21
          TabStop = False
          DynProps = <>
          DataField = ''
          DropDownBox.Columns = <
            item
              AutoFitColWidth = False
              FieldName = 'STREET_SHORT'
              Title.Caption = #1089#1086#1082#1088'.'
              Width = 20
            end
            item
              FieldName = 'STREET_NAME'
              Title.Caption = #1059#1083#1080#1094#1072
            end
            item
              FieldName = 'AREA_NAME'
              Title.Caption = #1056#1072#1081#1086#1085
            end>
          DropDownBox.AutoDrop = True
          DropDownBox.ShowTitles = True
          DropDownBox.Sizable = True
          EditButtons = <>
          KeyField = 'STREET_ID'
          ListField = 'STREET_NAME'
          ListSource = srcStreet
          ShowHint = True
          TabOrder = 0
          Visible = True
          OnEnter = LupStreetsEnter
        end
        object LupHOUSE: TDBLookupComboboxEh
          Left = 262
          Top = 21
          Width = 52
          Height = 21
          TabStop = False
          DynProps = <>
          DataField = ''
          EditButtons = <>
          KeyField = 'HOUSE_ID'
          ListField = 'HOUSE_NO'
          ListSource = srcHouse
          ShowHint = True
          TabOrder = 1
          Visible = True
        end
        object edtFLAT_NO: TDBEditEh
          Tag = 7
          Left = 335
          Top = 21
          Width = 46
          Height = 21
          TabStop = False
          DynProps = <>
          EditButtons = <>
          ShowHint = True
          TabOrder = 2
          Visible = True
        end
        object btnFind: TButton
          Left = 148
          Top = 50
          Width = 233
          Height = 23
          Hint = #1053#1072#1081#1090#1080' '#1072#1073#1086#1085#1077#1085#1090#1072' '#1087#1086' '#1072#1076#1088#1077#1089#1091' '#1079#1072#1103#1074#1082#1080
          Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1072#1076#1088#1077#1089#1091
          TabOrder = 3
          TabStop = False
          OnClick = btnFindClick
        end
      end
    end
    object grp2: TGroupBox
      Left = 0
      Top = 232
      Width = 399
      Height = 73
      Align = alTop
      Caption = ' '#1040#1073#1086#1085#1077#1085#1090#1091'  '
      TabOrder = 2
      object mmoAbonent: TDBMemoEh
        Left = 2
        Top = 15
        Width = 395
        Height = 56
        TabStop = False
        Align = alClient
        AutoSize = False
        BorderStyle = bsNone
        Color = clBtnFace
        DynProps = <>
        EditButtons = <>
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        Visible = True
        WantReturns = True
      end
    end
    object pnl2: TPanel
      Left = 0
      Top = 185
      Width = 399
      Height = 47
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lbl9: TLabel
        Left = 16
        Top = 20
        Width = 53
        Height = 13
        Caption = #1047#1072#1095#1080#1089#1083#1080#1090#1100
      end
      object lblSUMMA: TLabel
        Left = 80
        Top = 16
        Width = 5
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnl3: TPanel
      Left = 0
      Top = 305
      Width = 399
      Height = 34
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object lbl8: TLabel
        Left = 16
        Top = 19
        Width = 128
        Height = 13
        Caption = #1042#1074#1077#1076#1080#1090#1077' '#1076#1072#1090#1091' '#1072#1082#1090#1080#1074#1072#1094#1080#1080
      end
      object dePayDate: TDBDateTimeEditEh
        Left = 156
        Top = 16
        Width = 233
        Height = 21
        DynProps = <>
        EditButtons = <>
        Kind = dtkDateEh
        ShowHint = True
        TabOrder = 0
        Visible = True
      end
    end
  end
  inline okcnclfrm: TOkCancelFrame
    Left = 0
    Top = 460
    Width = 399
    Height = 35
    Align = alBottom
    TabOrder = 2
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 156
      Top = 6
      Width = 148
      Caption = #1047#1072#1095#1080#1089#1083#1080#1090#1100
      Enabled = False
      TabOrder = 1
      OnClick = okcnclfrmbbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 310
      Top = 6
      Width = 79
      TabOrder = 0
    end
  end
  object pnlCard: TPanel
    Left = 0
    Top = 0
    Width = 399
    Height = 121
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object grpCard: TGroupBox
      Left = 0
      Top = 0
      Width = 399
      Height = 121
      Align = alClient
      Caption = ' '#1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1082#1072#1088#1090#1086#1095#1082#1077' '
      TabOrder = 0
      object lbl10: TLabel
        Left = 8
        Top = 19
        Width = 31
        Height = 13
        Caption = #1057#1077#1088#1080#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lbl11: TLabel
        Left = 8
        Top = 45
        Width = 31
        Height = 13
        Caption = #1053#1086#1084#1077#1088
      end
      object lblPIN: TLabel
        Left = 8
        Top = 71
        Width = 40
        Height = 13
        Caption = 'PIN-'#1082#1086#1076
      end
      object cbSerialSerials: TDBLookupComboboxEh
        Left = 56
        Top = 16
        Width = 333
        Height = 21
        DynProps = <>
        DataField = ''
        DropDownBox.Columns = <
          item
            FieldName = 'CS_SERIAL'
          end
          item
            FieldName = 'Paysource_Descr'
            Width = 30
          end
          item
            FieldName = 'CS_NOTICE'
          end>
        DropDownBox.ListSource = srcCardSerial
        DropDownBox.AutoDrop = True
        DropDownBox.Sizable = True
        EditButtons = <>
        KeyField = 'CS_ID'
        ListField = 'CS_SERIAL'
        ListSource = srcCardSerial
        ShowHint = True
        TabOrder = 0
        Visible = True
        OnExit = edtNUMBERExit
      end
      object edtNUMBER: TEdit
        Left = 56
        Top = 42
        Width = 333
        Height = 21
        TabOrder = 1
        OnExit = edtNUMBERExit
      end
      object edtPIN: TEdit
        Left = 56
        Top = 68
        Width = 333
        Height = 21
        TabOrder = 3
        OnExit = edtNUMBERExit
      end
      object btnCardFind: TButton
        Left = 156
        Top = 93
        Width = 233
        Height = 25
        Caption = #1055#1086#1080#1089#1082
        TabOrder = 2
        OnClick = btnCardFindClick
      end
    end
  end
  object dsStreets: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT s.street_id, s.street_short,s.street_name, a.area_name'
      'FROM STREET s left outer join area a on (a.area_id = s.area_id)'
      'ORDER BY STREET_NAME, a.area_name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 288
    Top = 101
  end
  object srcStreet: TDataSource
    DataSet = dsStreets
    Left = 330
    Top = 101
  end
  object dsHomes: TpFIBDataSet
    SelectSQL.Strings = (
      'SELECT'
      '    H.HOUSE_ID,'
      '    H.STREET_ID,'
      '    H.HOUSE_NO,'
      '    H.Q_FLAT'
      'FROM'
      '    HOUSE H'
      'where h.street_id = :street_id'
      'order by h.HOUSE_NO'
      '')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    DataSource = srcStreet
    Left = 298
    Top = 149
  end
  object srcHouse: TDataSource
    DataSet = dsHomes
    Left = 338
    Top = 149
  end
  object qActivate: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      
        'EXECUTE PROCEDURE Cards_Prepay_Activate (:CARD_ID, :CUSTOMER_ID,' +
        ' :Pay_Date)')
    Left = 248
    Top = 152
    qoStartTransaction = True
  end
  object srcCardPay: TDataSource
    Left = 281
    Top = 201
  end
  object dsCardSerial: TpFIBDataSet
    DeleteSQL.Strings = (
      ''
      '    ')
    RefreshSQL.Strings = (
      ''
      '')
    SelectSQL.Strings = (
      'SELECT '
      '    Cs.Cs_Id,'
      '    Cs.Cs_Serial,'
      '    Cs.Cs_Notice,'
      '    Ps.Paysource_Descr'
      'FROM Cards_Serials Cs'
      
        '   LEFT OUTER JOIN Paysource Ps ON (Cs.Cs_Source_Id = Ps.Paysour' +
        'ce_Id)'
      'order by Cs.Cs_Serial'
      '')
    AutoUpdateOptions.GeneratorName = 'GEN__ID'
    AutoUpdateOptions.WhenGetGenID = wgBeforePost
    AutoCalcFields = False
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 296
    Top = 24
  end
  object srcCardSerial: TDataSource
    AutoEdit = False
    DataSet = dsCardSerial
    Left = 304
    Top = 48
  end
end
