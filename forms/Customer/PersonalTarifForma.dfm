object PersonalTarifForm: TPersonalTarifForm
  Left = 476
  Top = 214
  BorderStyle = bsDialog
  Caption = #1058#1072#1088#1080#1092' '#1076#1083#1103' '#1091#1089#1083#1091#1075#1080
  ClientHeight = 229
  ClientWidth = 357
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
  DesignSize = (
    357
    229)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 35
    Height = 13
    Caption = 'c '#1076#1072#1090#1099
  end
  object Label2: TLabel
    Left = 8
    Top = 43
    Width = 32
    Height = 13
    Caption = #1058#1072#1088#1080#1092
  end
  object lbl1: TLabel
    Left = 178
    Top = 11
    Width = 40
    Height = 13
    Caption = #1087#1086' '#1076#1072#1090#1091
  end
  object deTarif: TDBNumberEditEh
    Left = 49
    Top = 40
    Width = 121
    Height = 21
    DynProps = <>
    EditButton.Visible = True
    EditButtons = <>
    ShowHint = True
    TabOrder = 2
    Value = 0.000000000000000000
    Visible = True
    OnExit = ControlExit
  end
  object deDate_from: TDBDateTimeEditEh
    Left = 49
    Top = 8
    Width = 121
    Height = 21
    DynProps = <>
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 0
    Visible = True
    OnExit = ControlExit
  end
  object btnCancel: TBitBtn
    Left = 274
    Top = 198
    Width = 75
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 5
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 198
    Width = 252
    Height = 23
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    NumGlyphs = 2
    TabOrder = 4
    OnClick = btnOkClick
  end
  object deDate_to: TDBDateTimeEditEh
    Left = 227
    Top = 8
    Width = 121
    Height = 21
    DynProps = <>
    EditButtons = <>
    Kind = dtkDateEh
    ShowHint = True
    TabOrder = 1
    Visible = True
    OnExit = ControlExit
  end
  object dbmNotice: TDBMemoEh
    Left = 8
    Top = 70
    Width = 341
    Height = 122
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 3
    Visible = True
    WantReturns = True
  end
  object Query: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      
        'update or insert into Personal_Tarif (Tarif_Id, Service_Id, Cust' +
        'omer_Id, Date_From, Date_To, Tarif_Sum, Notice, Add_Method)'
      
        'values (iif(:Tarif_Id = -1, gen_id(gen_operations_uid, 1), :Tari' +
        'f_Id) , :Service_Id, :Customer_Id, :Date_From, :Date_To, :Tarif_' +
        'Sum, :Notice, :Add_Method)'
      'matching (Tarif_Id)  ')
    Left = 229
    Top = 110
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = False
    Left = 160
    Top = 152
  end
  object qSelect: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select'
      '  pt.date_from'
      '  , pt.date_to'
      '  , pt.tarif_sum'
      '  , pt.Notice'
      '  from personal_tarif pt'
      '  where pt.tarif_id = :tarif_id'
      ''
      '    ')
    Left = 112
    Top = 120
    qoAutoCommit = True
    qoStartTransaction = True
  end
end
