unit UsersForma;

interface

{$I defines.inc}

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.ActnList, Vcl.ToolWin,
  Vcl.Buttons, Vcl.Menus, Vcl.ImgList, Vcl.StdCtrls,
  DBGridEh, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, GridsEh, DBCtrlsEh, EhLibFIB,
  ToolCtrlsEh,
  DBGridEhToolCtrls, RxPlacemnt, DBAxisGridsEh,
{$IFDEF VER290}
  System.ImageList,
{$ENDIF}
  System.Actions,
  PrjConst, EhLibVCL, MemTableDataEh, DataDriverEh, pFIBDataDriverEh, IB_Services, DBGridEhGrouping, DynVarsEh,
  amSplitter;

type
  TUsersForm = class(TForm)
    pc: TPageControl;
    tabGroup: TTabSheet;
    tabUsers: TTabSheet;
    Panel1: TPanel;
    Panel8: TPanel;
    dbgGroups: TDBGridEh;
    dbgUsers: TDBGridEh;
    ToolBar2: TToolBar;
    tbHAdd: TToolButton;
    tbHEdit: TToolButton;
    tbHDelete: TToolButton;
    ToolButton17: TToolButton;
    ActionList: TActionList;
    actAddGroup: TAction;
    actEditGroup: TAction;
    actDelGroup: TAction;
    ToolButton13: TToolButton;
    ToolButton3: TToolButton;
    AddRights: TAction;
    actRemoveRight: TAction;
    Splitter1: TSplitter;
    Splitter4: TSplitter;
    dsGroups: TpFIBDataSet;
    srcGroups: TDataSource;
    srcUsers: TDataSource;
    dsUsers: TpFIBDataSet;
    dsGU: TpFIBDataSet;
    srcGU: TDataSource;
    dsG: TpFIBDataSet;
    srcG: TDataSource;
    ToolBar1: TToolBar;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    actAddUSer: TAction;
    actEditUser: TAction;
    actDelUser: TAction;
    FormStorage: TFormStorage;
    actGrant: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ToolButton1: TToolButton;
    actCloneUser: TAction;
    btnUserForWorker: TToolButton;
    N2: TMenuItem;
    ICONS_ACTIVE: TImageList;
    pcUserRA: TPageControl;
    tsGroups: TTabSheet;
    tsAreas: TTabSheet;
    Panel5: TPanel;
    Splitter3: TSplitter;
    Panel6: TPanel;
    dbgGU: TDBGridEh;
    Panel10: TPanel;
    sbUGAdd: TSpeedButton;
    sbUGremove: TSpeedButton;
    Panel7: TPanel;
    dbgG: TDBGridEh;
    pnlAreas: TPanel;
    Splitter2: TSplitter;
    Panel12: TPanel;
    dbgUG: TDBGridEh;
    Panel13: TPanel;
    btnAddArea: TSpeedButton;
    btnRemoveArea: TSpeedButton;
    Panel14: TPanel;
    dbgUGA: TDBGridEh;
    pnl1: TPanel;
    srcAU: TDataSource;
    dsAU: TpFIBDataSet;
    dsA: TpFIBDataSet;
    srcA: TDataSource;
    actUserForWorker: TAction;
    btn1: TToolButton;
    lbl1: TLabel;
    lbl2: TLabel;
    fSecurity: TpFIBSecurityService;
    qModify: TpFIBQuery;
    pgcRights: TPageControl;
    tsReports: TTabSheet;
    tsModules: TTabSheet;
    dbgReports: TDBGridEh;
    dsReports: TpFIBDataSet;
    srcReports: TDataSource;
    dbgModules: TDBGridEh;
    srcModules: TDataSource;
    dsModules: TpFIBDataSet;
    tsRights: TTabSheet;
    dbgRights: TDBGridEh;
    srcRights: TDataSource;
    dsRights: TpFIBDataSet;
    chkALL_AREAS: TDBCheckBoxEh;
    trWriteQ: TpFIBTransaction;
    tsRequest: TTabSheet;
    dbgRequest: TDBGridEh;
    srcRequest: TDataSource;
    dsRequest: TpFIBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAddGroupExecute(Sender: TObject);
    procedure actEditGroupExecute(Sender: TObject);
    procedure actDelGroupExecute(Sender: TObject);
    procedure pcChange(Sender: TObject);
    procedure sbUGAddClick(Sender: TObject);
    procedure sbUGremoveClick(Sender: TObject);
    procedure dbgGDblClick(Sender: TObject);
    procedure dbgGUDblClick(Sender: TObject);
    procedure actAddUSerExecute(Sender: TObject);
    procedure actCloneUserExecute(Sender: TObject);
    procedure actEditUserExecute(Sender: TObject);
    procedure actDelUserExecute(Sender: TObject);
    procedure actGrantExecute(Sender: TObject);
    procedure dsUsersAfterOpen(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkALL_AREASClick(Sender: TObject);
    procedure btnAddAreaClick(Sender: TObject);
    procedure btnRemoveAreaClick(Sender: TObject);
    procedure pcUserRAChange(Sender: TObject);
    procedure actUserForWorkerExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgGroupsDblClick(Sender: TObject);
    procedure dbgUsersDblClick(Sender: TObject);
    procedure pgcRightsChange(Sender: TObject);
    procedure dbgRightsExit(Sender: TObject);
    procedure dsUsersNewRecord(DataSet: TDataSet);
    procedure dbgRightsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure dbgUGADblClick(Sender: TObject);
    procedure dbgUGDblClick(Sender: TObject);
    procedure chkALL_AREASExit(Sender: TObject);
    procedure dbgReportsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    { Private declarations }
    isVersion3plus: Boolean;
    procedure garntTables(const aUserName: string);
    procedure garntExceptions(const aUserName: string);
    procedure grantProcedures(const aUserName: string);
    procedure grantFunctions(const aUserName: string);
    procedure GetUsersList(list: TStrings);
    procedure GetWorkersList(list: TStrings; Key: TStrings);
    procedure CheckAndCreateRole();
    procedure AddUser(const NewWorker: Boolean = true);
    procedure UserSQL(const SQL: string; const PLG: string = '');
  public
    { Public declarations }
  end;

var
  UsersForm: TUsersForm;

implementation

uses
  System.StrUtils,
  Vcl.Mask,
  dm, GroupForma, UserForma, AtrStrUtils, MAIN;

{$R *.dfm}

procedure TUsersForm.GetUsersList(list: TStrings);
var
  I: Integer;
begin
  list.Clear;
  if not isVersion3plus then
  begin
    fSecurity.Attach;
    fSecurity.DisplayUsers;
    for I := 0 to fSecurity.UserInfoCount - 1 do
      list.Add(fSecurity.UserInfo[I].UserName);
    fSecurity.Detach;
  end
  else
  begin
    with TpFIBQuery.Create(Nil) do
    begin
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        SQL.Text := 'SELECT distinct trim(SEC$USER_NAME) FIO FROM SEC$USERS u where SEC$USER_NAME <> ''SYSDBA''';
        Transaction.StartTransaction;
        ExecQuery;
        while not EOF do
        begin
          list.Add(FieldByName('FIO').AsString);
          Next;
        end;
        Close;
        Transaction.Commit;
      finally
        Free;
      end;
    end;
  end;
end;

procedure TUsersForm.GetWorkersList(list: TStrings; Key: TStrings);
begin
  with TpFIBQuery.Create(Nil) do
  begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Text := 'select WORKER_ID, SURNAME||'' ''||coalesce(FIRSTNAME,'''')||'' ''||coalesce(MIDLENAME,'''') as fio '
        + 'from WORKER where working = 1 and coalesce(IBNAME, '''') = '''' order by 2';
      Transaction.StartTransaction;
      ExecQuery;
      while not EOF do
      begin
        list.Add(FieldByName('FIO').AsString);
        Key.Add(FieldByName('WORKER_ID').AsString);
        Next;
      end;
      Close;
      Transaction.Commit;
    finally
      Free;
    end;
  end;
end;

procedure TUsersForm.garntExceptions(const aUserName: string);
var
  grants: TStrings;
  I: Integer;
begin
  if dmMain.dbTV.ServerMajorVersion < 3 then
    Exit;
  if Trim(aUserName) = '' then
    Exit;

  grants := TStringList.Create;
  try
    with TpFIBQuery.Create(Nil) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        // tables and views
        SQL.Text := 'select Rdb$Exception_Name from Rdb$Exceptions where Rdb$System_Flag <> 1';
        Transaction.StartTransaction;
        ExecQuery;
        while not EOF do
        begin
          grants.Add(Fields[0].Value);
          Next;
        end;
        Transaction.Commit;
        Close;

        Transaction := dmMain.trWriteQ;
        ParamCheck := False;

        for I := 0 to grants.Count - 1 do
        begin
          Transaction.StartTransaction;
          SQL.Text := ' GRANT USAGE ON EXCEPTION  ' + grants.Strings[I] + ' TO ' + aUserName;
          ExecQuery;
          Transaction.Commit;
        end;
        Close;
      finally
        Free;
      end;
  finally
    grants.Free;
  end;
end;

procedure TUsersForm.garntTables(const aUserName: string);
var
  grants: TStrings;
  I: Integer;

begin
  if Trim(aUserName) = '' then
    Exit;

  grants := TStringList.Create;
  try
    with TpFIBQuery.Create(Nil) do
    begin
      try
        if dmMain.dbTV.ServerMajorVersion >= 3 then
        begin
          DataBase := dmMain.dbTV;
          Transaction := dmMain.trReadQ;
          // tables and views
          SQL.Text := 'select Rdb$Generator_Name NAME from Rdb$Generators where Rdb$System_Flag = 0';
          Transaction.StartTransaction;
          ExecQuery;
          grants.Clear;
          while not EOF do
          begin
            grants.Add(Fields[0].Value);
            Next;
          end;
          Transaction.Commit;
          Close;

          Transaction := dmMain.trWriteQ;
          ParamCheck := False;
          for I := 0 to grants.Count - 1 do
          begin
            Transaction.StartTransaction;
            SQL.Text := ' GRANT USAGE ON SEQUENCE ' + grants.Strings[I] + ' TO ' + aUserName;
            ExecQuery;
            Transaction.Commit;
          end;
          Close;

          // Transaction.StartTransaction;
          // SQL.Text := ' GRANT ALTER ANY SEQUENCE TO ' + aUserName;
          // ExecQuery;
          // Transaction.Commit;
          // Close;
        end
        else
        begin
          Transaction := dmMain.trWriteQ;
          ParamCheck := False;
          Transaction.StartTransaction;
          SQL.Text := ' GRANT SELECT, UPDATE ON RDB$GENERATORS TO ' + aUserName;
          ExecQuery;
          Transaction.Commit;
          Close;
        end;

        DataBase := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        // tables and views
        SQL.Text := 'SELECT V.RDB$RELATION_NAME AS NAME FROM RDB$RELATIONS V' + rsEOL +
          ' WHERE (V.RDB$SYSTEM_FLAG IS NULL OR V.RDB$SYSTEM_FLAG <> 1) AND (V.RDB$FLAGS = 1)';
        Transaction.StartTransaction;
        ExecQuery;
        grants.Clear;
        while not EOF do
        begin
          grants.Add(Fields[0].Value);
          Next;
        end;
        Transaction.Commit;
        Close;

        Transaction := dmMain.trWriteQ;
        ParamCheck := False;
        for I := 0 to grants.Count - 1 do
        begin
          Transaction.StartTransaction;
          SQL.Text := ' GRANT ALL ON  ' + grants.Strings[I] + ' TO ' + aUserName;
          ExecQuery;
          Transaction.Commit;
        end;
        Close;
      finally
        Free;
      end;
    end;
  finally
    grants.Free;
  end;
end;

procedure TUsersForm.grantProcedures(const aUserName: string);
var
  grants: TStrings;
  I: Integer;
begin
  if Trim(aUserName) = '' then
    Exit;
  grants := TStringList.Create;
  try
    with TpFIBQuery.Create(Nil) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        // procedures
        SQL.Text := 'SELECT P.RDB$PROCEDURE_NAME AS NAME FROM RDB$PROCEDURES P' + rsEOL +
          'WHERE P.RDB$SYSTEM_FLAG IS NULL OR P.RDB$SYSTEM_FLAG <> 1';
        Transaction.StartTransaction;
        ExecQuery;
        while not EOF do
        begin
          grants.Add(Fields[0].Value);
          Next;
        end;
        Transaction.Commit;
        Close;

        Transaction := dmMain.trWriteQ;
        ParamCheck := False;
        for I := 0 to grants.Count - 1 do
        begin
          Transaction.StartTransaction;
          SQL.Text := ' GRANT EXECUTE ON PROCEDURE ' + grants.Strings[I] + ' TO ' + aUserName;
          ExecQuery;
          Transaction.Commit;
        end;
        Close;

      finally
        Free;
      end;
  finally
    grants.Free;
  end;
end;

procedure TUsersForm.grantFunctions(const aUserName: string);
var
  grants: TStrings;
  I: Integer;
begin
  if Trim(aUserName) = '' then
    Exit;
  grants := TStringList.Create;
  try
    with TpFIBQuery.Create(Nil) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trReadQ;
        // procedures
        SQL.Text := 'SELECT P.RDB$FUNCTION_NAME AS NAME FROM Rdb$Functions P' + rsEOL +
          'WHERE P.RDB$SYSTEM_FLAG IS NULL OR P.RDB$SYSTEM_FLAG <> 1';
        Transaction.StartTransaction;
        ExecQuery;
        while not EOF do
        begin
          grants.Add(Fields[0].Value);
          Next;
        end;
        Transaction.Commit;
        Close;

        Transaction := dmMain.trWriteQ;
        ParamCheck := False;
        for I := 0 to grants.Count - 1 do
        begin
          Transaction.StartTransaction;
          SQL.Text := ' GRANT EXECUTE ON FUNCTION ' + grants.Strings[I] + ' TO ' + aUserName;
          ExecQuery;
          Transaction.Commit;
        end;
        Close;

      finally
        Free;
      end;
  finally
    grants.Free;
  end;
end;

procedure TUsersForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TDBGridEh then
      (Components[I] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[I].Name, False);
  Action := caFree;
  UsersForm := nil;
end;

procedure TUsersForm.FormCreate(Sender: TObject);
begin
  isVersion3plus := dmMain.dbTV.Version.Contains(' 3.');
  isVersion3plus := isVersion3plus or dmMain.dbTV.Version.Contains(' 4.');
  FormStorage.IniFileName := A4MainForm.GetIniFileName;
  pgcRights.ActivePage := tsRights;
  pgcRightsChange(pgcRights);
  if not isVersion3plus then
  begin
    with fSecurity do
    begin
      LoginPrompt := False;
      LibraryName := dmMain.ClientLib;
      Params.Add('user_name=' + dmMain.User); // Настройки
      Params.Add('password=' + dmMain.Password);
      Protocol := TCP;
      ServerName := AnsiString(dmMain.Server);
    end;
  end;

  if (dmMain.GetSettingsValue('SHOW_DOC_LIST') <> '1') then
    dsRights.ParamByName('right_fltr').Value := Format('r.Id <> %d', [rght_Dictionary_Doclist]);

end;

procedure TUsersForm.btnAddAreaClick(Sender: TObject);
begin
  if not dsA.Active then
    dsA.Open;
  if not dsAU.Active then
    dsAU.Open;
  if (dsA.RecordCount = 0) or (dsA.FieldByName('WA_ID').IsNull) then
    Exit;

  qModify.SQL.Text := 'update or insert into Sys$User_Areas (User_Id, Area_Id)' +
    ' values (:User_Id, :Area_Id) matching(User_Id, Area_Id)';
  qModify.ParamByName('user_id').Value := dsUsers['ID'];
  qModify.ParamByName('area_id').Value := dsA['WA_ID'];
  // qModify.Transaction.StartTransaction;
  qModify.ExecQuery;
  // qModify.Transaction.Commit;
  // qModify.Transaction.Active := False;
  dsA.CloseOpen(true);
  dsAU.CloseOpen(true);
end;

procedure TUsersForm.btnRemoveAreaClick(Sender: TObject);
begin
  if not dsA.Active then
    dsA.Open;
  if not dsAU.Active then
    dsAU.Open;
  if (dsAU.RecordCount = 0) or (dsAU.FieldByName('WA_ID').IsNull) then
    Exit;

  qModify.SQL.Text := 'delete from sys$user_areas where area_id = :area_id and user_id = :user_id';
  qModify.ParamByName('user_id').Value := dsUsers['ID'];
  qModify.ParamByName('area_id').Value := dsAU['WA_ID'];
  // qModify.Transaction.StartTransaction;
  qModify.ExecQuery;
  // qModify.Transaction.Commit;
  // qModify.Transaction.Active := False;
  dsA.CloseOpen(true);
  dsAU.CloseOpen(true);
end;

procedure TUsersForm.chkALL_AREASClick(Sender: TObject);
begin
  pnlAreas.Visible := not chkALL_AREAS.Checked;
  {
    if (dsUsers.RecordCount = 0) or (dsUsers.FieldByName('ID').IsNull) then
    Exit;

    dsUsers.Edit;
    if chkALL_AREAS.Checked then
    dsUsers['all_areas'] := 1
    else
    dsUsers['all_areas'] := 0;
    dsUsers.Post;
  }
end;

procedure TUsersForm.chkALL_AREASExit(Sender: TObject);
begin
  if dsUsers.State = dsEdit then
    dsUsers.Post;
end;

procedure TUsersForm.actUserForWorkerExecute(Sender: TObject);
begin
  AddUser(true);
end;

procedure TUsersForm.actAddGroupExecute(Sender: TObject);
var
  bm: TBookmark;
begin
  bm := dsGroups.GetBookmark;
  dsGroups.Append;
  with TGF.Create(application) do
    try
      if ShowModal = mrOk then
      begin
        dsGroups.Post;
        // dsGroups.Refresh;
      end
      else
        dsGroups.Cancel;
      dsGroups.CloseOpen(true);
      dsGroups.GotoBookmark(bm);
    finally
      Free;
    end;
end;

procedure TUsersForm.actEditGroupExecute(Sender: TObject);
begin
  if dsGroups.IsEmpty then
    Exit;

  dsGroups.Edit;
  with TGF.Create(application) do
    try
      if ShowModal = mrOk then
        dsGroups.Post
      else
        dsGroups.Cancel;
    finally
      Free;
    end;
end;

procedure TUsersForm.actDelGroupExecute(Sender: TObject);
begin
  If MessageDLG(Format(rsUserGroupDelete, [dsGroups['GROUP_NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    dsGroups.Delete;
end;

procedure TUsersForm.FormShow(Sender: TObject);
var
  I: Integer;
  Font_size: Integer;
  Font_name: string;
  Row_height: Integer;
begin
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), I) then
    I := 0;
  Row_height := I;
  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), I) then
  begin
    Font_size := I;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  for I := 0 to ComponentCount - 1 do
  begin
    if Components[I] is TDBGridEh then
    begin
      (Components[I] as TDBGridEh).RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[I].Name, [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
      if (Components[I] as TDBGridEh).DataSource.DataSet.Active then
        (Components[I] as TDBGridEh).DefaultApplySorting;
      if Font_size <> 0 then
      begin
        (Components[I] as TDBGridEh).Font.Name := Font_name;
        (Components[I] as TDBGridEh).Font.Size := Font_size;
      end;
      if Row_height <> 0 then
      begin
        (Components[I] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[I] as TDBGridEh).RowHeight := Row_height;
      end;
    end
    else if Font_size <> 0 then
    begin
      if (Components[I] is TMemo) then
      begin
        (Components[I] as TMemo).Font.Name := Font_name;
        (Components[I] as TMemo).Font.Size := Font_size;
      end
      else if (Components[I] is TDBMemoEh) then
      begin
        (Components[I] as TDBMemoEh).Font.Name := Font_name;
        (Components[I] as TDBMemoEh).Font.Size := Font_size;
      end;
    end;
  end;

  if not dmMain.dbTV.Connected then
    dmMain.dbTV.Open;

  CheckAndCreateRole();

  tsRequest.TabVisible := (dmMain.GetSettingsValue('REQUEST_TYPE_RESTRICT') = '1');

  pc.ActivePageIndex := 0;
  pgcRights.ActivePageIndex := 0;
  pcChange(Sender);
  pgcRightsChange(Sender);
end;

procedure TUsersForm.pcChange(Sender: TObject);
begin
  dsGroups.Active := pc.ActivePageIndex = 0;
  dsUsers.Active := pc.ActivePageIndex = 1;
end;

procedure TUsersForm.pcUserRAChange(Sender: TObject);
begin

  dsGU.Active := pcUserRA.ActivePageIndex = 0;
  dsG.Active := pcUserRA.ActivePageIndex = 0;

  dsAU.Active := pcUserRA.ActivePageIndex = 1;
  dsA.Active := pcUserRA.ActivePageIndex = 1;
end;

procedure TUsersForm.sbUGAddClick(Sender: TObject);
var
  old_id: Integer;
begin
  if (dsG.RecordCount = 0) or (dsG.FieldByName('ID').IsNull) or (dsUsers.RecordCount = 0) or
    (dsUsers.FieldByName('ID').IsNull) then
    Exit;

  dsGU.Append;
  dsGU['user_id'] := dsUsers['ID'];
  dsGU['Group_Id'] := dsG['ID'];
  dsGU['GROUP_NAME'] := dsG['GROUP_NAME'];
  dsGU.Post;

  dsG.DisableControls;
  old_id := -1;
  if not dsG.EOF then
  begin
    dsG.Next;
    old_id := dsG['id'];
  end;
  dsG.CloseOpen(true);
  if old_id <> -1 then
    dsG.Locate('id', VarArrayOf([old_id]), []);
  dsG.EnableControls;
  dsUsers.Refresh;
end;

procedure TUsersForm.sbUGremoveClick(Sender: TObject);
var
  old_id: Integer;
begin
  if (dsGU.RecordCount = 0) or (dsGU.FieldByName('Group_Id').IsNull) or (dsUsers.RecordCount = 0) or
    (dsUsers.FieldByName('ID').IsNull) then
    Exit;

  dsGU.Delete;

  dsG.DisableControls;
  old_id := -1;
  if not dsG.EOF then
    old_id := dsG['id'];
  dsG.CloseOpen(true);
  if old_id <> -1 then
    dsG.Locate('id', VarArrayOf([old_id]), []);
  dsG.EnableControls;
  dsUsers.Refresh;
end;

procedure TUsersForm.dbgGDblClick(Sender: TObject);
begin
  sbUGAddClick(Sender);
end;

procedure TUsersForm.dbgGUDblClick(Sender: TObject);
begin
  sbUGremoveClick(Sender);
end;

procedure TUsersForm.actAddUSerExecute(Sender: TObject);
begin
  AddUser(true);
end;

procedure TUsersForm.actCloneUserExecute(Sender: TObject);
var
  u: string;
begin
  with TUF.Create(application) do
  begin
    try
      pnlExistUser.Visible := true;
      pnlNewUser.Visible := False;
      GetUsersList(cbUsers.Items);
      GetWorkersList(cbWorker.Items, cbWorker.KeyItems);
      if ShowModal = mrOk then
      begin
        u := ReplaceStr(cbUsers.Text, rsQUOTE, rsQUOTE + rsQUOTE);
        garntTables('ROLE_A4USER');
        garntExceptions('ROLE_A4USER');
        grantProcedures('ROLE_A4USER');
        grantFunctions('ROLE_A4USER');
        qModify.SQL.Text := Format('grant ROLE_A4USER to %s', [u]);
        // qModify.Transaction.StartTransaction;
        qModify.ExecQuery;
        // qModify.Transaction.Commit;

        dsUsers.Insert;
        // dsUsers['working'] := chkWork.Checked;
        dsUsers['ibname'] := u;
        dsUsers['lockedout'] := chkLock.Checked;
        if pgcWorker.ActivePageIndex = 0 then
        begin
          dsUsers.FieldByName('WORKER_ID').Clear;
          dsUsers['surname'] := edF.Text;
          dsUsers['firstname'] := edI.Text;
          dsUsers['midlename'] := edO.Text;
          dsUsers['phone_no'] := etPhone.Text;
          dsUsers['notice'] := dmN.Lines.Text;
        end
        else
          dsUsers['WORKER_ID'] := cbWorker.Value;
        dsUsers.Post;

        dsUsers.CloseOpen(true);
        dsUsers.Locate('IBNAME', VarArrayOf([u]), []);
      end;
    finally
      Free;
    end;
  end;
end;

procedure TUsersForm.actEditUserExecute(Sender: TObject);
var
  SQL: string;
  u, p: string;
begin
  if dsUsers.IsEmpty then
    Exit;

  with TUF.Create(application) do
    try
      edU.Text := dsUsers['IBNAME'];
      if (dsUsers.FieldByName('lockedout').IsNull or dsUsers['lockedout'] = 0) then
        chkLock.Checked := False
      else
        chkLock.Checked := true;
      if (dsUsers.FieldByName('working').IsNull or dsUsers['working'] = 0) then
        chkWork.Checked := False
      else
        chkWork.Checked := true;

      edU.Enabled := False;
      pgcWorker.Visible := False;
      if ShowModal = mrOk then
      begin
        if AnsiUpperCase(edU.Text) <> 'SYSDBA' then
        begin
          if length(edPWD.Text) > 0 then
          begin
            u := ReplaceStr(edU.Text, rsQUOTE, rsQUOTE + rsQUOTE);
            p := rsQUOTE + ReplaceStr(pswdPrefix + edPWD.Text, rsQUOTE, rsQUOTE + rsQUOTE) + rsQUOTE;
            SQL := Format('CREATE OR ALTER USER %s PASSWORD %s', [u, p]);
            UserSQL(SQL);
            UserSQL(SQL, 'Legacy_UserManager');
            UserSQL(SQL, 'Srp');
          end;
        end;
        dsUsers.Edit;
        // dsUsers['working'] := chkWork.Checked;
        if chkLock.Checked then
          dsUsers['lockedout'] := 1
        else
          dsUsers['lockedout'] := 0;
        dsUsers.Post;
      end
    finally
      Free;
    end;
end;

procedure TUsersForm.actDelUserExecute(Sender: TObject);
var
  SQL: String;
begin
  if (dsUsers.RecordCount = 0) or (dsUsers.FieldByName('IBNAME').IsNull) then
    Exit;

  if (MessageDLG(Format(rsUserDelete, [dsUsers['IBNAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
    Exit;
  if AnsiUpperCase(dsUsers['IBNAME']) <> 'SYSDBA' then
  begin
    SQL := 'DROP USER ' + dsUsers['IBNAME'];
    try
      qModify.SQL.Text := SQL;
      // qModify.Transaction.StartTransaction;
      qModify.ExecQuery;
      // qModify.Transaction.Commit;
    finally
      //
    end;
    dsUsers.Delete;
  end;
end;

procedure TUsersForm.actGrantExecute(Sender: TObject);
begin
  garntTables('ROLE_A4USER');
  garntExceptions('ROLE_A4USER');
  grantProcedures('ROLE_A4USER');
  grantFunctions('ROLE_A4USER');
  qModify.SQL.Text := 'grant ROLE_A4USER to ' + dsUsers['IBNAME'];
  qModify.Transaction.StartTransaction;
  qModify.ExecQuery;
  qModify.Transaction.Commit;
end;

procedure TUsersForm.dsUsersAfterOpen(DataSet: TDataSet);
begin
  actGrant.Enabled := not DataSet.EOF;
end;

procedure TUsersForm.dsUsersNewRecord(DataSet: TDataSet);
begin
  dsUsers['ALL_AREAS'] := 0;
end;

procedure TUsersForm.N2Click(Sender: TObject);
begin
  garntTables('ROLE_A4USER');
  garntExceptions('ROLE_A4USER');
  grantProcedures('ROLE_A4USER');
  grantFunctions('ROLE_A4USER');
  dsUsers.First;
  while not dsUsers.EOF do
  begin
    qModify.SQL.Text := 'grant ROLE_A4USER to ' + dsUsers['IBNAME'];
    // qModify.Transaction.StartTransaction;
    qModify.ExecQuery;
    // qModify.Transaction.Commit;
    dsUsers.Next;
  end;
  dsUsers.First;
end;

procedure TUsersForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) then
  begin
    if pc.ActivePage = tabGroup then
    begin
      if (Ord(Key) = VK_LEFT) then
        AddRights.Execute
      else if (Ord(Key) = VK_RIGHT) then
        actRemoveRight.Execute;
    end
    else
    begin
      if (Ord(Key) = VK_LEFT) then
        sbUGAddClick(Sender)
      else if (Ord(Key) = VK_RIGHT) then
        sbUGremoveClick(Sender);
    end;
  end;
end;

procedure TUsersForm.dbgGroupsDblClick(Sender: TObject);
begin
  actEditGroup.Execute;
end;

procedure TUsersForm.dbgUGADblClick(Sender: TObject);
begin
  btnAddAreaClick(Sender);
end;

procedure TUsersForm.dbgUGDblClick(Sender: TObject);
begin
  btnRemoveAreaClick(Sender);
end;

procedure TUsersForm.dbgUsersDblClick(Sender: TObject);
begin
  actEditUser.Execute;
end;

procedure TUsersForm.CheckAndCreateRole();
var
  I: Integer;
begin
  I := dmMain.dbTV.QueryValue('select count(*) as CNT from rdb$roles r where r.Rdb$Role_Name = ''ROLE_A4USER''', 0);
  if (I = 0) then
  begin
    qModify.SQL.Text := 'CREATE ROLE ROLE_A4USER;';
    // qModify.Transaction.StartTransaction;
    qModify.ExecQuery;
    // qModify.Transaction.Commit;
    garntTables('ROLE_A4USER');
    garntExceptions('ROLE_A4USER');
    grantProcedures('ROLE_A4USER');
    grantFunctions('ROLE_A4USER');
  end;
end;

procedure TUsersForm.pgcRightsChange(Sender: TObject);
begin
  dsRights.Active := (pgcRights.ActivePageIndex = 0);
  dsReports.Active := (pgcRights.ActivePageIndex = 1);
  dsModules.Active := (pgcRights.ActivePageIndex = 2);
  dsRequest.Active := (pgcRights.ActivePageIndex = 3);
end;

procedure TUsersForm.dbgReportsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if not(Sender as TDBGridEh).DataSource.DataSet.FieldByName('rAllowed').IsNull then
  begin
    if (Sender as TDBGridEh).DataSource.DataSet.FieldByName('rAllowed').AsInteger = 1 then
      AFont.Style := AFont.Style + [fsBold]
    else
      AFont.Style := AFont.Style - [fsBold];
  end
end;

procedure TUsersForm.dbgRightsExit(Sender: TObject);
begin
  if (Sender as TDBGridEh).DataSource.State in [dsEdit] then
    (Sender as TDBGridEh).DataSource.DataSet.Post;
end;

procedure TUsersForm.dbgRightsGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if not(Sender as TDBGridEh).DataSource.DataSet.FieldByName('rAllowed').IsNull then
  begin
    if (Sender as TDBGridEh).DataSource.DataSet.FieldByName('rAllowed').AsInteger = 1 then
      AFont.Style := AFont.Style + [fsBold]
    else
      AFont.Style := AFont.Style - [fsBold];
  end
  else
    AFont.Style := AFont.Style - [fsBold];

  if ((Sender as TDBGridEh).DataSource.DataSet.FieldByName('Right_Id').AsInteger in [ // rght_Customer_View,
    rght_Customer_Only_ONE, rght_Customer_PersonalData, rght_Pays_TheirAdd, rght_Pays_AddToday, rght_Recourses_owner,
    rght_OrdersTP_Today, rght_Recourses_TodayOnly]) then
    Background := clRed
  else
    Background := clWindow;
end;

procedure TUsersForm.UserSQL(const SQL: string; const PLG: string = '');
begin
  try
    if PLG.IsEmpty then
      qModify.SQL.Text := SQL
    else
      qModify.SQL.Text := SQL + ' ACTIVE USING PLUGIN ' + PLG;
    // qModify.Transaction.StartTransaction;
    qModify.ExecQuery;
    // qModify.Transaction.Commit;
  finally
    qModify.Close;
  end;
end;

procedure TUsersForm.AddUser(const NewWorker: Boolean = true);
var
  added: Boolean;
  SQL, bm: string;
  u, p, f, m, l: String;
begin
  { IFNDEF DEMOVERSION }
  if (dsUsers.RecordCount > 0) and (not dsUsers.FieldByName('IBNAME').IsNull) then
    bm := dsUsers['IBNAME']
  else
    bm := '';

  with TUF.Create(application) do
  begin
    try
      GetWorkersList(cbWorker.Items, cbWorker.KeyItems);
      // chkWork.Checked := true;
      chkLock.Checked := False;
      if NewWorker then
        pgcWorker.ActivePageIndex := 0
      else
        pgcWorker.ActivePageIndex := 1;

      if ShowModal = mrOk then
      begin
        if (length(edPWD.Text) > 0) and (length(edU.Text) > 0) then
        begin
          // added := CheckUserExists(edU.Text);
          bm := edU.Text;
          u := ReplaceStr(edU.Text, rsQUOTE, rsQUOTE + rsQUOTE);
          p := ReplaceStr(pswdPrefix + edPWD.Text, rsQUOTE, rsQUOTE + rsQUOTE);
          f := ReplaceStr(edI.Text, rsQUOTE, rsQUOTE + rsQUOTE);
          m := ReplaceStr(edF.Text, rsQUOTE, rsQUOTE + rsQUOTE);
          l := ReplaceStr(edO.Text, rsQUOTE, rsQUOTE + rsQUOTE);

          SQL := Format('CREATE OR ALTER USER %s PASSWORD ''%s'' FIRSTNAME ''%s'' MIDDLENAME ''%s'' LASTNAME ''%s''',
            [u, p, f, m, l]);
          UserSQL(SQL);
          UserSQL(SQL, 'Legacy_UserManager');
          UserSQL(SQL, 'Srp');
          added := true;

          if added then
          begin
            garntTables('ROLE_A4USER');
            garntExceptions('ROLE_A4USER');
            grantProcedures('ROLE_A4USER');
            grantFunctions('ROLE_A4USER');
            qModify.SQL.Clear;
            qModify.SQL.Text := Format('grant ROLE_A4USER to %s', [u]);
            // qModify.Transaction.StartTransaction;
            qModify.ExecQuery;
            // qModify.Transaction.Commit;

            dsUsers.Insert;
            // dsUsers['working'] := chkWork.Checked;
            dsUsers['ibname'] := u;
            if chkLock.Checked then
              dsUsers['lockedout'] := 1
            else
              dsUsers['lockedout'] := 0;
            if pgcWorker.ActivePageIndex = 0 then
            begin
              dsUsers.FieldByName('WORKER_ID').Clear;
              dsUsers['surname'] := edF.Text;
              dsUsers['firstname'] := edI.Text;
              dsUsers['midlename'] := edO.Text;
              dsUsers['phone_no'] := etPhone.Text;
              dsUsers['notice'] := dmN.Lines.Text;
            end
            else
              dsUsers['WORKER_ID'] := cbWorker.Value;
            dsUsers.Post;
            // dsUsers.Transaction.Commit;
          end;
        end;
      end;
    finally
      Free;
    end;
  end;

  if dsUsers.State in [dsInsert, dsEdit] then
    dsUsers.Cancel
  else
  begin
    dsUsers.CloseOpen(true);
    dsUsers.First;
    if bm <> '' then
      dsUsers.Locate('ibname', bm, []);
  end;
  { ENDIF }
end;

end.
