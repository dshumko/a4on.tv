inherited LettersForm: TLettersForm
  Left = 494
  Top = 384
  Caption = #1055#1077#1095#1072#1090#1085#1099#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1099
  ClientHeight = 449
  ClientWidth = 787
  PixelsPerInch = 96
  TextHeight = 13
  inherited splPG: TSplitter
    Top = 137
    Width = 787
  end
  inherited dbGrid: TDBGridEh
    Top = 141
    Width = 787
    Height = 308
    Columns = <
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'LETTERTYPEID'
        Footers = <>
        Visible = False
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FOR_FORM'
        Footers = <>
        KeyList.Strings = (
          '0'
          '1')
        PickList.Strings = (
          #1040#1073#1086#1085#1077#1085#1090#1099
          #1056#1072#1073#1086#1090#1099)
        Title.Caption = #1044#1083#1103' '#1092#1086#1088#1084#1099
        Title.TitleButton = True
        Title.SortIndex = 1
        Title.SortMarker = smDownEh
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'LETTERTYPEDESCR'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.TitleButton = True
        Title.SortIndex = 2
        Title.SortMarker = smDownEh
        Width = 202
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'FILENAME'
        Footers = <>
        Title.Caption = #1048#1084#1103' '#1086#1090#1095#1077#1090#1072
        Title.TitleButton = True
        Width = 278
      end
      item
        CellButtons = <>
        DynProps = <>
        EditButtons = <>
        FieldName = 'RECORDINDB'
        Footers = <>
        Title.Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100'|'#1076#1072#1090#1091' '#1087#1077#1095#1072#1090#1080
        Title.TitleButton = True
        Width = 79
      end
      item
        CellButtons = <>
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'SAVE_PDF'
        Footers = <>
        Title.Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100'|'#1082#1072#1082' PDF'
        Width = 73
      end>
  end
  inherited tlbMain: TToolBar
    Width = 787
    inherited btnEdit: TToolButton
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
    inherited ToolButton9: TToolButton
      Visible = False
    end
    inherited tbOk: TToolButton
      Visible = False
      OnClick = tbOkClick
    end
    inherited tbCancel: TToolButton
      Visible = False
      OnClick = tbCancelClick
    end
  end
  inherited pnlEdit: TPanel
    Width = 787
    Height = 112
    object Label1: TLabel [0]
      Left = 8
      Top = 11
      Width = 57
      Height = 13
      Caption = #1044#1083#1103' '#1092#1086#1088#1084#1099
    end
    object Label2: TLabel [1]
      Left = 264
      Top = 11
      Width = 73
      Height = 13
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object Label4: TLabel [2]
      Left = 8
      Top = 38
      Width = 58
      Height = 13
      Caption = #1048#1084#1103' '#1086#1090#1095#1077#1090#1072
    end
    inherited btnSaveLink: TBitBtn
      Left = 72
      Top = 85
      Width = 616
      TabOrder = 5
    end
    inherited btnCancelLink: TBitBtn
      Left = 694
      Top = 85
      TabOrder = 6
    end
    object DBCheckBoxEh1: TDBCheckBoxEh
      Left = 72
      Top = 62
      Width = 163
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1076#1072#1090#1091' '#1087#1077#1095#1072#1090#1080
      DataField = 'RECORDINDB'
      DataSource = srcDataSource
      DynProps = <>
      TabOrder = 3
    end
    object deName: TDBEditEh
      Left = 351
      Top = 8
      Width = 429
      Height = 21
      Hint = 
        #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1086#1088#1084#1099'. '#1045#1089#1083#1080' '#1088#1072#1079#1076#1077#1083#1080#1090#1100' '#1089#1080#1084#1074#1086#1083#1086#1084' \ '#1090#1086' '#1087#1091#1085#1082#1090#1099' '#1073#1091#1076#1091#1090' '#1086#1073#1098#1077#1076#1077 +
        #1085#1099' '#1074' '#1075#1088#1091#1087#1087#1099
      Anchors = [akLeft, akTop, akRight]
      DataField = 'LETTERTYPEDESCR'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      EmptyDataInfo.Text = 
        #1053#1072#1079#1074#1072#1085#1080#1077' '#1092#1086#1088#1084#1099'. '#1045#1089#1083#1080' '#1088#1072#1079#1076#1077#1083#1080#1090#1100' '#1089#1080#1084#1074#1086#1083#1086#1084' \ '#1090#1086' '#1087#1091#1085#1082#1090#1099' '#1073#1091#1076#1091#1090' '#1086#1073#1098#1077#1076#1077 +
        #1085#1099' '#1074' '#1075#1088#1091#1087#1087#1099
      ShowHint = True
      TabOrder = 1
      Visible = True
    end
    object cbFOR_FORM: TDBComboBoxEh
      Left = 71
      Top = 8
      Width = 181
      Height = 21
      DataField = 'FOR_FORM'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      Items.Strings = (
        #1040#1073#1086#1085#1077#1085#1090#1099
        #1056#1072#1073#1086#1090#1099)
      KeyItems.Strings = (
        '0'
        '1')
      ShowHint = True
      TabOrder = 0
      Visible = True
    end
    object cbReport: TDBComboBoxEh
      Left = 72
      Top = 35
      Width = 708
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'FILENAME'
      DataSource = srcDataSource
      DynProps = <>
      EditButtons = <>
      ShowHint = True
      TabOrder = 2
      Visible = True
    end
    object chkSaveAsPDF: TDBCheckBoxEh
      Left = 264
      Top = 62
      Width = 163
      Height = 17
      Alignment = taLeftJustify
      Anchors = [akLeft, akTop, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1082#1072#1082' PDF'
      DataField = 'SAVE_PDF'
      DataSource = srcDataSource
      DynProps = <>
      TabOrder = 4
    end
  end
  inherited srcDataSource: TDataSource
    DataSet = dsLetters
    OnDataChange = srcDataSourceDataChange
    Left = 280
    Top = 240
  end
  inherited actions: TActionList
    Left = 110
    Top = 248
    inherited actNew: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      OnExecute = actNewExecute
    end
    inherited actDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      OnExecute = actDeleteExecute
    end
    inherited actEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      OnExecute = actEditExecute
    end
  end
  inherited pmPopUp: TPopupMenu
    Left = 51
    Top = 239
  end
  inherited CnErrors: TCnErrorProvider
    Left = 392
    Top = 240
  end
  object dsLetters: TpFIBDataSet
    UpdateSQL.Strings = (
      'UPDATE LETTERTYPE'
      'SET '
      '    LETTERTYPEDESCR = :LETTERTYPEDESCR,'
      '    FILENAME = :FILENAME,'
      '    RECORDINDB = :RECORDINDB,'
      '    FOR_FORM = :FOR_FORM,'
      '    SAVE_PDF = :SAVE_PDF'
      'WHERE'
      '    LETTERTYPEID = :OLD_LETTERTYPEID'
      '    ')
    DeleteSQL.Strings = (
      'DELETE FROM'
      '    LETTERTYPE'
      'WHERE'
      '        LETTERTYPEID = :OLD_LETTERTYPEID'
      '    ')
    InsertSQL.Strings = (
      'INSERT INTO LETTERTYPE('
      '    LETTERTYPEDESCR,'
      '    FILENAME,'
      '    RECORDINDB,'
      '    FOR_FORM,'
      '    SAVE_PDF'
      ')'
      'VALUES('
      '    :LETTERTYPEDESCR,'
      '    :FILENAME,'
      '    :RECORDINDB,'
      '    :FOR_FORM,'
      '    :SAVE_PDF'
      ')')
    RefreshSQL.Strings = (
      'select *'
      'from lettertype'
      ''
      ' WHERE '
      '        LETTERTYPE.LETTERTYPEID = :OLD_LETTERTYPEID'
      '    ')
    SelectSQL.Strings = (
      'select *'
      'from lettertype'
      'where LETTERTYPEID >=0 '
      'order by for_form, lettertypedescr')
    OnNewRecord = dsLettersNewRecord
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    AutoCommit = True
    Left = 204
    Top = 250
  end
  object dsReports: TpFIBDataSet
    SelectSQL.Strings = (
      'select'
      'r.report_name,'
      
        'coalesce((select FULL_NAME from get_fullname_report(r.id_parent,' +
        ' '#39'/'#39')),'#39#39') FULL_NAME,'
      'r.id_report'
      'from REPORTS r'
      'where not r.report_body is null'
      'order by 2,1')
    Transaction = dmMain.trRead
    Database = dmMain.dbTV
    UpdateTransaction = dmMain.trWrite
    Left = 496
    Top = 256
  end
end
