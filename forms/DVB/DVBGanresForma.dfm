object DVBGanresForm: TDVBGanresForm
  Left = 0
  Top = 0
  Caption = 'DVB '#1078#1072#1085#1088#1099
  ClientHeight = 442
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  inline OkCancelFrame1: TOkCancelFrame
    Left = 0
    Top = 407
    Width = 418
    Height = 35
    Align = alBottom
    TabOrder = 1
    TabStop = True
    inherited Label2: TLabel
      Margins.Bottom = 0
    end
    inherited Label1: TLabel
      Margins.Bottom = 0
    end
    inherited bbOk: TBitBtn
      Left = 203
      Top = 6
      Width = 128
    end
    inherited bbCancel: TBitBtn
      Left = 337
      Top = 6
      Width = 74
    end
  end
  object DBGridEh: TDBGridEh
    Left = 0
    Top = 0
    Width = 418
    Height = 407
    Align = alClient
    AllowedOperations = [alopUpdateEh]
    DataSource = srcGanres
    DynProps = <>
    Flat = True
    FooterRowCount = 1
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit]
    SearchPanel.Enabled = True
    STFilter.Local = True
    STFilter.Visible = True
    SumList.Active = True
    TabOrder = 0
    Columns = <
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'SELECTED'
        Footer.ValueType = fvtCount
        Footers = <>
        Title.Caption = #1042#1099#1073#1086#1088
        Title.TitleButton = True
        Width = 27
      end
      item
        AutoFitColWidth = False
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'CODE'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1086#1076
        Title.TitleButton = True
        Width = 35
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Width = 302
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object srcGanres: TDataSource
    DataSet = dsmGanres
    Left = 200
    Top = 80
  end
  object dsmGanres: TMemTableEh
    Active = True
    Params = <>
    Left = 272
    Top = 88
    object dsmGanresCODE: TStringField
      DisplayWidth = 20
      FieldName = 'CODE'
    end
    object dsmGanresSELECTED: TBooleanField
      DisplayWidth = 5
      FieldName = 'SELECTED'
    end
    object dsmGanresNAME: TStringField
      DisplayWidth = 255
      FieldName = 'NAME'
      Size = 255
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object CODE: TMTStringDataFieldEh
          FieldName = 'CODE'
          StringDataType = fdtStringEh
        end
        object SELECTED: TMTBooleanDataFieldEh
          FieldName = 'SELECTED'
        end
        object NAME: TMTStringDataFieldEh
          FieldName = 'NAME'
          StringDataType = fdtStringEh
          Size = 255
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object dsGenres: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      '    Genre_Id, Genre||'#39'. '#39'||Subgenre as NAME'
      '  from Epg_Genre'
      'order by 2')
    Transaction = trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 105
    Top = 161
  end
  object trRead: TpFIBTransaction
    DefaultDatabase = dmMain.dbTV
    Left = 181
    Top = 161
  end
end
