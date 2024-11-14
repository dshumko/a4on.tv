object PaymentEditFrm: TPaymentEditFrm
  Left = 0
  Top = 0
  Caption = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1087#1083#1072#1090#1077#1078#1072
  ClientHeight = 328
  ClientWidth = 400
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAbonent: TPanel
    Left = 0
    Top = 0
    Width = 400
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
        DisplayFormat = ',0.00'
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
      Width = 228
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
    Top = 290
    Width = 400
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    DesignSize = (
      400
      38)
    object bbOk: TBitBtn
      Left = 59
      Top = 6
      Width = 249
      Height = 25
      Anchors = [akLeft, akRight, akBottom]
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      NumGlyphs = 2
      TabOrder = 0
      OnClick = bbOkClick
    end
    object bbCancel: TBitBtn
      Left = 314
      Top = 6
      Width = 80
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #1054#1090#1084#1077#1085#1072
      ModalResult = 2
      TabOrder = 1
    end
  end
  object mmoNotice: TDBMemoEh
    Left = 5
    Top = 210
    Width = 389
    Height = 80
    Align = alCustom
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    TabOrder = 3
    Visible = True
    WantReturns = True
    OnChange = mmoNoticeChange
  end
  object pnlSRV: TPanel
    Left = 0
    Top = 182
    Width = 400
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      400
      28)
    object lPaymentSrv: TLabel
      Left = 5
      Top = 5
      Width = 35
      Height = 13
      Caption = #1059#1089#1083#1091#1075#1072
    end
    object luPaymentSrv: TDBLookupComboboxEh
      Left = 89
      Top = 2
      Width = 305
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
    Width = 400
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      400
      26)
    object lbl1: TLabel
      Left = 5
      Top = 5
      Width = 25
      Height = 13
      Caption = #1055#1077#1085#1103
    end
    object lbl2: TLabel
      Left = 221
      Top = 5
      Width = 41
      Height = 13
      Caption = #1042#1085#1077#1089#1077#1085#1086
    end
    object edtFine: TDBNumberEditEh
      Tag = 13
      Left = 89
      Top = 2
      Width = 109
      Height = 21
      DisplayFormat = ',0.00'
      DynProps = <>
      EditButtons = <>
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 0.000000000000000000
      Visible = True
      OnChange = dePaySumChange
    end
    object ednItogo: TDBNumberEditEh
      Tag = 13
      Left = 280
      Top = 2
      Width = 114
      Height = 21
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      Color = clBtnFace
      DisplayFormat = ',0.00'
      DynProps = <>
      EditButtons = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
  end
  object pnlTYPE: TPanel
    Left = 0
    Top = 130
    Width = 400
    Height = 26
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 5
    DesignSize = (
      400
      26)
    object Label3: TLabel
      Left = 5
      Top = 5
      Width = 77
      Height = 13
      Caption = #1057#1087#1086#1089#1086#1073' '#1086#1087#1083#1072#1090#1099
    end
    object cbbPayTypeStr: TDBLookupComboboxEh
      Left = 89
      Top = 2
      Width = 305
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DynProps = <>
      DataField = ''
      EmptyDataInfo.Text = #1057#1087#1086#1089#1086#1073' '#1086#1087#1083#1072#1090#1099
      EditButtons = <>
      KeyField = 'O_NAME'
      ListField = 'O_NAME'
      ListSource = srcPT
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
  end
  object srcPaymentSRV: TDataSource
    AutoEdit = False
    DataSet = dsPaymentSRV
    Left = 218
    Top = 72
  end
  object dsPaymentSRV: TpFIBDataSet
    SelectSQL.Strings = (
      'select s.service_id, s.name, s.description'
      'from services s'
      'order by name')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 218
    Top = 24
    oStartTransaction = False
    oFetchAll = True
  end
  object srcPT: TDataSource
    AutoEdit = False
    DataSet = dsPT
    Left = 290
    Top = 72
  end
  object dsPT: TpFIBDataSet
    SelectSQL.Strings = (
      'select o.O_Name'
      'from objects o'
      'where o.O_Type = 61'
      'order by 1')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    Left = 290
    Top = 24
    oStartTransaction = False
    oFetchAll = True
  end
end
