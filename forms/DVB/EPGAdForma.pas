unit EPGAdForma;
{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.Mask,
  ToolCtrlsEh, DBGridEhToolCtrls, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, GridsEh, DBAxisGridsEh, DBGridEh, EhLibFIB,
  FIBQuery, pFIBQuery, MemTableDataEh, EhLibVCL, DBCtrlsEh, DBGridEhGrouping, DynVarsEh;

type
  TEPGAdForm = class(TForm)
    pnlEvents: TPanel;
    srcChennals: TDataSource;
    srcEPGAd: TDataSource;
    dbgEPGAd: TDBGridEh;
    Label1: TLabel;
    dsEPGAd: TpFIBDataSet;
    dsChennals: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    Query: TpFIBQuery;
    trReadQ: TpFIBTransaction;
    ActionList1: TActionList;
    ActADDAd: TAction;
    ActEDITAd: TAction;
    pnlButtons: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    pFIBTransaction1: TpFIBTransaction;
    pFIBTransaction2: TpFIBTransaction;
    pnlEditEvent: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    deSTOP_TIME1: TDBDateTimeEditEh;
    deSTOP_TIME: TDBDateTimeEditEh;
    edtTITLE: TDBEditEh;
    deSTART_DATE: TDBDateTimeEditEh;
    mmoDescription: TDBMemoEh;
    btnCancel: TButton;
    btnSave: TButton;
    btnSaveAndNext: TButton;
    pnlChannels: TPanel;
    lbl1: TLabel;
    dbgChannels: TDBGridEh;
    chkAll: TDBCheckBoxEh;
    deSTart_TIME1: TDBDateTimeEditEh;
    chk4EMPTY: TDBCheckBoxEh;
    btnDelAd: TToolButton;
    actDelAd: TAction;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActADDAdExecute(Sender: TObject);
    procedure ActEDITAdExecute(Sender: TObject);
    procedure dbgEPGAdDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveAndNextClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure deSTART_DATEChange(Sender: TObject);
    procedure chkAllClick(Sender: TObject);
    procedure dbgChannelsExit(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure actDelAdExecute(Sender: TObject);
    procedure dsEPGAdNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FToUTCShift: Integer;
    procedure StartEdit(const New: Boolean = False);
    procedure StopEdit;
    function SaveEpgEvent: Boolean;

  public
    { Public declarations }
  end;

var
  EPGAdForm: TEPGAdForm;

implementation

uses
  System.TimeSpan, System.DateUtils,
  DM, MAIN, PrjConst;

{$R *.dfm}

procedure TEPGAdForm.ActADDAdExecute(Sender: TObject);
begin
  StartEdit(True);
end;

procedure TEPGAdForm.ActEDITAdExecute(Sender: TObject);
begin
  StartEdit(False);
end;

procedure TEPGAdForm.dbgEPGAdDblClick(Sender: TObject);
begin
  if not ActEDITAd.Enabled then Exit;

  if not dsEPGAd.FieldByName('START_TIME').IsNull
  then ActEDITAd.Execute
  else ActADDAd.Execute;
end;

procedure TEPGAdForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbgEPGAd.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'EPGAdGrid', False);
  dsEPGAd.Close;
  dsChennals.Close;
  Action := caFree;
  EPGAdForm := nil;
end;

procedure TEPGAdForm.FormCreate(Sender: TObject);
begin
  dbgEPGAd.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'EPGAdGrid', [crpColIndexEh, crpColWidthsEh, crpColVisibleEh,
    crpSortMarkerEh]);

  FToUTCShift := -1 * (TTimeZone.Local.UtcOffset.Hours * 60 + TTimeZone.Local.UtcOffset.Minutes);
end;

procedure TEPGAdForm.FormShow(Sender: TObject);
begin
  dsEPGAd.Open;
  dsChennals.CloseOpen(True);
  pnlButtons.Visible := dmMain.AllowedAction(rght_EPG_EditEvent);
  ActADDAd.Enabled := dmMain.AllowedAction(rght_EPG_EditEvent);
  ActEDITAd.Enabled := ActADDAd.Enabled;
  actDelAd.Enabled := ActADDAd.Enabled;
end;

procedure TEPGAdForm.StartEdit(const New: Boolean = False);
begin
  pnlEditEvent.Visible := True;

  dbgEPGAd.Enabled := False;
  pnlButtons.Enabled := False;
  dbgChannels.ReadOnly := False;
  if (New) or (dsEPGAd.RecordCount = 0)
  then dsEPGAd.Append
  else dsEPGAd.Edit;

  deSTART_DATE.SetFocus;
end;

procedure TEPGAdForm.StopEdit;
begin
  pnlEditEvent.Visible := False;
  dbgEPGAd.Enabled := True;
  pnlButtons.Enabled := True;
  dbgChannels.ReadOnly := True;
end;

procedure TEPGAdForm.btnSaveClick(Sender: TObject);
begin
  if dsEPGAd.State in [dsInsert, dsEdit]
  then
    if SaveEpgEvent
    then StopEdit;
end;

procedure TEPGAdForm.btnCancelClick(Sender: TObject);
begin
  if dsEPGAd.State in [dsInsert, dsEdit]
  then dsEPGAd.Cancel;
  StopEdit;
end;

procedure TEPGAdForm.btnSaveAndNextClick(Sender: TObject);
var
  ed: TDateTime;
begin
  if dsEPGAd.State in [dsInsert, dsEdit]
  then
    if SaveEpgEvent
    then begin
      ed := dsEPGAd['STOP_TIME'];
      dsEPGAd.Next;
      if not dsEPGAd.eof
      then dsEPGAd.Edit
      else dsEPGAd.Append;

      dsEPGAd['START_TIME'] := ed;
      edtTITLE.SetFocus;
    end;
end;

procedure TEPGAdForm.FormKeyPress(Sender: TObject; var Key: Char);
var
  go: Boolean;
begin
  if pnlEditEvent.Visible
  then begin
    if (Key = #13)
    then begin
      go := True;
      if (ActiveControl is TDBGridEh)
        then go := False;

      if go
      then begin
        Key := #0; // eat enter key
        PostMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
      end;
    end;
  end;
end;

procedure TEPGAdForm.deSTART_DATEChange(Sender: TObject);
begin
  if not pnlEditEvent.Visible  then Exit;
  
  if dsEPGAd.State = dsInsert
  then begin
    if VarIsNullEh(deSTOP_TIME.Value)
    then deSTOP_TIME.Value := Time();
  end;
end;

function TEPGAdForm.SaveEpgEvent: Boolean;
begin
  Result := False;
  if dsEPGAd.State in [dsInsert, dsEdit]
  then begin
    if VarIsNull(deSTART_DATE.Value)
    then begin
      deSTART_DATE.SetFocus;
      Exit;
    end;

    if VarIsNull(deSTOP_TIME.Value) //dsEPGAd.FieldByName('STOP_TIME').IsNull
    then begin
      deSTOP_TIME.SetFocus;
      Exit;
    end;

    if ((edtTITLE.Text = '')
      and (mmoDescription.Lines.Text = ''))
    then begin
      edtTITLE.SetFocus;
      Exit;
    end;

    dsEPGAd.Post;
    Result := True;
  end;
end;

procedure TEPGAdForm.chkAllClick(Sender: TObject);
begin
  pnlChannels.Visible := not chkAll.Checked;
end;

procedure TEPGAdForm.dbgChannelsExit(Sender: TObject);
begin
  if dsChennals.State = dsEdit
  then dsChennals.Post;
end;

procedure TEPGAdForm.btnCloseClick(Sender: TObject);
begin
  StopEdit;
end;

procedure TEPGAdForm.actDelAdExecute(Sender: TObject);
var
  s : string;
begin
  if pnlEditEvent.Visible then StopEdit;

  if (dsEPGAd.RecordCount = 0) or dsEPGAd.FieldByName('ID').IsNull
  then
    Exit;

  if not dmMain.AllowedAction(rght_EPG_EditEvent)
  then
    Exit;

  if not dsEPGAd.FieldByName('AD_TITLE').IsNull
  then
    s := dsEPGAd['AD_TITLE']
  else begin
    if not dsEPGAd.FieldByName('AD_DESCRIPTION').IsNull
    then
      s := dsEPGAd['AD_DESCRIPTION'];
  end;
  s:=Copy(s,0,20);


  if MessageDlg(format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes
  then
    dsEPGAd.Delete;

end;

procedure TEPGAdForm.dsEPGAdNewRecord(DataSet: TDataSet);
begin
  dsEPGAd['START_TIME'] := Now();
  dsEPGAd['STOP_TIME'] := IncMonth(Now());
  dsEPGAd['FOR_EMPTY'] := 0;
end;

end.
