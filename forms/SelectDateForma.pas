unit SelectDateForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  frmDateSelect;

type
  TSelectDateForm = class(TForm)
    frDates: TfrmRequestDate;
    pnlBTNS: TPanel;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    procedure frDatessgCalendarDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    fHOUSE: Integer;
    fTYPE: Integer;
    procedure SetHouse(Value: Integer);
    procedure SetType(Value: Integer);
    function GetSelectedDate: TDate;
  public
    property House: Integer write SetHouse;
    property RTYPE: Integer write SetType;
    property SelectedDate: TDate read GetSelectedDate;
  end;

function SelectRequestDate(const HOUSE_ID: Integer; const TYPE_ID: Integer; var Date: TDate): Boolean;

implementation

{$R *.dfm}

function SelectRequestDate(const HOUSE_ID: Integer; const TYPE_ID: Integer; var Date: TDate): Boolean;
begin
  Result := False;
  with TSelectDateForm.Create(Application) do
    try
      House := HOUSE_ID;
      RTYPE := TYPE_ID;
      if ShowModal = mrOk
      then begin
        Date := SelectedDate;
        Result := True;
      end;
    finally Free;
    end;
end;

procedure TSelectDateForm.SetHouse(Value: Integer);
begin
  fHOUSE := Value;
  frDates.House := Value;
end;

procedure TSelectDateForm.SetType(Value: Integer);
begin
  fTYPE := Value;
  frDates.RTYPE := Value;
end;

procedure TSelectDateForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then ModalResult := mrOk;
end;

procedure TSelectDateForm.frDatessgCalendarDblClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function TSelectDateForm.GetSelectedDate: TDate;
begin
  Result := frDates.SelectedDate;
end;

end.
