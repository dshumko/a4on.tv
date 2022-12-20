unit CustomerInfoFrame;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Dm, PrjConst, A4onTypeUnit, Vcl.Mask, DBCtrlsEh;

type
  TCustomerInfoFrm = class(TFrame)
    gbInfo: TGroupBox;
    memAbonent: TMemo;
    lblFIO: TDBEditEh;
    lblDebt: TDBEditEh;
  private
    { Private declarations }
    ci: TCustomerInfo;
    procedure SetCI(Value: TCustomerInfo);
  public
    { Public declarations }
    property Customer: TCustomerInfo read ci write SetCI;
  end;

implementation

{$R *.dfm}

procedure TCustomerInfoFrm.SetCI(Value: TCustomerInfo);
var
  clr: TColor;
  s: string;
begin
  ci := Value;
  memAbonent.Lines.Clear;
  lblFIO.Text := '';
  lblDebt.Text := '';

  if Value.CUSTOMER_ID = -1 then
  begin
    lblFIO.Text := rsNOT_FOUND_CUST;
    exit;
  end;

  lblFIO.Text := Value.Account_no + ' ' + Value.FIO;

  if (dmMain.AllowedAction(rght_Customer_Debt)) or (dmMain.AllowedAction(rght_Customer_full)) // просмотр сумм
  then
  begin
    if (dmMain.GetSettingsValue('SHOW_AS_BALANCE') = '1') then
      s := rsBALANCE + ': ' + floatToStr(Value.Debt_sum)
    else
      s := rsSALDO + ': ' + floatToStr(Value.Debt_sum);
    lblDebt.Text := s;
  end;

  s := '' + Value.Street + ' д.' + Value.HOUSE_NO;
  if not Value.flat_No.IsEmpty then
    s := s + ' кв.' + Value.flat_No;
  if not Value.City.IsEmpty then
    s := s + ' (' + Value.City + ')';

  memAbonent.Lines.Add(s);
  memAbonent.Lines.Add(Value.CUST_STATE_DESCR);
  memAbonent.Lines.Add(Value.notice);
  s := rsCode + ' ' + Value.cust_code;
  memAbonent.Lines.Insert(0, s);
  memAbonent.Lines.Delete(memAbonent.Lines.Count - 1);
  if Value.color <> '' then
    clr := StringToColor(Value.color)
  else
    clr := clBtnFace;

  memAbonent.color := clr;
  lblFIO.color := clr;
  lblDebt.color := clr;
  gbInfo.color := clr;
end;

end.
