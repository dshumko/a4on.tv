unit IPTVSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, StdActns, ActnList, Menus, DB, Grids,
  DBGridEh, FIBDataSet, pFIBDataSet, GridsEh, EhLibFIB, DBGridEhImpExp,
  DBGridEhFindDlgs, ToolCtrlsEh, DBGridEhToolCtrls,
  DBAxisGridsEh, System.Actions, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, PrjConst, FIBDatabase, pFIBDatabase,
  Vcl.Mask, DBCtrlsEh, System.UITypes, EhLibVCL, MemTableDataEh, MemTableEh,
  DataDriverEh, pFIBDataDriverEh, DBGridEhGrouping, DynVarsEh, PrnDbgeh;

type
  TIPTVSettinsForm = class(TForm)
    Actions: TActionList;
    pmPopUp: TPopupMenu;
    pmgCopy: TMenuItem;
    pmgSelectAll: TMenuItem;
    pmgSep1: TMenuItem;
    pmgSaveSelection: TMenuItem;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    actlstSearch: TActionList;
    actFilterSearchText: TAction;
    actSearchNext: TAction;
    actSearchPrev: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    ToolBar1: TToolBar;
    ToolButton7: TToolButton;
    btnGroupNEW: TToolButton;
    ToolButton11: TToolButton;
    btnGroupEdit: TToolButton;
    ToolButton13: TToolButton;
    btnNetworkDel: TToolButton;
    dbgIPTVGroup: TDBGridEh;
    srcIPTVGroup: TDataSource;
    srcChannels: TDataSource;
    dsIPTVGroup: TpFIBDataSet;
    dsChannels: TpFIBDataSet;
    actGroupNEW: TAction;
    actGroupEdit: TAction;
    actGroupDel: TAction;
    spl2: TSplitter;
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
    pnl1: TPanel;
    dbgAtr: TDBGridEh;
    tlbAttributes: TToolBar;
    btnAddAtr: TToolButton;
    btnEditAtr: TToolButton;
    btnDelAtr: TToolButton;
    spl1: TSplitter;
    actAtrAdd: TAction;
    actAtrEdit: TAction;
    actAtrDel: TAction;
    dbgCh: TDBGridEh;
    dsAttributes: TpFIBDataSet;
    srcAttributes: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmgCopyClick(Sender: TObject);
    procedure pmgSelectAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actGroupNEWExecute(Sender: TObject);
    procedure actGroupEditExecute(Sender: TObject);
    procedure dbgIPTVGroupDblClick(Sender: TObject);
    procedure actGroupDelExecute(Sender: TObject);
    procedure pgcModeChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actAtrAddExecute(Sender: TObject);
    procedure actAtrEditExecute(Sender: TObject);
    procedure actAtrDelExecute(Sender: TObject);
    procedure dbgAtrDblClick(Sender: TObject);
    procedure dbgIPTVGroupGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  protected
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IPTVSettinsForm: TIPTVSettinsForm;

implementation

uses DM, MAIN, AtrStrUtils, DVBStreamForma, DVBNetworkForma, IPTVGroupForma, EquipAttributesForma;

{$R *.dfm}

procedure TIPTVSettinsForm.actGroupDelExecute(Sender: TObject);
begin
  if (dsIPTVGroup.RecordCount = 0) or (dsIPTVGroup.FieldByName('IG_ID').IsNull)
  then Exit;
  if (not(dmMain.AllowedAction(rght_IPTV_edit)))
  then Exit;

  if (dsChannels.Active) and (dsChannels.RecordCount > 0)
  then Exit;

  if (MessageDlg(Format(rsDeleteWithName, [dsIPTVGroup['NAME']]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then dsIPTVGroup.Delete;
end;

procedure TIPTVSettinsForm.actGroupEditExecute(Sender: TObject);
begin
  if dsIPTVGroup.FieldByName('IG_ID').IsNull
  then Exit;

  if (not(dmMain.AllowedAction(rght_IPTV_edit)))
  then Exit;
  if IPTVGroupModify(dsIPTVGroup['IG_ID']) > -1
  then begin
    srcIPTVGroup.DataSet.Refresh;
    dsChannels.CloseOpen(true);
  end;
end;

procedure TIPTVSettinsForm.actGroupNEWExecute(Sender: TObject);
var
  i: Integer;
begin
  if (not(dmMain.AllowedAction(rght_IPTV_edit)))
  then Exit;
  i := IPTVGroupModify(-1);
  if i > -1
  then begin
    dsIPTVGroup.CloseOpen(true);
    dsIPTVGroup.Locate('IG_ID', i, []);
    dsChannels.CloseOpen(true);
  end;
end;

procedure TIPTVSettinsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Grid.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, Self.Name+'.'+dbGrid.Name, true);
  dbgIPTVGroup.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'IPTVSettings', true);
  dbgCh.SaveColumnsLayoutIni(A4MainForm.GetIniFileName, 'IPTVChannels', true);
  dsAttributes.Close;
  dsChannels.Close;
  dsIPTVGroup.Close;
  Action := caFree;
  IPTVSettinsForm := nil;
end;

procedure TIPTVSettinsForm.FormShow(Sender: TObject);
var
  b: Boolean;
  f: Boolean;
  i: Integer;
  Font_size : Integer;
  Font_name : string;
begin
  if TryStrToInt(dmMain.GetIniValue('FONT_SIZE'), i)
  then begin
    Font_size := i;
    Font_name := dmMain.GetIniValue('FONT_NAME');
    for i := 0 to ComponentCount - 1 do begin
      if Components[i] is TDBGridEh then begin
        (Components[i] as TDBGridEh).Font.Name := Font_name;
        (Components[i] as TDBGridEh).Font.Size := Font_size;
      end;
    end;
  end;

  b := dmMain.AllowedAction(rght_DVB_edit);
  f := dmMain.AllowedAction(rght_Dictionary_full);

  actGroupNEW.Enabled := b or f;
  actGroupEdit.Enabled := b or f;
  actGroupDel.Enabled := b or f;

  actAtrAdd.Enabled := b or f;
  actAtrEdit.Enabled := b or f;
  actAtrDel.Enabled := b or f;

  dbgIPTVGroup.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'IPTVSettings',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);

  dbgCh.RestoreColumnsLayoutIni(A4MainForm.GetIniFileName, 'IPTVChannels',
    [crpColIndexEh, crpColWidthsEh, crpColVisibleEh, crpSortMarkerEh]);

  dsIPTVGroup.Open;
  dsChannels.Open;
  dsAttributes.Open;
end;

procedure TIPTVSettinsForm.dbgIPTVGroupDblClick(Sender: TObject);
begin
  actGroupEdit.Execute;
end;

procedure TIPTVSettinsForm.pmgCopyClick(Sender: TObject);
var
  dbg: TDBGridEh;
begin

  if (ActiveControl is TDBGridEh)
  then begin
    dbg := (ActiveControl as TDBGridEh);
    if (geaCopyEh in dbg.EditActions)
    then
      if dbg.CheckCopyAction
      then begin
        // Экспорт информации
        if (dmMain.AllowedAction(rght_Export))
        then DBGridEh_DoCopyAction(dbg, False);
      end
      else StrToClipbrd(dbg.SelectedField.AsString);
  end;
end;

procedure TIPTVSettinsForm.pmgSelectAllClick(Sender: TObject);
begin
  if (ActiveControl is TDBGridEh)
  then
    with TDBGridEh(ActiveControl) do
      if CheckSelectAllAction and (geaSelectAllEh in EditActions)
      then Selection.SelectAll;
end;

procedure TIPTVSettinsForm.pgcModeChange(Sender: TObject);
begin
  mtView.Active := (pgcMode.ActivePage = tsView);
end;

procedure TIPTVSettinsForm.N1Click(Sender: TObject);
begin
  PrintGrid.Preview;
end;

procedure TIPTVSettinsForm.actSaveExecute(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  Ext: String;

begin
  // Экспорт информации
  if (not dmMain.AllowedAction(rght_Export))
  then Exit;

  A4MainForm.SaveDialog.FileName := rsTable;
  if (ActiveControl is TDBGridEh)
  then
    if A4MainForm.SaveDialog.Execute
    then begin
      case A4MainForm.SaveDialog.FilterIndex of
        1: begin
            ExpClass := TDBGridEhExportAsUnicodeText;
            Ext := 'txt';
          end;
        2: begin
            ExpClass := TDBGridEhExportAsCSV;
            Ext := 'csv';
          end;
        3: begin
            ExpClass := TDBGridEhExportAsHTML;
            Ext := 'htm';
          end;
        4: begin
            ExpClass := TDBGridEhExportAsRTF;
            Ext := 'rtf';
          end;
        5: begin
            ExpClass := TDBGridEhExportAsOLEXLS;
            Ext := 'xls';
          end;
      else ExpClass := nil;
        Ext := '';
      end;
      if ExpClass <> nil
      then begin
        if AnsiUpperCase(Copy(A4MainForm.SaveDialog.FileName, Length(A4MainForm.SaveDialog.FileName) - 2, 3)) <>
          AnsiUpperCase(Ext)
        then A4MainForm.SaveDialog.FileName := A4MainForm.SaveDialog.FileName + '.' + Ext;
        SaveDBGridEhToExportFile(ExpClass, TDBGridEh(ActiveControl), A4MainForm.SaveDialog.FileName, False);
      end;
    end;
end;

procedure TIPTVSettinsForm.actPrintExecute(Sender: TObject);
begin
  PrintGrid.Preview;
end;

procedure TIPTVSettinsForm.actAtrAddExecute(Sender: TObject);
begin
  if (dsIPTVGroup.RecordCount = 0)
  then Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_IPTV_edit)))
  then Exit;

  if AttributeIPTV(dsIPTVGroup['IG_ID'], -1)
  then begin
    dsAttributes.Close;
    dsAttributes.Open;
  end;
end;

procedure TIPTVSettinsForm.actAtrEditExecute(Sender: TObject);
begin
  if (dsAttributes.RecordCount = 0)
  then Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_IPTV_edit)))
  then Exit;

  if AttributeIPTV(dsIPTVGroup['IG_ID'], dsAttributes['O_ID'])
  then begin
    dsAttributes.Close;
    dsAttributes.Open;
  end;
end;

procedure TIPTVSettinsForm.actAtrDelExecute(Sender: TObject);
var
  s: string;
begin
  if (dsAttributes.RecordCount = 0)
  then Exit;

  if (not(dmMain.AllowedAction(rght_Dictionary_full) or dmMain.AllowedAction(rght_Dictionary_Equipment)))
  then Exit;

  if not(dsAttributes.FieldByName('O_NAME').IsNull)
  then s := dsAttributes['O_NAME']
  else s := '';

  if (MessageDlg(Format(rsDeleteWithName, [s]), mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then dsAttributes.Delete;

end;

procedure TIPTVSettinsForm.dbgAtrDblClick(Sender: TObject);
begin
  actAtrEditExecute(Sender);
end;

procedure TIPTVSettinsForm.dbgIPTVGroupGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
  var Background: TColor; State: TGridDrawState);
begin
  if (dsIPTVGroup.FieldByName('Disabled').IsNull)
  then Exit;

  if (dsIPTVGroup['Disabled'] <> 0)
  then AFont.Color := clGrayText
  else AFont.Color := clWindowText;
end;

end.



