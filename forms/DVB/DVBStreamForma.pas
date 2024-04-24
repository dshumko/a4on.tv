unit DVBStreamForma;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls,
  FIBDataSet, pFIBDataSet, GridsEh, DBGridEh, FIBDatabase, pFIBDatabase, DBCtrlsEh, OkCancel_frame, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, EhLibFIB, EhLibVCL, DBGridEhGrouping, DynVarsEh, PropFilerEh, PropStorageEh, amSplitter;

type
  TDVBStreamForm = class(TForm)
    dsESC: TpFIBDataSet;
    srcESC: TDataSource;
    dsC: TpFIBDataSet;
    srcC: TDataSource;
    dsES: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    srcES: TDataSource;
    OkCancelFrame1: TOkCancelFrame;
    pnlChannels: TPanel;
    spl1: TSplitter;
    pnlSelected: TPanel;
    lbl1: TLabel;
    dbgrdGridSC: TDBGridEh;
    pnlProgrBtn: TPanel;
    btnChanAdd: TSpeedButton;
    btnChanRemove: TSpeedButton;
    pnl3: TPanel;
    lbl2: TLabel;
    dbgrdGridC: TDBGridEh;
    pnlHead: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEditEh;
    dbmNotice: TDBMemoEh;
    PropStorageEh: TPropStorageEh;
    grpEPG: TGroupBox;
    chkAOSTRM: TDBCheckBoxEh;
    DBNumberEditEh1: TDBNumberEditEh;
    Label4: TLabel;
    DBNumberEditEh2: TDBNumberEditEh;
    Label5: TLabel;
    DBEditEh1: TDBEditEh;
    Label6: TLabel;
    grpDVB: TGroupBox;
    edTSID: TDBNumberEditEh;
    edtQAM: TDBNumberEditEh;
    edtFREQ: TDBNumberEditEh;
    Label3: TLabel;
    lbl3: TLabel;
    Label1: TLabel;
    procedure btnChanAddClick(Sender: TObject);
    procedure btnChanRemoveClick(Sender: TObject);
    procedure dbgrdGridCDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
    procedure dsESNewRecord(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function EpgStreamModify(const aDVBS_ID: Integer; const aDVBN_ID: Integer): Integer;

implementation

uses
  DM, MAIN;

{$R *.dfm}

function EpgStreamModify(const aDVBS_ID: Integer; const aDVBN_ID: Integer): Integer;
begin
  with TDVBStreamForm.Create(Application) do
    try
      dsES.ParamByName('DVBS_ID').AsInteger := aDVBS_ID;
      dsES.Open;
      if aDVBS_ID = -1 then
      begin
        dsES.Insert;
        dsES['DVBS_ID'] := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);
        dsES['DVBN_ID'] := aDVBN_ID;
      end;
      if ShowModal = mrOk then
      begin
        if dsESC.State in [dsEdit, dsInsert] then
          dsESC.Post;
        if dsES.State in [dsEdit, dsInsert] then
          dsES.Post;
        result := dsES['DVBS_ID'];
      end
      else
      begin
        if dsES.State in [dsEdit, dsInsert] then
          dsES.Cancel;
        result := -1;
      end;
      dsES.Close;
    finally
      free
    end;
end;

procedure TDVBStreamForm.btnChanAddClick(Sender: TObject);
var
  ch_id: Integer;
begin
  if dsC.EOF then
    Exit;

  dsESC.Append;
  dsESC['DVBS_Id'] := dsES['DVBS_Id'];
  dsESC['TSID'] := dsES['TSID'];
  dsESC['Ch_Id'] := dsC['Ch_Id'];
  dsESC['CH_NAME'] := dsC['CH_NAME'];
  dsESC['DEFINITION'] := dsC['DEFINITION'];
  try
    dsESC.Post;
  except
    dsESC.Cancel;
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

procedure TDVBStreamForm.btnChanRemoveClick(Sender: TObject);
var
  ch_id: Integer;
begin
  if dsESC.EOF then
    Exit;

  dsESC.Delete;

  dsC.DisableControls;
  ch_id := -1;
  if not dsC.EOF then
    ch_id := dsC['Ch_Id'];
  dsC.CloseOpen(true);
  if ch_id <> -1 then
    dsC.Locate('Ch_Id', VarArrayOf([ch_id]), []);
  dsC.EnableControls;
end;

procedure TDVBStreamForm.dbgrdGridCDblClick(Sender: TObject);
begin
  btnChanAddClick(Sender);
end;

procedure TDVBStreamForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, false);
end;

procedure TDVBStreamForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
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

procedure TDVBStreamForm.FormShow(Sender: TObject);
var
  i: Integer;
  Font_size: Integer;
  Font_name: string;
begin
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i) then
  begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
    for i := 0 to ComponentCount - 1 do
    begin
      if Components[i] is TDBGridEh then
      begin
        (Components[i] as TDBGridEh).RestoreColumnsLayoutIni(A4MainForm.GetIniFileName,
          Self.Name + '.' + Components[i].Name, [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);
        if (Components[i] as TDBGridEh).DataSource.DataSet.Active then
          (Components[i] as TDBGridEh).DefaultApplySorting;
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
    end;
  end;
end;

procedure TDVBStreamForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  OkCancelFrame1.actExitExecute(Sender);
end;

procedure TDVBStreamForm.dsESNewRecord(DataSet: TDataSet);
begin
  dsES['ES_PORT'] := 1234;
  dsES['BITRATE'] := 64;
end;

end.
