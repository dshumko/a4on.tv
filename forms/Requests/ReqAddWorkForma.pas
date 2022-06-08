unit ReqAddWorkForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  DBGridEh, DBCtrlsEh, DBLookupEh, FIBDataSet, pFIBDataSet, OkCancel_frame, GridsEh;

type
  TReqAddWork = class(TForm)
    frmOk: TOkCancelFrame;
    dsRTWorks: TpFIBDataSet;
    srcRTWorks: TDataSource;
    luWork: TDBLookupComboboxEh;
    edQuant: TDBNumberEditEh;
    mmoNotice: TDBMemoEh;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl4: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

  public
    { Public declarations }

  end;

function SelectRequestWork(const reqType : Integer;
                           var work_id : Integer;
                           var wname : string;
                           var quant : Integer;
                           var worktime : single;
                           var workcost : single;
                           var notice : string ):Boolean;

implementation

uses
  DM;

{$R *.dfm}

function SelectRequestWork(const reqType : Integer;
                           var work_id : Integer;
                           var wname : string;
                           var quant : Integer;
                           var worktime : single;
                           var workcost : single;
                           var notice : string ):Boolean;
begin
  Result := False;
  with TReqAddWork.Create(application) do
  try
    dsRTWorks.ParamByName('rt_id').AsInteger := reqType;
    dsRTWorks.Open;
    edQuant.Value := 1;

    if showModal = mrOk
    then begin
       if not varIsNull(luWork.Value)
       then begin
         work_id  := dsRTWorks['W_ID'];
         wname    := dsRTWorks['NAME'];
         try
           quant  := edQuant.Value;
         except
           quant  := 1;
         end;
         try
           worktime := dsRTWorks['W_TIME'];
         except
           worktime := 0;
         end;
         try
           workcost := dsRTWorks['W_COST'];
         except
           workcost := 0;
         end;
         notice   := mmoNotice.Lines.Text;
         Result := True;
       end;
    end;
    dsRTWorks.Close;
  finally
    free;
  end;
end;


procedure TReqAddWork.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then ModalResult := mrOk;
end;

procedure TReqAddWork.FormKeyPress(Sender: TObject; var Key: Char);
var
  go:boolean;
begin
   if (Key=#13)
   then begin
    go := true;

    if (ActiveControl is TDBLookupComboboxEh)
    then go := not (ActiveControl as TDBLookupComboboxEh).ListVisible
    else begin
       if (ActiveControl is TDBGridEh)
       then begin
         if (ActiveControl as TDBGridEh).DataSource.State in [dsEdit, dsInsert]
         then go := False
         else go := True;
       end;
    end;

    if (go)
    then begin
      Key := #0;                     // eat enter key
      PostMessage( Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
   end;
end;

end.
