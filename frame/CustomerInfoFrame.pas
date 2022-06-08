unit CustomerInfoFrame;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Dm, PrjConst, A4onTypeUnit;

type
  TCustomerInfoFrm = class(TFrame)
    gbInfo: TGroupBox;
    lblFIO: TLabel;
    lblDebt: TLabel;
    memAbonent: TMemo;
  private
    { Private declarations }
    ci : TCustomerInfo;
    procedure SetCI(Value : TCustomerInfo);
  public
    { Public declarations }
    property Customer : TCustomerInfo read ci write SetCI;
  end;

implementation

{$R *.dfm}
procedure TCustomerInfoFrm.SetCI(Value : TCustomerInfo);
var
  clr : TColor;
  s : string;
begin
  ci := Value;
  memAbonent.Lines.Clear;
  lblFIO.Caption  := '';
  lblDEBT.Caption := '';

  if Value.CUSTOMER_ID = -1
  then begin
    lblFIO.Caption := rsNOT_FOUND_CUST;
    exit;
  end;

  lblFIO.Caption := Value.Account_no + ' ' +Value.FIO;

  if (dmMain.AllowedAction(rght_Customer_Debt)) or (dmMain.AllowedAction(rght_Customer_full)) // просмотр сумм
  then begin
    if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1')
    then s := rsBALANCE+' '+floatToStr(Value.Debt_sum)
    else s := rsSALDO+' '+floatToStr(Value.Debt_sum);
    lblDebt.Caption := s;
  end;
  s := '' + Value.Street+' '+ Value.HOUSE_NO+' '+ Value.flat_No;
  memAbonent.Lines.Add(s);
  memAbonent.Lines.Add(Value.CUST_STATE_DESCR);
  memAbonent.Lines.Add(Value.notice);
  s := rsCode + ' ' + Value.cust_code;
  memAbonent.Lines.Insert(0,s);
  memAbonent.Lines.Delete(memAbonent.Lines.Count-1);
  if Value.color <> '' then Clr := StringToColor(Value.color)
  else clr := clBtnFace;

  memAbonent.Color := clr;
  lblFIO.Color     := clr;
  lblDebt.Color    := clr;
  gbInfo.Color     := clr;
end;

end.
