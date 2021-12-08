unit WireForma;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GridForma, System.UITypes,
  ToolCtrlsEh, DBGridEhToolCtrls, CnErrorProvider, Vcl.Menus,
  System.Actions, Vcl.ActnList, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, FIBDataSet, pFIBDataSet, frxClass,
  DBGridEhGrouping, DynVarsEh, FIBDatabase, pFIBDatabase, MemTableDataEh,
  MemTableEh;

type
  TWireForm = class(TGridForm)
    dsWire: TpFIBDataSet;
    btn1: TToolButton;
    btnPrint: TToolButton;
    actPrint: TAction;
    frxReport: TfrxReport;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    pmFilter: TPopupMenu;
    N31: TMenuItem;
    N53: TMenuItem;
    N42: TMenuItem;
    N36: TMenuItem;
    btnFilterNew: TToolButton;
    actEnableFilter: TAction;
    actFilterSet: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    function frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
  private
    FFullAccess: Boolean;
    procedure InitForm;
    procedure InitSecurity;
  public
    { Public declarations }
  end;

var
  WireForm: TWireForm;

implementation

uses
  MAIN, DM, A4onTypeUnit, PrjConst, NodeLinkForma;

const
  const_default_filter: string = ' 1=1 ';

{$R *.dfm}

procedure TWireForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dsWire.Close;
  WireForm := nil;
end;

procedure TWireForm.InitSecurity;
var
  s: String;
begin
  inherited;
  FFullAccess := (dmMain.AllowedAction(rght_Dictionary_Nodes));
  // Экспорт информации
  pmgSaveSelection.Visible := (dmMain.AllowedAction(rght_Export));

  actDelete.Enabled := dmMain.AllowedAction(rght_Dictionary_Nodes) or FFullAccess;
  actEdit.Enabled := dmMain.AllowedAction(rght_Dictionary_Nodes) or FFullAccess;
  actNew.Enabled := dmMain.AllowedAction(rght_Dictionary_Nodes) or FFullAccess;
end;

procedure TWireForm.InitForm;
begin
  //
end;

procedure TWireForm.FormShow(Sender: TObject);
begin
  inherited;
  InitForm;
  InitSecurity;

  dsWire.Open;
end;

procedure TWireForm.actEditExecute(Sender: TObject);
var
  LinkItem, SecondItem: TNodeLinkItem;
begin
  inherited;

  if (not dsWire.Active) then
    Exit;

  LinkItem.LINK_ID := dsWire['WID'];
  if not dsWire.FieldByName('NODE_S_ID').IsNull then
  begin
    LinkItem.NODE_ID := dsWire['NODE_S_ID'];
    LinkItem.NODE_Name := dsWire['NODE_S'];
  end
  else
  begin
    LinkItem.NODE_ID := -1;
    LinkItem.NODE_Name := '';
  end;

  SecondItem.LINK_ID := dsWire['WID'];
  if not dsWire.FieldByName('NODE_E_ID').IsNull then
  begin
    SecondItem.NODE_ID := dsWire['NODE_E_ID'];
    SecondItem.NODE_Name := dsWire['NODE_E'];
  end
  else
  begin
    SecondItem.NODE_ID := -1;
    SecondItem.NODE_Name := '';
  end;

  if LinkNodes(LinkItem, SecondItem) then
  begin
    dsWire.Refresh;
  end
end;

procedure TWireForm.actNewExecute(Sender: TObject);
var
  LinkItem, SecondItem: TNodeLinkItem;
begin
  inherited;

  if (not dsWire.Active) then
    Exit;

  LinkItem.NODE_ID := -1;
  LinkItem.NODE_Name := '';
  LinkItem.LINK_ID := -1;

  SecondItem.NODE_ID := -1;
  SecondItem.NODE_Name := '';
  SecondItem.LINK_ID := -1;

  if LinkNodes(LinkItem, SecondItem) then
  begin
    dsWire.CloseOpen(true);
    dsWire.Locate('WID', LinkItem.LINK_ID, []);
  end
end;

procedure TWireForm.dbGridGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if not(dsWire.FieldByName('COLOR').IsNull) then
    Background := StringToColor(dsWire['COLOR']);
end;

procedure TWireForm.FormCreate(Sender: TObject);
begin
  inherited;
  dmMain.frxAddFunctions(frxReport);
end;

function TWireForm.frxReportUserFunction(const MethodName: string; var Params: Variant): Variant;
begin
  inherited;
  Result := dmMain.frxReportUserFunction(MethodName, Params);
end;

end.
