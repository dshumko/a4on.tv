object PaymentEditFrm: TPaymentEditFrm
  Left = 0
  Top = 0
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
  ClientHeight = 278
  ClientWidth = 364
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAbonent: TPanel
    Left = 0
    Top = 0
    Width = 364
    Height = 130
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object pnlSearchAbonent: TPanel
      Left = 0
      Top = 0
      Width = 172
      Height = 130
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 172
        Height = 13
        Align = alTop
        Caption = '  '#1055#1086#1080#1089#1082' '#1072#1073#1086#1085#1077#1085#1090#1072' '#1087#1086':'
      end
      object Label2: TLabel
        Left = 5
        Top = 28
        Width = 49
        Height = 13
        Caption = #1051#1080#1094#1077#1074#1086#1084#1091
      end
      object Label5: TLabel
        Left = 5
        Top = 59
        Width = 47
        Height = 13
        Caption = #1080#1083#1080' '#1050#1086#1076#1091
      end
      object lblPaySum: TLabel
        Left = 5
        Top = 99
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = #1057#1091#1084#1084#1072' '#1085#1072' '#1089#1095#1077#1090
      end
      object edCode: TEdit
        Left = 58
        Top = 56
        Width = 110
        Height = 21
        TabStop = False
        TabOrder = 1
        OnChange = edCodeChange
      end
      object edLicevoy: TEdit
        Left = 58
        Top = 25
        Width = 110
        Height = 21
        TabOrder = 0
        OnChange = edLicevoyChange
      end
      object dePaySum: TDBNumberEditEh
        Tag = 13
        Left = 89
        Top = 96
        Width = 79
        Height = 21
        DisplayFormat = '### ### ### ##0.##'
        DynProps = <>
        EditButtons = <>
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Value = 0.000000000000000000
        Visible = True
        OnChange = dePaySumChange
      end
    end
    object memAbonent: TDBMemoEh
      Left = 172
      Top = 0
      Width = 192
      Height = 130
      TabStop = False
      Align = alClient
      AutoSize = False
      BorderStyle = bsNone
      Color = clBtnFace
      DynProps = <>
      EditButtons = <>
      ReadOnly = True
      TabOrder = 1
      Visible = True
      WantReturns = True
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 240
    Width = 364
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      364
      38)
    object bbOk: TBitBtn
      Left = 59
      Top = 6
      Width = 213
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      NumGlyphs = 2
      TabOrder = 0
      OnClick = bbOkClick
    end
    object bbCancel: TBitBtn
      Left = 278
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
  object mmoNotice: TDBMemoEh
    Left = 0
    Top = 217
    Width = 364
    Height = 23
    Align = alClient
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    TabOrder = 3
    Visible = True
    WantReturns = True
  end
  object pnlSRV: TPanel
    Left = 0
    Top = 182
    Width = 364
    Height = 35
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      364
      35)
    object lPaymentSrv: TLabel
      Left = 5
      Top = 10
      Width = 35
      Height = 13
      Caption = #1059#1089#1083#1091#1075#1072
    end
    object luPaymentSrv: TDBLookupComboboxEh
      Left = 89
      Top = 8
      Width = 264
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      EditButtons = <>
      KeyField = 'SERVICE_ID'
      ListField = 'NAME'
      ListSource = srcPaymentSRV
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
  end
  object pnlFine: TPanel
    Left = 0
    Top = 156
    Width = 364
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lbl1: TLabel
      Left = 5
      Top = 5
      Width = 25
      Height = 13
      Caption = #1055#1077#1085#1103
    end
    object edtFine: TDBNumberEditEh
      Tag = 13
      Left = 89
      Top = 2
      Width = 109
      Height = 21
      DisplayFormat = '### ### ### ##0.##'
      DynProps = <>
      EditButtons = <>
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 0.000000000000000000
      Visible = True
      OnChange = dePaySumChange
    end
  end
  object pnlTYPE: TPanel
    Left = 0
    Top = 130
    Width = 364
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      364
      26)
    object Label3: TLabel
      Left = 5
      Top = 5
      Width = 77
      Height = 13
      Caption = #1057#1087#1086#1089#1086#1073' '#1086#1087#1083#1072#1090#1099
    end
    object cbbPayTypeStr: TDBComboBoxEh
      Left = 88
      Top = 3
      Width = 265
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      EditButtons = <>
      Items.Strings = (
        'CASH'
        'CARD'
        'WEB')
      KeyItems.Strings = (
        'CASH'
        'CARD'
        'WEB')
      TabOrder = 0
      Visible = True
    end
  end
  object srcPaymentSRV: TDataSource
    AutoEdit = False
    DataSet = dsPaymentSRV
    Left = 250
    Top = 88
  end
  object dsPaymentSRV: TpFIBDataSet
    SelectSQL.Strings = (
      'select s.service_id, s.name, s.description'
      'from services s'
      'order by name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 250
    Top = 32
    oStartTransaction = False
    oFetchAll = True
  end
end
