unit ChanSourcesForma;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, StdActns, ActnList, Menus, DB, Grids,
  DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, EhLibFIB, DBGridEhImpExp,
  DBGridEhFindDlgs, ToolCtrlsEh, DBGridEhToolCtrls, System.TimeSpan,
  DBAxisGridsEh, System.Actions, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, PrjConst, FIBDatabase, pFIBDatabase,
  Vcl.Mask, DBCtrlsEh, System.UITypes, EhLibVCL, MemTableDataEh, MemTableEh,
  DataDriverEh, pFIBDataDriverEh, DBGridEhGrouping, DynVarsEh, PrnDbgeh,
  PropFilerEh, PropStorageEh;

type
  TChanSourcesForm = class(TForm)
    srcChannel: TDataSource;
    Actions: TActionList;
    pmPopUp: TPopupMenu;
    pmgCopy: TMenuItem;
    pmgSelectAll: TMenuItem;
    pmgSep1: TMenuItem;
    pmgSaveSelection: TMenuItem;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsChannel: TpFIBDataSet;
    actlstSearch: TActionList;
    actFilterSearchText: TAction;
    actSearchNext: TAction;
    actSearchPrev: TAction;
    pnlNetwork: TPanel;
    dbgSource: TDBGridEh;
    Panel3: TPanel;
    Label1: TLabel;
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
    ToolBar1: TToolBar;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    dbgChannel: TDBGridEh;
    srcSource: TDataSource;
    dsSource: TpFIBDataSet;
    actCHnew: TAction;
    actCHedit: TAction;
    actCHdel: TAction;
    actSrcNew: TAction;
    actSrcEdit: TAction;
    actSrcDel: TAction;
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
    actlstDVB: TActionList;
    PropStorageEh: TPropStorageEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmgCopyClick(Sender: TObject);
    procedure pmgSelectAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCHnewExecute(Sender: TObject);
    procedure actCHeditExecute(Sender: TObject);
    procedure actCHdelExecute(Sender: TObject);
    procedure actSrcNewExecute(Sender: TObject);
    procedure actSrcEditExecute(Sender: TObject);
    procedure dbgSourceDblClick(Sender: TObject);
    procedure dbgChannelDblClick(Sender: TObject);
    procedure actSrcDelExecute(Sender: TObject);
    procedure pgcModeChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure dbgSourceColumns5CellDataLinkClick(Grid: TCustomDBGridEh; Column: TColumnEh);
    procedure dbgViewDblClick(Sender: TObject);
  private
    FTimeZone: Integer;
  public
    { Public declarations }
  end;

var
  ChanSourcesForm: TChanSourcesForm;

procedure ShowChanSource(const SRC_ID: Integer; const CH_ID: Integer = -1);

implementation

uses System.DateUtils, DM, MAIN, AtrStrUtils, atrCmdUtils,
  DVBStreamForma, pFIBQuery, pFIBProps, ChanSrcForma, ChanForSrcForma;

{$R *.dfm}

procedure ShowChanSource(const SRC_ID: Integer; const CH_ID: Integer = -1);
var
  b: boolean;
begin
  b := dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_DVB_edit) or
    dmMain.AllowedAction(rght_DVB_view) or dmMain.AllowedAction(rght_Dictionary_Channels) or
    dmMain.AllowedAction(rght_Dictionary_View);

  if not b then
    Exit;

  if Not Assigned(ChanSourcesForm) then
    ChanSourcesForm := TChanSourcesForm.Create(Application);

  if ChanSourcesForm.dsSource.Active then
    ChanSourcesForm.dsSource.Locate('CS_ID', SRC_ID, []);

  if (CH_ID >= 0) and (ChanSourcesForm.dsChannel.Active) then
    ChanSourcesForm.dsChannel.Locate('CH_ID', CH_ID, []);

  ChanSourcesForm.Show;
end;

procedure TChanSourcesForm.actSrcDelExecute(Sender: TObject);
begin
  if dsSource.FieldByName('CS_ID').IsNull then
    Exit;
  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;

  if (dsSource.RecordCount = 0) or (dsChannel.Active and (dsChannel.RecordCount > 0)) then
    Exit;

  if (MessageDlg(Format(rsDeleteWithName, [dsSource['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dsSource.Delete;
end;

procedure TChanSourcesForm.actSrcEditExecute(Sender: TObject);
begin
  if dsSource.FieldByName('CS_ID').IsNull then
    Exit;

  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;
  if EditChanSource(dsSource['CS_ID']) > -1 then
    dsSource.Refresh;
end;

procedure TChanSourcesForm.actSrcNewExecute(Sender: TObject);
begin
  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;
  if EditChanSource(-1) > -1 then
    dsSource.CloseOpen(True);
end;

procedure TChanSourcesForm.actCHdelExecute(Sender: TObject);
begin
  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;
  if (not dsChannel.Active) or (dsChannel.RecordCount = 0) then
    Exit;
  if (MessageDlg(Format(rsDeleteWithName, [dsChannel['Ch_Name']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    dsChannel.Delete;
end;

procedure TChanSourcesForm.actCHeditExecute(Sender: TObject);
begin
  if (not dsChannel.Active) or (dsChannel.RecordCount = 0) then
    Exit;
  if dsSource.FieldByName('CS_ID').IsNull then
    Exit;
  if dsChannel.FieldByName('CH_ID').IsNull then
    Exit;
  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;

  EditChanForSource(dsChannel['CH_ID'], dsSource['CS_ID']);
  dsChannel.Refresh;
end;

procedure TChanSourcesForm.actCHnewExecute(Sender: TObject);
begin
  if dsSource.FieldByName('CS_ID').IsNull then
    Exit;

  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;

  if EditChanForSource(-1, dsSource['CS_ID']) then
  begin
    dsChannel.CloseOpen(True);
    dsSource.Refresh;
  end;
end;

procedure TChanSourcesForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
    if Components[i] is TDBGridEh then
      (Components[i] as TDBGridEh).SaveColumnsLayoutIni(A4MainForm.GetIniFileName,
        Self.Name + '.' + Components[i].Name, True);

  dsChannel.Close;
  dsSource.Close;
  Action := caFree;
  ChanSourcesForm := nil;
end;

procedure TChanSourcesForm.FormShow(Sender: TObject);
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

  actCHnew.Enabled := b;
  actCHedit.Enabled := b;
  actCHdel.Enabled := b;

  actSrcNew.Enabled := b;
  actSrcEdit.Enabled := b;
  actSrcDel.Enabled := b;

  dsSource.Open;
  dsChannel.Open;
end;

procedure TChanSourcesForm.dbgSourceColumns5CellDataLinkClick(Grid: TCustomDBGridEh; Column: TColumnEh);
begin
  if dsSource.FieldByName('URL').IsNull then
    Exit;
  if dsSource.FieldByName('URL').AsString.IsEmpty then
    Exit;
  atrCmdUtils.ShellExecute(Application.MainForm.Handle, '', dsSource.FieldByName('URL').AsString);
end;

procedure TChanSourcesForm.dbgSourceDblClick(Sender: TObject);
begin
  actSrcEdit.Execute;
end;

procedure TChanSourcesForm.dbgViewDblClick(Sender: TObject);
var
  c, s: Integer;
begin
  if (not mtView.Active) or (mtView.RecordCount = 0) then
    Exit;
  if mtView.FieldByName('CS_ID').IsNull then
    Exit;
  if mtView.FieldByName('CH_ID').IsNull then
    Exit;
  if (not(dmMain.AllowedAction(rght_DVB_edit))) then
    Exit;

  c := mtView['CH_ID'];
  s := mtView['CS_ID'];

  EditChanForSource(mtView['CH_ID'], mtView['CS_ID']);
  mtView.Refresh;
  mtView.Locate('CH_ID;CS_ID', VarArrayOf([c, s]), []);
end;

procedure TChanSourcesForm.dbgChannelDblClick(Sender: TObject);
begin
  actCHedit.Execute;
end;

procedure TChanSourcesForm.pmgCopyClick(Sender: TObject);
var
  dbg: TDBGridEh;

begin

  if (ActiveControl is TDBGridEh) then
  begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions) then
      if dbg.CheckCopyAction then
      begin
        // Экспорт информации
        if (dmMain.AllowedAction(rght_Export)) then
          DBGridEh_DoCopyAction(dbg, False);
      end
      else
        StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TChanSourcesForm.pmgSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh) then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions) then
        Selection.SelectAll;
end;

procedure TChanSourcesForm.pgcModeChange(Sender: TObject);
begin
  mtView.Active := (pgcMode.ActivePage = tsView);
end;

procedure TChanSourcesForm.N1Click(Sender: TObject);
begin
  PrintGrid.Preview;
end;

procedure TChanSourcesForm.actSaveExecute(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  Ext: String;

begin
  // Экспорт информации
  if (not dmMain.AllowedAction(rght_Export)) then
    Exit;

  A4MainForm.SaveDialog.FileName := rsTable;
  if (ActiveControl is TDBGridEh) then
    if A4MainForm.SaveDialog.Execute then
    begin
      case A4MainForm.SaveDialog.FilterIndex of
        1:
          begin
            ExpClass := TDBGridEhExportAsUnicodeText;
            Ext := 'txt';
          end;
        2:
          begin
            ExpClass := TDBGridEhExportAsCSV;
            Ext := 'csv';
          end;
        3:
          begin
            ExpClass := TDBGridEhExportAsHTML;
            Ext := 'htm';
          end;
        4:
          begin
            ExpClass := TDBGridEhExportAsRTF;
            Ext := 'rtf';
          end;
        5:
          begin
            ExpClass := TDBGridEhExportAsOLEXLS;
            Ext := 'xls';
          end;
      else
        ExpClass := nil;
        Ext := '';
      end;
      if ExpClass <> nil then
      begin
        if AnsiUpperCase(Copy(A4MainForm.SaveDialog.FileName, Length(A4MainForm.SaveDialog.FileName) - 2, 3)) <>
          AnsiUpperCase(Ext) then
          A4MainForm.SaveDialog.FileName := A4MainForm.SaveDialog.FileName + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass, TDBGridEh(ActiveControl), A4MainForm.SaveDialog.FileName, False);
      end;
    end;
end;

procedure TChanSourcesForm.actPrintExecute(Sender: TObject);
begin
  PrintGrid.Preview;
end;

end.
