unit SelectColumnsForma;

interface

{$I defines.inc}

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  OkCancel_frame;

type
  TSelectColumnsForm = class(TForm)
    grpMulti: TGroupBox;
    okcnclfrm1: TOkCancelFrame;
    chk1: TCheckBox;
    lblWarning: TLabel;
    chkIP: TCheckBox;
    chkdec: TCheckBox;
    pnl1: TPanel;
    chk7: TCheckBox;
    chk8: TCheckBox;
    chk3: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    Panel1: TPanel;
    CheckBox5: TCheckBox;
    chk5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox1: TCheckBox;
    CheckBox11: TCheckBox;
    chkExtID: TCheckBox;
    CheckBox7: TCheckBox;
    chkMonPay: TCheckBox;
    chk4: TCheckBox;
    CheckBox12: TCheckBox;
    chkPrepay: TCheckBox;
    CheckBox13: TCheckBox;
    chkNPS: TCheckBox;
    chkHE: TCheckBox;
    chkORG: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure okcnclfrm1bbOkClick(Sender: TObject);
    procedure chk4Click(Sender: TObject);
  private
    fMask : Cardinal;
    procedure SetMask(Value : Cardinal);
    function GetMask:Cardinal;
    function SetDefault:Cardinal;
    procedure SetByMask(Value : Cardinal);
    procedure ShowWarning;
  public
    property Columns : Cardinal read GetMask write SetMask;
  end;

function SelectCustomerColumns(Selected:Cardinal):Cardinal;

implementation

{$R *.dfm}

function SelectCustomerColumns(Selected:Cardinal):Cardinal;
var
  SelectColumnsForm: TSelectColumnsForm;
begin
  Result:= Selected;
  // Application.CreateForm(TSelectColumnsForm,SelectColumnsForm);
  SelectColumnsForm := TSelectColumnsForm.Create(Application);
  try
    SelectColumnsForm.Columns := Selected;
    SelectColumnsForm.ShowModal;
    if SelectColumnsForm.ModalResult=mrOk
    then Result:= SelectColumnsForm.Columns;
  finally
    FreeAndNil(SelectColumnsForm);
  end;
end;

procedure TSelectColumnsForm.SetMask(Value : Cardinal);
begin
  if Value = 0 then fMask := SetDefault
  else begin
    SetByMask(Value);
    fMask := Value;
  end;
end;

procedure TSelectColumnsForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then okcnclfrm1bbOkClick(Sender);
end;

function TSelectColumnsForm.GetMask:Cardinal;
var
  i: Cardinal;
  mask : Cardinal;
begin
  mask := 0;

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TCheckBox
    then
      if (Components[i] as TCheckBox).Checked
      then mask := mask or Cardinal((Components[i] as TCheckBox).Tag);

  Result := mask;
end;

procedure TSelectColumnsForm.okcnclfrm1bbOkClick(Sender: TObject);
begin
  okcnclfrm1.actExitExecute(Sender);

end;

function TSelectColumnsForm.SetDefault:Cardinal;
var
  mask : Integer;
begin
  mask := 0;
  mask := mask or 2;  // ИО
  mask := mask or 4;  // телефон
  mask := mask or 16;  // Код
  mask := mask or 32;  // Примечание
  mask := mask or 64;  // Подъезд
  mask := mask or 16384; // Статус
  SetByMask(mask);
  Result := mask;
end;

procedure TSelectColumnsForm.SetByMask(Value : Cardinal);
var
  i: Cardinal;
  j : Cardinal;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TCheckBox
    then begin
      j := (Components[i] as TCheckBox).Tag ;
      j := j and Value;
      (Components[i] as TCheckBox).Checked := (j <> 0);
    end;
end;

procedure TSelectColumnsForm.chk4Click(Sender: TObject);
begin
  ShowWarning;
end;

procedure TSelectColumnsForm.FormCreate(Sender: TObject);
begin
  {$IFNDEF DIGIT}
    chkdec.Visible := False;
    chkdec.Checked := False;
  {$ENDIF}
  {$IFNDEF LAN}
    chkIP.Visible := False;
    chkIP.Checked := False;
  {$ENDIF}
end;

procedure TSelectColumnsForm.ShowWarning;
begin
  lblWarning.Visible := chk1.Checked or chkdec.Checked or chkIP.Checked or chk4.Checked;
end;

end.
