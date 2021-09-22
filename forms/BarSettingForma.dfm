object BarSettingForm: TBarSettingForm
  ShowHint = True
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1096#1090#1088#1080#1093'-'#1082#1086#1076#1072
  ClientHeight = 303
  ClientWidth = 460
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBody: TPanel
    Left = 0
    Top = 0
    Width = 460
    Height = 268
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlBody'
    TabOrder = 0
    object grdFormat: TDBGridEh
      Left = 0
      Top = 26
      Width = 460
      Height = 208
      Align = alClient
      AutoFitColWidths = False
      DataSource = dsFormat
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      TabOrder = 1
      TitleParams.MultiTitle = True
      OnExit = grdFormatExit
      Columns = <
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'DATA'
          Footers = <>
          PickList.Strings = (
            '['#1050#1054#1044'_'#1040#1041#1054#1053#1045#1053#1058#1040']'
            '['#1051#1048#1062#1045#1042#1054#1049']'
            '['#1057#1059#1052#1052#1040']'
            '['#1057#1059#1052#1052#1040'_'#1042'_'#1050#1054#1055#1045#1049#1050#1040#1061']'
            '['#1060#1048#1054']'
            '['#1060#1040#1052#1048#1051#1048#1071']'
            '['#1059#1051#1048#1062#1040']'
            '['#1044#1054#1052']'
            '['#1050#1042#1040#1056#1058#1048#1056#1040']'
            '['#1052#1045#1057#1071#1062']'
            '['#1043#1054#1044']'
            '['#1055#1056#1045#1044'_'#1052#1045#1057#1071#1062']'
            '['#1055#1056#1045#1044'_'#1043#1054#1044']')
          Title.Caption = #1044#1072#1085#1085#1099#1077
          Width = 188
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'SIZE'
          Footers = <>
          Title.Caption = #1056#1072#1079#1084#1077#1088
          Width = 60
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FILL'
          Footers = <>
          Title.Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1100' '#1089#1083#1077#1074#1072' '#1089#1080#1084#1074#1086#1083#1086#1084
          Width = 87
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object ToolBar2: TToolBar
      Left = 0
      Top = 0
      Width = 460
      Height = 26
      Caption = 'ToolBar1'
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Images = A4MainForm.ICONS_ACTIVE
      TabOrder = 0
      object tbSrvAdd: TToolButton
        Left = 0
        Top = 0
        Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088
        ImageIndex = 2
        OnClick = tbSrvAddClick
      end
      object tbSrvEdit: TToolButton
        Left = 23
        Top = 0
        Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088
        ImageIndex = 4
        OnClick = tbSrvEditClick
      end
      object tbSrvDelete: TToolButton
        Left = 46
        Top = 0
        Hint = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088
        ImageIndex = 3
        OnClick = tbSrvDeleteClick
      end
      object ToolButton1: TToolButton
        Left = 69
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 4
        Style = tbsSeparator
        Visible = False
      end
      object tbSrvOk: TToolButton
        Left = 77
        Top = 0
        Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        Enabled = False
        ImageIndex = 25
        OnClick = tbSrvOkClick
      end
      object tbSrvCancel: TToolButton
        Left = 100
        Top = 0
        Hint = #1054#1090#1084#1077#1085#1072
        Caption = #1054#1090#1084#1077#1085#1072
        Enabled = False
        ImageIndex = 26
        OnClick = tbSrvCancelClick
      end
    end
    object pnlTest: TPanel
      Left = 0
      Top = 234
      Width = 460
      Height = 34
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object btn1: TButton
        Left = 387
        Top = 6
        Width = 68
        Height = 22
        Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
        TabOrder = 1
        OnClick = btn1Click
      end
      object edTest: TEdit
        Left = 2
        Top = 6
        Width = 379
        Height = 21
        Hint = 
          #1051#1080#1094#1077#1074#1086#1081': 1 '#1044#1086#1083#1075': 100.5 ID 1 '#1040#1076#1088#1077#1089': '#1051#1045#1053#1048#1053#1040' 1 1  '#1060#1048#1054': '#1064#1059#1052#1050#1054' '#1044#1052#1048#1058#1056#1048 +
          #1049' '#1043#1045#1054#1043#1056#1048#1045#1042#1048#1063
        TabOrder = 0
      end
    end
  end
  inline okcnclfrm1: TOkCancelFrame
    Left = 0
    Top = 268
    Width = 460
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
      Width = 161
      OnClick = okcnclfrm1bbOkClick
    end
    inherited bbCancel: TBitBtn
      Left = 387
      Width = 68
    end
  end
  object mdFormat: TMemTableEh
    Active = True
    FieldDefs = <
      item
        Name = 'DATA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SIZE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FILL'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnNewRecord = mdFormatNewRecord
    Left = 303
    Top = 147
    object strfldFormatDATA: TStringField
      FieldName = 'DATA'
      Required = True
    end
    object intgrfldFormatSIZE: TIntegerField
      FieldName = 'SIZE'
    end
    object strfldFormatFILL: TStringField
      FieldName = 'FILL'
      Size = 1
    end
    object MemTableData: TMemTableDataEh
      object DataStruct: TMTDataStructEh
        object DATA: TMTStringDataFieldEh
          FieldName = 'DATA'
          StringDataType = fdtStringEh
          Required = True
          Visible = False
        end
        object SIZE: TMTNumericDataFieldEh
          FieldName = 'SIZE'
          NumericDataType = fdtIntegerEh
          AutoIncrement = False
          Alignment = taLeftJustify
          Required = True
          Visible = False
          currency = False
          Precision = 0
        end
        object FILL: TMTStringDataFieldEh
          FieldName = 'FILL'
          StringDataType = fdtStringEh
          Visible = False
          Size = 1
        end
      end
      object RecordsList: TRecordsListEh
      end
    end
  end
  object dsFormat: TDataSource
    DataSet = mdFormat
    OnStateChange = dsFormatStateChange
    Left = 304
    Top = 99
  end
end
