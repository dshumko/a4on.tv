object AdminUserForm: TAdminUserForm
  ShowHint = True
  Left = 422
  Top = 304
  Width = 586
  Height = 473
  Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1077' '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 16
    Width = 89
    Height = 25
    Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1041#1044
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 40
    Top = 56
    Width = 441
    Height = 305
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object pFIBStatisticalService1: TpFIBStatisticalService
    LibraryName = 'fbclient.dll'
    Options = []
    Left = 200
    Top = 80
  end
  object pFIBBackupService1: TpFIBBackupService
    LibraryName = 'fbclient.dll'
    BlockingFactor = 0
    Options = []
    Left = 48
    Top = 80
  end
  object pFIBRestoreService1: TpFIBRestoreService
    LibraryName = 'fbclient.dll'
    PageSize = 0
    PageBuffers = 0
    Left = 48
    Top = 136
  end
  object pFIBValidationService: TpFIBValidationService
    ServerName = 'LOCALHOST:TV_JODINO'
    Protocol = TCP
    LibraryName = 'fbclient.dll'
    DatabaseName = 'LOCALHOST:TV_JODINO'
    Options = [ValidateDB]
    GlobalAction = CommitGlobal
    OnTextNotify = pFIBValidationServiceTextNotify
    Left = 48
    Top = 200
  end
  object pFIBSecurityService1: TpFIBSecurityService
    LibraryName = 'fbclient.dll'
    SecurityAction = ActionAddUser
    UserID = 0
    GroupID = 0
    Left = 48
    Top = 264
  end
end
