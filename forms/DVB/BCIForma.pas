unit BCIForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, PropFilerEh, System.Actions,
  Vcl.ActnList, CnErrorProvider, PropStorageEh, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEh, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
  DynVarsEh, EhLibJPegImage, EhLibGIFImage, EhLibPNGImage, EhLibVCL,
  GridsEh, DBAxisGridsEh, Data.DB, FIBDataSet, pFIBDataSet, Vcl.Mask,
  DBCtrlsEh, DBLookupEh, FIBDatabase, pFIBDatabase, MemTableDataEh,
  MemTableEh, dnSplitter, FIBQuery, pFIBQuery;

type
  TBCIForm = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btnCancel: TBitBtn;
    btnOk: TBitBtn;
    PropStorageEh: TPropStorageEh;
    cnError: TCnErrorProvider;
    ActionList1: TActionList;
    actSave: TAction;
    dsChannels: TpFIBDataSet;
    srcChnlsAll: TDataSource;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    pnlIssue: TPanel;
    lblAttribute: TLabel;
    lcbBI_TYPE: TDBLookupComboboxEh;
    chkATV: TDBCheckBoxEh;
    chkDTV: TDBCheckBoxEh;
    chkIPTV: TDBCheckBoxEh;
    chkOTT: TDBCheckBoxEh;
    mmoNotice: TDBMemoEh;
    pnlResult: TPanel;
    Label1: TLabel;
    chkALTER_CONFIG: TDBCheckBoxEh;
    mmoRESULT_TEXT: TDBMemoEh;
    lcbRESULT_CODE: TDBLookupComboboxEh;
    trIW: TpFIBTransaction;
    trIR: TpFIBTransaction;
    dsIssue: TpFIBDataSet;
    srcIssue: TDataSource;
    dsIType: TpFIBDataSet;
    srcIType: TDataSource;
    trRIT: TpFIBTransaction;
    dsSolution: TpFIBDataSet;
    srcSolution: TDataSource;
    pnlChls: TPanel;
    pnlChnlAll: TPanel;
    pnlBtns: TPanel;
    dbgChannels: TDBGridEh;
    lbl1: TLabel;
    pnlChnlsSelected: TPanel;
    dbgChlsSelected: TDBGridEh;
    lbl2: TLabel;
    mtChnlsAll: TMemTableEh;
    mtChnlsSel: TMemTableEh;
    srcChnlsSel: TDataSource;
    btnAdd: TSpeedButton;
    btnDel: TSpeedButton;
    spl1: TSplitter;
    spl2: TSplitter;
    qrySave: TpFIBQuery;
    procedure actSaveExecute(Sender: TObject);
    procedure dsChannelsBeforePost(DataSet: TDataSet);
    procedure dsIssueNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure dbgChannelsDblClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure dbgChlsSelectedDblClick(Sender: TObject);
    procedure chkATVClick(Sender: TObject);
  private
    { Private declarations }
    FIssueID: Integer;
    procedure SetIssueID(const Value: Integer);
    procedure CheckAndClose;
    procedure LoadChannelsToMem;
    function SaveIssue: Boolean;
    function SaveChannels: Boolean;
    procedure AddChannelToIssue;
    procedure DelChannelFromIssue;
    procedure FilterChannels;
  public
    property IssueID: Integer read FIssueID write SetIssueID;
  end;

function BroadCastIssue(var Issue_Id: Integer): Boolean;

implementation

uses
  DM, PrjConst, MAIN;

{$R *.dfm}

function BroadCastIssue(var Issue_Id: Integer): Boolean;
var
  BCIForm: TBCIForm;
begin
  BCIForm := TBCIForm.Create(application);
  try
    BCIForm.IssueID := Issue_Id;

    if (BCIForm.ShowModal = mrOk) then
    begin
      Issue_Id := BCIForm.IssueID;
      Result := True;
    end
    else
    begin
      Issue_Id := -1;
      Result := False;
    end;
  finally
    BCIForm.Free;
  end;
end;

procedure TBCIForm.actSaveExecute(Sender: TObject);
begin
  CheckAndClose;
end;

procedure TBCIForm.btnAddClick(Sender: TObject);
begin
  AddChannelToIssue();
end;

procedure TBCIForm.btnCancelClick(Sender: TObject);
begin
  dsIssue.Cancel;
  ModalResult := mrCancel;
end;

procedure TBCIForm.btnDelClick(Sender: TObject);
begin
  DelChannelFromIssue;
end;

procedure TBCIForm.CheckAndClose;
var
  errorNotFound: Boolean;
begin
  if dbgChannels.DataSource.DataSet.State = dsEdit then
    dbgChannels.DataSource.DataSet.Post;

  errorNotFound := True;

  if (lcbBI_TYPE.Text = '') then
  begin
    errorNotFound := False;
    cnError.SetError(lcbBI_TYPE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnError.Dispose(lcbBI_TYPE);

  if (mmoNotice.Lines.Text = '') then
  begin
    errorNotFound := False;
    cnError.SetError(mmoNotice, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnError.Dispose(mmoNotice);

  if ((lcbRESULT_CODE.Text = '') and (srcIssue.DataSet.State in [dsEdit])) then
  begin
    errorNotFound := False;
    cnError.SetError(lcbRESULT_CODE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnError.Dispose(lcbRESULT_CODE);

  if (not(chkATV.Checked or chkDTV.Checked or chkIPTV.Checked or chkOTT.Checked)) then
  begin
    errorNotFound := False;
    cnError.SetError(chkATV, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnError.Dispose(chkATV);

  if ((mmoRESULT_TEXT.Lines.Text = '') and (srcIssue.DataSet.State in [dsEdit])) then
  begin
    errorNotFound := False;
    cnError.SetError(mmoRESULT_TEXT, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    cnError.Dispose(mmoRESULT_TEXT);

  if (mtChnlsSel.Active and (mtChnlsSel.RecordCount = 0)) then
  begin
    errorNotFound := False;
    cnError.SetError(dbgChlsSelected, rsEmptyFieldError, iaTopCenter, bsNeverBlink);
  end
  else
    cnError.Dispose(dbgChlsSelected);

  if errorNotFound then
  begin
    if SaveIssue then
      ModalResult := mrOk;
  end;
end;

procedure TBCIForm.chkATVClick(Sender: TObject);
begin
  FilterChannels;
end;

procedure TBCIForm.dbgChannelsDblClick(Sender: TObject);
begin
  AddChannelToIssue;
end;

procedure TBCIForm.dbgChlsSelectedDblClick(Sender: TObject);
begin
  if FIssueID = -1 then
    DelChannelFromIssue;
end;

procedure TBCIForm.dsChannelsBeforePost(DataSet: TDataSet);
begin
  //DataSet['Bi_Id'] := FIssueID;
end;

procedure TBCIForm.dsIssueNewRecord(DataSet: TDataSet);
begin
  // DataSet['Bi_Id'] := FIssueID;
  DataSet['Dtv'] := 0;
  DataSet['Atv'] := 0;
  DataSet['Iptv'] := 0;
  DataSet['Ott'] := 0;
  DataSet['Alter_Config'] := 0;
end;

procedure TBCIForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, True);

  dsIssue.Close;
  dsSolution.Close;
  dsIType.Close;
  dsChannels.Close;
end;

procedure TBCIForm.FormShow(Sender: TObject);
var
  i: Integer;
  Font_size: Integer;
  Font_name: string;
  Row_height: Integer;
begin
  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      (Components[i] as TDBGridEh).RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
      if (Components[i] as TDBGridEh).DataSource.DataSet.Active then
        (Components[i] as TDBGridEh).DefaultApplySorting;
      if Font_size <> 0 then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
        (Components[i] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[i] as TDBGridEh).RowHeight := Row_height;
      end;
    end;
  end;

  dsSolution.Open;
  dsIType.Open;

  LoadChannelsToMem;

  if FIssueID <> -1 then
  begin
    pnlIssue.Enabled := False;
    pnlChnlAll.Visible := False;
  end;
end;

procedure TBCIForm.SetIssueID(const Value: Integer);
begin
  FIssueID := Value;
  pnlIssue.Enabled := (FIssueID = -1);

  if (FIssueID <> -1) then
    dsIssue.ParamByName('Bi_Id').AsInteger := FIssueID
  else
    dsIssue.ParamByName('Bi_Id').Clear;

  dsIssue.Open;

  if FIssueID = -1 then
    dsIssue.Insert
  else
    dsIssue.Edit;
end;

procedure TBCIForm.LoadChannelsToMem;
begin
  if not mtChnlsSel.Active then
    mtChnlsSel.Active := True;

  if not mtChnlsAll.Active then
    mtChnlsAll.Active := True;

  mtChnlsSel.EmptyTable;
  mtChnlsAll.EmptyTable;

  dsChannels.ParamByName('issue_only').AsString := ' i.Ch_Id is null ';
  dsChannels.Open;
  mtChnlsAll.LoadFromDataSet(dsChannels, -1, lmCopy, False);
  dsChannels.Close;

  if FIssueID <> -1 then
  begin
    dsChannels.ParamByName('issue_only').AsString := ' i.BI_ID = :BI_ID ';
    dsChannels.ParamByName('Bi_Id').AsInteger := FIssueID;
    dsChannels.Open;
    mtChnlsSel.LoadFromDataSet(dsChannels, -1, lmCopy, False);
    dsChannels.Close;
  end;
end;

function TBCIForm.SaveChannels: Boolean;
begin
  mtChnlsSel.DisableControls;
  mtChnlsSel.First;
  qrySave.SQL.Text := 'execute procedure Bcissuech_Id(:Bi_Id, :Ch_Id, 0)';
  while not mtChnlsSel.EOF do begin
    qrySave.ParamByName('Bi_Id').AsInteger := FIssueID;
    qrySave.ParamByName('Ch_Id').AsInteger := mtChnlsSel['Ch_Id'];
    qrySave.ExecQuery;
    mtChnlsSel.Next;
  end;
  mtChnlsSel.Close;
  SaveChannels := True;
end;

function TBCIForm.SaveIssue: Boolean;
var
 isNew : Boolean;
begin
  isNew := (FIssueID = -1);

  if not isNew then
    dsIssue['Bi_Id'] := FIssueID;
//    FIssueID := DM.dmMain.dbTV.Gen_Id('GEN_ISSUE', 1);

//  dsIssue.ParamByName('Bi_Id').AsInteger := FIssueID;
  dsIssue.Post;

  if isNew then begin
    FIssueID := dsIssue['Bi_Id'];
    Result := SaveChannels;
  end
  else
    Result := True;
end;

procedure TBCIForm.AddChannelToIssue;
begin
  if ((not mtChnlsAll.Active) or (mtChnlsAll.RecordCount = 0)) then
    Exit;
  if (not mtChnlsSel.Active) then
    mtChnlsSel.Active := True;

  mtChnlsSel.LoadFromDataSet(mtChnlsAll, 1, lmAppend, False);
  mtChnlsAll.Delete;
  dbgChlsSelected.SumList.RecalcAll;
end;

procedure TBCIForm.DelChannelFromIssue;
begin
  if ((not mtChnlsSel.Active) or (mtChnlsSel.RecordCount = 0)) then
    Exit;
  if (not mtChnlsAll.Active) then
    mtChnlsAll.Active := True;

  mtChnlsAll.LoadFromDataSet(mtChnlsSel, 1, lmAppend, False);
  mtChnlsSel.Delete;
  dbgChlsSelected.SumList.RecalcAll;
end;

procedure TBCIForm.FilterChannels;
var
  filter : String;
begin
  if (not(chkATV.Checked or chkDTV.Checked or chkIPTV.Checked or chkOTT.Checked)) then begin
    mtChnlsAll.Filtered := False;
    exit;
  end;

  if (chkATV.Checked) then
    filter := ' (IS_ANALOG = 1) ';

  if (chkDTV.Checked) then begin
    if not filter.IsEmpty then
      filter := filter + ' or ';

    filter := filter + ' (IS_DIGIT = 1) ';
  end;

  if (chkIPTV.Checked or chkOTT.Checked) then begin
    if not filter.IsEmpty then
      filter := filter + ' or ';

    filter := filter + ' (IS_IPTV = 1) ';
  end;

  if not filter.IsEmpty then begin
    mtChnlsAll.Filter := filter;
    mtChnlsAll.Filtered := True;
  end;
end;

end.
