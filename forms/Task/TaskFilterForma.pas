unit TaskFilterForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ActnList,
  Vcl.DBCtrls, Vcl.ComCtrls,
  DBGridEh, DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, PrjConst, MemTableEh;

type
  TTaskFilterForm = class(TForm)
    pnlOKCancel: TPanel;
    SpeedButton3: TSpeedButton;
    dsExecutor: TpFIBDataSet;
    srcExecutor: TDataSource;
    chkDefaultFilter: TCheckBox;
    pnlBtns: TPanel;
    lbl4: TLabel;
    lbl5: TLabel;
    dbnvgr1: TDBNavigator;
    chk1: TDBCheckBoxEh;
    btnAnd: TButton;
    btnOR: TButton;
    btnLoad: TSpeedButton;
    btnSave: TSpeedButton;
    dlgOpen: TOpenDialog;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    pgcFilter: TPageControl;
    tsMain: TTabSheet;
    Label10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    cbbWORKER: TDBLookupComboboxEh;
    edtPLAN_TO: TDBDateTimeEditEh;
    edtPLAN_FROM: TDBDateTimeEditEh;
    chkNotClosed: TDBCheckBoxEh;
    srcFilter: TDataSource;
    actlst: TActionList;
    actOk: TAction;
    lblOrAND: TLabel;
    edtEXEC_TO: TDBDateTimeEditEh;
    lbl1: TLabel;
    edtEXEC_FROM: TDBDateTimeEditEh;
    lbl2: TLabel;
    edtOBJ_ID: TDBEditEh;
    cbbOBJ_TYPE: TDBComboBoxEh;
    lbl3: TLabel;
    chkAllUsers: TDBCheckBoxEh;
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure actOkExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAndClick(Sender: TObject);
    procedure btnORClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure srcFilterDataChange(Sender: TObject; Field: TField);
    procedure luWorkEnter(Sender: TObject);
  private
    { Private declarations }
    procedure SaveFilter(const filename: string);
    procedure CheckDateAndCorrect();
  public
    { Public declarations }
  end;

var
  TaskFilterForm: TTaskFilterForm;

implementation

uses
  DM, MAIN, AtrCommon, TaskForma;

{$R *.dfm}

procedure TTaskFilterForm.SaveFilter(const filename: string);
var
  s: string;
begin
  if Length(filename) = 0
  then exit;
  s := A4MainForm.GetUserFilterFolder + filename + '.rf';
  if srcFilter.DataSet.State in [dsEdit, dsInsert]
  then srcFilter.DataSet.post;
  DatasetToINI(srcFilter.DataSet, s);
end;

procedure TTaskFilterForm.btnAndClick(Sender: TObject);
begin
  if srcFilter.DataSet.State in [dsEdit, dsInsert]
  then srcFilter.DataSet.post;
  srcFilter.DataSet.Append;
  srcFilter.DataSet['next_condition'] := 1;
end;

procedure TTaskFilterForm.btnORClick(Sender: TObject);
begin
  if srcFilter.DataSet.State in [dsEdit, dsInsert]
  then srcFilter.DataSet.post;
  srcFilter.DataSet.Append;
  srcFilter.DataSet['next_condition'] := 0;
end;

procedure TTaskFilterForm.btnLoadClick(Sender: TObject);
begin
  dlgOpen.InitialDir := A4MainForm.GetUserFilterFolder;
  if dlgOpen.Execute
  then DatasetFromINI(srcFilter.DataSet, dlgOpen.filename);
end;

procedure TTaskFilterForm.btnSaveClick(Sender: TObject);
var
  filename: string;
begin
  filename := InputBox(rsInputFilterName, rsTitle, rsFilter);
  if Length(filename) = 0
  then exit;
  SaveFilter(rsTaskFilter + filename);
end;

procedure TTaskFilterForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsExecutor.Active
  then dsExecutor.Close;
end;

procedure TTaskFilterForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then actOkExecute(Sender);
end;

procedure TTaskFilterForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: boolean;
begin
  if (Key = #13)
  then begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh)
    then go := not(ActiveControl as TDBLookupComboboxEh).ListVisible;
    if (ActiveControl is TDBGridEh)
    then go := False;

    if go
    then begin
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TTaskFilterForm.FormShow(Sender: TObject);
begin
  chkAllUsers.Visible := dmMain.AllowedAction(rght_Tasks_All);

  dsExecutor.Open;
  if srcFilter.DataSet.RecordCount > 1
  then srcFilter.DataSet.First;
end;

procedure TTaskFilterForm.luWorkEnter(Sender: TObject);
begin
  if (Sender is TDBLookupComboboxEh)
  then begin
    if not(Sender as TDBLookupComboboxEh).ListSource.DataSet.Active
    then
      (Sender as TDBLookupComboboxEh).ListSource.DataSet.Open;

  end;

end;

procedure TTaskFilterForm.SpeedButton3Click(Sender: TObject);
begin
  with srcFilter.DataSet do begin
    if Active
    then begin
      DisableControls;
      Close;
      Open;
      (srcFilter.DataSet as TmemTableEh).EmptyTable;
      EnableControls;
    end
    else Open;
  end;
end;

procedure TTaskFilterForm.srcFilterDataChange(Sender: TObject; Field: TField);
begin
  if srcFilter.DataSet['next_condition'] = 0
  then lblOrAND.Caption := rsOR
  else lblOrAND.Caption := rsAND;
  lblOrAND.Visible := srcFilter.DataSet.RecNo > 1;
end;

procedure TTaskFilterForm.CheckDateAndCorrect();
var
  d1, d2: TDate;
begin
  if (not srcFilter.DataSet.FieldByName('PLAN_FROM').IsNull and not srcFilter.DataSet.FieldByName('PLAN_TO').IsNull)
  then begin
    if (srcFilter.DataSet['PLAN_FROM'] > srcFilter.DataSet['PLAN_TO'])
    then begin
      d1 := srcFilter.DataSet['PLAN_FROM'];
      d2 := srcFilter.DataSet['PLAN_TO'];
      srcFilter.DataSet.Edit;
      srcFilter.DataSet['PLAN_TO'] := d1;
      srcFilter.DataSet['PLAN_FROM'] := d2;
      srcFilter.DataSet.post;
    end;
  end;

  if (not srcFilter.DataSet.FieldByName('EXEC_FROM').IsNull and not srcFilter.DataSet.FieldByName('EXEC_TO').IsNull)
  then begin
    if (srcFilter.DataSet['EXEC_FROM'] > srcFilter.DataSet['EXEC_TO'])
    then begin
      d1 := srcFilter.DataSet['EXEC_FROM'];
      d2 := srcFilter.DataSet['EXEC_TO'];
      srcFilter.DataSet.Edit;
      srcFilter.DataSet['EXEC_TO'] := d1;
      srcFilter.DataSet['EXEC_FROM'] := d2;
      srcFilter.DataSet.post;
    end;
  end;
end;

procedure TTaskFilterForm.actOkExecute(Sender: TObject);
begin
  if srcFilter.DataSet.State in [dsEdit, dsInsert]
  then srcFilter.DataSet.post;

  CheckDateAndCorrect();

  if chkDefaultFilter.Checked
  then SaveFilter('TaskDefault');
  ModalResult := mrOk;
end;

end.
