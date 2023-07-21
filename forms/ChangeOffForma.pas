unit ChangeOffForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls,
  DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, DBGridEh;

type
  TChangeOffForm = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    srcServiceOff: TDataSource;
    dsServiceOff: TpFIBDataSet;
    pnlQUANT: TPanel;
    Label5: TLabel;
    lblDimension: TDBText;
    eUNITS: TDBNumberEditEh;
    pnlTop: TPanel;
    Label1: TLabel;
    ServiceOff: TDBLookupComboboxEh;
    pnlMmo: TPanel;
    mmoNotice: TDBMemoEh;
    procedure bbOkClick(Sender: TObject);
    procedure ServiceOffChange(Sender: TObject);
  private
  public
  end;

function SelectOffService(const ForService: Integer; var OFF_SERVICE: Integer; var Units: Double; var Notice: String): Boolean;

implementation

uses
  DM;

{$R *.dfm}

function SelectOffService(const ForService: Integer; var OFF_SERVICE: Integer; var Units: Double; var Notice: String): Boolean;
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
          Notice := mmoNotice.Lines.Text;
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
