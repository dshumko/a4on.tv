object apgNodeCIRCUIT: TapgNodeCIRCUIT
  Left = 0
  Top = 0
  Caption = #1057#1093#1077#1084#1072' '#1091#1079#1083#1072
  ClientHeight = 211
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object tbAttributes: TToolBar
    Left = 0
    Top = 0
    Width = 28
    Height = 211
    Align = alLeft
    ButtonHeight = 23
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Images = A4MainForm.ICONS_ACTIVE
    TabOrder = 0
    object btnEdit: TToolButton
      Left = 0
      Top = 0
      Action = actEdit
      ParentShowHint = False
      Wrap = True
      ShowHint = True
    end
    object btnDel: TToolButton
      Left = 0
      Top = 23
      Action = actDel
      ParentShowHint = False
      ShowHint = True
    end
    object btn1: TToolButton
      Left = 0
      Top = 23
      Width = 31
      Caption = 'btn1'
      ImageIndex = 5
      Wrap = True
      Style = tbsSeparator
    end
    object btnView: TToolButton
      Left = 0
      Top = 77
      Action = actView
    end
  end
  object imgPNG: TDBImageEh
    Left = 28
    Top = 0
    Width = 751
    Height = 211
    Align = alClient
    DataField = 'PNG'
    DataSource = srcCircuit
    DynProps = <>
    EditButton.DefaultAction = True
    EditButton.Visible = True
    PopupMenu = pmCircuit
    TabOrder = 1
    OnDblClick = imgPNGDblClick
  end
  object dsCircuit: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE HOUSE_CIRCUIT'
      'SET '
      '    HOUSE_ID = :NODE_ID,'
      '    NAME = :NAME,'
      '    CIRCUIT = :CIRCUIT,'
      '    PNG = :PNG,'
      '    NOTICE = :NOTICE'
      'WHERE'
      '    HC_ID = :OLD_HC_ID')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    HOUSE_CIRCUIT'
      'WHERE'
      '        HC_ID = :OLD_HC_ID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO HOUSE_CIRCUIT('
      '    HC_ID,'
      '    HOUSE_ID,'
      '    NAME,'
      '    CIRCUIT,'
      '    PNG,'
      '    NOTICE'
      ')'
      'VALUES('
      '    :HC_ID,'
      '    :NODE_ID,'
      '    :NAME,'
      '    :CIRCUIT,'
      '    :PNG,'
      '    :NOTICE'
      ')'
      'returning HC_ID'
      ' ')
    RefreshSQL.Strings = (
      'select'
      'hc.*'
      'from HOUSE_CIRCUIT hc'
      'where(  house_id = :NODE_ID'
      '     ) and (     HC.HC_ID = :OLD_HC_ID'
      '     )'
      '    '
      '')
    SelectSQL.Strings = (
      'select'
      'hc.*'
      'from HOUSE_CIRCUIT hc'
      'where house_id = :NODE_ID'
      '')
    AutoCalcFields = False
    Transaction = trRead
    Database = dmMain.dbTV
    UpdateTransaction = trWrite
    AutoCommit = True
    Left = 131
    Top = 85
  end
  object srcCircuit: TDataSource
    DataSet = dsCircuit
    Left = 63
    Top = 35
  end
  object ActList: TActionList
    Images = A4MainForm.ICONS_ACTIVE
    Left = 206
    Top = 37
    object actAdd: TAction
      Caption = 'actAdd'
      ImageIndex = 2
    end
    object actEdit: TAction
      Caption = 'actEdit'
      ImageIndex = 4
      OnExecute = actEditExecute
    end
    object actDel: TAction
      Caption = 'actDel'
      ImageIndex = 3
      OnExecute = actDelExecute
    end
    object actView: TAction
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
      Hint = #1055#1088#1086#1089#1084#1086#1090#1088' '#1092#1072#1081#1083#1072
      ImageIndex = 38
      OnExecute = actViewExecute
    end
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'read'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 331
    Top = 42
  end
  object trWrite: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    TimeoutAction = TACommit
    TRParams.Strings = (
      'write'
      'nowait'
      'rec_version'
      'read_committed')
    TPBMode = tpbDefault
    Left = 371
    Top = 42
  end
  object pmCircuit: TPopupMenu
    Left = 608
    Top = 95
    object mniCircuitView: TMenuItem
      Caption = #1055#1088#1086#1089#1084#1086#1090#1088
    end
    object mniN2: TMenuItem
      Caption = #1048#1084#1079#1077#1085#1080#1090#1100
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N2: TMenuItem
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    end
  end
end
