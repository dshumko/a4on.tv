unit MessagesForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus,
  Vcl.ActnList,
  Vcl.ExtCtrls, Vcl.Buttons,
  DBGridEh, DBCtrlsEh, frxClass, frxDBSet, FIBDataSet, pFIBDataSet, GridsEh, DBGridEhImpExp, FIBQuery, DBGridEhGrouping,
  MemTableDataEh, DataDriverEh, pFIBDataDriverEh, MemTableEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  EhLibVCL,
  DynVarsEh, CnErrorProvider, DBLookupEh;

type
  TMessagesForm = class(TForm)
    pnlAll: TPanel;
    dbgMessages: TDBGridEh;
    alGuide: TActionList;
    actNew: TAction;
    actPayDocSearch: TAction;
    actMessSetPeriod: TAction;
    actPrintDoc: TAction;
    actQuickFilter: TAction;
    gridPopUp: TPopupMenu;
    ppmCopy: TMenuItem;
    ppmSelectAll: TMenuItem;
    MenuItem1: TMenuItem;
    ppmSaveSelection: TMenuItem;
    dsMessages: TpFIBDataSet;
    srcMessages: TDataSource;
    frxDBMessages: TfrxDBDataset;
    tlbMain: TToolBar;
    ToolButton14: TToolButton;
    ToolButton16: TToolButton;
    ToolButton4: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton1: TToolButton;
    ToolButton27: TToolButton;
    pmPeriod: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    MainMenu1: TMainMenu;
    N5: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    N15: TMenuItem;
    chkGroup: TCheckBox;
    actGroup: TAction;
    N13: TMenuItem;
    mtMessages: TMemTableEh;
    drvMessages: TpFIBDataDriverEh;
    N7: TMenuItem;
    actDel: TAction;
    N11: TMenuItem;
    btnSendSMS: TToolButton;
    btn2: TToolButton;
    actSendSMS: TAction;
    btnDel: TToolButton;
    btnEdit: TToolButton;
    actEdit: TAction;
    N14: TMenuItem;
    miNotSend: TMenuItem;
    actFilterCustomer: TAction;
    btnFilterCustomer: TToolButton;
    ToolButton2: TToolButton;
    pnlEdit: TPanel;
    CnErrors: TCnErrorProvider;
    pnl1: TPanel;
    lbl3: TLabel;
    pnlOkCancel: TPanel;
    btnCancelLink: TBitBtn;
    btnSaveLink: TBitBtn;
    pnl2: TPanel;
    pnlHead: TPanel;
    lbl2: TLabel;
    dsMessType: TpFIBDataSet;
    srcMessType: TDataSource;
    lbl4: TLabel;
    edtReciver: TDBEditEh;
    mmoMessage: TDBMemoEh;
    edtHEAD: TDBEditEh;
    cbbTYPE: TDBLookupComboboxEh;
    lblSMScount: TLabel;
    mtTM: TMemTableEh;
    drvTM: TDataSetDriverEh;
    chkTree: TCheckBox;
    btn1: TToolButton;
    miMyOnly: TMenuItem;
    miN17: TMenuItem;
    actAnswer: TAction;
    miAnswer: TMenuItem;
    miInOnly: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppmSaveSelectionClick(Sender: TObject);
    procedure ppmSelectAllClick(Sender: TObject);
    procedure ppmCopyClick(Sender: TObject);
    procedure actMessSetPeriodExecute(Sender: TObject);
    procedure actQuickFilterExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure actPayDocEditExecute(Sender: TObject);
    procedure bbDownClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure actPrintDocExecute(Sender: TObject);
    procedure frxDBMessagesCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxDBMessagesFirst(Sender: TObject);
    procedure frxDBMessagesNext(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actGroupExecute(Sender: TObject);
    procedure dbgMessagesDataGroupGetRowText(Sender: TCustomDBGridEh; GroupDataTreeNode: TGroupDataTreeNodeEh;
      var GroupRowText: string);
    procedure actDelExecute(Sender: TObject);
    procedure actSendSMSExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure miNotSendClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actFilterCustomerExecute(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure dbgMessagesDblClick(Sender: TObject);
    procedure lcbMessTypeChange(Sender: TObject);
    procedure mmoMessageChange(Sender: TObject);
    procedure cbbTYPEChange(Sender: TObject);
    procedure dbgMessagesGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh; AFont: TFont;
      var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
    procedure dbgMessagesColumns7GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
    procedure dbgMessagesGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure chkTreeClick(Sender: TObject);
    procedure miMyOnlyClick(Sender: TObject);
    procedure actAnswerExecute(Sender: TObject);
    procedure miInOnlyClick(Sender: TObject);
  private
    fFirstOpen: Boolean; // Первое открытие Формы
    fParentMessage: Integer;
    fForCustomer: Integer;
    CanEdit: Boolean;
    CanCreate: Boolean;
    FPersonalData: Boolean;
    inEditMode: Boolean;
    fStartDate: TDateTime;
    fEndDate: TDateTime;
    fShowNotSended: Boolean;
    fShowMy: Boolean;
    fCanSave: Boolean;
    fShowInOnly: Boolean;
    FInTreeView: Boolean;
    fSelectedRow: Integer; // выделенная строка в таблице платежей
    FclIncome: TColor;
    procedure SetMessagesFilter;
    procedure StartEdit(const New: Boolean = False);
    procedure StopEdit(const Cancel: Boolean);
    procedure SetGridTreeMode(const inTree: Boolean);
    procedure InitSecurity;
  public
    { Public declarations }
  end;

var
  MessagesForm: TMessagesForm;

implementation

uses
  System.StrUtils, DM, MAIN, AtrCommon, PeriodForma, PaymentDocForma, AtrStrUtils, atrCmdUtils, ReportPreview, apiSMS,
  CF, pFIBQuery;

{$R *.dfm}

procedure TMessagesForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  dmMain.SetIniValue('MSG_SENDED_ONLY', ifThen(fShowNotSended, '1', '0'));
  dmMain.SetIniValue('MSG_MY_ONLY', ifThen(fShowMy, '1', '0'));

  if fCanSave then
    dbgMessages.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgMessages', False);
  if srcMessages.DataSet.Active then
    srcMessages.DataSet.Close;
  dsMessages.Close;
  MessagesForm := nil;
  Action := caFree;
end;

procedure TMessagesForm.ppmSaveSelectionClick(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  Ext: String;

begin

  A4MainForm.SaveDialog.FileName := rsPayments;
  if (ActiveControl is TDBGridEh) then
    if A4MainForm.SaveDialog.Execute then
    begin
      case A4MainForm.SaveDialog.FilterIndex of
        1:
          begin
            ExpClass := TDBGridEhExportAsUnicodeText;
            Ext := 'txt';
          end;
        2:
          begin
            ExpClass := TDBGridEhExportAsCSV;
            Ext := 'csv';
          end;
        3:
          begin
            ExpClass := TDBGridEhExportAsHTML;
            Ext := 'htm';
          end;
        4:
          begin
            ExpClass := TDBGridEhExportAsRTF;
            Ext := 'rtf';
          end;
        5:
          begin
            ExpClass := TDBGridEhExportAsOLEXLS;
            Ext := 'xls';
          end;
      else
        ExpClass := nil;
        Ext := '';
      end;
      if ExpClass <> nil then
      begin
        if AnsiUpperCase(Copy(A4MainForm.SaveDialog.FileName, Length(A4MainForm.SaveDialog.FileName) - 2, 3)) <>
          AnsiUpperCase(Ext) then
          A4MainForm.SaveDialog.FileName := A4MainForm.SaveDialog.FileName + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass, TDBGridEh(ActiveControl), A4MainForm.SaveDialog.FileName, False);
      end;
    end;

end;

procedure TMessagesForm.ppmSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TMessagesForm.ppmCopyClick(Sender: TObject);

var
  dbg: TDBGridEh;

begin

  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
        DBGridEh_DoCopyAction(dbg, False)
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;

end;

procedure TMessagesForm.actMessSetPeriodExecute(Sender: TObject);
var
  bDate, eDate: TDateTime;
begin
  bDate := fStartDate;
  eDate := fEndDate;
  if ChangePeriod(bDate, eDate) then
  begin
    fStartDate := bDate;
    fEndDate := eDate;
    SetMessagesFilter;
  end;
end;

procedure TMessagesForm.actQuickFilterExecute(Sender: TObject);
begin
  actQuickFilter.Checked := not actQuickFilter.Checked;
  dbgMessages.STFilter.Visible := actQuickFilter.Checked;
end;

procedure TMessagesForm.SetMessagesFilter;
begin
  dsMessages.Close;
  dsMessages.ParamByName('StartDate').AsDate := fStartDate;
  dsMessages.ParamByName('EndDate').AsDate := fEndDate;
  Caption := Format(rsMessagesPeriod, [DateToStr(fStartDate), DateToStr(fEndDate)]);

  if fShowInOnly then
    dsMessages.ParamByName('WHERE_ADDONS').AsString := 'and (m.DIRECT = 1) '
  else
  begin
    if fShowNotSended then
      dsMessages.ParamByName('ShowNotSended').AsInteger := 1
    else
      dsMessages.ParamByName('ShowNotSended').AsInteger := 0;

    if fShowMy then
      dsMessages.ParamByName('WHERE_ADDONS').AsString := 'and ((m.Added_By = CURRENT_USER) or ' +
        '((not m.Parent_Id is null) and ' +
        'exists(select p.Mes_Id from messages p where p.Mes_Id = m.Parent_Id and p.Added_By = CURRENT_USER)))'
    else
      dsMessages.ParamByName('WHERE_ADDONS').AsString := '';
  end;

  dsMessages.Open;
end;

procedure TMessagesForm.FormShow(Sender: TObject);
begin
  dbgMessages.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'dbgMessages',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh]);

  fEndDate := now;
  fStartDate := MonthFirstDay(dmMain.CurrentMonth);
  fShowNotSended := (dmMain.GetIniValue('MSG_SENDED_ONLY') = '1');
  miNotSend.Checked := fShowNotSended;
  fShowMy := (dmMain.GetIniValue('MSG_MY_ONLY') = '1');
  miMyOnly.Checked := fShowMy;
  SetMessagesFilter;

  InitSecurity;

  dsMessages.Open;
  inEditMode := False;
end;

procedure TMessagesForm.InitSecurity;
begin
  CanEdit := (dmMain.AllowedAction(rght_Messages_add) or dmMain.AllowedAction(rght_Customer_full));
  CanCreate := (dmMain.AllowedAction(rght_Messages_add) or dmMain.AllowedAction(rght_Customer_full));
  FPersonalData := (not dmMain.AllowedAction(rght_Customer_PersonalData));

  // права пользователей
  actNew.Visible := CanEdit;
  actDel.Visible := CanEdit;
  actEdit.Visible := CanEdit;
  actAnswer.Visible := CanEdit;
end;

procedure TMessagesForm.N1Click(Sender: TObject);
begin
  fStartDate := now;
  fEndDate := now;
  SetMessagesFilter;
end;

procedure TMessagesForm.N2Click(Sender: TObject);
begin
  fStartDate := now - 7;
  fEndDate := now;
  SetMessagesFilter;
end;

procedure TMessagesForm.dbgMessagesColumns7GetCellParams(Sender: TObject; EditMode: Boolean; Params: TColCellParamsEh);
begin
  if (not FPersonalData) and (not Params.Text.IsEmpty) then
    Params.Text := HideSurname(Params.Text);
end;

procedure TMessagesForm.dbgMessagesDataGroupGetRowText(Sender: TCustomDBGridEh; GroupDataTreeNode: TGroupDataTreeNodeEh;
  var GroupRowText: string);
var
  s: string;
  i: Integer;
begin
  s := GroupDataTreeNode.DisplayValue;
  i := Pos(s, GroupRowText);
  GroupRowText := Copy(GroupRowText, i, Length(GroupRowText));
end;

procedure TMessagesForm.actPayDocEditExecute(Sender: TObject);
begin
  // if dsMessages.FieldByName('mes_id').IsNull
  // then exit;
  //
end;

procedure TMessagesForm.bbDownClick(Sender: TObject);
begin
  pmPeriod.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
end;

procedure TMessagesForm.N3Click(Sender: TObject);
begin
  fStartDate := MonthFirstDay(now);
  fEndDate := MonthLastDay(now);
  SetMessagesFilter;
end;

procedure TMessagesForm.N4Click(Sender: TObject);
begin
  fStartDate := (now - 1);
  fEndDate := (now - 1);
  SetMessagesFilter;
end;

procedure TMessagesForm.actPrintDocExecute(Sender: TObject);
var
  bm: TBookMark;
begin
  dsMessages.DisableControls;
  bm := dsMessages.GetBookmark;
  ShowReport('Messages');
  dsMessages.GotoBookmark(bm);
  dsMessages.EnableControls;
end;

procedure TMessagesForm.frxDBMessagesCheckEOF(Sender: TObject; var Eof: Boolean);
begin
  if dbgMessages.SelectedRows.Count > 0 then
    Eof := (fSelectedRow > dbgMessages.SelectedRows.Count)
end;

procedure TMessagesForm.frxDBMessagesFirst(Sender: TObject);
begin
  if dbgMessages.SelectedRows.Count > 0 then
  begin
    fSelectedRow := 1;
    dbgMessages.DataSource.DataSet.Bookmark := dbgMessages.SelectedRows[0];
  end
end;

procedure TMessagesForm.frxDBMessagesNext(Sender: TObject);
begin
  if (dbgMessages.SelectedRows.Count > 0) then
  begin
    if fSelectedRow < dbgMessages.SelectedRows.Count then
      dbgMessages.DataSource.DataSet.Bookmark := dbgMessages.SelectedRows[fSelectedRow];
    inc(fSelectedRow);
  end
end;

procedure TMessagesForm.actAnswerExecute(Sender: TObject);
begin
  if (dsMessages.RecordCount = 0) //
    or dsMessages.FieldByName('RECIVER').IsNull //
  then
    exit;

  FParentMessage := -1;
  FForCustomer := -1;
  if not dsMessages.FieldByName('Mes_Id').IsNull then
  begin
    FParentMessage := dsMessages.FieldByName('Mes_Id').AsInteger;
    if not dsMessages.FieldByName('CUSTOMER_ID').IsNull then
      FForCustomer := dsMessages.FieldByName('CUSTOMER_ID').AsInteger;
  end;

  StartEdit(true);
  edtReciver.Text := dsMessages['RECIVER'];
  if not dsMessages.FieldByName('MES_TEXT').IsNull then
    mmoMessage.Lines.Text := '>' + dsMessages['MES_TEXT'];
end;

procedure TMessagesForm.actDelExecute(Sender: TObject);
var
  i: Integer;

begin
  if dsMessages.RecordCount = 0 then
    exit;

  if (MessageDlg(rsDeleteSelectedRecords, mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    exit;

  if (dbgMessages.SelectedRows.Count > 1) then
  begin
    try
      Screen.Cursor := crHourGlass;
      for i := 0 to (dbgMessages.SelectedRows.Count - 1) do
      begin
        dbgMessages.DataSource.DataSet.GotoBookmark(pointer(dbgMessages.SelectedRows.Items[i]));
        dbgMessages.DataSource.DataSet.Delete;
      end;
    finally
      Screen.Cursor := crDefault;
    end
  end
  else
  begin
    dbgMessages.DataSource.DataSet.Delete;
  end;

  dsMessages.CloseOpen(true);
end;

procedure TMessagesForm.actGroupExecute(Sender: TObject);
var
  Crsr: TCursor;
begin
  actGroup.Checked := not actGroup.Checked;
  Crsr := Screen.Cursor;
  Screen.Cursor := crSqlWait;
  if actGroup.Checked then
  begin
    srcMessages.DataSet := mtMessages;
    dbgMessages.DataGrouping.GroupPanelVisible := true;
    // dbgMessages.DataGrouping.GroupLevels.Clear;
    dbgMessages.DataGrouping.Active := true;
    srcMessages.DataSet.Active := true;
    fCanSave := False;
  end
  else
  begin
    dbgMessages.DataGrouping.Active := False;
    // dbgMessages.DataGrouping.GroupLevels.Clear;
    dbgMessages.DataGrouping.GroupPanelVisible := False;
    srcMessages.DataSet := dsMessages;
    mtMessages.Active := False;
    srcMessages.DataSet.Active := true;
  end;
  Screen.Cursor := Crsr;
end;

procedure TMessagesForm.actNewExecute(Sender: TObject);
begin
  FParentMessage := -1;
  FForCustomer := -1;
  StartEdit(true);
end;

procedure TMessagesForm.FormActivate(Sender: TObject);
var
  i: Integer;
  filter: string;
  inFilter: Boolean;
begin
  if FFirstOpen then
  begin
    FFirstOpen := False;
    exit;
  end;

  if not((dsMessages.Active) and (dsMessages.RecordCount > 0) and (not dsMessages.FieldByName('MES_ID').IsNull)) then
    dsMessages.CloseOpen(true)
  else
  begin
    inFilter := dsMessages.Filtered;
    filter := dsMessages.filter;
    i := dsMessages['MES_ID'];
    dsMessages.CloseOpen(true);
    if inFilter then
    begin
      dsMessages.filter := filter;
      dsMessages.Filtered := inFilter;
      if dbgMessages.SearchPanel.SearchingText <> '' then
        dbgMessages.SearchPanel.ApplySearchFilter;
    end;
    dsMessages.Locate('MES_ID', i, []);
  end;
end;

procedure TMessagesForm.actSendSMSExecute(Sender: TObject);
var
  g: TSMSapi;
  balance: Integer;
  ForSendCount: Integer;
  ErrorText: String;
  rSMS: TpFIBQuery;

  // trR  : TpFIBTransaction;
  // trW  : TpFIBTransaction;
begin
  rSMS := TpFIBQuery.Create(nil);
  try
    rSMS.DataBase := dmMain.dbTV;
    rSMS.Transaction := dmMain.trReadQ;
    rSMS.SQL.Add('select count(m.reciver) as CNT from messages m where m.mes_result = 0 and m.Mes_Type = ''SMS'' ');
    rSMS.Transaction.StartTransaction;
    rSMS.ExecQuery;
    ForSendCount := rSMS.fn('CNT').AsInteger;
    rSMS.Transaction.Commit;
  finally
    rSMS.Free;
  end;

  g := TSMSapi.Create(dmMain.GetSettingsValue('A4LOGIN'), dmMain.GetSettingsValue('A4APIKEY'),
    dmMain.GetSettingsValue('FORMATN'));
  try
    ErrorText := '';
    balance := g.balance;

    if (balance - ForSendCount) < 0 then
    begin
      MessageDlg(Format(rsSMScountLess, [ForSendCount, balance]), mtWarning, [mbOK], 0);
    end
    else
    begin
      if (MessageBox(0, PWideChar(Format(rsSMSSend, [ForSendCount, balance])), '', MB_ICONQUESTION or MB_OKCANCEL or
        MB_APPLMODAL or MB_DEFBUTTON2) = idOk) then
      begin
        ErrorText := g.ErrorText;
        if balance > 0 then
        begin
          g.SendAll(ErrorText);
          balance := g.balance;
          ErrorText := g.ErrorText;
          // TODO: Сделать проверку статуса СМС
          // g.CheckAll;
          ErrorText := g.ErrorText;
          if balance <> -1 then
            ShowMessage(Format(rsSMSBalance, [balance]))
          else
            ShowMessage(ErrorText);
        end;
      end
    end;
  finally
    g.Free;
  end;

  dsMessages.Close;
  dsMessages.Open;
end;

procedure TMessagesForm.actEditExecute(Sender: TObject);
begin
  { TODO:Редактирование сообщения }
  StartEdit(False);
end;

procedure TMessagesForm.miNotSendClick(Sender: TObject);
begin
  fShowNotSended := not fShowNotSended;
  miNotSend.Checked := fShowNotSended;
  SetMessagesFilter;
end;

procedure TMessagesForm.FormCreate(Sender: TObject);
begin
  fFirstOpen := true;
  fShowNotSended := true;
  fCanSave := true;

  try
    FclIncome := StringToColor(dmMain.GetSettingsValue('ROW_HL_WARNING'));
  except
    FclIncome := $0066FFFF;
  end;
end;

procedure TMessagesForm.actFilterCustomerExecute(Sender: TObject);
var
  i: Integer;
  b: TBookMark;
  customers: TStringList;
  s: string;
begin

  customers := TStringList.Create;
  customers.Sorted := true;
  customers.Duplicates := dupIgnore;

  if (dbgMessages.SelectedRows.Count = 0) then
  begin
    if not dbgMessages.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
      customers.Add(IntToStr(dbgMessages.DataSource.DataSet['CUSTOMER_ID']));
  end
  else
  begin
    b := dbgMessages.DataSource.DataSet.GetBookmark;
    dbgMessages.DataSource.DataSet.DisableControls;
    dbgMessages.DataSource.DataSet.First;
    for i := 0 to dbgMessages.SelectedRows.Count - 1 do
    begin
      dbgMessages.DataSource.DataSet.Bookmark := dbgMessages.SelectedRows[i];
      if not dbgMessages.DataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
        customers.Add(IntToStr(dbgMessages.DataSource.DataSet['CUSTOMER_ID']));
    end;
    dbgMessages.DataSource.DataSet.GotoBookmark(b);
    dbgMessages.DataSource.DataSet.EnableControls;
  end;

  if (customers.Count > 0) then
    s := customers.CommaText
  else
    s := '';

  FreeAndNil(customers);

  if (s <> '') then
    ShowCustomers(7, s);
end;

procedure TMessagesForm.btnSaveLinkClick(Sender: TObject);
begin
  StopEdit(False);
end;

procedure TMessagesForm.cbbTYPEChange(Sender: TObject);
var
  show: Boolean;
begin
  show := False;
  if not dsMessType.FieldByName('O_NUMERICFIELD').IsNull then
    show := (dsMessType['O_NUMERICFIELD'] = 1);
  pnlHead.Visible := show;
end;

procedure TMessagesForm.chkTreeClick(Sender: TObject);
begin
  SetGridTreeMode(chkTree.Checked);
end;

procedure TMessagesForm.btnCancelLinkClick(Sender: TObject);
begin
  StopEdit(true);
end;

procedure TMessagesForm.StartEdit(const New: Boolean = False);
begin
  if not CanEdit then
    exit;
  if (not New) and (dsMessages.RecordCount = 0) then
    exit;
  if (not New) and (dsMessages['MES_RESULT'] <> 0) then
    exit;

  cbbTYPE.Enabled := New;
  dsMessType.Open;
  edtReciver.Text := '';
  edtHEAD.Text := '';
  mmoMessage.Lines.Text := '';
  if New then
  begin
    if dsMessType.RecordCount = 1 then
      cbbTYPE.KeyValue := dsMessType['O_NAME']
    else
      cbbTYPE.KeyValue := 'SMS';
    edtReciver.Tag := -1;
  end
  else
  begin
    cbbTYPE.KeyValue := dsMessages['MES_TYPE'];
    if (not dsMessages.FieldByName('RECIVER').IsNull) then
      edtReciver.Text := dsMessages['RECIVER'];
    edtReciver.Tag := 0;
    if (not dsMessages.FieldByName('MES_HEAD').IsNull) then
      edtHEAD.Text := dsMessages['MES_HEAD'];
    if (not dsMessages.FieldByName('MES_TEXT').IsNull) then
      mmoMessage.Lines.Text := dsMessages['MES_TEXT'];
  end;
  pnlEdit.Visible := true;
  dbgMessages.Enabled := False;
  tlbMain.Enabled := False;

  pnlEdit.SetFocus;
  PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);

  inEditMode := true;
end;

procedure TMessagesForm.StopEdit(const Cancel: Boolean);
begin
  pnlEdit.Visible := False;
  dbgMessages.Enabled := true;
  tlbMain.Enabled := true;

  // New
  if (edtReciver.Tag = 0) then
  begin
    dsMessages.Edit;
    dsMessages['RECIVER'] := edtReciver.Text;
    dsMessages['MES_HEAD'] := edtHEAD.Text;
    dsMessages['MES_TEXT'] := mmoMessage.Lines.Text;
    dsMessages.Post;
  end
  else
  begin
    dsMessages.Insert;
    dsMessages['MES_TYPE'] := cbbTYPE.KeyValue;
    dsMessages['RECIVER'] := edtReciver.Text;
    dsMessages['MES_HEAD'] := edtHEAD.Text;
    dsMessages['MES_TEXT'] := mmoMessage.Lines.Text;
    dsMessages['MES_RESULT'] := 0;
    if FParentMessage > 0 then
    begin
      dsMessages['PARENT_ID'] := FParentMessage;
    end
    else
    begin
      dsMessages.FieldByName('PARENT_ID').Clear;
    end;
    if FForCustomer > 0 then
    begin
      dsMessages['CUSTOMER_ID'] := FForCustomer;
    end
    else
    begin
      dsMessages.FieldByName('CUSTOMER_ID').Clear;
    end;

    dsMessages.Post;
  end;

  dbgMessages.SetFocus;
  dsMessType.Close;

  FParentMessage := -1;
  FForCustomer := -1;
  inEditMode := False;
end;

procedure TMessagesForm.dbgMessagesDblClick(Sender: TObject);
var
  ScrPt, GrdPt: TPoint;
  Cell: TGridCoord;
  s: String;
  vContinue: Boolean;
  i: Integer;
begin
  inherited;
  vContinue := true;
  ScrPt := Mouse.CursorPos;
  GrdPt := dbgMessages.ScreenToClient(ScrPt);
  Cell := dbgMessages.MouseCoord(GrdPt.X, GrdPt.Y);
  s := UpperCase(dbgMessages.Fields[Cell.X - 1].FieldName);
  if (s = 'MES_TEXT') then
  begin
    if not dbgMessages.DataSource.DataSet.FieldByName('MES_TEXT').IsNull then
    begin
      s := dbgMessages.DataSource.DataSet.FieldByName('MES_TEXT').AsString;
      if s.ToUpper.Contains('HTTP') then
      begin
        i := Pos('HTTP', s.ToUpper);
        s := Copy(s, i, 1000);
        atrCmdUtils.ShellExecute(Application.MainForm.Handle, '', s.trim);
        vContinue := False;
      end
    end;
  end;

  if vContinue then
  begin
    if dsMessages.RecordCount > 0 then
    begin
      if not(actEdit.Enabled and actEdit.Visible) then
        exit;
      actEdit.Execute;
    end
    else
    begin
      if not(actNew.Enabled and actNew.Visible) then
        exit;
      actNew.Execute;
    end;
  end;
end;

procedure TMessagesForm.dbgMessagesGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if not(Sender as TDBGridEh).DataSource.DataSet.Active then
    exit;

  if not(Sender as TDBGridEh).DataSource.DataSet.FieldByName('DIRECT').IsNull then
  begin
    if ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('DIRECT').AsInteger = 1) then
      Background := FclIncome;
  end;
end;

procedure TMessagesForm.dbgMessagesGetFooterParams(Sender: TObject; DataCol, Row: Integer; Column: TColumnEh;
  AFont: TFont; var Background: TColor; var Alignment: TAlignment; State: TGridDrawState; var Text: string);
var
  i: Integer;
begin
  if (DataCol = 1) and (Row = 0) then
  begin
    i := (Sender as TDBGridEh).SelectedRows.Count;
    if i > 1 then
      Text := IntToStr(i);
  end;
end;

procedure TMessagesForm.lcbMessTypeChange(Sender: TObject);
var
  show: Boolean;
begin
  show := False;
  if not dsMessType.FieldByName('O_NUMERICFIELD').IsNull then
    show := (dsMessType['O_NUMERICFIELD'] = 1);
  pnlHead.Visible := show;
end;

procedure TMessagesForm.miInOnlyClick(Sender: TObject);
begin
  fShowInOnly := not fShowInOnly;
  miInOnly.Checked := fShowInOnly;
  miMyOnly.Enabled := not fShowInOnly;
  miNotSend.Enabled := not fShowInOnly;
  SetMessagesFilter;
end;

procedure TMessagesForm.miMyOnlyClick(Sender: TObject);
begin
  fShowMy := not fShowMy;
  miMyOnly.Checked := fShowMy;
  SetMessagesFilter;
end;

procedure TMessagesForm.mmoMessageChange(Sender: TObject);
var
  i, s: Integer;
begin
  i := Length(mmoMessage.Lines.Text);
  s := 6;
  if (i <= 70) then
    s := 1
  else if ((i > 70) and (i < 134)) then
    s := 2
  else if ((i >= 134) and (i < 201)) then
    s := 3
  else if ((i >= 201) and (i < 268)) then
    s := 4
  else if ((i >= 268) and (i < 335)) then
    s := 5;

  lblSMScount.Caption := Format(rsSMScount, [i, s]);
end;

procedure TMessagesForm.SetGridTreeMode(const inTree: Boolean);
  function findInex(const FLD_NAME: string; Grid: TDBGridEh): Integer;
  var
    i: Integer;
  begin
    Result := 0;
    for i := 0 to Grid.Columns.Count - 1 do
    begin
      if UpperCase(Grid.Columns[i].FieldName) = FLD_NAME then
        Result := Grid.Columns[i].Index;
    end;
  end;

var
  id: Integer;
begin
  inherited;
  if (srcMessages.DataSet.RecordCount >= 0) and (not srcMessages.DataSet.FieldByName('MES_ID').IsNull) then
    id := srcMessages.DataSet['MES_ID']
  else
    id := -666;

  FInTreeView := inTree;
  if inTree then
  begin
    srcMessages.DataSet := mtTM;
    mtTM.Open;
    mtTM.TreeList.Active := true;
    mtTM.TreeList.DefaultNodeExpanded := true;
    fCanSave := False;
  end
  else
  begin
    srcMessages.DataSet := dsMessages;
    mtTM.Close;
    dsMessages.Open;
  end;
  chkGroup.Enabled := not inTree;
  {
    miTreeBreak.Visible := inTree;
    miTreeCollapse.Visible := inTree;
    miTreeExpand.Visible := inTree;
    miTreeExpandCurrent.Visible := inTree;
    if inTree then
    mtEQ.TreeList.FullCollapse;
  }

  if id <> -666 then
  begin
    if not inTree then
      srcMessages.DataSet.Locate('MES_ID', id, [])
    else
    begin
      mtTM.TreeList.Locate('MES_ID', id, []);
      // mtEQ.TreeList.E
    end;
  end;

  dbgMessages.SetFocus;
end;

end.
