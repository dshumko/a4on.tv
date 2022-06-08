unit BarSettingForma;

interface

{$I defines.inc}

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  MemTableDataEh, MemTableEh, GridsEh, DBGridEh, FIBQuery, pFIBQuery, OkCancel_frame, ToolCtrlsEh, DBGridEhToolCtrls,
  DBAxisGridsEh, PrjConst, EhLibVCL, DBGridEhGrouping, DynVarsEh;

type
  TBarSettingForm = class(TForm)
    pnlBody: TPanel;
    okcnclfrm1: TOkCancelFrame;
    grdFormat: TDBGridEh;
    mdFormat: TMemTableEh;
    dsFormat: TDataSource;
    strfldFormatDATA: TStringField;
    intgrfldFormatSIZE: TIntegerField;
    ToolBar2: TToolBar;
    tbSrvAdd: TToolButton;
    tbSrvEdit: TToolButton;
    tbSrvDelete: TToolButton;
    ToolButton1: TToolButton;
    tbSrvOk: TToolButton;
    tbSrvCancel: TToolButton;
    pnlTest: TPanel;
    btn1: TButton;
    edTest: TEdit;
    strfldFormatFILL: TStringField;
    procedure mdFormatNewRecord(DataSet: TDataSet);
    procedure tbSrvOkClick(Sender: TObject);
    procedure tbSrvCancelClick(Sender: TObject);
    procedure tbSrvAddClick(Sender: TObject);
    procedure tbSrvEditClick(Sender: TObject);
    procedure tbSrvDeleteClick(Sender: TObject);
    procedure dsFormatStateChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure grdFormatExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure okcnclfrm1bbOkClick(Sender: TObject);
  private
    { Private declarations }
    fCodeType : Integer;
    function GetBarCode:string;
    procedure SetBarCode(const value : string);
    procedure SetCodeType(const value :integer);
  public
    { Public declarations }
    property CodeType:integer write SetCodeType;
    property BarCodeFormat:string read GetBarCode write SetBarCode;
  end;

var
  BarSettingForm: TBarSettingForm;

implementation

uses
  AtrStrUtils, DM;

{$R *.dfm}

procedure TBarSettingForm.SetCodeType(const value :integer);
var
  i : Integer;
  val : TStringArray;
  cl : TColumnEh;
begin
  case Value of
    0: begin
      Caption := rsSettingsBarCode;
      val := Explode(';',barcode_fields);
    end;
    1 : begin
      Caption := rsSettingsAccount;
      val := Explode(';',ls_fields);
    end;
  end;
  fCodeType := Value;
  cl := grdFormat.Columns[0];
  cl.PickList.Clear;
  for i := 0 to Length(val) - 1 do begin
      cl.PickList.Add(Val[i]);
  end;
end;

procedure TBarSettingForm.btn1Click(Sender: TObject);
var
  i : Integer;
  s : string;
  format : string;
begin
  format := GetBarCode;
  case fCodeType of
    0 : edTest.Text := DMMAIN.GenerateBarCodeFromFormat(format,'1', 100.5, 1, 'ЛЕНИНА','1','1','ШУМКО ДМИТРИЙ ГЕОГРИЕВИЧ');
    1 : begin
        with TpFIBQuery.Create(Nil) do
        try
          DataBase :=dmMain.dbTV;
          Transaction := dmMain.trReadQ;
          SQL.Text:='select first 1 h.house_id, c.flat_no from house h inner join customer c on (c.house_id = h.house_id)';
          Transaction.StartTransaction;
          ExecQuery;
          i := 1;
          s := '';
          if not EOF
          then begin
            i := FieldByName('house_id').Value;
            s := FieldByName('flat_no').Value;
          end;
          Close;
          Transaction.Commit;
        finally
          Free;
        end;
        edTest.Text := DMMAIN.GenerateDogNumberFromFormat(format,i,s,-1);
    end;
  end;

end;

procedure TBarSettingForm.grdFormatExit(Sender: TObject);
begin
  if mdFormat.State in [dsEdit, dsInsert] then mdFormat.Post;

end;

procedure TBarSettingForm.dsFormatStateChange(Sender: TObject);
begin
  tbSrvOk.Enabled     := not ((sender as TDataSource).DataSet.State = dsBrowse);
  tbSrvCancel.Enabled := tbSrvOk.Enabled;
  tbSrvAdd.Enabled    := not tbSrvOk.Enabled;
  tbSrvEdit.Enabled   := not tbSrvOk.Enabled;
  tbSrvDelete.Enabled := not tbSrvOk.Enabled;
end;

procedure TBarSettingForm.FormCreate(Sender: TObject);
begin
  fCodeType := 0;
end;

function TBarSettingForm.GetBarCode:string;
var
  s : string;
begin
  Result := '';
  if not mdFormat.Active then Exit;
  mdFormat.First;
  if mdFormat.EOF then Exit;
  s := '';
  while not mdFormat.Eof do begin
    s:= s + mdFormat.FieldByName('DATA').AsString+'~';
    s:= s + mdFormat.FieldByName('SIZE').AsString+'~';
    s:= s + mdFormat.FieldByName('FILL').AsString+'~';
    s:= s + '^';
    mdFormat.Next;
  end;
  Result := Copy(s,0,length(s)-1);

end;

procedure TBarSettingForm.mdFormatNewRecord(DataSet: TDataSet);
begin
  mdFormat['SIZE'] := 5;
  mdFormat['FILL'] := '0';
end;

procedure TBarSettingForm.okcnclfrm1bbOkClick(Sender: TObject);
begin
  okcnclfrm1.actExitExecute(Sender);

end;

procedure TBarSettingForm.SetBarCode(const value : string);
var
  sa, sl    : TStringArray;
  cnt, i, j : Integer;
begin
  mdFormat.Close;
  mdFormat.Open;
  while not mdFormat.EOF do mdFormat.Delete;
  if value = '' then Exit;

  sa  := Explode('^',VALUE);
  cnt := Length(sa);
  for I := 0 to Cnt - 1 do begin
    sl := Explode('~',sa[i]);
    mdFormat.Append;
    j:= Length(sl);
    if j>0 then mdFormat['DATA'] := sl[0];
    if j>1
    then begin
      try 
        mdFormat['SIZE'] := sl[1];
      except
        mdFormat.FieldByName('SIZE').Clear;
      end;
    end;
    if j>2 then mdFormat['FILL'] := sl[2];
    mdFormat.Post;
  end;
end;

procedure TBarSettingForm.tbSrvAddClick(Sender: TObject);
begin
    mdFormat.Append;
end;

procedure TBarSettingForm.tbSrvCancelClick(Sender: TObject);
begin
  mdFormat.Cancel;
end;

procedure TBarSettingForm.tbSrvDeleteClick(Sender: TObject);
begin
  if MessageDlg(rsDeleteParam,  mtConfirmation, [mbYes, mbNo], 0) = mrYes then mdFormat.Delete;
end;

procedure TBarSettingForm.tbSrvEditClick(Sender: TObject);
begin
  mdFormat.Edit;
end;

procedure TBarSettingForm.tbSrvOkClick(Sender: TObject);
begin
  mdFormat.Post;
end;

end.
