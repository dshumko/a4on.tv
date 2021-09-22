unit SelectLetterTypeForma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrlsEh, Buttons, DB, FIBDataSet, pFIBDataSet,
  DBLookupEh, DBGridEh;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SelectLetterType(aSelected: Integer; var FileName: String; var RecordInDB: Boolean;
  var SavePDF: Boolean): Integer;

implementation

uses DM, AtrCommon, System.Variants;

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
