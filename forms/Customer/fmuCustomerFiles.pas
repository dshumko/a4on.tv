unit fmuCustomerFiles;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ActnList,
  AtrPages, ToolCtrlsEh, GridsEh, DBGridEh, FIBDataSet, pFIBDataSet, DBGridEhToolCtrls, DBAxisGridsEh, PrjConst,
  EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, A4onTypeUnit,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TapgCustomerFiles = class(TA4onPage)
    dsCustFiles: TpFIBDataSet;
    srcCustFiles: TDataSource;
    dbgCustFiles: TDBGridEh;
    ActListCustomers: TActionList;
    actAdd: TAction;
    actEdit: TAction;
    actDel: TAction;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    qRead: TpFIBQuery;
    actView: TAction;
    qReqFile: TpFIBQuery;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    btnOpen: TSpeedButton;
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDelExecute(Sender: TObject);
    procedure dbgCustFilesDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure dbgCustFilesCellClick(Column: TColumnEh);
    procedure dbgCustFilesGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure srcCustFilesStateChange(Sender: TObject);
    procedure dsCustFilesAfterRefresh(DataSet: TDataSet);
    procedure dsCustFilesAfterOpen(DataSet: TDataSet);
  private
    FClickOnAct: Boolean;
    FFullAccess: Boolean;
    FCanAdd: Boolean;
    FCanEdit: Boolean;
    procedure EnableControls;
    procedure SetCustomerInfo(var ci: TCustomerInfo);
    procedure ViewRequest(const aRequest: Integer);
    function FindRequestAndOpen(const txt: String): Boolean;
  public
    procedure InitForm; override;
    procedure OpenData; override;
    procedure CloseData; override;
    class function GetPageName: string; override;
  end;

implementation

{$R *.dfm}

uses
  Winapi.ShellAPI, AtrStrUtils, AtrCommon,
  MAIN, DM, EditAttributeForma, EditCFileForma, TextEditForma, RequestForma;

class function TapgCustomerFiles.GetPageName: string;
begin
  Result := rsClmnFiles;
end;

procedure TapgCustomerFiles.InitForm;
begin
  FFullAccess := (dmMain.AllowedAction(rght_Customer_full));
  FCanAdd := (dmMain.AllowedAction(rght_Customer_Files_Add));
  FCanEdit := (dmMain.AllowedAction(rght_Customer_Files_Edit));

  actAdd.Visible := FFullAccess or (FCanAdd);
  actDel.Visible := FFullAccess or (FCanEdit);
  actEdit.Visible := FFullAccess or (FCanEdit);

  dsCustFiles.DataSource := FDataSource;
end;

procedure TapgCustomerFiles.EnableControls;
begin
  actEdit.Enabled := dsCustFiles.RecordCount > 0;
  actDel.Enabled := dsCustFiles.RecordCount > 0;
end;

procedure TapgCustomerFiles.OpenData;
begin
  if dsCustFiles.Active then
    dsCustFiles.Close;
  dsCustFiles.OrderClause := GetOrderClause(dbgCustFiles);
  dsCustFiles.Open;
end;

procedure TapgCustomerFiles.actAddExecute(Sender: TObject);
var
  ci: TCustomerInfo;
begin
  if not(FFullAccess or FCanAdd) then
    exit;

  SetCustomerInfo(ci);

  if EditFile(ci, '') then
  begin
    // dsCustFiles.Post;
    dsCustFiles.CloseOpen(true);
    UpdatePage;
  end
end;

procedure TapgCustomerFiles.actDelExecute(Sender: TObject);
begin
  if not(FFullAccess or FCanEdit) then
    exit;

  if ((not dsCustFiles.Active) or (dsCustFiles.RecordCount = 0)) then
    exit;

  if (dsCustFiles['isReq'] = 1) then
    exit;

  if (not srcCustFiles.DataSet.FieldByName('NAME').IsNull) then
  begin
    if (MessageDlg(Format(rsDeleteWithName, [srcCustFiles.DataSet['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then
    begin
      srcCustFiles.DataSet.Delete;
      EnableControls;
      UpdatePage;
    end;
  end;
end;

procedure TapgCustomerFiles.actEditExecute(Sender: TObject);
var
  ci: TCustomerInfo;
begin
  if ((not dsCustFiles.Active) or (dsCustFiles.RecordCount = 0)) then
    exit;
  if (dsCustFiles.FieldByName('NAME').IsNull) or (dsCustFiles.FieldByName('CF_ID').IsNull) or
    (FDataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull) then
    exit;

  if (dsCustFiles['isReq'] = 0) then
  begin
    if not((dmMain.AllowedAction(rght_Customer_full)) or (dmMain.AllowedAction(rght_Customer_Files_Edit))) then
      exit;

    SetCustomerInfo(ci);

    if EditFile(ci, dsCustFiles['NAME'], dsCustFiles['CF_ID']) then
    begin
      // dsCustFiles.Post;
      dsCustFiles.Refresh;
      UpdatePage;
    end
  end
  else
  begin
    if not dsCustFiles.FieldByName('RQ_ID').IsNull then
      ViewRequest(dsCustFiles.FieldByName('RQ_ID').AsInteger);
  end;
end;

procedure TapgCustomerFiles.CloseData;
begin
  dsCustFiles.Close;
end;

procedure TapgCustomerFiles.dbgCustFilesCellClick(Column: TColumnEh);
begin
  FClickOnAct := (Column.FieldName = 'ACT');
end;

procedure TapgCustomerFiles.dbgCustFilesDblClick(Sender: TObject);
var
  ScrPt, GrdPt: TPoint;
  Cell: TGridCoord;
  txt: String;
  Processed: Boolean;
begin
  if ((not dsCustFiles.Active) or (dsCustFiles.RecordCount = 0)) then
    exit;

  Processed := False;
  ScrPt := Mouse.CursorPos;
  GrdPt := dbgCustFiles.ScreenToClient(ScrPt);
  Cell := dbgCustFiles.MouseCoord(GrdPt.X, GrdPt.Y);
  txt := UpperCase(dbgCustFiles.Fields[Cell.X - 1].FieldName);

  if (txt = 'O_NAME') and (not dsCustFiles.FieldByName('O_NAME').IsNull) then
  begin
    txt := dsCustFiles['O_NAME'];
    txt := txt.ToUpper;
    if txt.Contains('ЗАЯВКА') then
      Processed := FindRequestAndOpen(txt)
    else if (not dsCustFiles.FieldByName('NOTICE').IsNull) then
    begin
      txt := dsCustFiles['NOTICE'];
      txt := txt.ToUpper;
      if txt.Contains('ЗАЯВКА') then
        Processed := FindRequestAndOpen(txt);
    end;
  end;

  if Processed then
    exit;

  // если отметка обработан стоит, то откроем на просмотр
  if (FClickOnAct and (not dsCustFiles.FieldByName('Act').IsNull) and (dsCustFiles['ACT'])) then
    FClickOnAct := False;

  // это заявка
  if (FClickOnAct and dsCustFiles['isReq'] = 1) then
    FClickOnAct := False;

  if (((dmMain.AllowedAction(rght_Customer_full)) or (dmMain.AllowedAction(rght_Customer_Files_Edit))) and FClickOnAct)
  then
  begin
    txt := '';
    if EditText(txt, Format(rsFileAct, [dsCustFiles['Name']]), rsFileActNotice) then
    begin
      dsCustFiles.Edit;
      dsCustFiles['Anotice'] := txt;
      dsCustFiles['Act'] := 1;
      dsCustFiles.Post;
      // dsCustFiles.Refresh;
    end;
  end
  else
    actViewExecute(Sender);

end;

procedure TapgCustomerFiles.dbgCustFilesGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if not dsCustFiles.FieldByName('O_DIMENSION').IsNull then
    try
      Background := StringToColor(dsCustFiles.FieldByName('O_DIMENSION').Value);
    except
    end;
end;

procedure TapgCustomerFiles.dsCustFilesAfterOpen(DataSet: TDataSet);
begin
  EnableControls;
end;

procedure TapgCustomerFiles.dsCustFilesAfterRefresh(DataSet: TDataSet);
begin
  EnableControls;
end;

procedure TapgCustomerFiles.actViewExecute(Sender: TObject);
var
  fileName, ext: string;
begin
  if dbgCustFiles.DataSource.DataSet.RecordCount = 0 then
    exit;

  ext := ExtractFileExt(dsCustFiles['FILENAME']);
  fileName := GetTempA4onFile(ext);
  if not DirectoryExists(fileName) then
    CreateDir(fileName);
  fileName := fileName + dsCustFiles['FILENAME'];

  if fileName.IsEmpty then Exit;

  if FileExists(fileName) then
    DeleteFile(fileName);

  if (dsCustFiles['isReq'] = 0) then
  begin
    qRead.ParamByName('CF_ID').AsInteger := dsCustFiles['CF_ID'];
    qRead.Transaction.StartTransaction;
    qRead.ExecQuery;
    qRead.FieldByName('content').SaveToFile(fileName);
    qRead.Close;
    qRead.Transaction.Rollback;
  end
  else
  begin
    qReqFile.ParamByName('CF_ID').AsInteger := dsCustFiles['CF_ID'];
    qReqFile.Transaction.StartTransaction;
    qReqFile.ExecQuery;
    qReqFile.FieldByName('jpg').SaveToFile(fileName);
    qReqFile.Close;
    qReqFile.Transaction.Rollback;
  end;

  if FileExists(fileName) then begin
    ShellExecute(Handle, 'open', PWideChar(fileName), nil, nil, SW_SHOWNORMAL);
    // DeleteFile(fileName);
  end;
end;

procedure TapgCustomerFiles.SetCustomerInfo(var ci: TCustomerInfo);
begin
  with ci do
  begin
    if not FDataSource.DataSet.FieldByName('CUSTOMER_ID').IsNull then
      CUSTOMER_ID := FDataSource.DataSet['CUSTOMER_ID']
    else
      CUSTOMER_ID := -1;
    if not FDataSource.DataSet.FieldByName('cust_code').IsNull then
      cust_code := FDataSource.DataSet['cust_code'];
    if not FDataSource.DataSet.FieldByName('Account_No').IsNull then
      Account_No := FDataSource.DataSet['Account_No'];
    if not FDataSource.DataSet.FieldByName('CUST_STATE_DESCR').IsNull then
      CUST_STATE_DESCR := FDataSource.DataSet['CUST_STATE_DESCR'];
    if not FDataSource.DataSet.FieldByName('Debt_sum').IsNull then
    begin
      if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
        Debt_sum := -1 * FDataSource.DataSet['Debt_sum']
      else
        Debt_sum := FDataSource.DataSet['Debt_sum'];
    end;
    if not FDataSource.DataSet.FieldByName('SURNAME').IsNull then
      FIO := FDataSource.DataSet['SURNAME'];
    if not FDataSource.DataSet.FieldByName('FIRSTNAME').IsNull then
      FIO := trim(FIO + ' ' + FDataSource.DataSet['FIRSTNAME']);
    if not FDataSource.DataSet.FieldByName('MIDLENAME').IsNull then
      FIO := trim(FIO + ' ' + FDataSource.DataSet['MIDLENAME']);
    if not FDataSource.DataSet.FieldByName('street_ID').IsNull then
      STREET_ID := FDataSource.DataSet['street_ID'];
    if not FDataSource.DataSet.FieldByName('STREET_NAME').IsNull then
      STREET := FDataSource.DataSet['STREET_NAME'];
    if not FDataSource.DataSet.FieldByName('HOUSE_ID').IsNull then
      HOUSE_ID := FDataSource.DataSet['HOUSE_ID'];
    if not FDataSource.DataSet.FieldByName('House_No').IsNull then
      HOUSE_no := FDataSource.DataSet['House_No'];
    if not FDataSource.DataSet.FieldByName('FLAT_No').IsNull then
      FLAT_NO := FDataSource.DataSet['FLAT_No'];
    if not FDataSource.DataSet.FieldByName('notice').IsNull then
      notice := FDataSource.DataSet['notice'];
    isType := 0
  end;
end;

procedure TapgCustomerFiles.srcCustFilesStateChange(Sender: TObject);
begin
  EnableControls;
end;

procedure TapgCustomerFiles.ViewRequest(const aRequest: Integer);
var
  aCustomer: Integer;
  aMode: Byte;
  aNodeId: Integer;
  CE: Boolean;
  CC: Boolean;
  CG: Boolean;
  // CA: Boolean;
  FullAccess: Boolean;
Begin
  if aRequest = -1 then
    exit;

  FullAccess := dmMain.AllowedAction(rght_Request_full); // (50, 'ПОЛНЫЙ ДОСТУП', 'ЗАЯВКИ', 'Полный доступ');
  // CA := dmMain.AllowedAction(rght_Request_add); // (51, 'ДОБАВЛЕНИЕ', 'ЗАЯВКИ', 'Добавление заявок');
  CE := dmMain.AllowedAction(rght_Request_edit); // (52, 'РЕДАКТИРОВАНИЕ', 'ЗАЯВКИ', 'Редактирование заявки');
  CC := dmMain.AllowedAction(rght_Request_Close); // (54, 'ЗАКРЫТИЕ', 'ЗАЯВКИ', 'Закрытие заявки');
  CG := dmMain.AllowedAction(rght_Request_Give); // (53, 'ВЫДАЧА', 'ЗАЯВКИ', 'Выдача заявок в работу');

  if not(FullAccess or CE or CC or CG) then
    exit;

  aMode := 1;

  aNodeId := -1;
  aCustomer := -1;
  if dsCustFiles.FieldByName('Customer_Id').IsNull then
  begin
    if not dsCustFiles.FieldByName('NODE_ID').IsNull then
      aNodeId := dsCustFiles.FieldByName('NODE_ID').AsInteger
    else
    begin
      if not dsCustFiles.FieldByName('CUSTOMER_ID').IsNull then
        aCustomer := dsCustFiles.FieldByName('CUSTOMER_ID').AsInteger;
    end;
  end
  else
  begin
    aCustomer := dsCustFiles.FieldByName('CUSTOMER_ID').AsInteger;
  end;

  if aNodeId = -1 then
    ReguestExecute(aRequest, aCustomer, aMode)
  else
    ReguestNodeExecute(aRequest, aNodeId, aMode);
end;

function TapgCustomerFiles.FindRequestAndOpen(const txt: String): Boolean;
var
  i: Integer;
  s: string;
begin
  s := txt.ToUpper;
  Result := (s.Contains('ЗАЯВКА'));
  if Result then
  begin
    i := Pos('ЗАЯВКА', s);
    s := Copy(s, i + 6, 11);
    i := Pos('.', UpperCase(s));
    if i > 0 then
      s := Copy(s, 1, i);
    s := DigitsOnly(s);
    if TryStrToInt(s, i) then
      ViewRequest(i)
    else
      Result := False;
  end;
end;

end.
