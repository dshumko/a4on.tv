unit monitoringUnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Menus,
  DBGridEh, GridsEh, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, SynEditHighlighter, SynHighlighterSQL, SynEdit,
  SynDBEdit, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, EhLibVCL, DBGridEhGrouping, DynVarsEh, amSplitter;

type
  TMonDBForm = class(TForm)
    DBGridEh1: TDBGridEh;
    Splitter1: TSplitter;
    dsAttachments: TDataSource;
    dsTransactions: TDataSource;
    dsTransactionsStatments: TDataSource;
    qrAttachments: TpFIBDataSet;
    trAttachments: TpFIBTransaction;
    trR: TpFIBTransaction;
    trR2: TpFIBTransaction;
    qrTransactions: TpFIBDataSet;
    qrTransactionsStatments: TpFIBDataSet;
    trWriteQ: TpFIBTransaction;
    Panel3: TPanel;
    Splitter2: TSplitter;
    DBGridEh2: TDBGridEh;
    Panel4: TPanel;
    DBGridEh3: TDBGridEh;
    pmStatment: TPopupMenu;
    N1: TMenuItem;
    pmAttach: TPopupMenu;
    N2: TMenuItem;
    dbsyndt1: TDBSynEdit;
    synsqlsyn2: TSynSQLSyn;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    procedure RefreshAttachments;
  public
    { Public declarations }
  end;

var
  MonDBForm: TMonDBForm;

implementation

uses
  DM, prjConst;

{$R *.dfm}

procedure TMonDBForm.RefreshAttachments;
begin
  qrAttachments.Open;
  qrTransactions.Open;
  qrTransactionsStatments.Open;
end;

procedure TMonDBForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qrTransactionsStatments.Close;
  qrTransactions.Close;
  qrAttachments.Close;
  MonDBForm := nil;
  Action := caFree;
end;

procedure TMonDBForm.FormShow(Sender: TObject);
begin
  RefreshAttachments;
end;

procedure TMonDBForm.N1Click(Sender: TObject);
begin
  qrTransactionsStatments.UpdateTransaction.StartTransaction;
  qrTransactionsStatments.Delete;
  qrTransactionsStatments.UpdateTransaction.Commit;
end;

procedure TMonDBForm.N2Click(Sender: TObject);
begin
  RefreshAttachments;
end;

procedure TMonDBForm.N4Click(Sender: TObject);
begin
  if (not qrAttachments.Active) or (qrAttachments.RecordCount = 0) then
    exit;

  if Application.MessageBox(PWideChar(format(rsDisconnect, [qrAttachments.FieldByName('MON$USER').AsString])),
    PWideChar(rsAplicationName), MB_OKCANCEL + MB_ICONQUESTION + MB_DEFBUTTON2) = IDOK then
    qrAttachments.Delete;
end;

end.
