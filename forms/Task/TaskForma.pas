unit TaskForma;

{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ActnList, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Mask,
  GridForma, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, CnErrorProvider, EhLibVCL, GridsEh,
  DBAxisGridsEh,
  DBGridEh, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, DBCtrlsEh, MemTableDataEh, MemTableEh;

type
  TTaskForm = class(TGridForm)
    dsTask: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    pgcMSG: TPageControl;
    tsGrid: TTabSheet;
    tsEdit: TTabSheet;
    dbgMsg: TDBGridEh;
    dsMSG: TpFIBDataSet;
    srcMSG: TDataSource;
    pnlButtons: TPanel;
    btnDel1: TSpeedButton;
    btnAdd1: TSpeedButton;
    btnEdit1: TSpeedButton;
    dlgColor: TColorDialog;
    edtTITLE: TDBEditEh;
    mmoNOTICE: TDBMemoEh;
    edtPLAN_DATE: TDBDateTimeEditEh;
    edtEXEC_DATE: TDBDateTimeEditEh;
    btnColor: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    Label1: TLabel;
    btnClearColor: TButton;
    mmoTEXT: TDBMemoEh;
    cbbOBJ_TYPE: TDBComboBoxEh;
    edtOBJ_ID: TDBEditEh;
    btnGoObject: TSpeedButton;
    dbgUsers: TDBGridEh;
    dsUsers: TpFIBDataSet;
    srcUsers: TDataSource;
    mtbUsers: TMemTableEh;
    actRefresh: TAction;
    btnRefresh: TToolButton;
    dsFilter: TMemTableEh;
    actFilter: TAction;
    btnFilter: TToolButton;
    actDelMessage: TAction;
    btn1: TToolButton;
    btn2: TToolButton;
    btnOpenAll: TSpeedButton;
    btnOk: TBitBtn;
    btnMsgCncl: TBitBtn;
    actMsgSave: TAction;
    actMsgCancel: TAction;
    actClose: TAction;
    btnClose: TToolButton;
    btnSPclose: TToolButton;
    pmOpenObjects: TPopupMenu;
    actOpenCustAddr: TAction;
    miOpenCustAddr: TMenuItem;
    procedure dbGridRowDetailPanelShow(Sender: TCustomDBGridEh; var CanShow: Boolean);
    procedure dbGridRowDetailPanelHide(Sender: TCustomDBGridEh; var CanHide: Boolean);
    procedure FormShow(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure btnColorClick(Sender: TObject);
    procedure btnClearColorClick(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure btnEdit1Click(Sender: TObject);
    procedure btnAdd1Click(Sender: TObject);
    procedure btnGoObjectClick(Sender: TObject);
    procedure dbgMsgDblClick(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsTaskNewRecord(DataSet: TDataSet);
    procedure dbgMsgColumns1CellDataLinkClick(Grid: TCustomDBGridEh; Column: TColumnEh);
    procedure actRefreshExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure dsFilterNewRecord(DataSet: TDataSet);
    procedure actDelMessageExecute(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnOpenAllClick(Sender: TObject);
    procedure actMsgCancelExecute(Sender: TObject);
    procedure actMsgSaveExecute(Sender: TObject);
    procedure dbgUsersKeyPress(Sender: TObject; var Key: Char);
    procedure actCloseExecute(Sender: TObject);
    procedure srcDataSourceDataChange(Sender: TObject; Field: TField);
    procedure actOpenCustAddrExecute(Sender: TObject);
  private
    FclOverdue: TColor;
    FclSoon: TColor;
    FCanClose: Boolean;
    procedure EditMSG();
    procedure DeleteMSG();
    procedure EditTask();
    procedure NewTask();
    procedure NewMSG();
    procedure CancelEditMsg();
    procedure SaveUsers;
    procedure GetUsers;
    procedure SetUsers(const new: Boolean = False);
    procedure GoObject;
    procedure GoCustomers;
    function GetAccountFromObj(const oType: string; const oId: String): String;
    function GenerateFilter: string;
    procedure SetDefaultFilter;
    procedure CloseSelectedAsCurrent;
  public
    procedure FindId(const Value: integer);
  end;

var
  TaskForm: TTaskForm;

procedure FindTask(const Value: integer);

implementation

{$R *.dfm}

uses
  PrjConst, DM, pFIBQuery, MAIN, TaskFilterForma, AtrCommon, SelDateForma;

procedure FindTask(const Value: integer);
begin
  if Not Assigned(TaskForm) then
    TaskForm := TTaskForm.Create(Application);

  TaskForm.Show;
  TaskForm.FindId(Value);
end;

procedure TTaskForm.actCloseExecute(Sender: TObject);
var
  cd: TDate;
  fq: TpFIBQuery;
  id: integer;
begin
  inherited;
  if (dsTask.RecordCount = 0) or (dsTask.FieldByNAme('ID').IsNull) then
    Exit;

  cd := Now();
  if SelectDate(cd, rsCloseTask) then
  begin
    id := dsTask['ID'];
    fq := TpFIBQuery.Create(Self);
    try
      fq.Database := dmMain.dbTV;
      fq.Transaction := dmMain.trWriteQ;
      fq.sql.Text := 'UPDATE TASKLIST SET  EXEC_DATE = :EXEC_DATE WHERE ID = :OLD_ID';
      fq.ParamByName('OLD_ID').AsInteger := id;
      fq.ParamByName('EXEC_DATE').AsDate := cd;
      fq.Transaction.StartTransaction;
      fq.ExecQuery;
      fq.Transaction.Commit;
      fq.Close;
    finally
      fq.Free;
    end;
    dsTask.DisableControls;
    dsTask.CloseOpen(True);
    dsTask.Locate('ID', id, []);
    dsTask.EnableControls;
  end;
end;

procedure TTaskForm.actDeleteExecute(Sender: TObject);
begin
  inherited;
  if srcDataSource.DataSet.RecordCount = 0 then
    Exit;

  if srcDataSource.DataSet['ADDED_BY'] = dmMain.User then
    if (MessageDlg(Format(rsDeleteWithName, [srcDataSource.DataSet['TITLE']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then
      srcDataSource.DataSet.Delete;
end;

procedure TTaskForm.actDelMessageExecute(Sender: TObject);
begin
  inherited;
  DeleteMSG();
end;

procedure TTaskForm.actEditExecute(Sender: TObject);
begin
  inherited;
  if ((ActiveControl.Name = 'dbgMsg') or (dsMSG.DataSource.State in [dsEdit, dsInsert])) then
    EditMSG()
  else
    EditTask();
end;

procedure TTaskForm.actFilterExecute(Sender: TObject);
var
  cr: TCursor;

begin
  TaskFilterForm := TTaskFilterForm.Create(Application);
  cr := Screen.Cursor;
  try
    if not dsFilter.Active then
      SetDefaultFilter;

    if dsFilter.RecordCount = 0 then
    begin
      dsFilter.Insert;
    end;

    if TaskFilterForm.ShowModal = mrOk then
    begin
      Screen.Cursor := crHourGlass;
      dsTask.Close;
      dsTask.ParamByName('Filter').Value := GenerateFilter;
      dsTask.Open;
    end;

  finally
    TaskFilterForm.Free;
    TaskFilterForm := nil;
    Screen.Cursor := cr;
  end;
end;

procedure TTaskForm.actMsgCancelExecute(Sender: TObject);
begin
  inherited;
  CancelEditMsg();
end;

procedure TTaskForm.actMsgSaveExecute(Sender: TObject);
begin
  inherited;
  if dsMSG.State in [dsEdit, dsInsert] then
    dsMSG.Post;
  pgcMSG.ActivePage := tsGrid;
  dsTask.Refresh;
  dbgMsg.SetFocus;
end;

procedure TTaskForm.actNewExecute(Sender: TObject);
begin
  inherited;
  if not Assigned(ActiveControl) then
    NewTask()
  else
  begin
    if (ActiveControl.Name = 'dbgMsg') then
      NewMSG()
    else
      NewTask();
  end;
end;

procedure TTaskForm.actOpenCustAddrExecute(Sender: TObject);
var
  ObjList: TStringList;
  s: string;
  fq: TpFIBQuery;
begin
  inherited;
  if (dsTask.RecordCount = 0) or (dsMSG.RecordCount = 0) then
    Exit;

  dsMSG.DisableControls;
  dsMSG.First;
  ObjList := TStringList.Create;
  try
    ObjList.Sorted := True;
    ObjList.Duplicates := dupIgnore;
    fq := TpFIBQuery.Create(Self);
    try
      fq.Database := dmMain.dbTV;
      fq.Transaction := dmMain.trReadQ;
      fq.sql.Text := 'select Cust_Code from customer where Account_No = :Obj_Id';
      while not dsMSG.Eof do
      begin
        if (not dsMSG.FieldByNAme('OBJ_TYPE').IsNull) and (dsMSG['OBJ_TYPE'] = 'A') and
          (not dsMSG.FieldByNAme('OBJ_ID').IsNull) then
        begin

          fq.ParamByName('OBJ_ID').AsString := dsMSG['OBJ_ID'];
          fq.Transaction.StartTransaction;
          fq.ExecQuery;
          if not fq.FN('Cust_Code').IsNull then
            ObjList.Add(fq.FN('Cust_Code').AsString);

          fq.Transaction.Commit;
          fq.Close;
        end;
        dsMSG.Next;
      end;

    finally
      fq.Free;
    end;
    if (ObjList.Count > 0) then
      s := ObjList.CommaText
    else
      s := '';

  finally
    FreeAndNil(ObjList);
  end;
  dsMSG.First;
  dsMSG.EnableControls;

  if (s <> '') then
    A4MainForm.SearchFromTask('ALL_CUST_ADDR', s);
end;

procedure TTaskForm.actRefreshExecute(Sender: TObject);
var
  i: integer;
begin
  inherited;

  if dsTask.RecordCount > 0 then
    i := dsTask['ID']
  else
    i := -1;

  dsTask.CloseOpen(True);

  if i > 0 then
    dsTask.Locate('ID', i, []);
end;

procedure TTaskForm.btn1Click(Sender: TObject);
begin
  inherited;
  A4MainForm.ClearAlert();
end;

procedure TTaskForm.btnAdd1Click(Sender: TObject);
begin
  inherited;
  NewMSG();
end;

procedure TTaskForm.btnClearColorClick(Sender: TObject);
begin
  inherited;
  dsTask.FieldByNAme('COLOR').Clear;
  pnlEdit.COLOR := clBtnFace;
end;

procedure TTaskForm.btnColorClick(Sender: TObject);
begin
  inherited;
  if dlgColor.Execute then
  begin
    dsTask['COLOR'] := ColorToString(dlgColor.COLOR);
    pnlEdit.COLOR := dlgColor.COLOR;
  end;
end;

procedure TTaskForm.btnEdit1Click(Sender: TObject);
begin
  inherited;
  EditMSG();
end;

procedure TTaskForm.btnGoObjectClick(Sender: TObject);
begin
  inherited;
  GoObject;
end;

procedure TTaskForm.btnOpenAllClick(Sender: TObject);
begin
  inherited;
  GoCustomers;
end;

procedure TTaskForm.btnSaveLinkClick(Sender: TObject);
var
  errors: Boolean;
begin
  errors := False;

  if (edtTITLE.Text = '') then
  begin
    errors := True;
    CnErrors.SetError(edtTITLE, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else
    CnErrors.Dispose(edtTITLE);

  if not errors then
  begin
    inherited;
    SaveUsers;
    if (dbGrid.SelectedRows.Count > 0) then
      CloseSelectedAsCurrent
    else
      dsTask.Refresh;
  end;
end;

procedure TTaskForm.dbgMsgColumns1CellDataLinkClick(Grid: TCustomDBGridEh; Column: TColumnEh);
begin
  inherited;
  GoObject;
end;

procedure TTaskForm.dbgMsgDblClick(Sender: TObject);
begin
  inherited;
  if (dsMSG.FieldByNAme('ID').IsNull) then
    NewMSG
  else
    EditMSG;
end;

procedure TTaskForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  bgColor: TColor;
  s: string;
begin
  inherited;
  if not dsTask.FieldByNAme('COLOR').IsNull then
  begin
    s := dsTask.FieldByNAme('COLOR').Value;
    if s <> '' then
    begin
      bgColor := StringToColor(s);
      Background := bgColor;
    end;
  end;

  if (not dsTask.FieldByNAme('EXEC_DATE').IsNull) and (dsTask['EXEC_DATE'] < Now()) then
    AFont.Style := AFont.Style + [fsStrikeOut]
  else
  begin
    AFont.Style := AFont.Style - [fsStrikeOut];
    if ((not dsTask.FieldByNAme('PLAN_DATE').IsNull) and (dsTask.FieldByNAme('EXEC_DATE').IsNull)) then
    begin
      if (dsTask.FieldByNAme('PLAN_DATE').AsDateTime < Now()) then
        Background := FclOverdue
      else if (dsTask.FieldByNAme('PLAN_DATE').AsDateTime > Date()) then
        Background := FclSoon
    end;
  end;

end;

procedure TTaskForm.dbGridRowDetailPanelHide(Sender: TCustomDBGridEh; var CanHide: Boolean);
begin
  inherited;
  CanHide := (pgcMSG.ActivePage <> tsEdit);

  if CanHide then
    dsMSG.Close;
end;

procedure TTaskForm.dbGridRowDetailPanelShow(Sender: TCustomDBGridEh; var CanShow: Boolean);
begin
  inherited;
  if dsMSG.Active then
    dsMSG.Close;
  if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
    dsMSG.ParamByName('sab').AsInteger := 1
  else
    dsMSG.ParamByName('sab').AsInteger := 0;
  dsMSG.Open;
end;

procedure TTaskForm.dbgUsersKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Ord(Key) = VK_SPACE) or (Ord(Key) = VK_RETURN) then
  begin
    if mtbUsers.RecordCount > 0 then
    begin
      mtbUsers.Edit;
      if mtbUsers.FieldByNAme('IN_TASK').IsNull then
        mtbUsers['IN_TASK'] := True
      else
        mtbUsers['IN_TASK'] := not mtbUsers['IN_TASK'];
      mtbUsers.Post;
    end;
  end;
end;

procedure TTaskForm.dsFilterNewRecord(DataSet: TDataSet);
begin
  inherited;
  DataSet['NotClosed'] := False;
  DataSet['INVERSION'] := False;
  DataSet['ALLUSERS'] := False;
end;

procedure TTaskForm.dsTaskNewRecord(DataSet: TDataSet);
begin
  inherited;
  dsTask['added_by'] := dmMain.User;
end;

procedure TTaskForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if dsMSG.Active then
    dsMSG.Close;
  if dsTask.Active then
    dsTask.Close;
  if mtbUsers.Active then
    mtbUsers.Close;
  TaskForm := nil;
end;

procedure TTaskForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Ord(Key) = VK_ESCAPE) and (dbGrid.RowDetailPanel.Visible) then
  begin
    if pgcMSG.ActivePage = tsEdit then
      actMsgCancel.Execute
    else
    begin
      dbGrid.RowDetailPanel.Visible := False;
      dbGrid.SetFocus;
    end;
  end
  else if (ssCtrl In Shift) And (Ord(Key) = VK_RETURN) and (dbGrid.RowDetailPanel.Visible) then
  begin
    if pgcMSG.ActivePage = tsEdit then
      actMsgSave.Execute;
  end
  else if (Self.ActiveControl = dbGrid) then
  begin
    if (Ord(Key) = VK_RETURN) then
      dbGrid.RowDetailPanel.Visible := not dbGrid.RowDetailPanel.Visible
  end;
  inherited;
end;

procedure TTaskForm.FormShow(Sender: TObject);
var
  i: integer;
  s: String;
begin
  inherited;
  if dsTask.Active then
    dsTask.Close;
  s := GetGridSortOrder(dbGrid);
  dsTask.OrderClause := s;
  SetDefaultFilter;
  dsTask.Open;
  s := GetGridSortOrder(dbgMsg);
  if dsMSG.Active then
    dsMSG.Close;
  dsMSG.OrderClause := s;

  for i := 0 to pgcMSG.PageCount - 1 do
    pgcMSG.Pages[i].TabVisible := False;

  pgcMSG.ActivePageIndex := 0;

  try
    FclOverdue := StringToColor(dmMain.GetSettingsValue('COLOR_DOLG'));
  except
    FclOverdue := clRed;
  end;
  try
    FclSoon := StringToColor(dmMain.GetSettingsValue('COLOR_OFFMONEY'));
  except
    FclSoon := clBlue;
  end;

  FCanClose := dmMain.AllowedAction(rght_Task_Close);
  btnSPclose.Visible := FCanClose;
  actClose.Visible := FCanClose;

  GetUsers;
end;

procedure TTaskForm.EditMSG();
begin
  if (dsTask.RecordCount = 0) or (dsMSG.RecordCount = 0) then
    Exit;
  if (dsTask.FieldByNAme('ID').IsNull) or (dsMSG.FieldByNAme('ID').IsNull) then
    Exit;
  if dmMain.User <> dsMSG['Added_By'] then
    Exit;

  pgcMSG.ActivePage := tsEdit;
  if (not(dsMSG.State in [dsEdit, dsInsert])) then
    dsMSG.Edit;
  mmoTEXT.SetFocus;
end;

procedure TTaskForm.NewTask();
begin
  FCanEdit := True;
  SetUsers(True);
  StartEdit(True);
end;

procedure TTaskForm.NewMSG();
begin
  if (dsTask.RecordCount = 0) then
    Exit;
  if dsTask.FieldByNAme('ID').IsNull then
    Exit;

  pgcMSG.ActivePage := tsEdit;
  dsMSG.Insert;
  dsMSG['TASK_ID'] := dsTask['ID'];
  mmoTEXT.SetFocus;
end;

procedure TTaskForm.EditTask();
begin
  if dsTask.FieldByNAme('ID').IsNull then
    Exit;

  if dsTask.FieldByNAme('ADDED_BY').IsNull then
    Exit;

  if (dsTask['ADDED_BY'] = dmMain.User) then
  begin
    FCanEdit := True;
    dsUsers.Open;
    if not dsTask.FieldByNAme('COLOR').IsNull then
      pnlEdit.COLOR := StringToColor(dsTask['COLOR'])
    else
      pnlEdit.COLOR := clBtnFace;

    SetUsers();
    StartEdit(False);
  end;
end;

procedure TTaskForm.CancelEditMsg();
begin
  dsMSG.Cancel;
  pgcMSG.ActivePage := tsGrid;
  dbgMsg.SetFocus;
end;

procedure TTaskForm.SaveUsers;
begin
  if mtbUsers.State in [dsEdit] then
    mtbUsers.Post;
  mtbUsers.DisableControls;
  mtbUsers.First;

  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      sql.Text := 'delete from Taskuser where Task_Id = :task_id';
      ParamByName('task_id').AsInteger := dsTask['ID'];
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
      sql.Text := 'insert into Taskuser (Task_Id, Foruser) values (:Task_Id, :Ibname)';
      while not mtbUsers.Eof do
      begin
        if (mtbUsers['in_task']) then
        begin
          ParamByName('task_id').AsInteger := dsTask['ID'];
          ParamByName('Ibname').AsString := mtbUsers['IBNAME'];
          Transaction.StartTransaction;
          ExecQuery;
          Transaction.Commit;
        end;
        mtbUsers.Next;
      end;
      mtbUsers.First;
    finally
      Free;
    end;
  end;
  mtbUsers.EnableControls;
  // dsUsers.Close;
end;

procedure TTaskForm.GetUsers;
begin
  mtbUsers.Open;
  mtbUsers.DisableControls;
  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      sql.Text := 'select w.Surname || coalesce('' ''||w.Firstname, '''') FIO , w.Ibname ' +
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
      mtbUsers.First;
    finally
      Free;
    end;
  end;
  mtbUsers.EnableControls;
end;

procedure TTaskForm.SetUsers(const new: Boolean = False);
begin
  mtbUsers.DisableControls;
  mtbUsers.First;
  while not mtbUsers.Eof do
  begin
    mtbUsers.Edit;
    mtbUsers['IN_TASK'] := False;
    mtbUsers.Post;
    mtbUsers.Next;
  end;

  if not new then
    with TpFIBQuery.Create(Nil) do
    begin
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        sql.Text := 'select Foruser from Taskuser where Task_Id = :Task_Id';
        ParamByName('task_id').AsInteger := dsTask['ID'];
        Transaction.StartTransaction;
        ExecQuery;
        while not Eof do
        begin
          if mtbUsers.Locate('IBNAME', FN('Foruser').AsString, []) then
          begin
            mtbUsers.Edit;
            mtbUsers['IN_TASK'] := True;
            mtbUsers.Post;
          end;
          Next;
        end;
        Close;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  mtbUsers.First;
  mtbUsers.EnableControls;
end;

procedure TTaskForm.srcDataSourceDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if FCanClose then
  begin
    if (dsTask.RecordCount > 0) then
      actClose.Enabled := (not dsTask.FieldByNAme('CANCLOSE').IsNull)
    else
      actClose.Enabled := False;
  end;
end;

procedure TTaskForm.GoObject;
begin
  inherited;
  if (dsTask.RecordCount = 0) or (dsMSG.RecordCount = 0) then
    Exit;
  if (dsMSG.FieldByNAme('OBJ_ID').IsNull) or (dsMSG.FieldByNAme('OBJ_TYPE').IsNull) then
    Exit;

  A4MainForm.SearchFromTask(dsMSG['OBJ_TYPE'], dsMSG['OBJ_ID']);
end;

procedure TTaskForm.GoCustomers;
var
  ObjList: TStringList;
  s: string;
  id: string;
begin
  inherited;
  if (dsTask.RecordCount = 0) or (dsMSG.RecordCount = 0) then
    Exit;

  dsMSG.DisableControls;
  dsMSG.First;
  ObjList := TStringList.Create;
  try
    ObjList.Sorted := True;
    ObjList.Duplicates := dupIgnore;

    while not dsMSG.Eof do
    begin
      if (not dsMSG.FieldByNAme('OBJ_TYPE').IsNull) and (not dsMSG.FieldByNAme('OBJ_ID').IsNull) then
      begin
        if (dsMSG['OBJ_TYPE'] = 'A') then
          ObjList.Add(dsMSG['OBJ_ID'])
        else
        begin
          id := GetAccountFromObj(dsMSG['OBJ_TYPE'], dsMSG['OBJ_ID']);
          if not id.IsEmpty then
            ObjList.Add(id)
        end;
      end;

      dsMSG.Next;
    end;

    if (ObjList.Count > 0) then
      s := ObjList.CommaText
    else
      s := '';

  finally
    FreeAndNil(ObjList);
  end;
  dsMSG.First;
  dsMSG.EnableControls;

  if (s <> '') then
    A4MainForm.SearchFromTask('ALL_CUST', s);
end;

procedure TTaskForm.DeleteMSG();
begin
  if (dsTask.RecordCount = 0) or (dsMSG.RecordCount = 0) then
    Exit;
  if dsMSG.FieldByNAme('ID').IsNull then
    Exit;
  if not dsTask.FieldByNAme('EXEC_DATE').IsNull then
    Exit;
  if (dmMain.User <> dsMSG['Added_By']) or (dmMain.User <> dsTask['Added_By']) then
    Exit;
  if dsMSG.FieldByNAme('TEXT').IsNull then
    dsMSG.Delete
  else
  begin
    if (MessageDlg(Format(rsDeleteRecord, [dsMSG.FieldByNAme('TEXT').AsString]), mtConfirmation, [mbYes, mbNo], 0)
      = mrYes) then
      dsMSG.Delete;
  end;
end;

function TTaskForm.GenerateFilter: string;
var
  RecordFtr: string;
  filter: TStrings;
  cr: integer;

  procedure addToFilter(const s: string);
  var
    clears: string;
  begin
    clears := StringReplace(s, ' ', '', [rfReplaceAll]);
    if clears <> '()' then
    begin
      if RecordFtr <> '' then
        RecordFtr := RecordFtr + ' and ' + s
      else
        RecordFtr := s;
    end;
  end;

  function RecordToFilter: String;
  var
    eperiod: String;
  begin
    Result := '';

    if (not dsFilter.FieldByNAme('TASK_ID').IsNull) then
      addToFilter(Format(' (t.ID = %d)', [dsFilter.FieldByNAme('TASK_ID').AsInteger]));

    if (dsFilter.FieldByNAme('ALLUSERS').IsNull) or (not dsFilter['ALLUSERS']) then
      addToFilter('((Added_By = current_user) or ' +
        '(exists(select tu.Foruser from Taskuser tu where tu.Task_Id = t.Id and (tu.Foruser = current_user or tu.Foruser = ''ALL'' ))))');

    if (not dsFilter.FieldByNAme('NotClosed').IsNull) and (dsFilter['NotClosed']) then
      addToFilter('t.EXEC_DATE is null');

    // Фильтр по исполнителю
    if (not dsFilter.FieldByNAme('WORKER').IsNull) then
      addToFilter
        (Format(' (exists(select tu.Foruser from Taskuser tu where tu.Task_Id = t.Id and tu.Foruser = ''%s''))',
        [dsFilter.FieldByNAme('WORKER').AsString]));

    eperiod := '';
    if (not dsFilter.FieldByNAme('EXEC_FROM').IsNull) then
      eperiod := Format('t.EXEC_DATE >= CAST(''%s'' AS DATE)', [FormatDateTime('yyyy-mm-dd', dsFilter['EXEC_FROM'])]);
    if (not dsFilter.FieldByNAme('EXEC_TO').IsNull) then
    begin
      if eperiod <> '' then
        eperiod := eperiod + ' and ';
      eperiod := eperiod + Format('t.EXEC_DATE < dateadd(DAY, 1, Cast(''%s'' as DATE))',
        [FormatDateTime('yyyy-mm-dd', dsFilter['EXEC_TO'])]);
    end;

    if eperiod <> '' then
      addToFilter(eperiod);

    eperiod := '';
    if (not dsFilter.FieldByNAme('PLAN_FROM').IsNull) then
      eperiod := Format('t.Plan_Date >= CAST(''%s'' AS DATE)', [FormatDateTime('yyyy-mm-dd', dsFilter['PLAN_FROM'])]);
    if (not dsFilter.FieldByNAme('PLAN_TO').IsNull) then
    begin
      if eperiod <> '' then
        eperiod := eperiod + ' and ';
      eperiod := eperiod + Format('t.Plan_Date < dateadd(DAY, 1, Cast(''%s'' as DATE))',
        [FormatDateTime('yyyy-mm-dd', dsFilter['PLAN_TO'])]);
    end;

    if (not dsFilter.FieldByNAme('OBJ_ID').IsNull) and (not dsFilter.FieldByNAme('OBJ_TYPE').IsNull) then
    begin
      addToFilter
        (Format(' (exists(select m.task_id from taskmsg m where m.obj_id = ''%s'' and m.obj_type = ''%s'' and m.task_id = t.id))',
        [dsFilter.FieldByNAme('OBJ_ID').AsString, dsFilter.FieldByNAme('OBJ_TYPE').AsString]));
    end;

    if (not dsFilter.FieldByNAme('NotClosed').IsNull) and (dsFilter['NotClosed']) then
      addToFilter('t.EXEC_DATE is null');

    if eperiod <> '' then
      addToFilter(eperiod);
  end;

begin
  Result := '';

  if (dsFilter.RecordCount = 0) then
    Exit;

  filter := TStringList.Create;
  try
    dsFilter.First;
    filter.Clear;
    cr := 0;
    while not dsFilter.Eof do
    begin
      RecordFtr := '';
      RecordToFilter;

      if dsFilter['inversion'] then
        RecordFtr := Format(' NOT ( %s ) ', [RecordFtr]);

      if cr <> 0 then
      begin
        if dsFilter['next_condition'] = 0 then
          RecordFtr := Format(' or ( %s )', [RecordFtr])
        else
          RecordFtr := Format(' and ( %s )', [RecordFtr]);
        filter.Add(RecordFtr);
      end
      else
        filter.Text := Format('( %s )', [RecordFtr]);
      inc(cr);
      dsFilter.Next;
    end;
    RecordFtr := filter.Text.Trim;
    if RecordFtr <> '(  )' then
      Result := Format(' and ( %s ) ', [filter.Text]);
  finally
    filter.Free;
  end;
end;

procedure TTaskForm.SetDefaultFilter;
var
  f: string;
begin
  dsFilter.Close;
  dsFilter.Open;
  dsFilter.EmptyTable;
  f := A4MainForm.GetUserFilterFolder + 'TaskDefault.rf';
  if FileExists(f) then
  begin
    DatasetFromINI(dsFilter, f);
    dsTask.ParamByName('Filter').Value := GenerateFilter;
  end
  else
  begin
    dsFilter.Insert;
    dsFilter['NotClosed'] := True;
    dsFilter.Post;
    dsTask.ParamByName('Filter').Value := GenerateFilter;
  end;
end;

procedure TTaskForm.FindId(const Value: integer);
begin
  if (Value <> -1) and dsTask.Active then
  begin
    if dsTask.Locate('ID', Value, []) then
    begin
      dbGrid.RowDetailPanel.Visible := True;
      dbGrid.RowDetailPanel.Active := True;
      dbgMsg.SetFocus;
    end
    else
    begin
      //
      dsFilter.Close;
      dsFilter.Open;
      dsFilter.EmptyTable;
      dsFilter.Insert;
      dsFilter.FieldByNAme('TASK_ID').AsInteger := Value;
      dsFilter['NotClosed'] := False;
      dsFilter['ALLUSERS'] := dmMain.AllowedAction(rght_Tasks_All);
      dsFilter.Post;
      dsTask.Close;
      dsTask.ParamByName('Filter').Value := GenerateFilter;
      dsTask.Open;
    end;
  end;
end;

procedure TTaskForm.CloseSelectedAsCurrent;
var
  i, id: integer;
  ed: TDateTime;
begin
  if (dsTask.FieldByNAme('Exec_Date').IsNull) then
    Exit;
  if MessageDlg(rsCloseSelectedTask, mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  id := dsTask['Id'];
  // ed := edtEXEC_DATE.Value; //
  ed := dsTask['Exec_Date'];
  dbGrid.DataSource.DataSet.DisableControls;
  with TpFIBQuery.Create(Nil) do
  begin
    try
      Database := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      sql.Text := 'update Tasklist set Exec_Date = :ed where Id = :id and Exec_Date is null';
      ParamByName('ed').AsDateTime := ed;
      Transaction.StartTransaction;
      for i := 0 to dbGrid.SelectedRows.Count - 1 do
      begin
        dbGrid.DataSource.DataSet.Bookmark := dbGrid.SelectedRows[i];
        ParamByName('id').AsInteger := dbGrid.DataSource.DataSet['ID'];
        ExecQuery;
      end;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
  dbGrid.DataSource.DataSet.EnableControls;
  dsTask.CloseOpen(True);
  dsTask.Locate('id', id, []);
end;

function TTaskForm.GetAccountFromObj(const oType: string; const oId: String): String;
var
  vSQL: string;
begin
  Result := '';

  if (oType = 'P') then
    vSQL := 'PAYMENT p inner join customer c on (c.Customer_Id = p.Customer_Id) where p.Payment_Id'
  else if (oType = 'R') then
    vSQL := 'Request p inner join customer c on (c.Customer_Id = p.Rq_Customer) where p.Rq_Id'
  else
    vSQL := '';

  if (not vSQL.IsEmpty) then
  begin
    vSQL := 'select c.Account_No ACCNT from ' + vSQL + ' = :ID';
    with TpFIBQuery.Create(Nil) do
    begin
      try
        Database := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        sql.Text := vSQL;
        ParamByName('ID').AsString := oId;
        Transaction.StartTransaction;
        ExecQuery;
        if (not FN('ACCNT').IsNull) then
          Result := FN('ACCNT').AsString;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  end;
end;

end.
