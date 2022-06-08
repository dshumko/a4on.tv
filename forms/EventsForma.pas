unit EventsForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.Mask,
  FIBDataSet, pFIBDataSet, GridsEh, DBGridEh, EhLibFIB, DBGridEhFindDlgs, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh,
  DBCtrlsEh, DBLookupEh, PrjConst, EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  TEventsForm = class(TForm)
    dbgrdJournal: TDBGridEh;
    srcJournal: TDataSource;
    dsJournal: TpFIBDataSet;
    actlst1: TActionList;
    actAdd: TAction;
    actDelete: TAction;
    dsWorker: TpFIBDataSet;
    srcWorker: TDataSource;
    tbEvents: TToolBar;
    ToolButton4: TToolButton;
    btnAdd: TToolButton;
    ToolButton5: TToolButton;
    btnEdit: TToolButton;
    ToolButton6: TToolButton;
    ToolButton2: TToolButton;
    ToolButton9: TToolButton;
    tbOk: TToolButton;
    ToolButton10: TToolButton;
    tbCancel: TToolButton;
    actEdit: TAction;
    pmGrid: TPopupMenu;
    N1: TMenuItem;
    pnlEdit: TPanel;
    DBLookupComboboxEh1: TDBLookupComboboxEh;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    DBMemo1: TDBMemoEh;
    btnSaveLink: TBitBtn;
    btnCancelLink: TBitBtn;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    procedure dbgrdJournalSortMarkingChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure tbOkClick(Sender: TObject);
    procedure tbCancelClick(Sender: TObject);
    procedure srcJournalStateChange(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure btnSaveLinkClick(Sender: TObject);
    procedure btnCancelLinkClick(Sender: TObject);
  private
    { Private declarations }
    CanEdit    : Boolean;
    procedure StartEdit(const New : Boolean = True);
    procedure StopEdit(const Cancel : Boolean);
  public
    { Public declarations }
  end;

var
  EventsForm: TEventsForm;

implementation

uses
  DM, MAIN;

{$R *.dfm}

procedure TEventsForm.actAddExecute(Sender: TObject);
begin
  StartEdit(True);
end;

procedure TEventsForm.actDeleteExecute(Sender: TObject);
var
  i:integer;

begin
  if dsJournal.RecordCount = 0 then exit;


  if (MessageDlg(rsDeleteSelectedRecords, mtConfirmation, [mbYes, mbNo], 0) = mrNo)
  then exit;

  if (dbgrdJournal.SelectedRows.Count>1)
  then begin
    try
      Screen.Cursor := crHourGlass;
      for i:=0 to (dbgrdJournal.SelectedRows.Count-1) do
        begin
          dbgrdJournal.DataSource.DataSet.GotoBookmark(pointer(dbgrdJournal.SelectedRows.Items[i]));
          dbgrdJournal.DataSource.DataSet.Delete;
        end;
    finally
      Screen.Cursor := crDefault;
    end
  end
  else dbgrdJournal.DataSource.DataSet.Delete;

  dsJournal.CloseOpen(true);

end;

procedure TEventsForm.actEditExecute(Sender: TObject);
begin
    StartEdit(False);
end;

procedure TEventsForm.btnCancelLinkClick(Sender: TObject);
begin
  StopEdit(True);
end;

procedure TEventsForm.btnSaveLinkClick(Sender: TObject);
begin
  StopEdit(False);
end;

procedure TEventsForm.dbgrdJournalSortMarkingChanged(Sender: TObject);
var
  cr:TCursor;
  s : string;
  I,J  : integer;
  Grid : TCustomDBGridEh;
  FIBDS : TpFibDataset;
begin
  cr:= Screen.Cursor;
  Screen.Cursor := crSqlWait;
  Grid:=TCustomDBGridEh(Sender);
  FIBDS :=  TpFibDataset(Grid.DataSource.DataSet);
  FIBDS.Close;
  if Sender is TCustomDBGridEh
  then begin
    J:=Grid.SortMarkedColumns.Count;
    s := ' ';
    for i:=0 to pred(j) do begin
      S := s + Grid.SortMarkedColumns[i].fieldname;
      //s := s + ' COLLATE UNICODE_CI_AI ';
      if Grid.SortMarkedColumns[i].Title.SortMarker=smDownEh
      then s := S + ' desc';
      if i <> pred(j) then s := s + ', ';
    end;
    FIBDS.OrderClause := s;
  end;
  FIBDS.Open;
  Screen.Cursor := cr;
end;

procedure TEventsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsJournal.State in [dsInsert, dsEdit] then dsJournal.Post;
  dsJournal.Close;
  dsWorker.Close;
  EventsForm := nil;
  Action:= caFree;
end;

procedure TEventsForm.FormShow(Sender: TObject);
begin
  dsWorker.Open;
  dsJournal.Open;
  CanEdit           := dmMain.AllowedAction(rght_Programm_ChangePswd);
  actAdd.Visible    := CanEdit;
  actEdit.Visible   := CanEdit;
  actDelete.Visible := CanEdit;
end;

procedure TEventsForm.srcJournalStateChange(Sender: TObject);
begin
  tbOk.Enabled      := not ((sender as TDataSource).DataSet.State = dsBrowse);
  tbCancel.Enabled  := tbOk.Enabled;
  actAdd.Enabled    := not tbOk.Enabled;
  actEdit.Enabled   := not tbOk.Enabled;
  actDelete.Enabled := not tbOk.Enabled;
end;

procedure TEventsForm.tbCancelClick(Sender: TObject);
begin
  StopEdit(true);
end;

procedure TEventsForm.tbOkClick(Sender: TObject);
begin
  dsJournal.Post;
end;

procedure TEventsForm.StartEdit(const New : Boolean = True);
begin
  if not CanEdit then Exit;
  pnlEdit.Visible := True;
  dbgrdJournal.Enabled := False;
  tbEvents.Enabled  := False;
  if New
  then dsJournal.Append
  else dsJournal.Edit;
end;

procedure TEventsForm.StopEdit(const Cancel : Boolean);
begin
  pnlEdit.Visible := False;
  dbgrdJournal.Enabled := True;
  tbEvents.Enabled  := True;
  if (Cancel) or (not CanEdit)
  then dsJournal.Cancel
  else
    if CanEdit
    then dsJournal.Post
    else dsJournal.Cancel;
end;


end.
