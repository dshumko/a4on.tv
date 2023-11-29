unit ChannelsForma;

{$I defines.inc}

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.Actions, System.UITypes, System.StrUtils,
  Data.DB,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Menus, Vcl.Buttons,
  GridForma, FIBDataSet, pFIBDataSet, GridsEh, DBGridEh, ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, EhLibFIB,
  EhLibJPegImage,
  PrjConst, CnErrorProvider, EhLibVCL, EhLibGIFImage, EhLibPNGImage, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  DBGridEhGrouping, DynVarsEh, PropFilerEh, PropStorageEh;

type
  TChannelsForm = class(TGridForm)
    dsChannels: TpFIBDataSet;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    actImport: TAction;
    dsChannelsCH_ID: TFIBIntegerField;
    dsChannelsCH_NUMBER: TFIBIntegerField;
    dsChannelsCH_NAME: TFIBWideStringField;
    dsChannelsCH_NOTICE: TFIBWideStringField;
    dsChannelsCH_PAID_TO: TFIBDateField;
    dsChannelsCH_FREQ: TFIBBCDField;
    dsChannelsCH_CODED: TFIBBooleanField;
    dsChannelsCH_TRUNK: TFIBIntegerField;
    dsChannelsCH_TRUNK_NUMBER: TFIBIntegerField;
    dsChannelsCH_ICON: TFIBBlobField;
    dsChannelsDEFINITION: TFIBWideStringField;
    dsChannelsLANG: TFIBWideStringField;
    dsChannelsDVBGENRES: TFIBWideStringField;
    dsChannelsMINAGE: TFIBIntegerField;
    dsChannelsACCESS_ID: TFIBIntegerField;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsChannelsCH_CONTACT: TFIBWideStringField;
    dsChannelsCONTRACT_ID: TFIBIntegerField;
    dsChannelsSRC_NAME: TFIBWideStringField;
    dsChannelsCARD_NAME: TFIBWideStringField;
    dsChannelsCH_LIC: TFIBWideStringField;
    dsChannelsCH_CERT: TFIBWideStringField;
    dsChannelsCH_THEME: TFIBWideStringField;
    intfldChannelsIS_CODED: TFIBIntegerField;
    intfldChannelsIS_ANALOG: TFIBIntegerField;
    intfldChannelsIS_DIGIT: TFIBIntegerField;
    intfldChannelsLCN: TFIBIntegerField;
    intfldChannelsSID: TFIBIntegerField;
    intfldChannelsTSID: TFIBIntegerField;
    intfldChannelsNID: TFIBIntegerField;
    intfldChannelsON_DVB: TFIBIntegerField;
    intfldChannelsDvbs_Id: TFIBIntegerField;
    intfldChannelsCS_ID: TFIBIntegerField;
    btn1: TToolButton;
    btnChangeTo: TToolButton;
    actChangeTo: TAction;
    miN1: TMenuItem;
    N1: TMenuItem;
    miEdit: TMenuItem;
    miChangeTo: TMenuItem;
    fbwdstrngfldChannelsDIS_C_NUMBER: TFIBWideStringField;
    fbdtfldChannelsDIS_C_DATE: TFIBDateField;
    fbwdstrngfldChannelsDIS_NAME: TFIBWideStringField;
    fbntgrfldChannelsDIS_ID: TFIBIntegerField;
    fbntgrfldChannelsCNTR_ID: TFIBIntegerField;
    btn2: TToolButton;
    btnShowIssue: TToolButton;
    actShowIssue: TAction;
    pnlAddons: TPanel;
    splAddons: TSplitter;
    dbgAddons: TDBGridEh;
    PropStorageEh: TPropStorageEh;
    dsIssues: TpFIBDataSet;
    trRA: TpFIBTransaction;
    srcIssues: TDataSource;
    btn3: TToolButton;
    chkATV: TCheckBox;
    btn4: TToolButton;
    chkDVB: TCheckBox;
    btn5: TToolButton;
    chkFREE: TCheckBox;
    miComSep: TMenuItem;
    miCommands: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure dsChannelsAfterOpen(DataSet: TDataSet);
    procedure actNewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDeleteExecute(Sender: TObject);
    procedure actImportExecute(Sender: TObject);
    procedure dbGridDblClick(Sender: TObject);
    procedure actChangeToExecute(Sender: TObject);
    procedure actShowIssueExecute(Sender: TObject);
    procedure chkATVClick(Sender: TObject);
  private
    { Private declarations }
    FCanEdit: Boolean;
    FCanEditAll: Boolean;
    FAddonVisible: Boolean;
    procedure FilterByUse();
    procedure CreateCommandsMenu;
    procedure miCmdClickClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  ChannelsForm: TChannelsForm;

procedure ShowChannel(const CH_ID: Integer);

implementation

uses
  DM, ChannelEditForma, MAIN, ChannImport, DVBSettings, ChanSourcesForma, SatCardsForma, ChangeChannelForma,
  DistribForma, HtmlForma, TelnetForma;

{$R *.dfm}

procedure ShowChannel(const CH_ID: Integer);
var
  b: Boolean;
begin
  b := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_View) or
    dmMain.AllowedAction(rght_Dictionary_Channels);
  if not b then
    Exit;

  if Not Assigned(ChannelsForm) then
    ChannelsForm := TChannelsForm.Create(Application);

  if ChannelsForm.dsChannels.Active then
    ChannelsForm.dsChannels.Locate('CH_ID', CH_ID, []);
  ChannelsForm.Show;
end;

procedure TChannelsForm.FormShow(Sender: TObject);
begin
  inherited;
  dbGrid.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'ChanGrid', [crpColIndexEh, crpColWidthsEh, crpColVisibleEh,
    crpSortMarkerEh]);

  FCanEdit := ((dmMain.AllowedAction(rght_Dictionary_Channels)));
  FCanEditAll := ((dmMain.AllowedAction(rght_Dictionary_full)));
  FCanEdit := FCanEdit or FCanEditAll;
  // может редактировать если разрешено редактировать все

  actNew.Enabled := FCanEdit;
  actEdit.Enabled := FCanEdit;
  actDelete.Enabled := FCanEdit;
  actImport.Enabled := FCanEdit;
  actChangeTo.Enabled := FCanEdit;

  FAddonVisible := False;

  CreateCommandsMenu;

  dsChannels.Open;
  dbGrid.DefaultApplySorting;
  dsChannels.First;
end;

procedure TChannelsForm.dbGridDblClick(Sender: TObject);
var
  ScrPt, GrdPt: TPoint;
  Cell: TGridCoord;
  S: String;
begin
  ScrPt := Mouse.CursorPos;
  GrdPt := dbGrid.ScreenToClient(ScrPt);
  Cell := dbGrid.MouseCoord(GrdPt.X, GrdPt.Y);
  S := UpperCase(dbGrid.Fields[Cell.X - 1].FieldName);
  if ((S = 'LCN') or (S = 'SID') or (S = 'TSID') or (S = 'NID')) then
  begin
    if not dsChannels.FieldByName('Dvbs_Id').IsNull then
    begin
      ShowTransponder(dsChannels['Dvbs_Id'], dsChannels['CH_Id']);
    end;
  end
  else if ((S = 'SRC_NAME')) then
  begin
    if not dsChannels.FieldByName('CS_ID').IsNull then
    begin
      ShowChanSource(dsChannels['CS_ID'], dsChannels['CH_Id']);
    end;
  end
  else if (S = 'CARD_NAME') then
  begin
    if not dsChannels.FieldByName('CARD_NAME').IsNull then
    begin
      ShowSatCard(dsChannels['CARD_NAME'], dsChannels['CH_Id']);
    end;
  end
  else if ((S = 'DIS_C_DATE') or (S = 'DIS_NAME') or (S = 'DIS_C_NUMBER')) then
  begin
    if ((not dsChannels.FieldByName('DIS_ID').IsNull) and (not dsChannels.FieldByName('CNTR_ID').IsNull)) then
    begin
      ShowDistribChan(dsChannels['DIS_ID'], dsChannels['CNTR_ID']);
    end;
  end
  else
    inherited;

end;

procedure TChannelsForm.dsChannelsAfterOpen(DataSet: TDataSet);
begin
  inherited;

  actDelete.Visible := (dsChannels.RecordCount > 0);
  actEdit.Visible := (dsChannels.RecordCount > 0);
end;

procedure TChannelsForm.actNewExecute(Sender: TObject);
var
  c: Int64;
  bm: TBookmark;
begin
  inherited;
  c := EditChannel(-1, 1);
  if c > -1 then
  begin
    bm := dsChannels.GetBookmark;
    dsChannels.CloseOpen(true);
    dsChannels.GotoBookmark(bm);
    dsChannels.Locate('CH_ID', c, []);
  end;
end;

procedure TChannelsForm.actShowIssueExecute(Sender: TObject);
begin
  inherited;
  FAddonVisible := not FAddonVisible;
  actShowIssue.Checked := FAddonVisible;
  pnlAddons.Visible := FAddonVisible;
  splAddons.Visible := FAddonVisible;
  dsIssues.Active := FAddonVisible;
end;

procedure TChannelsForm.chkATVClick(Sender: TObject);
begin
  inherited;
  FilterByUse();
end;

procedure TChannelsForm.actEditExecute(Sender: TObject);
var
  c: Integer;
begin
  inherited;
  if dsChannels.FieldByName('CH_ID').IsNull then
    c := -1
  else
    c := dsChannels['CH_ID'];

  if EditChannel(c, 1) > -1 then
    dsChannels.refresh;
end;

procedure TChannelsForm.actImportExecute(Sender: TObject);
begin
  inherited;
  with TChImportForm.Create(self) do
  begin
    ShowModal;
    dsChannels.Close;
    dsChannels.Open;
    Free;
  end;
end;

procedure TChannelsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dbGrid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'ChanGrid', False);
  ChannelsForm := nil;
end;

procedure TChannelsForm.actChangeToExecute(Sender: TObject);
var
  new_id: Integer;
begin
  inherited;
  if (dsChannels.FieldByName('CH_ID').IsNull or dsChannels.FieldByName('CH_NAME').IsNull) then
    Exit;

  new_id := ChangeChannel(dsChannels['CH_ID'], dsChannels['CH_NAME']);
  if new_id > 0 then
  begin
    dsChannels.refresh;
    if dsChannels.Locate('CH_ID', new_id, []) then
      dsChannels.refresh;
  end;
end;

procedure TChannelsForm.actDeleteExecute(Sender: TObject);
var
  i: Integer;
  S: string;
  answer: string;
  fq: TpFIBQuery;
begin
  inherited;
  if dsChannels.RecordCount > 0 then
  begin
    if dbGrid.SelectedRows.Count > 0 then
    begin
      if (MessageDlg(Format(rsDeleteChannels, [dbGrid.SelectedRows.Count]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
      then
      begin
        for i := dbGrid.SelectedRows.Count - 1 downto 0 do
        begin
          dbGrid.DataSource.DataSet.Bookmark := dbGrid.SelectedRows[i];
          dsChannels.Delete;
        end;
      end
    end
    else
    begin
      S := '';
      if dbGrid.DataSource.DataSet.FieldByName('CH_NAME').IsNull then
        S := dbGrid.DataSource.DataSet['CH_NAME'];
      answer := '';
      fq := TpFIBQuery.Create(self);
      try
        fq.Database := dmMain.dbTV;
        fq.Transaction := dmMain.trReadQ;
        fq.sql.Add('select '' услуга '' || s.Name  as WS');
        fq.sql.Add('  from CHANNELS_IN_SERVCE cs');
        fq.sql.Add(' inner join services s on (s.Service_Id = cs.Srv_Id)');
        fq.sql.Add('  where cs.Ch_Id = :Ch_Id');
        fq.sql.Add('union');
        fq.sql.Add('select '' поток DVB '' || ds.Name as WS');
        fq.sql.Add('  from DVB_STREAM_CHANNELS cs');
        fq.sql.Add(' inner join DVB_STREAMS ds on (ds.Dvbs_Id = cs.Dvbs_Id)');
        fq.sql.Add('  where cs.Ch_Id = :Ch_Id');
        fq.ParamByName('Ch_Id').AsInteger := dbGrid.DataSource.DataSet['CH_ID'];
        fq.Transaction.StartTransaction;
        fq.ExecQuery;
        while not fq.Eof do
        begin
          answer := fq.FN('WS').AsString + #13#10 + answer;
          fq.Next;
        end;
        fq.Close;
        fq.Transaction.Commit;
      finally
        fq.Free;
      end;
      if (answer = '') then
      begin

        if (MessageDlg(Format(rsDeleteChannel, [S]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
          dsChannels.Delete;
      end
      else
        ShowMessage(Format(rsDelChanError, [answer]));
    end;
  end;
end;

procedure TChannelsForm.FilterByUse();
var
  fltr: string;
begin
  if (chkATV.Checked and chkDVB.Checked and chkFREE.Checked) then
  begin //
    dsChannels.ParamByName('filter').AsString := '';
    dsChannels.CloseOpen(true);
    Exit;
  end;

  if (chkATV.Checked) then
  begin
    fltr := ' (not c.CH_NUMBER is null) '
  end;
  if (chkDVB.Checked) then
  begin
    fltr := IfThen(fltr.IsEmpty, '', fltr + ' or ') + ' ((not c.CH_TRUNK_NUMBER is null) ' +
      ' or (exists(select s.Ch_Id from Dvb_Stream_Channels s where s.Ch_Id = c.Ch_Id))) ';
  end;
  if (chkFREE.Checked) then
  begin
    fltr := IfThen(fltr.IsEmpty, '', fltr + ' or ') + ' ((c.CH_NUMBER is null) and (c.CH_TRUNK_NUMBER is null) ' +
      ' and (not exists(select s.Ch_Id from Dvb_Stream_Channels s where s.Ch_Id = c.Ch_Id)) ) ';
  end;

  if (not fltr.IsEmpty) then
  begin
    dsChannels.ParamByName('filter').AsString := ' where ' + fltr;
    dsChannels.CloseOpen(true);
  end;
end;

procedure TChannelsForm.CreateCommandsMenu;
var
  NewItem: TMenuItem;
begin
  miCommands.Clear;

  with dmMain.qRead do
  begin
    sql.Clear;
    sql.Add('select ec.ec_id, ec.name, ec.command');
    sql.Add(' from equipment_cmd_grp ec');
    sql.Add('where ec.in_gui = 1 and ec.Eg_Id = -2');
    sql.Add('order by name');
    // ParamByName('customer_id').AsInteger := FDataSource.DataSet['CUSTOMER_ID'];
    Transaction.StartTransaction;
    ExecQuery;
    while not Eof do
    begin
      NewItem := TMenuItem.Create(miCommands);
      NewItem.Caption := FieldByName('name').AsString;
      NewItem.Tag := FieldByName('ec_id').AsInteger;
      NewItem.OnClick := miCmdClickClick;
      miCommands.Add(NewItem);
      Next;
    end;
    Close;
    Transaction.Rollback;
  end;

  miCommands.Visible := (miCommands.Count > 0);
  miComSep.Visible := miCommands.Visible;
end;

procedure TChannelsForm.miCmdClickClick(Sender: TObject);
var
  cmd: string;
  eol_chars: Integer;
  CMD_TYPE: Integer;
  URL, AUT_USER, AUT_PSWD: String;

  procedure replaceParams(var InStr: String);
  var
    s: string;
  begin
    if (not dsChannels.FieldByName('CH_NAME').IsNull)
    then s := dsChannels['CH_NAME']
    else s := '';
    InStr := ReplaceStr(InStr, '<c_name>', s);

    if (not dsChannels.FieldByName('CH_ID').IsNull)
    then s := dsChannels['CH_ID']
    else s := '';
    InStr := ReplaceStr(InStr, '<c_id>', s);

    if (not dsChannels.FieldByName('CH_NUMBER').IsNull)
    then s := dsChannels['CH_NUMBER']
    else s := '';
    InStr := ReplaceStr(InStr, '<a_num>', s);

    if (not dsChannels.FieldByName('CH_TRUNK').IsNull)
    then s := dsChannels['CH_TRUNK']
    else s := '';
    InStr := ReplaceStr(InStr, '<trunk>', s);

    if (not dsChannels.FieldByName('CH_TRUNK_NUMBER').IsNull)
    then s := dsChannels['CH_TRUNK_NUMBER']
    else s := '';
    InStr := ReplaceStr(InStr, '<trunk_n>', s);

    if (not dsChannels.FieldByName('NID').IsNull)
    then s := dsChannels['NID']
    else s := '';
    InStr := ReplaceStr(InStr, '<nid>', s);

    if (not dsChannels.FieldByName('TSID').IsNull)
    then s := dsChannels['TSID']
    else s := '';
    InStr := ReplaceStr(InStr, '<tsid>', s);

    if (not dsChannels.FieldByName('SID').IsNull)
    then s := dsChannels['SID']
    else s := '';
    InStr := ReplaceStr(InStr, '<sid>', s);

    InStr := ReplaceStr(InStr, '<date>', FormatDateTime('Y-m-d h:n', Now()));
  end;

begin
  if not(Sender is TMenuItem) then
    Exit;

  if (not dsChannels.Active) or (dsChannels.RecordCount = 0) then
    Exit;

  with dmMain.qRead do
  begin
    sql.Clear;
    sql.Add('select ec.ec_id, ec.name, ec.command, ec.eol_chrs, ec.CMD_TYPE, ec.URL, ec.AUT_USER, ec.AUT_PSWD');
    sql.Add('from equipment_cmd_grp ec');
    sql.Add('where ec.ec_id = :ec_id');
    ParamByName('ec_id').AsInteger := (Sender as TMenuItem).Tag;

    Transaction.StartTransaction;
    ExecQuery;

    if not FieldByName('command').IsNull then
      cmd := FieldByName('command').AsString;

    if FieldByName('eol_chrs').IsNull then
      eol_chars := 0
    else
    begin
      if FieldByName('eol_chrs').AsString = '\r\n' then
        eol_chars := 0
      else if FieldByName('eol_chrs').AsString = '\n\r' then
        eol_chars := 1
      else if FieldByName('eol_chrs').AsString = '\n' then
        eol_chars := 2
      else if FieldByName('eol_chrs').AsString = '\r' then
        eol_chars := 3
      else
        eol_chars := 0
    end;

    if FieldByName('CMD_TYPE').IsNull then
      CMD_TYPE := 0
    else
      CMD_TYPE := FieldByName('CMD_TYPE').AsInteger;
    if not FieldByName('URL').IsNull then
      URL := FieldByName('URL').AsString;
    if not FieldByName('AUT_USER').IsNull then
      AUT_USER := FieldByName('AUT_USER').AsString;
    if not FieldByName('AUT_PSWD').IsNull then
      AUT_PSWD := FieldByName('AUT_PSWD').AsString;

    Close;
    Transaction.Rollback;
  end;

  if cmd <> '' then
    replaceParams(cmd);

  if URL <> '' then
    replaceParams(URL);

  case CMD_TYPE of
    2:
      cmd := GetHtml(URL, AUT_USER, AUT_PSWD, cmd, true, (Sender as TMenuItem).Caption);
  else
    if cmd <> '' then
      cmd := telnet(URL, 'telnet', ReplaceStr(cmd, #13#10, '\r'), eol_chars, true);
  end;

end;

end.
