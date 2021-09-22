object MapForm: TMapForm
  Left = 0
  Top = 0
  Caption = 'Map GPS'
  ClientHeight = 539
  ClientWidth = 828
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  Menu = mmMap
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 828
    Height = 539
    Align = alClient
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 0
    object Panel10: TPanel
      Left = 0
      Top = 515
      Width = 828
      Height = 24
      Align = alBottom
      BevelOuter = bvNone
      Caption = ' '
      TabOrder = 0
      object Panel11: TPanel
        Left = 0
        Top = 0
        Width = 828
        Height = 23
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        TabOrder = 0
        object Label32: TLabel
          Left = 152
          Top = 4
          Width = 17
          Height = 14
          Caption = 'Lat'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lLatEvent: TLabel
          Left = 178
          Top = 4
          Width = 104
          Height = 14
          AutoSize = False
        end
        object lLngEvent: TLabel
          Left = 314
          Top = 4
          Width = 104
          Height = 14
          AutoSize = False
        end
        object Label34: TLabel
          Left = 288
          Top = 4
          Width = 21
          Height = 14
          Caption = 'Lng'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  object gmMap: TGMMap
    APIKey = ''
    RequiredProp.MapType = mtHYBRID
    RequiredProp.Zoom = 12
    NonVisualProp.Options = [Draggable, KeyboardShortcuts, NoClear, ScrollWheel]
    AfterPageLoaded = gmMapAfterPageLoaded
    OnMouseMove = gmMapMouseMove
    VisualProp.PanCtrl.Show = False
    VisualProp.RotateCtrl.Show = False
    VisualProp.StreetViewCtrl.Show = False
    VisualProp.BGColor = 15659247
    Left = 184
    Top = 160
  end
  object gmInfoWindow: TGMInfoWindow
    Map = gmMap
    VisualObjects = <>
    Left = 184
    Top = 256
  end
  object gmMovements: TGMPolyline
    Map = gmMap
    VisualObjects = <
      item
        StrokeOpacity = 1.000000000000000000
        LinePoints = <
          item
          end>
        Text = 'TPolyline'
        Icon.DistRepeat.Value = 0
        Icon.DistRepeat.Measure = mPixels
        CurveLine.Resolution = 0.100000000000000000
      end>
    Left = 416
    Top = 240
  end
  object mmMap: TMainMenu
    Left = 400
    Top = 152
    object N1: TMenuItem
      Caption = #1050#1072#1088#1090#1072
      GroupIndex = 2
      object miBid: TMenuItem
        Action = actShowBid
      end
      object miLastPosition: TMenuItem
        Action = actLastPosition
      end
      object N3: TMenuItem
        Action = actMovements
      end
      object miN3: TMenuItem
        Caption = '-'
      end
      object miSave: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1082#1072#1088#1090#1091
        OnClick = miSaveClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object miGeoCode: TMenuItem
        Action = actGeocoding
      end
    end
  end
  object gmGeoCode: TGMGeoCode
    Map = gmMap
    Region = rBELARUS
    LangCode = lcRUSSIAN
    Left = 632
    Top = 168
  end
  object qWrite: TpFIBQuery
    Transaction = trWrite
    Database = dmMain.dbTV
    Left = 327
    Top = 416
  end
  object qRead: TpFIBQuery
    Transaction = trRead
    Database = dmMain.dbTV
    Left = 331
    Top = 360
    qoFreeHandleAfterExecute = True
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 444
    Top = 405
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Timeout = 36000000
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 443
    Top = 356
  end
  object actlst: TActionList
    Left = 304
    Top = 128
    object actShowBid: TAction
      Caption = #1047#1072#1103#1074#1082#1080' '#1085#1072' '#1089#1077#1075#1086#1076#1085#1103
      OnExecute = actShowBidExecute
    end
    object actGeocoding: TAction
      Caption = #1055#1088#1086#1089#1090#1072#1074#1080#1090#1100' '#1082#1086#1086#1088#1076#1080#1085#1072#1090#1099' '#1076#1086#1084#1072#1084
      OnExecute = actGeocodingExecute
    end
    object actLastPosition: TAction
      Caption = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1087#1086#1079#1080#1094#1080#1103' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
      OnExecute = actLastPositionExecute
    end
    object actMovements: TAction
      Caption = #1055#1077#1088#1077#1076#1074#1080#1078#1077#1085#1080#1077' '#1084#1086#1085#1090#1072#1078#1085#1080#1082#1086#1074
      Hint = #1055#1077#1088#1077#1076#1074#1080#1078#1077#1085#1080#1077' '#1084#1086#1085#1090#1072#1078#1085#1080#1082#1086#1074' '#1079#1072' '#1089#1077#1075#1086#1076#1085#1103
      OnExecute = actMovementsExecute
    end
  end
  object gmMrkrBids: TGMMarker
    Map = gmMap
    VisualObjects = <>
    Left = 64
    Top = 224
  end
  object gmMrkrLast: TGMMarker
    Map = gmMap
    VisualObjects = <>
    Left = 64
    Top = 296
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '*.jpg'
    Filter = 'Jpg file|*.jpg'
    Left = 400
    Top = 80
  end
end
