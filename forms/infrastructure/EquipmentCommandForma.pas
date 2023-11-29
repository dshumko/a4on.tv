unit EquipmentCommandForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Menus, Vcl.ExtCtrls,
  SynEditHighlighter, OkCancel_frame, DBCtrlsEh, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, DBLookupEh,
  PrjConst,
  DBGridEh;

type
  TEquipmentCommandForm = class(TForm)
    okcnclfrm1: TOkCancelFrame;
    srcGC: TDataSource;
    lbl2: TLabel;
    dbm1: TDBMemoEh;
    srcGroup: TDataSource;
    dsGroup: TpFIBDataSet;
    dsGC: TpFIBDataSet;
    trWrite: TpFIBTransaction;
    pmMemo: TPopupMenu;
    pnlMain: TPanel;
    lbl4: TLabel;
    edtName: TDBEditEh;
    lbl5: TLabel;
    lcbGroup: TDBLookupComboboxEh;
    lbl3: TLabel;
    cbType: TDBComboBoxEh;
    dbchGUI: TDBCheckBoxEh;
    cbEOL: TDBComboBoxEh;
    lbl6: TLabel;
    pnlURL: TPanel;
    pnlCMD: TPanel;
    lbl1: TLabel;
    dbmNotice: TDBMemoEh;
    lblURL: TLabel;
    edtURL: TDBEditEh;
    edtUSR: TDBEditEh;
    edtPSWD: TDBEditEh;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure IP1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure okcnclfrm1bbOkClick(Sender: TObject);
    procedure cbTypeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lcbGroupChange(Sender: TObject);
    procedure dsGCNewRecord(DataSet: TDataSet);
  private
    FPreviousMenu: Integer;
    procedure BuildLANmenu;
    procedure BuildTVmenu;
  public
    { Public declarations }
  end;

function EditGroupCommand(C_ID: Integer): Boolean;

implementation

uses
  DM;

{$R *.dfm}

function EditGroupCommand(C_ID: Integer): Boolean;
begin
  result := false;
  with TEquipmentCommandForm.Create(Application) do
    try
      dsGC.ParamByName('CID').AsInteger := C_ID;
      dsGC.Open;
      if C_ID = -1 then
        dsGC.Insert
      else
        dsGC.Edit;

      // eACCOUNT_NO.Enabled := (EditMode = 0);
      if ShowModal = mrOk then
      begin
        result := true;
        if (dsGC.State in [dsEdit, dsInsert]) then
          dsGC.Post;
      end
      else if (dsGC.State in [dsEdit, dsInsert]) then
        dsGC.Cancel;

    finally
      free
    end;

end;

procedure TEquipmentCommandForm.cbTypeChange(Sender: TObject);
begin
  try
    pnlURL.Visible := (cbType.Value = 2);
  except
    pnlURL.Visible := false;
  end;
end;

procedure TEquipmentCommandForm.dsGCNewRecord(DataSet: TDataSet);
begin
  dsGC['IN_GUI'] := 1;
end;

procedure TEquipmentCommandForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dsGroup.Close;
end;

procedure TEquipmentCommandForm.FormCreate(Sender: TObject);
begin
  FPreviousMenu := 0;
end;

procedure TEquipmentCommandForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Ord(Key) = VK_RETURN) then
    okcnclfrm1bbOkClick(Sender);
end;

procedure TEquipmentCommandForm.FormShow(Sender: TObject);
begin
  dsGroup.Open;
end;

procedure TEquipmentCommandForm.IP1Click(Sender: TObject);
begin
  if (Sender is TMenuItem) and (ActiveControl is TDBMemoEh) then
    (ActiveControl as TDBMemoEh).SelText := (Sender as TMenuItem).Hint;
end;

procedure TEquipmentCommandForm.lcbGroupChange(Sender: TObject);
begin
  if lcbGroup.Value <> -2 then
    BuildLANmenu
  else
    BuildTVmenu;
end;

procedure TEquipmentCommandForm.okcnclfrm1bbOkClick(Sender: TObject);
begin
  okcnclfrm1.actExitExecute(Sender);
end;

procedure TEquipmentCommandForm.BuildLANmenu;
var
  NewItem: TMenuItem;
begin
  if (FPreviousMenu = 1) then
    Exit;

  pmMemo.Items.Clear;

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanUserEquipment;
  NewItem.Hint := '<e_admin>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanPasswordEquipment;
  NewItem.Hint := '<e_pass>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanIPEquipment;
  NewItem.Hint := '<e_ip>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanIPv6Equipment;
  NewItem.Hint := '<e_ipv6>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanMACEquipment;
  NewItem.Hint := '<e_mac>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanMACEquipmentH;
  NewItem.Hint := '<e_mac_h>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanMACEquipmentD;
  NewItem.Hint := '<e_mac_d>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanMACEquipmentJun;
  NewItem.Hint := '<e_mac_j>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanIPCustomer;
  NewItem.Hint := '<c_ip>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanIPv6Customer;
  NewItem.Hint := '<c_ipv6>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanMACCustomer;
  NewItem.Hint := '<c_mac>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanMACCustomerH;
  NewItem.Hint := '<c_mac_h>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanMACCustomerD;
  NewItem.Hint := '<c_mac_d>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanMACCustomerJun;
  NewItem.Hint := '<c_mac_j>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanPortCustomer;
  NewItem.Hint := '<c_port>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanVLANCustomer;
  NewItem.Hint := '<c_vlan>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanTAGCustomer;
  NewItem.Hint := '<c_tag>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanTAGSTRCustomer;
  NewItem.Hint := '<c_tagstr>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanCustomerAccnt;
  NewItem.Hint := '<c_accnt>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanCustomerFIO;
  NewItem.Hint := '<c_fio>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanCustomerAddr;
  NewItem.Hint := '<c_addr>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := 'Дата в формате Y-m-d h:n ' + FormatDateTime('Y-m-d h:n', Now());
  NewItem.Hint := '<date>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := rsLanTelnetWait;
  NewItem.Hint := 'wait';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  FPreviousMenu := 1;
end;

procedure TEquipmentCommandForm.BuildTVmenu;
var
  NewItem: TMenuItem;
begin
  if (FPreviousMenu = 2) then
    Exit;

  pmMemo.Items.Clear;

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := 'Имя канала';
  NewItem.Hint := '<c_name>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := 'ID канала';
  NewItem.Hint := '<c_id>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := 'Аналог номер';
  NewItem.Hint := '<a_num>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := 'Ствол';
  NewItem.Hint := '<trunk>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := 'Номер в стволе';
  NewItem.Hint := '<trunk_n>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := 'NID';
  NewItem.Hint := '<nid>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := 'TSID';
  NewItem.Hint := '<tsid>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := 'SID';
  NewItem.Hint := '<sid>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  NewItem := TMenuItem.Create(pmMemo);
  NewItem.Caption := 'Дата в формате Y-m-d h:n ' + FormatDateTime('Y-m-d h:n', Now());
  NewItem.Hint := '<date>';
  NewItem.OnClick := IP1Click;
  pmMemo.Items.Add(NewItem);

  FPreviousMenu := 2;
end;

end.
