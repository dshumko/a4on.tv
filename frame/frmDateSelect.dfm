object frmRequestDate: TfrmRequestDate
  ShowHint = True
  Left = 0
  Top = 0
  Width = 320
  Height = 240
  TabOrder = 0
  OnResize = FrameResize
  object pnlGrid: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 240
    Align = alClient
    Caption = 'pnlGrid'
    TabOrder = 0
    object sgCalendar: TStringGrid
      Left = 1
      Top = 33
      Width = 318
      Height = 206
      Align = alClient
      ColCount = 7
      Ctl3D = True
      DefaultColWidth = 42
      DefaultRowHeight = 15
      FixedCols = 0
      RowCount = 7
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine]
      ParentCtl3D = False
      ScrollBars = ssNone
      TabOrder = 0
      OnDrawCell = sgCalendarDrawCell
      OnSelectCell = sgCalendarSelectCell
    end
    object pnlInfo: TPanel
      Left = 1
      Top = 1
      Width = 318
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        318
        32)
      object btnNextMon: TBitBtn
        Left = 223
        Top = 2
        Width = 90
        Height = 25
        Action = actNextMon
        Anchors = [akTop, akRight]
        Caption = #1089#1083'. '#1084#1077#1089#1103#1094' >'
        TabOrder = 1
      end
      object btnPrevMon: TBitBtn
        Left = 5
        Top = 2
        Width = 90
        Height = 25
        Action = actPrevMon
        Caption = '< '#1087#1088#1077#1076'. '#1084#1077#1089#1103#1094
        TabOrder = 0
      end
    end
  end
  object qBusyDays: TpFIBQuery
    Transaction = dmMain.trReadQ
    Database = dmMain.dbTV
    SQL.Strings = (
      'select BUSY_DAY '
      'from GET_REQUEST_BUSY_DAYS(:HOUSE_ID, :FROM_DATE, :TO_DATE)')
    Left = 56
    Top = 153
  end
  object actlst1: TActionList
    Left = 120
    Top = 96
    object actPrevMon: TAction
      Caption = '< '#1087#1088#1077#1076'. '#1084#1077#1089#1103#1094
      ShortCut = 8232
      OnExecute = actPrevMonExecute
    end
    object actNextMon: TAction
      Caption = #1089#1083'. '#1084#1077#1089#1103#1094' >'
      ShortCut = 8230
      OnExecute = actNextMonExecute
    end
  end
end
