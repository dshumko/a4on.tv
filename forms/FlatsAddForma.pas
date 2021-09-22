unit FlatsAddForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, ExtCtrls, GridsEh,
  DBGridEh, DB, FIBDatabase, FIBQuery, pFIBQuery,
  ToolCtrlsEh, DBGridEhToolCtrls, MemTableDataEh, MemTableEh,
  DBAxisGridsEh, PrjConst, EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  TFlatsAddForm = class(TForm)
    srcStructure: TDataSource;
    dbgStructure: TDBGridEh;
    pnlBtm: TPanel;
    btn1: TButton;
    btn2: TButton;
    mmo1: TDBMemoEh;
    qry: TpFIBQuery;
    dsStructure: TMemTableEh;
    procedure btn1Click(Sender: TObject);
    procedure dsStructureNewRecord(DataSet: TDataSet);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    fHouse_ID : Integer;
    procedure CreateHouseMap;
    { Private declarations }
  public
    { Public declarations }
  end;

function CreateFlats(const HOUSE_ID : Integer) : Boolean;

implementation

{$R *.dfm}
function CreateFlats(const HOUSE_ID : Integer) : Boolean;
begin
  Result := False;
  with TFlatsAddForm.Create(application) do
  try
    fHouse_ID := HOUSE_ID;
    dsStructure.Open;
    dsStructure.EmptyTable;
    if ShowModal = mrOk
    then Result := True;
    dsStructure.Close;
  finally
    Free;
  end;
end;

procedure TFlatsAddForm.btn1Click(Sender: TObject);
begin
  CreateHouseMap;
  if mmo1.Lines.Count = 0 then ModalResult := mrOk;
  
end;

procedure TFlatsAddForm.CreateHouseMap;
var
  porch_i : Integer;
  floor_i : Integer;
  flats_i : Integer;
  flat_n  : string;
  last_flat_n : Integer;
begin
  if dsStructure.State in [dsEdit, dsInsert] then dsStructure.Post;

  if dsStructure.RecordCount = 0 then Exit;

  dsStructure.First;
  mmo1.Lines.Clear;
  last_flat_n := 1;
  while not dsStructure.Eof do begin
    if TryStrToInt(dsStructure['FlatsFrom'], flats_i)
    then last_flat_n := flats_i;

    for porch_i := 0 to dsStructure['PorchCount']-1 do begin
      for floor_i := 0 to dsStructure['FloorCount']-1 do begin
        qry.SQL.Text := 'execute procedure ADD_FLAT_TO_HOUSE(:HOUSE_ID, :FLAT_NO, :PORCH_N, :FLOOR_N)';
        if dsStructure['FlatsCount'] >1 then begin
          for flats_i := 0 to dsStructure['FlatsCount']-1 do begin
            flat_n := IntToStr(last_flat_n);
            qry.ParamByName('HOUSE_ID').AsInteger := fHouse_ID;
            qry.ParamByName('PORCH_N').AsString   := IntToStr(dsStructure['PorchFrom']+porch_i);
            qry.ParamByName('FLOOR_N').AsString   := IntToStr(StrToInt(dsStructure['FloorFrom'])+floor_i);
            qry.ParamByName('FLAT_NO').AsString   := flat_n;
            qry.Transaction.StartTransaction;
            qry.ExecQuery;
            qry.Transaction.Commit;
            qry.Close;
            //if flat_id = -1
            //then mmo1.Lines.Add(Format(rsERROR_ADD_FLAT, [flat_n]));
            inc(last_flat_n);
          end;
        end
        else begin
          if TryStrToInt(dsStructure['FlatsFrom'], flats_i)
          then last_flat_n := flats_i;
          qry.ParamByName('HOUSE_ID').AsInteger := fHouse_ID;
          qry.ParamByName('PORCH_N').AsString   := IntToStr(dsStructure['PorchFrom']+porch_i);
          qry.ParamByName('FLOOR_N').AsString   := dsStructure['FloorFrom'];
          qry.ParamByName('FLAT_NO').AsString   := dsStructure['FlatsFrom'];
          qry.Transaction.StartTransaction;
          qry.ExecQuery;
          qry.Transaction.Commit;
          qry.Close;
        end;
      end;
    end;
    dsStructure.Next;
  end;
  mmo1.Visible := mmo1.Lines.Count>0;

end;


procedure TFlatsAddForm.dsStructureNewRecord(DataSet: TDataSet);
begin
  dsStructure['PorchCount'] := 1;
  dsStructure['PorchFrom'] := 1;
  dsStructure['FloorCount'] := 1;
  dsStructure['FloorFrom'] := '1';
  dsStructure['FlatsCount'] := 1;
  dsStructure['FlatsFrom'] := '1';
end;

procedure TFlatsAddForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN)
  then btn1Click(sender);
end;

end.
