unit EditNodeFlatsForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.Buttons, Vcl.ExtCtrls,
  FIBDataSet, pFIBDataSet, DBGridEh, DBCtrlsEh, DBLookupEh, CnErrorProvider, FIBQuery, PrjConst, DBGridEhGrouping,
  ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, FIBDatabase, pFIBDatabase, amSplitter;

type
  TedtNodeFlats = class(TForm)
    pnl1: TPanel;
    spl1: TSplitter;
    pnl2: TPanel;
    dbgOn: TDBGridEh;
    pnl3: TPanel;
    btnUGAdd: TSpeedButton;
    btnUGremove: TSpeedButton;
    pnl4: TPanel;
    dsOn: TpFIBDataSet;
    srcOn: TDataSource;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dbgOff: TDBGridEh;
    srcOff: TDataSource;
    dsOff: TpFIBDataSet;
    pnl5: TPanel;
    btnOk: TBitBtn;
    lblOn: TLabel;
    lblOff: TLabel;
    pnl6: TPanel;
    chkHouse: TDBCheckBoxEh;
    chkPorch: TDBCheckBoxEh;
    chkCustHouse: TDBCheckBoxEh;
    btnHouseAdd: TSpeedButton;
    chkStreet: TDBCheckBoxEh;
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnUGAddClick(Sender: TObject);
    procedure btnUGremoveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgOffDblClick(Sender: TObject);
    procedure dbgOnDblClick(Sender: TObject);
    procedure chkPorchClick(Sender: TObject);
    procedure dsOnBeforePost(DataSet: TDataSet);
    procedure chkStreetClick(Sender: TObject);
  private
    fNode_ID: Integer;
    procedure SetNodeId(value: Integer);
    function GetNodeId: Integer;
    procedure SetFilter();
  public
    property NODE: Integer read GetNodeId write SetNodeId;
  end;

function EditFlats(const NODE_ID: Integer): Boolean;

implementation

uses
  DM;

{$R *.dfm}

function EditFlats(const NODE_ID: Integer): Boolean;
begin
  with TedtNodeFlats.Create(Application) do
    try
      NODE := NODE_ID;
      ShowModal;
      Result := True;
    finally
      free;
    end;
end;

procedure TedtNodeFlats.btnUGAddClick(Sender: TObject);
var
  ah : Boolean;
begin
  if (dsOff.RecordCount = 0) or (dsOff.FieldByName('HOUSE_ID').IsNull) then
    Exit;

  ah := (Sender as TComponent).Name = btnUGAdd.Name;
  if (ah and dsOff.FieldByName('FLAT_NO').IsNull) then
    Exit;

  dsOn.Insert;
  dsOn['HOUSE_ID'] := dsOff['HOUSE_ID'];

  if (ah) then
    dsOn['FLAT_NO'] := dsOff['FLAT_NO'];

  dsOn.Post;
  dsOn.CloseOpen(True);
  if (ah) then
    dsOn.Locate('FLAT_NO', dsOff['FLAT_NO'], [])
  else
    dsOn.Locate('HOUSE_ID', dsOff['HOUSE_ID'], []);

  dsOff.CloseOpen(True);
end;

procedure TedtNodeFlats.btnUGremoveClick(Sender: TObject);
var
  f: string;
begin
  if (dsOn.RecordCount = 0) or (dsOn.FieldByName('HOUSE_ID').IsNull) then
    Exit;

  if (not dsOn.FieldByName('FLAT_NO').IsNull) then
    f := dsOn['FLAT_NO'];
  {
    dsOn.Edit;
    dsOn.FieldByName('NODE_ID').Clear;
    dsOn.Post;
  }
  dsOn.Delete;
  dsOn.CloseOpen(True);
  dsOff.CloseOpen(True);
  if (not f.IsEmpty) then
    dsOff.Locate('FLAT_NO', f, []);
end;

procedure TedtNodeFlats.chkPorchClick(Sender: TObject);
begin
  chkPorch.Enabled := chkHouse.Checked;
  chkStreet.Checked := not chkHouse.Checked;
  SetFilter();
end;

procedure TedtNodeFlats.chkStreetClick(Sender: TObject);
begin
  SetFilter();
end;

procedure TedtNodeFlats.dbgOffDblClick(Sender: TObject);
begin
  btnUGAddClick(Sender);
end;

procedure TedtNodeFlats.dbgOnDblClick(Sender: TObject);
begin
  btnUGremoveClick(Sender);
end;

procedure TedtNodeFlats.dsOnBeforePost(DataSet: TDataSet);
begin
  dsOn['NODE_ID'] := fNode_ID;
end;

procedure TedtNodeFlats.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsOn.Active then
  begin
    if dsOn.State = dsEdit then
      dsOn.Post;
    dsOn.Close;
  end;
  if dsOff.Active then
    dsOff.Close;
  Action := caFree;
end;

procedure TedtNodeFlats.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    ModalResult := mrOk;
end;

procedure TedtNodeFlats.SetNodeId(value: Integer);
begin
  fNode_ID := value;
  SetFilter();
end;

function TedtNodeFlats.GetNodeId: Integer;
begin
  Result := fNode_ID;
end;

procedure TedtNodeFlats.SetFilter();
begin
  if dsOn.Active then
    dsOn.Close;
  if dsOff.Active then
    dsOff.Close;

  with dsOff.SQLs.SelectSQL do
  begin
    Clear;
    if chkCustHouse.Checked then
    begin
      Add('select');
      Add('    c.House_Id');
      Add('  , c.Flat_No');
      Add('  , f.Porch_N');
      Add('  , f.Floor_N');
      Add('  , s.Street_Name || '' '' || s.Street_Short as Street_Name');
      Add('  , h.House_No');
      Add('  from customer c');
      Add('       inner join house h on (h.House_Id = с.House_Id)');
      Add('       inner join street s on (s.Street_Id = h.Street_Id)');
      Add('       left outer join houseflats F on (f.House_Id = с.House_Id and f.Flat_No = c.Flat_No)');
      Add('  where not exists(select Node_Id from Node_Flats ne');
      Add('      where ne.Node_Id = :NODE_ID and ne.House_Id = c.house_id and ne.Flat_No = c.Flat_No)');

      if chkStreet.Checked then
        Add(' and exists(select nh.Street_Id from Nodes n inner join house nh on (nh.House_Id = n.House_Id)' +
          ' where n.Node_Id = :NODE_ID and nh.Street_Id = h.Street_Id) ');

      Add('order by Street_Name, House_No, f.porch_n, f.Floor_N, f.Flat_No');
    end
    else
    begin
      Add('select');
      Add('    h.House_Id');
      Add('  , f.Flat_No');
      Add('  , f.Porch_N');
      Add('  , f.Floor_N');
      Add('  , s.Street_Name||'' ''||s.Street_Short as Street_Name');
      Add('  , h.House_No');
      Add('from house h');
      Add('  inner join street s on (s.Street_Id = h.Street_Id)');

      if chkHouse.Checked then
      begin
        Add(' inner join nodes n on (n.house_id = h.HOUSE_ID and n.NODE_ID = :NODE_ID) ');
        if chkPorch.Checked then
          Add('  inner join houseflats F on (f.House_Id = h.House_Id)')
        else
          Add('  left outer join houseflats F on (f.House_Id = h.House_Id)');
      end
      else
        Add('  left outer join houseflats F on (f.House_Id = h.House_Id)');

      Add('where not exists(select Node_Id from Node_Flats ne');
      Add('      where ne.Node_Id = :NODE_ID and ne.House_Id = h.house_id and ne.Flat_No = f.Flat_No)');

      if chkHouse.Checked and chkPorch.Checked then
        Add(' and f.Porch_N = n.Porch_N and f.Floor_N = n.Floor_N');

      if chkStreet.Checked then
        Add(' and exists(select nh.Street_Id from Nodes n inner join house nh on (nh.House_Id = n.House_Id)' +
          ' where n.Node_Id = :NODE_ID and nh.Street_Id = h.Street_Id) ');

      Add('order by Street_Name, House_No, f.porch_n, f.Floor_N, f.Flat_No');
    end;
  end;

  dsOn.ParamByName('NODE_ID').AsInteger := fNode_ID;
  dsOn.Open;
  dsOff.ParamByName('NODE_ID').AsInteger := fNode_ID;
  dsOff.Open;
end;

end.
