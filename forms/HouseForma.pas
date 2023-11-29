unit HouseForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Buttons,
  FIBDataSet, pFIBDataSet, OkCancel_frame, DBCtrlsEh, DBLookupEh, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, DBGridEh,
  PrjConst;

type
  THouseForm = class(TForm)
    dsSubAreas: TpFIBDataSet;
    srcSubAreas: TDataSource;
    Panel1: TPanel;
    Label7: TLabel;
    edHome: TDBEditEh;
    Label9: TLabel;
    Label8: TLabel;
    DBNumberEditEh2: TDBNumberEditEh;
    Label4: TLabel;
    DBEditEh1: TDBEditEh;
    Label5: TLabel;
    DBEditEh2: TDBEditEh;
    memHouseNotice: TDBMemoEh;
    OkCancelFrame: TOkCancelFrame;
    Label1: TLabel;
    LupStreets: TDBLookupComboboxEh;
    dsStreets: TpFIBDataSet;
    srcStreet: TDataSource;
    dsHouse: TpFIBDataSet;
    srcHouse: TDataSource;
    trSWrite: TpFIBTransaction;
    trSRead: TpFIBTransaction;
    lbl1: TLabel;
    cbb1: TDBLookupComboboxEh;
    srcOrg: TDataSource;
    dsOrg: TpFIBDataSet;
    lbl2: TLabel;
    lbl3: TLabel;
    cbb2: TDBLookupComboboxEh;
    dsHE: TpFIBDataSet;
    srcHE: TDataSource;
    lblCODE: TLabel;
    lbl4: TLabel;
    cbb3: TDBLookupComboboxEh;
    grpSRV: TGroupBox;
    dbckTV: TDBCheckBoxEh;
    dbckLAN: TDBCheckBoxEh;
    dbckDTV: TDBCheckBoxEh;
    dsWORKGROUP: TpFIBDataSet;
    srcWORKGROUP: TDataSource;
    edtinput: TDBDateTimeEditEh;
    edtRepair: TDBDateTimeEditEh;
    lbl5: TLabel;
    lbl6: TLabel;
    cbbSUBAREA: TDBLookupComboboxEh;
    DBEditEh3: TDBEditEh;
    lbl7: TLabel;
    edtLon: TDBNumberEditEh;
    edtLat: TDBNumberEditEh;
    Label2: TLabel;
    btnMap: TSpeedButton;
    edtHOUSE_CODE: TDBEditEh;
    ednTAG: TDBNumberEditEh;
    edtTAGSTR: TDBEditEh;
    procedure LupStreetsChange(Sender: TObject);
    procedure edHomeChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dsHouseNewRecord(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFramebbOkClick(Sender: TObject);
    procedure cbbSUBAREAEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnMapClick(Sender: TObject);
    procedure edtinputChange(Sender: TObject);
  private
    { Private declarations }
    FEnterSecondPress: Boolean;
    procedure CheckData;
  public
    { Public declarations }
  end;

function EditHouse(const aHouse_ID, aStreet_ID: Int64): Int64;

implementation

uses
  DM, SubAreaEditForma, atrCmdUtils;

{$R *.dfm}

function EditHouse(const aHouse_ID, aStreet_ID: Int64): Int64;
var
  vHouse: Int64;
begin
  result := -1;
  with THouseForm.Create(Application) do
  begin
    try
      trSWrite.Active := true;
      trSRead.Active := true;

      dsOrg.Open;
      dsStreets.Open;
      dsSubAreas.Open;
      dsWORKGROUP.Open;
      dsHE.Open;
      dsHouse.ParamByName('HOUSE_ID').AsInteger := aHouse_ID;
      dsHouse.Open;
      if aHouse_ID = -1 then
      begin
        dsHouse.Insert;
        dsHouse['STREET_ID'] := aStreet_ID;
      end
      else
        dsHouse.Edit;
      CheckData;
      if ShowModal = mrOk then
      begin
        try
          if aHouse_ID = -1 then
          begin
            vHouse := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1, dmMain.trWriteQ);
            dsHouse['HOUSE_ID'] := vHouse;
          end
          else
            vHouse := aHouse_ID;
          dsHouse.Post;
          result := vHouse;
        except
          result := -1;
        end;
      end
      else
        dsHouse.Cancel;
      dsHouse.Close;
      dsStreets.Close;
      dsSubAreas.Close;
      dsOrg.Close;
      dsHE.Close;
      dsWORKGROUP.Close;
    finally
      free
    end;
  end;
end;

procedure THouseForm.btnMapClick(Sender: TObject);
var
  s, la, lo, t, ts: string;
  mapUrl : string;
begin
  mapUrl := dmMain.GetSettingsValue('MAP_HOUSE_URL');

  la := edtLat.Text.Replace(',', '.');
  lo := edtLon.Text.Replace(',', '.');
  t := ednTAG.Text.Replace(',', '.');
  ts := edtTAGSTR.Text;

  mapUrl := StringReplace(mapUrl, '%lat%', la, [rfReplaceAll]);
  mapUrl := StringReplace(mapUrl, '%lon%', lo, [rfReplaceAll]);
  mapUrl := StringReplace(mapUrl, '%tag%', t, [rfReplaceAll]);
  mapUrl := StringReplace(mapUrl, '%tag_str%', ts, [rfReplaceAll]);

  s := LupStreets.Text;
  t:= edHome.Text;
  ts:= cbbSUBAREA.Text;
  mapUrl := StringReplace(mapUrl, '%strt%', s, [rfReplaceAll]);
  mapUrl := StringReplace(mapUrl, '%n%', t, [rfReplaceAll]);
  mapUrl := StringReplace(mapUrl, '%city%', ts, [rfReplaceAll]);

  // s := Format('http://openstreetmap.ru/#mmap=19/%s/%s&map=19/%s/%s', [la, lo, la, lo]);
  ShellExecute(Handle, 'open', mapUrl);
end;

procedure THouseForm.cbbSUBAREAEditButtons0Click(Sender: TObject; var Handled: Boolean);
var
  i: Integer;
begin
  Handled := true;
  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas))) then
    Exit;
  i := EditSubArea(-1, -1);
  if i > 0 then
  begin
    dsSubAreas.CloseOpen(true);
    dsSubAreas.Locate('SubArea_id', i, []);
  end;

end;

procedure THouseForm.CheckData;
var
  En: Boolean;
begin
  En := true;

  En := En and not dsHouse.FieldbyName('STREET_ID').IsNull;
  En := En and (trim(edHome.Text) <> '');

  OkCancelFrame.bbOk.Enabled := En;
end;

procedure THouseForm.LupStreetsChange(Sender: TObject);
begin
  CheckData;
end;

procedure THouseForm.OkCancelFramebbOkClick(Sender: TObject);
begin
  OkCancelFrame.actExitExecute(Sender);
end;

procedure THouseForm.dsHouseNewRecord(DataSet: TDataSet);
begin
  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      SQL.Text := 'select count(*) count_h from house';
      Transaction.StartTransaction;
      ExecQuery;
      edtHOUSE_CODE.Text := FieldbyName('count_h').asString;
      Close;
      Transaction.Commit;
    finally
      free;
    end;
end;

procedure THouseForm.edHomeChange(Sender: TObject);
begin
  CheckData;
end;

procedure THouseForm.edtinputChange(Sender: TObject);
begin
  if VarIsNull(edtinput.Value) then
    edtinput.Color := clYellow
  else
    edtinput.Color := clWindow;
end;

procedure THouseForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (not OkCancelFrame.bbOk.Enabled) then
    Exit;

  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    ModalResult := mrOk;
end;

procedure THouseForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if (Key = #13) then // (Ord(Key) = VK_RETURN)
  begin
    go := true;
    if (ActiveControl is TDBLookupComboboxEh) then
      go := not(ActiveControl as TDBLookupComboboxEh).ListVisible
    //else if (ActiveControl is TDBGridEh) then
    //  go := False	  
    else
    begin
      if (ActiveControl is TDBMemoEh) and (not((Trim((ActiveControl as TDBMemoEh).Lines.Text) = '') or FEnterSecondPress)) then
      begin
        go := False;
        FEnterSecondPress := true;
      end;
    end;

    if go then
    begin
      FEnterSecondPress := False;
      Key := #0; // eat enter key
      PostMessage(Self.Handle, WM_NEXTDLGCTL, 0, 0);
    end;
  end
  else
  begin
    if (ActiveControl is TDBMemoEh) then
      FEnterSecondPress := False;
  end;
end;

procedure THouseForm.FormShow(Sender: TObject);
begin
  cbbSUBAREA.EditButtons[0].Visible :=
    ((dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Areas)));
end;

end.
