object ReqForAdresForm: TReqForAdresForm
  Left = 0
  Top = 0
  Caption = #1047#1072#1103#1074#1082#1080' '#1087#1086' '#1072#1076#1088#1077#1089#1091
  ClientHeight = 472
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  ShowHint = True
  object pnlTime: TPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 472
    Align = alClient
    BevelOuter = bvNone
    Caption = 'pnlTime'
    TabOrder = 0
    object dbgSame: TDBGridEh
      Left = 0
      Top = 30
      Width = 723
      Height = 405
      Align = alClient
      DataSource = srcSame
      DynProps = <>
      Flat = True
      FooterRowCount = 1
      FooterParams.Color = clWindow
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      STFilter.Local = True
      STFilter.Visible = True
      SumList.Active = True
      TabOrder = 0
      TitleParams.MultiTitle = True
      Columns = <
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STREET_SHORT'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089'|'#1087#1088
          Title.TitleButton = True
          Width = 19
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'STREET_NAME'
          Footer.ValueType = fvtCount
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089'|'#1091#1083#1080#1094#1072
          Title.TitleButton = True
          Width = 100
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'HOUSE_NO'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089'|'#1076#1086#1084' '#8470
          Title.TitleButton = True
          Width = 44
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'FLAT_NO'
          Footers = <>
          Title.Caption = #1040#1076#1088#1077#1089'|'#1050#1074'.'
          Title.TitleButton = True
          Width = 41
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'O_NAME'
          Footers = <>
          Title.Caption = #1058#1080#1087' '#1079#1072#1103#1074#1082#1080
          Title.TitleButton = True
          Width = 45
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RQ_PLAN_DATE'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072
          Title.TitleButton = True
          Width = 65
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = 'HH:MM'
          DynProps = <>
          EditButtons = <>
          FieldName = 'RQ_TIME_FROM'
          Footers = <>
          Title.Caption = #1042#1088#1077#1084#1103'|c'
          Title.TitleButton = True
          Width = 38
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DisplayFormat = 'HH:MM'
          DynProps = <>
          EditButtons = <>
          FieldName = 'RQ_TIME_TO'
          Footers = <>
          Title.Caption = #1042#1088#1077#1084#1103'|'#1087#1086
          Title.TitleButton = True
          Width = 38
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'ZVENO'
          Footers = <>
          Title.Caption = #1047#1074#1077#1085#1086
          Title.TitleButton = True
          Width = 72
        end
        item
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RQ_CONTENT'
          Footers = <>
          Title.Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
          Title.TitleButton = True
          Width = 119
        end
        item
          AutoFitColWidth = False
          CellButtons = <>
          DynProps = <>
          EditButtons = <>
          FieldName = 'RQ_ID'
          Footers = <>
          Title.Caption = #8470' '#1079#1072#1103#1074#1082#1080
          Title.TitleButton = True
          Width = 70
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object Panel1: TPanel
      Left = 0
      Top = 435
      Width = 723
      Height = 37
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        723
        37)
      object btn1: TButton
        Left = 162
        Top = 6
        Width = 548
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        Cancel = True
        Caption = #1047#1072#1082#1088#1099#1090#1100
        Default = True
        TabOrder = 0
        OnClick = btn1Click
      end
    end
    object rgShowAs: TRadioGroup
      Left = 0
      Top = 0
      Width = 723
      Height = 30
      Align = alTop
      Caption = #1057#1075#1088#1091#1087#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1103#1074#1082#1080' '#1087#1086
      TabOrder = 2
    end
    object rbZV: TRadioButton
      Left = 162
      Top = 9
      Width = 113
      Height = 17
      Caption = #1047#1074#1077#1085#1091
      Checked = True
      TabOrder = 3
      TabStop = True
      OnClick = rbZVClick
    end
    object rbADRS: TRadioButton
      Left = 298
      Top = 9
      Width = 113
      Height = 17
      Caption = #1040#1076#1088#1077#1089#1091
      TabOrder = 4
      OnClick = rbADRSClick
    end
  end
  object dsSame: TpFIBDataSet
    UpdateSQL.Strings = (
      
        'execute procedure request_add_executors (:rq_id, :worker_id,:SEL' +
        'ECTED, :notice, 1);')
    DeleteSQL.Strings = (
      '')
    InsertSQL.Strings = (
      
        'execute procedure request_add_executors (:rq_id, :worker_id,:SEL' +
        'ECTED, :notice, 0);')
    SelectSQL.Strings = (
      'select '
      '    s.street_name,'
      '    s.street_short,'
      '    h.house_no,'
      '    r.rq_id,'
      '    o.rt_name o_name,'
      '    r.RQ_PLAN_DATE,'
      '    r.rq_time_from,'
      '    r.rq_time_to,'
      '    r.rq_content,'
      '    r.flat_no,'
      '    w.name ZVENO'
      'from REQUEST R'
      'inner join HOUSE H on (R.HOUSE_ID = H.HOUSE_ID)'
      'inner join STREET S on (H.STREET_ID = S.STREET_ID)'
      'inner join REQUEST_TYPES O on (R.RQ_TYPE = O.RT_ID)'
      'left outer join WORKGROUPS W on (W.WG_ID = H.WG_ID)'
      'where @filter'
      '      and'
      '      R.RQ_PLAN_DATE = :RQ_PLAN_DATE and'
      '      R.REQ_RESULT < 2 and'
      '      R.RQ_ID <> :RQ_ID'
      'order by 1, 2  ')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    AutoCommit = True
    Left = 51
    Top = 109
    poUseBooleanField = False
    poImportDefaultValues = False
    poGetOrderInfo = False
    poEmptyStrToNull = False
    dcForceOpen = True
  end
  object srcSame: TDataSource
    DataSet = dsSame
    Left = 50
    Top = 164
  end
end
