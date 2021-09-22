unit DBEditor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MemTableDataEh, Data.DB, MemTableEh,
  Vcl.ExtCtrls, ToolCtrlsEh, DBGridEhToolCtrls,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.StdCtrls, Vcl.Buttons, Vcl.Menus,
  Vcl.Mask, DBCtrlsEh, System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin,
  DBGridEhGrouping, DynVarsEh, EhLibVCL;

type
  TfmDBEditor = class(TForm)
    temp: TMemTableEh;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    dsTemp: TDataSource;
    dbgTemp: TDBGridEh;
    pmTemp: TPopupMenu;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edName: TDBEditEh;
    edIP: TDBEditEh;
    edDB: TDBEditEh;
    dlgOpen1: TOpenDialog;
    btnFln: TSpeedButton;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    actAdd: TAction;
    ActEdit: TAction;
    ActDel: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure tempAfterScroll(DataSet: TDataSet);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnFlnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure ActEditExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure dbgTempDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDBEditor: TfmDBEditor;

implementation

uses
  MAIN;
{$R *.dfm}

procedure TfmDBEditor.actAddExecute(Sender: TObject);
begin
  pnl3.Tag := 1;
  edName.Text := '';
  edIP.Text := '';
  edDB.Text := '';
  edName.ReadOnly := False;
  edIP.ReadOnly := False;
  edDB.ReadOnly := False;
  btnFln.Visible := True;
  pnl4.Visible := True;
  dbgTemp.Enabled := False;
  edName.SetFocus;
end;

procedure TfmDBEditor.ActDelExecute(Sender: TObject);
var
  i: Integer;
begin
  i := Application.MessageBox('Вы хотите удалить базу данных?', 'Внимание', MB_ICONWARNING + MB_YESNO + MB_DEFBUTTON2 + MB_SYSTEMMODAL);
  if (i = 6) then
    temp.Delete;
end;

procedure TfmDBEditor.ActEditExecute(Sender: TObject);
begin
  edName.ReadOnly := False;
  edIP.ReadOnly := False;
  edDB.ReadOnly := False;
  pnl4.Visible := True;
  btnFln.Visible := True;
  dbgTemp.Enabled := False;
  edName.SetFocus;
end;

procedure TfmDBEditor.btnCancelClick(Sender: TObject);
begin
  edName.ReadOnly := True;
  edIP.ReadOnly := True;
  edDB.ReadOnly := True;
  pnl4.Visible := False;
  btnFln.Visible := False;
  dbgTemp.Enabled := True;
  tempAfterScroll(temp);
end;

procedure TfmDBEditor.btnFlnClick(Sender: TObject);
begin
  if dlgOpen1.Execute then
    if FileExists(dlgOpen1.FileName) then
      edDB.Text := dlgOpen1.FileName;
end;

procedure TfmDBEditor.btnOKClick(Sender: TObject);
begin
  if pnl3.Tag = 1 then
    temp.Append
  else
    temp.Edit;
  temp.FieldByName('NAME').AsString := edName.Text;
  temp.FieldByName('IP').AsString := edIP.Text;
  temp.FieldByName('WAY').AsString := edDB.Text;
  temp.Post;
  edName.ReadOnly := True;
  edIP.ReadOnly := True;
  edDB.ReadOnly := True;
  pnl4.Visible := False;
  btnFln.Visible := False;
  dbgTemp.Enabled := True;
  pnl3.Tag := 0;
end;

procedure TfmDBEditor.dbgTempDblClick(Sender: TObject);
begin
  if temp.RecordCount = 0
  then actAdd.Execute
  else ActEdit.Execute;
end;

procedure TfmDBEditor.FormActivate(Sender: TObject);
begin
  Left := (Screen.Monitors[0].Width - Width) div 2;
  Top := (Screen.Monitors[0].Height - Height) div 2;
end;

procedure TfmDBEditor.tempAfterScroll(DataSet: TDataSet);
begin
  if (pnl3.Tag <> 1) then
  begin
    edName.Text := temp.FieldByName('NAME').AsString;
    edIP.Text := temp.FieldByName('IP').AsString;
    edDB.Text := temp.FieldByName('WAY').AsString;
  end;
end;

end.
