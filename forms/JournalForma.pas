unit JournalForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  FIBDataSet, pFIBDataSet, GridsEh, DBGridEh, EhLibFIB, DBGridEhFindDlgs, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, EhLibVCL,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase;

type
  TJournalForm = class(TForm)
    dbgrdJournal: TDBGridEh;
    srcJournal: TDataSource;
    dsJournal: TpFIBDataSet;
    trRead: TpFIBTransaction;
    procedure dbgrdJournalSortMarkingChanged(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFirstOpen : Boolean;
  public
    { Public declarations }
  end;

var
  JournalForm: TJournalForm;

implementation

uses
  DM;

{$R *.dfm}

procedure TJournalForm.dbgrdJournalSortMarkingChanged(Sender: TObject);
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

procedure TJournalForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsJournal.Close;
  JournalForm := nil;
  Action:= caFree;
end;

procedure TJournalForm.FormCreate(Sender: TObject);
begin
  FFirstOpen := True;
end;

procedure TJournalForm.FormShow(Sender: TObject);
begin
  dsJournal.Open;
end;

end.
