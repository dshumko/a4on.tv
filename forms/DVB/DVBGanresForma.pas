unit DVBGanresForma;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MemTableDataEh, Data.DB,
  ToolCtrlsEh, DBGridEhToolCtrls, GridsEh,
  DBAxisGridsEh, DBGridEh, MemTableEh, OkCancel_frame, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  TDVBGanresForm = class(TForm)
    OkCancelFrame1: TOkCancelFrame;
    srcGanres: TDataSource;
    dsmGanres: TMemTableEh;
    DBGridEh: TDBGridEh;
    dsmGanresCODE: TStringField;
    dsmGanresSELECTED: TBooleanField;
    dsmGanresNAME: TStringField;
    dsGenres: TpFIBDataSet;
    trRead: TpFIBTransaction;
  private
    { Private declarations }
    procedure SetGanres(const value : string);
    function GetGanres : String;
  public
    { Public declarations }
    property Selected:string read GetGanres write SetGanres ;
    procedure Init;
  end;

function SelectDVBGanres(const ganres : string):string;

implementation

uses
  DM, AtrStrUtils;

{$R *.dfm}
function SelectDVBGanres(const ganres : string):string;
begin
  Result := ganres;
  with TDVBGanresForm.Create(Application) do
  try
    Init;
    Selected := ganres;
    if ShowModal = mrOk
    then Result := Selected;
  finally
    free
  end;
end;

procedure TDVBGanresForm.init;
begin
  dsGenres.Open;
  while not dsGenres.Eof do begin
    dsmGanres.Append;
    dsmGanres['CODE'] := IntToStr(dsGenres['GENRE_ID']);
    dsmGanres['NAME'] := dsGenres['NAME'];
    dsmGanres['SELECTED'] := FALSE;
    dsmGanres.Post;
    dsGenres.Next;
  end;
  dsGenres.Close;
  dsmGanres.First;
end;

procedure TDVBGanresForm.SetGanres(const value : string);
var
  i : Integer;
  val : TStringArray;
begin
  val := Explode(',',value);
  for I := 0 to Length(val) - 1 do begin
    if dsmGanres.Locate('CODE', val[i], [])
    then begin
      dsmGanres.Edit;
      dsmGanres['SELECTED'] := True;
      dsmGanres.Post;
    end;
  end;
end;

function TDVBGanresForm.GetGanres : String;
begin
  Result := '';

  if dsmGanres.State = dsEdit then dsmGanres.Post;
  DBGridEh.SearchPanel.CancelSearchFilter;

  dsmGanres.DisableControls;
  dsmGanres.First;
  while not dsmGanres.Eof do begin
    if dsmGanres['SELECTED'] then
      Result := Result + dsmGanres['CODE']+',';
    dsmGanres.Next;
  end;
  if Result <> '' then Result := Copy(Result,1,Length(Result)-1);

end;

end.
