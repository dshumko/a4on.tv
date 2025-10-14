unit NewTaskForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.ActnList,
  Vcl.Buttons,
  OkCancel_frame, FIBDataSet, pFIBDataSet, DBGridEh, DBCtrlsEh, DBLookupEh, FIBQuery, pFIBQuery, DM,
  CnErrorProvider, PrjConst, A4onTypeUnit, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, MemTableDataEh,
  MemTableEh, EhLibVCL, GridsEh, DBAxisGridsEh, PropFilerEh, PropStorageEh, Main;

type
  TNewTaskForm = class(TForm)
    pnlRecourse: TPanel;
    CnErrors: TCnErrorProvider;
    edtTitle: TDBEditEh;
    edtDate: TDBDateTimeEditEh;
    mmoNotice: TDBMemoEh;
    dbgUsers: TDBGridEh;
    mtbUsers: TMemTableEh;
    srcUsers: TDataSource;
    pnl1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    PropStorageEh: TPropStorageEh;
    cbClose: TDBComboBoxEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSaveExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FID: String;
    FType: String;
    FTaskId: Integer;
    FCallBackNew: TTaskCreateCallBack;
    FEnterSecondPress: Boolean;
    procedure SaveTask();
    procedure SetID(const Value: String);
    procedure SetType(const Value: String);
    procedure SetCaption;
    procedure GetUsers;
  public
    property ObjectID: String read FID write SetID;
    property ObjectType: String read FID write SetType;
    property CallBackNew: TTaskCreateCallBack write FCallBackNew;
    property TaskID: Integer read FTaskId;
  end;

procedure NewTask(const Object_Type: string; const Object_ID: string; CallBackVar: TTaskCreateCallBack = nil);

implementation

{$R *.dfm}

procedure NewTask(const Object_Type: string; const Object_ID: string; CallBackVar: TTaskCreateCallBack = nil);
begin
  with TNewTaskForm.Create(Application) do
  begin
    ObjectID := Object_ID;
    ObjectType := Object_Type;
    CallBackNew := CallBackVar;
    Show;
  end;
end;

procedure TNewTaskForm.SetID(const Value: String);
begin
  FID := Value;
  SetCaption;
end;

procedure TNewTaskForm.SetType(const Value: String);
begin
  FType := Value;
  SetCaption;
end;

procedure TNewTaskForm.SetCaption;
begin
  if FType = 'A' then
    Caption := 'Абонента'
  else if FType = 'R' then
    Caption := 'Заявку'
  else if FType = 'P' then
    Caption := 'Платеж'
  else if FType = 'N' then
    Caption := 'Узел'
  else
    Caption := 'непонятка';

  Caption := 'Новая задача на ' + Caption + ' ' + FID;
end;

procedure TNewTaskForm.actSaveExecute(Sender: TObject);
begin
  SaveTask();
end;

procedure TNewTaskForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // NewTaskForm:=nil;
  Action := caFree;
end;

procedure TNewTaskForm.FormCreate(Sender: TObject);
begin
  FTaskId := -1;
end;

procedure TNewTaskForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    SaveTask();
end;

procedure TNewTaskForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    else if (ActiveControl is TDBComboBoxEh) then
      go := not(ActiveControl as TDBComboBoxEh).ListVisible
    else if (ActiveControl is TDBGridEh) then
      go := False	  
	//else if (ActiveControl is TDBSynEdit) and not(Trim((ActiveControl as TDBSynEdit).Lines.Text) = '') then
    //  go := False;
    //else if (ActiveControl is TDBAxisGridInplaceEdit) then
    //  go := False
    else
    begin
      if (ActiveControl is TDBMemoEh) and (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
      begin
        go := False;
        FEnterSecondPress := true;
      end;
    end;

    if go then
    begin
      FEnterSecondPress := False;
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end
  else
  begin
    if (ActiveControl is TDBMemoEh) then
      FEnterSecondPress := False;
  end;
end;

procedure TNewTaskForm.FormShow(Sender: TObject);
begin
  GetUsers;
end;

procedure TNewTaskForm.GetUsers;
begin
  mtbUsers.Open;
  mtbUsers.DisableControls;
  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Text := 'select w.Surname || coalesce('' ''||w.Firstname, '''') FIO , w.Ibname ' +
        'from worker w where not (w.Ibname is null) and (w.Working = 1) order by 1';
      Transaction.StartTransaction;
      ExecQuery;
      while not Eof do
      begin
        mtbUsers.Append;
        mtbUsers['FIO'] := FN('FIO').AsString;
        mtbUsers['Ibname'] := FN('Ibname').AsString;
        mtbUsers['IN_TASK'] := False;
        mtbUsers.Post;
        Next;
      end;
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
  mtbUsers.EnableControls;
end;

procedure TNewTaskForm.SaveTask();
var
  allOk: boolean;
  dt: TDateTime;

  function GetUsers: String;
  var
    i: Integer;
  begin
    Result := '';
    mtbUsers.DisableControls;
    for i := 0 to dbgUsers.SelectedRows.Count - 1 do
    begin
      mtbUsers.Bookmark := dbgUsers.SelectedRows[i];
      Result := Result + mtbUsers['IBNAME'] + ',';
    end;
    Result := Result.TrimRight([',']);
  end;

begin
  allOk := True;

  if not TryStrToDateTime(edtDate.Text, dt) then
  begin
    allOk := False;
    CnErrors.SetError(edtDate, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
    edtDate.SetFocus;
  end
  else
    CnErrors.Dispose(edtDate);

  if edtTitle.Text.IsEmpty then
  begin
    allOk := False;
    CnErrors.SetError(edtTitle, rsInputIncorrect, iaMiddleLeft, bsNeverBlink);
    edtTitle.SetFocus;
  end
  else
    CnErrors.Dispose(edtTitle);

  if not allOk then
    Exit;

  with TpFIBQuery.Create(Nil) do
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Add('execute block (                                                                     ');
      SQL.Add('    TITLE     D_VARCHAR100 = :TITLE,                                                ');
      SQL.Add('    NOTICE    D_VARCHAR500 = :NOTICE,                                               ');
      SQL.Add('    PLAN_DATE D_DATETIME = :PLAN_DATE,                                              ');
      SQL.Add('    USERS     D_VARCHAR500 = :USERS,                                                ');
      SQL.Add('    OBJ_TYPE  D_VARCHAR5 = :OBJ_TYPE,                                               ');
      SQL.Add('    OBJ_ID    D_VARCHAR100 = :OBJ_ID,                                               ');
      SQL.Add('    WHO_CLOSE D_INTEGER = :WHO_CLOSE)                                               ');
      SQL.Add('RETURNS( TASK_ID d_integer )                                                        ');
      SQL.Add('as                                                                                  ');
      SQL.Add('declare variable Ibname  d_varchar20;                                               ');
      SQL.Add('begin                                                                               ');
      SQL.Add('  WHO_CLOSE = coalesce(WHO_CLOSE, 0);                                               ');
      SQL.Add('  insert into TASKLIST (TITLE, NOTICE, PLAN_DATE, DELETED, WHO_CAN)                 ');
      SQL.Add('  values (:TITLE, :NOTICE, :PLAN_DATE, 0, :WHO_CLOSE)                               ');
      SQL.Add('  returning ID into :TASK_ID;                                                       ');
      SQL.Add('  if ((OBJ_TYPE <> '''') and (OBJ_ID <> '''')) then begin                           ');
      SQL.Add('    insert into TASKMSG (TASK_ID, TEXT, OBJ_TYPE, OBJ_ID)                           ');
      SQL.Add('    values (:TASK_ID, :NOTICE, :OBJ_TYPE, :OBJ_ID);                                 ');
      SQL.Add('  end                                                                               ');
      SQL.Add('  for select substring(Str from 1 for 100) from Explode('','', :USERS) into :Ibname ');
      SQL.Add('  do begin                                                                          ');
      SQL.Add('    insert into Taskuser (Task_Id, Foruser)                                         ');
      SQL.Add('    values (:Task_Id, :Ibname);                                                     ');
      SQL.Add('  end                                                                               ');
      SQL.Add('  suspend;                                                                          ');
      SQL.Add('end                                                                                 ');
      ParamByName('TITLE').AsString := edtTitle.Text;
      ParamByName('NOTICE').AsString := mmoNotice.Lines.Text;
      ParamByName('PLAN_DATE').AsDateTime := edtDate.Value;
      ParamByName('USERS').AsString := GetUsers;
      ParamByName('OBJ_TYPE').AsString := FType;
      ParamByName('OBJ_ID').AsString := FID;
      if (not cbClose.Text.IsEmpty) then begin
        ParamByName('WHO_CLOSE').AsInteger := cbClose.Value;
      end;
      Transaction.StartTransaction;
      ExecQuery;
      FTaskId := FN('TASK_ID').AsInteger;
      Transaction.Commit;
      Close;
      allOk := True;
    finally
      Free;
    end;

  if allOk then
  begin
    if Assigned(FCallBackNew) then
      FCallBackNew(FTaskId);
    Close;
  end;
end;

procedure TNewTaskForm.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TNewTaskForm.btnOkClick(Sender: TObject);
begin
  SaveTask();
end;

end.
