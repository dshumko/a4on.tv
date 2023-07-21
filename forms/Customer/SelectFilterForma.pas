unit SelectFilterForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  DBCtrlsEh, FIBDataSet, pFIBDataSet, DBLookupEh, DBGridEh;

type
  TfrmSelectFilter = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    dsFilter: TpFIBDataSet;
    srcFilter: TDataSource;
    cbFilter: TDBLookupComboboxEh;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    btnDel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbFilterClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function SelectFilter(const filter_type_id : Integer = 67): String;

implementation

uses
  System.Variants,
  DM, AtrCommon, PrjConst;

{$R *.DFM}

function SelectFilter(const filter_type_id : Integer = 67): String;
var
  frmSelectFilter: TfrmSelectFilter;
  bt : Integer;
begin
  Result := '';
  frmSelectFilter := TfrmSelectFilter.Create(Application);
  try
    with frmSelectFilter do
    begin
      dsFilter.ParamByName('filter_type_id').AsInteger := filter_type_id;
      case filter_type_id of
        67 : bt := 5; // фильтр абонентов
        68 : bt := 6; // фильтр заявок
        else bt := -999;
      end;
      dsFilter.ParamByName('bt').AsInteger := bt;
      dsFilter.Open;
      ShowModal;
      if ModalResult = mrOk then
      begin
        if (cbFilter.Text <> '') then
        begin
          Result := dsFilter.FieldByName('jsFilter').AsString;
        end;
      end;
      dsFilter.Close;
    end;
  finally
    FreeAndNil(frmSelectFilter);
  end;
end;

procedure TfrmSelectFilter.btnDelClick(Sender: TObject);
begin
  if dsFilter.FieldByNAme('O_Name').IsNull then
    Exit;

  if Application.MessageBox(PWideChar(format(rsDeleteRecord, [dsFilter['O_Name']])), PWideChar(rsDeleteCaption),
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
  begin
    dsFilter.Delete;
    dsFilter.CloseOpen(true);
  end;
end;

procedure TfrmSelectFilter.cbFilterClick(Sender: TObject);
begin
  if not(Sender is TDBLookupComboboxEh) then
    Exit;

  if not(Sender as TDBLookupComboboxEh).ListVisible then
    (Sender as TDBLookupComboboxEh).DropDown
  else
    (Sender as TDBLookupComboboxEh).CloseUp(False);
end;

procedure TfrmSelectFilter.FormCreate(Sender: TObject);
begin
  UpdateFonts(self);
end;

procedure TfrmSelectFilter.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    ModalResult := mrOk;
end;

end.
