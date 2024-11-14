unit IPTVGroupForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls,
  FIBDataSet, pFIBDataSet, GridsEh, DBGridEh, FIBDatabase, pFIBDatabase, DBCtrlsEh, OkCancel_frame, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, EhLibFIB, EhLibVCL, DBGridEhGrouping, DynVarsEh, PropFilerEh, PropStorageEh,
  amSplitter;

type
  TIPTVGroupForm = class(TForm)
    dsIGC: TpFIBDataSet;
    srcIGC: TDataSource;
    dsC: TpFIBDataSet;
    srcC: TDataSource;
    dsIPTVGroup: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    srcIPTVGroup: TDataSource;
    OkCancelFrame1: TOkCancelFrame;
    pnlChannels: TPanel;
    spl1: TSplitter;
    pnlSelected: TPanel;
    lbl1: TLabel;
    dbgrdGridSC: TDBGridEh;
    pnlProgrBtn: TPanel;
    btnChanAdd: TSpeedButton;
    btnChanRemove: TSpeedButton;
    pnlExists: TPanel;
    lbl2: TLabel;
    dbgrdGridC: TDBGridEh;
    pnlHead: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edtNAME: TDBEditEh;
    edtURL: TDBEditEh;
    dbmNotice: TDBMemoEh;
    Label3: TLabel;
    edtCODE: TDBEditEh;
    lblCode: TLabel;
    chkDISABLED: TDBCheckBoxEh;
    PropStorageEh: TPropStorageEh;
    procedure btnChanAddClick(Sender: TObject);
    procedure btnChanRemoveClick(Sender: TObject);
    procedure dbgrdGridCDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function IPTVGroupModify(const aIG_ID: Integer): Integer;

implementation

uses
  DM, MAIN;

{$R *.dfm}

function IPTVGroupModify(const aIG_ID: Integer): Integer;
begin
  with TIPTVGroupForm.Create(Application) do
    try
      dsIPTVGroup.ParamByName('IG_ID').AsInteger := aIG_ID;
      dsIPTVGroup.Open;
      if aIG_ID = -1 then
      begin
        dsIPTVGroup.Insert;
        dsIPTVGroup['IG_ID'] := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);
      end;
      if ShowModal = mrOk then
      begin
        if dsIPTVGroup.State in [dsEdit, dsInsert] then
          dsIPTVGroup.Post;
        if dsIPTVGroup.State in [dsEdit, dsInsert] then
          dsIGC.Post;
        result := dsIPTVGroup['IG_ID'];
      end
      else
      begin
        if dsIPTVGroup.State in [dsEdit, dsInsert] then
          dsIPTVGroup.Cancel;
        result := -1;
      end;
      dsIPTVGroup.Close;
    finally
      free
    end;
end;

procedure TIPTVGroupForm.btnChanAddClick(Sender: TObject);
var
  ch_id: Integer;
begin
  if dsC.EOF then
    Exit;

  dsIGC.Append;
  dsIGC['IG_Id'] := dsIPTVGroup['IG_Id'];
  dsIGC['Ch_Id'] := dsC['Ch_Id'];
  dsIGC['CH_NAME'] := dsC['CH_NAME'];
  dsIGC['DEFINITION'] := dsC['DEFINITION'];
  try
    dsIGC.Post;
  except
    dsIGC.Cancel;
  end;

  dsC.DisableControls;
  ch_id := -1;
  if not dsC.EOF then
  begin
    dsC.Next;
    ch_id := dsC['Ch_Id'];
  end;
  dsC.CloseOpen(true);
  if ch_id <> -1 then
    dsC.Locate('Ch_Id', VarArrayOf([ch_id]), []);
  dsC.EnableControls;
end;

procedure TIPTVGroupForm.btnChanRemoveClick(Sender: TObject);
var
  ch_id: Integer;
begin
  if dsIGC.EOF then
    Exit;

  dsIGC.Delete;

  dsC.DisableControls;
  ch_id := -1;
  if not dsC.EOF then
    ch_id := dsC['Ch_Id'];
  dsC.CloseOpen(true);
  if ch_id <> -1 then
    dsC.Locate('Ch_Id', VarArrayOf([ch_id]), []);
  dsC.EnableControls;
end;

procedure TIPTVGroupForm.dbgrdGridCDblClick(Sender: TObject);
begin
  btnChanAddClick(Sender);
end;

procedure TIPTVGroupForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, false);
end;

procedure TIPTVGroupForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) then
  begin
    if (Ord(Key) = VK_RETURN) then
      OkCancelFrame1.actExitExecute(Sender)
    else if (Ord(Key) = VK_LEFT) then
      btnChanAddClick(Sender)
    else if (Ord(Key) = VK_RIGHT) then
      btnChanRemoveClick(Sender);
  end;
end;

procedure TIPTVGroupForm.FormShow(Sender: TObject);
var
  i: Integer;
  Font_size: Integer;
  Font_name: string;
  Row_height: Integer;
begin
  Font_size := 0;
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
  end;
  if not TryStrToInt(dmMain.GetIniValue('ROW_HEIGHT'), i) then
    i := 0;
  Row_height := i;
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TDBGridEh then
    begin
      (Components[i] as TDBGridEh).RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
      if (Components[i] as TDBGridEh).DataSource.DataSet.Active then
        (Components[i] as TDBGridEh).DefaultApplySorting;
      if Font_size <> 0 then
      begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
      if Row_height <> 0 then
      begin
        (Components[i] as TDBGridEh).ColumnDefValues.Layout := tlCenter;
        (Components[i] as TDBGridEh).RowHeight := Row_height;
      end;
    end
    else if Font_size <> 0 then
    begin
      if (Components[i] is TMemo) then
      begin
        (Components[i] as TMemo).Font.Name := Font_name;
        (Components[i] as TMemo).Font.Size := Font_size;
      end
      else if (Components[i] is TDBMemoEh) then
      begin
        (Components[i] as TDBMemoEh).Font.Name := Font_name;
        (Components[i] as TDBMemoEh).Font.Size := Font_size;
      end
      else if (Components[i] is TDBMemo) then
      begin
        (Components[i] as TDBMemo).Font.Name := Font_name;
        (Components[i] as TDBMemo).Font.Size := Font_size;
      end;
    end;
  end;
end;

procedure TIPTVGroupForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  OkCancelFrame1.actExitExecute(Sender);
end;

end.
