object EditRFileForm: TEditRFileForm
  Left = 540
  Top = 390
  BorderIcons = [biSystemMenu]
  Caption = #1060#1086#1090#1086' '#1076#1083#1103' '#1079#1072#1103#1074#1082#1080
  ClientHeight = 168
  ClientWidth = 366
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
  OnKeyDown = FormKeyDown
  DesignSize = (
    366
    168)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 31
    Width = 61
    Height = 13
    Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
  end
  object lblFileCh: TLabel
    Left = 8
    Top = 10
    Width = 26
    Height = 13
    Caption = #1060#1072#1081#1083
  end
  object memNotice: TDBMemoEh
    Left = 8
    Top = 47
    Width = 350
    Height = 81
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DynProps = <>
    EditButtons = <>
    EmptyDataInfo.Text = #1054#1087#1080#1089#1072#1085#1080#1077
    ShowHint = True
    TabOrder = 1
    Visible = True
    WantReturns = True
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 134
    Width = 269
    Height = 26
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
    Anchors = [akLeft, akRight, akBottom]
    Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
    NumGlyphs = 2
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCancel: TBitBtn
    Left = 283
    Top = 134
    Width = 75
    Height = 26
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
  object edtFILE: TDBEditEh
    Left = 67
    Top = 7
    Width = 291
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DynProps = <>
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = edtFILEEditButtons0Click
      end>
    EmptyDataInfo.Text = #1059#1082#1072#1078#1080#1090#1077' '#1092#1072#1081#1083
    ReadOnly = True
    ShowHint = True
    TabOrder = 0
    Visible = True
  end
  object CnErrors: TCnErrorProvider
    DoubleBuffer = True
    Left = 163
    Top = 72
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '*.*'
    Filter = #1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*|'#1060#1086#1090#1086'|*.jpg;*.png'
    FilterIndex = 2
    Left = 216
    Top = 56
  end
  object qryFile: TpFIBQuery
    Transaction = dmMain.trWriteQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'insert into Request_Photos (Rq_Id, Jpg, Notice, House_Id)'
      'values (:Rq_Id, :Jpg, :Notice, :House_Id)')
    Left = 272
    Top = 88
    qoAutoCommit = True
    qoStartTransaction = True
  end
end
