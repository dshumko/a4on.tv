unit CardSerialsForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, DB, FIBDataSet, pFIBDataSet, Menus, ComCtrls, ToolWin,
  GridsEh, DBGridEh, ToolCtrlsEh, DBGridEhToolCtrls,
  DBAxisGridsEh, PrjConst, System.UITypes, System.Actions, EhLibVCL,
  DBGridEhGrouping, DynVarsEh;

type
  TfmCardPaySerials = class(TForm)
    dbgrdhGrid: TDBGridEh;
    tlb1: TToolBar;
    btn1: TToolButton;
    btnNew: TToolButton;
    btn3: TToolButton;
    btnEdit: TToolButton;
    btn5: TToolButton;
    btnDelete: TToolButton;
    mm1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    actPaymentEdit1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    srcSerials: TDataSource;
    dsserials: TpFIBDataSet;
    actlstactions: TActionList;
    actNew: TAction;
    actDelete: TAction;
    actEdit: TAction;
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCardPaySerials: TfmCardPaySerials;

implementation

uses
  MAIN, CardSerialForma;

{$R *.dfm}

procedure TfmCardPaySerials.actNewExecute(Sender: TObject);
var
  i:int64;
begin
  i:= EditCardSerial(-1);
  if i <> -1
  then begin
    dsserials.CloseOpen(True);
    dsserials.Locate('Cs_Id',VarArrayOf([i]),[]);
  end;
end;

procedure TfmCardPaySerials.actEditExecute(Sender: TObject);
var
  i:int64;
begin
  i:= EditCardSerial(dsserials['Cs_Id']);
  if i <> -1
  then begin
    dsserials.refresh;
  end;
end;

procedure TfmCardPaySerials.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsserials.Close;
  fmCardPaySerials:= nil;
  Action := caFree;
end;

procedure TfmCardPaySerials.FormShow(Sender: TObject);
begin
  dsserials.Open;
end;

procedure TfmCardPaySerials.actDeleteExecute(Sender: TObject);
begin
  if (MessageDlg(rsDeletePayCardSerial, mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then dsserials.Delete;
end;

end.
