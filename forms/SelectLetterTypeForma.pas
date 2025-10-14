unit SelectLetterTypeForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  DBCtrlsEh, FIBDataSet, pFIBDataSet, DBLookupEh, DBGridEh;

type
  TfrmSelectLetterType = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    dsLetterTypes: TpFIBDataSet;
    srcLetterTypes: TDataSource;
    cbLetterType: TDBLookupComboboxEh;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbLetterTypeClick(Sender: TObject);
    procedure cbLetterTypeEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SelectLetterType(aSelected: Integer; var FileName: String; var RecordInDB: Boolean;
  var SavePDF: Boolean): Integer;

implementation

uses
  System.Variants,
  DM, AtrCommon;

{$R *.DFM}

function SelectLetterType(aSelected: Integer; var FileName: String; var RecordInDB: Boolean;
  var SavePDF: Boolean): Integer;
var
  frmSelectLetterType: TfrmSelectLetterType;
begin
  Result := -1;
  RecordInDB := False;
  frmSelectLetterType := TfrmSelectLetterType.Create(Application);
  try
    with frmSelectLetterType do
    begin
      dsLetterTypes.Open;
      cbLetterType.Value := aSelected;
      ShowModal;
      if ModalResult = mrOk then
      begin
        if (not VarIsNull(cbLetterType.Value)) and (cbLetterType.Text <> '') then
        begin
          Result := cbLetterType.Value;
          dsLetterTypes.DisableControls;
          dsLetterTypes.Locate('LETTERTYPEID', Result,[]);
          if not dsLetterTypes.FieldByName('RecordInDB').IsNull then
            RecordInDB := dsLetterTypes.FieldByName('RecordInDB').AsInteger = 1;
          if not dsLetterTypes.FieldByName('Save_PDF').IsNull then
            SavePDF := dsLetterTypes.FieldByName('Save_PDF').AsInteger = 1;
          FileName := dsLetterTypes['FILENAME'];
        end;
      end;
    end;
  finally
    frmSelectLetterType.dsLetterTypes.Close;
    FreeAndNil(frmSelectLetterType);
  end;
end;

procedure TfrmSelectLetterType.cbLetterTypeClick(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    Exit;

  if (Sender as TDBLookupComboboxEh).Tag = 0 then begin
    if not(Sender as TDBLookupComboboxEh).ListVisible then
      (Sender as TDBLookupComboboxEh).DropDown
    else
      (Sender as TDBLookupComboboxEh).CloseUp(False);
  end;

  (Sender as TDBLookupComboboxEh).Tag := 0;
end;

procedure TfrmSelectLetterType.cbLetterTypeEnter(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    exit;

  if not(Sender as TDBLookupComboboxEh).ListVisible then begin
    (Sender as TDBLookupComboboxEh).DropDown;
    (Sender as TDBLookupComboboxEh).Tag := 1;
  end;
end;

procedure TfrmSelectLetterType.FormCreate(Sender: TObject);
begin
  UpdateFonts(self);
end;

procedure TfrmSelectLetterType.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    ModalResult := mrOk;
end;

end.
