unit TextEditForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  SynEditHighlighter, SynHighlighterGeneral, SynEdit, OkCancel_frame, PrjConst, PropFilerEh, PropStorageEh;

type
  TTextEditForm = class(TForm)
    Text: TSynEdit;
    syngnrlsyn1: TSynGeneralSyn;
    lblHint: TLabel;
    FormStorage: TPropStorageEh;
    pnl1: TPanel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    procedure TextChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EditText(txt: TStrings; const title: string=''; const notice : string=''):Boolean; overload;
function EditText(var txt: String; const title: string=''; const notice : string=''):Boolean; overload;
function ShowText(var txt: String; const title: string=''; const notice : string=''):Boolean;

implementation

uses
  MAIN, DM;

{$R *.dfm}

function EditText(txt: TStrings; const title: string=''; const notice : string=''):Boolean;
begin
  Result := False;

  with TTextEditForm.Create(Application) do
  try
    if title = ''
    then Caption := rsTextEditor
    else Caption := title;
    lblHint.Visible := (notice <> '');
    lblHint.Caption := notice;
    Text.Lines.Clear;
    Text.Lines.AddStrings(txt);
    btnOk.Visible := False;

    if showmodal = mrOk
    then begin
      txt.Clear;
      txt.Text := Text.Lines.Text;
      Result := True;
    end;
  finally
    Free;
  end;
end;

function ShowText(var txt: String; const title: string=''; const notice : string=''):Boolean;
begin
  Result := False;

  with TTextEditForm.Create(Application) do
  try
    if title = ''
    then Caption := rsTextEditor
    else Caption := title;
    lblHint.Visible := (notice <> '');
    lblHint.Caption := notice;
    Text.Lines.Clear;
    Text.Lines.Text := txt;
    Text.WordWrap := True;
    btnOk.Enabled := False;
    if showmodal = mrOk
    then begin
      txt := Text.Lines.Text;
      Result := True;
    end;
  finally
    Free;
  end;
end;


function EditText(var txt: String; const title: string=''; const notice : string=''):Boolean;
begin
  Result := False;

  with TTextEditForm.Create(Application) do
  try
    if title = ''
    then Caption := rsTextEditor
    else Caption := title;
    lblHint.Visible := (notice <> '');
    lblHint.Caption := notice;
    Text.Lines.Clear;
    Text.Lines.Text := txt;
    btnOk.Enabled := False;
    ActiveControl := Text;
    if showmodal = mrOk
    then begin
      txt := Text.Lines.Text;
      Result := True;
    end;
  finally
    Free;
  end;
end;

procedure TTextEditForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) and (btnOk.Enabled)
  then ModalResult := mrOk
  else begin
    if (Ord(Key) = VK_ESCAPE) then
    ModalResult := mrCancel;
  end;
end;

procedure TTextEditForm.TextChange(Sender: TObject);
begin
  btnOk.Enabled := True;
end;

end.
