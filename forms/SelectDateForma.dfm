object SelectDateForm: TSelectDateForm
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1042#1099#1073#1086#1088' '#1076#1072#1090#1099' '#1076#1083#1103' '#1079#1072#1103#1074#1082#1080
  ClientHeight = 224
  ClientWidth = 426
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
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inline frDates: TfrmRequestDate
    Left = 0
    Top = 0
    Width = 426
    Height = 183
    Align = alClient
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    inherited pnlGrid: TPanel
      Width = 426
      Height = 183
      BevelOuter = bvNone
      inherited sgCalendar: TStringGrid
        Left = 0
        Top = 32
        Width = 426
        Height = 151
        TabOrder = 1
        OnDblClick = frDatessgCalendarDblClick
      end
      inherited pnlInfo: TPanel
        Left = 0
        Top = 0
        Width = 426
        TabOrder = 0
        inherited btnNextMon: TBitBtn
          Left = 331
        end
      end
    end
  end
  object pnlBTNS: TPanel
    Left = 0
    Top = 183
    Width = 426
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Panel1: TPanel
      Left = 260
      Top = 1
      Width = 165
      Height = 39
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        165
        39)
      object bbOk: TBitBtn
        Left = 3
        Top = 7
        Width = 75
        Height = 23
        Anchors = [akRight, akBottom]
        Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
        Default = True
        ModalResult = 1
        NumGlyphs = 2
        TabOrder = 0
      end
      object bbCancel: TBitBtn
        Left = 84
        Top = 7
        Width = 75
        Height = 23
        Anchors = [akRight, akBottom]
        Cancel = True
        Caption = #1054#1090#1084#1077#1085#1072
        ModalResult = 2
        TabOrder = 1
      end
    end
  end
end
