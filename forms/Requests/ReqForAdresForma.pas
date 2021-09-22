unit ReqForAdresForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet,
  GridsEh, DBGridEh, StdCtrls, ExtCtrls, ToolCtrlsEh, DBGridEhToolCtrls,
  DBAxisGridsEh, DBGridEhGrouping, DynVarsEh, EhLibVCL;

type
  TReqForAdresForm = class(TForm)
    pnlTime: TPanel;
    dbgSame: TDBGridEh;
    dsSame: TpFIBDataSet;
    srcSame: TDataSource;
    Panel1: TPanel;
    rgShowAs: TRadioGroup;
    rbZV: TRadioButton;
    rbADRS: TRadioButton;
    btn1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure rbZVClick(Sender: TObject);
    procedure rbADRSClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReqForAdresForm: TReqForAdresForm;

procedure ShowReqForAdres(RQ_ID : Integer; HOUSE_ID: Integer; plan_date : TDate);

implementation

uses
  DM;

{$R *.dfm}

procedure ShowReqForAdres(RQ_ID : Integer; HOUSE_ID: Integer; plan_date : TDate);
begin
  if Not Assigned(ReqForAdresForm)
  then ReqForAdresForm:=TReqForAdresForm.Create(Application);
  with ReqForAdresForm do
  begin
    dsSame.ParamByName('FILTER').AsString := ' (exists(select WG_ID from HOUSE where WG_ID = H.WG_ID and HOUSE_ID = :HOUSE_ID)) ';
    dsSame.ParamByName('RQ_ID').AsInteger := RQ_ID;
    dsSame.ParamByName('HOUSE_ID').AsInteger := HOUSE_ID;
    dsSame.ParamByName('RQ_PLAN_DATE').AsDate := plan_date;
    dsSame.Open;
    show;
  end;
end;

procedure TReqForAdresForm.btn1Click(Sender: TObject);
begin
 Close;
end;

procedure TReqForAdresForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  ReqForAdresForm := nil;
end;

procedure TReqForAdresForm.rbADRSClick(Sender: TObject);
begin
    dsSame.Close;
    dsSame.ParamByName('FILTER').AsString := ' ((exists(select H1.HOUSE_ID from HOUSE H1 where H1.HOUSE_ID = R.HOUSE_ID and exists(select h2.STREET_ID from HOUSE h2 where h2.STREET_ID = H1.STREET_ID and HOUSE_ID = :HOUSE_ID)))) ';
    dsSame.Open;
end;

procedure TReqForAdresForm.rbZVClick(Sender: TObject);
begin
    dsSame.Close;
    dsSame.ParamByName('FILTER').AsString := ' ( exists(select WG_ID from HOUSE where WG_ID = H.WG_ID and  HOUSE_ID = :HOUSE_ID)) ';
    dsSame.Open;
end;

end.
