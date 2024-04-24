unit DVBSettings;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.TimeSpan, System.Actions, System.UITypes,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.StdActns, Vcl.ActnList, Vcl.Menus,
  Vcl.Grids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask,
  DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, EhLibFIB, DBGridEhFindDlgs, ToolCtrlsEh,
  DBGridEhToolCtrls,
  DBAxisGridsEh, PrjConst, FIBDatabase, pFIBDatabase, DBCtrlsEh, EhLibVCL, MemTableDataEh, MemTableEh, DataDriverEh,
  pFIBDataDriverEh, DBGridEhGrouping, DynVarsEh, PrnDbgeh, PropFilerEh, PropStorageEh, amSplitter;

type
  TDVBSettinsForm = class(TForm)
    srcTS: TDataSource;
    Actions: TActionList;
    pmPopUp: TPopupMenu;
    pmgCopy: TMenuItem;
    pmgSelectAll: TMenuItem;
    pmgSep1: TMenuItem;
    pmgSaveSelection: TMenuItem;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsTS: TpFIBDataSet;
    pnlChannels: TPanel;
    grdCh: TDBGridEh;
    dbgEPG: TDBGridEh;
    actlstSearch: TActionList;
    actFilterSearchText: TAction;
    actSearchNext: TAction;
    actSearchPrev: TAction;
    pnlNetwork: TPanel;
    grdNetwork: TDBGridEh;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    edtSearch: TDBEditEh;
    ToolBar3: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton15: TToolButton;
    pnlStream: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Panel6: TPanel;
    SpeedButton2: TSpeedButton;
    tlbSearch: TToolBar;
    btnFilterSearchText: TToolButton;
    btnSearchNext: TToolButton;
    btnSearchPrev: TToolButton;
    edtSearch1: TDBEditEh;
    ToolBar1: TToolBar;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    grdTS: TDBGridEh;
    srcNetwork: TDataSource;
    srcChannels: TDataSource;
    srcEPG: TDataSource;
    dsNetwork: TpFIBDataSet;
    dsChannels: TpFIBDataSet;
    dsEPG: TpFIBDataSet;
    actTSNEW: TAction;
    actTSedit: TAction;
    actTSdel: TAction;
    actNetworkNew: TAction;
    actNetworkEdit: TAction;
    actNetworkDel: TAction;
    spl1: TSplitter;
    spl2: TSplitter;
    Splitter1: TSplitter;
    pgcMode: TPageControl;
    tsEdit: TTabSheet;
    tsView: TTabSheet;
    dbgView: TDBGridEh;
    mtView: TMemTableEh;
    drvFIBView: TpFIBDataDriverEh;
    dsView: TDataSource;
    PrintGrid: TPrintDBGridEh;
    pmViewGrid: TPopupMenu;
    actSave: TAction;
    actPrint: TAction;
    actPrint1: TMenuItem;
    N1: TMenuItem;
    ToolBar4: TToolBar;
    ToolButton16: TToolButton;
    btnExport: TToolButton;
    ToolButton18: TToolButton;
    btnImport: TToolButton;
    actlstDVB: TActionList;
    actExport: TAction;
    actImport: TAction;
    PropStorageEh: TPropStorageEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmgCopyClick(Sender: TObject);
    procedure pmgSelectAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure edtSearchEnter(Sender: TObject);
    procedure edtSearchExit(Sender: TObject);
    procedure edtSearchKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure actTSNEWExecute(Sender: TObject);
    procedure actTSeditExecute(Sender: TObject);
    procedure actTSdelExecute(Sender: TObject);
    procedure actNetworkNewExecute(Sender: TObject);
    procedure actNetworkEditExecute(Sender: TObject);
    procedure grdNetworkDblClick(Sender: TObject);
    procedure grdTSDblClick(Sender: TObject);
    procedure actNetworkDelExecute(Sender: TObject);
    procedure dbgEPGGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure pgcModeChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure actImportExecute(Sender: TObject);
  private
    FTimeZone: Integer;
  public
    { Public declarations }
  end;

var
  DVBSettinsForm: TDVBSettinsForm;

procedure ShowTransponder(const DVBS_ID: Integer; const CH_ID: Integer = -1);

implementation

uses
  System.DateUtils,
  DM, MAIN, AtrStrUtils, DVBStreamForma, DVBNetworkForma, pFIBQuery, pFIBProps;

{$R *.dfm}

procedure ShowTransponder(const DVBS_ID: Integer; const CH_ID: Integer = -1);
var
  b: boolean;
begin
  b := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_DVB_edit) or
    dmMain.AllowedAction(rght_DVB_view);
  if not b then
    Exit;

  if Not Assigned(DVBSettinsForm) then
    DVBSettinsForm := TDVBSettinsForm.Create(Application);

  if DVBSettinsForm.dsTS.Active then
    DVBSettinsForm.dsTS.Locate('DVBS_ID', DVBS_ID, []);

  if (CH_ID >= 0) and (DVBSettinsForm.dsChannels.Active) then
    DVBSettinsForm.dsChannels.Locate('CH_ID', CH_ID, []);

  DVBSettinsForm.Show;
end;

procedure TDVBSettinsForm.actExportExecute(Sender: TObject);
var
  s: string;
  at: array [0 .. 7] of String;
  i: Integer;
  cr: TCursor;
begin
  if Application.MessageBox('Экспортировать кналы и настройки DVB?', 'Экспорт настроек DVB',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
  begin
    Exit;
  end;
  at[0] := 'Epg';
  at[1] := 'Dvb_Stream_Channels';
  at[2] := 'Dvb_Streams';
  at[3] := 'Dvb_Network';
  at[4] := 'Epg_Mapping_Genre';
  at[5] := 'Epg_Mapping';
  at[6] := 'Epg_Sources';
  at[7] := 'Channels';

  cr := Screen.Cursor;
  Screen.Cursor := crSQLWait;

  with TpFIBQuery.Create(Nil) do
    try
      DataBase := dmMain.dbTV;
      Transaction := dmMain.trReadQ;
      Options := [qoStartTransaction, qoAutoCommit];
      for i := 7 downto 1 do
      begin
        s := at[i];
        SQL.text := 'select * from ' + s;
        BatchOutputRawFile('dvb_' + s + '.exp');
      end;
    finally
      Free;
    end;

  Screen.Cursor := cr;
end;

procedure TDVBSettinsForm.actImportExecute(Sender: TObject);
var
  s: string;
  at: array [0 .. 7] of String;
  ins_arr: array [0 .. 7] of String;
  i: Integer;
  cr: TCursor;
  allFiles: boolean;
begin
  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;

  if Application.MessageBox('Внимание! При импорте все настройки DVB будут удалены!' + #13#10 +
    'Импортировать кналы и настройки DVB?', 'Импорт настроек DVB', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDNO
  then
  begin
    Exit;
  end;

  at[0] := 'Epg';
  at[1] := 'Dvb_Stream_Channels';
  at[2] := 'Dvb_Streams';
  at[3] := 'Dvb_Network';
  at[4] := 'Epg_Mapping';
  at[5] := 'Epg_Mapping_Genre';
  at[6] := 'Epg_Sources';
  at[7] := 'Channels';
  allFiles := True;
  for i := 7 downto 1 do
  begin
    s := at[i];
    allFiles := allFiles and fileExists('dvb_' + s + '.exp');
  end;

  if allFiles then
  begin
    cr := Screen.Cursor;
    Screen.Cursor := crSQLWait;
    ins_arr[0] := 'Epg';
    ins_arr[1] := 'insert into Dvb_Stream_Channels (Dvbs_Id, Ch_Id, Sid, Lcn, Notice, Tsid) ' +
      'values (:Dvbs_Id, :Ch_Id, :Sid, :Lcn, :Notice, :Tsid)';
    ins_arr[2] :=
      'insert into Dvb_Streams (Dvbn_Id, Dvbs_Id, Name, Es_Ip, Es_Port, Bitrate, Notice, Tsid, Qam, Freq, Epg_Updated, Onid, Aostrm) '
      + ' values (:Dvbn_Id, :Dvbs_Id, :Name, :Es_Ip, :Es_Port, :Bitrate, :Notice, :Tsid, :Qam, :Freq, :Epg_Updated, :Onid, :Aostrm)';
    ins_arr[3] :=
      'insert into Dvb_Network (Dvbn_Id, Name, Notice, Onid, Nid, Pids, Descriptors, Timeoffset, Lang, Country, Epg_Updated, Aostrm) '
      + ' values (:Dvbn_Id, :Name, :Notice, :Onid, :Nid, :Pids, :Descriptors, :Timeoffset, :Lang, :Country, :Epg_Updated, :Aostrm)';
    ins_arr[4] := 'insert into Epg_Mapping (Epg_Id, Ch_Id, Epg_Code) values (:Epg_Id, :Ch_Id, :Epg_Code)';
    ins_arr[5] := 'insert into Epg_Mapping_Genre (Epg_Id, Genre_Id, Source_Genre) ' +
      'values (:Epg_Id, :Genre_Id, :Source_Genre)';
    ins_arr[6] :=
      'insert into Epg_Sources (Id, Name, Url, Notice, Time_Shift, Parseas, Urllogin, Urlpassword, Local_Tzone, Local_File, Hand_Only) '
      + ' values (:Id, :Name, :Url, :Notice, :Time_Shift, :Parseas, :Urllogin, :Urlpassword, :Local_Tzone, :Local_File, :Hand_Only)';
    ins_arr[7] :=
      'insert into Channels (Ch_Id, Ch_Number, Ch_Name, Ch_Notice, Ch_Paid_To, Ch_Freq, Ch_Coded, Ch_Trunk, Ch_Trunk_Number, Ch_Contact, Ch_Icon, Definition, Lang, Dvbgenres, Minage, Access_Id) '
      + ' values (:Ch_Id, :Ch_Number, :Ch_Name, :Ch_Notice, :Ch_Paid_To, :Ch_Freq, :Ch_Coded, :Ch_Trunk, :Ch_Trunk_Number, :Ch_Contact, :Ch_Icon, :Definition, :Lang, :Dvbgenres, :Minage, :Access_Id)';
    with TpFIBQuery.Create(Nil) do
      try
        DataBase := dmMain.dbTV;
        Transaction := dmMain.trWriteQ;
        Options := [qoStartTransaction, qoAutoCommit];
        for i := 0 to 7 do
        begin
          s := at[i];
          SQL.text := 'delete from ' + s;
          ExecQuery;
        end;

        for i := 7 downto 1 do
        begin
          SQL.text := ins_arr[i];
          BatchInputRawFile('dvb_' + AnsiString(at[i]) + '.exp');
        end;
      finally
        Free;
      end;

    dsNetwork.CloseOpen(True);
    dsTS.CloseOpen(True);
    dsChannels.CloseOpen(True);
    dsEPG.CloseOpen(True);
    Screen.Cursor := cr;
  end
  else
    ShowMessage('Не удалось импортировать данные.'#13#10'Не найдены файлы для импорта');
end;

procedure TDVBSettinsForm.actNetworkDelExecute(Sender: TObject);
begin
  if dsNetwork.FieldByName('DVBN_ID').IsNull then
    Exit;
  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;

  if (dsNetwork.RecordCount = 0) or (dsTS.Active and (dsTS.RecordCount > 0)) then
    Exit;

  if (MessageDlg(Format(rsDeleteWithName, [dsNetwork['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dsNetwork.Delete;
end;

procedure TDVBSettinsForm.actNetworkEditExecute(Sender: TObject);
begin
  if dsNetwork.FieldByName('DVBN_ID').IsNull then
    Exit;

  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;
  if EditDVBNetwork(dsNetwork['DVBN_ID']) > -1 then
    dsNetwork.Refresh;
end;

procedure TDVBSettinsForm.actNetworkNewExecute(Sender: TObject);
begin
  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;
  if EditDVBNetwork(-1) > -1 then
    dsNetwork.CloseOpen(True);
end;

procedure TDVBSettinsForm.actTSdelExecute(Sender: TObject);
begin
  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;
  if (srcTS.DataSet.RecordCount = 0) or (dsChannels.Active and (dsChannels.RecordCount > 0)) then
    Exit;
  if (MessageDlg(Format(rsDeleteWithName, [srcTS.DataSet['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    srcTS.DataSet.Delete;
end;

procedure TDVBSettinsForm.actTSeditExecute(Sender: TObject);
begin
  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;

  if (dsNetwork.FieldByName('DVBN_ID').IsNull) or (not dsTS.Active) or (dsTS.RecordCount = 0) or
    (dsTS.FieldByName('DVBS_ID').IsNull) then
    Exit;
  EpgStreamModify(dsTS['DVBS_ID'], dsNetwork['DVBN_ID']);
  srcTS.DataSet.Refresh;
  dsChannels.CloseOpen(True);
  dsEPG.CloseOpen(True);
end;

procedure TDVBSettinsForm.actTSNEWExecute(Sender: TObject);
begin
  if dsNetwork.FieldByName('DVBN_ID').IsNull then
    Exit;

  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;
  if EpgStreamModify(-1, dsNetwork['DVBN_ID']) > -1 then
  begin
    dsTS.CloseOpen(True);
    dsChannels.CloseOpen(True);
    dsEPG.CloseOpen(True);
  end;
end;

procedure TDVBSettinsForm.dbgEPGGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var
  curTime: TDateTime;
begin
  if dsEPG.FieldByName('DATE_START').IsNull or dsEPG.FieldByName('DATE_STOP').IsNull then
    Exit;
  curTime := IncMinute(Now(), FTimeZone);

  if dsEPG.FieldByName('DATE_STOP').AsDateTime < curTime then
    AFont.Color := clGrayText
  else
  begin
    if (dsEPG.FieldByName('DATE_START').AsDateTime < curTime) and (dsEPG.FieldByName('DATE_STOP').AsDateTime > curTime)
    then
      AFont.Color := clRed;
  end;
end;

procedure TDVBSettinsForm.edtSearchChange(Sender: TObject);
var
  grd: TDBGridEh;
begin
  if not(Sender is TDBEditEh) then
    Exit;
  if (Sender as TDBEditEh).Name = 'edtSearch' then
    grd := grdNetwork
  else
    grd := grdTS;

  grd.SearchPanel.SearchingText := (Sender as TDBEditEh).text;
  grd.SearchPanel.RestartFind;
  if (Sender as TDBEditEh).text <> '' then
    actFilterSearchText.ImageIndex := 5
  else
    actFilterSearchText.ImageIndex := 2;
end;

procedure TDVBSettinsForm.edtSearchEnter(Sender: TObject);
var
  grd: TDBGridEh;
begin
  if not(Sender is TDBEditEh) then
    Exit;
  if (Sender as TDBEditEh).Name = 'edtSearch' then
    grd := grdNetwork
  else
    grd := grdTS;
  grd.SearchPanel.Active := True;
end;

procedure TDVBSettinsForm.edtSearchExit(Sender: TObject);
var
  grd: TDBGridEh;
begin
  if not(Sender is TDBEditEh) then
    Exit;
  if (Sender as TDBEditEh).Name = 'edtSearch' then
    grd := grdNetwork
  else
    grd := grdTS;
  grd.SearchPanel.Active := False;
end;

procedure TDVBSettinsForm.edtSearchKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  i: Integer;
  ctrlpressed: boolean;
var
  grd: TDBGridEh;
begin
  if not(Sender is TDBEditEh) then
    Exit;
  if (Sender as TDBEditEh).Name = 'edtSearch' then
    grd := grdNetwork
  else
    grd := grdTS;
  i := grd.SearchPanel.FoundColumnIndex;
  ctrlpressed := ssCtrl in Shift;
  if i >= 0 then
  begin
    case Key of
      VK_RETURN:
        begin
          if ctrlpressed then
            actFilterSearchText.Execute
          else
            grd.SetFocus
        end;
      VK_DOWN:
        actSearchNext.Execute;
      VK_UP:
        actSearchPrev.Execute;
    end;
  end;
end;

procedure TDVBSettinsForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, False);

  dsEPG.Close;
  dsChannels.Close;
  dsTS.Close;
  dsNetwork.Close;
  Action := caFree;
  DVBSettinsForm := nil;
end;

procedure TDVBSettinsForm.FormShow(Sender: TObject);
var
  b: boolean;
  i: Integer;
  Font_size: Integer;
  Font_name: string;
begin
  FTimeZone := -1 * (TTimeZone.Local.UtcOffset.Hours * 60 + TTimeZone.Local.UtcOffset.Minutes);

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

  b := dmMain.AllowedAction(rght_DVB_edit);

  actTSNEW.Enabled := b;
  actTSedit.Enabled := b;
  actTSdel.Enabled := b;

  actNetworkNew.Enabled := b;
  actNetworkEdit.Enabled := b;
  actNetworkDel.Enabled := b;

  dsNetwork.Open;
  dsTS.Open;
  dsChannels.Open;
  {
    if not dsNetwork.FieldByName('TIMEOFFSET').IsNull
    then dsEPG.ParamByName('h_shift').AsInteger := -1 * dsNetwork['TIMEOFFSET']
    else dsEPG.ParamByName('h_shift').AsInteger := 0;
  }
  dsEPG.Open;
end;

procedure TDVBSettinsForm.grdNetworkDblClick(Sender: TObject);
begin
  actNetworkEdit.Execute;
end;

procedure TDVBSettinsForm.grdTSDblClick(Sender: TObject);
begin
  actTSedit.Execute;
end;

procedure TDVBSettinsForm.pmgCopyClick(Sender: TObject);
var
  dbg: TDBGridEh;

begin

  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
      begin
        A4MainForm.CopyDBGrid(dbg);
      end
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TDVBSettinsForm.pmgSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TDVBSettinsForm.pgcModeChange(Sender: TObject);
begin
  mtView.Active := (pgcMode.ActivePage = tsView);
end;

procedure TDVBSettinsForm.N1Click(Sender: TObject);
begin
  PrintGrid.Preview;
end;

procedure TDVBSettinsForm.actSaveExecute(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    A4MainForm.ExportDBGrid((ActiveControl as TDBGridEh), rsTable);
end;

procedure TDVBSettinsForm.actPrintExecute(Sender: TObject);
begin
  PrintGrid.Preview;
end;

end.
