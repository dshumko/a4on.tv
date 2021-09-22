unit ScripEditorForma;
{$I defines.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, fs_tree, fs_synmemo, StdCtrls, ExtCtrls, ComCtrls,
  ToolWin, fs_iinterpreter, Mask, DBCtrlsEh,
  SynEditHighlighter, ActnList, System.Actions, PrjConst, Vcl.Buttons,
  CnErrorProvider, Vcl.Menus;

type
  TScripEditorForm = class(TForm)
    Splitter1: TSplitter;
    ToolBar1: TToolBar;
    btnOpen: TToolButton;
    btnRun: TToolButton;
    btnDebug: TToolButton;
    Panel2: TPanel;
    Status: TDBMemoEh;
    OpenDialog1: TOpenDialog;
    btnSave: TToolButton;
    btn1: TToolButton;
    ToolButton3: TToolButton;
    cbLanguage: TDBComboBoxEh;
    lbl1: TLabel;
    btnEval: TToolButton;
    ImageList: TImageList;
    actlst: TActionList;
    actEval: TAction;
    btnNew: TToolButton;
    fsTree1: TfsTree;
    Splitter2: TSplitter;
    Memo: TfsSyntaxMemo;
    pnlEval: TPanel;
    lbl2: TLabel;
    lbl3: TLabel;
    edtExpr: TEdit;
    mmoEvalRes: TDBMemoEh;
    pnlSave: TPanel;
    btnSaveLink: TBitBtn;
    btnCancelLink: TBitBtn;
    edtName: TDBEditEh;
    edtNotice: TDBEditEh;
    actNew: TAction;
    actSave: TAction;
    actOpen: TAction;
    actRun: TAction;
    actDebug: TAction;
    CnErrors: TCnErrorProvider;
    pmModules: TPopupMenu;
    chkInMenu: TDBCheckBoxEh;
    btnRunTO: TToolButton;
    actRunTO: TAction;
    btn2: TToolButton;
    btnDelete: TToolButton;
    actDelete: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure fsScript1RunLine(Sender: TfsScript; const UnitName, SourcePos: String);
    procedure edtExprKeyPress(Sender: TObject; var Key: Char);
    procedure actEvalExecute(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbLanguageChange(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actRunExecute(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure actRunTOExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
    FRunning: Boolean;
    FStopped: Boolean;
    FModuleID: Integer;
    FRunToLine : Integer;
    procedure SaveScript;
    procedure NewModule;
    procedure RunScript(const Debug: Boolean = False);
    procedure miModuleClick(Sender: TObject);
    procedure CreateModulesMenu;
  public
    { Public declarations }
  end;

var
  ScripEditorForm: TScripEditorForm;

implementation

uses fs_iTools, ScriptModule, pFIBQuery, DM;

{$R *.dfm}

procedure TScripEditorForm.actDebugExecute(Sender: TObject);
begin
  FRunToLine := -1;
  RunScript(true);
end;

procedure TScripEditorForm.actDeleteExecute(Sender: TObject);
var
  s : String;
begin
  if edtName.Text <> '' then s := edtName.Text;
  s := format(rsDeleteWithName, [s]);
  if (MessageBox(0, PWideChar(s), PWideChar(rsDeleteProgram), MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = idNo)
  then Exit;

  Memo.Lines.Clear;
  if FModuleID = -1 then exit;

  with TpFIBQuery.Create(Nil) do begin
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;
      SQL.Text := 'delete from Modules where Id_Module = :Id_Module';
      ParamByName('Id_Module').AsInteger := FModuleID;
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally
      // освободим память
      Free;
    end;
  end;
  CreateModulesMenu;
end;

procedure TScripEditorForm.actEvalExecute(Sender: TObject);
begin
  actEval.Checked := not actEval.Checked;
  pnlEval.Visible := actEval.Checked;
  mmoEvalRes.Lines.Text := '';
  edtExpr.Text := '';
end;

procedure TScripEditorForm.actNewExecute(Sender: TObject);
begin
  NewModule;
end;

procedure TScripEditorForm.actOpenExecute(Sender: TObject);
begin
  // CreateModulesMenu;
  // pmModules.PopupComponent := btnOpen;
  // pmModules.Popup(btnOpen.Width, btnOpen.Top + btnOpen.Height);
end;

procedure TScripEditorForm.actRunExecute(Sender: TObject);
begin
  FRunToLine := -1;
  RunScript;
end;

procedure TScripEditorForm.actSaveExecute(Sender: TObject);
begin
  pnlSave.Visible := true;
  edtName.SetFocus;
end;

procedure TScripEditorForm.btnCancelLinkClick(Sender: TObject);
begin
  pnlSave.Visible := False;
end;

procedure TScripEditorForm.btnSaveLinkClick(Sender: TObject);
begin
  SaveScript;
end;

procedure TScripEditorForm.cbLanguageChange(Sender: TObject);
begin
  case cbLanguage.ItemIndex of
    0: Memo.SyntaxType := stPascal;
    1: Memo.SyntaxType := stCpp;
    2: Memo.SyntaxType := stJs;
    3: Memo.SyntaxType := stVB;
  end;
end;

procedure TScripEditorForm.edtExprKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13
  then begin
    mmoEvalRes.Text := VarToStr(SM.fs.Evaluate(edtExpr.Text));
    edtExpr.SelectAll;
  end
  else if Key = #27
  then Close;
end;

procedure TScripEditorForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  ScripEditorForm := nil;
end;

procedure TScripEditorForm.FormCreate(Sender: TObject);
begin
  CreateModulesMenu;
  NewModule;
end;

procedure TScripEditorForm.fsScript1RunLine(Sender: TfsScript; const UnitName, SourcePos: String);
var
  p: TPoint;
begin
  { enable main window to allow debugging of modal forms }
  EnableWindow(Handle, true);
  SetFocus;

  p := fsPosToPoint(SourcePos);
  Memo.SetPos(p.X, p.Y);
  FStopped := (p.X >= FRunToLine);
  while FStopped do Application.ProcessMessages;
end;

procedure TScripEditorForm.SaveScript;
var
  errors: Boolean;
begin
  errors := False;
  if (edtName.Text = '')
  then begin
    errors := true;
    CnErrors.SetError(edtName, rsEmptyFieldError, iaMiddleLeft, bsNeverBlink);
  end
  else CnErrors.Dispose(edtName);

  if (cbLanguage.Text = '')
  then begin
    errors := true;
    CnErrors.SetError(cbLanguage, rsEmptyFieldError, iaTopCenter, bsNeverBlink);
  end
  else CnErrors.Dispose(cbLanguage);

  if errors
  then Exit;

  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trWriteQ;

      if FModuleID = -1
      then begin
        FModuleID := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);
        SQL.Text := 'insert into Modules (Id_Module, Id_Parent, Name, Notice, Lang, Module, in_menu) ' +
          'values (:Id_Module, :Id_Parent, :Name, :Notice, :Lang, :Module, :in_menu)';
      end
      else SQL.Text := 'update Modules ' +
          'set Id_Parent = :Id_Parent, Name = :Name, Notice = :Notice, Lang = :Lang, Module = :Module, in_menu = :in_menu '
          + 'where Id_Module = :Id_Module';

      ParamByName('Id_Module').AsInteger := FModuleID;
      ParamByName('Name').AsString := edtName.Text;
      ParamByName('Notice').AsString := edtNotice.Text;
      ParamByName('Lang').AsInteger := cbLanguage.ItemIndex;
      ParamByName('Module').AsString := Memo.Lines.Text;
      if chkInMenu.Checked
      then ParamByName('in_menu').AsInteger := 1
      else ParamByName('in_menu').AsInteger := 0;
      Transaction.StartTransaction;
      ExecQuery;
      Transaction.Commit;
    finally Free;
    end;
  pnlSave.Visible := False;
end;

procedure TScripEditorForm.NewModule;
begin
  FModuleID := -1;
  Memo.Lines.Clear;
  edtName.Text := '';
  edtNotice.Text := '';
  chkInMenu.Checked := true;
  cbLanguage.ItemIndex := 0;
  pnlSave.Visible := False;
end;

procedure TScripEditorForm.RunScript(const Debug: Boolean = False);
var
  t: UInt;
  p: TPoint;
begin
  if FRunning
  then begin
    FStopped := False;
    Exit;
  end;

  SM.fs.Clear;
  SM.fs.Lines := Memo.Lines;
  case cbLanguage.Value of
    1: SM.fs.SyntaxType := 'C++Script';
    2: SM.fs.SyntaxType := 'JScript';
    3: SM.fs.SyntaxType := 'BasicScript';
  else SM.fs.SyntaxType := 'PascalScript';
  end;

  SM.fs.Parent := fsGlobalUnit;

  if not SM.fs.Compile
  then begin
    Memo.SetFocus;
    p := fsPosToPoint(SM.fs.ErrorPos);
    Memo.SetPos(p.X, p.Y);
    if SM.fs.ErrorUnit = ''
    then Status.Text := SM.fs.ErrorMsg
    else Status.Text := SM.fs.ErrorUnit + ': ' + SM.fs.ErrorMsg;
    Exit;
  end
  else Status.Text := rsCompiledOK;

  t := GetTickCount;
  Application.ProcessMessages;

  if Debug
  then SM.fs.OnRunLine := fsScript1RunLine
  else SM.fs.OnRunLine := nil;

  FRunning := true;
  try SM.fs.Execute;
  finally
    FRunning := False;
    Status.Text := rsProgramEnd;
  end;

  Status.Text := Format(rsExecuteTime, [(GetTickCount - t)]);
end;

procedure TScripEditorForm.miModuleClick(Sender: TObject);
begin
  FModuleID := -1;
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Text :=
        'select Id_Module, name, notice, coalesce(Lang,0) Lang, coalesce(in_menu,1) in_menu, Module from Modules where Id_Module = :Id_Module';

      ParamByName('Id_Module').AsInteger := (Sender as TMenuItem).TAG;
      Transaction.StartTransaction;
      ExecQuery;
      if not EOF
      then begin
        cbLanguage.ItemIndex := fn('LANG').AsInteger;
        Memo.Lines.Text := fn('MODULE').AsString;
        edtName.Text := fn('name').AsString;
        edtNotice.Text := fn('notice').AsString;
        chkInMenu.Checked := (fn('in_menu').AsInteger = 1);
        FModuleID := fn('Id_Module').AsInteger;
      end;
      Transaction.Commit;
    finally Free;
    end;
end;

procedure TScripEditorForm.CreateModulesMenu;
var
  NewItem: TMenuItem;
begin
  while pmModules.Items.Count > 0 do
    pmModules.Items[pmModules.Items.Count-1].Free;

  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Text := 'select Id_Module, Name, Notice, Lang, in_MENU from Modules order by name';

      Transaction.StartTransaction;
      ExecQuery;
      while not EOF do begin
        NewItem := TMenuItem.Create(pmModules);
        NewItem.Name := 'miModules' + IntToStr(fn('Id_Module').AsInteger);
        NewItem.Caption := fn('Name').AsString;
        if not fn('NOTICE').IsNull
        then NewItem.Hint := fn('NOTICE').AsString;
        NewItem.TAG := fn('Id_Module').AsInteger;
        if not fn('NOTICE').IsNull
        then fn('NOTICE').AsString;
        NewItem.onclick := miModuleClick;
        pmModules.Items.Add(NewItem);
        Next;
      end;
      Transaction.Commit;
    finally Free;
    end;
end;

procedure TScripEditorForm.actRunTOExecute(Sender: TObject);
var
  Coordinate : TPoint;
begin
  Coordinate := Memo.GetPos;
  FRunToLine := Coordinate.X;
  RunScript(true);
end;

end.
