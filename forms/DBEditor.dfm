object fmDBEditor: TfmDBEditor
  Left = 0
  Top = 0
  BorderWidth = 5
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1073#1072#1079' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 165
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 215
    Height = 165
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    object dbgTemp: TDBGridEh
      Left = 0
      Top = 22
      Width = 215
      Height = 143
      Align = alClient
      AutoFitColWidths = True
      Ctl3D = False
      DataSource = dsTemp
      DynProps = <>
      Flat = True
      Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentCtl3D = False
      PopupMenu = pmTemp
      TabOrder = 1
      OnDblClick = dbgTempDblClick
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'NAME'
          Footers = <>
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object ToolBar1: TToolBar
      Left = 0
      Top = 0
      Width = 215
      Height = 22
      Caption = 'ToolBar1'
      Images = A4MainForm.ICONS_ACTIVE
      TabOrder = 0
      object ToolButton1: TToolButton
        Left = 0
        Top = 0
        Action = actAdd
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Action = ActDel
      end
      object ToolButton3: TToolButton
        Left = 46
        Top = 0
        Action = ActEdit
      end
    end
  end
  object pnl2: TPanel
    Left = 215
    Top = 0
    Width = 337
    Height = 165
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnl3: TPanel
      Left = 0
      Top = 0
      Width = 337
      Height = 124
      Align = alClient
      TabOrder = 0
      DesignSize = (
        337
        124)
      object lbl1: TLabel
        Left = 11
        Top = 16
        Width = 58
        Height = 13
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 54
        Top = 51
        Width = 15
        Height = 13
        Caption = 'IP:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 7
        Top = 87
        Width = 62
        Height = 13
        Caption = #1055#1091#1090#1100' '#1082' '#1041#1044':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnFln: TSpeedButton
        Left = 308
        Top = 84
        Width = 23
        Height = 22
        Hint = #1045#1089#1083#1080' '#1085#1091#1078#1085#1086', '#1074#1099#1073#1077#1088#1080#1090#1077' '#1083#1086#1082#1072#1083#1100#1085#1099#1081' '#1092#1072#1081#1083
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000000000000000000000000000000000000FF00FFAD6D30
          CEAE8FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFAD6E32AA6625AA6625D3AC87FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0B295AA6625
          AA6625AA6625D3AA82FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFD5B393AA6625AA6625AA6625D2A87FFF00FFFF
          00FFCFAE90C99F77CBA580D5C1AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          D5B596AA6625AA6625AA6625BF834AAA6625AA6625AA6625AA6625AA6625AA67
          27FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD6B79AAA6625AA6625AA6625AA
          6625C48A53D3AA82CFA072AA6625AA6625AA6625D8BDA4FF00FFFF00FFFF00FF
          FF00FFFF00FFC38D5AAA6625AA6625F6EBE1FDFDFDFDFDFDFFFFFFFDFDFDC495
          69AA6625AA6625FF00FFFF00FFFF00FFFF00FFFF00FFAA6625AA6625F5E9DEFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB77E47AA6625C19A74FF00FFFF00FF
          FF00FFD1B59AAA6625C2864CFDFDFDFFFFFFFDFDFDFDFDFDFFFFFFFDFDFDFDFD
          FDEBD6C2AA6625B0743BFF00FFFF00FFFF00FFCBA581AA6625D1A47AFDFDFDFF
          FFFFFDFDFDFDFDFDFFFFFFFDFDFDFDFDFDF9F2ECAA6625AA6625FF00FFFF00FF
          FF00FFCEAD8DAA6625CB9866FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFF2E5D9AA6625AC6B2DFF00FFFF00FFFF00FFFF00FFAA6625AA6625FDFDFDFF
          FFFFFDFDFDFDFDFDFFFFFFFDFDFDFDFDFDD5A97FAA6625B98859FF00FFFF00FF
          FF00FFFF00FFAE7135AA6625BD8957FFFFFFFDFDFDFDFDFDFFFFFFFDFDFDF0DE
          CCAA6625AA6625D5C1AEFF00FFFF00FFFF00FFFF00FFFF00FFAA6625AA6625B2
          743AE6CDB5F4E9DFF0E0D1D3A57AAA6625AA6625C18954FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFAA6625AA6625AA6625AA6625AA6625AA6625AA66
          25C28A56FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6
          A585B47D49AD6D30AF7237BB8D60FF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = btnFlnClick
      end
      object edName: TDBEditEh
        Left = 75
        Top = 14
        Width = 231
        Height = 19
        Anchors = [akLeft, akTop, akRight]
        Ctl3D = True
        DynProps = <>
        EditButtons = <>
        Flat = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        Visible = True
      end
      object edIP: TDBEditEh
        Left = 75
        Top = 49
        Width = 231
        Height = 19
        Anchors = [akLeft, akTop, akRight]
        Ctl3D = True
        DynProps = <>
        EditButtons = <>
        Flat = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 1
        Visible = True
      end
      object edDB: TDBEditEh
        Left = 75
        Top = 85
        Width = 231
        Height = 19
        Anchors = [akLeft, akTop, akRight]
        Ctl3D = True
        DynProps = <>
        EditButtons = <>
        Flat = True
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 2
        Visible = True
      end
    end
    object pnl4: TPanel
      Left = 0
      Top = 124
      Width = 337
      Height = 41
      Align = alBottom
      TabOrder = 1
      Visible = False
      DesignSize = (
        337
        41)
      object btnOK: TBitBtn
        Left = 16
        Top = 7
        Width = 84
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnOKClick
      end
      object btnCancel: TBitBtn
        Left = 237
        Top = 7
        Width = 84
        Height = 25
        Anchors = [akTop, akRight]
        Caption = #1047#1072#1082#1088#1099#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCancelClick
      end
    end
  end
  object temp: TMemTableEh
    Params = <>
    AfterScroll = tempAfterScroll
    Left = 152
    Top = 40
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object WAY: TMTStringDataFieldEh
          FieldName = 'WAY'
          StringDataType = fdtStringEh
          DisplayWidth = 250
          Size = 250
        end
        object IP: TMTStringDataFieldEh
          FieldName = 'IP'
          StringDataType = fdtStringEh
          DisplayWidth = 50
          Size = 50
        end
        object NAME: TMTStringDataFieldEh
          FieldName = 'NAME'
          StringDataType = fdtStringEh
          DisplayWidth = 100
          Size = 100
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object dsTemp: TDataSource
    DataSet = temp
    Left = 152
    Top = 96
  end
  object pmTemp: TPopupMenu
    Left = 104
    Top = 56
    object N1: TMenuItem
      Action = actAdd
    end
    object N2: TMenuItem
      Action = ActEdit
    end
    object N3: TMenuItem
      Action = ActDel
    end
  end
  object dlgOpen1: TOpenDialog
    DefaultExt = '*.fdb'
    Left = 112
    Top = 8
  end
  object ActionList1: TActionList
    Left = 40
    Top = 88
    object actAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 2
      ShortCut = 45
      OnExecute = actAddExecute
    end
    object ActEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 4
      ShortCut = 113
      OnExecute = ActEditExecute
    end
    object ActDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 3
      ShortCut = 16430
      OnExecute = ActDelExecute
    end
  end
end
