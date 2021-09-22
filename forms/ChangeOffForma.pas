unit ChangeOffForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrlsEh, Mask, DBLookupEh, DB, FIBDataSet,
  pFIBDataSet, Buttons, ExtCtrls, Vcl.DBCtrls, DBGridEh;

type
  TChangeOffForm = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    srcServiceOff: TDataSource;
    dsServiceOff: TpFIBDataSet;
    ServiceOff: TDBLookupComboboxEh;
    Label2: TLabel;
    pnlQUANT: TPanel;
    Label5: TLabel;
    lblDimension: TDBText;
    eUNITS: TDBNumberEditEh;
    procedure bbOkClick(Sender: TObject);
    procedure ServiceOffChange(Sender: TObject);
  private
  public
  end;

function SelectOffService(const ForService: Integer; var OFF_SERVICE: Integer; var Units: Double): Boolean;

implementation

uses DM;

{$R *.dfm}

function SelectOffService(const ForService: Integer; var OFF_SERVICE: Integer; var Units: Double): Boolean;
begin
  Result := False;
  with TChangeOffForm.Create(Application) do
    try
      dsServiceOff.ParamByName('SRV').AsInteger := ForService;
      dsServiceOff.Open;
      if ShowModal = mrOk then
      begin
        if VarIsNumeric(ServiceOff.Value) then
        begin
          OFF_SERVICE := ServiceOff.Value;
          if pnlQUANT.Visible then
          begin
            if VarIsNumeric(eUNITS.Value) then
              Units := eUNITS.Value
            else
              Units := 0;
          end
          else
            Units := 1;
          Result := True;
        end;
      end;
      dsServiceOff.Close;
    finally
      Free;
    end;
end;

procedure TChangeOffForm.bbOkClick(Sender: TObject);
begin
  if VarIsNull(ServiceOff.Value) then
  begin
    ServiceOff.SetFocus;
    ModalResult := mrNone;
    Exit;
  end;

  if pnlQUANT.Visible and VarIsNull(eUNITS.Value) then
  begin
    eUNITS.SetFocus;
    ModalResult := mrNone;
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TChangeOffForm.ServiceOffChange(Sender: TObject);
begin
  try
    pnlQUANT.Visible := (dsServiceOff['Srv_Type_Id'] = 2);
  except
  end;
end;

end.
