unit QueryForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Menus,
  GridsEh, DBGridEh, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, SynEditHighlighter, SynHighlighterSQL, SynEdit,
  pFIBScripter, SynEditMiscClasses, SynEditSearch, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh,
  PrjConst,
  EhLibVCL, DBGridEhGrouping, DynVarsEh, amSplitter;

type
  TQueryForm = class(TForm)
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    SynSQLSyn1: TSynSQLSyn;
    transaction: TpFIBTransaction;
    SpeedButton2: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SpeedButton3: TSpeedButton;
    SaveDialog1: TSaveDialog;
    FIBScript: TpFIBScripter;
    pc: TPageControl;
    tsResultScript: TTabSheet;
    seScript: TSynEdit;
    tsResultSelect: TTabSheet;
    memResult: TMemo;
    Splitter1: TSplitter;
    DBGridEh1: TDBGridEh;
    source: TDataSource;
    DataSet: TpFIBDataSet;
    gridPopUp: TPopupMenu;
    ppmCopy: TMenuItem;
    ppmSelectAll: TMenuItem;
    MenuItem1: TMenuItem;
    ppmSaveSelection: TMenuItem;
    syndtsrch1: TSynEditSearch;
    pmMemo: TPopupMenu;
    miCut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    SelectAll1: TMenuItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FIBScriptExecuteError(Sender: TObject; StatementNo, Line: Integer; Statement: TStrings; SQLCode: Integer;
      const Msg: String; var doRollBack, Stop: Boolean);
    procedure ppmSaveSelectionClick(Sender: TObject);
    procedure ppmCopyClick(Sender: TObject);
    procedure ppmSelectAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  QueryForm: TQueryForm;

implementation

uses
  DM, MAIN, atrStrUtils;

{$R *.dfm}

procedure TQueryForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DataSet.Active then
    DataSet.Close;
  Action := caFree;
  QueryForm := nil;
end;

procedure TQueryForm.ppmCopyClick(Sender: TObject);
var
  dbg: TDBGridEh;

begin

  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
        A4MainForm.CopyDBGrid(dbg)
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TQueryForm.ppmSaveSelectionClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    A4MainForm.ExportDBGrid((ActiveControl as TDBGridEh), rsTable);
end;

procedure TQueryForm.ppmSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TQueryForm.SpeedButton1Click(Sender: TObject);
var
  crs: TCursor;
  c: Boolean;
  i: Integer;
  itsSelect: Boolean;
begin
  crs := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  FIBScript.Script.Assign(seScript.Lines);
  itsSelect := False;
  FIBScript.Parse();
  i := FIBScript.StatementsCount;
  if i = 1 then
    itsSelect := (Pos('SELECT', Trim(AnsiUpperCase(FIBScript.Script.Text))) = 1);

  c := FIBScript.Database.Connected;
  if not c then
    FIBScript.Database.Open;

  if itsSelect then
  begin
    if DataSet.Active then
      DataSet.Close;
    pc.ActivePage := tsResultSelect;
    DataSet.SelectSQL.Text := FIBScript.Script.Text;
    DataSet.Open;
  end
  else
  begin
    pc.ActivePage := tsResultScript;
    memResult.Lines.clear;
    FIBScript.ExecuteScript(1);
    if FIBScript.transaction.InTransaction then
      FIBScript.transaction.Commit;
    memResult.Lines.Add(rsQueryCompite);
  end;
  Screen.Cursor := crs;
end;

procedure TQueryForm.SpeedButton2Click(Sender: TObject);
var
  myEncoding: TEncoding;
begin
  if OpenDialog1.Execute then
  begin
    // myEncoding := TEncoding.Default;
    myEncoding := TEncoding.UTF8;
    seScript.Lines.LoadFromFile(OpenDialog1.FileName, myEncoding);
  end;

end;

procedure TQueryForm.SpeedButton3Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    seScript.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TQueryForm.FIBScriptExecuteError(Sender: TObject; StatementNo, Line: Integer; Statement: TStrings;
  SQLCode: Integer; const Msg: String; var doRollBack, Stop: Boolean);
begin
  memResult.Lines.Add(format(rsErrorInLine, [Line, Statement.Text]));
  Stop := ((MessageDlg(format(rsErrorQuestWT, [Statement.Text]), mtConfirmation, [mbYes, mbNo], 0) = mrNo));

end;

end.
