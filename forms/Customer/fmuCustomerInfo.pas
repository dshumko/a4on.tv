unit fmuCustomerInfo;

{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.ActnList, Vcl.StdActns,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, DBCtrlsEh, FIBDataSet, pFIBDataSet,
  DBGridEhToolCtrls, DBAxisGridsEh,
  PrjConst,
  EhLibVCL, EhLibFIB, DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase,
  PropFilerEh, PropStorageEh,
{$IFDEF USE_PIXIE}
  Pixie.HtmlView.Vcl, Pixie.Document,
{$ELSE}
  HtmlView, HTMLSubs, HTMLUn2, FramView, FramBrwz,
{$IFEND}
  amSplitter, System.ImageList, Vcl.ImgList;

type
  TapgCustomerInfo = class(TA4onPage)
    dsContacts: TpFIBDataSet;
    srcContacts: TDataSource;
    pmRecalc: TPopupMenu;
    N2: TMenuItem;
    pnlAddInfo: TPanel;
    spltMemo: TSplitter;
    pnlDP: TPanel;
    sbRecalc: TSpeedButton;
    gbSaldo: TGroupBox;
    dbtxtDEBT: TDBText;
    pnlPrepay: TPanel;
    dbtxtPrepay: TDBText;
    pnlContacts: TPanel;
    dbgrdhContacts: TDBGridEh;
    gbMemo: TGroupBox;
    memCustNotice: TDBMemoEh;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    actlst1: TActionList;
    actMakeCall: TAction;
    pnlBtns: TPanel;
    lbl5: TLabel;
    btnCall: TSpeedButton;
    lbl1: TLabel;
    btnCAdd: TSpeedButton;
    btnCdel: TSpeedButton;
    lbl2: TLabel;
    btnSaveNotice: TButton;
    btnCEdit: TSpeedButton;
    actCAdd: TAction;
    actCEdit: TAction;
    actCDel: TAction;
    pmHV: TPopupMenu;
    miCopy: TMenuItem;
    dsCustomer: TpFIBDataSet;
    PropStorageEh: TPropStorageEh;
    pnlHTML: TPanel;
    srcCustomer: TDataSource;
    pnlACC: TPanel;
    lblACCNT: TLabel;
    dbeACCOUNT_NO: TDBEditEh;
    btnAlign: TSpeedButton;
    pmMemo: TPopupMenu;
    miN1: TMenuItem;
    actRecalc: TAction;
    pmContacts: TPopupMenu;
    actMakeDefContact: TAction;
    miMakeDefContact: TMenuItem;
    miN2: TMenuItem;
    miAdd: TMenuItem;
    miCEdit: TMenuItem;
    actNotSendContatct: TAction;
    miNotSendContatct: TMenuItem;
    miN3: TMenuItem;
    miN4: TMenuItem;
    actSendMessage: TAction;
    miSendMessage: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    PasteSpecial1: TMenuItem;
    miN5: TMenuItem;
    EditCut1: TEditCut;
    edtcpy: TEditCopy;
    edtpst: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    miN6: TMenuItem;
    dnSplitterHTML: TSplitter;
    procedure memCustNoticeExit(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure dsContactsNewRecord(DataSet: TDataSet);
    procedure dsContactsBeforePost(DataSet: TDataSet);
    procedure dbgrdhContactsExit(Sender: TObject);
    procedure srcContactsUpdateData(Sender: TObject);
    procedure dbgrdhContactsDblClick(Sender: TObject);
    procedure actMakeCallExecute(Sender: TObject);
    procedure btnSaveNoticeClick(Sender: TObject);
    procedure memCustNoticeKeyPress(Sender: TObject; var Key: Char);
    procedure actCAddExecute(Sender: TObject);
    procedure actCEditExecute(Sender: TObject);
    procedure actCDelExecute(Sender: TObject);
    procedure dbgrdhContactsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure miCopyClick(Sender: TObject);
    procedure srcCustomerDataChange(Sender: TObject; Field: TField);
    procedure btnAlignClick(Sender: TObject);
    procedure miN1Click(Sender: TObject);
    procedure PropStorageEhWriteCustomProps(Sender: TObject; Writer: TPropWriterEh);
    procedure PropStorageEhReadProp(Sender: TObject; Reader: TPropReaderEh; const PropName: string;
      var Processed: Boolean);
    procedure actRecalcExecute(Sender: TObject);
    procedure sbRecalcClick(Sender: TObject);
    procedure sbRecalcMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbeACCOUNT_NODblClick(Sender: TObject);
    procedure actMakeDefContactExecute(Sender: TObject);
    procedure actNotSendContatctExecute(Sender: TObject);
    procedure actSendMessageExecute(Sender: TObject);
    procedure dbgrdhContactsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    { Private declarations }
    fVisibleColumns: Integer;
    FCheckPassport: Boolean;
    FHtmlParams: TStringList;
    FVisibleSum: Boolean;
    FAsBalance: Boolean;
    FHidePersonalData: Boolean;
    FHidePersonalName: Boolean;
    FDec: Integer;
    FHtml: string;
    FWkeHtml: Boolean;
    FMemoNeedRealign: Boolean;
    FRunUnderWine: Boolean;
    FSkipRecalc: Boolean;
    FHL_ROW: Boolean;
    FHL_COLOR: TColor;
{$IFDEF USE_PIXIE}
    HtmlViewer: TPixieHtmlView;
    procedure PixieHtmlViewerSectionClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
{$ELSE}
    HtmlViewer: THtmlViewer;
    procedure CreateBerndGabrielHtmlViewer();
    procedure HtmlViewerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure HtmlViewerSectionClick(Sender: TObject; Obj: TSectionBase; Button: TMouseButton; Shift: TShiftState;
      X, Y, IX, IY: Integer);
{$IFEND}
    procedure RecalcCustomer(const CUSTOMER_ID: Int64);
    procedure SaveContact;
    procedure SaveNotice;
    procedure GetHtmlParams;
    procedure MakeHtmlWithParams;
    procedure infoPanelConfig;
    procedure CreateHtmlView;
    procedure DestroyHtmlView;
    procedure SetSaveBtnVisible;
    procedure UpdateInfoPanel;
    function GetParamValue(const param: string): string;
    procedure MemoAlign;
    procedure CopyHtmlAsText;
    function GetOrderClause(grid: TCustomDBGridEh): string;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    procedure UpdateObject; override;
    class function GetPageName: string; override;
  end;

implementation

uses
  System.RegularExpressions, System.TypInfo, Vcl.Clipbrd,
  A4onTypeUnit, AtrCommon, AtrStrUtils, DM, pFIBQuery, MAIN,
  ContactForma, SendMessagesForma;

{$R *.dfm}

function PropertyExists(aObject: TObject; const aPropertyName: string): Boolean;
begin
  Result := (GetPropInfo(aObject.ClassInfo, aPropertyName) <> nil);
end;

class function TapgCustomerInfo.GetPageName: string;
begin
  Result := rsInformation;
end;

procedure TapgCustomerInfo.InitForm;
var
  DispNum: string;
  i: Integer;
begin
  FMemoNeedRealign := True;
  infoPanelConfig;
  GetHtmlParams;

  FHL_ROW := (dmMain.GetSettingsValue('ROW_HL_COLOR') <> '') and (dmMain.GetSettingsValue('ROW_HL_ID') <> '') and
    (dmMain.GetSettingsValue('ROW_HL_TYPE') <> '');
  if FHL_ROW then
  begin
    try
      FHL_COLOR := StringToColor(dmMain.GetSettingsValue('ROW_HL_COLOR'));
    except
      FHL_COLOR := clPurple;
    end;
  end;

  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    memCustNotice.Font.Size := i;
    memCustNotice.Font.Name := dmMain.GetIniValue('FONT_NAME');
{$IFDEF USE_PIXIE}
    // HtmlViewer.Document.DefColor
{$ELSE}
    HtmlViewer.DefFontSize := i;
    HtmlViewer.DefFontName := dmMain.GetIniValue('FONT_NAME');
{$IFEND}
    lblACCNT.Font.Size := i;
    lblACCNT.Font.Name := dmMain.GetIniValue('FONT_NAME');
    dbeACCOUNT_NO.Font.Name := dmMain.GetIniValue('FONT_NAME');
  end;

  dsCustomer.DataSource := FDataSource;
  dsContacts.DataSource := FDataSource;
  dbeACCOUNT_NO.DataSource := FDataSource;
  if Assigned(FGrid) then
    sbRecalc.PopupMenu := pmRecalc;

  FVisibleSum := (dmMain.AllowedAction(rght_Customer_Debt)) or (dmMain.AllowedAction(rght_Customer_full));
  FHidePersonalData := (dmMain.AllowedAction(rght_Customer_PersonalData));
  FHidePersonalName := (dmMain.AllowedAction(rght_Customer_PersonalName));
  // просмотр сумм
  FAsBalance := (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1'); // пеня
  FDec := dmMain.GetSettingsValue('FEE_ROUND');
  if FDec > 0 then
    DispNum := ',0.00'
  else
    DispNum := ',0.##';

  gbSaldo.Visible := FVisibleSum;
  if FVisibleSum then
  begin
    dbtxtDEBT.DataSource := FDataSource;
    dbtxtPrepay.DataSource := FDataSource;

    if FAsBalance then
    begin
      gbSaldo.Caption := rsBALANCE;
      dbtxtDEBT.DataField := 'BALANCE';
    end
    else
    begin
      gbSaldo.Caption := rsSALDO;
      dbtxtDEBT.DataField := 'DEBT_SUM';
    end;
  end;

  if not(TryStrToInt(dmMain.GetIniValue('COLUMNS'), fVisibleColumns)) then
  begin
    fVisibleColumns := 0;
  end;

  actRecalc.Visible := (dmMain.AllowedAction(rght_Customer_AddSrv)) or (dmMain.AllowedAction(rght_Customer_full));
  sbRecalc.Visible := actRecalc.Visible;
  dbgrdhContacts.ReadOnly := not(dmMain.AllowedAction(rght_Customer_edit) or dmMain.AllowedAction(rght_Customer_full));
  // если что-то может делать с абонентом, то можно оставлять примечание
  memCustNotice.ReadOnly := not(dmMain.AllowedAction(rght_Customer_edit) //
    or dmMain.AllowedAction(rght_Customer_full) //
    or dmMain.AllowedAction(rght_Customer_add) //
    or dmMain.AllowedAction(rght_Customer_AddSrv) //
    or dmMain.AllowedAction(rght_Customer_Files_Add) //
    or dmMain.AllowedAction(rght_Customer_LanFull) //
    or dmMain.AllowedAction(rght_Customer_DigitAdd) //
    or dmMain.AllowedAction(rght_Customer_DigitEdit) //
    or dmMain.AllowedAction(rght_Customer_Attribute) //
    );

  if actRecalc.Visible then
    sbRecalc.PopupMenu := pmRecalc;

  actSendMessage.Visible := (dmMain.AllowedAction(rght_Messages_add)) or dmMain.AllowedAction(rght_Customer_full);
end;

procedure TapgCustomerInfo.memCustNoticeExit(Sender: TObject);
begin
  SaveNotice;
end;

procedure TapgCustomerInfo.SetSaveBtnVisible;
var
  s: string;
begin
  if FDataSource.DataSet.FieldByName('Notice').IsNull then
    s := ''
  else
    s := FDataSource.DataSet.FieldByName('Notice').AsString;
  btnSaveNotice.Visible := (s <> memCustNotice.Lines.Text);
end;

procedure TapgCustomerInfo.memCustNoticeKeyPress(Sender: TObject; var Key: Char);
begin
  SetSaveBtnVisible;
end;

procedure TapgCustomerInfo.CopyHtmlAsText;
begin
{$IFDEF USE_PIXIE}
  if HtmlViewer.Document.HasSelection then
    Clipboard.AsText := HtmlViewer.Document.GetSelectedText;
{$ELSE}
  {

    в THtmlViewer нужно добавить код после procedure THtmlViewer.CopyToClipboard;
    procedure THtmlViewer.CopySelectedAsTextToClipboard;
    var
    Len: Integer;
    begin
    Len := FSectionList.GetSelLength;
    if Len = 0 then
    Exit;

    Clipboard.Open;
    try
    Clipboard.Clear;
    CopyToClipboardAsText(SelText);
    finally
    Clipboard.Close;
    end;
    end;

    тогада не нужно дважды буфер гонять

    var Str: WideString;
    HtmlViewer.CopyToClipboard; // Ctrl+C
    // далее чистим буфер от лишних данных
    // так как HtmlViewer помещает в буфер и текст и html
    Str := GetStringFromClipboard;
    PutStringIntoClipBoard(Str);
  }

  HtmlViewer.CopySelectedAsTextToClipboard;
{$IFEND}
end;

procedure TapgCustomerInfo.miCopyClick(Sender: TObject);
begin
  CopyHtmlAsText;
end;

procedure TapgCustomerInfo.miN1Click(Sender: TObject);
begin
  MemoAlign;
end;

procedure TapgCustomerInfo.SaveNotice;
var
  s: string;
begin
  if (not FDataSource.DataSet.Active) //
    or (FDataSource.DataSet.RecordCount = 0) //
    or (FDataSource.DataSet.FindField('Customer_id') = nil) then
    exit;

  if FDataSource.DataSet.FieldByName('Notice').IsNull then
    s := ''
  else
    s := FDataSource.DataSet.FieldByName('Notice').AsString;

  if s <> memCustNotice.Lines.Text then
  begin
    s := memCustNotice.Lines.Text;
    with TpFIBQuery.Create(nil) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        SQL.Text := 'UPDATE Customer SET Notice = :Notice WHERE (Customer_Id = :Customer_Id)';
        ParamByName('Notice').AsString := s;
        ParamByName('Customer_Id').AsInt64 := FDataSource.DataSet['Customer_id'];
        Transaction.StartTransaction;
        ExecQuery;
        Transaction.Commit;
        UpdatePage;
      finally
        Free;
      end;
    end;
  end;
  SetSaveBtnVisible;
end;

procedure TapgCustomerInfo.sbRecalcClick(Sender: TObject);
begin
  if actRecalc.Visible then
    actRecalc.Execute;
end;

procedure TapgCustomerInfo.sbRecalcMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  // попытка обойти ошибку Wine + ESC
  FSkipRecalc := not FRunUnderWine;
end;

procedure TapgCustomerInfo.N2Click(Sender: TObject);
var
  Save_Cursor: TCursor;
  i: Integer;
begin
  Save_Cursor := Screen.Cursor;
  Screen.Cursor := crHourGlass; { Show hourglass cursor }
  try
    if FGrid.SelectedRows.Count = 0 then
    begin
      FGrid.DataSource.DataSet.First;
      while not FGrid.DataSource.DataSet.Eof do
      begin
        RecalcCustomer(FGrid.DataSource.DataSet['customer_id']);
        Application.ProcessMessages;
        FGrid.DataSource.DataSet.Next;
      end;
    end
    else
    begin
      for i := 0 to FGrid.SelectedRows.Count - 1 do
      begin
        FGrid.DataSource.DataSet.Bookmark := FGrid.SelectedRows[i];
        RecalcCustomer(FGrid.DataSource.DataSet['customer_id']);
        Application.ProcessMessages;
      end;
    end;

  finally
    Screen.Cursor := Save_Cursor; { Always restore to normal }
  end
end;

procedure TapgCustomerInfo.RecalcCustomer(const CUSTOMER_ID: Int64);
begin
  with TpFIBQuery.Create(Self) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      Transaction.StartTransaction;
      // передаем два нула, чтоб пересчитать все периоды абонента
      SQL.Text := 'EXECUTE PROCEDURE FULL_RECALC_CUSTOMER(:CUST, null, null)';
      ParamByName('CUST').AsInt64 := CUSTOMER_ID;
      ExecQuery;
      Transaction.Commit;
      UpdatePage;
    finally
      Free;
    end;
  end;
end;

procedure TapgCustomerInfo.dsContactsNewRecord(DataSet: TDataSet);
begin
  dsContacts['CUSTOMER_ID'] := FDataSource.DataSet['CUSTOMER_ID'];
  dsContacts['Cc_type'] := 0;
  dsContacts['Cc_Notify'] := 1;
end;

procedure TapgCustomerInfo.OpenData;
var
  s: string;
begin
  if (not dsCustomer.Active) then
    dsCustomer.Open;

  if (not dsContacts.Active) then
  begin
    s := GetOrderClause(dbgrdhContacts);
    dsContacts.OrderClause := s;
    dsContacts.Open;
  end;
end;

function TapgCustomerInfo.GetOrderClause(grid: TCustomDBGridEh): string;
var
  s: string;
  i, J: Integer;
begin
  J := grid.SortMarkedColumns.Count;
  s := ' ';
  for i := 0 to pred(J) do
  begin
    {
      if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'ACCOUNT_NO') then
      s := s + 'C.account_no'
      else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'STREET_NAME') then
      s := s + 'S.Street_Name||s.street_short'
      else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'FLAT_NO') then
      s := s + 'C.Flat_No'
      else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'HOUSE_NO') then
      s := s + 'H.HOUSE_NO '
      else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'ATR_LINE') then
      s := s + 'cast(cal.ATR_LINE as varchar(50))'
      else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'NOTICE') then
      s := s + 'C.NOTICE'
      else if (AnsiUpperCase(grid.SortMarkedColumns[i].FieldName) = 'CUST_CODE')
      then
      s := s + 'C.CUST_CODE'
      else
    }
    s := s + grid.SortMarkedColumns[i].FieldName;

    if grid.SortMarkedColumns[i].Title.SortMarker = smDownEh then
      s := s + ' desc';
    if i <> pred(J) then
      s := s + ', ';
  end;
  Result := s;
end;

procedure TapgCustomerInfo.PropStorageEhReadProp(Sender: TObject; Reader: TPropReaderEh; const PropName: string;
  var Processed: Boolean);
var
  h: Integer;
begin
  if PropName = 'MemoHeight' then
  begin
    h := Reader.ReadInteger();
    if h > 0 then
    begin
      FMemoNeedRealign := True;
      MemoAlign;
      pnlDP.Height := h;
    end;
    Processed := True;
  end;
end;

procedure TapgCustomerInfo.PropStorageEhWriteCustomProps(Sender: TObject; Writer: TPropWriterEh);
begin
  Writer.WritePropName('MemoHeight');
  if spltMemo.Align = alTop then
    Writer.WriteInteger(pnlDP.Height)
  else
    Writer.WriteInteger(0);
end;

procedure TapgCustomerInfo.actCAddExecute(Sender: TObject);
var
  Contact: TContact;
  CanAdd: Boolean;
  Terminated: Boolean;
begin
  if (FDataSource.DataSet.RecordCount = 0) or (FDataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull) then
    exit;

  CanAdd := dmMain.AllowedAction(rght_Customer_full);
  Terminated := (not FDataSource.DataSet.FieldByName('VALID_TO').IsNull) and (FDataSource.DataSet['VALID_TO'] < Now());

  if not CanAdd then
  begin
    CanAdd := (not Terminated) or dmMain.AllowedAction(rght_Customer_Edit_Terminated);
    CanAdd := CanAdd and (dmMain.AllowedAction(rght_Customer_add) or dmMain.AllowedAction(rght_Customer_Contact_Add));
  end;

  if not CanAdd then
  begin
    if Terminated then
      ShowMessage(rsContractNotValid);
    exit;
  end;

  if not dsContacts.Active then
    dsContacts.Open;

  Contact.cID := 1; // мобила
  Contact.CustID := FDataSource.DataSet['CUSTOMER_ID'];
  Contact.Notify := 1; // уведомлять
  if EditContact(Contact) then
  begin
    dsContacts.Insert;
    dsContacts['CUSTOMER_ID'] := FDataSource.DataSet['CUSTOMER_ID'];
    dsContacts['CC_TYPE'] := Contact.cID;
    dsContacts['CC_VALUE'] := Contact.Contact;
    dsContacts['CC_NOTICE'] := Contact.Notice;
    dsContacts['Cc_Notify'] := Contact.Notify;
    dsContacts['O_Name'] := Contact.cType;
    dsContacts.Post;
    dsContacts.CloseOpen(True);
    dsContacts.Locate('CC_VALUE', Contact.Contact, []);
    dbgrdhContacts.SetFocus;
  end
end;

procedure TapgCustomerInfo.actCDelExecute(Sender: TObject);
var
  s: string;
  CanAdd: Boolean;
  Terminated: Boolean;
begin
  if (FDataSource.DataSet.RecordCount = 0) or (FDataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull) then
    exit;

  if (not dsContacts.Active) or (dsContacts.RecordCount = 0) then
    exit;

  CanAdd := dmMain.AllowedAction(rght_Customer_full);
  Terminated := (not FDataSource.DataSet.FieldByName('VALID_TO').IsNull) and (FDataSource.DataSet['VALID_TO'] < Now());

  if not CanAdd then
  begin
    CanAdd := (not Terminated) or dmMain.AllowedAction(rght_Customer_Edit_Terminated);
    CanAdd := CanAdd and dmMain.AllowedAction(rght_Customer_Contact_Edit);
  end;

  if not CanAdd then
  begin
    if Terminated then
      ShowMessage(rsContractNotValid);
    exit;
  end;

  if not dsContacts.FieldByName('CC_VALUE').IsNull then
    s := Format(rsDeleteWithName, [dsContacts.FieldByName('CC_VALUE').AsString])
  else
    s := rsContactDelete;

  if MessageDlg(s, mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    dsContacts.Delete;
end;

procedure TapgCustomerInfo.actCEditExecute(Sender: TObject);
var
  Contact: TContact;
  CanAdd: Boolean;
  Terminated: Boolean;
begin
  if (FDataSource.DataSet.RecordCount = 0) or (FDataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull) then
    exit;

  CanAdd := dmMain.AllowedAction(rght_Customer_full);
  Terminated := (not FDataSource.DataSet.FieldByName('VALID_TO').IsNull) and (FDataSource.DataSet['VALID_TO'] < Now());

  if not CanAdd then
  begin
    CanAdd := (not Terminated) or dmMain.AllowedAction(rght_Customer_Edit_Terminated);
    CanAdd := CanAdd and dmMain.AllowedAction(rght_Customer_Contact_Edit);
  end;

  if not CanAdd then
  begin
    if Terminated then
      ShowMessage(rsContractNotValid);
    exit;
  end;

  if (not dsContacts.Active) then
    dsContacts.Open;
  if dsContacts.RecordCount > 0 then
  begin
    Contact.cID := dsContacts['CC_TYPE'];
    if not dsContacts.FieldByName('CC_VALUE').IsNull then
      Contact.Contact := dsContacts['CC_VALUE']
    else
      Contact.Contact := '';
    if not dsContacts.FieldByName('CC_NOTICE').IsNull then
      Contact.Notice := dsContacts['CC_NOTICE']
    else
      Contact.Notice := '';
    if not dsContacts.FieldByName('Cc_Notify').IsNull then
      Contact.Notify := dsContacts['Cc_Notify']
    else
      Contact.Notify := 0;
    if not dsContacts.FieldByName('O_Name').IsNull then
      Contact.cType := dsContacts['O_Name']
    else
      Contact.cType := '';
  end
  else
    Contact.cID := -1;
  Contact.CustID := FDataSource.DataSet['CUSTOMER_ID'];
  if EditContact(Contact) then
  begin
    if dsContacts.RecordCount > 0 then
      dsContacts.Edit
    else
      dsContacts.Insert;
    dsContacts['CUSTOMER_ID'] := FDataSource.DataSet['CUSTOMER_ID'];
    dsContacts['CC_TYPE'] := Contact.cID;
    dsContacts['CC_VALUE'] := Contact.Contact;
    dsContacts['CC_NOTICE'] := Contact.Notice;
    dsContacts['Cc_Notify'] := Contact.Notify;
    dsContacts['O_Name'] := Contact.cType;

    dsContacts.Post;
    dbgrdhContacts.SetFocus;
  end
end;

procedure TapgCustomerInfo.actMakeCallExecute(Sender: TObject);
begin
  if (dsContacts.RecordCount = 0) or (dsContacts.FieldByName('CC_TYPE').IsNull) or
    (dsContacts.FieldByName('CC_VALUE').IsNull) then
    exit;

  A4MainForm.MakeCall(dsContacts['CC_TYPE'], dsContacts['CC_VALUE']);
end;

procedure TapgCustomerInfo.actMakeDefContactExecute(Sender: TObject);
var
  t: Integer;
  v: string;
begin
  if not(dmMain.AllowedAction(rght_Customer_edit) //
    or dmMain.AllowedAction(rght_Customer_full) //
    or dmMain.AllowedAction(rght_Customer_Contact_Edit)) then
    exit;

  if (dsContacts.RecordCount = 0) //
    or dsContacts.FieldByName('Customer_id').IsNull //
    or dsContacts.FieldByName('Cc_Type').IsNull //
    or dsContacts.FieldByName('Cc_Value').IsNull { // } then
    exit;
  dsContacts.DisableControls;

  t := dsContacts['Cc_Type'];
  v := dsContacts['Cc_Value'];

  with TpFIBQuery.Create(nil) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'update Customer_Contacts set Cc_Notify = iif(Cc_Value = :Cc_Value, 1, 0) ' +
        ' where (Customer_Id = :Customer_Id) and (Cc_Type = :Cc_Type)';
      ParamByName('Customer_Id').AsInt64 := dsContacts['Customer_id'];
      ParamByName('Cc_Type').AsInteger := t;
      ParamByName('Cc_Value').AsString := v;
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      UpdatePage;
    finally
      Free;
    end;
  end;
  dsContacts.CloseOpen(True);
  dsContacts.Locate('Cc_Type;Cc_Value', VarArrayOf([t, v]), []);
  dsContacts.EnableControls;
end;

procedure TapgCustomerInfo.actNotSendContatctExecute(Sender: TObject);
var
  t: Integer;
  v: string;
begin
  if not(dmMain.AllowedAction(rght_Customer_edit) //
    or dmMain.AllowedAction(rght_Customer_full) //
    or dmMain.AllowedAction(rght_Customer_Contact_Edit)) then
    exit;

  if (dsContacts.RecordCount = 0) //
    or dsContacts.FieldByName('Customer_id').IsNull //
    or dsContacts.FieldByName('Cc_Type').IsNull //
    or dsContacts.FieldByName('Cc_Value').IsNull { // } then
    exit;
  dsContacts.DisableControls;

  t := dsContacts['Cc_Type'];
  v := dsContacts['Cc_Value'];

  with TpFIBQuery.Create(nil) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'update Customer_Contacts set Cc_Notify = 0 ' +
        ' where (Customer_Id = :Customer_Id) and (Cc_Type = :Cc_Type) and (Cc_Value = :Cc_Value)';
      ParamByName('Customer_Id').AsInt64 := dsContacts['Customer_id'];
      ParamByName('Cc_Type').AsInteger := t;
      ParamByName('Cc_Value').AsString := v;
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      UpdatePage;
    finally
      Free;
    end;
  end;
  dsContacts.CloseOpen(True);
  dsContacts.Locate('Cc_Type;Cc_Value', VarArrayOf([t, v]), []);
  dsContacts.EnableControls;
end;

procedure TapgCustomerInfo.actRecalcExecute(Sender: TObject);
var
  b: TDateTime;
  Save_Cursor: TCursor;
begin
  // попытка обойти ошибку Wine + ESC
  if FRunUnderWine and FSkipRecalc then
    exit;

  Save_Cursor := Screen.Cursor;
  b := Now();
  Screen.Cursor := crSQLWait;
  try
    RecalcCustomer(FDataSource.DataSet['CUSTOMER_ID']);
  finally
    Screen.Cursor := Save_Cursor;
  end;
  b := b - Now();
  ShowMessage(Format(rsCalculateComplite, [TimeToStr(b)]));

  FSkipRecalc := FRunUnderWine;
end;

procedure TapgCustomerInfo.actSendMessageExecute(Sender: TObject);
begin
  if not(dmMain.AllowedAction(rght_Customer_full) //
    or dmMain.AllowedAction(rght_Messages_add)) then
    exit;

  if (dsContacts.RecordCount = 0) //
    or dsContacts.FieldByName('Cc_Value').IsNull { // } then
    exit;

  SendMessages(dsContacts.FieldByName('CUSTOMER_ID').AsInteger, dsContacts.FieldByName('Cc_Value').AsString);
end;

procedure TapgCustomerInfo.btnAlignClick(Sender: TObject);
begin
  MemoAlign;
end;

procedure TapgCustomerInfo.btnSaveNoticeClick(Sender: TObject);
begin
  SaveNotice;
end;

procedure TapgCustomerInfo.CloseData;
begin
  if dsCustomer.Active then
    dsCustomer.Close;

  if dsContacts.Active then
    dsContacts.Close;
end;

procedure TapgCustomerInfo.dsContactsBeforePost(DataSet: TDataSet);
begin
  if dsContacts.State in [dsInsert, dsEdit] then
    if (dsContacts.FieldByName('CC_VALUE').IsNull) or (Trim(dsContacts.FieldByName('CC_VALUE').AsString) = '') then
      Abort;
end;

procedure TapgCustomerInfo.dbeACCOUNT_NODblClick(Sender: TObject);
begin
  // Clipboard.AsText := dbeACCOUNT_NO.Text;
end;

procedure TapgCustomerInfo.dbgrdhContactsDblClick(Sender: TObject);
begin
  actMakeCallExecute(Sender);
end;

procedure TapgCustomerInfo.dbgrdhContactsExit(Sender: TObject);
begin
  SaveContact;
end;

procedure TapgCustomerInfo.dbgrdhContactsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (not(Sender as TDBGridEh).DataSource.DataSet.FieldByName('Cc_Notify').IsNull) //
    and ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('Cc_Notify').AsInteger = 1) then
    Background := $00D7FFD7;
end;

procedure TapgCustomerInfo.dbgrdhContactsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ActiveControl = dbgrdhContacts then
  begin
    case Key of
      VK_INSERT:
        actCAdd.Execute;
      VK_DELETE:
        actCDel.Execute;
      VK_F2:
        actCEdit.Execute;
      VK_RETURN:
        actMakeCall.Execute;
    end;
  end;
end;

procedure TapgCustomerInfo.SaveContact;
begin
  if dsContacts.State in [dsInsert, dsEdit] then
  begin
    dsContacts.Post;
    UpdatePage;
  end;
end;

procedure TapgCustomerInfo.srcContactsUpdateData(Sender: TObject);
begin
  if dsContacts.State in [dsInsert, dsEdit] then
    if (dsContacts.FieldByName('CC_VALUE').IsNull) or (Trim(dsContacts.FieldByName('CC_VALUE').AsString) = '') then
      dsContacts.Cancel;
end;

procedure TapgCustomerInfo.srcCustomerDataChange(Sender: TObject; Field: TField);
begin
  UpdateInfoPanel;
end;

procedure TapgCustomerInfo.FormCreate(Sender: TObject);
begin
  FHtmlParams := TStringList.Create;
  FHtmlParams.Sorted := True;
  FHtmlParams.Duplicates := dupIgnore;
  FRunUnderWine := GetWineAvail;
  FSkipRecalc := FRunUnderWine;

  CreateHtmlView;
end;

procedure TapgCustomerInfo.FormDestroy(Sender: TObject);
begin
  DestroyHtmlView;

  if Assigned(FHtmlParams) then
    FHtmlParams.Free;
end;

procedure TapgCustomerInfo.FormShow(Sender: TObject);
begin
  FCheckPassport := (dmMain.GetSettingsValue('MVD_KEY') <> '');
end;

procedure TapgCustomerInfo.GetHtmlParams;
var
  M: TMatchCollection;
  i: Integer;
  s: string;
begin
  M := TRegEx.Matches(FHtml, '<!--(.*?)-->', [roMultiLine]);
  // получаем коллекцию совпадений
  for i := 0 to M.Count - 1 do
  begin
    s := M.Item[i].Groups[1].Value;
    FHtmlParams.Add(s); // выводим совпадение
  end;
end;

procedure TapgCustomerInfo.MakeHtmlWithParams;
var
  i: Integer;
  P, v, s, img: string;
  resMemo: string;
  PASS_STATE: string;
begin
  resMemo := FHtml;

  PASS_STATE := '';
  v := '';
  img := '';
  if FCheckPassport and (not FDataSource.DataSet.FieldByName('JURIDICAL').IsNull) and
    (FDataSource.DataSet['JURIDICAL'] = 0) then
  begin
    if FDataSource.DataSet['PASSPORT_VALID'] = 0 then
    begin
      PASS_STATE := 'NOTVALID';
      v := '<hr>' + rsPassportNotValid + '<hr>';
      img := 'x ';
    end
    else if FDataSource.DataSet['PASSPORT_VALID'] = -1 then
    begin
      PASS_STATE := 'INFO';
      v := '<hr>' + rsError + '. ' + rsNeedPassportCheck + '<hr>';
      img := '! ';
    end
    else if (not FDataSource.DataSet.FieldByName('PASSPORT_VALID').IsNull) then
    begin
      PASS_STATE := 'VALID';
      img := 'v ';
    end;
  end;

  resMemo := StringReplace(resMemo, '<!--PASS_STATE-->', PASS_STATE, [rfReplaceAll, rfIgnoreCase]);
  resMemo := StringReplace(resMemo, '<!--PASS_STATE_IMG-->', img, [rfReplaceAll, rfIgnoreCase]);
  resMemo := StringReplace(resMemo, '<!--PASS_ERROR-->', v, [rfReplaceAll, rfIgnoreCase]);

  for i := 0 to FHtmlParams.Count - 1 do
  begin
    P := FHtmlParams[i];
    v := GetParamValue(P);
    if (FDataSource.DataSet['JURIDICAL'] = 0) and (not v.IsEmpty) then
    begin
      s := P.ToUpper;
      if (FHidePersonalData) then
      begin
        if ((s = 'PASSPORT_NUMBER') or (s = 'PASSPORT_REGISTRATION') or (s = 'BIRTHDAY')) then
          v := ''
        else if (s = 'SURNAME') then
          v := HideSurname(v);
      end;

      if (FHidePersonalName) then
      begin
        if (s = 'FIRSTNAME') then
          v := HideSurname(v)
        else if (s = 'MIDLENAME') then
          v := HideSurname(v);
      end;
    end;

    resMemo := StringReplace(resMemo, '<!--' + P + '-->', v, [rfReplaceAll, rfIgnoreCase]);
  end;

  // if FWkeHtml then
  // FWkeWebbrowser.LoadHtml(resMemo)
  // else
  HtmlViewer.LoadFromString(resMemo);
end;

procedure TapgCustomerInfo.infoPanelConfig;
var
  s, gi: string;
  i: Integer;
  a: TArray<string>;
  allSQL, groupSQL: string;
begin
  s := dmMain.GetSettingsValue('INFO_PANEL');
  s := s + dmMain.GetSettingsValue('INFO_PANEL_1');
  s := s + dmMain.GetSettingsValue('INFO_PANEL_2');
  s := s + dmMain.GetSettingsValue('INFO_PANEL_3');
  s := s + dmMain.GetSettingsValue('INFO_PANEL_4');
  s := s + dmMain.GetSettingsValue('INFO_PANEL_5');
  FHtml := s;

  s := dmMain.UserGroups.Trim;
  if not s.IsEmpty then
  begin
    a := s.Split([',']);
    for i := 0 to Length(a) - 1 do
    begin
      s := '';
      gi := a[i].Trim;
      s := dmMain.GetSettingsValue('INFO_PANEL_GR' + gi);
      s := s + dmMain.GetSettingsValue('INFO_PANEL_GR' + gi + '_1');
      s := s + dmMain.GetSettingsValue('INFO_PANEL_GR' + gi + '_2');
      s := s + dmMain.GetSettingsValue('INFO_PANEL_GR' + gi + '_3');
      s := s + dmMain.GetSettingsValue('INFO_PANEL_GR' + gi + '_4');
      s := s + dmMain.GetSettingsValue('INFO_PANEL_GR' + gi + '_5');
      if not s.IsEmpty then
        FHtml := s;
    end;
  end;

  if FHtml.IsEmpty then
    FHtml := '<html><head><style>body{font-family:Tahoma;line-height:170%}.acc{font-size:20px;}' //
      + '.pass{color:black;}' //
      + '.passVALID{color:black;font-weight:bold;}' //
      + '.passINFO{color:DarkOrange;}' //
      + '.passNOTVALID{color:red;font-weight:bold;}' //
      + '</style></head><body>'
    // для соохранения форматирования
      + 'Лицевой счет <font class="acc"><strong><!--ACCOUNT_NO--></strong></font><br>'
    // для соохранения форматирования
      + 'Договор <strong><!--DOGOVOR_NO--></strong> от <strong><!--CONTRACT_DATE--></strong> Перв. подкл. <strong>' //
      + '<!--ACTIVIZ_DATE--></strong><br>'
    // для соохранения форматирования
      + 'ФИО <strong><!--SURNAME--> <!--FIRSTNAME--> <!--MIDLENAME--></strong><br>'
    // для соохранения форматирования
      + 'Адрес <strong><!--STREET_SHORT--> <!--STREET_NAME--> д. <!--HOUSE_NO--> кв. <!--FLAT_NO--></strong><br>'
    // для соохранения форматирования
      + 'Паспорт <!--PASS_STATE_IMG--><font class="pass<!--PASS_STATE-->"><!--PASSPORT_NUMBER--></font> выдан <strong>'
    //
      + '<!--PASSPORT_REGISTRATION--></strong><!--PASS_ERROR--><br>'
    // для соохранения форматирования
      + 'Прописка <strong><!--ADRES_REGISTR--></strong><br>'
    // для соохранения форматирования
      + 'ДР <strong><!--BIRTHDAY--></strong><br>'
    // для соохранения форматирования
      + 'Статус <strong><!--CUST_STATE_DESCR--></strong>'
    // для соохранения форматирования
      + '</body></html>';

  groupSQL := '';
  groupSQL := dmMain.UserGroups.Trim;
  if not groupSQL.IsEmpty then
  begin
    a := groupSQL.Split([',']);
    gi := a[0].Trim;
    groupSQL := dmMain.GetSettingsValue('INFO_PANEL_SQL_GR' + gi);
    groupSQL := groupSQL + #13#10 + dmMain.GetSettingsValue('INFO_PANEL_SQL_GR' + gi + '_1');
    groupSQL := groupSQL + #13#10 + dmMain.GetSettingsValue('INFO_PANEL_SQL_GR' + gi + '_2');
    groupSQL := groupSQL.Trim;
  end;

  if groupSQL.IsEmpty then
  begin
    allSQL := dmMain.GetSettingsValue('INFO_PANEL_SQL');
    allSQL := allSQL + #13#10 + dmMain.GetSettingsValue('INFO_PANEL_SQL_1');
    allSQL := allSQL + #13#10 + dmMain.GetSettingsValue('INFO_PANEL_SQL_2');
    allSQL := allSQL.Trim;
  end
  else
    allSQL := groupSQL;

  if allSQL.IsEmpty then
    allSQL := 'SELECT CUSTOMER_ID from customer where CUSTOMER_ID = :CUSTOMER_ID';

  dsCustomer.SQLs.SelectSQL.Text := allSQL;
end;

{$IFDEF USE_PIXIE}

procedure TapgCustomerInfo.PixieHtmlViewerSectionClick(Sender: TObject; Button: TMouseButton; Shift: TShiftState;
  X, Y: Integer);
var
  pt: TPoint;
begin
  if (Button = mbRight) and HtmlViewer.Document.HasSelection and (Length(HtmlViewer.Document.GetSelectedText) > 0) then
  begin
    pt := Mouse.CursorPos;
    pmHV.Popup(pt.X, pt.Y);
  end;
end;

{$ELSE}

procedure TapgCustomerInfo.HtmlViewerSectionClick(Sender: TObject; Obj: TSectionBase; Button: TMouseButton;
  Shift: TShiftState; X, Y, IX, IY: Integer);
var
  pt: TPoint;
begin
  if HtmlViewer.SelLength <> 0 then
  begin
    pt := Mouse.CursorPos;
    pmHV.Popup(pt.X, pt.Y);
  end;
end;

procedure TapgCustomerInfo.HtmlViewerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) then
  begin
    case Key of
      67:
        CopyHtmlAsText;
      65:
        HtmlViewer.SelectAll; // Ctrl+A
    end;
  end;
end;

procedure TapgCustomerInfo.CreateBerndGabrielHtmlViewer;
begin
  HtmlViewer := THtmlViewer.Create(Self);
  HtmlViewer.Name := 'HtmlViewer';
  HtmlViewer.Parent := pnlHTML;
  HtmlViewer.Left := 0;
  HtmlViewer.Top := 37;
  HtmlViewer.Width := 441;
  HtmlViewer.Height := 192;
  HtmlViewer.ParentCustomHint := False;
  HtmlViewer.BorderStyle := htNone;
  HtmlViewer.DefFontName := 'Tahoma';
  HtmlViewer.HistoryMaxCount := 0;
  HtmlViewer.HtOptions := [];
  HtmlViewer.NoSelect := False;
  HtmlViewer.Text := '';
  HtmlViewer.Align := alClient;
  HtmlViewer.PopupMenu := pmHV;
  HtmlViewer.TabOrder := 0;
  HtmlViewer.OnKeyUp := HtmlViewerKeyUp;
  HtmlViewer.OnSectionClick := HtmlViewerSectionClick;
end;
{$IFEND}

function TapgCustomerInfo.GetParamValue(const param: string): string;
var
  v: string;
  fld: TField;
  NeedCHK: Boolean;
begin
  v := '';
  NeedCHK := True;
  if dsCustomer.Active then
  begin
    fld := dsCustomer.FindField(param);
    if (not(fld = nil)) then
    begin
      NeedCHK := False;
      if not fld.IsNull then
        v := fld.AsString;
    end;
  end;

  if NeedCHK and v.IsEmpty then
  begin
    fld := FDataSource.DataSet.FindField(param);
    if (not(fld = nil)) then
    begin
      if not fld.IsNull then
        v := fld.AsString;
    end;
  end;

  Result := v;
end;

procedure TapgCustomerInfo.UpdateInfoPanel;
var
  WindowLocked: Boolean;
begin
  WindowLocked := LockWindowUpdate(Self.Handle);
  try

    if FDataSource.DataSet.FieldByName('Notice').IsNull then
      memCustNotice.Lines.Text := ''
    else
      memCustNotice.Lines.Text := FDataSource.DataSet.FieldByName('Notice').AsString;

    pnlPrepay.Visible := False;
    if not FDataSource.DataSet.FieldByName('PREPAY').IsNull then
      pnlPrepay.Visible := (FDataSource.DataSet.FieldByName('PREPAY').AsCurrency <> 0);

    if not FDataSource.DataSet.FieldByName('HIS_COLOR').IsNull then
      try
        Self.Color := StringToColor(FDataSource.DataSet.FieldByName('HIS_COLOR').Value);
      except
        Self.Color := clBtnFace
      end
    else
      Self.Color := clBtnFace;

{$IFDEF USE_PIXIE}
    HtmlViewer.Color := Self.Color;
{$ELSE}
    HtmlViewer.defBackground := Self.Color;
{$IFEND}
    if FHL_ROW then
    begin
      try
        if (not dsCustomer.FieldByName('ROW_HL_COLOR').IsNull) then
        begin
          // Self.Color := FHL_COLOR; // TColor($00FF7B9E);// Purple
          // выводим разные цвета и абонента и условия окраски
{$IFDEF USE_PIXIE}
          HtmlViewer.Color := FHL_COLOR;
{$ELSE}
          HtmlViewer.defBackground := FHL_COLOR;
{$IFEND}
          if Self.Color = clBtnFace then
            Self.Color := FHL_COLOR
        end
      except
        FHL_ROW := False;
      end;
    end;

    pnlHTML.Color := Self.Color;
    pnlBtns.Color := Self.Color;
    // if FWkeHtml then
    // FWkeWebbrowser.Color := Self.Color
    // else

    MakeHtmlWithParams;
  finally
    if WindowLocked then
      LockWindowUpdate(0);
  end;
end;

procedure TapgCustomerInfo.UpdateObject;
begin
  // обновим инфо панель.
  if dsCustomer.Active then
    dsCustomer.CloseOpen(True)
  else
    UpdateInfoPanel;
end;

procedure TapgCustomerInfo.MemoAlign;
begin
  if FMemoNeedRealign then
  begin
    pnlDP.Align := alTop;
    spltMemo.Align := alTop;
    pnlDP.Height := Trunc(Self.Height / 2);
    pnlDP.Realign;
    gbMemo.Height := Trunc(Self.Height / 2);

    FMemoNeedRealign := False;
  end
  else
  begin
    pnlDP.Align := alLeft;
    spltMemo.Align := alRight;
    spltMemo.Align := alLeft;
    pnlDP.Height := Self.Height;
    gbMemo.Height := Self.Height;
    pnlDP.Realign;

    FMemoNeedRealign := True;
  end;
end;

procedure TapgCustomerInfo.CreateHtmlView;
begin
  FWkeHtml := False;
  {
    FWkeHtml := FileExists(ExtractFilePath(Application.ExeName) + 'miniblink.dll');
    if FWkeHtml then
    begin
    FWkeWebbrowser := TWkeWebbrowser.Create(Self);

    FWkeWebbrowser.Name := 'WkeWebBrowser';
    FWkeWebbrowser.Parent := pnlHTML;
    FWkeWebbrowser.Align := alClient;
    FWkeWebbrowser.Color := Self.Color;
    FWkeWebbrowser.Taborder := 0;
    // fWkeWebbrowser.UserAgent := 'miniblink A4on.TV';
    // FWkeWebbrowser.CspEnabled := true;
    FWkeWebbrowser.Headless := False;
    FWkeWebbrowser.TouchEnabled := False;
    FWkeWebbrowser.DragEnabled := False;
    FWkeWebbrowser.LocalStoragePath := GetUserCacheFolder();
    FWkeWebbrowser.CookiePath := GetUserCacheFolder();
    FWkeWebbrowser.PopupEnabled := False;
    FWkeWebbrowser.Visible := true;
    end;
    HtmlViewer.Visible := not FWkeHtml;
  }

{$IFDEF USE_PIXIE}
  HtmlViewer := TPixieHtmlView.Create(Self);
  HtmlViewer.Parent := pnlHTML;
  HtmlViewer.BorderStyle := bsNone;
  HtmlViewer.Align := alClient;
  HtmlViewer.Color := clWhite;
  HtmlViewer.OnMouseUp := PixieHtmlViewerSectionClick;
{$ELSE}
  CreateBerndGabrielHtmlViewer;
{$IFEND}
end;

procedure TapgCustomerInfo.DestroyHtmlView;
begin
  // if Assigned(FWkeWebbrowser) then
  // FWkeWebbrowser.Free;

  HtmlViewer.Free;
end;

end.
