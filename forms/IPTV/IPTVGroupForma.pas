unit IPTVGroupForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, Buttons, GridsEh,
  DBGridEh, StdCtrls, ExtCtrls, Mask, DBCtrls, FIBDatabase, pFIBDatabase,
  DBCtrlsEh, OkCancel_frame, ComCtrls, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, EhLibFIB, EhLibVCL, DBGridEhGrouping,
  DynVarsEh;

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
    pnl2: TPanel;
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
    Label8: TLabel;
    edtNAME: TDBEditEh;
    edtURL: TDBEditEh;
    dbmNotice: TDBMemoEh;
    Label3: TLabel;
    edtCODE: TDBEditEh;
    lblCode: TLabel;
    chkDISABLED: TDBCheckBoxEh;
    procedure btnChanAddClick(Sender: TObject);
    procedure btnChanRemoveClick(Sender: TObject);
    procedure dbgrdGridCDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure OkCancelFrame1bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function IPTVGroupModify(const aIG_ID: Integer): Integer;

implementation

uses
  DM;

{$R *.dfm}

function IPTVGroupModify(const aIG_ID: Integer): Integer;
begin
  with TIPTVGroupForm.Create(Application) do
    try
      dsIPTVGroup.ParamByName('IG_ID').AsInteger := aIG_ID;
      dsIPTVGroup.Open;
      if aIG_ID = -1
      then begin
        dsIPTVGroup.Insert;
        dsIPTVGroup['IG_ID'] := dmMain.dbTV.Gen_Id('GEN_OPERATIONS_UID', 1);
      end;
      if ShowModal = mrOk
      then begin
        if dsIPTVGroup.State in [dsEdit, dsInsert]
        then dsIPTVGroup.Post;
        if dsIPTVGroup.State in [dsEdit, dsInsert]
        then dsIGC.Post;
        result := dsIPTVGroup['IG_ID'];
      end
      else begin
        if dsIPTVGroup.State in [dsEdit, dsInsert]
        then dsIPTVGroup.Cancel;
        result := -1;
      end;
      dsIPTVGroup.Close;
    finally free
    end;
end;

procedure TIPTVGroupForm.btnChanAddClick(Sender: TObject);
var
  ch_id : Integer;
begin
  if dsC.EOF
  then Exit;

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
  if not dsC.Eof then begin
    dsC.Next;
    ch_id := dsC['Ch_Id'];
  end;
  dsC.CloseOpen(true);
  if ch_id <> -1 then dsC.Locate('Ch_Id', VarArrayOf([ch_id]), []);
  dsC.EnableControls;
end;

procedure TIPTVGroupForm.btnChanRemoveClick(Sender: TObject);
var
  ch_id : Integer;
begin
  if dsIGC.EOF
  then Exit;

  dsIGC.Delete;

  dsC.DisableControls;
  ch_id := -1;
  if not dsC.Eof then
    ch_id := dsC['Ch_Id'];
  dsC.CloseOpen(true);
  if ch_id <> -1 then dsC.Locate('Ch_Id', VarArrayOf([ch_id]), []);
  dsC.EnableControls;
end;

procedure TIPTVGroupForm.dbgrdGridCDblClick(Sender: TObject);
begin
  btnChanAddClick(Sender);
end;

procedure TIPTVGroupForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl])
  then begin
    if (Ord(Key) = VK_RETURN)
    then OkCancelFrame1.actExitExecute(Sender)
    else if (Ord(Key) = VK_LEFT)
    then btnChanAddClick(Sender)
    else if (Ord(Key) = VK_RIGHT)
    then btnChanRemoveClick(Sender);
  end;
end;

procedure TIPTVGroupForm.OkCancelFrame1bbOkClick(Sender: TObject);
begin
  OkCancelFrame1.actExitExecute(Sender);
end;

end.
